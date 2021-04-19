//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit uTextDrawer;

interface

uses
  SysUtils, Classes, uTextDrawer;

type
  TheFontData = TheFontData = record//size=14
Style:TFontStyles;//f0
Handle:HFONT;//f4
CharAdv:Integer;//f8
DBCharAdv:Integer;//fC
CharHeight:Integer;//f10
end;;
  TheFontsData = array [TheStockFontPatterns] of TheFontData;
  TheSharedFontsInfo = TheSharedFontsInfo = record//size=1C0
RefCount:Integer;//f0
LockCount:Integer;//f4
BaseFont:TFont;//f8
BaseLF:tagLOGFONTW;//fC
IsDBCSFont:Boolean;//f68
IsTrueType:Boolean;//f69
FontsData:TheFontsData;//f6C
end;;
  TheFontsInfoManager = class(TObject)
  published
    procedure UnLockFontsInfo(pFontsInfo:PheSharedFontsInfo);//00515D3C
    function GetFontsInfo(ABaseFont:TFont):PheSharedFontsInfo;//00515E24
    procedure ReleaseFontsInfo(pFontsInfo:PheSharedFontsInfo);//00515E70
    constructor Create;//00515C20
    destructor Destroy();//00515D50
    procedure LockFontsInfo(pFontsInfo:PheSharedFontsInfo);//00515C1C
  public
    ............FFontsInfo:TList;//f4
  end;
  EheFontStockException = class(Exception)
  end;
  TheFontStock = class(TObject)
  published
    procedure ReleaseFontHandles;//0051610C
    destructor Destroy();//00516024
    constructor Create(InitialFont:TFont);//00515FE0
  public
    FDC:HDC;//f4
    FDCRefCount:Integer;//f8
    FpInfo:PheSharedFontsInfo;//fC
    FUsingFontHandles:Boolean;//f10
    FCrntFont:HFONT;//f14
    FCrntStyle:TFontStyles;//f18
    FpCrntFontData:PheFontData;//f1C
    FBaseLF:tagLOGFONTW;//f20
    destructor Destroy(); virtual;//00516024
    //function v0:?; virtual;//v0//005160D0
    procedure v4; virtual;//v4//005160EC
    //procedure v8(?:?); virtual;//v8//0051608C
    //function vC(?:?; ?:?; ?:?):?; virtual;//vC//00515EE0
    //function v10:?; virtual;//v10//00516058
    //function v14:?; virtual;//v14//00516060
    //function v18:?; virtual;//v18//00516068
    //function v1C(?:?):?; virtual;//v1C//00516070
    //procedure v20(?:?); virtual;//v20//00516160
    //procedure v24(?:?); virtual;//v24//00516230
    constructor Create(InitialFont:TFont); virtual;//v28//00515FE0
    procedure ReleaseFontHandles; virtual;//v2C//0051610C
  end;
  EheTextDrawerException = class(Exception)
  end;
  TheTextDrawer = class(TObject)
  published
    procedure SetStyle(Value:TFontStyles);//00516564
    procedure SetBaseStyle(Value:TFontStyles);//00516520
    procedure SetBaseFont(Value:TFont);//0051645C
    procedure SetForeColor(Value:TColor);//005165A0
    procedure ReleaseTemporaryResources;//005166E8
    procedure SetCharExtra(Value:Integer);//005165F0
    procedure SetBackColor(Value:TColor);//005165C8
    procedure ExtTextOut(X:Integer; Y:Integer; Length:Integer; Text:PWideChar; ARect:TRect; fuOptions:Cardinal);//00516694
    function GetCharWidth:Integer;//0051644C
    destructor Destroy();//00516378
    constructor Create(CalcExtentBaseStyle:TFontStyles; BaseFont:TFont);//00516304
    function GetCharHeight:Integer;//00516458
    procedure TextOut(X:Integer; Y:Integer; Length:Integer; Text:PWideChar);//00516614
    procedure EndDrawing;//0051641C
    procedure BeginDrawing(DC:HDC);//005163CC
  public
    FDC:HDC;//f4
    FSaveDC:Integer;//f8
    FFontStock:TheFontStock;//fC
    FCalcExtentBaseStyle:TFontStyles;//f10
    FBaseCharWidth:Integer;//f14
    FBaseCharHeight:Integer;//f18
    FCrntFont:HFONT;//f1C
    FETODist:Pointer;//f20
    FETOSizeInChar:Integer;//f24
    FColor:TColor;//f28
    FBkColor:TColor;//f2C
    FCharExtra:Integer;//f30
    FDrawingCount:Integer;//f34
    destructor Destroy(); virtual;//00516378
    procedure v0; virtual;//v0//005163AC
    procedure v4; virtual;//v4//0051658C
    procedure v8; virtual;//v8//00516604
    constructor Create(CalcExtentBaseStyle:TFontStyles; BaseFont:TFont); virtual;//vC//00516304
    function GetCharWidth:Integer; virtual;//v10//0051644C
    function GetCharHeight:Integer; virtual;//v14//00516458
    procedure BeginDrawing(DC:HDC); virtual;//v18//005163CC
    procedure EndDrawing; virtual;//v1C//0051641C
    procedure TextOut(X:Integer; Y:Integer; Length:Integer; Text:PWideChar); virtual;//v20//00516614
    procedure ExtTextOut(X:Integer; Y:Integer; Length:Integer; Text:PWideChar; ARect:TRect; fuOptions:Cardinal); virtual;//v24//00516694
    procedure SetBaseFont(Value:TFont); virtual;//v28//0051645C
    procedure SetBaseStyle(Value:TFontStyles); virtual;//v2C//00516520
    procedure SetStyle(Value:TFontStyles); virtual;//v30//00516564
    procedure SetForeColor(Value:TColor); virtual;//v34//005165A0
    procedure SetBackColor(Value:TColor); virtual;//v38//005165C8
    procedure SetCharExtra(Value:Integer); virtual;//v3C//005165F0
    procedure ReleaseTemporaryResources; virtual;//v40//005166E8
  end;
    //function sub_00515BFC:?;//00515BFC
    //function sub_00515C64(?:TheFontsInfoManager; ?:TFont; ?:?):?;//00515C64
    procedure sub_00515DB0(?:TheFontsInfoManager; ?:PheSharedFontsInfo);//00515DB0
    //function sub_00515DDC(?:TheFontsInfoManager; ?:?):?;//00515DDC
    //procedure sub_00515EA4(?:TheFontsInfoManager; ?:TFont; ?:?);//00515EA4
    //function sub_00515EE0(?:?; ?:?; ?:?):?;//00515EE0
    //function sub_00516058:?;//00516058
    //function sub_00516060:?;//00516060
    //function sub_00516068:?;//00516068
    //function sub_00516070(?:?):?;//00516070
    //function sub_0051607C(?:TheFontStock):?;//0051607C
    //procedure sub_0051608C(?:?);//0051608C
    //function sub_005160D0:?;//005160D0
    procedure sub_005160EC;//005160EC
    procedure sub_00516128(?:TheFontStock);//00516128
    //procedure sub_00516160(?:?);//00516160
    //procedure sub_00516230(?:?);//00516230
    procedure sub_005162E8(?:TheFontStock);//005162E8
    procedure sub_005163AC;//005163AC
    procedure sub_0051658C;//0051658C
    procedure sub_00516604;//00516604
    //procedure sub_00516630(?:Integer; ?:?);//00516630

implementation

//00515BFC
{*function sub_00515BFC:?;
begin
 00515BFC    cmp         dword ptr ds:[793B1C],0;gvar_00793B1C:TheFontsInfoManager
>00515C03    jne         00515C16
 00515C05    mov         dl,1
 00515C07    mov         eax,[00514D48];TheFontsInfoManager
 00515C0C    call        TheFontsInfoManager.Create;TheFontsInfoManager.Create
 00515C11    mov         [00793B1C],eax;gvar_00793B1C:TheFontsInfoManager
 00515C16    mov         eax,[00793B1C];gvar_00793B1C:TheFontsInfoManager
 00515C1B    ret
end;*}

//00515C1C
procedure TheFontsInfoManager.LockFontsInfo(pFontsInfo:PheSharedFontsInfo);
begin
{*
 00515C1C    inc         dword ptr [edx+4]
 00515C1F    ret
*}
end;

//00515C20
constructor TheFontsInfoManager.Create;
begin
{*
 00515C20    push        ebx
 00515C21    push        esi
 00515C22    test        dl,dl
>00515C24    je          00515C2E
 00515C26    add         esp,0FFFFFFF0
 00515C29    call        @ClassCreate
 00515C2E    mov         ebx,edx
 00515C30    mov         esi,eax
 00515C32    xor         edx,edx
 00515C34    mov         eax,esi
 00515C36    call        TObject.Create
 00515C3B    mov         dl,1
 00515C3D    mov         eax,[00439644];TList
 00515C42    call        TObject.Create;TList.Create
 00515C47    mov         dword ptr [esi+4],eax;TheFontsInfoManager..............FFontsInfo:TList
 00515C4A    mov         eax,esi
 00515C4C    test        bl,bl
>00515C4E    je          00515C5F
 00515C50    call        @AfterConstruction
 00515C55    pop         dword ptr fs:[0]
 00515C5C    add         esp,0C
 00515C5F    mov         eax,esi
 00515C61    pop         esi
 00515C62    pop         ebx
 00515C63    ret
*}
end;

//00515C64
{*function sub_00515C64(?:TheFontsInfoManager; ?:TFont; ?:?):?;
begin
 00515C64    push        ebp
 00515C65    mov         ebp,esp
 00515C67    push        ecx
 00515C68    push        ebx
 00515C69    push        esi
 00515C6A    push        edi
 00515C6B    mov         esi,ecx
 00515C6D    mov         edi,edx
 00515C6F    mov         eax,1C0
 00515C74    call        @GetMem
 00515C79    mov         dword ptr [ebp-4],eax
 00515C7C    mov         ebx,dword ptr [ebp-4]
 00515C7F    mov         eax,ebx
 00515C81    xor         ecx,ecx
 00515C83    mov         edx,1C0
 00515C88    call        @FillChar
 00515C8D    xor         eax,eax
 00515C8F    push        ebp
 00515C90    push        515D0C
 00515C95    push        dword ptr fs:[eax]
 00515C98    mov         dword ptr fs:[eax],esp
 00515C9B    mov         dl,1
 00515C9D    mov         eax,[0045FAE8];TFont
 00515CA2    call        TFont.Create;TFont.Create
 00515CA7    mov         dword ptr [ebx+8],eax
 00515CAA    mov         eax,dword ptr [ebx+8]
 00515CAD    mov         edx,edi
 00515CAF    mov         ecx,dword ptr [eax]
 00515CB1    call        dword ptr [ecx+8]
 00515CB4    push        esi
 00515CB5    push        edi
 00515CB6    lea         edi,[ebx+0C]
 00515CB9    mov         ecx,17
 00515CBE    rep movs    dword ptr [edi],dword ptr [esi]
 00515CC0    pop         edi
 00515CC1    pop         esi
 00515CC2    test        byte ptr [esi+1B],4
 00515CC6    setne       al
 00515CC9    mov         byte ptr [ebx+69],al
 00515CCC    push        0
 00515CCE    call        user32.GetDC
 00515CD3    mov         esi,eax
 00515CD5    mov         eax,edi
 00515CD7    call        TFont.GetHandle
 00515CDC    push        eax
 00515CDD    push        esi
 00515CDE    call        gdi32.SelectObject
 00515CE3    mov         edi,eax
 00515CE5    push        esi
 00515CE6    call        gdi32.GetFontLanguageInfo
 00515CEB    test        al,1
 00515CED    setne       al
 00515CF0    mov         byte ptr [ebx+68],al
 00515CF3    push        edi
 00515CF4    push        esi
 00515CF5    call        gdi32.SelectObject
 00515CFA    push        esi
 00515CFB    push        0
 00515CFD    call        user32.ReleaseDC
 00515D02    xor         eax,eax
 00515D04    pop         edx
 00515D05    pop         ecx
 00515D06    pop         ecx
 00515D07    mov         dword ptr fs:[eax],edx
>00515D0A    jmp         00515D33
>00515D0C    jmp         @HandleAnyException
 00515D11    mov         eax,dword ptr [ebp-4]
 00515D14    mov         eax,dword ptr [eax+8]
 00515D17    call        TObject.Free
 00515D1C    mov         edx,1C0
 00515D21    mov         eax,dword ptr [ebp-4]
 00515D24    call        @FreeMem
 00515D29    call        @RaiseAgain
 00515D2E    call        @DoneExcept
 00515D33    mov         eax,dword ptr [ebp-4]
 00515D36    pop         edi
 00515D37    pop         esi
 00515D38    pop         ebx
 00515D39    pop         ecx
 00515D3A    pop         ebp
 00515D3B    ret
end;*}

//00515D3C
procedure TheFontsInfoManager.UnLockFontsInfo(pFontsInfo:PheSharedFontsInfo);
begin
{*
 00515D3C    mov         ecx,edx
 00515D3E    dec         dword ptr [ecx+4]
 00515D41    cmp         dword ptr [ecx+4],0
>00515D45    jne         00515D4C
 00515D47    call        00515DB0
 00515D4C    ret
*}
end;

//00515D50
destructor TheFontsInfoManager.Destroy();
begin
{*
 00515D50    push        ebx
 00515D51    push        esi
 00515D52    push        edi
 00515D53    push        ebp
 00515D54    call        @BeforeDestruction
 00515D59    mov         ebx,edx
 00515D5B    mov         ebp,eax
 00515D5D    xor         eax,eax
 00515D5F    mov         [00793B1C],eax;gvar_00793B1C:TheFontsInfoManager
 00515D64    cmp         dword ptr [ebp+4],0;TheFontsInfoManager...............FFontsInfo:TList
>00515D68    je          00515D91
>00515D6A    jmp         00515D7F
 00515D6C    mov         edx,edi
 00515D6E    dec         edx
 00515D6F    mov         eax,esi
 00515D71    call        TList.Get
 00515D76    mov         edx,eax
 00515D78    mov         eax,ebp
 00515D7A    call        TheFontsInfoManager.ReleaseFontsInfo
 00515D7F    mov         esi,dword ptr [ebp+4];TheFontsInfoManager................FFontsInfo:TList
 00515D82    mov         edi,dword ptr [esi+8];TList.FCount:Integer
 00515D85    test        edi,edi
>00515D87    jg          00515D6C
 00515D89    mov         eax,dword ptr [ebp+4];TheFontsInfoManager.................FFontsInfo:TList
 00515D8C    call        TObject.Free
 00515D91    mov         edx,ebx
 00515D93    and         dl,0FC
 00515D96    mov         eax,ebp
 00515D98    call        TObject.Destroy
 00515D9D    test        bl,bl
>00515D9F    jle         00515DA8
 00515DA1    mov         eax,ebp
 00515DA3    call        @ClassDestroy
 00515DA8    pop         ebp
 00515DA9    pop         edi
 00515DAA    pop         esi
 00515DAB    pop         ebx
 00515DAC    ret
*}
end;

//00515DB0
procedure sub_00515DB0(?:TheFontsInfoManager; ?:PheSharedFontsInfo);
begin
{*
 00515DB0    push        ebx
 00515DB1    push        esi
 00515DB2    push        edi
 00515DB3    mov         edi,edx
 00515DB5    xor         ebx,ebx
 00515DB7    lea         eax,[ebx+ebx*4]
 00515DBA    lea         esi,[edi+eax*4+6C]
 00515DBE    mov         eax,dword ptr [esi+4]
 00515DC1    test        eax,eax
>00515DC3    je          00515DD0
 00515DC5    push        eax
 00515DC6    call        gdi32.DeleteObject
 00515DCB    xor         eax,eax
 00515DCD    mov         dword ptr [esi+4],eax
 00515DD0    inc         ebx
 00515DD1    cmp         ebx,11
>00515DD4    jne         00515DB7
 00515DD6    pop         edi
 00515DD7    pop         esi
 00515DD8    pop         ebx
 00515DD9    ret
*}
end;

//00515DDC
{*function sub_00515DDC(?:TheFontsInfoManager; ?:?):?;
begin
 00515DDC    push        ebx
 00515DDD    push        esi
 00515DDE    push        edi
 00515DDF    push        ebp
 00515DE0    push        ecx
 00515DE1    mov         dword ptr [esp],edx
 00515DE4    mov         ebp,eax
 00515DE6    mov         eax,dword ptr [ebp+4]
 00515DE9    mov         ebx,dword ptr [eax+8]
 00515DEC    dec         ebx
 00515DED    test        ebx,ebx
>00515DEF    jl          00515E18
 00515DF1    inc         ebx
 00515DF2    xor         edi,edi
 00515DF4    mov         eax,dword ptr [ebp+4]
 00515DF7    mov         edx,edi
 00515DF9    call        TList.Get
 00515DFE    mov         esi,eax
 00515E00    mov         edx,dword ptr [esp]
 00515E03    lea         eax,[esi+0C]
 00515E06    mov         ecx,5C
 00515E0B    call        CompareMem
 00515E10    test        al,al
>00515E12    jne         00515E1A
 00515E14    inc         edi
 00515E15    dec         ebx
>00515E16    jne         00515DF4
 00515E18    xor         esi,esi
 00515E1A    mov         eax,esi
 00515E1C    pop         edx
 00515E1D    pop         ebp
 00515E1E    pop         edi
 00515E1F    pop         esi
 00515E20    pop         ebx
 00515E21    ret
end;*}

//00515E24
function TheFontsInfoManager.GetFontsInfo(ABaseFont:TFont):PheSharedFontsInfo;
begin
{*
 00515E24    push        ebx
 00515E25    push        esi
 00515E26    push        edi
 00515E27    add         esp,0FFFFFFA4
 00515E2A    mov         edi,edx
 00515E2C    mov         esi,eax
 00515E2E    mov         ecx,esp
 00515E30    mov         edx,edi
 00515E32    mov         eax,esi
 00515E34    call        00515EA4
 00515E39    mov         edx,esp
 00515E3B    mov         eax,esi
 00515E3D    call        00515DDC
 00515E42    mov         ebx,eax
 00515E44    test        ebx,ebx
>00515E46    jne         00515E5F
 00515E48    mov         ecx,esp
 00515E4A    mov         edx,edi
 00515E4C    mov         eax,esi
 00515E4E    call        00515C64
 00515E53    mov         ebx,eax
 00515E55    mov         edx,ebx
 00515E57    mov         eax,dword ptr [esi+4];TheFontsInfoManager..................FFontsInfo:TList
 00515E5A    call        TList.Add
 00515E5F    test        ebx,ebx
>00515E61    je          00515E65
 00515E63    inc         dword ptr [ebx]
 00515E65    mov         eax,ebx
 00515E67    add         esp,5C
 00515E6A    pop         edi
 00515E6B    pop         esi
 00515E6C    pop         ebx
 00515E6D    ret
*}
end;

//00515E70
procedure TheFontsInfoManager.ReleaseFontsInfo(pFontsInfo:PheSharedFontsInfo);
begin
{*
 00515E70    push        ebx
 00515E71    push        esi
 00515E72    mov         esi,edx
 00515E74    mov         ebx,esi
 00515E76    cmp         dword ptr [ebx],1
>00515E79    jle         00515E80
 00515E7B    dec         dword ptr [ebx]
 00515E7D    pop         esi
 00515E7E    pop         ebx
 00515E7F    ret
 00515E80    mov         edx,esi
 00515E82    mov         eax,dword ptr [eax+4];TheFontsInfoManager...................FFontsInfo:TList
 00515E85    xor         ecx,ecx
 00515E87    call        TList.RemoveItem
 00515E8C    mov         eax,dword ptr [ebx+8]
 00515E8F    call        TObject.Free
 00515E94    mov         edx,1C0
 00515E99    mov         eax,esi
 00515E9B    call        @FreeMem
 00515EA0    pop         esi
 00515EA1    pop         ebx
 00515EA2    ret
*}
end;

//00515EA4
{*procedure sub_00515EA4(?:TheFontsInfoManager; ?:TFont; ?:?);
begin
 00515EA4    push        ebx
 00515EA5    push        esi
 00515EA6    mov         ebx,ecx
 00515EA8    mov         esi,edx
 00515EAA    push        ebx
 00515EAB    push        5C
 00515EAD    mov         eax,esi
 00515EAF    call        TFont.GetHandle
 00515EB4    push        eax
 00515EB5    call        gdi32.GetObjectW
 00515EBA    mov         byte ptr [ebx+14],0
 00515EBE    mov         byte ptr [ebx+15],0
 00515EC2    mov         byte ptr [ebx+16],0
 00515EC6    lea         eax,[ebx+1C]
 00515EC9    call        StrEnd
 00515ECE    lea         edx,[ebx+5A]
 00515ED1    sub         edx,eax
 00515ED3    add         eax,2
 00515ED6    xor         ecx,ecx
 00515ED8    call        @FillChar
 00515EDD    pop         esi
 00515EDE    pop         ebx
 00515EDF    ret
end;*}

//00515EE0
{*function sub_00515EE0(?:?; ?:?; ?:?):?;
begin
 00515EE0    push        ebp
 00515EE1    mov         ebp,esp
 00515EE3    add         esp,0FFFFFF9C
 00515EE6    push        ebx
 00515EE7    push        esi
 00515EE8    push        edi
 00515EE9    mov         dword ptr [ebp-8],ecx
 00515EEC    mov         esi,edx
 00515EEE    mov         dword ptr [ebp-4],eax
 00515EF1    mov         edi,dword ptr [ebp+8]
 00515EF4    lea         eax,[ebp-48]
 00515EF7    push        eax
 00515EF8    push        esi
 00515EF9    call        gdi32.GetTextMetricsW
 00515EFE    lea         eax,[ebp-54]
 00515F01    push        eax
 00515F02    push        4D
 00515F04    push        4D
 00515F06    push        esi
 00515F07    call        gdi32.GetCharABCWidthsW
 00515F0C    cmp         eax,1
 00515F0F    sbb         ebx,ebx
 00515F11    inc         ebx
 00515F12    test        bl,bl
>00515F14    jne         00515F2B
 00515F16    xor         eax,eax
 00515F18    mov         dword ptr [ebp-54],eax
 00515F1B    mov         eax,dword ptr [ebp-34]
 00515F1E    mov         dword ptr [ebp-50],eax
 00515F21    xor         eax,eax
 00515F23    mov         dword ptr [ebp-4C],eax
 00515F26    xor         eax,eax
 00515F28    mov         dword ptr [ebp-28],eax
 00515F2B    mov         eax,dword ptr [ebp-54]
 00515F2E    add         eax,dword ptr [ebp-50]
 00515F31    add         eax,dword ptr [ebp-4C]
 00515F34    add         eax,dword ptr [ebp-28]
 00515F37    mov         dword ptr [ebp-0C],eax
 00515F3A    cmp         dword ptr [ebp-8],0
>00515F3E    je          00515F4D
 00515F40    mov         eax,dword ptr [ebp-48]
 00515F43    cdq
 00515F44    xor         eax,edx
 00515F46    sub         eax,edx
 00515F48    mov         edx,dword ptr [ebp-8]
 00515F4B    mov         dword ptr [edx],eax
 00515F4D    test        edi,edi
>00515F4F    je          00515FCE
 00515F51    mov         dword ptr [edi],7FFFFFFF
 00515F57    mov         eax,dword ptr [ebp-4]
 00515F5A    call        0051607C
 00515F5F    test        al,al
>00515F61    je          00515FCE
 00515F63    movzx       eax,byte ptr [ebp-10]
 00515F67    sub         al,80
>00515F69    jne         00515FCE
 00515F6B    test        bl,bl
>00515F6D    je          00515FCE
 00515F6F    lea         eax,[ebp-54]
 00515F72    push        eax
 00515F73    push        8201
 00515F78    push        8201
 00515F7D    push        esi
 00515F7E    call        gdi32.GetCharABCWidthsW
 00515F83    test        eax,eax
>00515F85    je          00515FCE
 00515F87    lea         eax,[ebp-60]
 00515F8A    push        eax
 00515F8B    push        82A0
 00515F90    push        82A0
 00515F95    push        esi
 00515F96    call        gdi32.GetCharABCWidthsW
 00515F9B    test        eax,eax
>00515F9D    je          00515FCE
 00515F9F    mov         edx,dword ptr [ebp-54]
 00515FA2    add         edx,dword ptr [ebp-50]
 00515FA5    add         edx,dword ptr [ebp-4C]
 00515FA8    fild        dword ptr [ebp-0C]
 00515FAB    fmul        dword ptr ds:[515FDC];1.5:Single
 00515FB1    mov         dword ptr [ebp-64],edx
 00515FB4    fild        dword ptr [ebp-64]
 00515FB7    fcompp
 00515FB9    wait
 00515FBA    fnstsw      al
 00515FBC    sahf
>00515FBD    jbe         00515FCE
 00515FBF    mov         eax,dword ptr [ebp-60]
 00515FC2    add         eax,dword ptr [ebp-5C]
 00515FC5    add         eax,dword ptr [ebp-58]
 00515FC8    cmp         edx,eax
>00515FCA    jne         00515FCE
 00515FCC    mov         dword ptr [edi],edx
 00515FCE    mov         eax,dword ptr [ebp-0C]
 00515FD1    pop         edi
 00515FD2    pop         esi
 00515FD3    pop         ebx
 00515FD4    mov         esp,ebp
 00515FD6    pop         ebp
 00515FD7    ret         4
end;*}

//00515FE0
constructor TheFontStock.Create(InitialFont:TFont);
begin
{*
 00515FE0    push        ebx
 00515FE1    push        esi
 00515FE2    push        edi
 00515FE3    test        dl,dl
>00515FE5    je          00515FEF
 00515FE7    add         esp,0FFFFFFF0
 00515FEA    call        @ClassCreate
 00515FEF    mov         esi,ecx
 00515FF1    mov         ebx,edx
 00515FF3    mov         edi,eax
 00515FF5    xor         edx,edx
 00515FF7    mov         eax,edi
 00515FF9    call        TObject.Create
 00515FFE    mov         edx,esi
 00516000    mov         eax,edi
 00516002    mov         ecx,dword ptr [eax]
 00516004    call        dword ptr [ecx+20];TheFontStock.sub_00516160
 00516007    mov         eax,edi
 00516009    test        bl,bl
>0051600B    je          0051601C
 0051600D    call        @AfterConstruction
 00516012    pop         dword ptr fs:[0]
 00516019    add         esp,0C
 0051601C    mov         eax,edi
 0051601E    pop         edi
 0051601F    pop         esi
 00516020    pop         ebx
 00516021    ret
*}
end;

//00516024
destructor TheFontStock.Destroy();
begin
{*
 00516024    push        ebx
 00516025    push        esi
 00516026    call        @BeforeDestruction
 0051602B    mov         ebx,edx
 0051602D    mov         esi,eax
 0051602F    mov         eax,esi
 00516031    call        00516128
 00516036    mov         edx,ebx
 00516038    and         dl,0FC
 0051603B    mov         eax,esi
 0051603D    call        TObject.Destroy
 00516042    test        bl,bl
>00516044    jle         0051604D
 00516046    mov         eax,esi
 00516048    call        @ClassDestroy
 0051604D    pop         esi
 0051604E    pop         ebx
 0051604F    ret
*}
end;

//00516058
{*function sub_00516058:?;
begin
 00516058    mov         eax,dword ptr [eax+1C];TheFontStock.FpCrntFontData:PheFontData
 0051605B    mov         eax,dword ptr [eax+8]
 0051605E    ret
end;*}

//00516060
{*function sub_00516060:?;
begin
 00516060    mov         eax,dword ptr [eax+1C];TheFontStock.FpCrntFontData:PheFontData
 00516063    mov         eax,dword ptr [eax+10]
 00516066    ret
end;*}

//00516068
{*function sub_00516068:?;
begin
 00516068    mov         eax,dword ptr [eax+1C];TheFontStock.FpCrntFontData:PheFontData
 0051606B    mov         eax,dword ptr [eax+0C]
 0051606E    ret
end;*}

//00516070
{*function sub_00516070(?:?):?;
begin
 00516070    lea         edx,[edx+edx*4]
 00516073    mov         eax,dword ptr [eax+0C];TheFontStock.FpInfo:PheSharedFontsInfo
 00516076    lea         eax,[eax+edx*4+6C]
 0051607A    ret
end;*}

//0051607C
{*function sub_0051607C(?:TheFontStock):?;
begin
 0051607C    mov         eax,dword ptr [eax+0C];TheFontStock.FpInfo:PheSharedFontsInfo
 0051607F    movzx       eax,byte ptr [eax+68]
 00516083    ret
end;*}

//0051608C
{*procedure sub_0051608C(?:?);
begin
 0051608C    push        ecx
 0051608D    mov         byte ptr [esp],dl
 00516090    lea         edx,[eax+20];TheFontStock.FBaseLF:tagLOGFONTW
 00516093    test        byte ptr [esp],1
 00516097    setne       cl
 0051609A    and         ecx,7F
 0051609D    mov         ecx,dword ptr [ecx*4+786C18]
 005160A4    mov         dword ptr [edx+10],ecx
 005160A7    test        byte ptr [esp],2
 005160AB    setne       cl
 005160AE    mov         byte ptr [edx+14],cl
 005160B1    test        byte ptr [esp],4
 005160B5    setne       cl
 005160B8    mov         byte ptr [edx+15],cl
 005160BB    test        byte ptr [esp],8
 005160BF    setne       cl
 005160C2    mov         byte ptr [edx+16],cl
 005160C5    add         eax,20;TheFontStock.FBaseLF:tagLOGFONTW
 005160C8    push        eax
 005160C9    call        gdi32.CreateFontIndirectW
 005160CE    pop         edx
 005160CF    ret
end;*}

//005160D0
{*function sub_005160D0:?;
begin
 005160D0    push        ebx
 005160D1    mov         ebx,eax
 005160D3    cmp         dword ptr [ebx+8],0;TheFontStock.FDCRefCount:Integer
>005160D7    jne         005160E3
 005160D9    push        0
 005160DB    call        user32.GetDC
 005160E0    mov         dword ptr [ebx+4],eax;TheFontStock.FDC:HDC
 005160E3    inc         dword ptr [ebx+8];TheFontStock.FDCRefCount:Integer
 005160E6    mov         eax,dword ptr [ebx+4];TheFontStock.FDC:HDC
 005160E9    pop         ebx
 005160EA    ret
end;*}

//005160EC
procedure sub_005160EC;
begin
{*
 005160EC    push        ebx
 005160ED    mov         ebx,eax
 005160EF    dec         dword ptr [ebx+8];TheFontStock.FDCRefCount:Integer
 005160F2    cmp         dword ptr [ebx+8],0;TheFontStock.FDCRefCount:Integer
>005160F6    jg          00516108
 005160F8    mov         eax,dword ptr [ebx+4];TheFontStock.FDC:HDC
 005160FB    push        eax
 005160FC    push        0
 005160FE    call        user32.ReleaseDC
 00516103    xor         eax,eax
 00516105    mov         dword ptr [ebx+4],eax;TheFontStock.FDC:HDC
 00516108    pop         ebx
 00516109    ret
*}
end;

//0051610C
procedure TheFontStock.ReleaseFontHandles;
begin
{*
 0051610C    push        ebx
 0051610D    mov         ebx,eax
 0051610F    cmp         byte ptr [ebx+10],0;TheFontStock.FUsingFontHandles:Boolean
>00516113    je          00516126
 00516115    call        00515BFC
 0051611A    mov         edx,dword ptr [ebx+0C];TheFontStock.FpInfo:PheSharedFontsInfo
 0051611D    call        TheFontsInfoManager.UnLockFontsInfo
 00516122    mov         byte ptr [ebx+10],0;TheFontStock.FUsingFontHandles:Boolean
 00516126    pop         ebx
 00516127    ret
*}
end;

//00516128
procedure sub_00516128(?:TheFontStock);
begin
{*
 00516128    push        ebx
 00516129    push        esi
 0051612A    mov         ebx,eax
 0051612C    cmp         dword ptr [ebx+0C],0;TheFontStock.FpInfo:PheSharedFontsInfo
>00516130    je          0051615C
 00516132    call        00515BFC
 00516137    mov         esi,eax
 00516139    cmp         byte ptr [ebx+10],0;TheFontStock.FUsingFontHandles:Boolean
>0051613D    je          0051614D
 0051613F    mov         edx,dword ptr [ebx+0C];TheFontStock.FpInfo:PheSharedFontsInfo
 00516142    mov         eax,esi
 00516144    call        TheFontsInfoManager.UnLockFontsInfo
 00516149    mov         byte ptr [ebx+10],0;TheFontStock.FUsingFontHandles:Boolean
 0051614D    mov         edx,dword ptr [ebx+0C];TheFontStock.FpInfo:PheSharedFontsInfo
 00516150    mov         eax,esi
 00516152    call        TheFontsInfoManager.ReleaseFontsInfo
 00516157    xor         eax,eax
 00516159    mov         dword ptr [ebx+0C],eax;TheFontStock.FpInfo:PheSharedFontsInfo
 0051615C    pop         esi
 0051615D    pop         ebx
 0051615E    ret
*}
end;

//00516160
{*procedure sub_00516160(?:?);
begin
 00516160    push        ebx
 00516161    push        esi
 00516162    push        edi
 00516163    mov         esi,edx
 00516165    mov         ebx,eax
 00516167    test        esi,esi
>00516169    je          005161B9
 0051616B    call        00515BFC
 00516170    mov         edx,esi
 00516172    call        TheFontsInfoManager.GetFontsInfo
 00516177    mov         edi,eax
 00516179    cmp         edi,dword ptr [ebx+0C];TheFontStock.FpInfo:PheSharedFontsInfo
>0051617C    jne         0051618C
 0051617E    call        00515BFC
 00516183    mov         edx,edi
 00516185    call        TheFontsInfoManager.ReleaseFontsInfo
>0051618A    jmp         005161CF
 0051618C    mov         eax,ebx
 0051618E    call        00516128
 00516193    mov         eax,edi
 00516195    mov         dword ptr [ebx+0C],eax;TheFontStock.FpInfo:PheSharedFontsInfo
 00516198    push        esi
 00516199    lea         esi,[eax+0C]
 0051619C    lea         edi,[ebx+20];TheFontStock.FBaseLF:tagLOGFONTW
 0051619F    mov         ecx,17
 005161A4    rep movs    dword ptr [edi],dword ptr [esi]
 005161A6    pop         esi
 005161A7    mov         eax,dword ptr [esi+10]
 005161AA    movzx       eax,byte ptr [eax+21]
 005161AE    mov         edx,eax
 005161B0    mov         eax,ebx
 005161B2    mov         ecx,dword ptr [eax]
 005161B4    call        dword ptr [ecx+24];TheFontStock.sub_00516230
>005161B7    jmp         005161CF
 005161B9    mov         ecx,5161E0;'SetBaseFont: ''Value'' must be specified.'
 005161BE    mov         dl,1
 005161C0    mov         eax,[00514F94];EheFontStockException
 005161C5    call        Exception.Create;EheFontStockException.Create
 005161CA    call        @RaiseExcept
 005161CF    pop         edi
 005161D0    pop         esi
 005161D1    pop         ebx
 005161D2    ret
end;*}

//00516230
{*procedure sub_00516230(?:?);
begin
 00516230    push        ebx
 00516231    push        esi
 00516232    push        edi
 00516233    push        ebp
 00516234    add         esp,0FFFFFFF8
 00516237    mov         byte ptr [esp],dl
 0051623A    mov         ebx,eax
 0051623C    mov         eax,esp
 0051623E    movzx       esi,byte ptr [eax]
 00516241    mov         eax,ebx
 00516243    call        005162E8
 00516248    mov         edx,esi
 0051624A    mov         eax,ebx
 0051624C    mov         ecx,dword ptr [eax]
 0051624E    call        dword ptr [ecx+1C];TheFontStock.sub_00516070
 00516251    cmp         eax,dword ptr [ebx+1C];TheFontStock.FpCrntFontData:PheFontData
>00516254    je          005162E1
 0051625A    mov         dword ptr [ebx+1C],eax;TheFontStock.FpCrntFontData:PheFontData
 0051625D    mov         edx,dword ptr [eax+4]
 00516260    test        edx,edx
>00516262    je          0051626F
 00516264    mov         dword ptr [ebx+14],edx;TheFontStock.FCrntFont:HFONT
 00516267    movzx       eax,byte ptr [eax]
 0051626A    mov         byte ptr [ebx+18],al;TheFontStock.FCrntStyle:TFontStyles
>0051626D    jmp         005162E1
 0051626F    movzx       edx,byte ptr [esp]
 00516273    mov         eax,ebx
 00516275    mov         ecx,dword ptr [eax]
 00516277    call        dword ptr [ecx+8];TheFontStock.sub_0051608C
 0051627A    mov         dword ptr [ebx+14],eax;TheFontStock.FCrntFont:HFONT
 0051627D    mov         eax,ebx
 0051627F    mov         edx,dword ptr [eax]
 00516281    call        dword ptr [edx];TheFontStock.sub_005160D0
 00516283    mov         esi,eax
 00516285    mov         eax,dword ptr [ebx+14];TheFontStock.FCrntFont:HFONT
 00516288    push        eax
 00516289    push        esi
 0051628A    call        gdi32.SelectObject
 0051628F    mov         dword ptr [esp+4],eax
 00516293    mov         edi,dword ptr [ebx+1C];TheFontStock.FpCrntFontData:PheFontData
 00516296    mov         eax,dword ptr [ebx+14];TheFontStock.FCrntFont:HFONT
 00516299    mov         dword ptr [edi+4],eax
 0051629C    mov         eax,ebx
 0051629E    call        0051607C
 005162A3    test        al,al
>005162A5    je          005162BC
 005162A7    lea         eax,[edi+0C]
 005162AA    push        eax
 005162AB    lea         ecx,[edi+10]
 005162AE    mov         edx,esi
 005162B0    mov         eax,ebx
 005162B2    mov         ebp,dword ptr [eax]
 005162B4    call        dword ptr [ebp+0C];TheFontStock.sub_00515EE0
 005162B7    mov         dword ptr [edi+8],eax
>005162BA    jmp         005162CD
 005162BC    push        0
 005162BE    lea         ecx,[edi+10]
 005162C1    mov         edx,esi
 005162C3    mov         eax,ebx
 005162C5    mov         ebp,dword ptr [eax]
 005162C7    call        dword ptr [ebp+0C];TheFontStock.sub_00515EE0
 005162CA    mov         dword ptr [edi+8],eax
 005162CD    mov         eax,dword ptr [esp+4]
 005162D1    push        eax
 005162D2    push        esi
 005162D3    call        gdi32.SelectObject
 005162D8    mov         edx,esi
 005162DA    mov         eax,ebx
 005162DC    mov         ecx,dword ptr [eax]
 005162DE    call        dword ptr [ecx+4];TheFontStock.sub_005160EC
 005162E1    pop         ecx
 005162E2    pop         edx
 005162E3    pop         ebp
 005162E4    pop         edi
 005162E5    pop         esi
 005162E6    pop         ebx
 005162E7    ret
end;*}

//005162E8
procedure sub_005162E8(?:TheFontStock);
begin
{*
 005162E8    push        ebx
 005162E9    mov         ebx,eax
 005162EB    cmp         byte ptr [ebx+10],0;TheFontStock.FUsingFontHandles:Boolean
>005162EF    jne         00516302
 005162F1    call        00515BFC
 005162F6    mov         edx,dword ptr [ebx+0C];TheFontStock.FpInfo:PheSharedFontsInfo
 005162F9    call        TheFontsInfoManager.LockFontsInfo
 005162FE    mov         byte ptr [ebx+10],1;TheFontStock.FUsingFontHandles:Boolean
 00516302    pop         ebx
 00516303    ret
*}
end;

//00516304
constructor TheTextDrawer.Create(CalcExtentBaseStyle:TFontStyles; BaseFont:TFont);
begin
{*
 00516304    push        ebp
 00516305    mov         ebp,esp
 00516307    push        ecx
 00516308    push        ebx
 00516309    push        esi
 0051630A    push        edi
 0051630B    test        dl,dl
>0051630D    je          00516317
 0051630F    add         esp,0FFFFFFF0
 00516312    call        @ClassCreate
 00516317    mov         byte ptr [ebp-1],cl
 0051631A    mov         ebx,edx
 0051631C    mov         edi,eax
 0051631E    mov         esi,dword ptr [ebp+8]
 00516321    xor         edx,edx
 00516323    mov         eax,edi
 00516325    call        TObject.Create
 0051632A    mov         ecx,esi
 0051632C    mov         dl,1
 0051632E    mov         eax,[00515044];TheFontStock
 00516333    call        TheFontStock.Create;TheFontStock.Create
 00516338    mov         dword ptr [edi+0C],eax;TheTextDrawer.FFontStock:TheFontStock
 0051633B    movzx       eax,byte ptr [ebp-1]
 0051633F    mov         byte ptr [edi+10],al;TheTextDrawer.FCalcExtentBaseStyle:TFontStyles
 00516342    mov         edx,esi
 00516344    mov         eax,edi
 00516346    mov         ecx,dword ptr [eax]
 00516348    call        dword ptr [ecx+28];TheTextDrawer.SetBaseFont
 0051634B    mov         dword ptr [edi+28],0FF000008;TheTextDrawer.FColor:TColor
 00516352    mov         dword ptr [edi+2C],0FF000005;TheTextDrawer.FBkColor:TColor
 00516359    mov         eax,edi
 0051635B    test        bl,bl
>0051635D    je          0051636E
 0051635F    call        @AfterConstruction
 00516364    pop         dword ptr fs:[0]
 0051636B    add         esp,0C
 0051636E    mov         eax,edi
 00516370    pop         edi
 00516371    pop         esi
 00516372    pop         ebx
 00516373    pop         ecx
 00516374    pop         ebp
 00516375    ret         4
*}
end;

//00516378
destructor TheTextDrawer.Destroy();
begin
{*
 00516378    push        ebx
 00516379    push        esi
 0051637A    call        @BeforeDestruction
 0051637F    mov         ebx,edx
 00516381    mov         esi,eax
 00516383    mov         eax,dword ptr [esi+0C];TheTextDrawer.FFontStock:TheFontStock
 00516386    call        TObject.Free
 0051638B    mov         eax,esi
 0051638D    mov         edx,dword ptr [eax]
 0051638F    call        dword ptr [edx];TheTextDrawer.sub_005163AC
 00516391    mov         edx,ebx
 00516393    and         dl,0FC
 00516396    mov         eax,esi
 00516398    call        TObject.Destroy
 0051639D    test        bl,bl
>0051639F    jle         005163A8
 005163A1    mov         eax,esi
 005163A3    call        @ClassDestroy
 005163A8    pop         esi
 005163A9    pop         ebx
 005163AA    ret
*}
end;

//005163AC
procedure sub_005163AC;
begin
{*
 005163AC    push        ebx
 005163AD    mov         ebx,eax
 005163AF    cmp         dword ptr [ebx+20],0;TheTextDrawer.FETODist:Pointer
>005163B3    je          005163C7
 005163B5    xor         eax,eax
 005163B7    mov         dword ptr [ebx+24],eax;TheTextDrawer.FETOSizeInChar:Integer
 005163BA    mov         eax,dword ptr [ebx+20];TheTextDrawer.FETODist:Pointer
 005163BD    call        @FreeMem
 005163C2    xor         eax,eax
 005163C4    mov         dword ptr [ebx+20],eax;TheTextDrawer.FETODist:Pointer
 005163C7    pop         ebx
 005163C8    ret
*}
end;

//005163CC
procedure TheTextDrawer.BeginDrawing(DC:HDC);
begin
{*
 005163CC    push        ebx
 005163CD    push        esi
 005163CE    mov         esi,edx
 005163D0    mov         ebx,eax
 005163D2    cmp         esi,dword ptr [ebx+4];TheTextDrawer.FDC:HDC
>005163D5    je          00516415
 005163D7    mov         dword ptr [ebx+4],esi;TheTextDrawer.FDC:HDC
 005163DA    push        esi
 005163DB    call        gdi32.SaveDC
 005163E0    mov         dword ptr [ebx+8],eax;TheTextDrawer.FSaveDC:Integer
 005163E3    mov         eax,dword ptr [ebx+1C];TheTextDrawer.FCrntFont:HFONT
 005163E6    push        eax
 005163E7    push        esi
 005163E8    call        gdi32.SelectObject
 005163ED    mov         eax,dword ptr [ebx+28];TheTextDrawer.FColor:TColor
 005163F0    call        ColorToRGB
 005163F5    push        eax
 005163F6    push        esi
 005163F7    call        gdi32.SetTextColor
 005163FC    mov         eax,dword ptr [ebx+2C];TheTextDrawer.FBkColor:TColor
 005163FF    call        ColorToRGB
 00516404    push        eax
 00516405    push        esi
 00516406    call        gdi32.SetBkColor
 0051640B    mov         edx,dword ptr [ebx+30];TheTextDrawer.FCharExtra:Integer
 0051640E    mov         eax,ebx
 00516410    mov         ecx,dword ptr [eax]
 00516412    call        dword ptr [ecx+8];TheTextDrawer.sub_00516604
 00516415    inc         dword ptr [ebx+34];TheTextDrawer.FDrawingCount:Integer
 00516418    pop         esi
 00516419    pop         ebx
 0051641A    ret
*}
end;

//0051641C
procedure TheTextDrawer.EndDrawing;
begin
{*
 0051641C    push        ebx
 0051641D    mov         ebx,eax
 0051641F    dec         dword ptr [ebx+34];TheTextDrawer.FDrawingCount:Integer
 00516422    cmp         dword ptr [ebx+34],0;TheTextDrawer.FDrawingCount:Integer
>00516426    jg          00516448
 00516428    mov         eax,dword ptr [ebx+4];TheTextDrawer.FDC:HDC
 0051642B    test        eax,eax
>0051642D    je          00516439
 0051642F    mov         edx,dword ptr [ebx+8];TheTextDrawer.FSaveDC:Integer
 00516432    push        edx
 00516433    push        eax
 00516434    call        gdi32.RestoreDC
 00516439    xor         eax,eax
 0051643B    mov         dword ptr [ebx+8],eax;TheTextDrawer.FSaveDC:Integer
 0051643E    xor         eax,eax
 00516440    mov         dword ptr [ebx+4],eax;TheTextDrawer.FDC:HDC
 00516443    xor         eax,eax
 00516445    mov         dword ptr [ebx+34],eax;TheTextDrawer.FDrawingCount:Integer
 00516448    pop         ebx
 00516449    ret
*}
end;

//0051644C
function TheTextDrawer.GetCharWidth:Integer;
begin
{*
 0051644C    mov         edx,dword ptr [eax+14];TheTextDrawer.FBaseCharWidth:Integer
 0051644F    add         edx,dword ptr [eax+30];TheTextDrawer.FCharExtra:Integer
 00516452    mov         eax,edx
 00516454    ret
*}
end;

//00516458
function TheTextDrawer.GetCharHeight:Integer;
begin
{*
 00516458    mov         eax,dword ptr [eax+18];TheTextDrawer.FBaseCharHeight:Integer
 0051645B    ret
*}
end;

//0051645C
procedure TheTextDrawer.SetBaseFont(Value:TFont);
begin
{*
 0051645C    push        ebx
 0051645D    push        esi
 0051645E    push        edi
 0051645F    mov         edi,edx
 00516461    mov         ebx,eax
 00516463    test        edi,edi
>00516465    je          005164AA
 00516467    mov         eax,ebx
 00516469    mov         edx,dword ptr [eax]
 0051646B    call        dword ptr [edx];TheTextDrawer.sub_005163AC
 0051646D    mov         esi,dword ptr [ebx+0C];TheTextDrawer.FFontStock:TheFontStock
 00516470    mov         edx,edi
 00516472    mov         eax,esi
 00516474    mov         ecx,dword ptr [eax]
 00516476    call        dword ptr [ecx+20];TheFontStock.sub_00516160
 00516479    movzx       edx,byte ptr [ebx+10];TheTextDrawer.FCalcExtentBaseStyle:TFontStyles
 0051647D    mov         eax,esi
 0051647F    mov         ecx,dword ptr [eax]
 00516481    call        dword ptr [ecx+24];TheFontStock.sub_00516230
 00516484    mov         eax,esi
 00516486    mov         edx,dword ptr [eax]
 00516488    call        dword ptr [edx+10];TheFontStock.sub_00516058
 0051648B    mov         dword ptr [ebx+14],eax;TheTextDrawer.FBaseCharWidth:Integer
 0051648E    mov         eax,esi
 00516490    mov         edx,dword ptr [eax]
 00516492    call        dword ptr [edx+14];TheFontStock.sub_00516060
 00516495    mov         dword ptr [ebx+18],eax;TheTextDrawer.FBaseCharHeight:Integer
 00516498    mov         eax,dword ptr [edi+10];TFont.FResource:PResource
 0051649B    movzx       eax,byte ptr [eax+21]
 0051649F    mov         edx,eax
 005164A1    mov         eax,ebx
 005164A3    mov         ecx,dword ptr [eax]
 005164A5    call        dword ptr [ecx+30];TheTextDrawer.SetStyle
>005164A8    jmp         005164C0
 005164AA    mov         ecx,5164D0;'SetBaseFont: ''Value'' must be specified.'
 005164AF    mov         dl,1
 005164B1    mov         eax,[005153CC];EheTextDrawerException
 005164B6    call        Exception.Create;EheTextDrawerException.Create
 005164BB    call        @RaiseExcept
 005164C0    pop         edi
 005164C1    pop         esi
 005164C2    pop         ebx
 005164C3    ret
*}
end;

//00516520
procedure TheTextDrawer.SetBaseStyle(Value:TFontStyles);
begin
{*
 00516520    push        ebx
 00516521    push        esi
 00516522    push        ecx
 00516523    mov         byte ptr [esp],dl
 00516526    mov         ebx,eax
 00516528    movzx       eax,byte ptr [esp]
 0051652C    cmp         al,byte ptr [ebx+10];TheTextDrawer.FCalcExtentBaseStyle:TFontStyles
>0051652F    je          00516560
 00516531    movzx       eax,byte ptr [esp]
 00516535    mov         byte ptr [ebx+10],al;TheTextDrawer.FCalcExtentBaseStyle:TFontStyles
 00516538    mov         eax,ebx
 0051653A    mov         edx,dword ptr [eax]
 0051653C    call        dword ptr [edx];TheTextDrawer.sub_005163AC
 0051653E    mov         esi,dword ptr [ebx+0C];TheTextDrawer.FFontStock:TheFontStock
 00516541    movzx       edx,byte ptr [esp]
 00516545    mov         eax,esi
 00516547    mov         ecx,dword ptr [eax]
 00516549    call        dword ptr [ecx+24];TheFontStock.sub_00516230
 0051654C    mov         eax,esi
 0051654E    mov         edx,dword ptr [eax]
 00516550    call        dword ptr [edx+10];TheFontStock.sub_00516058
 00516553    mov         dword ptr [ebx+14],eax;TheTextDrawer.FBaseCharWidth:Integer
 00516556    mov         eax,esi
 00516558    mov         edx,dword ptr [eax]
 0051655A    call        dword ptr [edx+14];TheFontStock.sub_00516060
 0051655D    mov         dword ptr [ebx+18],eax;TheTextDrawer.FBaseCharHeight:Integer
 00516560    pop         edx
 00516561    pop         esi
 00516562    pop         ebx
 00516563    ret
*}
end;

//00516564
procedure TheTextDrawer.SetStyle(Value:TFontStyles);
begin
{*
 00516564    push        ebx
 00516565    push        esi
 00516566    push        ecx
 00516567    mov         byte ptr [esp],dl
 0051656A    mov         ebx,eax
 0051656C    mov         esi,dword ptr [ebx+0C];TheTextDrawer.FFontStock:TheFontStock
 0051656F    movzx       edx,byte ptr [esp]
 00516573    mov         eax,esi
 00516575    mov         ecx,dword ptr [eax]
 00516577    call        dword ptr [ecx+24];TheFontStock.sub_00516230
 0051657A    mov         eax,dword ptr [esi+14];TheFontStock.FCrntFont:HFONT
 0051657D    mov         dword ptr [ebx+1C],eax;TheTextDrawer.FCrntFont:HFONT
 00516580    mov         eax,ebx
 00516582    mov         edx,dword ptr [eax]
 00516584    call        dword ptr [edx+4];TheTextDrawer.sub_0051658C
 00516587    pop         edx
 00516588    pop         esi
 00516589    pop         ebx
 0051658A    ret
*}
end;

//0051658C
procedure sub_0051658C;
begin
{*
 0051658C    mov         edx,dword ptr [eax+4];TheTextDrawer.FDC:HDC
 0051658F    test        edx,edx
>00516591    je          0051659D
 00516593    mov         ecx,dword ptr [eax+1C];TheTextDrawer.FCrntFont:HFONT
 00516596    push        ecx
 00516597    push        edx
 00516598    call        gdi32.SelectObject
 0051659D    ret
*}
end;

//005165A0
procedure TheTextDrawer.SetForeColor(Value:TColor);
begin
{*
 005165A0    push        ebx
 005165A1    push        esi
 005165A2    push        edi
 005165A3    mov         esi,edx
 005165A5    mov         ebx,eax
 005165A7    cmp         esi,dword ptr [ebx+28];TheTextDrawer.FColor:TColor
>005165AA    je          005165C4
 005165AC    mov         dword ptr [ebx+28],esi;TheTextDrawer.FColor:TColor
 005165AF    mov         edi,dword ptr [ebx+4];TheTextDrawer.FDC:HDC
 005165B2    test        edi,edi
>005165B4    je          005165C4
 005165B6    mov         eax,esi
 005165B8    call        ColorToRGB
 005165BD    push        eax
 005165BE    push        edi
 005165BF    call        gdi32.SetTextColor
 005165C4    pop         edi
 005165C5    pop         esi
 005165C6    pop         ebx
 005165C7    ret
*}
end;

//005165C8
procedure TheTextDrawer.SetBackColor(Value:TColor);
begin
{*
 005165C8    push        ebx
 005165C9    push        esi
 005165CA    push        edi
 005165CB    mov         esi,edx
 005165CD    mov         ebx,eax
 005165CF    cmp         esi,dword ptr [ebx+2C];TheTextDrawer.FBkColor:TColor
>005165D2    je          005165EC
 005165D4    mov         dword ptr [ebx+2C],esi;TheTextDrawer.FBkColor:TColor
 005165D7    mov         edi,dword ptr [ebx+4];TheTextDrawer.FDC:HDC
 005165DA    test        edi,edi
>005165DC    je          005165EC
 005165DE    mov         eax,esi
 005165E0    call        ColorToRGB
 005165E5    push        eax
 005165E6    push        edi
 005165E7    call        gdi32.SetBkColor
 005165EC    pop         edi
 005165ED    pop         esi
 005165EE    pop         ebx
 005165EF    ret
*}
end;

//005165F0
procedure TheTextDrawer.SetCharExtra(Value:Integer);
begin
{*
 005165F0    push        esi
 005165F1    cmp         edx,dword ptr [eax+30];TheTextDrawer.FCharExtra:Integer
>005165F4    je          00516602
 005165F6    mov         esi,edx
 005165F8    mov         dword ptr [eax+30],esi;TheTextDrawer.FCharExtra:Integer
 005165FB    mov         edx,esi
 005165FD    mov         ecx,dword ptr [eax]
 005165FF    call        dword ptr [ecx+8];TheTextDrawer.sub_00516604
 00516602    pop         esi
 00516603    ret
*}
end;

//00516604
procedure sub_00516604;
begin
{*
 00516604    mov         ecx,dword ptr [eax+4];TheTextDrawer.FDC:HDC
 00516607    test        ecx,ecx
>00516609    je          00516612
 0051660B    push        edx
 0051660C    push        ecx
 0051660D    call        gdi32.SetTextCharacterExtra
 00516612    ret
*}
end;

//00516614
procedure TheTextDrawer.TextOut(X:Integer; Y:Integer; Length:Integer; Text:PWideChar);
begin
{*
 00516614    push        ebp
 00516615    mov         ebp,esp
 00516617    push        ebx
 00516618    mov         ebx,dword ptr [ebp+8]
 0051661B    push        ebx
 0051661C    mov         ebx,dword ptr [ebp+0C]
 0051661F    push        ebx
 00516620    push        ecx
 00516621    push        edx
 00516622    mov         eax,dword ptr [eax+4];TheTextDrawer.FDC:HDC
 00516625    push        eax
 00516626    call        gdi32.TextOutW
 0051662B    pop         ebx
 0051662C    pop         ebp
 0051662D    ret         8
*}
end;

//00516630
{*procedure sub_00516630(?:Integer; ?:?);
begin
 00516630    push        ebp
 00516631    mov         ebp,esp
 00516633    push        ebx
 00516634    push        esi
 00516635    mov         ebx,eax
 00516637    mov         eax,dword ptr [ebp+8]
 0051663A    mov         esi,dword ptr [eax+8]
 0051663D    and         esi,0FFFFFFC0
 00516640    add         esi,40
 00516643    mov         eax,esi
 00516645    add         eax,eax
 00516647    add         eax,eax
 00516649    mov         edx,dword ptr [ebp+8]
 0051664C    mov         edx,dword ptr [edx-4]
 0051664F    add         edx,20
 00516652    xchg        eax,edx
 00516653    call        @ReallocMem
 00516658    mov         edx,dword ptr [ebp+8]
 0051665B    mov         edx,dword ptr [edx-4]
 0051665E    mov         edx,dword ptr [edx+20]
 00516661    mov         eax,dword ptr [ebp+8]
 00516664    mov         eax,dword ptr [eax-4]
 00516667    mov         eax,dword ptr [eax+24]
 0051666A    mov         ecx,eax
 0051666C    add         ecx,ecx
 0051666E    add         ecx,ecx
 00516670    add         edx,ecx
 00516672    mov         ecx,dword ptr [ebp+8]
 00516675    mov         ecx,esi
 00516677    sub         ecx,eax
 00516679    test        ecx,ecx
>0051667B    jle         00516687
 0051667D    mov         eax,ecx
 0051667F    mov         dword ptr [edx],ebx
 00516681    add         edx,4
 00516684    dec         eax
>00516685    jne         0051667F
 00516687    mov         eax,dword ptr [ebp+8]
 0051668A    mov         eax,dword ptr [eax-4]
 0051668D    mov         dword ptr [eax+24],esi
 00516690    pop         esi
 00516691    pop         ebx
 00516692    pop         ebp
 00516693    ret
end;*}

//00516694
procedure TheTextDrawer.ExtTextOut(X:Integer; Y:Integer; Length:Integer; Text:PWideChar; ARect:TRect; fuOptions:Cardinal);
begin
{*
 00516694    push        ebp
 00516695    mov         ebp,esp
 00516697    push        ecx
 00516698    push        ebx
 00516699    push        esi
 0051669A    mov         esi,ecx
 0051669C    mov         ebx,edx
 0051669E    mov         dword ptr [ebp-4],eax
 005166A1    mov         eax,dword ptr [ebp-4]
 005166A4    mov         eax,dword ptr [eax+24];TheTextDrawer.FETOSizeInChar:Integer
 005166A7    cmp         eax,dword ptr [ebp+8]
>005166AA    jge         005166BB
 005166AC    push        ebp
 005166AD    mov         eax,dword ptr [ebp-4]
 005166B0    mov         edx,dword ptr [eax]
 005166B2    call        dword ptr [edx+10];TheTextDrawer.GetCharWidth
 005166B5    call        00516630
 005166BA    pop         ecx
 005166BB    mov         eax,dword ptr [ebp-4]
 005166BE    mov         eax,dword ptr [eax+20];TheTextDrawer.FETODist:Pointer
 005166C1    push        eax
 005166C2    mov         eax,dword ptr [ebp+8]
 005166C5    push        eax
 005166C6    mov         eax,dword ptr [ebp+0C]
 005166C9    push        eax
 005166CA    mov         eax,dword ptr [ebp+10]
 005166CD    push        eax
 005166CE    mov         eax,dword ptr [ebp+14]
 005166D1    push        eax
 005166D2    push        esi
 005166D3    push        ebx
 005166D4    mov         eax,dword ptr [ebp-4]
 005166D7    mov         eax,dword ptr [eax+4];TheTextDrawer.FDC:HDC
 005166DA    push        eax
 005166DB    call        gdi32.ExtTextOutW
 005166E0    pop         esi
 005166E1    pop         ebx
 005166E2    pop         ecx
 005166E3    pop         ebp
 005166E4    ret         10
*}
end;

//005166E8
procedure TheTextDrawer.ReleaseTemporaryResources;
begin
{*
 005166E8    mov         eax,dword ptr [eax+0C];TheTextDrawer.FFontStock:TheFontStock
 005166EB    mov         edx,dword ptr [eax]
 005166ED    call        dword ptr [edx+2C];TheFontStock.ReleaseFontHandles
 005166F0    ret
*}
end;

end.