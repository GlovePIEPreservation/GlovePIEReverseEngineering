//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit Printers;

interface

uses
  SysUtils, Classes, Graphics, Printers;

type
  EPrinter = class(Exception)
  end;
  TPrinterState = (psNoHandle, psHandleIC, psHandleDC);
  TPrinterOrientation = (poPortrait, poLandscape);
  TPrinterCapability = (pcCopies, pcOrientation, pcCollation);
  TPrinterCapabilities = set of TPrinterCapability;
  TPrinter = class(TObject)
  published
    procedure Refresh;//004ACBE4
    procedure NewPage;//004ABFAC
    procedure SetPrinter(ADevice:PWideChar; ADriver:PWideChar; ADeviceMode:Cardinal; APort:PWideChar);//004AC088
    procedure GetPrinter(ADevice:PWideChar; ADriver:PWideChar; var ADeviceMode:Cardinal; APort:PWideChar);//004ABFE0
    procedure EndDoc;//004ABF78
    destructor Destroy();//004ABCA0
    constructor Create();//004ABC64
    procedure BeginDoc;//004ABEEC
    procedure Abort;//004ABEBC
  public
    FCanvas:TCanvas;//f4
    FFonts:TStrings;//f8
    FPageNumber:Integer;//fC
    FPrinters:TStrings;//f10
    FPrinterIndex:Integer;//f14
    FTitle:string;//f18
    FPrinting:Boolean;//f1C
    FAborted:Boolean;//f1D
    FCapabilities:TPrinterCapabilities;//f1E
    State:TPrinterState;//f1F
    DC:HDC;//f20
    FPrinterHandle:Cardinal;//f24
    DevMode:PDeviceModeW;//f28
    DeviceMode:Cardinal;//f2C
    procedure SetState(Value:TPrinterState);//004ABD1C
    procedure CheckPrinting(Value:Boolean);//004ABE4C
    procedure SetPrinterCapabilities(Value:Integer);//004AC04C
    function GetCanvas:TCanvas;//004AC2A4
    function GetFonts:TStrings;//004AC320
    function GetHandle:HDC;//004AC3B0
    function GetNumCopies:Integer;//004AC3C4
    procedure SetNumCopies(Value:Integer);//004AC428
    function GetOrientation:TPrinterOrientation;//004AC4A0
    procedure SetOrientation(Value:TPrinterOrientation);//004AC50C
    function GetPageHeight:Integer;//004AC590
    function GetPageWidth:Integer;//004AC5AC
    function GetPrinterIndex:Integer;//004AC5C8
    procedure SetPrinterIndex(Value:Integer);//004AC5E0
    function GetPrinters:TStrings;//004AC704
    procedure SetToDefaultPrinter;//004AC94C
    procedure FreePrinters;//004ACB6C
    procedure FreeFonts;//004ACBB0
  end;
  TPrinterDevice = class(TObject)
  published
    function IsEqual(ADriver:PWideChar; ADevice:PWideChar; APort:PWideChar):Boolean;//004AB8A4
    constructor Create(APort:PWideChar; ADevice:PWideChar);//004AB844
  public
    Driver:string;//f4
    Device:string;//f8
    Port:string;//fC
  end;
  TPrinterCanvas = class(TCanvas)
  published
    procedure UpdateFont;//004ABC1C
    constructor Create;//004ABB9C
    procedure CreateHandle;//004ABBD8
    procedure Changing;//004ABBFC
  public
    Printer:TPrinter;//f58
    procedure Changing; virtual;//v28//004ABBFC
    procedure CreateHandle; virtual;//v9C//004ABBD8
  end;
    function ClosePrinter:BOOL; stdcall;//004AADF8
    function DocumentPropertiesW(hPrinter:THandle; pDeviceName:PWideChar; const pDevModeOutput:TDeviceModeW; var pDevModeInput:TDeviceModeW; fMode:DWORD):LongInt; stdcall;//004AAE00
    function DocumentPropertiesW(hPrinter:THandle; pDeviceName:PWideChar; const pDevModeOutput:TDeviceModeW; var pDevModeInput:TDeviceModeW; fMode:DWORD):LongInt; stdcall;//004AAE08
    function EnumPrintersW(Name:PWideChar; Level:DWORD; pPrinterEnum:Pointer; cbBuf:DWORD; var pcbNeeded:DWORD; var pcReturned:DWORD):BOOL; stdcall;//004AAE10
    function OpenPrinterW(var phPrinter:THandle; pDefault:PPrinterDefaultsW):BOOL; stdcall;//004AAE18
    function FetchStr(var Str:PChar):PChar;//004AB610
    procedure RaiseError(const Msg:UnicodeString);//004AB650
    function AbortProc(Prn:HDC; Error:Integer):BOOL; stdcall;//004AB668
    function EnumFontsProc(var LogFont:TLogFont; var TextMetric:TTextMetric; FontType:Integer; Data:Pointer):Integer; stdcall;//004AC2C4
    function GetDefaultPrinterW(pcchBuffer:LPDWORD):BOOL; stdcall;//004AC944
    function Printer:TPrinter;//004ACBC4

implementation

//004AADF8
function winspool.ClosePrinter:BOOL; stdcall;
begin
{*
 004AADF8    jmp         dword ptr ds:[826824]
*}
end;

//004AAE00
function winspool.DocumentPropertiesW(hPrinter:THandle; pDeviceName:PWideChar; const pDevModeOutput:TDeviceModeW; var pDevModeInput:TDeviceModeW; fMode:DWORD):LongInt; stdcall;
begin
{*
 004AAE00    jmp         dword ptr ds:[826820]
*}
end;

//004AAE08
function winspool.DocumentPropertiesW(hPrinter:THandle; pDeviceName:PWideChar; const pDevModeOutput:TDeviceModeW; var pDevModeInput:TDeviceModeW; fMode:DWORD):LongInt; stdcall;
begin
{*
 004AAE08    jmp         dword ptr ds:[826820]
*}
end;

//004AAE10
function winspool.EnumPrintersW(Name:PWideChar; Level:DWORD; pPrinterEnum:Pointer; cbBuf:DWORD; var pcbNeeded:DWORD; var pcReturned:DWORD):BOOL; stdcall;
begin
{*
 004AAE10    jmp         dword ptr ds:[82681C]
*}
end;

//004AAE18
function winspool.OpenPrinterW(var phPrinter:THandle; pDefault:PPrinterDefaultsW):BOOL; stdcall;
begin
{*
 004AAE18    jmp         dword ptr ds:[826818]
*}
end;

//004AB610
function FetchStr(var Str:PChar):PChar;
begin
{*
 004AB610    push        esi
 004AB611    mov         esi,dword ptr [eax]
 004AB613    cmp         dword ptr [eax],0
>004AB616    je          004AB64A
 004AB618    mov         edx,dword ptr [eax]
>004AB61A    jmp         004AB61F
 004AB61C    add         edx,2
 004AB61F    cmp         word ptr [edx],20
>004AB623    je          004AB61C
 004AB625    mov         esi,edx
>004AB627    jmp         004AB62C
 004AB629    add         edx,2
 004AB62C    movzx       ecx,word ptr [edx]
 004AB62F    test        cx,cx
>004AB632    je          004AB63A
 004AB634    cmp         cx,2C
>004AB638    jne         004AB629
 004AB63A    cmp         word ptr [edx],2C
>004AB63E    jne         004AB648
 004AB640    mov         word ptr [edx],0
 004AB645    add         edx,2
 004AB648    mov         dword ptr [eax],edx
 004AB64A    mov         eax,esi
 004AB64C    pop         esi
 004AB64D    ret
*}
end;

//004AB650
procedure RaiseError(const Msg:UnicodeString);
begin
{*
 004AB650    push        ebx
 004AB651    mov         ebx,eax
 004AB653    mov         ecx,ebx
 004AB655    mov         dl,1
 004AB657    mov         eax,[004AAE20];EPrinter
 004AB65C    call        Exception.Create
 004AB661    call        @RaiseExcept
 004AB666    pop         ebx
 004AB667    ret
*}
end;

//004AB668
function AbortProc(Prn:HDC; Error:Integer):BOOL; stdcall;
begin
{*
 004AB668    push        ebp
 004AB669    mov         ebp,esp
 004AB66B    mov         eax,[0078D590];^Application:TApplication
 004AB670    mov         eax,dword ptr [eax]
 004AB672    call        TApplication.ProcessMessages
 004AB677    mov         eax,[00785D48];gvar_00785D48
 004AB67C    movzx       eax,byte ptr [eax+1D]
 004AB680    xor         al,1
 004AB682    neg         al
 004AB684    sbb         eax,eax
 004AB686    pop         ebp
 004AB687    ret         8
*}
end;

//004AB844
constructor TPrinterDevice.Create(APort:PWideChar; ADevice:PWideChar);
begin
{*
 004AB844    push        ebp
 004AB845    mov         ebp,esp
 004AB847    push        ebx
 004AB848    push        esi
 004AB849    push        edi
 004AB84A    test        dl,dl
>004AB84C    je          004AB856
 004AB84E    add         esp,0FFFFFFF0
 004AB851    call        @ClassCreate
 004AB856    mov         esi,ecx
 004AB858    mov         ebx,edx
 004AB85A    mov         edi,eax
 004AB85C    xor         edx,edx
 004AB85E    mov         eax,edi
 004AB860    call        TObject.Create
 004AB865    lea         eax,[edi+4]
 004AB868    mov         edx,esi
 004AB86A    call        @UStrFromPWChar
 004AB86F    lea         eax,[edi+8]
 004AB872    mov         edx,dword ptr [ebp+0C]
 004AB875    call        @UStrFromPWChar
 004AB87A    lea         eax,[edi+0C]
 004AB87D    mov         edx,dword ptr [ebp+8]
 004AB880    call        @UStrFromPWChar
 004AB885    mov         eax,edi
 004AB887    test        bl,bl
>004AB889    je          004AB89A
 004AB88B    call        @AfterConstruction
 004AB890    pop         dword ptr fs:[0]
 004AB897    add         esp,0C
 004AB89A    mov         eax,edi
 004AB89C    pop         edi
 004AB89D    pop         esi
 004AB89E    pop         ebx
 004AB89F    pop         ebp
 004AB8A0    ret         8
*}
end;

//004AB8A4
function TPrinterDevice.IsEqual(ADriver:PWideChar; ADevice:PWideChar; APort:PWideChar):Boolean;
begin
{*
 004AB8A4    push        ebp
 004AB8A5    mov         ebp,esp
 004AB8A7    push        0
 004AB8A9    push        0
 004AB8AB    push        ebx
 004AB8AC    push        esi
 004AB8AD    mov         esi,ecx
 004AB8AF    mov         ebx,eax
 004AB8B1    xor         eax,eax
 004AB8B3    push        ebp
 004AB8B4    push        4AB917
 004AB8B9    push        dword ptr fs:[eax]
 004AB8BC    mov         dword ptr fs:[eax],esp
 004AB8BF    lea         eax,[ebp-4]
 004AB8C2    mov         edx,esi
 004AB8C4    call        @UStrFromPWChar
 004AB8C9    mov         edx,dword ptr [ebp-4]
 004AB8CC    mov         eax,dword ptr [ebx+8]
 004AB8CF    call        @UStrEqual
>004AB8D4    jne         004AB8F4
 004AB8D6    cmp         dword ptr [ebx+0C],0
>004AB8DA    je          004AB8F8
 004AB8DC    lea         eax,[ebp-8]
 004AB8DF    mov         edx,dword ptr [ebp+8]
 004AB8E2    call        @UStrFromPWChar
 004AB8E7    mov         edx,dword ptr [ebp-8]
 004AB8EA    mov         eax,dword ptr [ebx+0C]
 004AB8ED    call        @UStrEqual
>004AB8F2    je          004AB8F8
 004AB8F4    xor         eax,eax
>004AB8F6    jmp         004AB8FA
 004AB8F8    mov         al,1
 004AB8FA    mov         ebx,eax
 004AB8FC    xor         eax,eax
 004AB8FE    pop         edx
 004AB8FF    pop         ecx
 004AB900    pop         ecx
 004AB901    mov         dword ptr fs:[eax],edx
 004AB904    push        4AB91E
 004AB909    lea         eax,[ebp-8]
 004AB90C    mov         edx,2
 004AB911    call        @UStrArrayClr
 004AB916    ret
>004AB917    jmp         @HandleFinally
>004AB91C    jmp         004AB909
 004AB91E    mov         eax,ebx
 004AB920    pop         esi
 004AB921    pop         ebx
 004AB922    pop         ecx
 004AB923    pop         ecx
 004AB924    pop         ebp
 004AB925    ret         4
*}
end;

//004ABB9C
constructor TPrinterCanvas.Create;
begin
{*
 004ABB9C    push        ebx
 004ABB9D    push        esi
 004ABB9E    push        edi
 004ABB9F    test        dl,dl
>004ABBA1    je          004ABBAB
 004ABBA3    add         esp,0FFFFFFF0
 004ABBA6    call        @ClassCreate
 004ABBAB    mov         esi,ecx
 004ABBAD    mov         ebx,edx
 004ABBAF    mov         edi,eax
 004ABBB1    xor         edx,edx
 004ABBB3    mov         eax,edi
 004ABBB5    call        TCanvas.Create
 004ABBBA    mov         dword ptr [edi+58],esi
 004ABBBD    mov         eax,edi
 004ABBBF    test        bl,bl
>004ABBC1    je          004ABBD2
 004ABBC3    call        @AfterConstruction
 004ABBC8    pop         dword ptr fs:[0]
 004ABBCF    add         esp,0C
 004ABBD2    mov         eax,edi
 004ABBD4    pop         edi
 004ABBD5    pop         esi
 004ABBD6    pop         ebx
 004ABBD7    ret
*}
end;

//004ABBD8
procedure TPrinterCanvas.CreateHandle;
begin
{*
 004ABBD8    push        ebx
 004ABBD9    mov         ebx,eax
 004ABBDB    mov         dl,1
 004ABBDD    mov         eax,dword ptr [ebx+58]
 004ABBE0    call        TPrinter.SetState
 004ABBE5    mov         eax,ebx
 004ABBE7    call        TPrinterCanvas.UpdateFont
 004ABBEC    mov         eax,dword ptr [ebx+58]
 004ABBEF    mov         edx,dword ptr [eax+20]
 004ABBF2    mov         eax,ebx
 004ABBF4    call        TCanvas.SetHandle
 004ABBF9    pop         ebx
 004ABBFA    ret
*}
end;

//004ABBFC
procedure TPrinterCanvas.Changing;
begin
{*
 004ABBFC    push        ebx
 004ABBFD    mov         ebx,eax
 004ABBFF    mov         dl,1
 004ABC01    mov         eax,dword ptr [ebx+58]
 004ABC04    call        TPrinter.CheckPrinting
 004ABC09    mov         eax,ebx
 004ABC0B    call        TCustomCanvas.Changing
 004ABC10    mov         eax,ebx
 004ABC12    call        TPrinterCanvas.UpdateFont
 004ABC17    pop         ebx
 004ABC18    ret
*}
end;

//004ABC1C
procedure TPrinterCanvas.UpdateFont;
begin
{*
 004ABC1C    push        ebx
 004ABC1D    push        esi
 004ABC1E    push        edi
 004ABC1F    mov         ebx,eax
 004ABC21    push        5A
 004ABC23    mov         eax,dword ptr [ebx+58]
 004ABC26    mov         eax,dword ptr [eax+20]
 004ABC29    push        eax
 004ABC2A    call        gdi32.GetDeviceCaps
 004ABC2F    mov         esi,dword ptr [ebx+40]
 004ABC32    cmp         eax,dword ptr [esi+1C]
>004ABC35    je          004ABC5D
 004ABC37    mov         eax,esi
 004ABC39    call        TFont.GetSize
 004ABC3E    mov         esi,eax
 004ABC40    push        5A
 004ABC42    mov         eax,dword ptr [ebx+58]
 004ABC45    mov         eax,dword ptr [eax+20]
 004ABC48    push        eax
 004ABC49    call        gdi32.GetDeviceCaps
 004ABC4E    mov         edi,dword ptr [ebx+40]
 004ABC51    mov         dword ptr [edi+1C],eax
 004ABC54    mov         edx,esi
 004ABC56    mov         eax,edi
 004ABC58    call        TFont.SetSize
 004ABC5D    pop         edi
 004ABC5E    pop         esi
 004ABC5F    pop         ebx
 004ABC60    ret
*}
end;

//004ABC64
constructor TPrinter.Create();
begin
{*
 004ABC64    push        ebx
 004ABC65    push        esi
 004ABC66    test        dl,dl
>004ABC68    je          004ABC72
 004ABC6A    add         esp,0FFFFFFF0
 004ABC6D    call        @ClassCreate
 004ABC72    mov         ebx,edx
 004ABC74    mov         esi,eax
 004ABC76    xor         edx,edx
 004ABC78    mov         eax,esi
 004ABC7A    call        TObject.Create
 004ABC7F    mov         dword ptr [esi+14],0FFFFFFFF
 004ABC86    mov         eax,esi
 004ABC88    test        bl,bl
>004ABC8A    je          004ABC9B
 004ABC8C    call        @AfterConstruction
 004ABC91    pop         dword ptr fs:[0]
 004ABC98    add         esp,0C
 004ABC9B    mov         eax,esi
 004ABC9D    pop         esi
 004ABC9E    pop         ebx
 004ABC9F    ret
*}
end;

//004ABCA0
destructor TPrinter.Destroy();
begin
{*
 004ABCA0    push        ebx
 004ABCA1    push        esi
 004ABCA2    call        @BeforeDestruction
 004ABCA7    mov         ebx,edx
 004ABCA9    mov         esi,eax
 004ABCAB    cmp         byte ptr [esi+1C],0
>004ABCAF    je          004ABCB8
 004ABCB1    mov         eax,esi
 004ABCB3    call        TPrinter.EndDoc
 004ABCB8    xor         edx,edx
 004ABCBA    mov         eax,esi
 004ABCBC    call        TPrinter.SetState
 004ABCC1    mov         eax,esi
 004ABCC3    call        TPrinter.FreePrinters
 004ABCC8    mov         eax,esi
 004ABCCA    call        TPrinter.FreeFonts
 004ABCCF    mov         eax,dword ptr [esi+4]
 004ABCD2    call        TObject.Free
 004ABCD7    mov         eax,dword ptr [esi+24]
 004ABCDA    test        eax,eax
>004ABCDC    je          004ABCE4
 004ABCDE    push        eax
 004ABCDF    call        winspool.ClosePrinter
 004ABCE4    mov         eax,dword ptr [esi+2C]
 004ABCE7    test        eax,eax
>004ABCE9    je          004ABCFF
 004ABCEB    push        eax
 004ABCEC    call        kernel32.GlobalUnlock
 004ABCF1    mov         eax,dword ptr [esi+2C]
 004ABCF4    push        eax
 004ABCF5    call        kernel32.GlobalFree
 004ABCFA    xor         eax,eax
 004ABCFC    mov         dword ptr [esi+2C],eax
 004ABCFF    mov         edx,ebx
 004ABD01    and         dl,0FC
 004ABD04    mov         eax,esi
 004ABD06    call        TObject.Destroy
 004ABD0B    test        bl,bl
>004ABD0D    jle         004ABD16
 004ABD0F    mov         eax,esi
 004ABD11    call        @ClassDestroy
 004ABD16    pop         esi
 004ABD17    pop         ebx
 004ABD18    ret
*}
end;

//004ABD1C
procedure TPrinter.SetState(Value:TPrinterState);
begin
{*
 004ABD1C    push        ebp
 004ABD1D    mov         ebp,esp
 004ABD1F    add         esp,0FFFFFFF8
 004ABD22    push        ebx
 004ABD23    push        esi
 004ABD24    push        edi
 004ABD25    xor         ecx,ecx
 004ABD27    mov         dword ptr [ebp-8],ecx
 004ABD2A    mov         ebx,edx
 004ABD2C    mov         esi,eax
 004ABD2E    xor         eax,eax
 004ABD30    push        ebp
 004ABD31    push        4ABE3B
 004ABD36    push        dword ptr fs:[eax]
 004ABD39    mov         dword ptr fs:[eax],esp
 004ABD3C    movzx       eax,byte ptr [esi+1F]
 004ABD40    cmp         bl,al
>004ABD42    je          004ABE25
 004ABD48    xor         edi,edi
 004ABD4A    mov         edx,ebx
 004ABD4C    sub         dl,1
>004ABD4F    jb          004ABD59
>004ABD51    je          004ABD80
 004ABD53    dec         dl
>004ABD55    je          004ABD8F
>004ABD57    jmp         004ABDAF
 004ABD59    xor         edx,edx
 004ABD5B    mov         eax,esi
 004ABD5D    call        TPrinter.CheckPrinting
 004ABD62    mov         eax,dword ptr [esi+4]
 004ABD65    test        eax,eax
>004ABD67    je          004ABD70
 004ABD69    xor         edx,edx
 004ABD6B    call        TCanvas.SetHandle
 004ABD70    mov         eax,dword ptr [esi+20]
 004ABD73    push        eax
 004ABD74    call        gdi32.DeleteDC
 004ABD79    xor         eax,eax
 004ABD7B    mov         dword ptr [esi+20],eax
>004ABD7E    jmp         004ABDAF
 004ABD80    cmp         al,2
>004ABD82    je          004ABE25
 004ABD88    mov         edi,40D978;gdi32.CreateICW:HDC
>004ABD8D    jmp         004ABDAF
 004ABD8F    mov         eax,dword ptr [esi+4]
 004ABD92    test        eax,eax
>004ABD94    je          004ABD9D
 004ABD96    xor         edx,edx
 004ABD98    call        TCanvas.SetHandle
 004ABD9D    mov         eax,dword ptr [esi+20]
 004ABDA0    test        eax,eax
>004ABDA2    je          004ABDAA
 004ABDA4    push        eax
 004ABDA5    call        gdi32.DeleteDC
 004ABDAA    mov         edi,40D948;gdi32.CreateDCW:HDC
 004ABDAF    test        edi,edi
>004ABDB1    je          004ABE22
 004ABDB3    mov         eax,esi
 004ABDB5    call        TPrinter.GetPrinterIndex
 004ABDBA    push        eax
 004ABDBB    mov         eax,esi
 004ABDBD    call        TPrinter.GetPrinters
 004ABDC2    pop         edx
 004ABDC3    mov         ecx,dword ptr [eax]
 004ABDC5    call        dword ptr [ecx+18]
 004ABDC8    mov         dword ptr [ebp-4],eax
 004ABDCB    mov         eax,dword ptr [esi+28]
 004ABDCE    push        eax
 004ABDCF    mov         eax,dword ptr [ebp-4]
 004ABDD2    mov         eax,dword ptr [eax+0C]
 004ABDD5    call        @UStrToPWChar
 004ABDDA    push        eax
 004ABDDB    mov         eax,dword ptr [ebp-4]
 004ABDDE    mov         eax,dword ptr [eax+8]
 004ABDE1    call        @UStrToPWChar
 004ABDE6    push        eax
 004ABDE7    mov         eax,dword ptr [ebp-4]
 004ABDEA    mov         eax,dword ptr [eax+4]
 004ABDED    call        @UStrToPWChar
 004ABDF2    push        eax
 004ABDF3    call        edi
 004ABDF5    mov         dword ptr [esi+20],eax
 004ABDF8    cmp         dword ptr [esi+20],0
>004ABDFC    jne         004ABE13
 004ABDFE    lea         edx,[ebp-8]
 004ABE01    mov         eax,[0078D7BC];^SResString215:TResStringRec
 004ABE06    call        LoadResString
 004ABE0B    mov         eax,dword ptr [ebp-8]
 004ABE0E    call        RaiseError
 004ABE13    mov         eax,dword ptr [esi+4]
 004ABE16    test        eax,eax
>004ABE18    je          004ABE22
 004ABE1A    mov         edx,dword ptr [esi+20]
 004ABE1D    call        TCanvas.SetHandle
 004ABE22    mov         byte ptr [esi+1F],bl
 004ABE25    xor         eax,eax
 004ABE27    pop         edx
 004ABE28    pop         ecx
 004ABE29    pop         ecx
 004ABE2A    mov         dword ptr fs:[eax],edx
 004ABE2D    push        4ABE42
 004ABE32    lea         eax,[ebp-8]
 004ABE35    call        @UStrClr
 004ABE3A    ret
>004ABE3B    jmp         @HandleFinally
>004ABE40    jmp         004ABE32
 004ABE42    pop         edi
 004ABE43    pop         esi
 004ABE44    pop         ebx
 004ABE45    pop         ecx
 004ABE46    pop         ecx
 004ABE47    pop         ebp
 004ABE48    ret
*}
end;

//004ABE4C
procedure TPrinter.CheckPrinting(Value:Boolean);
begin
{*
 004ABE4C    push        ebp
 004ABE4D    mov         ebp,esp
 004ABE4F    push        0
 004ABE51    push        0
 004ABE53    xor         ecx,ecx
 004ABE55    push        ebp
 004ABE56    push        4ABEB1
 004ABE5B    push        dword ptr fs:[ecx]
 004ABE5E    mov         dword ptr fs:[ecx],esp
 004ABE61    cmp         dl,byte ptr [eax+1C]
>004ABE64    je          004ABE96
 004ABE66    test        dl,dl
>004ABE68    je          004ABE81
 004ABE6A    lea         edx,[ebp-4]
 004ABE6D    mov         eax,[0078D978];^SResString212:TResStringRec
 004ABE72    call        LoadResString
 004ABE77    mov         eax,dword ptr [ebp-4]
 004ABE7A    call        RaiseError
>004ABE7F    jmp         004ABE96
 004ABE81    lea         edx,[ebp-8]
 004ABE84    mov         eax,[0078D358];^SResString213:TResStringRec
 004ABE89    call        LoadResString
 004ABE8E    mov         eax,dword ptr [ebp-8]
 004ABE91    call        RaiseError
 004ABE96    xor         eax,eax
 004ABE98    pop         edx
 004ABE99    pop         ecx
 004ABE9A    pop         ecx
 004ABE9B    mov         dword ptr fs:[eax],edx
 004ABE9E    push        4ABEB8
 004ABEA3    lea         eax,[ebp-8]
 004ABEA6    mov         edx,2
 004ABEAB    call        @UStrArrayClr
 004ABEB0    ret
>004ABEB1    jmp         @HandleFinally
>004ABEB6    jmp         004ABEA3
 004ABEB8    pop         ecx
 004ABEB9    pop         ecx
 004ABEBA    pop         ebp
 004ABEBB    ret
*}
end;

//004ABEBC
procedure TPrinter.Abort;
begin
{*
 004ABEBC    push        ebx
 004ABEBD    mov         ebx,eax
 004ABEBF    mov         dl,1
 004ABEC1    mov         eax,ebx
 004ABEC3    call        TPrinter.CheckPrinting
 004ABEC8    mov         eax,ebx
 004ABECA    call        TPrinter.GetCanvas
 004ABECF    call        TCanvas.GetHandle
 004ABED4    push        eax
 004ABED5    call        gdi32.AbortDoc
 004ABEDA    mov         byte ptr [ebx+1D],1
 004ABEDE    mov         eax,ebx
 004ABEE0    call        TPrinter.EndDoc
 004ABEE5    mov         byte ptr [ebx+1D],1
 004ABEE9    pop         ebx
 004ABEEA    ret
*}
end;

//004ABEEC
procedure TPrinter.BeginDoc;
begin
{*
 004ABEEC    push        ebx
 004ABEED    add         esp,0FFFFFFEC
 004ABEF0    mov         ebx,eax
 004ABEF2    xor         edx,edx
 004ABEF4    mov         eax,ebx
 004ABEF6    call        TPrinter.CheckPrinting
 004ABEFB    mov         dl,2
 004ABEFD    mov         eax,ebx
 004ABEFF    call        TPrinter.SetState
 004ABF04    mov         eax,ebx
 004ABF06    call        TPrinter.GetCanvas
 004ABF0B    mov         edx,dword ptr [eax]
 004ABF0D    call        dword ptr [edx+80]
 004ABF13    mov         eax,ebx
 004ABF15    call        TPrinter.GetCanvas
 004ABF1A    call        TPrinterCanvas.UpdateFont
 004ABF1F    mov         byte ptr [ebx+1C],1
 004ABF23    mov         byte ptr [ebx+1D],0
 004ABF27    mov         dword ptr [ebx+0C],1
 004ABF2E    mov         eax,esp
 004ABF30    xor         ecx,ecx
 004ABF32    mov         edx,14
 004ABF37    call        @FillChar
 004ABF3C    mov         dword ptr [esp],14
 004ABF43    mov         eax,dword ptr [ebx+18]
 004ABF46    call        @UStrToPWChar
 004ABF4B    mov         dword ptr [esp+4],eax
 004ABF4F    push        4AB668;AbortProc:BOOL
 004ABF54    mov         eax,dword ptr [ebx+20]
 004ABF57    push        eax
 004ABF58    call        gdi32.SetAbortProc
 004ABF5D    push        esp
 004ABF5E    mov         eax,dword ptr [ebx+20]
 004ABF61    push        eax
 004ABF62    call        gdi32.StartDocW
 004ABF67    mov         eax,dword ptr [ebx+20]
 004ABF6A    push        eax
 004ABF6B    call        gdi32.StartPage
 004ABF70    add         esp,14
 004ABF73    pop         ebx
 004ABF74    ret
*}
end;

//004ABF78
procedure TPrinter.EndDoc;
begin
{*
 004ABF78    push        ebx
 004ABF79    mov         ebx,eax
 004ABF7B    mov         dl,1
 004ABF7D    mov         eax,ebx
 004ABF7F    call        TPrinter.CheckPrinting
 004ABF84    mov         eax,dword ptr [ebx+20]
 004ABF87    push        eax
 004ABF88    call        gdi32.EndPage
 004ABF8D    cmp         byte ptr [ebx+1D],0
>004ABF91    jne         004ABF9C
 004ABF93    mov         eax,dword ptr [ebx+20]
 004ABF96    push        eax
 004ABF97    call        gdi32.EndDoc
 004ABF9C    mov         byte ptr [ebx+1C],0
 004ABFA0    mov         byte ptr [ebx+1D],0
 004ABFA4    xor         eax,eax
 004ABFA6    mov         dword ptr [ebx+0C],eax
 004ABFA9    pop         ebx
 004ABFAA    ret
*}
end;

//004ABFAC
procedure TPrinter.NewPage;
begin
{*
 004ABFAC    push        ebx
 004ABFAD    mov         ebx,eax
 004ABFAF    mov         dl,1
 004ABFB1    mov         eax,ebx
 004ABFB3    call        TPrinter.CheckPrinting
 004ABFB8    mov         eax,dword ptr [ebx+20]
 004ABFBB    push        eax
 004ABFBC    call        gdi32.EndPage
 004ABFC1    mov         eax,dword ptr [ebx+20]
 004ABFC4    push        eax
 004ABFC5    call        gdi32.StartPage
 004ABFCA    inc         dword ptr [ebx+0C]
 004ABFCD    mov         eax,ebx
 004ABFCF    call        TPrinter.GetCanvas
 004ABFD4    mov         edx,dword ptr [eax]
 004ABFD6    call        dword ptr [edx+80]
 004ABFDC    pop         ebx
 004ABFDD    ret
*}
end;

//004ABFE0
procedure TPrinter.GetPrinter(ADevice:PWideChar; ADriver:PWideChar; var ADeviceMode:Cardinal; APort:PWideChar);
begin
{*
 004ABFE0    push        ebp
 004ABFE1    mov         ebp,esp
 004ABFE3    push        ecx
 004ABFE4    push        ebx
 004ABFE5    push        esi
 004ABFE6    push        edi
 004ABFE7    mov         dword ptr [ebp-4],ecx
 004ABFEA    mov         edi,edx
 004ABFEC    mov         ebx,eax
 004ABFEE    mov         eax,ebx
 004ABFF0    call        TPrinter.GetPrinterIndex
 004ABFF5    push        eax
 004ABFF6    mov         eax,ebx
 004ABFF8    call        TPrinter.GetPrinters
 004ABFFD    pop         edx
 004ABFFE    mov         ecx,dword ptr [eax]
 004AC000    call        dword ptr [ecx+18]
 004AC003    mov         esi,eax
 004AC005    mov         eax,dword ptr [esi+8]
 004AC008    call        @UStrToPWChar
 004AC00D    mov         edx,eax
 004AC00F    mov         eax,edi
 004AC011    call        StrCopy
 004AC016    mov         eax,dword ptr [esi+4]
 004AC019    call        @UStrToPWChar
 004AC01E    mov         edx,eax
 004AC020    mov         eax,dword ptr [ebp-4]
 004AC023    call        StrCopy
 004AC028    mov         eax,dword ptr [esi+0C]
 004AC02B    call        @UStrToPWChar
 004AC030    mov         edx,eax
 004AC032    mov         eax,dword ptr [ebp+0C]
 004AC035    call        StrCopy
 004AC03A    mov         eax,dword ptr [ebp+8]
 004AC03D    mov         edx,dword ptr [ebx+2C]
 004AC040    mov         dword ptr [eax],edx
 004AC042    pop         edi
 004AC043    pop         esi
 004AC044    pop         ebx
 004AC045    pop         ecx
 004AC046    pop         ebp
 004AC047    ret         8
*}
end;

//004AC04C
procedure TPrinter.SetPrinterCapabilities(Value:Integer);
begin
{*
 004AC04C    push        ebx
 004AC04D    push        esi
 004AC04E    mov         esi,edx
 004AC050    mov         ebx,eax
 004AC052    movzx       eax,byte ptr ds:[4AC084]
 004AC059    mov         byte ptr [ebx+1E],al
 004AC05C    test        esi,1
>004AC062    je          004AC068
 004AC064    or          byte ptr [ebx+1E],2
 004AC068    test        esi,100
>004AC06E    je          004AC074
 004AC070    or          byte ptr [ebx+1E],1
 004AC074    test        esi,8000
>004AC07A    je          004AC080
 004AC07C    or          byte ptr [ebx+1E],4
 004AC080    pop         esi
 004AC081    pop         ebx
 004AC082    ret
*}
end;

//004AC088
procedure TPrinter.SetPrinter(ADevice:PWideChar; ADriver:PWideChar; ADeviceMode:Cardinal; APort:PWideChar);
begin
{*
 004AC088    push        ebp
 004AC089    mov         ebp,esp
 004AC08B    add         esp,0FFFFFFD8
 004AC08E    push        ebx
 004AC08F    push        esi
 004AC090    push        edi
 004AC091    xor         ebx,ebx
 004AC093    mov         dword ptr [ebp-14],ebx
 004AC096    mov         dword ptr [ebp-18],ebx
 004AC099    mov         dword ptr [ebp-8],ecx
 004AC09C    mov         dword ptr [ebp-4],edx
 004AC09F    mov         esi,eax
 004AC0A1    mov         ebx,dword ptr [ebp+8]
 004AC0A4    xor         eax,eax
 004AC0A6    push        ebp
 004AC0A7    push        4AC294
 004AC0AC    push        dword ptr fs:[eax]
 004AC0AF    mov         dword ptr fs:[eax],esp
 004AC0B2    xor         edx,edx
 004AC0B4    mov         eax,esi
 004AC0B6    call        TPrinter.CheckPrinting
 004AC0BB    mov         eax,dword ptr [esi+2C]
 004AC0BE    cmp         ebx,eax
>004AC0C0    je          004AC0DD
 004AC0C2    test        eax,eax
>004AC0C4    je          004AC0DA
 004AC0C6    push        eax
 004AC0C7    call        kernel32.GlobalUnlock
 004AC0CC    mov         eax,dword ptr [esi+2C]
 004AC0CF    push        eax
 004AC0D0    call        kernel32.GlobalFree
 004AC0D5    xor         eax,eax
 004AC0D7    mov         dword ptr [esi+28],eax
 004AC0DA    mov         dword ptr [esi+2C],ebx
 004AC0DD    mov         ebx,dword ptr [esi+2C]
 004AC0E0    test        ebx,ebx
>004AC0E2    je          004AC0F9
 004AC0E4    push        ebx
 004AC0E5    call        kernel32.GlobalLock
 004AC0EA    mov         edi,eax
 004AC0EC    mov         dword ptr [esi+28],edi
 004AC0EF    mov         edx,dword ptr [edi+48]
 004AC0F2    mov         eax,esi
 004AC0F4    call        TPrinter.SetPrinterCapabilities
 004AC0F9    mov         eax,esi
 004AC0FB    call        TPrinter.FreeFonts
 004AC100    mov         eax,dword ptr [esi+24]
 004AC103    test        eax,eax
>004AC105    je          004AC112
 004AC107    push        eax
 004AC108    call        winspool.ClosePrinter
 004AC10D    xor         eax,eax
 004AC10F    mov         dword ptr [esi+24],eax
 004AC112    xor         edx,edx
 004AC114    mov         eax,esi
 004AC116    call        TPrinter.SetState
 004AC11B    mov         dword ptr [ebp-0C],0FFFFFFFF
 004AC122    mov         eax,esi
 004AC124    call        TPrinter.GetPrinters
 004AC129    mov         dword ptr [ebp-10],eax
 004AC12C    mov         eax,dword ptr [ebp-10]
 004AC12F    mov         edx,dword ptr [eax]
 004AC131    call        dword ptr [edx+14]
 004AC134    mov         edi,eax
 004AC136    dec         edi
 004AC137    test        edi,edi
>004AC139    jl          004AC179
 004AC13B    inc         edi
 004AC13C    xor         ebx,ebx
 004AC13E    mov         eax,dword ptr [ebp+0C]
 004AC141    push        eax
 004AC142    mov         edx,ebx
 004AC144    mov         eax,dword ptr [ebp-10]
 004AC147    mov         ecx,dword ptr [eax]
 004AC149    call        dword ptr [ecx+18]
 004AC14C    mov         ecx,dword ptr [ebp-4]
 004AC14F    mov         edx,dword ptr [ebp-8]
 004AC152    call        TPrinterDevice.IsEqual
 004AC157    test        al,al
>004AC159    je          004AC175
 004AC15B    mov         edx,ebx
 004AC15D    mov         eax,dword ptr [ebp-10]
 004AC160    mov         ecx,dword ptr [eax]
 004AC162    call        dword ptr [ecx+18]
 004AC165    add         eax,0C
 004AC168    mov         edx,dword ptr [ebp+0C]
 004AC16B    call        @UStrFromPWChar
 004AC170    mov         dword ptr [ebp-0C],ebx
>004AC173    jmp         004AC179
 004AC175    inc         ebx
 004AC176    dec         edi
>004AC177    jne         004AC13E
 004AC179    cmp         dword ptr [ebp-0C],0FFFFFFFF
>004AC17D    jne         004AC1E3
 004AC17F    mov         eax,dword ptr [esi+10]
 004AC182    mov         edx,dword ptr [eax]
 004AC184    call        dword ptr [edx+14]
 004AC187    mov         dword ptr [ebp-0C],eax
 004AC18A    mov         eax,dword ptr [ebp-4]
 004AC18D    push        eax
 004AC18E    mov         eax,dword ptr [ebp+0C]
 004AC191    push        eax
 004AC192    mov         ecx,dword ptr [ebp-8]
 004AC195    mov         dl,1
 004AC197    mov         eax,[004AB68C];TPrinterDevice
 004AC19C    call        TPrinterDevice.Create
 004AC1A1    push        eax
 004AC1A2    lea         eax,[ebp-14]
 004AC1A5    push        eax
 004AC1A6    lea         edx,[ebp-18]
 004AC1A9    mov         eax,[0078CDE8];^SResString216:TResStringRec
 004AC1AE    call        LoadResString
 004AC1B3    mov         eax,dword ptr [ebp-18]
 004AC1B6    mov         edx,dword ptr [ebp-4]
 004AC1B9    mov         dword ptr [ebp-28],edx
 004AC1BC    mov         byte ptr [ebp-24],0A
 004AC1C0    mov         edx,dword ptr [ebp+0C]
 004AC1C3    mov         dword ptr [ebp-20],edx
 004AC1C6    mov         byte ptr [ebp-1C],0A
 004AC1CA    lea         edx,[ebp-28]
 004AC1CD    mov         ecx,1
 004AC1D2    call        Format
 004AC1D7    mov         edx,dword ptr [ebp-14]
 004AC1DA    mov         eax,dword ptr [esi+10]
 004AC1DD    pop         ecx
 004AC1DE    mov         ebx,dword ptr [eax]
 004AC1E0    call        dword ptr [ebx+3C]
 004AC1E3    mov         eax,dword ptr [ebp-0C]
 004AC1E6    mov         dword ptr [esi+14],eax
 004AC1E9    push        0
 004AC1EB    lea         eax,[esi+24]
 004AC1EE    push        eax
 004AC1EF    mov         eax,dword ptr [ebp-4]
 004AC1F2    push        eax
 004AC1F3    call        winspool.OpenPrinterW
 004AC1F8    test        eax,eax
>004AC1FA    je          004AC279
 004AC1FC    cmp         dword ptr [esi+2C],0
>004AC200    jne         004AC266
 004AC202    push        0
 004AC204    push        0
 004AC206    push        0
 004AC208    mov         eax,dword ptr [ebp-4]
 004AC20B    push        eax
 004AC20C    mov         eax,dword ptr [esi+24]
 004AC20F    push        eax
 004AC210    push        0
 004AC212    call        winspool.DocumentPropertiesW
 004AC217    push        eax
 004AC218    push        42
 004AC21A    call        kernel32.GlobalAlloc
 004AC21F    mov         ebx,eax
 004AC221    mov         dword ptr [esi+2C],ebx
 004AC224    test        ebx,ebx
>004AC226    je          004AC266
 004AC228    push        ebx
 004AC229    call        kernel32.GlobalLock
 004AC22E    mov         edi,eax
 004AC230    mov         dword ptr [esi+28],edi
 004AC233    push        2
 004AC235    push        edi
 004AC236    push        edi
 004AC237    mov         eax,dword ptr [ebp-4]
 004AC23A    push        eax
 004AC23B    mov         eax,dword ptr [esi+24]
 004AC23E    push        eax
 004AC23F    push        0
 004AC241    call        winspool.DocumentPropertiesW
 004AC246    test        eax,eax
>004AC248    jge         004AC266
 004AC24A    mov         eax,dword ptr [esi+2C]
 004AC24D    push        eax
 004AC24E    call        kernel32.GlobalUnlock
 004AC253    mov         eax,dword ptr [esi+2C]
 004AC256    push        eax
 004AC257    call        kernel32.GlobalFree
 004AC25C    xor         eax,eax
 004AC25E    mov         dword ptr [esi+2C],eax
 004AC261    xor         eax,eax
 004AC263    mov         dword ptr [esi+28],eax
 004AC266    cmp         dword ptr [esi+2C],0
>004AC26A    je          004AC279
 004AC26C    mov         eax,dword ptr [esi+28]
 004AC26F    mov         edx,dword ptr [eax+48]
 004AC272    mov         eax,esi
 004AC274    call        TPrinter.SetPrinterCapabilities
 004AC279    xor         eax,eax
 004AC27B    pop         edx
 004AC27C    pop         ecx
 004AC27D    pop         ecx
 004AC27E    mov         dword ptr fs:[eax],edx
 004AC281    push        4AC29B
 004AC286    lea         eax,[ebp-18]
 004AC289    mov         edx,2
 004AC28E    call        @UStrArrayClr
 004AC293    ret
>004AC294    jmp         @HandleFinally
>004AC299    jmp         004AC286
 004AC29B    pop         edi
 004AC29C    pop         esi
 004AC29D    pop         ebx
 004AC29E    mov         esp,ebp
 004AC2A0    pop         ebp
 004AC2A1    ret         8
*}
end;

//004AC2A4
function TPrinter.GetCanvas:TCanvas;
begin
{*
 004AC2A4    push        ebx
 004AC2A5    mov         ebx,eax
 004AC2A7    cmp         dword ptr [ebx+4],0
>004AC2AB    jne         004AC2BE
 004AC2AD    mov         ecx,ebx
 004AC2AF    mov         dl,1
 004AC2B1    mov         eax,[004AB928];TPrinterCanvas
 004AC2B6    call        TPrinterCanvas.Create
 004AC2BB    mov         dword ptr [ebx+4],eax
 004AC2BE    mov         eax,dword ptr [ebx+4]
 004AC2C1    pop         ebx
 004AC2C2    ret
*}
end;

//004AC2C4
function EnumFontsProc(var LogFont:TLogFont; var TextMetric:TTextMetric; FontType:Integer; Data:Pointer):Integer; stdcall;
begin
{*
 004AC2C4    push        ebp
 004AC2C5    mov         ebp,esp
 004AC2C7    push        0
 004AC2C9    push        ebx
 004AC2CA    xor         eax,eax
 004AC2CC    push        ebp
 004AC2CD    push        4AC311
 004AC2D2    push        dword ptr fs:[eax]
 004AC2D5    mov         dword ptr fs:[eax],esp
 004AC2D8    lea         eax,[ebp-4]
 004AC2DB    mov         edx,dword ptr [ebp+8]
 004AC2DE    add         edx,1C
 004AC2E1    mov         ecx,20
 004AC2E6    call        @UStrFromWArray
 004AC2EB    mov         edx,dword ptr [ebp-4]
 004AC2EE    mov         eax,dword ptr [ebp+14]
 004AC2F1    mov         ecx,dword ptr [eax]
 004AC2F3    call        dword ptr [ecx+38]
 004AC2F6    mov         ebx,1
 004AC2FB    xor         eax,eax
 004AC2FD    pop         edx
 004AC2FE    pop         ecx
 004AC2FF    pop         ecx
 004AC300    mov         dword ptr fs:[eax],edx
 004AC303    push        4AC318
 004AC308    lea         eax,[ebp-4]
 004AC30B    call        @UStrClr
 004AC310    ret
>004AC311    jmp         @HandleFinally
>004AC316    jmp         004AC308
 004AC318    mov         eax,ebx
 004AC31A    pop         ebx
 004AC31B    pop         ecx
 004AC31C    pop         ebp
 004AC31D    ret         10
*}
end;

//004AC320
function TPrinter.GetFonts:TStrings;
begin
{*
 004AC320    push        ebp
 004AC321    mov         ebp,esp
 004AC323    push        ecx
 004AC324    push        ebx
 004AC325    push        esi
 004AC326    push        edi
 004AC327    mov         dword ptr [ebp-4],eax
 004AC32A    mov         eax,dword ptr [ebp-4]
 004AC32D    cmp         dword ptr [eax+8],0
>004AC331    jne         004AC3A3
 004AC333    xor         ecx,ecx
 004AC335    push        ebp
 004AC336    push        4AC381
 004AC33B    push        dword ptr fs:[ecx]
 004AC33E    mov         dword ptr fs:[ecx],esp
 004AC341    mov         dl,1
 004AC343    mov         eax,dword ptr [ebp-4]
 004AC346    call        TPrinter.SetState
 004AC34B    mov         dl,1
 004AC34D    mov         eax,[0043C7BC];TStringList
 004AC352    call        TStringList.Create
 004AC357    mov         edx,dword ptr [ebp-4]
 004AC35A    mov         dword ptr [edx+8],eax
 004AC35D    mov         eax,dword ptr [ebp-4]
 004AC360    mov         eax,dword ptr [eax+8]
 004AC363    push        eax
 004AC364    push        4AC2C4;EnumFontsProc:Integer
 004AC369    push        0
 004AC36B    mov         eax,dword ptr [ebp-4]
 004AC36E    mov         eax,dword ptr [eax+20]
 004AC371    push        eax
 004AC372    call        gdi32.EnumFontsW
 004AC377    xor         eax,eax
 004AC379    pop         edx
 004AC37A    pop         ecx
 004AC37B    pop         ecx
 004AC37C    mov         dword ptr fs:[eax],edx
>004AC37F    jmp         004AC3A3
>004AC381    jmp         @HandleAnyException
 004AC386    mov         eax,dword ptr [ebp-4]
 004AC389    add         eax,8
 004AC38C    mov         edx,dword ptr [eax]
 004AC38E    xor         ecx,ecx
 004AC390    mov         dword ptr [eax],ecx
 004AC392    mov         eax,edx
 004AC394    call        TObject.Free
 004AC399    call        @RaiseAgain
 004AC39E    call        @DoneExcept
 004AC3A3    mov         eax,dword ptr [ebp-4]
 004AC3A6    mov         eax,dword ptr [eax+8]
 004AC3A9    pop         edi
 004AC3AA    pop         esi
 004AC3AB    pop         ebx
 004AC3AC    pop         ecx
 004AC3AD    pop         ebp
 004AC3AE    ret
*}
end;

//004AC3B0
function TPrinter.GetHandle:HDC;
begin
{*
 004AC3B0    push        ebx
 004AC3B1    mov         ebx,eax
 004AC3B3    mov         dl,1
 004AC3B5    mov         eax,ebx
 004AC3B7    call        TPrinter.SetState
 004AC3BC    mov         eax,dword ptr [ebx+20]
 004AC3BF    pop         ebx
 004AC3C0    ret
*}
end;

//004AC3C4
function TPrinter.GetNumCopies:Integer;
begin
{*
 004AC3C4    push        ebp
 004AC3C5    mov         ebp,esp
 004AC3C7    push        0
 004AC3C9    push        ebx
 004AC3CA    mov         ebx,eax
 004AC3CC    xor         eax,eax
 004AC3CE    push        ebp
 004AC3CF    push        4AC41B
 004AC3D4    push        dword ptr fs:[eax]
 004AC3D7    mov         dword ptr fs:[eax],esp
 004AC3DA    mov         eax,ebx
 004AC3DC    call        TPrinter.GetPrinterIndex
 004AC3E1    cmp         dword ptr [ebx+2C],0
>004AC3E5    jne         004AC3FC
 004AC3E7    lea         edx,[ebp-4]
 004AC3EA    mov         eax,[0078DB54];^SResString285:TResStringRec
 004AC3EF    call        LoadResString
 004AC3F4    mov         eax,dword ptr [ebp-4]
 004AC3F7    call        RaiseError
 004AC3FC    mov         eax,dword ptr [ebx+28]
 004AC3FF    movsx       eax,word ptr [eax+56]
 004AC403    mov         ebx,eax
 004AC405    xor         eax,eax
 004AC407    pop         edx
 004AC408    pop         ecx
 004AC409    pop         ecx
 004AC40A    mov         dword ptr fs:[eax],edx
 004AC40D    push        4AC422
 004AC412    lea         eax,[ebp-4]
 004AC415    call        @UStrClr
 004AC41A    ret
>004AC41B    jmp         @HandleFinally
>004AC420    jmp         004AC412
 004AC422    mov         eax,ebx
 004AC424    pop         ebx
 004AC425    pop         ecx
 004AC426    pop         ebp
 004AC427    ret
*}
end;

//004AC428
procedure TPrinter.SetNumCopies(Value:Integer);
begin
{*
 004AC428    push        ebp
 004AC429    mov         ebp,esp
 004AC42B    push        0
 004AC42D    push        ebx
 004AC42E    push        esi
 004AC42F    mov         esi,edx
 004AC431    mov         ebx,eax
 004AC433    xor         eax,eax
 004AC435    push        ebp
 004AC436    push        4AC492
 004AC43B    push        dword ptr fs:[eax]
 004AC43E    mov         dword ptr fs:[eax],esp
 004AC441    xor         edx,edx
 004AC443    mov         eax,ebx
 004AC445    call        TPrinter.CheckPrinting
 004AC44A    mov         eax,ebx
 004AC44C    call        TPrinter.GetPrinterIndex
 004AC451    cmp         dword ptr [ebx+2C],0
>004AC455    jne         004AC46C
 004AC457    lea         edx,[ebp-4]
 004AC45A    mov         eax,[0078DB54];^SResString285:TResStringRec
 004AC45F    call        LoadResString
 004AC464    mov         eax,dword ptr [ebp-4]
 004AC467    call        RaiseError
 004AC46C    xor         edx,edx
 004AC46E    mov         eax,ebx
 004AC470    call        TPrinter.SetState
 004AC475    mov         eax,dword ptr [ebx+28]
 004AC478    mov         word ptr [eax+56],si
 004AC47C    xor         eax,eax
 004AC47E    pop         edx
 004AC47F    pop         ecx
 004AC480    pop         ecx
 004AC481    mov         dword ptr fs:[eax],edx
 004AC484    push        4AC499
 004AC489    lea         eax,[ebp-4]
 004AC48C    call        @UStrClr
 004AC491    ret
>004AC492    jmp         @HandleFinally
>004AC497    jmp         004AC489
 004AC499    pop         esi
 004AC49A    pop         ebx
 004AC49B    pop         ecx
 004AC49C    pop         ebp
 004AC49D    ret
*}
end;

//004AC4A0
function TPrinter.GetOrientation:TPrinterOrientation;
begin
{*
 004AC4A0    push        ebp
 004AC4A1    mov         ebp,esp
 004AC4A3    push        0
 004AC4A5    push        ebx
 004AC4A6    mov         ebx,eax
 004AC4A8    xor         eax,eax
 004AC4AA    push        ebp
 004AC4AB    push        4AC4FE
 004AC4B0    push        dword ptr fs:[eax]
 004AC4B3    mov         dword ptr fs:[eax],esp
 004AC4B6    mov         eax,ebx
 004AC4B8    call        TPrinter.GetPrinterIndex
 004AC4BD    cmp         dword ptr [ebx+2C],0
>004AC4C1    jne         004AC4D8
 004AC4C3    lea         edx,[ebp-4]
 004AC4C6    mov         eax,[0078DB54];^SResString285:TResStringRec
 004AC4CB    call        LoadResString
 004AC4D0    mov         eax,dword ptr [ebp-4]
 004AC4D3    call        RaiseError
 004AC4D8    mov         eax,dword ptr [ebx+28]
 004AC4DB    cmp         word ptr [eax+4C],1
>004AC4E0    jne         004AC4E6
 004AC4E2    xor         ebx,ebx
>004AC4E4    jmp         004AC4E8
 004AC4E6    mov         bl,1
 004AC4E8    xor         eax,eax
 004AC4EA    pop         edx
 004AC4EB    pop         ecx
 004AC4EC    pop         ecx
 004AC4ED    mov         dword ptr fs:[eax],edx
 004AC4F0    push        4AC505
 004AC4F5    lea         eax,[ebp-4]
 004AC4F8    call        @UStrClr
 004AC4FD    ret
>004AC4FE    jmp         @HandleFinally
>004AC503    jmp         004AC4F5
 004AC505    mov         eax,ebx
 004AC507    pop         ebx
 004AC508    pop         ecx
 004AC509    pop         ebp
 004AC50A    ret
*}
end;

//004AC50C
procedure TPrinter.SetOrientation(Value:TPrinterOrientation);
begin
{*
 004AC50C    push        ebp
 004AC50D    mov         ebp,esp
 004AC50F    push        0
 004AC511    push        ebx
 004AC512    push        esi
 004AC513    mov         ebx,edx
 004AC515    mov         esi,eax
 004AC517    xor         eax,eax
 004AC519    push        ebp
 004AC51A    push        4AC581
 004AC51F    push        dword ptr fs:[eax]
 004AC522    mov         dword ptr fs:[eax],esp
 004AC525    xor         edx,edx
 004AC527    mov         eax,esi
 004AC529    call        TPrinter.CheckPrinting
 004AC52E    mov         eax,esi
 004AC530    call        TPrinter.GetPrinterIndex
 004AC535    cmp         dword ptr [esi+2C],0
>004AC539    jne         004AC550
 004AC53B    lea         edx,[ebp-4]
 004AC53E    mov         eax,[0078DB54];^SResString285:TResStringRec
 004AC543    call        LoadResString
 004AC548    mov         eax,dword ptr [ebp-4]
 004AC54B    call        RaiseError
 004AC550    xor         edx,edx
 004AC552    mov         eax,esi
 004AC554    call        TPrinter.SetState
 004AC559    movzx       eax,bl
 004AC55C    movzx       eax,word ptr [eax*4+785D4C]
 004AC564    mov         edx,dword ptr [esi+28]
 004AC567    mov         word ptr [edx+4C],ax
 004AC56B    xor         eax,eax
 004AC56D    pop         edx
 004AC56E    pop         ecx
 004AC56F    pop         ecx
 004AC570    mov         dword ptr fs:[eax],edx
 004AC573    push        4AC588
 004AC578    lea         eax,[ebp-4]
 004AC57B    call        @UStrClr
 004AC580    ret
>004AC581    jmp         @HandleFinally
>004AC586    jmp         004AC578
 004AC588    pop         esi
 004AC589    pop         ebx
 004AC58A    pop         ecx
 004AC58B    pop         ebp
 004AC58C    ret
*}
end;

//004AC590
function TPrinter.GetPageHeight:Integer;
begin
{*
 004AC590    push        ebx
 004AC591    mov         ebx,eax
 004AC593    mov         dl,1
 004AC595    mov         eax,ebx
 004AC597    call        TPrinter.SetState
 004AC59C    push        0A
 004AC59E    mov         eax,dword ptr [ebx+20]
 004AC5A1    push        eax
 004AC5A2    call        gdi32.GetDeviceCaps
 004AC5A7    pop         ebx
 004AC5A8    ret
*}
end;

//004AC5AC
function TPrinter.GetPageWidth:Integer;
begin
{*
 004AC5AC    push        ebx
 004AC5AD    mov         ebx,eax
 004AC5AF    mov         dl,1
 004AC5B1    mov         eax,ebx
 004AC5B3    call        TPrinter.SetState
 004AC5B8    push        8
 004AC5BA    mov         eax,dword ptr [ebx+20]
 004AC5BD    push        eax
 004AC5BE    call        gdi32.GetDeviceCaps
 004AC5C3    pop         ebx
 004AC5C4    ret
*}
end;

//004AC5C8
function TPrinter.GetPrinterIndex:Integer;
begin
{*
 004AC5C8    push        ebx
 004AC5C9    mov         ebx,eax
 004AC5CB    cmp         dword ptr [ebx+14],0FFFFFFFF
>004AC5CF    jne         004AC5D8
 004AC5D1    mov         eax,ebx
 004AC5D3    call        TPrinter.SetToDefaultPrinter
 004AC5D8    mov         eax,dword ptr [ebx+14]
 004AC5DB    pop         ebx
 004AC5DC    ret
*}
end;

//004AC5E0
procedure TPrinter.SetPrinterIndex(Value:Integer);
begin
{*
 004AC5E0    push        ebp
 004AC5E1    mov         ebp,esp
 004AC5E3    add         esp,0FFFFF9F8
 004AC5E9    push        ebx
 004AC5EA    push        esi
 004AC5EB    xor         ecx,ecx
 004AC5ED    mov         dword ptr [ebp-608],ecx
 004AC5F3    mov         esi,edx
 004AC5F5    mov         ebx,eax
 004AC5F7    xor         eax,eax
 004AC5F9    push        ebp
 004AC5FA    push        4AC6F6
 004AC5FF    push        dword ptr fs:[eax]
 004AC602    mov         dword ptr fs:[eax],esp
 004AC605    xor         edx,edx
 004AC607    mov         eax,ebx
 004AC609    call        TPrinter.CheckPrinting
 004AC60E    cmp         esi,0FFFFFFFF
>004AC611    jl          004AC623
 004AC613    mov         eax,ebx
 004AC615    call        TPrinter.GetPrinters
 004AC61A    mov         edx,dword ptr [eax]
 004AC61C    call        dword ptr [edx+14]
 004AC61F    cmp         esi,eax
>004AC621    jl          004AC63E
 004AC623    lea         edx,[ebp-608]
 004AC629    mov         eax,[0078D558];^SResString214:TResStringRec
 004AC62E    call        LoadResString
 004AC633    mov         eax,dword ptr [ebp-608]
 004AC639    call        RaiseError
 004AC63E    cmp         esi,0FFFFFFFF
>004AC641    je          004AC64D
 004AC643    mov         eax,ebx
 004AC645    call        TPrinter.GetPrinterIndex
 004AC64A    inc         eax
>004AC64B    jne         004AC654
 004AC64D    mov         eax,ebx
 004AC64F    call        TPrinter.SetToDefaultPrinter
 004AC654    cmp         esi,dword ptr [ebx+14]
>004AC657    je          004AC6DD
 004AC65D    cmp         esi,0FFFFFFFF
>004AC660    je          004AC665
 004AC662    mov         dword ptr [ebx+14],esi
 004AC665    mov         eax,ebx
 004AC667    call        TPrinter.GetPrinters
 004AC66C    mov         edx,dword ptr [ebx+14]
 004AC66F    mov         ecx,dword ptr [eax]
 004AC671    call        dword ptr [ecx+18]
 004AC674    lea         eax,[ebp-604]
 004AC67A    push        eax
 004AC67B    lea         eax,[ebp-4]
 004AC67E    push        eax
 004AC67F    call        Printer
 004AC684    lea         ecx,[ebp-404]
 004AC68A    lea         edx,[ebp-204]
 004AC690    call        TPrinter.GetPrinter
 004AC695    mov         eax,dword ptr [ebp-4]
 004AC698    push        eax
 004AC699    call        kernel32.GlobalUnlock
 004AC69E    mov         eax,dword ptr [ebp-4]
 004AC6A1    push        eax
 004AC6A2    call        kernel32.GlobalFree
 004AC6A7    xor         eax,eax
 004AC6A9    mov         dword ptr [ebp-4],eax
 004AC6AC    lea         eax,[ebp-604]
 004AC6B2    push        eax
 004AC6B3    mov         eax,dword ptr [ebp-4]
 004AC6B6    push        eax
 004AC6B7    call        Printer
 004AC6BC    lea         ecx,[ebp-404]
 004AC6C2    lea         edx,[ebp-204]
 004AC6C8    call        TPrinter.SetPrinter
 004AC6CD    mov         eax,ebx
 004AC6CF    call        TPrinter.FreeFonts
 004AC6D4    xor         edx,edx
 004AC6D6    mov         eax,ebx
 004AC6D8    call        TPrinter.SetState
 004AC6DD    xor         eax,eax
 004AC6DF    pop         edx
 004AC6E0    pop         ecx
 004AC6E1    pop         ecx
 004AC6E2    mov         dword ptr fs:[eax],edx
 004AC6E5    push        4AC6FD
 004AC6EA    lea         eax,[ebp-608]
 004AC6F0    call        @UStrClr
 004AC6F5    ret
>004AC6F6    jmp         @HandleFinally
>004AC6FB    jmp         004AC6EA
 004AC6FD    pop         esi
 004AC6FE    pop         ebx
 004AC6FF    mov         esp,ebp
 004AC701    pop         ebp
 004AC702    ret
*}
end;

//004AC704
function TPrinter.GetPrinters:TStrings;
begin
{*
 004AC704    push        ebp
 004AC705    mov         ebp,esp
 004AC707    add         esp,0FFFFFFC4
 004AC70A    push        ebx
 004AC70B    push        esi
 004AC70C    push        edi
 004AC70D    xor         edx,edx
 004AC70F    mov         dword ptr [ebp-28],edx
 004AC712    mov         dword ptr [ebp-2C],edx
 004AC715    mov         dword ptr [ebp-24],edx
 004AC718    mov         dword ptr [ebp-4],eax
 004AC71B    xor         eax,eax
 004AC71D    push        ebp
 004AC71E    push        4AC933
 004AC723    push        dword ptr fs:[eax]
 004AC726    mov         dword ptr fs:[eax],esp
 004AC729    mov         eax,dword ptr [ebp-4]
 004AC72C    cmp         dword ptr [eax+10],0
>004AC730    jne         004AC912
 004AC736    mov         dl,1
 004AC738    mov         eax,[0043C7BC];TStringList
 004AC73D    call        TStringList.Create
 004AC742    mov         ebx,eax
 004AC744    mov         eax,dword ptr [ebp-4]
 004AC747    mov         dword ptr [eax+10],ebx
 004AC74A    xor         edx,edx
 004AC74C    push        ebp
 004AC74D    push        4AC8F0
 004AC752    push        dword ptr fs:[edx]
 004AC755    mov         dword ptr fs:[edx],esp
 004AC758    mov         eax,[0078DB58];^gvar_00784C7C
 004AC75D    cmp         dword ptr [eax],2
>004AC760    jne         004AC76D
 004AC762    mov         esi,6
 004AC767    mov         byte ptr [ebp-0D],4
>004AC76B    jmp         004AC776
 004AC76D    mov         esi,2
 004AC772    mov         byte ptr [ebp-0D],5
 004AC776    xor         eax,eax
 004AC778    mov         dword ptr [ebp-8],eax
 004AC77B    lea         eax,[ebp-0C]
 004AC77E    push        eax
 004AC77F    lea         eax,[ebp-8]
 004AC782    push        eax
 004AC783    push        0
 004AC785    push        0
 004AC787    movzx       edi,byte ptr [ebp-0D]
 004AC78B    push        edi
 004AC78C    push        0
 004AC78E    push        esi
 004AC78F    call        winspool.EnumPrintersW
 004AC794    cmp         dword ptr [ebp-8],0
>004AC798    jne         004AC7A7
 004AC79A    xor         eax,eax
 004AC79C    pop         edx
 004AC79D    pop         ecx
 004AC79E    pop         ecx
 004AC79F    mov         dword ptr fs:[eax],edx
>004AC7A2    jmp         004AC918
 004AC7A7    mov         eax,dword ptr [ebp-8]
 004AC7AA    call        @GetMem
 004AC7AF    mov         dword ptr [ebp-18],eax
 004AC7B2    xor         edx,edx
 004AC7B4    push        ebp
 004AC7B5    push        4AC8DF
 004AC7BA    push        dword ptr fs:[edx]
 004AC7BD    mov         dword ptr fs:[edx],esp
 004AC7C0    lea         eax,[ebp-0C]
 004AC7C3    push        eax
 004AC7C4    lea         eax,[ebp-8]
 004AC7C7    push        eax
 004AC7C8    mov         eax,dword ptr [ebp-8]
 004AC7CB    push        eax
 004AC7CC    mov         eax,dword ptr [ebp-18]
 004AC7CF    push        eax
 004AC7D0    push        edi
 004AC7D1    push        0
 004AC7D3    push        esi
 004AC7D4    call        winspool.EnumPrintersW
 004AC7D9    test        eax,eax
>004AC7DB    jne         004AC7EF
 004AC7DD    call        @TryFinallyExit
 004AC7E2    xor         eax,eax
 004AC7E4    pop         edx
 004AC7E5    pop         ecx
 004AC7E6    pop         ecx
 004AC7E7    mov         dword ptr fs:[eax],edx
>004AC7EA    jmp         004AC918
 004AC7EF    mov         eax,dword ptr [ebp-18]
 004AC7F2    mov         dword ptr [ebp-1C],eax
 004AC7F5    mov         eax,dword ptr [ebp-0C]
 004AC7F8    dec         eax
 004AC7F9    test        eax,eax
>004AC7FB    jl          004AC8C6
 004AC801    inc         eax
 004AC802    mov         dword ptr [ebp-20],eax
 004AC805    cmp         byte ptr [ebp-0D],4
>004AC809    jne         004AC841
 004AC80B    mov         ebx,dword ptr [ebp-1C]
 004AC80E    mov         esi,dword ptr [ebx]
 004AC810    push        esi
 004AC811    push        0
 004AC813    xor         ecx,ecx
 004AC815    mov         dl,1
 004AC817    mov         eax,[004AB68C];TPrinterDevice
 004AC81C    call        TPrinterDevice.Create
 004AC821    push        eax
 004AC822    lea         eax,[ebp-24]
 004AC825    mov         edx,esi
 004AC827    call        @UStrFromPWChar
 004AC82C    mov         edx,dword ptr [ebp-24]
 004AC82F    mov         eax,dword ptr [ebp-4]
 004AC832    mov         eax,dword ptr [eax+10]
 004AC835    pop         ecx
 004AC836    mov         ebx,dword ptr [eax]
 004AC838    call        dword ptr [ebx+3C]
 004AC83B    add         dword ptr [ebp-1C],0C
>004AC83F    jmp         004AC8BD
 004AC841    mov         esi,dword ptr [ebp-1C]
 004AC844    mov         eax,dword ptr [esi+4]
 004AC847    mov         dword ptr [ebp-14],eax
 004AC84A    lea         eax,[ebp-14]
 004AC84D    call        FetchStr
 004AC852    mov         ebx,eax
>004AC854    jmp         004AC8B3
 004AC856    mov         eax,dword ptr [esi]
 004AC858    push        eax
 004AC859    push        ebx
 004AC85A    xor         ecx,ecx
 004AC85C    mov         dl,1
 004AC85E    mov         eax,[004AB68C];TPrinterDevice
 004AC863    call        TPrinterDevice.Create
 004AC868    push        eax
 004AC869    lea         eax,[ebp-28]
 004AC86C    push        eax
 004AC86D    lea         edx,[ebp-2C]
 004AC870    mov         eax,[0078CDE8];^SResString216:TResStringRec
 004AC875    call        LoadResString
 004AC87A    mov         eax,dword ptr [ebp-2C]
 004AC87D    mov         edx,dword ptr [esi]
 004AC87F    mov         dword ptr [ebp-3C],edx
 004AC882    mov         byte ptr [ebp-38],0A
 004AC886    mov         dword ptr [ebp-34],ebx
 004AC889    mov         byte ptr [ebp-30],0A
 004AC88D    lea         edx,[ebp-3C]
 004AC890    mov         ecx,1
 004AC895    call        Format
 004AC89A    mov         edx,dword ptr [ebp-28]
 004AC89D    mov         eax,dword ptr [ebp-4]
 004AC8A0    mov         eax,dword ptr [eax+10]
 004AC8A3    pop         ecx
 004AC8A4    mov         ebx,dword ptr [eax]
 004AC8A6    call        dword ptr [ebx+3C]
 004AC8A9    lea         eax,[ebp-14]
 004AC8AC    call        FetchStr
 004AC8B1    mov         ebx,eax
 004AC8B3    cmp         word ptr [ebx],0
>004AC8B7    jne         004AC856
 004AC8B9    add         dword ptr [ebp-1C],14
 004AC8BD    dec         dword ptr [ebp-20]
>004AC8C0    jne         004AC805
 004AC8C6    xor         eax,eax
 004AC8C8    pop         edx
 004AC8C9    pop         ecx
 004AC8CA    pop         ecx
 004AC8CB    mov         dword ptr fs:[eax],edx
 004AC8CE    push        4AC8E6
 004AC8D3    mov         edx,dword ptr [ebp-8]
 004AC8D6    mov         eax,dword ptr [ebp-18]
 004AC8D9    call        @FreeMem
 004AC8DE    ret
>004AC8DF    jmp         @HandleFinally
>004AC8E4    jmp         004AC8D3
 004AC8E6    xor         eax,eax
 004AC8E8    pop         edx
 004AC8E9    pop         ecx
 004AC8EA    pop         ecx
 004AC8EB    mov         dword ptr fs:[eax],edx
>004AC8EE    jmp         004AC912
>004AC8F0    jmp         @HandleAnyException
 004AC8F5    mov         eax,dword ptr [ebp-4]
 004AC8F8    mov         eax,dword ptr [eax+10]
 004AC8FB    call        TObject.Free
 004AC900    mov         eax,dword ptr [ebp-4]
 004AC903    xor         edx,edx
 004AC905    mov         dword ptr [eax+10],edx
 004AC908    call        @RaiseAgain
 004AC90D    call        @DoneExcept
 004AC912    mov         eax,dword ptr [ebp-4]
 004AC915    mov         ebx,dword ptr [eax+10]
 004AC918    xor         eax,eax
 004AC91A    pop         edx
 004AC91B    pop         ecx
 004AC91C    pop         ecx
 004AC91D    mov         dword ptr fs:[eax],edx
 004AC920    push        4AC93A
 004AC925    lea         eax,[ebp-2C]
 004AC928    mov         edx,3
 004AC92D    call        @UStrArrayClr
 004AC932    ret
>004AC933    jmp         @HandleFinally
>004AC938    jmp         004AC925
 004AC93A    mov         eax,ebx
 004AC93C    pop         edi
 004AC93D    pop         esi
 004AC93E    pop         ebx
 004AC93F    mov         esp,ebp
 004AC941    pop         ebp
 004AC942    ret
*}
end;

//004AC944
function winspool.GetDefaultPrinterW(pcchBuffer:LPDWORD):BOOL; stdcall;
begin
{*
 004AC944    jmp         dword ptr ds:[82682C]
*}
end;

//004AC94C
procedure TPrinter.SetToDefaultPrinter;
begin
{*
 004AC94C    push        ebp
 004AC94D    mov         ebp,esp
 004AC94F    add         esp,0FFFFF7D4
 004AC955    push        ebx
 004AC956    push        esi
 004AC957    push        edi
 004AC958    xor         edx,edx
 004AC95A    mov         dword ptr [ebp-82C],edx
 004AC960    mov         dword ptr [ebp-824],edx
 004AC966    mov         dword ptr [ebp-820],edx
 004AC96C    mov         dword ptr [ebp-4],eax
 004AC96F    xor         eax,eax
 004AC971    push        ebp
 004AC972    push        4ACB5D
 004AC977    push        dword ptr fs:[eax]
 004AC97A    mov         dword ptr fs:[eax],esp
 004AC97D    xor         eax,eax
 004AC97F    mov         dword ptr [ebp-0C],eax
 004AC982    xor         eax,eax
 004AC984    mov         dword ptr [ebp-10],eax
 004AC987    lea         eax,[ebp-10]
 004AC98A    push        eax
 004AC98B    lea         eax,[ebp-0C]
 004AC98E    push        eax
 004AC98F    push        0
 004AC991    push        0
 004AC993    push        5
 004AC995    push        0
 004AC997    push        1
 004AC999    call        winspool.EnumPrintersW
 004AC99E    test        eax,eax
>004AC9A0    jne         004AC9D8
 004AC9A2    call        kernel32.GetLastError
 004AC9A7    cmp         eax,7A
>004AC9AA    je          004AC9D8
 004AC9AC    call        kernel32.GetLastError
 004AC9B1    cmp         eax,7B
>004AC9B4    jne         004AC9D3
 004AC9B6    lea         edx,[ebp-820]
 004AC9BC    mov         eax,[0078CF40];^SResString286:TResStringRec
 004AC9C1    call        LoadResString
 004AC9C6    mov         eax,dword ptr [ebp-820]
 004AC9CC    call        RaiseError
>004AC9D1    jmp         004AC9D8
 004AC9D3    call        RaiseLastOSError
 004AC9D8    mov         eax,dword ptr [ebp-0C]
 004AC9DB    call        AllocMem
 004AC9E0    mov         dword ptr [ebp-1C],eax
 004AC9E3    xor         edx,edx
 004AC9E5    push        ebp
 004AC9E6    push        4ACB12
 004AC9EB    push        dword ptr fs:[edx]
 004AC9EE    mov         dword ptr fs:[edx],esp
 004AC9F1    lea         eax,[ebp-10]
 004AC9F4    push        eax
 004AC9F5    lea         eax,[ebp-0C]
 004AC9F8    push        eax
 004AC9F9    mov         eax,dword ptr [ebp-0C]
 004AC9FC    push        eax
 004AC9FD    mov         eax,dword ptr [ebp-1C]
 004ACA00    push        eax
 004ACA01    push        5
 004ACA03    push        0
 004ACA05    push        1
 004ACA07    call        winspool.EnumPrintersW
 004ACA0C    cmp         dword ptr [ebp-10],0
>004ACA10    jbe         004ACA1C
 004ACA12    mov         eax,dword ptr [ebp-1C]
 004ACA15    mov         eax,dword ptr [eax]
 004ACA17    mov         dword ptr [ebp-18],eax
>004ACA1A    jmp         004ACA5D
 004ACA1C    mov         dword ptr [ebp-8],400
 004ACA23    lea         eax,[ebp-8]
 004ACA26    push        eax
 004ACA27    lea         eax,[ebp-81C]
 004ACA2D    push        eax
 004ACA2E    call        winspool.GetDefaultPrinterW
 004ACA33    test        eax,eax
>004ACA35    jne         004ACA49
 004ACA37    mov         edx,dword ptr [ebp-8]
 004ACA3A    add         edx,edx
 004ACA3C    lea         eax,[ebp-81C]
 004ACA42    xor         ecx,ecx
 004ACA44    call        @FillChar
 004ACA49    lea         eax,[ebp-81C]
 004ACA4F    mov         dword ptr [ebp-14],eax
 004ACA52    lea         eax,[ebp-14]
 004ACA55    call        FetchStr
 004ACA5A    mov         dword ptr [ebp-18],eax
 004ACA5D    mov         eax,dword ptr [ebp-4]
 004ACA60    call        TPrinter.GetPrinters
 004ACA65    mov         esi,eax
 004ACA67    mov         eax,esi
 004ACA69    mov         edx,dword ptr [eax]
 004ACA6B    call        dword ptr [edx+14]
 004ACA6E    mov         ebx,eax
 004ACA70    dec         ebx
 004ACA71    test        ebx,ebx
>004ACA73    jl          004ACAFC
 004ACA79    inc         ebx
 004ACA7A    mov         dword ptr [ebp-8],0
 004ACA81    mov         edx,dword ptr [ebp-8]
 004ACA84    mov         eax,esi
 004ACA86    mov         ecx,dword ptr [eax]
 004ACA88    call        dword ptr [ecx+18]
 004ACA8B    mov         edi,dword ptr [eax+8]
 004ACA8E    lea         eax,[ebp-824]
 004ACA94    mov         edx,dword ptr [ebp-18]
 004ACA97    call        @UStrFromPWChar
 004ACA9C    mov         edx,dword ptr [ebp-824]
 004ACAA2    mov         dword ptr [ebp-828],edi
 004ACAA8    mov         eax,dword ptr [ebp-828]
 004ACAAE    call        AnsiCompareText
 004ACAB3    test        eax,eax
 004ACAB5    sete        al
 004ACAB8    test        al,al
>004ACABA    je          004ACAF6
 004ACABC    mov         edx,dword ptr [ebp-8]
 004ACABF    mov         eax,esi
 004ACAC1    mov         ecx,dword ptr [eax]
 004ACAC3    call        dword ptr [ecx+18]
 004ACAC6    mov         ebx,eax
 004ACAC8    mov         eax,dword ptr [ebx+0C]
 004ACACB    call        @UStrToPWChar
 004ACAD0    push        eax
 004ACAD1    push        0
 004ACAD3    mov         eax,dword ptr [ebx+4]
 004ACAD6    call        @UStrToPWChar
 004ACADB    push        eax
 004ACADC    mov         eax,dword ptr [ebx+8]
 004ACADF    call        @UStrToPWChar
 004ACAE4    mov         edx,eax
 004ACAE6    mov         eax,dword ptr [ebp-4]
 004ACAE9    pop         ecx
 004ACAEA    call        TPrinter.SetPrinter
 004ACAEF    call        @TryFinallyExit
>004ACAF4    jmp         004ACB34
 004ACAF6    inc         dword ptr [ebp-8]
 004ACAF9    dec         ebx
>004ACAFA    jne         004ACA81
 004ACAFC    xor         eax,eax
 004ACAFE    pop         edx
 004ACAFF    pop         ecx
 004ACB00    pop         ecx
 004ACB01    mov         dword ptr fs:[eax],edx
 004ACB04    push        4ACB19
 004ACB09    mov         eax,dword ptr [ebp-1C]
 004ACB0C    call        @FreeMem
 004ACB11    ret
>004ACB12    jmp         @HandleFinally
>004ACB17    jmp         004ACB09
 004ACB19    lea         edx,[ebp-82C]
 004ACB1F    mov         eax,[0078CF40];^SResString286:TResStringRec
 004ACB24    call        LoadResString
 004ACB29    mov         eax,dword ptr [ebp-82C]
 004ACB2F    call        RaiseError
 004ACB34    xor         eax,eax
 004ACB36    pop         edx
 004ACB37    pop         ecx
 004ACB38    pop         ecx
 004ACB39    mov         dword ptr fs:[eax],edx
 004ACB3C    push        4ACB64
 004ACB41    lea         eax,[ebp-82C]
 004ACB47    call        @UStrClr
 004ACB4C    lea         eax,[ebp-824]
 004ACB52    mov         edx,2
 004ACB57    call        @UStrArrayClr
 004ACB5C    ret
>004ACB5D    jmp         @HandleFinally
>004ACB62    jmp         004ACB41
 004ACB64    pop         edi
 004ACB65    pop         esi
 004ACB66    pop         ebx
 004ACB67    mov         esp,ebp
 004ACB69    pop         ebp
 004ACB6A    ret
*}
end;

//004ACB6C
procedure TPrinter.FreePrinters;
begin
{*
 004ACB6C    push        ebx
 004ACB6D    push        esi
 004ACB6E    push        edi
 004ACB6F    mov         esi,eax
 004ACB71    mov         ebx,dword ptr [esi+10]
 004ACB74    test        ebx,ebx
>004ACB76    je          004ACBAC
 004ACB78    mov         eax,ebx
 004ACB7A    mov         edx,dword ptr [eax]
 004ACB7C    call        dword ptr [edx+14]
 004ACB7F    dec         eax
 004ACB80    test        eax,eax
>004ACB82    jl          004ACB9C
 004ACB84    inc         eax
 004ACB85    mov         ebx,eax
 004ACB87    xor         edi,edi
 004ACB89    mov         edx,edi
 004ACB8B    mov         eax,dword ptr [esi+10]
 004ACB8E    mov         ecx,dword ptr [eax]
 004ACB90    call        dword ptr [ecx+18]
 004ACB93    call        TObject.Free
 004ACB98    inc         edi
 004ACB99    dec         ebx
>004ACB9A    jne         004ACB89
 004ACB9C    lea         eax,[esi+10]
 004ACB9F    mov         edx,dword ptr [eax]
 004ACBA1    xor         ecx,ecx
 004ACBA3    mov         dword ptr [eax],ecx
 004ACBA5    mov         eax,edx
 004ACBA7    call        TObject.Free
 004ACBAC    pop         edi
 004ACBAD    pop         esi
 004ACBAE    pop         ebx
 004ACBAF    ret
*}
end;

//004ACBB0
procedure TPrinter.FreeFonts;
begin
{*
 004ACBB0    add         eax,8
 004ACBB3    mov         edx,dword ptr [eax]
 004ACBB5    xor         ecx,ecx
 004ACBB7    mov         dword ptr [eax],ecx
 004ACBB9    mov         eax,edx
 004ACBBB    call        TObject.Free
 004ACBC0    ret
*}
end;

//004ACBC4
function Printer:TPrinter;
begin
{*
 004ACBC4    cmp         dword ptr ds:[785D48],0;gvar_00785D48
>004ACBCB    jne         004ACBDE
 004ACBCD    mov         dl,1
 004ACBCF    mov         eax,[004AAFC0];TPrinter
 004ACBD4    call        TPrinter.Create
 004ACBD9    mov         [00785D48],eax;gvar_00785D48
 004ACBDE    mov         eax,[00785D48];gvar_00785D48
 004ACBE3    ret
*}
end;

//004ACBE4
procedure TPrinter.Refresh;
begin
{*
 004ACBE4    push        ebx
 004ACBE5    mov         ebx,eax
 004ACBE7    mov         eax,ebx
 004ACBE9    call        TPrinter.FreeFonts
 004ACBEE    mov         eax,ebx
 004ACBF0    call        TPrinter.FreePrinters
 004ACBF5    pop         ebx
 004ACBF6    ret
*}
end;

end.