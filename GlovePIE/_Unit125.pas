//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit125;

interface

uses
  SysUtils, Classes;

type
  TInvForm = class(TForm)
  public
    procedure PaintWindow(DC:HDC); virtual;//vD4//006C55E4
    procedure WMPaint(Message:TWMPaint); message WM_PAINT;//006C55F0
    procedure WMEraseBkgnd(var Message:TWMEraseBkgnd); message WM_ERASEBKGND;//006C55E8
  end;
  TScreenValue = class(TObjectValue)
  published
    //procedure GetString(?:?);//006C7D1C
    procedure FillClone(c:TExpression);//006C7B28
    function GetUnits:TUnits;//006C8030
    function GetPerUnits2:TUnits;//006C7D18
    function GetPerUnits1:TUnits;//006C7D08
    procedure CreateClone;//006C7B18
    function CanSet:Boolean;//006C7B04
    function GetDataType:TDataType;//006C7BC4
    //function SetValue(NewValue:Double; ?:?):Boolean;//006C93E0
    procedure GetValue;//006C813C
    //procedure ToString(?:?);//006C9428
  public
    ....................Item:Integer;//f20
    //procedure ToString(?:?); virtual;//006C9428
    procedure GetValue; virtual;//v2C//006C813C
    //procedure GetString(?:?); virtual;//v38//006C7D1C
    function GetDataType:TDataType; virtual;//v44//006C7BC4
    function GetUnits:TUnits; virtual;//v48//006C8030
    function GetPerUnits1:TUnits; virtual;//v4C//006C7D08
    function GetPerUnits2:TUnits; virtual;//v50//006C7D18
    //function SetValue(NewValue:Double; ?:?):Boolean; virtual;//v58//006C93E0
    function CanSet:Boolean; virtual;//v68//006C7B04
    procedure CreateClone; virtual;//v80//006C7B18
    procedure FillClone(c:TExpression); virtual;//v84//006C7B28
  end;
    procedure PaintWindow(DC:HDC);//006C55E4
    procedure WMEraseBkgnd(var Message:TWMEraseBkgnd);//006C55E8
    procedure WMPaint(Message:TWMPaint);//006C55F0
    function EnumDisplaySettingsA(iModeNum:DWORD; var lpDevMode:_devicemodeA):LongBool; stdcall;//006C59B0
    function ChangeDisplaySettingsA(dwFlags:DWORD):LongInt; stdcall;//006C59B8
    procedure sub_006C59C0;//006C59C0
    procedure sub_006C59E4;//006C59E4
    //procedure sub_006C728C(?:?; ?:?; ?:?; ?:?);//006C728C
    //procedure sub_006C73BC(?:?; ?:?);//006C73BC
    procedure sub_006C757C;//006C757C
    procedure sub_006C7694;//006C7694
    //function sub_006C771C:?;//006C771C
    //function sub_006C7758(?:UnicodeString):?;//006C7758
    //procedure sub_006C77A8(?:Integer; ?:?);//006C77A8
    //function sub_006C77C0:?;//006C77C0
    //function sub_006C7838(?:?):?;//006C7838
    //function sub_006C7900(?:?):?;//006C7900
    //function sub_006C7B48(?:?):?;//006C7B48
    //function sub_006C7B88(?:?; ?:?):?;//006C7B88
    //function sub_006C91D8(?:?; ?:?):?;//006C91D8
    procedure sub_006C94EC;//006C94EC
    procedure sub_006C9654;//006C9654

implementation

{$R *.DFM}

//006C55E4
procedure TInvForm.PaintWindow(DC:HDC);
begin
{*
 006C55E4    ret
*}
end;

//006C55E8
procedure TInvForm.WMEraseBkgnd(var Message:TWMEraseBkgnd);
begin
{*
 006C55E8    xor         eax,eax
 006C55EA    mov         dword ptr [edx+0C],eax
 006C55ED    ret
*}
end;

//006C55F0
procedure TInvForm.WMPaint(Message:TWMPaint);
begin
{*
 006C55F0    push        ebx
 006C55F1    push        esi
 006C55F2    mov         esi,edx
 006C55F4    mov         ebx,eax
 006C55F6    push        0
 006C55F8    mov         eax,ebx
 006C55FA    call        TWinControl.GetHandle
 006C55FF    push        eax
 006C5600    call        user32.ValidateRect
 006C5605    xor         eax,eax
 006C5607    mov         dword ptr [esi+0C],eax
 006C560A    pop         esi
 006C560B    pop         ebx
 006C560C    ret
*}
end;

//006C59B0
function user32.EnumDisplaySettingsA(iModeNum:DWORD; var lpDevMode:_devicemodeA):LongBool; stdcall;
begin
{*
 006C59B0    jmp         dword ptr ds:[826918]
*}
end;

//006C59B8
function user32.ChangeDisplaySettingsA(dwFlags:DWORD):LongInt; stdcall;
begin
{*
 006C59B8    jmp         dword ptr ds:[826914]
*}
end;

//006C59C0
procedure sub_006C59C0;
begin
{*
 006C59C0    mov         byte ptr ds:[81F6A8],0;gvar_0081F6A8
 006C59C7    fild        dword ptr ds:[81F690];gvar_0081F690:Single
 006C59CD    fstp        qword ptr ds:[81F698];gvar_0081F698:Double
 006C59D3    wait
 006C59D4    fild        dword ptr ds:[81F694];gvar_0081F694:Single
 006C59DA    fstp        qword ptr ds:[81F6A0];gvar_0081F6A0:Double
 006C59E0    wait
 006C59E1    ret
*}
end;

//006C59E4
procedure sub_006C59E4;
begin
{*
 006C59E4    push        ebx
 006C59E5    mov         ebx,81F668;gvar_0081F668:THashTable
 006C59EA    mov         ecx,64
 006C59EF    mov         edx,6C60E0;'Orientation'
 006C59F4    mov         eax,dword ptr [ebx]
 006C59F6    call        THashTable.Add
 006C59FB    mov         ecx,62
 006C5A00    mov         edx,6C6104;'ScrollX'
 006C5A05    mov         eax,dword ptr [ebx]
 006C5A07    call        THashTable.Add
 006C5A0C    mov         ecx,63
 006C5A11    mov         edx,6C6120;'ScrollY'
 006C5A16    mov         eax,dword ptr [ebx]
 006C5A18    call        THashTable.Add
 006C5A1D    mov         ecx,1
 006C5A22    mov         edx,6C613C;'Count'
 006C5A27    mov         eax,dword ptr [ebx]
 006C5A29    call        THashTable.Add
 006C5A2E    mov         ecx,2
 006C5A33    mov         edx,6C6154;'PieScreen'
 006C5A38    mov         eax,dword ptr [ebx]
 006C5A3A    call        THashTable.Add
 006C5A3F    mov         ecx,3
 006C5A44    mov         edx,6C6174;'CursorPosX'
 006C5A49    mov         eax,dword ptr [ebx]
 006C5A4B    call        THashTable.Add
 006C5A50    mov         ecx,4
 006C5A55    mov         edx,6C6198;'CursorPosY'
 006C5A5A    mov         eax,dword ptr [ebx]
 006C5A5C    call        THashTable.Add
 006C5A61    mov         ecx,5
 006C5A66    mov         edx,6C61BC;'TooltipFont'
 006C5A6B    mov         eax,dword ptr [ebx]
 006C5A6D    call        THashTable.Add
 006C5A72    mov         ecx,6
 006C5A77    mov         edx,6C61E0;'TooltipFontHeight'
 006C5A7C    mov         eax,dword ptr [ebx]
 006C5A7E    call        THashTable.Add
 006C5A83    mov         ecx,7
 006C5A88    mov         edx,6C6210;'IconFont'
 006C5A8D    mov         eax,dword ptr [ebx]
 006C5A8F    call        THashTable.Add
 006C5A94    mov         ecx,8
 006C5A99    mov         edx,6C6230;'IconFontHeight'
 006C5A9E    mov         eax,dword ptr [ebx]
 006C5AA0    call        THashTable.Add
 006C5AA5    mov         ecx,9
 006C5AAA    mov         edx,6C625C;'MenuFont'
 006C5AAF    mov         eax,dword ptr [ebx]
 006C5AB1    call        THashTable.Add
 006C5AB6    mov         ecx,0A
 006C5ABB    mov         edx,6C627C;'MenuFontHeight'
 006C5AC0    mov         eax,dword ptr [ebx]
 006C5AC2    call        THashTable.Add
 006C5AC7    mov         ecx,0B
 006C5ACC    mov         edx,6C62A8;'PixelsPerInch'
 006C5AD1    mov         eax,dword ptr [ebx]
 006C5AD3    call        THashTable.Add
 006C5AD8    mov         ecx,0C
 006C5ADD    mov         edx,6C62D0;'DesktopWidth'
 006C5AE2    mov         eax,dword ptr [ebx]
 006C5AE4    call        THashTable.Add
 006C5AE9    mov         ecx,0D
 006C5AEE    mov         edx,6C62F8;'DesktopHeight'
 006C5AF3    mov         eax,dword ptr [ebx]
 006C5AF5    call        THashTable.Add
 006C5AFA    mov         ecx,0E
 006C5AFF    mov         edx,6C6320;'DesktopLeft'
 006C5B04    mov         eax,dword ptr [ebx]
 006C5B06    call        THashTable.Add
 006C5B0B    mov         ecx,0F
 006C5B10    mov         edx,6C6344;'DesktopRight'
 006C5B15    mov         eax,dword ptr [ebx]
 006C5B17    call        THashTable.Add
 006C5B1C    mov         ecx,10
 006C5B21    mov         edx,6C636C;'DesktopTop'
 006C5B26    mov         eax,dword ptr [ebx]
 006C5B28    call        THashTable.Add
 006C5B2D    mov         ecx,11
 006C5B32    mov         edx,6C6390;'DesktopBottom'
 006C5B37    mov         eax,dword ptr [ebx]
 006C5B39    call        THashTable.Add
 006C5B3E    mov         ecx,12
 006C5B43    mov         edx,6C63B8;'DesktopCursorFractionX'
 006C5B48    mov         eax,dword ptr [ebx]
 006C5B4A    call        THashTable.Add
 006C5B4F    mov         ecx,12
 006C5B54    mov         edx,6C63B8;'DesktopCursorFractionX'
 006C5B59    mov         eax,dword ptr [ebx]
 006C5B5B    call        THashTable.Add
 006C5B60    mov         ecx,12
 006C5B65    mov         edx,6C63B8;'DesktopCursorFractionX'
 006C5B6A    mov         eax,dword ptr [ebx]
 006C5B6C    call        THashTable.Add
 006C5B71    mov         ecx,13
 006C5B76    mov         edx,6C63F4;'DesktopCursorFractionY'
 006C5B7B    mov         eax,dword ptr [ebx]
 006C5B7D    call        THashTable.Add
 006C5B82    mov         ecx,14
 006C5B87    mov         edx,6C6430;'MouseSonar'
 006C5B8C    mov         eax,dword ptr [ebx]
 006C5B8E    call        THashTable.Add
 006C5B93    mov         ecx,15
 006C5B98    mov         edx,6C6454;'MouseVanish'
 006C5B9D    mov         eax,dword ptr [ebx]
 006C5B9F    call        THashTable.Add
 006C5BA4    mov         ecx,15
 006C5BA9    mov         edx,6C6454;'MouseVanish'
 006C5BAE    mov         eax,dword ptr [ebx]
 006C5BB0    call        THashTable.Add
 006C5BB5    mov         ecx,16
 006C5BBA    mov         edx,6C6478;'HasScreenReader'
 006C5BBF    mov         eax,dword ptr [ebx]
 006C5BC1    call        THashTable.Add
 006C5BC6    mov         ecx,17
 006C5BCB    mov         edx,6C64A4;'FocusBorderWidth'
 006C5BD0    mov         eax,dword ptr [ebx]
 006C5BD2    call        THashTable.Add
 006C5BD7    mov         ecx,18
 006C5BDC    mov         edx,6C64D4;'FocusBorderHeight'
 006C5BE1    mov         eax,dword ptr [ebx]
 006C5BE3    call        THashTable.Add
 006C5BE8    mov         ecx,19
 006C5BED    mov         edx,6C6504;'HighContrast'
 006C5BF2    mov         eax,dword ptr [ebx]
 006C5BF4    call        THashTable.Add
 006C5BF9    mov         ecx,1A
 006C5BFE    mov         edx,6C652C;'ShowSounds'
 006C5C03    mov         eax,dword ptr [ebx]
 006C5C05    call        THashTable.Add
 006C5C0A    mov         ecx,1B
 006C5C0F    mov         edx,6C6550;'DesktopWallpaper'
 006C5C14    mov         eax,dword ptr [ebx]
 006C5C16    call        THashTable.Add
 006C5C1B    mov         ecx,1C
 006C5C20    mov         edx,6C6580;'DropShadow'
 006C5C25    mov         eax,dword ptr [ebx]
 006C5C27    call        THashTable.Add
 006C5C2C    mov         ecx,1D
 006C5C31    mov         edx,6C65A4;'FlatMenus'
 006C5C36    mov         eax,dword ptr [ebx]
 006C5C38    call        THashTable.Add
 006C5C3D    mov         ecx,1E
 006C5C42    mov         edx,6C65C4;'FontSmoothing'
 006C5C47    mov         eax,dword ptr [ebx]
 006C5C49    call        THashTable.Add
 006C5C4E    mov         ecx,1F
 006C5C53    mov         edx,6C65EC;'FontSmoothingContrast'
 006C5C58    mov         eax,dword ptr [ebx]
 006C5C5A    call        THashTable.Add
 006C5C5F    mov         ecx,20
 006C5C64    mov         edx,6C6624;'FontSmoothingType'
 006C5C69    mov         eax,dword ptr [ebx]
 006C5C6B    call        THashTable.Add
 006C5C70    mov         ecx,21
 006C5C75    mov         edx,6C6654;'Name'
 006C5C7A    mov         eax,dword ptr [ebx]
 006C5C7C    call        THashTable.Add
 006C5C81    mov         ecx,22
 006C5C86    mov         edx,6C666C;'Width'
 006C5C8B    mov         eax,dword ptr [ebx]
 006C5C8D    call        THashTable.Add
 006C5C92    mov         ecx,23
 006C5C97    mov         edx,6C6684;'Height'
 006C5C9C    mov         eax,dword ptr [ebx]
 006C5C9E    call        THashTable.Add
 006C5CA3    mov         ecx,24
 006C5CA8    mov         edx,6C66A0;'Left'
 006C5CAD    mov         eax,dword ptr [ebx]
 006C5CAF    call        THashTable.Add
 006C5CB4    mov         ecx,25
 006C5CB9    mov         edx,6C66B8;'Right'
 006C5CBE    mov         eax,dword ptr [ebx]
 006C5CC0    call        THashTable.Add
 006C5CC5    mov         ecx,26
 006C5CCA    mov         edx,6C66D0;'Top'
 006C5CCF    mov         eax,dword ptr [ebx]
 006C5CD1    call        THashTable.Add
 006C5CD6    mov         ecx,27
 006C5CDB    mov         edx,6C66E4;'Bottom'
 006C5CE0    mov         eax,dword ptr [ebx]
 006C5CE2    call        THashTable.Add
 006C5CE7    mov         ecx,28
 006C5CEC    mov         edx,6C6700;'Handle'
 006C5CF1    mov         eax,dword ptr [ebx]
 006C5CF3    call        THashTable.Add
 006C5CF8    mov         ecx,29
 006C5CFD    mov         edx,6C671C;'WorkAreaLeft'
 006C5D02    mov         eax,dword ptr [ebx]
 006C5D04    call        THashTable.Add
 006C5D09    mov         ecx,2A
 006C5D0E    mov         edx,6C6744;'WorkAreaRight'
 006C5D13    mov         eax,dword ptr [ebx]
 006C5D15    call        THashTable.Add
 006C5D1A    mov         ecx,2B
 006C5D1F    mov         edx,6C676C;'WorkAreaTop'
 006C5D24    mov         eax,dword ptr [ebx]
 006C5D26    call        THashTable.Add
 006C5D2B    mov         ecx,2C
 006C5D30    mov         edx,6C6790;'WorkAreaBottom'
 006C5D35    mov         eax,dword ptr [ebx]
 006C5D37    call        THashTable.Add
 006C5D3C    mov         ecx,2D
 006C5D41    mov         edx,6C67BC;'WorkAreaWidth'
 006C5D46    mov         eax,dword ptr [ebx]
 006C5D48    call        THashTable.Add
 006C5D4D    mov         ecx,2E
 006C5D52    mov         edx,6C67E4;'WorkAreaHeight'
 006C5D57    mov         eax,dword ptr [ebx]
 006C5D59    call        THashTable.Add
 006C5D5E    mov         ecx,2F
 006C5D63    mov         edx,6C6810;'exists'
 006C5D68    mov         eax,dword ptr [ebx]
 006C5D6A    call        THashTable.Add
 006C5D6F    mov         ecx,30
 006C5D74    mov         edx,6C682C;'IsPrimary'
 006C5D79    mov         eax,dword ptr [ebx]
 006C5D7B    call        THashTable.Add
 006C5D80    mov         ecx,31
 006C5D85    mov         edx,6C684C;'IsPieScreen'
 006C5D8A    mov         eax,dword ptr [ebx]
 006C5D8C    call        THashTable.Add
 006C5D91    mov         ecx,32
 006C5D96    mov         edx,6C6870;'CursorFractionX'
 006C5D9B    mov         eax,dword ptr [ebx]
 006C5D9D    call        THashTable.Add
 006C5DA2    mov         ecx,33
 006C5DA7    mov         edx,6C689C;'CursorFractionY'
 006C5DAC    mov         eax,dword ptr [ebx]
 006C5DAE    call        THashTable.Add
 006C5DB3    mov         ecx,34
 006C5DB8    mov         edx,6C68C8;'Cursor'
 006C5DBD    mov         eax,dword ptr [ebx]
 006C5DBF    call        THashTable.Add
 006C5DC4    mov         ecx,35
 006C5DC9    mov         edx,6C68E4;'DeviceName'
 006C5DCE    mov         eax,dword ptr [ebx]
 006C5DD0    call        THashTable.Add
 006C5DD5    mov         ecx,36
 006C5DDA    mov         edx,6C6908;'SameDisplayFormat'
 006C5DDF    mov         eax,dword ptr [ebx]
 006C5DE1    call        THashTable.Add
 006C5DE6    mov         ecx,39
 006C5DEB    mov         edx,6C6938;'IconTitleWrap'
 006C5DF0    mov         eax,dword ptr [ebx]
 006C5DF2    call        THashTable.Add
 006C5DF7    mov         ecx,37
 006C5DFC    mov         edx,6C6960;'IconHorizontalSpacing'
 006C5E01    mov         eax,dword ptr [ebx]
 006C5E03    call        THashTable.Add
 006C5E08    mov         ecx,38
 006C5E0D    mov         edx,6C6998;'IconVerticalSpacing'
 006C5E12    mov         eax,dword ptr [ebx]
 006C5E14    call        THashTable.Add
 006C5E19    mov         ecx,3B
 006C5E1E    mov         edx,6C69CC;'MouseTrails'
 006C5E23    mov         eax,dword ptr [ebx]
 006C5E25    call        THashTable.Add
 006C5E2A    mov         ecx,3A
 006C5E2F    mov         edx,6C69F0;'KeyboardCues'
 006C5E34    mov         eax,dword ptr [ebx]
 006C5E36    call        THashTable.Add
 006C5E3B    mov         ecx,3E
 006C5E40    mov         edx,6C6A18;'MenuShowDelay'
 006C5E45    mov         eax,dword ptr [ebx]
 006C5E47    call        THashTable.Add
 006C5E4C    mov         ecx,3D
 006C5E51    mov         edx,6C6A40;'MenuFade'
 006C5E56    mov         eax,dword ptr [ebx]
 006C5E58    call        THashTable.Add
 006C5E5D    mov         ecx,3C
 006C5E62    mov         edx,6C6A60;'MenuLeftAligned'
 006C5E67    mov         eax,dword ptr [ebx]
 006C5E69    call        THashTable.Add
 006C5E6E    mov         ecx,3F
 006C5E73    mov         edx,6C6A8C;'ScreenSaverEnabled'
 006C5E78    mov         eax,dword ptr [ebx]
 006C5E7A    call        THashTable.Add
 006C5E7F    mov         ecx,41
 006C5E84    mov         edx,6C6AC0;'ScreenSaverRunning'
 006C5E89    mov         eax,dword ptr [ebx]
 006C5E8B    call        THashTable.Add
 006C5E90    mov         ecx,40
 006C5E95    mov         edx,6C6AF4;'ScreenSaverTimeout'
 006C5E9A    mov         eax,dword ptr [ebx]
 006C5E9C    call        THashTable.Add
 006C5EA1    mov         ecx,42
 006C5EA6    mov         edx,6C6B28;'ComboBoxAnimation'
 006C5EAB    mov         eax,dword ptr [ebx]
 006C5EAD    call        THashTable.Add
 006C5EB2    mov         ecx,43
 006C5EB7    mov         edx,6C6B58;'CursorShadow'
 006C5EBC    mov         eax,dword ptr [ebx]
 006C5EBE    call        THashTable.Add
 006C5EC3    mov         ecx,44
 006C5EC8    mov         edx,6C6B80;'GradientCaptions'
 006C5ECD    mov         eax,dword ptr [ebx]
 006C5ECF    call        THashTable.Add
 006C5ED4    mov         ecx,45
 006C5ED9    mov         edx,6C6BB0;'HotTracking'
 006C5EDE    mov         eax,dword ptr [ebx]
 006C5EE0    call        THashTable.Add
 006C5EE5    mov         ecx,46
 006C5EEA    mov         edx,6C6BD4;'ListBoxSmoothScrolling'
 006C5EEF    mov         eax,dword ptr [ebx]
 006C5EF1    call        THashTable.Add
 006C5EF6    mov         ecx,47
 006C5EFB    mov         edx,6C6C10;'MenuAnimation'
 006C5F00    mov         eax,dword ptr [ebx]
 006C5F02    call        THashTable.Add
 006C5F07    mov         ecx,48
 006C5F0C    mov         edx,6C6C38;'SelectionFade'
 006C5F11    mov         eax,dword ptr [ebx]
 006C5F13    call        THashTable.Add
 006C5F18    mov         ecx,49
 006C5F1D    mov         edx,6C6C60;'ToolTipAnimation'
 006C5F22    mov         eax,dword ptr [ebx]
 006C5F24    call        THashTable.Add
 006C5F29    mov         ecx,4A
 006C5F2E    mov         edx,6C6C90;'ToolTipFade'
 006C5F33    mov         eax,dword ptr [ebx]
 006C5F35    call        THashTable.Add
 006C5F3A    mov         ecx,4B
 006C5F3F    mov         edx,6C6CB4;'UIEffects'
 006C5F44    mov         eax,dword ptr [ebx]
 006C5F46    call        THashTable.Add
 006C5F4B    mov         ecx,4C
 006C5F50    mov         edx,6C6CD4;'ActiveWindowTracking'
 006C5F55    mov         eax,dword ptr [ebx]
 006C5F57    call        THashTable.Add
 006C5F5C    mov         ecx,4D
 006C5F61    mov         edx,6C6D0C;'ActiveWindowTrackZOrder'
 006C5F66    mov         eax,dword ptr [ebx]
 006C5F68    call        THashTable.Add
 006C5F6D    mov         ecx,4E
 006C5F72    mov         edx,6C6D48;'ActiveWindowTrackTimeout'
 006C5F77    mov         eax,dword ptr [ebx]
 006C5F79    call        THashTable.Add
 006C5F7E    mov         ecx,4F
 006C5F83    mov         edx,6C6D88;'WindowBorder'
 006C5F88    mov         eax,dword ptr [ebx]
 006C5F8A    call        THashTable.Add
 006C5F8F    mov         ecx,50
 006C5F94    mov         edx,6C6DB0;'CaretWidth'
 006C5F99    mov         eax,dword ptr [ebx]
 006C5F9B    call        THashTable.Add
 006C5FA0    mov         ecx,51
 006C5FA5    mov         edx,6C6DD4;'DragFullWindows'
 006C5FAA    mov         eax,dword ptr [ebx]
 006C5FAC    call        THashTable.Add
 006C5FB1    mov         ecx,52
 006C5FB6    mov         edx,6C6E00;'ForegroundFlashCount'
 006C5FBB    mov         eax,dword ptr [ebx]
 006C5FBD    call        THashTable.Add
 006C5FC2    mov         ecx,53
 006C5FC7    mov         edx,6C6E38;'ForegroundLockTimeout'
 006C5FCC    mov         eax,dword ptr [ebx]
 006C5FCE    call        THashTable.Add
 006C5FD3    mov         ecx,54
 006C5FD8    mov         edx,6C6E70;'ShowImeUi'
 006C5FDD    mov         eax,dword ptr [ebx]
 006C5FDF    call        THashTable.Add
 006C5FE4    mov         ecx,55
 006C5FE9    mov         edx,6C6E90;'PlugAndPlayAvailable'
 006C5FEE    mov         eax,dword ptr [ebx]
 006C5FF0    call        THashTable.Add
 006C5FF5    mov         ecx,56
 006C5FFA    mov         edx,6C6EC8;'ManufactureDate'
 006C5FFF    mov         eax,dword ptr [ebx]
 006C6001    call        THashTable.Add
 006C6006    mov         ecx,57
 006C600B    mov         edx,6C6EF4;'EDIDVersion'
 006C6010    mov         eax,dword ptr [ebx]
 006C6012    call        THashTable.Add
 006C6017    mov         ecx,58
 006C601C    mov         edx,6C6F18;'EDIDRevision'
 006C6021    mov         eax,dword ptr [ebx]
 006C6023    call        THashTable.Add
 006C6028    mov         ecx,59
 006C602D    mov         edx,6C6F40;'PhysicalWidth'
 006C6032    mov         eax,dword ptr [ebx]
 006C6034    call        THashTable.Add
 006C6039    mov         ecx,5A
 006C603E    mov         edx,6C6F68;'PhysicalHeight'
 006C6043    mov         eax,dword ptr [ebx]
 006C6045    call        THashTable.Add
 006C604A    mov         ecx,5D
 006C604F    mov         edx,6C6F94;'VendorCode'
 006C6054    mov         eax,dword ptr [ebx]
 006C6056    call        THashTable.Add
 006C605B    mov         ecx,5E
 006C6060    mov         edx,6C6FB8;'ProductCode'
 006C6065    mov         eax,dword ptr [ebx]
 006C6067    call        THashTable.Add
 006C606C    mov         ecx,5B
 006C6071    mov         edx,6C6FDC;'VendorShortName'
 006C6076    mov         eax,dword ptr [ebx]
 006C6078    call        THashTable.Add
 006C607D    mov         ecx,5C
 006C6082    mov         edx,6C7008;'VendorLongName'
 006C6087    mov         eax,dword ptr [ebx]
 006C6089    call        THashTable.Add
 006C608E    mov         ecx,5F
 006C6093    mov         edx,6C7034;'SerialNumber'
 006C6098    mov         eax,dword ptr [ebx]
 006C609A    call        THashTable.Add
 006C609F    mov         ecx,60
 006C60A4    mov         edx,6C705C;'IsProjector'
 006C60A9    mov         eax,dword ptr [ebx]
 006C60AB    call        THashTable.Add
 006C60B0    mov         ecx,61
 006C60B5    mov         edx,6C7080;'ViewableSize'
 006C60BA    mov         eax,dword ptr [ebx]
 006C60BC    call        THashTable.Add
 006C60C1    mov         ecx,65
 006C60C6    mov         edx,6C70A8;'RefreshRate'
 006C60CB    mov         eax,dword ptr [ebx]
 006C60CD    call        THashTable.Add
 006C60D2    pop         ebx
 006C60D3    ret
*}
end;

//006C728C
{*procedure sub_006C728C(?:?; ?:?; ?:?; ?:?);
begin
 006C728C    push        ebp
 006C728D    mov         ebp,esp
 006C728F    add         esp,0FFFFFFEC
 006C7292    push        ebx
 006C7293    push        esi
 006C7294    push        edi
 006C7295    mov         edi,ecx
 006C7297    mov         esi,edx
 006C7299    mov         ebx,eax
 006C729B    push        0
 006C729D    push        0
 006C729F    push        0
 006C72A1    push        6C73AC;'DISPLAY'
 006C72A6    call        gdi32.CreateDCW
 006C72AB    mov         dword ptr [ebp-4],eax
 006C72AE    xor         eax,eax
 006C72B0    push        ebp
 006C72B1    push        6C739B
 006C72B6    push        dword ptr fs:[eax]
 006C72B9    mov         dword ptr fs:[eax],esp
 006C72BC    push        8
 006C72BE    mov         eax,dword ptr [ebp-4]
 006C72C1    push        eax
 006C72C2    call        gdi32.GetDeviceCaps
 006C72C7    mov         dword ptr [ebp-8],eax
 006C72CA    push        0A
 006C72CC    mov         eax,dword ptr [ebp-4]
 006C72CF    push        eax
 006C72D0    call        gdi32.GetDeviceCaps
 006C72D5    mov         ecx,eax
 006C72D7    xor         eax,eax
 006C72D9    mov         dword ptr [edi+4],eax
 006C72DC    mov         dword ptr [edi+0C],ecx
 006C72DF    mov         eax,dword ptr [ebp+8]
 006C72E2    xor         edx,edx
 006C72E4    mov         dword ptr [eax],edx
 006C72E6    mov         eax,dword ptr [ebp+8]
 006C72E9    mov         edx,dword ptr [ebp-8]
 006C72EC    mov         dword ptr [eax+8],edx
 006C72EF    test        ebx,ebx
>006C72F1    jge         006C730E
 006C72F3    mov         eax,ebx
 006C72F5    neg         eax
 006C72F7    mov         dword ptr [ebp-0C],eax
 006C72FA    xor         eax,eax
 006C72FC    mov         dword ptr [ebp-10],eax
 006C72FF    mov         eax,dword ptr [ebp-8]
 006C7302    add         eax,ebx
 006C7304    mov         dword ptr [edi],eax
 006C7306    mov         eax,dword ptr [ebp-8]
 006C7309    mov         dword ptr [edi+8],eax
>006C730C    jmp         006C731D
 006C730E    xor         eax,eax
 006C7310    mov         dword ptr [ebp-0C],eax
 006C7313    mov         dword ptr [ebp-10],ebx
 006C7316    xor         eax,eax
 006C7318    mov         dword ptr [edi],eax
 006C731A    mov         dword ptr [edi+8],ebx
 006C731D    test        esi,esi
>006C731F    jge         006C733B
 006C7321    mov         edi,esi
 006C7323    neg         edi
 006C7325    xor         eax,eax
 006C7327    mov         dword ptr [ebp-14],eax
 006C732A    lea         eax,[esi+ecx]
 006C732D    mov         edx,dword ptr [ebp+8]
 006C7330    mov         dword ptr [edx+4],eax
 006C7333    mov         eax,dword ptr [ebp+8]
 006C7336    mov         dword ptr [eax+0C],ecx
>006C7339    jmp         006C734E
 006C733B    xor         edi,edi
 006C733D    mov         dword ptr [ebp-14],esi
 006C7340    mov         eax,dword ptr [ebp+8]
 006C7343    xor         edx,edx
 006C7345    mov         dword ptr [eax+4],edx
 006C7348    mov         eax,dword ptr [ebp+8]
 006C734B    mov         dword ptr [eax+0C],esi
 006C734E    push        40CC0020
 006C7353    push        edi
 006C7354    mov         eax,dword ptr [ebp-0C]
 006C7357    push        eax
 006C7358    mov         eax,dword ptr [ebp-4]
 006C735B    push        eax
 006C735C    mov         eax,esi
 006C735E    cdq
 006C735F    xor         eax,edx
 006C7361    sub         eax,edx
 006C7363    sub         ecx,eax
 006C7365    push        ecx
 006C7366    mov         eax,ebx
 006C7368    cdq
 006C7369    xor         eax,edx
 006C736B    sub         eax,edx
 006C736D    mov         edx,dword ptr [ebp-8]
 006C7370    sub         edx,eax
 006C7372    push        edx
 006C7373    mov         eax,dword ptr [ebp-14]
 006C7376    push        eax
 006C7377    mov         eax,dword ptr [ebp-10]
 006C737A    push        eax
 006C737B    mov         eax,dword ptr [ebp-4]
 006C737E    push        eax
 006C737F    call        gdi32.BitBlt
 006C7384    xor         eax,eax
 006C7386    pop         edx
 006C7387    pop         ecx
 006C7388    pop         ecx
 006C7389    mov         dword ptr fs:[eax],edx
 006C738C    push        6C73A2
 006C7391    mov         eax,dword ptr [ebp-4]
 006C7394    push        eax
 006C7395    call        gdi32.DeleteDC
 006C739A    ret
>006C739B    jmp         @HandleFinally
>006C73A0    jmp         006C7391
 006C73A2    pop         edi
 006C73A3    pop         esi
 006C73A4    pop         ebx
 006C73A5    mov         esp,ebp
 006C73A7    pop         ebp
 006C73A8    ret         4
end;*}

//006C73BC
{*procedure sub_006C73BC(?:?; ?:?);
begin
 006C73BC    push        ebp
 006C73BD    mov         ebp,esp
 006C73BF    add         esp,0FFFFFFC8
 006C73C2    mov         dword ptr [ebp-8],edx
 006C73C5    mov         dword ptr [ebp-4],eax
 006C73C8    cmp         dword ptr [ebp-4],0
>006C73CC    jne         006C73F2
 006C73CE    cmp         dword ptr [ebp-8],0
>006C73D2    jne         006C73F2
 006C73D4    mov         eax,[0078CB88];^gvar_0078BDC0
 006C73D9    test        byte ptr [eax],7F
>006C73DC    jne         006C7577
 006C73E2    push        0FF
 006C73E4    push        0
 006C73E6    push        0
 006C73E8    call        user32.InvalidateRect
>006C73ED    jmp         006C7577
 006C73F2    lea         eax,[ebp-38]
 006C73F5    push        eax
 006C73F6    lea         ecx,[ebp-28]
 006C73F9    mov         edx,dword ptr [ebp-8]
 006C73FC    mov         eax,dword ptr [ebp-4]
 006C73FF    call        006C728C
 006C7404    lea         eax,[ebp-10]
 006C7407    push        eax
 006C7408    call        user32.GetCursorPos
 006C740D    mov         eax,dword ptr [ebp-8]
 006C7410    sar         eax,1
>006C7412    jns         006C7417
 006C7414    adc         eax,0
 006C7417    add         eax,dword ptr [ebp-0C]
 006C741A    push        eax
 006C741B    mov         eax,dword ptr [ebp-4]
 006C741E    sar         eax,1
>006C7420    jns         006C7425
 006C7422    adc         eax,0
 006C7425    add         eax,dword ptr [ebp-10]
 006C7428    push        eax
 006C7429    call        user32.SetCursorPos
 006C742E    mov         eax,dword ptr [ebp-4]
 006C7431    mov         dword ptr [ebp-18],eax
 006C7434    mov         eax,dword ptr [ebp-8]
 006C7437    mov         dword ptr [ebp-14],eax
 006C743A    xor         eax,eax
 006C743C    push        ebp
 006C743D    push        6C7464
 006C7442    push        dword ptr fs:[eax]
 006C7445    mov         dword ptr fs:[eax],esp
 006C7448    lea         eax,[ebp-18]
 006C744B    push        eax
 006C744C    push        6C70C0
 006C7451    call        user32.EnumWindows
 006C7456    xor         eax,eax
 006C7458    pop         edx
 006C7459    pop         ecx
 006C745A    pop         ecx
 006C745B    mov         dword ptr fs:[eax],edx
 006C745E    push        6C746B
 006C7463    ret
>006C7464    jmp         @HandleFinally
>006C7469    jmp         006C7463
 006C746B    mov         eax,dword ptr [ebp-0C]
 006C746E    add         eax,dword ptr [ebp-8]
 006C7471    push        eax
 006C7472    mov         eax,dword ptr [ebp-10]
 006C7475    add         eax,dword ptr [ebp-4]
 006C7478    push        eax
 006C7479    call        user32.SetCursorPos
 006C747E    mov         eax,[0078CB88];^gvar_0078BDC0
 006C7483    test        byte ptr [eax],7F
>006C7486    je          006C755A
 006C748C    mov         edx,dword ptr [ebp-28]
 006C748F    sub         edx,2
 006C7492    mov         eax,[0078CBA4];^gvar_0081F5B8:TInvForm
 006C7497    mov         eax,dword ptr [eax]
 006C7499    call        TCustomForm.SetLeft
 006C749E    mov         edx,dword ptr [ebp-20]
 006C74A1    sub         edx,dword ptr [ebp-28]
 006C74A4    add         edx,4
 006C74A7    mov         eax,[0078CBA4];^gvar_0081F5B8:TInvForm
 006C74AC    mov         eax,dword ptr [eax]
 006C74AE    call        TControl.SetWidth
 006C74B3    mov         edx,dword ptr [ebp-24]
 006C74B6    sub         edx,2
 006C74B9    mov         eax,[0078CBA4];^gvar_0081F5B8:TInvForm
 006C74BE    mov         eax,dword ptr [eax]
 006C74C0    call        TCustomForm.SetTop
 006C74C5    mov         edx,dword ptr [ebp-1C]
 006C74C8    sub         edx,dword ptr [ebp-24]
 006C74CB    add         edx,4
 006C74CE    mov         eax,[0078CBA4];^gvar_0081F5B8:TInvForm
 006C74D3    mov         eax,dword ptr [eax]
 006C74D5    call        TControl.SetHeight
 006C74DA    mov         eax,[0078CBA4];^gvar_0081F5B8:TInvForm
 006C74DF    mov         eax,dword ptr [eax]
 006C74E1    call        TCustomForm.Show
 006C74E6    mov         eax,[0078CBA4];^gvar_0081F5B8:TInvForm
 006C74EB    mov         eax,dword ptr [eax]
 006C74ED    call        TCustomForm.Hide
 006C74F2    mov         edx,dword ptr [ebp-38]
 006C74F5    sub         edx,2
 006C74F8    mov         eax,[0078CBA4];^gvar_0081F5B8:TInvForm
 006C74FD    mov         eax,dword ptr [eax]
 006C74FF    call        TCustomForm.SetLeft
 006C7504    mov         edx,dword ptr [ebp-30]
 006C7507    sub         edx,dword ptr [ebp-38]
 006C750A    add         edx,4
 006C750D    mov         eax,[0078CBA4];^gvar_0081F5B8:TInvForm
 006C7512    mov         eax,dword ptr [eax]
 006C7514    call        TControl.SetWidth
 006C7519    mov         edx,dword ptr [ebp-34]
 006C751C    sub         edx,2
 006C751F    mov         eax,[0078CBA4];^gvar_0081F5B8:TInvForm
 006C7524    mov         eax,dword ptr [eax]
 006C7526    call        TCustomForm.SetTop
 006C752B    mov         edx,dword ptr [ebp-2C]
 006C752E    sub         edx,dword ptr [ebp-34]
 006C7531    add         edx,4
 006C7534    mov         eax,[0078CBA4];^gvar_0081F5B8:TInvForm
 006C7539    mov         eax,dword ptr [eax]
 006C753B    call        TControl.SetHeight
 006C7540    mov         eax,[0078CBA4];^gvar_0081F5B8:TInvForm
 006C7545    mov         eax,dword ptr [eax]
 006C7547    call        TCustomForm.Show
 006C754C    mov         eax,[0078CBA4];^gvar_0081F5B8:TInvForm
 006C7551    mov         eax,dword ptr [eax]
 006C7553    call        TCustomForm.Hide
>006C7558    jmp         006C7565
 006C755A    push        0FF
 006C755C    push        0
 006C755E    push        0
 006C7560    call        user32.InvalidateRect
 006C7565    mov         eax,dword ptr [ebp-4]
 006C7568    add         dword ptr ds:[81F690],eax;gvar_0081F690:Single
 006C756E    mov         eax,dword ptr [ebp-8]
 006C7571    add         dword ptr ds:[81F694],eax;gvar_0081F694:Single
 006C7577    mov         esp,ebp
 006C7579    pop         ebp
 006C757A    ret
end;*}

//006C757C
procedure sub_006C757C;
begin
{*
 006C757C    push        esi
 006C757D    push        edi
 006C757E    add         esp,0FFFFFF54
 006C7584    lea         eax,[esp+10]
 006C7588    xor         ecx,ecx
 006C758A    mov         edx,9C
 006C758F    call        @FillChar
 006C7594    mov         word ptr [esp+34],9C
 006C759B    xor         eax,eax
 006C759D    mov         [0081F660],eax;gvar_0081F660:Single
 006C75A2    lea         eax,[esp+10]
 006C75A6    push        eax
 006C75A7    push        0FF
 006C75A9    push        0
 006C75AB    call        user32.EnumDisplaySettingsA
 006C75B0    test        eax,eax
>006C75B2    je          006C75E6
 006C75B4    test        byte ptr [esp+44],1
>006C75B9    je          006C75D4
 006C75BB    mov         eax,dword ptr [esp+80]
 006C75C2    mov         dword ptr [esp+7C],eax
 006C75C6    mov         eax,dword ptr [esp+0A4]
 006C75CD    mov         dword ptr [esp+80],eax
 006C75D4    lea         esi,[esp+10]
 006C75D8    mov         edi,81F5C4;gvar_0081F5C4:Pointer
 006C75DD    mov         ecx,27
 006C75E2    rep movs    dword ptr [edi],dword ptr [esi]
>006C75E4    jmp         006C75F7
 006C75E6    mov         eax,81F5C4;gvar_0081F5C4:Pointer
 006C75EB    mov         ecx,9C
 006C75F0    xor         edx,edx
 006C75F2    call        @FillChar
 006C75F7    cmp         byte ptr ds:[81F6A8],0;gvar_0081F6A8
>006C75FE    je          006C765C
 006C7600    push        0
 006C7602    push        6C7668;'Shell_TrayWnd'
 006C7607    call        user32.FindWindowW
 006C760C    mov         [0081F6AC],eax;gvar_0081F6AC:HWND
 006C7611    push        0
 006C7613    push        6C7684;'Progman'
 006C7618    call        user32.FindWindowW
 006C761D    mov         [0081F6B0],eax;gvar_0081F6B0:HWND
 006C7622    push        esp
 006C7623    mov         eax,[0081F6AC];gvar_0081F6AC:HWND
 006C7628    push        eax
 006C7629    call        user32.GetWindowRect
 006C762E    mov         eax,dword ptr [esp]
 006C7631    mov         [0081F6B4],eax;gvar_0081F6B4
 006C7636    mov         eax,dword ptr [esp+4]
 006C763A    mov         [0081F6B8],eax;gvar_0081F6B8
 006C763F    push        esp
 006C7640    mov         eax,[0081F6B0];gvar_0081F6B0:HWND
 006C7645    push        eax
 006C7646    call        user32.GetWindowRect
 006C764B    mov         eax,dword ptr [esp]
 006C764E    mov         [0081F6BC],eax;gvar_0081F6BC
 006C7653    mov         eax,dword ptr [esp+4]
 006C7657    mov         [0081F6C0],eax;gvar_0081F6C0
 006C765C    add         esp,0AC
 006C7662    pop         edi
 006C7663    pop         esi
 006C7664    ret
*}
end;

//006C7694
procedure sub_006C7694;
begin
{*
 006C7694    cmp         byte ptr ds:[81F6A8],0;gvar_0081F6A8
>006C769B    je          006C771B
 006C769D    xor         edx,edx
 006C769F    sub         edx,dword ptr ds:[81F694];gvar_0081F694:Single
 006C76A5    xor         eax,eax
 006C76A7    sub         eax,dword ptr ds:[81F690];gvar_0081F690:Single
 006C76AD    call        006C73BC
 006C76B2    xor         eax,eax
 006C76B4    mov         [0081F690],eax;gvar_0081F690:Single
 006C76B9    xor         eax,eax
 006C76BB    mov         [0081F694],eax;gvar_0081F694:Single
 006C76C0    push        0
 006C76C2    push        6C71D4
 006C76C7    call        user32.EnumWindows
 006C76CC    push        4715
 006C76D1    push        0
 006C76D3    push        0
 006C76D5    mov         eax,[0081F6B8];gvar_0081F6B8
 006C76DA    push        eax
 006C76DB    mov         eax,[0081F6B4];gvar_0081F6B4
 006C76E0    push        eax
 006C76E1    push        0
 006C76E3    mov         eax,[0081F6AC];gvar_0081F6AC:HWND
 006C76E8    push        eax
 006C76E9    call        user32.SetWindowPos
 006C76EE    push        4715
 006C76F3    push        0
 006C76F5    push        0
 006C76F7    mov         eax,[0081F6C0];gvar_0081F6C0
 006C76FC    push        eax
 006C76FD    mov         eax,[0081F6BC];gvar_0081F6BC
 006C7702    push        eax
 006C7703    push        0
 006C7705    mov         eax,[0081F6B0];gvar_0081F6B0:HWND
 006C770A    push        eax
 006C770B    call        user32.SetWindowPos
 006C7710    push        0FF
 006C7712    push        0
 006C7714    push        0
 006C7716    call        user32.InvalidateRect
 006C771B    ret
*}
end;

//006C771C
{*function sub_006C771C:?;
begin
 006C771C    push        ebx
 006C771D    mov         bl,1
 006C771F    cmp         byte ptr ds:[81F6A8],0;gvar_0081F6A8
>006C7726    je          006C7751
 006C7728    fild        dword ptr ds:[81F694];gvar_0081F694:Single
 006C772E    fsubr       qword ptr ds:[81F6A0];gvar_0081F6A0:Double
 006C7734    call        @ROUND
 006C7739    push        eax
 006C773A    fild        dword ptr ds:[81F690];gvar_0081F690:Single
 006C7740    fsubr       qword ptr ds:[81F698];gvar_0081F698:Double
 006C7746    call        @ROUND
 006C774B    pop         edx
 006C774C    call        006C73BC
 006C7751    mov         eax,ebx
 006C7753    pop         ebx
 006C7754    ret
end;*}

//006C7758
{*function sub_006C7758(?:UnicodeString):?;
begin
 006C7758    push        ebp
 006C7759    mov         ebp,esp
 006C775B    push        ecx
 006C775C    push        ebx
 006C775D    mov         dword ptr [ebp-4],eax
 006C7760    mov         eax,dword ptr [ebp-4]
 006C7763    call        @UStrAddRef
 006C7768    xor         eax,eax
 006C776A    push        ebp
 006C776B    push        6C779B
 006C7770    push        dword ptr fs:[eax]
 006C7773    mov         dword ptr fs:[eax],esp
 006C7776    mov         edx,dword ptr [ebp-4]
 006C7779    mov         eax,[0081F668];gvar_0081F668:THashTable
 006C777E    call        THashTable.Get
 006C7783    mov         ebx,eax
 006C7785    xor         eax,eax
 006C7787    pop         edx
 006C7788    pop         ecx
 006C7789    pop         ecx
 006C778A    mov         dword ptr fs:[eax],edx
 006C778D    push        6C77A2
 006C7792    lea         eax,[ebp-4]
 006C7795    call        @UStrClr
 006C779A    ret
>006C779B    jmp         @HandleFinally
>006C77A0    jmp         006C7792
 006C77A2    mov         eax,ebx
 006C77A4    pop         ebx
 006C77A5    pop         ecx
 006C77A6    pop         ebp
 006C77A7    ret
end;*}

//006C77A8
{*procedure sub_006C77A8(?:Integer; ?:?);
begin
 006C77A8    push        ebx
 006C77A9    push        esi
 006C77AA    mov         esi,edx
 006C77AC    mov         ebx,eax
 006C77AE    mov         ecx,esi
 006C77B0    mov         edx,ebx
 006C77B2    mov         eax,[0081F668];gvar_0081F668:THashTable
 006C77B7    call        THashTable.Get
 006C77BC    pop         esi
 006C77BD    pop         ebx
 006C77BE    ret
end;*}

//006C77C0
{*function sub_006C77C0:?;
begin
 006C77C0    push        ebp
 006C77C1    mov         ebp,esp
 006C77C3    push        0
 006C77C5    push        ebx
 006C77C6    push        esi
 006C77C7    xor         eax,eax
 006C77C9    push        ebp
 006C77CA    push        6C7827
 006C77CF    push        dword ptr fs:[eax]
 006C77D2    mov         dword ptr fs:[eax],esp
 006C77D5    mov         dl,1
 006C77D7    mov         eax,[0043C7BC];TStringList
 006C77DC    call        TStringList.Create;TStringList.Create
 006C77E1    mov         esi,eax
 006C77E3    mov         dl,1
 006C77E5    mov         eax,esi
 006C77E7    call        TStringList.SetSorted
 006C77EC    xor         ebx,ebx
 006C77EE    lea         edx,[ebp-4]
 006C77F1    mov         eax,ebx
 006C77F3    call        006C77A8
 006C77F8    cmp         dword ptr [ebp-4],0
>006C77FC    je          006C7808
 006C77FE    mov         edx,dword ptr [ebp-4]
 006C7801    mov         eax,esi
 006C7803    mov         ecx,dword ptr [eax]
 006C7805    call        dword ptr [ecx+38];TStringList.Add
 006C7808    inc         ebx
 006C7809    cmp         ebx,10F
>006C780F    jne         006C77EE
 006C7811    xor         eax,eax
 006C7813    pop         edx
 006C7814    pop         ecx
 006C7815    pop         ecx
 006C7816    mov         dword ptr fs:[eax],edx
 006C7819    push        6C782E
 006C781E    lea         eax,[ebp-4]
 006C7821    call        @UStrClr
 006C7826    ret
>006C7827    jmp         @HandleFinally
>006C782C    jmp         006C781E
 006C782E    mov         eax,esi
 006C7830    pop         esi
 006C7831    pop         ebx
 006C7832    pop         ecx
 006C7833    pop         ebp
 006C7834    ret
end;*}

//006C7838
{*function sub_006C7838(?:?):?;
begin
 006C7838    push        ebp
 006C7839    mov         ebp,esp
 006C783B    push        ecx
 006C783C    push        ebx
 006C783D    mov         dword ptr [ebp-4],eax
 006C7840    mov         eax,dword ptr [ebp-4]
 006C7843    call        @UStrAddRef
 006C7848    xor         eax,eax
 006C784A    push        ebp
 006C784B    push        6C78AB
 006C7850    push        dword ptr fs:[eax]
 006C7853    mov         dword ptr fs:[eax],esp
 006C7856    xor         ebx,ebx
 006C7858    lea         eax,[ebp-4]
 006C785B    mov         edx,6C78C4;'screens'
 006C7860    call        004F9BD0
 006C7865    test        al,al
>006C7867    jne         006C787A
 006C7869    lea         eax,[ebp-4]
 006C786C    mov         edx,6C78E0;'screen'
 006C7871    call        004F9BD0
 006C7876    test        al,al
>006C7878    je          006C7895
 006C787A    lea         eax,[ebp-4]
 006C787D    call        004F9D00
 006C7882    lea         eax,[ebp-4]
 006C7885    mov         edx,6C78FC;'.'
 006C788A    call        004F9BD0
 006C788F    test        al,al
>006C7891    je          006C7895
 006C7893    mov         bl,1
 006C7895    xor         eax,eax
 006C7897    pop         edx
 006C7898    pop         ecx
 006C7899    pop         ecx
 006C789A    mov         dword ptr fs:[eax],edx
 006C789D    push        6C78B2
 006C78A2    lea         eax,[ebp-4]
 006C78A5    call        @UStrClr
 006C78AA    ret
>006C78AB    jmp         @HandleFinally
>006C78B0    jmp         006C78A2
 006C78B2    mov         eax,ebx
 006C78B4    pop         ebx
 006C78B5    pop         ecx
 006C78B6    pop         ebp
 006C78B7    ret
end;*}

//006C7900
{*function sub_006C7900(?:?):?;
begin
 006C7900    push        ebp
 006C7901    mov         ebp,esp
 006C7903    add         esp,0FFFFFFF8
 006C7906    push        ebx
 006C7907    push        esi
 006C7908    push        edi
 006C7909    xor         edx,edx
 006C790B    mov         dword ptr [ebp-8],edx
 006C790E    mov         dword ptr [ebp-4],eax
 006C7911    mov         eax,dword ptr [ebp-4]
 006C7914    call        @UStrAddRef
 006C7919    xor         eax,eax
 006C791B    push        ebp
 006C791C    push        6C7A2D
 006C7921    push        dword ptr fs:[eax]
 006C7924    mov         dword ptr fs:[eax],esp
 006C7927    xor         esi,esi
 006C7929    lea         eax,[ebp-8]
 006C792C    mov         edx,dword ptr [ebp-4]
 006C792F    call        @UStrLAsg
 006C7934    lea         eax,[ebp-8]
 006C7937    mov         edx,6C7A4C;'screens'
 006C793C    call        004F9BD0
 006C7941    test        al,al
>006C7943    jne         006C795A
 006C7945    lea         eax,[ebp-8]
 006C7948    mov         edx,6C7A68;'screen'
 006C794D    call        004F9BD0
 006C7952    test        al,al
>006C7954    je          006C7A12
 006C795A    lea         eax,[ebp-8]
 006C795D    call        004F9D00
 006C7962    mov         ebx,eax
 006C7964    lea         eax,[ebp-8]
 006C7967    mov         edx,6C7A84;'.'
 006C796C    call        004F9BD0
 006C7971    test        al,al
>006C7973    je          006C7A12
 006C7979    lea         eax,[ebp-8]
 006C797C    mov         edx,6C7A94;'tv.'
 006C7981    call        004F9BD0
 006C7986    test        al,al
>006C7988    jne         006C799B
 006C798A    lea         eax,[ebp-8]
 006C798D    mov         edx,6C7AA8;'secondary.'
 006C7992    call        004F9BD0
 006C7997    test        al,al
>006C7999    je          006C79A2
 006C799B    mov         ebx,2
>006C79A0    jmp         006C79DB
 006C79A2    lea         eax,[ebp-8]
 006C79A5    mov         edx,6C7ACC;'primary.'
 006C79AA    call        004F9BD0
 006C79AF    test        al,al
>006C79B1    je          006C79BA
 006C79B3    mov         ebx,1
>006C79B8    jmp         006C79DB
 006C79BA    lea         eax,[ebp-8]
 006C79BD    mov         edx,6C7AEC;'piescreen.'
 006C79C2    call        004F9BD0
 006C79C7    test        al,al
>006C79C9    je          006C79DB
 006C79CB    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 006C79D0    mov         eax,dword ptr [eax]
 006C79D2    call        TCustomForm.GetMonitor
 006C79D7    mov         ebx,dword ptr [eax+8];TMonitor.FMonitorNum:Integer
 006C79DA    inc         ebx
 006C79DB    mov         eax,dword ptr [ebp-8]
 006C79DE    call        006C7758
 006C79E3    mov         edi,eax
 006C79E5    test        edi,edi
>006C79E7    jl          006C7A12
 006C79E9    mov         dl,1
 006C79EB    mov         eax,[006C5610];TScreenValue
 006C79F0    call        TObject.Create;TScreenValue.Create
 006C79F5    mov         esi,eax
 006C79F7    mov         dword ptr [esi+20],edi;TScreenValue......................Item:Integer
 006C79FA    test        ebx,ebx
>006C79FC    jg          006C7A00
 006C79FE    xor         ebx,ebx
 006C7A00    mov         dword ptr [esi+18],ebx;TScreenValue........................................................
 006C7A03    add         edi,0FFFFFF9E
 006C7A06    sub         edi,2
>006C7A09    jae         006C7A12
 006C7A0B    mov         byte ptr ds:[81F6A8],1;gvar_0081F6A8
 006C7A12    xor         eax,eax
 006C7A14    pop         edx
 006C7A15    pop         ecx
 006C7A16    pop         ecx
 006C7A17    mov         dword ptr fs:[eax],edx
 006C7A1A    push        6C7A34
 006C7A1F    lea         eax,[ebp-8]
 006C7A22    mov         edx,2
 006C7A27    call        @UStrArrayClr
 006C7A2C    ret
>006C7A2D    jmp         @HandleFinally
>006C7A32    jmp         006C7A1F
 006C7A34    mov         eax,esi
 006C7A36    pop         edi
 006C7A37    pop         esi
 006C7A38    pop         ebx
 006C7A39    pop         ecx
 006C7A3A    pop         ecx
 006C7A3B    pop         ebp
 006C7A3C    ret
end;*}

//006C7B04
function TScreenValue.CanSet:Boolean;
begin
{*
 006C7B04    mov         eax,dword ptr [eax+20];TScreenValue.......................Item:Integer
 006C7B07    add         eax,0FFFFFF9E
 006C7B0A    sub         eax,2
>006C7B0D    jae         006C7B12
 006C7B0F    mov         al,1
 006C7B11    ret
 006C7B12    xor         eax,eax
 006C7B14    ret
*}
end;

//006C7B18
procedure TScreenValue.CreateClone;
begin
{*
 006C7B18    mov         dl,1
 006C7B1A    mov         eax,[006C5610];TScreenValue
 006C7B1F    call        TObject.Create;TScreenValue.Create
 006C7B24    ret
*}
end;

//006C7B28
procedure TScreenValue.FillClone(c:TExpression);
begin
{*
 006C7B28    push        ebx
 006C7B29    push        esi
 006C7B2A    mov         esi,edx
 006C7B2C    mov         ebx,eax
 006C7B2E    mov         edx,esi
 006C7B30    mov         eax,ebx
 006C7B32    call        TExpression.FillClone
 006C7B37    mov         eax,esi
 006C7B39    mov         edx,dword ptr [ebx+20];TScreenValue........................Item:Integer
 006C7B3C    mov         dword ptr [eax+20],edx
 006C7B3F    mov         edx,dword ptr [ebx+18];TScreenValue........................................................
 006C7B42    mov         dword ptr [eax+18],edx
 006C7B45    pop         esi
 006C7B46    pop         ebx
 006C7B47    ret
*}
end;

//006C7B48
{*function sub_006C7B48(?:?):?;
begin
 006C7B48    push        ebx
 006C7B49    add         esp,0FFFFFFF4
 006C7B4C    mov         ebx,eax
 006C7B4E    push        0
 006C7B50    lea         eax,[esp+0C]
 006C7B54    push        eax
 006C7B55    push        0
 006C7B57    push        ebx
 006C7B58    call        user32.SystemParametersInfoW
 006C7B5D    test        eax,eax
>006C7B5F    je          006C7B74
 006C7B61    cmp         dword ptr [esp+8],1
 006C7B66    sbb         eax,eax
 006C7B68    inc         eax
 006C7B69    call        00686074
 006C7B6E    fstp        qword ptr [esp]
 006C7B71    wait
>006C7B72    jmp         006C7B7F
 006C7B74    xor         eax,eax
 006C7B76    call        00686074
 006C7B7B    fstp        qword ptr [esp]
 006C7B7E    wait
 006C7B7F    fld         qword ptr [esp]
 006C7B82    add         esp,0C
 006C7B85    pop         ebx
 006C7B86    ret
end;*}

//006C7B88
{*function sub_006C7B88(?:?; ?:?):?;
begin
 006C7B88    push        ebx
 006C7B89    push        esi
 006C7B8A    add         esp,0FFFFFFF0
 006C7B8D    mov         esi,edx
 006C7B8F    mov         ebx,eax
 006C7B91    push        0
 006C7B93    lea         eax,[esp+0C]
 006C7B97    push        eax
 006C7B98    push        0
 006C7B9A    push        ebx
 006C7B9B    call        user32.SystemParametersInfoW
 006C7BA0    test        eax,eax
>006C7BA2    je          006C7BAE
 006C7BA4    fild        dword ptr [esp+8]
 006C7BA8    fstp        qword ptr [esp]
 006C7BAB    wait
>006C7BAC    jmp         006C7BBA
 006C7BAE    mov         dword ptr [esp+0C],esi
 006C7BB2    fild        dword ptr [esp+0C]
 006C7BB6    fstp        qword ptr [esp]
 006C7BB9    wait
 006C7BBA    fld         qword ptr [esp]
 006C7BBD    add         esp,10
 006C7BC0    pop         esi
 006C7BC1    pop         ebx
 006C7BC2    ret
end;*}

//006C7BC4
function TScreenValue.GetDataType:TDataType;
begin
{*
 006C7BC4    mov         eax,dword ptr [eax+20];TScreenValue.........................Item:Integer
 006C7BC7    cmp         eax,64
>006C7BCA    ja          006C7D04
 006C7BD0    movzx       eax,byte ptr [eax+6C7BDE]
 006C7BD7    jmp         dword ptr [eax*4+6C7C43]
 006C7BD7    db          0
 006C7BD7    db          1
 006C7BD7    db          1
 006C7BD7    db          2
 006C7BD7    db          2
 006C7BD7    db          4
 006C7BD7    db          5
 006C7BD7    db          4
 006C7BD7    db          5
 006C7BD7    db          4
 006C7BD7    db          5
 006C7BD7    db          6
 006C7BD7    db          2
 006C7BD7    db          2
 006C7BD7    db          2
 006C7BD7    db          2
 006C7BD7    db          2
 006C7BD7    db          2
 006C7BD7    db          7
 006C7BD7    db          7
 006C7BD7    db          8
 006C7BD7    db          8
 006C7BD7    db          8
 006C7BD7    db          10
 006C7BD7    db          10
 006C7BD7    db          8
 006C7BD7    db          8
 006C7BD7    db          4
 006C7BD7    db          8
 006C7BD7    db          8
 006C7BD7    db          8
 006C7BD7    db          10
 006C7BD7    db          10
 006C7BD7    db          4
 006C7BD7    db          11
 006C7BD7    db          11
 006C7BD7    db          11
 006C7BD7    db          11
 006C7BD7    db          11
 006C7BD7    db          11
 006C7BD7    db          16
 006C7BD7    db          12
 006C7BD7    db          12
 006C7BD7    db          12
 006C7BD7    db          12
 006C7BD7    db          12
 006C7BD7    db          12
 006C7BD7    db          13
 006C7BD7    db          13
 006C7BD7    db          13
 006C7BD7    db          15
 006C7BD7    db          15
 006C7BD7    db          14
 006C7BD7    db          4
 006C7BD7    db          8
 006C7BD7    db          5
 006C7BD7    db          5
 006C7BD7    db          8
 006C7BD7    db          8
 006C7BD7    db          9
 006C7BD7    db          17
 006C7BD7    db          17
 006C7BD7    db          18
 006C7BD7    db          17
 006C7BD7    db          18
 006C7BD7    db          17
 006C7BD7    db          19
 006C7BD7    db          19
 006C7BD7    db          19
 006C7BD7    db          19
 006C7BD7    db          19
 006C7BD7    db          19
 006C7BD7    db          19
 006C7BD7    db          19
 006C7BD7    db          19
 006C7BD7    db          21
 006C7BD7    db          19
 006C7BD7    db          19
 006C7BD7    db          20
 006C7BD7    db          21
 006C7BD7    db          21
 006C7BD7    db          19
 006C7BD7    db          21
 006C7BD7    db          20
 006C7BD7    db          19
 006C7BD7    db          22
 006C7BD7    db          23
 006C7BD7    db          24
 006C7BD7    db          24
 006C7BD7    db          25
 006C7BD7    db          25
 006C7BD7    db          26
 006C7BD7    db          26
 006C7BD7    db          27
 006C7BD7    db          27
 006C7BD7    db          24
 006C7BD7    db          22
 006C7BD7    db          25
 006C7BD7    db          0
 006C7BD7    db          0
 006C7BD7    db          3
 006C7BD7    dd          006C7D04
 006C7BD7    dd          006C7CB3
 006C7BD7    dd          006C7CB6
 006C7BD7    dd          006C7CB9
 006C7BD7    dd          006C7CBC
 006C7BD7    dd          006C7CBF
 006C7BD7    dd          006C7CC2
 006C7BD7    dd          006C7CC5
 006C7BD7    dd          006C7CC8
 006C7BD7    dd          006C7CCB
 006C7BD7    dd          006C7CCE
 006C7BD7    dd          006C7CD1
 006C7BD7    dd          006C7CD4
 006C7BD7    dd          006C7CD7
 006C7BD7    dd          006C7CDA
 006C7BD7    dd          006C7CDD
 006C7BD7    dd          006C7CE0
 006C7BD7    dd          006C7CE3
 006C7BD7    dd          006C7CE6
 006C7BD7    dd          006C7CE9
 006C7BD7    dd          006C7CEC
 006C7BD7    dd          006C7CEF
 006C7BD7    dd          006C7CF2
 006C7BD7    dd          006C7CF5
 006C7BD7    dd          006C7CF8
 006C7BD7    dd          006C7CFB
 006C7BD7    dd          006C7CFE
 006C7BD7    dd          006C7D01
 006C7CB3    mov         al,2
 006C7CB5    ret
 006C7CB6    mov         al,2
 006C7CB8    ret
 006C7CB9    mov         al,2
 006C7CBB    ret
 006C7CBC    mov         al,4
 006C7CBE    ret
 006C7CBF    mov         al,2
 006C7CC1    ret
 006C7CC2    xor         eax,eax
 006C7CC4    ret
 006C7CC5    xor         eax,eax
 006C7CC7    ret
 006C7CC8    mov         al,3
 006C7CCA    ret
 006C7CCB    mov         al,2
 006C7CCD    ret
 006C7CCE    mov         al,2
 006C7CD0    ret
 006C7CD1    mov         al,2
 006C7CD3    ret
 006C7CD4    mov         al,2
 006C7CD6    ret
 006C7CD7    mov         al,3
 006C7CD9    ret
 006C7CDA    mov         al,2
 006C7CDC    ret
 006C7CDD    xor         eax,eax
 006C7CDF    ret
 006C7CE0    mov         al,2
 006C7CE2    ret
 006C7CE3    mov         al,3
 006C7CE5    ret
 006C7CE6    xor         eax,eax
 006C7CE8    ret
 006C7CE9    mov         al,3
 006C7CEB    ret
 006C7CEC    xor         eax,eax
 006C7CEE    ret
 006C7CEF    mov         al,2
 006C7CF1    ret
 006C7CF2    mov         al,3
 006C7CF4    ret
 006C7CF5    xor         eax,eax
 006C7CF7    ret
 006C7CF8    mov         al,2
 006C7CFA    ret
 006C7CFB    xor         eax,eax
 006C7CFD    ret
 006C7CFE    mov         al,4
 006C7D00    ret
 006C7D01    mov         al,4
 006C7D03    ret
 006C7D04    xor         eax,eax
 006C7D06    ret
*}
end;

//006C7D08
function TScreenValue.GetPerUnits1:TUnits;
begin
{*
 006C7D08    mov         eax,dword ptr [eax+20];TScreenValue..........................Item:Integer
 006C7D0B    sub         eax,65
>006C7D0E    jne         006C7D13
 006C7D10    mov         al,11
 006C7D12    ret
 006C7D13    xor         eax,eax
 006C7D15    ret
*}
end;

//006C7D18
function TScreenValue.GetPerUnits2:TUnits;
begin
{*
 006C7D18    xor         eax,eax
 006C7D1A    ret
*}
end;

//006C7D1C
{*procedure TScreenValue.GetString(?:?);
begin
 006C7D1C    push        ebp
 006C7D1D    mov         ebp,esp
 006C7D1F    add         esp,0FFFFFCDC
 006C7D25    push        ebx
 006C7D26    push        esi
 006C7D27    push        edi
 006C7D28    xor         ecx,ecx
 006C7D2A    mov         dword ptr [ebp-324],ecx
 006C7D30    mov         dword ptr [ebp-4],ecx
 006C7D33    mov         dword ptr [ebp-8],edx
 006C7D36    mov         ebx,eax
 006C7D38    xor         eax,eax
 006C7D3A    push        ebp
 006C7D3B    push        6C7FFB
 006C7D40    push        dword ptr fs:[eax]
 006C7D43    mov         dword ptr fs:[eax],esp
 006C7D46    mov         eax,dword ptr [ebx+20];TScreenValue...........................Item:Integer
 006C7D49    cmp         eax,35
>006C7D4C    jg          006C7D85
>006C7D4E    je          006C7E30
 006C7D54    cmp         eax,9
>006C7D57    jg          006C7D76
>006C7D59    je          006C7F47
 006C7D5F    sub         eax,5
>006C7D62    je          006C7F16
 006C7D68    sub         eax,2
>006C7D6B    je          006C7F2D
>006C7D71    jmp         006C7FD0
 006C7D76    sub         eax,1B
>006C7D79    je          006C7DBC
 006C7D7B    sub         eax,6
>006C7D7E    je          006C7DFA
>006C7D80    jmp         006C7FD0
 006C7D85    add         eax,0FFFFFFAA
 006C7D88    cmp         eax,8
>006C7D8B    ja          006C7FD0
 006C7D91    jmp         dword ptr [eax*4+6C7D98]
 006C7D91    dd          006C7F5E
 006C7D91    dd          006C7FD0
 006C7D91    dd          006C7FD0
 006C7D91    dd          006C7FD0
 006C7D91    dd          006C7FD0
 006C7D91    dd          006C7F90
 006C7D91    dd          006C7FA0
 006C7D91    dd          006C7FB0
 006C7D91    dd          006C7FC0
 006C7DBC    push        0
 006C7DBE    lea         eax,[ebp-320]
 006C7DC4    push        eax
 006C7DC5    push        0FA
 006C7DCA    push        73
 006C7DCC    call        user32.SystemParametersInfoW
 006C7DD1    test        eax,eax
>006C7DD3    je          006C7DED
 006C7DD5    mov         eax,dword ptr [ebp-8]
 006C7DD8    lea         edx,[ebp-320]
 006C7DDE    mov         ecx,100
 006C7DE3    call        @UStrFromWArray
>006C7DE8    jmp         006C7FDA
 006C7DED    mov         eax,dword ptr [ebp-8]
 006C7DF0    call        @UStrClr
>006C7DF5    jmp         006C7FDA
 006C7DFA    mov         dword ptr [ebp-0B8],0A8
 006C7E04    push        0
 006C7E06    lea         eax,[ebp-0B8]
 006C7E0C    push        eax
 006C7E0D    mov         eax,dword ptr [ebx+18];TScreenValue........................................................
 006C7E10    push        eax
 006C7E11    push        0
 006C7E13    call        user32.EnumDisplayDevicesA
 006C7E18    mov         eax,dword ptr [ebp-8]
 006C7E1B    lea         edx,[ebp-94]
 006C7E21    mov         ecx,80
 006C7E26    call        @UStrFromArray
>006C7E2B    jmp         006C7FDA
 006C7E30    mov         dword ptr [ebp-120],64
 006C7E3A    mov         esi,dword ptr [ebx+18];TScreenValue........................................................
 006C7E3D    test        esi,esi
>006C7E3F    jge         006C7E54
 006C7E41    mov         eax,[0078DB00];^Screen:TScreen
 006C7E46    mov         eax,dword ptr [eax]
 006C7E48    xor         edx,edx
 006C7E4A    call        TScreen.GetMonitor
 006C7E4F    mov         esi,dword ptr [eax+4];TMonitor.FHandle:HMONITOR
>006C7E52    jmp         006C7E83
 006C7E54    mov         eax,[0078DB00];^Screen:TScreen
 006C7E59    mov         eax,dword ptr [eax]
 006C7E5B    call        TScreen.GetMonitorCount
 006C7E60    cmp         esi,eax
>006C7E62    jl          006C7E71
 006C7E64    mov         eax,dword ptr [ebp-8]
 006C7E67    call        @UStrClr
>006C7E6C    jmp         006C7FDA
 006C7E71    mov         edx,dword ptr [ebx+18];TScreenValue........................................................
 006C7E74    mov         eax,[0078DB00];^Screen:TScreen
 006C7E79    mov         eax,dword ptr [eax]
 006C7E7B    call        TScreen.GetMonitor
 006C7E80    mov         esi,dword ptr [eax+4];TMonitor.FHandle:HMONITOR
 006C7E83    lea         eax,[ebp-120]
 006C7E89    push        eax
 006C7E8A    push        esi
 006C7E8B    call        user32.GetMonitorInfoW
 006C7E90    test        al,al
>006C7E92    je          006C7EAC
 006C7E94    mov         eax,dword ptr [ebp-8]
 006C7E97    lea         edx,[ebp-0F8]
 006C7E9D    mov         ecx,20
 006C7EA2    call        @UStrFromWArray
>006C7EA7    jmp         006C7FDA
 006C7EAC    lea         edx,[ebp-324]
 006C7EB2    mov         eax,dword ptr [ebx+18];TScreenValue........................................................
 006C7EB5    inc         eax
 006C7EB6    call        IntToStr
 006C7EBB    mov         ecx,dword ptr [ebp-324]
 006C7EC1    mov         eax,dword ptr [ebp-8]
 006C7EC4    mov         edx,6C8018;^TIdUDPClient.InitComponent
 006C7EC9    call        @UStrCat3
 006C7ECE    xor         eax,eax
 006C7ED0    push        ebp
 006C7ED1    push        6C7EEE
 006C7ED6    push        dword ptr fs:[eax]
 006C7ED9    mov         dword ptr fs:[eax],esp
 006C7EDC    call        RaiseLastOSError
 006C7EE1    xor         eax,eax
 006C7EE3    pop         edx
 006C7EE4    pop         ecx
 006C7EE5    pop         ecx
 006C7EE6    mov         dword ptr fs:[eax],edx
>006C7EE9    jmp         006C7FDA
>006C7EEE    jmp         @HandleOnException
 006C7EF3    dd          1
 006C7EF7    dd          00418C04;Exception
 006C7EFB    dd          006C7EFF
 006C7EFF    mov         ebx,eax
 006C7F01    mov         eax,dword ptr [ebp-8]
 006C7F04    mov         edx,dword ptr [ebx+4];Exception.FMessage:string
 006C7F07    call        @UStrAsg
 006C7F0C    call        @DoneExcept
>006C7F11    jmp         006C7FDA
 006C7F16    mov         edx,dword ptr [ebp-8]
 006C7F19    mov         eax,[0078DB00];^Screen:TScreen
 006C7F1E    mov         eax,dword ptr [eax]
 006C7F20    mov         eax,dword ptr [eax+7C];TScreen.FHintFont:TFont
 006C7F23    call        TFont.GetName
>006C7F28    jmp         006C7FDA
 006C7F2D    mov         edx,dword ptr [ebp-8]
 006C7F30    mov         eax,[0078DB00];^Screen:TScreen
 006C7F35    mov         eax,dword ptr [eax]
 006C7F37    mov         eax,dword ptr [eax+80];TScreen.FIconFont:TFont
 006C7F3D    call        TFont.GetName
>006C7F42    jmp         006C7FDA
 006C7F47    mov         edx,dword ptr [ebp-8]
 006C7F4A    mov         eax,[0078DB00];^Screen:TScreen
 006C7F4F    mov         eax,dword ptr [eax]
 006C7F51    mov         eax,dword ptr [eax+84];TScreen.FMenuFont:TFont
 006C7F57    call        TFont.GetName
>006C7F5C    jmp         006C7FDA
 006C7F5E    mov         eax,dword ptr ds:[81F670];gvar_0081F670:Double
 006C7F64    mov         dword ptr [ebp-10],eax
 006C7F67    mov         eax,dword ptr ds:[81F674];gvar_0081F674
 006C7F6D    mov         dword ptr [ebp-0C],eax
 006C7F70    push        dword ptr [ebp-0C]
 006C7F73    push        dword ptr [ebp-10]
 006C7F76    lea         edx,[ebp-4]
 006C7F79    mov         eax,[0078D6A8];^gvar_00790CDC:TFormatSettings
 006C7F7E    call        DateToStr
 006C7F83    mov         eax,dword ptr [ebp-8]
 006C7F86    mov         edx,dword ptr [ebp-4]
 006C7F89    call        @UStrAsg
>006C7F8E    jmp         006C7FDA
 006C7F90    mov         eax,dword ptr [ebp-8]
 006C7F93    mov         edx,dword ptr ds:[81F680];gvar_0081F680:UnicodeString
 006C7F99    call        @UStrAsg
>006C7F9E    jmp         006C7FDA
 006C7FA0    mov         eax,dword ptr [ebp-8]
 006C7FA3    mov         edx,dword ptr ds:[81F684];gvar_0081F684:UnicodeString
 006C7FA9    call        @UStrAsg
>006C7FAE    jmp         006C7FDA
 006C7FB0    mov         eax,dword ptr [ebp-8]
 006C7FB3    mov         edx,dword ptr ds:[81F678];gvar_0081F678:UnicodeString
 006C7FB9    call        @UStrAsg
>006C7FBE    jmp         006C7FDA
 006C7FC0    mov         eax,dword ptr [ebp-8]
 006C7FC3    mov         edx,dword ptr ds:[81F67C];gvar_0081F67C:UnicodeString
 006C7FC9    call        @UStrAsg
>006C7FCE    jmp         006C7FDA
 006C7FD0    mov         edx,dword ptr [ebp-8]
 006C7FD3    mov         eax,ebx
 006C7FD5    call        TExpression.GetString
 006C7FDA    xor         eax,eax
 006C7FDC    pop         edx
 006C7FDD    pop         ecx
 006C7FDE    pop         ecx
 006C7FDF    mov         dword ptr fs:[eax],edx
 006C7FE2    push        6C8002
 006C7FE7    lea         eax,[ebp-324]
 006C7FED    call        @UStrClr
 006C7FF2    lea         eax,[ebp-4]
 006C7FF5    call        @UStrClr
 006C7FFA    ret
>006C7FFB    jmp         @HandleFinally
>006C8000    jmp         006C7FE7
 006C8002    pop         edi
 006C8003    pop         esi
 006C8004    pop         ebx
 006C8005    mov         esp,ebp
 006C8007    pop         ebp
 006C8008    ret
end;*}

//006C8030
function TScreenValue.GetUnits:TUnits;
begin
{*
 006C8030    mov         eax,dword ptr [eax+20];TScreenValue............................Item:Integer
 006C8033    cmp         eax,40
>006C8036    jg          006C80B4
>006C8038    je          006C8126
 006C803E    cmp         eax,17
>006C8041    jge         006C8070
 006C8043    add         eax,0FFFFFFFD
 006C8046    sub         eax,2
>006C8049    jb          006C8135
 006C804F    dec         eax
>006C8050    je          006C8135
 006C8056    sub         eax,2
>006C8059    je          006C8135
 006C805F    add         eax,0FFFFFFFE
 006C8062    sub         eax,8
>006C8065    jb          006C8135
>006C806B    jmp         006C8138
 006C8070    cmp         eax,29
>006C8073    jge         006C8092
 006C8075    add         eax,0FFFFFFE9
 006C8078    sub         eax,2
>006C807B    jb          006C8135
 006C8081    add         eax,0FFFFFFF7
 006C8084    sub         eax,6
>006C8087    jb          006C8135
>006C808D    jmp         006C8138
 006C8092    add         eax,0FFFFFFD7
 006C8095    sub         eax,6
>006C8098    jb          006C8135
 006C809E    add         eax,0FFFFFFF8
 006C80A1    sub         eax,2
>006C80A4    jb          006C8135
 006C80AA    sub         eax,5
>006C80AD    je          006C8126
>006C80AF    jmp         006C8138
 006C80B4    add         eax,0FFFFFFB2
 006C80B7    cmp         eax,17
>006C80BA    ja          006C8138
 006C80BC    jmp         dword ptr [eax*4+6C80C3]
 006C80BC    dd          006C8126
 006C80BC    dd          006C8135
 006C80BC    dd          006C8135
 006C80BC    dd          006C8138
 006C80BC    dd          006C8138
 006C80BC    dd          006C8126
 006C80BC    dd          006C8138
 006C80BC    dd          006C8138
 006C80BC    dd          006C812C
 006C80BC    dd          006C8138
 006C80BC    dd          006C8138
 006C80BC    dd          006C812F
 006C80BC    dd          006C812F
 006C80BC    dd          006C8138
 006C80BC    dd          006C8138
 006C80BC    dd          006C8138
 006C80BC    dd          006C8138
 006C80BC    dd          006C8138
 006C80BC    dd          006C8138
 006C80BC    dd          006C8132
 006C80BC    dd          006C8138
 006C80BC    dd          006C8138
 006C80BC    dd          006C8129
 006C80BC    dd          006C8123
 006C8123    xor         eax,eax
 006C8125    ret
 006C8126    mov         al,11
 006C8128    ret
 006C8129    mov         al,18
 006C812B    ret
 006C812C    mov         al,14
 006C812E    ret
 006C812F    mov         al,4
 006C8131    ret
 006C8132    mov         al,7
 006C8134    ret
 006C8135    mov         al,0C
 006C8137    ret
 006C8138    xor         eax,eax
 006C813A    ret
*}
end;

//006C813C
procedure TScreenValue.GetValue;
begin
{*
 006C813C    push        ebx
 006C813D    push        esi
 006C813E    add         esp,0FFFFFFA0
 006C8141    mov         ebx,eax
 006C8143    mov         esi,dword ptr [ebx+18];TScreenValue........................................................
 006C8146    dec         esi
 006C8147    mov         eax,[0078DB00];^Screen:TScreen
 006C814C    mov         eax,dword ptr [eax]
 006C814E    call        TScreen.GetMonitorCount
 006C8153    cmp         esi,eax
>006C8155    jl          006C8165
 006C8157    xor         eax,eax
 006C8159    mov         dword ptr [esp],eax
 006C815C    mov         dword ptr [esp+4],eax
>006C8160    jmp         006C91BA
 006C8165    mov         eax,dword ptr [ebx+20];TScreenValue.............................Item:Integer
 006C8168    cmp         eax,65
>006C816B    ja          006C91B1
 006C8171    jmp         dword ptr [eax*4+6C8178]
 006C8171    dd          006C91B1
 006C8171    dd          006C831F
 006C8171    dd          006C833C
 006C8171    dd          006C841D
 006C8171    dd          006C8434
 006C8171    dd          006C844B
 006C8171    dd          006C8459
 006C8171    dd          006C844B
 006C8171    dd          006C8479
 006C8171    dd          006C844B
 006C8171    dd          006C849C
 006C8171    dd          006C84BF
 006C8171    dd          006C835D
 006C8171    dd          006C837A
 006C8171    dd          006C8397
 006C8171    dd          006C83B4
 006C8171    dd          006C83DA
 006C8171    dd          006C83F7
 006C8171    dd          006C84D2
 006C8171    dd          006C851F
 006C8171    dd          006C86D0
 006C8171    dd          006C86E3
 006C8171    dd          006C86F6
 006C8171    dd          006C8823
 006C8171    dd          006C883B
 006C8171    dd          006C87C9
 006C8171    dd          006C87D7
 006C8171    dd          006C844B
 006C8171    dd          006C87EA
 006C8171    dd          006C87FD
 006C8171    dd          006C8810
 006C8171    dd          006C8853
 006C8171    dd          006C8868
 006C8171    dd          006C844B
 006C8171    dd          006C8A41
 006C8171    dd          006C8AA4
 006C8171    dd          006C8B07
 006C8171    dd          006C8B5B
 006C8171    dd          006C8BC8
 006C8171    dd          006C8C1C
 006C8171    dd          006C905F
 006C8171    dd          006C8C89
 006C8171    dd          006C8CEC
 006C8171    dd          006C8D59
 006C8171    dd          006C8DBC
 006C8171    dd          006C8E29
 006C8171    dd          006C8EAF
 006C8171    dd          006C8F35
 006C8171    dd          006C8F79
 006C8171    dd          006C8FCE
 006C8171    dd          006C858E
 006C8171    dd          006C862F
 006C8171    dd          006C9033
 006C8171    dd          006C91B1
 006C8171    dd          006C9079
 006C8171    dd          006C8890
 006C8171    dd          006C88A8
 006C8171    dd          006C887D
 006C8171    dd          006C8709
 006C8171    dd          006C8798
 006C8171    dd          006C871C
 006C8171    dd          006C872F
 006C8171    dd          006C8742
 006C8171    dd          006C8772
 006C8171    dd          006C875D
 006C8171    dd          006C8785
 006C8171    dd          006C88C0
 006C8171    dd          006C88D3
 006C8171    dd          006C88E6
 006C8171    dd          006C88F9
 006C8171    dd          006C890C
 006C8171    dd          006C891F
 006C8171    dd          006C8932
 006C8171    dd          006C8945
 006C8171    dd          006C8958
 006C8171    dd          006C89B7
 006C8171    dd          006C896B
 006C8171    dd          006C897E
 006C8171    dd          006C89CC
 006C8171    dd          006C8A02
 006C8171    dd          006C8A17
 006C8171    dd          006C8991
 006C8171    dd          006C8A2C
 006C8171    dd          006C89E7
 006C8171    dd          006C89A4
 006C8171    dd          006C9091
 006C8171    dd          006C90A6
 006C8171    dd          006C90BE
 006C8171    dd          006C90D6
 006C8171    dd          006C90EE
 006C8171    dd          006C9106
 006C8171    dd          006C91B1
 006C8171    dd          006C91B1
 006C8171    dd          006C91B1
 006C8171    dd          006C91B1
 006C8171    dd          006C911E
 006C8171    dd          006C913A
 006C8171    dd          006C9166
 006C8171    dd          006C856C
 006C8171    dd          006C857D
 006C8171    dd          006C8310
 006C8171    dd          006C91A5
 006C8310    fild        dword ptr ds:[81F660];gvar_0081F660:Single
 006C8316    fstp        qword ptr [esp]
 006C8319    wait
>006C831A    jmp         006C91BA
 006C831F    mov         eax,[0078DB00];^Screen:TScreen
 006C8324    mov         eax,dword ptr [eax]
 006C8326    call        TScreen.GetMonitorCount
 006C832B    mov         dword ptr [esp+24],eax
 006C832F    fild        dword ptr [esp+24]
 006C8333    fstp        qword ptr [esp]
 006C8336    wait
>006C8337    jmp         006C91BA
 006C833C    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 006C8341    mov         eax,dword ptr [eax]
 006C8343    call        TCustomForm.GetMonitor
 006C8348    mov         eax,dword ptr [eax+8];TMonitor.FMonitorNum:Integer
 006C834B    inc         eax
 006C834C    mov         dword ptr [esp+24],eax
 006C8350    fild        dword ptr [esp+24]
 006C8354    fstp        qword ptr [esp]
 006C8357    wait
>006C8358    jmp         006C91BA
 006C835D    mov         eax,[0078DB00];^Screen:TScreen
 006C8362    mov         eax,dword ptr [eax]
 006C8364    call        TScreen.GetDesktopWidth
 006C8369    mov         dword ptr [esp+24],eax
 006C836D    fild        dword ptr [esp+24]
 006C8371    fstp        qword ptr [esp]
 006C8374    wait
>006C8375    jmp         006C91BA
 006C837A    mov         eax,[0078DB00];^Screen:TScreen
 006C837F    mov         eax,dword ptr [eax]
 006C8381    call        TScreen.GetDesktopHeight
 006C8386    mov         dword ptr [esp+24],eax
 006C838A    fild        dword ptr [esp+24]
 006C838E    fstp        qword ptr [esp]
 006C8391    wait
>006C8392    jmp         006C91BA
 006C8397    mov         eax,[0078DB00];^Screen:TScreen
 006C839C    mov         eax,dword ptr [eax]
 006C839E    call        TScreen.GetDesktopLeft
 006C83A3    mov         dword ptr [esp+24],eax
 006C83A7    fild        dword ptr [esp+24]
 006C83AB    fstp        qword ptr [esp]
 006C83AE    wait
>006C83AF    jmp         006C91BA
 006C83B4    lea         edx,[esp+28]
 006C83B8    mov         eax,[0078DB00];^Screen:TScreen
 006C83BD    mov         eax,dword ptr [eax]
 006C83BF    call        TScreen.GetDesktopRect
 006C83C4    mov         eax,dword ptr [esp+30]
 006C83C8    dec         eax
 006C83C9    mov         dword ptr [esp+24],eax
 006C83CD    fild        dword ptr [esp+24]
 006C83D1    fstp        qword ptr [esp]
 006C83D4    wait
>006C83D5    jmp         006C91BA
 006C83DA    mov         eax,[0078DB00];^Screen:TScreen
 006C83DF    mov         eax,dword ptr [eax]
 006C83E1    call        TScreen.GetDesktopTop
 006C83E6    mov         dword ptr [esp+24],eax
 006C83EA    fild        dword ptr [esp+24]
 006C83EE    fstp        qword ptr [esp]
 006C83F1    wait
>006C83F2    jmp         006C91BA
 006C83F7    lea         edx,[esp+28]
 006C83FB    mov         eax,[0078DB00];^Screen:TScreen
 006C8400    mov         eax,dword ptr [eax]
 006C8402    call        TScreen.GetDesktopRect
 006C8407    mov         eax,dword ptr [esp+34]
 006C840B    dec         eax
 006C840C    mov         dword ptr [esp+24],eax
 006C8410    fild        dword ptr [esp+24]
 006C8414    fstp        qword ptr [esp]
 006C8417    wait
>006C8418    jmp         006C91BA
 006C841D    lea         eax,[esp+8]
 006C8421    push        eax
 006C8422    call        user32.GetCursorPos
 006C8427    fild        dword ptr [esp+8]
 006C842B    fstp        qword ptr [esp]
 006C842E    wait
>006C842F    jmp         006C91BA
 006C8434    lea         eax,[esp+8]
 006C8438    push        eax
 006C8439    call        user32.GetCursorPos
 006C843E    fild        dword ptr [esp+0C]
 006C8442    fstp        qword ptr [esp]
 006C8445    wait
>006C8446    jmp         006C91BA
 006C844B    xor         eax,eax
 006C844D    mov         dword ptr [esp],eax
 006C8450    mov         dword ptr [esp+4],eax
>006C8454    jmp         006C91BA
 006C8459    mov         eax,[0078DB00];^Screen:TScreen
 006C845E    mov         eax,dword ptr [eax]
 006C8460    mov         eax,dword ptr [eax+7C];TScreen.FHintFont:TFont
 006C8463    call        TFont.GetSize
 006C8468    mov         dword ptr [esp+24],eax
 006C846C    fild        dword ptr [esp+24]
 006C8470    fstp        qword ptr [esp]
 006C8473    wait
>006C8474    jmp         006C91BA
 006C8479    mov         eax,[0078DB00];^Screen:TScreen
 006C847E    mov         eax,dword ptr [eax]
 006C8480    mov         eax,dword ptr [eax+80];TScreen.FIconFont:TFont
 006C8486    call        TFont.GetSize
 006C848B    mov         dword ptr [esp+24],eax
 006C848F    fild        dword ptr [esp+24]
 006C8493    fstp        qword ptr [esp]
 006C8496    wait
>006C8497    jmp         006C91BA
 006C849C    mov         eax,[0078DB00];^Screen:TScreen
 006C84A1    mov         eax,dword ptr [eax]
 006C84A3    mov         eax,dword ptr [eax+84];TScreen.FMenuFont:TFont
 006C84A9    call        TFont.GetSize
 006C84AE    mov         dword ptr [esp+24],eax
 006C84B2    fild        dword ptr [esp+24]
 006C84B6    fstp        qword ptr [esp]
 006C84B9    wait
>006C84BA    jmp         006C91BA
 006C84BF    mov         eax,[0078DB00];^Screen:TScreen
 006C84C4    mov         eax,dword ptr [eax]
 006C84C6    fild        dword ptr [eax+44];TScreen.FPixelsPerInch:Integer
 006C84C9    fstp        qword ptr [esp]
 006C84CC    wait
>006C84CD    jmp         006C91BA
 006C84D2    lea         eax,[esp+8]
 006C84D6    push        eax
 006C84D7    call        user32.GetCursorPos
 006C84DC    mov         eax,[0078DB00];^Screen:TScreen
 006C84E1    mov         eax,dword ptr [eax]
 006C84E3    call        TScreen.GetDesktopLeft
 006C84E8    mov         edx,dword ptr [esp+8]
 006C84EC    sub         edx,eax
 006C84EE    mov         dword ptr [esp+24],edx
 006C84F2    fild        dword ptr [esp+24]
 006C84F6    fstp        tbyte ptr [esp+38]
 006C84FA    wait
 006C84FB    mov         eax,[0078DB00];^Screen:TScreen
 006C8500    mov         eax,dword ptr [eax]
 006C8502    call        TScreen.GetDesktopWidth
 006C8507    dec         eax
 006C8508    mov         dword ptr [esp+44],eax
 006C850C    fild        dword ptr [esp+44]
 006C8510    fld         tbyte ptr [esp+38]
 006C8514    fdivrp      st(1),st
 006C8516    fstp        qword ptr [esp]
 006C8519    wait
>006C851A    jmp         006C91BA
 006C851F    lea         eax,[esp+8]
 006C8523    push        eax
 006C8524    call        user32.GetCursorPos
 006C8529    mov         eax,[0078DB00];^Screen:TScreen
 006C852E    mov         eax,dword ptr [eax]
 006C8530    call        TScreen.GetDesktopTop
 006C8535    mov         edx,dword ptr [esp+0C]
 006C8539    sub         edx,eax
 006C853B    mov         dword ptr [esp+24],edx
 006C853F    fild        dword ptr [esp+24]
 006C8543    fstp        tbyte ptr [esp+38]
 006C8547    wait
 006C8548    mov         eax,[0078DB00];^Screen:TScreen
 006C854D    mov         eax,dword ptr [eax]
 006C854F    call        TScreen.GetDesktopHeight
 006C8554    dec         eax
 006C8555    mov         dword ptr [esp+44],eax
 006C8559    fild        dword ptr [esp+44]
 006C855D    fld         tbyte ptr [esp+38]
 006C8561    fdivrp      st(1),st
 006C8563    fstp        qword ptr [esp]
 006C8566    wait
>006C8567    jmp         006C91BA
 006C856C    fld         qword ptr ds:[81F698];gvar_0081F698:Double
 006C8572    fchs
 006C8574    fstp        qword ptr [esp]
 006C8577    wait
>006C8578    jmp         006C91BA
 006C857D    fld         qword ptr ds:[81F6A0];gvar_0081F6A0:Double
 006C8583    fchs
 006C8585    fstp        qword ptr [esp]
 006C8588    wait
>006C8589    jmp         006C91BA
 006C858E    lea         eax,[esp+8]
 006C8592    push        eax
 006C8593    call        user32.GetCursorPos
 006C8598    test        esi,esi
>006C859A    jge         006C85C0
 006C859C    mov         eax,[0078DB00];^Screen:TScreen
 006C85A1    mov         eax,dword ptr [eax]
 006C85A3    call        TScreen.GetWidth
 006C85A8    dec         eax
 006C85A9    mov         dword ptr [esp+24],eax
 006C85AD    fild        dword ptr [esp+24]
 006C85B1    fild        dword ptr [esp+8]
 006C85B5    fdivrp      st(1),st
 006C85B7    fstp        qword ptr [esp]
 006C85BA    wait
>006C85BB    jmp         006C91BA
 006C85C0    mov         eax,[0078DB00];^Screen:TScreen
 006C85C5    mov         eax,dword ptr [eax]
 006C85C7    call        TScreen.GetMonitorCount
 006C85CC    cmp         esi,eax
>006C85CE    jl          006C85DE
 006C85D0    xor         eax,eax
 006C85D2    mov         dword ptr [esp],eax
 006C85D5    mov         dword ptr [esp+4],eax
>006C85D9    jmp         006C91BA
 006C85DE    mov         eax,[0078DB00];^Screen:TScreen
 006C85E3    mov         eax,dword ptr [eax]
 006C85E5    mov         edx,esi
 006C85E7    call        TScreen.GetMonitor
 006C85EC    call        TMonitor.GetLeft
 006C85F1    mov         edx,dword ptr [esp+8]
 006C85F5    sub         edx,eax
 006C85F7    mov         dword ptr [esp+24],edx
 006C85FB    fild        dword ptr [esp+24]
 006C85FF    fstp        tbyte ptr [esp+38]
 006C8603    wait
 006C8604    mov         eax,[0078DB00];^Screen:TScreen
 006C8609    mov         eax,dword ptr [eax]
 006C860B    mov         edx,esi
 006C860D    call        TScreen.GetMonitor
 006C8612    call        TMonitor.GetWidth
 006C8617    dec         eax
 006C8618    mov         dword ptr [esp+44],eax
 006C861C    fild        dword ptr [esp+44]
 006C8620    fld         tbyte ptr [esp+38]
 006C8624    fdivrp      st(1),st
 006C8626    fstp        qword ptr [esp]
 006C8629    wait
>006C862A    jmp         006C91BA
 006C862F    lea         eax,[esp+8]
 006C8633    push        eax
 006C8634    call        user32.GetCursorPos
 006C8639    test        esi,esi
>006C863B    jge         006C8661
 006C863D    mov         eax,[0078DB00];^Screen:TScreen
 006C8642    mov         eax,dword ptr [eax]
 006C8644    call        TScreen.GetHeight
 006C8649    dec         eax
 006C864A    mov         dword ptr [esp+24],eax
 006C864E    fild        dword ptr [esp+24]
 006C8652    fild        dword ptr [esp+0C]
 006C8656    fdivrp      st(1),st
 006C8658    fstp        qword ptr [esp]
 006C865B    wait
>006C865C    jmp         006C91BA
 006C8661    mov         eax,[0078DB00];^Screen:TScreen
 006C8666    mov         eax,dword ptr [eax]
 006C8668    call        TScreen.GetMonitorCount
 006C866D    cmp         esi,eax
>006C866F    jl          006C867F
 006C8671    xor         eax,eax
 006C8673    mov         dword ptr [esp],eax
 006C8676    mov         dword ptr [esp+4],eax
>006C867A    jmp         006C91BA
 006C867F    mov         eax,[0078DB00];^Screen:TScreen
 006C8684    mov         eax,dword ptr [eax]
 006C8686    mov         edx,esi
 006C8688    call        TScreen.GetMonitor
 006C868D    call        TMonitor.GetTop
 006C8692    mov         edx,dword ptr [esp+0C]
 006C8696    sub         edx,eax
 006C8698    mov         dword ptr [esp+24],edx
 006C869C    fild        dword ptr [esp+24]
 006C86A0    fstp        tbyte ptr [esp+38]
 006C86A4    wait
 006C86A5    mov         eax,[0078DB00];^Screen:TScreen
 006C86AA    mov         eax,dword ptr [eax]
 006C86AC    mov         edx,esi
 006C86AE    call        TScreen.GetMonitor
 006C86B3    call        TMonitor.GetHeight
 006C86B8    dec         eax
 006C86B9    mov         dword ptr [esp+44],eax
 006C86BD    fild        dword ptr [esp+44]
 006C86C1    fld         tbyte ptr [esp+38]
 006C86C5    fdivrp      st(1),st
 006C86C7    fstp        qword ptr [esp]
 006C86CA    wait
>006C86CB    jmp         006C91BA
 006C86D0    mov         eax,101C
 006C86D5    call        006C7B48
 006C86DA    fstp        qword ptr [esp]
 006C86DD    wait
>006C86DE    jmp         006C91BA
 006C86E3    mov         eax,1020
 006C86E8    call        006C7B48
 006C86ED    fstp        qword ptr [esp]
 006C86F0    wait
>006C86F1    jmp         006C91BA
 006C86F6    mov         eax,46
 006C86FB    call        006C7B48
 006C8700    fstp        qword ptr [esp]
 006C8703    wait
>006C8704    jmp         006C91BA
 006C8709    mov         eax,100A
 006C870E    call        006C7B48
 006C8713    fstp        qword ptr [esp]
 006C8716    wait
>006C8717    jmp         006C91BA
 006C871C    mov         eax,1B
 006C8721    call        006C7B48
 006C8726    fstp        qword ptr [esp]
 006C8729    wait
>006C872A    jmp         006C91BA
 006C872F    mov         eax,1012
 006C8734    call        006C7B48
 006C8739    fstp        qword ptr [esp]
 006C873C    wait
>006C873D    jmp         006C91BA
 006C8742    xor         edx,edx
 006C8744    mov         eax,6A
 006C8749    call        006C7B88
 006C874E    fdiv        dword ptr ds:[6C91C4];1000:Single
 006C8754    fstp        qword ptr [esp]
 006C8757    wait
>006C8758    jmp         006C91BA
 006C875D    xor         edx,edx
 006C875F    mov         eax,0E
 006C8764    call        006C7B88
 006C8769    fstp        qword ptr [esp]
 006C876C    wait
>006C876D    jmp         006C91BA
 006C8772    mov         eax,10
 006C8777    call        006C7B48
 006C877C    fstp        qword ptr [esp]
 006C877F    wait
>006C8780    jmp         006C91BA
 006C8785    mov         eax,72
 006C878A    call        006C7B48
 006C878F    fstp        qword ptr [esp]
 006C8792    wait
>006C8793    jmp         006C91BA
 006C8798    xor         edx,edx
 006C879A    mov         eax,5E
 006C879F    call        006C7B88
 006C87A4    fstp        qword ptr [esp]
 006C87A7    wait
 006C87A8    fld         qword ptr [esp]
 006C87AB    fcomp       dword ptr ds:[6C91C8];0:Single
 006C87B1    wait
 006C87B2    fnstsw      al
 006C87B4    sahf
>006C87B5    ja          006C91BA
 006C87BB    xor         eax,eax
 006C87BD    mov         dword ptr [esp],eax
 006C87C0    mov         dword ptr [esp+4],eax
>006C87C4    jmp         006C91BA
 006C87C9    xor         eax,eax
 006C87CB    mov         dword ptr [esp],eax
 006C87CE    mov         dword ptr [esp+4],eax
>006C87D2    jmp         006C91BA
 006C87D7    mov         eax,38
 006C87DC    call        006C7B48
 006C87E1    fstp        qword ptr [esp]
 006C87E4    wait
>006C87E5    jmp         006C91BA
 006C87EA    mov         eax,1024
 006C87EF    call        006C7B48
 006C87F4    fstp        qword ptr [esp]
 006C87F7    wait
>006C87F8    jmp         006C91BA
 006C87FD    mov         eax,1022
 006C8802    call        006C7B48
 006C8807    fstp        qword ptr [esp]
 006C880A    wait
>006C880B    jmp         006C91BA
 006C8810    mov         eax,4A
 006C8815    call        006C7B48
 006C881A    fstp        qword ptr [esp]
 006C881D    wait
>006C881E    jmp         006C91BA
 006C8823    mov         edx,1
 006C8828    mov         eax,200E
 006C882D    call        006C7B88
 006C8832    fstp        qword ptr [esp]
 006C8835    wait
>006C8836    jmp         006C91BA
 006C883B    mov         edx,1
 006C8840    mov         eax,2010
 006C8845    call        006C7B88
 006C884A    fstp        qword ptr [esp]
 006C884D    wait
>006C884E    jmp         006C91BA
 006C8853    xor         edx,edx
 006C8855    mov         eax,200C
 006C885A    call        006C7B88
 006C885F    fstp        qword ptr [esp]
 006C8862    wait
>006C8863    jmp         006C91BA
 006C8868    xor         edx,edx
 006C886A    mov         eax,200A
 006C886F    call        006C7B88
 006C8874    fstp        qword ptr [esp]
 006C8877    wait
>006C8878    jmp         006C91BA
 006C887D    mov         eax,19
 006C8882    call        006C7B48
 006C8887    fstp        qword ptr [esp]
 006C888A    wait
>006C888B    jmp         006C91BA
 006C8890    mov         edx,4B
 006C8895    mov         eax,0D
 006C889A    call        006C7B88
 006C889F    fstp        qword ptr [esp]
 006C88A2    wait
>006C88A3    jmp         006C91BA
 006C88A8    mov         edx,4B
 006C88AD    mov         eax,18
 006C88B2    call        006C7B88
 006C88B7    fstp        qword ptr [esp]
 006C88BA    wait
>006C88BB    jmp         006C91BA
 006C88C0    mov         eax,1004
 006C88C5    call        006C7B48
 006C88CA    fstp        qword ptr [esp]
 006C88CD    wait
>006C88CE    jmp         006C91BA
 006C88D3    mov         eax,101A
 006C88D8    call        006C7B48
 006C88DD    fstp        qword ptr [esp]
 006C88E0    wait
>006C88E1    jmp         006C91BA
 006C88E6    mov         eax,1008
 006C88EB    call        006C7B48
 006C88F0    fstp        qword ptr [esp]
 006C88F3    wait
>006C88F4    jmp         006C91BA
 006C88F9    mov         eax,100E
 006C88FE    call        006C7B48
 006C8903    fstp        qword ptr [esp]
 006C8906    wait
>006C8907    jmp         006C91BA
 006C890C    mov         eax,1006
 006C8911    call        006C7B48
 006C8916    fstp        qword ptr [esp]
 006C8919    wait
>006C891A    jmp         006C91BA
 006C891F    mov         eax,1002
 006C8924    call        006C7B48
 006C8929    fstp        qword ptr [esp]
 006C892C    wait
>006C892D    jmp         006C91BA
 006C8932    mov         eax,1014
 006C8937    call        006C7B48
 006C893C    fstp        qword ptr [esp]
 006C893F    wait
>006C8940    jmp         006C91BA
 006C8945    mov         eax,1016
 006C894A    call        006C7B48
 006C894F    fstp        qword ptr [esp]
 006C8952    wait
>006C8953    jmp         006C91BA
 006C8958    mov         eax,1018
 006C895D    call        006C7B48
 006C8962    fstp        qword ptr [esp]
 006C8965    wait
>006C8966    jmp         006C91BA
 006C896B    mov         eax,1000
 006C8970    call        006C7B48
 006C8975    fstp        qword ptr [esp]
 006C8978    wait
>006C8979    jmp         006C91BA
 006C897E    mov         eax,100C
 006C8983    call        006C7B48
 006C8988    fstp        qword ptr [esp]
 006C898B    wait
>006C898C    jmp         006C91BA
 006C8991    mov         eax,26
 006C8996    call        006C7B48
 006C899B    fstp        qword ptr [esp]
 006C899E    wait
>006C899F    jmp         006C91BA
 006C89A4    mov         eax,6E
 006C89A9    call        006C7B48
 006C89AE    fstp        qword ptr [esp]
 006C89B1    wait
>006C89B2    jmp         006C91BA
 006C89B7    xor         edx,edx
 006C89B9    mov         eax,103E
 006C89BE    call        006C7B88
 006C89C3    fstp        qword ptr [esp]
 006C89C6    wait
>006C89C7    jmp         006C91BA
 006C89CC    xor         edx,edx
 006C89CE    mov         eax,2002
 006C89D3    call        006C7B88
 006C89D8    fdiv        dword ptr ds:[6C91C4];1000:Single
 006C89DE    fstp        qword ptr [esp]
 006C89E1    wait
>006C89E2    jmp         006C91BA
 006C89E7    xor         edx,edx
 006C89E9    mov         eax,2000
 006C89EE    call        006C7B88
 006C89F3    fdiv        dword ptr ds:[6C91C4];1000:Single
 006C89F9    fstp        qword ptr [esp]
 006C89FC    wait
>006C89FD    jmp         006C91BA
 006C8A02    xor         edx,edx
 006C8A04    mov         eax,5
 006C8A09    call        006C7B88
 006C8A0E    fstp        qword ptr [esp]
 006C8A11    wait
>006C8A12    jmp         006C91BA
 006C8A17    xor         edx,edx
 006C8A19    mov         eax,2006
 006C8A1E    call        006C7B88
 006C8A23    fstp        qword ptr [esp]
 006C8A26    wait
>006C8A27    jmp         006C91BA
 006C8A2C    xor         edx,edx
 006C8A2E    mov         eax,2004
 006C8A33    call        006C7B88
 006C8A38    fstp        qword ptr [esp]
 006C8A3B    wait
>006C8A3C    jmp         006C91BA
 006C8A41    test        esi,esi
>006C8A43    jge         006C8A62
 006C8A45    mov         eax,[0078DB00];^Screen:TScreen
 006C8A4A    mov         eax,dword ptr [eax]
 006C8A4C    call        TScreen.GetWidth
 006C8A51    mov         dword ptr [esp+24],eax
 006C8A55    fild        dword ptr [esp+24]
 006C8A59    fstp        qword ptr [esp]
 006C8A5C    wait
>006C8A5D    jmp         006C91BA
 006C8A62    mov         eax,[0078DB00];^Screen:TScreen
 006C8A67    mov         eax,dword ptr [eax]
 006C8A69    call        TScreen.GetMonitorCount
 006C8A6E    cmp         esi,eax
>006C8A70    jl          006C8A80
 006C8A72    xor         eax,eax
 006C8A74    mov         dword ptr [esp],eax
 006C8A77    mov         dword ptr [esp+4],eax
>006C8A7B    jmp         006C91BA
 006C8A80    mov         eax,[0078DB00];^Screen:TScreen
 006C8A85    mov         eax,dword ptr [eax]
 006C8A87    mov         edx,esi
 006C8A89    call        TScreen.GetMonitor
 006C8A8E    call        TMonitor.GetWidth
 006C8A93    mov         dword ptr [esp+24],eax
 006C8A97    fild        dword ptr [esp+24]
 006C8A9B    fstp        qword ptr [esp]
 006C8A9E    wait
>006C8A9F    jmp         006C91BA
 006C8AA4    test        esi,esi
>006C8AA6    jge         006C8AC5
 006C8AA8    mov         eax,[0078DB00];^Screen:TScreen
 006C8AAD    mov         eax,dword ptr [eax]
 006C8AAF    call        TScreen.GetHeight
 006C8AB4    mov         dword ptr [esp+24],eax
 006C8AB8    fild        dword ptr [esp+24]
 006C8ABC    fstp        qword ptr [esp]
 006C8ABF    wait
>006C8AC0    jmp         006C91BA
 006C8AC5    mov         eax,[0078DB00];^Screen:TScreen
 006C8ACA    mov         eax,dword ptr [eax]
 006C8ACC    call        TScreen.GetMonitorCount
 006C8AD1    cmp         esi,eax
>006C8AD3    jl          006C8AE3
 006C8AD5    xor         eax,eax
 006C8AD7    mov         dword ptr [esp],eax
 006C8ADA    mov         dword ptr [esp+4],eax
>006C8ADE    jmp         006C91BA
 006C8AE3    mov         eax,[0078DB00];^Screen:TScreen
 006C8AE8    mov         eax,dword ptr [eax]
 006C8AEA    mov         edx,esi
 006C8AEC    call        TScreen.GetMonitor
 006C8AF1    call        TMonitor.GetHeight
 006C8AF6    mov         dword ptr [esp+24],eax
 006C8AFA    fild        dword ptr [esp+24]
 006C8AFE    fstp        qword ptr [esp]
 006C8B01    wait
>006C8B02    jmp         006C91BA
 006C8B07    test        esi,esi
>006C8B09    jge         006C8B19
 006C8B0B    xor         eax,eax
 006C8B0D    mov         dword ptr [esp],eax
 006C8B10    mov         dword ptr [esp+4],eax
>006C8B14    jmp         006C91BA
 006C8B19    mov         eax,[0078DB00];^Screen:TScreen
 006C8B1E    mov         eax,dword ptr [eax]
 006C8B20    call        TScreen.GetMonitorCount
 006C8B25    cmp         esi,eax
>006C8B27    jl          006C8B37
 006C8B29    xor         eax,eax
 006C8B2B    mov         dword ptr [esp],eax
 006C8B2E    mov         dword ptr [esp+4],eax
>006C8B32    jmp         006C91BA
 006C8B37    mov         eax,[0078DB00];^Screen:TScreen
 006C8B3C    mov         eax,dword ptr [eax]
 006C8B3E    mov         edx,esi
 006C8B40    call        TScreen.GetMonitor
 006C8B45    call        TMonitor.GetLeft
 006C8B4A    mov         dword ptr [esp+24],eax
 006C8B4E    fild        dword ptr [esp+24]
 006C8B52    fstp        qword ptr [esp]
 006C8B55    wait
>006C8B56    jmp         006C91BA
 006C8B5B    test        esi,esi
>006C8B5D    jge         006C8B7D
 006C8B5F    mov         eax,[0078DB00];^Screen:TScreen
 006C8B64    mov         eax,dword ptr [eax]
 006C8B66    call        TScreen.GetWidth
 006C8B6B    dec         eax
 006C8B6C    mov         dword ptr [esp+24],eax
 006C8B70    fild        dword ptr [esp+24]
 006C8B74    fstp        qword ptr [esp]
 006C8B77    wait
>006C8B78    jmp         006C91BA
 006C8B7D    mov         eax,[0078DB00];^Screen:TScreen
 006C8B82    mov         eax,dword ptr [eax]
 006C8B84    call        TScreen.GetMonitorCount
 006C8B89    cmp         esi,eax
>006C8B8B    jl          006C8B9B
 006C8B8D    xor         eax,eax
 006C8B8F    mov         dword ptr [esp],eax
 006C8B92    mov         dword ptr [esp+4],eax
>006C8B96    jmp         006C91BA
 006C8B9B    mov         eax,[0078DB00];^Screen:TScreen
 006C8BA0    mov         eax,dword ptr [eax]
 006C8BA2    mov         edx,esi
 006C8BA4    call        TScreen.GetMonitor
 006C8BA9    lea         edx,[esp+28]
 006C8BAD    call        TMonitor.GetBoundsRect
 006C8BB2    mov         eax,dword ptr [esp+30]
 006C8BB6    dec         eax
 006C8BB7    mov         dword ptr [esp+24],eax
 006C8BBB    fild        dword ptr [esp+24]
 006C8BBF    fstp        qword ptr [esp]
 006C8BC2    wait
>006C8BC3    jmp         006C91BA
 006C8BC8    test        esi,esi
>006C8BCA    jge         006C8BDA
 006C8BCC    xor         eax,eax
 006C8BCE    mov         dword ptr [esp],eax
 006C8BD1    mov         dword ptr [esp+4],eax
>006C8BD5    jmp         006C91BA
 006C8BDA    mov         eax,[0078DB00];^Screen:TScreen
 006C8BDF    mov         eax,dword ptr [eax]
 006C8BE1    call        TScreen.GetMonitorCount
 006C8BE6    cmp         esi,eax
>006C8BE8    jl          006C8BF8
 006C8BEA    xor         eax,eax
 006C8BEC    mov         dword ptr [esp],eax
 006C8BEF    mov         dword ptr [esp+4],eax
>006C8BF3    jmp         006C91BA
 006C8BF8    mov         eax,[0078DB00];^Screen:TScreen
 006C8BFD    mov         eax,dword ptr [eax]
 006C8BFF    mov         edx,esi
 006C8C01    call        TScreen.GetMonitor
 006C8C06    call        TMonitor.GetTop
 006C8C0B    mov         dword ptr [esp+24],eax
 006C8C0F    fild        dword ptr [esp+24]
 006C8C13    fstp        qword ptr [esp]
 006C8C16    wait
>006C8C17    jmp         006C91BA
 006C8C1C    test        esi,esi
>006C8C1E    jge         006C8C3E
 006C8C20    mov         eax,[0078DB00];^Screen:TScreen
 006C8C25    mov         eax,dword ptr [eax]
 006C8C27    call        TScreen.GetHeight
 006C8C2C    dec         eax
 006C8C2D    mov         dword ptr [esp+24],eax
 006C8C31    fild        dword ptr [esp+24]
 006C8C35    fstp        qword ptr [esp]
 006C8C38    wait
>006C8C39    jmp         006C91BA
 006C8C3E    mov         eax,[0078DB00];^Screen:TScreen
 006C8C43    mov         eax,dword ptr [eax]
 006C8C45    call        TScreen.GetMonitorCount
 006C8C4A    cmp         esi,eax
>006C8C4C    jl          006C8C5C
 006C8C4E    xor         eax,eax
 006C8C50    mov         dword ptr [esp],eax
 006C8C53    mov         dword ptr [esp+4],eax
>006C8C57    jmp         006C91BA
 006C8C5C    mov         eax,[0078DB00];^Screen:TScreen
 006C8C61    mov         eax,dword ptr [eax]
 006C8C63    mov         edx,esi
 006C8C65    call        TScreen.GetMonitor
 006C8C6A    lea         edx,[esp+28]
 006C8C6E    call        TMonitor.GetBoundsRect
 006C8C73    mov         eax,dword ptr [esp+34]
 006C8C77    dec         eax
 006C8C78    mov         dword ptr [esp+24],eax
 006C8C7C    fild        dword ptr [esp+24]
 006C8C80    fstp        qword ptr [esp]
 006C8C83    wait
>006C8C84    jmp         006C91BA
 006C8C89    test        esi,esi
>006C8C8B    jge         006C8CAA
 006C8C8D    mov         eax,[0078DB00];^Screen:TScreen
 006C8C92    mov         eax,dword ptr [eax]
 006C8C94    call        TScreen.GetWorkAreaLeft
 006C8C99    mov         dword ptr [esp+24],eax
 006C8C9D    fild        dword ptr [esp+24]
 006C8CA1    fstp        qword ptr [esp]
 006C8CA4    wait
>006C8CA5    jmp         006C91BA
 006C8CAA    mov         eax,[0078DB00];^Screen:TScreen
 006C8CAF    mov         eax,dword ptr [eax]
 006C8CB1    call        TScreen.GetMonitorCount
 006C8CB6    cmp         esi,eax
>006C8CB8    jl          006C8CC8
 006C8CBA    xor         eax,eax
 006C8CBC    mov         dword ptr [esp],eax
 006C8CBF    mov         dword ptr [esp+4],eax
>006C8CC3    jmp         006C91BA
 006C8CC8    mov         eax,[0078DB00];^Screen:TScreen
 006C8CCD    mov         eax,dword ptr [eax]
 006C8CCF    mov         edx,esi
 006C8CD1    call        TScreen.GetMonitor
 006C8CD6    lea         edx,[esp+28]
 006C8CDA    call        TMonitor.GetWorkareaRect
 006C8CDF    fild        dword ptr [esp+28]
 006C8CE3    fstp        qword ptr [esp]
 006C8CE6    wait
>006C8CE7    jmp         006C91BA
 006C8CEC    test        esi,esi
>006C8CEE    jge         006C8D0E
 006C8CF0    mov         eax,[0078DB00];^Screen:TScreen
 006C8CF5    mov         eax,dword ptr [eax]
 006C8CF7    call        TScreen.GetWorkAreaWidth
 006C8CFC    dec         eax
 006C8CFD    mov         dword ptr [esp+24],eax
 006C8D01    fild        dword ptr [esp+24]
 006C8D05    fstp        qword ptr [esp]
 006C8D08    wait
>006C8D09    jmp         006C91BA
 006C8D0E    mov         eax,[0078DB00];^Screen:TScreen
 006C8D13    mov         eax,dword ptr [eax]
 006C8D15    call        TScreen.GetMonitorCount
 006C8D1A    cmp         esi,eax
>006C8D1C    jl          006C8D2C
 006C8D1E    xor         eax,eax
 006C8D20    mov         dword ptr [esp],eax
 006C8D23    mov         dword ptr [esp+4],eax
>006C8D27    jmp         006C91BA
 006C8D2C    mov         eax,[0078DB00];^Screen:TScreen
 006C8D31    mov         eax,dword ptr [eax]
 006C8D33    mov         edx,esi
 006C8D35    call        TScreen.GetMonitor
 006C8D3A    lea         edx,[esp+28]
 006C8D3E    call        TMonitor.GetWorkareaRect
 006C8D43    mov         eax,dword ptr [esp+30]
 006C8D47    dec         eax
 006C8D48    mov         dword ptr [esp+24],eax
 006C8D4C    fild        dword ptr [esp+24]
 006C8D50    fstp        qword ptr [esp]
 006C8D53    wait
>006C8D54    jmp         006C91BA
 006C8D59    test        esi,esi
>006C8D5B    jge         006C8D7A
 006C8D5D    mov         eax,[0078DB00];^Screen:TScreen
 006C8D62    mov         eax,dword ptr [eax]
 006C8D64    call        TScreen.GetWorkAreaTop
 006C8D69    mov         dword ptr [esp+24],eax
 006C8D6D    fild        dword ptr [esp+24]
 006C8D71    fstp        qword ptr [esp]
 006C8D74    wait
>006C8D75    jmp         006C91BA
 006C8D7A    mov         eax,[0078DB00];^Screen:TScreen
 006C8D7F    mov         eax,dword ptr [eax]
 006C8D81    call        TScreen.GetMonitorCount
 006C8D86    cmp         esi,eax
>006C8D88    jl          006C8D98
 006C8D8A    xor         eax,eax
 006C8D8C    mov         dword ptr [esp],eax
 006C8D8F    mov         dword ptr [esp+4],eax
>006C8D93    jmp         006C91BA
 006C8D98    mov         eax,[0078DB00];^Screen:TScreen
 006C8D9D    mov         eax,dword ptr [eax]
 006C8D9F    mov         edx,esi
 006C8DA1    call        TScreen.GetMonitor
 006C8DA6    lea         edx,[esp+28]
 006C8DAA    call        TMonitor.GetWorkareaRect
 006C8DAF    fild        dword ptr [esp+2C]
 006C8DB3    fstp        qword ptr [esp]
 006C8DB6    wait
>006C8DB7    jmp         006C91BA
 006C8DBC    test        esi,esi
>006C8DBE    jge         006C8DDE
 006C8DC0    mov         eax,[0078DB00];^Screen:TScreen
 006C8DC5    mov         eax,dword ptr [eax]
 006C8DC7    call        TScreen.GetWorkAreaHeight
 006C8DCC    dec         eax
 006C8DCD    mov         dword ptr [esp+24],eax
 006C8DD1    fild        dword ptr [esp+24]
 006C8DD5    fstp        qword ptr [esp]
 006C8DD8    wait
>006C8DD9    jmp         006C91BA
 006C8DDE    mov         eax,[0078DB00];^Screen:TScreen
 006C8DE3    mov         eax,dword ptr [eax]
 006C8DE5    call        TScreen.GetMonitorCount
 006C8DEA    cmp         esi,eax
>006C8DEC    jl          006C8DFC
 006C8DEE    xor         eax,eax
 006C8DF0    mov         dword ptr [esp],eax
 006C8DF3    mov         dword ptr [esp+4],eax
>006C8DF7    jmp         006C91BA
 006C8DFC    mov         eax,[0078DB00];^Screen:TScreen
 006C8E01    mov         eax,dword ptr [eax]
 006C8E03    mov         edx,esi
 006C8E05    call        TScreen.GetMonitor
 006C8E0A    lea         edx,[esp+28]
 006C8E0E    call        TMonitor.GetWorkareaRect
 006C8E13    mov         eax,dword ptr [esp+34]
 006C8E17    dec         eax
 006C8E18    mov         dword ptr [esp+24],eax
 006C8E1C    fild        dword ptr [esp+24]
 006C8E20    fstp        qword ptr [esp]
 006C8E23    wait
>006C8E24    jmp         006C91BA
 006C8E29    test        esi,esi
>006C8E2B    jge         006C8E4A
 006C8E2D    mov         eax,[0078DB00];^Screen:TScreen
 006C8E32    mov         eax,dword ptr [eax]
 006C8E34    call        TScreen.GetWorkAreaWidth
 006C8E39    mov         dword ptr [esp+24],eax
 006C8E3D    fild        dword ptr [esp+24]
 006C8E41    fstp        qword ptr [esp]
 006C8E44    wait
>006C8E45    jmp         006C91BA
 006C8E4A    mov         eax,[0078DB00];^Screen:TScreen
 006C8E4F    mov         eax,dword ptr [eax]
 006C8E51    call        TScreen.GetMonitorCount
 006C8E56    cmp         esi,eax
>006C8E58    jl          006C8E68
 006C8E5A    xor         eax,eax
 006C8E5C    mov         dword ptr [esp],eax
 006C8E5F    mov         dword ptr [esp+4],eax
>006C8E63    jmp         006C91BA
 006C8E68    mov         eax,[0078DB00];^Screen:TScreen
 006C8E6D    mov         eax,dword ptr [eax]
 006C8E6F    mov         edx,esi
 006C8E71    call        TScreen.GetMonitor
 006C8E76    lea         edx,[esp+28]
 006C8E7A    call        TMonitor.GetWorkareaRect
 006C8E7F    mov         ebx,dword ptr [esp+30]
 006C8E83    mov         eax,[0078DB00];^Screen:TScreen
 006C8E88    mov         eax,dword ptr [eax]
 006C8E8A    mov         edx,esi
 006C8E8C    call        TScreen.GetMonitor
 006C8E91    lea         edx,[esp+48]
 006C8E95    call        TMonitor.GetWorkareaRect
 006C8E9A    sub         ebx,dword ptr [esp+48]
 006C8E9E    mov         dword ptr [esp+24],ebx
 006C8EA2    fild        dword ptr [esp+24]
 006C8EA6    fstp        qword ptr [esp]
 006C8EA9    wait
>006C8EAA    jmp         006C91BA
 006C8EAF    test        esi,esi
>006C8EB1    jge         006C8ED0
 006C8EB3    mov         eax,[0078DB00];^Screen:TScreen
 006C8EB8    mov         eax,dword ptr [eax]
 006C8EBA    call        TScreen.GetWorkAreaHeight
 006C8EBF    mov         dword ptr [esp+24],eax
 006C8EC3    fild        dword ptr [esp+24]
 006C8EC7    fstp        qword ptr [esp]
 006C8ECA    wait
>006C8ECB    jmp         006C91BA
 006C8ED0    mov         eax,[0078DB00];^Screen:TScreen
 006C8ED5    mov         eax,dword ptr [eax]
 006C8ED7    call        TScreen.GetMonitorCount
 006C8EDC    cmp         esi,eax
>006C8EDE    jl          006C8EEE
 006C8EE0    xor         eax,eax
 006C8EE2    mov         dword ptr [esp],eax
 006C8EE5    mov         dword ptr [esp+4],eax
>006C8EE9    jmp         006C91BA
 006C8EEE    mov         eax,[0078DB00];^Screen:TScreen
 006C8EF3    mov         eax,dword ptr [eax]
 006C8EF5    mov         edx,esi
 006C8EF7    call        TScreen.GetMonitor
 006C8EFC    lea         edx,[esp+28]
 006C8F00    call        TMonitor.GetWorkareaRect
 006C8F05    mov         ebx,dword ptr [esp+34]
 006C8F09    mov         eax,[0078DB00];^Screen:TScreen
 006C8F0E    mov         eax,dword ptr [eax]
 006C8F10    mov         edx,esi
 006C8F12    call        TScreen.GetMonitor
 006C8F17    lea         edx,[esp+48]
 006C8F1B    call        TMonitor.GetWorkareaRect
 006C8F20    sub         ebx,dword ptr [esp+4C]
 006C8F24    mov         dword ptr [esp+24],ebx
 006C8F28    fild        dword ptr [esp+24]
 006C8F2C    fstp        qword ptr [esp]
 006C8F2F    wait
>006C8F30    jmp         006C91BA
 006C8F35    test        esi,esi
>006C8F37    jge         006C8F49
 006C8F39    mov         al,1
 006C8F3B    call        00686074
 006C8F40    fstp        qword ptr [esp]
 006C8F43    wait
>006C8F44    jmp         006C91BA
 006C8F49    mov         eax,[0078DB00];^Screen:TScreen
 006C8F4E    mov         eax,dword ptr [eax]
 006C8F50    call        TScreen.GetMonitorCount
 006C8F55    cmp         esi,eax
>006C8F57    jl          006C8F69
 006C8F59    xor         eax,eax
 006C8F5B    call        00686074
 006C8F60    fstp        qword ptr [esp]
 006C8F63    wait
>006C8F64    jmp         006C91BA
 006C8F69    mov         al,1
 006C8F6B    call        00686074
 006C8F70    fstp        qword ptr [esp]
 006C8F73    wait
>006C8F74    jmp         006C91BA
 006C8F79    test        esi,esi
>006C8F7B    jge         006C8F8D
 006C8F7D    mov         al,1
 006C8F7F    call        00686074
 006C8F84    fstp        qword ptr [esp]
 006C8F87    wait
>006C8F88    jmp         006C91BA
 006C8F8D    mov         eax,[0078DB00];^Screen:TScreen
 006C8F92    mov         eax,dword ptr [eax]
 006C8F94    call        TScreen.GetMonitorCount
 006C8F99    cmp         esi,eax
>006C8F9B    jl          006C8FAD
 006C8F9D    xor         eax,eax
 006C8F9F    call        00686074
 006C8FA4    fstp        qword ptr [esp]
 006C8FA7    wait
>006C8FA8    jmp         006C91BA
 006C8FAD    mov         eax,[0078DB00];^Screen:TScreen
 006C8FB2    mov         eax,dword ptr [eax]
 006C8FB4    mov         edx,esi
 006C8FB6    call        TScreen.GetMonitor
 006C8FBB    call        TMonitor.GetPrimary
 006C8FC0    call        00686074
 006C8FC5    fstp        qword ptr [esp]
 006C8FC8    wait
>006C8FC9    jmp         006C91BA
 006C8FCE    test        esi,esi
>006C8FD0    jge         006C8FF3
 006C8FD2    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 006C8FD7    mov         eax,dword ptr [eax]
 006C8FD9    call        TCustomForm.GetMonitor
 006C8FDE    cmp         dword ptr [eax+8],0;TMonitor.FMonitorNum:Integer
 006C8FE2    sete        al
 006C8FE5    call        00686074
 006C8FEA    fstp        qword ptr [esp]
 006C8FED    wait
>006C8FEE    jmp         006C91BA
 006C8FF3    mov         eax,[0078DB00];^Screen:TScreen
 006C8FF8    mov         eax,dword ptr [eax]
 006C8FFA    call        TScreen.GetMonitorCount
 006C8FFF    cmp         esi,eax
>006C9001    jl          006C9013
 006C9003    xor         eax,eax
 006C9005    call        00686074
 006C900A    fstp        qword ptr [esp]
 006C900D    wait
>006C900E    jmp         006C91BA
 006C9013    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 006C9018    mov         eax,dword ptr [eax]
 006C901A    call        TCustomForm.GetMonitor
 006C901F    cmp         esi,dword ptr [eax+8];TMonitor.FMonitorNum:Integer
 006C9022    sete        al
 006C9025    call        00686074
 006C902A    fstp        qword ptr [esp]
 006C902D    wait
>006C902E    jmp         006C91BA
 006C9033    mov         dword ptr [esp+10],14
 006C903B    lea         eax,[esp+10]
 006C903F    push        eax
 006C9040    call        user32.GetCursorInfo
 006C9045    mov         eax,dword ptr [esp+18]
 006C9049    call        005EB23C
 006C904E    mov         dword ptr [esp+24],eax
 006C9052    fild        dword ptr [esp+24]
 006C9056    fstp        qword ptr [esp]
 006C9059    wait
>006C905A    jmp         006C91BA
 006C905F    mov         eax,[0078DB00];^Screen:TScreen
 006C9064    mov         eax,dword ptr [eax]
 006C9066    mov         edx,esi
 006C9068    call        TScreen.GetMonitor
 006C906D    fild        dword ptr [eax+4];TMonitor.FHandle:HMONITOR
 006C9070    fstp        qword ptr [esp]
 006C9073    wait
>006C9074    jmp         006C91BA
 006C9079    push        51
 006C907B    call        user32.GetSystemMetrics
 006C9080    mov         dword ptr [esp+24],eax
 006C9084    fild        dword ptr [esp+24]
 006C9088    fstp        qword ptr [esp]
 006C908B    wait
>006C908C    jmp         006C91BA
 006C9091    movzx       eax,byte ptr ds:[78C268];0x0 gvar_0078C268
 006C9098    call        00686074
 006C909D    fstp        qword ptr [esp]
 006C90A0    wait
>006C90A1    jmp         006C91BA
 006C90A6    mov         eax,dword ptr ds:[81F670];gvar_0081F670:Double
 006C90AC    mov         dword ptr [esp],eax
 006C90AF    mov         eax,dword ptr ds:[81F674];gvar_0081F674
 006C90B5    mov         dword ptr [esp+4],eax
>006C90B9    jmp         006C91BA
 006C90BE    movzx       eax,byte ptr ds:[81F66C];gvar_0081F66C
 006C90C5    mov         dword ptr [esp+24],eax
 006C90C9    fild        dword ptr [esp+24]
 006C90CD    fstp        qword ptr [esp]
 006C90D0    wait
>006C90D1    jmp         006C91BA
 006C90D6    movzx       eax,byte ptr ds:[81F66D];gvar_0081F66D
 006C90DD    mov         dword ptr [esp+24],eax
 006C90E1    fild        dword ptr [esp+24]
 006C90E5    fstp        qword ptr [esp]
 006C90E8    wait
>006C90E9    jmp         006C91BA
 006C90EE    movzx       eax,byte ptr ds:[81F688];gvar_0081F688
 006C90F5    mov         dword ptr [esp+24],eax
 006C90F9    fild        dword ptr [esp+24]
 006C90FD    fstp        qword ptr [esp]
 006C9100    wait
>006C9101    jmp         006C91BA
 006C9106    movzx       eax,byte ptr ds:[81F689];gvar_0081F689
 006C910D    mov         dword ptr [esp+24],eax
 006C9111    fild        dword ptr [esp+24]
 006C9115    fstp        qword ptr [esp]
 006C9118    wait
>006C9119    jmp         006C91BA
 006C911E    mov         eax,[0081F68C];gvar_0081F68C
 006C9123    mov         dword ptr [esp+58],eax
 006C9127    xor         eax,eax
 006C9129    mov         dword ptr [esp+5C],eax
 006C912D    fild        qword ptr [esp+58]
 006C9131    fstp        qword ptr [esp]
 006C9134    wait
>006C9135    jmp         006C91BA
 006C913A    cmp         byte ptr ds:[78C268],0;gvar_0078C268
>006C9141    je          006C9155
 006C9143    cmp         byte ptr ds:[81F688],0;gvar_0081F688
>006C914A    jne         006C9155
 006C914C    cmp         byte ptr ds:[81F689],0;gvar_0081F689
>006C9153    je          006C9159
 006C9155    xor         eax,eax
>006C9157    jmp         006C915B
 006C9159    mov         al,1
 006C915B    call        00686074
 006C9160    fstp        qword ptr [esp]
 006C9163    wait
>006C9164    jmp         006C91BA
 006C9166    movzx       eax,byte ptr ds:[81F688];gvar_0081F688
 006C916D    mov         dword ptr [esp+24],eax
 006C9171    fild        dword ptr [esp+24]
 006C9175    add         esp,0FFFFFFFC
 006C9178    fstp        dword ptr [esp]
 006C917B    wait
 006C917C    movzx       eax,byte ptr ds:[81F689];gvar_0081F689
 006C9183    mov         dword ptr [esp+48],eax
 006C9187    fild        dword ptr [esp+48]
 006C918B    add         esp,0FFFFFFFC
 006C918E    fstp        dword ptr [esp]
 006C9191    wait
 006C9192    call        00454B14
 006C9197    fld         tbyte ptr ds:[6C91CC];2.54:Extended
 006C919D    fdivp       st(1),st
 006C919F    fstp        qword ptr [esp]
 006C91A2    wait
>006C91A3    jmp         006C91BA
 006C91A5    fild        dword ptr ds:[81F63C];gvar_0081F63C:Single
 006C91AB    fstp        qword ptr [esp]
 006C91AE    wait
>006C91AF    jmp         006C91BA
 006C91B1    xor         eax,eax
 006C91B3    mov         dword ptr [esp],eax
 006C91B6    mov         dword ptr [esp+4],eax
 006C91BA    fld         qword ptr [esp]
 006C91BD    add         esp,60
 006C91C0    pop         esi
 006C91C1    pop         ebx
 006C91C2    ret
*}
end;

//006C91D8
{*function sub_006C91D8(?:?; ?:?):?;
begin
 006C91D8    push        ebp
 006C91D9    mov         ebp,esp
 006C91DB    add         esp,0FFFFFF64
 006C91E1    push        ebx
 006C91E2    push        esi
 006C91E3    push        edi
 006C91E4    mov         bl,1
>006C91E6    jmp         006C91F5
 006C91E8    fld         qword ptr [ebp+8]
 006C91EB    fadd        dword ptr ds:[6C93AC];360:Single
 006C91F1    fstp        qword ptr [ebp+8]
 006C91F4    wait
 006C91F5    fld         qword ptr [ebp+8]
 006C91F8    fcomp       dword ptr ds:[6C93B0];0:Single
 006C91FE    wait
 006C91FF    fnstsw      al
 006C9201    sahf
>006C9202    jb          006C91E8
>006C9204    jmp         006C9213
 006C9206    fld         qword ptr [ebp+8]
 006C9209    fsub        dword ptr ds:[6C93AC];360:Single
 006C920F    fstp        qword ptr [ebp+8]
 006C9212    wait
 006C9213    fld         qword ptr [ebp+8]
 006C9216    fcomp       dword ptr ds:[6C93AC];360:Single
 006C921C    wait
 006C921D    fnstsw      al
 006C921F    sahf
>006C9220    jae         006C9206
 006C9222    fld         qword ptr [ebp+8]
 006C9225    fcomp       dword ptr ds:[6C93B4];30:Single
 006C922B    wait
 006C922C    fnstsw      al
 006C922E    sahf
>006C922F    jbe         006C9240
 006C9231    fld         qword ptr [ebp+8]
 006C9234    fcomp       dword ptr ds:[6C93B8];330:Single
 006C923A    wait
 006C923B    fnstsw      al
 006C923D    sahf
>006C923E    jb          006C924D
 006C9240    xor         eax,eax
 006C9242    mov         dword ptr [ebp+8],eax
 006C9245    mov         dword ptr [ebp+0C],eax
>006C9248    jmp         006C92D7
 006C924D    fld         qword ptr [ebp+8]
 006C9250    fcomp       dword ptr ds:[6C93BC];60:Single
 006C9256    wait
 006C9257    fnstsw      al
 006C9259    sahf
>006C925A    jb          006C9279
 006C925C    fld         qword ptr [ebp+8]
 006C925F    fcomp       dword ptr ds:[6C93C0];120:Single
 006C9265    wait
 006C9266    fnstsw      al
 006C9268    sahf
>006C9269    ja          006C9279
 006C926B    xor         eax,eax
 006C926D    mov         dword ptr [ebp+8],eax
 006C9270    mov         dword ptr [ebp+0C],40568000
>006C9277    jmp         006C92D7
 006C9279    fld         qword ptr [ebp+8]
 006C927C    fcomp       dword ptr ds:[6C93C4];150:Single
 006C9282    wait
 006C9283    fnstsw      al
 006C9285    sahf
>006C9286    jb          006C92A5
 006C9288    fld         qword ptr [ebp+8]
 006C928B    fcomp       dword ptr ds:[6C93C8];210:Single
 006C9291    wait
 006C9292    fnstsw      al
 006C9294    sahf
>006C9295    ja          006C92A5
 006C9297    xor         eax,eax
 006C9299    mov         dword ptr [ebp+8],eax
 006C929C    mov         dword ptr [ebp+0C],40668000
>006C92A3    jmp         006C92D7
 006C92A5    fld         qword ptr [ebp+8]
 006C92A8    fcomp       dword ptr ds:[6C93CC];240:Single
 006C92AE    wait
 006C92AF    fnstsw      al
 006C92B1    sahf
>006C92B2    jb          006C93A0
 006C92B8    fld         qword ptr [ebp+8]
 006C92BB    fcomp       dword ptr ds:[6C93D0];270:Single
 006C92C1    wait
 006C92C2    fnstsw      al
 006C92C4    sahf
>006C92C5    ja          006C93A0
 006C92CB    xor         eax,eax
 006C92CD    mov         dword ptr [ebp+8],eax
 006C92D0    mov         dword ptr [ebp+0C],0C0568000
 006C92D7    fild        dword ptr ds:[81F660];gvar_0081F660:Single
 006C92DD    fcomp       qword ptr [ebp+8]
 006C92E0    wait
 006C92E1    fnstsw      al
 006C92E3    sahf
>006C92E4    je          006C93A0
 006C92EA    mov         esi,81F5C4;gvar_0081F5C4:Pointer
 006C92EF    lea         edi,[ebp-9C]
 006C92F5    mov         ecx,27
 006C92FA    rep movs    dword ptr [edi],dword ptr [esi]
 006C92FC    mov         word ptr [ebp-78],9C
 006C9302    mov         dword ptr [ebp-74],180080
 006C9309    fld         qword ptr [ebp+8]
 006C930C    fcomp       dword ptr ds:[6C93B0];0:Single
 006C9312    wait
 006C9313    fnstsw      al
 006C9315    sahf
>006C9316    jne         006C931F
 006C9318    xor         eax,eax
 006C931A    mov         dword ptr [ebp-68],eax
>006C931D    jmp         006C9385
 006C931F    fld         qword ptr [ebp+8]
 006C9322    fcomp       dword ptr ds:[6C93D4];90:Single
 006C9328    wait
 006C9329    fnstsw      al
 006C932B    sahf
>006C932C    jne         006C9347
 006C932E    mov         dword ptr [ebp-68],1
 006C9335    mov         eax,[0081F634];gvar_0081F634
 006C933A    mov         dword ptr [ebp-30],eax
 006C933D    mov         eax,[0081F630];gvar_0081F630
 006C9342    mov         dword ptr [ebp-2C],eax
>006C9345    jmp         006C9385
 006C9347    fld         qword ptr [ebp+8]
 006C934A    fcomp       dword ptr ds:[6C93D8];180:Single
 006C9350    wait
 006C9351    fnstsw      al
 006C9353    sahf
>006C9354    jne         006C935F
 006C9356    mov         dword ptr [ebp-68],2
>006C935D    jmp         006C9385
 006C935F    fld         qword ptr [ebp+8]
 006C9362    fcomp       dword ptr ds:[6C93DC];-90:Single
 006C9368    wait
 006C9369    fnstsw      al
 006C936B    sahf
>006C936C    jne         006C9385
 006C936E    mov         dword ptr [ebp-68],3
 006C9375    mov         eax,[0081F634];gvar_0081F634
 006C937A    mov         dword ptr [ebp-30],eax
 006C937D    mov         eax,[0081F630];gvar_0081F630
 006C9382    mov         dword ptr [ebp-2C],eax
 006C9385    fld         qword ptr [ebp+8]
 006C9388    call        @ROUND
 006C938D    mov         [0081F660],eax;gvar_0081F660:Single
 006C9392    push        0
 006C9394    lea         eax,[ebp-9C]
 006C939A    push        eax
 006C939B    call        user32.ChangeDisplaySettingsA
 006C93A0    mov         eax,ebx
 006C93A2    pop         edi
 006C93A3    pop         esi
 006C93A4    pop         ebx
 006C93A5    mov         esp,ebp
 006C93A7    pop         ebp
 006C93A8    ret         8
end;*}

//006C93E0
{*function TScreenValue.SetValue(NewValue:Double; ?:?):Boolean;
begin
 006C93E0    push        ebp
 006C93E1    mov         ebp,esp
 006C93E3    push        ebx
 006C93E4    mov         bl,1
 006C93E6    mov         eax,dword ptr [eax+20];TScreenValue..............................Item:Integer
 006C93E9    sub         eax,62
>006C93EC    je          006C93F6
 006C93EE    dec         eax
>006C93EF    je          006C9404
 006C93F1    dec         eax
>006C93F2    je          006C9412
>006C93F4    jmp         006C941F
 006C93F6    fld         qword ptr [ebp+8]
 006C93F9    fchs
 006C93FB    fstp        qword ptr ds:[81F698];gvar_0081F698:Double
 006C9401    wait
>006C9402    jmp         006C9421
 006C9404    fld         qword ptr [ebp+8]
 006C9407    fchs
 006C9409    fstp        qword ptr ds:[81F6A0];gvar_0081F6A0:Double
 006C940F    wait
>006C9410    jmp         006C9421
 006C9412    push        dword ptr [ebp+0C]
 006C9415    push        dword ptr [ebp+8]
 006C9418    call        006C91D8
>006C941D    jmp         006C9421
 006C941F    xor         ebx,ebx
 006C9421    mov         eax,ebx
 006C9423    pop         ebx
 006C9424    pop         ebp
 006C9425    ret         8
end;*}

//006C9428
{*procedure TScreenValue.ToString(?:?);
begin
 006C9428    push        ebp
 006C9429    mov         ebp,esp
 006C942B    push        0
 006C942D    push        0
 006C942F    push        ebx
 006C9430    push        esi
 006C9431    push        edi
 006C9432    mov         esi,edx
 006C9434    mov         ebx,eax
 006C9436    xor         eax,eax
 006C9438    push        ebp
 006C9439    push        6C94AF
 006C943E    push        dword ptr fs:[eax]
 006C9441    mov         dword ptr fs:[eax],esp
 006C9444    mov         edi,dword ptr [ebx+18];TScreenValue........................................................
 006C9447    test        edi,edi
>006C9449    jge         006C9459
 006C944B    mov         eax,esi
 006C944D    mov         edx,6C94CC;'Screen'
 006C9452    call        @UStrAsg
>006C9457    jmp         006C9473
 006C9459    lea         edx,[ebp-4]
 006C945C    mov         eax,edi
 006C945E    inc         eax
 006C945F    call        IntToStr
 006C9464    mov         ecx,dword ptr [ebp-4]
 006C9467    mov         eax,esi
 006C9469    mov         edx,6C94CC;'Screen'
 006C946E    call        @UStrCat3
 006C9473    push        dword ptr [esi]
 006C9475    push        6C94E8;'.'
 006C947A    lea         edx,[ebp-8]
 006C947D    mov         eax,dword ptr [ebx+20];TScreenValue...............................Item:Integer
 006C9480    call        006C77A8
 006C9485    push        dword ptr [ebp-8]
 006C9488    mov         eax,esi
 006C948A    mov         edx,3
 006C948F    call        @UStrCatN
 006C9494    xor         eax,eax
 006C9496    pop         edx
 006C9497    pop         ecx
 006C9498    pop         ecx
 006C9499    mov         dword ptr fs:[eax],edx
 006C949C    push        6C94B6
 006C94A1    lea         eax,[ebp-8]
 006C94A4    mov         edx,2
 006C94A9    call        @UStrArrayClr
 006C94AE    ret
>006C94AF    jmp         @HandleFinally
>006C94B4    jmp         006C94A1
 006C94B6    pop         edi
 006C94B7    pop         esi
 006C94B8    pop         ebx
 006C94B9    pop         ecx
 006C94BA    pop         ecx
 006C94BB    pop         ebp
 006C94BC    ret
end;*}

//006C94EC
procedure sub_006C94EC;
begin
{*
 006C94EC    push        ebp
 006C94ED    mov         ebp,esp
 006C94EF    add         esp,0FFFFFFF8
 006C94F2    push        ebx
 006C94F3    push        esi
 006C94F4    push        edi
 006C94F5    xor         eax,eax
 006C94F7    mov         dword ptr [ebp-4],eax
 006C94FA    xor         eax,eax
 006C94FC    push        ebp
 006C94FD    push        6C963F
 006C9502    push        dword ptr fs:[eax]
 006C9505    mov         dword ptr fs:[eax],esp
 006C9508    xor         edx,edx
 006C950A    push        ebp
 006C950B    push        6C9607
 006C9510    push        dword ptr fs:[edx]
 006C9513    mov         dword ptr fs:[edx],esp
 006C9516    lea         eax,[ebp-4]
 006C9519    mov         edx,100
 006C951E    call        @UStrSetLength
 006C9523    lea         eax,[ebp-4]
 006C9526    call        @UniqueStringU
 006C952B    call        006C4B88
 006C9530    test        al,al
>006C9532    je          006C95F6
 006C9538    mov         byte ptr ds:[78C268],1;gvar_0078C268
 006C953F    lea         eax,[ebp-4]
 006C9542    call        @UniqueStringU
 006C9547    call        006C4B58
 006C954C    fstp        qword ptr ds:[81F670];gvar_0081F670:Double
 006C9552    wait
 006C9553    lea         eax,[ebp-4]
 006C9556    call        @UniqueStringU
 006C955B    mov         ecx,81F66D;gvar_0081F66D
 006C9560    mov         edx,81F66C;gvar_0081F66C
 006C9565    call        006C49E4
 006C956A    lea         eax,[ebp-4]
 006C956D    call        @UniqueStringU
 006C9572    mov         ecx,81F689;gvar_0081F689
 006C9577    mov         edx,81F688;gvar_0081F688
 006C957C    call        006C49F4
 006C9581    mov         eax,81F680;gvar_0081F680:UnicodeString
 006C9586    call        @UStrClr
 006C958B    push        eax
 006C958C    mov         eax,81F684;gvar_0081F684:UnicodeString
 006C9591    call        @UStrClr
 006C9596    push        eax
 006C9597    lea         eax,[ebp-4]
 006C959A    call        @UniqueStringU
 006C959F    push        eax
 006C95A0    mov         eax,81F67C;gvar_0081F67C:UnicodeString
 006C95A5    call        @UStrClr
 006C95AA    push        eax
 006C95AB    mov         eax,81F678;gvar_0081F678:UnicodeString
 006C95B0    call        @UStrClr
 006C95B5    mov         edx,eax
 006C95B7    pop         ecx
 006C95B8    pop         eax
 006C95B9    call        006C4A50
 006C95BE    lea         eax,[ebp-4]
 006C95C1    call        @UniqueStringU
 006C95C6    call        006C4A04
 006C95CB    mov         [0081F68C],eax;gvar_0081F68C
 006C95D0    cmp         byte ptr ds:[81F688],0;gvar_0081F688
>006C95D7    je          006C95FD
 006C95D9    movzx       eax,byte ptr ds:[81F688];gvar_0081F688
 006C95E0    mov         dword ptr [ebp-8],eax
 006C95E3    fild        dword ptr [ebp-8]
 006C95E6    fdiv        dword ptr ds:[6C9650];100:Single
 006C95EC    mov         eax,[0078D154];^gvar_0078BDD8:Double
 006C95F1    fstp        qword ptr [eax]
 006C95F3    wait
>006C95F4    jmp         006C95FD
 006C95F6    mov         byte ptr ds:[78C268],0;gvar_0078C268
 006C95FD    xor         eax,eax
 006C95FF    pop         edx
 006C9600    pop         ecx
 006C9601    pop         ecx
 006C9602    mov         dword ptr fs:[eax],edx
>006C9605    jmp         006C9629
>006C9607    jmp         @HandleOnException
 006C960C    dd          1
 006C9610    dd          00418C04;Exception
 006C9614    dd          006C9618
 006C9618    mov         byte ptr ds:[78C268],0;gvar_0078C268
 006C961F    call        004FA644
 006C9624    call        @DoneExcept
 006C9629    xor         eax,eax
 006C962B    pop         edx
 006C962C    pop         ecx
 006C962D    pop         ecx
 006C962E    mov         dword ptr fs:[eax],edx
 006C9631    push        6C9646
 006C9636    lea         eax,[ebp-4]
 006C9639    call        @UStrClr
 006C963E    ret
>006C963F    jmp         @HandleFinally
>006C9644    jmp         006C9636
 006C9646    pop         edi
 006C9647    pop         esi
 006C9648    pop         ebx
 006C9649    pop         ecx
 006C964A    pop         ecx
 006C964B    pop         ebp
 006C964C    ret
*}
end;

//006C9654
procedure sub_006C9654;
begin
{*
 006C9654    push        ebp
 006C9655    mov         ebp,esp
 006C9657    pop         ebp
 006C9658    ret         8
*}
end;

Initialization
//007825B4
{*
 007825B4    push        ebp
 007825B5    mov         ebp,esp
 007825B7    push        ebx
 007825B8    push        esi
 007825B9    push        edi
 007825BA    xor         eax,eax
 007825BC    push        ebp
 007825BD    push        782695
 007825C2    push        dword ptr fs:[eax]
 007825C5    mov         dword ptr fs:[eax],esp
 007825C8    sub         dword ptr ds:[81F664],1
>007825CF    jae         00782687
 007825D5    xor         edx,edx
 007825D7    push        ebp
 007825D8    push        78266C
 007825DD    push        dword ptr fs:[edx]
 007825E0    mov         dword ptr fs:[edx],esp
 007825E3    mov         eax,7826B0;'Initializing PieScreen'
 007825E8    call        004FA5FC
 007825ED    push        7826E0
 007825F2    push        782710;'user32'
 007825F7    call        kernel32.GetModuleHandleW
 007825FC    push        eax
 007825FD    call        GetProcAddress
 00782602    mov         [0081F5BC],eax;gvar_0081F5BC:Pointer
 00782607    cmp         dword ptr ds:[81F5BC],0;gvar_0081F5BC:Pointer
>0078260E    jne         0078261A
 00782610    mov         dword ptr ds:[81F5BC],6C9654
 0078261A    push        782720
 0078261F    push        782710;'user32'
 00782624    call        kernel32.GetModuleHandleW
 00782629    push        eax
 0078262A    call        GetProcAddress
 0078262F    mov         [0081F5C0],eax;gvar_0081F5C0:Pointer
 00782634    cmp         dword ptr ds:[81F5C0],0;gvar_0081F5C0:Pointer
>0078263B    jne         00782647
 0078263D    mov         dword ptr ds:[81F5C0],6C9654
 00782647    mov         dl,1
 00782649    mov         eax,[0067D4A4];THashTable
 0078264E    call        THashTable.Create;THashTable.Create
 00782653    mov         [0081F668],eax;gvar_0081F668:THashTable
 00782658    call        006C59E4
 0078265D    call        006C94EC
 00782662    xor         eax,eax
 00782664    pop         edx
 00782665    pop         ecx
 00782666    pop         ecx
 00782667    mov         dword ptr fs:[eax],edx
>0078266A    jmp         00782687
>0078266C    jmp         @HandleOnException
 00782671    dd          1
 00782675    dd          00418C04;Exception
 00782679    dd          0078267D
 0078267D    call        004FA644
 00782682    call        @DoneExcept
 00782687    xor         eax,eax
 00782689    pop         edx
 0078268A    pop         ecx
 0078268B    pop         ecx
 0078268C    mov         dword ptr fs:[eax],edx
 0078268F    push        78269C
 00782694    ret
>00782695    jmp         @HandleFinally
>0078269A    jmp         00782694
 0078269C    pop         edi
 0078269D    pop         esi
 0078269E    pop         ebx
 0078269F    pop         ebp
 007826A0    ret
*}
Finalization
//006C965C
{*
 006C965C    push        ebp
 006C965D    mov         ebp,esp
 006C965F    push        ebx
 006C9660    push        esi
 006C9661    push        edi
 006C9662    xor         eax,eax
 006C9664    push        ebp
 006C9665    push        6C9702
 006C966A    push        dword ptr fs:[eax]
 006C966D    mov         dword ptr fs:[eax],esp
 006C9670    inc         dword ptr ds:[81F664]
>006C9676    jne         006C96F4
 006C9678    xor         edx,edx
 006C967A    push        ebp
 006C967B    push        6C96B1
 006C9680    push        dword ptr fs:[edx]
 006C9683    mov         dword ptr fs:[edx],esp
 006C9686    mov         eax,6C971C;'Finalizing PieScreen'
 006C968B    call        004FA5FC
 006C9690    mov         eax,[0081F668];gvar_0081F668:THashTable
 006C9695    xor         edx,edx
 006C9697    mov         dword ptr ds:[81F668],edx;gvar_0081F668:THashTable
 006C969D    call        TObject.Free
 006C96A2    call        006C7694
 006C96A7    xor         eax,eax
 006C96A9    pop         edx
 006C96AA    pop         ecx
 006C96AB    pop         ecx
 006C96AC    mov         dword ptr fs:[eax],edx
>006C96AF    jmp         006C96CC
>006C96B1    jmp         @HandleOnException
 006C96B6    dd          1
 006C96BA    dd          00418C04;Exception
 006C96BE    dd          006C96C2
 006C96C2    call        004FA644
 006C96C7    call        @DoneExcept
 006C96CC    mov         eax,81F678;gvar_0081F678:UnicodeString
 006C96D1    call        @UStrClr
 006C96D6    mov         eax,81F67C;gvar_0081F67C:UnicodeString
 006C96DB    call        @UStrClr
 006C96E0    mov         eax,81F680;gvar_0081F680:UnicodeString
 006C96E5    call        @UStrClr
 006C96EA    mov         eax,81F684;gvar_0081F684:UnicodeString
 006C96EF    call        @UStrClr
 006C96F4    xor         eax,eax
 006C96F6    pop         edx
 006C96F7    pop         ecx
 006C96F8    pop         ecx
 006C96F9    mov         dword ptr fs:[eax],edx
 006C96FC    push        6C9709
 006C9701    ret
>006C9702    jmp         @HandleFinally
>006C9707    jmp         006C9701
 006C9709    pop         edi
 006C970A    pop         esi
 006C970B    pop         ebx
 006C970C    pop         ebp
 006C970D    ret
*}
end.