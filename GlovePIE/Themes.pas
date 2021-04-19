//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit Themes;

interface

uses
  SysUtils, Classes;

type
  TThemedElement = (teButton, teClock, teComboBox, teEdit, teExplorerBar, teHeader, teListView, teMenu, tePage, teProgress, teRebar, teScrollBar, teSpin, teStartPanel, teStatus, teTab, teTaskBand, teTaskBar, teToolBar, teToolTip, teTrackBar, teTrayNotify, teTreeview, teWindow);
  TThemedButton = (tbButtonDontCare, tbButtonRoot, tbPushButtonNormal, tbPushButtonHot, tbPushButtonPressed, tbPushButtonDisabled, tbPushButtonDefaulted, tbRadioButtonUncheckedNormal, tbRadioButtonUncheckedHot, tbRadioButtonUncheckedPressed, tbRadioButtonUncheckedDisabled, tbRadioButtonCheckedNormal, tbRadioButtonCheckedHot, tbRadioButtonCheckedPressed, tbRadioButtonCheckedDisabled, tbCheckBoxUncheckedNormal, tbCheckBoxUncheckedHot, tbCheckBoxUncheckedPressed, tbCheckBoxUncheckedDisabled, tbCheckBoxCheckedNormal, tbCheckBoxCheckedHot, tbCheckBoxCheckedPressed, tbCheckBoxCheckedDisabled, tbCheckBoxMixedNormal, tbCheckBoxMixedHot, tbCheckBoxMixedPressed, tbCheckBoxMixedDisabled, tbGroupBoxNormal, tbGroupBoxDisabled, tbUserButton);
  TThemedClock = (tcClockDontCare, tcClockRoot, tcTimeNormal);
  TThemedComboBox = (tcComboBoxDontCare, tcComboBoxRoot, tcDropDownButtonNormal, tcDropDownButtonHot, tcDropDownButtonPressed, tcDropDownButtonDisabled);
  TThemedEdit = (teEditDontCare, teEditRoot, teEditTextNormal, teEditTextHot, teEditTextSelected, teEditTextDisabled, teEditTextFocused, teEditTextReadOnly, teEditTextAssist, teEditCaret);
  TThemedExplorerBar = (tebExplorerBarDontCare, tebExplorerBarRoot, tebHeaderBackgroundNormal, tebHeaderBackgroundHot, tebHeaderBackgroundPressed, tebHeaderCloseNormal, tebHeaderCloseHot, tebHeaderClosePressed, tebHeaderPinNormal, tebHeaderPinHot, tebHeaderPinPressed, tebHeaderPinSelectedNormal, tebHeaderPinSelectedHot, tebHeaderPinSelectedPressed, tebIEBarMenuNormal, tebIEBarMenuHot, tebIEBarMenuPressed, tebNormalGroupBackground, tebNormalGroupCollapseNormal, tebNormalGroupCollapseHot, tebNormalGroupCollapsePressed, tebNormalGroupExpandNormal, tebNormalGroupExpandHot, tebNormalGroupExpandPressed, tebNormalGroupHead, tebSpecialGroupBackground, tebSpecialGroupCollapseSpecial, tebSpecialGroupCollapseHot, tebSpecialGroupCollapsePressed, tebSpecialGroupExpandSpecial, tebSpecialGroupExpandHot, tebSpecialGroupExpandPressed, tebSpecialGroupHead);
  TThemedHeader = (thHeaderDontCare, thHeaderRoot, thHeaderItemNormal, thHeaderItemHot, thHeaderItemPressed, thHeaderItemLeftNormal, thHeaderItemLeftHot, thHeaderItemLeftPressed, thHeaderItemRightNormal, thHeaderItemRightHot, thHeaderItemRightPressed, thHeaderSortArrowSortedUp, thHeaderSortArrowSortedDown);
  TThemedListview = (tlListviewDontCare, tlListviewRoot, tlListItemNormal, tlListItemHot, tlListItemSelected, tlListItemDisabled, tlListItemSelectedNotFocus, tlListGroup, tlListDetail, tlListSortDetail, tlEmptyText);
  TThemedMenu = (tmMenuDontCare, tmMenuRoot, tmMenuItemNormal, tmMenuItemSelected, tmMenuItemDemoted, tmMenuDropDown, tmMenuBarItem, tmMenuBarDropDown, tmChevron, tmSeparator);
  TThemedPage = (tpPageDontCare, tpPageRoot, tpUpNormal, tpUpHot, tpUpPressed, tpUpDisabled, tpDownNormal, tpDownHot, tpDownPressed, tpDownDisabled, tpUpHorzNormal, tpUpHorzHot, tpUpHorzPressed, tpUpHorzDisabled, tpDownHorzNormal, tpDownHorzHot, tpDownHorzPressed, tpDownHorzDisabled);
  TThemedProgress = (tpProgressDontCare, tpProgressRoot, tpBar, tpBarVert, tpChunk, tpChunkVert);
  TThemedRebar = (trRebarDontCare, trRebarRoot, trGripper, trGripperVert, trBandNormal, trBandHot, trBandPressed, trBandDisabled, trBandChecked, trBandHotChecked, trChevronNormal, trChevronHot, trChevronPressed, trChevronDisabled, trChevronVertNormal, trChevronVertHot, trChevronVertPressed, trChevronVertDisabled);
  TThemedScrollBar = (tsScrollBarDontCare, tsScrollBarRoot, tsArrowBtnUpNormal, tsArrowBtnUpHot, tsArrowBtnUpPressed, tsArrowBtnUpDisabled, tsArrowBtnDownNormal, tsArrowBtnDownHot, tsArrowBtnDownPressed, tsArrowBtnDownDisabled, tsArrowBtnLeftNormal, tsArrowBtnLeftHot, tsArrowBtnLeftPressed, tsArrowBtnLeftDisabled, tsArrowBtnRightNormal, tsArrowBtnRightHot, tsArrowBtnRightPressed, tsArrowBtnRightDisabled, tsThumbBtnHorzNormal, tsThumbBtnHorzHot, tsThumbBtnHorzPressed, tsThumbBtnHorzDisabled, tsThumbBtnVertNormal, tsThumbBtnVertHot, tsThumbBtnVertPressed, tsThumbBtnVertDisabled, tsLowerTrackHorzNormal, tsLowerTrackHorzHot, tsLowerTrackHorzPressed, tsLowerTrackHorzDisabled, tsUpperTrackHorzNormal, tsUpperTrackHorzHot, tsUpperTrackHorzPressed, tsUpperTrackHorzDisabled, tsLowerTrackVertNormal, tsLowerTrackVertHot, tsLowerTrackVertPressed, tsLowerTrackVertDisabled, tsUpperTrackVertNormal, tsUpperTrackVertHot, tsUpperTrackVertPressed, tsUpperTrackVertDisabled, tsGripperHorzNormal, tsGripperHorzHot, tsGripperHorzPressed, tsGripperHorzDisabled, tsGripperVertNormal, tsGripperVertHot, tsGripperVertPressed, tsGripperVertDisabled, tsSizeBoxRightAlign, tsSizeBoxLeftAlign);
  TThemedSpin = (tsSpinDontCare, tsSpinRoot, tsUpNormal, tsUpHot, tsUpPressed, tsUpDisabled, tsDownNormal, tsDownHot, tsDownPressed, tsDownDisabled, tsUpHorzNormal, tsUpHorzHot, tsUpHorzPressed, tsUpHorzDisabled, tsDownHorzNormal, tsDownHorzHot, tsDownHorzPressed, tsDownHorzDisabled);
  TThemedStartPanel = (tspStartPanelDontCare, tspStartPanelRoot, tspUserPane, tspMorePrograms, tspMoreProgramsArrowNormal, tspMoreProgramsArrowHot, tspMoreProgramsArrowPressed, tspProgList, tspProgListSeparator, tspPlacesList, tspPlacesListSeparator, tspLogOff, tspLogOffButtonsNormal, tspLogOffButtonsHot, tspLogOffButtonsPressed, tspUserPicture, tspPreview);
  TThemedStatus = (tsStatusDontCare, tsStatusRoot, tsPane, tsGripperPane, tsGripper);
  TThemedTab = (ttTabDontCare, ttTabRoot, ttTabItemNormal, ttTabItemHot, ttTabItemSelected, ttTabItemDisabled, ttTabItemFocused, ttTabItemLeftEdgeNormal, ttTabItemLeftEdgeHot, ttTabItemLeftEdgeSelected, ttTabItemLeftEdgeDisabled, ttTabItemLeftEdgeFocused, ttTabItemRightEdgeNormal, ttTabItemRightEdgeHot, ttTabItemRightEdgeSelected, ttTabItemRightEdgeDisabled, ttTabItemRightEdgeFocused, ttTabItemBothEdgeNormal, ttTabItemBothEdgeHot, ttTabItemBothEdgeSelected, ttTabItemBothEdgeDisabled, ttTabItemBothEdgeFocused, ttTopTabItemNormal, ttTopTabItemHot, ttTopTabItemSelected, ttTopTabItemDisabled, ttTopTabItemFocused, ttTopTabItemLeftEdgeNormal, ttTopTabItemLeftEdgeHot, ttTopTabItemLeftEdgeSelected, ttTopTabItemLeftEdgeDisabled, ttTopTabItemLeftEdgeFocused, ttTopTabItemRightEdgeNormal, ttTopTabItemRightEdgeHot, ttTopTabItemRightEdgeSelected, ttTopTabItemRightEdgeDisabled, ttTopTabItemRightEdgeFocused, ttTopTabItemBothEdgeNormal, ttTopTabItemBothEdgeHot, ttTopTabItemBothEdgeSelected, ttTopTabItemBothEdgeDisabled, ttTopTabItemBothEdgeFocused, ttPane, ttBody);
  TThemedTaskBand = (ttbTaskBandDontCare, ttbTaskBandRoot, ttbGroupCount, ttbFlashButton, ttpFlashButtonGroupMenu);
  TThemedTaskBar = (ttTaskBarDontCare, ttTaskBarRoot, ttbTimeNormal);
  TThemedToolBar = (ttbToolBarDontCare, ttbToolBarRoot, ttbButtonNormal, ttbButtonHot, ttbButtonPressed, ttbButtonDisabled, ttbButtonChecked, ttbButtonCheckedHot, ttbDropDownButtonNormal, ttbDropDownButtonHot, ttbDropDownButtonPressed, ttbDropDownButtonDisabled, ttbDropDownButtonChecked, ttbDropDownButtonCheckedHot, ttbSplitButtonNormal, ttbSplitButtonHot, ttbSplitButtonPressed, ttbSplitButtonDisabled, ttbSplitButtonChecked, ttbSplitButtonCheckedHot, ttbSplitButtonDropDownNormal, ttbSplitButtonDropDownHot, ttbSplitButtonDropDownPressed, ttbSplitButtonDropDownDisabled, ttbSplitButtonDropDownChecked, ttbSplitButtonDropDownCheckedHot, ttbSeparatorNormal, ttbSeparatorHot, ttbSeparatorPressed, ttbSeparatorDisabled, ttbSeparatorChecked, ttbSeparatorCheckedHot, ttbSeparatorVertNormal, ttbSeparatorVertHot, ttbSeparatorVertPressed, ttbSeparatorVertDisabled, ttbSeparatorVertChecked, ttbSeparatorVertCheckedHot);
  TThemedToolTip = (tttToolTipDontCare, tttToolTipRoot, tttStandardNormal, tttStandardLink, tttStandardTitleNormal, tttStandardTitleLink, tttBaloonNormal, tttBaloonLink, tttBaloonTitleNormal, tttBaloonTitleLink, tttBaloonStemUpLeft, tttBaloonStemDownLeft, tttCloseNormal, tttCloseHot, tttClosePressed);
  TThemedTrackBar = (ttbTrackBarDontCare, ttbTrackBarRoot, ttbTrack, ttbTrackVert, ttbThumbNormal, ttbThumbHot, ttbThumbPressed, ttbThumbFocused, ttbThumbDisabled, ttbThumbBottomNormal, ttbThumbBottomHot, ttbThumbBottomPressed, ttbThumbBottomFocused, ttbThumbBottomDisabled, ttbThumbTopNormal, ttbThumbTopHot, ttbThumbTopPressed, ttbThumbTopFocused, ttbThumbTopDisabled, ttbThumbVertNormal, ttbThumbVertHot, ttbThumbVertPressed, ttbThumbVertFocused, ttbThumbVertDisabled, ttbThumbLeftNormal, ttbThumbLeftHot, ttbThumbLeftPressed, ttbThumbLeftFocused, ttbThumbLeftDisabled, ttbThumbRightNormal, ttbThumbRightHot, ttbThumbRightPressed, ttbThumbRightFocused, ttbThumbRightDisabled, ttbThumbTics, ttbThumbTicsVert);
  TThemedTrayNotify = (ttnTrayNotifyDontCare, ttnTrayNotifyRoot, ttnBackground, ttnAnimBackground);
  TThemedTreeview = (ttTreeviewDontCare, ttTreeviewRoot, ttItemNormal, ttItemHot, ttItemSelected, ttItemDisabled, ttItemSelectedNotFocus, ttGlyphClosed, ttGlyphOpened, ttBranch);
  TThemedWindow = (twWindowDontCare, twWindowRoot, twCaptionActive, twCaptionInactive, twCaptionDisabled, twSmallCaptionActive, twSmallCaptionInactive, twSmallCaptionDisabled, twMinCaptionActive, twMinCaptionInactive, twMinCaptionDisabled, twSmallMinCaptionActive, twSmallMinCaptionInactive, twSmallMinCaptionDisabled, twMaxCaptionActive, twMaxCaptionInactive, twMaxCaptionDisabled, twSmallMaxCaptionActive, twSmallMaxCaptionInactive, twSmallMaxCaptionDisabled, twFrameLeftActive, twFrameLeftInactive, twFrameRightActive, twFrameRightInactive, twFrameBottomActive, twFrameBottomInactive, twSmallFrameLeftActive, twSmallFrameLeftInactive, twSmallFrameRightActive, twSmallFrameRightInactive, twSmallFrameBottomActive, twSmallFrameBottomInactive, twSysButtonNormal, twSysButtonHot, twSysButtonPushed, twSysButtonDisabled, twMDISysButtonNormal, twMDISysButtonHot, twMDISysButtonPushed, twMDISysButtonDisabled, twMinButtonNormal, twMinButtonHot, twMinButtonPushed, twMinButtonDisabled, twMDIMinButtonNormal, twMDIMinButtonHot, twMDIMinButtonPushed, twMDIMinButtonDisabled, twMaxButtonNormal, twMaxButtonHot, twMaxButtonPushed, twMaxButtonDisabled, twCloseButtonNormal, twCloseButtonHot, twCloseButtonPushed, twCloseButtonDisabled, twSmallCloseButtonNormal, twSmallCloseButtonHot, twSmallCloseButtonPushed, twSmallCloseButtonDisabled, twMDICloseButtonNormal, twMDICloseButtonHot, twMDICloseButtonPushed, twMDICloseButtonDisabled, twRestoreButtonNormal, twRestoreButtonHot, twRestoreButtonPushed, twRestoreButtonDisabled, twMDIRestoreButtonNormal, twMDIRestoreButtonHot, twMDIRestoreButtonPushed, twMDIRestoreButtonDisabled, twHelpButtonNormal, twHelpButtonHot, twHelpButtonPushed, twHelpButtonDisabled, twMDIHelpButtonNormal, twMDIHelpButtonHot, twMDIHelpButtonPushed, twMDIHelpButtonDisabled, twHorzScrollNormal, twHorzScrollHot, twHorzScrollPushed, twHorzScrollDisabled, twHorzThumbNormal, twHorzThumbHot, twHorzThumbPushed, twHorzThumbDisabled, twVertScrollNormal, twVertScrollHot, twVertScrollPushed, twVertScrollDisabled, twVertThumbNormal, twVertThumbHot, twVertThumbPushed, twVertThumbDisabled, twDialog, twCaptionSizingTemplate, twSmallCaptionSizingTemplate, twFrameLeftSizingTemplate, twSmallFrameLeftSizingTemplate, twFrameRightSizingTemplate, twSmallFrameRightSizingTemplate, twFrameBottomSizingTemplate, twSmallFrameBottomSizingTemplate);
  TThemeData = array [TThemedElement] of Cardinal;
  TThemedElementDetails = TThemedElementDetails = record//size=C
Element:TThemedElement;//f0
Part:Integer;//f4
State:Integer;//f8
end;;
  TThemeServices = class(TObject)
  published
    function GetElementDetails(Detail:TThemedSpin):TThemedElementDetails;//0049A7C4
    function GetElementDetails(Detail:TThemedScrollBar):TThemedElementDetails;//0049A6A4
    function GetElementDetails(Detail:TThemedStartPanel):TThemedElementDetails;//0049A828
    function GetElementDetails(Detail:TThemedTab):TThemedElementDetails;//0049A984
    function GetElementDetails(Detail:TThemedStatus):TThemedElementDetails;//0049A934
    function GetElementDetails(Detail:TThemedMenu):TThemedElementDetails;//0049A4A0
    function GetElementDetails(Detail:TThemedListview):TThemedElementDetails;//0049A408
    function GetElementDetails(Detail:TThemedPage):TThemedElementDetails;//0049A544
    function GetElementDetails(Detail:TThemedRebar):TThemedElementDetails;//0049A608
    function GetElementDetails(Detail:TThemedProgress):TThemedElementDetails;//0049A5A8
    function GetElementDetails(Detail:TThemedTaskBand):TThemedElementDetails;//0049AA9C
    function GetElementDetails(Detail:TThemedWindow):TThemedElementDetails;//0049AE10
    function GetElementDetails(Detail:TThemedTreeview):TThemedElementDetails;//0049ADC0
    function HasTransparentParts(Details:TThemedElementDetails):Boolean;//0049B19C
    procedure UpdateThemes;//0049B380
    procedure PaintBorder(Control:TWinControl; EraseLRCorner:Boolean);//0049B1DC
    function GetElementDetails(Detail:TThemedToolBar):TThemedElementDetails;//0049AB14
    function GetElementDetails(Detail:TThemedTaskBar):TThemedElementDetails;//0049AAEC
    function GetElementDetails(Detail:TThemedToolTip):TThemedElementDetails;//0049ABAC
    function GetElementDetails(Detail:TThemedTrayNotify):TThemedElementDetails;//0049AD84
    function GetElementDetails(Detail:TThemedTrackBar):TThemedElementDetails;//0049AC74
    function GetElementDetails(Detail:TThemedHeader):TThemedElementDetails;//0049A3A4
    procedure DrawElement(DC:HDC; Details:TThemedElementDetails; R:TRect);//00499F2C
    procedure DrawEdge(DC:HDC; Details:TThemedElementDetails; Flags:Cardinal; Edge:Cardinal; R:TRect);//00499E94
    procedure DrawElement(DC:HDC; Details:TThemedElementDetails; ClipRect:TRect; R:TRect);//00499F70
    procedure DrawText(DC:HDC; Details:TThemedElementDetails; Flags2:Cardinal; Flags:Cardinal; R:TRect; S:WideString);//0049A0EC
    procedure DrawIcon(DC:HDC; Details:TThemedElementDetails; Index:Integer; himl:Cardinal; R:TRect);//0049A004
    destructor Destroy();//00499D30
    constructor Create();//00499CAC
    procedure ApplyThemeChange;//00499DF4
    function ContentRect(DC:HDC; Details:TThemedElementDetails; BoundingRect:TRect):TRect;//00499E44
    function ColorToRGB(Color:TColor):Cardinal;//00499E08
    function ColorToRGB(Color:TColor; Details:PThemedElementDetails):Cardinal;//00499E0C
    function GetElementDetails(Detail:TThemedClock):TThemedElementDetails;//0049A1E0
    function GetElementDetails(Detail:TThemedButton):TThemedElementDetails;//0049A15C
    function GetElementDetails(Detail:TThemedComboBox):TThemedElementDetails;//0049A208
    function GetElementDetails(Detail:TThemedExplorerBar):TThemedElementDetails;//0049A270
    function GetElementDetails(Detail:TThemedEdit):TThemedElementDetails;//0049A234
    procedure DrawElement(DC:HDC; Details:TThemedElementDetails; ClipRect:PRect; R:TRect);//00499FC0
    procedure DrawEdge(DC:HDC; Details:TThemedElementDetails; ContentRect:PRect; Flags:Cardinal; Edge:Cardinal; R:TRect);//00499EE0
    procedure DrawParentBackground(Window:HWND; Target:HDC; Bounds:PRect; OnlyIfTransparent:Boolean; Details:PThemedElementDetails);//0049A04C
    procedure DrawParentBackground(Window:HWND; Target:HDC; Bounds:PRect; OnlyIfTransparent:Boolean; Details:TThemedElementDetails);//0049A0D0
    procedure DrawParentBackground(Window:HWND; Target:HDC; Bounds:TRect; OnlyIfTransparent:Boolean; Details:PThemedElementDetails);//0049A0B4
  public
    FNewComCtrls:Boolean;//f4
    FThemesAvailable:Boolean;//f5
    FUseThemes:Boolean;//f6
    FThemeData:TThemeData;//f8
    FOnThemeChange:TNotifyEvent;//f68
    destructor Destroy(); virtual;//00499D30
    procedure DoOnThemeChange; virtual;//v0//00499DB0
    constructor Create(); virtual;//v4//00499CAC
    function GetTheme(Element:TThemedElement):HTHEME;//00499D58
    function GetThemesEnabled:Boolean;//00499D98
    procedure UnloadThemeData;//00499DC4
  end;
    function UnthemedDesigner(AControl:TControl):Boolean;//00499C20
    function ThemeServices:TThemeServices;//00499C8C
    procedure DoOnThemeChange;//00499DB0
    function ThemeControl(AControl:TControl):Boolean;//0049B39C

implementation

//00499C20
function UnthemedDesigner(AControl:TControl):Boolean;
begin
{*
 00499C20    push        ebx
 00499C21    mov         ebx,eax
 00499C23    xor         eax,eax
 00499C25    test        ebx,ebx
>00499C27    je          00499C61
 00499C29    test        byte ptr [ebx+1C],10
>00499C2D    je          00499C61
 00499C2F    cmp         dword ptr ds:[793220],0
>00499C36    jne         00499C47
 00499C38    push        499C64
 00499C3D    call        user32.RegisterWindowMessageW
 00499C42    mov         [00793220],eax
 00499C47    push        0
 00499C49    mov         ecx,64
 00499C4E    mov         edx,dword ptr ds:[793220]
 00499C54    mov         eax,ebx
 00499C56    call        TControl.Perform
 00499C5B    cmp         eax,64
 00499C5E    sete        al
 00499C61    pop         ebx
 00499C62    ret
*}
end;

//00499C8C
function ThemeServices:TThemeServices;
begin
{*
 00499C8C    cmp         dword ptr ds:[79321C],0
>00499C93    jne         00499CA4
 00499C95    mov         dl,1
 00499C97    mov         eax,[00785B50]
 00499C9C    call        dword ptr [eax+4]
 00499C9F    mov         [0079321C],eax
 00499CA4    mov         eax,[0079321C]
 00499CA9    ret
*}
end;

//00499CAC
constructor TThemeServices.Create();
begin
{*
 00499CAC    push        ebx
 00499CAD    push        esi
 00499CAE    test        dl,dl
>00499CB0    je          00499CBA
 00499CB2    add         esp,0FFFFFFF0
 00499CB5    call        @ClassCreate
 00499CBA    mov         ebx,edx
 00499CBC    mov         esi,eax
 00499CBE    xor         edx,edx
 00499CC0    mov         eax,esi
 00499CC2    call        TObject.Create
 00499CC7    call        InitThemeLibrary
 00499CCC    mov         byte ptr [esi+5],al
 00499CCF    mov         eax,499D14;'comctl32.dll'
 00499CD4    call        GetFileVersion
 00499CD9    cmp         eax,60000
 00499CDE    setae       al
 00499CE1    mov         byte ptr [esi+4],al
 00499CE4    mov         eax,esi
 00499CE6    call        TThemeServices.UpdateThemes
 00499CEB    mov         eax,esi
 00499CED    test        bl,bl
>00499CEF    je          00499D00
 00499CF1    call        @AfterConstruction
 00499CF6    pop         dword ptr fs:[0]
 00499CFD    add         esp,0C
 00499D00    mov         eax,esi
 00499D02    pop         esi
 00499D03    pop         ebx
 00499D04    ret
*}
end;

//00499D30
destructor TThemeServices.Destroy();
begin
{*
 00499D30    push        ebx
 00499D31    push        esi
 00499D32    call        @BeforeDestruction
 00499D37    mov         ebx,edx
 00499D39    mov         esi,eax
 00499D3B    mov         eax,esi
 00499D3D    call        TThemeServices.UnloadThemeData
 00499D42    call        FreeThemeLibrary
 00499D47    test        bl,bl
>00499D49    jle         00499D52
 00499D4B    mov         eax,esi
 00499D4D    call        @ClassDestroy
 00499D52    pop         esi
 00499D53    pop         ebx
 00499D54    ret
*}
end;

//00499D58
function TThemeServices.GetTheme(Element:TThemedElement):HTHEME;
begin
{*
 00499D58    push        ebx
 00499D59    push        esi
 00499D5A    push        edi
 00499D5B    mov         ebx,edx
 00499D5D    mov         esi,eax
 00499D5F    cmp         byte ptr [esi+6],0
>00499D63    je          00499D8B
 00499D65    movzx       eax,bl
 00499D68    cmp         dword ptr [esi+eax*4+8],0
>00499D6D    jne         00499D8B
 00499D6F    mov         edi,ebx
 00499D71    and         edi,7F
 00499D74    mov         eax,dword ptr [edi*4+785B58]
 00499D7B    push        eax
 00499D7C    push        0
 00499D7E    mov         eax,[0078CFAC];OpenThemeData:function(val hwnd:Windows.HWND;val pszClassList:Windows.LPC...
 00499D83    mov         eax,dword ptr [eax]
 00499D85    call        eax
 00499D87    mov         dword ptr [esi+edi*4+8],eax
 00499D8B    movzx       eax,bl
 00499D8E    mov         eax,dword ptr [esi+eax*4+8]
 00499D92    pop         edi
 00499D93    pop         esi
 00499D94    pop         ebx
 00499D95    ret
*}
end;

//00499D98
function TThemeServices.GetThemesEnabled:Boolean;
begin
{*
 00499D98    cmp         byte ptr [eax+5],0
>00499D9C    je          00499DAA
 00499D9E    cmp         byte ptr [eax+6],0
>00499DA2    je          00499DAA
 00499DA4    cmp         byte ptr [eax+4],0
>00499DA8    jne         00499DAD
 00499DAA    xor         eax,eax
 00499DAC    ret
 00499DAD    mov         al,1
 00499DAF    ret
*}
end;

//00499DB0
procedure TThemeServices.DoOnThemeChange;
begin
{*
 00499DB0    push        ebx
 00499DB1    cmp         word ptr [eax+6A],0
>00499DB6    je          00499DC2
 00499DB8    mov         ebx,eax
 00499DBA    mov         edx,eax
 00499DBC    mov         eax,dword ptr [ebx+6C]
 00499DBF    call        dword ptr [ebx+68]
 00499DC2    pop         ebx
 00499DC3    ret
*}
end;

//00499DC4
procedure TThemeServices.UnloadThemeData;
begin
{*
 00499DC4    push        ebx
 00499DC5    push        esi
 00499DC6    push        edi
 00499DC7    mov         esi,eax
 00499DC9    xor         ebx,ebx
 00499DCB    mov         edi,ebx
 00499DCD    and         edi,7F
 00499DD0    mov         eax,dword ptr [esi+edi*4+8]
 00499DD4    test        eax,eax
>00499DD6    je          00499DE8
 00499DD8    push        eax
 00499DD9    mov         eax,[0078D320];CloseThemeData:function(val hTheme:Windows.THandle):System.HRESULT stdcal...
 00499DDE    mov         eax,dword ptr [eax]
 00499DE0    call        eax
 00499DE2    xor         eax,eax
 00499DE4    mov         dword ptr [esi+edi*4+8],eax
 00499DE8    inc         ebx
 00499DE9    cmp         bl,18
>00499DEC    jne         00499DCB
 00499DEE    pop         edi
 00499DEF    pop         esi
 00499DF0    pop         ebx
 00499DF1    ret
*}
end;

//00499DF4
procedure TThemeServices.ApplyThemeChange;
begin
{*
 00499DF4    push        ebx
 00499DF5    mov         ebx,eax
 00499DF7    mov         eax,ebx
 00499DF9    call        TThemeServices.UpdateThemes
 00499DFE    mov         eax,ebx
 00499E00    mov         edx,dword ptr [eax]
 00499E02    call        dword ptr [edx]
 00499E04    pop         ebx
 00499E05    ret
*}
end;

//00499E08
function TThemeServices.ColorToRGB(Color:TColor):Cardinal;
begin
{*
 00499E08    mov         eax,edx
 00499E0A    ret
*}
end;

//00499E0C
function TThemeServices.ColorToRGB(Color:TColor; Details:PThemedElementDetails):Cardinal;
begin
{*
 00499E0C    push        ebx
 00499E0D    push        esi
 00499E0E    push        edi
 00499E0F    mov         edi,ecx
 00499E11    mov         ebx,edx
 00499E13    mov         esi,eax
 00499E15    test        ebx,80000000
>00499E1B    je          00499E21
 00499E1D    test        edi,edi
>00499E1F    jne         00499E25
 00499E21    mov         eax,ebx
>00499E23    jmp         00499E40
 00499E25    and         ebx,7FFFFFFF
 00499E2B    push        ebx
 00499E2C    movzx       edx,byte ptr [edi]
 00499E2F    mov         eax,esi
 00499E31    call        TThemeServices.GetTheme
 00499E36    push        eax
 00499E37    mov         eax,[0078CE48];GetThemeSysColor:function(val hTheme:Windows.THandle;val iColorId:System....
 00499E3C    mov         eax,dword ptr [eax]
 00499E3E    call        eax
 00499E40    pop         edi
 00499E41    pop         esi
 00499E42    pop         ebx
 00499E43    ret
*}
end;

//00499E44
function TThemeServices.ContentRect(DC:HDC; Details:TThemedElementDetails; BoundingRect:TRect):TRect;
begin
{*
 00499E44    push        ebp
 00499E45    mov         ebp,esp
 00499E47    add         esp,0FFFFFFE4
 00499E4A    push        ebx
 00499E4B    push        esi
 00499E4C    push        edi
 00499E4D    mov         esi,dword ptr [ebp+0C]
 00499E50    lea         edi,[ebp-1C]
 00499E53    movs        dword ptr [edi],dword ptr [esi]
 00499E54    movs        dword ptr [edi],dword ptr [esi]
 00499E55    movs        dword ptr [edi],dword ptr [esi]
 00499E56    movs        dword ptr [edi],dword ptr [esi]
 00499E57    mov         esi,ecx
 00499E59    lea         edi,[ebp-0C]
 00499E5C    movs        dword ptr [edi],dword ptr [esi]
 00499E5D    movs        dword ptr [edi],dword ptr [esi]
 00499E5E    movs        dword ptr [edi],dword ptr [esi]
 00499E5F    mov         esi,edx
 00499E61    mov         ebx,eax
 00499E63    mov         eax,dword ptr [ebp+8]
 00499E66    push        eax
 00499E67    lea         eax,[ebp-1C]
 00499E6A    push        eax
 00499E6B    mov         eax,dword ptr [ebp-4]
 00499E6E    push        eax
 00499E6F    mov         eax,dword ptr [ebp-8]
 00499E72    push        eax
 00499E73    push        esi
 00499E74    movzx       edx,byte ptr [ebp-0C]
 00499E78    mov         eax,ebx
 00499E7A    call        TThemeServices.GetTheme
 00499E7F    push        eax
 00499E80    mov         eax,[0078D0CC];GetThemeBackgroundContentRect:function(val hTheme:Windows.THandle;val hdc...
 00499E85    mov         eax,dword ptr [eax]
 00499E87    call        eax
 00499E89    pop         edi
 00499E8A    pop         esi
 00499E8B    pop         ebx
 00499E8C    mov         esp,ebp
 00499E8E    pop         ebp
 00499E8F    ret         8
*}
end;

//00499E94
procedure TThemeServices.DrawEdge(DC:HDC; Details:TThemedElementDetails; Flags:Cardinal; Edge:Cardinal; R:TRect);
begin
{*
 00499E94    push        ebp
 00499E95    mov         ebp,esp
 00499E97    add         esp,0FFFFFFF4
 00499E9A    push        ebx
 00499E9B    push        esi
 00499E9C    push        edi
 00499E9D    mov         esi,ecx
 00499E9F    lea         edi,[ebp-0C]
 00499EA2    movs        dword ptr [edi],dword ptr [esi]
 00499EA3    movs        dword ptr [edi],dword ptr [esi]
 00499EA4    movs        dword ptr [edi],dword ptr [esi]
 00499EA5    mov         esi,edx
 00499EA7    mov         ebx,eax
 00499EA9    push        0
 00499EAB    mov         eax,dword ptr [ebp+8]
 00499EAE    push        eax
 00499EAF    mov         eax,dword ptr [ebp+0C]
 00499EB2    push        eax
 00499EB3    mov         eax,dword ptr [ebp+10]
 00499EB6    push        eax
 00499EB7    mov         eax,dword ptr [ebp-4]
 00499EBA    push        eax
 00499EBB    mov         eax,dword ptr [ebp-8]
 00499EBE    push        eax
 00499EBF    push        esi
 00499EC0    movzx       edx,byte ptr [ebp-0C]
 00499EC4    mov         eax,ebx
 00499EC6    call        TThemeServices.GetTheme
 00499ECB    push        eax
 00499ECC    mov         eax,[0078D3BC]
 00499ED1    mov         eax,dword ptr [eax]
 00499ED3    call        eax
 00499ED5    pop         edi
 00499ED6    pop         esi
 00499ED7    pop         ebx
 00499ED8    mov         esp,ebp
 00499EDA    pop         ebp
 00499EDB    ret         0C
*}
end;

//00499EE0
procedure TThemeServices.DrawEdge(DC:HDC; Details:TThemedElementDetails; ContentRect:PRect; Flags:Cardinal; Edge:Cardinal; R:TRect);
begin
{*
 00499EE0    push        ebp
 00499EE1    mov         ebp,esp
 00499EE3    add         esp,0FFFFFFF4
 00499EE6    push        ebx
 00499EE7    push        esi
 00499EE8    push        edi
 00499EE9    mov         esi,ecx
 00499EEB    lea         edi,[ebp-0C]
 00499EEE    movs        dword ptr [edi],dword ptr [esi]
 00499EEF    movs        dword ptr [edi],dword ptr [esi]
 00499EF0    movs        dword ptr [edi],dword ptr [esi]
 00499EF1    mov         esi,edx
 00499EF3    mov         ebx,eax
 00499EF5    mov         eax,dword ptr [ebp+8]
 00499EF8    push        eax
 00499EF9    mov         eax,dword ptr [ebp+0C]
 00499EFC    push        eax
 00499EFD    mov         eax,dword ptr [ebp+10]
 00499F00    push        eax
 00499F01    mov         eax,dword ptr [ebp+14]
 00499F04    push        eax
 00499F05    mov         eax,dword ptr [ebp-4]
 00499F08    push        eax
 00499F09    mov         eax,dword ptr [ebp-8]
 00499F0C    push        eax
 00499F0D    push        esi
 00499F0E    movzx       edx,byte ptr [ebp-0C]
 00499F12    mov         eax,ebx
 00499F14    call        TThemeServices.GetTheme
 00499F19    push        eax
 00499F1A    mov         eax,[0078D3BC]
 00499F1F    mov         eax,dword ptr [eax]
 00499F21    call        eax
 00499F23    pop         edi
 00499F24    pop         esi
 00499F25    pop         ebx
 00499F26    mov         esp,ebp
 00499F28    pop         ebp
 00499F29    ret         10
*}
end;

//00499F2C
procedure TThemeServices.DrawElement(DC:HDC; Details:TThemedElementDetails; R:TRect);
begin
{*
 00499F2C    push        ebp
 00499F2D    mov         ebp,esp
 00499F2F    add         esp,0FFFFFFF4
 00499F32    push        ebx
 00499F33    push        esi
 00499F34    push        edi
 00499F35    mov         esi,ecx
 00499F37    lea         edi,[ebp-0C]
 00499F3A    movs        dword ptr [edi],dword ptr [esi]
 00499F3B    movs        dword ptr [edi],dword ptr [esi]
 00499F3C    movs        dword ptr [edi],dword ptr [esi]
 00499F3D    mov         esi,edx
 00499F3F    mov         ebx,eax
 00499F41    push        0
 00499F43    mov         eax,dword ptr [ebp+8]
 00499F46    push        eax
 00499F47    mov         eax,dword ptr [ebp-4]
 00499F4A    push        eax
 00499F4B    mov         eax,dword ptr [ebp-8]
 00499F4E    push        eax
 00499F4F    push        esi
 00499F50    movzx       edx,byte ptr [ebp-0C]
 00499F54    mov         eax,ebx
 00499F56    call        TThemeServices.GetTheme
 00499F5B    push        eax
 00499F5C    mov         eax,[0078D2E8];DrawThemeBackground:function(val hTheme:Windows.THandle;val hdc:Windows.H...
 00499F61    mov         eax,dword ptr [eax]
 00499F63    call        eax
 00499F65    pop         edi
 00499F66    pop         esi
 00499F67    pop         ebx
 00499F68    mov         esp,ebp
 00499F6A    pop         ebp
 00499F6B    ret         4
*}
end;

//00499F70
procedure TThemeServices.DrawElement(DC:HDC; Details:TThemedElementDetails; ClipRect:TRect; R:TRect);
begin
{*
 00499F70    push        ebp
 00499F71    mov         ebp,esp
 00499F73    add         esp,0FFFFFFE4
 00499F76    push        ebx
 00499F77    push        esi
 00499F78    push        edi
 00499F79    mov         esi,dword ptr [ebp+8]
 00499F7C    lea         edi,[ebp-1C]
 00499F7F    movs        dword ptr [edi],dword ptr [esi]
 00499F80    movs        dword ptr [edi],dword ptr [esi]
 00499F81    movs        dword ptr [edi],dword ptr [esi]
 00499F82    movs        dword ptr [edi],dword ptr [esi]
 00499F83    mov         esi,ecx
 00499F85    lea         edi,[ebp-0C]
 00499F88    movs        dword ptr [edi],dword ptr [esi]
 00499F89    movs        dword ptr [edi],dword ptr [esi]
 00499F8A    movs        dword ptr [edi],dword ptr [esi]
 00499F8B    mov         esi,edx
 00499F8D    mov         ebx,eax
 00499F8F    lea         eax,[ebp-1C]
 00499F92    push        eax
 00499F93    mov         eax,dword ptr [ebp+0C]
 00499F96    push        eax
 00499F97    mov         eax,dword ptr [ebp-4]
 00499F9A    push        eax
 00499F9B    mov         eax,dword ptr [ebp-8]
 00499F9E    push        eax
 00499F9F    push        esi
 00499FA0    movzx       edx,byte ptr [ebp-0C]
 00499FA4    mov         eax,ebx
 00499FA6    call        TThemeServices.GetTheme
 00499FAB    push        eax
 00499FAC    mov         eax,[0078D2E8];DrawThemeBackground:function(val hTheme:Windows.THandle;val hdc:Windows.H...
 00499FB1    mov         eax,dword ptr [eax]
 00499FB3    call        eax
 00499FB5    pop         edi
 00499FB6    pop         esi
 00499FB7    pop         ebx
 00499FB8    mov         esp,ebp
 00499FBA    pop         ebp
 00499FBB    ret         8
*}
end;

//00499FC0
procedure TThemeServices.DrawElement(DC:HDC; Details:TThemedElementDetails; ClipRect:PRect; R:TRect);
begin
{*
 00499FC0    push        ebp
 00499FC1    mov         ebp,esp
 00499FC3    add         esp,0FFFFFFF4
 00499FC6    push        ebx
 00499FC7    push        esi
 00499FC8    push        edi
 00499FC9    mov         esi,ecx
 00499FCB    lea         edi,[ebp-0C]
 00499FCE    movs        dword ptr [edi],dword ptr [esi]
 00499FCF    movs        dword ptr [edi],dword ptr [esi]
 00499FD0    movs        dword ptr [edi],dword ptr [esi]
 00499FD1    mov         esi,edx
 00499FD3    mov         ebx,eax
 00499FD5    mov         eax,dword ptr [ebp+8]
 00499FD8    push        eax
 00499FD9    mov         eax,dword ptr [ebp+0C]
 00499FDC    push        eax
 00499FDD    mov         eax,dword ptr [ebp-4]
 00499FE0    push        eax
 00499FE1    mov         eax,dword ptr [ebp-8]
 00499FE4    push        eax
 00499FE5    push        esi
 00499FE6    movzx       edx,byte ptr [ebp-0C]
 00499FEA    mov         eax,ebx
 00499FEC    call        TThemeServices.GetTheme
 00499FF1    push        eax
 00499FF2    mov         eax,[0078D2E8];DrawThemeBackground:function(val hTheme:Windows.THandle;val hdc:Windows.H...
 00499FF7    mov         eax,dword ptr [eax]
 00499FF9    call        eax
 00499FFB    pop         edi
 00499FFC    pop         esi
 00499FFD    pop         ebx
 00499FFE    mov         esp,ebp
 0049A000    pop         ebp
 0049A001    ret         8
*}
end;

//0049A004
procedure TThemeServices.DrawIcon(DC:HDC; Details:TThemedElementDetails; Index:Integer; himl:Cardinal; R:TRect);
begin
{*
 0049A004    push        ebp
 0049A005    mov         ebp,esp
 0049A007    add         esp,0FFFFFFF4
 0049A00A    push        ebx
 0049A00B    push        esi
 0049A00C    push        edi
 0049A00D    mov         esi,ecx
 0049A00F    lea         edi,[ebp-0C]
 0049A012    movs        dword ptr [edi],dword ptr [esi]
 0049A013    movs        dword ptr [edi],dword ptr [esi]
 0049A014    movs        dword ptr [edi],dword ptr [esi]
 0049A015    mov         esi,edx
 0049A017    mov         ebx,eax
 0049A019    mov         eax,dword ptr [ebp+8]
 0049A01C    push        eax
 0049A01D    mov         eax,dword ptr [ebp+0C]
 0049A020    push        eax
 0049A021    mov         eax,dword ptr [ebp+10]
 0049A024    push        eax
 0049A025    mov         eax,dword ptr [ebp-4]
 0049A028    push        eax
 0049A029    mov         eax,dword ptr [ebp-8]
 0049A02C    push        eax
 0049A02D    push        esi
 0049A02E    movzx       edx,byte ptr [ebp-0C]
 0049A032    mov         eax,ebx
 0049A034    call        TThemeServices.GetTheme
 0049A039    push        eax
 0049A03A    mov         eax,[0078D93C];DrawThemeIcon:function(val hTheme:Windows.THandle;val hdc:Windows.HDC;val...
 0049A03F    mov         eax,dword ptr [eax]
 0049A041    call        eax
 0049A043    pop         edi
 0049A044    pop         esi
 0049A045    pop         ebx
 0049A046    mov         esp,ebp
 0049A048    pop         ebp
 0049A049    ret         0C
*}
end;

//0049A04C
procedure TThemeServices.DrawParentBackground(Window:HWND; Target:HDC; Bounds:PRect; OnlyIfTransparent:Boolean; Details:PThemedElementDetails);
begin
{*
 0049A04C    push        ebp
 0049A04D    mov         ebp,esp
 0049A04F    add         esp,0FFFFFFF8
 0049A052    push        ebx
 0049A053    push        esi
 0049A054    mov         dword ptr [ebp-8],ecx
 0049A057    mov         dword ptr [ebp-4],edx
 0049A05A    mov         esi,eax
 0049A05C    mov         eax,dword ptr [ebp+10]
 0049A05F    cmp         byte ptr [ebp+0C],0
>0049A063    je          0049A08F
 0049A065    test        eax,eax
>0049A067    je          0049A08F
 0049A069    mov         ebx,eax
 0049A06B    mov         eax,dword ptr [ebx+8]
 0049A06E    push        eax
 0049A06F    mov         eax,dword ptr [ebx+4]
 0049A072    push        eax
 0049A073    movzx       edx,byte ptr [ebx]
 0049A076    mov         eax,esi
 0049A078    call        TThemeServices.GetTheme
 0049A07D    push        eax
 0049A07E    mov         eax,[0078CF54];IsThemeBackgroundPartiallyTransparent:function(val hTheme:Windows.THandle...
 0049A083    mov         eax,dword ptr [eax]
 0049A085    call        eax
 0049A087    cmp         eax,1
 0049A08A    sbb         eax,eax
 0049A08C    inc         eax
>0049A08D    jmp         0049A091
 0049A08F    mov         al,1
 0049A091    test        al,al
>0049A093    je          0049A0AA
 0049A095    mov         eax,dword ptr [ebp+8]
 0049A098    push        eax
 0049A099    mov         eax,dword ptr [ebp-8]
 0049A09C    push        eax
 0049A09D    mov         eax,dword ptr [ebp-4]
 0049A0A0    push        eax
 0049A0A1    mov         eax,[0078D50C];DrawThemeParentBackground:function(val hwnd:Windows.HWND;val hdc:Windows....
 0049A0A6    mov         eax,dword ptr [eax]
 0049A0A8    call        eax
 0049A0AA    pop         esi
 0049A0AB    pop         ebx
 0049A0AC    pop         ecx
 0049A0AD    pop         ecx
 0049A0AE    pop         ebp
 0049A0AF    ret         0C
*}
end;

//0049A0B4
procedure TThemeServices.DrawParentBackground(Window:HWND; Target:HDC; Bounds:TRect; OnlyIfTransparent:Boolean; Details:PThemedElementDetails);
begin
{*
 0049A0B4    push        ebp
 0049A0B5    mov         ebp,esp
 0049A0B7    push        ebx
 0049A0B8    mov         ebx,dword ptr [ebp+10]
 0049A0BB    push        ebx
 0049A0BC    movzx       ebx,byte ptr [ebp+0C]
 0049A0C0    push        ebx
 0049A0C1    mov         ebx,dword ptr [ebp+8]
 0049A0C4    push        ebx
 0049A0C5    call        TThemeServices.DrawParentBackground
 0049A0CA    pop         ebx
 0049A0CB    pop         ebp
 0049A0CC    ret         0C
*}
end;

//0049A0D0
procedure TThemeServices.DrawParentBackground(Window:HWND; Target:HDC; Bounds:PRect; OnlyIfTransparent:Boolean; Details:TThemedElementDetails);
begin
{*
 0049A0D0    push        ebp
 0049A0D1    mov         ebp,esp
 0049A0D3    push        ebx
 0049A0D4    mov         ebx,dword ptr [ebp+10]
 0049A0D7    push        ebx
 0049A0D8    movzx       ebx,byte ptr [ebp+0C]
 0049A0DC    push        ebx
 0049A0DD    mov         ebx,dword ptr [ebp+8]
 0049A0E0    push        ebx
 0049A0E1    call        TThemeServices.DrawParentBackground
 0049A0E6    pop         ebx
 0049A0E7    pop         ebp
 0049A0E8    ret         0C
*}
end;

//0049A0EC
procedure TThemeServices.DrawText(DC:HDC; Details:TThemedElementDetails; Flags2:Cardinal; Flags:Cardinal; R:TRect; S:WideString);
begin
{*
 0049A0EC    push        ebp
 0049A0ED    mov         ebp,esp
 0049A0EF    add         esp,0FFFFFFE0
 0049A0F2    push        ebx
 0049A0F3    push        esi
 0049A0F4    push        edi
 0049A0F5    mov         esi,dword ptr [ebp+10]
 0049A0F8    lea         edi,[ebp-20]
 0049A0FB    movs        dword ptr [edi],dword ptr [esi]
 0049A0FC    movs        dword ptr [edi],dword ptr [esi]
 0049A0FD    movs        dword ptr [edi],dword ptr [esi]
 0049A0FE    movs        dword ptr [edi],dword ptr [esi]
 0049A0FF    mov         esi,ecx
 0049A101    lea         edi,[ebp-10]
 0049A104    movs        dword ptr [edi],dword ptr [esi]
 0049A105    movs        dword ptr [edi],dword ptr [esi]
 0049A106    movs        dword ptr [edi],dword ptr [esi]
 0049A107    mov         dword ptr [ebp-4],edx
 0049A10A    mov         edi,dword ptr [ebp+14]
 0049A10D    movzx       edx,byte ptr [ebp-10]
 0049A111    call        TThemeServices.GetTheme
 0049A116    mov         esi,eax
 0049A118    mov         ebx,edi
 0049A11A    test        ebx,ebx
>0049A11C    je          0049A127
 0049A11E    sub         ebx,4
 0049A121    mov         eax,dword ptr [ebx]
 0049A123    shr         eax,1
 0049A125    mov         ebx,eax
 0049A127    lea         eax,[ebp-20]
 0049A12A    push        eax
 0049A12B    mov         eax,dword ptr [ebp+8]
 0049A12E    push        eax
 0049A12F    mov         eax,dword ptr [ebp+0C]
 0049A132    push        eax
 0049A133    push        ebx
 0049A134    mov         eax,edi
 0049A136    call        @WStrToPWChar
 0049A13B    push        eax
 0049A13C    mov         eax,dword ptr [ebp-8]
 0049A13F    push        eax
 0049A140    mov         eax,dword ptr [ebp-0C]
 0049A143    push        eax
 0049A144    mov         eax,dword ptr [ebp-4]
 0049A147    push        eax
 0049A148    push        esi
 0049A149    mov         eax,[0078D868];DrawThemeText:function(val hTheme:Windows.THandle;val hdc:Windows.HDC;val...
 0049A14E    mov         eax,dword ptr [eax]
 0049A150    call        eax
 0049A152    pop         edi
 0049A153    pop         esi
 0049A154    pop         ebx
 0049A155    mov         esp,ebp
 0049A157    pop         ebp
 0049A158    ret         10
*}
end;

//0049A15C
function TThemeServices.GetElementDetails(Detail:TThemedButton):TThemedElementDetails;
begin
{*
 0049A15C    mov         byte ptr [ecx],0
 0049A15F    movzx       eax,dl
 0049A162    cmp         eax,0F
>0049A165    jge         0049A176
 0049A167    add         eax,0FFFFFFFE
 0049A16A    sub         eax,5
>0049A16D    jb          0049A187
 0049A16F    sub         eax,8
>0049A172    jb          0049A195
>0049A174    jmp         0049A1CD
 0049A176    add         eax,0FFFFFFF1
 0049A179    sub         eax,0C
>0049A17C    jb          0049A1A3
 0049A17E    sub         eax,2
>0049A181    jb          0049A1B1
>0049A183    je          0049A1BF
>0049A185    jmp         0049A1CD
 0049A187    mov         dword ptr [ecx+4],1
 0049A18E    mov         eax,2
>0049A193    jmp         0049A1D4
 0049A195    mov         dword ptr [ecx+4],2
 0049A19C    mov         eax,7
>0049A1A1    jmp         0049A1D4
 0049A1A3    mov         dword ptr [ecx+4],3
 0049A1AA    mov         eax,0F
>0049A1AF    jmp         0049A1D4
 0049A1B1    mov         dword ptr [ecx+4],4
 0049A1B8    mov         eax,1B
>0049A1BD    jmp         0049A1D4
 0049A1BF    mov         dword ptr [ecx+4],5
 0049A1C6    mov         eax,1D
>0049A1CB    jmp         0049A1D4
 0049A1CD    xor         eax,eax
 0049A1CF    mov         dword ptr [ecx+4],eax
 0049A1D2    xor         eax,eax
 0049A1D4    and         edx,7F
 0049A1D7    sub         edx,eax
 0049A1D9    inc         edx
 0049A1DA    mov         dword ptr [ecx+8],edx
 0049A1DD    ret
*}
end;

//0049A1E0
function TThemeServices.GetElementDetails(Detail:TThemedClock):TThemedElementDetails;
begin
{*
 0049A1E0    mov         byte ptr [ecx],1
 0049A1E3    mov         eax,edx
 0049A1E5    sub         al,2
>0049A1E7    jne         0049A1F7
 0049A1E9    mov         dword ptr [ecx+4],1
 0049A1F0    mov         eax,2
>0049A1F5    jmp         0049A1FE
 0049A1F7    xor         eax,eax
 0049A1F9    mov         dword ptr [ecx+4],eax
 0049A1FC    xor         eax,eax
 0049A1FE    and         edx,7F
 0049A201    sub         edx,eax
 0049A203    inc         edx
 0049A204    mov         dword ptr [ecx+8],edx
 0049A207    ret
*}
end;

//0049A208
function TThemeServices.GetElementDetails(Detail:TThemedComboBox):TThemedElementDetails;
begin
{*
 0049A208    mov         byte ptr [ecx],2
 0049A20B    mov         eax,edx
 0049A20D    add         al,0FE
 0049A20F    sub         al,4
>0049A211    jae         0049A221
 0049A213    mov         dword ptr [ecx+4],1
 0049A21A    mov         eax,2
>0049A21F    jmp         0049A228
 0049A221    xor         eax,eax
 0049A223    mov         dword ptr [ecx+4],eax
 0049A226    xor         eax,eax
 0049A228    and         edx,7F
 0049A22B    sub         edx,eax
 0049A22D    inc         edx
 0049A22E    mov         dword ptr [ecx+8],edx
 0049A231    ret
*}
end;

//0049A234
function TThemeServices.GetElementDetails(Detail:TThemedEdit):TThemedElementDetails;
begin
{*
 0049A234    mov         byte ptr [ecx],3
 0049A237    mov         eax,edx
 0049A239    add         al,0FE
 0049A23B    sub         al,7
>0049A23D    jb          0049A243
>0049A23F    je          0049A251
>0049A241    jmp         0049A25F
 0049A243    mov         dword ptr [ecx+4],1
 0049A24A    mov         eax,2
>0049A24F    jmp         0049A266
 0049A251    mov         dword ptr [ecx+4],2
 0049A258    mov         eax,9
>0049A25D    jmp         0049A266
 0049A25F    xor         eax,eax
 0049A261    mov         dword ptr [ecx+4],eax
 0049A264    xor         eax,eax
 0049A266    and         edx,7F
 0049A269    sub         edx,eax
 0049A26B    inc         edx
 0049A26C    mov         dword ptr [ecx+8],edx
 0049A26F    ret
*}
end;

//0049A270
function TThemeServices.GetElementDetails(Detail:TThemedExplorerBar):TThemedElementDetails;
begin
{*
 0049A270    mov         byte ptr [ecx],4
 0049A273    movzx       eax,dl
 0049A276    cmp         eax,20
>0049A279    ja          0049A393
 0049A27F    movzx       eax,byte ptr [eax+49A28D]
 0049A286    jmp         dword ptr [eax*4+49A2AE]
 0049A286    db          0
 0049A286    db          0
 0049A286    db          1
 0049A286    db          1
 0049A286    db          1
 0049A286    db          2
 0049A286    db          2
 0049A286    db          2
 0049A286    db          3
 0049A286    db          3
 0049A286    db          3
 0049A286    db          3
 0049A286    db          3
 0049A286    db          3
 0049A286    db          4
 0049A286    db          4
 0049A286    db          4
 0049A286    db          5
 0049A286    db          6
 0049A286    db          6
 0049A286    db          6
 0049A286    db          7
 0049A286    db          7
 0049A286    db          7
 0049A286    db          8
 0049A286    db          9
 0049A286    db          10
 0049A286    db          10
 0049A286    db          10
 0049A286    db          11
 0049A286    db          11
 0049A286    db          11
 0049A286    db          12
 0049A286    dd          0049A393
 0049A286    dd          0049A2E2
 0049A286    dd          0049A2F3
 0049A286    dd          0049A304
 0049A286    dd          0049A315
 0049A286    dd          0049A323
 0049A286    dd          0049A331
 0049A286    dd          0049A33F
 0049A286    dd          0049A34D
 0049A286    dd          0049A35B
 0049A286    dd          0049A369
 0049A286    dd          0049A377
 0049A286    dd          0049A385
 0049A2E2    mov         dword ptr [ecx+4],1
 0049A2E9    mov         eax,2
>0049A2EE    jmp         0049A39A
 0049A2F3    mov         dword ptr [ecx+4],2
 0049A2FA    mov         eax,5
>0049A2FF    jmp         0049A39A
 0049A304    mov         dword ptr [ecx+4],3
 0049A30B    mov         eax,0B
>0049A310    jmp         0049A39A
 0049A315    mov         dword ptr [ecx+4],4
 0049A31C    mov         eax,0E
>0049A321    jmp         0049A39A
 0049A323    mov         dword ptr [ecx+4],5
 0049A32A    mov         eax,11
>0049A32F    jmp         0049A39A
 0049A331    mov         dword ptr [ecx+4],6
 0049A338    mov         eax,12
>0049A33D    jmp         0049A39A
 0049A33F    mov         dword ptr [ecx+4],7
 0049A346    mov         eax,15
>0049A34B    jmp         0049A39A
 0049A34D    mov         dword ptr [ecx+4],8
 0049A354    mov         eax,18
>0049A359    jmp         0049A39A
 0049A35B    mov         dword ptr [ecx+4],9
 0049A362    mov         eax,19
>0049A367    jmp         0049A39A
 0049A369    mov         dword ptr [ecx+4],0A
 0049A370    mov         eax,1A
>0049A375    jmp         0049A39A
 0049A377    mov         dword ptr [ecx+4],0B
 0049A37E    mov         eax,1D
>0049A383    jmp         0049A39A
 0049A385    mov         dword ptr [ecx+4],0C
 0049A38C    mov         eax,20
>0049A391    jmp         0049A39A
 0049A393    xor         eax,eax
 0049A395    mov         dword ptr [ecx+4],eax
 0049A398    xor         eax,eax
 0049A39A    and         edx,7F
 0049A39D    sub         edx,eax
 0049A39F    inc         edx
 0049A3A0    mov         dword ptr [ecx+8],edx
 0049A3A3    ret
*}
end;

//0049A3A4
function TThemeServices.GetElementDetails(Detail:TThemedHeader):TThemedElementDetails;
begin
{*
 0049A3A4    mov         byte ptr [ecx],5
 0049A3A7    mov         eax,edx
 0049A3A9    add         al,0FE
 0049A3AB    sub         al,3
>0049A3AD    jb          0049A3BD
 0049A3AF    sub         al,3
>0049A3B1    jb          0049A3CB
 0049A3B3    sub         al,3
>0049A3B5    jb          0049A3D9
 0049A3B7    sub         al,2
>0049A3B9    jb          0049A3E7
>0049A3BB    jmp         0049A3F5
 0049A3BD    mov         dword ptr [ecx+4],1
 0049A3C4    mov         eax,2
>0049A3C9    jmp         0049A3FC
 0049A3CB    mov         dword ptr [ecx+4],2
 0049A3D2    mov         eax,5
>0049A3D7    jmp         0049A3FC
 0049A3D9    mov         dword ptr [ecx+4],3
 0049A3E0    mov         eax,8
>0049A3E5    jmp         0049A3FC
 0049A3E7    mov         dword ptr [ecx+4],4
 0049A3EE    mov         eax,0B
>0049A3F3    jmp         0049A3FC
 0049A3F5    xor         eax,eax
 0049A3F7    mov         dword ptr [ecx+4],eax
 0049A3FA    xor         eax,eax
 0049A3FC    and         edx,7F
 0049A3FF    sub         edx,eax
 0049A401    inc         edx
 0049A402    mov         dword ptr [ecx+8],edx
 0049A405    ret
*}
end;

//0049A408
function TThemeServices.GetElementDetails(Detail:TThemedListview):TThemedElementDetails;
begin
{*
 0049A408    mov         byte ptr [ecx],6
 0049A40B    movzx       eax,dl
 0049A40E    cmp         eax,0A
>0049A411    ja          0049A48C
 0049A413    jmp         dword ptr [eax*4+49A41A]
 0049A413    dd          0049A48C
 0049A413    dd          0049A48C
 0049A413    dd          0049A446
 0049A413    dd          0049A446
 0049A413    dd          0049A446
 0049A413    dd          0049A446
 0049A413    dd          0049A446
 0049A413    dd          0049A454
 0049A413    dd          0049A462
 0049A413    dd          0049A470
 0049A413    dd          0049A47E
 0049A446    mov         dword ptr [ecx+4],1
 0049A44D    mov         eax,2
>0049A452    jmp         0049A493
 0049A454    mov         dword ptr [ecx+4],2
 0049A45B    mov         eax,7
>0049A460    jmp         0049A493
 0049A462    mov         dword ptr [ecx+4],3
 0049A469    mov         eax,8
>0049A46E    jmp         0049A493
 0049A470    mov         dword ptr [ecx+4],4
 0049A477    mov         eax,9
>0049A47C    jmp         0049A493
 0049A47E    mov         dword ptr [ecx+4],5
 0049A485    mov         eax,0A
>0049A48A    jmp         0049A493
 0049A48C    xor         eax,eax
 0049A48E    mov         dword ptr [ecx+4],eax
 0049A491    xor         eax,eax
 0049A493    and         edx,7F
 0049A496    sub         edx,eax
 0049A498    inc         edx
 0049A499    mov         dword ptr [ecx+8],edx
 0049A49C    ret
*}
end;

//0049A4A0
function TThemeServices.GetElementDetails(Detail:TThemedMenu):TThemedElementDetails;
begin
{*
 0049A4A0    mov         byte ptr [ecx],7
 0049A4A3    movzx       eax,dl
 0049A4A6    cmp         eax,9
>0049A4A9    ja          0049A532
 0049A4AF    jmp         dword ptr [eax*4+49A4B6]
 0049A4AF    dd          0049A532
 0049A4AF    dd          0049A532
 0049A4AF    dd          0049A4DE
 0049A4AF    dd          0049A4DE
 0049A4AF    dd          0049A4DE
 0049A4AF    dd          0049A4EC
 0049A4AF    dd          0049A4FA
 0049A4AF    dd          0049A508
 0049A4AF    dd          0049A516
 0049A4AF    dd          0049A524
 0049A4DE    mov         dword ptr [ecx+4],1
 0049A4E5    mov         eax,2
>0049A4EA    jmp         0049A539
 0049A4EC    mov         dword ptr [ecx+4],2
 0049A4F3    mov         eax,5
>0049A4F8    jmp         0049A539
 0049A4FA    mov         dword ptr [ecx+4],3
 0049A501    mov         eax,6
>0049A506    jmp         0049A539
 0049A508    mov         dword ptr [ecx+4],4
 0049A50F    mov         eax,7
>0049A514    jmp         0049A539
 0049A516    mov         dword ptr [ecx+4],5
 0049A51D    mov         eax,8
>0049A522    jmp         0049A539
 0049A524    mov         dword ptr [ecx+4],6
 0049A52B    mov         eax,9
>0049A530    jmp         0049A539
 0049A532    xor         eax,eax
 0049A534    mov         dword ptr [ecx+4],eax
 0049A537    xor         eax,eax
 0049A539    and         edx,7F
 0049A53C    sub         edx,eax
 0049A53E    inc         edx
 0049A53F    mov         dword ptr [ecx+8],edx
 0049A542    ret
*}
end;

//0049A544
function TThemeServices.GetElementDetails(Detail:TThemedPage):TThemedElementDetails;
begin
{*
 0049A544    mov         byte ptr [ecx],8
 0049A547    mov         eax,edx
 0049A549    add         al,0FE
 0049A54B    sub         al,4
>0049A54D    jb          0049A55D
 0049A54F    sub         al,4
>0049A551    jb          0049A56B
 0049A553    sub         al,4
>0049A555    jb          0049A579
 0049A557    sub         al,4
>0049A559    jb          0049A587
>0049A55B    jmp         0049A595
 0049A55D    mov         dword ptr [ecx+4],1
 0049A564    mov         eax,2
>0049A569    jmp         0049A59C
 0049A56B    mov         dword ptr [ecx+4],2
 0049A572    mov         eax,6
>0049A577    jmp         0049A59C
 0049A579    mov         dword ptr [ecx+4],3
 0049A580    mov         eax,0A
>0049A585    jmp         0049A59C
 0049A587    mov         dword ptr [ecx+4],4
 0049A58E    mov         eax,0E
>0049A593    jmp         0049A59C
 0049A595    xor         eax,eax
 0049A597    mov         dword ptr [ecx+4],eax
 0049A59A    xor         eax,eax
 0049A59C    and         edx,7F
 0049A59F    sub         edx,eax
 0049A5A1    inc         edx
 0049A5A2    mov         dword ptr [ecx+8],edx
 0049A5A5    ret
*}
end;

//0049A5A8
function TThemeServices.GetElementDetails(Detail:TThemedProgress):TThemedElementDetails;
begin
{*
 0049A5A8    mov         byte ptr [ecx],9
 0049A5AB    mov         eax,edx
 0049A5AD    sub         al,2
>0049A5AF    je          0049A5BF
 0049A5B1    dec         al
>0049A5B3    je          0049A5CD
 0049A5B5    dec         al
>0049A5B7    je          0049A5DB
 0049A5B9    dec         al
>0049A5BB    je          0049A5E9
>0049A5BD    jmp         0049A5F7
 0049A5BF    mov         dword ptr [ecx+4],1
 0049A5C6    mov         eax,2
>0049A5CB    jmp         0049A5FE
 0049A5CD    mov         dword ptr [ecx+4],2
 0049A5D4    mov         eax,3
>0049A5D9    jmp         0049A5FE
 0049A5DB    mov         dword ptr [ecx+4],3
 0049A5E2    mov         eax,4
>0049A5E7    jmp         0049A5FE
 0049A5E9    mov         dword ptr [ecx+4],4
 0049A5F0    mov         eax,5
>0049A5F5    jmp         0049A5FE
 0049A5F7    xor         eax,eax
 0049A5F9    mov         dword ptr [ecx+4],eax
 0049A5FC    xor         eax,eax
 0049A5FE    and         edx,7F
 0049A601    sub         edx,eax
 0049A603    inc         edx
 0049A604    mov         dword ptr [ecx+8],edx
 0049A607    ret
*}
end;

//0049A608
function TThemeServices.GetElementDetails(Detail:TThemedRebar):TThemedElementDetails;
begin
{*
 0049A608    mov         byte ptr [ecx],0A
 0049A60B    movzx       eax,dl
 0049A60E    cmp         eax,11
>0049A611    ja          0049A691
 0049A613    movzx       eax,byte ptr [eax+49A621]
 0049A61A    jmp         dword ptr [eax*4+49A633]
 0049A61A    db          0
 0049A61A    db          0
 0049A61A    db          1
 0049A61A    db          2
 0049A61A    db          3
 0049A61A    db          3
 0049A61A    db          3
 0049A61A    db          3
 0049A61A    db          3
 0049A61A    db          3
 0049A61A    db          4
 0049A61A    db          4
 0049A61A    db          4
 0049A61A    db          4
 0049A61A    db          5
 0049A61A    db          5
 0049A61A    db          5
 0049A61A    db          5
 0049A61A    dd          0049A691
 0049A61A    dd          0049A64B
 0049A61A    dd          0049A659
 0049A61A    dd          0049A667
 0049A61A    dd          0049A675
 0049A61A    dd          0049A683
 0049A64B    mov         dword ptr [ecx+4],1
 0049A652    mov         eax,2
>0049A657    jmp         0049A698
 0049A659    mov         dword ptr [ecx+4],2
 0049A660    mov         eax,3
>0049A665    jmp         0049A698
 0049A667    mov         dword ptr [ecx+4],3
 0049A66E    mov         eax,4
>0049A673    jmp         0049A698
 0049A675    mov         dword ptr [ecx+4],4
 0049A67C    mov         eax,0A
>0049A681    jmp         0049A698
 0049A683    mov         dword ptr [ecx+4],5
 0049A68A    mov         eax,0E
>0049A68F    jmp         0049A698
 0049A691    xor         eax,eax
 0049A693    mov         dword ptr [ecx+4],eax
 0049A696    xor         eax,eax
 0049A698    and         edx,7F
 0049A69B    sub         edx,eax
 0049A69D    inc         edx
 0049A69E    mov         dword ptr [ecx+8],edx
 0049A6A1    ret
*}
end;

//0049A6A4
function TThemeServices.GetElementDetails(Detail:TThemedScrollBar):TThemedElementDetails;
begin
{*
 0049A6A4    mov         byte ptr [ecx],0B
 0049A6A7    movzx       eax,dl
 0049A6AA    cmp         eax,33
>0049A6AD    ja          0049A7B0
 0049A6B3    movzx       eax,byte ptr [eax+49A6C1]
 0049A6BA    jmp         dword ptr [eax*4+49A6F5]
 0049A6BA    db          0
 0049A6BA    db          0
 0049A6BA    db          1
 0049A6BA    db          1
 0049A6BA    db          1
 0049A6BA    db          1
 0049A6BA    db          1
 0049A6BA    db          1
 0049A6BA    db          1
 0049A6BA    db          1
 0049A6BA    db          1
 0049A6BA    db          1
 0049A6BA    db          1
 0049A6BA    db          1
 0049A6BA    db          1
 0049A6BA    db          1
 0049A6BA    db          1
 0049A6BA    db          1
 0049A6BA    db          2
 0049A6BA    db          2
 0049A6BA    db          2
 0049A6BA    db          2
 0049A6BA    db          3
 0049A6BA    db          3
 0049A6BA    db          3
 0049A6BA    db          3
 0049A6BA    db          4
 0049A6BA    db          4
 0049A6BA    db          4
 0049A6BA    db          4
 0049A6BA    db          5
 0049A6BA    db          5
 0049A6BA    db          5
 0049A6BA    db          5
 0049A6BA    db          6
 0049A6BA    db          6
 0049A6BA    db          6
 0049A6BA    db          6
 0049A6BA    db          7
 0049A6BA    db          7
 0049A6BA    db          7
 0049A6BA    db          7
 0049A6BA    db          8
 0049A6BA    db          8
 0049A6BA    db          8
 0049A6BA    db          8
 0049A6BA    db          9
 0049A6BA    db          9
 0049A6BA    db          9
 0049A6BA    db          9
 0049A6BA    db          10
 0049A6BA    db          10
 0049A6BA    dd          0049A7B0
 0049A6BA    dd          0049A721
 0049A6BA    dd          0049A732
 0049A6BA    dd          0049A740
 0049A6BA    dd          0049A74E
 0049A6BA    dd          0049A75C
 0049A6BA    dd          0049A76A
 0049A6BA    dd          0049A778
 0049A6BA    dd          0049A786
 0049A6BA    dd          0049A794
 0049A6BA    dd          0049A7A2
 0049A721    mov         dword ptr [ecx+4],1
 0049A728    mov         eax,2
>0049A72D    jmp         0049A7B7
 0049A732    mov         dword ptr [ecx+4],2
 0049A739    mov         eax,12
>0049A73E    jmp         0049A7B7
 0049A740    mov         dword ptr [ecx+4],3
 0049A747    mov         eax,16
>0049A74C    jmp         0049A7B7
 0049A74E    mov         dword ptr [ecx+4],4
 0049A755    mov         eax,1A
>0049A75A    jmp         0049A7B7
 0049A75C    mov         dword ptr [ecx+4],5
 0049A763    mov         eax,1E
>0049A768    jmp         0049A7B7
 0049A76A    mov         dword ptr [ecx+4],6
 0049A771    mov         eax,22
>0049A776    jmp         0049A7B7
 0049A778    mov         dword ptr [ecx+4],7
 0049A77F    mov         eax,26
>0049A784    jmp         0049A7B7
 0049A786    mov         dword ptr [ecx+4],8
 0049A78D    mov         eax,2A
>0049A792    jmp         0049A7B7
 0049A794    mov         dword ptr [ecx+4],9
 0049A79B    mov         eax,2E
>0049A7A0    jmp         0049A7B7
 0049A7A2    mov         dword ptr [ecx+4],0A
 0049A7A9    mov         eax,32
>0049A7AE    jmp         0049A7B7
 0049A7B0    xor         eax,eax
 0049A7B2    mov         dword ptr [ecx+4],eax
 0049A7B5    xor         eax,eax
 0049A7B7    and         edx,7F
 0049A7BA    sub         edx,eax
 0049A7BC    inc         edx
 0049A7BD    mov         dword ptr [ecx+8],edx
 0049A7C0    ret
*}
end;

//0049A7C4
function TThemeServices.GetElementDetails(Detail:TThemedSpin):TThemedElementDetails;
begin
{*
 0049A7C4    mov         byte ptr [ecx],0C
 0049A7C7    mov         eax,edx
 0049A7C9    add         al,0FE
 0049A7CB    sub         al,4
>0049A7CD    jb          0049A7DD
 0049A7CF    sub         al,4
>0049A7D1    jb          0049A7EB
 0049A7D3    sub         al,4
>0049A7D5    jb          0049A7F9
 0049A7D7    sub         al,4
>0049A7D9    jb          0049A807
>0049A7DB    jmp         0049A815
 0049A7DD    mov         dword ptr [ecx+4],1
 0049A7E4    mov         eax,2
>0049A7E9    jmp         0049A81C
 0049A7EB    mov         dword ptr [ecx+4],2
 0049A7F2    mov         eax,6
>0049A7F7    jmp         0049A81C
 0049A7F9    mov         dword ptr [ecx+4],3
 0049A800    mov         eax,0A
>0049A805    jmp         0049A81C
 0049A807    mov         dword ptr [ecx+4],4
 0049A80E    mov         eax,0E
>0049A813    jmp         0049A81C
 0049A815    xor         eax,eax
 0049A817    mov         dword ptr [ecx+4],eax
 0049A81A    xor         eax,eax
 0049A81C    and         edx,7F
 0049A81F    sub         edx,eax
 0049A821    inc         edx
 0049A822    mov         dword ptr [ecx+8],edx
 0049A825    ret
*}
end;

//0049A828
function TThemeServices.GetElementDetails(Detail:TThemedStartPanel):TThemedElementDetails;
begin
{*
 0049A828    mov         byte ptr [ecx],0D
 0049A82B    movzx       eax,dl
 0049A82E    cmp         eax,10
>0049A831    ja          0049A922
 0049A837    jmp         dword ptr [eax*4+49A83E]
 0049A837    dd          0049A922
 0049A837    dd          0049A922
 0049A837    dd          0049A882
 0049A837    dd          0049A893
 0049A837    dd          0049A8A4
 0049A837    dd          0049A8A4
 0049A837    dd          0049A8A4
 0049A837    dd          0049A8B2
 0049A837    dd          0049A8C0
 0049A837    dd          0049A8CE
 0049A837    dd          0049A8DC
 0049A837    dd          0049A8EA
 0049A837    dd          0049A8F8
 0049A837    dd          0049A8F8
 0049A837    dd          0049A8F8
 0049A837    dd          0049A906
 0049A837    dd          0049A914
 0049A882    mov         dword ptr [ecx+4],1
 0049A889    mov         eax,2
>0049A88E    jmp         0049A929
 0049A893    mov         dword ptr [ecx+4],2
 0049A89A    mov         eax,3
>0049A89F    jmp         0049A929
 0049A8A4    mov         dword ptr [ecx+4],3
 0049A8AB    mov         eax,4
>0049A8B0    jmp         0049A929
 0049A8B2    mov         dword ptr [ecx+4],4
 0049A8B9    mov         eax,7
>0049A8BE    jmp         0049A929
 0049A8C0    mov         dword ptr [ecx+4],5
 0049A8C7    mov         eax,8
>0049A8CC    jmp         0049A929
 0049A8CE    mov         dword ptr [ecx+4],6
 0049A8D5    mov         eax,9
>0049A8DA    jmp         0049A929
 0049A8DC    mov         dword ptr [ecx+4],7
 0049A8E3    mov         eax,0A
>0049A8E8    jmp         0049A929
 0049A8EA    mov         dword ptr [ecx+4],8
 0049A8F1    mov         eax,0B
>0049A8F6    jmp         0049A929
 0049A8F8    mov         dword ptr [ecx+4],9
 0049A8FF    mov         eax,0C
>0049A904    jmp         0049A929
 0049A906    mov         dword ptr [ecx+4],0A
 0049A90D    mov         eax,0F
>0049A912    jmp         0049A929
 0049A914    mov         dword ptr [ecx+4],0B
 0049A91B    mov         eax,10
>0049A920    jmp         0049A929
 0049A922    xor         eax,eax
 0049A924    mov         dword ptr [ecx+4],eax
 0049A927    xor         eax,eax
 0049A929    and         edx,7F
 0049A92C    sub         edx,eax
 0049A92E    inc         edx
 0049A92F    mov         dword ptr [ecx+8],edx
 0049A932    ret
*}
end;

//0049A934
function TThemeServices.GetElementDetails(Detail:TThemedStatus):TThemedElementDetails;
begin
{*
 0049A934    mov         byte ptr [ecx],0E
 0049A937    mov         eax,edx
 0049A939    sub         al,2
>0049A93B    je          0049A947
 0049A93D    dec         al
>0049A93F    je          0049A955
 0049A941    dec         al
>0049A943    je          0049A963
>0049A945    jmp         0049A971
 0049A947    mov         dword ptr [ecx+4],1
 0049A94E    mov         eax,2
>0049A953    jmp         0049A978
 0049A955    mov         dword ptr [ecx+4],2
 0049A95C    mov         eax,3
>0049A961    jmp         0049A978
 0049A963    mov         dword ptr [ecx+4],3
 0049A96A    mov         eax,4
>0049A96F    jmp         0049A978
 0049A971    xor         eax,eax
 0049A973    mov         dword ptr [ecx+4],eax
 0049A976    xor         eax,eax
 0049A978    and         edx,7F
 0049A97B    sub         edx,eax
 0049A97D    inc         edx
 0049A97E    mov         dword ptr [ecx+8],edx
 0049A981    ret
*}
end;

//0049A984
function TThemeServices.GetElementDetails(Detail:TThemedTab):TThemedElementDetails;
begin
{*
 0049A984    mov         byte ptr [ecx],0F
 0049A987    movzx       eax,dl
 0049A98A    cmp         eax,2B
>0049A98D    ja          0049AA88
 0049A993    movzx       eax,byte ptr [eax+49A9A1]
 0049A99A    jmp         dword ptr [eax*4+49A9CD]
 0049A99A    db          0
 0049A99A    db          0
 0049A99A    db          1
 0049A99A    db          1
 0049A99A    db          1
 0049A99A    db          1
 0049A99A    db          1
 0049A99A    db          2
 0049A99A    db          2
 0049A99A    db          2
 0049A99A    db          2
 0049A99A    db          2
 0049A99A    db          3
 0049A99A    db          3
 0049A99A    db          3
 0049A99A    db          3
 0049A99A    db          3
 0049A99A    db          4
 0049A99A    db          4
 0049A99A    db          4
 0049A99A    db          4
 0049A99A    db          4
 0049A99A    db          5
 0049A99A    db          5
 0049A99A    db          5
 0049A99A    db          5
 0049A99A    db          5
 0049A99A    db          6
 0049A99A    db          6
 0049A99A    db          6
 0049A99A    db          6
 0049A99A    db          6
 0049A99A    db          7
 0049A99A    db          7
 0049A99A    db          7
 0049A99A    db          7
 0049A99A    db          7
 0049A99A    db          8
 0049A99A    db          8
 0049A99A    db          8
 0049A99A    db          8
 0049A99A    db          8
 0049A99A    db          9
 0049A99A    db          10
 0049A99A    dd          0049AA88
 0049A99A    dd          0049A9F9
 0049A99A    dd          0049AA0A
 0049A99A    dd          0049AA18
 0049A99A    dd          0049AA26
 0049A99A    dd          0049AA34
 0049A99A    dd          0049AA42
 0049A99A    dd          0049AA50
 0049A99A    dd          0049AA5E
 0049A99A    dd          0049AA6C
 0049A99A    dd          0049AA7A
 0049A9F9    mov         dword ptr [ecx+4],1
 0049AA00    mov         eax,2
>0049AA05    jmp         0049AA8F
 0049AA0A    mov         dword ptr [ecx+4],2
 0049AA11    mov         eax,7
>0049AA16    jmp         0049AA8F
 0049AA18    mov         dword ptr [ecx+4],3
 0049AA1F    mov         eax,0C
>0049AA24    jmp         0049AA8F
 0049AA26    mov         dword ptr [ecx+4],4
 0049AA2D    mov         eax,11
>0049AA32    jmp         0049AA8F
 0049AA34    mov         dword ptr [ecx+4],5
 0049AA3B    mov         eax,16
>0049AA40    jmp         0049AA8F
 0049AA42    mov         dword ptr [ecx+4],6
 0049AA49    mov         eax,1B
>0049AA4E    jmp         0049AA8F
 0049AA50    mov         dword ptr [ecx+4],7
 0049AA57    mov         eax,20
>0049AA5C    jmp         0049AA8F
 0049AA5E    mov         dword ptr [ecx+4],8
 0049AA65    mov         eax,25
>0049AA6A    jmp         0049AA8F
 0049AA6C    mov         dword ptr [ecx+4],9
 0049AA73    mov         eax,2A
>0049AA78    jmp         0049AA8F
 0049AA7A    mov         dword ptr [ecx+4],0A
 0049AA81    mov         eax,2B
>0049AA86    jmp         0049AA8F
 0049AA88    xor         eax,eax
 0049AA8A    mov         dword ptr [ecx+4],eax
 0049AA8D    xor         eax,eax
 0049AA8F    and         edx,7F
 0049AA92    sub         edx,eax
 0049AA94    inc         edx
 0049AA95    mov         dword ptr [ecx+8],edx
 0049AA98    ret
*}
end;

//0049AA9C
function TThemeServices.GetElementDetails(Detail:TThemedTaskBand):TThemedElementDetails;
begin
{*
 0049AA9C    mov         byte ptr [ecx],10
 0049AA9F    mov         eax,edx
 0049AAA1    sub         al,2
>0049AAA3    je          0049AAAF
 0049AAA5    dec         al
>0049AAA7    je          0049AABD
 0049AAA9    dec         al
>0049AAAB    je          0049AACB
>0049AAAD    jmp         0049AAD9
 0049AAAF    mov         dword ptr [ecx+4],1
 0049AAB6    mov         eax,2
>0049AABB    jmp         0049AAE0
 0049AABD    mov         dword ptr [ecx+4],2
 0049AAC4    mov         eax,3
>0049AAC9    jmp         0049AAE0
 0049AACB    mov         dword ptr [ecx+4],3
 0049AAD2    mov         eax,4
>0049AAD7    jmp         0049AAE0
 0049AAD9    xor         eax,eax
 0049AADB    mov         dword ptr [ecx+4],eax
 0049AADE    xor         eax,eax
 0049AAE0    and         edx,7F
 0049AAE3    sub         edx,eax
 0049AAE5    inc         edx
 0049AAE6    mov         dword ptr [ecx+8],edx
 0049AAE9    ret
*}
end;

//0049AAEC
function TThemeServices.GetElementDetails(Detail:TThemedTaskBar):TThemedElementDetails;
begin
{*
 0049AAEC    mov         byte ptr [ecx],11
 0049AAEF    mov         eax,edx
 0049AAF1    sub         al,2
>0049AAF3    jne         0049AB03
 0049AAF5    mov         dword ptr [ecx+4],1
 0049AAFC    mov         eax,2
>0049AB01    jmp         0049AB0A
 0049AB03    xor         eax,eax
 0049AB05    mov         dword ptr [ecx+4],eax
 0049AB08    xor         eax,eax
 0049AB0A    and         edx,7F
 0049AB0D    sub         edx,eax
 0049AB0F    inc         edx
 0049AB10    mov         dword ptr [ecx+8],edx
 0049AB13    ret
*}
end;

//0049AB14
function TThemeServices.GetElementDetails(Detail:TThemedToolBar):TThemedElementDetails;
begin
{*
 0049AB14    mov         byte ptr [ecx],12
 0049AB17    movzx       eax,dl
 0049AB1A    cmp         eax,14
>0049AB1D    jge         0049AB33
 0049AB1F    add         eax,0FFFFFFFE
 0049AB22    sub         eax,6
>0049AB25    jb          0049AB47
 0049AB27    sub         eax,6
>0049AB2A    jb          0049AB55
 0049AB2C    sub         eax,6
>0049AB2F    jb          0049AB63
>0049AB31    jmp         0049AB9B
 0049AB33    add         eax,0FFFFFFEC
 0049AB36    sub         eax,6
>0049AB39    jb          0049AB71
 0049AB3B    sub         eax,6
>0049AB3E    jb          0049AB7F
 0049AB40    sub         eax,6
>0049AB43    jb          0049AB8D
>0049AB45    jmp         0049AB9B
 0049AB47    mov         dword ptr [ecx+4],1
 0049AB4E    mov         eax,2
>0049AB53    jmp         0049ABA2
 0049AB55    mov         dword ptr [ecx+4],2
 0049AB5C    mov         eax,8
>0049AB61    jmp         0049ABA2
 0049AB63    mov         dword ptr [ecx+4],3
 0049AB6A    mov         eax,0E
>0049AB6F    jmp         0049ABA2
 0049AB71    mov         dword ptr [ecx+4],4
 0049AB78    mov         eax,14
>0049AB7D    jmp         0049ABA2
 0049AB7F    mov         dword ptr [ecx+4],5
 0049AB86    mov         eax,1A
>0049AB8B    jmp         0049ABA2
 0049AB8D    mov         dword ptr [ecx+4],6
 0049AB94    mov         eax,20
>0049AB99    jmp         0049ABA2
 0049AB9B    xor         eax,eax
 0049AB9D    mov         dword ptr [ecx+4],eax
 0049ABA0    xor         eax,eax
 0049ABA2    and         edx,7F
 0049ABA5    sub         edx,eax
 0049ABA7    inc         edx
 0049ABA8    mov         dword ptr [ecx+8],edx
 0049ABAB    ret
*}
end;

//0049ABAC
function TThemeServices.GetElementDetails(Detail:TThemedToolTip):TThemedElementDetails;
begin
{*
 0049ABAC    mov         byte ptr [ecx],13
 0049ABAF    movzx       eax,dl
 0049ABB2    cmp         eax,0E
>0049ABB5    ja          0049AC60
 0049ABBB    jmp         dword ptr [eax*4+49ABC2]
 0049ABBB    dd          0049AC60
 0049ABBB    dd          0049AC60
 0049ABBB    dd          0049ABFE
 0049ABBB    dd          0049ABFE
 0049ABBB    dd          0049AC0C
 0049ABBB    dd          0049AC0C
 0049ABBB    dd          0049AC1A
 0049ABBB    dd          0049AC1A
 0049ABBB    dd          0049AC28
 0049ABBB    dd          0049AC28
 0049ABBB    dd          0049AC36
 0049ABBB    dd          0049AC44
 0049ABBB    dd          0049AC52
 0049ABBB    dd          0049AC52
 0049ABBB    dd          0049AC52
 0049ABFE    mov         dword ptr [ecx+4],1
 0049AC05    mov         eax,2
>0049AC0A    jmp         0049AC67
 0049AC0C    mov         dword ptr [ecx+4],2
 0049AC13    mov         eax,4
>0049AC18    jmp         0049AC67
 0049AC1A    mov         dword ptr [ecx+4],3
 0049AC21    mov         eax,6
>0049AC26    jmp         0049AC67
 0049AC28    mov         dword ptr [ecx+4],4
 0049AC2F    mov         eax,8
>0049AC34    jmp         0049AC67
 0049AC36    mov         dword ptr [ecx+4],6
 0049AC3D    mov         eax,1
>0049AC42    jmp         0049AC67
 0049AC44    mov         dword ptr [ecx+4],6
 0049AC4B    mov         eax,6
>0049AC50    jmp         0049AC67
 0049AC52    mov         dword ptr [ecx+4],5
 0049AC59    mov         eax,0C
>0049AC5E    jmp         0049AC67
 0049AC60    xor         eax,eax
 0049AC62    mov         dword ptr [ecx+4],eax
 0049AC65    xor         eax,eax
 0049AC67    and         edx,7F
 0049AC6A    sub         edx,eax
 0049AC6C    inc         edx
 0049AC6D    mov         dword ptr [ecx+8],edx
 0049AC70    ret
*}
end;

//0049AC74
function TThemeServices.GetElementDetails(Detail:TThemedTrackBar):TThemedElementDetails;
begin
{*
 0049AC74    mov         byte ptr [ecx],14
 0049AC77    movzx       eax,dl
 0049AC7A    cmp         eax,23
>0049AC7D    ja          0049AD70
 0049AC83    movzx       eax,byte ptr [eax+49AC91]
 0049AC8A    jmp         dword ptr [eax*4+49ACB5]
 0049AC8A    db          0
 0049AC8A    db          0
 0049AC8A    db          1
 0049AC8A    db          2
 0049AC8A    db          3
 0049AC8A    db          3
 0049AC8A    db          3
 0049AC8A    db          3
 0049AC8A    db          3
 0049AC8A    db          4
 0049AC8A    db          4
 0049AC8A    db          4
 0049AC8A    db          4
 0049AC8A    db          4
 0049AC8A    db          5
 0049AC8A    db          5
 0049AC8A    db          5
 0049AC8A    db          5
 0049AC8A    db          5
 0049AC8A    db          6
 0049AC8A    db          6
 0049AC8A    db          6
 0049AC8A    db          6
 0049AC8A    db          6
 0049AC8A    db          7
 0049AC8A    db          7
 0049AC8A    db          7
 0049AC8A    db          7
 0049AC8A    db          7
 0049AC8A    db          8
 0049AC8A    db          8
 0049AC8A    db          8
 0049AC8A    db          8
 0049AC8A    db          8
 0049AC8A    db          9
 0049AC8A    db          10
 0049AC8A    dd          0049AD70
 0049AC8A    dd          0049ACE1
 0049AC8A    dd          0049ACF2
 0049AC8A    dd          0049AD00
 0049AC8A    dd          0049AD0E
 0049AC8A    dd          0049AD1C
 0049AC8A    dd          0049AD2A
 0049AC8A    dd          0049AD38
 0049AC8A    dd          0049AD46
 0049AC8A    dd          0049AD54
 0049AC8A    dd          0049AD62
 0049ACE1    mov         dword ptr [ecx+4],1
 0049ACE8    mov         eax,2
>0049ACED    jmp         0049AD77
 0049ACF2    mov         dword ptr [ecx+4],2
 0049ACF9    mov         eax,3
>0049ACFE    jmp         0049AD77
 0049AD00    mov         dword ptr [ecx+4],3
 0049AD07    mov         eax,4
>0049AD0C    jmp         0049AD77
 0049AD0E    mov         dword ptr [ecx+4],4
 0049AD15    mov         eax,9
>0049AD1A    jmp         0049AD77
 0049AD1C    mov         dword ptr [ecx+4],5
 0049AD23    mov         eax,0E
>0049AD28    jmp         0049AD77
 0049AD2A    mov         dword ptr [ecx+4],6
 0049AD31    mov         eax,13
>0049AD36    jmp         0049AD77
 0049AD38    mov         dword ptr [ecx+4],7
 0049AD3F    mov         eax,18
>0049AD44    jmp         0049AD77
 0049AD46    mov         dword ptr [ecx+4],8
 0049AD4D    mov         eax,1D
>0049AD52    jmp         0049AD77
 0049AD54    mov         dword ptr [ecx+4],9
 0049AD5B    mov         eax,22
>0049AD60    jmp         0049AD77
 0049AD62    mov         dword ptr [ecx+4],0A
 0049AD69    mov         eax,23
>0049AD6E    jmp         0049AD77
 0049AD70    xor         eax,eax
 0049AD72    mov         dword ptr [ecx+4],eax
 0049AD75    xor         eax,eax
 0049AD77    and         edx,7F
 0049AD7A    sub         edx,eax
 0049AD7C    inc         edx
 0049AD7D    mov         dword ptr [ecx+8],edx
 0049AD80    ret
*}
end;

//0049AD84
function TThemeServices.GetElementDetails(Detail:TThemedTrayNotify):TThemedElementDetails;
begin
{*
 0049AD84    mov         byte ptr [ecx],15
 0049AD87    mov         eax,edx
 0049AD89    sub         al,2
>0049AD8B    je          0049AD93
 0049AD8D    dec         al
>0049AD8F    je          0049ADA1
>0049AD91    jmp         0049ADAF
 0049AD93    mov         dword ptr [ecx+4],1
 0049AD9A    mov         eax,2
>0049AD9F    jmp         0049ADB6
 0049ADA1    mov         dword ptr [ecx+4],2
 0049ADA8    mov         eax,3
>0049ADAD    jmp         0049ADB6
 0049ADAF    xor         eax,eax
 0049ADB1    mov         dword ptr [ecx+4],eax
 0049ADB4    xor         eax,eax
 0049ADB6    and         edx,7F
 0049ADB9    sub         edx,eax
 0049ADBB    inc         edx
 0049ADBC    mov         dword ptr [ecx+8],edx
 0049ADBF    ret
*}
end;

//0049ADC0
function TThemeServices.GetElementDetails(Detail:TThemedTreeview):TThemedElementDetails;
begin
{*
 0049ADC0    mov         byte ptr [ecx],16
 0049ADC3    mov         eax,edx
 0049ADC5    add         al,0FE
 0049ADC7    sub         al,5
>0049ADC9    jb          0049ADD3
 0049ADCB    sub         al,2
>0049ADCD    jb          0049ADE1
>0049ADCF    je          0049ADEF
>0049ADD1    jmp         0049ADFD
 0049ADD3    mov         dword ptr [ecx+4],1
 0049ADDA    mov         eax,2
>0049ADDF    jmp         0049AE04
 0049ADE1    mov         dword ptr [ecx+4],2
 0049ADE8    mov         eax,7
>0049ADED    jmp         0049AE04
 0049ADEF    mov         dword ptr [ecx+4],3
 0049ADF6    mov         eax,9
>0049ADFB    jmp         0049AE04
 0049ADFD    xor         eax,eax
 0049ADFF    mov         dword ptr [ecx+4],eax
 0049AE02    xor         eax,eax
 0049AE04    and         edx,7F
 0049AE07    sub         edx,eax
 0049AE09    inc         edx
 0049AE0A    mov         dword ptr [ecx+8],edx
 0049AE0D    ret
*}
end;

//0049AE10
function TThemeServices.GetElementDetails(Detail:TThemedWindow):TThemedElementDetails;
begin
{*
 0049AE10    mov         byte ptr [ecx],17
 0049AE13    movzx       eax,dl
 0049AE16    cmp         eax,68
>0049AE19    ja          0049B188
 0049AE1F    movzx       eax,byte ptr [eax+49AE2D]
 0049AE26    jmp         dword ptr [eax*4+49AE96]
 0049AE26    db          0
 0049AE26    db          0
 0049AE26    db          1
 0049AE26    db          1
 0049AE26    db          1
 0049AE26    db          2
 0049AE26    db          2
 0049AE26    db          2
 0049AE26    db          3
 0049AE26    db          3
 0049AE26    db          3
 0049AE26    db          4
 0049AE26    db          4
 0049AE26    db          4
 0049AE26    db          5
 0049AE26    db          5
 0049AE26    db          5
 0049AE26    db          6
 0049AE26    db          6
 0049AE26    db          6
 0049AE26    db          7
 0049AE26    db          7
 0049AE26    db          8
 0049AE26    db          8
 0049AE26    db          9
 0049AE26    db          9
 0049AE26    db          10
 0049AE26    db          10
 0049AE26    db          11
 0049AE26    db          11
 0049AE26    db          12
 0049AE26    db          12
 0049AE26    db          13
 0049AE26    db          13
 0049AE26    db          13
 0049AE26    db          13
 0049AE26    db          14
 0049AE26    db          14
 0049AE26    db          14
 0049AE26    db          14
 0049AE26    db          15
 0049AE26    db          15
 0049AE26    db          15
 0049AE26    db          15
 0049AE26    db          16
 0049AE26    db          16
 0049AE26    db          16
 0049AE26    db          16
 0049AE26    db          17
 0049AE26    db          17
 0049AE26    db          17
 0049AE26    db          17
 0049AE26    db          18
 0049AE26    db          18
 0049AE26    db          18
 0049AE26    db          18
 0049AE26    db          19
 0049AE26    db          19
 0049AE26    db          19
 0049AE26    db          19
 0049AE26    db          20
 0049AE26    db          20
 0049AE26    db          20
 0049AE26    db          20
 0049AE26    db          21
 0049AE26    db          21
 0049AE26    db          21
 0049AE26    db          21
 0049AE26    db          22
 0049AE26    db          22
 0049AE26    db          22
 0049AE26    db          22
 0049AE26    db          23
 0049AE26    db          23
 0049AE26    db          23
 0049AE26    db          23
 0049AE26    db          24
 0049AE26    db          24
 0049AE26    db          24
 0049AE26    db          24
 0049AE26    db          25
 0049AE26    db          25
 0049AE26    db          25
 0049AE26    db          25
 0049AE26    db          26
 0049AE26    db          26
 0049AE26    db          26
 0049AE26    db          26
 0049AE26    db          27
 0049AE26    db          27
 0049AE26    db          27
 0049AE26    db          27
 0049AE26    db          28
 0049AE26    db          28
 0049AE26    db          28
 0049AE26    db          28
 0049AE26    db          29
 0049AE26    db          30
 0049AE26    db          31
 0049AE26    db          32
 0049AE26    db          33
 0049AE26    db          34
 0049AE26    db          35
 0049AE26    db          36
 0049AE26    db          37
 0049AE26    dd          0049B188
 0049AE26    dd          0049AF2E
 0049AE26    dd          0049AF3F
 0049AE26    dd          0049AF50
 0049AE26    dd          0049AF61
 0049AE26    dd          0049AF72
 0049AE26    dd          0049AF83
 0049AE26    dd          0049AF94
 0049AE26    dd          0049AFA5
 0049AE26    dd          0049AFB6
 0049AE26    dd          0049AFC7
 0049AE26    dd          0049AFD8
 0049AE26    dd          0049AFE9
 0049AE26    dd          0049AFFA
 0049AE26    dd          0049B00B
 0049AE26    dd          0049B01C
 0049AE26    dd          0049B02D
 0049AE26    dd          0049B03E
 0049AE26    dd          0049B04F
 0049AE26    dd          0049B060
 0049AE26    dd          0049B071
 0049AE26    dd          0049B082
 0049AE26    dd          0049B093
 0049AE26    dd          0049B0A4
 0049AE26    dd          0049B0B5
 0049AE26    dd          0049B0C6
 0049AE26    dd          0049B0D7
 0049AE26    dd          0049B0E8
 0049AE26    dd          0049B0F9
 0049AE26    dd          0049B10A
 0049AE26    dd          0049B118
 0049AE26    dd          0049B126
 0049AE26    dd          0049B134
 0049AE26    dd          0049B142
 0049AE26    dd          0049B150
 0049AE26    dd          0049B15E
 0049AE26    dd          0049B16C
 0049AE26    dd          0049B17A
 0049AF2E    mov         dword ptr [ecx+4],1
 0049AF35    mov         eax,2
>0049AF3A    jmp         0049B18F
 0049AF3F    mov         dword ptr [ecx+4],2
 0049AF46    mov         eax,5
>0049AF4B    jmp         0049B18F
 0049AF50    mov         dword ptr [ecx+4],3
 0049AF57    mov         eax,8
>0049AF5C    jmp         0049B18F
 0049AF61    mov         dword ptr [ecx+4],4
 0049AF68    mov         eax,0B
>0049AF6D    jmp         0049B18F
 0049AF72    mov         dword ptr [ecx+4],5
 0049AF79    mov         eax,0E
>0049AF7E    jmp         0049B18F
 0049AF83    mov         dword ptr [ecx+4],6
 0049AF8A    mov         eax,11
>0049AF8F    jmp         0049B18F
 0049AF94    mov         dword ptr [ecx+4],7
 0049AF9B    mov         eax,14
>0049AFA0    jmp         0049B18F
 0049AFA5    mov         dword ptr [ecx+4],8
 0049AFAC    mov         eax,16
>0049AFB1    jmp         0049B18F
 0049AFB6    mov         dword ptr [ecx+4],9
 0049AFBD    mov         eax,18
>0049AFC2    jmp         0049B18F
 0049AFC7    mov         dword ptr [ecx+4],0A
 0049AFCE    mov         eax,1A
>0049AFD3    jmp         0049B18F
 0049AFD8    mov         dword ptr [ecx+4],0B
 0049AFDF    mov         eax,1C
>0049AFE4    jmp         0049B18F
 0049AFE9    mov         dword ptr [ecx+4],0C
 0049AFF0    mov         eax,1E
>0049AFF5    jmp         0049B18F
 0049AFFA    mov         dword ptr [ecx+4],0D
 0049B001    mov         eax,20
>0049B006    jmp         0049B18F
 0049B00B    mov         dword ptr [ecx+4],0E
 0049B012    mov         eax,24
>0049B017    jmp         0049B18F
 0049B01C    mov         dword ptr [ecx+4],0F
 0049B023    mov         eax,28
>0049B028    jmp         0049B18F
 0049B02D    mov         dword ptr [ecx+4],10
 0049B034    mov         eax,2C
>0049B039    jmp         0049B18F
 0049B03E    mov         dword ptr [ecx+4],11
 0049B045    mov         eax,30
>0049B04A    jmp         0049B18F
 0049B04F    mov         dword ptr [ecx+4],12
 0049B056    mov         eax,34
>0049B05B    jmp         0049B18F
 0049B060    mov         dword ptr [ecx+4],13
 0049B067    mov         eax,38
>0049B06C    jmp         0049B18F
 0049B071    mov         dword ptr [ecx+4],14
 0049B078    mov         eax,3C
>0049B07D    jmp         0049B18F
 0049B082    mov         dword ptr [ecx+4],15
 0049B089    mov         eax,40
>0049B08E    jmp         0049B18F
 0049B093    mov         dword ptr [ecx+4],16
 0049B09A    mov         eax,44
>0049B09F    jmp         0049B18F
 0049B0A4    mov         dword ptr [ecx+4],17
 0049B0AB    mov         eax,48
>0049B0B0    jmp         0049B18F
 0049B0B5    mov         dword ptr [ecx+4],18
 0049B0BC    mov         eax,4C
>0049B0C1    jmp         0049B18F
 0049B0C6    mov         dword ptr [ecx+4],19
 0049B0CD    mov         eax,50
>0049B0D2    jmp         0049B18F
 0049B0D7    mov         dword ptr [ecx+4],1A
 0049B0DE    mov         eax,54
>0049B0E3    jmp         0049B18F
 0049B0E8    mov         dword ptr [ecx+4],1B
 0049B0EF    mov         eax,58
>0049B0F4    jmp         0049B18F
 0049B0F9    mov         dword ptr [ecx+4],1C
 0049B100    mov         eax,5C
>0049B105    jmp         0049B18F
 0049B10A    mov         dword ptr [ecx+4],1D
 0049B111    mov         eax,60
>0049B116    jmp         0049B18F
 0049B118    mov         dword ptr [ecx+4],1E
 0049B11F    mov         eax,61
>0049B124    jmp         0049B18F
 0049B126    mov         dword ptr [ecx+4],1F
 0049B12D    mov         eax,62
>0049B132    jmp         0049B18F
 0049B134    mov         dword ptr [ecx+4],20
 0049B13B    mov         eax,63
>0049B140    jmp         0049B18F
 0049B142    mov         dword ptr [ecx+4],21
 0049B149    mov         eax,64
>0049B14E    jmp         0049B18F
 0049B150    mov         dword ptr [ecx+4],22
 0049B157    mov         eax,65
>0049B15C    jmp         0049B18F
 0049B15E    mov         dword ptr [ecx+4],23
 0049B165    mov         eax,66
>0049B16A    jmp         0049B18F
 0049B16C    mov         dword ptr [ecx+4],24
 0049B173    mov         eax,67
>0049B178    jmp         0049B18F
 0049B17A    mov         dword ptr [ecx+4],25
 0049B181    mov         eax,68
>0049B186    jmp         0049B18F
 0049B188    xor         eax,eax
 0049B18A    mov         dword ptr [ecx+4],eax
 0049B18D    xor         eax,eax
 0049B18F    and         edx,7F
 0049B192    sub         edx,eax
 0049B194    inc         edx
 0049B195    mov         dword ptr [ecx+8],edx
 0049B198    ret
*}
end;

//0049B19C
function TThemeServices.HasTransparentParts(Details:TThemedElementDetails):Boolean;
begin
{*
 0049B19C    push        ebx
 0049B19D    push        esi
 0049B19E    push        edi
 0049B19F    add         esp,0FFFFFFF4
 0049B1A2    mov         esi,edx
 0049B1A4    lea         edi,[esp]
 0049B1A7    movs        dword ptr [edi],dword ptr [esi]
 0049B1A8    movs        dword ptr [edi],dword ptr [esi]
 0049B1A9    movs        dword ptr [edi],dword ptr [esi]
 0049B1AA    mov         ebx,eax
 0049B1AC    mov         eax,dword ptr [esp+8]
 0049B1B0    push        eax
 0049B1B1    mov         eax,dword ptr [esp+8]
 0049B1B5    push        eax
 0049B1B6    movzx       edx,byte ptr [esp+8]
 0049B1BB    mov         eax,ebx
 0049B1BD    call        TThemeServices.GetTheme
 0049B1C2    push        eax
 0049B1C3    mov         eax,[0078CF54];IsThemeBackgroundPartiallyTransparent:function(val hTheme:Windows.THandle...
 0049B1C8    mov         eax,dword ptr [eax]
 0049B1CA    call        eax
 0049B1CC    cmp         eax,1
 0049B1CF    sbb         eax,eax
 0049B1D1    inc         eax
 0049B1D2    add         esp,0C
 0049B1D5    pop         edi
 0049B1D6    pop         esi
 0049B1D7    pop         ebx
 0049B1D8    ret
*}
end;

//0049B1DC
procedure TThemeServices.PaintBorder(Control:TWinControl; EraseLRCorner:Boolean);
begin
{*
 0049B1DC    push        ebp
 0049B1DD    mov         ebp,esp
 0049B1DF    add         esp,0FFFFFFBC
 0049B1E2    push        ebx
 0049B1E3    push        esi
 0049B1E4    push        edi
 0049B1E5    mov         ebx,ecx
 0049B1E7    mov         dword ptr [ebp-4],edx
 0049B1EA    mov         esi,eax
 0049B1EC    push        0EC
 0049B1EE    mov         eax,dword ptr [ebp-4]
 0049B1F1    call        TWinControl.GetHandle
 0049B1F6    push        eax
 0049B1F7    call        user32.GetWindowLongW
 0049B1FC    test        ah,2
>0049B1FF    je          0049B379
 0049B205    lea         eax,[ebp-28]
 0049B208    push        eax
 0049B209    mov         eax,dword ptr [ebp-4]
 0049B20C    call        TWinControl.GetHandle
 0049B211    push        eax
 0049B212    call        user32.GetWindowRect
 0049B217    mov         ecx,dword ptr [ebp-24]
 0049B21A    neg         ecx
 0049B21C    mov         edx,dword ptr [ebp-28]
 0049B21F    neg         edx
 0049B221    lea         eax,[ebp-28]
 0049B224    call        OffsetRect
 0049B229    mov         eax,dword ptr [ebp-4]
 0049B22C    call        TWinControl.GetHandle
 0049B231    push        eax
 0049B232    call        user32.GetWindowDC
 0049B237    mov         dword ptr [ebp-8],eax
 0049B23A    xor         edx,edx
 0049B23C    push        ebp
 0049B23D    push        49B372
 0049B242    push        dword ptr fs:[edx]
 0049B245    mov         dword ptr fs:[edx],esp
 0049B248    push        esi
 0049B249    lea         esi,[ebp-28]
 0049B24C    lea         edi,[ebp-18]
 0049B24F    movs        dword ptr [edi],dword ptr [esi]
 0049B250    movs        dword ptr [edi],dword ptr [esi]
 0049B251    movs        dword ptr [edi],dword ptr [esi]
 0049B252    movs        dword ptr [edi],dword ptr [esi]
 0049B253    pop         esi
 0049B254    test        bl,bl
>0049B256    je          0049B310
 0049B25C    push        0F0
 0049B25E    mov         eax,dword ptr [ebp-4]
 0049B261    call        TWinControl.GetHandle
 0049B266    push        eax
 0049B267    call        user32.GetWindowLongW
 0049B26C    test        eax,100000
>0049B271    je          0049B310
 0049B277    test        eax,200000
>0049B27C    je          0049B310
 0049B282    push        2
 0049B284    call        user32.GetSystemMetrics
 0049B289    mov         edi,eax
 0049B28B    push        3
 0049B28D    call        user32.GetSystemMetrics
 0049B292    mov         ebx,eax
 0049B294    push        0FE
 0049B296    push        0FE
 0049B298    lea         eax,[ebp-18]
 0049B29B    push        eax
 0049B29C    call        user32.InflateRect
 0049B2A1    mov         eax,dword ptr [ebp-4]
 0049B2A4    call        TControl.UseRightToLeftScrollBar
 0049B2A9    test        al,al
>0049B2AB    je          0049B2D5
 0049B2AD    mov         eax,dword ptr [ebp-0C]
 0049B2B0    push        eax
 0049B2B1    lea         eax,[ebp-44]
 0049B2B4    push        eax
 0049B2B5    mov         ecx,dword ptr [ebp-18]
 0049B2B8    add         ecx,edi
 0049B2BA    mov         edx,dword ptr [ebp-0C]
 0049B2BD    sub         edx,ebx
 0049B2BF    mov         eax,dword ptr [ebp-18]
 0049B2C2    call        Rect
 0049B2C7    push        esi
 0049B2C8    lea         esi,[ebp-44]
 0049B2CB    lea         edi,[ebp-18]
 0049B2CE    movs        dword ptr [edi],dword ptr [esi]
 0049B2CF    movs        dword ptr [edi],dword ptr [esi]
 0049B2D0    movs        dword ptr [edi],dword ptr [esi]
 0049B2D1    movs        dword ptr [edi],dword ptr [esi]
 0049B2D2    pop         esi
>0049B2D3    jmp         0049B2FB
 0049B2D5    mov         eax,dword ptr [ebp-0C]
 0049B2D8    push        eax
 0049B2D9    lea         eax,[ebp-44]
 0049B2DC    push        eax
 0049B2DD    mov         edx,dword ptr [ebp-0C]
 0049B2E0    sub         edx,ebx
 0049B2E2    mov         eax,dword ptr [ebp-10]
 0049B2E5    sub         eax,edi
 0049B2E7    mov         ecx,dword ptr [ebp-10]
 0049B2EA    call        Rect
 0049B2EF    push        esi
 0049B2F0    lea         esi,[ebp-44]
 0049B2F3    lea         edi,[ebp-18]
 0049B2F6    movs        dword ptr [edi],dword ptr [esi]
 0049B2F7    movs        dword ptr [edi],dword ptr [esi]
 0049B2F8    movs        dword ptr [edi],dword ptr [esi]
 0049B2F9    movs        dword ptr [edi],dword ptr [esi]
 0049B2FA    pop         esi
 0049B2FB    push        0F
 0049B2FD    call        user32.GetSysColorBrush
 0049B302    push        eax
 0049B303    lea         eax,[ebp-18]
 0049B306    push        eax
 0049B307    mov         eax,dword ptr [ebp-8]
 0049B30A    push        eax
 0049B30B    call        user32.FillRect
 0049B310    mov         eax,dword ptr [ebp-1C]
 0049B313    sub         eax,2
 0049B316    push        eax
 0049B317    mov         eax,dword ptr [ebp-20]
 0049B31A    sub         eax,2
 0049B31D    push        eax
 0049B31E    mov         eax,dword ptr [ebp-24]
 0049B321    add         eax,2
 0049B324    push        eax
 0049B325    mov         eax,dword ptr [ebp-28]
 0049B328    add         eax,2
 0049B32B    push        eax
 0049B32C    mov         eax,dword ptr [ebp-8]
 0049B32F    push        eax
 0049B330    call        gdi32.ExcludeClipRect
 0049B335    lea         ecx,[ebp-34]
 0049B338    mov         dl,2
 0049B33A    mov         eax,esi
 0049B33C    call        TThemeServices.GetElementDetails
 0049B341    lea         eax,[ebp-28]
 0049B344    push        eax
 0049B345    lea         ecx,[ebp-34]
 0049B348    mov         edx,dword ptr [ebp-8]
 0049B34B    mov         eax,esi
 0049B34D    call        TThemeServices.DrawElement
 0049B352    xor         eax,eax
 0049B354    pop         edx
 0049B355    pop         ecx
 0049B356    pop         ecx
 0049B357    mov         dword ptr fs:[eax],edx
 0049B35A    push        49B379
 0049B35F    mov         eax,dword ptr [ebp-8]
 0049B362    push        eax
 0049B363    mov         eax,dword ptr [ebp-4]
 0049B366    call        TWinControl.GetHandle
 0049B36B    push        eax
 0049B36C    call        user32.ReleaseDC
 0049B371    ret
>0049B372    jmp         @HandleFinally
>0049B377    jmp         0049B35F
 0049B379    pop         edi
 0049B37A    pop         esi
 0049B37B    pop         ebx
 0049B37C    mov         esp,ebp
 0049B37E    pop         ebp
 0049B37F    ret
*}
end;

//0049B380
procedure TThemeServices.UpdateThemes;
begin
{*
 0049B380    push        ebx
 0049B381    mov         ebx,eax
 0049B383    cmp         byte ptr [ebx+6],0
>0049B387    je          0049B390
 0049B389    mov         eax,ebx
 0049B38B    call        TThemeServices.UnloadThemeData
 0049B390    call        UseThemes
 0049B395    mov         byte ptr [ebx+6],al
 0049B398    pop         ebx
 0049B399    ret
*}
end;

//0049B39C
function ThemeControl(AControl:TControl):Boolean;
begin
{*
 0049B39C    push        ebx
 0049B39D    mov         ebx,eax
 0049B39F    xor         eax,eax
 0049B3A1    test        ebx,ebx
>0049B3A3    je          0049B3E5
 0049B3A5    test        byte ptr [ebx+1C],10
>0049B3A9    jne         0049B3B9
 0049B3AB    call        ThemeServices
 0049B3B0    call        TThemeServices.GetThemesEnabled
 0049B3B5    test        al,al
>0049B3B7    jne         0049B3E3
 0049B3B9    test        byte ptr [ebx+1C],10
>0049B3BD    je          0049B3DF
 0049B3BF    cmp         dword ptr [ebx+34],0
>0049B3C3    je          0049B3DF
 0049B3C5    call        ThemeServices
 0049B3CA    call        TThemeServices.GetThemesEnabled
 0049B3CF    test        al,al
>0049B3D1    je          0049B3DF
 0049B3D3    mov         eax,dword ptr [ebx+34]
 0049B3D6    call        UnthemedDesigner
 0049B3DB    test        al,al
>0049B3DD    je          0049B3E3
 0049B3DF    xor         eax,eax
>0049B3E1    jmp         0049B3E5
 0049B3E3    mov         al,1
 0049B3E5    pop         ebx
 0049B3E6    ret
*}
end;

Initialization
Finalization
//0049B3E8
{*
 0049B3E8    push        ebp
 0049B3E9    mov         ebp,esp
 0049B3EB    xor         eax,eax
 0049B3ED    push        ebp
 0049B3EE    push        49B42D
 0049B3F3    push        dword ptr fs:[eax]
 0049B3F6    mov         dword ptr fs:[eax],esp
 0049B3F9    inc         dword ptr ds:[793218]
>0049B3FF    jne         0049B41F
 0049B401    mov         eax,[0078CB94];^IsLibrary:Boolean
 0049B406    cmp         byte ptr [eax],0
>0049B409    jne         0049B415
 0049B40B    mov         eax,[0079321C]
 0049B410    call        TObject.Free
 0049B415    mov         eax,785B54;^'Theme manager © 2001-2006 Mike Lischke'
 0049B41A    call        @UStrClr
 0049B41F    xor         eax,eax
 0049B421    pop         edx
 0049B422    pop         ecx
 0049B423    pop         ecx
 0049B424    mov         dword ptr fs:[eax],edx
 0049B427    push        49B434
 0049B42C    ret
>0049B42D    jmp         @HandleFinally
>0049B432    jmp         0049B42C
 0049B434    pop         ebp
 0049B435    ret
*}
end.