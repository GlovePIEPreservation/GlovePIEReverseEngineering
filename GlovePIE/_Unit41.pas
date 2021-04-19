//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit41;

interface

uses
  SysUtils, Classes, Controls, DwmApi, mwExport, mwCustomEdit, Graphics, mwSupportClasses, mwHighlighter, mwKeyCmds, uTextDrawer, mwEditSearch;

type
  TAttribRec = TAttribRec = record//size=C
Bg:Integer;//f0
Fg:Integer;//f4
Fs:TFontStyles;//f8
end;;
  TmwCustomExport = class(TComponent)
  published
    procedure RunExport(StartLine:Integer; StopLine:Integer; AmwHighlighter:TmwCustomHighLighter; AmwEdit:TCustomControl);//005172F0
    procedure FormatToken(Token:string; Attribute:TmwHighLightAttributes; IsSpace:Boolean; Tags:Boolean);//00516DC0
    procedure RunExportBlock(ExportStart:TPoint; ExportEnd:TPoint; AmwHighlighter:TmwCustomHighLighter; AmwEdit:TCustomControl);//0051732C
    procedure SaveToStream(Stream:TStream);//005174E0
    procedure SaveToFile(FileName:string);//005174C0
    destructor Destroy();//00517118
    constructor Create(AOwner:TComponent);//005170A0
    function GetSharedExporter:TmwCustomExport;//00517600
    procedure CopyToClipboardFormat(AmwEdit:TCustomControl; AmwHighlighter:TmwCustomHighLighter; CbFormat:Integer);//00516DEC
    procedure Clear;//00516DC8
    procedure CopyToClipboard(AmwEdit:TCustomControl; AmwHighlighter:TmwCustomHighLighter);//00516E20
  public
    FFontSize:Integer;//f34
    FTitle:string;//f38
    FUseBackGround:Boolean;//f3C
    FDefaultFilter:string;//f40
    FData:TMemoryStream;//f44
    FLastAttr:TAttribRec;//f48
    FControl:TCustomControl;//f54
    FExportInFormat:Integer;//f58
    destructor Destroy(); virtual;//00517118
    constructor Create(AOwner:TComponent); virtual;//v2C//005170A0
    procedure v34; virtual; abstract;//v34//00404A58
    procedure v38; virtual; abstract;//v38//00404A58
    //procedure v3C(?:?; ?:?; ?:?); virtual;//v3C//00517148
    procedure v40; virtual; abstract;//v40//00404A58
    procedure v44; virtual; abstract;//v44//00404A58
    procedure v48; virtual; abstract;//v48//00404A58
    //function v4C:?; virtual;//v4C//00517588
    //procedure v50(?:?); virtual;//v50//00517590
    //procedure v54(?:?); virtual;//v54//005175A4
    function GetSharedExporter:TmwCustomExport; virtual;//v58//00517600
    procedure CopyToClipboardFormat(AmwEdit:TCustomControl; AmwHighlighter:TmwCustomHighLighter; CbFormat:Integer); virtual;//v5C//00516DEC
    procedure CopyToClipboard(AmwEdit:TCustomControl; AmwHighlighter:TmwCustomHighLighter); virtual;//v60//00516E20
    procedure Clear; virtual;//v64//00516DC8
    procedure v68; virtual; abstract;//v68//00404A58
  end;
  TmwSearchOption = (mwsoMatchCase, mwsoWholeWord, mwsoBackwards, mwsoEntireScope, mwsoSelectedOnly, mwsoReplace, mwsoReplaceAll, mwsoPrompt);
  TmwSearchOptions = set of TmwSearchOption;
  TmwReplaceAction = (mwraCancel, mwraSkip, mwraReplace, mwraReplaceAll);
  EmwEditError = class(Exception)
  end;
  TSelectionMode = (smNormal, smColumn, smLine);
  TDropFilesEvent = procedure(Sender:TObject; X:Integer; Y:Integer; Files:TStrings) of object;;
  TIndexEvent = procedure(Index:Integer) of object;;
  TPaintEvent = procedure(Sender:TObject; ACanvas:TCanvas) of object;;
  TProcessCommandEvent = procedure(Sender:TObject; var Command:TmwEditorCommand; var AChar:Char; Data:Pointer) of object;;
  TReplaceTextEvent = procedure(Sender:TObject; const ASearch:string; const AReplace:string; Line:Integer; Column:Integer; var Action:TmwReplaceAction) of object;;
  TSpecialLineColorsEvent = procedure(Sender:TObject; Line:Integer; var Special:Boolean; var FG:TColor; var BG:TColor) of object;;
  TCaretType = (ctVerticalLine, ctHorizontalLine, ctHalfBlock, ctBlock);
  TChangeReason = (mwcrInsert, mwcrPaste, mwcrDragDropInsert, mwcrDeleteAfterCursor, mwcrDelete, mwcrSelDelete, mwcrDragDropDelete, mwcrLineBreak, mwcrIndent, mwcrUnindent, mwcrNone);
  TmwPrintStatus = (psBegin, psNewPage, psEnd);
  TPrintStatusEvent = procedure(Sender:TObject; Status:TmwPrintStatus; PageNumber:Integer; var Abort:Boolean) of object;;
  TmwMarginUnits = (muPixels, muThousandthsOfInches, muMillimeters);
  TmwPrintOptions = TmwPrintOptions = record//size=38
f2C:string;//f2C
end;
SelectedOnly:Boolean;//f0
Highlighted:Boolean;//f1
WrapLongLines:Boolean;//f2
IgnoreColors:Boolean;//f3
Copies:Integer;//f4
MarginUnits:TmwMarginUnits;//f8
Margins:TRect;//fC
PrintRange:TRect;//f1C
Title:string;//f2C
Header:TStringList;//f30
Footer:TStringList;//f34
end;;
  TmwStateFlag = (mwsfCaretChanged, mwsfScrollbarChanged, mwsfLinesChanging, mwsfInScrollLoop, mwsfIgnoreNextChar, mwsfCaretVisible, mwsfDblClicked, mwsfPossibleGutterClick, mwsfWaitForDragging);
  TmwStateFlags = set of TmwStateFlag;
  TmwEditorOption = (mweoAutoIndent, mweoDragDropEditing, mweoDropFiles, mweoHalfPageScroll, mweoNoCaret, mweoNoSelection, mweoScrollPastEol, mweoShowScrollHint, mweoTabsToSpaces, mweoSmartTabs);
  TmwEditorOptions = set of TmwEditorOption;
  TmwStatusChange = (mwscAll, mwscCaretX, mwscCaretY, mwscLeftChar, mwscTopLine, mwscInsertMode, mwscModified, mwscSelection);
  TmwStatusChanges = set of TmwStatusChange;
  TStatusChangeEvent = procedure(Sender:TObject; Changes:TmwStatusChanges) of object;;
  TMark = class(TObject)
  published
    constructor Create(owner:TmwCustomEdit);//00529B00
  public
    fLine:Integer;//f4
    fColumn:Integer;//f8
    fImage:Integer;//fC
    fEdit:TmwCustomEdit;//f10
    fVisible:Boolean;//f14
    fInternalImage:Boolean;//f15
    fBookmarkNum:Integer;//f18
    //function v0:?; virtual;//v0//005299D4
    //procedure v4(?:?); virtual;//v4//00529A54
    //procedure v8(?:?); virtual;//v8//00529A58
    //procedure vC(?:?); virtual;//vC//00529AA0
  end;
  TPlaceMarkEvent = procedure(Sender:TObject; var Mark:TMark) of object;;
  TMarks = array [1..16] of TMark;
  TMarkList = class(TList)
  published
    procedure Insert(Index:Integer; Item:TMark);//00529CCC
    procedure GetMarksForLine(line:Integer; var marks:TMarks);//00529C6C
    procedure Last;//00529CE0
    function Remove(Item:TMark):Integer;//00529D34
    procedure Place(mark:TMark);//00529CEC
    procedure First;//00529C48
    destructor Destroy();//00529BD8
    constructor Create(owner:TmwCustomEdit);//00529B9C
    function Add(Item:TMark):Integer;//00529B3C
    procedure Delete(Index:Integer);//00529C20
    procedure ClearLine(line:Integer);//00529B58
  public
    fEdit:TmwCustomEdit;//f10
    fOnChange:TNotifyEvent;//f18
    f1A:word;//f1A
    f1C:TmwCustomEdit;//f1C
    destructor Destroy(); virtual;//00529BD8
  end;
  TUndoList = class(TObject)
  published
    procedure ClearList;//005299A0
    function GetChangeReason:TChangeReason;//00529978
    procedure UnLockUndo;//005299CC
    procedure LockUndo;//005299C4
    destructor Destroy();//005297A8
    constructor Create(AOwner:TmwCustomEdit);//00529750
    function GetChange(var ChangeStartPos:TPoint; var ChangeEndPos:TPoint; var ChangeSelMode:TSelectionMode; var ChangeStr:PWideChar):TChangeReason;//005297DC
    procedure AddChange(ChangeReason:TChangeReason; ChangeStartPos:TPoint; ChangeSelMode:TSelectionMode; ChangeStr:PWideChar; ChangeEndPos:TPoint);//0052962C
  public
    fList:TList;//f4
    fCanUndo:Integer;//f8
    fMaxUndo:Integer;//fC
    fOwner:TmwCustomEdit;//f10
    fUndoLocked:Boolean;//f14
  end;
  TmwEditList = class(TStringList)
  published
    procedure Insert(Index:Integer; S:string);//0051BAC8
    procedure Delete(Index:Integer);//0051BA48
    procedure LoadFromStream(Stream:TStream);//0051BB00
    procedure SetTextStr(Value:string);//0051BC14
    procedure AddStrings(Strings:TStrings);//0051B8F4
    function Add(S:string):Integer;//0051B8C0
    procedure Clear;//0051BA10
    procedure Assign(Source:TPersistent);//0051B9BC
  public
    FOnAdded:TNotifyEvent;//f58
    f5A:word;//f5A
    f5C:dword;//f5C
    fOnCleared:TNotifyEvent;//f60
    f62:word;//f62
    f64:dword;//f64
    FOnDeleted:TIndexEvent;//f68
    f6A:word;//f6A
    f6C:dword;//f6C
    FOnInserted:TIndexEvent;//f70
    f72:word;//f72
    f74:dword;//f74
    FOnLoaded:TNotifyEvent;//f78
    f7A:word;//f7A
    f7C:dword;//f7C
    fOnPutted:TIndexEvent;//f80
    f82:word;//f82
    f84:dword;//f84
    fOnScanRanges:TNotifyEvent;//f88
    f8A:word;//f8A
    f8C:dword;//f8C
    nLoading:Integer;//f90
    procedure Assign(Source:TPersistent); virtual;//v8//0051B9BC
    procedure Put(Index:Integer; const S:UnicodeString); virtual;//v20//0051BBD4
    procedure SetTextStr(Value:string); virtual;//v2C//0051BC14
    function Add(S:string):Integer; virtual;//v38//0051B8C0
    procedure AddStrings(Strings:TStrings); virtual;//v40//0051B8F4
    procedure Clear; virtual;//v44//0051BA10
    procedure Delete(Index:Integer); virtual;//v48//0051BA48
    procedure Insert(Index:Integer; S:string); virtual;//v60//0051BAC8
    procedure LoadFromStream(Stream:TStream); virtual;//v70//0051BB00
  end;
  TGutterClickEvent = procedure(Sender:TObject; X:Integer; Y:Integer; Line:Integer; mark:TMark) of object;;
  TmwCustomEdit = class(TCustomControl)
  published
    procedure SelectAll;//0051F6C0
    procedure SetBookMark(BookMark:Integer; X:Integer; Y:Integer);//00522B54
    procedure SetDefaultKeystrokes;//00523570
    function SearchReplace(ASearch:string; AReplace:string; AOptions:TmwSearchOptions):Integer;//00527CD4
    procedure Redo;//00522120
    procedure RefreshAllTokens;//00527790
    //procedure RowColumnToPixels(RowCol:TPoint; ?:?);//0051BCC4
    procedure Undo;//005225BC
    function UpdateAction(Action:TBasicAction):Boolean;//005290BC
    procedure WndProc(var Msg:TMessage);//00522C6C
    procedure SetSelWord;//005275C4
    procedure SetOptionFlag(Flag:TmwEditorOption; Value:Boolean);//00528384
    procedure SetSelEnd(Value:Integer);//00527518
    procedure SetSelStart(Value:Integer);//0052731C
    procedure DragDrop(Source:TObject; X:Integer; Y:Integer);//00522D4C
    procedure DoCopyToClipboard(SText:string);//0051BD30
    procedure EnsureCursorPosVisible;//00523458
    procedure EndUpdate;//00525FD4
    procedure CutToClipboard;//0051C020
    procedure CopyToClipboard;//0051BFC8
    constructor Create(AOwner:TComponent);//0051C0B8
    destructor Destroy();//0051C4BC
    procedure ExportToFile(SelectedOnly:Boolean; FileName:string; Exporter:TComponent);//00527B9C
    procedure ClearAll;//00525BC4
    function CaretYPix:Integer;//0051C668
    procedure CommandProcessor(Command:TmwEditorCommand; AChar:Char; Data:Pointer);//00523638
    procedure ClearBookMark(BookMark:Integer);//00522AB8
    function CaretXPix:Integer;//0051C630
    procedure ExportToClipboard(SelectedOnly:Boolean; Exporter:TComponent);//005279C4
    procedure ExecuteAction(Action:TBasicAction);//00528FE0
    procedure BeginUpdate;//00525FCC
    procedure AddKey(Command:TmwEditorCommand; Key1:Word; SS2:TShiftState; Key2:Word; SS1:TShiftState);//0052715C
    procedure ClearUndo;//0052769C
    //procedure NextWordPos(?:?);//00525BD4
    procedure Notification(AComponent:TComponent; Operation:TOperation);//00523138
    procedure InvalidateLine(Line:Integer);//00529210
    procedure IsBookmark(BookMark:Integer);//00527688
    procedure PasteFromClipboard;//0051F21C
    procedure Print(PrintFont:TFont; Options:TmwPrintOptions);//00526DE8
    procedure ReadState(Reader:TReader);//00527104
    //procedure PrevWordPos(?:?);//00525DA4
    //procedure PixelsToRowColumn(Pixels:TPoint; ?:?);//0051BC44
    function GetHighlighterAttriAtRowCol(XY:TPoint; var Token:string; var Attri:TmwHighLightAttributes):Boolean;//005294AC
    function GetBookMark(BookMark:Integer; var X:Integer; var Y:Integer):Boolean;//005275F0
    function GetSelEnd:Integer;//00527430
    procedure GotoBookMark(BookMark:Integer);//00522AFC
    function GetSelStart:Integer;//0052720C
  public
    fBlockBegin:TPoint;//f278
    fBlockEnd:TPoint;//f280
    fCaretX:Integer;//f288
    fCaretY:Integer;//f28C
    fCharsInWindow:Integer;//f290
    fCharWidth:Integer;//f294
    fFontDummy:TFont;//f298
    fGutterWidth:Integer;//f29C
    fInserting:Boolean;//f2A0
    fLines:TStrings;//f2A4
    fLinesInWindow:Integer;//f2A8
    fLeftChar:Integer;//f2AC
    fMaxLeftChar:Integer;//f2B0
    fPaintLock:Integer;//f2B4
    fReadOnly:Boolean;//f2B8
    fRightEdge:Integer;//f2BC
    fRightEdgeColor:TColor;//f2C0
    FScrollBars:TScrollStyle;//f2C4
    fTextHeight:Integer;//f2C8
    fTextOffset:Integer;//f2CC
    fTopLine:Integer;//f2D0
    fHighLighter:TmwCustomHighLighter;//f2D4
    fSelectedColor:TmwSelectedColor;//f2D8
    fUndoList:TUndoList;//f2DC
    fRedoList:TUndoList;//f2E0
    fBookMarks:?;//f2E4
    fDragBlockBegin:TPoint;//f30C
    fDragBlockEnd:TPoint;//f314
    fMouseDownX:Integer;//f31C
    fMouseDownY:Integer;//f320
    fBookMarkOpt:TmwBookMarkOpt;//f324
    fOnPaint:TPaintEvent;//f328
    f32A:word;//f32A
    f32C:dword;//f32C
    fOnChange:TNotifyEvent;//f330
    f332:word;//f332
    f334:dword;//f334
    fSelectionChange:TNotifyEvent;//f338
    f33A:word;//f33A
    f33C:dword;//f33C
    fBorderStyle:TBorderStyle;//f340
    fHideSelection:Boolean;//f341
    fMouseWheelAccumulator:Integer;//f344
    fOverwriteCaret:TCaretType;//f348
    fInsertCaret:TCaretType;//f349
    fCaretOffset:TPoint;//f34C
    fOnProcessCommand:TProcessCommandEvent;//f358
    f35A:word;//f35A
    f35C:dword;//f35C
    fOnProcessUserCommand:TProcessCommandEvent;//f360
    f362:word;//f362
    f364:dword;//f364
    fKeyStrokes:TmwKeyStrokes;//f368
    fModified:Boolean;//f36C
    fMarkList:TMarkList;//f370
    fOnPlaceMark:TPlaceMarkEvent;//f378
    f37A:word;//f37A
    f37C:dword;//f37C
    fExtraLineSpacing:Integer;//f380
    fOnCommandDone:TNotifyEvent;//f388
    f38A:word;//f38A
    f38C:dword;//f38C
    fSelectionMode:TSelectionMode;//f390
    fOnPrintStatus:TPrintStatusEvent;//f398
    f39A:word;//f39A
    f39C:dword;//f39C
    fWantTabs:Boolean;//f3A0
    fGutter:TmwGutter;//f3A4
    fTabWidth:Integer;//f3A8
    fOnSpecialLineColors:TSpecialLineColorsEvent;//f3B0
    f3B2:word;//f3B2
    f3B4:dword;//f3B4
    fTextDrawer:TheTextDrawer;//f3B8
    fInvalidateRect:TRect;//f3BC
    fStateFlags:TmwStateFlags;//f3CC
    f3CD:byte;//f3CD
    fOptions:TmwEditorOptions;//f3CE
    f3CF:byte;//f3CF
    fInternalImage:TmwInternalImage;//f3D0
    fStatusChanges:TmwStatusChanges;//f3D4
    fOnStatusChange:TStatusChangeEvent;//f3D8
    f3DA:word;//f3DA
    f3DC:dword;//f3DC
    fLastKey:word;//f3E0
    fLastShiftState:TShiftState;//f3E2
    fOnDropFiles:TDropFilesEvent;//f3E8
    f3EA:word;//f3EA
    f3EC:dword;//f3EC
    fTSearch:TmwEditSearch;//f3F0
    fOnReplaceText:TReplaceTextEvent;//f3F8
    f3FA:word;//f3FA
    f3FC:dword;//f3FC
    fOnGutterClick:TGutterClickEvent;//f400
    f402:word;//f402
    f404:dword;//f404
    destructor Destroy(); virtual;//0051C4BC
    procedure Loaded; virtual;//vC//0051CF40
    procedure Notification(AComponent:TComponent; Operation:TOperation); virtual;//v10//00523138
    procedure ReadState(Reader:TReader); virtual;//v14//00527104
    procedure SetName(Value:TComponentName); virtual;//v18//0051FFCC
    constructor Create(AOwner:TComponent); virtual;//v2C//0051C0B8
    function UpdateAction(Action:TBasicAction):Boolean; virtual;//v30//005290BC
    procedure WndProc(var Msg:TMessage); virtual;//v84//00522C6C
    procedure CreateParams(var Params:TCreateParams); virtual;//vAC//0051C3F4
    procedure CreateWnd; virtual;//vB4//00528A78
    procedure DestroyWnd; virtual;//vC8//00528AA4
    procedure vEC; virtual;//vEC//0051D8FC
    //procedure vF0(?:?; ?:?); virtual;//vF0//0051D844
    procedure vF4; virtual;//vF4//005292E4
    function GetReadOnly:Boolean; virtual;//vF8//005292D4
    //procedure vFC(?:?; ?:?; ?:?); virtual;//vFC//0051DCC4
    //procedure v100(?:?; ?:?; ?:?); virtual;//v100//0051EF80
    //procedure v104(?:?; ?:?); virtual;//v104//005270D8
    //procedure v108(?:?; ?:?); virtual;//v108//00525B70
    procedure v10C; virtual;//v10C//005279A4
    //procedure v110(?:?); virtual;//v110//0051FBE0
    procedure SetReadOnly(Value:Boolean); virtual;//v114//005292DC
    //function v118(?:?; ?:?):?; virtual;//v118//005291D8
    procedure CommandProcessor(Command:TmwEditorCommand; AChar:Char; Data:Pointer); virtual;//v11C//00523638
    //procedure NextWordPos(?:?); virtual;//v120//00525BD4
    //procedure PrevWordPos(?:?); virtual;//v124//00525DA4
    procedure SetDefaultKeystrokes; virtual;//v128//00523570
    procedure WMSize(var Message:TWMSize); message WM_SIZE;//00521480
    procedure WMSetFocus(var Message:TWMSetFocus); message WM_SETFOCUS;//00521454
    procedure WMKillFocus(var Message:TWMKillFocus); message WM_KILLFOCUS;//0052141C
    procedure WMEraseBkgnd(Message:TWMEraseBkgnd); message WM_ERASEBKGND;//00521304
    procedure WMSetCursor(Message:TWMSetCursor); message WM_SETCURSOR;//00528220
    //procedure WMGetDlgCode(?:?); message WM_GETDLGCODE;//0052130C
    procedure WMHScroll(Message:TWMCommand); message WM_HSCROLL;//00521344
    procedure WMVScroll(Message:TWMHScroll); message WM_VSCROLL;//005214DC
    procedure WMMouseWheel(Message:TWMMouseWheel); message WM_MOUSEWHEEL;//005278CC
    //procedure WMDropFiles(?:?); message WM_DROPFILES;//005211B0
    procedure KeyPress(Key:Char); dynamic;//0051CF58
    procedure KeyDown(Key:Word; Shift:TShiftState); dynamic;//0051CE98
    procedure DragDrop(Source:TObject; X:Integer; Y:Integer); dynamic;//00522D4C
    procedure MouseUp(Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer); dynamic;//0051D758
    procedure MouseMove(Shift:TShiftState; X:Integer; Y:Integer); dynamic;//0051D2B4
    procedure MouseDown(Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer); dynamic;//0051D090
    procedure DragOver(Source:TObject; X:Integer; Y:Integer; State:TDragState; Accept:Boolean); dynamic;//00522CD0
    procedure DblClick; dynamic;//00521FE0
    procedure ExecuteAction(Action:TBasicAction); dynamic;//00528FE0
    //function GetFont:?;//0051C6B0
    //function GetLineCount:?;//0051C6B4
    procedure SetFont(Value:TFont);//0051FD84
    procedure SetLines(Value:TStrings);//0051FF30
    procedure SetScrollBars(Value:TScrollStyle);//0052005C
    procedure SetRightEdge(Value:Integer);//0052307C
    procedure SetRightEdgeColor(Value:TColor);//0052309C
    //function GetMaxUndo:?;//00523104
    procedure SetMaxUndo(Value:Integer);//00523110
    procedure SetHighLighter(Value:TmwCustomHighLighter);//0052319C
    procedure SetBorderStyle(Value:TBorderStyle);//00523270
    procedure SetHideSelection(Value:Boolean);//00523284
    procedure SetInsertMode(Value:Boolean);//005232A4
    procedure SetInsertCaret(Value:TCaretType);//00523400
    procedure SetOverwriteCaret(Value:TCaretType);//00523414
    procedure SetKeystrokes(Value:TmwKeyStrokes);//00523554
    procedure SetSelectionMode(Value:TSelectionMode);//00525F90
    procedure SetExtraLineSpacing(Value:Integer);//005275E0
    procedure SetGutter(Value:TmwGutter);//00527820
    procedure SetWantTabs(Value:Boolean);//0052796C
    procedure SetTabWidth(Value:Integer);//00527974
    procedure SetOptions(Value:TmwEditorOptions);//005282FC
  end;
  :TmwCustomEdit.:1 = :TmwCustomEdit.:1 = record//size=1C
fC:string;//fC
end;
Len:Integer;//f0
MaxLen:Integer;//f4
CharsBefore:Integer;//f8
s:string;//fC
FG:TColor;//f10
BG:TColor;//f14
Style:TFontStyles;//f18
end;;
    procedure sub_00516E40(?:TmwCustomExport; ?:Integer);//00516E40
    procedure sub_00516F24(?:TmwCustomExport; ?:TCustomControl; ?:TmwCustomHighLighter);//00516F24
    //procedure sub_00517148(?:?; ?:?; ?:?);//00517148
    //procedure sub_005171E4(?:TmwCustomExport; ?:UnicodeString; ?:?);//005171E4
    //function sub_00517588:?;//00517588
    //procedure sub_00517590(?:?);//00517590
    //procedure sub_005175A4(?:?);//005175A4
    //function sub_00517604:?;//00517604
    //function sub_00517618(?:?):?;//00517618
    //procedure sub_0051B7DC(?:TPoint; ?:?; ?:?);//0051B7DC
    procedure sub_0051B830(?:TPoint; ?:TPoint; ?:TPoint);//0051B830
    //function sub_0051B884(?:Extended):?;//0051B884
    procedure sub_0051BA08(?:TStrings);//0051BA08
    procedure sub_0051BA94(?:TStrings);//0051BA94
    procedure Put(Index:Integer; const S:UnicodeString);//0051BBD4
    procedure sub_0051BD00(?:TmwCustomEdit; ?:Integer; ?:Integer);//0051BD00
    procedure CreateParams(var Params:TCreateParams);//0051C3F4
    procedure sub_0051C458(?:TmwCustomEdit);//0051C458
    procedure sub_0051C570(?:TmwCustomEdit; ?:TPoint);//0051C570
    procedure sub_0051C5CC(?:TmwCustomEdit; ?:TPoint);//0051C5CC
    //function sub_0051C628(?:TmwCustomEdit):?;//0051C628
    //function sub_0051C660(?:TmwCustomEdit):?;//0051C660
    procedure sub_0051C698(?:TmwCustomEdit);//0051C698
    //function sub_0051C6C0(?:TmwCustomEdit):?;//0051C6C0
    procedure sub_0051C6C8(?:TmwCustomEdit; ?:UnicodeString);//0051C6C8
    //function sub_0051C710(?:TmwCustomEdit):?;//0051C710
    //procedure sub_0051C73C(?:UString; ?:?; ?:?; ?:?);//0051C73C
    //procedure sub_0051C7AC(?:?; ?:?; ?:?; ?:?);//0051C7AC
    //procedure sub_0051C7FC(?:TmwCustomEdit; ?:?);//0051C7FC
    //procedure sub_0051CB9C(?:TmwCustomEdit; ?:?);//0051CB9C
    //function sub_0051CBB4(?:TmwCustomEdit):?;//0051CBB4
    procedure sub_0051CBBC(?:TmwCustomEdit);//0051CBBC
    procedure sub_0051CBE4(?:TmwCustomEdit);//0051CBE4
    //function sub_0051CBEC(?:TmwCustomEdit; ?:Integer; ?:Integer):?;//0051CBEC
    //procedure sub_0051CD40(?:TmwCustomEdit; ?:?; ?:?);//0051CD40
    procedure KeyDown(Key:Word; Shift:TShiftState);//0051CE98
    procedure Loaded;//0051CF40
    procedure KeyPress(Key:Char);//0051CF58
    //function sub_0051CFA4(?:TmwCustomEdit; ?:UnicodeString):?;//0051CFA4
    //procedure sub_0051CFF8(?:?);//0051CFF8
    //procedure sub_0051D008(?:?);//0051D008
    procedure MouseDown(Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer);//0051D090
    //function sub_0051D224(?:?; ?:?):?;//0051D224
    procedure MouseMove(Shift:TShiftState; X:Integer; Y:Integer);//0051D2B4
    procedure MouseUp(Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer);//0051D758
    //procedure sub_0051D844(?:?; ?:?);//0051D844
    procedure sub_0051D8FC;//0051D8FC
    //procedure sub_0051DAE4(?:?; ?:?);//0051DAE4
    //procedure sub_0051DCC4(?:?; ?:?; ?:?);//0051DCC4
    //procedure sub_0051E1A4(?:?);//0051E1A4
    //procedure sub_0051E378(?:?; ?:?);//0051E378
    //function sub_0051E3C8(?:?; ?:?):?;//0051E3C8
    //procedure sub_0051E3E8(?:?; ?:?; ?:?; ?:?; ?:?; ?:?);//0051E3E8
    //procedure sub_0051E480(?:?; ?:?);//0051E480
    //function sub_0051E7CC(?:?):?;//0051E7CC
    //procedure sub_0051E814(?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?);//0051E814
    //procedure sub_0051E968(?:?);//0051E968
    //procedure sub_0051EF80(?:?; ?:?; ?:?);//0051EF80
    procedure sub_0051F7D8(?:TmwCustomEdit; ?:TPoint);//0051F7D8
    procedure sub_0051F99C(?:TmwCustomEdit; ?:TPoint);//0051F99C
    //procedure sub_0051FB70(?:TmwCustomEdit; ?:?);//0051FB70
    procedure sub_0051FB94(?:TmwCustomEdit; ?:Integer);//0051FB94
    procedure sub_0051FBB8(?:TmwCustomEdit; ?:TPoint);//0051FBB8
    //procedure sub_0051FBE0(?:?);//0051FBE0
    procedure sub_0051FE40(?:TmwCustomEdit; ?:Integer);//0051FE40
    procedure sub_0051FEB4(?:TmwCustomEdit; ?:Integer);//0051FEB4
    //procedure sub_0051FF54(?:TmwCustomEdit; ?:?);//0051FF54
    procedure SetName(Value:TComponentName);//0051FFCC
    procedure sub_0052008C(?:TmwCustomEdit; ?:UnicodeString);//0052008C
    //procedure sub_005200AC(?:?);//005200AC
    //function sub_00520478(?:?):?;//00520478
    //function sub_00520864(?:?):?;//00520864
    //function sub_00520AA4(?:?):?;//00520AA4
    //procedure sub_00520C80(?:?);//00520C80
    procedure sub_00520D98(?:TmwCustomEdit; ?:Pointer; ?:PWideChar);//00520D98
    procedure sub_00520EA8(?:TmwCustomEdit; ?:TComponentName);//00520EA8
    procedure sub_00520F08(?:TmwCustomEdit; ?:Integer);//00520F08
    procedure sub_00520FA0(?:TmwCustomEdit);//00520FA0
    procedure sub_00520FD0(?:TmwCustomEdit);//00520FD0
    //procedure sub_00521064(?:TmwCustomEdit; ?:?);//00521064
    //procedure WMDropFiles(?:?);//005211B0
    procedure WMEraseBkgnd(Message:TWMEraseBkgnd);//00521304
    //procedure WMGetDlgCode(?:?);//0052130C
    procedure WMHScroll(Message:TWMCommand);//00521344
    procedure WMKillFocus(var Message:TWMKillFocus);//0052141C
    procedure WMSetFocus(var Message:TWMSetFocus);//00521454
    procedure WMSize(var Message:TWMSize);//00521480
    //function sub_005214A8:?;//005214A8
    procedure WMVScroll(Message:TWMHScroll);//005214DC
    //function sub_005217E0(?:?; ?:?):?;//005217E0
    //procedure sub_005219E8(?:?);//005219E8
    //procedure sub_00521A60(?:?; ?:?);//00521A60
    //procedure sub_00521B0C(?:?; ?:?);//00521B0C
    //procedure sub_00521BCC(?:?);//00521BCC
    //procedure sub_00521BF4(?:?; ?:?);//00521BF4
    procedure sub_00521C48(?:TmwCustomEdit);//00521C48
    //procedure sub_00521D44(?:TmwCustomEdit; ?:?);//00521D44
    procedure DblClick;//00521FE0
    function sub_00522054(?:TmwCustomEdit):Boolean;//00522054
    function sub_0052206C(?:TmwCustomEdit):Boolean;//0052206C
    //function sub_00522084:?;//00522084
    //procedure sub_005220B4(?:TmwCustomEdit; ?:?; ?:?; ?:?);//005220B4
    //function sub_00522C8C(?:TmwCustomEdit; ?:TPoint):?;//00522C8C
    //procedure sub_00522CAC(?:TmwCustomEdit; ?:?; ?:?);//00522CAC
    procedure DragOver(Source:TObject; X:Integer; Y:Integer; State:TDragState; Accept:Boolean);//00522CD0
    procedure sub_005232D8(?:TmwCustomEdit);//005232D8
    //function sub_0052357C(?:TmwCustomEdit; ?:?; ?:?):?;//0052357C
    //procedure sub_00525B70(?:?; ?:?);//00525B70
    //procedure sub_00525FDC(?:?; ?:?; ?:?);//00525FDC
    //procedure sub_00526300(?:?; ?:?; ?:?; ?:?; ?:?);//00526300
    //function sub_00526480(?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?):?;//00526480
    //procedure sub_00526C38(?:?; ?:?; ?:?);//00526C38
    //procedure sub_005270D8(?:?; ?:?);//005270D8
    //function sub_005271BC(?:?):?;//005271BC
    //function sub_005272CC(?:?):?;//005272CC
    //function sub_005273E0(?:?):?;//005273E0
    //function sub_005274C8(?:?):?;//005274C8
    procedure sub_005276B8(?:TmwCustomEdit; ?:string);//005276B8
    procedure sub_00527830(?:TmwCustomEdit);//00527830
    procedure sub_00527894(?:TmwCustomEdit);//00527894
    procedure sub_005278B0(?:TmwCustomEdit);//005278B0
    procedure WMMouseWheel(Message:TWMMouseWheel);//005278CC
    procedure sub_005279A4;//005279A4
    //function sub_00527C68(?:?; ?:?; ?:?):?;//00527C68
    //function sub_0052813C(?:TmwCustomEdit; ?:?):?;//0052813C
    procedure WMSetCursor(Message:TWMSetCursor);//00528220
    //procedure sub_0052841C(?:TmwCustomEdit; ?:?);//0052841C
    //procedure sub_005284B8(?:TmwCustomEdit; ?:Integer; ?:?);//005284B8
    //procedure sub_005285F4(?:TmwCustomEdit; ?:?; ?:?);//005285F4
    //procedure sub_00528678(?:TmwCustomEdit; ?:TPoint; ?:Pointer; ?:?);//00528678
    //function sub_005286D8(?:?; ?:?):Boolean;//005286D8
    procedure sub_00528760(?:TmwCustomEdit);//00528760
    //procedure sub_005287FC(?:TmwCustomEdit; ?:?);//005287FC
    procedure sub_00528850(?:TmwCustomEdit);//00528850
    procedure CreateWnd;//00528A78
    procedure DestroyWnd;//00528AA4
    procedure sub_00528AD0(?:TmwCustomEdit);//00528AD0
    //function sub_00528CE0(?:?):?;//00528CE0
    procedure sub_00528D10(?:TmwCustomEdit);//00528D10
    //procedure sub_005291B8(?:TmwCustomEdit; ?:?);//005291B8
    //function sub_005291D8(?:?; ?:?):?;//005291D8
    function GetReadOnly:Boolean;//005292D4
    procedure SetReadOnly(Value:Boolean);//005292DC
    procedure sub_005292E4;//005292E4
    //function sub_00529898(?:?):?;//00529898
    procedure sub_005298A4(?:TUndoList; ?:Integer);//005298A4
    //procedure sub_005298D8(?:TUndoList; ?:?);//005298D8
    //function sub_005299D4:?;//005299D4
    //function sub_00529A38(?:?):Boolean;//00529A38
    //procedure sub_00529A54(?:?);//00529A54
    //procedure sub_00529A58(?:?);//00529A58
    //procedure sub_00529A7C(?:TMark; ?:?);//00529A7C
    //procedure sub_00529AA0(?:?);//00529AA0
    //procedure sub_00529AE0(?:TMark; ?:?);//00529AE0
    procedure sub_00529C34(?:TMarkList);//00529C34
    //function sub_00529C58(?:TMarkList; ?:?):?;//00529C58

implementation

//00516DC0
procedure TmwCustomExport.FormatToken(Token:string; Attribute:TmwHighLightAttributes; IsSpace:Boolean; Tags:Boolean);
begin
{*
>00516DC0    jmp         @AbstractError
*}
end;

//00516DC8
procedure TmwCustomExport.Clear;
begin
{*
 00516DC8    push        ebx
 00516DC9    mov         ebx,eax
 00516DCB    mov         eax,dword ptr [ebx+44];TmwCustomExport.FData:TMemoryStream
 00516DCE    call        TMemoryStream.Clear
 00516DD3    xor         eax,eax
 00516DD5    mov         dword ptr [ebx+34],eax;TmwCustomExport.FFontSize:Integer
 00516DD8    lea         eax,[ebx+48];TmwCustomExport.FLastAttr:TAttribRec
 00516DDB    xor         ecx,ecx
 00516DDD    mov         edx,0C
 00516DE2    call        @FillChar
 00516DE7    pop         ebx
 00516DE8    ret
*}
end;

//00516DEC
procedure TmwCustomExport.CopyToClipboardFormat(AmwEdit:TCustomControl; AmwHighlighter:TmwCustomHighLighter; CbFormat:Integer);
begin
{*
 00516DEC    push        ebp
 00516DED    mov         ebp,esp
 00516DEF    push        ecx
 00516DF0    push        ebx
 00516DF1    push        esi
 00516DF2    mov         dword ptr [ebp-4],ecx
 00516DF5    mov         esi,eax
 00516DF7    mov         ebx,dword ptr [ebp+8]
 00516DFA    mov         dword ptr [esi+58],ebx;TmwCustomExport.FExportInFormat:Integer
 00516DFD    mov         ecx,dword ptr [ebp-4]
 00516E00    mov         eax,esi
 00516E02    call        00516F24
 00516E07    mov         edx,ebx
 00516E09    mov         eax,esi
 00516E0B    call        00516E40
 00516E10    mov         eax,esi
 00516E12    mov         edx,dword ptr [eax]
 00516E14    call        dword ptr [edx+64];TmwCustomExport.Clear
 00516E17    pop         esi
 00516E18    pop         ebx
 00516E19    pop         ecx
 00516E1A    pop         ebp
 00516E1B    ret         4
*}
end;

//00516E20
procedure TmwCustomExport.CopyToClipboard(AmwEdit:TCustomControl; AmwHighlighter:TmwCustomHighLighter);
begin
{*
 00516E20    push        ebx
 00516E21    push        esi
 00516E22    push        edi
 00516E23    mov         edi,ecx
 00516E25    mov         esi,edx
 00516E27    mov         ebx,eax
 00516E29    mov         eax,ebx
 00516E2B    mov         edx,dword ptr [eax]
 00516E2D    call        dword ptr [edx+4C];TmwCustomExport.sub_00517588
 00516E30    push        eax
 00516E31    mov         ecx,edi
 00516E33    mov         edx,esi
 00516E35    mov         eax,ebx
 00516E37    mov         ebx,dword ptr [eax]
 00516E39    call        dword ptr [ebx+5C];TmwCustomExport.CopyToClipboardFormat
 00516E3C    pop         edi
 00516E3D    pop         esi
 00516E3E    pop         ebx
 00516E3F    ret
*}
end;

//00516E40
procedure sub_00516E40(?:TmwCustomExport; ?:Integer);
begin
{*
 00516E40    push        ebp
 00516E41    mov         ebp,esp
 00516E43    add         esp,0FFFFFFF4
 00516E46    push        ebx
 00516E47    push        esi
 00516E48    push        edi
 00516E49    mov         dword ptr [ebp-4],edx
 00516E4C    mov         ebx,eax
 00516E4E    mov         eax,dword ptr [ebx+44];TmwCustomExport.FData:TMemoryStream
 00516E51    mov         cx,2
 00516E55    xor         edx,edx
 00516E57    mov         esi,dword ptr [eax]
 00516E59    call        dword ptr [esi+14];TCustomMemoryStream.Seek
 00516E5C    mov         word ptr [ebp-0A],0
 00516E62    lea         edx,[ebp-0A]
 00516E65    mov         eax,dword ptr [ebx+44];TmwCustomExport.FData:TMemoryStream
 00516E68    mov         ecx,1
 00516E6D    mov         esi,dword ptr [eax]
 00516E6F    call        dword ptr [esi+10];TMemoryStream.Write
 00516E72    push        0
 00516E74    push        0
 00516E76    mov         eax,dword ptr [ebx+44];TmwCustomExport.FData:TMemoryStream
 00516E79    call        TStream.SetPosition
 00516E7E    mov         eax,dword ptr [ebx+44];TmwCustomExport.FData:TMemoryStream
 00516E81    mov         edx,dword ptr [eax]
 00516E83    call        dword ptr [edx];TStream.GetSize
 00516E85    push        eax
 00516E86    push        2042
 00516E8B    call        kernel32.GlobalAlloc
 00516E90    mov         dword ptr [ebp-8],eax
 00516E93    cmp         dword ptr [ebp-8],0
>00516E97    je          00516F17
 00516E99    mov         eax,dword ptr [ebp-8]
 00516E9C    push        eax
 00516E9D    call        kernel32.GlobalLock
 00516EA2    mov         esi,eax
 00516EA4    test        esi,esi
>00516EA6    je          00516F07
 00516EA8    xor         eax,eax
 00516EAA    push        ebp
 00516EAB    push        516EED
 00516EB0    push        dword ptr fs:[eax]
 00516EB3    mov         dword ptr fs:[eax],esp
 00516EB6    mov         edi,dword ptr [ebx+44];TmwCustomExport.FData:TMemoryStream
 00516EB9    mov         eax,edi
 00516EBB    mov         edx,dword ptr [eax]
 00516EBD    call        dword ptr [edx];TStream.GetSize
 00516EBF    mov         ecx,eax
 00516EC1    mov         edx,esi
 00516EC3    mov         eax,edi
 00516EC5    mov         esi,dword ptr [eax]
 00516EC7    call        dword ptr [esi+0C];TCustomMemoryStream.Read
 00516ECA    push        0
 00516ECC    push        0
 00516ECE    mov         eax,dword ptr [ebx+44];TmwCustomExport.FData:TMemoryStream
 00516ED1    call        TStream.SetPosition
 00516ED6    xor         eax,eax
 00516ED8    pop         edx
 00516ED9    pop         ecx
 00516EDA    pop         ecx
 00516EDB    mov         dword ptr fs:[eax],edx
 00516EDE    push        516EF4
 00516EE3    mov         eax,dword ptr [ebp-8]
 00516EE6    push        eax
 00516EE7    call        kernel32.GlobalUnlock
 00516EEC    ret
>00516EED    jmp         @HandleFinally
>00516EF2    jmp         00516EE3
 00516EF4    call        Clipboard
 00516EF9    mov         ecx,dword ptr [ebp-8]
 00516EFC    movzx       edx,word ptr [ebp-4]
 00516F00    call        TClipboard.SetAsHandle
>00516F05    jmp         00516F1C
 00516F07    mov         eax,dword ptr [ebp-8]
 00516F0A    push        eax
 00516F0B    call        kernel32.GlobalFree
 00516F10    call        OutOfMemoryError
>00516F15    jmp         00516F1C
 00516F17    call        OutOfMemoryError
 00516F1C    pop         edi
 00516F1D    pop         esi
 00516F1E    pop         ebx
 00516F1F    mov         esp,ebp
 00516F21    pop         ebp
 00516F22    ret
*}
end;

//00516F24
procedure sub_00516F24(?:TmwCustomExport; ?:TCustomControl; ?:TmwCustomHighLighter);
begin
{*
 00516F24    push        ebp
 00516F25    mov         ebp,esp
 00516F27    add         esp,0FFFFFFD8
 00516F2A    push        ebx
 00516F2B    push        esi
 00516F2C    push        edi
 00516F2D    xor         ebx,ebx
 00516F2F    mov         dword ptr [ebp-4],ebx
 00516F32    mov         dword ptr [ebp-8],ebx
 00516F35    mov         ebx,ecx
 00516F37    mov         esi,edx
 00516F39    mov         dword ptr [ebp-0C],eax
 00516F3C    xor         eax,eax
 00516F3E    push        ebp
 00516F3F    push        517091
 00516F44    push        dword ptr fs:[eax]
 00516F47    mov         dword ptr fs:[eax],esp
 00516F4A    mov         eax,esi
 00516F4C    mov         edx,dword ptr ds:[5192F0];TmwCustomEdit
 00516F52    call        @AsClass
 00516F57    mov         dword ptr [ebp-24],eax
 00516F5A    lea         edx,[ebp-18]
 00516F5D    mov         eax,dword ptr [ebp-24]
 00516F60    call        0051C570
 00516F65    lea         edx,[ebp-20]
 00516F68    mov         eax,dword ptr [ebp-24]
 00516F6B    call        0051C5CC
 00516F70    mov         eax,dword ptr [ebp-20]
 00516F73    cmp         eax,dword ptr [ebp-18]
>00516F76    jne         00516F85
 00516F78    mov         eax,dword ptr [ebp-14]
 00516F7B    cmp         eax,dword ptr [ebp-1C]
>00516F7E    jne         00516F85
 00516F80    call        Abort
 00516F85    mov         eax,dword ptr [ebp-1C]
 00516F88    mov         esi,dword ptr [ebp-14]
 00516F8B    sub         eax,esi
 00516F8D    inc         eax
 00516F8E    push        eax
 00516F8F    mov         ecx,ebx
 00516F91    mov         edx,dword ptr [ebp-24]
 00516F94    mov         eax,dword ptr [ebp-0C]
 00516F97    mov         edi,dword ptr [eax]
 00516F99    call        dword ptr [edi+3C];TmwCustomExport.sub_00517148
 00516F9C    mov         edx,esi
 00516F9E    dec         edx
 00516F9F    mov         eax,dword ptr [ebp-24]
 00516FA2    mov         eax,dword ptr [eax+2A4];TmwCustomEdit.fLines:TStrings
 00516FA8    mov         ecx,dword ptr [eax]
 00516FAA    call        dword ptr [ecx+18];TStrings.sub_004483A0
 00516FAD    mov         edx,eax
 00516FAF    mov         eax,ebx
 00516FB1    mov         ecx,dword ptr [eax]
 00516FB3    call        dword ptr [ecx+7C];TmwCustomHighLighter.SetRange
 00516FB6    mov         eax,dword ptr [ebp-20]
 00516FB9    mov         dword ptr [ebp-10],eax
 00516FBC    mov         esi,dword ptr [ebp-14]
 00516FBF    dec         esi
 00516FC0    mov         eax,dword ptr [ebp-1C]
 00516FC3    dec         eax
 00516FC4    sub         eax,esi
>00516FC6    jl          00517039
 00516FC8    inc         eax
 00516FC9    mov         dword ptr [ebp-28],eax
 00516FCC    lea         ecx,[ebp-4]
 00516FCF    mov         eax,dword ptr [ebp-24]
 00516FD2    mov         eax,dword ptr [eax+2A4];TmwCustomEdit.fLines:TStrings
 00516FD8    mov         edx,esi
 00516FDA    mov         edi,dword ptr [eax]
 00516FDC    call        dword ptr [edi+0C];TStrings.Get
 00516FDF    mov         eax,dword ptr [ebp-14]
 00516FE2    dec         eax
 00516FE3    cmp         esi,eax
>00516FE5    jne         00516FFD
 00516FE7    mov         edi,dword ptr [ebp-18]
 00516FEA    dec         edi
 00516FEB    mov         ecx,edi
 00516FED    lea         eax,[ebp-4]
 00516FF0    mov         edx,1
 00516FF5    call        @UStrDelete
 00516FFA    sub         dword ptr [ebp-10],edi
 00516FFD    mov         eax,dword ptr [ebp-1C]
 00517000    dec         eax
 00517001    cmp         esi,eax
>00517003    jne         00517015
 00517005    lea         eax,[ebp-4]
 00517008    mov         ecx,7FFFFFFF
 0051700D    mov         edx,dword ptr [ebp-10]
 00517010    call        @UStrDelete
 00517015    mov         edx,dword ptr [ebp-4]
 00517018    mov         eax,ebx
 0051701A    mov         ecx,dword ptr [eax]
 0051701C    call        dword ptr [ecx+78];TmwCustomHighLighter.SetLineForExport
>0051701F    jmp         00517028
 00517021    mov         eax,ebx
 00517023    mov         edx,dword ptr [eax]
 00517025    call        dword ptr [edx+54];TmwCustomHighLighter.ExportNext
 00517028    mov         eax,ebx
 0051702A    mov         edx,dword ptr [eax]
 0051702C    call        dword ptr [edx+58];TmwCustomHighLighter.GetEol
 0051702F    test        al,al
>00517031    je          00517021
 00517033    inc         esi
 00517034    dec         dword ptr [ebp-28]
>00517037    jne         00516FCC
 00517039    mov         eax,dword ptr [ebp-0C]
 0051703C    mov         ebx,dword ptr [eax+44];TmwCustomExport.FData:TMemoryStream
 0051703F    mov         eax,ebx
 00517041    call        TStream.GetPosition
 00517046    mov         edx,eax
 00517048    sub         edx,2
 0051704B    mov         eax,ebx
 0051704D    mov         ecx,dword ptr [eax]
 0051704F    call        dword ptr [ecx+4];TMemoryStream.SetSize
 00517052    lea         edx,[ebp-4]
 00517055    mov         eax,dword ptr [ebp-0C]
 00517058    mov         ecx,dword ptr [eax]
 0051705A    call        dword ptr [ecx+40];@AbstractError
 0051705D    lea         edx,[ebp-8]
 00517060    mov         eax,dword ptr [ebp-0C]
 00517063    mov         ecx,dword ptr [eax]
 00517065    call        dword ptr [ecx+44];@AbstractError
 00517068    lea         ecx,[ebp-8]
 0051706B    lea         edx,[ebp-4]
 0051706E    mov         eax,dword ptr [ebp-0C]
 00517071    call        005171E4
 00517076    xor         eax,eax
 00517078    pop         edx
 00517079    pop         ecx
 0051707A    pop         ecx
 0051707B    mov         dword ptr fs:[eax],edx
 0051707E    push        517098
 00517083    lea         eax,[ebp-8]
 00517086    mov         edx,2
 0051708B    call        @UStrArrayClr
 00517090    ret
>00517091    jmp         @HandleFinally
>00517096    jmp         00517083
 00517098    pop         edi
 00517099    pop         esi
 0051709A    pop         ebx
 0051709B    mov         esp,ebp
 0051709D    pop         ebp
 0051709E    ret
*}
end;

//005170A0
constructor TmwCustomExport.Create(AOwner:TComponent);
begin
{*
 005170A0    push        ebx
 005170A1    push        esi
 005170A2    test        dl,dl
>005170A4    je          005170AE
 005170A6    add         esp,0FFFFFFF0
 005170A9    call        @ClassCreate
 005170AE    mov         ebx,edx
 005170B0    mov         esi,eax
 005170B2    xor         edx,edx
 005170B4    mov         eax,esi
 005170B6    call        TComponent.Create
 005170BB    mov         dl,1
 005170BD    mov         eax,[0043DAFC];TMemoryStream
 005170C2    call        TObject.Create;TMemoryStream.Create
 005170C7    mov         dword ptr [esi+44],eax;TmwCustomExport.FData:TMemoryStream
 005170CA    lea         eax,[esi+38];TmwCustomExport.FTitle:string
 005170CD    mov         edx,517100;'(Untitled)'
 005170D2    call        @UStrAsg
 005170D7    mov         eax,esi
 005170D9    test        bl,bl
>005170DB    je          005170EC
 005170DD    call        @AfterConstruction
 005170E2    pop         dword ptr fs:[0]
 005170E9    add         esp,0C
 005170EC    mov         eax,esi
 005170EE    pop         esi
 005170EF    pop         ebx
 005170F0    ret
*}
end;

//00517118
destructor TmwCustomExport.Destroy();
begin
{*
 00517118    push        ebx
 00517119    push        esi
 0051711A    call        @BeforeDestruction
 0051711F    mov         ebx,edx
 00517121    mov         esi,eax
 00517123    mov         eax,dword ptr [esi+44];TmwCustomExport.FData:TMemoryStream
 00517126    call        TObject.Free
 0051712B    mov         edx,ebx
 0051712D    and         dl,0FC
 00517130    mov         eax,esi
 00517132    call        TComponent.Destroy
 00517137    test        bl,bl
>00517139    jle         00517142
 0051713B    mov         eax,esi
 0051713D    call        @ClassDestroy
 00517142    pop         esi
 00517143    pop         ebx
 00517144    ret
*}
end;

//00517148
{*procedure sub_00517148(?:?; ?:?; ?:?);
begin
 00517148    push        ebp
 00517149    mov         ebp,esp
 0051714B    push        ebx
 0051714C    push        esi
 0051714D    push        edi
 0051714E    mov         edi,ecx
 00517150    mov         esi,edx
 00517152    mov         ebx,eax
 00517154    test        esi,esi
>00517156    je          00517171
 00517158    mov         eax,esi
 0051715A    mov         edx,dword ptr ds:[5192F0];TmwCustomEdit
 00517160    call        @IsClass
 00517165    test        al,al
>00517167    je          00517171
 00517169    test        edi,edi
>0051716B    je          00517171
 0051716D    test        edi,edi
>0051716F    jne         00517187
 00517171    mov         ecx,5171C0;'Invalid Parameter'
 00517176    mov         dl,1
 00517178    mov         eax,[00418C04];Exception
 0051717D    call        Exception.Create;Exception.Create
 00517182    call        @RaiseExcept
 00517187    mov         dword ptr [edi+48],ebx
 0051718A    mov         eax,esi
 0051718C    mov         edx,dword ptr ds:[5192F0];TmwCustomEdit
 00517192    call        @AsClass
 00517197    mov         dword ptr [ebx+54],eax;TmwCustomExport.FControl:TCustomControl
 0051719A    mov         eax,ebx
 0051719C    mov         edx,dword ptr [eax]
 0051719E    call        dword ptr [edx+64];TmwCustomExport.Clear
 005171A1    imul        edx,dword ptr [ebp+8],64
 005171A5    mov         eax,dword ptr [ebx+44];TmwCustomExport.FData:TMemoryStream
 005171A8    mov         ecx,dword ptr [eax]
 005171AA    call        dword ptr [ecx+4];TMemoryStream.SetSize
 005171AD    pop         edi
 005171AE    pop         esi
 005171AF    pop         ebx
 005171B0    pop         ebp
 005171B1    ret         4
end;*}

//005171E4
{*procedure sub_005171E4(?:TmwCustomExport; ?:UnicodeString; ?:?);
begin
 005171E4    push        ebx
 005171E5    push        esi
 005171E6    push        edi
 005171E7    push        ebp
 005171E8    add         esp,0FFFFFFF8
 005171EB    mov         esi,ecx
 005171ED    mov         edi,edx
 005171EF    mov         ebx,eax
 005171F1    mov         eax,dword ptr [edi]
 005171F3    mov         dword ptr [esp+4],eax
 005171F7    mov         eax,dword ptr [esp+4]
 005171FB    test        eax,eax
>005171FD    je          00517204
 005171FF    sub         eax,4
 00517202    mov         eax,dword ptr [eax]
 00517204    test        eax,eax
>00517206    je          0051729C
 0051720C    mov         eax,dword ptr [ebx+44];TmwCustomExport.FData:TMemoryStream
 0051720F    call        TStream.GetPosition
 00517214    mov         dword ptr [esp],eax
 00517217    mov         eax,dword ptr [edi]
 00517219    mov         dword ptr [esp+4],eax
 0051721D    mov         ebp,dword ptr [esp+4]
 00517221    test        ebp,ebp
>00517223    je          0051722B
 00517225    sub         ebp,4
 00517228    mov         ebp,dword ptr [ebp]
 0051722B    mov         eax,dword ptr [ebx+44];TmwCustomExport.FData:TMemoryStream
 0051722E    call        TStream.GetPosition
 00517233    mov         edx,eax
 00517235    add         edx,ebp
 00517237    mov         eax,dword ptr [ebx+44];TmwCustomExport.FData:TMemoryStream
 0051723A    mov         ecx,dword ptr [eax]
 0051723C    call        dword ptr [ecx+4];TMemoryStream.SetSize
 0051723F    mov         eax,dword ptr [ebx+44];TmwCustomExport.FData:TMemoryStream
 00517242    mov         ebp,dword ptr [eax+4];TMemoryStream.FMemory:Pointer
 00517245    mov         edx,ebp
 00517247    mov         eax,dword ptr [edi]
 00517249    mov         dword ptr [esp+4],eax
 0051724D    mov         eax,dword ptr [esp+4]
 00517251    test        eax,eax
>00517253    je          0051725A
 00517255    sub         eax,4
 00517258    mov         eax,dword ptr [eax]
 0051725A    add         eax,eax
 0051725C    add         edx,eax
 0051725E    mov         eax,ebp
 00517260    mov         ecx,dword ptr [esp]
 00517263    call        Move
 00517268    push        0
 0051726A    push        0
 0051726C    mov         eax,dword ptr [ebx+44];TmwCustomExport.FData:TMemoryStream
 0051726F    call        TStream.SetPosition
 00517274    mov         eax,edi
 00517276    call        @UniqueStringU
 0051727B    mov         ebp,eax
 0051727D    mov         eax,dword ptr [edi]
 0051727F    mov         dword ptr [esp+4],eax
 00517283    mov         eax,dword ptr [esp+4]
 00517287    test        eax,eax
>00517289    je          00517290
 0051728B    sub         eax,4
 0051728E    mov         eax,dword ptr [eax]
 00517290    mov         ecx,eax
 00517292    mov         edx,ebp
 00517294    mov         eax,dword ptr [ebx+44];TmwCustomExport.FData:TMemoryStream
 00517297    mov         edi,dword ptr [eax]
 00517299    call        dword ptr [edi+10];TMemoryStream.Write
 0051729C    mov         eax,dword ptr [esi]
 0051729E    mov         dword ptr [esp+4],eax
 005172A2    mov         eax,dword ptr [esp+4]
 005172A6    test        eax,eax
>005172A8    je          005172AF
 005172AA    sub         eax,4
 005172AD    mov         eax,dword ptr [eax]
 005172AF    test        eax,eax
>005172B1    je          005172E9
 005172B3    mov         cx,2
 005172B7    xor         edx,edx
 005172B9    mov         eax,dword ptr [ebx+44];TmwCustomExport.FData:TMemoryStream
 005172BC    mov         edi,dword ptr [eax]
 005172BE    call        dword ptr [edi+14];TCustomMemoryStream.Seek
 005172C1    mov         eax,esi
 005172C3    call        @UniqueStringU
 005172C8    mov         edi,eax
 005172CA    mov         eax,dword ptr [esi]
 005172CC    mov         dword ptr [esp+4],eax
 005172D0    mov         eax,dword ptr [esp+4]
 005172D4    test        eax,eax
>005172D6    je          005172DD
 005172D8    sub         eax,4
 005172DB    mov         eax,dword ptr [eax]
 005172DD    mov         ecx,eax
 005172DF    mov         edx,edi
 005172E1    mov         eax,dword ptr [ebx+44];TmwCustomExport.FData:TMemoryStream
 005172E4    mov         ebx,dword ptr [eax]
 005172E6    call        dword ptr [ebx+10];TMemoryStream.Write
 005172E9    pop         ecx
 005172EA    pop         edx
 005172EB    pop         ebp
 005172EC    pop         edi
 005172ED    pop         esi
 005172EE    pop         ebx
 005172EF    ret
end;*}

//005172F0
procedure TmwCustomExport.RunExport(StartLine:Integer; StopLine:Integer; AmwHighlighter:TmwCustomHighLighter; AmwEdit:TCustomControl);
begin
{*
 005172F0    push        ebp
 005172F1    mov         ebp,esp
 005172F3    add         esp,0FFFFFFF0
 005172F6    push        esi
 005172F7    mov         esi,eax
 005172F9    mov         dword ptr [ebp-8],1
 00517300    mov         dword ptr [ebp-4],edx
 00517303    mov         dword ptr [ebp-10],7FFFFFFF
 0051730A    mov         dword ptr [ebp-0C],ecx
 0051730D    mov         eax,dword ptr [ebp+0C]
 00517310    push        eax
 00517311    mov         eax,dword ptr [ebp+8]
 00517314    push        eax
 00517315    lea         ecx,[ebp-10]
 00517318    lea         edx,[ebp-8]
 0051731B    mov         eax,esi
 0051731D    call        TmwCustomExport.RunExportBlock
 00517322    pop         esi
 00517323    mov         esp,ebp
 00517325    pop         ebp
 00517326    ret         8
*}
end;

//0051732C
procedure TmwCustomExport.RunExportBlock(ExportStart:TPoint; ExportEnd:TPoint; AmwHighlighter:TmwCustomHighLighter; AmwEdit:TCustomControl);
begin
{*
 0051732C    push        ebp
 0051732D    mov         ebp,esp
 0051732F    add         esp,0FFFFFFD4
 00517332    push        ebx
 00517333    push        esi
 00517334    push        edi
 00517335    xor         ebx,ebx
 00517337    mov         dword ptr [ebp-4],ebx
 0051733A    mov         dword ptr [ebp-8],ebx
 0051733D    mov         dword ptr [ebp-0C],ebx
 00517340    mov         esi,ecx
 00517342    lea         edi,[ebp-20]
 00517345    movs        dword ptr [edi],dword ptr [esi]
 00517346    movs        dword ptr [edi],dword ptr [esi]
 00517347    mov         esi,edx
 00517349    lea         edi,[ebp-18]
 0051734C    movs        dword ptr [edi],dword ptr [esi]
 0051734D    movs        dword ptr [edi],dword ptr [esi]
 0051734E    mov         dword ptr [ebp-10],eax
 00517351    mov         ebx,dword ptr [ebp+8]
 00517354    xor         eax,eax
 00517356    push        ebp
 00517357    push        5174AE
 0051735C    push        dword ptr fs:[eax]
 0051735F    mov         dword ptr fs:[eax],esp
 00517362    mov         eax,dword ptr [ebp-18]
 00517365    cmp         eax,dword ptr [ebp-20]
>00517368    jne         00517377
 0051736A    mov         eax,dword ptr [ebp-14]
 0051736D    cmp         eax,dword ptr [ebp-1C]
>00517370    jne         00517377
 00517372    call        Abort
 00517377    mov         eax,dword ptr [ebp+0C]
 0051737A    mov         edx,dword ptr ds:[5192F0];TmwCustomEdit
 00517380    call        @AsClass
 00517385    mov         dword ptr [ebp-28],eax
 00517388    mov         eax,dword ptr [ebp-1C]
 0051738B    sub         eax,dword ptr [ebp-14]
 0051738E    inc         eax
 0051738F    push        eax
 00517390    mov         ecx,ebx
 00517392    mov         edx,dword ptr [ebp-28]
 00517395    mov         eax,dword ptr [ebp-10]
 00517398    mov         esi,dword ptr [eax]
 0051739A    call        dword ptr [esi+3C];TmwCustomExport.sub_00517148
 0051739D    mov         edx,dword ptr [ebp-14]
 005173A0    dec         edx
 005173A1    mov         eax,dword ptr [ebp-28]
 005173A4    mov         eax,dword ptr [eax+2A4];TmwCustomEdit.fLines:TStrings
 005173AA    mov         ecx,dword ptr [eax]
 005173AC    call        dword ptr [ecx+18];TStrings.sub_004483A0
 005173AF    mov         edx,eax
 005173B1    mov         eax,ebx
 005173B3    mov         ecx,dword ptr [eax]
 005173B5    call        dword ptr [ecx+7C];TmwCustomHighLighter.SetRange
 005173B8    mov         eax,dword ptr [ebp-20]
 005173BB    mov         dword ptr [ebp-24],eax
 005173BE    xor         eax,eax
 005173C0    push        ebp
 005173C1    push        517479
 005173C6    push        dword ptr fs:[eax]
 005173C9    mov         dword ptr fs:[eax],esp
 005173CC    mov         esi,dword ptr [ebp-14]
 005173CF    dec         esi
 005173D0    mov         eax,dword ptr [ebp-1C]
 005173D3    dec         eax
 005173D4    sub         eax,esi
>005173D6    jl          0051744B
 005173D8    inc         eax
 005173D9    mov         dword ptr [ebp-2C],eax
 005173DC    lea         ecx,[ebp-0C]
 005173DF    mov         eax,dword ptr [ebp-28]
 005173E2    mov         eax,dword ptr [eax+2A4];TmwCustomEdit.fLines:TStrings
 005173E8    mov         edx,esi
 005173EA    mov         edi,dword ptr [eax]
 005173EC    call        dword ptr [edi+0C];TStrings.Get
 005173EF    mov         eax,dword ptr [ebp-14]
 005173F2    dec         eax
 005173F3    cmp         esi,eax
>005173F5    jne         0051740F
 005173F7    mov         ecx,dword ptr [ebp-18]
 005173FA    dec         ecx
 005173FB    lea         eax,[ebp-0C]
 005173FE    mov         edx,1
 00517403    call        @UStrDelete
 00517408    mov         eax,dword ptr [ebp-18]
 0051740B    dec         eax
 0051740C    sub         dword ptr [ebp-24],eax
 0051740F    mov         eax,dword ptr [ebp-1C]
 00517412    dec         eax
 00517413    cmp         esi,eax
>00517415    jne         00517427
 00517417    lea         eax,[ebp-0C]
 0051741A    mov         ecx,7FFFFFFF
 0051741F    mov         edx,dword ptr [ebp-24]
 00517422    call        @UStrDelete
 00517427    mov         edx,dword ptr [ebp-0C]
 0051742A    mov         eax,ebx
 0051742C    mov         ecx,dword ptr [eax]
 0051742E    call        dword ptr [ecx+78];TmwCustomHighLighter.SetLineForExport
>00517431    jmp         0051743A
 00517433    mov         eax,ebx
 00517435    mov         edx,dword ptr [eax]
 00517437    call        dword ptr [edx+54];TmwCustomHighLighter.ExportNext
 0051743A    mov         eax,ebx
 0051743C    mov         edx,dword ptr [eax]
 0051743E    call        dword ptr [edx+58];TmwCustomHighLighter.GetEol
 00517441    test        al,al
>00517443    je          00517433
 00517445    inc         esi
 00517446    dec         dword ptr [ebp-2C]
>00517449    jne         005173DC
 0051744B    lea         edx,[ebp-4]
 0051744E    mov         eax,dword ptr [ebp-10]
 00517451    mov         ecx,dword ptr [eax]
 00517453    call        dword ptr [ecx+40];@AbstractError
 00517456    lea         edx,[ebp-8]
 00517459    mov         eax,dword ptr [ebp-10]
 0051745C    mov         ecx,dword ptr [eax]
 0051745E    call        dword ptr [ecx+44];@AbstractError
 00517461    lea         ecx,[ebp-8]
 00517464    lea         edx,[ebp-4]
 00517467    mov         eax,dword ptr [ebp-10]
 0051746A    call        005171E4
 0051746F    xor         eax,eax
 00517471    pop         edx
 00517472    pop         ecx
 00517473    pop         ecx
 00517474    mov         dword ptr fs:[eax],edx
>00517477    jmp         00517493
>00517479    jmp         @HandleAnyException
 0051747E    mov         eax,dword ptr [ebp-10]
 00517481    mov         eax,dword ptr [eax+44];TmwCustomExport.FData:TMemoryStream
 00517484    call        TMemoryStream.Clear
 00517489    call        @RaiseAgain
 0051748E    call        @DoneExcept
 00517493    xor         eax,eax
 00517495    pop         edx
 00517496    pop         ecx
 00517497    pop         ecx
 00517498    mov         dword ptr fs:[eax],edx
 0051749B    push        5174B5
 005174A0    lea         eax,[ebp-0C]
 005174A3    mov         edx,3
 005174A8    call        @UStrArrayClr
 005174AD    ret
>005174AE    jmp         @HandleFinally
>005174B3    jmp         005174A0
 005174B5    pop         edi
 005174B6    pop         esi
 005174B7    pop         ebx
 005174B8    mov         esp,ebp
 005174BA    pop         ebp
 005174BB    ret         8
*}
end;

//005174C0
procedure TmwCustomExport.SaveToFile(FileName:string);
begin
{*
 005174C0    push        ebx
 005174C1    push        esi
 005174C2    mov         esi,edx
 005174C4    mov         ebx,eax
 005174C6    push        0
 005174C8    push        0
 005174CA    mov         eax,dword ptr [ebx+44];TmwCustomExport.FData:TMemoryStream
 005174CD    call        TStream.SetPosition
 005174D2    mov         edx,esi
 005174D4    mov         eax,dword ptr [ebx+44];TmwCustomExport.FData:TMemoryStream
 005174D7    call        TCustomMemoryStream.SaveToFile
 005174DC    pop         esi
 005174DD    pop         ebx
 005174DE    ret
*}
end;

//005174E0
procedure TmwCustomExport.SaveToStream(Stream:TStream);
begin
{*
 005174E0    push        ebx
 005174E1    push        esi
 005174E2    mov         esi,edx
 005174E4    mov         ebx,eax
 005174E6    push        0
 005174E8    push        0
 005174EA    mov         eax,dword ptr [ebx+44];TmwCustomExport.FData:TMemoryStream
 005174ED    call        TStream.SetPosition
 005174F2    mov         edx,esi
 005174F4    mov         eax,dword ptr [ebx+44];TmwCustomExport.FData:TMemoryStream
 005174F7    call        TCustomMemoryStream.SaveToStream
 005174FC    pop         esi
 005174FD    pop         ebx
 005174FE    ret
*}
end;

//00517588
{*function sub_00517588:?;
begin
 00517588    mov         eax,1
 0051758D    ret
end;*}

//00517590
{*procedure sub_00517590(?:?);
begin
 00517590    push        ebx
 00517591    push        esi
 00517592    mov         esi,edx
 00517594    mov         ebx,eax
 00517596    mov         eax,esi
 00517598    mov         edx,dword ptr [ebx+40];TmwCustomExport.FDefaultFilter:string
 0051759B    call        @UStrAsg
 005175A0    pop         esi
 005175A1    pop         ebx
 005175A2    ret
end;*}

//005175A4
{*procedure sub_005175A4(?:?);
begin
 005175A4    push        ebp
 005175A5    mov         ebp,esp
 005175A7    push        ecx
 005175A8    push        ebx
 005175A9    mov         dword ptr [ebp-4],edx
 005175AC    mov         ebx,eax
 005175AE    mov         eax,dword ptr [ebp-4]
 005175B1    call        @UStrAddRef
 005175B6    xor         eax,eax
 005175B8    push        ebp
 005175B9    push        5175F2
 005175BE    push        dword ptr fs:[eax]
 005175C1    mov         dword ptr fs:[eax],esp
 005175C4    mov         eax,dword ptr [ebx+40];TmwCustomExport.FDefaultFilter:string
 005175C7    mov         edx,dword ptr [ebp-4]
 005175CA    call        @UStrEqual
>005175CF    je          005175DC
 005175D1    lea         eax,[ebx+40];TmwCustomExport.FDefaultFilter:string
 005175D4    mov         edx,dword ptr [ebp-4]
 005175D7    call        @UStrAsg
 005175DC    xor         eax,eax
 005175DE    pop         edx
 005175DF    pop         ecx
 005175E0    pop         ecx
 005175E1    mov         dword ptr fs:[eax],edx
 005175E4    push        5175F9
 005175E9    lea         eax,[ebp-4]
 005175EC    call        @UStrClr
 005175F1    ret
>005175F2    jmp         @HandleFinally
>005175F7    jmp         005175E9
 005175F9    pop         ebx
 005175FA    pop         ecx
 005175FB    pop         ebp
 005175FC    ret
end;*}

//00517600
function TmwCustomExport.GetSharedExporter:TmwCustomExport;
begin
{*
 00517600    xor         eax,eax
 00517602    ret
*}
end;

//00517604
{*function sub_00517604:?;
begin
 00517604    xor         eax,eax
 00517606    cmp         dword ptr ds:[793B20],0;gvar_00793B20
>0051760D    je          00517617
 0051760F    mov         eax,[00793B20];gvar_00793B20
 00517614    mov         eax,dword ptr [eax+8]
 00517617    ret
end;*}

//00517618
{*function sub_00517618(?:?):?;
begin
 00517618    push        ebx
 00517619    mov         ebx,eax
 0051761B    xor         eax,eax
 0051761D    test        ebx,ebx
>0051761F    jl          00517644
 00517621    cmp         dword ptr ds:[793B20],0;gvar_00793B20
>00517628    je          00517644
 0051762A    mov         edx,dword ptr ds:[793B20];gvar_00793B20
 00517630    cmp         ebx,dword ptr [edx+8]
>00517633    jge         00517644
 00517635    mov         edx,ebx
 00517637    mov         eax,[00793B20];gvar_00793B20
 0051763C    call        TList.Get
 00517641    call        dword ptr [eax+58]
 00517644    pop         ebx
 00517645    ret
end;*}

//0051B7DC
{*procedure sub_0051B7DC(?:TPoint; ?:?; ?:?);
begin
 0051B7DC    push        ebx
 0051B7DD    push        esi
 0051B7DE    push        edi
 0051B7DF    add         esp,0FFFFFFF0
 0051B7E2    mov         esi,edx
 0051B7E4    lea         edi,[esp+8]
 0051B7E8    movs        dword ptr [edi],dword ptr [esi]
 0051B7E9    movs        dword ptr [edi],dword ptr [esi]
 0051B7EA    mov         esi,eax
 0051B7EC    lea         edi,[esp]
 0051B7EF    movs        dword ptr [edi],dword ptr [esi]
 0051B7F0    movs        dword ptr [edi],dword ptr [esi]
 0051B7F1    mov         ebx,ecx
 0051B7F3    mov         eax,dword ptr [esp]
 0051B7F6    mov         dword ptr [ebx],eax
 0051B7F8    mov         eax,dword ptr [esp+4]
 0051B7FC    mov         dword ptr [ebx+4],eax
 0051B7FF    mov         eax,dword ptr [esp+0C]
 0051B803    cmp         eax,dword ptr [esp+4]
>0051B807    jg          0051B81C
 0051B809    mov         eax,dword ptr [esp+0C]
 0051B80D    cmp         eax,dword ptr [esp+4]
>0051B811    jne         0051B829
 0051B813    mov         eax,dword ptr [esp+8]
 0051B817    cmp         eax,dword ptr [esp]
>0051B81A    jle         0051B829
 0051B81C    mov         eax,dword ptr [esp+8]
 0051B820    mov         dword ptr [ebx],eax
 0051B822    mov         eax,dword ptr [esp+0C]
 0051B826    mov         dword ptr [ebx+4],eax
 0051B829    add         esp,10
 0051B82C    pop         edi
 0051B82D    pop         esi
 0051B82E    pop         ebx
 0051B82F    ret
end;*}

//0051B830
procedure sub_0051B830(?:TPoint; ?:TPoint; ?:TPoint);
begin
{*
 0051B830    push        ebx
 0051B831    push        esi
 0051B832    push        edi
 0051B833    add         esp,0FFFFFFF0
 0051B836    mov         esi,edx
 0051B838    lea         edi,[esp+8]
 0051B83C    movs        dword ptr [edi],dword ptr [esi]
 0051B83D    movs        dword ptr [edi],dword ptr [esi]
 0051B83E    mov         esi,eax
 0051B840    lea         edi,[esp]
 0051B843    movs        dword ptr [edi],dword ptr [esi]
 0051B844    movs        dword ptr [edi],dword ptr [esi]
 0051B845    mov         ebx,ecx
 0051B847    mov         eax,dword ptr [esp]
 0051B84A    mov         dword ptr [ebx],eax
 0051B84C    mov         eax,dword ptr [esp+4]
 0051B850    mov         dword ptr [ebx+4],eax
 0051B853    mov         eax,dword ptr [esp+0C]
 0051B857    cmp         eax,dword ptr [esp+4]
>0051B85B    jl          0051B870
 0051B85D    mov         eax,dword ptr [esp+0C]
 0051B861    cmp         eax,dword ptr [esp+4]
>0051B865    jne         0051B87D
 0051B867    mov         eax,dword ptr [esp+8]
 0051B86B    cmp         eax,dword ptr [esp]
>0051B86E    jge         0051B87D
 0051B870    mov         eax,dword ptr [esp+8]
 0051B874    mov         dword ptr [ebx],eax
 0051B876    mov         eax,dword ptr [esp+0C]
 0051B87A    mov         dword ptr [ebx+4],eax
 0051B87D    add         esp,10
 0051B880    pop         edi
 0051B881    pop         esi
 0051B882    pop         ebx
 0051B883    ret
*}
end;

//0051B884
{*function sub_0051B884(?:Extended):?;
begin
 0051B884    push        ebp
 0051B885    mov         ebp,esp
 0051B887    fld         tbyte ptr [ebp+8]
 0051B88A    fcomp       dword ptr ds:[51B8B8];0:Single
 0051B890    wait
 0051B891    fnstsw      al
 0051B893    sahf
>0051B894    jb          0051B8A6
 0051B896    fld         tbyte ptr [ebp+8]
 0051B899    fadd        dword ptr ds:[51B8BC];0.5:Single
 0051B89F    call        @TRUNC
>0051B8A4    jmp         0051B8B4
 0051B8A6    fld         tbyte ptr [ebp+8]
 0051B8A9    fsub        dword ptr ds:[51B8BC];0.5:Single
 0051B8AF    call        @TRUNC
 0051B8B4    pop         ebp
 0051B8B5    ret         0C
end;*}

//0051B8C0
function TmwEditList.Add(S:string):Integer;
begin
{*
 0051B8C0    push        ebx
 0051B8C1    push        esi
 0051B8C2    mov         esi,edx
 0051B8C4    mov         ebx,eax
 0051B8C6    mov         eax,ebx
 0051B8C8    call        TStrings.BeginUpdate
 0051B8CD    mov         edx,esi
 0051B8CF    mov         eax,ebx
 0051B8D1    call        TStringList.Add
 0051B8D6    mov         esi,eax
 0051B8D8    cmp         word ptr [ebx+5A],0;TmwEditList.?f5A:word
>0051B8DD    je          0051B8E7
 0051B8DF    mov         edx,ebx
 0051B8E1    mov         eax,dword ptr [ebx+5C];TmwEditList.?f5C:dword
 0051B8E4    call        dword ptr [ebx+58];TmwEditList.FOnAdded
 0051B8E7    mov         eax,ebx
 0051B8E9    call        TStrings.EndUpdate
 0051B8EE    mov         eax,esi
 0051B8F0    pop         esi
 0051B8F1    pop         ebx
 0051B8F2    ret
*}
end;

//0051B8F4
procedure TmwEditList.AddStrings(Strings:TStrings);
begin
{*
 0051B8F4    push        ebp
 0051B8F5    mov         ebp,esp
 0051B8F7    add         esp,0FFFFFFF4
 0051B8FA    push        ebx
 0051B8FB    push        esi
 0051B8FC    push        edi
 0051B8FD    xor         ecx,ecx
 0051B8FF    mov         dword ptr [ebp-0C],ecx
 0051B902    mov         dword ptr [ebp-8],edx
 0051B905    mov         dword ptr [ebp-4],eax
 0051B908    xor         eax,eax
 0051B90A    push        ebp
 0051B90B    push        51B9AC
 0051B910    push        dword ptr fs:[eax]
 0051B913    mov         dword ptr fs:[eax],esp
 0051B916    mov         eax,dword ptr [ebp-4]
 0051B919    call        TStrings.BeginUpdate
 0051B91E    xor         eax,eax
 0051B920    push        ebp
 0051B921    push        51B98F
 0051B926    push        dword ptr fs:[eax]
 0051B929    mov         dword ptr fs:[eax],esp
 0051B92C    mov         eax,dword ptr [ebp-8]
 0051B92F    mov         edx,dword ptr [eax]
 0051B931    call        dword ptr [edx+14];TStrings.GetCount
 0051B934    mov         ebx,eax
 0051B936    dec         ebx
 0051B937    test        ebx,ebx
>0051B939    jl          0051B95A
 0051B93B    inc         ebx
 0051B93C    xor         esi,esi
 0051B93E    lea         ecx,[ebp-0C]
 0051B941    mov         edx,esi
 0051B943    mov         eax,dword ptr [ebp-8]
 0051B946    mov         edi,dword ptr [eax]
 0051B948    call        dword ptr [edi+0C];TStrings.Get
 0051B94B    mov         edx,dword ptr [ebp-0C]
 0051B94E    mov         eax,dword ptr [ebp-4]
 0051B951    call        TStringList.Add
 0051B956    inc         esi
 0051B957    dec         ebx
>0051B958    jne         0051B93E
 0051B95A    mov         eax,dword ptr [ebp-4]
 0051B95D    cmp         word ptr [eax+8A],0;TmwEditList.?f8A:word
>0051B965    je          0051B979
 0051B967    mov         ebx,dword ptr [ebp-4]
 0051B96A    mov         edx,dword ptr [ebp-4]
 0051B96D    mov         eax,dword ptr [ebx+8C];TmwEditList.?f8C:dword
 0051B973    call        dword ptr [ebx+88];TmwEditList.fOnScanRanges
 0051B979    xor         eax,eax
 0051B97B    pop         edx
 0051B97C    pop         ecx
 0051B97D    pop         ecx
 0051B97E    mov         dword ptr fs:[eax],edx
 0051B981    push        51B996
 0051B986    mov         eax,dword ptr [ebp-4]
 0051B989    call        TStrings.EndUpdate
 0051B98E    ret
>0051B98F    jmp         @HandleFinally
>0051B994    jmp         0051B986
 0051B996    xor         eax,eax
 0051B998    pop         edx
 0051B999    pop         ecx
 0051B99A    pop         ecx
 0051B99B    mov         dword ptr fs:[eax],edx
 0051B99E    push        51B9B3
 0051B9A3    lea         eax,[ebp-0C]
 0051B9A6    call        @UStrClr
 0051B9AB    ret
>0051B9AC    jmp         @HandleFinally
>0051B9B1    jmp         0051B9A3
 0051B9B3    pop         edi
 0051B9B4    pop         esi
 0051B9B5    pop         ebx
 0051B9B6    mov         esp,ebp
 0051B9B8    pop         ebp
 0051B9B9    ret
*}
end;

//0051B9BC
procedure TmwEditList.Assign(Source:TPersistent);
begin
{*
 0051B9BC    push        ebp
 0051B9BD    mov         ebp,esp
 0051B9BF    push        ecx
 0051B9C0    push        ebx
 0051B9C1    mov         ebx,edx
 0051B9C3    mov         dword ptr [ebp-4],eax
 0051B9C6    mov         eax,dword ptr [ebp-4]
 0051B9C9    call        0051BA08
 0051B9CE    xor         eax,eax
 0051B9D0    push        ebp
 0051B9D1    push        51B9FC
 0051B9D6    push        dword ptr fs:[eax]
 0051B9D9    mov         dword ptr fs:[eax],esp
 0051B9DC    mov         edx,ebx
 0051B9DE    mov         eax,dword ptr [ebp-4]
 0051B9E1    call        TStringList.Assign
 0051B9E6    xor         eax,eax
 0051B9E8    pop         edx
 0051B9E9    pop         ecx
 0051B9EA    pop         ecx
 0051B9EB    mov         dword ptr fs:[eax],edx
 0051B9EE    push        51BA03
 0051B9F3    mov         eax,dword ptr [ebp-4]
 0051B9F6    call        0051BA94
 0051B9FB    ret
>0051B9FC    jmp         @HandleFinally
>0051BA01    jmp         0051B9F3
 0051BA03    pop         ebx
 0051BA04    pop         ecx
 0051BA05    pop         ebp
 0051BA06    ret
*}
end;

//0051BA08
procedure sub_0051BA08(?:TStrings);
begin
{*
 0051BA08    inc         dword ptr [eax+90];TmwEditList.nLoading:Integer
 0051BA0E    ret
*}
end;

//0051BA10
procedure TmwEditList.Clear;
begin
{*
 0051BA10    push        ebx
 0051BA11    mov         ebx,eax
 0051BA13    cmp         word ptr [ebx+62],0;TmwEditList.?f62:word
>0051BA18    je          0051BA22
 0051BA1A    mov         edx,ebx
 0051BA1C    mov         eax,dword ptr [ebx+64];TmwEditList.?f64:dword
 0051BA1F    call        dword ptr [ebx+60];TmwEditList.fOnCleared
 0051BA22    mov         eax,ebx
 0051BA24    call        TStringList.Clear
 0051BA29    cmp         dword ptr [ebx+90],0;TmwEditList.nLoading:Integer
>0051BA30    jne         0051BA46
 0051BA32    mov         eax,ebx
 0051BA34    mov         edx,dword ptr [eax]
 0051BA36    call        dword ptr [edx+14];TStringList.GetCount
 0051BA39    test        eax,eax
>0051BA3B    jne         0051BA46
 0051BA3D    xor         edx,edx
 0051BA3F    mov         eax,ebx
 0051BA41    mov         ecx,dword ptr [eax]
 0051BA43    call        dword ptr [ecx+38];TmwEditList.Add
 0051BA46    pop         ebx
 0051BA47    ret
*}
end;

//0051BA48
procedure TmwEditList.Delete(Index:Integer);
begin
{*
 0051BA48    push        ebx
 0051BA49    push        esi
 0051BA4A    mov         esi,edx
 0051BA4C    mov         ebx,eax
 0051BA4E    mov         eax,ebx
 0051BA50    call        TStrings.BeginUpdate
 0051BA55    test        esi,esi
>0051BA57    jne         0051BA70
 0051BA59    mov         eax,ebx
 0051BA5B    mov         edx,dword ptr [eax]
 0051BA5D    call        dword ptr [edx+14];TStringList.GetCount
 0051BA60    dec         eax
>0051BA61    jne         0051BA70
 0051BA63    xor         ecx,ecx
 0051BA65    xor         edx,edx
 0051BA67    mov         eax,ebx
 0051BA69    call        TStringList.Put
>0051BA6E    jmp         0051BA79
 0051BA70    mov         edx,esi
 0051BA72    mov         eax,ebx
 0051BA74    call        TStringList.Delete
 0051BA79    cmp         word ptr [ebx+6A],0;TmwEditList.?f6A:word
>0051BA7E    je          0051BA88
 0051BA80    mov         edx,esi
 0051BA82    mov         eax,dword ptr [ebx+6C];TmwEditList.?f6C:dword
 0051BA85    call        dword ptr [ebx+68];TmwEditList.FOnDeleted
 0051BA88    mov         eax,ebx
 0051BA8A    call        TStrings.EndUpdate
 0051BA8F    pop         esi
 0051BA90    pop         ebx
 0051BA91    ret
*}
end;

//0051BA94
procedure sub_0051BA94(?:TStrings);
begin
{*
 0051BA94    push        ebx
 0051BA95    mov         ebx,eax
 0051BA97    cmp         dword ptr [ebx+90],0;TmwEditList.nLoading:Integer
>0051BA9E    jle         0051BAC3
 0051BAA0    dec         dword ptr [ebx+90];TmwEditList.nLoading:Integer
 0051BAA6    cmp         dword ptr [ebx+90],0;TmwEditList.nLoading:Integer
>0051BAAD    jne         0051BAC3
 0051BAAF    mov         eax,ebx
 0051BAB1    mov         edx,dword ptr [eax]
 0051BAB3    call        dword ptr [edx+14];TStringList.GetCount
 0051BAB6    test        eax,eax
>0051BAB8    jne         0051BAC3
 0051BABA    xor         edx,edx
 0051BABC    mov         eax,ebx
 0051BABE    mov         ecx,dword ptr [eax]
 0051BAC0    call        dword ptr [ecx+38];TmwEditList.Add
 0051BAC3    pop         ebx
 0051BAC4    ret
*}
end;

//0051BAC8
procedure TmwEditList.Insert(Index:Integer; S:string);
begin
{*
 0051BAC8    push        ebx
 0051BAC9    push        esi
 0051BACA    push        edi
 0051BACB    mov         edi,ecx
 0051BACD    mov         esi,edx
 0051BACF    mov         ebx,eax
 0051BAD1    mov         eax,ebx
 0051BAD3    call        TStrings.BeginUpdate
 0051BAD8    mov         ecx,edi
 0051BADA    mov         edx,esi
 0051BADC    mov         eax,ebx
 0051BADE    call        TStringList.Insert
 0051BAE3    cmp         word ptr [ebx+72],0;TmwEditList.?f72:word
>0051BAE8    je          0051BAF2
 0051BAEA    mov         edx,esi
 0051BAEC    mov         eax,dword ptr [ebx+74];TmwEditList.?f74:dword
 0051BAEF    call        dword ptr [ebx+70];TmwEditList.FOnInserted
 0051BAF2    mov         eax,ebx
 0051BAF4    call        TStrings.EndUpdate
 0051BAF9    pop         edi
 0051BAFA    pop         esi
 0051BAFB    pop         ebx
 0051BAFC    ret
*}
end;

//0051BB00
procedure TmwEditList.LoadFromStream(Stream:TStream);
begin
{*
 0051BB00    push        ebp
 0051BB01    mov         ebp,esp
 0051BB03    add         esp,0FFFFFFF0
 0051BB06    push        ebx
 0051BB07    mov         ebx,edx
 0051BB09    mov         dword ptr [ebp-4],eax
 0051BB0C    mov         eax,dword ptr [ebp-4]
 0051BB0F    call        0051BA08
 0051BB14    mov         eax,dword ptr [ebp-4]
 0051BB17    call        TStrings.BeginUpdate
 0051BB1C    xor         eax,eax
 0051BB1E    push        ebp
 0051BB1F    push        51BBC7
 0051BB24    push        dword ptr fs:[eax]
 0051BB27    mov         dword ptr fs:[eax],esp
 0051BB2A    mov         eax,dword ptr [ebp-4]
 0051BB2D    cmp         word ptr [eax+8A],0;TmwEditList.?f8A:word
>0051BB35    je          0051BB9F
 0051BB37    mov         eax,dword ptr [ebp-4]
 0051BB3A    mov         edx,dword ptr [eax+58];TmwEditList.FOnAdded:TNotifyEvent
 0051BB3D    mov         dword ptr [ebp-10],edx
 0051BB40    mov         edx,dword ptr [eax+5C];TmwEditList.?f5C:dword
 0051BB43    mov         dword ptr [ebp-0C],edx
 0051BB46    xor         eax,eax
 0051BB48    push        ebp
 0051BB49    push        51BB98
 0051BB4E    push        dword ptr fs:[eax]
 0051BB51    mov         dword ptr fs:[eax],esp
 0051BB54    mov         eax,dword ptr [ebp-4]
 0051BB57    xor         edx,edx
 0051BB59    mov         dword ptr [eax+58],edx;TmwEditList.FOnAdded:TNotifyEvent
 0051BB5C    mov         dword ptr [eax+5C],edx;TmwEditList.?f5C:dword
 0051BB5F    mov         edx,ebx
 0051BB61    mov         eax,dword ptr [ebp-4]
 0051BB64    call        TStrings.LoadFromStream
 0051BB69    mov         ebx,dword ptr [ebp-4]
 0051BB6C    mov         edx,dword ptr [ebp-4]
 0051BB6F    mov         eax,dword ptr [ebx+8C];TmwEditList.?f8C:dword
 0051BB75    call        dword ptr [ebx+88];TmwEditList.fOnScanRanges
 0051BB7B    xor         eax,eax
 0051BB7D    pop         edx
 0051BB7E    pop         ecx
 0051BB7F    pop         ecx
 0051BB80    mov         dword ptr fs:[eax],edx
 0051BB83    push        51BBA9
 0051BB88    mov         eax,dword ptr [ebp-4]
 0051BB8B    mov         edx,dword ptr [ebp-10]
 0051BB8E    mov         dword ptr [eax+58],edx;TmwEditList.FOnAdded:TNotifyEvent
 0051BB91    mov         edx,dword ptr [ebp-0C]
 0051BB94    mov         dword ptr [eax+5C],edx;TmwEditList.?f5C:dword
 0051BB97    ret
>0051BB98    jmp         @HandleFinally
>0051BB9D    jmp         0051BB88
 0051BB9F    mov         edx,ebx
 0051BBA1    mov         eax,dword ptr [ebp-4]
 0051BBA4    call        TStrings.LoadFromStream
 0051BBA9    xor         eax,eax
 0051BBAB    pop         edx
 0051BBAC    pop         ecx
 0051BBAD    pop         ecx
 0051BBAE    mov         dword ptr fs:[eax],edx
 0051BBB1    push        51BBCE
 0051BBB6    mov         eax,dword ptr [ebp-4]
 0051BBB9    call        0051BA94
 0051BBBE    mov         eax,dword ptr [ebp-4]
 0051BBC1    call        TStrings.EndUpdate
 0051BBC6    ret
>0051BBC7    jmp         @HandleFinally
>0051BBCC    jmp         0051BBB6
 0051BBCE    pop         ebx
 0051BBCF    mov         esp,ebp
 0051BBD1    pop         ebp
 0051BBD2    ret
*}
end;

//0051BBD4
procedure TmwEditList.Put(Index:Integer; const S:UnicodeString);
begin
{*
 0051BBD4    push        ebx
 0051BBD5    push        esi
 0051BBD6    push        edi
 0051BBD7    mov         edi,ecx
 0051BBD9    mov         esi,edx
 0051BBDB    mov         ebx,eax
 0051BBDD    mov         eax,ebx
 0051BBDF    call        TStrings.BeginUpdate
 0051BBE4    mov         ecx,edi
 0051BBE6    mov         edx,esi
 0051BBE8    mov         eax,ebx
 0051BBEA    call        TStringList.Put
 0051BBEF    cmp         word ptr [ebx+82],0;TmwEditList.?f82:word
>0051BBF7    je          0051BC07
 0051BBF9    mov         edx,esi
 0051BBFB    mov         eax,dword ptr [ebx+84];TmwEditList.?f84:dword
 0051BC01    call        dword ptr [ebx+80];TmwEditList.fOnPutted
 0051BC07    mov         eax,ebx
 0051BC09    call        TStrings.EndUpdate
 0051BC0E    pop         edi
 0051BC0F    pop         esi
 0051BC10    pop         ebx
 0051BC11    ret
*}
end;

//0051BC14
procedure TmwEditList.SetTextStr(Value:string);
begin
{*
 0051BC14    push        ebx
 0051BC15    push        esi
 0051BC16    mov         esi,edx
 0051BC18    mov         ebx,eax
 0051BC1A    mov         eax,ebx
 0051BC1C    call        TStrings.BeginUpdate
 0051BC21    mov         edx,esi
 0051BC23    mov         eax,ebx
 0051BC25    call        TStrings.SetTextStr
 0051BC2A    cmp         word ptr [ebx+7A],0;TmwEditList.?f7A:word
>0051BC2F    je          0051BC39
 0051BC31    mov         edx,ebx
 0051BC33    mov         eax,dword ptr [ebx+7C];TmwEditList.?f7C:dword
 0051BC36    call        dword ptr [ebx+78];TmwEditList.FOnLoaded
 0051BC39    mov         eax,ebx
 0051BC3B    call        TStrings.EndUpdate
 0051BC40    pop         esi
 0051BC41    pop         ebx
 0051BC42    ret
*}
end;

//0051BC44
{*procedure TmwCustomEdit.PixelsToRowColumn(Pixels:TPoint; ?:?);
begin
 0051BC44    push        ebx
 0051BC45    push        esi
 0051BC46    push        edi
 0051BC47    add         esp,0FFFFFFE8
 0051BC4A    mov         esi,edx
 0051BC4C    lea         edi,[esp]
 0051BC4F    movs        dword ptr [edi],dword ptr [esi]
 0051BC50    movs        dword ptr [edi],dword ptr [esi]
 0051BC51    mov         edi,ecx
 0051BC53    mov         ebx,eax
 0051BC55    mov         eax,ebx
 0051BC57    call        0051C6C0
 0051BC5C    mov         esi,dword ptr [ebx+294];TmwCustomEdit.fCharWidth:Integer
 0051BC62    imul        esi
 0051BC64    add         eax,dword ptr [esp]
 0051BC67    sub         eax,dword ptr [ebx+29C]
 0051BC6D    sub         eax,2
 0051BC70    mov         dword ptr [esp+10],eax
 0051BC74    fild        dword ptr [esp+10]
 0051BC78    mov         dword ptr [esp+14],esi
 0051BC7C    fild        dword ptr [esp+14]
 0051BC80    fdivp       st(1),st
 0051BC82    add         esp,0FFFFFFF4
 0051BC85    fstp        tbyte ptr [esp]
 0051BC88    wait
 0051BC89    call        0051B884
 0051BC8E    mov         esi,eax
 0051BC90    mov         eax,ebx
 0051BC92    call        0051CBB4
 0051BC97    mov         ecx,eax
 0051BC99    mov         eax,dword ptr [esp+4]
 0051BC9D    cdq
 0051BC9E    idiv        eax,dword ptr [ebx+2C8];TmwCustomEdit.fTextHeight:Integer
 0051BCA4    add         ecx,eax
 0051BCA6    mov         eax,ecx
 0051BCA8    mov         dword ptr [esp+8],esi
 0051BCAC    mov         dword ptr [esp+0C],eax
 0051BCB0    mov         eax,dword ptr [esp+8]
 0051BCB4    mov         dword ptr [edi],eax
 0051BCB6    mov         eax,dword ptr [esp+0C]
 0051BCBA    mov         dword ptr [edi+4],eax
 0051BCBD    add         esp,18
 0051BCC0    pop         edi
 0051BCC1    pop         esi
 0051BCC2    pop         ebx
 0051BCC3    ret
end;*}

//0051BCC4
{*procedure TmwCustomEdit.RowColumnToPixels(RowCol:TPoint; ?:?);
begin
 0051BCC4    push        esi
 0051BCC5    push        edi
 0051BCC6    add         esp,0FFFFFFF8
 0051BCC9    mov         esi,edx
 0051BCCB    lea         edi,[esp]
 0051BCCE    movs        dword ptr [edi],dword ptr [esi]
 0051BCCF    movs        dword ptr [edi],dword ptr [esi]
 0051BCD0    mov         edx,dword ptr [esp]
 0051BCD3    dec         edx
 0051BCD4    imul        edx,dword ptr [eax+294];TmwCustomEdit.fCharWidth:Integer
 0051BCDB    add         edx,dword ptr [eax+2CC];TmwCustomEdit.fTextOffset:Integer
 0051BCE1    mov         dword ptr [ecx],edx
 0051BCE3    mov         edx,dword ptr [esp+4]
 0051BCE7    dec         edx
 0051BCE8    sub         edx,dword ptr [eax+2D0]
 0051BCEE    imul        edx,dword ptr [eax+2C8];TmwCustomEdit.fTextHeight:Integer
 0051BCF5    inc         edx
 0051BCF6    mov         dword ptr [ecx+4],edx
 0051BCF9    pop         ecx
 0051BCFA    pop         edx
 0051BCFB    pop         edi
 0051BCFC    pop         esi
 0051BCFD    ret
end;*}

//0051BD00
procedure sub_0051BD00(?:TmwCustomEdit; ?:Integer; ?:Integer);
begin
{*
 0051BD00    push        esi
 0051BD01    add         esp,0FFFFFFF0
 0051BD04    mov         esi,eax
 0051BD06    mov         dword ptr [esp],edx
 0051BD09    mov         dword ptr [esp+4],ecx
 0051BD0D    lea         ecx,[esp+8]
 0051BD11    mov         edx,esp
 0051BD13    mov         eax,esi
 0051BD15    call        TmwCustomEdit.PixelsToRowColumn
 0051BD1A    lea         edx,[esp+8]
 0051BD1E    mov         eax,esi
 0051BD20    mov         ecx,dword ptr [eax]
 0051BD22    call        dword ptr [ecx+110]
 0051BD28    add         esp,10
 0051BD2B    pop         esi
 0051BD2C    ret
*}
end;

//0051BD30
procedure TmwCustomEdit.DoCopyToClipboard(SText:string);
begin
{*
 0051BD30    push        ebp
 0051BD31    mov         ebp,esp
 0051BD33    add         esp,0FFFFFFE8
 0051BD36    push        ebx
 0051BD37    push        esi
 0051BD38    xor         ecx,ecx
 0051BD3A    mov         dword ptr [ebp-4],ecx
 0051BD3D    mov         dword ptr [ebp-0C],edx
 0051BD40    mov         dword ptr [ebp-8],eax
 0051BD43    xor         eax,eax
 0051BD45    push        ebp
 0051BD46    push        51BF6F
 0051BD4B    push        dword ptr fs:[eax]
 0051BD4E    mov         dword ptr fs:[eax],esp
 0051BD51    cmp         dword ptr [ebp-0C],0
>0051BD55    je          0051BF59
 0051BD5B    mov         byte ptr [ebp-15],1
 0051BD5F    mov         eax,dword ptr [ebp-0C]
 0051BD62    test        eax,eax
>0051BD64    je          0051BD6B
 0051BD66    sub         eax,4
 0051BD69    mov         eax,dword ptr [eax]
 0051BD6B    mov         dword ptr [ebp-14],eax
 0051BD6E    call        Clipboard
 0051BD73    mov         edx,dword ptr [eax]
 0051BD75    call        dword ptr [edx+18];TClipboard.Open
 0051BD78    xor         eax,eax
 0051BD7A    push        ebp
 0051BD7B    push        51BF52
 0051BD80    push        dword ptr fs:[eax]
 0051BD83    mov         dword ptr fs:[eax],esp
 0051BD86    call        user32.EmptyClipboard
 0051BD8B    mov         eax,dword ptr [ebp-14]
 0051BD8E    inc         eax
 0051BD8F    mov         esi,eax
 0051BD91    add         esi,esi
 0051BD93    push        esi
 0051BD94    push        2002
 0051BD99    call        kernel32.GlobalAlloc
 0051BD9E    mov         dword ptr [ebp-10],eax
 0051BDA1    cmp         dword ptr [ebp-10],0
>0051BDA5    je          0051BE04
 0051BDA7    mov         eax,dword ptr [ebp-10]
 0051BDAA    push        eax
 0051BDAB    call        kernel32.GlobalLock
 0051BDB0    mov         ebx,eax
 0051BDB2    xor         eax,eax
 0051BDB4    push        ebp
 0051BDB5    push        51BDFD
 0051BDBA    push        dword ptr fs:[eax]
 0051BDBD    mov         dword ptr fs:[eax],esp
 0051BDC0    test        ebx,ebx
>0051BDC2    je          0051BDE6
 0051BDC4    mov         eax,dword ptr [ebp-0C]
 0051BDC7    call        @UStrToPWChar
 0051BDCC    mov         ecx,esi
 0051BDCE    mov         edx,ebx
 0051BDD0    call        Move
 0051BDD5    mov         eax,dword ptr [ebp-10]
 0051BDD8    push        eax
 0051BDD9    push        0D
 0051BDDB    call        user32.SetClipboardData
 0051BDE0    test        eax,eax
 0051BDE2    sete        byte ptr [ebp-15]
 0051BDE6    xor         eax,eax
 0051BDE8    pop         edx
 0051BDE9    pop         ecx
 0051BDEA    pop         ecx
 0051BDEB    mov         dword ptr fs:[eax],edx
 0051BDEE    push        51BE04
 0051BDF3    mov         eax,dword ptr [ebp-10]
 0051BDF6    push        eax
 0051BDF7    call        kernel32.GlobalUnlock
 0051BDFC    ret
>0051BDFD    jmp         @HandleFinally
>0051BE02    jmp         0051BDF3
 0051BE04    lea         eax,[ebp-4]
 0051BE07    mov         edx,dword ptr [ebp-0C]
 0051BE0A    mov         ecx,0
 0051BE0F    call        @LStrFromUStr
 0051BE14    mov         esi,dword ptr [ebp-14]
 0051BE17    inc         esi
 0051BE18    push        esi
 0051BE19    push        2002
 0051BE1E    call        kernel32.GlobalAlloc
 0051BE23    mov         dword ptr [ebp-10],eax
 0051BE26    cmp         dword ptr [ebp-10],0
>0051BE2A    je          0051BE89
 0051BE2C    mov         eax,dword ptr [ebp-10]
 0051BE2F    push        eax
 0051BE30    call        kernel32.GlobalLock
 0051BE35    mov         ebx,eax
 0051BE37    xor         eax,eax
 0051BE39    push        ebp
 0051BE3A    push        51BE82
 0051BE3F    push        dword ptr fs:[eax]
 0051BE42    mov         dword ptr fs:[eax],esp
 0051BE45    test        ebx,ebx
>0051BE47    je          0051BE6B
 0051BE49    mov         eax,dword ptr [ebp-4]
 0051BE4C    call        @LStrToPChar
 0051BE51    mov         ecx,esi
 0051BE53    mov         edx,ebx
 0051BE55    call        Move
 0051BE5A    mov         eax,dword ptr [ebp-10]
 0051BE5D    push        eax
 0051BE5E    push        1
 0051BE60    call        user32.SetClipboardData
 0051BE65    test        eax,eax
 0051BE67    sete        byte ptr [ebp-15]
 0051BE6B    xor         eax,eax
 0051BE6D    pop         edx
 0051BE6E    pop         ecx
 0051BE6F    pop         ecx
 0051BE70    mov         dword ptr fs:[eax],edx
 0051BE73    push        51BE89
 0051BE78    mov         eax,dword ptr [ebp-10]
 0051BE7B    push        eax
 0051BE7C    call        kernel32.GlobalUnlock
 0051BE81    ret
>0051BE82    jmp         @HandleFinally
>0051BE87    jmp         0051BE78
 0051BE89    cmp         byte ptr [ebp-15],0
>0051BE8D    jne         0051BF1E
 0051BE93    mov         eax,dword ptr [ebp-14]
 0051BE96    add         eax,eax
 0051BE98    inc         eax
 0051BE99    add         eax,2
 0051BE9C    push        eax
 0051BE9D    push        2002
 0051BEA2    call        kernel32.GlobalAlloc
 0051BEA7    mov         dword ptr [ebp-10],eax
 0051BEAA    mov         eax,dword ptr [ebp-10]
 0051BEAD    push        eax
 0051BEAE    call        kernel32.GlobalLock
 0051BEB3    mov         ebx,eax
 0051BEB5    xor         eax,eax
 0051BEB7    push        ebp
 0051BEB8    push        51BF17
 0051BEBD    push        dword ptr fs:[eax]
 0051BEC0    mov         dword ptr fs:[eax],esp
 0051BEC3    test        ebx,ebx
>0051BEC5    je          0051BF00
 0051BEC7    mov         eax,dword ptr [ebp-8]
 0051BECA    movzx       eax,byte ptr [eax+390];TmwCustomEdit.fSelectionMode:TSelectionMode
 0051BED1    mov         byte ptr [ebx],al
 0051BED3    inc         ebx
 0051BED4    mov         eax,dword ptr [ebp-0C]
 0051BED7    call        @UStrToPWChar
 0051BEDC    mov         edx,dword ptr [ebp-14]
 0051BEDF    inc         edx
 0051BEE0    mov         ecx,edx
 0051BEE2    add         ecx,ecx
 0051BEE4    mov         edx,ebx
 0051BEE6    call        Move
 0051BEEB    mov         eax,dword ptr [ebp-10]
 0051BEEE    push        eax
 0051BEEF    mov         eax,[00793B24];gvar_00793B24:LongWord
 0051BEF4    push        eax
 0051BEF5    call        user32.SetClipboardData
 0051BEFA    test        eax,eax
 0051BEFC    sete        byte ptr [ebp-15]
 0051BF00    xor         eax,eax
 0051BF02    pop         edx
 0051BF03    pop         ecx
 0051BF04    pop         ecx
 0051BF05    mov         dword ptr fs:[eax],edx
 0051BF08    push        51BF1E
 0051BF0D    mov         eax,dword ptr [ebp-10]
 0051BF10    push        eax
 0051BF11    call        kernel32.GlobalUnlock
 0051BF16    ret
>0051BF17    jmp         @HandleFinally
>0051BF1C    jmp         0051BF0D
 0051BF1E    xor         eax,eax
 0051BF20    pop         edx
 0051BF21    pop         ecx
 0051BF22    pop         ecx
 0051BF23    mov         dword ptr fs:[eax],edx
 0051BF26    push        51BF59
 0051BF2B    call        Clipboard
 0051BF30    mov         edx,dword ptr [eax]
 0051BF32    call        dword ptr [edx+14];TClipboard.Close
 0051BF35    cmp         byte ptr [ebp-15],0
>0051BF39    je          0051BF51
 0051BF3B    mov         ecx,51BF88;'Clipboard copy operation failed'
 0051BF40    mov         dl,1
 0051BF42    mov         eax,[00517770];EmwEditError
 0051BF47    call        Exception.Create;EmwEditError.Create
 0051BF4C    call        @RaiseExcept
 0051BF51    ret
>0051BF52    jmp         @HandleFinally
>0051BF57    jmp         0051BF2B
 0051BF59    xor         eax,eax
 0051BF5B    pop         edx
 0051BF5C    pop         ecx
 0051BF5D    pop         ecx
 0051BF5E    mov         dword ptr fs:[eax],edx
 0051BF61    push        51BF76
 0051BF66    lea         eax,[ebp-4]
 0051BF69    call        @LStrClr
 0051BF6E    ret
>0051BF6F    jmp         @HandleFinally
>0051BF74    jmp         0051BF66
 0051BF76    pop         esi
 0051BF77    pop         ebx
 0051BF78    mov         esp,ebp
 0051BF7A    pop         ebp
 0051BF7B    ret
*}
end;

//0051BFC8
procedure TmwCustomEdit.CopyToClipboard;
begin
{*
 0051BFC8    push        ebp
 0051BFC9    mov         ebp,esp
 0051BFCB    push        0
 0051BFCD    push        ebx
 0051BFCE    mov         ebx,eax
 0051BFD0    xor         eax,eax
 0051BFD2    push        ebp
 0051BFD3    push        51C013
 0051BFD8    push        dword ptr fs:[eax]
 0051BFDB    mov         dword ptr fs:[eax],esp
 0051BFDE    mov         eax,ebx
 0051BFE0    call        0051C710
 0051BFE5    test        al,al
>0051BFE7    je          0051BFFD
 0051BFE9    lea         edx,[ebp-4]
 0051BFEC    mov         eax,ebx
 0051BFEE    call        0051C7FC
 0051BFF3    mov         edx,dword ptr [ebp-4]
 0051BFF6    mov         eax,ebx
 0051BFF8    call        TmwCustomEdit.DoCopyToClipboard
 0051BFFD    xor         eax,eax
 0051BFFF    pop         edx
 0051C000    pop         ecx
 0051C001    pop         ecx
 0051C002    mov         dword ptr fs:[eax],edx
 0051C005    push        51C01A
 0051C00A    lea         eax,[ebp-4]
 0051C00D    call        @UStrClr
 0051C012    ret
>0051C013    jmp         @HandleFinally
>0051C018    jmp         0051C00A
 0051C01A    pop         ebx
 0051C01B    pop         ecx
 0051C01C    pop         ebp
 0051C01D    ret
*}
end;

//0051C020
procedure TmwCustomEdit.CutToClipboard;
begin
{*
 0051C020    push        ebp
 0051C021    mov         ebp,esp
 0051C023    push        0
 0051C025    push        ebx
 0051C026    mov         ebx,eax
 0051C028    xor         eax,eax
 0051C02A    push        ebp
 0051C02B    push        51C0AD
 0051C030    push        dword ptr fs:[eax]
 0051C033    mov         dword ptr fs:[eax],esp
 0051C036    mov         eax,ebx
 0051C038    call        0051C710
 0051C03D    test        al,al
>0051C03F    je          0051C097
 0051C041    lea         edx,[ebp-4]
 0051C044    mov         eax,ebx
 0051C046    call        0051C7FC
 0051C04B    mov         edx,dword ptr [ebp-4]
 0051C04E    mov         eax,ebx
 0051C050    call        TmwCustomEdit.DoCopyToClipboard
 0051C055    lea         eax,[ebx+280];TmwCustomEdit.fBlockEnd:TPoint
 0051C05B    push        eax
 0051C05C    mov         eax,dword ptr [ebp-4]
 0051C05F    call        @UStrToPWChar
 0051C064    push        eax
 0051C065    movzx       eax,byte ptr [ebx+390];TmwCustomEdit.fSelectionMode:TSelectionMode
 0051C06C    push        eax
 0051C06D    lea         ecx,[ebx+278];TmwCustomEdit.fBlockBegin:TPoint
 0051C073    mov         dl,4
 0051C075    mov         eax,dword ptr [ebx+2DC];TmwCustomEdit.fUndoList:TUndoList
 0051C07B    call        TUndoList.AddChange
 0051C080    mov         eax,ebx
 0051C082    call        00527894
 0051C087    xor         edx,edx
 0051C089    mov         eax,ebx
 0051C08B    call        005276B8
 0051C090    mov         eax,ebx
 0051C092    call        005278B0
 0051C097    xor         eax,eax
 0051C099    pop         edx
 0051C09A    pop         ecx
 0051C09B    pop         ecx
 0051C09C    mov         dword ptr fs:[eax],edx
 0051C09F    push        51C0B4
 0051C0A4    lea         eax,[ebp-4]
 0051C0A7    call        @UStrClr
 0051C0AC    ret
>0051C0AD    jmp         @HandleFinally
>0051C0B2    jmp         0051C0A4
 0051C0B4    pop         ebx
 0051C0B5    pop         ecx
 0051C0B6    pop         ebp
 0051C0B7    ret
*}
end;

//0051C0B8
constructor TmwCustomEdit.Create(AOwner:TComponent);
begin
{*
 0051C0B8    push        ebp
 0051C0B9    mov         ebp,esp
 0051C0BB    push        ecx
 0051C0BC    push        ebx
 0051C0BD    push        esi
 0051C0BE    test        dl,dl
>0051C0C0    je          0051C0CA
 0051C0C2    add         esp,0FFFFFFF0
 0051C0C5    call        @ClassCreate
 0051C0CA    mov         byte ptr [ebp-1],dl
 0051C0CD    mov         ebx,eax
 0051C0CF    xor         edx,edx
 0051C0D1    mov         eax,ebx
 0051C0D3    call        TCustomControl.Create
 0051C0D8    mov         dl,1
 0051C0DA    mov         eax,[00518D28];TmwEditList
 0051C0DF    call        TStringList.Create;TmwEditList.Create
 0051C0E4    mov         dword ptr [ebx+2A4],eax;TmwCustomEdit.fLines:TStrings
 0051C0EA    mov         dl,1
 0051C0EC    mov         eax,[0045FAE8];TFont
 0051C0F1    call        TFont.Create;TFont.Create
 0051C0F6    mov         dword ptr [ebx+298],eax;TmwCustomEdit.fFontDummy:TFont
 0051C0FC    mov         ecx,ebx
 0051C0FE    mov         dl,1
 0051C100    mov         eax,[00518978];TUndoList
 0051C105    call        TUndoList.Create;TUndoList.Create
 0051C10A    mov         dword ptr [ebx+2DC],eax;TmwCustomEdit.fUndoList:TUndoList
 0051C110    mov         ecx,ebx
 0051C112    mov         dl,1
 0051C114    mov         eax,[00518978];TUndoList
 0051C119    call        TUndoList.Create;TUndoList.Create
 0051C11E    mov         dword ptr [ebx+2E0],eax;TmwCustomEdit.fRedoList:TUndoList
 0051C124    xor         edx,edx
 0051C126    mov         eax,ebx
 0051C128    call        TWinControl.SetDoubleBuffered
 0051C12D    test        byte ptr [ebx+1C],10;TmwCustomEdit.FComponentState:TComponentState
>0051C131    jne         0051C140
 0051C133    mov         eax,dword ptr [ebx+2A4];TmwCustomEdit.fLines:TStrings
 0051C139    xor         edx,edx
 0051C13B    mov         ecx,dword ptr [eax]
 0051C13D    call        dword ptr [ecx+38];TStrings.Add
 0051C140    mov         eax,dword ptr [ebx+2A4];TmwCustomEdit.fLines:TStrings
 0051C146    mov         dword ptr [eax+5C],ebx
 0051C149    mov         dword ptr [eax+58],5218E0
 0051C150    mov         dword ptr [eax+64],ebx
 0051C153    mov         dword ptr [eax+60],5219E8;sub_005219E8
 0051C15A    mov         dword ptr [eax+6C],ebx
 0051C15D    mov         dword ptr [eax+68],521A60;sub_00521A60
 0051C164    mov         dword ptr [eax+74],ebx
 0051C167    mov         dword ptr [eax+70],521B0C;sub_00521B0C
 0051C16E    mov         dword ptr [eax+7C],ebx
 0051C171    mov         dword ptr [eax+78],521BCC;sub_00521BCC
 0051C178    mov         dword ptr [eax+84],ebx
 0051C17E    mov         dword ptr [eax+80],521BF4;sub_00521BF4
 0051C188    mov         dword ptr [eax+8C],ebx
 0051C18E    mov         dword ptr [eax+88],521C48;sub_00521C48
 0051C198    mov         dl,1
 0051C19A    mov         eax,[0051085C];TmwSelectedColor
 0051C19F    call        TmwSelectedColor.Create;TmwSelectedColor.Create
 0051C1A4    mov         esi,eax
 0051C1A6    mov         dword ptr [ebx+2D8],esi;TmwCustomEdit.fSelectedColor:TmwSelectedColor
 0051C1AC    mov         dword ptr [esi+14],ebx;TmwSelectedColor.?f14:TmwCustomEdit
 0051C1AF    mov         dword ptr [esi+10],527C5C;TmwSelectedColor.fOnChange:TNotifyEvent
 0051C1B6    mov         ecx,ebx
 0051C1B8    mov         dl,1
 0051C1BA    mov         eax,[00510F6C];TmwBookMarkOpt
 0051C1BF    call        TmwBookMarkOpt.Create;TmwBookMarkOpt.Create
 0051C1C4    mov         esi,eax
 0051C1C6    mov         dword ptr [ebx+324],esi;TmwCustomEdit.fBookMarkOpt:TmwBookMarkOpt
 0051C1CC    mov         dword ptr [esi+1C],ebx;TmwBookMarkOpt.?f1C:TmwCustomEdit
 0051C1CF    mov         dword ptr [esi+18],5282F0;TmwBookMarkOpt.fOnChange:TNotifyEvent
 0051C1D6    mov         dword ptr [ebx+2BC],50;TmwCustomEdit.fRightEdge:Integer
 0051C1E0    mov         dl,1
 0051C1E2    mov         eax,[005109FC];TmwGutter
 0051C1E7    call        TmwGutter.Create;TmwGutter.Create
 0051C1EC    mov         esi,eax
 0051C1EE    mov         dword ptr [ebx+3A4],esi;TmwCustomEdit.fGutter:TmwGutter
 0051C1F4    mov         dword ptr [esi+24],ebx;TmwGutter.?f24:TmwCustomEdit
 0051C1F7    mov         dword ptr [esi+20],527830;TmwGutter.fOnChange:TNotifyEvent sub_00527830
 0051C1FE    mov         eax,dword ptr [esi+8];TmwGutter.fWidth:Integer
 0051C201    mov         dword ptr [ebx+29C],eax;TmwCustomEdit.fGutterWidth:Integer
 0051C207    add         eax,2
 0051C20A    mov         dword ptr [ebx+2CC],eax;TmwCustomEdit.fTextOffset:Integer
 0051C210    mov         eax,dword ptr [ebx+50];TmwCustomEdit.FControlStyle:TControlStyle
 0051C213    or          eax,dword ptr ds:[51C3C4];0x60 gvar_0051C3C4
 0051C219    mov         dword ptr [ebx+50],eax;TmwCustomEdit.FControlStyle:TControlStyle
 0051C21C    mov         edx,96
 0051C221    mov         eax,ebx
 0051C223    call        TControl.SetHeight
 0051C228    mov         edx,0C8
 0051C22D    mov         eax,ebx
 0051C22F    call        TControl.SetWidth
 0051C234    mov         dx,0FFFC
 0051C238    mov         eax,ebx
 0051C23A    call        TControl.SetCursor
 0051C23F    mov         edx,0FF000005
 0051C244    mov         eax,ebx
 0051C246    call        TControl.SetColor
 0051C24B    mov         eax,dword ptr [ebx+298];TmwCustomEdit.fFontDummy:TFont
 0051C251    mov         edx,51C3D4;'Courier New'
 0051C256    call        TFont.SetName
 0051C25B    mov         eax,dword ptr [ebx+298];TmwCustomEdit.fFontDummy:TFont
 0051C261    mov         edx,0A
 0051C266    call        TFont.SetSize
 0051C26B    mov         eax,dword ptr [ebx+298];TmwCustomEdit.fFontDummy:TFont
 0051C271    mov         dl,1
 0051C273    call        TFont.SetCharset
 0051C278    mov         eax,dword ptr [ebx+298];TmwCustomEdit.fFontDummy:TFont
 0051C27E    push        eax
 0051C27F    movzx       ecx,byte ptr ds:[51C3EC];0x1 gvar_0051C3EC
 0051C286    mov         dl,1
 0051C288    mov         eax,[0051547C];TheTextDrawer
 0051C28D    call        TheTextDrawer.Create;TheTextDrawer.Create
 0051C292    mov         dword ptr [ebx+3B8],eax;TmwCustomEdit.fTextDrawer:TheTextDrawer
 0051C298    mov         eax,ebx
 0051C29A    call        TmwCustomEdit.GetFont
 0051C29F    mov         edx,dword ptr [ebx+298];TmwCustomEdit.fFontDummy:TFont
 0051C2A5    mov         ecx,dword ptr [eax]
 0051C2A7    call        dword ptr [ecx+8]
 0051C2AA    mov         eax,ebx
 0051C2AC    call        TmwCustomEdit.GetFont
 0051C2B1    mov         dword ptr [eax+0C],ebx
 0051C2B4    mov         dword ptr [eax+8],51C698;sub_0051C698
 0051C2BB    xor         edx,edx
 0051C2BD    mov         eax,ebx
 0051C2BF    call        0051C698
 0051C2C4    xor         edx,edx
 0051C2C6    mov         eax,ebx
 0051C2C8    call        TControl.SetParentFont
 0051C2CD    xor         edx,edx
 0051C2CF    mov         eax,ebx
 0051C2D1    call        TControl.SetParentColor
 0051C2D6    mov         dl,1
 0051C2D8    mov         eax,ebx
 0051C2DA    call        TWinControl.SetTabStop
 0051C2DF    mov         eax,dword ptr [ebx+2A4];TmwCustomEdit.fLines:TStrings
 0051C2E5    mov         dword ptr [eax+4C],ebx
 0051C2E8    mov         dword ptr [eax+48],51CFF8;sub_0051CFF8
 0051C2EF    mov         dword ptr [eax+44],ebx
 0051C2F2    mov         dword ptr [eax+40],51D008;sub_0051D008
 0051C2F9    mov         byte ptr [ebx+2A0],1;TmwCustomEdit.fInserting:Boolean
 0051C300    mov         dword ptr [ebx+2B0],400;TmwCustomEdit.fMaxLeftChar:Integer
 0051C30A    mov         byte ptr [ebx+2C4],3;TmwCustomEdit.FScrollBars:TScrollStyle
 0051C311    mov         byte ptr [ebx+340],1;TmwCustomEdit.fBorderStyle:TBorderStyle
 0051C318    mov         byte ptr [ebx+349],0;TmwCustomEdit.fInsertCaret:TCaretType
 0051C31F    mov         byte ptr [ebx+348],3;TmwCustomEdit.fOverwriteCaret:TCaretType
 0051C326    mov         byte ptr [ebx+390],0;TmwCustomEdit.fSelectionMode:TSelectionMode
 0051C32D    mov         ecx,ebx
 0051C32F    mov         dl,1
 0051C331    mov         eax,[0050DDE0];TmwKeyStrokes
 0051C336    call        TmwKeyStrokes.Create;TmwKeyStrokes.Create
 0051C33B    mov         dword ptr [ebx+368],eax;TmwCustomEdit.fKeyStrokes:TmwKeyStrokes
 0051C341    mov         ecx,ebx
 0051C343    mov         dl,1
 0051C345    mov         eax,[005185EC];TMarkList
 0051C34A    call        TMarkList.Create;TMarkList.Create
 0051C34F    mov         esi,eax
 0051C351    mov         dword ptr [ebx+370],esi;TmwCustomEdit.fMarkList:TMarkList
 0051C357    mov         dword ptr [esi+1C],ebx;TMarkList.?f1C:TmwCustomEdit
 0051C35A    mov         dword ptr [esi+18],5271B0;TMarkList.fOnChange:TNotifyEvent
 0051C361    mov         eax,ebx
 0051C363    mov         edx,dword ptr [eax]
 0051C365    call        dword ptr [edx+128];TmwCustomEdit.SetDefaultKeystrokes
 0051C36B    mov         dword ptr [ebx+2C0],0C0C0C0;TmwCustomEdit.fRightEdgeColor:TColor
 0051C375    mov         byte ptr [ebx+3A0],0;TmwCustomEdit.fWantTabs:Boolean
 0051C37C    mov         dword ptr [ebx+3A8],8;TmwCustomEdit.fTabWidth:Integer
 0051C386    mov         dl,1
 0051C388    mov         eax,[0050FBE4];TmwEditSearch
 0051C38D    call        TmwEditSearch.Create;TmwEditSearch.Create
 0051C392    mov         dword ptr [ebx+3F0],eax;TmwCustomEdit.fTSearch:TmwEditSearch
 0051C398    movzx       eax,word ptr ds:[51C3F0];0x3C3 gvar_0051C3F0
 0051C39F    mov         word ptr [ebx+3CE],ax;TmwCustomEdit.fOptions:TmwEditorOptions
 0051C3A6    mov         eax,ebx
 0051C3A8    cmp         byte ptr [ebp-1],0
>0051C3AC    je          0051C3BD
 0051C3AE    call        @AfterConstruction
 0051C3B3    pop         dword ptr fs:[0]
 0051C3BA    add         esp,0C
 0051C3BD    mov         eax,ebx
 0051C3BF    pop         esi
 0051C3C0    pop         ebx
 0051C3C1    pop         ecx
 0051C3C2    pop         ebp
 0051C3C3    ret
*}
end;

//0051C3F4
procedure TmwCustomEdit.CreateParams(var Params:TCreateParams);
begin
{*
 0051C3F4    push        ebx
 0051C3F5    push        esi
 0051C3F6    mov         esi,edx
 0051C3F8    mov         ebx,eax
 0051C3FA    mov         edx,esi
 0051C3FC    mov         eax,ebx
 0051C3FE    call        TWinControl.CreateParams
 0051C403    mov         eax,dword ptr [esi+4];TCreateParams.Style:DWORD
 0051C406    movzx       edx,byte ptr [ebx+2C4];TmwCustomEdit.FScrollBars:TScrollStyle
 0051C40D    or          eax,dword ptr [edx*4+786C20]
 0051C414    movzx       edx,byte ptr [ebx+340];TmwCustomEdit.fBorderStyle:TBorderStyle
 0051C41B    or          eax,dword ptr [edx*4+786C30]
 0051C422    or          eax,2000000
 0051C427    mov         dword ptr [esi+4],eax;TCreateParams.Style:DWORD
 0051C42A    mov         eax,[0078D264];^NewStyleControls:Boolean
 0051C42F    cmp         byte ptr [eax],0
>0051C432    je          0051C454
 0051C434    cmp         byte ptr [ebx+1E9],0;TmwCustomEdit.FCtl3D:Boolean
>0051C43B    je          0051C454
 0051C43D    cmp         byte ptr [ebx+340],1;TmwCustomEdit.fBorderStyle:TBorderStyle
>0051C444    jne         0051C454
 0051C446    and         dword ptr [esi+4],0FF7FFFFF;TCreateParams.Style:DWORD
 0051C44D    or          dword ptr [esi+8],200;TCreateParams.ExStyle:DWORD
 0051C454    pop         esi
 0051C455    pop         ebx
 0051C456    ret
*}
end;

//0051C458
procedure sub_0051C458(?:TmwCustomEdit);
begin
{*
 0051C458    push        ebx
 0051C459    mov         ebx,eax
 0051C45B    dec         dword ptr [ebx+2B4]
 0051C461    cmp         dword ptr [ebx+2B4],0
>0051C468    jne         0051C4B4
 0051C46A    mov         eax,ebx
 0051C46C    call        TWinControl.HandleAllocated
 0051C471    test        al,al
>0051C473    je          0051C4B4
 0051C475    test        byte ptr [ebx+3CC],2
>0051C47C    je          0051C487
 0051C47E    xor         edx,edx
 0051C480    mov         eax,ebx
 0051C482    call        00521064
 0051C487    test        byte ptr [ebx+3CC],1
>0051C48E    je          0051C497
 0051C490    mov         eax,ebx
 0051C492    call        00520FD0
 0051C497    movzx       eax,byte ptr ds:[51C4B8];0x0 gvar_0051C4B8
 0051C49E    cmp         al,byte ptr [ebx+3D4]
>0051C4A4    je          0051C4B4
 0051C4A6    movzx       edx,byte ptr ds:[51C4B8];0x0 gvar_0051C4B8
 0051C4AD    mov         eax,ebx
 0051C4AF    call        005287FC
 0051C4B4    pop         ebx
 0051C4B5    ret
*}
end;

//0051C4BC
destructor TmwCustomEdit.Destroy();
begin
{*
 0051C4BC    push        ebx
 0051C4BD    push        esi
 0051C4BE    call        @BeforeDestruction
 0051C4C3    mov         ebx,edx
 0051C4C5    mov         esi,eax
 0051C4C7    xor         edx,edx
 0051C4C9    mov         eax,esi
 0051C4CB    call        TmwCustomEdit.SetHighLighter
 0051C4D0    mov         eax,dword ptr [esi+368];TmwCustomEdit.fKeyStrokes:TmwKeyStrokes
 0051C4D6    call        TObject.Free
 0051C4DB    mov         eax,dword ptr [esi+298];TmwCustomEdit.fFontDummy:TFont
 0051C4E1    call        TObject.Free
 0051C4E6    mov         eax,dword ptr [esi+2A4];TmwCustomEdit.fLines:TStrings
 0051C4EC    call        TObject.Free
 0051C4F1    mov         eax,dword ptr [esi+2D8];TmwCustomEdit.fSelectedColor:TmwSelectedColor
 0051C4F7    call        TObject.Free
 0051C4FC    mov         eax,dword ptr [esi+324];TmwCustomEdit.fBookMarkOpt:TmwBookMarkOpt
 0051C502    call        TObject.Free
 0051C507    mov         eax,dword ptr [esi+370];TmwCustomEdit.fMarkList:TMarkList
 0051C50D    call        TObject.Free
 0051C512    mov         eax,dword ptr [esi+2DC];TmwCustomEdit.fUndoList:TUndoList
 0051C518    call        TObject.Free
 0051C51D    mov         eax,dword ptr [esi+2E0];TmwCustomEdit.fRedoList:TUndoList
 0051C523    call        TObject.Free
 0051C528    mov         eax,dword ptr [esi+3A4];TmwCustomEdit.fGutter:TmwGutter
 0051C52E    call        TObject.Free
 0051C533    mov         eax,dword ptr [esi+3B8];TmwCustomEdit.fTextDrawer:TheTextDrawer
 0051C539    call        TObject.Free
 0051C53E    mov         eax,dword ptr [esi+3D0];TmwCustomEdit.fInternalImage:TmwInternalImage
 0051C544    call        TObject.Free
 0051C549    mov         eax,dword ptr [esi+3F0];TmwCustomEdit.fTSearch:TmwEditSearch
 0051C54F    call        TObject.Free
 0051C554    mov         edx,ebx
 0051C556    and         dl,0FC
 0051C559    mov         eax,esi
 0051C55B    call        TCustomControl.Destroy
 0051C560    test        bl,bl
>0051C562    jle         0051C56B
 0051C564    mov         eax,esi
 0051C566    call        @ClassDestroy
 0051C56B    pop         esi
 0051C56C    pop         ebx
 0051C56D    ret
*}
end;

//0051C570
procedure sub_0051C570(?:TmwCustomEdit; ?:TPoint);
begin
{*
 0051C570    push        esi
 0051C571    mov         ecx,dword ptr [eax+278];TmwCustomEdit.fBlockBegin:TPoint
 0051C577    mov         dword ptr [edx],ecx
 0051C579    mov         ecx,dword ptr [eax+27C]
 0051C57F    mov         dword ptr [edx+4],ecx
 0051C582    mov         esi,dword ptr [eax+27C]
 0051C588    mov         ecx,dword ptr [eax+284]
 0051C58E    cmp         esi,ecx
>0051C590    jle         0051C5A5
 0051C592    mov         ecx,dword ptr [eax+280];TmwCustomEdit.fBlockEnd:TPoint
 0051C598    mov         dword ptr [edx],ecx
 0051C59A    mov         ecx,dword ptr [eax+284]
 0051C5A0    mov         dword ptr [edx+4],ecx
 0051C5A3    pop         esi
 0051C5A4    ret
 0051C5A5    cmp         esi,ecx
>0051C5A7    jne         0051C5C8
 0051C5A9    mov         ecx,dword ptr [eax+280];TmwCustomEdit.fBlockEnd:TPoint
 0051C5AF    cmp         ecx,dword ptr [eax+278];TmwCustomEdit.fBlockBegin:TPoint
>0051C5B5    jge         0051C5C8
 0051C5B7    mov         ecx,dword ptr [eax+280];TmwCustomEdit.fBlockEnd:TPoint
 0051C5BD    mov         dword ptr [edx],ecx
 0051C5BF    mov         ecx,dword ptr [eax+284]
 0051C5C5    mov         dword ptr [edx+4],ecx
 0051C5C8    pop         esi
 0051C5C9    ret
*}
end;

//0051C5CC
procedure sub_0051C5CC(?:TmwCustomEdit; ?:TPoint);
begin
{*
 0051C5CC    push        esi
 0051C5CD    mov         ecx,dword ptr [eax+280];TmwCustomEdit.fBlockEnd:TPoint
 0051C5D3    mov         dword ptr [edx],ecx
 0051C5D5    mov         ecx,dword ptr [eax+284]
 0051C5DB    mov         dword ptr [edx+4],ecx
 0051C5DE    mov         esi,dword ptr [eax+27C]
 0051C5E4    mov         ecx,dword ptr [eax+284]
 0051C5EA    cmp         esi,ecx
>0051C5EC    jle         0051C601
 0051C5EE    mov         ecx,dword ptr [eax+278];TmwCustomEdit.fBlockBegin:TPoint
 0051C5F4    mov         dword ptr [edx],ecx
 0051C5F6    mov         ecx,dword ptr [eax+27C]
 0051C5FC    mov         dword ptr [edx+4],ecx
 0051C5FF    pop         esi
 0051C600    ret
 0051C601    cmp         esi,ecx
>0051C603    jne         0051C624
 0051C605    mov         ecx,dword ptr [eax+280];TmwCustomEdit.fBlockEnd:TPoint
 0051C60B    cmp         ecx,dword ptr [eax+278];TmwCustomEdit.fBlockBegin:TPoint
>0051C611    jge         0051C624
 0051C613    mov         ecx,dword ptr [eax+278];TmwCustomEdit.fBlockBegin:TPoint
 0051C619    mov         dword ptr [edx],ecx
 0051C61B    mov         ecx,dword ptr [eax+27C]
 0051C621    mov         dword ptr [edx+4],ecx
 0051C624    pop         esi
 0051C625    ret
*}
end;

//0051C628
{*function sub_0051C628(?:TmwCustomEdit):?;
begin
 0051C628    mov         eax,dword ptr [eax+288]
 0051C62E    inc         eax
 0051C62F    ret
end;*}

//0051C630
function TmwCustomEdit.CaretXPix:Integer;
begin
{*
 0051C630    push        ebx
 0051C631    add         esp,0FFFFFFF0
 0051C634    mov         ebx,eax
 0051C636    mov         eax,dword ptr [ebx+288];TmwCustomEdit.fCaretX:Integer
 0051C63C    inc         eax
 0051C63D    mov         dword ptr [esp],eax
 0051C640    mov         dword ptr [esp+4],1
 0051C648    lea         ecx,[esp+8]
 0051C64C    mov         edx,esp
 0051C64E    mov         eax,ebx
 0051C650    call        TmwCustomEdit.RowColumnToPixels
 0051C655    mov         eax,dword ptr [esp+8]
 0051C659    add         esp,10
 0051C65C    pop         ebx
 0051C65D    ret
*}
end;

//0051C660
{*function sub_0051C660(?:TmwCustomEdit):?;
begin
 0051C660    mov         eax,dword ptr [eax+28C]
 0051C666    inc         eax
 0051C667    ret
end;*}

//0051C668
function TmwCustomEdit.CaretYPix:Integer;
begin
{*
 0051C668    push        ebx
 0051C669    add         esp,0FFFFFFF0
 0051C66C    mov         ebx,eax
 0051C66E    mov         dword ptr [esp],1
 0051C675    mov         eax,dword ptr [ebx+28C];TmwCustomEdit.fCaretY:Integer
 0051C67B    inc         eax
 0051C67C    mov         dword ptr [esp+4],eax
 0051C680    lea         ecx,[esp+8]
 0051C684    mov         edx,esp
 0051C686    mov         eax,ebx
 0051C688    call        TmwCustomEdit.RowColumnToPixels
 0051C68D    mov         eax,dword ptr [esp+0C]
 0051C691    add         esp,10
 0051C694    pop         ebx
 0051C695    ret
*}
end;

//0051C698
procedure sub_0051C698(?:TmwCustomEdit);
begin
{*
 0051C698    push        ebx
 0051C699    mov         ebx,eax
 0051C69B    mov         eax,ebx
 0051C69D    call        00528760
 0051C6A2    mov         dl,1
 0051C6A4    mov         eax,ebx
 0051C6A6    call        0052841C
 0051C6AB    pop         ebx
 0051C6AC    ret
*}
end;

//0051C6B0
{*function TmwCustomEdit.GetFont:?;
begin
 0051C6B0    mov         eax,dword ptr [eax+64];TmwCustomEdit.FFont:TFont
 0051C6B3    ret
end;*}

//0051C6B4
{*function TmwCustomEdit.GetLineCount:?;
begin
 0051C6B4    mov         eax,dword ptr [eax+2A4];TmwCustomEdit.fLines:TStrings
 0051C6BA    mov         edx,dword ptr [eax]
 0051C6BC    call        dword ptr [edx+14];TStrings.GetCount
 0051C6BF    ret
end;*}

//0051C6C0
{*function sub_0051C6C0(?:TmwCustomEdit):?;
begin
 0051C6C0    mov         eax,dword ptr [eax+2AC];TmwCustomEdit.fLeftChar:Integer
 0051C6C6    inc         eax
 0051C6C7    ret
end;*}

//0051C6C8
procedure sub_0051C6C8(?:TmwCustomEdit; ?:UnicodeString);
begin
{*
 0051C6C8    push        ebx
 0051C6C9    push        esi
 0051C6CA    mov         esi,edx
 0051C6CC    mov         ebx,eax
 0051C6CE    mov         eax,esi
 0051C6D0    call        @UStrClr
 0051C6D5    mov         eax,dword ptr [ebx+2A4]
 0051C6DB    mov         edx,dword ptr [eax]
 0051C6DD    call        dword ptr [edx+14]
 0051C6E0    test        eax,eax
>0051C6E2    jle         0051C70A
 0051C6E4    mov         eax,dword ptr [ebx+2A4]
 0051C6EA    mov         edx,dword ptr [eax]
 0051C6EC    call        dword ptr [edx+14]
 0051C6EF    cmp         eax,dword ptr [ebx+28C]
>0051C6F5    jle         0051C70A
 0051C6F7    mov         ecx,esi
 0051C6F9    mov         edx,dword ptr [ebx+28C]
 0051C6FF    mov         eax,dword ptr [ebx+2A4]
 0051C705    mov         ebx,dword ptr [eax]
 0051C707    call        dword ptr [ebx+0C]
 0051C70A    pop         esi
 0051C70B    pop         ebx
 0051C70C    ret
*}
end;

//0051C710
{*function sub_0051C710(?:TmwCustomEdit):?;
begin
 0051C710    mov         edx,dword ptr [eax+278];TmwCustomEdit.fBlockBegin:TPoint
 0051C716    cmp         edx,dword ptr [eax+280];TmwCustomEdit.fBlockEnd:TPoint
>0051C71C    jne         0051C738
 0051C71E    mov         edx,dword ptr [eax+27C]
 0051C724    cmp         edx,dword ptr [eax+284]
>0051C72A    je          0051C735
 0051C72C    cmp         byte ptr [eax+390],1;TmwCustomEdit.fSelectionMode:TSelectionMode
>0051C733    jne         0051C738
 0051C735    xor         eax,eax
 0051C737    ret
 0051C738    mov         al,1
 0051C73A    ret
end;*}

//0051C73C
{*procedure sub_0051C73C(?:UString; ?:?; ?:?; ?:?);
begin
 0051C73C    push        ebp
 0051C73D    mov         ebp,esp
 0051C73F    push        ecx
 0051C740    push        ebx
 0051C741    push        esi
 0051C742    push        edi
 0051C743    mov         dword ptr [ebp-4],ecx
 0051C746    mov         ebx,edx
 0051C748    mov         edi,eax
 0051C74A    mov         eax,edi
 0051C74C    test        eax,eax
>0051C74E    je          0051C755
 0051C750    sub         eax,4
 0051C753    mov         eax,dword ptr [eax]
 0051C755    mov         esi,eax
 0051C757    cmp         esi,ebx
>0051C759    jl          0051C7A2
 0051C75B    cmp         dword ptr [ebp-4],0
>0051C75F    jle         0051C7A2
 0051C761    dec         ebx
 0051C762    mov         eax,edi
 0051C764    call        @UStrToPWChar
 0051C769    mov         edx,ebx
 0051C76B    add         edx,edx
 0051C76D    add         eax,edx
 0051C76F    mov         edi,eax
 0051C771    mov         eax,esi
 0051C773    sub         eax,ebx
 0051C775    mov         edx,dword ptr [ebp-4]
 0051C778    call        0051048C
 0051C77D    mov         ebx,eax
 0051C77F    mov         ecx,ebx
 0051C781    add         ecx,ecx
 0051C783    mov         edx,dword ptr [ebp+8]
 0051C786    mov         edx,dword ptr [edx]
 0051C788    mov         eax,edi
 0051C78A    call        Move
 0051C78F    mov         eax,ebx
 0051C791    add         eax,eax
 0051C793    mov         edx,dword ptr [ebp+8]
 0051C796    add         dword ptr [edx],eax
 0051C798    mov         eax,dword ptr [ebp+8]
 0051C79B    mov         eax,dword ptr [eax]
 0051C79D    mov         word ptr [eax],0
 0051C7A2    pop         edi
 0051C7A3    pop         esi
 0051C7A4    pop         ebx
 0051C7A5    pop         ecx
 0051C7A6    pop         ebp
 0051C7A7    ret         4
end;*}

//0051C7AC
{*procedure sub_0051C7AC(?:?; ?:?; ?:?; ?:?);
begin
 0051C7AC    push        ebp
 0051C7AD    mov         ebp,esp
 0051C7AF    add         esp,0FFFFFFF8
 0051C7B2    push        ebx
 0051C7B3    push        esi
 0051C7B4    push        edi
 0051C7B5    mov         esi,ecx
 0051C7B7    mov         dword ptr [ebp-8],edx
 0051C7BA    mov         dword ptr [ebp-4],eax
 0051C7BD    mov         ebx,dword ptr [ebp+8]
 0051C7C0    mov         edi,dword ptr [ebx]
 0051C7C2    push        ebx
 0051C7C3    mov         ecx,esi
 0051C7C5    mov         edx,dword ptr [ebp-8]
 0051C7C8    mov         eax,dword ptr [ebp-4]
 0051C7CB    call        0051C73C
 0051C7D0    mov         eax,dword ptr [ebx]
 0051C7D2    sub         eax,edi
 0051C7D4    sar         eax,1
>0051C7D6    jns         0051C7DB
 0051C7D8    adc         eax,0
 0051C7DB    sub         esi,eax
 0051C7DD    mov         eax,dword ptr [ebx]
 0051C7DF    mov         cx,20
 0051C7E3    mov         edx,esi
 0051C7E5    call        @FillChar
 0051C7EA    mov         eax,esi
 0051C7EC    add         eax,eax
 0051C7EE    add         dword ptr [ebx],eax
 0051C7F0    pop         edi
 0051C7F1    pop         esi
 0051C7F2    pop         ebx
 0051C7F3    pop         ecx
 0051C7F4    pop         ecx
 0051C7F5    pop         ebp
 0051C7F6    ret         4
end;*}

//0051C7FC
{*procedure sub_0051C7FC(?:TmwCustomEdit; ?:?);
begin
 0051C7FC    push        ebp
 0051C7FD    mov         ebp,esp
 0051C7FF    mov         ecx,0D
 0051C804    push        0
 0051C806    push        0
 0051C808    dec         ecx
>0051C809    jne         0051C804
 0051C80B    push        ebx
 0051C80C    push        esi
 0051C80D    push        edi
 0051C80E    mov         dword ptr [ebp-4],edx
 0051C811    mov         ebx,eax
 0051C813    xor         eax,eax
 0051C815    push        ebp
 0051C816    push        51CB79
 0051C81B    push        dword ptr fs:[eax]
 0051C81E    mov         dword ptr fs:[eax],esp
 0051C821    mov         eax,ebx
 0051C823    call        0051C710
 0051C828    test        al,al
>0051C82A    jne         0051C839
 0051C82C    mov         eax,dword ptr [ebp-4]
 0051C82F    call        @UStrClr
>0051C834    jmp         0051CB51
 0051C839    lea         edx,[ebp-2C]
 0051C83C    mov         eax,ebx
 0051C83E    call        0051C570
 0051C843    mov         eax,dword ptr [ebp-2C]
 0051C846    mov         dword ptr [ebp-14],eax
 0051C849    mov         eax,dword ptr [ebp-28]
 0051C84C    dec         eax
 0051C84D    mov         dword ptr [ebp-8],eax
 0051C850    lea         edx,[ebp-34]
 0051C853    mov         eax,ebx
 0051C855    call        0051C5CC
 0051C85A    mov         eax,dword ptr [ebp-34]
 0051C85D    mov         dword ptr [ebp-18],eax
 0051C860    mov         eax,dword ptr [ebp-30]
 0051C863    dec         eax
 0051C864    mov         dword ptr [ebp-0C],eax
 0051C867    xor         eax,eax
 0051C869    mov         dword ptr [ebp-10],eax
 0051C86C    movzx       eax,byte ptr [ebx+390];TmwCustomEdit.fSelectionMode:TSelectionMode
 0051C873    sub         al,1
>0051C875    jb          0051C88A
>0051C877    je          0051C982
 0051C87D    dec         al
>0051C87F    je          0051CA42
>0051C885    jmp         0051CB51
 0051C88A    mov         eax,dword ptr [ebp-8]
 0051C88D    cmp         eax,dword ptr [ebp-0C]
>0051C890    jne         0051C8BD
 0051C892    mov         eax,dword ptr [ebp-4]
 0051C895    push        eax
 0051C896    lea         ecx,[ebp-38]
 0051C899    mov         edx,dword ptr [ebp-8]
 0051C89C    mov         eax,dword ptr [ebx+2A4];TmwCustomEdit.fLines:TStrings
 0051C8A2    mov         ebx,dword ptr [eax]
 0051C8A4    call        dword ptr [ebx+0C];TStrings.Get
 0051C8A7    mov         eax,dword ptr [ebp-38]
 0051C8AA    mov         ecx,dword ptr [ebp-18]
 0051C8AD    sub         ecx,dword ptr [ebp-14]
 0051C8B0    mov         edx,dword ptr [ebp-14]
 0051C8B3    call        @UStrCopy
>0051C8B8    jmp         0051CB51
 0051C8BD    lea         eax,[ebp-3C]
 0051C8C0    push        eax
 0051C8C1    lea         ecx,[ebp-40]
 0051C8C4    mov         edx,dword ptr [ebp-8]
 0051C8C7    mov         eax,dword ptr [ebx+2A4];TmwCustomEdit.fLines:TStrings
 0051C8CD    mov         esi,dword ptr [eax]
 0051C8CF    call        dword ptr [esi+0C];TStrings.Get
 0051C8D2    mov         eax,dword ptr [ebp-40]
 0051C8D5    mov         ecx,7FFFFFFF
 0051C8DA    mov         edx,dword ptr [ebp-14]
 0051C8DD    call        @UStrCopy
 0051C8E2    mov         edx,dword ptr [ebp-3C]
 0051C8E5    mov         eax,dword ptr [ebp-4]
 0051C8E8    mov         ecx,51CB94;'
'
 0051C8ED    call        @UStrCat3
 0051C8F2    mov         eax,dword ptr [ebp-8]
 0051C8F5    inc         eax
 0051C8F6    mov         esi,dword ptr [ebp-0C]
 0051C8F9    dec         esi
 0051C8FA    sub         esi,eax
>0051C8FC    jl          0051C949
 0051C8FE    inc         esi
 0051C8FF    mov         dword ptr [ebp-1C],eax
 0051C902    mov         eax,dword ptr [ebp-4]
 0051C905    push        dword ptr [eax]
 0051C907    lea         eax,[ebp-44]
 0051C90A    push        eax
 0051C90B    lea         ecx,[ebp-48]
 0051C90E    mov         edx,dword ptr [ebp-1C]
 0051C911    mov         eax,dword ptr [ebx+2A4];TmwCustomEdit.fLines:TStrings
 0051C917    mov         edi,dword ptr [eax]
 0051C919    call        dword ptr [edi+0C];TStrings.Get
 0051C91C    mov         eax,dword ptr [ebp-48]
 0051C91F    mov         ecx,7FFFFFFF
 0051C924    mov         edx,1
 0051C929    call        @UStrCopy
 0051C92E    push        dword ptr [ebp-44]
 0051C931    push        51CB94;'
'
 0051C936    mov         eax,dword ptr [ebp-4]
 0051C939    mov         edx,3
 0051C93E    call        @UStrCatN
 0051C943    inc         dword ptr [ebp-1C]
 0051C946    dec         esi
>0051C947    jne         0051C902
 0051C949    lea         eax,[ebp-4C]
 0051C94C    push        eax
 0051C94D    lea         ecx,[ebp-50]
 0051C950    mov         edx,dword ptr [ebp-0C]
 0051C953    mov         eax,dword ptr [ebx+2A4];TmwCustomEdit.fLines:TStrings
 0051C959    mov         ebx,dword ptr [eax]
 0051C95B    call        dword ptr [ebx+0C];TStrings.Get
 0051C95E    mov         eax,dword ptr [ebp-50]
 0051C961    mov         ecx,dword ptr [ebp-18]
 0051C964    dec         ecx
 0051C965    mov         edx,1
 0051C96A    call        @UStrCopy
 0051C96F    mov         edx,dword ptr [ebp-4C]
 0051C972    mov         eax,dword ptr [ebp-4]
 0051C975    call        @UStrCat
 0051C97A    mov         eax,dword ptr [ebp-4]
>0051C97D    jmp         0051CB51
 0051C982    mov         eax,dword ptr [ebp-14]
 0051C985    cmp         eax,dword ptr [ebp-18]
>0051C988    jle         0051C995
 0051C98A    lea         edx,[ebp-18]
 0051C98D    lea         eax,[ebp-14]
 0051C990    call        005104A4
 0051C995    mov         eax,dword ptr [ebp-18]
 0051C998    sub         eax,dword ptr [ebp-14]
 0051C99B    mov         dword ptr [ebp-20],eax
 0051C99E    mov         eax,dword ptr [ebp-20]
 0051C9A1    add         eax,2
 0051C9A4    mov         edx,dword ptr [ebp-0C]
 0051C9A7    sub         edx,dword ptr [ebp-8]
 0051C9AA    imul        edx
 0051C9AC    add         eax,dword ptr [ebp-20]
 0051C9AF    mov         dword ptr [ebp-10],eax
 0051C9B2    mov         eax,dword ptr [ebp-4]
 0051C9B5    mov         edx,dword ptr [ebp-10]
 0051C9B8    call        @UStrSetLength
 0051C9BD    mov         eax,dword ptr [ebp-4]
 0051C9C0    mov         eax,dword ptr [eax]
 0051C9C2    call        @UStrToPWChar
 0051C9C7    mov         dword ptr [ebp-24],eax
 0051C9CA    mov         eax,dword ptr [ebp-8]
 0051C9CD    mov         esi,dword ptr [ebp-0C]
 0051C9D0    dec         esi
 0051C9D1    sub         esi,eax
>0051C9D3    jl          0051CA1A
 0051C9D5    inc         esi
 0051C9D6    mov         dword ptr [ebp-1C],eax
 0051C9D9    lea         eax,[ebp-24]
 0051C9DC    push        eax
 0051C9DD    lea         ecx,[ebp-54]
 0051C9E0    mov         edx,dword ptr [ebp-1C]
 0051C9E3    mov         eax,dword ptr [ebx+2A4];TmwCustomEdit.fLines:TStrings
 0051C9E9    mov         edi,dword ptr [eax]
 0051C9EB    call        dword ptr [edi+0C];TStrings.Get
 0051C9EE    mov         eax,dword ptr [ebp-54]
 0051C9F1    mov         ecx,dword ptr [ebp-20]
 0051C9F4    mov         edx,dword ptr [ebp-14]
 0051C9F7    call        0051C7AC
 0051C9FC    lea         eax,[ebp-24]
 0051C9FF    push        eax
 0051CA00    mov         eax,51CB94;'
'
 0051CA05    mov         ecx,7FFFFFFF
 0051CA0A    mov         edx,1
 0051CA0F    call        0051C73C
 0051CA14    inc         dword ptr [ebp-1C]
 0051CA17    dec         esi
>0051CA18    jne         0051C9D9
 0051CA1A    lea         eax,[ebp-24]
 0051CA1D    push        eax
 0051CA1E    lea         ecx,[ebp-58]
 0051CA21    mov         edx,dword ptr [ebp-0C]
 0051CA24    mov         eax,dword ptr [ebx+2A4];TmwCustomEdit.fLines:TStrings
 0051CA2A    mov         ebx,dword ptr [eax]
 0051CA2C    call        dword ptr [ebx+0C];TStrings.Get
 0051CA2F    mov         eax,dword ptr [ebp-58]
 0051CA32    mov         ecx,dword ptr [ebp-20]
 0051CA35    mov         edx,dword ptr [ebp-14]
 0051CA38    call        0051C7AC
>0051CA3D    jmp         0051CB51
 0051CA42    mov         eax,dword ptr [ebp-8]
 0051CA45    mov         esi,dword ptr [ebp-0C]
 0051CA48    sub         esi,eax
>0051CA4A    jl          0051CA7F
 0051CA4C    inc         esi
 0051CA4D    mov         dword ptr [ebp-1C],eax
 0051CA50    lea         ecx,[ebp-5C]
 0051CA53    mov         edx,dword ptr [ebp-1C]
 0051CA56    mov         eax,dword ptr [ebx+2A4];TmwCustomEdit.fLines:TStrings
 0051CA5C    mov         edi,dword ptr [eax]
 0051CA5E    call        dword ptr [edi+0C];TStrings.Get
 0051CA61    mov         eax,dword ptr [ebp-5C]
 0051CA64    mov         dword ptr [ebp-60],eax
 0051CA67    mov         eax,dword ptr [ebp-60]
 0051CA6A    test        eax,eax
>0051CA6C    je          0051CA73
 0051CA6E    sub         eax,4
 0051CA71    mov         eax,dword ptr [eax]
 0051CA73    add         eax,2
 0051CA76    add         dword ptr [ebp-10],eax
 0051CA79    inc         dword ptr [ebp-1C]
 0051CA7C    dec         esi
>0051CA7D    jne         0051CA50
 0051CA7F    mov         eax,dword ptr [ebx+2A4];TmwCustomEdit.fLines:TStrings
 0051CA85    mov         edx,dword ptr [eax]
 0051CA87    call        dword ptr [edx+14];TStrings.GetCount
 0051CA8A    cmp         eax,dword ptr [ebp-0C]
>0051CA8D    jne         0051CA93
 0051CA8F    sub         dword ptr [ebp-10],2
 0051CA93    mov         eax,dword ptr [ebp-4]
 0051CA96    mov         edx,dword ptr [ebp-10]
 0051CA99    call        @UStrSetLength
 0051CA9E    mov         eax,dword ptr [ebp-4]
 0051CAA1    mov         eax,dword ptr [eax]
 0051CAA3    call        @UStrToPWChar
 0051CAA8    mov         dword ptr [ebp-24],eax
 0051CAAB    mov         eax,dword ptr [ebp-8]
 0051CAAE    mov         esi,dword ptr [ebp-0C]
 0051CAB1    dec         esi
 0051CAB2    sub         esi,eax
>0051CAB4    jl          0051CAFF
 0051CAB6    inc         esi
 0051CAB7    mov         dword ptr [ebp-1C],eax
 0051CABA    lea         eax,[ebp-24]
 0051CABD    push        eax
 0051CABE    lea         ecx,[ebp-64]
 0051CAC1    mov         edx,dword ptr [ebp-1C]
 0051CAC4    mov         eax,dword ptr [ebx+2A4];TmwCustomEdit.fLines:TStrings
 0051CACA    mov         edi,dword ptr [eax]
 0051CACC    call        dword ptr [edi+0C];TStrings.Get
 0051CACF    mov         eax,dword ptr [ebp-64]
 0051CAD2    mov         ecx,7FFFFFFF
 0051CAD7    mov         edx,1
 0051CADC    call        0051C73C
 0051CAE1    lea         eax,[ebp-24]
 0051CAE4    push        eax
 0051CAE5    mov         eax,51CB94;'
'
 0051CAEA    mov         ecx,7FFFFFFF
 0051CAEF    mov         edx,1
 0051CAF4    call        0051C73C
 0051CAF9    inc         dword ptr [ebp-1C]
 0051CAFC    dec         esi
>0051CAFD    jne         0051CABA
 0051CAFF    lea         eax,[ebp-24]
 0051CB02    push        eax
 0051CB03    lea         ecx,[ebp-68]
 0051CB06    mov         edx,dword ptr [ebp-0C]
 0051CB09    mov         eax,dword ptr [ebx+2A4];TmwCustomEdit.fLines:TStrings
 0051CB0F    mov         esi,dword ptr [eax]
 0051CB11    call        dword ptr [esi+0C];TStrings.Get
 0051CB14    mov         eax,dword ptr [ebp-68]
 0051CB17    mov         ecx,7FFFFFFF
 0051CB1C    mov         edx,1
 0051CB21    call        0051C73C
 0051CB26    mov         eax,dword ptr [ebx+2A4];TmwCustomEdit.fLines:TStrings
 0051CB2C    mov         edx,dword ptr [eax]
 0051CB2E    call        dword ptr [edx+14];TStrings.GetCount
 0051CB31    mov         edx,dword ptr [ebp-0C]
 0051CB34    inc         edx
 0051CB35    cmp         eax,edx
>0051CB37    jle         0051CB51
 0051CB39    lea         eax,[ebp-24]
 0051CB3C    push        eax
 0051CB3D    mov         eax,51CB94;'
'
 0051CB42    mov         ecx,7FFFFFFF
 0051CB47    mov         edx,1
 0051CB4C    call        0051C73C
 0051CB51    xor         eax,eax
 0051CB53    pop         edx
 0051CB54    pop         ecx
 0051CB55    pop         ecx
 0051CB56    mov         dword ptr fs:[eax],edx
 0051CB59    push        51CB80
 0051CB5E    lea         eax,[ebp-68]
 0051CB61    mov         edx,2
 0051CB66    call        @UStrArrayClr
 0051CB6B    lea         eax,[ebp-5C]
 0051CB6E    mov         edx,0A
 0051CB73    call        @UStrArrayClr
 0051CB78    ret
>0051CB79    jmp         @HandleFinally
>0051CB7E    jmp         0051CB5E
 0051CB80    pop         edi
 0051CB81    pop         esi
 0051CB82    pop         ebx
 0051CB83    mov         esp,ebp
 0051CB85    pop         ebp
 0051CB86    ret
end;*}

//0051CB9C
{*procedure sub_0051CB9C(?:TmwCustomEdit; ?:?);
begin
 0051CB9C    push        ebx
 0051CB9D    push        esi
 0051CB9E    mov         esi,edx
 0051CBA0    mov         ebx,eax
 0051CBA2    mov         edx,esi
 0051CBA4    mov         eax,dword ptr [ebx+2A4]
 0051CBAA    mov         ecx,dword ptr [eax]
 0051CBAC    call        dword ptr [ecx+1C]
 0051CBAF    pop         esi
 0051CBB0    pop         ebx
 0051CBB1    ret
end;*}

//0051CBB4
{*function sub_0051CBB4(?:TmwCustomEdit):?;
begin
 0051CBB4    mov         eax,dword ptr [eax+2D0];TmwCustomEdit.fTopLine:Integer
 0051CBBA    inc         eax
 0051CBBB    ret
end;*}

//0051CBBC
procedure sub_0051CBBC(?:TmwCustomEdit);
begin
{*
 0051CBBC    push        ebx
 0051CBBD    mov         ebx,eax
 0051CBBF    test        byte ptr [ebx+3CC],20
>0051CBC6    je          0051CBE1
 0051CBC8    mov         eax,ebx
 0051CBCA    call        TWinControl.GetHandle
 0051CBCF    push        eax
 0051CBD0    call        user32.HideCaret
 0051CBD5    test        eax,eax
>0051CBD7    je          0051CBE1
 0051CBD9    and         word ptr [ebx+3CC],0FFFFFFDF
 0051CBE1    pop         ebx
 0051CBE2    ret
*}
end;

//0051CBE4
procedure sub_0051CBE4(?:TmwCustomEdit);
begin
{*
 0051CBE4    inc         dword ptr [eax+2B4]
 0051CBEA    ret
*}
end;

//0051CBEC
{*function sub_0051CBEC(?:TmwCustomEdit; ?:Integer; ?:Integer):?;
begin
 0051CBEC    push        ebx
 0051CBED    add         esp,0FFFFFFE8
 0051CBF0    mov         dword ptr [esp+4],ecx
 0051CBF4    mov         dword ptr [esp],edx
 0051CBF7    mov         ebx,eax
 0051CBF9    cmp         byte ptr [ebx+59],0
>0051CBFD    je          0051CD3A
 0051CC03    mov         eax,ebx
 0051CC05    call        TWinControl.HandleAllocated
 0051CC0A    test        al,al
>0051CC0C    je          0051CD3A
 0051CC12    cmp         dword ptr [esp],0FFFFFFFF
>0051CC16    jne         0051CC7A
 0051CC18    cmp         dword ptr [esp+4],0FFFFFFFF
>0051CC1D    jne         0051CC7A
 0051CC1F    mov         eax,ebx
 0051CC21    call        TControl.GetClientHeight
 0051CC26    push        eax
 0051CC27    lea         eax,[esp+0C]
 0051CC2B    push        eax
 0051CC2C    mov         ecx,dword ptr [ebx+29C]
 0051CC32    xor         edx,edx
 0051CC34    xor         eax,eax
 0051CC36    call        Rect
 0051CC3B    test        byte ptr [ebx+3CC],4
>0051CC42    je          0051CC61
 0051CC44    lea         eax,[esp+8]
 0051CC48    push        eax
 0051CC49    lea         eax,[ebx+3BC]
 0051CC4F    push        eax
 0051CC50    lea         eax,[ebx+3BC]
 0051CC56    push        eax
 0051CC57    call        user32.UnionRect
>0051CC5C    jmp         0051CD3A
 0051CC61    push        0
 0051CC63    lea         eax,[esp+0C]
 0051CC67    push        eax
 0051CC68    mov         eax,ebx
 0051CC6A    call        TWinControl.GetHandle
 0051CC6F    push        eax
 0051CC70    call        user32.InvalidateRect
>0051CC75    jmp         0051CD3A
 0051CC7A    mov         eax,dword ptr [esp+4]
 0051CC7E    cmp         eax,dword ptr [esp]
>0051CC81    jge         0051CC8E
 0051CC83    mov         edx,esp
 0051CC85    lea         eax,[esp+4]
 0051CC89    call        005104A4
 0051CC8E    mov         eax,ebx
 0051CC90    call        0051CBB4
 0051CC95    mov         edx,eax
 0051CC97    mov         eax,dword ptr [esp]
 0051CC9A    call        00510484
 0051CC9F    mov         dword ptr [esp],eax
 0051CCA2    mov         eax,ebx
 0051CCA4    call        0051CBB4
 0051CCA9    mov         edx,eax
 0051CCAB    add         edx,dword ptr [ebx+2A8]
 0051CCB1    mov         eax,dword ptr [esp+4]
 0051CCB5    call        0051048C
 0051CCBA    mov         dword ptr [esp+4],eax
 0051CCBE    mov         eax,dword ptr [esp+4]
 0051CCC2    cmp         eax,dword ptr [esp]
>0051CCC5    jl          0051CD3A
 0051CCC7    mov         eax,ebx
 0051CCC9    call        0051CBB4
 0051CCCE    mov         edx,dword ptr [esp+4]
 0051CCD2    sub         edx,eax
 0051CCD4    inc         edx
 0051CCD5    imul        edx,dword ptr [ebx+2C8]
 0051CCDC    push        edx
 0051CCDD    lea         eax,[esp+0C]
 0051CCE1    push        eax
 0051CCE2    mov         eax,ebx
 0051CCE4    call        0051CBB4
 0051CCE9    mov         edx,dword ptr [esp+8]
 0051CCED    sub         edx,eax
 0051CCEF    imul        edx,dword ptr [ebx+2C8]
 0051CCF6    mov         ecx,dword ptr [ebx+29C]
 0051CCFC    xor         eax,eax
 0051CCFE    call        Rect
 0051CD03    test        byte ptr [ebx+3CC],4
>0051CD0A    je          0051CD26
 0051CD0C    lea         eax,[esp+8]
 0051CD10    push        eax
 0051CD11    lea         eax,[ebx+3BC]
 0051CD17    push        eax
 0051CD18    lea         eax,[ebx+3BC]
 0051CD1E    push        eax
 0051CD1F    call        user32.UnionRect
>0051CD24    jmp         0051CD3A
 0051CD26    push        0
 0051CD28    lea         eax,[esp+0C]
 0051CD2C    push        eax
 0051CD2D    mov         eax,ebx
 0051CD2F    call        TWinControl.GetHandle
 0051CD34    push        eax
 0051CD35    call        user32.InvalidateRect
 0051CD3A    add         esp,18
 0051CD3D    pop         ebx
 0051CD3E    ret
end;*}

//0051CD40
{*procedure sub_0051CD40(?:TmwCustomEdit; ?:?; ?:?);
begin
 0051CD40    push        ebx
 0051CD41    add         esp,0FFFFFFE8
 0051CD44    mov         dword ptr [esp+4],ecx
 0051CD48    mov         dword ptr [esp],edx
 0051CD4B    mov         ebx,eax
 0051CD4D    cmp         byte ptr [ebx+59],0
>0051CD51    je          0051CE90
 0051CD57    mov         eax,ebx
 0051CD59    call        TWinControl.HandleAllocated
 0051CD5E    test        al,al
>0051CD60    je          0051CE90
 0051CD66    cmp         dword ptr [esp],0FFFFFFFF
>0051CD6A    jne         0051CDC7
 0051CD6C    cmp         dword ptr [esp+4],0FFFFFFFF
>0051CD71    jne         0051CDC7
 0051CD73    lea         edx,[esp+8]
 0051CD77    mov         eax,ebx
 0051CD79    mov         ecx,dword ptr [eax]
 0051CD7B    call        dword ptr [ecx+54]
 0051CD7E    mov         eax,dword ptr [ebx+29C]
 0051CD84    mov         dword ptr [esp+8],eax
 0051CD88    test        byte ptr [ebx+3CC],4
>0051CD8F    je          0051CDAE
 0051CD91    lea         eax,[esp+8]
 0051CD95    push        eax
 0051CD96    lea         eax,[ebx+3BC]
 0051CD9C    push        eax
 0051CD9D    lea         eax,[ebx+3BC]
 0051CDA3    push        eax
 0051CDA4    call        user32.UnionRect
>0051CDA9    jmp         0051CE90
 0051CDAE    push        0
 0051CDB0    lea         eax,[esp+0C]
 0051CDB4    push        eax
 0051CDB5    mov         eax,ebx
 0051CDB7    call        TWinControl.GetHandle
 0051CDBC    push        eax
 0051CDBD    call        user32.InvalidateRect
>0051CDC2    jmp         0051CE90
 0051CDC7    mov         eax,dword ptr [esp+4]
 0051CDCB    cmp         eax,dword ptr [esp]
>0051CDCE    jge         0051CDDB
 0051CDD0    mov         edx,esp
 0051CDD2    lea         eax,[esp+4]
 0051CDD6    call        005104A4
 0051CDDB    mov         eax,ebx
 0051CDDD    call        0051CBB4
 0051CDE2    mov         edx,eax
 0051CDE4    mov         eax,dword ptr [esp]
 0051CDE7    call        00510484
 0051CDEC    mov         dword ptr [esp],eax
 0051CDEF    mov         eax,ebx
 0051CDF1    call        0051CBB4
 0051CDF6    mov         edx,eax
 0051CDF8    add         edx,dword ptr [ebx+2A8]
 0051CDFE    mov         eax,dword ptr [esp+4]
 0051CE02    call        0051048C
 0051CE07    mov         dword ptr [esp+4],eax
 0051CE0B    mov         eax,dword ptr [esp+4]
 0051CE0F    cmp         eax,dword ptr [esp]
>0051CE12    jl          0051CE90
 0051CE14    mov         eax,ebx
 0051CE16    call        0051CBB4
 0051CE1B    mov         edx,dword ptr [esp+4]
 0051CE1F    sub         edx,eax
 0051CE21    inc         edx
 0051CE22    imul        edx,dword ptr [ebx+2C8]
 0051CE29    push        edx
 0051CE2A    lea         eax,[esp+0C]
 0051CE2E    push        eax
 0051CE2F    mov         eax,ebx
 0051CE31    call        0051CBB4
 0051CE36    mov         edx,dword ptr [esp+8]
 0051CE3A    sub         edx,eax
 0051CE3C    imul        edx,dword ptr [ebx+2C8]
 0051CE43    push        edx
 0051CE44    mov         eax,ebx
 0051CE46    call        TControl.GetClientWidth
 0051CE4B    mov         ecx,eax
 0051CE4D    mov         eax,dword ptr [ebx+29C]
 0051CE53    pop         edx
 0051CE54    call        Rect
 0051CE59    test        byte ptr [ebx+3CC],4
>0051CE60    je          0051CE7C
 0051CE62    lea         eax,[esp+8]
 0051CE66    push        eax
 0051CE67    lea         eax,[ebx+3BC]
 0051CE6D    push        eax
 0051CE6E    lea         eax,[ebx+3BC]
 0051CE74    push        eax
 0051CE75    call        user32.UnionRect
>0051CE7A    jmp         0051CE90
 0051CE7C    push        0
 0051CE7E    lea         eax,[esp+0C]
 0051CE82    push        eax
 0051CE83    mov         eax,ebx
 0051CE85    call        TWinControl.GetHandle
 0051CE8A    push        eax
 0051CE8B    call        user32.InvalidateRect
 0051CE90    add         esp,18
 0051CE93    pop         ebx
 0051CE94    ret
end;*}

//0051CE98
procedure TmwCustomEdit.KeyDown(Key:Word; Shift:TShiftState);
begin
{*
 0051CE98    push        ebp
 0051CE99    mov         ebp,esp
 0051CE9B    add         esp,0FFFFFFF4
 0051CE9E    push        ebx
 0051CE9F    push        esi
 0051CEA0    push        edi
 0051CEA1    mov         word ptr [ebp-2],cx
 0051CEA5    mov         esi,edx
 0051CEA7    mov         ebx,eax
 0051CEA9    mov         edx,esi
 0051CEAB    movzx       ecx,word ptr [ebp-2]
 0051CEAF    mov         eax,ebx
 0051CEB1    call        TWinControl.KeyDown
 0051CEB6    xor         eax,eax
 0051CEB8    mov         dword ptr [ebp-8],eax
 0051CEBB    mov         word ptr [ebp-0A],0
 0051CEC1    xor         eax,eax
 0051CEC3    push        ebp
 0051CEC4    push        51CF2F
 0051CEC9    push        dword ptr fs:[eax]
 0051CECC    mov         dword ptr fs:[eax],esp
 0051CECF    lea         eax,[ebp-8]
 0051CED2    push        eax
 0051CED3    movzx       edx,word ptr [esi]
 0051CED6    movzx       ecx,word ptr [ebp-2]
 0051CEDA    mov         eax,ebx
 0051CEDC    call        0052357C
 0051CEE1    mov         edi,eax
 0051CEE3    test        di,di
>0051CEE6    je          0051CF0B
 0051CEE8    mov         word ptr [esi],0
 0051CEED    or          word ptr [ebx+3CC],10;TmwCustomEdit.fStateFlags:TmwStateFlags
 0051CEF5    mov         eax,dword ptr [ebp-8]
 0051CEF8    push        eax
 0051CEF9    movzx       ecx,word ptr [ebp-0A]
 0051CEFD    mov         edx,edi
 0051CEFF    mov         eax,ebx
 0051CF01    mov         ebx,dword ptr [eax]
 0051CF03    call        dword ptr [ebx+11C];TmwCustomEdit.CommandProcessor
>0051CF09    jmp         0051CF13
 0051CF0B    and         word ptr [ebx+3CC],0FFFFFFEF;TmwCustomEdit.fStateFlags:TmwStateFlags
 0051CF13    xor         eax,eax
 0051CF15    pop         edx
 0051CF16    pop         ecx
 0051CF17    pop         ecx
 0051CF18    mov         dword ptr fs:[eax],edx
 0051CF1B    push        51CF36
 0051CF20    cmp         dword ptr [ebp-8],0
>0051CF24    je          0051CF2E
 0051CF26    mov         eax,dword ptr [ebp-8]
 0051CF29    call        @FreeMem
 0051CF2E    ret
>0051CF2F    jmp         @HandleFinally
>0051CF34    jmp         0051CF20
 0051CF36    pop         edi
 0051CF37    pop         esi
 0051CF38    pop         ebx
 0051CF39    mov         esp,ebp
 0051CF3B    pop         ebp
 0051CF3C    ret
*}
end;

//0051CF40
procedure TmwCustomEdit.Loaded;
begin
{*
 0051CF40    push        ebx
 0051CF41    mov         ebx,eax
 0051CF43    mov         eax,ebx
 0051CF45    call        TControl.Loaded
 0051CF4A    mov         edx,ebx
 0051CF4C    mov         eax,ebx
 0051CF4E    call        00527830
 0051CF53    pop         ebx
 0051CF54    ret
*}
end;

//0051CF58
procedure TmwCustomEdit.KeyPress(Key:Char);
begin
{*
 0051CF58    push        ebx
 0051CF59    push        esi
 0051CF5A    mov         esi,edx
 0051CF5C    mov         ebx,eax
 0051CF5E    test        byte ptr [ebx+3CC],10;TmwCustomEdit.fStateFlags:TmwStateFlags
>0051CF65    jne         0051CF97
 0051CF67    cmp         word ptr [ebx+222],0;TmwCustomEdit.?f222:word
>0051CF6F    je          0051CF81
 0051CF71    mov         ecx,esi
 0051CF73    mov         edx,ebx
 0051CF75    mov         eax,dword ptr [ebx+224];TmwCustomEdit.?f224:TMwCompletionProposal
 0051CF7B    call        dword ptr [ebx+220];TmwCustomEdit.FOnKeyPress
 0051CF81    push        0
 0051CF83    movzx       ecx,word ptr [esi]
 0051CF86    mov         dx,19B
 0051CF8A    mov         eax,ebx
 0051CF8C    mov         ebx,dword ptr [eax]
 0051CF8E    call        dword ptr [ebx+11C];TmwCustomEdit.CommandProcessor
 0051CF94    pop         esi
 0051CF95    pop         ebx
 0051CF96    ret
 0051CF97    and         word ptr [ebx+3CC],0FFFFFFEF;TmwCustomEdit.fStateFlags:TmwStateFlags
 0051CF9F    pop         esi
 0051CFA0    pop         ebx
 0051CFA1    ret
*}
end;

//0051CFA4
{*function sub_0051CFA4(?:TmwCustomEdit; ?:UnicodeString):?;
begin
 0051CFA4    push        ebx
 0051CFA5    push        esi
 0051CFA6    mov         ebx,edx
 0051CFA8    test        ebx,ebx
>0051CFAA    je          0051CFD0
 0051CFAC    test        byte ptr [eax+3CE],1
>0051CFB3    je          0051CFD0
 0051CFB5    xor         esi,esi
>0051CFB7    jmp         0051CFBD
 0051CFB9    add         ebx,2
 0051CFBC    inc         esi
 0051CFBD    mov         edx,51CFD8
 0051CFC2    movzx       eax,word ptr [ebx]
 0051CFC5    call        CharInSet
 0051CFCA    test        al,al
>0051CFCC    jne         0051CFB9
>0051CFCE    jmp         0051CFD2
 0051CFD0    xor         esi,esi
 0051CFD2    mov         eax,esi
 0051CFD4    pop         esi
 0051CFD5    pop         ebx
 0051CFD6    ret
end;*}

//0051CFF8
{*procedure sub_0051CFF8(?:?);
begin
 0051CFF8    push        ebx
 0051CFF9    mov         ebx,eax
 0051CFFB    or          word ptr [ebx+3CC],4
 0051D003    pop         ebx
 0051D004    ret
end;*}

//0051D008
{*procedure sub_0051D008(?:?);
begin
 0051D008    push        ebx
 0051D009    push        esi
 0051D00A    add         esp,0FFFFFFF8
 0051D00D    mov         ebx,eax
 0051D00F    and         word ptr [ebx+3CC],0FFFFFFFB
 0051D017    mov         eax,ebx
 0051D019    call        TWinControl.HandleAllocated
 0051D01E    test        al,al
>0051D020    je          0051D08B
 0051D022    xor         edx,edx
 0051D024    mov         eax,ebx
 0051D026    call        00521064
 0051D02B    mov         edx,esp
 0051D02D    mov         eax,ebx
 0051D02F    call        0051FBB8
 0051D034    mov         edx,esp
 0051D036    mov         eax,ebx
 0051D038    call        0051F7D8
 0051D03D    push        0
 0051D03F    lea         eax,[ebx+3BC]
 0051D045    push        eax
 0051D046    mov         eax,ebx
 0051D048    call        TWinControl.GetHandle
 0051D04D    push        eax
 0051D04E    call        user32.InvalidateRect
 0051D053    lea         eax,[ebx+3BC]
 0051D059    xor         ecx,ecx
 0051D05B    mov         edx,10
 0051D060    call        @FillChar
 0051D065    mov         esi,dword ptr [ebx+3A4]
 0051D06B    cmp         byte ptr [esi+0C],0
>0051D06F    je          0051D08B
 0051D071    cmp         byte ptr [esi+2C],0
>0051D075    je          0051D08B
 0051D077    mov         eax,dword ptr [ebx+2A4]
 0051D07D    mov         edx,dword ptr [eax]
 0051D07F    call        dword ptr [edx+14]
 0051D082    mov         edx,eax
 0051D084    mov         eax,esi
 0051D086    call        TmwGutter.AutoSizeDigitCount
 0051D08B    pop         ecx
 0051D08C    pop         edx
 0051D08D    pop         esi
 0051D08E    pop         ebx
 0051D08F    ret
end;*}

//0051D090
procedure TmwCustomEdit.MouseDown(Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer);
begin
{*
 0051D090    push        ebp
 0051D091    mov         ebp,esp
 0051D093    add         esp,0FFFFFFF4
 0051D096    push        ebx
 0051D097    push        esi
 0051D098    push        edi
 0051D099    mov         word ptr [ebp-2],cx
 0051D09D    mov         ebx,edx
 0051D09F    mov         esi,eax
 0051D0A1    mov         edi,dword ptr [ebp+0C]
 0051D0A4    cmp         bl,1
>0051D0A7    jne         0051D0CB
 0051D0A9    movzx       eax,word ptr ds:[51D220];0x10 gvar_0051D220
 0051D0B0    cmp         ax,word ptr [ebp-2]
>0051D0B4    jne         0051D0CB
 0051D0B6    cmp         dword ptr [esi+7C],0;TmwCustomEdit.FPopupMenu:TPopupMenu
>0051D0BA    je          0051D0CB
 0051D0BC    mov         eax,esi
 0051D0BE    call        0051C710
 0051D0C3    test        al,al
>0051D0C5    jne         0051D215
 0051D0CB    mov         byte ptr [ebp-3],0
 0051D0CF    mov         byte ptr [ebp-4],0
 0051D0D3    test        bl,bl
>0051D0D5    jne         0051D137
 0051D0D7    test        byte ptr [ebp-2],40
>0051D0DB    jne         0051D215
 0051D0E1    mov         eax,esi
 0051D0E3    call        0051C710
 0051D0E8    test        al,al
>0051D0EA    je          0051D137
 0051D0EC    mov         byte ptr [ebp-3],1
 0051D0F0    lea         edx,[ebp-0C]
 0051D0F3    mov         eax,esi
 0051D0F5    call        0051C570
 0051D0FA    mov         eax,dword ptr [ebp-0C]
 0051D0FD    mov         dword ptr [esi+30C],eax;TmwCustomEdit.fDragBlockBegin:TPoint
 0051D103    mov         eax,dword ptr [ebp-8]
 0051D106    mov         dword ptr [esi+310],eax
 0051D10C    lea         edx,[ebp-0C]
 0051D10F    mov         eax,esi
 0051D111    call        0051C5CC
 0051D116    mov         eax,dword ptr [ebp-0C]
 0051D119    mov         dword ptr [esi+314],eax;TmwCustomEdit.fDragBlockEnd:TPoint
 0051D11F    mov         eax,dword ptr [ebp-8]
 0051D122    mov         dword ptr [esi+318],eax
 0051D128    mov         dword ptr [esi+31C],edi;TmwCustomEdit.fMouseDownX:Integer
 0051D12E    mov         eax,dword ptr [ebp+8]
 0051D131    mov         dword ptr [esi+320],eax;TmwCustomEdit.fMouseDownY:Integer
 0051D137    push        edi
 0051D138    mov         eax,dword ptr [ebp+8]
 0051D13B    push        eax
 0051D13C    movzx       ecx,word ptr [ebp-2]
 0051D140    mov         edx,ebx
 0051D142    mov         eax,esi
 0051D144    call        TControl.MouseDown
 0051D149    mov         ecx,dword ptr [ebp+8]
 0051D14C    mov         edx,edi
 0051D14E    mov         eax,esi
 0051D150    call        0051BD00
 0051D155    test        bl,bl
>0051D157    jne         0051D1A3
 0051D159    mov         dl,1
 0051D15B    mov         eax,esi
 0051D15D    call        TControl.SetMouseCapture
 0051D162    and         word ptr [esi+3CC],0FEFF;TmwCustomEdit.fStateFlags:TmwStateFlags
 0051D16B    cmp         byte ptr [ebp-3],0
>0051D16F    je          0051D1A3
 0051D171    test        byte ptr [esi+3CE],2;TmwCustomEdit.fOptions:TmwEditorOptions
>0051D178    je          0051D1A3
 0051D17A    lea         edx,[ebp-0C]
 0051D17D    mov         eax,esi
 0051D17F    call        0051FBB8
 0051D184    lea         edx,[ebp-0C]
 0051D187    mov         eax,esi
 0051D189    call        0052813C
 0051D18E    test        al,al
>0051D190    je          0051D1A3
 0051D192    mov         eax,dword ptr [esi+29C];TmwCustomEdit.fGutterWidth:Integer
 0051D198    add         eax,2
 0051D19B    cmp         edi,eax
>0051D19D    jl          0051D1A3
 0051D19F    mov         byte ptr [ebp-4],1
 0051D1A3    test        bl,bl
 0051D1A5    sete        al
 0051D1A8    and         al,byte ptr [ebp-4]
>0051D1AB    je          0051D1B8
 0051D1AD    or          word ptr [esi+3CC],100;TmwCustomEdit.fStateFlags:TmwStateFlags
>0051D1B6    jmp         0051D1F1
 0051D1B8    test        byte ptr [esi+3CC],40;TmwCustomEdit.fStateFlags:TmwStateFlags
>0051D1BF    jne         0051D1F1
 0051D1C1    test        byte ptr [ebp-2],1
>0051D1C5    je          0051D1DD
 0051D1C7    lea         edx,[ebp-0C]
 0051D1CA    mov         eax,esi
 0051D1CC    call        0051FBB8
 0051D1D1    lea         edx,[ebp-0C]
 0051D1D4    mov         eax,esi
 0051D1D6    call        0051F99C
>0051D1DB    jmp         0051D1F1
 0051D1DD    lea         edx,[ebp-0C]
 0051D1E0    mov         eax,esi
 0051D1E2    call        0051FBB8
 0051D1E7    lea         edx,[ebp-0C]
 0051D1EA    mov         eax,esi
 0051D1EC    call        0051F7D8
 0051D1F1    mov         eax,dword ptr [esi+31C];TmwCustomEdit.fMouseDownX:Integer
 0051D1F7    cmp         eax,dword ptr [esi+29C];TmwCustomEdit.fGutterWidth:Integer
>0051D1FD    jge         0051D208
 0051D1FF    or          word ptr [esi+3CC],80;TmwCustomEdit.fStateFlags:TmwStateFlags
 0051D208    mov         eax,esi
 0051D20A    call        TWinControl.GetHandle
 0051D20F    push        eax
 0051D210    call        user32.SetFocus
 0051D215    pop         edi
 0051D216    pop         esi
 0051D217    pop         ebx
 0051D218    mov         esp,ebp
 0051D21A    pop         ebp
 0051D21B    ret         8
*}
end;

//0051D224
{*function sub_0051D224(?:?; ?:?):?;
begin
 0051D224    push        ebp
 0051D225    mov         ebp,esp
 0051D227    add         esp,0FFFFFFF0
 0051D22A    test        al,al
>0051D22C    je          0051D266
 0051D22E    lea         eax,[ebp-8]
 0051D231    push        eax
 0051D232    call        user32.GetCursorPos
 0051D237    lea         ecx,[ebp-10]
 0051D23A    lea         edx,[ebp-8]
 0051D23D    mov         eax,dword ptr [ebp+8]
 0051D240    mov         eax,dword ptr [eax-4]
 0051D243    call        TControl.ScreenToClient
 0051D248    mov         eax,dword ptr [ebp-10]
 0051D24B    mov         dword ptr [ebp-8],eax
 0051D24E    mov         eax,dword ptr [ebp-0C]
 0051D251    mov         dword ptr [ebp-4],eax
 0051D254    mov         eax,dword ptr [ebp+8]
 0051D257    mov         edx,dword ptr [ebp-8]
 0051D25A    mov         dword ptr [eax-8],edx
 0051D25D    mov         eax,dword ptr [ebp+8]
 0051D260    mov         edx,dword ptr [ebp-4]
 0051D263    mov         dword ptr [eax+8],edx
 0051D266    mov         eax,dword ptr [ebp+8]
 0051D269    mov         eax,dword ptr [eax-8]
 0051D26C    mov         edx,dword ptr [ebp+8]
 0051D26F    mov         edx,dword ptr [edx-4]
 0051D272    cmp         eax,dword ptr [edx+29C]
>0051D278    jl          0051D2A9
 0051D27A    mov         eax,dword ptr [ebp+8]
 0051D27D    mov         eax,dword ptr [eax-4]
 0051D280    call        TControl.GetClientWidth
 0051D285    mov         edx,dword ptr [ebp+8]
 0051D288    cmp         eax,dword ptr [edx-8]
>0051D28B    jle         0051D2A9
 0051D28D    mov         eax,dword ptr [ebp+8]
 0051D290    cmp         dword ptr [eax+8],0
>0051D294    jl          0051D2A9
 0051D296    mov         eax,dword ptr [ebp+8]
 0051D299    mov         eax,dword ptr [eax-4]
 0051D29C    call        TControl.GetClientHeight
 0051D2A1    mov         edx,dword ptr [ebp+8]
 0051D2A4    cmp         eax,dword ptr [edx+8]
>0051D2A7    jg          0051D2AD
 0051D2A9    xor         eax,eax
>0051D2AB    jmp         0051D2AF
 0051D2AD    mov         al,1
 0051D2AF    mov         esp,ebp
 0051D2B1    pop         ebp
 0051D2B2    ret
end;*}

//0051D2B4
procedure TmwCustomEdit.MouseMove(Shift:TShiftState; X:Integer; Y:Integer);
begin
{*
 0051D2B4    push        ebp
 0051D2B5    mov         ebp,esp
 0051D2B7    add         esp,0FFFFFF94
 0051D2BA    push        ebx
 0051D2BB    push        esi
 0051D2BC    push        edi
 0051D2BD    mov         dword ptr [ebp-8],ecx
 0051D2C0    mov         word ptr [ebp-0A],dx
 0051D2C4    mov         dword ptr [ebp-4],eax
 0051D2C7    mov         eax,dword ptr [ebp+8]
 0051D2CA    push        eax
 0051D2CB    mov         ecx,dword ptr [ebp-8]
 0051D2CE    movzx       edx,word ptr [ebp-0A]
 0051D2D2    mov         eax,dword ptr [ebp-4]
 0051D2D5    call        TControl.MouseMove
 0051D2DA    mov         eax,dword ptr [ebp-4]
 0051D2DD    call        TControl.GetMouseCapture
 0051D2E2    test        al,al
>0051D2E4    je          0051D35F
 0051D2E6    mov         eax,dword ptr [ebp-4]
 0051D2E9    test        byte ptr [eax+3CD],1;TmwCustomEdit.?f3CD:byte
>0051D2F0    je          0051D35F
 0051D2F2    mov         eax,dword ptr [ebp-4]
 0051D2F5    mov         edx,dword ptr [eax]
 0051D2F7    call        dword ptr [edx+0F8];TmwCustomEdit.GetReadOnly
 0051D2FD    test        al,al
>0051D2FF    jne         0051D35F
 0051D301    push        44
 0051D303    call        user32.GetSystemMetrics
 0051D308    mov         ecx,eax
 0051D30A    mov         eax,dword ptr [ebp-4]
 0051D30D    mov         eax,dword ptr [eax+31C];TmwCustomEdit.fMouseDownX:Integer
 0051D313    sub         eax,dword ptr [ebp-8]
 0051D316    cdq
 0051D317    xor         eax,edx
 0051D319    sub         eax,edx
 0051D31B    cmp         ecx,eax
>0051D31D    jle         0051D341
 0051D31F    push        45
 0051D321    call        user32.GetSystemMetrics
 0051D326    mov         ecx,eax
 0051D328    mov         eax,dword ptr [ebp-4]
 0051D32B    mov         eax,dword ptr [eax+320];TmwCustomEdit.fMouseDownY:Integer
 0051D331    sub         eax,dword ptr [ebp+8]
 0051D334    cdq
 0051D335    xor         eax,edx
 0051D337    sub         eax,edx
 0051D339    cmp         ecx,eax
>0051D33B    jg          0051D74D
 0051D341    mov         eax,dword ptr [ebp-4]
 0051D344    and         word ptr [eax+3CC],0FEFF;TmwCustomEdit.fStateFlags:TmwStateFlags
 0051D34D    or          ecx,0FFFFFFFF
 0051D350    xor         edx,edx
 0051D352    mov         eax,dword ptr [ebp-4]
 0051D355    call        TControl.BeginDrag
>0051D35A    jmp         0051D74D
 0051D35F    mov         eax,dword ptr [ebp-4]
 0051D362    test        byte ptr [eax+3CC],8;TmwCustomEdit.fStateFlags:TmwStateFlags
>0051D369    jne         0051D74D
 0051D36F    test        byte ptr [ebp-0A],8
>0051D373    je          0051D74D
 0051D379    mov         eax,dword ptr [ebp-4]
 0051D37C    call        TControl.GetMouseCapture
 0051D381    test        al,al
>0051D383    je          0051D74D
 0051D389    mov         eax,dword ptr [ebp-4]
 0051D38C    or          word ptr [eax+3CC],8;TmwCustomEdit.fStateFlags:TmwStateFlags
 0051D394    xor         eax,eax
 0051D396    push        ebp
 0051D397    push        51D746
 0051D39C    push        dword ptr fs:[eax]
 0051D39F    mov         dword ptr fs:[eax],esp
 0051D3A2    push        ebp
 0051D3A3    xor         eax,eax
 0051D3A5    call        0051D224
 0051D3AA    pop         ecx
 0051D3AB    test        al,al
>0051D3AD    je          0051D3BD
 0051D3AF    mov         ecx,dword ptr [ebp+8]
 0051D3B2    mov         edx,dword ptr [ebp-8]
 0051D3B5    mov         eax,dword ptr [ebp-4]
 0051D3B8    call        0051BD00
 0051D3BD    lea         edx,[ebp-6C]
 0051D3C0    mov         eax,dword ptr [ebp-4]
 0051D3C3    call        0051FBB8
 0051D3C8    lea         edx,[ebp-6C]
 0051D3CB    mov         eax,dword ptr [ebp-4]
 0051D3CE    call        0051F99C
 0051D3D3    mov         eax,[0078D590];^Application:TApplication
 0051D3D8    mov         eax,dword ptr [eax]
 0051D3DA    call        TApplication.ProcessMessages
>0051D3DF    jmp         0051D710
 0051D3E4    mov         byte ptr [ebp-0B],1
 0051D3E8    mov         eax,dword ptr [ebp-4]
 0051D3EB    call        0051CBE4
 0051D3F0    xor         eax,eax
 0051D3F2    push        ebp
 0051D3F3    push        51D6F0
 0051D3F8    push        dword ptr fs:[eax]
 0051D3FB    mov         dword ptr fs:[eax],esp
 0051D3FE    mov         eax,dword ptr [ebp-4]
 0051D401    mov         eax,dword ptr [eax+29C];TmwCustomEdit.fGutterWidth:Integer
 0051D407    cmp         eax,dword ptr [ebp-8]
>0051D40A    jle         0051D4AA
 0051D410    mov         eax,dword ptr [ebp-4]
 0051D413    mov         ebx,dword ptr [eax+29C];TmwCustomEdit.fGutterWidth:Integer
 0051D419    sub         ebx,dword ptr [ebp-8]
 0051D41C    cmp         ebx,0A
>0051D41F    jge         0051D436
 0051D421    mov         eax,dword ptr [ebp-4]
 0051D424    call        0051C6C0
 0051D429    mov         edx,eax
 0051D42B    dec         edx
 0051D42C    mov         eax,dword ptr [ebp-4]
 0051D42F    call        0051FEB4
>0051D434    jmp         0051D44B
 0051D436    mov         eax,dword ptr [ebp-4]
 0051D439    call        0051C6C0
 0051D43E    mov         edx,eax
 0051D440    sub         edx,8
 0051D443    mov         eax,dword ptr [ebp-4]
 0051D446    call        0051FEB4
 0051D44B    cmp         ebx,2A
>0051D44E    jl          0051D454
 0051D450    mov         byte ptr [ebp-0B],0
 0051D454    mov         eax,dword ptr [ebp-4]
 0051D457    call        0051C6C0
 0051D45C    mov         esi,eax
 0051D45E    mov         eax,dword ptr [ebp-8]
 0051D461    mov         dword ptr [ebp-14],eax
 0051D464    mov         eax,dword ptr [ebp+8]
 0051D467    mov         dword ptr [ebp-10],eax
 0051D46A    lea         ecx,[ebp-6C]
 0051D46D    lea         edx,[ebp-14]
 0051D470    mov         eax,dword ptr [ebp-4]
 0051D473    call        TmwCustomEdit.PixelsToRowColumn
 0051D478    mov         edi,dword ptr [ebp-68]
 0051D47B    mov         dword ptr [ebp-1C],esi
 0051D47E    mov         dword ptr [ebp-18],edi
 0051D481    lea         edx,[ebp-1C]
 0051D484    mov         eax,dword ptr [ebp-4]
 0051D487    mov         ecx,dword ptr [eax]
 0051D489    call        dword ptr [ecx+110];TmwCustomEdit.sub_0051FBE0
 0051D48F    lea         edx,[ebp-6C]
 0051D492    mov         eax,dword ptr [ebp-4]
 0051D495    call        0051FBB8
 0051D49A    lea         edx,[ebp-6C]
 0051D49D    mov         eax,dword ptr [ebp-4]
 0051D4A0    call        0051F99C
>0051D4A5    jmp         0051D564
 0051D4AA    mov         eax,dword ptr [ebp-4]
 0051D4AD    call        TControl.GetClientWidth
 0051D4B2    cmp         eax,dword ptr [ebp-8]
>0051D4B5    jge         0051D564
 0051D4BB    mov         eax,dword ptr [ebp-4]
 0051D4BE    call        TControl.GetClientWidth
 0051D4C3    mov         ebx,dword ptr [ebp-8]
 0051D4C6    sub         ebx,eax
 0051D4C8    cmp         ebx,0A
>0051D4CB    jge         0051D4E2
 0051D4CD    mov         eax,dword ptr [ebp-4]
 0051D4D0    call        0051C6C0
 0051D4D5    mov         edx,eax
 0051D4D7    inc         edx
 0051D4D8    mov         eax,dword ptr [ebp-4]
 0051D4DB    call        0051FEB4
>0051D4E0    jmp         0051D4F7
 0051D4E2    mov         eax,dword ptr [ebp-4]
 0051D4E5    call        0051C6C0
 0051D4EA    mov         edx,eax
 0051D4EC    add         edx,8
 0051D4EF    mov         eax,dword ptr [ebp-4]
 0051D4F2    call        0051FEB4
 0051D4F7    cmp         ebx,2A
>0051D4FA    jl          0051D500
 0051D4FC    mov         byte ptr [ebp-0B],0
 0051D500    mov         eax,dword ptr [ebp-8]
 0051D503    mov         dword ptr [ebp-24],eax
 0051D506    mov         eax,dword ptr [ebp+8]
 0051D509    mov         dword ptr [ebp-20],eax
 0051D50C    mov         eax,dword ptr [ebp-4]
 0051D50F    call        0051C6C0
 0051D514    mov         edx,dword ptr [ebp-4]
 0051D517    add         eax,dword ptr [edx+290];TmwCustomEdit.fCharsInWindow:Integer
 0051D51D    mov         dword ptr [ebp-28],eax
 0051D520    lea         ecx,[ebp-6C]
 0051D523    lea         edx,[ebp-24]
 0051D526    mov         eax,dword ptr [ebp-4]
 0051D529    call        TmwCustomEdit.PixelsToRowColumn
 0051D52E    mov         eax,dword ptr [ebp-68]
 0051D531    mov         dword ptr [ebp-2C],eax
 0051D534    mov         eax,dword ptr [ebp-28]
 0051D537    mov         dword ptr [ebp-34],eax
 0051D53A    mov         eax,dword ptr [ebp-2C]
 0051D53D    mov         dword ptr [ebp-30],eax
 0051D540    lea         edx,[ebp-34]
 0051D543    mov         eax,dword ptr [ebp-4]
 0051D546    mov         ecx,dword ptr [eax]
 0051D548    call        dword ptr [ecx+110];TmwCustomEdit.sub_0051FBE0
 0051D54E    lea         edx,[ebp-6C]
 0051D551    mov         eax,dword ptr [ebp-4]
 0051D554    call        0051FBB8
 0051D559    lea         edx,[ebp-6C]
 0051D55C    mov         eax,dword ptr [ebp-4]
 0051D55F    call        0051F99C
 0051D564    cmp         dword ptr [ebp+8],0
>0051D568    jge         0051D60E
 0051D56E    cmp         dword ptr [ebp+8],0FFFFFFF6
>0051D572    jg          0051D591
 0051D574    mov         eax,dword ptr [ebp-4]
 0051D577    call        0051CBB4
 0051D57C    mov         edx,eax
 0051D57E    mov         eax,dword ptr [ebp-4]
 0051D581    sub         edx,dword ptr [eax+2A8]
 0051D587    mov         eax,dword ptr [ebp-4]
 0051D58A    call        00520F08
>0051D58F    jmp         0051D5A4
 0051D591    mov         eax,dword ptr [ebp-4]
 0051D594    call        0051CBB4
 0051D599    mov         edx,eax
 0051D59B    dec         edx
 0051D59C    mov         eax,dword ptr [ebp-4]
 0051D59F    call        00520F08
 0051D5A4    cmp         dword ptr [ebp+8],0FFFFFFD6
>0051D5A8    jg          0051D5AE
 0051D5AA    mov         byte ptr [ebp-0B],0
 0051D5AE    mov         eax,dword ptr [ebp-8]
 0051D5B1    mov         dword ptr [ebp-3C],eax
 0051D5B4    mov         eax,dword ptr [ebp+8]
 0051D5B7    mov         dword ptr [ebp-38],eax
 0051D5BA    lea         ecx,[ebp-6C]
 0051D5BD    lea         edx,[ebp-3C]
 0051D5C0    mov         eax,dword ptr [ebp-4]
 0051D5C3    call        TmwCustomEdit.PixelsToRowColumn
 0051D5C8    mov         eax,dword ptr [ebp-6C]
 0051D5CB    mov         dword ptr [ebp-40],eax
 0051D5CE    mov         eax,dword ptr [ebp-4]
 0051D5D1    call        0051CBB4
 0051D5D6    mov         dword ptr [ebp-44],eax
 0051D5D9    mov         eax,dword ptr [ebp-40]
 0051D5DC    mov         dword ptr [ebp-4C],eax
 0051D5DF    mov         eax,dword ptr [ebp-44]
 0051D5E2    mov         dword ptr [ebp-48],eax
 0051D5E5    lea         edx,[ebp-4C]
 0051D5E8    mov         eax,dword ptr [ebp-4]
 0051D5EB    mov         ecx,dword ptr [eax]
 0051D5ED    call        dword ptr [ecx+110];TmwCustomEdit.sub_0051FBE0
 0051D5F3    lea         edx,[ebp-6C]
 0051D5F6    mov         eax,dword ptr [ebp-4]
 0051D5F9    call        0051FBB8
 0051D5FE    lea         edx,[ebp-6C]
 0051D601    mov         eax,dword ptr [ebp-4]
 0051D604    call        0051F99C
>0051D609    jmp         0051D6CF
 0051D60E    mov         eax,dword ptr [ebp-4]
 0051D611    call        TControl.GetClientHeight
 0051D616    cmp         eax,dword ptr [ebp+8]
>0051D619    jge         0051D6CF
 0051D61F    mov         eax,dword ptr [ebp-4]
 0051D622    call        TControl.GetClientHeight
 0051D627    mov         ebx,dword ptr [ebp+8]
 0051D62A    sub         ebx,eax
 0051D62C    cmp         ebx,0A
>0051D62F    jl          0051D64E
 0051D631    mov         eax,dword ptr [ebp-4]
 0051D634    call        0051CBB4
 0051D639    mov         edx,eax
 0051D63B    mov         eax,dword ptr [ebp-4]
 0051D63E    add         edx,dword ptr [eax+2A8];TmwCustomEdit.fLinesInWindow:Integer
 0051D644    mov         eax,dword ptr [ebp-4]
 0051D647    call        00520F08
>0051D64C    jmp         0051D661
 0051D64E    mov         eax,dword ptr [ebp-4]
 0051D651    call        0051CBB4
 0051D656    mov         edx,eax
 0051D658    inc         edx
 0051D659    mov         eax,dword ptr [ebp-4]
 0051D65C    call        00520F08
 0051D661    cmp         ebx,2A
>0051D664    jl          0051D66A
 0051D666    mov         byte ptr [ebp-0B],0
 0051D66A    mov         eax,dword ptr [ebp-8]
 0051D66D    mov         dword ptr [ebp-54],eax
 0051D670    mov         eax,dword ptr [ebp+8]
 0051D673    mov         dword ptr [ebp-50],eax
 0051D676    lea         ecx,[ebp-6C]
 0051D679    lea         edx,[ebp-54]
 0051D67C    mov         eax,dword ptr [ebp-4]
 0051D67F    call        TmwCustomEdit.PixelsToRowColumn
 0051D684    mov         eax,dword ptr [ebp-6C]
 0051D687    mov         dword ptr [ebp-58],eax
 0051D68A    mov         eax,dword ptr [ebp-4]
 0051D68D    call        0051CBB4
 0051D692    mov         edx,dword ptr [ebp-4]
 0051D695    add         eax,dword ptr [edx+2A8];TmwCustomEdit.fLinesInWindow:Integer
 0051D69B    dec         eax
 0051D69C    mov         dword ptr [ebp-5C],eax
 0051D69F    mov         eax,dword ptr [ebp-58]
 0051D6A2    mov         dword ptr [ebp-64],eax
 0051D6A5    mov         eax,dword ptr [ebp-5C]
 0051D6A8    mov         dword ptr [ebp-60],eax
 0051D6AB    lea         edx,[ebp-64]
 0051D6AE    mov         eax,dword ptr [ebp-4]
 0051D6B1    mov         ecx,dword ptr [eax]
 0051D6B3    call        dword ptr [ecx+110];TmwCustomEdit.sub_0051FBE0
 0051D6B9    lea         edx,[ebp-6C]
 0051D6BC    mov         eax,dword ptr [ebp-4]
 0051D6BF    call        0051FBB8
 0051D6C4    lea         edx,[ebp-6C]
 0051D6C7    mov         eax,dword ptr [ebp-4]
 0051D6CA    call        0051F99C
 0051D6CF    xor         eax,eax
 0051D6D1    pop         edx
 0051D6D2    pop         ecx
 0051D6D3    pop         ecx
 0051D6D4    mov         dword ptr fs:[eax],edx
 0051D6D7    push        51D6F7
 0051D6DC    mov         eax,dword ptr [ebp-4]
 0051D6DF    call        0051C458
 0051D6E4    mov         eax,dword ptr [ebp-4]
 0051D6E7    mov         edx,dword ptr [eax]
 0051D6E9    call        dword ptr [edx+9C];TWinControl.Update
 0051D6EF    ret
>0051D6F0    jmp         @HandleFinally
>0051D6F5    jmp         0051D6DC
 0051D6F7    mov         eax,[0078D590];^Application:TApplication
 0051D6FC    mov         eax,dword ptr [eax]
 0051D6FE    call        TApplication.ProcessMessages
 0051D703    cmp         byte ptr [ebp-0B],0
>0051D707    je          0051D710
 0051D709    push        64
 0051D70B    call        kernel32.Sleep
 0051D710    mov         eax,dword ptr [ebp-4]
 0051D713    call        TControl.GetMouseCapture
 0051D718    test        al,al
>0051D71A    je          0051D72D
 0051D71C    push        ebp
 0051D71D    mov         al,1
 0051D71F    call        0051D224
 0051D724    pop         ecx
 0051D725    test        al,al
>0051D727    je          0051D3E4
 0051D72D    xor         eax,eax
 0051D72F    pop         edx
 0051D730    pop         ecx
 0051D731    pop         ecx
 0051D732    mov         dword ptr fs:[eax],edx
 0051D735    push        51D74D
 0051D73A    mov         eax,dword ptr [ebp-4]
 0051D73D    and         word ptr [eax+3CC],0FFFFFFF7;TmwCustomEdit.fStateFlags:TmwStateFlags
 0051D745    ret
>0051D746    jmp         @HandleFinally
>0051D74B    jmp         0051D73A
 0051D74D    pop         edi
 0051D74E    pop         esi
 0051D74F    pop         ebx
 0051D750    mov         esp,ebp
 0051D752    pop         ebp
 0051D753    ret         4
*}
end;

//0051D758
procedure TmwCustomEdit.MouseUp(Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer);
begin
{*
 0051D758    push        ebp
 0051D759    mov         ebp,esp
 0051D75B    add         esp,0FFFFFFF4
 0051D75E    push        ebx
 0051D75F    push        esi
 0051D760    push        edi
 0051D761    mov         word ptr [ebp-3],cx
 0051D765    mov         byte ptr [ebp-1],dl
 0051D768    mov         ebx,eax
 0051D76A    mov         edi,dword ptr [ebp+8]
 0051D76D    mov         esi,dword ptr [ebp+0C]
 0051D770    push        esi
 0051D771    push        edi
 0051D772    movzx       ecx,word ptr [ebp-3]
 0051D776    movzx       edx,byte ptr [ebp-1]
 0051D77A    mov         eax,ebx
 0051D77C    call        TControl.MouseUp
 0051D781    cmp         byte ptr [ebp-1],1
>0051D785    jne         0051D79E
 0051D787    movzx       eax,word ptr ds:[51D838];0x10 gvar_0051D838
 0051D78E    cmp         ax,word ptr [ebp-3]
>0051D792    jne         0051D79E
 0051D794    cmp         dword ptr [ebx+7C],0;TmwCustomEdit.FPopupMenu:TPopupMenu
>0051D798    jne         0051D82F
 0051D79E    xor         edx,edx
 0051D7A0    mov         eax,ebx
 0051D7A2    call        TControl.SetMouseCapture
 0051D7A7    test        byte ptr [ebx+3CC],80;TmwCustomEdit.fStateFlags:TmwStateFlags
>0051D7AE    je          0051D7C8
 0051D7B0    cmp         esi,dword ptr [ebx+29C];TmwCustomEdit.fGutterWidth:Integer
>0051D7B6    jge         0051D7C8
 0051D7B8    mov         ecx,edi
 0051D7BA    mov         edx,esi
 0051D7BC    mov         eax,ebx
 0051D7BE    mov         esi,dword ptr [eax]
 0051D7C0    call        dword ptr [esi+0F0];TmwCustomEdit.sub_0051D844
>0051D7C6    jmp         0051D81E
 0051D7C8    movzx       eax,word ptr ds:[51D83C];0x140 gvar_0051D83C
 0051D7CF    and         ax,word ptr [ebx+3CC];TmwCustomEdit.fStateFlags:TmwStateFlags
 0051D7D6    movzx       edx,word ptr ds:[51D840];0x100 gvar_0051D840
 0051D7DD    cmp         dx,ax
>0051D7E0    jne         0051D81E
 0051D7E2    mov         ecx,edi
 0051D7E4    mov         edx,esi
 0051D7E6    mov         eax,ebx
 0051D7E8    call        0051BD00
 0051D7ED    lea         edx,[ebp-0C]
 0051D7F0    mov         eax,ebx
 0051D7F2    call        0051FBB8
 0051D7F7    lea         edx,[ebp-0C]
 0051D7FA    mov         eax,ebx
 0051D7FC    call        0051F7D8
 0051D801    lea         edx,[ebp-0C]
 0051D804    mov         eax,ebx
 0051D806    call        0051FBB8
 0051D80B    lea         edx,[ebp-0C]
 0051D80E    mov         eax,ebx
 0051D810    call        0051F99C
 0051D815    and         word ptr [ebx+3CC],0FEFF;TmwCustomEdit.fStateFlags:TmwStateFlags
 0051D81E    and         word ptr [ebx+3CC],0FFFFFFBF;TmwCustomEdit.fStateFlags:TmwStateFlags
 0051D826    and         word ptr [ebx+3CC],0FF7F;TmwCustomEdit.fStateFlags:TmwStateFlags
 0051D82F    pop         edi
 0051D830    pop         esi
 0051D831    pop         ebx
 0051D832    mov         esp,ebp
 0051D834    pop         ebp
 0051D835    ret         8
*}
end;

//0051D844
{*procedure sub_0051D844(?:?; ?:?);
begin
 0051D844    push        ebx
 0051D845    push        esi
 0051D846    push        edi
 0051D847    push        ebp
 0051D848    add         esp,0FFFFFFA4
 0051D84B    mov         dword ptr [esp+4],ecx
 0051D84F    mov         dword ptr [esp],edx
 0051D852    mov         ebx,eax
 0051D854    cmp         word ptr [ebx+402],0;TmwCustomEdit.?f402:word
>0051D85C    je          0051D8F2
 0051D862    mov         eax,dword ptr [esp]
 0051D865    mov         dword ptr [esp+0C],eax
 0051D869    mov         eax,dword ptr [esp+4]
 0051D86D    mov         dword ptr [esp+10],eax
 0051D871    lea         ecx,[esp+54]
 0051D875    lea         edx,[esp+0C]
 0051D879    mov         eax,ebx
 0051D87B    call        TmwCustomEdit.PixelsToRowColumn
 0051D880    mov         esi,dword ptr [esp+58]
 0051D884    mov         eax,dword ptr [ebx+2A4];TmwCustomEdit.fLines:TStrings
 0051D88A    mov         edx,dword ptr [eax]
 0051D88C    call        dword ptr [edx+14];TStrings.GetCount
 0051D88F    cmp         esi,eax
>0051D891    jg          0051D8F2
 0051D893    lea         ecx,[esp+14]
 0051D897    mov         edx,esi
 0051D899    mov         eax,dword ptr [ebx+370];TmwCustomEdit.fMarkList:TMarkList
 0051D89F    call        TMarkList.GetMarksForLine
 0051D8A4    xor         edi,edi
 0051D8A6    xor         eax,eax
 0051D8A8    mov         dword ptr [esp+8],eax
 0051D8AC    mov         edx,10
 0051D8B1    lea         eax,[esp+14]
 0051D8B5    mov         ebp,dword ptr [eax]
 0051D8B7    test        ebp,ebp
>0051D8B9    je          0051D8CF
 0051D8BB    mov         ecx,dword ptr [ebx+324];TmwCustomEdit.fBookMarkOpt:TmwBookMarkOpt
 0051D8C1    add         edi,dword ptr [ecx+14];TmwBookMarkOpt.fXoffset:Integer
 0051D8C4    cmp         edi,dword ptr [esp]
>0051D8C7    jle         0051D8CF
 0051D8C9    mov         dword ptr [esp+8],ebp
>0051D8CD    jmp         0051D8D5
 0051D8CF    add         eax,4
 0051D8D2    dec         edx
>0051D8D3    jne         0051D8B5
 0051D8D5    mov         eax,dword ptr [esp+4]
 0051D8D9    push        eax
 0051D8DA    push        esi
 0051D8DB    mov         eax,dword ptr [esp+10]
 0051D8DF    push        eax
 0051D8E0    mov         ecx,dword ptr [esp+0C]
 0051D8E4    mov         edx,ebx
 0051D8E6    mov         eax,dword ptr [ebx+404];TmwCustomEdit.?f404:dword
 0051D8EC    call        dword ptr [ebx+400];TmwCustomEdit.fOnGutterClick
 0051D8F2    add         esp,5C
 0051D8F5    pop         ebp
 0051D8F6    pop         edi
 0051D8F7    pop         esi
 0051D8F8    pop         ebx
 0051D8F9    ret
end;*}

//0051D8FC
procedure sub_0051D8FC;
begin
{*
 0051D8FC    push        ebp
 0051D8FD    mov         ebp,esp
 0051D8FF    add         esp,0FFFFFFD4
 0051D902    push        ebx
 0051D903    push        esi
 0051D904    push        edi
 0051D905    mov         dword ptr [ebp-4],eax
 0051D908    lea         edx,[ebp-1C]
 0051D90B    mov         eax,dword ptr [ebp-4]
 0051D90E    mov         eax,dword ptr [eax+270];TmwCustomEdit..................FCanvas:TCanvas
 0051D914    mov         ecx,dword ptr [eax]
 0051D916    call        dword ptr [ecx+10];TCanvas.GetClipRect
 0051D919    mov         eax,dword ptr [ebp-4]
 0051D91C    call        0051C6C0
 0051D921    mov         esi,eax
 0051D923    mov         eax,dword ptr [ebp-4]
 0051D926    mov         ecx,dword ptr [eax+29C];TmwCustomEdit.fGutterWidth:Integer
 0051D92C    mov         eax,ecx
 0051D92E    add         eax,2
 0051D931    mov         ebx,dword ptr [ebp-1C]
 0051D934    cmp         eax,ebx
>0051D936    jge         0051D94D
 0051D938    mov         eax,ebx
 0051D93A    sub         eax,ecx
 0051D93C    sub         eax,2
 0051D93F    mov         edx,dword ptr [ebp-4]
 0051D942    mov         edi,dword ptr [edx+294];TmwCustomEdit.fCharWidth:Integer
 0051D948    cdq
 0051D949    idiv        eax,edi
 0051D94B    add         esi,eax
 0051D94D    mov         eax,dword ptr [ebp-14]
 0051D950    sub         eax,ecx
 0051D952    sub         eax,2
 0051D955    mov         edx,dword ptr [ebp-4]
 0051D958    mov         edi,dword ptr [edx+294];TmwCustomEdit.fCharWidth:Integer
 0051D95E    add         eax,edi
 0051D960    dec         eax
 0051D961    cdq
 0051D962    idiv        eax,edi
 0051D964    add         eax,esi
 0051D966    mov         dword ptr [ebp-0C],eax
 0051D969    mov         eax,dword ptr [ebp-4]
 0051D96C    call        0051CBB4
 0051D971    mov         ecx,eax
 0051D973    mov         eax,dword ptr [ebp-4]
 0051D976    push        dword ptr [eax+2C8]
 0051D97C    mov         eax,dword ptr [ebp-18]
 0051D97F    pop         edx
 0051D980    mov         edi,edx
 0051D982    cdq
 0051D983    idiv        eax,edi
 0051D985    add         ecx,eax
 0051D987    push        ecx
 0051D988    mov         eax,dword ptr [ebp-4]
 0051D98B    call        0051CBB4
 0051D990    mov         edx,eax
 0051D992    pop         eax
 0051D993    call        00510484
 0051D998    mov         edi,eax
 0051D99A    mov         eax,dword ptr [ebp-4]
 0051D99D    call        0051CBB4
 0051D9A2    mov         ecx,eax
 0051D9A4    mov         eax,dword ptr [ebp-4]
 0051D9A7    mov         eax,dword ptr [eax+2C8];TmwCustomEdit.fTextHeight:Integer
 0051D9AD    add         eax,dword ptr [ebp-10]
 0051D9B0    dec         eax
 0051D9B1    mov         edx,dword ptr [ebp-4]
 0051D9B4    push        ecx
 0051D9B5    mov         ecx,dword ptr [edx+2C8];TmwCustomEdit.fTextHeight:Integer
 0051D9BB    cdq
 0051D9BC    idiv        eax,ecx
 0051D9BE    pop         ecx
 0051D9BF    add         ecx,eax
 0051D9C1    push        ecx
 0051D9C2    mov         eax,dword ptr [ebp-4]
 0051D9C5    mov         eax,dword ptr [eax+2A4];TmwCustomEdit.fLines:TStrings
 0051D9CB    mov         edx,dword ptr [eax]
 0051D9CD    call        dword ptr [edx+14];TStrings.GetCount
 0051D9D0    mov         edx,eax
 0051D9D2    pop         eax
 0051D9D3    call        0051048C
 0051D9D8    mov         dword ptr [ebp-8],eax
 0051D9DB    mov         eax,dword ptr [ebp-4]
 0051D9DE    call        0051CBBC
 0051D9E3    xor         eax,eax
 0051D9E5    push        ebp
 0051D9E6    push        51DAD5
 0051D9EB    push        dword ptr fs:[eax]
 0051D9EE    mov         dword ptr fs:[eax],esp
 0051D9F1    mov         eax,dword ptr [ebp-4]
 0051D9F4    cmp         ebx,dword ptr [eax+29C];TmwCustomEdit.fGutterWidth:Integer
>0051D9FA    jge         0051DA2A
 0051D9FC    push        esi
 0051D9FD    push        edi
 0051D9FE    lea         esi,[ebp-1C]
 0051DA01    lea         edi,[ebp-2C]
 0051DA04    movs        dword ptr [edi],dword ptr [esi]
 0051DA05    movs        dword ptr [edi],dword ptr [esi]
 0051DA06    movs        dword ptr [edi],dword ptr [esi]
 0051DA07    movs        dword ptr [edi],dword ptr [esi]
 0051DA08    pop         edi
 0051DA09    pop         esi
 0051DA0A    mov         eax,dword ptr [ebp-4]
 0051DA0D    mov         eax,dword ptr [eax+29C];TmwCustomEdit.fGutterWidth:Integer
 0051DA13    mov         dword ptr [ebp-24],eax
 0051DA16    mov         eax,dword ptr [ebp-8]
 0051DA19    push        eax
 0051DA1A    mov         ecx,edi
 0051DA1C    lea         edx,[ebp-2C]
 0051DA1F    mov         eax,dword ptr [ebp-4]
 0051DA22    mov         ebx,dword ptr [eax]
 0051DA24    call        dword ptr [ebx+0FC];TmwCustomEdit.sub_0051DCC4
 0051DA2A    mov         eax,dword ptr [ebp-4]
 0051DA2D    mov         ebx,dword ptr [eax+29C];TmwCustomEdit.fGutterWidth:Integer
 0051DA33    cmp         ebx,dword ptr [ebp-14]
>0051DA36    jge         0051DA6C
 0051DA38    push        esi
 0051DA39    push        edi
 0051DA3A    lea         esi,[ebp-1C]
 0051DA3D    lea         edi,[ebp-2C]
 0051DA40    movs        dword ptr [edi],dword ptr [esi]
 0051DA41    movs        dword ptr [edi],dword ptr [esi]
 0051DA42    movs        dword ptr [edi],dword ptr [esi]
 0051DA43    movs        dword ptr [edi],dword ptr [esi]
 0051DA44    pop         edi
 0051DA45    pop         esi
 0051DA46    mov         edx,ebx
 0051DA48    mov         eax,dword ptr [ebp-2C]
 0051DA4B    call        00510484
 0051DA50    mov         dword ptr [ebp-2C],eax
 0051DA53    mov         eax,dword ptr [ebp-8]
 0051DA56    push        eax
 0051DA57    push        esi
 0051DA58    mov         eax,dword ptr [ebp-0C]
 0051DA5B    push        eax
 0051DA5C    mov         ecx,edi
 0051DA5E    lea         edx,[ebp-2C]
 0051DA61    mov         eax,dword ptr [ebp-4]
 0051DA64    mov         ebx,dword ptr [eax]
 0051DA66    call        dword ptr [ebx+100];TmwCustomEdit.sub_0051EF80
 0051DA6C    mov         eax,dword ptr [ebp-4]
 0051DA6F    cmp         word ptr [eax+32A],0;TmwCustomEdit.?f32A:word
>0051DA77    je          0051DABF
 0051DA79    mov         eax,dword ptr [ebp-4]
 0051DA7C    call        TmwCustomEdit.GetFont
 0051DA81    push        eax
 0051DA82    mov         eax,dword ptr [ebp-4]
 0051DA85    call        TmwCustomEdit.GetFont
 0051DA8A    pop         edx
 0051DA8B    mov         ecx,dword ptr [eax]
 0051DA8D    call        dword ptr [ecx+8]
 0051DA90    mov         eax,dword ptr [ebp-4]
 0051DA93    mov         edx,dword ptr [eax+6C];TmwCustomEdit.FColor:TColor
 0051DA96    mov         eax,dword ptr [ebp-4]
 0051DA99    mov         eax,dword ptr [eax+1C0];TmwCustomEdit.FBrush:TBrush
 0051DA9F    call        TBrush.SetColor
 0051DAA4    mov         eax,dword ptr [ebp-4]
 0051DAA7    mov         ecx,dword ptr [eax+270];TmwCustomEdit...................FCanvas:TCanvas
 0051DAAD    mov         ebx,dword ptr [ebp-4]
 0051DAB0    mov         edx,dword ptr [ebp-4]
 0051DAB3    mov         eax,dword ptr [ebx+32C];TmwCustomEdit.?f32C:dword
 0051DAB9    call        dword ptr [ebx+328];TmwCustomEdit.fOnPaint
 0051DABF    xor         eax,eax
 0051DAC1    pop         edx
 0051DAC2    pop         ecx
 0051DAC3    pop         ecx
 0051DAC4    mov         dword ptr fs:[eax],edx
 0051DAC7    push        51DADC
 0051DACC    mov         eax,dword ptr [ebp-4]
 0051DACF    call        00520FD0
 0051DAD4    ret
>0051DAD5    jmp         @HandleFinally
>0051DADA    jmp         0051DACC
 0051DADC    pop         edi
 0051DADD    pop         esi
 0051DADE    pop         ebx
 0051DADF    mov         esp,ebp
 0051DAE1    pop         ebp
 0051DAE2    ret
*}
end;

//0051DAE4
{*procedure sub_0051DAE4(?:?; ?:?);
begin
 0051DAE4    push        ebp
 0051DAE5    mov         ebp,esp
 0051DAE7    push        ecx
 0051DAE8    push        ebx
 0051DAE9    push        esi
 0051DAEA    push        edi
 0051DAEB    mov         esi,eax
 0051DAED    mov         edi,dword ptr [ebp+8]
 0051DAF0    add         edi,0FFFFFFFC
 0051DAF3    mov         eax,dword ptr [edi]
 0051DAF5    mov         eax,dword ptr [eax+324]
 0051DAFB    cmp         dword ptr [eax+4],0
>0051DAFF    je          0051DBCD
 0051DB05    mov         eax,dword ptr [ebp+8]
 0051DB08    mov         edx,dword ptr [eax-8]
 0051DB0B    mov         eax,dword ptr [edi]
 0051DB0D    mov         eax,dword ptr [eax+370]
 0051DB13    call        00529C58
 0051DB18    cmp         byte ptr [eax+15],0
>0051DB1C    jne         0051DBCD
 0051DB22    mov         eax,dword ptr [edi]
 0051DB24    mov         eax,dword ptr [eax+370]
 0051DB2A    mov         edx,esi
 0051DB2C    call        00529C58
 0051DB31    mov         ebx,dword ptr [eax+0C]
 0051DB34    mov         eax,dword ptr [edi]
 0051DB36    mov         eax,dword ptr [eax+324]
 0051DB3C    mov         eax,dword ptr [eax+4]
 0051DB3F    call        TCustomImageList.GetCount
 0051DB44    cmp         ebx,eax
>0051DB46    jg          0051DC8D
 0051DB4C    mov         eax,dword ptr [edi]
 0051DB4E    mov         eax,dword ptr [eax+370]
 0051DB54    mov         edx,esi
 0051DB56    call        00529C58
 0051DB5B    mov         ebx,dword ptr [eax+4]
 0051DB5E    mov         eax,dword ptr [edi]
 0051DB60    call        0051CBB4
 0051DB65    sub         ebx,eax
 0051DB67    mov         eax,dword ptr [edi]
 0051DB69    mov         eax,dword ptr [eax+324]
 0051DB6F    mov         dword ptr [ebp-4],eax
 0051DB72    mov         eax,dword ptr [edi]
 0051DB74    mov         eax,dword ptr [eax+2C8]
 0051DB7A    imul        ebx
 0051DB7C    push        eax
 0051DB7D    mov         eax,dword ptr [edi]
 0051DB7F    mov         eax,dword ptr [eax+370]
 0051DB85    mov         edx,esi
 0051DB87    call        00529C58
 0051DB8C    mov         eax,dword ptr [eax+0C]
 0051DB8F    push        eax
 0051DB90    push        1
 0051DB92    mov         eax,dword ptr [ebp-4]
 0051DB95    mov         ecx,dword ptr [eax+0C]
 0051DB98    mov         eax,dword ptr [ebp+8]
 0051DB9B    mov         eax,dword ptr [eax-0C]
 0051DB9E    add         ecx,dword ptr [eax+ebx*4]
 0051DBA1    mov         eax,dword ptr [edi]
 0051DBA3    mov         edx,dword ptr [eax+270]
 0051DBA9    mov         eax,dword ptr [ebp-4]
 0051DBAC    mov         eax,dword ptr [eax+4]
 0051DBAF    call        TCustomImageList.Draw
 0051DBB4    mov         eax,dword ptr [edi]
 0051DBB6    mov         eax,dword ptr [eax+324]
 0051DBBC    mov         eax,dword ptr [eax+14]
 0051DBBF    mov         edx,dword ptr [ebp+8]
 0051DBC2    mov         edx,dword ptr [edx-0C]
 0051DBC5    add         dword ptr [edx+ebx*4],eax
>0051DBC8    jmp         0051DC8D
 0051DBCD    mov         eax,dword ptr [edi]
 0051DBCF    mov         eax,dword ptr [eax+370]
 0051DBD5    mov         edx,esi
 0051DBD7    call        00529C58
 0051DBDC    mov         eax,dword ptr [eax+0C]
 0051DBDF    sub         eax,0A
>0051DBE2    jae         0051DC8D
 0051DBE8    mov         eax,dword ptr [edi]
 0051DBEA    mov         eax,dword ptr [eax+370]
 0051DBF0    mov         edx,esi
 0051DBF2    call        00529C58
 0051DBF7    mov         ebx,dword ptr [eax+4]
 0051DBFA    mov         eax,dword ptr [edi]
 0051DBFC    call        0051CBB4
 0051DC01    sub         ebx,eax
 0051DC03    mov         eax,dword ptr [edi]
 0051DC05    cmp         dword ptr [eax+3D0],0
>0051DC0C    jne         0051DC29
 0051DC0E    push        0A
 0051DC10    mov         ecx,51DCA0;'mweInternalImages'
 0051DC15    mov         dl,1
 0051DC17    mov         eax,[00511718];TmwInternalImage
 0051DC1C    call        TmwInternalImage.Create;TmwInternalImage.Create
 0051DC21    mov         edx,dword ptr [edi]
 0051DC23    mov         dword ptr [edx+3D0],eax
 0051DC29    mov         eax,dword ptr [edi]
 0051DC2B    mov         eax,dword ptr [eax+324]
 0051DC31    mov         eax,dword ptr [eax+0C]
 0051DC34    mov         edx,dword ptr [ebp+8]
 0051DC37    mov         edx,dword ptr [edx-0C]
 0051DC3A    add         eax,dword ptr [edx+ebx*4]
 0051DC3D    push        eax
 0051DC3E    mov         eax,dword ptr [edi]
 0051DC40    mov         eax,dword ptr [eax+2C8]
 0051DC46    imul        ebx
 0051DC48    push        eax
 0051DC49    mov         eax,dword ptr [edi]
 0051DC4B    mov         eax,dword ptr [eax+2C8]
 0051DC51    push        eax
 0051DC52    mov         eax,dword ptr [edi]
 0051DC54    mov         eax,dword ptr [eax+370]
 0051DC5A    mov         edx,esi
 0051DC5C    call        00529C58
 0051DC61    mov         ecx,dword ptr [eax+0C]
 0051DC64    mov         eax,dword ptr [edi]
 0051DC66    mov         edx,dword ptr [eax+270]
 0051DC6C    mov         eax,dword ptr [edi]
 0051DC6E    mov         eax,dword ptr [eax+3D0]
 0051DC74    call        TmwInternalImage.DrawMark
 0051DC79    mov         eax,dword ptr [edi]
 0051DC7B    mov         eax,dword ptr [eax+324]
 0051DC81    mov         eax,dword ptr [eax+14]
 0051DC84    mov         edx,dword ptr [ebp+8]
 0051DC87    mov         edx,dword ptr [edx-0C]
 0051DC8A    add         dword ptr [edx+ebx*4],eax
 0051DC8D    pop         edi
 0051DC8E    pop         esi
 0051DC8F    pop         ebx
 0051DC90    pop         ecx
 0051DC91    pop         ebp
 0051DC92    ret
end;*}

//0051DCC4
{*procedure sub_0051DCC4(?:?; ?:?; ?:?);
begin
 0051DCC4    push        ebp
 0051DCC5    mov         ebp,esp
 0051DCC7    add         esp,0FFFFFFC4
 0051DCCA    push        ebx
 0051DCCB    push        esi
 0051DCCC    push        edi
 0051DCCD    xor         ebx,ebx
 0051DCCF    mov         dword ptr [ebp-10],ebx
 0051DCD2    mov         esi,edx
 0051DCD4    lea         edi,[ebp-2C]
 0051DCD7    movs        dword ptr [edi],dword ptr [esi]
 0051DCD8    movs        dword ptr [edi],dword ptr [esi]
 0051DCD9    movs        dword ptr [edi],dword ptr [esi]
 0051DCDA    movs        dword ptr [edi],dword ptr [esi]
 0051DCDB    mov         dword ptr [ebp-14],ecx
 0051DCDE    mov         dword ptr [ebp-4],eax
 0051DCE1    xor         eax,eax
 0051DCE3    push        ebp
 0051DCE4    push        51E0ED
 0051DCE9    push        dword ptr fs:[eax]
 0051DCEC    mov         dword ptr fs:[eax],esp
 0051DCEF    mov         eax,dword ptr [ebp-4]
 0051DCF2    mov         eax,dword ptr [eax+3A4];TmwCustomEdit.fGutter:TmwGutter
 0051DCF8    mov         edx,dword ptr [eax+4];TmwGutter.fColor:TColor
 0051DCFB    mov         eax,dword ptr [ebp-4]
 0051DCFE    mov         eax,dword ptr [eax+270];TmwCustomEdit....................FCanvas:TCanvas
 0051DD04    mov         eax,dword ptr [eax+48];TCanvas.FBrush:TBrush
 0051DD07    call        TBrush.SetColor
 0051DD0C    mov         eax,dword ptr [ebp-4]
 0051DD0F    mov         eax,dword ptr [eax+270];TmwCustomEdit.....................FCanvas:TCanvas
 0051DD15    call        TCanvas.GetHandle
 0051DD1A    mov         dword ptr [ebp-1C],eax
 0051DD1D    mov         eax,dword ptr [ebp-4]
 0051DD20    mov         eax,dword ptr [eax+3A4];TmwCustomEdit.fGutter:TmwGutter
 0051DD26    cmp         byte ptr [eax+0C],0;TmwGutter.fShowLineNumbers:Boolean
>0051DD2A    je          0051DEBD
 0051DD30    mov         eax,dword ptr [ebp-4]
 0051DD33    mov         eax,dword ptr [eax+3B8];TmwCustomEdit.fTextDrawer:TheTextDrawer
 0051DD39    mov         edx,dword ptr [ebp-1C]
 0051DD3C    mov         ecx,dword ptr [eax]
 0051DD3E    call        dword ptr [ecx+18];TheTextDrawer.BeginDrawing
 0051DD41    xor         ecx,ecx
 0051DD43    push        ebp
 0051DD44    push        51DEB6
 0051DD49    push        dword ptr fs:[ecx]
 0051DD4C    mov         dword ptr fs:[ecx],esp
 0051DD4F    mov         eax,dword ptr [ebp-4]
 0051DD52    mov         eax,dword ptr [eax+3A4];TmwCustomEdit.fGutter:TmwGutter
 0051DD58    mov         edx,dword ptr [eax+4];TmwGutter.fColor:TColor
 0051DD5B    mov         eax,dword ptr [ebp-4]
 0051DD5E    mov         eax,dword ptr [eax+3B8];TmwCustomEdit.fTextDrawer:TheTextDrawer
 0051DD64    mov         ecx,dword ptr [eax]
 0051DD66    call        dword ptr [ecx+38];TheTextDrawer.SetBackColor
 0051DD69    mov         eax,dword ptr [ebp-4]
 0051DD6C    call        TmwCustomEdit.GetFont
 0051DD71    mov         edx,dword ptr [eax+18]
 0051DD74    mov         eax,dword ptr [ebp-4]
 0051DD77    mov         eax,dword ptr [eax+3B8];TmwCustomEdit.fTextDrawer:TheTextDrawer
 0051DD7D    mov         ecx,dword ptr [eax]
 0051DD7F    call        dword ptr [ecx+34];TheTextDrawer.SetForeColor
 0051DD82    mov         eax,dword ptr [ebp-4]
 0051DD85    mov         eax,dword ptr [eax+3A4];TmwCustomEdit.fGutter:TmwGutter
 0051DD8B    cmp         byte ptr [eax+2B],0;TmwGutter.fUseFontStyle:Boolean
>0051DD8F    je          0051DDB0
 0051DD91    mov         eax,dword ptr [ebp-4]
 0051DD94    call        TmwCustomEdit.GetFont
 0051DD99    mov         eax,dword ptr [eax+10]
 0051DD9C    movzx       edx,byte ptr [eax+21]
 0051DDA0    mov         eax,dword ptr [ebp-4]
 0051DDA3    mov         eax,dword ptr [eax+3B8];TmwCustomEdit.fTextDrawer:TheTextDrawer
 0051DDA9    mov         ecx,dword ptr [eax]
 0051DDAB    call        dword ptr [ecx+30];TheTextDrawer.SetStyle
>0051DDAE    jmp         0051DDC5
 0051DDB0    mov         eax,dword ptr [ebp-4]
 0051DDB3    mov         eax,dword ptr [eax+3B8];TmwCustomEdit.fTextDrawer:TheTextDrawer
 0051DDB9    movzx       edx,byte ptr ds:[51E100];0x0 gvar_0051E100
 0051DDC0    mov         ecx,dword ptr [eax]
 0051DDC2    call        dword ptr [ecx+30];TheTextDrawer.SetStyle
 0051DDC5    lea         esi,[ebp-2C]
 0051DDC8    lea         edi,[ebp-3C]
 0051DDCB    movs        dword ptr [edi],dword ptr [esi]
 0051DDCC    movs        dword ptr [edi],dword ptr [esi]
 0051DDCD    movs        dword ptr [edi],dword ptr [esi]
 0051DDCE    movs        dword ptr [edi],dword ptr [esi]
 0051DDCF    mov         eax,dword ptr [ebp-4]
 0051DDD2    mov         edx,dword ptr [eax+29C];TmwCustomEdit.fGutterWidth:Integer
 0051DDD8    sub         edx,2
 0051DDDB    mov         eax,dword ptr [ebp-34]
 0051DDDE    call        00510484
 0051DDE3    mov         dword ptr [ebp-34],eax
 0051DDE6    mov         eax,dword ptr [ebp-4]
 0051DDE9    call        0051CBB4
 0051DDEE    mov         edx,dword ptr [ebp-14]
 0051DDF1    sub         edx,eax
 0051DDF3    mov         eax,dword ptr [ebp-4]
 0051DDF6    imul        edx,dword ptr [eax+2C8];TmwCustomEdit.fTextHeight:Integer
 0051DDFD    mov         dword ptr [ebp-30],edx
 0051DE00    mov         edi,dword ptr [ebp-14]
 0051DE03    mov         ebx,dword ptr [ebp+8]
 0051DE06    sub         ebx,edi
>0051DE08    jl          0051DE6C
 0051DE0A    inc         ebx
 0051DE0B    mov         eax,dword ptr [ebp-30]
 0051DE0E    mov         dword ptr [ebp-38],eax
 0051DE11    mov         eax,dword ptr [ebp-4]
 0051DE14    mov         eax,dword ptr [eax+2C8];TmwCustomEdit.fTextHeight:Integer
 0051DE1A    add         dword ptr [ebp-30],eax
 0051DE1D    lea         ecx,[ebp-10]
 0051DE20    mov         eax,dword ptr [ebp-4]
 0051DE23    mov         eax,dword ptr [eax+3A4];TmwCustomEdit.fGutter:TmwGutter
 0051DE29    mov         edx,edi
 0051DE2B    call        TmwGutter.FormatLineNumber
 0051DE30    mov         esi,dword ptr [ebp-10]
 0051DE33    test        esi,esi
>0051DE35    je          0051DE3C
 0051DE37    sub         esi,4
 0051DE3A    mov         esi,dword ptr [esi]
 0051DE3C    push        0
 0051DE3E    push        esi
 0051DE3F    mov         eax,dword ptr [ebp-10]
 0051DE42    call        @UStrToPWChar
 0051DE47    push        eax
 0051DE48    lea         eax,[ebp-3C]
 0051DE4B    push        eax
 0051DE4C    push        2
 0051DE4E    mov         eax,dword ptr [ebp-38]
 0051DE51    push        eax
 0051DE52    mov         eax,dword ptr [ebp-4]
 0051DE55    mov         eax,dword ptr [eax+3A4];TmwCustomEdit.fGutter:TmwGutter
 0051DE5B    mov         eax,dword ptr [eax+18];TmwGutter.fLeftOffset:Integer
 0051DE5E    push        eax
 0051DE5F    mov         eax,dword ptr [ebp-1C]
 0051DE62    push        eax
 0051DE63    call        gdi32.ExtTextOutW
 0051DE68    inc         edi
 0051DE69    dec         ebx
>0051DE6A    jne         0051DE0B
 0051DE6C    mov         eax,dword ptr [ebp-30]
 0051DE6F    mov         edx,dword ptr [ebp-20]
 0051DE72    cmp         eax,edx
>0051DE74    jge         0051DE9A
 0051DE76    mov         dword ptr [ebp-38],eax
 0051DE79    mov         dword ptr [ebp-30],edx
 0051DE7C    push        2
 0051DE7E    lea         eax,[ebp-3C]
 0051DE81    push        eax
 0051DE82    push        0
 0051DE84    push        0
 0051DE86    mov         eax,dword ptr [ebp-4]
 0051DE89    mov         eax,dword ptr [eax+3B8];TmwCustomEdit.fTextDrawer:TheTextDrawer
 0051DE8F    mov         ecx,dword ptr [ebp-38]
 0051DE92    mov         edx,dword ptr [ebp-3C]
 0051DE95    mov         ebx,dword ptr [eax]
 0051DE97    call        dword ptr [ebx+24];TheTextDrawer.ExtTextOut
 0051DE9A    xor         eax,eax
 0051DE9C    pop         edx
 0051DE9D    pop         ecx
 0051DE9E    pop         ecx
 0051DE9F    mov         dword ptr fs:[eax],edx
 0051DEA2    push        51DEC8
 0051DEA7    mov         eax,dword ptr [ebp-4]
 0051DEAA    mov         eax,dword ptr [eax+3B8];TmwCustomEdit.fTextDrawer:TheTextDrawer
 0051DEB0    mov         edx,dword ptr [eax]
 0051DEB2    call        dword ptr [edx+1C];TheTextDrawer.EndDrawing
 0051DEB5    ret
>0051DEB6    jmp         @HandleFinally
>0051DEBB    jmp         0051DEA7
 0051DEBD    lea         edx,[ebp-2C]
 0051DEC0    mov         eax,dword ptr [ebp-1C]
 0051DEC3    call        005104E0
 0051DEC8    mov         eax,dword ptr [ebp-4]
 0051DECB    mov         eax,dword ptr [eax+29C];TmwCustomEdit.fGutterWidth:Integer
 0051DED1    sub         eax,2
 0051DED4    cmp         eax,dword ptr [ebp-24]
>0051DED7    jg          0051DF61
 0051DEDD    mov         eax,dword ptr [ebp-4]
 0051DEE0    mov         ebx,dword ptr [eax+270];TmwCustomEdit......................FCanvas:TCanvas
 0051DEE6    mov         eax,dword ptr [ebx+44];TCanvas.FPen:TPen
 0051DEE9    mov         edx,0FF000014
 0051DEEE    call        TPen.SetColor
 0051DEF3    mov         eax,dword ptr [ebx+44];TCanvas.FPen:TPen
 0051DEF6    mov         edx,1
 0051DEFB    call        TPen.SetWidth
 0051DF00    mov         eax,dword ptr [ebp-4]
 0051DF03    mov         edx,dword ptr [eax+29C];TmwCustomEdit.fGutterWidth:Integer
 0051DF09    sub         edx,2
 0051DF0C    mov         ecx,dword ptr [ebp-28]
 0051DF0F    mov         eax,ebx
 0051DF11    mov         esi,dword ptr [eax]
 0051DF13    call        dword ptr [esi+64];TCanvas.MoveTo
 0051DF16    mov         eax,dword ptr [ebp-4]
 0051DF19    mov         edx,dword ptr [eax+29C];TmwCustomEdit.fGutterWidth:Integer
 0051DF1F    sub         edx,2
 0051DF22    mov         ecx,dword ptr [ebp-20]
 0051DF25    mov         eax,ebx
 0051DF27    mov         esi,dword ptr [eax]
 0051DF29    call        dword ptr [esi+60];TCanvas.LineTo
 0051DF2C    mov         eax,dword ptr [ebx+44];TCanvas.FPen:TPen
 0051DF2F    mov         edx,0FF000010
 0051DF34    call        TPen.SetColor
 0051DF39    mov         eax,dword ptr [ebp-4]
 0051DF3C    mov         edx,dword ptr [eax+29C];TmwCustomEdit.fGutterWidth:Integer
 0051DF42    dec         edx
 0051DF43    mov         ecx,dword ptr [ebp-28]
 0051DF46    mov         eax,ebx
 0051DF48    mov         esi,dword ptr [eax]
 0051DF4A    call        dword ptr [esi+64];TCanvas.MoveTo
 0051DF4D    mov         eax,dword ptr [ebp-4]
 0051DF50    mov         edx,dword ptr [eax+29C];TmwCustomEdit.fGutterWidth:Integer
 0051DF56    dec         edx
 0051DF57    mov         ecx,dword ptr [ebp-20]
 0051DF5A    mov         eax,ebx
 0051DF5C    mov         ebx,dword ptr [eax]
 0051DF5E    call        dword ptr [ebx+60];TCanvas.LineTo
 0051DF61    mov         eax,dword ptr [ebp-4]
 0051DF64    mov         eax,dword ptr [eax+324];TmwCustomEdit.fBookMarkOpt:TmwBookMarkOpt
 0051DF6A    cmp         byte ptr [eax+9],0;TmwBookMarkOpt.fGlyphsVisible:Boolean
>0051DF6E    je          0051E0D7
 0051DF74    mov         eax,dword ptr [ebp-4]
 0051DF77    mov         eax,dword ptr [eax+370];TmwCustomEdit.fMarkList:TMarkList
 0051DF7D    cmp         dword ptr [eax+8],0;TMarkList.FCount:Integer
>0051DF81    jle         0051E0D7
 0051DF87    mov         eax,dword ptr [ebp+8]
 0051DF8A    cmp         eax,dword ptr [ebp-14]
>0051DF8D    jl          0051E0D7
 0051DF93    mov         eax,dword ptr [ebp-4]
 0051DF96    call        0051CBB4
 0051DF9B    mov         edx,dword ptr [ebp+8]
 0051DF9E    sub         edx,eax
 0051DFA0    inc         edx
 0051DFA1    mov         eax,edx
 0051DFA3    add         eax,eax
 0051DFA5    add         eax,eax
 0051DFA7    call        AllocMem
 0051DFAC    mov         dword ptr [ebp-0C],eax
 0051DFAF    xor         eax,eax
 0051DFB1    push        ebp
 0051DFB2    push        51E0D0
 0051DFB7    push        dword ptr fs:[eax]
 0051DFBA    mov         dword ptr fs:[eax],esp
 0051DFBD    mov         byte ptr [ebp-15],0
 0051DFC1    mov         eax,dword ptr [ebp-4]
 0051DFC4    mov         eax,dword ptr [eax+370];TmwCustomEdit.fMarkList:TMarkList
 0051DFCA    mov         ebx,dword ptr [eax+8];TMarkList.FCount:Integer
 0051DFCD    dec         ebx
 0051DFCE    test        ebx,ebx
>0051DFD0    jl          0051E057
 0051DFD6    inc         ebx
 0051DFD7    mov         dword ptr [ebp-8],0
 0051DFDE    mov         eax,dword ptr [ebp-4]
 0051DFE1    mov         eax,dword ptr [eax+370];TmwCustomEdit.fMarkList:TMarkList
 0051DFE7    mov         edx,dword ptr [ebp-8]
 0051DFEA    call        00529C58
 0051DFEF    cmp         byte ptr [eax+14],0
>0051DFF3    je          0051E051
 0051DFF5    mov         eax,dword ptr [ebp-4]
 0051DFF8    mov         eax,dword ptr [eax+370];TmwCustomEdit.fMarkList:TMarkList
 0051DFFE    mov         edx,dword ptr [ebp-8]
 0051E001    call        00529C58
 0051E006    mov         eax,dword ptr [eax+4]
 0051E009    cmp         eax,dword ptr [ebp-14]
>0051E00C    jl          0051E051
 0051E00E    mov         eax,dword ptr [ebp-4]
 0051E011    mov         eax,dword ptr [eax+370];TmwCustomEdit.fMarkList:TMarkList
 0051E017    mov         edx,dword ptr [ebp-8]
 0051E01A    call        00529C58
 0051E01F    mov         eax,dword ptr [eax+4]
 0051E022    cmp         eax,dword ptr [ebp+8]
>0051E025    jg          0051E051
 0051E027    mov         eax,dword ptr [ebp-4]
 0051E02A    mov         eax,dword ptr [eax+370];TmwCustomEdit.fMarkList:TMarkList
 0051E030    mov         edx,dword ptr [ebp-8]
 0051E033    call        00529C58
 0051E038    call        00529A38
 0051E03D    test        al,al
>0051E03F    je          0051E047
 0051E041    mov         byte ptr [ebp-15],1
>0051E045    jmp         0051E051
 0051E047    push        ebp
 0051E048    mov         eax,dword ptr [ebp-8]
 0051E04B    call        0051DAE4
 0051E050    pop         ecx
 0051E051    inc         dword ptr [ebp-8]
 0051E054    dec         ebx
>0051E055    jne         0051DFDE
 0051E057    cmp         byte ptr [ebp-15],0
>0051E05B    je          0051E0BA
 0051E05D    mov         eax,dword ptr [ebp-4]
 0051E060    mov         eax,dword ptr [eax+370];TmwCustomEdit.fMarkList:TMarkList
 0051E066    mov         ebx,dword ptr [eax+8];TMarkList.FCount:Integer
 0051E069    dec         ebx
 0051E06A    test        ebx,ebx
>0051E06C    jl          0051E0BA
 0051E06E    inc         ebx
 0051E06F    mov         dword ptr [ebp-8],0
 0051E076    mov         eax,dword ptr [ebp-4]
 0051E079    mov         eax,dword ptr [eax+370];TmwCustomEdit.fMarkList:TMarkList
 0051E07F    mov         edx,dword ptr [ebp-8]
 0051E082    call        00529C58
 0051E087    mov         esi,eax
 0051E089    cmp         byte ptr [esi+14],0
>0051E08D    je          0051E0B4
 0051E08F    mov         eax,esi
 0051E091    call        00529A38
 0051E096    test        al,al
>0051E098    je          0051E0B4
 0051E09A    mov         eax,dword ptr [esi+4]
 0051E09D    cmp         eax,dword ptr [ebp-14]
>0051E0A0    jl          0051E0B4
 0051E0A2    mov         eax,dword ptr [esi+4]
 0051E0A5    cmp         eax,dword ptr [ebp+8]
>0051E0A8    jg          0051E0B4
 0051E0AA    push        ebp
 0051E0AB    mov         eax,dword ptr [ebp-8]
 0051E0AE    call        0051DAE4
 0051E0B3    pop         ecx
 0051E0B4    inc         dword ptr [ebp-8]
 0051E0B7    dec         ebx
>0051E0B8    jne         0051E076
 0051E0BA    xor         eax,eax
 0051E0BC    pop         edx
 0051E0BD    pop         ecx
 0051E0BE    pop         ecx
 0051E0BF    mov         dword ptr fs:[eax],edx
 0051E0C2    push        51E0D7
 0051E0C7    mov         eax,dword ptr [ebp-0C]
 0051E0CA    call        @FreeMem
 0051E0CF    ret
>0051E0D0    jmp         @HandleFinally
>0051E0D5    jmp         0051E0C7
 0051E0D7    xor         eax,eax
 0051E0D9    pop         edx
 0051E0DA    pop         ecx
 0051E0DB    pop         ecx
 0051E0DC    mov         dword ptr fs:[eax],edx
 0051E0DF    push        51E0F4
 0051E0E4    lea         eax,[ebp-10]
 0051E0E7    call        @UStrClr
 0051E0EC    ret
>0051E0ED    jmp         @HandleFinally
>0051E0F2    jmp         0051E0E4
 0051E0F4    pop         edi
 0051E0F5    pop         esi
 0051E0F6    pop         ebx
 0051E0F7    mov         esp,ebp
 0051E0F9    pop         ebp
 0051E0FA    ret         4
end;*}

//0051E1A4
{*procedure sub_0051E1A4(?:?);
begin
 0051E1A4    push        ebp
 0051E1A5    mov         ebp,esp
 0051E1A7    push        esi
 0051E1A8    mov         eax,dword ptr [ebp+8]
 0051E1AB    mov         byte ptr [eax-2D],0
 0051E1AF    mov         eax,dword ptr [ebp+8]
 0051E1B2    mov         eax,dword ptr [eax-34]
 0051E1B5    cmp         byte ptr [eax+341],0
>0051E1BC    je          0051E1D5
 0051E1BE    mov         eax,dword ptr [ebp+8]
 0051E1C1    mov         eax,dword ptr [eax-34]
 0051E1C4    mov         si,0FFB3
 0051E1C8    call        @CallDynaInst
 0051E1CD    test        al,al
>0051E1CF    je          0051E373
 0051E1D5    mov         eax,dword ptr [ebp+8]
 0051E1D8    mov         byte ptr [eax-2D],1
 0051E1DC    mov         edx,dword ptr [ebp+8]
 0051E1DF    mov         edx,dword ptr [edx-34]
 0051E1E2    mov         edx,dword ptr [edx+284]
 0051E1E8    mov         eax,dword ptr [ebp+8]
 0051E1EB    mov         eax,dword ptr [eax-34]
 0051E1EE    mov         eax,dword ptr [eax+27C]
 0051E1F4    cmp         edx,eax
>0051E1F6    jle         0051E23C
 0051E1F8    mov         edx,dword ptr [ebp+8]
 0051E1FB    mov         edx,dword ptr [ebp+8]
 0051E1FE    mov         dword ptr [edx-38],eax
 0051E201    mov         eax,dword ptr [ebp+8]
 0051E204    mov         eax,dword ptr [eax-34]
 0051E207    mov         eax,dword ptr [eax+278]
 0051E20D    mov         edx,dword ptr [ebp+8]
 0051E210    mov         dword ptr [edx-4],eax
 0051E213    mov         eax,dword ptr [ebp+8]
 0051E216    mov         eax,dword ptr [eax-34]
 0051E219    mov         eax,dword ptr [eax+284]
 0051E21F    mov         edx,dword ptr [ebp+8]
 0051E222    mov         dword ptr [edx-3C],eax
 0051E225    mov         eax,dword ptr [ebp+8]
 0051E228    mov         eax,dword ptr [eax-34]
 0051E22B    mov         eax,dword ptr [eax+280]
 0051E231    mov         edx,dword ptr [ebp+8]
 0051E234    mov         dword ptr [edx-8],eax
>0051E237    jmp         0051E314
 0051E23C    mov         ecx,dword ptr [ebp+8]
 0051E23F    mov         ecx,dword ptr [ebp+8]
 0051E242    cmp         edx,eax
>0051E244    jge         0051E28A
 0051E246    mov         edx,dword ptr [ebp+8]
 0051E249    mov         edx,dword ptr [ebp+8]
 0051E24C    mov         dword ptr [edx-3C],eax
 0051E24F    mov         eax,dword ptr [ebp+8]
 0051E252    mov         eax,dword ptr [eax-34]
 0051E255    mov         eax,dword ptr [eax+278]
 0051E25B    mov         edx,dword ptr [ebp+8]
 0051E25E    mov         dword ptr [edx-8],eax
 0051E261    mov         eax,dword ptr [ebp+8]
 0051E264    mov         eax,dword ptr [eax-34]
 0051E267    mov         eax,dword ptr [eax+284]
 0051E26D    mov         edx,dword ptr [ebp+8]
 0051E270    mov         dword ptr [edx-38],eax
 0051E273    mov         eax,dword ptr [ebp+8]
 0051E276    mov         eax,dword ptr [eax-34]
 0051E279    mov         eax,dword ptr [eax+280]
 0051E27F    mov         edx,dword ptr [ebp+8]
 0051E282    mov         dword ptr [edx-4],eax
>0051E285    jmp         0051E314
 0051E28A    mov         edx,dword ptr [ebp+8]
 0051E28D    mov         edx,dword ptr [edx-34]
 0051E290    mov         edx,dword ptr [edx+278]
 0051E296    mov         ecx,dword ptr [ebp+8]
 0051E299    mov         ecx,dword ptr [ecx-34]
 0051E29C    cmp         edx,dword ptr [ecx+280]
>0051E2A2    je          0051E30D
 0051E2A4    mov         edx,dword ptr [ebp+8]
 0051E2A7    mov         edx,dword ptr [ebp+8]
 0051E2AA    mov         dword ptr [edx-38],eax
 0051E2AD    mov         eax,dword ptr [ebp+8]
 0051E2B0    mov         eax,dword ptr [eax-38]
 0051E2B3    mov         edx,dword ptr [ebp+8]
 0051E2B6    mov         dword ptr [edx-3C],eax
 0051E2B9    mov         eax,dword ptr [ebp+8]
 0051E2BC    mov         eax,dword ptr [eax-34]
 0051E2BF    mov         eax,dword ptr [eax+278]
 0051E2C5    mov         edx,dword ptr [ebp+8]
 0051E2C8    mov         edx,dword ptr [edx-34]
 0051E2CB    cmp         eax,dword ptr [edx+280]
>0051E2D1    jge         0051E2F0
 0051E2D3    mov         edx,dword ptr [ebp+8]
 0051E2D6    mov         edx,dword ptr [ebp+8]
 0051E2D9    mov         dword ptr [edx-4],eax
 0051E2DC    mov         eax,dword ptr [ebp+8]
 0051E2DF    mov         eax,dword ptr [eax-34]
 0051E2E2    mov         eax,dword ptr [eax+280]
 0051E2E8    mov         edx,dword ptr [ebp+8]
 0051E2EB    mov         dword ptr [edx-8],eax
>0051E2EE    jmp         0051E314
 0051E2F0    mov         edx,dword ptr [ebp+8]
 0051E2F3    mov         edx,dword ptr [ebp+8]
 0051E2F6    mov         dword ptr [edx-8],eax
 0051E2F9    mov         eax,dword ptr [ebp+8]
 0051E2FC    mov         eax,dword ptr [eax-34]
 0051E2FF    mov         eax,dword ptr [eax+280]
 0051E305    mov         edx,dword ptr [ebp+8]
 0051E308    mov         dword ptr [edx-4],eax
>0051E30B    jmp         0051E314
 0051E30D    mov         eax,dword ptr [ebp+8]
 0051E310    mov         byte ptr [eax-2D],0
 0051E314    mov         eax,dword ptr [ebp+8]
 0051E317    cmp         byte ptr [eax-2D],0
>0051E31B    je          0051E373
 0051E31D    mov         eax,dword ptr [ebp+8]
 0051E320    mov         eax,dword ptr [eax-3C]
 0051E323    mov         edx,dword ptr [ebp+8]
 0051E326    cmp         eax,dword ptr [edx-40]
>0051E329    jl          0051E339
 0051E32B    mov         eax,dword ptr [ebp+8]
 0051E32E    mov         eax,dword ptr [eax-38]
 0051E331    mov         edx,dword ptr [ebp+8]
 0051E334    cmp         eax,dword ptr [edx+10]
>0051E337    jle         0051E33D
 0051E339    xor         eax,eax
>0051E33B    jmp         0051E33F
 0051E33D    mov         al,1
 0051E33F    mov         edx,dword ptr [ebp+8]
 0051E342    mov         byte ptr [edx-2D],al
 0051E345    mov         eax,dword ptr [ebp+8]
 0051E348    mov         eax,dword ptr [eax-34]
 0051E34B    cmp         byte ptr [eax+390],1
>0051E352    jne         0051E373
 0051E354    mov         eax,dword ptr [ebp+8]
 0051E357    mov         eax,dword ptr [eax-4]
 0051E35A    mov         edx,dword ptr [ebp+8]
 0051E35D    cmp         eax,dword ptr [edx-8]
>0051E360    jle         0051E373
 0051E362    mov         eax,dword ptr [ebp+8]
 0051E365    lea         edx,[eax-8]
 0051E368    mov         eax,dword ptr [ebp+8]
 0051E36B    add         eax,0FFFFFFFC
 0051E36E    call        005104A4
 0051E373    pop         esi
 0051E374    pop         ebp
 0051E375    ret
end;*}

//0051E378
{*procedure sub_0051E378(?:?; ?:?);
begin
 0051E378    push        ebp
 0051E379    mov         ebp,esp
 0051E37B    push        ebx
 0051E37C    mov         edx,dword ptr [ebp+8]
 0051E37F    mov         edx,dword ptr [edx-34]
 0051E382    mov         ebx,dword ptr [edx+3B8]
 0051E388    test        al,al
>0051E38A    je          0051E3A9
 0051E38C    mov         eax,dword ptr [ebp+8]
 0051E38F    mov         edx,dword ptr [eax-44]
 0051E392    mov         eax,ebx
 0051E394    mov         ecx,dword ptr [eax]
 0051E396    call        dword ptr [ecx+38]
 0051E399    mov         eax,dword ptr [ebp+8]
 0051E39C    mov         edx,dword ptr [eax-48]
 0051E39F    mov         eax,ebx
 0051E3A1    mov         ecx,dword ptr [eax]
 0051E3A3    call        dword ptr [ecx+34]
 0051E3A6    pop         ebx
 0051E3A7    pop         ebp
 0051E3A8    ret
 0051E3A9    mov         eax,dword ptr [ebp+8]
 0051E3AC    mov         edx,dword ptr [eax-2C]
 0051E3AF    mov         eax,ebx
 0051E3B1    mov         ecx,dword ptr [eax]
 0051E3B3    call        dword ptr [ecx+38]
 0051E3B6    mov         eax,dword ptr [ebp+8]
 0051E3B9    mov         edx,dword ptr [eax-28]
 0051E3BC    mov         eax,ebx
 0051E3BE    mov         ecx,dword ptr [eax]
 0051E3C0    call        dword ptr [ecx+34]
 0051E3C3    pop         ebx
 0051E3C4    pop         ebp
 0051E3C5    ret
end;*}

//0051E3C8
{*function sub_0051E3C8(?:?; ?:?):?;
begin
 0051E3C8    push        ebp
 0051E3C9    mov         ebp,esp
 0051E3CB    dec         eax
 0051E3CC    mov         edx,dword ptr [ebp+8]
 0051E3CF    mov         edx,dword ptr [edx-34]
 0051E3D2    imul        dword ptr [edx+294]
 0051E3D8    mov         edx,dword ptr [ebp+8]
 0051E3DB    mov         edx,dword ptr [edx-34]
 0051E3DE    add         eax,dword ptr [edx+2CC]
 0051E3E4    pop         ebp
 0051E3E5    ret
end;*}

//0051E3E8
{*procedure sub_0051E3E8(?:?; ?:?; ?:?; ?:?; ?:?; ?:?);
begin
 0051E3E8    push        ebp
 0051E3E9    mov         ebp,esp
 0051E3EB    add         esp,0FFFFFFF4
 0051E3EE    push        ebx
 0051E3EF    push        esi
 0051E3F0    push        edi
 0051E3F1    mov         edi,ecx
 0051E3F3    mov         dword ptr [ebp-8],edx
 0051E3F6    mov         dword ptr [ebp-4],eax
 0051E3F9    mov         esi,dword ptr [ebp+8]
 0051E3FC    mov         ebx,dword ptr [ebp+0C]
 0051E3FF    cmp         ebx,esi
>0051E401    jg          0051E477
 0051E403    mov         eax,dword ptr [ebp+10]
 0051E406    mov         eax,dword ptr [eax-50]
 0051E409    mov         edx,dword ptr [ebp+10]
 0051E40C    cmp         eax,dword ptr [edx-58]
>0051E40F    jle         0051E477
 0051E411    mov         eax,dword ptr [ebp+10]
 0051E414    push        eax
 0051E415    mov         eax,ebx
 0051E417    call        0051E3C8
 0051E41C    pop         ecx
 0051E41D    mov         dword ptr [ebp-0C],eax
 0051E420    sub         ebx,edi
 0051E422    sub         esi,edi
 0051E424    cmp         ebx,dword ptr [ebp-8]
>0051E427    jle         0051E42F
 0051E429    xor         edi,edi
 0051E42B    xor         eax,eax
>0051E42D    jmp         0051E446
 0051E42F    mov         eax,dword ptr [ebp-4]
 0051E432    lea         edi,[eax+ebx*2-2]
 0051E436    mov         edx,dword ptr [ebp-8]
 0051E439    sub         edx,ebx
 0051E43B    inc         edx
 0051E43C    mov         eax,esi
 0051E43E    sub         eax,ebx
 0051E440    inc         eax
 0051E441    call        0051048C
 0051E446    push        6
 0051E448    mov         edx,dword ptr [ebp+10]
 0051E44B    add         edx,0FFFFFFA8
 0051E44E    push        edx
 0051E44F    push        edi
 0051E450    push        eax
 0051E451    mov         eax,dword ptr [ebp+10]
 0051E454    mov         ecx,dword ptr [eax-54]
 0051E457    mov         eax,dword ptr [ebp+10]
 0051E45A    mov         eax,dword ptr [eax-34]
 0051E45D    mov         eax,dword ptr [eax+3B8]
 0051E463    mov         edx,dword ptr [ebp-0C]
 0051E466    mov         ebx,dword ptr [eax]
 0051E468    call        dword ptr [ebx+24]
 0051E46B    mov         eax,dword ptr [ebp+10]
 0051E46E    mov         eax,dword ptr [eax-50]
 0051E471    mov         edx,dword ptr [ebp+10]
 0051E474    mov         dword ptr [edx-58],eax
 0051E477    pop         edi
 0051E478    pop         esi
 0051E479    pop         ebx
 0051E47A    mov         esp,ebp
 0051E47C    pop         ebp
 0051E47D    ret         8
end;*}

//0051E480
{*procedure sub_0051E480(?:?; ?:?);
begin
 0051E480    push        ebp
 0051E481    mov         ebp,esp
 0051E483    push        ecx
 0051E484    push        ebx
 0051E485    push        esi
 0051E486    push        edi
 0051E487    mov         byte ptr [ebp-1],al
 0051E48A    mov         eax,dword ptr [ebp+8]
 0051E48D    mov         edx,dword ptr [eax-1C]
 0051E490    inc         edx
 0051E491    mov         eax,dword ptr [ebp+8]
 0051E494    mov         eax,dword ptr [eax+0C]
 0051E497    call        00510484
 0051E49C    mov         esi,eax
 0051E49E    mov         eax,dword ptr [ebp+8]
 0051E4A1    mov         edx,dword ptr [eax-1C]
 0051E4A4    mov         eax,dword ptr [ebp+8]
 0051E4A7    add         edx,dword ptr [eax-24]
 0051E4AA    inc         edx
 0051E4AB    mov         eax,dword ptr [ebp+8]
 0051E4AE    mov         eax,dword ptr [eax+8]
 0051E4B1    call        0051048C
 0051E4B6    mov         edi,eax
 0051E4B8    mov         eax,dword ptr [ebp+8]
 0051E4BB    cmp         byte ptr [eax-59],0
>0051E4BF    je          0051E506
 0051E4C1    mov         eax,dword ptr [ebp+8]
 0051E4C4    cmp         esi,dword ptr [eax-60]
 0051E4C7    setl        bl
 0051E4CA    mov         eax,dword ptr [ebp+8]
 0051E4CD    cmp         esi,dword ptr [eax-64]
>0051E4D0    jge         0051E4DA
 0051E4D2    mov         eax,dword ptr [ebp+8]
 0051E4D5    cmp         edi,dword ptr [eax-60]
>0051E4D8    jge         0051E4DE
 0051E4DA    xor         eax,eax
>0051E4DC    jmp         0051E4E0
 0051E4DE    mov         al,1
 0051E4E0    mov         byte ptr [ebp-3],al
 0051E4E3    mov         eax,dword ptr [ebp+8]
 0051E4E6    cmp         edi,dword ptr [eax-64]
 0051E4E9    setge       byte ptr [ebp-4]
 0051E4ED    cmp         byte ptr [ebp-3],0
>0051E4F1    je          0051E4FB
 0051E4F3    movzx       eax,byte ptr [ebp-4]
 0051E4F7    or          al,bl
>0051E4F9    jne         0051E4FF
 0051E4FB    xor         eax,eax
>0051E4FD    jmp         0051E501
 0051E4FF    mov         al,1
 0051E501    mov         byte ptr [ebp-2],al
>0051E504    jmp         0051E51A
 0051E506    xor         ebx,ebx
 0051E508    mov         eax,dword ptr [ebp+8]
 0051E50B    movzx       eax,byte ptr [eax-65]
 0051E50F    mov         byte ptr [ebp-3],al
 0051E512    mov         byte ptr [ebp-4],0
 0051E516    mov         byte ptr [ebp-2],0
 0051E51A    mov         eax,dword ptr [ebp+8]
 0051E51D    cmp         dword ptr [eax-24],0
>0051E521    jle         0051E69A
 0051E527    mov         eax,dword ptr [ebp+8]
 0051E52A    cmp         byte ptr [eax-66],0
>0051E52E    jne         0051E548
 0051E530    mov         eax,dword ptr [ebp+8]
 0051E533    mov         eax,dword ptr [eax-10]
 0051E536    mov         edx,dword ptr [ebp+8]
 0051E539    mov         dword ptr [edx-2C],eax
 0051E53C    mov         eax,dword ptr [ebp+8]
 0051E53F    mov         eax,dword ptr [eax-14]
 0051E542    mov         edx,dword ptr [ebp+8]
 0051E545    mov         dword ptr [edx-28],eax
 0051E548    mov         eax,dword ptr [ebp+8]
 0051E54B    movzx       edx,byte ptr [eax-0C]
 0051E54F    mov         eax,dword ptr [ebp+8]
 0051E552    mov         eax,dword ptr [eax-34]
 0051E555    mov         eax,dword ptr [eax+3B8]
 0051E55B    mov         ecx,dword ptr [eax]
 0051E55D    call        dword ptr [ecx+30]
 0051E560    cmp         byte ptr [ebp-2],0
>0051E564    je          0051E65C
 0051E56A    test        bl,bl
>0051E56C    je          0051E5B4
 0051E56E    mov         eax,dword ptr [ebp+8]
 0051E571    push        eax
 0051E572    xor         eax,eax
 0051E574    call        0051E378
 0051E579    pop         ecx
 0051E57A    mov         eax,dword ptr [ebp+8]
 0051E57D    push        eax
 0051E57E    mov         eax,dword ptr [ebp+8]
 0051E581    mov         eax,dword ptr [eax-60]
 0051E584    call        0051E3C8
 0051E589    pop         ecx
 0051E58A    mov         edx,dword ptr [ebp+8]
 0051E58D    mov         dword ptr [edx-50],eax
 0051E590    mov         eax,dword ptr [ebp+8]
 0051E593    push        eax
 0051E594    push        esi
 0051E595    mov         eax,dword ptr [ebp+8]
 0051E598    mov         eax,dword ptr [eax-60]
 0051E59B    push        eax
 0051E59C    mov         eax,dword ptr [ebp+8]
 0051E59F    mov         ecx,dword ptr [eax-1C]
 0051E5A2    mov         eax,dword ptr [ebp+8]
 0051E5A5    mov         edx,dword ptr [eax-24]
 0051E5A8    mov         eax,dword ptr [ebp+8]
 0051E5AB    mov         eax,dword ptr [eax-18]
 0051E5AE    call        0051E3E8
 0051E5B3    pop         ecx
 0051E5B4    mov         eax,dword ptr [ebp+8]
 0051E5B7    push        eax
 0051E5B8    mov         al,1
 0051E5BA    call        0051E378
 0051E5BF    pop         ecx
 0051E5C0    mov         eax,dword ptr [ebp+8]
 0051E5C3    mov         eax,dword ptr [eax-60]
 0051E5C6    mov         edx,esi
 0051E5C8    call        00510484
 0051E5CD    mov         esi,eax
 0051E5CF    mov         eax,dword ptr [ebp+8]
 0051E5D2    mov         eax,dword ptr [eax-64]
 0051E5D5    mov         edx,edi
 0051E5D7    call        0051048C
 0051E5DC    mov         ebx,eax
 0051E5DE    mov         eax,dword ptr [ebp+8]
 0051E5E1    push        eax
 0051E5E2    mov         eax,ebx
 0051E5E4    call        0051E3C8
 0051E5E9    pop         ecx
 0051E5EA    mov         edx,dword ptr [ebp+8]
 0051E5ED    mov         dword ptr [edx-50],eax
 0051E5F0    mov         eax,dword ptr [ebp+8]
 0051E5F3    push        eax
 0051E5F4    push        esi
 0051E5F5    push        ebx
 0051E5F6    mov         eax,dword ptr [ebp+8]
 0051E5F9    mov         ecx,dword ptr [eax-1C]
 0051E5FC    mov         eax,dword ptr [ebp+8]
 0051E5FF    mov         edx,dword ptr [eax-24]
 0051E602    mov         eax,dword ptr [ebp+8]
 0051E605    mov         eax,dword ptr [eax-18]
 0051E608    call        0051E3E8
 0051E60D    pop         ecx
 0051E60E    cmp         byte ptr [ebp-4],0
>0051E612    je          0051E69A
 0051E618    mov         eax,dword ptr [ebp+8]
 0051E61B    push        eax
 0051E61C    xor         eax,eax
 0051E61E    call        0051E378
 0051E623    pop         ecx
 0051E624    mov         eax,dword ptr [ebp+8]
 0051E627    push        eax
 0051E628    mov         eax,edi
 0051E62A    call        0051E3C8
 0051E62F    pop         ecx
 0051E630    mov         edx,dword ptr [ebp+8]
 0051E633    mov         dword ptr [edx-50],eax
 0051E636    mov         eax,dword ptr [ebp+8]
 0051E639    push        eax
 0051E63A    mov         eax,dword ptr [ebp+8]
 0051E63D    mov         eax,dword ptr [eax-64]
 0051E640    push        eax
 0051E641    push        edi
 0051E642    mov         eax,dword ptr [ebp+8]
 0051E645    mov         ecx,dword ptr [eax-1C]
 0051E648    mov         eax,dword ptr [ebp+8]
 0051E64B    mov         edx,dword ptr [eax-24]
 0051E64E    mov         eax,dword ptr [ebp+8]
 0051E651    mov         eax,dword ptr [eax-18]
 0051E654    call        0051E3E8
 0051E659    pop         ecx
>0051E65A    jmp         0051E69A
 0051E65C    mov         eax,dword ptr [ebp+8]
 0051E65F    push        eax
 0051E660    movzx       eax,byte ptr [ebp-3]
 0051E664    call        0051E378
 0051E669    pop         ecx
 0051E66A    mov         eax,dword ptr [ebp+8]
 0051E66D    push        eax
 0051E66E    mov         eax,edi
 0051E670    call        0051E3C8
 0051E675    pop         ecx
 0051E676    mov         edx,dword ptr [ebp+8]
 0051E679    mov         dword ptr [edx-50],eax
 0051E67C    mov         eax,dword ptr [ebp+8]
 0051E67F    push        eax
 0051E680    push        esi
 0051E681    push        edi
 0051E682    mov         eax,dword ptr [ebp+8]
 0051E685    mov         ecx,dword ptr [eax-1C]
 0051E688    mov         eax,dword ptr [ebp+8]
 0051E68B    mov         edx,dword ptr [eax-24]
 0051E68E    mov         eax,dword ptr [ebp+8]
 0051E691    mov         eax,dword ptr [eax-18]
 0051E694    call        0051E3E8
 0051E699    pop         ecx
 0051E69A    cmp         byte ptr [ebp-1],0
>0051E69E    je          0051E7C5
 0051E6A4    mov         eax,dword ptr [ebp+8]
 0051E6A7    mov         eax,dword ptr [eax-58]
 0051E6AA    mov         edx,dword ptr [ebp+8]
 0051E6AD    cmp         eax,dword ptr [edx-70]
>0051E6B0    jge         0051E7C5
 0051E6B6    mov         eax,dword ptr [ebp+8]
 0051E6B9    cmp         byte ptr [eax-66],0
>0051E6BD    jne         0051E6CB
 0051E6BF    mov         eax,dword ptr [ebp+8]
 0051E6C2    mov         eax,dword ptr [eax-7C]
 0051E6C5    mov         edx,dword ptr [ebp+8]
 0051E6C8    mov         dword ptr [edx-2C],eax
 0051E6CB    mov         eax,dword ptr [ebp+8]
 0051E6CE    cmp         byte ptr [eax-59],0
>0051E6D2    je          0051E797
 0051E6D8    mov         eax,dword ptr [ebp+8]
 0051E6DB    push        eax
 0051E6DC    mov         eax,dword ptr [ebp+8]
 0051E6DF    mov         eax,dword ptr [eax-60]
 0051E6E2    call        0051E3C8
 0051E6E7    pop         ecx
 0051E6E8    mov         ebx,eax
 0051E6EA    mov         eax,dword ptr [ebp+8]
 0051E6ED    push        eax
 0051E6EE    mov         eax,dword ptr [ebp+8]
 0051E6F1    mov         eax,dword ptr [eax-64]
 0051E6F4    call        0051E3C8
 0051E6F9    pop         ecx
 0051E6FA    mov         esi,eax
 0051E6FC    mov         eax,dword ptr [ebp+8]
 0051E6FF    cmp         ebx,dword ptr [eax-58]
>0051E702    jle         0051E72D
 0051E704    mov         eax,dword ptr [ebp+8]
 0051E707    push        eax
 0051E708    xor         eax,eax
 0051E70A    call        0051E378
 0051E70F    pop         ecx
 0051E710    mov         eax,dword ptr [ebp+8]
 0051E713    mov         dword ptr [eax-50],ebx
 0051E716    mov         eax,dword ptr [ebp+8]
 0051E719    lea         edx,[eax-58]
 0051E71C    mov         eax,dword ptr [ebp+8]
 0051E71F    mov         eax,dword ptr [eax-80]
 0051E722    call        005104E0
 0051E727    mov         eax,dword ptr [ebp+8]
 0051E72A    mov         dword ptr [eax-58],ebx
 0051E72D    mov         eax,dword ptr [ebp+8]
 0051E730    cmp         esi,dword ptr [eax-58]
>0051E733    jle         0051E75E
 0051E735    mov         eax,dword ptr [ebp+8]
 0051E738    push        eax
 0051E739    mov         al,1
 0051E73B    call        0051E378
 0051E740    pop         ecx
 0051E741    mov         eax,dword ptr [ebp+8]
 0051E744    mov         dword ptr [eax-50],esi
 0051E747    mov         eax,dword ptr [ebp+8]
 0051E74A    lea         edx,[eax-58]
 0051E74D    mov         eax,dword ptr [ebp+8]
 0051E750    mov         eax,dword ptr [eax-80]
 0051E753    call        005104E0
 0051E758    mov         eax,dword ptr [ebp+8]
 0051E75B    mov         dword ptr [eax-58],esi
 0051E75E    mov         eax,dword ptr [ebp+8]
 0051E761    mov         eax,dword ptr [eax-58]
 0051E764    mov         edx,dword ptr [ebp+8]
 0051E767    cmp         eax,dword ptr [edx-70]
>0051E76A    jge         0051E7C5
 0051E76C    mov         eax,dword ptr [ebp+8]
 0051E76F    push        eax
 0051E770    xor         eax,eax
 0051E772    call        0051E378
 0051E777    pop         ecx
 0051E778    mov         eax,dword ptr [ebp+8]
 0051E77B    mov         eax,dword ptr [eax-70]
 0051E77E    mov         edx,dword ptr [ebp+8]
 0051E781    mov         dword ptr [edx-50],eax
 0051E784    mov         eax,dword ptr [ebp+8]
 0051E787    lea         edx,[eax-58]
 0051E78A    mov         eax,dword ptr [ebp+8]
 0051E78D    mov         eax,dword ptr [eax-80]
 0051E790    call        005104E0
>0051E795    jmp         0051E7C5
 0051E797    mov         eax,dword ptr [ebp+8]
 0051E79A    push        eax
 0051E79B    mov         eax,dword ptr [ebp+8]
 0051E79E    movzx       eax,byte ptr [eax-65]
 0051E7A2    call        0051E378
 0051E7A7    pop         ecx
 0051E7A8    mov         eax,dword ptr [ebp+8]
 0051E7AB    mov         eax,dword ptr [eax-70]
 0051E7AE    mov         edx,dword ptr [ebp+8]
 0051E7B1    mov         dword ptr [edx-50],eax
 0051E7B4    mov         eax,dword ptr [ebp+8]
 0051E7B7    lea         edx,[eax-58]
 0051E7BA    mov         eax,dword ptr [ebp+8]
 0051E7BD    mov         eax,dword ptr [eax-80]
 0051E7C0    call        005104E0
 0051E7C5    pop         edi
 0051E7C6    pop         esi
 0051E7C7    pop         ebx
 0051E7C8    pop         ecx
 0051E7C9    pop         ebp
 0051E7CA    ret
end;*}

//0051E7CC
{*function sub_0051E7CC(?:?):?;
begin
 0051E7CC    push        ebp
 0051E7CD    mov         ebp,esp
 0051E7CF    mov         eax,dword ptr [ebp+8]
 0051E7D2    cmp         byte ptr [eax-1],0
>0051E7D6    jne         0051E808
 0051E7D8    mov         eax,dword ptr [ebp+8]
 0051E7DB    mov         byte ptr [eax-1],1
 0051E7DF    mov         eax,dword ptr [ebp+8]
 0051E7E2    mov         eax,dword ptr [eax-8]
 0051E7E5    call        @UStrToPWChar
>0051E7EA    jmp         0051E7F5
 0051E7EC    cmp         dx,20
>0051E7F0    jne         0051E7FD
 0051E7F2    add         eax,2
 0051E7F5    movzx       edx,word ptr [eax]
 0051E7F8    test        dx,dx
>0051E7FB    jne         0051E7EC
 0051E7FD    cmp         word ptr [eax],0
 0051E801    mov         eax,dword ptr [ebp+8]
 0051E804    sete        byte ptr [eax-9]
 0051E808    mov         eax,dword ptr [ebp+8]
 0051E80B    movzx       eax,byte ptr [eax-9]
 0051E80F    pop         ebp
 0051E810    ret
end;*}

//0051E814
{*procedure sub_0051E814(?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?);
begin
 0051E814    push        ebp
 0051E815    mov         ebp,esp
 0051E817    add         esp,0FFFFFFEC
 0051E81A    push        ebx
 0051E81B    push        esi
 0051E81C    push        edi
 0051E81D    mov         dword ptr [ebp-14],ecx
 0051E820    mov         dword ptr [ebp-10],edx
 0051E823    mov         dword ptr [ebp-8],eax
 0051E826    mov         edi,dword ptr [ebp+14]
 0051E829    add         edi,0FFFFFFDC
 0051E82C    cmp         dword ptr [ebp+0C],1FFFFFFF
>0051E833    jne         0051E83E
 0051E835    mov         eax,dword ptr [ebp+14]
 0051E838    mov         eax,dword ptr [eax-7C]
 0051E83B    mov         dword ptr [ebp+0C],eax
 0051E83E    cmp         dword ptr [ebp+10],1FFFFFFF
>0051E845    jne         0051E858
 0051E847    mov         eax,dword ptr [ebp+14]
 0051E84A    mov         eax,dword ptr [eax-34]
 0051E84D    call        TmwCustomEdit.GetFont
 0051E852    mov         eax,dword ptr [eax+18]
 0051E855    mov         dword ptr [ebp+10],eax
 0051E858    xor         ebx,ebx
 0051E85A    mov         byte ptr [ebp-1],0
 0051E85E    cmp         dword ptr [edi],0
>0051E861    jle         0051E8B6
 0051E863    movzx       eax,byte ptr [ebp+8]
 0051E867    cmp         al,byte ptr [edi+18]
>0051E86A    je          0051E877
 0051E86C    push        ebp
 0051E86D    call        0051E7CC
 0051E872    pop         ecx
 0051E873    test        al,al
>0051E875    je          0051E8A6
 0051E877    mov         eax,dword ptr [ebp+14]
 0051E87A    cmp         byte ptr [eax-66],0
>0051E87E    jne         0051E8A4
 0051E880    mov         eax,dword ptr [ebp+14]
 0051E883    cmp         byte ptr [eax-65],0
>0051E887    jne         0051E8A4
 0051E889    mov         eax,dword ptr [edi+14]
 0051E88C    cmp         eax,dword ptr [ebp+0C]
>0051E88F    jne         0051E8A6
 0051E891    mov         eax,dword ptr [edi+10]
 0051E894    cmp         eax,dword ptr [ebp+10]
>0051E897    je          0051E8A4
 0051E899    push        ebp
 0051E89A    call        0051E7CC
 0051E89F    pop         ecx
 0051E8A0    test        al,al
>0051E8A2    je          0051E8A6
 0051E8A4    mov         bl,1
 0051E8A6    test        bl,bl
>0051E8A8    jne         0051E8B6
 0051E8AA    mov         eax,dword ptr [ebp+14]
 0051E8AD    push        eax
 0051E8AE    xor         eax,eax
 0051E8B0    call        0051E480
 0051E8B5    pop         ecx
 0051E8B6    test        bl,bl
>0051E8B8    je          0051E904
 0051E8BA    mov         eax,dword ptr [edi]
 0051E8BC    add         eax,dword ptr [ebp-14]
 0051E8BF    cmp         eax,dword ptr [edi+4]
>0051E8C2    jle         0051E8D4
 0051E8C4    mov         edx,eax
 0051E8C6    add         edx,20
 0051E8C9    mov         dword ptr [edi+4],edx
 0051E8CC    lea         eax,[edi+0C]
 0051E8CF    call        @UStrSetLength
 0051E8D4    mov         esi,dword ptr [ebp-14]
 0051E8D7    test        esi,esi
>0051E8D9    jle         0051E8FD
 0051E8DB    mov         ebx,1
 0051E8E0    lea         eax,[edi+0C]
 0051E8E3    call        @UniqueStringU
 0051E8E8    mov         edx,dword ptr [edi]
 0051E8EA    add         edx,ebx
 0051E8EC    mov         ecx,dword ptr [ebp-8]
 0051E8EF    movzx       ecx,word ptr [ecx+ebx*2-2]
 0051E8F4    mov         word ptr [eax+edx*2-2],cx
 0051E8F9    inc         ebx
 0051E8FA    dec         esi
>0051E8FB    jne         0051E8E0
 0051E8FD    mov         eax,dword ptr [ebp-14]
 0051E900    add         dword ptr [edi],eax
>0051E902    jmp         0051E95C
 0051E904    mov         eax,dword ptr [ebp-14]
 0051E907    mov         dword ptr [edi],eax
 0051E909    cmp         eax,dword ptr [edi+4]
>0051E90C    jle         0051E91E
 0051E90E    mov         edx,eax
 0051E910    add         edx,20
 0051E913    mov         dword ptr [edi+4],edx
 0051E916    lea         eax,[edi+0C]
 0051E919    call        @UStrSetLength
 0051E91E    mov         esi,dword ptr [ebp-14]
 0051E921    test        esi,esi
>0051E923    jle         0051E943
 0051E925    mov         ebx,1
 0051E92A    lea         eax,[edi+0C]
 0051E92D    call        @UniqueStringU
 0051E932    mov         edx,dword ptr [ebp-8]
 0051E935    movzx       edx,word ptr [edx+ebx*2-2]
 0051E93A    mov         word ptr [eax+ebx*2-2],dx
 0051E93F    inc         ebx
 0051E940    dec         esi
>0051E941    jne         0051E92A
 0051E943    mov         eax,dword ptr [ebp-10]
 0051E946    mov         dword ptr [edi+8],eax
 0051E949    mov         eax,dword ptr [ebp+10]
 0051E94C    mov         dword ptr [edi+10],eax
 0051E94F    mov         eax,dword ptr [ebp+0C]
 0051E952    mov         dword ptr [edi+14],eax
 0051E955    movzx       eax,byte ptr [ebp+8]
 0051E959    mov         byte ptr [edi+18],al
 0051E95C    pop         edi
 0051E95D    pop         esi
 0051E95E    pop         ebx
 0051E95F    mov         esp,ebp
 0051E961    pop         ebp
 0051E962    ret         0C
end;*}

//0051E968
{*procedure sub_0051E968(?:?);
begin
 0051E968    push        ebp
 0051E969    mov         ebp,esp
 0051E96B    add         esp,0FFFFFFD8
 0051E96E    push        ebx
 0051E96F    push        esi
 0051E970    push        edi
 0051E971    xor         eax,eax
 0051E973    mov         dword ptr [ebp-28],eax
 0051E976    mov         dword ptr [ebp-4],eax
 0051E979    mov         dword ptr [ebp-8],eax
 0051E97C    mov         ebx,dword ptr [ebp+8]
 0051E97F    add         ebx,0FFFFFFCC
 0051E982    xor         eax,eax
 0051E984    push        ebp
 0051E985    push        51EF72
 0051E98A    push        dword ptr fs:[eax]
 0051E98D    mov         dword ptr fs:[eax],esp
 0051E990    mov         eax,dword ptr [ebp+8]
 0051E993    mov         edx,dword ptr [ebp+8]
 0051E996    lea         esi,[eax-90]
 0051E99C    lea         edi,[edx-78]
 0051E99F    movs        dword ptr [edi],dword ptr [esi]
 0051E9A0    movs        dword ptr [edi],dword ptr [esi]
 0051E9A1    movs        dword ptr [edi],dword ptr [esi]
 0051E9A2    movs        dword ptr [edi],dword ptr [esi]
 0051E9A3    mov         eax,dword ptr [ebx]
 0051E9A5    call        0051CBB4
 0051E9AA    mov         edx,dword ptr [ebp+8]
 0051E9AD    mov         edx,dword ptr [edx-40]
 0051E9B0    sub         edx,eax
 0051E9B2    mov         eax,dword ptr [ebx]
 0051E9B4    imul        edx,dword ptr [eax+2C8]
 0051E9BB    mov         eax,dword ptr [ebp+8]
 0051E9BE    mov         dword ptr [eax-6C],edx
 0051E9C1    mov         eax,dword ptr [ebx]
 0051E9C3    cmp         dword ptr [eax+2D4],0
>0051E9CA    je          0051E9F6
 0051E9CC    mov         eax,dword ptr [ebx]
 0051E9CE    mov         edx,dword ptr [eax+290]
 0051E9D4    mov         eax,80
 0051E9D9    call        00510484
 0051E9DE    mov         esi,eax
 0051E9E0    mov         eax,dword ptr [ebp+8]
 0051E9E3    mov         dword ptr [eax-20],esi
 0051E9E6    mov         eax,dword ptr [ebp+8]
 0051E9E9    mov         edx,esi
 0051E9EB    mov         eax,dword ptr [ebp+8]
 0051E9EE    add         eax,0FFFFFFE8
 0051E9F1    call        @UStrSetLength
 0051E9F6    mov         eax,dword ptr [ebx]
 0051E9F8    mov         eax,dword ptr [eax+3A8]
 0051E9FE    call        0051074C
 0051EA03    mov         dword ptr [ebp-10],eax
 0051EA06    mov         eax,dword ptr [ebp+8]
 0051EA09    mov         eax,dword ptr [eax-40]
 0051EA0C    mov         edx,dword ptr [ebp+8]
 0051EA0F    mov         edx,dword ptr [edx+10]
 0051EA12    sub         edx,eax
>0051EA14    jl          0051EF4F
 0051EA1A    inc         edx
 0051EA1B    mov         dword ptr [ebp-1C],edx
 0051EA1E    mov         dword ptr [ebp-0C],eax
 0051EA21    lea         ecx,[ebp-28]
 0051EA24    mov         edx,dword ptr [ebp-0C]
 0051EA27    dec         edx
 0051EA28    mov         eax,dword ptr [ebx]
 0051EA2A    mov         eax,dword ptr [eax+2A4]
 0051EA30    mov         esi,dword ptr [eax]
 0051EA32    call        dword ptr [esi+0C]
 0051EA35    mov         eax,dword ptr [ebp-28]
 0051EA38    lea         ecx,[ebp-4]
 0051EA3B    mov         edx,dword ptr [ebx]
 0051EA3D    mov         edx,dword ptr [edx+3A8]
 0051EA43    call        dword ptr [ebp-10]
 0051EA46    mov         eax,dword ptr [ebp+8]
 0051EA49    mov         byte ptr [eax-59],0
 0051EA4D    mov         eax,dword ptr [ebp+8]
 0051EA50    xor         edx,edx
 0051EA52    mov         dword ptr [eax-60],edx
 0051EA55    mov         eax,dword ptr [ebp+8]
 0051EA58    xor         edx,edx
 0051EA5A    mov         dword ptr [eax-64],edx
 0051EA5D    mov         eax,dword ptr [ebp+8]
 0051EA60    cmp         byte ptr [eax-2D],0
>0051EA64    je          0051EB65
 0051EA6A    mov         eax,dword ptr [ebp+8]
 0051EA6D    mov         eax,dword ptr [eax-38]
 0051EA70    cmp         eax,dword ptr [ebp-0C]
>0051EA73    jg          0051EB65
 0051EA79    mov         eax,dword ptr [ebp+8]
 0051EA7C    mov         eax,dword ptr [eax-3C]
 0051EA7F    cmp         eax,dword ptr [ebp-0C]
>0051EA82    jl          0051EB65
 0051EA88    mov         eax,dword ptr [ebp+8]
 0051EA8B    mov         eax,dword ptr [eax+0C]
 0051EA8E    mov         edx,dword ptr [ebp+8]
 0051EA91    mov         dword ptr [edx-60],eax
 0051EA94    mov         eax,dword ptr [ebp+8]
 0051EA97    mov         eax,dword ptr [eax+8]
 0051EA9A    inc         eax
 0051EA9B    mov         edx,dword ptr [ebp+8]
 0051EA9E    mov         dword ptr [edx-64],eax
 0051EAA1    mov         eax,dword ptr [ebx]
 0051EAA3    cmp         byte ptr [eax+390],1
>0051EAAA    je          0051EAC2
 0051EAAC    mov         eax,dword ptr [ebx]
 0051EAAE    cmp         byte ptr [eax+390],0
>0051EAB5    jne         0051EB03
 0051EAB7    mov         eax,dword ptr [ebp+8]
 0051EABA    mov         eax,dword ptr [eax-38]
 0051EABD    cmp         eax,dword ptr [ebp-0C]
>0051EAC0    jne         0051EB03
 0051EAC2    mov         eax,dword ptr [ebp+8]
 0051EAC5    mov         eax,dword ptr [eax-4]
 0051EAC8    mov         edx,dword ptr [ebp+8]
 0051EACB    cmp         eax,dword ptr [edx+8]
>0051EACE    jle         0051EAE2
 0051EAD0    mov         eax,dword ptr [ebp+8]
 0051EAD3    xor         edx,edx
 0051EAD5    mov         dword ptr [eax-60],edx
 0051EAD8    mov         eax,dword ptr [ebp+8]
 0051EADB    xor         edx,edx
 0051EADD    mov         dword ptr [eax-64],edx
>0051EAE0    jmp         0051EB03
 0051EAE2    mov         eax,dword ptr [ebp+8]
 0051EAE5    mov         eax,dword ptr [eax-4]
 0051EAE8    mov         edx,dword ptr [ebp+8]
 0051EAEB    cmp         eax,dword ptr [edx+0C]
>0051EAEE    jle         0051EB03
 0051EAF0    mov         eax,dword ptr [ebp+8]
 0051EAF3    mov         eax,dword ptr [eax-4]
 0051EAF6    mov         edx,dword ptr [ebp+8]
 0051EAF9    mov         dword ptr [edx-60],eax
 0051EAFC    mov         eax,dword ptr [ebp+8]
 0051EAFF    mov         byte ptr [eax-59],1
 0051EB03    mov         eax,dword ptr [ebx]
 0051EB05    cmp         byte ptr [eax+390],1
>0051EB0C    je          0051EB24
 0051EB0E    mov         eax,dword ptr [ebx]
 0051EB10    cmp         byte ptr [eax+390],0
>0051EB17    jne         0051EB65
 0051EB19    mov         eax,dword ptr [ebp+8]
 0051EB1C    mov         eax,dword ptr [eax-3C]
 0051EB1F    cmp         eax,dword ptr [ebp-0C]
>0051EB22    jne         0051EB65
 0051EB24    mov         eax,dword ptr [ebp+8]
 0051EB27    mov         eax,dword ptr [eax-8]
 0051EB2A    mov         edx,dword ptr [ebp+8]
 0051EB2D    cmp         eax,dword ptr [edx+0C]
>0051EB30    jge         0051EB44
 0051EB32    mov         eax,dword ptr [ebp+8]
 0051EB35    xor         edx,edx
 0051EB37    mov         dword ptr [eax-60],edx
 0051EB3A    mov         eax,dword ptr [ebp+8]
 0051EB3D    xor         edx,edx
 0051EB3F    mov         dword ptr [eax-64],edx
>0051EB42    jmp         0051EB65
 0051EB44    mov         eax,dword ptr [ebp+8]
 0051EB47    mov         eax,dword ptr [eax-8]
 0051EB4A    mov         edx,dword ptr [ebp+8]
 0051EB4D    cmp         eax,dword ptr [edx+8]
>0051EB50    jge         0051EB65
 0051EB52    mov         eax,dword ptr [ebp+8]
 0051EB55    mov         eax,dword ptr [eax-8]
 0051EB58    mov         edx,dword ptr [ebp+8]
 0051EB5B    mov         dword ptr [edx-64],eax
 0051EB5E    mov         eax,dword ptr [ebp+8]
 0051EB61    mov         byte ptr [eax-59],1
 0051EB65    mov         eax,dword ptr [ebp+8]
 0051EB68    mov         eax,dword ptr [eax-6C]
 0051EB6B    mov         edx,dword ptr [ebp+8]
 0051EB6E    mov         dword ptr [edx-74],eax
 0051EB71    mov         eax,dword ptr [ebx]
 0051EB73    mov         eax,dword ptr [eax+2C8]
 0051EB79    mov         edx,dword ptr [ebp+8]
 0051EB7C    add         dword ptr [edx-6C],eax
 0051EB7F    mov         eax,dword ptr [ebx]
 0051EB81    call        TmwCustomEdit.GetFont
 0051EB86    mov         eax,dword ptr [eax+18]
 0051EB89    mov         edx,dword ptr [ebp+8]
 0051EB8C    mov         dword ptr [edx-28],eax
 0051EB8F    mov         eax,dword ptr [ebp+8]
 0051EB92    mov         eax,dword ptr [eax-7C]
 0051EB95    mov         edx,dword ptr [ebp+8]
 0051EB98    mov         dword ptr [edx-2C],eax
 0051EB9B    mov         eax,dword ptr [ebp+8]
 0051EB9E    add         eax,0FFFFFFD4
 0051EBA1    push        eax
 0051EBA2    mov         eax,dword ptr [ebp+8]
 0051EBA5    lea         ecx,[eax-28]
 0051EBA8    mov         eax,dword ptr [ebx]
 0051EBAA    mov         edx,dword ptr [ebp-0C]
 0051EBAD    mov         esi,dword ptr [eax]
 0051EBAF    call        dword ptr [esi+118]
 0051EBB5    mov         edx,dword ptr [ebp+8]
 0051EBB8    mov         byte ptr [edx-66],al
 0051EBBB    mov         eax,dword ptr [ebp+8]
 0051EBBE    cmp         byte ptr [eax-66],0
>0051EBC2    je          0051EBDE
 0051EBC4    mov         eax,dword ptr [ebp+8]
 0051EBC7    mov         eax,dword ptr [eax-2C]
 0051EBCA    mov         edx,dword ptr [ebp+8]
 0051EBCD    mov         dword ptr [edx-48],eax
 0051EBD0    mov         eax,dword ptr [ebp+8]
 0051EBD3    mov         eax,dword ptr [eax-28]
 0051EBD6    mov         edx,dword ptr [ebp+8]
 0051EBD9    mov         dword ptr [edx-44],eax
>0051EBDC    jmp         0051EC00
 0051EBDE    mov         eax,dword ptr [ebx]
 0051EBE0    mov         eax,dword ptr [eax+2D8]
 0051EBE6    mov         eax,dword ptr [eax+8]
 0051EBE9    mov         edx,dword ptr [ebp+8]
 0051EBEC    mov         dword ptr [edx-48],eax
 0051EBEF    mov         eax,dword ptr [ebx]
 0051EBF1    mov         eax,dword ptr [eax+2D8]
 0051EBF7    mov         eax,dword ptr [eax+4]
 0051EBFA    mov         edx,dword ptr [ebp+8]
 0051EBFD    mov         dword ptr [edx-44],eax
 0051EC00    mov         eax,dword ptr [ebp+8]
 0051EC03    cmp         byte ptr [eax-59],0
>0051EC07    jne         0051EC12
 0051EC09    mov         eax,dword ptr [ebp+8]
 0051EC0C    cmp         dword ptr [eax-60],0
>0051EC10    jg          0051EC16
 0051EC12    xor         eax,eax
>0051EC14    jmp         0051EC18
 0051EC16    mov         al,1
 0051EC18    mov         edx,dword ptr [ebp+8]
 0051EC1B    mov         byte ptr [edx-65],al
 0051EC1E    mov         eax,dword ptr [ebp+8]
 0051EC21    mov         edx,dword ptr [ebp+8]
 0051EC24    lea         esi,[eax-78]
 0051EC27    lea         edi,[edx-58]
 0051EC2A    movs        dword ptr [edi],dword ptr [esi]
 0051EC2B    movs        dword ptr [edi],dword ptr [esi]
 0051EC2C    movs        dword ptr [edi],dword ptr [esi]
 0051EC2D    movs        dword ptr [edi],dword ptr [esi]
 0051EC2E    mov         eax,dword ptr [ebx]
 0051EC30    mov         edi,dword ptr [eax+2D4]
 0051EC36    test        edi,edi
>0051EC38    jne         0051EDDA
 0051EC3E    mov         eax,dword ptr [ebp-4]
 0051EC41    test        eax,eax
>0051EC43    je          0051EC4A
 0051EC45    sub         eax,4
 0051EC48    mov         eax,dword ptr [eax]
 0051EC4A    mov         edi,eax
 0051EC4C    mov         eax,dword ptr [ebp+8]
 0051EC4F    cmp         byte ptr [eax-59],0
>0051EC53    je          0051EDA5
 0051EC59    mov         eax,dword ptr [ebp+8]
 0051EC5C    push        eax
 0051EC5D    xor         eax,eax
 0051EC5F    call        0051E378
 0051EC64    pop         ecx
 0051EC65    mov         eax,dword ptr [ebp+8]
 0051EC68    push        eax
 0051EC69    mov         eax,dword ptr [ebp+8]
 0051EC6C    mov         eax,dword ptr [eax+0C]
 0051EC6F    call        0051E3C8
 0051EC74    pop         ecx
 0051EC75    mov         edx,eax
 0051EC77    mov         eax,dword ptr [ebp+8]
 0051EC7A    mov         eax,dword ptr [eax-78]
 0051EC7D    call        00510484
 0051EC82    mov         edx,dword ptr [ebp+8]
 0051EC85    mov         dword ptr [edx-58],eax
 0051EC88    mov         eax,dword ptr [ebp+8]
 0051EC8B    push        eax
 0051EC8C    mov         eax,dword ptr [ebp+8]
 0051EC8F    mov         eax,dword ptr [eax-60]
 0051EC92    call        0051E3C8
 0051EC97    pop         ecx
 0051EC98    mov         edx,eax
 0051EC9A    mov         eax,dword ptr [ebp+8]
 0051EC9D    mov         eax,dword ptr [eax-70]
 0051ECA0    call        0051048C
 0051ECA5    mov         edx,dword ptr [ebp+8]
 0051ECA8    mov         dword ptr [edx-50],eax
 0051ECAB    mov         eax,dword ptr [ebp+8]
 0051ECAE    push        eax
 0051ECAF    mov         eax,dword ptr [ebp+8]
 0051ECB2    mov         eax,dword ptr [eax+0C]
 0051ECB5    push        eax
 0051ECB6    mov         eax,dword ptr [ebp+8]
 0051ECB9    mov         eax,dword ptr [eax-60]
 0051ECBC    push        eax
 0051ECBD    xor         ecx,ecx
 0051ECBF    mov         edx,edi
 0051ECC1    mov         eax,dword ptr [ebp-4]
 0051ECC4    call        0051E3E8
 0051ECC9    pop         ecx
 0051ECCA    mov         eax,dword ptr [ebp+8]
 0051ECCD    push        eax
 0051ECCE    mov         eax,dword ptr [ebp+8]
 0051ECD1    mov         eax,dword ptr [eax-64]
 0051ECD4    call        0051E3C8
 0051ECD9    pop         ecx
 0051ECDA    mov         edx,eax
 0051ECDC    mov         eax,dword ptr [ebp+8]
 0051ECDF    mov         eax,dword ptr [eax-78]
 0051ECE2    call        00510484
 0051ECE7    mov         edx,dword ptr [ebp+8]
 0051ECEA    mov         dword ptr [edx-58],eax
 0051ECED    mov         eax,dword ptr [ebp+8]
 0051ECF0    push        eax
 0051ECF1    mov         eax,dword ptr [ebp+8]
 0051ECF4    mov         eax,dword ptr [eax+8]
 0051ECF7    call        0051E3C8
 0051ECFC    pop         ecx
 0051ECFD    mov         edx,eax
 0051ECFF    mov         eax,dword ptr [ebp+8]
 0051ED02    mov         eax,dword ptr [eax-70]
 0051ED05    call        0051048C
 0051ED0A    mov         edx,dword ptr [ebp+8]
 0051ED0D    mov         dword ptr [edx-50],eax
 0051ED10    mov         eax,dword ptr [ebp+8]
 0051ED13    push        eax
 0051ED14    mov         eax,dword ptr [ebp+8]
 0051ED17    mov         eax,dword ptr [eax-64]
 0051ED1A    push        eax
 0051ED1B    mov         eax,dword ptr [ebp+8]
 0051ED1E    mov         eax,dword ptr [eax+8]
 0051ED21    push        eax
 0051ED22    xor         ecx,ecx
 0051ED24    mov         edx,edi
 0051ED26    mov         eax,dword ptr [ebp-4]
 0051ED29    call        0051E3E8
 0051ED2E    pop         ecx
 0051ED2F    mov         eax,dword ptr [ebp+8]
 0051ED32    push        eax
 0051ED33    mov         al,1
 0051ED35    call        0051E378
 0051ED3A    pop         ecx
 0051ED3B    mov         eax,dword ptr [ebp+8]
 0051ED3E    push        eax
 0051ED3F    mov         eax,dword ptr [ebp+8]
 0051ED42    mov         eax,dword ptr [eax-60]
 0051ED45    call        0051E3C8
 0051ED4A    pop         ecx
 0051ED4B    mov         edx,eax
 0051ED4D    mov         eax,dword ptr [ebp+8]
 0051ED50    mov         eax,dword ptr [eax-78]
 0051ED53    call        00510484
 0051ED58    mov         edx,dword ptr [ebp+8]
 0051ED5B    mov         dword ptr [edx-58],eax
 0051ED5E    mov         eax,dword ptr [ebp+8]
 0051ED61    push        eax
 0051ED62    mov         eax,dword ptr [ebp+8]
 0051ED65    mov         eax,dword ptr [eax-64]
 0051ED68    call        0051E3C8
 0051ED6D    pop         ecx
 0051ED6E    mov         edx,eax
 0051ED70    mov         eax,dword ptr [ebp+8]
 0051ED73    mov         eax,dword ptr [eax-70]
 0051ED76    call        0051048C
 0051ED7B    mov         edx,dword ptr [ebp+8]
 0051ED7E    mov         dword ptr [edx-50],eax
 0051ED81    mov         eax,dword ptr [ebp+8]
 0051ED84    push        eax
 0051ED85    mov         eax,dword ptr [ebp+8]
 0051ED88    mov         eax,dword ptr [eax-60]
 0051ED8B    push        eax
 0051ED8C    mov         eax,dword ptr [ebp+8]
 0051ED8F    mov         eax,dword ptr [eax-64]
 0051ED92    push        eax
 0051ED93    xor         ecx,ecx
 0051ED95    mov         edx,edi
 0051ED97    mov         eax,dword ptr [ebp-4]
 0051ED9A    call        0051E3E8
 0051ED9F    pop         ecx
>0051EDA0    jmp         0051EEFA
 0051EDA5    mov         eax,dword ptr [ebp+8]
 0051EDA8    push        eax
 0051EDA9    mov         eax,dword ptr [ebp+8]
 0051EDAC    movzx       eax,byte ptr [eax-65]
 0051EDB0    call        0051E378
 0051EDB5    pop         ecx
 0051EDB6    mov         eax,dword ptr [ebp+8]
 0051EDB9    push        eax
 0051EDBA    mov         eax,dword ptr [ebp+8]
 0051EDBD    mov         eax,dword ptr [eax+0C]
 0051EDC0    push        eax
 0051EDC1    mov         eax,dword ptr [ebp+8]
 0051EDC4    mov         eax,dword ptr [eax+8]
 0051EDC7    push        eax
 0051EDC8    xor         ecx,ecx
 0051EDCA    mov         edx,edi
 0051EDCC    mov         eax,dword ptr [ebp-4]
 0051EDCF    call        0051E3E8
 0051EDD4    pop         ecx
>0051EDD5    jmp         0051EEFA
 0051EDDA    mov         esi,dword ptr [ebp-0C]
 0051EDDD    dec         esi
 0051EDDE    mov         edx,esi
 0051EDE0    mov         eax,dword ptr [ebx]
 0051EDE2    mov         eax,dword ptr [eax+2A4]
 0051EDE8    mov         ecx,dword ptr [eax]
 0051EDEA    call        dword ptr [ecx+18]
 0051EDED    mov         edx,eax
 0051EDEF    mov         eax,edi
 0051EDF1    mov         ecx,dword ptr [eax]
 0051EDF3    call        dword ptr [ecx+7C]
 0051EDF6    mov         ecx,esi
 0051EDF8    mov         eax,dword ptr [ebx]
 0051EDFA    mov         eax,dword ptr [eax+2D4]
 0051EE00    mov         edx,dword ptr [ebp-4]
 0051EE03    mov         esi,dword ptr [eax]
 0051EE05    call        dword ptr [esi+74]
 0051EE08    mov         eax,dword ptr [ebp+8]
 0051EE0B    xor         edx,edx
 0051EE0D    mov         dword ptr [eax-24],edx
>0051EE10    jmp         0051EED9
 0051EE15    mov         eax,dword ptr [ebx]
 0051EE17    mov         eax,dword ptr [eax+2D4]
 0051EE1D    mov         edx,dword ptr [eax]
 0051EE1F    call        dword ptr [edx+6C]
 0051EE22    mov         dword ptr [ebp-14],eax
 0051EE25    lea         edx,[ebp-8]
 0051EE28    mov         eax,dword ptr [ebx]
 0051EE2A    mov         eax,dword ptr [eax+2D4]
 0051EE30    mov         ecx,dword ptr [eax]
 0051EE32    call        dword ptr [ecx+60]
 0051EE35    mov         esi,dword ptr [ebp-8]
 0051EE38    test        esi,esi
>0051EE3A    je          0051EE41
 0051EE3C    sub         esi,4
 0051EE3F    mov         esi,dword ptr [esi]
 0051EE41    mov         edi,esi
 0051EE43    mov         eax,dword ptr [ebp-14]
 0051EE46    add         eax,edi
 0051EE48    mov         edx,dword ptr [ebp+8]
 0051EE4B    cmp         eax,dword ptr [edx+0C]
>0051EE4E    jl          0051EECC
 0051EE50    mov         eax,dword ptr [ebx]
 0051EE52    mov         eax,dword ptr [eax+2D4]
 0051EE58    mov         edx,dword ptr [eax]
 0051EE5A    call        dword ptr [edx+64]
 0051EE5D    mov         dword ptr [ebp-18],eax
 0051EE60    cmp         dword ptr [ebp-18],0
>0051EE64    je          0051EE90
 0051EE66    mov         eax,dword ptr [ebp+8]
 0051EE69    push        eax
 0051EE6A    mov         eax,dword ptr [ebp-18]
 0051EE6D    mov         eax,dword ptr [eax+8]
 0051EE70    push        eax
 0051EE71    mov         eax,dword ptr [ebp-18]
 0051EE74    mov         eax,dword ptr [eax+4]
 0051EE77    push        eax
 0051EE78    mov         eax,dword ptr [ebp-18]
 0051EE7B    movzx       eax,byte ptr [eax+0C]
 0051EE7F    push        eax
 0051EE80    mov         ecx,edi
 0051EE82    mov         edx,dword ptr [ebp-14]
 0051EE85    mov         eax,dword ptr [ebp-8]
 0051EE88    call        0051E814
 0051EE8D    pop         ecx
>0051EE8E    jmp         0051EECC
 0051EE90    mov         eax,dword ptr [ebx]
 0051EE92    call        TmwCustomEdit.GetFont
 0051EE97    mov         dword ptr [ebp-20],eax
 0051EE9A    mov         eax,dword ptr [ebp-20]
 0051EE9D    mov         eax,dword ptr [eax+10]
 0051EEA0    movzx       eax,byte ptr [eax+21]
 0051EEA4    mov         byte ptr [ebp-21],al
 0051EEA7    mov         eax,dword ptr [ebp+8]
 0051EEAA    push        eax
 0051EEAB    mov         eax,dword ptr [ebp+8]
 0051EEAE    mov         eax,dword ptr [eax-28]
 0051EEB1    push        eax
 0051EEB2    mov         eax,dword ptr [ebp+8]
 0051EEB5    mov         eax,dword ptr [eax-2C]
 0051EEB8    push        eax
 0051EEB9    movzx       eax,byte ptr [ebp-21]
 0051EEBD    push        eax
 0051EEBE    mov         ecx,edi
 0051EEC0    mov         edx,dword ptr [ebp-14]
 0051EEC3    mov         eax,dword ptr [ebp-8]
 0051EEC6    call        0051E814
 0051EECB    pop         ecx
 0051EECC    mov         eax,dword ptr [ebx]
 0051EECE    mov         eax,dword ptr [eax+2D4]
 0051EED4    mov         edx,dword ptr [eax]
 0051EED6    call        dword ptr [edx+70]
 0051EED9    mov         eax,dword ptr [ebx]
 0051EEDB    mov         eax,dword ptr [eax+2D4]
 0051EEE1    mov         edx,dword ptr [eax]
 0051EEE3    call        dword ptr [edx+58]
 0051EEE6    test        al,al
>0051EEE8    je          0051EE15
 0051EEEE    mov         eax,dword ptr [ebp+8]
 0051EEF1    push        eax
 0051EEF2    mov         al,1
 0051EEF4    call        0051E480
 0051EEF9    pop         ecx
 0051EEFA    mov         eax,dword ptr [ebp+8]
 0051EEFD    cmp         byte ptr [eax-91],0
>0051EF04    je          0051EF43
 0051EF06    push        0
 0051EF08    mov         eax,dword ptr [ebp+8]
 0051EF0B    mov         eax,dword ptr [eax-74]
 0051EF0E    push        eax
 0051EF0F    mov         eax,dword ptr [ebp+8]
 0051EF12    mov         eax,dword ptr [eax-98]
 0051EF18    push        eax
 0051EF19    mov         eax,dword ptr [ebp+8]
 0051EF1C    mov         eax,dword ptr [eax-80]
 0051EF1F    push        eax
 0051EF20    call        gdi32.MoveToEx
 0051EF25    mov         eax,dword ptr [ebp+8]
 0051EF28    mov         eax,dword ptr [eax-6C]
 0051EF2B    inc         eax
 0051EF2C    push        eax
 0051EF2D    mov         eax,dword ptr [ebp+8]
 0051EF30    mov         eax,dword ptr [eax-98]
 0051EF36    push        eax
 0051EF37    mov         eax,dword ptr [ebp+8]
 0051EF3A    mov         eax,dword ptr [eax-80]
 0051EF3D    push        eax
 0051EF3E    call        gdi32.LineTo
 0051EF43    inc         dword ptr [ebp-0C]
 0051EF46    dec         dword ptr [ebp-1C]
>0051EF49    jne         0051EA21
 0051EF4F    xor         eax,eax
 0051EF51    pop         edx
 0051EF52    pop         ecx
 0051EF53    pop         ecx
 0051EF54    mov         dword ptr fs:[eax],edx
 0051EF57    push        51EF79
 0051EF5C    lea         eax,[ebp-28]
 0051EF5F    call        @UStrClr
 0051EF64    lea         eax,[ebp-8]
 0051EF67    mov         edx,2
 0051EF6C    call        @UStrArrayClr
 0051EF71    ret
>0051EF72    jmp         @HandleFinally
>0051EF77    jmp         0051EF5C
 0051EF79    pop         edi
 0051EF7A    pop         esi
 0051EF7B    pop         ebx
 0051EF7C    mov         esp,ebp
 0051EF7E    pop         ebp
 0051EF7F    ret
end;*}

//0051EF80
{*procedure sub_0051EF80(?:?; ?:?; ?:?);
begin
 0051EF80    push        ebp
 0051EF81    mov         ebp,esp
 0051EF83    add         esp,0FFFFFF68
 0051EF89    push        ebx
 0051EF8A    push        esi
 0051EF8B    push        edi
 0051EF8C    mov         esi,edx
 0051EF8E    lea         edi,[ebp-90]
 0051EF94    movs        dword ptr [edi],dword ptr [esi]
 0051EF95    movs        dword ptr [edi],dword ptr [esi]
 0051EF96    movs        dword ptr [edi],dword ptr [esi]
 0051EF97    movs        dword ptr [edi],dword ptr [esi]
 0051EF98    mov         dword ptr [ebp-40],ecx
 0051EF9B    mov         dword ptr [ebp-34],eax
 0051EF9E    lea         eax,[ebp-24]
 0051EFA1    mov         edx,dword ptr ds:[51E104];:TmwCustomEdit.:1
 0051EFA7    call        @InitializeRecord
 0051EFAC    xor         eax,eax
 0051EFAE    push        ebp
 0051EFAF    push        51F20C
 0051EFB4    push        dword ptr fs:[eax]
 0051EFB7    mov         dword ptr fs:[eax],esp
 0051EFBA    mov         eax,dword ptr [ebp-34]
 0051EFBD    mov         eax,dword ptr [eax+6C];TmwCustomEdit.FColor:TColor
 0051EFC0    mov         dword ptr [ebp-7C],eax
 0051EFC3    mov         eax,dword ptr [ebp-34]
 0051EFC6    mov         ebx,dword ptr [eax+2D4];TmwCustomEdit.fHighLighter:TmwCustomHighLighter
 0051EFCC    test        ebx,ebx
>0051EFCE    je          0051F002
 0051EFD0    mov         eax,ebx
 0051EFD2    xor         edx,edx
 0051EFD4    mov         ecx,dword ptr [eax]
 0051EFD6    call        dword ptr [ecx+40];TmwCustomHighLighter.GetDefaultAttribute
 0051EFD9    test        eax,eax
>0051EFDB    je          0051F002
 0051EFDD    mov         eax,dword ptr [ebp-34]
 0051EFE0    mov         eax,dword ptr [eax+2D4];TmwCustomEdit.fHighLighter:TmwCustomHighLighter
 0051EFE6    xor         edx,edx
 0051EFE8    mov         ecx,dword ptr [eax]
 0051EFEA    call        dword ptr [ecx+40];TmwCustomHighLighter.GetDefaultAttribute
 0051EFED    mov         eax,dword ptr [eax+4]
 0051EFF0    mov         dword ptr [ebp-2C],eax
 0051EFF3    cmp         dword ptr [ebp-2C],1FFFFFFF
>0051EFFA    je          0051F002
 0051EFFC    mov         eax,dword ptr [ebp-2C]
 0051EFFF    mov         dword ptr [ebp-7C],eax
 0051F002    mov         byte ptr [ebp-91],0
 0051F009    mov         eax,dword ptr [ebp-34]
 0051F00C    mov         eax,dword ptr [eax+2BC];TmwCustomEdit.fRightEdge:Integer
 0051F012    test        eax,eax
>0051F014    jle         0051F081
 0051F016    mov         edx,dword ptr [ebp-34]
 0051F019    imul        dword ptr [edx+294];TmwCustomEdit.fCharWidth:Integer
 0051F01F    mov         edx,dword ptr [ebp-34]
 0051F022    add         eax,dword ptr [edx+2CC];TmwCustomEdit.fTextOffset:Integer
 0051F028    mov         dword ptr [ebp-98],eax
 0051F02E    mov         eax,dword ptr [ebp-98]
 0051F034    cmp         eax,dword ptr [ebp-90]
>0051F03A    jl          0051F081
 0051F03C    mov         eax,dword ptr [ebp-98]
 0051F042    cmp         eax,dword ptr [ebp-88]
>0051F048    jg          0051F081
 0051F04A    mov         byte ptr [ebp-91],1
 0051F051    mov         eax,dword ptr [ebp-34]
 0051F054    mov         edx,dword ptr [eax+2C0];TmwCustomEdit.fRightEdgeColor:TColor
 0051F05A    mov         eax,dword ptr [ebp-34]
 0051F05D    mov         eax,dword ptr [eax+270];TmwCustomEdit.......................FCanvas:TCanvas
 0051F063    mov         eax,dword ptr [eax+44];TCanvas.FPen:TPen
 0051F066    call        TPen.SetColor
 0051F06B    mov         eax,dword ptr [ebp-34]
 0051F06E    mov         eax,dword ptr [eax+270];TmwCustomEdit........................FCanvas:TCanvas
 0051F074    mov         eax,dword ptr [eax+44];TCanvas.FPen:TPen
 0051F077    mov         edx,1
 0051F07C    call        TPen.SetWidth
 0051F081    mov         eax,dword ptr [ebp-34]
 0051F084    mov         eax,dword ptr [eax+270];TmwCustomEdit.........................FCanvas:TCanvas
 0051F08A    call        TCanvas.GetHandle
 0051F08F    mov         dword ptr [ebp-80],eax
 0051F092    mov         eax,dword ptr [ebp-34]
 0051F095    mov         eax,dword ptr [eax+29C];TmwCustomEdit.fGutterWidth:Integer
 0051F09B    add         eax,2
 0051F09E    mov         ebx,dword ptr [ebp-90]
 0051F0A4    cmp         eax,ebx
>0051F0A6    jle         0051F0FD
 0051F0A8    lea         esi,[ebp-90]
 0051F0AE    lea         edi,[ebp-58]
 0051F0B1    movs        dword ptr [edi],dword ptr [esi]
 0051F0B2    movs        dword ptr [edi],dword ptr [esi]
 0051F0B3    movs        dword ptr [edi],dword ptr [esi]
 0051F0B4    movs        dword ptr [edi],dword ptr [esi]
 0051F0B5    mov         eax,dword ptr [ebp-34]
 0051F0B8    mov         edx,dword ptr [eax+29C];TmwCustomEdit.fGutterWidth:Integer
 0051F0BE    mov         eax,ebx
 0051F0C0    call        00510484
 0051F0C5    mov         dword ptr [ebp-58],eax
 0051F0C8    mov         eax,dword ptr [ebp-34]
 0051F0CB    mov         eax,dword ptr [eax+29C];TmwCustomEdit.fGutterWidth:Integer
 0051F0D1    add         eax,2
 0051F0D4    mov         dword ptr [ebp-50],eax
 0051F0D7    mov         eax,dword ptr [ebp-7C]
 0051F0DA    call        ColorToRGB
 0051F0DF    push        eax
 0051F0E0    mov         eax,dword ptr [ebp-80]
 0051F0E3    push        eax
 0051F0E4    call        gdi32.SetBkColor
 0051F0E9    lea         edx,[ebp-58]
 0051F0EC    mov         eax,dword ptr [ebp-80]
 0051F0EF    call        005104E0
 0051F0F4    mov         eax,dword ptr [ebp-50]
 0051F0F7    mov         dword ptr [ebp-90],eax
 0051F0FD    mov         eax,dword ptr [ebp+10]
 0051F100    cmp         eax,dword ptr [ebp-40]
>0051F103    jl          0051F172
 0051F105    push        ebp
 0051F106    call        0051E1A4
 0051F10B    pop         ecx
 0051F10C    mov         eax,dword ptr [ebp-34]
 0051F10F    call        TmwCustomEdit.GetFont
 0051F114    mov         eax,dword ptr [eax+10]
 0051F117    movzx       edx,byte ptr [eax+21]
 0051F11B    mov         eax,dword ptr [ebp-34]
 0051F11E    mov         eax,dword ptr [eax+3B8];TmwCustomEdit.fTextDrawer:TheTextDrawer
 0051F124    mov         ecx,dword ptr [eax]
 0051F126    call        dword ptr [ecx+30];TheTextDrawer.SetStyle
 0051F129    mov         eax,dword ptr [ebp-34]
 0051F12C    mov         eax,dword ptr [eax+3B8];TmwCustomEdit.fTextDrawer:TheTextDrawer
 0051F132    mov         edx,dword ptr [ebp-80]
 0051F135    mov         ecx,dword ptr [eax]
 0051F137    call        dword ptr [ecx+18];TheTextDrawer.BeginDrawing
 0051F13A    xor         eax,eax
 0051F13C    push        ebp
 0051F13D    push        51F16B
 0051F142    push        dword ptr fs:[eax]
 0051F145    mov         dword ptr fs:[eax],esp
 0051F148    push        ebp
 0051F149    call        0051E968
 0051F14E    pop         ecx
 0051F14F    xor         eax,eax
 0051F151    pop         edx
 0051F152    pop         ecx
 0051F153    pop         ecx
 0051F154    mov         dword ptr fs:[eax],edx
 0051F157    push        51F172
 0051F15C    mov         eax,dword ptr [ebp-34]
 0051F15F    mov         eax,dword ptr [eax+3B8];TmwCustomEdit.fTextDrawer:TheTextDrawer
 0051F165    mov         edx,dword ptr [eax]
 0051F167    call        dword ptr [edx+1C];TheTextDrawer.EndDrawing
 0051F16A    ret
>0051F16B    jmp         @HandleFinally
>0051F170    jmp         0051F15C
 0051F172    lea         esi,[ebp-90]
 0051F178    lea         edi,[ebp-58]
 0051F17B    movs        dword ptr [edi],dword ptr [esi]
 0051F17C    movs        dword ptr [edi],dword ptr [esi]
 0051F17D    movs        dword ptr [edi],dword ptr [esi]
 0051F17E    movs        dword ptr [edi],dword ptr [esi]
 0051F17F    mov         eax,dword ptr [ebp-34]
 0051F182    call        0051CBB4
 0051F187    mov         ebx,dword ptr [ebp+10]
 0051F18A    sub         ebx,eax
 0051F18C    inc         ebx
 0051F18D    mov         eax,dword ptr [ebp-34]
 0051F190    imul        ebx,dword ptr [eax+2C8];TmwCustomEdit.fTextHeight:Integer
 0051F197    mov         dword ptr [ebp-54],ebx
 0051F19A    cmp         ebx,dword ptr [ebp-4C]
>0051F19D    jge         0051F1F0
 0051F19F    mov         eax,dword ptr [ebp-7C]
 0051F1A2    call        ColorToRGB
 0051F1A7    push        eax
 0051F1A8    mov         eax,dword ptr [ebp-80]
 0051F1AB    push        eax
 0051F1AC    call        gdi32.SetBkColor
 0051F1B1    lea         edx,[ebp-58]
 0051F1B4    mov         eax,dword ptr [ebp-80]
 0051F1B7    call        005104E0
 0051F1BC    cmp         byte ptr [ebp-91],0
>0051F1C3    je          0051F1F0
 0051F1C5    push        0
 0051F1C7    mov         eax,dword ptr [ebp-54]
 0051F1CA    push        eax
 0051F1CB    mov         eax,dword ptr [ebp-98]
 0051F1D1    push        eax
 0051F1D2    mov         eax,dword ptr [ebp-80]
 0051F1D5    push        eax
 0051F1D6    call        gdi32.MoveToEx
 0051F1DB    mov         eax,dword ptr [ebp-4C]
 0051F1DE    inc         eax
 0051F1DF    push        eax
 0051F1E0    mov         eax,dword ptr [ebp-98]
 0051F1E6    push        eax
 0051F1E7    mov         eax,dword ptr [ebp-80]
 0051F1EA    push        eax
 0051F1EB    call        gdi32.LineTo
 0051F1F0    xor         eax,eax
 0051F1F2    pop         edx
 0051F1F3    pop         ecx
 0051F1F4    pop         ecx
 0051F1F5    mov         dword ptr fs:[eax],edx
 0051F1F8    push        51F213
 0051F1FD    lea         eax,[ebp-24]
 0051F200    mov         edx,dword ptr ds:[51E104];:TmwCustomEdit.:1
 0051F206    call        @FinalizeRecord
 0051F20B    ret
>0051F20C    jmp         @HandleFinally
>0051F211    jmp         0051F1FD
 0051F213    pop         edi
 0051F214    pop         esi
 0051F215    pop         ebx
 0051F216    mov         esp,ebp
 0051F218    pop         ebp
 0051F219    ret         0C
end;*}

//0051F21C
procedure TmwCustomEdit.PasteFromClipboard;
begin
{*
 0051F21C    push        ebp
 0051F21D    mov         ebp,esp
 0051F21F    add         esp,0FFFFFF9C
 0051F222    push        ebx
 0051F223    push        esi
 0051F224    push        edi
 0051F225    xor         edx,edx
 0051F227    mov         dword ptr [ebp-64],edx
 0051F22A    mov         dword ptr [ebp-58],edx
 0051F22D    mov         dword ptr [ebp-54],edx
 0051F230    mov         dword ptr [ebp-50],edx
 0051F233    mov         dword ptr [ebp-4C],edx
 0051F236    mov         dword ptr [ebp-48],edx
 0051F239    mov         dword ptr [ebp-44],edx
 0051F23C    mov         dword ptr [ebp-4],eax
 0051F23F    xor         eax,eax
 0051F241    push        ebp
 0051F242    push        51F65C
 0051F247    push        dword ptr fs:[eax]
 0051F24A    mov         dword ptr fs:[eax],esp
 0051F24D    call        Clipboard
 0051F252    movzx       edx,word ptr ds:[793B24];gvar_00793B24:LongWord
 0051F259    call        TClipboard.HasFormat
 0051F25E    test        al,al
>0051F260    je          0051F4F1
 0051F266    call        Clipboard
 0051F26B    mov         edx,dword ptr [eax]
 0051F26D    call        dword ptr [edx+18];TClipboard.Open
 0051F270    xor         edx,edx
 0051F272    push        ebp
 0051F273    push        51F4DD
 0051F278    push        dword ptr fs:[edx]
 0051F27B    mov         dword ptr fs:[edx],esp
 0051F27E    call        Clipboard
 0051F283    movzx       edx,word ptr ds:[793B24];gvar_00793B24:LongWord
 0051F28A    call        TClipboard.GetAsHandle
 0051F28F    push        eax
 0051F290    call        kernel32.GlobalLock
 0051F295    mov         esi,eax
 0051F297    test        esi,esi
>0051F299    je          0051F4AF
 0051F29F    mov         eax,dword ptr [ebp-4]
 0051F2A2    call        0051C710
 0051F2A7    test        al,al
>0051F2A9    je          0051F2EC
 0051F2AB    mov         eax,dword ptr [ebp-4]
 0051F2AE    add         eax,280;TmwCustomEdit.fBlockEnd:TPoint
 0051F2B3    push        eax
 0051F2B4    lea         edx,[ebp-44]
 0051F2B7    mov         eax,dword ptr [ebp-4]
 0051F2BA    call        0051C7FC
 0051F2BF    mov         eax,dword ptr [ebp-44]
 0051F2C2    call        @UStrToPWChar
 0051F2C7    push        eax
 0051F2C8    mov         eax,dword ptr [ebp-4]
 0051F2CB    movzx       eax,byte ptr [eax+390];TmwCustomEdit.fSelectionMode:TSelectionMode
 0051F2D2    push        eax
 0051F2D3    mov         eax,dword ptr [ebp-4]
 0051F2D6    lea         ecx,[eax+278];TmwCustomEdit.fBlockBegin:TPoint
 0051F2DC    mov         eax,dword ptr [ebp-4]
 0051F2DF    mov         eax,dword ptr [eax+2DC];TmwCustomEdit.fUndoList:TUndoList
 0051F2E5    mov         dl,5
 0051F2E7    call        TUndoList.AddChange
 0051F2EC    movzx       ebx,byte ptr [esi]
 0051F2EF    inc         esi
 0051F2F0    mov         eax,dword ptr [ebp-4]
 0051F2F3    call        0051C710
 0051F2F8    test        al,al
>0051F2FA    je          0051F36D
 0051F2FC    lea         ecx,[ebp-0C]
 0051F2FF    mov         eax,dword ptr [ebp-4]
 0051F302    lea         edx,[eax+280];TmwCustomEdit.fBlockEnd:TPoint
 0051F308    mov         eax,dword ptr [ebp-4]
 0051F30B    add         eax,278;TmwCustomEdit.fBlockBegin:TPoint
 0051F310    call        0051B830
 0051F315    lea         ecx,[ebp-14]
 0051F318    mov         eax,dword ptr [ebp-4]
 0051F31B    lea         edx,[eax+280];TmwCustomEdit.fBlockEnd:TPoint
 0051F321    mov         eax,dword ptr [ebp-4]
 0051F324    add         eax,278;TmwCustomEdit.fBlockBegin:TPoint
 0051F329    call        0051B7DC
 0051F32E    mov         eax,dword ptr [ebp-4]
 0051F331    mov         edx,dword ptr [ebp-0C]
 0051F334    mov         dword ptr [eax+278],edx;TmwCustomEdit.fBlockBegin:TPoint
 0051F33A    mov         edx,dword ptr [ebp-8]
 0051F33D    mov         dword ptr [eax+27C],edx
 0051F343    mov         eax,dword ptr [ebp-4]
 0051F346    mov         edx,dword ptr [ebp-14]
 0051F349    mov         dword ptr [eax+280],edx;TmwCustomEdit.fBlockEnd:TPoint
 0051F34F    mov         edx,dword ptr [ebp-10]
 0051F352    mov         dword ptr [eax+284],edx
 0051F358    mov         eax,dword ptr [ebp-4]
 0051F35B    cmp         byte ptr [eax+390],2;TmwCustomEdit.fSelectionMode:TSelectionMode
>0051F362    jne         0051F391
 0051F364    mov         dword ptr [ebp-0C],1
>0051F36B    jmp         0051F391
 0051F36D    mov         eax,dword ptr [ebp-4]
 0051F370    call        0051C628
 0051F375    mov         edi,eax
 0051F377    mov         eax,dword ptr [ebp-4]
 0051F37A    call        0051C660
 0051F37F    mov         dword ptr [ebp-20],edi
 0051F382    mov         dword ptr [ebp-1C],eax
 0051F385    mov         eax,dword ptr [ebp-20]
 0051F388    mov         dword ptr [ebp-0C],eax
 0051F38B    mov         eax,dword ptr [ebp-1C]
 0051F38E    mov         dword ptr [ebp-8],eax
 0051F391    xor         eax,eax
 0051F393    mov         dword ptr [ebp-18],eax
 0051F396    lea         eax,[ebp-18]
 0051F399    push        eax
 0051F39A    mov         ecx,esi
 0051F39C    mov         edx,ebx
 0051F39E    mov         eax,dword ptr [ebp-4]
 0051F3A1    call        00520D98
 0051F3A6    lea         edx,[ebp-14]
 0051F3A9    mov         eax,dword ptr [ebp-4]
 0051F3AC    call        0051C5CC
 0051F3B1    cmp         bl,2
>0051F3B4    je          0051F3E7
 0051F3B6    lea         eax,[ebp-14]
 0051F3B9    push        eax
 0051F3BA    lea         edx,[ebp-48]
 0051F3BD    mov         eax,dword ptr [ebp-4]
 0051F3C0    call        0051C7FC
 0051F3C5    mov         eax,dword ptr [ebp-48]
 0051F3C8    call        @UStrToPWChar
 0051F3CD    push        eax
 0051F3CE    push        ebx
 0051F3CF    mov         eax,dword ptr [ebp-4]
 0051F3D2    mov         eax,dword ptr [eax+2DC];TmwCustomEdit.fUndoList:TUndoList
 0051F3D8    lea         ecx,[ebp-0C]
 0051F3DB    mov         dl,1
 0051F3DD    call        TUndoList.AddChange
>0051F3E2    jmp         0051F47B
 0051F3E7    mov         eax,dword ptr [ebp-4]
 0051F3EA    call        0051C628
 0051F3EF    dec         eax
>0051F3F0    jne         0051F441
 0051F3F2    mov         dword ptr [ebp-28],1
 0051F3F9    mov         eax,dword ptr [ebp-8]
 0051F3FC    mov         dword ptr [ebp-24],eax
 0051F3FF    mov         eax,dword ptr [ebp-4]
 0051F402    mov         eax,dword ptr [eax+290];TmwCustomEdit.fCharsInWindow:Integer
 0051F408    mov         dword ptr [ebp-30],eax
 0051F40B    mov         eax,dword ptr [ebp-10]
 0051F40E    dec         eax
 0051F40F    mov         dword ptr [ebp-2C],eax
 0051F412    lea         eax,[ebp-30]
 0051F415    push        eax
 0051F416    lea         edx,[ebp-4C]
 0051F419    mov         eax,dword ptr [ebp-4]
 0051F41C    call        0051C7FC
 0051F421    mov         eax,dword ptr [ebp-4C]
 0051F424    call        @UStrToPWChar
 0051F429    push        eax
 0051F42A    push        2
 0051F42C    mov         eax,dword ptr [ebp-4]
 0051F42F    mov         eax,dword ptr [eax+2DC];TmwCustomEdit.fUndoList:TUndoList
 0051F435    lea         ecx,[ebp-28]
 0051F438    mov         dl,1
 0051F43A    call        TUndoList.AddChange
>0051F43F    jmp         0051F47B
 0051F441    mov         dword ptr [ebp-38],1
 0051F448    mov         eax,dword ptr [ebp-8]
 0051F44B    mov         dword ptr [ebp-34],eax
 0051F44E    lea         eax,[ebp-14]
 0051F451    push        eax
 0051F452    lea         edx,[ebp-50]
 0051F455    mov         eax,dword ptr [ebp-4]
 0051F458    call        0051C7FC
 0051F45D    mov         eax,dword ptr [ebp-50]
 0051F460    call        @UStrToPWChar
 0051F465    push        eax
 0051F466    push        0
 0051F468    mov         eax,dword ptr [ebp-4]
 0051F46B    mov         eax,dword ptr [eax+2DC];TmwCustomEdit.fUndoList:TUndoList
 0051F471    lea         ecx,[ebp-38]
 0051F474    mov         dl,1
 0051F476    call        TUndoList.AddChange
 0051F47B    cmp         bl,1
>0051F47E    jne         0051F4C5
 0051F480    mov         edx,dword ptr [ebp-14]
 0051F483    mov         eax,dword ptr [ebp-0C]
 0051F486    call        0051048C
 0051F48B    mov         ebx,eax
 0051F48D    mov         edx,dword ptr [ebp-10]
 0051F490    mov         eax,dword ptr [ebp-8]
 0051F493    call        00510484
 0051F498    inc         eax
 0051F499    mov         dword ptr [ebp-40],ebx
 0051F49C    mov         dword ptr [ebp-3C],eax
 0051F49F    lea         edx,[ebp-40]
 0051F4A2    mov         eax,dword ptr [ebp-4]
 0051F4A5    mov         ecx,dword ptr [eax]
 0051F4A7    call        dword ptr [ecx+110];TmwCustomEdit.sub_0051FBE0
>0051F4AD    jmp         0051F4C5
 0051F4AF    mov         ecx,51F678;'Clipboard paste operation failed.'
 0051F4B4    mov         dl,1
 0051F4B6    mov         eax,[00517770];EmwEditError
 0051F4BB    call        Exception.Create;EmwEditError.Create
 0051F4C0    call        @RaiseExcept
 0051F4C5    xor         eax,eax
 0051F4C7    pop         edx
 0051F4C8    pop         ecx
 0051F4C9    pop         ecx
 0051F4CA    mov         dword ptr fs:[eax],edx
 0051F4CD    push        51F4E4
 0051F4D2    call        Clipboard
 0051F4D7    mov         edx,dword ptr [eax]
 0051F4D9    call        dword ptr [edx+14];TClipboard.Close
 0051F4DC    ret
>0051F4DD    jmp         @HandleFinally
>0051F4E2    jmp         0051F4D2
 0051F4E4    mov         eax,dword ptr [ebp-4]
 0051F4E7    call        TmwCustomEdit.EnsureCursorPosVisible
>0051F4EC    jmp         0051F62A
 0051F4F1    call        Clipboard
 0051F4F6    mov         dx,0D
 0051F4FA    call        TClipboard.HasFormat
 0051F4FF    test        al,al
>0051F501    jne         0051F519
 0051F503    call        Clipboard
 0051F508    mov         dx,1
 0051F50C    call        TClipboard.HasFormat
 0051F511    test        al,al
>0051F513    je          0051F62A
 0051F519    mov         eax,dword ptr [ebp-4]
 0051F51C    call        0051C710
 0051F521    test        al,al
>0051F523    je          0051F566
 0051F525    mov         eax,dword ptr [ebp-4]
 0051F528    add         eax,280;TmwCustomEdit.fBlockEnd:TPoint
 0051F52D    push        eax
 0051F52E    lea         edx,[ebp-54]
 0051F531    mov         eax,dword ptr [ebp-4]
 0051F534    call        0051C7FC
 0051F539    mov         eax,dword ptr [ebp-54]
 0051F53C    call        @UStrToPWChar
 0051F541    push        eax
 0051F542    mov         eax,dword ptr [ebp-4]
 0051F545    movzx       eax,byte ptr [eax+390];TmwCustomEdit.fSelectionMode:TSelectionMode
 0051F54C    push        eax
 0051F54D    mov         eax,dword ptr [ebp-4]
 0051F550    lea         ecx,[eax+278];TmwCustomEdit.fBlockBegin:TPoint
 0051F556    mov         eax,dword ptr [ebp-4]
 0051F559    mov         eax,dword ptr [eax+2DC];TmwCustomEdit.fUndoList:TUndoList
 0051F55F    mov         dl,5
 0051F561    call        TUndoList.AddChange
 0051F566    lea         ecx,[ebp-0C]
 0051F569    mov         eax,dword ptr [ebp-4]
 0051F56C    lea         edx,[eax+280];TmwCustomEdit.fBlockEnd:TPoint
 0051F572    mov         eax,dword ptr [ebp-4]
 0051F575    add         eax,278;TmwCustomEdit.fBlockBegin:TPoint
 0051F57A    call        0051B830
 0051F57F    lea         ecx,[ebp-14]
 0051F582    mov         eax,dword ptr [ebp-4]
 0051F585    lea         edx,[eax+280];TmwCustomEdit.fBlockEnd:TPoint
 0051F58B    mov         eax,dword ptr [ebp-4]
 0051F58E    add         eax,278;TmwCustomEdit.fBlockBegin:TPoint
 0051F593    call        0051B7DC
 0051F598    mov         eax,dword ptr [ebp-4]
 0051F59B    mov         edx,dword ptr [ebp-0C]
 0051F59E    mov         dword ptr [eax+278],edx;TmwCustomEdit.fBlockBegin:TPoint
 0051F5A4    mov         edx,dword ptr [ebp-8]
 0051F5A7    mov         dword ptr [eax+27C],edx
 0051F5AD    mov         eax,dword ptr [ebp-4]
 0051F5B0    mov         edx,dword ptr [ebp-14]
 0051F5B3    mov         dword ptr [eax+280],edx;TmwCustomEdit.fBlockEnd:TPoint
 0051F5B9    mov         edx,dword ptr [ebp-10]
 0051F5BC    mov         dword ptr [eax+284],edx
 0051F5C2    mov         eax,dword ptr [ebp-4]
 0051F5C5    call        00527894
 0051F5CA    call        Clipboard
 0051F5CF    lea         edx,[ebp-58]
 0051F5D2    call        TClipboard.GetAsText
 0051F5D7    mov         edx,dword ptr [ebp-58]
 0051F5DA    mov         eax,dword ptr [ebp-4]
 0051F5DD    call        005276B8
 0051F5E2    mov         eax,dword ptr [ebp-4]
 0051F5E5    call        005278B0
 0051F5EA    lea         edx,[ebp-60]
 0051F5ED    mov         eax,dword ptr [ebp-4]
 0051F5F0    call        0051C5CC
 0051F5F5    lea         eax,[ebp-60]
 0051F5F8    push        eax
 0051F5F9    lea         edx,[ebp-64]
 0051F5FC    mov         eax,dword ptr [ebp-4]
 0051F5FF    call        0051C7FC
 0051F604    mov         eax,dword ptr [ebp-64]
 0051F607    call        @UStrToPWChar
 0051F60C    push        eax
 0051F60D    push        0
 0051F60F    mov         eax,dword ptr [ebp-4]
 0051F612    mov         eax,dword ptr [eax+2DC];TmwCustomEdit.fUndoList:TUndoList
 0051F618    lea         ecx,[ebp-0C]
 0051F61B    mov         dl,1
 0051F61D    call        TUndoList.AddChange
 0051F622    mov         eax,dword ptr [ebp-4]
 0051F625    call        TmwCustomEdit.EnsureCursorPosVisible
 0051F62A    movzx       edx,byte ptr ds:[51F6BC];0x80 gvar_0051F6BC
 0051F631    mov         eax,dword ptr [ebp-4]
 0051F634    call        005287FC
 0051F639    xor         eax,eax
 0051F63B    pop         edx
 0051F63C    pop         ecx
 0051F63D    pop         ecx
 0051F63E    mov         dword ptr fs:[eax],edx
 0051F641    push        51F663
 0051F646    lea         eax,[ebp-64]
 0051F649    call        @UStrClr
 0051F64E    lea         eax,[ebp-58]
 0051F651    mov         edx,6
 0051F656    call        @UStrArrayClr
 0051F65B    ret
>0051F65C    jmp         @HandleFinally
>0051F661    jmp         0051F646
 0051F663    pop         edi
 0051F664    pop         esi
 0051F665    pop         ebx
 0051F666    mov         esp,ebp
 0051F668    pop         ebp
 0051F669    ret
*}
end;

//0051F6C0
procedure TmwCustomEdit.SelectAll;
begin
{*
 0051F6C0    push        ebp
 0051F6C1    mov         ebp,esp
 0051F6C3    add         esp,0FFFFFFDC
 0051F6C6    push        ebx
 0051F6C7    push        esi
 0051F6C8    xor         edx,edx
 0051F6CA    mov         dword ptr [ebp-24],edx
 0051F6CD    mov         dword ptr [ebp-1C],edx
 0051F6D0    mov         esi,eax
 0051F6D2    xor         eax,eax
 0051F6D4    push        ebp
 0051F6D5    push        51F7C6
 0051F6DA    push        dword ptr fs:[eax]
 0051F6DD    mov         dword ptr fs:[eax],esp
 0051F6E0    mov         dword ptr [ebp-8],1
 0051F6E7    mov         dword ptr [ebp-4],1
 0051F6EE    lea         edx,[ebp-8]
 0051F6F1    mov         eax,esi
 0051F6F3    call        0051F7D8
 0051F6F8    mov         eax,dword ptr [esi+2A4];TmwCustomEdit.fLines:TStrings
 0051F6FE    mov         edx,dword ptr [eax]
 0051F700    call        dword ptr [edx+14];TStrings.GetCount
 0051F703    test        eax,eax
>0051F705    jle         0051F74F
 0051F707    mov         ebx,dword ptr [esi+2A4];TmwCustomEdit.fLines:TStrings
 0051F70D    mov         eax,ebx
 0051F70F    mov         edx,dword ptr [eax]
 0051F711    call        dword ptr [edx+14];TStrings.GetCount
 0051F714    mov         edx,eax
 0051F716    dec         edx
 0051F717    lea         ecx,[ebp-1C]
 0051F71A    mov         eax,ebx
 0051F71C    mov         ebx,dword ptr [eax]
 0051F71E    call        dword ptr [ebx+0C];TStrings.Get
 0051F721    mov         eax,dword ptr [ebp-1C]
 0051F724    mov         dword ptr [ebp-20],eax
 0051F727    mov         ebx,dword ptr [ebp-20]
 0051F72A    test        ebx,ebx
>0051F72C    je          0051F733
 0051F72E    sub         ebx,4
 0051F731    mov         ebx,dword ptr [ebx]
 0051F733    mov         eax,dword ptr [esi+2A4];TmwCustomEdit.fLines:TStrings
 0051F739    mov         edx,dword ptr [eax]
 0051F73B    call        dword ptr [edx+14];TStrings.GetCount
 0051F73E    inc         ebx
 0051F73F    mov         dword ptr [ebp-10],ebx
 0051F742    mov         dword ptr [ebp-0C],eax
 0051F745    lea         edx,[ebp-10]
 0051F748    mov         eax,esi
 0051F74A    call        0051F99C
 0051F74F    mov         ebx,dword ptr [esi+2A4];TmwCustomEdit.fLines:TStrings
 0051F755    mov         eax,ebx
 0051F757    mov         edx,dword ptr [eax]
 0051F759    call        dword ptr [edx+14];TStrings.GetCount
 0051F75C    mov         edx,eax
 0051F75E    dec         edx
 0051F75F    lea         ecx,[ebp-24]
 0051F762    mov         eax,ebx
 0051F764    mov         ebx,dword ptr [eax]
 0051F766    call        dword ptr [ebx+0C];TStrings.Get
 0051F769    mov         eax,dword ptr [ebp-24]
 0051F76C    mov         dword ptr [ebp-20],eax
 0051F76F    mov         ebx,dword ptr [ebp-20]
 0051F772    test        ebx,ebx
>0051F774    je          0051F77B
 0051F776    sub         ebx,4
 0051F779    mov         ebx,dword ptr [ebx]
 0051F77B    mov         eax,dword ptr [esi+2A4];TmwCustomEdit.fLines:TStrings
 0051F781    mov         edx,dword ptr [eax]
 0051F783    call        dword ptr [edx+14];TStrings.GetCount
 0051F786    inc         ebx
 0051F787    mov         dword ptr [ebp-18],ebx
 0051F78A    mov         dword ptr [ebp-14],eax
 0051F78D    lea         edx,[ebp-18]
 0051F790    mov         eax,esi
 0051F792    mov         ecx,dword ptr [eax]
 0051F794    call        dword ptr [ecx+110];TmwCustomEdit.sub_0051FBE0
 0051F79A    movzx       edx,byte ptr ds:[51F7D4];0x80 gvar_0051F7D4
 0051F7A1    mov         eax,esi
 0051F7A3    call        005287FC
 0051F7A8    xor         eax,eax
 0051F7AA    pop         edx
 0051F7AB    pop         ecx
 0051F7AC    pop         ecx
 0051F7AD    mov         dword ptr fs:[eax],edx
 0051F7B0    push        51F7CD
 0051F7B5    lea         eax,[ebp-24]
 0051F7B8    call        @UStrClr
 0051F7BD    lea         eax,[ebp-1C]
 0051F7C0    call        @UStrClr
 0051F7C5    ret
>0051F7C6    jmp         @HandleFinally
>0051F7CB    jmp         0051F7B5
 0051F7CD    pop         esi
 0051F7CE    pop         ebx
 0051F7CF    mov         esp,ebp
 0051F7D1    pop         ebp
 0051F7D2    ret
*}
end;

//0051F7D8
procedure sub_0051F7D8(?:TmwCustomEdit; ?:TPoint);
begin
{*
 0051F7D8    push        ebp
 0051F7D9    mov         ebp,esp
 0051F7DB    add         esp,0FFFFFFF0
 0051F7DE    push        ebx
 0051F7DF    push        esi
 0051F7E0    push        edi
 0051F7E1    xor         ecx,ecx
 0051F7E3    mov         dword ptr [ebp-0C],ecx
 0051F7E6    mov         esi,edx
 0051F7E8    lea         edi,[ebp-8]
 0051F7EB    movs        dword ptr [edi],dword ptr [esi]
 0051F7EC    movs        dword ptr [edi],dword ptr [esi]
 0051F7ED    mov         ebx,eax
 0051F7EF    xor         eax,eax
 0051F7F1    push        ebp
 0051F7F2    push        51F988
 0051F7F7    push        dword ptr fs:[eax]
 0051F7FA    mov         dword ptr fs:[eax],esp
 0051F7FD    mov         ecx,dword ptr [ebx+2B0];TmwCustomEdit.fMaxLeftChar:Integer
 0051F803    mov         edx,1
 0051F808    mov         eax,dword ptr [ebp-8]
 0051F80B    call        00510494
 0051F810    mov         dword ptr [ebp-8],eax
 0051F813    mov         eax,dword ptr [ebx+2A4];TmwCustomEdit.fLines:TStrings
 0051F819    mov         edx,dword ptr [eax]
 0051F81B    call        dword ptr [edx+14];TStrings.GetCount
 0051F81E    mov         ecx,eax
 0051F820    mov         edx,1
 0051F825    mov         eax,dword ptr [ebp-4]
 0051F828    call        00510494
 0051F82D    mov         dword ptr [ebp-4],eax
 0051F830    cmp         byte ptr [ebx+390],0;TmwCustomEdit.fSelectionMode:TSelectionMode
>0051F837    jne         0051F88B
 0051F839    mov         esi,dword ptr [ebp-4]
 0051F83C    cmp         esi,1
>0051F83F    jl          0051F884
 0051F841    mov         eax,dword ptr [ebx+2A4];TmwCustomEdit.fLines:TStrings
 0051F847    mov         edx,dword ptr [eax]
 0051F849    call        dword ptr [edx+14];TStrings.GetCount
 0051F84C    cmp         esi,eax
>0051F84E    jg          0051F884
 0051F850    lea         ecx,[ebp-0C]
 0051F853    mov         edx,dword ptr [ebp-4]
 0051F856    dec         edx
 0051F857    mov         eax,dword ptr [ebx+2A4];TmwCustomEdit.fLines:TStrings
 0051F85D    mov         esi,dword ptr [eax]
 0051F85F    call        dword ptr [esi+0C];TStrings.Get
 0051F862    mov         eax,dword ptr [ebp-0C]
 0051F865    mov         dword ptr [ebp-10],eax
 0051F868    mov         esi,dword ptr [ebp-10]
 0051F86B    test        esi,esi
>0051F86D    je          0051F874
 0051F86F    sub         esi,4
 0051F872    mov         esi,dword ptr [esi]
 0051F874    lea         edx,[esi+1]
 0051F877    mov         eax,dword ptr [ebp-8]
 0051F87A    call        0051048C
 0051F87F    mov         dword ptr [ebp-8],eax
>0051F882    jmp         0051F88B
 0051F884    mov         dword ptr [ebp-8],1
 0051F88B    mov         eax,ebx
 0051F88D    call        0051C710
 0051F892    test        al,al
>0051F894    je          0051F90D
 0051F896    mov         edx,dword ptr [ebx+284]
 0051F89C    mov         eax,dword ptr [ebx+27C]
 0051F8A2    cmp         edx,eax
>0051F8A4    jle         0051F8C2
 0051F8A6    mov         edx,eax
 0051F8A8    mov         eax,dword ptr [ebp-4]
 0051F8AB    call        0051048C
 0051F8B0    mov         esi,eax
 0051F8B2    mov         edx,dword ptr [ebx+284]
 0051F8B8    mov         eax,dword ptr [ebp-4]
 0051F8BB    call        00510484
>0051F8C0    jmp         0051F8DA
 0051F8C2    mov         eax,dword ptr [ebp-4]
 0051F8C5    call        0051048C
 0051F8CA    mov         esi,eax
 0051F8CC    mov         edx,dword ptr [ebx+27C]
 0051F8D2    mov         eax,dword ptr [ebp-4]
 0051F8D5    call        00510484
 0051F8DA    mov         edx,dword ptr [ebp-8]
 0051F8DD    mov         dword ptr [ebx+278],edx;TmwCustomEdit.fBlockBegin:TPoint
 0051F8E3    mov         edx,dword ptr [ebp-4]
 0051F8E6    mov         dword ptr [ebx+27C],edx
 0051F8EC    mov         edx,dword ptr [ebp-8]
 0051F8EF    mov         dword ptr [ebx+280],edx;TmwCustomEdit.fBlockEnd:TPoint
 0051F8F5    mov         edx,dword ptr [ebp-4]
 0051F8F8    mov         dword ptr [ebx+284],edx
 0051F8FE    mov         ecx,eax
 0051F900    mov         edx,esi
 0051F902    mov         eax,ebx
 0051F904    call        0051CD40
 0051F909    mov         al,1
>0051F90B    jmp         0051F960
 0051F90D    mov         eax,dword ptr [ebp-8]
 0051F910    cmp         eax,dword ptr [ebx+278];TmwCustomEdit.fBlockBegin:TPoint
>0051F916    jne         0051F93A
 0051F918    mov         edx,dword ptr [ebx+27C]
 0051F91E    cmp         edx,dword ptr [ebp-4]
>0051F921    jne         0051F93A
 0051F923    cmp         eax,dword ptr [ebx+280];TmwCustomEdit.fBlockEnd:TPoint
>0051F929    jne         0051F93A
 0051F92B    mov         eax,dword ptr [ebx+284]
 0051F931    cmp         eax,dword ptr [ebp-4]
>0051F934    jne         0051F93A
 0051F936    xor         eax,eax
>0051F938    jmp         0051F93C
 0051F93A    mov         al,1
 0051F93C    mov         edx,dword ptr [ebp-8]
 0051F93F    mov         dword ptr [ebx+278],edx;TmwCustomEdit.fBlockBegin:TPoint
 0051F945    mov         edx,dword ptr [ebp-4]
 0051F948    mov         dword ptr [ebx+27C],edx
 0051F94E    mov         edx,dword ptr [ebp-8]
 0051F951    mov         dword ptr [ebx+280],edx;TmwCustomEdit.fBlockEnd:TPoint
 0051F957    mov         edx,dword ptr [ebp-4]
 0051F95A    mov         dword ptr [ebx+284],edx
 0051F960    test        al,al
>0051F962    je          0051F972
 0051F964    movzx       edx,byte ptr ds:[51F998];0x80 gvar_0051F998
 0051F96B    mov         eax,ebx
 0051F96D    call        005287FC
 0051F972    xor         eax,eax
 0051F974    pop         edx
 0051F975    pop         ecx
 0051F976    pop         ecx
 0051F977    mov         dword ptr fs:[eax],edx
 0051F97A    push        51F98F
 0051F97F    lea         eax,[ebp-0C]
 0051F982    call        @UStrClr
 0051F987    ret
>0051F988    jmp         @HandleFinally
>0051F98D    jmp         0051F97F
 0051F98F    pop         edi
 0051F990    pop         esi
 0051F991    pop         ebx
 0051F992    mov         esp,ebp
 0051F994    pop         ebp
 0051F995    ret
*}
end;

//0051F99C
procedure sub_0051F99C(?:TmwCustomEdit; ?:TPoint);
begin
{*
 0051F99C    push        ebp
 0051F99D    mov         ebp,esp
 0051F99F    add         esp,0FFFFFFF0
 0051F9A2    push        ebx
 0051F9A3    push        esi
 0051F9A4    push        edi
 0051F9A5    xor         ecx,ecx
 0051F9A7    mov         dword ptr [ebp-0C],ecx
 0051F9AA    mov         esi,edx
 0051F9AC    lea         edi,[ebp-8]
 0051F9AF    movs        dword ptr [edi],dword ptr [esi]
 0051F9B0    movs        dword ptr [edi],dword ptr [esi]
 0051F9B1    mov         ebx,eax
 0051F9B3    xor         eax,eax
 0051F9B5    push        ebp
 0051F9B6    push        51FB5B
 0051F9BB    push        dword ptr fs:[eax]
 0051F9BE    mov         dword ptr fs:[eax],esp
 0051F9C1    test        byte ptr [ebx+3CE],20;TmwCustomEdit.fOptions:TmwEditorOptions
>0051F9C8    jne         0051FB45
 0051F9CE    mov         ecx,dword ptr [ebx+2B0];TmwCustomEdit.fMaxLeftChar:Integer
 0051F9D4    mov         edx,1
 0051F9D9    mov         eax,dword ptr [ebp-8]
 0051F9DC    call        00510494
 0051F9E1    mov         dword ptr [ebp-8],eax
 0051F9E4    mov         eax,dword ptr [ebx+2A4];TmwCustomEdit.fLines:TStrings
 0051F9EA    mov         edx,dword ptr [eax]
 0051F9EC    call        dword ptr [edx+14];TStrings.GetCount
 0051F9EF    mov         ecx,eax
 0051F9F1    mov         edx,1
 0051F9F6    mov         eax,dword ptr [ebp-4]
 0051F9F9    call        00510494
 0051F9FE    mov         dword ptr [ebp-4],eax
 0051FA01    cmp         byte ptr [ebx+390],0;TmwCustomEdit.fSelectionMode:TSelectionMode
>0051FA08    jne         0051FA5C
 0051FA0A    mov         esi,dword ptr [ebp-4]
 0051FA0D    cmp         esi,1
>0051FA10    jl          0051FA55
 0051FA12    mov         eax,dword ptr [ebx+2A4];TmwCustomEdit.fLines:TStrings
 0051FA18    mov         edx,dword ptr [eax]
 0051FA1A    call        dword ptr [edx+14];TStrings.GetCount
 0051FA1D    cmp         esi,eax
>0051FA1F    jg          0051FA55
 0051FA21    lea         ecx,[ebp-0C]
 0051FA24    mov         edx,dword ptr [ebp-4]
 0051FA27    dec         edx
 0051FA28    mov         eax,dword ptr [ebx+2A4];TmwCustomEdit.fLines:TStrings
 0051FA2E    mov         esi,dword ptr [eax]
 0051FA30    call        dword ptr [esi+0C];TStrings.Get
 0051FA33    mov         eax,dword ptr [ebp-0C]
 0051FA36    mov         dword ptr [ebp-10],eax
 0051FA39    mov         esi,dword ptr [ebp-10]
 0051FA3C    test        esi,esi
>0051FA3E    je          0051FA45
 0051FA40    sub         esi,4
 0051FA43    mov         esi,dword ptr [esi]
 0051FA45    lea         edx,[esi+1]
 0051FA48    mov         eax,dword ptr [ebp-8]
 0051FA4B    call        0051048C
 0051FA50    mov         dword ptr [ebp-8],eax
>0051FA53    jmp         0051FA5C
 0051FA55    mov         dword ptr [ebp-8],1
 0051FA5C    mov         eax,dword ptr [ebp-8]
 0051FA5F    cmp         eax,dword ptr [ebx+280];TmwCustomEdit.fBlockEnd:TPoint
>0051FA65    jne         0051FA76
 0051FA67    mov         eax,dword ptr [ebp-4]
 0051FA6A    cmp         eax,dword ptr [ebx+284]
>0051FA70    je          0051FB45
 0051FA76    mov         eax,dword ptr [ebp-8]
 0051FA79    cmp         eax,dword ptr [ebx+280];TmwCustomEdit.fBlockEnd:TPoint
>0051FA7F    jne         0051FA90
 0051FA81    mov         eax,dword ptr [ebp-4]
 0051FA84    cmp         eax,dword ptr [ebx+284]
>0051FA8A    je          0051FB45
 0051FA90    cmp         byte ptr [ebx+390],1;TmwCustomEdit.fSelectionMode:TSelectionMode
>0051FA97    jne         0051FAF9
 0051FA99    mov         eax,dword ptr [ebp-8]
 0051FA9C    cmp         eax,dword ptr [ebx+280];TmwCustomEdit.fBlockEnd:TPoint
>0051FAA2    je          0051FAF9
 0051FAA4    mov         edx,dword ptr [ebp-4]
 0051FAA7    mov         eax,dword ptr [ebx+284]
 0051FAAD    call        00510484
 0051FAB2    mov         edx,eax
 0051FAB4    mov         eax,dword ptr [ebx+27C]
 0051FABA    call        00510484
 0051FABF    push        eax
 0051FAC0    mov         edx,dword ptr [ebp-4]
 0051FAC3    mov         eax,dword ptr [ebx+284]
 0051FAC9    call        0051048C
 0051FACE    mov         edx,eax
 0051FAD0    mov         eax,dword ptr [ebx+27C]
 0051FAD6    call        0051048C
 0051FADB    mov         edx,eax
 0051FADD    mov         eax,ebx
 0051FADF    pop         ecx
 0051FAE0    call        0051CD40
 0051FAE5    mov         eax,dword ptr [ebp-8]
 0051FAE8    mov         dword ptr [ebx+280],eax;TmwCustomEdit.fBlockEnd:TPoint
 0051FAEE    mov         eax,dword ptr [ebp-4]
 0051FAF1    mov         dword ptr [ebx+284],eax
>0051FAF7    jmp         0051FB37
 0051FAF9    mov         eax,dword ptr [ebx+284]
 0051FAFF    mov         edx,dword ptr [ebp-8]
 0051FB02    mov         dword ptr [ebx+280],edx;TmwCustomEdit.fBlockEnd:TPoint
 0051FB08    mov         edx,dword ptr [ebp-4]
 0051FB0B    mov         dword ptr [ebx+284],edx
 0051FB11    cmp         byte ptr [ebx+390],1;TmwCustomEdit.fSelectionMode:TSelectionMode
>0051FB18    jne         0051FB28
 0051FB1A    mov         edx,dword ptr [ebx+278];TmwCustomEdit.fBlockBegin:TPoint
 0051FB20    cmp         edx,dword ptr [ebx+280];TmwCustomEdit.fBlockEnd:TPoint
>0051FB26    je          0051FB37
 0051FB28    mov         ecx,dword ptr [ebx+284]
 0051FB2E    mov         edx,eax
 0051FB30    mov         eax,ebx
 0051FB32    call        0051CD40
 0051FB37    movzx       edx,byte ptr ds:[51FB6C];0x80 gvar_0051FB6C
 0051FB3E    mov         eax,ebx
 0051FB40    call        005287FC
 0051FB45    xor         eax,eax
 0051FB47    pop         edx
 0051FB48    pop         ecx
 0051FB49    pop         ecx
 0051FB4A    mov         dword ptr fs:[eax],edx
 0051FB4D    push        51FB62
 0051FB52    lea         eax,[ebp-0C]
 0051FB55    call        @UStrClr
 0051FB5A    ret
>0051FB5B    jmp         @HandleFinally
>0051FB60    jmp         0051FB52
 0051FB62    pop         edi
 0051FB63    pop         esi
 0051FB64    pop         ebx
 0051FB65    mov         esp,ebp
 0051FB67    pop         ebp
 0051FB68    ret
*}
end;

//0051FB70
{*procedure sub_0051FB70(?:TmwCustomEdit; ?:?);
begin
 0051FB70    push        esi
 0051FB71    add         esp,0FFFFFFF8
 0051FB74    mov         esi,eax
 0051FB76    mov         dword ptr [esp],edx
 0051FB79    mov         eax,dword ptr [esi+28C]
 0051FB7F    inc         eax
 0051FB80    mov         dword ptr [esp+4],eax
 0051FB84    mov         edx,esp
 0051FB86    mov         eax,esi
 0051FB88    mov         ecx,dword ptr [eax]
 0051FB8A    call        dword ptr [ecx+110]
 0051FB90    pop         ecx
 0051FB91    pop         edx
 0051FB92    pop         esi
 0051FB93    ret
end;*}

//0051FB94
procedure sub_0051FB94(?:TmwCustomEdit; ?:Integer);
begin
{*
 0051FB94    push        esi
 0051FB95    add         esp,0FFFFFFF8
 0051FB98    mov         esi,eax
 0051FB9A    mov         eax,dword ptr [esi+288]
 0051FBA0    inc         eax
 0051FBA1    mov         dword ptr [esp],eax
 0051FBA4    mov         dword ptr [esp+4],edx
 0051FBA8    mov         edx,esp
 0051FBAA    mov         eax,esi
 0051FBAC    mov         ecx,dword ptr [eax]
 0051FBAE    call        dword ptr [ecx+110]
 0051FBB4    pop         ecx
 0051FBB5    pop         edx
 0051FBB6    pop         esi
 0051FBB7    ret
*}
end;

//0051FBB8
procedure sub_0051FBB8(?:TmwCustomEdit; ?:TPoint);
begin
{*
 0051FBB8    add         esp,0FFFFFFF8
 0051FBBB    mov         ecx,dword ptr [eax+288];TmwCustomEdit.fCaretX:Integer
 0051FBC1    inc         ecx
 0051FBC2    mov         dword ptr [esp],ecx
 0051FBC5    mov         eax,dword ptr [eax+28C];TmwCustomEdit.fCaretY:Integer
 0051FBCB    inc         eax
 0051FBCC    mov         dword ptr [esp+4],eax
 0051FBD0    mov         eax,dword ptr [esp]
 0051FBD3    mov         dword ptr [edx],eax
 0051FBD5    mov         eax,dword ptr [esp+4]
 0051FBD9    mov         dword ptr [edx+4],eax
 0051FBDC    pop         ecx
 0051FBDD    pop         edx
 0051FBDE    ret
*}
end;

//0051FBE0
{*procedure sub_0051FBE0(?:?);
begin
 0051FBE0    push        ebp
 0051FBE1    mov         ebp,esp
 0051FBE3    add         esp,0FFFFFFEC
 0051FBE6    push        ebx
 0051FBE7    push        esi
 0051FBE8    push        edi
 0051FBE9    xor         ecx,ecx
 0051FBEB    mov         dword ptr [ebp-10],ecx
 0051FBEE    mov         esi,edx
 0051FBF0    lea         edi,[ebp-0C]
 0051FBF3    movs        dword ptr [edi],dword ptr [esi]
 0051FBF4    movs        dword ptr [edi],dword ptr [esi]
 0051FBF5    mov         dword ptr [ebp-4],eax
 0051FBF8    xor         eax,eax
 0051FBFA    push        ebp
 0051FBFB    push        51FD73
 0051FC00    push        dword ptr fs:[eax]
 0051FC03    mov         dword ptr fs:[eax],esp
 0051FC06    mov         eax,dword ptr [ebp-4]
 0051FC09    mov         ebx,dword ptr [eax+2B0];TmwCustomEdit.fMaxLeftChar:Integer
 0051FC0F    mov         eax,dword ptr [ebp-4]
 0051FC12    mov         eax,dword ptr [eax+2A4];TmwCustomEdit.fLines:TStrings
 0051FC18    mov         edx,dword ptr [eax]
 0051FC1A    call        dword ptr [edx+14];TStrings.GetCount
 0051FC1D    cmp         eax,dword ptr [ebp-8]
>0051FC20    jge         0051FC33
 0051FC22    mov         eax,dword ptr [ebp-4]
 0051FC25    mov         eax,dword ptr [eax+2A4];TmwCustomEdit.fLines:TStrings
 0051FC2B    mov         edx,dword ptr [eax]
 0051FC2D    call        dword ptr [edx+14];TStrings.GetCount
 0051FC30    mov         dword ptr [ebp-8],eax
 0051FC33    dec         dword ptr [ebp-0C]
 0051FC36    dec         dword ptr [ebp-8]
 0051FC39    mov         esi,dword ptr [ebp-8]
 0051FC3C    test        esi,esi
>0051FC3E    jge         0051FC55
 0051FC40    xor         eax,eax
 0051FC42    mov         dword ptr [ebp-8],eax
 0051FC45    mov         eax,dword ptr [ebp-4]
 0051FC48    test        byte ptr [eax+3CE],40;TmwCustomEdit.fOptions:TmwEditorOptions
>0051FC4F    jne         0051FC88
 0051FC51    xor         ebx,ebx
>0051FC53    jmp         0051FC88
 0051FC55    mov         eax,dword ptr [ebp-4]
 0051FC58    test        byte ptr [eax+3CE],40;TmwCustomEdit.fOptions:TmwEditorOptions
>0051FC5F    jne         0051FC88
 0051FC61    lea         ecx,[ebp-10]
 0051FC64    mov         eax,dword ptr [ebp-4]
 0051FC67    mov         eax,dword ptr [eax+2A4];TmwCustomEdit.fLines:TStrings
 0051FC6D    mov         edx,esi
 0051FC6F    mov         ebx,dword ptr [eax]
 0051FC71    call        dword ptr [ebx+0C];TStrings.Get
 0051FC74    mov         eax,dword ptr [ebp-10]
 0051FC77    mov         dword ptr [ebp-14],eax
 0051FC7A    mov         eax,dword ptr [ebp-14]
 0051FC7D    test        eax,eax
>0051FC7F    je          0051FC86
 0051FC81    sub         eax,4
 0051FC84    mov         eax,dword ptr [eax]
 0051FC86    mov         ebx,eax
 0051FC88    cmp         ebx,dword ptr [ebp-0C]
>0051FC8B    jge         0051FC90
 0051FC8D    mov         dword ptr [ebp-0C],ebx
 0051FC90    cmp         dword ptr [ebp-0C],0
>0051FC94    jge         0051FC9B
 0051FC96    xor         eax,eax
 0051FC98    mov         dword ptr [ebp-0C],eax
 0051FC9B    mov         eax,dword ptr [ebp-4]
 0051FC9E    mov         eax,dword ptr [eax+288];TmwCustomEdit.fCaretX:Integer
 0051FCA4    cmp         eax,dword ptr [ebp-0C]
>0051FCA7    jne         0051FCBB
 0051FCA9    mov         eax,dword ptr [ebp-4]
 0051FCAC    mov         eax,dword ptr [eax+28C];TmwCustomEdit.fCaretY:Integer
 0051FCB2    cmp         eax,dword ptr [ebp-8]
>0051FCB5    je          0051FD5D
 0051FCBB    mov         eax,dword ptr [ebp-4]
 0051FCBE    call        0051CBE4
 0051FCC3    xor         edx,edx
 0051FCC5    push        ebp
 0051FCC6    push        51FD4B
 0051FCCB    push        dword ptr fs:[edx]
 0051FCCE    mov         dword ptr fs:[edx],esp
 0051FCD1    mov         edx,dword ptr [ebp-4]
 0051FCD4    mov         edx,dword ptr [edx+288];TmwCustomEdit.fCaretX:Integer
 0051FCDA    mov         eax,dword ptr [ebp-0C]
 0051FCDD    cmp         edx,eax
>0051FCDF    je          0051FCF4
 0051FCE1    mov         edx,dword ptr [ebp-4]
 0051FCE4    mov         dword ptr [edx+288],eax;TmwCustomEdit.fCaretX:Integer
 0051FCEA    mov         eax,dword ptr [ebp-4]
 0051FCED    or          byte ptr [eax+3D4],2;TmwCustomEdit.fStatusChanges:TmwStatusChanges
 0051FCF4    mov         edx,dword ptr [ebp-4]
 0051FCF7    mov         edx,dword ptr [edx+28C];TmwCustomEdit.fCaretY:Integer
 0051FCFD    mov         eax,dword ptr [ebp-8]
 0051FD00    cmp         edx,eax
>0051FD02    je          0051FD17
 0051FD04    mov         edx,dword ptr [ebp-4]
 0051FD07    mov         dword ptr [edx+28C],eax;TmwCustomEdit.fCaretY:Integer
 0051FD0D    mov         eax,dword ptr [ebp-4]
 0051FD10    or          byte ptr [eax+3D4],4;TmwCustomEdit.fStatusChanges:TmwStatusChanges
 0051FD17    mov         eax,dword ptr [ebp-4]
 0051FD1A    call        TmwCustomEdit.EnsureCursorPosVisible
 0051FD1F    mov         eax,dword ptr [ebp-4]
 0051FD22    or          word ptr [eax+3CC],1;TmwCustomEdit.fStateFlags:TmwStateFlags
 0051FD2A    mov         eax,dword ptr [ebp-4]
 0051FD2D    or          word ptr [eax+3CC],2;TmwCustomEdit.fStateFlags:TmwStateFlags
 0051FD35    xor         eax,eax
 0051FD37    pop         edx
 0051FD38    pop         ecx
 0051FD39    pop         ecx
 0051FD3A    mov         dword ptr fs:[eax],edx
 0051FD3D    push        51FD52
 0051FD42    mov         eax,dword ptr [ebp-4]
 0051FD45    call        0051C458
 0051FD4A    ret
>0051FD4B    jmp         @HandleFinally
>0051FD50    jmp         0051FD42
 0051FD52    mov         eax,dword ptr [ebp-4]
 0051FD55    mov         edx,dword ptr [eax]
 0051FD57    call        dword ptr [edx+10C];TmwCustomEdit.sub_005279A4
 0051FD5D    xor         eax,eax
 0051FD5F    pop         edx
 0051FD60    pop         ecx
 0051FD61    pop         ecx
 0051FD62    mov         dword ptr fs:[eax],edx
 0051FD65    push        51FD7A
 0051FD6A    lea         eax,[ebp-10]
 0051FD6D    call        @UStrClr
 0051FD72    ret
>0051FD73    jmp         @HandleFinally
>0051FD78    jmp         0051FD6A
 0051FD7A    pop         edi
 0051FD7B    pop         esi
 0051FD7C    pop         ebx
 0051FD7D    mov         esp,ebp
 0051FD7F    pop         ebp
 0051FD80    ret
end;*}

//0051FD84
procedure TmwCustomEdit.SetFont(Value:TFont);
begin
{*
 0051FD84    push        ebx
 0051FD85    push        esi
 0051FD86    push        edi
 0051FD87    push        ebp
 0051FD88    add         esp,0FFFFFFC4
 0051FD8B    mov         edi,edx
 0051FD8D    mov         esi,eax
 0051FD8F    push        0
 0051FD91    call        user32.GetDC
 0051FD96    mov         ebx,eax
 0051FD98    mov         eax,edi
 0051FD9A    call        TFont.GetHandle
 0051FD9F    push        eax
 0051FDA0    push        ebx
 0051FDA1    call        gdi32.SelectObject
 0051FDA6    mov         ebp,eax
 0051FDA8    push        esp
 0051FDA9    push        ebx
 0051FDAA    call        gdi32.GetTextMetricsW
 0051FDAF    push        ebp
 0051FDB0    push        ebx
 0051FDB1    call        gdi32.SelectObject
 0051FDB6    push        ebx
 0051FDB7    push        0
 0051FDB9    call        user32.ReleaseDC
 0051FDBE    mov         eax,dword ptr [esp+14]
 0051FDC2    mov         edx,dword ptr [esp+18]
 0051FDC6    cmp         edx,eax
 0051FDC8    sete        al
 0051FDCB    sub         al,1
>0051FDCD    jb          0051FDDC
>0051FDCF    jne         0051FE22
 0051FDD1    mov         edx,edi
 0051FDD3    mov         eax,esi
 0051FDD5    call        TControl.SetFont
>0051FDDA    jmp         0051FE22
 0051FDDC    mov         ebx,dword ptr [esi+298];TmwCustomEdit.fFontDummy:TFont
 0051FDE2    mov         edx,dword ptr [edi+18];TFont.FColor:TColor
 0051FDE5    mov         eax,ebx
 0051FDE7    call        TFont.SetColor
 0051FDEC    mov         dl,2
 0051FDEE    mov         eax,ebx
 0051FDF0    call        TFont.SetPitch
 0051FDF5    mov         eax,edi
 0051FDF7    call        TFont.GetSize
 0051FDFC    mov         edx,eax
 0051FDFE    mov         eax,ebx
 0051FE00    call        TFont.SetSize
 0051FE05    mov         eax,dword ptr [edi+10];TFont.FResource:PResource
 0051FE08    movzx       eax,byte ptr [eax+21]
 0051FE0C    mov         edx,eax
 0051FE0E    mov         eax,ebx
 0051FE10    call        TFont.SetStyle
 0051FE15    mov         edx,dword ptr [esi+298];TmwCustomEdit.fFontDummy:TFont
 0051FE1B    mov         eax,esi
 0051FE1D    call        TControl.SetFont
 0051FE22    mov         eax,dword ptr [esi+3A4];TmwCustomEdit.fGutter:TmwGutter
 0051FE28    cmp         byte ptr [eax+0C],0;TmwGutter.fShowLineNumbers:Boolean
>0051FE2C    je          0051FE37
 0051FE2E    mov         edx,esi
 0051FE30    mov         eax,esi
 0051FE32    call        00527830
 0051FE37    add         esp,3C
 0051FE3A    pop         ebp
 0051FE3B    pop         edi
 0051FE3C    pop         esi
 0051FE3D    pop         ebx
 0051FE3E    ret
*}
end;

//0051FE40
procedure sub_0051FE40(?:TmwCustomEdit; ?:Integer);
begin
{*
 0051FE40    push        esi
 0051FE41    mov         esi,eax
 0051FE43    mov         eax,edx
 0051FE45    xor         edx,edx
 0051FE47    call        00510484
 0051FE4C    mov         edx,eax
 0051FE4E    cmp         edx,dword ptr [esi+29C]
>0051FE54    je          0051FEB1
 0051FE56    mov         eax,edx
 0051FE58    mov         dword ptr [esi+29C],eax
 0051FE5E    add         eax,2
 0051FE61    mov         edx,dword ptr [esi+2AC]
 0051FE67    imul        edx,dword ptr [esi+294]
 0051FE6E    sub         eax,edx
 0051FE70    mov         dword ptr [esi+2CC],eax
 0051FE76    mov         eax,esi
 0051FE78    call        TWinControl.HandleAllocated
 0051FE7D    test        al,al
>0051FE7F    je          0051FEB1
 0051FE81    mov         eax,esi
 0051FE83    call        TControl.GetClientWidth
 0051FE88    sub         eax,dword ptr [esi+29C]
 0051FE8E    sub         eax,2
 0051FE91    cdq
 0051FE92    idiv        eax,dword ptr [esi+294]
 0051FE98    mov         dword ptr [esi+290],eax
 0051FE9E    xor         edx,edx
 0051FEA0    mov         eax,esi
 0051FEA2    call        00521064
 0051FEA7    mov         eax,esi
 0051FEA9    mov         edx,dword ptr [eax]
 0051FEAB    call        dword ptr [edx+90]
 0051FEB1    pop         esi
 0051FEB2    ret
*}
end;

//0051FEB4
procedure sub_0051FEB4(?:TmwCustomEdit; ?:Integer);
begin
{*
 0051FEB4    push        ebx
 0051FEB5    push        esi
 0051FEB6    mov         esi,edx
 0051FEB8    mov         ebx,eax
 0051FEBA    mov         edx,dword ptr [ebx+2B0];TmwCustomEdit.fMaxLeftChar:Integer
 0051FEC0    sub         edx,dword ptr [ebx+290]
 0051FEC6    inc         edx
 0051FEC7    mov         eax,esi
 0051FEC9    call        0051048C
 0051FECE    dec         eax
 0051FECF    mov         esi,eax
 0051FED1    xor         edx,edx
 0051FED3    mov         eax,esi
 0051FED5    call        00510484
 0051FEDA    mov         esi,eax
 0051FEDC    cmp         esi,dword ptr [ebx+2AC];TmwCustomEdit.fLeftChar:Integer
>0051FEE2    je          0051FF28
 0051FEE4    mov         eax,esi
 0051FEE6    mov         dword ptr [ebx+2AC],eax;TmwCustomEdit.fLeftChar:Integer
 0051FEEC    mov         edx,dword ptr [ebx+29C];TmwCustomEdit.fGutterWidth:Integer
 0051FEF2    add         edx,2
 0051FEF5    imul        eax,dword ptr [ebx+294];TmwCustomEdit.fCharWidth:Integer
 0051FEFC    sub         edx,eax
 0051FEFE    mov         dword ptr [ebx+2CC],edx;TmwCustomEdit.fTextOffset:Integer
 0051FF04    xor         edx,edx
 0051FF06    mov         eax,ebx
 0051FF08    call        00521064
 0051FF0D    or          ecx,0FFFFFFFF
 0051FF10    or          edx,0FFFFFFFF
 0051FF13    mov         eax,ebx
 0051FF15    call        0051CD40
 0051FF1A    movzx       edx,byte ptr ds:[51FF2C];0x8 gvar_0051FF2C
 0051FF21    mov         eax,ebx
 0051FF23    call        005287FC
 0051FF28    pop         esi
 0051FF29    pop         ebx
 0051FF2A    ret
*}
end;

//0051FF30
procedure TmwCustomEdit.SetLines(Value:TStrings);
begin
{*
 0051FF30    push        esi
 0051FF31    push        edi
 0051FF32    mov         edi,edx
 0051FF34    mov         esi,eax
 0051FF36    mov         eax,esi
 0051FF38    call        TWinControl.HandleAllocated
 0051FF3D    test        al,al
>0051FF3F    je          0051FF4E
 0051FF41    mov         edx,edi
 0051FF43    mov         eax,dword ptr [esi+2A4];TmwCustomEdit.fLines:TStrings
 0051FF49    mov         ecx,dword ptr [eax]
 0051FF4B    call        dword ptr [ecx+8];TStrings.Assign
 0051FF4E    pop         edi
 0051FF4F    pop         esi
 0051FF50    ret
*}
end;

//0051FF54
{*procedure sub_0051FF54(?:TmwCustomEdit; ?:?);
begin
 0051FF54    push        ebp
 0051FF55    mov         ebp,esp
 0051FF57    push        ecx
 0051FF58    push        ebx
 0051FF59    mov         dword ptr [ebp-4],edx
 0051FF5C    mov         ebx,eax
 0051FF5E    mov         eax,dword ptr [ebp-4]
 0051FF61    call        @UStrAddRef
 0051FF66    xor         eax,eax
 0051FF68    push        ebp
 0051FF69    push        51FFC1
 0051FF6E    push        dword ptr fs:[eax]
 0051FF71    mov         dword ptr fs:[eax],esp
 0051FF74    mov         eax,dword ptr [ebx+2A4]
 0051FF7A    mov         edx,dword ptr [eax]
 0051FF7C    call        dword ptr [edx+14]
 0051FF7F    test        eax,eax
>0051FF81    jle         0051FFAB
 0051FF83    mov         eax,dword ptr [ebx+2A4]
 0051FF89    mov         edx,dword ptr [eax]
 0051FF8B    call        dword ptr [edx+14]
 0051FF8E    dec         eax
 0051FF8F    cmp         eax,dword ptr [ebx+28C]
>0051FF95    jl          0051FFAB
 0051FF97    mov         ecx,dword ptr [ebp-4]
 0051FF9A    mov         edx,dword ptr [ebx+28C]
 0051FFA0    mov         eax,dword ptr [ebx+2A4]
 0051FFA6    mov         ebx,dword ptr [eax]
 0051FFA8    call        dword ptr [ebx+20]
 0051FFAB    xor         eax,eax
 0051FFAD    pop         edx
 0051FFAE    pop         ecx
 0051FFAF    pop         ecx
 0051FFB0    mov         dword ptr fs:[eax],edx
 0051FFB3    push        51FFC8
 0051FFB8    lea         eax,[ebp-4]
 0051FFBB    call        @UStrClr
 0051FFC0    ret
>0051FFC1    jmp         @HandleFinally
>0051FFC6    jmp         0051FFB8
 0051FFC8    pop         ebx
 0051FFC9    pop         ecx
 0051FFCA    pop         ebp
 0051FFCB    ret
end;*}

//0051FFCC
procedure TmwCustomEdit.SetName(Value:TComponentName);
begin
{*
 0051FFCC    push        ebp
 0051FFCD    mov         ebp,esp
 0051FFCF    push        0
 0051FFD1    push        0
 0051FFD3    push        0
 0051FFD5    push        ebx
 0051FFD6    push        esi
 0051FFD7    mov         esi,edx
 0051FFD9    mov         ebx,eax
 0051FFDB    xor         eax,eax
 0051FFDD    push        ebp
 0051FFDE    push        52004F
 0051FFE3    push        dword ptr fs:[eax]
 0051FFE6    mov         dword ptr fs:[eax],esp
 0051FFE9    lea         eax,[ebp-4]
 0051FFEC    mov         edx,dword ptr [ebx+8];TmwCustomEdit.FName:TComponentName
 0051FFEF    call        @UStrLAsg
 0051FFF4    mov         edx,esi
 0051FFF6    mov         eax,ebx
 0051FFF8    call        TControl.SetName
 0051FFFD    test        byte ptr [ebx+1C],10;TmwCustomEdit.FComponentState:TComponentState
>00520001    je          00520034
 00520003    test        byte ptr [ebx+1C],1;TmwCustomEdit.FComponentState:TComponentState
>00520007    jne         00520034
 00520009    lea         edx,[ebp-0C]
 0052000C    mov         eax,ebx
 0052000E    call        0051CB9C
 00520013    mov         eax,dword ptr [ebp-0C]
 00520016    lea         edx,[ebp-8]
 00520019    call        TrimRight
 0052001E    mov         edx,dword ptr [ebp-8]
 00520021    mov         eax,dword ptr [ebp-4]
 00520024    call        @UStrEqual
>00520029    jne         00520034
 0052002B    mov         edx,esi
 0052002D    mov         eax,ebx
 0052002F    call        00520EA8
 00520034    xor         eax,eax
 00520036    pop         edx
 00520037    pop         ecx
 00520038    pop         ecx
 00520039    mov         dword ptr fs:[eax],edx
 0052003C    push        520056
 00520041    lea         eax,[ebp-0C]
 00520044    mov         edx,3
 00520049    call        @UStrArrayClr
 0052004E    ret
>0052004F    jmp         @HandleFinally
>00520054    jmp         00520041
 00520056    pop         esi
 00520057    pop         ebx
 00520058    mov         esp,ebp
 0052005A    pop         ebp
 0052005B    ret
*}
end;

//0052005C
procedure TmwCustomEdit.SetScrollBars(Value:TScrollStyle);
begin
{*
 0052005C    push        esi
 0052005D    mov         esi,eax
 0052005F    cmp         dl,byte ptr [esi+2C4];TmwCustomEdit.FScrollBars:TScrollStyle
>00520065    je          00520087
 00520067    mov         byte ptr [esi+2C4],dl;TmwCustomEdit.FScrollBars:TScrollStyle
 0052006D    mov         eax,esi
 0052006F    call        TWinControl.RecreateWnd
 00520074    xor         edx,edx
 00520076    mov         eax,esi
 00520078    call        00521064
 0052007D    mov         eax,esi
 0052007F    mov         edx,dword ptr [eax]
 00520081    call        dword ptr [edx+90];TWinControl.Invalidate
 00520087    pop         esi
 00520088    ret
*}
end;

//0052008C
procedure sub_0052008C(?:TmwCustomEdit; ?:UnicodeString);
begin
{*
 0052008C    push        ebx
 0052008D    push        esi
 0052008E    mov         esi,edx
 00520090    mov         ebx,eax
 00520092    push        0
 00520094    mov         eax,esi
 00520096    call        @UStrToPWChar
 0052009B    mov         ecx,eax
 0052009D    xor         edx,edx
 0052009F    mov         eax,ebx
 005200A1    call        00520D98
 005200A6    pop         esi
 005200A7    pop         ebx
 005200A8    ret
*}
end;

//005200AC
{*procedure sub_005200AC(?:?);
begin
 005200AC    push        ebp
 005200AD    mov         ebp,esp
 005200AF    mov         ecx,6
 005200B4    push        0
 005200B6    push        0
 005200B8    dec         ecx
>005200B9    jne         005200B4
 005200BB    push        ecx
 005200BC    push        ebx
 005200BD    push        esi
 005200BE    push        edi
 005200BF    xor         eax,eax
 005200C1    push        ebp
 005200C2    push        520467
 005200C7    push        dword ptr fs:[eax]
 005200CA    mov         dword ptr fs:[eax],esp
 005200CD    mov         byte ptr [ebp-5],0
 005200D1    xor         eax,eax
 005200D3    mov         dword ptr [ebp-4],eax
 005200D6    mov         eax,dword ptr [ebp+8]
 005200D9    mov         eax,dword ptr [eax-18]
 005200DC    movzx       eax,byte ptr [eax+390]
 005200E3    sub         al,1
>005200E5    jb          005200FA
>005200E7    je          00520201
 005200ED    dec         al
>005200EF    je          005202CB
>005200F5    jmp         00520382
 005200FA    lea         eax,[ebp-1C]
 005200FD    push        eax
 005200FE    lea         ecx,[ebp-20]
 00520101    mov         eax,dword ptr [ebp+8]
 00520104    mov         edx,dword ptr [eax-0C]
 00520107    dec         edx
 00520108    mov         eax,dword ptr [ebp+8]
 0052010B    mov         eax,dword ptr [eax-18]
 0052010E    mov         eax,dword ptr [eax+2A4]
 00520114    mov         ebx,dword ptr [eax]
 00520116    call        dword ptr [ebx+0C]
 00520119    mov         eax,dword ptr [ebp-20]
 0052011C    mov         edx,dword ptr [ebp+8]
 0052011F    mov         edx,dword ptr [edx-10]
 00520122    mov         ecx,7FFFFFFF
 00520127    call        @UStrCopy
 0052012C    mov         eax,dword ptr [ebp-1C]
 0052012F    push        eax
 00520130    lea         eax,[ebp-24]
 00520133    push        eax
 00520134    lea         ecx,[ebp-28]
 00520137    mov         eax,dword ptr [ebp+8]
 0052013A    mov         edx,dword ptr [eax-4]
 0052013D    dec         edx
 0052013E    mov         eax,dword ptr [ebp+8]
 00520141    mov         eax,dword ptr [eax-18]
 00520144    mov         eax,dword ptr [eax+2A4]
 0052014A    mov         ebx,dword ptr [eax]
 0052014C    call        dword ptr [ebx+0C]
 0052014F    mov         eax,dword ptr [ebp-28]
 00520152    mov         edx,dword ptr [ebp+8]
 00520155    mov         ecx,dword ptr [edx-8]
 00520158    dec         ecx
 00520159    mov         edx,1
 0052015E    call        @UStrCopy
 00520163    mov         edx,dword ptr [ebp-24]
 00520166    mov         eax,dword ptr [ebp+8]
 00520169    add         eax,0FFFFFFEC
 0052016C    pop         ecx
 0052016D    call        @UStrCat3
 00520172    mov         eax,dword ptr [ebp+8]
 00520175    mov         ebx,dword ptr [eax-0C]
 00520178    dec         ebx
 00520179    mov         eax,dword ptr [ebp+8]
 0052017C    mov         esi,dword ptr [eax-4]
 0052017F    sub         esi,ebx
>00520181    jg          0052019B
 00520183    dec         esi
 00520184    mov         eax,dword ptr [ebp+8]
 00520187    mov         eax,dword ptr [eax-18]
 0052018A    mov         eax,dword ptr [eax+2A4]
 00520190    mov         edx,ebx
 00520192    mov         ecx,dword ptr [eax]
 00520194    call        dword ptr [ecx+48]
 00520197    dec         ebx
 00520198    inc         esi
>00520199    jne         00520184
 0052019B    mov         eax,dword ptr [ebp+8]
 0052019E    mov         eax,dword ptr [eax-18]
 005201A1    test        byte ptr [eax+3CE],40
>005201A8    je          005201C6
 005201AA    lea         edx,[ebp-2C]
 005201AD    mov         eax,dword ptr [ebp+8]
 005201B0    mov         eax,dword ptr [eax-14]
 005201B3    call        TrimRight
 005201B8    mov         edx,dword ptr [ebp-2C]
 005201BB    mov         eax,dword ptr [ebp+8]
 005201BE    add         eax,0FFFFFFEC
 005201C1    call        @UStrLAsg
 005201C6    mov         eax,dword ptr [ebp+8]
 005201C9    mov         ecx,dword ptr [eax-14]
 005201CC    mov         eax,dword ptr [ebp+8]
 005201CF    mov         edx,dword ptr [eax-4]
 005201D2    dec         edx
 005201D3    mov         eax,dword ptr [ebp+8]
 005201D6    mov         eax,dword ptr [eax-18]
 005201D9    mov         eax,dword ptr [eax+2A4]
 005201DF    mov         ebx,dword ptr [eax]
 005201E1    call        dword ptr [ebx+20]
 005201E4    mov         byte ptr [ebp-5],1
 005201E8    mov         eax,dword ptr [ebp+8]
 005201EB    lea         edx,[eax-8]
 005201EE    mov         eax,dword ptr [ebp+8]
 005201F1    mov         eax,dword ptr [eax-18]
 005201F4    mov         ecx,dword ptr [eax]
 005201F6    call        dword ptr [ecx+110]
>005201FC    jmp         00520382
 00520201    mov         eax,dword ptr [ebp+8]
 00520204    mov         eax,dword ptr [eax-8]
 00520207    mov         edx,dword ptr [ebp+8]
 0052020A    cmp         eax,dword ptr [edx-10]
>0052020D    jle         00520220
 0052020F    mov         eax,dword ptr [ebp+8]
 00520212    lea         edx,[eax-10]
 00520215    mov         eax,dword ptr [ebp+8]
 00520218    add         eax,0FFFFFFF8
 0052021B    call        005104A4
 00520220    mov         eax,dword ptr [ebp+8]
 00520223    mov         ebx,dword ptr [eax-4]
 00520226    dec         ebx
 00520227    mov         eax,dword ptr [ebp+8]
 0052022A    mov         esi,dword ptr [eax-0C]
 0052022D    dec         esi
 0052022E    sub         esi,ebx
>00520230    jl          0052029D
 00520232    inc         esi
 00520233    lea         ecx,[ebp-30]
 00520236    mov         eax,dword ptr [ebp+8]
 00520239    mov         eax,dword ptr [eax-18]
 0052023C    mov         eax,dword ptr [eax+2A4]
 00520242    mov         edx,ebx
 00520244    mov         edi,dword ptr [eax]
 00520246    call        dword ptr [edi+0C]
 00520249    mov         edx,dword ptr [ebp-30]
 0052024C    mov         eax,dword ptr [ebp+8]
 0052024F    add         eax,0FFFFFFEC
 00520252    call        @UStrLAsg
 00520257    mov         edx,dword ptr [ebp+8]
 0052025A    mov         ecx,dword ptr [edx-10]
 0052025D    mov         eax,dword ptr [ebp+8]
 00520260    mov         eax,dword ptr [eax-8]
 00520263    sub         ecx,eax
 00520265    mov         edx,dword ptr [ebp+8]
 00520268    mov         edx,eax
 0052026A    mov         eax,dword ptr [ebp+8]
 0052026D    add         eax,0FFFFFFEC
 00520270    call        @UStrDelete
 00520275    lea         edx,[ebp-34]
 00520278    mov         eax,dword ptr [ebp+8]
 0052027B    mov         eax,dword ptr [eax-14]
 0052027E    call        TrimRight
 00520283    mov         ecx,dword ptr [ebp-34]
 00520286    mov         eax,dword ptr [ebp+8]
 00520289    mov         eax,dword ptr [eax-18]
 0052028C    mov         eax,dword ptr [eax+2A4]
 00520292    mov         edx,ebx
 00520294    mov         edi,dword ptr [eax]
 00520296    call        dword ptr [edi+20]
 00520299    inc         ebx
 0052029A    dec         esi
>0052029B    jne         00520233
 0052029D    mov         eax,dword ptr [ebp+8]
 005202A0    mov         eax,dword ptr [eax-8]
 005202A3    mov         edx,dword ptr [ebp+8]
 005202A6    mov         edx,dword ptr [edx-18]
 005202A9    mov         edx,dword ptr [edx+284]
 005202AF    mov         dword ptr [ebp-10],eax
 005202B2    mov         dword ptr [ebp-0C],edx
 005202B5    mov         eax,dword ptr [ebp+8]
 005202B8    mov         eax,dword ptr [eax-18]
 005202BB    lea         edx,[ebp-10]
 005202BE    mov         ecx,dword ptr [eax]
 005202C0    call        dword ptr [ecx+110]
>005202C6    jmp         00520382
 005202CB    mov         eax,dword ptr [ebp+8]
 005202CE    mov         eax,dword ptr [eax-18]
 005202D1    mov         eax,dword ptr [eax+2A4]
 005202D7    mov         edx,dword ptr [eax]
 005202D9    call        dword ptr [edx+14]
 005202DC    mov         edx,dword ptr [ebp+8]
 005202DF    cmp         eax,dword ptr [edx-0C]
>005202E2    jne         0052032C
 005202E4    mov         eax,dword ptr [ebp+8]
 005202E7    mov         edx,dword ptr [eax-0C]
 005202EA    dec         edx
 005202EB    mov         eax,dword ptr [ebp+8]
 005202EE    mov         eax,dword ptr [eax-18]
 005202F1    mov         eax,dword ptr [eax+2A4]
 005202F7    xor         ecx,ecx
 005202F9    mov         ebx,dword ptr [eax]
 005202FB    call        dword ptr [ebx+20]
 005202FE    mov         eax,dword ptr [ebp+8]
 00520301    mov         ebx,dword ptr [eax-0C]
 00520304    sub         ebx,2
 00520307    mov         eax,dword ptr [ebp+8]
 0052030A    mov         esi,dword ptr [eax-4]
 0052030D    dec         esi
 0052030E    sub         esi,ebx
>00520310    jg          00520356
 00520312    dec         esi
 00520313    mov         eax,dword ptr [ebp+8]
 00520316    mov         eax,dword ptr [eax-18]
 00520319    mov         eax,dword ptr [eax+2A4]
 0052031F    mov         edx,ebx
 00520321    mov         ecx,dword ptr [eax]
 00520323    call        dword ptr [ecx+48]
 00520326    dec         ebx
 00520327    inc         esi
>00520328    jne         00520313
>0052032A    jmp         00520356
 0052032C    mov         eax,dword ptr [ebp+8]
 0052032F    mov         ebx,dword ptr [eax-0C]
 00520332    dec         ebx
 00520333    mov         eax,dword ptr [ebp+8]
 00520336    mov         esi,dword ptr [eax-4]
 00520339    dec         esi
 0052033A    sub         esi,ebx
>0052033C    jg          00520356
 0052033E    dec         esi
 0052033F    mov         eax,dword ptr [ebp+8]
 00520342    mov         eax,dword ptr [eax-18]
 00520345    mov         eax,dword ptr [eax+2A4]
 0052034B    mov         edx,ebx
 0052034D    mov         ecx,dword ptr [eax]
 0052034F    call        dword ptr [ecx+48]
 00520352    dec         ebx
 00520353    inc         esi
>00520354    jne         0052033F
 00520356    mov         eax,dword ptr [ebp+8]
 00520359    mov         eax,dword ptr [eax-4]
 0052035C    mov         dword ptr [ebp-18],1
 00520363    mov         dword ptr [ebp-14],eax
 00520366    mov         eax,dword ptr [ebp+8]
 00520369    mov         eax,dword ptr [eax-18]
 0052036C    lea         edx,[ebp-18]
 0052036F    mov         ecx,dword ptr [eax]
 00520371    call        dword ptr [ecx+110]
 00520377    mov         byte ptr [ebp-5],1
 0052037B    mov         dword ptr [ebp-4],1
 00520382    cmp         byte ptr [ebp-5],0
>00520386    je          0052044C
 0052038C    mov         eax,dword ptr [ebp+8]
 0052038F    mov         eax,dword ptr [eax-18]
 00520392    mov         eax,dword ptr [eax+370]
 00520398    mov         esi,dword ptr [eax+8]
 0052039B    dec         esi
 0052039C    test        esi,esi
>0052039E    jl          0052044C
 005203A4    inc         esi
 005203A5    xor         ebx,ebx
 005203A7    mov         eax,dword ptr [ebp+8]
 005203AA    mov         eax,dword ptr [eax-18]
 005203AD    mov         eax,dword ptr [eax+370]
 005203B3    mov         edx,ebx
 005203B5    call        00529C58
 005203BA    mov         eax,dword ptr [eax+4]
 005203BD    mov         edx,dword ptr [ebp+8]
 005203C0    cmp         eax,dword ptr [edx-0C]
>005203C3    jl          00520408
 005203C5    mov         eax,dword ptr [ebp+8]
 005203C8    mov         eax,dword ptr [eax-18]
 005203CB    mov         eax,dword ptr [eax+370]
 005203D1    mov         edx,ebx
 005203D3    call        00529C58
 005203D8    mov         eax,dword ptr [eax+4]
 005203DB    mov         edx,dword ptr [ebp+8]
 005203DE    mov         edx,dword ptr [edx-0C]
 005203E1    mov         ecx,dword ptr [ebp+8]
 005203E4    sub         edx,dword ptr [ecx-4]
 005203E7    sub         eax,edx
 005203E9    sub         eax,dword ptr [ebp-4]
 005203EC    push        eax
 005203ED    mov         eax,dword ptr [ebp+8]
 005203F0    mov         eax,dword ptr [eax-18]
 005203F3    mov         eax,dword ptr [eax+370]
 005203F9    mov         edx,ebx
 005203FB    call        00529C58
 00520400    pop         edx
 00520401    mov         ecx,dword ptr [eax]
 00520403    call        dword ptr [ecx+0C]
>00520406    jmp         00520444
 00520408    mov         eax,dword ptr [ebp+8]
 0052040B    mov         eax,dword ptr [eax-18]
 0052040E    mov         eax,dword ptr [eax+370]
 00520414    mov         edx,ebx
 00520416    call        00529C58
 0052041B    mov         eax,dword ptr [eax+4]
 0052041E    mov         edx,dword ptr [ebp+8]
 00520421    cmp         eax,dword ptr [edx-4]
>00520424    jle         00520444
 00520426    mov         eax,dword ptr [ebp+8]
 00520429    mov         eax,dword ptr [eax-18]
 0052042C    mov         eax,dword ptr [eax+370]
 00520432    mov         edx,ebx
 00520434    call        00529C58
 00520439    mov         edx,dword ptr [ebp+8]
 0052043C    mov         edx,dword ptr [edx-4]
 0052043F    mov         ecx,dword ptr [eax]
 00520441    call        dword ptr [ecx+0C]
 00520444    inc         ebx
 00520445    dec         esi
>00520446    jne         005203A7
 0052044C    xor         eax,eax
 0052044E    pop         edx
 0052044F    pop         ecx
 00520450    pop         ecx
 00520451    mov         dword ptr fs:[eax],edx
 00520454    push        52046E
 00520459    lea         eax,[ebp-34]
 0052045C    mov         edx,7
 00520461    call        @UStrArrayClr
 00520466    ret
>00520467    jmp         @HandleFinally
>0052046C    jmp         00520459
 0052046E    pop         edi
 0052046F    pop         esi
 00520470    pop         ebx
 00520471    mov         esp,ebp
 00520473    pop         ebp
 00520474    ret
end;*}

//00520478
{*function sub_00520478(?:?):?;
begin
 00520478    push        ebp
 00520479    mov         ebp,esp
 0052047B    mov         ecx,8
 00520480    push        0
 00520482    push        0
 00520484    dec         ecx
>00520485    jne         00520480
 00520487    push        ebx
 00520488    push        esi
 00520489    xor         eax,eax
 0052048B    push        ebp
 0052048C    push        52084E
 00520491    push        dword ptr fs:[eax]
 00520494    mov         dword ptr fs:[eax],esp
 00520497    xor         eax,eax
 00520499    mov         dword ptr [ebp-14],eax
 0052049C    lea         eax,[ebp-4]
 0052049F    push        eax
 005204A0    lea         edx,[ebp-18]
 005204A3    mov         eax,dword ptr [ebp+8]
 005204A6    mov         eax,dword ptr [eax+8]
 005204A9    mov         eax,dword ptr [eax-18]
 005204AC    call        0051C6C8
 005204B1    mov         eax,dword ptr [ebp-18]
 005204B4    push        eax
 005204B5    mov         eax,dword ptr [ebp+8]
 005204B8    mov         eax,dword ptr [eax+8]
 005204BB    mov         eax,dword ptr [eax-18]
 005204BE    call        0051C628
 005204C3    mov         ecx,eax
 005204C5    dec         ecx
 005204C6    mov         edx,1
 005204CB    pop         eax
 005204CC    call        @UStrCopy
 005204D1    mov         edx,dword ptr [ebp-4]
 005204D4    mov         eax,edx
 005204D6    test        eax,eax
>005204D8    je          005204DF
 005204DA    sub         eax,4
 005204DD    mov         eax,dword ptr [eax]
 005204DF    mov         ecx,dword ptr [ebp+8]
 005204E2    mov         ecx,dword ptr [ecx+8]
 005204E5    mov         ecx,dword ptr [ecx-18]
 005204E8    mov         esi,dword ptr [ecx+288]
 005204EE    cmp         eax,esi
>005204F0    jge         0052051E
 005204F2    mov         ebx,edx
 005204F4    test        ebx,ebx
>005204F6    je          005204FD
 005204F8    sub         ebx,4
 005204FB    mov         ebx,dword ptr [ebx]
 005204FD    lea         ecx,[ebp-1C]
 00520500    mov         eax,dword ptr [ebp+8]
 00520503    mov         eax,dword ptr [eax+8]
 00520506    mov         edx,esi
 00520508    sub         edx,ebx
 0052050A    mov         ax,20
 0052050E    call        StringOfChar
 00520513    mov         edx,dword ptr [ebp-1C]
 00520516    lea         eax,[ebp-4]
 00520519    call        @UStrCat
 0052051E    lea         edx,[ebp-10]
 00520521    mov         eax,dword ptr [ebp+8]
 00520524    mov         eax,dword ptr [eax+8]
 00520527    mov         eax,dword ptr [eax-18]
 0052052A    call        0051C6C8
 0052052F    mov         eax,dword ptr [ebp+8]
 00520532    mov         eax,dword ptr [eax+8]
 00520535    mov         eax,dword ptr [eax-18]
 00520538    call        0051C628
 0052053D    mov         esi,eax
 0052053F    lea         edx,[ebp-20]
 00520542    mov         eax,dword ptr [ebp+8]
 00520545    mov         eax,dword ptr [eax+8]
 00520548    mov         eax,dword ptr [eax-18]
 0052054B    call        0051C6C8
 00520550    mov         eax,dword ptr [ebp-20]
 00520553    mov         dword ptr [ebp-24],eax
 00520556    mov         ebx,dword ptr [ebp-24]
 00520559    test        ebx,ebx
>0052055B    je          00520562
 0052055D    sub         ebx,4
 00520560    mov         ebx,dword ptr [ebx]
 00520562    lea         eax,[ebp-8]
 00520565    push        eax
 00520566    mov         eax,dword ptr [ebp+8]
 00520569    mov         eax,dword ptr [eax+8]
 0052056C    mov         eax,dword ptr [eax-18]
 0052056F    call        0051C628
 00520574    dec         eax
 00520575    mov         ecx,ebx
 00520577    sub         ecx,eax
 00520579    mov         edx,esi
 0052057B    mov         eax,dword ptr [ebp-10]
 0052057E    call        @UStrCopy
 00520583    mov         eax,dword ptr [ebp+8]
 00520586    mov         eax,dword ptr [eax+8]
 00520589    mov         esi,dword ptr [eax-1C]
 0052058C    mov         eax,esi
 0052058E    call        00510818
 00520593    mov         ebx,eax
 00520595    cmp         esi,ebx
>00520597    jne         005205C4
 00520599    mov         eax,dword ptr [ebp+8]
 0052059C    mov         eax,dword ptr [eax+8]
 0052059F    mov         eax,dword ptr [eax-18]
 005205A2    mov         edx,dword ptr [eax+28C]
 005205A8    mov         eax,dword ptr [ebp+8]
 005205AB    mov         eax,dword ptr [eax+8]
 005205AE    mov         eax,dword ptr [eax-18]
 005205B1    mov         eax,dword ptr [eax+2A4]
 005205B7    mov         ecx,dword ptr [ebp-4]
 005205BA    mov         esi,dword ptr [eax]
 005205BC    call        dword ptr [esi+20]
>005205BF    jmp         005207A5
 005205C4    cmp         word ptr [ebx],0
>005205C8    je          00520630
 005205CA    lea         eax,[ebp-2C]
 005205CD    push        eax
 005205CE    lea         eax,[ebp-30]
 005205D1    mov         edx,dword ptr [ebp+8]
 005205D4    mov         edx,dword ptr [edx+8]
 005205D7    mov         edx,dword ptr [edx-1C]
 005205DA    call        @UStrFromPWChar
 005205DF    mov         eax,dword ptr [ebp-30]
 005205E2    mov         ecx,ebx
 005205E4    sub         ecx,esi
 005205E6    sar         ecx,1
>005205E8    jns         005205ED
 005205EA    adc         ecx,0
 005205ED    mov         edx,1
 005205F2    call        @UStrCopy
 005205F7    mov         ecx,dword ptr [ebp-2C]
 005205FA    lea         eax,[ebp-28]
 005205FD    mov         edx,dword ptr [ebp-4]
 00520600    call        @UStrCat3
 00520605    mov         ecx,dword ptr [ebp-28]
 00520608    mov         eax,dword ptr [ebp+8]
 0052060B    mov         eax,dword ptr [eax+8]
 0052060E    mov         eax,dword ptr [eax-18]
 00520611    mov         edx,dword ptr [eax+28C]
 00520617    mov         eax,dword ptr [ebp+8]
 0052061A    mov         eax,dword ptr [eax+8]
 0052061D    mov         eax,dword ptr [eax-18]
 00520620    mov         eax,dword ptr [eax+2A4]
 00520626    mov         esi,dword ptr [eax]
 00520628    call        dword ptr [esi+20]
>0052062B    jmp         005207A5
 00520630    push        dword ptr [ebp-4]
 00520633    lea         eax,[ebp-38]
 00520636    mov         edx,dword ptr [ebp+8]
 00520639    mov         edx,dword ptr [edx+8]
 0052063C    mov         edx,dword ptr [edx-1C]
 0052063F    call        @UStrFromPWChar
 00520644    push        dword ptr [ebp-38]
 00520647    push        dword ptr [ebp-8]
 0052064A    lea         eax,[ebp-34]
 0052064D    mov         edx,3
 00520652    call        @UStrCatN
 00520657    mov         ecx,dword ptr [ebp-34]
 0052065A    mov         eax,dword ptr [ebp+8]
 0052065D    mov         eax,dword ptr [eax+8]
 00520660    mov         eax,dword ptr [eax-18]
 00520663    mov         edx,dword ptr [eax+28C]
 00520669    mov         eax,dword ptr [ebp+8]
 0052066C    mov         eax,dword ptr [eax+8]
 0052066F    mov         eax,dword ptr [eax-18]
 00520672    mov         eax,dword ptr [eax+2A4]
 00520678    mov         esi,dword ptr [eax]
 0052067A    call        dword ptr [esi+20]
>0052067D    jmp         005207A5
 00520682    cmp         word ptr [ebx],0D
>00520686    jne         0052068B
 00520688    add         ebx,2
 0052068B    cmp         word ptr [ebx],0A
>0052068F    jne         00520694
 00520691    add         ebx,2
 00520694    mov         eax,dword ptr [ebp+8]
 00520697    mov         eax,dword ptr [eax+8]
 0052069A    mov         eax,dword ptr [eax-18]
 0052069D    inc         dword ptr [eax+28C]
 005206A3    mov         esi,ebx
 005206A5    mov         eax,esi
 005206A7    call        00510818
 005206AC    mov         ebx,eax
 005206AE    cmp         esi,ebx
>005206B0    jne         0052070D
 005206B2    cmp         word ptr [ebx],0
>005206B6    je          005206E2
 005206B8    mov         eax,dword ptr [ebp+8]
 005206BB    mov         eax,dword ptr [eax+8]
 005206BE    mov         eax,dword ptr [eax-18]
 005206C1    mov         edx,dword ptr [eax+28C]
 005206C7    mov         eax,dword ptr [ebp+8]
 005206CA    mov         eax,dword ptr [eax+8]
 005206CD    mov         eax,dword ptr [eax-18]
 005206D0    mov         eax,dword ptr [eax+2A4]
 005206D6    xor         ecx,ecx
 005206D8    mov         esi,dword ptr [eax]
 005206DA    call        dword ptr [esi+60]
>005206DD    jmp         005207A2
 005206E2    mov         eax,dword ptr [ebp+8]
 005206E5    mov         eax,dword ptr [eax+8]
 005206E8    mov         eax,dword ptr [eax-18]
 005206EB    mov         edx,dword ptr [eax+28C]
 005206F1    mov         eax,dword ptr [ebp+8]
 005206F4    mov         eax,dword ptr [eax+8]
 005206F7    mov         eax,dword ptr [eax-18]
 005206FA    mov         eax,dword ptr [eax+2A4]
 00520700    mov         ecx,dword ptr [ebp-8]
 00520703    mov         esi,dword ptr [eax]
 00520705    call        dword ptr [esi+60]
>00520708    jmp         005207A2
 0052070D    mov         edx,ebx
 0052070F    sub         edx,esi
 00520711    sar         edx,1
>00520713    jns         00520718
 00520715    adc         edx,0
 00520718    lea         eax,[ebp-0C]
 0052071B    call        @UStrSetLength
 00520720    lea         eax,[ebp-0C]
 00520723    call        @UniqueStringU
 00520728    mov         edx,eax
 0052072A    mov         eax,ebx
 0052072C    sub         eax,esi
 0052072E    sar         eax,1
>00520730    jns         00520735
 00520732    adc         eax,0
 00520735    mov         ecx,eax
 00520737    add         ecx,ecx
 00520739    mov         eax,esi
 0052073B    call        Move
 00520740    cmp         word ptr [ebx],0
>00520744    je          0052076E
 00520746    mov         eax,dword ptr [ebp+8]
 00520749    mov         eax,dword ptr [eax+8]
 0052074C    mov         eax,dword ptr [eax-18]
 0052074F    mov         edx,dword ptr [eax+28C]
 00520755    mov         eax,dword ptr [ebp+8]
 00520758    mov         eax,dword ptr [eax+8]
 0052075B    mov         eax,dword ptr [eax-18]
 0052075E    mov         eax,dword ptr [eax+2A4]
 00520764    mov         ecx,dword ptr [ebp-0C]
 00520767    mov         esi,dword ptr [eax]
 00520769    call        dword ptr [esi+60]
>0052076C    jmp         005207A2
 0052076E    lea         eax,[ebp-3C]
 00520771    mov         ecx,dword ptr [ebp-8]
 00520774    mov         edx,dword ptr [ebp-0C]
 00520777    call        @UStrCat3
 0052077C    mov         ecx,dword ptr [ebp-3C]
 0052077F    mov         eax,dword ptr [ebp+8]
 00520782    mov         eax,dword ptr [eax+8]
 00520785    mov         eax,dword ptr [eax-18]
 00520788    mov         edx,dword ptr [eax+28C]
 0052078E    mov         eax,dword ptr [ebp+8]
 00520791    mov         eax,dword ptr [eax+8]
 00520794    mov         eax,dword ptr [eax-18]
 00520797    mov         eax,dword ptr [eax+2A4]
 0052079D    mov         esi,dword ptr [eax]
 0052079F    call        dword ptr [esi+60]
 005207A2    inc         dword ptr [ebp-14]
 005207A5    cmp         word ptr [ebx],0
>005207A9    jne         00520682
 005207AF    lea         ecx,[ebp-40]
 005207B2    mov         eax,dword ptr [ebp+8]
 005207B5    mov         eax,dword ptr [eax+8]
 005207B8    mov         eax,dword ptr [eax-18]
 005207BB    mov         edx,dword ptr [eax+28C]
 005207C1    mov         eax,dword ptr [ebp+8]
 005207C4    mov         eax,dword ptr [eax+8]
 005207C7    mov         eax,dword ptr [eax-18]
 005207CA    mov         eax,dword ptr [eax+2A4]
 005207D0    mov         ebx,dword ptr [eax]
 005207D2    call        dword ptr [ebx+0C]
 005207D5    mov         eax,dword ptr [ebp-40]
 005207D8    mov         dword ptr [ebp-24],eax
 005207DB    mov         eax,dword ptr [ebp-24]
 005207DE    test        eax,eax
>005207E0    je          005207E7
 005207E2    sub         eax,4
 005207E5    mov         eax,dword ptr [eax]
 005207E7    mov         edx,dword ptr [ebp-8]
 005207EA    test        edx,edx
>005207EC    je          005207F3
 005207EE    sub         edx,4
 005207F1    mov         edx,dword ptr [edx]
 005207F3    sub         eax,edx
 005207F5    mov         edx,dword ptr [ebp+8]
 005207F8    mov         edx,dword ptr [edx+8]
 005207FB    mov         edx,dword ptr [edx-18]
 005207FE    mov         dword ptr [edx+288],eax
 00520804    mov         eax,dword ptr [ebp+8]
 00520807    mov         eax,dword ptr [eax+8]
 0052080A    mov         eax,dword ptr [eax-18]
 0052080D    movzx       edx,byte ptr ds:[520860];0x2 gvar_00520860
 00520814    call        005287FC
 00520819    xor         eax,eax
 0052081B    pop         edx
 0052081C    pop         ecx
 0052081D    pop         ecx
 0052081E    mov         dword ptr fs:[eax],edx
 00520821    push        520855
 00520826    lea         eax,[ebp-40]
 00520829    mov         edx,7
 0052082E    call        @UStrArrayClr
 00520833    lea         eax,[ebp-20]
 00520836    mov         edx,3
 0052083B    call        @UStrArrayClr
 00520840    lea         eax,[ebp-10]
 00520843    mov         edx,4
 00520848    call        @UStrArrayClr
 0052084D    ret
>0052084E    jmp         @HandleFinally
>00520853    jmp         00520826
 00520855    mov         eax,dword ptr [ebp-14]
 00520858    pop         esi
 00520859    pop         ebx
 0052085A    mov         esp,ebp
 0052085C    pop         ebp
 0052085D    ret
end;*}

//00520864
{*function sub_00520864(?:?):?;
begin
 00520864    push        ebp
 00520865    mov         ebp,esp
 00520867    xor         ecx,ecx
 00520869    push        ecx
 0052086A    push        ecx
 0052086B    push        ecx
 0052086C    push        ecx
 0052086D    push        ecx
 0052086E    push        ecx
 0052086F    push        ebx
 00520870    push        esi
 00520871    push        edi
 00520872    xor         eax,eax
 00520874    push        ebp
 00520875    push        520A94
 0052087A    push        dword ptr fs:[eax]
 0052087D    mov         dword ptr fs:[eax],esp
 00520880    mov         eax,dword ptr [ebp+8]
 00520883    mov         eax,dword ptr [eax+8]
 00520886    mov         eax,dword ptr [eax-18]
 00520889    call        0051C628
 0052088E    mov         dword ptr [ebp-8],eax
 00520891    mov         eax,dword ptr [ebp+8]
 00520894    mov         eax,dword ptr [eax+8]
 00520897    mov         esi,dword ptr [eax-1C]
 0052089A    mov         eax,esi
 0052089C    call        00510818
 005208A1    mov         ebx,eax
 005208A3    cmp         esi,ebx
>005208A5    je          005209FD
 005208AB    mov         edi,ebx
 005208AD    sub         edi,esi
 005208AF    sar         edi,1
>005208B1    jns         005208B6
 005208B3    adc         edi,0
 005208B6    mov         edx,edi
 005208B8    lea         eax,[ebp-4]
 005208BB    call        @UStrSetLength
 005208C0    lea         eax,[ebp-4]
 005208C3    call        @UniqueStringU
 005208C8    mov         edx,eax
 005208CA    mov         ecx,edi
 005208CC    add         ecx,ecx
 005208CE    mov         eax,esi
 005208D0    call        Move
 005208D5    mov         eax,dword ptr [ebp+8]
 005208D8    mov         eax,dword ptr [eax+8]
 005208DB    mov         eax,dword ptr [eax-18]
 005208DE    mov         eax,dword ptr [eax+2A4]
 005208E4    mov         edx,dword ptr [eax]
 005208E6    call        dword ptr [edx+14]
 005208E9    mov         edx,dword ptr [ebp+8]
 005208EC    mov         edx,dword ptr [edx+8]
 005208EF    mov         edx,dword ptr [edx-18]
 005208F2    cmp         eax,dword ptr [edx+28C]
>005208F8    jne         00520931
 005208FA    lea         ecx,[ebp-0C]
 005208FD    mov         edx,dword ptr [ebp-8]
 00520900    dec         edx
 00520901    mov         ax,20
 00520905    call        StringOfChar
 0052090A    lea         eax,[ebp-0C]
 0052090D    mov         edx,dword ptr [ebp-4]
 00520910    call        @UStrCat
 00520915    mov         edx,dword ptr [ebp-0C]
 00520918    mov         eax,dword ptr [ebp+8]
 0052091B    mov         eax,dword ptr [eax+8]
 0052091E    mov         eax,dword ptr [eax-18]
 00520921    mov         eax,dword ptr [eax+2A4]
 00520927    mov         ecx,dword ptr [eax]
 00520929    call        dword ptr [ecx+38]
>0052092C    jmp         005209FD
 00520931    lea         ecx,[ebp-10]
 00520934    mov         eax,dword ptr [ebp+8]
 00520937    mov         eax,dword ptr [eax+8]
 0052093A    mov         eax,dword ptr [eax-18]
 0052093D    mov         edx,dword ptr [eax+28C]
 00520943    mov         eax,dword ptr [ebp+8]
 00520946    mov         eax,dword ptr [eax+8]
 00520949    mov         eax,dword ptr [eax-18]
 0052094C    mov         eax,dword ptr [eax+2A4]
 00520952    mov         edi,dword ptr [eax]
 00520954    call        dword ptr [edi+0C]
 00520957    mov         edx,dword ptr [ebp-10]
 0052095A    mov         eax,dword ptr [ebp+8]
 0052095D    mov         eax,dword ptr [eax+8]
 00520960    add         eax,0FFFFFFEC
 00520963    call        @UStrLAsg
 00520968    mov         eax,dword ptr [ebp+8]
 0052096B    mov         eax,dword ptr [eax+8]
 0052096E    mov         eax,dword ptr [eax-14]
 00520971    mov         dword ptr [ebp-14],eax
 00520974    mov         eax,dword ptr [ebp-14]
 00520977    test        eax,eax
>00520979    je          00520980
 0052097B    sub         eax,4
 0052097E    mov         eax,dword ptr [eax]
 00520980    mov         edi,eax
 00520982    cmp         edi,dword ptr [ebp-8]
>00520985    jge         005209BD
 00520987    mov         eax,dword ptr [ebp+8]
 0052098A    mov         eax,dword ptr [eax+8]
 0052098D    push        dword ptr [eax-14]
 00520990    lea         ecx,[ebp-18]
 00520993    mov         edx,dword ptr [ebp-8]
 00520996    sub         edx,edi
 00520998    dec         edx
 00520999    mov         ax,20
 0052099D    call        StringOfChar
 005209A2    push        dword ptr [ebp-18]
 005209A5    push        dword ptr [ebp-4]
 005209A8    mov         eax,dword ptr [ebp+8]
 005209AB    mov         eax,dword ptr [eax+8]
 005209AE    add         eax,0FFFFFFEC
 005209B1    mov         edx,3
 005209B6    call        @UStrCatN
>005209BB    jmp         005209D1
 005209BD    mov         eax,dword ptr [ebp+8]
 005209C0    mov         eax,dword ptr [eax+8]
 005209C3    lea         edx,[eax-14]
 005209C6    mov         ecx,dword ptr [ebp-8]
 005209C9    mov         eax,dword ptr [ebp-4]
 005209CC    call        @UStrInsert
 005209D1    mov         eax,dword ptr [ebp+8]
 005209D4    mov         eax,dword ptr [eax+8]
 005209D7    mov         ecx,dword ptr [eax-14]
 005209DA    mov         eax,dword ptr [ebp+8]
 005209DD    mov         eax,dword ptr [eax+8]
 005209E0    mov         eax,dword ptr [eax-18]
 005209E3    mov         edx,dword ptr [eax+28C]
 005209E9    mov         eax,dword ptr [ebp+8]
 005209EC    mov         eax,dword ptr [eax+8]
 005209EF    mov         eax,dword ptr [eax-18]
 005209F2    mov         eax,dword ptr [eax+2A4]
 005209F8    mov         edi,dword ptr [eax]
 005209FA    call        dword ptr [edi+20]
 005209FD    mov         eax,dword ptr [ebp+8]
 00520A00    mov         eax,dword ptr [eax+8]
 00520A03    cmp         dword ptr [eax+8],0
>00520A07    je          00520A1F
 00520A09    mov         eax,ebx
 00520A0B    sub         eax,esi
 00520A0D    sar         eax,1
>00520A0F    jns         00520A14
 00520A11    adc         eax,0
 00520A14    mov         edx,dword ptr [ebp+8]
 00520A17    mov         edx,dword ptr [edx+8]
 00520A1A    mov         edx,dword ptr [edx+8]
 00520A1D    mov         dword ptr [edx],eax
 00520A1F    cmp         word ptr [ebx],0D
>00520A23    jne         00520A40
 00520A25    add         ebx,2
 00520A28    cmp         word ptr [ebx],0A
>00520A2C    jne         00520A31
 00520A2E    add         ebx,2
 00520A31    mov         eax,dword ptr [ebp+8]
 00520A34    mov         eax,dword ptr [eax+8]
 00520A37    mov         eax,dword ptr [eax-18]
 00520A3A    inc         dword ptr [eax+28C]
 00520A40    mov         esi,ebx
 00520A42    cmp         word ptr [ebx],0
>00520A46    jne         0052089A
 00520A4C    mov         eax,dword ptr [ebp-4]
 00520A4F    test        eax,eax
>00520A51    je          00520A58
 00520A53    sub         eax,4
 00520A56    mov         eax,dword ptr [eax]
 00520A58    mov         edx,dword ptr [ebp+8]
 00520A5B    mov         edx,dword ptr [edx+8]
 00520A5E    mov         edx,dword ptr [edx-18]
 00520A61    add         dword ptr [edx+288],eax
 00520A67    xor         ebx,ebx
 00520A69    xor         eax,eax
 00520A6B    pop         edx
 00520A6C    pop         ecx
 00520A6D    pop         ecx
 00520A6E    mov         dword ptr fs:[eax],edx
 00520A71    push        520A9B
 00520A76    lea         eax,[ebp-18]
 00520A79    call        @UStrClr
 00520A7E    lea         eax,[ebp-10]
 00520A81    mov         edx,2
 00520A86    call        @UStrArrayClr
 00520A8B    lea         eax,[ebp-4]
 00520A8E    call        @UStrClr
 00520A93    ret
>00520A94    jmp         @HandleFinally
>00520A99    jmp         00520A76
 00520A9B    mov         eax,ebx
 00520A9D    pop         edi
 00520A9E    pop         esi
 00520A9F    pop         ebx
 00520AA0    mov         esp,ebp
 00520AA2    pop         ebp
 00520AA3    ret
end;*}

//00520AA4
{*function sub_00520AA4(?:?):?;
begin
 00520AA4    push        ebp
 00520AA5    mov         ebp,esp
 00520AA7    xor         ecx,ecx
 00520AA9    push        ecx
 00520AAA    push        ecx
 00520AAB    push        ecx
 00520AAC    push        ecx
 00520AAD    push        ebx
 00520AAE    push        esi
 00520AAF    push        edi
 00520AB0    xor         eax,eax
 00520AB2    push        ebp
 00520AB3    push        520C6B
 00520AB8    push        dword ptr fs:[eax]
 00520ABB    mov         dword ptr fs:[eax],esp
 00520ABE    xor         eax,eax
 00520AC0    mov         dword ptr [ebp-8],eax
 00520AC3    mov         eax,dword ptr [ebp+8]
 00520AC6    mov         eax,dword ptr [eax+8]
 00520AC9    mov         eax,dword ptr [eax-18]
 00520ACC    xor         edx,edx
 00520ACE    mov         dword ptr [eax+288],edx
 00520AD4    mov         eax,dword ptr [ebp+8]
 00520AD7    mov         eax,dword ptr [eax+8]
 00520ADA    mov         esi,dword ptr [eax-1C]
 00520ADD    mov         eax,esi
 00520ADF    call        00510818
 00520AE4    mov         ebx,eax
 00520AE6    cmp         esi,ebx
>00520AE8    je          00520B16
 00520AEA    mov         edi,ebx
 00520AEC    sub         edi,esi
 00520AEE    sar         edi,1
>00520AF0    jns         00520AF5
 00520AF2    adc         edi,0
 00520AF5    mov         edx,edi
 00520AF7    lea         eax,[ebp-4]
 00520AFA    call        @UStrSetLength
 00520AFF    lea         eax,[ebp-4]
 00520B02    call        @UniqueStringU
 00520B07    mov         edx,eax
 00520B09    mov         ecx,edi
 00520B0B    add         ecx,ecx
 00520B0D    mov         eax,esi
 00520B0F    call        Move
>00520B14    jmp         00520B1E
 00520B16    lea         eax,[ebp-4]
 00520B19    call        @UStrClr
 00520B1E    cmp         word ptr [ebx],0
>00520B22    jne         00520BDD
 00520B28    mov         eax,dword ptr [ebp+8]
 00520B2B    mov         eax,dword ptr [eax+8]
 00520B2E    mov         eax,dword ptr [eax-18]
 00520B31    mov         eax,dword ptr [eax+2A4]
 00520B37    mov         edx,dword ptr [eax]
 00520B39    call        dword ptr [edx+14]
 00520B3C    mov         edx,dword ptr [ebp+8]
 00520B3F    mov         edx,dword ptr [edx+8]
 00520B42    mov         edx,dword ptr [edx-18]
 00520B45    cmp         eax,dword ptr [edx+28C]
>00520B4B    jle         00520BA9
 00520B4D    lea         ecx,[ebp-10]
 00520B50    mov         eax,dword ptr [ebp+8]
 00520B53    mov         eax,dword ptr [eax+8]
 00520B56    mov         eax,dword ptr [eax-18]
 00520B59    mov         edx,dword ptr [eax+28C]
 00520B5F    mov         eax,dword ptr [ebp+8]
 00520B62    mov         eax,dword ptr [eax+8]
 00520B65    mov         eax,dword ptr [eax-18]
 00520B68    mov         eax,dword ptr [eax+2A4]
 00520B6E    mov         edi,dword ptr [eax]
 00520B70    call        dword ptr [edi+0C]
 00520B73    mov         ecx,dword ptr [ebp-10]
 00520B76    lea         eax,[ebp-0C]
 00520B79    mov         edx,dword ptr [ebp-4]
 00520B7C    call        @UStrCat3
 00520B81    mov         ecx,dword ptr [ebp-0C]
 00520B84    mov         eax,dword ptr [ebp+8]
 00520B87    mov         eax,dword ptr [eax+8]
 00520B8A    mov         eax,dword ptr [eax-18]
 00520B8D    mov         edx,dword ptr [eax+28C]
 00520B93    mov         eax,dword ptr [ebp+8]
 00520B96    mov         eax,dword ptr [eax+8]
 00520B99    mov         eax,dword ptr [eax-18]
 00520B9C    mov         eax,dword ptr [eax+2A4]
 00520BA2    mov         edi,dword ptr [eax]
 00520BA4    call        dword ptr [edi+20]
>00520BA7    jmp         00520BC0
 00520BA9    mov         eax,dword ptr [ebp+8]
 00520BAC    mov         eax,dword ptr [eax+8]
 00520BAF    mov         eax,dword ptr [eax-18]
 00520BB2    mov         eax,dword ptr [eax+2A4]
 00520BB8    mov         edx,dword ptr [ebp-4]
 00520BBB    mov         ecx,dword ptr [eax]
 00520BBD    call        dword ptr [ecx+38]
 00520BC0    mov         eax,dword ptr [ebp-4]
 00520BC3    test        eax,eax
>00520BC5    je          00520BCC
 00520BC7    sub         eax,4
 00520BCA    mov         eax,dword ptr [eax]
 00520BCC    mov         edx,dword ptr [ebp+8]
 00520BCF    mov         edx,dword ptr [edx+8]
 00520BD2    mov         edx,dword ptr [edx-18]
 00520BD5    mov         dword ptr [edx+288],eax
>00520BDB    jmp         00520C29
 00520BDD    mov         eax,dword ptr [ebp+8]
 00520BE0    mov         eax,dword ptr [eax+8]
 00520BE3    mov         eax,dword ptr [eax-18]
 00520BE6    mov         edx,dword ptr [eax+28C]
 00520BEC    mov         eax,dword ptr [ebp+8]
 00520BEF    mov         eax,dword ptr [eax+8]
 00520BF2    mov         eax,dword ptr [eax-18]
 00520BF5    mov         eax,dword ptr [eax+2A4]
 00520BFB    mov         ecx,dword ptr [ebp-4]
 00520BFE    mov         esi,dword ptr [eax]
 00520C00    call        dword ptr [esi+60]
 00520C03    mov         eax,dword ptr [ebp+8]
 00520C06    mov         eax,dword ptr [eax+8]
 00520C09    mov         eax,dword ptr [eax-18]
 00520C0C    inc         dword ptr [eax+28C]
 00520C12    inc         dword ptr [ebp-8]
 00520C15    cmp         word ptr [ebx],0D
>00520C19    jne         00520C1E
 00520C1B    add         ebx,2
 00520C1E    cmp         word ptr [ebx],0A
>00520C22    jne         00520C27
 00520C24    add         ebx,2
 00520C27    mov         esi,ebx
 00520C29    cmp         word ptr [ebx],0
>00520C2D    jne         00520ADD
 00520C33    mov         eax,dword ptr [ebp+8]
 00520C36    mov         eax,dword ptr [eax+8]
 00520C39    mov         eax,dword ptr [eax-18]
 00520C3C    movzx       edx,byte ptr ds:[520C7C];0x2 gvar_00520C7C
 00520C43    call        005287FC
 00520C48    xor         eax,eax
 00520C4A    pop         edx
 00520C4B    pop         ecx
 00520C4C    pop         ecx
 00520C4D    mov         dword ptr fs:[eax],edx
 00520C50    push        520C72
 00520C55    lea         eax,[ebp-10]
 00520C58    mov         edx,2
 00520C5D    call        @UStrArrayClr
 00520C62    lea         eax,[ebp-4]
 00520C65    call        @UStrClr
 00520C6A    ret
>00520C6B    jmp         @HandleFinally
>00520C70    jmp         00520C55
 00520C72    mov         eax,dword ptr [ebp-8]
 00520C75    pop         edi
 00520C76    pop         esi
 00520C77    pop         ebx
 00520C78    mov         esp,ebp
 00520C7A    pop         ebp
 00520C7B    ret
end;*}

//00520C80
{*procedure sub_00520C80(?:?);
begin
 00520C80    push        ebp
 00520C81    mov         ebp,esp
 00520C83    add         esp,0FFFFFFF4
 00520C86    push        ebx
 00520C87    push        esi
 00520C88    push        edi
 00520C89    xor         eax,eax
 00520C8B    push        ebp
 00520C8C    push        520D88
 00520C91    push        dword ptr fs:[eax]
 00520C94    mov         dword ptr fs:[eax],esp
 00520C97    mov         eax,dword ptr [ebp+8]
 00520C9A    mov         eax,dword ptr [eax-1C]
 00520C9D    test        eax,eax
>00520C9F    je          00520CA5
 00520CA1    cmp         word ptr [eax],0
>00520CA5    je          00520D7A
 00520CAB    mov         eax,dword ptr [ebp+8]
 00520CAE    mov         eax,dword ptr [eax-18]
 00520CB1    call        0051C660
 00520CB6    mov         dword ptr [ebp-4],eax
 00520CB9    mov         eax,dword ptr [ebp+8]
 00520CBC    movzx       eax,byte ptr [eax-1D]
 00520CC0    sub         al,1
>00520CC2    jb          00520CCC
>00520CC4    je          00520CD7
 00520CC6    dec         al
>00520CC8    je          00520CE2
>00520CCA    jmp         00520CED
 00520CCC    push        ebp
 00520CCD    call        00520478
 00520CD2    pop         ecx
 00520CD3    mov         edi,eax
>00520CD5    jmp         00520CEF
 00520CD7    push        ebp
 00520CD8    call        00520864
 00520CDD    pop         ecx
 00520CDE    mov         edi,eax
>00520CE0    jmp         00520CEF
 00520CE2    push        ebp
 00520CE3    call        00520AA4
 00520CE8    pop         ecx
 00520CE9    mov         edi,eax
>00520CEB    jmp         00520CEF
 00520CED    xor         edi,edi
 00520CEF    test        edi,edi
>00520CF1    jle         00520D5B
 00520CF3    mov         eax,dword ptr [ebp+8]
 00520CF6    mov         eax,dword ptr [eax-18]
 00520CF9    mov         eax,dword ptr [eax+370]
 00520CFF    mov         esi,dword ptr [eax+8]
 00520D02    dec         esi
 00520D03    test        esi,esi
>00520D05    jl          00520D5B
 00520D07    inc         esi
 00520D08    xor         ebx,ebx
 00520D0A    mov         eax,dword ptr [ebp+8]
 00520D0D    mov         eax,dword ptr [eax-18]
 00520D10    mov         eax,dword ptr [eax+370]
 00520D16    mov         edx,ebx
 00520D18    call        00529C58
 00520D1D    mov         eax,dword ptr [eax+4]
 00520D20    cmp         eax,dword ptr [ebp-4]
>00520D23    jl          00520D57
 00520D25    mov         eax,dword ptr [ebp+8]
 00520D28    mov         eax,dword ptr [eax-18]
 00520D2B    mov         eax,dword ptr [eax+370]
 00520D31    mov         edx,ebx
 00520D33    call        00529C58
 00520D38    mov         eax,dword ptr [eax+4]
 00520D3B    add         eax,edi
 00520D3D    push        eax
 00520D3E    mov         eax,dword ptr [ebp+8]
 00520D41    mov         eax,dword ptr [eax-18]
 00520D44    mov         eax,dword ptr [eax+370]
 00520D4A    mov         edx,ebx
 00520D4C    call        00529C58
 00520D51    pop         edx
 00520D52    mov         ecx,dword ptr [eax]
 00520D54    call        dword ptr [ecx+0C]
 00520D57    inc         ebx
 00520D58    dec         esi
>00520D59    jne         00520D0A
 00520D5B    lea         edx,[ebp-0C]
 00520D5E    mov         eax,dword ptr [ebp+8]
 00520D61    mov         eax,dword ptr [eax-18]
 00520D64    call        0051FBB8
 00520D69    lea         edx,[ebp-0C]
 00520D6C    mov         eax,dword ptr [ebp+8]
 00520D6F    mov         eax,dword ptr [eax-18]
 00520D72    mov         ecx,dword ptr [eax]
 00520D74    call        dword ptr [ecx+110]
 00520D7A    xor         eax,eax
 00520D7C    pop         edx
 00520D7D    pop         ecx
 00520D7E    pop         ecx
 00520D7F    mov         dword ptr fs:[eax],edx
 00520D82    push        520D8F
 00520D87    ret
>00520D88    jmp         @HandleFinally
>00520D8D    jmp         00520D87
 00520D8F    pop         edi
 00520D90    pop         esi
 00520D91    pop         ebx
 00520D92    mov         esp,ebp
 00520D94    pop         ebp
 00520D95    ret
end;*}

//00520D98
procedure sub_00520D98(?:TmwCustomEdit; ?:Pointer; ?:PWideChar);
begin
{*
 00520D98    push        ebp
 00520D99    mov         ebp,esp
 00520D9B    add         esp,0FFFFFFE0
 00520D9E    push        ebx
 00520D9F    xor         ebx,ebx
 00520DA1    mov         dword ptr [ebp-14],ebx
 00520DA4    mov         dword ptr [ebp-1C],ecx
 00520DA7    mov         byte ptr [ebp-1D],dl
 00520DAA    mov         dword ptr [ebp-18],eax
 00520DAD    xor         eax,eax
 00520DAF    push        ebp
 00520DB0    push        520E99
 00520DB5    push        dword ptr fs:[eax]
 00520DB8    mov         dword ptr fs:[eax],esp
 00520DBB    mov         eax,dword ptr [ebp-18]
 00520DBE    call        0051CBE4
 00520DC3    mov         eax,dword ptr [ebp-18]
 00520DC6    mov         eax,dword ptr [eax+2A4];TmwCustomEdit.fLines:TStrings
 00520DCC    call        TStrings.BeginUpdate
 00520DD1    xor         eax,eax
 00520DD3    push        ebp
 00520DD4    push        520E7C
 00520DD9    push        dword ptr fs:[eax]
 00520DDC    mov         dword ptr fs:[eax],esp
 00520DDF    lea         edx,[ebp-8]
 00520DE2    mov         eax,dword ptr [ebp-18]
 00520DE5    call        0051C570
 00520DEA    lea         edx,[ebp-10]
 00520DED    mov         eax,dword ptr [ebp-18]
 00520DF0    call        0051C5CC
 00520DF5    mov         eax,dword ptr [ebp-18]
 00520DF8    call        0051C710
 00520DFD    test        al,al
>00520DFF    je          00520E08
 00520E01    push        ebp
 00520E02    call        005200AC
 00520E07    pop         ecx
 00520E08    cmp         dword ptr [ebp-1C],0
>00520E0C    je          00520E1E
 00520E0E    mov         eax,dword ptr [ebp-1C]
 00520E11    cmp         word ptr [eax],0
>00520E15    je          00520E1E
 00520E17    push        ebp
 00520E18    call        00520C80
 00520E1D    pop         ecx
 00520E1E    mov         eax,dword ptr [ebp-18]
 00520E21    mov         eax,dword ptr [eax+2A4];TmwCustomEdit.fLines:TStrings
 00520E27    mov         edx,dword ptr [eax]
 00520E29    call        dword ptr [edx+14];TStrings.GetCount
 00520E2C    test        eax,eax
>00520E2E    jne         00520E40
 00520E30    mov         eax,dword ptr [ebp-18]
 00520E33    mov         eax,dword ptr [eax+2A4];TmwCustomEdit.fLines:TStrings
 00520E39    xor         edx,edx
 00520E3B    mov         ecx,dword ptr [eax]
 00520E3D    call        dword ptr [ecx+38];TStrings.Add
 00520E40    mov         eax,dword ptr [ebp-18]
 00520E43    call        0051C660
 00520E48    dec         eax
>00520E49    jge         00520E58
 00520E4B    mov         edx,1
 00520E50    mov         eax,dword ptr [ebp-18]
 00520E53    call        0051FB94
 00520E58    xor         eax,eax
 00520E5A    pop         edx
 00520E5B    pop         ecx
 00520E5C    pop         ecx
 00520E5D    mov         dword ptr fs:[eax],edx
 00520E60    push        520E83
 00520E65    mov         eax,dword ptr [ebp-18]
 00520E68    mov         eax,dword ptr [eax+2A4];TmwCustomEdit.fLines:TStrings
 00520E6E    call        TStrings.EndUpdate
 00520E73    mov         eax,dword ptr [ebp-18]
 00520E76    call        0051C458
 00520E7B    ret
>00520E7C    jmp         @HandleFinally
>00520E81    jmp         00520E65
 00520E83    xor         eax,eax
 00520E85    pop         edx
 00520E86    pop         ecx
 00520E87    pop         ecx
 00520E88    mov         dword ptr fs:[eax],edx
 00520E8B    push        520EA0
 00520E90    lea         eax,[ebp-14]
 00520E93    call        @UStrClr
 00520E98    ret
>00520E99    jmp         @HandleFinally
>00520E9E    jmp         00520E90
 00520EA0    pop         ebx
 00520EA1    mov         esp,ebp
 00520EA3    pop         ebp
 00520EA4    ret         4
*}
end;

//00520EA8
procedure sub_00520EA8(?:TmwCustomEdit; ?:TComponentName);
begin
{*
 00520EA8    push        ebp
 00520EA9    mov         ebp,esp
 00520EAB    push        ecx
 00520EAC    push        ebx
 00520EAD    mov         ebx,edx
 00520EAF    mov         dword ptr [ebp-4],eax
 00520EB2    mov         eax,dword ptr [ebp-4]
 00520EB5    mov         eax,dword ptr [eax+2A4];TmwCustomEdit.fLines:TStrings
 00520EBB    call        0051BA08
 00520EC0    xor         eax,eax
 00520EC2    push        ebp
 00520EC3    push        520EFA
 00520EC8    push        dword ptr fs:[eax]
 00520ECB    mov         dword ptr fs:[eax],esp
 00520ECE    mov         eax,dword ptr [ebp-4]
 00520ED1    mov         eax,dword ptr [eax+2A4];TmwCustomEdit.fLines:TStrings
 00520ED7    mov         edx,ebx
 00520ED9    mov         ecx,dword ptr [eax]
 00520EDB    call        dword ptr [ecx+2C];TStrings.SetTextStr
 00520EDE    xor         eax,eax
 00520EE0    pop         edx
 00520EE1    pop         ecx
 00520EE2    pop         ecx
 00520EE3    mov         dword ptr fs:[eax],edx
 00520EE6    push        520F01
 00520EEB    mov         eax,dword ptr [ebp-4]
 00520EEE    mov         eax,dword ptr [eax+2A4];TmwCustomEdit.fLines:TStrings
 00520EF4    call        0051BA94
 00520EF9    ret
>00520EFA    jmp         @HandleFinally
>00520EFF    jmp         00520EEB
 00520F01    pop         ebx
 00520F02    pop         ecx
 00520F03    pop         ebp
 00520F04    ret
*}
end;

//00520F08
procedure sub_00520F08(?:TmwCustomEdit; ?:Integer);
begin
{*
 00520F08    push        ebx
 00520F09    push        esi
 00520F0A    push        edi
 00520F0B    mov         esi,edx
 00520F0D    mov         ebx,eax
 00520F0F    mov         eax,dword ptr [ebx+2A4];TmwCustomEdit.fLines:TStrings
 00520F15    mov         edx,dword ptr [eax]
 00520F17    call        dword ptr [edx+14];TStrings.GetCount
 00520F1A    mov         edx,eax
 00520F1C    mov         eax,esi
 00520F1E    call        0051048C
 00520F23    mov         esi,eax
 00520F25    mov         edx,1
 00520F2A    mov         eax,esi
 00520F2C    call        00510484
 00520F31    mov         esi,eax
 00520F33    mov         eax,dword ptr [ebx+2D0];TmwCustomEdit.fTopLine:Integer
 00520F39    inc         eax
 00520F3A    cmp         esi,eax
>00520F3C    je          00520F97
 00520F3E    mov         edi,eax
 00520F40    sub         edi,esi
 00520F42    dec         esi
 00520F43    mov         dword ptr [ebx+2D0],esi;TmwCustomEdit.fTopLine:Integer
 00520F49    xor         edx,edx
 00520F4B    mov         eax,ebx
 00520F4D    call        00521064
 00520F52    mov         eax,edi
 00520F54    cdq
 00520F55    xor         eax,edx
 00520F57    sub         eax,edx
 00520F59    cmp         eax,dword ptr [ebx+2A8];TmwCustomEdit.fLinesInWindow:Integer
>00520F5F    jge         00520F7F
 00520F61    push        0
 00520F63    push        0
 00520F65    mov         eax,dword ptr [ebx+2C8];TmwCustomEdit.fTextHeight:Integer
 00520F6B    imul        edi
 00520F6D    push        eax
 00520F6E    push        0
 00520F70    mov         eax,ebx
 00520F72    call        TWinControl.GetHandle
 00520F77    push        eax
 00520F78    call        user32.ScrollWindow
>00520F7D    jmp         00520F89
 00520F7F    mov         eax,ebx
 00520F81    mov         edx,dword ptr [eax]
 00520F83    call        dword ptr [edx+90];TWinControl.Invalidate
 00520F89    movzx       edx,byte ptr ds:[520F9C];0x10 gvar_00520F9C
 00520F90    mov         eax,ebx
 00520F92    call        005287FC
 00520F97    pop         edi
 00520F98    pop         esi
 00520F99    pop         ebx
 00520F9A    ret
*}
end;

//00520FA0
procedure sub_00520FA0(?:TmwCustomEdit);
begin
{*
 00520FA0    push        ebx
 00520FA1    mov         ebx,eax
 00520FA3    test        byte ptr [ebx+3CE],10
>00520FAA    jne         00520FCE
 00520FAC    test        byte ptr [ebx+3CC],20
>00520FB3    jne         00520FCE
 00520FB5    mov         eax,ebx
 00520FB7    call        TWinControl.GetHandle
 00520FBC    push        eax
 00520FBD    call        user32.ShowCaret
 00520FC2    test        eax,eax
>00520FC4    je          00520FCE
 00520FC6    or          word ptr [ebx+3CC],20
 00520FCE    pop         ebx
 00520FCF    ret
*}
end;

//00520FD0
procedure sub_00520FD0(?:TmwCustomEdit);
begin
{*
 00520FD0    push        ebx
 00520FD1    push        esi
 00520FD2    push        edi
 00520FD3    mov         ebx,eax
 00520FD5    cmp         dword ptr [ebx+2B4],0;TmwCustomEdit.fPaintLock:Integer
>00520FDC    jne         00520FED
 00520FDE    mov         eax,ebx
 00520FE0    mov         si,0FFB3
 00520FE4    call        @CallDynaInst;TWinControl.Focused
 00520FE9    test        al,al
>00520FEB    jne         00520FF7
 00520FED    or          word ptr [ebx+3CC],1;TmwCustomEdit.fStateFlags:TmwStateFlags
>00520FF5    jmp         0052105D
 00520FF7    and         word ptr [ebx+3CC],0FFFFFFFE;TmwCustomEdit.fStateFlags:TmwStateFlags
 00520FFF    mov         eax,ebx
 00521001    call        TmwCustomEdit.CaretXPix
 00521006    mov         esi,eax
 00521008    add         esi,dword ptr [ebx+34C];TmwCustomEdit.fCaretOffset:TPoint
 0052100E    mov         eax,ebx
 00521010    call        TmwCustomEdit.CaretYPix
 00521015    mov         edi,eax
 00521017    add         edi,dword ptr [ebx+350]
 0052101D    cmp         esi,dword ptr [ebx+29C];TmwCustomEdit.fGutterWidth:Integer
>00521023    jl          0052104F
 00521025    mov         eax,ebx
 00521027    call        TControl.GetClientWidth
 0052102C    cmp         esi,eax
>0052102E    jge         0052104F
 00521030    test        edi,edi
>00521032    jl          0052104F
 00521034    mov         eax,ebx
 00521036    call        TControl.GetClientHeight
 0052103B    cmp         edi,eax
>0052103D    jge         0052104F
 0052103F    push        edi
 00521040    push        esi
 00521041    call        user32.SetCaretPos
 00521046    mov         eax,ebx
 00521048    call        00520FA0
>0052104D    jmp         0052105D
 0052104F    mov         eax,ebx
 00521051    call        0051CBBC
 00521056    push        edi
 00521057    push        esi
 00521058    call        user32.SetCaretPos
 0052105D    pop         edi
 0052105E    pop         esi
 0052105F    pop         ebx
 00521060    ret
*}
end;

//00521064
{*procedure sub_00521064(?:TmwCustomEdit; ?:?);
begin
 00521064    push        ebx
 00521065    push        esi
 00521066    add         esp,0FFFFFFE4
 00521069    mov         ebx,edx
 0052106B    mov         esi,eax
 0052106D    mov         eax,esi
 0052106F    call        TWinControl.HandleAllocated
 00521074    test        al,al
>00521076    je          00521085
 00521078    cmp         dword ptr [esi+2B4],0;TmwCustomEdit.fPaintLock:Integer
>0052107F    je          00521092
 00521081    test        bl,bl
>00521083    jne         00521092
 00521085    or          word ptr [esi+3CC],2;TmwCustomEdit.fStateFlags:TmwStateFlags
>0052108D    jmp         005211A8
 00521092    and         word ptr [esi+3CC],0FFFFFFFD;TmwCustomEdit.fStateFlags:TmwStateFlags
 0052109A    movzx       eax,byte ptr [esi+2C4];TmwCustomEdit.FScrollBars:TScrollStyle
 005210A1    test        al,al
>005210A3    je          005211A8
 005210A9    mov         dword ptr [esp],1C
 005210B0    mov         dword ptr [esp+4],1F
 005210B8    mov         dword ptr [esp+8],1
 005210C0    xor         edx,edx
 005210C2    mov         dword ptr [esp+18],edx
 005210C6    sub         al,1
>005210C8    je          005210CE
 005210CA    sub         al,2
>005210CC    jne         00521103
 005210CE    mov         eax,dword ptr [esi+2B0];TmwCustomEdit.fMaxLeftChar:Integer
 005210D4    mov         dword ptr [esp+0C],eax
 005210D8    mov         eax,dword ptr [esi+290];TmwCustomEdit.fCharsInWindow:Integer
 005210DE    mov         dword ptr [esp+10],eax
 005210E2    mov         eax,esi
 005210E4    call        0051C6C0
 005210E9    mov         dword ptr [esp+14],eax
 005210ED    push        0FF
 005210EF    lea         eax,[esp+4]
 005210F3    push        eax
 005210F4    push        0
 005210F6    mov         eax,esi
 005210F8    call        TWinControl.GetHandle
 005210FD    push        eax
 005210FE    call        user32.SetScrollInfo
 00521103    movzx       eax,byte ptr [esi+2C4];TmwCustomEdit.FScrollBars:TScrollStyle
 0052110A    add         al,0FE
 0052110C    sub         al,2
>0052110E    jae         005211A8
 00521114    mov         eax,dword ptr [esi+2A4];TmwCustomEdit.fLines:TStrings
 0052111A    mov         edx,dword ptr [eax]
 0052111C    call        dword ptr [edx+14];TStrings.GetCount
 0052111F    mov         ebx,eax
 00521121    add         ebx,dword ptr [esi+2A8];TmwCustomEdit.fLinesInWindow:Integer
 00521127    dec         ebx
 00521128    cmp         ebx,7FFF
>0052112E    jg          00521157
 00521130    mov         edx,ebx
 00521132    mov         eax,1
 00521137    call        00510484
 0052113C    mov         dword ptr [esp+0C],eax
 00521140    mov         eax,dword ptr [esi+2A8];TmwCustomEdit.fLinesInWindow:Integer
 00521146    mov         dword ptr [esp+10],eax
 0052114A    mov         eax,esi
 0052114C    call        0051CBB4
 00521151    mov         dword ptr [esp+14],eax
>00521155    jmp         00521192
 00521157    xor         eax,eax
 00521159    mov         dword ptr [esp+8],eax
 0052115D    mov         dword ptr [esp+0C],7FFF
 00521165    push        ebx
 00521166    mov         eax,dword ptr [esi+2A8];TmwCustomEdit.fLinesInWindow:Integer
 0052116C    push        eax
 0052116D    push        7FFF
 00521172    call        kernel32.MulDiv
 00521177    mov         dword ptr [esp+10],eax
 0052117B    push        ebx
 0052117C    mov         eax,esi
 0052117E    call        0051CBB4
 00521183    push        eax
 00521184    push        7FFF
 00521189    call        kernel32.MulDiv
 0052118E    mov         dword ptr [esp+14],eax
 00521192    push        0FF
 00521194    lea         eax,[esp+4]
 00521198    push        eax
 00521199    push        1
 0052119B    mov         eax,esi
 0052119D    call        TWinControl.GetHandle
 005211A2    push        eax
 005211A3    call        user32.SetScrollInfo
 005211A8    add         esp,1C
 005211AB    pop         esi
 005211AC    pop         ebx
 005211AD    ret
end;*}

//005211B0
{*procedure TmwCustomEdit.WMDropFiles(?:?);
begin
 005211B0    push        ebp
 005211B1    mov         ebp,esp
 005211B3    add         esp,0FFFFFDE0
 005211B9    push        ebx
 005211BA    push        esi
 005211BB    push        edi
 005211BC    xor         ecx,ecx
 005211BE    mov         dword ptr [ebp-220],ecx
 005211C4    mov         dword ptr [ebp-4],edx
 005211C7    mov         edi,eax
 005211C9    xor         eax,eax
 005211CB    push        ebp
 005211CC    push        5212F5
 005211D1    push        dword ptr fs:[eax]
 005211D4    mov         dword ptr fs:[eax],esp
 005211D7    xor         eax,eax
 005211D9    push        ebp
 005211DA    push        5212D5
 005211DF    push        dword ptr fs:[eax]
 005211E2    mov         dword ptr fs:[eax],esp
 005211E5    cmp         word ptr [edi+3EA],0;TmwCustomEdit.?f3EA:word
>005211ED    je          005212B3
 005211F3    mov         dl,1
 005211F5    mov         eax,[0043C7BC];TStringList
 005211FA    call        TStringList.Create;TStringList.Create
 005211FF    mov         dword ptr [ebp-10],eax
 00521202    xor         eax,eax
 00521204    push        ebp
 00521205    push        5212AC
 0052120A    push        dword ptr fs:[eax]
 0052120D    mov         dword ptr fs:[eax],esp
 00521210    push        0
 00521212    push        0
 00521214    push        0FF
 00521216    mov         eax,dword ptr [ebp-4]
 00521219    mov         eax,dword ptr [eax+4]
 0052121C    push        eax
 0052121D    call        shell32.DragQueryFileW
 00521222    mov         ebx,eax
 00521224    lea         eax,[ebp-0C]
 00521227    push        eax
 00521228    mov         eax,dword ptr [ebp-4]
 0052122B    mov         eax,dword ptr [eax+4]
 0052122E    push        eax
 0052122F    call        shell32.DragQueryPoint
 00521234    dec         ebx
 00521235    test        ebx,ebx
>00521237    jl          0052127D
 00521239    inc         ebx
 0052123A    xor         esi,esi
 0052123C    push        20A
 00521241    lea         eax,[ebp-21A]
 00521247    push        eax
 00521248    push        esi
 00521249    mov         eax,dword ptr [ebp-4]
 0052124C    mov         eax,dword ptr [eax+4]
 0052124F    push        eax
 00521250    call        shell32.DragQueryFileW
 00521255    lea         eax,[ebp-220]
 0052125B    lea         edx,[ebp-21A]
 00521261    mov         ecx,105
 00521266    call        @UStrFromWArray
 0052126B    mov         edx,dword ptr [ebp-220]
 00521271    mov         eax,dword ptr [ebp-10]
 00521274    mov         ecx,dword ptr [eax]
 00521276    call        dword ptr [ecx+38];TStringList.Add
 00521279    inc         esi
 0052127A    dec         ebx
>0052127B    jne         0052123C
 0052127D    mov         eax,dword ptr [ebp-8]
 00521280    push        eax
 00521281    mov         eax,dword ptr [ebp-10]
 00521284    push        eax
 00521285    mov         ecx,dword ptr [ebp-0C]
 00521288    mov         edx,edi
 0052128A    mov         eax,dword ptr [edi+3EC];TmwCustomEdit.?f3EC:dword
 00521290    call        dword ptr [edi+3E8];TmwCustomEdit.fOnDropFiles
 00521296    xor         eax,eax
 00521298    pop         edx
 00521299    pop         ecx
 0052129A    pop         ecx
 0052129B    mov         dword ptr fs:[eax],edx
 0052129E    push        5212B3
 005212A3    mov         eax,dword ptr [ebp-10]
 005212A6    call        TObject.Free
 005212AB    ret
>005212AC    jmp         @HandleFinally
>005212B1    jmp         005212A3
 005212B3    xor         eax,eax
 005212B5    pop         edx
 005212B6    pop         ecx
 005212B7    pop         ecx
 005212B8    mov         dword ptr fs:[eax],edx
 005212BB    push        5212DC
 005212C0    mov         eax,dword ptr [ebp-4]
 005212C3    xor         edx,edx
 005212C5    mov         dword ptr [eax+0C],edx
 005212C8    mov         eax,dword ptr [ebp-4]
 005212CB    mov         eax,dword ptr [eax+4]
 005212CE    push        eax
 005212CF    call        shell32.DragFinish
 005212D4    ret
>005212D5    jmp         @HandleFinally
>005212DA    jmp         005212C0
 005212DC    xor         eax,eax
 005212DE    pop         edx
 005212DF    pop         ecx
 005212E0    pop         ecx
 005212E1    mov         dword ptr fs:[eax],edx
 005212E4    push        5212FC
 005212E9    lea         eax,[ebp-220]
 005212EF    call        @UStrClr
 005212F4    ret
>005212F5    jmp         @HandleFinally
>005212FA    jmp         005212E9
 005212FC    pop         edi
 005212FD    pop         esi
 005212FE    pop         ebx
 005212FF    mov         esp,ebp
 00521301    pop         ebp
 00521302    ret
end;*}

//00521304
procedure TmwCustomEdit.WMEraseBkgnd(Message:TWMEraseBkgnd);
begin
{*
 00521304    mov         dword ptr [edx+0C],1
 0052130B    ret
*}
end;

//0052130C
{*procedure TmwCustomEdit.WMGetDlgCode(?:?);
begin
 0052130C    push        ebx
 0052130D    push        esi
 0052130E    mov         esi,edx
 00521310    mov         ebx,eax
 00521312    mov         edx,esi
 00521314    mov         eax,ebx
 00521316    mov         ecx,dword ptr [eax]
 00521318    call        dword ptr [ecx-10];TWinControl.DefaultHandler
 0052131B    mov         dword ptr [esi+0C],81
 00521322    cmp         byte ptr [ebx+3A0],0;TmwCustomEdit.fWantTabs:Boolean
>00521329    je          0052133E
 0052132B    push        11
 0052132D    call        user32.GetKeyState
 00521332    movsx       eax,ax
 00521335    test        ah,80
>00521338    jne         0052133E
 0052133A    or          dword ptr [esi+0C],2
 0052133E    pop         esi
 0052133F    pop         ebx
 00521340    ret
end;*}

//00521344
procedure TmwCustomEdit.WMHScroll(Message:TWMCommand);
begin
{*
 00521344    push        ebx
 00521345    push        esi
 00521346    mov         esi,edx
 00521348    mov         ebx,eax
 0052134A    or          word ptr [ebx+3CC],8;TmwCustomEdit.fStateFlags:TmwStateFlags
 00521352    movsx       eax,word ptr [esi+4]
 00521356    cmp         eax,8
>00521359    ja          00521419
 0052135F    jmp         dword ptr [eax*4+521366]
 0052135F    dd          005213BD
 0052135F    dd          005213A9
 0052135F    dd          005213EA
 0052135F    dd          005213D1
 0052135F    dd          00521403
 0052135F    dd          00521403
 0052135F    dd          0052138A
 0052135F    dd          00521399
 0052135F    dd          00521411
 0052138A    mov         edx,1
 0052138F    mov         eax,ebx
 00521391    call        0051FEB4
 00521396    pop         esi
 00521397    pop         ebx
 00521398    ret
 00521399    mov         edx,dword ptr [ebx+2B0];TmwCustomEdit.fMaxLeftChar:Integer
 0052139F    mov         eax,ebx
 005213A1    call        0051FEB4
 005213A6    pop         esi
 005213A7    pop         ebx
 005213A8    ret
 005213A9    mov         eax,ebx
 005213AB    call        0051C6C0
 005213B0    mov         edx,eax
 005213B2    inc         edx
 005213B3    mov         eax,ebx
 005213B5    call        0051FEB4
 005213BA    pop         esi
 005213BB    pop         ebx
 005213BC    ret
 005213BD    mov         eax,ebx
 005213BF    call        0051C6C0
 005213C4    mov         edx,eax
 005213C6    dec         edx
 005213C7    mov         eax,ebx
 005213C9    call        0051FEB4
 005213CE    pop         esi
 005213CF    pop         ebx
 005213D0    ret
 005213D1    mov         eax,ebx
 005213D3    call        0051C6C0
 005213D8    mov         edx,eax
 005213DA    add         edx,dword ptr [ebx+290];TmwCustomEdit.fCharsInWindow:Integer
 005213E0    mov         eax,ebx
 005213E2    call        0051FEB4
 005213E7    pop         esi
 005213E8    pop         ebx
 005213E9    ret
 005213EA    mov         eax,ebx
 005213EC    call        0051C6C0
 005213F1    mov         edx,eax
 005213F3    sub         edx,dword ptr [ebx+290]
 005213F9    mov         eax,ebx
 005213FB    call        0051FEB4
 00521400    pop         esi
 00521401    pop         ebx
 00521402    ret
 00521403    movsx       edx,word ptr [esi+6]
 00521407    mov         eax,ebx
 00521409    call        0051FEB4
 0052140E    pop         esi
 0052140F    pop         ebx
 00521410    ret
 00521411    and         word ptr [ebx+3CC],0FFFFFFF7;TmwCustomEdit.fStateFlags:TmwStateFlags
 00521419    pop         esi
 0052141A    pop         ebx
 0052141B    ret
*}
end;

//0052141C
procedure TmwCustomEdit.WMKillFocus(var Message:TWMKillFocus);
begin
{*
 0052141C    push        esi
 0052141D    mov         esi,eax
 0052141F    mov         eax,esi
 00521421    call        TWinControl.WMKillFocus
 00521426    mov         eax,esi
 00521428    call        0051CBBC
 0052142D    call        user32.DestroyCaret
 00521432    cmp         byte ptr [esi+341],0;TmwCustomEdit.fHideSelection:Boolean
>00521439    je          00521450
 0052143B    mov         eax,esi
 0052143D    call        0051C710
 00521442    test        al,al
>00521444    je          00521450
 00521446    mov         eax,esi
 00521448    mov         edx,dword ptr [eax]
 0052144A    call        dword ptr [edx+90];TWinControl.Invalidate
 00521450    pop         esi
 00521451    ret
*}
end;

//00521454
procedure TmwCustomEdit.WMSetFocus(var Message:TWMSetFocus);
begin
{*
 00521454    push        ebx
 00521455    mov         ebx,eax
 00521457    mov         eax,ebx
 00521459    call        005232D8
 0052145E    cmp         byte ptr [ebx+341],0;TmwCustomEdit.fHideSelection:Boolean
>00521465    je          0052147C
 00521467    mov         eax,ebx
 00521469    call        0051C710
 0052146E    test        al,al
>00521470    je          0052147C
 00521472    mov         eax,ebx
 00521474    mov         edx,dword ptr [eax]
 00521476    call        dword ptr [edx+90];TWinControl.Invalidate
 0052147C    pop         ebx
 0052147D    ret
*}
end;

//00521480
procedure TmwCustomEdit.WMSize(var Message:TWMSize);
begin
{*
 00521480    push        ebx
 00521481    mov         ebx,eax
 00521483    mov         eax,ebx
 00521485    call        TWinControl.WMSize
 0052148A    xor         edx,edx
 0052148C    mov         eax,ebx
 0052148E    call        0052841C
 00521493    mov         eax,ebx
 00521495    call        0051C6C0
 0052149A    mov         edx,eax
 0052149C    mov         eax,ebx
 0052149E    call        0051FEB4
 005214A3    pop         ebx
 005214A4    ret
*}
end;

//005214A8
{*function sub_005214A8:?;
begin
 005214A8    cmp         dword ptr ds:[793B2C],0;gvar_00793B2C
>005214AF    jne         005214D6
 005214B1    mov         ecx,dword ptr ds:[78D590];^Application:TApplication
 005214B7    mov         ecx,dword ptr [ecx]
 005214B9    mov         eax,[0078D75C];^'@ÞG'+#0+#0+#0+#0+#0+#1+#0+#0
 005214BE    mov         eax,dword ptr [eax]
 005214C0    mov         dl,1
 005214C2    call        dword ptr [eax+2C]
 005214C5    mov         [00793B2C],eax;gvar_00793B2C
 005214CA    xor         edx,edx
 005214CC    mov         eax,[00793B2C];gvar_00793B2C
 005214D1    call        TControl.SetVisible
 005214D6    mov         eax,[00793B2C];gvar_00793B2C
 005214DB    ret
end;*}

//005214DC
procedure TmwCustomEdit.WMVScroll(Message:TWMHScroll);
begin
{*
 005214DC    push        ebp
 005214DD    mov         ebp,esp
 005214DF    add         esp,0FFFFFEB8
 005214E5    push        ebx
 005214E6    push        esi
 005214E7    push        edi
 005214E8    xor         ecx,ecx
 005214EA    mov         dword ptr [ebp-138],ecx
 005214F0    mov         dword ptr [ebp-134],ecx
 005214F6    mov         dword ptr [ebp-124],ecx
 005214FC    mov         dword ptr [ebp-128],ecx
 00521502    mov         esi,edx
 00521504    mov         ebx,eax
 00521506    xor         eax,eax
 00521508    push        ebp
 00521509    push        5217D0
 0052150E    push        dword ptr fs:[eax]
 00521511    mov         dword ptr fs:[eax],esp
 00521514    or          word ptr [ebx+3CC],8;TmwCustomEdit.fStateFlags:TmwStateFlags
 0052151C    movsx       eax,word ptr [esi+4]
 00521520    cmp         eax,8
>00521523    ja          00521798
 00521529    jmp         dword ptr [eax*4+521530]
 00521529    dd          00521594
 00521529    dd          0052157E
 00521529    dd          005215C5
 00521529    dd          005215AA
 00521529    dd          005215E0
 00521529    dd          005215E0
 00521529    dd          00521554
 00521529    dd          00521565
 00521529    dd          00521751
 00521554    mov         edx,1
 00521559    mov         eax,ebx
 0052155B    call        00520F08
>00521560    jmp         00521798
 00521565    mov         eax,dword ptr [ebx+2A4];TmwCustomEdit.fLines:TStrings
 0052156B    mov         edx,dword ptr [eax]
 0052156D    call        dword ptr [edx+14];TStrings.GetCount
 00521570    mov         edx,eax
 00521572    mov         eax,ebx
 00521574    call        00520F08
>00521579    jmp         00521798
 0052157E    mov         eax,ebx
 00521580    call        0051CBB4
 00521585    mov         edx,eax
 00521587    inc         edx
 00521588    mov         eax,ebx
 0052158A    call        00520F08
>0052158F    jmp         00521798
 00521594    mov         eax,ebx
 00521596    call        0051CBB4
 0052159B    mov         edx,eax
 0052159D    dec         edx
 0052159E    mov         eax,ebx
 005215A0    call        00520F08
>005215A5    jmp         00521798
 005215AA    mov         eax,ebx
 005215AC    call        0051CBB4
 005215B1    mov         edx,eax
 005215B3    add         edx,dword ptr [ebx+2A8];TmwCustomEdit.fLinesInWindow:Integer
 005215B9    mov         eax,ebx
 005215BB    call        00520F08
>005215C0    jmp         00521798
 005215C5    mov         eax,ebx
 005215C7    call        0051CBB4
 005215CC    mov         edx,eax
 005215CE    sub         edx,dword ptr [ebx+2A8]
 005215D4    mov         eax,ebx
 005215D6    call        00520F08
>005215DB    jmp         00521798
 005215E0    mov         eax,dword ptr [ebx+2A4];TmwCustomEdit.fLines:TStrings
 005215E6    mov         edx,dword ptr [eax]
 005215E8    call        dword ptr [edx+14];TStrings.GetCount
 005215EB    cmp         eax,7FFF
>005215F0    jle         0052161F
 005215F2    push        7FFF
 005215F7    movsx       eax,word ptr [esi+6]
 005215FB    push        eax
 005215FC    mov         eax,dword ptr [ebx+2A4];TmwCustomEdit.fLines:TStrings
 00521602    mov         edx,dword ptr [eax]
 00521604    call        dword ptr [edx+14];TStrings.GetCount
 00521607    add         eax,dword ptr [ebx+2A8];TmwCustomEdit.fLinesInWindow:Integer
 0052160D    dec         eax
 0052160E    push        eax
 0052160F    call        kernel32.MulDiv
 00521614    mov         edx,eax
 00521616    mov         eax,ebx
 00521618    call        00520F08
>0052161D    jmp         0052162A
 0052161F    movsx       edx,word ptr [esi+6]
 00521623    mov         eax,ebx
 00521625    call        00520F08
 0052162A    test        byte ptr [ebx+3CE],80;TmwCustomEdit.fOptions:TmwEditorOptions
>00521631    je          00521798
 00521637    call        005214A8
 0052163C    mov         esi,eax
 0052163E    cmp         byte ptr [esi+59],0
>00521642    jne         0052165E
 00521644    mov         eax,[0078D590];^Application:TApplication
 00521649    mov         eax,dword ptr [eax]
 0052164B    mov         edx,dword ptr [eax+5C];TApplication.FHintColor:TColor
 0052164E    mov         eax,esi
 00521650    call        TControl.SetColor
 00521655    mov         dl,1
 00521657    mov         eax,esi
 00521659    call        TControl.SetVisible
 0052165E    lea         eax,[ebp-124]
 00521664    push        eax
 00521665    lea         edx,[ebp-128]
 0052166B    mov         eax,[0078DB08];^SResString315:TResStringRec
 00521670    call        LoadResString
 00521675    mov         eax,dword ptr [ebp-128]
 0052167B    push        eax
 0052167C    mov         eax,ebx
 0052167E    call        0051CBB4
 00521683    mov         dword ptr [ebp-130],eax
 00521689    mov         byte ptr [ebp-12C],0
 00521690    lea         edx,[ebp-130]
 00521696    xor         ecx,ecx
 00521698    pop         eax
 00521699    call        Format
 0052169E    mov         edx,dword ptr [ebp-124]
 005216A4    lea         eax,[ebp-110]
 005216AA    mov         ecx,0FF
 005216AF    call        @UStrToString
 005216B4    push        0
 005216B6    lea         eax,[ebp-120]
 005216BC    push        eax
 005216BD    lea         eax,[ebp-134]
 005216C3    lea         edx,[ebp-110]
 005216C9    call        @UStrFromString
 005216CE    mov         ecx,dword ptr [ebp-134]
 005216D4    mov         edx,0C8
 005216D9    mov         eax,esi
 005216DB    mov         edi,dword ptr [eax]
 005216DD    call        dword ptr [edi+104]
 005216E3    mov         eax,ebx
 005216E5    call        TControl.GetClientWidth
 005216EA    sub         eax,dword ptr [ebp-118]
 005216F0    sub         eax,4
 005216F3    mov         dword ptr [ebp-10],eax
 005216F6    mov         dword ptr [ebp-0C],0A
 005216FD    lea         ecx,[ebp-8]
 00521700    lea         edx,[ebp-10]
 00521703    mov         eax,ebx
 00521705    call        TControl.ClientToScreen
 0052170A    mov         eax,dword ptr [ebp-4]
 0052170D    push        eax
 0052170E    mov         eax,dword ptr [ebp-8]
 00521711    push        eax
 00521712    lea         eax,[ebp-120]
 00521718    push        eax
 00521719    call        user32.OffsetRect
 0052171E    lea         eax,[ebp-138]
 00521724    lea         edx,[ebp-110]
 0052172A    call        @UStrFromString
 0052172F    mov         ecx,dword ptr [ebp-138]
 00521735    lea         edx,[ebp-120]
 0052173B    mov         eax,esi
 0052173D    mov         edi,dword ptr [eax]
 0052173F    call        dword ptr [edi+0F4]
 00521745    mov         eax,esi
 00521747    mov         edx,dword ptr [eax]
 00521749    call        dword ptr [edx+9C]
>0052174F    jmp         00521798
 00521751    and         word ptr [ebx+3CC],0FFFFFFF7;TmwCustomEdit.fStateFlags:TmwStateFlags
 00521759    test        byte ptr [ebx+3CE],80;TmwCustomEdit.fOptions:TmwEditorOptions
>00521760    je          00521798
 00521762    call        005214A8
 00521767    mov         esi,eax
 00521769    xor         edx,edx
 0052176B    mov         eax,esi
 0052176D    call        TControl.SetVisible
 00521772    push        0
 00521774    lea         eax,[ebp-148]
 0052177A    push        eax
 0052177B    xor         ecx,ecx
 0052177D    xor         edx,edx
 0052177F    xor         eax,eax
 00521781    call        Rect
 00521786    lea         edx,[ebp-148]
 0052178C    xor         ecx,ecx
 0052178E    mov         eax,esi
 00521790    mov         esi,dword ptr [eax]
 00521792    call        dword ptr [esi+0F4]
 00521798    mov         eax,ebx
 0052179A    mov         edx,dword ptr [eax]
 0052179C    call        dword ptr [edx+9C];TWinControl.Update
 005217A2    xor         eax,eax
 005217A4    pop         edx
 005217A5    pop         ecx
 005217A6    pop         ecx
 005217A7    mov         dword ptr fs:[eax],edx
 005217AA    push        5217D7
 005217AF    lea         eax,[ebp-138]
 005217B5    mov         edx,2
 005217BA    call        @UStrArrayClr
 005217BF    lea         eax,[ebp-128]
 005217C5    mov         edx,2
 005217CA    call        @UStrArrayClr
 005217CF    ret
>005217D0    jmp         @HandleFinally
>005217D5    jmp         005217AF
 005217D7    pop         edi
 005217D8    pop         esi
 005217D9    pop         ebx
 005217DA    mov         esp,ebp
 005217DC    pop         ebp
 005217DD    ret
*}
end;

//005217E0
{*function sub_005217E0(?:?; ?:?):?;
begin
 005217E0    push        ebp
 005217E1    mov         ebp,esp
 005217E3    push        0
 005217E5    push        0
 005217E7    push        ebx
 005217E8    push        esi
 005217E9    push        edi
 005217EA    mov         edi,edx
 005217EC    mov         ebx,eax
 005217EE    xor         eax,eax
 005217F0    push        ebp
 005217F1    push        5218CF
 005217F6    push        dword ptr fs:[eax]
 005217F9    mov         dword ptr fs:[eax],esp
 005217FC    mov         esi,edi
 005217FE    mov         eax,dword ptr [ebx+2A4]
 00521804    mov         edx,dword ptr [eax]
 00521806    call        dword ptr [edx+14]
 00521809    dec         eax
 0052180A    cmp         edi,eax
>0052180C    jge         005218B4
 00521812    lea         ecx,[ebp-4]
 00521815    mov         edx,esi
 00521817    mov         eax,dword ptr [ebx+2A4]
 0052181D    mov         edi,dword ptr [eax]
 0052181F    call        dword ptr [edi+0C]
 00521822    mov         edx,dword ptr [ebp-4]
 00521825    mov         ecx,esi
 00521827    mov         eax,dword ptr [ebx+2D4]
 0052182D    mov         edi,dword ptr [eax]
 0052182F    call        dword ptr [edi+74]
 00521832    inc         esi
 00521833    mov         eax,dword ptr [ebx+2D4]
 00521839    call        TmwCustomHighLighter.NextToEol
>0052183E    jmp         00521895
 00521840    mov         eax,dword ptr [ebx+2D4]
 00521846    mov         edx,dword ptr [eax]
 00521848    call        dword ptr [edx+5C]
 0052184B    mov         ecx,eax
 0052184D    mov         edx,esi
 0052184F    mov         eax,dword ptr [ebx+2A4]
 00521855    mov         edi,dword ptr [eax]
 00521857    call        dword ptr [edi+24]
 0052185A    lea         ecx,[ebp-8]
 0052185D    mov         edx,esi
 0052185F    mov         eax,dword ptr [ebx+2A4]
 00521865    mov         edi,dword ptr [eax]
 00521867    call        dword ptr [edi+0C]
 0052186A    mov         edx,dword ptr [ebp-8]
 0052186D    mov         ecx,esi
 0052186F    mov         eax,dword ptr [ebx+2D4]
 00521875    mov         edi,dword ptr [eax]
 00521877    call        dword ptr [edi+74]
 0052187A    mov         eax,dword ptr [ebx+2D4]
 00521880    call        TmwCustomHighLighter.NextToEol
 00521885    inc         esi
 00521886    mov         eax,dword ptr [ebx+2A4]
 0052188C    mov         edx,dword ptr [eax]
 0052188E    call        dword ptr [edx+14]
 00521891    cmp         esi,eax
>00521893    je          005218B3
 00521895    mov         edx,esi
 00521897    mov         eax,dword ptr [ebx+2A4]
 0052189D    mov         ecx,dword ptr [eax]
 0052189F    call        dword ptr [ecx+18]
 005218A2    mov         edi,eax
 005218A4    mov         eax,dword ptr [ebx+2D4]
 005218AA    mov         edx,dword ptr [eax]
 005218AC    call        dword ptr [edx+5C]
 005218AF    cmp         edi,eax
>005218B1    jne         00521840
 005218B3    dec         esi
 005218B4    xor         eax,eax
 005218B6    pop         edx
 005218B7    pop         ecx
 005218B8    pop         ecx
 005218B9    mov         dword ptr fs:[eax],edx
 005218BC    push        5218D6
 005218C1    lea         eax,[ebp-8]
 005218C4    mov         edx,2
 005218C9    call        @UStrArrayClr
 005218CE    ret
>005218CF    jmp         @HandleFinally
>005218D4    jmp         005218C1
 005218D6    mov         eax,esi
 005218D8    pop         edi
 005218D9    pop         esi
 005218DA    pop         ebx
 005218DB    pop         ecx
 005218DC    pop         ecx
 005218DD    pop         ebp
 005218DE    ret
end;*}

//005219E8
{*procedure sub_005219E8(?:?);
begin
 005219E8    push        esi
 005219E9    add         esp,0FFFFFFF0
 005219EC    mov         esi,eax
 005219EE    lea         eax,[esi+3BC]
 005219F4    xor         ecx,ecx
 005219F6    mov         edx,10
 005219FB    call        @FillChar
 00521A00    mov         eax,esi
 00521A02    mov         edx,dword ptr [eax]
 00521A04    call        dword ptr [edx+90]
 00521A0A    mov         dword ptr [esp],1
 00521A11    mov         dword ptr [esp+4],1
 00521A19    mov         edx,esp
 00521A1B    mov         eax,esi
 00521A1D    call        0051F7D8
 00521A22    mov         dword ptr [esp+8],1
 00521A2A    mov         dword ptr [esp+0C],1
 00521A32    lea         edx,[esp+8]
 00521A36    mov         eax,esi
 00521A38    mov         ecx,dword ptr [eax]
 00521A3A    call        dword ptr [ecx+110]
 00521A40    mov         edx,1
 00521A45    mov         eax,esi
 00521A47    call        00520F08
 00521A4C    mov         edx,1
 00521A51    mov         eax,esi
 00521A53    call        0051FEB4
 00521A58    add         esp,10
 00521A5B    pop         esi
 00521A5C    ret
end;*}

//00521A60
{*procedure sub_00521A60(?:?; ?:?);
begin
 00521A60    push        ebx
 00521A61    push        esi
 00521A62    push        edi
 00521A63    mov         esi,edx
 00521A65    mov         ebx,eax
 00521A67    cmp         dword ptr [ebx+2D4],0
>00521A6E    je          00521AE9
 00521A70    mov         eax,dword ptr [ebx+2A4]
 00521A76    mov         edx,dword ptr [eax]
 00521A78    call        dword ptr [edx+14]
 00521A7B    dec         eax
>00521A7C    jl          00521AE9
 00521A7E    test        esi,esi
>00521A80    jle         00521AAA
 00521A82    mov         edi,esi
 00521A84    dec         edi
 00521A85    mov         edx,edi
 00521A87    mov         eax,dword ptr [ebx+2A4]
 00521A8D    mov         ecx,dword ptr [eax]
 00521A8F    call        dword ptr [ecx+18]
 00521A92    mov         edx,eax
 00521A94    mov         eax,dword ptr [ebx+2D4]
 00521A9A    mov         ecx,dword ptr [eax]
 00521A9C    call        dword ptr [ecx+7C]
 00521A9F    mov         edx,edi
 00521AA1    mov         eax,ebx
 00521AA3    call        005217E0
>00521AA8    jmp         00521AE9
 00521AAA    mov         eax,dword ptr [ebx+2D4]
 00521AB0    mov         edx,dword ptr [eax]
 00521AB2    call        dword ptr [edx+80]
 00521AB8    mov         eax,dword ptr [ebx+2D4]
 00521ABE    mov         edx,dword ptr [eax]
 00521AC0    call        dword ptr [edx+5C]
 00521AC3    mov         ecx,eax
 00521AC5    xor         edx,edx
 00521AC7    mov         eax,dword ptr [ebx+2A4]
 00521ACD    mov         edi,dword ptr [eax]
 00521ACF    call        dword ptr [edi+24]
 00521AD2    mov         eax,dword ptr [ebx+2A4]
 00521AD8    mov         edx,dword ptr [eax]
 00521ADA    call        dword ptr [edx+14]
 00521ADD    dec         eax
>00521ADE    jle         00521AE9
 00521AE0    xor         edx,edx
 00521AE2    mov         eax,ebx
 00521AE4    call        005217E0
 00521AE9    lea         edi,[esi+1]
 00521AEC    mov         edx,edi
 00521AEE    mov         ecx,7FFFFFFF
 00521AF3    mov         eax,ebx
 00521AF5    call        0051CD40
 00521AFA    mov         edx,edi
 00521AFC    mov         ecx,7FFFFFFF
 00521B01    mov         eax,ebx
 00521B03    call        0051CBEC
 00521B08    pop         edi
 00521B09    pop         esi
 00521B0A    pop         ebx
 00521B0B    ret
end;*}

//00521B0C
{*procedure sub_00521B0C(?:?; ?:?);
begin
 00521B0C    push        ebx
 00521B0D    push        esi
 00521B0E    push        edi
 00521B0F    mov         esi,edx
 00521B11    mov         ebx,eax
 00521B13    cmp         dword ptr [ebx+2D4],0
>00521B1A    je          00521B95
 00521B1C    mov         eax,dword ptr [ebx+2A4]
 00521B22    mov         edx,dword ptr [eax]
 00521B24    call        dword ptr [edx+14]
 00521B27    dec         eax
>00521B28    jl          00521B95
 00521B2A    test        esi,esi
>00521B2C    jle         00521B56
 00521B2E    mov         edi,esi
 00521B30    dec         edi
 00521B31    mov         edx,edi
 00521B33    mov         eax,dword ptr [ebx+2A4]
 00521B39    mov         ecx,dword ptr [eax]
 00521B3B    call        dword ptr [ecx+18]
 00521B3E    mov         edx,eax
 00521B40    mov         eax,dword ptr [ebx+2D4]
 00521B46    mov         ecx,dword ptr [eax]
 00521B48    call        dword ptr [ecx+7C]
 00521B4B    mov         edx,edi
 00521B4D    mov         eax,ebx
 00521B4F    call        005217E0
>00521B54    jmp         00521B95
 00521B56    mov         eax,dword ptr [ebx+2D4]
 00521B5C    mov         edx,dword ptr [eax]
 00521B5E    call        dword ptr [edx+80]
 00521B64    mov         eax,dword ptr [ebx+2D4]
 00521B6A    mov         edx,dword ptr [eax]
 00521B6C    call        dword ptr [edx+5C]
 00521B6F    mov         ecx,eax
 00521B71    xor         edx,edx
 00521B73    mov         eax,dword ptr [ebx+2A4]
 00521B79    mov         edi,dword ptr [eax]
 00521B7B    call        dword ptr [edi+24]
 00521B7E    mov         eax,dword ptr [ebx+2A4]
 00521B84    mov         edx,dword ptr [eax]
 00521B86    call        dword ptr [edx+14]
 00521B89    dec         eax
>00521B8A    jle         00521B95
 00521B8C    xor         edx,edx
 00521B8E    mov         eax,ebx
 00521B90    call        005217E0
 00521B95    mov         eax,ebx
 00521B97    call        0051CBB4
 00521B9C    mov         ecx,eax
 00521B9E    add         ecx,dword ptr [ebx+2A8]
 00521BA4    lea         edi,[esi+1]
 00521BA7    mov         edx,edi
 00521BA9    mov         eax,ebx
 00521BAB    call        0051CD40
 00521BB0    mov         eax,ebx
 00521BB2    call        0051CBB4
 00521BB7    mov         ecx,eax
 00521BB9    add         ecx,dword ptr [ebx+2A8]
 00521BBF    mov         edx,edi
 00521BC1    mov         eax,ebx
 00521BC3    call        0051CBEC
 00521BC8    pop         edi
 00521BC9    pop         esi
 00521BCA    pop         ebx
 00521BCB    ret
end;*}

//00521BCC
{*procedure sub_00521BCC(?:?);
begin
 00521BCC    push        ebx
 00521BCD    mov         ebx,eax
 00521BCF    mov         eax,dword ptr [ebx+2A4]
 00521BD5    mov         edx,dword ptr [eax]
 00521BD7    call        dword ptr [edx+14]
 00521BDA    test        eax,eax
>00521BDC    jne         00521BEB
 00521BDE    xor         edx,edx
 00521BE0    mov         eax,dword ptr [ebx+2A4]
 00521BE6    mov         ecx,dword ptr [eax]
 00521BE8    call        dword ptr [ecx+38]
 00521BEB    mov         eax,ebx
 00521BED    call        TmwCustomEdit.ClearUndo
 00521BF2    pop         ebx
 00521BF3    ret
end;*}

//00521BF4
{*procedure sub_00521BF4(?:?; ?:?);
begin
 00521BF4    push        ebx
 00521BF5    push        esi
 00521BF6    push        edi
 00521BF7    mov         esi,edx
 00521BF9    mov         ebx,eax
 00521BFB    mov         edi,dword ptr [ebx+2D4]
 00521C01    test        edi,edi
>00521C03    je          00521C33
 00521C05    mov         edx,esi
 00521C07    mov         eax,dword ptr [ebx+2A4]
 00521C0D    mov         ecx,dword ptr [eax]
 00521C0F    call        dword ptr [ecx+18]
 00521C12    mov         edx,eax
 00521C14    mov         eax,edi
 00521C16    mov         ecx,dword ptr [eax]
 00521C18    call        dword ptr [ecx+7C]
 00521C1B    mov         edx,esi
 00521C1D    mov         eax,ebx
 00521C1F    call        005217E0
 00521C24    mov         ecx,eax
 00521C26    inc         ecx
 00521C27    lea         edx,[esi+1]
 00521C2A    mov         eax,ebx
 00521C2C    call        0051CD40
>00521C31    jmp         00521C41
 00521C33    lea         eax,[esi+1]
 00521C36    mov         ecx,eax
 00521C38    mov         edx,eax
 00521C3A    mov         eax,ebx
 00521C3C    call        0051CD40
 00521C41    pop         edi
 00521C42    pop         esi
 00521C43    pop         ebx
 00521C44    ret
end;*}

//00521C48
procedure sub_00521C48(?:TmwCustomEdit);
begin
{*
 00521C48    push        ebp
 00521C49    mov         ebp,esp
 00521C4B    push        0
 00521C4D    push        ebx
 00521C4E    push        esi
 00521C4F    push        edi
 00521C50    mov         ebx,eax
 00521C52    xor         eax,eax
 00521C54    push        ebp
 00521C55    push        521D37
 00521C5A    push        dword ptr fs:[eax]
 00521C5D    mov         dword ptr fs:[eax],esp
 00521C60    cmp         dword ptr [ebx+2D4],0
>00521C67    je          00521D21
 00521C6D    mov         eax,dword ptr [ebx+2A4]
 00521C73    mov         edx,dword ptr [eax]
 00521C75    call        dword ptr [edx+14]
 00521C78    test        eax,eax
>00521C7A    jle         00521D21
 00521C80    mov         eax,dword ptr [ebx+2D4]
 00521C86    mov         edx,dword ptr [eax]
 00521C88    call        dword ptr [edx+80]
 00521C8E    mov         eax,dword ptr [ebx+2D4]
 00521C94    mov         edx,dword ptr [eax]
 00521C96    call        dword ptr [edx+5C]
 00521C99    mov         ecx,eax
 00521C9B    xor         edx,edx
 00521C9D    mov         eax,dword ptr [ebx+2A4]
 00521CA3    mov         esi,dword ptr [eax]
 00521CA5    call        dword ptr [esi+24]
 00521CA8    mov         esi,1
>00521CAD    jmp         00521D12
 00521CAF    mov         edx,esi
 00521CB1    dec         edx
 00521CB2    mov         eax,dword ptr [ebx+2A4]
 00521CB8    mov         ecx,dword ptr [eax]
 00521CBA    call        dword ptr [ecx+18]
 00521CBD    mov         edx,eax
 00521CBF    mov         eax,dword ptr [ebx+2D4]
 00521CC5    mov         ecx,dword ptr [eax]
 00521CC7    call        dword ptr [ecx+7C]
 00521CCA    lea         ecx,[ebp-4]
 00521CCD    mov         edx,esi
 00521CCF    dec         edx
 00521CD0    mov         eax,dword ptr [ebx+2A4]
 00521CD6    mov         edi,dword ptr [eax]
 00521CD8    call        dword ptr [edi+0C]
 00521CDB    mov         edx,dword ptr [ebp-4]
 00521CDE    mov         ecx,esi
 00521CE0    dec         ecx
 00521CE1    mov         eax,dword ptr [ebx+2D4]
 00521CE7    mov         edi,dword ptr [eax]
 00521CE9    call        dword ptr [edi+74]
 00521CEC    mov         eax,dword ptr [ebx+2D4]
 00521CF2    call        TmwCustomHighLighter.NextToEol
 00521CF7    mov         eax,dword ptr [ebx+2D4]
 00521CFD    mov         edx,dword ptr [eax]
 00521CFF    call        dword ptr [edx+5C]
 00521D02    mov         ecx,eax
 00521D04    mov         edx,esi
 00521D06    mov         eax,dword ptr [ebx+2A4]
 00521D0C    mov         edi,dword ptr [eax]
 00521D0E    call        dword ptr [edi+24]
 00521D11    inc         esi
 00521D12    mov         eax,dword ptr [ebx+2A4]
 00521D18    mov         edx,dword ptr [eax]
 00521D1A    call        dword ptr [edx+14]
 00521D1D    cmp         esi,eax
>00521D1F    jl          00521CAF
 00521D21    xor         eax,eax
 00521D23    pop         edx
 00521D24    pop         ecx
 00521D25    pop         ecx
 00521D26    mov         dword ptr fs:[eax],edx
 00521D29    push        521D3E
 00521D2E    lea         eax,[ebp-4]
 00521D31    call        @UStrClr
 00521D36    ret
>00521D37    jmp         @HandleFinally
>00521D3C    jmp         00521D2E
 00521D3E    pop         edi
 00521D3F    pop         esi
 00521D40    pop         ebx
 00521D41    pop         ecx
 00521D42    pop         ebp
 00521D43    ret
*}
end;

//00521D44
{*procedure sub_00521D44(?:TmwCustomEdit; ?:?);
begin
 00521D44    push        ebp
 00521D45    mov         ebp,esp
 00521D47    add         esp,0FFFFFFCC
 00521D4A    push        ebx
 00521D4B    push        esi
 00521D4C    push        edi
 00521D4D    xor         ecx,ecx
 00521D4F    mov         dword ptr [ebp-4],ecx
 00521D52    mov         esi,edx
 00521D54    lea         edi,[ebp-0C]
 00521D57    movs        dword ptr [edi],dword ptr [esi]
 00521D58    movs        dword ptr [edi],dword ptr [esi]
 00521D59    mov         esi,eax
 00521D5B    xor         eax,eax
 00521D5D    push        ebp
 00521D5E    push        521FAB
 00521D63    push        dword ptr fs:[eax]
 00521D66    mov         dword ptr fs:[eax],esp
 00521D69    mov         ecx,dword ptr [esi+2B0]
 00521D6F    mov         edx,1
 00521D74    mov         eax,dword ptr [ebp-0C]
 00521D77    call        00510494
 00521D7C    mov         dword ptr [ebp-0C],eax
 00521D7F    mov         eax,dword ptr [esi+2A4]
 00521D85    mov         edx,dword ptr [eax]
 00521D87    call        dword ptr [edx+14]
 00521D8A    mov         ecx,eax
 00521D8C    mov         edx,1
 00521D91    mov         eax,dword ptr [ebp-8]
 00521D94    call        00510494
 00521D99    mov         ebx,eax
 00521D9B    mov         dword ptr [ebp-8],ebx
 00521D9E    lea         ecx,[ebp-4]
 00521DA1    mov         edx,ebx
 00521DA3    dec         edx
 00521DA4    mov         eax,dword ptr [esi+2A4]
 00521DAA    mov         ebx,dword ptr [eax]
 00521DAC    call        dword ptr [ebx+0C]
 00521DAF    cmp         dword ptr [ebp-4],0
>00521DB3    je          00521F95
 00521DB9    mov         edx,dword ptr [ebp-4]
 00521DBC    mov         eax,edx
 00521DBE    test        eax,eax
>00521DC0    je          00521DC7
 00521DC2    sub         eax,4
 00521DC5    mov         eax,dword ptr [eax]
 00521DC7    cmp         eax,dword ptr [ebp-0C]
>00521DCA    jge         00521DDA
 00521DCC    mov         eax,edx
 00521DCE    test        eax,eax
>00521DD0    je          00521DD7
 00521DD2    sub         eax,4
 00521DD5    mov         eax,dword ptr [eax]
 00521DD7    mov         dword ptr [ebp-0C],eax
 00521DDA    mov         eax,dword ptr [ebp-0C]
 00521DDD    mov         dword ptr [ebp-14],eax
 00521DE0    mov         eax,dword ptr [ebp-8]
 00521DE3    mov         dword ptr [ebp-10],eax
 00521DE6    mov         ebx,dword ptr [esi+2D4]
 00521DEC    test        ebx,ebx
>00521DEE    je          00521DFC
 00521DF0    lea         edx,[ebp-34]
 00521DF3    mov         eax,ebx
 00521DF5    mov         ecx,dword ptr [eax]
 00521DF7    call        dword ptr [ecx+34]
>00521DFA    jmp         00521E0D
 00521DFC    push        esi
 00521DFD    mov         esi,521FBC
 00521E02    lea         edi,[ebp-34]
 00521E05    mov         ecx,8
 00521E0A    rep movs    dword ptr [edi],dword ptr [esi]
 00521E0C    pop         esi
 00521E0D    mov         edx,dword ptr [ebp-4]
 00521E10    mov         eax,dword ptr [ebp-14]
 00521E13    movzx       edx,word ptr [edx+eax*2-2]
 00521E18    cmp         dx,0FF
>00521E1D    ja          00521E26
 00521E1F    movzx       edx,dx
 00521E22    bt          dword ptr [ebp-34],edx
>00521E26    jb          00521EF0
 00521E2C    dec         eax
>00521E2D    jle         00521E6C
 00521E2F    mov         eax,dword ptr [ebp-4]
 00521E32    mov         edx,dword ptr [ebp-14]
 00521E35    movzx       eax,word ptr [eax+edx*2-2]
 00521E3A    cmp         ax,0FF
>00521E3E    ja          00521E47
 00521E40    movzx       eax,ax
 00521E43    bt          dword ptr [ebp-34],eax
>00521E47    jb          00521E6C
>00521E49    jmp         00521E65
 00521E4B    mov         edx,dword ptr [ebp-4]
 00521E4E    movzx       eax,word ptr [edx+eax*2-2]
 00521E53    cmp         ax,0FF
>00521E57    ja          00521E60
 00521E59    movzx       eax,ax
 00521E5C    bt          dword ptr [ebp-34],eax
>00521E60    jb          00521E6C
 00521E62    dec         dword ptr [ebp-14]
 00521E65    mov         eax,dword ptr [ebp-14]
 00521E68    test        eax,eax
>00521E6A    jg          00521E4B
 00521E6C    mov         eax,dword ptr [ebp-4]
 00521E6F    mov         edx,dword ptr [ebp-14]
 00521E72    movzx       eax,word ptr [eax+edx*2-2]
 00521E77    cmp         ax,0FF
>00521E7B    ja          00521E84
 00521E7D    movzx       eax,ax
 00521E80    bt          dword ptr [ebp-34],eax
>00521E84    jb          00521EC8
 00521E86    mov         eax,dword ptr [ebp-0C]
 00521E89    mov         dword ptr [ebp-14],eax
 00521E8C    mov         eax,dword ptr [ebp-8]
 00521E8F    mov         dword ptr [ebp-10],eax
>00521E92    jmp         00521EAE
 00521E94    mov         edx,dword ptr [ebp-4]
 00521E97    movzx       eax,word ptr [edx+eax*2-2]
 00521E9C    cmp         ax,0FF
>00521EA0    ja          00521EA9
 00521EA2    movzx       eax,ax
 00521EA5    bt          dword ptr [ebp-34],eax
>00521EA9    jb          00521EB9
 00521EAB    inc         dword ptr [ebp-14]
 00521EAE    mov         eax,dword ptr [ebp-14]
 00521EB1    cmp         eax,dword ptr [esi+2B0]
>00521EB7    jl          00521E94
 00521EB9    mov         eax,dword ptr [ebp-14]
 00521EBC    cmp         eax,dword ptr [esi+2B0]
>00521EC2    jg          00521F95
 00521EC8    mov         eax,dword ptr [ebp-14]
 00521ECB    mov         dword ptr [ebp-0C],eax
 00521ECE    mov         eax,dword ptr [ebp-10]
 00521ED1    mov         dword ptr [ebp-8],eax
>00521ED4    jmp         00521EF0
 00521ED6    mov         edx,dword ptr [ebp-4]
 00521ED9    movzx       eax,word ptr [edx+eax*2-2]
 00521EDE    cmp         ax,0FF
>00521EE2    ja          00521EEB
 00521EE4    movzx       eax,ax
 00521EE7    bt          dword ptr [ebp-34],eax
>00521EEB    jae         00521EF7
 00521EED    dec         dword ptr [ebp-14]
 00521EF0    mov         eax,dword ptr [ebp-14]
 00521EF3    test        eax,eax
>00521EF5    jg          00521ED6
 00521EF7    inc         dword ptr [ebp-14]
 00521EFA    cmp         dword ptr [ebp-14],1
>00521EFE    jge         00521F07
 00521F00    mov         dword ptr [ebp-14],1
 00521F07    mov         eax,dword ptr [ebp-14]
 00521F0A    mov         dword ptr [esi+278],eax
 00521F10    mov         eax,dword ptr [ebp-10]
 00521F13    mov         dword ptr [esi+27C],eax
 00521F19    mov         eax,dword ptr [ebp-0C]
 00521F1C    mov         dword ptr [ebp-14],eax
 00521F1F    mov         eax,dword ptr [ebp-8]
 00521F22    mov         dword ptr [ebp-10],eax
>00521F25    jmp         00521F41
 00521F27    mov         edx,dword ptr [ebp-4]
 00521F2A    movzx       eax,word ptr [edx+eax*2-2]
 00521F2F    cmp         ax,0FF
>00521F33    ja          00521F3C
 00521F35    movzx       eax,ax
 00521F38    bt          dword ptr [ebp-34],eax
>00521F3C    jae         00521F4C
 00521F3E    inc         dword ptr [ebp-14]
 00521F41    mov         eax,dword ptr [ebp-14]
 00521F44    cmp         eax,dword ptr [esi+2B0]
>00521F4A    jl          00521F27
 00521F4C    mov         eax,dword ptr [esi+2B0]
 00521F52    cmp         eax,dword ptr [ebp-14]
>00521F55    jge         00521F5A
 00521F57    mov         dword ptr [ebp-14],eax
 00521F5A    mov         eax,dword ptr [ebp-14]
 00521F5D    mov         dword ptr [esi+280],eax
 00521F63    mov         eax,dword ptr [ebp-10]
 00521F66    mov         dword ptr [esi+284],eax
 00521F6C    lea         edx,[ebp-14]
 00521F6F    mov         eax,esi
 00521F71    mov         ecx,dword ptr [eax]
 00521F73    call        dword ptr [ecx+110]
 00521F79    mov         eax,dword ptr [ebp-8]
 00521F7C    mov         ecx,eax
 00521F7E    mov         edx,eax
 00521F80    mov         eax,esi
 00521F82    call        0051CD40
 00521F87    movzx       edx,byte ptr ds:[521FDC];0x80 gvar_00521FDC
 00521F8E    mov         eax,esi
 00521F90    call        005287FC
 00521F95    xor         eax,eax
 00521F97    pop         edx
 00521F98    pop         ecx
 00521F99    pop         ecx
 00521F9A    mov         dword ptr fs:[eax],edx
 00521F9D    push        521FB2
 00521FA2    lea         eax,[ebp-4]
 00521FA5    call        @UStrClr
 00521FAA    ret
>00521FAB    jmp         @HandleFinally
>00521FB0    jmp         00521FA2
 00521FB2    pop         edi
 00521FB3    pop         esi
 00521FB4    pop         ebx
 00521FB5    mov         esp,ebp
 00521FB7    pop         ebp
 00521FB8    ret
end;*}

//00521FE0
procedure TmwCustomEdit.DblClick;
begin
{*
 00521FE0    push        ebx
 00521FE1    add         esp,0FFFFFFF0
 00521FE4    mov         ebx,eax
 00521FE6    push        esp
 00521FE7    call        user32.GetCursorPos
 00521FEC    lea         ecx,[esp+8]
 00521FF0    mov         edx,esp
 00521FF2    mov         eax,ebx
 00521FF4    call        TControl.ScreenToClient
 00521FF9    mov         eax,dword ptr [esp+8]
 00521FFD    mov         dword ptr [esp],eax
 00522000    mov         eax,dword ptr [esp+0C]
 00522004    mov         dword ptr [esp+4],eax
 00522008    mov         eax,dword ptr [ebx+29C];TmwCustomEdit.fGutterWidth:Integer
 0052200E    add         eax,2
 00522011    cmp         eax,dword ptr [esp]
>00522014    jg          00522046
 00522016    lea         edx,[esp+8]
 0052201A    mov         eax,ebx
 0052201C    call        0051FBB8
 00522021    lea         edx,[esp+8]
 00522025    mov         eax,ebx
 00522027    call        00521D44
 0052202C    mov         eax,ebx
 0052202E    call        TControl.DblClick
 00522033    or          word ptr [ebx+3CC],40;TmwCustomEdit.fStateFlags:TmwStateFlags
 0052203B    xor         edx,edx
 0052203D    mov         eax,ebx
 0052203F    call        TControl.SetMouseCapture
>00522044    jmp         0052204D
 00522046    mov         eax,ebx
 00522048    call        TControl.DblClick
 0052204D    add         esp,10
 00522050    pop         ebx
 00522051    ret
*}
end;

//00522054
function sub_00522054(?:TmwCustomEdit):Boolean;
begin
{*
 00522054    push        ebx
 00522055    mov         ebx,eax
 00522057    mov         eax,dword ptr [ebx+2DC]
 0052205D    call        00529898
 00522062    test        eax,eax
 00522064    setg        al
 00522067    pop         ebx
 00522068    ret
*}
end;

//0052206C
function sub_0052206C(?:TmwCustomEdit):Boolean;
begin
{*
 0052206C    push        ebx
 0052206D    mov         ebx,eax
 0052206F    mov         eax,dword ptr [ebx+2E0]
 00522075    call        00529898
 0052207A    test        eax,eax
 0052207C    setg        al
 0052207F    pop         ebx
 00522080    ret
*}
end;

//00522084
{*function sub_00522084:?;
begin
 00522084    call        Clipboard
 00522089    mov         dx,1
 0052208D    call        TClipboard.HasFormat
 00522092    test        al,al
>00522094    jne         005220AE
 00522096    call        Clipboard
 0052209B    movzx       edx,word ptr ds:[793B24];gvar_00793B24:LongWord
 005220A2    call        TClipboard.HasFormat
 005220A7    test        al,al
>005220A9    jne         005220AE
 005220AB    xor         eax,eax
 005220AD    ret
 005220AE    mov         al,1
 005220B0    ret
end;*}

//005220B4
{*procedure sub_005220B4(?:TmwCustomEdit; ?:?; ?:?; ?:?);
begin
 005220B4    push        ebp
 005220B5    mov         ebp,esp
 005220B7    add         esp,0FFFFFFF0
 005220BA    push        ebx
 005220BB    push        esi
 005220BC    push        edi
 005220BD    mov         esi,ecx
 005220BF    lea         edi,[ebp-10]
 005220C2    movs        dword ptr [edi],dword ptr [esi]
 005220C3    movs        dword ptr [edi],dword ptr [esi]
 005220C4    mov         esi,edx
 005220C6    lea         edi,[ebp-8]
 005220C9    movs        dword ptr [edi],dword ptr [esi]
 005220CA    movs        dword ptr [edi],dword ptr [esi]
 005220CB    mov         ebx,eax
 005220CD    lea         edx,[ebp-8]
 005220D0    mov         eax,ebx
 005220D2    mov         ecx,dword ptr [eax]
 005220D4    call        dword ptr [ecx+110]
 005220DA    lea         edx,[ebp-8]
 005220DD    mov         eax,ebx
 005220DF    call        0051F7D8
 005220E4    lea         edx,[ebp-10]
 005220E7    mov         eax,ebx
 005220E9    call        0051F99C
 005220EE    mov         byte ptr [ebx+390],1
 005220F5    push        0
 005220F7    mov         ecx,dword ptr [ebp+8]
 005220FA    mov         dl,1
 005220FC    mov         eax,ebx
 005220FE    call        00520D98
 00522103    movzx       edx,byte ptr ds:[52211C];0x80 gvar_0052211C
 0052210A    mov         eax,ebx
 0052210C    call        005287FC
 00522111    pop         edi
 00522112    pop         esi
 00522113    pop         ebx
 00522114    mov         esp,ebp
 00522116    pop         ebp
 00522117    ret         4
end;*}

//00522120
procedure TmwCustomEdit.Redo;
begin
{*
 00522120    push        ebp
 00522121    mov         ebp,esp
 00522123    add         esp,0FFFFFF8C
 00522126    push        ebx
 00522127    push        esi
 00522128    xor         edx,edx
 0052212A    mov         dword ptr [ebp-6C],edx
 0052212D    mov         dword ptr [ebp-68],edx
 00522130    mov         dword ptr [ebp-64],edx
 00522133    mov         dword ptr [ebp-0C],edx
 00522136    mov         dword ptr [ebp-8],eax
 00522139    xor         eax,eax
 0052213B    push        ebp
 0052213C    push        5225AC
 00522141    push        dword ptr fs:[eax]
 00522144    mov         dword ptr fs:[eax],esp
 00522147    mov         eax,dword ptr [ebp-8]
 0052214A    call        0052206C
 0052214F    test        al,al
>00522151    je          00522589
 00522157    mov         eax,dword ptr [ebp-8]
 0052215A    movzx       eax,byte ptr [eax+390];TmwCustomEdit.fSelectionMode:TSelectionMode
 00522161    mov         byte ptr [ebp-22],al
 00522164    lea         eax,[ebp-10]
 00522167    push        eax
 00522168    lea         eax,[ebp-23]
 0052216B    push        eax
 0052216C    lea         ecx,[ebp-20]
 0052216F    lea         edx,[ebp-18]
 00522172    mov         eax,dword ptr [ebp-8]
 00522175    mov         eax,dword ptr [eax+2E0];TmwCustomEdit.fRedoList:TUndoList
 0052217B    call        TUndoList.GetChange
 00522180    mov         byte ptr [ebp-21],al
 00522183    movzx       edx,byte ptr [ebp-23]
 00522187    mov         eax,dword ptr [ebp-8]
 0052218A    call        TmwCustomEdit.SetSelectionMode
 0052218F    movzx       eax,byte ptr [ebp-21]
 00522193    cmp         eax,9
>00522196    ja          0052257D
 0052219C    jmp         dword ptr [eax*4+5221A3]
 0052219C    dd          005221CB
 0052219C    dd          005221CB
 0052219C    dd          005221CB
 0052219C    dd          00522244
 0052219C    dd          005222D6
 0052219C    dd          005222D6
 0052219C    dd          005222D6
 0052219C    dd          00522384
 0052219C    dd          0052239E
 0052219C    dd          0052246A
 005221CB    mov         eax,dword ptr [ebp-8]
 005221CE    call        0051CBE4
 005221D3    lea         edx,[ebp-18]
 005221D6    mov         eax,dword ptr [ebp-8]
 005221D9    mov         ecx,dword ptr [eax]
 005221DB    call        dword ptr [ecx+110];TmwCustomEdit.sub_0051FBE0
 005221E1    lea         edx,[ebp-18]
 005221E4    mov         eax,dword ptr [ebp-8]
 005221E7    call        0051F7D8
 005221EC    mov         eax,dword ptr [ebp-8]
 005221EF    call        0051C458
 005221F4    push        0
 005221F6    mov         ecx,dword ptr [ebp-10]
 005221F9    movzx       edx,byte ptr [ebp-23]
 005221FD    mov         eax,dword ptr [ebp-8]
 00522200    call        00520D98
 00522205    lea         eax,[ebp-20]
 00522208    push        eax
 00522209    lea         edx,[ebp-64]
 0052220C    mov         eax,dword ptr [ebp-8]
 0052220F    call        0051C7FC
 00522214    mov         eax,dword ptr [ebp-64]
 00522217    call        @UStrToPWChar
 0052221C    push        eax
 0052221D    movzx       eax,byte ptr [ebp-23]
 00522221    push        eax
 00522222    mov         eax,dword ptr [ebp-8]
 00522225    mov         eax,dword ptr [eax+2DC];TmwCustomEdit.fUndoList:TUndoList
 0052222B    lea         ecx,[ebp-18]
 0052222E    movzx       edx,byte ptr [ebp-21]
 00522232    call        TUndoList.AddChange
 00522237    mov         eax,dword ptr [ebp-10]
 0052223A    call        StrDispose
>0052223F    jmp         0052257D
 00522244    mov         eax,dword ptr [ebp-8]
 00522247    call        0051CBE4
 0052224C    lea         edx,[ebp-18]
 0052224F    mov         eax,dword ptr [ebp-8]
 00522252    mov         ecx,dword ptr [eax]
 00522254    call        dword ptr [ecx+110];TmwCustomEdit.sub_0051FBE0
 0052225A    lea         edx,[ebp-18]
 0052225D    mov         eax,dword ptr [ebp-8]
 00522260    call        0051F7D8
 00522265    lea         edx,[ebp-20]
 00522268    mov         eax,dword ptr [ebp-8]
 0052226B    call        0051F99C
 00522270    mov         eax,dword ptr [ebp-8]
 00522273    call        0051C458
 00522278    lea         eax,[ebp-20]
 0052227B    push        eax
 0052227C    lea         edx,[ebp-68]
 0052227F    mov         eax,dword ptr [ebp-8]
 00522282    call        0051C7FC
 00522287    mov         eax,dword ptr [ebp-68]
 0052228A    call        @UStrToPWChar
 0052228F    push        eax
 00522290    movzx       eax,byte ptr [ebp-23]
 00522294    push        eax
 00522295    mov         eax,dword ptr [ebp-8]
 00522298    mov         eax,dword ptr [eax+2DC];TmwCustomEdit.fUndoList:TUndoList
 0052229E    lea         ecx,[ebp-18]
 005222A1    movzx       edx,byte ptr [ebp-21]
 005222A5    call        TUndoList.AddChange
 005222AA    push        0
 005222AC    mov         ecx,dword ptr [ebp-10]
 005222AF    movzx       edx,byte ptr [ebp-23]
 005222B3    mov         eax,dword ptr [ebp-8]
 005222B6    call        00520D98
 005222BB    mov         eax,dword ptr [ebp-10]
 005222BE    call        StrDispose
 005222C3    lea         edx,[ebp-18]
 005222C6    mov         eax,dword ptr [ebp-8]
 005222C9    mov         ecx,dword ptr [eax]
 005222CB    call        dword ptr [ecx+110];TmwCustomEdit.sub_0051FBE0
>005222D1    jmp         0052257D
 005222D6    mov         eax,dword ptr [ebp-8]
 005222D9    call        0051CBE4
 005222DE    lea         edx,[ebp-18]
 005222E1    mov         eax,dword ptr [ebp-8]
 005222E4    call        0051F7D8
 005222E9    lea         edx,[ebp-20]
 005222EC    mov         eax,dword ptr [ebp-8]
 005222EF    call        0051F99C
 005222F4    mov         eax,dword ptr [ebp-8]
 005222F7    call        0051C458
 005222FC    lea         eax,[ebp-20]
 005222FF    push        eax
 00522300    lea         edx,[ebp-6C]
 00522303    mov         eax,dword ptr [ebp-8]
 00522306    call        0051C7FC
 0052230B    mov         eax,dword ptr [ebp-6C]
 0052230E    call        @UStrToPWChar
 00522313    push        eax
 00522314    movzx       eax,byte ptr [ebp-23]
 00522318    push        eax
 00522319    mov         eax,dword ptr [ebp-8]
 0052231C    mov         eax,dword ptr [eax+2DC];TmwCustomEdit.fUndoList:TUndoList
 00522322    lea         ecx,[ebp-18]
 00522325    movzx       edx,byte ptr [ebp-21]
 00522329    call        TUndoList.AddChange
 0052232E    push        0
 00522330    mov         ecx,dword ptr [ebp-10]
 00522333    movzx       edx,byte ptr [ebp-23]
 00522337    mov         eax,dword ptr [ebp-8]
 0052233A    call        00520D98
 0052233F    mov         eax,dword ptr [ebp-10]
 00522342    call        StrDispose
 00522347    lea         edx,[ebp-18]
 0052234A    mov         eax,dword ptr [ebp-8]
 0052234D    mov         ecx,dword ptr [eax]
 0052234F    call        dword ptr [ecx+110];TmwCustomEdit.sub_0051FBE0
 00522355    mov         eax,dword ptr [ebp-8]
 00522358    mov         eax,dword ptr [eax+2E0];TmwCustomEdit.fRedoList:TUndoList
 0052235E    call        TUndoList.GetChangeReason
 00522363    cmp         al,2
>00522365    jne         0052236D
 00522367    cmp         byte ptr [ebp-21],6
>0052236B    je          00522377
 0052236D    cmp         byte ptr [ebp-21],5
>00522371    jne         0052257D
 00522377    mov         eax,dword ptr [ebp-8]
 0052237A    call        TmwCustomEdit.Redo
>0052237F    jmp         0052257D
 00522384    push        0
 00522386    mov         cx,0D
 0052238A    mov         dx,199
 0052238E    mov         eax,dword ptr [ebp-8]
 00522391    mov         ebx,dword ptr [eax]
 00522393    call        dword ptr [ebx+11C];TmwCustomEdit.CommandProcessor
>00522399    jmp         0052257D
 0052239E    mov         edx,dword ptr [ebp-20]
 005223A1    cmp         edx,1
>005223A4    jne         005223B1
 005223A6    mov         eax,dword ptr [ebp-1C]
 005223A9    dec         eax
 005223AA    mov         esi,1
>005223AF    jmp         005223BF
 005223B1    mov         eax,dword ptr [ebp-1C]
 005223B4    mov         ecx,dword ptr [ebp-8]
 005223B7    mov         esi,dword ptr [ecx+3A8];TmwCustomEdit.fTabWidth:Integer
 005223BD    add         esi,edx
 005223BF    mov         dword ptr [ebp-30],1
 005223C6    mov         edx,dword ptr [ebp-14]
 005223C9    mov         dword ptr [ebp-2C],edx
 005223CC    mov         dword ptr [ebp-38],1
 005223D3    mov         dword ptr [ebp-34],eax
 005223D6    mov         eax,dword ptr [ebp-10]
 005223D9    push        eax
 005223DA    lea         ecx,[ebp-38]
 005223DD    lea         edx,[ebp-30]
 005223E0    mov         eax,dword ptr [ebp-8]
 005223E3    call        005220B4
 005223E8    lea         eax,[ebp-20]
 005223EB    push        eax
 005223EC    mov         eax,dword ptr [ebp-10]
 005223EF    push        eax
 005223F0    movzx       eax,byte ptr [ebp-23]
 005223F4    push        eax
 005223F5    mov         eax,dword ptr [ebp-8]
 005223F8    mov         eax,dword ptr [eax+2DC];TmwCustomEdit.fUndoList:TUndoList
 005223FE    lea         ecx,[ebp-18]
 00522401    movzx       edx,byte ptr [ebp-21]
 00522405    call        TUndoList.AddChange
 0052240A    lea         edx,[ebp-18]
 0052240D    mov         eax,dword ptr [ebp-8]
 00522410    call        0051F7D8
 00522415    mov         dword ptr [ebp-40],1
 0052241C    mov         eax,dword ptr [ebp-1C]
 0052241F    inc         eax
 00522420    mov         dword ptr [ebp-3C],eax
 00522423    lea         edx,[ebp-40]
 00522426    mov         eax,dword ptr [ebp-8]
 00522429    mov         ecx,dword ptr [eax]
 0052242B    call        dword ptr [ecx+110];TmwCustomEdit.sub_0051FBE0
 00522431    mov         eax,dword ptr [ebp-8]
 00522434    mov         eax,dword ptr [eax+3A8];TmwCustomEdit.fTabWidth:Integer
 0052243A    add         eax,dword ptr [ebp-18]
 0052243D    mov         dword ptr [ebp-48],eax
 00522440    mov         eax,dword ptr [ebp-14]
 00522443    mov         dword ptr [ebp-44],eax
 00522446    lea         edx,[ebp-48]
 00522449    mov         eax,dword ptr [ebp-8]
 0052244C    call        0051F7D8
 00522451    mov         dword ptr [ebp-50],esi
 00522454    mov         eax,dword ptr [ebp-1C]
 00522457    mov         dword ptr [ebp-4C],eax
 0052245A    lea         edx,[ebp-50]
 0052245D    mov         eax,dword ptr [ebp-8]
 00522460    call        0051F99C
>00522465    jmp         0052257D
 0052246A    lea         eax,[ebp-20]
 0052246D    push        eax
 0052246E    mov         eax,dword ptr [ebp-10]
 00522471    push        eax
 00522472    push        1
 00522474    mov         eax,dword ptr [ebp-8]
 00522477    mov         eax,dword ptr [eax+2DC];TmwCustomEdit.fUndoList:TUndoList
 0052247D    lea         ecx,[ebp-18]
 00522480    movzx       edx,byte ptr [ebp-21]
 00522484    call        TUndoList.AddChange
 00522489    mov         esi,dword ptr [ebp-10]
 0052248C    mov         edx,dword ptr [ebp-14]
 0052248F    mov         eax,dword ptr [ebp-8]
 00522492    call        0051FB94
 00522497    mov         eax,esi
 00522499    call        00510818
 0052249E    mov         ebx,eax
 005224A0    cmp         esi,ebx
>005224A2    je          005224FE
 005224A4    mov         eax,ebx
 005224A6    sub         eax,esi
 005224A8    sar         eax,1
>005224AA    jns         005224AF
 005224AC    adc         eax,0
 005224AF    mov         dword ptr [ebp-28],eax
 005224B2    lea         ecx,[ebp-0C]
 005224B5    mov         eax,dword ptr [ebp-8]
 005224B8    mov         edx,dword ptr [eax+28C];TmwCustomEdit.fCaretY:Integer
 005224BE    mov         eax,dword ptr [ebp-8]
 005224C1    mov         eax,dword ptr [eax+2A4];TmwCustomEdit.fLines:TStrings
 005224C7    mov         esi,dword ptr [eax]
 005224C9    call        dword ptr [esi+0C];TStrings.Get
 005224CC    cmp         dword ptr [ebp-28],0
>005224D0    jle         005224E2
 005224D2    lea         eax,[ebp-0C]
 005224D5    mov         ecx,dword ptr [ebp-28]
 005224D8    mov         edx,1
 005224DD    call        @UStrDelete
 005224E2    mov         eax,dword ptr [ebp-8]
 005224E5    mov         edx,dword ptr [eax+28C];TmwCustomEdit.fCaretY:Integer
 005224EB    mov         eax,dword ptr [ebp-8]
 005224EE    mov         eax,dword ptr [eax+2A4];TmwCustomEdit.fLines:TStrings
 005224F4    mov         ecx,dword ptr [ebp-0C]
 005224F7    mov         esi,dword ptr [eax]
 005224F9    call        dword ptr [esi+20];TStrings.Put
>005224FC    jmp         00522503
 005224FE    xor         eax,eax
 00522500    mov         dword ptr [ebp-28],eax
 00522503    cmp         word ptr [ebx],0D
>00522507    jne         0052251E
 00522509    add         ebx,2
 0052250C    cmp         word ptr [ebx],0A
>00522510    jne         00522515
 00522512    add         ebx,2
 00522515    mov         eax,dword ptr [ebp-8]
 00522518    inc         dword ptr [eax+28C];TmwCustomEdit.fCaretY:Integer
 0052251E    mov         esi,ebx
 00522520    cmp         word ptr [ebx],0
>00522524    jne         00522497
 0052252A    mov         eax,dword ptr [ebp-8]
 0052252D    mov         edx,dword ptr [ebp-18]
 00522530    sub         edx,dword ptr [eax+3A8]
 00522536    mov         dword ptr [ebp-58],edx
 00522539    mov         eax,dword ptr [ebp-14]
 0052253C    mov         dword ptr [ebp-54],eax
 0052253F    lea         edx,[ebp-58]
 00522542    mov         eax,dword ptr [ebp-8]
 00522545    mov         ecx,dword ptr [eax]
 00522547    call        dword ptr [ecx+110];TmwCustomEdit.sub_0051FBE0
 0052254D    lea         edx,[ebp-74]
 00522550    mov         eax,dword ptr [ebp-8]
 00522553    call        0051FBB8
 00522558    lea         edx,[ebp-74]
 0052255B    mov         eax,dword ptr [ebp-8]
 0052255E    call        0051F7D8
 00522563    mov         eax,dword ptr [ebp-20]
 00522566    sub         eax,dword ptr [ebp-28]
 00522569    mov         dword ptr [ebp-60],eax
 0052256C    mov         eax,dword ptr [ebp-1C]
 0052256F    mov         dword ptr [ebp-5C],eax
 00522572    lea         edx,[ebp-60]
 00522575    mov         eax,dword ptr [ebp-8]
 00522578    call        0051F99C
 0052257D    movzx       edx,byte ptr [ebp-22]
 00522581    mov         eax,dword ptr [ebp-8]
 00522584    call        TmwCustomEdit.SetSelectionMode
 00522589    xor         eax,eax
 0052258B    pop         edx
 0052258C    pop         ecx
 0052258D    pop         ecx
 0052258E    mov         dword ptr fs:[eax],edx
 00522591    push        5225B3
 00522596    lea         eax,[ebp-6C]
 00522599    mov         edx,3
 0052259E    call        @UStrArrayClr
 005225A3    lea         eax,[ebp-0C]
 005225A6    call        @UStrClr
 005225AB    ret
>005225AC    jmp         @HandleFinally
>005225B1    jmp         00522596
 005225B3    pop         esi
 005225B4    pop         ebx
 005225B5    mov         esp,ebp
 005225B7    pop         ebp
 005225B8    ret
*}
end;

//005225BC
procedure TmwCustomEdit.Undo;
begin
{*
 005225BC    push        ebp
 005225BD    mov         ebp,esp
 005225BF    add         esp,0FFFFFF84
 005225C2    push        ebx
 005225C3    push        esi
 005225C4    push        edi
 005225C5    xor         edx,edx
 005225C7    mov         dword ptr [ebp-74],edx
 005225CA    mov         dword ptr [ebp-68],edx
 005225CD    mov         dword ptr [ebp-6C],edx
 005225D0    mov         dword ptr [ebp-70],edx
 005225D3    mov         dword ptr [ebp-64],edx
 005225D6    mov         dword ptr [ebp-60],edx
 005225D9    mov         dword ptr [ebp-5C],edx
 005225DC    mov         dword ptr [ebp-4],edx
 005225DF    mov         esi,eax
 005225E1    xor         eax,eax
 005225E3    push        ebp
 005225E4    push        522AA5
 005225E9    push        dword ptr fs:[eax]
 005225EC    mov         dword ptr fs:[eax],esp
 005225EF    mov         eax,esi
 005225F1    call        00522054
 005225F6    test        al,al
>005225F8    je          00522A82
 005225FE    movzx       eax,byte ptr [esi+390];TmwCustomEdit.fSelectionMode:TSelectionMode
 00522605    mov         byte ptr [ebp-25],al
 00522608    lea         eax,[ebp-8]
 0052260B    push        eax
 0052260C    lea         eax,[ebp-26]
 0052260F    push        eax
 00522610    lea         ecx,[ebp-18]
 00522613    lea         edx,[ebp-10]
 00522616    mov         eax,dword ptr [esi+2DC];TmwCustomEdit.fUndoList:TUndoList
 0052261C    call        TUndoList.GetChange
 00522621    mov         byte ptr [ebp-19],al
 00522624    movzx       edx,byte ptr [ebp-26]
 00522628    mov         eax,esi
 0052262A    call        TmwCustomEdit.SetSelectionMode
 0052262F    mov         eax,esi
 00522631    call        0051CBE4
 00522636    movzx       eax,byte ptr [ebp-19]
 0052263A    cmp         eax,9
>0052263D    ja          00522A70
 00522643    jmp         dword ptr [eax*4+52264A]
 00522643    dd          00522672
 00522643    dd          00522672
 00522643    dd          00522672
 00522643    dd          0052270D
 00522643    dd          0052270D
 00522643    dd          0052270D
 00522643    dd          0052270D
 00522643    dd          0052280A
 00522643    dd          0052295B
 00522643    dd          00522A05
 00522672    lea         edx,[ebp-10]
 00522675    mov         eax,esi
 00522677    call        0051F7D8
 0052267C    lea         edx,[ebp-18]
 0052267F    mov         eax,esi
 00522681    call        0051F99C
 00522686    lea         eax,[ebp-18]
 00522689    push        eax
 0052268A    lea         edx,[ebp-5C]
 0052268D    mov         eax,esi
 0052268F    call        0051C7FC
 00522694    mov         eax,dword ptr [ebp-5C]
 00522697    call        @UStrToPWChar
 0052269C    push        eax
 0052269D    movzx       eax,byte ptr [ebp-26]
 005226A1    push        eax
 005226A2    lea         ecx,[ebp-10]
 005226A5    movzx       edx,byte ptr [ebp-19]
 005226A9    mov         eax,dword ptr [esi+2E0];TmwCustomEdit.fRedoList:TUndoList
 005226AF    call        TUndoList.AddChange
 005226B4    push        0
 005226B6    mov         ecx,dword ptr [ebp-8]
 005226B9    movzx       edx,byte ptr [ebp-26]
 005226BD    mov         eax,esi
 005226BF    call        00520D98
 005226C4    mov         eax,dword ptr [ebp-8]
 005226C7    call        StrDispose
 005226CC    lea         edx,[ebp-10]
 005226CF    mov         eax,esi
 005226D1    mov         ecx,dword ptr [eax]
 005226D3    call        dword ptr [ecx+110];TmwCustomEdit.sub_0051FBE0
 005226D9    mov         eax,dword ptr [esi+2DC];TmwCustomEdit.fUndoList:TUndoList
 005226DF    call        TUndoList.GetChangeReason
 005226E4    cmp         al,6
>005226E6    jne         005226EE
 005226E8    cmp         byte ptr [ebp-19],2
>005226EC    je          00522701
 005226EE    mov         eax,dword ptr [esi+2DC];TmwCustomEdit.fUndoList:TUndoList
 005226F4    call        TUndoList.GetChangeReason
 005226F9    cmp         al,5
>005226FB    jne         00522A70
 00522701    mov         eax,esi
 00522703    call        TmwCustomEdit.Undo
>00522708    jmp         00522A70
 0052270D    cmp         byte ptr [ebp-26],1
>00522711    jne         0052273F
 00522713    mov         edx,dword ptr [ebp-18]
 00522716    mov         eax,dword ptr [ebp-10]
 00522719    call        0051048C
 0052271E    mov         ebx,eax
 00522720    mov         edx,dword ptr [ebp-14]
 00522723    mov         eax,dword ptr [ebp-0C]
 00522726    call        0051048C
 0052272B    mov         dword ptr [ebp-30],ebx
 0052272E    mov         dword ptr [ebp-2C],eax
 00522731    mov         eax,dword ptr [ebp-30]
 00522734    mov         dword ptr [ebp-24],eax
 00522737    mov         eax,dword ptr [ebp-2C]
 0052273A    mov         dword ptr [ebp-20],eax
>0052273D    jmp         0052274D
 0052273F    lea         ecx,[ebp-24]
 00522742    lea         edx,[ebp-18]
 00522745    lea         eax,[ebp-10]
 00522748    call        0051B830
 0052274D    cmp         byte ptr [ebp-19],3
>00522751    jne         00522791
 00522753    mov         eax,esi
 00522755    call        TmwCustomEdit.GetLineCount
 0052275A    cmp         eax,dword ptr [ebp-20]
>0052275D    jge         00522791
 0052275F    mov         eax,esi
 00522761    call        TmwCustomEdit.GetLineCount
 00522766    mov         dword ptr [ebp-38],1
 0052276D    mov         dword ptr [ebp-34],eax
 00522770    lea         edx,[ebp-38]
 00522773    mov         eax,esi
 00522775    mov         ecx,dword ptr [eax]
 00522777    call        dword ptr [ecx+110];TmwCustomEdit.sub_0051FBE0
 0052277D    push        0
 0052277F    mov         cx,0D
 00522783    mov         dx,199
 00522787    mov         eax,esi
 00522789    mov         ebx,dword ptr [eax]
 0052278B    call        dword ptr [ebx+11C];TmwCustomEdit.CommandProcessor
 00522791    lea         edx,[ebp-24]
 00522794    mov         eax,esi
 00522796    mov         ecx,dword ptr [eax]
 00522798    call        dword ptr [ecx+110];TmwCustomEdit.sub_0051FBE0
 0052279E    lea         edx,[ebp-24]
 005227A1    mov         eax,esi
 005227A3    call        0051F7D8
 005227A8    push        0
 005227AA    mov         ecx,dword ptr [ebp-8]
 005227AD    movzx       edx,byte ptr [ebp-26]
 005227B1    mov         eax,esi
 005227B3    call        00520D98
 005227B8    lea         edx,[ebp-18]
 005227BB    mov         eax,esi
 005227BD    mov         ecx,dword ptr [eax]
 005227BF    call        dword ptr [ecx+110];TmwCustomEdit.sub_0051FBE0
 005227C5    lea         edx,[ebp-10]
 005227C8    mov         eax,esi
 005227CA    call        0051F7D8
 005227CF    lea         edx,[ebp-18]
 005227D2    mov         eax,esi
 005227D4    call        0051F99C
 005227D9    lea         eax,[ebp-18]
 005227DC    push        eax
 005227DD    push        0
 005227DF    movzx       eax,byte ptr [ebp-26]
 005227E3    push        eax
 005227E4    lea         ecx,[ebp-10]
 005227E7    movzx       edx,byte ptr [ebp-19]
 005227EB    mov         eax,dword ptr [esi+2E0];TmwCustomEdit.fRedoList:TUndoList
 005227F1    call        TUndoList.AddChange
 005227F6    mov         eax,esi
 005227F8    call        TmwCustomEdit.EnsureCursorPosVisible
 005227FD    mov         eax,dword ptr [ebp-8]
 00522800    call        StrDispose
>00522805    jmp         00522A70
 0052280A    lea         edx,[ebp-10]
 0052280D    mov         eax,esi
 0052280F    mov         ecx,dword ptr [eax]
 00522811    call        dword ptr [ecx+110];TmwCustomEdit.sub_0051FBE0
 00522817    lea         eax,[ebp-18]
 0052281A    push        eax
 0052281B    push        0
 0052281D    movzx       eax,byte ptr [ebp-26]
 00522821    push        eax
 00522822    lea         ecx,[ebp-10]
 00522825    movzx       edx,byte ptr [ebp-19]
 00522829    mov         eax,dword ptr [esi+2E0];TmwCustomEdit.fRedoList:TUndoList
 0052282F    call        TUndoList.AddChange
 00522834    mov         eax,esi
 00522836    call        0051C660
 0052283B    test        eax,eax
>0052283D    jle         005228B8
 0052283F    lea         ecx,[ebp-4]
 00522842    mov         edx,dword ptr [esi+28C];TmwCustomEdit.fCaretY:Integer
 00522848    mov         eax,dword ptr [esi+2A4];TmwCustomEdit.fLines:TStrings
 0052284E    mov         ebx,dword ptr [eax]
 00522850    call        dword ptr [ebx+0C];TStrings.Get
 00522853    mov         ebx,dword ptr [ebp-4]
 00522856    mov         eax,ebx
 00522858    test        eax,eax
>0052285A    je          00522861
 0052285C    sub         eax,4
 0052285F    mov         eax,dword ptr [eax]
 00522861    cmp         eax,dword ptr [esi+288];TmwCustomEdit.fCaretX:Integer
>00522867    jge         005228AA
 00522869    lea         eax,[ebp-60]
 0052286C    mov         edx,dword ptr [ebp-8]
 0052286F    call        @UStrFromPWChar
 00522874    mov         edx,dword ptr [ebp-60]
 00522877    mov         eax,esi
 00522879    call        0051CFA4
 0052287E    test        eax,eax
>00522880    jne         005228AA
 00522882    test        ebx,ebx
>00522884    je          0052288B
 00522886    sub         ebx,4
 00522889    mov         ebx,dword ptr [ebx]
 0052288B    lea         ecx,[ebp-64]
 0052288E    mov         edx,dword ptr [esi+288];TmwCustomEdit.fCaretX:Integer
 00522894    sub         edx,ebx
 00522896    mov         ax,20
 0052289A    call        StringOfChar
 0052289F    mov         edx,dword ptr [ebp-64]
 005228A2    lea         eax,[ebp-4]
 005228A5    call        @UStrCat
 005228AA    mov         edx,dword ptr [ebp-14]
 005228AD    mov         eax,dword ptr [esi+2A4];TmwCustomEdit.fLines:TStrings
 005228B3    mov         ecx,dword ptr [eax]
 005228B5    call        dword ptr [ecx+48];TStrings.Delete
 005228B8    lea         edx,[ebp-10]
 005228BB    mov         eax,esi
 005228BD    mov         ecx,dword ptr [eax]
 005228BF    call        dword ptr [ecx+110];TmwCustomEdit.sub_0051FBE0
 005228C5    lea         eax,[ebp-70]
 005228C8    mov         edx,dword ptr [ebp-8]
 005228CB    call        @UStrFromPWChar
 005228D0    mov         ecx,dword ptr [ebp-70]
 005228D3    lea         eax,[ebp-6C]
 005228D6    mov         edx,dword ptr [ebp-4]
 005228D9    call        @UStrCat3
 005228DE    mov         eax,dword ptr [ebp-6C]
 005228E1    lea         edx,[ebp-68]
 005228E4    call        TrimRight
 005228E9    mov         edx,dword ptr [ebp-68]
 005228EC    mov         eax,esi
 005228EE    call        0051FF54
 005228F3    mov         eax,dword ptr [ebp-8]
 005228F6    call        StrDispose
 005228FB    mov         eax,dword ptr [esi+370];TmwCustomEdit.fMarkList:TMarkList
 00522901    mov         edi,dword ptr [eax+8];TMarkList.FCount:Integer
 00522904    dec         edi
 00522905    test        edi,edi
>00522907    jl          00522A70
 0052290D    inc         edi
 0052290E    xor         ebx,ebx
 00522910    mov         edx,ebx
 00522912    mov         eax,dword ptr [esi+370];TmwCustomEdit.fMarkList:TMarkList
 00522918    call        00529C58
 0052291D    mov         eax,dword ptr [eax+4]
 00522920    push        eax
 00522921    mov         eax,esi
 00522923    call        0051C660
 00522928    pop         edx
 00522929    cmp         edx,eax
>0052292B    jle         00522952
 0052292D    mov         edx,ebx
 0052292F    mov         eax,dword ptr [esi+370];TmwCustomEdit.fMarkList:TMarkList
 00522935    call        00529C58
 0052293A    mov         eax,dword ptr [eax+4]
 0052293D    dec         eax
 0052293E    push        eax
 0052293F    mov         edx,ebx
 00522941    mov         eax,dword ptr [esi+370];TmwCustomEdit.fMarkList:TMarkList
 00522947    call        00529C58
 0052294C    pop         edx
 0052294D    mov         ecx,dword ptr [eax]
 0052294F    call        dword ptr [ecx+0C]
 00522952    inc         ebx
 00522953    dec         edi
>00522954    jne         00522910
>00522956    jmp         00522A70
 0052295B    mov         dword ptr [ebp-40],1
 00522962    mov         eax,dword ptr [ebp-0C]
 00522965    mov         dword ptr [ebp-3C],eax
 00522968    lea         edx,[ebp-40]
 0052296B    mov         eax,esi
 0052296D    call        0051F7D8
 00522972    cmp         dword ptr [ebp-18],1
>00522976    jne         0052297E
 00522978    mov         eax,dword ptr [ebp-14]
 0052297B    dec         eax
>0052297C    jmp         00522981
 0052297E    mov         eax,dword ptr [ebp-14]
 00522981    mov         edx,dword ptr [esi+3A8];TmwCustomEdit.fTabWidth:Integer
 00522987    inc         edx
 00522988    mov         dword ptr [ebp-48],edx
 0052298B    mov         dword ptr [ebp-44],eax
 0052298E    lea         edx,[ebp-48]
 00522991    mov         eax,esi
 00522993    call        0051F99C
 00522998    lea         eax,[ebp-18]
 0052299B    push        eax
 0052299C    lea         edx,[ebp-74]
 0052299F    mov         eax,esi
 005229A1    call        0051C7FC
 005229A6    mov         eax,dword ptr [ebp-74]
 005229A9    call        @UStrToPWChar
 005229AE    push        eax
 005229AF    movzx       eax,byte ptr [ebp-26]
 005229B3    push        eax
 005229B4    lea         ecx,[ebp-10]
 005229B7    movzx       edx,byte ptr [ebp-19]
 005229BB    mov         eax,dword ptr [esi+2E0];TmwCustomEdit.fRedoList:TUndoList
 005229C1    call        TUndoList.AddChange
 005229C6    push        0
 005229C8    mov         ecx,522AB4
 005229CD    movzx       edx,byte ptr [ebp-26]
 005229D1    mov         eax,esi
 005229D3    call        00520D98
 005229D8    lea         edx,[ebp-10]
 005229DB    mov         eax,esi
 005229DD    call        0051F7D8
 005229E2    lea         edx,[ebp-18]
 005229E5    mov         eax,esi
 005229E7    mov         ecx,dword ptr [eax]
 005229E9    call        dword ptr [ecx+110];TmwCustomEdit.sub_0051FBE0
 005229EF    lea         edx,[ebp-7C]
 005229F2    mov         eax,esi
 005229F4    call        0051FBB8
 005229F9    lea         edx,[ebp-7C]
 005229FC    mov         eax,esi
 005229FE    call        0051F99C
>00522A03    jmp         00522A70
 00522A05    lea         eax,[ebp-18]
 00522A08    push        eax
 00522A09    mov         eax,dword ptr [ebp-8]
 00522A0C    push        eax
 00522A0D    movzx       eax,byte ptr [ebp-26]
 00522A11    push        eax
 00522A12    lea         ecx,[ebp-10]
 00522A15    movzx       edx,byte ptr [ebp-19]
 00522A19    mov         eax,dword ptr [esi+2E0];TmwCustomEdit.fRedoList:TUndoList
 00522A1F    call        TUndoList.AddChange
 00522A24    mov         dword ptr [ebp-50],1
 00522A2B    mov         eax,dword ptr [ebp-0C]
 00522A2E    mov         dword ptr [ebp-4C],eax
 00522A31    mov         dword ptr [ebp-58],1
 00522A38    mov         eax,dword ptr [ebp-14]
 00522A3B    mov         dword ptr [ebp-54],eax
 00522A3E    mov         eax,dword ptr [ebp-8]
 00522A41    push        eax
 00522A42    lea         ecx,[ebp-58]
 00522A45    lea         edx,[ebp-50]
 00522A48    mov         eax,esi
 00522A4A    call        005220B4
 00522A4F    lea         edx,[ebp-10]
 00522A52    mov         eax,esi
 00522A54    mov         ecx,dword ptr [eax]
 00522A56    call        dword ptr [ecx+110];TmwCustomEdit.sub_0051FBE0
 00522A5C    lea         edx,[ebp-10]
 00522A5F    mov         eax,esi
 00522A61    call        0051F7D8
 00522A66    lea         edx,[ebp-18]
 00522A69    mov         eax,esi
 00522A6B    call        0051F99C
 00522A70    movzx       edx,byte ptr [ebp-25]
 00522A74    mov         eax,esi
 00522A76    call        TmwCustomEdit.SetSelectionMode
 00522A7B    mov         eax,esi
 00522A7D    call        0051C458
 00522A82    xor         eax,eax
 00522A84    pop         edx
 00522A85    pop         ecx
 00522A86    pop         ecx
 00522A87    mov         dword ptr fs:[eax],edx
 00522A8A    push        522AAC
 00522A8F    lea         eax,[ebp-74]
 00522A92    mov         edx,7
 00522A97    call        @UStrArrayClr
 00522A9C    lea         eax,[ebp-4]
 00522A9F    call        @UStrClr
 00522AA4    ret
>00522AA5    jmp         @HandleFinally
>00522AAA    jmp         00522A8F
 00522AAC    pop         edi
 00522AAD    pop         esi
 00522AAE    pop         ebx
 00522AAF    mov         esp,ebp
 00522AB1    pop         ebp
 00522AB2    ret
*}
end;

//00522AB8
procedure TmwCustomEdit.ClearBookMark(BookMark:Integer);
begin
{*
 00522AB8    push        ebx
 00522AB9    push        esi
 00522ABA    mov         esi,edx
 00522ABC    mov         ebx,eax
 00522ABE    mov         eax,esi
 00522AC0    sub         eax,0A
>00522AC3    jae         00522AF6
 00522AC5    cmp         dword ptr [ebx+esi*4+2E4],0
>00522ACD    je          00522AF6
 00522ACF    mov         edx,dword ptr [ebx+esi*4+2E4]
 00522AD6    mov         eax,dword ptr [ebx+370];TmwCustomEdit.fMarkList:TMarkList
 00522ADC    call        TMarkList.Remove
 00522AE1    mov         eax,dword ptr [ebx+esi*4+2E4]
 00522AE8    call        TObject.Free
 00522AED    xor         eax,eax
 00522AEF    mov         dword ptr [ebx+esi*4+2E4],eax
 00522AF6    pop         esi
 00522AF7    pop         ebx
 00522AF8    ret
*}
end;

//00522AFC
procedure TmwCustomEdit.GotoBookMark(BookMark:Integer);
begin
{*
 00522AFC    push        ebx
 00522AFD    push        esi
 00522AFE    add         esp,0FFFFFFF8
 00522B01    mov         ebx,edx
 00522B03    mov         esi,eax
 00522B05    mov         eax,ebx
 00522B07    sub         eax,0A
>00522B0A    jae         00522B4D
 00522B0C    cmp         dword ptr [esi+ebx*4+2E4],0
>00522B14    je          00522B4D
 00522B16    mov         eax,dword ptr [esi+2A4];TmwCustomEdit.fLines:TStrings
 00522B1C    mov         edx,dword ptr [eax]
 00522B1E    call        dword ptr [edx+14];TStrings.GetCount
 00522B21    mov         edx,dword ptr [esi+ebx*4+2E4]
 00522B28    cmp         eax,dword ptr [edx+4]
>00522B2B    jl          00522B4D
 00522B2D    mov         eax,dword ptr [esi+ebx*4+2E4]
 00522B34    mov         edx,dword ptr [eax+8]
 00522B37    mov         dword ptr [esp],edx
 00522B3A    mov         eax,dword ptr [eax+4]
 00522B3D    mov         dword ptr [esp+4],eax
 00522B41    mov         edx,esp
 00522B43    mov         eax,esi
 00522B45    mov         ecx,dword ptr [eax]
 00522B47    call        dword ptr [ecx+110];TmwCustomEdit.sub_0051FBE0
 00522B4D    pop         ecx
 00522B4E    pop         edx
 00522B4F    pop         esi
 00522B50    pop         ebx
 00522B51    ret
*}
end;

//00522B54
procedure TmwCustomEdit.SetBookMark(BookMark:Integer; X:Integer; Y:Integer);
begin
{*
 00522B54    push        ebp
 00522B55    mov         ebp,esp
 00522B57    add         esp,0FFFFFFF8
 00522B5A    push        ebx
 00522B5B    push        esi
 00522B5C    mov         esi,ecx
 00522B5E    mov         dword ptr [ebp-4],edx
 00522B61    mov         ebx,eax
 00522B63    mov         eax,dword ptr [ebp-4]
 00522B66    sub         eax,0A
>00522B69    jae         00522C64
 00522B6F    cmp         dword ptr [ebp+8],1
>00522B73    jl          00522C64
 00522B79    mov         eax,dword ptr [ebx+2A4];TmwCustomEdit.fLines:TStrings
 00522B7F    mov         edx,dword ptr [eax]
 00522B81    call        dword ptr [edx+14];TStrings.GetCount
 00522B84    cmp         eax,dword ptr [ebp+8]
>00522B87    jl          00522C64
 00522B8D    mov         ecx,ebx
 00522B8F    mov         dl,1
 00522B91    mov         eax,[005182CC];TMark
 00522B96    call        TMark.Create;TMark.Create
 00522B9B    mov         dword ptr [ebp-8],eax
 00522B9E    mov         edx,dword ptr [ebp+8]
 00522BA1    mov         eax,dword ptr [ebp-8]
 00522BA4    mov         ecx,dword ptr [eax]
 00522BA6    call        dword ptr [ecx+0C];TMark.sub_00529AA0
 00522BA9    mov         edx,esi
 00522BAB    mov         eax,dword ptr [ebp-8]
 00522BAE    mov         ecx,dword ptr [eax]
 00522BB0    call        dword ptr [ecx+4];TMark.sub_00529A54
 00522BB3    mov         edx,dword ptr [ebp-4]
 00522BB6    mov         eax,dword ptr [ebp-8]
 00522BB9    mov         ecx,dword ptr [eax]
 00522BBB    call        dword ptr [ecx+8];TMark.sub_00529A58
 00522BBE    mov         eax,dword ptr [ebp-8]
 00522BC1    mov         edx,dword ptr [ebp-4]
 00522BC4    mov         dword ptr [eax+18],edx;TMark.fBookmarkNum:Integer
 00522BC7    mov         dl,1
 00522BC9    mov         eax,dword ptr [ebp-8]
 00522BCC    call        00529AE0
 00522BD1    mov         eax,dword ptr [ebx+324];TmwCustomEdit.fBookMarkOpt:TmwBookMarkOpt
 00522BD7    cmp         dword ptr [eax+4],0;TmwBookMarkOpt.fBookmarkImages:TImageList
 00522BDB    sete        dl
 00522BDE    mov         eax,dword ptr [ebp-8]
 00522BE1    call        00529A7C
 00522BE6    cmp         word ptr [ebx+37A],0;TmwCustomEdit.?f37A:word
>00522BEE    je          00522C01
 00522BF0    lea         ecx,[ebp-8]
 00522BF3    mov         edx,ebx
 00522BF5    mov         eax,dword ptr [ebx+37C];TmwCustomEdit.?f37C:dword
 00522BFB    call        dword ptr [ebx+378];TmwCustomEdit.fOnPlaceMark
 00522C01    cmp         dword ptr [ebp-8],0
>00522C05    je          00522C64
 00522C07    mov         eax,dword ptr [ebp-4]
 00522C0A    sub         eax,0A
>00522C0D    jae         00522C64
 00522C0F    xor         esi,esi
 00522C11    mov         eax,dword ptr [ebx+esi*4+2E4]
 00522C18    test        eax,eax
>00522C1A    je          00522C2D
 00522C1C    mov         eax,dword ptr [eax+4]
 00522C1F    cmp         eax,dword ptr [ebp+8]
>00522C22    jne         00522C2D
 00522C24    mov         edx,esi
 00522C26    mov         eax,ebx
 00522C28    call        TmwCustomEdit.ClearBookMark
 00522C2D    inc         esi
 00522C2E    cmp         esi,0A
>00522C31    jne         00522C11
 00522C33    mov         eax,dword ptr [ebp-4]
 00522C36    cmp         dword ptr [ebx+eax*4+2E4],0
>00522C3E    je          00522C4A
 00522C40    mov         edx,dword ptr [ebp-4]
 00522C43    mov         eax,ebx
 00522C45    call        TmwCustomEdit.ClearBookMark
 00522C4A    mov         edx,dword ptr [ebp-4]
 00522C4D    mov         eax,dword ptr [ebp-8]
 00522C50    mov         dword ptr [ebx+edx*4+2E4],eax
 00522C57    mov         edx,eax
 00522C59    mov         eax,dword ptr [ebx+370];TmwCustomEdit.fMarkList:TMarkList
 00522C5F    call        TMarkList.Add
 00522C64    pop         esi
 00522C65    pop         ebx
 00522C66    pop         ecx
 00522C67    pop         ecx
 00522C68    pop         ebp
 00522C69    ret         4
*}
end;

//00522C6C
procedure TmwCustomEdit.WndProc(var Msg:TMessage);
begin
{*
 00522C6C    cmp         dword ptr [edx],106
>00522C72    jne         00522C85
 00522C74    cmp         dword ptr [edx+4],8;TMessage.WParam:WPARAM
>00522C78    jne         00522C85
 00522C7A    test        byte ptr [edx+0B],20;TMessage.LParam:LPARAM
>00522C7E    je          00522C85
 00522C80    xor         eax,eax
 00522C82    mov         dword ptr [edx],eax;TMessage.Msg:Cardinal
 00522C84    ret
 00522C85    call        TWinControl.WndProc
 00522C8A    ret
*}
end;

//00522C8C
{*function sub_00522C8C(?:TmwCustomEdit; ?:TPoint):?;
begin
 00522C8C    push        esi
 00522C8D    push        edi
 00522C8E    add         esp,0FFFFFFF8
 00522C91    mov         esi,edx
 00522C93    lea         edi,[esp]
 00522C96    movs        dword ptr [edi],dword ptr [esi]
 00522C97    movs        dword ptr [edi],dword ptr [esi]
 00522C98    mov         eax,dword ptr [eax+290]
 00522C9E    imul        dword ptr [esp+4]
 00522CA2    add         eax,dword ptr [esp]
 00522CA5    pop         ecx
 00522CA6    pop         edx
 00522CA7    pop         edi
 00522CA8    pop         esi
 00522CA9    ret
end;*}

//00522CAC
{*procedure sub_00522CAC(?:TmwCustomEdit; ?:?; ?:?);
begin
 00522CAC    push        ebx
 00522CAD    push        esi
 00522CAE    push        edi
 00522CAF    mov         esi,edx
 00522CB1    mov         ebx,eax
 00522CB3    mov         eax,esi
 00522CB5    cdq
 00522CB6    idiv        eax,dword ptr [ebx+290]
 00522CBC    mov         edi,eax
 00522CBE    mov         dword ptr [ecx+4],edi
 00522CC1    imul        edi,dword ptr [ebx+290]
 00522CC8    sub         esi,edi
 00522CCA    mov         dword ptr [ecx],esi
 00522CCC    pop         edi
 00522CCD    pop         esi
 00522CCE    pop         ebx
 00522CCF    ret
end;*}

//00522CD0
procedure TmwCustomEdit.DragOver(Source:TObject; X:Integer; Y:Integer; State:TDragState; Accept:Boolean);
begin
{*
 00522CD0    push        ebp
 00522CD1    mov         ebp,esp
 00522CD3    push        ecx
 00522CD4    push        ebx
 00522CD5    push        esi
 00522CD6    push        edi
 00522CD7    mov         dword ptr [ebp-4],ecx
 00522CDA    mov         esi,edx
 00522CDC    mov         edi,eax
 00522CDE    mov         ebx,dword ptr [ebp+0C]
 00522CE1    mov         eax,dword ptr [ebp+10]
 00522CE4    push        eax
 00522CE5    push        ebx
 00522CE6    mov         eax,dword ptr [ebp+8]
 00522CE9    push        eax
 00522CEA    mov         ecx,dword ptr [ebp-4]
 00522CED    mov         edx,esi
 00522CEF    mov         eax,edi
 00522CF1    call        TControl.DragOver
 00522CF6    cmp         edi,esi
>00522CF8    jne         00522D44
 00522CFA    mov         eax,dword ptr [ebp+8]
 00522CFD    mov         byte ptr [eax],1
 00522D00    push        11
 00522D02    call        user32.GetKeyState
 00522D07    movsx       eax,ax
 00522D0A    test        ah,80
>00522D0D    je          00522D17
 00522D0F    mov         word ptr [edi+7A],0FFF0;TmwCustomEdit.FDragCursor:TCursor
>00522D15    jmp         00522D1D
 00522D17    mov         word ptr [edi+7A],0FFF4;TmwCustomEdit.FDragCursor:TCursor
 00522D1D    cmp         bl,1
>00522D20    jne         00522D37
 00522D22    mov         ecx,dword ptr [edi+320];TmwCustomEdit.fMouseDownY:Integer
 00522D28    mov         edx,dword ptr [edi+31C];TmwCustomEdit.fMouseDownX:Integer
 00522D2E    mov         eax,edi
 00522D30    call        0051BD00
>00522D35    jmp         00522D44
 00522D37    mov         ecx,dword ptr [ebp+10]
 00522D3A    mov         edx,dword ptr [ebp-4]
 00522D3D    mov         eax,edi
 00522D3F    call        0051BD00
 00522D44    pop         edi
 00522D45    pop         esi
 00522D46    pop         ebx
 00522D47    pop         ecx
 00522D48    pop         ebp
 00522D49    ret         0C
*}
end;

//00522D4C
procedure TmwCustomEdit.DragDrop(Source:TObject; X:Integer; Y:Integer);
begin
{*
 00522D4C    push        ebp
 00522D4D    mov         ebp,esp
 00522D4F    add         esp,0FFFFFFD4
 00522D52    push        ebx
 00522D53    push        esi
 00522D54    push        edi
 00522D55    xor         ebx,ebx
 00522D57    mov         dword ptr [ebp-24],ebx
 00522D5A    mov         dword ptr [ebp-4],ebx
 00522D5D    mov         esi,ecx
 00522D5F    mov         ebx,edx
 00522D61    mov         dword ptr [ebp-8],eax
 00522D64    mov         edi,dword ptr [ebp+8]
 00522D67    xor         eax,eax
 00522D69    push        ebp
 00522D6A    push        52306C
 00522D6F    push        dword ptr fs:[eax]
 00522D72    mov         dword ptr fs:[eax],esp
 00522D75    mov         eax,dword ptr [ebp-8]
 00522D78    mov         edx,dword ptr [eax]
 00522D7A    call        dword ptr [edx+0F8];TmwCustomEdit.GetReadOnly
 00522D80    test        al,al
>00522D82    jne         0052304E
 00522D88    mov         eax,dword ptr [ebp-8]
 00522D8B    call        0051CBE4
 00522D90    xor         edx,edx
 00522D92    push        ebp
 00522D93    push        523047
 00522D98    push        dword ptr fs:[edx]
 00522D9B    mov         dword ptr fs:[edx],esp
 00522D9E    push        edi
 00522D9F    mov         ecx,esi
 00522DA1    mov         edx,ebx
 00522DA3    mov         eax,dword ptr [ebp-8]
 00522DA6    call        TControl.DragDrop
 00522DAB    cmp         ebx,dword ptr [ebp-8]
>00522DAE    jne         00523029
 00522DB4    mov         eax,dword ptr [ebp-8]
 00522DB7    call        0051C710
 00522DBC    test        al,al
>00522DBE    je          00523029
 00522DC4    mov         ecx,edi
 00522DC6    mov         edx,esi
 00522DC8    mov         eax,dword ptr [ebp-8]
 00522DCB    call        0051BD00
 00522DD0    lea         edx,[ebp-4]
 00522DD3    mov         eax,dword ptr [ebp-8]
 00522DD6    call        0051C7FC
 00522DDB    lea         edx,[ebp-20]
 00522DDE    mov         eax,dword ptr [ebp-8]
 00522DE1    call        0051FBB8
 00522DE6    lea         edx,[ebp-20]
 00522DE9    mov         eax,dword ptr [ebp-8]
 00522DEC    call        00522C8C
 00522DF1    mov         dword ptr [ebp-0C],eax
 00522DF4    mov         eax,dword ptr [ebp-8]
 00522DF7    lea         edx,[eax+30C];TmwCustomEdit.fDragBlockBegin:TPoint
 00522DFD    mov         eax,dword ptr [ebp-8]
 00522E00    call        00522C8C
 00522E05    mov         ebx,eax
 00522E07    mov         eax,dword ptr [ebp-8]
 00522E0A    lea         edx,[eax+314];TmwCustomEdit.fDragBlockEnd:TPoint
 00522E10    mov         eax,dword ptr [ebp-8]
 00522E13    call        00522C8C
 00522E18    mov         esi,eax
 00522E1A    cmp         ebx,dword ptr [ebp-0C]
>00522E1D    jg          00522E28
 00522E1F    cmp         esi,dword ptr [ebp-0C]
>00522E22    jge         00523029
 00522E28    push        11
 00522E2A    call        user32.GetKeyState
 00522E2F    movsx       eax,ax
 00522E32    shr         eax,1F
>00522E35    jne         00522EDE
 00522E3B    cmp         ebx,dword ptr [ebp-0C]
>00522E3E    jge         00522E58
 00522E40    mov         eax,dword ptr [ebp-8]
 00522E43    call        0051C660
 00522E48    mov         edx,dword ptr [ebp-8]
 00522E4B    cmp         eax,dword ptr [edx+318]
>00522E51    jne         00522E58
 00522E53    sub         esi,ebx
 00522E55    sub         dword ptr [ebp-0C],esi
 00522E58    mov         eax,dword ptr [ebp-8]
 00522E5B    add         eax,280;TmwCustomEdit.fBlockEnd:TPoint
 00522E60    push        eax
 00522E61    mov         eax,dword ptr [ebp-4]
 00522E64    call        @UStrToPWChar
 00522E69    push        eax
 00522E6A    mov         eax,dword ptr [ebp-8]
 00522E6D    movzx       eax,byte ptr [eax+390];TmwCustomEdit.fSelectionMode:TSelectionMode
 00522E74    push        eax
 00522E75    mov         eax,dword ptr [ebp-8]
 00522E78    lea         ecx,[eax+278];TmwCustomEdit.fBlockBegin:TPoint
 00522E7E    mov         eax,dword ptr [ebp-8]
 00522E81    mov         eax,dword ptr [eax+2DC];TmwCustomEdit.fUndoList:TUndoList
 00522E87    mov         dl,6
 00522E89    call        TUndoList.AddChange
 00522E8E    mov         eax,dword ptr [ebp-8]
 00522E91    call        00527894
 00522E96    mov         eax,dword ptr [ebp-8]
 00522E99    mov         eax,dword ptr [eax+2A4];TmwCustomEdit.fLines:TStrings
 00522E9F    mov         edx,dword ptr [eax]
 00522EA1    call        dword ptr [edx+14];TStrings.GetCount
 00522EA4    mov         esi,eax
 00522EA6    mov         eax,dword ptr [ebp-8]
 00522EA9    call        0051C660
 00522EAE    mov         ebx,eax
 00522EB0    xor         edx,edx
 00522EB2    mov         eax,dword ptr [ebp-8]
 00522EB5    call        005276B8
 00522EBA    mov         eax,dword ptr [ebp-8]
 00522EBD    call        0051C660
 00522EC2    cmp         ebx,eax
>00522EC4    jle         00522EDA
 00522EC6    mov         eax,dword ptr [ebp-8]
 00522EC9    mov         eax,dword ptr [eax+2A4];TmwCustomEdit.fLines:TStrings
 00522ECF    mov         edx,dword ptr [eax]
 00522ED1    call        dword ptr [edx+14];TStrings.GetCount
 00522ED4    mov         ebx,esi
 00522ED6    sub         ebx,eax
>00522ED8    jmp         00522EE0
 00522EDA    xor         ebx,ebx
>00522EDC    jmp         00522EE0
 00522EDE    xor         ebx,ebx
 00522EE0    lea         ecx,[ebp-20]
 00522EE3    mov         edx,dword ptr [ebp-0C]
 00522EE6    mov         eax,dword ptr [ebp-8]
 00522EE9    call        00522CAC
 00522EEE    lea         edx,[ebp-20]
 00522EF1    mov         eax,dword ptr [ebp-8]
 00522EF4    call        0051F7D8
 00522EF9    lea         edx,[ebp-20]
 00522EFC    mov         eax,dword ptr [ebp-8]
 00522EFF    call        0051C570
 00522F04    mov         esi,dword ptr [ebp-20]
 00522F07    lea         edx,[ebp-20]
 00522F0A    mov         eax,dword ptr [ebp-8]
 00522F0D    call        0051C570
 00522F12    mov         eax,dword ptr [ebp-1C]
 00522F15    sub         eax,ebx
 00522F17    mov         dword ptr [ebp-18],esi
 00522F1A    mov         dword ptr [ebp-14],eax
 00522F1D    lea         edx,[ebp-18]
 00522F20    mov         eax,dword ptr [ebp-8]
 00522F23    call        0051F7D8
 00522F28    lea         edx,[ebp-20]
 00522F2B    mov         eax,dword ptr [ebp-8]
 00522F2E    call        0051C570
 00522F33    lea         edx,[ebp-20]
 00522F36    mov         eax,dword ptr [ebp-8]
 00522F39    call        00522C8C
 00522F3E    mov         dword ptr [ebp-0C],eax
 00522F41    mov         eax,dword ptr [ebp-8]
 00522F44    test        byte ptr [eax+3CE],40;TmwCustomEdit.fOptions:TmwEditorOptions
 00522F4B    setne       al
 00522F4E    xor         al,1
 00522F50    mov         byte ptr [ebp-0D],al
 00522F53    xor         eax,eax
 00522F55    push        ebp
 00522F56    push        522FCB
 00522F5B    push        dword ptr fs:[eax]
 00522F5E    mov         dword ptr fs:[eax],esp
 00522F61    cmp         byte ptr [ebp-0D],0
>00522F65    je          00522F72
 00522F67    mov         eax,dword ptr [ebp-8]
 00522F6A    or          word ptr [eax+3CE],40;TmwCustomEdit.fOptions:TmwEditorOptions
 00522F72    lea         edx,[ebp-20]
 00522F75    mov         eax,dword ptr [ebp-8]
 00522F78    call        0051C570
 00522F7D    lea         edx,[ebp-20]
 00522F80    mov         eax,dword ptr [ebp-8]
 00522F83    mov         ecx,dword ptr [eax]
 00522F85    call        dword ptr [ecx+110];TmwCustomEdit.sub_0051FBE0
 00522F8B    lea         edx,[ebp-20]
 00522F8E    mov         eax,dword ptr [ebp-8]
 00522F91    call        0051C570
 00522F96    lea         edx,[ebp-20]
 00522F99    mov         eax,dword ptr [ebp-8]
 00522F9C    call        0051F99C
 00522FA1    mov         edx,dword ptr [ebp-4]
 00522FA4    mov         eax,dword ptr [ebp-8]
 00522FA7    call        005276B8
 00522FAC    xor         eax,eax
 00522FAE    pop         edx
 00522FAF    pop         ecx
 00522FB0    pop         ecx
 00522FB1    mov         dword ptr fs:[eax],edx
 00522FB4    push        522FD2
 00522FB9    cmp         byte ptr [ebp-0D],0
>00522FBD    je          00522FCA
 00522FBF    mov         eax,dword ptr [ebp-8]
 00522FC2    and         word ptr [eax+3CE],0FFFFFFBF;TmwCustomEdit.fOptions:TmwEditorOptions
 00522FCA    ret
>00522FCB    jmp         @HandleFinally
>00522FD0    jmp         00522FB9
 00522FD2    mov         eax,dword ptr [ebp-8]
 00522FD5    call        005278B0
 00522FDA    lea         edx,[ebp-20]
 00522FDD    mov         eax,dword ptr [ebp-8]
 00522FE0    call        0051C5CC
 00522FE5    lea         eax,[ebp-20]
 00522FE8    push        eax
 00522FE9    lea         edx,[ebp-24]
 00522FEC    mov         eax,dword ptr [ebp-8]
 00522FEF    call        0051C7FC
 00522FF4    mov         eax,dword ptr [ebp-24]
 00522FF7    call        @UStrToPWChar
 00522FFC    push        eax
 00522FFD    mov         eax,dword ptr [ebp-8]
 00523000    movzx       eax,byte ptr [eax+390];TmwCustomEdit.fSelectionMode:TSelectionMode
 00523007    push        eax
 00523008    lea         ecx,[ebp-2C]
 0052300B    mov         edx,dword ptr [ebp-0C]
 0052300E    mov         eax,dword ptr [ebp-8]
 00523011    call        00522CAC
 00523016    lea         ecx,[ebp-2C]
 00523019    mov         eax,dword ptr [ebp-8]
 0052301C    mov         eax,dword ptr [eax+2DC];TmwCustomEdit.fUndoList:TUndoList
 00523022    mov         dl,2
 00523024    call        TUndoList.AddChange
 00523029    xor         eax,eax
 0052302B    pop         edx
 0052302C    pop         ecx
 0052302D    pop         ecx
 0052302E    mov         dword ptr fs:[eax],edx
 00523031    push        52304E
 00523036    mov         eax,dword ptr [ebp-8]
 00523039    call        0051C458
 0052303E    mov         eax,dword ptr [ebp-8]
 00523041    call        005278B0
 00523046    ret
>00523047    jmp         @HandleFinally
>0052304C    jmp         00523036
 0052304E    xor         eax,eax
 00523050    pop         edx
 00523051    pop         ecx
 00523052    pop         ecx
 00523053    mov         dword ptr fs:[eax],edx
 00523056    push        523073
 0052305B    lea         eax,[ebp-24]
 0052305E    call        @UStrClr
 00523063    lea         eax,[ebp-4]
 00523066    call        @UStrClr
 0052306B    ret
>0052306C    jmp         @HandleFinally
>00523071    jmp         0052305B
 00523073    pop         edi
 00523074    pop         esi
 00523075    pop         ebx
 00523076    mov         esp,ebp
 00523078    pop         ebp
 00523079    ret         4
*}
end;

//0052307C
procedure TmwCustomEdit.SetRightEdge(Value:Integer);
begin
{*
 0052307C    push        esi
 0052307D    mov         esi,eax
 0052307F    cmp         edx,dword ptr [esi+2BC];TmwCustomEdit.fRightEdge:Integer
>00523085    je          00523097
 00523087    mov         dword ptr [esi+2BC],edx;TmwCustomEdit.fRightEdge:Integer
 0052308D    mov         eax,esi
 0052308F    mov         edx,dword ptr [eax]
 00523091    call        dword ptr [edx+90];TWinControl.Invalidate
 00523097    pop         esi
 00523098    ret
*}
end;

//0052309C
procedure TmwCustomEdit.SetRightEdgeColor(Value:TColor);
begin
{*
 0052309C    push        ebx
 0052309D    push        esi
 0052309E    add         esp,0FFFFFFF0
 005230A1    mov         ebx,eax
 005230A3    cmp         edx,dword ptr [ebx+2C0];TmwCustomEdit.fRightEdgeColor:TColor
>005230A9    je          005230FD
 005230AB    mov         dword ptr [ebx+2C0],edx;TmwCustomEdit.fRightEdgeColor:TColor
 005230B1    mov         eax,ebx
 005230B3    call        TWinControl.HandleAllocated
 005230B8    test        al,al
>005230BA    je          005230FD
 005230BC    mov         esi,dword ptr [ebx+2BC];TmwCustomEdit.fRightEdge:Integer
 005230C2    imul        esi,dword ptr [ebx+294];TmwCustomEdit.fCharWidth:Integer
 005230C9    add         esi,dword ptr [ebx+2CC];TmwCustomEdit.fTextOffset:Integer
 005230CF    mov         eax,ebx
 005230D1    call        TControl.GetClientHeight
 005230D6    push        eax
 005230D7    lea         eax,[esp+4]
 005230DB    push        eax
 005230DC    lea         ecx,[esi+1]
 005230DF    mov         eax,esi
 005230E1    dec         eax
 005230E2    xor         edx,edx
 005230E4    call        Rect
 005230E9    push        0
 005230EB    lea         eax,[esp+4]
 005230EF    push        eax
 005230F0    mov         eax,ebx
 005230F2    call        TWinControl.GetHandle
 005230F7    push        eax
 005230F8    call        user32.InvalidateRect
 005230FD    add         esp,10
 00523100    pop         esi
 00523101    pop         ebx
 00523102    ret
*}
end;

//00523104
{*function TmwCustomEdit.GetMaxUndo:?;
begin
 00523104    mov         eax,dword ptr [eax+2DC];TmwCustomEdit.fUndoList:TUndoList
 0052310A    mov         eax,dword ptr [eax+0C];TUndoList.fMaxUndo:Integer
 0052310D    ret
end;*}

//00523110
procedure TmwCustomEdit.SetMaxUndo(Value:Integer);
begin
{*
 00523110    push        ebx
 00523111    push        esi
 00523112    mov         esi,edx
 00523114    mov         ebx,eax
 00523116    cmp         esi,0FFFFFFFF
>00523119    jle         00523135
 0052311B    mov         edx,esi
 0052311D    mov         eax,dword ptr [ebx+2DC];TmwCustomEdit.fUndoList:TUndoList
 00523123    call        005298A4
 00523128    mov         edx,esi
 0052312A    mov         eax,dword ptr [ebx+2E0];TmwCustomEdit.fRedoList:TUndoList
 00523130    call        005298A4
 00523135    pop         esi
 00523136    pop         ebx
 00523137    ret
*}
end;

//00523138
procedure TmwCustomEdit.Notification(AComponent:TComponent; Operation:TOperation);
begin
{*
 00523138    push        ebx
 00523139    push        esi
 0052313A    push        edi
 0052313B    mov         ebx,ecx
 0052313D    mov         edi,edx
 0052313F    mov         esi,eax
 00523141    mov         ecx,ebx
 00523143    mov         edx,edi
 00523145    mov         eax,esi
 00523147    call        TWinControl.Notification
 0052314C    cmp         bl,1
>0052314F    jne         00523198
 00523151    cmp         edi,dword ptr [esi+2D4];TmwCustomEdit.fHighLighter:TmwCustomHighLighter
>00523157    jne         00523175
 00523159    xor         eax,eax
 0052315B    mov         dword ptr [esi+2D4],eax;TmwCustomEdit.fHighLighter:TmwCustomHighLighter
 00523161    mov         eax,esi
 00523163    call        00528760
 00523168    or          ecx,0FFFFFFFF
 0052316B    or          edx,0FFFFFFFF
 0052316E    mov         eax,esi
 00523170    call        0051CD40
 00523175    mov         eax,dword ptr [esi+324];TmwCustomEdit.fBookMarkOpt:TmwBookMarkOpt
 0052317B    test        eax,eax
>0052317D    je          00523198
 0052317F    cmp         edi,dword ptr [eax+4];TmwBookMarkOpt.fBookmarkImages:TImageList
>00523182    jne         00523198
 00523184    xor         edx,edx
 00523186    call        TmwBookMarkOpt.SetBookmarkImages
 0052318B    or          ecx,0FFFFFFFF
 0052318E    or          edx,0FFFFFFFF
 00523191    mov         eax,esi
 00523193    call        0051CBEC
 00523198    pop         edi
 00523199    pop         esi
 0052319A    pop         ebx
 0052319B    ret
*}
end;

//0052319C
procedure TmwCustomEdit.SetHighLighter(Value:TmwCustomHighLighter);
begin
{*
 0052319C    push        ebp
 0052319D    mov         ebp,esp
 0052319F    push        ecx
 005231A0    push        ebx
 005231A1    push        esi
 005231A2    push        edi
 005231A3    mov         ebx,edx
 005231A5    mov         dword ptr [ebp-4],eax
 005231A8    xor         eax,eax
 005231AA    push        ebp
 005231AB    push        523260
 005231B0    push        dword ptr fs:[eax]
 005231B3    mov         dword ptr fs:[eax],esp
 005231B6    mov         eax,dword ptr [ebp-4]
 005231B9    cmp         ebx,dword ptr [eax+2D4];TmwCustomEdit.fHighLighter:TmwCustomHighLighter
>005231BF    je          00523256
 005231C5    test        ebx,ebx
>005231C7    je          005231E3
 005231C9    mov         eax,dword ptr [ebp-4]
 005231CC    push        eax
 005231CD    push        5287E4
 005231D2    mov         eax,ebx
 005231D4    call        TmwCustomHighLighter.HookAttrChangeEvent
 005231D9    mov         edx,dword ptr [ebp-4]
 005231DC    mov         eax,ebx
 005231DE    call        TComponent.FreeNotification
 005231E3    mov         eax,dword ptr [ebp-4]
 005231E6    mov         dword ptr [eax+2D4],ebx;TmwCustomEdit.fHighLighter:TmwCustomHighLighter
 005231EC    test        ebx,ebx
>005231EE    jne         005231FA
 005231F0    xor         eax,eax
 005231F2    pop         edx
 005231F3    pop         ecx
 005231F4    pop         ecx
 005231F5    mov         dword ptr fs:[eax],edx
>005231F8    jmp         0052326A
 005231FA    mov         eax,dword ptr [ebp-4]
 005231FD    call        00528760
 00523202    mov         eax,dword ptr [ebp-4]
 00523205    mov         eax,dword ptr [eax+2A4];TmwCustomEdit.fLines:TStrings
 0052320B    call        TStrings.BeginUpdate
 00523210    xor         eax,eax
 00523212    push        ebp
 00523213    push        523245
 00523218    push        dword ptr fs:[eax]
 0052321B    mov         dword ptr fs:[eax],esp
 0052321E    mov         edx,dword ptr [ebp-4]
 00523221    mov         eax,dword ptr [ebp-4]
 00523224    call        00521C48
 00523229    xor         eax,eax
 0052322B    pop         edx
 0052322C    pop         ecx
 0052322D    pop         ecx
 0052322E    mov         dword ptr fs:[eax],edx
 00523231    push        52324C
 00523236    mov         eax,dword ptr [ebp-4]
 00523239    mov         eax,dword ptr [eax+2A4];TmwCustomEdit.fLines:TStrings
 0052323F    call        TStrings.EndUpdate
 00523244    ret
>00523245    jmp         @HandleFinally
>0052324A    jmp         00523236
 0052324C    mov         dl,1
 0052324E    mov         eax,dword ptr [ebp-4]
 00523251    call        0052841C
 00523256    xor         eax,eax
 00523258    pop         edx
 00523259    pop         ecx
 0052325A    pop         ecx
 0052325B    mov         dword ptr fs:[eax],edx
>0052325E    jmp         0052326A
>00523260    jmp         @HandleAnyException
 00523265    call        @DoneExcept
 0052326A    pop         edi
 0052326B    pop         esi
 0052326C    pop         ebx
 0052326D    pop         ecx
 0052326E    pop         ebp
 0052326F    ret
*}
end;

//00523270
procedure TmwCustomEdit.SetBorderStyle(Value:TBorderStyle);
begin
{*
 00523270    cmp         dl,byte ptr [eax+340];TmwCustomEdit.fBorderStyle:TBorderStyle
>00523276    je          00523283
 00523278    mov         byte ptr [eax+340],dl;TmwCustomEdit.fBorderStyle:TBorderStyle
 0052327E    call        TWinControl.RecreateWnd
 00523283    ret
*}
end;

//00523284
procedure TmwCustomEdit.SetHideSelection(Value:Boolean);
begin
{*
 00523284    push        esi
 00523285    mov         esi,eax
 00523287    cmp         dl,byte ptr [esi+341];TmwCustomEdit.fHideSelection:Boolean
>0052328D    je          0052329F
 0052328F    mov         byte ptr [esi+341],dl;TmwCustomEdit.fHideSelection:Boolean
 00523295    mov         eax,esi
 00523297    mov         edx,dword ptr [eax]
 00523299    call        dword ptr [edx+90];TWinControl.Invalidate
 0052329F    pop         esi
 005232A0    ret
*}
end;

//005232A4
procedure TmwCustomEdit.SetInsertMode(Value:Boolean);
begin
{*
 005232A4    push        ebx
 005232A5    mov         ebx,eax
 005232A7    cmp         dl,byte ptr [ebx+2A0];TmwCustomEdit.fInserting:Boolean
>005232AD    je          005232D0
 005232AF    mov         byte ptr [ebx+2A0],dl;TmwCustomEdit.fInserting:Boolean
 005232B5    test        byte ptr [ebx+1C],10;TmwCustomEdit.FComponentState:TComponentState
>005232B9    jne         005232C2
 005232BB    mov         eax,ebx
 005232BD    call        005232D8
 005232C2    movzx       edx,byte ptr ds:[5232D4];0x20 gvar_005232D4
 005232C9    mov         eax,ebx
 005232CB    call        005287FC
 005232D0    pop         ebx
 005232D1    ret
*}
end;

//005232D8
procedure sub_005232D8(?:TmwCustomEdit);
begin
{*
 005232D8    push        ebx
 005232D9    push        esi
 005232DA    push        edi
 005232DB    add         esp,0FFFFFFE0
 005232DE    mov         ebx,eax
 005232E0    cmp         byte ptr [ebx+2A0],0;TmwCustomEdit.fInserting:Boolean
>005232E7    je          005232F2
 005232E9    movzx       eax,byte ptr [ebx+349];TmwCustomEdit.fInsertCaret:TCaretType
>005232F0    jmp         005232F9
 005232F2    movzx       eax,byte ptr [ebx+348];TmwCustomEdit.fOverwriteCaret:TCaretType
 005232F9    dec         al
>005232FB    je          0052330A
 005232FD    dec         al
>005232FF    je          0052333F
 00523301    dec         al
>00523303    je          00523375
>00523305    jmp         005233A6
 0052330A    mov         edi,dword ptr [ebx+294];TmwCustomEdit.fCharWidth:Integer
 00523310    mov         esi,2
 00523315    xor         eax,eax
 00523317    mov         dword ptr [esp],eax
 0052331A    mov         eax,dword ptr [ebx+2C8];TmwCustomEdit.fTextHeight:Integer
 00523320    sub         eax,2
 00523323    mov         dword ptr [esp+4],eax
 00523327    mov         eax,dword ptr [esp]
 0052332A    mov         dword ptr [ebx+34C],eax;TmwCustomEdit.fCaretOffset:TPoint
 00523330    mov         eax,dword ptr [esp+4]
 00523334    mov         dword ptr [ebx+350],eax
>0052333A    jmp         005233D6
 0052333F    mov         edi,dword ptr [ebx+294];TmwCustomEdit.fCharWidth:Integer
 00523345    mov         esi,dword ptr [ebx+2C8];TmwCustomEdit.fTextHeight:Integer
 0052334B    sub         esi,2
 0052334E    sar         esi,1
>00523350    jns         00523355
 00523352    adc         esi,0
 00523355    xor         eax,eax
 00523357    mov         dword ptr [esp+8],eax
 0052335B    mov         dword ptr [esp+0C],esi
 0052335F    mov         eax,dword ptr [esp+8]
 00523363    mov         dword ptr [ebx+34C],eax;TmwCustomEdit.fCaretOffset:TPoint
 00523369    mov         eax,dword ptr [esp+0C]
 0052336D    mov         dword ptr [ebx+350],eax
>00523373    jmp         005233D6
 00523375    mov         edi,dword ptr [ebx+294];TmwCustomEdit.fCharWidth:Integer
 0052337B    mov         esi,dword ptr [ebx+2C8];TmwCustomEdit.fTextHeight:Integer
 00523381    sub         esi,2
 00523384    xor         eax,eax
 00523386    mov         dword ptr [esp+10],eax
 0052338A    xor         eax,eax
 0052338C    mov         dword ptr [esp+14],eax
 00523390    mov         eax,dword ptr [esp+10]
 00523394    mov         dword ptr [ebx+34C],eax;TmwCustomEdit.fCaretOffset:TPoint
 0052339A    mov         eax,dword ptr [esp+14]
 0052339E    mov         dword ptr [ebx+350],eax
>005233A4    jmp         005233D6
 005233A6    mov         edi,2
 005233AB    mov         esi,dword ptr [ebx+2C8];TmwCustomEdit.fTextHeight:Integer
 005233B1    sub         esi,2
 005233B4    mov         dword ptr [esp+18],0FFFFFFFF
 005233BC    xor         eax,eax
 005233BE    mov         dword ptr [esp+1C],eax
 005233C2    mov         eax,dword ptr [esp+18]
 005233C6    mov         dword ptr [ebx+34C],eax;TmwCustomEdit.fCaretOffset:TPoint
 005233CC    mov         eax,dword ptr [esp+1C]
 005233D0    mov         dword ptr [ebx+350],eax
 005233D6    and         word ptr [ebx+3CC],0FFFFFFDF;TmwCustomEdit.fStateFlags:TmwStateFlags
 005233DE    push        esi
 005233DF    push        edi
 005233E0    push        0
 005233E2    mov         eax,ebx
 005233E4    call        TWinControl.GetHandle
 005233E9    push        eax
 005233EA    call        user32.CreateCaret
 005233EF    mov         eax,ebx
 005233F1    call        00520FD0
 005233F6    add         esp,20
 005233F9    pop         edi
 005233FA    pop         esi
 005233FB    pop         ebx
 005233FC    ret
*}
end;

//00523400
procedure TmwCustomEdit.SetInsertCaret(Value:TCaretType);
begin
{*
 00523400    cmp         dl,byte ptr [eax+349];TmwCustomEdit.fInsertCaret:TCaretType
>00523406    je          00523413
 00523408    mov         byte ptr [eax+349],dl;TmwCustomEdit.fInsertCaret:TCaretType
 0052340E    call        005232D8
 00523413    ret
*}
end;

//00523414
procedure TmwCustomEdit.SetOverwriteCaret(Value:TCaretType);
begin
{*
 00523414    cmp         dl,byte ptr [eax+348];TmwCustomEdit.fOverwriteCaret:TCaretType
>0052341A    je          00523427
 0052341C    mov         byte ptr [eax+348],dl;TmwCustomEdit.fOverwriteCaret:TCaretType
 00523422    call        005232D8
 00523427    ret
*}
end;

//00523458
procedure TmwCustomEdit.EnsureCursorPosVisible;
begin
{*
 00523458    push        ebp
 00523459    mov         ebp,esp
 0052345B    push        ecx
 0052345C    push        ebx
 0052345D    mov         dword ptr [ebp-4],eax
 00523460    mov         eax,dword ptr [ebp-4]
 00523463    call        0051CBE4
 00523468    xor         eax,eax
 0052346A    push        ebp
 0052346B    push        523549
 00523470    push        dword ptr fs:[eax]
 00523473    mov         dword ptr fs:[eax],esp
 00523476    mov         eax,dword ptr [ebp-4]
 00523479    call        0051C6C0
 0052347E    dec         eax
 0052347F    mov         edx,dword ptr [ebp-4]
 00523482    cmp         eax,dword ptr [edx+288];TmwCustomEdit.fCaretX:Integer
>00523488    jle         0052349E
 0052348A    mov         eax,dword ptr [ebp-4]
 0052348D    mov         edx,dword ptr [eax+288];TmwCustomEdit.fCaretX:Integer
 00523493    inc         edx
 00523494    mov         eax,dword ptr [ebp-4]
 00523497    call        0051FEB4
>0052349C    jmp         005234D7
 0052349E    mov         eax,dword ptr [ebp-4]
 005234A1    call        0051C6C0
 005234A6    mov         edx,dword ptr [ebp-4]
 005234A9    add         eax,dword ptr [edx+290];TmwCustomEdit.fCharsInWindow:Integer
 005234AF    mov         edx,dword ptr [ebp-4]
 005234B2    cmp         eax,dword ptr [edx+288];TmwCustomEdit.fCaretX:Integer
>005234B8    jg          005234D7
 005234BA    mov         eax,dword ptr [ebp-4]
 005234BD    mov         edx,dword ptr [eax+288];TmwCustomEdit.fCaretX:Integer
 005234C3    mov         eax,dword ptr [ebp-4]
 005234C6    sub         edx,dword ptr [eax+290]
 005234CC    add         edx,2
 005234CF    mov         eax,dword ptr [ebp-4]
 005234D2    call        0051FEB4
 005234D7    mov         eax,dword ptr [ebp-4]
 005234DA    call        0051CBB4
 005234DF    dec         eax
 005234E0    mov         edx,dword ptr [ebp-4]
 005234E3    cmp         eax,dword ptr [edx+28C];TmwCustomEdit.fCaretY:Integer
>005234E9    jle         005234FF
 005234EB    mov         eax,dword ptr [ebp-4]
 005234EE    mov         edx,dword ptr [eax+28C];TmwCustomEdit.fCaretY:Integer
 005234F4    inc         edx
 005234F5    mov         eax,dword ptr [ebp-4]
 005234F8    call        00520F08
>005234FD    jmp         00523533
 005234FF    mov         eax,dword ptr [ebp-4]
 00523502    call        0051CBB4
 00523507    mov         edx,dword ptr [ebp-4]
 0052350A    mov         ebx,dword ptr [edx+2A8];TmwCustomEdit.fLinesInWindow:Integer
 00523510    sub         ebx,2
 00523513    add         eax,ebx
 00523515    mov         edx,dword ptr [ebp-4]
 00523518    cmp         eax,dword ptr [edx+28C];TmwCustomEdit.fCaretY:Integer
>0052351E    jge         00523533
 00523520    mov         eax,dword ptr [ebp-4]
 00523523    mov         edx,dword ptr [eax+28C];TmwCustomEdit.fCaretY:Integer
 00523529    sub         edx,ebx
 0052352B    mov         eax,dword ptr [ebp-4]
 0052352E    call        00520F08
 00523533    xor         eax,eax
 00523535    pop         edx
 00523536    pop         ecx
 00523537    pop         ecx
 00523538    mov         dword ptr fs:[eax],edx
 0052353B    push        523550
 00523540    mov         eax,dword ptr [ebp-4]
 00523543    call        0051C458
 00523548    ret
>00523549    jmp         @HandleFinally
>0052354E    jmp         00523540
 00523550    pop         ebx
 00523551    pop         ecx
 00523552    pop         ebp
 00523553    ret
*}
end;

//00523554
procedure TmwCustomEdit.SetKeystrokes(Value:TmwKeyStrokes);
begin
{*
 00523554    test        edx,edx
>00523556    jne         00523564
 00523558    mov         eax,dword ptr [eax+368];TmwCustomEdit.fKeyStrokes:TmwKeyStrokes
 0052355E    call        TCollection.Clear
 00523563    ret
 00523564    mov         eax,dword ptr [eax+368];TmwCustomEdit.fKeyStrokes:TmwKeyStrokes
 0052356A    mov         ecx,dword ptr [eax]
 0052356C    call        dword ptr [ecx+8];TmwKeyStrokes.Assign
 0052356F    ret
*}
end;

//00523570
procedure TmwCustomEdit.SetDefaultKeystrokes;
begin
{*
 00523570    mov         eax,dword ptr [eax+368];TmwCustomEdit.fKeyStrokes:TmwKeyStrokes
 00523576    call        TmwKeyStrokes.ResetDefaults
 0052357B    ret
*}
end;

//0052357C
{*function sub_0052357C(?:TmwCustomEdit; ?:?; ?:?):?;
begin
 0052357C    push        ebp
 0052357D    mov         ebp,esp
 0052357F    push        ecx
 00523580    push        ebx
 00523581    push        esi
 00523582    push        edi
 00523583    mov         word ptr [ebp-2],cx
 00523587    mov         esi,edx
 00523589    mov         ebx,eax
 0052358B    push        esi
 0052358C    movzx       eax,word ptr [ebp-2]
 00523590    push        eax
 00523591    movzx       ecx,word ptr [ebx+3E2];TmwCustomEdit.fLastShiftState:TShiftState
 00523598    movzx       edx,word ptr [ebx+3E0];TmwCustomEdit.fLastKey:word
 0052359F    mov         eax,dword ptr [ebx+368];TmwCustomEdit.fKeyStrokes:TmwKeyStrokes
 005235A5    call        TmwKeyStrokes.FindKeycode2
 005235AA    mov         edi,eax
 005235AC    test        edi,edi
>005235AE    jl          005235C3
 005235B0    mov         edx,edi
 005235B2    mov         eax,dword ptr [ebx+368];TmwCustomEdit.fKeyStrokes:TmwKeyStrokes
 005235B8    call        0050F450
 005235BD    movzx       eax,word ptr [eax+14]
>005235C1    jmp         005235EF
 005235C3    movzx       ecx,word ptr [ebp-2]
 005235C7    mov         edx,esi
 005235C9    mov         eax,dword ptr [ebx+368];TmwCustomEdit.fKeyStrokes:TmwKeyStrokes
 005235CF    call        TmwKeyStrokes.FindKeycode
 005235D4    mov         edi,eax
 005235D6    test        edi,edi
>005235D8    jl          005235ED
 005235DA    mov         edx,edi
 005235DC    mov         eax,dword ptr [ebx+368];TmwCustomEdit.fKeyStrokes:TmwKeyStrokes
 005235E2    call        0050F450
 005235E7    movzx       eax,word ptr [eax+14]
>005235EB    jmp         005235EF
 005235ED    xor         eax,eax
 005235EF    test        ax,ax
>005235F2    jne         00523615
 005235F4    cmp         si,1E
>005235F8    jb          00523615
 005235FA    cmp         si,91
>005235FF    ja          00523615
 00523601    mov         word ptr [ebx+3E0],si;TmwCustomEdit.fLastKey:word
 00523608    movzx       edx,word ptr [ebp-2]
 0052360C    mov         word ptr [ebx+3E2],dx;TmwCustomEdit.fLastShiftState:TShiftState
>00523613    jmp         0052362C
 00523615    mov         word ptr [ebx+3E0],0;TmwCustomEdit.fLastKey:word
 0052361E    movzx       edx,word ptr ds:[523634];0x0 gvar_00523634
 00523625    mov         word ptr [ebx+3E2],dx;TmwCustomEdit.fLastShiftState:TShiftState
 0052362C    pop         edi
 0052362D    pop         esi
 0052362E    pop         ebx
 0052362F    pop         ecx
 00523630    pop         ebp
 00523631    ret         4
end;*}

//00523638
procedure TmwCustomEdit.CommandProcessor(Command:TmwEditorCommand; AChar:Char; Data:Pointer);
begin
{*
 00523638    push        ebp
 00523639    mov         ebp,esp
 0052363B    push        ecx
 0052363C    mov         ecx,45
 00523641    push        0
 00523643    push        0
 00523645    dec         ecx
>00523646    jne         00523641
 00523648    push        ecx
 00523649    xchg        ecx,dword ptr [ebp-4]
 0052364C    push        ebx
 0052364D    push        esi
 0052364E    push        edi
 0052364F    mov         word ptr [ebp-18],cx
 00523653    mov         word ptr [ebp-16],dx
 00523657    mov         dword ptr [ebp-14],eax
 0052365A    mov         ebx,dword ptr [ebp+8]
 0052365D    xor         eax,eax
 0052365F    push        ebp
 00523660    push        525B2F
 00523665    push        dword ptr fs:[eax]
 00523668    mov         dword ptr fs:[eax],esp
 0052366B    push        ebx
 0052366C    lea         ecx,[ebp-18]
 0052366F    lea         edx,[ebp-16]
 00523672    mov         eax,dword ptr [ebp-14]
 00523675    mov         esi,dword ptr [eax]
 00523677    call        dword ptr [esi+108];TmwCustomEdit.sub_00525B70
 0052367D    cmp         word ptr [ebp-16],0
>00523682    je          00525AE9
 00523688    cmp         word ptr [ebp-16],3E9
>0052368E    jae         00525AE9
 00523694    mov         eax,dword ptr [ebp-14]
 00523697    call        0051CBE4
 0052369C    xor         edx,edx
 0052369E    push        ebp
 0052369F    push        525AC3
 005236A4    push        dword ptr fs:[edx]
 005236A7    mov         dword ptr fs:[edx],esp
 005236AA    movzx       eax,word ptr [ebp-16]
 005236AE    cmp         eax,75
>005236B1    jg          005238A1
>005236B7    je          00523D58
 005236BD    cmp         eax,74
>005236C0    ja          00525AAD
 005236C6    jmp         dword ptr [eax*4+5236CD]
 005236C6    dd          00525AAD
 005236C6    dd          005239EA
 005236C6    dd          00523A02
 005236C6    dd          00523AF2
 005236C6    dd          00523B15
 005236C6    dd          00523D97
 005236C6    dd          00523DCC
 005236C6    dd          00523A5A
 005236C6    dd          00523A93
 005236C6    dd          00523B3A
 005236C6    dd          00523B3A
 005236C6    dd          00523A1C
 005236C6    dd          00523A3C
 005236C6    dd          00523B8C
 005236C6    dd          00523BDC
 005236C6    dd          00523C58
 005236C6    dd          00523CA7
 005236C6    dd          00523D58
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          00525AAD
 005236C6    dd          005239EA
 005236C6    dd          00523A02
 005236C6    dd          00523AF2
 005236C6    dd          00523B15
 005236C6    dd          00523D97
 005236C6    dd          00523DCC
 005236C6    dd          00523A5A
 005236C6    dd          00523A93
 005236C6    dd          00523B3A
 005236C6    dd          00523B3A
 005236C6    dd          00523A1C
 005236C6    dd          00523A3C
 005236C6    dd          00523B8C
 005236C6    dd          00523BDC
 005236C6    dd          00523C58
 005236C6    dd          00523CA7
 005238A1    cmp         eax,25D
>005238A6    jg          00523957
>005238AC    je          005258CA
 005238B2    cmp         eax,197
>005238B7    jg          0052390C
>005238B9    je          00524A8A
 005238BF    cmp         eax,193
>005238C4    jg          005238EE
>005238C6    je          0052450F
 005238CC    sub         eax,0C7
>005238D1    je          00523E01
 005238D7    sub         eax,0CA
>005238DC    je          00523E0E
 005238E2    dec         eax
>005238E3    je          00524285
>005238E9    jmp         00525AAD
 005238EE    sub         eax,194
>005238F3    je          0052463F
 005238F9    dec         eax
>005238FA    je          0052475E
 00523900    dec         eax
>00523901    je          005248EB
>00523907    jmp         00525AAD
 0052390C    cmp         eax,259
>00523911    jg          00523939
>00523913    je          00525788
 00523919    sub         eax,198
>0052391E    je          00524CDF
 00523924    dec         eax
 00523925    sub         eax,2
>00523928    jb          00524CFF
>0052392E    je          005253EF
>00523934    jmp         00525AAD
 00523939    sub         eax,25A
>0052393E    je          005257A8
 00523944    dec         eax
>00523945    je          0052588D
 0052394B    dec         eax
>0052394C    je          005258BD
>00523952    jmp         00525AAD
 00523957    cmp         eax,265
>0052395C    jg          00523995
>0052395E    je          00525A68
 00523964    add         eax,0FFFFFDA2
 00523969    cmp         eax,6
>0052396C    ja          00525AAD
 00523972    jmp         dword ptr [eax*4+523979]
 00523972    dd          005258EA
 00523972    dd          00525949
 00523972    dd          00525994
 00523972    dd          005259F1
 00523972    dd          00525A39
 00523972    dd          00525A45
 00523972    dd          00525A51
 00523995    cmp         eax,26B
>0052399A    jg          005239C2
>0052399C    je          005253CD
 005239A2    sub         eax,266
>005239A7    je          00525A81
 005239AD    dec         eax
 005239AE    sub         eax,3
>005239B1    jb          00525A9A
>005239B7    je          005253AD
>005239BD    jmp         00525AAD
 005239C2    sub         eax,26C
>005239C7    je          005253DF
 005239CD    add         eax,0FFFFFFAF
 005239D0    sub         eax,0A
>005239D3    jb          005257C8
 005239D9    add         eax,0FFFFFFD8
 005239DC    sub         eax,0A
>005239DF    jb          005257F2
>005239E5    jmp         00525AAD
 005239EA    cmp         word ptr [ebp-16],65
 005239EF    sete        cl
 005239F2    or          edx,0FFFFFFFF
 005239F5    mov         eax,dword ptr [ebp-14]
 005239F8    call        005284B8
>005239FD    jmp         00525AAD
 00523A02    cmp         word ptr [ebp-16],66
 00523A07    sete        cl
 00523A0A    mov         edx,1
 00523A0F    mov         eax,dword ptr [ebp-14]
 00523A12    call        005284B8
>00523A17    jmp         00525AAD
 00523A1C    cmp         word ptr [ebp-16],6F
 00523A21    sete        cl
 00523A24    mov         eax,dword ptr [ebp-14]
 00523A27    mov         edx,dword ptr [eax+290];TmwCustomEdit.fCharsInWindow:Integer
 00523A2D    neg         edx
 00523A2F    mov         eax,dword ptr [ebp-14]
 00523A32    call        005284B8
>00523A37    jmp         00525AAD
 00523A3C    cmp         word ptr [ebp-16],70
 00523A41    sete        cl
 00523A44    mov         eax,dword ptr [ebp-14]
 00523A47    mov         edx,dword ptr [eax+290];TmwCustomEdit.fCharsInWindow:Integer
 00523A4D    mov         eax,dword ptr [ebp-14]
 00523A50    call        005284B8
>00523A55    jmp         00525AAD
 00523A5A    lea         edx,[ebp-54]
 00523A5D    mov         eax,dword ptr [ebp-14]
 00523A60    call        0051FBB8
 00523A65    mov         eax,dword ptr [ebp-14]
 00523A68    call        0051C660
 00523A6D    mov         dword ptr [ebp-4C],1
 00523A74    mov         dword ptr [ebp-48],eax
 00523A77    cmp         word ptr [ebp-16],6B
 00523A7C    sete        al
 00523A7F    push        eax
 00523A80    lea         ecx,[ebp-4C]
 00523A83    lea         edx,[ebp-54]
 00523A86    mov         eax,dword ptr [ebp-14]
 00523A89    call        00528678
>00523A8E    jmp         00525AAD
 00523A93    lea         edx,[ebp-64]
 00523A96    mov         eax,dword ptr [ebp-14]
 00523A99    call        0051FBB8
 00523A9E    lea         edx,[ebp-180]
 00523AA4    mov         eax,dword ptr [ebp-14]
 00523AA7    call        0051C6C8
 00523AAC    mov         eax,dword ptr [ebp-180]
 00523AB2    mov         dword ptr [ebp-184],eax
 00523AB8    mov         ebx,dword ptr [ebp-184]
 00523ABE    test        ebx,ebx
>00523AC0    je          00523AC7
 00523AC2    sub         ebx,4
 00523AC5    mov         ebx,dword ptr [ebx]
 00523AC7    mov         eax,dword ptr [ebp-14]
 00523ACA    call        0051C660
 00523ACF    inc         ebx
 00523AD0    mov         dword ptr [ebp-5C],ebx
 00523AD3    mov         dword ptr [ebp-58],eax
 00523AD6    cmp         word ptr [ebp-16],6C
 00523ADB    sete        al
 00523ADE    push        eax
 00523ADF    lea         ecx,[ebp-5C]
 00523AE2    lea         edx,[ebp-64]
 00523AE5    mov         eax,dword ptr [ebp-14]
 00523AE8    call        00528678
>00523AED    jmp         00525AAD
 00523AF2    cmp         word ptr [ebp-16],67
 00523AF7    sete        cl
 00523AFA    or          edx,0FFFFFFFF
 00523AFD    mov         eax,dword ptr [ebp-14]
 00523B00    call        005285F4
 00523B05    mov         eax,dword ptr [ebp-14]
 00523B08    mov         edx,dword ptr [eax]
 00523B0A    call        dword ptr [edx+9C];TWinControl.Update
>00523B10    jmp         00525AAD
 00523B15    cmp         word ptr [ebp-16],68
 00523B1A    sete        cl
 00523B1D    mov         edx,1
 00523B22    mov         eax,dword ptr [ebp-14]
 00523B25    call        005285F4
 00523B2A    mov         eax,dword ptr [ebp-14]
 00523B2D    mov         edx,dword ptr [eax]
 00523B2F    call        dword ptr [edx+9C];TWinControl.Update
>00523B35    jmp         00525AAD
 00523B3A    mov         eax,dword ptr [ebp-14]
 00523B3D    test        byte ptr [eax+3CE],8;TmwCustomEdit.fOptions:TmwEditorOptions
 00523B44    setne       cl
 00523B47    mov         eax,dword ptr [ebp-14]
 00523B4A    mov         ebx,dword ptr [eax+2A8];TmwCustomEdit.fLinesInWindow:Integer
 00523B50    shr         ebx,cl
 00523B52    movzx       eax,word ptr [ebp-16]
 00523B56    sub         ax,9
>00523B5A    je          00523B62
 00523B5C    sub         ax,64
>00523B60    jne         00523B64
 00523B62    neg         ebx
 00523B64    movzx       eax,word ptr [ebp-16]
 00523B68    add         eax,0FFFFFF93
 00523B6B    sub         ax,2
 00523B6F    setb        cl
 00523B72    mov         edx,ebx
 00523B74    mov         eax,dword ptr [ebp-14]
 00523B77    call        005285F4
 00523B7C    mov         eax,dword ptr [ebp-14]
 00523B7F    mov         edx,dword ptr [eax]
 00523B81    call        dword ptr [edx+9C];TWinControl.Update
>00523B87    jmp         00525AAD
 00523B8C    lea         edx,[ebp-78]
 00523B8F    mov         eax,dword ptr [ebp-14]
 00523B92    call        0051FBB8
 00523B97    mov         eax,dword ptr [ebp-14]
 00523B9A    call        0051C628
 00523B9F    mov         ebx,eax
 00523BA1    mov         eax,dword ptr [ebp-14]
 00523BA4    call        0051CBB4
 00523BA9    mov         dword ptr [ebp-68],eax
 00523BAC    mov         dword ptr [ebp-70],ebx
 00523BAF    mov         eax,dword ptr [ebp-68]
 00523BB2    mov         dword ptr [ebp-6C],eax
 00523BB5    cmp         word ptr [ebp-16],71
 00523BBA    sete        al
 00523BBD    push        eax
 00523BBE    lea         ecx,[ebp-70]
 00523BC1    lea         edx,[ebp-78]
 00523BC4    mov         eax,dword ptr [ebp-14]
 00523BC7    call        00528678
 00523BCC    mov         eax,dword ptr [ebp-14]
 00523BCF    mov         edx,dword ptr [eax]
 00523BD1    call        dword ptr [edx+9C];TWinControl.Update
>00523BD7    jmp         00525AAD
 00523BDC    mov         eax,dword ptr [ebp-14]
 00523BDF    call        0051C628
 00523BE4    mov         dword ptr [ebp-7C],eax
 00523BE7    mov         eax,dword ptr [ebp-14]
 00523BEA    call        0051CBB4
 00523BEF    mov         edx,dword ptr [ebp-14]
 00523BF2    add         eax,dword ptr [edx+2A8];TmwCustomEdit.fLinesInWindow:Integer
 00523BF8    dec         eax
 00523BF9    mov         dword ptr [ebp-80],eax
 00523BFC    mov         eax,dword ptr [ebp-7C]
 00523BFF    mov         dword ptr [ebp-88],eax
 00523C05    mov         eax,dword ptr [ebp-80]
 00523C08    mov         dword ptr [ebp-84],eax
 00523C0E    mov         eax,dword ptr [ebp-88]
 00523C14    mov         dword ptr [ebp-40],eax
 00523C17    mov         eax,dword ptr [ebp-84]
 00523C1D    mov         dword ptr [ebp-3C],eax
 00523C20    cmp         word ptr [ebp-16],72
 00523C25    sete        al
 00523C28    push        eax
 00523C29    lea         edx,[ebp-18C]
 00523C2F    mov         eax,dword ptr [ebp-14]
 00523C32    call        0051FBB8
 00523C37    lea         edx,[ebp-18C]
 00523C3D    lea         ecx,[ebp-40]
 00523C40    mov         eax,dword ptr [ebp-14]
 00523C43    call        00528678
 00523C48    mov         eax,dword ptr [ebp-14]
 00523C4B    mov         edx,dword ptr [eax]
 00523C4D    call        dword ptr [edx+9C];TWinControl.Update
>00523C53    jmp         00525AAD
 00523C58    lea         edx,[ebp-98]
 00523C5E    mov         eax,dword ptr [ebp-14]
 00523C61    call        0051FBB8
 00523C66    mov         dword ptr [ebp-90],1
 00523C70    mov         dword ptr [ebp-8C],1
 00523C7A    cmp         word ptr [ebp-16],73
 00523C7F    sete        al
 00523C82    push        eax
 00523C83    lea         ecx,[ebp-90]
 00523C89    lea         edx,[ebp-98]
 00523C8F    mov         eax,dword ptr [ebp-14]
 00523C92    call        00528678
 00523C97    mov         eax,dword ptr [ebp-14]
 00523C9A    mov         edx,dword ptr [eax]
 00523C9C    call        dword ptr [edx+9C];TWinControl.Update
>00523CA2    jmp         00525AAD
 00523CA7    mov         eax,dword ptr [ebp-14]
 00523CAA    mov         eax,dword ptr [eax+2A4];TmwCustomEdit.fLines:TStrings
 00523CB0    mov         edx,dword ptr [eax]
 00523CB2    call        dword ptr [edx+14];TStrings.GetCount
 00523CB5    mov         dword ptr [ebp-9C],eax
 00523CBB    mov         dword ptr [ebp-0A4],1
 00523CC5    mov         eax,dword ptr [ebp-9C]
 00523CCB    mov         dword ptr [ebp-0A0],eax
 00523CD1    mov         eax,dword ptr [ebp-0A4]
 00523CD7    mov         dword ptr [ebp-40],eax
 00523CDA    mov         eax,dword ptr [ebp-0A0]
 00523CE0    mov         dword ptr [ebp-3C],eax
 00523CE3    cmp         dword ptr [ebp-3C],0
>00523CE7    jle         00523D20
 00523CE9    lea         ecx,[ebp-190]
 00523CEF    mov         edx,dword ptr [ebp-3C]
 00523CF2    dec         edx
 00523CF3    mov         eax,dword ptr [ebp-14]
 00523CF6    mov         eax,dword ptr [eax+2A4];TmwCustomEdit.fLines:TStrings
 00523CFC    mov         ebx,dword ptr [eax]
 00523CFE    call        dword ptr [ebx+0C];TStrings.Get
 00523D01    mov         eax,dword ptr [ebp-190]
 00523D07    mov         dword ptr [ebp-0A8],eax
 00523D0D    mov         eax,dword ptr [ebp-0A8]
 00523D13    test        eax,eax
>00523D15    je          00523D1C
 00523D17    sub         eax,4
 00523D1A    mov         eax,dword ptr [eax]
 00523D1C    inc         eax
 00523D1D    mov         dword ptr [ebp-40],eax
 00523D20    cmp         word ptr [ebp-16],74
 00523D25    sete        al
 00523D28    push        eax
 00523D29    lea         edx,[ebp-18C]
 00523D2F    mov         eax,dword ptr [ebp-14]
 00523D32    call        0051FBB8
 00523D37    lea         edx,[ebp-18C]
 00523D3D    lea         ecx,[ebp-40]
 00523D40    mov         eax,dword ptr [ebp-14]
 00523D43    call        00528678
 00523D48    mov         eax,dword ptr [ebp-14]
 00523D4B    mov         edx,dword ptr [eax]
 00523D4D    call        dword ptr [edx+9C];TWinControl.Update
>00523D53    jmp         00525AAD
 00523D58    test        ebx,ebx
>00523D5A    je          00525AAD
 00523D60    cmp         word ptr [ebp-16],75
 00523D65    sete        al
 00523D68    push        eax
 00523D69    lea         edx,[ebp-18C]
 00523D6F    mov         eax,dword ptr [ebp-14]
 00523D72    call        0051FBB8
 00523D77    lea         edx,[ebp-18C]
 00523D7D    mov         ecx,ebx
 00523D7F    mov         eax,dword ptr [ebp-14]
 00523D82    call        00528678
 00523D87    mov         eax,dword ptr [ebp-14]
 00523D8A    mov         edx,dword ptr [eax]
 00523D8C    call        dword ptr [edx+9C];TWinControl.Update
>00523D92    jmp         00525AAD
 00523D97    lea         edx,[ebp-38]
 00523D9A    mov         eax,dword ptr [ebp-14]
 00523D9D    call        0051FBB8
 00523DA2    lea         edx,[ebp-40]
 00523DA5    mov         eax,dword ptr [ebp-14]
 00523DA8    mov         ecx,dword ptr [eax]
 00523DAA    call        dword ptr [ecx+124];TmwCustomEdit.PrevWordPos
 00523DB0    cmp         word ptr [ebp-16],69
 00523DB5    sete        al
 00523DB8    push        eax
 00523DB9    lea         ecx,[ebp-40]
 00523DBC    lea         edx,[ebp-38]
 00523DBF    mov         eax,dword ptr [ebp-14]
 00523DC2    call        00528678
>00523DC7    jmp         00525AAD
 00523DCC    lea         edx,[ebp-38]
 00523DCF    mov         eax,dword ptr [ebp-14]
 00523DD2    call        0051FBB8
 00523DD7    lea         edx,[ebp-40]
 00523DDA    mov         eax,dword ptr [ebp-14]
 00523DDD    mov         ecx,dword ptr [eax]
 00523DDF    call        dword ptr [ecx+120];TmwCustomEdit.NextWordPos
 00523DE5    cmp         word ptr [ebp-16],6A
 00523DEA    sete        al
 00523DED    push        eax
 00523DEE    lea         ecx,[ebp-40]
 00523DF1    lea         edx,[ebp-38]
 00523DF4    mov         eax,dword ptr [ebp-14]
 00523DF7    call        00528678
>00523DFC    jmp         00525AAD
 00523E01    mov         eax,dword ptr [ebp-14]
 00523E04    call        TmwCustomEdit.SelectAll
>00523E09    jmp         00525AAD
 00523E0E    mov         eax,dword ptr [ebp-14]
 00523E11    mov         edx,dword ptr [eax]
 00523E13    call        dword ptr [edx+0F8];TmwCustomEdit.GetReadOnly
 00523E19    test        al,al
>00523E1B    jne         00525AAD
 00523E21    mov         eax,dword ptr [ebp-14]
 00523E24    call        0051C710
 00523E29    test        al,al
>00523E2B    je          00523E88
 00523E2D    mov         eax,dword ptr [ebp-14]
 00523E30    add         eax,280;TmwCustomEdit.fBlockEnd:TPoint
 00523E35    push        eax
 00523E36    lea         edx,[ebp-194]
 00523E3C    mov         eax,dword ptr [ebp-14]
 00523E3F    call        0051C7FC
 00523E44    mov         eax,dword ptr [ebp-194]
 00523E4A    call        @UStrToPWChar
 00523E4F    push        eax
 00523E50    mov         eax,dword ptr [ebp-14]
 00523E53    movzx       eax,byte ptr [eax+390];TmwCustomEdit.fSelectionMode:TSelectionMode
 00523E5A    push        eax
 00523E5B    mov         eax,dword ptr [ebp-14]
 00523E5E    lea         ecx,[eax+278];TmwCustomEdit.fBlockBegin:TPoint
 00523E64    mov         eax,dword ptr [ebp-14]
 00523E67    mov         eax,dword ptr [eax+2DC];TmwCustomEdit.fUndoList:TUndoList
 00523E6D    mov         dl,4
 00523E6F    call        TUndoList.AddChange
 00523E74    xor         edx,edx
 00523E76    mov         eax,dword ptr [ebp-14]
 00523E79    call        0052008C
 00523E7E    call        @TryFinallyExit
>00523E83    jmp         00525AE9
 00523E88    lea         edx,[ebp-4]
 00523E8B    mov         eax,dword ptr [ebp-14]
 00523E8E    call        0051C6C8
 00523E93    mov         eax,dword ptr [ebp-4]
 00523E96    test        eax,eax
>00523E98    je          00523E9F
 00523E9A    sub         eax,4
 00523E9D    mov         eax,dword ptr [eax]
 00523E9F    mov         ebx,eax
 00523EA1    xor         esi,esi
 00523EA3    mov         eax,dword ptr [ebp-14]
 00523EA6    call        0051C628
 00523EAB    inc         ebx
 00523EAC    cmp         eax,ebx
>00523EAE    jg          0052422D
 00523EB4    mov         eax,dword ptr [ebp-14]
 00523EB7    call        0051C628
 00523EBC    dec         eax
>00523EBD    jle         005240B5
 00523EC3    mov         edx,dword ptr [ebp-4]
 00523EC6    mov         eax,dword ptr [ebp-14]
 00523EC9    call        0051CFA4
 00523ECE    mov         dword ptr [ebp-1C],eax
 00523ED1    mov         eax,dword ptr [ebp-14]
 00523ED4    call        0051C628
 00523ED9    mov         edx,dword ptr [ebp-4]
 00523EDC    cmp         word ptr [edx+eax*2-4],20
>00523EE2    ja          00523FF5
 00523EE8    mov         eax,dword ptr [ebp-14]
 00523EEB    mov         eax,dword ptr [eax+288];TmwCustomEdit.fCaretX:Integer
 00523EF1    cmp         eax,dword ptr [ebp-1C]
>00523EF4    jne         00523FF5
 00523EFA    cmp         dword ptr [ebp-1C],0
>00523EFE    jle         00523F44
 00523F00    mov         eax,dword ptr [ebp-14]
 00523F03    mov         ebx,dword ptr [eax+28C];TmwCustomEdit.fCaretY:Integer
 00523F09    dec         ebx
 00523F0A    test        ebx,ebx
>00523F0C    jge         00523F10
 00523F0E    xor         esi,esi
 00523F10    test        ebx,ebx
>00523F12    jl          00523F44
 00523F14    lea         ecx,[ebp-198]
 00523F1A    mov         eax,dword ptr [ebp-14]
 00523F1D    mov         eax,dword ptr [eax+2A4];TmwCustomEdit.fLines:TStrings
 00523F23    mov         edx,ebx
 00523F25    mov         esi,dword ptr [eax]
 00523F27    call        dword ptr [esi+0C];TStrings.Get
 00523F2A    mov         edx,dword ptr [ebp-198]
 00523F30    mov         eax,dword ptr [ebp-14]
 00523F33    call        0051CFA4
 00523F38    mov         esi,eax
 00523F3A    cmp         esi,dword ptr [ebp-1C]
>00523F3D    jl          00523F44
 00523F3F    dec         ebx
 00523F40    test        ebx,ebx
>00523F42    jge         00523F14
 00523F44    cmp         esi,dword ptr [ebp-1C]
>00523F47    jne         00523F4B
 00523F49    xor         esi,esi
 00523F4B    lea         eax,[ebp-0C]
 00523F4E    push        eax
 00523F4F    mov         ecx,dword ptr [ebp-1C]
 00523F52    sub         ecx,esi
 00523F54    mov         edx,1
 00523F59    mov         eax,dword ptr [ebp-4]
 00523F5C    call        @UStrCopy
 00523F61    mov         ecx,dword ptr [ebp-1C]
 00523F64    sub         ecx,esi
 00523F66    lea         eax,[ebp-4]
 00523F69    mov         edx,1
 00523F6E    call        @UStrDelete
 00523F73    lea         edx,[ebp-19C]
 00523F79    mov         eax,dword ptr [ebp-4]
 00523F7C    call        TrimRight
 00523F81    mov         edx,dword ptr [ebp-19C]
 00523F87    mov         eax,dword ptr [ebp-14]
 00523F8A    call        0051FF54
 00523F8F    mov         eax,dword ptr [ebp-1C]
 00523F92    sub         eax,esi
 00523F94    mov         edx,dword ptr [ebp-14]
 00523F97    sub         dword ptr [edx+288],eax
 00523F9D    movzx       edx,byte ptr ds:[525B40];0x2 gvar_00525B40
 00523FA4    mov         eax,dword ptr [ebp-14]
 00523FA7    call        005287FC
 00523FAC    lea         edx,[ebp-18C]
 00523FB2    mov         eax,dword ptr [ebp-14]
 00523FB5    call        0051FBB8
 00523FBA    lea         eax,[ebp-18C]
 00523FC0    push        eax
 00523FC1    mov         eax,dword ptr [ebp-0C]
 00523FC4    call        @UStrToPWChar
 00523FC9    push        eax
 00523FCA    push        0
 00523FCC    lea         edx,[ebp-1A4]
 00523FD2    mov         eax,dword ptr [ebp-14]
 00523FD5    call        0051FBB8
 00523FDA    lea         ecx,[ebp-1A4]
 00523FE0    mov         eax,dword ptr [ebp-14]
 00523FE3    mov         eax,dword ptr [eax+2DC];TmwCustomEdit.fUndoList:TUndoList
 00523FE9    mov         dl,4
 00523FEB    call        TUndoList.AddChange
>00523FF0    jmp         00525AAD
 00523FF5    mov         ebx,1
 00523FFA    mov         eax,dword ptr [ebp-14]
 00523FFD    call        0051C628
 00524002    mov         edx,eax
 00524004    sub         edx,ebx
 00524006    mov         eax,dword ptr [ebp-14]
 00524009    call        0051FB70
 0052400E    mov         eax,dword ptr [ebp-14]
 00524011    call        0051C628
 00524016    mov         edx,dword ptr [ebp-4]
 00524019    movzx       edx,word ptr [edx+eax*2-2]
 0052401E    lea         eax,[ebp-0C]
 00524021    call        @UStrFromWChar
 00524026    cmp         ebx,1
>00524029    jle         00524053
 0052402B    mov         eax,dword ptr [ebp-14]
 0052402E    call        0051C628
 00524033    mov         edx,dword ptr [ebp-4]
 00524036    movzx       edx,word ptr [edx+eax*2]
 0052403A    lea         eax,[ebp-1A8]
 00524040    call        @UStrFromWChar
 00524045    mov         edx,dword ptr [ebp-1A8]
 0052404B    lea         eax,[ebp-0C]
 0052404E    call        @UStrCat
 00524053    lea         edx,[ebp-38]
 00524056    mov         eax,dword ptr [ebp-14]
 00524059    call        0051FBB8
 0052405E    mov         eax,dword ptr [ebp-14]
 00524061    call        0051C628
 00524066    mov         edx,eax
 00524068    lea         eax,[ebp-4]
 0052406B    mov         ecx,ebx
 0052406D    call        @UStrDelete
 00524072    lea         edx,[ebp-1AC]
 00524078    mov         eax,dword ptr [ebp-4]
 0052407B    call        TrimRight
 00524080    mov         edx,dword ptr [ebp-1AC]
 00524086    mov         eax,dword ptr [ebp-14]
 00524089    call        0051FF54
 0052408E    lea         eax,[ebp-38]
 00524091    push        eax
 00524092    mov         eax,dword ptr [ebp-0C]
 00524095    call        @UStrToPWChar
 0052409A    push        eax
 0052409B    push        0
 0052409D    mov         eax,dword ptr [ebp-14]
 005240A0    mov         eax,dword ptr [eax+2DC];TmwCustomEdit.fUndoList:TUndoList
 005240A6    lea         ecx,[ebp-38]
 005240A9    mov         dl,4
 005240AB    call        TUndoList.AddChange
>005240B0    jmp         00525AAD
 005240B5    mov         eax,dword ptr [ebp-14]
 005240B8    cmp         dword ptr [eax+28C],0;TmwCustomEdit.fCaretY:Integer
>005240BF    jle         00525AAD
 005240C5    mov         eax,dword ptr [ebp-14]
 005240C8    mov         edx,dword ptr [eax+28C];TmwCustomEdit.fCaretY:Integer
 005240CE    mov         eax,dword ptr [ebp-14]
 005240D1    mov         eax,dword ptr [eax+2A4];TmwCustomEdit.fLines:TStrings
 005240D7    mov         ecx,dword ptr [eax]
 005240D9    call        dword ptr [ecx+48];TStrings.Delete
 005240DC    mov         eax,dword ptr [ebp-14]
 005240DF    mov         eax,dword ptr [eax+370];TmwCustomEdit.fMarkList:TMarkList
 005240E5    mov         esi,dword ptr [eax+8];TMarkList.FCount:Integer
 005240E8    dec         esi
 005240E9    test        esi,esi
>005240EB    jl          0052413E
 005240ED    inc         esi
 005240EE    xor         ebx,ebx
 005240F0    mov         eax,dword ptr [ebp-14]
 005240F3    mov         eax,dword ptr [eax+370];TmwCustomEdit.fMarkList:TMarkList
 005240F9    mov         edx,ebx
 005240FB    call        00529C58
 00524100    mov         edi,dword ptr [eax+4]
 00524103    mov         eax,dword ptr [ebp-14]
 00524106    call        0051C660
 0052410B    cmp         edi,eax
>0052410D    jl          0052413A
 0052410F    mov         eax,dword ptr [ebp-14]
 00524112    mov         eax,dword ptr [eax+370];TmwCustomEdit.fMarkList:TMarkList
 00524118    mov         edx,ebx
 0052411A    call        00529C58
 0052411F    mov         eax,dword ptr [eax+4]
 00524122    dec         eax
 00524123    push        eax
 00524124    mov         eax,dword ptr [ebp-14]
 00524127    mov         eax,dword ptr [eax+370];TmwCustomEdit.fMarkList:TMarkList
 0052412D    mov         edx,ebx
 0052412F    call        00529C58
 00524134    pop         edx
 00524135    mov         ecx,dword ptr [eax]
 00524137    call        dword ptr [ecx+0C]
 0052413A    inc         ebx
 0052413B    dec         esi
>0052413C    jne         005240F0
 0052413E    mov         eax,dword ptr [ebp-14]
 00524141    call        0051C660
 00524146    mov         edx,eax
 00524148    dec         edx
 00524149    mov         eax,dword ptr [ebp-14]
 0052414C    call        0051FB94
 00524151    lea         edx,[ebp-1B0]
 00524157    mov         eax,dword ptr [ebp-14]
 0052415A    call        0051C6C8
 0052415F    mov         eax,dword ptr [ebp-1B0]
 00524165    mov         dword ptr [ebp-0AC],eax
 0052416B    mov         eax,dword ptr [ebp-0AC]
 00524171    mov         dword ptr [ebp-0B0],eax
 00524177    cmp         dword ptr [ebp-0B0],0
>0052417E    je          00524191
 00524180    mov         eax,dword ptr [ebp-0B0]
 00524186    sub         eax,4
 00524189    mov         eax,dword ptr [eax]
 0052418B    mov         dword ptr [ebp-0B0],eax
 00524191    mov         edx,dword ptr [ebp-0B0]
 00524197    inc         edx
 00524198    mov         eax,dword ptr [ebp-14]
 0052419B    call        0051FB70
 005241A0    lea         edx,[ebp-38]
 005241A3    mov         eax,dword ptr [ebp-14]
 005241A6    call        0051FBB8
 005241AB    lea         edx,[ebp-1B4]
 005241B1    mov         eax,dword ptr [ebp-14]
 005241B4    call        0051C6C8
 005241B9    lea         eax,[ebp-1B4]
 005241BF    push        eax
 005241C0    lea         edx,[ebp-1B8]
 005241C6    mov         eax,dword ptr [ebp-4]
 005241C9    call        TrimRight
 005241CE    mov         edx,dword ptr [ebp-1B8]
 005241D4    pop         eax
 005241D5    call        @UStrCat
 005241DA    mov         edx,dword ptr [ebp-1B4]
 005241E0    mov         eax,dword ptr [ebp-14]
 005241E3    call        0051FF54
 005241E8    lea         edx,[ebp-18C]
 005241EE    mov         eax,dword ptr [ebp-14]
 005241F1    call        0051FBB8
 005241F6    lea         eax,[ebp-18C]
 005241FC    push        eax
 005241FD    push        525B44
 00524202    push        0
 00524204    lea         edx,[ebp-1A4]
 0052420A    mov         eax,dword ptr [ebp-14]
 0052420D    call        0051FBB8
 00524212    lea         ecx,[ebp-1A4]
 00524218    mov         eax,dword ptr [ebp-14]
 0052421B    mov         eax,dword ptr [eax+2DC];TmwCustomEdit.fUndoList:TUndoList
 00524221    mov         dl,4
 00524223    call        TUndoList.AddChange
>00524228    jmp         00525AAD
 0052422D    lea         edx,[ebp-18C]
 00524233    mov         eax,dword ptr [ebp-14]
 00524236    call        0051FBB8
 0052423B    lea         eax,[ebp-18C]
 00524241    push        eax
 00524242    push        525B4C
 00524247    push        0
 00524249    lea         edx,[ebp-1A4]
 0052424F    mov         eax,dword ptr [ebp-14]
 00524252    call        0051FBB8
 00524257    lea         ecx,[ebp-1A4]
 0052425D    mov         eax,dword ptr [ebp-14]
 00524260    mov         eax,dword ptr [eax+2DC];TmwCustomEdit.fUndoList:TUndoList
 00524266    mov         dl,4
 00524268    call        TUndoList.AddChange
 0052426D    mov         eax,dword ptr [ebp-14]
 00524270    call        0051C628
 00524275    mov         edx,eax
 00524277    dec         edx
 00524278    mov         eax,dword ptr [ebp-14]
 0052427B    call        0051FB70
>00524280    jmp         00525AAD
 00524285    mov         eax,dword ptr [ebp-14]
 00524288    mov         edx,dword ptr [eax]
 0052428A    call        dword ptr [edx+0F8];TmwCustomEdit.GetReadOnly
 00524290    test        al,al
>00524292    jne         00525AAD
 00524298    mov         eax,dword ptr [ebp-14]
 0052429B    call        0051C710
 005242A0    test        al,al
>005242A2    je          005242FF
 005242A4    mov         eax,dword ptr [ebp-14]
 005242A7    add         eax,280;TmwCustomEdit.fBlockEnd:TPoint
 005242AC    push        eax
 005242AD    lea         edx,[ebp-1BC]
 005242B3    mov         eax,dword ptr [ebp-14]
 005242B6    call        0051C7FC
 005242BB    mov         eax,dword ptr [ebp-1BC]
 005242C1    call        @UStrToPWChar
 005242C6    push        eax
 005242C7    mov         eax,dword ptr [ebp-14]
 005242CA    movzx       eax,byte ptr [eax+390];TmwCustomEdit.fSelectionMode:TSelectionMode
 005242D1    push        eax
 005242D2    mov         eax,dword ptr [ebp-14]
 005242D5    lea         ecx,[eax+278];TmwCustomEdit.fBlockBegin:TPoint
 005242DB    mov         eax,dword ptr [ebp-14]
 005242DE    mov         eax,dword ptr [eax+2DC];TmwCustomEdit.fUndoList:TUndoList
 005242E4    mov         dl,3
 005242E6    call        TUndoList.AddChange
 005242EB    xor         edx,edx
 005242ED    mov         eax,dword ptr [ebp-14]
 005242F0    call        0052008C
 005242F5    call        @TryFinallyExit
>005242FA    jmp         00525AE9
 005242FF    lea         edx,[ebp-4]
 00524302    mov         eax,dword ptr [ebp-14]
 00524305    call        0051C6C8
 0052430A    mov         eax,dword ptr [ebp-4]
 0052430D    test        eax,eax
>0052430F    je          00524316
 00524311    sub         eax,4
 00524314    mov         eax,dword ptr [eax]
 00524316    mov         ebx,eax
 00524318    mov         eax,dword ptr [ebp-14]
 0052431B    call        0051C628
 00524320    cmp         ebx,eax
>00524322    jl          005243BE
 00524328    mov         ebx,1
 0052432D    mov         eax,dword ptr [ebp-14]
 00524330    call        0051C628
 00524335    mov         edx,dword ptr [ebp-4]
 00524338    movzx       edx,word ptr [edx+eax*2-2]
 0052433D    lea         eax,[ebp-0C]
 00524340    call        @UStrFromWChar
 00524345    lea         edx,[ebp-18C]
 0052434B    mov         eax,dword ptr [ebp-14]
 0052434E    call        0051FBB8
 00524353    lea         eax,[ebp-18C]
 00524359    push        eax
 0052435A    mov         eax,dword ptr [ebp-0C]
 0052435D    call        @UStrToPWChar
 00524362    push        eax
 00524363    push        0
 00524365    lea         edx,[ebp-1A4]
 0052436B    mov         eax,dword ptr [ebp-14]
 0052436E    call        0051FBB8
 00524373    lea         ecx,[ebp-1A4]
 00524379    mov         eax,dword ptr [ebp-14]
 0052437C    mov         eax,dword ptr [eax+2DC];TmwCustomEdit.fUndoList:TUndoList
 00524382    mov         dl,3
 00524384    call        TUndoList.AddChange
 00524389    mov         eax,dword ptr [ebp-14]
 0052438C    call        0051C628
 00524391    mov         edx,eax
 00524393    lea         eax,[ebp-4]
 00524396    mov         ecx,ebx
 00524398    call        @UStrDelete
 0052439D    lea         edx,[ebp-1C0]
 005243A3    mov         eax,dword ptr [ebp-4]
 005243A6    call        TrimRight
 005243AB    mov         edx,dword ptr [ebp-1C0]
 005243B1    mov         eax,dword ptr [ebp-14]
 005243B4    call        0051FF54
>005243B9    jmp         00525AAD
 005243BE    mov         eax,dword ptr [ebp-14]
 005243C1    mov         eax,dword ptr [eax+2A4];TmwCustomEdit.fLines:TStrings
 005243C7    mov         edx,dword ptr [eax]
 005243C9    call        dword ptr [edx+14];TStrings.GetCount
 005243CC    dec         eax
 005243CD    mov         edx,dword ptr [ebp-14]
 005243D0    cmp         eax,dword ptr [edx+28C];TmwCustomEdit.fCaretY:Integer
>005243D6    jle         00525AAD
 005243DC    lea         ecx,[ebp-0C]
 005243DF    mov         eax,dword ptr [ebp-14]
 005243E2    mov         edx,dword ptr [eax+288];TmwCustomEdit.fCaretX:Integer
 005243E8    sub         edx,ebx
 005243EA    mov         ax,20
 005243EE    call        StringOfChar
 005243F3    push        dword ptr [ebp-4]
 005243F6    push        dword ptr [ebp-0C]
 005243F9    mov         eax,dword ptr [ebp-14]
 005243FC    call        0051C660
 00524401    mov         edx,eax
 00524403    lea         ecx,[ebp-1CC]
 00524409    mov         eax,dword ptr [ebp-14]
 0052440C    mov         eax,dword ptr [eax+2A4];TmwCustomEdit.fLines:TStrings
 00524412    mov         ebx,dword ptr [eax]
 00524414    call        dword ptr [ebx+0C];TStrings.Get
 00524417    push        dword ptr [ebp-1CC]
 0052441D    lea         eax,[ebp-1C8]
 00524423    mov         edx,3
 00524428    call        @UStrCatN
 0052442D    mov         eax,dword ptr [ebp-1C8]
 00524433    lea         edx,[ebp-1C4]
 00524439    call        TrimRight
 0052443E    mov         edx,dword ptr [ebp-1C4]
 00524444    mov         eax,dword ptr [ebp-14]
 00524447    call        0051FF54
 0052444C    lea         edx,[ebp-18C]
 00524452    mov         eax,dword ptr [ebp-14]
 00524455    call        0051FBB8
 0052445A    lea         eax,[ebp-18C]
 00524460    push        eax
 00524461    push        525B44
 00524466    push        0
 00524468    lea         edx,[ebp-1A4]
 0052446E    mov         eax,dword ptr [ebp-14]
 00524471    call        0051FBB8
 00524476    lea         ecx,[ebp-1A4]
 0052447C    mov         eax,dword ptr [ebp-14]
 0052447F    mov         eax,dword ptr [eax+2DC];TmwCustomEdit.fUndoList:TUndoList
 00524485    mov         dl,3
 00524487    call        TUndoList.AddChange
 0052448C    mov         eax,dword ptr [ebp-14]
 0052448F    call        0051C660
 00524494    mov         edx,eax
 00524496    mov         eax,dword ptr [ebp-14]
 00524499    mov         eax,dword ptr [eax+2A4];TmwCustomEdit.fLines:TStrings
 0052449F    mov         ecx,dword ptr [eax]
 005244A1    call        dword ptr [ecx+48];TStrings.Delete
 005244A4    mov         eax,dword ptr [ebp-14]
 005244A7    mov         eax,dword ptr [eax+370];TmwCustomEdit.fMarkList:TMarkList
 005244AD    mov         ebx,dword ptr [eax+8];TMarkList.FCount:Integer
 005244B0    dec         ebx
 005244B1    cmp         ebx,0
>005244B4    jl          00525AAD
 005244BA    mov         eax,dword ptr [ebp-14]
 005244BD    mov         eax,dword ptr [eax+370];TmwCustomEdit.fMarkList:TMarkList
 005244C3    mov         edx,ebx
 005244C5    call        00529C58
 005244CA    mov         esi,dword ptr [eax+4]
 005244CD    mov         eax,dword ptr [ebp-14]
 005244D0    call        0051C660
 005244D5    cmp         esi,eax
>005244D7    jl          00524504
 005244D9    mov         eax,dword ptr [ebp-14]
 005244DC    mov         eax,dword ptr [eax+370];TmwCustomEdit.fMarkList:TMarkList
 005244E2    mov         edx,ebx
 005244E4    call        00529C58
 005244E9    mov         eax,dword ptr [eax+4]
 005244EC    dec         eax
 005244ED    push        eax
 005244EE    mov         eax,dword ptr [ebp-14]
 005244F1    mov         eax,dword ptr [eax+370];TmwCustomEdit.fMarkList:TMarkList
 005244F7    mov         edx,ebx
 005244F9    call        00529C58
 005244FE    pop         edx
 005244FF    mov         ecx,dword ptr [eax]
 00524501    call        dword ptr [ecx+0C]
 00524504    dec         ebx
 00524505    cmp         ebx,0FFFFFFFF
>00524508    jne         005244BA
>0052450A    jmp         00525AAD
 0052450F    mov         eax,dword ptr [ebp-14]
 00524512    mov         edx,dword ptr [eax]
 00524514    call        dword ptr [edx+0F8];TmwCustomEdit.GetReadOnly
 0052451A    test        al,al
>0052451C    jne         00525AAD
 00524522    lea         edx,[ebp-30]
 00524525    mov         eax,dword ptr [ebp-14]
 00524528    mov         ecx,dword ptr [eax]
 0052452A    call        dword ptr [ecx+120];TmwCustomEdit.NextWordPos
 00524530    mov         eax,dword ptr [ebp-14]
 00524533    call        0051C628
 00524538    cmp         eax,dword ptr [ebp-30]
>0052453B    jne         0052454E
 0052453D    mov         eax,dword ptr [ebp-14]
 00524540    call        0051C660
 00524545    cmp         eax,dword ptr [ebp-2C]
>00524548    je          00525AAD
 0052454E    mov         eax,dword ptr [ebp-14]
 00524551    movzx       eax,byte ptr [eax+390];TmwCustomEdit.fSelectionMode:TSelectionMode
 00524558    mov         byte ptr [ebp-41],al
 0052455B    xor         eax,eax
 0052455D    push        ebp
 0052455E    push        524614
 00524563    push        dword ptr fs:[eax]
 00524566    mov         dword ptr fs:[eax],esp
 00524569    mov         eax,dword ptr [ebp-14]
 0052456C    mov         byte ptr [eax+390],0;TmwCustomEdit.fSelectionMode:TSelectionMode
 00524573    lea         edx,[ebp-18C]
 00524579    mov         eax,dword ptr [ebp-14]
 0052457C    call        0051FBB8
 00524581    lea         edx,[ebp-18C]
 00524587    mov         eax,dword ptr [ebp-14]
 0052458A    call        0051F7D8
 0052458F    lea         edx,[ebp-30]
 00524592    mov         eax,dword ptr [ebp-14]
 00524595    call        0051F99C
 0052459A    lea         edx,[ebp-18C]
 005245A0    mov         eax,dword ptr [ebp-14]
 005245A3    call        0051FBB8
 005245A8    lea         eax,[ebp-18C]
 005245AE    push        eax
 005245AF    lea         edx,[ebp-1D0]
 005245B5    mov         eax,dword ptr [ebp-14]
 005245B8    call        0051C7FC
 005245BD    mov         eax,dword ptr [ebp-1D0]
 005245C3    call        @UStrToPWChar
 005245C8    push        eax
 005245C9    push        0
 005245CB    lea         edx,[ebp-1A4]
 005245D1    mov         eax,dword ptr [ebp-14]
 005245D4    call        0051FBB8
 005245D9    lea         ecx,[ebp-1A4]
 005245DF    mov         eax,dword ptr [ebp-14]
 005245E2    mov         eax,dword ptr [eax+2DC];TmwCustomEdit.fUndoList:TUndoList
 005245E8    mov         dl,3
 005245EA    call        TUndoList.AddChange
 005245EF    xor         edx,edx
 005245F1    mov         eax,dword ptr [ebp-14]
 005245F4    call        0052008C
 005245F9    xor         eax,eax
 005245FB    pop         edx
 005245FC    pop         ecx
 005245FD    pop         ecx
 005245FE    mov         dword ptr fs:[eax],edx
 00524601    push        52461B
 00524606    mov         eax,dword ptr [ebp-14]
 00524609    movzx       edx,byte ptr [ebp-41]
 0052460D    mov         byte ptr [eax+390],dl;TmwCustomEdit.fSelectionMode:TSelectionMode
 00524613    ret
>00524614    jmp         @HandleFinally
>00524619    jmp         00524606
 0052461B    lea         edx,[ebp-18C]
 00524621    mov         eax,dword ptr [ebp-14]
 00524624    call        0051FBB8
 00524629    lea         edx,[ebp-18C]
 0052462F    mov         eax,dword ptr [ebp-14]
 00524632    mov         ecx,dword ptr [eax]
 00524634    call        dword ptr [ecx+110];TmwCustomEdit.sub_0051FBE0
>0052463A    jmp         00525AAD
 0052463F    mov         eax,dword ptr [ebp-14]
 00524642    mov         edx,dword ptr [eax]
 00524644    call        dword ptr [edx+0F8];TmwCustomEdit.GetReadOnly
 0052464A    test        al,al
>0052464C    jne         00525AAD
 00524652    lea         edx,[ebp-30]
 00524655    mov         eax,dword ptr [ebp-14]
 00524658    mov         ecx,dword ptr [eax]
 0052465A    call        dword ptr [ecx+124];TmwCustomEdit.PrevWordPos
 00524660    mov         eax,dword ptr [ebp-14]
 00524663    call        0051C628
 00524668    cmp         eax,dword ptr [ebp-30]
>0052466B    jne         0052467E
 0052466D    mov         eax,dword ptr [ebp-14]
 00524670    call        0051C660
 00524675    cmp         eax,dword ptr [ebp-2C]
>00524678    je          00525AAD
 0052467E    mov         eax,dword ptr [ebp-14]
 00524681    movzx       eax,byte ptr [eax+390];TmwCustomEdit.fSelectionMode:TSelectionMode
 00524688    mov         byte ptr [ebp-41],al
 0052468B    xor         eax,eax
 0052468D    push        ebp
 0052468E    push        524733
 00524693    push        dword ptr fs:[eax]
 00524696    mov         dword ptr fs:[eax],esp
 00524699    mov         eax,dword ptr [ebp-14]
 0052469C    mov         byte ptr [eax+390],0;TmwCustomEdit.fSelectionMode:TSelectionMode
 005246A3    lea         edx,[ebp-30]
 005246A6    mov         eax,dword ptr [ebp-14]
 005246A9    call        0051F7D8
 005246AE    lea         edx,[ebp-18C]
 005246B4    mov         eax,dword ptr [ebp-14]
 005246B7    call        0051FBB8
 005246BC    lea         edx,[ebp-18C]
 005246C2    mov         eax,dword ptr [ebp-14]
 005246C5    call        0051F99C
 005246CA    lea         edx,[ebp-18C]
 005246D0    mov         eax,dword ptr [ebp-14]
 005246D3    call        0051FBB8
 005246D8    lea         eax,[ebp-18C]
 005246DE    push        eax
 005246DF    lea         edx,[ebp-1D4]
 005246E5    mov         eax,dword ptr [ebp-14]
 005246E8    call        0051C7FC
 005246ED    mov         eax,dword ptr [ebp-1D4]
 005246F3    call        @UStrToPWChar
 005246F8    push        eax
 005246F9    push        0
 005246FB    mov         eax,dword ptr [ebp-14]
 005246FE    mov         eax,dword ptr [eax+2DC];TmwCustomEdit.fUndoList:TUndoList
 00524704    lea         ecx,[ebp-30]
 00524707    mov         dl,3
 00524709    call        TUndoList.AddChange
 0052470E    xor         edx,edx
 00524710    mov         eax,dword ptr [ebp-14]
 00524713    call        0052008C
 00524718    xor         eax,eax
 0052471A    pop         edx
 0052471B    pop         ecx
 0052471C    pop         ecx
 0052471D    mov         dword ptr fs:[eax],edx
 00524720    push        52473A
 00524725    mov         eax,dword ptr [ebp-14]
 00524728    movzx       edx,byte ptr [ebp-41]
 0052472C    mov         byte ptr [eax+390],dl;TmwCustomEdit.fSelectionMode:TSelectionMode
 00524732    ret
>00524733    jmp         @HandleFinally
>00524738    jmp         00524725
 0052473A    lea         edx,[ebp-18C]
 00524740    mov         eax,dword ptr [ebp-14]
 00524743    call        0051FBB8
 00524748    lea         edx,[ebp-18C]
 0052474E    mov         eax,dword ptr [ebp-14]
 00524751    mov         ecx,dword ptr [eax]
 00524753    call        dword ptr [ecx+110];TmwCustomEdit.sub_0051FBE0
>00524759    jmp         00525AAD
 0052475E    mov         eax,dword ptr [ebp-14]
 00524761    mov         edx,dword ptr [eax]
 00524763    call        dword ptr [edx+0F8];TmwCustomEdit.GetReadOnly
 00524769    test        al,al
>0052476B    jne         00525AAD
 00524771    mov         eax,dword ptr [ebp-14]
 00524774    call        0051C660
 00524779    mov         dword ptr [ebp-0B4],eax
 0052477F    xor         eax,eax
 00524781    mov         dword ptr [ebp-0BC],eax
 00524787    mov         eax,dword ptr [ebp-0B4]
 0052478D    mov         dword ptr [ebp-0B8],eax
 00524793    mov         eax,dword ptr [ebp-14]
 00524796    call        0051C660
 0052479B    mov         dword ptr [ebp-0C0],eax
 005247A1    xor         eax,eax
 005247A3    mov         dword ptr [ebp-0C8],eax
 005247A9    mov         eax,dword ptr [ebp-0C0]
 005247AF    mov         dword ptr [ebp-0C4],eax
 005247B5    lea         eax,[ebp-0C8]
 005247BB    push        eax
 005247BC    lea         eax,[ebp-1D8]
 005247C2    push        eax
 005247C3    lea         edx,[ebp-1DC]
 005247C9    mov         eax,dword ptr [ebp-14]
 005247CC    call        0051C6C8
 005247D1    mov         eax,dword ptr [ebp-1DC]
 005247D7    push        eax
 005247D8    mov         eax,dword ptr [ebp-14]
 005247DB    call        0051C628
 005247E0    mov         ecx,eax
 005247E2    dec         ecx
 005247E3    mov         edx,1
 005247E8    pop         eax
 005247E9    call        @UStrCopy
 005247EE    mov         eax,dword ptr [ebp-1D8]
 005247F4    call        @UStrToPWChar
 005247F9    push        eax
 005247FA    push        0
 005247FC    mov         eax,dword ptr [ebp-14]
 005247FF    mov         eax,dword ptr [eax+2DC];TmwCustomEdit.fUndoList:TUndoList
 00524805    lea         ecx,[ebp-0BC]
 0052480B    mov         dl,4
 0052480D    call        TUndoList.AddChange
 00524812    mov         eax,dword ptr [ebp-14]
 00524815    movzx       eax,byte ptr [eax+390];TmwCustomEdit.fSelectionMode:TSelectionMode
 0052481C    mov         byte ptr [ebp-41],al
 0052481F    xor         eax,eax
 00524821    push        ebp
 00524822    push        5248AA
 00524827    push        dword ptr fs:[eax]
 0052482A    mov         dword ptr fs:[eax],esp
 0052482D    mov         eax,dword ptr [ebp-14]
 00524830    mov         byte ptr [eax+390],0;TmwCustomEdit.fSelectionMode:TSelectionMode
 00524837    mov         eax,dword ptr [ebp-14]
 0052483A    call        0051C660
 0052483F    mov         dword ptr [ebp-0CC],eax
 00524845    mov         dword ptr [ebp-0D4],1
 0052484F    mov         eax,dword ptr [ebp-0CC]
 00524855    mov         dword ptr [ebp-0D0],eax
 0052485B    lea         edx,[ebp-0D4]
 00524861    mov         eax,dword ptr [ebp-14]
 00524864    call        0051F7D8
 00524869    lea         edx,[ebp-18C]
 0052486F    mov         eax,dword ptr [ebp-14]
 00524872    call        0051FBB8
 00524877    lea         edx,[ebp-18C]
 0052487D    mov         eax,dword ptr [ebp-14]
 00524880    call        0051F99C
 00524885    xor         edx,edx
 00524887    mov         eax,dword ptr [ebp-14]
 0052488A    call        0052008C
 0052488F    xor         eax,eax
 00524891    pop         edx
 00524892    pop         ecx
 00524893    pop         ecx
 00524894    mov         dword ptr fs:[eax],edx
 00524897    push        5248B1
 0052489C    mov         eax,dword ptr [ebp-14]
 0052489F    movzx       edx,byte ptr [ebp-41]
 005248A3    mov         byte ptr [eax+390],dl;TmwCustomEdit.fSelectionMode:TSelectionMode
 005248A9    ret
>005248AA    jmp         @HandleFinally
>005248AF    jmp         0052489C
 005248B1    mov         eax,dword ptr [ebp-14]
 005248B4    call        0051C660
 005248B9    mov         dword ptr [ebp-0D8],eax
 005248BF    mov         dword ptr [ebp-0E0],1
 005248C9    mov         eax,dword ptr [ebp-0D8]
 005248CF    mov         dword ptr [ebp-0DC],eax
 005248D5    lea         edx,[ebp-0E0]
 005248DB    mov         eax,dword ptr [ebp-14]
 005248DE    mov         ecx,dword ptr [eax]
 005248E0    call        dword ptr [ecx+110];TmwCustomEdit.sub_0051FBE0
>005248E6    jmp         00525AAD
 005248EB    mov         eax,dword ptr [ebp-14]
 005248EE    mov         edx,dword ptr [eax]
 005248F0    call        dword ptr [edx+0F8];TmwCustomEdit.GetReadOnly
 005248F6    test        al,al
>005248F8    jne         00525AAD
 005248FE    lea         edx,[ebp-0F4]
 00524904    mov         eax,dword ptr [ebp-14]
 00524907    call        0051FBB8
 0052490C    lea         edx,[ebp-0EC]
 00524912    mov         eax,dword ptr [ebp-14]
 00524915    call        0051FBB8
 0052491A    lea         edx,[ebp-10]
 0052491D    mov         eax,dword ptr [ebp-14]
 00524920    call        0051C6C8
 00524925    mov         eax,dword ptr [ebp-14]
 00524928    call        0051C628
 0052492D    mov         esi,eax
 0052492F    lea         edx,[ebp-1E0]
 00524935    mov         eax,dword ptr [ebp-14]
 00524938    call        0051C6C8
 0052493D    mov         eax,dword ptr [ebp-1E0]
 00524943    mov         dword ptr [ebp-0E4],eax
 00524949    mov         ebx,dword ptr [ebp-0E4]
 0052494F    test        ebx,ebx
>00524951    je          00524958
 00524953    sub         ebx,4
 00524956    mov         ebx,dword ptr [ebx]
 00524958    lea         eax,[ebp-0EC]
 0052495E    push        eax
 0052495F    lea         eax,[ebp-1E4]
 00524965    push        eax
 00524966    mov         eax,dword ptr [ebp-14]
 00524969    call        0051C628
 0052496E    mov         ecx,ebx
 00524970    sub         ecx,eax
 00524972    inc         ecx
 00524973    mov         edx,esi
 00524975    mov         eax,dword ptr [ebp-10]
 00524978    call        @UStrCopy
 0052497D    mov         eax,dword ptr [ebp-1E4]
 00524983    call        @UStrToPWChar
 00524988    push        eax
 00524989    push        0
 0052498B    mov         eax,dword ptr [ebp-14]
 0052498E    mov         eax,dword ptr [eax+2DC];TmwCustomEdit.fUndoList:TUndoList
 00524994    lea         ecx,[ebp-0F4]
 0052499A    mov         dl,3
 0052499C    call        TUndoList.AddChange
 005249A1    mov         eax,dword ptr [ebp-14]
 005249A4    movzx       eax,byte ptr [eax+390];TmwCustomEdit.fSelectionMode:TSelectionMode
 005249AB    mov         byte ptr [ebp-41],al
 005249AE    xor         eax,eax
 005249B0    push        ebp
 005249B1    push        524A5F
 005249B6    push        dword ptr fs:[eax]
 005249B9    mov         dword ptr fs:[eax],esp
 005249BC    mov         eax,dword ptr [ebp-14]
 005249BF    mov         byte ptr [eax+390],0;TmwCustomEdit.fSelectionMode:TSelectionMode
 005249C6    lea         edx,[ebp-18C]
 005249CC    mov         eax,dword ptr [ebp-14]
 005249CF    call        0051FBB8
 005249D4    lea         edx,[ebp-18C]
 005249DA    mov         eax,dword ptr [ebp-14]
 005249DD    call        0051F7D8
 005249E2    lea         edx,[ebp-1E8]
 005249E8    mov         eax,dword ptr [ebp-14]
 005249EB    call        0051C6C8
 005249F0    mov         eax,dword ptr [ebp-1E8]
 005249F6    mov         dword ptr [ebp-0F8],eax
 005249FC    mov         ebx,dword ptr [ebp-0F8]
 00524A02    test        ebx,ebx
>00524A04    je          00524A0B
 00524A06    sub         ebx,4
 00524A09    mov         ebx,dword ptr [ebx]
 00524A0B    mov         eax,dword ptr [ebp-14]
 00524A0E    call        0051C660
 00524A13    mov         dword ptr [ebp-0FC],eax
 00524A19    inc         ebx
 00524A1A    mov         dword ptr [ebp-104],ebx
 00524A20    mov         eax,dword ptr [ebp-0FC]
 00524A26    mov         dword ptr [ebp-100],eax
 00524A2C    lea         edx,[ebp-104]
 00524A32    mov         eax,dword ptr [ebp-14]
 00524A35    call        0051F99C
 00524A3A    xor         edx,edx
 00524A3C    mov         eax,dword ptr [ebp-14]
 00524A3F    call        0052008C
 00524A44    xor         eax,eax
 00524A46    pop         edx
 00524A47    pop         ecx
 00524A48    pop         ecx
 00524A49    mov         dword ptr fs:[eax],edx
 00524A4C    push        524A66
 00524A51    mov         eax,dword ptr [ebp-14]
 00524A54    movzx       edx,byte ptr [ebp-41]
 00524A58    mov         byte ptr [eax+390],dl;TmwCustomEdit.fSelectionMode:TSelectionMode
 00524A5E    ret
>00524A5F    jmp         @HandleFinally
>00524A64    jmp         00524A51
 00524A66    lea         edx,[ebp-18C]
 00524A6C    mov         eax,dword ptr [ebp-14]
 00524A6F    call        0051FBB8
 00524A74    lea         edx,[ebp-18C]
 00524A7A    mov         eax,dword ptr [ebp-14]
 00524A7D    mov         ecx,dword ptr [eax]
 00524A7F    call        dword ptr [ecx+110];TmwCustomEdit.sub_0051FBE0
>00524A85    jmp         00525AAD
 00524A8A    mov         eax,dword ptr [ebp-14]
 00524A8D    mov         edx,dword ptr [eax]
 00524A8F    call        dword ptr [edx+0F8];TmwCustomEdit.GetReadOnly
 00524A95    test        al,al
>00524A97    jne         00525AAD
 00524A9D    mov         eax,dword ptr [ebp-14]
 00524AA0    mov         eax,dword ptr [eax+2A4];TmwCustomEdit.fLines:TStrings
 00524AA6    mov         edx,dword ptr [eax]
 00524AA8    call        dword ptr [edx+14];TStrings.GetCount
 00524AAB    dec         eax
>00524AAC    jne         00524AE6
 00524AAE    lea         ecx,[ebp-1EC]
 00524AB4    mov         eax,dword ptr [ebp-14]
 00524AB7    mov         eax,dword ptr [eax+2A4];TmwCustomEdit.fLines:TStrings
 00524ABD    xor         edx,edx
 00524ABF    mov         ebx,dword ptr [eax]
 00524AC1    call        dword ptr [ebx+0C];TStrings.Get
 00524AC4    mov         eax,dword ptr [ebp-1EC]
 00524ACA    mov         dword ptr [ebp-108],eax
 00524AD0    mov         eax,dword ptr [ebp-108]
 00524AD6    test        eax,eax
>00524AD8    je          00524ADF
 00524ADA    sub         eax,4
 00524ADD    mov         eax,dword ptr [eax]
 00524ADF    test        eax,eax
 00524AE1    sete        al
>00524AE4    jmp         00524AE8
 00524AE6    xor         eax,eax
 00524AE8    test        al,al
>00524AEA    jne         00525AAD
 00524AF0    mov         eax,dword ptr [ebp-14]
 00524AF3    call        0051C710
 00524AF8    test        al,al
>00524AFA    je          00524B18
 00524AFC    lea         edx,[ebp-18C]
 00524B02    mov         eax,dword ptr [ebp-14]
 00524B05    call        0051FBB8
 00524B0A    lea         edx,[ebp-18C]
 00524B10    mov         eax,dword ptr [ebp-14]
 00524B13    call        0051F7D8
 00524B18    mov         eax,dword ptr [ebp-14]
 00524B1B    mov         eax,dword ptr [eax+2A4];TmwCustomEdit.fLines:TStrings
 00524B21    mov         edx,dword ptr [eax]
 00524B23    call        dword ptr [edx+14];TStrings.GetCount
 00524B26    dec         eax
>00524B27    jne         00524BAF
 00524B2D    mov         eax,dword ptr [ebp-14]
 00524B30    call        0051C660
 00524B35    mov         dword ptr [ebp-10C],eax
 00524B3B    mov         dword ptr [ebp-114],1
 00524B45    mov         eax,dword ptr [ebp-10C]
 00524B4B    mov         dword ptr [ebp-110],eax
 00524B51    lea         edx,[ebp-18C]
 00524B57    mov         eax,dword ptr [ebp-14]
 00524B5A    call        0051FBB8
 00524B5F    lea         eax,[ebp-18C]
 00524B65    push        eax
 00524B66    lea         edx,[ebp-1F0]
 00524B6C    mov         eax,dword ptr [ebp-14]
 00524B6F    call        0051C6C8
 00524B74    mov         eax,dword ptr [ebp-1F0]
 00524B7A    call        @UStrToPWChar
 00524B7F    push        eax
 00524B80    push        0
 00524B82    mov         eax,dword ptr [ebp-14]
 00524B85    mov         eax,dword ptr [eax+2DC];TmwCustomEdit.fUndoList:TUndoList
 00524B8B    lea         ecx,[ebp-114]
 00524B91    mov         dl,3
 00524B93    call        TUndoList.AddChange
 00524B98    mov         eax,dword ptr [ebp-14]
 00524B9B    mov         eax,dword ptr [eax+2A4];TmwCustomEdit.fLines:TStrings
 00524BA1    xor         ecx,ecx
 00524BA3    xor         edx,edx
 00524BA5    mov         ebx,dword ptr [eax]
 00524BA7    call        dword ptr [ebx+20];TStrings.Put
>00524BAA    jmp         00524C43
 00524BAF    mov         eax,dword ptr [ebp-14]
 00524BB2    call        0051C660
 00524BB7    mov         dword ptr [ebp-118],eax
 00524BBD    mov         dword ptr [ebp-120],1
 00524BC7    mov         eax,dword ptr [ebp-118]
 00524BCD    mov         dword ptr [ebp-11C],eax
 00524BD3    lea         edx,[ebp-18C]
 00524BD9    mov         eax,dword ptr [ebp-14]
 00524BDC    call        0051FBB8
 00524BE1    lea         eax,[ebp-18C]
 00524BE7    push        eax
 00524BE8    lea         edx,[ebp-1F4]
 00524BEE    mov         eax,dword ptr [ebp-14]
 00524BF1    call        0051C6C8
 00524BF6    lea         eax,[ebp-1F4]
 00524BFC    mov         edx,525B5C;'
'
 00524C01    call        @UStrCat
 00524C06    mov         eax,dword ptr [ebp-1F4]
 00524C0C    call        @UStrToPWChar
 00524C11    push        eax
 00524C12    push        0
 00524C14    mov         eax,dword ptr [ebp-14]
 00524C17    mov         eax,dword ptr [eax+2DC];TmwCustomEdit.fUndoList:TUndoList
 00524C1D    lea         ecx,[ebp-120]
 00524C23    mov         dl,3
 00524C25    call        TUndoList.AddChange
 00524C2A    mov         eax,dword ptr [ebp-14]
 00524C2D    call        0051C660
 00524C32    mov         edx,eax
 00524C34    dec         edx
 00524C35    mov         eax,dword ptr [ebp-14]
 00524C38    mov         eax,dword ptr [eax+2A4];TmwCustomEdit.fLines:TStrings
 00524C3E    mov         ecx,dword ptr [eax]
 00524C40    call        dword ptr [ecx+48];TStrings.Delete
 00524C43    mov         eax,dword ptr [ebp-14]
 00524C46    mov         eax,dword ptr [eax+370];TmwCustomEdit.fMarkList:TMarkList
 00524C4C    mov         esi,dword ptr [eax+8];TMarkList.FCount:Integer
 00524C4F    dec         esi
 00524C50    test        esi,esi
>00524C52    jl          00524CA5
 00524C54    inc         esi
 00524C55    xor         ebx,ebx
 00524C57    mov         eax,dword ptr [ebp-14]
 00524C5A    mov         eax,dword ptr [eax+370];TmwCustomEdit.fMarkList:TMarkList
 00524C60    mov         edx,ebx
 00524C62    call        00529C58
 00524C67    mov         edi,dword ptr [eax+4]
 00524C6A    mov         eax,dword ptr [ebp-14]
 00524C6D    call        0051C660
 00524C72    cmp         edi,eax
>00524C74    jl          00524CA1
 00524C76    mov         eax,dword ptr [ebp-14]
 00524C79    mov         eax,dword ptr [eax+370];TmwCustomEdit.fMarkList:TMarkList
 00524C7F    mov         edx,ebx
 00524C81    call        00529C58
 00524C86    mov         eax,dword ptr [eax+4]
 00524C89    dec         eax
 00524C8A    push        eax
 00524C8B    mov         eax,dword ptr [ebp-14]
 00524C8E    mov         eax,dword ptr [eax+370];TmwCustomEdit.fMarkList:TMarkList
 00524C94    mov         edx,ebx
 00524C96    call        00529C58
 00524C9B    pop         edx
 00524C9C    mov         ecx,dword ptr [eax]
 00524C9E    call        dword ptr [ecx+0C]
 00524CA1    inc         ebx
 00524CA2    dec         esi
>00524CA3    jne         00524C57
 00524CA5    mov         eax,dword ptr [ebp-14]
 00524CA8    call        0051C660
 00524CAD    mov         dword ptr [ebp-124],eax
 00524CB3    mov         dword ptr [ebp-12C],1
 00524CBD    mov         eax,dword ptr [ebp-124]
 00524CC3    mov         dword ptr [ebp-128],eax
 00524CC9    lea         edx,[ebp-12C]
 00524CCF    mov         eax,dword ptr [ebp-14]
 00524CD2    mov         ecx,dword ptr [eax]
 00524CD4    call        dword ptr [ecx+110];TmwCustomEdit.sub_0051FBE0
>00524CDA    jmp         00525AAD
 00524CDF    mov         eax,dword ptr [ebp-14]
 00524CE2    mov         edx,dword ptr [eax]
 00524CE4    call        dword ptr [edx+0F8];TmwCustomEdit.GetReadOnly
 00524CEA    test        al,al
>00524CEC    jne         00525AAD
 00524CF2    mov         eax,dword ptr [ebp-14]
 00524CF5    call        TmwCustomEdit.ClearAll
>00524CFA    jmp         00525AAD
 00524CFF    mov         eax,dword ptr [ebp-14]
 00524D02    mov         edx,dword ptr [eax]
 00524D04    call        dword ptr [edx+0F8];TmwCustomEdit.GetReadOnly
 00524D0A    test        al,al
>00524D0C    jne         00525AAD
 00524D12    mov         eax,dword ptr [ebp-14]
 00524D15    call        0051C710
 00524D1A    test        al,al
>00524D1C    je          00524D6F
 00524D1E    mov         eax,dword ptr [ebp-14]
 00524D21    add         eax,280;TmwCustomEdit.fBlockEnd:TPoint
 00524D26    push        eax
 00524D27    lea         edx,[ebp-1F8]
 00524D2D    mov         eax,dword ptr [ebp-14]
 00524D30    call        0051C7FC
 00524D35    mov         eax,dword ptr [ebp-1F8]
 00524D3B    call        @UStrToPWChar
 00524D40    push        eax
 00524D41    mov         eax,dword ptr [ebp-14]
 00524D44    movzx       eax,byte ptr [eax+390];TmwCustomEdit.fSelectionMode:TSelectionMode
 00524D4B    push        eax
 00524D4C    mov         eax,dword ptr [ebp-14]
 00524D4F    lea         ecx,[eax+278];TmwCustomEdit.fBlockBegin:TPoint
 00524D55    mov         eax,dword ptr [ebp-14]
 00524D58    mov         eax,dword ptr [eax+2DC];TmwCustomEdit.fUndoList:TUndoList
 00524D5E    mov         dl,4
 00524D60    call        TUndoList.AddChange
 00524D65    xor         edx,edx
 00524D67    mov         eax,dword ptr [ebp-14]
 00524D6A    call        0052008C
 00524D6F    xor         esi,esi
 00524D71    lea         edx,[ebp-4]
 00524D74    mov         eax,dword ptr [ebp-14]
 00524D77    call        0051C6C8
 00524D7C    lea         edx,[ebp-8]
 00524D7F    mov         eax,dword ptr [ebp-14]
 00524D82    call        0051C6C8
 00524D87    mov         eax,dword ptr [ebp-4]
 00524D8A    test        eax,eax
>00524D8C    je          00524D93
 00524D8E    sub         eax,4
 00524D91    mov         eax,dword ptr [eax]
 00524D93    mov         ebx,eax
 00524D95    test        ebx,ebx
>00524D97    jle         00525235
 00524D9D    mov         eax,dword ptr [ebp-14]
 00524DA0    call        0051C628
 00524DA5    cmp         ebx,eax
>00524DA7    jl          005250A3
 00524DAD    mov         eax,dword ptr [ebp-14]
 00524DB0    call        0051C628
 00524DB5    dec         eax
>00524DB6    jle         00524FBF
 00524DBC    mov         edx,dword ptr [ebp-4]
 00524DBF    mov         eax,dword ptr [ebp-14]
 00524DC2    call        0051CFA4
 00524DC7    mov         dword ptr [ebp-1C],eax
 00524DCA    mov         eax,dword ptr [ebp-14]
 00524DCD    mov         eax,dword ptr [eax+288];TmwCustomEdit.fCaretX:Integer
 00524DD3    cmp         eax,dword ptr [ebp-1C]
>00524DD6    jg          00524E9F
 00524DDC    mov         eax,dword ptr [ebp-14]
 00524DDF    mov         edx,dword ptr [eax+28C];TmwCustomEdit.fCaretY:Integer
 00524DE5    mov         eax,dword ptr [ebp-14]
 00524DE8    mov         eax,dword ptr [eax+2A4];TmwCustomEdit.fLines:TStrings
 00524DEE    xor         ecx,ecx
 00524DF0    mov         ebx,dword ptr [eax]
 00524DF2    call        dword ptr [ebx+20];TStrings.Put
 00524DF5    mov         eax,dword ptr [ebp-14]
 00524DF8    call        0051C660
 00524DFD    mov         edx,eax
 00524DFF    mov         eax,dword ptr [ebp-14]
 00524E02    mov         eax,dword ptr [eax+2A4];TmwCustomEdit.fLines:TStrings
 00524E08    mov         ecx,dword ptr [ebp-4]
 00524E0B    mov         ebx,dword ptr [eax]
 00524E0D    call        dword ptr [ebx+60];TStrings.Insert
 00524E10    mov         eax,dword ptr [ebp-14]
 00524E13    call        0051C628
 00524E18    mov         dword ptr [ebp-130],eax
 00524E1E    mov         eax,dword ptr [ebp-14]
 00524E21    call        0051C660
 00524E26    dec         eax
 00524E27    mov         dword ptr [ebp-134],eax
 00524E2D    mov         eax,dword ptr [ebp-130]
 00524E33    mov         dword ptr [ebp-13C],eax
 00524E39    mov         eax,dword ptr [ebp-134]
 00524E3F    mov         dword ptr [ebp-138],eax
 00524E45    lea         edx,[ebp-18C]
 00524E4B    mov         eax,dword ptr [ebp-14]
 00524E4E    call        0051FBB8
 00524E53    lea         eax,[ebp-18C]
 00524E59    push        eax
 00524E5A    mov         eax,dword ptr [ebp-4]
 00524E5D    call        @UStrToPWChar
 00524E62    push        eax
 00524E63    push        0
 00524E65    mov         eax,dword ptr [ebp-14]
 00524E68    mov         eax,dword ptr [eax+2DC];TmwCustomEdit.fUndoList:TUndoList
 00524E6E    lea         ecx,[ebp-13C]
 00524E74    mov         dl,7
 00524E76    call        TUndoList.AddChange
 00524E7B    cmp         word ptr [ebp-16],199
>00524E81    jne         00525342
 00524E87    mov         eax,dword ptr [ebp-14]
 00524E8A    call        0051C660
 00524E8F    mov         edx,eax
 00524E91    inc         edx
 00524E92    mov         eax,dword ptr [ebp-14]
 00524E95    call        0051FB94
>00524E9A    jmp         00525342
 00524E9F    lea         eax,[ebp-4]
 00524EA2    push        eax
 00524EA3    lea         edx,[ebp-1FC]
 00524EA9    mov         eax,dword ptr [ebp-14]
 00524EAC    call        0051C6C8
 00524EB1    mov         eax,dword ptr [ebp-1FC]
 00524EB7    mov         edx,dword ptr [ebp-14]
 00524EBA    mov         ecx,dword ptr [edx+288];TmwCustomEdit.fCaretX:Integer
 00524EC0    mov         edx,1
 00524EC5    call        @UStrCopy
 00524ECA    lea         edx,[ebp-200]
 00524ED0    mov         eax,dword ptr [ebp-4]
 00524ED3    call        TrimRight
 00524ED8    mov         edx,dword ptr [ebp-200]
 00524EDE    mov         eax,dword ptr [ebp-14]
 00524EE1    call        0051FF54
 00524EE6    lea         ecx,[ebp-0C]
 00524EE9    mov         edx,dword ptr [ebp-1C]
 00524EEC    mov         ax,20
 00524EF0    call        StringOfChar
 00524EF5    mov         eax,dword ptr [ebp-14]
 00524EF8    mov         ecx,dword ptr [eax+288];TmwCustomEdit.fCaretX:Integer
 00524EFE    lea         eax,[ebp-8]
 00524F01    mov         edx,1
 00524F06    call        @UStrDelete
 00524F0B    lea         edx,[ebp-18C]
 00524F11    mov         eax,dword ptr [ebp-14]
 00524F14    call        0051FBB8
 00524F19    lea         eax,[ebp-18C]
 00524F1F    push        eax
 00524F20    mov         eax,dword ptr [ebp-8]
 00524F23    call        @UStrToPWChar
 00524F28    push        eax
 00524F29    push        0
 00524F2B    lea         edx,[ebp-1A4]
 00524F31    mov         eax,dword ptr [ebp-14]
 00524F34    call        0051FBB8
 00524F39    lea         ecx,[ebp-1A4]
 00524F3F    mov         eax,dword ptr [ebp-14]
 00524F42    mov         eax,dword ptr [eax+2DC];TmwCustomEdit.fUndoList:TUndoList
 00524F48    mov         dl,7
 00524F4A    call        TUndoList.AddChange
 00524F4F    lea         eax,[ebp-8]
 00524F52    mov         ecx,dword ptr [ebp-8]
 00524F55    mov         edx,dword ptr [ebp-0C]
 00524F58    call        @UStrCat3
 00524F5D    mov         eax,dword ptr [ebp-14]
 00524F60    call        0051C660
 00524F65    mov         edx,eax
 00524F67    mov         eax,dword ptr [ebp-14]
 00524F6A    mov         eax,dword ptr [eax+2A4];TmwCustomEdit.fLines:TStrings
 00524F70    mov         ecx,dword ptr [ebp-8]
 00524F73    mov         ebx,dword ptr [eax]
 00524F75    call        dword ptr [ebx+60];TStrings.Insert
 00524F78    cmp         word ptr [ebp-16],199
>00524F7E    jne         00525342
 00524F84    mov         eax,dword ptr [ebp-14]
 00524F87    call        0051C660
 00524F8C    inc         eax
 00524F8D    mov         dword ptr [ebp-140],eax
 00524F93    mov         eax,dword ptr [ebp-1C]
 00524F96    inc         eax
 00524F97    mov         dword ptr [ebp-148],eax
 00524F9D    mov         eax,dword ptr [ebp-140]
 00524FA3    mov         dword ptr [ebp-144],eax
 00524FA9    lea         edx,[ebp-148]
 00524FAF    mov         eax,dword ptr [ebp-14]
 00524FB2    mov         ecx,dword ptr [eax]
 00524FB4    call        dword ptr [ecx+110];TmwCustomEdit.sub_0051FBE0
>00524FBA    jmp         00525342
 00524FBF    mov         eax,dword ptr [ebp-14]
 00524FC2    mov         ebx,dword ptr [eax+28C];TmwCustomEdit.fCaretY:Integer
 00524FC8    dec         ebx
 00524FC9    test        ebx,ebx
>00524FCB    jl          00525007
 00524FCD    lea         ecx,[ebp-204]
 00524FD3    mov         eax,dword ptr [ebp-14]
 00524FD6    mov         eax,dword ptr [eax+2A4];TmwCustomEdit.fLines:TStrings
 00524FDC    mov         edx,ebx
 00524FDE    mov         esi,dword ptr [eax]
 00524FE0    call        dword ptr [esi+0C];TStrings.Get
 00524FE3    mov         eax,dword ptr [ebp-204]
 00524FE9    mov         dword ptr [ebp-14C],eax
 00524FEF    mov         esi,dword ptr [ebp-14C]
 00524FF5    test        esi,esi
>00524FF7    je          00524FFE
 00524FF9    sub         esi,4
 00524FFC    mov         esi,dword ptr [esi]
 00524FFE    test        esi,esi
>00525000    jg          00525007
 00525002    dec         ebx
 00525003    test        ebx,ebx
>00525005    jge         00524FCD
 00525007    mov         eax,dword ptr [ebp-14]
 0052500A    mov         edx,dword ptr [eax+28C];TmwCustomEdit.fCaretY:Integer
 00525010    mov         eax,dword ptr [ebp-14]
 00525013    mov         eax,dword ptr [eax+2A4];TmwCustomEdit.fLines:TStrings
 00525019    xor         ecx,ecx
 0052501B    mov         ebx,dword ptr [eax]
 0052501D    call        dword ptr [ebx+20];TStrings.Put
 00525020    mov         eax,dword ptr [ebp-14]
 00525023    call        0051C660
 00525028    mov         edx,eax
 0052502A    mov         eax,dword ptr [ebp-14]
 0052502D    mov         eax,dword ptr [eax+2A4];TmwCustomEdit.fLines:TStrings
 00525033    mov         ecx,dword ptr [ebp-4]
 00525036    mov         ebx,dword ptr [eax]
 00525038    call        dword ptr [ebx+60];TStrings.Insert
 0052503B    lea         edx,[ebp-18C]
 00525041    mov         eax,dword ptr [ebp-14]
 00525044    call        0051FBB8
 00525049    lea         eax,[ebp-18C]
 0052504F    push        eax
 00525050    mov         eax,dword ptr [ebp-8]
 00525053    call        @UStrToPWChar
 00525058    push        eax
 00525059    push        0
 0052505B    lea         edx,[ebp-1A4]
 00525061    mov         eax,dword ptr [ebp-14]
 00525064    call        0051FBB8
 00525069    lea         ecx,[ebp-1A4]
 0052506F    mov         eax,dword ptr [ebp-14]
 00525072    mov         eax,dword ptr [eax+2DC];TmwCustomEdit.fUndoList:TUndoList
 00525078    mov         dl,7
 0052507A    call        TUndoList.AddChange
 0052507F    cmp         word ptr [ebp-16],199
>00525085    jne         00525342
 0052508B    mov         eax,dword ptr [ebp-14]
 0052508E    call        0051C660
 00525093    mov         edx,eax
 00525095    inc         edx
 00525096    mov         eax,dword ptr [ebp-14]
 00525099    call        0051FB94
>0052509E    jmp         00525342
 005250A3    mov         eax,dword ptr [ebp-14]
 005250A6    mov         ebx,dword ptr [eax+28C];TmwCustomEdit.fCaretY:Integer
 005250AC    test        ebx,ebx
>005250AE    jl          0052512C
 005250B0    lea         ecx,[ebp-208]
 005250B6    mov         eax,dword ptr [ebp-14]
 005250B9    mov         eax,dword ptr [eax+2A4];TmwCustomEdit.fLines:TStrings
 005250BF    mov         edx,ebx
 005250C1    mov         esi,dword ptr [eax]
 005250C3    call        dword ptr [esi+0C];TStrings.Get
 005250C6    mov         edx,dword ptr [ebp-208]
 005250CC    mov         eax,dword ptr [ebp-14]
 005250CF    call        0051CFA4
 005250D4    mov         esi,eax
 005250D6    lea         ecx,[ebp-20C]
 005250DC    mov         eax,dword ptr [ebp-14]
 005250DF    mov         eax,dword ptr [eax+2A4];TmwCustomEdit.fLines:TStrings
 005250E5    mov         edx,ebx
 005250E7    mov         edi,dword ptr [eax]
 005250E9    call        dword ptr [edi+0C];TStrings.Get
 005250EC    mov         eax,dword ptr [ebp-20C]
 005250F2    mov         dword ptr [ebp-150],eax
 005250F8    mov         eax,dword ptr [ebp-150]
 005250FE    mov         dword ptr [ebp-154],eax
 00525104    cmp         dword ptr [ebp-154],0
>0052510B    je          0052511E
 0052510D    mov         eax,dword ptr [ebp-154]
 00525113    sub         eax,4
 00525116    mov         eax,dword ptr [eax]
 00525118    mov         dword ptr [ebp-154],eax
 0052511E    cmp         dword ptr [ebp-154],0
>00525125    jg          0052512C
 00525127    dec         ebx
 00525128    test        ebx,ebx
>0052512A    jge         005250B0
 0052512C    lea         edx,[ebp-18C]
 00525132    mov         eax,dword ptr [ebp-14]
 00525135    call        0051FBB8
 0052513A    lea         eax,[ebp-18C]
 00525140    push        eax
 00525141    push        0
 00525143    push        0
 00525145    lea         edx,[ebp-1A4]
 0052514B    mov         eax,dword ptr [ebp-14]
 0052514E    call        0051FBB8
 00525153    lea         ecx,[ebp-1A4]
 00525159    mov         eax,dword ptr [ebp-14]
 0052515C    mov         eax,dword ptr [eax+2DC];TmwCustomEdit.fUndoList:TUndoList
 00525162    mov         dl,7
 00525164    call        TUndoList.AddChange
 00525169    cmp         word ptr [ebp-16],199
>0052516F    jne         0052517C
 00525171    lea         edx,[esi+1]
 00525174    mov         eax,dword ptr [ebp-14]
 00525177    call        0051FB70
 0052517C    cmp         word ptr [ebp-16],19A
>00525182    je          00525190
 00525184    mov         eax,dword ptr [ebp-14]
 00525187    test        byte ptr [eax+3CE],40;TmwCustomEdit.fOptions:TmwEditorOptions
>0052518E    je          005251AA
 00525190    mov         eax,dword ptr [ebp-14]
 00525193    call        0051C660
 00525198    mov         edx,eax
 0052519A    mov         eax,dword ptr [ebp-14]
 0052519D    mov         eax,dword ptr [eax+2A4];TmwCustomEdit.fLines:TStrings
 005251A3    xor         ecx,ecx
 005251A5    mov         ebx,dword ptr [eax]
 005251A7    call        dword ptr [ebx+60];TStrings.Insert
 005251AA    cmp         word ptr [ebp-16],199
>005251B0    jne         005251CA
 005251B2    mov         eax,dword ptr [ebp-14]
 005251B5    inc         dword ptr [eax+28C];TmwCustomEdit.fCaretY:Integer
 005251BB    movzx       edx,byte ptr ds:[525B64];0x4 gvar_00525B64
 005251C2    mov         eax,dword ptr [ebp-14]
 005251C5    call        005287FC
 005251CA    cmp         word ptr [ebp-16],199
>005251D0    jne         00525342
 005251D6    mov         eax,dword ptr [ebp-14]
 005251D9    movzx       eax,word ptr [eax+3CE];TmwCustomEdit.fOptions:TmwEditorOptions
 005251E0    and         ax,word ptr ds:[525B68];0x41 gvar_00525B68
 005251E7    movzx       edx,word ptr ds:[525B6C];0x1 gvar_00525B6C
 005251EE    cmp         dx,ax
>005251F1    jne         00525342
 005251F7    lea         ecx,[ebp-210]
 005251FD    mov         edx,esi
 005251FF    mov         ax,20
 00525203    call        StringOfChar
 00525208    mov         ecx,dword ptr [ebp-210]
 0052520E    mov         eax,dword ptr [ebp-14]
 00525211    mov         edx,dword ptr [eax+28C];TmwCustomEdit.fCaretY:Integer
 00525217    mov         eax,dword ptr [ebp-14]
 0052521A    mov         eax,dword ptr [eax+2A4];TmwCustomEdit.fLines:TStrings
 00525220    mov         ebx,dword ptr [eax]
 00525222    call        dword ptr [ebx+60];TStrings.Insert
 00525225    lea         edx,[esi+1]
 00525228    mov         eax,dword ptr [ebp-14]
 0052522B    call        0051FB70
>00525230    jmp         00525342
 00525235    mov         eax,dword ptr [ebp-14]
 00525238    mov         ebx,dword ptr [eax+28C];TmwCustomEdit.fCaretY:Integer
 0052523E    test        ebx,ebx
>00525240    jl          005252BE
 00525242    lea         ecx,[ebp-214]
 00525248    mov         eax,dword ptr [ebp-14]
 0052524B    mov         eax,dword ptr [eax+2A4];TmwCustomEdit.fLines:TStrings
 00525251    mov         edx,ebx
 00525253    mov         esi,dword ptr [eax]
 00525255    call        dword ptr [esi+0C];TStrings.Get
 00525258    mov         edx,dword ptr [ebp-214]
 0052525E    mov         eax,dword ptr [ebp-14]
 00525261    call        0051CFA4
 00525266    mov         esi,eax
 00525268    lea         ecx,[ebp-218]
 0052526E    mov         eax,dword ptr [ebp-14]
 00525271    mov         eax,dword ptr [eax+2A4];TmwCustomEdit.fLines:TStrings
 00525277    mov         edx,ebx
 00525279    mov         edi,dword ptr [eax]
 0052527B    call        dword ptr [edi+0C];TStrings.Get
 0052527E    mov         eax,dword ptr [ebp-218]
 00525284    mov         dword ptr [ebp-158],eax
 0052528A    mov         eax,dword ptr [ebp-158]
 00525290    mov         dword ptr [ebp-15C],eax
 00525296    cmp         dword ptr [ebp-15C],0
>0052529D    je          005252B0
 0052529F    mov         eax,dword ptr [ebp-15C]
 005252A5    sub         eax,4
 005252A8    mov         eax,dword ptr [eax]
 005252AA    mov         dword ptr [ebp-15C],eax
 005252B0    cmp         dword ptr [ebp-15C],0
>005252B7    jg          005252BE
 005252B9    dec         ebx
 005252BA    test        ebx,ebx
>005252BC    jge         00525242
 005252BE    lea         edx,[ebp-18C]
 005252C4    mov         eax,dword ptr [ebp-14]
 005252C7    call        0051FBB8
 005252CC    lea         eax,[ebp-18C]
 005252D2    push        eax
 005252D3    push        0
 005252D5    push        0
 005252D7    lea         edx,[ebp-1A4]
 005252DD    mov         eax,dword ptr [ebp-14]
 005252E0    call        0051FBB8
 005252E5    lea         ecx,[ebp-1A4]
 005252EB    mov         eax,dword ptr [ebp-14]
 005252EE    mov         eax,dword ptr [eax+2DC];TmwCustomEdit.fUndoList:TUndoList
 005252F4    mov         dl,7
 005252F6    call        TUndoList.AddChange
 005252FB    cmp         word ptr [ebp-16],199
>00525301    jne         0052530E
 00525303    lea         edx,[esi+1]
 00525306    mov         eax,dword ptr [ebp-14]
 00525309    call        0051FB70
 0052530E    mov         eax,dword ptr [ebp-14]
 00525311    mov         edx,dword ptr [eax+28C];TmwCustomEdit.fCaretY:Integer
 00525317    mov         eax,dword ptr [ebp-14]
 0052531A    mov         eax,dword ptr [eax+2A4];TmwCustomEdit.fLines:TStrings
 00525320    xor         ecx,ecx
 00525322    mov         ebx,dword ptr [eax]
 00525324    call        dword ptr [ebx+60];TStrings.Insert
 00525327    cmp         word ptr [ebp-16],199
>0052532D    jne         00525342
 0052532F    mov         eax,dword ptr [ebp-14]
 00525332    call        0051C660
 00525337    mov         edx,eax
 00525339    inc         edx
 0052533A    mov         eax,dword ptr [ebp-14]
 0052533D    call        0051FB94
 00525342    mov         eax,dword ptr [ebp-14]
 00525345    mov         eax,dword ptr [eax+370];TmwCustomEdit.fMarkList:TMarkList
 0052534B    mov         esi,dword ptr [eax+8];TMarkList.FCount:Integer
 0052534E    dec         esi
 0052534F    test        esi,esi
>00525351    jl          00525AAD
 00525357    inc         esi
 00525358    xor         ebx,ebx
 0052535A    mov         eax,dword ptr [ebp-14]
 0052535D    mov         eax,dword ptr [eax+370];TmwCustomEdit.fMarkList:TMarkList
 00525363    mov         edx,ebx
 00525365    call        00529C58
 0052536A    mov         edi,dword ptr [eax+4]
 0052536D    mov         eax,dword ptr [ebp-14]
 00525370    call        0051C660
 00525375    cmp         edi,eax
>00525377    jl          005253A4
 00525379    mov         eax,dword ptr [ebp-14]
 0052537C    mov         eax,dword ptr [eax+370];TmwCustomEdit.fMarkList:TMarkList
 00525382    mov         edx,ebx
 00525384    call        00529C58
 00525389    mov         eax,dword ptr [eax+4]
 0052538C    inc         eax
 0052538D    push        eax
 0052538E    mov         eax,dword ptr [ebp-14]
 00525391    mov         eax,dword ptr [eax+370];TmwCustomEdit.fMarkList:TMarkList
 00525397    mov         edx,ebx
 00525399    call        00529C58
 0052539E    pop         edx
 0052539F    mov         ecx,dword ptr [eax]
 005253A1    call        dword ptr [ecx+0C]
 005253A4    inc         ebx
 005253A5    dec         esi
>005253A6    jne         0052535A
>005253A8    jmp         00525AAD
 005253AD    mov         eax,dword ptr [ebp-14]
 005253B0    mov         edx,dword ptr [eax]
 005253B2    call        dword ptr [edx+0F8];TmwCustomEdit.GetReadOnly
 005253B8    test        al,al
>005253BA    jne         00525AAD
 005253C0    mov         eax,dword ptr [ebp-14]
 005253C3    call        00528850
>005253C8    jmp         00525AAD
 005253CD    mov         eax,dword ptr [ebp-14]
 005253D0    mov         edx,dword ptr [eax]
 005253D2    call        dword ptr [edx+0F8];TmwCustomEdit.GetReadOnly
 005253D8    test        al,al
>005253DA    jmp         00525AAD
 005253DF    mov         eax,dword ptr [ebp-14]
 005253E2    mov         edx,dword ptr [eax]
 005253E4    call        dword ptr [edx+0F4];TmwCustomEdit.sub_005292E4
>005253EA    jmp         00525AAD
 005253EF    mov         eax,dword ptr [ebp-14]
 005253F2    mov         edx,dword ptr [eax]
 005253F4    call        dword ptr [edx+0F8];TmwCustomEdit.GetReadOnly
 005253FA    test        al,al
>005253FC    jne         00525AAD
 00525402    cmp         word ptr [ebp-18],20
>00525407    jb          00525AAD
 0052540D    cmp         word ptr [ebp-18],7F
>00525412    je          00525AAD
 00525418    mov         eax,dword ptr [ebp-14]
 0052541B    call        0051C710
 00525420    test        al,al
>00525422    je          0052550C
 00525428    mov         eax,dword ptr [ebp-14]
 0052542B    add         eax,280;TmwCustomEdit.fBlockEnd:TPoint
 00525430    push        eax
 00525431    lea         edx,[ebp-21C]
 00525437    mov         eax,dword ptr [ebp-14]
 0052543A    call        0051C7FC
 0052543F    mov         eax,dword ptr [ebp-21C]
 00525445    call        @UStrToPWChar
 0052544A    push        eax
 0052544B    mov         eax,dword ptr [ebp-14]
 0052544E    movzx       eax,byte ptr [eax+390];TmwCustomEdit.fSelectionMode:TSelectionMode
 00525455    push        eax
 00525456    mov         eax,dword ptr [ebp-14]
 00525459    lea         ecx,[eax+278];TmwCustomEdit.fBlockBegin:TPoint
 0052545F    mov         eax,dword ptr [ebp-14]
 00525462    mov         eax,dword ptr [eax+2DC];TmwCustomEdit.fUndoList:TUndoList
 00525468    mov         dl,5
 0052546A    call        TUndoList.AddChange
 0052546F    mov         eax,dword ptr [ebp-14]
 00525472    cmp         byte ptr [eax+390],2;TmwCustomEdit.fSelectionMode:TSelectionMode
>00525479    jne         005254BF
 0052547B    lea         edx,[ebp-18C]
 00525481    mov         eax,dword ptr [ebp-14]
 00525484    call        0051C570
 00525489    mov         eax,dword ptr [ebp-188]
 0052548F    mov         dword ptr [ebp-160],eax
 00525495    mov         dword ptr [ebp-168],1
 0052549F    mov         eax,dword ptr [ebp-160]
 005254A5    mov         dword ptr [ebp-164],eax
 005254AB    mov         eax,dword ptr [ebp-168]
 005254B1    mov         dword ptr [ebp-24],eax
 005254B4    mov         eax,dword ptr [ebp-164]
 005254BA    mov         dword ptr [ebp-20],eax
>005254BD    jmp         005254CA
 005254BF    lea         edx,[ebp-24]
 005254C2    mov         eax,dword ptr [ebp-14]
 005254C5    call        0051C570
 005254CA    lea         eax,[ebp-220]
 005254D0    movzx       edx,word ptr [ebp-18]
 005254D4    call        @UStrFromWChar
 005254D9    mov         edx,dword ptr [ebp-220]
 005254DF    mov         eax,dword ptr [ebp-14]
 005254E2    call        0052008C
 005254E7    mov         eax,dword ptr [ebp-14]
 005254EA    add         eax,280;TmwCustomEdit.fBlockEnd:TPoint
 005254EF    push        eax
 005254F0    push        0
 005254F2    push        0
 005254F4    mov         eax,dword ptr [ebp-14]
 005254F7    mov         eax,dword ptr [eax+2DC];TmwCustomEdit.fUndoList:TUndoList
 005254FD    lea         ecx,[ebp-24]
 00525500    xor         edx,edx
 00525502    call        TUndoList.AddChange
>00525507    jmp         00525AAD
 0052550C    lea         edx,[ebp-4]
 0052550F    mov         eax,dword ptr [ebp-14]
 00525512    call        0051C6C8
 00525517    mov         eax,dword ptr [ebp-4]
 0052551A    mov         dword ptr [ebp-16C],eax
 00525520    cmp         dword ptr [ebp-16C],0
>00525527    je          0052553A
 00525529    mov         eax,dword ptr [ebp-16C]
 0052552F    sub         eax,4
 00525532    mov         eax,dword ptr [eax]
 00525534    mov         dword ptr [ebp-16C],eax
 0052553A    mov         ebx,dword ptr [ebp-16C]
 00525540    mov         eax,dword ptr [ebp-14]
 00525543    call        0051C628
 00525548    cmp         ebx,eax
>0052554A    jge         00525575
 0052554C    mov         eax,dword ptr [ebp-14]
 0052554F    call        0051C628
 00525554    mov         edx,eax
 00525556    sub         edx,ebx
 00525558    lea         ecx,[ebp-224]
 0052555E    mov         ax,20
 00525562    call        StringOfChar
 00525567    mov         edx,dword ptr [ebp-224]
 0052556D    lea         eax,[ebp-4]
 00525570    call        @UStrCat
 00525575    mov         eax,dword ptr [ebp-14]
 00525578    test        byte ptr [eax+3CE],40;TmwCustomEdit.fOptions:TmwEditorOptions
 0052557F    setne       al
 00525582    xor         al,1
 00525584    mov         byte ptr [ebp-25],al
 00525587    xor         eax,eax
 00525589    push        ebp
 0052558A    push        525781
 0052558F    push        dword ptr fs:[eax]
 00525592    mov         dword ptr fs:[eax],esp
 00525595    cmp         byte ptr [ebp-25],0
>00525599    je          005255A6
 0052559B    mov         eax,dword ptr [ebp-14]
 0052559E    or          word ptr [eax+3CE],40;TmwCustomEdit.fOptions:TmwEditorOptions
 005255A6    lea         edx,[ebp-24]
 005255A9    mov         eax,dword ptr [ebp-14]
 005255AC    call        0051FBB8
 005255B1    mov         eax,dword ptr [ebp-14]
 005255B4    cmp         byte ptr [eax+2A0],0;TmwCustomEdit.fInserting:Boolean
>005255BB    je          00525648
 005255C1    mov         eax,dword ptr [ebp-14]
 005255C4    call        0051C628
 005255C9    push        eax
 005255CA    lea         eax,[ebp-228]
 005255D0    movzx       edx,word ptr [ebp-18]
 005255D4    call        @UStrFromWChar
 005255D9    mov         eax,dword ptr [ebp-228]
 005255DF    lea         edx,[ebp-4]
 005255E2    pop         ecx
 005255E3    call        @UStrInsert
 005255E8    mov         eax,dword ptr [ebp-14]
 005255EB    call        0051C628
 005255F0    mov         edx,eax
 005255F2    inc         edx
 005255F3    mov         eax,dword ptr [ebp-14]
 005255F6    call        0051FB70
 005255FB    lea         edx,[ebp-22C]
 00525601    mov         eax,dword ptr [ebp-4]
 00525604    call        TrimRight
 00525609    mov         edx,dword ptr [ebp-22C]
 0052560F    mov         eax,dword ptr [ebp-14]
 00525612    call        0051FF54
 00525617    lea         edx,[ebp-18C]
 0052561D    mov         eax,dword ptr [ebp-14]
 00525620    call        0051FBB8
 00525625    lea         eax,[ebp-18C]
 0052562B    push        eax
 0052562C    push        0
 0052562E    push        0
 00525630    mov         eax,dword ptr [ebp-14]
 00525633    mov         eax,dword ptr [eax+2DC];TmwCustomEdit.fUndoList:TUndoList
 00525639    lea         ecx,[ebp-24]
 0052563C    xor         edx,edx
 0052563E    call        TUndoList.AddChange
>00525643    jmp         00525719
 00525648    mov         ebx,1
 0052564D    lea         eax,[ebp-0C]
 00525650    push        eax
 00525651    mov         eax,dword ptr [ebp-14]
 00525654    call        0051C628
 00525659    mov         edx,eax
 0052565B    mov         ecx,ebx
 0052565D    mov         eax,dword ptr [ebp-4]
 00525660    call        @UStrCopy
 00525665    mov         eax,dword ptr [ebp-14]
 00525668    call        0051C628
 0052566D    mov         esi,eax
 0052566F    lea         eax,[ebp-4]
 00525672    call        @UniqueStringU
 00525677    movzx       edx,word ptr [ebp-18]
 0052567B    mov         word ptr [eax+esi*2-2],dx
 00525680    mov         eax,dword ptr [ebp-14]
 00525683    call        0051C628
 00525688    add         ebx,eax
 0052568A    mov         dword ptr [ebp-170],ebx
 00525690    mov         eax,dword ptr [ebp-14]
 00525693    call        0051C660
 00525698    mov         dword ptr [ebp-174],eax
 0052569E    mov         eax,dword ptr [ebp-170]
 005256A4    mov         dword ptr [ebp-17C],eax
 005256AA    mov         eax,dword ptr [ebp-174]
 005256B0    mov         dword ptr [ebp-178],eax
 005256B6    mov         eax,dword ptr [ebp-17C]
 005256BC    mov         dword ptr [ebp-40],eax
 005256BF    mov         eax,dword ptr [ebp-178]
 005256C5    mov         dword ptr [ebp-3C],eax
 005256C8    lea         edx,[ebp-230]
 005256CE    mov         eax,dword ptr [ebp-4]
 005256D1    call        TrimRight
 005256D6    mov         edx,dword ptr [ebp-230]
 005256DC    mov         eax,dword ptr [ebp-14]
 005256DF    call        0051FF54
 005256E4    lea         eax,[ebp-40]
 005256E7    push        eax
 005256E8    mov         eax,dword ptr [ebp-0C]
 005256EB    call        @UStrToPWChar
 005256F0    push        eax
 005256F1    push        0
 005256F3    mov         eax,dword ptr [ebp-14]
 005256F6    mov         eax,dword ptr [eax+2DC];TmwCustomEdit.fUndoList:TUndoList
 005256FC    lea         ecx,[ebp-24]
 005256FF    xor         edx,edx
 00525701    call        TUndoList.AddChange
 00525706    mov         eax,dword ptr [ebp-14]
 00525709    call        0051C628
 0052570E    mov         edx,eax
 00525710    inc         edx
 00525711    mov         eax,dword ptr [ebp-14]
 00525714    call        0051FB70
 00525719    mov         eax,dword ptr [ebp-14]
 0052571C    call        0051C6C0
 00525721    mov         ebx,eax
 00525723    mov         eax,dword ptr [ebp-14]
 00525726    add         ebx,dword ptr [eax+290];TmwCustomEdit.fCharsInWindow:Integer
 0052572C    mov         eax,dword ptr [ebp-14]
 0052572F    call        0051C628
 00525734    cmp         ebx,eax
>00525736    jg          00525762
 00525738    mov         eax,dword ptr [ebp-14]
 0052573B    mov         edx,dword ptr [eax+290];TmwCustomEdit.fCharsInWindow:Integer
 00525741    dec         edx
 00525742    mov         eax,19
 00525747    call        0051048C
 0052574C    mov         ebx,eax
 0052574E    mov         eax,dword ptr [ebp-14]
 00525751    call        0051C6C0
 00525756    add         ebx,eax
 00525758    mov         edx,ebx
 0052575A    mov         eax,dword ptr [ebp-14]
 0052575D    call        0051FEB4
 00525762    xor         eax,eax
 00525764    pop         edx
 00525765    pop         ecx
 00525766    pop         ecx
 00525767    mov         dword ptr fs:[eax],edx
 0052576A    push        525AAD
 0052576F    cmp         byte ptr [ebp-25],0
>00525773    je          00525780
 00525775    mov         eax,dword ptr [ebp-14]
 00525778    and         word ptr [eax+3CE],0FFFFFFBF;TmwCustomEdit.fOptions:TmwEditorOptions
 00525780    ret
>00525781    jmp         @HandleFinally
>00525786    jmp         0052576F
 00525788    mov         eax,dword ptr [ebp-14]
 0052578B    mov         edx,dword ptr [eax]
 0052578D    call        dword ptr [edx+0F8];TmwCustomEdit.GetReadOnly
 00525793    test        al,al
>00525795    jne         00525AAD
 0052579B    mov         eax,dword ptr [ebp-14]
 0052579E    call        TmwCustomEdit.Undo
>005257A3    jmp         00525AAD
 005257A8    mov         eax,dword ptr [ebp-14]
 005257AB    mov         edx,dword ptr [eax]
 005257AD    call        dword ptr [edx+0F8];TmwCustomEdit.GetReadOnly
 005257B3    test        al,al
>005257B5    jne         00525AAD
 005257BB    mov         eax,dword ptr [ebp-14]
 005257BE    call        TmwCustomEdit.Redo
>005257C3    jmp         00525AAD
 005257C8    mov         eax,dword ptr [ebp-14]
 005257CB    mov         eax,dword ptr [eax+324];TmwCustomEdit.fBookMarkOpt:TmwBookMarkOpt
 005257D1    cmp         byte ptr [eax+8],0;TmwBookMarkOpt.fEnableKeys:Boolean
>005257D5    je          00525AAD
 005257DB    movzx       edx,word ptr [ebp-16]
 005257DF    sub         edx,2BD
 005257E5    mov         eax,dword ptr [ebp-14]
 005257E8    call        TmwCustomEdit.GotoBookMark
>005257ED    jmp         00525AAD
 005257F2    mov         eax,dword ptr [ebp-14]
 005257F5    mov         eax,dword ptr [eax+324];TmwCustomEdit.fBookMarkOpt:TmwBookMarkOpt
 005257FB    cmp         byte ptr [eax+8],0;TmwBookMarkOpt.fEnableKeys:Boolean
>005257FF    je          00525AAD
 00525805    movzx       ebx,word ptr [ebp-16]
 00525809    sub         ebx,2EF
 0052580F    mov         eax,dword ptr [ebp-14]
 00525812    cmp         dword ptr [eax+ebx*4+2E4],0
>0052581A    je          0052586B
 0052581C    mov         eax,dword ptr [ebp-14]
 0052581F    call        0051C660
 00525824    mov         edx,dword ptr [ebp-14]
 00525827    mov         edx,dword ptr [edx+ebx*4+2E4]
 0052582E    cmp         eax,dword ptr [edx+4]
 00525831    setne       byte ptr [ebp-26]
 00525835    mov         edx,ebx
 00525837    mov         eax,dword ptr [ebp-14]
 0052583A    call        TmwCustomEdit.ClearBookMark
 0052583F    cmp         byte ptr [ebp-26],0
>00525843    je          00525AAD
 00525849    mov         eax,dword ptr [ebp-14]
 0052584C    call        0051C660
 00525851    push        eax
 00525852    mov         eax,dword ptr [ebp-14]
 00525855    call        0051C628
 0052585A    mov         ecx,eax
 0052585C    mov         edx,ebx
 0052585E    mov         eax,dword ptr [ebp-14]
 00525861    call        TmwCustomEdit.SetBookMark
>00525866    jmp         00525AAD
 0052586B    mov         eax,dword ptr [ebp-14]
 0052586E    call        0051C660
 00525873    push        eax
 00525874    mov         eax,dword ptr [ebp-14]
 00525877    call        0051C628
 0052587C    mov         ecx,eax
 0052587E    mov         edx,ebx
 00525880    mov         eax,dword ptr [ebp-14]
 00525883    call        TmwCustomEdit.SetBookMark
>00525888    jmp         00525AAD
 0052588D    mov         eax,dword ptr [ebp-14]
 00525890    mov         edx,dword ptr [eax]
 00525892    call        dword ptr [edx+0F8];TmwCustomEdit.GetReadOnly
 00525898    test        al,al
>0052589A    jne         00525AAD
 005258A0    mov         eax,dword ptr [ebp-14]
 005258A3    call        0051C710
 005258A8    test        al,al
>005258AA    je          00525AAD
 005258B0    mov         eax,dword ptr [ebp-14]
 005258B3    call        TmwCustomEdit.CutToClipboard
>005258B8    jmp         00525AAD
 005258BD    mov         eax,dword ptr [ebp-14]
 005258C0    call        TmwCustomEdit.CopyToClipboard
>005258C5    jmp         00525AAD
 005258CA    mov         eax,dword ptr [ebp-14]
 005258CD    mov         edx,dword ptr [eax]
 005258CF    call        dword ptr [edx+0F8];TmwCustomEdit.GetReadOnly
 005258D5    test        al,al
>005258D7    jne         00525AAD
 005258DD    mov         eax,dword ptr [ebp-14]
 005258E0    call        TmwCustomEdit.PasteFromClipboard
>005258E5    jmp         00525AAD
 005258EA    mov         eax,dword ptr [ebp-14]
 005258ED    call        0051CBB4
 005258F2    mov         edx,eax
 005258F4    dec         edx
 005258F5    mov         eax,dword ptr [ebp-14]
 005258F8    call        00520F08
 005258FD    mov         eax,dword ptr [ebp-14]
 00525900    call        0051CBB4
 00525905    mov         ebx,eax
 00525907    mov         eax,dword ptr [ebp-14]
 0052590A    add         ebx,dword ptr [eax+2A8];TmwCustomEdit.fLinesInWindow:Integer
 00525910    dec         ebx
 00525911    mov         eax,dword ptr [ebp-14]
 00525914    call        0051C660
 00525919    cmp         ebx,eax
>0052591B    jge         00525939
 0052591D    mov         eax,dword ptr [ebp-14]
 00525920    call        0051CBB4
 00525925    mov         edx,eax
 00525927    mov         eax,dword ptr [ebp-14]
 0052592A    add         edx,dword ptr [eax+2A8];TmwCustomEdit.fLinesInWindow:Integer
 00525930    dec         edx
 00525931    mov         eax,dword ptr [ebp-14]
 00525934    call        0051FB94
 00525939    mov         eax,dword ptr [ebp-14]
 0052593C    mov         edx,dword ptr [eax]
 0052593E    call        dword ptr [edx+9C];TWinControl.Update
>00525944    jmp         00525AAD
 00525949    mov         eax,dword ptr [ebp-14]
 0052594C    call        0051CBB4
 00525951    mov         edx,eax
 00525953    inc         edx
 00525954    mov         eax,dword ptr [ebp-14]
 00525957    call        00520F08
 0052595C    mov         eax,dword ptr [ebp-14]
 0052595F    call        0051C660
 00525964    mov         ebx,eax
 00525966    mov         eax,dword ptr [ebp-14]
 00525969    call        0051CBB4
 0052596E    cmp         ebx,eax
>00525970    jge         00525984
 00525972    mov         eax,dword ptr [ebp-14]
 00525975    call        0051CBB4
 0052597A    mov         edx,eax
 0052597C    mov         eax,dword ptr [ebp-14]
 0052597F    call        0051FB94
 00525984    mov         eax,dword ptr [ebp-14]
 00525987    mov         edx,dword ptr [eax]
 00525989    call        dword ptr [edx+9C];TWinControl.Update
>0052598F    jmp         00525AAD
 00525994    mov         eax,dword ptr [ebp-14]
 00525997    call        0051C6C0
 0052599C    mov         edx,eax
 0052599E    dec         edx
 0052599F    mov         eax,dword ptr [ebp-14]
 005259A2    call        0051FEB4
 005259A7    mov         eax,dword ptr [ebp-14]
 005259AA    call        0051C6C0
 005259AF    mov         ebx,eax
 005259B1    mov         eax,dword ptr [ebp-14]
 005259B4    add         ebx,dword ptr [eax+290];TmwCustomEdit.fCharsInWindow:Integer
 005259BA    mov         eax,dword ptr [ebp-14]
 005259BD    call        0051C628
 005259C2    cmp         ebx,eax
>005259C4    jge         005259E1
 005259C6    mov         eax,dword ptr [ebp-14]
 005259C9    call        0051C6C0
 005259CE    mov         edx,eax
 005259D0    mov         eax,dword ptr [ebp-14]
 005259D3    add         edx,dword ptr [eax+290];TmwCustomEdit.fCharsInWindow:Integer
 005259D9    mov         eax,dword ptr [ebp-14]
 005259DC    call        0051FB70
 005259E1    mov         eax,dword ptr [ebp-14]
 005259E4    mov         edx,dword ptr [eax]
 005259E6    call        dword ptr [edx+9C];TWinControl.Update
>005259EC    jmp         00525AAD
 005259F1    mov         eax,dword ptr [ebp-14]
 005259F4    call        0051C6C0
 005259F9    mov         edx,eax
 005259FB    inc         edx
 005259FC    mov         eax,dword ptr [ebp-14]
 005259FF    call        0051FEB4
 00525A04    mov         eax,dword ptr [ebp-14]
 00525A07    call        0051C628
 00525A0C    mov         ebx,eax
 00525A0E    mov         eax,dword ptr [ebp-14]
 00525A11    call        0051C6C0
 00525A16    cmp         ebx,eax
>00525A18    jge         00525A2C
 00525A1A    mov         eax,dword ptr [ebp-14]
 00525A1D    call        0051C6C0
 00525A22    mov         edx,eax
 00525A24    mov         eax,dword ptr [ebp-14]
 00525A27    call        0051FB70
 00525A2C    mov         eax,dword ptr [ebp-14]
 00525A2F    mov         edx,dword ptr [eax]
 00525A31    call        dword ptr [edx+9C];TWinControl.Update
>00525A37    jmp         00525AAD
 00525A39    mov         dl,1
 00525A3B    mov         eax,dword ptr [ebp-14]
 00525A3E    call        TmwCustomEdit.SetInsertMode
>00525A43    jmp         00525AAD
 00525A45    xor         edx,edx
 00525A47    mov         eax,dword ptr [ebp-14]
 00525A4A    call        TmwCustomEdit.SetInsertMode
>00525A4F    jmp         00525AAD
 00525A51    mov         eax,dword ptr [ebp-14]
 00525A54    movzx       edx,byte ptr [eax+2A0];TmwCustomEdit.fInserting:Boolean
 00525A5B    xor         dl,1
 00525A5E    mov         eax,dword ptr [ebp-14]
 00525A61    call        TmwCustomEdit.SetInsertMode
>00525A66    jmp         00525AAD
 00525A68    mov         eax,dword ptr [ebp-14]
 00525A6B    mov         edx,dword ptr [eax]
 00525A6D    call        dword ptr [edx+0F8];TmwCustomEdit.GetReadOnly
 00525A73    test        al,al
>00525A75    jne         00525AAD
 00525A77    mov         eax,dword ptr [ebp-14]
 00525A7A    call        00528AD0
>00525A7F    jmp         00525AAD
 00525A81    mov         eax,dword ptr [ebp-14]
 00525A84    mov         edx,dword ptr [eax]
 00525A86    call        dword ptr [edx+0F8];TmwCustomEdit.GetReadOnly
 00525A8C    test        al,al
>00525A8E    jne         00525AAD
 00525A90    mov         eax,dword ptr [ebp-14]
 00525A93    call        00528D10
>00525A98    jmp         00525AAD
 00525A9A    movzx       eax,word ptr [ebp-16]
 00525A9E    movzx       edx,byte ptr [eax+7869D1]
 00525AA5    mov         eax,dword ptr [ebp-14]
 00525AA8    call        TmwCustomEdit.SetSelectionMode
 00525AAD    xor         eax,eax
 00525AAF    pop         edx
 00525AB0    pop         ecx
 00525AB1    pop         ecx
 00525AB2    mov         dword ptr fs:[eax],edx
 00525AB5    push        525ACA
 00525ABA    mov         eax,dword ptr [ebp-14]
 00525ABD    call        0051C458
 00525AC2    ret
>00525AC3    jmp         @HandleFinally
>00525AC8    jmp         00525ABA
 00525ACA    mov         eax,dword ptr [ebp-14]
 00525ACD    cmp         word ptr [eax+38A],0;TmwCustomEdit.?f38A:word
>00525AD5    je          00525AE9
 00525AD7    mov         ebx,dword ptr [ebp-14]
 00525ADA    mov         edx,dword ptr [ebp-14]
 00525ADD    mov         eax,dword ptr [ebx+38C];TmwCustomEdit.?f38C:dword
 00525AE3    call        dword ptr [ebx+388];TmwCustomEdit.fOnCommandDone
 00525AE9    xor         eax,eax
 00525AEB    pop         edx
 00525AEC    pop         ecx
 00525AED    pop         ecx
 00525AEE    mov         dword ptr fs:[eax],edx
 00525AF1    push        525B36
 00525AF6    lea         eax,[ebp-230]
 00525AFC    mov         edx,23
 00525B01    call        @UStrArrayClr
 00525B06    lea         eax,[ebp-19C]
 00525B0C    mov         edx,4
 00525B11    call        @UStrArrayClr
 00525B16    lea         eax,[ebp-180]
 00525B1C    call        @UStrClr
 00525B21    lea         eax,[ebp-10]
 00525B24    mov         edx,4
 00525B29    call        @UStrArrayClr
 00525B2E    ret
>00525B2F    jmp         @HandleFinally
>00525B34    jmp         00525AF6
 00525B36    pop         edi
 00525B37    pop         esi
 00525B38    pop         ebx
 00525B39    mov         esp,ebp
 00525B3B    pop         ebp
 00525B3C    ret         4
*}
end;

//00525B70
{*procedure sub_00525B70(?:?; ?:?);
begin
 00525B70    push        ebp
 00525B71    mov         ebp,esp
 00525B73    push        ebx
 00525B74    cmp         word ptr [edx],3E9
>00525B79    jae         00525B9E
 00525B7B    cmp         word ptr [eax+35A],0;TmwCustomEdit.?f35A:word
>00525B83    je          00525BBF
 00525B85    push        ecx
 00525B86    mov         ecx,dword ptr [ebp+8]
 00525B89    push        ecx
 00525B8A    mov         ecx,edx
 00525B8C    mov         ebx,eax
 00525B8E    mov         edx,eax
 00525B90    mov         eax,dword ptr [ebx+35C];TmwCustomEdit.?f35C:dword
 00525B96    call        dword ptr [ebx+358];TmwCustomEdit.fOnProcessCommand
>00525B9C    jmp         00525BBF
 00525B9E    cmp         word ptr [eax+362],0;TmwCustomEdit.?f362:word
>00525BA6    je          00525BBF
 00525BA8    push        ecx
 00525BA9    mov         ecx,dword ptr [ebp+8]
 00525BAC    push        ecx
 00525BAD    mov         ecx,edx
 00525BAF    mov         ebx,eax
 00525BB1    mov         edx,eax
 00525BB3    mov         eax,dword ptr [ebx+364];TmwCustomEdit.?f364:dword
 00525BB9    call        dword ptr [ebx+360];TmwCustomEdit.fOnProcessUserCommand
 00525BBF    pop         ebx
 00525BC0    pop         ebp
 00525BC1    ret         4
end;*}

//00525BC4
procedure TmwCustomEdit.ClearAll;
begin
{*
 00525BC4    push        esi
 00525BC5    mov         esi,eax
 00525BC7    mov         eax,dword ptr [esi+2A4];TmwCustomEdit.fLines:TStrings
 00525BCD    mov         edx,dword ptr [eax]
 00525BCF    call        dword ptr [edx+44];TStrings.Clear
 00525BD2    pop         esi
 00525BD3    ret
*}
end;

//00525BD4
{*procedure TmwCustomEdit.NextWordPos(?:?);
begin
 00525BD4    push        ebp
 00525BD5    mov         ebp,esp
 00525BD7    add         esp,0FFFFFF8C
 00525BDA    push        ebx
 00525BDB    push        esi
 00525BDC    push        edi
 00525BDD    xor         ecx,ecx
 00525BDF    mov         dword ptr [ebp-4],ecx
 00525BE2    mov         dword ptr [ebp-8],edx
 00525BE5    mov         ebx,eax
 00525BE7    xor         eax,eax
 00525BE9    push        ebp
 00525BEA    push        525D56
 00525BEF    push        dword ptr fs:[eax]
 00525BF2    mov         dword ptr fs:[eax],esp
 00525BF5    mov         eax,ebx
 00525BF7    call        0051C628
 00525BFC    mov         dword ptr [ebp-0C],eax
 00525BFF    mov         eax,ebx
 00525C01    call        0051C660
 00525C06    mov         esi,eax
 00525C08    cmp         esi,1
>00525C0B    jl          00525D29
 00525C11    mov         eax,dword ptr [ebx+2A4];TmwCustomEdit.fLines:TStrings
 00525C17    mov         edx,dword ptr [eax]
 00525C19    call        dword ptr [edx+14];TStrings.GetCount
 00525C1C    cmp         esi,eax
>00525C1E    jg          00525D29
 00525C24    lea         ecx,[ebp-4]
 00525C27    mov         edx,esi
 00525C29    dec         edx
 00525C2A    mov         eax,dword ptr [ebx+2A4];TmwCustomEdit.fLines:TStrings
 00525C30    mov         edi,dword ptr [eax]
 00525C32    call        dword ptr [edi+0C];TStrings.Get
 00525C35    mov         edi,dword ptr [ebx+2D4];TmwCustomEdit.fHighLighter:TmwCustomHighLighter
 00525C3B    test        edi,edi
>00525C3D    je          00525C4B
 00525C3F    lea         edx,[ebp-34]
 00525C42    mov         eax,edi
 00525C44    mov         ecx,dword ptr [eax]
 00525C46    call        dword ptr [ecx+34];TmwCustomHighLighter.sub_00514738
>00525C49    jmp         00525C5C
 00525C4B    push        esi
 00525C4C    mov         esi,525D64
 00525C51    lea         edi,[ebp-34]
 00525C54    mov         ecx,8
 00525C59    rep movs    dword ptr [edi],dword ptr [esi]
 00525C5B    pop         esi
 00525C5C    push        esi
 00525C5D    mov         esi,525D84
 00525C62    lea         edi,[ebp-74]
 00525C65    mov         ecx,8
 00525C6A    rep movs    dword ptr [edi],dword ptr [esi]
 00525C6C    pop         esi
 00525C6D    lea         eax,[ebp-74]
 00525C70    lea         edx,[ebp-34]
 00525C73    mov         cl,20
 00525C75    call        @SetSub
 00525C7A    push        esi
 00525C7B    lea         esi,[ebp-74]
 00525C7E    lea         edi,[ebp-54]
 00525C81    mov         ecx,8
 00525C86    rep movs    dword ptr [edi],dword ptr [esi]
 00525C88    pop         esi
 00525C89    mov         eax,dword ptr [ebp-4]
 00525C8C    test        eax,eax
>00525C8E    je          00525C95
 00525C90    sub         eax,4
 00525C93    mov         eax,dword ptr [eax]
 00525C95    mov         edi,eax
 00525C97    cmp         edi,dword ptr [ebp-0C]
>00525C9A    jg          00525CDD
 00525C9C    mov         eax,dword ptr [ebx+2A4];TmwCustomEdit.fLines:TStrings
 00525CA2    mov         edx,dword ptr [eax]
 00525CA4    call        dword ptr [edx+14];TStrings.GetCount
 00525CA7    cmp         esi,eax
>00525CA9    jge         00525D29
 00525CAB    lea         ecx,[ebp-4]
 00525CAE    mov         edx,esi
 00525CB0    mov         eax,dword ptr [ebx+2A4];TmwCustomEdit.fLines:TStrings
 00525CB6    mov         ebx,dword ptr [eax]
 00525CB8    call        dword ptr [ebx+0C];TStrings.Get
 00525CBB    inc         esi
 00525CBC    lea         ecx,[ebp-34]
 00525CBF    mov         edx,1
 00525CC4    mov         eax,dword ptr [ebp-4]
 00525CC7    call        00510774
 00525CCC    mov         edx,eax
 00525CCE    mov         eax,1
 00525CD3    call        00510484
 00525CD8    mov         dword ptr [ebp-0C],eax
>00525CDB    jmp         00525D29
 00525CDD    mov         eax,dword ptr [ebp-4]
 00525CE0    mov         edx,dword ptr [ebp-0C]
 00525CE3    movzx       eax,word ptr [eax+edx*2-2]
 00525CE8    cmp         ax,0FF
>00525CEC    ja          00525CF5
 00525CEE    movzx       eax,ax
 00525CF1    bt          dword ptr [ebp-34],eax
>00525CF5    jae         00525D08
 00525CF7    lea         ecx,[ebp-54]
 00525CFA    mov         edx,dword ptr [ebp-0C]
 00525CFD    mov         eax,dword ptr [ebp-4]
 00525D00    call        00510774
 00525D05    mov         dword ptr [ebp-0C],eax
 00525D08    cmp         dword ptr [ebp-0C],0
>00525D0C    jle         00525D1F
 00525D0E    lea         ecx,[ebp-34]
 00525D11    mov         edx,dword ptr [ebp-0C]
 00525D14    mov         eax,dword ptr [ebp-4]
 00525D17    call        00510774
 00525D1C    mov         dword ptr [ebp-0C],eax
 00525D1F    cmp         dword ptr [ebp-0C],0
>00525D23    jne         00525D29
 00525D25    inc         edi
 00525D26    mov         dword ptr [ebp-0C],edi
 00525D29    mov         eax,dword ptr [ebp-0C]
 00525D2C    mov         dword ptr [ebp-14],eax
 00525D2F    mov         dword ptr [ebp-10],esi
 00525D32    mov         eax,dword ptr [ebp-8]
 00525D35    mov         edx,dword ptr [ebp-14]
 00525D38    mov         dword ptr [eax],edx
 00525D3A    mov         edx,dword ptr [ebp-10]
 00525D3D    mov         dword ptr [eax+4],edx
 00525D40    xor         eax,eax
 00525D42    pop         edx
 00525D43    pop         ecx
 00525D44    pop         ecx
 00525D45    mov         dword ptr fs:[eax],edx
 00525D48    push        525D5D
 00525D4D    lea         eax,[ebp-4]
 00525D50    call        @UStrClr
 00525D55    ret
>00525D56    jmp         @HandleFinally
>00525D5B    jmp         00525D4D
 00525D5D    pop         edi
 00525D5E    pop         esi
 00525D5F    pop         ebx
 00525D60    mov         esp,ebp
 00525D62    pop         ebp
 00525D63    ret
end;*}

//00525DA4
{*procedure TmwCustomEdit.PrevWordPos(?:?);
begin
 00525DA4    push        ebp
 00525DA5    mov         ebp,esp
 00525DA7    add         esp,0FFFFFF8C
 00525DAA    push        ebx
 00525DAB    push        esi
 00525DAC    push        edi
 00525DAD    xor         ecx,ecx
 00525DAF    mov         dword ptr [ebp-4],ecx
 00525DB2    mov         dword ptr [ebp-8],edx
 00525DB5    mov         ebx,eax
 00525DB7    xor         eax,eax
 00525DB9    push        ebp
 00525DBA    push        525F41
 00525DBF    push        dword ptr fs:[eax]
 00525DC2    mov         dword ptr fs:[eax],esp
 00525DC5    mov         eax,ebx
 00525DC7    call        0051C628
 00525DCC    mov         dword ptr [ebp-0C],eax
 00525DCF    mov         eax,ebx
 00525DD1    call        0051C660
 00525DD6    mov         esi,eax
 00525DD8    cmp         esi,1
>00525DDB    jl          00525F14
 00525DE1    mov         eax,dword ptr [ebx+2A4];TmwCustomEdit.fLines:TStrings
 00525DE7    mov         edx,dword ptr [eax]
 00525DE9    call        dword ptr [edx+14];TStrings.GetCount
 00525DEC    cmp         esi,eax
>00525DEE    jg          00525F14
 00525DF4    lea         ecx,[ebp-4]
 00525DF7    mov         edx,esi
 00525DF9    dec         edx
 00525DFA    mov         eax,dword ptr [ebx+2A4];TmwCustomEdit.fLines:TStrings
 00525E00    mov         edi,dword ptr [eax]
 00525E02    call        dword ptr [edi+0C];TStrings.Get
 00525E05    mov         eax,dword ptr [ebp-4]
 00525E08    test        eax,eax
>00525E0A    je          00525E11
 00525E0C    sub         eax,4
 00525E0F    mov         eax,dword ptr [eax]
 00525E11    lea         edx,[eax+1]
 00525E14    mov         eax,dword ptr [ebp-0C]
 00525E17    call        0051048C
 00525E1C    mov         dword ptr [ebp-0C],eax
 00525E1F    mov         edi,dword ptr [ebx+2D4];TmwCustomEdit.fHighLighter:TmwCustomHighLighter
 00525E25    test        edi,edi
>00525E27    je          00525E35
 00525E29    lea         edx,[ebp-34]
 00525E2C    mov         eax,edi
 00525E2E    mov         ecx,dword ptr [eax]
 00525E30    call        dword ptr [ecx+34];TmwCustomHighLighter.sub_00514738
>00525E33    jmp         00525E46
 00525E35    push        esi
 00525E36    mov         esi,525F50
 00525E3B    lea         edi,[ebp-34]
 00525E3E    mov         ecx,8
 00525E43    rep movs    dword ptr [edi],dword ptr [esi]
 00525E45    pop         esi
 00525E46    push        esi
 00525E47    mov         esi,525F70
 00525E4C    lea         edi,[ebp-74]
 00525E4F    mov         ecx,8
 00525E54    rep movs    dword ptr [edi],dword ptr [esi]
 00525E56    pop         esi
 00525E57    lea         eax,[ebp-74]
 00525E5A    lea         edx,[ebp-34]
 00525E5D    mov         cl,20
 00525E5F    call        @SetSub
 00525E64    push        esi
 00525E65    lea         esi,[ebp-74]
 00525E68    lea         edi,[ebp-54]
 00525E6B    mov         ecx,8
 00525E70    rep movs    dword ptr [edi],dword ptr [esi]
 00525E72    pop         esi
 00525E73    cmp         dword ptr [ebp-0C],1
>00525E77    jg          00525EA6
 00525E79    cmp         esi,1
>00525E7C    jle         00525F14
 00525E82    dec         esi
 00525E83    lea         ecx,[ebp-4]
 00525E86    mov         edx,esi
 00525E88    dec         edx
 00525E89    mov         eax,dword ptr [ebx+2A4];TmwCustomEdit.fLines:TStrings
 00525E8F    mov         ebx,dword ptr [eax]
 00525E91    call        dword ptr [ebx+0C];TStrings.Get
 00525E94    mov         eax,dword ptr [ebp-4]
 00525E97    test        eax,eax
>00525E99    je          00525EA0
 00525E9B    sub         eax,4
 00525E9E    mov         eax,dword ptr [eax]
 00525EA0    inc         eax
 00525EA1    mov         dword ptr [ebp-0C],eax
>00525EA4    jmp         00525F14
 00525EA6    mov         eax,dword ptr [ebp-4]
 00525EA9    mov         edx,dword ptr [ebp-0C]
 00525EAC    movzx       eax,word ptr [eax+edx*2-4]
 00525EB1    cmp         ax,0FF
>00525EB5    ja          00525EBE
 00525EB7    movzx       eax,ax
 00525EBA    bt          dword ptr [ebp-54],eax
>00525EBE    jae         00525ED2
 00525EC0    mov         edx,dword ptr [ebp-0C]
 00525EC3    dec         edx
 00525EC4    lea         ecx,[ebp-34]
 00525EC7    mov         eax,dword ptr [ebp-4]
 00525ECA    call        005107C8
 00525ECF    mov         dword ptr [ebp-0C],eax
 00525ED2    cmp         dword ptr [ebp-0C],0
>00525ED6    jle         00525EED
 00525ED8    mov         edx,dword ptr [ebp-0C]
 00525EDB    dec         edx
 00525EDC    lea         ecx,[ebp-54]
 00525EDF    mov         eax,dword ptr [ebp-4]
 00525EE2    call        005107C8
 00525EE7    inc         eax
 00525EE8    mov         dword ptr [ebp-0C],eax
>00525EEB    jmp         00525F14
 00525EED    cmp         esi,1
>00525EF0    jle         00525F14
 00525EF2    dec         esi
 00525EF3    lea         ecx,[ebp-4]
 00525EF6    mov         edx,esi
 00525EF8    dec         edx
 00525EF9    mov         eax,dword ptr [ebx+2A4];TmwCustomEdit.fLines:TStrings
 00525EFF    mov         ebx,dword ptr [eax]
 00525F01    call        dword ptr [ebx+0C];TStrings.Get
 00525F04    mov         eax,dword ptr [ebp-4]
 00525F07    test        eax,eax
>00525F09    je          00525F10
 00525F0B    sub         eax,4
 00525F0E    mov         eax,dword ptr [eax]
 00525F10    inc         eax
 00525F11    mov         dword ptr [ebp-0C],eax
 00525F14    mov         eax,dword ptr [ebp-0C]
 00525F17    mov         dword ptr [ebp-14],eax
 00525F1A    mov         dword ptr [ebp-10],esi
 00525F1D    mov         eax,dword ptr [ebp-8]
 00525F20    mov         edx,dword ptr [ebp-14]
 00525F23    mov         dword ptr [eax],edx
 00525F25    mov         edx,dword ptr [ebp-10]
 00525F28    mov         dword ptr [eax+4],edx
 00525F2B    xor         eax,eax
 00525F2D    pop         edx
 00525F2E    pop         ecx
 00525F2F    pop         ecx
 00525F30    mov         dword ptr fs:[eax],edx
 00525F33    push        525F48
 00525F38    lea         eax,[ebp-4]
 00525F3B    call        @UStrClr
 00525F40    ret
>00525F41    jmp         @HandleFinally
>00525F46    jmp         00525F38
 00525F48    pop         edi
 00525F49    pop         esi
 00525F4A    pop         ebx
 00525F4B    mov         esp,ebp
 00525F4D    pop         ebp
 00525F4E    ret
end;*}

//00525F90
procedure TmwCustomEdit.SetSelectionMode(Value:TSelectionMode);
begin
{*
 00525F90    push        ebx
 00525F91    mov         ebx,eax
 00525F93    cmp         dl,byte ptr [ebx+390];TmwCustomEdit.fSelectionMode:TSelectionMode
>00525F99    je          00525FC4
 00525F9B    mov         byte ptr [ebx+390],dl;TmwCustomEdit.fSelectionMode:TSelectionMode
 00525FA1    mov         eax,ebx
 00525FA3    call        0051C710
 00525FA8    test        al,al
>00525FAA    je          00525FB6
 00525FAC    mov         eax,ebx
 00525FAE    mov         edx,dword ptr [eax]
 00525FB0    call        dword ptr [edx+90];TWinControl.Invalidate
 00525FB6    movzx       edx,byte ptr ds:[525FC8];0x80 gvar_00525FC8
 00525FBD    mov         eax,ebx
 00525FBF    call        005287FC
 00525FC4    pop         ebx
 00525FC5    ret
*}
end;

//00525FCC
procedure TmwCustomEdit.BeginUpdate;
begin
{*
 00525FCC    call        0051CBE4
 00525FD1    ret
*}
end;

//00525FD4
procedure TmwCustomEdit.EndUpdate;
begin
{*
 00525FD4    call        0051C458
 00525FD9    ret
*}
end;

//00525FDC
{*procedure sub_00525FDC(?:?; ?:?; ?:?);
begin
 00525FDC    push        ebp
 00525FDD    mov         ebp,esp
 00525FDF    add         esp,0FFFFFFE0
 00525FE2    push        ebx
 00525FE3    push        esi
 00525FE4    push        edi
 00525FE5    xor         ecx,ecx
 00525FE7    mov         dword ptr [ebp-20],ecx
 00525FEA    mov         dword ptr [ebp-18],ecx
 00525FED    mov         dword ptr [ebp-1C],ecx
 00525FF0    mov         dword ptr [ebp-8],ecx
 00525FF3    mov         dword ptr [ebp-0C],edx
 00525FF6    mov         dword ptr [ebp-4],eax
 00525FF9    mov         eax,dword ptr [ebp-4]
 00525FFC    call        @UStrAddRef
 00526001    xor         eax,eax
 00526003    push        ebp
 00526004    push        52622D
 00526009    push        dword ptr fs:[eax]
 0052600C    mov         dword ptr fs:[eax],esp
 0052600F    mov         esi,1
 00526014    mov         eax,dword ptr [ebp-0C]
 00526017    call        @UStrClr
>0052601C    jmp         005261F5
 00526021    mov         eax,dword ptr [ebp-4]
 00526024    cmp         word ptr [eax+esi*2-2],24
>0052602A    jne         005261D6
 00526030    lea         eax,[esi+1]
 00526033    mov         dword ptr [ebp-10],eax
 00526036    mov         eax,dword ptr [ebp-4]
 00526039    mov         dword ptr [ebp-14],eax
 0052603C    cmp         dword ptr [ebp-14],0
>00526040    je          0052604D
 00526042    mov         eax,dword ptr [ebp-14]
 00526045    sub         eax,4
 00526048    mov         eax,dword ptr [eax]
 0052604A    mov         dword ptr [ebp-14],eax
 0052604D    mov         ebx,dword ptr [ebp-10]
 00526050    mov         edi,dword ptr [ebp-14]
 00526053    sub         edi,ebx
>00526055    jl          00526067
 00526057    inc         edi
 00526058    mov         eax,dword ptr [ebp-4]
 0052605B    cmp         word ptr [eax+ebx*2-2],24
>00526061    je          00526067
 00526063    inc         ebx
 00526064    dec         edi
>00526065    jne         00526058
 00526067    lea         eax,[esi+1]
 0052606A    cmp         ebx,eax
>0052606C    jne         0052607D
 0052606E    lea         eax,[ebp-8]
 00526071    mov         edx,526248;'$'
 00526076    call        @UStrLAsg
>0052607B    jmp         00526091
 0052607D    lea         eax,[ebp-8]
 00526080    push        eax
 00526081    mov         ecx,ebx
 00526083    sub         ecx,esi
 00526085    dec         ecx
 00526086    lea         edx,[esi+1]
 00526089    mov         eax,dword ptr [ebp-4]
 0052608C    call        @UStrCopy
 00526091    lea         edx,[ebp-1C]
 00526094    mov         eax,dword ptr [ebp-8]
 00526097    call        Trim
 0052609C    mov         eax,dword ptr [ebp-1C]
 0052609F    lea         edx,[ebp-18]
 005260A2    call        UpperCase
 005260A7    mov         edx,dword ptr [ebp-18]
 005260AA    lea         eax,[ebp-8]
 005260AD    call        @UStrLAsg
 005260B2    mov         eax,dword ptr [ebp-8]
 005260B5    mov         edx,526258;'PAGENUM'
 005260BA    call        @UStrEqual
>005260BF    jne         005260DA
 005260C1    lea         edx,[ebp-8]
 005260C4    mov         eax,dword ptr [ebp+8]
 005260C7    mov         eax,dword ptr [eax+10]
 005260CA    mov         eax,dword ptr [eax+18]
 005260CD    mov         eax,dword ptr [eax-4]
 005260D0    call        IntToStr
>005260D5    jmp         005261C3
 005260DA    mov         eax,dword ptr [ebp-8]
 005260DD    mov         edx,526274;'TITLE'
 005260E2    call        @UStrEqual
>005260E7    jne         00526102
 005260E9    lea         eax,[ebp-8]
 005260EC    mov         edx,dword ptr [ebp+8]
 005260EF    mov         edx,dword ptr [edx+10]
 005260F2    mov         edx,dword ptr [edx+18]
 005260F5    mov         edx,dword ptr [edx-10]
 005260F8    call        @UStrLAsg
>005260FD    jmp         005261C3
 00526102    mov         eax,dword ptr [ebp-8]
 00526105    mov         edx,52628C;'TIME'
 0052610A    call        @UStrEqual
>0052610F    jne         0052612A
 00526111    lea         eax,[ebp-8]
 00526114    mov         edx,dword ptr [ebp+8]
 00526117    mov         edx,dword ptr [edx+10]
 0052611A    mov         edx,dword ptr [edx+18]
 0052611D    mov         edx,dword ptr [edx-40]
 00526120    call        @UStrLAsg
>00526125    jmp         005261C3
 0052612A    mov         eax,dword ptr [ebp-8]
 0052612D    mov         edx,5262A4;'DATE'
 00526132    call        @UStrEqual
>00526137    jne         0052614F
 00526139    lea         eax,[ebp-8]
 0052613C    mov         edx,dword ptr [ebp+8]
 0052613F    mov         edx,dword ptr [edx+10]
 00526142    mov         edx,dword ptr [edx+18]
 00526145    mov         edx,dword ptr [edx-44]
 00526148    call        @UStrLAsg
>0052614D    jmp         005261C3
 0052614F    mov         eax,dword ptr [ebp-8]
 00526152    mov         edx,5262BC;'DATETIME'
 00526157    call        @UStrEqual
>0052615C    jne         0052618A
 0052615E    mov         eax,dword ptr [ebp+8]
 00526161    mov         eax,dword ptr [eax+10]
 00526164    mov         eax,dword ptr [eax+18]
 00526167    push        dword ptr [eax-44]
 0052616A    push        5262DC;' '
 0052616F    mov         eax,dword ptr [ebp+8]
 00526172    mov         eax,dword ptr [eax+10]
 00526175    mov         eax,dword ptr [eax+18]
 00526178    push        dword ptr [eax-40]
 0052617B    lea         eax,[ebp-8]
 0052617E    mov         edx,3
 00526183    call        @UStrCatN
>00526188    jmp         005261C3
 0052618A    mov         eax,dword ptr [ebp-8]
 0052618D    mov         edx,5262EC;'TIMEDATE'
 00526192    call        @UStrEqual
>00526197    jne         005261C3
 00526199    mov         eax,dword ptr [ebp+8]
 0052619C    mov         eax,dword ptr [eax+10]
 0052619F    mov         eax,dword ptr [eax+18]
 005261A2    push        dword ptr [eax-40]
 005261A5    push        5262DC;' '
 005261AA    mov         eax,dword ptr [ebp+8]
 005261AD    mov         eax,dword ptr [eax+10]
 005261B0    mov         eax,dword ptr [eax+18]
 005261B3    push        dword ptr [eax-44]
 005261B6    lea         eax,[ebp-8]
 005261B9    mov         edx,3
 005261BE    call        @UStrCatN
 005261C3    mov         eax,dword ptr [ebp-0C]
 005261C6    mov         edx,dword ptr [ebp-8]
 005261C9    call        @UStrCat
 005261CE    mov         eax,dword ptr [ebp-0C]
 005261D1    lea         esi,[ebx+1]
>005261D4    jmp         005261F5
 005261D6    lea         eax,[ebp-20]
 005261D9    mov         edx,dword ptr [ebp-4]
 005261DC    movzx       edx,word ptr [edx+esi*2-2]
 005261E1    call        @UStrFromWChar
 005261E6    mov         edx,dword ptr [ebp-20]
 005261E9    mov         eax,dword ptr [ebp-0C]
 005261EC    call        @UStrCat
 005261F1    mov         eax,dword ptr [ebp-0C]
 005261F4    inc         esi
 005261F5    mov         eax,dword ptr [ebp-4]
 005261F8    call        @UStrLen
 005261FD    cmp         esi,eax
>005261FF    jle         00526021
 00526205    xor         eax,eax
 00526207    pop         edx
 00526208    pop         ecx
 00526209    pop         ecx
 0052620A    mov         dword ptr fs:[eax],edx
 0052620D    push        526234
 00526212    lea         eax,[ebp-20]
 00526215    mov         edx,3
 0052621A    call        @UStrArrayClr
 0052621F    lea         eax,[ebp-8]
 00526222    mov         edx,2
 00526227    call        @UStrArrayClr
 0052622C    ret
>0052622D    jmp         @HandleFinally
>00526232    jmp         00526212
 00526234    pop         edi
 00526235    pop         esi
 00526236    pop         ebx
 00526237    mov         esp,ebp
 00526239    pop         ebp
 0052623A    ret
end;*}

//00526300
{*procedure sub_00526300(?:?; ?:?; ?:?; ?:?; ?:?);
begin
 00526300    push        ebp
 00526301    mov         ebp,esp
 00526303    add         esp,0FFFFFFD0
 00526306    push        ebx
 00526307    push        esi
 00526308    push        edi
 00526309    xor         ebx,ebx
 0052630B    mov         dword ptr [ebp-2C],ebx
 0052630E    mov         dword ptr [ebp-30],ebx
 00526311    mov         dword ptr [ebp-4],ebx
 00526314    mov         esi,ecx
 00526316    mov         dword ptr [ebp-0C],edx
 00526319    mov         dword ptr [ebp-8],eax
 0052631C    xor         eax,eax
 0052631E    push        ebp
 0052631F    push        52646E
 00526324    push        dword ptr fs:[eax]
 00526327    mov         dword ptr fs:[eax],esp
 0052632A    cmp         dword ptr [ebp-8],0
>0052632E    je          0052644B
 00526334    mov         eax,dword ptr [ebp-8]
 00526337    mov         edx,dword ptr [eax]
 00526339    call        dword ptr [edx+14]
 0052633C    test        eax,eax
>0052633E    jle         0052644B
 00526344    mov         eax,dword ptr [ebp-8]
 00526347    mov         edx,dword ptr [eax]
 00526349    call        dword ptr [edx+14]
 0052634C    dec         eax
 0052634D    test        eax,eax
>0052634F    jl          0052644B
 00526355    inc         eax
 00526356    mov         dword ptr [ebp-18],eax
 00526359    mov         dword ptr [ebp-10],0
 00526360    mov         eax,dword ptr [esi]
 00526362    add         eax,dword ptr [ebp+0C]
 00526365    push        eax
 00526366    lea         eax,[ebp-28]
 00526369    push        eax
 0052636A    call        Printer
 0052636F    call        TPrinter.GetPageWidth
 00526374    mov         ecx,eax
 00526376    mov         eax,dword ptr [ebp+10]
 00526379    sub         ecx,dword ptr [eax-8]
 0052637C    mov         edx,dword ptr [esi]
 0052637E    xor         eax,eax
 00526380    call        Rect
 00526385    push        ebp
 00526386    lea         ecx,[ebp-30]
 00526389    mov         edx,dword ptr [ebp-10]
 0052638C    mov         eax,dword ptr [ebp-8]
 0052638F    mov         ebx,dword ptr [eax]
 00526391    call        dword ptr [ebx+0C]
 00526394    mov         eax,dword ptr [ebp-30]
 00526397    lea         edx,[ebp-2C]
 0052639A    call        00525FDC
 0052639F    pop         ecx
 005263A0    mov         edx,dword ptr [ebp-2C]
 005263A3    lea         eax,[ebp-4]
 005263A6    call        @UStrLAsg
 005263AB    call        Printer
 005263B0    call        TPrinter.GetCanvas
 005263B5    mov         edx,dword ptr [ebp-4]
 005263B8    call        TCustomCanvas.TextWidth
 005263BD    mov         ebx,eax
 005263BF    mov         edx,dword ptr [ebp-10]
 005263C2    mov         eax,dword ptr [ebp-8]
 005263C5    mov         ecx,dword ptr [eax]
 005263C7    call        dword ptr [ecx+18]
 005263CA    mov         edx,dword ptr [ebp-0C]
 005263CD    mov         dword ptr [ebp-14],edx
 005263D0    dec         al
>005263D2    je          005263DA
 005263D4    dec         al
>005263D6    je          005263E7
>005263D8    jmp         005263F9
 005263DA    mov         eax,dword ptr [ebp-20]
 005263DD    sub         eax,dword ptr [ebp-0C]
 005263E0    sub         eax,ebx
 005263E2    add         dword ptr [ebp-14],eax
>005263E5    jmp         005263F9
 005263E7    mov         eax,dword ptr [ebp-20]
 005263EA    sub         eax,dword ptr [ebp-0C]
 005263ED    sub         eax,ebx
 005263EF    sar         eax,1
>005263F1    jns         005263F6
 005263F3    adc         eax,0
 005263F6    add         dword ptr [ebp-14],eax
 005263F9    call        Printer
 005263FE    call        TPrinter.GetCanvas
 00526403    call        TCanvas.GetHandle
 00526408    mov         edi,eax
 0052640A    mov         ebx,dword ptr [ebp-4]
 0052640D    test        ebx,ebx
>0052640F    je          00526416
 00526411    sub         ebx,4
 00526414    mov         ebx,dword ptr [ebx]
 00526416    mov         eax,dword ptr [ebp+10]
 00526419    mov         eax,dword ptr [eax-14]
 0052641C    push        eax
 0052641D    push        ebx
 0052641E    mov         eax,dword ptr [ebp-4]
 00526421    call        @UStrToPWChar
 00526426    push        eax
 00526427    lea         eax,[ebp-28]
 0052642A    push        eax
 0052642B    push        4
 0052642D    mov         eax,dword ptr [esi]
 0052642F    push        eax
 00526430    mov         eax,dword ptr [ebp-14]
 00526433    push        eax
 00526434    push        edi
 00526435    call        gdi32.ExtTextOutW
 0052643A    mov         eax,dword ptr [ebp+0C]
 0052643D    add         dword ptr [esi],eax
 0052643F    inc         dword ptr [ebp-10]
 00526442    dec         dword ptr [ebp-18]
>00526445    jne         00526360
 0052644B    xor         eax,eax
 0052644D    pop         edx
 0052644E    pop         ecx
 0052644F    pop         ecx
 00526450    mov         dword ptr fs:[eax],edx
 00526453    push        526475
 00526458    lea         eax,[ebp-30]
 0052645B    mov         edx,2
 00526460    call        @UStrArrayClr
 00526465    lea         eax,[ebp-4]
 00526468    call        @UStrClr
 0052646D    ret
>0052646E    jmp         @HandleFinally
>00526473    jmp         00526458
 00526475    pop         edi
 00526476    pop         esi
 00526477    pop         ebx
 00526478    mov         esp,ebp
 0052647A    pop         ebp
 0052647B    ret         8
end;*}

//00526480
{*function sub_00526480(?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?):?;
begin
 00526480    push        ebp
 00526481    mov         ebp,esp
 00526483    add         esp,0FFFFFF34
 00526489    push        ebx
 0052648A    push        esi
 0052648B    push        edi
 0052648C    xor         ebx,ebx
 0052648E    mov         dword ptr [ebp-0CC],ebx
 00526494    mov         dword ptr [ebp-0C8],ebx
 0052649A    mov         dword ptr [ebp-0C0],ebx
 005264A0    mov         dword ptr [ebp-18],ebx
 005264A3    mov         esi,edx
 005264A5    lea         edi,[ebp-10]
 005264A8    movs        dword ptr [edi],dword ptr [esi]
 005264A9    movs        dword ptr [edi],dword ptr [esi]
 005264AA    movs        dword ptr [edi],dword ptr [esi]
 005264AB    movs        dword ptr [edi],dword ptr [esi]
 005264AC    mov         dword ptr [ebp-20],ecx
 005264AF    mov         byte ptr [ebp-19],al
 005264B2    xor         eax,eax
 005264B4    push        ebp
 005264B5    push        526C1D
 005264BA    push        dword ptr fs:[eax]
 005264BD    mov         dword ptr fs:[eax],esp
 005264C0    mov         byte ptr [ebp-21],0
 005264C4    mov         eax,dword ptr [ebp+18]
 005264C7    mov         dword ptr [eax-4],1
 005264CE    cmp         byte ptr [ebp-19],0
>005264D2    je          0052658C
 005264D8    call        Printer
 005264DD    call        TPrinter.GetCanvas
 005264E2    mov         eax,dword ptr [eax+40];TCanvas.FFont:TFont
 005264E5    mov         dword ptr [ebp-60],eax
 005264E8    mov         eax,dword ptr [ebp-60]
 005264EB    mov         eax,dword ptr [eax+10];TFont.FResource:PResource
 005264EE    movzx       eax,byte ptr [eax+21]
 005264F2    mov         byte ptr [ebp-61],al
 005264F5    movzx       eax,byte ptr [ebp-61]
 005264F9    mov         byte ptr [ebp-3D],al
 005264FC    xor         eax,eax
 005264FE    push        ebp
 005264FF    push        526585
 00526504    push        dword ptr fs:[eax]
 00526507    mov         dword ptr fs:[eax],esp
 0052650A    call        Printer
 0052650F    call        TPrinter.GetCanvas
 00526514    mov         eax,dword ptr [eax+40];TCanvas.FFont:TFont
 00526517    mov         dword ptr [ebp-68],eax
 0052651A    mov         eax,dword ptr [ebp-68]
 0052651D    mov         eax,dword ptr [eax+10];TFont.FResource:PResource
 00526520    movzx       eax,byte ptr [eax+21]
 00526524    mov         byte ptr [ebp-69],al
 00526527    call        Printer
 0052652C    call        TPrinter.GetCanvas
 00526531    mov         eax,dword ptr [eax+40];TCanvas.FFont:TFont
 00526534    push        eax
 00526535    movzx       edx,byte ptr ds:[526C34];0x3 gvar_00526C34
 0052653C    or          dl,byte ptr [ebp-69]
 0052653F    pop         eax
 00526540    call        TFont.SetStyle
 00526545    lea         eax,[ebp-0AC]
 0052654B    push        eax
 0052654C    call        Printer
 00526551    call        TPrinter.GetCanvas
 00526556    call        TCanvas.GetHandle
 0052655B    push        eax
 0052655C    call        gdi32.GetTextMetricsW
 00526561    xor         eax,eax
 00526563    pop         edx
 00526564    pop         ecx
 00526565    pop         ecx
 00526566    mov         dword ptr fs:[eax],edx
 00526569    push        5265A8
 0052656E    call        Printer
 00526573    call        TPrinter.GetCanvas
 00526578    mov         eax,dword ptr [eax+40];TCanvas.FFont:TFont
 0052657B    movzx       edx,byte ptr [ebp-3D]
 0052657F    call        TFont.SetStyle
 00526584    ret
>00526585    jmp         @HandleFinally
>0052658A    jmp         0052656E
 0052658C    lea         eax,[ebp-0AC]
 00526592    push        eax
 00526593    call        Printer
 00526598    call        TPrinter.GetCanvas
 0052659D    call        TCanvas.GetHandle
 005265A2    push        eax
 005265A3    call        gdi32.GetTextMetricsW
 005265A8    mov         eax,dword ptr [ebp-98]
 005265AE    mov         dword ptr [ebp-38],eax
 005265B1    mov         eax,dword ptr [ebp-0AC]
 005265B7    add         eax,dword ptr [ebp-9C]
 005265BD    mov         edx,dword ptr [ebp+18]
 005265C0    mov         edx,dword ptr [edx-48]
 005265C3    add         eax,dword ptr [edx+380]
 005265C9    mov         dword ptr [ebp-3C],eax
 005265CC    call        Printer
 005265D1    call        TPrinter.GetCanvas
 005265D6    mov         eax,dword ptr [eax+48];TCanvas.FBrush:TBrush
 005265D9    mov         eax,dword ptr [eax+10];TBrush.FResource:PResource
 005265DC    mov         eax,dword ptr [eax+18]
 005265DF    mov         dword ptr [ebp-70],eax
 005265E2    mov         eax,dword ptr [ebp-70]
 005265E5    mov         dword ptr [ebp-4C],eax
 005265E8    mov         dl,1
 005265EA    mov         eax,[0045FAE8];TFont
 005265EF    call        TFont.Create;TFont.Create
 005265F4    mov         dword ptr [ebp-50],eax
 005265F7    call        Printer
 005265FC    call        TPrinter.GetCanvas
 00526601    mov         edx,dword ptr [eax+40];TCanvas.FFont:TFont
 00526604    mov         eax,dword ptr [ebp-50]
 00526607    mov         ecx,dword ptr [eax]
 00526609    call        dword ptr [ecx+8];TFont.Assign
 0052660C    mov         eax,dword ptr [ebp+18]
 0052660F    mov         eax,dword ptr [eax-48]
 00526612    mov         eax,dword ptr [eax+2B0]
 00526618    mov         edx,dword ptr [ebp-38]
 0052661B    call        005104B0
 00526620    mov         dword ptr [ebp-14],eax
 00526623    xor         edx,edx
 00526625    push        ebp
 00526626    push        526BE1
 0052662B    push        dword ptr fs:[edx]
 0052662E    mov         dword ptr fs:[edx],esp
 00526631    mov         eax,dword ptr [ebp-0C]
 00526634    mov         dword ptr [ebp-30],eax
 00526637    mov         byte ptr [ebp-51],0
 0052663B    lea         eax,[ebp-51]
 0052663E    push        eax
 0052663F    mov         eax,dword ptr [ebp+18]
 00526642    mov         ecx,dword ptr [eax-4]
 00526645    mov         eax,dword ptr [ebp+18]
 00526648    mov         eax,dword ptr [eax-48]
 0052664B    mov         dl,1
 0052664D    mov         ebx,dword ptr [eax]
 0052664F    call        dword ptr [ebx+104]
 00526655    cmp         byte ptr [ebp-51],0
>00526659    je          0052666F
 0052665B    call        Printer
 00526660    call        TPrinter.Abort
 00526665    call        @TryFinallyExit
>0052666A    jmp         00526BEC
 0052666F    push        ebp
 00526670    mov         eax,dword ptr [ebp-3C]
 00526673    push        eax
 00526674    mov         eax,dword ptr [ebp-38]
 00526677    push        eax
 00526678    lea         ecx,[ebp-30]
 0052667B    mov         eax,dword ptr [ebp+18]
 0052667E    mov         eax,dword ptr [eax-0C]
 00526681    mov         edx,dword ptr [ebp-10]
 00526684    call        00526300
 00526689    pop         ecx
 0052668A    cmp         byte ptr [ebp-19],0
>0052668E    je          005266B8
 00526690    mov         edx,dword ptr [ebp-20]
 00526693    dec         edx
 00526694    mov         eax,dword ptr [ebp+18]
 00526697    mov         eax,dword ptr [eax-48]
 0052669A    mov         eax,dword ptr [eax+2A4]
 005266A0    mov         ecx,dword ptr [eax]
 005266A2    call        dword ptr [ecx+18]
 005266A5    mov         edx,eax
 005266A7    mov         eax,dword ptr [ebp+18]
 005266AA    mov         eax,dword ptr [eax-48]
 005266AD    mov         eax,dword ptr [eax+2D4]
 005266B3    mov         ecx,dword ptr [eax]
 005266B5    call        dword ptr [ecx+7C]
 005266B8    mov         eax,dword ptr [ebp-20]
 005266BB    dec         eax
 005266BC    mov         edx,dword ptr [ebp+14]
 005266BF    dec         edx
 005266C0    sub         edx,eax
>005266C2    jl          00526B50
 005266C8    inc         edx
 005266C9    mov         dword ptr [ebp-5C],edx
 005266CC    mov         dword ptr [ebp-34],eax
 005266CF    lea         ecx,[ebp-0C0]
 005266D5    mov         eax,dword ptr [ebp+18]
 005266D8    mov         eax,dword ptr [eax-48]
 005266DB    mov         eax,dword ptr [eax+2A4]
 005266E1    mov         edx,dword ptr [ebp-34]
 005266E4    mov         ebx,dword ptr [eax]
 005266E6    call        dword ptr [ebx+0C]
 005266E9    mov         eax,dword ptr [ebp-0C0]
 005266EF    mov         dword ptr [ebp-0C4],eax
 005266F5    mov         eax,dword ptr [ebp-0C4]
 005266FB    test        eax,eax
>005266FD    je          00526704
 005266FF    sub         eax,4
 00526702    mov         eax,dword ptr [eax]
 00526704    mov         esi,eax
 00526706    cmp         byte ptr [ebp+8],0
>0052670A    jne         0052671B
 0052670C    mov         eax,dword ptr [ebp-20]
 0052670F    dec         eax
 00526710    cmp         eax,dword ptr [ebp-34]
>00526713    jne         00526720
 00526715    cmp         dword ptr [ebp+10],0
>00526719    jle         00526720
 0052671B    mov         ebx,dword ptr [ebp+10]
>0052671E    jmp         00526725
 00526720    mov         ebx,1
 00526725    cmp         byte ptr [ebp+8],0
>00526729    jne         0052673A
 0052672B    mov         eax,dword ptr [ebp+14]
 0052672E    dec         eax
 0052672F    cmp         eax,dword ptr [ebp-34]
>00526732    jne         00526749
 00526734    cmp         dword ptr [ebp+0C],0
>00526738    jle         00526749
 0052673A    mov         edx,dword ptr [ebp+0C]
 0052673D    mov         eax,esi
 0052673F    call        0051048C
 00526744    mov         dword ptr [ebp-28],eax
>00526747    jmp         0052674C
 00526749    mov         dword ptr [ebp-28],esi
 0052674C    cmp         esi,ebx
>0052674E    jl          00526A32
 00526754    cmp         byte ptr [ebp-19],0
>00526758    je          00526991
 0052675E    lea         ecx,[ebp-0C8]
 00526764    mov         eax,dword ptr [ebp+18]
 00526767    mov         eax,dword ptr [eax-48]
 0052676A    mov         eax,dword ptr [eax+2A4]
 00526770    mov         edx,dword ptr [ebp-34]
 00526773    mov         esi,dword ptr [eax]
 00526775    call        dword ptr [esi+0C]
 00526778    mov         edx,dword ptr [ebp-0C8]
 0052677E    mov         eax,dword ptr [ebp+18]
 00526781    mov         eax,dword ptr [eax-48]
 00526784    mov         eax,dword ptr [eax+2D4]
 0052678A    mov         ecx,dword ptr [ebp-34]
 0052678D    mov         esi,dword ptr [eax]
 0052678F    call        dword ptr [esi+74]
 00526792    mov         eax,dword ptr [ebp-10]
 00526795    mov         dword ptr [ebp-2C],eax
 00526798    cmp         byte ptr [ebp+8],0
>0052679C    jne         005267A7
 0052679E    cmp         ebx,1
>005267A1    jne         00526973
 005267A7    mov         eax,ebx
 005267A9    dec         eax
 005267AA    imul        dword ptr [ebp-38]
 005267AD    sub         dword ptr [ebp-2C],eax
>005267B0    jmp         00526973
 005267B5    lea         edx,[ebp-18]
 005267B8    mov         eax,dword ptr [ebp+18]
 005267BB    mov         eax,dword ptr [eax-48]
 005267BE    mov         eax,dword ptr [eax+2D4]
 005267C4    mov         ecx,dword ptr [eax]
 005267C6    call        dword ptr [ecx+60]
 005267C9    mov         eax,dword ptr [ebp+18]
 005267CC    mov         eax,dword ptr [eax-48]
 005267CF    mov         eax,dword ptr [eax+2D4]
 005267D5    mov         edx,dword ptr [eax]
 005267D7    call        dword ptr [edx+6C]
 005267DA    mov         esi,eax
 005267DC    mov         edi,dword ptr [ebp-18]
 005267DF    test        edi,edi
>005267E1    je          005267E8
 005267E3    sub         edi,4
 005267E6    mov         edi,dword ptr [edi]
 005267E8    mov         dword ptr [ebp-48],edi
 005267EB    mov         eax,dword ptr [ebp-48]
 005267EE    add         eax,esi
 005267F0    cmp         ebx,eax
>005267F2    jg          00526962
 005267F8    cmp         esi,dword ptr [ebp-28]
>005267FB    jge         00526962
 00526801    mov         eax,dword ptr [ebp+18]
 00526804    mov         eax,dword ptr [eax-48]
 00526807    mov         eax,dword ptr [eax+2D4]
 0052680D    mov         edx,dword ptr [eax]
 0052680F    call        dword ptr [edx+64]
 00526812    mov         dword ptr [ebp-58],eax
 00526815    cmp         dword ptr [ebp-58],0
>00526819    je          00526895
 0052681B    call        Printer
 00526820    call        TPrinter.GetCanvas
 00526825    mov         eax,dword ptr [eax+40];TCanvas.FFont:TFont
 00526828    mov         edx,dword ptr [ebp-58]
 0052682B    movzx       edx,byte ptr [edx+0C]
 0052682F    call        TFont.SetStyle
 00526834    mov         eax,dword ptr [ebp+18]
 00526837    cmp         byte ptr [eax-39],0
>0052683B    jne         00526895
 0052683D    call        Printer
 00526842    call        TPrinter.GetCanvas
 00526847    mov         eax,dword ptr [eax+40];TCanvas.FFont:TFont
 0052684A    mov         edx,dword ptr [ebp-58]
 0052684D    mov         edx,dword ptr [edx+8]
 00526850    call        TFont.SetColor
 00526855    mov         eax,dword ptr [ebp-58]
 00526858    mov         eax,dword ptr [eax+4]
 0052685B    mov         edx,dword ptr [ebp+18]
 0052685E    mov         edx,dword ptr [edx-48]
 00526861    cmp         eax,dword ptr [edx+6C]
>00526864    jne         0052687D
 00526866    call        Printer
 0052686B    call        TPrinter.GetCanvas
 00526870    mov         eax,dword ptr [eax+48];TCanvas.FBrush:TBrush
 00526873    mov         edx,dword ptr [ebp-4C]
 00526876    call        TBrush.SetColor
>0052687B    jmp         00526895
 0052687D    call        Printer
 00526882    call        TPrinter.GetCanvas
 00526887    mov         eax,dword ptr [eax+48];TCanvas.FBrush:TBrush
 0052688A    mov         edx,dword ptr [ebp-58]
 0052688D    mov         edx,dword ptr [edx+4]
 00526890    call        TBrush.SetColor
 00526895    lea         eax,[esi+1]
 00526898    cmp         ebx,eax
>0052689A    jle         005268CE
 0052689C    mov         eax,dword ptr [ebp-48]
 0052689F    add         eax,esi
 005268A1    inc         eax
 005268A2    cmp         ebx,eax
>005268A4    jge         005268CE
 005268A6    mov         eax,ebx
 005268A8    sub         eax,esi
 005268AA    mov         dword ptr [ebp-44],eax
 005268AD    mov         eax,dword ptr [ebp-44]
 005268B0    dec         eax
 005268B1    add         esi,eax
 005268B3    mov         eax,dword ptr [ebp-44]
 005268B6    dec         eax
 005268B7    push        eax
 005268B8    mov         eax,dword ptr [ebp-48]
 005268BB    pop         edx
 005268BC    sub         eax,edx
 005268BE    mov         edx,dword ptr [ebp-28]
 005268C1    sub         edx,ebx
 005268C3    inc         edx
 005268C4    call        0051048C
 005268C9    mov         dword ptr [ebp-48],eax
>005268CC    jmp         005268F9
 005268CE    lea         eax,[esi+1]
 005268D1    cmp         eax,dword ptr [ebp-28]
>005268D4    jg          005268F2
 005268D6    mov         eax,dword ptr [ebp-48]
 005268D9    add         eax,esi
 005268DB    inc         eax
 005268DC    cmp         eax,dword ptr [ebp-28]
>005268DF    jle         005268F2
 005268E1    mov         dword ptr [ebp-44],1
 005268E8    mov         eax,dword ptr [ebp-28]
 005268EB    sub         eax,esi
 005268ED    mov         dword ptr [ebp-48],eax
>005268F0    jmp         005268F9
 005268F2    mov         dword ptr [ebp-44],1
 005268F9    mov         eax,dword ptr [ebp-30]
 005268FC    add         eax,dword ptr [ebp-3C]
 005268FF    push        eax
 00526900    lea         eax,[ebp-0BC]
 00526906    push        eax
 00526907    call        Printer
 0052690C    call        TPrinter.GetPageWidth
 00526911    mov         ecx,eax
 00526913    sub         ecx,dword ptr [ebp-8]
 00526916    mov         edx,dword ptr [ebp-30]
 00526919    xor         eax,eax
 0052691B    call        Rect
 00526920    mov         eax,dword ptr [ebp-14]
 00526923    push        eax
 00526924    mov         eax,dword ptr [ebp-48]
 00526927    push        eax
 00526928    lea         eax,[ebp-18]
 0052692B    call        @UniqueStringU
 00526930    mov         edx,dword ptr [ebp-44]
 00526933    lea         eax,[eax+edx*2-2]
 00526937    push        eax
 00526938    lea         eax,[ebp-0BC]
 0052693E    push        eax
 0052693F    push        4
 00526941    mov         eax,dword ptr [ebp-30]
 00526944    push        eax
 00526945    imul        esi,dword ptr [ebp-38]
 00526949    add         esi,dword ptr [ebp-2C]
 0052694C    push        esi
 0052694D    call        Printer
 00526952    call        TPrinter.GetCanvas
 00526957    call        TCanvas.GetHandle
 0052695C    push        eax
 0052695D    call        gdi32.ExtTextOutW
 00526962    mov         eax,dword ptr [ebp+18]
 00526965    mov         eax,dword ptr [eax-48]
 00526968    mov         eax,dword ptr [eax+2D4]
 0052696E    mov         edx,dword ptr [eax]
 00526970    call        dword ptr [edx+70]
 00526973    mov         eax,dword ptr [ebp+18]
 00526976    mov         eax,dword ptr [eax-48]
 00526979    mov         eax,dword ptr [eax+2D4]
 0052697F    mov         edx,dword ptr [eax]
 00526981    call        dword ptr [edx+58]
 00526984    test        al,al
>00526986    je          005267B5
>0052698C    jmp         00526A32
 00526991    cmp         byte ptr [ebp+8],0
>00526995    jne         0052699C
 00526997    cmp         ebx,1
>0052699A    jne         005269A4
 0052699C    mov         eax,dword ptr [ebp-10]
 0052699F    mov         dword ptr [ebp-2C],eax
>005269A2    jmp         005269B0
 005269A4    mov         eax,ebx
 005269A6    dec         eax
 005269A7    imul        dword ptr [ebp-38]
 005269AA    add         eax,dword ptr [ebp-10]
 005269AD    mov         dword ptr [ebp-2C],eax
 005269B0    cmp         ebx,dword ptr [ebp-28]
>005269B3    jg          00526A32
 005269B5    mov         eax,dword ptr [ebp-30]
 005269B8    add         eax,dword ptr [ebp-3C]
 005269BB    push        eax
 005269BC    lea         eax,[ebp-0BC]
 005269C2    push        eax
 005269C3    call        Printer
 005269C8    call        TPrinter.GetPageWidth
 005269CD    mov         ecx,eax
 005269CF    sub         ecx,dword ptr [ebp-8]
 005269D2    mov         edx,dword ptr [ebp-30]
 005269D5    xor         eax,eax
 005269D7    call        Rect
 005269DC    mov         eax,dword ptr [ebp-14]
 005269DF    push        eax
 005269E0    mov         eax,dword ptr [ebp-28]
 005269E3    sub         eax,ebx
 005269E5    inc         eax
 005269E6    push        eax
 005269E7    lea         ecx,[ebp-0CC]
 005269ED    mov         eax,dword ptr [ebp+18]
 005269F0    mov         eax,dword ptr [eax-48]
 005269F3    mov         eax,dword ptr [eax+2A4]
 005269F9    mov         edx,dword ptr [ebp-34]
 005269FC    mov         esi,dword ptr [eax]
 005269FE    call        dword ptr [esi+0C]
 00526A01    mov         eax,dword ptr [ebp-0CC]
 00526A07    lea         eax,[eax+ebx*2-2]
 00526A0B    push        eax
 00526A0C    lea         eax,[ebp-0BC]
 00526A12    push        eax
 00526A13    push        4
 00526A15    mov         eax,dword ptr [ebp-30]
 00526A18    push        eax
 00526A19    mov         eax,dword ptr [ebp-2C]
 00526A1C    push        eax
 00526A1D    call        Printer
 00526A22    call        TPrinter.GetCanvas
 00526A27    call        TCanvas.GetHandle
 00526A2C    push        eax
 00526A2D    call        gdi32.ExtTextOutW
 00526A32    mov         eax,dword ptr [ebp-3C]
 00526A35    add         dword ptr [ebp-30],eax
 00526A38    mov         ebx,dword ptr [ebp-30]
 00526A3B    add         ebx,dword ptr [ebp-3C]
 00526A3E    mov         eax,dword ptr [ebp+18]
 00526A41    mov         esi,dword ptr [eax-8]
 00526A44    test        esi,esi
>00526A46    je          00526A57
 00526A48    mov         eax,dword ptr [ebp+18]
 00526A4B    mov         eax,esi
 00526A4D    mov         edx,dword ptr [eax]
 00526A4F    call        dword ptr [edx+14]
 00526A52    imul        dword ptr [ebp-3C]
 00526A55    add         ebx,eax
 00526A57    call        Printer
 00526A5C    call        TPrinter.GetPageHeight
 00526A61    sub         eax,dword ptr [ebp-4]
 00526A64    cmp         ebx,eax
>00526A66    jle         00526B44
 00526A6C    cmp         byte ptr [ebp-19],0
>00526A70    je          00526A99
 00526A72    call        Printer
 00526A77    call        TPrinter.GetCanvas
 00526A7C    mov         edx,dword ptr [ebp-50]
 00526A7F    call        TCanvas.SetFont
 00526A84    call        Printer
 00526A89    call        TPrinter.GetCanvas
 00526A8E    mov         eax,dword ptr [eax+48];TCanvas.FBrush:TBrush
 00526A91    mov         edx,dword ptr [ebp-4C]
 00526A94    call        TBrush.SetColor
 00526A99    mov         eax,dword ptr [ebp+18]
 00526A9C    cmp         dword ptr [eax-8],0
>00526AA0    je          00526ADF
 00526AA2    mov         eax,dword ptr [ebp+18]
 00526AA5    mov         eax,dword ptr [eax-8]
 00526AA8    mov         edx,dword ptr [eax]
 00526AAA    call        dword ptr [edx+14]
 00526AAD    imul        dword ptr [ebp-3C]
 00526AB0    push        eax
 00526AB1    call        Printer
 00526AB6    call        TPrinter.GetPageHeight
 00526ABB    sub         eax,dword ptr [ebp-4]
 00526ABE    pop         edx
 00526ABF    sub         eax,edx
 00526AC1    mov         dword ptr [ebp-30],eax
 00526AC4    push        ebp
 00526AC5    mov         eax,dword ptr [ebp-3C]
 00526AC8    push        eax
 00526AC9    mov         eax,dword ptr [ebp-38]
 00526ACC    push        eax
 00526ACD    lea         ecx,[ebp-30]
 00526AD0    mov         eax,dword ptr [ebp+18]
 00526AD3    mov         eax,dword ptr [eax-8]
 00526AD6    mov         edx,dword ptr [ebp-10]
 00526AD9    call        00526300
 00526ADE    pop         ecx
 00526ADF    call        Printer
 00526AE4    call        TPrinter.NewPage
 00526AE9    mov         eax,dword ptr [ebp+18]
 00526AEC    inc         dword ptr [eax-4]
 00526AEF    lea         eax,[ebp-51]
 00526AF2    push        eax
 00526AF3    mov         eax,dword ptr [ebp+18]
 00526AF6    mov         ecx,dword ptr [eax-4]
 00526AF9    mov         eax,dword ptr [ebp+18]
 00526AFC    mov         eax,dword ptr [eax-48]
 00526AFF    mov         dl,1
 00526B01    mov         ebx,dword ptr [eax]
 00526B03    call        dword ptr [ebx+104]
 00526B09    cmp         byte ptr [ebp-51],0
>00526B0D    je          00526B23
 00526B0F    call        Printer
 00526B14    call        TPrinter.Abort
 00526B19    call        @TryFinallyExit
>00526B1E    jmp         00526BEC
 00526B23    mov         eax,dword ptr [ebp-0C]
 00526B26    mov         dword ptr [ebp-30],eax
 00526B29    push        ebp
 00526B2A    mov         eax,dword ptr [ebp-3C]
 00526B2D    push        eax
 00526B2E    mov         eax,dword ptr [ebp-38]
 00526B31    push        eax
 00526B32    lea         ecx,[ebp-30]
 00526B35    mov         eax,dword ptr [ebp+18]
 00526B38    mov         eax,dword ptr [eax-0C]
 00526B3B    mov         edx,dword ptr [ebp-10]
 00526B3E    call        00526300
 00526B43    pop         ecx
 00526B44    inc         dword ptr [ebp-34]
 00526B47    dec         dword ptr [ebp-5C]
>00526B4A    jne         005266CF
 00526B50    mov         eax,dword ptr [ebp+18]
 00526B53    cmp         dword ptr [eax-8],0
>00526B57    je          00526BC3
 00526B59    cmp         byte ptr [ebp-19],0
>00526B5D    je          00526B86
 00526B5F    call        Printer
 00526B64    call        TPrinter.GetCanvas
 00526B69    mov         edx,dword ptr [ebp-50]
 00526B6C    call        TCanvas.SetFont
 00526B71    call        Printer
 00526B76    call        TPrinter.GetCanvas
 00526B7B    mov         eax,dword ptr [eax+48];TCanvas.FBrush:TBrush
 00526B7E    mov         edx,dword ptr [ebp-4C]
 00526B81    call        TBrush.SetColor
 00526B86    mov         eax,dword ptr [ebp+18]
 00526B89    mov         eax,dword ptr [eax-8]
 00526B8C    mov         edx,dword ptr [eax]
 00526B8E    call        dword ptr [edx+14]
 00526B91    imul        dword ptr [ebp-3C]
 00526B94    push        eax
 00526B95    call        Printer
 00526B9A    call        TPrinter.GetPageHeight
 00526B9F    sub         eax,dword ptr [ebp-4]
 00526BA2    pop         edx
 00526BA3    sub         eax,edx
 00526BA5    mov         dword ptr [ebp-30],eax
 00526BA8    push        ebp
 00526BA9    mov         eax,dword ptr [ebp-3C]
 00526BAC    push        eax
 00526BAD    mov         eax,dword ptr [ebp-38]
 00526BB0    push        eax
 00526BB1    lea         ecx,[ebp-30]
 00526BB4    mov         eax,dword ptr [ebp+18]
 00526BB7    mov         eax,dword ptr [eax-8]
 00526BBA    mov         edx,dword ptr [ebp-10]
 00526BBD    call        00526300
 00526BC2    pop         ecx
 00526BC3    xor         eax,eax
 00526BC5    pop         edx
 00526BC6    pop         ecx
 00526BC7    pop         ecx
 00526BC8    mov         dword ptr fs:[eax],edx
 00526BCB    push        526BE8
 00526BD0    mov         eax,dword ptr [ebp-14]
 00526BD3    call        @FreeMem
 00526BD8    mov         eax,dword ptr [ebp-50]
 00526BDB    call        TObject.Free
 00526BE0    ret
>00526BE1    jmp         @HandleFinally
>00526BE6    jmp         00526BD0
 00526BE8    mov         byte ptr [ebp-21],1
 00526BEC    xor         eax,eax
 00526BEE    pop         edx
 00526BEF    pop         ecx
 00526BF0    pop         ecx
 00526BF1    mov         dword ptr fs:[eax],edx
 00526BF4    push        526C24
 00526BF9    lea         eax,[ebp-0CC]
 00526BFF    mov         edx,2
 00526C04    call        @UStrArrayClr
 00526C09    lea         eax,[ebp-0C0]
 00526C0F    call        @UStrClr
 00526C14    lea         eax,[ebp-18]
 00526C17    call        @UStrClr
 00526C1C    ret
>00526C1D    jmp         @HandleFinally
>00526C22    jmp         00526BF9
 00526C24    movzx       eax,byte ptr [ebp-21]
 00526C28    pop         edi
 00526C29    pop         esi
 00526C2A    pop         ebx
 00526C2B    mov         esp,ebp
 00526C2D    pop         ebp
 00526C2E    ret         10
end;*}

//00526C38
{*procedure sub_00526C38(?:?; ?:?; ?:?);
begin
 00526C38    push        ebp
 00526C39    mov         ebp,esp
 00526C3B    add         esp,0FFFFFFF8
 00526C3E    push        ebx
 00526C3F    push        esi
 00526C40    push        edi
 00526C41    mov         ebx,ecx
 00526C43    mov         esi,edx
 00526C45    mov         byte ptr [ebp-1],al
 00526C48    push        58
 00526C4A    call        Printer
 00526C4F    call        TPrinter.GetCanvas
 00526C54    call        TCanvas.GetHandle
 00526C59    push        eax
 00526C5A    call        gdi32.GetDeviceCaps
 00526C5F    mov         edi,eax
 00526C61    push        58
 00526C63    call        Printer
 00526C68    call        TPrinter.GetCanvas
 00526C6D    call        TCanvas.GetHandle
 00526C72    push        eax
 00526C73    call        gdi32.GetDeviceCaps
 00526C78    mov         dword ptr [ebp-8],eax
 00526C7B    movzx       eax,byte ptr [ebp-1]
 00526C7F    dec         al
>00526C81    je          00526C8C
 00526C83    dec         al
>00526C85    je          00526CDD
>00526C87    jmp         00526D6B
 00526C8C    push        3E8
 00526C91    push        edi
 00526C92    mov         eax,dword ptr [esi]
 00526C94    push        eax
 00526C95    call        kernel32.MulDiv
 00526C9A    mov         dword ptr [ebx],eax
 00526C9C    push        3E8
 00526CA1    push        edi
 00526CA2    mov         eax,dword ptr [esi+8]
 00526CA5    push        eax
 00526CA6    call        kernel32.MulDiv
 00526CAB    mov         dword ptr [ebx+8],eax
 00526CAE    push        3E8
 00526CB3    mov         eax,dword ptr [ebp-8]
 00526CB6    push        eax
 00526CB7    mov         eax,dword ptr [esi+4]
 00526CBA    push        eax
 00526CBB    call        kernel32.MulDiv
 00526CC0    mov         dword ptr [ebx+4],eax
 00526CC3    push        3E8
 00526CC8    mov         eax,dword ptr [ebp-8]
 00526CCB    push        eax
 00526CCC    mov         eax,dword ptr [esi+0C]
 00526CCF    push        eax
 00526CD0    call        kernel32.MulDiv
 00526CD5    mov         dword ptr [ebx+0C],eax
>00526CD8    jmp         00526D71
 00526CDD    push        0FE
 00526CE2    push        2710
 00526CE7    push        3E8
 00526CEC    push        edi
 00526CED    mov         eax,dword ptr [esi]
 00526CEF    push        eax
 00526CF0    call        kernel32.MulDiv
 00526CF5    push        eax
 00526CF6    call        kernel32.MulDiv
 00526CFB    mov         dword ptr [ebx],eax
 00526CFD    push        0FE
 00526D02    push        2710
 00526D07    push        3E8
 00526D0C    push        edi
 00526D0D    mov         eax,dword ptr [esi+8]
 00526D10    push        eax
 00526D11    call        kernel32.MulDiv
 00526D16    push        eax
 00526D17    call        kernel32.MulDiv
 00526D1C    mov         dword ptr [ebx+8],eax
 00526D1F    push        0FE
 00526D24    push        2710
 00526D29    push        3E8
 00526D2E    mov         eax,dword ptr [ebp-8]
 00526D31    push        eax
 00526D32    mov         eax,dword ptr [esi+4]
 00526D35    push        eax
 00526D36    call        kernel32.MulDiv
 00526D3B    push        eax
 00526D3C    call        kernel32.MulDiv
 00526D41    mov         dword ptr [ebx+4],eax
 00526D44    push        0FE
 00526D49    push        2710
 00526D4E    push        3E8
 00526D53    mov         eax,dword ptr [ebp-8]
 00526D56    push        eax
 00526D57    mov         eax,dword ptr [esi+0C]
 00526D5A    push        eax
 00526D5B    call        kernel32.MulDiv
 00526D60    push        eax
 00526D61    call        kernel32.MulDiv
 00526D66    mov         dword ptr [ebx+0C],eax
>00526D69    jmp         00526D71
 00526D6B    mov         edi,ebx
 00526D6D    movs        dword ptr [edi],dword ptr [esi]
 00526D6E    movs        dword ptr [edi],dword ptr [esi]
 00526D6F    movs        dword ptr [edi],dword ptr [esi]
 00526D70    movs        dword ptr [edi],dword ptr [esi]
 00526D71    push        70
 00526D73    call        Printer
 00526D78    call        TPrinter.GetCanvas
 00526D7D    call        TCanvas.GetHandle
 00526D82    push        eax
 00526D83    call        gdi32.GetDeviceCaps
 00526D88    mov         esi,eax
 00526D8A    push        71
 00526D8C    call        Printer
 00526D91    call        TPrinter.GetCanvas
 00526D96    call        TCanvas.GetHandle
 00526D9B    push        eax
 00526D9C    call        gdi32.GetDeviceCaps
 00526DA1    sub         dword ptr [ebx],esi
 00526DA3    sub         dword ptr [ebx+8],esi
 00526DA6    sub         dword ptr [ebx+4],eax
 00526DA9    sub         dword ptr [ebx+0C],eax
 00526DAC    mov         eax,dword ptr [ebx]
 00526DAE    xor         edx,edx
 00526DB0    call        00510484
 00526DB5    mov         dword ptr [ebx],eax
 00526DB7    mov         eax,dword ptr [ebx+8]
 00526DBA    xor         edx,edx
 00526DBC    call        00510484
 00526DC1    mov         dword ptr [ebx+8],eax
 00526DC4    mov         eax,dword ptr [ebx+4]
 00526DC7    xor         edx,edx
 00526DC9    call        00510484
 00526DCE    mov         dword ptr [ebx+4],eax
 00526DD1    mov         eax,dword ptr [ebx+0C]
 00526DD4    xor         edx,edx
 00526DD6    call        00510484
 00526DDB    mov         dword ptr [ebx+0C],eax
 00526DDE    pop         edi
 00526DDF    pop         esi
 00526DE0    pop         ebx
 00526DE1    pop         ecx
 00526DE2    pop         ecx
 00526DE3    pop         ebp
 00526DE4    ret
end;*}

//00526DE8
procedure TmwCustomEdit.Print(PrintFont:TFont; Options:TmwPrintOptions);
begin
{*
 00526DE8    push        ebp
 00526DE9    mov         ebp,esp
 00526DEB    add         esp,0FFFFFF58
 00526DF1    push        ebx
 00526DF2    push        esi
 00526DF3    push        edi
 00526DF4    xor         ebx,ebx
 00526DF6    mov         dword ptr [ebp-40],ebx
 00526DF9    mov         dword ptr [ebp-44],ebx
 00526DFC    mov         dword ptr [ebp-4C],ebx
 00526DFF    mov         dword ptr [ebp-50],ebx
 00526E02    mov         esi,ecx
 00526E04    lea         edi,[ebp-3C]
 00526E07    mov         ecx,0E
 00526E0C    rep movs    dword ptr [edi],dword ptr [esi]
 00526E0E    mov         ebx,edx
 00526E10    mov         dword ptr [ebp-48],eax
 00526E13    lea         eax,[ebp-3C]
 00526E16    mov         edx,dword ptr ds:[517EA0];TmwPrintOptions
 00526E1C    call        @AddRefRecord
 00526E21    xor         eax,eax
 00526E23    push        ebp
 00526E24    push        5270C7
 00526E29    push        dword ptr fs:[eax]
 00526E2C    mov         dword ptr fs:[eax],esp
 00526E2F    cmp         byte ptr [ebp-3C],0
>00526E33    je          00526E45
 00526E35    mov         eax,dword ptr [ebp-48]
 00526E38    call        0051C710
 00526E3D    test        al,al
>00526E3F    je          00527091
 00526E45    call        Date
 00526E4A    fstp        qword ptr [ebp-60]
 00526E4D    wait
 00526E4E    push        dword ptr [ebp-5C]
 00526E51    push        dword ptr [ebp-60]
 00526E54    lea         edx,[ebp-4C]
 00526E57    mov         eax,[0078D6A8];^gvar_00790CDC:TFormatSettings
 00526E5C    call        DateToStr
 00526E61    lea         eax,[ebp-44]
 00526E64    mov         edx,dword ptr [ebp-4C]
 00526E67    call        @UStrLAsg
 00526E6C    call        Time
 00526E71    fstp        qword ptr [ebp-68]
 00526E74    wait
 00526E75    push        dword ptr [ebp-64]
 00526E78    push        dword ptr [ebp-68]
 00526E7B    lea         edx,[ebp-50]
 00526E7E    mov         eax,[0078D6A8];^gvar_00790CDC:TFormatSettings
 00526E83    call        TimeToStr
 00526E88    lea         eax,[ebp-40]
 00526E8B    mov         edx,dword ptr [ebp-50]
 00526E8E    call        @UStrLAsg
 00526E93    test        ebx,ebx
>00526E95    jne         00526EB2
 00526E97    mov         eax,dword ptr [ebp-48]
 00526E9A    call        TmwCustomEdit.GetFont
 00526E9F    push        eax
 00526EA0    call        Printer
 00526EA5    call        TPrinter.GetCanvas
 00526EAA    pop         edx
 00526EAB    call        TCanvas.SetFont
>00526EB0    jmp         00526EC3
 00526EB2    call        Printer
 00526EB7    call        TPrinter.GetCanvas
 00526EBC    mov         edx,ebx
 00526EBE    call        TCanvas.SetFont
 00526EC3    call        Printer
 00526EC8    mov         edx,dword ptr [ebp-38]
 00526ECB    call        TPrinter.SetNumCopies
 00526ED0    call        Printer
 00526ED5    add         eax,18;TPrinter.FTitle:string
 00526ED8    mov         edx,dword ptr [ebp-10]
 00526EDB    call        @UStrAsg
 00526EE0    call        Printer
 00526EE5    call        TPrinter.BeginDoc
 00526EEA    xor         eax,eax
 00526EEC    push        ebp
 00526EED    push        52708A
 00526EF2    push        dword ptr fs:[eax]
 00526EF5    mov         dword ptr fs:[eax],esp
 00526EF8    mov         byte ptr [ebp-51],0
 00526EFC    lea         eax,[ebp-51]
 00526EFF    push        eax
 00526F00    xor         ecx,ecx
 00526F02    xor         edx,edx
 00526F04    mov         eax,dword ptr [ebp-48]
 00526F07    mov         ebx,dword ptr [eax]
 00526F09    call        dword ptr [ebx+104];TmwCustomEdit.sub_005270D8
 00526F0F    cmp         byte ptr [ebp-51],0
>00526F13    je          00526F29
 00526F15    call        Printer
 00526F1A    call        TPrinter.Abort
 00526F1F    call        @TryFinallyExit
>00526F24    jmp         00527091
 00526F29    cmp         byte ptr [ebp-3C],0
>00526F2D    je          00526FCF
 00526F33    mov         eax,dword ptr [ebp-48]
 00526F36    cmp         byte ptr [eax+390],2;TmwCustomEdit.fSelectionMode:TSelectionMode
>00526F3D    jne         00526F74
 00526F3F    lea         edx,[ebp-80]
 00526F42    mov         eax,dword ptr [ebp-48]
 00526F45    call        0051C5CC
 00526F4A    mov         eax,dword ptr [ebp-7C]
 00526F4D    push        eax
 00526F4E    lea         eax,[ebp-78]
 00526F51    push        eax
 00526F52    lea         edx,[ebp-88]
 00526F58    mov         eax,dword ptr [ebp-48]
 00526F5B    call        0051C570
 00526F60    mov         edx,dword ptr [ebp-84]
 00526F66    xor         ecx,ecx
 00526F68    xor         eax,eax
 00526F6A    call        Rect
>00526F6F    jmp         00527009
 00526F74    lea         edx,[ebp-80]
 00526F77    mov         eax,dword ptr [ebp-48]
 00526F7A    call        0051C5CC
 00526F7F    mov         eax,dword ptr [ebp-7C]
 00526F82    push        eax
 00526F83    lea         eax,[ebp-78]
 00526F86    push        eax
 00526F87    lea         edx,[ebp-88]
 00526F8D    mov         eax,dword ptr [ebp-48]
 00526F90    call        0051C5CC
 00526F95    mov         eax,dword ptr [ebp-88]
 00526F9B    dec         eax
 00526F9C    push        eax
 00526F9D    lea         edx,[ebp-90]
 00526FA3    mov         eax,dword ptr [ebp-48]
 00526FA6    call        0051C570
 00526FAB    mov         eax,dword ptr [ebp-8C]
 00526FB1    push        eax
 00526FB2    lea         edx,[ebp-98]
 00526FB8    mov         eax,dword ptr [ebp-48]
 00526FBB    call        0051C570
 00526FC0    mov         eax,dword ptr [ebp-98]
 00526FC6    pop         edx
 00526FC7    pop         ecx
 00526FC8    call        Rect
>00526FCD    jmp         00527009
 00526FCF    lea         eax,[ebp-20]
 00526FD2    push        eax
 00526FD3    call        user32.IsRectEmpty
 00526FD8    test        eax,eax
>00526FDA    jne         00526FE8
 00526FDC    lea         esi,[ebp-20]
 00526FDF    lea         edi,[ebp-78]
 00526FE2    movs        dword ptr [edi],dword ptr [esi]
 00526FE3    movs        dword ptr [edi],dword ptr [esi]
 00526FE4    movs        dword ptr [edi],dword ptr [esi]
 00526FE5    movs        dword ptr [edi],dword ptr [esi]
>00526FE6    jmp         00527009
 00526FE8    mov         eax,dword ptr [ebp-48]
 00526FEB    mov         eax,dword ptr [eax+2A4];TmwCustomEdit.fLines:TStrings
 00526FF1    mov         edx,dword ptr [eax]
 00526FF3    call        dword ptr [edx+14];TStrings.GetCount
 00526FF6    push        eax
 00526FF7    lea         eax,[ebp-78]
 00526FFA    push        eax
 00526FFB    xor         ecx,ecx
 00526FFD    mov         edx,1
 00527002    xor         eax,eax
 00527004    call        Rect
 00527009    push        ebp
 0052700A    mov         eax,dword ptr [ebp-6C]
 0052700D    push        eax
 0052700E    mov         eax,dword ptr [ebp-78]
 00527011    push        eax
 00527012    mov         eax,dword ptr [ebp-70]
 00527015    push        eax
 00527016    cmp         byte ptr [ebp-3C],0
>0052701A    je          00527028
 0052701C    mov         eax,dword ptr [ebp-48]
 0052701F    cmp         byte ptr [eax+390],1;TmwCustomEdit.fSelectionMode:TSelectionMode
>00527026    je          0052702C
 00527028    xor         eax,eax
>0052702A    jmp         0052702E
 0052702C    mov         al,1
 0052702E    push        eax
 0052702F    lea         ecx,[ebp-0A8]
 00527035    lea         edx,[ebp-30]
 00527038    movzx       eax,byte ptr [ebp-34]
 0052703C    call        00526C38
 00527041    lea         edx,[ebp-0A8]
 00527047    mov         ecx,dword ptr [ebp-74]
 0052704A    movzx       eax,byte ptr [ebp-3B]
 0052704E    call        00526480
 00527053    pop         ecx
 00527054    xor         al,1
 00527056    mov         byte ptr [ebp-51],al
 00527059    xor         eax,eax
 0052705B    pop         edx
 0052705C    pop         ecx
 0052705D    pop         ecx
 0052705E    mov         dword ptr fs:[eax],edx
 00527061    push        527091
 00527066    cmp         byte ptr [ebp-51],0
>0052706A    jne         00527076
 0052706C    call        Printer
 00527071    call        TPrinter.EndDoc
 00527076    lea         eax,[ebp-51]
 00527079    push        eax
 0052707A    xor         ecx,ecx
 0052707C    mov         dl,2
 0052707E    mov         eax,dword ptr [ebp-48]
 00527081    mov         ebx,dword ptr [eax]
 00527083    call        dword ptr [ebx+104];TmwCustomEdit.sub_005270D8
 00527089    ret
>0052708A    jmp         @HandleFinally
>0052708F    jmp         00527066
 00527091    xor         eax,eax
 00527093    pop         edx
 00527094    pop         ecx
 00527095    pop         ecx
 00527096    mov         dword ptr fs:[eax],edx
 00527099    push        5270CE
 0052709E    lea         eax,[ebp-50]
 005270A1    mov         edx,2
 005270A6    call        @UStrArrayClr
 005270AB    lea         eax,[ebp-44]
 005270AE    mov         edx,2
 005270B3    call        @UStrArrayClr
 005270B8    lea         eax,[ebp-3C]
 005270BB    mov         edx,dword ptr ds:[517EA0];TmwPrintOptions
 005270C1    call        @FinalizeRecord
 005270C6    ret
>005270C7    jmp         @HandleFinally
>005270CC    jmp         0052709E
 005270CE    pop         edi
 005270CF    pop         esi
 005270D0    pop         ebx
 005270D1    mov         esp,ebp
 005270D3    pop         ebp
 005270D4    ret
*}
end;

//005270D8
{*procedure sub_005270D8(?:?; ?:?);
begin
 005270D8    push        ebp
 005270D9    mov         ebp,esp
 005270DB    push        ebx
 005270DC    cmp         word ptr [eax+39A],0;TmwCustomEdit.?f39A:word
>005270E4    je          005270FD
 005270E6    push        ecx
 005270E7    mov         ecx,dword ptr [ebp+8]
 005270EA    push        ecx
 005270EB    mov         ebx,eax
 005270ED    mov         ecx,edx
 005270EF    mov         edx,eax
 005270F1    mov         eax,dword ptr [ebx+39C];TmwCustomEdit.?f39C:dword
 005270F7    call        dword ptr [ebx+398];TmwCustomEdit.fOnPrintStatus
 005270FD    pop         ebx
 005270FE    pop         ebp
 005270FF    ret         4
end;*}

//00527104
procedure TmwCustomEdit.ReadState(Reader:TReader);
begin
{*
 00527104    push        ebp
 00527105    mov         ebp,esp
 00527107    push        ecx
 00527108    push        ebx
 00527109    mov         ebx,edx
 0052710B    mov         dword ptr [ebp-4],eax
 0052710E    mov         eax,dword ptr [ebp-4]
 00527111    mov         eax,dword ptr [eax+2A4];TmwCustomEdit.fLines:TStrings
 00527117    call        0051BA08
 0052711C    xor         eax,eax
 0052711E    push        ebp
 0052711F    push        527150
 00527124    push        dword ptr fs:[eax]
 00527127    mov         dword ptr fs:[eax],esp
 0052712A    mov         edx,ebx
 0052712C    mov         eax,dword ptr [ebp-4]
 0052712F    call        TWinControl.ReadState
 00527134    xor         eax,eax
 00527136    pop         edx
 00527137    pop         ecx
 00527138    pop         ecx
 00527139    mov         dword ptr fs:[eax],edx
 0052713C    push        527157
 00527141    mov         eax,dword ptr [ebp-4]
 00527144    mov         eax,dword ptr [eax+2A4];TmwCustomEdit.fLines:TStrings
 0052714A    call        0051BA94
 0052714F    ret
>00527150    jmp         @HandleFinally
>00527155    jmp         00527141
 00527157    pop         ebx
 00527158    pop         ecx
 00527159    pop         ebp
 0052715A    ret
*}
end;

//0052715C
procedure TmwCustomEdit.AddKey(Command:TmwEditorCommand; Key1:Word; SS2:TShiftState; Key2:Word; SS1:TShiftState);
begin
{*
 0052715C    push        ebp
 0052715D    mov         ebp,esp
 0052715F    push        ebx
 00527160    push        esi
 00527161    push        edi
 00527162    mov         edi,ecx
 00527164    mov         esi,edx
 00527166    mov         eax,dword ptr [eax+368];TmwCustomEdit.fKeyStrokes:TmwKeyStrokes
 0052716C    call        TmwKeyStrokes.Add
 00527171    mov         ebx,eax
 00527173    mov         edx,esi
 00527175    mov         eax,ebx
 00527177    call        TmwKeyStroke.SetCommand
 0052717C    mov         edx,edi
 0052717E    mov         eax,ebx
 00527180    call        0050EFC8
 00527185    movzx       edx,word ptr [ebp+10]
 00527189    mov         eax,ebx
 0052718B    call        0050EFD4
 00527190    movzx       edx,word ptr [ebp+0C]
 00527194    mov         eax,ebx
 00527196    call        0050F0B8
 0052719B    movzx       edx,word ptr [ebp+8]
 0052719F    mov         eax,ebx
 005271A1    call        0050F0C4
 005271A6    pop         edi
 005271A7    pop         esi
 005271A8    pop         ebx
 005271A9    pop         ebp
 005271AA    ret         0C
*}
end;

//005271BC
{*function sub_005271BC(?:?):?;
begin
 005271BC    push        ebp
 005271BD    mov         ebp,esp
 005271BF    push        ecx
 005271C0    push        ebx
 005271C1    mov         dword ptr [ebp-4],eax
 005271C4    mov         eax,dword ptr [ebp-4]
 005271C7    call        @UStrAddRef
 005271CC    xor         eax,eax
 005271CE    push        ebp
 005271CF    push        5271FF
 005271D4    push        dword ptr fs:[eax]
 005271D7    mov         dword ptr fs:[eax],esp
 005271DA    mov         eax,dword ptr [ebp-4]
 005271DD    test        eax,eax
>005271DF    je          005271E6
 005271E1    sub         eax,4
 005271E4    mov         eax,dword ptr [eax]
 005271E6    lea         ebx,[eax+2]
 005271E9    xor         eax,eax
 005271EB    pop         edx
 005271EC    pop         ecx
 005271ED    pop         ecx
 005271EE    mov         dword ptr fs:[eax],edx
 005271F1    push        527206
 005271F6    lea         eax,[ebp-4]
 005271F9    call        @UStrClr
 005271FE    ret
>005271FF    jmp         @HandleFinally
>00527204    jmp         005271F6
 00527206    mov         eax,ebx
 00527208    pop         ebx
 00527209    pop         ecx
 0052720A    pop         ebp
 0052720B    ret
end;*}

//0052720C
function TmwCustomEdit.GetSelStart:Integer;
begin
{*
 0052720C    push        ebp
 0052720D    mov         ebp,esp
 0052720F    add         esp,0FFFFFFE4
 00527212    push        ebx
 00527213    push        esi
 00527214    push        edi
 00527215    xor         edx,edx
 00527217    mov         dword ptr [ebp-1C],edx
 0052721A    mov         dword ptr [ebp-18],edx
 0052721D    mov         esi,eax
 0052721F    xor         eax,eax
 00527221    push        ebp
 00527222    push        5272BA
 00527227    push        dword ptr fs:[eax]
 0052722A    mov         dword ptr fs:[eax],esp
 0052722D    lea         edx,[ebp-14]
 00527230    mov         eax,esi
 00527232    call        0051C570
 00527237    mov         eax,dword ptr [ebp-14]
 0052723A    mov         dword ptr [ebp-8],eax
 0052723D    lea         edx,[ebp-14]
 00527240    mov         eax,esi
 00527242    call        0051C570
 00527247    mov         eax,dword ptr [ebp-10]
 0052724A    mov         dword ptr [ebp-0C],eax
 0052724D    xor         eax,eax
 0052724F    mov         dword ptr [ebp-4],eax
 00527252    xor         ebx,ebx
>00527254    jmp         00527272
 00527256    lea         ecx,[ebp-18]
 00527259    mov         edx,ebx
 0052725B    mov         eax,dword ptr [esi+2A4];TmwCustomEdit.fLines:TStrings
 00527261    mov         edi,dword ptr [eax]
 00527263    call        dword ptr [edi+0C];TStrings.Get
 00527266    mov         eax,dword ptr [ebp-18]
 00527269    call        005271BC
 0052726E    add         dword ptr [ebp-4],eax
 00527271    inc         ebx
 00527272    mov         eax,dword ptr [ebp-0C]
 00527275    dec         eax
 00527276    cmp         ebx,eax
>00527278    jl          00527256
 0052727A    lea         ecx,[ebp-1C]
 0052727D    mov         edx,ebx
 0052727F    mov         eax,dword ptr [esi+2A4];TmwCustomEdit.fLines:TStrings
 00527285    mov         ebx,dword ptr [eax]
 00527287    call        dword ptr [ebx+0C];TStrings.Get
 0052728A    mov         eax,dword ptr [ebp-1C]
 0052728D    call        005271BC
 00527292    mov         edx,eax
 00527294    mov         eax,dword ptr [ebp-8]
 00527297    call        0051048C
 0052729C    add         dword ptr [ebp-4],eax
 0052729F    xor         eax,eax
 005272A1    pop         edx
 005272A2    pop         ecx
 005272A3    pop         ecx
 005272A4    mov         dword ptr fs:[eax],edx
 005272A7    push        5272C1
 005272AC    lea         eax,[ebp-1C]
 005272AF    mov         edx,2
 005272B4    call        @UStrArrayClr
 005272B9    ret
>005272BA    jmp         @HandleFinally
>005272BF    jmp         005272AC
 005272C1    mov         eax,dword ptr [ebp-4]
 005272C4    pop         edi
 005272C5    pop         esi
 005272C6    pop         ebx
 005272C7    mov         esp,ebp
 005272C9    pop         ebp
 005272CA    ret
*}
end;

//005272CC
{*function sub_005272CC(?:?):?;
begin
 005272CC    push        ebp
 005272CD    mov         ebp,esp
 005272CF    push        ecx
 005272D0    push        ebx
 005272D1    mov         dword ptr [ebp-4],eax
 005272D4    mov         eax,dword ptr [ebp-4]
 005272D7    call        @UStrAddRef
 005272DC    xor         eax,eax
 005272DE    push        ebp
 005272DF    push        52730F
 005272E4    push        dword ptr fs:[eax]
 005272E7    mov         dword ptr fs:[eax],esp
 005272EA    mov         eax,dword ptr [ebp-4]
 005272ED    test        eax,eax
>005272EF    je          005272F6
 005272F1    sub         eax,4
 005272F4    mov         eax,dword ptr [eax]
 005272F6    lea         ebx,[eax+2]
 005272F9    xor         eax,eax
 005272FB    pop         edx
 005272FC    pop         ecx
 005272FD    pop         ecx
 005272FE    mov         dword ptr fs:[eax],edx
 00527301    push        527316
 00527306    lea         eax,[ebp-4]
 00527309    call        @UStrClr
 0052730E    ret
>0052730F    jmp         @HandleFinally
>00527314    jmp         00527306
 00527316    mov         eax,ebx
 00527318    pop         ebx
 00527319    pop         ecx
 0052731A    pop         ebp
 0052731B    ret
end;*}

//0052731C
procedure TmwCustomEdit.SetSelStart(Value:Integer);
begin
{*
 0052731C    push        ebp
 0052731D    mov         ebp,esp
 0052731F    add         esp,0FFFFFFF0
 00527322    push        ebx
 00527323    push        esi
 00527324    push        edi
 00527325    xor         ecx,ecx
 00527327    mov         dword ptr [ebp-10],ecx
 0052732A    mov         dword ptr [ebp-0C],ecx
 0052732D    mov         dword ptr [ebp-4],edx
 00527330    mov         ebx,eax
 00527332    xor         eax,eax
 00527334    push        ebp
 00527335    push        5273D1
 0052733A    push        dword ptr fs:[eax]
 0052733D    mov         dword ptr fs:[eax],esp
 00527340    xor         esi,esi
 00527342    xor         eax,eax
 00527344    mov         dword ptr [ebp-8],eax
>00527347    jmp         00527365
 00527349    lea         ecx,[ebp-0C]
 0052734C    mov         edx,esi
 0052734E    mov         eax,dword ptr [ebx+2A4];TmwCustomEdit.fLines:TStrings
 00527354    mov         edi,dword ptr [eax]
 00527356    call        dword ptr [edi+0C];TStrings.Get
 00527359    mov         eax,dword ptr [ebp-0C]
 0052735C    call        005272CC
 00527361    add         dword ptr [ebp-8],eax
 00527364    inc         esi
 00527365    lea         ecx,[ebp-10]
 00527368    mov         edx,esi
 0052736A    mov         eax,dword ptr [ebx+2A4];TmwCustomEdit.fLines:TStrings
 00527370    mov         edi,dword ptr [eax]
 00527372    call        dword ptr [edi+0C];TStrings.Get
 00527375    mov         eax,dword ptr [ebp-10]
 00527378    call        005272CC
 0052737D    add         eax,dword ptr [ebp-8]
 00527380    cmp         eax,dword ptr [ebp-4]
>00527383    jl          00527349
 00527385    mov         edx,dword ptr [ebp-4]
 00527388    sub         edx,dword ptr [ebp-8]
 0052738B    mov         eax,ebx
 0052738D    call        0051FB70
 00527392    lea         edx,[esi+1]
 00527395    mov         eax,ebx
 00527397    call        0051FB94
 0052739C    mov         eax,ebx
 0052739E    call        0051C628
 005273A3    mov         dword ptr [ebx+278],eax;TmwCustomEdit.fBlockBegin:TPoint
 005273A9    mov         eax,ebx
 005273AB    call        0051C660
 005273B0    mov         dword ptr [ebx+27C],eax
 005273B6    xor         eax,eax
 005273B8    pop         edx
 005273B9    pop         ecx
 005273BA    pop         ecx
 005273BB    mov         dword ptr fs:[eax],edx
 005273BE    push        5273D8
 005273C3    lea         eax,[ebp-10]
 005273C6    mov         edx,2
 005273CB    call        @UStrArrayClr
 005273D0    ret
>005273D1    jmp         @HandleFinally
>005273D6    jmp         005273C3
 005273D8    pop         edi
 005273D9    pop         esi
 005273DA    pop         ebx
 005273DB    mov         esp,ebp
 005273DD    pop         ebp
 005273DE    ret
*}
end;

//005273E0
{*function sub_005273E0(?:?):?;
begin
 005273E0    push        ebp
 005273E1    mov         ebp,esp
 005273E3    push        ecx
 005273E4    push        ebx
 005273E5    mov         dword ptr [ebp-4],eax
 005273E8    mov         eax,dword ptr [ebp-4]
 005273EB    call        @UStrAddRef
 005273F0    xor         eax,eax
 005273F2    push        ebp
 005273F3    push        527423
 005273F8    push        dword ptr fs:[eax]
 005273FB    mov         dword ptr fs:[eax],esp
 005273FE    mov         eax,dword ptr [ebp-4]
 00527401    test        eax,eax
>00527403    je          0052740A
 00527405    sub         eax,4
 00527408    mov         eax,dword ptr [eax]
 0052740A    lea         ebx,[eax+2]
 0052740D    xor         eax,eax
 0052740F    pop         edx
 00527410    pop         ecx
 00527411    pop         ecx
 00527412    mov         dword ptr fs:[eax],edx
 00527415    push        52742A
 0052741A    lea         eax,[ebp-4]
 0052741D    call        @UStrClr
 00527422    ret
>00527423    jmp         @HandleFinally
>00527428    jmp         0052741A
 0052742A    mov         eax,ebx
 0052742C    pop         ebx
 0052742D    pop         ecx
 0052742E    pop         ebp
 0052742F    ret
end;*}

//00527430
function TmwCustomEdit.GetSelEnd:Integer;
begin
{*
 00527430    push        ebp
 00527431    mov         ebp,esp
 00527433    add         esp,0FFFFFFE8
 00527436    push        ebx
 00527437    push        esi
 00527438    push        edi
 00527439    xor         edx,edx
 0052743B    mov         dword ptr [ebp-18],edx
 0052743E    mov         esi,eax
 00527440    xor         eax,eax
 00527442    push        ebp
 00527443    push        5274B7
 00527448    push        dword ptr fs:[eax]
 0052744B    mov         dword ptr fs:[eax],esp
 0052744E    lea         edx,[ebp-14]
 00527451    mov         eax,esi
 00527453    call        0051C5CC
 00527458    mov         eax,dword ptr [ebp-14]
 0052745B    mov         dword ptr [ebp-8],eax
 0052745E    lea         edx,[ebp-14]
 00527461    mov         eax,esi
 00527463    call        0051C5CC
 00527468    mov         eax,dword ptr [ebp-10]
 0052746B    mov         dword ptr [ebp-0C],eax
 0052746E    xor         eax,eax
 00527470    mov         dword ptr [ebp-4],eax
 00527473    xor         ebx,ebx
>00527475    jmp         00527493
 00527477    lea         ecx,[ebp-18]
 0052747A    mov         edx,ebx
 0052747C    mov         eax,dword ptr [esi+2A4];TmwCustomEdit.fLines:TStrings
 00527482    mov         edi,dword ptr [eax]
 00527484    call        dword ptr [edi+0C];TStrings.Get
 00527487    mov         eax,dword ptr [ebp-18]
 0052748A    call        005273E0
 0052748F    add         dword ptr [ebp-4],eax
 00527492    inc         ebx
 00527493    mov         eax,dword ptr [ebp-0C]
 00527496    dec         eax
 00527497    cmp         ebx,eax
>00527499    jl          00527477
 0052749B    mov         eax,dword ptr [ebp-8]
 0052749E    add         dword ptr [ebp-4],eax
 005274A1    xor         eax,eax
 005274A3    pop         edx
 005274A4    pop         ecx
 005274A5    pop         ecx
 005274A6    mov         dword ptr fs:[eax],edx
 005274A9    push        5274BE
 005274AE    lea         eax,[ebp-18]
 005274B1    call        @UStrClr
 005274B6    ret
>005274B7    jmp         @HandleFinally
>005274BC    jmp         005274AE
 005274BE    mov         eax,dword ptr [ebp-4]
 005274C1    pop         edi
 005274C2    pop         esi
 005274C3    pop         ebx
 005274C4    mov         esp,ebp
 005274C6    pop         ebp
 005274C7    ret
*}
end;

//005274C8
{*function sub_005274C8(?:?):?;
begin
 005274C8    push        ebp
 005274C9    mov         ebp,esp
 005274CB    push        ecx
 005274CC    push        ebx
 005274CD    mov         dword ptr [ebp-4],eax
 005274D0    mov         eax,dword ptr [ebp-4]
 005274D3    call        @UStrAddRef
 005274D8    xor         eax,eax
 005274DA    push        ebp
 005274DB    push        52750B
 005274E0    push        dword ptr fs:[eax]
 005274E3    mov         dword ptr fs:[eax],esp
 005274E6    mov         eax,dword ptr [ebp-4]
 005274E9    test        eax,eax
>005274EB    je          005274F2
 005274ED    sub         eax,4
 005274F0    mov         eax,dword ptr [eax]
 005274F2    lea         ebx,[eax+2]
 005274F5    xor         eax,eax
 005274F7    pop         edx
 005274F8    pop         ecx
 005274F9    pop         ecx
 005274FA    mov         dword ptr fs:[eax],edx
 005274FD    push        527512
 00527502    lea         eax,[ebp-4]
 00527505    call        @UStrClr
 0052750A    ret
>0052750B    jmp         @HandleFinally
>00527510    jmp         00527502
 00527512    mov         eax,ebx
 00527514    pop         ebx
 00527515    pop         ecx
 00527516    pop         ebp
 00527517    ret
end;*}

//00527518
procedure TmwCustomEdit.SetSelEnd(Value:Integer);
begin
{*
 00527518    push        ebp
 00527519    mov         ebp,esp
 0052751B    add         esp,0FFFFFFE8
 0052751E    push        ebx
 0052751F    push        esi
 00527520    push        edi
 00527521    xor         ecx,ecx
 00527523    mov         dword ptr [ebp-18],ecx
 00527526    mov         dword ptr [ebp-14],ecx
 00527529    mov         dword ptr [ebp-4],edx
 0052752C    mov         esi,eax
 0052752E    xor         eax,eax
 00527530    push        ebp
 00527531    push        5275B3
 00527536    push        dword ptr fs:[eax]
 00527539    mov         dword ptr fs:[eax],esp
 0052753C    xor         ebx,ebx
 0052753E    xor         eax,eax
 00527540    mov         dword ptr [ebp-10],eax
>00527543    jmp         00527561
 00527545    lea         ecx,[ebp-14]
 00527548    mov         edx,ebx
 0052754A    mov         eax,dword ptr [esi+2A4];TmwCustomEdit.fLines:TStrings
 00527550    mov         edi,dword ptr [eax]
 00527552    call        dword ptr [edi+0C];TStrings.Get
 00527555    mov         eax,dword ptr [ebp-14]
 00527558    call        005274C8
 0052755D    add         dword ptr [ebp-10],eax
 00527560    inc         ebx
 00527561    lea         ecx,[ebp-18]
 00527564    mov         edx,ebx
 00527566    mov         eax,dword ptr [esi+2A4];TmwCustomEdit.fLines:TStrings
 0052756C    mov         edi,dword ptr [eax]
 0052756E    call        dword ptr [edi+0C];TStrings.Get
 00527571    mov         eax,dword ptr [ebp-18]
 00527574    call        005274C8
 00527579    add         eax,dword ptr [ebp-10]
 0052757C    cmp         eax,dword ptr [ebp-4]
>0052757F    jl          00527545
 00527581    mov         eax,dword ptr [ebp-4]
 00527584    sub         eax,dword ptr [ebp-10]
 00527587    mov         dword ptr [ebp-0C],eax
 0052758A    inc         ebx
 0052758B    mov         dword ptr [ebp-8],ebx
 0052758E    lea         edx,[ebp-0C]
 00527591    mov         eax,esi
 00527593    call        0051F99C
 00527598    xor         eax,eax
 0052759A    pop         edx
 0052759B    pop         ecx
 0052759C    pop         ecx
 0052759D    mov         dword ptr fs:[eax],edx
 005275A0    push        5275BA
 005275A5    lea         eax,[ebp-18]
 005275A8    mov         edx,2
 005275AD    call        @UStrArrayClr
 005275B2    ret
>005275B3    jmp         @HandleFinally
>005275B8    jmp         005275A5
 005275BA    pop         edi
 005275BB    pop         esi
 005275BC    pop         ebx
 005275BD    mov         esp,ebp
 005275BF    pop         ebp
 005275C0    ret
*}
end;

//005275C4
procedure TmwCustomEdit.SetSelWord;
begin
{*
 005275C4    push        ebx
 005275C5    add         esp,0FFFFFFF8
 005275C8    mov         ebx,eax
 005275CA    mov         edx,esp
 005275CC    mov         eax,ebx
 005275CE    call        0051FBB8
 005275D3    mov         edx,esp
 005275D5    mov         eax,ebx
 005275D7    call        00521D44
 005275DC    pop         ecx
 005275DD    pop         edx
 005275DE    pop         ebx
 005275DF    ret
*}
end;

//005275E0
procedure TmwCustomEdit.SetExtraLineSpacing(Value:Integer);
begin
{*
 005275E0    mov         dword ptr [eax+380],edx;TmwCustomEdit.fExtraLineSpacing:Integer
 005275E6    mov         edx,eax
 005275E8    call        0051C698
 005275ED    ret
*}
end;

//005275F0
function TmwCustomEdit.GetBookMark(BookMark:Integer; var X:Integer; var Y:Integer):Boolean;
begin
{*
 005275F0    push        ebp
 005275F1    mov         ebp,esp
 005275F3    add         esp,0FFFFFFF4
 005275F6    push        ebx
 005275F7    push        esi
 005275F8    push        edi
 005275F9    mov         dword ptr [ebp-8],ecx
 005275FC    mov         dword ptr [ebp-4],edx
 005275FF    mov         ebx,eax
 00527601    mov         byte ptr [ebp-9],0
 00527605    mov         eax,dword ptr [ebx+370];TmwCustomEdit.fMarkList:TMarkList
 0052760B    test        eax,eax
>0052760D    je          00527679
 0052760F    mov         edi,dword ptr [eax+8];TMarkList.FCount:Integer
 00527612    dec         edi
 00527613    test        edi,edi
>00527615    jl          00527679
 00527617    inc         edi
 00527618    xor         esi,esi
 0052761A    mov         edx,esi
 0052761C    mov         eax,dword ptr [ebx+370];TmwCustomEdit.fMarkList:TMarkList
 00527622    call        00529C58
 00527627    call        00529A38
 0052762C    test        al,al
>0052762E    je          00527675
 00527630    mov         edx,esi
 00527632    mov         eax,dword ptr [ebx+370];TmwCustomEdit.fMarkList:TMarkList
 00527638    call        00529C58
 0052763D    mov         eax,dword ptr [eax+18]
 00527640    cmp         eax,dword ptr [ebp-4]
>00527643    jne         00527675
 00527645    mov         edx,esi
 00527647    mov         eax,dword ptr [ebx+370];TmwCustomEdit.fMarkList:TMarkList
 0052764D    call        00529C58
 00527652    mov         eax,dword ptr [eax+8]
 00527655    mov         edx,dword ptr [ebp-8]
 00527658    mov         dword ptr [edx],eax
 0052765A    mov         edx,esi
 0052765C    mov         eax,dword ptr [ebx+370];TmwCustomEdit.fMarkList:TMarkList
 00527662    call        00529C58
 00527667    mov         eax,dword ptr [eax+4]
 0052766A    mov         edx,dword ptr [ebp+8]
 0052766D    mov         dword ptr [edx],eax
 0052766F    mov         byte ptr [ebp-9],1
>00527673    jmp         00527679
 00527675    inc         esi
 00527676    dec         edi
>00527677    jne         0052761A
 00527679    movzx       eax,byte ptr [ebp-9]
 0052767D    pop         edi
 0052767E    pop         esi
 0052767F    pop         ebx
 00527680    mov         esp,ebp
 00527682    pop         ebp
 00527683    ret         4
*}
end;

//00527688
procedure TmwCustomEdit.IsBookmark(BookMark:Integer);
begin
{*
 00527688    add         esp,0FFFFFFF8
 0052768B    lea         ecx,[esp+4]
 0052768F    push        ecx
 00527690    lea         ecx,[esp+4]
 00527694    call        TmwCustomEdit.GetBookMark
 00527699    pop         ecx
 0052769A    pop         edx
 0052769B    ret
*}
end;

//0052769C
procedure TmwCustomEdit.ClearUndo;
begin
{*
 0052769C    push        ebx
 0052769D    mov         ebx,eax
 0052769F    mov         eax,dword ptr [ebx+2DC];TmwCustomEdit.fUndoList:TUndoList
 005276A5    call        TUndoList.ClearList
 005276AA    mov         eax,dword ptr [ebx+2E0];TmwCustomEdit.fRedoList:TUndoList
 005276B0    call        TUndoList.ClearList
 005276B5    pop         ebx
 005276B6    ret
*}
end;

//005276B8
procedure sub_005276B8(?:TmwCustomEdit; ?:string);
begin
{*
 005276B8    push        ebp
 005276B9    mov         ebp,esp
 005276BB    add         esp,0FFFFFFF0
 005276BE    push        ebx
 005276BF    push        esi
 005276C0    xor         ecx,ecx
 005276C2    mov         dword ptr [ebp-10],ecx
 005276C5    mov         dword ptr [ebp-0C],ecx
 005276C8    mov         esi,edx
 005276CA    mov         ebx,eax
 005276CC    xor         eax,eax
 005276CE    push        ebp
 005276CF    push        527782
 005276D4    push        dword ptr fs:[eax]
 005276D7    mov         dword ptr fs:[eax],esp
 005276DA    mov         eax,ebx
 005276DC    call        0051C710
 005276E1    test        al,al
>005276E3    je          0052771A
 005276E5    lea         eax,[ebx+280];TmwCustomEdit.fBlockEnd:TPoint
 005276EB    push        eax
 005276EC    lea         edx,[ebp-0C]
 005276EF    mov         eax,ebx
 005276F1    call        0051C7FC
 005276F6    mov         eax,dword ptr [ebp-0C]
 005276F9    call        @UStrToPWChar
 005276FE    push        eax
 005276FF    movzx       eax,byte ptr [ebx+390];TmwCustomEdit.fSelectionMode:TSelectionMode
 00527706    push        eax
 00527707    lea         ecx,[ebx+278];TmwCustomEdit.fBlockBegin:TPoint
 0052770D    mov         dl,5
 0052770F    mov         eax,dword ptr [ebx+2DC];TmwCustomEdit.fUndoList:TUndoList
 00527715    call        TUndoList.AddChange
 0052771A    mov         eax,dword ptr [ebx+278];TmwCustomEdit.fBlockBegin:TPoint
 00527720    mov         dword ptr [ebp-8],eax
 00527723    mov         eax,dword ptr [ebx+27C]
 00527729    mov         dword ptr [ebp-4],eax
 0052772C    mov         edx,esi
 0052772E    mov         eax,ebx
 00527730    call        0052008C
 00527735    lea         eax,[ebx+278];TmwCustomEdit.fBlockBegin:TPoint
 0052773B    push        eax
 0052773C    lea         edx,[ebp-10]
 0052773F    mov         eax,ebx
 00527741    call        0051C7FC
 00527746    mov         eax,dword ptr [ebp-10]
 00527749    call        @UStrToPWChar
 0052774E    push        eax
 0052774F    movzx       eax,byte ptr [ebx+390];TmwCustomEdit.fSelectionMode:TSelectionMode
 00527756    push        eax
 00527757    lea         ecx,[ebp-8]
 0052775A    xor         edx,edx
 0052775C    mov         eax,dword ptr [ebx+2DC];TmwCustomEdit.fUndoList:TUndoList
 00527762    call        TUndoList.AddChange
 00527767    xor         eax,eax
 00527769    pop         edx
 0052776A    pop         ecx
 0052776B    pop         ecx
 0052776C    mov         dword ptr fs:[eax],edx
 0052776F    push        527789
 00527774    lea         eax,[ebp-10]
 00527777    mov         edx,2
 0052777C    call        @UStrArrayClr
 00527781    ret
>00527782    jmp         @HandleFinally
>00527787    jmp         00527774
 00527789    pop         esi
 0052778A    pop         ebx
 0052778B    mov         esp,ebp
 0052778D    pop         ebp
 0052778E    ret
*}
end;

//00527790
procedure TmwCustomEdit.RefreshAllTokens;
begin
{*
 00527790    push        ebp
 00527791    mov         ebp,esp
 00527793    add         esp,0FFFFFFF8
 00527796    push        ebx
 00527797    push        esi
 00527798    push        edi
 00527799    xor         edx,edx
 0052779B    mov         dword ptr [ebp-8],edx
 0052779E    mov         ebx,eax
 005277A0    xor         eax,eax
 005277A2    push        ebp
 005277A3    push        527811
 005277A8    push        dword ptr fs:[eax]
 005277AB    mov         dword ptr fs:[eax],esp
 005277AE    mov         eax,dword ptr [ebx+2D4];TmwCustomEdit.fHighLighter:TmwCustomHighLighter
 005277B4    test        eax,eax
>005277B6    je          005277FB
 005277B8    cmp         word ptr [eax+42],0;TmwCustomHighLighter.?f42:word
>005277BD    je          005277FB
 005277BF    mov         eax,dword ptr [ebx+2A4];TmwCustomEdit.fLines:TStrings
 005277C5    mov         edx,dword ptr [eax]
 005277C7    call        dword ptr [edx+14];TStrings.GetCount
 005277CA    dec         eax
 005277CB    test        eax,eax
>005277CD    jl          005277FB
 005277CF    inc         eax
 005277D0    mov         dword ptr [ebp-4],eax
 005277D3    xor         esi,esi
 005277D5    lea         ecx,[ebp-8]
 005277D8    mov         edx,esi
 005277DA    mov         eax,dword ptr [ebx+2A4];TmwCustomEdit.fLines:TStrings
 005277E0    mov         edi,dword ptr [eax]
 005277E2    call        dword ptr [edi+0C];TStrings.Get
 005277E5    mov         edx,dword ptr [ebp-8]
 005277E8    mov         ecx,esi
 005277EA    mov         eax,dword ptr [ebx+2D4];TmwCustomEdit.fHighLighter:TmwCustomHighLighter
 005277F0    call        TmwCustomHighLighter.ScanAllLineTokens
 005277F5    inc         esi
 005277F6    dec         dword ptr [ebp-4]
>005277F9    jne         005277D5
 005277FB    xor         eax,eax
 005277FD    pop         edx
 005277FE    pop         ecx
 005277FF    pop         ecx
 00527800    mov         dword ptr fs:[eax],edx
 00527803    push        527818
 00527808    lea         eax,[ebp-8]
 0052780B    call        @UStrClr
 00527810    ret
>00527811    jmp         @HandleFinally
>00527816    jmp         00527808
 00527818    pop         edi
 00527819    pop         esi
 0052781A    pop         ebx
 0052781B    pop         ecx
 0052781C    pop         ecx
 0052781D    pop         ebp
 0052781E    ret
*}
end;

//00527820
procedure TmwCustomEdit.SetGutter(Value:TmwGutter);
begin
{*
 00527820    push        esi
 00527821    mov         esi,eax
 00527823    mov         eax,dword ptr [esi+3A4];TmwCustomEdit.fGutter:TmwGutter
 00527829    mov         ecx,dword ptr [eax]
 0052782B    call        dword ptr [ecx+8];TmwGutter.Assign
 0052782E    pop         esi
 0052782F    ret
*}
end;

//00527830
procedure sub_00527830(?:TmwCustomEdit);
begin
{*
 00527830    push        ebx
 00527831    push        esi
 00527832    mov         ebx,eax
 00527834    test        byte ptr [ebx+1C],1;TmwCustomEdit.FComponentState:TComponentState
>00527838    jne         00527891
 0052783A    mov         esi,dword ptr [ebx+3A4];TmwCustomEdit.fGutter:TmwGutter
 00527840    cmp         byte ptr [esi+0C],0;TmwGutter.fShowLineNumbers:Boolean
>00527844    je          00527860
 00527846    cmp         byte ptr [esi+2C],0;TmwGutter.fAutoSize:Boolean
>0052784A    je          00527860
 0052784C    mov         eax,dword ptr [ebx+2A4];TmwCustomEdit.fLines:TStrings
 00527852    mov         edx,dword ptr [eax]
 00527854    call        dword ptr [edx+14];TStrings.GetCount
 00527857    mov         edx,eax
 00527859    mov         eax,esi
 0052785B    call        TmwGutter.AutoSizeDigitCount
 00527860    mov         edx,dword ptr [ebx+294];TmwCustomEdit.fCharWidth:Integer
 00527866    mov         eax,dword ptr [ebx+3A4];TmwCustomEdit.fGutter:TmwGutter
 0052786C    call        TmwGutter.RealGutterWidth
 00527871    cmp         eax,dword ptr [ebx+29C];TmwCustomEdit.fGutterWidth:Integer
>00527877    jne         00527888
 00527879    or          ecx,0FFFFFFFF
 0052787C    or          edx,0FFFFFFFF
 0052787F    mov         eax,ebx
 00527881    call        0051CBEC
>00527886    jmp         00527891
 00527888    mov         edx,eax
 0052788A    mov         eax,ebx
 0052788C    call        0051FE40
 00527891    pop         esi
 00527892    pop         ebx
 00527893    ret
*}
end;

//00527894
procedure sub_00527894(?:TmwCustomEdit);
begin
{*
 00527894    push        ebx
 00527895    mov         ebx,eax
 00527897    mov         eax,dword ptr [ebx+2DC];TmwCustomEdit.fUndoList:TUndoList
 0052789D    call        TUndoList.LockUndo
 005278A2    mov         eax,dword ptr [ebx+2E0];TmwCustomEdit.fRedoList:TUndoList
 005278A8    call        TUndoList.LockUndo
 005278AD    pop         ebx
 005278AE    ret
*}
end;

//005278B0
procedure sub_005278B0(?:TmwCustomEdit);
begin
{*
 005278B0    push        ebx
 005278B1    mov         ebx,eax
 005278B3    mov         eax,dword ptr [ebx+2DC];TmwCustomEdit.fUndoList:TUndoList
 005278B9    call        TUndoList.UnLockUndo
 005278BE    mov         eax,dword ptr [ebx+2E0];TmwCustomEdit.fRedoList:TUndoList
 005278C4    call        TUndoList.UnLockUndo
 005278C9    pop         ebx
 005278CA    ret
*}
end;

//005278CC
procedure TmwCustomEdit.WMMouseWheel(Message:TWMMouseWheel);
begin
{*
 005278CC    push        ebx
 005278CD    push        esi
 005278CE    push        edi
 005278CF    mov         edi,edx
 005278D1    mov         ebx,eax
 005278D3    test        byte ptr [ebx+1C],10;TmwCustomEdit.FComponentState:TComponentState
>005278D7    jne         00527967
 005278DD    push        11
 005278DF    call        user32.GetKeyState
 005278E4    test        ax,ax
>005278E7    jl          005278F5
 005278E9    mov         eax,[0078DA48];^Mouse:TMouse
 005278EE    mov         eax,dword ptr [eax]
 005278F0    mov         esi,dword ptr [eax+10];TMouse.FScrollLines:Integer
>005278F3    jmp         00527907
 005278F5    test        byte ptr [ebx+3CE],8;TmwCustomEdit.fOptions:TmwEditorOptions
 005278FC    setne       cl
 005278FF    mov         esi,dword ptr [ebx+2A8];TmwCustomEdit.fLinesInWindow:Integer
 00527905    shr         esi,cl
 00527907    movsx       eax,word ptr [edi+6]
 0052790B    add         dword ptr [ebx+344],eax;TmwCustomEdit.fMouseWheelAccumulator:Integer
 00527911    mov         eax,dword ptr [ebx+344];TmwCustomEdit.fMouseWheelAccumulator:Integer
 00527917    mov         ecx,78
 0052791C    cdq
 0052791D    idiv        eax,ecx
 0052791F    mov         edi,eax
 00527921    mov         ecx,78
 00527926    mov         eax,dword ptr [ebx+344];TmwCustomEdit.fMouseWheelAccumulator:Integer
 0052792C    cdq
 0052792D    idiv        eax,ecx
 0052792F    mov         dword ptr [ebx+344],edx;TmwCustomEdit.fMouseWheelAccumulator:Integer
 00527935    cmp         esi,0FFFFFFFF
>00527938    je          00527942
 0052793A    cmp         esi,dword ptr [ebx+2A8];TmwCustomEdit.fLinesInWindow:Integer
>00527940    jle         00527948
 00527942    mov         esi,dword ptr [ebx+2A8];TmwCustomEdit.fLinesInWindow:Integer
 00527948    mov         eax,ebx
 0052794A    call        0051CBB4
 0052794F    mov         edx,eax
 00527951    imul        esi,edi
 00527954    sub         edx,esi
 00527956    mov         eax,ebx
 00527958    call        00520F08
 0052795D    mov         eax,ebx
 0052795F    mov         edx,dword ptr [eax]
 00527961    call        dword ptr [edx+9C];TWinControl.Update
 00527967    pop         edi
 00527968    pop         esi
 00527969    pop         ebx
 0052796A    ret
*}
end;

//0052796C
procedure TmwCustomEdit.SetWantTabs(Value:Boolean);
begin
{*
 0052796C    mov         byte ptr [eax+3A0],dl;TmwCustomEdit.fWantTabs:Boolean
 00527972    ret
*}
end;

//00527974
procedure TmwCustomEdit.SetTabWidth(Value:Integer);
begin
{*
 00527974    push        esi
 00527975    mov         esi,eax
 00527977    mov         ecx,100
 0052797C    mov         eax,edx
 0052797E    xor         edx,edx
 00527980    call        00510494
 00527985    mov         edx,eax
 00527987    cmp         edx,dword ptr [esi+3A8];TmwCustomEdit.fTabWidth:Integer
>0052798D    je          0052799F
 0052798F    mov         dword ptr [esi+3A8],edx;TmwCustomEdit.fTabWidth:Integer
 00527995    mov         eax,esi
 00527997    mov         edx,dword ptr [eax]
 00527999    call        dword ptr [edx+90];TWinControl.Invalidate
 0052799F    pop         esi
 005279A0    ret
*}
end;

//005279A4
procedure sub_005279A4;
begin
{*
 005279A4    push        ebx
 005279A5    cmp         word ptr [eax+33A],0;TmwCustomEdit.?f33A:word
>005279AD    je          005279BF
 005279AF    mov         ebx,eax
 005279B1    mov         edx,eax
 005279B3    mov         eax,dword ptr [ebx+33C];TmwCustomEdit.?f33C:dword
 005279B9    call        dword ptr [ebx+338];TmwCustomEdit.fSelectionChange
 005279BF    pop         ebx
 005279C0    ret
*}
end;

//005279C4
procedure TmwCustomEdit.ExportToClipboard(SelectedOnly:Boolean; Exporter:TComponent);
begin
{*
 005279C4    push        ebp
 005279C5    mov         ebp,esp
 005279C7    add         esp,0FFFFFFD0
 005279CA    push        ebx
 005279CB    push        esi
 005279CC    xor         ebx,ebx
 005279CE    mov         dword ptr [ebp-30],ebx
 005279D1    mov         ebx,ecx
 005279D3    mov         byte ptr [ebp-5],dl
 005279D6    mov         dword ptr [ebp-4],eax
 005279D9    xor         eax,eax
 005279DB    push        ebp
 005279DC    push        527B8E
 005279E1    push        dword ptr fs:[eax]
 005279E4    mov         dword ptr fs:[eax],esp
 005279E7    mov         eax,dword ptr [ebp-4]
 005279EA    cmp         dword ptr [eax+2D4],0;TmwCustomEdit.fHighLighter:TmwCustomHighLighter
>005279F1    je          00527B78
 005279F7    cmp         byte ptr [ebp-5],0
>005279FB    je          00527A09
 005279FD    mov         eax,dword ptr [ebp-4]
 00527A00    call        0051C710
 00527A05    test        al,al
>00527A07    jne         00527A0D
 00527A09    xor         eax,eax
>00527A0B    jmp         00527A0F
 00527A0D    mov         al,1
 00527A0F    mov         byte ptr [ebp-5],al
 00527A12    cmp         byte ptr [ebp-5],0
>00527A16    jne         00527A6A
 00527A18    lea         edx,[ebp-10]
 00527A1B    mov         eax,dword ptr [ebp-4]
 00527A1E    call        0051C570
 00527A23    lea         edx,[ebp-18]
 00527A26    mov         eax,dword ptr [ebp-4]
 00527A29    call        0051C5CC
 00527A2E    mov         dword ptr [ebp-24],1
 00527A35    mov         dword ptr [ebp-20],1
 00527A3C    lea         edx,[ebp-24]
 00527A3F    mov         eax,dword ptr [ebp-4]
 00527A42    call        0051F7D8
 00527A47    mov         eax,dword ptr [ebp-4]
 00527A4A    mov         eax,dword ptr [eax+2A4];TmwCustomEdit.fLines:TStrings
 00527A50    mov         edx,dword ptr [eax]
 00527A52    call        dword ptr [edx+14];TStrings.GetCount
 00527A55    mov         dword ptr [ebp-2C],7FFFFFFF
 00527A5C    mov         dword ptr [ebp-28],eax
 00527A5F    lea         edx,[ebp-2C]
 00527A62    mov         eax,dword ptr [ebp-4]
 00527A65    call        0051F99C
 00527A6A    xor         edx,edx
 00527A6C    push        ebp
 00527A6D    push        527B71
 00527A72    push        dword ptr fs:[edx]
 00527A75    mov         dword ptr fs:[edx],esp
 00527A78    call        Clipboard
 00527A7D    mov         edx,dword ptr [eax]
 00527A7F    call        dword ptr [edx+18];TClipboard.Open
 00527A82    xor         edx,edx
 00527A84    push        ebp
 00527A85    push        527B40
 00527A8A    push        dword ptr fs:[edx]
 00527A8D    mov         dword ptr fs:[edx],esp
 00527A90    call        Clipboard
 00527A95    mov         edx,dword ptr [eax]
 00527A97    call        dword ptr [edx+10];TClipboard.Clear
 00527A9A    test        ebx,ebx
>00527A9C    je          00527AD7
 00527A9E    mov         eax,ebx
 00527AA0    mov         edx,dword ptr ds:[516754];TmwCustomExport
 00527AA6    call        @AsClass
 00527AAB    mov         ebx,eax
 00527AAD    push        1
 00527AAF    mov         eax,dword ptr [ebp-4]
 00527AB2    mov         ecx,dword ptr [eax+2D4];TmwCustomEdit.fHighLighter:TmwCustomHighLighter
 00527AB8    mov         edx,dword ptr [ebp-4]
 00527ABB    mov         eax,ebx
 00527ABD    mov         esi,dword ptr [eax]
 00527ABF    call        dword ptr [esi+5C];TmwCustomExport.CopyToClipboardFormat
 00527AC2    mov         eax,dword ptr [ebp-4]
 00527AC5    mov         ecx,dword ptr [eax+2D4];TmwCustomEdit.fHighLighter:TmwCustomHighLighter
 00527ACB    mov         edx,dword ptr [ebp-4]
 00527ACE    mov         eax,ebx
 00527AD0    mov         ebx,dword ptr [eax]
 00527AD2    call        dword ptr [ebx+60];TmwCustomExport.CopyToClipboard
>00527AD5    jmp         00527B28
 00527AD7    lea         edx,[ebp-30]
 00527ADA    mov         eax,dword ptr [ebp-4]
 00527ADD    call        0051C7FC
 00527AE2    mov         eax,dword ptr [ebp-30]
 00527AE5    push        eax
 00527AE6    call        Clipboard
 00527AEB    pop         edx
 00527AEC    call        TClipboard.SetAsText
 00527AF1    call        00517604
 00527AF6    mov         esi,eax
 00527AF8    dec         esi
 00527AF9    test        esi,esi
>00527AFB    jl          00527B28
 00527AFD    inc         esi
 00527AFE    mov         dword ptr [ebp-1C],0
 00527B05    mov         eax,dword ptr [ebp-1C]
 00527B08    call        00517618
 00527B0D    test        eax,eax
>00527B0F    je          00527B22
 00527B11    mov         edx,dword ptr [ebp-4]
 00527B14    mov         ecx,dword ptr [edx+2D4];TmwCustomEdit.fHighLighter:TmwCustomHighLighter
 00527B1A    mov         edx,dword ptr [ebp-4]
 00527B1D    mov         ebx,dword ptr [eax]
 00527B1F    call        dword ptr [ebx+60]
 00527B22    inc         dword ptr [ebp-1C]
 00527B25    dec         esi
>00527B26    jne         00527B05
 00527B28    xor         eax,eax
 00527B2A    pop         edx
 00527B2B    pop         ecx
 00527B2C    pop         ecx
 00527B2D    mov         dword ptr fs:[eax],edx
 00527B30    push        527B47
 00527B35    call        Clipboard
 00527B3A    mov         edx,dword ptr [eax]
 00527B3C    call        dword ptr [edx+14];TClipboard.Close
 00527B3F    ret
>00527B40    jmp         @HandleFinally
>00527B45    jmp         00527B35
 00527B47    xor         eax,eax
 00527B49    pop         edx
 00527B4A    pop         ecx
 00527B4B    pop         ecx
 00527B4C    mov         dword ptr fs:[eax],edx
 00527B4F    push        527B78
 00527B54    cmp         byte ptr [ebp-5],0
>00527B58    jne         00527B70
 00527B5A    lea         edx,[ebp-10]
 00527B5D    mov         eax,dword ptr [ebp-4]
 00527B60    call        0051F7D8
 00527B65    lea         edx,[ebp-18]
 00527B68    mov         eax,dword ptr [ebp-4]
 00527B6B    call        0051F99C
 00527B70    ret
>00527B71    jmp         @HandleFinally
>00527B76    jmp         00527B54
 00527B78    xor         eax,eax
 00527B7A    pop         edx
 00527B7B    pop         ecx
 00527B7C    pop         ecx
 00527B7D    mov         dword ptr fs:[eax],edx
 00527B80    push        527B95
 00527B85    lea         eax,[ebp-30]
 00527B88    call        @UStrClr
 00527B8D    ret
>00527B8E    jmp         @HandleFinally
>00527B93    jmp         00527B85
 00527B95    pop         esi
 00527B96    pop         ebx
 00527B97    mov         esp,ebp
 00527B99    pop         ebp
 00527B9A    ret
*}
end;

//00527B9C
procedure TmwCustomEdit.ExportToFile(SelectedOnly:Boolean; FileName:string; Exporter:TComponent);
begin
{*
 00527B9C    push        ebp
 00527B9D    mov         ebp,esp
 00527B9F    add         esp,0FFFFFFEC
 00527BA2    push        ebx
 00527BA3    push        esi
 00527BA4    push        edi
 00527BA5    mov         edi,ecx
 00527BA7    mov         byte ptr [ebp-1],dl
 00527BAA    mov         ebx,eax
 00527BAC    mov         esi,dword ptr [ebp+8]
 00527BAF    test        esi,esi
>00527BB1    je          00527C52
 00527BB7    mov         eax,esi
 00527BB9    mov         edx,dword ptr ds:[516754];TmwCustomExport
 00527BBF    call        @IsClass
 00527BC4    test        al,al
>00527BC6    je          00527C52
 00527BCC    mov         eax,esi
 00527BCE    mov         edx,dword ptr ds:[516754];TmwCustomExport
 00527BD4    call        @AsClass
 00527BD9    mov         esi,eax
 00527BDB    cmp         byte ptr [ebp-1],0
>00527BDF    je          00527BEC
 00527BE1    mov         eax,ebx
 00527BE3    call        0051C710
 00527BE8    test        al,al
>00527BEA    jne         00527BF0
 00527BEC    xor         eax,eax
>00527BEE    jmp         00527BF2
 00527BF0    mov         al,1
 00527BF2    mov         byte ptr [ebp-1],al
 00527BF5    cmp         byte ptr [ebp-1],0
>00527BF9    je          00527C28
 00527BFB    push        ebx
 00527BFC    mov         eax,dword ptr [ebx+2D4];TmwCustomEdit.fHighLighter:TmwCustomHighLighter
 00527C02    push        eax
 00527C03    lea         edx,[ebp-0C]
 00527C06    mov         eax,ebx
 00527C08    call        0051C5CC
 00527C0D    lea         eax,[ebp-0C]
 00527C10    push        eax
 00527C11    lea         edx,[ebp-14]
 00527C14    mov         eax,ebx
 00527C16    call        0051C570
 00527C1B    lea         edx,[ebp-14]
 00527C1E    mov         eax,esi
 00527C20    pop         ecx
 00527C21    call        TmwCustomExport.RunExportBlock
>00527C26    jmp         00527C49
 00527C28    push        ebx
 00527C29    mov         eax,dword ptr [ebx+2D4];TmwCustomEdit.fHighLighter:TmwCustomHighLighter
 00527C2F    push        eax
 00527C30    mov         eax,dword ptr [ebx+2A4];TmwCustomEdit.fLines:TStrings
 00527C36    mov         edx,dword ptr [eax]
 00527C38    call        dword ptr [edx+14];TStrings.GetCount
 00527C3B    mov         ecx,eax
 00527C3D    mov         edx,1
 00527C42    mov         eax,esi
 00527C44    call        TmwCustomExport.RunExport
 00527C49    mov         edx,edi
 00527C4B    mov         eax,esi
 00527C4D    call        TmwCustomExport.SaveToFile
 00527C52    pop         edi
 00527C53    pop         esi
 00527C54    pop         ebx
 00527C55    mov         esp,ebp
 00527C57    pop         ebp
 00527C58    ret         4
*}
end;

//00527C68
{*function sub_00527C68(?:?; ?:?; ?:?):?;
begin
 00527C68    push        ebp
 00527C69    mov         ebp,esp
 00527C6B    push        ebx
 00527C6C    push        esi
 00527C6D    mov         cl,1
 00527C6F    mov         ebx,dword ptr [ebp+8]
 00527C72    mov         ebx,dword ptr [ebx-4]
 00527C75    movzx       ebx,byte ptr [ebx+390]
 00527C7C    sub         bl,1
>00527C7F    jb          00527C85
>00527C81    je          00527CB5
>00527C83    jmp         00527CCB
 00527C85    mov         ebx,dword ptr [ebp+8]
 00527C88    mov         ebx,dword ptr [ebx-8]
 00527C8B    mov         esi,dword ptr [ebp+8]
 00527C8E    cmp         ebx,dword ptr [esi-10]
>00527C91    jne         00527C9B
 00527C93    mov         ebx,dword ptr [ebp+8]
 00527C96    cmp         eax,dword ptr [ebx-14]
>00527C99    jl          00527CB1
 00527C9B    mov         eax,dword ptr [ebp+8]
 00527C9E    mov         eax,dword ptr [eax-8]
 00527CA1    mov         ebx,dword ptr [ebp+8]
 00527CA4    cmp         eax,dword ptr [ebx-18]
>00527CA7    jne         00527CCB
 00527CA9    mov         eax,dword ptr [ebp+8]
 00527CAC    cmp         edx,dword ptr [eax-1C]
>00527CAF    jle         00527CCB
 00527CB1    xor         ecx,ecx
>00527CB3    jmp         00527CCB
 00527CB5    mov         ecx,dword ptr [ebp+8]
 00527CB8    cmp         eax,dword ptr [ecx-14]
>00527CBB    jl          00527CC5
 00527CBD    mov         eax,dword ptr [ebp+8]
 00527CC0    cmp         edx,dword ptr [eax-1C]
>00527CC3    jle         00527CC9
 00527CC5    xor         ecx,ecx
>00527CC7    jmp         00527CCB
 00527CC9    mov         cl,1
 00527CCB    mov         eax,ecx
 00527CCD    pop         esi
 00527CCE    pop         ebx
 00527CCF    pop         ebp
 00527CD0    ret
end;*}

//00527CD4
function TmwCustomEdit.SearchReplace(ASearch:string; AReplace:string; AOptions:TmwSearchOptions):Integer;
begin
{*
 00527CD4    push        ebp
 00527CD5    mov         ebp,esp
 00527CD7    add         esp,0FFFFFFA4
 00527CDA    push        ebx
 00527CDB    push        esi
 00527CDC    push        edi
 00527CDD    xor         ebx,ebx
 00527CDF    mov         dword ptr [ebp-5C],ebx
 00527CE2    mov         dword ptr [ebp-58],ebx
 00527CE5    mov         dword ptr [ebp-54],ebx
 00527CE8    mov         dword ptr [ebp-4C],ebx
 00527CEB    mov         dword ptr [ebp-24],ecx
 00527CEE    mov         dword ptr [ebp-20],edx
 00527CF1    mov         dword ptr [ebp-4],eax
 00527CF4    xor         eax,eax
 00527CF6    push        ebp
 00527CF7    push        528126
 00527CFC    push        dword ptr fs:[eax]
 00527CFF    mov         dword ptr fs:[eax],esp
 00527D02    xor         eax,eax
 00527D04    mov         dword ptr [ebp-28],eax
 00527D07    mov         eax,dword ptr [ebp-20]
 00527D0A    test        eax,eax
>00527D0C    je          00527D13
 00527D0E    sub         eax,4
 00527D11    mov         eax,dword ptr [eax]
 00527D13    test        eax,eax
>00527D15    je          005280F8
 00527D1B    test        byte ptr [ebp+8],4
 00527D1F    setne       bl
 00527D22    test        byte ptr [ebp+8],80
 00527D26    setne       al
 00527D29    mov         byte ptr [ebp-3A],al
 00527D2C    test        byte ptr [ebp+8],20
 00527D30    setne       al
 00527D33    mov         byte ptr [ebp-3B],al
 00527D36    test        byte ptr [ebp+8],40
 00527D3A    setne       al
 00527D3D    mov         byte ptr [ebp-3C],al
 00527D40    test        byte ptr [ebp+8],8
 00527D44    setne       al
 00527D47    xor         al,1
 00527D49    mov         byte ptr [ebp-39],al
 00527D4C    mov         eax,dword ptr [ebp-4]
 00527D4F    call        0051C710
 00527D54    test        al,al
>00527D56    jne         00527D5C
 00527D58    and         byte ptr [ebp+8],0EF
 00527D5C    test        byte ptr [ebp+8],10
>00527D60    je          00527DFA
 00527D66    lea         edx,[ebp-14]
 00527D69    mov         eax,dword ptr [ebp-4]
 00527D6C    call        0051C570
 00527D71    lea         edx,[ebp-1C]
 00527D74    mov         eax,dword ptr [ebp-4]
 00527D77    call        0051C5CC
 00527D7C    mov         eax,dword ptr [ebp-4]
 00527D7F    movzx       eax,byte ptr [eax+390];TmwCustomEdit.fSelectionMode:TSelectionMode
 00527D86    cmp         al,2
>00527D88    jne         00527DBE
 00527D8A    mov         dword ptr [ebp-14],1
 00527D91    lea         ecx,[ebp-4C]
 00527D94    mov         edx,dword ptr [ebp-18]
 00527D97    dec         edx
 00527D98    mov         eax,dword ptr [ebp-4]
 00527D9B    mov         eax,dword ptr [eax+2A4];TmwCustomEdit.fLines:TStrings
 00527DA1    mov         esi,dword ptr [eax]
 00527DA3    call        dword ptr [esi+0C];TStrings.Get
 00527DA6    mov         eax,dword ptr [ebp-4C]
 00527DA9    mov         dword ptr [ebp-50],eax
 00527DAC    mov         eax,dword ptr [ebp-50]
 00527DAF    test        eax,eax
>00527DB1    je          00527DB8
 00527DB3    sub         eax,4
 00527DB6    mov         eax,dword ptr [eax]
 00527DB8    inc         eax
 00527DB9    mov         dword ptr [ebp-1C],eax
>00527DBC    jmp         00527DD4
 00527DBE    cmp         al,1
>00527DC0    jne         00527DD4
 00527DC2    mov         edx,dword ptr [ebp-1C]
 00527DC5    mov         eax,dword ptr [ebp-14]
 00527DC8    cmp         edx,eax
>00527DCA    jge         00527DD4
 00527DCC    mov         esi,eax
 00527DCE    mov         dword ptr [ebp-14],edx
 00527DD1    mov         dword ptr [ebp-1C],esi
 00527DD4    test        bl,bl
>00527DD6    je          00527DE9
 00527DD8    mov         eax,dword ptr [ebp-1C]
 00527DDB    mov         dword ptr [ebp-0C],eax
 00527DDE    mov         eax,dword ptr [ebp-18]
 00527DE1    mov         dword ptr [ebp-8],eax
>00527DE4    jmp         00527E91
 00527DE9    mov         eax,dword ptr [ebp-14]
 00527DEC    mov         dword ptr [ebp-0C],eax
 00527DEF    mov         eax,dword ptr [ebp-10]
 00527DF2    mov         dword ptr [ebp-8],eax
>00527DF5    jmp         00527E91
 00527DFA    mov         dword ptr [ebp-48],1
 00527E01    mov         dword ptr [ebp-44],1
 00527E08    mov         eax,dword ptr [ebp-48]
 00527E0B    mov         dword ptr [ebp-14],eax
 00527E0E    mov         eax,dword ptr [ebp-44]
 00527E11    mov         dword ptr [ebp-10],eax
 00527E14    mov         eax,dword ptr [ebp-4]
 00527E17    mov         eax,dword ptr [eax+2A4];TmwCustomEdit.fLines:TStrings
 00527E1D    mov         edx,dword ptr [eax]
 00527E1F    call        dword ptr [edx+14];TStrings.GetCount
 00527E22    mov         esi,eax
 00527E24    mov         dword ptr [ebp-18],esi
 00527E27    lea         ecx,[ebp-54]
 00527E2A    mov         edx,esi
 00527E2C    dec         edx
 00527E2D    mov         eax,dword ptr [ebp-4]
 00527E30    mov         eax,dword ptr [eax+2A4];TmwCustomEdit.fLines:TStrings
 00527E36    mov         esi,dword ptr [eax]
 00527E38    call        dword ptr [esi+0C];TStrings.Get
 00527E3B    mov         eax,dword ptr [ebp-54]
 00527E3E    mov         dword ptr [ebp-50],eax
 00527E41    mov         eax,dword ptr [ebp-50]
 00527E44    test        eax,eax
>00527E46    je          00527E4D
 00527E48    sub         eax,4
 00527E4B    mov         eax,dword ptr [eax]
 00527E4D    inc         eax
 00527E4E    mov         dword ptr [ebp-1C],eax
 00527E51    cmp         byte ptr [ebp-39],0
>00527E55    je          00527E73
 00527E57    test        bl,bl
>00527E59    je          00527E68
 00527E5B    lea         edx,[ebp-1C]
 00527E5E    mov         eax,dword ptr [ebp-4]
 00527E61    call        0051FBB8
>00527E66    jmp         00527E73
 00527E68    lea         edx,[ebp-14]
 00527E6B    mov         eax,dword ptr [ebp-4]
 00527E6E    call        0051FBB8
 00527E73    test        bl,bl
>00527E75    je          00527E85
 00527E77    mov         eax,dword ptr [ebp-1C]
 00527E7A    mov         dword ptr [ebp-0C],eax
 00527E7D    mov         eax,dword ptr [ebp-18]
 00527E80    mov         dword ptr [ebp-8],eax
>00527E83    jmp         00527E91
 00527E85    mov         eax,dword ptr [ebp-14]
 00527E88    mov         dword ptr [ebp-0C],eax
 00527E8B    mov         eax,dword ptr [ebp-10]
 00527E8E    mov         dword ptr [ebp-8],eax
 00527E91    lea         eax,[ebp-58]
 00527E94    mov         edx,dword ptr [ebp-20]
 00527E97    mov         ecx,0
 00527E9C    call        @LStrFromUStr
 00527EA1    mov         edx,dword ptr [ebp-58]
 00527EA4    mov         eax,dword ptr [ebp-4]
 00527EA7    mov         eax,dword ptr [eax+3F0];TmwCustomEdit.fTSearch:TmwEditSearch
 00527EAD    call        005103C4
 00527EB2    test        byte ptr [ebp+8],1
 00527EB6    setne       dl
 00527EB9    mov         eax,dword ptr [ebp-4]
 00527EBC    mov         eax,dword ptr [eax+3F0];TmwCustomEdit.fTSearch:TmwEditSearch
 00527EC2    call        005103D8
 00527EC7    test        byte ptr [ebp+8],2
 00527ECB    setne       al
 00527ECE    mov         edx,dword ptr [ebp-4]
 00527ED1    mov         edx,dword ptr [edx+3F0];TmwCustomEdit.fTSearch:TmwEditSearch
 00527ED7    mov         byte ptr [edx+429],al;TmwEditSearch.fWhole:Boolean
 00527EDD    mov         eax,dword ptr [ebp-20]
 00527EE0    test        eax,eax
>00527EE2    je          00527EE9
 00527EE4    sub         eax,4
 00527EE7    mov         eax,dword ptr [eax]
 00527EE9    mov         dword ptr [ebp-2C],eax
 00527EEC    mov         eax,dword ptr [ebp-24]
 00527EEF    test        eax,eax
>00527EF1    je          00527EF8
 00527EF3    sub         eax,4
 00527EF6    mov         eax,dword ptr [eax]
 00527EF8    mov         dword ptr [ebp-30],eax
 00527EFB    cmp         byte ptr [ebp-3C],0
>00527EFF    je          00527F09
 00527F01    mov         eax,dword ptr [ebp-4]
 00527F04    call        0051CBE4
 00527F09    xor         eax,eax
 00527F0B    push        ebp
 00527F0C    push        5280F1
 00527F11    push        dword ptr fs:[eax]
 00527F14    mov         dword ptr fs:[eax],esp
>00527F17    jmp         005280C1
 00527F1C    lea         ecx,[ebp-5C]
 00527F1F    mov         edx,dword ptr [ebp-8]
 00527F22    dec         edx
 00527F23    mov         eax,dword ptr [ebp-4]
 00527F26    mov         eax,dword ptr [eax+2A4];TmwCustomEdit.fLines:TStrings
 00527F2C    mov         esi,dword ptr [eax]
 00527F2E    call        dword ptr [esi+0C];TStrings.Get
 00527F31    mov         edx,dword ptr [ebp-5C]
 00527F34    mov         eax,dword ptr [ebp-4]
 00527F37    mov         eax,dword ptr [eax+3F0];TmwCustomEdit.fTSearch:TmwEditSearch
 00527F3D    call        TmwEditSearch.FindAll
 00527F42    mov         dword ptr [ebp-38],eax
 00527F45    test        bl,bl
>00527F47    je          00527F5D
 00527F49    mov         eax,dword ptr [ebp-4]
 00527F4C    mov         eax,dword ptr [eax+3F0];TmwCustomEdit.fTSearch:TmwEditSearch
 00527F52    call        005100C4
 00527F57    dec         eax
 00527F58    mov         dword ptr [ebp-34],eax
>00527F5B    jmp         00527F62
 00527F5D    xor         eax,eax
 00527F5F    mov         dword ptr [ebp-34],eax
 00527F62    cmp         dword ptr [ebp-38],0
>00527F66    jle         005280B5
 00527F6C    mov         eax,dword ptr [ebp-4]
 00527F6F    mov         eax,dword ptr [eax+3F0];TmwCustomEdit.fTSearch:TmwEditSearch
 00527F75    mov         edx,dword ptr [ebp-34]
 00527F78    call        0051009C
 00527F7D    mov         esi,eax
 00527F7F    test        bl,bl
>00527F81    je          00527F88
 00527F83    dec         dword ptr [ebp-34]
>00527F86    jmp         00527F8B
 00527F88    inc         dword ptr [ebp-34]
 00527F8B    dec         dword ptr [ebp-38]
 00527F8E    push        ebp
 00527F8F    mov         edx,dword ptr [ebp-2C]
 00527F92    add         edx,esi
 00527F94    mov         eax,esi
 00527F96    call        00527C68
 00527F9B    pop         ecx
 00527F9C    test        al,al
>00527F9E    je          005280AB
 00527FA4    inc         dword ptr [ebp-28]
 00527FA7    mov         dword ptr [ebp-0C],esi
 00527FAA    lea         edx,[ebp-0C]
 00527FAD    mov         eax,dword ptr [ebp-4]
 00527FB0    call        0051F7D8
 00527FB5    test        bl,bl
>00527FB7    je          00527FC7
 00527FB9    lea         edx,[ebp-0C]
 00527FBC    mov         eax,dword ptr [ebp-4]
 00527FBF    mov         ecx,dword ptr [eax]
 00527FC1    call        dword ptr [ecx+110];TmwCustomEdit.sub_0051FBE0
 00527FC7    mov         eax,dword ptr [ebp-2C]
 00527FCA    add         dword ptr [ebp-0C],eax
 00527FCD    lea         edx,[ebp-0C]
 00527FD0    mov         eax,dword ptr [ebp-4]
 00527FD3    call        0051F99C
 00527FD8    test        bl,bl
>00527FDA    jne         00527FEA
 00527FDC    lea         edx,[ebp-0C]
 00527FDF    mov         eax,dword ptr [ebp-4]
 00527FE2    mov         ecx,dword ptr [eax]
 00527FE4    call        dword ptr [ecx+110];TmwCustomEdit.sub_0051FBE0
 00527FEA    movzx       eax,byte ptr [ebp-3B]
 00527FEE    or          al,byte ptr [ebp-3C]
>00527FF1    jne         00527FFD
 00527FF3    call        @TryFinallyExit
>00527FF8    jmp         005280F8
 00527FFD    cmp         byte ptr [ebp-3A],0
>00528001    je          00528046
 00528003    mov         eax,dword ptr [ebp-4]
 00528006    cmp         word ptr [eax+3FA],0;TmwCustomEdit.?f3FA:word
>0052800E    je          00528046
 00528010    mov         byte ptr [ebp-3D],0
 00528014    mov         eax,dword ptr [ebp-24]
 00528017    push        eax
 00528018    mov         eax,dword ptr [ebp-8]
 0052801B    push        eax
 0052801C    push        esi
 0052801D    lea         eax,[ebp-3D]
 00528020    push        eax
 00528021    mov         edi,dword ptr [ebp-4]
 00528024    mov         ecx,dword ptr [ebp-20]
 00528027    mov         edx,dword ptr [ebp-4]
 0052802A    mov         eax,dword ptr [edi+3FC];TmwCustomEdit.?f3FC:dword
 00528030    call        dword ptr [edi+3F8];TmwCustomEdit.fOnReplaceText
 00528036    cmp         byte ptr [ebp-3D],0
>0052803A    jne         0052804A
 0052803C    call        @TryFinallyExit
>00528041    jmp         005280F8
 00528046    mov         byte ptr [ebp-3D],2
 0052804A    cmp         byte ptr [ebp-3D],1
>0052804E    je          00528077
 00528050    cmp         byte ptr [ebp-3D],3
>00528054    jne         0052806C
 00528056    cmp         byte ptr [ebp-3C],0
>0052805A    jne         00528068
 0052805C    mov         byte ptr [ebp-3C],1
 00528060    mov         eax,dword ptr [ebp-4]
 00528063    call        0051CBE4
 00528068    mov         byte ptr [ebp-3A],0
 0052806C    mov         edx,dword ptr [ebp-24]
 0052806F    mov         eax,dword ptr [ebp-4]
 00528072    call        005276B8
 00528077    test        bl,bl
>00528079    jne         0052809E
 0052807B    mov         edx,dword ptr [ebp-30]
 0052807E    add         edx,esi
 00528080    mov         eax,dword ptr [ebp-4]
 00528083    call        0051FB70
 00528088    mov         ecx,dword ptr [ebp-2C]
 0052808B    sub         ecx,dword ptr [ebp-30]
 0052808E    mov         eax,dword ptr [ebp-4]
 00528091    mov         eax,dword ptr [eax+3F0];TmwCustomEdit.fTSearch:TmwEditSearch
 00528097    mov         edx,esi
 00528099    call        TmwEditSearch.FixResults
 0052809E    cmp         byte ptr [ebp-3C],0
>005280A2    jne         005280AB
 005280A4    call        @TryFinallyExit
>005280A9    jmp         005280F8
 005280AB    cmp         dword ptr [ebp-38],0
>005280AF    jg          00527F6C
 005280B5    test        bl,bl
>005280B7    je          005280BE
 005280B9    dec         dword ptr [ebp-8]
>005280BC    jmp         005280C1
 005280BE    inc         dword ptr [ebp-8]
 005280C1    mov         eax,dword ptr [ebp-8]
 005280C4    cmp         eax,dword ptr [ebp-10]
>005280C7    jl          005280D5
 005280C9    mov         eax,dword ptr [ebp-8]
 005280CC    cmp         eax,dword ptr [ebp-18]
>005280CF    jle         00527F1C
 005280D5    xor         eax,eax
 005280D7    pop         edx
 005280D8    pop         ecx
 005280D9    pop         ecx
 005280DA    mov         dword ptr fs:[eax],edx
 005280DD    push        5280F8
 005280E2    cmp         byte ptr [ebp-3C],0
>005280E6    je          005280F0
 005280E8    mov         eax,dword ptr [ebp-4]
 005280EB    call        0051C458
 005280F0    ret
>005280F1    jmp         @HandleFinally
>005280F6    jmp         005280E2
 005280F8    xor         eax,eax
 005280FA    pop         edx
 005280FB    pop         ecx
 005280FC    pop         ecx
 005280FD    mov         dword ptr fs:[eax],edx
 00528100    push        52812D
 00528105    lea         eax,[ebp-5C]
 00528108    call        @UStrClr
 0052810D    lea         eax,[ebp-58]
 00528110    call        @LStrClr
 00528115    lea         eax,[ebp-54]
 00528118    call        @UStrClr
 0052811D    lea         eax,[ebp-4C]
 00528120    call        @UStrClr
 00528125    ret
>00528126    jmp         @HandleFinally
>0052812B    jmp         00528105
 0052812D    mov         eax,dword ptr [ebp-28]
 00528130    pop         edi
 00528131    pop         esi
 00528132    pop         ebx
 00528133    mov         esp,ebp
 00528135    pop         ebp
 00528136    ret         4
*}
end;

//0052813C
{*function sub_0052813C(?:TmwCustomEdit; ?:?):?;
begin
 0052813C    push        ebx
 0052813D    push        esi
 0052813E    push        edi
 0052813F    add         esp,0FFFFFFE8
 00528142    mov         esi,edx
 00528144    lea         edi,[esp]
 00528147    movs        dword ptr [edi],dword ptr [esi]
 00528148    movs        dword ptr [edi],dword ptr [esi]
 00528149    mov         ebx,eax
 0052814B    lea         edx,[esp+8]
 0052814F    mov         eax,ebx
 00528151    call        0051C570
 00528156    lea         edx,[esp+10]
 0052815A    mov         eax,ebx
 0052815C    call        0051C5CC
 00528161    mov         eax,dword ptr [esp+4]
 00528165    cmp         eax,dword ptr [esp+0C]
>00528169    jl          00528214
 0052816F    cmp         eax,dword ptr [esp+14]
>00528173    jg          00528214
 00528179    mov         eax,dword ptr [esp+0C]
 0052817D    cmp         eax,dword ptr [esp+14]
>00528181    jne         00528191
 00528183    mov         eax,dword ptr [esp+8]
 00528187    cmp         eax,dword ptr [esp+10]
>0052818B    je          00528214
 00528191    movzx       eax,byte ptr [ebx+390];TmwCustomEdit.fSelectionMode:TSelectionMode
 00528198    cmp         al,2
>0052819A    jne         005281A0
 0052819C    mov         al,1
>0052819E    jmp         00528216
 005281A0    cmp         al,1
>005281A2    jne         005281E6
 005281A4    mov         edx,dword ptr [esp+10]
 005281A8    mov         eax,dword ptr [esp+8]
 005281AC    cmp         edx,eax
>005281AE    jge         005281C7
 005281B0    mov         eax,dword ptr [esp]
 005281B3    cmp         eax,dword ptr [esp+10]
>005281B7    jl          005281BF
 005281B9    cmp         eax,dword ptr [esp+8]
>005281BD    jl          005281C3
 005281BF    xor         eax,eax
>005281C1    jmp         00528216
 005281C3    mov         al,1
>005281C5    jmp         00528216
 005281C7    cmp         edx,eax
>005281C9    jle         005281E2
 005281CB    mov         eax,dword ptr [esp]
 005281CE    cmp         eax,dword ptr [esp+8]
>005281D2    jl          005281DA
 005281D4    cmp         eax,dword ptr [esp+10]
>005281D8    jl          005281DE
 005281DA    xor         eax,eax
>005281DC    jmp         00528216
 005281DE    mov         al,1
>005281E0    jmp         00528216
 005281E2    xor         eax,eax
>005281E4    jmp         00528216
 005281E6    mov         eax,dword ptr [esp+4]
 005281EA    cmp         eax,dword ptr [esp+0C]
>005281EE    jg          005281F9
 005281F0    mov         eax,dword ptr [esp]
 005281F3    cmp         eax,dword ptr [esp+8]
>005281F7    jl          0052820C
 005281F9    mov         eax,dword ptr [esp+4]
 005281FD    cmp         eax,dword ptr [esp+14]
>00528201    jl          00528210
 00528203    mov         eax,dword ptr [esp]
 00528206    cmp         eax,dword ptr [esp+10]
>0052820A    jl          00528210
 0052820C    xor         eax,eax
>0052820E    jmp         00528216
 00528210    mov         al,1
>00528212    jmp         00528216
 00528214    xor         eax,eax
 00528216    add         esp,18
 00528219    pop         edi
 0052821A    pop         esi
 0052821B    pop         ebx
 0052821C    ret
end;*}

//00528220
procedure TmwCustomEdit.WMSetCursor(Message:TWMSetCursor);
begin
{*
 00528220    push        ebx
 00528221    push        esi
 00528222    add         esp,0FFFFFFE8
 00528225    mov         esi,edx
 00528227    mov         ebx,eax
 00528229    push        esp
 0052822A    call        user32.GetCursorPos
 0052822F    lea         ecx,[esp+10]
 00528233    mov         edx,esp
 00528235    mov         eax,ebx
 00528237    call        TControl.ScreenToClient
 0052823C    mov         eax,dword ptr [esp+10]
 00528240    mov         dword ptr [esp],eax
 00528243    mov         eax,dword ptr [esp+14]
 00528247    mov         dword ptr [esp+4],eax
 0052824B    mov         eax,dword ptr [esp]
 0052824E    cmp         eax,dword ptr [ebx+29C];TmwCustomEdit.fGutterWidth:Integer
>00528254    jge         00528274
 00528256    mov         eax,dword ptr [ebx+3A4];TmwCustomEdit.fGutter:TmwGutter
 0052825C    movsx       edx,word ptr [eax+28];TmwGutter.fCursor:TCursor
 00528260    mov         eax,[0078DB00];^Screen:TScreen
 00528265    mov         eax,dword ptr [eax]
 00528267    call        TScreen.GetCursors
 0052826C    push        eax
 0052826D    call        user32.SetCursor
>00528272    jmp         005282E9
 00528274    mov         eax,ebx
 00528276    call        0051C6C0
 0052827B    imul        dword ptr [ebx+294];TmwCustomEdit.fCharWidth:Integer
 00528281    add         eax,dword ptr [esp]
 00528284    sub         eax,dword ptr [ebx+29C]
 0052828A    sub         eax,2
 0052828D    cdq
 0052828E    idiv        eax,dword ptr [ebx+294];TmwCustomEdit.fCharWidth:Integer
 00528294    mov         dword ptr [esp+8],eax
 00528298    mov         eax,ebx
 0052829A    call        0051CBB4
 0052829F    mov         ecx,eax
 005282A1    mov         eax,dword ptr [esp+4]
 005282A5    cdq
 005282A6    idiv        eax,dword ptr [ebx+2C8];TmwCustomEdit.fTextHeight:Integer
 005282AC    add         ecx,eax
 005282AE    mov         dword ptr [esp+0C],ecx
 005282B2    test        byte ptr [ebx+3CE],2;TmwCustomEdit.fOptions:TmwEditorOptions
>005282B9    je          005282E0
 005282BB    lea         edx,[esp+8]
 005282BF    mov         eax,ebx
 005282C1    call        0052813C
 005282C6    test        al,al
>005282C8    je          005282E0
 005282CA    mov         eax,[0078DB00];^Screen:TScreen
 005282CF    mov         eax,dword ptr [eax]
 005282D1    xor         edx,edx
 005282D3    call        TScreen.GetCursors
 005282D8    push        eax
 005282D9    call        user32.SetCursor
>005282DE    jmp         005282E9
 005282E0    mov         edx,esi
 005282E2    mov         eax,ebx
 005282E4    call        TWinControl.WMSetCursor
 005282E9    add         esp,18
 005282EC    pop         esi
 005282ED    pop         ebx
 005282EE    ret
*}
end;

//005282FC
procedure TmwCustomEdit.SetOptions(Value:TmwEditorOptions);
begin
{*
 005282FC    push        ebx
 005282FD    push        esi
 005282FE    push        ecx
 005282FF    mov         word ptr [esp],dx
 00528303    mov         esi,eax
 00528305    movzx       eax,word ptr [esi+3CE];TmwCustomEdit.fOptions:TmwEditorOptions
 0052830C    cmp         ax,word ptr [esp]
>00528310    je          0052837D
 00528312    test        byte ptr [esi+3CE],4;TmwCustomEdit.fOptions:TmwEditorOptions
 00528319    setne       al
 0052831C    test        byte ptr [esp],4
 00528320    setne       dl
 00528323    cmp         al,dl
 00528325    setne       bl
 00528328    movzx       eax,word ptr [esp]
 0052832C    mov         word ptr [esi+3CE],ax;TmwCustomEdit.fOptions:TmwEditorOptions
 00528333    test        byte ptr [esi+3CE],40;TmwCustomEdit.fOptions:TmwEditorOptions
>0052833A    jne         0052834C
 0052833C    mov         eax,esi
 0052833E    call        0051C628
 00528343    mov         edx,eax
 00528345    mov         eax,esi
 00528347    call        0051FB70
 0052834C    test        bl,bl
>0052834E    je          0052837D
 00528350    test        byte ptr [esi+1C],10;TmwCustomEdit.FComponentState:TComponentState
>00528354    jne         0052837D
 00528356    mov         eax,esi
 00528358    call        TWinControl.HandleAllocated
 0052835D    test        al,al
>0052835F    je          0052837D
 00528361    test        byte ptr [esi+3CE],4;TmwCustomEdit.fOptions:TmwEditorOptions
 00528368    setne       al
 0052836B    neg         al
 0052836D    sbb         eax,eax
 0052836F    push        eax
 00528370    mov         eax,esi
 00528372    call        TWinControl.GetHandle
 00528377    push        eax
 00528378    call        shell32.DragAcceptFiles
 0052837D    pop         edx
 0052837E    pop         esi
 0052837F    pop         ebx
 00528380    ret
*}
end;

//00528384
procedure TmwCustomEdit.SetOptionFlag(Flag:TmwEditorOption; Value:Boolean);
begin
{*
 00528384    push        ebx
 00528385    push        esi
 00528386    push        ecx
 00528387    mov         byte ptr [esp],cl
 0052838A    mov         ebx,edx
 0052838C    mov         esi,eax
 0052838E    mov         eax,ebx
 00528390    cmp         al,0F
>00528392    ja          0052839F
 00528394    and         eax,7F
 00528397    bt          word ptr [esi+3CE],ax;TmwCustomEdit.fOptions:TmwEditorOptions
 0052839F    setb        al
 005283A2    cmp         al,byte ptr [esp]
>005283A5    je          00528417
 005283A7    cmp         byte ptr [esp],0
>005283AB    je          005283C0
 005283AD    mov         eax,ebx
 005283AF    cmp         al,0F
>005283B1    ja          005283D1
 005283B3    and         eax,7F
 005283B6    bts         word ptr [esi+3CE],ax;TmwCustomEdit.fOptions:TmwEditorOptions
>005283BE    jmp         005283D1
 005283C0    mov         eax,ebx
 005283C2    cmp         al,0F
>005283C4    ja          005283D1
 005283C6    and         eax,7F
 005283C9    btr         word ptr [esi+3CE],ax;TmwCustomEdit.fOptions:TmwEditorOptions
 005283D1    cmp         bl,6
>005283D4    jne         005283EC
 005283D6    cmp         byte ptr [esp],0
>005283DA    jne         005283EC
 005283DC    mov         eax,esi
 005283DE    call        0051C628
 005283E3    mov         edx,eax
 005283E5    mov         eax,esi
 005283E7    call        0051FB70
 005283EC    cmp         bl,2
>005283EF    jne         00528417
 005283F1    test        byte ptr [esi+1C],10;TmwCustomEdit.FComponentState:TComponentState
>005283F5    jne         00528417
 005283F7    mov         eax,esi
 005283F9    call        TWinControl.HandleAllocated
 005283FE    test        al,al
>00528400    je          00528417
 00528402    cmp         byte ptr [esp],1
 00528406    cmc
 00528407    sbb         eax,eax
 00528409    push        eax
 0052840A    mov         eax,esi
 0052840C    call        TWinControl.GetHandle
 00528411    push        eax
 00528412    call        shell32.DragAcceptFiles
 00528417    pop         edx
 00528418    pop         esi
 00528419    pop         ebx
 0052841A    ret
*}
end;

//0052841C
{*procedure sub_0052841C(?:TmwCustomEdit; ?:?);
begin
 0052841C    push        ebx
 0052841D    push        esi
 0052841E    mov         ebx,edx
 00528420    mov         esi,eax
 00528422    mov         eax,esi
 00528424    call        TWinControl.HandleAllocated
 00528429    test        al,al
>0052842B    je          005284B2
 00528431    mov         eax,esi
 00528433    call        TControl.GetClientWidth
 00528438    sub         eax,dword ptr [esi+29C]
 0052843E    sub         eax,2
 00528441    cdq
 00528442    idiv        eax,dword ptr [esi+294];TmwCustomEdit.fCharWidth:Integer
 00528448    mov         dword ptr [esi+290],eax;TmwCustomEdit.fCharsInWindow:Integer
 0052844E    mov         eax,esi
 00528450    call        TControl.GetClientHeight
 00528455    cdq
 00528456    idiv        eax,dword ptr [esi+2C8];TmwCustomEdit.fTextHeight:Integer
 0052845C    mov         dword ptr [esi+2A8],eax;TmwCustomEdit.fLinesInWindow:Integer
 00528462    test        bl,bl
>00528464    je          005284A1
 00528466    mov         eax,dword ptr [esi+3A4];TmwCustomEdit.fGutter:TmwGutter
 0052846C    cmp         byte ptr [eax+0C],0;TmwGutter.fShowLineNumbers:Boolean
>00528470    je          0052847D
 00528472    mov         edx,esi
 00528474    mov         eax,esi
 00528476    call        00527830
>0052847B    jmp         00528486
 0052847D    xor         edx,edx
 0052847F    mov         eax,esi
 00528481    call        00521064
 00528486    mov         eax,esi
 00528488    call        005232D8
 0052848D    and         word ptr [esi+3CC],0FFFFFFFE;TmwCustomEdit.fStateFlags:TmwStateFlags
 00528495    mov         eax,esi
 00528497    mov         edx,dword ptr [eax]
 00528499    call        dword ptr [edx+90];TWinControl.Invalidate
>0052849F    jmp         005284AA
 005284A1    xor         edx,edx
 005284A3    mov         eax,esi
 005284A5    call        00521064
 005284AA    and         word ptr [esi+3CC],0FFFFFFFD;TmwCustomEdit.fStateFlags:TmwStateFlags
 005284B2    pop         esi
 005284B3    pop         ebx
 005284B4    ret
end;*}

//005284B8
{*procedure sub_005284B8(?:TmwCustomEdit; ?:Integer; ?:?);
begin
 005284B8    push        ebp
 005284B9    mov         ebp,esp
 005284BB    add         esp,0FFFFFFDC
 005284BE    push        ebx
 005284BF    push        esi
 005284C0    push        edi
 005284C1    xor         ebx,ebx
 005284C3    mov         dword ptr [ebp-20],ebx
 005284C6    mov         dword ptr [ebp-4],ebx
 005284C9    mov         byte ptr [ebp-5],cl
 005284CC    mov         esi,edx
 005284CE    mov         ebx,eax
 005284D0    xor         eax,eax
 005284D2    push        ebp
 005284D3    push        5285E5
 005284D8    push        dword ptr fs:[eax]
 005284DB    mov         dword ptr fs:[eax],esp
 005284DE    lea         edx,[ebp-10]
 005284E1    mov         eax,ebx
 005284E3    call        0051FBB8
 005284E8    mov         eax,dword ptr [ebp-10]
 005284EB    mov         dword ptr [ebp-18],eax
 005284EE    mov         eax,dword ptr [ebp-0C]
 005284F1    mov         dword ptr [ebp-14],eax
 005284F4    lea         edx,[ebp-4]
 005284F7    mov         eax,ebx
 005284F9    call        0051C6C8
 005284FE    mov         eax,dword ptr [ebp-4]
 00528501    test        eax,eax
>00528503    je          0052850A
 00528505    sub         eax,4
 00528508    mov         eax,dword ptr [eax]
 0052850A    mov         edi,eax
 0052850C    test        byte ptr [ebx+3CE],40;TmwCustomEdit.fOptions:TmwEditorOptions
 00528513    setne       al
 00528516    xor         al,1
 00528518    mov         byte ptr [ebp-19],al
 0052851B    cmp         byte ptr [ebp-19],0
>0052851F    je          0052855F
 00528521    cmp         esi,0FFFFFFFF
>00528524    jne         0052855F
 00528526    cmp         dword ptr [ebp-10],1
>0052852A    jne         0052855F
 0052852C    cmp         dword ptr [ebp-0C],1
>00528530    jle         0052855F
 00528532    dec         dword ptr [ebp-14]
 00528535    lea         ecx,[ebp-20]
 00528538    mov         edx,dword ptr [ebp-14]
 0052853B    dec         edx
 0052853C    mov         eax,dword ptr [ebx+2A4];TmwCustomEdit.fLines:TStrings
 00528542    mov         esi,dword ptr [eax]
 00528544    call        dword ptr [esi+0C];TStrings.Get
 00528547    mov         eax,dword ptr [ebp-20]
 0052854A    mov         dword ptr [ebp-24],eax
 0052854D    mov         eax,dword ptr [ebp-24]
 00528550    test        eax,eax
>00528552    je          00528559
 00528554    sub         eax,4
 00528557    mov         eax,dword ptr [eax]
 00528559    inc         eax
 0052855A    mov         dword ptr [ebp-18],eax
>0052855D    jmp         005285B5
 0052855F    cmp         byte ptr [ebp-19],0
>00528563    je          0052858B
 00528565    cmp         esi,1
>00528568    jne         0052858B
 0052856A    cmp         edi,dword ptr [ebp-10]
>0052856D    jge         0052858B
 0052856F    mov         eax,dword ptr [ebx+2A4];TmwCustomEdit.fLines:TStrings
 00528575    mov         edx,dword ptr [eax]
 00528577    call        dword ptr [edx+14];TStrings.GetCount
 0052857A    cmp         eax,dword ptr [ebp-0C]
>0052857D    jle         0052858B
 0052857F    inc         dword ptr [ebp-14]
 00528582    mov         dword ptr [ebp-18],1
>00528589    jmp         005285B5
 0052858B    mov         edx,dword ptr [ebp-18]
 0052858E    add         edx,esi
 00528590    mov         eax,1
 00528595    call        00510484
 0052859A    mov         dword ptr [ebp-18],eax
 0052859D    test        esi,esi
 0052859F    setg        al
 005285A2    and         al,byte ptr [ebp-19]
>005285A5    je          005285B5
 005285A7    lea         edx,[edi+1]
 005285AA    mov         eax,dword ptr [ebp-18]
 005285AD    call        0051048C
 005285B2    mov         dword ptr [ebp-18],eax
 005285B5    movzx       eax,byte ptr [ebp-5]
 005285B9    push        eax
 005285BA    lea         ecx,[ebp-18]
 005285BD    lea         edx,[ebp-10]
 005285C0    mov         eax,ebx
 005285C2    call        00528678
 005285C7    xor         eax,eax
 005285C9    pop         edx
 005285CA    pop         ecx
 005285CB    pop         ecx
 005285CC    mov         dword ptr fs:[eax],edx
 005285CF    push        5285EC
 005285D4    lea         eax,[ebp-20]
 005285D7    call        @UStrClr
 005285DC    lea         eax,[ebp-4]
 005285DF    call        @UStrClr
 005285E4    ret
>005285E5    jmp         @HandleFinally
>005285EA    jmp         005285D4
 005285EC    pop         edi
 005285ED    pop         esi
 005285EE    pop         ebx
 005285EF    mov         esp,ebp
 005285F1    pop         ebp
 005285F2    ret
end;*}

//005285F4
{*procedure sub_005285F4(?:TmwCustomEdit; ?:?; ?:?);
begin
 005285F4    push        ebx
 005285F5    push        esi
 005285F6    push        edi
 005285F7    add         esp,0FFFFFFF0
 005285FA    mov         ebx,ecx
 005285FC    mov         esi,edx
 005285FE    mov         edi,eax
 00528600    mov         edx,esp
 00528602    mov         eax,edi
 00528604    call        0051FBB8
 00528609    mov         eax,dword ptr [esp]
 0052860C    mov         dword ptr [esp+8],eax
 00528610    mov         eax,dword ptr [esp+4]
 00528614    mov         dword ptr [esp+0C],eax
 00528618    add         dword ptr [esp+0C],esi
 0052861C    test        esi,esi
>0052861E    jl          0052864A
 00528620    mov         eax,dword ptr [edi+2A4];TmwCustomEdit.fLines:TStrings
 00528626    mov         edx,dword ptr [eax]
 00528628    call        dword ptr [edx+14];TStrings.GetCount
 0052862B    mov         esi,dword ptr [esp+0C]
 0052862F    cmp         eax,esi
>00528631    jl          00528639
 00528633    cmp         esi,dword ptr [esp+4]
>00528637    jge         00528661
 00528639    mov         eax,dword ptr [edi+2A4];TmwCustomEdit.fLines:TStrings
 0052863F    mov         edx,dword ptr [eax]
 00528641    call        dword ptr [edx+14];TStrings.GetCount
 00528644    mov         dword ptr [esp+0C],eax
>00528648    jmp         00528661
 0052864A    mov         eax,dword ptr [esp+0C]
 0052864E    cmp         eax,1
>00528651    jl          00528659
 00528653    cmp         eax,dword ptr [esp+4]
>00528657    jle         00528661
 00528659    mov         dword ptr [esp+0C],1
 00528661    push        ebx
 00528662    lea         ecx,[esp+0C]
 00528666    lea         edx,[esp+4]
 0052866A    mov         eax,edi
 0052866C    call        00528678
 00528671    add         esp,10
 00528674    pop         edi
 00528675    pop         esi
 00528676    pop         ebx
 00528677    ret
end;*}

//00528678
{*procedure sub_00528678(?:TmwCustomEdit; ?:TPoint; ?:Pointer; ?:?);
begin
 00528678    push        ebp
 00528679    mov         ebp,esp
 0052867B    add         esp,0FFFFFFF0
 0052867E    push        esi
 0052867F    push        edi
 00528680    mov         esi,ecx
 00528682    lea         edi,[ebp-10]
 00528685    movs        dword ptr [edi],dword ptr [esi]
 00528686    movs        dword ptr [edi],dword ptr [esi]
 00528687    mov         esi,edx
 00528689    lea         edi,[ebp-8]
 0052868C    movs        dword ptr [edi],dword ptr [esi]
 0052868D    movs        dword ptr [edi],dword ptr [esi]
 0052868E    mov         esi,eax
 00528690    cmp         byte ptr [ebp+8],0
>00528694    je          005286B7
 00528696    mov         eax,esi
 00528698    call        0051C710
 0052869D    test        al,al
>0052869F    jne         005286AB
 005286A1    lea         edx,[ebp-8]
 005286A4    mov         eax,esi
 005286A6    call        0051F7D8
 005286AB    lea         edx,[ebp-10]
 005286AE    mov         eax,esi
 005286B0    call        0051F99C
>005286B5    jmp         005286C1
 005286B7    lea         edx,[ebp-10]
 005286BA    mov         eax,esi
 005286BC    call        0051F7D8
 005286C1    lea         edx,[ebp-10]
 005286C4    mov         eax,esi
 005286C6    mov         ecx,dword ptr [eax]
 005286C8    call        dword ptr [ecx+110];TmwCustomEdit.sub_0051FBE0
 005286CE    pop         edi
 005286CF    pop         esi
 005286D0    mov         esp,ebp
 005286D2    pop         ebp
 005286D3    ret         4
end;*}

//005286D8
{*function sub_005286D8(?:?; ?:?):Boolean;
begin
 005286D8    push        ebp
 005286D9    mov         ebp,esp
 005286DB    push        ebx
 005286DC    push        esi
 005286DD    push        edi
 005286DE    mov         ebx,eax
 005286E0    mov         eax,dword ptr [ebp+8]
 005286E3    mov         eax,dword ptr [eax-4]
 005286E6    mov         esi,dword ptr [eax+2D4]
 005286EC    test        esi,esi
>005286EE    je          00528736
 005286F0    mov         eax,dword ptr [ebp+8]
 005286F3    mov         eax,esi
 005286F5    mov         edx,dword ptr [eax]
 005286F7    call        dword ptr [edx+38]
 005286FA    mov         edi,eax
 005286FC    dec         edi
 005286FD    test        edi,edi
>005286FF    jl          00528732
 00528701    inc         edi
 00528702    xor         esi,esi
 00528704    mov         eax,dword ptr [ebp+8]
 00528707    mov         eax,dword ptr [eax-4]
 0052870A    mov         eax,dword ptr [eax+2D4]
 00528710    mov         edx,esi
 00528712    mov         ecx,dword ptr [eax]
 00528714    call        dword ptr [ecx+3C]
 00528717    mov         edx,ebx
 00528719    cmp         dl,7
>0052871C    ja          00528728
 0052871E    and         edx,7F
 00528721    movzx       eax,byte ptr [eax+0C]
 00528725    bt          eax,edx
>00528728    jae         0052872E
 0052872A    mov         al,1
>0052872C    jmp         00528758
 0052872E    inc         esi
 0052872F    dec         edi
>00528730    jne         00528704
 00528732    xor         eax,eax
>00528734    jmp         00528758
 00528736    mov         eax,dword ptr [ebp+8]
 00528739    mov         eax,dword ptr [eax-4]
 0052873C    call        TmwCustomEdit.GetFont
 00528741    mov         edx,eax
 00528743    mov         eax,dword ptr [edx+10]
 00528746    movzx       eax,byte ptr [eax+21]
 0052874A    cmp         bl,7
>0052874D    ja          00528755
 0052874F    and         ebx,7F
 00528752    bt          eax,ebx
 00528755    setb        al
 00528758    pop         edi
 00528759    pop         esi
 0052875A    pop         ebx
 0052875B    pop         ebp
 0052875C    ret
end;*}

//00528760
procedure sub_00528760(?:TmwCustomEdit);
begin
{*
 00528760    push        ebp
 00528761    mov         ebp,esp
 00528763    push        ecx
 00528764    push        ebx
 00528765    mov         dword ptr [ebp-4],eax
 00528768    mov         eax,dword ptr [ebp-4]
 0052876B    mov         ebx,dword ptr [eax+3B8];TmwCustomEdit.fTextDrawer:TheTextDrawer
 00528771    mov         eax,dword ptr [ebp-4]
 00528774    call        TmwCustomEdit.GetFont
 00528779    mov         edx,eax
 0052877B    mov         eax,ebx
 0052877D    mov         ecx,dword ptr [eax]
 0052877F    call        dword ptr [ecx+28];TheTextDrawer.SetBaseFont
 00528782    push        ebp
 00528783    mov         al,1
 00528785    call        005286D8
 0052878A    pop         ecx
 0052878B    and         eax,7F
 0052878E    movzx       edx,byte ptr [eax+786C3D]
 00528795    mov         eax,ebx
 00528797    mov         ecx,dword ptr [eax]
 00528799    call        dword ptr [ecx+2C];TheTextDrawer.SetBaseStyle
 0052879C    mov         eax,ebx
 0052879E    mov         edx,dword ptr [eax]
 005287A0    call        dword ptr [edx+14];TheTextDrawer.GetCharHeight
 005287A3    mov         edx,dword ptr [ebp-4]
 005287A6    add         eax,dword ptr [edx+380];TmwCustomEdit.fExtraLineSpacing:Integer
 005287AC    mov         edx,dword ptr [ebp-4]
 005287AF    mov         dword ptr [edx+2C8],eax;TmwCustomEdit.fTextHeight:Integer
 005287B5    push        ebp
 005287B6    xor         eax,eax
 005287B8    call        005286D8
 005287BD    pop         ecx
 005287BE    and         eax,7F
 005287C1    movzx       edx,byte ptr [eax+786C3B]
 005287C8    mov         eax,ebx
 005287CA    mov         ecx,dword ptr [eax]
 005287CC    call        dword ptr [ecx+2C];TheTextDrawer.SetBaseStyle
 005287CF    mov         eax,ebx
 005287D1    mov         edx,dword ptr [eax]
 005287D3    call        dword ptr [edx+10];TheTextDrawer.GetCharWidth
 005287D6    mov         edx,dword ptr [ebp-4]
 005287D9    mov         dword ptr [edx+294],eax;TmwCustomEdit.fCharWidth:Integer
 005287DF    pop         ebx
 005287E0    pop         ecx
 005287E1    pop         ebp
 005287E2    ret
*}
end;

//005287FC
{*procedure sub_005287FC(?:TmwCustomEdit; ?:?);
begin
 005287FC    push        ebx
 005287FD    push        ecx
 005287FE    mov         byte ptr [esp],dl
 00528801    mov         ebx,eax
 00528803    movzx       eax,byte ptr [esp]
 00528807    or          al,byte ptr [ebx+3D4];TmwCustomEdit.fStatusChanges:TmwStatusChanges
 0052880D    mov         byte ptr [ebx+3D4],al;TmwCustomEdit.fStatusChanges:TmwStatusChanges
 00528813    cmp         dword ptr [ebx+2B4],0;TmwCustomEdit.fPaintLock:Integer
>0052881A    jne         00528848
 0052881C    cmp         word ptr [ebx+3DA],0;TmwCustomEdit.?f3DA:word
>00528824    je          00528848
 00528826    movzx       ecx,byte ptr [ebx+3D4];TmwCustomEdit.fStatusChanges:TmwStatusChanges
 0052882D    mov         edx,ebx
 0052882F    mov         eax,dword ptr [ebx+3DC];TmwCustomEdit.?f3DC:dword
 00528835    call        dword ptr [ebx+3D8];TmwCustomEdit.fOnStatusChange
 0052883B    movzx       eax,byte ptr ds:[52884C];0x0 gvar_0052884C
 00528842    mov         byte ptr [ebx+3D4],al;TmwCustomEdit.fStatusChanges:TmwStatusChanges
 00528848    pop         edx
 00528849    pop         ebx
 0052884A    ret
end;*}

//00528850
procedure sub_00528850(?:TmwCustomEdit);
begin
{*
 00528850    push        ebp
 00528851    mov         ebp,esp
 00528853    mov         ecx,6
 00528858    push        0
 0052885A    push        0
 0052885C    dec         ecx
>0052885D    jne         00528858
 0052885F    push        ebx
 00528860    push        esi
 00528861    push        edi
 00528862    mov         ebx,eax
 00528864    xor         eax,eax
 00528866    push        ebp
 00528867    push        528A6A
 0052886C    push        dword ptr fs:[eax]
 0052886F    mov         dword ptr fs:[eax],esp
 00528872    xor         esi,esi
 00528874    test        byte ptr [ebx+3CF],2;TmwCustomEdit.?f3CF:byte
>0052887B    je          00528911
 00528881    mov         eax,ebx
 00528883    call        0051C660
 00528888    dec         eax
 00528889    mov         dword ptr [ebp-18],eax
 0052888C    cmp         dword ptr [ebp-18],0
>00528890    jle         00528911
 00528892    mov         eax,dword ptr [ebx+2A4];TmwCustomEdit.fLines:TStrings
 00528898    mov         edx,dword ptr [eax]
 0052889A    call        dword ptr [edx+14];TStrings.GetCount
 0052889D    cmp         eax,dword ptr [ebp-18]
>005288A0    jle         00528911
 005288A2    dec         dword ptr [ebp-18]
 005288A5    mov         eax,ebx
 005288A7    call        0051C628
 005288AC    mov         dword ptr [ebp-14],eax
 005288AF    lea         ecx,[ebp-4]
 005288B2    mov         edx,dword ptr [ebp-18]
 005288B5    mov         eax,dword ptr [ebx+2A4];TmwCustomEdit.fLines:TStrings
 005288BB    mov         edi,dword ptr [eax]
 005288BD    call        dword ptr [edi+0C];TStrings.Get
 005288C0    mov         eax,dword ptr [ebp-4]
 005288C3    test        eax,eax
>005288C5    je          005288CC
 005288C7    sub         eax,4
 005288CA    mov         eax,dword ptr [eax]
 005288CC    cmp         eax,dword ptr [ebp-14]
>005288CF    jl          00528908
 005288D1    lea         eax,[ebp-4]
 005288D4    call        @UniqueStringU
 005288D9    mov         edx,dword ptr [ebp-14]
 005288DC    lea         eax,[eax+edx*2-2]
 005288E0    cmp         word ptr [eax],20
>005288E4    je          005288F0
 005288E6    inc         esi
 005288E7    add         eax,2
 005288EA    cmp         word ptr [eax],0
>005288EE    jne         005288E0
 005288F0    cmp         word ptr [eax],0
>005288F4    je          00528911
 005288F6    cmp         word ptr [eax],20
>005288FA    jne         00528911
 005288FC    inc         esi
 005288FD    add         eax,2
 00528900    cmp         word ptr [eax],0
>00528904    jne         005288F6
>00528906    jmp         00528911
 00528908    dec         dword ptr [ebp-18]
 0052890B    cmp         dword ptr [ebp-18],0
>0052890F    jge         005288AF
 00528911    test        esi,esi
>00528913    jne         00528934
 00528915    mov         eax,ebx
 00528917    call        0051C628
 0052891C    dec         eax
 0052891D    mov         edi,dword ptr [ebx+3A8];TmwCustomEdit.fTabWidth:Integer
 00528923    cdq
 00528924    idiv        eax,edi
 00528926    mov         esi,dword ptr [ebx+3A8];TmwCustomEdit.fTabWidth:Integer
 0052892C    sub         esi,edx
 0052892E    test        esi,esi
>00528930    jne         00528934
 00528932    mov         esi,edi
 00528934    lea         ecx,[ebp-8]
 00528937    mov         edx,esi
 00528939    mov         ax,20
 0052893D    call        StringOfChar
 00528942    mov         eax,ebx
 00528944    call        0051C710
 00528949    test        al,al
>0052894B    je          00528982
 0052894D    lea         eax,[ebx+280];TmwCustomEdit.fBlockEnd:TPoint
 00528953    push        eax
 00528954    lea         edx,[ebp-1C]
 00528957    mov         eax,ebx
 00528959    call        0051C7FC
 0052895E    mov         eax,dword ptr [ebp-1C]
 00528961    call        @UStrToPWChar
 00528966    push        eax
 00528967    movzx       eax,byte ptr [ebx+390];TmwCustomEdit.fSelectionMode:TSelectionMode
 0052896E    push        eax
 0052896F    lea         ecx,[ebx+278];TmwCustomEdit.fBlockBegin:TPoint
 00528975    mov         dl,4
 00528977    mov         eax,dword ptr [ebx+2DC];TmwCustomEdit.fUndoList:TUndoList
 0052897D    call        TUndoList.AddChange
 00528982    mov         eax,dword ptr [ebx+278];TmwCustomEdit.fBlockBegin:TPoint
 00528988    mov         dword ptr [ebp-10],eax
 0052898B    mov         eax,dword ptr [ebx+27C]
 00528991    mov         dword ptr [ebp-0C],eax
 00528994    mov         edx,dword ptr [ebp-8]
 00528997    mov         eax,ebx
 00528999    call        0052008C
 0052899E    mov         eax,ebx
 005289A0    call        0051C660
 005289A5    mov         esi,eax
 005289A7    dec         esi
 005289A8    lea         ecx,[ebp-24]
 005289AB    mov         edx,esi
 005289AD    mov         eax,dword ptr [ebx+2A4];TmwCustomEdit.fLines:TStrings
 005289B3    mov         edi,dword ptr [eax]
 005289B5    call        dword ptr [edi+0C];TStrings.Get
 005289B8    mov         eax,dword ptr [ebp-24]
 005289BB    lea         edx,[ebp-20]
 005289BE    call        TrimRight
 005289C3    mov         ecx,dword ptr [ebp-20]
 005289C6    mov         edx,esi
 005289C8    mov         eax,dword ptr [ebx+2A4];TmwCustomEdit.fLines:TStrings
 005289CE    mov         edi,dword ptr [eax]
 005289D0    call        dword ptr [edi+20];TStrings.Put
 005289D3    mov         eax,ebx
 005289D5    call        TmwCustomEdit.EnsureCursorPosVisible
 005289DA    lea         ecx,[ebp-28]
 005289DD    mov         edx,esi
 005289DF    mov         eax,dword ptr [ebx+2A4];TmwCustomEdit.fLines:TStrings
 005289E5    mov         esi,dword ptr [eax]
 005289E7    call        dword ptr [esi+0C];TStrings.Get
 005289EA    mov         eax,dword ptr [ebp-28]
 005289ED    mov         dword ptr [ebp-2C],eax
 005289F0    mov         eax,dword ptr [ebp-2C]
 005289F3    test        eax,eax
>005289F5    je          005289FC
 005289F7    sub         eax,4
 005289FA    mov         eax,dword ptr [eax]
 005289FC    cmp         eax,dword ptr [ebp-10]
>005289FF    jl          00528A33
 00528A01    lea         eax,[ebx+278];TmwCustomEdit.fBlockBegin:TPoint
 00528A07    push        eax
 00528A08    lea         edx,[ebp-30]
 00528A0B    mov         eax,ebx
 00528A0D    call        0051C7FC
 00528A12    mov         eax,dword ptr [ebp-30]
 00528A15    call        @UStrToPWChar
 00528A1A    push        eax
 00528A1B    movzx       eax,byte ptr [ebx+390];TmwCustomEdit.fSelectionMode:TSelectionMode
 00528A22    push        eax
 00528A23    lea         ecx,[ebp-10]
 00528A26    xor         edx,edx
 00528A28    mov         eax,dword ptr [ebx+2DC];TmwCustomEdit.fUndoList:TUndoList
 00528A2E    call        TUndoList.AddChange
 00528A33    mov         eax,ebx
 00528A35    call        TmwCustomEdit.EnsureCursorPosVisible
 00528A3A    xor         eax,eax
 00528A3C    pop         edx
 00528A3D    pop         ecx
 00528A3E    pop         ecx
 00528A3F    mov         dword ptr fs:[eax],edx
 00528A42    push        528A71
 00528A47    lea         eax,[ebp-30]
 00528A4A    call        @UStrClr
 00528A4F    lea         eax,[ebp-28]
 00528A52    mov         edx,4
 00528A57    call        @UStrArrayClr
 00528A5C    lea         eax,[ebp-8]
 00528A5F    mov         edx,2
 00528A64    call        @UStrArrayClr
 00528A69    ret
>00528A6A    jmp         @HandleFinally
>00528A6F    jmp         00528A47
 00528A71    pop         edi
 00528A72    pop         esi
 00528A73    pop         ebx
 00528A74    mov         esp,ebp
 00528A76    pop         ebp
 00528A77    ret
*}
end;

//00528A78
procedure TmwCustomEdit.CreateWnd;
begin
{*
 00528A78    push        ebx
 00528A79    mov         ebx,eax
 00528A7B    mov         eax,ebx
 00528A7D    call        TWinControl.CreateWnd
 00528A82    test        byte ptr [ebx+3CE],4;TmwCustomEdit.fOptions:TmwEditorOptions
>00528A89    je          00528AA0
 00528A8B    test        byte ptr [ebx+1C],10;TmwCustomEdit.FComponentState:TComponentState
>00528A8F    jne         00528AA0
 00528A91    push        0FF
 00528A93    mov         eax,ebx
 00528A95    call        TWinControl.GetHandle
 00528A9A    push        eax
 00528A9B    call        shell32.DragAcceptFiles
 00528AA0    pop         ebx
 00528AA1    ret
*}
end;

//00528AA4
procedure TmwCustomEdit.DestroyWnd;
begin
{*
 00528AA4    push        ebx
 00528AA5    mov         ebx,eax
 00528AA7    test        byte ptr [ebx+3CE],4;TmwCustomEdit.fOptions:TmwEditorOptions
>00528AAE    je          00528AC5
 00528AB0    test        byte ptr [ebx+1C],10;TmwCustomEdit.FComponentState:TComponentState
>00528AB4    jne         00528AC5
 00528AB6    push        0
 00528AB8    mov         eax,ebx
 00528ABA    call        TWinControl.GetHandle
 00528ABF    push        eax
 00528AC0    call        shell32.DragAcceptFiles
 00528AC5    mov         eax,ebx
 00528AC7    call        TWinControl.DestroyWnd
 00528ACC    pop         ebx
 00528ACD    ret
*}
end;

//00528AD0
procedure sub_00528AD0(?:TmwCustomEdit);
begin
{*
 00528AD0    push        ebp
 00528AD1    mov         ebp,esp
 00528AD3    add         esp,0FFFFFFB0
 00528AD6    push        ebx
 00528AD7    push        esi
 00528AD8    push        edi
 00528AD9    xor         edx,edx
 00528ADB    mov         dword ptr [ebp-50],edx
 00528ADE    mov         dword ptr [ebp-4],edx
 00528AE1    mov         dword ptr [ebp-8],eax
 00528AE4    xor         eax,eax
 00528AE6    push        ebp
 00528AE7    push        528CBD
 00528AEC    push        dword ptr fs:[eax]
 00528AEF    mov         dword ptr fs:[eax],esp
 00528AF2    mov         eax,dword ptr [ebp-8]
 00528AF5    movzx       eax,byte ptr [eax+390];TmwCustomEdit.fSelectionMode:TSelectionMode
 00528AFC    mov         byte ptr [ebp-29],al
 00528AFF    lea         edx,[ebp-10]
 00528B02    mov         eax,dword ptr [ebp-8]
 00528B05    call        0051FBB8
 00528B0A    mov         dword ptr [ebp-28],1
 00528B11    xor         eax,eax
 00528B13    mov         dword ptr [ebp-24],eax
 00528B16    mov         eax,dword ptr [ebp-8]
 00528B19    call        0051C710
 00528B1E    test        al,al
>00528B20    je          00528C9F
 00528B26    xor         edx,edx
 00528B28    push        ebp
 00528B29    push        528C98
 00528B2E    push        dword ptr fs:[edx]
 00528B31    mov         dword ptr fs:[edx],esp
 00528B34    lea         edx,[ebp-18]
 00528B37    mov         eax,dword ptr [ebp-8]
 00528B3A    call        0051C570
 00528B3F    lea         edx,[ebp-20]
 00528B42    mov         eax,dword ptr [ebp-8]
 00528B45    call        0051C5CC
 00528B4A    mov         eax,dword ptr [ebp-20]
 00528B4D    cmp         eax,1
>00528B50    jne         00528B5F
 00528B52    mov         esi,dword ptr [ebp-1C]
 00528B55    dec         esi
 00528B56    mov         dword ptr [ebp-28],1
>00528B5D    jmp         00528B70
 00528B5F    mov         esi,dword ptr [ebp-1C]
 00528B62    mov         edx,dword ptr [ebp-8]
 00528B65    mov         edx,dword ptr [edx+3A8];TmwCustomEdit.fTabWidth:Integer
 00528B6B    add         edx,eax
 00528B6D    mov         dword ptr [ebp-28],edx
 00528B70    mov         eax,dword ptr [ebp-8]
 00528B73    mov         eax,dword ptr [eax+3A8];TmwCustomEdit.fTabWidth:Integer
 00528B79    mov         edx,eax
 00528B7B    add         edx,2
 00528B7E    mov         ecx,esi
 00528B80    mov         edi,dword ptr [ebp-14]
 00528B83    sub         ecx,edi
 00528B85    imul        edx,ecx
 00528B88    add         edx,eax
 00528B8A    inc         edx
 00528B8B    mov         eax,edx
 00528B8D    call        StrAlloc
 00528B92    mov         dword ptr [ebp-24],eax
 00528B95    mov         ebx,dword ptr [ebp-24]
 00528B98    lea         ecx,[ebp-4]
 00528B9B    mov         eax,dword ptr [ebp-8]
 00528B9E    mov         edx,dword ptr [eax+3A8];TmwCustomEdit.fTabWidth:Integer
 00528BA4    mov         ax,20
 00528BA8    call        StringOfChar
 00528BAD    mov         eax,edi
 00528BAF    dec         esi
 00528BB0    sub         esi,eax
>00528BB2    jl          00528BE2
 00528BB4    inc         esi
 00528BB5    lea         eax,[ebp-50]
 00528BB8    mov         ecx,528CD8;'
'
 00528BBD    mov         edx,dword ptr [ebp-4]
 00528BC0    call        @UStrCat3
 00528BC5    mov         edx,dword ptr [ebp-50]
 00528BC8    mov         eax,ebx
 00528BCA    call        StrPCopy
 00528BCF    mov         eax,dword ptr [ebp-8]
 00528BD2    mov         eax,dword ptr [eax+3A8];TmwCustomEdit.fTabWidth:Integer
 00528BD8    add         eax,2
 00528BDB    add         eax,eax
 00528BDD    add         ebx,eax
 00528BDF    dec         esi
>00528BE0    jne         00528BB5
 00528BE2    mov         edx,dword ptr [ebp-4]
 00528BE5    mov         eax,ebx
 00528BE7    call        StrPCopy
 00528BEC    mov         dword ptr [ebp-34],1
 00528BF3    mov         eax,dword ptr [ebp-14]
 00528BF6    mov         dword ptr [ebp-30],eax
 00528BF9    mov         dword ptr [ebp-3C],1
 00528C00    mov         dword ptr [ebp-38],eax
 00528C03    mov         eax,dword ptr [ebp-24]
 00528C06    push        eax
 00528C07    lea         ecx,[ebp-3C]
 00528C0A    lea         edx,[ebp-34]
 00528C0D    mov         eax,dword ptr [ebp-8]
 00528C10    call        005220B4
 00528C15    lea         eax,[ebp-20]
 00528C18    push        eax
 00528C19    push        0
 00528C1B    push        1
 00528C1D    mov         eax,dword ptr [ebp-8]
 00528C20    mov         eax,dword ptr [eax+2DC];TmwCustomEdit.fUndoList:TUndoList
 00528C26    lea         ecx,[ebp-18]
 00528C29    mov         dl,8
 00528C2B    call        TUndoList.AddChange
 00528C30    xor         eax,eax
 00528C32    pop         edx
 00528C33    pop         ecx
 00528C34    pop         ecx
 00528C35    mov         dword ptr fs:[eax],edx
 00528C38    push        528C9F
 00528C3D    mov         eax,dword ptr [ebp-24]
 00528C40    call        StrDispose
 00528C45    mov         eax,dword ptr [ebp-8]
 00528C48    movzx       edx,byte ptr [ebp-29]
 00528C4C    mov         byte ptr [eax+390],dl;TmwCustomEdit.fSelectionMode:TSelectionMode
 00528C52    mov         eax,dword ptr [ebp-8]
 00528C55    mov         eax,dword ptr [eax+3A8];TmwCustomEdit.fTabWidth:Integer
 00528C5B    add         eax,dword ptr [ebp-18]
 00528C5E    mov         dword ptr [ebp-44],eax
 00528C61    mov         eax,dword ptr [ebp-14]
 00528C64    mov         dword ptr [ebp-40],eax
 00528C67    lea         edx,[ebp-44]
 00528C6A    mov         eax,dword ptr [ebp-8]
 00528C6D    call        0051F7D8
 00528C72    mov         eax,dword ptr [ebp-28]
 00528C75    mov         dword ptr [ebp-4C],eax
 00528C78    mov         eax,dword ptr [ebp-1C]
 00528C7B    mov         dword ptr [ebp-48],eax
 00528C7E    lea         edx,[ebp-4C]
 00528C81    mov         eax,dword ptr [ebp-8]
 00528C84    call        0051F99C
 00528C89    lea         edx,[ebp-10]
 00528C8C    mov         eax,dword ptr [ebp-8]
 00528C8F    mov         ecx,dword ptr [eax]
 00528C91    call        dword ptr [ecx+110];TmwCustomEdit.sub_0051FBE0
 00528C97    ret
>00528C98    jmp         @HandleFinally
>00528C9D    jmp         00528C3D
 00528C9F    xor         eax,eax
 00528CA1    pop         edx
 00528CA2    pop         ecx
 00528CA3    pop         ecx
 00528CA4    mov         dword ptr fs:[eax],edx
 00528CA7    push        528CC4
 00528CAC    lea         eax,[ebp-50]
 00528CAF    call        @UStrClr
 00528CB4    lea         eax,[ebp-4]
 00528CB7    call        @UStrClr
 00528CBC    ret
>00528CBD    jmp         @HandleFinally
>00528CC2    jmp         00528CAC
 00528CC4    pop         edi
 00528CC5    pop         esi
 00528CC6    pop         ebx
 00528CC7    mov         esp,ebp
 00528CC9    pop         ebp
 00528CCA    ret
*}
end;

//00528CE0
{*function sub_00528CE0(?:?):?;
begin
 00528CE0    push        ebp
 00528CE1    mov         ebp,esp
 00528CE3    xor         eax,eax
 00528CE5    mov         edx,dword ptr [ebp+8]
 00528CE8    mov         edx,dword ptr [edx-4]
>00528CEB    jmp         00528CF8
 00528CED    inc         eax
 00528CEE    add         edx,2
 00528CF1    mov         ecx,dword ptr [ebp+8]
 00528CF4    mov         byte ptr [ecx-9],1
 00528CF8    cmp         word ptr [edx],20
>00528CFC    jne         00528D0C
 00528CFE    mov         ecx,dword ptr [ebp+8]
 00528D01    mov         ecx,dword ptr [ecx-8]
 00528D04    cmp         eax,dword ptr [ecx+3A8]
>00528D0A    jl          00528CED
 00528D0C    pop         ebp
 00528D0D    ret
end;*}

//00528D10
procedure sub_00528D10(?:TmwCustomEdit);
begin
{*
 00528D10    push        ebp
 00528D11    mov         ebp,esp
 00528D13    add         esp,0FFFFFF9C
 00528D16    push        ebx
 00528D17    push        esi
 00528D18    push        edi
 00528D19    xor         edx,edx
 00528D1B    mov         dword ptr [ebp-64],edx
 00528D1E    mov         dword ptr [ebp-60],edx
 00528D21    mov         dword ptr [ebp-5C],edx
 00528D24    mov         dword ptr [ebp-58],edx
 00528D27    mov         dword ptr [ebp-10],edx
 00528D2A    mov         dword ptr [ebp-8],eax
 00528D2D    xor         eax,eax
 00528D2F    push        ebp
 00528D30    push        528FC8
 00528D35    push        dword ptr fs:[eax]
 00528D38    mov         dword ptr fs:[eax],esp
 00528D3B    mov         eax,dword ptr [ebp-8]
 00528D3E    movzx       eax,byte ptr [eax+390];TmwCustomEdit.fSelectionMode:TSelectionMode
 00528D45    mov         byte ptr [ebp-41],al
 00528D48    xor         eax,eax
 00528D4A    mov         dword ptr [ebp-30],eax
 00528D4D    xor         eax,eax
 00528D4F    mov         dword ptr [ebp-3C],eax
 00528D52    mov         eax,dword ptr [ebp-8]
 00528D55    call        0051C710
 00528D5A    test        al,al
>00528D5C    je          00528FA5
 00528D62    lea         edx,[ebp-20]
 00528D65    mov         eax,dword ptr [ebp-8]
 00528D68    call        0051C570
 00528D6D    lea         edx,[ebp-28]
 00528D70    mov         eax,dword ptr [ebp-8]
 00528D73    call        0051C5CC
 00528D78    lea         edx,[ebp-18]
 00528D7B    mov         eax,dword ptr [ebp-8]
 00528D7E    call        0051FBB8
 00528D83    cmp         dword ptr [ebp-28],1
>00528D87    jne         00528D92
 00528D89    mov         eax,dword ptr [ebp-24]
 00528D8C    dec         eax
 00528D8D    mov         dword ptr [ebp-40],eax
>00528D90    jmp         00528D98
 00528D92    mov         eax,dword ptr [ebp-24]
 00528D95    mov         dword ptr [ebp-40],eax
 00528D98    mov         eax,dword ptr [ebp-8]
 00528D9B    mov         eax,dword ptr [eax+3A8];TmwCustomEdit.fTabWidth:Integer
 00528DA1    mov         edx,eax
 00528DA3    add         edx,2
 00528DA6    mov         ecx,dword ptr [ebp-40]
 00528DA9    mov         esi,dword ptr [ebp-1C]
 00528DAC    sub         ecx,esi
 00528DAE    imul        edx,ecx
 00528DB1    add         edx,eax
 00528DB3    inc         edx
 00528DB4    mov         eax,edx
 00528DB6    call        StrAlloc
 00528DBB    mov         ebx,eax
 00528DBD    mov         word ptr [ebx],0
 00528DC2    mov         byte ptr [ebp-9],0
 00528DC6    mov         eax,dword ptr [ebp-40]
 00528DC9    dec         eax
 00528DCA    sub         eax,esi
>00528DCC    jl          00528E2B
 00528DCE    inc         eax
 00528DCF    xchg        eax,esi
 00528DD0    mov         dword ptr [ebp-34],eax
 00528DD3    lea         ecx,[ebp-58]
 00528DD6    mov         edx,dword ptr [ebp-34]
 00528DD9    dec         edx
 00528DDA    mov         eax,dword ptr [ebp-8]
 00528DDD    mov         eax,dword ptr [eax+2A4];TmwCustomEdit.fLines:TStrings
 00528DE3    mov         edi,dword ptr [eax]
 00528DE5    call        dword ptr [edi+0C];TStrings.Get
 00528DE8    mov         eax,dword ptr [ebp-58]
 00528DEB    call        @UStrToPWChar
 00528DF0    mov         dword ptr [ebp-4],eax
 00528DF3    push        ebp
 00528DF4    call        00528CE0
 00528DF9    pop         ecx
 00528DFA    mov         edx,eax
 00528DFC    lea         ecx,[ebp-5C]
 00528DFF    mov         ax,20
 00528E03    call        StringOfChar
 00528E08    mov         eax,dword ptr [ebp-5C]
 00528E0B    call        @UStrToPWChar
 00528E10    mov         edx,eax
 00528E12    mov         eax,ebx
 00528E14    call        StrCat
 00528E19    mov         edx,528FD8
 00528E1E    mov         eax,ebx
 00528E20    call        StrCat
 00528E25    inc         dword ptr [ebp-34]
 00528E28    dec         esi
>00528E29    jne         00528DD3
 00528E2B    lea         ecx,[ebp-60]
 00528E2E    mov         edx,dword ptr [ebp-40]
 00528E31    dec         edx
 00528E32    mov         eax,dword ptr [ebp-8]
 00528E35    mov         eax,dword ptr [eax+2A4];TmwCustomEdit.fLines:TStrings
 00528E3B    mov         esi,dword ptr [eax]
 00528E3D    call        dword ptr [esi+0C];TStrings.Get
 00528E40    mov         eax,dword ptr [ebp-60]
 00528E43    call        @UStrToPWChar
 00528E48    mov         dword ptr [ebp-4],eax
 00528E4B    push        ebp
 00528E4C    call        00528CE0
 00528E51    pop         ecx
 00528E52    mov         edx,eax
 00528E54    lea         ecx,[ebp-64]
 00528E57    mov         ax,20
 00528E5B    call        StringOfChar
 00528E60    mov         eax,dword ptr [ebp-64]
 00528E63    call        @UStrToPWChar
 00528E68    mov         edx,eax
 00528E6A    mov         eax,ebx
 00528E6C    call        StrCat
 00528E71    mov         dword ptr [ebp-38],0FFFFFFFF
 00528E78    cmp         byte ptr [ebp-9],0
>00528E7C    je          00528F4B
 00528E82    mov         dword ptr [ebp-2C],ebx
 00528E85    mov         edx,dword ptr [ebp-1C]
 00528E88    mov         eax,dword ptr [ebp-8]
 00528E8B    call        0051FB94
 00528E90    mov         eax,ebx
 00528E92    call        00510818
 00528E97    mov         esi,eax
 00528E99    cmp         ebx,esi
>00528E9B    je          00528F01
 00528E9D    mov         eax,esi
 00528E9F    sub         eax,ebx
 00528EA1    sar         eax,1
>00528EA3    jns         00528EA8
 00528EA5    adc         eax,0
 00528EA8    mov         dword ptr [ebp-30],eax
 00528EAB    cmp         dword ptr [ebp-38],0FFFFFFFF
>00528EAF    jne         00528EB7
 00528EB1    mov         eax,dword ptr [ebp-30]
 00528EB4    mov         dword ptr [ebp-38],eax
 00528EB7    lea         ecx,[ebp-10]
 00528EBA    mov         eax,dword ptr [ebp-8]
 00528EBD    mov         edx,dword ptr [eax+28C];TmwCustomEdit.fCaretY:Integer
 00528EC3    mov         eax,dword ptr [ebp-8]
 00528EC6    mov         eax,dword ptr [eax+2A4];TmwCustomEdit.fLines:TStrings
 00528ECC    mov         ebx,dword ptr [eax]
 00528ECE    call        dword ptr [ebx+0C];TStrings.Get
 00528ED1    cmp         dword ptr [ebp-30],0
>00528ED5    jle         00528EE7
 00528ED7    lea         eax,[ebp-10]
 00528EDA    mov         ecx,dword ptr [ebp-30]
 00528EDD    mov         edx,1
 00528EE2    call        @UStrDelete
 00528EE7    mov         eax,dword ptr [ebp-8]
 00528EEA    mov         edx,dword ptr [eax+28C];TmwCustomEdit.fCaretY:Integer
 00528EF0    mov         eax,dword ptr [ebp-8]
 00528EF3    mov         eax,dword ptr [eax+2A4];TmwCustomEdit.fLines:TStrings
 00528EF9    mov         ecx,dword ptr [ebp-10]
 00528EFC    mov         ebx,dword ptr [eax]
 00528EFE    call        dword ptr [ebx+20];TStrings.Put
 00528F01    cmp         word ptr [esi],0D
>00528F05    jne         00528F1C
 00528F07    add         esi,2
 00528F0A    cmp         word ptr [esi],0A
>00528F0E    jne         00528F13
 00528F10    add         esi,2
 00528F13    mov         eax,dword ptr [ebp-8]
 00528F16    inc         dword ptr [eax+28C];TmwCustomEdit.fCaretY:Integer
 00528F1C    mov         ebx,esi
 00528F1E    cmp         word ptr [esi],0
>00528F22    jne         00528E90
 00528F28    mov         eax,dword ptr [ebp-30]
 00528F2B    mov         dword ptr [ebp-3C],eax
 00528F2E    lea         eax,[ebp-28]
 00528F31    push        eax
 00528F32    mov         eax,dword ptr [ebp-2C]
 00528F35    push        eax
 00528F36    push        1
 00528F38    mov         eax,dword ptr [ebp-8]
 00528F3B    mov         eax,dword ptr [eax+2DC];TmwCustomEdit.fUndoList:TUndoList
 00528F41    lea         ecx,[ebp-20]
 00528F44    mov         dl,9
 00528F46    call        TUndoList.AddChange
 00528F4B    mov         eax,dword ptr [ebp-8]
 00528F4E    movzx       edx,byte ptr [ebp-41]
 00528F52    mov         byte ptr [eax+390],dl;TmwCustomEdit.fSelectionMode:TSelectionMode
 00528F58    cmp         dword ptr [ebp-38],0FFFFFFFF
>00528F5C    jne         00528F63
 00528F5E    xor         eax,eax
 00528F60    mov         dword ptr [ebp-38],eax
 00528F63    mov         eax,dword ptr [ebp-20]
 00528F66    sub         eax,dword ptr [ebp-38]
 00528F69    mov         dword ptr [ebp-4C],eax
 00528F6C    mov         eax,dword ptr [ebp-1C]
 00528F6F    mov         dword ptr [ebp-48],eax
 00528F72    lea         edx,[ebp-4C]
 00528F75    mov         eax,dword ptr [ebp-8]
 00528F78    call        0051F7D8
 00528F7D    mov         eax,dword ptr [ebp-28]
 00528F80    sub         eax,dword ptr [ebp-3C]
 00528F83    mov         dword ptr [ebp-54],eax
 00528F86    mov         eax,dword ptr [ebp-24]
 00528F89    mov         dword ptr [ebp-50],eax
 00528F8C    lea         edx,[ebp-54]
 00528F8F    mov         eax,dword ptr [ebp-8]
 00528F92    call        0051F99C
 00528F97    lea         edx,[ebp-18]
 00528F9A    mov         eax,dword ptr [ebp-8]
 00528F9D    mov         ecx,dword ptr [eax]
 00528F9F    call        dword ptr [ecx+110];TmwCustomEdit.sub_0051FBE0
 00528FA5    xor         eax,eax
 00528FA7    pop         edx
 00528FA8    pop         ecx
 00528FA9    pop         ecx
 00528FAA    mov         dword ptr fs:[eax],edx
 00528FAD    push        528FCF
 00528FB2    lea         eax,[ebp-64]
 00528FB5    mov         edx,4
 00528FBA    call        @UStrArrayClr
 00528FBF    lea         eax,[ebp-10]
 00528FC2    call        @UStrClr
 00528FC7    ret
>00528FC8    jmp         @HandleFinally
>00528FCD    jmp         00528FB2
 00528FCF    pop         edi
 00528FD0    pop         esi
 00528FD1    pop         ebx
 00528FD2    mov         esp,ebp
 00528FD4    pop         ebp
 00528FD5    ret
*}
end;

//00528FE0
procedure TmwCustomEdit.ExecuteAction(Action:TBasicAction);
begin
{*
 00528FE0    push        ebx
 00528FE1    push        esi
 00528FE2    push        edi
 00528FE3    mov         edi,edx
 00528FE5    mov         esi,eax
 00528FE7    mov         eax,edi
 00528FE9    mov         edx,dword ptr ds:[784A2C];0x0 gvar_00784A2C
 00528FEF    call        @IsClass
 00528FF4    test        al,al
>00528FF6    je          005290A8
 00528FFC    mov         bl,1
 00528FFE    mov         eax,edi
 00529000    mov         edx,dword ptr ds:[784A2C];0x0 gvar_00784A2C
 00529006    call        @IsClass
 0052900B    test        al,al
>0052900D    je          0052901B
 0052900F    mov         eax,esi
 00529011    call        TmwCustomEdit.CutToClipboard
>00529016    jmp         005290B3
 0052901B    mov         eax,edi
 0052901D    mov         edx,dword ptr ds:[784A2C];0x0 gvar_00784A2C
 00529023    call        @IsClass
 00529028    test        al,al
>0052902A    je          00529035
 0052902C    mov         eax,esi
 0052902E    call        TmwCustomEdit.CopyToClipboard
>00529033    jmp         005290B3
 00529035    mov         eax,edi
 00529037    mov         edx,dword ptr ds:[784A2C];0x0 gvar_00784A2C
 0052903D    call        @IsClass
 00529042    test        al,al
>00529044    je          0052904F
 00529046    mov         eax,esi
 00529048    call        TmwCustomEdit.PasteFromClipboard
>0052904D    jmp         005290B3
 0052904F    mov         eax,edi
 00529051    mov         edx,dword ptr ds:[784A2C];0x0 gvar_00784A2C
 00529057    call        @IsClass
 0052905C    test        al,al
>0052905E    je          00529074
 00529060    push        0
 00529062    xor         ecx,ecx
 00529064    mov         dx,192
 00529068    mov         eax,esi
 0052906A    mov         esi,dword ptr [eax]
 0052906C    call        dword ptr [esi+11C];TmwCustomEdit.CommandProcessor
>00529072    jmp         005290B3
 00529074    mov         eax,edi
 00529076    mov         edx,dword ptr ds:[784A2C];0x0 gvar_00784A2C
 0052907C    call        @IsClass
 00529081    test        al,al
>00529083    je          0052908E
 00529085    mov         eax,esi
 00529087    call        TmwCustomEdit.Undo
>0052908C    jmp         005290B3
 0052908E    mov         eax,edi
 00529090    mov         edx,dword ptr ds:[784A2C];0x0 gvar_00784A2C
 00529096    call        @IsClass
 0052909B    test        al,al
>0052909D    je          005290B3
 0052909F    mov         eax,esi
 005290A1    call        TmwCustomEdit.SelectAll
>005290A6    jmp         005290B3
 005290A8    mov         edx,edi
 005290AA    mov         eax,esi
 005290AC    call        TComponent.ExecuteAction
 005290B1    mov         ebx,eax
 005290B3    mov         eax,ebx
 005290B5    pop         edi
 005290B6    pop         esi
 005290B7    pop         ebx
 005290B8    ret
*}
end;

//005290BC
function TmwCustomEdit.UpdateAction(Action:TBasicAction):Boolean;
begin
{*
 005290BC    push        ebx
 005290BD    push        esi
 005290BE    push        edi
 005290BF    push        ebp
 005290C0    mov         ebp,edx
 005290C2    mov         edi,eax
 005290C4    mov         eax,ebp
 005290C6    mov         edx,dword ptr ds:[784A2C];0x0 gvar_00784A2C
 005290CC    call        @IsClass
 005290D1    test        al,al
>005290D3    je          005291A3
 005290D9    mov         eax,edi
 005290DB    mov         si,0FFB3
 005290DF    call        @CallDynaInst;TWinControl.Focused
 005290E4    mov         ebx,eax
 005290E6    test        bl,bl
>005290E8    je          005291AE
 005290EE    mov         eax,ebp
 005290F0    mov         edx,dword ptr ds:[784A2C];0x0 gvar_00784A2C
 005290F6    call        @IsClass
 005290FB    test        al,al
>005290FD    jne         00529110
 005290FF    mov         eax,ebp
 00529101    mov         edx,dword ptr ds:[784A2C];0x0 gvar_00784A2C
 00529107    call        @IsClass
 0052910C    test        al,al
>0052910E    je          00529125
 00529110    mov         eax,edi
 00529112    call        0051C710
 00529117    mov         edx,eax
 00529119    mov         eax,ebp
 0052911B    call        TCustomAction.SetEnabled
>00529120    jmp         005291AE
 00529125    mov         eax,ebp
 00529127    mov         edx,dword ptr ds:[784A2C];0x0 gvar_00784A2C
 0052912D    call        @IsClass
 00529132    test        al,al
>00529134    je          00529148
 00529136    mov         eax,edi
 00529138    call        00522084
 0052913D    mov         edx,eax
 0052913F    mov         eax,ebp
 00529141    call        TCustomAction.SetEnabled
>00529146    jmp         005291AE
 00529148    mov         eax,ebp
 0052914A    mov         edx,dword ptr ds:[784A2C];0x0 gvar_00784A2C
 00529150    call        @IsClass
 00529155    test        al,al
>00529157    je          00529164
 00529159    mov         dl,1
 0052915B    mov         eax,ebp
 0052915D    call        TCustomAction.SetEnabled
>00529162    jmp         005291AE
 00529164    mov         eax,ebp
 00529166    mov         edx,dword ptr ds:[784A2C];0x0 gvar_00784A2C
 0052916C    call        @IsClass
 00529171    test        al,al
>00529173    je          00529187
 00529175    mov         eax,edi
 00529177    call        00522054
 0052917C    mov         edx,eax
 0052917E    mov         eax,ebp
 00529180    call        TCustomAction.SetEnabled
>00529185    jmp         005291AE
 00529187    mov         eax,ebp
 00529189    mov         edx,dword ptr ds:[784A2C];0x0 gvar_00784A2C
 0052918F    call        @IsClass
 00529194    test        al,al
>00529196    je          005291AE
 00529198    mov         dl,1
 0052919A    mov         eax,ebp
 0052919C    call        TCustomAction.SetEnabled
>005291A1    jmp         005291AE
 005291A3    mov         edx,ebp
 005291A5    mov         eax,edi
 005291A7    call        TComponent.UpdateAction
 005291AC    mov         ebx,eax
 005291AE    mov         eax,ebx
 005291B0    pop         ebp
 005291B1    pop         edi
 005291B2    pop         esi
 005291B3    pop         ebx
 005291B4    ret
*}
end;

//005291B8
{*procedure sub_005291B8(?:TmwCustomEdit; ?:?);
begin
 005291B8    cmp         dl,byte ptr [eax+36C]
>005291BE    je          005291D2
 005291C0    mov         byte ptr [eax+36C],dl
 005291C6    movzx       edx,byte ptr ds:[5291D4];0x40 gvar_005291D4
 005291CD    call        005287FC
 005291D2    ret
end;*}

//005291D8
{*function sub_005291D8(?:?; ?:?):?;
begin
 005291D8    push        ebp
 005291D9    mov         ebp,esp
 005291DB    push        ecx
 005291DC    push        ebx
 005291DD    mov         byte ptr [ebp-1],0
 005291E1    cmp         word ptr [eax+3B2],0;TmwCustomEdit.?f3B2:word
>005291E9    je          00529206
 005291EB    lea         ebx,[ebp-1]
 005291EE    push        ebx
 005291EF    push        ecx
 005291F0    mov         ecx,dword ptr [ebp+8]
 005291F3    push        ecx
 005291F4    mov         ebx,eax
 005291F6    mov         ecx,edx
 005291F8    mov         edx,eax
 005291FA    mov         eax,dword ptr [ebx+3B4];TmwCustomEdit.?f3B4:dword
 00529200    call        dword ptr [ebx+3B0];TmwCustomEdit.fOnSpecialLineColors
 00529206    movzx       eax,byte ptr [ebp-1]
 0052920A    pop         ebx
 0052920B    pop         ecx
 0052920C    pop         ebp
 0052920D    ret         4
end;*}

//00529210
procedure TmwCustomEdit.InvalidateLine(Line:Integer);
begin
{*
 00529210    push        ebx
 00529211    push        esi
 00529212    add         esp,0FFFFFFF0
 00529215    mov         esi,edx
 00529217    mov         ebx,eax
 00529219    cmp         byte ptr [ebx+59],0;TmwCustomEdit.FVisible:Boolean
>0052921D    je          005292CB
 00529223    mov         eax,ebx
 00529225    call        0051CBB4
 0052922A    cmp         esi,eax
>0052922C    jl          005292CB
 00529232    mov         eax,ebx
 00529234    call        0051CBB4
 00529239    add         eax,dword ptr [ebx+2A8];TmwCustomEdit.fLinesInWindow:Integer
 0052923F    cmp         esi,eax
>00529241    jg          005292CB
 00529247    mov         eax,dword ptr [ebx+2A4];TmwCustomEdit.fLines:TStrings
 0052924D    mov         edx,dword ptr [eax]
 0052924F    call        dword ptr [edx+14];TStrings.GetCount
 00529252    cmp         esi,eax
>00529254    jg          005292CB
 00529256    mov         eax,ebx
 00529258    call        TWinControl.HandleAllocated
 0052925D    test        al,al
>0052925F    je          005292CB
 00529261    push        0
 00529263    lea         eax,[esp+4]
 00529267    push        eax
 00529268    mov         eax,ebx
 0052926A    call        0051CBB4
 0052926F    sub         esi,eax
 00529271    imul        esi,dword ptr [ebx+2C8];TmwCustomEdit.fTextHeight:Integer
 00529278    push        esi
 00529279    mov         eax,ebx
 0052927B    call        TControl.GetClientWidth
 00529280    mov         ecx,eax
 00529282    xor         eax,eax
 00529284    pop         edx
 00529285    call        Rect
 0052928A    mov         eax,dword ptr [esp+4]
 0052928E    add         eax,dword ptr [ebx+2C8];TmwCustomEdit.fTextHeight:Integer
 00529294    mov         dword ptr [esp+0C],eax
 00529298    test        byte ptr [ebx+3CC],4;TmwCustomEdit.fStateFlags:TmwStateFlags
>0052929F    je          005292B7
 005292A1    push        esp
 005292A2    lea         eax,[ebx+3BC];TmwCustomEdit.fInvalidateRect:TRect
 005292A8    push        eax
 005292A9    lea         eax,[ebx+3BC];TmwCustomEdit.fInvalidateRect:TRect
 005292AF    push        eax
 005292B0    call        user32.UnionRect
>005292B5    jmp         005292CB
 005292B7    push        0
 005292B9    lea         eax,[esp+4]
 005292BD    push        eax
 005292BE    mov         eax,ebx
 005292C0    call        TWinControl.GetHandle
 005292C5    push        eax
 005292C6    call        user32.InvalidateRect
 005292CB    add         esp,10
 005292CE    pop         esi
 005292CF    pop         ebx
 005292D0    ret
*}
end;

//005292D4
function TmwCustomEdit.GetReadOnly:Boolean;
begin
{*
 005292D4    movzx       eax,byte ptr [eax+2B8];TmwCustomEdit.fReadOnly:Boolean
 005292DB    ret
*}
end;

//005292DC
procedure TmwCustomEdit.SetReadOnly(Value:Boolean);
begin
{*
 005292DC    mov         byte ptr [eax+2B8],dl;TmwCustomEdit.fReadOnly:Boolean
 005292E2    ret
*}
end;

//005292E4
procedure sub_005292E4;
begin
{*
 005292E4    push        ebp
 005292E5    mov         ebp,esp
 005292E7    add         esp,0FFFFFFD8
 005292EA    push        ebx
 005292EB    push        esi
 005292EC    push        edi
 005292ED    xor         edx,edx
 005292EF    mov         dword ptr [ebp-4],edx
 005292F2    mov         dword ptr [ebp-8],eax
 005292F5    xor         eax,eax
 005292F7    push        ebp
 005292F8    push        52949E
 005292FD    push        dword ptr fs:[eax]
 00529300    mov         dword ptr fs:[eax],esp
 00529303    mov         eax,dword ptr [ebp-8]
 00529306    call        0051C628
 0052930B    mov         ebx,eax
 0052930D    mov         eax,dword ptr [ebp-8]
 00529310    call        0051C660
 00529315    mov         dword ptr [ebp-10],eax
 00529318    lea         edx,[ebp-4]
 0052931B    mov         eax,dword ptr [ebp-8]
 0052931E    call        0051C6C8
 00529323    mov         eax,dword ptr [ebp-4]
 00529326    test        eax,eax
>00529328    je          0052932F
 0052932A    sub         eax,4
 0052932D    mov         eax,dword ptr [eax]
 0052932F    cmp         ebx,eax
>00529331    jg          00529488
 00529337    mov         eax,dword ptr [ebp-4]
 0052933A    movzx       esi,word ptr [eax+ebx*2-2]
 0052933F    xor         eax,eax
 00529341    mov         dword ptr [ebp-0C],eax
 00529344    mov         eax,786C40
 00529349    movzx       edx,word ptr [eax]
 0052934C    cmp         si,dx
>0052934F    jne         00529478
 00529355    mov         word ptr [ebp-12],dx
 00529359    mov         eax,dword ptr [ebp-0C]
 0052935C    xor         eax,1
 0052935F    movzx       eax,word ptr [eax*2+786C40]
 00529367    mov         word ptr [ebp-14],ax
 0052936B    mov         dword ptr [ebp-18],1
 00529372    test        byte ptr [ebp-0C],1
>00529376    je          005293F4
 00529378    cmp         ebx,1
>0052937B    jle         005293C1
 0052937D    dec         ebx
 0052937E    mov         eax,dword ptr [ebp-4]
 00529381    movzx       esi,word ptr [eax+ebx*2-2]
 00529386    cmp         si,word ptr [ebp-12]
>0052938A    jne         00529391
 0052938C    inc         dword ptr [ebp-18]
>0052938F    jmp         005293BC
 00529391    cmp         si,word ptr [ebp-14]
>00529395    jne         005293BC
 00529397    dec         dword ptr [ebp-18]
 0052939A    cmp         dword ptr [ebp-18],0
>0052939E    jne         005293BC
 005293A0    mov         dword ptr [ebp-20],ebx
 005293A3    mov         eax,dword ptr [ebp-10]
 005293A6    mov         dword ptr [ebp-1C],eax
 005293A9    lea         edx,[ebp-20]
 005293AC    mov         eax,dword ptr [ebp-8]
 005293AF    mov         ecx,dword ptr [eax]
 005293B1    call        dword ptr [ecx+110];TmwCustomEdit.sub_0051FBE0
>005293B7    jmp         00529488
 005293BC    cmp         ebx,1
>005293BF    jg          0052937D
 005293C1    cmp         dword ptr [ebp-10],1
>005293C5    je          00529488
 005293CB    dec         dword ptr [ebp-10]
 005293CE    lea         ecx,[ebp-4]
 005293D1    mov         edx,dword ptr [ebp-10]
 005293D4    dec         edx
 005293D5    mov         eax,dword ptr [ebp-8]
 005293D8    mov         eax,dword ptr [eax+2A4];TmwCustomEdit.fLines:TStrings
 005293DE    mov         ebx,dword ptr [eax]
 005293E0    call        dword ptr [ebx+0C];TStrings.Get
 005293E3    mov         eax,dword ptr [ebp-4]
 005293E6    test        eax,eax
>005293E8    je          005293EF
 005293EA    sub         eax,4
 005293ED    mov         eax,dword ptr [eax]
 005293EF    lea         ebx,[eax+1]
>005293F2    jmp         00529378
 005293F4    mov         eax,dword ptr [ebp-4]
 005293F7    test        eax,eax
>005293F9    je          00529400
 005293FB    sub         eax,4
 005293FE    mov         eax,dword ptr [eax]
 00529400    mov         edi,eax
 00529402    cmp         edi,ebx
>00529404    jle         00529446
 00529406    inc         ebx
 00529407    mov         eax,dword ptr [ebp-4]
 0052940A    movzx       esi,word ptr [eax+ebx*2-2]
 0052940F    cmp         si,word ptr [ebp-12]
>00529413    jne         0052941A
 00529415    inc         dword ptr [ebp-18]
>00529418    jmp         00529442
 0052941A    cmp         si,word ptr [ebp-14]
>0052941E    jne         00529442
 00529420    dec         dword ptr [ebp-18]
 00529423    cmp         dword ptr [ebp-18],0
>00529427    jne         00529442
 00529429    mov         dword ptr [ebp-28],ebx
 0052942C    mov         eax,dword ptr [ebp-10]
 0052942F    mov         dword ptr [ebp-24],eax
 00529432    lea         edx,[ebp-28]
 00529435    mov         eax,dword ptr [ebp-8]
 00529438    mov         ecx,dword ptr [eax]
 0052943A    call        dword ptr [ecx+110];TmwCustomEdit.sub_0051FBE0
>00529440    jmp         00529488
 00529442    cmp         edi,ebx
>00529444    jg          00529406
 00529446    mov         eax,dword ptr [ebp-8]
 00529449    mov         eax,dword ptr [eax+2A4];TmwCustomEdit.fLines:TStrings
 0052944F    mov         edx,dword ptr [eax]
 00529451    call        dword ptr [edx+14];TStrings.GetCount
 00529454    cmp         eax,dword ptr [ebp-10]
>00529457    je          00529488
 00529459    inc         dword ptr [ebp-10]
 0052945C    lea         ecx,[ebp-4]
 0052945F    mov         edx,dword ptr [ebp-10]
 00529462    dec         edx
 00529463    mov         eax,dword ptr [ebp-8]
 00529466    mov         eax,dword ptr [eax+2A4];TmwCustomEdit.fLines:TStrings
 0052946C    mov         ebx,dword ptr [eax]
 0052946E    call        dword ptr [ebx+0C];TStrings.Get
 00529471    xor         ebx,ebx
>00529473    jmp         005293F4
 00529478    inc         dword ptr [ebp-0C]
 0052947B    add         eax,2
 0052947E    cmp         dword ptr [ebp-0C],6
>00529482    jne         00529349
 00529488    xor         eax,eax
 0052948A    pop         edx
 0052948B    pop         ecx
 0052948C    pop         ecx
 0052948D    mov         dword ptr fs:[eax],edx
 00529490    push        5294A5
 00529495    lea         eax,[ebp-4]
 00529498    call        @UStrClr
 0052949D    ret
>0052949E    jmp         @HandleFinally
>005294A3    jmp         00529495
 005294A5    pop         edi
 005294A6    pop         esi
 005294A7    pop         ebx
 005294A8    mov         esp,ebp
 005294AA    pop         ebp
 005294AB    ret
*}
end;

//005294AC
function TmwCustomEdit.GetHighlighterAttriAtRowCol(XY:TPoint; var Token:string; var Attri:TmwHighLightAttributes):Boolean;
begin
{*
 005294AC    push        ebp
 005294AD    mov         ebp,esp
 005294AF    add         esp,0FFFFFFE0
 005294B2    push        ebx
 005294B3    push        esi
 005294B4    push        edi
 005294B5    xor         ebx,ebx
 005294B7    mov         dword ptr [ebp-20],ebx
 005294BA    mov         dword ptr [ebp-4],ebx
 005294BD    mov         esi,edx
 005294BF    lea         edi,[ebp-0C]
 005294C2    movs        dword ptr [edi],dword ptr [esi]
 005294C3    movs        dword ptr [edi],dword ptr [esi]
 005294C4    mov         dword ptr [ebp-10],ecx
 005294C7    mov         ebx,eax
 005294C9    xor         eax,eax
 005294CB    push        ebp
 005294CC    push        529616
 005294D1    push        dword ptr fs:[eax]
 005294D4    mov         dword ptr fs:[eax],esp
 005294D7    mov         esi,dword ptr [ebp-8]
 005294DA    cmp         dword ptr [ebx+2D4],0;TmwCustomEdit.fHighLighter:TmwCustomHighLighter
>005294E1    je          005295E5
 005294E7    cmp         esi,1
>005294EA    jl          005295E5
 005294F0    mov         eax,dword ptr [ebx+2A4];TmwCustomEdit.fLines:TStrings
 005294F6    mov         edx,dword ptr [eax]
 005294F8    call        dword ptr [edx+14];TStrings.GetCount
 005294FB    cmp         esi,eax
>005294FD    jg          005295E5
 00529503    lea         ecx,[ebp-4]
 00529506    mov         edx,esi
 00529508    dec         edx
 00529509    mov         eax,dword ptr [ebx+2A4];TmwCustomEdit.fLines:TStrings
 0052950F    mov         edi,dword ptr [eax]
 00529511    call        dword ptr [edi+0C];TStrings.Get
 00529514    mov         edx,esi
 00529516    dec         edx
 00529517    mov         eax,dword ptr [ebx+2A4];TmwCustomEdit.fLines:TStrings
 0052951D    mov         ecx,dword ptr [eax]
 0052951F    call        dword ptr [ecx+18];TStrings.sub_004483A0
 00529522    mov         edx,eax
 00529524    mov         eax,dword ptr [ebx+2D4];TmwCustomEdit.fHighLighter:TmwCustomHighLighter
 0052952A    mov         ecx,dword ptr [eax]
 0052952C    call        dword ptr [ecx+7C];TmwCustomHighLighter.SetRange
 0052952F    mov         ecx,esi
 00529531    mov         edx,dword ptr [ebp-4]
 00529534    mov         eax,dword ptr [ebx+2D4];TmwCustomEdit.fHighLighter:TmwCustomHighLighter
 0052953A    mov         esi,dword ptr [eax]
 0052953C    call        dword ptr [esi+74];TmwCustomHighLighter.SetLine
 0052953F    mov         esi,dword ptr [ebp-0C]
 00529542    test        esi,esi
>00529544    jle         005295E5
 0052954A    mov         eax,dword ptr [ebp-4]
 0052954D    test        eax,eax
>0052954F    je          00529556
 00529551    sub         eax,4
 00529554    mov         eax,dword ptr [eax]
 00529556    cmp         eax,esi
>00529558    jl          005295E5
>0052955E    jmp         005295D2
 00529560    mov         eax,dword ptr [ebx+2D4];TmwCustomEdit.fHighLighter:TmwCustomHighLighter
 00529566    mov         edx,dword ptr [eax]
 00529568    call        dword ptr [edx+6C];TmwCustomHighLighter.GetTokenPos
 0052956B    mov         edi,eax
 0052956D    inc         edi
 0052956E    lea         edx,[ebp-20]
 00529571    mov         eax,dword ptr [ebx+2D4];TmwCustomEdit.fHighLighter:TmwCustomHighLighter
 00529577    mov         ecx,dword ptr [eax]
 00529579    call        dword ptr [ecx+60];TmwCustomHighLighter.GetToken
 0052957C    mov         edx,dword ptr [ebp-20]
 0052957F    mov         eax,dword ptr [ebp-10]
 00529582    call        @UStrAsg
 00529587    cmp         edi,esi
>00529589    jg          005295C7
 0052958B    mov         eax,dword ptr [ebp-10]
 0052958E    mov         eax,dword ptr [eax]
 00529590    mov         dword ptr [ebp-18],eax
 00529593    mov         eax,dword ptr [ebp-18]
 00529596    mov         dword ptr [ebp-1C],eax
 00529599    cmp         dword ptr [ebp-1C],0
>0052959D    je          005295AA
 0052959F    mov         eax,dword ptr [ebp-1C]
 005295A2    sub         eax,4
 005295A5    mov         eax,dword ptr [eax]
 005295A7    mov         dword ptr [ebp-1C],eax
 005295AA    add         edi,dword ptr [ebp-1C]
 005295AD    cmp         esi,edi
>005295AF    jge         005295C7
 005295B1    mov         eax,dword ptr [ebx+2D4];TmwCustomEdit.fHighLighter:TmwCustomHighLighter
 005295B7    mov         edx,dword ptr [eax]
 005295B9    call        dword ptr [edx+64];TmwCustomHighLighter.GetTokenAttribute
 005295BC    mov         edx,dword ptr [ebp+8]
 005295BF    mov         dword ptr [edx],eax
 005295C1    mov         byte ptr [ebp-11],1
>005295C5    jmp         005295F8
 005295C7    mov         eax,dword ptr [ebx+2D4];TmwCustomEdit.fHighLighter:TmwCustomHighLighter
 005295CD    mov         edx,dword ptr [eax]
 005295CF    call        dword ptr [edx+70];TmwCustomHighLighter.Next
 005295D2    mov         eax,dword ptr [ebx+2D4];TmwCustomEdit.fHighLighter:TmwCustomHighLighter
 005295D8    mov         edx,dword ptr [eax]
 005295DA    call        dword ptr [edx+58];TmwCustomHighLighter.GetEol
 005295DD    test        al,al
>005295DF    je          00529560
 005295E5    mov         eax,dword ptr [ebp-10]
 005295E8    call        @UStrClr
 005295ED    mov         eax,dword ptr [ebp+8]
 005295F0    xor         edx,edx
 005295F2    mov         dword ptr [eax],edx
 005295F4    mov         byte ptr [ebp-11],0
 005295F8    xor         eax,eax
 005295FA    pop         edx
 005295FB    pop         ecx
 005295FC    pop         ecx
 005295FD    mov         dword ptr fs:[eax],edx
 00529600    push        52961D
 00529605    lea         eax,[ebp-20]
 00529608    call        @UStrClr
 0052960D    lea         eax,[ebp-4]
 00529610    call        @UStrClr
 00529615    ret
>00529616    jmp         @HandleFinally
>0052961B    jmp         00529605
 0052961D    movzx       eax,byte ptr [ebp-11]
 00529621    pop         edi
 00529622    pop         esi
 00529623    pop         ebx
 00529624    mov         esp,ebp
 00529626    pop         ebp
 00529627    ret         4
*}
end;

//0052962C
procedure TUndoList.AddChange(ChangeReason:TChangeReason; ChangeStartPos:TPoint; ChangeSelMode:TSelectionMode; ChangeStr:PWideChar; ChangeEndPos:TPoint);
begin
{*
 0052962C    push        ebp
 0052962D    mov         ebp,esp
 0052962F    add         esp,0FFFFFFEC
 00529632    push        ebx
 00529633    push        esi
 00529634    push        edi
 00529635    mov         esi,dword ptr [ebp+10]
 00529638    lea         edi,[ebp-10]
 0052963B    movs        dword ptr [edi],dword ptr [esi]
 0052963C    movs        dword ptr [edi],dword ptr [esi]
 0052963D    mov         esi,ecx
 0052963F    lea         edi,[ebp-8]
 00529642    movs        dword ptr [edi],dword ptr [esi]
 00529643    movs        dword ptr [edi],dword ptr [esi]
 00529644    mov         ebx,edx
 00529646    mov         esi,eax
 00529648    cmp         byte ptr [esi+14],0;TUndoList.fUndoLocked:Boolean
>0052964C    jne         00529745
 00529652    mov         eax,dword ptr [esi+4];TUndoList.fList:TList
 00529655    mov         eax,dword ptr [eax+8];TList.FCount:Integer
 00529658    cmp         eax,dword ptr [esi+0C];TUndoList.fMaxUndo:Integer
>0052965B    jl          00529666
 0052965D    xor         edx,edx
 0052965F    mov         eax,esi
 00529661    call        005298D8
 00529666    xor         eax,eax
 00529668    push        ebp
 00529669    push        5296D4
 0052966E    push        dword ptr fs:[eax]
 00529671    mov         dword ptr fs:[eax],esp
 00529674    mov         eax,1C
 00529679    call        @GetMem
 0052967E    mov         dword ptr [ebp-14],eax
 00529681    xor         eax,eax
 00529683    push        ebp
 00529684    push        5296A6
 00529689    push        dword ptr fs:[eax]
 0052968C    mov         dword ptr fs:[eax],esp
 0052968F    mov         eax,dword ptr [ebp+0C]
 00529692    call        StrNew
 00529697    mov         edx,dword ptr [ebp-14]
 0052969A    mov         dword ptr [edx],eax
 0052969C    xor         eax,eax
 0052969E    pop         edx
 0052969F    pop         ecx
 005296A0    pop         ecx
 005296A1    mov         dword ptr fs:[eax],edx
>005296A4    jmp         005296CA
>005296A6    jmp         @HandleAnyException
 005296AB    mov         eax,dword ptr [ebp-14]
 005296AE    call        @FreeMem
 005296B3    call        @DoneExcept
 005296B8    xor         eax,eax
 005296BA    pop         edx
 005296BB    pop         ecx
 005296BC    pop         ecx
 005296BD    mov         dword ptr fs:[eax],edx
>005296C0    jmp         00529745
 005296C5    call        @DoneExcept
 005296CA    xor         eax,eax
 005296CC    pop         edx
 005296CD    pop         ecx
 005296CE    pop         ecx
 005296CF    mov         dword ptr fs:[eax],edx
>005296D2    jmp         005296E5
>005296D4    jmp         @HandleAnyException
 005296D9    call        @DoneExcept
>005296DE    jmp         00529745
 005296E0    call        @DoneExcept
 005296E5    mov         eax,dword ptr [ebp-14]
 005296E8    mov         byte ptr [eax+4],bl
 005296EB    mov         eax,dword ptr [ebp-14]
 005296EE    mov         edx,dword ptr [ebp-8]
 005296F1    mov         dword ptr [eax+8],edx
 005296F4    mov         edx,dword ptr [ebp-4]
 005296F7    mov         dword ptr [eax+0C],edx
 005296FA    mov         eax,dword ptr [ebp-14]
 005296FD    mov         edx,dword ptr [ebp-10]
 00529700    mov         dword ptr [eax+10],edx
 00529703    mov         edx,dword ptr [ebp-0C]
 00529706    mov         dword ptr [eax+14],edx
 00529709    mov         eax,dword ptr [ebp-14]
 0052970C    movzx       edx,byte ptr [ebp+8]
 00529710    mov         byte ptr [eax+18],dl
 00529713    mov         eax,dword ptr [esi+4];TUndoList.fList:TList
 00529716    mov         edx,dword ptr [ebp-14]
 00529719    call        TList.Add
 0052971E    mov         eax,dword ptr [esi+10];TUndoList.fOwner:TmwCustomEdit
 00529721    mov         dl,1
 00529723    call        005291B8
 00529728    mov         eax,dword ptr [esi+10];TUndoList.fOwner:TmwCustomEdit
 0052972B    cmp         word ptr [eax+332],0;TmwCustomEdit.?f332:word
>00529733    je          00529745
 00529735    mov         ebx,eax
 00529737    mov         edx,eax
 00529739    mov         eax,dword ptr [ebx+334];TmwCustomEdit.?f334:dword
 0052973F    call        dword ptr [ebx+330];TmwCustomEdit.fOnChange
 00529745    pop         edi
 00529746    pop         esi
 00529747    pop         ebx
 00529748    mov         esp,ebp
 0052974A    pop         ebp
 0052974B    ret         0C
*}
end;

//00529750
constructor TUndoList.Create(AOwner:TmwCustomEdit);
begin
{*
 00529750    push        ebx
 00529751    push        esi
 00529752    push        edi
 00529753    test        dl,dl
>00529755    je          0052975F
 00529757    add         esp,0FFFFFFF0
 0052975A    call        @ClassCreate
 0052975F    mov         esi,ecx
 00529761    mov         ebx,edx
 00529763    mov         edi,eax
 00529765    xor         edx,edx
 00529767    mov         eax,edi
 00529769    call        TObject.Create
 0052976E    mov         dword ptr [edi+10],esi;TUndoList.fOwner:TmwCustomEdit
 00529771    mov         dl,1
 00529773    mov         eax,[00439644];TList
 00529778    call        TObject.Create;TList.Create
 0052977D    mov         dword ptr [edi+4],eax;TUndoList.fList:TList
 00529780    mov         dword ptr [edi+0C],0A;TUndoList.fMaxUndo:Integer
 00529787    mov         byte ptr [edi+14],0;TUndoList.fUndoLocked:Boolean
 0052978B    mov         eax,edi
 0052978D    test        bl,bl
>0052978F    je          005297A0
 00529791    call        @AfterConstruction
 00529796    pop         dword ptr fs:[0]
 0052979D    add         esp,0C
 005297A0    mov         eax,edi
 005297A2    pop         edi
 005297A3    pop         esi
 005297A4    pop         ebx
 005297A5    ret
*}
end;

//005297A8
destructor TUndoList.Destroy();
begin
{*
 005297A8    push        ebx
 005297A9    push        esi
 005297AA    call        @BeforeDestruction
 005297AF    mov         ebx,edx
 005297B1    mov         esi,eax
 005297B3    mov         eax,esi
 005297B5    call        TUndoList.ClearList
 005297BA    mov         eax,dword ptr [esi+4];TUndoList.fList:TList
 005297BD    call        TObject.Free
 005297C2    mov         edx,ebx
 005297C4    and         dl,0FC
 005297C7    mov         eax,esi
 005297C9    call        TObject.Destroy
 005297CE    test        bl,bl
>005297D0    jle         005297D9
 005297D2    mov         eax,esi
 005297D4    call        @ClassDestroy
 005297D9    pop         esi
 005297DA    pop         ebx
 005297DB    ret
*}
end;

//005297DC
function TUndoList.GetChange(var ChangeStartPos:TPoint; var ChangeEndPos:TPoint; var ChangeSelMode:TSelectionMode; var ChangeStr:PWideChar):TChangeReason;
begin
{*
 005297DC    push        ebp
 005297DD    mov         ebp,esp
 005297DF    add         esp,0FFFFFFF4
 005297E2    push        ebx
 005297E3    push        esi
 005297E4    push        edi
 005297E5    mov         dword ptr [ebp-8],ecx
 005297E8    mov         dword ptr [ebp-4],edx
 005297EB    mov         ebx,eax
 005297ED    mov         esi,dword ptr [ebx+4];TUndoList.fList:TList
 005297F0    mov         edi,dword ptr [esi+8];TList.FCount:Integer
 005297F3    test        edi,edi
>005297F5    jne         00529800
 005297F7    mov         byte ptr [ebp-9],0A
>005297FB    jmp         00529888
 00529800    mov         edx,edi
 00529802    dec         edx
 00529803    mov         eax,esi
 00529805    call        TList.Get
 0052980A    mov         edx,dword ptr [ebp-4]
 0052980D    mov         ecx,dword ptr [eax+8]
 00529810    mov         dword ptr [edx],ecx;TPoint.X:LongInt
 00529812    mov         ecx,dword ptr [eax+0C]
 00529815    mov         dword ptr [edx+4],ecx
 00529818    mov         esi,dword ptr [ebx+4];TUndoList.fList:TList
 0052981B    mov         edx,dword ptr [esi+8];TList.FCount:Integer
 0052981E    dec         edx
 0052981F    mov         eax,esi
 00529821    call        TList.Get
 00529826    mov         edx,dword ptr [ebp-8]
 00529829    mov         ecx,dword ptr [eax+10]
 0052982C    mov         dword ptr [edx],ecx;TPoint.X:LongInt
 0052982E    mov         ecx,dword ptr [eax+14]
 00529831    mov         dword ptr [edx+4],ecx
 00529834    mov         esi,dword ptr [ebx+4];TUndoList.fList:TList
 00529837    mov         edx,dword ptr [esi+8];TList.FCount:Integer
 0052983A    dec         edx
 0052983B    mov         eax,esi
 0052983D    call        TList.Get
 00529842    mov         eax,dword ptr [eax]
 00529844    call        StrNew
 00529849    mov         edx,dword ptr [ebp+0C]
 0052984C    mov         dword ptr [edx],eax
 0052984E    mov         esi,dword ptr [ebx+4];TUndoList.fList:TList
 00529851    mov         edx,dword ptr [esi+8];TList.FCount:Integer
 00529854    dec         edx
 00529855    mov         eax,esi
 00529857    call        TList.Get
 0052985C    movzx       eax,byte ptr [eax+18]
 00529860    mov         edx,dword ptr [ebp+8]
 00529863    mov         byte ptr [edx],al
 00529865    mov         esi,dword ptr [ebx+4];TUndoList.fList:TList
 00529868    mov         edx,dword ptr [esi+8];TList.FCount:Integer
 0052986B    dec         edx
 0052986C    mov         eax,esi
 0052986E    call        TList.Get
 00529873    movzx       eax,byte ptr [eax+4]
 00529877    mov         byte ptr [ebp-9],al
 0052987A    mov         eax,dword ptr [ebx+4];TUndoList.fList:TList
 0052987D    mov         edx,dword ptr [eax+8];TList.FCount:Integer
 00529880    dec         edx
 00529881    mov         eax,ebx
 00529883    call        005298D8
 00529888    movzx       eax,byte ptr [ebp-9]
 0052988C    pop         edi
 0052988D    pop         esi
 0052988E    pop         ebx
 0052988F    mov         esp,ebp
 00529891    pop         ebp
 00529892    ret         8
*}
end;

//00529898
{*function sub_00529898(?:?):?;
begin
 00529898    mov         edx,dword ptr [eax+4]
 0052989B    mov         edx,dword ptr [edx+8]
 0052989E    mov         dword ptr [eax+8],edx
 005298A1    mov         eax,edx
 005298A3    ret
end;*}

//005298A4
procedure sub_005298A4(?:TUndoList; ?:Integer);
begin
{*
 005298A4    push        ebx
 005298A5    push        esi
 005298A6    push        edi
 005298A7    mov         edi,edx
 005298A9    mov         ebx,eax
 005298AB    mov         eax,dword ptr [ebx+4];TUndoList.fList:TList
 005298AE    mov         eax,dword ptr [eax+8];TList.FCount:Integer
 005298B1    mov         edx,eax
 005298B3    dec         edx
 005298B4    cmp         edi,edx
>005298B6    jge         005298CE
 005298B8    mov         esi,eax
 005298BA    sub         esi,edi
 005298BC    dec         esi
 005298BD    test        esi,esi
>005298BF    jl          005298CE
 005298C1    inc         esi
 005298C2    xor         edx,edx
 005298C4    mov         eax,ebx
 005298C6    call        005298D8
 005298CB    dec         esi
>005298CC    jne         005298C2
 005298CE    mov         dword ptr [ebx+0C],edi;TUndoList.fMaxUndo:Integer
 005298D1    pop         edi
 005298D2    pop         esi
 005298D3    pop         ebx
 005298D4    ret
*}
end;

//005298D8
{*procedure sub_005298D8(?:TUndoList; ?:?);
begin
 005298D8    push        ebp
 005298D9    mov         ebp,esp
 005298DB    push        ebx
 005298DC    push        esi
 005298DD    push        edi
 005298DE    mov         esi,edx
 005298E0    mov         ebx,eax
 005298E2    cmp         esi,0FFFFFFFF
>005298E5    jle         00529971
 005298EB    mov         eax,dword ptr [ebx+4];TUndoList.fList:TList
 005298EE    cmp         esi,dword ptr [eax+8];TList.FCount:Integer
>005298F1    jge         00529971
 005298F3    mov         eax,dword ptr [ebx+4];TUndoList.fList:TList
 005298F6    mov         edx,esi
 005298F8    call        TList.Get
 005298FD    mov         edi,eax
 005298FF    xor         eax,eax
 00529901    push        ebp
 00529902    push        529956
 00529907    push        dword ptr fs:[eax]
 0052990A    mov         dword ptr fs:[eax],esp
 0052990D    mov         eax,dword ptr [edi]
 0052990F    call        StrDispose
 00529914    xor         eax,eax
 00529916    push        ebp
 00529917    push        529933
 0052991C    push        dword ptr fs:[eax]
 0052991F    mov         dword ptr fs:[eax],esp
 00529922    mov         eax,edi
 00529924    call        @FreeMem
 00529929    xor         eax,eax
 0052992B    pop         edx
 0052992C    pop         ecx
 0052992D    pop         ecx
 0052992E    mov         dword ptr fs:[eax],edx
>00529931    jmp         0052994C
>00529933    jmp         @HandleAnyException
 00529938    call        @DoneExcept
 0052993D    xor         eax,eax
 0052993F    pop         edx
 00529940    pop         ecx
 00529941    pop         ecx
 00529942    mov         dword ptr fs:[eax],edx
>00529945    jmp         00529971
 00529947    call        @DoneExcept
 0052994C    xor         eax,eax
 0052994E    pop         edx
 0052994F    pop         ecx
 00529950    pop         ecx
 00529951    mov         dword ptr fs:[eax],edx
>00529954    jmp         00529967
>00529956    jmp         @HandleAnyException
 0052995B    call        @DoneExcept
>00529960    jmp         00529971
 00529962    call        @DoneExcept
 00529967    mov         eax,dword ptr [ebx+4];TUndoList.fList:TList
 0052996A    mov         edx,esi
 0052996C    call        TList.Delete
 00529971    pop         edi
 00529972    pop         esi
 00529973    pop         ebx
 00529974    pop         ebp
 00529975    ret
end;*}

//00529978
function TUndoList.GetChangeReason:TChangeReason;
begin
{*
 00529978    push        ebx
 00529979    push        esi
 0052997A    push        edi
 0052997B    mov         ebx,eax
 0052997D    mov         esi,dword ptr [ebx+4];TUndoList.fList:TList
 00529980    mov         edi,dword ptr [esi+8];TList.FCount:Integer
 00529983    test        edi,edi
>00529985    jne         0052998B
 00529987    mov         al,0A
>00529989    jmp         00529999
 0052998B    mov         edx,edi
 0052998D    dec         edx
 0052998E    mov         eax,esi
 00529990    call        TList.Get
 00529995    movzx       eax,byte ptr [eax+4]
 00529999    pop         edi
 0052999A    pop         esi
 0052999B    pop         ebx
 0052999C    ret
*}
end;

//005299A0
procedure TUndoList.ClearList;
begin
{*
 005299A0    push        ebx
 005299A1    push        esi
 005299A2    mov         esi,eax
 005299A4    mov         eax,dword ptr [esi+4];TUndoList.fList:TList
 005299A7    mov         ebx,dword ptr [eax+8];TList.FCount:Integer
 005299AA    dec         ebx
 005299AB    cmp         ebx,0
>005299AE    jl          005299BF
 005299B0    mov         edx,ebx
 005299B2    mov         eax,esi
 005299B4    call        005298D8
 005299B9    dec         ebx
 005299BA    cmp         ebx,0FFFFFFFF
>005299BD    jne         005299B0
 005299BF    pop         esi
 005299C0    pop         ebx
 005299C1    ret
*}
end;

//005299C4
procedure TUndoList.LockUndo;
begin
{*
 005299C4    mov         byte ptr [eax+14],1;TUndoList.fUndoLocked:Boolean
 005299C8    ret
*}
end;

//005299CC
procedure TUndoList.UnLockUndo;
begin
{*
 005299CC    mov         byte ptr [eax+14],0;TUndoList.fUndoLocked:Boolean
 005299D0    ret
*}
end;

//005299D4
{*function sub_005299D4:?;
begin
 005299D4    push        ebp
 005299D5    mov         ebp,esp
 005299D7    push        ecx
 005299D8    push        ebx
 005299D9    push        esi
 005299DA    push        edi
 005299DB    mov         dword ptr [ebp-4],eax
 005299DE    mov         eax,dword ptr [ebp-4]
 005299E1    mov         ebx,dword ptr [eax+10];TMark.fEdit:TmwCustomEdit
 005299E4    test        ebx,ebx
>005299E6    je          00529A2B
 005299E8    xor         eax,eax
 005299EA    push        ebp
 005299EB    push        529A19
 005299F0    push        dword ptr fs:[eax]
 005299F3    mov         dword ptr fs:[eax],esp
 005299F6    mov         eax,dword ptr [ebx+370];TmwCustomEdit.fMarkList:TMarkList
 005299FC    mov         edx,dword ptr [ebp-4]
 005299FF    call        TList.IndexOf
 00529A04    inc         eax
>00529A05    jne         00529A0F
 00529A07    mov         eax,dword ptr [ebp-4]
 00529A0A    xor         edx,edx
 00529A0C    mov         dword ptr [eax+10],edx;TMark.fEdit:TmwCustomEdit
 00529A0F    xor         eax,eax
 00529A11    pop         edx
 00529A12    pop         ecx
 00529A13    pop         ecx
 00529A14    mov         dword ptr fs:[eax],edx
>00529A17    jmp         00529A2B
>00529A19    jmp         @HandleAnyException
 00529A1E    mov         eax,dword ptr [ebp-4]
 00529A21    xor         edx,edx
 00529A23    mov         dword ptr [eax+10],edx;TMark.fEdit:TmwCustomEdit
 00529A26    call        @DoneExcept
 00529A2B    mov         eax,dword ptr [ebp-4]
 00529A2E    mov         eax,dword ptr [eax+10];TMark.fEdit:TmwCustomEdit
 00529A31    pop         edi
 00529A32    pop         esi
 00529A33    pop         ebx
 00529A34    pop         ecx
 00529A35    pop         ebp
 00529A36    ret
end;*}

//00529A38
{*function sub_00529A38(?:?):Boolean;
begin
 00529A38    cmp         dword ptr [eax+18],0
 00529A3C    setge       al
 00529A3F    ret
end;*}

//00529A54
{*procedure sub_00529A54(?:?);
begin
 00529A54    mov         dword ptr [eax+8],edx;TMark.fColumn:Integer
 00529A57    ret
end;*}

//00529A58
{*procedure sub_00529A58(?:?);
begin
 00529A58    push        ebx
 00529A59    mov         dword ptr [eax+0C],edx;TMark.fImage:Integer
 00529A5C    cmp         byte ptr [eax+14],0;TMark.fVisible:Boolean
>00529A60    je          00529A77
 00529A62    cmp         dword ptr [eax+10],0;TMark.fEdit:TmwCustomEdit
>00529A66    je          00529A77
 00529A68    mov         edx,dword ptr [eax+4];TMark.fLine:Integer
 00529A6B    mov         ecx,edx
 00529A6D    mov         ebx,dword ptr [eax+10];TMark.fEdit:TmwCustomEdit
 00529A70    mov         eax,ebx
 00529A72    call        0051CBEC
 00529A77    pop         ebx
 00529A78    ret
end;*}

//00529A7C
{*procedure sub_00529A7C(?:TMark; ?:?);
begin
 00529A7C    push        ebx
 00529A7D    mov         byte ptr [eax+15],dl;TMark.fInternalImage:Boolean
 00529A80    cmp         byte ptr [eax+14],0;TMark.fVisible:Boolean
>00529A84    je          00529A9B
 00529A86    cmp         dword ptr [eax+10],0;TMark.fEdit:TmwCustomEdit
>00529A8A    je          00529A9B
 00529A8C    mov         edx,dword ptr [eax+4];TMark.fLine:Integer
 00529A8F    mov         ecx,edx
 00529A91    mov         ebx,dword ptr [eax+10];TMark.fEdit:TmwCustomEdit
 00529A94    mov         eax,ebx
 00529A96    call        0051CBEC
 00529A9B    pop         ebx
 00529A9C    ret
end;*}

//00529AA0
{*procedure sub_00529AA0(?:?);
begin
 00529AA0    push        ebx
 00529AA1    push        esi
 00529AA2    mov         esi,edx
 00529AA4    mov         ebx,eax
 00529AA6    cmp         byte ptr [ebx+14],0;TMark.fVisible:Boolean
>00529AAA    je          00529AD9
 00529AAC    cmp         dword ptr [ebx+10],0;TMark.fEdit:TmwCustomEdit
>00529AB0    je          00529AD9
 00529AB2    mov         eax,dword ptr [ebx+4];TMark.fLine:Integer
 00529AB5    test        eax,eax
>00529AB7    jle         00529AC5
 00529AB9    mov         ecx,eax
 00529ABB    mov         edx,eax
 00529ABD    mov         eax,dword ptr [ebx+10];TMark.fEdit:TmwCustomEdit
 00529AC0    call        0051CBEC
 00529AC5    mov         eax,esi
 00529AC7    mov         dword ptr [ebx+4],eax;TMark.fLine:Integer
 00529ACA    mov         ecx,eax
 00529ACC    mov         edx,eax
 00529ACE    mov         eax,dword ptr [ebx+10];TMark.fEdit:TmwCustomEdit
 00529AD1    call        0051CBEC
 00529AD6    pop         esi
 00529AD7    pop         ebx
 00529AD8    ret
 00529AD9    mov         dword ptr [ebx+4],esi;TMark.fLine:Integer
 00529ADC    pop         esi
 00529ADD    pop         ebx
 00529ADE    ret
end;*}

//00529AE0
{*procedure sub_00529AE0(?:TMark; ?:?);
begin
 00529AE0    push        ebx
 00529AE1    cmp         dl,byte ptr [eax+14];TMark.fVisible:Boolean
>00529AE4    je          00529AFE
 00529AE6    mov         byte ptr [eax+14],dl;TMark.fVisible:Boolean
 00529AE9    mov         edx,dword ptr [eax+10];TMark.fEdit:TmwCustomEdit
 00529AEC    test        edx,edx
>00529AEE    je          00529AFE
 00529AF0    mov         ecx,dword ptr [eax+4];TMark.fLine:Integer
 00529AF3    mov         ebx,ecx
 00529AF5    mov         eax,edx
 00529AF7    mov         edx,ebx
 00529AF9    call        0051CBEC
 00529AFE    pop         ebx
 00529AFF    ret
end;*}

//00529B00
constructor TMark.Create(owner:TmwCustomEdit);
begin
{*
 00529B00    push        ebx
 00529B01    push        esi
 00529B02    push        edi
 00529B03    test        dl,dl
>00529B05    je          00529B0F
 00529B07    add         esp,0FFFFFFF0
 00529B0A    call        @ClassCreate
 00529B0F    mov         esi,ecx
 00529B11    mov         ebx,edx
 00529B13    mov         edi,eax
 00529B15    xor         edx,edx
 00529B17    mov         eax,edi
 00529B19    call        TObject.Create
 00529B1E    mov         dword ptr [edi+10],esi;TMark.fEdit:TmwCustomEdit
 00529B21    mov         eax,edi
 00529B23    test        bl,bl
>00529B25    je          00529B36
 00529B27    call        @AfterConstruction
 00529B2C    pop         dword ptr fs:[0]
 00529B33    add         esp,0C
 00529B36    mov         eax,edi
 00529B38    pop         edi
 00529B39    pop         esi
 00529B3A    pop         ebx
 00529B3B    ret
*}
end;

//00529B3C
function TMarkList.Add(Item:TMark):Integer;
begin
{*
 00529B3C    push        ebx
 00529B3D    push        esi
 00529B3E    mov         ebx,eax
 00529B40    mov         eax,ebx
 00529B42    call        TList.Add
 00529B47    mov         esi,eax
 00529B49    mov         eax,ebx
 00529B4B    call        00529C34
 00529B50    mov         eax,esi
 00529B52    pop         esi
 00529B53    pop         ebx
 00529B54    ret
*}
end;

//00529B58
procedure TMarkList.ClearLine(line:Integer);
begin
{*
 00529B58    push        ebx
 00529B59    push        esi
 00529B5A    push        edi
 00529B5B    mov         edi,edx
 00529B5D    mov         esi,eax
 00529B5F    mov         ebx,dword ptr [esi+8];TMarkList.FCount:Integer
 00529B62    dec         ebx
 00529B63    cmp         ebx,0
>00529B66    jl          00529B97
 00529B68    mov         edx,ebx
 00529B6A    mov         eax,esi
 00529B6C    call        00529C58
 00529B71    call        00529A38
 00529B76    test        al,al
>00529B78    jne         00529B91
 00529B7A    mov         edx,ebx
 00529B7C    mov         eax,esi
 00529B7E    call        00529C58
 00529B83    cmp         edi,dword ptr [eax+4]
>00529B86    jne         00529B91
 00529B88    mov         edx,ebx
 00529B8A    mov         eax,esi
 00529B8C    call        TMarkList.Delete
 00529B91    dec         ebx
 00529B92    cmp         ebx,0FFFFFFFF
>00529B95    jne         00529B68
 00529B97    pop         edi
 00529B98    pop         esi
 00529B99    pop         ebx
 00529B9A    ret
*}
end;

//00529B9C
constructor TMarkList.Create(owner:TmwCustomEdit);
begin
{*
 00529B9C    push        ebx
 00529B9D    push        esi
 00529B9E    push        edi
 00529B9F    test        dl,dl
>00529BA1    je          00529BAB
 00529BA3    add         esp,0FFFFFFF0
 00529BA6    call        @ClassCreate
 00529BAB    mov         esi,ecx
 00529BAD    mov         ebx,edx
 00529BAF    mov         edi,eax
 00529BB1    xor         edx,edx
 00529BB3    mov         eax,edi
 00529BB5    call        TObject.Create
 00529BBA    mov         dword ptr [edi+10],esi;TMarkList.fEdit:TmwCustomEdit
 00529BBD    mov         eax,edi
 00529BBF    test        bl,bl
>00529BC1    je          00529BD2
 00529BC3    call        @AfterConstruction
 00529BC8    pop         dword ptr fs:[0]
 00529BCF    add         esp,0C
 00529BD2    mov         eax,edi
 00529BD4    pop         edi
 00529BD5    pop         esi
 00529BD6    pop         ebx
 00529BD7    ret
*}
end;

//00529BD8
destructor TMarkList.Destroy();
begin
{*
 00529BD8    push        ebx
 00529BD9    push        esi
 00529BDA    push        edi
 00529BDB    push        ebp
 00529BDC    call        @BeforeDestruction
 00529BE1    mov         ebx,edx
 00529BE3    mov         edi,eax
 00529BE5    mov         ebp,dword ptr [edi+8];TMarkList.FCount:Integer
 00529BE8    dec         ebp
 00529BE9    test        ebp,ebp
>00529BEB    jl          00529C02
 00529BED    inc         ebp
 00529BEE    xor         esi,esi
 00529BF0    mov         edx,esi
 00529BF2    mov         eax,edi
 00529BF4    call        00529C58
 00529BF9    call        TObject.Free
 00529BFE    inc         esi
 00529BFF    dec         ebp
>00529C00    jne         00529BF0
 00529C02    mov         edx,ebx
 00529C04    and         dl,0FC
 00529C07    mov         eax,edi
 00529C09    call        TList.Destroy
 00529C0E    test        bl,bl
>00529C10    jle         00529C19
 00529C12    mov         eax,edi
 00529C14    call        @ClassDestroy
 00529C19    pop         ebp
 00529C1A    pop         edi
 00529C1B    pop         esi
 00529C1C    pop         ebx
 00529C1D    ret
*}
end;

//00529C20
procedure TMarkList.Delete(Index:Integer);
begin
{*
 00529C20    push        ebx
 00529C21    mov         ebx,eax
 00529C23    mov         eax,ebx
 00529C25    call        TList.Delete
 00529C2A    mov         eax,ebx
 00529C2C    call        00529C34
 00529C31    pop         ebx
 00529C32    ret
*}
end;

//00529C34
procedure sub_00529C34(?:TMarkList);
begin
{*
 00529C34    push        ebx
 00529C35    cmp         word ptr [eax+1A],0;TMarkList.?f1A:word
>00529C3A    je          00529C46
 00529C3C    mov         ebx,eax
 00529C3E    mov         edx,eax
 00529C40    mov         eax,dword ptr [ebx+1C];TMarkList.?f1C:TmwCustomEdit
 00529C43    call        dword ptr [ebx+18];TMarkList.fOnChange
 00529C46    pop         ebx
 00529C47    ret
*}
end;

//00529C48
procedure TMarkList.First;
begin
{*
 00529C48    push        ebx
 00529C49    mov         ebx,eax
 00529C4B    mov         eax,ebx
 00529C4D    xor         edx,edx
 00529C4F    call        TList.Get
 00529C54    pop         ebx
 00529C55    ret
*}
end;

//00529C58
{*function sub_00529C58(?:TMarkList; ?:?):?;
begin
 00529C58    push        ebx
 00529C59    push        esi
 00529C5A    mov         esi,edx
 00529C5C    mov         ebx,eax
 00529C5E    mov         edx,esi
 00529C60    mov         eax,ebx
 00529C62    call        TList.Get
 00529C67    pop         esi
 00529C68    pop         ebx
 00529C69    ret
end;*}

//00529C6C
procedure TMarkList.GetMarksForLine(line:Integer; var marks:TMarks);
begin
{*
 00529C6C    push        ebx
 00529C6D    push        esi
 00529C6E    push        edi
 00529C6F    push        ebp
 00529C70    add         esp,0FFFFFFF8
 00529C73    mov         dword ptr [esp+4],ecx
 00529C77    mov         dword ptr [esp],edx
 00529C7A    mov         edi,eax
 00529C7C    mov         eax,dword ptr [esp+4]
 00529C80    xor         ecx,ecx
 00529C82    mov         edx,40
 00529C87    call        @FillChar
 00529C8C    xor         ebp,ebp
 00529C8E    mov         esi,dword ptr [edi+8];TMarkList.FCount:Integer
 00529C91    dec         esi
 00529C92    test        esi,esi
>00529C94    jl          00529CC5
 00529C96    inc         esi
 00529C97    xor         ebx,ebx
 00529C99    mov         edx,ebx
 00529C9B    mov         eax,edi
 00529C9D    call        00529C58
 00529CA2    mov         eax,dword ptr [eax+4]
 00529CA5    cmp         eax,dword ptr [esp]
>00529CA8    jne         00529CC1
 00529CAA    inc         ebp
 00529CAB    mov         edx,ebx
 00529CAD    mov         eax,edi
 00529CAF    call        00529C58
 00529CB4    mov         edx,dword ptr [esp+4]
 00529CB8    mov         dword ptr [edx+ebp*4-4],eax
 00529CBC    cmp         ebp,10
>00529CBF    je          00529CC5
 00529CC1    inc         ebx
 00529CC2    dec         esi
>00529CC3    jne         00529C99
 00529CC5    pop         ecx
 00529CC6    pop         edx
 00529CC7    pop         ebp
 00529CC8    pop         edi
 00529CC9    pop         esi
 00529CCA    pop         ebx
 00529CCB    ret
*}
end;

//00529CCC
procedure TMarkList.Insert(Index:Integer; Item:TMark);
begin
{*
 00529CCC    push        ebx
 00529CCD    mov         ebx,eax
 00529CCF    mov         eax,ebx
 00529CD1    call        TList.Insert
 00529CD6    mov         eax,ebx
 00529CD8    call        00529C34
 00529CDD    pop         ebx
 00529CDE    ret
*}
end;

//00529CE0
procedure TMarkList.Last;
begin
{*
 00529CE0    push        ebx
 00529CE1    mov         ebx,eax
 00529CE3    mov         eax,ebx
 00529CE5    call        TList.Last
 00529CEA    pop         ebx
 00529CEB    ret
*}
end;

//00529CEC
procedure TMarkList.Place(mark:TMark);
begin
{*
 00529CEC    push        ebx
 00529CED    push        esi
 00529CEE    push        ecx
 00529CEF    mov         dword ptr [esp],edx
 00529CF2    mov         ebx,eax
 00529CF4    mov         eax,dword ptr [ebx+10];TMarkList.fEdit:TmwCustomEdit
 00529CF7    test        eax,eax
>00529CF9    je          00529D17
 00529CFB    cmp         word ptr [eax+37A],0;TmwCustomEdit.?f37A:word
>00529D03    je          00529D17
 00529D05    mov         ecx,esp
 00529D07    mov         esi,eax
 00529D09    mov         edx,eax
 00529D0B    mov         eax,dword ptr [esi+37C];TmwCustomEdit.?f37C:dword
 00529D11    call        dword ptr [esi+378];TmwCustomEdit.fOnPlaceMark
 00529D17    cmp         dword ptr [esp],0
>00529D1B    je          00529D27
 00529D1D    mov         edx,dword ptr [esp]
 00529D20    mov         eax,ebx
 00529D22    call        TMarkList.Add
 00529D27    mov         eax,ebx
 00529D29    call        00529C34
 00529D2E    pop         edx
 00529D2F    pop         esi
 00529D30    pop         ebx
 00529D31    ret
*}
end;

//00529D34
function TMarkList.Remove(Item:TMark):Integer;
begin
{*
 00529D34    push        ebx
 00529D35    push        esi
 00529D36    mov         ebx,eax
 00529D38    mov         eax,ebx
 00529D3A    xor         ecx,ecx
 00529D3C    call        TList.RemoveItem
 00529D41    mov         esi,eax
 00529D43    mov         eax,ebx
 00529D45    call        00529C34
 00529D4A    mov         eax,esi
 00529D4C    pop         esi
 00529D4D    pop         ebx
 00529D4E    ret
*}
end;

Initialization
//00780DDC
{*
 00780DDC    sub         dword ptr ds:[793B28],1
>00780DE3    jae         00780DF4
 00780DE5    push        780DF8;'mwEdit Wide Control Block'
 00780DEA    call        user32.RegisterClipboardFormatW
 00780DEF    mov         [00793B24],eax;gvar_00793B24:LongWord
 00780DF4    ret
*}
Finalization
end.