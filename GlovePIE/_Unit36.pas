//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit36;

interface

uses
  SysUtils, Classes, Mask, Grids, ValEdit, AppEvnts, MaskUtils, StdCtrls, ShlObj, GraphUtil, Controls, DwmApi, Contnrs, UxTheme, CommCtrl;

type
  EDBEditError = class(Exception)
  end;
  :2 = (msMasked, msReEnter, msDBSetText);
  TMaskedState = set of :2;
  TCustomMaskEdit = class(TCustomEdit)
  published
    procedure Clear;//004FC5BC
    function GetTextLen:Integer;//004FBCF0
    constructor Create;//004FB9DC
    procedure ValidateEdit;//004FCDDC
  public
    FEditMask:TEditMask;//f2A0
    FMaskBlank:Char;//f2A4
    FMaxChars:Integer;//f2A8
    FMaskSave:Boolean;//f2AC
    FMaskState:TMaskedState;//f2AD
    FCaretPos:Integer;//f2B0
    FBtnDownX:Integer;//f2B4
    FOldValue:string;//f2B8
    FSettingCursor:Boolean;//f2BC
    constructor Create; virtual;//v2C//004FB9DC
    procedure Clear; virtual;//v108//004FC5BC
    //function v110:?; virtual;//v110//004FC5C4
    procedure Reset; virtual;//v114//004FC5C8
    function Validate(const Value:UnicodeString; var Pos:Integer):Boolean; virtual;//v118//004FD558
    procedure ValidateError; virtual;//v11C//004FCE7C
    procedure ValidateEdit; virtual;//v120//004FCDDC
    procedure WMSetFocus(var Message:TWMSetFocus); message WM_SETFOCUS;//004FBC54
    procedure WMLButtonDown(var Message:TWMLButtonDown); message WM_LBUTTONDOWN;//004FBBD8
    procedure WMLButtonUp(var Message:TWMLButtonUp); message WM_LBUTTONUP;//004FBBF4
    procedure WMCut(var Message:TMessage); message WM_CUT;//004FBEE8
    procedure WMPaste(var Message:TMessage); message WM_PASTE;//004FBF60
    procedure CMTextChanged(var Message:TMessage); message CM_TEXTCHANGED;//004FCCE0
    procedure CMEnter(var Message:TCMEnter); message CM_ENTER;//004FCC50
    procedure CMExit(var Message:TCMExit); message CM_EXIT;//004FCDA8
    procedure CMWantSpecialKey(var Message:TCMWantSpecialKey); message CM_WANTSPECIALKEY;//004FCD70
    procedure KeyPress(var Key:Char); dynamic;//004FBB68
    procedure KeyUp(var Key:Word; Shift:TShiftState); dynamic;//004FBB18
    procedure KeyDown(var Key:Word; Shift:TShiftState); dynamic;//004FBA34
    procedure SetEditText(const Value:UnicodeString);//004FBC74
    function GetEditText:UnicodeString;//004FBCDC
    function GetText:TMaskedText;//004FBD50
    procedure SetText(const Value:TMaskedText);//004FBDE4
    function GetMasked:Boolean;//004FC090
    procedure ReformatText(const NewMask:UnicodeString);//004FC0A0
    procedure SetEditMask(const Value:TEditMask);//004FC16C
    function GetMaxLength:Integer;//004FC238
    procedure SetMaxLength(Value:Integer);//004FC240
    procedure GetSel(var SelStart:Integer; var SelStop:Integer);//004FC270
    procedure SetSel(SelStart:Integer; SelStop:Integer);//004FC294
    procedure SetCursor(Pos:Integer);//004FC2B8
    procedure CheckCursor;//004FC57C
    function CharKeys(var CharCode:Char):Boolean;//004FC5F0
    procedure ArrowKeys(CharCode:Word; Shift:TShiftState);//004FC7CC
    procedure CursorInc(CursorPos:Integer; Incr:Integer);//004FC9C0
    procedure CursorDec(CursorPos:Integer);//004FC9F8
    function GetNextEditChar(Offset:Integer):Integer;//004FCA14
    function GetPriorEditChar(Offset:Integer):Integer;//004FCA3C
    procedure HomeEndKeys(CharCode:Word; Shift:TShiftState);//004FCA70
    procedure DeleteKeys(CharCode:Word);//004FCB40
    function AddEditFormat(const Value:UnicodeString; Active:Boolean):UnicodeString;//004FCEB8
    function RemoveEditFormat(const Value:UnicodeString):UnicodeString;//004FCF00
    function InputChar(var NewChar:Char; Offset:Integer):Boolean;//004FD128
    function DoInputChar(var NewChar:Char; MaskOffset:Integer):Boolean;//004FD26C
    function DeleteSelection(var Value:UnicodeString; Offset:Integer; Len:Integer):Boolean;//004FD614
    function InputString(var Value:UnicodeString; const NewValue:UnicodeString; Offset:Integer):Integer;//004FD6B4
    function FindLiteralChar(MaskOffset:Integer; InChar:Char):Integer;//004FD9BC
  end;
  EInvalidGridOperation = class(Exception)
  end;
  TGridState = (gsNormal, gsSelecting, gsRowSizing, gsColSizing, gsRowMoving, gsColMoving);
  TInplaceEdit = class(TCustomMaskEdit)
  published
    procedure Hide;//005005DC
    procedure Invalidate;//00500558
    procedure Deselect;//00500538
    constructor Create;//004FFE68
    procedure Move(Loc:TRect);//005007A8
    function PosEqual(Rect:TRect):Boolean;//00500644
    procedure SetFocus;//005007B0
    procedure UpdateLoc(Loc:TRect);//00500788
    function Visible:Boolean;//00500790
  public
    FGrid:TCustomGrid;//f2C0
    FClickTime:Integer;//f2C4
    constructor Create; virtual;//v2C//004FFE68
    procedure WndProc(var Message:TMessage); virtual;//v84//005004BC
    procedure CreateParams(var Params:TCreateParams); virtual;//vAC//004FFECC
    function EditCanModify:Boolean; virtual;//v110//004FFFBC
    procedure BoundsChanged; virtual;//v124//00500734
    procedure UpdateContents; virtual;//v128//005007D4
    procedure WMGetDlgCode(var Message:TWMGetDlgCode); message WM_GETDLGCODE;//004FFEE8
    procedure WMCut(var Message:TMessage); message WM_CUT;//004FFF50
    procedure WMPaste(var Message:TMessage); message WM_PASTE;//004FFF10
    procedure WMClear(var Message:TMessage); message WM_CLEAR;//004FFF30
    procedure CMShowingChanged(var Message:TMessage); message CM_SHOWINGCHANGED;//004FFEE4
    procedure KeyPress(var Key:Char); dynamic;//005003B4
    procedure KeyUp(var Key:Word; Shift:TShiftState); dynamic;//005004A0
    procedure KeyDown(var Key:Word; Shift:TShiftState); dynamic;//0050017C
    procedure DoMouseWheel(Shift:TShiftState; WheelDelta:Integer; MousePos:TPoint); dynamic;//004FFF84
    procedure DblClick; dynamic;//004FFF70
    procedure SetGrid(Value:TCustomGrid);//004FFEDC
    procedure InternalMove(const Loc:TRect; Redraw:Boolean);//00500684
  end;
  TGridOption = (goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goRowSizing, goColSizing, goRowMoving, goColMoving, goEditing, goTabs, goRowSelect, goAlwaysShowEditor, goThumbTracking, goFixedColClick, goFixedRowClick, goFixedHotTrack);
  TGridOptions = set of TGridOption;
  :3 = (gdSelected, gdFocused, gdFixed, gdRowSelected, gdHotTrack, gdPressed);
  TGridDrawState = set of :3;
  TGridCoord = TGridCoord = record//size=8
X:Integer;//f0
Y:Integer;//f4
end;;
  THotTrackCellInfo = THotTrackCellInfo = record//size=C
Coord:TGridCoord;//f0
Pressed:Boolean;//f8
Button:TMouseButton;//f9
end;;
  TGridRect = TGridRect = record//size=10
Left:Integer;//f0
Top:Integer;//f4
Right:Integer;//f8
Bottom:Integer;//fC
TopLeft:TGridCoord;//f0
BottomRight:TGridCoord;//f8
end;;
  TEditStyle = (esSimple, esEllipsis, esPickList);
  TSelectCellEvent = procedure(Sender:TObject; ACol:Integer; ARow:Integer; var CanSelect:Boolean) of object;;
  TDrawCellEvent = procedure(Sender:TObject; ACol:Integer; ARow:Integer; Rect:TRect; State:TGridDrawState) of object;;
  TFixedCellClickEvent = procedure(Sender:TObject; ACol:Integer; ARow:Integer) of object;;
  TGridDrawingStyle = (gdsClassic, gdsThemed, gdsGradient);
  TCustomGrid = class(TCustomControl)
  published
    constructor Create;//00500890
    destructor Destroy();//00500A38
    function MouseCoord(X:Integer; Y:Integer):TGridCoord;//005012F0
  public
    FAnchor:TGridCoord;//f278
    FBorderStyle:TBorderStyle;//f280
    FCanEditModify:Boolean;//f281
    FColCount:Integer;//f284
    FCurrent:TGridCoord;//f288
    FCurrent:Integer;//f28C
    FDefaultColWidth:Integer;//f290
    FDefaultRowHeight:Integer;//f294
    FDrawingStyle:TGridDrawingStyle;//f298
    FFixedCols:Integer;//f29C
    FFixedRows:Integer;//f2A0
    FFixedColor:TColor;//f2A4
    FGradientEndColor:TColor;//f2A8
    FGradientStartColor:TColor;//f2AC
    FGridLineWidth:Integer;//f2B0
    FOptions:TGridOptions;//f2B4
    FPanPoint:TPoint;//f2B8
    FRowCount:Integer;//f2C0
    FScrollBars:TScrollStyle;//f2C4
    FTopLeft:TGridCoord;//f2C8
    FTopLeft:Integer;//f2CC
    FSizingIndex:Integer;//f2D0
    FSizingPos:Integer;//f2D4
    FSizingOfs:Integer;//f2D8
    FMoveIndex:Integer;//f2DC
    FMovePos:Integer;//f2E0
    FHitTest:TPoint;//f2E4
    FInplaceEdit:TInplaceEdit;//f2EC
    FInplaceCol:Integer;//f2F0
    FInplaceRow:Integer;//f2F4
    FColOffset:Integer;//f2F8
    FDefaultDrawing:Boolean;//f2FC
    FEditorMode:Boolean;//f2FD
    FColWidths:Pointer;//f300
    FRowHeights:Pointer;//f304
    FTabStops:Pointer;//f308
    FOnFixedCellClick:TFixedCellClickEvent;//f310
    FGridState:TGridState;//f318
    FSaveCellExtents:Boolean;//f319
    DesignOptionsBoost:TGridOptions;//f31A
    VirtualView:Boolean;//f31E
    FInternalColor:TColor;//f320
    FInternalDrawingStyle:TGridDrawingStyle;//f324
    FHotTrackCell:THotTrackCellInfo;//f328
    destructor Destroy(); virtual;//00500A38
    procedure DefineProperties(Filer:TFiler); virtual;//v4//005010D0
    constructor Create; virtual;//v2C//00500890
    procedure DoGesture(const EventInfo:TGestureEventInfo; var Handled:Boolean); virtual;//v44//005048D4
    procedure CreateParams(var Params:TCreateParams); virtual;//vAC//00504820
    procedure CreateWnd; virtual;//vB4//005048A0
    procedure Paint; virtual;//vEC//00501AA4
    procedure CalcSizingState(X:Integer; Y:Integer; var State:TGridState; var Index:LongInt; var SizingPos:Integer; var SizingOfs:Integer; var FixedInfo:TGridDrawInfo); virtual;//vF0//00502634
    function CreateEditor:TInplaceEdit; virtual;//vF4//00504810
    function CanEditShow:Boolean; virtual;//vF8//00500D98
    procedure DrawCell; virtual; abstract;//vFC//00404A58
    procedure DrawCellBackground(const ARect:TRect; AColor:TColor; AState:TGridDrawState; ACol:Integer; ARow:Integer); virtual;//v100//00502FC4
    procedure DrawCellHighlight(const ARect:TRect; AState:TGridDrawState; ACol:Integer; ARow:Integer); virtual;//v104//00502D84
    //function v108:?; virtual;//v108//00501344
    procedure DeleteColumn(ACol:LongInt); virtual;//v10C//00506B70
    procedure DeleteRow(ARow:LongInt); virtual;//v110//00506B94
    procedure WMSize(var Msg:TWMSize); message WM_SIZE;//005066A8
    procedure WMSetFocus(var Msg:TWMSetFocus); message WM_SETFOCUS;//0050664C
    procedure WMKillFocus(var Msg:TWMKillFocus); message WM_KILLFOCUS;//005064D4
    procedure WMEraseBkgnd(var Message:TWMEraseBkgnd); message WM_ERASEBKGND;//00506704
    procedure WMCancelMode(var Msg:TWMCancelMode); message WM_CANCELMODE;//0050682C
    procedure WMSetCursor(var Msg:TWMSetCursor); message WM_SETCURSOR;//005065A0
    procedure WMNCHitTest(var Msg:TWMNCHitTest); message WM_NCHITTEST;//0050654C
    procedure WMGetDlgCode(var Msg:TWMGetDlgCode); message WM_GETDLGCODE;//005064A4
    procedure WMChar(var Msg:TWMChar); message WM_CHAR;//005063FC
    procedure WMCommand(var Message:TWMCommand); message WM_COMMAND;//00506470
    procedure WMTimer(var Msg:TWMTimer); message WM_TIMER;//005069EC
    procedure WMHScroll(var Msg:TWMHScroll); message WM_HSCROLL;//005066F0
    procedure WMVScroll(var Msg:TWMVScroll); message WM_VSCROLL;//005066D8
    procedure WMLButtonDown(var Message:TWMLButtonDown); message WM_LBUTTONDOWN;//00506524
    procedure CMCancelMode(var Msg:TCMCancelMode); message CM_CANCELMODE;//00506840
    procedure CMFontChanged(var Message:TMessage); message CM_FONTCHANGED;//00506870
    procedure CMCtl3DChanged(var Message:TMessage); message CM_CTL3DCHANGED;//005068D8
    procedure CMMouseLeave(var Message:TMessage); message CM_MOUSELEAVE;//00506894
    procedure CMShowingChanged(var Message:TMessage); message CM_SHOWINGCHANGED;//00506CD4
    procedure CMDesignHitTest(var Msg:TCMDesignHitTest); message CM_DESIGNHITTEST;//005068EC
    procedure CMWantSpecialKey(var Msg:TCMWantSpecialKey); message CM_WANTSPECIALKEY;//0050690C
    procedure EndRowDrag(var Origin:Integer; var Destination:Integer; const MousePt:TPoint); dynamic;//00506CC8
    procedure EndColumnDrag(var Origin:Integer; var Destination:Integer; const MousePt:TPoint); dynamic;//00506CBC
    procedure BeginRowDrag(var Origin:Integer; var Destination:Integer; const MousePt:TPoint); dynamic;//00506C98
    procedure BeginColumnDrag(var Origin:Integer; var Destination:Integer; const MousePt:TPoint); dynamic;//00506C8C
    procedure CheckRowDrag(var Origin:Integer; var Destination:Integer; const MousePt:TPoint); dynamic;//00506CB0
    procedure CheckColumnDrag(var Origin:Integer; var Destination:Integer; const MousePt:TPoint); dynamic;//00506CA4
    procedure RowHeightsChanged; dynamic;//00506B5C
    procedure ColWidthsChanged; dynamic;//00506B48
    procedure TimedScroll(Direction:TGridScrollDirection); dynamic;//00506938
    procedure TopLeftChanged; dynamic;//005013A8
    procedure sub_00501348; dynamic;//00501348
    procedure sub_005012EC; dynamic;//005012EC
    procedure sub_00501264; dynamic;//00501264
    procedure sub_00500EC4; dynamic;//00500EC4
    procedure GetEditMask(ACol:LongInt; ARow:LongInt); dynamic;//00500E98
    procedure GetEditLimit; dynamic;//00500EC0
    procedure sub_00500EB8; dynamic;//00500EB8
    procedure GetEditText(ACol:LongInt; ARow:LongInt); dynamic;//00500EA8
    procedure FixedCellClick(ACol:LongInt; ARow:LongInt); dynamic;//00503338
    procedure CanEditModify; dynamic;//00500D90
    procedure sub_00500D8C; dynamic;//00500D8C
    procedure sub_00500D88; dynamic;//00500D88
    procedure AdjustSize(Index:LongInt; Amount:LongInt; Rows:Boolean); dynamic;//00500BB4
    procedure KeyPress(var Key:Char); dynamic;//00504F74
    procedure KeyDown(var Key:Word; Shift:TShiftState); dynamic;//00504AF8
    procedure DoExit; dynamic;//00500D48
    procedure MouseUp(Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer); dynamic;//00505678
    procedure MouseMove(Shift:TShiftState; X:Integer; Y:Integer); dynamic;//005053D0
    procedure MouseDown(Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer); dynamic;//00504FB4
    procedure IsTouchPropertyStored(AProperty:TTouchProperty); dynamic;//005036A8
    procedure DoMouseWheelUp(Shift:TShiftState; MousePos:TPoint); dynamic;//00506C44
    procedure DoMouseWheelDown(Shift:TShiftState; MousePos:TPoint); dynamic;//00506BF8
    function BoxRect(ALeft:LongInt; ATop:LongInt; ARight:LongInt; ABottom:LongInt):TRect;//00500D14
    function CellRect(ACol:LongInt; ARow:LongInt):TRect;//00500D64
    function IsActiveControl:Boolean;//00500DF0
    function IsGradientEndColorStored(Value:TColor):Boolean;//00500E78
    procedure HideEditor;//00500EC8
    procedure ShowEditor;//00500ED8
    procedure ShowEditorChar(Ch:Char);//00500EE8
    procedure InvalidateEditor;//00500F1C
    procedure ReadColWidths(Reader:TReader);//00500F38
    procedure ReadRowHeights(Reader:TReader);//00500F7C
    procedure WriteColWidths(Writer:TWriter);//00500FC0
    procedure WriteRowHeights(Writer:TWriter);//00501004
    procedure MoveColumn(FromIndex:LongInt; ToIndex:LongInt);//00501190
    procedure MoveRow(FromIndex:LongInt; ToIndex:LongInt);//00501268
    function Sizing(X:Integer; Y:Integer):Boolean;//0050134C
    function CalcCoordFromPoint(X:Integer; Y:Integer; const DrawInfo:TGridDrawInfo):TGridCoord;//005021C4
    procedure CalcDrawInfo(var DrawInfo:TGridDrawInfo);//00502220
    procedure CalcDrawInfoXY(var DrawInfo:TGridDrawInfo; UseWidth:Integer; UseHeight:Integer);//005022A4
    procedure CalcFixedInfo(var DrawInfo:TGridDrawInfo);//0050235C
    function CalcMaxTopLeft(const Coord:TGridCoord; const DrawInfo:TGridDrawInfo):TGridCoord;//00502454
    procedure ChangeGridOrientation(RightToLeftOrientation:Boolean);//00502704
    procedure ChangeSize(NewColCount:LongInt; NewRowCount:LongInt);//00502AA4
    procedure ClampInView(const Coord:TGridCoord);//00502B7C
    procedure DrawSizingLine(const DrawInfo:TGridDrawInfo);//00502C44
    procedure DrawMove;//005031A8
    procedure FocusCell(ACol:LongInt; ARow:LongInt; MoveAnchor:Boolean);//00503358
    procedure GridRectToScreenRect(GridRect:TGridRect; var ScreenRect:TRect; IncludeLine:Boolean);//005034CC
    procedure Initialize;//005035D0
    procedure InvalidateCell(ACol:LongInt; ARow:LongInt);//00503630
    procedure InvalidateGrid;//00503654
    procedure InvalidateRect(ARect:TGridRect);//00503660
    procedure ModifyScrollBar(ScrollBar:Cardinal; ScrollCode:Cardinal; Pos:Cardinal; UseRightToLeft:Boolean);//00503AD4
    procedure MoveAdjust(var CellPos:LongInt; FromIndex:LongInt; ToIndex:LongInt);//00503CBC
    procedure MoveAnchor(const NewAnchor:TGridCoord);//00503CF0
    procedure MoveCurrent(ACol:LongInt; ARow:LongInt; MoveAnchor:Boolean; Show:Boolean);//00503D74
    procedure MoveTopLeft(ALeft:LongInt; ATop:LongInt);//00503ECC
    procedure ResizeCol(Index:LongInt; OldSize:Integer; NewSize:Integer);//00503F20
    procedure ResizeRow(Index:LongInt; OldSize:Integer; NewSize:Integer);//00503F30
    procedure SelectionMoved(const OldSel:TGridRect);//00503F40
    procedure ScrollDataInfo(DX:Integer; DY:Integer; var DrawInfo:TGridDrawInfo);//00503FB8
    procedure ScrollData(DX:Integer; DY:Integer);//00504164
    procedure TopLeftMoved(const OldTopLeft:TGridCoord);//00504214
    procedure UpdateScrollPos;//00504314
    procedure UpdateScrollRange;//005046C4
    procedure MoveAndScroll(Mouse:Integer; CellHit:Integer; var DrawInfo:TGridDrawInfo; var Axis:TGridAxisDrawInfo; Scrollbar:Integer; const MousePt:TPoint);//0050599C
    function GetColWidths(Index:LongInt):Integer;//00505B14
    function GetRowHeights(Index:LongInt):Integer;//00505B34
    function GetGridWidth:Integer;//00505B54
    function GetGridHeight:Integer;//00505B68
    function GetSelection:TGridRect;//00505B7C
    function GetTabStops(Index:LongInt):Boolean;//00505B98
    function GetVisibleColCount:Integer;//00505BAC
    function GetVisibleRowCount:Integer;//00505BCC
    procedure SetBorderStyle(Value:TBorderStyle);//00505BEC
    procedure SetCol(Value:LongInt);//00505C00
    procedure SetColCount(Value:LongInt);//00505C18
    procedure SetColWidths(Index:LongInt; Value:Integer);//00505C74
    procedure SetDefaultColWidth(Value:Integer);//00505D20
    procedure SetDefaultRowHeight(Value:Integer);//00505D5C
    procedure SetDrawingStyle(const Value:TGridDrawingStyle);//00505D98
    procedure SetFixedColor(Value:TColor);//00505DD8
    procedure SetFixedCols(Value:Integer);//00505DF8
    procedure SetFixedRows(Value:Integer);//00505E90
    procedure SetEditorMode(Value:Boolean);//00505F28
    procedure SetGradientEndColor(Value:TColor);//00505F50
    procedure SetGradientStartColor(Value:TColor);//00505F78
    procedure SetGridLineWidth(Value:Integer);//00505FA0
    procedure SetLeftCol(Value:LongInt);//00505FC0
    procedure SetOptions(Value:TGridOptions);//00505FD4
    procedure SetRow(Value:LongInt);//00506048
    procedure SetRowCount(Value:LongInt);//00506060
    procedure SetRowHeights(Index:LongInt; Value:Integer);//0050609C
    procedure SetScrollBars(Value:TScrollStyle);//00506148
    procedure SetSelection(Value:TGridRect);//0050615C
    procedure SetTopRow(Value:LongInt);//005061B4
    procedure HideEdit;//005061CC
    procedure UpdateEdit;//005062A8
    procedure UpdateText;//00506388
    procedure CancelMode;//00506794
    procedure UpdateDesigner;//00506BB8
  end;
  TGetEditEvent = procedure(Sender:TObject; ACol:Integer; ARow:Integer; var Value:string) of object;;
  TSetEditEvent = procedure(Sender:TObject; ACol:Integer; ARow:Integer; const Value:string) of object;;
  TMovedEvent = procedure(Sender:TObject; FromIndex:Integer; ToIndex:Integer) of object;;
  TCustomDrawGrid = class(TCustomGrid)
  published
    procedure MouseToCell(X:Integer; Y:Integer; var ARow:Integer; var ACol:Integer);//00506D14
    function CellRect(ACol:Integer; ARow:Integer):TRect;//00506CF0
  public
    FOnColumnMoved:TMovedEvent;//f338
    FOnDrawCell:TDrawCellEvent;//f340
    FOnGetEditMask:TGetEditEvent;//f348
    FOnGetEditText:TGetEditEvent;//f350
    FOnRowMoved:TMovedEvent;//f358
    FOnSelectCell:TSelectCellEvent;//f360
    FOnSetEditText:TSetEditEvent;//f368
    FOnTopLeftChanged:TNotifyEvent;//f370
    procedure DrawCell(ACol:LongInt; ARow:LongInt; ARect:TRect; AState:TGridDrawState); virtual;//vFC//00506E68
    function SelectCell(ACol:LongInt; ARow:LongInt):Boolean; virtual;//v108//00506E0C
    procedure TopLeftChanged; dynamic;//00506F08
    procedure RowMoved(FromIndex:LongInt; ToIndex:LongInt); dynamic;//00506DEC
    procedure ColumnMoved(FromIndex:LongInt; ToIndex:LongInt); dynamic;//00506D4C
    procedure GetEditMask(ACol:LongInt; ARow:LongInt); dynamic;//00506D6C
    procedure SetEditText(ACol:LongInt; ARow:LongInt; const Value:UnicodeString); dynamic;//00506E3C
    procedure GetEditText(ACol:LongInt; ARow:LongInt); dynamic;//00506DAC
  end;
  TOnGetPickListItems = procedure(ACol:Integer; ARow:Integer; Items:TStrings) of object;;
  TInplaceEditList = class(TInplaceEdit)
  published
    procedure RestoreContents;//00507EE4
    constructor Create;//005072F0
  public
    FButtonWidth:Integer;//f2C8
    FPickList:TCustomListBox;//f2CC
    FActiveList:TWinControl;//f2D0
    FEditStyle:TEditStyle;//f2D4
    FDropDownRows:Integer;//f2D8
    FListVisible:Boolean;//f2DC
    FTracking:Boolean;//f2DD
    FPressed:Boolean;//f2DE
    FPickListLoaded:Boolean;//f2DF
    FOnGetPickListitems:TOnGetPickListItems;//f2E0
    FOnEditButtonClick:TNotifyEvent;//f2E8
    FMouseInControl:Boolean;//f2F0
    constructor Create; virtual;//v2C//005072F0
    procedure WndProc(var Message:TMessage); virtual;//v84//0050810C
    procedure PaintWindow(DC:HDC); virtual;//vD4//00507BDC
    procedure BoundsChanged; virtual;//v124//0050733C
    procedure UpdateContents; virtual;//v128//00507E8C
    procedure DoDropDownKeys(var Key:Word; Shift:TShiftState); virtual;//v12C//0050758C
    procedure DoEditButtonClick; virtual;//v130//00507604
    procedure WMKillFocus(var Message:TWMKillFocus); message WM_KILLFOCUS;//00507F40
    procedure WMPaint(var Message:TWMPaint); message WM_PAINT;//005080A0
    procedure WMCancelMode(var Message:TWMCancelMode); message WM_CANCELMODE;//00507F24
    procedure WMSetCursor(var Message:TWMSetCursor); message WM_SETCURSOR;//005080A8
    procedure WMLButtonDblClk(var Message:TWMLButtonDblClk); message WM_LBUTTONDBLCLK;//00508064
    procedure CMCancelMode(var Message:TCMCancelMode); message CM_CANCELMODE;//00507F00
    procedure CMMouseEnter(var Message:TMessage); message CM_MOUSEENTER;//005082F0
    procedure CMMouseLeave(var Message:TMessage); message CM_MOUSELEAVE;//00508324
    procedure DropDown; dynamic;//005076F0
    procedure DoGetPickListItems; dynamic;//00507628
    procedure CloseUp(Accept:Boolean); dynamic;//005073E0
    procedure KeyDown(var Key:Word; Shift:TShiftState); dynamic;//00507970
    procedure MouseUp(Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer); dynamic;//00507B84
    procedure MouseMove(Shift:TShiftState; X:Integer; Y:Integer); dynamic;//00507AB4
    procedure MouseDown(Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer); dynamic;//00507A14
    procedure DblClick; dynamic;//00508194
    function GetPickList:TCustomListBox;//0050768C
    procedure ListMouseUp(Sender:TObject; Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer);//005079CC
    procedure StopTracking;//00507E0C
    procedure TrackButton(X:Integer; Y:Integer);//00507E38
    function ButtonRect:TRect;//00507FF0
    function OverButton(const P:TPoint):Boolean;//00508040
  end;
  TPopupListbox = class(TCustomListBox)
  public
    FSearchText:string;//f2F0
    FSearchTickCount:Integer;//f2F4
    procedure CreateParams(var Params:TCreateParams); virtual;//vAC//00507148
    procedure CreateWnd; virtual;//vB4//0050717C
    procedure KeyPress(var Key:Char); dynamic;//005071B4
    procedure MouseUp(Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer); dynamic;//0050729C
  end;
  TDisplayOption = (doColumnTitles, doAutoColResize, doKeyColFixed);
  TDisplayOptions = set of TDisplayOption;
  TKeyOption = (keyEdit, keyAdd, keyDelete, keyUnique);
  TKeyOptions = set of TKeyOption;
  TGetPickListEvent = procedure(Sender:TObject; const KeyName:string; Values:TStrings) of object;;
  TOnValidateEvent = procedure(Sender:TObject; ACol:Integer; ARow:Integer; const KeyName:string; const KeyValue:string) of object;;
  TValueListEditor = class(TCustomDrawGrid)
  published
    function FindRow(KeyName:string; var Row:Integer):Boolean;//0050A3EC
    function InsertRow(KeyName:string; Value:string; Append:Boolean):Integer;//0050B1B0
    procedure Refresh;//0050AB90
    constructor Create;//0050A0F8
    destructor Destroy();//0050A264
    procedure DeleteRow(ARow:Integer);//0050B2F4
    function RestoreCurrentRow:Boolean;//0050B468
  public
    FTitleCaptions:TStrings;//f378
    FStrings:TValueListStrings;//f37C
    FKeyOptions:TKeyOptions;//f380
    FDisplayOptions:TDisplayOptions;//f381
    FDropDownRows:Integer;//f384
    FDupKeySave:string;//f388
    FDeleting:Boolean;//f38C
    FAdjustingColWidths:Boolean;//f38D
    FEditUpdate:Integer;//f390
    FCountSave:Integer;//f394
    FEditList:TInplaceEditList;//f398
    FOnGetPickList:TGetPickListEvent;//f3A0
    FOnEditButtonClick:TNotifyEvent;//f3A8
    FOnValidate:TOnValidateEvent;//f3B0
    destructor Destroy(); virtual;//0050A264
    constructor Create; virtual;//v2C//0050A0F8
    procedure CreateWnd; virtual;//vB4//0050B894
    function CreateEditor:TInplaceEdit; virtual;//vF4//0050A2A0
    procedure DrawCell(ACol:LongInt; ARow:LongInt; ARect:TRect; AState:TGridDrawState); virtual;//vFC//0050A89C
    function SelectCell(ACol:LongInt; ARow:LongInt):Boolean; virtual;//v108//0050B588
    procedure DeleteRow(ARow:Integer); virtual;//v110//0050B2F4
    procedure AdjustColWidths; virtual;//v114//0050A9AC
    procedure AdjustRowCount; virtual;//v118//0050AAE8
    procedure DoOnValidate; virtual;//v11C//0050B4D4
    function GetCell(ACol:Integer; ARow:Integer):UnicodeString; virtual;//v120//0050A42C
    procedure SetCell(ACol:Integer; ARow:Integer; const Value:UnicodeString); virtual;//v124//0050A4F8
    procedure SetStrings(const Value:TStrings); virtual;//v128//0050A6E0
    procedure CMShowingChanged(var Message:TMessage); message CM_SHOWINGCHANGED;//0050B918
    procedure sub_0050ABBC; dynamic;//0050ABBC
    procedure ColWidthsChanged; dynamic;//0050AB78
    procedure RowMoved(FromIndex:LongInt; ToIndex:LongInt); dynamic;//0050B4A8
    procedure GetEditStyle(ACol:LongInt; ARow:LongInt); dynamic;//0050ADC4
    procedure GetEditMask(ACol:LongInt; ARow:LongInt); dynamic;//0050AD14
    procedure GetEditLimit; dynamic;//0050AC9C
    procedure SetEditText(ACol:Integer; ARow:Integer; const Value:UnicodeString); dynamic;//0050AEB8
    procedure GetEditText(ACol:Integer; ARow:Integer); dynamic;//0050AE6C
    procedure CanEditModify; dynamic;//0050ABC4
    procedure KeyDown(var Key:Word; Shift:TShiftState); dynamic;//0050B6DC
    procedure DoExit; dynamic;//0050B8B8
    procedure Resize; dynamic;//0050AB60
    procedure MouseDown(Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer); dynamic;//0050B938
    function IsEmptyRow:Boolean;//0050A348
    function GetRowCount:Integer;//0050A424
    procedure SetDropDownRows(const Value:Integer);//0050A5DC
    function GetKey(Index:Integer):UnicodeString;//0050A5F4
    procedure SetTitleCaptions(const Value:TStrings);//0050A610
    function TitleCaptionsStored(Value:TStrings):Boolean;//0050A628
    function GetStrings:TStrings;//0050A6D8
    procedure SetDisplayOptions(const Value:TDisplayOptions);//0050A734
    procedure SetKeyOptions(Value:TKeyOptions);//0050A78C
    function GetOnStringsChange:TNotifyEvent;//0050A800
    function GetOnStringsChanging:TNotifyEvent;//0050A814
    procedure SetOnStringsChange(Value:TNotifyEvent);//0050A828
    procedure SetOnStringsChanging(Value:TNotifyEvent);//0050A844
    procedure SetOnEditButtonClick(Value:TNotifyEvent);//0050A860
    procedure DisableEditUpdate;//0050AC44
    procedure EnableEditUpdate;//0050AC6C
    procedure EditListGetItems(ACol:Integer; ARow:Integer; Items:TStrings);//0050B00C
    function GetPickList(Values:TStrings; ClearFirst:Boolean):Boolean;//0050B0B0
    function GetOptions:TGridOptions;//0050B85C
    procedure SetOptions(const Value:TGridOptions);//0050B868
  end;
  TItemProps = array of TItemProp;
//elSize = 4;
  TValueListStrings = class(TStringList)
  published
    procedure CustomSort(Compare:TStringListSortCompare);//0050BBD8
    procedure Clear;//0050BBC4
    procedure Exchange(Index1:Integer; Index2:Integer);//0050BDA4
    procedure Delete(Index:Integer);//0050BD28
    destructor Destroy();//0050B9E8
    constructor Create;//0050B9B0
    function KeyIsValid(Key:string; RaiseError:Boolean):Boolean;//0050BB24
    procedure Assign(Source:TPersistent);//0050BA14
  public
    FItemProps:TItemProps;//f58
    FEditor:TValueListEditor;//f5C
    destructor Destroy(); virtual;//0050B9E8
    procedure Assign(Source:TPersistent); virtual;//v8//0050BA14
    procedure Put(Index:Integer; const S:UnicodeString); virtual;//v20//0050BFA4
    procedure Clear; virtual;//v44//0050BBC4
    procedure Delete(Index:Integer); virtual;//v48//0050BD28
    procedure Exchange(Index1:Integer; Index2:Integer); virtual;//v4C//0050BDA4
    procedure Changed; virtual;//v90//0050BB04
    procedure Changing; virtual;//v94//0050BAD4
    procedure InsertItem(Index:Integer; const S:UnicodeString; AObject:TObject); virtual;//v98//0050BED0
    procedure CustomSort(Compare:TStringListSortCompare); virtual;//vA4//0050BBD8
    function FindItemProp(const KeyOrIndex:Variant; Create:Boolean):TItemProp;//0050BDE8
    procedure PutItemProp(const KeyOrIndex:Variant; const Value:TItemProp);//0050C014
    procedure FreeItemProps;//0050C034
  end;
  TItemProp = class(TPersistent)
  published
    function HasPickList:Boolean;//0050C1B8
    destructor Destroy();//0050C0B4
    constructor Create;//0050C078
  public
    FEditor:TValueListEditor;//f4
    FEditMask:string;//f8
    FEditStyle:TEditStyle;//fC
    FPickList:TStrings;//f10
    FMaxLength:Integer;//f14
    FReadOnly:Boolean;//f18
    FKeyDesc:string;//f1C
    destructor Destroy(); virtual;//0050C0B4
    procedure AssignTo(Dest:TPersistent); virtual;//v0//0050C0F0
    procedure SetEditMask(const Value:UnicodeString);//0050C170
    procedure SetEditStyle(const Value:TEditStyle);//0050C18C
    procedure SetKeyDesc(const Value:UnicodeString);//0050C198
    procedure SetMaxLength(const Value:Integer);//0050C1AC
    function GetPickList:TStrings;//0050C1D8
    procedure SetPickList(const Value:TStrings);//0050C204
    procedure SetReadOnly(const Value:Boolean);//0050C224
    procedure UpdateEdit;//0050C230
    procedure PickListChange(Sender:TObject);//0050C254
  end;
  TValueListTitles = class(TStringList)
  published
    constructor Create;//0050C2B4
  public
    FEditor:TValueListEditor;//f58
    procedure Changed; virtual;//v90//0050C29C
  end;
  TCustomApplicationEvents = class(TComponent)
  published
    procedure CancelDispatch;//0050CC74
    procedure Activate;//0050CC5C
    constructor Create;//0050CC88
  public
    FOnActionExecute:TActionEvent;//f38
    FOnActionUpdate:TActionEvent;//f40
    FOnException:TExceptionEvent;//f48
    FOnMessage:TMessageEvent;//f50
    FOnHelp:THelpEvent;//f58
    FOnHint:TNotifyEvent;//f60
    FOnIdle:TIdleEvent;//f68
    FOnDeactivate:TNotifyEvent;//f70
    FOnActivate:TNotifyEvent;//f78
    FOnMinimize:TNotifyEvent;//f80
    FOnRestore:TNotifyEvent;//f88
    FOnShortCut:TShortCutEvent;//f90
    FOnShowHint:TShowHintEvent;//f98
    FOnSettingChange:TSettingChangeEvent;//fA0
    FOnModalBegin:TNotifyEvent;//fA8
    FOnModalEnd:TNotifyEvent;//fB0
    constructor Create; virtual;//v2C//0050CC88
    procedure DoActionExecute(Action:TBasicAction; var Handled:Boolean);//0050CCD4
    procedure DoActionUpdate(Action:TBasicAction; var Handled:Boolean);//0050CCE8
    procedure DoActivate(Sender:TObject);//0050CCFC
    procedure DoDeactivate(Sender:TObject);//0050CD10
    procedure DoException(Sender:TObject; E:Exception);//0050CD24
    function DoHelp(Command:Word; Data:TCustomLongData; var CallHelp:Boolean):Boolean;//0050CD54
    procedure DoHint(Sender:TObject);//0050CD74
    procedure DoIdle(Sender:TObject; var Done:Boolean);//0050CDEC
    procedure DoMessage(var Msg:TMsg; var Handled:Boolean);//0050CE00
    procedure DoMinimize(Sender:TObject);//0050CE14
    procedure DoRestore(Sender:TObject);//0050CE30
    procedure DoShortcut(var Msg:TWMKey; var Handled:Boolean);//0050CE4C
    procedure DoShowHint(var HintStr:UnicodeString; var CanShow:Boolean; var HintInfo:THintInfo);//0050CE68
    procedure DoSettingChange(Sender:TObject; Flag:Integer; const Section:UnicodeString; var Result:LongInt);//0050CE90
    procedure DoModalBegin(Sender:TObject);//0050CEBC
    procedure DoModalEnd(Sender:TObject);//0050CED8
  end;
  TApplicationEvents = class(TCustomApplicationEvents)
  end;
  TMultiCaster = class(TComponent)
  published
    procedure AddAppEvent(AppEvent:TCustomApplicationEvents);//0050CF3C
    procedure CancelDispatch;//0050CF64
    function CheckDispatching(AppEvents:TCustomApplicationEvents):Boolean;//0050CF6C
    constructor Create;//0050CF80
    destructor Destroy();//0050D0F8
    procedure Activate(AppEvent:TCustomApplicationEvents);//0050CEF4
  public
    FAppEvents:TComponentList;//f34
    FCacheAppEvent:TCustomApplicationEvents;//f38
    FCancelDispatching:Boolean;//f3C
    FDispatching:Integer;//f40
    destructor Destroy(); virtual;//0050D0F8
    constructor Create; virtual;//v2C//0050CF80
    procedure BeginDispatch;//0050CF60
    procedure DoActionExecute(Action:TBasicAction; var Handled:Boolean);//0050D234
    procedure DoActionUpdate(Action:TBasicAction; var Handled:Boolean);//0050D2B0
    procedure DoActivate(Sender:TObject);//0050D32C
    procedure DoDeactivate(Sender:TObject);//0050D3A0
    procedure DoException(Sender:TObject; E:Exception);//0050D414
    function DoHelp(Command:Word; Data:TCustomLongData; var CallHelp:Boolean):Boolean;//0050D4D0
    procedure DoHint(Sender:TObject);//0050D570
    procedure DoIdle(Sender:TObject; var Done:Boolean);//0050D5E4
    procedure DoMessage(var Msg:TMsg; var Handled:Boolean);//0050D660
    procedure DoMinimize(Sender:TObject);//0050D6DC
    procedure DoRestore(Sender:TObject);//0050D750
    procedure DoShortcut(var Msg:TWMKey; var Handled:Boolean);//0050D7C4
    procedure DoShowHint(var HintStr:UnicodeString; var CanShow:Boolean; var HintInfo:THintInfo);//0050D840
    procedure DoSettingChange(Sender:TObject; Flag:Integer; const Section:UnicodeString; var Result:LongInt);//0050D8C0
    procedure EndDispatch;//0050D944
    function GetAppEvents(Index:Integer):TCustomApplicationEvents;//0050D998
    function GetCount:Integer;//0050D9AC
    procedure DoModalBegin(Sender:TObject);//0050D9B4
    procedure DoModalEnd(Sender:TObject);//0050DA28
  end;
    function MaskGetCharType(const EditMask:UnicodeString; MaskOffset:Integer):TMaskCharType;//004FA900
    function MaskGetCurrentDirectives(const EditMask:UnicodeString; MaskOffset:Integer):TMaskDirectives;//004FAAD0
    function MaskIntlLiteralToChar(IChar:Char):Char;//004FAB5C
    function MaskDoFormatText(const EditMask:UnicodeString; const Value:UnicodeString; Blank:Char):UnicodeString;//004FAB84
    function MaskGetMaskSave(const EditMask:UnicodeString):Boolean;//004FADD8
    function MaskGetMaskBlank(const EditMask:UnicodeString):Char;//004FAEA4
    function MaskOffsetToString(const EditMask:UnicodeString; MaskOffset:Integer):UnicodeString;//004FAF34
    function MaskOffsetToOffset(const EditMask:UnicodeString; MaskOffset:Integer):Integer;//004FAFC0
    function OffsetToMaskOffset(const EditMask:UnicodeString; Offset:Integer):Integer;//004FB024
    function IsLiteralChar(const EditMask:UnicodeString; Offset:Integer):Boolean;//004FB08C
    function PadSubField(const EditMask:UnicodeString; const Value:UnicodeString; StartFld:Integer; StopFld:Integer; Len:Integer; Blank:Char):UnicodeString;//004FB0B4
    function PadInputLiterals(const EditMask:UnicodeString; const Value:UnicodeString; Blank:Char):UnicodeString;//004FB27C
    procedure KeyDown(var Key:Word; Shift:TShiftState);//004FBA34
    procedure KeyUp(var Key:Word; Shift:TShiftState);//004FBB18
    procedure KeyPress(var Key:Char);//004FBB68
    procedure WMLButtonDown(var Message:TWMLButtonDown);//004FBBD8
    procedure WMLButtonUp(var Message:TWMLButtonUp);//004FBBF4
    procedure WMSetFocus(var Message:TWMSetFocus);//004FBC54
    procedure WMCut(var Message:TMessage);//004FBEE8
    procedure WMPaste(var Message:TMessage);//004FBF60
    //function sub_004FC5C4:?;//004FC5C4
    procedure Reset;//004FC5C8
    procedure CMEnter(var Message:TCMEnter);//004FCC50
    procedure CMTextChanged(var Message:TMessage);//004FCCE0
    procedure CMWantSpecialKey(var Message:TCMWantSpecialKey);//004FCD70
    procedure CMExit(var Message:TCMExit);//004FCDA8
    procedure ValidateError;//004FCE7C
    function IsKatakana(const Chr:Byte):Boolean;//004FD1C8
    function TestChar(NewChar:Char):Boolean;//004FD1E0
    function Validate(const Value:UnicodeString; var Pos:Integer):Boolean;//004FD558
    procedure InvalidOp(const id:UnicodeString);//004FF9A8
    function GridRect(Coord1:TGridCoord; Coord2:TGridCoord):TGridRect;//004FF9C0
    function PointInGridRect(Col:LongInt; Row:LongInt; const Rect:TGridRect):Boolean;//004FFA28
    function PtInRect(X:Integer; Y:Integer; const Rect:TRect):Boolean;//004FFA44
    function Includes(const P1:TPoint; var P2:TPoint):Boolean;//004FFA60
    function Build(var R:TRect; const P1:TPoint; const P2:TPoint; const P3:TPoint):Boolean;//004FFAAC
    procedure XorRects(const R1:TRect; const R2:TRect; var XorRects:TXorRects);//004FFB24
    procedure ModifyExtents(var Extents:Pointer; Index:LongInt; Amount:LongInt; Default:Integer);//004FFC88
    procedure UpdateExtents(var Extents:Pointer; NewSize:LongInt; Default:Integer);//004FFD78
    procedure MoveExtent(var Extents:Pointer; FromIndex:LongInt; ToIndex:LongInt);//004FFD94
    function CompareExtents(E1:Pointer; E2:Pointer):Boolean;//004FFDF0
    function MulDiv(nNumerator:Integer; nDenominator:Integer):Integer; stdcall;//004FFE24
    procedure KillMessage(Wnd:HWND; Msg:Integer);//004FFE2C
    procedure CreateParams(var Params:TCreateParams);//004FFECC
    procedure CMShowingChanged(var Message:TMessage);//004FFEE4
    procedure WMGetDlgCode(var Message:TWMGetDlgCode);//004FFEE8
    procedure WMPaste(var Message:TMessage);//004FFF10
    procedure WMClear(var Message:TMessage);//004FFF30
    procedure WMCut(var Message:TMessage);//004FFF50
    procedure DblClick;//004FFF70
    procedure DoMouseWheel(Shift:TShiftState; WheelDelta:Integer; MousePos:TPoint);//004FFF84
    function EditCanModify:Boolean;//004FFFBC
    procedure SendToParent;//004FFFD0
    procedure ParentEvent;//00500004
    function ForwardMovement:Boolean;//0050004C
    function Ctrl:Boolean;//00500068
    function Selection:TSelection;//00500078
    function CaretPos:Integer;//0050009C
    function RightSide:Boolean;//005000D8
    function LeftSide:Boolean;//00500130
    procedure KeyDown(var Key:Word; Shift:TShiftState);//0050017C
    procedure KeyPress(var Key:Char);//005003B4
    procedure KeyUp(var Key:Word; Shift:TShiftState);//005004A0
    procedure WndProc(var Message:TMessage);//005004BC
    procedure BoundsChanged;//00500734
    procedure UpdateContents;//005007D4
    function DoSizeAdjust(var Count:LongInt; var Extents:Pointer; DefaultExtent:Integer; var Current:LongInt):LongInt;//00500A94
    procedure AdjustSize(Index:LongInt; Amount:LongInt; Rows:Boolean);//00500BB4
    procedure DoExit;//00500D48
    procedure sub_00500D88;//00500D88
    procedure sub_00500D8C;//00500D8C
    procedure CanEditModify;//00500D90
    function CanEditShow:Boolean;//00500D98
    procedure GetEditMask(ACol:LongInt; ARow:LongInt);//00500E98
    procedure GetEditText(ACol:LongInt; ARow:LongInt);//00500EA8
    procedure sub_00500EB8;//00500EB8
    procedure GetEditLimit;//00500EC0
    procedure sub_00500EC4;//00500EC4
    function DoColWidths:Boolean;//00501048
    function DoRowHeights:Boolean;//0050108C
    procedure DefineProperties(Filer:TFiler);//005010D0
    procedure sub_00501264;//00501264
    procedure sub_005012EC;//005012EC
    //function sub_00501344:?;//00501344
    procedure sub_00501348;//00501348
    procedure TopLeftChanged;//005013A8
    procedure FillDWord(var Dest:void ; Count:Integer; Value:Integer);//005013E8
    function StackAlloc(Size:Integer):Pointer;//005013F4
    procedure StackFree(P:Pointer);//00501424
    procedure DrawAxisLines(const AxisInfo:TGridAxisDrawInfo; Cell:Integer; MajorIndex:Integer; UseOnColor:Boolean);//0050143C
    procedure DrawLines(DoHorz:Boolean; DoVert:Boolean; Col:LongInt; Row:LongInt; const CellBounds:array[$0..-$1] of System.Integer; const _Dv_:$0..-$1; OnColor:TColor; OffColor:TColor);//00501620
    procedure DrawCells(ACol:LongInt; ARow:LongInt; StartX:Integer; StartY:Integer; StopX:Integer; StopY:Integer; AColor:TColor; IncludeDrawState:TGridDrawState);//005016B0
    procedure Paint;//00501AA4
    function DoCalc(const AxisInfo:TGridAxisDrawInfo; N:Integer):Integer;//005020DC
    function DoCalcRightToLeft(const AxisInfo:TGridAxisDrawInfo; N:Integer):Integer;//00502144
    procedure CalcAxis(var AxisInfo:TGridAxisDrawInfo; UseExtent:Integer);//00502244
    procedure CalcFixedAxis(var Axis:TGridAxisDrawInfo; LineOptions:TGridOptions; FixedCount:Integer; FirstCell:Integer; CellCount:Integer; GetExtentFunc:TGetExtentsFunc);//005022D0
    function CalcMaxCell(const Axis:TGridAxisDrawInfo; Start:Integer):Integer;//005023E0
    procedure CalcAxisState(const AxisInfo:TGridAxisDrawInfo; Pos:Integer; NewState:TGridState);//00502484
    function XOutsideHorzFixedBoundary:Boolean;//0050259C
    function XOutsideOrEqualHorzFixedBoundary:Boolean;//005025E8
    procedure CalcSizingState(X:Integer; Y:Integer; var State:TGridState; var Index:LongInt; var SizingPos:Integer; var SizingOfs:Integer; var FixedInfo:TGridDrawInfo);//00502634
    procedure MinRedraw(const OldInfo:TGridAxisDrawInfo; const NewInfo:TGridAxisDrawInfo; Axis:Integer);//00502894
    procedure DoChange;//005028FC
    procedure DrawCellHighlight(const ARect:TRect; AState:TGridDrawState; ACol:Integer; ARow:Integer);//00502D84
    procedure DrawCellBackground(const ARect:TRect; AColor:TColor; AState:TGridDrawState; ACol:Integer; ARow:Integer);//00502FC4
    procedure FixedCellClick(ACol:LongInt; ARow:LongInt);//00503338
    function LinePos(const AxisInfo:TGridAxisDrawInfo; Line:Integer):Integer;//00503384
    function CalcAxis(const AxisInfo:TGridAxisDrawInfo; GridRectMin:Integer; GridRectMax:Integer; var ScreenRectMin:Integer; var ScreenRectMax:Integer):Boolean;//005033E0
    procedure IsTouchPropertyStored(AProperty:TTouchProperty);//005036A8
    function Min:LongInt;//005036F4
    function Max:LongInt;//0050371C
    function PageUp:LongInt;//00503738
    function PageDown:LongInt;//00503798
    function CalcScrollBar(Value:LongInt; ARTLFactor:LongInt):LongInt;//005037EC
    procedure ModifyPixelScrollBar(Code:Cardinal; Pos:Cardinal);//00503924
    function CalcScroll(const AxisInfo:TGridAxisDrawInfo; OldPos:Integer; CurrentPos:Integer; var Amount:LongInt):Boolean;//0050418C
    procedure SetScroll(Code:Word; Value:Integer);//00504294
    procedure DoUpdate;//00504464
    function ScrollBarVisible(Code:Word):Boolean;//00504488
    procedure CalcSizeInfo;//005044F8
    procedure SetAxisRange(var Max:LongInt; var Old:LongInt; var Current:LongInt; Code:Word; Fixeds:Integer);//00504570
    procedure SetHorzRange;//005045EC
    procedure SetVertRange;//00504680
    function CreateEditor:TInplaceEdit;//00504810
    procedure CreateParams(var Params:TCreateParams);//00504820
    procedure CreateWnd;//005048A0
    procedure DoGesture(const EventInfo:TGestureEventInfo; var Handled:Boolean);//005048D4
    procedure CalcPageExtents;//00504A4C
    procedure Restrict(var Coord:TGridCoord; MinX:LongInt; MinY:LongInt; MaxX:LongInt; MaxY:LongInt);//00504AB8
    procedure KeyDown(var Key:Word; Shift:TShiftState);//00504AF8
    procedure KeyPress(var Key:Char);//00504F74
    procedure MouseDown(Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer);//00504FB4
    procedure MouseMove(Shift:TShiftState; X:Integer; Y:Integer);//005053D0
    function ResizeLine(const AxisInfo:TGridAxisDrawInfo):Integer;//00505620
    procedure MouseUp(Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer);//00505678
    procedure UpdateEditor;//00506238
    procedure WMChar(var Msg:TWMChar);//005063FC
    procedure WMCommand(var Message:TWMCommand);//00506470
    procedure WMGetDlgCode(var Msg:TWMGetDlgCode);//005064A4
    procedure WMKillFocus(var Msg:TWMKillFocus);//005064D4
    procedure WMLButtonDown(var Message:TWMLButtonDown);//00506524
    procedure WMNCHitTest(var Msg:TWMNCHitTest);//0050654C
    procedure WMSetCursor(var Msg:TWMSetCursor);//005065A0
    procedure WMSetFocus(var Msg:TWMSetFocus);//0050664C
    procedure WMSize(var Msg:TWMSize);//005066A8
    procedure WMVScroll(var Msg:TWMVScroll);//005066D8
    procedure WMHScroll(var Msg:TWMHScroll);//005066F0
    procedure WMEraseBkgnd(var Message:TWMEraseBkgnd);//00506704
    procedure WMCancelMode(var Msg:TWMCancelMode);//0050682C
    procedure CMCancelMode(var Msg:TCMCancelMode);//00506840
    procedure CMFontChanged(var Message:TMessage);//00506870
    procedure CMMouseLeave(var Message:TMessage);//00506894
    procedure CMCtl3DChanged(var Message:TMessage);//005068D8
    procedure CMDesignHitTest(var Msg:TCMDesignHitTest);//005068EC
    procedure CMWantSpecialKey(var Msg:TCMWantSpecialKey);//0050690C
    procedure TimedScroll(Direction:TGridScrollDirection);//00506938
    procedure WMTimer(var Msg:TWMTimer);//005069EC
    procedure ColWidthsChanged;//00506B48
    procedure RowHeightsChanged;//00506B5C
    procedure DeleteColumn(ACol:LongInt);//00506B70
    procedure DeleteRow(ARow:LongInt);//00506B94
    procedure DoMouseWheelDown(Shift:TShiftState; MousePos:TPoint);//00506BF8
    procedure DoMouseWheelUp(Shift:TShiftState; MousePos:TPoint);//00506C44
    procedure BeginColumnDrag(var Origin:Integer; var Destination:Integer; const MousePt:TPoint);//00506C8C
    procedure BeginRowDrag(var Origin:Integer; var Destination:Integer; const MousePt:TPoint);//00506C98
    procedure CheckColumnDrag(var Origin:Integer; var Destination:Integer; const MousePt:TPoint);//00506CA4
    procedure CheckRowDrag(var Origin:Integer; var Destination:Integer; const MousePt:TPoint);//00506CB0
    procedure EndColumnDrag(var Origin:Integer; var Destination:Integer; const MousePt:TPoint);//00506CBC
    procedure EndRowDrag(var Origin:Integer; var Destination:Integer; const MousePt:TPoint);//00506CC8
    procedure CMShowingChanged(var Message:TMessage);//00506CD4
    procedure ColumnMoved(FromIndex:LongInt; ToIndex:LongInt);//00506D4C
    procedure GetEditMask(ACol:LongInt; ARow:LongInt);//00506D6C
    procedure GetEditText(ACol:LongInt; ARow:LongInt);//00506DAC
    procedure RowMoved(FromIndex:LongInt; ToIndex:LongInt);//00506DEC
    function SelectCell(ACol:LongInt; ARow:LongInt):Boolean;//00506E0C
    procedure SetEditText(ACol:LongInt; ARow:LongInt; const Value:UnicodeString);//00506E3C
    procedure DrawCell(ACol:LongInt; ARow:LongInt; ARect:TRect; AState:TGridDrawState);//00506E68
    procedure TopLeftChanged;//00506F08
    procedure CreateParams(var Params:TCreateParams);//00507148
    procedure CreateWnd;//0050717C
    procedure KeyPress(var Key:Char);//005071B4
    procedure MouseUp(Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer);//0050729C
    procedure BoundsChanged;//0050733C
    procedure CloseUp(Accept:Boolean);//005073E0
    procedure DoDropDownKeys(var Key:Word; Shift:TShiftState);//0050758C
    procedure DoEditButtonClick;//00507604
    procedure DoGetPickListItems;//00507628
    procedure DropDown;//005076F0
    procedure KeyDown(var Key:Word; Shift:TShiftState);//00507970
    procedure MouseDown(Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer);//00507A14
    procedure MouseMove(Shift:TShiftState; X:Integer; Y:Integer);//00507AB4
    procedure MouseUp(Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer);//00507B84
    procedure PaintWindow(DC:HDC);//00507BDC
    procedure UpdateContents;//00507E8C
    procedure CMCancelMode(var Message:TCMCancelMode);//00507F00
    procedure WMCancelMode(var Message:TWMCancelMode);//00507F24
    procedure WMKillFocus(var Message:TWMKillFocus);//00507F40
    procedure WMLButtonDblClk(var Message:TWMLButtonDblClk);//00508064
    procedure WMPaint(var Message:TWMPaint);//005080A0
    procedure WMSetCursor(var Message:TWMSetCursor);//005080A8
    procedure WndProc(var Message:TMessage);//0050810C
    procedure DblClick;//00508194
    procedure CMMouseEnter(var Message:TMessage);//005082F0
    procedure CMMouseLeave(var Message:TMessage);//00508324
    function CreateEditor:TInplaceEdit;//0050A2A0
    function FormatLine(const Key:UnicodeString; const Value:UnicodeString):UnicodeString;//0050A2F4
    function GetCell(ACol:Integer; ARow:Integer):UnicodeString;//0050A42C
    procedure SetCell(ACol:Integer; ARow:Integer; const Value:UnicodeString);//0050A4F8
    procedure SetStrings(const Value:TStrings);//0050A6E0
    procedure SetColumnTitles(Visible:Boolean);//0050A6EC
    procedure DrawCell(ACol:LongInt; ARow:LongInt; ARect:TRect; AState:TGridDrawState);//0050A89C
    procedure AdjustColWidths;//0050A9AC
    procedure AdjustRowCount;//0050AAE8
    procedure Resize;//0050AB60
    procedure ColWidthsChanged;//0050AB78
    procedure sub_0050ABBC;//0050ABBC
    procedure CanEditModify;//0050ABC4
    procedure GetEditLimit;//0050AC9C
    procedure GetEditMask(ACol:LongInt; ARow:LongInt);//0050AD14
    procedure GetEditStyle(ACol:LongInt; ARow:LongInt);//0050ADC4
    procedure GetEditText(ACol:Integer; ARow:Integer);//0050AE6C
    procedure SetEditText(ACol:Integer; ARow:Integer; const Value:UnicodeString);//0050AEB8
    function RestoreInplaceEditor:Boolean;//0050B3A8
    procedure RowMoved(FromIndex:LongInt; ToIndex:LongInt);//0050B4A8
    procedure DoOnValidate;//0050B4D4
    function SelectCell(ACol:LongInt; ARow:LongInt):Boolean;//0050B588
    function InsertOK:Boolean;//0050B634
    procedure SetRow(NewRow:Integer);//0050B6C0
    procedure KeyDown(var Key:Word; Shift:TShiftState);//0050B6DC
    procedure CreateWnd;//0050B894
    procedure DoExit;//0050B8B8
    procedure CMShowingChanged(var Message:TMessage);//0050B918
    procedure MouseDown(Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer);//0050B938
    procedure Changing;//0050BAD4
    procedure Changed;//0050BB04
    procedure InsertItem(Index:Integer; const S:UnicodeString; AObject:TObject);//0050BED0
    procedure Put(Index:Integer; const S:UnicodeString);//0050BFA4
    procedure AssignTo(Dest:TPersistent);//0050C0F0
    procedure Changed;//0050C29C

implementation

//004FA900
function MaskGetCharType(const EditMask:UnicodeString; MaskOffset:Integer):TMaskCharType;
begin
{*
 004FA900    push        ebx
 004FA901    push        esi
 004FA902    push        edi
 004FA903    push        ecx
 004FA904    mov         edi,edx
 004FA906    mov         esi,eax
 004FA908    mov         bl,1
 004FA90A    mov         word ptr [esp],0
 004FA910    mov         edx,esi
 004FA912    mov         eax,edx
 004FA914    test        eax,eax
>004FA916    je          004FA91D
 004FA918    sub         eax,4
 004FA91B    mov         eax,dword ptr [eax]
 004FA91D    cmp         eax,edi
>004FA91F    jl          004FA92A
 004FA921    movzx       eax,word ptr [esi+edi*2-2]
 004FA926    mov         word ptr [esp],ax
 004FA92A    mov         eax,edx
 004FA92C    test        eax,eax
>004FA92E    je          004FA935
 004FA930    sub         eax,4
 004FA933    mov         eax,dword ptr [eax]
 004FA935    cmp         eax,edi
>004FA937    jge         004FA940
 004FA939    xor         ebx,ebx
>004FA93B    jmp         004FAAC6
 004FA940    mov         edx,edi
 004FA942    mov         eax,esi
 004FA944    call        ByteType
 004FA949    test        al,al
>004FA94B    je          004FA954
 004FA94D    mov         bl,1
>004FA94F    jmp         004FAAC6
 004FA954    cmp         edi,1
>004FA957    jle         004FA993
 004FA959    cmp         word ptr [esi+edi*2-4],5C
>004FA95F    jne         004FA993
 004FA961    mov         edx,edi
 004FA963    dec         edx
 004FA964    mov         eax,esi
 004FA966    call        ByteType
 004FA96B    test        al,al
>004FA96D    jne         004FA993
 004FA96F    cmp         edi,2
>004FA972    jle         004FA98C
 004FA974    cmp         word ptr [esi+edi*2-6],5C
>004FA97A    jne         004FA98C
 004FA97C    mov         edx,edi
 004FA97E    sub         edx,2
 004FA981    mov         eax,esi
 004FA983    call        ByteType
 004FA988    test        al,al
>004FA98A    je          004FA993
 004FA98C    mov         bl,1
>004FA98E    jmp         004FAAC6
 004FA993    movzx       eax,word ptr [esp]
 004FA997    cmp         ax,word ptr ds:[7868E2]
>004FA99E    jne         004FA9B3
 004FA9A0    mov         eax,esi
 004FA9A2    test        eax,eax
>004FA9A4    je          004FA9AB
 004FA9A6    sub         eax,4
 004FA9A9    mov         eax,dword ptr [eax]
 004FA9AB    cmp         eax,4
 004FA9AE    setge       al
>004FA9B1    jmp         004FA9B5
 004FA9B3    xor         eax,eax
 004FA9B5    test        al,al
>004FA9B7    je          004FA9CE
 004FA9B9    mov         eax,esi
 004FA9BB    test        eax,eax
>004FA9BD    je          004FA9C4
 004FA9BF    sub         eax,4
 004FA9C2    mov         eax,dword ptr [eax]
 004FA9C4    sub         eax,4
 004FA9C7    cmp         edi,eax
 004FA9C9    setg        al
>004FA9CC    jmp         004FA9D0
 004FA9CE    xor         eax,eax
 004FA9D0    test        al,al
>004FA9D2    je          004FA9DB
 004FA9D4    mov         bl,6
>004FA9D6    jmp         004FAAC6
 004FA9DB    mov         edx,esi
 004FA9DD    mov         eax,edx
 004FA9DF    test        eax,eax
>004FA9E1    je          004FA9E8
 004FA9E3    sub         eax,4
 004FA9E6    mov         eax,dword ptr [eax]
 004FA9E8    cmp         eax,4
>004FA9EB    jl          004FAA02
 004FA9ED    mov         eax,edx
 004FA9EF    test        eax,eax
>004FA9F1    je          004FA9F8
 004FA9F3    sub         eax,4
 004FA9F6    mov         eax,dword ptr [eax]
 004FA9F8    sub         eax,4
 004FA9FB    cmp         edi,eax
 004FA9FD    setg        al
>004FAA00    jmp         004FAA04
 004FAA02    xor         eax,eax
 004FAA04    test        al,al
>004FAA06    je          004FAA19
 004FAA08    movzx       eax,word ptr [esi+edi*2-4]
 004FAA0D    cmp         ax,word ptr ds:[7868E2]
 004FAA14    sete        al
>004FAA17    jmp         004FAA1B
 004FAA19    xor         eax,eax
 004FAA1B    test        al,al
>004FAA1D    je          004FAA44
 004FAA1F    cmp         edi,2
>004FAA22    jle         004FAA40
 004FAA24    cmp         word ptr [esi+edi*2-6],5C
>004FAA2A    jne         004FAA40
 004FAA2C    mov         edx,edi
 004FAA2E    sub         edx,2
 004FAA31    mov         eax,esi
 004FAA33    call        ByteType
 004FAA38    cmp         al,2
>004FAA3A    je          004FAA40
 004FAA3C    xor         eax,eax
>004FAA3E    jmp         004FAA46
 004FAA40    mov         al,1
>004FAA42    jmp         004FAA46
 004FAA44    xor         eax,eax
 004FAA46    test        al,al
>004FAA48    je          004FAA4E
 004FAA4A    mov         bl,7
>004FAA4C    jmp         004FAAC6
 004FAA4E    movzx       eax,word ptr [esp]
 004FAA52    sub         ax,2F
>004FAA56    je          004FAA5E
 004FAA58    sub         ax,0B
>004FAA5C    jne         004FAA62
 004FAA5E    mov         bl,2
>004FAA60    jmp         004FAAC6
 004FAA62    movzx       eax,word ptr [esp]
 004FAA66    sub         ax,21
>004FAA6A    je          004FAA7E
 004FAA6C    sub         ax,1B
>004FAA70    je          004FAA7E
 004FAA72    sub         ax,2
>004FAA76    je          004FAA7E
 004FAA78    sub         ax,1E
>004FAA7C    jne         004FAA82
 004FAA7E    mov         bl,3
>004FAA80    jmp         004FAAC6
 004FAA82    movzx       eax,word ptr [esp]
 004FAA86    sub         ax,23
>004FAA8A    je          004FAAA4
 004FAA8C    sub         ax,16
>004FAA90    je          004FAAA4
 004FAA92    sub         ax,28
>004FAA96    je          004FAAA4
 004FAA98    sub         ax,2
>004FAA9C    je          004FAAA4
 004FAA9E    sub         ax,9
>004FAAA2    jne         004FAAA8
 004FAAA4    mov         bl,5
>004FAAA6    jmp         004FAAC6
 004FAAA8    movzx       eax,word ptr [esp]
 004FAAAC    sub         ax,30
>004FAAB0    je          004FAAC4
 004FAAB2    sub         ax,11
>004FAAB6    je          004FAAC4
 004FAAB8    sub         ax,2
>004FAABC    je          004FAAC4
 004FAABE    sub         ax,9
>004FAAC2    jne         004FAAC6
 004FAAC4    mov         bl,4
 004FAAC6    mov         eax,ebx
 004FAAC8    pop         edx
 004FAAC9    pop         edi
 004FAACA    pop         esi
 004FAACB    pop         ebx
 004FAACC    ret
*}
end;

//004FAAD0
function MaskGetCurrentDirectives(const EditMask:UnicodeString; MaskOffset:Integer):TMaskDirectives;
begin
{*
 004FAAD0    push        ebx
 004FAAD1    push        esi
 004FAAD2    push        edi
 004FAAD3    push        ebp
 004FAAD4    push        ecx
 004FAAD5    mov         dword ptr [esp],edx
 004FAAD8    mov         edi,eax
 004FAADA    movzx       ebx,byte ptr ds:[4FAB58]
 004FAAE1    mov         eax,edi
 004FAAE3    test        eax,eax
>004FAAE5    je          004FAAEC
 004FAAE7    sub         eax,4
 004FAAEA    mov         eax,dword ptr [eax]
 004FAAEC    mov         esi,eax
 004FAAEE    test        esi,esi
>004FAAF0    jle         004FAB3C
 004FAAF2    mov         ebp,1
 004FAAF7    movzx       eax,word ptr [edi+ebp*2-2]
 004FAAFC    cmp         ax,21
>004FAB00    jne         004FAB07
 004FAB02    or          bl,1
>004FAB05    jmp         004FAB38
 004FAB07    cmp         ax,3E
>004FAB0B    jne         004FAB27
 004FAB0D    cmp         ebp,dword ptr [esp]
>004FAB10    jge         004FAB27
 004FAB12    and         bl,0FB
 004FAB15    cmp         ebp,1
>004FAB18    jle         004FAB22
 004FAB1A    cmp         word ptr [edi+ebp*2-4],3C
>004FAB20    je          004FAB38
 004FAB22    or          bl,2
>004FAB25    jmp         004FAB38
 004FAB27    cmp         ax,3C
>004FAB2B    jne         004FAB38
 004FAB2D    cmp         ebp,dword ptr [esp]
>004FAB30    jge         004FAB38
 004FAB32    and         bl,0FD
 004FAB35    or          bl,4
 004FAB38    inc         ebp
 004FAB39    dec         esi
>004FAB3A    jne         004FAAF7
 004FAB3C    mov         edx,dword ptr [esp]
 004FAB3F    mov         eax,edi
 004FAB41    call        MaskGetCharType
 004FAB46    cmp         al,1
>004FAB48    jne         004FAB4D
 004FAB4A    or          bl,8
 004FAB4D    mov         eax,ebx
 004FAB4F    pop         edx
 004FAB50    pop         ebp
 004FAB51    pop         edi
 004FAB52    pop         esi
 004FAB53    pop         ebx
 004FAB54    ret
*}
end;

//004FAB5C
function MaskIntlLiteralToChar(IChar:Char):Char;
begin
{*
 004FAB5C    mov         edx,eax
 004FAB5E    sub         ax,2F
>004FAB62    je          004FAB76
 004FAB64    sub         ax,0B
>004FAB68    jne         004FAB7F
 004FAB6A    mov         edx,dword ptr ds:[78CB84];TimeSeparator:Char
 004FAB70    movzx       edx,word ptr [edx]
 004FAB73    mov         eax,edx
 004FAB75    ret
 004FAB76    mov         edx,dword ptr ds:[78CF00];DateSeparator:Char
 004FAB7C    movzx       edx,word ptr [edx]
 004FAB7F    mov         eax,edx
 004FAB81    ret
*}
end;

//004FAB84
function MaskDoFormatText(const EditMask:UnicodeString; const Value:UnicodeString; Blank:Char):UnicodeString;
begin
{*
 004FAB84    push        ebp
 004FAB85    mov         ebp,esp
 004FAB87    push        ecx
 004FAB88    mov         ecx,7
 004FAB8D    push        0
 004FAB8F    push        0
 004FAB91    dec         ecx
>004FAB92    jne         004FAB8D
 004FAB94    xchg        ecx,dword ptr [ebp-4]
 004FAB97    push        ebx
 004FAB98    push        esi
 004FAB99    push        edi
 004FAB9A    mov         word ptr [ebp-6],cx
 004FAB9E    mov         esi,edx
 004FABA0    mov         dword ptr [ebp-4],eax
 004FABA3    mov         ebx,dword ptr [ebp+8]
 004FABA6    xor         eax,eax
 004FABA8    push        ebp
 004FABA9    push        4FADC7
 004FABAE    push        dword ptr fs:[eax]
 004FABB1    mov         dword ptr fs:[eax],esp
 004FABB4    mov         eax,ebx
 004FABB6    mov         edx,esi
 004FABB8    call        @UStrAsg
 004FABBD    mov         edx,1
 004FABC2    mov         eax,dword ptr [ebp-4]
 004FABC5    call        MaskGetCurrentDirectives
 004FABCA    mov         byte ptr [ebp-11],al
 004FABCD    test        byte ptr [ebp-11],1
>004FABD1    jne         004FACBA
 004FABD7    mov         dword ptr [ebp-10],1
 004FABDE    mov         eax,dword ptr [ebp-4]
 004FABE1    test        eax,eax
>004FABE3    je          004FABEA
 004FABE5    sub         eax,4
 004FABE8    mov         eax,dword ptr [eax]
 004FABEA    test        eax,eax
>004FABEC    jle         004FADAC
 004FABF2    mov         dword ptr [ebp-18],eax
 004FABF5    mov         esi,1
 004FABFA    mov         edx,esi
 004FABFC    mov         eax,dword ptr [ebp-4]
 004FABFF    call        MaskGetCharType
 004FAC04    mov         edx,eax
 004FAC06    dec         edx
 004FAC07    sub         dl,2
>004FAC0A    jae         004FAC76
 004FAC0C    mov         eax,dword ptr [ebx]
 004FAC0E    mov         dword ptr [ebp-1C],eax
 004FAC11    mov         edi,dword ptr [ebp-1C]
 004FAC14    test        edi,edi
>004FAC16    je          004FAC1D
 004FAC18    sub         edi,4
 004FAC1B    mov         edi,dword ptr [edi]
 004FAC1D    lea         eax,[ebp-20]
 004FAC20    push        eax
 004FAC21    mov         ecx,dword ptr [ebp-10]
 004FAC24    dec         ecx
 004FAC25    mov         eax,dword ptr [ebx]
 004FAC27    mov         edx,1
 004FAC2C    call        @UStrCopy
 004FAC31    push        dword ptr [ebp-20]
 004FAC34    mov         eax,dword ptr [ebp-4]
 004FAC37    movzx       eax,word ptr [eax+esi*2-2]
 004FAC3C    call        MaskIntlLiteralToChar
 004FAC41    mov         edx,eax
 004FAC43    lea         eax,[ebp-24]
 004FAC46    call        @UStrFromWChar
 004FAC4B    push        dword ptr [ebp-24]
 004FAC4E    lea         eax,[ebp-28]
 004FAC51    push        eax
 004FAC52    mov         ecx,edi
 004FAC54    sub         ecx,dword ptr [ebp-10]
 004FAC57    inc         ecx
 004FAC58    mov         eax,dword ptr [ebx]
 004FAC5A    mov         edx,dword ptr [ebp-10]
 004FAC5D    call        @UStrCopy
 004FAC62    push        dword ptr [ebp-28]
 004FAC65    mov         eax,ebx
 004FAC67    mov         edx,3
 004FAC6C    call        @UStrCatN
 004FAC71    inc         dword ptr [ebp-10]
>004FAC74    jmp         004FACAB
 004FAC76    add         al,0FC
 004FAC78    sub         al,2
>004FAC7A    jae         004FACAB
 004FAC7C    mov         eax,dword ptr [ebx]
 004FAC7E    mov         dword ptr [ebp-1C],eax
 004FAC81    mov         eax,dword ptr [ebp-1C]
 004FAC84    test        eax,eax
>004FAC86    je          004FAC8D
 004FAC88    sub         eax,4
 004FAC8B    mov         eax,dword ptr [eax]
 004FAC8D    cmp         eax,dword ptr [ebp-10]
>004FAC90    jge         004FACA8
 004FAC92    lea         eax,[ebp-2C]
 004FAC95    movzx       edx,word ptr [ebp-6]
 004FAC99    call        @UStrFromWChar
 004FAC9E    mov         edx,dword ptr [ebp-2C]
 004FACA1    mov         eax,ebx
 004FACA3    call        @UStrCat
 004FACA8    inc         dword ptr [ebp-10]
 004FACAB    inc         esi
 004FACAC    dec         dword ptr [ebp-18]
>004FACAF    jne         004FABFA
>004FACB5    jmp         004FADAC
 004FACBA    mov         eax,dword ptr [ebx]
 004FACBC    mov         dword ptr [ebp-1C],eax
 004FACBF    mov         eax,dword ptr [ebp-1C]
 004FACC2    test        eax,eax
>004FACC4    je          004FACCB
 004FACC6    sub         eax,4
 004FACC9    mov         eax,dword ptr [eax]
 004FACCB    mov         dword ptr [ebp-10],eax
 004FACCE    mov         eax,dword ptr [ebp-4]
 004FACD1    test        eax,eax
>004FACD3    je          004FACDA
 004FACD5    sub         eax,4
 004FACD8    mov         eax,dword ptr [eax]
 004FACDA    dec         eax
 004FACDB    test        eax,eax
>004FACDD    jl          004FADAC
 004FACE3    inc         eax
 004FACE4    mov         dword ptr [ebp-18],eax
 004FACE7    mov         dword ptr [ebp-0C],0
 004FACEE    mov         eax,dword ptr [ebp-4]
 004FACF1    test        eax,eax
>004FACF3    je          004FACFA
 004FACF5    sub         eax,4
 004FACF8    mov         eax,dword ptr [eax]
 004FACFA    mov         esi,eax
 004FACFC    sub         esi,dword ptr [ebp-0C]
 004FACFF    mov         edx,esi
 004FAD01    mov         eax,dword ptr [ebp-4]
 004FAD04    call        MaskGetCharType
 004FAD09    mov         edx,eax
 004FAD0B    dec         edx
 004FAD0C    sub         dl,2
>004FAD0F    jae         004FAD77
 004FAD11    mov         eax,dword ptr [ebx]
 004FAD13    mov         dword ptr [ebp-1C],eax
 004FAD16    mov         edi,dword ptr [ebp-1C]
 004FAD19    test        edi,edi
>004FAD1B    je          004FAD22
 004FAD1D    sub         edi,4
 004FAD20    mov         edi,dword ptr [edi]
 004FAD22    lea         eax,[ebp-30]
 004FAD25    push        eax
 004FAD26    mov         eax,dword ptr [ebx]
 004FAD28    mov         ecx,dword ptr [ebp-10]
 004FAD2B    mov         edx,1
 004FAD30    call        @UStrCopy
 004FAD35    push        dword ptr [ebp-30]
 004FAD38    mov         eax,dword ptr [ebp-4]
 004FAD3B    movzx       eax,word ptr [eax+esi*2-2]
 004FAD40    call        MaskIntlLiteralToChar
 004FAD45    mov         edx,eax
 004FAD47    lea         eax,[ebp-34]
 004FAD4A    call        @UStrFromWChar
 004FAD4F    push        dword ptr [ebp-34]
 004FAD52    lea         eax,[ebp-38]
 004FAD55    push        eax
 004FAD56    mov         ecx,edi
 004FAD58    sub         ecx,dword ptr [ebp-10]
 004FAD5B    mov         edx,dword ptr [ebp-10]
 004FAD5E    inc         edx
 004FAD5F    mov         eax,dword ptr [ebx]
 004FAD61    call        @UStrCopy
 004FAD66    push        dword ptr [ebp-38]
 004FAD69    mov         eax,ebx
 004FAD6B    mov         edx,3
 004FAD70    call        @UStrCatN
>004FAD75    jmp         004FADA0
 004FAD77    add         al,0FC
 004FAD79    sub         al,2
>004FAD7B    jae         004FADA0
 004FAD7D    cmp         dword ptr [ebp-10],1
>004FAD81    jge         004FAD9D
 004FAD83    lea         eax,[ebp-3C]
 004FAD86    movzx       edx,word ptr [ebp-6]
 004FAD8A    call        @UStrFromWChar
 004FAD8F    mov         edx,dword ptr [ebp-3C]
 004FAD92    mov         ecx,dword ptr [ebx]
 004FAD94    mov         eax,ebx
 004FAD96    call        @UStrCat3
>004FAD9B    jmp         004FADA0
 004FAD9D    dec         dword ptr [ebp-10]
 004FADA0    inc         dword ptr [ebp-0C]
 004FADA3    dec         dword ptr [ebp-18]
>004FADA6    jne         004FACEE
 004FADAC    xor         eax,eax
 004FADAE    pop         edx
 004FADAF    pop         ecx
 004FADB0    pop         ecx
 004FADB1    mov         dword ptr fs:[eax],edx
 004FADB4    push        4FADCE
 004FADB9    lea         eax,[ebp-3C]
 004FADBC    mov         edx,8
 004FADC1    call        @UStrArrayClr
 004FADC6    ret
>004FADC7    jmp         @HandleFinally
>004FADCC    jmp         004FADB9
 004FADCE    pop         edi
 004FADCF    pop         esi
 004FADD0    pop         ebx
 004FADD1    mov         esp,ebp
 004FADD3    pop         ebp
 004FADD4    ret         4
*}
end;

//004FADD8
function MaskGetMaskSave(const EditMask:UnicodeString):Boolean;
begin
{*
 004FADD8    push        ebx
 004FADD9    push        esi
 004FADDA    push        edi
 004FADDB    push        ebp
 004FADDC    add         esp,0FFFFFFF4
 004FADDF    mov         edi,eax
 004FADE1    mov         byte ptr [esp],1
 004FADE5    mov         edx,edi
 004FADE7    mov         eax,edx
 004FADE9    test        eax,eax
>004FADEB    je          004FADF2
 004FADED    sub         eax,4
 004FADF0    mov         eax,dword ptr [eax]
 004FADF2    cmp         eax,4
>004FADF5    jl          004FAE96
 004FADFB    mov         dword ptr [esp+4],0FFFFFFFF
 004FAE03    or          ebp,0FFFFFFFF
 004FAE06    mov         eax,edx
 004FAE08    test        eax,eax
>004FAE0A    je          004FAE11
 004FAE0C    sub         eax,4
 004FAE0F    mov         eax,dword ptr [eax]
 004FAE11    mov         esi,eax
 004FAE13    test        ebp,ebp
>004FAE15    jge         004FAE68
 004FAE17    mov         edx,esi
 004FAE19    mov         eax,edi
 004FAE1B    call        MaskGetCharType
 004FAE20    cmp         al,6
>004FAE22    jne         004FAE33
 004FAE24    cmp         dword ptr [esp+4],0
>004FAE29    jge         004FAE31
 004FAE2B    mov         dword ptr [esp+4],esi
>004FAE2F    jmp         004FAE33
 004FAE31    mov         ebp,esi
 004FAE33    dec         esi
 004FAE34    test        esi,esi
>004FAE36    jg          004FAE3C
 004FAE38    mov         bl,1
>004FAE3A    jmp         004FAE60
 004FAE3C    mov         dword ptr [esp+8],edi
 004FAE40    cmp         dword ptr [esp+8],0
>004FAE45    je          004FAE54
 004FAE47    mov         eax,dword ptr [esp+8]
 004FAE4B    sub         eax,4
 004FAE4E    mov         eax,dword ptr [eax]
 004FAE50    mov         dword ptr [esp+8],eax
 004FAE54    mov         eax,dword ptr [esp+8]
 004FAE58    sub         eax,4
 004FAE5B    cmp         esi,eax
 004FAE5D    setl        bl
 004FAE60    test        bl,bl
>004FAE62    jne         004FAE68
 004FAE64    test        ebp,ebp
>004FAE66    jl          004FAE17
 004FAE68    test        ebp,ebp
>004FAE6A    jge         004FAE70
 004FAE6C    mov         ebp,dword ptr [esp+4]
 004FAE70    test        ebp,ebp
>004FAE72    jle         004FAE96
 004FAE74    mov         eax,edi
 004FAE76    test        eax,eax
>004FAE78    je          004FAE7F
 004FAE7A    sub         eax,4
 004FAE7D    mov         eax,dword ptr [eax]
 004FAE7F    cmp         eax,ebp
>004FAE81    je          004FAE96
 004FAE83    movzx       eax,word ptr [edi+ebp*2]
 004FAE87    cmp         ax,word ptr ds:[7868E4]
 004FAE8E    sete        al
 004FAE91    xor         al,1
 004FAE93    mov         byte ptr [esp],al
 004FAE96    movzx       eax,byte ptr [esp]
 004FAE9A    add         esp,0C
 004FAE9D    pop         ebp
 004FAE9E    pop         edi
 004FAE9F    pop         esi
 004FAEA0    pop         ebx
 004FAEA1    ret
*}
end;

//004FAEA4
function MaskGetMaskBlank(const EditMask:UnicodeString):Char;
begin
{*
 004FAEA4    push        ebx
 004FAEA5    push        esi
 004FAEA6    push        edi
 004FAEA7    push        ebp
 004FAEA8    mov         ebx,eax
 004FAEAA    movzx       ebp,word ptr ds:[7868E0]
 004FAEB1    mov         edi,ebx
 004FAEB3    mov         eax,edi
 004FAEB5    test        eax,eax
>004FAEB7    je          004FAEBE
 004FAEB9    sub         eax,4
 004FAEBC    mov         eax,dword ptr [eax]
 004FAEBE    cmp         eax,4
>004FAEC1    jl          004FAF2B
 004FAEC3    mov         esi,edi
 004FAEC5    test        esi,esi
>004FAEC7    je          004FAECE
 004FAEC9    sub         esi,4
 004FAECC    mov         esi,dword ptr [esi]
 004FAECE    mov         edx,esi
 004FAED0    dec         edx
 004FAED1    mov         eax,ebx
 004FAED3    call        MaskGetCharType
 004FAED8    cmp         al,6
>004FAEDA    jne         004FAF2B
 004FAEDC    mov         esi,edi
 004FAEDE    test        esi,esi
>004FAEE0    je          004FAEE7
 004FAEE2    sub         esi,4
 004FAEE5    mov         esi,dword ptr [esi]
 004FAEE7    mov         edx,esi
 004FAEE9    sub         edx,2
 004FAEEC    mov         eax,ebx
 004FAEEE    call        MaskGetCharType
 004FAEF3    cmp         al,6
>004FAEF5    jne         004FAEFB
 004FAEF7    mov         al,1
>004FAEF9    jmp         004FAF17
 004FAEFB    mov         esi,edi
 004FAEFD    test        esi,esi
>004FAEFF    je          004FAF06
 004FAF01    sub         esi,4
 004FAF04    mov         esi,dword ptr [esi]
 004FAF06    mov         edx,esi
 004FAF08    sub         edx,3
 004FAF0B    mov         eax,ebx
 004FAF0D    call        MaskGetCharType
 004FAF12    cmp         al,6
 004FAF14    sete        al
 004FAF17    test        al,al
>004FAF19    je          004FAF2B
 004FAF1B    mov         eax,edi
 004FAF1D    test        eax,eax
>004FAF1F    je          004FAF26
 004FAF21    sub         eax,4
 004FAF24    mov         eax,dword ptr [eax]
 004FAF26    movzx       ebp,word ptr [ebx+eax*2-2]
 004FAF2B    mov         eax,ebp
 004FAF2D    pop         ebp
 004FAF2E    pop         edi
 004FAF2F    pop         esi
 004FAF30    pop         ebx
 004FAF31    ret
*}
end;

//004FAF34
function MaskOffsetToString(const EditMask:UnicodeString; MaskOffset:Integer):UnicodeString;
begin
{*
 004FAF34    push        ebp
 004FAF35    mov         ebp,esp
 004FAF37    add         esp,0FFFFFFF8
 004FAF3A    push        ebx
 004FAF3B    push        esi
 004FAF3C    push        edi
 004FAF3D    xor         ebx,ebx
 004FAF3F    mov         dword ptr [ebp-8],ebx
 004FAF42    mov         dword ptr [ebp-4],ecx
 004FAF45    mov         ebx,edx
 004FAF47    mov         edi,eax
 004FAF49    xor         eax,eax
 004FAF4B    push        ebp
 004FAF4C    push        4FAFB2
 004FAF51    push        dword ptr fs:[eax]
 004FAF54    mov         dword ptr fs:[eax],esp
 004FAF57    mov         eax,dword ptr [ebp-4]
 004FAF5A    call        @UStrClr
 004FAF5F    mov         esi,ebx
 004FAF61    test        esi,esi
>004FAF63    jle         004FAF9C
 004FAF65    mov         ebx,1
 004FAF6A    mov         edx,ebx
 004FAF6C    mov         eax,edi
 004FAF6E    call        MaskGetCharType
 004FAF73    sub         al,3
>004FAF75    je          004FAF98
 004FAF77    add         al,0FD
 004FAF79    sub         al,2
>004FAF7B    jb          004FAF98
 004FAF7D    lea         eax,[ebp-8]
 004FAF80    movzx       edx,word ptr [edi+ebx*2-2]
 004FAF85    call        @UStrFromWChar
 004FAF8A    mov         edx,dword ptr [ebp-8]
 004FAF8D    mov         eax,dword ptr [ebp-4]
 004FAF90    call        @UStrCat
 004FAF95    mov         eax,dword ptr [ebp-4]
 004FAF98    inc         ebx
 004FAF99    dec         esi
>004FAF9A    jne         004FAF6A
 004FAF9C    xor         eax,eax
 004FAF9E    pop         edx
 004FAF9F    pop         ecx
 004FAFA0    pop         ecx
 004FAFA1    mov         dword ptr fs:[eax],edx
 004FAFA4    push        4FAFB9
 004FAFA9    lea         eax,[ebp-8]
 004FAFAC    call        @UStrClr
 004FAFB1    ret
>004FAFB2    jmp         @HandleFinally
>004FAFB7    jmp         004FAFA9
 004FAFB9    pop         edi
 004FAFBA    pop         esi
 004FAFBB    pop         ebx
 004FAFBC    pop         ecx
 004FAFBD    pop         ecx
 004FAFBE    pop         ebp
 004FAFBF    ret
*}
end;

//004FAFC0
function MaskOffsetToOffset(const EditMask:UnicodeString; MaskOffset:Integer):Integer;
begin
{*
 004FAFC0    push        ebp
 004FAFC1    mov         ebp,esp
 004FAFC3    add         esp,0FFFFFFF8
 004FAFC6    push        ebx
 004FAFC7    push        esi
 004FAFC8    xor         ecx,ecx
 004FAFCA    mov         dword ptr [ebp-4],ecx
 004FAFCD    mov         esi,edx
 004FAFCF    mov         ebx,eax
 004FAFD1    xor         eax,eax
 004FAFD3    push        ebp
 004FAFD4    push        4FB015
 004FAFD9    push        dword ptr fs:[eax]
 004FAFDC    mov         dword ptr fs:[eax],esp
 004FAFDF    lea         ecx,[ebp-4]
 004FAFE2    mov         edx,esi
 004FAFE4    mov         eax,ebx
 004FAFE6    call        MaskOffsetToString
 004FAFEB    mov         eax,dword ptr [ebp-4]
 004FAFEE    mov         dword ptr [ebp-8],eax
 004FAFF1    mov         eax,dword ptr [ebp-8]
 004FAFF4    test        eax,eax
>004FAFF6    je          004FAFFD
 004FAFF8    sub         eax,4
 004FAFFB    mov         eax,dword ptr [eax]
 004FAFFD    mov         ebx,eax
 004FAFFF    xor         eax,eax
 004FB001    pop         edx
 004FB002    pop         ecx
 004FB003    pop         ecx
 004FB004    mov         dword ptr fs:[eax],edx
 004FB007    push        4FB01C
 004FB00C    lea         eax,[ebp-4]
 004FB00F    call        @UStrClr
 004FB014    ret
>004FB015    jmp         @HandleFinally
>004FB01A    jmp         004FB00C
 004FB01C    mov         eax,ebx
 004FB01E    pop         esi
 004FB01F    pop         ebx
 004FB020    pop         ecx
 004FB021    pop         ecx
 004FB022    pop         ebp
 004FB023    ret
*}
end;

//004FB024
function OffsetToMaskOffset(const EditMask:UnicodeString; Offset:Integer):Integer;
begin
{*
 004FB024    push        ebx
 004FB025    push        esi
 004FB026    push        edi
 004FB027    push        ebp
 004FB028    push        ecx
 004FB029    mov         ebx,edx
 004FB02B    mov         edi,eax
 004FB02D    mov         esi,edi
 004FB02F    mov         eax,esi
 004FB031    test        eax,eax
>004FB033    je          004FB03A
 004FB035    sub         eax,4
 004FB038    mov         eax,dword ptr [eax]
 004FB03A    mov         edx,eax
 004FB03C    mov         eax,edi
 004FB03E    call        MaskOffsetToOffset
 004FB043    cmp         eax,ebx
>004FB045    jge         004FB04C
 004FB047    or          ebp,0FFFFFFFF
>004FB04A    jmp         004FB082
 004FB04C    xor         ebp,ebp
 004FB04E    mov         dword ptr [esp],ebx
 004FB051    mov         eax,esi
 004FB053    test        eax,eax
>004FB055    je          004FB05C
 004FB057    sub         eax,4
 004FB05A    mov         eax,dword ptr [eax]
 004FB05C    mov         ebx,eax
 004FB05E    test        ebx,ebx
>004FB060    jle         004FB082
 004FB062    mov         esi,1
 004FB067    inc         ebp
 004FB068    mov         edx,esi
 004FB06A    mov         eax,edi
 004FB06C    call        MaskGetCharType
 004FB071    cmp         al,3
>004FB073    je          004FB07E
 004FB075    dec         dword ptr [esp]
 004FB078    cmp         dword ptr [esp],0
>004FB07C    jl          004FB082
 004FB07E    inc         esi
 004FB07F    dec         ebx
>004FB080    jne         004FB067
 004FB082    mov         eax,ebp
 004FB084    pop         edx
 004FB085    pop         ebp
 004FB086    pop         edi
 004FB087    pop         esi
 004FB088    pop         ebx
 004FB089    ret
*}
end;

//004FB08C
function IsLiteralChar(const EditMask:UnicodeString; Offset:Integer):Boolean;
begin
{*
 004FB08C    push        ebx
 004FB08D    push        esi
 004FB08E    mov         esi,eax
 004FB090    xor         ebx,ebx
 004FB092    mov         eax,esi
 004FB094    call        OffsetToMaskOffset
 004FB099    test        eax,eax
>004FB09B    jl          004FB0AC
 004FB09D    mov         edx,eax
 004FB09F    mov         eax,esi
 004FB0A1    call        MaskGetCharType
 004FB0A6    dec         eax
 004FB0A7    sub         al,2
 004FB0A9    setb        bl
 004FB0AC    mov         eax,ebx
 004FB0AE    pop         esi
 004FB0AF    pop         ebx
 004FB0B0    ret
*}
end;

//004FB0B4
function PadSubField(const EditMask:UnicodeString; const Value:UnicodeString; StartFld:Integer; StopFld:Integer; Len:Integer; Blank:Char):UnicodeString;
begin
{*
 004FB0B4    push        ebp
 004FB0B5    mov         ebp,esp
 004FB0B7    add         esp,0FFFFFFD0
 004FB0BA    push        ebx
 004FB0BB    push        esi
 004FB0BC    push        edi
 004FB0BD    xor         ebx,ebx
 004FB0BF    mov         dword ptr [ebp-30],ebx
 004FB0C2    mov         dword ptr [ebp-2C],ebx
 004FB0C5    mov         dword ptr [ebp-28],ebx
 004FB0C8    mov         dword ptr [ebp-24],ebx
 004FB0CB    mov         dword ptr [ebp-4],ebx
 004FB0CE    mov         dword ptr [ebp-8],ebx
 004FB0D1    mov         dword ptr [ebp-10],ecx
 004FB0D4    mov         edi,edx
 004FB0D6    mov         dword ptr [ebp-0C],eax
 004FB0D9    mov         ebx,dword ptr [ebp+8]
 004FB0DC    mov         esi,dword ptr [ebp+14]
 004FB0DF    xor         eax,eax
 004FB0E1    push        ebp
 004FB0E2    push        4FB269
 004FB0E7    push        dword ptr fs:[eax]
 004FB0EA    mov         dword ptr fs:[eax],esp
 004FB0ED    mov         eax,esi
 004FB0EF    sub         eax,dword ptr [ebp-10]
 004FB0F2    cmp         eax,dword ptr [ebp+10]
>004FB0F5    jge         004FB180
 004FB0FB    mov         edx,1
 004FB100    mov         eax,dword ptr [ebp-0C]
 004FB103    call        MaskGetCurrentDirectives
 004FB108    mov         byte ptr [ebp-11],al
 004FB10B    mov         eax,esi
 004FB10D    dec         eax
 004FB10E    mov         dword ptr [ebp-18],eax
 004FB111    test        byte ptr [ebp-11],1
>004FB115    je          004FB11E
 004FB117    mov         eax,dword ptr [ebp-10]
 004FB11A    dec         eax
 004FB11B    mov         dword ptr [ebp-18],eax
 004FB11E    push        ebx
 004FB11F    mov         ecx,dword ptr [ebp-18]
 004FB122    mov         edx,1
 004FB127    mov         eax,edi
 004FB129    call        @UStrCopy
 004FB12E    sub         esi,dword ptr [ebp-10]
 004FB131    mov         eax,dword ptr [ebp+10]
 004FB134    sub         eax,esi
 004FB136    test        eax,eax
>004FB138    jle         004FB155
 004FB13A    mov         esi,eax
 004FB13C    lea         eax,[ebp-24]
 004FB13F    movzx       edx,word ptr [ebp+0C]
 004FB143    call        @UStrFromWChar
 004FB148    mov         edx,dword ptr [ebp-24]
 004FB14B    mov         eax,ebx
 004FB14D    call        @UStrCat
 004FB152    dec         esi
>004FB153    jne         004FB13C
 004FB155    mov         esi,edi
 004FB157    test        esi,esi
>004FB159    je          004FB160
 004FB15B    sub         esi,4
 004FB15E    mov         esi,dword ptr [esi]
 004FB160    lea         eax,[ebp-28]
 004FB163    push        eax
 004FB164    mov         edx,dword ptr [ebp-18]
 004FB167    inc         edx
 004FB168    mov         ecx,esi
 004FB16A    mov         eax,edi
 004FB16C    call        @UStrCopy
 004FB171    mov         edx,dword ptr [ebp-28]
 004FB174    mov         eax,ebx
 004FB176    call        @UStrCat
>004FB17B    jmp         004FB241
 004FB180    mov         eax,esi
 004FB182    sub         eax,dword ptr [ebp-10]
 004FB185    cmp         eax,dword ptr [ebp+10]
>004FB188    jle         004FB238
 004FB18E    mov         edx,1
 004FB193    mov         eax,dword ptr [ebp-0C]
 004FB196    call        MaskGetCurrentDirectives
 004FB19B    mov         byte ptr [ebp-11],al
 004FB19E    test        byte ptr [ebp-11],1
>004FB1A2    je          004FB1EE
 004FB1A4    lea         eax,[ebp-4]
 004FB1A7    push        eax
 004FB1A8    mov         ecx,dword ptr [ebp-10]
 004FB1AB    dec         ecx
 004FB1AC    mov         edx,1
 004FB1B1    mov         eax,edi
 004FB1B3    call        @UStrCopy
 004FB1B8    mov         dword ptr [ebp-1C],edi
 004FB1BB    cmp         dword ptr [ebp-1C],0
>004FB1BF    je          004FB1CC
 004FB1C1    mov         eax,dword ptr [ebp-1C]
 004FB1C4    sub         eax,4
 004FB1C7    mov         eax,dword ptr [eax]
 004FB1C9    mov         dword ptr [ebp-1C],eax
 004FB1CC    lea         eax,[ebp-2C]
 004FB1CF    push        eax
 004FB1D0    mov         edx,esi
 004FB1D2    sub         edx,dword ptr [ebp+10]
 004FB1D5    mov         ecx,dword ptr [ebp-1C]
 004FB1D8    mov         eax,edi
 004FB1DA    call        @UStrCopy
 004FB1DF    mov         ecx,dword ptr [ebp-2C]
 004FB1E2    mov         eax,ebx
 004FB1E4    mov         edx,dword ptr [ebp-4]
 004FB1E7    call        @UStrCat3
>004FB1EC    jmp         004FB241
 004FB1EE    lea         eax,[ebp-8]
 004FB1F1    push        eax
 004FB1F2    mov         ecx,dword ptr [ebp-10]
 004FB1F5    add         ecx,dword ptr [ebp+10]
 004FB1F8    dec         ecx
 004FB1F9    mov         edx,1
 004FB1FE    mov         eax,edi
 004FB200    call        @UStrCopy
 004FB205    mov         dword ptr [ebp-20],edi
 004FB208    cmp         dword ptr [ebp-20],0
>004FB20C    je          004FB219
 004FB20E    mov         eax,dword ptr [ebp-20]
 004FB211    sub         eax,4
 004FB214    mov         eax,dword ptr [eax]
 004FB216    mov         dword ptr [ebp-20],eax
 004FB219    lea         eax,[ebp-30]
 004FB21C    push        eax
 004FB21D    mov         ecx,dword ptr [ebp-20]
 004FB220    mov         edx,esi
 004FB222    mov         eax,edi
 004FB224    call        @UStrCopy
 004FB229    mov         ecx,dword ptr [ebp-30]
 004FB22C    mov         eax,ebx
 004FB22E    mov         edx,dword ptr [ebp-8]
 004FB231    call        @UStrCat3
>004FB236    jmp         004FB241
 004FB238    mov         eax,ebx
 004FB23A    mov         edx,edi
 004FB23C    call        @UStrAsg
 004FB241    xor         eax,eax
 004FB243    pop         edx
 004FB244    pop         ecx
 004FB245    pop         ecx
 004FB246    mov         dword ptr fs:[eax],edx
 004FB249    push        4FB270
 004FB24E    lea         eax,[ebp-30]
 004FB251    mov         edx,4
 004FB256    call        @UStrArrayClr
 004FB25B    lea         eax,[ebp-8]
 004FB25E    mov         edx,2
 004FB263    call        @UStrArrayClr
 004FB268    ret
>004FB269    jmp         @HandleFinally
>004FB26E    jmp         004FB24E
 004FB270    pop         edi
 004FB271    pop         esi
 004FB272    pop         ebx
 004FB273    mov         esp,ebp
 004FB275    pop         ebp
 004FB276    ret         10
*}
end;

//004FB27C
function PadInputLiterals(const EditMask:UnicodeString; const Value:UnicodeString; Blank:Char):UnicodeString;
begin
{*
 004FB27C    push        ebp
 004FB27D    mov         ebp,esp
 004FB27F    add         esp,0FFFFFFD0
 004FB282    push        ebx
 004FB283    push        esi
 004FB284    push        edi
 004FB285    xor         ebx,ebx
 004FB287    mov         dword ptr [ebp-30],ebx
 004FB28A    mov         dword ptr [ebp-2C],ebx
 004FB28D    mov         dword ptr [ebp-28],ebx
 004FB290    mov         word ptr [ebp-2],cx
 004FB294    mov         edi,edx
 004FB296    mov         esi,eax
 004FB298    mov         ebx,dword ptr [ebp+8]
 004FB29B    xor         eax,eax
 004FB29D    push        ebp
 004FB29E    push        4FB4A3
 004FB2A3    push        dword ptr fs:[eax]
 004FB2A6    mov         dword ptr fs:[eax],esp
 004FB2A9    xor         eax,eax
 004FB2AB    mov         dword ptr [ebp-8],eax
 004FB2AE    mov         eax,ebx
 004FB2B0    mov         edx,edi
 004FB2B2    call        @UStrAsg
 004FB2B7    mov         eax,esi
 004FB2B9    test        eax,eax
>004FB2BB    je          004FB2C2
 004FB2BD    sub         eax,4
 004FB2C0    mov         eax,dword ptr [eax]
 004FB2C2    test        eax,eax
>004FB2C4    jle         004FB3C0
 004FB2CA    mov         dword ptr [ebp-18],eax
 004FB2CD    mov         dword ptr [ebp-14],1
 004FB2D4    mov         edx,dword ptr [ebp-14]
 004FB2D7    mov         eax,esi
 004FB2D9    call        MaskGetCharType
 004FB2DE    dec         eax
 004FB2DF    sub         al,2
>004FB2E1    jae         004FB3B4
 004FB2E7    mov         edx,dword ptr [ebp-14]
 004FB2EA    mov         eax,esi
 004FB2EC    call        MaskOffsetToOffset
 004FB2F1    mov         dword ptr [ebp-10],eax
 004FB2F4    mov         ecx,dword ptr [ebx]
 004FB2F6    mov         eax,ecx
 004FB2F8    mov         dword ptr [ebp-24],eax
 004FB2FB    mov         eax,dword ptr [ebp-24]
 004FB2FE    test        eax,eax
>004FB300    je          004FB307
 004FB302    sub         eax,4
 004FB305    mov         eax,dword ptr [eax]
 004FB307    inc         eax
 004FB308    mov         dword ptr [ebp-0C],eax
 004FB30B    mov         edx,dword ptr [ebp-8]
 004FB30E    inc         edx
 004FB30F    mov         eax,ecx
 004FB311    mov         dword ptr [ebp-24],eax
 004FB314    mov         eax,dword ptr [ebp-24]
 004FB317    test        eax,eax
>004FB319    je          004FB320
 004FB31B    sub         eax,4
 004FB31E    mov         eax,dword ptr [eax]
 004FB320    mov         edi,edx
 004FB322    sub         eax,edi
>004FB324    jl          004FB34B
 004FB326    inc         eax
 004FB327    mov         dword ptr [ebp-1C],eax
 004FB32A    mov         eax,dword ptr [ebp-14]
 004FB32D    movzx       eax,word ptr [esi+eax*2-2]
 004FB332    call        MaskIntlLiteralToChar
 004FB337    mov         edx,dword ptr [ebx]
 004FB339    cmp         ax,word ptr [edx+edi*2-2]
>004FB33E    jne         004FB345
 004FB340    mov         dword ptr [ebp-0C],edi
>004FB343    jmp         004FB34B
 004FB345    inc         edi
 004FB346    dec         dword ptr [ebp-1C]
>004FB349    jne         004FB32A
 004FB34B    mov         eax,dword ptr [ebx]
 004FB34D    mov         dword ptr [ebp-24],eax
 004FB350    mov         eax,dword ptr [ebp-24]
 004FB353    test        eax,eax
>004FB355    je          004FB35C
 004FB357    sub         eax,4
 004FB35A    mov         eax,dword ptr [eax]
 004FB35C    cmp         eax,dword ptr [ebp-0C]
>004FB35F    jge         004FB382
 004FB361    mov         eax,dword ptr [ebp-14]
 004FB364    movzx       eax,word ptr [esi+eax*2-2]
 004FB369    call        MaskIntlLiteralToChar
 004FB36E    mov         edx,eax
 004FB370    lea         eax,[ebp-28]
 004FB373    call        @UStrFromWChar
 004FB378    mov         edx,dword ptr [ebp-28]
 004FB37B    mov         eax,ebx
 004FB37D    call        @UStrCat
 004FB382    mov         eax,dword ptr [ebp-0C]
 004FB385    push        eax
 004FB386    mov         edi,dword ptr [ebp-8]
 004FB389    inc         edi
 004FB38A    mov         eax,dword ptr [ebp-10]
 004FB38D    sub         eax,edi
 004FB38F    push        eax
 004FB390    movzx       eax,word ptr [ebp-2]
 004FB394    push        eax
 004FB395    lea         eax,[ebp-2C]
 004FB398    push        eax
 004FB399    mov         ecx,edi
 004FB39B    mov         edx,dword ptr [ebx]
 004FB39D    mov         eax,esi
 004FB39F    call        PadSubField
 004FB3A4    mov         edx,dword ptr [ebp-2C]
 004FB3A7    mov         eax,ebx
 004FB3A9    call        @UStrAsg
 004FB3AE    mov         eax,dword ptr [ebp-10]
 004FB3B1    mov         dword ptr [ebp-8],eax
 004FB3B4    inc         dword ptr [ebp-14]
 004FB3B7    dec         dword ptr [ebp-18]
>004FB3BA    jne         004FB2D4
 004FB3C0    mov         eax,esi
 004FB3C2    test        eax,eax
>004FB3C4    je          004FB3CB
 004FB3C6    sub         eax,4
 004FB3C9    mov         eax,dword ptr [eax]
 004FB3CB    mov         edx,eax
 004FB3CD    mov         eax,esi
 004FB3CF    call        MaskOffsetToOffset
 004FB3D4    mov         edi,eax
 004FB3D6    mov         edx,dword ptr [ebx]
 004FB3D8    mov         eax,edx
 004FB3DA    mov         dword ptr [ebp-24],eax
 004FB3DD    mov         eax,dword ptr [ebp-24]
 004FB3E0    test        eax,eax
>004FB3E2    je          004FB3E9
 004FB3E4    sub         eax,4
 004FB3E7    mov         eax,dword ptr [eax]
 004FB3E9    cmp         edi,eax
>004FB3EB    je          004FB432
 004FB3ED    mov         eax,edx
 004FB3EF    mov         dword ptr [ebp-24],eax
 004FB3F2    mov         eax,dword ptr [ebp-24]
 004FB3F5    mov         dword ptr [ebp-20],eax
 004FB3F8    cmp         dword ptr [ebp-20],0
>004FB3FC    je          004FB409
 004FB3FE    mov         eax,dword ptr [ebp-20]
 004FB401    sub         eax,4
 004FB404    mov         eax,dword ptr [eax]
 004FB406    mov         dword ptr [ebp-20],eax
 004FB409    mov         eax,dword ptr [ebp-20]
 004FB40C    inc         eax
 004FB40D    push        eax
 004FB40E    sub         edi,dword ptr [ebp-8]
 004FB411    push        edi
 004FB412    movzx       eax,word ptr [ebp-2]
 004FB416    push        eax
 004FB417    lea         eax,[ebp-30]
 004FB41A    push        eax
 004FB41B    mov         ecx,dword ptr [ebp-8]
 004FB41E    inc         ecx
 004FB41F    mov         edx,dword ptr [ebx]
 004FB421    mov         eax,esi
 004FB423    call        PadSubField
 004FB428    mov         edx,dword ptr [ebp-30]
 004FB42B    mov         eax,ebx
 004FB42D    call        @UStrAsg
 004FB432    mov         eax,dword ptr [ebx]
 004FB434    mov         dword ptr [ebp-24],eax
 004FB437    mov         eax,dword ptr [ebp-24]
 004FB43A    test        eax,eax
>004FB43C    je          004FB443
 004FB43E    sub         eax,4
 004FB441    mov         eax,dword ptr [eax]
 004FB443    test        eax,eax
>004FB445    jle         004FB488
 004FB447    mov         dword ptr [ebp-18],eax
 004FB44A    mov         dword ptr [ebp-10],1
 004FB451    mov         eax,dword ptr [ebx]
 004FB453    mov         edx,dword ptr [ebp-10]
 004FB456    cmp         word ptr [eax+edx*2-2],20
>004FB45C    jne         004FB480
 004FB45E    mov         edx,dword ptr [ebp-10]
 004FB461    dec         edx
 004FB462    mov         eax,esi
 004FB464    call        IsLiteralChar
 004FB469    test        al,al
>004FB46B    jne         004FB480
 004FB46D    mov         eax,ebx
 004FB46F    call        @UniqueStringU
 004FB474    mov         edx,dword ptr [ebp-10]
 004FB477    movzx       ecx,word ptr [ebp-2]
 004FB47B    mov         word ptr [eax+edx*2-2],cx
 004FB480    inc         dword ptr [ebp-10]
 004FB483    dec         dword ptr [ebp-18]
>004FB486    jne         004FB451
 004FB488    xor         eax,eax
 004FB48A    pop         edx
 004FB48B    pop         ecx
 004FB48C    pop         ecx
 004FB48D    mov         dword ptr fs:[eax],edx
 004FB490    push        4FB4AA
 004FB495    lea         eax,[ebp-30]
 004FB498    mov         edx,3
 004FB49D    call        @UStrArrayClr
 004FB4A2    ret
>004FB4A3    jmp         @HandleFinally
>004FB4A8    jmp         004FB495
 004FB4AA    pop         edi
 004FB4AB    pop         esi
 004FB4AC    pop         ebx
 004FB4AD    mov         esp,ebp
 004FB4AF    pop         ebp
 004FB4B0    ret         4
*}
end;

//004FB9DC
constructor TCustomMaskEdit.Create;
begin
{*
 004FB9DC    push        ebx
 004FB9DD    push        esi
 004FB9DE    test        dl,dl
>004FB9E0    je          004FB9EA
 004FB9E2    add         esp,0FFFFFFF0
 004FB9E5    call        @ClassCreate
 004FB9EA    mov         ebx,edx
 004FB9EC    mov         esi,eax
 004FB9EE    xor         edx,edx
 004FB9F0    mov         eax,esi
 004FB9F2    call        TCustomEdit.Create
 004FB9F7    movzx       eax,byte ptr ds:[4FBA30]
 004FB9FE    mov         byte ptr [esi+2AD],al
 004FBA04    mov         eax,[0078DB10]
 004FBA09    movzx       eax,word ptr [eax]
 004FBA0C    mov         word ptr [esi+2A4],ax
 004FBA13    mov         eax,esi
 004FBA15    test        bl,bl
>004FBA17    je          004FBA28
 004FBA19    call        @AfterConstruction
 004FBA1E    pop         dword ptr fs:[0]
 004FBA25    add         esp,0C
 004FBA28    mov         eax,esi
 004FBA2A    pop         esi
 004FBA2B    pop         ebx
 004FBA2C    ret
*}
end;

//004FBA34
procedure TCustomMaskEdit.KeyDown(var Key:Word; Shift:TShiftState);
begin
{*
 004FBA34    push        ebx
 004FBA35    push        esi
 004FBA36    push        ecx
 004FBA37    mov         word ptr [esp],cx
 004FBA3B    mov         esi,edx
 004FBA3D    mov         ebx,eax
 004FBA3F    cmp         byte ptr [ebx+2BC],0
>004FBA46    jne         004FBA55
 004FBA48    mov         edx,esi
 004FBA4A    movzx       ecx,word ptr [esp]
 004FBA4E    mov         eax,ebx
 004FBA50    call        TWinControl.KeyDown
 004FBA55    mov         eax,ebx
 004FBA57    call        TCustomMaskEdit.GetMasked
 004FBA5C    test        al,al
>004FBA5E    je          004FBB11
 004FBA64    cmp         word ptr [esi],0
>004FBA68    je          004FBB11
 004FBA6E    test        byte ptr [esp],2
>004FBA72    jne         004FBB11
 004FBA78    cmp         word ptr [esi],25
>004FBA7C    je          004FBA84
 004FBA7E    cmp         word ptr [esi],27
>004FBA82    jne         004FBAA5
 004FBA84    movzx       edx,word ptr [esi]
 004FBA87    movzx       ecx,word ptr [esp]
 004FBA8B    mov         eax,ebx
 004FBA8D    call        TCustomMaskEdit.ArrowKeys
 004FBA92    test        byte ptr [esp],1
>004FBA96    jne         004FBB11
 004FBA98    test        byte ptr [esp],4
>004FBA9C    jne         004FBB11
 004FBA9E    mov         word ptr [esi],0
>004FBAA3    jmp         004FBB11
 004FBAA5    cmp         word ptr [esi],26
>004FBAA9    je          004FBAB1
 004FBAAB    cmp         word ptr [esi],28
>004FBAAF    jne         004FBAB8
 004FBAB1    mov         word ptr [esi],0
>004FBAB6    jmp         004FBB11
 004FBAB8    cmp         word ptr [esi],24
>004FBABC    je          004FBAC4
 004FBABE    cmp         word ptr [esi],23
>004FBAC2    jne         004FBAD9
 004FBAC4    movzx       edx,word ptr [esi]
 004FBAC7    movzx       ecx,word ptr [esp]
 004FBACB    mov         eax,ebx
 004FBACD    call        TCustomMaskEdit.HomeEndKeys
 004FBAD2    mov         word ptr [esi],0
>004FBAD7    jmp         004FBB11
 004FBAD9    cmp         word ptr [esi],2E
>004FBADD    jne         004FBAE5
 004FBADF    test        byte ptr [esp],1
>004FBAE3    je          004FBAEB
 004FBAE5    cmp         word ptr [esi],8
>004FBAE9    jne         004FBB0A
 004FBAEB    mov         eax,ebx
 004FBAED    mov         edx,dword ptr [eax]
 004FBAEF    call        dword ptr [edx+110]
 004FBAF5    test        al,al
>004FBAF7    je          004FBB03
 004FBAF9    movzx       edx,word ptr [esi]
 004FBAFC    mov         eax,ebx
 004FBAFE    call        TCustomMaskEdit.DeleteKeys
 004FBB03    mov         word ptr [esi],0
>004FBB08    jmp         004FBB11
 004FBB0A    mov         eax,ebx
 004FBB0C    call        TCustomMaskEdit.CheckCursor
 004FBB11    pop         edx
 004FBB12    pop         esi
 004FBB13    pop         ebx
 004FBB14    ret
*}
end;

//004FBB18
procedure TCustomMaskEdit.KeyUp(var Key:Word; Shift:TShiftState);
begin
{*
 004FBB18    push        ebx
 004FBB19    push        esi
 004FBB1A    push        ecx
 004FBB1B    mov         word ptr [esp],cx
 004FBB1F    mov         esi,edx
 004FBB21    mov         ebx,eax
 004FBB23    cmp         byte ptr [ebx+2BC],0
>004FBB2A    jne         004FBB39
 004FBB2C    mov         edx,esi
 004FBB2E    movzx       ecx,word ptr [esp]
 004FBB32    mov         eax,ebx
 004FBB34    call        TWinControl.KeyUp
 004FBB39    mov         eax,ebx
 004FBB3B    call        TCustomMaskEdit.GetMasked
 004FBB40    test        al,al
>004FBB42    je          004FBB63
 004FBB44    cmp         word ptr [esi],0
>004FBB48    je          004FBB63
 004FBB4A    cmp         word ptr [esi],25
>004FBB4E    je          004FBB56
 004FBB50    cmp         word ptr [esi],27
>004FBB54    jne         004FBB63
 004FBB56    test        byte ptr [esp],4
>004FBB5A    je          004FBB63
 004FBB5C    mov         eax,ebx
 004FBB5E    call        TCustomMaskEdit.CheckCursor
 004FBB63    pop         edx
 004FBB64    pop         esi
 004FBB65    pop         ebx
 004FBB66    ret
*}
end;

//004FBB68
procedure TCustomMaskEdit.KeyPress(var Key:Char);
begin
{*
 004FBB68    push        ebx
 004FBB69    push        esi
 004FBB6A    push        edi
 004FBB6B    mov         esi,edx
 004FBB6D    mov         ebx,eax
 004FBB6F    mov         edx,esi
 004FBB71    mov         eax,ebx
 004FBB73    call        TWinControl.KeyPress
 004FBB78    mov         eax,ebx
 004FBB7A    call        TCustomMaskEdit.GetMasked
 004FBB7F    test        al,al
>004FBB81    je          004FBBB2
 004FBB83    cmp         word ptr [esi],0
>004FBB87    je          004FBBB2
 004FBB89    movzx       eax,word ptr [esi]
 004FBB8C    mov         edi,4FBBB8
 004FBB91    cmp         ax,0FF
>004FBB95    ja          004FBB9D
 004FBB97    movzx       eax,ax
 004FBB9A    bt          dword ptr [edi],eax
 004FBB9D    setb        al
 004FBBA0    test        al,al
>004FBBA2    jne         004FBBB2
 004FBBA4    mov         edx,esi
 004FBBA6    mov         eax,ebx
 004FBBA8    call        TCustomMaskEdit.CharKeys
 004FBBAD    mov         word ptr [esi],0
 004FBBB2    pop         edi
 004FBBB3    pop         esi
 004FBBB4    pop         ebx
 004FBBB5    ret
*}
end;

//004FBBD8
procedure TCustomMaskEdit.WMLButtonDown(var Message:TWMLButtonDown);
begin
{*
 004FBBD8    push        ebx
 004FBBD9    push        esi
 004FBBDA    mov         esi,edx
 004FBBDC    mov         ebx,eax
 004FBBDE    mov         edx,esi
 004FBBE0    mov         eax,ebx
 004FBBE2    call        TControl.WMLButtonDown
 004FBBE7    movsx       eax,word ptr [esi+8]
 004FBBEB    mov         dword ptr [ebx+2B4],eax
 004FBBF1    pop         esi
 004FBBF2    pop         ebx
 004FBBF3    ret
*}
end;

//004FBBF4
procedure TCustomMaskEdit.WMLButtonUp(var Message:TWMLButtonUp);
begin
{*
 004FBBF4    push        ebx
 004FBBF5    push        esi
 004FBBF6    add         esp,0FFFFFFF8
 004FBBF9    mov         esi,edx
 004FBBFB    mov         ebx,eax
 004FBBFD    mov         edx,esi
 004FBBFF    mov         eax,ebx
 004FBC01    call        TControl.WMLButtonUp
 004FBC06    mov         eax,ebx
 004FBC08    call        TCustomMaskEdit.GetMasked
 004FBC0D    test        al,al
>004FBC0F    je          004FBC4D
 004FBC11    lea         ecx,[esp+4]
 004FBC15    mov         edx,esp
 004FBC17    mov         eax,ebx
 004FBC19    call        TCustomMaskEdit.GetSel
 004FBC1E    mov         eax,dword ptr [esp]
 004FBC21    mov         dword ptr [ebx+2B0],eax
 004FBC27    mov         eax,dword ptr [esp]
 004FBC2A    cmp         eax,dword ptr [esp+4]
>004FBC2E    je          004FBC46
 004FBC30    movsx       eax,word ptr [esi+8]
 004FBC34    cmp         eax,dword ptr [ebx+2B4]
>004FBC3A    jle         004FBC46
 004FBC3C    mov         eax,dword ptr [esp+4]
 004FBC40    mov         dword ptr [ebx+2B0],eax
 004FBC46    mov         eax,ebx
 004FBC48    call        TCustomMaskEdit.CheckCursor
 004FBC4D    pop         ecx
 004FBC4E    pop         edx
 004FBC4F    pop         esi
 004FBC50    pop         ebx
 004FBC51    ret
*}
end;

//004FBC54
procedure TCustomMaskEdit.WMSetFocus(var Message:TWMSetFocus);
begin
{*
 004FBC54    push        ebx
 004FBC55    mov         ebx,eax
 004FBC57    mov         eax,ebx
 004FBC59    call        TWinControl.WMSetFocus
 004FBC5E    mov         eax,ebx
 004FBC60    call        TCustomMaskEdit.GetMasked
 004FBC65    test        al,al
>004FBC67    je          004FBC70
 004FBC69    mov         eax,ebx
 004FBC6B    call        TCustomMaskEdit.CheckCursor
 004FBC70    pop         ebx
 004FBC71    ret
*}
end;

//004FBC74
procedure TCustomMaskEdit.SetEditText(const Value:UnicodeString);
begin
{*
 004FBC74    push        ebp
 004FBC75    mov         ebp,esp
 004FBC77    push        0
 004FBC79    push        ebx
 004FBC7A    push        esi
 004FBC7B    mov         esi,edx
 004FBC7D    mov         ebx,eax
 004FBC7F    xor         eax,eax
 004FBC81    push        ebp
 004FBC82    push        4FBCD0
 004FBC87    push        dword ptr fs:[eax]
 004FBC8A    mov         dword ptr fs:[eax],esp
 004FBC8D    lea         edx,[ebp-4]
 004FBC90    mov         eax,ebx
 004FBC92    call        TCustomMaskEdit.GetEditText
 004FBC97    mov         eax,dword ptr [ebp-4]
 004FBC9A    mov         edx,esi
 004FBC9C    call        @UStrEqual
>004FBCA1    je          004FBCBA
 004FBCA3    mov         eax,esi
 004FBCA5    call        @UStrToPWChar
 004FBCAA    mov         edx,eax
 004FBCAC    mov         eax,ebx
 004FBCAE    call        TControl.SetTextBuf
 004FBCB3    mov         eax,ebx
 004FBCB5    call        TCustomMaskEdit.CheckCursor
 004FBCBA    xor         eax,eax
 004FBCBC    pop         edx
 004FBCBD    pop         ecx
 004FBCBE    pop         ecx
 004FBCBF    mov         dword ptr fs:[eax],edx
 004FBCC2    push        4FBCD7
 004FBCC7    lea         eax,[ebp-4]
 004FBCCA    call        @UStrClr
 004FBCCF    ret
>004FBCD0    jmp         @HandleFinally
>004FBCD5    jmp         004FBCC7
 004FBCD7    pop         esi
 004FBCD8    pop         ebx
 004FBCD9    pop         ecx
 004FBCDA    pop         ebp
 004FBCDB    ret
*}
end;

//004FBCDC
function TCustomMaskEdit.GetEditText:UnicodeString;
begin
{*
 004FBCDC    push        ebx
 004FBCDD    push        esi
 004FBCDE    mov         esi,edx
 004FBCE0    mov         ebx,eax
 004FBCE2    mov         edx,esi
 004FBCE4    mov         eax,ebx
 004FBCE6    call        TControl.GetText
 004FBCEB    pop         esi
 004FBCEC    pop         ebx
 004FBCED    ret
*}
end;

//004FBCF0
function TCustomMaskEdit.GetTextLen:Integer;
begin
{*
 004FBCF0    push        ebp
 004FBCF1    mov         ebp,esp
 004FBCF3    add         esp,0FFFFFFF8
 004FBCF6    push        ebx
 004FBCF7    xor         edx,edx
 004FBCF9    mov         dword ptr [ebp-4],edx
 004FBCFC    mov         ebx,eax
 004FBCFE    xor         eax,eax
 004FBD00    push        ebp
 004FBD01    push        4FBD40
 004FBD06    push        dword ptr fs:[eax]
 004FBD09    mov         dword ptr fs:[eax],esp
 004FBD0C    lea         edx,[ebp-4]
 004FBD0F    mov         eax,ebx
 004FBD11    call        TCustomMaskEdit.GetText
 004FBD16    mov         eax,dword ptr [ebp-4]
 004FBD19    mov         dword ptr [ebp-8],eax
 004FBD1C    mov         eax,dword ptr [ebp-8]
 004FBD1F    test        eax,eax
>004FBD21    je          004FBD28
 004FBD23    sub         eax,4
 004FBD26    mov         eax,dword ptr [eax]
 004FBD28    mov         ebx,eax
 004FBD2A    xor         eax,eax
 004FBD2C    pop         edx
 004FBD2D    pop         ecx
 004FBD2E    pop         ecx
 004FBD2F    mov         dword ptr fs:[eax],edx
 004FBD32    push        4FBD47
 004FBD37    lea         eax,[ebp-4]
 004FBD3A    call        @UStrClr
 004FBD3F    ret
>004FBD40    jmp         @HandleFinally
>004FBD45    jmp         004FBD37
 004FBD47    mov         eax,ebx
 004FBD49    pop         ebx
 004FBD4A    pop         ecx
 004FBD4B    pop         ecx
 004FBD4C    pop         ebp
 004FBD4D    ret
*}
end;

//004FBD50
function TCustomMaskEdit.GetText:TMaskedText;
begin
{*
 004FBD50    push        ebp
 004FBD51    mov         ebp,esp
 004FBD53    push        0
 004FBD55    push        0
 004FBD57    push        ebx
 004FBD58    push        esi
 004FBD59    mov         esi,edx
 004FBD5B    mov         ebx,eax
 004FBD5D    xor         eax,eax
 004FBD5F    push        ebp
 004FBD60    push        4FBDD4
 004FBD65    push        dword ptr fs:[eax]
 004FBD68    mov         dword ptr fs:[eax],esp
 004FBD6B    mov         eax,ebx
 004FBD6D    call        TCustomMaskEdit.GetMasked
 004FBD72    test        al,al
>004FBD74    jne         004FBD81
 004FBD76    mov         edx,esi
 004FBD78    mov         eax,ebx
 004FBD7A    call        TControl.GetText
>004FBD7F    jmp         004FBDB9
 004FBD81    lea         edx,[ebp-4]
 004FBD84    mov         eax,ebx
 004FBD86    call        TCustomMaskEdit.GetEditText
 004FBD8B    mov         edx,dword ptr [ebp-4]
 004FBD8E    mov         ecx,esi
 004FBD90    mov         eax,ebx
 004FBD92    call        TCustomMaskEdit.RemoveEditFormat
 004FBD97    cmp         byte ptr [ebx+2AC],0
>004FBD9E    je          004FBDB9
 004FBDA0    lea         eax,[ebp-8]
 004FBDA3    push        eax
 004FBDA4    mov         edx,dword ptr [esi]
 004FBDA6    xor         ecx,ecx
 004FBDA8    mov         eax,ebx
 004FBDAA    call        TCustomMaskEdit.AddEditFormat
 004FBDAF    mov         edx,dword ptr [ebp-8]
 004FBDB2    mov         eax,esi
 004FBDB4    call        @UStrAsg
 004FBDB9    xor         eax,eax
 004FBDBB    pop         edx
 004FBDBC    pop         ecx
 004FBDBD    pop         ecx
 004FBDBE    mov         dword ptr fs:[eax],edx
 004FBDC1    push        4FBDDB
 004FBDC6    lea         eax,[ebp-8]
 004FBDC9    mov         edx,2
 004FBDCE    call        @UStrArrayClr
 004FBDD3    ret
>004FBDD4    jmp         @HandleFinally
>004FBDD9    jmp         004FBDC6
 004FBDDB    pop         esi
 004FBDDC    pop         ebx
 004FBDDD    pop         ecx
 004FBDDE    pop         ecx
 004FBDDF    pop         ebp
 004FBDE0    ret
*}
end;

//004FBDE4
procedure TCustomMaskEdit.SetText(const Value:TMaskedText);
begin
{*
 004FBDE4    push        ebp
 004FBDE5    mov         ebp,esp
 004FBDE7    xor         ecx,ecx
 004FBDE9    push        ecx
 004FBDEA    push        ecx
 004FBDEB    push        ecx
 004FBDEC    push        ecx
 004FBDED    push        ebx
 004FBDEE    push        esi
 004FBDEF    mov         esi,edx
 004FBDF1    mov         ebx,eax
 004FBDF3    xor         eax,eax
 004FBDF5    push        ebp
 004FBDF6    push        4FBEDB
 004FBDFB    push        dword ptr fs:[eax]
 004FBDFE    mov         dword ptr fs:[eax],esp
 004FBE01    mov         eax,ebx
 004FBE03    call        TCustomMaskEdit.GetMasked
 004FBE08    test        al,al
>004FBE0A    jne         004FBE1A
 004FBE0C    mov         edx,esi
 004FBE0E    mov         eax,ebx
 004FBE10    call        TControl.SetText
>004FBE15    jmp         004FBEB8
 004FBE1A    lea         eax,[ebp-4]
 004FBE1D    mov         edx,esi
 004FBE1F    call        @UStrLAsg
 004FBE24    cmp         byte ptr [ebx+2AC],0
>004FBE2B    je          004FBE53
 004FBE2D    lea         eax,[ebp-0C]
 004FBE30    push        eax
 004FBE31    movzx       ecx,word ptr [ebx+2A4]
 004FBE38    mov         edx,dword ptr [ebp-4]
 004FBE3B    mov         eax,dword ptr [ebx+2A0]
 004FBE41    call        PadInputLiterals
 004FBE46    mov         edx,dword ptr [ebp-0C]
 004FBE49    lea         eax,[ebp-4]
 004FBE4C    call        @UStrLAsg
>004FBE51    jmp         004FBE6E
 004FBE53    lea         eax,[ebp-10]
 004FBE56    push        eax
 004FBE57    mov         cl,1
 004FBE59    mov         edx,dword ptr [ebp-4]
 004FBE5C    mov         eax,ebx
 004FBE5E    call        TCustomMaskEdit.AddEditFormat
 004FBE63    mov         edx,dword ptr [ebp-10]
 004FBE66    lea         eax,[ebp-4]
 004FBE69    call        @UStrLAsg
 004FBE6E    test        byte ptr [ebx+2AD],4
>004FBE75    jne         004FBEAE
 004FBE77    test        byte ptr [ebx+1C],10
>004FBE7B    je          004FBEAE
 004FBE7D    test        byte ptr [ebx+1C],1
>004FBE81    jne         004FBEAE
 004FBE83    lea         ecx,[ebp-8]
 004FBE86    mov         edx,dword ptr [ebp-4]
 004FBE89    mov         eax,ebx
 004FBE8B    mov         esi,dword ptr [eax]
 004FBE8D    call        dword ptr [esi+118]
 004FBE93    test        al,al
>004FBE95    jne         004FBEAE
 004FBE97    mov         ecx,dword ptr ds:[78CCF8];^SResString242:TResStringRec
 004FBE9D    mov         dl,1
 004FBE9F    mov         eax,[004FB4B4];EDBEditError
 004FBEA4    call        Exception.CreateRes
 004FBEA9    call        @RaiseExcept
 004FBEAE    mov         edx,dword ptr [ebp-4]
 004FBEB1    mov         eax,ebx
 004FBEB3    call        TCustomMaskEdit.SetEditText
 004FBEB8    xor         eax,eax
 004FBEBA    pop         edx
 004FBEBB    pop         ecx
 004FBEBC    pop         ecx
 004FBEBD    mov         dword ptr fs:[eax],edx
 004FBEC0    push        4FBEE2
 004FBEC5    lea         eax,[ebp-10]
 004FBEC8    mov         edx,2
 004FBECD    call        @UStrArrayClr
 004FBED2    lea         eax,[ebp-4]
 004FBED5    call        @UStrClr
 004FBEDA    ret
>004FBEDB    jmp         @HandleFinally
>004FBEE0    jmp         004FBEC5
 004FBEE2    pop         esi
 004FBEE3    pop         ebx
 004FBEE4    mov         esp,ebp
 004FBEE6    pop         ebp
 004FBEE7    ret
*}
end;

//004FBEE8
procedure TCustomMaskEdit.WMCut(var Message:TMessage);
begin
{*
 004FBEE8    push        ebx
 004FBEE9    push        esi
 004FBEEA    push        edi
 004FBEEB    mov         esi,edx
 004FBEED    mov         ebx,eax
 004FBEEF    mov         eax,ebx
 004FBEF1    call        TCustomMaskEdit.GetMasked
 004FBEF6    test        al,al
>004FBEF8    jne         004FBF05
 004FBEFA    mov         edx,esi
 004FBEFC    mov         eax,ebx
 004FBEFE    mov         ecx,dword ptr [eax]
 004FBF00    call        dword ptr [ecx-10]
>004FBF03    jmp         004FBF5B
 004FBF05    mov         eax,ebx
 004FBF07    call        TCustomEdit.CopyToClipboard
 004FBF0C    mov         dx,2E
 004FBF10    mov         eax,ebx
 004FBF12    call        TCustomMaskEdit.DeleteKeys
 004FBF17    mov         eax,ebx
 004FBF19    call        TWinControl.HandleAllocated
 004FBF1E    test        al,al
>004FBF20    je          004FBF5B
 004FBF22    mov         eax,ebx
 004FBF24    call        TWinControl.GetHandle
 004FBF29    push        eax
 004FBF2A    call        user32.GetParent
 004FBF2F    mov         esi,eax
 004FBF31    mov         eax,ebx
 004FBF33    call        TWinControl.GetHandle
 004FBF38    push        eax
 004FBF39    call        user32.GetDlgCtrlID
 004FBF3E    movzx       edi,ax
 004FBF41    or          edi,3000000
 004FBF47    mov         eax,ebx
 004FBF49    call        TWinControl.GetHandle
 004FBF4E    push        eax
 004FBF4F    push        edi
 004FBF50    push        111
 004FBF55    push        esi
 004FBF56    call        user32.SendMessageW
 004FBF5B    pop         edi
 004FBF5C    pop         esi
 004FBF5D    pop         ebx
 004FBF5E    ret
*}
end;

//004FBF60
procedure TCustomMaskEdit.WMPaste(var Message:TMessage);
begin
{*
 004FBF60    push        ebp
 004FBF61    mov         ebp,esp
 004FBF63    add         esp,0FFFFFFF0
 004FBF66    push        ebx
 004FBF67    push        esi
 004FBF68    push        edi
 004FBF69    xor         ecx,ecx
 004FBF6B    mov         dword ptr [ebp-4],ecx
 004FBF6E    mov         dword ptr [ebp-8],ecx
 004FBF71    mov         esi,edx
 004FBF73    mov         ebx,eax
 004FBF75    xor         eax,eax
 004FBF77    push        ebp
 004FBF78    push        4FC082
 004FBF7D    push        dword ptr fs:[eax]
 004FBF80    mov         dword ptr fs:[eax],esp
 004FBF83    mov         eax,ebx
 004FBF85    call        TCustomMaskEdit.GetMasked
 004FBF8A    test        al,al
>004FBF8C    je          004FBF97
 004FBF8E    cmp         byte ptr [ebx+27C],0
>004FBF95    je          004FBFA5
 004FBF97    mov         edx,esi
 004FBF99    mov         eax,ebx
 004FBF9B    mov         ecx,dword ptr [eax]
 004FBF9D    call        dword ptr [ecx-10]
>004FBFA0    jmp         004FC067
 004FBFA5    call        Clipboard
 004FBFAA    mov         edx,dword ptr [eax]
 004FBFAC    call        dword ptr [edx+18]
 004FBFAF    call        Clipboard
 004FBFB4    lea         edx,[ebp-4]
 004FBFB7    call        TClipboard.GetAsText
 004FBFBC    call        Clipboard
 004FBFC1    mov         edx,dword ptr [eax]
 004FBFC3    call        dword ptr [edx+14]
 004FBFC6    lea         ecx,[ebp-10]
 004FBFC9    lea         edx,[ebp-0C]
 004FBFCC    mov         eax,ebx
 004FBFCE    call        TCustomMaskEdit.GetSel
 004FBFD3    lea         edx,[ebp-8]
 004FBFD6    mov         eax,ebx
 004FBFD8    call        TCustomMaskEdit.GetEditText
 004FBFDD    mov         eax,dword ptr [ebp-10]
 004FBFE0    sub         eax,dword ptr [ebp-0C]
 004FBFE3    push        eax
 004FBFE4    lea         edx,[ebp-8]
 004FBFE7    mov         ecx,dword ptr [ebp-0C]
 004FBFEA    mov         eax,ebx
 004FBFEC    call        TCustomMaskEdit.DeleteSelection
 004FBFF1    mov         edx,dword ptr [ebp-8]
 004FBFF4    mov         eax,ebx
 004FBFF6    call        TCustomMaskEdit.SetEditText
 004FBFFB    mov         eax,dword ptr [ebp-0C]
 004FBFFE    push        eax
 004FBFFF    lea         edx,[ebp-8]
 004FC002    mov         ecx,dword ptr [ebp-4]
 004FC005    mov         eax,ebx
 004FC007    call        TCustomMaskEdit.InputString
 004FC00C    mov         dword ptr [ebp-0C],eax
 004FC00F    mov         edx,dword ptr [ebp-8]
 004FC012    mov         eax,ebx
 004FC014    call        TCustomMaskEdit.SetEditText
 004FC019    mov         edx,dword ptr [ebp-0C]
 004FC01C    mov         eax,ebx
 004FC01E    call        TCustomMaskEdit.SetCursor
 004FC023    mov         eax,ebx
 004FC025    call        TWinControl.HandleAllocated
 004FC02A    test        al,al
>004FC02C    je          004FC067
 004FC02E    mov         eax,ebx
 004FC030    call        TWinControl.GetHandle
 004FC035    push        eax
 004FC036    call        user32.GetParent
 004FC03B    mov         esi,eax
 004FC03D    mov         eax,ebx
 004FC03F    call        TWinControl.GetHandle
 004FC044    push        eax
 004FC045    call        user32.GetDlgCtrlID
 004FC04A    movzx       edi,ax
 004FC04D    or          edi,3000000
 004FC053    mov         eax,ebx
 004FC055    call        TWinControl.GetHandle
 004FC05A    push        eax
 004FC05B    push        edi
 004FC05C    push        111
 004FC061    push        esi
 004FC062    call        user32.SendMessageW
 004FC067    xor         eax,eax
 004FC069    pop         edx
 004FC06A    pop         ecx
 004FC06B    pop         ecx
 004FC06C    mov         dword ptr fs:[eax],edx
 004FC06F    push        4FC089
 004FC074    lea         eax,[ebp-8]
 004FC077    mov         edx,2
 004FC07C    call        @UStrArrayClr
 004FC081    ret
>004FC082    jmp         @HandleFinally
>004FC087    jmp         004FC074
 004FC089    pop         edi
 004FC08A    pop         esi
 004FC08B    pop         ebx
 004FC08C    mov         esp,ebp
 004FC08E    pop         ebp
 004FC08F    ret
*}
end;

//004FC090
function TCustomMaskEdit.GetMasked:Boolean;
begin
{*
 004FC090    push        ebx
 004FC091    mov         ebx,eax
 004FC093    cmp         dword ptr [ebx+2A0],0
 004FC09A    setne       al
 004FC09D    pop         ebx
 004FC09E    ret
*}
end;

//004FC0A0
procedure TCustomMaskEdit.ReformatText(const NewMask:UnicodeString);
begin
{*
 004FC0A0    push        ebp
 004FC0A1    mov         ebp,esp
 004FC0A3    push        0
 004FC0A5    push        0
 004FC0A7    push        0
 004FC0A9    push        ebx
 004FC0AA    push        esi
 004FC0AB    push        edi
 004FC0AC    mov         edi,edx
 004FC0AE    mov         ebx,eax
 004FC0B0    xor         eax,eax
 004FC0B2    push        ebp
 004FC0B3    push        4FC15B
 004FC0B8    push        dword ptr fs:[eax]
 004FC0BB    mov         dword ptr fs:[eax],esp
 004FC0BE    lea         edx,[ebp-8]
 004FC0C1    mov         eax,ebx
 004FC0C3    call        TCustomMaskEdit.GetEditText
 004FC0C8    mov         edx,dword ptr [ebp-8]
 004FC0CB    lea         ecx,[ebp-4]
 004FC0CE    mov         eax,ebx
 004FC0D0    call        TCustomMaskEdit.RemoveEditFormat
 004FC0D5    lea         eax,[ebx+2A0]
 004FC0DB    mov         edx,edi
 004FC0DD    call        @UStrAsg
 004FC0E2    mov         esi,edi
 004FC0E4    test        esi,esi
>004FC0E6    je          004FC0ED
 004FC0E8    sub         esi,4
 004FC0EB    mov         esi,dword ptr [esi]
 004FC0ED    mov         edx,esi
 004FC0EF    mov         eax,dword ptr [ebx+2A0]
 004FC0F5    call        MaskOffsetToOffset
 004FC0FA    mov         dword ptr [ebx+2A8],eax
 004FC100    mov         eax,edi
 004FC102    call        MaskGetMaskSave
 004FC107    mov         byte ptr [ebx+2AC],al
 004FC10D    mov         eax,edi
 004FC10F    call        MaskGetMaskBlank
 004FC114    mov         word ptr [ebx+2A4],ax
 004FC11B    lea         eax,[ebp-0C]
 004FC11E    push        eax
 004FC11F    mov         cl,1
 004FC121    mov         edx,dword ptr [ebp-4]
 004FC124    mov         eax,ebx
 004FC126    call        TCustomMaskEdit.AddEditFormat
 004FC12B    mov         edx,dword ptr [ebp-0C]
 004FC12E    lea         eax,[ebp-4]
 004FC131    call        @UStrLAsg
 004FC136    mov         edx,dword ptr [ebp-4]
 004FC139    mov         eax,ebx
 004FC13B    call        TCustomMaskEdit.SetEditText
 004FC140    xor         eax,eax
 004FC142    pop         edx
 004FC143    pop         ecx
 004FC144    pop         ecx
 004FC145    mov         dword ptr fs:[eax],edx
 004FC148    push        4FC162
 004FC14D    lea         eax,[ebp-0C]
 004FC150    mov         edx,3
 004FC155    call        @UStrArrayClr
 004FC15A    ret
>004FC15B    jmp         @HandleFinally
>004FC160    jmp         004FC14D
 004FC162    pop         edi
 004FC163    pop         esi
 004FC164    pop         ebx
 004FC165    mov         esp,ebp
 004FC167    pop         ebp
 004FC168    ret
*}
end;

//004FC16C
procedure TCustomMaskEdit.SetEditMask(const Value:TEditMask);
begin
{*
 004FC16C    push        ebx
 004FC16D    push        esi
 004FC16E    add         esp,0FFFFFFF8
 004FC171    mov         esi,edx
 004FC173    mov         ebx,eax
 004FC175    mov         eax,esi
 004FC177    mov         edx,dword ptr [ebx+2A0]
 004FC17D    call        @UStrEqual
>004FC182    je          004FC230
 004FC188    test        byte ptr [ebx+1C],10
>004FC18C    je          004FC1A1
 004FC18E    test        esi,esi
>004FC190    je          004FC1A1
 004FC192    test        byte ptr [ebx+1C],1
>004FC196    jne         004FC1A1
 004FC198    xor         edx,edx
 004FC19A    mov         eax,ebx
 004FC19C    call        TCustomMaskEdit.SetEditText
 004FC1A1    mov         eax,ebx
 004FC1A3    call        TWinControl.HandleAllocated
 004FC1A8    test        al,al
>004FC1AA    je          004FC1B9
 004FC1AC    lea         ecx,[esp+4]
 004FC1B0    mov         edx,esp
 004FC1B2    mov         eax,ebx
 004FC1B4    call        TCustomMaskEdit.GetSel
 004FC1B9    mov         edx,esi
 004FC1BB    mov         eax,ebx
 004FC1BD    call        TCustomMaskEdit.ReformatText
 004FC1C2    and         byte ptr [ebx+2AD],0FE
 004FC1C9    cmp         dword ptr [ebx+2A0],0
>004FC1D0    je          004FC1D9
 004FC1D2    or          byte ptr [ebx+2AD],1
 004FC1D9    xor         edx,edx
 004FC1DB    mov         eax,ebx
 004FC1DD    call        TCustomEdit.SetMaxLength
 004FC1E2    mov         eax,ebx
 004FC1E4    call        TCustomMaskEdit.GetMasked
 004FC1E9    test        al,al
>004FC1EB    je          004FC203
 004FC1ED    cmp         dword ptr [ebx+2A8],0
>004FC1F4    jle         004FC203
 004FC1F6    mov         edx,dword ptr [ebx+2A8]
 004FC1FC    mov         eax,ebx
 004FC1FE    call        TCustomEdit.SetMaxLength
 004FC203    mov         eax,ebx
 004FC205    call        TWinControl.HandleAllocated
 004FC20A    test        al,al
>004FC20C    je          004FC230
 004FC20E    mov         eax,ebx
 004FC210    call        TWinControl.GetHandle
 004FC215    mov         esi,eax
 004FC217    call        user32.GetFocus
 004FC21C    cmp         esi,eax
>004FC21E    jne         004FC230
 004FC220    test        byte ptr [ebx+1C],10
>004FC224    jne         004FC230
 004FC226    mov         edx,dword ptr [esp]
 004FC229    mov         eax,ebx
 004FC22B    call        TCustomMaskEdit.SetCursor
 004FC230    pop         ecx
 004FC231    pop         edx
 004FC232    pop         esi
 004FC233    pop         ebx
 004FC234    ret
*}
end;

//004FC238
function TCustomMaskEdit.GetMaxLength:Integer;
begin
{*
 004FC238    mov         eax,dword ptr [eax+274]
 004FC23E    ret
*}
end;

//004FC240
procedure TCustomMaskEdit.SetMaxLength(Value:Integer);
begin
{*
 004FC240    push        ebx
 004FC241    push        esi
 004FC242    mov         esi,edx
 004FC244    mov         ebx,eax
 004FC246    mov         eax,ebx
 004FC248    call        TCustomMaskEdit.GetMasked
 004FC24D    test        al,al
>004FC24F    jne         004FC25D
 004FC251    mov         edx,esi
 004FC253    mov         eax,ebx
 004FC255    call        TCustomEdit.SetMaxLength
 004FC25A    pop         esi
 004FC25B    pop         ebx
 004FC25C    ret
 004FC25D    mov         edx,dword ptr [ebx+2A8]
 004FC263    mov         eax,ebx
 004FC265    call        TCustomEdit.SetMaxLength
 004FC26A    pop         esi
 004FC26B    pop         ebx
 004FC26C    ret
*}
end;

//004FC270
procedure TCustomMaskEdit.GetSel(var SelStart:Integer; var SelStop:Integer);
begin
{*
 004FC270    push        ebx
 004FC271    push        esi
 004FC272    push        edi
 004FC273    mov         edi,ecx
 004FC275    mov         esi,edx
 004FC277    mov         ebx,eax
 004FC279    push        edi
 004FC27A    push        esi
 004FC27B    push        0B0
 004FC280    mov         eax,ebx
 004FC282    call        TWinControl.GetHandle
 004FC287    push        eax
 004FC288    call        user32.SendMessageW
 004FC28D    pop         edi
 004FC28E    pop         esi
 004FC28F    pop         ebx
 004FC290    ret
*}
end;

//004FC294
procedure TCustomMaskEdit.SetSel(SelStart:Integer; SelStop:Integer);
begin
{*
 004FC294    push        ebx
 004FC295    push        esi
 004FC296    push        edi
 004FC297    mov         edi,ecx
 004FC299    mov         esi,edx
 004FC29B    mov         ebx,eax
 004FC29D    push        edi
 004FC29E    push        esi
 004FC29F    push        0B1
 004FC2A4    mov         eax,ebx
 004FC2A6    call        TWinControl.GetHandle
 004FC2AB    push        eax
 004FC2AC    call        user32.SendMessageW
 004FC2B1    pop         edi
 004FC2B2    pop         esi
 004FC2B3    pop         ebx
 004FC2B4    ret
*}
end;

//004FC2B8
procedure TCustomMaskEdit.SetCursor(Pos:Integer);
begin
{*
 004FC2B8    push        ebp
 004FC2B9    mov         ebp,esp
 004FC2BB    add         esp,0FFFFFDE0
 004FC2C1    push        ebx
 004FC2C2    push        esi
 004FC2C3    xor         ecx,ecx
 004FC2C5    mov         dword ptr [ebp-220],ecx
 004FC2CB    mov         dword ptr [ebp-21C],ecx
 004FC2D1    mov         dword ptr [ebp-218],ecx
 004FC2D7    mov         dword ptr [ebp-210],ecx
 004FC2DD    mov         dword ptr [ebp-20C],ecx
 004FC2E3    mov         ebx,edx
 004FC2E5    mov         dword ptr [ebp-4],eax
 004FC2E8    xor         eax,eax
 004FC2EA    push        ebp
 004FC2EB    push        4FC56D
 004FC2F0    push        dword ptr fs:[eax]
 004FC2F3    mov         dword ptr fs:[eax],esp
 004FC2F6    cmp         ebx,1
>004FC2F9    jl          004FC31B
 004FC2FB    lea         edx,[ebp-20C]
 004FC301    mov         eax,dword ptr [ebp-4]
 004FC304    call        TCustomMaskEdit.GetEditText
 004FC309    mov         eax,dword ptr [ebp-20C]
 004FC30F    mov         edx,ebx
 004FC311    call        ByteType
 004FC316    cmp         al,1
>004FC318    jne         004FC31B
 004FC31A    dec         ebx
 004FC31B    mov         dword ptr [ebp-8],ebx
 004FC31E    mov         eax,dword ptr [ebp-4]
 004FC321    call        TCustomMaskEdit.GetMasked
 004FC326    test        al,al
>004FC328    je          004FC4CC
 004FC32E    cmp         dword ptr [ebp-8],0
>004FC332    jge         004FC339
 004FC334    xor         eax,eax
 004FC336    mov         dword ptr [ebp-8],eax
 004FC339    mov         edx,dword ptr [ebp-8]
 004FC33C    mov         eax,dword ptr [ebp-4]
 004FC33F    call        TCustomMaskEdit.GetNextEditChar
 004FC344    mov         dword ptr [ebp-8],eax
 004FC347    mov         ebx,dword ptr [ebp-8]
 004FC34A    inc         ebx
 004FC34B    lea         edx,[ebp-210]
 004FC351    mov         eax,dword ptr [ebp-4]
 004FC354    call        TCustomMaskEdit.GetEditText
 004FC359    mov         eax,dword ptr [ebp-210]
 004FC35F    mov         dword ptr [ebp-214],eax
 004FC365    mov         eax,dword ptr [ebp-214]
 004FC36B    test        eax,eax
>004FC36D    je          004FC374
 004FC36F    sub         eax,4
 004FC372    mov         eax,dword ptr [eax]
 004FC374    cmp         ebx,eax
>004FC376    jge         004FC3A8
 004FC378    lea         edx,[ebp-218]
 004FC37E    mov         eax,dword ptr [ebp-4]
 004FC381    call        TCustomMaskEdit.GetEditText
 004FC386    mov         eax,dword ptr [ebp-218]
 004FC38C    movzx       eax,word ptr [eax+ebx*2-2]
 004FC391    cmp         ax,0D800
>004FC395    jb          004FC39D
 004FC397    cmp         ax,0DFFF
>004FC39B    jbe         004FC3A1
 004FC39D    xor         eax,eax
>004FC39F    jmp         004FC3A3
 004FC3A1    mov         al,1
 004FC3A3    test        al,al
>004FC3A5    je          004FC3A8
 004FC3A7    inc         ebx
 004FC3A8    mov         eax,dword ptr [ebp-4]
 004FC3AB    mov         eax,dword ptr [eax+2A8]
 004FC3B1    cmp         eax,dword ptr [ebp-8]
>004FC3B4    jg          004FC3BC
 004FC3B6    mov         dword ptr [ebp-8],eax
 004FC3B9    mov         ebx,dword ptr [ebp-8]
 004FC3BC    mov         ecx,ebx
 004FC3BE    mov         edx,ebx
 004FC3C0    mov         eax,dword ptr [ebp-4]
 004FC3C3    call        TCustomMaskEdit.SetSel
 004FC3C8    cmp         ebx,dword ptr [ebp-8]
>004FC3CB    je          004FC4BE
 004FC3D1    lea         eax,[ebp-108]
 004FC3D7    push        eax
 004FC3D8    call        user32.GetKeyboardState
 004FC3DD    mov         edx,100
 004FC3E2    lea         eax,[ebp-208]
 004FC3E8    mov         byte ptr [eax],0
 004FC3EB    inc         eax
 004FC3EC    dec         edx
>004FC3ED    jne         004FC3E8
 004FC3EF    mov         byte ptr [ebp-1F8],81
 004FC3F6    mov         eax,dword ptr [ebp-4]
 004FC3F9    mov         si,0FFC7
 004FC3FD    call        @CallDynaInst
 004FC402    and         eax,7F
 004FC405    movzx       eax,word ptr [eax*2+7868E8]
 004FC40D    mov         byte ptr [ebp+eax-208],81
 004FC415    lea         eax,[ebp-208]
 004FC41B    push        eax
 004FC41C    call        user32.SetKeyboardState
 004FC421    mov         eax,dword ptr [ebp-4]
 004FC424    mov         byte ptr [eax+2BC],1
 004FC42B    xor         eax,eax
 004FC42D    push        ebp
 004FC42E    push        4FC4AB
 004FC433    push        dword ptr fs:[eax]
 004FC436    mov         dword ptr fs:[eax],esp
 004FC439    push        1
 004FC43B    mov         eax,dword ptr [ebp-4]
 004FC43E    mov         si,0FFC7
 004FC442    call        @CallDynaInst
 004FC447    and         eax,7F
 004FC44A    movzx       eax,word ptr [eax*2+7868E8]
 004FC452    push        eax
 004FC453    push        100
 004FC458    mov         eax,dword ptr [ebp-4]
 004FC45B    call        TWinControl.GetHandle
 004FC460    push        eax
 004FC461    call        user32.SendMessageW
 004FC466    push        1
 004FC468    mov         eax,dword ptr [ebp-4]
 004FC46B    mov         si,0FFC7
 004FC46F    call        @CallDynaInst
 004FC474    and         eax,7F
 004FC477    movzx       eax,word ptr [eax*2+7868E8]
 004FC47F    push        eax
 004FC480    push        101
 004FC485    mov         eax,dword ptr [ebp-4]
 004FC488    call        TWinControl.GetHandle
 004FC48D    push        eax
 004FC48E    call        user32.SendMessageW
 004FC493    xor         eax,eax
 004FC495    pop         edx
 004FC496    pop         ecx
 004FC497    pop         ecx
 004FC498    mov         dword ptr fs:[eax],edx
 004FC49B    push        4FC4B2
 004FC4A0    mov         eax,dword ptr [ebp-4]
 004FC4A3    mov         byte ptr [eax+2BC],0
 004FC4AA    ret
>004FC4AB    jmp         @HandleFinally
>004FC4B0    jmp         004FC4A0
 004FC4B2    lea         eax,[ebp-108]
 004FC4B8    push        eax
 004FC4B9    call        user32.SetKeyboardState
 004FC4BE    mov         eax,dword ptr [ebp-4]
 004FC4C1    mov         edx,dword ptr [ebp-8]
 004FC4C4    mov         dword ptr [eax+2B0],edx
>004FC4CA    jmp         004FC53F
 004FC4CC    cmp         dword ptr [ebp-8],0
>004FC4D0    jge         004FC4D7
 004FC4D2    xor         eax,eax
 004FC4D4    mov         dword ptr [ebp-8],eax
 004FC4D7    lea         edx,[ebp-21C]
 004FC4DD    mov         eax,dword ptr [ebp-4]
 004FC4E0    call        TCustomMaskEdit.GetEditText
 004FC4E5    mov         eax,dword ptr [ebp-21C]
 004FC4EB    mov         dword ptr [ebp-214],eax
 004FC4F1    mov         eax,dword ptr [ebp-214]
 004FC4F7    test        eax,eax
>004FC4F9    je          004FC500
 004FC4FB    sub         eax,4
 004FC4FE    mov         eax,dword ptr [eax]
 004FC500    cmp         eax,dword ptr [ebp-8]
>004FC503    jg          004FC531
 004FC505    lea         edx,[ebp-220]
 004FC50B    mov         eax,dword ptr [ebp-4]
 004FC50E    call        TCustomMaskEdit.GetEditText
 004FC513    mov         eax,dword ptr [ebp-220]
 004FC519    mov         dword ptr [ebp-214],eax
 004FC51F    mov         eax,dword ptr [ebp-214]
 004FC525    test        eax,eax
>004FC527    je          004FC52E
 004FC529    sub         eax,4
 004FC52C    mov         eax,dword ptr [eax]
 004FC52E    mov         dword ptr [ebp-8],eax
 004FC531    mov         ecx,dword ptr [ebp-8]
 004FC534    mov         edx,dword ptr [ebp-8]
 004FC537    mov         eax,dword ptr [ebp-4]
 004FC53A    call        TCustomMaskEdit.SetSel
 004FC53F    xor         eax,eax
 004FC541    pop         edx
 004FC542    pop         ecx
 004FC543    pop         ecx
 004FC544    mov         dword ptr fs:[eax],edx
 004FC547    push        4FC574
 004FC54C    lea         eax,[ebp-220]
 004FC552    mov         edx,3
 004FC557    call        @UStrArrayClr
 004FC55C    lea         eax,[ebp-210]
 004FC562    mov         edx,2
 004FC567    call        @UStrArrayClr
 004FC56C    ret
>004FC56D    jmp         @HandleFinally
>004FC572    jmp         004FC54C
 004FC574    pop         esi
 004FC575    pop         ebx
 004FC576    mov         esp,ebp
 004FC578    pop         ebp
 004FC579    ret
*}
end;

//004FC57C
procedure TCustomMaskEdit.CheckCursor;
begin
{*
 004FC57C    push        ebx
 004FC57D    add         esp,0FFFFFFF8
 004FC580    mov         ebx,eax
 004FC582    mov         eax,ebx
 004FC584    call        TWinControl.HandleAllocated
 004FC589    test        al,al
>004FC58B    je          004FC5B8
 004FC58D    mov         eax,ebx
 004FC58F    call        TCustomMaskEdit.GetMasked
 004FC594    test        al,al
>004FC596    je          004FC5B8
 004FC598    lea         ecx,[esp+4]
 004FC59C    mov         edx,esp
 004FC59E    mov         eax,ebx
 004FC5A0    call        TCustomMaskEdit.GetSel
 004FC5A5    mov         eax,dword ptr [esp]
 004FC5A8    cmp         eax,dword ptr [esp+4]
>004FC5AC    jne         004FC5B8
 004FC5AE    mov         edx,dword ptr [esp]
 004FC5B1    mov         eax,ebx
 004FC5B3    call        TCustomMaskEdit.SetCursor
 004FC5B8    pop         ecx
 004FC5B9    pop         edx
 004FC5BA    pop         ebx
 004FC5BB    ret
*}
end;

//004FC5BC
procedure TCustomMaskEdit.Clear;
begin
{*
 004FC5BC    xor         edx,edx
 004FC5BE    call        TCustomMaskEdit.SetText
 004FC5C3    ret
*}
end;

//004FC5C4
{*function sub_004FC5C4:?;
begin
 004FC5C4    mov         al,1
 004FC5C6    ret
end;*}

//004FC5C8
procedure TCustomMaskEdit.Reset;
begin
{*
 004FC5C8    push        ebx
 004FC5C9    mov         ebx,eax
 004FC5CB    mov         eax,ebx
 004FC5CD    call        TCustomEdit.GetModified
 004FC5D2    test        al,al
>004FC5D4    je          004FC5EC
 004FC5D6    mov         edx,dword ptr [ebx+2B8]
 004FC5DC    mov         eax,ebx
 004FC5DE    call        TCustomMaskEdit.SetEditText
 004FC5E3    xor         edx,edx
 004FC5E5    mov         eax,ebx
 004FC5E7    call        TCustomEdit.SetModified
 004FC5EC    pop         ebx
 004FC5ED    ret
*}
end;

//004FC5F0
function TCustomMaskEdit.CharKeys(var CharCode:Char):Boolean;
begin
{*
 004FC5F0    push        ebp
 004FC5F1    mov         ebp,esp
 004FC5F3    add         esp,0FFFFFFCC
 004FC5F6    push        ebx
 004FC5F7    push        esi
 004FC5F8    xor         ecx,ecx
 004FC5FA    mov         dword ptr [ebp-30],ecx
 004FC5FD    mov         dword ptr [ebp-34],ecx
 004FC600    mov         dword ptr [ebp-4],ecx
 004FC603    mov         ebx,edx
 004FC605    mov         esi,eax
 004FC607    xor         eax,eax
 004FC609    push        ebp
 004FC60A    push        4FC7B9
 004FC60F    push        dword ptr fs:[eax]
 004FC612    mov         dword ptr fs:[eax],esp
 004FC615    mov         byte ptr [ebp-5],0
 004FC619    cmp         word ptr [ebx],1B
>004FC61D    jne         004FC62E
 004FC61F    mov         eax,esi
 004FC621    mov         edx,dword ptr [eax]
 004FC623    call        dword ptr [edx+114]
>004FC629    jmp         004FC796
 004FC62E    mov         eax,esi
 004FC630    mov         edx,dword ptr [eax]
 004FC632    call        dword ptr [edx+110]
 004FC638    test        al,al
>004FC63A    je          004FC796
 004FC640    cmp         byte ptr [esi+27C],0
>004FC647    jne         004FC796
 004FC64D    movzx       eax,word ptr [ebx]
 004FC650    cmp         ax,8
>004FC654    je          004FC796
 004FC65A    cmp         ax,0D
>004FC65E    jne         004FC66F
 004FC660    mov         eax,esi
 004FC662    mov         edx,dword ptr [eax]
 004FC664    call        dword ptr [edx+120]
>004FC66A    jmp         004FC796
 004FC66F    lea         ecx,[ebp-10]
 004FC672    lea         edx,[ebp-0C]
 004FC675    mov         eax,esi
 004FC677    call        TCustomMaskEdit.GetSel
 004FC67C    mov         eax,dword ptr [ebp-10]
 004FC67F    sub         eax,dword ptr [ebp-0C]
 004FC682    dec         eax
>004FC683    jle         004FC6A7
 004FC685    mov         dx,2E
 004FC689    mov         eax,esi
 004FC68B    call        TCustomMaskEdit.DeleteKeys
 004FC690    mov         edx,dword ptr [ebp-0C]
 004FC693    mov         eax,esi
 004FC695    call        TCustomMaskEdit.GetNextEditChar
 004FC69A    mov         dword ptr [ebp-0C],eax
 004FC69D    mov         edx,dword ptr [ebp-0C]
 004FC6A0    mov         eax,esi
 004FC6A2    call        TCustomMaskEdit.SetCursor
 004FC6A7    movzx       eax,word ptr [ebx]
 004FC6AA    cmp         ax,0D800
>004FC6AE    jb          004FC6B6
 004FC6B0    cmp         ax,0DFFF
>004FC6B4    jbe         004FC6BA
 004FC6B6    xor         eax,eax
>004FC6B8    jmp         004FC6BC
 004FC6BA    mov         al,1
 004FC6BC    test        al,al
>004FC6BE    je          004FC6F0
 004FC6C0    push        1
 004FC6C2    push        102
 004FC6C7    push        102
 004FC6CC    mov         eax,esi
 004FC6CE    call        TWinControl.GetHandle
 004FC6D3    push        eax
 004FC6D4    lea         eax,[ebp-2C]
 004FC6D7    push        eax
 004FC6D8    call        user32.PeekMessageW
 004FC6DD    test        eax,eax
>004FC6DF    je          004FC6F0
 004FC6E1    cmp         dword ptr [ebp-28],12
>004FC6E5    jne         004FC6F0
 004FC6E7    mov         eax,dword ptr [ebp-24]
 004FC6EA    push        eax
 004FC6EB    call        user32.PostQuitMessage
 004FC6F0    mov         edx,ebx
 004FC6F2    mov         ecx,dword ptr [ebp-0C]
 004FC6F5    mov         eax,esi
 004FC6F7    call        TCustomMaskEdit.InputChar
 004FC6FC    mov         byte ptr [ebp-5],al
 004FC6FF    cmp         byte ptr [ebp-5],0
>004FC703    je          004FC796
 004FC709    movzx       eax,word ptr [ebx]
 004FC70C    cmp         ax,0D800
>004FC710    jb          004FC718
 004FC712    cmp         ax,0DFFF
>004FC716    jbe         004FC71C
 004FC718    xor         eax,eax
>004FC71A    jmp         004FC71E
 004FC71C    mov         al,1
 004FC71E    test        al,al
>004FC720    je          004FC75B
 004FC722    lea         eax,[ebp-30]
 004FC725    movzx       edx,word ptr [ebp-24]
 004FC729    call        @UStrFromWChar
 004FC72E    mov         eax,dword ptr [ebp-30]
 004FC731    push        eax
 004FC732    lea         eax,[ebp-34]
 004FC735    movzx       edx,word ptr [ebx]
 004FC738    call        @UStrFromWChar
 004FC73D    mov         edx,dword ptr [ebp-34]
 004FC740    lea         eax,[ebp-4]
 004FC743    pop         ecx
 004FC744    call        @UStrCat3
 004FC749    mov         ecx,dword ptr [ebp-0C]
 004FC74C    add         ecx,2
 004FC74F    mov         edx,dword ptr [ebp-0C]
 004FC752    mov         eax,esi
 004FC754    call        TCustomMaskEdit.SetSel
>004FC759    jmp         004FC766
 004FC75B    lea         eax,[ebp-4]
 004FC75E    movzx       edx,word ptr [ebx]
 004FC761    call        @UStrFromWChar
 004FC766    mov         eax,dword ptr [ebp-4]
 004FC769    push        eax
 004FC76A    mov         eax,esi
 004FC76C    call        TWinControl.GetHandle
 004FC771    xor         ecx,ecx
 004FC773    mov         edx,0C2
 004FC778    call        SendTextMessage
 004FC77D    lea         ecx,[ebp-10]
 004FC780    lea         edx,[ebp-0C]
 004FC783    mov         eax,esi
 004FC785    call        TCustomMaskEdit.GetSel
 004FC78A    xor         ecx,ecx
 004FC78C    mov         edx,dword ptr [ebp-0C]
 004FC78F    mov         eax,esi
 004FC791    call        TCustomMaskEdit.CursorInc
 004FC796    xor         eax,eax
 004FC798    pop         edx
 004FC799    pop         ecx
 004FC79A    pop         ecx
 004FC79B    mov         dword ptr fs:[eax],edx
 004FC79E    push        4FC7C0
 004FC7A3    lea         eax,[ebp-34]
 004FC7A6    mov         edx,2
 004FC7AB    call        @UStrArrayClr
 004FC7B0    lea         eax,[ebp-4]
 004FC7B3    call        @UStrClr
 004FC7B8    ret
>004FC7B9    jmp         @HandleFinally
>004FC7BE    jmp         004FC7A3
 004FC7C0    movzx       eax,byte ptr [ebp-5]
 004FC7C4    pop         esi
 004FC7C5    pop         ebx
 004FC7C6    mov         esp,ebp
 004FC7C8    pop         ebp
 004FC7C9    ret
*}
end;

//004FC7CC
procedure TCustomMaskEdit.ArrowKeys(CharCode:Word; Shift:TShiftState);
begin
{*
 004FC7CC    push        ebp
 004FC7CD    mov         ebp,esp
 004FC7CF    add         esp,0FFFFFFEC
 004FC7D2    push        ebx
 004FC7D3    push        esi
 004FC7D4    xor         ebx,ebx
 004FC7D6    mov         dword ptr [ebp-14],ebx
 004FC7D9    mov         dword ptr [ebp-10],ebx
 004FC7DC    mov         word ptr [ebp-2],cx
 004FC7E0    mov         esi,edx
 004FC7E2    mov         ebx,eax
 004FC7E4    xor         eax,eax
 004FC7E6    push        ebp
 004FC7E7    push        4FC9B1
 004FC7EC    push        dword ptr fs:[eax]
 004FC7EF    mov         dword ptr fs:[eax],esp
 004FC7F2    test        byte ptr [ebp-2],4
>004FC7F6    jne         004FC996
 004FC7FC    lea         ecx,[ebp-0C]
 004FC7FF    lea         edx,[ebp-8]
 004FC802    mov         eax,ebx
 004FC804    call        TCustomMaskEdit.GetSel
 004FC809    test        byte ptr [ebp-2],1
>004FC80D    je          004FC8A3
 004FC813    cmp         si,27
>004FC817    jne         004FC858
 004FC819    inc         dword ptr [ebx+2B0]
 004FC81F    mov         eax,dword ptr [ebp-8]
 004FC822    inc         eax
 004FC823    cmp         eax,dword ptr [ebp-0C]
>004FC826    jne         004FC83B
 004FC828    mov         ecx,dword ptr [ebp-0C]
 004FC82B    mov         edx,dword ptr [ebp-8]
 004FC82E    mov         eax,ebx
 004FC830    call        TCustomMaskEdit.SetSel
 004FC835    inc         dword ptr [ebx+2B0]
 004FC83B    mov         eax,dword ptr [ebx+2A8]
 004FC841    cmp         eax,dword ptr [ebx+2B0]
>004FC847    jge         004FC996
 004FC84D    mov         dword ptr [ebx+2B0],eax
>004FC853    jmp         004FC996
 004FC858    dec         dword ptr [ebx+2B0]
 004FC85E    mov         eax,dword ptr [ebp-8]
 004FC861    add         eax,2
 004FC864    cmp         eax,dword ptr [ebp-0C]
>004FC867    jne         004FC889
 004FC869    mov         eax,dword ptr [ebx+2B0]
 004FC86F    cmp         eax,dword ptr [ebp-8]
>004FC872    jle         004FC889
 004FC874    mov         eax,dword ptr [ebp-8]
 004FC877    inc         eax
 004FC878    mov         ecx,eax
 004FC87A    mov         edx,eax
 004FC87C    mov         eax,ebx
 004FC87E    call        TCustomMaskEdit.SetSel
 004FC883    dec         dword ptr [ebx+2B0]
 004FC889    cmp         dword ptr [ebx+2B0],0
>004FC890    jge         004FC996
 004FC896    xor         eax,eax
 004FC898    mov         dword ptr [ebx+2B0],eax
>004FC89E    jmp         004FC996
 004FC8A3    mov         eax,dword ptr [ebp-0C]
 004FC8A6    sub         eax,dword ptr [ebp-8]
 004FC8A9    cmp         eax,1
>004FC8AC    jle         004FC926
 004FC8AE    cmp         eax,2
>004FC8B1    jne         004FC906
 004FC8B3    lea         edx,[ebp-10]
 004FC8B6    mov         eax,ebx
 004FC8B8    call        TCustomMaskEdit.GetEditText
 004FC8BD    mov         eax,dword ptr [ebp-10]
 004FC8C0    mov         edx,dword ptr [ebp-8]
 004FC8C3    movzx       eax,word ptr [eax+edx*2]
 004FC8C7    cmp         ax,0D800
>004FC8CB    jb          004FC8D3
 004FC8CD    cmp         ax,0DFFF
>004FC8D1    jbe         004FC8D7
 004FC8D3    xor         eax,eax
>004FC8D5    jmp         004FC8D9
 004FC8D7    mov         al,1
 004FC8D9    test        al,al
>004FC8DB    je          004FC906
 004FC8DD    cmp         si,25
>004FC8E1    jne         004FC8F2
 004FC8E3    mov         edx,dword ptr [ebp-8]
 004FC8E6    mov         eax,ebx
 004FC8E8    call        TCustomMaskEdit.CursorDec
>004FC8ED    jmp         004FC996
 004FC8F2    mov         ecx,2
 004FC8F7    mov         edx,dword ptr [ebp-8]
 004FC8FA    mov         eax,ebx
 004FC8FC    call        TCustomMaskEdit.CursorInc
>004FC901    jmp         004FC996
 004FC906    mov         eax,dword ptr [ebp-0C]
 004FC909    cmp         eax,dword ptr [ebx+2B0]
>004FC90F    jne         004FC917
 004FC911    dec         dword ptr [ebx+2B0]
 004FC917    mov         edx,dword ptr [ebx+2B0]
 004FC91D    mov         eax,ebx
 004FC91F    call        TCustomMaskEdit.SetCursor
>004FC924    jmp         004FC996
 004FC926    cmp         si,25
>004FC92A    jne         004FC938
 004FC92C    mov         edx,dword ptr [ebp-8]
 004FC92F    mov         eax,ebx
 004FC931    call        TCustomMaskEdit.CursorDec
>004FC936    jmp         004FC996
 004FC938    mov         eax,dword ptr [ebp-0C]
 004FC93B    cmp         eax,dword ptr [ebp-8]
>004FC93E    jne         004FC94C
 004FC940    mov         edx,dword ptr [ebp-8]
 004FC943    mov         eax,ebx
 004FC945    call        TCustomMaskEdit.SetCursor
>004FC94A    jmp         004FC996
 004FC94C    lea         edx,[ebp-14]
 004FC94F    mov         eax,ebx
 004FC951    call        TCustomMaskEdit.GetEditText
 004FC956    mov         eax,dword ptr [ebp-14]
 004FC959    mov         edx,dword ptr [ebp-8]
 004FC95C    movzx       eax,word ptr [eax+edx*2]
 004FC960    cmp         ax,0D800
>004FC964    jb          004FC96C
 004FC966    cmp         ax,0DFFF
>004FC96A    jbe         004FC970
 004FC96C    xor         eax,eax
>004FC96E    jmp         004FC972
 004FC970    mov         al,1
 004FC972    test        al,al
>004FC974    je          004FC987
 004FC976    mov         ecx,2
 004FC97B    mov         edx,dword ptr [ebp-8]
 004FC97E    mov         eax,ebx
 004FC980    call        TCustomMaskEdit.CursorInc
>004FC985    jmp         004FC996
 004FC987    mov         ecx,1
 004FC98C    mov         edx,dword ptr [ebp-8]
 004FC98F    mov         eax,ebx
 004FC991    call        TCustomMaskEdit.CursorInc
 004FC996    xor         eax,eax
 004FC998    pop         edx
 004FC999    pop         ecx
 004FC99A    pop         ecx
 004FC99B    mov         dword ptr fs:[eax],edx
 004FC99E    push        4FC9B8
 004FC9A3    lea         eax,[ebp-14]
 004FC9A6    mov         edx,2
 004FC9AB    call        @UStrArrayClr
 004FC9B0    ret
>004FC9B1    jmp         @HandleFinally
>004FC9B6    jmp         004FC9A3
 004FC9B8    pop         esi
 004FC9B9    pop         ebx
 004FC9BA    mov         esp,ebp
 004FC9BC    pop         ebp
 004FC9BD    ret
*}
end;

//004FC9C0
procedure TCustomMaskEdit.CursorInc(CursorPos:Integer; Incr:Integer);
begin
{*
 004FC9C0    push        ebx
 004FC9C1    push        esi
 004FC9C2    push        edi
 004FC9C3    mov         edi,edx
 004FC9C5    mov         esi,eax
 004FC9C7    lea         ebx,[ecx+edi]
 004FC9CA    mov         edx,ebx
 004FC9CC    mov         eax,esi
 004FC9CE    call        TCustomMaskEdit.GetNextEditChar
 004FC9D3    mov         ebx,eax
 004FC9D5    mov         edx,ebx
 004FC9D7    mov         eax,dword ptr [esi+2A0]
 004FC9DD    call        IsLiteralChar
 004FC9E2    test        al,al
>004FC9E4    je          004FC9E8
 004FC9E6    mov         ebx,edi
 004FC9E8    mov         edx,ebx
 004FC9EA    mov         eax,esi
 004FC9EC    call        TCustomMaskEdit.SetCursor
 004FC9F1    pop         edi
 004FC9F2    pop         esi
 004FC9F3    pop         ebx
 004FC9F4    ret
*}
end;

//004FC9F8
procedure TCustomMaskEdit.CursorDec(CursorPos:Integer);
begin
{*
 004FC9F8    push        ebx
 004FC9F9    mov         ebx,eax
 004FC9FB    mov         eax,edx
 004FC9FD    dec         eax
 004FC9FE    mov         edx,eax
 004FCA00    mov         eax,ebx
 004FCA02    call        TCustomMaskEdit.GetPriorEditChar
 004FCA07    mov         edx,eax
 004FCA09    mov         eax,ebx
 004FCA0B    call        TCustomMaskEdit.SetCursor
 004FCA10    pop         ebx
 004FCA11    ret
*}
end;

//004FCA14
function TCustomMaskEdit.GetNextEditChar(Offset:Integer):Integer;
begin
{*
 004FCA14    push        ebx
 004FCA15    push        esi
 004FCA16    mov         esi,eax
 004FCA18    mov         ebx,edx
>004FCA1A    jmp         004FCA1D
 004FCA1C    inc         ebx
 004FCA1D    cmp         ebx,dword ptr [esi+2A8]
>004FCA23    jge         004FCA36
 004FCA25    mov         edx,ebx
 004FCA27    mov         eax,dword ptr [esi+2A0]
 004FCA2D    call        IsLiteralChar
 004FCA32    test        al,al
>004FCA34    jne         004FCA1C
 004FCA36    mov         eax,ebx
 004FCA38    pop         esi
 004FCA39    pop         ebx
 004FCA3A    ret
*}
end;

//004FCA3C
function TCustomMaskEdit.GetPriorEditChar(Offset:Integer):Integer;
begin
{*
 004FCA3C    push        ebx
 004FCA3D    push        esi
 004FCA3E    mov         esi,eax
 004FCA40    mov         ebx,edx
>004FCA42    jmp         004FCA45
 004FCA44    dec         ebx
 004FCA45    test        ebx,ebx
>004FCA47    jl          004FCA5A
 004FCA49    mov         edx,ebx
 004FCA4B    mov         eax,dword ptr [esi+2A0]
 004FCA51    call        IsLiteralChar
 004FCA56    test        al,al
>004FCA58    jne         004FCA44
 004FCA5A    test        ebx,ebx
>004FCA5C    jge         004FCA69
 004FCA5E    mov         edx,ebx
 004FCA60    mov         eax,esi
 004FCA62    call        TCustomMaskEdit.GetNextEditChar
 004FCA67    mov         ebx,eax
 004FCA69    mov         eax,ebx
 004FCA6B    pop         esi
 004FCA6C    pop         ebx
 004FCA6D    ret
*}
end;

//004FCA70
procedure TCustomMaskEdit.HomeEndKeys(CharCode:Word; Shift:TShiftState);
begin
{*
 004FCA70    push        ebx
 004FCA71    push        esi
 004FCA72    add         esp,0FFFFFFF4
 004FCA75    mov         word ptr [esp],cx
 004FCA79    mov         esi,edx
 004FCA7B    mov         ebx,eax
 004FCA7D    lea         ecx,[esp+8]
 004FCA81    lea         edx,[esp+4]
 004FCA85    mov         eax,ebx
 004FCA87    call        TCustomMaskEdit.GetSel
 004FCA8C    cmp         si,24
>004FCA90    jne         004FCAE1
 004FCA92    test        byte ptr [esp],1
>004FCA96    je          004FCACE
 004FCA98    mov         eax,dword ptr [esp+4]
 004FCA9C    cmp         eax,dword ptr [ebx+2B0]
>004FCAA2    je          004FCAB8
 004FCAA4    mov         eax,dword ptr [esp+4]
 004FCAA8    inc         eax
 004FCAA9    cmp         eax,dword ptr [esp+8]
>004FCAAD    je          004FCAB8
 004FCAAF    mov         eax,dword ptr [esp+4]
 004FCAB3    inc         eax
 004FCAB4    mov         dword ptr [esp+8],eax
 004FCAB8    mov         ecx,dword ptr [esp+8]
 004FCABC    xor         edx,edx
 004FCABE    mov         eax,ebx
 004FCAC0    call        TCustomMaskEdit.SetSel
 004FCAC5    mov         eax,ebx
 004FCAC7    call        TCustomMaskEdit.CheckCursor
>004FCACC    jmp         004FCAD7
 004FCACE    xor         edx,edx
 004FCAD0    mov         eax,ebx
 004FCAD2    call        TCustomMaskEdit.SetCursor
 004FCAD7    xor         eax,eax
 004FCAD9    mov         dword ptr [ebx+2B0],eax
>004FCADF    jmp         004FCB3A
 004FCAE1    test        byte ptr [esp],1
>004FCAE5    je          004FCB21
 004FCAE7    mov         eax,dword ptr [esp+8]
 004FCAEB    cmp         eax,dword ptr [ebx+2B0]
>004FCAF1    je          004FCB07
 004FCAF3    mov         eax,dword ptr [esp+4]
 004FCAF7    inc         eax
 004FCAF8    cmp         eax,dword ptr [esp+8]
>004FCAFC    je          004FCB07
 004FCAFE    mov         eax,dword ptr [esp+8]
 004FCB02    dec         eax
 004FCB03    mov         dword ptr [esp+4],eax
 004FCB07    mov         ecx,dword ptr [ebx+2A8]
 004FCB0D    mov         edx,dword ptr [esp+4]
 004FCB11    mov         eax,ebx
 004FCB13    call        TCustomMaskEdit.SetSel
 004FCB18    mov         eax,ebx
 004FCB1A    call        TCustomMaskEdit.CheckCursor
>004FCB1F    jmp         004FCB2E
 004FCB21    mov         edx,dword ptr [ebx+2A8]
 004FCB27    mov         eax,ebx
 004FCB29    call        TCustomMaskEdit.SetCursor
 004FCB2E    mov         eax,dword ptr [ebx+2A8]
 004FCB34    mov         dword ptr [ebx+2B0],eax
 004FCB3A    add         esp,0C
 004FCB3D    pop         esi
 004FCB3E    pop         ebx
 004FCB3F    ret
*}
end;

//004FCB40
procedure TCustomMaskEdit.DeleteKeys(CharCode:Word);
begin
{*
 004FCB40    push        ebp
 004FCB41    mov         ebp,esp
 004FCB43    add         esp,0FFFFFFF4
 004FCB46    push        ebx
 004FCB47    push        esi
 004FCB48    push        edi
 004FCB49    xor         ecx,ecx
 004FCB4B    mov         dword ptr [ebp-4],ecx
 004FCB4E    mov         esi,edx
 004FCB50    mov         ebx,eax
 004FCB52    lea         edi,[ebp-8]
 004FCB55    xor         eax,eax
 004FCB57    push        ebp
 004FCB58    push        4FCC42
 004FCB5D    push        dword ptr fs:[eax]
 004FCB60    mov         dword ptr fs:[eax],esp
 004FCB63    cmp         byte ptr [ebx+27C],0
>004FCB6A    jne         004FCC2C
 004FCB70    lea         ecx,[ebp-0C]
 004FCB73    mov         edx,edi
 004FCB75    mov         eax,ebx
 004FCB77    call        TCustomMaskEdit.GetSel
 004FCB7C    mov         eax,dword ptr [ebp-0C]
 004FCB7F    sub         eax,dword ptr [edi]
 004FCB81    dec         eax
>004FCB82    jg          004FCBA9
 004FCB84    cmp         si,8
>004FCB88    jne         004FCBA9
 004FCB8A    mov         esi,dword ptr [edi]
 004FCB8C    mov         edx,dword ptr [edi]
 004FCB8E    mov         eax,ebx
 004FCB90    call        TCustomMaskEdit.CursorDec
 004FCB95    lea         ecx,[ebp-0C]
 004FCB98    mov         edx,edi
 004FCB9A    mov         eax,ebx
 004FCB9C    call        TCustomMaskEdit.GetSel
 004FCBA1    cmp         esi,dword ptr [edi]
>004FCBA3    je          004FCC2C
 004FCBA9    mov         eax,dword ptr [ebp-0C]
 004FCBAC    sub         eax,dword ptr [edi]
 004FCBAE    dec         eax
>004FCBAF    jl          004FCC2C
 004FCBB1    lea         edx,[ebp-4]
 004FCBB4    mov         eax,ebx
 004FCBB6    call        TCustomMaskEdit.GetEditText
 004FCBBB    mov         eax,dword ptr [ebp-0C]
 004FCBBE    sub         eax,dword ptr [edi]
 004FCBC0    push        eax
 004FCBC1    lea         edx,[ebp-4]
 004FCBC4    mov         ecx,dword ptr [edi]
 004FCBC6    mov         eax,ebx
 004FCBC8    call        TCustomMaskEdit.DeleteSelection
 004FCBCD    lea         eax,[ebp-4]
 004FCBD0    push        eax
 004FCBD1    mov         ecx,dword ptr [ebp-0C]
 004FCBD4    sub         ecx,dword ptr [edi]
 004FCBD6    mov         edx,dword ptr [edi]
 004FCBD8    inc         edx
 004FCBD9    mov         eax,dword ptr [ebp-4]
 004FCBDC    call        @UStrCopy
 004FCBE1    mov         eax,dword ptr [ebp-4]
 004FCBE4    push        eax
 004FCBE5    mov         eax,ebx
 004FCBE7    call        TWinControl.GetHandle
 004FCBEC    xor         ecx,ecx
 004FCBEE    mov         edx,0C2
 004FCBF3    call        SendTextMessage
 004FCBF8    mov         eax,dword ptr [ebp-0C]
 004FCBFB    sub         eax,dword ptr [edi]
 004FCBFD    dec         eax
>004FCBFE    je          004FCC16
 004FCC00    mov         edx,dword ptr [edi]
 004FCC02    mov         eax,ebx
 004FCC04    call        TCustomMaskEdit.GetNextEditChar
 004FCC09    mov         dword ptr [edi],eax
 004FCC0B    mov         edx,dword ptr [edi]
 004FCC0D    mov         eax,ebx
 004FCC0F    call        TCustomMaskEdit.SetCursor
>004FCC14    jmp         004FCC2C
 004FCC16    lea         ecx,[ebp-0C]
 004FCC19    mov         edx,edi
 004FCC1B    mov         eax,ebx
 004FCC1D    call        TCustomMaskEdit.GetSel
 004FCC22    mov         edx,dword ptr [edi]
 004FCC24    dec         edx
 004FCC25    mov         eax,ebx
 004FCC27    call        TCustomMaskEdit.SetCursor
 004FCC2C    xor         eax,eax
 004FCC2E    pop         edx
 004FCC2F    pop         ecx
 004FCC30    pop         ecx
 004FCC31    mov         dword ptr fs:[eax],edx
 004FCC34    push        4FCC49
 004FCC39    lea         eax,[ebp-4]
 004FCC3C    call        @UStrClr
 004FCC41    ret
>004FCC42    jmp         @HandleFinally
>004FCC47    jmp         004FCC39
 004FCC49    pop         edi
 004FCC4A    pop         esi
 004FCC4B    pop         ebx
 004FCC4C    mov         esp,ebp
 004FCC4E    pop         ebp
 004FCC4F    ret
*}
end;

//004FCC50
procedure TCustomMaskEdit.CMEnter(var Message:TCMEnter);
begin
{*
 004FCC50    push        ebp
 004FCC51    mov         ebp,esp
 004FCC53    push        0
 004FCC55    push        ebx
 004FCC56    push        esi
 004FCC57    mov         esi,edx
 004FCC59    mov         ebx,eax
 004FCC5B    xor         eax,eax
 004FCC5D    push        ebp
 004FCC5E    push        4FCCD3
 004FCC63    push        dword ptr fs:[eax]
 004FCC66    mov         dword ptr fs:[eax],esp
 004FCC69    mov         eax,ebx
 004FCC6B    call        TCustomMaskEdit.GetMasked
 004FCC70    test        al,al
>004FCC72    je          004FCCB4
 004FCC74    test        byte ptr [ebx+1C],10
>004FCC78    jne         004FCCB4
 004FCC7A    test        byte ptr [ebx+2AD],2
>004FCC81    jne         004FCCA4
 004FCC83    lea         edx,[ebp-4]
 004FCC86    mov         eax,ebx
 004FCC88    call        TCustomMaskEdit.GetEditText
 004FCC8D    mov         edx,dword ptr [ebp-4]
 004FCC90    lea         eax,[ebx+2B8]
 004FCC96    call        @UStrAsg
 004FCC9B    mov         edx,esi
 004FCC9D    mov         eax,ebx
 004FCC9F    call        TCustomEdit.CMEnter
 004FCCA4    and         byte ptr [ebx+2AD],0FD
 004FCCAB    mov         eax,ebx
 004FCCAD    call        TCustomMaskEdit.CheckCursor
>004FCCB2    jmp         004FCCBD
 004FCCB4    mov         edx,esi
 004FCCB6    mov         eax,ebx
 004FCCB8    call        TCustomEdit.CMEnter
 004FCCBD    xor         eax,eax
 004FCCBF    pop         edx
 004FCCC0    pop         ecx
 004FCCC1    pop         ecx
 004FCCC2    mov         dword ptr fs:[eax],edx
 004FCCC5    push        4FCCDA
 004FCCCA    lea         eax,[ebp-4]
 004FCCCD    call        @UStrClr
 004FCCD2    ret
>004FCCD3    jmp         @HandleFinally
>004FCCD8    jmp         004FCCCA
 004FCCDA    pop         esi
 004FCCDB    pop         ebx
 004FCCDC    pop         ecx
 004FCCDD    pop         ebp
 004FCCDE    ret
*}
end;

//004FCCE0
procedure TCustomMaskEdit.CMTextChanged(var Message:TMessage);
begin
{*
 004FCCE0    push        ebp
 004FCCE1    mov         ebp,esp
 004FCCE3    add         esp,0FFFFFFF4
 004FCCE6    push        ebx
 004FCCE7    xor         ecx,ecx
 004FCCE9    mov         dword ptr [ebp-0C],ecx
 004FCCEC    mov         ebx,eax
 004FCCEE    xor         eax,eax
 004FCCF0    push        ebp
 004FCCF1    push        4FCD61
 004FCCF6    push        dword ptr fs:[eax]
 004FCCF9    mov         dword ptr fs:[eax],esp
 004FCCFC    mov         eax,ebx
 004FCCFE    call        TCustomEdit.CMTextChanged
 004FCD03    lea         edx,[ebp-0C]
 004FCD06    mov         eax,ebx
 004FCD08    call        TCustomMaskEdit.GetEditText
 004FCD0D    mov         edx,dword ptr [ebp-0C]
 004FCD10    lea         eax,[ebx+2B8]
 004FCD16    call        @UStrAsg
 004FCD1B    mov         eax,ebx
 004FCD1D    call        TWinControl.HandleAllocated
 004FCD22    test        al,al
>004FCD24    je          004FCD4B
 004FCD26    lea         ecx,[ebp-8]
 004FCD29    lea         edx,[ebp-4]
 004FCD2C    mov         eax,ebx
 004FCD2E    call        TCustomMaskEdit.GetSel
 004FCD33    mov         edx,dword ptr [ebp-4]
 004FCD36    mov         eax,ebx
 004FCD38    call        TCustomMaskEdit.GetNextEditChar
 004FCD3D    cmp         eax,dword ptr [ebp-4]
>004FCD40    je          004FCD4B
 004FCD42    mov         edx,eax
 004FCD44    mov         eax,ebx
 004FCD46    call        TCustomMaskEdit.SetCursor
 004FCD4B    xor         eax,eax
 004FCD4D    pop         edx
 004FCD4E    pop         ecx
 004FCD4F    pop         ecx
 004FCD50    mov         dword ptr fs:[eax],edx
 004FCD53    push        4FCD68
 004FCD58    lea         eax,[ebp-0C]
 004FCD5B    call        @UStrClr
 004FCD60    ret
>004FCD61    jmp         @HandleFinally
>004FCD66    jmp         004FCD58
 004FCD68    pop         ebx
 004FCD69    mov         esp,ebp
 004FCD6B    pop         ebp
 004FCD6C    ret
*}
end;

//004FCD70
procedure TCustomMaskEdit.CMWantSpecialKey(var Message:TCMWantSpecialKey);
begin
{*
 004FCD70    push        ebx
 004FCD71    push        esi
 004FCD72    mov         esi,edx
 004FCD74    mov         ebx,eax
 004FCD76    mov         edx,esi
 004FCD78    mov         eax,ebx
 004FCD7A    mov         ecx,dword ptr [eax]
 004FCD7C    call        dword ptr [ecx-10]
 004FCD7F    cmp         word ptr [esi+4],1B
>004FCD84    jne         004FCDA3
 004FCD86    mov         eax,ebx
 004FCD88    call        TCustomMaskEdit.GetMasked
 004FCD8D    test        al,al
>004FCD8F    je          004FCDA3
 004FCD91    mov         eax,ebx
 004FCD93    call        TCustomEdit.GetModified
 004FCD98    test        al,al
>004FCD9A    je          004FCDA3
 004FCD9C    mov         dword ptr [esi+0C],1
 004FCDA3    pop         esi
 004FCDA4    pop         ebx
 004FCDA5    ret
*}
end;

//004FCDA8
procedure TCustomMaskEdit.CMExit(var Message:TCMExit);
begin
{*
 004FCDA8    push        ebx
 004FCDA9    push        esi
 004FCDAA    mov         esi,edx
 004FCDAC    mov         ebx,eax
 004FCDAE    mov         eax,ebx
 004FCDB0    call        TCustomMaskEdit.GetMasked
 004FCDB5    test        al,al
>004FCDB7    je          004FCDD0
 004FCDB9    test        byte ptr [ebx+1C],10
>004FCDBD    jne         004FCDD0
 004FCDBF    mov         eax,ebx
 004FCDC1    mov         edx,dword ptr [eax]
 004FCDC3    call        dword ptr [edx+120]
 004FCDC9    mov         eax,ebx
 004FCDCB    call        TCustomMaskEdit.CheckCursor
 004FCDD0    mov         edx,esi
 004FCDD2    mov         eax,ebx
 004FCDD4    call        TWinControl.CMExit
 004FCDD9    pop         esi
 004FCDDA    pop         ebx
 004FCDDB    ret
*}
end;

//004FCDDC
procedure TCustomMaskEdit.ValidateEdit;
begin
{*
 004FCDDC    push        ebp
 004FCDDD    mov         ebp,esp
 004FCDDF    add         esp,0FFFFFFF8
 004FCDE2    push        ebx
 004FCDE3    push        esi
 004FCDE4    xor         edx,edx
 004FCDE6    mov         dword ptr [ebp-4],edx
 004FCDE9    mov         esi,eax
 004FCDEB    xor         eax,eax
 004FCDED    push        ebp
 004FCDEE    push        4FCE6E
 004FCDF3    push        dword ptr fs:[eax]
 004FCDF6    mov         dword ptr fs:[eax],esp
 004FCDF9    lea         edx,[ebp-4]
 004FCDFC    mov         eax,esi
 004FCDFE    call        TCustomMaskEdit.GetEditText
 004FCE03    mov         eax,esi
 004FCE05    call        TCustomMaskEdit.GetMasked
 004FCE0A    test        al,al
>004FCE0C    je          004FCE58
 004FCE0E    mov         eax,esi
 004FCE10    call        TCustomEdit.GetModified
 004FCE15    test        al,al
>004FCE17    je          004FCE58
 004FCE19    lea         ecx,[ebp-8]
 004FCE1C    mov         edx,dword ptr [ebp-4]
 004FCE1F    mov         eax,esi
 004FCE21    mov         ebx,dword ptr [eax]
 004FCE23    call        dword ptr [ebx+118]
 004FCE29    test        al,al
>004FCE2B    jne         004FCE58
 004FCE2D    test        byte ptr [esi+1C],10
>004FCE31    jne         004FCE44
 004FCE33    or          byte ptr [esi+2AD],2
 004FCE3A    mov         eax,esi
 004FCE3C    mov         edx,dword ptr [eax]
 004FCE3E    call        dword ptr [edx+0E8]
 004FCE44    mov         edx,dword ptr [ebp-8]
 004FCE47    mov         eax,esi
 004FCE49    call        TCustomMaskEdit.SetCursor
 004FCE4E    mov         eax,esi
 004FCE50    mov         edx,dword ptr [eax]
 004FCE52    call        dword ptr [edx+11C]
 004FCE58    xor         eax,eax
 004FCE5A    pop         edx
 004FCE5B    pop         ecx
 004FCE5C    pop         ecx
 004FCE5D    mov         dword ptr fs:[eax],edx
 004FCE60    push        4FCE75
 004FCE65    lea         eax,[ebp-4]
 004FCE68    call        @UStrClr
 004FCE6D    ret
>004FCE6E    jmp         @HandleFinally
>004FCE73    jmp         004FCE65
 004FCE75    pop         esi
 004FCE76    pop         ebx
 004FCE77    pop         ecx
 004FCE78    pop         ecx
 004FCE79    pop         ebp
 004FCE7A    ret
*}
end;

//004FCE7C
procedure TCustomMaskEdit.ValidateError;
begin
{*
 004FCE7C    push        ebx
 004FCE7D    add         esp,0FFFFFFF8
 004FCE80    mov         ebx,eax
 004FCE82    push        0
 004FCE84    call        user32.MessageBeep
 004FCE89    mov         eax,dword ptr [ebx+2A0]
 004FCE8F    mov         dword ptr [esp],eax
 004FCE92    mov         byte ptr [esp+4],11
 004FCE97    push        esp
 004FCE98    push        0
 004FCE9A    mov         ecx,dword ptr ds:[78D9E0];^SResString243:TResStringRec
 004FCEA0    mov         dl,1
 004FCEA2    mov         eax,[004FB4B4];EDBEditError
 004FCEA7    call        Exception.CreateResFmt
 004FCEAC    call        @RaiseExcept
 004FCEB1    pop         ecx
 004FCEB2    pop         edx
 004FCEB3    pop         ebx
 004FCEB4    ret
*}
end;

//004FCEB8
function TCustomMaskEdit.AddEditFormat(const Value:UnicodeString; Active:Boolean):UnicodeString;
begin
{*
 004FCEB8    push        ebp
 004FCEB9    mov         ebp,esp
 004FCEBB    push        ecx
 004FCEBC    push        ebx
 004FCEBD    push        esi
 004FCEBE    push        edi
 004FCEBF    mov         byte ptr [ebp-1],cl
 004FCEC2    mov         esi,edx
 004FCEC4    mov         ebx,eax
 004FCEC6    mov         edi,dword ptr [ebp+8]
 004FCEC9    cmp         byte ptr [ebp-1],0
>004FCECD    jne         004FCEE3
 004FCECF    push        edi
 004FCED0    mov         cx,20
 004FCED4    mov         edx,esi
 004FCED6    mov         eax,dword ptr [ebx+2A0]
 004FCEDC    call        MaskDoFormatText
>004FCEE1    jmp         004FCEF8
 004FCEE3    push        edi
 004FCEE4    movzx       ecx,word ptr [ebx+2A4]
 004FCEEB    mov         edx,esi
 004FCEED    mov         eax,dword ptr [ebx+2A0]
 004FCEF3    call        MaskDoFormatText
 004FCEF8    pop         edi
 004FCEF9    pop         esi
 004FCEFA    pop         ebx
 004FCEFB    pop         ecx
 004FCEFC    pop         ebp
 004FCEFD    ret         4
*}
end;

//004FCF00
function TCustomMaskEdit.RemoveEditFormat(const Value:UnicodeString):UnicodeString;
begin
{*
 004FCF00    push        ebp
 004FCF01    mov         ebp,esp
 004FCF03    add         esp,0FFFFFFE0
 004FCF06    push        ebx
 004FCF07    push        esi
 004FCF08    push        edi
 004FCF09    xor         ebx,ebx
 004FCF0B    mov         dword ptr [ebp-20],ebx
 004FCF0E    mov         dword ptr [ebp-4],ebx
 004FCF11    mov         esi,ecx
 004FCF13    mov         ebx,edx
 004FCF15    mov         dword ptr [ebp-8],eax
 004FCF18    xor         eax,eax
 004FCF1A    push        ebp
 004FCF1B    push        4FD117
 004FCF20    push        dword ptr fs:[eax]
 004FCF23    mov         dword ptr fs:[eax],esp
 004FCF26    mov         dword ptr [ebp-10],1
 004FCF2D    mov         eax,esi
 004FCF2F    mov         edx,ebx
 004FCF31    call        @UStrAsg
 004FCF36    mov         eax,dword ptr [ebp-8]
 004FCF39    mov         eax,dword ptr [eax+2A0]
 004FCF3F    test        eax,eax
>004FCF41    je          004FCF48
 004FCF43    sub         eax,4
 004FCF46    mov         eax,dword ptr [eax]
 004FCF48    mov         ebx,eax
 004FCF4A    test        ebx,ebx
>004FCF4C    jle         004FCFCB
 004FCF4E    mov         dword ptr [ebp-14],1
 004FCF55    mov         eax,dword ptr [ebp-8]
 004FCF58    mov         eax,dword ptr [eax+2A0]
 004FCF5E    mov         edx,dword ptr [ebp-14]
 004FCF61    call        MaskGetCharType
 004FCF66    mov         byte ptr [ebp-15],al
 004FCF69    movzx       eax,byte ptr [ebp-15]
 004FCF6D    dec         eax
 004FCF6E    sub         al,2
>004FCF70    jae         004FCFB8
 004FCF72    lea         eax,[ebp-4]
 004FCF75    push        eax
 004FCF76    mov         ecx,dword ptr [ebp-10]
 004FCF79    dec         ecx
 004FCF7A    mov         eax,dword ptr [esi]
 004FCF7C    mov         edx,1
 004FCF81    call        @UStrCopy
 004FCF86    mov         eax,dword ptr [esi]
 004FCF88    mov         dword ptr [ebp-1C],eax
 004FCF8B    mov         edi,dword ptr [ebp-1C]
 004FCF8E    test        edi,edi
>004FCF90    je          004FCF97
 004FCF92    sub         edi,4
 004FCF95    mov         edi,dword ptr [edi]
 004FCF97    lea         eax,[ebp-20]
 004FCF9A    push        eax
 004FCF9B    mov         ecx,edi
 004FCF9D    sub         ecx,dword ptr [ebp-10]
 004FCFA0    mov         edx,dword ptr [ebp-10]
 004FCFA3    inc         edx
 004FCFA4    mov         eax,dword ptr [esi]
 004FCFA6    call        @UStrCopy
 004FCFAB    mov         ecx,dword ptr [ebp-20]
 004FCFAE    mov         eax,esi
 004FCFB0    mov         edx,dword ptr [ebp-4]
 004FCFB3    call        @UStrCat3
 004FCFB8    movzx       eax,byte ptr [ebp-15]
 004FCFBC    add         al,0FC
 004FCFBE    sub         al,2
>004FCFC0    jae         004FCFC5
 004FCFC2    inc         dword ptr [ebp-10]
 004FCFC5    inc         dword ptr [ebp-14]
 004FCFC8    dec         ebx
>004FCFC9    jne         004FCF55
 004FCFCB    mov         eax,dword ptr [ebp-8]
 004FCFCE    mov         eax,dword ptr [eax+2A0]
 004FCFD4    mov         edx,1
 004FCFD9    call        MaskGetCurrentDirectives
 004FCFDE    mov         ebx,eax
 004FCFE0    test        bl,1
>004FCFE3    je          004FD04C
 004FCFE5    mov         dword ptr [ebp-10],1
 004FCFEC    mov         eax,dword ptr [esi]
 004FCFEE    mov         dword ptr [ebp-1C],eax
 004FCFF1    mov         eax,dword ptr [ebp-1C]
 004FCFF4    test        eax,eax
>004FCFF6    je          004FCFFD
 004FCFF8    sub         eax,4
 004FCFFB    mov         eax,dword ptr [eax]
 004FCFFD    mov         ebx,eax
 004FCFFF    test        ebx,ebx
>004FD001    jle         004FD022
 004FD003    mov         edi,1
 004FD008    mov         eax,dword ptr [esi]
 004FD00A    movzx       eax,word ptr [eax+edi*2-2]
 004FD00F    mov         edx,dword ptr [ebp-8]
 004FD012    cmp         ax,word ptr [edx+2A4]
>004FD019    jne         004FD022
 004FD01B    inc         dword ptr [ebp-10]
 004FD01E    inc         edi
 004FD01F    dec         ebx
>004FD020    jne         004FD008
 004FD022    cmp         dword ptr [ebp-10],1
>004FD026    je          004FD0A2
 004FD028    mov         eax,dword ptr [esi]
 004FD02A    mov         dword ptr [ebp-1C],eax
 004FD02D    mov         ebx,dword ptr [ebp-1C]
 004FD030    test        ebx,ebx
>004FD032    je          004FD039
 004FD034    sub         ebx,4
 004FD037    mov         ebx,dword ptr [ebx]
 004FD039    push        esi
 004FD03A    mov         ecx,ebx
 004FD03C    sub         ecx,dword ptr [ebp-10]
 004FD03F    inc         ecx
 004FD040    mov         eax,dword ptr [esi]
 004FD042    mov         edx,dword ptr [ebp-10]
 004FD045    call        @UStrCopy
>004FD04A    jmp         004FD0A2
 004FD04C    mov         eax,dword ptr [esi]
 004FD04E    mov         dword ptr [ebp-1C],eax
 004FD051    mov         eax,dword ptr [ebp-1C]
 004FD054    test        eax,eax
>004FD056    je          004FD05D
 004FD058    sub         eax,4
 004FD05B    mov         eax,dword ptr [eax]
 004FD05D    mov         dword ptr [ebp-0C],eax
 004FD060    mov         ebx,dword ptr [ebp-0C]
 004FD063    test        ebx,ebx
>004FD065    jle         004FD0A2
 004FD067    mov         edi,1
 004FD06C    mov         eax,dword ptr [ebp-0C]
 004FD06F    sub         eax,edi
 004FD071    mov         edx,dword ptr [esi]
 004FD073    movzx       eax,word ptr [edx+eax*2]
 004FD077    mov         edx,dword ptr [ebp-8]
 004FD07A    cmp         ax,word ptr [edx+2A4]
>004FD081    jne         004FD0A2
 004FD083    mov         eax,dword ptr [esi]
 004FD085    mov         dword ptr [ebp-1C],eax
 004FD088    mov         eax,dword ptr [ebp-1C]
 004FD08B    test        eax,eax
>004FD08D    je          004FD094
 004FD08F    sub         eax,4
 004FD092    mov         eax,dword ptr [eax]
 004FD094    mov         edx,eax
 004FD096    dec         edx
 004FD097    mov         eax,esi
 004FD099    call        @UStrSetLength
 004FD09E    inc         edi
 004FD09F    dec         ebx
>004FD0A0    jne         004FD06C
 004FD0A2    mov         eax,dword ptr [ebp-8]
 004FD0A5    cmp         word ptr [eax+2A4],20
>004FD0AD    je          004FD0F9
 004FD0AF    mov         eax,dword ptr [esi]
 004FD0B1    mov         dword ptr [ebp-1C],eax
 004FD0B4    mov         eax,dword ptr [ebp-1C]
 004FD0B7    test        eax,eax
>004FD0B9    je          004FD0C0
 004FD0BB    sub         eax,4
 004FD0BE    mov         eax,dword ptr [eax]
 004FD0C0    mov         dword ptr [ebp-0C],eax
 004FD0C3    mov         ebx,dword ptr [ebp-0C]
 004FD0C6    test        ebx,ebx
>004FD0C8    jle         004FD0F9
 004FD0CA    mov         edi,1
 004FD0CF    mov         eax,dword ptr [esi]
 004FD0D1    movzx       eax,word ptr [eax+edi*2-2]
 004FD0D6    mov         edx,dword ptr [ebp-8]
 004FD0D9    cmp         ax,word ptr [edx+2A4]
>004FD0E0    jne         004FD0F0
 004FD0E2    mov         eax,esi
 004FD0E4    call        @UniqueStringU
 004FD0E9    mov         word ptr [eax+edi*2-2],20
 004FD0F0    cmp         edi,dword ptr [ebp-0C]
>004FD0F3    jg          004FD0F9
 004FD0F5    inc         edi
 004FD0F6    dec         ebx
>004FD0F7    jne         004FD0CF
 004FD0F9    xor         eax,eax
 004FD0FB    pop         edx
 004FD0FC    pop         ecx
 004FD0FD    pop         ecx
 004FD0FE    mov         dword ptr fs:[eax],edx
 004FD101    push        4FD11E
 004FD106    lea         eax,[ebp-20]
 004FD109    call        @UStrClr
 004FD10E    lea         eax,[ebp-4]
 004FD111    call        @UStrClr
 004FD116    ret
>004FD117    jmp         @HandleFinally
>004FD11C    jmp         004FD106
 004FD11E    pop         edi
 004FD11F    pop         esi
 004FD120    pop         ebx
 004FD121    mov         esp,ebp
 004FD123    pop         ebp
 004FD124    ret
*}
end;

//004FD128
function TCustomMaskEdit.InputChar(var NewChar:Char; Offset:Integer):Boolean;
begin
{*
 004FD128    push        ebx
 004FD129    push        esi
 004FD12A    push        edi
 004FD12B    push        ebp
 004FD12C    push        ecx
 004FD12D    mov         edi,ecx
 004FD12F    mov         ebp,edx
 004FD131    mov         esi,eax
 004FD133    mov         bl,1
 004FD135    cmp         dword ptr [esi+2A0],0
>004FD13C    je          004FD1B5
 004FD13E    xor         ebx,ebx
 004FD140    mov         edx,edi
 004FD142    mov         eax,dword ptr [esi+2A0]
 004FD148    call        OffsetToMaskOffset
 004FD14D    mov         edi,eax
 004FD14F    test        edi,edi
>004FD151    jl          004FD1B5
 004FD153    mov         edx,edi
 004FD155    mov         eax,dword ptr [esi+2A0]
 004FD15B    call        MaskGetCharType
 004FD160    mov         byte ptr [esp],al
 004FD163    movzx       eax,word ptr [ebp]
 004FD167    mov         word ptr [esp+2],ax
 004FD16C    mov         edx,ebp
 004FD16E    mov         ecx,edi
 004FD170    mov         eax,esi
 004FD172    call        TCustomMaskEdit.DoInputChar
 004FD177    mov         ebx,eax
 004FD179    test        bl,bl
>004FD17B    jne         004FD1B5
 004FD17D    movzx       eax,byte ptr [esp]
 004FD181    add         al,0FC
 004FD183    sub         al,2
>004FD185    jae         004FD1B5
 004FD187    movzx       ecx,word ptr [esp+2]
 004FD18C    mov         edx,edi
 004FD18E    mov         eax,esi
 004FD190    call        TCustomMaskEdit.FindLiteralChar
 004FD195    mov         edi,eax
 004FD197    test        edi,edi
>004FD199    jle         004FD1B5
 004FD19B    mov         edx,edi
 004FD19D    mov         eax,dword ptr [esi+2A0]
 004FD1A3    call        MaskOffsetToOffset
 004FD1A8    mov         edi,eax
 004FD1AA    mov         edx,edi
 004FD1AC    mov         eax,esi
 004FD1AE    call        TCustomMaskEdit.SetCursor
>004FD1B3    jmp         004FD1C0
 004FD1B5    test        bl,bl
>004FD1B7    jne         004FD1C0
 004FD1B9    push        0
 004FD1BB    call        user32.MessageBeep
 004FD1C0    mov         eax,ebx
 004FD1C2    pop         edx
 004FD1C3    pop         ebp
 004FD1C4    pop         edi
 004FD1C5    pop         esi
 004FD1C6    pop         ebx
 004FD1C7    ret
*}
end;

//004FD1C8
function IsKatakana(const Chr:Byte):Boolean;
begin
{*
 004FD1C8    mov         edx,dword ptr ds:[78DB7C];SysLocale:TSysLocale
 004FD1CE    cmp         dword ptr [edx+4],11
>004FD1D2    jne         004FD1DA
 004FD1D4    add         al,5F
 004FD1D6    sub         al,3F
>004FD1D8    jb          004FD1DD
 004FD1DA    xor         eax,eax
 004FD1DC    ret
 004FD1DD    mov         al,1
 004FD1DF    ret
*}
end;

//004FD1E0
function TestChar(NewChar:Char):Boolean;
begin
{*
 004FD1E0    push        ebp
 004FD1E1    mov         ebp,esp
 004FD1E3    push        ecx
 004FD1E4    push        ebx
 004FD1E5    mov         eax,dword ptr [ebp+8]
 004FD1E8    mov         eax,dword ptr [eax-4]
 004FD1EB    mov         eax,dword ptr [eax+2A0]
 004FD1F1    mov         dword ptr [ebp-4],eax
 004FD1F4    mov         eax,dword ptr [ebp-4]
 004FD1F7    test        eax,eax
>004FD1F9    je          004FD200
 004FD1FB    sub         eax,4
 004FD1FE    mov         eax,dword ptr [eax]
 004FD200    mov         edx,dword ptr [ebp+8]
 004FD203    cmp         eax,dword ptr [edx-8]
>004FD206    jle         004FD264
 004FD208    mov         eax,dword ptr [ebp+8]
 004FD20B    mov         eax,dword ptr [eax-8]
 004FD20E    mov         edx,dword ptr [ebp+8]
 004FD211    mov         edx,dword ptr [edx-4]
 004FD214    mov         edx,dword ptr [edx+2A0]
 004FD21A    movzx       edx,word ptr [edx+eax*2-2]
 004FD21F    mov         eax,edx
 004FD221    mov         ecx,edx
 004FD223    add         ecx,0FFFFFF9F
 004FD226    sub         cx,1A
>004FD22A    jae         004FD232
 004FD22C    mov         eax,edx
 004FD22E    and         ax,0FFDF
 004FD232    mov         edx,dword ptr [ebp+8]
 004FD235    mov         edx,dword ptr [edx-8]
 004FD238    mov         ecx,dword ptr [ebp+8]
 004FD23B    mov         ecx,dword ptr [ecx-4]
 004FD23E    mov         ecx,dword ptr [ecx+2A0]
 004FD244    movzx       edx,word ptr [ecx+edx*2]
 004FD248    mov         ecx,edx
 004FD24A    mov         ebx,edx
 004FD24C    add         ebx,0FFFFFF9F
 004FD24F    sub         bx,1A
>004FD253    jae         004FD25C
 004FD255    mov         ecx,edx
 004FD257    and         cx,0FFDF
 004FD25C    cmp         cx,ax
 004FD25F    sete        al
>004FD262    jmp         004FD266
 004FD264    xor         eax,eax
 004FD266    xor         al,1
 004FD268    pop         ebx
 004FD269    pop         ecx
 004FD26A    pop         ebp
 004FD26B    ret
*}
end;

//004FD26C
function TCustomMaskEdit.DoInputChar(var NewChar:Char; MaskOffset:Integer):Boolean;
begin
{*
 004FD26C    push        ebp
 004FD26D    mov         ebp,esp
 004FD26F    push        0
 004FD271    push        0
 004FD273    push        0
 004FD275    push        0
 004FD277    push        0
 004FD279    push        0
 004FD27B    push        0
 004FD27D    push        0
 004FD27F    push        ebx
 004FD280    push        esi
 004FD281    push        edi
 004FD282    mov         dword ptr [ebp-8],ecx
 004FD285    mov         esi,edx
 004FD287    mov         dword ptr [ebp-4],eax
 004FD28A    xor         eax,eax
 004FD28C    push        ebp
 004FD28D    push        4FD538
 004FD292    push        dword ptr fs:[eax]
 004FD295    mov         dword ptr fs:[eax],esp
 004FD298    mov         bl,1
 004FD29A    mov         eax,dword ptr [ebp-4]
 004FD29D    mov         eax,dword ptr [eax+2A0]
 004FD2A3    mov         edx,dword ptr [ebp-8]
 004FD2A6    call        MaskGetCharType
 004FD2AB    dec         eax
 004FD2AC    sub         al,2
>004FD2AE    jae         004FD2CE
 004FD2B0    mov         eax,dword ptr [ebp-4]
 004FD2B3    mov         eax,dword ptr [eax+2A0]
 004FD2B9    mov         edx,dword ptr [ebp-8]
 004FD2BC    movzx       eax,word ptr [eax+edx*2-2]
 004FD2C1    call        MaskIntlLiteralToChar
 004FD2C6    mov         word ptr [esi],ax
>004FD2C9    jmp         004FD515
 004FD2CE    mov         eax,dword ptr [ebp-4]
 004FD2D1    mov         eax,dword ptr [eax+2A0]
 004FD2D7    mov         edx,dword ptr [ebp-8]
 004FD2DA    call        MaskGetCurrentDirectives
 004FD2DF    mov         byte ptr [ebp-0D],al
 004FD2E2    mov         eax,dword ptr [ebp-4]
 004FD2E5    mov         eax,dword ptr [eax+2A0]
 004FD2EB    mov         edx,dword ptr [ebp-8]
 004FD2EE    movzx       eax,word ptr [eax+edx*2-2]
 004FD2F3    cmp         eax,43
>004FD2F6    jg          004FD31B
>004FD2F8    je          004FD38C
 004FD2FE    sub         eax,23
>004FD301    je          004FD357
 004FD303    sub         eax,0D
>004FD306    je          004FD340
 004FD308    sub         eax,9
>004FD30B    je          004FD340
 004FD30D    sub         eax,8
>004FD310    je          004FD42E
>004FD316    jmp         004FD515
 004FD31B    sub         eax,4C
>004FD31E    je          004FD42E
 004FD324    sub         eax,15
>004FD327    je          004FD42E
 004FD32D    sub         eax,2
>004FD330    je          004FD38C
 004FD332    sub         eax,9
>004FD335    je          004FD42E
>004FD33B    jmp         004FD515
 004FD340    cmp         word ptr [esi],30
>004FD344    jb          004FD350
 004FD346    cmp         word ptr [esi],39
>004FD34A    jbe         004FD515
 004FD350    xor         ebx,ebx
>004FD352    jmp         004FD515
 004FD357    cmp         word ptr [esi],30
>004FD35B    jb          004FD367
 004FD35D    cmp         word ptr [esi],39
>004FD361    jbe         004FD515
 004FD367    cmp         word ptr [esi],20
>004FD36B    je          004FD515
 004FD371    cmp         word ptr [esi],2B
>004FD375    je          004FD515
 004FD37B    cmp         word ptr [esi],2D
>004FD37F    je          004FD515
 004FD385    xor         ebx,ebx
>004FD387    jmp         004FD515
 004FD38C    movzx       eax,word ptr [esi]
 004FD38F    cmp         ax,0D800
>004FD393    jb          004FD39B
 004FD395    cmp         ax,0DFFF
>004FD399    jbe         004FD39F
 004FD39B    xor         eax,eax
>004FD39D    jmp         004FD3A1
 004FD39F    mov         al,1
 004FD3A1    test        al,al
>004FD3A3    je          004FD3BA
 004FD3A5    push        ebp
 004FD3A6    movzx       eax,word ptr [esi]
 004FD3A9    call        TestChar
 004FD3AE    pop         ecx
 004FD3AF    test        al,al
>004FD3B1    je          004FD3BA
 004FD3B3    xor         ebx,ebx
>004FD3B5    jmp         004FD515
 004FD3BA    movzx       eax,word ptr [esi]
 004FD3BD    push        eax
 004FD3BE    call        user32.IsCharAlphaW
 004FD3C3    test        eax,eax
>004FD3C5    je          004FD515
 004FD3CB    lea         eax,[ebp-0C]
 004FD3CE    mov         edx,4FD554;' '
 004FD3D3    call        @UStrLAsg
 004FD3D8    lea         eax,[ebp-0C]
 004FD3DB    call        @UniqueStringU
 004FD3E0    movzx       edx,word ptr [esi]
 004FD3E3    mov         word ptr [eax],dx
 004FD3E6    test        byte ptr [ebp-0D],2
>004FD3EA    je          004FD404
 004FD3EC    lea         edx,[ebp-14]
 004FD3EF    mov         eax,dword ptr [ebp-0C]
 004FD3F2    call        AnsiUpperCase
 004FD3F7    mov         edx,dword ptr [ebp-14]
 004FD3FA    lea         eax,[ebp-0C]
 004FD3FD    call        @UStrLAsg
>004FD402    jmp         004FD420
 004FD404    test        byte ptr [ebp-0D],4
>004FD408    je          004FD420
 004FD40A    lea         edx,[ebp-18]
 004FD40D    mov         eax,dword ptr [ebp-0C]
 004FD410    call        AnsiLowerCase
 004FD415    mov         edx,dword ptr [ebp-18]
 004FD418    lea         eax,[ebp-0C]
 004FD41B    call        @UStrLAsg
 004FD420    mov         eax,dword ptr [ebp-0C]
 004FD423    movzx       eax,word ptr [eax]
 004FD426    mov         word ptr [esi],ax
>004FD429    jmp         004FD515
 004FD42E    movzx       eax,word ptr [esi]
 004FD431    cmp         ax,0D800
>004FD435    jb          004FD43D
 004FD437    cmp         ax,0DFFF
>004FD43B    jbe         004FD441
 004FD43D    xor         eax,eax
>004FD43F    jmp         004FD443
 004FD441    mov         al,1
 004FD443    test        al,al
>004FD445    je          004FD460
 004FD447    push        ebp
 004FD448    movzx       eax,word ptr [esi]
 004FD44B    call        TestChar
 004FD450    pop         ecx
 004FD451    test        al,al
>004FD453    je          004FD515
 004FD459    xor         ebx,ebx
>004FD45B    jmp         004FD515
 004FD460    lea         eax,[ebp-0C]
 004FD463    mov         edx,4FD554;' '
 004FD468    call        @UStrLAsg
 004FD46D    lea         eax,[ebp-0C]
 004FD470    call        @UniqueStringU
 004FD475    movzx       edx,word ptr [esi]
 004FD478    mov         word ptr [eax],dx
 004FD47B    movzx       eax,word ptr [esi]
 004FD47E    call        IsKatakana
 004FD483    test        al,al
>004FD485    je          004FD495
 004FD487    mov         eax,dword ptr [ebp-0C]
 004FD48A    movzx       eax,word ptr [eax]
 004FD48D    mov         word ptr [esi],ax
>004FD490    jmp         004FD515
 004FD495    movzx       eax,word ptr [esi]
 004FD498    push        eax
 004FD499    call        user32.IsCharAlphaW
 004FD49E    test        eax,eax
>004FD4A0    jne         004FD4D2
 004FD4A2    xor         ebx,ebx
 004FD4A4    mov         eax,dword ptr [ebp-4]
 004FD4A7    mov         eax,dword ptr [eax+2A0]
 004FD4AD    mov         edx,dword ptr [ebp-8]
 004FD4B0    movzx       edi,word ptr [eax+edx*2-2]
 004FD4B5    cmp         di,41
>004FD4B9    je          004FD4C1
 004FD4BB    cmp         di,61
>004FD4BF    jne         004FD50C
 004FD4C1    movzx       eax,word ptr [esi]
 004FD4C4    push        eax
 004FD4C5    call        user32.IsCharAlphaNumericW
 004FD4CA    test        eax,eax
>004FD4CC    je          004FD50C
 004FD4CE    mov         bl,1
>004FD4D0    jmp         004FD50C
 004FD4D2    test        byte ptr [ebp-0D],2
>004FD4D6    je          004FD4F0
 004FD4D8    lea         edx,[ebp-1C]
 004FD4DB    mov         eax,dword ptr [ebp-0C]
 004FD4DE    call        AnsiUpperCase
 004FD4E3    mov         edx,dword ptr [ebp-1C]
 004FD4E6    lea         eax,[ebp-0C]
 004FD4E9    call        @UStrLAsg
>004FD4EE    jmp         004FD50C
 004FD4F0    test        byte ptr [ebp-0D],4
>004FD4F4    je          004FD50C
 004FD4F6    lea         edx,[ebp-20]
 004FD4F9    mov         eax,dword ptr [ebp-0C]
 004FD4FC    call        AnsiLowerCase
 004FD501    mov         edx,dword ptr [ebp-20]
 004FD504    lea         eax,[ebp-0C]
 004FD507    call        @UStrLAsg
 004FD50C    mov         eax,dword ptr [ebp-0C]
 004FD50F    movzx       eax,word ptr [eax]
 004FD512    mov         word ptr [esi],ax
 004FD515    xor         eax,eax
 004FD517    pop         edx
 004FD518    pop         ecx
 004FD519    pop         ecx
 004FD51A    mov         dword ptr fs:[eax],edx
 004FD51D    push        4FD53F
 004FD522    lea         eax,[ebp-20]
 004FD525    mov         edx,4
 004FD52A    call        @UStrArrayClr
 004FD52F    lea         eax,[ebp-0C]
 004FD532    call        @UStrClr
 004FD537    ret
>004FD538    jmp         @HandleFinally
>004FD53D    jmp         004FD522
 004FD53F    mov         eax,ebx
 004FD541    pop         edi
 004FD542    pop         esi
 004FD543    pop         ebx
 004FD544    mov         esp,ebp
 004FD546    pop         ebp
 004FD547    ret
*}
end;

//004FD558
function TCustomMaskEdit.Validate(const Value:UnicodeString; var Pos:Integer):Boolean;
begin
{*
 004FD558    push        ebx
 004FD559    push        esi
 004FD55A    push        edi
 004FD55B    push        ebp
 004FD55C    add         esp,0FFFFFFF0
 004FD55F    mov         dword ptr [esp+4],ecx
 004FD563    mov         dword ptr [esp],edx
 004FD566    mov         ebp,eax
 004FD568    mov         byte ptr [esp+8],1
 004FD56D    mov         dword ptr [esp+0C],1
 004FD575    mov         eax,dword ptr [ebp+2A0]
 004FD57B    test        eax,eax
>004FD57D    je          004FD584
 004FD57F    sub         eax,4
 004FD582    mov         eax,dword ptr [eax]
 004FD584    mov         esi,eax
 004FD586    test        esi,esi
>004FD588    jle         004FD606
 004FD58A    mov         edi,1
 004FD58F    mov         eax,dword ptr [ebp+2A0]
 004FD595    mov         edx,edi
 004FD597    call        MaskGetCharType
 004FD59C    mov         ebx,eax
 004FD59E    mov         eax,ebx
 004FD5A0    dec         eax
 004FD5A1    sub         al,2
>004FD5A3    jb          004FD5A9
 004FD5A5    sub         al,2
>004FD5A7    jne         004FD5AF
 004FD5A9    inc         dword ptr [esp+0C]
>004FD5AD    jmp         004FD602
 004FD5AF    cmp         bl,4
>004FD5B2    jne         004FD602
 004FD5B4    cmp         dword ptr [esp],0
>004FD5B8    je          004FD602
 004FD5BA    mov         eax,dword ptr [esp]
 004FD5BD    mov         edx,dword ptr [esp+0C]
 004FD5C1    movzx       eax,word ptr [eax+edx*2-2]
 004FD5C6    cmp         ax,word ptr [ebp+2A4]
>004FD5CD    je          004FD5EC
 004FD5CF    mov         eax,dword ptr [esp]
 004FD5D2    mov         edx,dword ptr [esp+0C]
 004FD5D6    cmp         word ptr [eax+edx*2-2],20
>004FD5DC    jne         004FD5FE
 004FD5DE    mov         eax,dword ptr [ebp+2A0]
 004FD5E4    cmp         word ptr [eax+edi*2-2],43
>004FD5EA    je          004FD5FE
 004FD5EC    mov         byte ptr [esp+8],0
 004FD5F1    mov         eax,dword ptr [esp+0C]
 004FD5F5    dec         eax
 004FD5F6    mov         edx,dword ptr [esp+4]
 004FD5FA    mov         dword ptr [edx],eax
>004FD5FC    jmp         004FD606
 004FD5FE    inc         dword ptr [esp+0C]
 004FD602    inc         edi
 004FD603    dec         esi
>004FD604    jne         004FD58F
 004FD606    movzx       eax,byte ptr [esp+8]
 004FD60B    add         esp,10
 004FD60E    pop         ebp
 004FD60F    pop         edi
 004FD610    pop         esi
 004FD611    pop         ebx
 004FD612    ret
*}
end;

//004FD614
function TCustomMaskEdit.DeleteSelection(var Value:UnicodeString; Offset:Integer; Len:Integer):Boolean;
begin
{*
 004FD614    push        ebp
 004FD615    mov         ebp,esp
 004FD617    add         esp,0FFFFFFEC
 004FD61A    push        ebx
 004FD61B    push        esi
 004FD61C    push        edi
 004FD61D    mov         dword ptr [ebp-8],ecx
 004FD620    mov         dword ptr [ebp-4],edx
 004FD623    mov         edi,eax
 004FD625    mov         eax,dword ptr [ebp+8]
 004FD628    mov         byte ptr [ebp-9],1
 004FD62C    test        eax,eax
>004FD62E    je          004FD6A5
 004FD630    mov         ebx,dword ptr [ebp-8]
 004FD633    inc         ebx
 004FD634    add         eax,ebx
 004FD636    mov         dword ptr [ebp-10],eax
 004FD639    mov         eax,dword ptr [edi+2A0]
 004FD63F    mov         edx,dword ptr [ebp-8]
 004FD642    call        OffsetToMaskOffset
 004FD647    test        eax,eax
>004FD649    jl          004FD6A5
 004FD64B    mov         edx,eax
 004FD64D    mov         eax,dword ptr [edi+2A0]
 004FD653    test        eax,eax
>004FD655    je          004FD65C
 004FD657    sub         eax,4
 004FD65A    mov         eax,dword ptr [eax]
 004FD65C    mov         esi,eax
 004FD65E    sub         esi,edx
>004FD660    jl          004FD6A5
 004FD662    inc         esi
 004FD663    mov         dword ptr [ebp-14],edx
 004FD666    mov         eax,dword ptr [edi+2A0]
 004FD66C    mov         edx,dword ptr [ebp-14]
 004FD66F    call        MaskGetCharType
 004FD674    mov         edx,eax
 004FD676    dec         edx
 004FD677    sub         dl,2
>004FD67A    jae         004FD67F
 004FD67C    inc         ebx
>004FD67D    jmp         004FD69A
 004FD67F    add         al,0FC
 004FD681    sub         al,2
>004FD683    jae         004FD69A
 004FD685    mov         eax,dword ptr [ebp-4]
 004FD688    call        @UniqueStringU
 004FD68D    movzx       edx,word ptr [edi+2A4]
 004FD694    mov         word ptr [eax+ebx*2-2],dx
 004FD699    inc         ebx
 004FD69A    cmp         ebx,dword ptr [ebp-10]
>004FD69D    jge         004FD6A5
 004FD69F    inc         dword ptr [ebp-14]
 004FD6A2    dec         esi
>004FD6A3    jne         004FD666
 004FD6A5    movzx       eax,byte ptr [ebp-9]
 004FD6A9    pop         edi
 004FD6AA    pop         esi
 004FD6AB    pop         ebx
 004FD6AC    mov         esp,ebp
 004FD6AE    pop         ebp
 004FD6AF    ret         4
*}
end;

//004FD6B4
function TCustomMaskEdit.InputString(var Value:UnicodeString; const NewValue:UnicodeString; Offset:Integer):Integer;
begin
{*
 004FD6B4    push        ebp
 004FD6B5    mov         ebp,esp
 004FD6B7    push        ecx
 004FD6B8    mov         ecx,7
 004FD6BD    push        0
 004FD6BF    push        0
 004FD6C1    dec         ecx
>004FD6C2    jne         004FD6BD
 004FD6C4    xchg        ecx,dword ptr [ebp-4]
 004FD6C7    push        ebx
 004FD6C8    push        esi
 004FD6C9    push        edi
 004FD6CA    mov         edi,ecx
 004FD6CC    mov         dword ptr [ebp-8],edx
 004FD6CF    mov         esi,eax
 004FD6D1    xor         eax,eax
 004FD6D3    push        ebp
 004FD6D4    push        4FD9A6
 004FD6D9    push        dword ptr fs:[eax]
 004FD6DC    mov         dword ptr fs:[eax],esp
 004FD6DF    mov         eax,dword ptr [ebp+8]
 004FD6E2    mov         dword ptr [ebp-0C],eax
 004FD6E5    test        edi,edi
>004FD6E7    je          004FD983
 004FD6ED    mov         ebx,1
 004FD6F2    lea         eax,[ebp-4]
 004FD6F5    mov         edx,edi
 004FD6F7    call        @UStrLAsg
 004FD6FC    mov         edx,dword ptr [ebp+8]
 004FD6FF    mov         eax,dword ptr [esi+2A0]
 004FD705    call        OffsetToMaskOffset
 004FD70A    mov         edi,eax
 004FD70C    test        edi,edi
>004FD70E    jl          004FD983
 004FD714    mov         dword ptr [ebp-10],edi
>004FD717    jmp         004FD847
 004FD71C    mov         edx,dword ptr [ebp-10]
 004FD71F    mov         eax,dword ptr [esi+2A0]
 004FD725    call        MaskGetCharType
 004FD72A    mov         byte ptr [ebp-11],al
 004FD72D    movzx       eax,byte ptr [ebp-11]
 004FD731    dec         eax
 004FD732    sub         al,2
>004FD734    jb          004FD73F
 004FD736    dec         eax
 004FD737    sub         al,2
>004FD739    jae         004FD827
 004FD73F    mov         eax,dword ptr [ebp-4]
 004FD742    movzx       eax,word ptr [eax+ebx*2-2]
 004FD747    mov         word ptr [ebp-14],ax
 004FD74B    lea         edx,[ebp-14]
 004FD74E    mov         ecx,dword ptr [ebp-10]
 004FD751    mov         eax,esi
 004FD753    call        TCustomMaskEdit.DoInputChar
 004FD758    test        al,al
>004FD75A    jne         004FD78A
 004FD75C    cmp         word ptr [ebp-14],0D800
>004FD762    jb          004FD77F
 004FD764    cmp         word ptr [ebp-14],0DFFF
>004FD76A    ja          004FD77F
 004FD76C    lea         eax,[ebp-4]
 004FD76F    call        @UniqueStringU
 004FD774    movzx       edx,word ptr [esi+2A4]
 004FD77B    mov         word ptr [eax+ebx*2],dx
 004FD77F    movzx       eax,word ptr [esi+2A4]
 004FD786    mov         word ptr [ebp-14],ax
 004FD78A    movzx       eax,byte ptr [ebp-11]
 004FD78E    dec         eax
 004FD78F    sub         al,2
>004FD791    jae         004FD7A1
 004FD793    mov         eax,dword ptr [ebp-4]
 004FD796    movzx       eax,word ptr [eax+ebx*2-2]
 004FD79B    cmp         ax,word ptr [ebp-14]
>004FD79F    jne         004FD7C8
 004FD7A1    lea         eax,[ebp-4]
 004FD7A4    call        @UniqueStringU
 004FD7A9    movzx       edx,word ptr [ebp-14]
 004FD7AD    mov         word ptr [eax+ebx*2-2],dx
 004FD7B2    cmp         word ptr [ebp-14],0D800
>004FD7B8    jb          004FD826
 004FD7BA    cmp         word ptr [ebp-14],0DFFF
>004FD7C0    ja          004FD826
 004FD7C2    inc         ebx
 004FD7C3    inc         dword ptr [ebp-10]
>004FD7C6    jmp         004FD826
 004FD7C8    mov         eax,dword ptr [ebp-4]
 004FD7CB    mov         dword ptr [ebp-18],eax
 004FD7CE    cmp         dword ptr [ebp-18],0
>004FD7D2    je          004FD7DF
 004FD7D4    mov         eax,dword ptr [ebp-18]
 004FD7D7    sub         eax,4
 004FD7DA    mov         eax,dword ptr [eax]
 004FD7DC    mov         dword ptr [ebp-18],eax
 004FD7DF    lea         eax,[ebp-20]
 004FD7E2    push        eax
 004FD7E3    mov         ecx,ebx
 004FD7E5    dec         ecx
 004FD7E6    mov         edx,1
 004FD7EB    mov         eax,dword ptr [ebp-4]
 004FD7EE    call        @UStrCopy
 004FD7F3    push        dword ptr [ebp-20]
 004FD7F6    lea         eax,[ebp-24]
 004FD7F9    movzx       edx,word ptr [ebp-14]
 004FD7FD    call        @UStrFromWChar
 004FD802    push        dword ptr [ebp-24]
 004FD805    lea         eax,[ebp-28]
 004FD808    push        eax
 004FD809    mov         ecx,dword ptr [ebp-18]
 004FD80C    mov         edx,ebx
 004FD80E    mov         eax,dword ptr [ebp-4]
 004FD811    call        @UStrCopy
 004FD816    push        dword ptr [ebp-28]
 004FD819    lea         eax,[ebp-4]
 004FD81C    mov         edx,3
 004FD821    call        @UStrCatN
 004FD826    inc         ebx
 004FD827    mov         eax,dword ptr [ebp+8]
 004FD82A    add         eax,ebx
 004FD82C    cmp         eax,dword ptr [esi+2A8]
>004FD832    jg          004FD85B
 004FD834    mov         edi,dword ptr [ebp-4]
 004FD837    test        edi,edi
>004FD839    je          004FD840
 004FD83B    sub         edi,4
 004FD83E    mov         edi,dword ptr [edi]
 004FD840    cmp         edi,ebx
>004FD842    jl          004FD85B
 004FD844    inc         dword ptr [ebp-10]
 004FD847    mov         eax,dword ptr [esi+2A0]
 004FD84D    call        @UStrLen
 004FD852    cmp         eax,dword ptr [ebp-10]
>004FD855    jge         004FD71C
 004FD85B    mov         edx,dword ptr [ebp-4]
 004FD85E    mov         eax,edx
 004FD860    test        eax,eax
>004FD862    je          004FD869
 004FD864    sub         eax,4
 004FD867    mov         eax,dword ptr [eax]
 004FD869    add         eax,dword ptr [ebp+8]
 004FD86C    cmp         eax,dword ptr [esi+2A8]
>004FD872    jge         004FD924
 004FD878    mov         edi,edx
 004FD87A    test        edi,edi
>004FD87C    je          004FD883
 004FD87E    sub         edi,4
 004FD881    mov         edi,dword ptr [edi]
 004FD883    mov         edx,dword ptr [ebp+8]
 004FD886    add         edx,edi
 004FD888    inc         edx
 004FD889    mov         eax,dword ptr [ebp-8]
 004FD88C    mov         eax,dword ptr [eax]
 004FD88E    call        ByteType
 004FD893    cmp         al,2
>004FD895    jne         004FD8B2
 004FD897    lea         eax,[ebp-2C]
 004FD89A    movzx       edx,word ptr [esi+2A4]
 004FD8A1    call        @UStrFromWChar
 004FD8A6    mov         edx,dword ptr [ebp-2C]
 004FD8A9    lea         eax,[ebp-4]
 004FD8AC    call        @UStrCat
 004FD8B1    inc         ebx
 004FD8B2    mov         eax,dword ptr [ebp-4]
 004FD8B5    mov         edi,eax
 004FD8B7    test        edi,edi
>004FD8B9    je          004FD8C0
 004FD8BB    sub         edi,4
 004FD8BE    mov         edi,dword ptr [edi]
 004FD8C0    mov         dword ptr [ebp-1C],eax
 004FD8C3    cmp         dword ptr [ebp-1C],0
>004FD8C7    je          004FD8D4
 004FD8C9    mov         eax,dword ptr [ebp-1C]
 004FD8CC    sub         eax,4
 004FD8CF    mov         eax,dword ptr [eax]
 004FD8D1    mov         dword ptr [ebp-1C],eax
 004FD8D4    lea         eax,[ebp-30]
 004FD8D7    push        eax
 004FD8D8    mov         eax,dword ptr [ebp-8]
 004FD8DB    mov         eax,dword ptr [eax]
 004FD8DD    mov         ecx,dword ptr [ebp+8]
 004FD8E0    mov         edx,1
 004FD8E5    call        @UStrCopy
 004FD8EA    push        dword ptr [ebp-30]
 004FD8ED    push        dword ptr [ebp-4]
 004FD8F0    lea         eax,[ebp-34]
 004FD8F3    push        eax
 004FD8F4    mov         eax,dword ptr [ebp+8]
 004FD8F7    add         eax,dword ptr [ebp-1C]
 004FD8FA    mov         ecx,dword ptr [esi+2A8]
 004FD900    sub         ecx,eax
 004FD902    mov         edx,dword ptr [ebp+8]
 004FD905    add         edx,edi
 004FD907    inc         edx
 004FD908    mov         eax,dword ptr [ebp-8]
 004FD90B    mov         eax,dword ptr [eax]
 004FD90D    call        @UStrCopy
 004FD912    push        dword ptr [ebp-34]
 004FD915    mov         eax,dword ptr [ebp-8]
 004FD918    mov         edx,3
 004FD91D    call        @UStrCatN
>004FD922    jmp         004FD97C
 004FD924    mov         edi,dword ptr [ebp+8]
 004FD927    mov         edx,dword ptr [esi+2A8]
 004FD92D    sub         edx,dword ptr [ebp+8]
 004FD930    mov         eax,dword ptr [ebp-4]
 004FD933    call        ByteType
 004FD938    cmp         al,1
>004FD93A    jne         004FD93D
 004FD93C    inc         edi
 004FD93D    lea         eax,[ebp-38]
 004FD940    push        eax
 004FD941    mov         ecx,dword ptr [esi+2A8]
 004FD947    sub         ecx,edi
 004FD949    mov         edx,1
 004FD94E    mov         eax,dword ptr [ebp-4]
 004FD951    call        @UStrCopy
 004FD956    mov         eax,dword ptr [ebp-38]
 004FD959    push        eax
 004FD95A    lea         eax,[ebp-3C]
 004FD95D    push        eax
 004FD95E    mov         eax,dword ptr [ebp-8]
 004FD961    mov         eax,dword ptr [eax]
 004FD963    mov         ecx,dword ptr [ebp+8]
 004FD966    mov         edx,1
 004FD96B    call        @UStrCopy
 004FD970    mov         edx,dword ptr [ebp-3C]
 004FD973    mov         eax,dword ptr [ebp-8]
 004FD976    pop         ecx
 004FD977    call        @UStrCat3
 004FD97C    add         ebx,dword ptr [ebp+8]
 004FD97F    dec         ebx
 004FD980    mov         dword ptr [ebp-0C],ebx
 004FD983    xor         eax,eax
 004FD985    pop         edx
 004FD986    pop         ecx
 004FD987    pop         ecx
 004FD988    mov         dword ptr fs:[eax],edx
 004FD98B    push        4FD9AD
 004FD990    lea         eax,[ebp-3C]
 004FD993    mov         edx,8
 004FD998    call        @UStrArrayClr
 004FD99D    lea         eax,[ebp-4]
 004FD9A0    call        @UStrClr
 004FD9A5    ret
>004FD9A6    jmp         @HandleFinally
>004FD9AB    jmp         004FD990
 004FD9AD    mov         eax,dword ptr [ebp-0C]
 004FD9B0    pop         edi
 004FD9B1    pop         esi
 004FD9B2    pop         ebx
 004FD9B3    mov         esp,ebp
 004FD9B5    pop         ebp
 004FD9B6    ret         4
*}
end;

//004FD9BC
function TCustomMaskEdit.FindLiteralChar(MaskOffset:Integer; InChar:Char):Integer;
begin
{*
 004FD9BC    push        ebx
 004FD9BD    push        esi
 004FD9BE    push        edi
 004FD9BF    push        ebp
 004FD9C0    add         esp,0FFFFFFF8
 004FD9C3    mov         word ptr [esp],cx
 004FD9C7    mov         edi,edx
 004FD9C9    mov         esi,eax
 004FD9CB    mov         dword ptr [esp+4],0FFFFFFFF
>004FD9D3    jmp         004FDA11
 004FD9D5    inc         edi
 004FD9D6    mov         edx,edi
 004FD9D8    mov         eax,dword ptr [esi+2A0]
 004FD9DE    call        MaskGetCharType
 004FD9E3    mov         ebx,eax
 004FD9E5    mov         eax,ebx
 004FD9E7    dec         eax
 004FD9E8    sub         al,2
>004FD9EA    jae         004FDA11
 004FD9EC    mov         eax,dword ptr [esi+2A0]
 004FD9F2    movzx       ebp,word ptr [eax+edi*2-2]
 004FD9F7    cmp         bl,2
>004FD9FA    jne         004FDA05
 004FD9FC    mov         eax,ebp
 004FD9FE    call        MaskIntlLiteralToChar
 004FDA03    mov         ebp,eax
 004FDA05    cmp         bp,word ptr [esp]
>004FDA09    jne         004FDA20
 004FDA0B    mov         dword ptr [esp+4],edi
>004FDA0F    jmp         004FDA20
 004FDA11    mov         eax,dword ptr [esi+2A0]
 004FDA17    call        @UStrLen
 004FDA1C    cmp         edi,eax
>004FDA1E    jl          004FD9D5
 004FDA20    mov         eax,dword ptr [esp+4]
 004FDA24    pop         ecx
 004FDA25    pop         edx
 004FDA26    pop         ebp
 004FDA27    pop         edi
 004FDA28    pop         esi
 004FDA29    pop         ebx
 004FDA2A    ret
*}
end;

//004FF9A8
procedure InvalidOp(const id:UnicodeString);
begin
{*
 004FF9A8    push        ebx
 004FF9A9    mov         ebx,eax
 004FF9AB    mov         ecx,ebx
 004FF9AD    mov         dl,1
 004FF9AF    mov         eax,[004FDA2C];EInvalidGridOperation
 004FF9B4    call        Exception.Create
 004FF9B9    call        @RaiseExcept
 004FF9BE    pop         ebx
 004FF9BF    ret
*}
end;

//004FF9C0
function GridRect(Coord1:TGridCoord; Coord2:TGridCoord):TGridRect;
begin
{*
 004FF9C0    push        esi
 004FF9C1    push        edi
 004FF9C2    add         esp,0FFFFFFF0
 004FF9C5    mov         esi,edx
 004FF9C7    lea         edi,[esp+8]
 004FF9CB    movs        dword ptr [edi],dword ptr [esi]
 004FF9CC    movs        dword ptr [edi],dword ptr [esi]
 004FF9CD    mov         esi,eax
 004FF9CF    lea         edi,[esp]
 004FF9D2    movs        dword ptr [edi],dword ptr [esi]
 004FF9D3    movs        dword ptr [edi],dword ptr [esi]
 004FF9D4    mov         eax,dword ptr [esp+8]
 004FF9D8    mov         dword ptr [ecx],eax
 004FF9DA    mov         eax,dword ptr [esp]
 004FF9DD    cmp         eax,dword ptr [esp+8]
>004FF9E1    jge         004FF9E5
 004FF9E3    mov         dword ptr [ecx],eax
 004FF9E5    mov         eax,dword ptr [esp]
 004FF9E8    mov         dword ptr [ecx+8],eax
 004FF9EB    mov         eax,dword ptr [esp+8]
 004FF9EF    cmp         eax,dword ptr [esp]
>004FF9F2    jle         004FF9F7
 004FF9F4    mov         dword ptr [ecx+8],eax
 004FF9F7    mov         eax,dword ptr [esp+0C]
 004FF9FB    mov         dword ptr [ecx+4],eax
 004FF9FE    mov         eax,dword ptr [esp+4]
 004FFA02    cmp         eax,dword ptr [esp+0C]
>004FFA06    jge         004FFA0B
 004FFA08    mov         dword ptr [ecx+4],eax
 004FFA0B    mov         eax,dword ptr [esp+4]
 004FFA0F    mov         dword ptr [ecx+0C],eax
 004FFA12    mov         eax,dword ptr [esp+0C]
 004FFA16    cmp         eax,dword ptr [esp+4]
>004FFA1A    jle         004FFA1F
 004FFA1C    mov         dword ptr [ecx+0C],eax
 004FFA1F    add         esp,10
 004FFA22    pop         edi
 004FFA23    pop         esi
 004FFA24    ret
*}
end;

//004FFA28
function PointInGridRect(Col:LongInt; Row:LongInt; const Rect:TGridRect):Boolean;
begin
{*
 004FFA28    cmp         eax,dword ptr [ecx]
>004FFA2A    jl          004FFA3B
 004FFA2C    cmp         eax,dword ptr [ecx+8]
>004FFA2F    jg          004FFA3B
 004FFA31    cmp         edx,dword ptr [ecx+4]
>004FFA34    jl          004FFA3B
 004FFA36    cmp         edx,dword ptr [ecx+0C]
>004FFA39    jle         004FFA3E
 004FFA3B    xor         eax,eax
 004FFA3D    ret
 004FFA3E    mov         al,1
 004FFA40    ret
*}
end;

//004FFA44
function PtInRect(X:Integer; Y:Integer; const Rect:TRect):Boolean;
begin
{*
 004FFA44    cmp         eax,dword ptr [ecx]
>004FFA46    jl          004FFA57
 004FFA48    cmp         eax,dword ptr [ecx+8]
>004FFA4B    jg          004FFA57
 004FFA4D    cmp         edx,dword ptr [ecx+4]
>004FFA50    jl          004FFA57
 004FFA52    cmp         edx,dword ptr [ecx+0C]
>004FFA55    jle         004FFA5A
 004FFA57    xor         eax,eax
 004FFA59    ret
 004FFA5A    mov         al,1
 004FFA5C    ret
*}
end;

//004FFA60
function Includes(const P1:TPoint; var P2:TPoint):Boolean;
begin
{*
 004FFA60    push        ebp
 004FFA61    mov         ebp,esp
 004FFA63    push        ebx
 004FFA64    push        esi
 004FFA65    mov         esi,edx
 004FFA67    mov         ebx,eax
 004FFA69    mov         eax,dword ptr [ebp+8]
 004FFA6C    mov         ecx,dword ptr [eax-4]
 004FFA6F    mov         edx,dword ptr [ebx+4]
 004FFA72    mov         eax,dword ptr [ebx]
 004FFA74    call        PtInRect
 004FFA79    test        al,al
>004FFA7B    jne         004FFA95
 004FFA7D    mov         eax,dword ptr [ebp+8]
 004FFA80    mov         ecx,dword ptr [eax-8]
 004FFA83    mov         edx,dword ptr [ebx+4]
 004FFA86    mov         eax,dword ptr [ebx]
 004FFA88    call        PtInRect
 004FFA8D    test        al,al
>004FFA8F    jne         004FFA95
 004FFA91    xor         eax,eax
>004FFA93    jmp         004FFA97
 004FFA95    mov         al,1
 004FFA97    test        al,al
>004FFA99    je          004FFAA5
 004FFA9B    mov         edx,dword ptr [ebx]
 004FFA9D    mov         dword ptr [esi],edx
 004FFA9F    mov         edx,dword ptr [ebx+4]
 004FFAA2    mov         dword ptr [esi+4],edx
 004FFAA5    pop         esi
 004FFAA6    pop         ebx
 004FFAA7    pop         ebp
 004FFAA8    ret
*}
end;

//004FFAAC
function Build(var R:TRect; const P1:TPoint; const P2:TPoint; const P3:TPoint):Boolean;
begin
{*
 004FFAAC    push        ebp
 004FFAAD    mov         ebp,esp
 004FFAAF    push        ecx
 004FFAB0    push        ebx
 004FFAB1    push        esi
 004FFAB2    push        edi
 004FFAB3    mov         dword ptr [ebp-4],ecx
 004FFAB6    mov         edi,edx
 004FFAB8    mov         esi,eax
 004FFABA    mov         bl,1
 004FFABC    mov         eax,dword ptr [ebp+0C]
 004FFABF    push        eax
 004FFAC0    mov         edx,esi
 004FFAC2    mov         eax,edi
 004FFAC4    call        Includes
 004FFAC9    pop         ecx
 004FFACA    test        al,al
>004FFACC    je          004FFAF2
 004FFACE    mov         eax,dword ptr [ebp+0C]
 004FFAD1    push        eax
 004FFAD2    lea         edx,[esi+8]
 004FFAD5    mov         eax,dword ptr [ebp+8]
 004FFAD8    call        Includes
 004FFADD    pop         ecx
 004FFADE    test        al,al
>004FFAE0    jne         004FFB17
 004FFAE2    mov         eax,dword ptr [ebp-4]
 004FFAE5    mov         edx,dword ptr [eax]
 004FFAE7    mov         dword ptr [esi+8],edx
 004FFAEA    mov         edx,dword ptr [eax+4]
 004FFAED    mov         dword ptr [esi+0C],edx
>004FFAF0    jmp         004FFB17
 004FFAF2    mov         eax,dword ptr [ebp+0C]
 004FFAF5    push        eax
 004FFAF6    mov         edx,esi
 004FFAF8    mov         eax,dword ptr [ebp-4]
 004FFAFB    call        Includes
 004FFB00    pop         ecx
 004FFB01    test        al,al
>004FFB03    je          004FFB15
 004FFB05    mov         eax,dword ptr [ebp+8]
 004FFB08    mov         edx,dword ptr [eax]
 004FFB0A    mov         dword ptr [esi+8],edx
 004FFB0D    mov         edx,dword ptr [eax+4]
 004FFB10    mov         dword ptr [esi+0C],edx
>004FFB13    jmp         004FFB17
 004FFB15    xor         ebx,ebx
 004FFB17    mov         eax,ebx
 004FFB19    pop         edi
 004FFB1A    pop         esi
 004FFB1B    pop         ebx
 004FFB1C    pop         ecx
 004FFB1D    pop         ebp
 004FFB1E    ret         4
*}
end;

//004FFB24
procedure XorRects(const R1:TRect; const R2:TRect; var XorRects:TXorRects);
begin
{*
 004FFB24    push        ebp
 004FFB25    mov         ebp,esp
 004FFB27    add         esp,0FFFFFF78
 004FFB2D    push        ebx
 004FFB2E    push        esi
 004FFB2F    push        edi
 004FFB30    mov         ebx,ecx
 004FFB32    mov         dword ptr [ebp-8],edx
 004FFB35    mov         dword ptr [ebp-4],eax
 004FFB38    mov         eax,ebx
 004FFB3A    xor         ecx,ecx
 004FFB3C    mov         edx,40
 004FFB41    call        @FillChar
 004FFB46    mov         ecx,dword ptr [ebp-8]
 004FFB49    mov         edx,dword ptr [ebp-4]
 004FFB4C    lea         eax,[ebp-78]
 004FFB4F    call        IntersectRect
 004FFB54    test        al,al
>004FFB56    jne         004FFB74
 004FFB58    mov         eax,dword ptr [ebp-4]
 004FFB5B    mov         esi,eax
 004FFB5D    mov         edi,ebx
 004FFB5F    movs        dword ptr [edi],dword ptr [esi]
 004FFB60    movs        dword ptr [edi],dword ptr [esi]
 004FFB61    movs        dword ptr [edi],dword ptr [esi]
 004FFB62    movs        dword ptr [edi],dword ptr [esi]
 004FFB63    mov         eax,dword ptr [ebp-8]
 004FFB66    mov         esi,eax
 004FFB68    lea         edi,[ebx+10]
 004FFB6B    movs        dword ptr [edi],dword ptr [esi]
 004FFB6C    movs        dword ptr [edi],dword ptr [esi]
 004FFB6D    movs        dword ptr [edi],dword ptr [esi]
 004FFB6E    movs        dword ptr [edi],dword ptr [esi]
>004FFB6F    jmp         004FFC80
 004FFB74    mov         ecx,dword ptr [ebp-8]
 004FFB77    mov         edx,dword ptr [ebp-4]
 004FFB7A    lea         eax,[ebp-88]
 004FFB80    call        UnionRect
 004FFB85    mov         eax,dword ptr [ebp-88]
 004FFB8B    mov         dword ptr [ebp-10],eax
 004FFB8E    mov         edx,dword ptr [ebp-84]
 004FFB94    mov         dword ptr [ebp-0C],edx
 004FFB97    mov         dword ptr [ebp-18],eax
 004FFB9A    mov         edx,dword ptr [ebp-74]
 004FFB9D    mov         dword ptr [ebp-14],edx
 004FFBA0    mov         dword ptr [ebp-20],eax
 004FFBA3    mov         eax,dword ptr [ebp-6C]
 004FFBA6    mov         dword ptr [ebp-1C],eax
 004FFBA9    push        ebp
 004FFBAA    lea         eax,[ebp-20]
 004FFBAD    push        eax
 004FFBAE    lea         ecx,[ebp-18]
 004FFBB1    lea         edx,[ebp-10]
 004FFBB4    mov         eax,ebx
 004FFBB6    call        Build
 004FFBBB    pop         ecx
 004FFBBC    test        al,al
>004FFBBE    je          004FFBC6
 004FFBC0    mov         eax,dword ptr [ebp-78]
 004FFBC3    mov         dword ptr [ebx+8],eax
 004FFBC6    mov         eax,dword ptr [ebp-78]
 004FFBC9    mov         dword ptr [ebp-28],eax
 004FFBCC    mov         eax,dword ptr [ebp-84]
 004FFBD2    mov         dword ptr [ebp-24],eax
 004FFBD5    mov         edx,dword ptr [ebp-70]
 004FFBD8    mov         dword ptr [ebp-30],edx
 004FFBDB    mov         dword ptr [ebp-2C],eax
 004FFBDE    mov         edx,dword ptr [ebp-80]
 004FFBE1    mov         dword ptr [ebp-38],edx
 004FFBE4    mov         dword ptr [ebp-34],eax
 004FFBE7    push        ebp
 004FFBE8    lea         eax,[ebp-38]
 004FFBEB    push        eax
 004FFBEC    lea         ecx,[ebp-30]
 004FFBEF    lea         edx,[ebp-28]
 004FFBF2    lea         eax,[ebx+10]
 004FFBF5    call        Build
 004FFBFA    pop         ecx
 004FFBFB    test        al,al
>004FFBFD    je          004FFC05
 004FFBFF    mov         eax,dword ptr [ebp-74]
 004FFC02    mov         dword ptr [ebx+1C],eax
 004FFC05    mov         eax,dword ptr [ebp-80]
 004FFC08    mov         dword ptr [ebp-40],eax
 004FFC0B    mov         edx,dword ptr [ebp-74]
 004FFC0E    mov         dword ptr [ebp-3C],edx
 004FFC11    mov         dword ptr [ebp-48],eax
 004FFC14    mov         edx,dword ptr [ebp-6C]
 004FFC17    mov         dword ptr [ebp-44],edx
 004FFC1A    mov         dword ptr [ebp-50],eax
 004FFC1D    mov         eax,dword ptr [ebp-7C]
 004FFC20    mov         dword ptr [ebp-4C],eax
 004FFC23    push        ebp
 004FFC24    lea         eax,[ebp-50]
 004FFC27    push        eax
 004FFC28    lea         ecx,[ebp-48]
 004FFC2B    lea         edx,[ebp-40]
 004FFC2E    lea         eax,[ebx+20]
 004FFC31    call        Build
 004FFC36    pop         ecx
 004FFC37    test        al,al
>004FFC39    je          004FFC41
 004FFC3B    mov         eax,dword ptr [ebp-70]
 004FFC3E    mov         dword ptr [ebx+20],eax
 004FFC41    mov         eax,dword ptr [ebp-88]
 004FFC47    mov         dword ptr [ebp-58],eax
 004FFC4A    mov         eax,dword ptr [ebp-7C]
 004FFC4D    mov         dword ptr [ebp-54],eax
 004FFC50    mov         edx,dword ptr [ebp-78]
 004FFC53    mov         dword ptr [ebp-60],edx
 004FFC56    mov         dword ptr [ebp-5C],eax
 004FFC59    mov         edx,dword ptr [ebp-70]
 004FFC5C    mov         dword ptr [ebp-68],edx
 004FFC5F    mov         dword ptr [ebp-64],eax
 004FFC62    push        ebp
 004FFC63    lea         eax,[ebp-68]
 004FFC66    push        eax
 004FFC67    lea         ecx,[ebp-60]
 004FFC6A    lea         edx,[ebp-58]
 004FFC6D    lea         eax,[ebx+30]
 004FFC70    call        Build
 004FFC75    pop         ecx
 004FFC76    test        al,al
>004FFC78    je          004FFC80
 004FFC7A    mov         eax,dword ptr [ebp-6C]
 004FFC7D    mov         dword ptr [ebx+34],eax
 004FFC80    pop         edi
 004FFC81    pop         esi
 004FFC82    pop         ebx
 004FFC83    mov         esp,ebp
 004FFC85    pop         ebp
 004FFC86    ret
*}
end;

//004FFC88
procedure ModifyExtents(var Extents:Pointer; Index:LongInt; Amount:LongInt; Default:Integer);
begin
{*
 004FFC88    push        ebp
 004FFC89    mov         ebp,esp
 004FFC8B    push        0
 004FFC8D    push        0
 004FFC8F    push        0
 004FFC91    push        0
 004FFC93    push        ebx
 004FFC94    push        esi
 004FFC95    push        edi
 004FFC96    mov         edi,ecx
 004FFC98    mov         dword ptr [ebp-4],edx
 004FFC9B    mov         ebx,eax
 004FFC9D    xor         eax,eax
 004FFC9F    push        ebp
 004FFCA0    push        4FFD68
 004FFCA5    push        dword ptr fs:[eax]
 004FFCA8    mov         dword ptr fs:[eax],esp
 004FFCAB    test        edi,edi
>004FFCAD    je          004FFD4D
 004FFCB3    cmp         dword ptr [ebx],0
>004FFCB6    jne         004FFCBC
 004FFCB8    xor         esi,esi
>004FFCBA    jmp         004FFCC0
 004FFCBC    mov         eax,dword ptr [ebx]
 004FFCBE    mov         esi,dword ptr [eax]
 004FFCC0    cmp         dword ptr [ebp-4],0
>004FFCC4    jl          004FFCCB
 004FFCC6    cmp         esi,dword ptr [ebp-4]
>004FFCC9    jge         004FFCE0
 004FFCCB    lea         edx,[ebp-8]
 004FFCCE    mov         eax,[0078D63C];^SResString239:TResStringRec
 004FFCD3    call        LoadResString
 004FFCD8    mov         eax,dword ptr [ebp-8]
 004FFCDB    call        InvalidOp
 004FFCE0    add         edi,esi
 004FFCE2    mov         esi,edi
 004FFCE4    test        esi,esi
>004FFCE6    jge         004FFCFF
 004FFCE8    lea         edx,[ebp-0C]
 004FFCEB    mov         eax,[0078D2F8];^SResString238:TResStringRec
 004FFCF0    call        LoadResString
 004FFCF5    mov         eax,dword ptr [ebp-0C]
 004FFCF8    call        InvalidOp
>004FFCFD    jmp         004FFD1C
 004FFCFF    cmp         esi,7FFFFFE
>004FFD05    jl          004FFD1C
 004FFD07    lea         edx,[ebp-10]
 004FFD0A    mov         eax,[0078D468];^SResString237:TResStringRec
 004FFD0F    call        LoadResString
 004FFD14    mov         eax,dword ptr [ebp-10]
 004FFD17    call        InvalidOp
 004FFD1C    test        esi,esi
>004FFD1E    jle         004FFD21
 004FFD20    inc         esi
 004FFD21    mov         edx,esi
 004FFD23    add         edx,edx
 004FFD25    add         edx,edx
 004FFD27    mov         eax,ebx
 004FFD29    call        @ReallocMem
 004FFD2E    cmp         dword ptr [ebx],0
>004FFD31    je          004FFD4D
 004FFD33    mov         eax,dword ptr [ebp-4]
 004FFD36    inc         eax
 004FFD37    cmp         esi,eax
>004FFD39    jle         004FFD48
 004FFD3B    mov         edx,dword ptr [ebx]
 004FFD3D    mov         ecx,dword ptr [ebp+8]
 004FFD40    mov         dword ptr [edx+eax*4],ecx
 004FFD43    inc         eax
 004FFD44    cmp         esi,eax
>004FFD46    jg          004FFD3B
 004FFD48    dec         esi
 004FFD49    mov         eax,dword ptr [ebx]
 004FFD4B    mov         dword ptr [eax],esi
 004FFD4D    xor         eax,eax
 004FFD4F    pop         edx
 004FFD50    pop         ecx
 004FFD51    pop         ecx
 004FFD52    mov         dword ptr fs:[eax],edx
 004FFD55    push        4FFD6F
 004FFD5A    lea         eax,[ebp-10]
 004FFD5D    mov         edx,3
 004FFD62    call        @UStrArrayClr
 004FFD67    ret
>004FFD68    jmp         @HandleFinally
>004FFD6D    jmp         004FFD5A
 004FFD6F    pop         edi
 004FFD70    pop         esi
 004FFD71    pop         ebx
 004FFD72    mov         esp,ebp
 004FFD74    pop         ebp
 004FFD75    ret         4
*}
end;

//004FFD78
procedure UpdateExtents(var Extents:Pointer; NewSize:LongInt; Default:Integer);
begin
{*
 004FFD78    push        ebx
 004FFD79    push        esi
 004FFD7A    xor         esi,esi
 004FFD7C    cmp         dword ptr [eax],0
>004FFD7F    je          004FFD85
 004FFD81    mov         ebx,dword ptr [eax]
 004FFD83    mov         esi,dword ptr [ebx]
 004FFD85    push        ecx
 004FFD86    mov         ecx,edx
 004FFD88    sub         ecx,esi
 004FFD8A    mov         edx,esi
 004FFD8C    call        ModifyExtents
 004FFD91    pop         esi
 004FFD92    pop         ebx
 004FFD93    ret
*}
end;

//004FFD94
procedure MoveExtent(var Extents:Pointer; FromIndex:LongInt; ToIndex:LongInt);
begin
{*
 004FFD94    push        ebx
 004FFD95    push        esi
 004FFD96    push        edi
 004FFD97    push        ebp
 004FFD98    mov         esi,ecx
 004FFD9A    mov         ebx,eax
 004FFD9C    cmp         dword ptr [ebx],0
>004FFD9F    je          004FFDE8
 004FFDA1    mov         eax,dword ptr [ebx]
 004FFDA3    mov         edi,dword ptr [eax+edx*4]
 004FFDA6    cmp         esi,edx
>004FFDA8    jle         004FFDC7
 004FFDAA    mov         eax,esi
 004FFDAC    sub         eax,edx
 004FFDAE    mov         ecx,eax
 004FFDB0    add         ecx,ecx
 004FFDB2    add         ecx,ecx
 004FFDB4    mov         eax,dword ptr [ebx]
 004FFDB6    lea         eax,[eax+edx*4+4]
 004FFDBA    mov         ebp,dword ptr [ebx]
 004FFDBC    lea         edx,[ebp+edx*4]
 004FFDC0    call        Move
>004FFDC5    jmp         004FFDE3
 004FFDC7    cmp         esi,edx
>004FFDC9    jge         004FFDE3
 004FFDCB    mov         eax,dword ptr [ebx]
 004FFDCD    lea         eax,[eax+esi*4]
 004FFDD0    mov         ecx,dword ptr [ebx]
 004FFDD2    lea         ecx,[ecx+esi*4+4]
 004FFDD6    sub         edx,esi
 004FFDD8    add         edx,edx
 004FFDDA    add         edx,edx
 004FFDDC    xchg        ecx,edx
 004FFDDE    call        Move
 004FFDE3    mov         eax,dword ptr [ebx]
 004FFDE5    mov         dword ptr [eax+esi*4],edi
 004FFDE8    pop         ebp
 004FFDE9    pop         edi
 004FFDEA    pop         esi
 004FFDEB    pop         ebx
 004FFDEC    ret
*}
end;

//004FFDF0
function CompareExtents(E1:Pointer; E2:Pointer):Boolean;
begin
{*
 004FFDF0    push        ebx
 004FFDF1    push        esi
 004FFDF2    push        edi
 004FFDF3    mov         edi,edx
 004FFDF5    xor         edx,edx
 004FFDF7    test        eax,eax
>004FFDF9    je          004FFE18
 004FFDFB    test        edi,edi
>004FFDFD    je          004FFE1D
 004FFDFF    mov         esi,dword ptr [eax]
 004FFE01    test        esi,esi
>004FFE03    jl          004FFE14
 004FFE05    inc         esi
 004FFE06    xor         ecx,ecx
 004FFE08    mov         ebx,dword ptr [eax+ecx*4]
 004FFE0B    cmp         ebx,dword ptr [edi+ecx*4]
>004FFE0E    jne         004FFE1D
 004FFE10    inc         ecx
 004FFE11    dec         esi
>004FFE12    jne         004FFE08
 004FFE14    mov         dl,1
>004FFE16    jmp         004FFE1D
 004FFE18    test        edi,edi
 004FFE1A    sete        dl
 004FFE1D    mov         eax,edx
 004FFE1F    pop         edi
 004FFE20    pop         esi
 004FFE21    pop         ebx
 004FFE22    ret
*}
end;

//004FFE24
function kernel32.MulDiv(nNumerator:Integer; nDenominator:Integer):Integer; stdcall;
begin
{*
 004FFE24    jmp         dword ptr ds:[826874]
*}
end;

//004FFE2C
procedure KillMessage(Wnd:HWND; Msg:Integer);
begin
{*
 004FFE2C    push        ebx
 004FFE2D    push        esi
 004FFE2E    add         esp,0FFFFFFE4
 004FFE31    mov         ebx,edx
 004FFE33    mov         esi,eax
 004FFE35    xor         eax,eax
 004FFE37    mov         dword ptr [esp+4],eax
 004FFE3B    push        1
 004FFE3D    push        ebx
 004FFE3E    push        ebx
 004FFE3F    push        esi
 004FFE40    lea         eax,[esp+10]
 004FFE44    push        eax
 004FFE45    call        user32.PeekMessageW
 004FFE4A    test        eax,eax
>004FFE4C    je          004FFE5F
 004FFE4E    cmp         dword ptr [esp+4],12
>004FFE53    jne         004FFE5F
 004FFE55    mov         eax,dword ptr [esp+8]
 004FFE59    push        eax
 004FFE5A    call        user32.PostQuitMessage
 004FFE5F    add         esp,1C
 004FFE62    pop         esi
 004FFE63    pop         ebx
 004FFE64    ret
*}
end;

//004FFE68
constructor TInplaceEdit.Create;
begin
{*
 004FFE68    push        ebx
 004FFE69    push        esi
 004FFE6A    test        dl,dl
>004FFE6C    je          004FFE76
 004FFE6E    add         esp,0FFFFFFF0
 004FFE71    call        @ClassCreate
 004FFE76    mov         ebx,edx
 004FFE78    mov         esi,eax
 004FFE7A    xor         edx,edx
 004FFE7C    mov         eax,esi
 004FFE7E    call        TCustomMaskEdit.Create
 004FFE83    xor         edx,edx
 004FFE85    mov         eax,esi
 004FFE87    call        TWinControl.SetParentCtl3D
 004FFE8C    xor         edx,edx
 004FFE8E    mov         eax,esi
 004FFE90    call        TWinControl.SetCtl3D
 004FFE95    xor         edx,edx
 004FFE97    mov         eax,esi
 004FFE99    call        TWinControl.SetTabStop
 004FFE9E    xor         edx,edx
 004FFEA0    mov         eax,esi
 004FFEA2    call        TCustomEdit.SetBorderStyle
 004FFEA7    xor         edx,edx
 004FFEA9    mov         eax,esi
 004FFEAB    call        TWinControl.SetDoubleBuffered
 004FFEB0    mov         eax,esi
 004FFEB2    test        bl,bl
>004FFEB4    je          004FFEC5
 004FFEB6    call        @AfterConstruction
 004FFEBB    pop         dword ptr fs:[0]
 004FFEC2    add         esp,0C
 004FFEC5    mov         eax,esi
 004FFEC7    pop         esi
 004FFEC8    pop         ebx
 004FFEC9    ret
*}
end;

//004FFECC
procedure TInplaceEdit.CreateParams(var Params:TCreateParams);
begin
{*
 004FFECC    push        ebx
 004FFECD    mov         ebx,edx
 004FFECF    mov         edx,ebx
 004FFED1    call        TCustomEdit.CreateParams
 004FFED6    or          dword ptr [ebx+4],4
 004FFEDA    pop         ebx
 004FFEDB    ret
*}
end;

//004FFEDC
procedure TInplaceEdit.SetGrid(Value:TCustomGrid);
begin
{*
 004FFEDC    mov         dword ptr [eax+2C0],edx
 004FFEE2    ret
*}
end;

//004FFEE4
procedure TInplaceEdit.CMShowingChanged(var Message:TMessage);
begin
{*
 004FFEE4    ret
*}
end;

//004FFEE8
procedure TInplaceEdit.WMGetDlgCode(var Message:TWMGetDlgCode);
begin
{*
 004FFEE8    push        ebx
 004FFEE9    push        esi
 004FFEEA    mov         esi,edx
 004FFEEC    mov         ebx,eax
 004FFEEE    mov         edx,esi
 004FFEF0    mov         eax,ebx
 004FFEF2    mov         ecx,dword ptr [eax]
 004FFEF4    call        dword ptr [ecx-10]
 004FFEF7    mov         eax,dword ptr [ebx+2C0]
 004FFEFD    test        byte ptr [eax+2B5],8
>004FFF04    je          004FFF0A
 004FFF06    or          dword ptr [esi+0C],2
 004FFF0A    pop         esi
 004FFF0B    pop         ebx
 004FFF0C    ret
*}
end;

//004FFF10
procedure TInplaceEdit.WMPaste(var Message:TMessage);
begin
{*
 004FFF10    push        ebx
 004FFF11    push        esi
 004FFF12    mov         esi,edx
 004FFF14    mov         ebx,eax
 004FFF16    mov         eax,ebx
 004FFF18    mov         edx,dword ptr [eax]
 004FFF1A    call        dword ptr [edx+110]
 004FFF20    test        al,al
>004FFF22    je          004FFF2D
 004FFF24    mov         edx,esi
 004FFF26    mov         eax,ebx
 004FFF28    call        TCustomMaskEdit.WMPaste
 004FFF2D    pop         esi
 004FFF2E    pop         ebx
 004FFF2F    ret
*}
end;

//004FFF30
procedure TInplaceEdit.WMClear(var Message:TMessage);
begin
{*
 004FFF30    push        ebx
 004FFF31    push        esi
 004FFF32    mov         esi,edx
 004FFF34    mov         ebx,eax
 004FFF36    mov         eax,ebx
 004FFF38    mov         edx,dword ptr [eax]
 004FFF3A    call        dword ptr [edx+110]
 004FFF40    test        al,al
>004FFF42    je          004FFF4D
 004FFF44    mov         edx,esi
 004FFF46    mov         eax,ebx
 004FFF48    mov         ecx,dword ptr [eax]
 004FFF4A    call        dword ptr [ecx-10]
 004FFF4D    pop         esi
 004FFF4E    pop         ebx
 004FFF4F    ret
*}
end;

//004FFF50
procedure TInplaceEdit.WMCut(var Message:TMessage);
begin
{*
 004FFF50    push        ebx
 004FFF51    push        esi
 004FFF52    mov         esi,edx
 004FFF54    mov         ebx,eax
 004FFF56    mov         eax,ebx
 004FFF58    mov         edx,dword ptr [eax]
 004FFF5A    call        dword ptr [edx+110]
 004FFF60    test        al,al
>004FFF62    je          004FFF6D
 004FFF64    mov         edx,esi
 004FFF66    mov         eax,ebx
 004FFF68    call        TCustomMaskEdit.WMCut
 004FFF6D    pop         esi
 004FFF6E    pop         ebx
 004FFF6F    ret
*}
end;

//004FFF70
procedure TInplaceEdit.DblClick;
begin
{*
 004FFF70    push        esi
 004FFF71    mov         eax,dword ptr [eax+2C0]
 004FFF77    mov         si,0FFEB
 004FFF7B    call        @CallDynaInst
 004FFF80    pop         esi
 004FFF81    ret
*}
end;

//004FFF84
procedure TInplaceEdit.DoMouseWheel(Shift:TShiftState; WheelDelta:Integer; MousePos:TPoint);
begin
{*
 004FFF84    push        ebp
 004FFF85    mov         ebp,esp
 004FFF87    add         esp,0FFFFFFF4
 004FFF8A    push        esi
 004FFF8B    push        edi
 004FFF8C    mov         esi,dword ptr [ebp+8]
 004FFF8F    lea         edi,[ebp-0C]
 004FFF92    movs        dword ptr [edi],dword ptr [esi]
 004FFF93    movs        dword ptr [edi],dword ptr [esi]
 004FFF94    mov         word ptr [ebp-2],dx
 004FFF98    mov         esi,eax
 004FFF9A    lea         eax,[ebp-0C]
 004FFF9D    push        eax
 004FFF9E    movzx       edx,word ptr [ebp-2]
 004FFFA2    mov         eax,dword ptr [esi+2C0]
 004FFFA8    mov         si,0FFE4
 004FFFAC    call        @CallDynaInst
 004FFFB1    pop         edi
 004FFFB2    pop         esi
 004FFFB3    mov         esp,ebp
 004FFFB5    pop         ebp
 004FFFB6    ret         4
*}
end;

//004FFFBC
function TInplaceEdit.EditCanModify:Boolean;
begin
{*
 004FFFBC    push        esi
 004FFFBD    mov         eax,dword ptr [eax+2C0]
 004FFFC3    mov         si,0FFAC
 004FFFC7    call        @CallDynaInst
 004FFFCC    pop         esi
 004FFFCD    ret
*}
end;

//004FFFD0
procedure SendToParent;
begin
{*
 004FFFD0    push        ebp
 004FFFD1    mov         ebp,esp
 004FFFD3    push        esi
 004FFFD4    mov         eax,dword ptr [ebp+8]
 004FFFD7    movzx       ecx,word ptr [eax-0A]
 004FFFDB    mov         eax,dword ptr [ebp+8]
 004FFFDE    mov         edx,dword ptr [eax-8]
 004FFFE1    mov         eax,dword ptr [ebp+8]
 004FFFE4    mov         eax,dword ptr [eax-4]
 004FFFE7    mov         eax,dword ptr [eax+2C0]
 004FFFED    mov         si,0FFBA
 004FFFF1    call        @CallDynaInst
 004FFFF6    mov         eax,dword ptr [ebp+8]
 004FFFF9    mov         eax,dword ptr [eax-8]
 004FFFFC    mov         word ptr [eax],0
 00500001    pop         esi
 00500002    pop         ebp
 00500003    ret
*}
end;

//00500004
procedure ParentEvent;
begin
{*
 00500004    push        ebp
 00500005    mov         ebp,esp
 00500007    add         esp,0FFFFFFF8
 0050000A    mov         eax,dword ptr [ebp+8]
 0050000D    mov         eax,dword ptr [eax-4]
 00500010    mov         eax,dword ptr [eax+2C0]
 00500016    mov         edx,dword ptr [eax+218]
 0050001C    mov         dword ptr [ebp-8],edx
 0050001F    mov         edx,dword ptr [eax+21C]
 00500025    mov         dword ptr [ebp-4],edx
 00500028    cmp         word ptr [ebp-6],0
>0050002D    je          00500048
 0050002F    mov         edx,dword ptr [ebp+8]
 00500032    movzx       edx,word ptr [edx-0A]
 00500036    push        edx
 00500037    mov         edx,dword ptr [ebp+8]
 0050003A    mov         ecx,dword ptr [edx-8]
 0050003D    mov         edx,dword ptr [ebp+8]
 00500040    mov         edx,eax
 00500042    mov         eax,dword ptr [ebp-4]
 00500045    call        dword ptr [ebp-8]
 00500048    pop         ecx
 00500049    pop         ecx
 0050004A    pop         ebp
 0050004B    ret
*}
end;

//0050004C
function ForwardMovement:Boolean;
begin
{*
 0050004C    push        ebp
 0050004D    mov         ebp,esp
 0050004F    mov         eax,dword ptr [ebp+8]
 00500052    mov         eax,dword ptr [eax-4]
 00500055    mov         eax,dword ptr [eax+2C0]
 0050005B    test        byte ptr [eax+2B5],20
 00500062    setne       al
 00500065    pop         ebp
 00500066    ret
*}
end;

//00500068
function Ctrl:Boolean;
begin
{*
 00500068    push        ebp
 00500069    mov         ebp,esp
 0050006B    mov         eax,dword ptr [ebp+8]
 0050006E    test        byte ptr [eax-0A],4
 00500072    setne       al
 00500075    pop         ebp
 00500076    ret
*}
end;

//00500078
function Selection:TSelection;
begin
{*
 00500078    push        ebp
 00500079    mov         ebp,esp
 0050007B    push        ebx
 0050007C    mov         ebx,eax
 0050007E    lea         eax,[ebx+4]
 00500081    push        eax
 00500082    push        ebx
 00500083    push        0B0
 00500088    mov         eax,dword ptr [ebp+8]
 0050008B    mov         eax,dword ptr [eax-4]
 0050008E    call        TWinControl.GetHandle
 00500093    push        eax
 00500094    call        user32.SendMessageW
 00500099    pop         ebx
 0050009A    pop         ebp
 0050009B    ret
*}
end;

//0050009C
function CaretPos:Integer;
begin
{*
 0050009C    push        ebp
 0050009D    mov         ebp,esp
 0050009F    add         esp,0FFFFFFF8
 005000A2    lea         eax,[ebp-8]
 005000A5    push        eax
 005000A6    call        user32.GetCaretPos
 005000AB    movzx       eax,word ptr [ebp-8]
 005000AF    movzx       edx,word ptr [ebp-4]
 005000B3    shl         edx,10
 005000B6    or          eax,edx
 005000B8    push        eax
 005000B9    push        0
 005000BB    push        0D7
 005000C0    mov         eax,dword ptr [ebp+8]
 005000C3    mov         eax,dword ptr [eax-4]
 005000C6    call        TWinControl.GetHandle
 005000CB    push        eax
 005000CC    call        user32.SendMessageW
 005000D1    pop         ecx
 005000D2    pop         ecx
 005000D3    pop         ebp
 005000D4    ret
*}
end;

//005000D8
function RightSide:Boolean;
begin
{*
 005000D8    push        ebp
 005000D9    mov         ebp,esp
 005000DB    add         esp,0FFFFFFF8
 005000DE    push        ebx
 005000DF    push        esi
 005000E0    mov         eax,dword ptr [ebp+8]
 005000E3    push        eax
 005000E4    lea         eax,[ebp-8]
 005000E7    call        Selection
 005000EC    pop         ecx
 005000ED    mov         eax,dword ptr [ebp+8]
 005000F0    mov         eax,dword ptr [eax-4]
 005000F3    call        TCustomMaskEdit.GetTextLen
 005000F8    mov         esi,eax
 005000FA    mov         eax,dword ptr [ebp+8]
 005000FD    push        eax
 005000FE    call        CaretPos
 00500103    pop         ecx
 00500104    cmp         esi,eax
>00500106    jne         00500124
 00500108    mov         ebx,dword ptr [ebp-8]
 0050010B    test        ebx,ebx
>0050010D    je          00500114
 0050010F    cmp         ebx,dword ptr [ebp-4]
>00500112    jne         00500124
 00500114    mov         eax,dword ptr [ebp+8]
 00500117    mov         eax,dword ptr [eax-4]
 0050011A    call        TCustomMaskEdit.GetTextLen
 0050011F    cmp         eax,dword ptr [ebp-4]
>00500122    je          00500128
 00500124    xor         eax,eax
>00500126    jmp         0050012A
 00500128    mov         al,1
 0050012A    pop         esi
 0050012B    pop         ebx
 0050012C    pop         ecx
 0050012D    pop         ecx
 0050012E    pop         ebp
 0050012F    ret
*}
end;

//00500130
function LeftSide:Boolean;
begin
{*
 00500130    push        ebp
 00500131    mov         ebp,esp
 00500133    add         esp,0FFFFFFF8
 00500136    push        ebx
 00500137    mov         eax,dword ptr [ebp+8]
 0050013A    push        eax
 0050013B    lea         eax,[ebp-8]
 0050013E    call        Selection
 00500143    pop         ecx
 00500144    mov         eax,dword ptr [ebp+8]
 00500147    push        eax
 00500148    call        CaretPos
 0050014D    pop         ecx
 0050014E    test        eax,eax
>00500150    jne         0050016E
 00500152    cmp         dword ptr [ebp-8],0
>00500156    jne         0050016E
 00500158    mov         ebx,dword ptr [ebp-4]
 0050015B    test        ebx,ebx
>0050015D    je          00500172
 0050015F    mov         eax,dword ptr [ebp+8]
 00500162    mov         eax,dword ptr [eax-4]
 00500165    call        TCustomMaskEdit.GetTextLen
 0050016A    cmp         ebx,eax
>0050016C    je          00500172
 0050016E    xor         eax,eax
>00500170    jmp         00500174
 00500172    mov         al,1
 00500174    pop         ebx
 00500175    pop         ecx
 00500176    pop         ecx
 00500177    pop         ebp
 00500178    ret
*}
end;

//0050017C
procedure TInplaceEdit.KeyDown(var Key:Word; Shift:TShiftState);
begin
{*
 0050017C    push        ebp
 0050017D    mov         ebp,esp
 0050017F    add         esp,0FFFFFFF4
 00500182    push        esi
 00500183    mov         word ptr [ebp-0A],cx
 00500187    mov         dword ptr [ebp-8],edx
 0050018A    mov         dword ptr [ebp-4],eax
 0050018D    mov         eax,dword ptr [ebp-8]
 00500190    movzx       eax,word ptr [eax]
 00500193    cmp         eax,26
>00500196    jg          005001D5
>00500198    je          00500204
 0050019A    cmp         eax,23
>0050019D    jg          005001C0
>0050019F    je          00500300
 005001A5    sub         eax,9
>005001A8    je          00500344
 005001AE    sub         eax,12
>005001B1    je          00500204
 005001B3    add         eax,0FFFFFFFA
 005001B6    sub         eax,2
>005001B9    jb          00500204
>005001BB    jmp         00500385
 005001C0    sub         eax,24
>005001C3    je          005002CB
 005001C9    dec         eax
>005001CA    je          00500261
>005001D0    jmp         00500385
 005001D5    cmp         eax,2D
>005001D8    jg          005001ED
>005001DA    je          00500210
 005001DC    sub         eax,27
>005001DF    je          00500296
 005001E5    dec         eax
>005001E6    je          00500204
>005001E8    jmp         00500385
 005001ED    sub         eax,2E
>005001F0    je          00500353
 005001F6    sub         eax,43
>005001F9    je          0050032A
>005001FF    jmp         00500385
 00500204    push        ebp
 00500205    call        SendToParent
 0050020A    pop         ecx
>0050020B    jmp         00500385
 00500210    movzx       eax,word ptr ds:[5003AC]
 00500217    cmp         ax,word ptr [ebp-0A]
>0050021B    jne         00500229
 0050021D    push        ebp
 0050021E    call        SendToParent
 00500223    pop         ecx
>00500224    jmp         00500385
 00500229    movzx       eax,word ptr ds:[5003B0]
 00500230    cmp         ax,word ptr [ebp-0A]
>00500234    jne         00500385
 0050023A    mov         eax,dword ptr [ebp-4]
 0050023D    mov         eax,dword ptr [eax+2C0]
 00500243    mov         si,0FFAC
 00500247    call        @CallDynaInst
 0050024C    test        al,al
>0050024E    jne         00500385
 00500254    mov         eax,dword ptr [ebp-8]
 00500257    mov         word ptr [eax],0
>0050025C    jmp         00500385
 00500261    push        ebp
 00500262    call        ForwardMovement
 00500267    pop         ecx
 00500268    test        al,al
>0050026A    je          00500385
 00500270    push        ebp
 00500271    call        Ctrl
 00500276    pop         ecx
 00500277    test        al,al
>00500279    jne         0050028A
 0050027B    push        ebp
 0050027C    call        LeftSide
 00500281    pop         ecx
 00500282    test        al,al
>00500284    je          00500385
 0050028A    push        ebp
 0050028B    call        SendToParent
 00500290    pop         ecx
>00500291    jmp         00500385
 00500296    push        ebp
 00500297    call        ForwardMovement
 0050029C    pop         ecx
 0050029D    test        al,al
>0050029F    je          00500385
 005002A5    push        ebp
 005002A6    call        Ctrl
 005002AB    pop         ecx
 005002AC    test        al,al
>005002AE    jne         005002BF
 005002B0    push        ebp
 005002B1    call        RightSide
 005002B6    pop         ecx
 005002B7    test        al,al
>005002B9    je          00500385
 005002BF    push        ebp
 005002C0    call        SendToParent
 005002C5    pop         ecx
>005002C6    jmp         00500385
 005002CB    push        ebp
 005002CC    call        ForwardMovement
 005002D1    pop         ecx
 005002D2    test        al,al
>005002D4    je          00500385
 005002DA    push        ebp
 005002DB    call        Ctrl
 005002E0    pop         ecx
 005002E1    test        al,al
>005002E3    jne         005002F4
 005002E5    push        ebp
 005002E6    call        LeftSide
 005002EB    pop         ecx
 005002EC    test        al,al
>005002EE    je          00500385
 005002F4    push        ebp
 005002F5    call        SendToParent
 005002FA    pop         ecx
>005002FB    jmp         00500385
 00500300    push        ebp
 00500301    call        ForwardMovement
 00500306    pop         ecx
 00500307    test        al,al
>00500309    je          00500385
 0050030B    push        ebp
 0050030C    call        Ctrl
 00500311    pop         ecx
 00500312    test        al,al
>00500314    jne         00500321
 00500316    push        ebp
 00500317    call        RightSide
 0050031C    pop         ecx
 0050031D    test        al,al
>0050031F    je          00500385
 00500321    push        ebp
 00500322    call        SendToParent
 00500327    pop         ecx
>00500328    jmp         00500385
 0050032A    push        ebp
 0050032B    call        ParentEvent
 00500330    pop         ecx
 00500331    mov         eax,dword ptr [ebp-8]
 00500334    cmp         word ptr [eax],71
>00500338    jne         00500385
 0050033A    mov         eax,dword ptr [ebp-4]
 0050033D    call        TInplaceEdit.Deselect
>00500342    jmp         005003A4
 00500344    test        byte ptr [ebp-0A],2
>00500348    jne         00500385
 0050034A    push        ebp
 0050034B    call        SendToParent
 00500350    pop         ecx
>00500351    jmp         00500385
 00500353    push        ebp
 00500354    call        Ctrl
 00500359    pop         ecx
 0050035A    test        al,al
>0050035C    je          00500367
 0050035E    push        ebp
 0050035F    call        SendToParent
 00500364    pop         ecx
>00500365    jmp         00500385
 00500367    mov         eax,dword ptr [ebp-4]
 0050036A    mov         eax,dword ptr [eax+2C0]
 00500370    mov         si,0FFAC
 00500374    call        @CallDynaInst
 00500379    test        al,al
>0050037B    jne         00500385
 0050037D    mov         eax,dword ptr [ebp-8]
 00500380    mov         word ptr [eax],0
 00500385    mov         eax,dword ptr [ebp-8]
 00500388    cmp         word ptr [eax],0
>0050038C    je          005003A4
 0050038E    push        ebp
 0050038F    call        ParentEvent
 00500394    pop         ecx
 00500395    mov         edx,dword ptr [ebp-8]
 00500398    movzx       ecx,word ptr [ebp-0A]
 0050039C    mov         eax,dword ptr [ebp-4]
 0050039F    call        TCustomMaskEdit.KeyDown
 005003A4    pop         esi
 005003A5    mov         esp,ebp
 005003A7    pop         ebp
 005003A8    ret
*}
end;

//005003B4
procedure TInplaceEdit.KeyPress(var Key:Char);
begin
{*
 005003B4    push        ebx
 005003B5    push        esi
 005003B6    push        edi
 005003B7    add         esp,0FFFFFFF8
 005003BA    mov         ebx,edx
 005003BC    mov         edi,eax
 005003BE    mov         edx,ebx
 005003C0    mov         eax,dword ptr [edi+2C0]
 005003C6    mov         si,0FFB8
 005003CA    call        @CallDynaInst
 005003CF    cmp         word ptr [ebx],20
>005003D3    jb          005003F7
 005003D5    movzx       edx,word ptr [ebx]
 005003D8    mov         eax,dword ptr [edi+2C0]
 005003DE    mov         si,0FFAE
 005003E2    call        @CallDynaInst
 005003E7    test        al,al
>005003E9    jne         005003F7
 005003EB    mov         word ptr [ebx],0
 005003F0    push        0
 005003F2    call        user32.MessageBeep
 005003F7    movzx       eax,word ptr [ebx]
 005003FA    cmp         eax,16
>005003FD    jg          00500410
>005003FF    je          00500473
 00500401    sub         eax,8
>00500404    je          00500473
 00500406    dec         eax
>00500407    je          00500426
 00500409    sub         eax,4
>0050040C    je          0050042D
>0050040E    jmp         0050048B
 00500410    sub         eax,18
>00500413    je          00500473
 00500415    sub         eax,3
>00500418    je          00500426
 0050041A    add         eax,0FFFFFFFB
 0050041D    sub         eax,0FFE0
>00500422    jb          00500473
>00500424    jmp         0050048B
 00500426    mov         word ptr [ebx],0
>0050042B    jmp         0050048B
 0050042D    lea         eax,[esp+4]
 00500431    push        eax
 00500432    lea         eax,[esp+4]
 00500436    push        eax
 00500437    push        0B0
 0050043C    mov         eax,edi
 0050043E    call        TWinControl.GetHandle
 00500443    push        eax
 00500444    call        user32.SendMessageW
 00500449    cmp         dword ptr [esp],0
>0050044D    jne         00500465
 0050044F    mov         eax,edi
 00500451    call        TCustomMaskEdit.GetTextLen
 00500456    cmp         eax,dword ptr [esp+4]
>0050045A    jne         00500465
 0050045C    mov         eax,edi
 0050045E    call        TInplaceEdit.Deselect
>00500463    jmp         0050046C
 00500465    mov         eax,edi
 00500467    call        TCustomEdit.SelectAll
 0050046C    mov         word ptr [ebx],0
>00500471    jmp         0050048B
 00500473    mov         eax,dword ptr [edi+2C0]
 00500479    mov         si,0FFAC
 0050047D    call        @CallDynaInst
 00500482    test        al,al
>00500484    jne         0050048B
 00500486    mov         word ptr [ebx],0
 0050048B    cmp         word ptr [ebx],0
>0050048F    je          0050049A
 00500491    mov         edx,ebx
 00500493    mov         eax,edi
 00500495    call        TCustomMaskEdit.KeyPress
 0050049A    pop         ecx
 0050049B    pop         edx
 0050049C    pop         edi
 0050049D    pop         esi
 0050049E    pop         ebx
 0050049F    ret
*}
end;

//005004A0
procedure TInplaceEdit.KeyUp(var Key:Word; Shift:TShiftState);
begin
{*
 005004A0    push        esi
 005004A1    push        ecx
 005004A2    mov         word ptr [esp],cx
 005004A6    movzx       ecx,word ptr [esp]
 005004AA    mov         eax,dword ptr [eax+2C0]
 005004B0    mov         si,0FFB9
 005004B4    call        @CallDynaInst
 005004B9    pop         edx
 005004BA    pop         esi
 005004BB    ret
*}
end;

//005004BC
procedure TInplaceEdit.WndProc(var Message:TMessage);
begin
{*
 005004BC    push        ebx
 005004BD    push        esi
 005004BE    push        edi
 005004BF    mov         esi,edx
 005004C1    mov         ebx,eax
 005004C3    mov         eax,dword ptr [esi]
 005004C5    sub         eax,7
>005004C8    je          005004D3
 005004CA    sub         eax,1FA
>005004CF    je          00500506
>005004D1    jmp         0050052A
 005004D3    mov         dl,1
 005004D5    mov         eax,ebx
 005004D7    call        GetParentForm
 005004DC    test        eax,eax
>005004DE    je          005004FB
 005004E0    mov         dl,1
 005004E2    mov         eax,ebx
 005004E4    call        GetParentForm
 005004E9    mov         edx,dword ptr [ebx+2C0]
 005004EF    mov         ecx,dword ptr [eax]
 005004F1    call        dword ptr [ecx+110]
 005004F7    test        al,al
>005004F9    je          00500533
 005004FB    mov         edx,esi
 005004FD    mov         eax,ebx
 005004FF    mov         ecx,dword ptr [eax]
 00500501    call        dword ptr [ecx-14]
>00500504    jmp         00500533
 00500506    call        user32.GetMessageTime
 0050050B    mov         edi,eax
 0050050D    sub         edi,dword ptr [ebx+2C4]
 00500513    call        user32.GetDoubleClickTime
 00500518    cmp         edi,eax
>0050051A    jae         00500522
 0050051C    mov         dword ptr [esi],203
 00500522    xor         eax,eax
 00500524    mov         dword ptr [ebx+2C4],eax
 0050052A    mov         edx,esi
 0050052C    mov         eax,ebx
 0050052E    call        TWinControl.WndProc
 00500533    pop         edi
 00500534    pop         esi
 00500535    pop         ebx
 00500536    ret
*}
end;

//00500538
procedure TInplaceEdit.Deselect;
begin
{*
 00500538    push        ebx
 00500539    mov         ebx,eax
 0050053B    push        0FF
 0050053D    push        7FFFFFFF
 00500542    push        0B1
 00500547    mov         eax,ebx
 00500549    call        TWinControl.GetHandle
 0050054E    push        eax
 0050054F    call        user32.SendMessageW
 00500554    pop         ebx
 00500555    ret
*}
end;

//00500558
procedure TInplaceEdit.Invalidate;
begin
{*
 00500558    push        ebx
 00500559    add         esp,0FFFFFFF0
 0050055C    mov         ebx,eax
 0050055E    push        0
 00500560    mov         eax,ebx
 00500562    call        TWinControl.GetHandle
 00500567    push        eax
 00500568    call        user32.ValidateRect
 0050056D    push        0FF
 0050056F    push        0
 00500571    mov         eax,ebx
 00500573    call        TWinControl.GetHandle
 00500578    push        eax
 00500579    call        user32.InvalidateRect
 0050057E    push        esp
 0050057F    mov         eax,ebx
 00500581    call        TWinControl.GetHandle
 00500586    push        eax
 00500587    call        user32.GetClientRect
 0050058C    push        2
 0050058E    lea         eax,[esp+4]
 00500592    push        eax
 00500593    mov         eax,dword ptr [ebx+2C0]
 00500599    call        TWinControl.GetHandle
 0050059E    push        eax
 0050059F    mov         eax,ebx
 005005A1    call        TWinControl.GetHandle
 005005A6    push        eax
 005005A7    call        user32.MapWindowPoints
 005005AC    push        esp
 005005AD    mov         eax,dword ptr [ebx+2C0]
 005005B3    call        TWinControl.GetHandle
 005005B8    push        eax
 005005B9    call        user32.ValidateRect
 005005BE    push        0
 005005C0    lea         eax,[esp+4]
 005005C4    push        eax
 005005C5    mov         eax,dword ptr [ebx+2C0]
 005005CB    call        TWinControl.GetHandle
 005005D0    push        eax
 005005D1    call        user32.InvalidateRect
 005005D6    add         esp,10
 005005D9    pop         ebx
 005005DA    ret
*}
end;

//005005DC
procedure TInplaceEdit.Hide;
begin
{*
 005005DC    push        ebx
 005005DD    push        esi
 005005DE    mov         ebx,eax
 005005E0    mov         eax,ebx
 005005E2    call        TWinControl.HandleAllocated
 005005E7    test        al,al
>005005E9    je          0050063F
 005005EB    mov         eax,ebx
 005005ED    call        TWinControl.GetHandle
 005005F2    push        eax
 005005F3    call        user32.IsWindowVisible
 005005F8    test        eax,eax
>005005FA    je          0050063F
 005005FC    mov         eax,ebx
 005005FE    call        TInplaceEdit.Invalidate
 00500603    push        8C
 00500608    push        0
 0050060A    push        0
 0050060C    push        0
 0050060E    push        0
 00500610    push        0
 00500612    mov         eax,ebx
 00500614    call        TWinControl.GetHandle
 00500619    push        eax
 0050061A    call        user32.SetWindowPos
 0050061F    mov         eax,ebx
 00500621    mov         si,0FFB3
 00500625    call        @CallDynaInst
 0050062A    test        al,al
>0050062C    je          0050063F
 0050062E    mov         eax,dword ptr [ebx+2C0]
 00500634    call        TWinControl.GetHandle
 00500639    push        eax
 0050063A    call        user32.SetFocus
 0050063F    pop         esi
 00500640    pop         ebx
 00500641    ret
*}
end;

//00500644
function TInplaceEdit.PosEqual(Rect:TRect):Boolean;
begin
{*
 00500644    push        ebx
 00500645    push        esi
 00500646    add         esp,0FFFFFFF0
 00500649    mov         esi,edx
 0050064B    mov         ebx,eax
 0050064D    push        esp
 0050064E    mov         eax,ebx
 00500650    call        TWinControl.GetHandle
 00500655    push        eax
 00500656    call        user32.GetWindowRect
 0050065B    push        2
 0050065D    lea         eax,[esp+4]
 00500661    push        eax
 00500662    mov         eax,dword ptr [ebx+2C0]
 00500668    call        TWinControl.GetHandle
 0050066D    push        eax
 0050066E    push        0
 00500670    call        user32.MapWindowPoints
 00500675    mov         edx,esp
 00500677    mov         eax,esi
 00500679    call        EqualRect
 0050067E    add         esp,10
 00500681    pop         esi
 00500682    pop         ebx
 00500683    ret
*}
end;

//00500684
procedure TInplaceEdit.InternalMove(const Loc:TRect; Redraw:Boolean);
begin
{*
 00500684    push        ebx
 00500685    push        esi
 00500686    push        edi
 00500687    push        ebp
 00500688    mov         ebx,ecx
 0050068A    mov         esi,edx
 0050068C    mov         edi,eax
 0050068E    mov         eax,esi
 00500690    call        IsRectEmpty
 00500695    test        al,al
>00500697    je          005006A5
 00500699    mov         eax,edi
 0050069B    call        TInplaceEdit.Hide
>005006A0    jmp         0050072D
 005006A5    mov         eax,edi
 005006A7    mov         edx,dword ptr [eax]
 005006A9    call        dword ptr [edx+0A8]
 005006AF    test        bl,bl
>005006B1    jne         005006C8
 005006B3    mov         eax,edi
 005006B5    call        TWinControl.GetHandle
 005006BA    push        eax
 005006BB    call        user32.IsWindowVisible
 005006C0    test        eax,eax
>005006C2    je          005006C8
 005006C4    xor         eax,eax
>005006C6    jmp         005006CA
 005006C8    mov         al,1
 005006CA    mov         ebx,eax
 005006CC    mov         eax,edi
 005006CE    call        TInplaceEdit.Invalidate
 005006D3    push        48
 005006D5    mov         eax,dword ptr [esi+0C]
 005006D8    sub         eax,dword ptr [esi+4]
 005006DB    push        eax
 005006DC    mov         eax,dword ptr [esi+8]
 005006DF    mov         ebp,dword ptr [esi]
 005006E1    sub         eax,ebp
 005006E3    push        eax
 005006E4    mov         eax,dword ptr [esi+4]
 005006E7    push        eax
 005006E8    push        ebp
 005006E9    push        0
 005006EB    mov         eax,edi
 005006ED    call        TWinControl.GetHandle
 005006F2    push        eax
 005006F3    call        user32.SetWindowPos
 005006F8    mov         eax,edi
 005006FA    mov         edx,dword ptr [eax]
 005006FC    call        dword ptr [edx+124]
 00500702    test        bl,bl
>00500704    je          0050070D
 00500706    mov         eax,edi
 00500708    call        TInplaceEdit.Invalidate
 0050070D    mov         eax,dword ptr [edi+2C0]
 00500713    mov         si,0FFB3
 00500717    call        @CallDynaInst
 0050071C    test        al,al
>0050071E    je          0050072D
 00500720    mov         eax,edi
 00500722    call        TWinControl.GetHandle
 00500727    push        eax
 00500728    call        user32.SetFocus
 0050072D    pop         ebp
 0050072E    pop         edi
 0050072F    pop         esi
 00500730    pop         ebx
 00500731    ret
*}
end;

//00500734
procedure TInplaceEdit.BoundsChanged;
begin
{*
 00500734    push        ebx
 00500735    add         esp,0FFFFFFF0
 00500738    mov         ebx,eax
 0050073A    mov         eax,dword ptr [ebx+4C]
 0050073D    push        eax
 0050073E    lea         eax,[esp+4]
 00500742    push        eax
 00500743    mov         ecx,dword ptr [ebx+48]
 00500746    sub         ecx,2
 00500749    mov         edx,2
 0050074E    mov         eax,2
 00500753    call        Rect
 00500758    push        esp
 00500759    mov         eax,ebx
 0050075B    call        TWinControl.GetHandle
 00500760    xor         ecx,ecx
 00500762    mov         edx,0B4
 00500767    call        SendStructMessage
 0050076C    push        0
 0050076E    push        0
 00500770    push        0B7
 00500775    mov         eax,ebx
 00500777    call        TWinControl.GetHandle
 0050077C    push        eax
 0050077D    call        user32.SendMessageW
 00500782    add         esp,10
 00500785    pop         ebx
 00500786    ret
*}
end;

//00500788
procedure TInplaceEdit.UpdateLoc(Loc:TRect);
begin
{*
 00500788    xor         ecx,ecx
 0050078A    call        TInplaceEdit.InternalMove
 0050078F    ret
*}
end;

//00500790
function TInplaceEdit.Visible:Boolean;
begin
{*
 00500790    push        ebx
 00500791    mov         ebx,eax
 00500793    mov         eax,ebx
 00500795    call        TWinControl.GetHandle
 0050079A    push        eax
 0050079B    call        user32.IsWindowVisible
 005007A0    cmp         eax,1
 005007A3    sbb         eax,eax
 005007A5    inc         eax
 005007A6    pop         ebx
 005007A7    ret
*}
end;

//005007A8
procedure TInplaceEdit.Move(Loc:TRect);
begin
{*
 005007A8    mov         cl,1
 005007AA    call        TInplaceEdit.InternalMove
 005007AF    ret
*}
end;

//005007B0
procedure TInplaceEdit.SetFocus;
begin
{*
 005007B0    push        ebx
 005007B1    mov         ebx,eax
 005007B3    mov         eax,ebx
 005007B5    call        TWinControl.GetHandle
 005007BA    push        eax
 005007BB    call        user32.IsWindowVisible
 005007C0    test        eax,eax
>005007C2    je          005007D1
 005007C4    mov         eax,ebx
 005007C6    call        TWinControl.GetHandle
 005007CB    push        eax
 005007CC    call        user32.SetFocus
 005007D1    pop         ebx
 005007D2    ret
*}
end;

//005007D4
procedure TInplaceEdit.UpdateContents;
begin
{*
 005007D4    push        ebp
 005007D5    mov         ebp,esp
 005007D7    push        0
 005007D9    push        0
 005007DB    push        ebx
 005007DC    push        esi
 005007DD    push        edi
 005007DE    mov         ebx,eax
 005007E0    xor         eax,eax
 005007E2    push        ebp
 005007E3    push        500880
 005007E8    push        dword ptr fs:[eax]
 005007EB    mov         dword ptr fs:[eax],esp
 005007EE    xor         edx,edx
 005007F0    mov         eax,ebx
 005007F2    call        TCustomMaskEdit.SetText
 005007F7    lea         eax,[ebp-4]
 005007FA    push        eax
 005007FB    mov         edi,dword ptr [ebx+2C0]
 00500801    mov         ecx,dword ptr [edi+28C]
 00500807    mov         edx,dword ptr [edi+288]
 0050080D    mov         eax,edi
 0050080F    mov         si,0FFA7
 00500813    call        @CallDynaInst
 00500818    mov         edx,dword ptr [ebp-4]
 0050081B    mov         eax,ebx
 0050081D    call        TCustomMaskEdit.SetEditMask
 00500822    lea         eax,[ebp-8]
 00500825    push        eax
 00500826    mov         edi,dword ptr [ebx+2C0]
 0050082C    mov         ecx,dword ptr [edi+28C]
 00500832    mov         edx,dword ptr [edi+288]
 00500838    mov         eax,edi
 0050083A    mov         si,0FFAA
 0050083E    call        @CallDynaInst
 00500843    mov         edx,dword ptr [ebp-8]
 00500846    mov         eax,ebx
 00500848    call        TCustomMaskEdit.SetText
 0050084D    mov         eax,dword ptr [ebx+2C0]
 00500853    mov         si,0FFA8
 00500857    call        @CallDynaInst
 0050085C    mov         edx,eax
 0050085E    mov         eax,ebx
 00500860    call        TCustomMaskEdit.SetMaxLength
 00500865    xor         eax,eax
 00500867    pop         edx
 00500868    pop         ecx
 00500869    pop         ecx
 0050086A    mov         dword ptr fs:[eax],edx
 0050086D    push        500887
 00500872    lea         eax,[ebp-8]
 00500875    mov         edx,2
 0050087A    call        @UStrArrayClr
 0050087F    ret
>00500880    jmp         @HandleFinally
>00500885    jmp         00500872
 00500887    pop         edi
 00500888    pop         esi
 00500889    pop         ebx
 0050088A    pop         ecx
 0050088B    pop         ecx
 0050088C    pop         ebp
 0050088D    ret
*}
end;

//00500890
constructor TCustomGrid.Create;
begin
{*
 00500890    push        ebp
 00500891    mov         ebp,esp
 00500893    push        ecx
 00500894    push        ebx
 00500895    push        esi
 00500896    test        dl,dl
>00500898    je          005008A2
 0050089A    add         esp,0FFFFFFF0
 0050089D    call        @ClassCreate
 005008A2    mov         byte ptr [ebp-1],dl
 005008A5    mov         ebx,eax
 005008A7    xor         edx,edx
 005008A9    mov         eax,ebx
 005008AB    call        TCustomControl.Create
 005008B0    mov         eax,[0078D264];^NewStyleControls:Boolean
 005008B5    cmp         byte ptr [eax],0
>005008B8    je          005008C4
 005008BA    mov         eax,[00500A24]
 005008BF    mov         dword ptr [ebx+50],eax
>005008C2    jmp         005008CC
 005008C4    mov         eax,[00500A28]
 005008C9    mov         dword ptr [ebx+50],eax
 005008CC    mov         byte ptr [ebx+281],1
 005008D3    mov         dword ptr [ebx+284],5
 005008DD    mov         dword ptr [ebx+2C0],5
 005008E7    mov         dword ptr [ebx+29C],1
 005008F1    mov         dword ptr [ebx+2A0],1
 005008FB    mov         dword ptr [ebx+2B0],1
 00500905    mov         eax,[00500A2C]
 0050090A    mov         dword ptr [ebx+2B4],eax
 00500910    mov         eax,[00500A30]
 00500915    mov         dword ptr [ebx+31A],eax
 0050091B    mov         dword ptr [ebx+2A4],0FF00000F
 00500925    mov         byte ptr [ebx+2C4],3
 0050092C    mov         byte ptr [ebx+280],1
 00500933    mov         dword ptr [ebx+290],40
 0050093D    mov         dword ptr [ebx+294],18
 00500947    mov         byte ptr [ebx+2FC],1
 0050094E    mov         byte ptr [ebx+298],1
 00500955    mov         edx,0FFFFFFE7
 0050095A    mov         eax,0F0F0F0
 0050095F    call        GetShadowColor
 00500964    mov         dword ptr [ebx+2A8],eax
 0050096A    mov         dword ptr [ebx+2AC],0FFFFFF
 00500974    mov         byte ptr [ebx+319],1
 0050097B    mov         byte ptr [ebx+2FD],0
 00500982    mov         edx,0FF000005
 00500987    mov         eax,ebx
 00500989    call        TControl.SetColor
 0050098E    xor         edx,edx
 00500990    mov         eax,ebx
 00500992    call        TControl.SetParentColor
 00500997    mov         dl,1
 00500999    mov         eax,ebx
 0050099B    call        TWinControl.SetTabStop
 005009A0    mov         eax,dword ptr [ebx+284]
 005009A6    imul        dword ptr [ebx+290]
 005009AC    push        eax
 005009AD    mov         eax,dword ptr [ebx+2C0]
 005009B3    imul        dword ptr [ebx+294]
 005009B9    push        eax
 005009BA    mov         ecx,dword ptr [ebx+44]
 005009BD    mov         edx,dword ptr [ebx+40]
 005009C0    mov         eax,ebx
 005009C2    mov         esi,dword ptr [eax]
 005009C4    call        dword ptr [esi+98]
 005009CA    mov         dword ptr [ebx+328],0FFFFFFFF
 005009D4    mov         dword ptr [ebx+32C],0FFFFFFFF
 005009DE    mov         byte ptr [ebx+330],0
 005009E5    mov         eax,dword ptr [ebx+0AC]
 005009EB    movzx       edx,byte ptr ds:[500A34]
 005009F2    mov         byte ptr [eax+10],dl
 005009F5    movzx       edx,byte ptr ds:[500A2C]
 005009FC    mov         byte ptr [eax+11],dl
 005009FF    mov         eax,ebx
 00500A01    call        TCustomGrid.Initialize
 00500A06    mov         eax,ebx
 00500A08    cmp         byte ptr [ebp-1],0
>00500A0C    je          00500A1D
 00500A0E    call        @AfterConstruction
 00500A13    pop         dword ptr fs:[0]
 00500A1A    add         esp,0C
 00500A1D    mov         eax,ebx
 00500A1F    pop         esi
 00500A20    pop         ebx
 00500A21    pop         ecx
 00500A22    pop         ebp
 00500A23    ret
*}
end;

//00500A38
destructor TCustomGrid.Destroy();
begin
{*
 00500A38    push        ebx
 00500A39    push        esi
 00500A3A    call        @BeforeDestruction
 00500A3F    mov         ebx,edx
 00500A41    mov         esi,eax
 00500A43    mov         eax,dword ptr [esi+2EC]
 00500A49    call        TObject.Free
 00500A4E    xor         eax,eax
 00500A50    mov         dword ptr [esi+2EC],eax
 00500A56    mov         edx,ebx
 00500A58    and         dl,0FC
 00500A5B    mov         eax,esi
 00500A5D    call        TCustomControl.Destroy
 00500A62    mov         eax,dword ptr [esi+300]
 00500A68    call        @FreeMem
 00500A6D    mov         eax,dword ptr [esi+304]
 00500A73    call        @FreeMem
 00500A78    mov         eax,dword ptr [esi+308]
 00500A7E    call        @FreeMem
 00500A83    test        bl,bl
>00500A85    jle         00500A8E
 00500A87    mov         eax,esi
 00500A89    call        @ClassDestroy
 00500A8E    pop         esi
 00500A8F    pop         ebx
 00500A90    ret
*}
end;

//00500A94
function DoSizeAdjust(var Count:LongInt; var Extents:Pointer; DefaultExtent:Integer; var Current:LongInt):LongInt;
begin
{*
 00500A94    push        ebp
 00500A95    mov         ebp,esp
 00500A97    add         esp,0FFFFFFF0
 00500A9A    push        ebx
 00500A9B    push        esi
 00500A9C    xor         ebx,ebx
 00500A9E    mov         dword ptr [ebp-10],ebx
 00500AA1    mov         esi,ecx
 00500AA3    mov         ebx,edx
 00500AA5    mov         dword ptr [ebp-4],eax
 00500AA8    xor         eax,eax
 00500AAA    push        ebp
 00500AAB    push        500BA0
 00500AB0    push        dword ptr fs:[eax]
 00500AB3    mov         dword ptr fs:[eax],esp
 00500AB6    mov         eax,dword ptr [ebp-4]
 00500AB9    mov         eax,dword ptr [eax]
 00500ABB    mov         edx,dword ptr [ebp+0C]
 00500ABE    add         eax,dword ptr [edx-4]
 00500AC1    mov         dword ptr [ebp-0C],eax
 00500AC4    mov         eax,dword ptr [ebp+0C]
 00500AC7    mov         eax,dword ptr [eax-8]
 00500ACA    cmp         eax,dword ptr [ebp-0C]
>00500ACD    jle         00500AE4
 00500ACF    lea         edx,[ebp-10]
 00500AD2    mov         eax,[0078D2F8];^SResString238:TResStringRec
 00500AD7    call        LoadResString
 00500ADC    mov         eax,dword ptr [ebp-10]
 00500ADF    call        InvalidOp
 00500AE4    mov         eax,dword ptr [ebp+0C]
 00500AE7    cmp         dword ptr [eax-4],0
>00500AEB    jge         00500B1D
 00500AED    cmp         dword ptr [ebx],0
>00500AF0    je          00500B1D
 00500AF2    xor         eax,eax
 00500AF4    mov         dword ptr [ebp-8],eax
 00500AF7    mov         eax,dword ptr [ebp+0C]
 00500AFA    mov         edx,dword ptr [eax-8]
 00500AFD    mov         eax,dword ptr [ebp+0C]
 00500B00    mov         eax,dword ptr [eax-8]
 00500B03    mov         ecx,dword ptr [ebp+0C]
 00500B06    sub         eax,dword ptr [ecx-4]
 00500B09    dec         eax
 00500B0A    sub         eax,edx
>00500B0C    jl          00500B28
 00500B0E    inc         eax
 00500B0F    mov         ecx,dword ptr [ebx]
 00500B11    mov         ecx,dword ptr [ecx+edx*4]
 00500B14    add         dword ptr [ebp-8],ecx
 00500B17    inc         edx
 00500B18    dec         eax
>00500B19    jne         00500B0F
>00500B1B    jmp         00500B28
 00500B1D    mov         eax,dword ptr [ebp+0C]
 00500B20    mov         eax,dword ptr [eax-4]
 00500B23    imul        esi
 00500B25    mov         dword ptr [ebp-8],eax
 00500B28    cmp         dword ptr [ebx],0
>00500B2B    je          00500B41
 00500B2D    push        esi
 00500B2E    mov         eax,dword ptr [ebp+0C]
 00500B31    mov         ecx,dword ptr [eax-4]
 00500B34    mov         eax,dword ptr [ebp+0C]
 00500B37    mov         edx,dword ptr [eax-8]
 00500B3A    mov         eax,ebx
 00500B3C    call        ModifyExtents
 00500B41    mov         eax,dword ptr [ebp-4]
 00500B44    mov         edx,dword ptr [ebp-0C]
 00500B47    mov         dword ptr [eax],edx
 00500B49    mov         eax,dword ptr [ebp+8]
 00500B4C    mov         eax,dword ptr [eax]
 00500B4E    mov         edx,dword ptr [ebp+0C]
 00500B51    cmp         eax,dword ptr [edx-8]
>00500B54    jl          00500B8A
 00500B56    mov         eax,dword ptr [ebp+0C]
 00500B59    cmp         dword ptr [eax-4],0
>00500B5D    jge         00500B7F
 00500B5F    mov         eax,dword ptr [ebp+0C]
 00500B62    mov         eax,dword ptr [eax-8]
 00500B65    mov         edx,dword ptr [ebp+0C]
 00500B68    sub         eax,dword ptr [edx-4]
 00500B6B    mov         edx,dword ptr [ebp+8]
 00500B6E    cmp         eax,dword ptr [edx]
>00500B70    jle         00500B7F
 00500B72    mov         eax,dword ptr [ebp+0C]
 00500B75    mov         eax,dword ptr [eax-8]
 00500B78    mov         edx,dword ptr [ebp+8]
 00500B7B    mov         dword ptr [edx],eax
>00500B7D    jmp         00500B8A
 00500B7F    mov         eax,dword ptr [ebp+0C]
 00500B82    mov         eax,dword ptr [eax-4]
 00500B85    mov         edx,dword ptr [ebp+8]
 00500B88    add         dword ptr [edx],eax
 00500B8A    xor         eax,eax
 00500B8C    pop         edx
 00500B8D    pop         ecx
 00500B8E    pop         ecx
 00500B8F    mov         dword ptr fs:[eax],edx
 00500B92    push        500BA7
 00500B97    lea         eax,[ebp-10]
 00500B9A    call        @UStrClr
 00500B9F    ret
>00500BA0    jmp         @HandleFinally
>00500BA5    jmp         00500B97
 00500BA7    mov         eax,dword ptr [ebp-8]
 00500BAA    pop         esi
 00500BAB    pop         ebx
 00500BAC    mov         esp,ebp
 00500BAE    pop         ebp
 00500BAF    ret         4
*}
end;

//00500BB4
procedure TCustomGrid.AdjustSize(Index:LongInt; Amount:LongInt; Rows:Boolean);
begin
{*
 00500BB4    push        ebp
 00500BB5    mov         ebp,esp
 00500BB7    add         esp,0FFFFFFC4
 00500BBA    push        ebx
 00500BBB    push        esi
 00500BBC    push        edi
 00500BBD    mov         dword ptr [ebp-4],ecx
 00500BC0    mov         dword ptr [ebp-8],edx
 00500BC3    mov         ebx,eax
 00500BC5    cmp         dword ptr [ebp-4],0
>00500BC9    je          00500D0B
 00500BCF    mov         eax,dword ptr [ebx+288]
 00500BD5    mov         dword ptr [ebp-10],eax
 00500BD8    mov         eax,dword ptr [ebx+28C]
 00500BDE    mov         dword ptr [ebp-0C],eax
 00500BE1    mov         eax,dword ptr [ebx+284]
 00500BE7    mov         dword ptr [ebp-18],eax
 00500BEA    mov         edx,dword ptr [ebx+2C0]
 00500BF0    mov         dword ptr [ebp-14],edx
 00500BF3    mov         ecx,dword ptr [ebx+29C]
 00500BF9    mov         dword ptr [ebp-2C],ecx
 00500BFC    dec         eax
 00500BFD    mov         dword ptr [ebp-24],eax
 00500C00    mov         eax,dword ptr [ebx+2A0]
 00500C06    mov         dword ptr [ebp-28],eax
 00500C09    dec         edx
 00500C0A    mov         dword ptr [ebp-20],edx
 00500C0D    xor         edi,edi
 00500C0F    xor         eax,eax
 00500C11    mov         dword ptr [ebp-1C],eax
 00500C14    mov         esi,dword ptr [ebp-4]
 00500C17    test        esi,esi
>00500C19    jge         00500C1D
 00500C1B    neg         esi
 00500C1D    cmp         byte ptr [ebp+8],0
>00500C21    je          00500C5C
 00500C23    push        ebp
 00500C24    lea         eax,[ebp-0C]
 00500C27    push        eax
 00500C28    lea         edx,[ebx+304]
 00500C2E    lea         eax,[ebx+2C0]
 00500C34    mov         ecx,dword ptr [ebx+294]
 00500C3A    call        DoSizeAdjust
 00500C3F    pop         ecx
 00500C40    mov         dword ptr [ebp-1C],eax
 00500C43    mov         eax,dword ptr [ebp-8]
 00500C46    mov         dword ptr [ebp-28],eax
 00500C49    add         esi,dword ptr [ebp-8]
 00500C4C    mov         eax,dword ptr [ebx+2CC]
 00500C52    cmp         esi,eax
>00500C54    jg          00500C92
 00500C56    dec         eax
 00500C57    mov         dword ptr [ebp-20],eax
>00500C5A    jmp         00500C92
 00500C5C    push        ebp
 00500C5D    lea         eax,[ebp-10]
 00500C60    push        eax
 00500C61    lea         edx,[ebx+300]
 00500C67    lea         eax,[ebx+284]
 00500C6D    mov         ecx,dword ptr [ebx+290]
 00500C73    call        DoSizeAdjust
 00500C78    pop         ecx
 00500C79    mov         edi,eax
 00500C7B    mov         eax,dword ptr [ebp-8]
 00500C7E    mov         dword ptr [ebp-2C],eax
 00500C81    add         esi,dword ptr [ebp-8]
 00500C84    mov         eax,dword ptr [ebx+2C8]
 00500C8A    cmp         esi,eax
>00500C8C    jg          00500C92
 00500C8E    dec         eax
 00500C8F    mov         dword ptr [ebp-24],eax
 00500C92    push        1
 00500C94    lea         ecx,[ebp-3C]
 00500C97    lea         edx,[ebp-2C]
 00500C9A    mov         eax,ebx
 00500C9C    call        TCustomGrid.GridRectToScreenRect
 00500CA1    lea         eax,[ebp-3C]
 00500CA4    call        IsRectEmpty
 00500CA9    test        al,al
>00500CAB    jne         00500CD4
 00500CAD    lea         eax,[ebp-3C]
 00500CB0    push        eax
 00500CB1    lea         eax,[ebp-3C]
 00500CB4    push        eax
 00500CB5    mov         eax,dword ptr [ebp-1C]
 00500CB8    push        eax
 00500CB9    push        edi
 00500CBA    mov         eax,ebx
 00500CBC    call        TWinControl.GetHandle
 00500CC1    push        eax
 00500CC2    call        user32.ScrollWindow
 00500CC7    mov         eax,ebx
 00500CC9    call        TWinControl.GetHandle
 00500CCE    push        eax
 00500CCF    call        user32.UpdateWindow
 00500CD4    mov         ecx,dword ptr [ebp-14]
 00500CD7    mov         edx,dword ptr [ebp-18]
 00500CDA    mov         eax,ebx
 00500CDC    mov         si,0FFA3
 00500CE0    call        @CallDynaInst
 00500CE5    mov         eax,dword ptr [ebp-10]
 00500CE8    cmp         eax,dword ptr [ebx+288]
>00500CEE    jne         00500CFB
 00500CF0    mov         edx,dword ptr [ebp-0C]
 00500CF3    cmp         edx,dword ptr [ebx+28C]
>00500CF9    je          00500D0B
 00500CFB    push        1
 00500CFD    push        1
 00500CFF    mov         ecx,dword ptr [ebp-0C]
 00500D02    mov         edx,eax
 00500D04    mov         eax,ebx
 00500D06    call        TCustomGrid.MoveCurrent
 00500D0B    pop         edi
 00500D0C    pop         esi
 00500D0D    pop         ebx
 00500D0E    mov         esp,ebp
 00500D10    pop         ebp
 00500D11    ret         4
*}
end;

//00500D14
function TCustomGrid.BoxRect(ALeft:LongInt; ATop:LongInt; ARight:LongInt; ABottom:LongInt):TRect;
begin
{*
 00500D14    push        ebp
 00500D15    mov         ebp,esp
 00500D17    add         esp,0FFFFFFF0
 00500D1A    push        esi
 00500D1B    mov         esi,eax
 00500D1D    mov         dword ptr [ebp-10],edx
 00500D20    mov         eax,dword ptr [ebp+10]
 00500D23    mov         dword ptr [ebp-8],eax
 00500D26    mov         dword ptr [ebp-0C],ecx
 00500D29    mov         eax,dword ptr [ebp+0C]
 00500D2C    mov         dword ptr [ebp-4],eax
 00500D2F    push        0
 00500D31    mov         ecx,dword ptr [ebp+8]
 00500D34    lea         edx,[ebp-10]
 00500D37    mov         eax,esi
 00500D39    call        TCustomGrid.GridRectToScreenRect
 00500D3E    pop         esi
 00500D3F    mov         esp,ebp
 00500D41    pop         ebp
 00500D42    ret         0C
*}
end;

//00500D48
procedure TCustomGrid.DoExit;
begin
{*
 00500D48    push        ebx
 00500D49    mov         ebx,eax
 00500D4B    mov         eax,ebx
 00500D4D    call        TWinControl.DoExit
 00500D52    test        byte ptr [ebx+2B5],20
>00500D59    jne         00500D62
 00500D5B    mov         eax,ebx
 00500D5D    call        TCustomGrid.HideEditor
 00500D62    pop         ebx
 00500D63    ret
*}
end;

//00500D64
function TCustomGrid.CellRect(ACol:LongInt; ARow:LongInt):TRect;
begin
{*
 00500D64    push        ebp
 00500D65    mov         ebp,esp
 00500D67    push        ebx
 00500D68    push        esi
 00500D69    push        edi
 00500D6A    mov         edi,ecx
 00500D6C    mov         esi,edx
 00500D6E    mov         ebx,eax
 00500D70    push        esi
 00500D71    push        edi
 00500D72    mov         eax,dword ptr [ebp+8]
 00500D75    push        eax
 00500D76    mov         ecx,edi
 00500D78    mov         edx,esi
 00500D7A    mov         eax,ebx
 00500D7C    call        TCustomGrid.BoxRect
 00500D81    pop         edi
 00500D82    pop         esi
 00500D83    pop         ebx
 00500D84    pop         ebp
 00500D85    ret         4
*}
end;

//00500D88
procedure TCustomGrid.sub_00500D88;
begin
{*
 00500D88    mov         al,1
 00500D8A    ret
*}
end;

//00500D8C
procedure TCustomGrid.sub_00500D8C;
begin
{*
 00500D8C    mov         al,1
 00500D8E    ret
*}
end;

//00500D90
procedure TCustomGrid.CanEditModify;
begin
{*
 00500D90    movzx       eax,byte ptr [eax+281]
 00500D97    ret
*}
end;

//00500D98
function TCustomGrid.CanEditShow:Boolean;
begin
{*
 00500D98    push        ebx
 00500D99    mov         ebx,eax
 00500D9B    mov         eax,dword ptr [ebx+2B4]
 00500DA1    and         eax,dword ptr ds:[500DE8]
 00500DA7    mov         edx,dword ptr ds:[500DEC]
 00500DAD    cmp         edx,eax
>00500DAF    jne         00500DDF
 00500DB1    cmp         byte ptr [ebx+2FD],0
>00500DB8    je          00500DDF
 00500DBA    test        byte ptr [ebx+1C],10
>00500DBE    jne         00500DDF
 00500DC0    mov         eax,ebx
 00500DC2    call        TWinControl.HandleAllocated
 00500DC7    test        al,al
>00500DC9    je          00500DDF
 00500DCB    test        byte ptr [ebx+2B5],20
>00500DD2    jne         00500DE3
 00500DD4    mov         eax,ebx
 00500DD6    call        TCustomGrid.IsActiveControl
 00500DDB    test        al,al
>00500DDD    jne         00500DE3
 00500DDF    xor         eax,eax
 00500DE1    pop         ebx
 00500DE2    ret
 00500DE3    mov         al,1
 00500DE5    pop         ebx
 00500DE6    ret
*}
end;

//00500DF0
function TCustomGrid.IsActiveControl:Boolean;
begin
{*
 00500DF0    push        ebx
 00500DF1    push        esi
 00500DF2    push        edi
 00500DF3    mov         edi,eax
 00500DF5    xor         ebx,ebx
 00500DF7    mov         dl,1
 00500DF9    mov         eax,edi
 00500DFB    call        GetParentForm
 00500E00    mov         esi,eax
 00500E02    test        esi,esi
>00500E04    je          00500E44
 00500E06    cmp         edi,dword ptr [esi+290]
>00500E0C    jne         00500E3C
 00500E0E    mov         eax,[0078DB00];^Screen:TScreen
 00500E13    mov         eax,dword ptr [eax]
 00500E15    cmp         esi,dword ptr [eax+68]
>00500E18    je          00500E40
 00500E1A    mov         eax,esi
 00500E1C    mov         edx,dword ptr ds:[784A2C];gvar_00784A2C
 00500E22    call        @IsClass
 00500E27    test        al,al
>00500E29    jne         00500E40
 00500E2B    mov         eax,esi
 00500E2D    mov         edx,dword ptr ds:[4E2058];TCustomDockForm
 00500E33    call        @IsClass
 00500E38    test        al,al
>00500E3A    jne         00500E40
 00500E3C    xor         ebx,ebx
>00500E3E    jmp         00500E6F
 00500E40    mov         bl,1
>00500E42    jmp         00500E6F
 00500E44    call        user32.GetFocus
 00500E49    mov         esi,eax
>00500E4B    jmp         00500E61
 00500E4D    cmp         esi,dword ptr [edi+258]
>00500E53    jne         00500E59
 00500E55    mov         bl,1
>00500E57    jmp         00500E61
 00500E59    push        esi
 00500E5A    call        user32.GetParent
 00500E5F    mov         esi,eax
 00500E61    push        esi
 00500E62    call        user32.IsWindow
 00500E67    test        eax,eax
>00500E69    je          00500E6F
 00500E6B    test        bl,bl
>00500E6D    je          00500E4D
 00500E6F    mov         eax,ebx
 00500E71    pop         edi
 00500E72    pop         esi
 00500E73    pop         ebx
 00500E74    ret
*}
end;

//00500E78
function TCustomGrid.IsGradientEndColorStored(Value:TColor):Boolean;
begin
{*
 00500E78    push        ebx
 00500E79    mov         ebx,eax
 00500E7B    mov         edx,0FFFFFFE7
 00500E80    mov         eax,0F0F0F0
 00500E85    call        GetShadowColor
 00500E8A    cmp         eax,dword ptr [ebx+2A8]
 00500E90    setne       al
 00500E93    pop         ebx
 00500E94    ret
*}
end;

//00500E98
procedure TCustomGrid.GetEditMask(ACol:LongInt; ARow:LongInt);
begin
{*
 00500E98    push        ebp
 00500E99    mov         ebp,esp
 00500E9B    mov         eax,dword ptr [ebp+8]
 00500E9E    call        @UStrClr
 00500EA3    pop         ebp
 00500EA4    ret         4
*}
end;

//00500EA8
procedure TCustomGrid.GetEditText(ACol:LongInt; ARow:LongInt);
begin
{*
 00500EA8    push        ebp
 00500EA9    mov         ebp,esp
 00500EAB    mov         eax,dword ptr [ebp+8]
 00500EAE    call        @UStrClr
 00500EB3    pop         ebp
 00500EB4    ret         4
*}
end;

//00500EB8
procedure TCustomGrid.sub_00500EB8;
begin
{*
 00500EB8    push        ebp
 00500EB9    mov         ebp,esp
 00500EBB    pop         ebp
 00500EBC    ret         4
*}
end;

//00500EC0
procedure TCustomGrid.GetEditLimit;
begin
{*
 00500EC0    xor         eax,eax
 00500EC2    ret
*}
end;

//00500EC4
procedure TCustomGrid.sub_00500EC4;
begin
{*
 00500EC4    xor         eax,eax
 00500EC6    ret
*}
end;

//00500EC8
procedure TCustomGrid.HideEditor;
begin
{*
 00500EC8    mov         byte ptr [eax+2FD],0
 00500ECF    call        TCustomGrid.HideEdit
 00500ED4    ret
*}
end;

//00500ED8
procedure TCustomGrid.ShowEditor;
begin
{*
 00500ED8    mov         byte ptr [eax+2FD],1
 00500EDF    call        TCustomGrid.UpdateEdit
 00500EE4    ret
*}
end;

//00500EE8
procedure TCustomGrid.ShowEditorChar(Ch:Char);
begin
{*
 00500EE8    push        ebx
 00500EE9    push        esi
 00500EEA    push        edi
 00500EEB    mov         edi,edx
 00500EED    mov         ebx,eax
 00500EEF    mov         eax,ebx
 00500EF1    call        TCustomGrid.ShowEditor
 00500EF6    mov         esi,dword ptr [ebx+2EC]
 00500EFC    test        esi,esi
>00500EFE    je          00500F18
 00500F00    push        0
 00500F02    movzx       eax,di
 00500F05    push        eax
 00500F06    push        102
 00500F0B    mov         eax,esi
 00500F0D    call        TWinControl.GetHandle
 00500F12    push        eax
 00500F13    call        user32.PostMessageW
 00500F18    pop         edi
 00500F19    pop         esi
 00500F1A    pop         ebx
 00500F1B    ret
*}
end;

//00500F1C
procedure TCustomGrid.InvalidateEditor;
begin
{*
 00500F1C    mov         dword ptr [eax+2F0],0FFFFFFFF
 00500F26    mov         dword ptr [eax+2F4],0FFFFFFFF
 00500F30    call        TCustomGrid.UpdateEdit
 00500F35    ret
*}
end;

//00500F38
procedure TCustomGrid.ReadColWidths(Reader:TReader);
begin
{*
 00500F38    push        ebx
 00500F39    push        esi
 00500F3A    push        edi
 00500F3B    push        ebp
 00500F3C    mov         ebp,edx
 00500F3E    mov         edi,eax
 00500F40    mov         dl,1
 00500F42    mov         eax,ebp
 00500F44    call        TReader.CheckValue
 00500F49    mov         ebx,dword ptr [edi+284]
 00500F4F    dec         ebx
 00500F50    test        ebx,ebx
>00500F52    jl          00500F6D
 00500F54    inc         ebx
 00500F55    xor         esi,esi
 00500F57    mov         eax,ebp
 00500F59    call        TReader.ReadInteger
 00500F5E    mov         ecx,eax
 00500F60    mov         edx,esi
 00500F62    mov         eax,edi
 00500F64    call        TCustomGrid.SetColWidths
 00500F69    inc         esi
 00500F6A    dec         ebx
>00500F6B    jne         00500F57
 00500F6D    xor         edx,edx
 00500F6F    mov         eax,ebp
 00500F71    call        TReader.CheckValue
 00500F76    pop         ebp
 00500F77    pop         edi
 00500F78    pop         esi
 00500F79    pop         ebx
 00500F7A    ret
*}
end;

//00500F7C
procedure TCustomGrid.ReadRowHeights(Reader:TReader);
begin
{*
 00500F7C    push        ebx
 00500F7D    push        esi
 00500F7E    push        edi
 00500F7F    push        ebp
 00500F80    mov         ebp,edx
 00500F82    mov         edi,eax
 00500F84    mov         dl,1
 00500F86    mov         eax,ebp
 00500F88    call        TReader.CheckValue
 00500F8D    mov         ebx,dword ptr [edi+2C0]
 00500F93    dec         ebx
 00500F94    test        ebx,ebx
>00500F96    jl          00500FB1
 00500F98    inc         ebx
 00500F99    xor         esi,esi
 00500F9B    mov         eax,ebp
 00500F9D    call        TReader.ReadInteger
 00500FA2    mov         ecx,eax
 00500FA4    mov         edx,esi
 00500FA6    mov         eax,edi
 00500FA8    call        TCustomGrid.SetRowHeights
 00500FAD    inc         esi
 00500FAE    dec         ebx
>00500FAF    jne         00500F9B
 00500FB1    xor         edx,edx
 00500FB3    mov         eax,ebp
 00500FB5    call        TReader.CheckValue
 00500FBA    pop         ebp
 00500FBB    pop         edi
 00500FBC    pop         esi
 00500FBD    pop         ebx
 00500FBE    ret
*}
end;

//00500FC0
procedure TCustomGrid.WriteColWidths(Writer:TWriter);
begin
{*
 00500FC0    push        ebx
 00500FC1    push        esi
 00500FC2    push        edi
 00500FC3    push        ebp
 00500FC4    mov         ebp,edx
 00500FC6    mov         edi,eax
 00500FC8    mov         dl,1
 00500FCA    mov         eax,ebp
 00500FCC    call        TWriter.WriteValue
 00500FD1    mov         ebx,dword ptr [edi+284]
 00500FD7    dec         ebx
 00500FD8    test        ebx,ebx
>00500FDA    jl          00500FF5
 00500FDC    inc         ebx
 00500FDD    xor         esi,esi
 00500FDF    mov         edx,esi
 00500FE1    mov         eax,edi
 00500FE3    call        TCustomGrid.GetColWidths
 00500FE8    mov         edx,eax
 00500FEA    mov         eax,ebp
 00500FEC    call        TWriter.WriteInteger
 00500FF1    inc         esi
 00500FF2    dec         ebx
>00500FF3    jne         00500FDF
 00500FF5    xor         edx,edx
 00500FF7    mov         eax,ebp
 00500FF9    call        TWriter.WriteValue
 00500FFE    pop         ebp
 00500FFF    pop         edi
 00501000    pop         esi
 00501001    pop         ebx
 00501002    ret
*}
end;

//00501004
procedure TCustomGrid.WriteRowHeights(Writer:TWriter);
begin
{*
 00501004    push        ebx
 00501005    push        esi
 00501006    push        edi
 00501007    push        ebp
 00501008    mov         ebp,edx
 0050100A    mov         edi,eax
 0050100C    mov         dl,1
 0050100E    mov         eax,ebp
 00501010    call        TWriter.WriteValue
 00501015    mov         ebx,dword ptr [edi+2C0]
 0050101B    dec         ebx
 0050101C    test        ebx,ebx
>0050101E    jl          00501039
 00501020    inc         ebx
 00501021    xor         esi,esi
 00501023    mov         edx,esi
 00501025    mov         eax,edi
 00501027    call        TCustomGrid.GetRowHeights
 0050102C    mov         edx,eax
 0050102E    mov         eax,ebp
 00501030    call        TWriter.WriteInteger
 00501035    inc         esi
 00501036    dec         ebx
>00501037    jne         00501023
 00501039    xor         edx,edx
 0050103B    mov         eax,ebp
 0050103D    call        TWriter.WriteValue
 00501042    pop         ebp
 00501043    pop         edi
 00501044    pop         esi
 00501045    pop         ebx
 00501046    ret
*}
end;

//00501048
function DoColWidths:Boolean;
begin
{*
 00501048    push        ebp
 00501049    mov         ebp,esp
 0050104B    push        ebx
 0050104C    mov         eax,dword ptr [ebp+8]
 0050104F    mov         eax,dword ptr [eax-4]
 00501052    mov         ebx,dword ptr [eax+20]
 00501055    test        ebx,ebx
>00501057    je          00501078
 00501059    mov         eax,dword ptr [ebp+8]
 0050105C    mov         eax,dword ptr [eax-8]
 0050105F    mov         edx,dword ptr [eax+300]
 00501065    mov         eax,dword ptr [ebp+8]
 00501068    mov         eax,dword ptr [ebx+300]
 0050106E    call        CompareExtents
 00501073    xor         al,1
 00501075    pop         ebx
 00501076    pop         ebp
 00501077    ret
 00501078    mov         eax,dword ptr [ebp+8]
 0050107B    mov         eax,dword ptr [eax-8]
 0050107E    cmp         dword ptr [eax+300],0
 00501085    setne       al
 00501088    pop         ebx
 00501089    pop         ebp
 0050108A    ret
*}
end;

//0050108C
function DoRowHeights:Boolean;
begin
{*
 0050108C    push        ebp
 0050108D    mov         ebp,esp
 0050108F    push        ebx
 00501090    mov         eax,dword ptr [ebp+8]
 00501093    mov         eax,dword ptr [eax-4]
 00501096    mov         ebx,dword ptr [eax+20]
 00501099    test        ebx,ebx
>0050109B    je          005010BC
 0050109D    mov         eax,dword ptr [ebp+8]
 005010A0    mov         eax,dword ptr [eax-8]
 005010A3    mov         edx,dword ptr [eax+304]
 005010A9    mov         eax,dword ptr [ebp+8]
 005010AC    mov         eax,dword ptr [ebx+304]
 005010B2    call        CompareExtents
 005010B7    xor         al,1
 005010B9    pop         ebx
 005010BA    pop         ebp
 005010BB    ret
 005010BC    mov         eax,dword ptr [ebp+8]
 005010BF    mov         eax,dword ptr [eax-8]
 005010C2    cmp         dword ptr [eax+304],0
 005010C9    setne       al
 005010CC    pop         ebx
 005010CD    pop         ebp
 005010CE    ret
*}
end;

//005010D0
procedure TCustomGrid.DefineProperties(Filer:TFiler);
begin
{*
 005010D0    push        ebp
 005010D1    mov         ebp,esp
 005010D3    add         esp,0FFFFFFF8
 005010D6    push        ebx
 005010D7    mov         dword ptr [ebp-4],edx
 005010DA    mov         dword ptr [ebp-8],eax
 005010DD    mov         edx,dword ptr [ebp-4]
 005010E0    mov         eax,dword ptr [ebp-8]
 005010E3    call        TWinControl.DefineProperties
 005010E8    mov         eax,dword ptr [ebp-8]
 005010EB    cmp         byte ptr [eax+319],0
>005010F2    je          00501144
 005010F4    mov         eax,dword ptr [ebp-8]
 005010F7    push        eax
 005010F8    push        500F38;TCustomGrid.ReadColWidths
 005010FD    mov         eax,dword ptr [ebp-8]
 00501100    push        eax
 00501101    push        500FC0;TCustomGrid.WriteColWidths
 00501106    push        ebp
 00501107    call        DoColWidths
 0050110C    pop         ecx
 0050110D    mov         ecx,eax
 0050110F    mov         edx,501158;'ColWidths'
 00501114    mov         eax,dword ptr [ebp-4]
 00501117    mov         ebx,dword ptr [eax]
 00501119    call        dword ptr [ebx+4]
 0050111C    mov         eax,dword ptr [ebp-8]
 0050111F    push        eax
 00501120    push        500F7C;TCustomGrid.ReadRowHeights
 00501125    mov         eax,dword ptr [ebp-8]
 00501128    push        eax
 00501129    push        501004;TCustomGrid.WriteRowHeights
 0050112E    push        ebp
 0050112F    call        DoRowHeights
 00501134    pop         ecx
 00501135    mov         ecx,eax
 00501137    mov         edx,501178;'RowHeights'
 0050113C    mov         eax,dword ptr [ebp-4]
 0050113F    mov         ebx,dword ptr [eax]
 00501141    call        dword ptr [ebx+4]
 00501144    pop         ebx
 00501145    pop         ecx
 00501146    pop         ecx
 00501147    pop         ebp
 00501148    ret
*}
end;

//00501190
procedure TCustomGrid.MoveColumn(FromIndex:LongInt; ToIndex:LongInt);
begin
{*
 00501190    push        ebx
 00501191    push        esi
 00501192    push        edi
 00501193    push        ebp
 00501194    add         esp,0FFFFFFF0
 00501197    mov         edi,ecx
 00501199    mov         esi,edx
 0050119B    mov         ebx,eax
 0050119D    cmp         edi,esi
>0050119F    je          00501259
 005011A5    cmp         dword ptr [ebx+300],0
>005011AC    je          005011D1
 005011AE    lea         ecx,[edi+1]
 005011B1    lea         ebp,[esi+1]
 005011B4    mov         edx,ebp
 005011B6    lea         eax,[ebx+300]
 005011BC    call        MoveExtent
 005011C1    lea         ecx,[edi+1]
 005011C4    mov         edx,ebp
 005011C6    lea         eax,[ebx+308]
 005011CC    call        MoveExtent
 005011D1    push        edi
 005011D2    lea         edx,[ebx+288]
 005011D8    mov         ecx,esi
 005011DA    mov         eax,ebx
 005011DC    call        TCustomGrid.MoveAdjust
 005011E1    push        edi
 005011E2    lea         edx,[ebx+278]
 005011E8    mov         ecx,esi
 005011EA    mov         eax,ebx
 005011EC    call        TCustomGrid.MoveAdjust
 005011F1    push        edi
 005011F2    lea         edx,[ebx+2F0]
 005011F8    mov         ecx,esi
 005011FA    mov         eax,ebx
 005011FC    call        TCustomGrid.MoveAdjust
 00501201    xor         eax,eax
 00501203    mov         dword ptr [esp+4],eax
 00501207    mov         eax,ebx
 00501209    call        TCustomGrid.GetVisibleRowCount
 0050120E    mov         dword ptr [esp+0C],eax
 00501212    cmp         edi,esi
>00501214    jle         0050121F
 00501216    mov         dword ptr [esp],esi
 00501219    mov         dword ptr [esp+8],edi
>0050121D    jmp         00501226
 0050121F    mov         dword ptr [esp],edi
 00501222    mov         dword ptr [esp+8],esi
 00501226    mov         edx,esp
 00501228    mov         eax,ebx
 0050122A    call        TCustomGrid.InvalidateRect
 0050122F    mov         ecx,edi
 00501231    mov         edx,esi
 00501233    mov         eax,ebx
 00501235    mov         si,0FFA5
 00501239    call        @CallDynaInst
 0050123E    cmp         dword ptr [ebx+300],0
>00501245    je          00501252
 00501247    mov         eax,ebx
 00501249    mov         si,0FFA0
 0050124D    call        @CallDynaInst
 00501252    mov         eax,ebx
 00501254    call        TCustomGrid.UpdateEdit
 00501259    add         esp,10
 0050125C    pop         ebp
 0050125D    pop         edi
 0050125E    pop         esi
 0050125F    pop         ebx
 00501260    ret
*}
end;

//00501264
procedure TCustomGrid.sub_00501264;
begin
{*
 00501264    ret
*}
end;

//00501268
procedure TCustomGrid.MoveRow(FromIndex:LongInt; ToIndex:LongInt);
begin
{*
 00501268    push        ebx
 00501269    push        esi
 0050126A    push        edi
 0050126B    mov         edi,ecx
 0050126D    mov         esi,edx
 0050126F    mov         ebx,eax
 00501271    cmp         dword ptr [ebx+304],0
>00501278    je          0050128B
 0050127A    lea         ecx,[edi+1]
 0050127D    lea         edx,[esi+1]
 00501280    lea         eax,[ebx+304]
 00501286    call        MoveExtent
 0050128B    push        edi
 0050128C    lea         edx,[ebx+28C]
 00501292    mov         ecx,esi
 00501294    mov         eax,ebx
 00501296    call        TCustomGrid.MoveAdjust
 0050129B    push        edi
 0050129C    lea         edx,[ebx+27C]
 005012A2    mov         ecx,esi
 005012A4    mov         eax,ebx
 005012A6    call        TCustomGrid.MoveAdjust
 005012AB    push        edi
 005012AC    lea         edx,[ebx+2F4]
 005012B2    mov         ecx,esi
 005012B4    mov         eax,ebx
 005012B6    call        TCustomGrid.MoveAdjust
 005012BB    mov         ecx,edi
 005012BD    mov         edx,esi
 005012BF    mov         eax,ebx
 005012C1    mov         si,0FFA4
 005012C5    call        @CallDynaInst
 005012CA    cmp         dword ptr [ebx+304],0
>005012D1    je          005012DE
 005012D3    mov         eax,ebx
 005012D5    mov         si,0FF9F
 005012D9    call        @CallDynaInst
 005012DE    mov         eax,ebx
 005012E0    call        TCustomGrid.UpdateEdit
 005012E5    pop         edi
 005012E6    pop         esi
 005012E7    pop         ebx
 005012E8    ret
*}
end;

//005012EC
procedure TCustomGrid.sub_005012EC;
begin
{*
 005012EC    ret
*}
end;

//005012F0
function TCustomGrid.MouseCoord(X:Integer; Y:Integer):TGridCoord;
begin
{*
 005012F0    push        ebp
 005012F1    mov         ebp,esp
 005012F3    add         esp,0FFFFFF98
 005012F6    push        ebx
 005012F7    push        esi
 005012F8    push        edi
 005012F9    mov         dword ptr [ebp-4],ecx
 005012FC    mov         edi,edx
 005012FE    mov         esi,eax
 00501300    mov         ebx,dword ptr [ebp+8]
 00501303    lea         edx,[ebp-68]
 00501306    mov         eax,esi
 00501308    call        TCustomGrid.CalcDrawInfo
 0050130D    lea         eax,[ebp-68]
 00501310    push        eax
 00501311    push        ebx
 00501312    mov         ecx,dword ptr [ebp-4]
 00501315    mov         edx,edi
 00501317    mov         eax,esi
 00501319    call        TCustomGrid.CalcCoordFromPoint
 0050131E    cmp         dword ptr [ebx],0
>00501321    jge         0050132C
 00501323    mov         dword ptr [ebx+4],0FFFFFFFF
>0050132A    jmp         00501338
 0050132C    cmp         dword ptr [ebx+4],0
>00501330    jge         00501338
 00501332    mov         dword ptr [ebx],0FFFFFFFF
 00501338    pop         edi
 00501339    pop         esi
 0050133A    pop         ebx
 0050133B    mov         esp,ebp
 0050133D    pop         ebp
 0050133E    ret         4
*}
end;

//00501344
{*function sub_00501344:?;
begin
 00501344    mov         al,1
 00501346    ret
end;*}

//00501348
procedure TCustomGrid.sub_00501348;
begin
{*
 00501348    ret
*}
end;

//0050134C
function TCustomGrid.Sizing(X:Integer; Y:Integer):Boolean;
begin
{*
 0050134C    push        ebx
 0050134D    push        esi
 0050134E    push        edi
 0050134F    push        ebp
 00501350    add         esp,0FFFFFF90
 00501353    mov         ebp,ecx
 00501355    mov         edi,edx
 00501357    mov         esi,eax
 00501359    movzx       eax,byte ptr [esi+318]
 00501360    mov         byte ptr [esp],al
 00501363    cmp         byte ptr [esp],0
>00501367    jne         00501397
 00501369    lea         edx,[esp+10]
 0050136D    mov         eax,esi
 0050136F    call        TCustomGrid.CalcDrawInfo
 00501374    push        esp
 00501375    lea         eax,[esp+8]
 00501379    push        eax
 0050137A    lea         eax,[esp+10]
 0050137E    push        eax
 0050137F    lea         eax,[esp+18]
 00501383    push        eax
 00501384    lea         eax,[esp+20]
 00501388    push        eax
 00501389    mov         ecx,ebp
 0050138B    mov         edx,edi
 0050138D    mov         eax,esi
 0050138F    mov         ebx,dword ptr [eax]
 00501391    call        dword ptr [ebx+0F0]
 00501397    cmp         byte ptr [esp],0
 0050139B    setne       al
 0050139E    add         esp,70
 005013A1    pop         ebp
 005013A2    pop         edi
 005013A3    pop         esi
 005013A4    pop         ebx
 005013A5    ret
*}
end;

//005013A8
procedure TCustomGrid.TopLeftChanged;
begin
{*
 005013A8    push        ebx
 005013A9    add         esp,0FFFFFFF0
 005013AC    mov         ebx,eax
 005013AE    cmp         byte ptr [ebx+2FD],0
>005013B5    je          005013E1
 005013B7    cmp         dword ptr [ebx+2EC],0
>005013BE    je          005013E1
 005013C0    push        esp
 005013C1    mov         ecx,dword ptr [ebx+28C]
 005013C7    mov         edx,dword ptr [ebx+288]
 005013CD    mov         eax,ebx
 005013CF    call        TCustomGrid.CellRect
 005013D4    mov         edx,esp
 005013D6    mov         eax,dword ptr [ebx+2EC]
 005013DC    call        TInplaceEdit.UpdateLoc
 005013E1    add         esp,10
 005013E4    pop         ebx
 005013E5    ret
*}
end;

//005013E8
procedure FillDWord(var Dest:void ; Count:Integer; Value:Integer);
begin
{*
 005013E8    xchg        edx,ecx
 005013EA    push        edi
 005013EB    mov         edi,eax
 005013ED    mov         eax,edx
 005013EF    rep stos    dword ptr [edi]
 005013F1    pop         edi
 005013F2    ret
*}
end;

//005013F4
function StackAlloc(Size:Integer):Pointer;
begin
{*
 005013F4    pop         ecx
 005013F5    mov         edx,esp
 005013F7    add         eax,3
 005013FA    and         eax,0FFFFFFFC
 005013FD    cmp         eax,0FFC
>00501402    jle         00501417
 00501404    sub         esp,0FFC
 0050140A    push        eax
 0050140B    sub         eax,1000
>00501410    jns         00501404
 00501412    add         eax,1000
 00501417    sub         esp,eax
 00501419    mov         eax,esp
 0050141B    push        edx
 0050141C    mov         edx,esp
 0050141E    sub         edx,4
 00501421    push        edx
 00501422    push        ecx
 00501423    ret
*}
end;

//00501424
procedure StackFree(P:Pointer);
begin
{*
 00501424    pop         ecx
 00501425    mov         edx,dword ptr [esp]
 00501428    sub         eax,8
 0050142B    cmp         edx,esp
>0050142D    jne         00501437
 0050142F    cmp         edx,eax
>00501431    jne         00501437
 00501433    mov         esp,dword ptr [esp+4]
 00501437    push        ecx
 00501438    ret
*}
end;

//0050143C
procedure DrawAxisLines(const AxisInfo:TGridAxisDrawInfo; Cell:Integer; MajorIndex:Integer; UseOnColor:Boolean);
begin
{*
 0050143C    push        ebp
 0050143D    mov         ebp,esp
 0050143F    add         esp,0FFFFFFD4
 00501442    push        ebx
 00501443    push        esi
 00501444    push        edi
 00501445    mov         dword ptr [ebp-4],ecx
 00501448    mov         edi,edx
 0050144A    mov         ebx,eax
 0050144C    mov         eax,dword ptr [ebp+0C]
 0050144F    mov         eax,dword ptr [eax+1C]
 00501452    mov         eax,dword ptr [eax-4]
 00501455    mov         esi,dword ptr [eax+270]
 0050145B    cmp         dword ptr [ebx],0
>0050145E    je          00501616
 00501464    mov         eax,dword ptr [ebp+0C]
 00501467    mov         eax,dword ptr [eax+1C]
 0050146A    mov         eax,dword ptr [eax-4]
 0050146D    mov         edx,dword ptr [eax+2B0]
 00501473    mov         eax,dword ptr [esi+44]
 00501476    call        TPen.SetWidth
 0050147B    cmp         byte ptr [ebp+8],0
>0050147F    je          00501491
 00501481    mov         eax,dword ptr [ebp+0C]
 00501484    mov         edx,dword ptr [eax+0C]
 00501487    mov         eax,dword ptr [esi+44]
 0050148A    call        TPen.SetColor
>0050148F    jmp         0050149F
 00501491    mov         eax,dword ptr [ebp+0C]
 00501494    mov         edx,dword ptr [eax+8]
 00501497    mov         eax,dword ptr [esi+44]
 0050149A    call        TPen.SetColor
 0050149F    mov         eax,dword ptr [esi+44]
 005014A2    mov         eax,dword ptr [eax+10]
 005014A5    cmp         dword ptr [eax+1C],1
>005014A9    jle         005014E1
 005014AB    xor         edx,edx
 005014AD    mov         dword ptr [ebp-2C],edx
 005014B0    mov         eax,dword ptr [eax+18]
 005014B3    mov         dword ptr [ebp-28],eax
 005014B6    xor         eax,eax
 005014B8    mov         dword ptr [ebp-24],eax
 005014BB    push        0
 005014BD    push        0
 005014BF    lea         eax,[ebp-2C]
 005014C2    push        eax
 005014C3    mov         eax,dword ptr [esi+44]
 005014C6    mov         eax,dword ptr [eax+10]
 005014C9    mov         eax,dword ptr [eax+1C]
 005014CC    push        eax
 005014CD    push        12200
 005014D2    call        gdi32.ExtCreatePen
 005014D7    mov         edx,eax
 005014D9    mov         eax,dword ptr [esi+44]
 005014DC    call        TPen.SetHandle
 005014E1    mov         eax,dword ptr [ebp+0C]
 005014E4    mov         eax,dword ptr [eax+1C]
 005014E7    mov         eax,dword ptr [eax-8]
 005014EA    mov         dword ptr [ebp-10],eax
 005014ED    mov         edx,edi
 005014EF    mov         eax,dword ptr [ebx+2C]
 005014F2    call        dword ptr [ebx+28]
 005014F5    mov         edx,dword ptr [ebp+0C]
 005014F8    mov         edx,dword ptr [edx+14]
 005014FB    mov         ecx,dword ptr [ebp-4]
 005014FE    mov         edx,dword ptr [edx+ecx*4]
 00501501    mov         ecx,dword ptr [ebx]
 00501503    shr         ecx,1
 00501505    add         edx,ecx
 00501507    add         eax,edx
 00501509    mov         dword ptr [ebp-8],eax
 0050150C    mov         eax,dword ptr [ebp+0C]
 0050150F    mov         eax,dword ptr [eax+1C]
 00501512    mov         eax,dword ptr [eax-4]
 00501515    mov         si,0FFC7
 00501519    call        @CallDynaInst
 0050151E    test        al,al
>00501520    je          0050152B
 00501522    cmp         dword ptr [ebp-4],0
>00501526    jne         0050152B
 00501528    inc         dword ptr [ebp-8]
 0050152B    mov         eax,dword ptr [ebp-4]
 0050152E    xor         eax,1
 00501531    mov         edx,dword ptr [ebp+0C]
 00501534    mov         edx,dword ptr [edx+14]
 00501537    mov         edx,dword ptr [edx+eax*4]
 0050153A    mov         dword ptr [ebp-18],edx
 0050153D    add         eax,2
 00501540    mov         edx,dword ptr [ebp+0C]
 00501543    mov         edx,dword ptr [edx+14]
 00501546    mov         eax,dword ptr [edx+eax*4]
 00501549    mov         dword ptr [ebp-1C],eax
 0050154C    mov         eax,dword ptr [ebp-4]
 0050154F    add         eax,2
 00501552    mov         edx,dword ptr [ebp+0C]
 00501555    mov         edx,dword ptr [edx+14]
 00501558    mov         eax,dword ptr [edx+eax*4]
 0050155B    add         eax,dword ptr [ebx]
 0050155D    mov         dword ptr [ebp-14],eax
 00501560    mov         eax,dword ptr [ebp+0C]
 00501563    mov         eax,dword ptr [eax+1C]
 00501566    mov         eax,dword ptr [eax-0C]
 00501569    add         eax,eax
 0050156B    add         eax,eax
 0050156D    mov         dword ptr [ebp-20],eax
 00501570    xor         eax,eax
 00501572    mov         dword ptr [ebp-0C],eax
 00501575    mov         eax,dword ptr [ebp-0C]
 00501578    add         eax,dword ptr [ebp-4]
 0050157B    mov         edx,dword ptr [ebp-10]
 0050157E    mov         ecx,dword ptr [ebp-8]
 00501581    mov         dword ptr [edx+eax*4],ecx
 00501584    mov         eax,dword ptr [ebp-4]
 00501587    xor         eax,1
 0050158A    mov         edx,eax
 0050158C    add         edx,dword ptr [ebp-0C]
 0050158F    mov         ecx,dword ptr [ebp-10]
 00501592    mov         esi,dword ptr [ebp-18]
 00501595    mov         dword ptr [ecx+edx*4],esi
 00501598    add         dword ptr [ebp-0C],2
 0050159C    mov         edx,dword ptr [ebp-0C]
 0050159F    add         edx,dword ptr [ebp-4]
 005015A2    mov         ecx,dword ptr [ebp-10]
 005015A5    mov         esi,dword ptr [ebp-8]
 005015A8    mov         dword ptr [ecx+edx*4],esi
 005015AB    add         eax,dword ptr [ebp-0C]
 005015AE    mov         edx,dword ptr [ebp-10]
 005015B1    mov         ecx,dword ptr [ebp-1C]
 005015B4    mov         dword ptr [edx+eax*4],ecx
 005015B7    add         dword ptr [ebp-0C],2
 005015BB    inc         edi
 005015BC    mov         edx,edi
 005015BE    mov         eax,dword ptr [ebx+2C]
 005015C1    call        dword ptr [ebx+28]
 005015C4    add         eax,dword ptr [ebx]
 005015C6    test        eax,eax
>005015C8    jg          005015CF
 005015CA    cmp         edi,dword ptr [ebx+10]
>005015CD    jle         005015BB
 005015CF    add         dword ptr [ebp-8],eax
 005015D2    mov         eax,dword ptr [ebp-8]
 005015D5    cmp         eax,dword ptr [ebp-14]
>005015D8    jg          005015E7
 005015DA    cmp         edi,dword ptr [ebx+10]
>005015DD    jg          005015E7
 005015DF    mov         eax,dword ptr [ebp-0C]
 005015E2    cmp         eax,dword ptr [ebp-20]
>005015E5    jle         00501575
 005015E7    mov         eax,dword ptr [ebp-0C]
 005015EA    shr         eax,2
 005015ED    push        eax
 005015EE    mov         eax,dword ptr [ebp+0C]
 005015F1    mov         eax,dword ptr [eax+1C]
 005015F4    mov         eax,dword ptr [eax-10]
 005015F7    push        eax
 005015F8    mov         eax,dword ptr [ebp-10]
 005015FB    push        eax
 005015FC    mov         eax,dword ptr [ebp+0C]
 005015FF    mov         eax,dword ptr [eax+1C]
 00501602    mov         eax,dword ptr [eax-4]
 00501605    mov         eax,dword ptr [eax+270]
 0050160B    call        TCanvas.GetHandle
 00501610    push        eax
 00501611    call        gdi32.PolyPolyline
 00501616    pop         edi
 00501617    pop         esi
 00501618    pop         ebx
 00501619    mov         esp,ebp
 0050161B    pop         ebp
 0050161C    ret         4
*}
end;

//00501620
procedure DrawLines(DoHorz:Boolean; DoVert:Boolean; Col:LongInt; Row:LongInt; const CellBounds:array[$0..-$1] of System.Integer; const _Dv_:$0..-$1; OnColor:TColor; OffColor:TColor);
begin
{*
 00501620    push        ebp
 00501621    mov         ebp,esp
 00501623    push        ecx
 00501624    push        ebx
 00501625    push        esi
 00501626    push        edi
 00501627    mov         esi,ecx
 00501629    mov         byte ptr [ebp-1],dl
 0050162C    mov         ebx,eax
 0050162E    mov         edi,dword ptr [ebp+18]
 00501631    mov         eax,dword ptr [ebp+14]
 00501634    mov         eax,dword ptr [eax]
 00501636    mov         edx,dword ptr [ebp+14]
 00501639    cmp         eax,dword ptr [edx+8]
>0050163C    je          005016A8
 0050163E    mov         eax,dword ptr [ebp+14]
 00501641    mov         eax,dword ptr [eax+4]
 00501644    mov         edx,dword ptr [ebp+14]
 00501647    cmp         eax,dword ptr [edx+0C]
>0050164A    je          005016A8
 0050164C    test        bl,bl
>0050164E    jne         0050167D
 00501650    push        ebp
 00501651    push        ebx
 00501652    mov         eax,dword ptr [ebp+1C]
 00501655    add         eax,0FFFFFFC0
 00501658    mov         ecx,1
 0050165D    mov         edx,edi
 0050165F    call        DrawAxisLines
 00501664    pop         ecx
 00501665    push        ebp
 00501666    movzx       eax,byte ptr [ebp-1]
 0050166A    push        eax
 0050166B    mov         eax,dword ptr [ebp+1C]
 0050166E    add         eax,0FFFFFF90
 00501671    xor         ecx,ecx
 00501673    mov         edx,esi
 00501675    call        DrawAxisLines
 0050167A    pop         ecx
>0050167B    jmp         005016A8
 0050167D    push        ebp
 0050167E    movzx       eax,byte ptr [ebp-1]
 00501682    push        eax
 00501683    mov         eax,dword ptr [ebp+1C]
 00501686    add         eax,0FFFFFF90
 00501689    xor         ecx,ecx
 0050168B    mov         edx,esi
 0050168D    call        DrawAxisLines
 00501692    pop         ecx
 00501693    push        ebp
 00501694    push        ebx
 00501695    mov         eax,dword ptr [ebp+1C]
 00501698    add         eax,0FFFFFFC0
 0050169B    mov         ecx,1
 005016A0    mov         edx,edi
 005016A2    call        DrawAxisLines
 005016A7    pop         ecx
 005016A8    pop         edi
 005016A9    pop         esi
 005016AA    pop         ebx
 005016AB    pop         ecx
 005016AC    pop         ebp
 005016AD    ret         14
*}
end;

//005016B0
procedure DrawCells(ACol:LongInt; ARow:LongInt; StartX:Integer; StartY:Integer; StopX:Integer; StopY:Integer; AColor:TColor; IncludeDrawState:TGridDrawState);
begin
{*
 005016B0    push        ebp
 005016B1    mov         ebp,esp
 005016B3    add         esp,0FFFFFFC0
 005016B6    push        ebx
 005016B7    push        esi
 005016B8    push        edi
 005016B9    mov         dword ptr [ebp-8],ecx
 005016BC    mov         dword ptr [ebp-4],eax
 005016BF    mov         ebx,dword ptr [ebp+1C]
 005016C2    add         ebx,0FFFFFFFC
 005016C5    mov         dword ptr [ebp-0C],edx
 005016C8    mov         eax,dword ptr [ebp+18]
 005016CB    mov         dword ptr [ebp-2C],eax
>005016CE    jmp         00501A76
 005016D3    mov         edi,dword ptr [ebp-4]
 005016D6    mov         eax,dword ptr [ebp-8]
 005016D9    mov         dword ptr [ebp-30],eax
 005016DC    mov         eax,dword ptr [ebx]
 005016DE    mov         edx,dword ptr [ebp-0C]
 005016E1    call        TCustomGrid.GetRowHeights
 005016E6    add         eax,dword ptr [ebp-2C]
 005016E9    mov         dword ptr [ebp-24],eax
>005016EC    jmp         00501A51
 005016F1    mov         eax,dword ptr [ebx]
 005016F3    mov         edx,edi
 005016F5    call        TCustomGrid.GetColWidths
 005016FA    add         eax,dword ptr [ebp-30]
 005016FD    mov         dword ptr [ebp-28],eax
 00501700    mov         eax,dword ptr [ebp-28]
 00501703    cmp         eax,dword ptr [ebp-30]
>00501706    jle         00501A44
 0050170C    lea         eax,[ebp-30]
 0050170F    push        eax
 00501710    mov         eax,dword ptr [ebx]
 00501712    mov         eax,dword ptr [eax+270]
 00501718    call        TCanvas.GetHandle
 0050171D    push        eax
 0050171E    call        gdi32.RectVisible
 00501723    test        eax,eax
>00501725    je          00501A44
 0050172B    movzx       eax,byte ptr [ebp+8]
 0050172F    mov         byte ptr [ebp-0D],al
 00501732    mov         eax,dword ptr [ebx]
 00501734    cmp         edi,dword ptr [eax+328]
>0050173A    jne         00501767
 0050173C    mov         eax,dword ptr [ebx]
 0050173E    mov         eax,dword ptr [eax+32C]
 00501744    cmp         eax,dword ptr [ebp-0C]
>00501747    jne         00501767
 00501749    mov         eax,dword ptr [ebx]
 0050174B    test        byte ptr [eax+2B6],2
>00501752    je          00501758
 00501754    or          byte ptr [ebp-0D],10
 00501758    mov         eax,dword ptr [ebx]
 0050175A    cmp         byte ptr [eax+330],0
>00501761    je          00501767
 00501763    or          byte ptr [ebp-0D],20
 00501767    mov         eax,dword ptr [ebx]
 00501769    call        TCustomGrid.IsActiveControl
 0050176E    mov         byte ptr [ebp-0E],al
 00501771    cmp         byte ptr [ebp-0E],0
>00501775    je          0050179F
 00501777    mov         eax,dword ptr [ebx]
 00501779    mov         eax,dword ptr [eax+28C]
 0050177F    cmp         eax,dword ptr [ebp-0C]
>00501782    jne         0050179F
 00501784    mov         eax,dword ptr [ebx]
 00501786    cmp         edi,dword ptr [eax+288]
>0050178C    jne         0050179F
 0050178E    mov         eax,dword ptr [ebp-2C]
 00501791    push        eax
 00501792    mov         eax,dword ptr [ebp-30]
 00501795    push        eax
 00501796    call        user32.SetCaretPos
 0050179B    or          byte ptr [ebp-0D],2
 0050179F    mov         eax,dword ptr [ebp+1C]
 005017A2    lea         ecx,[eax-80]
 005017A5    mov         edx,dword ptr [ebp-0C]
 005017A8    mov         eax,edi
 005017AA    call        PointInGridRect
 005017AF    test        al,al
>005017B1    je          005017B7
 005017B3    or          byte ptr [ebp-0D],1
 005017B7    test        byte ptr [ebp-0D],2
>005017BB    je          005017DF
 005017BD    mov         eax,dword ptr [ebx]
 005017BF    test        byte ptr [eax+2B5],4
>005017C6    je          005017DF
 005017C8    mov         eax,dword ptr [ebx]
 005017CA    cmp         byte ptr [eax+2FD],0
>005017D1    je          005017DF
 005017D3    mov         eax,dword ptr [ebx]
 005017D5    test        byte ptr [eax+1C],10
>005017D9    je          00501A44
 005017DF    mov         eax,dword ptr [ebx]
 005017E1    cmp         byte ptr [eax+2FC],0
>005017E8    jne         005017F2
 005017EA    mov         eax,dword ptr [ebx]
 005017EC    test        byte ptr [eax+1C],10
>005017F0    je          0050185A
 005017F2    mov         eax,dword ptr [ebx]
 005017F4    mov         edx,dword ptr [eax+64]
 005017F7    mov         eax,dword ptr [ebx]
 005017F9    mov         eax,dword ptr [eax+270]
 005017FF    call        TCanvas.SetFont
 00501804    test        byte ptr [ebp-0D],1
>00501808    je          00501840
 0050180A    test        byte ptr [ebp-0D],2
>0050180E    je          00501828
 00501810    mov         eax,dword ptr [ebx]
 00501812    mov         eax,dword ptr [eax+2B4]
 00501818    and         eax,dword ptr ds:[501A98]
 0050181E    mov         edx,dword ptr ds:[501A9C]
 00501824    cmp         edx,eax
>00501826    je          00501840
 00501828    push        edi
 00501829    mov         eax,dword ptr [ebp-0C]
 0050182C    push        eax
 0050182D    lea         edx,[ebp-30]
 00501830    mov         eax,dword ptr [ebx]
 00501832    movzx       ecx,byte ptr [ebp-0D]
 00501836    mov         esi,dword ptr [eax]
 00501838    call        dword ptr [esi+104]
>0050183E    jmp         0050185A
 00501840    movzx       eax,byte ptr [ebp-0D]
 00501844    push        eax
 00501845    push        edi
 00501846    mov         eax,dword ptr [ebp-0C]
 00501849    push        eax
 0050184A    lea         edx,[ebp-30]
 0050184D    mov         eax,dword ptr [ebx]
 0050184F    mov         ecx,dword ptr [ebp+0C]
 00501852    mov         esi,dword ptr [eax]
 00501854    call        dword ptr [esi+100]
 0050185A    push        edi
 0050185B    lea         esi,[ebp-30]
 0050185E    lea         edi,[ebp-20]
 00501861    movs        dword ptr [edi],dword ptr [esi]
 00501862    movs        dword ptr [edi],dword ptr [esi]
 00501863    movs        dword ptr [edi],dword ptr [esi]
 00501864    movs        dword ptr [edi],dword ptr [esi]
 00501865    pop         edi
 00501866    test        byte ptr [ebp-0D],20
>0050186A    je          00501872
 0050186C    inc         dword ptr [ebp-1C]
 0050186F    inc         dword ptr [ebp-20]
 00501872    lea         eax,[ebp-20]
 00501875    push        eax
 00501876    movzx       eax,byte ptr [ebp-0D]
 0050187A    push        eax
 0050187B    mov         eax,dword ptr [ebx]
 0050187D    mov         ecx,dword ptr [ebp-0C]
 00501880    mov         edx,edi
 00501882    mov         esi,dword ptr [eax]
 00501884    call        dword ptr [esi+0FC]
 0050188A    mov         eax,dword ptr [ebx]
 0050188C    cmp         byte ptr [eax+2FC],0
>00501893    je          0050195D
 00501899    test        byte ptr [ebp-0D],4
>0050189D    je          0050195D
 005018A3    mov         eax,dword ptr [ebx]
 005018A5    cmp         byte ptr [eax+1E9],0
>005018AC    je          0050195D
 005018B2    mov         eax,dword ptr [ebp+1C]
 005018B5    mov         eax,dword ptr [eax-84]
 005018BB    mov         edx,dword ptr [ebp+1C]
 005018BE    or          eax,dword ptr [edx-88]
>005018C4    je          0050195D
 005018CA    mov         eax,dword ptr [ebx]
 005018CC    cmp         byte ptr [eax+324],0
>005018D3    jne         0050195D
 005018D9    test        byte ptr [ebp-0D],20
>005018DD    jne         0050195D
 005018DF    push        edi
 005018E0    lea         esi,[ebp-30]
 005018E3    lea         edi,[ebp-40]
 005018E6    movs        dword ptr [edi],dword ptr [esi]
 005018E7    movs        dword ptr [edi],dword ptr [esi]
 005018E8    movs        dword ptr [edi],dword ptr [esi]
 005018E9    movs        dword ptr [edi],dword ptr [esi]
 005018EA    pop         edi
 005018EB    mov         eax,dword ptr [ebp+1C]
 005018EE    test        byte ptr [eax-84],4
>005018F5    jne         00501902
 005018F7    mov         eax,dword ptr [ebp+1C]
 005018FA    mov         eax,dword ptr [eax-70]
 005018FD    add         dword ptr [ebp-38],eax
>00501900    jmp         00501917
 00501902    mov         eax,dword ptr [ebp+1C]
 00501905    test        byte ptr [eax-84],8
>0050190C    jne         00501917
 0050190E    mov         eax,dword ptr [ebp+1C]
 00501911    mov         eax,dword ptr [eax-40]
 00501914    add         dword ptr [ebp-34],eax
 00501917    mov         eax,dword ptr [ebp+1C]
 0050191A    mov         eax,dword ptr [eax-84]
 00501920    push        eax
 00501921    push        4
 00501923    lea         eax,[ebp-40]
 00501926    push        eax
 00501927    mov         eax,dword ptr [ebx]
 00501929    mov         eax,dword ptr [eax+270]
 0050192F    call        TCanvas.GetHandle
 00501934    push        eax
 00501935    call        user32.DrawEdge
 0050193A    mov         eax,dword ptr [ebp+1C]
 0050193D    mov         eax,dword ptr [eax-88]
 00501943    push        eax
 00501944    push        4
 00501946    lea         eax,[ebp-40]
 00501949    push        eax
 0050194A    mov         eax,dword ptr [ebx]
 0050194C    mov         eax,dword ptr [eax+270]
 00501952    call        TCanvas.GetHandle
 00501957    push        eax
 00501958    call        user32.DrawEdge
 0050195D    mov         eax,dword ptr [ebx]
 0050195F    cmp         byte ptr [eax+2FC],0
>00501966    je          00501A44
 0050196C    mov         eax,dword ptr [ebx]
 0050196E    test        byte ptr [eax+1C],10
>00501972    jne         00501A44
 00501978    test        byte ptr [ebp-0D],2
>0050197C    je          00501A44
 00501982    mov         eax,dword ptr [ebx]
 00501984    mov         eax,dword ptr [eax+2B4]
 0050198A    and         eax,dword ptr ds:[501AA0]
 00501990    mov         edx,dword ptr ds:[501AA0]
 00501996    cmp         edx,eax
>00501998    je          00501A44
 0050199E    mov         eax,dword ptr [ebx]
 005019A0    test        byte ptr [eax+2B5],10
>005019A7    jne         00501A44
 005019AD    push        edi
 005019AE    lea         esi,[ebp-30]
 005019B1    lea         edi,[ebp-40]
 005019B4    movs        dword ptr [edi],dword ptr [esi]
 005019B5    movs        dword ptr [edi],dword ptr [esi]
 005019B6    movs        dword ptr [edi],dword ptr [esi]
 005019B7    movs        dword ptr [edi],dword ptr [esi]
 005019B8    pop         edi
 005019B9    mov         eax,dword ptr [ebx]
 005019BB    cmp         byte ptr [eax+324],1
>005019C2    jne         005019DB
 005019C4    mov         eax,[0078D080];^gvar_00784C80
 005019C9    cmp         dword ptr [eax],6
>005019CC    jl          005019DB
 005019CE    push        0FF
 005019D0    push        0FF
 005019D2    lea         eax,[ebp-40]
 005019D5    push        eax
 005019D6    call        user32.InflateRect
 005019DB    mov         eax,dword ptr [ebx]
 005019DD    mov         eax,dword ptr [eax+270]
 005019E3    mov         eax,dword ptr [eax+48]
 005019E6    xor         edx,edx
 005019E8    call        TBrush.SetStyle
 005019ED    mov         eax,dword ptr [ebx]
 005019EF    mov         si,0FFC7
 005019F3    call        @CallDynaInst
 005019F8    test        al,al
>005019FA    jne         00501A15
 005019FC    lea         eax,[ebp-40]
 005019FF    push        eax
 00501A00    mov         eax,dword ptr [ebx]
 00501A02    mov         eax,dword ptr [eax+270]
 00501A08    call        TCanvas.GetHandle
 00501A0D    push        eax
 00501A0E    call        user32.DrawFocusRect
>00501A13    jmp         00501A44
 00501A15    push        edi
 00501A16    lea         esi,[ebp-40]
 00501A19    lea         edi,[ebp-20]
 00501A1C    movs        dword ptr [edi],dword ptr [esi]
 00501A1D    movs        dword ptr [edi],dword ptr [esi]
 00501A1E    movs        dword ptr [edi],dword ptr [esi]
 00501A1F    movs        dword ptr [edi],dword ptr [esi]
 00501A20    pop         edi
 00501A21    mov         eax,dword ptr [ebp-38]
 00501A24    mov         dword ptr [ebp-20],eax
 00501A27    mov         eax,dword ptr [ebp-40]
 00501A2A    mov         dword ptr [ebp-18],eax
 00501A2D    lea         eax,[ebp-20]
 00501A30    push        eax
 00501A31    mov         eax,dword ptr [ebx]
 00501A33    mov         eax,dword ptr [eax+270]
 00501A39    call        TCanvas.GetHandle
 00501A3E    push        eax
 00501A3F    call        user32.DrawFocusRect
 00501A44    mov         eax,dword ptr [ebp+1C]
 00501A47    mov         eax,dword ptr [eax-70]
 00501A4A    add         eax,dword ptr [ebp-28]
 00501A4D    mov         dword ptr [ebp-30],eax
 00501A50    inc         edi
 00501A51    mov         eax,dword ptr [ebp-30]
 00501A54    cmp         eax,dword ptr [ebp+14]
>00501A57    jge         00501A67
 00501A59    mov         eax,dword ptr [ebx]
 00501A5B    cmp         edi,dword ptr [eax+284]
>00501A61    jl          005016F1
 00501A67    mov         eax,dword ptr [ebp+1C]
 00501A6A    mov         eax,dword ptr [eax-40]
 00501A6D    add         eax,dword ptr [ebp-24]
 00501A70    mov         dword ptr [ebp-2C],eax
 00501A73    inc         dword ptr [ebp-0C]
 00501A76    mov         eax,dword ptr [ebp-2C]
 00501A79    cmp         eax,dword ptr [ebp+10]
>00501A7C    jge         00501A8F
 00501A7E    mov         eax,dword ptr [ebx]
 00501A80    mov         eax,dword ptr [eax+2C0]
 00501A86    cmp         eax,dword ptr [ebp-0C]
>00501A89    jg          005016D3
 00501A8F    pop         edi
 00501A90    pop         esi
 00501A91    pop         ebx
 00501A92    mov         esp,ebp
 00501A94    pop         ebp
 00501A95    ret         14
*}
end;

//00501AA4
procedure TCustomGrid.Paint;
begin
{*
 00501AA4    push        ebp
 00501AA5    mov         ebp,esp
 00501AA7    add         esp,0FFFFFF30
 00501AAD    push        ebx
 00501AAE    push        esi
 00501AAF    push        edi
 00501AB0    mov         dword ptr [ebp-4],eax
 00501AB3    lea         ebx,[ebp-4]
 00501AB6    mov         eax,dword ptr [ebx]
 00501AB8    mov         si,0FFC7
 00501ABC    call        @CallDynaInst
 00501AC1    test        al,al
>00501AC3    je          00501ACE
 00501AC5    mov         dl,1
 00501AC7    mov         eax,dword ptr [ebx]
 00501AC9    call        TCustomGrid.ChangeGridOrientation
 00501ACE    mov         eax,dword ptr [ebx]
 00501AD0    cmp         byte ptr [eax+324],1
>00501AD7    jne         00501B66
 00501ADD    mov         eax,[0078D080];^gvar_00784C80
 00501AE2    cmp         dword ptr [eax],6
>00501AE5    jl          00501B1F
 00501AE7    mov         dword ptr [ebp-90],0F0F0F0
 00501AF1    lea         eax,[ebp-8C]
 00501AF7    push        eax
 00501AF8    push        0EE0
 00501AFD    push        1
 00501AFF    push        1
 00501B01    call        ThemeServices
 00501B06    mov         dl,5
 00501B08    call        TThemeServices.GetTheme
 00501B0D    push        eax
 00501B0E    mov         eax,[0078D79C];GetThemeColor:function(val hTheme:Windows.THandle;val iPartId:System.Inte...
 00501B13    mov         eax,dword ptr [eax]
 00501B15    call        eax
 00501B17    mov         edi,dword ptr [ebp-8C]
>00501B1D    jmp         00501B2E
 00501B1F    mov         dword ptr [ebp-90],0D8E9EC
 00501B29    mov         edi,0B8C7CB
 00501B2E    lea         eax,[ebp-8C]
 00501B34    push        eax
 00501B35    push        0EDA
 00501B3A    push        1
 00501B3C    push        1
 00501B3E    call        ThemeServices
 00501B43    mov         dl,6
 00501B45    call        TThemeServices.GetTheme
 00501B4A    push        eax
 00501B4B    mov         eax,[0078D79C];GetThemeColor:function(val hTheme:Windows.THandle;val iPartId:System.Inte...
 00501B50    mov         eax,dword ptr [eax]
 00501B52    call        eax
 00501B54    mov         edx,dword ptr [ebx]
 00501B56    mov         eax,dword ptr [ebp-8C]
 00501B5C    mov         dword ptr [edx+320],eax
 00501B62    mov         esi,eax
>00501B64    jmp         00501BB4
 00501B66    mov         eax,dword ptr [ebx]
 00501B68    mov         eax,dword ptr [eax+6C]
 00501B6B    mov         edx,dword ptr [ebx]
 00501B6D    mov         dword ptr [edx+320],eax
 00501B73    mov         eax,dword ptr [ebx]
 00501B75    cmp         byte ptr [eax+324],2
>00501B7C    jne         00501BA0
 00501B7E    mov         dword ptr [ebp-90],0F0F0F0
 00501B88    mov         eax,dword ptr [ebx]
 00501B8A    mov         esi,dword ptr [eax+6C]
 00501B8D    mov         edx,0FFFFFFD3
 00501B92    mov         eax,0F0F0F0
 00501B97    call        GetShadowColor
 00501B9C    mov         edi,eax
>00501B9E    jmp         00501BB4
 00501BA0    mov         dword ptr [ebp-90],0C0C0C0
 00501BAA    mov         eax,dword ptr [ebx]
 00501BAC    mov         esi,dword ptr [eax+2A4]
 00501BB2    xor         edi,edi
 00501BB4    lea         edx,[ebp-0A0]
 00501BBA    mov         eax,dword ptr [ebx]
 00501BBC    mov         eax,dword ptr [eax+270]
 00501BC2    mov         ecx,dword ptr [eax]
 00501BC4    call        dword ptr [ecx+10]
 00501BC7    lea         edx,[ebp-70]
 00501BCA    mov         eax,dword ptr [ebx]
 00501BCC    call        TCustomGrid.CalcDrawInfo
 00501BD1    cmp         dword ptr [ebp-70],0
>00501BD5    jg          00501BE1
 00501BD7    cmp         dword ptr [ebp-40],0
>00501BDB    jle         00501E0B
 00501BE1    mov         eax,dword ptr [ebx]
 00501BE3    mov         edx,dword ptr [ebp-30]
 00501BE6    sub         edx,dword ptr [eax+2CC]
 00501BEC    mov         eax,dword ptr [ebx]
 00501BEE    add         edx,dword ptr [eax+2A0]
 00501BF4    mov         eax,dword ptr [ebx]
 00501BF6    mov         ecx,dword ptr [ebp-60]
 00501BF9    sub         ecx,dword ptr [eax+2C8]
 00501BFF    mov         eax,dword ptr [ebx]
 00501C01    add         ecx,dword ptr [eax+29C]
 00501C07    cmp         edx,ecx
>00501C09    jge         00501C23
 00501C0B    mov         eax,dword ptr [ebx]
 00501C0D    push        dword ptr [eax+2C8]
 00501C13    mov         eax,dword ptr [ebp-60]
 00501C16    pop         edx
 00501C17    sub         eax,edx
 00501C19    mov         edx,dword ptr [ebx]
 00501C1B    add         eax,dword ptr [edx+29C]
>00501C21    jmp         00501C39
 00501C23    mov         eax,dword ptr [ebx]
 00501C25    push        dword ptr [eax+2CC]
 00501C2B    mov         eax,dword ptr [ebp-30]
 00501C2E    pop         edx
 00501C2F    sub         eax,edx
 00501C31    mov         edx,dword ptr [ebx]
 00501C33    add         eax,dword ptr [edx+2A0]
 00501C39    add         eax,3
 00501C3C    mov         dword ptr [ebp-0C],eax
 00501C3F    mov         eax,dword ptr [ebp-0C]
 00501C42    add         eax,eax
 00501C44    add         eax,eax
 00501C46    add         eax,eax
 00501C48    add         eax,eax
 00501C4A    call        StackAlloc
 00501C4F    mov         dword ptr [ebp-8],eax
 00501C52    mov         eax,dword ptr [ebp-0C]
 00501C55    add         eax,eax
 00501C57    add         eax,eax
 00501C59    call        StackAlloc
 00501C5E    mov         dword ptr [ebp-10],eax
 00501C61    mov         eax,dword ptr [ebp-10]
 00501C64    mov         ecx,2
 00501C69    mov         edx,dword ptr [ebp-0C]
 00501C6C    call        FillDWord
 00501C71    mov         eax,dword ptr [ebx]
 00501C73    mov         eax,dword ptr [eax+320]
 00501C79    call        ColorToRGB
 00501C7E    cmp         eax,0C0C0C0
>00501C83    jne         00501C8F
 00501C85    mov         dword ptr [ebp-90],808080
 00501C8F    push        ebp
 00501C90    push        0
 00501C92    xor         eax,eax
 00501C94    mov         dword ptr [ebp-0D0],eax
 00501C9A    xor         eax,eax
 00501C9C    mov         dword ptr [ebp-0CC],eax
 00501CA2    mov         eax,dword ptr [ebp-6C]
 00501CA5    mov         dword ptr [ebp-0C8],eax
 00501CAB    mov         eax,dword ptr [ebp-3C]
 00501CAE    mov         dword ptr [ebp-0C4],eax
 00501CB4    lea         eax,[ebp-0D0]
 00501CBA    push        eax
 00501CBB    push        3
 00501CBD    push        edi
 00501CBE    push        esi
 00501CBF    mov         eax,dword ptr [ebx]
 00501CC1    test        byte ptr [eax+2B4],1
 00501CC8    setne       dl
 00501CCB    mov         eax,dword ptr [ebx]
 00501CCD    test        byte ptr [eax+2B4],2
 00501CD4    setne       al
 00501CD7    xor         ecx,ecx
 00501CD9    call        DrawLines
 00501CDE    pop         ecx
 00501CDF    push        ebp
 00501CE0    push        0
 00501CE2    mov         eax,dword ptr [ebp-6C]
 00501CE5    mov         dword ptr [ebp-0D0],eax
 00501CEB    xor         eax,eax
 00501CED    mov         dword ptr [ebp-0CC],eax
 00501CF3    mov         eax,dword ptr [ebp-68]
 00501CF6    mov         dword ptr [ebp-0C8],eax
 00501CFC    mov         eax,dword ptr [ebp-3C]
 00501CFF    mov         dword ptr [ebp-0C4],eax
 00501D05    lea         eax,[ebp-0D0]
 00501D0B    push        eax
 00501D0C    push        3
 00501D0E    push        edi
 00501D0F    push        esi
 00501D10    mov         eax,dword ptr [ebx]
 00501D12    test        byte ptr [eax+2B4],1
 00501D19    setne       dl
 00501D1C    mov         eax,dword ptr [ebx]
 00501D1E    test        byte ptr [eax+2B4],2
 00501D25    setne       al
 00501D28    mov         ecx,dword ptr [ebx]
 00501D2A    mov         ecx,dword ptr [ecx+2C8]
 00501D30    call        DrawLines
 00501D35    pop         ecx
 00501D36    push        ebp
 00501D37    mov         eax,dword ptr [ebx]
 00501D39    mov         eax,dword ptr [eax+2CC]
 00501D3F    push        eax
 00501D40    xor         eax,eax
 00501D42    mov         dword ptr [ebp-0D0],eax
 00501D48    mov         eax,dword ptr [ebp-3C]
 00501D4B    mov         dword ptr [ebp-0CC],eax
 00501D51    mov         eax,dword ptr [ebp-6C]
 00501D54    mov         dword ptr [ebp-0C8],eax
 00501D5A    mov         eax,dword ptr [ebp-38]
 00501D5D    mov         dword ptr [ebp-0C4],eax
 00501D63    lea         eax,[ebp-0D0]
 00501D69    push        eax
 00501D6A    push        3
 00501D6C    push        edi
 00501D6D    push        esi
 00501D6E    mov         eax,dword ptr [ebx]
 00501D70    test        byte ptr [eax+2B4],1
 00501D77    setne       dl
 00501D7A    mov         eax,dword ptr [ebx]
 00501D7C    test        byte ptr [eax+2B4],2
 00501D83    setne       al
 00501D86    xor         ecx,ecx
 00501D88    call        DrawLines
 00501D8D    pop         ecx
 00501D8E    push        ebp
 00501D8F    mov         eax,dword ptr [ebx]
 00501D91    mov         eax,dword ptr [eax+2CC]
 00501D97    push        eax
 00501D98    mov         eax,dword ptr [ebp-6C]
 00501D9B    mov         dword ptr [ebp-0D0],eax
 00501DA1    mov         eax,dword ptr [ebp-3C]
 00501DA4    mov         dword ptr [ebp-0CC],eax
 00501DAA    mov         eax,dword ptr [ebp-68]
 00501DAD    mov         dword ptr [ebp-0C8],eax
 00501DB3    mov         eax,dword ptr [ebp-38]
 00501DB6    mov         dword ptr [ebp-0C4],eax
 00501DBC    lea         eax,[ebp-0D0]
 00501DC2    push        eax
 00501DC3    push        3
 00501DC5    mov         eax,dword ptr [ebp-90]
 00501DCB    push        eax
 00501DCC    mov         eax,dword ptr [ebx]
 00501DCE    mov         eax,dword ptr [eax+320]
 00501DD4    push        eax
 00501DD5    mov         eax,dword ptr [ebx]
 00501DD7    test        byte ptr [eax+2B4],4
 00501DDE    setne       dl
 00501DE1    mov         eax,dword ptr [ebx]
 00501DE3    test        byte ptr [eax+2B4],8
 00501DEA    setne       al
 00501DED    mov         ecx,dword ptr [ebx]
 00501DEF    mov         ecx,dword ptr [ecx+2C8]
 00501DF5    call        DrawLines
 00501DFA    pop         ecx
 00501DFB    mov         eax,dword ptr [ebp-10]
 00501DFE    call        StackFree
 00501E03    mov         eax,dword ptr [ebp-8]
 00501E06    call        StackFree
 00501E0B    lea         edx,[ebp-80]
 00501E0E    mov         eax,dword ptr [ebx]
 00501E10    call        TCustomGrid.GetSelection
 00501E15    xor         eax,eax
 00501E17    mov         dword ptr [ebp-84],eax
 00501E1D    xor         eax,eax
 00501E1F    mov         dword ptr [ebp-88],eax
 00501E25    mov         eax,dword ptr [ebx]
 00501E27    test        byte ptr [eax+2B4],1
>00501E2E    je          00501E44
 00501E30    mov         dword ptr [ebp-84],4
 00501E3A    mov         dword ptr [ebp-88],1
 00501E44    mov         eax,dword ptr [ebx]
 00501E46    test        byte ptr [eax+2B4],2
>00501E4D    je          00501E5D
 00501E4F    or          dword ptr [ebp-84],8
 00501E56    or          dword ptr [ebp-88],2
 00501E5D    push        ebp
 00501E5E    push        0
 00501E60    mov         eax,dword ptr [ebp-6C]
 00501E63    push        eax
 00501E64    mov         eax,dword ptr [ebp-3C]
 00501E67    push        eax
 00501E68    push        esi
 00501E69    movzx       eax,byte ptr ds:[5020D4]
 00501E70    push        eax
 00501E71    xor         ecx,ecx
 00501E73    xor         edx,edx
 00501E75    xor         eax,eax
 00501E77    call        DrawCells
 00501E7C    pop         ecx
 00501E7D    push        ebp
 00501E7E    push        0
 00501E80    mov         eax,dword ptr [ebp-68]
 00501E83    push        eax
 00501E84    mov         eax,dword ptr [ebp-3C]
 00501E87    push        eax
 00501E88    push        esi
 00501E89    movzx       eax,byte ptr ds:[5020D4]
 00501E90    push        eax
 00501E91    mov         eax,dword ptr [ebx]
 00501E93    mov         ecx,dword ptr [ebp-6C]
 00501E96    sub         ecx,dword ptr [eax+2F8]
 00501E9C    mov         eax,dword ptr [ebx]
 00501E9E    mov         eax,dword ptr [eax+2C8]
 00501EA4    xor         edx,edx
 00501EA6    call        DrawCells
 00501EAB    pop         ecx
 00501EAC    push        ebp
 00501EAD    mov         eax,dword ptr [ebp-3C]
 00501EB0    push        eax
 00501EB1    mov         eax,dword ptr [ebp-6C]
 00501EB4    push        eax
 00501EB5    mov         eax,dword ptr [ebp-38]
 00501EB8    push        eax
 00501EB9    push        esi
 00501EBA    movzx       eax,byte ptr ds:[5020D4]
 00501EC1    push        eax
 00501EC2    mov         eax,dword ptr [ebx]
 00501EC4    mov         edx,dword ptr [eax+2CC]
 00501ECA    xor         ecx,ecx
 00501ECC    xor         eax,eax
 00501ECE    call        DrawCells
 00501ED3    pop         ecx
 00501ED4    push        ebp
 00501ED5    mov         eax,dword ptr [ebp-3C]
 00501ED8    push        eax
 00501ED9    mov         eax,dword ptr [ebp-68]
 00501EDC    push        eax
 00501EDD    mov         eax,dword ptr [ebp-38]
 00501EE0    push        eax
 00501EE1    mov         eax,dword ptr [ebx]
 00501EE3    mov         eax,dword ptr [eax+320]
 00501EE9    push        eax
 00501EEA    movzx       eax,byte ptr ds:[5020D8]
 00501EF1    push        eax
 00501EF2    mov         eax,dword ptr [ebx]
 00501EF4    mov         ecx,dword ptr [ebp-6C]
 00501EF7    sub         ecx,dword ptr [eax+2F8]
 00501EFD    mov         eax,dword ptr [ebx]
 00501EFF    mov         edx,dword ptr [eax+2CC]
 00501F05    mov         eax,dword ptr [ebx]
 00501F07    mov         eax,dword ptr [eax+2C8]
 00501F0D    call        DrawCells
 00501F12    pop         ecx
 00501F13    mov         eax,dword ptr [ebx]
 00501F15    test        byte ptr [eax+1C],10
>00501F19    jne         0050201F
 00501F1F    mov         eax,dword ptr [ebx]
 00501F21    test        byte ptr [eax+2B5],10
>00501F28    je          0050201F
 00501F2E    mov         eax,dword ptr [ebx]
 00501F30    cmp         byte ptr [eax+2FC],0
>00501F37    je          0050201F
 00501F3D    mov         eax,dword ptr [ebx]
 00501F3F    mov         si,0FFB3
 00501F43    call        @CallDynaInst
 00501F48    test        al,al
>00501F4A    je          0050201F
 00501F50    push        0
 00501F52    lea         edx,[ebp-0D0]
 00501F58    mov         eax,dword ptr [ebx]
 00501F5A    call        TCustomGrid.GetSelection
 00501F5F    lea         edx,[ebp-0D0]
 00501F65    lea         ecx,[ebp-0C0]
 00501F6B    mov         eax,dword ptr [ebx]
 00501F6D    call        TCustomGrid.GridRectToScreenRect
 00501F72    mov         eax,dword ptr [ebx]
 00501F74    mov         eax,dword ptr [eax+270]
 00501F7A    mov         eax,dword ptr [eax+48]
 00501F7D    xor         edx,edx
 00501F7F    call        TBrush.SetStyle
 00501F84    mov         eax,dword ptr [ebx]
 00501F86    cmp         byte ptr [eax+324],1
>00501F8D    jne         00501FA9
 00501F8F    mov         eax,[0078D080];^gvar_00784C80
 00501F94    cmp         dword ptr [eax],6
>00501F97    jl          00501FA9
 00501F99    push        0FF
 00501F9B    push        0FF
 00501F9D    lea         eax,[ebp-0C0]
 00501FA3    push        eax
 00501FA4    call        user32.InflateRect
 00501FA9    lea         esi,[ebp-0C0]
 00501FAF    lea         edi,[ebp-0B0]
 00501FB5    movs        dword ptr [edi],dword ptr [esi]
 00501FB6    movs        dword ptr [edi],dword ptr [esi]
 00501FB7    movs        dword ptr [edi],dword ptr [esi]
 00501FB8    movs        dword ptr [edi],dword ptr [esi]
 00501FB9    mov         eax,dword ptr [ebx]
 00501FBB    mov         si,0FFC7
 00501FBF    call        @CallDynaInst
 00501FC4    test        al,al
>00501FC6    jne         00501FDD
 00501FC8    lea         edx,[ebp-0B0]
 00501FCE    mov         eax,dword ptr [ebx]
 00501FD0    mov         eax,dword ptr [eax+270]
 00501FD6    mov         ecx,dword ptr [eax]
 00501FD8    call        dword ptr [ecx+4C]
>00501FDB    jmp         0050201F
 00501FDD    lea         esi,[ebp-0C0]
 00501FE3    lea         edi,[ebp-0B0]
 00501FE9    movs        dword ptr [edi],dword ptr [esi]
 00501FEA    movs        dword ptr [edi],dword ptr [esi]
 00501FEB    movs        dword ptr [edi],dword ptr [esi]
 00501FEC    movs        dword ptr [edi],dword ptr [esi]
 00501FED    mov         eax,dword ptr [ebp-0B8]
 00501FF3    mov         dword ptr [ebp-0B0],eax
 00501FF9    mov         eax,dword ptr [ebp-0C0]
 00501FFF    mov         dword ptr [ebp-0A8],eax
 00502005    lea         eax,[ebp-0B0]
 0050200B    push        eax
 0050200C    mov         eax,dword ptr [ebx]
 0050200E    mov         eax,dword ptr [eax+270]
 00502014    call        TCanvas.GetHandle
 00502019    push        eax
 0050201A    call        user32.DrawFocusRect
 0050201F    mov         eax,dword ptr [ebp-68]
 00502022    cmp         eax,dword ptr [ebp-64]
>00502025    jge         0050206A
 00502027    mov         eax,dword ptr [ebx]
 00502029    mov         edx,dword ptr [eax+320]
 0050202F    mov         eax,dword ptr [ebx]
 00502031    mov         eax,dword ptr [eax+270]
 00502037    mov         eax,dword ptr [eax+48]
 0050203A    call        TBrush.SetColor
 0050203F    mov         eax,dword ptr [ebp-38]
 00502042    push        eax
 00502043    lea         eax,[ebp-0D0]
 00502049    push        eax
 0050204A    mov         ecx,dword ptr [ebp-64]
 0050204D    xor         edx,edx
 0050204F    mov         eax,dword ptr [ebp-68]
 00502052    call        Rect
 00502057    lea         edx,[ebp-0D0]
 0050205D    mov         eax,dword ptr [ebx]
 0050205F    mov         eax,dword ptr [eax+270]
 00502065    mov         ecx,dword ptr [eax]
 00502067    call        dword ptr [ecx+54]
 0050206A    mov         eax,dword ptr [ebp-38]
 0050206D    cmp         eax,dword ptr [ebp-34]
>00502070    jge         005020B5
 00502072    mov         eax,dword ptr [ebx]
 00502074    mov         edx,dword ptr [eax+320]
 0050207A    mov         eax,dword ptr [ebx]
 0050207C    mov         eax,dword ptr [eax+270]
 00502082    mov         eax,dword ptr [eax+48]
 00502085    call        TBrush.SetColor
 0050208A    mov         eax,dword ptr [ebp-34]
 0050208D    push        eax
 0050208E    lea         eax,[ebp-0D0]
 00502094    push        eax
 00502095    mov         ecx,dword ptr [ebp-64]
 00502098    mov         edx,dword ptr [ebp-38]
 0050209B    xor         eax,eax
 0050209D    call        Rect
 005020A2    lea         edx,[ebp-0D0]
 005020A8    mov         eax,dword ptr [ebx]
 005020AA    mov         eax,dword ptr [eax+270]
 005020B0    mov         ecx,dword ptr [eax]
 005020B2    call        dword ptr [ecx+54]
 005020B5    mov         eax,dword ptr [ebx]
 005020B7    mov         si,0FFC7
 005020BB    call        @CallDynaInst
 005020C0    test        al,al
>005020C2    je          005020CD
 005020C4    xor         edx,edx
 005020C6    mov         eax,dword ptr [ebx]
 005020C8    call        TCustomGrid.ChangeGridOrientation
 005020CD    pop         edi
 005020CE    pop         esi
 005020CF    pop         ebx
 005020D0    mov         esp,ebp
 005020D2    pop         ebp
 005020D3    ret
*}
end;

//005020DC
function DoCalc(const AxisInfo:TGridAxisDrawInfo; N:Integer):Integer;
begin
{*
 005020DC    push        ebp
 005020DD    mov         ebp,esp
 005020DF    add         esp,0FFFFFFF0
 005020E2    push        ebx
 005020E3    push        esi
 005020E4    mov         dword ptr [ebp-4],edx
 005020E7    mov         ebx,eax
 005020E9    mov         esi,dword ptr [ebx+4]
 005020EC    cmp         esi,dword ptr [ebp-4]
>005020EF    jle         005020FE
 005020F1    xor         eax,eax
 005020F3    mov         edx,dword ptr [ebx+18]
 005020F6    dec         edx
 005020F7    xor         ecx,ecx
 005020F9    mov         dword ptr [ebp-0C],ecx
>005020FC    jmp         00502108
 005020FE    mov         eax,dword ptr [ebx+1C]
 00502101    mov         edx,dword ptr [ebx+20]
 00502104    dec         edx
 00502105    mov         dword ptr [ebp-0C],esi
 00502108    mov         dword ptr [ebp-8],0FFFFFFFF
 0050210F    mov         esi,eax
 00502111    sub         edx,esi
>00502113    jl          00502139
 00502115    inc         edx
 00502116    mov         dword ptr [ebp-10],edx
 00502119    mov         edx,esi
 0050211B    mov         eax,dword ptr [ebx+2C]
 0050211E    call        dword ptr [ebx+28]
 00502121    add         eax,dword ptr [ebx]
 00502123    add         dword ptr [ebp-0C],eax
 00502126    mov         eax,dword ptr [ebp-4]
 00502129    cmp         eax,dword ptr [ebp-0C]
>0050212C    jge         00502133
 0050212E    mov         dword ptr [ebp-8],esi
>00502131    jmp         00502139
 00502133    inc         esi
 00502134    dec         dword ptr [ebp-10]
>00502137    jne         00502119
 00502139    mov         eax,dword ptr [ebp-8]
 0050213C    pop         esi
 0050213D    pop         ebx
 0050213E    mov         esp,ebp
 00502140    pop         ebp
 00502141    ret
*}
end;

//00502144
function DoCalcRightToLeft(const AxisInfo:TGridAxisDrawInfo; N:Integer):Integer;
begin
{*
 00502144    push        ebp
 00502145    mov         ebp,esp
 00502147    add         esp,0FFFFFFF0
 0050214A    push        ebx
 0050214B    push        esi
 0050214C    push        edi
 0050214D    mov         dword ptr [ebp-4],edx
 00502150    mov         ebx,eax
 00502152    mov         eax,dword ptr [ebp+8]
 00502155    mov         eax,dword ptr [eax-4]
 00502158    call        TControl.GetClientWidth
 0050215D    sub         eax,dword ptr [ebp-4]
 00502160    mov         dword ptr [ebp-4],eax
 00502163    mov         eax,dword ptr [ebx+4]
 00502166    cmp         eax,dword ptr [ebp-4]
>00502169    jle         00502181
 0050216B    xor         esi,esi
 0050216D    mov         edi,dword ptr [ebx+18]
 00502170    dec         edi
 00502171    mov         eax,dword ptr [ebp+8]
 00502174    mov         eax,dword ptr [eax-4]
 00502177    call        TControl.GetClientWidth
 0050217C    mov         dword ptr [ebp-0C],eax
>0050217F    jmp         0050218B
 00502181    mov         esi,dword ptr [ebx+1C]
 00502184    mov         edi,dword ptr [ebx+20]
 00502187    dec         edi
 00502188    mov         dword ptr [ebp-0C],eax
 0050218B    mov         dword ptr [ebp-8],0FFFFFFFF
 00502192    sub         edi,esi
>00502194    jl          005021BA
 00502196    inc         edi
 00502197    mov         dword ptr [ebp-10],edi
 0050219A    mov         edx,esi
 0050219C    mov         eax,dword ptr [ebx+2C]
 0050219F    call        dword ptr [ebx+28]
 005021A2    add         eax,dword ptr [ebx]
 005021A4    add         dword ptr [ebp-0C],eax
 005021A7    mov         eax,dword ptr [ebp-4]
 005021AA    cmp         eax,dword ptr [ebp-0C]
>005021AD    jge         005021B4
 005021AF    mov         dword ptr [ebp-8],esi
>005021B2    jmp         005021BA
 005021B4    inc         esi
 005021B5    dec         dword ptr [ebp-10]
>005021B8    jne         0050219A
 005021BA    mov         eax,dword ptr [ebp-8]
 005021BD    pop         edi
 005021BE    pop         esi
 005021BF    pop         ebx
 005021C0    mov         esp,ebp
 005021C2    pop         ebp
 005021C3    ret
*}
end;

//005021C4
function TCustomGrid.CalcCoordFromPoint(X:Integer; Y:Integer; const DrawInfo:TGridDrawInfo):TGridCoord;
begin
{*
 005021C4    push        ebp
 005021C5    mov         ebp,esp
 005021C7    add         esp,0FFFFFFF4
 005021CA    push        ebx
 005021CB    push        esi
 005021CC    push        edi
 005021CD    mov         dword ptr [ebp-0C],ecx
 005021D0    mov         dword ptr [ebp-8],edx
 005021D3    mov         dword ptr [ebp-4],eax
 005021D6    mov         edi,dword ptr [ebp+8]
 005021D9    mov         ebx,dword ptr [ebp+0C]
 005021DC    mov         eax,dword ptr [ebp-4]
 005021DF    mov         si,0FFC7
 005021E3    call        @CallDynaInst
 005021E8    test        al,al
>005021EA    jne         005021FA
 005021EC    mov         eax,ebx
 005021EE    mov         edx,dword ptr [ebp-8]
 005021F1    call        DoCalc
 005021F6    mov         dword ptr [edi],eax
>005021F8    jmp         00502208
 005021FA    push        ebp
 005021FB    mov         eax,ebx
 005021FD    mov         edx,dword ptr [ebp-8]
 00502200    call        DoCalcRightToLeft
 00502205    pop         ecx
 00502206    mov         dword ptr [edi],eax
 00502208    lea         eax,[ebx+30]
 0050220B    mov         edx,dword ptr [ebp-0C]
 0050220E    call        DoCalc
 00502213    mov         dword ptr [edi+4],eax
 00502216    pop         edi
 00502217    pop         esi
 00502218    pop         ebx
 00502219    mov         esp,ebp
 0050221B    pop         ebp
 0050221C    ret         8
*}
end;

//00502220
procedure TCustomGrid.CalcDrawInfo(var DrawInfo:TGridDrawInfo);
begin
{*
 00502220    push        ebx
 00502221    push        esi
 00502222    mov         esi,edx
 00502224    mov         ebx,eax
 00502226    mov         eax,ebx
 00502228    call        TControl.GetClientHeight
 0050222D    push        eax
 0050222E    mov         eax,ebx
 00502230    call        TControl.GetClientWidth
 00502235    mov         ecx,eax
 00502237    mov         edx,esi
 00502239    mov         eax,ebx
 0050223B    call        TCustomGrid.CalcDrawInfoXY
 00502240    pop         esi
 00502241    pop         ebx
 00502242    ret
*}
end;

//00502244
procedure CalcAxis(var AxisInfo:TGridAxisDrawInfo; UseExtent:Integer);
begin
{*
 00502244    push        ebp
 00502245    mov         ebp,esp
 00502247    push        ecx
 00502248    push        ebx
 00502249    push        esi
 0050224A    mov         ebx,eax
 0050224C    mov         dword ptr [ebx+0C],edx
 0050224F    mov         eax,dword ptr [ebx+4]
 00502252    mov         dword ptr [ebx+8],eax
 00502255    mov         eax,dword ptr [ebx+4]
 00502258    mov         dword ptr [ebx+14],eax
 0050225B    mov         eax,dword ptr [ebx+1C]
 0050225E    mov         dword ptr [ebx+10],eax
 00502261    mov         esi,dword ptr [ebx+1C]
 00502264    mov         eax,dword ptr [ebx+20]
 00502267    dec         eax
 00502268    sub         eax,esi
>0050226A    jl          0050229D
 0050226C    inc         eax
 0050226D    mov         dword ptr [ebp-4],eax
 00502270    mov         edx,esi
 00502272    mov         eax,dword ptr [ebx+2C]
 00502275    call        dword ptr [ebx+28]
 00502278    add         eax,dword ptr [ebx]
 0050227A    add         dword ptr [ebx+8],eax
 0050227D    mov         eax,dword ptr [ebx+0C]
 00502280    mov         edx,eax
 00502282    add         edx,dword ptr [ebx]
 00502284    cmp         edx,dword ptr [ebx+8]
>00502287    jge         0050228E
 00502289    mov         dword ptr [ebx+8],eax
>0050228C    jmp         0050229D
 0050228E    mov         dword ptr [ebx+10],esi
 00502291    mov         eax,dword ptr [ebx+8]
 00502294    mov         dword ptr [ebx+14],eax
 00502297    inc         esi
 00502298    dec         dword ptr [ebp-4]
>0050229B    jne         00502270
 0050229D    pop         esi
 0050229E    pop         ebx
 0050229F    pop         ecx
 005022A0    pop         ebp
 005022A1    ret
*}
end;

//005022A4
procedure TCustomGrid.CalcDrawInfoXY(var DrawInfo:TGridDrawInfo; UseWidth:Integer; UseHeight:Integer);
begin
{*
 005022A4    push        ebp
 005022A5    mov         ebp,esp
 005022A7    push        ebx
 005022A8    push        esi
 005022A9    mov         esi,ecx
 005022AB    mov         ebx,edx
 005022AD    mov         edx,ebx
 005022AF    call        TCustomGrid.CalcFixedInfo
 005022B4    mov         eax,ebx
 005022B6    mov         edx,esi
 005022B8    call        CalcAxis
 005022BD    lea         eax,[ebx+30]
 005022C0    mov         edx,dword ptr [ebp+8]
 005022C3    call        CalcAxis
 005022C8    pop         esi
 005022C9    pop         ebx
 005022CA    pop         ebp
 005022CB    ret         4
*}
end;

//005022D0
procedure CalcFixedAxis(var Axis:TGridAxisDrawInfo; LineOptions:TGridOptions; FixedCount:Integer; FirstCell:Integer; CellCount:Integer; GetExtentFunc:TGetExtentsFunc);
begin
{*
 005022D0    push        ebp
 005022D1    mov         ebp,esp
 005022D3    add         esp,0FFFFFFF8
 005022D6    push        ebx
 005022D7    push        esi
 005022D8    push        edi
 005022D9    mov         dword ptr [ebp-8],ecx
 005022DC    mov         dword ptr [ebp-4],edx
 005022DF    mov         ebx,eax
 005022E1    mov         eax,dword ptr [ebp+18]
 005022E4    mov         eax,dword ptr [eax-4]
 005022E7    mov         eax,dword ptr [eax+2B4]
 005022ED    and         eax,dword ptr [ebp-4]
 005022F0    mov         edx,dword ptr ds:[502358]
 005022F6    cmp         edx,eax
>005022F8    jne         00502300
 005022FA    xor         eax,eax
 005022FC    mov         dword ptr [ebx],eax
>005022FE    jmp         0050230E
 00502300    mov         eax,dword ptr [ebp+18]
 00502303    mov         eax,dword ptr [eax-4]
 00502306    mov         eax,dword ptr [eax+2B0]
 0050230C    mov         dword ptr [ebx],eax
 0050230E    xor         eax,eax
 00502310    mov         dword ptr [ebx+4],eax
 00502313    mov         esi,dword ptr [ebp-8]
 00502316    dec         esi
 00502317    test        esi,esi
>00502319    jl          0050232F
 0050231B    inc         esi
 0050231C    xor         edi,edi
 0050231E    mov         edx,edi
 00502320    mov         eax,dword ptr [ebp+0C]
 00502323    call        dword ptr [ebp+8]
 00502326    add         eax,dword ptr [ebx]
 00502328    add         dword ptr [ebx+4],eax
 0050232B    inc         edi
 0050232C    dec         esi
>0050232D    jne         0050231E
 0050232F    mov         eax,dword ptr [ebp-8]
 00502332    mov         dword ptr [ebx+18],eax
 00502335    mov         eax,dword ptr [ebp+14]
 00502338    mov         dword ptr [ebx+1C],eax
 0050233B    mov         eax,dword ptr [ebp+10]
 0050233E    mov         dword ptr [ebx+20],eax
 00502341    mov         eax,dword ptr [ebp+8]
 00502344    mov         dword ptr [ebx+28],eax
 00502347    mov         eax,dword ptr [ebp+0C]
 0050234A    mov         dword ptr [ebx+2C],eax
 0050234D    pop         edi
 0050234E    pop         esi
 0050234F    pop         ebx
 00502350    pop         ecx
 00502351    pop         ecx
 00502352    pop         ebp
 00502353    ret         10
*}
end;

//0050235C
procedure TCustomGrid.CalcFixedInfo(var DrawInfo:TGridDrawInfo);
begin
{*
 0050235C    push        ebp
 0050235D    mov         ebp,esp
 0050235F    push        ecx
 00502360    push        ebx
 00502361    mov         ebx,edx
 00502363    mov         dword ptr [ebp-4],eax
 00502366    push        ebp
 00502367    mov         eax,dword ptr [ebp-4]
 0050236A    mov         eax,dword ptr [eax+2C8]
 00502370    push        eax
 00502371    mov         eax,dword ptr [ebp-4]
 00502374    mov         eax,dword ptr [eax+284]
 0050237A    push        eax
 0050237B    mov         eax,dword ptr [ebp-4]
 0050237E    push        eax
 0050237F    push        505B14;TCustomGrid.GetColWidths:Integer
 00502384    mov         eax,dword ptr [ebp-4]
 00502387    mov         ecx,dword ptr [eax+29C]
 0050238D    mov         eax,ebx
 0050238F    mov         edx,dword ptr ds:[5023D8]
 00502395    call        CalcFixedAxis
 0050239A    pop         ecx
 0050239B    push        ebp
 0050239C    mov         eax,dword ptr [ebp-4]
 0050239F    mov         eax,dword ptr [eax+2CC]
 005023A5    push        eax
 005023A6    mov         eax,dword ptr [ebp-4]
 005023A9    mov         eax,dword ptr [eax+2C0]
 005023AF    push        eax
 005023B0    mov         eax,dword ptr [ebp-4]
 005023B3    push        eax
 005023B4    push        505B34;TCustomGrid.GetRowHeights:Integer
 005023B9    mov         eax,dword ptr [ebp-4]
 005023BC    mov         ecx,dword ptr [eax+2A0]
 005023C2    lea         eax,[ebx+30]
 005023C5    mov         edx,dword ptr ds:[5023DC]
 005023CB    call        CalcFixedAxis
 005023D0    pop         ecx
 005023D1    pop         ebx
 005023D2    pop         ecx
 005023D3    pop         ebp
 005023D4    ret
*}
end;

//005023E0
function CalcMaxCell(const Axis:TGridAxisDrawInfo; Start:Integer):Integer;
begin
{*
 005023E0    push        ebp
 005023E1    mov         ebp,esp
 005023E3    add         esp,0FFFFFFF0
 005023E6    push        ebx
 005023E7    push        esi
 005023E8    mov         dword ptr [ebp-4],edx
 005023EB    mov         ebx,eax
 005023ED    mov         eax,dword ptr [ebp-4]
 005023F0    mov         dword ptr [ebp-8],eax
 005023F3    mov         eax,dword ptr [ebx+0C]
 005023F6    add         eax,dword ptr [ebx]
 005023F8    mov         dword ptr [ebp-0C],eax
 005023FB    mov         esi,dword ptr [ebp-4]
 005023FE    mov         eax,dword ptr [ebx+18]
 00502401    sub         eax,esi
>00502403    jg          00502448
 00502405    dec         eax
 00502406    mov         dword ptr [ebp-10],eax
 00502409    mov         edx,esi
 0050240B    mov         eax,dword ptr [ebx+2C]
 0050240E    call        dword ptr [ebx+28]
 00502411    test        eax,eax
>00502413    jle         00502442
 00502415    sub         dword ptr [ebp-0C],eax
 00502418    mov         eax,dword ptr [ebx]
 0050241A    sub         dword ptr [ebp-0C],eax
 0050241D    mov         eax,dword ptr [ebx+4]
 00502420    cmp         eax,dword ptr [ebp-0C]
>00502423    jle         0050243F
 00502425    mov         eax,dword ptr [ebp-8]
 00502428    cmp         eax,dword ptr [ebp-4]
>0050242B    jne         00502448
 0050242D    mov         edx,dword ptr [ebp-4]
 00502430    mov         eax,dword ptr [ebx+2C]
 00502433    call        dword ptr [ebx+28]
 00502436    test        eax,eax
>00502438    jg          00502448
 0050243A    mov         dword ptr [ebp-8],esi
>0050243D    jmp         00502448
 0050243F    mov         dword ptr [ebp-8],esi
 00502442    dec         esi
 00502443    inc         dword ptr [ebp-10]
>00502446    jne         00502409
 00502448    mov         eax,dword ptr [ebp-8]
 0050244B    pop         esi
 0050244C    pop         ebx
 0050244D    mov         esp,ebp
 0050244F    pop         ebp
 00502450    ret
*}
end;

//00502454
function TCustomGrid.CalcMaxTopLeft(const Coord:TGridCoord; const DrawInfo:TGridDrawInfo):TGridCoord;
begin
{*
 00502454    push        ebp
 00502455    mov         ebp,esp
 00502457    push        ebx
 00502458    push        esi
 00502459    push        edi
 0050245A    mov         esi,ecx
 0050245C    mov         ebx,edx
 0050245E    mov         edi,dword ptr [ebp+8]
 00502461    mov         edx,dword ptr [ebx]
 00502463    mov         eax,esi
 00502465    call        CalcMaxCell
 0050246A    mov         dword ptr [edi],eax
 0050246C    mov         edx,dword ptr [ebx+4]
 0050246F    lea         eax,[esi+30]
 00502472    call        CalcMaxCell
 00502477    mov         dword ptr [edi+4],eax
 0050247A    pop         edi
 0050247B    pop         esi
 0050247C    pop         ebx
 0050247D    pop         ebp
 0050247E    ret         4
*}
end;

//00502484
procedure CalcAxisState(const AxisInfo:TGridAxisDrawInfo; Pos:Integer; NewState:TGridState);
begin
{*
 00502484    push        ebp
 00502485    mov         ebp,esp
 00502487    add         esp,0FFFFFFE8
 0050248A    push        ebx
 0050248B    push        esi
 0050248C    push        edi
 0050248D    mov         byte ptr [ebp-5],cl
 00502490    mov         dword ptr [ebp-4],edx
 00502493    mov         edi,eax
 00502495    cmp         byte ptr [ebp-5],3
>00502499    jne         005024BF
 0050249B    mov         eax,dword ptr [ebp+8]
 0050249E    mov         eax,dword ptr [eax-4]
 005024A1    mov         si,0FFC7
 005024A5    call        @CallDynaInst
 005024AA    test        al,al
>005024AC    je          005024BF
 005024AE    mov         eax,dword ptr [ebp+8]
 005024B1    mov         eax,dword ptr [eax-4]
 005024B4    call        TControl.GetClientWidth
 005024B9    sub         eax,dword ptr [ebp-4]
 005024BC    mov         dword ptr [ebp-4],eax
 005024BF    mov         ebx,dword ptr [edi+4]
 005024C2    mov         eax,dword ptr [edi]
 005024C4    mov         dword ptr [ebp-14],eax
 005024C7    xor         edx,edx
 005024C9    mov         dword ptr [ebp-10],edx
 005024CC    cmp         dword ptr [ebp-14],7
>005024D0    jge         005024E3
 005024D2    mov         dword ptr [ebp-14],7
 005024D9    mov         edx,dword ptr [ebp-14]
 005024DC    sub         edx,eax
 005024DE    shr         edx,1
 005024E0    mov         dword ptr [ebp-10],edx
 005024E3    mov         eax,dword ptr [edi+1C]
 005024E6    mov         edx,dword ptr [edi+20]
 005024E9    dec         edx
 005024EA    sub         edx,eax
>005024EC    jl          0050254D
 005024EE    inc         edx
 005024EF    mov         dword ptr [ebp-18],edx
 005024F2    mov         dword ptr [ebp-0C],eax
 005024F5    mov         edx,dword ptr [ebp-0C]
 005024F8    mov         eax,dword ptr [edi+2C]
 005024FB    call        dword ptr [edi+28]
 005024FE    add         ebx,eax
 00502500    cmp         ebx,dword ptr [edi+8]
>00502503    jg          0050254D
 00502505    mov         eax,ebx
 00502507    sub         eax,dword ptr [ebp-10]
 0050250A    cmp         eax,dword ptr [ebp-4]
>0050250D    jg          00502543
 0050250F    add         eax,dword ptr [ebp-14]
 00502512    cmp         eax,dword ptr [ebp-4]
>00502515    jl          00502543
 00502517    mov         eax,dword ptr [ebp+8]
 0050251A    mov         eax,dword ptr [eax+18]
 0050251D    movzx       edx,byte ptr [ebp-5]
 00502521    mov         byte ptr [eax],dl
 00502523    mov         eax,dword ptr [ebp+8]
 00502526    mov         eax,dword ptr [eax+10]
 00502529    mov         dword ptr [eax],ebx
 0050252B    sub         ebx,dword ptr [ebp-4]
 0050252E    mov         eax,dword ptr [ebp+8]
 00502531    mov         eax,dword ptr [eax+0C]
 00502534    mov         dword ptr [eax],ebx
 00502536    mov         eax,dword ptr [ebp+8]
 00502539    mov         eax,dword ptr [eax+14]
 0050253C    mov         edx,dword ptr [ebp-0C]
 0050253F    mov         dword ptr [eax],edx
>00502541    jmp         00502595
 00502543    add         ebx,dword ptr [edi]
 00502545    inc         dword ptr [ebp-0C]
 00502548    dec         dword ptr [ebp-18]
>0050254B    jne         005024F5
 0050254D    mov         eax,dword ptr [edi+0C]
 00502550    cmp         eax,dword ptr [edi+8]
>00502553    jne         00502595
 00502555    mov         edx,eax
 00502557    sub         edx,dword ptr [ebp-10]
 0050255A    cmp         edx,dword ptr [ebp-4]
>0050255D    jg          00502595
 0050255F    cmp         eax,dword ptr [ebp-4]
>00502562    jl          00502595
 00502564    mov         eax,dword ptr [ebp+8]
 00502567    mov         eax,dword ptr [eax+18]
 0050256A    movzx       edx,byte ptr [ebp-5]
 0050256E    mov         byte ptr [eax],dl
 00502570    mov         eax,dword ptr [edi+0C]
 00502573    mov         edx,dword ptr [ebp+8]
 00502576    mov         edx,dword ptr [edx+10]
 00502579    mov         dword ptr [edx],eax
 0050257B    mov         eax,dword ptr [edi+0C]
 0050257E    sub         eax,dword ptr [ebp-4]
 00502581    mov         edx,dword ptr [ebp+8]
 00502584    mov         edx,dword ptr [edx+0C]
 00502587    mov         dword ptr [edx],eax
 00502589    mov         eax,dword ptr [edi+10]
 0050258C    inc         eax
 0050258D    mov         edx,dword ptr [ebp+8]
 00502590    mov         edx,dword ptr [edx+14]
 00502593    mov         dword ptr [edx],eax
 00502595    pop         edi
 00502596    pop         esi
 00502597    pop         ebx
 00502598    mov         esp,ebp
 0050259A    pop         ebp
 0050259B    ret
*}
end;

//0050259C
function XOutsideHorzFixedBoundary:Boolean;
begin
{*
 0050259C    push        ebp
 0050259D    mov         ebp,esp
 0050259F    push        esi
 005025A0    mov         eax,dword ptr [ebp+8]
 005025A3    mov         eax,dword ptr [eax-4]
 005025A6    mov         si,0FFC7
 005025AA    call        @CallDynaInst
 005025AF    test        al,al
>005025B1    jne         005025C8
 005025B3    mov         eax,dword ptr [ebp+8]
 005025B6    mov         eax,dword ptr [eax-8]
 005025B9    mov         edx,dword ptr [ebp+8]
 005025BC    mov         edx,dword ptr [edx+8]
 005025BF    cmp         eax,dword ptr [edx+4]
 005025C2    setg        al
 005025C5    pop         esi
 005025C6    pop         ebp
 005025C7    ret
 005025C8    mov         eax,dword ptr [ebp+8]
 005025CB    mov         eax,dword ptr [eax-4]
 005025CE    call        TControl.GetClientWidth
 005025D3    mov         edx,dword ptr [ebp+8]
 005025D6    mov         edx,dword ptr [edx+8]
 005025D9    sub         eax,dword ptr [edx+4]
 005025DC    mov         edx,dword ptr [ebp+8]
 005025DF    cmp         eax,dword ptr [edx-8]
 005025E2    setg        al
 005025E5    pop         esi
 005025E6    pop         ebp
 005025E7    ret
*}
end;

//005025E8
function XOutsideOrEqualHorzFixedBoundary:Boolean;
begin
{*
 005025E8    push        ebp
 005025E9    mov         ebp,esp
 005025EB    push        esi
 005025EC    mov         eax,dword ptr [ebp+8]
 005025EF    mov         eax,dword ptr [eax-4]
 005025F2    mov         si,0FFC7
 005025F6    call        @CallDynaInst
 005025FB    test        al,al
>005025FD    jne         00502614
 005025FF    mov         eax,dword ptr [ebp+8]
 00502602    mov         eax,dword ptr [eax-8]
 00502605    mov         edx,dword ptr [ebp+8]
 00502608    mov         edx,dword ptr [edx+8]
 0050260B    cmp         eax,dword ptr [edx+4]
 0050260E    setge       al
 00502611    pop         esi
 00502612    pop         ebp
 00502613    ret
 00502614    mov         eax,dword ptr [ebp+8]
 00502617    mov         eax,dword ptr [eax-4]
 0050261A    call        TControl.GetClientWidth
 0050261F    mov         edx,dword ptr [ebp+8]
 00502622    mov         edx,dword ptr [edx+8]
 00502625    sub         eax,dword ptr [edx+4]
 00502628    mov         edx,dword ptr [ebp+8]
 0050262B    cmp         eax,dword ptr [edx-8]
 0050262E    setge       al
 00502631    pop         esi
 00502632    pop         ebp
 00502633    ret
*}
end;

//00502634
procedure TCustomGrid.CalcSizingState(X:Integer; Y:Integer; var State:TGridState; var Index:LongInt; var SizingPos:Integer; var SizingOfs:Integer; var FixedInfo:TGridDrawInfo);
begin
{*
 00502634    push        ebp
 00502635    mov         ebp,esp
 00502637    add         esp,0FFFFFFF8
 0050263A    push        ebx
 0050263B    push        esi
 0050263C    mov         esi,ecx
 0050263E    mov         dword ptr [ebp-8],edx
 00502641    mov         dword ptr [ebp-4],eax
 00502644    mov         eax,dword ptr [ebp+18]
 00502647    mov         byte ptr [eax],0
 0050264A    mov         eax,dword ptr [ebp+14]
 0050264D    mov         dword ptr [eax],0FFFFFFFF
 00502653    mov         eax,dword ptr [ebp-4]
 00502656    mov         ebx,dword ptr [eax+2B4]
 0050265C    mov         eax,dword ptr [ebp-4]
 0050265F    test        byte ptr [eax+1C],10
>00502663    je          00502672
 00502665    mov         eax,dword ptr [ebp-4]
 00502668    mov         eax,dword ptr [eax+31A]
 0050266E    or          eax,ebx
 00502670    mov         ebx,eax
 00502672    mov         eax,ebx
 00502674    and         eax,dword ptr ds:[5026FC]
 0050267A    mov         edx,dword ptr ds:[502700]
 00502680    cmp         edx,eax
>00502682    je          005026F2
 00502684    mov         eax,dword ptr [ebp-4]
 00502687    call        TControl.GetClientHeight
 0050268C    mov         edx,dword ptr [ebp+8]
 0050268F    mov         dword ptr [edx+3C],eax
 00502692    mov         eax,dword ptr [ebp-4]
 00502695    call        TControl.GetClientWidth
 0050269A    mov         edx,dword ptr [ebp+8]
 0050269D    mov         dword ptr [edx+0C],eax
 005026A0    push        ebp
 005026A1    call        XOutsideHorzFixedBoundary
 005026A6    pop         ecx
 005026A7    test        al,al
>005026A9    je          005026C9
 005026AB    test        bl,80
>005026AE    je          005026C9
 005026B0    mov         eax,dword ptr [ebp+8]
 005026B3    cmp         esi,dword ptr [eax+34]
>005026B6    jge         005026F2
 005026B8    push        ebp
 005026B9    mov         eax,dword ptr [ebp+8]
 005026BC    mov         cl,3
 005026BE    mov         edx,dword ptr [ebp-8]
 005026C1    call        CalcAxisState
 005026C6    pop         ecx
>005026C7    jmp         005026F2
 005026C9    mov         eax,dword ptr [ebp+8]
 005026CC    cmp         esi,dword ptr [eax+34]
>005026CF    jle         005026F2
 005026D1    test        bl,40
>005026D4    je          005026F2
 005026D6    push        ebp
 005026D7    call        XOutsideOrEqualHorzFixedBoundary
 005026DC    pop         ecx
 005026DD    test        al,al
>005026DF    jne         005026F2
 005026E1    push        ebp
 005026E2    mov         eax,dword ptr [ebp+8]
 005026E5    add         eax,30
 005026E8    mov         cl,2
 005026EA    mov         edx,esi
 005026EC    call        CalcAxisState
 005026F1    pop         ecx
 005026F2    pop         esi
 005026F3    pop         ebx
 005026F4    pop         ecx
 005026F5    pop         ecx
 005026F6    pop         ebp
 005026F7    ret         14
*}
end;

//00502704
procedure TCustomGrid.ChangeGridOrientation(RightToLeftOrientation:Boolean);
begin
{*
 00502704    push        ebx
 00502705    add         esp,0FFFFFFD0
 00502708    mov         ebx,eax
 0050270A    test        dl,dl
>0050270C    je          005027D5
 00502712    mov         eax,ebx
 00502714    call        TControl.GetClientWidth
 00502719    mov         dword ptr [esp+10],eax
 0050271D    xor         eax,eax
 0050271F    mov         dword ptr [esp+14],eax
 00502723    mov         eax,dword ptr [esp+10]
 00502727    mov         dword ptr [esp],eax
 0050272A    mov         eax,dword ptr [esp+14]
 0050272E    mov         dword ptr [esp+4],eax
 00502732    mov         dword ptr [esp+18],0FFFFFFFF
 0050273A    mov         dword ptr [esp+1C],1
 00502742    mov         eax,dword ptr [esp+18]
 00502746    mov         dword ptr [esp+8],eax
 0050274A    mov         eax,dword ptr [esp+1C]
 0050274E    mov         dword ptr [esp+0C],eax
 00502752    push        8
 00502754    mov         eax,dword ptr [ebx+270]
 0050275A    call        TCanvas.GetHandle
 0050275F    push        eax
 00502760    call        gdi32.SetMapMode
 00502765    push        0
 00502767    mov         eax,dword ptr [esp+8]
 0050276B    push        eax
 0050276C    mov         eax,dword ptr [esp+8]
 00502770    push        eax
 00502771    mov         eax,dword ptr [ebx+270]
 00502777    call        TCanvas.GetHandle
 0050277C    push        eax
 0050277D    call        gdi32.SetWindowOrgEx
 00502782    push        0
 00502784    mov         eax,ebx
 00502786    call        TControl.GetClientHeight
 0050278B    push        eax
 0050278C    mov         eax,ebx
 0050278E    call        TControl.GetClientWidth
 00502793    push        eax
 00502794    mov         eax,dword ptr [ebx+270]
 0050279A    call        TCanvas.GetHandle
 0050279F    push        eax
 005027A0    call        gdi32.SetViewportExtEx
 005027A5    push        0
 005027A7    mov         eax,ebx
 005027A9    call        TControl.GetClientHeight
 005027AE    imul        dword ptr [esp+10]
 005027B2    push        eax
 005027B3    mov         eax,ebx
 005027B5    call        TControl.GetClientWidth
 005027BA    imul        dword ptr [esp+10]
 005027BE    push        eax
 005027BF    mov         eax,dword ptr [ebx+270]
 005027C5    call        TCanvas.GetHandle
 005027CA    push        eax
 005027CB    call        gdi32.SetWindowExtEx
>005027D0    jmp         0050288E
 005027D5    xor         eax,eax
 005027D7    mov         dword ptr [esp+20],eax
 005027DB    xor         eax,eax
 005027DD    mov         dword ptr [esp+24],eax
 005027E1    mov         eax,dword ptr [esp+20]
 005027E5    mov         dword ptr [esp],eax
 005027E8    mov         eax,dword ptr [esp+24]
 005027EC    mov         dword ptr [esp+4],eax
 005027F0    mov         dword ptr [esp+28],1
 005027F8    mov         dword ptr [esp+2C],1
 00502800    mov         eax,dword ptr [esp+28]
 00502804    mov         dword ptr [esp+8],eax
 00502808    mov         eax,dword ptr [esp+2C]
 0050280C    mov         dword ptr [esp+0C],eax
 00502810    push        8
 00502812    mov         eax,dword ptr [ebx+270]
 00502818    call        TCanvas.GetHandle
 0050281D    push        eax
 0050281E    call        gdi32.SetMapMode
 00502823    push        0
 00502825    mov         eax,dword ptr [esp+8]
 00502829    push        eax
 0050282A    mov         eax,dword ptr [esp+8]
 0050282E    push        eax
 0050282F    mov         eax,dword ptr [ebx+270]
 00502835    call        TCanvas.GetHandle
 0050283A    push        eax
 0050283B    call        gdi32.SetWindowOrgEx
 00502840    push        0
 00502842    mov         eax,ebx
 00502844    call        TControl.GetClientHeight
 00502849    push        eax
 0050284A    mov         eax,ebx
 0050284C    call        TControl.GetClientWidth
 00502851    push        eax
 00502852    mov         eax,dword ptr [ebx+270]
 00502858    call        TCanvas.GetHandle
 0050285D    push        eax
 0050285E    call        gdi32.SetViewportExtEx
 00502863    push        0
 00502865    mov         eax,ebx
 00502867    call        TControl.GetClientHeight
 0050286C    imul        dword ptr [esp+10]
 00502870    push        eax
 00502871    mov         eax,ebx
 00502873    call        TControl.GetClientWidth
 00502878    imul        dword ptr [esp+10]
 0050287C    push        eax
 0050287D    mov         eax,dword ptr [ebx+270]
 00502883    call        TCanvas.GetHandle
 00502888    push        eax
 00502889    call        gdi32.SetWindowExtEx
 0050288E    add         esp,30
 00502891    pop         ebx
 00502892    ret
*}
end;

//00502894
procedure MinRedraw(const OldInfo:TGridAxisDrawInfo; const NewInfo:TGridAxisDrawInfo; Axis:Integer);
begin
{*
 00502894    push        ebp
 00502895    mov         ebp,esp
 00502897    add         esp,0FFFFFFEC
 0050289A    push        ebx
 0050289B    mov         dword ptr [ebp-4],ecx
 0050289E    mov         eax,dword ptr [eax+10]
 005028A1    mov         edx,dword ptr [edx+10]
 005028A4    cmp         edx,eax
>005028A6    jg          005028AA
 005028A8    mov         eax,edx
 005028AA    mov         ebx,eax
 005028AC    lea         eax,[ebp-14]
 005028AF    push        eax
 005028B0    mov         ecx,dword ptr [ebp-4]
 005028B3    and         ecx,ebx
 005028B5    mov         edx,dword ptr [ebp-4]
 005028B8    not         edx
 005028BA    and         edx,ebx
 005028BC    mov         eax,dword ptr [ebp+8]
 005028BF    mov         eax,dword ptr [eax-4]
 005028C2    call        TCustomGrid.CellRect
 005028C7    mov         eax,dword ptr [ebp+8]
 005028CA    mov         eax,dword ptr [eax-4]
 005028CD    mov         eax,dword ptr [eax+4C]
 005028D0    mov         dword ptr [ebp-8],eax
 005028D3    mov         eax,dword ptr [ebp+8]
 005028D6    mov         eax,dword ptr [eax-4]
 005028D9    mov         eax,dword ptr [eax+48]
 005028DC    mov         dword ptr [ebp-0C],eax
 005028DF    push        0
 005028E1    lea         eax,[ebp-14]
 005028E4    push        eax
 005028E5    mov         eax,dword ptr [ebp+8]
 005028E8    mov         eax,dword ptr [eax-4]
 005028EB    call        TWinControl.GetHandle
 005028F0    push        eax
 005028F1    call        user32.InvalidateRect
 005028F6    pop         ebx
 005028F7    mov         esp,ebp
 005028F9    pop         ebp
 005028FA    ret
*}
end;

//005028FC
procedure DoChange;
begin
{*
 005028FC    push        ebp
 005028FD    mov         ebp,esp
 005028FF    add         esp,0FFFFFF98
 00502902    push        ebx
 00502903    push        esi
 00502904    mov         ebx,dword ptr [ebp+8]
 00502907    add         ebx,0FFFFFFFC
 0050290A    mov         eax,dword ptr [ebx]
 0050290C    cmp         dword ptr [eax+300],0
>00502913    je          00502931
 00502915    mov         eax,dword ptr [ebx]
 00502917    mov         ecx,dword ptr [eax+290]
 0050291D    mov         eax,dword ptr [ebx]
 0050291F    mov         edx,dword ptr [eax+284]
 00502925    mov         eax,dword ptr [ebx]
 00502927    add         eax,300
 0050292C    call        UpdateExtents
 00502931    mov         eax,dword ptr [ebx]
 00502933    cmp         dword ptr [eax+308],0
>0050293A    je          00502955
 0050293C    mov         eax,dword ptr [ebx]
 0050293E    mov         edx,dword ptr [eax+284]
 00502944    mov         eax,dword ptr [ebx]
 00502946    add         eax,308
 0050294B    mov         ecx,1
 00502950    call        UpdateExtents
 00502955    mov         eax,dword ptr [ebx]
 00502957    cmp         dword ptr [eax+304],0
>0050295E    je          0050297C
 00502960    mov         eax,dword ptr [ebx]
 00502962    mov         ecx,dword ptr [eax+294]
 00502968    mov         eax,dword ptr [ebx]
 0050296A    mov         edx,dword ptr [eax+2C0]
 00502970    mov         eax,dword ptr [ebx]
 00502972    add         eax,304
 00502977    call        UpdateExtents
 0050297C    mov         eax,dword ptr [ebx]
 0050297E    mov         edx,dword ptr [eax+288]
 00502984    mov         dword ptr [ebp-8],edx
 00502987    mov         edx,dword ptr [eax+28C]
 0050298D    mov         dword ptr [ebp-4],edx
 00502990    mov         eax,dword ptr [ebx]
 00502992    mov         eax,dword ptr [eax+2C0]
 00502998    mov         edx,dword ptr [ebx]
 0050299A    cmp         eax,dword ptr [edx+28C]
>005029A0    jg          005029A6
 005029A2    dec         eax
 005029A3    mov         dword ptr [ebp-4],eax
 005029A6    mov         eax,dword ptr [ebx]
 005029A8    mov         eax,dword ptr [eax+284]
 005029AE    mov         edx,dword ptr [ebx]
 005029B0    cmp         eax,dword ptr [edx+288]
>005029B6    jg          005029BC
 005029B8    dec         eax
 005029B9    mov         dword ptr [ebp-8],eax
 005029BC    mov         edx,dword ptr [ebx]
 005029BE    mov         edx,dword ptr [edx+288]
 005029C4    mov         eax,dword ptr [ebp-8]
 005029C7    cmp         edx,eax
>005029C9    jne         005029D8
 005029CB    mov         edx,dword ptr [ebx]
 005029CD    mov         edx,dword ptr [edx+28C]
 005029D3    cmp         edx,dword ptr [ebp-4]
>005029D6    je          005029E7
 005029D8    push        1
 005029DA    push        1
 005029DC    mov         edx,dword ptr [ebx]
 005029DE    mov         ecx,dword ptr [ebp-4]
 005029E1    xchg        eax,edx
 005029E2    call        TCustomGrid.MoveCurrent
 005029E7    mov         eax,dword ptr [ebx]
 005029E9    mov         eax,dword ptr [eax+278]
 005029EF    cmp         eax,dword ptr [ebp-8]
>005029F2    jne         00502A01
 005029F4    mov         eax,dword ptr [ebx]
 005029F6    mov         eax,dword ptr [eax+27C]
 005029FC    cmp         eax,dword ptr [ebp-4]
>005029FF    je          00502A0B
 00502A01    lea         edx,[ebp-8]
 00502A04    mov         eax,dword ptr [ebx]
 00502A06    call        TCustomGrid.MoveAnchor
 00502A0B    mov         eax,dword ptr [ebx]
 00502A0D    cmp         byte ptr [eax+31E],0
>00502A14    jne         00502A36
 00502A16    mov         eax,dword ptr [ebx]
 00502A18    mov         eax,dword ptr [eax+2C8]
 00502A1E    mov         edx,dword ptr [ebp+8]
 00502A21    cmp         eax,dword ptr [edx-4C]
>00502A24    jne         00502A36
 00502A26    mov         eax,dword ptr [ebx]
 00502A28    mov         eax,dword ptr [eax+2CC]
 00502A2E    mov         edx,dword ptr [ebp+8]
 00502A31    cmp         eax,dword ptr [edx-1C]
>00502A34    je          00502A3F
 00502A36    mov         eax,dword ptr [ebx]
 00502A38    call        TCustomGrid.InvalidateGrid
>00502A3D    jmp         00502A7F
 00502A3F    mov         eax,dword ptr [ebx]
 00502A41    call        TWinControl.HandleAllocated
 00502A46    test        al,al
>00502A48    je          00502A7F
 00502A4A    lea         edx,[ebp-68]
 00502A4D    mov         eax,dword ptr [ebx]
 00502A4F    call        TCustomGrid.CalcDrawInfo
 00502A54    mov         eax,dword ptr [ebp+8]
 00502A57    push        eax
 00502A58    lea         edx,[ebp-68]
 00502A5B    mov         eax,dword ptr [ebp+8]
 00502A5E    add         eax,0FFFFFF98
 00502A61    xor         ecx,ecx
 00502A63    call        MinRedraw
 00502A68    pop         ecx
 00502A69    mov         eax,dword ptr [ebp+8]
 00502A6C    push        eax
 00502A6D    lea         edx,[ebp-38]
 00502A70    mov         eax,dword ptr [ebp+8]
 00502A73    add         eax,0FFFFFFC8
 00502A76    or          ecx,0FFFFFFFF
 00502A79    call        MinRedraw
 00502A7E    pop         ecx
 00502A7F    mov         eax,dword ptr [ebx]
 00502A81    call        TCustomGrid.UpdateScrollRange
 00502A86    mov         eax,dword ptr [ebp+8]
 00502A89    mov         ecx,dword ptr [eax-70]
 00502A8C    mov         eax,dword ptr [ebp+8]
 00502A8F    mov         edx,dword ptr [eax-6C]
 00502A92    mov         eax,dword ptr [ebx]
 00502A94    mov         si,0FFA3
 00502A98    call        @CallDynaInst
 00502A9D    pop         esi
 00502A9E    pop         ebx
 00502A9F    mov         esp,ebp
 00502AA1    pop         ebp
 00502AA2    ret
*}
end;

//00502AA4
procedure TCustomGrid.ChangeSize(NewColCount:LongInt; NewRowCount:LongInt);
begin
{*
 00502AA4    push        ebp
 00502AA5    mov         ebp,esp
 00502AA7    add         esp,0FFFFFF90
 00502AAA    push        ebx
 00502AAB    push        esi
 00502AAC    push        edi
 00502AAD    mov         esi,ecx
 00502AAF    mov         ebx,edx
 00502AB1    mov         dword ptr [ebp-4],eax
 00502AB4    mov         eax,dword ptr [ebp-4]
 00502AB7    call        TWinControl.HandleAllocated
 00502ABC    test        al,al
>00502ABE    je          00502ACB
 00502AC0    lea         edx,[ebp-68]
 00502AC3    mov         eax,dword ptr [ebp-4]
 00502AC6    call        TCustomGrid.CalcDrawInfo
 00502ACB    mov         eax,dword ptr [ebp-4]
 00502ACE    mov         eax,dword ptr [eax+284]
 00502AD4    mov         dword ptr [ebp-6C],eax
 00502AD7    mov         eax,dword ptr [ebp-4]
 00502ADA    mov         eax,dword ptr [eax+2C0]
 00502AE0    mov         dword ptr [ebp-70],eax
 00502AE3    mov         eax,dword ptr [ebp-4]
 00502AE6    mov         dword ptr [eax+284],ebx
 00502AEC    mov         eax,dword ptr [ebp-4]
 00502AEF    mov         dword ptr [eax+2C0],esi
 00502AF5    mov         eax,dword ptr [ebp-4]
 00502AF8    cmp         ebx,dword ptr [eax+29C]
>00502AFE    jge         00502B0A
 00502B00    dec         ebx
 00502B01    mov         eax,dword ptr [ebp-4]
 00502B04    mov         dword ptr [eax+29C],ebx
 00502B0A    mov         eax,dword ptr [ebp-4]
 00502B0D    cmp         esi,dword ptr [eax+2A0]
>00502B13    jge         00502B1F
 00502B15    dec         esi
 00502B16    mov         eax,dword ptr [ebp-4]
 00502B19    mov         dword ptr [eax+2A0],esi
 00502B1F    xor         eax,eax
 00502B21    push        ebp
 00502B22    push        502B3E
 00502B27    push        dword ptr fs:[eax]
 00502B2A    mov         dword ptr fs:[eax],esp
 00502B2D    push        ebp
 00502B2E    call        DoChange
 00502B33    pop         ecx
 00502B34    xor         eax,eax
 00502B36    pop         edx
 00502B37    pop         ecx
 00502B38    pop         ecx
 00502B39    mov         dword ptr fs:[eax],edx
>00502B3C    jmp         00502B74
>00502B3E    jmp         @HandleAnyException
 00502B43    mov         eax,dword ptr [ebp-4]
 00502B46    mov         edx,dword ptr [ebp-6C]
 00502B49    mov         dword ptr [eax+284],edx
 00502B4F    mov         eax,dword ptr [ebp-4]
 00502B52    mov         edx,dword ptr [ebp-70]
 00502B55    mov         dword ptr [eax+2C0],edx
 00502B5B    push        ebp
 00502B5C    call        DoChange
 00502B61    pop         ecx
 00502B62    mov         eax,dword ptr [ebp-4]
 00502B65    call        TCustomGrid.InvalidateGrid
 00502B6A    call        @RaiseAgain
 00502B6F    call        @DoneExcept
 00502B74    pop         edi
 00502B75    pop         esi
 00502B76    pop         ebx
 00502B77    mov         esp,ebp
 00502B79    pop         ebp
 00502B7A    ret
*}
end;

//00502B7C
procedure TCustomGrid.ClampInView(const Coord:TGridCoord);
begin
{*
 00502B7C    push        ebx
 00502B7D    push        esi
 00502B7E    add         esp,0FFFFFF90
 00502B81    mov         esi,edx
 00502B83    mov         ebx,eax
 00502B85    mov         eax,ebx
 00502B87    call        TWinControl.HandleAllocated
 00502B8C    test        al,al
>00502B8E    je          00502C3E
 00502B94    lea         edx,[esp+10]
 00502B98    mov         eax,ebx
 00502B9A    call        TCustomGrid.CalcDrawInfo
 00502B9F    mov         eax,dword ptr [esi]
 00502BA1    cmp         eax,dword ptr [esp+20]
>00502BA5    jg          00502BC3
 00502BA7    mov         edx,dword ptr [esi+4]
 00502BAA    cmp         edx,dword ptr [esp+50]
>00502BAE    jg          00502BC3
 00502BB0    cmp         eax,dword ptr [ebx+2C8]
>00502BB6    jl          00502BC3
 00502BB8    mov         eax,dword ptr [esi+4]
 00502BBB    cmp         eax,dword ptr [ebx+2CC]
>00502BC1    jge         00502C3E
 00502BC3    mov         eax,dword ptr [ebx+2C8]
 00502BC9    mov         dword ptr [esp+8],eax
 00502BCD    mov         eax,dword ptr [ebx+2CC]
 00502BD3    mov         dword ptr [esp+0C],eax
 00502BD7    push        esp
 00502BD8    lea         ecx,[esp+14]
 00502BDC    mov         edx,esi
 00502BDE    mov         eax,ebx
 00502BE0    call        TCustomGrid.CalcMaxTopLeft
 00502BE5    mov         eax,ebx
 00502BE7    mov         edx,dword ptr [eax]
 00502BE9    call        dword ptr [edx+9C]
 00502BEF    mov         eax,dword ptr [esi]
 00502BF1    cmp         eax,dword ptr [ebx+2C8]
>00502BF7    jge         00502C01
 00502BF9    mov         dword ptr [ebx+2C8],eax
>00502BFF    jmp         00502C10
 00502C01    cmp         eax,dword ptr [esp+20]
>00502C05    jle         00502C10
 00502C07    mov         eax,dword ptr [esp]
 00502C0A    mov         dword ptr [ebx+2C8],eax
 00502C10    mov         eax,dword ptr [esi+4]
 00502C13    cmp         eax,dword ptr [ebx+2CC]
>00502C19    jge         00502C23
 00502C1B    mov         dword ptr [ebx+2CC],eax
>00502C21    jmp         00502C33
 00502C23    cmp         eax,dword ptr [esp+50]
>00502C27    jle         00502C33
 00502C29    mov         eax,dword ptr [esp+4]
 00502C2D    mov         dword ptr [ebx+2CC],eax
 00502C33    lea         edx,[esp+8]
 00502C37    mov         eax,ebx
 00502C39    call        TCustomGrid.TopLeftMoved
 00502C3E    add         esp,70
 00502C41    pop         esi
 00502C42    pop         ebx
 00502C43    ret
*}
end;

//00502C44
procedure TCustomGrid.DrawSizingLine(const DrawInfo:TGridDrawInfo);
begin
{*
 00502C44    push        ebp
 00502C45    mov         ebp,esp
 00502C47    add         esp,0FFFFFFF8
 00502C4A    push        ebx
 00502C4B    push        esi
 00502C4C    push        edi
 00502C4D    mov         edi,edx
 00502C4F    mov         ebx,eax
 00502C51    mov         dl,1
 00502C53    mov         eax,[0045FE60];TPen
 00502C58    call        TPen.Create
 00502C5D    mov         dword ptr [ebp-4],eax
 00502C60    xor         eax,eax
 00502C62    push        ebp
 00502C63    push        502D76
 00502C68    push        dword ptr fs:[eax]
 00502C6B    mov         dword ptr fs:[eax],esp
 00502C6E    mov         eax,dword ptr [ebx+270]
 00502C74    mov         dword ptr [ebp-8],eax
 00502C77    mov         eax,dword ptr [ebp-8]
 00502C7A    mov         edx,dword ptr [eax+44]
 00502C7D    mov         eax,dword ptr [ebp-4]
 00502C80    mov         ecx,dword ptr [eax]
 00502C82    call        dword ptr [ecx+8]
 00502C85    mov         eax,dword ptr [ebp-8]
 00502C88    mov         eax,dword ptr [eax+44]
 00502C8B    mov         dl,2
 00502C8D    call        TPen.SetStyle
 00502C92    mov         eax,dword ptr [ebp-8]
 00502C95    mov         eax,dword ptr [eax+44]
 00502C98    mov         dl,0E
 00502C9A    call        TPen.SetMode
 00502C9F    mov         eax,dword ptr [ebp-8]
 00502CA2    mov         eax,dword ptr [eax+44]
 00502CA5    mov         edx,1
 00502CAA    call        TPen.SetWidth
 00502CAF    xor         eax,eax
 00502CB1    push        ebp
 00502CB2    push        502D59
 00502CB7    push        dword ptr fs:[eax]
 00502CBA    mov         dword ptr fs:[eax],esp
 00502CBD    cmp         byte ptr [ebx+318],2
>00502CC4    jne         00502D1F
 00502CC6    mov         eax,ebx
 00502CC8    mov         si,0FFC7
 00502CCC    call        @CallDynaInst
 00502CD1    test        al,al
>00502CD3    je          00502CFC
 00502CD5    mov         ecx,dword ptr [ebx+2D4]
 00502CDB    mov         edx,dword ptr [edi+0C]
 00502CDE    mov         eax,dword ptr [ebp-8]
 00502CE1    mov         esi,dword ptr [eax]
 00502CE3    call        dword ptr [esi+64]
 00502CE6    mov         edx,dword ptr [edi+0C]
 00502CE9    sub         edx,dword ptr [edi+8]
 00502CEC    mov         ecx,dword ptr [ebx+2D4]
 00502CF2    mov         eax,dword ptr [ebp-8]
 00502CF5    mov         ebx,dword ptr [eax]
 00502CF7    call        dword ptr [ebx+60]
>00502CFA    jmp         00502D40
 00502CFC    mov         ecx,dword ptr [ebx+2D4]
 00502D02    xor         edx,edx
 00502D04    mov         eax,dword ptr [ebp-8]
 00502D07    mov         esi,dword ptr [eax]
 00502D09    call        dword ptr [esi+64]
 00502D0C    mov         ecx,dword ptr [ebx+2D4]
 00502D12    mov         edx,dword ptr [edi+8]
 00502D15    mov         eax,dword ptr [ebp-8]
 00502D18    mov         ebx,dword ptr [eax]
 00502D1A    call        dword ptr [ebx+60]
>00502D1D    jmp         00502D40
 00502D1F    mov         edx,dword ptr [ebx+2D4]
 00502D25    xor         ecx,ecx
 00502D27    mov         eax,dword ptr [ebp-8]
 00502D2A    mov         esi,dword ptr [eax]
 00502D2C    call        dword ptr [esi+64]
 00502D2F    mov         ecx,dword ptr [edi+38]
 00502D32    mov         edx,dword ptr [ebx+2D4]
 00502D38    mov         eax,dword ptr [ebp-8]
 00502D3B    mov         ebx,dword ptr [eax]
 00502D3D    call        dword ptr [ebx+60]
 00502D40    xor         eax,eax
 00502D42    pop         edx
 00502D43    pop         ecx
 00502D44    pop         ecx
 00502D45    mov         dword ptr fs:[eax],edx
 00502D48    push        502D60
 00502D4D    mov         edx,dword ptr [ebp-4]
 00502D50    mov         eax,dword ptr [ebp-8]
 00502D53    call        TCanvas.SetPen
 00502D58    ret
>00502D59    jmp         @HandleFinally
>00502D5E    jmp         00502D4D
 00502D60    xor         eax,eax
 00502D62    pop         edx
 00502D63    pop         ecx
 00502D64    pop         ecx
 00502D65    mov         dword ptr fs:[eax],edx
 00502D68    push        502D7D
 00502D6D    mov         eax,dword ptr [ebp-4]
 00502D70    call        TObject.Free
 00502D75    ret
>00502D76    jmp         @HandleFinally
>00502D7B    jmp         00502D6D
 00502D7D    pop         edi
 00502D7E    pop         esi
 00502D7F    pop         ebx
 00502D80    pop         ecx
 00502D81    pop         ecx
 00502D82    pop         ebp
 00502D83    ret
*}
end;

//00502D84
procedure TCustomGrid.DrawCellHighlight(const ARect:TRect; AState:TGridDrawState; ACol:Integer; ARow:Integer);
begin
{*
 00502D84    push        ebp
 00502D85    mov         ebp,esp
 00502D87    add         esp,0FFFFFFE8
 00502D8A    push        ebx
 00502D8B    push        esi
 00502D8C    push        edi
 00502D8D    mov         byte ptr [ebp-1],cl
 00502D90    mov         esi,edx
 00502D92    mov         ebx,eax
 00502D94    test        byte ptr [ebx+2B5],10
>00502D9B    je          00502DA1
 00502D9D    or          byte ptr [ebp-1],8
 00502DA1    movzx       eax,byte ptr [ebx+324]
 00502DA8    cmp         al,1
>00502DAA    jne         00502E9B
 00502DB0    mov         edx,dword ptr ds:[78D080];^gvar_00784C80
 00502DB6    cmp         dword ptr [edx],6
>00502DB9    jl          00502E9B
 00502DBF    mov         eax,dword ptr [ebx+270]
 00502DC5    mov         eax,dword ptr [eax+48]
 00502DC8    xor         edx,edx
 00502DCA    call        TBrush.SetStyle
 00502DCF    mov         edx,esi
 00502DD1    mov         eax,dword ptr [ebx+270]
 00502DD7    mov         ecx,dword ptr [eax]
 00502DD9    call        dword ptr [ecx+54]
 00502DDC    call        ThemeServices
 00502DE1    mov         dl,7
 00502DE3    call        TThemeServices.GetTheme
 00502DE8    mov         edi,eax
 00502DEA    push        esi
 00502DEB    push        edi
 00502DEC    lea         edi,[ebp-18]
 00502DEF    movs        dword ptr [edi],dword ptr [esi]
 00502DF0    movs        dword ptr [edi],dword ptr [esi]
 00502DF1    movs        dword ptr [edi],dword ptr [esi]
 00502DF2    movs        dword ptr [edi],dword ptr [esi]
 00502DF3    pop         edi
 00502DF4    pop         esi
 00502DF5    test        byte ptr [ebp-1],8
>00502DF9    je          00502E3F
 00502DFB    mov         eax,dword ptr [ebx+29C]
 00502E01    mov         edx,eax
 00502E03    inc         edx
 00502E04    cmp         edx,dword ptr [ebp+0C]
>00502E07    jg          00502E24
 00502E09    mov         edx,dword ptr [ebx+284]
 00502E0F    dec         edx
 00502E10    cmp         edx,dword ptr [ebp+0C]
>00502E13    jle         00502E24
 00502E15    push        0
 00502E17    push        4
 00502E19    lea         eax,[ebp-18]
 00502E1C    push        eax
 00502E1D    call        user32.InflateRect
>00502E22    jmp         00502E3F
 00502E24    cmp         eax,dword ptr [ebp+0C]
>00502E27    jne         00502E2F
 00502E29    add         dword ptr [ebp-10],4
>00502E2D    jmp         00502E3F
 00502E2F    mov         eax,dword ptr [ebx+284]
 00502E35    dec         eax
 00502E36    cmp         eax,dword ptr [ebp+0C]
>00502E39    jne         00502E3F
 00502E3B    sub         dword ptr [ebp-18],4
 00502E3F    push        esi
 00502E40    lea         eax,[ebp-18]
 00502E43    push        eax
 00502E44    push        2
 00502E46    push        0E
 00502E48    mov         eax,dword ptr [ebx+270]
 00502E4E    call        TCanvas.GetHandle
 00502E53    push        eax
 00502E54    push        edi
 00502E55    mov         eax,[0078D2E8];DrawThemeBackground:function(val hTheme:Windows.THandle;val hdc:Windows.H...
 00502E5A    mov         eax,dword ptr [eax]
 00502E5C    call        eax
 00502E5E    lea         eax,[ebp-8]
 00502E61    push        eax
 00502E62    push        0EDB
 00502E67    push        2
 00502E69    push        0E
 00502E6B    push        edi
 00502E6C    mov         eax,[0078D79C];GetThemeColor:function(val hTheme:Windows.THandle;val iPartId:System.Inte...
 00502E71    mov         eax,dword ptr [eax]
 00502E73    call        eax
 00502E75    mov         eax,dword ptr [ebx+270]
 00502E7B    mov         eax,dword ptr [eax+40]
 00502E7E    mov         edx,dword ptr [ebp-8]
 00502E81    call        TFont.SetColor
 00502E86    mov         eax,dword ptr [ebx+270]
 00502E8C    mov         eax,dword ptr [eax+48]
 00502E8F    mov         dl,1
 00502E91    call        TBrush.SetStyle
>00502E96    jmp         00502FBA
 00502E9B    cmp         al,2
>00502E9D    jne         00502F87
 00502EA3    lea         edi,[ebp-18]
 00502EA6    movs        dword ptr [edi],dword ptr [esi]
 00502EA7    movs        dword ptr [edi],dword ptr [esi]
 00502EA8    movs        dword ptr [edi],dword ptr [esi]
 00502EA9    movs        dword ptr [edi],dword ptr [esi]
 00502EAA    mov         eax,dword ptr [ebx+270]
 00502EB0    mov         eax,dword ptr [eax+48]
 00502EB3    mov         edx,0FF00000D
 00502EB8    call        TBrush.SetColor
 00502EBD    lea         edx,[ebp-18]
 00502EC0    mov         eax,dword ptr [ebx+270]
 00502EC6    mov         ecx,dword ptr [eax]
 00502EC8    call        dword ptr [ecx+5C]
 00502ECB    test        byte ptr [ebp-1],8
>00502ECF    je          00502F22
 00502ED1    push        0FF
 00502ED3    push        0
 00502ED5    lea         eax,[ebp-18]
 00502ED8    push        eax
 00502ED9    call        user32.InflateRect
 00502EDE    mov         eax,dword ptr [ebx+29C]
 00502EE4    mov         edx,eax
 00502EE6    inc         edx
 00502EE7    cmp         edx,dword ptr [ebp+0C]
>00502EEA    jg          00502F07
 00502EEC    mov         edx,dword ptr [ebx+284]
 00502EF2    dec         edx
 00502EF3    cmp         edx,dword ptr [ebp+0C]
>00502EF6    jle         00502F07
 00502EF8    push        0
 00502EFA    push        2
 00502EFC    lea         eax,[ebp-18]
 00502EFF    push        eax
 00502F00    call        user32.InflateRect
>00502F05    jmp         00502F2F
 00502F07    cmp         eax,dword ptr [ebp+0C]
>00502F0A    jne         00502F11
 00502F0C    inc         dword ptr [ebp-18]
>00502F0F    jmp         00502F2F
 00502F11    mov         eax,dword ptr [ebx+284]
 00502F17    dec         eax
 00502F18    cmp         eax,dword ptr [ebp+0C]
>00502F1B    jne         00502F2F
 00502F1D    dec         dword ptr [ebp-10]
>00502F20    jmp         00502F2F
 00502F22    push        0FF
 00502F24    push        0FF
 00502F26    lea         eax,[ebp-18]
 00502F29    push        eax
 00502F2A    call        user32.InflateRect
 00502F2F    lea         eax,[ebp-18]
 00502F32    push        eax
 00502F33    push        1
 00502F35    mov         edx,0A
 00502F3A    mov         eax,0FF00000D
 00502F3F    call        GetShadowColor
 00502F44    push        eax
 00502F45    mov         edx,2D
 00502F4A    mov         eax,0FF00000D
 00502F4F    call        GetShadowColor
 00502F54    mov         edx,eax
 00502F56    mov         eax,dword ptr [ebx+270]
 00502F5C    pop         ecx
 00502F5D    call        GradientFillCanvas
 00502F62    mov         eax,dword ptr [ebx+270]
 00502F68    mov         eax,dword ptr [eax+40]
 00502F6B    mov         edx,0FF00000E
 00502F70    call        TFont.SetColor
 00502F75    mov         eax,dword ptr [ebx+270]
 00502F7B    mov         eax,dword ptr [eax+48]
 00502F7E    mov         dl,1
 00502F80    call        TBrush.SetStyle
>00502F85    jmp         00502FBA
 00502F87    mov         eax,dword ptr [ebx+270]
 00502F8D    mov         eax,dword ptr [eax+48]
 00502F90    mov         edx,0FF00000D
 00502F95    call        TBrush.SetColor
 00502F9A    mov         eax,dword ptr [ebx+270]
 00502FA0    mov         eax,dword ptr [eax+40]
 00502FA3    mov         edx,0FF00000E
 00502FA8    call        TFont.SetColor
 00502FAD    mov         edx,esi
 00502FAF    mov         eax,dword ptr [ebx+270]
 00502FB5    mov         ecx,dword ptr [eax]
 00502FB7    call        dword ptr [ecx+54]
 00502FBA    pop         edi
 00502FBB    pop         esi
 00502FBC    pop         ebx
 00502FBD    mov         esp,ebp
 00502FBF    pop         ebp
 00502FC0    ret         8
*}
end;

//00502FC4
procedure TCustomGrid.DrawCellBackground(const ARect:TRect; AColor:TColor; AState:TGridDrawState; ACol:Integer; ARow:Integer);
begin
{*
 00502FC4    push        ebp
 00502FC5    mov         ebp,esp
 00502FC7    add         esp,0FFFFFFDC
 00502FCA    push        ebx
 00502FCB    push        esi
 00502FCC    push        edi
 00502FCD    mov         edi,ecx
 00502FCF    mov         dword ptr [ebp-4],edx
 00502FD2    mov         esi,eax
 00502FD4    mov         ebx,dword ptr [ebp+10]
 00502FD7    mov         eax,dword ptr [ebp-4]
 00502FDA    push        esi
 00502FDB    push        edi
 00502FDC    mov         esi,eax
 00502FDE    lea         edi,[ebp-14]
 00502FE1    movs        dword ptr [edi],dword ptr [esi]
 00502FE2    movs        dword ptr [edi],dword ptr [esi]
 00502FE3    movs        dword ptr [edi],dword ptr [esi]
 00502FE4    movs        dword ptr [edi],dword ptr [esi]
 00502FE5    pop         edi
 00502FE6    pop         esi
 00502FE7    cmp         byte ptr [esi+324],1
>00502FEE    jne         00503081
 00502FF4    test        bl,4
>00502FF7    je          00503081
 00502FFD    push        esi
 00502FFE    lea         esi,[ebp-14]
 00503001    lea         edi,[ebp-24]
 00503004    movs        dword ptr [edi],dword ptr [esi]
 00503005    movs        dword ptr [edi],dword ptr [esi]
 00503006    movs        dword ptr [edi],dword ptr [esi]
 00503007    movs        dword ptr [edi],dword ptr [esi]
 00503008    pop         esi
 00503009    mov         eax,[0078D080];^gvar_00784C80
 0050300E    cmp         dword ptr [eax],6
>00503011    jl          00503020
 00503013    push        1
 00503015    push        1
 00503017    lea         eax,[ebp-14]
 0050301A    push        eax
 0050301B    call        user32.InflateRect
 00503020    inc         dword ptr [ebp-8]
 00503023    lea         eax,[ebp-24]
 00503026    push        eax
 00503027    lea         eax,[ebp-14]
 0050302A    push        eax
 0050302B    test        bl,20
 0050302E    setne       al
 00503031    and         eax,7F
 00503034    test        bl,10
 00503037    setne       dl
 0050303A    and         edx,7F
 0050303D    lea         edx,[edx*8+7868EC]
 00503044    mov         eax,dword ptr [edx+eax*4]
 00503047    push        eax
 00503048    push        1
 0050304A    mov         eax,dword ptr [esi+270]
 00503050    call        TCanvas.GetHandle
 00503055    push        eax
 00503056    call        ThemeServices
 0050305B    mov         dl,5
 0050305D    call        TThemeServices.GetTheme
 00503062    push        eax
 00503063    mov         eax,[0078D2E8];DrawThemeBackground:function(val hTheme:Windows.THandle;val hdc:Windows.H...
 00503068    mov         eax,dword ptr [eax]
 0050306A    call        eax
 0050306C    mov         eax,dword ptr [esi+270]
 00503072    mov         eax,dword ptr [eax+48]
 00503075    mov         dl,1
 00503077    call        TBrush.SetStyle
>0050307C    jmp         0050319E
 00503081    cmp         byte ptr [esi+324],2
>00503088    jne         00503143
 0050308E    test        bl,4
>00503091    je          00503143
 00503097    test        byte ptr [esi+2B4],1
>0050309E    jne         005030A3
 005030A0    inc         dword ptr [ebp-0C]
 005030A3    test        byte ptr [esi+2B4],2
>005030AA    jne         005030AF
 005030AC    inc         dword ptr [ebp-8]
 005030AF    test        bl,10
>005030B2    jne         005030B9
 005030B4    test        bl,20
>005030B7    je          00503114
 005030B9    test        bl,20
>005030BC    je          005030DD
 005030BE    lea         eax,[ebp-14]
 005030C1    push        eax
 005030C2    push        1
 005030C4    mov         ecx,dword ptr [esi+2AC]
 005030CA    mov         edx,dword ptr [esi+2A8]
 005030D0    mov         eax,dword ptr [esi+270]
 005030D6    call        GradientFillCanvas
>005030DB    jmp         00503131
 005030DD    lea         eax,[ebp-14]
 005030E0    push        eax
 005030E1    push        1
 005030E3    mov         edx,13
 005030E8    mov         eax,dword ptr [esi+2A8]
 005030EE    call        GetHighLightColor
 005030F3    push        eax
 005030F4    mov         edx,13
 005030F9    mov         eax,dword ptr [esi+2AC]
 005030FF    call        GetHighLightColor
 00503104    mov         edx,eax
 00503106    mov         eax,dword ptr [esi+270]
 0050310C    pop         ecx
 0050310D    call        GradientFillCanvas
>00503112    jmp         00503131
 00503114    lea         eax,[ebp-14]
 00503117    push        eax
 00503118    push        1
 0050311A    mov         ecx,dword ptr [esi+2A8]
 00503120    mov         edx,dword ptr [esi+2AC]
 00503126    mov         eax,dword ptr [esi+270]
 0050312C    call        GradientFillCanvas
 00503131    mov         eax,dword ptr [esi+270]
 00503137    mov         eax,dword ptr [eax+48]
 0050313A    mov         dl,1
 0050313C    call        TBrush.SetStyle
>00503141    jmp         0050319E
 00503143    mov         eax,dword ptr [esi+270]
 00503149    mov         eax,dword ptr [eax+48]
 0050314C    mov         edx,edi
 0050314E    call        TBrush.SetColor
 00503153    lea         edx,[ebp-14]
 00503156    mov         eax,dword ptr [esi+270]
 0050315C    mov         ecx,dword ptr [eax]
 0050315E    call        dword ptr [ecx+54]
 00503161    test        bl,20
>00503164    je          0050319E
 00503166    dec         dword ptr [ebp-0C]
 00503169    dec         dword ptr [ebp-8]
 0050316C    push        3
 0050316E    push        8
 00503170    lea         eax,[ebp-14]
 00503173    push        eax
 00503174    mov         eax,dword ptr [esi+270]
 0050317A    call        TCanvas.GetHandle
 0050317F    push        eax
 00503180    call        user32.DrawEdge
 00503185    push        0C
 00503187    push        8
 00503189    lea         eax,[ebp-14]
 0050318C    push        eax
 0050318D    mov         eax,dword ptr [esi+270]
 00503193    call        TCanvas.GetHandle
 00503198    push        eax
 00503199    call        user32.DrawEdge
 0050319E    pop         edi
 0050319F    pop         esi
 005031A0    pop         ebx
 005031A1    mov         esp,ebp
 005031A3    pop         ebp
 005031A4    ret         0C
*}
end;

//005031A8
procedure TCustomGrid.DrawMove;
begin
{*
 005031A8    push        ebp
 005031A9    mov         ebp,esp
 005031AB    add         esp,0FFFFFFE8
 005031AE    push        ebx
 005031AF    push        esi
 005031B0    push        edi
 005031B1    mov         dword ptr [ebp-4],eax
 005031B4    mov         dl,1
 005031B6    mov         eax,[0045FE60];TPen
 005031BB    call        TPen.Create
 005031C0    mov         dword ptr [ebp-8],eax
 005031C3    xor         eax,eax
 005031C5    push        ebp
 005031C6    push        50332A
 005031CB    push        dword ptr fs:[eax]
 005031CE    mov         dword ptr fs:[eax],esp
 005031D1    mov         eax,dword ptr [ebp-4]
 005031D4    mov         ebx,dword ptr [eax+270]
 005031DA    mov         edx,dword ptr [ebx+44]
 005031DD    mov         eax,dword ptr [ebp-8]
 005031E0    mov         ecx,dword ptr [eax]
 005031E2    call        dword ptr [ecx+8]
 005031E5    xor         eax,eax
 005031E7    push        ebp
 005031E8    push        50330D
 005031ED    push        dword ptr fs:[eax]
 005031F0    mov         dword ptr fs:[eax],esp
 005031F3    mov         eax,dword ptr [ebx+44]
 005031F6    mov         dl,2
 005031F8    call        TPen.SetStyle
 005031FD    mov         eax,dword ptr [ebx+44]
 00503200    mov         dl,0E
 00503202    call        TPen.SetMode
 00503207    mov         eax,dword ptr [ebx+44]
 0050320A    mov         edx,5
 0050320F    call        TPen.SetWidth
 00503214    mov         eax,dword ptr [ebp-4]
 00503217    cmp         byte ptr [eax+318],4
>0050321E    jne         00503273
 00503220    lea         eax,[ebp-18]
 00503223    push        eax
 00503224    mov         eax,dword ptr [ebp-4]
 00503227    mov         ecx,dword ptr [eax+2E0]
 0050322D    xor         edx,edx
 0050322F    mov         eax,dword ptr [ebp-4]
 00503232    call        TCustomGrid.CellRect
 00503237    mov         eax,dword ptr [ebp-4]
 0050323A    mov         eax,dword ptr [eax+2E0]
 00503240    mov         edx,dword ptr [ebp-4]
 00503243    cmp         eax,dword ptr [edx+2DC]
>00503249    jle         00503250
 0050324B    mov         esi,dword ptr [ebp-0C]
>0050324E    jmp         00503253
 00503250    mov         esi,dword ptr [ebp-14]
 00503253    mov         ecx,esi
 00503255    xor         edx,edx
 00503257    mov         eax,ebx
 00503259    mov         edi,dword ptr [eax]
 0050325B    call        dword ptr [edi+64]
 0050325E    mov         eax,dword ptr [ebp-4]
 00503261    call        TControl.GetClientWidth
 00503266    mov         edx,eax
 00503268    mov         ecx,esi
 0050326A    mov         eax,ebx
 0050326C    mov         ebx,dword ptr [eax]
 0050326E    call        dword ptr [ebx+60]
>00503271    jmp         005032EE
 00503273    lea         eax,[ebp-18]
 00503276    push        eax
 00503277    mov         eax,dword ptr [ebp-4]
 0050327A    mov         edx,dword ptr [eax+2E0]
 00503280    xor         ecx,ecx
 00503282    mov         eax,dword ptr [ebp-4]
 00503285    call        TCustomGrid.CellRect
 0050328A    mov         eax,dword ptr [ebp-4]
 0050328D    mov         eax,dword ptr [eax+2E0]
 00503293    mov         edx,dword ptr [ebp-4]
 00503296    cmp         eax,dword ptr [edx+2DC]
>0050329C    jle         005032B8
 0050329E    mov         eax,dword ptr [ebp-4]
 005032A1    mov         si,0FFC7
 005032A5    call        @CallDynaInst
 005032AA    test        al,al
>005032AC    jne         005032B3
 005032AE    mov         esi,dword ptr [ebp-10]
>005032B1    jmp         005032D0
 005032B3    mov         esi,dword ptr [ebp-18]
>005032B6    jmp         005032D0
 005032B8    mov         eax,dword ptr [ebp-4]
 005032BB    mov         si,0FFC7
 005032BF    call        @CallDynaInst
 005032C4    test        al,al
>005032C6    jne         005032CD
 005032C8    mov         esi,dword ptr [ebp-18]
>005032CB    jmp         005032D0
 005032CD    mov         esi,dword ptr [ebp-10]
 005032D0    xor         ecx,ecx
 005032D2    mov         edx,esi
 005032D4    mov         eax,ebx
 005032D6    mov         edi,dword ptr [eax]
 005032D8    call        dword ptr [edi+64]
 005032DB    mov         eax,dword ptr [ebp-4]
 005032DE    call        TControl.GetClientHeight
 005032E3    mov         ecx,eax
 005032E5    mov         edx,esi
 005032E7    mov         eax,ebx
 005032E9    mov         ebx,dword ptr [eax]
 005032EB    call        dword ptr [ebx+60]
 005032EE    xor         eax,eax
 005032F0    pop         edx
 005032F1    pop         ecx
 005032F2    pop         ecx
 005032F3    mov         dword ptr fs:[eax],edx
 005032F6    push        503314
 005032FB    mov         eax,dword ptr [ebp-4]
 005032FE    mov         eax,dword ptr [eax+270]
 00503304    mov         edx,dword ptr [ebp-8]
 00503307    call        TCanvas.SetPen
 0050330C    ret
>0050330D    jmp         @HandleFinally
>00503312    jmp         005032FB
 00503314    xor         eax,eax
 00503316    pop         edx
 00503317    pop         ecx
 00503318    pop         ecx
 00503319    mov         dword ptr fs:[eax],edx
 0050331C    push        503331
 00503321    mov         eax,dword ptr [ebp-8]
 00503324    call        TObject.Free
 00503329    ret
>0050332A    jmp         @HandleFinally
>0050332F    jmp         00503321
 00503331    pop         edi
 00503332    pop         esi
 00503333    pop         ebx
 00503334    mov         esp,ebp
 00503336    pop         ebp
 00503337    ret
*}
end;

//00503338
procedure TCustomGrid.FixedCellClick(ACol:LongInt; ARow:LongInt);
begin
{*
 00503338    push        ebx
 00503339    cmp         word ptr [eax+312],0
>00503341    je          00503356
 00503343    push        ecx
 00503344    mov         ebx,eax
 00503346    mov         ecx,edx
 00503348    mov         edx,eax
 0050334A    mov         eax,dword ptr [ebx+314]
 00503350    call        dword ptr [ebx+310]
 00503356    pop         ebx
 00503357    ret
*}
end;

//00503358
procedure TCustomGrid.FocusCell(ACol:LongInt; ARow:LongInt; MoveAnchor:Boolean);
begin
{*
 00503358    push        ebp
 00503359    mov         ebp,esp
 0050335B    push        esi
 0050335C    mov         esi,eax
 0050335E    movzx       eax,byte ptr [ebp+8]
 00503362    push        eax
 00503363    push        1
 00503365    mov         eax,esi
 00503367    call        TCustomGrid.MoveCurrent
 0050336C    mov         eax,esi
 0050336E    call        TCustomGrid.UpdateEdit
 00503373    mov         eax,esi
 00503375    mov         si,0FFEC
 00503379    call        @CallDynaInst
 0050337E    pop         esi
 0050337F    pop         ebp
 00503380    ret         4
*}
end;

//00503384
function LinePos(const AxisInfo:TGridAxisDrawInfo; Line:Integer):Integer;
begin
{*
 00503384    push        ebp
 00503385    mov         ebp,esp
 00503387    add         esp,0FFFFFFF4
 0050338A    push        ebx
 0050338B    push        esi
 0050338C    mov         dword ptr [ebp-4],edx
 0050338F    mov         ebx,eax
 00503391    xor         esi,esi
 00503393    mov         eax,dword ptr [ebx+18]
 00503396    cmp         eax,dword ptr [ebp-4]
>00503399    jle         0050339F
 0050339B    xor         eax,eax
>0050339D    jmp         005033AA
 0050339F    mov         eax,dword ptr [ebx+1C]
 005033A2    cmp         eax,dword ptr [ebp-4]
>005033A5    jg          005033AA
 005033A7    mov         esi,dword ptr [ebx+4]
 005033AA    mov         edx,dword ptr [ebp-4]
 005033AD    dec         edx
 005033AE    sub         edx,eax
>005033B0    jl          005033D7
 005033B2    inc         edx
 005033B3    mov         dword ptr [ebp-0C],edx
 005033B6    mov         dword ptr [ebp-8],eax
 005033B9    mov         edx,dword ptr [ebp-8]
 005033BC    mov         eax,dword ptr [ebx+2C]
 005033BF    call        dword ptr [ebx+28]
 005033C2    add         eax,dword ptr [ebx]
 005033C4    add         esi,eax
 005033C6    cmp         esi,dword ptr [ebx+0C]
>005033C9    jle         005033CF
 005033CB    xor         esi,esi
>005033CD    jmp         005033D7
 005033CF    inc         dword ptr [ebp-8]
 005033D2    dec         dword ptr [ebp-0C]
>005033D5    jne         005033B9
 005033D7    mov         eax,esi
 005033D9    pop         esi
 005033DA    pop         ebx
 005033DB    mov         esp,ebp
 005033DD    pop         ebp
 005033DE    ret
*}
end;

//005033E0
function CalcAxis(const AxisInfo:TGridAxisDrawInfo; GridRectMin:Integer; GridRectMax:Integer; var ScreenRectMin:Integer; var ScreenRectMax:Integer):Boolean;
begin
{*
 005033E0    push        ebp
 005033E1    mov         ebp,esp
 005033E3    add         esp,0FFFFFFE8
 005033E6    push        ebx
 005033E7    push        esi
 005033E8    push        edi
 005033E9    mov         esi,ecx
 005033EB    mov         dword ptr [ebp-4],edx
 005033EE    mov         ebx,eax
 005033F0    mov         byte ptr [ebp-5],0
 005033F4    mov         eax,dword ptr [ebx+18]
 005033F7    cmp         eax,dword ptr [ebp-4]
>005033FA    jg          00503433
 005033FC    mov         eax,dword ptr [ebx+1C]
 005033FF    cmp         eax,dword ptr [ebp-4]
>00503402    jle         00503433
 00503404    mov         eax,dword ptr [ebx+1C]
 00503407    cmp         esi,eax
>00503409    jge         00503430
 0050340B    push        0
 0050340D    lea         eax,[ebp-18]
 00503410    push        eax
 00503411    xor         ecx,ecx
 00503413    xor         edx,edx
 00503415    xor         eax,eax
 00503417    call        Rect
 0050341C    mov         eax,dword ptr [ebp+10]
 0050341F    mov         eax,dword ptr [eax-4]
 00503422    lea         esi,[ebp-18]
 00503425    mov         edi,eax
 00503427    movs        dword ptr [edi],dword ptr [esi]
 00503428    movs        dword ptr [edi],dword ptr [esi]
 00503429    movs        dword ptr [edi],dword ptr [esi]
 0050342A    movs        dword ptr [edi],dword ptr [esi]
>0050342B    jmp         005034BD
 00503430    mov         dword ptr [ebp-4],eax
 00503433    mov         eax,dword ptr [ebx+10]
 00503436    cmp         esi,eax
>00503438    jle         00503453
 0050343A    mov         esi,eax
 0050343C    mov         eax,dword ptr [ebx+20]
 0050343F    dec         eax
 00503440    cmp         esi,eax
>00503442    jge         00503445
 00503444    inc         esi
 00503445    mov         eax,ebx
 00503447    mov         edx,esi
 00503449    call        LinePos
 0050344E    test        eax,eax
>00503450    jne         00503453
 00503452    dec         esi
 00503453    mov         eax,ebx
 00503455    mov         edx,dword ptr [ebp-4]
 00503458    call        LinePos
 0050345D    mov         edx,dword ptr [ebp+0C]
 00503460    mov         dword ptr [edx],eax
 00503462    mov         eax,ebx
 00503464    mov         edx,esi
 00503466    call        LinePos
 0050346B    mov         edx,dword ptr [ebp+8]
 0050346E    mov         dword ptr [edx],eax
 00503470    mov         eax,dword ptr [ebp+8]
 00503473    cmp         dword ptr [eax],0
>00503476    jne         0050348D
 00503478    mov         edx,dword ptr [ebp-4]
 0050347B    mov         eax,dword ptr [ebx+2C]
 0050347E    call        dword ptr [ebx+28]
 00503481    mov         edx,dword ptr [ebp+0C]
 00503484    add         eax,dword ptr [edx]
 00503486    mov         edx,dword ptr [ebp+8]
 00503489    mov         dword ptr [edx],eax
>0050348B    jmp         0050349A
 0050348D    mov         edx,esi
 0050348F    mov         eax,dword ptr [ebx+2C]
 00503492    call        dword ptr [ebx+28]
 00503495    mov         edx,dword ptr [ebp+8]
 00503498    add         dword ptr [edx],eax
 0050349A    mov         eax,dword ptr [ebx+0C]
 0050349D    mov         edx,dword ptr [ebp+8]
 005034A0    cmp         eax,dword ptr [edx]
>005034A2    jge         005034A9
 005034A4    mov         edx,dword ptr [ebp+8]
 005034A7    mov         dword ptr [edx],eax
 005034A9    mov         eax,dword ptr [ebp+10]
 005034AC    cmp         byte ptr [eax+8],0
>005034B0    je          005034B9
 005034B2    mov         eax,dword ptr [ebx]
 005034B4    mov         edx,dword ptr [ebp+8]
 005034B7    add         dword ptr [edx],eax
 005034B9    mov         byte ptr [ebp-5],1
 005034BD    movzx       eax,byte ptr [ebp-5]
 005034C1    pop         edi
 005034C2    pop         esi
 005034C3    pop         ebx
 005034C4    mov         esp,ebp
 005034C6    pop         ebp
 005034C7    ret         8
*}
end;

//005034CC
procedure TCustomGrid.GridRectToScreenRect(GridRect:TGridRect; var ScreenRect:TRect; IncludeLine:Boolean);
begin
{*
 005034CC    push        ebp
 005034CD    mov         ebp,esp
 005034CF    add         esp,0FFFFFF78
 005034D5    push        ebx
 005034D6    push        esi
 005034D7    push        edi
 005034D8    mov         esi,edx
 005034DA    lea         edi,[ebp-14]
 005034DD    movs        dword ptr [edi],dword ptr [esi]
 005034DE    movs        dword ptr [edi],dword ptr [esi]
 005034DF    movs        dword ptr [edi],dword ptr [esi]
 005034E0    movs        dword ptr [edi],dword ptr [esi]
 005034E1    mov         dword ptr [ebp-4],ecx
 005034E4    mov         ebx,eax
 005034E6    push        0
 005034E8    lea         eax,[ebp-88]
 005034EE    push        eax
 005034EF    xor         ecx,ecx
 005034F1    xor         edx,edx
 005034F3    xor         eax,eax
 005034F5    call        Rect
 005034FA    mov         eax,dword ptr [ebp-4]
 005034FD    lea         esi,[ebp-88]
 00503503    mov         edi,eax
 00503505    movs        dword ptr [edi],dword ptr [esi]
 00503506    movs        dword ptr [edi],dword ptr [esi]
 00503507    movs        dword ptr [edi],dword ptr [esi]
 00503508    movs        dword ptr [edi],dword ptr [esi]
 00503509    mov         eax,dword ptr [ebp-14]
 0050350C    cmp         eax,dword ptr [ebp-0C]
>0050350F    jg          005035C7
 00503515    mov         eax,dword ptr [ebp-10]
 00503518    cmp         eax,dword ptr [ebp-8]
>0050351B    jg          005035C7
 00503521    lea         edx,[ebp-78]
 00503524    mov         eax,ebx
 00503526    call        TCustomGrid.CalcDrawInfo
 0050352B    mov         eax,dword ptr [ebp-68]
 0050352E    inc         eax
 0050352F    mov         esi,dword ptr [ebp-14]
 00503532    cmp         eax,esi
>00503534    jl          005035C7
 0050353A    mov         eax,dword ptr [ebp-38]
 0050353D    inc         eax
 0050353E    cmp         eax,dword ptr [ebp-10]
>00503541    jl          005035C7
 00503547    push        ebp
 00503548    mov         eax,dword ptr [ebp-4]
 0050354B    push        eax
 0050354C    mov         eax,dword ptr [ebp-4]
 0050354F    add         eax,8
 00503552    push        eax
 00503553    lea         eax,[ebp-78]
 00503556    mov         ecx,dword ptr [ebp-0C]
 00503559    mov         edx,esi
 0050355B    call        CalcAxis
 00503560    pop         ecx
 00503561    test        al,al
>00503563    je          00503583
 00503565    push        ebp
 00503566    mov         eax,dword ptr [ebp-4]
 00503569    add         eax,4
 0050356C    push        eax
 0050356D    mov         eax,dword ptr [ebp-4]
 00503570    add         eax,0C
 00503573    push        eax
 00503574    lea         eax,[ebp-48]
 00503577    mov         ecx,dword ptr [ebp-8]
 0050357A    mov         edx,dword ptr [ebp-10]
 0050357D    call        CalcAxis
 00503582    pop         ecx
 00503583    mov         eax,ebx
 00503585    mov         si,0FFC7
 00503589    call        @CallDynaInst
 0050358E    test        al,al
>00503590    je          005035C7
 00503592    mov         eax,dword ptr [ebx+270]
 00503598    mov         edx,dword ptr [eax]
 0050359A    call        dword ptr [edx+0C]
 0050359D    test        al,al
>0050359F    jne         005035C7
 005035A1    mov         esi,dword ptr [ebp-4]
 005035A4    mov         esi,dword ptr [esi]
 005035A6    mov         eax,ebx
 005035A8    call        TControl.GetClientWidth
 005035AD    mov         edx,dword ptr [ebp-4]
 005035B0    sub         eax,dword ptr [edx+8]
 005035B3    mov         edx,dword ptr [ebp-4]
 005035B6    mov         dword ptr [edx],eax
 005035B8    mov         eax,ebx
 005035BA    call        TControl.GetClientWidth
 005035BF    sub         eax,esi
 005035C1    mov         edx,dword ptr [ebp-4]
 005035C4    mov         dword ptr [edx+8],eax
 005035C7    pop         edi
 005035C8    pop         esi
 005035C9    pop         ebx
 005035CA    mov         esp,ebp
 005035CC    pop         ebp
 005035CD    ret         4
*}
end;

//005035D0
procedure TCustomGrid.Initialize;
begin
{*
 005035D0    mov         edx,dword ptr [eax+29C]
 005035D6    mov         dword ptr [eax+2C8],edx
 005035DC    mov         edx,dword ptr [eax+2A0]
 005035E2    mov         dword ptr [eax+2CC],edx
 005035E8    mov         edx,dword ptr [eax+2C8]
 005035EE    mov         dword ptr [eax+288],edx
 005035F4    mov         edx,dword ptr [eax+2CC]
 005035FA    mov         dword ptr [eax+28C],edx
 00503600    mov         edx,dword ptr [eax+288]
 00503606    mov         dword ptr [eax+278],edx
 0050360C    mov         edx,dword ptr [eax+28C]
 00503612    mov         dword ptr [eax+27C],edx
 00503618    test        byte ptr [eax+2B5],10
>0050361F    je          0050362E
 00503621    mov         edx,dword ptr [eax+284]
 00503627    dec         edx
 00503628    mov         dword ptr [eax+278],edx
 0050362E    ret
*}
end;

//00503630
procedure TCustomGrid.InvalidateCell(ACol:LongInt; ARow:LongInt);
begin
{*
 00503630    push        esi
 00503631    add         esp,0FFFFFFF0
 00503634    mov         esi,eax
 00503636    mov         dword ptr [esp+4],ecx
 0050363A    mov         dword ptr [esp],edx
 0050363D    mov         dword ptr [esp+0C],ecx
 00503641    mov         dword ptr [esp+8],edx
 00503645    mov         edx,esp
 00503647    mov         eax,esi
 00503649    call        TCustomGrid.InvalidateRect
 0050364E    add         esp,10
 00503651    pop         esi
 00503652    ret
*}
end;

//00503654
procedure TCustomGrid.InvalidateGrid;
begin
{*
 00503654    mov         edx,dword ptr [eax]
 00503656    call        dword ptr [edx+90]
 0050365C    ret
*}
end;

//00503660
procedure TCustomGrid.InvalidateRect(ARect:TGridRect);
begin
{*
 00503660    push        ebx
 00503661    push        esi
 00503662    push        edi
 00503663    add         esp,0FFFFFFE0
 00503666    mov         esi,edx
 00503668    lea         edi,[esp]
 0050366B    movs        dword ptr [edi],dword ptr [esi]
 0050366C    movs        dword ptr [edi],dword ptr [esi]
 0050366D    movs        dword ptr [edi],dword ptr [esi]
 0050366E    movs        dword ptr [edi],dword ptr [esi]
 0050366F    mov         ebx,eax
 00503671    mov         eax,ebx
 00503673    call        TWinControl.HandleAllocated
 00503678    test        al,al
>0050367A    je          005036A1
 0050367C    push        1
 0050367E    lea         ecx,[esp+14]
 00503682    lea         edx,[esp+4]
 00503686    mov         eax,ebx
 00503688    call        TCustomGrid.GridRectToScreenRect
 0050368D    push        0
 0050368F    lea         eax,[esp+14]
 00503693    push        eax
 00503694    mov         eax,ebx
 00503696    call        TWinControl.GetHandle
 0050369B    push        eax
 0050369C    call        user32.InvalidateRect
 005036A1    add         esp,20
 005036A4    pop         edi
 005036A5    pop         esi
 005036A6    pop         ebx
 005036A7    ret
*}
end;

//005036A8
procedure TCustomGrid.IsTouchPropertyStored(AProperty:TTouchProperty);
begin
{*
 005036A8    push        ebx
 005036A9    push        esi
 005036AA    mov         ebx,edx
 005036AC    mov         esi,eax
 005036AE    mov         edx,ebx
 005036B0    mov         eax,esi
 005036B2    call        TControl.IsTouchPropertyStored
 005036B7    sub         bl,1
>005036BA    jb          005036C0
>005036BC    je          005036D6
>005036BE    jmp         005036E9
 005036C0    mov         eax,dword ptr [esi+0AC]
 005036C6    movzx       edx,byte ptr ds:[5036EC]
 005036CD    cmp         dl,byte ptr [eax+10]
 005036D0    setne       al
 005036D3    pop         esi
 005036D4    pop         ebx
 005036D5    ret
 005036D6    mov         eax,dword ptr [esi+0AC]
 005036DC    movzx       edx,byte ptr ds:[5036F0]
 005036E3    cmp         dl,byte ptr [eax+11]
 005036E6    setne       al
 005036E9    pop         esi
 005036EA    pop         ebx
 005036EB    ret
*}
end;

//005036F4
function Min:LongInt;
begin
{*
 005036F4    push        ebp
 005036F5    mov         ebp,esp
 005036F7    mov         eax,dword ptr [ebp+8]
 005036FA    cmp         dword ptr [eax-4],0
>005036FE    jne         0050370E
 00503700    mov         eax,dword ptr [ebp+8]
 00503703    mov         eax,dword ptr [eax-8]
 00503706    mov         eax,dword ptr [eax+29C]
 0050370C    pop         ebp
 0050370D    ret
 0050370E    mov         eax,dword ptr [ebp+8]
 00503711    mov         eax,dword ptr [eax-8]
 00503714    mov         eax,dword ptr [eax+2A0]
 0050371A    pop         ebp
 0050371B    ret
*}
end;

//0050371C
function Max:LongInt;
begin
{*
 0050371C    push        ebp
 0050371D    mov         ebp,esp
 0050371F    mov         eax,dword ptr [ebp+8]
 00503722    cmp         dword ptr [eax-4],0
>00503726    jne         00503730
 00503728    mov         eax,dword ptr [ebp+8]
 0050372B    mov         eax,dword ptr [eax-10]
 0050372E    pop         ebp
 0050372F    ret
 00503730    mov         eax,dword ptr [ebp+8]
 00503733    mov         eax,dword ptr [eax-0C]
 00503736    pop         ebp
 00503737    ret
*}
end;

//00503738
function PageUp:LongInt;
begin
{*
 00503738    push        ebp
 00503739    mov         ebp,esp
 0050373B    add         esp,0FFFFFFF8
 0050373E    lea         eax,[ebp-8]
 00503741    push        eax
 00503742    mov         eax,dword ptr [ebp+8]
 00503745    lea         ecx,[eax-70]
 00503748    mov         eax,dword ptr [ebp+8]
 0050374B    mov         eax,dword ptr [eax-8]
 0050374E    lea         edx,[eax+2C8]
 00503754    mov         eax,dword ptr [ebp+8]
 00503757    mov         eax,dword ptr [eax-8]
 0050375A    call        TCustomGrid.CalcMaxTopLeft
 0050375F    mov         eax,dword ptr [ebp+8]
 00503762    cmp         dword ptr [eax-4],0
>00503766    jne         00503779
 00503768    mov         eax,dword ptr [ebp+8]
 0050376B    mov         eax,dword ptr [eax-8]
 0050376E    mov         eax,dword ptr [eax+2C8]
 00503774    sub         eax,dword ptr [ebp-8]
>00503777    jmp         00503788
 00503779    mov         eax,dword ptr [ebp+8]
 0050377C    mov         eax,dword ptr [eax-8]
 0050377F    mov         eax,dword ptr [eax+2CC]
 00503785    sub         eax,dword ptr [ebp-4]
 00503788    cmp         eax,1
>0050378B    jge         00503792
 0050378D    mov         eax,1
 00503792    pop         ecx
 00503793    pop         ecx
 00503794    pop         ebp
 00503795    ret
*}
end;

//00503798
function PageDown:LongInt;
begin
{*
 00503798    push        ebp
 00503799    mov         ebp,esp
 0050379B    add         esp,0FFFFFFA0
 0050379E    lea         edx,[ebp-60]
 005037A1    mov         eax,dword ptr [ebp+8]
 005037A4    mov         eax,dword ptr [eax-8]
 005037A7    call        TCustomGrid.CalcDrawInfo
 005037AC    mov         eax,dword ptr [ebp+8]
 005037AF    cmp         dword ptr [eax-4],0
>005037B3    jne         005037C9
 005037B5    mov         eax,dword ptr [ebp+8]
 005037B8    mov         eax,dword ptr [eax-8]
 005037BB    push        dword ptr [eax+2C8]
 005037C1    mov         eax,dword ptr [ebp-50]
 005037C4    pop         edx
 005037C5    sub         eax,edx
>005037C7    jmp         005037DB
 005037C9    mov         eax,dword ptr [ebp+8]
 005037CC    mov         eax,dword ptr [eax-8]
 005037CF    push        dword ptr [eax+2CC]
 005037D5    mov         eax,dword ptr [ebp-20]
 005037D8    pop         edx
 005037D9    sub         eax,edx
 005037DB    cmp         eax,1
>005037DE    jge         005037E5
 005037E0    mov         eax,1
 005037E5    mov         esp,ebp
 005037E7    pop         ebp
 005037E8    ret
*}
end;

//005037EC
function CalcScrollBar(Value:LongInt; ARTLFactor:LongInt):LongInt;
begin
{*
 005037EC    push        ebp
 005037ED    mov         ebp,esp
 005037EF    push        ebx
 005037F0    push        esi
 005037F1    push        edi
 005037F2    mov         edi,edx
 005037F4    mov         ebx,eax
 005037F6    mov         eax,dword ptr [ebp+8]
 005037F9    mov         eax,dword ptr [eax-74]
 005037FC    cmp         eax,7
>005037FF    ja          0050391C
 00503805    jmp         dword ptr [eax*4+50380C]
 00503805    dd          0050382C
 00503805    dd          00503833
 00503805    dd          0050383A
 00503805    dd          0050384D
 00503805    dd          00503860
 00503805    dd          00503860
 00503805    dd          00503910
 00503805    dd          00503902
 0050382C    sub         ebx,edi
>0050382E    jmp         0050391C
 00503833    add         ebx,edi
>00503835    jmp         0050391C
 0050383A    mov         eax,dword ptr [ebp+8]
 0050383D    push        eax
 0050383E    call        PageUp
 00503843    pop         ecx
 00503844    imul        edi
 00503846    sub         ebx,eax
>00503848    jmp         0050391C
 0050384D    mov         eax,dword ptr [ebp+8]
 00503850    push        eax
 00503851    call        PageDown
 00503856    pop         ecx
 00503857    imul        edi
 00503859    add         ebx,eax
>0050385B    jmp         0050391C
 00503860    mov         eax,dword ptr [ebp+8]
 00503863    mov         eax,dword ptr [eax-8]
 00503866    test        byte ptr [eax+2B5],40
>0050386D    jne         0050387C
 0050386F    mov         eax,dword ptr [ebp+8]
 00503872    cmp         dword ptr [eax-74],4
>00503876    jne         0050391C
 0050387C    mov         eax,dword ptr [ebp+8]
 0050387F    mov         eax,dword ptr [eax-8]
 00503882    mov         si,0FFC7
 00503886    call        @CallDynaInst
 0050388B    test        al,al
>0050388D    je          00503892
 0050388F    dec         edi
>00503890    jne         005038C9
 00503892    push        7F
 00503894    mov         eax,dword ptr [ebp+8]
 00503897    push        eax
 00503898    call        Max
 0050389D    pop         ecx
 0050389E    mov         ebx,eax
 005038A0    mov         eax,dword ptr [ebp+8]
 005038A3    push        eax
 005038A4    call        Min
 005038A9    pop         ecx
 005038AA    sub         ebx,eax
 005038AC    push        ebx
 005038AD    mov         eax,dword ptr [ebp+8]
 005038B0    mov         eax,dword ptr [eax+0C]
 005038B3    push        eax
 005038B4    call        kernel32.MulDiv
 005038B9    mov         ebx,eax
 005038BB    mov         eax,dword ptr [ebp+8]
 005038BE    push        eax
 005038BF    call        Min
 005038C4    pop         ecx
 005038C5    add         ebx,eax
>005038C7    jmp         0050391C
 005038C9    push        7F
 005038CB    mov         eax,dword ptr [ebp+8]
 005038CE    push        eax
 005038CF    call        Max
 005038D4    pop         ecx
 005038D5    mov         ebx,eax
 005038D7    mov         eax,dword ptr [ebp+8]
 005038DA    push        eax
 005038DB    call        Min
 005038E0    pop         ecx
 005038E1    sub         ebx,eax
 005038E3    push        ebx
 005038E4    mov         eax,dword ptr [ebp+8]
 005038E7    mov         eax,dword ptr [eax+0C]
 005038EA    push        eax
 005038EB    call        kernel32.MulDiv
 005038F0    push        eax
 005038F1    mov         eax,dword ptr [ebp+8]
 005038F4    push        eax
 005038F5    call        Max
 005038FA    pop         ecx
 005038FB    mov         ebx,eax
 005038FD    pop         eax
 005038FE    sub         ebx,eax
>00503900    jmp         0050391C
 00503902    mov         eax,dword ptr [ebp+8]
 00503905    push        eax
 00503906    call        Max
 0050390B    pop         ecx
 0050390C    mov         ebx,eax
>0050390E    jmp         0050391C
 00503910    mov         eax,dword ptr [ebp+8]
 00503913    push        eax
 00503914    call        Min
 00503919    pop         ecx
 0050391A    mov         ebx,eax
 0050391C    mov         eax,ebx
 0050391E    pop         edi
 0050391F    pop         esi
 00503920    pop         ebx
 00503921    pop         ebp
 00503922    ret
*}
end;

//00503924
procedure ModifyPixelScrollBar(Code:Cardinal; Pos:Cardinal);
begin
{*
 00503924    push        ebp
 00503925    mov         ebp,esp
 00503927    add         esp,0FFFFFFE8
 0050392A    push        ebx
 0050392B    push        esi
 0050392C    push        edi
 0050392D    mov         dword ptr [ebp-4],edx
 00503930    mov         esi,eax
 00503932    mov         eax,dword ptr [ebp+8]
 00503935    mov         eax,dword ptr [eax-8]
 00503938    mov         ebx,dword ptr [eax+2F8]
 0050393E    mov         eax,dword ptr [ebp+8]
 00503941    mov         edx,dword ptr [eax-54]
 00503944    mov         eax,dword ptr [ebp+8]
 00503947    mov         eax,dword ptr [eax-8]
 0050394A    call        TCustomGrid.GetColWidths
 0050394F    mov         dword ptr [ebp-8],eax
 00503952    mov         eax,dword ptr [ebp+8]
 00503955    mov         eax,dword ptr [eax-8]
 00503958    call        TControl.GetClientWidth
 0050395D    mov         edi,eax
 0050395F    mov         eax,dword ptr [ebp+8]
 00503962    sub         edi,dword ptr [eax-6C]
 00503965    mov         eax,esi
 00503967    cmp         eax,7
>0050396A    ja          00503A35
 00503970    jmp         dword ptr [eax*4+503977]
 00503970    dd          00503997
 00503970    dd          005039B7
 00503970    dd          005039D7
 00503970    dd          005039E3
 00503970    dd          005039EF
 00503970    dd          005039EF
 00503970    dd          00503A30
 00503970    dd          00503A2C
 00503997    mov         eax,dword ptr [ebp+8]
 0050399A    mov         eax,dword ptr [eax-8]
 0050399D    mov         eax,dword ptr [eax+270]
 005039A3    mov         edx,503AD0;'0'
 005039A8    call        TCustomCanvas.TextWidth
 005039AD    mov         edx,dword ptr [ebp+8]
 005039B0    imul        dword ptr [edx-78]
 005039B3    sub         ebx,eax
>005039B5    jmp         00503A35
 005039B7    mov         eax,dword ptr [ebp+8]
 005039BA    mov         eax,dword ptr [eax-8]
 005039BD    mov         eax,dword ptr [eax+270]
 005039C3    mov         edx,503AD0;'0'
 005039C8    call        TCustomCanvas.TextWidth
 005039CD    mov         edx,dword ptr [ebp+8]
 005039D0    imul        dword ptr [edx-78]
 005039D3    add         ebx,eax
>005039D5    jmp         00503A35
 005039D7    mov         eax,dword ptr [ebp+8]
 005039DA    mov         eax,dword ptr [eax-78]
 005039DD    imul        edi
 005039DF    sub         ebx,eax
>005039E1    jmp         00503A35
 005039E3    mov         eax,dword ptr [ebp+8]
 005039E6    mov         eax,dword ptr [eax-78]
 005039E9    imul        edi
 005039EB    add         ebx,eax
>005039ED    jmp         00503A35
 005039EF    mov         eax,dword ptr [ebp+8]
 005039F2    mov         eax,dword ptr [eax-8]
 005039F5    test        byte ptr [eax+2B5],40
>005039FC    jne         00503A03
 005039FE    cmp         esi,4
>00503A01    jne         00503A35
 00503A03    mov         eax,dword ptr [ebp+8]
 00503A06    mov         eax,dword ptr [eax-8]
 00503A09    mov         si,0FFC7
 00503A0D    call        @CallDynaInst
 00503A12    test        al,al
>00503A14    jne         00503A1B
 00503A16    mov         ebx,dword ptr [ebp-4]
>00503A19    jmp         00503A35
 00503A1B    mov         eax,dword ptr [ebp+8]
 00503A1E    push        eax
 00503A1F    call        Max
 00503A24    pop         ecx
 00503A25    mov         ebx,eax
 00503A27    sub         ebx,dword ptr [ebp-4]
>00503A2A    jmp         00503A35
 00503A2C    xor         ebx,ebx
>00503A2E    jmp         00503A35
 00503A30    mov         ebx,dword ptr [ebp-8]
 00503A33    sub         ebx,edi
 00503A35    test        ebx,ebx
>00503A37    jge         00503A3D
 00503A39    xor         ebx,ebx
>00503A3B    jmp         00503A48
 00503A3D    mov         eax,dword ptr [ebp-8]
 00503A40    sub         eax,edi
 00503A42    cmp         ebx,eax
>00503A44    jl          00503A48
 00503A46    mov         ebx,eax
 00503A48    mov         eax,dword ptr [ebp+8]
 00503A4B    mov         eax,dword ptr [eax-8]
 00503A4E    mov         eax,dword ptr [eax+2F8]
 00503A54    cmp         ebx,eax
>00503A56    je          00503ABD
 00503A58    mov         edx,dword ptr [ebp+8]
 00503A5B    mov         edx,dword ptr [ebp+8]
 00503A5E    mov         edx,dword ptr [edx-8]
 00503A61    mov         dword ptr [edx+2F8],ebx
 00503A67    mov         edx,eax
 00503A69    sub         edx,ebx
 00503A6B    mov         eax,dword ptr [ebp+8]
 00503A6E    mov         eax,dword ptr [eax-8]
 00503A71    xor         ecx,ecx
 00503A73    call        TCustomGrid.ScrollData
 00503A78    lea         eax,[ebp-18]
 00503A7B    xor         ecx,ecx
 00503A7D    mov         edx,10
 00503A82    call        @FillChar
 00503A87    mov         eax,dword ptr [ebp+8]
 00503A8A    mov         eax,dword ptr [eax-8]
 00503A8D    mov         eax,dword ptr [eax+2A0]
 00503A93    mov         dword ptr [ebp-0C],eax
 00503A96    mov         eax,dword ptr [ebp+8]
 00503A99    mov         eax,dword ptr [eax-8]
 00503A9C    lea         edx,[ebp-18]
 00503A9F    call        TCustomGrid.InvalidateRect
 00503AA4    mov         eax,dword ptr [ebp+8]
 00503AA7    mov         eax,dword ptr [eax-8]
 00503AAA    mov         edx,dword ptr [eax]
 00503AAC    call        dword ptr [edx+9C]
 00503AB2    mov         eax,dword ptr [ebp+8]
 00503AB5    mov         eax,dword ptr [eax-8]
 00503AB8    call        TCustomGrid.UpdateScrollPos
 00503ABD    pop         edi
 00503ABE    pop         esi
 00503ABF    pop         ebx
 00503AC0    mov         esp,ebp
 00503AC2    pop         ebp
 00503AC3    ret
*}
end;

//00503AD4
procedure TCustomGrid.ModifyScrollBar(ScrollBar:Cardinal; ScrollCode:Cardinal; Pos:Cardinal; UseRightToLeft:Boolean);
begin
{*
 00503AD4    push        ebp
 00503AD5    mov         ebp,esp
 00503AD7    add         esp,0FFFFFF78
 00503ADD    push        ebx
 00503ADE    push        esi
 00503ADF    push        edi
 00503AE0    mov         dword ptr [ebp-74],ecx
 00503AE3    mov         dword ptr [ebp-4],edx
 00503AE6    mov         dword ptr [ebp-8],eax
 00503AE9    lea         edi,[ebp-80]
 00503AEC    mov         eax,dword ptr [ebp-8]
 00503AEF    mov         si,0FFC7
 00503AF3    call        @CallDynaInst
 00503AF8    test        al,al
>00503AFA    je          00503B02
 00503AFC    cmp         byte ptr [ebp+8],0
>00503B00    jne         00503B0B
 00503B02    mov         dword ptr [ebp-78],1
>00503B09    jmp         00503B12
 00503B0B    mov         dword ptr [ebp-78],0FFFFFFFF
 00503B12    mov         eax,dword ptr [ebp-8]
 00503B15    cmp         byte ptr [eax+59],0
>00503B19    je          00503B4B
 00503B1B    mov         eax,dword ptr [ebp-8]
 00503B1E    mov         si,0FFB6
 00503B22    call        @CallDynaInst
 00503B27    test        al,al
>00503B29    je          00503B4B
 00503B2B    mov         eax,dword ptr [ebp-8]
 00503B2E    cmp         byte ptr [eax+1E8],0
>00503B35    je          00503B4B
 00503B37    mov         eax,dword ptr [ebp-8]
 00503B3A    test        byte ptr [eax+1C],10
>00503B3E    jne         00503B4B
 00503B40    mov         eax,dword ptr [ebp-8]
 00503B43    mov         edx,dword ptr [eax]
 00503B45    call        dword ptr [edx+0E8]
 00503B4B    lea         edx,[ebp-70]
 00503B4E    mov         eax,dword ptr [ebp-8]
 00503B51    call        TCustomGrid.CalcDrawInfo
 00503B56    cmp         dword ptr [ebp-4],0
>00503B5A    jne         00503B7A
 00503B5C    mov         eax,dword ptr [ebp-8]
 00503B5F    cmp         dword ptr [eax+284],1
>00503B66    jne         00503B7A
 00503B68    push        ebp
 00503B69    mov         edx,dword ptr [ebp+0C]
 00503B6C    mov         eax,dword ptr [ebp-74]
 00503B6F    call        ModifyPixelScrollBar
 00503B74    pop         ecx
>00503B75    jmp         00503CB0
 00503B7A    mov         eax,dword ptr [ebp-8]
 00503B7D    mov         eax,dword ptr [eax+284]
 00503B83    dec         eax
 00503B84    mov         dword ptr [ebp-10],eax
 00503B87    mov         eax,dword ptr [ebp-8]
 00503B8A    mov         eax,dword ptr [eax+2C0]
 00503B90    dec         eax
 00503B91    mov         dword ptr [ebp-0C],eax
 00503B94    lea         eax,[ebp-88]
 00503B9A    push        eax
 00503B9B    lea         ecx,[ebp-70]
 00503B9E    lea         edx,[ebp-10]
 00503BA1    mov         eax,dword ptr [ebp-8]
 00503BA4    call        TCustomGrid.CalcMaxTopLeft
 00503BA9    mov         eax,dword ptr [ebp-88]
 00503BAF    mov         dword ptr [ebp-10],eax
 00503BB2    mov         eax,dword ptr [ebp-84]
 00503BB8    mov         dword ptr [ebp-0C],eax
 00503BBB    mov         eax,dword ptr [ebp-8]
 00503BBE    mov         edx,dword ptr [eax+2C8]
 00503BC4    mov         dword ptr [edi],edx
 00503BC6    mov         edx,dword ptr [eax+2CC]
 00503BCC    mov         dword ptr [edi+4],edx
 00503BCF    cmp         dword ptr [ebp-4],0
>00503BD3    jne         00503C0F
 00503BD5    mov         esi,dword ptr [edi]
 00503BD7    mov         ebx,esi
 00503BD9    push        ebp
 00503BDA    mov         edx,dword ptr [ebp-78]
 00503BDD    mov         eax,esi
 00503BDF    call        CalcScrollBar
 00503BE4    pop         ecx
 00503BE5    mov         dword ptr [edi],eax
 00503BE7    mov         eax,dword ptr [ebp-8]
 00503BEA    mov         eax,dword ptr [eax+29C]
 00503BF0    mov         esi,dword ptr [edi]
 00503BF2    cmp         eax,esi
>00503BF4    jge         00503C4C
 00503BF6    cmp         esi,dword ptr [ebp-10]
>00503BF9    jge         00503C4C
 00503BFB    mov         edx,esi
 00503BFD    mov         eax,dword ptr [ebp-8]
 00503C00    call        TCustomGrid.GetColWidths
 00503C05    test        eax,eax
>00503C07    jg          00503C4C
 00503C09    cmp         esi,ebx
>00503C0B    jne         00503BD5
>00503C0D    jmp         00503C4C
 00503C0F    mov         esi,dword ptr [edi+4]
 00503C12    mov         ebx,esi
 00503C14    push        ebp
 00503C15    mov         edx,1
 00503C1A    mov         eax,esi
 00503C1C    call        CalcScrollBar
 00503C21    pop         ecx
 00503C22    mov         dword ptr [edi+4],eax
 00503C25    mov         eax,dword ptr [ebp-8]
 00503C28    mov         eax,dword ptr [eax+2A0]
 00503C2E    mov         esi,dword ptr [edi+4]
 00503C31    cmp         eax,esi
>00503C33    jge         00503C4C
 00503C35    cmp         esi,dword ptr [ebp-0C]
>00503C38    jge         00503C4C
 00503C3A    mov         edx,esi
 00503C3C    mov         eax,dword ptr [ebp-8]
 00503C3F    call        TCustomGrid.GetRowHeights
 00503C44    test        eax,eax
>00503C46    jg          00503C4C
 00503C48    cmp         esi,ebx
>00503C4A    jne         00503C0F
 00503C4C    mov         edx,dword ptr [edi]
 00503C4E    mov         eax,dword ptr [ebp-10]
 00503C51    cmp         edx,eax
>00503C53    jg          00503C57
 00503C55    mov         eax,edx
 00503C57    mov         edx,dword ptr [ebp-8]
 00503C5A    mov         edx,dword ptr [edx+29C]
 00503C60    cmp         eax,edx
>00503C62    jge         00503C66
 00503C64    mov         eax,edx
 00503C66    mov         dword ptr [edi],eax
 00503C68    mov         edx,dword ptr [edi+4]
 00503C6B    mov         eax,dword ptr [ebp-0C]
 00503C6E    cmp         edx,eax
>00503C70    jg          00503C74
 00503C72    mov         eax,edx
 00503C74    mov         edx,dword ptr [ebp-8]
 00503C77    mov         edx,dword ptr [edx+2A0]
 00503C7D    cmp         eax,edx
>00503C7F    jge         00503C83
 00503C81    mov         eax,edx
 00503C83    mov         dword ptr [edi+4],eax
 00503C86    mov         edx,dword ptr [ebp-8]
 00503C89    mov         edx,dword ptr [edx+2C8]
 00503C8F    mov         eax,dword ptr [edi]
 00503C91    cmp         edx,eax
>00503C93    jne         00503CA3
 00503C95    mov         edx,dword ptr [ebp-8]
 00503C98    mov         edx,dword ptr [edx+2CC]
 00503C9E    cmp         edx,dword ptr [edi+4]
>00503CA1    je          00503CB0
 00503CA3    mov         ecx,dword ptr [edi+4]
 00503CA6    mov         edx,eax
 00503CA8    mov         eax,dword ptr [ebp-8]
 00503CAB    call        TCustomGrid.MoveTopLeft
 00503CB0    pop         edi
 00503CB1    pop         esi
 00503CB2    pop         ebx
 00503CB3    mov         esp,ebp
 00503CB5    pop         ebp
 00503CB6    ret         8
*}
end;

//00503CBC
procedure TCustomGrid.MoveAdjust(var CellPos:LongInt; FromIndex:LongInt; ToIndex:LongInt);
begin
{*
 00503CBC    push        ebp
 00503CBD    mov         ebp,esp
 00503CBF    push        esi
 00503CC0    push        edi
 00503CC1    mov         eax,dword ptr [ebp+8]
 00503CC4    cmp         ecx,dword ptr [edx]
>00503CC6    jne         00503CCC
 00503CC8    mov         dword ptr [edx],eax
>00503CCA    jmp         00503CEA
 00503CCC    mov         esi,ecx
 00503CCE    mov         edi,eax
 00503CD0    cmp         eax,ecx
>00503CD2    jge         00503CD8
 00503CD4    mov         esi,eax
 00503CD6    mov         edi,ecx
 00503CD8    cmp         esi,dword ptr [edx]
>00503CDA    jg          00503CEA
 00503CDC    cmp         edi,dword ptr [edx]
>00503CDE    jl          00503CEA
 00503CE0    cmp         eax,ecx
>00503CE2    jge         00503CE8
 00503CE4    inc         dword ptr [edx]
>00503CE6    jmp         00503CEA
 00503CE8    dec         dword ptr [edx]
 00503CEA    pop         edi
 00503CEB    pop         esi
 00503CEC    pop         ebp
 00503CED    ret         4
*}
end;

//00503CF0
procedure TCustomGrid.MoveAnchor(const NewAnchor:TGridCoord);
begin
{*
 00503CF0    push        ebx
 00503CF1    push        esi
 00503CF2    add         esp,0FFFFFFF0
 00503CF5    mov         esi,edx
 00503CF7    mov         ebx,eax
 00503CF9    mov         eax,dword ptr [ebx+2B4]
 00503CFF    and         eax,dword ptr ds:[503D6C]
 00503D05    mov         edx,dword ptr ds:[503D70]
 00503D0B    cmp         edx,eax
>00503D0D    jne         00503D53
 00503D0F    mov         edx,esp
 00503D11    mov         eax,ebx
 00503D13    call        TCustomGrid.GetSelection
 00503D18    mov         eax,dword ptr [esi]
 00503D1A    mov         dword ptr [ebx+278],eax
 00503D20    mov         eax,dword ptr [esi+4]
 00503D23    mov         dword ptr [ebx+27C],eax
 00503D29    test        byte ptr [ebx+2B5],10
>00503D30    je          00503D3F
 00503D32    mov         eax,dword ptr [ebx+284]
 00503D38    dec         eax
 00503D39    mov         dword ptr [ebx+278],eax
 00503D3F    mov         edx,esi
 00503D41    mov         eax,ebx
 00503D43    call        TCustomGrid.ClampInView
 00503D48    mov         edx,esp
 00503D4A    mov         eax,ebx
 00503D4C    call        TCustomGrid.SelectionMoved
>00503D51    jmp         00503D63
 00503D53    push        1
 00503D55    push        1
 00503D57    mov         ecx,dword ptr [esi+4]
 00503D5A    mov         edx,dword ptr [esi]
 00503D5C    mov         eax,ebx
 00503D5E    call        TCustomGrid.MoveCurrent
 00503D63    add         esp,10
 00503D66    pop         esi
 00503D67    pop         ebx
 00503D68    ret
*}
end;

//00503D74
procedure TCustomGrid.MoveCurrent(ACol:LongInt; ARow:LongInt; MoveAnchor:Boolean; Show:Boolean);
begin
{*
 00503D74    push        ebp
 00503D75    mov         ebp,esp
 00503D77    add         esp,0FFFFFFE0
 00503D7A    push        ebx
 00503D7B    push        esi
 00503D7C    push        edi
 00503D7D    xor         ebx,ebx
 00503D7F    mov         dword ptr [ebp-20],ebx
 00503D82    mov         dword ptr [ebp-4],ecx
 00503D85    mov         esi,edx
 00503D87    mov         ebx,eax
 00503D89    xor         eax,eax
 00503D8B    push        ebp
 00503D8C    push        503EB9
 00503D91    push        dword ptr fs:[eax]
 00503D94    mov         dword ptr fs:[eax],esp
 00503D97    test        esi,esi
>00503D99    jl          00503DB4
 00503D9B    cmp         dword ptr [ebp-4],0
>00503D9F    jl          00503DB4
 00503DA1    cmp         esi,dword ptr [ebx+284]
>00503DA7    jge         00503DB4
 00503DA9    mov         eax,dword ptr [ebp-4]
 00503DAC    cmp         eax,dword ptr [ebx+2C0]
>00503DB2    jl          00503DC9
 00503DB4    lea         edx,[ebp-20]
 00503DB7    mov         eax,[0078D63C];^SResString239:TResStringRec
 00503DBC    call        LoadResString
 00503DC1    mov         eax,dword ptr [ebp-20]
 00503DC4    call        InvalidOp
 00503DC9    mov         ecx,dword ptr [ebp-4]
 00503DCC    mov         edx,esi
 00503DCE    mov         eax,ebx
 00503DD0    mov         edi,dword ptr [eax]
 00503DD2    call        dword ptr [edi+108]
 00503DD8    test        al,al
>00503DDA    je          00503EA3
 00503DE0    lea         edx,[ebp-1C]
 00503DE3    mov         eax,ebx
 00503DE5    call        TCustomGrid.GetSelection
 00503DEA    mov         eax,dword ptr [ebx+288]
 00503DF0    mov         dword ptr [ebp-0C],eax
 00503DF3    mov         eax,dword ptr [ebx+28C]
 00503DF9    mov         dword ptr [ebp-8],eax
 00503DFC    mov         dword ptr [ebx+288],esi
 00503E02    mov         eax,dword ptr [ebp-4]
 00503E05    mov         dword ptr [ebx+28C],eax
 00503E0B    test        byte ptr [ebx+2B5],20
>00503E12    jne         00503E1B
 00503E14    mov         eax,ebx
 00503E16    call        TCustomGrid.HideEditor
 00503E1B    cmp         byte ptr [ebp+0C],0
>00503E1F    jne         00503E2A
 00503E21    test        byte ptr [ebx+2B4],10
>00503E28    jne         00503E58
 00503E2A    mov         eax,dword ptr [ebx+288]
 00503E30    mov         dword ptr [ebx+278],eax
 00503E36    mov         eax,dword ptr [ebx+28C]
 00503E3C    mov         dword ptr [ebx+27C],eax
 00503E42    test        byte ptr [ebx+2B5],10
>00503E49    je          00503E58
 00503E4B    mov         eax,dword ptr [ebx+284]
 00503E51    dec         eax
 00503E52    mov         dword ptr [ebx+278],eax
 00503E58    test        byte ptr [ebx+2B5],10
>00503E5F    je          00503E6D
 00503E61    mov         eax,dword ptr [ebx+29C]
 00503E67    mov         dword ptr [ebx+288],eax
 00503E6D    cmp         byte ptr [ebp+8],0
>00503E71    je          00503E80
 00503E73    lea         edx,[ebx+288]
 00503E79    mov         eax,ebx
 00503E7B    call        TCustomGrid.ClampInView
 00503E80    lea         edx,[ebp-1C]
 00503E83    mov         eax,ebx
 00503E85    call        TCustomGrid.SelectionMoved
 00503E8A    mov         ecx,dword ptr [ebp-8]
 00503E8D    mov         edx,dword ptr [ebp-0C]
 00503E90    mov         eax,ebx
 00503E92    call        TCustomGrid.InvalidateCell
 00503E97    mov         ecx,dword ptr [ebp-4]
 00503E9A    mov         edx,esi
 00503E9C    mov         eax,ebx
 00503E9E    call        TCustomGrid.InvalidateCell
 00503EA3    xor         eax,eax
 00503EA5    pop         edx
 00503EA6    pop         ecx
 00503EA7    pop         ecx
 00503EA8    mov         dword ptr fs:[eax],edx
 00503EAB    push        503EC0
 00503EB0    lea         eax,[ebp-20]
 00503EB3    call        @UStrClr
 00503EB8    ret
>00503EB9    jmp         @HandleFinally
>00503EBE    jmp         00503EB0
 00503EC0    pop         edi
 00503EC1    pop         esi
 00503EC2    pop         ebx
 00503EC3    mov         esp,ebp
 00503EC5    pop         ebp
 00503EC6    ret         8
*}
end;

//00503ECC
procedure TCustomGrid.MoveTopLeft(ALeft:LongInt; ATop:LongInt);
begin
{*
 00503ECC    push        ebx
 00503ECD    push        esi
 00503ECE    push        edi
 00503ECF    add         esp,0FFFFFFF8
 00503ED2    mov         edi,ecx
 00503ED4    mov         esi,edx
 00503ED6    mov         ebx,eax
 00503ED8    cmp         esi,dword ptr [ebx+2C8]
>00503EDE    jne         00503EE8
 00503EE0    cmp         edi,dword ptr [ebx+2CC]
>00503EE6    je          00503F1A
 00503EE8    mov         eax,ebx
 00503EEA    mov         edx,dword ptr [eax]
 00503EEC    call        dword ptr [edx+9C]
 00503EF2    mov         eax,dword ptr [ebx+2C8]
 00503EF8    mov         dword ptr [esp],eax
 00503EFB    mov         eax,dword ptr [ebx+2CC]
 00503F01    mov         dword ptr [esp+4],eax
 00503F05    mov         dword ptr [ebx+2C8],esi
 00503F0B    mov         dword ptr [ebx+2CC],edi
 00503F11    mov         edx,esp
 00503F13    mov         eax,ebx
 00503F15    call        TCustomGrid.TopLeftMoved
 00503F1A    pop         ecx
 00503F1B    pop         edx
 00503F1C    pop         edi
 00503F1D    pop         esi
 00503F1E    pop         ebx
 00503F1F    ret
*}
end;

//00503F20
procedure TCustomGrid.ResizeCol(Index:LongInt; OldSize:Integer; NewSize:Integer);
begin
{*
 00503F20    push        ebp
 00503F21    mov         ebp,esp
 00503F23    mov         edx,dword ptr [eax]
 00503F25    call        dword ptr [edx+90]
 00503F2B    pop         ebp
 00503F2C    ret         4
*}
end;

//00503F30
procedure TCustomGrid.ResizeRow(Index:LongInt; OldSize:Integer; NewSize:Integer);
begin
{*
 00503F30    push        ebp
 00503F31    mov         ebp,esp
 00503F33    mov         edx,dword ptr [eax]
 00503F35    call        dword ptr [edx+90]
 00503F3B    pop         ebp
 00503F3C    ret         4
*}
end;

//00503F40
procedure TCustomGrid.SelectionMoved(const OldSel:TGridRect);
begin
{*
 00503F40    push        ebx
 00503F41    push        esi
 00503F42    push        edi
 00503F43    add         esp,0FFFFFF90
 00503F46    mov         ebx,edx
 00503F48    mov         edi,eax
 00503F4A    mov         eax,edi
 00503F4C    call        TWinControl.HandleAllocated
 00503F51    test        al,al
>00503F53    je          00503FAE
 00503F55    push        1
 00503F57    lea         ecx,[esp+4]
 00503F5B    mov         edx,ebx
 00503F5D    mov         eax,edi
 00503F5F    call        TCustomGrid.GridRectToScreenRect
 00503F64    push        1
 00503F66    lea         edx,[esp+64]
 00503F6A    mov         eax,edi
 00503F6C    call        TCustomGrid.GetSelection
 00503F71    lea         edx,[esp+64]
 00503F75    lea         ecx,[esp+14]
 00503F79    mov         eax,edi
 00503F7B    call        TCustomGrid.GridRectToScreenRect
 00503F80    lea         ecx,[esp+20]
 00503F84    lea         edx,[esp+10]
 00503F88    mov         eax,esp
 00503F8A    call        XorRects
 00503F8F    mov         esi,4
 00503F94    lea         ebx,[esp+20]
 00503F98    push        0
 00503F9A    push        ebx
 00503F9B    mov         eax,edi
 00503F9D    call        TWinControl.GetHandle
 00503FA2    push        eax
 00503FA3    call        user32.InvalidateRect
 00503FA8    add         ebx,10
 00503FAB    dec         esi
>00503FAC    jne         00503F98
 00503FAE    add         esp,70
 00503FB1    pop         edi
 00503FB2    pop         esi
 00503FB3    pop         ebx
 00503FB4    ret
*}
end;

//00503FB8
procedure TCustomGrid.ScrollDataInfo(DX:Integer; DY:Integer; var DrawInfo:TGridDrawInfo);
begin
{*
 00503FB8    push        ebp
 00503FB9    mov         ebp,esp
 00503FBB    add         esp,0FFFFFFD8
 00503FBE    push        ebx
 00503FBF    push        esi
 00503FC0    push        edi
 00503FC1    mov         esi,ecx
 00503FC3    mov         dword ptr [ebp-4],edx
 00503FC6    mov         ebx,eax
 00503FC8    mov         edi,dword ptr [ebp+8]
 00503FCB    mov         dword ptr [ebp-8],2
 00503FD2    cmp         byte ptr [ebx+2FC],0
>00503FD9    jne         00503FDF
 00503FDB    or          dword ptr [ebp-8],4
 00503FDF    test        esi,esi
>00503FE1    jne         00504059
 00503FE3    mov         eax,ebx
 00503FE5    mov         si,0FFC7
 00503FE9    call        @CallDynaInst
 00503FEE    test        al,al
>00503FF0    jne         00504009
 00503FF2    mov         eax,dword ptr [edi+3C]
 00503FF5    push        eax
 00503FF6    lea         eax,[ebp-18]
 00503FF9    push        eax
 00503FFA    mov         ecx,dword ptr [edi+0C]
 00503FFD    mov         eax,dword ptr [edi+4]
 00504000    xor         edx,edx
 00504002    call        Rect
>00504007    jmp         00504031
 00504009    mov         eax,dword ptr [edi+3C]
 0050400C    push        eax
 0050400D    lea         eax,[ebp-18]
 00504010    push        eax
 00504011    mov         eax,ebx
 00504013    call        TControl.GetClientWidth
 00504018    sub         eax,dword ptr [edi+4]
 0050401B    push        eax
 0050401C    mov         eax,ebx
 0050401E    call        TControl.GetClientWidth
 00504023    sub         eax,dword ptr [edi+0C]
 00504026    xor         edx,edx
 00504028    pop         ecx
 00504029    call        Rect
 0050402E    neg         dword ptr [ebp-4]
 00504031    mov         eax,dword ptr [ebp-8]
 00504034    push        eax
 00504035    push        0
 00504037    push        0
 00504039    lea         eax,[ebp-18]
 0050403C    push        eax
 0050403D    lea         eax,[ebp-18]
 00504040    push        eax
 00504041    push        0
 00504043    mov         eax,dword ptr [ebp-4]
 00504046    push        eax
 00504047    mov         eax,ebx
 00504049    call        TWinControl.GetHandle
 0050404E    push        eax
 0050404F    call        user32.ScrollWindowEx
>00504054    jmp         0050413E
 00504059    cmp         dword ptr [ebp-4],0
>0050405D    jne         00504099
 0050405F    mov         eax,dword ptr [edi+3C]
 00504062    push        eax
 00504063    lea         eax,[ebp-18]
 00504066    push        eax
 00504067    mov         ecx,dword ptr [edi+0C]
 0050406A    mov         edx,dword ptr [edi+34]
 0050406D    xor         eax,eax
 0050406F    call        Rect
 00504074    mov         eax,dword ptr [ebp-8]
 00504077    push        eax
 00504078    push        0
 0050407A    push        0
 0050407C    lea         eax,[ebp-18]
 0050407F    push        eax
 00504080    lea         eax,[ebp-18]
 00504083    push        eax
 00504084    push        esi
 00504085    push        0
 00504087    mov         eax,ebx
 00504089    call        TWinControl.GetHandle
 0050408E    push        eax
 0050408F    call        user32.ScrollWindowEx
>00504094    jmp         0050413E
 00504099    mov         eax,dword ptr [edi+34]
 0050409C    push        eax
 0050409D    lea         eax,[ebp-18]
 005040A0    push        eax
 005040A1    mov         ecx,dword ptr [edi+0C]
 005040A4    mov         eax,dword ptr [edi+4]
 005040A7    xor         edx,edx
 005040A9    call        Rect
 005040AE    mov         eax,dword ptr [ebp-8]
 005040B1    push        eax
 005040B2    push        0
 005040B4    push        0
 005040B6    lea         eax,[ebp-18]
 005040B9    push        eax
 005040BA    lea         eax,[ebp-18]
 005040BD    push        eax
 005040BE    push        0
 005040C0    mov         eax,dword ptr [ebp-4]
 005040C3    push        eax
 005040C4    mov         eax,ebx
 005040C6    call        TWinControl.GetHandle
 005040CB    push        eax
 005040CC    call        user32.ScrollWindowEx
 005040D1    mov         eax,dword ptr [edi+3C]
 005040D4    push        eax
 005040D5    lea         eax,[ebp-18]
 005040D8    push        eax
 005040D9    mov         ecx,dword ptr [edi+4]
 005040DC    mov         edx,dword ptr [edi+34]
 005040DF    xor         eax,eax
 005040E1    call        Rect
 005040E6    mov         eax,dword ptr [ebp-8]
 005040E9    push        eax
 005040EA    push        0
 005040EC    push        0
 005040EE    lea         eax,[ebp-18]
 005040F1    push        eax
 005040F2    lea         eax,[ebp-18]
 005040F5    push        eax
 005040F6    push        esi
 005040F7    push        0
 005040F9    mov         eax,ebx
 005040FB    call        TWinControl.GetHandle
 00504100    push        eax
 00504101    call        user32.ScrollWindowEx
 00504106    mov         eax,dword ptr [edi+3C]
 00504109    push        eax
 0050410A    lea         eax,[ebp-18]
 0050410D    push        eax
 0050410E    mov         ecx,dword ptr [edi+0C]
 00504111    mov         edx,dword ptr [edi+34]
 00504114    mov         eax,dword ptr [edi+4]
 00504117    call        Rect
 0050411C    mov         eax,dword ptr [ebp-8]
 0050411F    push        eax
 00504120    push        0
 00504122    push        0
 00504124    lea         eax,[ebp-18]
 00504127    push        eax
 00504128    lea         eax,[ebp-18]
 0050412B    push        eax
 0050412C    push        esi
 0050412D    mov         eax,dword ptr [ebp-4]
 00504130    push        eax
 00504131    mov         eax,ebx
 00504133    call        TWinControl.GetHandle
 00504138    push        eax
 00504139    call        user32.ScrollWindowEx
 0050413E    test        byte ptr [ebx+2B5],10
>00504145    je          0050415B
 00504147    lea         edx,[ebp-28]
 0050414A    mov         eax,ebx
 0050414C    call        TCustomGrid.GetSelection
 00504151    lea         edx,[ebp-28]
 00504154    mov         eax,ebx
 00504156    call        TCustomGrid.InvalidateRect
 0050415B    pop         edi
 0050415C    pop         esi
 0050415D    pop         ebx
 0050415E    mov         esp,ebp
 00504160    pop         ebp
 00504161    ret         4
*}
end;

//00504164
procedure TCustomGrid.ScrollData(DX:Integer; DY:Integer);
begin
{*
 00504164    push        ebx
 00504165    push        esi
 00504166    push        edi
 00504167    add         esp,0FFFFFFA0
 0050416A    mov         edi,ecx
 0050416C    mov         esi,edx
 0050416E    mov         ebx,eax
 00504170    mov         edx,esp
 00504172    mov         eax,ebx
 00504174    call        TCustomGrid.CalcDrawInfo
 00504179    push        esp
 0050417A    mov         ecx,edi
 0050417C    mov         edx,esi
 0050417E    mov         eax,ebx
 00504180    call        TCustomGrid.ScrollDataInfo
 00504185    add         esp,60
 00504188    pop         edi
 00504189    pop         esi
 0050418A    pop         ebx
 0050418B    ret
*}
end;

//0050418C
function CalcScroll(const AxisInfo:TGridAxisDrawInfo; OldPos:Integer; CurrentPos:Integer; var Amount:LongInt):Boolean;
begin
{*
 0050418C    push        ebp
 0050418D    mov         ebp,esp
 0050418F    add         esp,0FFFFFFEC
 00504192    push        ebx
 00504193    push        esi
 00504194    mov         dword ptr [ebp-8],ecx
 00504197    mov         dword ptr [ebp-4],edx
 0050419A    mov         ebx,eax
 0050419C    mov         esi,dword ptr [ebp+8]
 0050419F    mov         byte ptr [ebp-9],0
 005041A3    mov         eax,dword ptr [ebp-4]
 005041A6    cmp         eax,dword ptr [ebp-8]
>005041A9    jge         005041B3
 005041AB    mov         eax,dword ptr [ebp-4]
 005041AE    mov         edx,dword ptr [ebp-8]
>005041B1    jmp         005041B9
 005041B3    mov         eax,dword ptr [ebp-8]
 005041B6    mov         edx,dword ptr [ebp-4]
 005041B9    xor         ecx,ecx
 005041BB    mov         dword ptr [esi],ecx
 005041BD    dec         edx
 005041BE    sub         edx,eax
>005041C0    jl          005041F8
 005041C2    inc         edx
 005041C3    mov         dword ptr [ebp-14],edx
 005041C6    mov         dword ptr [ebp-10],eax
 005041C9    mov         edx,dword ptr [ebp-10]
 005041CC    mov         eax,dword ptr [ebx+2C]
 005041CF    call        dword ptr [ebx+28]
 005041D2    add         eax,dword ptr [ebx]
 005041D4    add         dword ptr [esi],eax
 005041D6    mov         eax,dword ptr [ebx+8]
 005041D9    sub         eax,dword ptr [ebx+4]
 005041DC    cmp         eax,dword ptr [esi]
>005041DE    jge         005041F0
 005041E0    mov         eax,dword ptr [ebp+0C]
 005041E3    mov         eax,dword ptr [eax-4]
 005041E6    mov         edx,dword ptr [eax]
 005041E8    call        dword ptr [edx+90]
>005041EE    jmp         00504206
 005041F0    inc         dword ptr [ebp-10]
 005041F3    dec         dword ptr [ebp-14]
>005041F6    jne         005041C9
 005041F8    mov         eax,dword ptr [ebp-4]
 005041FB    cmp         eax,dword ptr [ebp-8]
>005041FE    jge         00504202
 00504200    neg         dword ptr [esi]
 00504202    mov         byte ptr [ebp-9],1
 00504206    movzx       eax,byte ptr [ebp-9]
 0050420A    pop         esi
 0050420B    pop         ebx
 0050420C    mov         esp,ebp
 0050420E    pop         ebp
 0050420F    ret         4
*}
end;

//00504214
procedure TCustomGrid.TopLeftMoved(const OldTopLeft:TGridCoord);
begin
{*
 00504214    push        ebp
 00504215    mov         ebp,esp
 00504217    add         esp,0FFFFFF90
 0050421A    push        ebx
 0050421B    push        esi
 0050421C    mov         ebx,edx
 0050421E    mov         dword ptr [ebp-4],eax
 00504221    mov         eax,dword ptr [ebp-4]
 00504224    call        TCustomGrid.UpdateScrollPos
 00504229    lea         edx,[ebp-70]
 0050422C    mov         eax,dword ptr [ebp-4]
 0050422F    call        TCustomGrid.CalcDrawInfo
 00504234    push        ebp
 00504235    lea         eax,[ebp-0C]
 00504238    push        eax
 00504239    mov         eax,dword ptr [ebp-4]
 0050423C    mov         ecx,dword ptr [eax+2C8]
 00504242    mov         edx,dword ptr [ebx]
 00504244    lea         eax,[ebp-70]
 00504247    call        CalcScroll
 0050424C    pop         ecx
 0050424D    test        al,al
>0050424F    je          00504281
 00504251    push        ebp
 00504252    lea         eax,[ebp-8]
 00504255    push        eax
 00504256    mov         eax,dword ptr [ebp-4]
 00504259    mov         ecx,dword ptr [eax+2CC]
 0050425F    mov         edx,dword ptr [ebx+4]
 00504262    lea         eax,[ebp-40]
 00504265    call        CalcScroll
 0050426A    pop         ecx
 0050426B    test        al,al
>0050426D    je          00504281
 0050426F    lea         eax,[ebp-70]
 00504272    push        eax
 00504273    mov         ecx,dword ptr [ebp-8]
 00504276    mov         edx,dword ptr [ebp-0C]
 00504279    mov         eax,dword ptr [ebp-4]
 0050427C    call        TCustomGrid.ScrollDataInfo
 00504281    mov         eax,dword ptr [ebp-4]
 00504284    mov         si,0FFA2
 00504288    call        @CallDynaInst
 0050428D    pop         esi
 0050428E    pop         ebx
 0050428F    mov         esp,ebp
 00504291    pop         ebp
 00504292    ret
*}
end;

//00504294
procedure SetScroll(Code:Word; Value:Integer);
begin
{*
 00504294    push        ebp
 00504295    mov         ebp,esp
 00504297    push        ebx
 00504298    push        esi
 00504299    push        edi
 0050429A    mov         ebx,edx
 0050429C    mov         edi,eax
 0050429E    mov         eax,dword ptr [ebp+8]
 005042A1    mov         eax,dword ptr [eax-4]
 005042A4    mov         si,0FFC7
 005042A8    call        @CallDynaInst
 005042AD    test        al,al
>005042AF    je          005042E0
 005042B1    test        di,di
>005042B4    jne         005042E0
 005042B6    mov         eax,dword ptr [ebp+8]
 005042B9    mov         eax,dword ptr [eax-4]
 005042BC    cmp         dword ptr [eax+284],1
>005042C3    je          005042D0
 005042C5    mov         eax,7F
 005042CA    sub         eax,ebx
 005042CC    mov         ebx,eax
>005042CE    jmp         005042E0
 005042D0    mov         eax,dword ptr [ebp+8]
 005042D3    mov         eax,dword ptr [eax-8]
 005042D6    mov         edx,dword ptr [ebp+8]
 005042D9    sub         eax,dword ptr [edx-0C]
 005042DC    sub         eax,ebx
 005042DE    mov         ebx,eax
 005042E0    movzx       esi,di
 005042E3    push        esi
 005042E4    mov         eax,dword ptr [ebp+8]
 005042E7    mov         eax,dword ptr [eax-4]
 005042EA    call        TWinControl.GetHandle
 005042EF    push        eax
 005042F0    call        user32.GetScrollPos
 005042F5    cmp         ebx,eax
>005042F7    je          0050430E
 005042F9    push        0FF
 005042FB    push        ebx
 005042FC    push        esi
 005042FD    mov         eax,dword ptr [ebp+8]
 00504300    mov         eax,dword ptr [eax-4]
 00504303    call        TWinControl.GetHandle
 00504308    push        eax
 00504309    call        user32.SetScrollPos
 0050430E    pop         edi
 0050430F    pop         esi
 00504310    pop         ebx
 00504311    pop         ebp
 00504312    ret
*}
end;

//00504314
procedure TCustomGrid.UpdateScrollPos;
begin
{*
 00504314    push        ebp
 00504315    mov         ebp,esp
 00504317    add         esp,0FFFFFF80
 0050431A    push        ebx
 0050431B    push        esi
 0050431C    mov         dword ptr [ebp-4],eax
 0050431F    lea         esi,[ebp-4]
 00504322    mov         eax,dword ptr [esi]
 00504324    call        TWinControl.HandleAllocated
 00504329    test        al,al
>0050432B    je          0050445C
 00504331    mov         eax,dword ptr [esi]
 00504333    cmp         byte ptr [eax+2C4],0
>0050433A    je          0050445C
 00504340    lea         edx,[ebp-78]
 00504343    mov         eax,dword ptr [esi]
 00504345    call        TCustomGrid.CalcDrawInfo
 0050434A    mov         eax,dword ptr [esi]
 0050434C    mov         eax,dword ptr [eax+284]
 00504352    dec         eax
 00504353    mov         dword ptr [ebp-14],eax
 00504356    mov         eax,dword ptr [esi]
 00504358    mov         eax,dword ptr [eax+2C0]
 0050435E    dec         eax
 0050435F    mov         dword ptr [ebp-10],eax
 00504362    lea         eax,[ebp-80]
 00504365    push        eax
 00504366    lea         ecx,[ebp-78]
 00504369    lea         edx,[ebp-14]
 0050436C    mov         eax,dword ptr [esi]
 0050436E    call        TCustomGrid.CalcMaxTopLeft
 00504373    mov         eax,dword ptr [ebp-80]
 00504376    mov         dword ptr [ebp-14],eax
 00504379    mov         eax,dword ptr [ebp-7C]
 0050437C    mov         dword ptr [ebp-10],eax
 0050437F    mov         eax,dword ptr [esi]
 00504381    movzx       eax,byte ptr [eax+2C4]
 00504388    sub         al,1
>0050438A    je          00504394
 0050438C    sub         al,2
>0050438E    jne         00504420
 00504394    mov         eax,dword ptr [esi]
 00504396    cmp         dword ptr [eax+284],1
>0050439D    jne         005043F5
 0050439F    mov         edx,dword ptr [ebp-5C]
 005043A2    mov         eax,dword ptr [esi]
 005043A4    call        TCustomGrid.GetColWidths
 005043A9    mov         dword ptr [ebp-8],eax
 005043AC    mov         eax,dword ptr [esi]
 005043AE    call        TControl.GetClientWidth
 005043B3    sub         eax,dword ptr [ebp-74]
 005043B6    mov         dword ptr [ebp-0C],eax
 005043B9    mov         eax,dword ptr [esi]
 005043BB    mov         eax,dword ptr [eax+2F8]
 005043C1    test        eax,eax
>005043C3    jle         005043E8
 005043C5    mov         edx,dword ptr [ebp-8]
 005043C8    sub         edx,eax
 005043CA    cmp         edx,dword ptr [ebp-0C]
>005043CD    jge         005043E8
 005043CF    mov         eax,dword ptr [ebp-8]
 005043D2    sub         eax,dword ptr [ebp-0C]
 005043D5    push        eax
 005043D6    push        1
 005043D8    mov         ecx,4
 005043DD    xor         edx,edx
 005043DF    mov         eax,dword ptr [esi]
 005043E1    call        TCustomGrid.ModifyScrollBar
>005043E6    jmp         00504420
 005043E8    push        ebp
 005043E9    mov         edx,eax
 005043EB    xor         eax,eax
 005043ED    call        SetScroll
 005043F2    pop         ecx
>005043F3    jmp         00504420
 005043F5    push        ebp
 005043F6    mov         eax,dword ptr [esi]
 005043F8    mov         ebx,dword ptr [eax+29C]
 005043FE    mov         eax,dword ptr [ebp-14]
 00504401    sub         eax,ebx
 00504403    push        eax
 00504404    push        7F
 00504406    mov         eax,dword ptr [esi]
 00504408    mov         eax,dword ptr [eax+2C8]
 0050440E    sub         eax,ebx
 00504410    push        eax
 00504411    call        kernel32.MulDiv
 00504416    mov         edx,eax
 00504418    xor         eax,eax
 0050441A    call        SetScroll
 0050441F    pop         ecx
 00504420    mov         eax,dword ptr [esi]
 00504422    movzx       eax,byte ptr [eax+2C4]
 00504429    add         al,0FE
 0050442B    sub         al,2
>0050442D    jae         0050445C
 0050442F    push        ebp
 00504430    mov         eax,dword ptr [esi]
 00504432    mov         ebx,dword ptr [eax+2A0]
 00504438    mov         eax,dword ptr [ebp-10]
 0050443B    sub         eax,ebx
 0050443D    push        eax
 0050443E    push        7F
 00504440    mov         eax,dword ptr [esi]
 00504442    mov         eax,dword ptr [eax+2CC]
 00504448    sub         eax,ebx
 0050444A    push        eax
 0050444B    call        kernel32.MulDiv
 00504450    mov         edx,eax
 00504452    mov         ax,1
 00504456    call        SetScroll
 0050445B    pop         ecx
 0050445C    pop         esi
 0050445D    pop         ebx
 0050445E    mov         esp,ebp
 00504460    pop         ebp
 00504461    ret
*}
end;

//00504464
procedure DoUpdate;
begin
{*
 00504464    push        ebp
 00504465    mov         ebp,esp
 00504467    mov         eax,dword ptr [ebp+8]
 0050446A    cmp         byte ptr [eax-71],0
>0050446E    jne         00504485
 00504470    mov         eax,dword ptr [ebp+8]
 00504473    mov         eax,dword ptr [eax-78]
 00504476    mov         edx,dword ptr [eax]
 00504478    call        dword ptr [edx+9C]
 0050447E    mov         eax,dword ptr [ebp+8]
 00504481    mov         byte ptr [eax-71],1
 00504485    pop         ebp
 00504486    ret
*}
end;

//00504488
function ScrollBarVisible(Code:Word):Boolean;
begin
{*
 00504488    push        ebp
 00504489    mov         ebp,esp
 0050448B    add         esp,0FFFFFFF8
 0050448E    push        ebx
 0050448F    mov         ebx,eax
 00504491    xor         eax,eax
 00504493    mov         edx,dword ptr [ebp+8]
 00504496    mov         edx,dword ptr [edx-78]
 00504499    cmp         byte ptr [edx+2C4],3
>005044A0    je          005044CB
 005044A2    test        bx,bx
>005044A5    jne         005044B6
 005044A7    mov         edx,dword ptr [ebp+8]
 005044AA    mov         edx,dword ptr [edx-78]
 005044AD    cmp         byte ptr [edx+2C4],1
>005044B4    je          005044CB
 005044B6    cmp         bx,1
>005044BA    jne         005044F1
 005044BC    mov         edx,dword ptr [ebp+8]
 005044BF    mov         edx,dword ptr [edx-78]
 005044C2    cmp         byte ptr [edx+2C4],2
>005044C9    jne         005044F1
 005044CB    lea         eax,[ebp-8]
 005044CE    push        eax
 005044CF    lea         eax,[ebp-4]
 005044D2    push        eax
 005044D3    movzx       eax,bx
 005044D6    push        eax
 005044D7    mov         eax,dword ptr [ebp+8]
 005044DA    mov         eax,dword ptr [eax-78]
 005044DD    call        TWinControl.GetHandle
 005044E2    push        eax
 005044E3    call        user32.GetScrollRange
 005044E8    mov         eax,dword ptr [ebp-4]
 005044EB    cmp         eax,dword ptr [ebp-8]
 005044EE    setne       al
 005044F1    pop         ebx
 005044F2    pop         ecx
 005044F3    pop         ecx
 005044F4    pop         ebp
 005044F5    ret
*}
end;

//005044F8
procedure CalcSizeInfo;
begin
{*
 005044F8    push        ebp
 005044F9    mov         ebp,esp
 005044FB    add         esp,0FFFFFFF8
 005044FE    mov         eax,dword ptr [ebp+8]
 00504501    mov         eax,dword ptr [eax-24]
 00504504    push        eax
 00504505    mov         eax,dword ptr [ebp+8]
 00504508    mov         ecx,dword ptr [eax-54]
 0050450B    mov         eax,dword ptr [ebp+8]
 0050450E    lea         edx,[eax-60]
 00504511    mov         eax,dword ptr [ebp+8]
 00504514    mov         eax,dword ptr [eax-78]
 00504517    call        TCustomGrid.CalcDrawInfoXY
 0050451C    mov         eax,dword ptr [ebp+8]
 0050451F    mov         eax,dword ptr [eax-78]
 00504522    mov         eax,dword ptr [eax+284]
 00504528    dec         eax
 00504529    mov         edx,dword ptr [ebp+8]
 0050452C    mov         dword ptr [edx-68],eax
 0050452F    mov         eax,dword ptr [ebp+8]
 00504532    mov         eax,dword ptr [eax-78]
 00504535    mov         eax,dword ptr [eax+2C0]
 0050453B    dec         eax
 0050453C    mov         edx,dword ptr [ebp+8]
 0050453F    mov         dword ptr [edx-64],eax
 00504542    lea         eax,[ebp-8]
 00504545    push        eax
 00504546    mov         eax,dword ptr [ebp+8]
 00504549    lea         ecx,[eax-60]
 0050454C    mov         eax,dword ptr [ebp+8]
 0050454F    lea         edx,[eax-68]
 00504552    mov         eax,dword ptr [ebp+8]
 00504555    mov         eax,dword ptr [eax-78]
 00504558    call        TCustomGrid.CalcMaxTopLeft
 0050455D    mov         eax,dword ptr [ebp+8]
 00504560    mov         edx,dword ptr [ebp-8]
 00504563    mov         dword ptr [eax-68],edx
 00504566    mov         edx,dword ptr [ebp-4]
 00504569    mov         dword ptr [eax-64],edx
 0050456C    pop         ecx
 0050456D    pop         ecx
 0050456E    pop         ebp
 0050456F    ret
*}
end;

//00504570
procedure SetAxisRange(var Max:LongInt; var Old:LongInt; var Current:LongInt; Code:Word; Fixeds:Integer);
begin
{*
 00504570    push        ebp
 00504571    mov         ebp,esp
 00504573    push        ecx
 00504574    push        ebx
 00504575    push        esi
 00504576    push        edi
 00504577    mov         dword ptr [ebp-4],ecx
 0050457A    mov         edi,edx
 0050457C    mov         ebx,eax
 0050457E    mov         esi,dword ptr [ebp+0C]
 00504581    mov         eax,dword ptr [ebp+10]
 00504584    push        eax
 00504585    call        CalcSizeInfo
 0050458A    pop         ecx
 0050458B    mov         eax,dword ptr [ebx]
 0050458D    cmp         eax,dword ptr [ebp+8]
>00504590    jle         005045AF
 00504592    push        0FF
 00504594    push        7F
 00504596    push        0
 00504598    movzx       eax,si
 0050459B    push        eax
 0050459C    mov         eax,dword ptr [ebp+10]
 0050459F    mov         eax,dword ptr [eax-78]
 005045A2    call        TWinControl.GetHandle
 005045A7    push        eax
 005045A8    call        user32.SetScrollRange
>005045AD    jmp         005045CA
 005045AF    push        0FF
 005045B1    push        0
 005045B3    push        0
 005045B5    movzx       eax,si
 005045B8    push        eax
 005045B9    mov         eax,dword ptr [ebp+10]
 005045BC    mov         eax,dword ptr [eax-78]
 005045BF    call        TWinControl.GetHandle
 005045C4    push        eax
 005045C5    call        user32.SetScrollRange
 005045CA    mov         eax,dword ptr [edi]
 005045CC    cmp         eax,dword ptr [ebx]
>005045CE    jle         005045E1
 005045D0    mov         eax,dword ptr [ebp+10]
 005045D3    push        eax
 005045D4    call        DoUpdate
 005045D9    pop         ecx
 005045DA    mov         eax,dword ptr [ebx]
 005045DC    mov         edx,dword ptr [ebp-4]
 005045DF    mov         dword ptr [edx],eax
 005045E1    pop         edi
 005045E2    pop         esi
 005045E3    pop         ebx
 005045E4    pop         ecx
 005045E5    pop         ebp
 005045E6    ret         8
*}
end;

//005045EC
procedure SetHorzRange;
begin
{*
 005045EC    push        ebp
 005045ED    mov         ebp,esp
 005045EF    push        ebx
 005045F0    mov         eax,dword ptr [ebp+8]
 005045F3    movzx       eax,byte ptr [eax-79]
 005045F7    sub         al,1
>005045F9    je          005045FF
 005045FB    sub         al,2
>005045FD    jne         0050467B
 005045FF    mov         eax,dword ptr [ebp+8]
 00504602    mov         eax,dword ptr [eax-78]
 00504605    cmp         dword ptr [eax+284],1
>0050460C    jne         0050464A
 0050460E    mov         eax,dword ptr [ebp+8]
 00504611    mov         eax,dword ptr [eax-78]
 00504614    xor         edx,edx
 00504616    call        TCustomGrid.GetColWidths
 0050461B    mov         ebx,eax
 0050461D    mov         eax,dword ptr [ebp+8]
 00504620    mov         eax,dword ptr [eax-78]
 00504623    call        TControl.GetClientWidth
 00504628    sub         ebx,eax
 0050462A    test        ebx,ebx
>0050462C    jge         00504630
 0050462E    xor         ebx,ebx
 00504630    push        0FF
 00504632    push        ebx
 00504633    push        0
 00504635    push        0
 00504637    mov         eax,dword ptr [ebp+8]
 0050463A    mov         eax,dword ptr [eax-78]
 0050463D    call        TWinControl.GetHandle
 00504642    push        eax
 00504643    call        user32.SetScrollRange
>00504648    jmp         0050467B
 0050464A    mov         eax,dword ptr [ebp+8]
 0050464D    push        eax
 0050464E    push        0
 00504650    mov         eax,dword ptr [ebp+8]
 00504653    mov         eax,dword ptr [eax-78]
 00504656    mov         eax,dword ptr [eax+29C]
 0050465C    push        eax
 0050465D    mov         eax,dword ptr [ebp+8]
 00504660    mov         eax,dword ptr [eax-78]
 00504663    lea         ecx,[eax+2C8]
 00504669    mov         eax,dword ptr [ebp+8]
 0050466C    lea         edx,[eax-70]
 0050466F    mov         eax,dword ptr [ebp+8]
 00504672    add         eax,0FFFFFF98
 00504675    call        SetAxisRange
 0050467A    pop         ecx
 0050467B    pop         ebx
 0050467C    pop         ebp
 0050467D    ret
*}
end;

//00504680
procedure SetVertRange;
begin
{*
 00504680    push        ebp
 00504681    mov         ebp,esp
 00504683    mov         eax,dword ptr [ebp+8]
 00504686    movzx       eax,byte ptr [eax-79]
 0050468A    add         al,0FE
 0050468C    sub         al,2
>0050468E    jae         005046C1
 00504690    mov         eax,dword ptr [ebp+8]
 00504693    push        eax
 00504694    push        1
 00504696    mov         eax,dword ptr [ebp+8]
 00504699    mov         eax,dword ptr [eax-78]
 0050469C    mov         eax,dword ptr [eax+2A0]
 005046A2    push        eax
 005046A3    mov         eax,dword ptr [ebp+8]
 005046A6    mov         eax,dword ptr [eax-78]
 005046A9    lea         ecx,[eax+2CC]
 005046AF    mov         eax,dword ptr [ebp+8]
 005046B2    lea         edx,[eax-6C]
 005046B5    mov         eax,dword ptr [ebp+8]
 005046B8    add         eax,0FFFFFF9C
 005046BB    call        SetAxisRange
 005046C0    pop         ecx
 005046C1    pop         ebp
 005046C2    ret
*}
end;

//005046C4
procedure TCustomGrid.UpdateScrollRange;
begin
{*
 005046C4    push        ebp
 005046C5    mov         ebp,esp
 005046C7    add         esp,0FFFFFF84
 005046CA    mov         dword ptr [ebp-78],eax
 005046CD    mov         eax,dword ptr [ebp-78]
 005046D0    cmp         byte ptr [eax+2C4],0
>005046D7    je          0050480A
 005046DD    mov         eax,dword ptr [ebp-78]
 005046E0    call        TWinControl.HandleAllocated
 005046E5    test        al,al
>005046E7    je          0050480A
 005046ED    mov         eax,dword ptr [ebp-78]
 005046F0    cmp         byte ptr [eax+1EA],0
>005046F7    je          0050480A
 005046FD    mov         eax,dword ptr [ebp-78]
 00504700    call        TControl.GetClientWidth
 00504705    mov         dword ptr [ebp-54],eax
 00504708    mov         eax,dword ptr [ebp-78]
 0050470B    call        TControl.GetClientHeight
 00504710    mov         dword ptr [ebp-24],eax
 00504713    push        ebp
 00504714    xor         eax,eax
 00504716    call        ScrollBarVisible
 0050471B    pop         ecx
 0050471C    test        al,al
>0050471E    je          0050472A
 00504720    push        3
 00504722    call        user32.GetSystemMetrics
 00504727    add         dword ptr [ebp-24],eax
 0050472A    push        ebp
 0050472B    mov         ax,1
 0050472F    call        ScrollBarVisible
 00504734    pop         ecx
 00504735    test        al,al
>00504737    je          00504743
 00504739    push        2
 0050473B    call        user32.GetSystemMetrics
 00504740    add         dword ptr [ebp-54],eax
 00504743    mov         eax,dword ptr [ebp-78]
 00504746    mov         edx,dword ptr [eax+2C8]
 0050474C    mov         dword ptr [ebp-70],edx
 0050474F    mov         edx,dword ptr [eax+2CC]
 00504755    mov         dword ptr [ebp-6C],edx
 00504758    mov         eax,dword ptr [ebp-78]
 0050475B    movzx       eax,byte ptr [eax+2C4]
 00504762    mov         byte ptr [ebp-79],al
 00504765    mov         eax,dword ptr [ebp-78]
 00504768    mov         byte ptr [eax+2C4],0
 0050476F    mov         byte ptr [ebp-71],0
 00504773    xor         eax,eax
 00504775    push        ebp
 00504776    push        5047D4
 0050477B    push        dword ptr fs:[eax]
 0050477E    mov         dword ptr fs:[eax],esp
 00504781    push        ebp
 00504782    call        SetHorzRange
 00504787    pop         ecx
 00504788    mov         eax,dword ptr [ebp-78]
 0050478B    call        TControl.GetClientHeight
 00504790    mov         dword ptr [ebp-24],eax
 00504793    push        ebp
 00504794    call        SetVertRange
 00504799    pop         ecx
 0050479A    mov         eax,dword ptr [ebp-78]
 0050479D    call        TControl.GetClientWidth
 005047A2    cmp         eax,dword ptr [ebp-54]
>005047A5    je          005047B9
 005047A7    mov         eax,dword ptr [ebp-78]
 005047AA    call        TControl.GetClientWidth
 005047AF    mov         dword ptr [ebp-54],eax
 005047B2    push        ebp
 005047B3    call        SetHorzRange
 005047B8    pop         ecx
 005047B9    xor         eax,eax
 005047BB    pop         edx
 005047BC    pop         ecx
 005047BD    pop         ecx
 005047BE    mov         dword ptr fs:[eax],edx
 005047C1    push        5047DB
 005047C6    mov         eax,dword ptr [ebp-78]
 005047C9    movzx       edx,byte ptr [ebp-79]
 005047CD    mov         byte ptr [eax+2C4],dl
 005047D3    ret
>005047D4    jmp         @HandleFinally
>005047D9    jmp         005047C6
 005047DB    mov         eax,dword ptr [ebp-78]
 005047DE    call        TCustomGrid.UpdateScrollPos
 005047E3    mov         eax,dword ptr [ebp-78]
 005047E6    mov         eax,dword ptr [eax+2C8]
 005047EC    cmp         eax,dword ptr [ebp-70]
>005047EF    jne         005047FF
 005047F1    mov         eax,dword ptr [ebp-78]
 005047F4    mov         eax,dword ptr [eax+2CC]
 005047FA    cmp         eax,dword ptr [ebp-6C]
>005047FD    je          0050480A
 005047FF    lea         edx,[ebp-70]
 00504802    mov         eax,dword ptr [ebp-78]
 00504805    call        TCustomGrid.TopLeftMoved
 0050480A    mov         esp,ebp
 0050480C    pop         ebp
 0050480D    ret
*}
end;

//00504810
function TCustomGrid.CreateEditor:TInplaceEdit;
begin
{*
 00504810    mov         ecx,eax
 00504812    mov         dl,1
 00504814    mov         eax,[004FDB44];TInplaceEdit
 00504819    call        TInplaceEdit.Create
 0050481E    ret
*}
end;

//00504820
procedure TCustomGrid.CreateParams(var Params:TCreateParams);
begin
{*
 00504820    push        ebx
 00504821    push        esi
 00504822    mov         esi,edx
 00504824    mov         ebx,eax
 00504826    mov         edx,esi
 00504828    mov         eax,ebx
 0050482A    call        TWinControl.CreateParams
 0050482F    or          dword ptr [esi+4],10000
 00504836    movzx       eax,byte ptr [ebx+2C4]
 0050483D    add         al,0FE
 0050483F    sub         al,2
>00504841    jae         0050484A
 00504843    or          dword ptr [esi+4],200000
 0050484A    movzx       eax,byte ptr [ebx+2C4]
 00504851    sub         al,1
>00504853    je          00504859
 00504855    sub         al,2
>00504857    jne         00504860
 00504859    or          dword ptr [esi+4],100000
 00504860    mov         dword ptr [esi+24],8
 00504867    cmp         byte ptr [ebx+280],1
>0050486E    jne         0050489A
 00504870    mov         eax,[0078D264];^NewStyleControls:Boolean
 00504875    cmp         byte ptr [eax],0
>00504878    je          00504893
 0050487A    cmp         byte ptr [ebx+1E9],0
>00504881    je          00504893
 00504883    and         dword ptr [esi+4],0FF7FFFFF
 0050488A    or          dword ptr [esi+8],200
>00504891    jmp         0050489A
 00504893    or          dword ptr [esi+4],800000
 0050489A    pop         esi
 0050489B    pop         ebx
 0050489C    ret
*}
end;

//005048A0
procedure TCustomGrid.CreateWnd;
begin
{*
 005048A0    push        ebx
 005048A1    mov         ebx,eax
 005048A3    mov         eax,ebx
 005048A5    call        TWinControl.CreateWnd
 005048AA    movzx       eax,byte ptr [ebx+298]
 005048B1    mov         byte ptr [ebx+324],al
 005048B7    cmp         byte ptr [ebx+298],1
>005048BE    jne         005048D2
 005048C0    mov         eax,ebx
 005048C2    call        ThemeControl
 005048C7    test        al,al
>005048C9    jne         005048D2
 005048CB    mov         byte ptr [ebx+324],0
 005048D2    pop         ebx
 005048D3    ret
*}
end;

//005048D4
procedure TCustomGrid.DoGesture(const EventInfo:TGestureEventInfo; var Handled:Boolean);
begin
{*
 005048D4    push        ebx
 005048D5    push        esi
 005048D6    push        edi
 005048D7    push        ebp
 005048D8    add         esp,0FFFFFFF8
 005048DB    mov         ebx,edx
 005048DD    mov         esi,eax
 005048DF    cmp         word ptr [ebx],104
>005048E4    jne         00504A44
 005048EA    mov         byte ptr [ecx],1
 005048ED    test        byte ptr [ebx+0C],1
>005048F1    je          0050490A
 005048F3    mov         eax,dword ptr [ebx+4]
 005048F6    mov         dword ptr [esi+2B8],eax
 005048FC    mov         eax,dword ptr [ebx+8]
 005048FF    mov         dword ptr [esi+2BC],eax
>00504905    jmp         00504A44
 0050490A    test        byte ptr [ebx+0C],4
>0050490E    jne         00504A44
 00504914    mov         edi,dword ptr [ebx+8]
 00504917    sub         edi,dword ptr [esi+2BC]
 0050491D    mov         eax,edi
 0050491F    cdq
 00504920    xor         eax,edx
 00504922    sub         eax,edx
 00504924    mov         ebp,eax
 00504926    cmp         ebp,1
>00504929    jle         005049B6
 0050492F    mov         edx,dword ptr [esi+2CC]
 00504935    mov         eax,esi
 00504937    call        TCustomGrid.GetRowHeights
 0050493C    mov         dword ptr [esp+4],eax
 00504940    mov         eax,edi
 00504942    cdq
 00504943    xor         eax,edx
 00504945    sub         eax,edx
 00504947    mov         eax,ebp
 00504949    cdq
 0050494A    idiv        eax,dword ptr [esp+4]
 0050494E    mov         ecx,eax
 00504950    mov         eax,edi
 00504952    cdq
 00504953    xor         eax,edx
 00504955    sub         eax,edx
 00504957    cdq
 00504958    idiv        eax,dword ptr [esp+4]
 0050495C    test        edx,edx
>0050495E    je          00504968
 00504960    test        ecx,ecx
>00504962    jle         00504A44
 00504968    mov         ebp,ecx
 0050496A    dec         ebp
 0050496B    test        ebp,ebp
>0050496D    jl          00504992
 0050496F    inc         ebp
 00504970    push        0
 00504972    push        1
 00504974    test        edi,edi
 00504976    setg        al
 00504979    and         eax,7F
 0050497C    mov         ecx,dword ptr [eax*4+7868FC]
 00504983    mov         edx,1
 00504988    mov         eax,esi
 0050498A    call        TCustomGrid.ModifyScrollBar
 0050498F    dec         ebp
>00504990    jne         00504970
 00504992    mov         eax,dword ptr [ebx+4]
 00504995    mov         dword ptr [esi+2B8],eax
 0050499B    mov         eax,dword ptr [ebx+8]
 0050499E    mov         dword ptr [esi+2BC],eax
 005049A4    mov         eax,edi
 005049A6    cdq
 005049A7    idiv        eax,dword ptr [esp+4]
 005049AB    add         dword ptr [esi+2BC],edx
>005049B1    jmp         00504A44
 005049B6    mov         edi,dword ptr [ebx+4]
 005049B9    sub         edi,dword ptr [esi+2B8]
 005049BF    mov         eax,edi
 005049C1    cdq
 005049C2    xor         eax,edx
 005049C4    sub         eax,edx
 005049C6    mov         ebp,eax
 005049C8    cmp         ebp,1
>005049CB    jle         00504A44
 005049CD    mov         edx,dword ptr [esi+2C8]
 005049D3    mov         eax,esi
 005049D5    call        TCustomGrid.GetColWidths
 005049DA    mov         dword ptr [esp],eax
 005049DD    mov         eax,edi
 005049DF    cdq
 005049E0    xor         eax,edx
 005049E2    sub         eax,edx
 005049E4    mov         eax,ebp
 005049E6    cdq
 005049E7    idiv        eax,dword ptr [esp]
 005049EA    mov         ecx,eax
 005049EC    mov         eax,edi
 005049EE    cdq
 005049EF    xor         eax,edx
 005049F1    sub         eax,edx
 005049F3    cdq
 005049F4    idiv        eax,dword ptr [esp]
 005049F7    test        edx,edx
>005049F9    je          005049FF
 005049FB    test        ecx,ecx
>005049FD    jle         00504A44
 005049FF    mov         ebp,ecx
 00504A01    dec         ebp
 00504A02    test        ebp,ebp
>00504A04    jl          00504A26
 00504A06    inc         ebp
 00504A07    push        0
 00504A09    push        1
 00504A0B    test        edi,edi
 00504A0D    setg        al
 00504A10    and         eax,7F
 00504A13    mov         ecx,dword ptr [eax*4+786904]
 00504A1A    xor         edx,edx
 00504A1C    mov         eax,esi
 00504A1E    call        TCustomGrid.ModifyScrollBar
 00504A23    dec         ebp
>00504A24    jne         00504A07
 00504A26    mov         eax,dword ptr [ebx+4]
 00504A29    mov         dword ptr [esi+2B8],eax
 00504A2F    mov         eax,dword ptr [ebx+8]
 00504A32    mov         dword ptr [esi+2BC],eax
 00504A38    mov         eax,edi
 00504A3A    cdq
 00504A3B    idiv        eax,dword ptr [esp]
 00504A3E    add         dword ptr [esi+2B8],edx
 00504A44    pop         ecx
 00504A45    pop         edx
 00504A46    pop         ebp
 00504A47    pop         edi
 00504A48    pop         esi
 00504A49    pop         ebx
 00504A4A    ret
*}
end;

//00504A4C
procedure CalcPageExtents;
begin
{*
 00504A4C    push        ebp
 00504A4D    mov         ebp,esp
 00504A4F    mov         eax,dword ptr [ebp+8]
 00504A52    lea         edx,[eax-60]
 00504A55    mov         eax,dword ptr [ebp+8]
 00504A58    mov         eax,dword ptr [eax-64]
 00504A5B    call        TCustomGrid.CalcDrawInfo
 00504A60    mov         eax,dword ptr [ebp+8]
 00504A63    mov         eax,dword ptr [eax-50]
 00504A66    mov         edx,dword ptr [ebp+8]
 00504A69    mov         edx,dword ptr [edx-64]
 00504A6C    sub         eax,dword ptr [edx+2C8]
 00504A72    mov         edx,dword ptr [ebp+8]
 00504A75    mov         dword ptr [edx-68],eax
 00504A78    mov         eax,dword ptr [ebp+8]
 00504A7B    cmp         dword ptr [eax-68],1
>00504A7F    jge         00504A8B
 00504A81    mov         eax,dword ptr [ebp+8]
 00504A84    mov         dword ptr [eax-68],1
 00504A8B    mov         eax,dword ptr [ebp+8]
 00504A8E    mov         eax,dword ptr [eax-20]
 00504A91    mov         edx,dword ptr [ebp+8]
 00504A94    mov         edx,dword ptr [edx-64]
 00504A97    sub         eax,dword ptr [edx+2CC]
 00504A9D    mov         edx,dword ptr [ebp+8]
 00504AA0    mov         dword ptr [edx-6C],eax
 00504AA3    mov         eax,dword ptr [ebp+8]
 00504AA6    cmp         dword ptr [eax-6C],1
>00504AAA    jge         00504AB6
 00504AAC    mov         eax,dword ptr [ebp+8]
 00504AAF    mov         dword ptr [eax-6C],1
 00504AB6    pop         ebp
 00504AB7    ret
*}
end;

//00504AB8
procedure Restrict(var Coord:TGridCoord; MinX:LongInt; MinY:LongInt; MaxX:LongInt; MaxY:LongInt);
begin
{*
 00504AB8    push        ebp
 00504AB9    mov         ebp,esp
 00504ABB    push        ecx
 00504ABC    push        ebx
 00504ABD    push        esi
 00504ABE    push        edi
 00504ABF    mov         dword ptr [ebp-4],ecx
 00504AC2    mov         esi,dword ptr [ebp+8]
 00504AC5    mov         ebx,dword ptr [ebp+0C]
 00504AC8    mov         edi,dword ptr [eax]
 00504ACA    cmp         ebx,edi
>00504ACC    jge         00504AD2
 00504ACE    mov         dword ptr [eax],ebx
>00504AD0    jmp         00504AD8
 00504AD2    cmp         edx,edi
>00504AD4    jle         00504AD8
 00504AD6    mov         dword ptr [eax],edx
 00504AD8    mov         edx,dword ptr [eax+4]
 00504ADB    cmp         esi,edx
>00504ADD    jge         00504AE4
 00504ADF    mov         dword ptr [eax+4],esi
>00504AE2    jmp         00504AEF
 00504AE4    cmp         edx,dword ptr [ebp-4]
>00504AE7    jge         00504AEF
 00504AE9    mov         edx,dword ptr [ebp-4]
 00504AEC    mov         dword ptr [eax+4],edx
 00504AEF    pop         edi
 00504AF0    pop         esi
 00504AF1    pop         ebx
 00504AF2    pop         ecx
 00504AF3    pop         ebp
 00504AF4    ret         8
*}
end;

//00504AF8
procedure TCustomGrid.KeyDown(var Key:Word; Shift:TShiftState);
begin
{*
 00504AF8    push        ebp
 00504AF9    mov         ebp,esp
 00504AFB    add         esp,0FFFFFF6C
 00504B01    push        ebx
 00504B02    push        esi
 00504B03    push        edi
 00504B04    mov         word ptr [ebp-6E],cx
 00504B08    mov         ebx,edx
 00504B0A    mov         dword ptr [ebp-64],eax
 00504B0D    lea         edi,[ebp-64]
 00504B10    mov         edx,ebx
 00504B12    movzx       ecx,word ptr [ebp-6E]
 00504B16    mov         eax,dword ptr [edi]
 00504B18    call        TWinControl.KeyDown
 00504B1D    mov         byte ptr [ebp-89],0
 00504B24    movzx       edx,word ptr [ebx]
 00504B27    movzx       ecx,word ptr [ebp-6E]
 00504B2B    mov         eax,dword ptr [edi]
 00504B2D    mov         si,0FFAD
 00504B31    call        @CallDynaInst
 00504B36    test        al,al
>00504B38    jne         00504B3F
 00504B3A    mov         word ptr [ebx],0
 00504B3F    mov         eax,dword ptr [edi]
 00504B41    mov         si,0FFC7
 00504B45    call        @CallDynaInst
 00504B4A    test        al,al
>00504B4C    jne         00504B55
 00504B4E    mov         esi,1
>00504B53    jmp         00504B58
 00504B55    or          esi,0FFFFFFFF
 00504B58    mov         eax,dword ptr [edi]
 00504B5A    mov         edx,dword ptr [eax+288]
 00504B60    mov         dword ptr [ebp-80],edx
 00504B63    mov         edx,dword ptr [eax+28C]
 00504B69    mov         dword ptr [ebp-7C],edx
 00504B6C    mov         eax,dword ptr [edi]
 00504B6E    mov         edx,dword ptr [eax+2C8]
 00504B74    mov         dword ptr [ebp-78],edx
 00504B77    mov         edx,dword ptr [eax+2CC]
 00504B7D    mov         dword ptr [ebp-74],edx
 00504B80    push        ebp
 00504B81    call        CalcPageExtents
 00504B86    pop         ecx
 00504B87    test        byte ptr [ebp-6E],4
>00504B8B    je          00504C8A
 00504B91    movzx       eax,word ptr [ebx]
 00504B94    add         eax,0FFFFFFDF
 00504B97    cmp         eax,7
>00504B9A    ja          00504E59
 00504BA0    jmp         dword ptr [eax*4+504BA7]
 00504BA0    dd          00504C15
 00504BA0    dd          00504C25
 00504BA0    dd          00504C5C
 00504BA0    dd          00504C30
 00504BA0    dd          00504BD7
 00504BA0    dd          00504BC7
 00504BA0    dd          00504BF6
 00504BA0    dd          00504BCF
 00504BC7    dec         dword ptr [ebp-74]
>00504BCA    jmp         00504E59
 00504BCF    inc         dword ptr [ebp-74]
>00504BD2    jmp         00504E59
 00504BD7    mov         eax,dword ptr [edi]
 00504BD9    test        byte ptr [eax+2B5],10
>00504BE0    jne         00504E59
 00504BE6    mov         eax,dword ptr [ebp-68]
 00504BE9    imul        esi
 00504BEB    sub         dword ptr [ebp-80],eax
 00504BEE    sub         dword ptr [ebp-78],eax
>00504BF1    jmp         00504E59
 00504BF6    mov         eax,dword ptr [edi]
 00504BF8    test        byte ptr [eax+2B5],10
>00504BFF    jne         00504E59
 00504C05    mov         eax,dword ptr [ebp-68]
 00504C08    imul        esi
 00504C0A    add         dword ptr [ebp-80],eax
 00504C0D    add         dword ptr [ebp-78],eax
>00504C10    jmp         00504E59
 00504C15    mov         eax,dword ptr [edi]
 00504C17    mov         eax,dword ptr [eax+2CC]
 00504C1D    mov         dword ptr [ebp-7C],eax
>00504C20    jmp         00504E59
 00504C25    mov         eax,dword ptr [ebp-20]
 00504C28    mov         dword ptr [ebp-7C],eax
>00504C2B    jmp         00504E59
 00504C30    mov         eax,dword ptr [edi]
 00504C32    mov         eax,dword ptr [eax+29C]
 00504C38    mov         dword ptr [ebp-80],eax
 00504C3B    mov         eax,dword ptr [edi]
 00504C3D    mov         eax,dword ptr [eax+2A0]
 00504C43    mov         dword ptr [ebp-7C],eax
 00504C46    mov         eax,dword ptr [edi]
 00504C48    mov         si,0FFC7
 00504C4C    call        @CallDynaInst
 00504C51    mov         byte ptr [ebp-89],al
>00504C57    jmp         00504E59
 00504C5C    mov         eax,dword ptr [edi]
 00504C5E    mov         eax,dword ptr [eax+284]
 00504C64    dec         eax
 00504C65    mov         dword ptr [ebp-80],eax
 00504C68    mov         eax,dword ptr [edi]
 00504C6A    mov         eax,dword ptr [eax+2C0]
 00504C70    dec         eax
 00504C71    mov         dword ptr [ebp-7C],eax
 00504C74    mov         eax,dword ptr [edi]
 00504C76    mov         si,0FFC7
 00504C7A    call        @CallDynaInst
 00504C7F    mov         byte ptr [ebp-89],al
>00504C85    jmp         00504E59
 00504C8A    movzx       eax,word ptr [ebx]
 00504C8D    cmp         eax,25
>00504C90    jg          00504CCB
>00504C92    je          00504CF4
 00504C94    cmp         eax,22
>00504C97    jg          00504CB6
>00504C99    je          00504D2A
 00504C9F    sub         eax,9
>00504CA2    je          00504DA4
 00504CA8    sub         eax,18
>00504CAB    je          00504D3B
>00504CB1    jmp         00504E59
 00504CB6    sub         eax,23
>00504CB9    je          00504D77
 00504CBF    dec         eax
>00504CC0    je          00504D4C
>00504CC6    jmp         00504E59
 00504CCB    sub         eax,26
>00504CCE    je          00504CE4
 00504CD0    dec         eax
>00504CD1    je          00504D0F
 00504CD3    dec         eax
>00504CD4    je          00504CEC
 00504CD6    sub         eax,49
>00504CD9    je          00504E50
>00504CDF    jmp         00504E59
 00504CE4    dec         dword ptr [ebp-7C]
>00504CE7    jmp         00504E59
 00504CEC    inc         dword ptr [ebp-7C]
>00504CEF    jmp         00504E59
 00504CF4    mov         eax,dword ptr [edi]
 00504CF6    test        byte ptr [eax+2B5],10
>00504CFD    je          00504D07
 00504CFF    sub         dword ptr [ebp-7C],esi
>00504D02    jmp         00504E59
 00504D07    sub         dword ptr [ebp-80],esi
>00504D0A    jmp         00504E59
 00504D0F    mov         eax,dword ptr [edi]
 00504D11    test        byte ptr [eax+2B5],10
>00504D18    je          00504D22
 00504D1A    add         dword ptr [ebp-7C],esi
>00504D1D    jmp         00504E59
 00504D22    add         dword ptr [ebp-80],esi
>00504D25    jmp         00504E59
 00504D2A    mov         eax,dword ptr [ebp-6C]
 00504D2D    add         dword ptr [ebp-7C],eax
 00504D30    mov         eax,dword ptr [ebp-6C]
 00504D33    add         dword ptr [ebp-74],eax
>00504D36    jmp         00504E59
 00504D3B    mov         eax,dword ptr [ebp-6C]
 00504D3E    sub         dword ptr [ebp-7C],eax
 00504D41    mov         eax,dword ptr [ebp-6C]
 00504D44    sub         dword ptr [ebp-74],eax
>00504D47    jmp         00504E59
 00504D4C    mov         eax,dword ptr [edi]
 00504D4E    test        byte ptr [eax+2B5],10
>00504D55    je          00504D67
 00504D57    mov         eax,dword ptr [edi]
 00504D59    mov         eax,dword ptr [eax+2A0]
 00504D5F    mov         dword ptr [ebp-7C],eax
>00504D62    jmp         00504E59
 00504D67    mov         eax,dword ptr [edi]
 00504D69    mov         eax,dword ptr [eax+29C]
 00504D6F    mov         dword ptr [ebp-80],eax
>00504D72    jmp         00504E59
 00504D77    mov         eax,dword ptr [edi]
 00504D79    test        byte ptr [eax+2B5],10
>00504D80    je          00504D93
 00504D82    mov         eax,dword ptr [edi]
 00504D84    mov         eax,dword ptr [eax+2C0]
 00504D8A    dec         eax
 00504D8B    mov         dword ptr [ebp-7C],eax
>00504D8E    jmp         00504E59
 00504D93    mov         eax,dword ptr [edi]
 00504D95    mov         eax,dword ptr [eax+284]
 00504D9B    dec         eax
 00504D9C    mov         dword ptr [ebp-80],eax
>00504D9F    jmp         00504E59
 00504DA4    test        byte ptr [ebp-6E],2
>00504DA8    jne         00504E59
 00504DAE    test        byte ptr [ebp-6E],1
>00504DB2    je          00504DF9
 00504DB4    dec         dword ptr [ebp-80]
 00504DB7    mov         eax,dword ptr [edi]
 00504DB9    mov         eax,dword ptr [eax+29C]
 00504DBF    cmp         eax,dword ptr [ebp-80]
>00504DC2    jle         00504DEC
 00504DC4    mov         eax,dword ptr [edi]
 00504DC6    mov         eax,dword ptr [eax+284]
 00504DCC    dec         eax
 00504DCD    mov         dword ptr [ebp-80],eax
 00504DD0    dec         dword ptr [ebp-7C]
 00504DD3    mov         eax,dword ptr [edi]
 00504DD5    mov         eax,dword ptr [eax+2A0]
 00504DDB    cmp         eax,dword ptr [ebp-7C]
>00504DDE    jle         00504DEC
 00504DE0    mov         eax,dword ptr [edi]
 00504DE2    mov         eax,dword ptr [eax+2C0]
 00504DE8    dec         eax
 00504DE9    mov         dword ptr [ebp-7C],eax
 00504DEC    movzx       eax,word ptr ds:[504F70]
 00504DF3    mov         word ptr [ebp-6E],ax
>00504DF7    jmp         00504E2F
 00504DF9    inc         dword ptr [ebp-80]
 00504DFC    mov         eax,dword ptr [edi]
 00504DFE    mov         eax,dword ptr [eax+284]
 00504E04    cmp         eax,dword ptr [ebp-80]
>00504E07    jg          00504E2F
 00504E09    mov         eax,dword ptr [edi]
 00504E0B    mov         eax,dword ptr [eax+29C]
 00504E11    mov         dword ptr [ebp-80],eax
 00504E14    inc         dword ptr [ebp-7C]
 00504E17    mov         eax,dword ptr [edi]
 00504E19    mov         eax,dword ptr [eax+2C0]
 00504E1F    cmp         eax,dword ptr [ebp-7C]
>00504E22    jg          00504E2F
 00504E24    mov         eax,dword ptr [edi]
 00504E26    mov         eax,dword ptr [eax+2A0]
 00504E2C    mov         dword ptr [ebp-7C],eax
 00504E2F    mov         edx,dword ptr [ebp-80]
 00504E32    mov         eax,dword ptr [edi]
 00504E34    call        TCustomGrid.GetTabStops
 00504E39    test        al,al
>00504E3B    jne         00504E59
 00504E3D    mov         eax,dword ptr [edi]
 00504E3F    mov         eax,dword ptr [eax+288]
 00504E45    cmp         eax,dword ptr [ebp-80]
>00504E48    jne         00504DAE
>00504E4E    jmp         00504E59
 00504E50    mov         dl,1
 00504E52    mov         eax,dword ptr [edi]
 00504E54    call        TCustomGrid.SetEditorMode
 00504E59    mov         eax,dword ptr [edi]
 00504E5B    mov         eax,dword ptr [eax+284]
 00504E61    dec         eax
 00504E62    mov         dword ptr [ebp-88],eax
 00504E68    mov         eax,dword ptr [edi]
 00504E6A    mov         eax,dword ptr [eax+2C0]
 00504E70    dec         eax
 00504E71    mov         dword ptr [ebp-84],eax
 00504E77    lea         eax,[ebp-94]
 00504E7D    push        eax
 00504E7E    lea         ecx,[ebp-60]
 00504E81    lea         edx,[ebp-88]
 00504E87    mov         eax,dword ptr [edi]
 00504E89    call        TCustomGrid.CalcMaxTopLeft
 00504E8E    mov         eax,dword ptr [ebp-94]
 00504E94    mov         dword ptr [ebp-88],eax
 00504E9A    mov         eax,dword ptr [ebp-90]
 00504EA0    mov         dword ptr [ebp-84],eax
 00504EA6    mov         eax,dword ptr [ebp-88]
 00504EAC    push        eax
 00504EAD    mov         eax,dword ptr [ebp-84]
 00504EB3    push        eax
 00504EB4    mov         eax,dword ptr [edi]
 00504EB6    mov         ecx,dword ptr [eax+2A0]
 00504EBC    mov         eax,dword ptr [edi]
 00504EBE    mov         edx,dword ptr [eax+29C]
 00504EC4    lea         eax,[ebp-78]
 00504EC7    call        Restrict
 00504ECC    mov         edx,dword ptr [edi]
 00504ECE    mov         edx,dword ptr [edx+2C8]
 00504ED4    mov         eax,dword ptr [ebp-78]
 00504ED7    cmp         edx,eax
>00504ED9    jne         00504EE8
 00504EDB    mov         edx,dword ptr [edi]
 00504EDD    mov         edx,dword ptr [edx+2CC]
 00504EE3    cmp         edx,dword ptr [ebp-74]
>00504EE6    je          00504EF4
 00504EE8    mov         ecx,dword ptr [ebp-74]
 00504EEB    mov         edx,eax
 00504EED    mov         eax,dword ptr [edi]
 00504EEF    call        TCustomGrid.MoveTopLeft
 00504EF4    mov         eax,dword ptr [edi]
 00504EF6    mov         eax,dword ptr [eax+284]
 00504EFC    dec         eax
 00504EFD    push        eax
 00504EFE    mov         eax,dword ptr [edi]
 00504F00    mov         eax,dword ptr [eax+2C0]
 00504F06    dec         eax
 00504F07    push        eax
 00504F08    mov         eax,dword ptr [edi]
 00504F0A    mov         ecx,dword ptr [eax+2A0]
 00504F10    mov         eax,dword ptr [edi]
 00504F12    mov         edx,dword ptr [eax+29C]
 00504F18    lea         eax,[ebp-80]
 00504F1B    call        Restrict
 00504F20    mov         edx,dword ptr [edi]
 00504F22    mov         edx,dword ptr [edx+288]
 00504F28    mov         eax,dword ptr [ebp-80]
 00504F2B    cmp         edx,eax
>00504F2D    jne         00504F3C
 00504F2F    mov         edx,dword ptr [edi]
 00504F31    mov         edx,dword ptr [edx+28C]
 00504F37    cmp         edx,dword ptr [ebp-7C]
>00504F3A    je          00504F53
 00504F3C    test        byte ptr [ebp-6E],1
 00504F40    setne       dl
 00504F43    xor         dl,1
 00504F46    push        edx
 00504F47    mov         ecx,dword ptr [ebp-7C]
 00504F4A    mov         edx,eax
 00504F4C    mov         eax,dword ptr [edi]
 00504F4E    call        TCustomGrid.FocusCell
 00504F53    cmp         byte ptr [ebp-89],0
>00504F5A    je          00504F66
 00504F5C    mov         eax,dword ptr [edi]
 00504F5E    mov         edx,dword ptr [eax]
 00504F60    call        dword ptr [edx+90]
 00504F66    pop         edi
 00504F67    pop         esi
 00504F68    pop         ebx
 00504F69    mov         esp,ebp
 00504F6B    pop         ebp
 00504F6C    ret
*}
end;

//00504F74
procedure TCustomGrid.KeyPress(var Key:Char);
begin
{*
 00504F74    push        ebx
 00504F75    push        esi
 00504F76    mov         esi,edx
 00504F78    mov         ebx,eax
 00504F7A    mov         edx,esi
 00504F7C    mov         eax,ebx
 00504F7E    call        TWinControl.KeyPress
 00504F83    test        byte ptr [ebx+2B5],20
>00504F8A    jne         00504FB0
 00504F8C    cmp         word ptr [esi],0D
>00504F90    jne         00504FB0
 00504F92    cmp         byte ptr [ebx+2FD],0
>00504F99    je          00504FA4
 00504F9B    mov         eax,ebx
 00504F9D    call        TCustomGrid.HideEditor
>00504FA2    jmp         00504FAB
 00504FA4    mov         eax,ebx
 00504FA6    call        TCustomGrid.ShowEditor
 00504FAB    mov         word ptr [esi],0
 00504FB0    pop         esi
 00504FB1    pop         ebx
 00504FB2    ret
*}
end;

//00504FB4
procedure TCustomGrid.MouseDown(Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer);
begin
{*
 00504FB4    push        ebp
 00504FB5    mov         ebp,esp
 00504FB7    add         esp,0FFFFFF78
 00504FBD    push        ebx
 00504FBE    push        esi
 00504FBF    push        edi
 00504FC0    mov         word ptr [ebp-6],cx
 00504FC4    mov         ebx,edx
 00504FC6    mov         dword ptr [ebp-4],eax
 00504FC9    mov         edi,dword ptr [ebp+0C]
 00504FCC    mov         byte ptr [ebp-11],0
 00504FD0    mov         eax,dword ptr [ebp-4]
 00504FD3    call        TCustomGrid.HideEdit
 00504FD8    mov         eax,dword ptr [ebp-4]
 00504FDB    test        byte ptr [eax+1C],10
>00504FDF    jne         00505025
 00504FE1    mov         eax,dword ptr [ebp-4]
 00504FE4    mov         si,0FFB6
 00504FE8    call        @CallDynaInst
 00504FED    test        al,al
>00504FEF    jne         00504FFF
 00504FF1    mov         dl,1
 00504FF3    mov         eax,dword ptr [ebp-4]
 00504FF6    call        GetParentForm
 00504FFB    test        eax,eax
>00504FFD    jne         00505025
 00504FFF    mov         eax,dword ptr [ebp-4]
 00505002    mov         edx,dword ptr [eax]
 00505004    call        dword ptr [edx+0E8]
 0050500A    mov         eax,dword ptr [ebp-4]
 0050500D    call        TCustomGrid.IsActiveControl
 00505012    test        al,al
>00505014    jne         00505025
 00505016    xor         edx,edx
 00505018    mov         eax,dword ptr [ebp-4]
 0050501B    call        TControl.SetMouseCapture
>00505020    jmp         005053C7
 00505025    test        bl,bl
>00505027    jne         00505040
 00505029    test        byte ptr [ebp-6],40
>0050502D    je          00505040
 0050502F    mov         eax,dword ptr [ebp-4]
 00505032    mov         si,0FFEB
 00505036    call        @CallDynaInst
>0050503B    jmp         00505384
 00505040    test        bl,bl
>00505042    jne         00505384
 00505048    lea         edx,[ebp-88]
 0050504E    mov         eax,dword ptr [ebp-4]
 00505051    call        TCustomGrid.CalcDrawInfo
 00505056    mov         eax,dword ptr [ebp-4]
 00505059    add         eax,318
 0050505E    push        eax
 0050505F    mov         eax,dword ptr [ebp-4]
 00505062    add         eax,2D0
 00505067    push        eax
 00505068    mov         eax,dword ptr [ebp-4]
 0050506B    add         eax,2D4
 00505070    push        eax
 00505071    mov         eax,dword ptr [ebp-4]
 00505074    add         eax,2D8
 00505079    push        eax
 0050507A    lea         eax,[ebp-88]
 00505080    push        eax
 00505081    mov         ecx,dword ptr [ebp+8]
 00505084    mov         edx,edi
 00505086    mov         eax,dword ptr [ebp-4]
 00505089    mov         esi,dword ptr [eax]
 0050508B    call        dword ptr [esi+0F0]
 00505091    mov         eax,dword ptr [ebp-4]
 00505094    cmp         byte ptr [eax+318],0
>0050509B    je          005050E6
 0050509D    mov         eax,dword ptr [ebp-4]
 005050A0    cmp         byte ptr [eax+318],3
>005050A7    jne         005050D3
 005050A9    mov         eax,dword ptr [ebp-4]
 005050AC    mov         si,0FFC7
 005050B0    call        @CallDynaInst
 005050B5    test        al,al
>005050B7    je          005050D3
 005050B9    mov         eax,dword ptr [ebp-4]
 005050BC    call        TControl.GetClientWidth
 005050C1    mov         edx,dword ptr [ebp-4]
 005050C4    sub         eax,dword ptr [edx+2D4]
 005050CA    mov         edx,dword ptr [ebp-4]
 005050CD    mov         dword ptr [edx+2D4],eax
 005050D3    lea         edx,[ebp-88]
 005050D9    mov         eax,dword ptr [ebp-4]
 005050DC    call        TCustomGrid.DrawSizingLine
>005050E1    jmp         005053C7
 005050E6    lea         eax,[ebp-88]
 005050EC    push        eax
 005050ED    lea         eax,[ebp-10]
 005050F0    push        eax
 005050F1    mov         ecx,dword ptr [ebp+8]
 005050F4    mov         edx,edi
 005050F6    mov         eax,dword ptr [ebp-4]
 005050F9    call        TCustomGrid.CalcCoordFromPoint
 005050FE    mov         eax,dword ptr [ebp-4]
 00505101    mov         eax,dword ptr [eax+29C]
 00505107    mov         esi,dword ptr [ebp-10]
 0050510A    cmp         eax,esi
>0050510C    jg          005051CC
 00505112    mov         eax,dword ptr [ebp-4]
 00505115    mov         eax,dword ptr [eax+2A0]
 0050511B    cmp         eax,dword ptr [ebp-0C]
>0050511E    jg          005051CC
 00505124    mov         eax,dword ptr [ebp-4]
 00505127    test        byte ptr [eax+2B5],4
>0050512E    je          00505182
 00505130    mov         edx,dword ptr [ebp-4]
 00505133    mov         edx,dword ptr [edx+288]
 00505139    mov         eax,dword ptr [ebp-10]
 0050513C    cmp         edx,eax
>0050513E    jne         00505158
 00505140    mov         edx,dword ptr [ebp-4]
 00505143    mov         edx,dword ptr [edx+28C]
 00505149    cmp         edx,dword ptr [ebp-0C]
>0050514C    jne         00505158
 0050514E    mov         eax,dword ptr [ebp-4]
 00505151    call        TCustomGrid.ShowEditor
>00505156    jmp         00505171
 00505158    push        1
 0050515A    push        1
 0050515C    mov         ecx,dword ptr [ebp-0C]
 0050515F    mov         edx,eax
 00505161    mov         eax,dword ptr [ebp-4]
 00505164    call        TCustomGrid.MoveCurrent
 00505169    mov         eax,dword ptr [ebp-4]
 0050516C    call        TCustomGrid.UpdateEdit
 00505171    mov         eax,dword ptr [ebp-4]
 00505174    mov         si,0FFEC
 00505178    call        @CallDynaInst
>0050517D    jmp         00505384
 00505182    mov         eax,dword ptr [ebp-4]
 00505185    mov         byte ptr [eax+318],1
 0050518C    push        0
 0050518E    push        3C
 00505190    push        1
 00505192    mov         eax,dword ptr [ebp-4]
 00505195    call        TWinControl.GetHandle
 0050519A    push        eax
 0050519B    call        user32.SetTimer
 005051A0    test        byte ptr [ebp-6],1
>005051A4    je          005051B6
 005051A6    lea         edx,[ebp-10]
 005051A9    mov         eax,dword ptr [ebp-4]
 005051AC    call        TCustomGrid.MoveAnchor
>005051B1    jmp         00505384
 005051B6    push        1
 005051B8    push        1
 005051BA    mov         ecx,dword ptr [ebp-0C]
 005051BD    mov         edx,esi
 005051BF    mov         eax,dword ptr [ebp-4]
 005051C2    call        TCustomGrid.MoveCurrent
>005051C7    jmp         00505384
 005051CC    mov         eax,dword ptr [ebp-4]
 005051CF    cmp         dword ptr [eax+328],0FFFFFFFF
>005051D6    jne         005051E4
 005051D8    mov         eax,dword ptr [ebp-4]
 005051DB    cmp         dword ptr [eax+32C],0FFFFFFFF
>005051E2    je          00505211
 005051E4    mov         eax,dword ptr [ebp-4]
 005051E7    mov         byte ptr [eax+330],1
 005051EE    mov         eax,dword ptr [ebp-4]
 005051F1    mov         byte ptr [eax+331],bl
 005051F7    mov         eax,dword ptr [ebp-4]
 005051FA    mov         ecx,dword ptr [eax+32C]
 00505200    mov         eax,dword ptr [ebp-4]
 00505203    mov         edx,dword ptr [eax+328]
 00505209    mov         eax,dword ptr [ebp-4]
 0050520C    call        TCustomGrid.InvalidateCell
 00505211    mov         eax,dword ptr [ebp-4]
 00505214    test        byte ptr [eax+2B5],1
>0050521B    je          005052D1
 00505221    cmp         dword ptr [ebp-10],0
>00505225    jl          005052D1
 0050522B    mov         eax,dword ptr [ebp-4]
 0050522E    mov         eax,dword ptr [eax+29C]
 00505234    cmp         eax,dword ptr [ebp-10]
>00505237    jle         005052D1
 0050523D    mov         eax,dword ptr [ebp-4]
 00505240    mov         eax,dword ptr [eax+2A0]
 00505246    cmp         eax,dword ptr [ebp-0C]
>00505249    jg          005052D1
 0050524F    mov         edx,dword ptr [ebp-4]
 00505252    mov         eax,dword ptr [ebp-0C]
 00505255    mov         dword ptr [edx+2DC],eax
 0050525B    mov         edx,dword ptr [ebp-4]
 0050525E    mov         dword ptr [edx+2E0],eax
 00505264    mov         dword ptr [ebp-1C],edi
 00505267    mov         eax,dword ptr [ebp+8]
 0050526A    mov         dword ptr [ebp-18],eax
 0050526D    lea         eax,[ebp-1C]
 00505270    push        eax
 00505271    mov         eax,dword ptr [ebp-4]
 00505274    lea         ecx,[eax+2E0]
 0050527A    mov         eax,dword ptr [ebp-4]
 0050527D    lea         edx,[eax+2DC]
 00505283    mov         eax,dword ptr [ebp-4]
 00505286    mov         si,0FF9D
 0050528A    call        @CallDynaInst
 0050528F    test        al,al
>00505291    je          00505384
 00505297    mov         eax,dword ptr [ebp-4]
 0050529A    mov         byte ptr [eax+318],4
 005052A1    mov         eax,dword ptr [ebp-4]
 005052A4    mov         edx,dword ptr [eax]
 005052A6    call        dword ptr [edx+9C]
 005052AC    mov         eax,dword ptr [ebp-4]
 005052AF    call        TCustomGrid.DrawMove
 005052B4    mov         byte ptr [ebp-11],1
 005052B8    push        0
 005052BA    push        3C
 005052BC    push        1
 005052BE    mov         eax,dword ptr [ebp-4]
 005052C1    call        TWinControl.GetHandle
 005052C6    push        eax
 005052C7    call        user32.SetTimer
>005052CC    jmp         00505384
 005052D1    mov         eax,dword ptr [ebp-4]
 005052D4    test        byte ptr [eax+2B5],2
>005052DB    je          00505384
 005052E1    cmp         dword ptr [ebp-0C],0
>005052E5    jl          00505384
 005052EB    mov         eax,dword ptr [ebp-4]
 005052EE    mov         eax,dword ptr [eax+2A0]
 005052F4    cmp         eax,dword ptr [ebp-0C]
>005052F7    jle         00505384
 005052FD    mov         eax,dword ptr [ebp-4]
 00505300    mov         eax,dword ptr [eax+29C]
 00505306    cmp         eax,dword ptr [ebp-10]
>00505309    jg          00505384
 0050530B    mov         edx,dword ptr [ebp-4]
 0050530E    mov         eax,dword ptr [ebp-10]
 00505311    mov         dword ptr [edx+2DC],eax
 00505317    mov         edx,dword ptr [ebp-4]
 0050531A    mov         dword ptr [edx+2E0],eax
 00505320    mov         dword ptr [ebp-24],edi
 00505323    mov         eax,dword ptr [ebp+8]
 00505326    mov         dword ptr [ebp-20],eax
 00505329    lea         eax,[ebp-24]
 0050532C    push        eax
 0050532D    mov         eax,dword ptr [ebp-4]
 00505330    lea         ecx,[eax+2E0]
 00505336    mov         eax,dword ptr [ebp-4]
 00505339    lea         edx,[eax+2DC]
 0050533F    mov         eax,dword ptr [ebp-4]
 00505342    mov         si,0FF9E
 00505346    call        @CallDynaInst
 0050534B    test        al,al
>0050534D    je          00505384
 0050534F    mov         eax,dword ptr [ebp-4]
 00505352    mov         byte ptr [eax+318],5
 00505359    mov         eax,dword ptr [ebp-4]
 0050535C    mov         edx,dword ptr [eax]
 0050535E    call        dword ptr [edx+9C]
 00505364    mov         eax,dword ptr [ebp-4]
 00505367    call        TCustomGrid.DrawMove
 0050536C    mov         byte ptr [ebp-11],1
 00505370    push        0
 00505372    push        3C
 00505374    push        1
 00505376    mov         eax,dword ptr [ebp-4]
 00505379    call        TWinControl.GetHandle
 0050537E    push        eax
 0050537F    call        user32.SetTimer
 00505384    xor         eax,eax
 00505386    push        ebp
 00505387    push        5053AF
 0050538C    push        dword ptr fs:[eax]
 0050538F    mov         dword ptr fs:[eax],esp
 00505392    push        edi
 00505393    mov         eax,dword ptr [ebp+8]
 00505396    push        eax
 00505397    movzx       ecx,word ptr [ebp-6]
 0050539B    mov         edx,ebx
 0050539D    mov         eax,dword ptr [ebp-4]
 005053A0    call        TControl.MouseDown
 005053A5    xor         eax,eax
 005053A7    pop         edx
 005053A8    pop         ecx
 005053A9    pop         ecx
 005053AA    mov         dword ptr fs:[eax],edx
>005053AD    jmp         005053C7
>005053AF    jmp         @HandleAnyException
 005053B4    cmp         byte ptr [ebp-11],0
>005053B8    je          005053C2
 005053BA    mov         eax,dword ptr [ebp-4]
 005053BD    call        TCustomGrid.DrawMove
 005053C2    call        @DoneExcept
 005053C7    pop         edi
 005053C8    pop         esi
 005053C9    pop         ebx
 005053CA    mov         esp,ebp
 005053CC    pop         ebp
 005053CD    ret         8
*}
end;

//005053D0
procedure TCustomGrid.MouseMove(Shift:TShiftState; X:Integer; Y:Integer);
begin
{*
 005053D0    push        ebp
 005053D1    mov         ebp,esp
 005053D3    add         esp,0FFFFFF80
 005053D6    push        ebx
 005053D7    push        esi
 005053D8    push        edi
 005053D9    mov         esi,ecx
 005053DB    mov         word ptr [ebp-2],dx
 005053DF    mov         ebx,eax
 005053E1    mov         edi,dword ptr [ebp+8]
 005053E4    lea         edx,[ebp-80]
 005053E7    mov         eax,ebx
 005053E9    call        TCustomGrid.CalcDrawInfo
 005053EE    movzx       eax,byte ptr [ebx+318]
 005053F5    dec         al
>005053F7    je          0050540A
 005053F9    dec         eax
 005053FA    sub         al,2
>005053FC    jb          005054DF
 00505402    sub         al,2
>00505404    jae         0050551F
 0050540A    lea         eax,[ebp-80]
 0050540D    push        eax
 0050540E    lea         eax,[ebp-0C]
 00505411    push        eax
 00505412    mov         ecx,edi
 00505414    mov         edx,esi
 00505416    mov         eax,ebx
 00505418    call        TCustomGrid.CalcCoordFromPoint
 0050541D    mov         eax,dword ptr [ebp-0C]
 00505420    cmp         eax,dword ptr [ebx+29C]
>00505426    jl          00505609
 0050542C    mov         edx,dword ptr [ebp-8]
 0050542F    cmp         edx,dword ptr [ebx+2A0]
>00505435    jl          00505609
 0050543B    mov         edx,dword ptr [ebp-70]
 0050543E    inc         edx
 0050543F    cmp         eax,edx
>00505441    jg          00505609
 00505447    mov         edx,dword ptr [ebp-40]
 0050544A    inc         edx
 0050544B    cmp         edx,dword ptr [ebp-8]
>0050544E    jl          00505609
 00505454    movzx       edx,byte ptr [ebx+318]
 0050545B    dec         dl
>0050545D    je          0050546D
 0050545F    sub         dl,3
>00505462    je          005054BA
 00505464    dec         dl
>00505466    je          00505496
>00505468    jmp         00505609
 0050546D    mov         eax,dword ptr [ebp-0C]
 00505470    cmp         eax,dword ptr [ebx+278]
>00505476    jne         00505487
 00505478    mov         eax,dword ptr [ebp-8]
 0050547B    cmp         eax,dword ptr [ebx+27C]
>00505481    je          00505609
 00505487    lea         edx,[ebp-0C]
 0050548A    mov         eax,ebx
 0050548C    call        TCustomGrid.MoveAnchor
>00505491    jmp         00505609
 00505496    mov         dword ptr [ebp-14],esi
 00505499    mov         dword ptr [ebp-10],edi
 0050549C    lea         edx,[ebp-80]
 0050549F    push        edx
 005054A0    lea         edx,[ebp-80]
 005054A3    push        edx
 005054A4    push        0
 005054A6    lea         edx,[ebp-14]
 005054A9    push        edx
 005054AA    mov         ecx,eax
 005054AC    mov         edx,esi
 005054AE    mov         eax,ebx
 005054B0    call        TCustomGrid.MoveAndScroll
>005054B5    jmp         00505609
 005054BA    mov         dword ptr [ebp-1C],esi
 005054BD    mov         dword ptr [ebp-18],edi
 005054C0    lea         eax,[ebp-80]
 005054C3    push        eax
 005054C4    lea         eax,[ebp-50]
 005054C7    push        eax
 005054C8    push        1
 005054CA    lea         eax,[ebp-1C]
 005054CD    push        eax
 005054CE    mov         ecx,dword ptr [ebp-8]
 005054D1    mov         edx,edi
 005054D3    mov         eax,ebx
 005054D5    call        TCustomGrid.MoveAndScroll
>005054DA    jmp         00505609
 005054DF    lea         edx,[ebp-80]
 005054E2    mov         eax,ebx
 005054E4    call        TCustomGrid.DrawSizingLine
 005054E9    cmp         byte ptr [ebx+318],2
>005054F0    jne         00505502
 005054F2    mov         eax,dword ptr [ebx+2D8]
 005054F8    add         eax,edi
 005054FA    mov         dword ptr [ebx+2D4],eax
>00505500    jmp         00505510
 00505502    mov         eax,dword ptr [ebx+2D8]
 00505508    add         eax,esi
 0050550A    mov         dword ptr [ebx+2D4],eax
 00505510    lea         edx,[ebp-80]
 00505513    mov         eax,ebx
 00505515    call        TCustomGrid.DrawSizingLine
>0050551A    jmp         00505609
 0050551F    test        byte ptr [ebx+1C],10
>00505523    jne         00505617
 00505529    lea         eax,[ebp-80]
 0050552C    push        eax
 0050552D    lea         eax,[ebp-0C]
 00505530    push        eax
 00505531    mov         ecx,edi
 00505533    mov         edx,esi
 00505535    mov         eax,ebx
 00505537    call        TCustomGrid.CalcCoordFromPoint
 0050553C    test        byte ptr [ebx+2B6],1
>00505543    je          00505550
 00505545    mov         eax,dword ptr [ebp-8]
 00505548    cmp         eax,dword ptr [ebx+2A0]
>0050554E    jle         00505564
 00505550    test        byte ptr [ebx+2B5],80
>00505557    je          005055CB
 00505559    mov         eax,dword ptr [ebp-0C]
 0050555C    cmp         eax,dword ptr [ebx+29C]
>00505562    jg          005055CB
 00505564    mov         eax,dword ptr [ebx+328]
 0050556A    cmp         eax,0FFFFFFFF
>0050556D    jne         00505578
 0050556F    cmp         dword ptr [ebx+32C],0FFFFFFFF
>00505576    je          00505587
 00505578    mov         ecx,dword ptr [ebx+32C]
 0050557E    mov         edx,eax
 00505580    mov         eax,ebx
 00505582    call        TCustomGrid.InvalidateCell
 00505587    mov         eax,dword ptr [ebp-0C]
 0050558A    cmp         eax,dword ptr [ebx+328]
>00505590    jne         0050559D
 00505592    mov         eax,dword ptr [ebp-8]
 00505595    cmp         eax,dword ptr [ebx+32C]
>0050559B    je          00505609
 0050559D    mov         eax,dword ptr [ebp-0C]
 005055A0    mov         dword ptr [ebx+328],eax
 005055A6    mov         eax,dword ptr [ebp-8]
 005055A9    mov         dword ptr [ebx+32C],eax
 005055AF    mov         byte ptr [ebx+330],0
 005055B6    mov         ecx,dword ptr [ebx+32C]
 005055BC    mov         edx,dword ptr [ebx+328]
 005055C2    mov         eax,ebx
 005055C4    call        TCustomGrid.InvalidateCell
>005055C9    jmp         00505609
 005055CB    mov         eax,dword ptr [ebx+328]
 005055D1    cmp         eax,0FFFFFFFF
>005055D4    jne         005055DF
 005055D6    cmp         dword ptr [ebx+32C],0FFFFFFFF
>005055DD    je          00505609
 005055DF    mov         ecx,dword ptr [ebx+32C]
 005055E5    mov         edx,eax
 005055E7    mov         eax,ebx
 005055E9    call        TCustomGrid.InvalidateCell
 005055EE    mov         dword ptr [ebx+328],0FFFFFFFF
 005055F8    mov         dword ptr [ebx+32C],0FFFFFFFF
 00505602    mov         byte ptr [ebx+330],0
 00505609    push        edi
 0050560A    mov         ecx,esi
 0050560C    movzx       edx,word ptr [ebp-2]
 00505610    mov         eax,ebx
 00505612    call        TControl.MouseMove
 00505617    pop         edi
 00505618    pop         esi
 00505619    pop         ebx
 0050561A    mov         esp,ebp
 0050561C    pop         ebp
 0050561D    ret         4
*}
end;

//00505620
function ResizeLine(const AxisInfo:TGridAxisDrawInfo):Integer;
begin
{*
 00505620    push        ebp
 00505621    mov         ebp,esp
 00505623    add         esp,0FFFFFFF8
 00505626    push        ebx
 00505627    push        esi
 00505628    mov         ebx,eax
 0050562A    mov         eax,dword ptr [ebx+4]
 0050562D    mov         dword ptr [ebp-4],eax
 00505630    mov         eax,dword ptr [ebx+1C]
 00505633    mov         edx,dword ptr [ebp+8]
 00505636    mov         edx,dword ptr [edx-4]
 00505639    mov         esi,dword ptr [edx+2D0]
 0050563F    dec         esi
 00505640    sub         esi,eax
>00505642    jl          0050565C
 00505644    inc         esi
 00505645    mov         dword ptr [ebp-8],eax
 00505648    mov         edx,dword ptr [ebp-8]
 0050564B    mov         eax,dword ptr [ebx+2C]
 0050564E    call        dword ptr [ebx+28]
 00505651    add         eax,dword ptr [ebx]
 00505653    add         dword ptr [ebp-4],eax
 00505656    inc         dword ptr [ebp-8]
 00505659    dec         esi
>0050565A    jne         00505648
 0050565C    mov         eax,dword ptr [ebp+8]
 0050565F    mov         eax,dword ptr [eax-4]
 00505662    mov         eax,dword ptr [eax+2D4]
 00505668    sub         eax,dword ptr [ebp-4]
 0050566B    mov         dword ptr [ebp-4],eax
 0050566E    mov         eax,dword ptr [ebp-4]
 00505671    pop         esi
 00505672    pop         ebx
 00505673    pop         ecx
 00505674    pop         ecx
 00505675    pop         ebp
 00505676    ret
*}
end;

//00505678
procedure TCustomGrid.MouseUp(Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer);
begin
{*
 00505678    push        ebp
 00505679    mov         ebp,esp
 0050567B    add         esp,0FFFFFF80
 0050567E    push        ebx
 0050567F    push        esi
 00505680    push        edi
 00505681    mov         word ptr [ebp-7],cx
 00505685    mov         byte ptr [ebp-5],dl
 00505688    mov         dword ptr [ebp-4],eax
 0050568B    mov         edi,dword ptr [ebp+8]
 0050568E    mov         ebx,dword ptr [ebp+0C]
 00505691    xor         ecx,ecx
 00505693    push        ebp
 00505694    push        50598B
 00505699    push        dword ptr fs:[ecx]
 0050569C    mov         dword ptr fs:[ecx],esp
 0050569F    mov         eax,dword ptr [ebp-4]
 005056A2    movzx       eax,byte ptr [eax+318]
 005056A9    dec         al
>005056AB    je          005056C5
 005056AD    dec         eax
 005056AE    sub         al,2
>005056B0    jb          00505701
>005056B2    je          0050583A
 005056B8    dec         al
>005056BA    je          005057BF
>005056C0    jmp         005058B5
 005056C5    push        edi
 005056C6    mov         ecx,ebx
 005056C8    movzx       edx,word ptr [ebp-7]
 005056CC    mov         eax,dword ptr [ebp-4]
 005056CF    mov         si,0FFD4
 005056D3    call        @CallDynaInst
 005056D8    push        1
 005056DA    mov         eax,dword ptr [ebp-4]
 005056DD    call        TWinControl.GetHandle
 005056E2    push        eax
 005056E3    call        user32.KillTimer
 005056E8    mov         eax,dword ptr [ebp-4]
 005056EB    call        TCustomGrid.UpdateEdit
 005056F0    mov         eax,dword ptr [ebp-4]
 005056F3    mov         si,0FFEC
 005056F7    call        @CallDynaInst
>005056FC    jmp         0050593D
 00505701    lea         edx,[ebp-80]
 00505704    mov         eax,dword ptr [ebp-4]
 00505707    call        TCustomGrid.CalcDrawInfo
 0050570C    lea         edx,[ebp-80]
 0050570F    mov         eax,dword ptr [ebp-4]
 00505712    call        TCustomGrid.DrawSizingLine
 00505717    mov         eax,dword ptr [ebp-4]
 0050571A    cmp         byte ptr [eax+318],3
>00505721    jne         0050574D
 00505723    mov         eax,dword ptr [ebp-4]
 00505726    mov         si,0FFC7
 0050572A    call        @CallDynaInst
 0050572F    test        al,al
>00505731    je          0050574D
 00505733    mov         eax,dword ptr [ebp-4]
 00505736    call        TControl.GetClientWidth
 0050573B    mov         edx,dword ptr [ebp-4]
 0050573E    sub         eax,dword ptr [edx+2D4]
 00505744    mov         edx,dword ptr [ebp-4]
 00505747    mov         dword ptr [edx+2D4],eax
 0050574D    mov         eax,dword ptr [ebp-4]
 00505750    cmp         byte ptr [eax+318],3
>00505757    jne         0050578C
 00505759    push        ebp
 0050575A    lea         eax,[ebp-80]
 0050575D    call        ResizeLine
 00505762    pop         ecx
 00505763    cmp         eax,1
>00505766    jle         0050593D
 0050576C    mov         edx,dword ptr [ebp-4]
 0050576F    mov         edx,dword ptr [edx+2D0]
 00505775    mov         ecx,eax
 00505777    mov         eax,dword ptr [ebp-4]
 0050577A    call        TCustomGrid.SetColWidths
 0050577F    mov         eax,dword ptr [ebp-4]
 00505782    call        TCustomGrid.UpdateDesigner
>00505787    jmp         0050593D
 0050578C    push        ebp
 0050578D    lea         eax,[ebp-50]
 00505790    call        ResizeLine
 00505795    pop         ecx
 00505796    cmp         eax,1
>00505799    jle         0050593D
 0050579F    mov         edx,dword ptr [ebp-4]
 005057A2    mov         edx,dword ptr [edx+2D0]
 005057A8    mov         ecx,eax
 005057AA    mov         eax,dword ptr [ebp-4]
 005057AD    call        TCustomGrid.SetRowHeights
 005057B2    mov         eax,dword ptr [ebp-4]
 005057B5    call        TCustomGrid.UpdateDesigner
>005057BA    jmp         0050593D
 005057BF    mov         eax,dword ptr [ebp-4]
 005057C2    call        TCustomGrid.DrawMove
 005057C7    push        1
 005057C9    mov         eax,dword ptr [ebp-4]
 005057CC    call        TWinControl.GetHandle
 005057D1    push        eax
 005057D2    call        user32.KillTimer
 005057D7    mov         dword ptr [ebp-18],ebx
 005057DA    mov         dword ptr [ebp-14],edi
 005057DD    lea         eax,[ebp-18]
 005057E0    push        eax
 005057E1    mov         eax,dword ptr [ebp-4]
 005057E4    lea         ecx,[eax+2E0]
 005057EA    mov         eax,dword ptr [ebp-4]
 005057ED    lea         edx,[eax+2DC]
 005057F3    mov         eax,dword ptr [ebp-4]
 005057F6    mov         si,0FF9A
 005057FA    call        @CallDynaInst
 005057FF    test        al,al
>00505801    je          0050582D
 00505803    mov         edx,dword ptr [ebp-4]
 00505806    mov         edx,dword ptr [edx+2E0]
 0050580C    mov         eax,dword ptr [ebp-4]
 0050580F    mov         eax,dword ptr [eax+2DC]
 00505815    cmp         edx,eax
>00505817    je          0050582D
 00505819    mov         ecx,edx
 0050581B    mov         edx,eax
 0050581D    mov         eax,dword ptr [ebp-4]
 00505820    call        TCustomGrid.MoveColumn
 00505825    mov         eax,dword ptr [ebp-4]
 00505828    call        TCustomGrid.UpdateDesigner
 0050582D    mov         eax,dword ptr [ebp-4]
 00505830    call        TCustomGrid.UpdateEdit
>00505835    jmp         0050593D
 0050583A    mov         eax,dword ptr [ebp-4]
 0050583D    call        TCustomGrid.DrawMove
 00505842    push        1
 00505844    mov         eax,dword ptr [ebp-4]
 00505847    call        TWinControl.GetHandle
 0050584C    push        eax
 0050584D    call        user32.KillTimer
 00505852    mov         dword ptr [ebp-20],ebx
 00505855    mov         dword ptr [ebp-1C],edi
 00505858    lea         eax,[ebp-20]
 0050585B    push        eax
 0050585C    mov         eax,dword ptr [ebp-4]
 0050585F    lea         ecx,[eax+2E0]
 00505865    mov         eax,dword ptr [ebp-4]
 00505868    lea         edx,[eax+2DC]
 0050586E    mov         eax,dword ptr [ebp-4]
 00505871    mov         si,0FF99
 00505875    call        @CallDynaInst
 0050587A    test        al,al
>0050587C    je          005058A8
 0050587E    mov         edx,dword ptr [ebp-4]
 00505881    mov         edx,dword ptr [edx+2E0]
 00505887    mov         eax,dword ptr [ebp-4]
 0050588A    mov         eax,dword ptr [eax+2DC]
 00505890    cmp         edx,eax
>00505892    je          005058A8
 00505894    mov         ecx,edx
 00505896    mov         edx,eax
 00505898    mov         eax,dword ptr [ebp-4]
 0050589B    call        TCustomGrid.MoveRow
 005058A0    mov         eax,dword ptr [ebp-4]
 005058A3    call        TCustomGrid.UpdateDesigner
 005058A8    mov         eax,dword ptr [ebp-4]
 005058AB    call        TCustomGrid.UpdateEdit
>005058B0    jmp         0050593D
 005058B5    mov         eax,dword ptr [ebp-4]
 005058B8    call        TCustomGrid.UpdateEdit
 005058BD    lea         eax,[ebp-10]
 005058C0    push        eax
 005058C1    mov         ecx,edi
 005058C3    mov         edx,ebx
 005058C5    mov         eax,dword ptr [ebp-4]
 005058C8    call        TCustomGrid.MouseCoord
 005058CD    cmp         byte ptr [ebp-5],0
>005058D1    jne         0050593D
 005058D3    mov         eax,dword ptr [ebp-4]
 005058D6    cmp         dword ptr [eax+328],0FFFFFFFF
>005058DD    je          0050593D
 005058DF    mov         eax,dword ptr [ebp-4]
 005058E2    cmp         dword ptr [eax+32C],0FFFFFFFF
>005058E9    je          0050593D
 005058EB    mov         eax,dword ptr [ebp-4]
 005058EE    test        byte ptr [eax+2B5],80
>005058F5    je          0050590B
 005058F7    mov         eax,dword ptr [ebp-4]
 005058FA    mov         eax,dword ptr [eax+29C]
 00505900    cmp         eax,dword ptr [ebp-10]
>00505903    jle         0050590B
 00505905    cmp         dword ptr [ebp-10],0
>00505909    jge         0050592B
 0050590B    mov         eax,dword ptr [ebp-4]
 0050590E    test        byte ptr [eax+2B6],1
>00505915    je          0050593D
 00505917    mov         eax,dword ptr [ebp-4]
 0050591A    mov         eax,dword ptr [eax+2A0]
 00505920    cmp         eax,dword ptr [ebp-0C]
>00505923    jle         0050593D
 00505925    cmp         dword ptr [ebp-0C],0
>00505929    jl          0050593D
 0050592B    mov         ecx,dword ptr [ebp-0C]
 0050592E    mov         edx,dword ptr [ebp-10]
 00505931    mov         eax,dword ptr [ebp-4]
 00505934    mov         si,0FFAB
 00505938    call        @CallDynaInst
 0050593D    push        ebx
 0050593E    push        edi
 0050593F    movzx       ecx,word ptr [ebp-7]
 00505943    movzx       edx,byte ptr [ebp-5]
 00505947    mov         eax,dword ptr [ebp-4]
 0050594A    call        TControl.MouseUp
 0050594F    xor         eax,eax
 00505951    pop         edx
 00505952    pop         ecx
 00505953    pop         ecx
 00505954    mov         dword ptr fs:[eax],edx
 00505957    push        505992
 0050595C    mov         eax,dword ptr [ebp-4]
 0050595F    mov         byte ptr [eax+318],0
 00505966    mov         eax,dword ptr [ebp-4]
 00505969    mov         byte ptr [eax+330],0
 00505970    mov         eax,dword ptr [ebp-4]
 00505973    mov         ecx,dword ptr [eax+32C]
 00505979    mov         eax,dword ptr [ebp-4]
 0050597C    mov         edx,dword ptr [eax+328]
 00505982    mov         eax,dword ptr [ebp-4]
 00505985    call        TCustomGrid.InvalidateCell
 0050598A    ret
>0050598B    jmp         @HandleFinally
>00505990    jmp         0050595C
 00505992    pop         edi
 00505993    pop         esi
 00505994    pop         ebx
 00505995    mov         esp,ebp
 00505997    pop         ebp
 00505998    ret         8
*}
end;

//0050599C
procedure TCustomGrid.MoveAndScroll(Mouse:Integer; CellHit:Integer; var DrawInfo:TGridDrawInfo; var Axis:TGridAxisDrawInfo; Scrollbar:Integer; const MousePt:TPoint);
begin
{*
 0050599C    push        ebp
 0050599D    mov         ebp,esp
 0050599F    add         esp,0FFFFFFF8
 005059A2    push        ebx
 005059A3    push        esi
 005059A4    push        edi
 005059A5    mov         dword ptr [ebp-8],ecx
 005059A8    mov         dword ptr [ebp-4],edx
 005059AB    mov         ebx,eax
 005059AD    mov         edi,dword ptr [ebp+10]
 005059B0    mov         eax,ebx
 005059B2    mov         si,0FFC7
 005059B6    call        @CallDynaInst
 005059BB    test        al,al
>005059BD    je          005059D2
 005059BF    cmp         dword ptr [ebp+0C],0
>005059C3    jne         005059D2
 005059C5    mov         eax,ebx
 005059C7    call        TControl.GetClientWidth
 005059CC    sub         eax,dword ptr [ebp-4]
 005059CF    mov         dword ptr [ebp-4],eax
 005059D2    mov         eax,dword ptr [ebp-8]
 005059D5    cmp         eax,dword ptr [ebx+2E0]
>005059DB    je          00505B0B
 005059E1    mov         eax,dword ptr [edi+18]
 005059E4    cmp         eax,dword ptr [ebx+2E0]
>005059EA    jne         005059F8
 005059EC    mov         eax,dword ptr [edi+4]
 005059EF    cmp         eax,dword ptr [ebp-4]
>005059F2    jg          00505B0B
 005059F8    mov         eax,dword ptr [edi+20]
 005059FB    dec         eax
 005059FC    cmp         eax,dword ptr [ebx+2E0]
>00505A02    jne         00505A10
 00505A04    mov         eax,dword ptr [edi+8]
 00505A07    cmp         eax,dword ptr [ebp-4]
>00505A0A    jl          00505B0B
 00505A10    mov         eax,ebx
 00505A12    call        TCustomGrid.DrawMove
 00505A17    mov         eax,dword ptr [edi+4]
 00505A1A    cmp         eax,dword ptr [ebp-4]
>00505A1D    jle         00505A56
 00505A1F    mov         eax,dword ptr [edi+18]
 00505A22    cmp         eax,dword ptr [ebx+2E0]
>00505A28    jge         00505A4E
 00505A2A    push        0
 00505A2C    push        0
 00505A2E    xor         ecx,ecx
 00505A30    mov         edx,dword ptr [ebp+0C]
 00505A33    mov         eax,ebx
 00505A35    call        TCustomGrid.ModifyScrollBar
 00505A3A    mov         eax,ebx
 00505A3C    mov         edx,dword ptr [eax]
 00505A3E    call        dword ptr [edx+9C]
 00505A44    mov         edx,dword ptr [ebp+14]
 00505A47    mov         eax,ebx
 00505A49    call        TCustomGrid.CalcDrawInfo
 00505A4E    mov         eax,dword ptr [edi+1C]
 00505A51    mov         dword ptr [ebp-8],eax
>00505A54    jmp         00505AB1
 00505A56    mov         eax,dword ptr [edi+14]
 00505A59    cmp         eax,dword ptr [ebp-4]
>00505A5C    jg          00505AA2
 00505A5E    mov         edx,dword ptr [edi+10]
 00505A61    mov         eax,dword ptr [ebx+2E0]
 00505A67    cmp         edx,eax
>00505A69    jne         00505A9A
 00505A6B    mov         edx,dword ptr [edi+20]
 00505A6E    dec         edx
 00505A6F    cmp         eax,edx
>00505A71    jge         00505A9A
 00505A73    push        0
 00505A75    push        0
 00505A77    mov         ecx,1
 00505A7C    mov         edx,dword ptr [ebp+0C]
 00505A7F    mov         eax,ebx
 00505A81    call        TCustomGrid.ModifyScrollBar
 00505A86    mov         eax,ebx
 00505A88    mov         edx,dword ptr [eax]
 00505A8A    call        dword ptr [edx+9C]
 00505A90    mov         edx,dword ptr [ebp+14]
 00505A93    mov         eax,ebx
 00505A95    call        TCustomGrid.CalcDrawInfo
 00505A9A    mov         eax,dword ptr [edi+10]
 00505A9D    mov         dword ptr [ebp-8],eax
>00505AA0    jmp         00505AB1
 00505AA2    cmp         dword ptr [ebp-8],0
>00505AA6    jge         00505AB1
 00505AA8    mov         eax,dword ptr [ebx+2E0]
 00505AAE    mov         dword ptr [ebp-8],eax
 00505AB1    cmp         byte ptr [ebx+318],5
>00505AB8    jne         00505AD6
 00505ABA    mov         eax,dword ptr [ebp+8]
 00505ABD    push        eax
 00505ABE    lea         ecx,[ebp-8]
 00505AC1    lea         edx,[ebx+2DC]
 00505AC7    mov         eax,ebx
 00505AC9    mov         si,0FF9C
 00505ACD    call        @CallDynaInst
 00505AD2    test        al,al
>00505AD4    jne         00505AFB
 00505AD6    cmp         byte ptr [ebx+318],4
>00505ADD    jne         00505B04
 00505ADF    mov         eax,dword ptr [ebp+8]
 00505AE2    push        eax
 00505AE3    lea         ecx,[ebp-8]
 00505AE6    lea         edx,[ebx+2DC]
 00505AEC    mov         eax,ebx
 00505AEE    mov         si,0FF9B
 00505AF2    call        @CallDynaInst
 00505AF7    test        al,al
>00505AF9    je          00505B04
 00505AFB    mov         eax,dword ptr [ebp-8]
 00505AFE    mov         dword ptr [ebx+2E0],eax
 00505B04    mov         eax,ebx
 00505B06    call        TCustomGrid.DrawMove
 00505B0B    pop         edi
 00505B0C    pop         esi
 00505B0D    pop         ebx
 00505B0E    pop         ecx
 00505B0F    pop         ecx
 00505B10    pop         ebp
 00505B11    ret         10
*}
end;

//00505B14
function TCustomGrid.GetColWidths(Index:LongInt):Integer;
begin
{*
 00505B14    mov         ecx,dword ptr [eax+300]
 00505B1A    test        ecx,ecx
>00505B1C    je          00505B26
 00505B1E    cmp         edx,dword ptr [eax+284]
>00505B24    jl          00505B2D
 00505B26    mov         eax,dword ptr [eax+290]
 00505B2C    ret
 00505B2D    mov         eax,dword ptr [ecx+edx*4+4]
 00505B31    ret
*}
end;

//00505B34
function TCustomGrid.GetRowHeights(Index:LongInt):Integer;
begin
{*
 00505B34    mov         ecx,dword ptr [eax+304]
 00505B3A    test        ecx,ecx
>00505B3C    je          00505B46
 00505B3E    cmp         edx,dword ptr [eax+2C0]
>00505B44    jl          00505B4D
 00505B46    mov         eax,dword ptr [eax+294]
 00505B4C    ret
 00505B4D    mov         eax,dword ptr [ecx+edx*4+4]
 00505B51    ret
*}
end;

//00505B54
function TCustomGrid.GetGridWidth:Integer;
begin
{*
 00505B54    add         esp,0FFFFFFA0
 00505B57    mov         edx,esp
 00505B59    call        TCustomGrid.CalcDrawInfo
 00505B5E    mov         eax,dword ptr [esp+8]
 00505B62    add         esp,60
 00505B65    ret
*}
end;

//00505B68
function TCustomGrid.GetGridHeight:Integer;
begin
{*
 00505B68    add         esp,0FFFFFFA0
 00505B6B    mov         edx,esp
 00505B6D    call        TCustomGrid.CalcDrawInfo
 00505B72    mov         eax,dword ptr [esp+38]
 00505B76    add         esp,60
 00505B79    ret
*}
end;

//00505B7C
function TCustomGrid.GetSelection:TGridRect;
begin
{*
 00505B7C    push        ebx
 00505B7D    push        esi
 00505B7E    mov         esi,edx
 00505B80    mov         ebx,eax
 00505B82    mov         ecx,esi
 00505B84    lea         edx,[ebx+278]
 00505B8A    lea         eax,[ebx+288]
 00505B90    call        GridRect
 00505B95    pop         esi
 00505B96    pop         ebx
 00505B97    ret
*}
end;

//00505B98
function TCustomGrid.GetTabStops(Index:LongInt):Boolean;
begin
{*
 00505B98    mov         ecx,dword ptr [eax+308]
 00505B9E    test        ecx,ecx
>00505BA0    jne         00505BA5
 00505BA2    mov         al,1
 00505BA4    ret
 00505BA5    mov         eax,dword ptr [ecx+edx*4+4]
 00505BA9    ret
*}
end;

//00505BAC
function TCustomGrid.GetVisibleColCount:Integer;
begin
{*
 00505BAC    push        ebx
 00505BAD    add         esp,0FFFFFFA0
 00505BB0    mov         ebx,eax
 00505BB2    mov         edx,esp
 00505BB4    mov         eax,ebx
 00505BB6    call        TCustomGrid.CalcDrawInfo
 00505BBB    mov         eax,dword ptr [esp+10]
 00505BBF    sub         eax,dword ptr [ebx+2C8]
 00505BC5    inc         eax
 00505BC6    add         esp,60
 00505BC9    pop         ebx
 00505BCA    ret
*}
end;

//00505BCC
function TCustomGrid.GetVisibleRowCount:Integer;
begin
{*
 00505BCC    push        ebx
 00505BCD    add         esp,0FFFFFFA0
 00505BD0    mov         ebx,eax
 00505BD2    mov         edx,esp
 00505BD4    mov         eax,ebx
 00505BD6    call        TCustomGrid.CalcDrawInfo
 00505BDB    mov         eax,dword ptr [esp+40]
 00505BDF    sub         eax,dword ptr [ebx+2CC]
 00505BE5    inc         eax
 00505BE6    add         esp,60
 00505BE9    pop         ebx
 00505BEA    ret
*}
end;

//00505BEC
procedure TCustomGrid.SetBorderStyle(Value:TBorderStyle);
begin
{*
 00505BEC    cmp         dl,byte ptr [eax+280]
>00505BF2    je          00505BFF
 00505BF4    mov         byte ptr [eax+280],dl
 00505BFA    call        TWinControl.RecreateWnd
 00505BFF    ret
*}
end;

//00505C00
procedure TCustomGrid.SetCol(Value:LongInt);
begin
{*
 00505C00    cmp         edx,dword ptr [eax+288]
>00505C06    je          00505C15
 00505C08    push        1
 00505C0A    mov         ecx,dword ptr [eax+28C]
 00505C10    call        TCustomGrid.FocusCell
 00505C15    ret
*}
end;

//00505C18
procedure TCustomGrid.SetColCount(Value:LongInt);
begin
{*
 00505C18    push        ebx
 00505C19    push        esi
 00505C1A    mov         ebx,edx
 00505C1C    mov         esi,eax
 00505C1E    cmp         ebx,dword ptr [esi+284]
>00505C24    je          00505C71
 00505C26    cmp         ebx,1
>00505C29    jge         00505C30
 00505C2B    mov         ebx,1
 00505C30    cmp         ebx,dword ptr [esi+29C]
>00505C36    jg          00505C42
 00505C38    mov         edx,ebx
 00505C3A    dec         edx
 00505C3B    mov         eax,esi
 00505C3D    call        TCustomGrid.SetFixedCols
 00505C42    mov         ecx,dword ptr [esi+2C0]
 00505C48    mov         edx,ebx
 00505C4A    mov         eax,esi
 00505C4C    call        TCustomGrid.ChangeSize
 00505C51    test        byte ptr [esi+2B5],10
>00505C58    je          00505C71
 00505C5A    mov         eax,dword ptr [esi+284]
 00505C60    dec         eax
 00505C61    mov         dword ptr [esi+278],eax
 00505C67    mov         eax,esi
 00505C69    mov         edx,dword ptr [eax]
 00505C6B    call        dword ptr [edx+90]
 00505C71    pop         esi
 00505C72    pop         ebx
 00505C73    ret
*}
end;

//00505C74
procedure TCustomGrid.SetColWidths(Index:LongInt; Value:Integer);
begin
{*
 00505C74    push        ebp
 00505C75    mov         ebp,esp
 00505C77    push        0
 00505C79    push        ebx
 00505C7A    push        esi
 00505C7B    push        edi
 00505C7C    mov         edi,ecx
 00505C7E    mov         esi,edx
 00505C80    mov         ebx,eax
 00505C82    xor         eax,eax
 00505C84    push        ebp
 00505C85    push        505D12
 00505C8A    push        dword ptr fs:[eax]
 00505C8D    mov         dword ptr fs:[eax],esp
 00505C90    cmp         dword ptr [ebx+300],0
>00505C97    jne         00505CB0
 00505C99    lea         eax,[ebx+300]
 00505C9F    mov         ecx,dword ptr [ebx+290]
 00505CA5    mov         edx,dword ptr [ebx+284]
 00505CAB    call        UpdateExtents
 00505CB0    cmp         esi,dword ptr [ebx+284]
>00505CB6    jl          00505CCD
 00505CB8    lea         edx,[ebp-4]
 00505CBB    mov         eax,[0078D63C];^SResString239:TResStringRec
 00505CC0    call        LoadResString
 00505CC5    mov         eax,dword ptr [ebp-4]
 00505CC8    call        InvalidOp
 00505CCD    mov         eax,dword ptr [ebx+300]
 00505CD3    mov         eax,dword ptr [eax+esi*4+4]
 00505CD7    cmp         edi,eax
>00505CD9    je          00505CFC
 00505CDB    push        edi
 00505CDC    mov         ecx,eax
 00505CDE    mov         edx,esi
 00505CE0    mov         eax,ebx
 00505CE2    call        TCustomGrid.ResizeCol
 00505CE7    mov         eax,dword ptr [ebx+300]
 00505CED    mov         dword ptr [eax+esi*4+4],edi
 00505CF1    mov         eax,ebx
 00505CF3    mov         si,0FFA0
 00505CF7    call        @CallDynaInst
 00505CFC    xor         eax,eax
 00505CFE    pop         edx
 00505CFF    pop         ecx
 00505D00    pop         ecx
 00505D01    mov         dword ptr fs:[eax],edx
 00505D04    push        505D19
 00505D09    lea         eax,[ebp-4]
 00505D0C    call        @UStrClr
 00505D11    ret
>00505D12    jmp         @HandleFinally
>00505D17    jmp         00505D09
 00505D19    pop         edi
 00505D1A    pop         esi
 00505D1B    pop         ebx
 00505D1C    pop         ecx
 00505D1D    pop         ebp
 00505D1E    ret
*}
end;

//00505D20
procedure TCustomGrid.SetDefaultColWidth(Value:Integer);
begin
{*
 00505D20    push        ebx
 00505D21    push        esi
 00505D22    mov         esi,edx
 00505D24    mov         ebx,eax
 00505D26    cmp         dword ptr [ebx+300],0
>00505D2D    je          00505D3E
 00505D2F    lea         eax,[ebx+300]
 00505D35    xor         ecx,ecx
 00505D37    xor         edx,edx
 00505D39    call        UpdateExtents
 00505D3E    mov         dword ptr [ebx+290],esi
 00505D44    mov         eax,ebx
 00505D46    mov         si,0FFA0
 00505D4A    call        @CallDynaInst
 00505D4F    mov         eax,ebx
 00505D51    mov         edx,dword ptr [eax]
 00505D53    call        dword ptr [edx+90]
 00505D59    pop         esi
 00505D5A    pop         ebx
 00505D5B    ret
*}
end;

//00505D5C
procedure TCustomGrid.SetDefaultRowHeight(Value:Integer);
begin
{*
 00505D5C    push        ebx
 00505D5D    push        esi
 00505D5E    mov         esi,edx
 00505D60    mov         ebx,eax
 00505D62    cmp         dword ptr [ebx+304],0
>00505D69    je          00505D7A
 00505D6B    lea         eax,[ebx+304]
 00505D71    xor         ecx,ecx
 00505D73    xor         edx,edx
 00505D75    call        UpdateExtents
 00505D7A    mov         dword ptr [ebx+294],esi
 00505D80    mov         eax,ebx
 00505D82    mov         si,0FF9F
 00505D86    call        @CallDynaInst
 00505D8B    mov         eax,ebx
 00505D8D    mov         edx,dword ptr [eax]
 00505D8F    call        dword ptr [edx+90]
 00505D95    pop         esi
 00505D96    pop         ebx
 00505D97    ret
*}
end;

//00505D98
procedure TCustomGrid.SetDrawingStyle(const Value:TGridDrawingStyle);
begin
{*
 00505D98    push        esi
 00505D99    mov         esi,eax
 00505D9B    cmp         dl,byte ptr [esi+298]
>00505DA1    je          00505DD6
 00505DA3    mov         eax,edx
 00505DA5    mov         byte ptr [esi+298],al
 00505DAB    mov         byte ptr [esi+324],al
 00505DB1    cmp         byte ptr [esi+298],1
>00505DB8    jne         00505DCC
 00505DBA    mov         eax,esi
 00505DBC    call        ThemeControl
 00505DC1    test        al,al
>00505DC3    jne         00505DCC
 00505DC5    mov         byte ptr [esi+324],0
 00505DCC    mov         eax,esi
 00505DCE    mov         edx,dword ptr [eax]
 00505DD0    call        dword ptr [edx+94]
 00505DD6    pop         esi
 00505DD7    ret
*}
end;

//00505DD8
procedure TCustomGrid.SetFixedColor(Value:TColor);
begin
{*
 00505DD8    push        esi
 00505DD9    mov         esi,eax
 00505DDB    cmp         edx,dword ptr [esi+2A4]
>00505DE1    je          00505DF3
 00505DE3    mov         dword ptr [esi+2A4],edx
 00505DE9    mov         eax,esi
 00505DEB    mov         edx,dword ptr [eax]
 00505DED    call        dword ptr [edx+90]
 00505DF3    pop         esi
 00505DF4    ret
*}
end;

//00505DF8
procedure TCustomGrid.SetFixedCols(Value:Integer);
begin
{*
 00505DF8    push        ebp
 00505DF9    mov         ebp,esp
 00505DFB    push        0
 00505DFD    push        0
 00505DFF    push        ebx
 00505E00    push        esi
 00505E01    mov         esi,edx
 00505E03    mov         ebx,eax
 00505E05    xor         eax,eax
 00505E07    push        ebp
 00505E08    push        505E83
 00505E0D    push        dword ptr fs:[eax]
 00505E10    mov         dword ptr fs:[eax],esp
 00505E13    cmp         esi,dword ptr [ebx+29C]
>00505E19    je          00505E68
 00505E1B    test        esi,esi
>00505E1D    jge         00505E34
 00505E1F    lea         edx,[ebp-4]
 00505E22    mov         eax,[0078D63C];^SResString239:TResStringRec
 00505E27    call        LoadResString
 00505E2C    mov         eax,dword ptr [ebp-4]
 00505E2F    call        InvalidOp
 00505E34    cmp         esi,dword ptr [ebx+284]
>00505E3A    jl          00505E51
 00505E3C    lea         edx,[ebp-8]
 00505E3F    mov         eax,[0078CD70];^SResString240:TResStringRec
 00505E44    call        LoadResString
 00505E49    mov         eax,dword ptr [ebp-8]
 00505E4C    call        InvalidOp
 00505E51    mov         dword ptr [ebx+29C],esi
 00505E57    mov         eax,ebx
 00505E59    call        TCustomGrid.Initialize
 00505E5E    mov         eax,ebx
 00505E60    mov         edx,dword ptr [eax]
 00505E62    call        dword ptr [edx+90]
 00505E68    xor         eax,eax
 00505E6A    pop         edx
 00505E6B    pop         ecx
 00505E6C    pop         ecx
 00505E6D    mov         dword ptr fs:[eax],edx
 00505E70    push        505E8A
 00505E75    lea         eax,[ebp-8]
 00505E78    mov         edx,2
 00505E7D    call        @UStrArrayClr
 00505E82    ret
>00505E83    jmp         @HandleFinally
>00505E88    jmp         00505E75
 00505E8A    pop         esi
 00505E8B    pop         ebx
 00505E8C    pop         ecx
 00505E8D    pop         ecx
 00505E8E    pop         ebp
 00505E8F    ret
*}
end;

//00505E90
procedure TCustomGrid.SetFixedRows(Value:Integer);
begin
{*
 00505E90    push        ebp
 00505E91    mov         ebp,esp
 00505E93    push        0
 00505E95    push        0
 00505E97    push        ebx
 00505E98    push        esi
 00505E99    mov         esi,edx
 00505E9B    mov         ebx,eax
 00505E9D    xor         eax,eax
 00505E9F    push        ebp
 00505EA0    push        505F1B
 00505EA5    push        dword ptr fs:[eax]
 00505EA8    mov         dword ptr fs:[eax],esp
 00505EAB    cmp         esi,dword ptr [ebx+2A0]
>00505EB1    je          00505F00
 00505EB3    test        esi,esi
>00505EB5    jge         00505ECC
 00505EB7    lea         edx,[ebp-4]
 00505EBA    mov         eax,[0078D63C];^SResString239:TResStringRec
 00505EBF    call        LoadResString
 00505EC4    mov         eax,dword ptr [ebp-4]
 00505EC7    call        InvalidOp
 00505ECC    cmp         esi,dword ptr [ebx+2C0]
>00505ED2    jl          00505EE9
 00505ED4    lea         edx,[ebp-8]
 00505ED7    mov         eax,[0078D5BC];^SResString241:TResStringRec
 00505EDC    call        LoadResString
 00505EE1    mov         eax,dword ptr [ebp-8]
 00505EE4    call        InvalidOp
 00505EE9    mov         dword ptr [ebx+2A0],esi
 00505EEF    mov         eax,ebx
 00505EF1    call        TCustomGrid.Initialize
 00505EF6    mov         eax,ebx
 00505EF8    mov         edx,dword ptr [eax]
 00505EFA    call        dword ptr [edx+90]
 00505F00    xor         eax,eax
 00505F02    pop         edx
 00505F03    pop         ecx
 00505F04    pop         ecx
 00505F05    mov         dword ptr fs:[eax],edx
 00505F08    push        505F22
 00505F0D    lea         eax,[ebp-8]
 00505F10    mov         edx,2
 00505F15    call        @UStrArrayClr
 00505F1A    ret
>00505F1B    jmp         @HandleFinally
>00505F20    jmp         00505F0D
 00505F22    pop         esi
 00505F23    pop         ebx
 00505F24    pop         ecx
 00505F25    pop         ecx
 00505F26    pop         ebp
 00505F27    ret
*}
end;

//00505F28
procedure TCustomGrid.SetEditorMode(Value:Boolean);
begin
{*
 00505F28    push        ebx
 00505F29    mov         ebx,eax
 00505F2B    test        dl,dl
>00505F2D    jne         00505F38
 00505F2F    mov         eax,ebx
 00505F31    call        TCustomGrid.HideEditor
 00505F36    pop         ebx
 00505F37    ret
 00505F38    mov         eax,ebx
 00505F3A    call        TCustomGrid.ShowEditor
 00505F3F    mov         eax,dword ptr [ebx+2EC]
 00505F45    test        eax,eax
>00505F47    je          00505F4E
 00505F49    call        TInplaceEdit.Deselect
 00505F4E    pop         ebx
 00505F4F    ret
*}
end;

//00505F50
procedure TCustomGrid.SetGradientEndColor(Value:TColor);
begin
{*
 00505F50    push        esi
 00505F51    mov         esi,eax
 00505F53    cmp         edx,dword ptr [esi+2A8]
>00505F59    je          00505F76
 00505F5B    mov         dword ptr [esi+2A8],edx
 00505F61    mov         eax,esi
 00505F63    call        TWinControl.HandleAllocated
 00505F68    test        al,al
>00505F6A    je          00505F76
 00505F6C    mov         eax,esi
 00505F6E    mov         edx,dword ptr [eax]
 00505F70    call        dword ptr [edx+94]
 00505F76    pop         esi
 00505F77    ret
*}
end;

//00505F78
procedure TCustomGrid.SetGradientStartColor(Value:TColor);
begin
{*
 00505F78    push        esi
 00505F79    mov         esi,eax
 00505F7B    cmp         edx,dword ptr [esi+2AC]
>00505F81    je          00505F9E
 00505F83    mov         dword ptr [esi+2AC],edx
 00505F89    mov         eax,esi
 00505F8B    call        TWinControl.HandleAllocated
 00505F90    test        al,al
>00505F92    je          00505F9E
 00505F94    mov         eax,esi
 00505F96    mov         edx,dword ptr [eax]
 00505F98    call        dword ptr [edx+94]
 00505F9E    pop         esi
 00505F9F    ret
*}
end;

//00505FA0
procedure TCustomGrid.SetGridLineWidth(Value:Integer);
begin
{*
 00505FA0    push        esi
 00505FA1    mov         esi,eax
 00505FA3    cmp         edx,dword ptr [esi+2B0]
>00505FA9    je          00505FBB
 00505FAB    mov         dword ptr [esi+2B0],edx
 00505FB1    mov         eax,esi
 00505FB3    mov         edx,dword ptr [eax]
 00505FB5    call        dword ptr [edx+90]
 00505FBB    pop         esi
 00505FBC    ret
*}
end;

//00505FC0
procedure TCustomGrid.SetLeftCol(Value:LongInt);
begin
{*
 00505FC0    cmp         edx,dword ptr [eax+2C8]
>00505FC6    je          00505FD3
 00505FC8    mov         ecx,dword ptr [eax+2CC]
 00505FCE    call        TCustomGrid.MoveTopLeft
 00505FD3    ret
*}
end;

//00505FD4
procedure TCustomGrid.SetOptions(Value:TGridOptions);
begin
{*
 00505FD4    push        esi
 00505FD5    push        ecx
 00505FD6    mov         dword ptr [esp],edx
 00505FD9    mov         esi,eax
 00505FDB    mov         eax,dword ptr [esp]
 00505FDE    cmp         eax,dword ptr [esi+2B4]
>00505FE4    je          00506045
 00505FE6    test        byte ptr [esp+1],10
>00505FEB    je          00505FF4
 00505FED    and         dword ptr [esp],0FFFFDFFF
 00505FF4    mov         eax,dword ptr [esp]
 00505FF7    mov         dword ptr [esi+2B4],eax
 00505FFD    cmp         byte ptr [esi+2FD],0
>00506004    jne         0050601D
 00506006    test        byte ptr [esp+1],20
>0050600B    je          00506016
 0050600D    mov         eax,esi
 0050600F    call        TCustomGrid.ShowEditor
>00506014    jmp         0050601D
 00506016    mov         eax,esi
 00506018    call        TCustomGrid.HideEditor
 0050601D    test        byte ptr [esp+1],10
>00506022    je          0050603B
 00506024    push        1
 00506026    push        0
 00506028    mov         ecx,dword ptr [esi+28C]
 0050602E    mov         edx,dword ptr [esi+288]
 00506034    mov         eax,esi
 00506036    call        TCustomGrid.MoveCurrent
 0050603B    mov         eax,esi
 0050603D    mov         edx,dword ptr [eax]
 0050603F    call        dword ptr [edx+90]
 00506045    pop         edx
 00506046    pop         esi
 00506047    ret
*}
end;

//00506048
procedure TCustomGrid.SetRow(Value:LongInt);
begin
{*
 00506048    cmp         edx,dword ptr [eax+28C]
>0050604E    je          0050605F
 00506050    push        1
 00506052    mov         ecx,edx
 00506054    mov         edx,dword ptr [eax+288]
 0050605A    call        TCustomGrid.FocusCell
 0050605F    ret
*}
end;

//00506060
procedure TCustomGrid.SetRowCount(Value:LongInt);
begin
{*
 00506060    push        ebx
 00506061    push        esi
 00506062    mov         esi,edx
 00506064    mov         ebx,eax
 00506066    cmp         esi,dword ptr [ebx+2C0]
>0050606C    je          00506099
 0050606E    cmp         esi,1
>00506071    jge         00506078
 00506073    mov         esi,1
 00506078    cmp         esi,dword ptr [ebx+2A0]
>0050607E    jg          0050608A
 00506080    mov         edx,esi
 00506082    dec         edx
 00506083    mov         eax,ebx
 00506085    call        TCustomGrid.SetFixedRows
 0050608A    mov         ecx,esi
 0050608C    mov         edx,dword ptr [ebx+284]
 00506092    mov         eax,ebx
 00506094    call        TCustomGrid.ChangeSize
 00506099    pop         esi
 0050609A    pop         ebx
 0050609B    ret
*}
end;

//0050609C
procedure TCustomGrid.SetRowHeights(Index:LongInt; Value:Integer);
begin
{*
 0050609C    push        ebp
 0050609D    mov         ebp,esp
 0050609F    push        0
 005060A1    push        ebx
 005060A2    push        esi
 005060A3    push        edi
 005060A4    mov         edi,ecx
 005060A6    mov         ebx,edx
 005060A8    mov         esi,eax
 005060AA    xor         eax,eax
 005060AC    push        ebp
 005060AD    push        50613A
 005060B2    push        dword ptr fs:[eax]
 005060B5    mov         dword ptr fs:[eax],esp
 005060B8    cmp         dword ptr [esi+304],0
>005060BF    jne         005060D8
 005060C1    lea         eax,[esi+304]
 005060C7    mov         ecx,dword ptr [esi+294]
 005060CD    mov         edx,dword ptr [esi+2C0]
 005060D3    call        UpdateExtents
 005060D8    cmp         ebx,dword ptr [esi+2C0]
>005060DE    jl          005060F5
 005060E0    lea         edx,[ebp-4]
 005060E3    mov         eax,[0078D63C];^SResString239:TResStringRec
 005060E8    call        LoadResString
 005060ED    mov         eax,dword ptr [ebp-4]
 005060F0    call        InvalidOp
 005060F5    mov         eax,dword ptr [esi+304]
 005060FB    mov         eax,dword ptr [eax+ebx*4+4]
 005060FF    cmp         edi,eax
>00506101    je          00506124
 00506103    push        edi
 00506104    mov         ecx,eax
 00506106    mov         edx,ebx
 00506108    mov         eax,esi
 0050610A    call        TCustomGrid.ResizeRow
 0050610F    mov         eax,dword ptr [esi+304]
 00506115    mov         dword ptr [eax+ebx*4+4],edi
 00506119    mov         eax,esi
 0050611B    mov         si,0FF9F
 0050611F    call        @CallDynaInst
 00506124    xor         eax,eax
 00506126    pop         edx
 00506127    pop         ecx
 00506128    pop         ecx
 00506129    mov         dword ptr fs:[eax],edx
 0050612C    push        506141
 00506131    lea         eax,[ebp-4]
 00506134    call        @UStrClr
 00506139    ret
>0050613A    jmp         @HandleFinally
>0050613F    jmp         00506131
 00506141    pop         edi
 00506142    pop         esi
 00506143    pop         ebx
 00506144    pop         ecx
 00506145    pop         ebp
 00506146    ret
*}
end;

//00506148
procedure TCustomGrid.SetScrollBars(Value:TScrollStyle);
begin
{*
 00506148    cmp         dl,byte ptr [eax+2C4]
>0050614E    je          0050615B
 00506150    mov         byte ptr [eax+2C4],dl
 00506156    call        TWinControl.RecreateWnd
 0050615B    ret
*}
end;

//0050615C
procedure TCustomGrid.SetSelection(Value:TGridRect);
begin
{*
 0050615C    push        ebx
 0050615D    push        esi
 0050615E    push        edi
 0050615F    add         esp,0FFFFFFE0
 00506162    mov         esi,edx
 00506164    lea         edi,[esp]
 00506167    movs        dword ptr [edi],dword ptr [esi]
 00506168    movs        dword ptr [edi],dword ptr [esi]
 00506169    movs        dword ptr [edi],dword ptr [esi]
 0050616A    movs        dword ptr [edi],dword ptr [esi]
 0050616B    mov         ebx,eax
 0050616D    lea         edx,[esp+10]
 00506171    mov         eax,ebx
 00506173    call        TCustomGrid.GetSelection
 00506178    mov         eax,dword ptr [esp]
 0050617B    mov         dword ptr [ebx+278],eax
 00506181    mov         eax,dword ptr [esp+4]
 00506185    mov         dword ptr [ebx+27C],eax
 0050618B    mov         eax,dword ptr [esp+8]
 0050618F    mov         dword ptr [ebx+288],eax
 00506195    mov         eax,dword ptr [esp+0C]
 00506199    mov         dword ptr [ebx+28C],eax
 0050619F    lea         edx,[esp+10]
 005061A3    mov         eax,ebx
 005061A5    call        TCustomGrid.SelectionMoved
 005061AA    add         esp,20
 005061AD    pop         edi
 005061AE    pop         esi
 005061AF    pop         ebx
 005061B0    ret
*}
end;

//005061B4
procedure TCustomGrid.SetTopRow(Value:LongInt);
begin
{*
 005061B4    cmp         edx,dword ptr [eax+2CC]
>005061BA    je          005061C9
 005061BC    mov         ecx,edx
 005061BE    mov         edx,dword ptr [eax+2C8]
 005061C4    call        TCustomGrid.MoveTopLeft
 005061C9    ret
*}
end;

//005061CC
procedure TCustomGrid.HideEdit;
begin
{*
 005061CC    push        ebp
 005061CD    mov         ebp,esp
 005061CF    push        ecx
 005061D0    mov         dword ptr [ebp-4],eax
 005061D3    mov         eax,dword ptr [ebp-4]
 005061D6    cmp         dword ptr [eax+2EC],0
>005061DD    je          00506232
 005061DF    xor         eax,eax
 005061E1    push        ebp
 005061E2    push        50622B
 005061E7    push        dword ptr fs:[eax]
 005061EA    mov         dword ptr fs:[eax],esp
 005061ED    mov         eax,dword ptr [ebp-4]
 005061F0    call        TCustomGrid.UpdateText
 005061F5    xor         eax,eax
 005061F7    pop         edx
 005061F8    pop         ecx
 005061F9    pop         ecx
 005061FA    mov         dword ptr fs:[eax],edx
 005061FD    push        506232
 00506202    mov         eax,dword ptr [ebp-4]
 00506205    mov         dword ptr [eax+2F0],0FFFFFFFF
 0050620F    mov         eax,dword ptr [ebp-4]
 00506212    mov         dword ptr [eax+2F4],0FFFFFFFF
 0050621C    mov         eax,dword ptr [ebp-4]
 0050621F    mov         eax,dword ptr [eax+2EC]
 00506225    call        TInplaceEdit.Hide
 0050622A    ret
>0050622B    jmp         @HandleFinally
>00506230    jmp         00506202
 00506232    pop         ecx
 00506233    pop         ebp
 00506234    ret
*}
end;

//00506238
procedure UpdateEditor;
begin
{*
 00506238    push        ebp
 00506239    mov         ebp,esp
 0050623B    push        ebx
 0050623C    mov         ebx,dword ptr [ebp+8]
 0050623F    add         ebx,0FFFFFFFC
 00506242    mov         eax,dword ptr [ebx]
 00506244    mov         eax,dword ptr [eax+288]
 0050624A    mov         edx,dword ptr [ebx]
 0050624C    mov         dword ptr [edx+2F0],eax
 00506252    mov         eax,dword ptr [ebx]
 00506254    mov         eax,dword ptr [eax+28C]
 0050625A    mov         edx,dword ptr [ebx]
 0050625C    mov         dword ptr [edx+2F4],eax
 00506262    mov         eax,dword ptr [ebx]
 00506264    mov         eax,dword ptr [eax+2EC]
 0050626A    mov         edx,dword ptr [eax]
 0050626C    call        dword ptr [edx+128]
 00506272    mov         eax,dword ptr [ebx]
 00506274    mov         eax,dword ptr [eax+2EC]
 0050627A    call        TCustomMaskEdit.GetMaxLength
 0050627F    inc         eax
>00506280    jne         0050628D
 00506282    mov         eax,dword ptr [ebx]
 00506284    mov         byte ptr [eax+281],0
>0050628B    jmp         00506296
 0050628D    mov         eax,dword ptr [ebx]
 0050628F    mov         byte ptr [eax+281],1
 00506296    mov         eax,dword ptr [ebx]
 00506298    mov         eax,dword ptr [eax+2EC]
 0050629E    call        TCustomEdit.SelectAll
 005062A3    pop         ebx
 005062A4    pop         ebp
 005062A5    ret
*}
end;

//005062A8
procedure TCustomGrid.UpdateEdit;
begin
{*
 005062A8    push        ebp
 005062A9    mov         ebp,esp
 005062AB    add         esp,0FFFFFFEC
 005062AE    push        ebx
 005062AF    mov         dword ptr [ebp-4],eax
 005062B2    mov         eax,dword ptr [ebp-4]
 005062B5    mov         edx,dword ptr [eax]
 005062B7    call        dword ptr [edx+0F8]
 005062BD    test        al,al
>005062BF    je          00506380
 005062C5    mov         eax,dword ptr [ebp-4]
 005062C8    cmp         dword ptr [eax+2EC],0
>005062CF    jne         0050630B
 005062D1    mov         eax,dword ptr [ebp-4]
 005062D4    mov         edx,dword ptr [eax]
 005062D6    call        dword ptr [edx+0F4]
 005062DC    mov         ebx,eax
 005062DE    mov         eax,dword ptr [ebp-4]
 005062E1    mov         dword ptr [eax+2EC],ebx
 005062E7    mov         eax,ebx
 005062E9    mov         edx,dword ptr [ebp-4]
 005062EC    call        TInplaceEdit.SetGrid
 005062F1    mov         eax,dword ptr [ebp-4]
 005062F4    mov         eax,dword ptr [eax+2EC]
 005062FA    mov         edx,dword ptr [ebp-4]
 005062FD    mov         ecx,dword ptr [eax]
 005062FF    call        dword ptr [ecx+78]
 00506302    push        ebp
 00506303    call        UpdateEditor
 00506308    pop         ecx
>00506309    jmp         00506342
 0050630B    mov         eax,dword ptr [ebp-4]
 0050630E    mov         eax,dword ptr [eax+288]
 00506314    mov         edx,dword ptr [ebp-4]
 00506317    cmp         eax,dword ptr [edx+2F0]
>0050631D    jne         00506333
 0050631F    mov         eax,dword ptr [ebp-4]
 00506322    mov         eax,dword ptr [eax+28C]
 00506328    mov         edx,dword ptr [ebp-4]
 0050632B    cmp         eax,dword ptr [edx+2F4]
>00506331    je          00506342
 00506333    mov         eax,dword ptr [ebp-4]
 00506336    call        TCustomGrid.HideEdit
 0050633B    push        ebp
 0050633C    call        UpdateEditor
 00506341    pop         ecx
 00506342    mov         eax,dword ptr [ebp-4]
 00506345    mov         edx,dword ptr [eax]
 00506347    call        dword ptr [edx+0F8]
 0050634D    test        al,al
>0050634F    je          00506380
 00506351    lea         eax,[ebp-14]
 00506354    push        eax
 00506355    mov         eax,dword ptr [ebp-4]
 00506358    mov         ecx,dword ptr [eax+28C]
 0050635E    mov         eax,dword ptr [ebp-4]
 00506361    mov         edx,dword ptr [eax+288]
 00506367    mov         eax,dword ptr [ebp-4]
 0050636A    call        TCustomGrid.CellRect
 0050636F    lea         edx,[ebp-14]
 00506372    mov         eax,dword ptr [ebp-4]
 00506375    mov         eax,dword ptr [eax+2EC]
 0050637B    call        TInplaceEdit.Move
 00506380    pop         ebx
 00506381    mov         esp,ebp
 00506383    pop         ebp
 00506384    ret
*}
end;

//00506388
procedure TCustomGrid.UpdateText;
begin
{*
 00506388    push        ebp
 00506389    mov         ebp,esp
 0050638B    push        0
 0050638D    push        ebx
 0050638E    push        esi
 0050638F    mov         ebx,eax
 00506391    xor         eax,eax
 00506393    push        ebp
 00506394    push        5063EE
 00506399    push        dword ptr fs:[eax]
 0050639C    mov         dword ptr fs:[eax],esp
 0050639F    mov         esi,dword ptr [ebx+2F0]
 005063A5    cmp         esi,0FFFFFFFF
>005063A8    je          005063D8
 005063AA    cmp         dword ptr [ebx+2F4],0FFFFFFFF
>005063B1    je          005063D8
 005063B3    lea         edx,[ebp-4]
 005063B6    mov         eax,dword ptr [ebx+2EC]
 005063BC    call        TCustomMaskEdit.GetText
 005063C1    mov         eax,dword ptr [ebp-4]
 005063C4    push        eax
 005063C5    mov         ecx,dword ptr [ebx+2F4]
 005063CB    mov         edx,esi
 005063CD    mov         eax,ebx
 005063CF    mov         si,0FFA9
 005063D3    call        @CallDynaInst
 005063D8    xor         eax,eax
 005063DA    pop         edx
 005063DB    pop         ecx
 005063DC    pop         ecx
 005063DD    mov         dword ptr fs:[eax],edx
 005063E0    push        5063F5
 005063E5    lea         eax,[ebp-4]
 005063E8    call        @UStrClr
 005063ED    ret
>005063EE    jmp         @HandleFinally
>005063F3    jmp         005063E5
 005063F5    pop         esi
 005063F6    pop         ebx
 005063F7    pop         ecx
 005063F8    pop         ebp
 005063F9    ret
*}
end;

//005063FC
procedure TCustomGrid.WMChar(var Msg:TWMChar);
begin
{*
 005063FC    push        esi
 005063FD    push        edi
 005063FE    test        byte ptr [eax+2B5],4
>00506405    je          00506434
 00506407    movzx       esi,word ptr [edx+4]
 0050640B    mov         edi,506450
 00506410    mov         ecx,esi
 00506412    cmp         cx,0FF
>00506417    ja          0050641F
 00506419    movzx       ecx,cx
 0050641C    bt          dword ptr [edi],ecx
 0050641F    setb        cl
 00506422    test        cl,cl
>00506424    je          0050642A
 00506426    mov         cl,1
>00506428    jmp         00506436
 0050642A    cmp         word ptr [edx+4],20
 0050642F    setae       cl
>00506432    jmp         00506436
 00506434    xor         ecx,ecx
 00506436    test        cl,cl
>00506438    je          00506446
 0050643A    movzx       edx,word ptr [edx+4]
 0050643E    call        TCustomGrid.ShowEditorChar
 00506443    pop         edi
 00506444    pop         esi
 00506445    ret
 00506446    call        TWinControl.WMChar
 0050644B    pop         edi
 0050644C    pop         esi
 0050644D    ret
*}
end;

//00506470
procedure TCustomGrid.WMCommand(var Message:TWMCommand);
begin
{*
 00506470    push        ebx
 00506471    push        esi
 00506472    push        edi
 00506473    mov         edi,edx
 00506475    mov         ebx,eax
 00506477    mov         esi,dword ptr [ebx+2EC]
 0050647D    test        esi,esi
>0050647F    je          0050649E
 00506481    mov         eax,esi
 00506483    call        TWinControl.GetHandle
 00506488    cmp         eax,dword ptr [edi+8]
>0050648B    jne         0050649E
 0050648D    movzx       eax,word ptr [edi+6]
 00506491    sub         ax,300
>00506495    jne         0050649E
 00506497    mov         eax,ebx
 00506499    call        TCustomGrid.UpdateText
 0050649E    pop         edi
 0050649F    pop         esi
 005064A0    pop         ebx
 005064A1    ret
*}
end;

//005064A4
procedure TCustomGrid.WMGetDlgCode(var Msg:TWMGetDlgCode);
begin
{*
 005064A4    mov         dword ptr [edx+0C],1
 005064AB    test        byte ptr [eax+2B5],10
>005064B2    jne         005064D1
 005064B4    test        byte ptr [eax+2B5],8
>005064BB    je          005064C1
 005064BD    or          dword ptr [edx+0C],2
 005064C1    test        byte ptr [eax+2B5],4
>005064C8    je          005064D1
 005064CA    or          dword ptr [edx+0C],80
 005064D1    ret
*}
end;

//005064D4
procedure TCustomGrid.WMKillFocus(var Msg:TWMKillFocus);
begin
{*
 005064D4    push        ebx
 005064D5    push        esi
 005064D6    push        edi
 005064D7    add         esp,0FFFFFFF0
 005064DA    mov         esi,edx
 005064DC    mov         ebx,eax
 005064DE    mov         edx,esi
 005064E0    mov         eax,ebx
 005064E2    call        TWinControl.WMKillFocus
 005064E7    call        user32.DestroyCaret
 005064EC    mov         edx,esp
 005064EE    mov         eax,ebx
 005064F0    call        TCustomGrid.GetSelection
 005064F5    mov         edx,esp
 005064F7    mov         eax,ebx
 005064F9    call        TCustomGrid.InvalidateRect
 005064FE    mov         edi,dword ptr [ebx+2EC]
 00506504    test        edi,edi
>00506506    je          0050651B
 00506508    mov         eax,edi
 0050650A    call        TWinControl.GetHandle
 0050650F    cmp         eax,dword ptr [esi+4]
>00506512    je          0050651B
 00506514    mov         eax,ebx
 00506516    call        TCustomGrid.HideEdit
 0050651B    add         esp,10
 0050651E    pop         edi
 0050651F    pop         esi
 00506520    pop         ebx
 00506521    ret
*}
end;

//00506524
procedure TCustomGrid.WMLButtonDown(var Message:TWMLButtonDown);
begin
{*
 00506524    push        ebx
 00506525    mov         ebx,eax
 00506527    mov         eax,ebx
 00506529    call        TControl.WMLButtonDown
 0050652E    cmp         dword ptr [ebx+2EC],0
>00506535    je          00506548
 00506537    call        user32.GetMessageTime
 0050653C    mov         edx,dword ptr [ebx+2EC]
 00506542    mov         dword ptr [edx+2C4],eax
 00506548    pop         ebx
 00506549    ret
*}
end;

//0050654C
procedure TCustomGrid.WMNCHitTest(var Msg:TWMNCHitTest);
begin
{*
 0050654C    push        ebx
 0050654D    push        esi
 0050654E    add         esp,0FFFFFFEC
 00506551    mov         esi,edx
 00506553    mov         ebx,eax
 00506555    mov         edx,esi
 00506557    mov         eax,ebx
 00506559    mov         ecx,dword ptr [eax]
 0050655B    call        dword ptr [ecx-10]
 0050655E    mov         eax,dword ptr [esi+8]
 00506561    mov         dword ptr [esp],eax
 00506564    movsx       eax,word ptr [esp]
 00506568    mov         dword ptr [esp+4],eax
 0050656C    movsx       eax,word ptr [esp+2]
 00506571    mov         dword ptr [esp+8],eax
 00506575    lea         ecx,[esp+0C]
 00506579    lea         edx,[esp+4]
 0050657D    mov         eax,ebx
 0050657F    call        TControl.ScreenToClient
 00506584    mov         eax,dword ptr [esp+0C]
 00506588    mov         dword ptr [ebx+2E4],eax
 0050658E    mov         eax,dword ptr [esp+10]
 00506592    mov         dword ptr [ebx+2E8],eax
 00506598    add         esp,14
 0050659B    pop         esi
 0050659C    pop         ebx
 0050659D    ret
*}
end;

//005065A0
procedure TCustomGrid.WMSetCursor(var Msg:TWMSetCursor);
begin
{*
 005065A0    push        ebx
 005065A1    push        esi
 005065A2    push        edi
 005065A3    push        ebp
 005065A4    add         esp,0FFFFFF90
 005065A7    mov         ebp,edx
 005065A9    mov         esi,eax
 005065AB    xor         edi,edi
 005065AD    cmp         word ptr [ebp+8],1
>005065B2    jne         0050662E
 005065B4    movzx       eax,byte ptr [esi+318]
 005065BB    test        al,al
>005065BD    jne         005065F7
 005065BF    lea         edx,[esp+10]
 005065C3    mov         eax,esi
 005065C5    call        TCustomGrid.CalcDrawInfo
 005065CA    push        esp
 005065CB    lea         eax,[esp+8]
 005065CF    push        eax
 005065D0    lea         eax,[esp+10]
 005065D4    push        eax
 005065D5    lea         eax,[esp+18]
 005065D9    push        eax
 005065DA    lea         eax,[esp+20]
 005065DE    push        eax
 005065DF    mov         ecx,dword ptr [esi+2E8]
 005065E5    mov         edx,dword ptr [esi+2E4]
 005065EB    mov         eax,esi
 005065ED    mov         ebx,dword ptr [eax]
 005065EF    call        dword ptr [ebx+0F0]
>005065F5    jmp         005065FA
 005065F7    mov         byte ptr [esp],al
 005065FA    cmp         byte ptr [esp],2
>005065FE    jne         00506615
 00506600    mov         eax,[0078DB00];^Screen:TScreen
 00506605    mov         eax,dword ptr [eax]
 00506607    mov         edx,0FFFFFFF1
 0050660C    call        TScreen.GetCursors
 00506611    mov         edi,eax
>00506613    jmp         0050662E
 00506615    cmp         byte ptr [esp],3
>00506619    jne         0050662E
 0050661B    mov         eax,[0078DB00];^Screen:TScreen
 00506620    mov         eax,dword ptr [eax]
 00506622    mov         edx,0FFFFFFF2
 00506627    call        TScreen.GetCursors
 0050662C    mov         edi,eax
 0050662E    test        edi,edi
>00506630    je          0050663A
 00506632    push        edi
 00506633    call        user32.SetCursor
>00506638    jmp         00506643
 0050663A    mov         edx,ebp
 0050663C    mov         eax,esi
 0050663E    call        TWinControl.WMSetCursor
 00506643    add         esp,70
 00506646    pop         ebp
 00506647    pop         edi
 00506648    pop         esi
 00506649    pop         ebx
 0050664A    ret
*}
end;

//0050664C
procedure TCustomGrid.WMSetFocus(var Msg:TWMSetFocus);
begin
{*
 0050664C    push        ebx
 0050664D    push        esi
 0050664E    push        edi
 0050664F    add         esp,0FFFFFFF0
 00506652    mov         esi,edx
 00506654    mov         ebx,eax
 00506656    mov         edx,esi
 00506658    mov         eax,ebx
 0050665A    call        TWinControl.WMSetFocus
 0050665F    push        0
 00506661    push        0
 00506663    push        0
 00506665    mov         eax,ebx
 00506667    call        TWinControl.GetHandle
 0050666C    push        eax
 0050666D    call        user32.CreateCaret
 00506672    mov         edi,dword ptr [ebx+2EC]
 00506678    test        edi,edi
>0050667A    je          00506688
 0050667C    mov         eax,edi
 0050667E    call        TWinControl.GetHandle
 00506683    cmp         eax,dword ptr [esi+4]
>00506686    je          005066A1
 00506688    mov         edx,esp
 0050668A    mov         eax,ebx
 0050668C    call        TCustomGrid.GetSelection
 00506691    mov         edx,esp
 00506693    mov         eax,ebx
 00506695    call        TCustomGrid.InvalidateRect
 0050669A    mov         eax,ebx
 0050669C    call        TCustomGrid.UpdateEdit
 005066A1    add         esp,10
 005066A4    pop         edi
 005066A5    pop         esi
 005066A6    pop         ebx
 005066A7    ret
*}
end;

//005066A8
procedure TCustomGrid.WMSize(var Msg:TWMSize);
begin
{*
 005066A8    push        esi
 005066A9    push        edi
 005066AA    mov         edi,eax
 005066AC    mov         eax,edi
 005066AE    call        TWinControl.WMSize
 005066B3    mov         eax,edi
 005066B5    call        TCustomGrid.UpdateScrollRange
 005066BA    mov         eax,edi
 005066BC    mov         si,0FFC7
 005066C0    call        @CallDynaInst
 005066C5    test        al,al
>005066C7    je          005066D3
 005066C9    mov         eax,edi
 005066CB    mov         edx,dword ptr [eax]
 005066CD    call        dword ptr [edx+90]
 005066D3    pop         edi
 005066D4    pop         esi
 005066D5    ret
*}
end;

//005066D8
procedure TCustomGrid.WMVScroll(var Msg:TWMVScroll);
begin
{*
 005066D8    movsx       ecx,word ptr [edx+6]
 005066DC    push        ecx
 005066DD    push        1
 005066DF    movsx       ecx,word ptr [edx+4]
 005066E3    mov         edx,1
 005066E8    call        TCustomGrid.ModifyScrollBar
 005066ED    ret
*}
end;

//005066F0
procedure TCustomGrid.WMHScroll(var Msg:TWMHScroll);
begin
{*
 005066F0    movsx       ecx,word ptr [edx+6]
 005066F4    push        ecx
 005066F5    push        1
 005066F7    movsx       ecx,word ptr [edx+4]
 005066FB    xor         edx,edx
 005066FD    call        TCustomGrid.ModifyScrollBar
 00506702    ret
*}
end;

//00506704
procedure TCustomGrid.WMEraseBkgnd(var Message:TWMEraseBkgnd);
begin
{*
 00506704    push        ebx
 00506705    push        esi
 00506706    push        edi
 00506707    push        ebp
 00506708    add         esp,0FFFFFFE8
 0050670B    mov         ebp,edx
 0050670D    mov         ebx,eax
 0050670F    push        2
 00506711    call        user32.GetSystemMetrics
 00506716    mov         dword ptr [esp],eax
 00506719    push        3
 0050671B    call        user32.GetSystemMetrics
 00506720    mov         edi,eax
 00506722    mov         dword ptr [esp+4],edi
 00506726    mov         eax,ebx
 00506728    mov         si,0FFC7
 0050672C    call        @CallDynaInst
 00506731    test        al,al
>00506733    je          0050674D
 00506735    push        edi
 00506736    lea         eax,[esp+0C]
 0050673A    push        eax
 0050673B    mov         edx,dword ptr [ebx+4C]
 0050673E    sub         edx,edi
 00506740    mov         ecx,dword ptr [esp+8]
 00506744    xor         eax,eax
 00506746    call        Bounds
>0050674B    jmp         00506768
 0050674D    push        edi
 0050674E    lea         eax,[esp+0C]
 00506752    push        eax
 00506753    mov         edx,dword ptr [ebx+4C]
 00506756    sub         edx,edi
 00506758    mov         eax,dword ptr [ebx+48]
 0050675B    mov         esi,dword ptr [esp+8]
 0050675F    sub         eax,esi
 00506761    mov         ecx,esi
 00506763    call        Bounds
 00506768    mov         eax,dword ptr [ebx+1C0]
 0050676E    call        TBrush.GetHandle
 00506773    push        eax
 00506774    lea         eax,[esp+0C]
 00506778    push        eax
 00506779    mov         eax,dword ptr [ebp+4]
 0050677C    push        eax
 0050677D    call        user32.FillRect
 00506782    mov         dword ptr [ebp+0C],1
 00506789    add         esp,18
 0050678C    pop         ebp
 0050678D    pop         edi
 0050678E    pop         esi
 0050678F    pop         ebx
 00506790    ret
*}
end;

//00506794
procedure TCustomGrid.CancelMode;
begin
{*
 00506794    push        ebp
 00506795    mov         ebp,esp
 00506797    add         esp,0FFFFFF98
 0050679A    mov         dword ptr [ebp-4],eax
 0050679D    xor         eax,eax
 0050679F    push        ebp
 005067A0    push        50681E
 005067A5    push        dword ptr fs:[eax]
 005067A8    mov         dword ptr fs:[eax],esp
 005067AB    mov         eax,dword ptr [ebp-4]
 005067AE    movzx       eax,byte ptr [eax+318]
 005067B5    dec         al
>005067B7    je          005067C4
 005067B9    dec         eax
 005067BA    sub         al,2
>005067BC    jb          005067D6
 005067BE    sub         al,2
>005067C0    jb          005067EE
>005067C2    jmp         00506806
 005067C4    push        1
 005067C6    mov         eax,dword ptr [ebp-4]
 005067C9    call        TWinControl.GetHandle
 005067CE    push        eax
 005067CF    call        user32.KillTimer
>005067D4    jmp         00506806
 005067D6    lea         edx,[ebp-68]
 005067D9    mov         eax,dword ptr [ebp-4]
 005067DC    call        TCustomGrid.CalcDrawInfo
 005067E1    lea         edx,[ebp-68]
 005067E4    mov         eax,dword ptr [ebp-4]
 005067E7    call        TCustomGrid.DrawSizingLine
>005067EC    jmp         00506806
 005067EE    mov         eax,dword ptr [ebp-4]
 005067F1    call        TCustomGrid.DrawMove
 005067F6    push        1
 005067F8    mov         eax,dword ptr [ebp-4]
 005067FB    call        TWinControl.GetHandle
 00506800    push        eax
 00506801    call        user32.KillTimer
 00506806    xor         eax,eax
 00506808    pop         edx
 00506809    pop         ecx
 0050680A    pop         ecx
 0050680B    mov         dword ptr fs:[eax],edx
 0050680E    push        506825
 00506813    mov         eax,dword ptr [ebp-4]
 00506816    mov         byte ptr [eax+318],0
 0050681D    ret
>0050681E    jmp         @HandleFinally
>00506823    jmp         00506813
 00506825    mov         esp,ebp
 00506827    pop         ebp
 00506828    ret
*}
end;

//0050682C
procedure TCustomGrid.WMCancelMode(var Msg:TWMCancelMode);
begin
{*
 0050682C    push        ebx
 0050682D    mov         ebx,eax
 0050682F    mov         eax,ebx
 00506831    call        TControl.WMCancelMode
 00506836    mov         eax,ebx
 00506838    call        TCustomGrid.CancelMode
 0050683D    pop         ebx
 0050683E    ret
*}
end;

//00506840
procedure TCustomGrid.CMCancelMode(var Msg:TCMCancelMode);
begin
{*
 00506840    push        ebx
 00506841    push        esi
 00506842    mov         esi,edx
 00506844    mov         ebx,eax
 00506846    mov         eax,dword ptr [ebx+2EC]
 0050684C    test        eax,eax
>0050684E    je          0050685A
 00506850    mov         edx,esi
 00506852    mov         ecx,dword ptr [eax]
 00506854    call        dword ptr [ecx+84]
 0050685A    mov         edx,esi
 0050685C    mov         eax,ebx
 0050685E    mov         ecx,dword ptr [eax]
 00506860    call        dword ptr [ecx-10]
 00506863    mov         eax,ebx
 00506865    call        TCustomGrid.CancelMode
 0050686A    pop         esi
 0050686B    pop         ebx
 0050686C    ret
*}
end;

//00506870
procedure TCustomGrid.CMFontChanged(var Message:TMessage);
begin
{*
 00506870    push        ebx
 00506871    push        esi
 00506872    mov         esi,edx
 00506874    mov         ebx,eax
 00506876    mov         eax,dword ptr [ebx+2EC]
 0050687C    test        eax,eax
>0050687E    je          00506888
 00506880    mov         edx,dword ptr [ebx+64]
 00506883    call        TControl.SetFont
 00506888    mov         edx,esi
 0050688A    mov         eax,ebx
 0050688C    call        TWinControl.CMFontChanged
 00506891    pop         esi
 00506892    pop         ebx
 00506893    ret
*}
end;

//00506894
procedure TCustomGrid.CMMouseLeave(var Message:TMessage);
begin
{*
 00506894    push        ebx
 00506895    mov         ebx,eax
 00506897    mov         eax,ebx
 00506899    call        TControl.CMMouseLeave
 0050689E    mov         eax,dword ptr [ebx+328]
 005068A4    cmp         eax,0FFFFFFFF
>005068A7    jne         005068B2
 005068A9    cmp         dword ptr [ebx+32C],0FFFFFFFF
>005068B0    je          005068D5
 005068B2    mov         ecx,dword ptr [ebx+32C]
 005068B8    mov         edx,eax
 005068BA    mov         eax,ebx
 005068BC    call        TCustomGrid.InvalidateCell
 005068C1    mov         dword ptr [ebx+328],0FFFFFFFF
 005068CB    mov         dword ptr [ebx+32C],0FFFFFFFF
 005068D5    pop         ebx
 005068D6    ret
*}
end;

//005068D8
procedure TCustomGrid.CMCtl3DChanged(var Message:TMessage);
begin
{*
 005068D8    push        ebx
 005068D9    mov         ebx,eax
 005068DB    mov         eax,ebx
 005068DD    call        TWinControl.CMCtl3DChanged
 005068E2    mov         eax,ebx
 005068E4    call        TWinControl.RecreateWnd
 005068E9    pop         ebx
 005068EA    ret
*}
end;

//005068EC
procedure TCustomGrid.CMDesignHitTest(var Msg:TCMDesignHitTest);
begin
{*
 005068EC    push        ebx
 005068ED    push        esi
 005068EE    mov         ebx,edx
 005068F0    mov         esi,eax
 005068F2    movsx       ecx,word ptr [ebx+0A]
 005068F6    movsx       edx,word ptr [ebx+8]
 005068FA    mov         eax,esi
 005068FC    call        TCustomGrid.Sizing
 00506901    neg         al
 00506903    sbb         eax,eax
 00506905    mov         dword ptr [ebx+0C],eax
 00506908    pop         esi
 00506909    pop         ebx
 0050690A    ret
*}
end;

//0050690C
procedure TCustomGrid.CMWantSpecialKey(var Msg:TCMWantSpecialKey);
begin
{*
 0050690C    push        ebx
 0050690D    push        esi
 0050690E    mov         esi,edx
 00506910    mov         ebx,eax
 00506912    mov         edx,esi
 00506914    mov         eax,ebx
 00506916    mov         ecx,dword ptr [eax]
 00506918    call        dword ptr [ecx-10]
 0050691B    test        byte ptr [ebx+2B5],4
>00506922    je          00506932
 00506924    cmp         word ptr [esi+4],0D
>00506929    jne         00506932
 0050692B    mov         dword ptr [esi+0C],1
 00506932    pop         esi
 00506933    pop         ebx
 00506934    ret
*}
end;

//00506938
procedure TCustomGrid.TimedScroll(Direction:TGridScrollDirection);
begin
{*
 00506938    add         esp,0FFFFFFEC
 0050693B    mov         byte ptr [esp],dl
 0050693E    mov         edx,dword ptr [eax+278]
 00506944    mov         dword ptr [esp+0C],edx
 00506948    mov         edx,dword ptr [eax+27C]
 0050694E    mov         dword ptr [esp+10],edx
 00506952    mov         edx,dword ptr [eax+284]
 00506958    dec         edx
 00506959    mov         dword ptr [esp+4],edx
 0050695D    mov         edx,dword ptr [eax+2C0]
 00506963    dec         edx
 00506964    mov         dword ptr [esp+8],edx
 00506968    test        byte ptr [esp],1
>0050696C    je          00506980
 0050696E    mov         edx,dword ptr [eax+278]
 00506974    cmp         edx,dword ptr [eax+29C]
>0050697A    jle         00506980
 0050697C    dec         dword ptr [esp+0C]
 00506980    test        byte ptr [esp],2
>00506984    je          00506996
 00506986    mov         edx,dword ptr [eax+278]
 0050698C    cmp         edx,dword ptr [esp+4]
>00506990    jge         00506996
 00506992    inc         dword ptr [esp+0C]
 00506996    test        byte ptr [esp],4
>0050699A    je          005069AE
 0050699C    mov         edx,dword ptr [eax+27C]
 005069A2    cmp         edx,dword ptr [eax+2A0]
>005069A8    jle         005069AE
 005069AA    dec         dword ptr [esp+10]
 005069AE    test        byte ptr [esp],8
>005069B2    je          005069C4
 005069B4    mov         edx,dword ptr [eax+27C]
 005069BA    cmp         edx,dword ptr [esp+8]
>005069BE    jge         005069C4
 005069C0    inc         dword ptr [esp+10]
 005069C4    mov         edx,dword ptr [eax+278]
 005069CA    cmp         edx,dword ptr [esp+0C]
>005069CE    jne         005069DC
 005069D0    mov         edx,dword ptr [eax+27C]
 005069D6    cmp         edx,dword ptr [esp+10]
>005069DA    je          005069E5
 005069DC    lea         edx,[esp+0C]
 005069E0    call        TCustomGrid.MoveAnchor
 005069E5    add         esp,14
 005069E8    ret
*}
end;

//005069EC
procedure TCustomGrid.WMTimer(var Msg:TWMTimer);
begin
{*
 005069EC    push        ebx
 005069ED    push        esi
 005069EE    push        edi
 005069EF    add         esp,0FFFFFF88
 005069F2    mov         edi,eax
 005069F4    movzx       eax,byte ptr [edi+318]
 005069FB    sub         al,1
>005069FD    je          00506A09
 005069FF    add         al,0FD
 00506A01    sub         al,2
>00506A03    jae         00506B3A
 00506A09    push        esp
 00506A0A    call        user32.GetCursorPos
 00506A0F    lea         ecx,[esp+70]
 00506A13    mov         edx,esp
 00506A15    mov         eax,edi
 00506A17    call        TControl.ScreenToClient
 00506A1C    mov         eax,dword ptr [esp+70]
 00506A20    mov         dword ptr [esp],eax
 00506A23    mov         eax,dword ptr [esp+74]
 00506A27    mov         dword ptr [esp+4],eax
 00506A2B    lea         edx,[esp+10]
 00506A2F    mov         eax,edi
 00506A31    call        TCustomGrid.CalcDrawInfo
 00506A36    movzx       ebx,byte ptr ds:[506B44]
 00506A3D    lea         eax,[esp+10]
 00506A41    push        eax
 00506A42    lea         eax,[esp+0C]
 00506A46    push        eax
 00506A47    mov         ecx,dword ptr [esp+0C]
 00506A4B    mov         edx,dword ptr [esp+8]
 00506A4F    mov         eax,edi
 00506A51    call        TCustomGrid.CalcCoordFromPoint
 00506A56    movzx       eax,byte ptr [edi+318]
 00506A5D    dec         al
>00506A5F    je          00506AB7
 00506A61    sub         al,3
>00506A63    je          00506A92
 00506A65    dec         al
>00506A67    jne         00506B3A
 00506A6D    lea         eax,[esp+10]
 00506A71    push        eax
 00506A72    lea         eax,[esp+14]
 00506A76    push        eax
 00506A77    push        0
 00506A79    lea         eax,[esp+0C]
 00506A7D    push        eax
 00506A7E    mov         ecx,dword ptr [esp+18]
 00506A82    mov         edx,dword ptr [esp+10]
 00506A86    mov         eax,edi
 00506A88    call        TCustomGrid.MoveAndScroll
>00506A8D    jmp         00506B3A
 00506A92    lea         eax,[esp+10]
 00506A96    push        eax
 00506A97    lea         eax,[esp+44]
 00506A9B    push        eax
 00506A9C    push        1
 00506A9E    lea         eax,[esp+0C]
 00506AA2    push        eax
 00506AA3    mov         ecx,dword ptr [esp+1C]
 00506AA7    mov         edx,dword ptr [esp+14]
 00506AAB    mov         eax,edi
 00506AAD    call        TCustomGrid.MoveAndScroll
>00506AB2    jmp         00506B3A
 00506AB7    mov         eax,edi
 00506AB9    mov         si,0FFC7
 00506ABD    call        @CallDynaInst
 00506AC2    test        al,al
>00506AC4    jne         00506ADF
 00506AC6    mov         eax,dword ptr [esp]
 00506AC9    cmp         eax,dword ptr [esp+14]
>00506ACD    jge         00506AD4
 00506ACF    or          bl,1
>00506AD2    jmp         00506B0A
 00506AD4    cmp         eax,dword ptr [esp+24]
>00506AD8    jle         00506B0A
 00506ADA    or          bl,2
>00506ADD    jmp         00506B0A
 00506ADF    mov         eax,edi
 00506AE1    call        TControl.GetClientWidth
 00506AE6    mov         esi,eax
 00506AE8    sub         esi,dword ptr [esp+24]
 00506AEC    mov         eax,edi
 00506AEE    call        TControl.GetClientWidth
 00506AF3    sub         eax,dword ptr [esp+14]
 00506AF7    mov         edx,dword ptr [esp]
 00506AFA    cmp         esi,edx
>00506AFC    jle         00506B03
 00506AFE    or          bl,2
>00506B01    jmp         00506B0A
 00506B03    cmp         eax,edx
>00506B05    jge         00506B0A
 00506B07    or          bl,1
 00506B0A    mov         eax,dword ptr [esp+4]
 00506B0E    cmp         eax,dword ptr [esp+44]
>00506B12    jge         00506B19
 00506B14    or          bl,4
>00506B17    jmp         00506B22
 00506B19    cmp         eax,dword ptr [esp+54]
>00506B1D    jle         00506B22
 00506B1F    or          bl,8
 00506B22    movzx       eax,byte ptr ds:[506B44]
 00506B29    cmp         al,bl
>00506B2B    je          00506B3A
 00506B2D    mov         edx,ebx
 00506B2F    mov         eax,edi
 00506B31    mov         si,0FFA1
 00506B35    call        @CallDynaInst
 00506B3A    add         esp,78
 00506B3D    pop         edi
 00506B3E    pop         esi
 00506B3F    pop         ebx
 00506B40    ret
*}
end;

//00506B48
procedure TCustomGrid.ColWidthsChanged;
begin
{*
 00506B48    push        ebx
 00506B49    mov         ebx,eax
 00506B4B    mov         eax,ebx
 00506B4D    call        TCustomGrid.UpdateScrollRange
 00506B52    mov         eax,ebx
 00506B54    call        TCustomGrid.UpdateEdit
 00506B59    pop         ebx
 00506B5A    ret
*}
end;

//00506B5C
procedure TCustomGrid.RowHeightsChanged;
begin
{*
 00506B5C    push        ebx
 00506B5D    mov         ebx,eax
 00506B5F    mov         eax,ebx
 00506B61    call        TCustomGrid.UpdateScrollRange
 00506B66    mov         eax,ebx
 00506B68    call        TCustomGrid.UpdateEdit
 00506B6D    pop         ebx
 00506B6E    ret
*}
end;

//00506B70
procedure TCustomGrid.DeleteColumn(ACol:LongInt);
begin
{*
 00506B70    push        ebx
 00506B71    mov         ebx,eax
 00506B73    mov         ecx,dword ptr [ebx+284]
 00506B79    dec         ecx
 00506B7A    mov         eax,ebx
 00506B7C    call        TCustomGrid.MoveColumn
 00506B81    mov         edx,dword ptr [ebx+284]
 00506B87    dec         edx
 00506B88    mov         eax,ebx
 00506B8A    call        TCustomGrid.SetColCount
 00506B8F    pop         ebx
 00506B90    ret
*}
end;

//00506B94
procedure TCustomGrid.DeleteRow(ARow:LongInt);
begin
{*
 00506B94    push        ebx
 00506B95    mov         ebx,eax
 00506B97    mov         ecx,dword ptr [ebx+2C0]
 00506B9D    dec         ecx
 00506B9E    mov         eax,ebx
 00506BA0    call        TCustomGrid.MoveRow
 00506BA5    mov         edx,dword ptr [ebx+2C0]
 00506BAB    dec         edx
 00506BAC    mov         eax,ebx
 00506BAE    call        TCustomGrid.SetRowCount
 00506BB3    pop         ebx
 00506BB4    ret
*}
end;

//00506BB8
procedure TCustomGrid.UpdateDesigner;
begin
{*
 00506BB8    push        ebx
 00506BB9    mov         ebx,eax
 00506BBB    test        byte ptr [ebx+1C],10
>00506BBF    je          00506BF3
 00506BC1    mov         eax,ebx
 00506BC3    call        TWinControl.HandleAllocated
 00506BC8    test        al,al
>00506BCA    je          00506BF3
 00506BCC    test        byte ptr [ebx+1C],40
>00506BD0    jne         00506BF3
 00506BD2    mov         dl,1
 00506BD4    mov         eax,ebx
 00506BD6    call        GetParentForm
 00506BDB    test        eax,eax
>00506BDD    je          00506BF3
 00506BDF    cmp         dword ptr [eax+2BC],0
>00506BE6    je          00506BF3
 00506BE8    mov         eax,dword ptr [eax+2BC]
 00506BEE    mov         edx,dword ptr [eax]
 00506BF0    call        dword ptr [edx+0C]
 00506BF3    pop         ebx
 00506BF4    ret
*}
end;

//00506BF8
procedure TCustomGrid.DoMouseWheelDown(Shift:TShiftState; MousePos:TPoint);
begin
{*
 00506BF8    push        ebx
 00506BF9    push        esi
 00506BFA    push        edi
 00506BFB    add         esp,0FFFFFFF4
 00506BFE    mov         esi,ecx
 00506C00    lea         edi,[esp+4]
 00506C04    movs        dword ptr [edi],dword ptr [esi]
 00506C05    movs        dword ptr [edi],dword ptr [esi]
 00506C06    mov         word ptr [esp],dx
 00506C0A    mov         ebx,eax
 00506C0C    lea         ecx,[esp+4]
 00506C10    movzx       edx,word ptr [esp]
 00506C14    mov         eax,ebx
 00506C16    call        TControl.DoMouseWheelDown
 00506C1B    test        al,al
>00506C1D    jne         00506C3C
 00506C1F    mov         edx,dword ptr [ebx+2C0]
 00506C25    dec         edx
 00506C26    mov         eax,dword ptr [ebx+28C]
 00506C2C    cmp         edx,eax
>00506C2E    jle         00506C3A
 00506C30    mov         edx,eax
 00506C32    inc         edx
 00506C33    mov         eax,ebx
 00506C35    call        TCustomGrid.SetRow
 00506C3A    mov         al,1
 00506C3C    add         esp,0C
 00506C3F    pop         edi
 00506C40    pop         esi
 00506C41    pop         ebx
 00506C42    ret
*}
end;

//00506C44
procedure TCustomGrid.DoMouseWheelUp(Shift:TShiftState; MousePos:TPoint);
begin
{*
 00506C44    push        ebx
 00506C45    push        esi
 00506C46    push        edi
 00506C47    add         esp,0FFFFFFF4
 00506C4A    mov         esi,ecx
 00506C4C    lea         edi,[esp+4]
 00506C50    movs        dword ptr [edi],dword ptr [esi]
 00506C51    movs        dword ptr [edi],dword ptr [esi]
 00506C52    mov         word ptr [esp],dx
 00506C56    mov         ebx,eax
 00506C58    lea         ecx,[esp+4]
 00506C5C    movzx       edx,word ptr [esp]
 00506C60    mov         eax,ebx
 00506C62    call        TControl.DoMouseWheelUp
 00506C67    test        al,al
>00506C69    jne         00506C85
 00506C6B    mov         eax,dword ptr [ebx+28C]
 00506C71    cmp         eax,dword ptr [ebx+2A0]
>00506C77    jle         00506C83
 00506C79    mov         edx,eax
 00506C7B    dec         edx
 00506C7C    mov         eax,ebx
 00506C7E    call        TCustomGrid.SetRow
 00506C83    mov         al,1
 00506C85    add         esp,0C
 00506C88    pop         edi
 00506C89    pop         esi
 00506C8A    pop         ebx
 00506C8B    ret
*}
end;

//00506C8C
procedure TCustomGrid.BeginColumnDrag(var Origin:Integer; var Destination:Integer; const MousePt:TPoint);
begin
{*
 00506C8C    push        ebp
 00506C8D    mov         ebp,esp
 00506C8F    mov         al,1
 00506C91    pop         ebp
 00506C92    ret         4
*}
end;

//00506C98
procedure TCustomGrid.BeginRowDrag(var Origin:Integer; var Destination:Integer; const MousePt:TPoint);
begin
{*
 00506C98    push        ebp
 00506C99    mov         ebp,esp
 00506C9B    mov         al,1
 00506C9D    pop         ebp
 00506C9E    ret         4
*}
end;

//00506CA4
procedure TCustomGrid.CheckColumnDrag(var Origin:Integer; var Destination:Integer; const MousePt:TPoint);
begin
{*
 00506CA4    push        ebp
 00506CA5    mov         ebp,esp
 00506CA7    mov         al,1
 00506CA9    pop         ebp
 00506CAA    ret         4
*}
end;

//00506CB0
procedure TCustomGrid.CheckRowDrag(var Origin:Integer; var Destination:Integer; const MousePt:TPoint);
begin
{*
 00506CB0    push        ebp
 00506CB1    mov         ebp,esp
 00506CB3    mov         al,1
 00506CB5    pop         ebp
 00506CB6    ret         4
*}
end;

//00506CBC
procedure TCustomGrid.EndColumnDrag(var Origin:Integer; var Destination:Integer; const MousePt:TPoint);
begin
{*
 00506CBC    push        ebp
 00506CBD    mov         ebp,esp
 00506CBF    mov         al,1
 00506CC1    pop         ebp
 00506CC2    ret         4
*}
end;

//00506CC8
procedure TCustomGrid.EndRowDrag(var Origin:Integer; var Destination:Integer; const MousePt:TPoint);
begin
{*
 00506CC8    push        ebp
 00506CC9    mov         ebp,esp
 00506CCB    mov         al,1
 00506CCD    pop         ebp
 00506CCE    ret         4
*}
end;

//00506CD4
procedure TCustomGrid.CMShowingChanged(var Message:TMessage);
begin
{*
 00506CD4    push        ebx
 00506CD5    mov         ebx,eax
 00506CD7    mov         eax,ebx
 00506CD9    call        TWinControl.CMShowingChanged
 00506CDE    cmp         byte ptr [ebx+1EA],0
>00506CE5    je          00506CEE
 00506CE7    mov         eax,ebx
 00506CE9    call        TCustomGrid.UpdateScrollRange
 00506CEE    pop         ebx
 00506CEF    ret
*}
end;

//00506CF0
function TCustomDrawGrid.CellRect(ACol:Integer; ARow:Integer):TRect;
begin
{*
 00506CF0    push        ebp
 00506CF1    mov         ebp,esp
 00506CF3    push        ebx
 00506CF4    push        esi
 00506CF5    push        edi
 00506CF6    mov         edi,ecx
 00506CF8    mov         esi,edx
 00506CFA    mov         ebx,eax
 00506CFC    mov         eax,dword ptr [ebp+8]
 00506CFF    push        eax
 00506D00    mov         ecx,edi
 00506D02    mov         edx,esi
 00506D04    mov         eax,ebx
 00506D06    call        TCustomGrid.CellRect
 00506D0B    pop         edi
 00506D0C    pop         esi
 00506D0D    pop         ebx
 00506D0E    pop         ebp
 00506D0F    ret         4
*}
end;

//00506D14
procedure TCustomDrawGrid.MouseToCell(X:Integer; Y:Integer; var ARow:Integer; var ACol:Integer);
begin
{*
 00506D14    push        ebp
 00506D15    mov         ebp,esp
 00506D17    add         esp,0FFFFFFF8
 00506D1A    push        ebx
 00506D1B    push        esi
 00506D1C    push        edi
 00506D1D    mov         edi,ecx
 00506D1F    mov         esi,edx
 00506D21    mov         ebx,eax
 00506D23    lea         eax,[ebp-8]
 00506D26    push        eax
 00506D27    mov         ecx,edi
 00506D29    mov         edx,esi
 00506D2B    mov         eax,ebx
 00506D2D    call        TCustomGrid.MouseCoord
 00506D32    mov         eax,dword ptr [ebp+0C]
 00506D35    mov         edx,dword ptr [ebp-8]
 00506D38    mov         dword ptr [eax],edx
 00506D3A    mov         eax,dword ptr [ebp+8]
 00506D3D    mov         edx,dword ptr [ebp-4]
 00506D40    mov         dword ptr [eax],edx
 00506D42    pop         edi
 00506D43    pop         esi
 00506D44    pop         ebx
 00506D45    pop         ecx
 00506D46    pop         ecx
 00506D47    pop         ebp
 00506D48    ret         8
*}
end;

//00506D4C
procedure TCustomDrawGrid.ColumnMoved(FromIndex:LongInt; ToIndex:LongInt);
begin
{*
 00506D4C    push        ebx
 00506D4D    cmp         word ptr [eax+33A],0
>00506D55    je          00506D6A
 00506D57    push        ecx
 00506D58    mov         ebx,eax
 00506D5A    mov         ecx,edx
 00506D5C    mov         edx,eax
 00506D5E    mov         eax,dword ptr [ebx+33C]
 00506D64    call        dword ptr [ebx+338]
 00506D6A    pop         ebx
 00506D6B    ret
*}
end;

//00506D6C
procedure TCustomDrawGrid.GetEditMask(ACol:LongInt; ARow:LongInt);
begin
{*
 00506D6C    push        ebp
 00506D6D    mov         ebp,esp
 00506D6F    push        ecx
 00506D70    push        ebx
 00506D71    push        esi
 00506D72    push        edi
 00506D73    mov         dword ptr [ebp-4],ecx
 00506D76    mov         edi,edx
 00506D78    mov         ebx,eax
 00506D7A    mov         esi,dword ptr [ebp+8]
 00506D7D    mov         eax,esi
 00506D7F    call        @UStrClr
 00506D84    cmp         word ptr [ebx+34A],0
>00506D8C    je          00506DA3
 00506D8E    mov         eax,dword ptr [ebp-4]
 00506D91    push        eax
 00506D92    push        esi
 00506D93    mov         ecx,edi
 00506D95    mov         edx,ebx
 00506D97    mov         eax,dword ptr [ebx+34C]
 00506D9D    call        dword ptr [ebx+348]
 00506DA3    pop         edi
 00506DA4    pop         esi
 00506DA5    pop         ebx
 00506DA6    pop         ecx
 00506DA7    pop         ebp
 00506DA8    ret         4
*}
end;

//00506DAC
procedure TCustomDrawGrid.GetEditText(ACol:LongInt; ARow:LongInt);
begin
{*
 00506DAC    push        ebp
 00506DAD    mov         ebp,esp
 00506DAF    push        ecx
 00506DB0    push        ebx
 00506DB1    push        esi
 00506DB2    push        edi
 00506DB3    mov         dword ptr [ebp-4],ecx
 00506DB6    mov         edi,edx
 00506DB8    mov         ebx,eax
 00506DBA    mov         esi,dword ptr [ebp+8]
 00506DBD    mov         eax,esi
 00506DBF    call        @UStrClr
 00506DC4    cmp         word ptr [ebx+352],0
>00506DCC    je          00506DE3
 00506DCE    mov         eax,dword ptr [ebp-4]
 00506DD1    push        eax
 00506DD2    push        esi
 00506DD3    mov         ecx,edi
 00506DD5    mov         edx,ebx
 00506DD7    mov         eax,dword ptr [ebx+354]
 00506DDD    call        dword ptr [ebx+350]
 00506DE3    pop         edi
 00506DE4    pop         esi
 00506DE5    pop         ebx
 00506DE6    pop         ecx
 00506DE7    pop         ebp
 00506DE8    ret         4
*}
end;

//00506DEC
procedure TCustomDrawGrid.RowMoved(FromIndex:LongInt; ToIndex:LongInt);
begin
{*
 00506DEC    push        ebx
 00506DED    cmp         word ptr [eax+35A],0
>00506DF5    je          00506E0A
 00506DF7    push        ecx
 00506DF8    mov         ebx,eax
 00506DFA    mov         ecx,edx
 00506DFC    mov         edx,eax
 00506DFE    mov         eax,dword ptr [ebx+35C]
 00506E04    call        dword ptr [ebx+358]
 00506E0A    pop         ebx
 00506E0B    ret
*}
end;

//00506E0C
function TCustomDrawGrid.SelectCell(ACol:LongInt; ARow:LongInt):Boolean;
begin
{*
 00506E0C    push        ebx
 00506E0D    push        ecx
 00506E0E    mov         byte ptr [esp],1
 00506E12    cmp         word ptr [eax+362],0
>00506E1A    je          00506E34
 00506E1C    push        ecx
 00506E1D    lea         ecx,[esp+4]
 00506E21    push        ecx
 00506E22    mov         ebx,eax
 00506E24    mov         ecx,edx
 00506E26    mov         edx,eax
 00506E28    mov         eax,dword ptr [ebx+364]
 00506E2E    call        dword ptr [ebx+360]
 00506E34    movzx       eax,byte ptr [esp]
 00506E38    pop         edx
 00506E39    pop         ebx
 00506E3A    ret
*}
end;

//00506E3C
procedure TCustomDrawGrid.SetEditText(ACol:LongInt; ARow:LongInt; const Value:UnicodeString);
begin
{*
 00506E3C    push        ebp
 00506E3D    mov         ebp,esp
 00506E3F    push        ebx
 00506E40    cmp         word ptr [eax+36A],0
>00506E48    je          00506E61
 00506E4A    push        ecx
 00506E4B    mov         ecx,dword ptr [ebp+8]
 00506E4E    push        ecx
 00506E4F    mov         ebx,eax
 00506E51    mov         ecx,edx
 00506E53    mov         edx,eax
 00506E55    mov         eax,dword ptr [ebx+36C]
 00506E5B    call        dword ptr [ebx+368]
 00506E61    pop         ebx
 00506E62    pop         ebp
 00506E63    ret         4
*}
end;

//00506E68
procedure TCustomDrawGrid.DrawCell(ACol:LongInt; ARow:LongInt; ARect:TRect; AState:TGridDrawState);
begin
{*
 00506E68    push        ebp
 00506E69    mov         ebp,esp
 00506E6B    add         esp,0FFFFFFEC
 00506E6E    push        ebx
 00506E6F    push        esi
 00506E70    push        edi
 00506E71    mov         esi,dword ptr [ebp+0C]
 00506E74    lea         edi,[ebp-14]
 00506E77    movs        dword ptr [edi],dword ptr [esi]
 00506E78    movs        dword ptr [edi],dword ptr [esi]
 00506E79    movs        dword ptr [edi],dword ptr [esi]
 00506E7A    movs        dword ptr [edi],dword ptr [esi]
 00506E7B    mov         dword ptr [ebp-4],ecx
 00506E7E    mov         edi,edx
 00506E80    mov         ebx,eax
 00506E82    cmp         word ptr [ebx+342],0
>00506E8A    je          00506EFE
 00506E8C    mov         eax,ebx
 00506E8E    mov         si,0FFC7
 00506E92    call        @CallDynaInst
 00506E97    test        al,al
>00506E99    je          00506EC9
 00506E9B    mov         eax,ebx
 00506E9D    call        TControl.GetClientWidth
 00506EA2    sub         eax,dword ptr [ebp-14]
 00506EA5    mov         dword ptr [ebp-14],eax
 00506EA8    mov         eax,ebx
 00506EAA    call        TControl.GetClientWidth
 00506EAF    mov         esi,eax
 00506EB1    sub         esi,dword ptr [ebp-0C]
 00506EB4    mov         dword ptr [ebp-0C],esi
 00506EB7    mov         eax,dword ptr [ebp-14]
 00506EBA    mov         dword ptr [ebp-14],esi
 00506EBD    mov         dword ptr [ebp-0C],eax
 00506EC0    xor         edx,edx
 00506EC2    mov         eax,ebx
 00506EC4    call        TCustomGrid.ChangeGridOrientation
 00506EC9    mov         eax,dword ptr [ebp-4]
 00506ECC    push        eax
 00506ECD    lea         eax,[ebp-14]
 00506ED0    push        eax
 00506ED1    movzx       eax,byte ptr [ebp+8]
 00506ED5    push        eax
 00506ED6    mov         ecx,edi
 00506ED8    mov         edx,ebx
 00506EDA    mov         eax,dword ptr [ebx+344]
 00506EE0    call        dword ptr [ebx+340]
 00506EE6    mov         eax,ebx
 00506EE8    mov         si,0FFC7
 00506EEC    call        @CallDynaInst
 00506EF1    test        al,al
>00506EF3    je          00506EFE
 00506EF5    mov         dl,1
 00506EF7    mov         eax,ebx
 00506EF9    call        TCustomGrid.ChangeGridOrientation
 00506EFE    pop         edi
 00506EFF    pop         esi
 00506F00    pop         ebx
 00506F01    mov         esp,ebp
 00506F03    pop         ebp
 00506F04    ret         8
*}
end;

//00506F08
procedure TCustomDrawGrid.TopLeftChanged;
begin
{*
 00506F08    push        ebx
 00506F09    mov         ebx,eax
 00506F0B    mov         eax,ebx
 00506F0D    call        TCustomGrid.TopLeftChanged
 00506F12    cmp         word ptr [ebx+372],0
>00506F1A    je          00506F2A
 00506F1C    mov         edx,ebx
 00506F1E    mov         eax,dword ptr [ebx+374]
 00506F24    call        dword ptr [ebx+370]
 00506F2A    pop         ebx
 00506F2B    ret
*}
end;

//00507148
procedure TPopupListbox.CreateParams(var Params:TCreateParams);
begin
{*
 00507148    push        ebx
 00507149    push        esi
 0050714A    mov         ebx,edx
 0050714C    mov         esi,eax
 0050714E    mov         edx,ebx
 00507150    mov         eax,esi
 00507152    call        TCustomListBox.CreateParams
 00507157    or          dword ptr [ebx+4],800000
 0050715E    mov         dword ptr [ebx+8],88
 00507165    lea         edx,[ebx+8]
 00507168    mov         eax,esi
 0050716A    call        TWinControl.AddBiDiModeExStyle
 0050716F    mov         dword ptr [ebx+24],800
 00507176    pop         esi
 00507177    pop         ebx
 00507178    ret
*}
end;

//0050717C
procedure TPopupListbox.CreateWnd;
begin
{*
 0050717C    push        ebx
 0050717D    mov         ebx,eax
 0050717F    mov         eax,ebx
 00507181    call        TCustomListBox.CreateWnd
 00507186    push        0
 00507188    mov         eax,ebx
 0050718A    call        TWinControl.GetHandle
 0050718F    push        eax
 00507190    call        user32.SetParent
 00507195    push        0
 00507197    push        0
 00507199    push        7
 0050719B    mov         eax,ebx
 0050719D    call        TWinControl.GetHandle
 005071A2    push        eax
 005071A3    mov         eax,dword ptr [ebx+254]
 005071A9    push        eax
 005071AA    call        user32.CallWindowProcW
 005071AF    pop         ebx
 005071B0    ret
*}
end;

//005071B4
procedure TPopupListbox.KeyPress(var Key:Char);
begin
{*
 005071B4    push        ebp
 005071B5    mov         ebp,esp
 005071B7    push        0
 005071B9    push        ebx
 005071BA    push        esi
 005071BB    push        edi
 005071BC    mov         esi,edx
 005071BE    mov         ebx,eax
 005071C0    xor         eax,eax
 005071C2    push        ebp
 005071C3    push        50728D
 005071C8    push        dword ptr fs:[eax]
 005071CB    mov         dword ptr fs:[eax],esp
 005071CE    movzx       eax,word ptr [esi]
 005071D1    sub         ax,8
>005071D5    je          005071EB
 005071D7    sub         ax,13
>005071DB    je          005071EB
 005071DD    add         eax,0FFFFFFFB
 005071E0    sub         ax,0FFE0
>005071E4    jb          005071F8
>005071E6    jmp         0050726E
 005071EB    lea         eax,[ebx+2F0]
 005071F1    call        @UStrClr
>005071F6    jmp         0050726E
 005071F8    call        kernel32.GetTickCount
 005071FD    mov         edi,eax
 005071FF    mov         eax,edi
 00507201    sub         eax,dword ptr [ebx+2F4]
 00507207    cmp         eax,7D0
>0050720C    jle         00507219
 0050720E    lea         eax,[ebx+2F0]
 00507214    call        @UStrClr
 00507219    mov         dword ptr [ebx+2F4],edi
 0050721F    mov         eax,dword ptr [ebx+2F0]
 00507225    test        eax,eax
>00507227    je          0050722E
 00507229    sub         eax,4
 0050722C    mov         eax,dword ptr [eax]
 0050722E    cmp         eax,20
>00507231    jge         0050724C
 00507233    lea         eax,[ebp-4]
 00507236    movzx       edx,word ptr [esi]
 00507239    call        @UStrFromWChar
 0050723E    mov         edx,dword ptr [ebp-4]
 00507241    lea         eax,[ebx+2F0]
 00507247    call        @UStrCat
 0050724C    mov         eax,dword ptr [ebx+2F0]
 00507252    push        eax
 00507253    mov         eax,ebx
 00507255    call        TWinControl.GetHandle
 0050725A    mov         ecx,0FFFF
 0050725F    mov         edx,18C
 00507264    call        SendTextMessage
 00507269    mov         word ptr [esi],0
 0050726E    mov         edx,esi
 00507270    mov         eax,ebx
 00507272    call        TCustomListBox.KeyPress
 00507277    xor         eax,eax
 00507279    pop         edx
 0050727A    pop         ecx
 0050727B    pop         ecx
 0050727C    mov         dword ptr fs:[eax],edx
 0050727F    push        507294
 00507284    lea         eax,[ebp-4]
 00507287    call        @UStrClr
 0050728C    ret
>0050728D    jmp         @HandleFinally
>00507292    jmp         00507284
 00507294    pop         edi
 00507295    pop         esi
 00507296    pop         ebx
 00507297    pop         ecx
 00507298    pop         ebp
 00507299    ret
*}
end;

//0050729C
procedure TPopupListbox.MouseUp(Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer);
begin
{*
 0050729C    push        ebp
 0050729D    mov         ebp,esp
 0050729F    push        ecx
 005072A0    push        ebx
 005072A1    push        esi
 005072A2    push        edi
 005072A3    mov         word ptr [ebp-3],cx
 005072A7    mov         byte ptr [ebp-1],dl
 005072AA    mov         esi,eax
 005072AC    mov         ebx,dword ptr [ebp+8]
 005072AF    mov         edi,dword ptr [ebp+0C]
 005072B2    push        edi
 005072B3    push        ebx
 005072B4    movzx       ecx,word ptr [ebp-3]
 005072B8    movzx       edx,byte ptr [ebp-1]
 005072BC    mov         eax,esi
 005072BE    call        TControl.MouseUp
 005072C3    test        edi,edi
>005072C5    jl          005072D5
 005072C7    test        ebx,ebx
>005072C9    jl          005072D5
 005072CB    cmp         edi,dword ptr [esi+48]
>005072CE    jge         005072D5
 005072D0    cmp         ebx,dword ptr [esi+4C]
>005072D3    jl          005072D9
 005072D5    xor         edx,edx
>005072D7    jmp         005072DB
 005072D9    mov         dl,1
 005072DB    mov         eax,dword ptr [esi+4]
 005072DE    mov         si,0FFAE
 005072E2    call        @CallDynaInst
 005072E7    pop         edi
 005072E8    pop         esi
 005072E9    pop         ebx
 005072EA    pop         ecx
 005072EB    pop         ebp
 005072EC    ret         8
*}
end;

//005072F0
constructor TInplaceEditList.Create;
begin
{*
 005072F0    push        ebx
 005072F1    push        esi
 005072F2    test        dl,dl
>005072F4    je          005072FE
 005072F6    add         esp,0FFFFFFF0
 005072F9    call        @ClassCreate
 005072FE    mov         ebx,edx
 00507300    mov         esi,eax
 00507302    xor         edx,edx
 00507304    mov         eax,esi
 00507306    call        TInplaceEdit.Create
 0050730B    push        2
 0050730D    call        user32.GetSystemMetrics
 00507312    mov         dword ptr [esi+2C8],eax
 00507318    mov         byte ptr [esi+2D4],0
 0050731F    mov         eax,esi
 00507321    test        bl,bl
>00507323    je          00507334
 00507325    call        @AfterConstruction
 0050732A    pop         dword ptr fs:[0]
 00507331    add         esp,0C
 00507334    mov         eax,esi
 00507336    pop         esi
 00507337    pop         ebx
 00507338    ret
*}
end;

//0050733C
procedure TInplaceEditList.BoundsChanged;
begin
{*
 0050733C    push        ebx
 0050733D    push        esi
 0050733E    add         esp,0FFFFFFF0
 00507341    mov         ebx,eax
 00507343    mov         eax,dword ptr [ebx+4C]
 00507346    push        eax
 00507347    mov         eax,dword ptr [ebx+48]
 0050734A    sub         eax,2
 0050734D    push        eax
 0050734E    push        2
 00507350    push        2
 00507352    lea         eax,[esp+10]
 00507356    push        eax
 00507357    call        user32.SetRect
 0050735C    cmp         byte ptr [ebx+2D4],0
>00507363    je          00507390
 00507365    mov         eax,dword ptr [ebx+2C0]
 0050736B    mov         si,0FFC7
 0050736F    call        @CallDynaInst
 00507374    test        al,al
>00507376    jne         00507384
 00507378    mov         eax,dword ptr [ebx+2C8]
 0050737E    sub         dword ptr [esp+8],eax
>00507382    jmp         00507390
 00507384    mov         eax,dword ptr [ebx+2C8]
 0050738A    sub         eax,2
 0050738D    add         dword ptr [esp],eax
 00507390    push        esp
 00507391    mov         eax,ebx
 00507393    call        TWinControl.GetHandle
 00507398    xor         ecx,ecx
 0050739A    mov         edx,0B4
 0050739F    call        SendStructMessage
 005073A4    push        0
 005073A6    push        0
 005073A8    push        0B7
 005073AD    mov         eax,ebx
 005073AF    call        TWinControl.GetHandle
 005073B4    push        eax
 005073B5    call        user32.SendMessageW
 005073BA    mov         eax,[0078DB7C];SysLocale:TSysLocale
 005073BF    cmp         byte ptr [eax+0C],0
>005073C3    je          005073D8
 005073C5    mov         eax,dword ptr [esp+4]
 005073C9    push        eax
 005073CA    mov         ecx,dword ptr [esp+4]
 005073CE    mov         edx,dword ptr [ebx+64]
 005073D1    mov         eax,ebx
 005073D3    call        TWinControl.SetImeCompositionWindow
 005073D8    add         esp,10
 005073DB    pop         esi
 005073DC    pop         ebx
 005073DD    ret
*}
end;

//005073E0
procedure TInplaceEditList.CloseUp(Accept:Boolean);
begin
{*
 005073E0    push        ebp
 005073E1    mov         ebp,esp
 005073E3    mov         ecx,4
 005073E8    push        0
 005073EA    push        0
 005073EC    dec         ecx
>005073ED    jne         005073E8
 005073EF    push        ecx
 005073F0    push        ebx
 005073F1    push        esi
 005073F2    push        edi
 005073F3    mov         ebx,edx
 005073F5    mov         esi,eax
 005073F7    xor         eax,eax
 005073F9    push        ebp
 005073FA    push        50757D
 005073FF    push        dword ptr fs:[eax]
 00507402    mov         dword ptr fs:[eax],esp
 00507405    cmp         byte ptr [esi+2DC],0
>0050740C    je          00507545
 00507412    mov         eax,dword ptr [esi+2D0]
 00507418    cmp         eax,dword ptr [esi+2CC]
>0050741E    jne         00507545
 00507424    call        user32.GetCapture
 00507429    test        eax,eax
>0050742B    je          0050743E
 0050742D    push        0
 0050742F    push        0
 00507431    push        1F
 00507433    call        user32.GetCapture
 00507438    push        eax
 00507439    call        user32.SendMessageW
 0050743E    mov         eax,esi
 00507440    call        TInplaceEditList.GetPickList
 00507445    mov         edx,dword ptr [eax]
 00507447    call        dword ptr [edx+0EC]
 0050744D    inc         eax
>0050744E    je          00507481
 00507450    mov         eax,esi
 00507452    call        TInplaceEditList.GetPickList
 00507457    mov         edx,dword ptr [eax]
 00507459    call        dword ptr [edx+0EC]
 0050745F    push        eax
 00507460    mov         eax,esi
 00507462    call        TInplaceEditList.GetPickList
 00507467    mov         eax,dword ptr [eax+280]
 0050746D    lea         ecx,[ebp-14]
 00507470    pop         edx
 00507471    mov         edi,dword ptr [eax]
 00507473    call        dword ptr [edi+0C]
 00507476    mov         edx,dword ptr [ebp-14]
 00507479    lea         eax,[ebp-10]
 0050747C    call        @VarFromUStr
 00507481    push        97
 00507486    push        0
 00507488    push        0
 0050748A    push        0
 0050748C    push        0
 0050748E    push        0
 00507490    mov         eax,dword ptr [esi+2D0]
 00507496    call        TWinControl.GetHandle
 0050749B    push        eax
 0050749C    call        user32.SetWindowPos
 005074A1    mov         byte ptr [esi+2DC],0
 005074A8    mov         eax,esi
 005074AA    call        TInplaceEdit.Invalidate
 005074AF    test        bl,bl
>005074B1    je          00507545
 005074B7    lea         eax,[ebp-10]
 005074BA    call        VarIsEmpty
 005074BF    test        al,al
>005074C1    je          005074CF
 005074C3    lea         eax,[ebp-10]
 005074C6    call        VarIsNull
 005074CB    test        al,al
>005074CD    je          00507545
 005074CF    lea         edx,[ebp-18]
 005074D2    lea         eax,[ebp-10]
 005074D5    call        VarToStr
 005074DA    mov         eax,dword ptr [ebp-18]
 005074DD    push        eax
 005074DE    lea         edx,[ebp-1C]
 005074E1    mov         eax,esi
 005074E3    call        TCustomMaskEdit.GetText
 005074E8    mov         edx,dword ptr [ebp-1C]
 005074EB    pop         eax
 005074EC    call        @UStrEqual
>005074F1    je          00507545
 005074F3    lea         eax,[ebp-20]
 005074F6    lea         edx,[ebp-10]
 005074F9    call        @VarToUStr
 005074FE    mov         eax,dword ptr [ebp-20]
 00507501    push        eax
 00507502    xor         ecx,ecx
 00507504    mov         edx,0C
 00507509    mov         eax,esi
 0050750B    call        TControl.Perform
 00507510    mov         dl,1
 00507512    mov         eax,esi
 00507514    call        TCustomEdit.SetModified
 00507519    mov         ebx,dword ptr [esi+2C0]
 0050751F    lea         edx,[ebp-24]
 00507522    lea         eax,[ebp-10]
 00507525    call        VarToStr
 0050752A    mov         eax,dword ptr [ebp-24]
 0050752D    push        eax
 0050752E    mov         ecx,dword ptr [ebx+28C]
 00507534    mov         edx,dword ptr [ebx+288]
 0050753A    mov         eax,ebx
 0050753C    mov         si,0FFA9
 00507540    call        @CallDynaInst
 00507545    xor         eax,eax
 00507547    pop         edx
 00507548    pop         ecx
 00507549    pop         ecx
 0050754A    mov         dword ptr fs:[eax],edx
 0050754D    push        507584
 00507552    lea         eax,[ebp-24]
 00507555    mov         edx,2
 0050755A    call        @UStrArrayClr
 0050755F    lea         eax,[ebp-1C]
 00507562    call        @UStrClr
 00507567    lea         eax,[ebp-18]
 0050756A    mov         edx,2
 0050756F    call        @UStrArrayClr
 00507574    lea         eax,[ebp-10]
 00507577    call        @VarClr
 0050757C    ret
>0050757D    jmp         @HandleFinally
>00507582    jmp         00507552
 00507584    pop         edi
 00507585    pop         esi
 00507586    pop         ebx
 00507587    mov         esp,ebp
 00507589    pop         ebp
 0050758A    ret
*}
end;

//0050758C
procedure TInplaceEditList.DoDropDownKeys(var Key:Word; Shift:TShiftState);
begin
{*
 0050758C    push        esi
 0050758D    push        edi
 0050758E    push        ecx
 0050758F    mov         word ptr [esp],cx
 00507593    mov         edi,edx
 00507595    movzx       edx,word ptr [edi]
 00507598    sub         dx,0D
>0050759C    je          005075DC
 0050759E    sub         dx,0E
>005075A2    je          005075DC
 005075A4    sub         dx,0B
>005075A8    je          005075B0
 005075AA    sub         dx,2
>005075AE    jne         00507600
 005075B0    test        byte ptr [esp],2
>005075B4    je          00507600
 005075B6    cmp         byte ptr [eax+2DC],0
>005075BD    je          005075CC
 005075BF    mov         dl,1
 005075C1    mov         si,0FFAE
 005075C5    call        @CallDynaInst
>005075CA    jmp         005075D5
 005075CC    mov         si,0FFAC
 005075D0    call        @CallDynaInst
 005075D5    mov         word ptr [edi],0
>005075DA    jmp         00507600
 005075DC    cmp         byte ptr [eax+2DC],0
>005075E3    je          00507600
 005075E5    test        byte ptr [esp],2
>005075E9    jne         00507600
 005075EB    cmp         word ptr [edi],0D
 005075EF    sete        dl
 005075F2    mov         si,0FFAE
 005075F6    call        @CallDynaInst
 005075FB    mov         word ptr [edi],0
 00507600    pop         edx
 00507601    pop         edi
 00507602    pop         esi
 00507603    ret
*}
end;

//00507604
procedure TInplaceEditList.DoEditButtonClick;
begin
{*
 00507604    push        ebx
 00507605    cmp         word ptr [eax+2EA],0
>0050760D    je          00507623
 0050760F    mov         ebx,eax
 00507611    mov         edx,dword ptr [eax+2C0]
 00507617    mov         eax,dword ptr [ebx+2EC]
 0050761D    call        dword ptr [ebx+2E8]
 00507623    pop         ebx
 00507624    ret
*}
end;

//00507628
procedure TInplaceEditList.DoGetPickListItems;
begin
{*
 00507628    push        ebx
 00507629    push        esi
 0050762A    mov         ebx,eax
 0050762C    cmp         byte ptr [ebx+2DF],0
>00507633    jne         00507688
 00507635    cmp         word ptr [ebx+2E2],0
>0050763D    je          0050766B
 0050763F    mov         eax,ebx
 00507641    call        TInplaceEditList.GetPickList
 00507646    mov         eax,dword ptr [eax+280]
 0050764C    push        eax
 0050764D    mov         esi,dword ptr [ebx+2C0]
 00507653    mov         ecx,dword ptr [esi+28C]
 00507659    mov         edx,dword ptr [esi+288]
 0050765F    mov         eax,dword ptr [ebx+2E4]
 00507665    call        dword ptr [ebx+2E0]
 0050766B    mov         eax,ebx
 0050766D    call        TInplaceEditList.GetPickList
 00507672    mov         eax,dword ptr [eax+280]
 00507678    mov         edx,dword ptr [eax]
 0050767A    call        dword ptr [edx+14]
 0050767D    test        eax,eax
 0050767F    setg        al
 00507682    mov         byte ptr [ebx+2DF],al
 00507688    pop         esi
 00507689    pop         ebx
 0050768A    ret
*}
end;

//0050768C
function TInplaceEditList.GetPickList:TCustomListBox;
begin
{*
 0050768C    push        ebx
 0050768D    push        esi
 0050768E    mov         ebx,eax
 00507690    cmp         dword ptr [ebx+2CC],0
>00507697    jne         005076E6
 00507699    mov         ecx,ebx
 0050769B    mov         dl,1
 0050769D    mov         eax,[00506F2C];TPopupListbox
 005076A2    call        TCustomListBox.Create
 005076A7    mov         esi,eax
 005076A9    xor         edx,edx
 005076AB    mov         eax,esi
 005076AD    call        TControl.SetVisible
 005076B2    mov         edx,ebx
 005076B4    mov         eax,esi
 005076B6    mov         ecx,dword ptr [eax]
 005076B8    call        dword ptr [ecx+78]
 005076BB    mov         dword ptr [esi+0D4],ebx
 005076C1    mov         dword ptr [esi+0D0],5079CC;TInplaceEditList.ListMouseUp
 005076CB    mov         dl,1
 005076CD    mov         eax,esi
 005076CF    call        TCustomListBox.SetIntegralHeight
 005076D4    mov         edx,0B
 005076D9    mov         eax,esi
 005076DB    call        TCustomListBox.SetItemHeight
 005076E0    mov         dword ptr [ebx+2CC],esi
 005076E6    mov         eax,dword ptr [ebx+2CC]
 005076EC    pop         esi
 005076ED    pop         ebx
 005076EE    ret
*}
end;

//005076F0
procedure TInplaceEditList.DropDown;
begin
{*
 005076F0    push        ebp
 005076F1    mov         ebp,esp
 005076F3    add         esp,0FFFFFFD8
 005076F6    push        ebx
 005076F7    push        esi
 005076F8    push        edi
 005076F9    xor         edx,edx
 005076FB    mov         dword ptr [ebp-28],edx
 005076FE    mov         dword ptr [ebp-24],edx
 00507701    mov         dword ptr [ebp-20],edx
 00507704    mov         ebx,eax
 00507706    xor         eax,eax
 00507708    push        ebp
 00507709    push        507961
 0050770E    push        dword ptr fs:[eax]
 00507711    mov         dword ptr fs:[eax],esp
 00507714    cmp         byte ptr [ebx+2DC],0
>0050771B    jne         0050793E
 00507721    mov         edx,dword ptr [ebx+48]
 00507724    mov         eax,dword ptr [ebx+2D0]
 0050772A    call        TControl.SetWidth
 0050772F    mov         eax,dword ptr [ebx+2D0]
 00507735    cmp         eax,dword ptr [ebx+2CC]
>0050773B    jne         005078BD
 00507741    mov         eax,ebx
 00507743    mov         si,0FFAD
 00507747    call        @CallDynaInst
 0050774C    mov         eax,ebx
 0050774E    call        TInplaceEditList.GetPickList
 00507753    mov         edx,dword ptr [ebx+6C]
 00507756    call        TControl.SetColor
 0050775B    mov         eax,ebx
 0050775D    call        TInplaceEditList.GetPickList
 00507762    mov         edx,dword ptr [ebx+64]
 00507765    call        TControl.SetFont
 0050776A    cmp         dword ptr [ebx+2D8],0
>00507771    jle         005077B2
 00507773    mov         eax,ebx
 00507775    call        TInplaceEditList.GetPickList
 0050777A    mov         eax,dword ptr [eax+280]
 00507780    mov         edx,dword ptr [eax]
 00507782    call        dword ptr [edx+14]
 00507785    cmp         eax,dword ptr [ebx+2D8]
>0050778B    jl          005077B2
 0050778D    mov         eax,ebx
 0050778F    call        TInplaceEditList.GetPickList
 00507794    call        TCustomListBox.GetItemHeight
 00507799    imul        dword ptr [ebx+2D8]
 0050779F    add         eax,4
 005077A2    push        eax
 005077A3    mov         eax,ebx
 005077A5    call        TInplaceEditList.GetPickList
 005077AA    pop         edx
 005077AB    call        TControl.SetHeight
>005077B0    jmp         005077E6
 005077B2    mov         eax,ebx
 005077B4    call        TInplaceEditList.GetPickList
 005077B9    mov         eax,dword ptr [eax+280]
 005077BF    mov         edx,dword ptr [eax]
 005077C1    call        dword ptr [edx+14]
 005077C4    mov         esi,eax
 005077C6    mov         eax,ebx
 005077C8    call        TInplaceEditList.GetPickList
 005077CD    call        TCustomListBox.GetItemHeight
 005077D2    imul        esi,eax
 005077D5    add         esi,4
 005077D8    push        esi
 005077D9    mov         eax,ebx
 005077DB    call        TInplaceEditList.GetPickList
 005077E0    pop         edx
 005077E1    call        TControl.SetHeight
 005077E6    lea         edx,[ebp-20]
 005077E9    mov         eax,ebx
 005077EB    call        TCustomMaskEdit.GetText
 005077F0    cmp         dword ptr [ebp-20],0
>005077F4    jne         0050780A
 005077F6    mov         eax,ebx
 005077F8    call        TInplaceEditList.GetPickList
 005077FD    or          edx,0FFFFFFFF
 00507800    mov         ecx,dword ptr [eax]
 00507802    call        dword ptr [ecx+0F0]
>00507808    jmp         0050783C
 0050780A    lea         edx,[ebp-24]
 0050780D    mov         eax,ebx
 0050780F    call        TCustomMaskEdit.GetText
 00507814    mov         eax,dword ptr [ebp-24]
 00507817    push        eax
 00507818    mov         eax,ebx
 0050781A    call        TInplaceEditList.GetPickList
 0050781F    mov         eax,dword ptr [eax+280]
 00507825    pop         edx
 00507826    mov         ecx,dword ptr [eax]
 00507828    call        dword ptr [ecx+54]
 0050782B    push        eax
 0050782C    mov         eax,ebx
 0050782E    call        TInplaceEditList.GetPickList
 00507833    pop         edx
 00507834    mov         ecx,dword ptr [eax]
 00507836    call        dword ptr [ecx+0F0]
 0050783C    mov         eax,ebx
 0050783E    call        TInplaceEditList.GetPickList
 00507843    call        TControl.GetClientWidth
 00507848    mov         dword ptr [ebp-10],eax
 0050784B    mov         eax,ebx
 0050784D    call        TInplaceEditList.GetPickList
 00507852    mov         eax,dword ptr [eax+280]
 00507858    mov         edx,dword ptr [eax]
 0050785A    call        dword ptr [edx+14]
 0050785D    dec         eax
 0050785E    test        eax,eax
>00507860    jl          005078AE
 00507862    inc         eax
 00507863    mov         dword ptr [ebp-14],eax
 00507866    mov         dword ptr [ebp-0C],0
 0050786D    mov         eax,ebx
 0050786F    call        TInplaceEditList.GetPickList
 00507874    mov         eax,dword ptr [eax+280]
 0050787A    lea         ecx,[ebp-28]
 0050787D    mov         edx,dword ptr [ebp-0C]
 00507880    mov         esi,dword ptr [eax]
 00507882    call        dword ptr [esi+0C]
 00507885    mov         eax,dword ptr [ebp-28]
 00507888    push        eax
 00507889    mov         eax,ebx
 0050788B    call        TInplaceEditList.GetPickList
 00507890    mov         eax,dword ptr [eax+290]
 00507896    pop         edx
 00507897    call        TCustomCanvas.TextWidth
 0050789C    mov         esi,eax
 0050789E    cmp         esi,dword ptr [ebp-10]
>005078A1    jle         005078A6
 005078A3    mov         dword ptr [ebp-10],esi
 005078A6    inc         dword ptr [ebp-0C]
 005078A9    dec         dword ptr [ebp-14]
>005078AC    jne         0050786D
 005078AE    mov         eax,ebx
 005078B0    call        TInplaceEditList.GetPickList
 005078B5    mov         edx,dword ptr [ebp-10]
 005078B8    call        TControl.SetClientWidth
 005078BD    mov         eax,dword ptr [ebx+40]
 005078C0    mov         dword ptr [ebp-1C],eax
 005078C3    mov         eax,dword ptr [ebx+44]
 005078C6    mov         dword ptr [ebp-18],eax
 005078C9    lea         ecx,[ebp-8]
 005078CC    lea         edx,[ebp-1C]
 005078CF    mov         eax,dword ptr [ebx+34]
 005078D2    call        TControl.ClientToScreen
 005078D7    mov         edi,dword ptr [ebp-4]
 005078DA    mov         esi,edi
 005078DC    add         esi,dword ptr [ebx+4C]
 005078DF    mov         eax,[0078DB00];^Screen:TScreen
 005078E4    mov         eax,dword ptr [eax]
 005078E6    call        TScreen.GetHeight
 005078EB    mov         edx,dword ptr [ebx+2D0]
 005078F1    mov         edx,dword ptr [edx+4C]
 005078F4    add         edx,esi
 005078F6    cmp         eax,edx
>005078F8    jge         00507905
 005078FA    mov         eax,dword ptr [ebx+2D0]
 00507900    mov         esi,edi
 00507902    sub         esi,dword ptr [eax+4C]
 00507905    push        51
 00507907    push        0
 00507909    push        0
 0050790B    push        esi
 0050790C    mov         eax,dword ptr [ebp-8]
 0050790F    push        eax
 00507910    push        0
 00507912    mov         eax,dword ptr [ebx+2D0]
 00507918    call        TWinControl.GetHandle
 0050791D    push        eax
 0050791E    call        user32.SetWindowPos
 00507923    mov         byte ptr [ebx+2DC],1
 0050792A    mov         eax,ebx
 0050792C    call        TInplaceEdit.Invalidate
 00507931    mov         eax,ebx
 00507933    call        TWinControl.GetHandle
 00507938    push        eax
 00507939    call        user32.SetFocus
 0050793E    xor         eax,eax
 00507940    pop         edx
 00507941    pop         ecx
 00507942    pop         ecx
 00507943    mov         dword ptr fs:[eax],edx
 00507946    push        507968
 0050794B    lea         eax,[ebp-28]
 0050794E    call        @UStrClr
 00507953    lea         eax,[ebp-24]
 00507956    mov         edx,2
 0050795B    call        @UStrArrayClr
 00507960    ret
>00507961    jmp         @HandleFinally
>00507966    jmp         0050794B
 00507968    pop         edi
 00507969    pop         esi
 0050796A    pop         ebx
 0050796B    mov         esp,ebp
 0050796D    pop         ebp
 0050796E    ret
*}
end;

//00507970
procedure TInplaceEditList.KeyDown(var Key:Word; Shift:TShiftState);
begin
{*
 00507970    push        ebx
 00507971    push        esi
 00507972    push        ecx
 00507973    mov         word ptr [esp],cx
 00507977    mov         esi,edx
 00507979    mov         ebx,eax
 0050797B    cmp         byte ptr [ebx+2D4],1
>00507982    jne         005079B4
 00507984    cmp         word ptr [esi],0D
>00507988    jne         005079B4
 0050798A    movzx       eax,word ptr ds:[5079C8]
 00507991    cmp         ax,word ptr [esp]
>00507995    jne         005079B4
 00507997    mov         eax,ebx
 00507999    mov         edx,dword ptr [eax]
 0050799B    call        dword ptr [edx+130]
 005079A1    mov         eax,ebx
 005079A3    call        TWinControl.GetHandle
 005079A8    mov         edx,102
 005079AD    call        KillMessage
>005079B2    jmp         005079C1
 005079B4    mov         edx,esi
 005079B6    movzx       ecx,word ptr [esp]
 005079BA    mov         eax,ebx
 005079BC    call        TInplaceEdit.KeyDown
 005079C1    pop         edx
 005079C2    pop         esi
 005079C3    pop         ebx
 005079C4    ret
*}
end;

//005079CC
procedure TInplaceEditList.ListMouseUp(Sender:TObject; Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer);
begin
{*
 005079CC    push        ebp
 005079CD    mov         ebp,esp
 005079CF    add         esp,0FFFFFFE8
 005079D2    push        esi
 005079D3    mov         esi,eax
 005079D5    test        cl,cl
>005079D7    jne         00507A0B
 005079D9    mov         eax,dword ptr [ebp+0C]
 005079DC    mov         dword ptr [ebp-8],eax
 005079DF    mov         eax,dword ptr [ebp+8]
 005079E2    mov         dword ptr [ebp-4],eax
 005079E5    lea         edx,[ebp-18]
 005079E8    mov         eax,dword ptr [esi+2D0]
 005079EE    mov         ecx,dword ptr [eax]
 005079F0    call        dword ptr [ecx+54]
 005079F3    lea         eax,[ebp-18]
 005079F6    lea         edx,[ebp-8]
 005079F9    call        PtInRect
 005079FE    mov         edx,eax
 00507A00    mov         eax,esi
 00507A02    mov         si,0FFAE
 00507A06    call        @CallDynaInst
 00507A0B    pop         esi
 00507A0C    mov         esp,ebp
 00507A0E    pop         ebp
 00507A0F    ret         0C
*}
end;

//00507A14
procedure TInplaceEditList.MouseDown(Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer);
begin
{*
 00507A14    push        ebp
 00507A15    mov         ebp,esp
 00507A17    add         esp,0FFFFFFF4
 00507A1A    push        ebx
 00507A1B    push        esi
 00507A1C    push        edi
 00507A1D    mov         word ptr [ebp-2],cx
 00507A21    mov         ebx,edx
 00507A23    mov         edi,eax
 00507A25    test        bl,bl
>00507A27    jne         00507A95
 00507A29    cmp         byte ptr [edi+2D4],0
>00507A30    je          00507A95
 00507A32    mov         eax,dword ptr [ebp+0C]
 00507A35    mov         dword ptr [ebp-0C],eax
 00507A38    mov         eax,dword ptr [ebp+8]
 00507A3B    mov         dword ptr [ebp-8],eax
 00507A3E    lea         edx,[ebp-0C]
 00507A41    mov         eax,edi
 00507A43    call        TInplaceEditList.OverButton
 00507A48    test        al,al
>00507A4A    je          00507A95
 00507A4C    cmp         byte ptr [edi+2DC],0
>00507A53    je          00507A64
 00507A55    xor         edx,edx
 00507A57    mov         eax,edi
 00507A59    mov         si,0FFAE
 00507A5D    call        @CallDynaInst
>00507A62    jmp         00507A95
 00507A64    mov         dl,1
 00507A66    mov         eax,edi
 00507A68    call        TControl.SetMouseCapture
 00507A6D    mov         byte ptr [edi+2DD],1
 00507A74    mov         ecx,dword ptr [ebp+8]
 00507A77    mov         edx,dword ptr [ebp+0C]
 00507A7A    mov         eax,edi
 00507A7C    call        TInplaceEditList.TrackButton
 00507A81    cmp         dword ptr [edi+2D0],0
>00507A88    je          00507A95
 00507A8A    mov         eax,edi
 00507A8C    mov         si,0FFAC
 00507A90    call        @CallDynaInst
 00507A95    mov         eax,dword ptr [ebp+0C]
 00507A98    push        eax
 00507A99    mov         eax,dword ptr [ebp+8]
 00507A9C    push        eax
 00507A9D    movzx       ecx,word ptr [ebp-2]
 00507AA1    mov         edx,ebx
 00507AA3    mov         eax,edi
 00507AA5    call        TControl.MouseDown
 00507AAA    pop         edi
 00507AAB    pop         esi
 00507AAC    pop         ebx
 00507AAD    mov         esp,ebp
 00507AAF    pop         ebp
 00507AB0    ret         8
*}
end;

//00507AB4
procedure TInplaceEditList.MouseMove(Shift:TShiftState; X:Integer; Y:Integer);
begin
{*
 00507AB4    push        ebp
 00507AB5    mov         ebp,esp
 00507AB7    add         esp,0FFFFFFCC
 00507ABA    push        ebx
 00507ABB    push        esi
 00507ABC    push        edi
 00507ABD    mov         esi,ecx
 00507ABF    mov         word ptr [ebp-2],dx
 00507AC3    mov         ebx,eax
 00507AC5    mov         edi,dword ptr [ebp+8]
 00507AC8    cmp         byte ptr [ebx+2DD],0
>00507ACF    je          00507B6D
 00507AD5    mov         ecx,edi
 00507AD7    mov         edx,esi
 00507AD9    mov         eax,ebx
 00507ADB    call        TInplaceEditList.TrackButton
 00507AE0    cmp         byte ptr [ebx+2DC],0
>00507AE7    je          00507B6D
 00507AED    mov         dword ptr [ebp-14],esi
 00507AF0    mov         dword ptr [ebp-10],edi
 00507AF3    lea         ecx,[ebp-24]
 00507AF6    lea         edx,[ebp-14]
 00507AF9    mov         eax,ebx
 00507AFB    call        TControl.ClientToScreen
 00507B00    lea         edx,[ebp-24]
 00507B03    lea         ecx,[ebp-0C]
 00507B06    mov         eax,dword ptr [ebx+2D0]
 00507B0C    call        TControl.ScreenToClient
 00507B11    lea         edx,[ebp-34]
 00507B14    mov         eax,dword ptr [ebx+2D0]
 00507B1A    mov         ecx,dword ptr [eax]
 00507B1C    call        dword ptr [ecx+54]
 00507B1F    lea         eax,[ebp-34]
 00507B22    lea         edx,[ebp-0C]
 00507B25    call        PtInRect
 00507B2A    test        al,al
>00507B2C    je          00507B6D
 00507B2E    mov         eax,ebx
 00507B30    call        TInplaceEditList.StopTracking
 00507B35    mov         eax,dword ptr [ebx+2D0]
 00507B3B    call        TWinControl.GetHandle
 00507B40    mov         edx,dword ptr [ebp-0C]
 00507B43    mov         dword ptr [ebp-1C],edx
 00507B46    mov         edx,dword ptr [ebp-8]
 00507B49    mov         dword ptr [ebp-18],edx
 00507B4C    mov         edx,dword ptr [ebp-1C]
 00507B4F    and         edx,0FFFF
 00507B55    mov         ecx,dword ptr [ebp-18]
 00507B58    shl         ecx,10
 00507B5B    or          edx,ecx
 00507B5D    push        edx
 00507B5E    push        0
 00507B60    push        201
 00507B65    push        eax
 00507B66    call        user32.SendMessageW
>00507B6B    jmp         00507B7B
 00507B6D    push        edi
 00507B6E    mov         ecx,esi
 00507B70    movzx       edx,word ptr [ebp-2]
 00507B74    mov         eax,ebx
 00507B76    call        TControl.MouseMove
 00507B7B    pop         edi
 00507B7C    pop         esi
 00507B7D    pop         ebx
 00507B7E    mov         esp,ebp
 00507B80    pop         ebp
 00507B81    ret         4
*}
end;

//00507B84
procedure TInplaceEditList.MouseUp(Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer);
begin
{*
 00507B84    push        ebp
 00507B85    mov         ebp,esp
 00507B87    push        ecx
 00507B88    push        ebx
 00507B89    push        esi
 00507B8A    mov         word ptr [ebp-2],cx
 00507B8E    mov         ebx,edx
 00507B90    mov         esi,eax
 00507B92    movzx       eax,byte ptr [esi+2DE]
 00507B99    mov         byte ptr [ebp-3],al
 00507B9C    mov         eax,esi
 00507B9E    call        TInplaceEditList.StopTracking
 00507BA3    test        bl,bl
>00507BA5    jne         00507BC0
 00507BA7    cmp         byte ptr [esi+2D4],1
>00507BAE    jne         00507BC0
 00507BB0    cmp         byte ptr [ebp-3],0
>00507BB4    je          00507BC0
 00507BB6    mov         eax,esi
 00507BB8    mov         edx,dword ptr [eax]
 00507BBA    call        dword ptr [edx+130]
 00507BC0    mov         eax,dword ptr [ebp+0C]
 00507BC3    push        eax
 00507BC4    mov         eax,dword ptr [ebp+8]
 00507BC7    push        eax
 00507BC8    movzx       ecx,word ptr [ebp-2]
 00507BCC    mov         edx,ebx
 00507BCE    mov         eax,esi
 00507BD0    call        TControl.MouseUp
 00507BD5    pop         esi
 00507BD6    pop         ebx
 00507BD7    pop         ecx
 00507BD8    pop         ebp
 00507BD9    ret         8
*}
end;

//00507BDC
procedure TInplaceEditList.PaintWindow(DC:HDC);
begin
{*
 00507BDC    push        ebx
 00507BDD    push        esi
 00507BDE    push        edi
 00507BDF    push        ebp
 00507BE0    add         esp,0FFFFFFE0
 00507BE3    mov         esi,edx
 00507BE5    mov         ebx,eax
 00507BE7    cmp         byte ptr [ebx+2D4],0
>00507BEE    je          00507DF8
 00507BF4    lea         edx,[esp+4]
 00507BF8    mov         eax,ebx
 00507BFA    call        TInplaceEditList.ButtonRect
 00507BFF    xor         edi,edi
 00507C01    movzx       eax,byte ptr [ebx+2D4]
 00507C08    dec         al
>00507C0A    je          00507CD5
 00507C10    dec         al
>00507C12    jne         00507DDE
 00507C18    call        ThemeServices
 00507C1D    call        TThemeServices.GetThemesEnabled
 00507C22    test        al,al
>00507C24    je          00507CA1
 00507C26    cmp         dword ptr [ebx+2D0],0
>00507C2D    jne         00507C41
 00507C2F    call        ThemeServices
 00507C34    lea         ecx,[esp+14]
 00507C38    mov         dl,5
 00507C3A    call        TThemeServices.GetElementDetails
>00507C3F    jmp         00507C87
 00507C41    cmp         byte ptr [ebx+2DE],0
>00507C48    je          00507C5C
 00507C4A    call        ThemeServices
 00507C4F    lea         ecx,[esp+14]
 00507C53    mov         dl,4
 00507C55    call        TThemeServices.GetElementDetails
>00507C5A    jmp         00507C87
 00507C5C    cmp         byte ptr [ebx+2F0],0
>00507C63    je          00507C77
 00507C65    call        ThemeServices
 00507C6A    lea         ecx,[esp+14]
 00507C6E    mov         dl,3
 00507C70    call        TThemeServices.GetElementDetails
>00507C75    jmp         00507C87
 00507C77    call        ThemeServices
 00507C7C    lea         ecx,[esp+14]
 00507C80    mov         dl,2
 00507C82    call        TThemeServices.GetElementDetails
 00507C87    lea         eax,[esp+4]
 00507C8B    push        eax
 00507C8C    call        ThemeServices
 00507C91    lea         ecx,[esp+18]
 00507C95    mov         edx,esi
 00507C97    call        TThemeServices.DrawElement
>00507C9C    jmp         00507DDE
 00507CA1    cmp         dword ptr [ebx+2D0],0
>00507CA8    jne         00507CB1
 00507CAA    mov         edi,100
>00507CAF    jmp         00507CBF
 00507CB1    cmp         byte ptr [ebx+2DE],0
>00507CB8    je          00507CBF
 00507CBA    mov         edi,4200
 00507CBF    or          edi,5
 00507CC2    push        edi
 00507CC3    push        3
 00507CC5    lea         eax,[esp+0C]
 00507CC9    push        eax
 00507CCA    push        esi
 00507CCB    call        user32.DrawFrameControl
>00507CD0    jmp         00507DDE
 00507CD5    call        ThemeServices
 00507CDA    call        TThemeServices.GetThemesEnabled
 00507CDF    test        al,al
>00507CE1    je          00507D40
 00507CE3    cmp         byte ptr [ebx+2DE],0
>00507CEA    je          00507CFE
 00507CEC    call        ThemeServices
 00507CF1    lea         ecx,[esp+14]
 00507CF5    mov         dl,4
 00507CF7    call        TThemeServices.GetElementDetails
>00507CFC    jmp         00507D29
 00507CFE    cmp         byte ptr [ebx+2F0],0
>00507D05    je          00507D19
 00507D07    call        ThemeServices
 00507D0C    lea         ecx,[esp+14]
 00507D10    mov         dl,3
 00507D12    call        TThemeServices.GetElementDetails
>00507D17    jmp         00507D29
 00507D19    call        ThemeServices
 00507D1E    lea         ecx,[esp+14]
 00507D22    mov         dl,2
 00507D24    call        TThemeServices.GetElementDetails
 00507D29    lea         eax,[esp+4]
 00507D2D    push        eax
 00507D2E    call        ThemeServices
 00507D33    lea         ecx,[esp+18]
 00507D37    mov         edx,esi
 00507D39    call        TThemeServices.DrawElement
>00507D3E    jmp         00507D62
 00507D40    cmp         byte ptr [ebx+2DE],0
>00507D47    je          00507D4E
 00507D49    mov         edi,4000
 00507D4E    or          edi,80F
 00507D54    push        edi
 00507D55    push        5
 00507D57    lea         eax,[esp+0C]
 00507D5B    push        eax
 00507D5C    push        esi
 00507D5D    call        user32.DrawEdge
 00507D62    mov         ebp,dword ptr [esp+0C]
 00507D66    mov         eax,dword ptr [esp+4]
 00507D6A    sub         ebp,eax
 00507D6C    shr         ebp,1
 00507D6E    add         ebp,eax
 00507D70    dec         ebp
 00507D71    movzx       edx,byte ptr [ebx+2DE]
 00507D78    add         ebp,edx
 00507D7A    mov         ecx,dword ptr [esp+10]
 00507D7E    mov         eax,dword ptr [esp+8]
 00507D82    sub         ecx,eax
 00507D84    shr         ecx,1
 00507D86    add         ecx,eax
 00507D88    dec         ecx
 00507D89    add         ecx,edx
 00507D8B    mov         dword ptr [esp],ecx
 00507D8E    mov         edi,dword ptr [ebx+2C8]
 00507D94    shr         edi,3
 00507D97    test        edi,edi
>00507D99    jne         00507DA0
 00507D9B    mov         edi,1
 00507DA0    push        42
 00507DA2    push        edi
 00507DA3    push        edi
 00507DA4    mov         eax,dword ptr [esp+0C]
 00507DA8    push        eax
 00507DA9    push        ebp
 00507DAA    push        esi
 00507DAB    call        gdi32.PatBlt
 00507DB0    push        42
 00507DB2    push        edi
 00507DB3    push        edi
 00507DB4    mov         eax,dword ptr [esp+0C]
 00507DB8    push        eax
 00507DB9    mov         eax,edi
 00507DBB    add         eax,eax
 00507DBD    mov         edx,ebp
 00507DBF    sub         edx,eax
 00507DC1    push        edx
 00507DC2    push        esi
 00507DC3    call        gdi32.PatBlt
 00507DC8    push        42
 00507DCA    push        edi
 00507DCB    push        edi
 00507DCC    mov         eax,dword ptr [esp+0C]
 00507DD0    push        eax
 00507DD1    mov         eax,edi
 00507DD3    add         eax,eax
 00507DD5    add         ebp,eax
 00507DD7    push        ebp
 00507DD8    push        esi
 00507DD9    call        gdi32.PatBlt
 00507DDE    mov         eax,dword ptr [esp+10]
 00507DE2    push        eax
 00507DE3    mov         eax,dword ptr [esp+10]
 00507DE7    push        eax
 00507DE8    mov         eax,dword ptr [esp+10]
 00507DEC    push        eax
 00507DED    mov         eax,dword ptr [esp+10]
 00507DF1    push        eax
 00507DF2    push        esi
 00507DF3    call        gdi32.ExcludeClipRect
 00507DF8    mov         edx,esi
 00507DFA    mov         eax,ebx
 00507DFC    call        TWinControl.PaintWindow
 00507E01    add         esp,20
 00507E04    pop         ebp
 00507E05    pop         edi
 00507E06    pop         esi
 00507E07    pop         ebx
 00507E08    ret
*}
end;

//00507E0C
procedure TInplaceEditList.StopTracking;
begin
{*
 00507E0C    push        ebx
 00507E0D    mov         ebx,eax
 00507E0F    cmp         byte ptr [ebx+2DD],0
>00507E16    je          00507E35
 00507E18    or          ecx,0FFFFFFFF
 00507E1B    or          edx,0FFFFFFFF
 00507E1E    mov         eax,ebx
 00507E20    call        TInplaceEditList.TrackButton
 00507E25    mov         byte ptr [ebx+2DD],0
 00507E2C    xor         edx,edx
 00507E2E    mov         eax,ebx
 00507E30    call        TControl.SetMouseCapture
 00507E35    pop         ebx
 00507E36    ret
*}
end;

//00507E38
procedure TInplaceEditList.TrackButton(X:Integer; Y:Integer);
begin
{*
 00507E38    push        ebx
 00507E39    push        esi
 00507E3A    push        edi
 00507E3B    add         esp,0FFFFFFE8
 00507E3E    mov         edi,ecx
 00507E40    mov         esi,edx
 00507E42    mov         ebx,eax
 00507E44    lea         edx,[esp+8]
 00507E48    mov         eax,ebx
 00507E4A    call        TInplaceEditList.ButtonRect
 00507E4F    mov         dword ptr [esp],esi
 00507E52    mov         dword ptr [esp+4],edi
 00507E56    mov         edx,esp
 00507E58    lea         eax,[esp+8]
 00507E5C    call        PtInRect
 00507E61    cmp         al,byte ptr [ebx+2DE]
>00507E67    je          00507E83
 00507E69    mov         byte ptr [ebx+2DE],al
 00507E6F    push        0
 00507E71    lea         eax,[esp+0C]
 00507E75    push        eax
 00507E76    mov         eax,ebx
 00507E78    call        TWinControl.GetHandle
 00507E7D    push        eax
 00507E7E    call        user32.InvalidateRect
 00507E83    add         esp,18
 00507E86    pop         edi
 00507E87    pop         esi
 00507E88    pop         ebx
 00507E89    ret
*}
end;

//00507E8C
procedure TInplaceEditList.UpdateContents;
begin
{*
 00507E8C    push        ebx
 00507E8D    push        esi
 00507E8E    push        edi
 00507E8F    push        ebp
 00507E90    mov         ebp,eax
 00507E92    xor         eax,eax
 00507E94    mov         dword ptr [ebp+2D0],eax
 00507E9A    mov         byte ptr [ebp+2DF],0
 00507EA1    mov         edi,dword ptr [ebp+2C0]
 00507EA7    mov         ecx,dword ptr [edi+28C]
 00507EAD    mov         edx,dword ptr [edi+288]
 00507EB3    mov         eax,edi
 00507EB5    mov         si,0FFA6
 00507EB9    call        @CallDynaInst
 00507EBE    mov         ebx,eax
 00507EC0    mov         byte ptr [ebp+2D4],bl
 00507EC6    cmp         bl,2
>00507EC9    jne         00507ED8
 00507ECB    mov         eax,ebp
 00507ECD    call        TInplaceEditList.GetPickList
 00507ED2    mov         dword ptr [ebp+2D0],eax
 00507ED8    mov         eax,ebp
 00507EDA    call        TInplaceEdit.UpdateContents
 00507EDF    pop         ebp
 00507EE0    pop         edi
 00507EE1    pop         esi
 00507EE2    pop         ebx
 00507EE3    ret
*}
end;

//00507EE4
procedure TInplaceEditList.RestoreContents;
begin
{*
 00507EE4    push        ebx
 00507EE5    mov         ebx,eax
 00507EE7    mov         eax,ebx
 00507EE9    mov         edx,dword ptr [eax]
 00507EEB    call        dword ptr [edx+114]
 00507EF1    mov         eax,dword ptr [ebx+2C0]
 00507EF7    call        TCustomGrid.UpdateText
 00507EFC    pop         ebx
 00507EFD    ret
*}
end;

//00507F00
procedure TInplaceEditList.CMCancelMode(var Message:TCMCancelMode);
begin
{*
 00507F00    push        esi
 00507F01    mov         esi,eax
 00507F03    mov         eax,dword ptr [edx+8]
 00507F06    cmp         esi,eax
>00507F08    je          00507F1F
 00507F0A    cmp         eax,dword ptr [esi+2D0]
>00507F10    je          00507F1F
 00507F12    xor         edx,edx
 00507F14    mov         eax,esi
 00507F16    mov         si,0FFAE
 00507F1A    call        @CallDynaInst
 00507F1F    pop         esi
 00507F20    ret
*}
end;

//00507F24
procedure TInplaceEditList.WMCancelMode(var Message:TWMCancelMode);
begin
{*
 00507F24    push        ebx
 00507F25    push        esi
 00507F26    mov         esi,edx
 00507F28    mov         ebx,eax
 00507F2A    mov         eax,ebx
 00507F2C    call        TInplaceEditList.StopTracking
 00507F31    mov         edx,esi
 00507F33    mov         eax,ebx
 00507F35    call        TControl.WMCancelMode
 00507F3A    pop         esi
 00507F3B    pop         ebx
 00507F3C    ret
*}
end;

//00507F40
procedure TInplaceEditList.WMKillFocus(var Message:TWMKillFocus);
begin
{*
 00507F40    push        ebp
 00507F41    mov         ebp,esp
 00507F43    push        0
 00507F45    push        ebx
 00507F46    push        esi
 00507F47    mov         esi,edx
 00507F49    mov         ebx,eax
 00507F4B    xor         eax,eax
 00507F4D    push        ebp
 00507F4E    push        507FE1
 00507F53    push        dword ptr fs:[eax]
 00507F56    mov         dword ptr fs:[eax],esp
 00507F59    mov         eax,[0078DB7C];SysLocale:TSysLocale
 00507F5E    cmp         byte ptr [eax+0C],0
>00507F62    jne         00507F6F
 00507F64    mov         edx,esi
 00507F66    mov         eax,ebx
 00507F68    call        TWinControl.WMKillFocus
>00507F6D    jmp         00507FBE
 00507F6F    lea         edx,[ebp-4]
 00507F72    mov         eax,[0078DB00];^Screen:TScreen
 00507F77    mov         eax,dword ptr [eax]
 00507F79    call        TScreen.GetDefaultIME
 00507F7E    mov         edx,dword ptr [ebp-4]
 00507F81    lea         eax,[ebx+1D0]
 00507F87    call        @UStrAsg
 00507F8C    mov         byte ptr [ebx+1CC],3
 00507F93    mov         edx,esi
 00507F95    mov         eax,ebx
 00507F97    call        TWinControl.WMKillFocus
 00507F9C    mov         eax,dword ptr [ebx+2C0]
 00507FA2    call        TWinControl.GetHandle
 00507FA7    cmp         eax,dword ptr [esi+4]
>00507FAA    je          00507FBE
 00507FAC    push        1
 00507FAE    mov         eax,[0078DB00];^Screen:TScreen
 00507FB3    mov         eax,dword ptr [eax]
 00507FB5    mov         eax,dword ptr [eax+40]
 00507FB8    push        eax
 00507FB9    call        user32.ActivateKeyboardLayout
 00507FBE    xor         edx,edx
 00507FC0    mov         eax,ebx
 00507FC2    mov         si,0FFAE
 00507FC6    call        @CallDynaInst
 00507FCB    xor         eax,eax
 00507FCD    pop         edx
 00507FCE    pop         ecx
 00507FCF    pop         ecx
 00507FD0    mov         dword ptr fs:[eax],edx
 00507FD3    push        507FE8
 00507FD8    lea         eax,[ebp-4]
 00507FDB    call        @UStrClr
 00507FE0    ret
>00507FE1    jmp         @HandleFinally
>00507FE6    jmp         00507FD8
 00507FE8    pop         esi
 00507FE9    pop         ebx
 00507FEA    pop         ecx
 00507FEB    pop         ebp
 00507FEC    ret
*}
end;

//00507FF0
function TInplaceEditList.ButtonRect:TRect;
begin
{*
 00507FF0    push        ebx
 00507FF1    push        esi
 00507FF2    push        edi
 00507FF3    mov         edi,edx
 00507FF5    mov         ebx,eax
 00507FF7    mov         eax,dword ptr [ebx+2C0]
 00507FFD    mov         si,0FFC7
 00508001    call        @CallDynaInst
 00508006    test        al,al
>00508008    jne         00508025
 0050800A    mov         eax,dword ptr [ebx+4C]
 0050800D    push        eax
 0050800E    push        edi
 0050800F    mov         esi,dword ptr [ebx+48]
 00508012    mov         eax,esi
 00508014    sub         eax,dword ptr [ebx+2C8]
 0050801A    mov         ecx,esi
 0050801C    xor         edx,edx
 0050801E    call        Rect
>00508023    jmp         00508039
 00508025    mov         eax,dword ptr [ebx+4C]
 00508028    push        eax
 00508029    push        edi
 0050802A    mov         ecx,dword ptr [ebx+2C8]
 00508030    xor         edx,edx
 00508032    xor         eax,eax
 00508034    call        Rect
 00508039    pop         edi
 0050803A    pop         esi
 0050803B    pop         ebx
 0050803C    ret
*}
end;

//00508040
function TInplaceEditList.OverButton(const P:TPoint):Boolean;
begin
{*
 00508040    push        ebx
 00508041    push        esi
 00508042    add         esp,0FFFFFFF0
 00508045    mov         esi,edx
 00508047    mov         ebx,eax
 00508049    mov         edx,esp
 0050804B    mov         eax,ebx
 0050804D    call        TInplaceEditList.ButtonRect
 00508052    mov         eax,esp
 00508054    mov         edx,esi
 00508056    call        PtInRect
 0050805B    add         esp,10
 0050805E    pop         esi
 0050805F    pop         ebx
 00508060    ret
*}
end;

//00508064
procedure TInplaceEditList.WMLButtonDblClk(var Message:TWMLButtonDblClk);
begin
{*
 00508064    push        ebx
 00508065    push        esi
 00508066    add         esp,0FFFFFFF8
 00508069    mov         esi,edx
 0050806B    mov         ebx,eax
 0050806D    cmp         byte ptr [ebx+2D4],0
>00508074    je          00508092
 00508076    movsx       eax,word ptr [esi+8]
 0050807A    movsx       edx,word ptr [esi+0A]
 0050807E    mov         dword ptr [esp],eax
 00508081    mov         dword ptr [esp+4],edx
 00508085    mov         edx,esp
 00508087    mov         eax,ebx
 00508089    call        TInplaceEditList.OverButton
 0050808E    test        al,al
>00508090    jne         0050809B
 00508092    mov         edx,esi
 00508094    mov         eax,ebx
 00508096    call        TControl.WMLButtonDblClk
 0050809B    pop         ecx
 0050809C    pop         edx
 0050809D    pop         esi
 0050809E    pop         ebx
 0050809F    ret
*}
end;

//005080A0
procedure TInplaceEditList.WMPaint(var Message:TWMPaint);
begin
{*
 005080A0    call        TWinControl.PaintHandler
 005080A5    ret
*}
end;

//005080A8
procedure TInplaceEditList.WMSetCursor(var Message:TWMSetCursor);
begin
{*
 005080A8    push        ebx
 005080A9    push        esi
 005080AA    add         esp,0FFFFFFF0
 005080AD    mov         esi,edx
 005080AF    mov         ebx,eax
 005080B1    push        esp
 005080B2    call        user32.GetCursorPos
 005080B7    lea         ecx,[esp+8]
 005080BB    mov         edx,esp
 005080BD    mov         eax,ebx
 005080BF    call        TControl.ScreenToClient
 005080C4    mov         eax,dword ptr [esp+8]
 005080C8    mov         dword ptr [esp],eax
 005080CB    mov         eax,dword ptr [esp+0C]
 005080CF    mov         dword ptr [esp+4],eax
 005080D3    cmp         byte ptr [ebx+2D4],0
>005080DA    je          005080FD
 005080DC    mov         edx,esp
 005080DE    mov         eax,ebx
 005080E0    call        TInplaceEditList.OverButton
 005080E5    test        al,al
>005080E7    je          005080FD
 005080E9    push        7F00
 005080EE    push        0
 005080F0    call        user32.LoadCursorW
 005080F5    push        eax
 005080F6    call        user32.SetCursor
>005080FB    jmp         00508106
 005080FD    mov         edx,esi
 005080FF    mov         eax,ebx
 00508101    call        TWinControl.WMSetCursor
 00508106    add         esp,10
 00508109    pop         esi
 0050810A    pop         ebx
 0050810B    ret
*}
end;

//0050810C
procedure TInplaceEditList.WndProc(var Message:TMessage);
begin
{*
 0050810C    push        ebx
 0050810D    push        esi
 0050810E    push        edi
 0050810F    push        ecx
 00508110    mov         ebx,edx
 00508112    mov         esi,eax
 00508114    mov         eax,dword ptr [ebx]
 00508116    sub         eax,100
>0050811B    je          00508127
 0050811D    sub         eax,2
>00508120    je          00508127
 00508122    sub         eax,2
>00508125    jne         00508184
 00508127    cmp         byte ptr [esi+2D4],2
>0050812E    jne         00508184
 00508130    movzx       eax,word ptr [ebx+4]
 00508134    mov         word ptr [esp],ax
 00508138    mov         eax,dword ptr [ebx+8]
 0050813B    call        KeyDataToShiftState
 00508140    mov         ecx,eax
 00508142    mov         edx,esp
 00508144    mov         eax,esi
 00508146    mov         edi,dword ptr [eax]
 00508148    call        dword ptr [edi+12C]
 0050814E    movzx       eax,word ptr [esp]
 00508152    mov         word ptr [ebx+4],ax
 00508156    cmp         word ptr [ebx+4],0
>0050815B    je          00508184
 0050815D    cmp         byte ptr [esi+2DC],0
>00508164    je          00508184
 00508166    mov         eax,dword ptr [ebx+8]
 00508169    push        eax
 0050816A    mov         eax,dword ptr [ebx+4]
 0050816D    push        eax
 0050816E    mov         eax,dword ptr [ebx]
 00508170    push        eax
 00508171    mov         eax,dword ptr [esi+2D0]
 00508177    call        TWinControl.GetHandle
 0050817C    push        eax
 0050817D    call        user32.SendMessageW
>00508182    jmp         0050818D
 00508184    mov         edx,ebx
 00508186    mov         eax,esi
 00508188    call        TInplaceEdit.WndProc
 0050818D    pop         edx
 0050818E    pop         edi
 0050818F    pop         esi
 00508190    pop         ebx
 00508191    ret
*}
end;

//00508194
procedure TInplaceEditList.DblClick;
begin
{*
 00508194    push        ebp
 00508195    mov         ebp,esp
 00508197    push        0
 00508199    push        ebx
 0050819A    push        esi
 0050819B    mov         ebx,eax
 0050819D    xor         eax,eax
 0050819F    push        ebp
 005081A0    push        5082E2
 005081A5    push        dword ptr fs:[eax]
 005081A8    mov         dword ptr fs:[eax],esp
 005081AB    cmp         byte ptr [ebx+2D4],0
>005081B2    je          005081C4
 005081B4    mov         eax,dword ptr [ebx+2C0]
 005081BA    cmp         word ptr [eax+11A],0
>005081C2    je          005081D0
 005081C4    mov         eax,ebx
 005081C6    call        TInplaceEdit.DblClick
>005081CB    jmp         005082CC
 005081D0    cmp         byte ptr [ebx+2D4],2
>005081D7    jne         005082B9
 005081DD    mov         eax,ebx
 005081DF    call        TInplaceEditList.GetPickList
 005081E4    cmp         eax,dword ptr [ebx+2D0]
>005081EA    jne         005082B9
 005081F0    mov         eax,ebx
 005081F2    mov         si,0FFAD
 005081F6    call        @CallDynaInst
 005081FB    mov         eax,ebx
 005081FD    call        TInplaceEditList.GetPickList
 00508202    mov         eax,dword ptr [eax+280]
 00508208    mov         edx,dword ptr [eax]
 0050820A    call        dword ptr [edx+14]
 0050820D    test        eax,eax
>0050820F    jle         005082CC
 00508215    mov         eax,ebx
 00508217    call        TInplaceEditList.GetPickList
 0050821C    mov         edx,dword ptr [eax]
 0050821E    call        dword ptr [edx+0EC]
 00508224    mov         esi,eax
 00508226    inc         esi
 00508227    mov         eax,ebx
 00508229    call        TInplaceEditList.GetPickList
 0050822E    mov         eax,dword ptr [eax+280]
 00508234    mov         edx,dword ptr [eax]
 00508236    call        dword ptr [edx+14]
 00508239    cmp         esi,eax
>0050823B    jl          0050823F
 0050823D    xor         esi,esi
 0050823F    mov         eax,ebx
 00508241    call        TInplaceEditList.GetPickList
 00508246    mov         edx,esi
 00508248    mov         ecx,dword ptr [eax]
 0050824A    call        dword ptr [ecx+0F0]
 00508250    mov         eax,ebx
 00508252    call        TInplaceEditList.GetPickList
 00508257    mov         edx,dword ptr [eax]
 00508259    call        dword ptr [edx+0EC]
 0050825F    push        eax
 00508260    mov         eax,ebx
 00508262    call        TInplaceEditList.GetPickList
 00508267    mov         eax,dword ptr [eax+280]
 0050826D    lea         ecx,[ebp-4]
 00508270    pop         edx
 00508271    mov         esi,dword ptr [eax]
 00508273    call        dword ptr [esi+0C]
 00508276    mov         eax,dword ptr [ebp-4]
 00508279    push        eax
 0050827A    xor         ecx,ecx
 0050827C    mov         edx,0C
 00508281    mov         eax,ebx
 00508283    call        TControl.Perform
 00508288    mov         dl,1
 0050828A    mov         eax,ebx
 0050828C    call        TCustomEdit.SetModified
 00508291    mov         eax,dword ptr [ebx+2C0]
 00508297    mov         edx,dword ptr [ebp-4]
 0050829A    push        edx
 0050829B    mov         ecx,dword ptr [eax+28C]
 005082A1    mov         edx,dword ptr [eax+288]
 005082A7    mov         si,0FFA9
 005082AB    call        @CallDynaInst
 005082B0    mov         eax,ebx
 005082B2    call        TCustomEdit.SelectAll
>005082B7    jmp         005082CC
 005082B9    cmp         byte ptr [ebx+2D4],1
>005082C0    jne         005082CC
 005082C2    mov         eax,ebx
 005082C4    mov         edx,dword ptr [eax]
 005082C6    call        dword ptr [edx+130]
 005082CC    xor         eax,eax
 005082CE    pop         edx
 005082CF    pop         ecx
 005082D0    pop         ecx
 005082D1    mov         dword ptr fs:[eax],edx
 005082D4    push        5082E9
 005082D9    lea         eax,[ebp-4]
 005082DC    call        @UStrClr
 005082E1    ret
>005082E2    jmp         @HandleFinally
>005082E7    jmp         005082D9
 005082E9    pop         esi
 005082EA    pop         ebx
 005082EB    pop         ecx
 005082EC    pop         ebp
 005082ED    ret
*}
end;

//005082F0
procedure TInplaceEditList.CMMouseEnter(var Message:TMessage);
begin
{*
 005082F0    push        ebx
 005082F1    mov         ebx,eax
 005082F3    mov         eax,ebx
 005082F5    call        TControl.CMMouseEnter
 005082FA    call        ThemeServices
 005082FF    call        TThemeServices.GetThemesEnabled
 00508304    test        al,al
>00508306    je          0050831F
 00508308    cmp         byte ptr [ebx+2F0],0
>0050830F    jne         0050831F
 00508311    mov         byte ptr [ebx+2F0],1
 00508318    mov         eax,ebx
 0050831A    call        TInplaceEdit.Invalidate
 0050831F    pop         ebx
 00508320    ret
*}
end;

//00508324
procedure TInplaceEditList.CMMouseLeave(var Message:TMessage);
begin
{*
 00508324    push        ebx
 00508325    mov         ebx,eax
 00508327    mov         eax,ebx
 00508329    call        TControl.CMMouseLeave
 0050832E    call        ThemeServices
 00508333    call        TThemeServices.GetThemesEnabled
 00508338    test        al,al
>0050833A    je          00508353
 0050833C    cmp         byte ptr [ebx+2F0],0
>00508343    je          00508353
 00508345    mov         byte ptr [ebx+2F0],0
 0050834C    mov         eax,ebx
 0050834E    call        TInplaceEdit.Invalidate
 00508353    pop         ebx
 00508354    ret
*}
end;

//0050A0F8
constructor TValueListEditor.Create;
begin
{*
 0050A0F8    push        ebp
 0050A0F9    mov         ebp,esp
 0050A0FB    push        0
 0050A0FD    push        0
 0050A0FF    push        0
 0050A101    push        ebx
 0050A102    push        esi
 0050A103    test        dl,dl
>0050A105    je          0050A10F
 0050A107    add         esp,0FFFFFFF0
 0050A10A    call        @ClassCreate
 0050A10F    mov         byte ptr [ebp-1],dl
 0050A112    mov         esi,eax
 0050A114    xor         eax,eax
 0050A116    push        ebp
 0050A117    push        50A22F
 0050A11C    push        dword ptr fs:[eax]
 0050A11F    mov         dword ptr fs:[eax],esp
 0050A122    xor         edx,edx
 0050A124    mov         eax,esi
 0050A126    call        TCustomGrid.Create
 0050A12B    mov         eax,dword ptr [esi+50]
 0050A12E    or          eax,dword ptr ds:[50A258]
 0050A134    mov         dword ptr [esi+50],eax
 0050A137    mov         ecx,esi
 0050A139    mov         dl,1
 0050A13B    mov         eax,[005098E4];TValueListStrings
 0050A140    call        TValueListStrings.Create
 0050A145    mov         dword ptr [esi+37C],eax
 0050A14B    mov         ecx,esi
 0050A14D    mov         dl,1
 0050A14F    mov         eax,[00509F58];TValueListTitles
 0050A154    call        TValueListTitles.Create
 0050A159    mov         ebx,eax
 0050A15B    mov         dword ptr [esi+378],ebx
 0050A161    lea         edx,[ebp-8]
 0050A164    mov         eax,[0078D78C];^SResString293:TResStringRec
 0050A169    call        LoadResString
 0050A16E    mov         edx,dword ptr [ebp-8]
 0050A171    mov         eax,ebx
 0050A173    mov         ecx,dword ptr [eax]
 0050A175    call        dword ptr [ecx+38]
 0050A178    lea         edx,[ebp-0C]
 0050A17B    mov         eax,[0078CD20];^SResString294:TResStringRec
 0050A180    call        LoadResString
 0050A185    mov         edx,dword ptr [ebp-0C]
 0050A188    mov         eax,dword ptr [esi+378]
 0050A18E    mov         ecx,dword ptr [eax]
 0050A190    call        dword ptr [ecx+38]
 0050A193    mov         edx,2
 0050A198    mov         eax,esi
 0050A19A    call        TCustomGrid.SetColCount
 0050A19F    mov         edx,2
 0050A1A4    mov         eax,esi
 0050A1A6    call        TCustomGrid.SetRowCount
 0050A1AB    xor         edx,edx
 0050A1AD    mov         eax,esi
 0050A1AF    call        TCustomGrid.SetFixedCols
 0050A1B4    mov         edx,96
 0050A1B9    mov         eax,esi
 0050A1BB    call        TCustomGrid.SetDefaultColWidth
 0050A1C0    mov         edx,12
 0050A1C5    mov         eax,esi
 0050A1C7    call        TCustomGrid.SetDefaultRowHeight
 0050A1CC    mov         edx,132
 0050A1D1    mov         eax,esi
 0050A1D3    call        TControl.SetWidth
 0050A1D8    mov         edx,12C
 0050A1DD    mov         eax,esi
 0050A1DF    call        TControl.SetHeight
 0050A1E4    mov         edx,dword ptr ds:[50A25C]
 0050A1EA    mov         eax,esi
 0050A1EC    call        TValueListEditor.SetOptions
 0050A1F1    movzx       eax,byte ptr ds:[50A260]
 0050A1F8    mov         byte ptr [esi+381],al
 0050A1FE    mov         edx,1
 0050A203    mov         eax,esi
 0050A205    call        TCustomGrid.SetCol
 0050A20A    mov         dword ptr [esi+384],8
 0050A214    xor         eax,eax
 0050A216    pop         edx
 0050A217    pop         ecx
 0050A218    pop         ecx
 0050A219    mov         dword ptr fs:[eax],edx
 0050A21C    push        50A236
 0050A221    lea         eax,[ebp-0C]
 0050A224    mov         edx,2
 0050A229    call        @UStrArrayClr
 0050A22E    ret
>0050A22F    jmp         @HandleFinally
>0050A234    jmp         0050A221
 0050A236    mov         eax,esi
 0050A238    cmp         byte ptr [ebp-1],0
>0050A23C    je          0050A24D
 0050A23E    call        @AfterConstruction
 0050A243    pop         dword ptr fs:[0]
 0050A24A    add         esp,0C
 0050A24D    mov         eax,esi
 0050A24F    pop         esi
 0050A250    pop         ebx
 0050A251    mov         esp,ebp
 0050A253    pop         ebp
 0050A254    ret
*}
end;

//0050A264
destructor TValueListEditor.Destroy();
begin
{*
 0050A264    push        ebx
 0050A265    push        esi
 0050A266    call        @BeforeDestruction
 0050A26B    mov         ebx,edx
 0050A26D    mov         esi,eax
 0050A26F    mov         eax,dword ptr [esi+378]
 0050A275    call        TObject.Free
 0050A27A    mov         eax,dword ptr [esi+37C]
 0050A280    call        TObject.Free
 0050A285    mov         edx,ebx
 0050A287    and         dl,0FC
 0050A28A    mov         eax,esi
 0050A28C    call        TCustomGrid.Destroy
 0050A291    test        bl,bl
>0050A293    jle         0050A29C
 0050A295    mov         eax,esi
 0050A297    call        @ClassDestroy
 0050A29C    pop         esi
 0050A29D    pop         ebx
 0050A29E    ret
*}
end;

//0050A2A0
function TValueListEditor.CreateEditor:TInplaceEdit;
begin
{*
 0050A2A0    push        ebx
 0050A2A1    push        esi
 0050A2A2    mov         ebx,eax
 0050A2A4    mov         ecx,ebx
 0050A2A6    mov         dl,1
 0050A2A8    mov         eax,[004FF408];TInplaceEditList
 0050A2AD    call        TInplaceEditList.Create
 0050A2B2    mov         esi,eax
 0050A2B4    mov         dword ptr [ebx+398],esi
 0050A2BA    mov         eax,dword ptr [ebx+384]
 0050A2C0    mov         dword ptr [esi+2D8],eax
 0050A2C6    mov         eax,dword ptr [ebx+3A8]
 0050A2CC    mov         dword ptr [esi+2E8],eax
 0050A2D2    mov         eax,dword ptr [ebx+3AC]
 0050A2D8    mov         dword ptr [esi+2EC],eax
 0050A2DE    mov         dword ptr [esi+2E4],ebx
 0050A2E4    mov         dword ptr [esi+2E0],50B00C;TValueListEditor.EditListGetItems
 0050A2EE    mov         eax,esi
 0050A2F0    pop         esi
 0050A2F1    pop         ebx
 0050A2F2    ret
*}
end;

//0050A2F4
function FormatLine(const Key:UnicodeString; const Value:UnicodeString):UnicodeString;
begin
{*
 0050A2F4    push        ebx
 0050A2F5    push        esi
 0050A2F6    push        edi
 0050A2F7    add         esp,0FFFFFFF0
 0050A2FA    mov         edi,ecx
 0050A2FC    mov         esi,edx
 0050A2FE    mov         ebx,eax
 0050A300    push        edi
 0050A301    mov         dword ptr [esp+4],ebx
 0050A305    mov         byte ptr [esp+8],11
 0050A30A    mov         dword ptr [esp+0C],esi
 0050A30E    mov         byte ptr [esp+10],11
 0050A313    lea         edx,[esp+4]
 0050A317    mov         ecx,1
 0050A31C    mov         eax,50A33C;'%s=%s'
 0050A321    call        Format
 0050A326    add         esp,10
 0050A329    pop         edi
 0050A32A    pop         esi
 0050A32B    pop         ebx
 0050A32C    ret
*}
end;

//0050A348
function TValueListEditor.IsEmptyRow:Boolean;
begin
{*
 0050A348    push        ebp
 0050A349    mov         ebp,esp
 0050A34B    push        0
 0050A34D    push        0
 0050A34F    push        ebx
 0050A350    push        esi
 0050A351    mov         ebx,eax
 0050A353    xor         eax,eax
 0050A355    push        ebp
 0050A356    push        50A3DB
 0050A35B    push        dword ptr fs:[eax]
 0050A35E    mov         dword ptr fs:[eax],esp
 0050A361    mov         eax,ebx
 0050A363    call        TValueListEditor.GetStrings
 0050A368    mov         edx,dword ptr [eax]
 0050A36A    call        dword ptr [edx+14]
 0050A36D    mov         edx,dword ptr [ebx+28C]
 0050A373    sub         edx,dword ptr [ebx+2A0]
 0050A379    cmp         eax,edx
>0050A37B    jle         0050A3B8
 0050A37D    lea         eax,[ebp-4]
 0050A380    push        eax
 0050A381    mov         ecx,dword ptr [ebx+28C]
 0050A387    xor         edx,edx
 0050A389    mov         eax,ebx
 0050A38B    mov         esi,dword ptr [eax]
 0050A38D    call        dword ptr [esi+120]
 0050A393    cmp         dword ptr [ebp-4],0
>0050A397    jne         0050A3B8
 0050A399    lea         eax,[ebp-8]
 0050A39C    push        eax
 0050A39D    mov         ecx,dword ptr [ebx+28C]
 0050A3A3    mov         edx,1
 0050A3A8    mov         eax,ebx
 0050A3AA    mov         ebx,dword ptr [eax]
 0050A3AC    call        dword ptr [ebx+120]
 0050A3B2    cmp         dword ptr [ebp-8],0
>0050A3B6    je          0050A3BC
 0050A3B8    xor         eax,eax
>0050A3BA    jmp         0050A3BE
 0050A3BC    mov         al,1
 0050A3BE    mov         ebx,eax
 0050A3C0    xor         eax,eax
 0050A3C2    pop         edx
 0050A3C3    pop         ecx
 0050A3C4    pop         ecx
 0050A3C5    mov         dword ptr fs:[eax],edx
 0050A3C8    push        50A3E2
 0050A3CD    lea         eax,[ebp-8]
 0050A3D0    mov         edx,2
 0050A3D5    call        @UStrArrayClr
 0050A3DA    ret
>0050A3DB    jmp         @HandleFinally
>0050A3E0    jmp         0050A3CD
 0050A3E2    mov         eax,ebx
 0050A3E4    pop         esi
 0050A3E5    pop         ebx
 0050A3E6    pop         ecx
 0050A3E7    pop         ecx
 0050A3E8    pop         ebp
 0050A3E9    ret
*}
end;

//0050A3EC
function TValueListEditor.FindRow(KeyName:string; var Row:Integer):Boolean;
begin
{*
 0050A3EC    push        ebx
 0050A3ED    push        esi
 0050A3EE    push        edi
 0050A3EF    mov         esi,ecx
 0050A3F1    mov         edi,edx
 0050A3F3    mov         ebx,eax
 0050A3F5    mov         eax,ebx
 0050A3F7    call        TValueListEditor.GetStrings
 0050A3FC    mov         edx,edi
 0050A3FE    mov         ecx,dword ptr [eax]
 0050A400    call        dword ptr [ecx+58]
 0050A403    mov         dword ptr [esi],eax
 0050A405    cmp         dword ptr [esi],0FFFFFFFF
 0050A408    setne       al
 0050A40B    test        al,al
>0050A40D    je          0050A417
 0050A40F    mov         edx,dword ptr [ebx+2A0]
 0050A415    add         dword ptr [esi],edx
 0050A417    pop         edi
 0050A418    pop         esi
 0050A419    pop         ebx
 0050A41A    ret
*}
end;

//0050A424
function TValueListEditor.GetRowCount:Integer;
begin
{*
 0050A424    mov         eax,dword ptr [eax+2C0]
 0050A42A    ret
*}
end;

//0050A42C
function TValueListEditor.GetCell(ACol:Integer; ARow:Integer):UnicodeString;
begin
{*
 0050A42C    push        ebp
 0050A42D    mov         ebp,esp
 0050A42F    push        ecx
 0050A430    push        ebx
 0050A431    push        esi
 0050A432    mov         esi,ecx
 0050A434    mov         dword ptr [ebp-4],edx
 0050A437    mov         ebx,eax
 0050A439    test        esi,esi
>0050A43B    jne         0050A473
 0050A43D    test        byte ptr [ebx+381],1
>0050A444    je          0050A473
 0050A446    mov         eax,dword ptr [ebx+378]
 0050A44C    mov         edx,dword ptr [eax]
 0050A44E    call        dword ptr [edx+14]
 0050A451    cmp         eax,dword ptr [ebp-4]
>0050A454    jle         0050A469
 0050A456    mov         ecx,dword ptr [ebp+8]
 0050A459    mov         edx,dword ptr [ebp-4]
 0050A45C    mov         eax,dword ptr [ebx+378]
 0050A462    mov         ebx,dword ptr [eax]
 0050A464    call        dword ptr [ebx+0C]
>0050A467    jmp         0050A4E0
 0050A469    mov         eax,dword ptr [ebp+8]
 0050A46C    call        @UStrClr
>0050A471    jmp         0050A4E0
 0050A473    mov         eax,ebx
 0050A475    call        TValueListEditor.GetStrings
 0050A47A    mov         edx,dword ptr [eax]
 0050A47C    call        dword ptr [edx+14]
 0050A47F    test        eax,eax
>0050A481    jne         0050A48D
 0050A483    mov         eax,dword ptr [ebp+8]
 0050A486    call        @UStrClr
>0050A48B    jmp         0050A4E0
 0050A48D    sub         esi,dword ptr [ebx+2A0]
 0050A493    cmp         dword ptr [ebp-4],0
>0050A497    jne         0050A4AC
 0050A499    mov         eax,ebx
 0050A49B    call        TValueListEditor.GetStrings
 0050A4A0    mov         ecx,dword ptr [ebp+8]
 0050A4A3    mov         edx,esi
 0050A4A5    call        TStrings.GetName
>0050A4AA    jmp         0050A4E0
 0050A4AC    mov         eax,ebx
 0050A4AE    call        TValueListEditor.GetStrings
 0050A4B3    mov         ecx,dword ptr [ebp+8]
 0050A4B6    mov         edx,esi
 0050A4B8    mov         ebx,dword ptr [eax]
 0050A4BA    call        dword ptr [ebx+0C]
 0050A4BD    mov         edx,dword ptr [ebp+8]
 0050A4C0    mov         edx,dword ptr [edx]
 0050A4C2    mov         eax,50A4F4;'='
 0050A4C7    call        Pos
 0050A4CC    test        eax,eax
>0050A4CE    jle         0050A4E0
 0050A4D0    mov         edx,dword ptr [ebp+8]
 0050A4D3    mov         ecx,eax
 0050A4D5    mov         eax,1
 0050A4DA    xchg        eax,edx
 0050A4DB    call        @UStrDelete
 0050A4E0    pop         esi
 0050A4E1    pop         ebx
 0050A4E2    pop         ecx
 0050A4E3    pop         ebp
 0050A4E4    ret         4
*}
end;

//0050A4F8
procedure TValueListEditor.SetCell(ACol:Integer; ARow:Integer; const Value:UnicodeString);
begin
{*
 0050A4F8    push        ebp
 0050A4F9    mov         ebp,esp
 0050A4FB    push        0
 0050A4FD    push        0
 0050A4FF    push        0
 0050A501    push        0
 0050A503    push        0
 0050A505    push        ebx
 0050A506    push        esi
 0050A507    push        edi
 0050A508    mov         dword ptr [ebp-0C],ecx
 0050A50B    mov         dword ptr [ebp-8],edx
 0050A50E    mov         esi,eax
 0050A510    xor         eax,eax
 0050A512    push        ebp
 0050A513    push        50A5C9
 0050A518    push        dword ptr fs:[eax]
 0050A51B    mov         dword ptr fs:[eax],esp
 0050A51E    mov         ebx,dword ptr [ebp-0C]
 0050A521    sub         ebx,dword ptr [esi+2A0]
 0050A527    cmp         dword ptr [ebp-8],0
>0050A52B    jne         0050A553
 0050A52D    lea         eax,[ebp-10]
 0050A530    push        eax
 0050A531    mov         ecx,dword ptr [ebp-0C]
 0050A534    mov         edx,1
 0050A539    mov         eax,esi
 0050A53B    mov         edi,dword ptr [eax]
 0050A53D    call        dword ptr [edi+120]
 0050A543    mov         edx,dword ptr [ebp-10]
 0050A546    lea         ecx,[ebp-4]
 0050A549    mov         eax,dword ptr [ebp+8]
 0050A54C    call        FormatLine
>0050A551    jmp         0050A574
 0050A553    lea         eax,[ebp-14]
 0050A556    push        eax
 0050A557    mov         ecx,dword ptr [ebp-0C]
 0050A55A    xor         edx,edx
 0050A55C    mov         eax,esi
 0050A55E    mov         edi,dword ptr [eax]
 0050A560    call        dword ptr [edi+120]
 0050A566    mov         eax,dword ptr [ebp-14]
 0050A569    lea         ecx,[ebp-4]
 0050A56C    mov         edx,dword ptr [ebp+8]
 0050A56F    call        FormatLine
 0050A574    mov         eax,esi
 0050A576    call        TValueListEditor.GetStrings
 0050A57B    mov         edx,dword ptr [eax]
 0050A57D    call        dword ptr [edx+14]
 0050A580    cmp         ebx,eax
>0050A582    jl          0050A595
 0050A584    mov         eax,esi
 0050A586    call        TValueListEditor.GetStrings
 0050A58B    mov         edx,dword ptr [ebp-4]
 0050A58E    mov         ecx,dword ptr [eax]
 0050A590    call        dword ptr [ecx+38]
>0050A593    jmp         0050A5A6
 0050A595    mov         eax,esi
 0050A597    call        TValueListEditor.GetStrings
 0050A59C    mov         ecx,dword ptr [ebp-4]
 0050A59F    mov         edx,ebx
 0050A5A1    mov         ebx,dword ptr [eax]
 0050A5A3    call        dword ptr [ebx+20]
 0050A5A6    xor         eax,eax
 0050A5A8    pop         edx
 0050A5A9    pop         ecx
 0050A5AA    pop         ecx
 0050A5AB    mov         dword ptr fs:[eax],edx
 0050A5AE    push        50A5D0
 0050A5B3    lea         eax,[ebp-14]
 0050A5B6    mov         edx,2
 0050A5BB    call        @UStrArrayClr
 0050A5C0    lea         eax,[ebp-4]
 0050A5C3    call        @UStrClr
 0050A5C8    ret
>0050A5C9    jmp         @HandleFinally
>0050A5CE    jmp         0050A5B3
 0050A5D0    pop         edi
 0050A5D1    pop         esi
 0050A5D2    pop         ebx
 0050A5D3    mov         esp,ebp
 0050A5D5    pop         ebp
 0050A5D6    ret         4
*}
end;

//0050A5DC
procedure TValueListEditor.SetDropDownRows(const Value:Integer);
begin
{*
 0050A5DC    mov         dword ptr [eax+384],edx
 0050A5E2    mov         ecx,dword ptr [eax+398]
 0050A5E8    test        ecx,ecx
>0050A5EA    je          0050A5F2
 0050A5EC    mov         dword ptr [ecx+2D8],edx
 0050A5F2    ret
*}
end;

//0050A5F4
function TValueListEditor.GetKey(Index:Integer):UnicodeString;
begin
{*
 0050A5F4    push        ebx
 0050A5F5    push        esi
 0050A5F6    push        edi
 0050A5F7    mov         edi,ecx
 0050A5F9    mov         esi,edx
 0050A5FB    mov         ebx,eax
 0050A5FD    push        edi
 0050A5FE    mov         ecx,esi
 0050A600    xor         edx,edx
 0050A602    mov         eax,ebx
 0050A604    mov         ebx,dword ptr [eax]
 0050A606    call        dword ptr [ebx+120]
 0050A60C    pop         edi
 0050A60D    pop         esi
 0050A60E    pop         ebx
 0050A60F    ret
*}
end;

//0050A610
procedure TValueListEditor.SetTitleCaptions(const Value:TStrings);
begin
{*
 0050A610    push        esi
 0050A611    push        edi
 0050A612    mov         edi,edx
 0050A614    mov         esi,eax
 0050A616    mov         edx,edi
 0050A618    mov         eax,dword ptr [esi+378]
 0050A61E    mov         ecx,dword ptr [eax]
 0050A620    call        dword ptr [ecx+8]
 0050A623    pop         edi
 0050A624    pop         esi
 0050A625    ret
*}
end;

//0050A628
function TValueListEditor.TitleCaptionsStored(Value:TStrings):Boolean;
begin
{*
 0050A628    push        ebp
 0050A629    mov         ebp,esp
 0050A62B    xor         ecx,ecx
 0050A62D    push        ecx
 0050A62E    push        ecx
 0050A62F    push        ecx
 0050A630    push        ecx
 0050A631    push        ebx
 0050A632    mov         ebx,eax
 0050A634    xor         eax,eax
 0050A636    push        ebp
 0050A637    push        50A6B4
 0050A63C    push        dword ptr fs:[eax]
 0050A63F    mov         dword ptr fs:[eax],esp
 0050A642    lea         edx,[ebp-4]
 0050A645    mov         eax,dword ptr [ebx+378]
 0050A64B    mov         ecx,dword ptr [eax]
 0050A64D    call        dword ptr [ecx+1C]
 0050A650    mov         eax,dword ptr [ebp-4]
 0050A653    push        eax
 0050A654    lea         edx,[ebp-0C]
 0050A657    mov         eax,[0078D78C];^SResString293:TResStringRec
 0050A65C    call        LoadResString
 0050A661    push        dword ptr [ebp-0C]
 0050A664    push        50A6D0;'
'
 0050A669    lea         edx,[ebp-10]
 0050A66C    mov         eax,[0078CD20];^SResString294:TResStringRec
 0050A671    call        LoadResString
 0050A676    push        dword ptr [ebp-10]
 0050A679    push        50A6D0;'
'
 0050A67E    lea         eax,[ebp-8]
 0050A681    mov         edx,4
 0050A686    call        @UStrCatN
 0050A68B    mov         edx,dword ptr [ebp-8]
 0050A68E    pop         eax
 0050A68F    call        @UStrEqual
 0050A694    setne       al
 0050A697    mov         ebx,eax
 0050A699    xor         eax,eax
 0050A69B    pop         edx
 0050A69C    pop         ecx
 0050A69D    pop         ecx
 0050A69E    mov         dword ptr fs:[eax],edx
 0050A6A1    push        50A6BB
 0050A6A6    lea         eax,[ebp-10]
 0050A6A9    mov         edx,4
 0050A6AE    call        @UStrArrayClr
 0050A6B3    ret
>0050A6B4    jmp         @HandleFinally
>0050A6B9    jmp         0050A6A6
 0050A6BB    mov         eax,ebx
 0050A6BD    pop         ebx
 0050A6BE    mov         esp,ebp
 0050A6C0    pop         ebp
 0050A6C1    ret
*}
end;

//0050A6D8
function TValueListEditor.GetStrings:TStrings;
begin
{*
 0050A6D8    mov         eax,dword ptr [eax+37C]
 0050A6DE    ret
*}
end;

//0050A6E0
procedure TValueListEditor.SetStrings(const Value:TStrings);
begin
{*
 0050A6E0    mov         eax,dword ptr [eax+37C]
 0050A6E6    mov         ecx,dword ptr [eax]
 0050A6E8    call        dword ptr [ecx+8]
 0050A6EB    ret
*}
end;

//0050A6EC
procedure SetColumnTitles(Visible:Boolean);
begin
{*
 0050A6EC    push        ebp
 0050A6ED    mov         ebp,esp
 0050A6EF    test        al,al
>0050A6F1    je          0050A725
 0050A6F3    mov         eax,dword ptr [ebp+8]
 0050A6F6    mov         eax,dword ptr [eax-4]
 0050A6F9    call        TValueListEditor.GetRowCount
 0050A6FE    cmp         eax,2
>0050A701    jge         0050A713
 0050A703    mov         eax,dword ptr [ebp+8]
 0050A706    mov         eax,dword ptr [eax-4]
 0050A709    mov         edx,2
 0050A70E    call        TCustomGrid.SetRowCount
 0050A713    mov         eax,dword ptr [ebp+8]
 0050A716    mov         eax,dword ptr [eax-4]
 0050A719    mov         edx,1
 0050A71E    call        TCustomGrid.SetFixedRows
 0050A723    pop         ebp
 0050A724    ret
 0050A725    mov         eax,dword ptr [ebp+8]
 0050A728    mov         eax,dword ptr [eax-4]
 0050A72B    xor         edx,edx
 0050A72D    call        TCustomGrid.SetFixedRows
 0050A732    pop         ebp
 0050A733    ret
*}
end;

//0050A734
procedure TValueListEditor.SetDisplayOptions(const Value:TDisplayOptions);
begin
{*
 0050A734    push        ebp
 0050A735    mov         ebp,esp
 0050A737    add         esp,0FFFFFFF8
 0050A73A    mov         byte ptr [ebp-5],dl
 0050A73D    mov         dword ptr [ebp-4],eax
 0050A740    test        byte ptr [ebp-5],1
 0050A744    setne       al
 0050A747    mov         edx,dword ptr [ebp-4]
 0050A74A    test        byte ptr [edx+381],1
 0050A751    setne       dl
 0050A754    cmp         al,dl
>0050A756    je          0050A766
 0050A758    push        ebp
 0050A759    test        byte ptr [ebp-5],1
 0050A75D    setne       dl
 0050A760    call        SetColumnTitles
 0050A765    pop         ecx
 0050A766    mov         eax,dword ptr [ebp-4]
 0050A769    movzx       edx,byte ptr [ebp-5]
 0050A76D    mov         byte ptr [eax+381],dl
 0050A773    mov         eax,dword ptr [ebp-4]
 0050A776    mov         edx,dword ptr [eax]
 0050A778    call        dword ptr [edx+114]
 0050A77E    mov         eax,dword ptr [ebp-4]
 0050A781    call        TValueListEditor.Refresh
 0050A786    pop         ecx
 0050A787    pop         ecx
 0050A788    pop         ebp
 0050A789    ret
*}
end;

//0050A78C
procedure TValueListEditor.SetKeyOptions(Value:TKeyOptions);
begin
{*
 0050A78C    push        ebx
 0050A78D    push        ecx
 0050A78E    mov         byte ptr [esp],dl
 0050A791    mov         ebx,eax
 0050A793    test        byte ptr [esp],1
>0050A797    jne         0050A7B1
 0050A799    test        byte ptr [ebx+380],1
>0050A7A0    je          0050A7B1
 0050A7A2    movzx       eax,byte ptr ds:[50A7F8]
 0050A7A9    not         eax
 0050A7AB    and         al,byte ptr [esp]
 0050A7AE    mov         byte ptr [esp],al
 0050A7B1    test        byte ptr [esp],2
>0050A7B5    je          0050A7CD
 0050A7B7    test        byte ptr [ebx+380],2
>0050A7BE    jne         0050A7CD
 0050A7C0    movzx       eax,byte ptr ds:[50A7FC]
 0050A7C7    or          al,byte ptr [esp]
 0050A7CA    mov         byte ptr [esp],al
 0050A7CD    test        byte ptr [esp],1
>0050A7D1    jne         0050A7E8
 0050A7D3    cmp         dword ptr [ebx+288],0
>0050A7DA    jne         0050A7E8
 0050A7DC    mov         edx,1
 0050A7E1    mov         eax,ebx
 0050A7E3    call        TCustomGrid.SetCol
 0050A7E8    movzx       eax,byte ptr [esp]
 0050A7EC    mov         byte ptr [ebx+380],al
 0050A7F2    pop         edx
 0050A7F3    pop         ebx
 0050A7F4    ret
*}
end;

//0050A800
function TValueListEditor.GetOnStringsChange:TNotifyEvent;
begin
{*
 0050A800    mov         eax,dword ptr [eax+37C]
 0050A806    mov         ecx,dword ptr [eax+40]
 0050A809    mov         dword ptr [edx],ecx
 0050A80B    mov         ecx,dword ptr [eax+44]
 0050A80E    mov         dword ptr [edx+4],ecx
 0050A811    ret
*}
end;

//0050A814
function TValueListEditor.GetOnStringsChanging:TNotifyEvent;
begin
{*
 0050A814    mov         eax,dword ptr [eax+37C]
 0050A81A    mov         ecx,dword ptr [eax+48]
 0050A81D    mov         dword ptr [edx],ecx
 0050A81F    mov         ecx,dword ptr [eax+4C]
 0050A822    mov         dword ptr [edx+4],ecx
 0050A825    ret
*}
end;

//0050A828
procedure TValueListEditor.SetOnStringsChange(Value:TNotifyEvent);
begin
{*
 0050A828    push        ebp
 0050A829    mov         ebp,esp
 0050A82B    mov         eax,dword ptr [eax+37C]
 0050A831    mov         edx,dword ptr [ebp+8]
 0050A834    mov         dword ptr [eax+40],edx
 0050A837    mov         edx,dword ptr [ebp+0C]
 0050A83A    mov         dword ptr [eax+44],edx
 0050A83D    pop         ebp
 0050A83E    ret         8
*}
end;

//0050A844
procedure TValueListEditor.SetOnStringsChanging(Value:TNotifyEvent);
begin
{*
 0050A844    push        ebp
 0050A845    mov         ebp,esp
 0050A847    mov         eax,dword ptr [eax+37C]
 0050A84D    mov         edx,dword ptr [ebp+8]
 0050A850    mov         dword ptr [eax+48],edx
 0050A853    mov         edx,dword ptr [ebp+0C]
 0050A856    mov         dword ptr [eax+4C],edx
 0050A859    pop         ebp
 0050A85A    ret         8
*}
end;

//0050A860
procedure TValueListEditor.SetOnEditButtonClick(Value:TNotifyEvent);
begin
{*
 0050A860    push        ebp
 0050A861    mov         ebp,esp
 0050A863    mov         edx,dword ptr [ebp+8]
 0050A866    mov         dword ptr [eax+3A8],edx
 0050A86C    mov         edx,dword ptr [ebp+0C]
 0050A86F    mov         dword ptr [eax+3AC],edx
 0050A875    mov         edx,dword ptr [eax+398]
 0050A87B    test        edx,edx
>0050A87D    je          0050A897
 0050A87F    mov         ecx,dword ptr [eax+3A8]
 0050A885    mov         dword ptr [edx+2E8],ecx
 0050A88B    mov         ecx,dword ptr [eax+3AC]
 0050A891    mov         dword ptr [edx+2EC],ecx
 0050A897    pop         ebp
 0050A898    ret         8
*}
end;

//0050A89C
procedure TValueListEditor.DrawCell(ACol:LongInt; ARow:LongInt; ARect:TRect; AState:TGridDrawState);
begin
{*
 0050A89C    push        ebp
 0050A89D    mov         ebp,esp
 0050A89F    add         esp,0FFFFFFD8
 0050A8A2    push        ebx
 0050A8A3    push        esi
 0050A8A4    push        edi
 0050A8A5    xor         ebx,ebx
 0050A8A7    mov         dword ptr [ebp-28],ebx
 0050A8AA    mov         dword ptr [ebp-24],ebx
 0050A8AD    mov         dword ptr [ebp-20],ebx
 0050A8B0    mov         dword ptr [ebp-1C],ebx
 0050A8B3    mov         dword ptr [ebp-4],ebx
 0050A8B6    mov         esi,dword ptr [ebp+0C]
 0050A8B9    lea         edi,[ebp-18]
 0050A8BC    movs        dword ptr [edi],dword ptr [esi]
 0050A8BD    movs        dword ptr [edi],dword ptr [esi]
 0050A8BE    movs        dword ptr [edi],dword ptr [esi]
 0050A8BF    movs        dword ptr [edi],dword ptr [esi]
 0050A8C0    mov         esi,ecx
 0050A8C2    mov         dword ptr [ebp-8],edx
 0050A8C5    mov         ebx,eax
 0050A8C7    xor         eax,eax
 0050A8C9    push        ebp
 0050A8CA    push        50A99A
 0050A8CF    push        dword ptr fs:[eax]
 0050A8D2    mov         dword ptr fs:[eax],esp
 0050A8D5    cmp         byte ptr [ebx+2FC],0
>0050A8DC    je          0050A967
 0050A8E2    cmp         dword ptr [ebp-8],0
>0050A8E6    jne         0050A919
 0050A8E8    mov         eax,dword ptr [ebx+2A0]
 0050A8EE    dec         eax
 0050A8EF    cmp         esi,eax
>0050A8F1    jle         0050A919
 0050A8F3    lea         eax,[ebp-28]
 0050A8F6    mov         edx,esi
 0050A8F8    sub         edx,dword ptr [ebx+2A0]
 0050A8FE    mov         cl,0FC
 0050A900    call        @VarFromInt
 0050A905    lea         edx,[ebp-28]
 0050A908    xor         ecx,ecx
 0050A90A    mov         eax,dword ptr [ebx+37C]
 0050A910    call        TValueListStrings.FindItemProp
 0050A915    mov         edi,eax
>0050A917    jmp         0050A91B
 0050A919    xor         edi,edi
 0050A91B    test        edi,edi
>0050A91D    je          0050A932
 0050A91F    cmp         dword ptr [edi+1C],0
>0050A923    je          0050A932
 0050A925    lea         eax,[ebp-4]
 0050A928    mov         edx,dword ptr [edi+1C]
 0050A92B    call        @UStrLAsg
>0050A930    jmp         0050A945
 0050A932    lea         eax,[ebp-4]
 0050A935    push        eax
 0050A936    mov         ecx,esi
 0050A938    mov         edx,dword ptr [ebp-8]
 0050A93B    mov         eax,ebx
 0050A93D    mov         edi,dword ptr [eax]
 0050A93F    call        dword ptr [edi+120]
 0050A945    mov         eax,dword ptr [ebp-14]
 0050A948    add         eax,2
 0050A94B    push        eax
 0050A94C    mov         eax,dword ptr [ebp-4]
 0050A94F    push        eax
 0050A950    mov         ecx,dword ptr [ebp-18]
 0050A953    add         ecx,2
 0050A956    lea         edx,[ebp-18]
 0050A959    mov         eax,dword ptr [ebx+270]
 0050A95F    mov         edi,dword ptr [eax]
 0050A961    call        dword ptr [edi+98]
 0050A967    lea         eax,[ebp-18]
 0050A96A    push        eax
 0050A96B    movzx       eax,byte ptr [ebp+8]
 0050A96F    push        eax
 0050A970    mov         ecx,esi
 0050A972    mov         edx,dword ptr [ebp-8]
 0050A975    mov         eax,ebx
 0050A977    call        TCustomDrawGrid.DrawCell
 0050A97C    xor         eax,eax
 0050A97E    pop         edx
 0050A97F    pop         ecx
 0050A980    pop         ecx
 0050A981    mov         dword ptr fs:[eax],edx
 0050A984    push        50A9A1
 0050A989    lea         eax,[ebp-28]
 0050A98C    call        @VarClr
 0050A991    lea         eax,[ebp-4]
 0050A994    call        @UStrClr
 0050A999    ret
>0050A99A    jmp         @HandleFinally
>0050A99F    jmp         0050A989
 0050A9A1    pop         edi
 0050A9A2    pop         esi
 0050A9A3    pop         ebx
 0050A9A4    mov         esp,ebp
 0050A9A6    pop         ebp
 0050A9A7    ret         8
*}
end;

//0050A9AC
procedure TValueListEditor.AdjustColWidths;
begin
{*
 0050A9AC    push        ebp
 0050A9AD    mov         ebp,esp
 0050A9AF    push        ecx
 0050A9B0    push        ebx
 0050A9B1    mov         dword ptr [ebp-4],eax
 0050A9B4    mov         eax,dword ptr [ebp-4]
 0050A9B7    cmp         byte ptr [eax+38D],0
>0050A9BE    jne         0050AAE1
 0050A9C4    mov         eax,dword ptr [ebp-4]
 0050A9C7    call        TWinControl.HandleAllocated
 0050A9CC    test        al,al
>0050A9CE    je          0050AAE1
 0050A9D4    mov         eax,dword ptr [ebp-4]
 0050A9D7    cmp         byte ptr [eax+1EA],0
>0050A9DE    je          0050AAE1
 0050A9E4    mov         eax,dword ptr [ebp-4]
 0050A9E7    test        byte ptr [eax+381],2
>0050A9EE    je          0050AAE1
 0050A9F4    mov         eax,dword ptr [ebp-4]
 0050A9F7    mov         byte ptr [eax+38D],1
 0050A9FE    xor         eax,eax
 0050AA00    push        ebp
 0050AA01    push        50AADA
 0050AA06    push        dword ptr fs:[eax]
 0050AA09    mov         dword ptr fs:[eax],esp
 0050AA0C    xor         edx,edx
 0050AA0E    mov         eax,dword ptr [ebp-4]
 0050AA11    call        TCustomGrid.GetColWidths
 0050AA16    mov         ebx,eax
 0050AA18    mov         edx,1
 0050AA1D    mov         eax,dword ptr [ebp-4]
 0050AA20    call        TCustomGrid.GetColWidths
 0050AA25    add         ebx,eax
 0050AA27    mov         eax,dword ptr [ebp-4]
 0050AA2A    call        TControl.GetClientWidth
 0050AA2F    sub         eax,2
 0050AA32    cmp         ebx,eax
>0050AA34    je          0050AAC2
 0050AA3A    mov         eax,dword ptr [ebp-4]
 0050AA3D    test        byte ptr [eax+381],4
>0050AA44    je          0050AA70
 0050AA46    xor         edx,edx
 0050AA48    mov         eax,dword ptr [ebp-4]
 0050AA4B    call        TCustomGrid.GetColWidths
 0050AA50    push        eax
 0050AA51    mov         eax,dword ptr [ebp-4]
 0050AA54    call        TControl.GetClientWidth
 0050AA59    mov         ecx,eax
 0050AA5B    pop         eax
 0050AA5C    sub         ecx,eax
 0050AA5E    sub         ecx,2
 0050AA61    mov         edx,1
 0050AA66    mov         eax,dword ptr [ebp-4]
 0050AA69    call        TCustomGrid.SetColWidths
>0050AA6E    jmp         0050AAC2
 0050AA70    mov         eax,dword ptr [ebp-4]
 0050AA73    call        TControl.GetClientWidth
 0050AA78    mov         ecx,eax
 0050AA7A    sub         ecx,2
 0050AA7D    sar         ecx,1
>0050AA7F    jns         0050AA84
 0050AA81    adc         ecx,0
 0050AA84    xor         edx,edx
 0050AA86    mov         eax,dword ptr [ebp-4]
 0050AA89    call        TCustomGrid.SetColWidths
 0050AA8E    xor         edx,edx
 0050AA90    mov         eax,dword ptr [ebp-4]
 0050AA93    call        TCustomGrid.GetColWidths
 0050AA98    mov         ebx,eax
 0050AA9A    mov         eax,dword ptr [ebp-4]
 0050AA9D    call        TControl.GetClientWidth
 0050AAA2    sub         eax,2
 0050AAA5    and         eax,80000001
>0050AAAA    jns         0050AAB1
 0050AAAC    dec         eax
 0050AAAD    or          eax,0FFFFFFFE
 0050AAB0    inc         eax
 0050AAB1    add         ebx,eax
 0050AAB3    mov         ecx,ebx
 0050AAB5    mov         edx,1
 0050AABA    mov         eax,dword ptr [ebp-4]
 0050AABD    call        TCustomGrid.SetColWidths
 0050AAC2    xor         eax,eax
 0050AAC4    pop         edx
 0050AAC5    pop         ecx
 0050AAC6    pop         ecx
 0050AAC7    mov         dword ptr fs:[eax],edx
 0050AACA    push        50AAE1
 0050AACF    mov         eax,dword ptr [ebp-4]
 0050AAD2    mov         byte ptr [eax+38D],0
 0050AAD9    ret
>0050AADA    jmp         @HandleFinally
>0050AADF    jmp         0050AACF
 0050AAE1    pop         ebx
 0050AAE2    pop         ecx
 0050AAE3    pop         ebp
 0050AAE4    ret
*}
end;

//0050AAE8
procedure TValueListEditor.AdjustRowCount;
begin
{*
 0050AAE8    push        ebx
 0050AAE9    push        esi
 0050AAEA    mov         ebx,eax
 0050AAEC    mov         eax,ebx
 0050AAEE    call        TValueListEditor.GetStrings
 0050AAF3    mov         edx,dword ptr [eax]
 0050AAF5    call        dword ptr [edx+14]
 0050AAF8    test        eax,eax
>0050AAFA    jle         0050AB12
 0050AAFC    mov         eax,ebx
 0050AAFE    call        TValueListEditor.GetStrings
 0050AB03    mov         edx,dword ptr [eax]
 0050AB05    call        dword ptr [edx+14]
 0050AB08    mov         esi,eax
 0050AB0A    add         esi,dword ptr [ebx+2A0]
>0050AB10    jmp         0050AB19
 0050AB12    mov         esi,dword ptr [ebx+2A0]
 0050AB18    inc         esi
 0050AB19    mov         eax,ebx
 0050AB1B    call        TValueListEditor.GetRowCount
 0050AB20    cmp         esi,eax
>0050AB22    je          0050AB5D
 0050AB24    cmp         esi,dword ptr [ebx+28C]
>0050AB2A    jge         0050AB36
 0050AB2C    mov         edx,esi
 0050AB2E    dec         edx
 0050AB2F    mov         eax,ebx
 0050AB31    call        TCustomGrid.SetRow
 0050AB36    test        byte ptr [ebx+381],1
>0050AB3D    je          0050AB54
 0050AB3F    cmp         dword ptr [ebx+28C],0
>0050AB46    jne         0050AB54
 0050AB48    mov         edx,1
 0050AB4D    mov         eax,ebx
 0050AB4F    call        TCustomGrid.SetRow
 0050AB54    mov         edx,esi
 0050AB56    mov         eax,ebx
 0050AB58    call        TCustomGrid.SetRowCount
 0050AB5D    pop         esi
 0050AB5E    pop         ebx
 0050AB5F    ret
*}
end;

//0050AB60
procedure TValueListEditor.Resize;
begin
{*
 0050AB60    push        ebx
 0050AB61    mov         ebx,eax
 0050AB63    mov         eax,ebx
 0050AB65    call        TControl.Resize
 0050AB6A    mov         eax,ebx
 0050AB6C    mov         edx,dword ptr [eax]
 0050AB6E    call        dword ptr [edx+114]
 0050AB74    pop         ebx
 0050AB75    ret
*}
end;

//0050AB78
procedure TValueListEditor.ColWidthsChanged;
begin
{*
 0050AB78    push        ebx
 0050AB79    mov         ebx,eax
 0050AB7B    mov         eax,ebx
 0050AB7D    mov         edx,dword ptr [eax]
 0050AB7F    call        dword ptr [edx+114]
 0050AB85    mov         eax,ebx
 0050AB87    call        TCustomGrid.ColWidthsChanged
 0050AB8C    pop         ebx
 0050AB8D    ret
*}
end;

//0050AB90
procedure TValueListEditor.Refresh;
begin
{*
 0050AB90    push        ebx
 0050AB91    mov         ebx,eax
 0050AB93    cmp         dword ptr [ebx+390],0
>0050AB9A    jne         0050ABB7
 0050AB9C    mov         eax,ebx
 0050AB9E    mov         edx,dword ptr [eax]
 0050ABA0    call        dword ptr [edx+118]
 0050ABA6    mov         eax,ebx
 0050ABA8    mov         edx,dword ptr [eax]
 0050ABAA    call        dword ptr [edx+90]
 0050ABB0    mov         eax,ebx
 0050ABB2    call        TCustomGrid.InvalidateEditor
 0050ABB7    pop         ebx
 0050ABB8    ret
*}
end;

//0050ABBC
procedure TValueListEditor.sub_0050ABBC;
begin
{*
 0050ABBC    call        TCustomGrid.HideEdit
 0050ABC1    ret
*}
end;

//0050ABC4
procedure TValueListEditor.CanEditModify;
begin
{*
 0050ABC4    push        ebp
 0050ABC5    mov         ebp,esp
 0050ABC7    xor         ecx,ecx
 0050ABC9    push        ecx
 0050ABCA    push        ecx
 0050ABCB    push        ecx
 0050ABCC    push        ecx
 0050ABCD    push        ebx
 0050ABCE    push        esi
 0050ABCF    mov         esi,eax
 0050ABD1    xor         eax,eax
 0050ABD3    push        ebp
 0050ABD4    push        50AC33
 0050ABD9    push        dword ptr fs:[eax]
 0050ABDC    mov         dword ptr fs:[eax],esp
 0050ABDF    mov         eax,esi
 0050ABE1    call        TCustomGrid.CanEditModify
 0050ABE6    mov         ebx,eax
 0050ABE8    test        bl,bl
>0050ABEA    je          0050AC1D
 0050ABEC    lea         eax,[ebp-10]
 0050ABEF    mov         edx,dword ptr [esi+28C]
 0050ABF5    sub         edx,dword ptr [esi+2A0]
 0050ABFB    mov         cl,0FC
 0050ABFD    call        @VarFromInt
 0050AC02    lea         edx,[ebp-10]
 0050AC05    xor         ecx,ecx
 0050AC07    mov         eax,dword ptr [esi+37C]
 0050AC0D    call        TValueListStrings.FindItemProp
 0050AC12    test        eax,eax
>0050AC14    je          0050AC1D
 0050AC16    movzx       ebx,byte ptr [eax+18]
 0050AC1A    xor         bl,1
 0050AC1D    xor         eax,eax
 0050AC1F    pop         edx
 0050AC20    pop         ecx
 0050AC21    pop         ecx
 0050AC22    mov         dword ptr fs:[eax],edx
 0050AC25    push        50AC3A
 0050AC2A    lea         eax,[ebp-10]
 0050AC2D    call        @VarClr
 0050AC32    ret
>0050AC33    jmp         @HandleFinally
>0050AC38    jmp         0050AC2A
 0050AC3A    mov         eax,ebx
 0050AC3C    pop         esi
 0050AC3D    pop         ebx
 0050AC3E    mov         esp,ebp
 0050AC40    pop         ebp
 0050AC41    ret
*}
end;

//0050AC44
procedure TValueListEditor.DisableEditUpdate;
begin
{*
 0050AC44    push        ebx
 0050AC45    mov         ebx,eax
 0050AC47    cmp         dword ptr [ebx+390],0
>0050AC4E    jne         0050AC62
 0050AC50    mov         eax,ebx
 0050AC52    call        TValueListEditor.GetStrings
 0050AC57    mov         edx,dword ptr [eax]
 0050AC59    call        dword ptr [edx+14]
 0050AC5C    mov         dword ptr [ebx+394],eax
 0050AC62    inc         dword ptr [ebx+390]
 0050AC68    pop         ebx
 0050AC69    ret
*}
end;

//0050AC6C
procedure TValueListEditor.EnableEditUpdate;
begin
{*
 0050AC6C    push        ebx
 0050AC6D    mov         ebx,eax
 0050AC6F    dec         dword ptr [ebx+390]
 0050AC75    cmp         dword ptr [ebx+390],0
>0050AC7C    jne         0050AC99
 0050AC7E    mov         eax,ebx
 0050AC80    call        TValueListEditor.GetStrings
 0050AC85    mov         edx,dword ptr [eax]
 0050AC87    call        dword ptr [edx+14]
 0050AC8A    cmp         eax,dword ptr [ebx+394]
>0050AC90    je          0050AC99
 0050AC92    mov         eax,ebx
 0050AC94    call        TValueListEditor.Refresh
 0050AC99    pop         ebx
 0050AC9A    ret
*}
end;

//0050AC9C
procedure TValueListEditor.GetEditLimit;
begin
{*
 0050AC9C    push        ebp
 0050AC9D    mov         ebp,esp
 0050AC9F    xor         ecx,ecx
 0050ACA1    push        ecx
 0050ACA2    push        ecx
 0050ACA3    push        ecx
 0050ACA4    push        ecx
 0050ACA5    push        ebx
 0050ACA6    mov         ebx,eax
 0050ACA8    xor         eax,eax
 0050ACAA    push        ebp
 0050ACAB    push        50AD04
 0050ACB0    push        dword ptr fs:[eax]
 0050ACB3    mov         dword ptr fs:[eax],esp
 0050ACB6    lea         eax,[ebp-10]
 0050ACB9    mov         edx,dword ptr [ebx+28C]
 0050ACBF    sub         edx,dword ptr [ebx+2A0]
 0050ACC5    mov         cl,0FC
 0050ACC7    call        @VarFromInt
 0050ACCC    lea         edx,[ebp-10]
 0050ACCF    xor         ecx,ecx
 0050ACD1    mov         eax,dword ptr [ebx+37C]
 0050ACD7    call        TValueListStrings.FindItemProp
 0050ACDC    test        eax,eax
>0050ACDE    je          0050ACE5
 0050ACE0    mov         ebx,dword ptr [eax+14]
>0050ACE3    jmp         0050ACEE
 0050ACE5    mov         eax,ebx
 0050ACE7    call        TCustomGrid.GetEditLimit
 0050ACEC    mov         ebx,eax
 0050ACEE    xor         eax,eax
 0050ACF0    pop         edx
 0050ACF1    pop         ecx
 0050ACF2    pop         ecx
 0050ACF3    mov         dword ptr fs:[eax],edx
 0050ACF6    push        50AD0B
 0050ACFB    lea         eax,[ebp-10]
 0050ACFE    call        @VarClr
 0050AD03    ret
>0050AD04    jmp         @HandleFinally
>0050AD09    jmp         0050ACFB
 0050AD0B    mov         eax,ebx
 0050AD0D    pop         ebx
 0050AD0E    mov         esp,ebp
 0050AD10    pop         ebp
 0050AD11    ret
*}
end;

//0050AD14
procedure TValueListEditor.GetEditMask(ACol:LongInt; ARow:LongInt);
begin
{*
 0050AD14    push        ebp
 0050AD15    mov         ebp,esp
 0050AD17    push        0
 0050AD19    push        0
 0050AD1B    push        0
 0050AD1D    push        0
 0050AD1F    push        0
 0050AD21    push        0
 0050AD23    push        ebx
 0050AD24    push        esi
 0050AD25    push        edi
 0050AD26    mov         dword ptr [ebp-8],ecx
 0050AD29    mov         dword ptr [ebp-4],edx
 0050AD2C    mov         ebx,eax
 0050AD2E    mov         edi,dword ptr [ebp+8]
 0050AD31    xor         eax,eax
 0050AD33    push        ebp
 0050AD34    push        50ADB1
 0050AD39    push        dword ptr fs:[eax]
 0050AD3C    mov         dword ptr fs:[eax],esp
 0050AD3F    lea         eax,[ebp-18]
 0050AD42    mov         edx,dword ptr [ebp-8]
 0050AD45    sub         edx,dword ptr [ebx+2A0]
 0050AD4B    mov         cl,0FC
 0050AD4D    call        @VarFromInt
 0050AD52    lea         edx,[ebp-18]
 0050AD55    xor         ecx,ecx
 0050AD57    mov         eax,dword ptr [ebx+37C]
 0050AD5D    call        TValueListStrings.FindItemProp
 0050AD62    mov         esi,eax
 0050AD64    test        esi,esi
>0050AD66    je          0050AD74
 0050AD68    mov         eax,edi
 0050AD6A    mov         edx,dword ptr [esi+8]
 0050AD6D    call        @UStrAsg
>0050AD72    jmp         0050AD7B
 0050AD74    mov         eax,edi
 0050AD76    call        @UStrClr
 0050AD7B    cmp         word ptr [ebx+34A],0
>0050AD83    je          0050AD9B
 0050AD85    mov         eax,dword ptr [ebp-8]
 0050AD88    push        eax
 0050AD89    push        edi
 0050AD8A    mov         ecx,dword ptr [ebp-4]
 0050AD8D    mov         edx,ebx
 0050AD8F    mov         eax,dword ptr [ebx+34C]
 0050AD95    call        dword ptr [ebx+348]
 0050AD9B    xor         eax,eax
 0050AD9D    pop         edx
 0050AD9E    pop         ecx
 0050AD9F    pop         ecx
 0050ADA0    mov         dword ptr fs:[eax],edx
 0050ADA3    push        50ADB8
 0050ADA8    lea         eax,[ebp-18]
 0050ADAB    call        @VarClr
 0050ADB0    ret
>0050ADB1    jmp         @HandleFinally
>0050ADB6    jmp         0050ADA8
 0050ADB8    pop         edi
 0050ADB9    pop         esi
 0050ADBA    pop         ebx
 0050ADBB    mov         esp,ebp
 0050ADBD    pop         ebp
 0050ADBE    ret         4
*}
end;

//0050ADC4
procedure TValueListEditor.GetEditStyle(ACol:LongInt; ARow:LongInt);
begin
{*
 0050ADC4    push        ebp
 0050ADC5    mov         ebp,esp
 0050ADC7    push        0
 0050ADC9    push        0
 0050ADCB    push        0
 0050ADCD    push        0
 0050ADCF    push        0
 0050ADD1    push        ebx
 0050ADD2    push        esi
 0050ADD3    push        edi
 0050ADD4    mov         edi,ecx
 0050ADD6    mov         dword ptr [ebp-4],edx
 0050ADD9    mov         esi,eax
 0050ADDB    xor         eax,eax
 0050ADDD    push        ebp
 0050ADDE    push        50AE59
 0050ADE3    push        dword ptr fs:[eax]
 0050ADE6    mov         dword ptr fs:[eax],esp
 0050ADE9    xor         ebx,ebx
 0050ADEB    cmp         dword ptr [ebp-4],0
>0050ADEF    je          0050AE43
 0050ADF1    lea         eax,[ebp-14]
 0050ADF4    mov         edx,edi
 0050ADF6    sub         edx,dword ptr [esi+2A0]
 0050ADFC    mov         cl,0FC
 0050ADFE    call        @VarFromInt
 0050AE03    lea         edx,[ebp-14]
 0050AE06    xor         ecx,ecx
 0050AE08    mov         eax,dword ptr [esi+37C]
 0050AE0E    call        TValueListStrings.FindItemProp
 0050AE13    test        eax,eax
>0050AE15    je          0050AE23
 0050AE17    cmp         byte ptr [eax+0C],0
>0050AE1B    je          0050AE23
 0050AE1D    movzx       ebx,byte ptr [eax+0C]
>0050AE21    jmp         0050AE43
 0050AE23    mov         eax,dword ptr [esi+398]
 0050AE29    call        TInplaceEditList.GetPickList
 0050AE2E    mov         edx,dword ptr [eax+280]
 0050AE34    mov         cl,1
 0050AE36    mov         eax,esi
 0050AE38    call        TValueListEditor.GetPickList
 0050AE3D    test        al,al
>0050AE3F    je          0050AE43
 0050AE41    mov         bl,2
 0050AE43    xor         eax,eax
 0050AE45    pop         edx
 0050AE46    pop         ecx
 0050AE47    pop         ecx
 0050AE48    mov         dword ptr fs:[eax],edx
 0050AE4B    push        50AE60
 0050AE50    lea         eax,[ebp-14]
 0050AE53    call        @VarClr
 0050AE58    ret
>0050AE59    jmp         @HandleFinally
>0050AE5E    jmp         0050AE50
 0050AE60    mov         eax,ebx
 0050AE62    pop         edi
 0050AE63    pop         esi
 0050AE64    pop         ebx
 0050AE65    mov         esp,ebp
 0050AE67    pop         ebp
 0050AE68    ret
*}
end;

//0050AE6C
procedure TValueListEditor.GetEditText(ACol:Integer; ARow:Integer);
begin
{*
 0050AE6C    push        ebp
 0050AE6D    mov         ebp,esp
 0050AE6F    push        ecx
 0050AE70    push        ebx
 0050AE71    push        esi
 0050AE72    push        edi
 0050AE73    mov         dword ptr [ebp-4],ecx
 0050AE76    mov         esi,edx
 0050AE78    mov         ebx,eax
 0050AE7A    mov         eax,dword ptr [ebp+8]
 0050AE7D    push        eax
 0050AE7E    mov         ecx,dword ptr [ebp-4]
 0050AE81    mov         edx,esi
 0050AE83    mov         eax,ebx
 0050AE85    mov         edi,dword ptr [eax]
 0050AE87    call        dword ptr [edi+120]
 0050AE8D    cmp         word ptr [ebx+352],0
>0050AE95    je          0050AEAF
 0050AE97    mov         eax,dword ptr [ebp-4]
 0050AE9A    push        eax
 0050AE9B    mov         eax,dword ptr [ebp+8]
 0050AE9E    push        eax
 0050AE9F    mov         ecx,esi
 0050AEA1    mov         edx,ebx
 0050AEA3    mov         eax,dword ptr [ebx+354]
 0050AEA9    call        dword ptr [ebx+350]
 0050AEAF    pop         edi
 0050AEB0    pop         esi
 0050AEB1    pop         ebx
 0050AEB2    pop         ecx
 0050AEB3    pop         ebp
 0050AEB4    ret         4
*}
end;

//0050AEB8
procedure TValueListEditor.SetEditText(ACol:Integer; ARow:Integer; const Value:UnicodeString);
begin
{*
 0050AEB8    push        ebp
 0050AEB9    mov         ebp,esp
 0050AEBB    add         esp,0FFFFFFF4
 0050AEBE    push        ebx
 0050AEBF    push        esi
 0050AEC0    push        edi
 0050AEC1    xor         ebx,ebx
 0050AEC3    mov         dword ptr [ebp-0C],ebx
 0050AEC6    mov         edi,ecx
 0050AEC8    mov         dword ptr [ebp-8],edx
 0050AECB    mov         dword ptr [ebp-4],eax
 0050AECE    mov         esi,dword ptr [ebp+8]
 0050AED1    xor         eax,eax
 0050AED3    push        ebp
 0050AED4    push        50AFF9
 0050AED9    push        dword ptr fs:[eax]
 0050AEDC    mov         dword ptr fs:[eax],esp
 0050AEDF    push        esi
 0050AEE0    mov         ecx,edi
 0050AEE2    mov         edx,dword ptr [ebp-8]
 0050AEE5    mov         eax,dword ptr [ebp-4]
 0050AEE8    call        TCustomDrawGrid.SetEditText
 0050AEED    mov         eax,dword ptr [ebp-4]
 0050AEF0    call        TValueListEditor.DisableEditUpdate
 0050AEF5    xor         eax,eax
 0050AEF7    push        ebp
 0050AEF8    push        50AFDC
 0050AEFD    push        dword ptr fs:[eax]
 0050AF00    mov         dword ptr fs:[eax],esp
 0050AF03    mov         eax,dword ptr [ebp-4]
 0050AF06    call        TValueListEditor.GetStrings
 0050AF0B    mov         edx,dword ptr [eax]
 0050AF0D    call        dword ptr [edx+14]
 0050AF10    mov         edx,dword ptr [ebp-4]
 0050AF13    mov         ecx,edi
 0050AF15    sub         ecx,dword ptr [edx+2A0]
 0050AF1B    cmp         eax,ecx
>0050AF1D    jg          0050AF49
 0050AF1F    test        esi,esi
>0050AF21    je          0050AF49
 0050AF23    mov         eax,dword ptr [ebp-4]
 0050AF26    call        TValueListEditor.GetStrings
 0050AF2B    xor         edx,edx
 0050AF2D    call        TStrings.Append
 0050AF32    mov         eax,dword ptr [ebp-4]
 0050AF35    mov         eax,dword ptr [eax+37C]
 0050AF3B    mov         edx,dword ptr [eax]
 0050AF3D    call        dword ptr [edx+14]
 0050AF40    mov         edx,dword ptr [ebp-4]
 0050AF43    mov         dword ptr [edx+394],eax
 0050AF49    lea         eax,[ebp-0C]
 0050AF4C    push        eax
 0050AF4D    mov         ecx,edi
 0050AF4F    mov         edx,dword ptr [ebp-8]
 0050AF52    mov         eax,dword ptr [ebp-4]
 0050AF55    mov         ebx,dword ptr [eax]
 0050AF57    call        dword ptr [ebx+120]
 0050AF5D    mov         edx,dword ptr [ebp-0C]
 0050AF60    mov         eax,esi
 0050AF62    call        @UStrEqual
>0050AF67    je          0050AFC6
 0050AF69    cmp         dword ptr [ebp-8],0
>0050AF6D    jne         0050AFA8
 0050AF6F    mov         eax,dword ptr [ebp-4]
 0050AF72    mov         eax,dword ptr [eax+37C]
 0050AF78    xor         ecx,ecx
 0050AF7A    mov         edx,esi
 0050AF7C    call        TValueListStrings.KeyIsValid
 0050AF81    test        al,al
>0050AF83    jne         0050AFA8
 0050AF85    mov         eax,dword ptr [ebp-4]
 0050AF88    mov         eax,dword ptr [eax+388]
 0050AF8E    mov         edx,esi
 0050AF90    call        @UStrEqual
>0050AF95    je          0050AFA8
 0050AF97    mov         eax,dword ptr [ebp-4]
 0050AF9A    add         eax,388
 0050AF9F    mov         edx,esi
 0050AFA1    call        @UStrAsg
>0050AFA6    jmp         0050AFC6
 0050AFA8    mov         eax,dword ptr [ebp-4]
 0050AFAB    add         eax,388
 0050AFB0    call        @UStrClr
 0050AFB5    push        esi
 0050AFB6    mov         ecx,edi
 0050AFB8    mov         edx,dword ptr [ebp-8]
 0050AFBB    mov         eax,dword ptr [ebp-4]
 0050AFBE    mov         ebx,dword ptr [eax]
 0050AFC0    call        dword ptr [ebx+124]
 0050AFC6    xor         eax,eax
 0050AFC8    pop         edx
 0050AFC9    pop         ecx
 0050AFCA    pop         ecx
 0050AFCB    mov         dword ptr fs:[eax],edx
 0050AFCE    push        50AFE3
 0050AFD3    mov         eax,dword ptr [ebp-4]
 0050AFD6    call        TValueListEditor.EnableEditUpdate
 0050AFDB    ret
>0050AFDC    jmp         @HandleFinally
>0050AFE1    jmp         0050AFD3
 0050AFE3    xor         eax,eax
 0050AFE5    pop         edx
 0050AFE6    pop         ecx
 0050AFE7    pop         ecx
 0050AFE8    mov         dword ptr fs:[eax],edx
 0050AFEB    push        50B000
 0050AFF0    lea         eax,[ebp-0C]
 0050AFF3    call        @UStrClr
 0050AFF8    ret
>0050AFF9    jmp         @HandleFinally
>0050AFFE    jmp         0050AFF0
 0050B000    pop         edi
 0050B001    pop         esi
 0050B002    pop         ebx
 0050B003    mov         esp,ebp
 0050B005    pop         ebp
 0050B006    ret         4
*}
end;

//0050B00C
procedure TValueListEditor.EditListGetItems(ACol:Integer; ARow:Integer; Items:TStrings);
begin
{*
 0050B00C    push        ebp
 0050B00D    mov         ebp,esp
 0050B00F    push        0
 0050B011    push        0
 0050B013    push        0
 0050B015    push        0
 0050B017    push        ebx
 0050B018    push        esi
 0050B019    push        edi
 0050B01A    mov         ebx,ecx
 0050B01C    mov         esi,eax
 0050B01E    xor         eax,eax
 0050B020    push        ebp
 0050B021    push        50B0A0
 0050B026    push        dword ptr fs:[eax]
 0050B029    mov         dword ptr fs:[eax],esp
 0050B02C    test        edx,edx
>0050B02E    je          0050B08A
 0050B030    lea         eax,[ebp-10]
 0050B033    mov         edx,ebx
 0050B035    sub         edx,dword ptr [esi+2A0]
 0050B03B    mov         cl,0FC
 0050B03D    call        @VarFromInt
 0050B042    lea         edx,[ebp-10]
 0050B045    xor         ecx,ecx
 0050B047    mov         eax,dword ptr [esi+37C]
 0050B04D    call        TValueListStrings.FindItemProp
 0050B052    mov         edi,eax
 0050B054    test        edi,edi
>0050B056    je          0050B076
 0050B058    mov         eax,edi
 0050B05A    call        TItemProp.HasPickList
 0050B05F    test        al,al
>0050B061    je          0050B076
 0050B063    mov         eax,edi
 0050B065    call        TItemProp.GetPickList
 0050B06A    mov         edx,eax
 0050B06C    mov         eax,dword ptr [ebp+8]
 0050B06F    mov         ecx,dword ptr [eax]
 0050B071    call        dword ptr [ecx+8]
>0050B074    jmp         0050B07E
 0050B076    mov         eax,dword ptr [ebp+8]
 0050B079    mov         edx,dword ptr [eax]
 0050B07B    call        dword ptr [edx+44]
 0050B07E    xor         ecx,ecx
 0050B080    mov         edx,dword ptr [ebp+8]
 0050B083    mov         eax,esi
 0050B085    call        TValueListEditor.GetPickList
 0050B08A    xor         eax,eax
 0050B08C    pop         edx
 0050B08D    pop         ecx
 0050B08E    pop         ecx
 0050B08F    mov         dword ptr fs:[eax],edx
 0050B092    push        50B0A7
 0050B097    lea         eax,[ebp-10]
 0050B09A    call        @VarClr
 0050B09F    ret
>0050B0A0    jmp         @HandleFinally
>0050B0A5    jmp         0050B097
 0050B0A7    pop         edi
 0050B0A8    pop         esi
 0050B0A9    pop         ebx
 0050B0AA    mov         esp,ebp
 0050B0AC    pop         ebp
 0050B0AD    ret         4
*}
end;

//0050B0B0
function TValueListEditor.GetPickList(Values:TStrings; ClearFirst:Boolean):Boolean;
begin
{*
 0050B0B0    push        ebp
 0050B0B1    mov         ebp,esp
 0050B0B3    add         esp,0FFFFFFF0
 0050B0B6    push        ebx
 0050B0B7    push        esi
 0050B0B8    xor         ebx,ebx
 0050B0BA    mov         dword ptr [ebp-10],ebx
 0050B0BD    mov         dword ptr [ebp-0C],ebx
 0050B0C0    mov         ebx,ecx
 0050B0C2    mov         dword ptr [ebp-4],edx
 0050B0C5    mov         esi,eax
 0050B0C7    xor         eax,eax
 0050B0C9    push        ebp
 0050B0CA    push        50B19E
 0050B0CF    push        dword ptr fs:[eax]
 0050B0D2    mov         dword ptr fs:[eax],esp
 0050B0D5    cmp         word ptr [esi+3A2],0
>0050B0DD    je          0050B17F
 0050B0E3    lea         ecx,[ebp-0C]
 0050B0E6    mov         edx,dword ptr [esi+28C]
 0050B0EC    mov         eax,esi
 0050B0EE    call        TValueListEditor.GetKey
 0050B0F3    cmp         dword ptr [ebp-0C],0
>0050B0F7    je          0050B17F
 0050B0FD    mov         eax,dword ptr [ebp-4]
 0050B100    call        TStrings.BeginUpdate
 0050B105    xor         eax,eax
 0050B107    push        ebp
 0050B108    push        50B178
 0050B10D    push        dword ptr fs:[eax]
 0050B110    mov         dword ptr fs:[eax],esp
 0050B113    test        bl,bl
>0050B115    je          0050B11F
 0050B117    mov         eax,dword ptr [ebp-4]
 0050B11A    mov         edx,dword ptr [eax]
 0050B11C    call        dword ptr [edx+44]
 0050B11F    mov         eax,dword ptr [ebp-4]
 0050B122    push        eax
 0050B123    lea         ecx,[ebp-10]
 0050B126    mov         edx,dword ptr [esi+28C]
 0050B12C    mov         eax,esi
 0050B12E    call        TValueListEditor.GetKey
 0050B133    mov         ecx,dword ptr [ebp-10]
 0050B136    mov         edx,esi
 0050B138    mov         eax,dword ptr [esi+3A4]
 0050B13E    call        dword ptr [esi+3A0]
 0050B144    mov         eax,dword ptr [ebp-4]
 0050B147    mov         edx,dword ptr [eax]
 0050B149    call        dword ptr [edx+14]
 0050B14C    test        eax,eax
 0050B14E    setg        byte ptr [ebp-5]
 0050B152    mov         eax,dword ptr [esi+398]
 0050B158    movzx       edx,byte ptr [ebp-5]
 0050B15C    mov         byte ptr [eax+2DF],dl
 0050B162    xor         eax,eax
 0050B164    pop         edx
 0050B165    pop         ecx
 0050B166    pop         ecx
 0050B167    mov         dword ptr fs:[eax],edx
 0050B16A    push        50B183
 0050B16F    mov         eax,dword ptr [ebp-4]
 0050B172    call        TStrings.EndUpdate
 0050B177    ret
>0050B178    jmp         @HandleFinally
>0050B17D    jmp         0050B16F
 0050B17F    mov         byte ptr [ebp-5],0
 0050B183    xor         eax,eax
 0050B185    pop         edx
 0050B186    pop         ecx
 0050B187    pop         ecx
 0050B188    mov         dword ptr fs:[eax],edx
 0050B18B    push        50B1A5
 0050B190    lea         eax,[ebp-10]
 0050B193    mov         edx,2
 0050B198    call        @UStrArrayClr
 0050B19D    ret
>0050B19E    jmp         @HandleFinally
>0050B1A3    jmp         0050B190
 0050B1A5    movzx       eax,byte ptr [ebp-5]
 0050B1A9    pop         esi
 0050B1AA    pop         ebx
 0050B1AB    mov         esp,ebp
 0050B1AD    pop         ebp
 0050B1AE    ret
*}
end;

//0050B1B0
function TValueListEditor.InsertRow(KeyName:string; Value:string; Append:Boolean):Integer;
begin
{*
 0050B1B0    push        ebp
 0050B1B1    mov         ebp,esp
 0050B1B3    add         esp,0FFFFFFF0
 0050B1B6    push        ebx
 0050B1B7    push        esi
 0050B1B8    push        edi
 0050B1B9    xor         ebx,ebx
 0050B1BB    mov         dword ptr [ebp-10],ebx
 0050B1BE    mov         dword ptr [ebp-0C],ebx
 0050B1C1    mov         edi,ecx
 0050B1C3    mov         esi,edx
 0050B1C5    mov         dword ptr [ebp-4],eax
 0050B1C8    xor         eax,eax
 0050B1CA    push        ebp
 0050B1CB    push        50B2E0
 0050B1D0    push        dword ptr fs:[eax]
 0050B1D3    mov         dword ptr fs:[eax],esp
 0050B1D6    mov         eax,dword ptr [ebp-4]
 0050B1D9    mov         eax,dword ptr [eax+28C]
 0050B1DF    mov         dword ptr [ebp-8],eax
 0050B1E2    mov         eax,dword ptr [ebp-4]
 0050B1E5    call        TValueListEditor.GetStrings
 0050B1EA    mov         edx,dword ptr [eax]
 0050B1EC    call        dword ptr [edx+14]
 0050B1EF    cmp         eax,dword ptr [ebp-8]
>0050B1F2    jl          0050B204
 0050B1F4    mov         eax,dword ptr [ebp-4]
 0050B1F7    call        TValueListEditor.IsEmptyRow
 0050B1FC    test        al,al
>0050B1FE    jne         0050B2A0
 0050B204    mov         eax,dword ptr [ebp-4]
 0050B207    call        TValueListEditor.GetStrings
 0050B20C    call        TStrings.BeginUpdate
 0050B211    xor         eax,eax
 0050B213    push        ebp
 0050B214    push        50B299
 0050B219    push        dword ptr fs:[eax]
 0050B21C    mov         dword ptr fs:[eax],esp
 0050B21F    cmp         byte ptr [ebp+8],0
>0050B223    je          0050B251
 0050B225    lea         ecx,[ebp-0C]
 0050B228    mov         edx,edi
 0050B22A    mov         eax,esi
 0050B22C    call        FormatLine
 0050B231    mov         eax,dword ptr [ebp-0C]
 0050B234    push        eax
 0050B235    mov         eax,dword ptr [ebp-4]
 0050B238    call        TValueListEditor.GetStrings
 0050B23D    pop         edx
 0050B23E    mov         ecx,dword ptr [eax]
 0050B240    call        dword ptr [ecx+38]
 0050B243    mov         edx,dword ptr [ebp-4]
 0050B246    add         eax,dword ptr [edx+2A0]
 0050B24C    mov         dword ptr [ebp-8],eax
>0050B24F    jmp         0050B27E
 0050B251    lea         ecx,[ebp-10]
 0050B254    mov         edx,edi
 0050B256    mov         eax,esi
 0050B258    call        FormatLine
 0050B25D    mov         eax,dword ptr [ebp-10]
 0050B260    push        eax
 0050B261    mov         eax,dword ptr [ebp-4]
 0050B264    call        TValueListEditor.GetStrings
 0050B269    mov         edx,dword ptr [ebp-4]
 0050B26C    push        dword ptr [edx+2A0]
 0050B272    mov         edx,dword ptr [ebp-8]
 0050B275    pop         ecx
 0050B276    sub         edx,ecx
 0050B278    pop         ecx
 0050B279    mov         ebx,dword ptr [eax]
 0050B27B    call        dword ptr [ebx+60]
 0050B27E    xor         eax,eax
 0050B280    pop         edx
 0050B281    pop         ecx
 0050B282    pop         ecx
 0050B283    mov         dword ptr fs:[eax],edx
 0050B286    push        50B2C5
 0050B28B    mov         eax,dword ptr [ebp-4]
 0050B28E    call        TValueListEditor.GetStrings
 0050B293    call        TStrings.EndUpdate
 0050B298    ret
>0050B299    jmp         @HandleFinally
>0050B29E    jmp         0050B28B
 0050B2A0    push        esi
 0050B2A1    mov         ecx,dword ptr [ebp-8]
 0050B2A4    xor         edx,edx
 0050B2A6    mov         eax,dword ptr [ebp-4]
 0050B2A9    mov         ebx,dword ptr [eax]
 0050B2AB    call        dword ptr [ebx+124]
 0050B2B1    push        edi
 0050B2B2    mov         ecx,dword ptr [ebp-8]
 0050B2B5    mov         edx,1
 0050B2BA    mov         eax,dword ptr [ebp-4]
 0050B2BD    mov         ebx,dword ptr [eax]
 0050B2BF    call        dword ptr [ebx+124]
 0050B2C5    xor         eax,eax
 0050B2C7    pop         edx
 0050B2C8    pop         ecx
 0050B2C9    pop         ecx
 0050B2CA    mov         dword ptr fs:[eax],edx
 0050B2CD    push        50B2E7
 0050B2D2    lea         eax,[ebp-10]
 0050B2D5    mov         edx,2
 0050B2DA    call        @UStrArrayClr
 0050B2DF    ret
>0050B2E0    jmp         @HandleFinally
>0050B2E5    jmp         0050B2D2
 0050B2E7    mov         eax,dword ptr [ebp-8]
 0050B2EA    pop         edi
 0050B2EB    pop         esi
 0050B2EC    pop         ebx
 0050B2ED    mov         esp,ebp
 0050B2EF    pop         ebp
 0050B2F0    ret         4
*}
end;

//0050B2F4
procedure TValueListEditor.DeleteRow(ARow:Integer);
begin
{*
 0050B2F4    push        ebp
 0050B2F5    mov         ebp,esp
 0050B2F7    push        ecx
 0050B2F8    push        esi
 0050B2F9    mov         esi,edx
 0050B2FB    mov         dword ptr [ebp-4],eax
 0050B2FE    mov         eax,dword ptr [ebp-4]
 0050B301    cmp         byte ptr [eax+38C],0
>0050B308    jne         0050B3A2
 0050B30E    mov         eax,dword ptr [ebp-4]
 0050B311    mov         byte ptr [eax+38C],1
 0050B318    xor         eax,eax
 0050B31A    push        ebp
 0050B31B    push        50B39B
 0050B320    push        dword ptr fs:[eax]
 0050B323    mov         dword ptr fs:[eax],esp
 0050B326    mov         eax,dword ptr [ebp-4]
 0050B329    call        TValueListEditor.GetStrings
 0050B32E    mov         edx,dword ptr [eax]
 0050B330    call        dword ptr [edx+14]
 0050B333    test        eax,eax
>0050B335    je          0050B351
 0050B337    cmp         esi,1
>0050B33A    jl          0050B351
 0050B33C    mov         eax,dword ptr [ebp-4]
 0050B33F    call        TValueListEditor.GetRowCount
 0050B344    mov         edx,dword ptr [ebp-4]
 0050B347    sub         eax,dword ptr [edx+2A0]
 0050B34D    cmp         esi,eax
>0050B34F    jle         0050B368
 0050B351    mov         ecx,dword ptr ds:[78D63C];^SResString239:TResStringRec
 0050B357    mov         dl,1
 0050B359    mov         eax,[004FDA2C];EInvalidGridOperation
 0050B35E    call        Exception.CreateRes
 0050B363    call        @RaiseExcept
 0050B368    mov         eax,dword ptr [ebp-4]
 0050B36B    call        TValueListEditor.GetStrings
 0050B370    mov         edx,dword ptr [ebp-4]
 0050B373    push        dword ptr [edx+2A0]
 0050B379    mov         edx,esi
 0050B37B    pop         ecx
 0050B37C    sub         edx,ecx
 0050B37E    mov         ecx,dword ptr [eax]
 0050B380    call        dword ptr [ecx+48]
 0050B383    xor         eax,eax
 0050B385    pop         edx
 0050B386    pop         ecx
 0050B387    pop         ecx
 0050B388    mov         dword ptr fs:[eax],edx
 0050B38B    push        50B3A2
 0050B390    mov         eax,dword ptr [ebp-4]
 0050B393    mov         byte ptr [eax+38C],0
 0050B39A    ret
>0050B39B    jmp         @HandleFinally
>0050B3A0    jmp         0050B390
 0050B3A2    pop         esi
 0050B3A3    pop         ecx
 0050B3A4    pop         ebp
 0050B3A5    ret
*}
end;

//0050B3A8
function RestoreInplaceEditor:Boolean;
begin
{*
 0050B3A8    push        ebp
 0050B3A9    mov         ebp,esp
 0050B3AB    push        0
 0050B3AD    push        0
 0050B3AF    push        ebx
 0050B3B0    push        esi
 0050B3B1    xor         eax,eax
 0050B3B3    push        ebp
 0050B3B4    push        50B456
 0050B3B9    push        dword ptr fs:[eax]
 0050B3BC    mov         dword ptr fs:[eax],esp
 0050B3BF    xor         ebx,ebx
 0050B3C1    mov         eax,dword ptr [ebp+8]
 0050B3C4    mov         eax,dword ptr [eax-4]
 0050B3C7    mov         esi,dword ptr [eax+398]
 0050B3CD    test        esi,esi
>0050B3CF    je          0050B43B
 0050B3D1    mov         eax,dword ptr [ebp+8]
 0050B3D4    mov         eax,esi
 0050B3D6    call        TCustomEdit.GetModified
 0050B3DB    test        al,al
>0050B3DD    je          0050B43B
 0050B3DF    lea         edx,[ebp-4]
 0050B3E2    mov         eax,dword ptr [ebp+8]
 0050B3E5    mov         eax,dword ptr [eax-4]
 0050B3E8    mov         eax,dword ptr [eax+398]
 0050B3EE    call        TCustomMaskEdit.GetEditText
 0050B3F3    mov         eax,dword ptr [ebp+8]
 0050B3F6    mov         eax,dword ptr [eax-4]
 0050B3F9    mov         eax,dword ptr [eax+398]
 0050B3FF    call        TInplaceEditList.RestoreContents
 0050B404    lea         edx,[ebp-8]
 0050B407    mov         eax,dword ptr [ebp+8]
 0050B40A    mov         eax,dword ptr [eax-4]
 0050B40D    mov         eax,dword ptr [eax+398]
 0050B413    call        TCustomMaskEdit.GetEditText
 0050B418    mov         edx,dword ptr [ebp-8]
 0050B41B    mov         eax,dword ptr [ebp-4]
 0050B41E    call        @UStrEqual
 0050B423    setne       bl
 0050B426    test        bl,bl
>0050B428    je          0050B43B
 0050B42A    mov         eax,dword ptr [ebp+8]
 0050B42D    mov         eax,dword ptr [eax-4]
 0050B430    mov         eax,dword ptr [eax+398]
 0050B436    call        TCustomEdit.SelectAll
 0050B43B    xor         eax,eax
 0050B43D    pop         edx
 0050B43E    pop         ecx
 0050B43F    pop         ecx
 0050B440    mov         dword ptr fs:[eax],edx
 0050B443    push        50B45D
 0050B448    lea         eax,[ebp-8]
 0050B44B    mov         edx,2
 0050B450    call        @UStrArrayClr
 0050B455    ret
>0050B456    jmp         @HandleFinally
>0050B45B    jmp         0050B448
 0050B45D    mov         eax,ebx
 0050B45F    pop         esi
 0050B460    pop         ebx
 0050B461    pop         ecx
 0050B462    pop         ecx
 0050B463    pop         ebp
 0050B464    ret
*}
end;

//0050B468
function TValueListEditor.RestoreCurrentRow:Boolean;
begin
{*
 0050B468    push        ebp
 0050B469    mov         ebp,esp
 0050B46B    push        ecx
 0050B46C    push        ebx
 0050B46D    mov         dword ptr [ebp-4],eax
 0050B470    push        ebp
 0050B471    call        RestoreInplaceEditor
 0050B476    pop         ecx
 0050B477    mov         ebx,eax
 0050B479    test        bl,bl
>0050B47B    jne         0050B49F
 0050B47D    mov         eax,dword ptr [ebp-4]
 0050B480    call        TValueListEditor.IsEmptyRow
 0050B485    test        al,al
>0050B487    je          0050B49F
 0050B489    mov         eax,dword ptr [ebp-4]
 0050B48C    mov         edx,dword ptr [eax+28C]
 0050B492    mov         eax,dword ptr [ebp-4]
 0050B495    mov         ecx,dword ptr [eax]
 0050B497    call        dword ptr [ecx+110]
 0050B49D    mov         bl,1
 0050B49F    mov         eax,ebx
 0050B4A1    pop         ebx
 0050B4A2    pop         ecx
 0050B4A3    pop         ebp
 0050B4A4    ret
*}
end;

//0050B4A8
procedure TValueListEditor.RowMoved(FromIndex:LongInt; ToIndex:LongInt);
begin
{*
 0050B4A8    push        ebx
 0050B4A9    push        esi
 0050B4AA    push        edi
 0050B4AB    push        ebp
 0050B4AC    mov         edi,ecx
 0050B4AE    mov         esi,edx
 0050B4B0    mov         ebx,eax
 0050B4B2    mov         eax,ebx
 0050B4B4    call        TValueListEditor.GetStrings
 0050B4B9    mov         ecx,edi
 0050B4BB    mov         edx,esi
 0050B4BD    mov         ebp,dword ptr [eax]
 0050B4BF    call        dword ptr [ebp+78]
 0050B4C2    mov         ecx,edi
 0050B4C4    mov         edx,esi
 0050B4C6    mov         eax,ebx
 0050B4C8    call        TCustomDrawGrid.RowMoved
 0050B4CD    pop         ebp
 0050B4CE    pop         edi
 0050B4CF    pop         esi
 0050B4D0    pop         ebx
 0050B4D1    ret
*}
end;

//0050B4D4
procedure TValueListEditor.DoOnValidate;
begin
{*
 0050B4D4    push        ebp
 0050B4D5    mov         ebp,esp
 0050B4D7    push        0
 0050B4D9    push        0
 0050B4DB    push        ebx
 0050B4DC    push        esi
 0050B4DD    mov         ebx,eax
 0050B4DF    xor         eax,eax
 0050B4E1    push        ebp
 0050B4E2    push        50B578
 0050B4E7    push        dword ptr fs:[eax]
 0050B4EA    mov         dword ptr fs:[eax],esp
 0050B4ED    cmp         word ptr [ebx+3B2],0
>0050B4F5    je          0050B55D
 0050B4F7    cmp         dword ptr [ebx+2EC],0
>0050B4FE    je          0050B55D
 0050B500    mov         eax,dword ptr [ebx+2EC]
 0050B506    call        TCustomEdit.GetModified
 0050B50B    test        al,al
>0050B50D    je          0050B55D
 0050B50F    mov         esi,dword ptr [ebx+28C]
 0050B515    push        esi
 0050B516    lea         eax,[ebp-4]
 0050B519    push        eax
 0050B51A    mov         ecx,esi
 0050B51C    xor         edx,edx
 0050B51E    mov         eax,ebx
 0050B520    mov         esi,dword ptr [eax]
 0050B522    call        dword ptr [esi+120]
 0050B528    mov         eax,dword ptr [ebp-4]
 0050B52B    push        eax
 0050B52C    lea         eax,[ebp-8]
 0050B52F    push        eax
 0050B530    mov         ecx,dword ptr [ebx+28C]
 0050B536    mov         edx,1
 0050B53B    mov         eax,ebx
 0050B53D    mov         esi,dword ptr [eax]
 0050B53F    call        dword ptr [esi+120]
 0050B545    mov         eax,dword ptr [ebp-8]
 0050B548    push        eax
 0050B549    mov         ecx,dword ptr [ebx+288]
 0050B54F    mov         edx,ebx
 0050B551    mov         eax,dword ptr [ebx+3B4]
 0050B557    call        dword ptr [ebx+3B0]
 0050B55D    xor         eax,eax
 0050B55F    pop         edx
 0050B560    pop         ecx
 0050B561    pop         ecx
 0050B562    mov         dword ptr fs:[eax],edx
 0050B565    push        50B57F
 0050B56A    lea         eax,[ebp-8]
 0050B56D    mov         edx,2
 0050B572    call        @UStrArrayClr
 0050B577    ret
>0050B578    jmp         @HandleFinally
>0050B57D    jmp         0050B56A
 0050B57F    pop         esi
 0050B580    pop         ebx
 0050B581    pop         ecx
 0050B582    pop         ecx
 0050B583    pop         ebp
 0050B584    ret
*}
end;

//0050B588
function TValueListEditor.SelectCell(ACol:LongInt; ARow:LongInt):Boolean;
begin
{*
 0050B588    push        ebx
 0050B589    push        esi
 0050B58A    push        edi
 0050B58B    push        ebp
 0050B58C    mov         esi,ecx
 0050B58E    mov         ebp,edx
 0050B590    mov         edi,eax
 0050B592    cmp         esi,dword ptr [edi+28C]
>0050B598    je          0050B5E9
 0050B59A    mov         eax,edi
 0050B59C    call        TValueListEditor.GetStrings
 0050B5A1    mov         edx,dword ptr [eax]
 0050B5A3    call        dword ptr [edx+14]
 0050B5A6    test        eax,eax
>0050B5A8    jle         0050B5E9
 0050B5AA    mov         eax,edi
 0050B5AC    call        TValueListEditor.IsEmptyRow
 0050B5B1    test        al,al
>0050B5B3    je          0050B5E9
 0050B5B5    cmp         byte ptr [edi+38C],0
>0050B5BC    jne         0050B5E9
 0050B5BE    mov         eax,dword ptr [edi+28C]
 0050B5C4    cmp         esi,eax
 0050B5C6    setl        bl
 0050B5C9    mov         edx,eax
 0050B5CB    mov         eax,edi
 0050B5CD    mov         ecx,dword ptr [eax]
 0050B5CF    call        dword ptr [ecx+110]
 0050B5D5    test        bl,bl
>0050B5D7    jne         0050B62A
 0050B5D9    push        1
 0050B5DB    mov         ecx,esi
 0050B5DD    dec         ecx
 0050B5DE    mov         edx,ebp
 0050B5E0    mov         eax,edi
 0050B5E2    call        TCustomGrid.FocusCell
>0050B5E7    jmp         0050B62A
 0050B5E9    cmp         byte ptr [edi+38C],0
>0050B5F0    jne         0050B5FC
 0050B5F2    mov         eax,edi
 0050B5F4    mov         edx,dword ptr [eax]
 0050B5F6    call        dword ptr [edx+11C]
 0050B5FC    mov         ecx,esi
 0050B5FE    mov         edx,ebp
 0050B600    mov         eax,edi
 0050B602    call        TCustomDrawGrid.SelectCell
 0050B607    test        al,al
>0050B609    je          0050B624
 0050B60B    mov         eax,edi
 0050B60D    call        TValueListEditor.GetOptions
 0050B612    test        ah,10
>0050B615    jne         0050B628
 0050B617    test        byte ptr [edi+380],1
>0050B61E    jne         0050B628
 0050B620    test        ebp,ebp
>0050B622    jg          0050B628
 0050B624    xor         ebx,ebx
>0050B626    jmp         0050B62A
 0050B628    mov         bl,1
 0050B62A    mov         eax,ebx
 0050B62C    pop         ebp
 0050B62D    pop         edi
 0050B62E    pop         esi
 0050B62F    pop         ebx
 0050B630    ret
*}
end;

//0050B634
function InsertOK:Boolean;
begin
{*
 0050B634    push        ebp
 0050B635    mov         ebp,esp
 0050B637    add         esp,0FFFFFFF8
 0050B63A    push        ebx
 0050B63B    xor         eax,eax
 0050B63D    mov         dword ptr [ebp-4],eax
 0050B640    xor         eax,eax
 0050B642    push        ebp
 0050B643    push        50B6B0
 0050B648    push        dword ptr fs:[eax]
 0050B64B    mov         dword ptr fs:[eax],esp
 0050B64E    lea         eax,[ebp-4]
 0050B651    push        eax
 0050B652    mov         eax,dword ptr [ebp+8]
 0050B655    mov         eax,dword ptr [eax-4]
 0050B658    mov         ecx,dword ptr [eax+28C]
 0050B65E    mov         eax,dword ptr [ebp+8]
 0050B661    mov         eax,dword ptr [eax-4]
 0050B664    xor         edx,edx
 0050B666    mov         ebx,dword ptr [eax]
 0050B668    call        dword ptr [ebx+120]
 0050B66E    mov         eax,dword ptr [ebp-4]
 0050B671    mov         dword ptr [ebp-8],eax
 0050B674    mov         eax,dword ptr [ebp-8]
 0050B677    test        eax,eax
>0050B679    je          0050B680
 0050B67B    sub         eax,4
 0050B67E    mov         eax,dword ptr [eax]
 0050B680    test        eax,eax
>0050B682    jle         0050B696
 0050B684    mov         eax,dword ptr [ebp+8]
 0050B687    mov         eax,dword ptr [eax-4]
 0050B68A    test        byte ptr [eax+380],2
 0050B691    setne       al
>0050B694    jmp         0050B698
 0050B696    xor         eax,eax
 0050B698    mov         ebx,eax
 0050B69A    xor         eax,eax
 0050B69C    pop         edx
 0050B69D    pop         ecx
 0050B69E    pop         ecx
 0050B69F    mov         dword ptr fs:[eax],edx
 0050B6A2    push        50B6B7
 0050B6A7    lea         eax,[ebp-4]
 0050B6AA    call        @UStrClr
 0050B6AF    ret
>0050B6B0    jmp         @HandleFinally
>0050B6B5    jmp         0050B6A7
 0050B6B7    mov         eax,ebx
 0050B6B9    pop         ebx
 0050B6BA    pop         ecx
 0050B6BB    pop         ecx
 0050B6BC    pop         ebp
 0050B6BD    ret
*}
end;

//0050B6C0
procedure SetRow(NewRow:Integer);
begin
{*
 0050B6C0    push        ebp
 0050B6C1    mov         ebp,esp
 0050B6C3    mov         edx,dword ptr [ebp+8]
 0050B6C6    mov         edx,dword ptr [edx-4]
 0050B6C9    xchg        eax,edx
 0050B6CA    call        TCustomGrid.SetRow
 0050B6CF    mov         eax,dword ptr [ebp+8]
 0050B6D2    mov         eax,dword ptr [eax-8]
 0050B6D5    mov         word ptr [eax],0
 0050B6DA    pop         ebp
 0050B6DB    ret
*}
end;

//0050B6DC
procedure TValueListEditor.KeyDown(var Key:Word; Shift:TShiftState);
begin
{*
 0050B6DC    push        ebp
 0050B6DD    mov         ebp,esp
 0050B6DF    add         esp,0FFFFFFF4
 0050B6E2    mov         word ptr [ebp-0A],cx
 0050B6E6    mov         dword ptr [ebp-8],edx
 0050B6E9    mov         dword ptr [ebp-4],eax
 0050B6EC    mov         eax,dword ptr [ebp-8]
 0050B6EF    movzx       eax,word ptr [eax]
 0050B6F2    add         eax,0FFFFFFE5
 0050B6F5    cmp         eax,13
>0050B6F8    ja          0050B841
 0050B6FE    movzx       eax,byte ptr [eax+50B70C]
 0050B705    jmp         dword ptr [eax*4+50B720]
 0050B705    db          5
 0050B705    db          0
 0050B705    db          0
 0050B705    db          0
 0050B705    db          0
 0050B705    db          0
 0050B705    db          0
 0050B705    db          0
 0050B705    db          0
 0050B705    db          0
 0050B705    db          0
 0050B705    db          2
 0050B705    db          0
 0050B705    db          1
 0050B705    db          0
 0050B705    db          0
 0050B705    db          0
 0050B705    db          0
 0050B705    db          3
 0050B705    db          4
 0050B705    dd          0050B841
 0050B705    dd          0050B738
 0050B705    dd          0050B7AC
 0050B705    dd          0050B7CF
 0050B705    dd          0050B7F1
 0050B705    dd          0050B839
 0050B738    movzx       eax,word ptr ds:[50B854]
 0050B73F    cmp         ax,word ptr [ebp-0A]
>0050B743    jne         0050B75A
 0050B745    push        ebp
 0050B746    mov         eax,dword ptr [ebp-4]
 0050B749    call        TValueListEditor.GetRowCount
 0050B74E    dec         eax
 0050B74F    call        SetRow
 0050B754    pop         ecx
>0050B755    jmp         0050B841
 0050B75A    movzx       eax,word ptr ds:[50B858]
 0050B761    cmp         ax,word ptr [ebp-0A]
>0050B765    jne         0050B841
 0050B76B    mov         eax,dword ptr [ebp-4]
 0050B76E    call        TValueListEditor.GetRowCount
 0050B773    dec         eax
 0050B774    mov         edx,dword ptr [ebp-4]
 0050B777    cmp         eax,dword ptr [edx+28C]
>0050B77D    jne         0050B841
 0050B783    push        ebp
 0050B784    call        InsertOK
 0050B789    pop         ecx
 0050B78A    test        al,al
>0050B78C    je          0050B841
 0050B792    push        ebp
 0050B793    push        1
 0050B795    xor         ecx,ecx
 0050B797    xor         edx,edx
 0050B799    mov         eax,dword ptr [ebp-4]
 0050B79C    call        TValueListEditor.InsertRow
 0050B7A1    call        SetRow
 0050B7A6    pop         ecx
>0050B7A7    jmp         0050B841
 0050B7AC    movzx       eax,word ptr ds:[50B854]
 0050B7B3    cmp         ax,word ptr [ebp-0A]
>0050B7B7    jne         0050B841
 0050B7BD    push        ebp
 0050B7BE    mov         eax,dword ptr [ebp-4]
 0050B7C1    mov         eax,dword ptr [eax+2A0]
 0050B7C7    call        SetRow
 0050B7CC    pop         ecx
>0050B7CD    jmp         0050B841
 0050B7CF    push        ebp
 0050B7D0    call        InsertOK
 0050B7D5    pop         ecx
 0050B7D6    test        al,al
>0050B7D8    je          0050B841
 0050B7DA    push        ebp
 0050B7DB    push        0
 0050B7DD    xor         ecx,ecx
 0050B7DF    xor         edx,edx
 0050B7E1    mov         eax,dword ptr [ebp-4]
 0050B7E4    call        TValueListEditor.InsertRow
 0050B7E9    call        SetRow
 0050B7EE    pop         ecx
>0050B7EF    jmp         0050B841
 0050B7F1    movzx       eax,word ptr ds:[50B854]
 0050B7F8    cmp         ax,word ptr [ebp-0A]
>0050B7FC    jne         0050B841
 0050B7FE    mov         eax,dword ptr [ebp-4]
 0050B801    test        byte ptr [eax+380],4
>0050B808    je          0050B841
 0050B80A    mov         eax,dword ptr [ebp-4]
 0050B80D    call        TValueListEditor.GetStrings
 0050B812    mov         edx,dword ptr [eax]
 0050B814    call        dword ptr [edx+14]
 0050B817    test        eax,eax
>0050B819    jle         0050B82F
 0050B81B    mov         eax,dword ptr [ebp-4]
 0050B81E    mov         edx,dword ptr [eax+28C]
 0050B824    mov         eax,dword ptr [ebp-4]
 0050B827    mov         ecx,dword ptr [eax]
 0050B829    call        dword ptr [ecx+110]
 0050B82F    mov         eax,dword ptr [ebp-8]
 0050B832    mov         word ptr [eax],0
>0050B837    jmp         0050B841
 0050B839    mov         eax,dword ptr [ebp-4]
 0050B83C    call        TValueListEditor.RestoreCurrentRow
 0050B841    mov         edx,dword ptr [ebp-8]
 0050B844    movzx       ecx,word ptr [ebp-0A]
 0050B848    mov         eax,dword ptr [ebp-4]
 0050B84B    call        TCustomGrid.KeyDown
 0050B850    mov         esp,ebp
 0050B852    pop         ebp
 0050B853    ret
*}
end;

//0050B85C
function TValueListEditor.GetOptions:TGridOptions;
begin
{*
 0050B85C    mov         edx,dword ptr [eax+2B4]
 0050B862    mov         eax,edx
 0050B864    ret
*}
end;

//0050B868
procedure TValueListEditor.SetOptions(const Value:TGridOptions);
begin
{*
 0050B868    push        ecx
 0050B869    mov         dword ptr [esp],edx
 0050B86C    test        byte ptr [esp+1],2
>0050B871    je          0050B88A
 0050B873    mov         ecx,dword ptr ds:[78DB88];^SResString297:TResStringRec
 0050B879    mov         dl,1
 0050B87B    mov         eax,[00418C04];Exception
 0050B880    call        Exception.CreateRes
 0050B885    call        @RaiseExcept
 0050B88A    mov         edx,dword ptr [esp]
 0050B88D    call        TCustomGrid.SetOptions
 0050B892    pop         edx
 0050B893    ret
*}
end;

//0050B894
procedure TValueListEditor.CreateWnd;
begin
{*
 0050B894    push        ebx
 0050B895    mov         ebx,eax
 0050B897    mov         eax,ebx
 0050B899    call        TCustomGrid.CreateWnd
 0050B89E    push        0
 0050B8A0    push        0
 0050B8A2    push        0
 0050B8A4    push        1
 0050B8A6    mov         eax,ebx
 0050B8A8    call        TWinControl.GetHandle
 0050B8AD    push        eax
 0050B8AE    call        user32.SetScrollRange
 0050B8B3    pop         ebx
 0050B8B4    ret
*}
end;

//0050B8B8
procedure TValueListEditor.DoExit;
begin
{*
 0050B8B8    push        ebp
 0050B8B9    mov         ebp,esp
 0050B8BB    push        ecx
 0050B8BC    push        ebx
 0050B8BD    push        esi
 0050B8BE    push        edi
 0050B8BF    mov         dword ptr [ebp-4],eax
 0050B8C2    xor         eax,eax
 0050B8C4    push        ebp
 0050B8C5    push        50B8E5
 0050B8CA    push        dword ptr fs:[eax]
 0050B8CD    mov         dword ptr fs:[eax],esp
 0050B8D0    mov         eax,dword ptr [ebp-4]
 0050B8D3    mov         edx,dword ptr [eax]
 0050B8D5    call        dword ptr [edx+11C]
 0050B8DB    xor         eax,eax
 0050B8DD    pop         edx
 0050B8DE    pop         ecx
 0050B8DF    pop         ecx
 0050B8E0    mov         dword ptr fs:[eax],edx
>0050B8E3    jmp         0050B8FF
>0050B8E5    jmp         @HandleAnyException
 0050B8EA    mov         eax,dword ptr [ebp-4]
 0050B8ED    mov         edx,dword ptr [eax]
 0050B8EF    call        dword ptr [edx+0E8]
 0050B8F5    call        @RaiseAgain
 0050B8FA    call        @DoneExcept
 0050B8FF    mov         eax,dword ptr [ebp-4]
 0050B902    call        TCustomGrid.DoExit
 0050B907    mov         eax,dword ptr [ebp-4]
 0050B90A    call        TCustomGrid.HideEdit
 0050B90F    pop         edi
 0050B910    pop         esi
 0050B911    pop         ebx
 0050B912    pop         ecx
 0050B913    pop         ebp
 0050B914    ret
*}
end;

//0050B918
procedure TValueListEditor.CMShowingChanged(var Message:TMessage);
begin
{*
 0050B918    push        ebx
 0050B919    mov         ebx,eax
 0050B91B    mov         eax,ebx
 0050B91D    call        TCustomGrid.CMShowingChanged
 0050B922    cmp         byte ptr [ebx+1EA],0
>0050B929    je          0050B935
 0050B92B    mov         eax,ebx
 0050B92D    mov         edx,dword ptr [eax]
 0050B92F    call        dword ptr [edx+114]
 0050B935    pop         ebx
 0050B936    ret
*}
end;

//0050B938
procedure TValueListEditor.MouseDown(Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer);
begin
{*
 0050B938    push        ebp
 0050B939    mov         ebp,esp
 0050B93B    add         esp,0FFFFFFF8
 0050B93E    push        ebx
 0050B93F    push        esi
 0050B940    push        edi
 0050B941    mov         word ptr [ebp-6],cx
 0050B945    mov         ebx,edx
 0050B947    mov         dword ptr [ebp-4],eax
 0050B94A    xor         eax,eax
 0050B94C    push        ebp
 0050B94D    push        50B96D
 0050B952    push        dword ptr fs:[eax]
 0050B955    mov         dword ptr fs:[eax],esp
 0050B958    mov         eax,dword ptr [ebp-4]
 0050B95B    mov         edx,dword ptr [eax]
 0050B95D    call        dword ptr [edx+11C]
 0050B963    xor         eax,eax
 0050B965    pop         edx
 0050B966    pop         ecx
 0050B967    pop         ecx
 0050B968    mov         dword ptr fs:[eax],edx
>0050B96B    jmp         0050B987
>0050B96D    jmp         @HandleAnyException
 0050B972    mov         eax,dword ptr [ebp-4]
 0050B975    mov         edx,dword ptr [eax]
 0050B977    call        dword ptr [edx+0E8]
 0050B97D    call        @RaiseAgain
 0050B982    call        @DoneExcept
 0050B987    mov         eax,dword ptr [ebp+0C]
 0050B98A    push        eax
 0050B98B    mov         eax,dword ptr [ebp+8]
 0050B98E    push        eax
 0050B98F    movzx       ecx,word ptr [ebp-6]
 0050B993    mov         edx,ebx
 0050B995    mov         eax,dword ptr [ebp-4]
 0050B998    call        TCustomGrid.MouseDown
 0050B99D    mov         eax,dword ptr [ebp-4]
 0050B9A0    call        TCustomGrid.HideEdit
 0050B9A5    pop         edi
 0050B9A6    pop         esi
 0050B9A7    pop         ebx
 0050B9A8    pop         ecx
 0050B9A9    pop         ecx
 0050B9AA    pop         ebp
 0050B9AB    ret         8
*}
end;

//0050B9B0
constructor TValueListStrings.Create;
begin
{*
 0050B9B0    push        ebx
 0050B9B1    push        esi
 0050B9B2    test        dl,dl
>0050B9B4    je          0050B9BE
 0050B9B6    add         esp,0FFFFFFF0
 0050B9B9    call        @ClassCreate
 0050B9BE    mov         ebx,edx
 0050B9C0    mov         esi,eax
 0050B9C2    mov         dword ptr [esi+5C],ecx
 0050B9C5    xor         edx,edx
 0050B9C7    mov         eax,esi
 0050B9C9    call        TStringList.Create
 0050B9CE    mov         eax,esi
 0050B9D0    test        bl,bl
>0050B9D2    je          0050B9E3
 0050B9D4    call        @AfterConstruction
 0050B9D9    pop         dword ptr fs:[0]
 0050B9E0    add         esp,0C
 0050B9E3    mov         eax,esi
 0050B9E5    pop         esi
 0050B9E6    pop         ebx
 0050B9E7    ret
*}
end;

//0050B9E8
destructor TValueListStrings.Destroy();
begin
{*
 0050B9E8    push        ebx
 0050B9E9    push        esi
 0050B9EA    call        @BeforeDestruction
 0050B9EF    mov         ebx,edx
 0050B9F1    mov         esi,eax
 0050B9F3    mov         eax,esi
 0050B9F5    call        TValueListStrings.FreeItemProps
 0050B9FA    mov         edx,ebx
 0050B9FC    and         dl,0FC
 0050B9FF    mov         eax,esi
 0050BA01    call        TStringList.Destroy
 0050BA06    test        bl,bl
>0050BA08    jle         0050BA11
 0050BA0A    mov         eax,esi
 0050BA0C    call        @ClassDestroy
 0050BA11    pop         esi
 0050BA12    pop         ebx
 0050BA13    ret
*}
end;

//0050BA14
procedure TValueListStrings.Assign(Source:TPersistent);
begin
{*
 0050BA14    push        ebp
 0050BA15    mov         ebp,esp
 0050BA17    mov         ecx,5
 0050BA1C    push        0
 0050BA1E    push        0
 0050BA20    dec         ecx
>0050BA21    jne         0050BA1C
 0050BA23    push        ebx
 0050BA24    push        esi
 0050BA25    push        edi
 0050BA26    mov         ebx,edx
 0050BA28    mov         dword ptr [ebp-4],eax
 0050BA2B    xor         eax,eax
 0050BA2D    push        ebp
 0050BA2E    push        50BAC6
 0050BA33    push        dword ptr fs:[eax]
 0050BA36    mov         dword ptr fs:[eax],esp
 0050BA39    mov         edx,ebx
 0050BA3B    mov         eax,dword ptr [ebp-4]
 0050BA3E    call        TStringList.Assign
 0050BA43    mov         eax,ebx
 0050BA45    mov         edx,dword ptr ds:[5098E4];TValueListStrings
 0050BA4B    call        @IsClass
 0050BA50    test        al,al
>0050BA52    je          0050BAA5
 0050BA54    mov         dword ptr [ebp-8],ebx
 0050BA57    mov         eax,dword ptr [ebp-4]
 0050BA5A    mov         edx,dword ptr [eax]
 0050BA5C    call        dword ptr [edx+14]
 0050BA5F    mov         edi,eax
 0050BA61    dec         edi
 0050BA62    test        edi,edi
>0050BA64    jl          0050BAA5
 0050BA66    inc         edi
 0050BA67    xor         ebx,ebx
 0050BA69    lea         eax,[ebp-18]
 0050BA6C    mov         edx,ebx
 0050BA6E    mov         cl,0FC
 0050BA70    call        @VarFromInt
 0050BA75    lea         edx,[ebp-18]
 0050BA78    xor         ecx,ecx
 0050BA7A    mov         eax,dword ptr [ebp-8]
 0050BA7D    call        TValueListStrings.FindItemProp
 0050BA82    mov         esi,eax
 0050BA84    test        esi,esi
>0050BA86    je          0050BAA1
 0050BA88    lea         eax,[ebp-28]
 0050BA8B    mov         edx,ebx
 0050BA8D    mov         cl,0FC
 0050BA8F    call        @VarFromInt
 0050BA94    lea         edx,[ebp-28]
 0050BA97    mov         ecx,esi
 0050BA99    mov         eax,dword ptr [ebp-4]
 0050BA9C    call        TValueListStrings.PutItemProp
 0050BAA1    inc         ebx
 0050BAA2    dec         edi
>0050BAA3    jne         0050BA69
 0050BAA5    xor         eax,eax
 0050BAA7    pop         edx
 0050BAA8    pop         ecx
 0050BAA9    pop         ecx
 0050BAAA    mov         dword ptr fs:[eax],edx
 0050BAAD    push        50BACD
 0050BAB2    lea         eax,[ebp-28]
 0050BAB5    mov         edx,dword ptr ds:[4012C4];Variant
 0050BABB    mov         ecx,2
 0050BAC0    call        @FinalizeArray
 0050BAC5    ret
>0050BAC6    jmp         @HandleFinally
>0050BACB    jmp         0050BAB2
 0050BACD    pop         edi
 0050BACE    pop         esi
 0050BACF    pop         ebx
 0050BAD0    mov         esp,ebp
 0050BAD2    pop         ebp
 0050BAD3    ret
*}
end;

//0050BAD4
procedure TValueListStrings.Changing;
begin
{*
 0050BAD4    push        esi
 0050BAD5    mov         esi,eax
 0050BAD7    mov         eax,esi
 0050BAD9    call        TStringList.Changing
 0050BADE    cmp         dword ptr [esi+20],0
>0050BAE2    jne         0050BB02
 0050BAE4    cmp         dword ptr [esi+5C],0
>0050BAE8    je          0050BB02
 0050BAEA    mov         eax,dword ptr [esi+5C]
 0050BAED    cmp         dword ptr [eax+390],0
>0050BAF4    jne         0050BB02
 0050BAF6    mov         eax,dword ptr [esi+5C]
 0050BAF9    mov         si,0FF98
 0050BAFD    call        @CallDynaInst
 0050BB02    pop         esi
 0050BB03    ret
*}
end;

//0050BB04
procedure TValueListStrings.Changed;
begin
{*
 0050BB04    push        ebx
 0050BB05    mov         ebx,eax
 0050BB07    mov         eax,ebx
 0050BB09    call        TStringList.Changed
 0050BB0E    cmp         dword ptr [ebx+20],0
>0050BB12    jne         0050BB22
 0050BB14    cmp         dword ptr [ebx+5C],0
>0050BB18    je          0050BB22
 0050BB1A    mov         eax,dword ptr [ebx+5C]
 0050BB1D    call        TValueListEditor.Refresh
 0050BB22    pop         ebx
 0050BB23    ret
*}
end;

//0050BB24
function TValueListStrings.KeyIsValid(Key:string; RaiseError:Boolean):Boolean;
begin
{*
 0050BB24    push        ebx
 0050BB25    push        esi
 0050BB26    push        edi
 0050BB27    add         esp,0FFFFFFF4
 0050BB2A    mov         byte ptr [esp],cl
 0050BB2D    mov         esi,edx
 0050BB2F    mov         edi,eax
 0050BB31    mov         bl,1
 0050BB33    mov         edx,esi
 0050BB35    mov         eax,50BBC0;'='
 0050BB3A    call        Pos
 0050BB3F    test        eax,eax
>0050BB41    je          0050BB5A
 0050BB43    mov         ecx,dword ptr ds:[78D3B4];^SResString298:TResStringRec
 0050BB49    mov         dl,1
 0050BB4B    mov         eax,[00418C04];Exception
 0050BB50    call        Exception.CreateRes
 0050BB55    call        @RaiseExcept
 0050BB5A    mov         eax,dword ptr [edi+5C]
 0050BB5D    test        eax,eax
>0050BB5F    je          0050BBAB
 0050BB61    test        byte ptr [eax+380],8
>0050BB68    je          0050BBAB
 0050BB6A    test        esi,esi
>0050BB6C    je          0050BBAB
 0050BB6E    mov         edx,esi
 0050BB70    mov         eax,edi
 0050BB72    mov         ecx,dword ptr [eax]
 0050BB74    call        dword ptr [ecx+58]
 0050BB77    inc         eax
 0050BB78    sete        bl
 0050BB7B    mov         eax,ebx
 0050BB7D    xor         al,1
 0050BB7F    and         al,byte ptr [esp]
>0050BB82    je          0050BBAB
 0050BB84    mov         dword ptr [esp+4],esi
 0050BB88    mov         byte ptr [esp+8],11
 0050BB8D    lea         eax,[esp+4]
 0050BB91    push        eax
 0050BB92    push        0
 0050BB94    mov         ecx,dword ptr ds:[78D3B0];^SResString295:TResStringRec
 0050BB9A    mov         dl,1
 0050BB9C    mov         eax,[00418C04];Exception
 0050BBA1    call        Exception.CreateResFmt
 0050BBA6    call        @RaiseExcept
 0050BBAB    mov         eax,ebx
 0050BBAD    add         esp,0C
 0050BBB0    pop         edi
 0050BBB1    pop         esi
 0050BBB2    pop         ebx
 0050BBB3    ret
*}
end;

//0050BBC4
procedure TValueListStrings.Clear;
begin
{*
 0050BBC4    push        ebx
 0050BBC5    mov         ebx,eax
 0050BBC7    mov         eax,ebx
 0050BBC9    call        TStringList.Clear
 0050BBCE    mov         eax,ebx
 0050BBD0    call        TValueListStrings.FreeItemProps
 0050BBD5    pop         ebx
 0050BBD6    ret
*}
end;

//0050BBD8
procedure TValueListStrings.CustomSort(Compare:TStringListSortCompare);
begin
{*
 0050BBD8    push        ebp
 0050BBD9    mov         ebp,esp
 0050BBDB    add         esp,0FFFFFFE8
 0050BBDE    push        ebx
 0050BBDF    push        esi
 0050BBE0    push        edi
 0050BBE1    xor         ecx,ecx
 0050BBE3    mov         dword ptr [ebp-18],ecx
 0050BBE6    mov         dword ptr [ebp-14],ecx
 0050BBE9    mov         dword ptr [ebp-4],ecx
 0050BBEC    mov         dword ptr [ebp-0C],edx
 0050BBEF    mov         dword ptr [ebp-8],eax
 0050BBF2    xor         eax,eax
 0050BBF4    push        ebp
 0050BBF5    push        50BD18
 0050BBFA    push        dword ptr fs:[eax]
 0050BBFD    mov         dword ptr fs:[eax],esp
 0050BC00    mov         dl,1
 0050BC02    mov         eax,[00439644];TList
 0050BC07    call        TObject.Create
 0050BC0C    mov         dword ptr [ebp-10],eax
 0050BC0F    xor         edx,edx
 0050BC11    push        ebp
 0050BC12    push        50BCDD
 0050BC17    push        dword ptr fs:[edx]
 0050BC1A    mov         dword ptr fs:[edx],esp
 0050BC1D    mov         eax,dword ptr [ebp-8]
 0050BC20    mov         edx,dword ptr [eax]
 0050BC22    call        dword ptr [edx+14]
 0050BC25    mov         edx,eax
 0050BC27    mov         eax,dword ptr [ebp-10]
 0050BC2A    call        TList.SetCount
 0050BC2F    mov         eax,dword ptr [ebp-8]
 0050BC32    mov         edx,dword ptr [eax]
 0050BC34    call        dword ptr [edx+14]
 0050BC37    push        eax
 0050BC38    lea         eax,[ebp-4]
 0050BC3B    push        eax
 0050BC3C    mov         eax,dword ptr [ebp-8]
 0050BC3F    mov         eax,dword ptr [eax+58]
 0050BC42    xor         ecx,ecx
 0050BC44    mov         edx,dword ptr ds:[5098B4];TItemProps
 0050BC4A    call        @DynArrayCopyRange
 0050BC4F    mov         eax,dword ptr [ebp-8]
 0050BC52    mov         edx,dword ptr [eax]
 0050BC54    call        dword ptr [edx+14]
 0050BC57    mov         esi,eax
 0050BC59    dec         esi
 0050BC5A    test        esi,esi
>0050BC5C    jl          0050BC7F
 0050BC5E    inc         esi
 0050BC5F    xor         ebx,ebx
 0050BC61    lea         ecx,[ebp-14]
 0050BC64    mov         edx,ebx
 0050BC66    mov         eax,dword ptr [ebp-8]
 0050BC69    mov         edi,dword ptr [eax]
 0050BC6B    call        dword ptr [edi+0C]
 0050BC6E    mov         ecx,dword ptr [ebp-14]
 0050BC71    mov         edx,ebx
 0050BC73    mov         eax,dword ptr [ebp-10]
 0050BC76    call        TList.Put
 0050BC7B    inc         ebx
 0050BC7C    dec         esi
>0050BC7D    jne         0050BC61
 0050BC7F    mov         edx,dword ptr [ebp-0C]
 0050BC82    mov         eax,dword ptr [ebp-8]
 0050BC85    call        TStringList.CustomSort
 0050BC8A    mov         eax,dword ptr [ebp-8]
 0050BC8D    mov         edx,dword ptr [eax]
 0050BC8F    call        dword ptr [edx+14]
 0050BC92    mov         esi,eax
 0050BC94    dec         esi
 0050BC95    test        esi,esi
>0050BC97    jl          0050BCC7
 0050BC99    inc         esi
 0050BC9A    xor         ebx,ebx
 0050BC9C    lea         ecx,[ebp-18]
 0050BC9F    mov         edx,ebx
 0050BCA1    mov         eax,dword ptr [ebp-8]
 0050BCA4    mov         edi,dword ptr [eax]
 0050BCA6    call        dword ptr [edi+0C]
 0050BCA9    mov         edx,dword ptr [ebp-18]
 0050BCAC    mov         eax,dword ptr [ebp-10]
 0050BCAF    call        TList.IndexOf
 0050BCB4    mov         edx,dword ptr [ebp-4]
 0050BCB7    mov         eax,dword ptr [edx+eax*4]
 0050BCBA    mov         edx,dword ptr [ebp-8]
 0050BCBD    mov         edx,dword ptr [edx+58]
 0050BCC0    mov         dword ptr [edx+ebx*4],eax
 0050BCC3    inc         ebx
 0050BCC4    dec         esi
>0050BCC5    jne         0050BC9C
 0050BCC7    xor         eax,eax
 0050BCC9    pop         edx
 0050BCCA    pop         ecx
 0050BCCB    pop         ecx
 0050BCCC    mov         dword ptr fs:[eax],edx
 0050BCCF    push        50BCE4
 0050BCD4    mov         eax,dword ptr [ebp-10]
 0050BCD7    call        TObject.Free
 0050BCDC    ret
>0050BCDD    jmp         @HandleFinally
>0050BCE2    jmp         0050BCD4
 0050BCE4    mov         eax,dword ptr [ebp-8]
 0050BCE7    mov         eax,dword ptr [eax+5C]
 0050BCEA    call        TCustomGrid.InvalidateEditor
 0050BCEF    xor         eax,eax
 0050BCF1    pop         edx
 0050BCF2    pop         ecx
 0050BCF3    pop         ecx
 0050BCF4    mov         dword ptr fs:[eax],edx
 0050BCF7    push        50BD1F
 0050BCFC    lea         eax,[ebp-18]
 0050BCFF    mov         edx,2
 0050BD04    call        @UStrArrayClr
 0050BD09    lea         eax,[ebp-4]
 0050BD0C    mov         edx,dword ptr ds:[5098B4];TItemProps
 0050BD12    call        @DynArrayClear
 0050BD17    ret
>0050BD18    jmp         @HandleFinally
>0050BD1D    jmp         0050BCFC
 0050BD1F    pop         edi
 0050BD20    pop         esi
 0050BD21    pop         ebx
 0050BD22    mov         esp,ebp
 0050BD24    pop         ebp
 0050BD25    ret
*}
end;

//0050BD28
procedure TValueListStrings.Delete(Index:Integer);
begin
{*
 0050BD28    push        ebx
 0050BD29    push        esi
 0050BD2A    mov         esi,edx
 0050BD2C    mov         ebx,eax
 0050BD2E    mov         eax,ebx
 0050BD30    mov         edx,dword ptr [eax]
 0050BD32    call        dword ptr [edx+94]
 0050BD38    mov         edx,esi
 0050BD3A    mov         eax,ebx
 0050BD3C    call        TStringList.Delete
 0050BD41    mov         eax,dword ptr [ebx+58]
 0050BD44    mov         eax,dword ptr [eax+esi*4]
 0050BD47    call        TObject.Free
 0050BD4C    mov         eax,ebx
 0050BD4E    mov         edx,dword ptr [eax]
 0050BD50    call        dword ptr [edx+14]
 0050BD53    cmp         esi,eax
>0050BD55    jge         0050BD78
 0050BD57    mov         eax,ebx
 0050BD59    mov         edx,dword ptr [eax]
 0050BD5B    call        dword ptr [edx+14]
 0050BD5E    sub         eax,esi
 0050BD60    mov         ecx,eax
 0050BD62    add         ecx,ecx
 0050BD64    add         ecx,ecx
 0050BD66    mov         eax,dword ptr [ebx+58]
 0050BD69    lea         edx,[eax+esi*4]
 0050BD6C    mov         eax,dword ptr [ebx+58]
 0050BD6F    lea         eax,[eax+esi*4+4]
 0050BD73    call        Move
 0050BD78    mov         eax,ebx
 0050BD7A    mov         edx,dword ptr [eax]
 0050BD7C    call        dword ptr [edx+14]
 0050BD7F    push        eax
 0050BD80    lea         eax,[ebx+58]
 0050BD83    mov         ecx,1
 0050BD88    mov         edx,dword ptr ds:[5098B4];TItemProps
 0050BD8E    call        @DynArraySetLength
 0050BD93    add         esp,4
 0050BD96    mov         eax,ebx
 0050BD98    mov         edx,dword ptr [eax]
 0050BD9A    call        dword ptr [edx+90]
 0050BDA0    pop         esi
 0050BDA1    pop         ebx
 0050BDA2    ret
*}
end;

//0050BDA4
procedure TValueListStrings.Exchange(Index1:Integer; Index2:Integer);
begin
{*
 0050BDA4    push        ebx
 0050BDA5    push        esi
 0050BDA6    push        edi
 0050BDA7    mov         edi,ecx
 0050BDA9    mov         esi,edx
 0050BDAB    mov         ebx,eax
 0050BDAD    mov         eax,ebx
 0050BDAF    mov         edx,dword ptr [eax]
 0050BDB1    call        dword ptr [edx+94]
 0050BDB7    mov         ecx,edi
 0050BDB9    mov         edx,esi
 0050BDBB    mov         eax,ebx
 0050BDBD    call        TStringList.Exchange
 0050BDC2    mov         eax,dword ptr [ebx+58]
 0050BDC5    mov         eax,dword ptr [eax+esi*4]
 0050BDC8    mov         edx,dword ptr [ebx+58]
 0050BDCB    mov         edx,dword ptr [edx+edi*4]
 0050BDCE    mov         ecx,dword ptr [ebx+58]
 0050BDD1    mov         dword ptr [ecx+esi*4],edx
 0050BDD4    mov         edx,dword ptr [ebx+58]
 0050BDD7    mov         dword ptr [edx+edi*4],eax
 0050BDDA    mov         eax,ebx
 0050BDDC    mov         edx,dword ptr [eax]
 0050BDDE    call        dword ptr [edx+90]
 0050BDE4    pop         edi
 0050BDE5    pop         esi
 0050BDE6    pop         ebx
 0050BDE7    ret
*}
end;

//0050BDE8
function TValueListStrings.FindItemProp(const KeyOrIndex:Variant; Create:Boolean):TItemProp;
begin
{*
 0050BDE8    push        ebp
 0050BDE9    mov         ebp,esp
 0050BDEB    add         esp,0FFFFFFF0
 0050BDEE    push        ebx
 0050BDEF    push        esi
 0050BDF0    push        edi
 0050BDF1    xor         ebx,ebx
 0050BDF3    mov         dword ptr [ebp-8],ebx
 0050BDF6    mov         byte ptr [ebp-1],cl
 0050BDF9    mov         esi,edx
 0050BDFB    mov         ebx,eax
 0050BDFD    xor         eax,eax
 0050BDFF    push        ebp
 0050BE00    push        50BEC0
 0050BE05    push        dword ptr fs:[eax]
 0050BE08    mov         dword ptr fs:[eax],esp
 0050BE0B    mov         eax,ebx
 0050BE0D    mov         edx,dword ptr [eax]
 0050BE0F    call        dword ptr [edx+14]
 0050BE12    test        eax,eax
>0050BE14    jle         0050BEA8
 0050BE1A    cmp         dword ptr [ebx+58],0
>0050BE1E    je          0050BEA8
 0050BE24    mov         eax,esi
 0050BE26    call        VarIsOrdinal
 0050BE2B    test        al,al
>0050BE2D    je          0050BE3A
 0050BE2F    mov         eax,esi
 0050BE31    call        @VarToInteger
 0050BE36    mov         edi,eax
>0050BE38    jmp         0050BE7F
 0050BE3A    lea         eax,[ebp-8]
 0050BE3D    mov         edx,esi
 0050BE3F    call        @VarToUStr
 0050BE44    mov         edx,dword ptr [ebp-8]
 0050BE47    mov         eax,ebx
 0050BE49    mov         ecx,dword ptr [eax]
 0050BE4B    call        dword ptr [ecx+58]
 0050BE4E    mov         edi,eax
 0050BE50    cmp         byte ptr [ebp-1],0
>0050BE54    je          0050BE7F
 0050BE56    cmp         edi,0FFFFFFFF
>0050BE59    jne         0050BE7F
 0050BE5B    mov         dword ptr [ebp-10],esi
 0050BE5E    mov         byte ptr [ebp-0C],0D
 0050BE62    lea         eax,[ebp-10]
 0050BE65    push        eax
 0050BE66    push        0
 0050BE68    mov         ecx,dword ptr ds:[78D55C];^SResString296:TResStringRec
 0050BE6E    mov         dl,1
 0050BE70    mov         eax,[00418C04];Exception
 0050BE75    call        Exception.CreateResFmt
 0050BE7A    call        @RaiseExcept
 0050BE7F    mov         eax,dword ptr [ebx+58]
 0050BE82    mov         esi,dword ptr [eax+edi*4]
 0050BE85    cmp         byte ptr [ebp-1],0
>0050BE89    je          0050BEAA
 0050BE8B    test        esi,esi
>0050BE8D    jne         0050BEAA
 0050BE8F    mov         ecx,dword ptr [ebx+5C]
 0050BE92    mov         dl,1
 0050BE94    mov         eax,[00509C6C];TItemProp
 0050BE99    call        TItemProp.Create
 0050BE9E    mov         esi,eax
 0050BEA0    mov         eax,dword ptr [ebx+58]
 0050BEA3    mov         dword ptr [eax+edi*4],esi
>0050BEA6    jmp         0050BEAA
 0050BEA8    xor         esi,esi
 0050BEAA    xor         eax,eax
 0050BEAC    pop         edx
 0050BEAD    pop         ecx
 0050BEAE    pop         ecx
 0050BEAF    mov         dword ptr fs:[eax],edx
 0050BEB2    push        50BEC7
 0050BEB7    lea         eax,[ebp-8]
 0050BEBA    call        @UStrClr
 0050BEBF    ret
>0050BEC0    jmp         @HandleFinally
>0050BEC5    jmp         0050BEB7
 0050BEC7    mov         eax,esi
 0050BEC9    pop         edi
 0050BECA    pop         esi
 0050BECB    pop         ebx
 0050BECC    mov         esp,ebp
 0050BECE    pop         ebp
 0050BECF    ret
*}
end;

//0050BED0
procedure TValueListStrings.InsertItem(Index:Integer; const S:UnicodeString; AObject:TObject);
begin
{*
 0050BED0    push        ebp
 0050BED1    mov         ebp,esp
 0050BED3    add         esp,0FFFFFFF8
 0050BED6    push        ebx
 0050BED7    push        esi
 0050BED8    push        edi
 0050BED9    xor         ebx,ebx
 0050BEDB    mov         dword ptr [ebp-8],ebx
 0050BEDE    mov         dword ptr [ebp-4],ecx
 0050BEE1    mov         esi,edx
 0050BEE3    mov         ebx,eax
 0050BEE5    xor         eax,eax
 0050BEE7    push        ebp
 0050BEE8    push        50BF93
 0050BEED    push        dword ptr fs:[eax]
 0050BEF0    mov         dword ptr fs:[eax],esp
 0050BEF3    lea         ecx,[ebp-8]
 0050BEF6    mov         edx,dword ptr [ebp-4]
 0050BEF9    mov         eax,ebx
 0050BEFB    call        TStrings.ExtractName
 0050BF00    mov         edx,dword ptr [ebp-8]
 0050BF03    mov         cl,1
 0050BF05    mov         eax,ebx
 0050BF07    call        TValueListStrings.KeyIsValid
 0050BF0C    mov         eax,ebx
 0050BF0E    mov         edx,dword ptr [eax]
 0050BF10    call        dword ptr [edx+94]
 0050BF16    mov         eax,ebx
 0050BF18    mov         edx,dword ptr [eax]
 0050BF1A    call        dword ptr [edx+14]
 0050BF1D    mov         edi,eax
 0050BF1F    mov         eax,dword ptr [ebp+8]
 0050BF22    push        eax
 0050BF23    mov         ecx,dword ptr [ebp-4]
 0050BF26    mov         edx,esi
 0050BF28    mov         eax,ebx
 0050BF2A    call        TStringList.InsertItem
 0050BF2F    mov         eax,ebx
 0050BF31    mov         edx,dword ptr [eax]
 0050BF33    call        dword ptr [edx+14]
 0050BF36    push        eax
 0050BF37    lea         eax,[ebx+58]
 0050BF3A    mov         ecx,1
 0050BF3F    mov         edx,dword ptr ds:[5098B4];TItemProps
 0050BF45    call        @DynArraySetLength
 0050BF4A    add         esp,4
 0050BF4D    cmp         edi,esi
>0050BF4F    jle         0050BF6B
 0050BF51    sub         edi,esi
 0050BF53    mov         ecx,edi
 0050BF55    add         ecx,ecx
 0050BF57    add         ecx,ecx
 0050BF59    mov         eax,dword ptr [ebx+58]
 0050BF5C    lea         edx,[eax+esi*4+4]
 0050BF60    mov         eax,dword ptr [ebx+58]
 0050BF63    lea         eax,[eax+esi*4]
 0050BF66    call        Move
 0050BF6B    mov         eax,dword ptr [ebx+58]
 0050BF6E    xor         edx,edx
 0050BF70    mov         dword ptr [eax+esi*4],edx
 0050BF73    mov         eax,ebx
 0050BF75    mov         edx,dword ptr [eax]
 0050BF77    call        dword ptr [edx+90]
 0050BF7D    xor         eax,eax
 0050BF7F    pop         edx
 0050BF80    pop         ecx
 0050BF81    pop         ecx
 0050BF82    mov         dword ptr fs:[eax],edx
 0050BF85    push        50BF9A
 0050BF8A    lea         eax,[ebp-8]
 0050BF8D    call        @UStrClr
 0050BF92    ret
>0050BF93    jmp         @HandleFinally
>0050BF98    jmp         0050BF8A
 0050BF9A    pop         edi
 0050BF9B    pop         esi
 0050BF9C    pop         ebx
 0050BF9D    pop         ecx
 0050BF9E    pop         ecx
 0050BF9F    pop         ebp
 0050BFA0    ret         4
*}
end;

//0050BFA4
procedure TValueListStrings.Put(Index:Integer; const S:UnicodeString);
begin
{*
 0050BFA4    push        ebp
 0050BFA5    mov         ebp,esp
 0050BFA7    push        0
 0050BFA9    push        ebx
 0050BFAA    push        esi
 0050BFAB    push        edi
 0050BFAC    mov         edi,ecx
 0050BFAE    mov         esi,edx
 0050BFB0    mov         ebx,eax
 0050BFB2    xor         eax,eax
 0050BFB4    push        ebp
 0050BFB5    push        50C006
 0050BFBA    push        dword ptr fs:[eax]
 0050BFBD    mov         dword ptr fs:[eax],esp
 0050BFC0    lea         ecx,[ebp-4]
 0050BFC3    mov         edx,edi
 0050BFC5    mov         eax,ebx
 0050BFC7    call        TStrings.ExtractName
 0050BFCC    mov         edx,dword ptr [ebp-4]
 0050BFCF    mov         eax,ebx
 0050BFD1    mov         ecx,dword ptr [eax]
 0050BFD3    call        dword ptr [ecx+58]
 0050BFD6    cmp         esi,eax
 0050BFD8    setne       cl
 0050BFDB    mov         edx,dword ptr [ebp-4]
 0050BFDE    mov         eax,ebx
 0050BFE0    call        TValueListStrings.KeyIsValid
 0050BFE5    mov         ecx,edi
 0050BFE7    mov         edx,esi
 0050BFE9    mov         eax,ebx
 0050BFEB    call        TStringList.Put
 0050BFF0    xor         eax,eax
 0050BFF2    pop         edx
 0050BFF3    pop         ecx
 0050BFF4    pop         ecx
 0050BFF5    mov         dword ptr fs:[eax],edx
 0050BFF8    push        50C00D
 0050BFFD    lea         eax,[ebp-4]
 0050C000    call        @UStrClr
 0050C005    ret
>0050C006    jmp         @HandleFinally
>0050C00B    jmp         0050BFFD
 0050C00D    pop         edi
 0050C00E    pop         esi
 0050C00F    pop         ebx
 0050C010    pop         ecx
 0050C011    pop         ebp
 0050C012    ret
*}
end;

//0050C014
procedure TValueListStrings.PutItemProp(const KeyOrIndex:Variant; const Value:TItemProp);
begin
{*
 0050C014    push        ebx
 0050C015    push        esi
 0050C016    push        edi
 0050C017    mov         edi,ecx
 0050C019    mov         esi,edx
 0050C01B    mov         ebx,eax
 0050C01D    mov         edx,esi
 0050C01F    mov         cl,1
 0050C021    mov         eax,ebx
 0050C023    call        TValueListStrings.FindItemProp
 0050C028    mov         edx,edi
 0050C02A    mov         ecx,dword ptr [eax]
 0050C02C    call        dword ptr [ecx+8]
 0050C02F    pop         edi
 0050C030    pop         esi
 0050C031    pop         ebx
 0050C032    ret
*}
end;

//0050C034
procedure TValueListStrings.FreeItemProps;
begin
{*
 0050C034    push        ebx
 0050C035    push        esi
 0050C036    push        edi
 0050C037    mov         edi,eax
 0050C039    mov         eax,dword ptr [edi+58]
 0050C03C    call        @DynArrayLength
 0050C041    mov         ebx,eax
 0050C043    dec         ebx
 0050C044    test        ebx,ebx
>0050C046    jl          0050C05A
 0050C048    inc         ebx
 0050C049    xor         esi,esi
 0050C04B    mov         eax,dword ptr [edi+58]
 0050C04E    mov         eax,dword ptr [eax+esi*4]
 0050C051    call        TObject.Free
 0050C056    inc         esi
 0050C057    dec         ebx
>0050C058    jne         0050C04B
 0050C05A    push        0
 0050C05C    lea         eax,[edi+58]
 0050C05F    mov         ecx,1
 0050C064    mov         edx,dword ptr ds:[5098B4];TItemProps
 0050C06A    call        @DynArraySetLength
 0050C06F    add         esp,4
 0050C072    pop         edi
 0050C073    pop         esi
 0050C074    pop         ebx
 0050C075    ret
*}
end;

//0050C078
constructor TItemProp.Create;
begin
{*
 0050C078    push        ebx
 0050C079    push        esi
 0050C07A    push        edi
 0050C07B    test        dl,dl
>0050C07D    je          0050C087
 0050C07F    add         esp,0FFFFFFF0
 0050C082    call        @ClassCreate
 0050C087    mov         esi,ecx
 0050C089    mov         ebx,edx
 0050C08B    mov         edi,eax
 0050C08D    xor         edx,edx
 0050C08F    mov         eax,edi
 0050C091    call        TObject.Create
 0050C096    mov         dword ptr [edi+4],esi
 0050C099    mov         eax,edi
 0050C09B    test        bl,bl
>0050C09D    je          0050C0AE
 0050C09F    call        @AfterConstruction
 0050C0A4    pop         dword ptr fs:[0]
 0050C0AB    add         esp,0C
 0050C0AE    mov         eax,edi
 0050C0B0    pop         edi
 0050C0B1    pop         esi
 0050C0B2    pop         ebx
 0050C0B3    ret
*}
end;

//0050C0B4
destructor TItemProp.Destroy();
begin
{*
 0050C0B4    push        ebx
 0050C0B5    push        esi
 0050C0B6    call        @BeforeDestruction
 0050C0BB    mov         ebx,edx
 0050C0BD    mov         esi,eax
 0050C0BF    cmp         dword ptr [esi+10],0;TItemProp.FPickList:TStrings
>0050C0C3    je          0050C0D5
 0050C0C5    lea         eax,[esi+10];TItemProp.FPickList:TStrings
 0050C0C8    mov         edx,dword ptr [eax]
 0050C0CA    xor         ecx,ecx
 0050C0CC    mov         dword ptr [eax],ecx
 0050C0CE    mov         eax,edx
 0050C0D0    call        TObject.Free
 0050C0D5    mov         edx,ebx
 0050C0D7    and         dl,0FC
 0050C0DA    mov         eax,esi
 0050C0DC    call        TMemoryStream.Destroy
 0050C0E1    test        bl,bl
>0050C0E3    jle         0050C0EC
 0050C0E5    mov         eax,esi
 0050C0E7    call        @ClassDestroy
 0050C0EC    pop         esi
 0050C0ED    pop         ebx
 0050C0EE    ret
*}
end;

//0050C0F0
procedure TItemProp.AssignTo(Dest:TPersistent);
begin
{*
 0050C0F0    push        ebx
 0050C0F1    push        esi
 0050C0F2    mov         esi,edx
 0050C0F4    mov         ebx,eax
 0050C0F6    mov         eax,esi
 0050C0F8    mov         edx,dword ptr ds:[509C6C];TItemProp
 0050C0FE    call        @IsClass
 0050C103    test        al,al
>0050C105    je          0050C162
 0050C107    mov         eax,esi
 0050C109    mov         edx,dword ptr ds:[509C6C];TItemProp
 0050C10F    call        @AsClass
 0050C114    mov         esi,eax
 0050C116    mov         edx,dword ptr [ebx+8]
 0050C119    mov         eax,esi
 0050C11B    call        TItemProp.SetEditMask
 0050C120    movzx       edx,byte ptr [ebx+0C]
 0050C124    mov         eax,esi
 0050C126    call        TItemProp.SetEditStyle
 0050C12B    mov         eax,ebx
 0050C12D    call        TItemProp.GetPickList
 0050C132    push        eax
 0050C133    mov         eax,esi
 0050C135    call        TItemProp.GetPickList
 0050C13A    pop         edx
 0050C13B    mov         ecx,dword ptr [eax]
 0050C13D    call        dword ptr [ecx+8]
 0050C140    mov         edx,dword ptr [ebx+14]
 0050C143    mov         eax,esi
 0050C145    call        TItemProp.SetMaxLength
 0050C14A    movzx       edx,byte ptr [ebx+18]
 0050C14E    mov         eax,esi
 0050C150    call        TItemProp.SetReadOnly
 0050C155    mov         edx,dword ptr [ebx+1C]
 0050C158    mov         eax,esi
 0050C15A    call        TItemProp.SetKeyDesc
 0050C15F    pop         esi
 0050C160    pop         ebx
 0050C161    ret
 0050C162    mov         edx,esi
 0050C164    mov         eax,ebx
 0050C166    call        TPersistent.AssignTo
 0050C16B    pop         esi
 0050C16C    pop         ebx
 0050C16D    ret
*}
end;

//0050C170
procedure TItemProp.SetEditMask(const Value:UnicodeString);
begin
{*
 0050C170    push        ebx
 0050C171    push        esi
 0050C172    mov         esi,edx
 0050C174    mov         ebx,eax
 0050C176    lea         eax,[ebx+8]
 0050C179    mov         edx,esi
 0050C17B    call        @UStrAsg
 0050C180    mov         eax,ebx
 0050C182    call        TItemProp.UpdateEdit
 0050C187    pop         esi
 0050C188    pop         ebx
 0050C189    ret
*}
end;

//0050C18C
procedure TItemProp.SetEditStyle(const Value:TEditStyle);
begin
{*
 0050C18C    mov         byte ptr [eax+0C],dl
 0050C18F    call        TItemProp.UpdateEdit
 0050C194    ret
*}
end;

//0050C198
procedure TItemProp.SetKeyDesc(const Value:UnicodeString);
begin
{*
 0050C198    push        ebx
 0050C199    push        esi
 0050C19A    mov         esi,edx
 0050C19C    mov         ebx,eax
 0050C19E    lea         eax,[ebx+1C]
 0050C1A1    mov         edx,esi
 0050C1A3    call        @UStrAsg
 0050C1A8    pop         esi
 0050C1A9    pop         ebx
 0050C1AA    ret
*}
end;

//0050C1AC
procedure TItemProp.SetMaxLength(const Value:Integer);
begin
{*
 0050C1AC    mov         dword ptr [eax+14],edx
 0050C1AF    call        TItemProp.UpdateEdit
 0050C1B4    ret
*}
end;

//0050C1B8
function TItemProp.HasPickList:Boolean;
begin
{*
 0050C1B8    push        ebx
 0050C1B9    push        esi
 0050C1BA    mov         ebx,eax
 0050C1BC    mov         esi,dword ptr [ebx+10]
 0050C1BF    test        esi,esi
>0050C1C1    je          0050C1CE
 0050C1C3    mov         eax,esi
 0050C1C5    mov         edx,dword ptr [eax]
 0050C1C7    call        dword ptr [edx+14]
 0050C1CA    test        eax,eax
>0050C1CC    jg          0050C1D3
 0050C1CE    xor         eax,eax
 0050C1D0    pop         esi
 0050C1D1    pop         ebx
 0050C1D2    ret
 0050C1D3    mov         al,1
 0050C1D5    pop         esi
 0050C1D6    pop         ebx
 0050C1D7    ret
*}
end;

//0050C1D8
function TItemProp.GetPickList:TStrings;
begin
{*
 0050C1D8    push        ebx
 0050C1D9    push        esi
 0050C1DA    mov         ebx,eax
 0050C1DC    cmp         dword ptr [ebx+10],0
>0050C1E0    jne         0050C1FD
 0050C1E2    mov         dl,1
 0050C1E4    mov         eax,[0043C7BC];TStringList
 0050C1E9    call        TStringList.Create
 0050C1EE    mov         esi,eax
 0050C1F0    mov         dword ptr [ebx+10],esi
 0050C1F3    mov         dword ptr [esi+44],ebx
 0050C1F6    mov         dword ptr [esi+40],50C254;TItemProp.PickListChange
 0050C1FD    mov         eax,dword ptr [ebx+10]
 0050C200    pop         esi
 0050C201    pop         ebx
 0050C202    ret
*}
end;

//0050C204
procedure TItemProp.SetPickList(const Value:TStrings);
begin
{*
 0050C204    push        esi
 0050C205    push        edi
 0050C206    mov         edi,edx
 0050C208    mov         esi,eax
 0050C20A    mov         eax,esi
 0050C20C    call        TItemProp.GetPickList
 0050C211    mov         edx,edi
 0050C213    mov         ecx,dword ptr [eax]
 0050C215    call        dword ptr [ecx+8]
 0050C218    mov         eax,esi
 0050C21A    call        TItemProp.UpdateEdit
 0050C21F    pop         edi
 0050C220    pop         esi
 0050C221    ret
*}
end;

//0050C224
procedure TItemProp.SetReadOnly(const Value:Boolean);
begin
{*
 0050C224    mov         byte ptr [eax+18],dl
 0050C227    call        TItemProp.UpdateEdit
 0050C22C    ret
*}
end;

//0050C230
procedure TItemProp.UpdateEdit;
begin
{*
 0050C230    mov         edx,dword ptr [eax+4]
 0050C233    test        edx,edx
>0050C235    je          0050C253
 0050C237    cmp         byte ptr [edx+2FD],0
>0050C23E    je          0050C253
 0050C240    mov         ecx,dword ptr [edx+37C]
 0050C246    cmp         dword ptr [ecx+20],0
>0050C24A    jne         0050C253
 0050C24C    mov         eax,edx
 0050C24E    call        TCustomGrid.InvalidateEditor
 0050C253    ret
*}
end;

//0050C254
procedure TItemProp.PickListChange(Sender:TObject);
begin
{*
 0050C254    push        ebx
 0050C255    mov         ebx,eax
 0050C257    cmp         byte ptr [ebx+0C],0
>0050C25B    jne         0050C278
 0050C25D    mov         eax,ebx
 0050C25F    call        TItemProp.GetPickList
 0050C264    mov         edx,dword ptr [eax]
 0050C266    call        dword ptr [edx+14]
 0050C269    test        eax,eax
>0050C26B    jle         0050C278
 0050C26D    mov         dl,2
 0050C26F    mov         eax,ebx
 0050C271    call        TItemProp.SetEditStyle
 0050C276    pop         ebx
 0050C277    ret
 0050C278    cmp         byte ptr [ebx+0C],2
>0050C27C    jne         0050C297
 0050C27E    mov         eax,ebx
 0050C280    call        TItemProp.GetPickList
 0050C285    mov         edx,dword ptr [eax]
 0050C287    call        dword ptr [edx+14]
 0050C28A    test        eax,eax
>0050C28C    jne         0050C297
 0050C28E    xor         edx,edx
 0050C290    mov         eax,ebx
 0050C292    call        TItemProp.SetEditStyle
 0050C297    pop         ebx
 0050C298    ret
*}
end;

//0050C29C
procedure TValueListTitles.Changed;
begin
{*
 0050C29C    push        ebx
 0050C29D    mov         ebx,eax
 0050C29F    mov         eax,ebx
 0050C2A1    call        TStringList.Changed
 0050C2A6    mov         eax,dword ptr [ebx+58]
 0050C2A9    test        eax,eax
>0050C2AB    je          0050C2B2
 0050C2AD    call        TValueListEditor.Refresh
 0050C2B2    pop         ebx
 0050C2B3    ret
*}
end;

//0050C2B4
constructor TValueListTitles.Create;
begin
{*
 0050C2B4    push        ebx
 0050C2B5    push        esi
 0050C2B6    test        dl,dl
>0050C2B8    je          0050C2C2
 0050C2BA    add         esp,0FFFFFFF0
 0050C2BD    call        @ClassCreate
 0050C2C2    mov         ebx,edx
 0050C2C4    mov         esi,eax
 0050C2C6    mov         dword ptr [esi+58],ecx
 0050C2C9    xor         edx,edx
 0050C2CB    mov         eax,esi
 0050C2CD    call        TStringList.Create
 0050C2D2    mov         eax,esi
 0050C2D4    test        bl,bl
>0050C2D6    je          0050C2E7
 0050C2D8    call        @AfterConstruction
 0050C2DD    pop         dword ptr fs:[0]
 0050C2E4    add         esp,0C
 0050C2E7    mov         eax,esi
 0050C2E9    pop         esi
 0050C2EA    pop         ebx
 0050C2EB    ret
*}
end;

//0050CC5C
procedure TCustomApplicationEvents.Activate;
begin
{*
 0050CC5C    cmp         dword ptr ds:[78690C],0
>0050CC63    je          0050CC71
 0050CC65    mov         edx,eax
 0050CC67    mov         eax,[0078690C]
 0050CC6C    call        TMultiCaster.Activate
 0050CC71    ret
*}
end;

//0050CC74
procedure TCustomApplicationEvents.CancelDispatch;
begin
{*
 0050CC74    cmp         dword ptr ds:[78690C],0
>0050CC7B    je          0050CC87
 0050CC7D    mov         eax,[0078690C]
 0050CC82    call        TMultiCaster.CancelDispatch
 0050CC87    ret
*}
end;

//0050CC88
constructor TCustomApplicationEvents.Create;
begin
{*
 0050CC88    push        ebx
 0050CC89    push        esi
 0050CC8A    test        dl,dl
>0050CC8C    je          0050CC96
 0050CC8E    add         esp,0FFFFFFF0
 0050CC91    call        @ClassCreate
 0050CC96    mov         ebx,edx
 0050CC98    mov         esi,eax
 0050CC9A    xor         edx,edx
 0050CC9C    mov         eax,esi
 0050CC9E    call        TComponent.Create
 0050CCA3    cmp         dword ptr ds:[78690C],0
>0050CCAA    je          0050CCB8
 0050CCAC    mov         edx,esi
 0050CCAE    mov         eax,[0078690C]
 0050CCB3    call        TMultiCaster.AddAppEvent
 0050CCB8    mov         eax,esi
 0050CCBA    test        bl,bl
>0050CCBC    je          0050CCCD
 0050CCBE    call        @AfterConstruction
 0050CCC3    pop         dword ptr fs:[0]
 0050CCCA    add         esp,0C
 0050CCCD    mov         eax,esi
 0050CCCF    pop         esi
 0050CCD0    pop         ebx
 0050CCD1    ret
*}
end;

//0050CCD4
procedure TCustomApplicationEvents.DoActionExecute(Action:TBasicAction; var Handled:Boolean);
begin
{*
 0050CCD4    push        ebx
 0050CCD5    cmp         word ptr [eax+3A],0
>0050CCDA    je          0050CCE4
 0050CCDC    mov         ebx,eax
 0050CCDE    mov         eax,dword ptr [ebx+3C]
 0050CCE1    call        dword ptr [ebx+38]
 0050CCE4    pop         ebx
 0050CCE5    ret
*}
end;

//0050CCE8
procedure TCustomApplicationEvents.DoActionUpdate(Action:TBasicAction; var Handled:Boolean);
begin
{*
 0050CCE8    push        ebx
 0050CCE9    cmp         word ptr [eax+42],0
>0050CCEE    je          0050CCF8
 0050CCF0    mov         ebx,eax
 0050CCF2    mov         eax,dword ptr [ebx+44]
 0050CCF5    call        dword ptr [ebx+40]
 0050CCF8    pop         ebx
 0050CCF9    ret
*}
end;

//0050CCFC
procedure TCustomApplicationEvents.DoActivate(Sender:TObject);
begin
{*
 0050CCFC    push        ebx
 0050CCFD    cmp         word ptr [eax+7A],0
>0050CD02    je          0050CD0C
 0050CD04    mov         ebx,eax
 0050CD06    mov         eax,dword ptr [ebx+7C]
 0050CD09    call        dword ptr [ebx+78]
 0050CD0C    pop         ebx
 0050CD0D    ret
*}
end;

//0050CD10
procedure TCustomApplicationEvents.DoDeactivate(Sender:TObject);
begin
{*
 0050CD10    push        ebx
 0050CD11    cmp         word ptr [eax+72],0
>0050CD16    je          0050CD20
 0050CD18    mov         ebx,eax
 0050CD1A    mov         eax,dword ptr [ebx+74]
 0050CD1D    call        dword ptr [ebx+70]
 0050CD20    pop         ebx
 0050CD21    ret
*}
end;

//0050CD24
procedure TCustomApplicationEvents.DoException(Sender:TObject; E:Exception);
begin
{*
 0050CD24    push        ebx
 0050CD25    push        esi
 0050CD26    push        edi
 0050CD27    mov         esi,ecx
 0050CD29    mov         edi,edx
 0050CD2B    mov         ebx,eax
 0050CD2D    mov         eax,esi
 0050CD2F    mov         edx,dword ptr ds:[4195F4];EAbort
 0050CD35    call        @IsClass
 0050CD3A    test        al,al
>0050CD3C    jne         0050CD4F
 0050CD3E    cmp         word ptr [ebx+4A],0
>0050CD43    je          0050CD4F
 0050CD45    mov         ecx,esi
 0050CD47    mov         edx,edi
 0050CD49    mov         eax,dword ptr [ebx+4C]
 0050CD4C    call        dword ptr [ebx+48]
 0050CD4F    pop         edi
 0050CD50    pop         esi
 0050CD51    pop         ebx
 0050CD52    ret
*}
end;

//0050CD54
function TCustomApplicationEvents.DoHelp(Command:Word; Data:TCustomLongData; var CallHelp:Boolean):Boolean;
begin
{*
 0050CD54    push        ebp
 0050CD55    mov         ebp,esp
 0050CD57    push        ebx
 0050CD58    cmp         word ptr [eax+5A],0
>0050CD5D    je          0050CD6D
 0050CD5F    mov         ebx,dword ptr [ebp+8]
 0050CD62    push        ebx
 0050CD63    mov         ebx,eax
 0050CD65    mov         eax,dword ptr [ebx+5C]
 0050CD68    call        dword ptr [ebx+58]
>0050CD6B    jmp         0050CD6F
 0050CD6D    xor         eax,eax
 0050CD6F    pop         ebx
 0050CD70    pop         ebp
 0050CD71    ret         4
*}
end;

//0050CD74
procedure TCustomApplicationEvents.DoHint(Sender:TObject);
begin
{*
 0050CD74    push        ebp
 0050CD75    mov         ebp,esp
 0050CD77    push        ecx
 0050CD78    push        ebx
 0050CD79    push        esi
 0050CD7A    cmp         word ptr [eax+62],0
>0050CD7F    je          0050CD8B
 0050CD81    mov         ebx,eax
 0050CD83    mov         eax,dword ptr [ebx+64]
 0050CD86    call        dword ptr [ebx+60]
>0050CD89    jmp         0050CDE5
 0050CD8B    mov         ecx,eax
 0050CD8D    mov         dl,1
 0050CD8F    mov         eax,[004DE148];THintAction
 0050CD94    call        THintAction.Create
 0050CD99    mov         dword ptr [ebp-4],eax
 0050CD9C    xor         eax,eax
 0050CD9E    push        ebp
 0050CD9F    push        50CDDE
 0050CDA4    push        dword ptr fs:[eax]
 0050CDA7    mov         dword ptr fs:[eax],esp
 0050CDAA    mov         eax,[0078D590];^Application:TApplication
 0050CDAF    mov         eax,dword ptr [eax]
 0050CDB1    mov         edx,dword ptr [eax+54]
 0050CDB4    mov         eax,dword ptr [ebp-4]
 0050CDB7    call        TCustomAction.SetHint
 0050CDBC    mov         eax,dword ptr [ebp-4]
 0050CDBF    mov         si,0FFF0
 0050CDC3    call        @CallDynaInst
 0050CDC8    xor         eax,eax
 0050CDCA    pop         edx
 0050CDCB    pop         ecx
 0050CDCC    pop         ecx
 0050CDCD    mov         dword ptr fs:[eax],edx
 0050CDD0    push        50CDE5
 0050CDD5    mov         eax,dword ptr [ebp-4]
 0050CDD8    call        TObject.Free
 0050CDDD    ret
>0050CDDE    jmp         @HandleFinally
>0050CDE3    jmp         0050CDD5
 0050CDE5    pop         esi
 0050CDE6    pop         ebx
 0050CDE7    pop         ecx
 0050CDE8    pop         ebp
 0050CDE9    ret
*}
end;

//0050CDEC
procedure TCustomApplicationEvents.DoIdle(Sender:TObject; var Done:Boolean);
begin
{*
 0050CDEC    push        ebx
 0050CDED    cmp         word ptr [eax+6A],0
>0050CDF2    je          0050CDFC
 0050CDF4    mov         ebx,eax
 0050CDF6    mov         eax,dword ptr [ebx+6C]
 0050CDF9    call        dword ptr [ebx+68]
 0050CDFC    pop         ebx
 0050CDFD    ret
*}
end;

//0050CE00
procedure TCustomApplicationEvents.DoMessage(var Msg:TMsg; var Handled:Boolean);
begin
{*
 0050CE00    push        ebx
 0050CE01    cmp         word ptr [eax+52],0
>0050CE06    je          0050CE10
 0050CE08    mov         ebx,eax
 0050CE0A    mov         eax,dword ptr [ebx+54]
 0050CE0D    call        dword ptr [ebx+50]
 0050CE10    pop         ebx
 0050CE11    ret
*}
end;

//0050CE14
procedure TCustomApplicationEvents.DoMinimize(Sender:TObject);
begin
{*
 0050CE14    push        ebx
 0050CE15    cmp         word ptr [eax+82],0
>0050CE1D    je          0050CE2D
 0050CE1F    mov         ebx,eax
 0050CE21    mov         eax,dword ptr [ebx+84]
 0050CE27    call        dword ptr [ebx+80]
 0050CE2D    pop         ebx
 0050CE2E    ret
*}
end;

//0050CE30
procedure TCustomApplicationEvents.DoRestore(Sender:TObject);
begin
{*
 0050CE30    push        ebx
 0050CE31    cmp         word ptr [eax+8A],0
>0050CE39    je          0050CE49
 0050CE3B    mov         ebx,eax
 0050CE3D    mov         eax,dword ptr [ebx+8C]
 0050CE43    call        dword ptr [ebx+88]
 0050CE49    pop         ebx
 0050CE4A    ret
*}
end;

//0050CE4C
procedure TCustomApplicationEvents.DoShortcut(var Msg:TWMKey; var Handled:Boolean);
begin
{*
 0050CE4C    push        ebx
 0050CE4D    cmp         word ptr [eax+92],0
>0050CE55    je          0050CE65
 0050CE57    mov         ebx,eax
 0050CE59    mov         eax,dword ptr [ebx+94]
 0050CE5F    call        dword ptr [ebx+90]
 0050CE65    pop         ebx
 0050CE66    ret
*}
end;

//0050CE68
procedure TCustomApplicationEvents.DoShowHint(var HintStr:UnicodeString; var CanShow:Boolean; var HintInfo:THintInfo);
begin
{*
 0050CE68    push        ebp
 0050CE69    mov         ebp,esp
 0050CE6B    push        ebx
 0050CE6C    cmp         word ptr [eax+9A],0
>0050CE74    je          0050CE88
 0050CE76    mov         ebx,dword ptr [ebp+8]
 0050CE79    push        ebx
 0050CE7A    mov         ebx,eax
 0050CE7C    mov         eax,dword ptr [ebx+9C]
 0050CE82    call        dword ptr [ebx+98]
 0050CE88    pop         ebx
 0050CE89    pop         ebp
 0050CE8A    ret         4
*}
end;

//0050CE90
procedure TCustomApplicationEvents.DoSettingChange(Sender:TObject; Flag:Integer; const Section:UnicodeString; var Result:LongInt);
begin
{*
 0050CE90    push        ebp
 0050CE91    mov         ebp,esp
 0050CE93    push        ebx
 0050CE94    cmp         word ptr [eax+0A2],0
>0050CE9C    je          0050CEB4
 0050CE9E    mov         ebx,dword ptr [ebp+0C]
 0050CEA1    push        ebx
 0050CEA2    mov         ebx,dword ptr [ebp+8]
 0050CEA5    push        ebx
 0050CEA6    mov         ebx,eax
 0050CEA8    mov         eax,dword ptr [ebx+0A4]
 0050CEAE    call        dword ptr [ebx+0A0]
 0050CEB4    pop         ebx
 0050CEB5    pop         ebp
 0050CEB6    ret         8
*}
end;

//0050CEBC
procedure TCustomApplicationEvents.DoModalBegin(Sender:TObject);
begin
{*
 0050CEBC    push        ebx
 0050CEBD    cmp         word ptr [eax+0AA],0
>0050CEC5    je          0050CED5
 0050CEC7    mov         ebx,eax
 0050CEC9    mov         eax,dword ptr [ebx+0AC]
 0050CECF    call        dword ptr [ebx+0A8]
 0050CED5    pop         ebx
 0050CED6    ret
*}
end;

//0050CED8
procedure TCustomApplicationEvents.DoModalEnd(Sender:TObject);
begin
{*
 0050CED8    push        ebx
 0050CED9    cmp         word ptr [eax+0B2],0
>0050CEE1    je          0050CEF1
 0050CEE3    mov         ebx,eax
 0050CEE5    mov         eax,dword ptr [ebx+0B4]
 0050CEEB    call        dword ptr [ebx+0B0]
 0050CEF1    pop         ebx
 0050CEF2    ret
*}
end;

//0050CEF4
procedure TMultiCaster.Activate(AppEvent:TCustomApplicationEvents);
begin
{*
 0050CEF4    push        ebx
 0050CEF5    push        esi
 0050CEF6    push        edi
 0050CEF7    push        ebp
 0050CEF8    mov         esi,edx
 0050CEFA    mov         ebx,eax
 0050CEFC    mov         edx,esi
 0050CEFE    mov         eax,ebx
 0050CF00    call        TMultiCaster.CheckDispatching
 0050CF05    test        al,al
>0050CF07    je          0050CF35
 0050CF09    mov         edi,esi
 0050CF0B    mov         edx,edi
 0050CF0D    mov         eax,dword ptr [ebx+34]
 0050CF10    call        TList.IndexOf
 0050CF15    mov         ebp,dword ptr [ebx+34]
 0050CF18    mov         edx,dword ptr [ebp+8]
 0050CF1B    dec         edx
 0050CF1C    cmp         eax,edx
>0050CF1E    jge         0050CF35
 0050CF20    mov         edx,edi
 0050CF22    mov         eax,ebp
 0050CF24    xor         ecx,ecx
 0050CF26    call        TList.RemoveItem
 0050CF2B    mov         edx,edi
 0050CF2D    mov         eax,dword ptr [ebx+34]
 0050CF30    call        TList.Add
 0050CF35    pop         ebp
 0050CF36    pop         edi
 0050CF37    pop         esi
 0050CF38    pop         ebx
 0050CF39    ret
*}
end;

//0050CF3C
procedure TMultiCaster.AddAppEvent(AppEvent:TCustomApplicationEvents);
begin
{*
 0050CF3C    push        ebx
 0050CF3D    push        esi
 0050CF3E    push        edi
 0050CF3F    mov         esi,edx
 0050CF41    mov         ebx,eax
 0050CF43    mov         edi,esi
 0050CF45    mov         edx,edi
 0050CF47    mov         eax,dword ptr [ebx+34]
 0050CF4A    call        TList.IndexOf
 0050CF4F    inc         eax
>0050CF50    jne         0050CF5C
 0050CF52    mov         edx,edi
 0050CF54    mov         eax,dword ptr [ebx+34]
 0050CF57    call        TList.Add
 0050CF5C    pop         edi
 0050CF5D    pop         esi
 0050CF5E    pop         ebx
 0050CF5F    ret
*}
end;

//0050CF60
procedure TMultiCaster.BeginDispatch;
begin
{*
 0050CF60    inc         dword ptr [eax+40]
 0050CF63    ret
*}
end;

//0050CF64
procedure TMultiCaster.CancelDispatch;
begin
{*
 0050CF64    mov         byte ptr [eax+3C],1
 0050CF68    ret
*}
end;

//0050CF6C
function TMultiCaster.CheckDispatching(AppEvents:TCustomApplicationEvents):Boolean;
begin
{*
 0050CF6C    cmp         dword ptr [eax+40],0
 0050CF70    sete        cl
 0050CF73    test        cl,cl
>0050CF75    jne         0050CF7A
 0050CF77    mov         dword ptr [eax+38],edx
 0050CF7A    mov         eax,ecx
 0050CF7C    ret
*}
end;

//0050CF80
constructor TMultiCaster.Create;
begin
{*
 0050CF80    push        ebp
 0050CF81    mov         ebp,esp
 0050CF83    push        ecx
 0050CF84    push        ebx
 0050CF85    push        esi
 0050CF86    test        dl,dl
>0050CF88    je          0050CF92
 0050CF8A    add         esp,0FFFFFFF0
 0050CF8D    call        @ClassCreate
 0050CF92    mov         byte ptr [ebp-1],dl
 0050CF95    mov         ebx,eax
 0050CF97    mov         esi,dword ptr ds:[78D590];^Application:TApplication
 0050CF9D    xor         edx,edx
 0050CF9F    mov         eax,ebx
 0050CFA1    call        TComponent.Create
 0050CFA6    xor         ecx,ecx
 0050CFA8    mov         dl,1
 0050CFAA    mov         eax,[00471A9C];TComponentList
 0050CFAF    call        TObjectList.Create
 0050CFB4    mov         dword ptr [ebx+34],eax
 0050CFB7    mov         eax,dword ptr [esi]
 0050CFB9    mov         dword ptr [eax+0E4],ebx
 0050CFBF    mov         dword ptr [eax+0E0],50D234;TMultiCaster.DoActionExecute
 0050CFC9    mov         eax,dword ptr [esi]
 0050CFCB    mov         dword ptr [eax+0EC],ebx
 0050CFD1    mov         dword ptr [eax+0E8],50D2B0;TMultiCaster.DoActionUpdate
 0050CFDB    mov         eax,dword ptr [esi]
 0050CFDD    mov         dword ptr [eax+144],ebx
 0050CFE3    mov         dword ptr [eax+140],50D32C;TMultiCaster.DoActivate
 0050CFED    mov         eax,dword ptr [esi]
 0050CFEF    mov         dword ptr [eax+13C],ebx
 0050CFF5    mov         dword ptr [eax+138],50D3A0;TMultiCaster.DoDeactivate
 0050CFFF    mov         eax,dword ptr [esi]
 0050D001    mov         dword ptr [eax+0F4],ebx
 0050D007    mov         dword ptr [eax+0F0],50D414;TMultiCaster.DoException
 0050D011    mov         eax,dword ptr [esi]
 0050D013    mov         dword ptr [eax+124],ebx
 0050D019    mov         dword ptr [eax+120],50D4D0;TMultiCaster.DoHelp:Boolean
 0050D023    mov         eax,dword ptr [esi]
 0050D025    mov         dword ptr [eax+12C],ebx
 0050D02B    mov         dword ptr [eax+128],50D570;TMultiCaster.DoHint
 0050D035    mov         eax,dword ptr [esi]
 0050D037    mov         dword ptr [eax+134],ebx
 0050D03D    mov         dword ptr [eax+130],50D5E4;TMultiCaster.DoIdle
 0050D047    mov         eax,dword ptr [esi]
 0050D049    mov         dword ptr [eax+10C],ebx
 0050D04F    mov         dword ptr [eax+108],50D660;TMultiCaster.DoMessage
 0050D059    mov         eax,dword ptr [esi]
 0050D05B    mov         dword ptr [eax+14C],ebx
 0050D061    mov         dword ptr [eax+148],50D6DC;TMultiCaster.DoMinimize
 0050D06B    mov         eax,dword ptr [esi]
 0050D06D    mov         dword ptr [eax+154],ebx
 0050D073    mov         dword ptr [eax+150],50D750;TMultiCaster.DoRestore
 0050D07D    mov         eax,dword ptr [esi]
 0050D07F    mov         dword ptr [eax+164],ebx
 0050D085    mov         dword ptr [eax+160],50D840;TMultiCaster.DoShowHint
 0050D08F    mov         eax,dword ptr [esi]
 0050D091    mov         dword ptr [eax+15C],ebx
 0050D097    mov         dword ptr [eax+158],50D7C4;TMultiCaster.DoShortcut
 0050D0A1    mov         eax,dword ptr [esi]
 0050D0A3    mov         dword ptr [eax+16C],ebx
 0050D0A9    mov         dword ptr [eax+168],50D8C0;TMultiCaster.DoSettingChange
 0050D0B3    mov         eax,dword ptr [esi]
 0050D0B5    mov         dword ptr [eax+114],ebx
 0050D0BB    mov         dword ptr [eax+110],50D9B4;TMultiCaster.DoModalBegin
 0050D0C5    mov         eax,dword ptr [esi]
 0050D0C7    mov         dword ptr [eax+11C],ebx
 0050D0CD    mov         dword ptr [eax+118],50DA28;TMultiCaster.DoModalEnd
 0050D0D7    mov         eax,ebx
 0050D0D9    cmp         byte ptr [ebp-1],0
>0050D0DD    je          0050D0EE
 0050D0DF    call        @AfterConstruction
 0050D0E4    pop         dword ptr fs:[0]
 0050D0EB    add         esp,0C
 0050D0EE    mov         eax,ebx
 0050D0F0    pop         esi
 0050D0F1    pop         ebx
 0050D0F2    pop         ecx
 0050D0F3    pop         ebp
 0050D0F4    ret
*}
end;

//0050D0F8
destructor TMultiCaster.Destroy();
begin
{*
 0050D0F8    push        ebx
 0050D0F9    push        esi
 0050D0FA    call        @BeforeDestruction
 0050D0FF    mov         ebx,edx
 0050D101    mov         esi,eax
 0050D103    mov         eax,[0078D590];^Application:TApplication
 0050D108    xor         edx,edx
 0050D10A    mov         dword ptr ds:[78690C],edx
 0050D110    mov         edx,dword ptr [eax]
 0050D112    xor         ecx,ecx
 0050D114    mov         dword ptr [edx+0E0],ecx
 0050D11A    mov         dword ptr [edx+0E4],ecx
 0050D120    mov         edx,dword ptr [eax]
 0050D122    xor         ecx,ecx
 0050D124    mov         dword ptr [edx+0E8],ecx
 0050D12A    mov         dword ptr [edx+0EC],ecx
 0050D130    mov         edx,dword ptr [eax]
 0050D132    xor         ecx,ecx
 0050D134    mov         dword ptr [edx+140],ecx
 0050D13A    mov         dword ptr [edx+144],ecx
 0050D140    mov         edx,dword ptr [eax]
 0050D142    xor         ecx,ecx
 0050D144    mov         dword ptr [edx+138],ecx
 0050D14A    mov         dword ptr [edx+13C],ecx
 0050D150    mov         edx,dword ptr [eax]
 0050D152    xor         ecx,ecx
 0050D154    mov         dword ptr [edx+0F0],ecx
 0050D15A    mov         dword ptr [edx+0F4],ecx
 0050D160    mov         edx,dword ptr [eax]
 0050D162    xor         ecx,ecx
 0050D164    mov         dword ptr [edx+120],ecx
 0050D16A    mov         dword ptr [edx+124],ecx
 0050D170    mov         edx,dword ptr [eax]
 0050D172    xor         ecx,ecx
 0050D174    mov         dword ptr [edx+128],ecx
 0050D17A    mov         dword ptr [edx+12C],ecx
 0050D180    mov         edx,dword ptr [eax]
 0050D182    xor         ecx,ecx
 0050D184    mov         dword ptr [edx+130],ecx
 0050D18A    mov         dword ptr [edx+134],ecx
 0050D190    mov         edx,dword ptr [eax]
 0050D192    xor         ecx,ecx
 0050D194    mov         dword ptr [edx+108],ecx
 0050D19A    mov         dword ptr [edx+10C],ecx
 0050D1A0    mov         edx,dword ptr [eax]
 0050D1A2    xor         ecx,ecx
 0050D1A4    mov         dword ptr [edx+148],ecx
 0050D1AA    mov         dword ptr [edx+14C],ecx
 0050D1B0    mov         edx,dword ptr [eax]
 0050D1B2    xor         ecx,ecx
 0050D1B4    mov         dword ptr [edx+150],ecx
 0050D1BA    mov         dword ptr [edx+154],ecx
 0050D1C0    mov         edx,dword ptr [eax]
 0050D1C2    xor         ecx,ecx
 0050D1C4    mov         dword ptr [edx+160],ecx
 0050D1CA    mov         dword ptr [edx+164],ecx
 0050D1D0    mov         edx,dword ptr [eax]
 0050D1D2    xor         ecx,ecx
 0050D1D4    mov         dword ptr [edx+158],ecx
 0050D1DA    mov         dword ptr [edx+15C],ecx
 0050D1E0    mov         edx,dword ptr [eax]
 0050D1E2    xor         ecx,ecx
 0050D1E4    mov         dword ptr [edx+168],ecx
 0050D1EA    mov         dword ptr [edx+16C],ecx
 0050D1F0    mov         edx,dword ptr [eax]
 0050D1F2    xor         ecx,ecx
 0050D1F4    mov         dword ptr [edx+110],ecx
 0050D1FA    mov         dword ptr [edx+114],ecx
 0050D200    mov         eax,dword ptr [eax]
 0050D202    xor         edx,edx
 0050D204    mov         dword ptr [eax+118],edx
 0050D20A    mov         dword ptr [eax+11C],edx
 0050D210    mov         eax,dword ptr [esi+34]
 0050D213    call        TObject.Free
 0050D218    mov         edx,ebx
 0050D21A    and         dl,0FC
 0050D21D    mov         eax,esi
 0050D21F    call        TComponent.Destroy
 0050D224    test        bl,bl
>0050D226    jle         0050D22F
 0050D228    mov         eax,esi
 0050D22A    call        @ClassDestroy
 0050D22F    pop         esi
 0050D230    pop         ebx
 0050D231    ret
*}
end;

//0050D234
procedure TMultiCaster.DoActionExecute(Action:TBasicAction; var Handled:Boolean);
begin
{*
 0050D234    push        ebp
 0050D235    mov         ebp,esp
 0050D237    push        ecx
 0050D238    push        ebx
 0050D239    push        esi
 0050D23A    push        edi
 0050D23B    mov         edi,ecx
 0050D23D    mov         esi,edx
 0050D23F    mov         dword ptr [ebp-4],eax
 0050D242    mov         eax,dword ptr [ebp-4]
 0050D245    call        TMultiCaster.BeginDispatch
 0050D24A    xor         eax,eax
 0050D24C    push        ebp
 0050D24D    push        50D2A0
 0050D252    push        dword ptr fs:[eax]
 0050D255    mov         dword ptr fs:[eax],esp
 0050D258    mov         eax,dword ptr [ebp-4]
 0050D25B    call        TMultiCaster.GetCount
 0050D260    mov         ebx,eax
 0050D262    dec         ebx
 0050D263    cmp         ebx,0
>0050D266    jl          0050D28A
 0050D268    mov         edx,ebx
 0050D26A    mov         eax,dword ptr [ebp-4]
 0050D26D    call        TMultiCaster.GetAppEvents
 0050D272    mov         ecx,edi
 0050D274    mov         edx,esi
 0050D276    call        TCustomApplicationEvents.DoActionExecute
 0050D27B    mov         eax,dword ptr [ebp-4]
 0050D27E    cmp         byte ptr [eax+3C],0
>0050D282    jne         0050D28A
 0050D284    dec         ebx
 0050D285    cmp         ebx,0FFFFFFFF
>0050D288    jne         0050D268
 0050D28A    xor         eax,eax
 0050D28C    pop         edx
 0050D28D    pop         ecx
 0050D28E    pop         ecx
 0050D28F    mov         dword ptr fs:[eax],edx
 0050D292    push        50D2A7
 0050D297    mov         eax,dword ptr [ebp-4]
 0050D29A    call        TMultiCaster.EndDispatch
 0050D29F    ret
>0050D2A0    jmp         @HandleFinally
>0050D2A5    jmp         0050D297
 0050D2A7    pop         edi
 0050D2A8    pop         esi
 0050D2A9    pop         ebx
 0050D2AA    pop         ecx
 0050D2AB    pop         ebp
 0050D2AC    ret
*}
end;

//0050D2B0
procedure TMultiCaster.DoActionUpdate(Action:TBasicAction; var Handled:Boolean);
begin
{*
 0050D2B0    push        ebp
 0050D2B1    mov         ebp,esp
 0050D2B3    push        ecx
 0050D2B4    push        ebx
 0050D2B5    push        esi
 0050D2B6    push        edi
 0050D2B7    mov         edi,ecx
 0050D2B9    mov         esi,edx
 0050D2BB    mov         dword ptr [ebp-4],eax
 0050D2BE    mov         eax,dword ptr [ebp-4]
 0050D2C1    call        TMultiCaster.BeginDispatch
 0050D2C6    xor         eax,eax
 0050D2C8    push        ebp
 0050D2C9    push        50D31C
 0050D2CE    push        dword ptr fs:[eax]
 0050D2D1    mov         dword ptr fs:[eax],esp
 0050D2D4    mov         eax,dword ptr [ebp-4]
 0050D2D7    call        TMultiCaster.GetCount
 0050D2DC    mov         ebx,eax
 0050D2DE    dec         ebx
 0050D2DF    cmp         ebx,0
>0050D2E2    jl          0050D306
 0050D2E4    mov         edx,ebx
 0050D2E6    mov         eax,dword ptr [ebp-4]
 0050D2E9    call        TMultiCaster.GetAppEvents
 0050D2EE    mov         ecx,edi
 0050D2F0    mov         edx,esi
 0050D2F2    call        TCustomApplicationEvents.DoActionUpdate
 0050D2F7    mov         eax,dword ptr [ebp-4]
 0050D2FA    cmp         byte ptr [eax+3C],0
>0050D2FE    jne         0050D306
 0050D300    dec         ebx
 0050D301    cmp         ebx,0FFFFFFFF
>0050D304    jne         0050D2E4
 0050D306    xor         eax,eax
 0050D308    pop         edx
 0050D309    pop         ecx
 0050D30A    pop         ecx
 0050D30B    mov         dword ptr fs:[eax],edx
 0050D30E    push        50D323
 0050D313    mov         eax,dword ptr [ebp-4]
 0050D316    call        TMultiCaster.EndDispatch
 0050D31B    ret
>0050D31C    jmp         @HandleFinally
>0050D321    jmp         0050D313
 0050D323    pop         edi
 0050D324    pop         esi
 0050D325    pop         ebx
 0050D326    pop         ecx
 0050D327    pop         ebp
 0050D328    ret
*}
end;

//0050D32C
procedure TMultiCaster.DoActivate(Sender:TObject);
begin
{*
 0050D32C    push        ebp
 0050D32D    mov         ebp,esp
 0050D32F    push        ecx
 0050D330    push        ebx
 0050D331    push        esi
 0050D332    mov         esi,edx
 0050D334    mov         dword ptr [ebp-4],eax
 0050D337    mov         eax,dword ptr [ebp-4]
 0050D33A    call        TMultiCaster.BeginDispatch
 0050D33F    xor         eax,eax
 0050D341    push        ebp
 0050D342    push        50D393
 0050D347    push        dword ptr fs:[eax]
 0050D34A    mov         dword ptr fs:[eax],esp
 0050D34D    mov         eax,dword ptr [ebp-4]
 0050D350    call        TMultiCaster.GetCount
 0050D355    mov         ebx,eax
 0050D357    dec         ebx
 0050D358    cmp         ebx,0
>0050D35B    jl          0050D37D
 0050D35D    mov         edx,ebx
 0050D35F    mov         eax,dword ptr [ebp-4]
 0050D362    call        TMultiCaster.GetAppEvents
 0050D367    mov         edx,esi
 0050D369    call        TCustomApplicationEvents.DoActivate
 0050D36E    mov         eax,dword ptr [ebp-4]
 0050D371    cmp         byte ptr [eax+3C],0
>0050D375    jne         0050D37D
 0050D377    dec         ebx
 0050D378    cmp         ebx,0FFFFFFFF
>0050D37B    jne         0050D35D
 0050D37D    xor         eax,eax
 0050D37F    pop         edx
 0050D380    pop         ecx
 0050D381    pop         ecx
 0050D382    mov         dword ptr fs:[eax],edx
 0050D385    push        50D39A
 0050D38A    mov         eax,dword ptr [ebp-4]
 0050D38D    call        TMultiCaster.EndDispatch
 0050D392    ret
>0050D393    jmp         @HandleFinally
>0050D398    jmp         0050D38A
 0050D39A    pop         esi
 0050D39B    pop         ebx
 0050D39C    pop         ecx
 0050D39D    pop         ebp
 0050D39E    ret
*}
end;

//0050D3A0
procedure TMultiCaster.DoDeactivate(Sender:TObject);
begin
{*
 0050D3A0    push        ebp
 0050D3A1    mov         ebp,esp
 0050D3A3    push        ecx
 0050D3A4    push        ebx
 0050D3A5    push        esi
 0050D3A6    mov         esi,edx
 0050D3A8    mov         dword ptr [ebp-4],eax
 0050D3AB    mov         eax,dword ptr [ebp-4]
 0050D3AE    call        TMultiCaster.BeginDispatch
 0050D3B3    xor         eax,eax
 0050D3B5    push        ebp
 0050D3B6    push        50D407
 0050D3BB    push        dword ptr fs:[eax]
 0050D3BE    mov         dword ptr fs:[eax],esp
 0050D3C1    mov         eax,dword ptr [ebp-4]
 0050D3C4    call        TMultiCaster.GetCount
 0050D3C9    mov         ebx,eax
 0050D3CB    dec         ebx
 0050D3CC    cmp         ebx,0
>0050D3CF    jl          0050D3F1
 0050D3D1    mov         edx,ebx
 0050D3D3    mov         eax,dword ptr [ebp-4]
 0050D3D6    call        TMultiCaster.GetAppEvents
 0050D3DB    mov         edx,esi
 0050D3DD    call        TCustomApplicationEvents.DoDeactivate
 0050D3E2    mov         eax,dword ptr [ebp-4]
 0050D3E5    cmp         byte ptr [eax+3C],0
>0050D3E9    jne         0050D3F1
 0050D3EB    dec         ebx
 0050D3EC    cmp         ebx,0FFFFFFFF
>0050D3EF    jne         0050D3D1
 0050D3F1    xor         eax,eax
 0050D3F3    pop         edx
 0050D3F4    pop         ecx
 0050D3F5    pop         ecx
 0050D3F6    mov         dword ptr fs:[eax],edx
 0050D3F9    push        50D40E
 0050D3FE    mov         eax,dword ptr [ebp-4]
 0050D401    call        TMultiCaster.EndDispatch
 0050D406    ret
>0050D407    jmp         @HandleFinally
>0050D40C    jmp         0050D3FE
 0050D40E    pop         esi
 0050D40F    pop         ebx
 0050D410    pop         ecx
 0050D411    pop         ebp
 0050D412    ret
*}
end;

//0050D414
procedure TMultiCaster.DoException(Sender:TObject; E:Exception);
begin
{*
 0050D414    push        ebp
 0050D415    mov         ebp,esp
 0050D417    add         esp,0FFFFFFF4
 0050D41A    push        ebx
 0050D41B    push        esi
 0050D41C    mov         dword ptr [ebp-8],ecx
 0050D41F    mov         esi,edx
 0050D421    mov         dword ptr [ebp-4],eax
 0050D424    mov         eax,dword ptr [ebp-4]
 0050D427    call        TMultiCaster.BeginDispatch
 0050D42C    mov         byte ptr [ebp-9],0
 0050D430    xor         eax,eax
 0050D432    push        ebp
 0050D433    push        50D4C3
 0050D438    push        dword ptr fs:[eax]
 0050D43B    mov         dword ptr fs:[eax],esp
 0050D43E    mov         eax,dword ptr [ebp-4]
 0050D441    call        TMultiCaster.GetCount
 0050D446    mov         ebx,eax
 0050D448    dec         ebx
 0050D449    cmp         ebx,0
>0050D44C    jl          0050D486
 0050D44E    mov         edx,ebx
 0050D450    mov         eax,dword ptr [ebp-4]
 0050D453    call        TMultiCaster.GetAppEvents
 0050D458    cmp         word ptr [eax+4A],0
>0050D45D    je          0050D480
 0050D45F    mov         byte ptr [ebp-9],1
 0050D463    mov         edx,ebx
 0050D465    mov         eax,dword ptr [ebp-4]
 0050D468    call        TMultiCaster.GetAppEvents
 0050D46D    mov         ecx,dword ptr [ebp-8]
 0050D470    mov         edx,esi
 0050D472    call        TCustomApplicationEvents.DoException
 0050D477    mov         eax,dword ptr [ebp-4]
 0050D47A    cmp         byte ptr [eax+3C],0
>0050D47E    jne         0050D486
 0050D480    dec         ebx
 0050D481    cmp         ebx,0FFFFFFFF
>0050D484    jne         0050D44E
 0050D486    xor         eax,eax
 0050D488    pop         edx
 0050D489    pop         ecx
 0050D48A    pop         ecx
 0050D48B    mov         dword ptr fs:[eax],edx
 0050D48E    push        50D4CA
 0050D493    cmp         byte ptr [ebp-9],0
>0050D497    jne         0050D4BA
 0050D499    mov         eax,dword ptr [ebp-8]
 0050D49C    mov         edx,dword ptr ds:[4195F4];EAbort
 0050D4A2    call        @IsClass
 0050D4A7    test        al,al
>0050D4A9    jne         0050D4BA
 0050D4AB    mov         eax,[0078D590];^Application:TApplication
 0050D4B0    mov         eax,dword ptr [eax]
 0050D4B2    mov         edx,dword ptr [ebp-8]
 0050D4B5    call        TApplication.ShowException
 0050D4BA    mov         eax,dword ptr [ebp-4]
 0050D4BD    call        TMultiCaster.EndDispatch
 0050D4C2    ret
>0050D4C3    jmp         @HandleFinally
>0050D4C8    jmp         0050D493
 0050D4CA    pop         esi
 0050D4CB    pop         ebx
 0050D4CC    mov         esp,ebp
 0050D4CE    pop         ebp
 0050D4CF    ret
*}
end;

//0050D4D0
function TMultiCaster.DoHelp(Command:Word; Data:TCustomLongData; var CallHelp:Boolean):Boolean;
begin
{*
 0050D4D0    push        ebp
 0050D4D1    mov         ebp,esp
 0050D4D3    add         esp,0FFFFFFF8
 0050D4D6    push        ebx
 0050D4D7    push        esi
 0050D4D8    push        edi
 0050D4D9    mov         edi,ecx
 0050D4DB    mov         esi,edx
 0050D4DD    mov         dword ptr [ebp-4],eax
 0050D4E0    mov         eax,dword ptr [ebp-4]
 0050D4E3    call        TMultiCaster.BeginDispatch
 0050D4E8    xor         eax,eax
 0050D4EA    push        ebp
 0050D4EB    push        50D559
 0050D4F0    push        dword ptr fs:[eax]
 0050D4F3    mov         dword ptr fs:[eax],esp
 0050D4F6    mov         byte ptr [ebp-5],0
 0050D4FA    mov         eax,dword ptr [ebp-4]
 0050D4FD    call        TMultiCaster.GetCount
 0050D502    mov         ebx,eax
 0050D504    dec         ebx
 0050D505    cmp         ebx,0
>0050D508    jl          0050D543
 0050D50A    cmp         byte ptr [ebp-5],0
>0050D50E    jne         0050D52F
 0050D510    mov         eax,dword ptr [ebp+8]
 0050D513    push        eax
 0050D514    mov         edx,ebx
 0050D516    mov         eax,dword ptr [ebp-4]
 0050D519    call        TMultiCaster.GetAppEvents
 0050D51E    mov         ecx,edi
 0050D520    mov         edx,esi
 0050D522    call        TCustomApplicationEvents.DoHelp
 0050D527    test        al,al
>0050D529    jne         0050D52F
 0050D52B    xor         eax,eax
>0050D52D    jmp         0050D531
 0050D52F    mov         al,1
 0050D531    mov         byte ptr [ebp-5],al
 0050D534    mov         eax,dword ptr [ebp-4]
 0050D537    cmp         byte ptr [eax+3C],0
>0050D53B    jne         0050D543
 0050D53D    dec         ebx
 0050D53E    cmp         ebx,0FFFFFFFF
>0050D541    jne         0050D50A
 0050D543    xor         eax,eax
 0050D545    pop         edx
 0050D546    pop         ecx
 0050D547    pop         ecx
 0050D548    mov         dword ptr fs:[eax],edx
 0050D54B    push        50D560
 0050D550    mov         eax,dword ptr [ebp-4]
 0050D553    call        TMultiCaster.EndDispatch
 0050D558    ret
>0050D559    jmp         @HandleFinally
>0050D55E    jmp         0050D550
 0050D560    movzx       eax,byte ptr [ebp-5]
 0050D564    pop         edi
 0050D565    pop         esi
 0050D566    pop         ebx
 0050D567    pop         ecx
 0050D568    pop         ecx
 0050D569    pop         ebp
 0050D56A    ret         4
*}
end;

//0050D570
procedure TMultiCaster.DoHint(Sender:TObject);
begin
{*
 0050D570    push        ebp
 0050D571    mov         ebp,esp
 0050D573    push        ecx
 0050D574    push        ebx
 0050D575    push        esi
 0050D576    mov         esi,edx
 0050D578    mov         dword ptr [ebp-4],eax
 0050D57B    mov         eax,dword ptr [ebp-4]
 0050D57E    call        TMultiCaster.BeginDispatch
 0050D583    xor         eax,eax
 0050D585    push        ebp
 0050D586    push        50D5D7
 0050D58B    push        dword ptr fs:[eax]
 0050D58E    mov         dword ptr fs:[eax],esp
 0050D591    mov         eax,dword ptr [ebp-4]
 0050D594    call        TMultiCaster.GetCount
 0050D599    mov         ebx,eax
 0050D59B    dec         ebx
 0050D59C    cmp         ebx,0
>0050D59F    jl          0050D5C1
 0050D5A1    mov         edx,ebx
 0050D5A3    mov         eax,dword ptr [ebp-4]
 0050D5A6    call        TMultiCaster.GetAppEvents
 0050D5AB    mov         edx,esi
 0050D5AD    call        TCustomApplicationEvents.DoHint
 0050D5B2    mov         eax,dword ptr [ebp-4]
 0050D5B5    cmp         byte ptr [eax+3C],0
>0050D5B9    jne         0050D5C1
 0050D5BB    dec         ebx
 0050D5BC    cmp         ebx,0FFFFFFFF
>0050D5BF    jne         0050D5A1
 0050D5C1    xor         eax,eax
 0050D5C3    pop         edx
 0050D5C4    pop         ecx
 0050D5C5    pop         ecx
 0050D5C6    mov         dword ptr fs:[eax],edx
 0050D5C9    push        50D5DE
 0050D5CE    mov         eax,dword ptr [ebp-4]
 0050D5D1    call        TMultiCaster.EndDispatch
 0050D5D6    ret
>0050D5D7    jmp         @HandleFinally
>0050D5DC    jmp         0050D5CE
 0050D5DE    pop         esi
 0050D5DF    pop         ebx
 0050D5E0    pop         ecx
 0050D5E1    pop         ebp
 0050D5E2    ret
*}
end;

//0050D5E4
procedure TMultiCaster.DoIdle(Sender:TObject; var Done:Boolean);
begin
{*
 0050D5E4    push        ebp
 0050D5E5    mov         ebp,esp
 0050D5E7    push        ecx
 0050D5E8    push        ebx
 0050D5E9    push        esi
 0050D5EA    push        edi
 0050D5EB    mov         edi,ecx
 0050D5ED    mov         esi,edx
 0050D5EF    mov         dword ptr [ebp-4],eax
 0050D5F2    mov         eax,dword ptr [ebp-4]
 0050D5F5    call        TMultiCaster.BeginDispatch
 0050D5FA    xor         eax,eax
 0050D5FC    push        ebp
 0050D5FD    push        50D650
 0050D602    push        dword ptr fs:[eax]
 0050D605    mov         dword ptr fs:[eax],esp
 0050D608    mov         eax,dword ptr [ebp-4]
 0050D60B    call        TMultiCaster.GetCount
 0050D610    mov         ebx,eax
 0050D612    dec         ebx
 0050D613    cmp         ebx,0
>0050D616    jl          0050D63A
 0050D618    mov         edx,ebx
 0050D61A    mov         eax,dword ptr [ebp-4]
 0050D61D    call        TMultiCaster.GetAppEvents
 0050D622    mov         ecx,edi
 0050D624    mov         edx,esi
 0050D626    call        TCustomApplicationEvents.DoIdle
 0050D62B    mov         eax,dword ptr [ebp-4]
 0050D62E    cmp         byte ptr [eax+3C],0
>0050D632    jne         0050D63A
 0050D634    dec         ebx
 0050D635    cmp         ebx,0FFFFFFFF
>0050D638    jne         0050D618
 0050D63A    xor         eax,eax
 0050D63C    pop         edx
 0050D63D    pop         ecx
 0050D63E    pop         ecx
 0050D63F    mov         dword ptr fs:[eax],edx
 0050D642    push        50D657
 0050D647    mov         eax,dword ptr [ebp-4]
 0050D64A    call        TMultiCaster.EndDispatch
 0050D64F    ret
>0050D650    jmp         @HandleFinally
>0050D655    jmp         0050D647
 0050D657    pop         edi
 0050D658    pop         esi
 0050D659    pop         ebx
 0050D65A    pop         ecx
 0050D65B    pop         ebp
 0050D65C    ret
*}
end;

//0050D660
procedure TMultiCaster.DoMessage(var Msg:TMsg; var Handled:Boolean);
begin
{*
 0050D660    push        ebp
 0050D661    mov         ebp,esp
 0050D663    push        ecx
 0050D664    push        ebx
 0050D665    push        esi
 0050D666    push        edi
 0050D667    mov         edi,ecx
 0050D669    mov         esi,edx
 0050D66B    mov         dword ptr [ebp-4],eax
 0050D66E    mov         eax,dword ptr [ebp-4]
 0050D671    call        TMultiCaster.BeginDispatch
 0050D676    xor         eax,eax
 0050D678    push        ebp
 0050D679    push        50D6CC
 0050D67E    push        dword ptr fs:[eax]
 0050D681    mov         dword ptr fs:[eax],esp
 0050D684    mov         eax,dword ptr [ebp-4]
 0050D687    call        TMultiCaster.GetCount
 0050D68C    mov         ebx,eax
 0050D68E    dec         ebx
 0050D68F    cmp         ebx,0
>0050D692    jl          0050D6B6
 0050D694    mov         edx,ebx
 0050D696    mov         eax,dword ptr [ebp-4]
 0050D699    call        TMultiCaster.GetAppEvents
 0050D69E    mov         ecx,edi
 0050D6A0    mov         edx,esi
 0050D6A2    call        TCustomApplicationEvents.DoMessage
 0050D6A7    mov         eax,dword ptr [ebp-4]
 0050D6AA    cmp         byte ptr [eax+3C],0
>0050D6AE    jne         0050D6B6
 0050D6B0    dec         ebx
 0050D6B1    cmp         ebx,0FFFFFFFF
>0050D6B4    jne         0050D694
 0050D6B6    xor         eax,eax
 0050D6B8    pop         edx
 0050D6B9    pop         ecx
 0050D6BA    pop         ecx
 0050D6BB    mov         dword ptr fs:[eax],edx
 0050D6BE    push        50D6D3
 0050D6C3    mov         eax,dword ptr [ebp-4]
 0050D6C6    call        TMultiCaster.EndDispatch
 0050D6CB    ret
>0050D6CC    jmp         @HandleFinally
>0050D6D1    jmp         0050D6C3
 0050D6D3    pop         edi
 0050D6D4    pop         esi
 0050D6D5    pop         ebx
 0050D6D6    pop         ecx
 0050D6D7    pop         ebp
 0050D6D8    ret
*}
end;

//0050D6DC
procedure TMultiCaster.DoMinimize(Sender:TObject);
begin
{*
 0050D6DC    push        ebp
 0050D6DD    mov         ebp,esp
 0050D6DF    push        ecx
 0050D6E0    push        ebx
 0050D6E1    push        esi
 0050D6E2    mov         esi,edx
 0050D6E4    mov         dword ptr [ebp-4],eax
 0050D6E7    mov         eax,dword ptr [ebp-4]
 0050D6EA    call        TMultiCaster.BeginDispatch
 0050D6EF    xor         eax,eax
 0050D6F1    push        ebp
 0050D6F2    push        50D743
 0050D6F7    push        dword ptr fs:[eax]
 0050D6FA    mov         dword ptr fs:[eax],esp
 0050D6FD    mov         eax,dword ptr [ebp-4]
 0050D700    call        TMultiCaster.GetCount
 0050D705    mov         ebx,eax
 0050D707    dec         ebx
 0050D708    cmp         ebx,0
>0050D70B    jl          0050D72D
 0050D70D    mov         edx,ebx
 0050D70F    mov         eax,dword ptr [ebp-4]
 0050D712    call        TMultiCaster.GetAppEvents
 0050D717    mov         edx,esi
 0050D719    call        TCustomApplicationEvents.DoMinimize
 0050D71E    mov         eax,dword ptr [ebp-4]
 0050D721    cmp         byte ptr [eax+3C],0
>0050D725    jne         0050D72D
 0050D727    dec         ebx
 0050D728    cmp         ebx,0FFFFFFFF
>0050D72B    jne         0050D70D
 0050D72D    xor         eax,eax
 0050D72F    pop         edx
 0050D730    pop         ecx
 0050D731    pop         ecx
 0050D732    mov         dword ptr fs:[eax],edx
 0050D735    push        50D74A
 0050D73A    mov         eax,dword ptr [ebp-4]
 0050D73D    call        TMultiCaster.EndDispatch
 0050D742    ret
>0050D743    jmp         @HandleFinally
>0050D748    jmp         0050D73A
 0050D74A    pop         esi
 0050D74B    pop         ebx
 0050D74C    pop         ecx
 0050D74D    pop         ebp
 0050D74E    ret
*}
end;

//0050D750
procedure TMultiCaster.DoRestore(Sender:TObject);
begin
{*
 0050D750    push        ebp
 0050D751    mov         ebp,esp
 0050D753    push        ecx
 0050D754    push        ebx
 0050D755    push        esi
 0050D756    mov         esi,edx
 0050D758    mov         dword ptr [ebp-4],eax
 0050D75B    mov         eax,dword ptr [ebp-4]
 0050D75E    call        TMultiCaster.BeginDispatch
 0050D763    xor         eax,eax
 0050D765    push        ebp
 0050D766    push        50D7B7
 0050D76B    push        dword ptr fs:[eax]
 0050D76E    mov         dword ptr fs:[eax],esp
 0050D771    mov         eax,dword ptr [ebp-4]
 0050D774    call        TMultiCaster.GetCount
 0050D779    mov         ebx,eax
 0050D77B    dec         ebx
 0050D77C    cmp         ebx,0
>0050D77F    jl          0050D7A1
 0050D781    mov         edx,ebx
 0050D783    mov         eax,dword ptr [ebp-4]
 0050D786    call        TMultiCaster.GetAppEvents
 0050D78B    mov         edx,esi
 0050D78D    call        TCustomApplicationEvents.DoRestore
 0050D792    mov         eax,dword ptr [ebp-4]
 0050D795    cmp         byte ptr [eax+3C],0
>0050D799    jne         0050D7A1
 0050D79B    dec         ebx
 0050D79C    cmp         ebx,0FFFFFFFF
>0050D79F    jne         0050D781
 0050D7A1    xor         eax,eax
 0050D7A3    pop         edx
 0050D7A4    pop         ecx
 0050D7A5    pop         ecx
 0050D7A6    mov         dword ptr fs:[eax],edx
 0050D7A9    push        50D7BE
 0050D7AE    mov         eax,dword ptr [ebp-4]
 0050D7B1    call        TMultiCaster.EndDispatch
 0050D7B6    ret
>0050D7B7    jmp         @HandleFinally
>0050D7BC    jmp         0050D7AE
 0050D7BE    pop         esi
 0050D7BF    pop         ebx
 0050D7C0    pop         ecx
 0050D7C1    pop         ebp
 0050D7C2    ret
*}
end;

//0050D7C4
procedure TMultiCaster.DoShortcut(var Msg:TWMKey; var Handled:Boolean);
begin
{*
 0050D7C4    push        ebp
 0050D7C5    mov         ebp,esp
 0050D7C7    push        ecx
 0050D7C8    push        ebx
 0050D7C9    push        esi
 0050D7CA    push        edi
 0050D7CB    mov         edi,ecx
 0050D7CD    mov         esi,edx
 0050D7CF    mov         dword ptr [ebp-4],eax
 0050D7D2    mov         eax,dword ptr [ebp-4]
 0050D7D5    call        TMultiCaster.BeginDispatch
 0050D7DA    xor         eax,eax
 0050D7DC    push        ebp
 0050D7DD    push        50D830
 0050D7E2    push        dword ptr fs:[eax]
 0050D7E5    mov         dword ptr fs:[eax],esp
 0050D7E8    mov         eax,dword ptr [ebp-4]
 0050D7EB    call        TMultiCaster.GetCount
 0050D7F0    mov         ebx,eax
 0050D7F2    dec         ebx
 0050D7F3    cmp         ebx,0
>0050D7F6    jl          0050D81A
 0050D7F8    mov         edx,ebx
 0050D7FA    mov         eax,dword ptr [ebp-4]
 0050D7FD    call        TMultiCaster.GetAppEvents
 0050D802    mov         ecx,edi
 0050D804    mov         edx,esi
 0050D806    call        TCustomApplicationEvents.DoShortcut
 0050D80B    mov         eax,dword ptr [ebp-4]
 0050D80E    cmp         byte ptr [eax+3C],0
>0050D812    jne         0050D81A
 0050D814    dec         ebx
 0050D815    cmp         ebx,0FFFFFFFF
>0050D818    jne         0050D7F8
 0050D81A    xor         eax,eax
 0050D81C    pop         edx
 0050D81D    pop         ecx
 0050D81E    pop         ecx
 0050D81F    mov         dword ptr fs:[eax],edx
 0050D822    push        50D837
 0050D827    mov         eax,dword ptr [ebp-4]
 0050D82A    call        TMultiCaster.EndDispatch
 0050D82F    ret
>0050D830    jmp         @HandleFinally
>0050D835    jmp         0050D827
 0050D837    pop         edi
 0050D838    pop         esi
 0050D839    pop         ebx
 0050D83A    pop         ecx
 0050D83B    pop         ebp
 0050D83C    ret
*}
end;

//0050D840
procedure TMultiCaster.DoShowHint(var HintStr:UnicodeString; var CanShow:Boolean; var HintInfo:THintInfo);
begin
{*
 0050D840    push        ebp
 0050D841    mov         ebp,esp
 0050D843    push        ecx
 0050D844    push        ebx
 0050D845    push        esi
 0050D846    push        edi
 0050D847    mov         edi,ecx
 0050D849    mov         esi,edx
 0050D84B    mov         dword ptr [ebp-4],eax
 0050D84E    mov         eax,dword ptr [ebp-4]
 0050D851    call        TMultiCaster.BeginDispatch
 0050D856    xor         eax,eax
 0050D858    push        ebp
 0050D859    push        50D8B0
 0050D85E    push        dword ptr fs:[eax]
 0050D861    mov         dword ptr fs:[eax],esp
 0050D864    mov         eax,dword ptr [ebp-4]
 0050D867    call        TMultiCaster.GetCount
 0050D86C    mov         ebx,eax
 0050D86E    dec         ebx
 0050D86F    cmp         ebx,0
>0050D872    jl          0050D89A
 0050D874    mov         eax,dword ptr [ebp+8]
 0050D877    push        eax
 0050D878    mov         edx,ebx
 0050D87A    mov         eax,dword ptr [ebp-4]
 0050D87D    call        TMultiCaster.GetAppEvents
 0050D882    mov         ecx,edi
 0050D884    mov         edx,esi
 0050D886    call        TCustomApplicationEvents.DoShowHint
 0050D88B    mov         eax,dword ptr [ebp-4]
 0050D88E    cmp         byte ptr [eax+3C],0
>0050D892    jne         0050D89A
 0050D894    dec         ebx
 0050D895    cmp         ebx,0FFFFFFFF
>0050D898    jne         0050D874
 0050D89A    xor         eax,eax
 0050D89C    pop         edx
 0050D89D    pop         ecx
 0050D89E    pop         ecx
 0050D89F    mov         dword ptr fs:[eax],edx
 0050D8A2    push        50D8B7
 0050D8A7    mov         eax,dword ptr [ebp-4]
 0050D8AA    call        TMultiCaster.EndDispatch
 0050D8AF    ret
>0050D8B0    jmp         @HandleFinally
>0050D8B5    jmp         0050D8A7
 0050D8B7    pop         edi
 0050D8B8    pop         esi
 0050D8B9    pop         ebx
 0050D8BA    pop         ecx
 0050D8BB    pop         ebp
 0050D8BC    ret         4
*}
end;

//0050D8C0
procedure TMultiCaster.DoSettingChange(Sender:TObject; Flag:Integer; const Section:UnicodeString; var Result:LongInt);
begin
{*
 0050D8C0    push        ebp
 0050D8C1    mov         ebp,esp
 0050D8C3    push        ecx
 0050D8C4    push        ebx
 0050D8C5    push        esi
 0050D8C6    push        edi
 0050D8C7    mov         edi,ecx
 0050D8C9    mov         esi,edx
 0050D8CB    mov         dword ptr [ebp-4],eax
 0050D8CE    mov         eax,dword ptr [ebp-4]
 0050D8D1    call        TMultiCaster.BeginDispatch
 0050D8D6    xor         eax,eax
 0050D8D8    push        ebp
 0050D8D9    push        50D934
 0050D8DE    push        dword ptr fs:[eax]
 0050D8E1    mov         dword ptr fs:[eax],esp
 0050D8E4    mov         eax,dword ptr [ebp-4]
 0050D8E7    call        TMultiCaster.GetCount
 0050D8EC    mov         ebx,eax
 0050D8EE    dec         ebx
 0050D8EF    cmp         ebx,0
>0050D8F2    jl          0050D91E
 0050D8F4    mov         eax,dword ptr [ebp+0C]
 0050D8F7    push        eax
 0050D8F8    mov         eax,dword ptr [ebp+8]
 0050D8FB    push        eax
 0050D8FC    mov         edx,ebx
 0050D8FE    mov         eax,dword ptr [ebp-4]
 0050D901    call        TMultiCaster.GetAppEvents
 0050D906    mov         ecx,edi
 0050D908    mov         edx,esi
 0050D90A    call        TCustomApplicationEvents.DoSettingChange
 0050D90F    mov         eax,dword ptr [ebp-4]
 0050D912    cmp         byte ptr [eax+3C],0
>0050D916    jne         0050D91E
 0050D918    dec         ebx
 0050D919    cmp         ebx,0FFFFFFFF
>0050D91C    jne         0050D8F4
 0050D91E    xor         eax,eax
 0050D920    pop         edx
 0050D921    pop         ecx
 0050D922    pop         ecx
 0050D923    mov         dword ptr fs:[eax],edx
 0050D926    push        50D93B
 0050D92B    mov         eax,dword ptr [ebp-4]
 0050D92E    call        TMultiCaster.EndDispatch
 0050D933    ret
>0050D934    jmp         @HandleFinally
>0050D939    jmp         0050D92B
 0050D93B    pop         edi
 0050D93C    pop         esi
 0050D93D    pop         ebx
 0050D93E    pop         ecx
 0050D93F    pop         ebp
 0050D940    ret         8
*}
end;

//0050D944
procedure TMultiCaster.EndDispatch;
begin
{*
 0050D944    push        ebx
 0050D945    push        esi
 0050D946    mov         ebx,eax
 0050D948    cmp         dword ptr [ebx+40],0
>0050D94C    jle         0050D993
 0050D94E    dec         dword ptr [ebx+40]
 0050D951    mov         byte ptr [ebx+3C],0
 0050D955    cmp         dword ptr [ebx+40],0
>0050D959    jne         0050D993
 0050D95B    cmp         dword ptr [ebx+38],0
>0050D95F    je          0050D993
 0050D961    mov         edx,dword ptr [ebx+38]
 0050D964    mov         eax,dword ptr [ebx+34]
 0050D967    call        TList.IndexOf
 0050D96C    mov         esi,dword ptr [ebx+34]
 0050D96F    mov         edx,dword ptr [esi+8]
 0050D972    dec         edx
 0050D973    cmp         eax,edx
>0050D975    jge         0050D993
 0050D977    mov         edx,dword ptr [ebx+38]
 0050D97A    mov         eax,esi
 0050D97C    xor         ecx,ecx
 0050D97E    call        TList.RemoveItem
 0050D983    mov         edx,dword ptr [ebx+38]
 0050D986    mov         eax,dword ptr [ebx+34]
 0050D989    call        TList.Add
 0050D98E    xor         eax,eax
 0050D990    mov         dword ptr [ebx+38],eax
 0050D993    pop         esi
 0050D994    pop         ebx
 0050D995    ret
*}
end;

//0050D998
function TMultiCaster.GetAppEvents(Index:Integer):TCustomApplicationEvents;
begin
{*
 0050D998    push        ebx
 0050D999    push        esi
 0050D99A    mov         esi,edx
 0050D99C    mov         ebx,eax
 0050D99E    mov         eax,dword ptr [ebx+34]
 0050D9A1    mov         edx,esi
 0050D9A3    call        TList.Get
 0050D9A8    pop         esi
 0050D9A9    pop         ebx
 0050D9AA    ret
*}
end;

//0050D9AC
function TMultiCaster.GetCount:Integer;
begin
{*
 0050D9AC    mov         eax,dword ptr [eax+34]
 0050D9AF    mov         eax,dword ptr [eax+8]
 0050D9B2    ret
*}
end;

//0050D9B4
procedure TMultiCaster.DoModalBegin(Sender:TObject);
begin
{*
 0050D9B4    push        ebp
 0050D9B5    mov         ebp,esp
 0050D9B7    push        ecx
 0050D9B8    push        ebx
 0050D9B9    push        esi
 0050D9BA    mov         esi,edx
 0050D9BC    mov         dword ptr [ebp-4],eax
 0050D9BF    mov         eax,dword ptr [ebp-4]
 0050D9C2    call        TMultiCaster.BeginDispatch
 0050D9C7    xor         eax,eax
 0050D9C9    push        ebp
 0050D9CA    push        50DA1B
 0050D9CF    push        dword ptr fs:[eax]
 0050D9D2    mov         dword ptr fs:[eax],esp
 0050D9D5    mov         eax,dword ptr [ebp-4]
 0050D9D8    call        TMultiCaster.GetCount
 0050D9DD    mov         ebx,eax
 0050D9DF    dec         ebx
 0050D9E0    cmp         ebx,0
>0050D9E3    jl          0050DA05
 0050D9E5    mov         edx,ebx
 0050D9E7    mov         eax,dword ptr [ebp-4]
 0050D9EA    call        TMultiCaster.GetAppEvents
 0050D9EF    mov         edx,esi
 0050D9F1    call        TCustomApplicationEvents.DoModalBegin
 0050D9F6    mov         eax,dword ptr [ebp-4]
 0050D9F9    cmp         byte ptr [eax+3C],0
>0050D9FD    jne         0050DA05
 0050D9FF    dec         ebx
 0050DA00    cmp         ebx,0FFFFFFFF
>0050DA03    jne         0050D9E5
 0050DA05    xor         eax,eax
 0050DA07    pop         edx
 0050DA08    pop         ecx
 0050DA09    pop         ecx
 0050DA0A    mov         dword ptr fs:[eax],edx
 0050DA0D    push        50DA22
 0050DA12    mov         eax,dword ptr [ebp-4]
 0050DA15    call        TMultiCaster.EndDispatch
 0050DA1A    ret
>0050DA1B    jmp         @HandleFinally
>0050DA20    jmp         0050DA12
 0050DA22    pop         esi
 0050DA23    pop         ebx
 0050DA24    pop         ecx
 0050DA25    pop         ebp
 0050DA26    ret
*}
end;

//0050DA28
procedure TMultiCaster.DoModalEnd(Sender:TObject);
begin
{*
 0050DA28    push        ebp
 0050DA29    mov         ebp,esp
 0050DA2B    push        ecx
 0050DA2C    push        ebx
 0050DA2D    push        esi
 0050DA2E    mov         esi,edx
 0050DA30    mov         dword ptr [ebp-4],eax
 0050DA33    mov         eax,dword ptr [ebp-4]
 0050DA36    call        TMultiCaster.BeginDispatch
 0050DA3B    xor         eax,eax
 0050DA3D    push        ebp
 0050DA3E    push        50DA8F
 0050DA43    push        dword ptr fs:[eax]
 0050DA46    mov         dword ptr fs:[eax],esp
 0050DA49    mov         eax,dword ptr [ebp-4]
 0050DA4C    call        TMultiCaster.GetCount
 0050DA51    mov         ebx,eax
 0050DA53    dec         ebx
 0050DA54    cmp         ebx,0
>0050DA57    jl          0050DA79
 0050DA59    mov         edx,ebx
 0050DA5B    mov         eax,dword ptr [ebp-4]
 0050DA5E    call        TMultiCaster.GetAppEvents
 0050DA63    mov         edx,esi
 0050DA65    call        TCustomApplicationEvents.DoModalEnd
 0050DA6A    mov         eax,dword ptr [ebp-4]
 0050DA6D    cmp         byte ptr [eax+3C],0
>0050DA71    jne         0050DA79
 0050DA73    dec         ebx
 0050DA74    cmp         ebx,0FFFFFFFF
>0050DA77    jne         0050DA59
 0050DA79    xor         eax,eax
 0050DA7B    pop         edx
 0050DA7C    pop         ecx
 0050DA7D    pop         ecx
 0050DA7E    mov         dword ptr fs:[eax],edx
 0050DA81    push        50DA96
 0050DA86    mov         eax,dword ptr [ebp-4]
 0050DA89    call        TMultiCaster.EndDispatch
 0050DA8E    ret
>0050DA8F    jmp         @HandleFinally
>0050DA94    jmp         0050DA86
 0050DA96    pop         esi
 0050DA97    pop         ebx
 0050DA98    pop         ecx
 0050DA99    pop         ebp
 0050DA9A    ret
*}
end;

Initialization
//00780D44
{*
 00780D44    sub         dword ptr ds:[7938EC],1
>00780D4B    jae         00780D76
 00780D4D    mov         edx,dword ptr ds:[47A16C];TControl
 00780D53    mov         eax,[0050C2EC];TCustomApplicationEvents
 00780D58    call        GroupDescendentsWith
 00780D5D    mov         ecx,dword ptr ds:[78D590];^Application:TApplication
 00780D63    mov         ecx,dword ptr [ecx]
 00780D65    mov         dl,1
 00780D67    mov         eax,[0050C988];TMultiCaster
 00780D6C    call        TMultiCaster.Create
 00780D71    mov         [0078690C],eax
 00780D76    ret
*}
Finalization
end.