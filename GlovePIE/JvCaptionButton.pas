//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit JvCaptionButton;

interface

uses
  SysUtils, Classes, System, JvCaptionButton;

type
  TAlphaBitmap = class(TObject)
  published
    procedure LoadFromResourceID(Instance:Cardinal; ResID:Integer);//00573074
    procedure LoadFromResourceName(Instance:Cardinal; ResName:string);//00573128
    destructor Destroy();//00572ED4
    procedure Assign(Source:TPersistent);//00572F00
  public
    FHandle:HDC;//f4
    FBitmapInfo:tagBITMAPINFO;//f8
    FDIBHandle:HBITMAP;//f34
    FOldBitmap:HBITMAP;//f38
    FBitsMem:Pointer;//f3C
    FBitCount:byte;//f40
    FHasAlphaChannel:Boolean;//f41
  end;
  TBitmapAdapter = class(TObject)
  published
    function Draw(ACanvas:TCanvas; Rect:TRect; AMargins:PMARGINS):Boolean;//005732B4
    procedure LoadFromResourceID(Instance:Cardinal; ResID:Integer);//0057365C
    procedure DrawFixed(ACanvas:TCanvas; X:Integer; Y:Integer);//005733C8
    function DrawPart(ACanvas:TCanvas; SrcRect:TRect; AMargins:PMARGINS; DestRect:TRect):Boolean;//005734F0
    function DrawFixedPart(ACanvas:TCanvas; DestRect:TRect; SrcY:Integer; SrcX:Integer):Boolean;//00573410
    destructor Destroy();//0057321C
    constructor Create;//005731E0
    procedure Clear;//005732A8
    procedure LoadFromResourceName(Instance:Cardinal; ResName:string);//005736F0
    procedure Assign(Source:TPersistent);//0057324C
  public
    FBitmap:TObject;//f4
    FMargins:_MARGINS;//f8
    FTransparentColor:Cardinal;//f18
    destructor Destroy(); virtual;//0057321C
    constructor Create; virtual;//v0//005731E0
  end;
  TGlobalXPData = class(TObject)
  published
    procedure Update;//0057396C
    procedure DrawSimple(ACanvas:TCanvas; State:Integer; DrawRect:TRect);//00573868
    function Draw(ACanvas:TCanvas; State:Integer; DrawRect:TRect):Boolean;//005737F4
    procedure RemoveClient;//0057394C
    constructor Create;//00573784
    destructor Destroy();//005737C0
    procedure AddClient;//005737F0
  public
    FCaptionButtonHeight:Integer;//f4
    FCaptionButtonCount:Integer;//f8
    FCaptionButtons:TBitmapAdapter;//fC
    FIsThemed:Boolean;//f10
    FBitmapValid:Boolean;//f11
    FClientCount:Integer;//f14
    destructor Destroy(); virtual;//005737C0
    constructor Create; virtual;//v0//00573784
  end;
    //function sub_005726B4:?;//005726B4
    //function sub_005726D0:?;//005726D0
    //procedure sub_005726F0(?:UnicodeString; ?:?);//005726F0
    //procedure sub_00572768(?:?; ?:?; ?:?);//00572768
    //function sub_00572818(?:?; ?:Integer):?;//00572818
    //procedure sub_00572834(?:?; ?:Integer);//00572834
    procedure sub_0057289C;//0057289C
    procedure sub_005728C8;//005728C8
    //function sub_00572974(?:HDC; ?:TRect; ?:?; ?:?; ?:?; ?:?):?;//00572974
    //function sub_00572C14(?:TBitmapAdapter; ?:?):?;//00572C14
    //function sub_00572E74:?;//00572E74
    //function sub_00572EA4:?;//00572EA4
    //function sub_00572F0C(?:?; ?:?; ?:?; ?:?):?;//00572F0C
    //procedure sub_00572F5C(?:?; ?:?; ?:?);//00572F5C
    procedure sub_00572FA8(?:TAlphaBitmap; ?:THandle);//00572FA8
    procedure sub_00572FF0(?:TAlphaBitmap);//00572FF0
    //function sub_00573024(?:TObject):?;//00573024
    //function sub_00573028(?:TObject):?;//00573028
    procedure sub_0057302C(?:TAlphaBitmap);//0057302C
    //function sub_005735CC(?:TBitmapAdapter):?;//005735CC
    //function sub_00573618(?:TBitmapAdapter):?;//00573618
    //procedure sub_005739E8(?:?; ?:TCanvas; ?:?; ?:?; ?:?);//005739E8
    //procedure sub_00573B5C(?:?; ?:?);//00573B5C
    //procedure sub_00573E00(?:?; ?:HDC);//00573E00
    //procedure sub_00573F14(?:?; ?:TCanvas);//00573F14
    //procedure sub_00573FF4(?:?; ?:TCanvas; ?:?);//00573FF4
    //procedure sub_0057403C(?:?; ?:TCanvas; ?:?);//0057403C
    //procedure sub_00574124(?:?; ?:TCanvas);//00574124
    //procedure sub_005742BC(?:?; ?:TCanvas);//005742BC
    //function sub_005744B4(?:?):?;//005744B4
    //function sub_005744DC:?;//005744DC
    //function sub_005744E8(?:?):?;//005744E8
    //function sub_00574514:?;//00574514
    //procedure sub_00574538(?:?; ?:?);//00574538
    //procedure sub_00574600(?:?; ?:?);//00574600
    //procedure sub_00574668(?:?; ?:?);//00574668

implementation

//005726B4
{*function sub_005726B4:?;
begin
 005726B4    mov         eax,[0078DB58];^gvar_00784C7C
 005726B9    cmp         dword ptr [eax],2
>005726BC    jne         005726C8
 005726BE    mov         eax,[0078D080];^gvar_00784C80
 005726C3    cmp         dword ptr [eax],6
>005726C6    jge         005726CB
 005726C8    xor         eax,eax
 005726CA    ret
 005726CB    mov         al,1
 005726CD    ret
end;*}

//005726D0
{*function sub_005726D0:?;
begin
 005726D0    cmp         dword ptr ds:[815524],0;gvar_00815524:TGlobalXPData
>005726D7    jne         005726EA
 005726D9    mov         dl,1
 005726DB    mov         eax,[0057238C];TGlobalXPData
 005726E0    call        TGlobalXPData.Create;TGlobalXPData.Create
 005726E5    mov         [00815524],eax;gvar_00815524:TGlobalXPData
 005726EA    mov         eax,[00815524];gvar_00815524:TGlobalXPData
 005726EF    ret
end;*}

//005726F0
{*procedure sub_005726F0(?:UnicodeString; ?:?);
begin
 005726F0    push        ebx
 005726F1    push        esi
 005726F2    push        edi
 005726F3    push        ebp
 005726F4    mov         ebp,edx
 005726F6    mov         edi,eax
 005726F8    mov         eax,ebp
 005726FA    mov         edx,edi
 005726FC    call        @UStrAsg
 00572701    mov         eax,edi
 00572703    call        @UStrLen
 00572708    mov         esi,eax
 0057270A    test        esi,esi
>0057270C    jle         00572761
 0057270E    mov         ebx,1
 00572713    movzx       eax,word ptr [edi+ebx*2-2]
 00572718    add         eax,0FFFFFFD0
 0057271B    sub         ax,0A
>0057271F    jb          0057275D
 00572721    add         eax,0FFFFFFF9
 00572724    sub         ax,1A
>00572728    jb          0057275D
 0057272A    add         eax,0FFFFFFFA
 0057272D    sub         ax,1A
>00572731    jb          00572735
>00572733    jmp         0057274F
 00572735    movzx       eax,word ptr [edi+ebx*2-2]
 0057273A    call        UpCase
 0057273F    push        eax
 00572740    mov         eax,ebp
 00572742    call        @UniqueStringU
 00572747    pop         edx
 00572748    mov         word ptr [eax+ebx*2-2],dx
>0057274D    jmp         0057275D
 0057274F    mov         eax,ebp
 00572751    call        @UniqueStringU
 00572756    mov         word ptr [eax+ebx*2-2],5F
 0057275D    inc         ebx
 0057275E    dec         esi
>0057275F    jne         00572713
 00572761    pop         ebp
 00572762    pop         edi
 00572763    pop         esi
 00572764    pop         ebx
 00572765    ret
end;*}

//00572768
{*procedure sub_00572768(?:?; ?:?; ?:?);
begin
 00572768    push        ebp
 00572769    mov         ebp,esp
 0057276B    add         esp,0FFFFFFEC
 0057276E    push        ebx
 0057276F    push        esi
 00572770    push        edi
 00572771    mov         esi,ecx
 00572773    lea         edi,[ebp-8]
 00572776    movs        dword ptr [edi],dword ptr [esi]
 00572777    movs        dword ptr [edi],dword ptr [esi]
 00572778    mov         esi,edx
 0057277A    mov         ebx,eax
 0057277C    xor         eax,eax
 0057277E    mov         dword ptr [ebp-14],eax
 00572781    call        user32.GetDesktopWindow
 00572786    push        eax
 00572787    call        user32.GetDC
 0057278C    mov         dword ptr [ebp-10],eax
 0057278F    mov         eax,dword ptr [ebp-10]
 00572792    push        eax
 00572793    call        gdi32.CreateCompatibleDC
 00572798    mov         dword ptr [ebp-0C],eax
 0057279B    xor         eax,eax
 0057279D    push        ebp
 0057279E    push        572809
 005727A3    push        dword ptr fs:[eax]
 005727A6    mov         dword ptr fs:[eax],esp
 005727A9    push        ebx
 005727AA    mov         eax,dword ptr [ebp-0C]
 005727AD    push        eax
 005727AE    call        gdi32.SelectObject
 005727B3    mov         dword ptr [ebp-14],eax
 005727B6    mov         eax,dword ptr [ebp-8]
 005727B9    push        eax
 005727BA    mov         eax,dword ptr [ebp-4]
 005727BD    push        eax
 005727BE    mov         eax,dword ptr [ebp-0C]
 005727C1    push        eax
 005727C2    push        0
 005727C4    push        0
 005727C6    push        0CC0020
 005727CB    xor         ecx,ecx
 005727CD    xor         edx,edx
 005727CF    mov         eax,esi
 005727D1    call        00540340
 005727D6    xor         eax,eax
 005727D8    pop         edx
 005727D9    pop         ecx
 005727DA    pop         ecx
 005727DB    mov         dword ptr fs:[eax],edx
 005727DE    push        572810
 005727E3    mov         eax,dword ptr [ebp-14]
 005727E6    push        eax
 005727E7    mov         eax,dword ptr [ebp-0C]
 005727EA    push        eax
 005727EB    call        gdi32.SelectObject
 005727F0    mov         eax,dword ptr [ebp-10]
 005727F3    push        eax
 005727F4    call        user32.GetDesktopWindow
 005727F9    push        eax
 005727FA    call        user32.ReleaseDC
 005727FF    mov         eax,dword ptr [ebp-0C]
 00572802    push        eax
 00572803    call        gdi32.DeleteDC
 00572808    ret
>00572809    jmp         @HandleFinally
>0057280E    jmp         005727E3
 00572810    pop         edi
 00572811    pop         esi
 00572812    pop         ebx
 00572813    mov         esp,ebp
 00572815    pop         ebp
 00572816    ret
end;*}

//00572818
{*function sub_00572818(?:?; ?:Integer):?;
begin
 00572818    xor         ecx,ecx
 0057281A    test        edx,edx
>0057281C    jle         00572831
 0057281E    cmp         byte ptr [eax+3],0
 00572822    setne       cl
 00572825    test        cl,cl
>00572827    jne         00572831
 00572829    add         eax,4
 0057282C    dec         edx
 0057282D    test        edx,edx
>0057282F    jg          0057281E
 00572831    mov         eax,ecx
 00572833    ret
end;*}

//00572834
{*procedure sub_00572834(?:?; ?:Integer);
begin
 00572834    push        ebx
 00572835    push        esi
 00572836    push        edi
 00572837    mov         esi,edx
 00572839    mov         ebx,eax
 0057283B    test        esi,esi
>0057283D    jle         00572898
 0057283F    mov         ecx,ebx
 00572841    movzx       eax,byte ptr [ecx]
 00572844    movzx       edx,byte ptr [ecx+3]
 00572848    imul        edx
 0057284A    add         eax,80
 0057284F    mov         edi,0FF
 00572854    xor         edx,edx
 00572856    div         eax,edi
 00572858    mov         byte ptr [ecx],al
 0057285A    movzx       eax,byte ptr [ecx+1]
 0057285E    movzx       edx,byte ptr [ecx+3]
 00572862    imul        edx
 00572864    add         eax,80
 00572869    mov         edi,0FF
 0057286E    xor         edx,edx
 00572870    div         eax,edi
 00572872    mov         byte ptr [ecx+1],al
 00572875    movzx       eax,byte ptr [ecx+2]
 00572879    movzx       edx,byte ptr [ecx+3]
 0057287D    imul        edx
 0057287F    add         eax,80
 00572884    mov         edi,0FF
 00572889    xor         edx,edx
 0057288B    div         eax,edi
 0057288D    mov         byte ptr [ecx+2],al
 00572890    add         ebx,4
 00572893    dec         esi
 00572894    test        esi,esi
>00572896    jg          0057283F
 00572898    pop         edi
 00572899    pop         esi
 0057289A    pop         ebx
 0057289B    ret
end;*}

//0057289C
procedure sub_0057289C;
begin
{*
 0057289C    xor         eax,eax
 0057289E    mov         [00815520],eax;gvar_00815520:Pointer
 005728A3    xor         eax,eax
 005728A5    mov         [0081551C],eax;gvar_0081551C:Pointer
 005728AA    cmp         dword ptr ds:[789948],0;gvar_00789948:HMODULE
>005728B1    jbe         005728BE
 005728B3    mov         eax,[00789948];0x0 gvar_00789948:HMODULE
 005728B8    push        eax
 005728B9    call        kernel32.FreeLibrary
 005728BE    xor         eax,eax
 005728C0    mov         [00789948],eax;gvar_00789948:HMODULE
 005728C5    ret
*}
end;

//005728C8
procedure sub_005728C8;
begin
{*
 005728C8    mov         byte ptr ds:[78994C],1;gvar_0078994C
 005728CF    mov         edx,8000
 005728D4    mov         eax,572924;'Msimg32.dll'
 005728D9    call        SafeLoadLibrary
 005728DE    mov         [00789948],eax;gvar_00789948:HMODULE
 005728E3    cmp         dword ptr ds:[789948],0;gvar_00789948:HMODULE
>005728EA    je          00572916
 005728EC    push        57293C;'TransparentBlt'
 005728F1    mov         eax,[00789948];0x0 gvar_00789948:HMODULE
 005728F6    push        eax
 005728F7    call        GetProcAddress
 005728FC    mov         [00815520],eax;gvar_00815520:Pointer
 00572901    push        57295C;'AlphaBlend'
 00572906    mov         eax,[00789948];0x0 gvar_00789948:HMODULE
 0057290B    push        eax
 0057290C    call        GetProcAddress
 00572911    mov         [0081551C],eax;gvar_0081551C:Pointer
 00572916    ret
*}
end;

//00572974
{*function sub_00572974(?:HDC; ?:TRect; ?:?; ?:?; ?:?; ?:?):?;
begin
 00572974    push        ebp
 00572975    mov         ebp,esp
 00572977    add         esp,0FFFFFFD8
 0057297A    push        ebx
 0057297B    push        esi
 0057297C    push        edi
 0057297D    mov         edi,ecx
 0057297F    mov         dword ptr [ebp-4],edx
 00572982    mov         esi,eax
 00572984    mov         ebx,dword ptr [ebp+0C]
 00572987    mov         edx,dword ptr [ebp+10]
 0057298A    mov         edx,dword ptr [edx+8]
 0057298D    mov         ecx,dword ptr [ebp+10]
 00572990    sub         edx,dword ptr [ecx]
 00572992    mov         eax,dword ptr [ebx]
 00572994    sub         edx,eax
 00572996    sub         edx,dword ptr [ebx+4]
 00572999    mov         dword ptr [ebp-0C],edx
 0057299C    mov         edx,dword ptr [ebp+10]
 0057299F    mov         edx,dword ptr [edx+0C]
 005729A2    mov         ecx,dword ptr [ebp+10]
 005729A5    sub         edx,dword ptr [ecx+4]
 005729A8    sub         edx,dword ptr [ebx+8]
 005729AB    sub         edx,dword ptr [ebx+0C]
 005729AE    mov         dword ptr [ebp-10],edx
 005729B1    mov         edx,dword ptr [ebp-4]
 005729B4    mov         edx,dword ptr [edx+8]
 005729B7    mov         ecx,dword ptr [ebp-4]
 005729BA    sub         edx,dword ptr [ecx]
 005729BC    sub         edx,eax
 005729BE    sub         edx,dword ptr [ebx+4]
 005729C1    mov         dword ptr [ebp-14],edx
 005729C4    mov         eax,dword ptr [ebp-4]
 005729C7    mov         eax,dword ptr [eax+0C]
 005729CA    mov         edx,dword ptr [ebp-4]
 005729CD    sub         eax,dword ptr [edx+4]
 005729D0    sub         eax,dword ptr [ebx+8]
 005729D3    sub         eax,dword ptr [ebx+0C]
 005729D6    mov         dword ptr [ebp-18],eax
 005729D9    lea         eax,[ebp-20]
 005729DC    push        eax
 005729DD    push        edi
 005729DE    call        gdi32.GetWindowOrgEx
 005729E3    push        0
 005729E5    mov         eax,dword ptr [ebp+10]
 005729E8    mov         edx,dword ptr [ebp-1C]
 005729EB    sub         edx,dword ptr [eax+4]
 005729EE    push        edx
 005729EF    mov         eax,dword ptr [ebp+10]
 005729F2    mov         edx,dword ptr [ebp-20]
 005729F5    sub         edx,dword ptr [eax]
 005729F7    push        edx
 005729F8    push        edi
 005729F9    call        gdi32.SetWindowOrgEx
 005729FE    lea         eax,[ebp-28]
 00572A01    push        eax
 00572A02    push        esi
 00572A03    call        gdi32.GetWindowOrgEx
 00572A08    push        0
 00572A0A    mov         eax,dword ptr [ebp-4]
 00572A0D    mov         edx,dword ptr [ebp-24]
 00572A10    sub         edx,dword ptr [eax+4]
 00572A13    push        edx
 00572A14    mov         eax,dword ptr [ebp-4]
 00572A17    mov         edx,dword ptr [ebp-28]
 00572A1A    sub         edx,dword ptr [eax]
 00572A1C    push        edx
 00572A1D    push        esi
 00572A1E    call        gdi32.SetWindowOrgEx
 00572A23    mov         eax,dword ptr [ebp+8]
 00572A26    push        eax
 00572A27    mov         eax,dword ptr [ebx+8]
 00572A2A    push        eax
 00572A2B    mov         eax,dword ptr [ebx]
 00572A2D    push        eax
 00572A2E    push        0
 00572A30    push        0
 00572A32    push        edi
 00572A33    mov         eax,dword ptr [ebx+8]
 00572A36    push        eax
 00572A37    mov         eax,dword ptr [ebx]
 00572A39    push        eax
 00572A3A    push        0
 00572A3C    push        0
 00572A3E    push        esi
 00572A3F    call        00572EA4
 00572A44    test        eax,eax
>00572A46    je          00572BDC
 00572A4C    mov         eax,dword ptr [ebp+8]
 00572A4F    push        eax
 00572A50    mov         eax,dword ptr [ebx+8]
 00572A53    push        eax
 00572A54    mov         eax,dword ptr [ebp-0C]
 00572A57    push        eax
 00572A58    push        0
 00572A5A    mov         eax,dword ptr [ebx]
 00572A5C    push        eax
 00572A5D    push        edi
 00572A5E    mov         eax,dword ptr [ebx+8]
 00572A61    push        eax
 00572A62    mov         eax,dword ptr [ebp-14]
 00572A65    push        eax
 00572A66    push        0
 00572A68    mov         eax,dword ptr [ebx]
 00572A6A    push        eax
 00572A6B    push        esi
 00572A6C    call        00572EA4
 00572A71    test        eax,eax
>00572A73    je          00572BDC
 00572A79    mov         eax,dword ptr [ebp+8]
 00572A7C    push        eax
 00572A7D    mov         eax,dword ptr [ebx+8]
 00572A80    push        eax
 00572A81    mov         eax,dword ptr [ebx+4]
 00572A84    push        eax
 00572A85    push        0
 00572A87    mov         eax,dword ptr [ebx]
 00572A89    add         eax,dword ptr [ebp-0C]
 00572A8C    push        eax
 00572A8D    push        edi
 00572A8E    mov         eax,dword ptr [ebx+8]
 00572A91    push        eax
 00572A92    mov         eax,dword ptr [ebx+4]
 00572A95    push        eax
 00572A96    push        0
 00572A98    mov         eax,dword ptr [ebx]
 00572A9A    add         eax,dword ptr [ebp-14]
 00572A9D    push        eax
 00572A9E    push        esi
 00572A9F    call        00572EA4
 00572AA4    test        eax,eax
>00572AA6    je          00572BDC
 00572AAC    mov         eax,dword ptr [ebp+8]
 00572AAF    push        eax
 00572AB0    mov         eax,dword ptr [ebp-10]
 00572AB3    push        eax
 00572AB4    mov         eax,dword ptr [ebx]
 00572AB6    push        eax
 00572AB7    mov         eax,dword ptr [ebx+8]
 00572ABA    push        eax
 00572ABB    push        0
 00572ABD    push        edi
 00572ABE    mov         eax,dword ptr [ebp-18]
 00572AC1    push        eax
 00572AC2    mov         eax,dword ptr [ebx]
 00572AC4    push        eax
 00572AC5    mov         eax,dword ptr [ebx+8]
 00572AC8    push        eax
 00572AC9    push        0
 00572ACB    push        esi
 00572ACC    call        00572EA4
 00572AD1    test        eax,eax
>00572AD3    je          00572BDC
 00572AD9    mov         eax,dword ptr [ebp+8]
 00572ADC    push        eax
 00572ADD    mov         eax,dword ptr [ebp-10]
 00572AE0    push        eax
 00572AE1    mov         eax,dword ptr [ebp-0C]
 00572AE4    push        eax
 00572AE5    mov         eax,dword ptr [ebx+8]
 00572AE8    push        eax
 00572AE9    mov         eax,dword ptr [ebx]
 00572AEB    push        eax
 00572AEC    push        edi
 00572AED    mov         eax,dword ptr [ebp-18]
 00572AF0    push        eax
 00572AF1    mov         eax,dword ptr [ebp-14]
 00572AF4    push        eax
 00572AF5    mov         eax,dword ptr [ebx+8]
 00572AF8    push        eax
 00572AF9    mov         eax,dword ptr [ebx]
 00572AFB    push        eax
 00572AFC    push        esi
 00572AFD    call        00572EA4
 00572B02    test        eax,eax
>00572B04    je          00572BDC
 00572B0A    mov         eax,dword ptr [ebp+8]
 00572B0D    push        eax
 00572B0E    mov         eax,dword ptr [ebp-10]
 00572B11    push        eax
 00572B12    mov         eax,dword ptr [ebx+4]
 00572B15    push        eax
 00572B16    mov         eax,dword ptr [ebx+8]
 00572B19    push        eax
 00572B1A    mov         eax,dword ptr [ebx]
 00572B1C    add         eax,dword ptr [ebp-0C]
 00572B1F    push        eax
 00572B20    push        edi
 00572B21    mov         eax,dword ptr [ebp-18]
 00572B24    push        eax
 00572B25    mov         eax,dword ptr [ebx+4]
 00572B28    push        eax
 00572B29    mov         eax,dword ptr [ebx+8]
 00572B2C    push        eax
 00572B2D    mov         eax,dword ptr [ebx]
 00572B2F    add         eax,dword ptr [ebp-14]
 00572B32    push        eax
 00572B33    push        esi
 00572B34    call        00572EA4
 00572B39    test        eax,eax
>00572B3B    je          00572BDC
 00572B41    mov         eax,dword ptr [ebp+8]
 00572B44    push        eax
 00572B45    mov         eax,dword ptr [ebx+0C]
 00572B48    push        eax
 00572B49    mov         eax,dword ptr [ebx]
 00572B4B    push        eax
 00572B4C    mov         eax,dword ptr [ebx+8]
 00572B4F    add         eax,dword ptr [ebp-10]
 00572B52    push        eax
 00572B53    push        0
 00572B55    push        edi
 00572B56    mov         eax,dword ptr [ebx+0C]
 00572B59    push        eax
 00572B5A    mov         eax,dword ptr [ebx]
 00572B5C    push        eax
 00572B5D    mov         eax,dword ptr [ebx+8]
 00572B60    add         eax,dword ptr [ebp-18]
 00572B63    push        eax
 00572B64    push        0
 00572B66    push        esi
 00572B67    call        00572EA4
 00572B6C    test        eax,eax
>00572B6E    je          00572BDC
 00572B70    mov         eax,dword ptr [ebp+8]
 00572B73    push        eax
 00572B74    mov         eax,dword ptr [ebx+0C]
 00572B77    push        eax
 00572B78    mov         eax,dword ptr [ebp-0C]
 00572B7B    push        eax
 00572B7C    mov         eax,dword ptr [ebx+8]
 00572B7F    add         eax,dword ptr [ebp-10]
 00572B82    push        eax
 00572B83    mov         eax,dword ptr [ebx]
 00572B85    push        eax
 00572B86    push        edi
 00572B87    mov         eax,dword ptr [ebx+0C]
 00572B8A    push        eax
 00572B8B    mov         eax,dword ptr [ebp-14]
 00572B8E    push        eax
 00572B8F    mov         eax,dword ptr [ebx+8]
 00572B92    add         eax,dword ptr [ebp-18]
 00572B95    push        eax
 00572B96    mov         eax,dword ptr [ebx]
 00572B98    push        eax
 00572B99    push        esi
 00572B9A    call        00572EA4
 00572B9F    test        eax,eax
>00572BA1    je          00572BDC
 00572BA3    mov         eax,dword ptr [ebp+8]
 00572BA6    push        eax
 00572BA7    mov         eax,dword ptr [ebx+0C]
 00572BAA    push        eax
 00572BAB    mov         eax,dword ptr [ebx+4]
 00572BAE    push        eax
 00572BAF    mov         eax,dword ptr [ebx+8]
 00572BB2    add         eax,dword ptr [ebp-10]
 00572BB5    push        eax
 00572BB6    mov         eax,dword ptr [ebx]
 00572BB8    add         eax,dword ptr [ebp-0C]
 00572BBB    push        eax
 00572BBC    push        edi
 00572BBD    mov         eax,dword ptr [ebx+0C]
 00572BC0    push        eax
 00572BC1    mov         eax,dword ptr [ebx+4]
 00572BC4    push        eax
 00572BC5    mov         eax,dword ptr [ebx+8]
 00572BC8    add         eax,dword ptr [ebp-18]
 00572BCB    push        eax
 00572BCC    mov         eax,dword ptr [ebx]
 00572BCE    add         eax,dword ptr [ebp-14]
 00572BD1    push        eax
 00572BD2    push        esi
 00572BD3    call        00572EA4
 00572BD8    test        eax,eax
>00572BDA    jne         00572BE0
 00572BDC    xor         eax,eax
>00572BDE    jmp         00572BE2
 00572BE0    mov         al,1
 00572BE2    mov         byte ptr [ebp-5],al
 00572BE5    push        0
 00572BE7    mov         eax,dword ptr [ebp-1C]
 00572BEA    push        eax
 00572BEB    mov         eax,dword ptr [ebp-20]
 00572BEE    push        eax
 00572BEF    push        edi
 00572BF0    call        gdi32.SetWindowOrgEx
 00572BF5    push        0
 00572BF7    mov         eax,dword ptr [ebp-24]
 00572BFA    push        eax
 00572BFB    mov         eax,dword ptr [ebp-28]
 00572BFE    push        eax
 00572BFF    push        esi
 00572C00    call        gdi32.SetWindowOrgEx
 00572C05    movzx       eax,byte ptr [ebp-5]
 00572C09    pop         edi
 00572C0A    pop         esi
 00572C0B    pop         ebx
 00572C0C    mov         esp,ebp
 00572C0E    pop         ebp
 00572C0F    ret         0C
end;*}

//00572C14
{*function sub_00572C14(?:TBitmapAdapter; ?:?):?;
begin
 00572C14    push        ebp
 00572C15    mov         ebp,esp
 00572C17    add         esp,0FFFFFBB8
 00572C1D    push        ebx
 00572C1E    push        esi
 00572C1F    push        edi
 00572C20    xor         ecx,ecx
 00572C22    mov         dword ptr [ebp-444],ecx
 00572C28    mov         dword ptr [ebp-448],ecx
 00572C2E    mov         dword ptr [ebp-440],ecx
 00572C34    mov         dword ptr [ebp-4],edx
 00572C37    mov         esi,eax
 00572C39    xor         eax,eax
 00572C3B    push        ebp
 00572C3C    push        572E62
 00572C41    push        dword ptr fs:[eax]
 00572C44    mov         dword ptr fs:[eax],esp
 00572C47    mov         word ptr [ebp-0E],0
 00572C4D    mov         word ptr [ebp-218],0
 00572C56    push        0
 00572C58    push        0
 00572C5A    push        0
 00572C5C    push        0
 00572C5E    push        104
 00572C63    lea         eax,[ebp-216]
 00572C69    push        eax
 00572C6A    mov         eax,[0078D3F0];^gvar_00793168
 00572C6F    mov         eax,dword ptr [eax]
 00572C71    call        eax
 00572C73    test        eax,eax
 00572C75    sete        byte ptr [ebp-5]
 00572C79    cmp         byte ptr [ebp-5],0
>00572C7D    je          00572E44
 00572C83    call        0056FF78
 00572C88    lea         ecx,[ebp-42C]
 00572C8E    mov         dl,28
 00572C90    call        TThemeServices.GetElementDetails
 00572C95    push        104
 00572C9A    lea         eax,[ebp-420]
 00572CA0    push        eax
 00572CA1    push        0BB9
 00572CA6    mov         eax,dword ptr [ebp-424]
 00572CAC    push        eax
 00572CAD    mov         edi,dword ptr [ebp-428]
 00572CB3    push        edi
 00572CB4    call        0056FF78
 00572CB9    movzx       ebx,byte ptr [ebp-42C]
 00572CC0    mov         edx,ebx
 00572CC2    call        TThemeServices.GetTheme
 00572CC7    push        eax
 00572CC8    mov         eax,[0078DAD0];^gvar_0079312C
 00572CCD    mov         eax,dword ptr [eax]
 00572CCF    call        eax
 00572CD1    test        eax,eax
 00572CD3    sete        byte ptr [ebp-5]
 00572CD7    cmp         byte ptr [ebp-5],0
>00572CDB    je          00572E44
 00572CE1    mov         eax,dword ptr [ebp-4]
 00572CE4    push        eax
 00572CE5    push        961
 00572CEA    mov         eax,dword ptr [ebp-424]
 00572CF0    push        eax
 00572CF1    push        edi
 00572CF2    call        0056FF78
 00572CF7    mov         edx,ebx
 00572CF9    call        TThemeServices.GetTheme
 00572CFE    push        eax
 00572CFF    mov         eax,[0078D4A8];^gvar_00793108
 00572D04    mov         eax,dword ptr [eax]
 00572D06    call        eax
 00572D08    test        eax,eax
 00572D0A    sete        byte ptr [ebp-5]
 00572D0E    cmp         byte ptr [ebp-5],0
>00572D12    je          00572E44
 00572D18    mov         eax,dword ptr [ebp-4]
 00572D1B    cmp         dword ptr [eax],0
 00572D1E    setg        byte ptr [ebp-5]
 00572D22    cmp         byte ptr [ebp-5],0
>00572D26    je          00572E44
 00572D2C    lea         eax,[ebp-43C]
 00572D32    push        eax
 00572D33    push        0
 00572D35    push        0E11
 00572D3A    mov         eax,dword ptr [ebp-424]
 00572D40    push        eax
 00572D41    push        edi
 00572D42    push        0
 00572D44    call        0056FF78
 00572D49    mov         edx,ebx
 00572D4B    call        TThemeServices.GetTheme
 00572D50    push        eax
 00572D51    mov         eax,[0078D498];^GetThemeMargins:function(val hTheme:Windows.THandle;val hdc:Windows.HDC;...
 00572D56    mov         eax,dword ptr [eax]
 00572D58    call        eax
 00572D5A    test        eax,eax
>00572D5C    je          00572D70
 00572D5E    lea         eax,[ebp-43C]
 00572D64    xor         ecx,ecx
 00572D66    mov         edx,10
 00572D6B    call        @FillChar
 00572D70    push        esi
 00572D71    lea         edi,[esi+8]
 00572D74    lea         esi,[ebp-43C]
 00572D7A    movs        dword ptr [edi],dword ptr [esi]
 00572D7B    movs        dword ptr [edi],dword ptr [esi]
 00572D7C    movs        dword ptr [edi],dword ptr [esi]
 00572D7D    movs        dword ptr [edi],dword ptr [esi]
 00572D7E    pop         esi
 00572D7F    lea         eax,[ebp-440]
 00572D85    lea         edx,[ebp-216]
 00572D8B    mov         ecx,105
 00572D90    call        @UStrFromWArray
 00572D95    mov         eax,dword ptr [ebp-440]
 00572D9B    mov         edx,8001
 00572DA0    call        SafeLoadLibrary
 00572DA5    mov         dword ptr [ebp-0C],eax
 00572DA8    cmp         dword ptr [ebp-0C],0
>00572DAC    je          00572E44
 00572DB2    xor         eax,eax
 00572DB4    push        ebp
 00572DB5    push        572E3D
 00572DBA    push        dword ptr fs:[eax]
 00572DBD    mov         dword ptr fs:[eax],esp
 00572DC0    xor         edx,edx
 00572DC2    mov         eax,esi
 00572DC4    call        TBitmapAdapter.Assign
 00572DC9    lea         eax,[ebp-448]
 00572DCF    lea         edx,[ebp-420]
 00572DD5    mov         ecx,105
 00572DDA    call        @UStrFromWArray
 00572DDF    mov         eax,dword ptr [ebp-448]
 00572DE5    lea         edx,[ebp-444]
 00572DEB    call        005726F0
 00572DF0    mov         ecx,dword ptr [ebp-444]
 00572DF6    mov         edx,dword ptr [ebp-0C]
 00572DF9    mov         eax,esi
 00572DFB    call        TBitmapAdapter.LoadFromResourceName
 00572E00    mov         dword ptr [esi+18],0FF00FF
 00572E07    mov         eax,esi
 00572E09    call        00573618
 00572E0E    test        eax,eax
>00572E10    jle         00572E1D
 00572E12    mov         eax,esi
 00572E14    call        005735CC
 00572E19    test        eax,eax
>00572E1B    jg          00572E21
 00572E1D    xor         eax,eax
>00572E1F    jmp         00572E23
 00572E21    mov         al,1
 00572E23    mov         byte ptr [ebp-5],al
 00572E26    xor         eax,eax
 00572E28    pop         edx
 00572E29    pop         ecx
 00572E2A    pop         ecx
 00572E2B    mov         dword ptr fs:[eax],edx
 00572E2E    push        572E44
 00572E33    mov         eax,dword ptr [ebp-0C]
 00572E36    push        eax
 00572E37    call        kernel32.FreeLibrary
 00572E3C    ret
>00572E3D    jmp         @HandleFinally
>00572E42    jmp         00572E33
 00572E44    xor         eax,eax
 00572E46    pop         edx
 00572E47    pop         ecx
 00572E48    pop         ecx
 00572E49    mov         dword ptr fs:[eax],edx
 00572E4C    push        572E69
 00572E51    lea         eax,[ebp-448]
 00572E57    mov         edx,3
 00572E5C    call        @UStrArrayClr
 00572E61    ret
>00572E62    jmp         @HandleFinally
>00572E67    jmp         00572E51
 00572E69    movzx       eax,byte ptr [ebp-5]
 00572E6D    pop         edi
 00572E6E    pop         esi
 00572E6F    pop         ebx
 00572E70    mov         esp,ebp
 00572E72    pop         ebp
 00572E73    ret
end;*}

//00572E74
{*function sub_00572E74:?;
begin
 00572E74    push        ebp
 00572E75    mov         ebp,esp
 00572E77    cmp         byte ptr ds:[78994C],0;gvar_0078994C
>00572E7E    jne         00572E85
 00572E80    call        005728C8
 00572E85    cmp         dword ptr ds:[81551C],0;gvar_0081551C:Pointer
 00572E8C    setne       al
 00572E8F    neg         al
 00572E91    sbb         eax,eax
 00572E93    test        eax,eax
>00572E95    je          00572EA0
 00572E97    mov         esp,ebp
 00572E99    pop         ebp
 00572E9A    jmp         dword ptr ds:[81551C]
end;*}

//00572EA4
{*function sub_00572EA4:?;
begin
 00572EA4    push        ebp
 00572EA5    mov         ebp,esp
 00572EA7    cmp         byte ptr ds:[78994C],0;gvar_0078994C
>00572EAE    jne         00572EB5
 00572EB0    call        005728C8
 00572EB5    cmp         dword ptr ds:[815520],0;gvar_00815520:Pointer
 00572EBC    setne       al
 00572EBF    neg         al
 00572EC1    sbb         eax,eax
 00572EC3    test        eax,eax
>00572EC5    je          00572ED0
 00572EC7    mov         esp,ebp
 00572EC9    pop         ebp
 00572ECA    jmp         dword ptr ds:[815520]
end;*}

//00572ED4
destructor TAlphaBitmap.Destroy();
begin
{*
 00572ED4    push        ebx
 00572ED5    push        esi
 00572ED6    call        @BeforeDestruction
 00572EDB    mov         ebx,edx
 00572EDD    mov         esi,eax
 00572EDF    mov         eax,esi
 00572EE1    call        00572FF0
 00572EE6    mov         edx,ebx
 00572EE8    and         dl,0FC
 00572EEB    mov         eax,esi
 00572EED    call        TObject.Destroy
 00572EF2    test        bl,bl
>00572EF4    jle         00572EFD
 00572EF6    mov         eax,esi
 00572EF8    call        @ClassDestroy
 00572EFD    pop         esi
 00572EFE    pop         ebx
 00572EFF    ret
*}
end;

//00572F00
procedure TAlphaBitmap.Assign(Source:TPersistent);
begin
{*
 00572F00    test        edx,edx
>00572F02    jne         00572F09
 00572F04    call        00572FF0
 00572F09    ret
*}
end;

//00572F0C
{*function sub_00572F0C(?:?; ?:?; ?:?; ?:?):?;
begin
 00572F0C    push        ebp
 00572F0D    mov         ebp,esp
 00572F0F    push        ebx
 00572F10    push        esi
 00572F11    push        edi
 00572F12    mov         esi,dword ptr [ebp+8]
 00572F15    lea         ebx,[eax+8]
 00572F18    mov         dword ptr [ebx],28
 00572F1E    mov         dword ptr [ebx+4],ecx
 00572F21    mov         dword ptr [ebx+8],esi
 00572F24    mov         word ptr [ebx+0C],1
 00572F2A    mov         word ptr [ebx+0E],20
 00572F30    xor         edi,edi
 00572F32    mov         dword ptr [ebx+10],edi
 00572F35    imul        ecx,esi
 00572F38    add         ecx,ecx
 00572F3A    add         ecx,ecx
 00572F3C    mov         dword ptr [ebx+14],ecx
 00572F3F    push        0
 00572F41    push        0
 00572F43    lea         ecx,[eax+3C]
 00572F46    push        ecx
 00572F47    push        0
 00572F49    add         eax,8
 00572F4C    push        eax
 00572F4D    push        edx
 00572F4E    call        gdi32.CreateDIBSection
 00572F53    pop         edi
 00572F54    pop         esi
 00572F55    pop         ebx
 00572F56    pop         ebp
 00572F57    ret         4
end;*}

//00572F5C
{*procedure sub_00572F5C(?:?; ?:?; ?:?);
begin
 00572F5C    push        ebx
 00572F5D    push        esi
 00572F5E    push        edi
 00572F5F    push        ebp
 00572F60    push        ecx
 00572F61    mov         dword ptr [esp],ecx
 00572F64    mov         ebp,edx
 00572F66    mov         ebx,eax
 00572F68    mov         eax,ebx
 00572F6A    call        00572FF0
 00572F6F    call        0053FC54
 00572F74    mov         esi,eax
 00572F76    mov         eax,dword ptr [esp]
 00572F79    push        eax
 00572F7A    mov         ecx,ebp
 00572F7C    mov         edx,esi
 00572F7E    mov         eax,ebx
 00572F80    call        00572F0C
 00572F85    mov         edi,eax
 00572F87    mov         dword ptr [ebx+34],edi
 00572F8A    test        edi,edi
>00572F8C    je          00572F9A
 00572F8E    push        edi
 00572F8F    push        esi
 00572F90    call        gdi32.SelectObject
 00572F95    mov         dword ptr [ebx+38],eax
>00572F98    jmp         00572F9F
 00572F9A    xor         eax,eax
 00572F9C    mov         dword ptr [ebx+38],eax
 00572F9F    mov         dword ptr [ebx+4],esi
 00572FA2    pop         edx
 00572FA3    pop         ebp
 00572FA4    pop         edi
 00572FA5    pop         esi
 00572FA6    pop         ebx
 00572FA7    ret
end;*}

//00572FA8
procedure sub_00572FA8(?:TAlphaBitmap; ?:THandle);
begin
{*
 00572FA8    push        ebx
 00572FA9    push        esi
 00572FAA    add         esp,0FFFFFFE0
 00572FAD    mov         esi,edx
 00572FAF    mov         ebx,eax
 00572FB1    push        esp
 00572FB2    push        18
 00572FB4    push        esi
 00572FB5    call        gdi32.GetObjectW
 00572FBA    mov         ecx,dword ptr [esp+8]
 00572FBE    mov         edx,dword ptr [esp+4]
 00572FC2    mov         eax,ebx
 00572FC4    call        00572F5C
 00572FC9    lea         ecx,[esp+18]
 00572FCD    mov         edx,dword ptr [esp+8]
 00572FD1    mov         eax,dword ptr [esp+4]
 00572FD5    call        0040C184
 00572FDA    lea         ecx,[esp+18]
 00572FDE    mov         edx,dword ptr [ebx+4]
 00572FE1    mov         eax,esi
 00572FE3    call        00572768
 00572FE8    add         esp,20
 00572FEB    pop         esi
 00572FEC    pop         ebx
 00572FED    ret
*}
end;

//00572FF0
procedure sub_00572FF0(?:TAlphaBitmap);
begin
{*
 00572FF0    push        ebx
 00572FF1    mov         ebx,eax
 00572FF3    mov         eax,dword ptr [ebx+4];TAlphaBitmap.FHandle:HDC
 00572FF6    test        eax,eax
>00572FF8    je          00573020
 00572FFA    cmp         dword ptr [ebx+34],0;TAlphaBitmap.FDIBHandle:HBITMAP
>00572FFE    je          00573017
 00573000    mov         edx,dword ptr [ebx+38];TAlphaBitmap.FOldBitmap:HBITMAP
 00573003    test        edx,edx
>00573005    je          0057300E
 00573007    push        edx
 00573008    push        eax
 00573009    call        gdi32.SelectObject
 0057300E    mov         eax,dword ptr [ebx+34];TAlphaBitmap.FDIBHandle:HBITMAP
 00573011    push        eax
 00573012    call        gdi32.DeleteObject
 00573017    mov         eax,dword ptr [ebx+4];TAlphaBitmap.FHandle:HDC
 0057301A    push        eax
 0057301B    call        gdi32.DeleteDC
 00573020    pop         ebx
 00573021    ret
*}
end;

//00573024
{*function sub_00573024(?:TObject):?;
begin
 00573024    mov         eax,dword ptr [eax+10]
 00573027    ret
end;*}

//00573028
{*function sub_00573028(?:TObject):?;
begin
 00573028    mov         eax,dword ptr [eax+0C]
 0057302B    ret
end;*}

//0057302C
procedure sub_0057302C(?:TAlphaBitmap);
begin
{*
 0057302C    push        ebx
 0057302D    push        esi
 0057302E    push        edi
 0057302F    mov         edi,eax
 00573031    mov         eax,edi
 00573033    call        00573028
 00573038    mov         esi,eax
 0057303A    mov         eax,edi
 0057303C    call        00573024
 00573041    imul        esi,eax
 00573044    cmp         byte ptr [edi+40],20
>00573048    jae         00573050
 0057304A    mov         byte ptr [edi+41],0
>0057304E    jmp         0057306D
 00573050    mov         edx,esi
 00573052    mov         eax,dword ptr [edi+3C]
 00573055    call        00572818
 0057305A    mov         ebx,eax
 0057305C    mov         byte ptr [edi+41],bl
 0057305F    test        bl,bl
>00573061    je          0057306D
 00573063    mov         edx,esi
 00573065    mov         eax,dword ptr [edi+3C]
 00573068    call        00572834
 0057306D    pop         edi
 0057306E    pop         esi
 0057306F    pop         ebx
 00573070    ret
*}
end;

//00573074
procedure TAlphaBitmap.LoadFromResourceID(Instance:Cardinal; ResID:Integer);
begin
{*
 00573074    push        ebp
 00573075    mov         ebp,esp
 00573077    add         esp,0FFFFFFC8
 0057307A    push        ebx
 0057307B    mov         dword ptr [ebp-0C],ecx
 0057307E    mov         dword ptr [ebp-8],edx
 00573081    mov         dword ptr [ebp-4],eax
 00573084    mov         eax,dword ptr [ebp-0C]
 00573087    push        eax
 00573088    push        2
 0057308A    mov         ecx,dword ptr [ebp-8]
 0057308D    mov         dl,1
 0057308F    mov         eax,[0043E1E4];TResourceStream
 00573094    call        TResourceStream.CreateFromID;TResourceStream.Create
 00573099    mov         dword ptr [ebp-10],eax
 0057309C    xor         eax,eax
 0057309E    push        ebp
 0057309F    push        5730DA
 005730A4    push        dword ptr fs:[eax]
 005730A7    mov         dword ptr fs:[eax],esp
 005730AA    lea         edx,[ebp-38]
 005730AD    mov         ecx,28
 005730B2    mov         eax,dword ptr [ebp-10]
 005730B5    mov         ebx,dword ptr [eax]
 005730B7    call        dword ptr [ebx+0C];TCustomMemoryStream.Read
 005730BA    mov         eax,dword ptr [ebp-4]
 005730BD    movzx       edx,byte ptr [ebp-2A]
 005730C1    mov         byte ptr [eax+40],dl;TAlphaBitmap.FBitCount:byte
 005730C4    xor         eax,eax
 005730C6    pop         edx
 005730C7    pop         ecx
 005730C8    pop         ecx
 005730C9    mov         dword ptr fs:[eax],edx
 005730CC    push        5730E1
 005730D1    mov         eax,dword ptr [ebp-10]
 005730D4    call        TObject.Free
 005730D9    ret
>005730DA    jmp         @HandleFinally
>005730DF    jmp         005730D1
 005730E1    mov         eax,dword ptr [ebp-4]
 005730E4    cmp         byte ptr [eax+40],20;TAlphaBitmap.FBitCount:byte
>005730E8    jne         00573120
 005730EA    push        2000
 005730EF    push        0
 005730F1    push        0
 005730F3    push        0
 005730F5    mov         eax,dword ptr [ebp-0C]
 005730F8    push        eax
 005730F9    mov         eax,dword ptr [ebp-8]
 005730FC    push        eax
 005730FD    call        user32.LoadImageW
 00573102    mov         ebx,eax
 00573104    test        ebx,ebx
>00573106    je          00573120
 00573108    mov         edx,ebx
 0057310A    mov         eax,dword ptr [ebp-4]
 0057310D    call        00572FA8
 00573112    push        ebx
 00573113    call        gdi32.DeleteObject
 00573118    mov         eax,dword ptr [ebp-4]
 0057311B    call        0057302C
 00573120    pop         ebx
 00573121    mov         esp,ebp
 00573123    pop         ebp
 00573124    ret
*}
end;

//00573128
procedure TAlphaBitmap.LoadFromResourceName(Instance:Cardinal; ResName:string);
begin
{*
 00573128    push        ebp
 00573129    mov         ebp,esp
 0057312B    add         esp,0FFFFFFC8
 0057312E    push        ebx
 0057312F    mov         dword ptr [ebp-0C],ecx
 00573132    mov         dword ptr [ebp-8],edx
 00573135    mov         dword ptr [ebp-4],eax
 00573138    mov         eax,dword ptr [ebp-0C]
 0057313B    push        eax
 0057313C    push        2
 0057313E    mov         ecx,dword ptr [ebp-8]
 00573141    mov         dl,1
 00573143    mov         eax,[0043E1E4];TResourceStream
 00573148    call        TResourceStream.Create;TResourceStream.Create
 0057314D    mov         dword ptr [ebp-10],eax
 00573150    xor         eax,eax
 00573152    push        ebp
 00573153    push        57318E
 00573158    push        dword ptr fs:[eax]
 0057315B    mov         dword ptr fs:[eax],esp
 0057315E    lea         edx,[ebp-38]
 00573161    mov         ecx,28
 00573166    mov         eax,dword ptr [ebp-10]
 00573169    mov         ebx,dword ptr [eax]
 0057316B    call        dword ptr [ebx+0C];TCustomMemoryStream.Read
 0057316E    mov         eax,dword ptr [ebp-4]
 00573171    movzx       edx,byte ptr [ebp-2A]
 00573175    mov         byte ptr [eax+40],dl;TAlphaBitmap.FBitCount:byte
 00573178    xor         eax,eax
 0057317A    pop         edx
 0057317B    pop         ecx
 0057317C    pop         ecx
 0057317D    mov         dword ptr fs:[eax],edx
 00573180    push        573195
 00573185    mov         eax,dword ptr [ebp-10]
 00573188    call        TObject.Free
 0057318D    ret
>0057318E    jmp         @HandleFinally
>00573193    jmp         00573185
 00573195    mov         eax,dword ptr [ebp-4]
 00573198    cmp         byte ptr [eax+40],20;TAlphaBitmap.FBitCount:byte
>0057319C    jne         005731D9
 0057319E    push        2000
 005731A3    push        0
 005731A5    push        0
 005731A7    push        0
 005731A9    mov         eax,dword ptr [ebp-0C]
 005731AC    call        @UStrToPWChar
 005731B1    push        eax
 005731B2    mov         eax,dword ptr [ebp-8]
 005731B5    push        eax
 005731B6    call        user32.LoadImageW
 005731BB    mov         ebx,eax
 005731BD    test        ebx,ebx
>005731BF    je          005731D9
 005731C1    mov         edx,ebx
 005731C3    mov         eax,dword ptr [ebp-4]
 005731C6    call        00572FA8
 005731CB    push        ebx
 005731CC    call        gdi32.DeleteObject
 005731D1    mov         eax,dword ptr [ebp-4]
 005731D4    call        0057302C
 005731D9    pop         ebx
 005731DA    mov         esp,ebp
 005731DC    pop         ebp
 005731DD    ret
*}
end;

//005731E0
constructor TBitmapAdapter.Create;
begin
{*
 005731E0    push        ebx
 005731E1    push        esi
 005731E2    test        dl,dl
>005731E4    je          005731EE
 005731E6    add         esp,0FFFFFFF0
 005731E9    call        @ClassCreate
 005731EE    mov         ebx,edx
 005731F0    mov         esi,eax
 005731F2    xor         edx,edx
 005731F4    mov         eax,esi
 005731F6    call        TObject.Create
 005731FB    mov         dword ptr [esi+18],0FF00FF;TBitmapAdapter.FTransparentColor:Cardinal
 00573202    mov         eax,esi
 00573204    test        bl,bl
>00573206    je          00573217
 00573208    call        @AfterConstruction
 0057320D    pop         dword ptr fs:[0]
 00573214    add         esp,0C
 00573217    mov         eax,esi
 00573219    pop         esi
 0057321A    pop         ebx
 0057321B    ret
*}
end;

//0057321C
destructor TBitmapAdapter.Destroy();
begin
{*
 0057321C    push        ebx
 0057321D    push        esi
 0057321E    call        @BeforeDestruction
 00573223    mov         ebx,edx
 00573225    mov         esi,eax
 00573227    mov         eax,dword ptr [esi+4];TBitmapAdapter.FBitmap:TObject
 0057322A    call        TObject.Free
 0057322F    mov         edx,ebx
 00573231    and         dl,0FC
 00573234    mov         eax,esi
 00573236    call        TObject.Destroy
 0057323B    test        bl,bl
>0057323D    jle         00573246
 0057323F    mov         eax,esi
 00573241    call        @ClassDestroy
 00573246    pop         esi
 00573247    pop         ebx
 00573248    ret
*}
end;

//0057324C
procedure TBitmapAdapter.Assign(Source:TPersistent);
begin
{*
 0057324C    push        ebx
 0057324D    push        esi
 0057324E    push        edi
 0057324F    mov         edi,edx
 00573251    mov         ebx,eax
 00573253    mov         esi,dword ptr [ebx+4];TBitmapAdapter.FBitmap:TObject
 00573256    mov         eax,esi
 00573258    mov         edx,dword ptr ds:[463B28];TBitmap
 0057325E    call        @IsClass
 00573263    test        al,al
>00573265    je          0057327D
 00573267    mov         eax,esi
 00573269    mov         edx,dword ptr ds:[463B28];TBitmap
 0057326F    call        @AsClass
 00573274    mov         edx,edi
 00573276    mov         ecx,dword ptr [eax]
 00573278    call        dword ptr [ecx+8];TBitmap.Assign
>0057327B    jmp         005732A2
 0057327D    mov         eax,esi
 0057327F    mov         edx,dword ptr ds:[571B48];TAlphaBitmap
 00573285    call        @IsClass
 0057328A    test        al,al
>0057328C    je          005732A2
 0057328E    mov         eax,esi
 00573290    mov         edx,dword ptr ds:[571B48];TAlphaBitmap
 00573296    call        @AsClass
 0057329B    mov         edx,edi
 0057329D    call        TAlphaBitmap.Assign
 005732A2    pop         edi
 005732A3    pop         esi
 005732A4    pop         ebx
 005732A5    ret
*}
end;

//005732A8
procedure TBitmapAdapter.Clear;
begin
{*
 005732A8    add         eax,4;TBitmapAdapter.FBitmap:TObject
 005732AB    call        FreeAndNil
 005732B0    ret
*}
end;

//005732B4
function TBitmapAdapter.Draw(ACanvas:TCanvas; Rect:TRect; AMargins:PMARGINS):Boolean;
begin
{*
 005732B4    push        ebp
 005732B5    mov         ebp,esp
 005732B7    add         esp,0FFFFFFE4
 005732BA    push        ebx
 005732BB    push        esi
 005732BC    push        edi
 005732BD    mov         esi,ecx
 005732BF    mov         dword ptr [ebp-4],edx
 005732C2    mov         ebx,eax
 005732C4    mov         edi,dword ptr [ebp+8]
 005732C7    mov         eax,ebx
 005732C9    call        00573618
 005732CE    mov         edx,dword ptr [esi+8];TRect.Right:LongInt
 005732D1    sub         edx,dword ptr [esi]
 005732D3    cmp         eax,edx
>005732D5    jne         005732FD
 005732D7    mov         eax,ebx
 005732D9    call        005735CC
 005732DE    mov         edx,dword ptr [esi+0C]
 005732E1    sub         edx,dword ptr [esi+4]
 005732E4    cmp         eax,edx
>005732E6    jne         005732FD
 005732E8    push        0
 005732EA    push        0
 005732EC    mov         ecx,esi
 005732EE    mov         edx,dword ptr [ebp-4]
 005732F1    mov         eax,ebx
 005732F3    call        TBitmapAdapter.DrawFixedPart
>005732F8    jmp         005733BF
 005732FD    test        edi,edi
>005732FF    jne         00573304
 00573301    lea         edi,[ebx+8];TBitmapAdapter.FMargins:_MARGINS
 00573304    mov         eax,dword ptr [ebx+4];TBitmapAdapter.FBitmap:TObject
 00573307    mov         edx,dword ptr ds:[571B48];TAlphaBitmap
 0057330D    call        @IsClass
 00573312    test        al,al
>00573314    je          0057335C
 00573316    mov         eax,dword ptr [ebx+4];TBitmapAdapter.FBitmap:TObject
 00573319    mov         dword ptr [ebp-8],eax
 0057331C    mov         eax,dword ptr [ebp-8]
 0057331F    call        00573024
 00573324    push        eax
 00573325    lea         eax,[ebp-1C]
 00573328    push        eax
 00573329    mov         eax,dword ptr [ebp-8]
 0057332C    call        00573028
 00573331    mov         ecx,eax
 00573333    xor         edx,edx
 00573335    xor         eax,eax
 00573337    call        Bounds
 0057333C    lea         eax,[ebp-1C]
 0057333F    push        eax
 00573340    push        edi
 00573341    mov         eax,dword ptr [ebx+18];TBitmapAdapter.FTransparentColor:Cardinal
 00573344    push        eax
 00573345    mov         eax,dword ptr [ebp-4]
 00573348    call        TCanvas.GetHandle
 0057334D    mov         edx,dword ptr [ebp-8]
 00573350    mov         ecx,dword ptr [edx+4]
 00573353    mov         edx,esi
 00573355    call        00572974
>0057335A    jmp         005733BF
 0057335C    mov         eax,dword ptr [ebx+4];TBitmapAdapter.FBitmap:TObject
 0057335F    mov         edx,dword ptr ds:[463B28];TBitmap
 00573365    call        @IsClass
 0057336A    test        al,al
>0057336C    je          005733BD
 0057336E    mov         eax,dword ptr [ebx+4];TBitmapAdapter.FBitmap:TObject
 00573371    mov         dword ptr [ebp-0C],eax
 00573374    mov         eax,dword ptr [ebp-0C]
 00573377    mov         edx,dword ptr [eax]
 00573379    call        dword ptr [edx+24]
 0057337C    push        eax
 0057337D    lea         eax,[ebp-1C]
 00573380    push        eax
 00573381    mov         eax,dword ptr [ebp-0C]
 00573384    mov         edx,dword ptr [eax]
 00573386    call        dword ptr [edx+30]
 00573389    mov         ecx,eax
 0057338B    xor         edx,edx
 0057338D    xor         eax,eax
 0057338F    call        Bounds
 00573394    lea         eax,[ebp-1C]
 00573397    push        eax
 00573398    push        edi
 00573399    mov         eax,dword ptr [ebx+18];TBitmapAdapter.FTransparentColor:Cardinal
 0057339C    push        eax
 0057339D    mov         eax,dword ptr [ebp-0C]
 005733A0    call        TBitmap.GetCanvas
 005733A5    call        TCanvas.GetHandle
 005733AA    push        eax
 005733AB    mov         eax,dword ptr [ebp-4]
 005733AE    call        TCanvas.GetHandle
 005733B3    mov         edx,esi
 005733B5    pop         ecx
 005733B6    call        00572974
>005733BB    jmp         005733BF
 005733BD    xor         eax,eax
 005733BF    pop         edi
 005733C0    pop         esi
 005733C1    pop         ebx
 005733C2    mov         esp,ebp
 005733C4    pop         ebp
 005733C5    ret         4
*}
end;

//005733C8
procedure TBitmapAdapter.DrawFixed(ACanvas:TCanvas; X:Integer; Y:Integer);
begin
{*
 005733C8    push        ebp
 005733C9    mov         ebp,esp
 005733CB    add         esp,0FFFFFFF0
 005733CE    push        ebx
 005733CF    push        esi
 005733D0    push        edi
 005733D1    mov         edi,ecx
 005733D3    mov         esi,edx
 005733D5    mov         ebx,eax
 005733D7    push        0
 005733D9    push        0
 005733DB    mov         eax,ebx
 005733DD    call        005735CC
 005733E2    push        eax
 005733E3    lea         eax,[ebp-10]
 005733E6    push        eax
 005733E7    mov         eax,ebx
 005733E9    call        00573618
 005733EE    mov         ecx,eax
 005733F0    mov         edx,dword ptr [ebp+8]
 005733F3    mov         eax,edi
 005733F5    call        Bounds
 005733FA    lea         ecx,[ebp-10]
 005733FD    mov         edx,esi
 005733FF    mov         eax,ebx
 00573401    call        TBitmapAdapter.DrawFixedPart
 00573406    pop         edi
 00573407    pop         esi
 00573408    pop         ebx
 00573409    mov         esp,ebp
 0057340B    pop         ebp
 0057340C    ret         4
*}
end;

//00573410
function TBitmapAdapter.DrawFixedPart(ACanvas:TCanvas; DestRect:TRect; SrcY:Integer; SrcX:Integer):Boolean;
begin
{*
 00573410    push        ebp
 00573411    mov         ebp,esp
 00573413    add         esp,0FFFFFFF0
 00573416    push        ebx
 00573417    push        esi
 00573418    push        edi
 00573419    mov         ebx,ecx
 0057341B    mov         dword ptr [ebp-4],edx
 0057341E    mov         esi,eax
 00573420    mov         edi,dword ptr [ebx+8];TRect.Right:LongInt
 00573423    sub         edi,dword ptr [ebx]
 00573425    mov         eax,dword ptr [ebx+0C]
 00573428    sub         eax,dword ptr [ebx+4]
 0057342B    mov         dword ptr [ebp-0C],eax
 0057342E    mov         eax,dword ptr [esi+4];TBitmapAdapter.FBitmap:TObject
 00573431    mov         edx,dword ptr ds:[571B48];TAlphaBitmap
 00573437    call        @IsClass
 0057343C    test        al,al
>0057343E    je          00573489
 00573440    mov         esi,dword ptr [esi+4];TBitmapAdapter.FBitmap:TObject
 00573443    mov         byte ptr [ebp-8],0
 00573447    mov         byte ptr [ebp-7],0
 0057344B    mov         byte ptr [ebp-6],0FF
 0057344F    mov         byte ptr [ebp-5],1
 00573453    push        dword ptr [ebp-8]
 00573456    mov         eax,dword ptr [ebp-0C]
 00573459    push        eax
 0057345A    push        edi
 0057345B    mov         eax,dword ptr [ebp+8]
 0057345E    push        eax
 0057345F    mov         eax,dword ptr [ebp+0C]
 00573462    push        eax
 00573463    mov         eax,dword ptr [esi+4]
 00573466    push        eax
 00573467    mov         eax,dword ptr [ebp-0C]
 0057346A    push        eax
 0057346B    push        edi
 0057346C    mov         eax,dword ptr [ebx+4];TRect.Top:LongInt
 0057346F    push        eax
 00573470    mov         eax,dword ptr [ebx]
 00573472    push        eax
 00573473    mov         eax,dword ptr [ebp-4]
 00573476    call        TCanvas.GetHandle
 0057347B    push        eax
 0057347C    call        00572E74
 00573481    cmp         eax,1
 00573484    sbb         eax,eax
 00573486    inc         eax
>00573487    jmp         005734E4
 00573489    mov         eax,dword ptr [esi+4];TBitmapAdapter.FBitmap:TObject
 0057348C    mov         edx,dword ptr ds:[463B28];TBitmap
 00573492    call        @IsClass
 00573497    test        al,al
>00573499    je          005734E2
 0057349B    mov         eax,dword ptr [esi+4];TBitmapAdapter.FBitmap:TObject
 0057349E    mov         dword ptr [ebp-10],eax
 005734A1    mov         eax,dword ptr [esi+18];TBitmapAdapter.FTransparentColor:Cardinal
 005734A4    push        eax
 005734A5    mov         eax,dword ptr [ebp-0C]
 005734A8    push        eax
 005734A9    push        edi
 005734AA    mov         eax,dword ptr [ebp+8]
 005734AD    push        eax
 005734AE    mov         eax,dword ptr [ebp+0C]
 005734B1    push        eax
 005734B2    mov         eax,dword ptr [ebp-10]
 005734B5    call        TBitmap.GetCanvas
 005734BA    call        TCanvas.GetHandle
 005734BF    push        eax
 005734C0    mov         eax,dword ptr [ebp-0C]
 005734C3    push        eax
 005734C4    push        edi
 005734C5    mov         eax,dword ptr [ebx+4];TRect.Top:LongInt
 005734C8    push        eax
 005734C9    mov         eax,dword ptr [ebx]
 005734CB    push        eax
 005734CC    mov         eax,dword ptr [ebp-4]
 005734CF    call        TCanvas.GetHandle
 005734D4    push        eax
 005734D5    call        00572EA4
 005734DA    cmp         eax,1
 005734DD    sbb         eax,eax
 005734DF    inc         eax
>005734E0    jmp         005734E4
 005734E2    xor         eax,eax
 005734E4    pop         edi
 005734E5    pop         esi
 005734E6    pop         ebx
 005734E7    mov         esp,ebp
 005734E9    pop         ebp
 005734EA    ret         8
*}
end;

//005734F0
function TBitmapAdapter.DrawPart(ACanvas:TCanvas; SrcRect:TRect; AMargins:PMARGINS; DestRect:TRect):Boolean;
begin
{*
 005734F0    push        ebp
 005734F1    mov         ebp,esp
 005734F3    add         esp,0FFFFFFF4
 005734F6    push        ebx
 005734F7    push        esi
 005734F8    push        edi
 005734F9    mov         ebx,ecx
 005734FB    mov         dword ptr [ebp-4],edx
 005734FE    mov         edi,eax
 00573500    mov         esi,dword ptr [ebp+0C]
 00573503    mov         eax,dword ptr [ebx+8];TRect.Right:LongInt
 00573506    sub         eax,dword ptr [ebx]
 00573508    mov         edx,dword ptr [esi+8];TRect.Right:LongInt
 0057350B    sub         edx,dword ptr [esi]
 0057350D    cmp         eax,edx
>0057350F    jne         00573539
 00573511    mov         eax,dword ptr [ebx+0C]
 00573514    sub         eax,dword ptr [ebx+4]
 00573517    mov         edx,dword ptr [esi+0C]
 0057351A    sub         edx,dword ptr [esi+4]
 0057351D    cmp         eax,edx
>0057351F    jne         00573539
 00573521    mov         eax,dword ptr [ebx]
 00573523    push        eax
 00573524    mov         eax,dword ptr [ebx+4];TRect.Top:LongInt
 00573527    push        eax
 00573528    mov         ecx,esi
 0057352A    mov         edx,dword ptr [ebp-4]
 0057352D    mov         eax,edi
 0057352F    call        TBitmapAdapter.DrawFixedPart
>00573534    jmp         005735C0
 00573539    cmp         dword ptr [ebp+8],0
>0057353D    jne         00573545
 0057353F    lea         eax,[edi+8];TBitmapAdapter.FMargins:_MARGINS
 00573542    mov         dword ptr [ebp+8],eax
 00573545    mov         eax,dword ptr [edi+4];TBitmapAdapter.FBitmap:TObject
 00573548    mov         edx,dword ptr ds:[571B48];TAlphaBitmap
 0057354E    call        @IsClass
 00573553    test        al,al
>00573555    je          0057357D
 00573557    mov         eax,dword ptr [edi+4];TBitmapAdapter.FBitmap:TObject
 0057355A    mov         dword ptr [ebp-8],eax
 0057355D    push        ebx
 0057355E    mov         eax,dword ptr [ebp+8]
 00573561    push        eax
 00573562    mov         eax,dword ptr [edi+18];TBitmapAdapter.FTransparentColor:Cardinal
 00573565    push        eax
 00573566    mov         eax,dword ptr [ebp-4]
 00573569    call        TCanvas.GetHandle
 0057356E    mov         edx,dword ptr [ebp-8]
 00573571    mov         ecx,dword ptr [edx+4]
 00573574    mov         edx,esi
 00573576    call        00572974
>0057357B    jmp         005735C0
 0057357D    mov         eax,dword ptr [edi+4];TBitmapAdapter.FBitmap:TObject
 00573580    mov         edx,dword ptr ds:[463B28];TBitmap
 00573586    call        @IsClass
 0057358B    test        al,al
>0057358D    je          005735BE
 0057358F    mov         eax,dword ptr [edi+4];TBitmapAdapter.FBitmap:TObject
 00573592    mov         dword ptr [ebp-0C],eax
 00573595    push        ebx
 00573596    mov         eax,dword ptr [ebp+8]
 00573599    push        eax
 0057359A    mov         eax,dword ptr [edi+18];TBitmapAdapter.FTransparentColor:Cardinal
 0057359D    push        eax
 0057359E    mov         eax,dword ptr [ebp-0C]
 005735A1    call        TBitmap.GetCanvas
 005735A6    call        TCanvas.GetHandle
 005735AB    push        eax
 005735AC    mov         eax,dword ptr [ebp-4]
 005735AF    call        TCanvas.GetHandle
 005735B4    mov         edx,esi
 005735B6    pop         ecx
 005735B7    call        00572974
>005735BC    jmp         005735C0
 005735BE    xor         eax,eax
 005735C0    pop         edi
 005735C1    pop         esi
 005735C2    pop         ebx
 005735C3    mov         esp,ebp
 005735C5    pop         ebp
 005735C6    ret         8
*}
end;

//005735CC
{*function sub_005735CC(?:TBitmapAdapter):?;
begin
 005735CC    push        ebx
 005735CD    push        esi
 005735CE    mov         ebx,eax
 005735D0    mov         esi,dword ptr [ebx+4];TBitmapAdapter.FBitmap:TObject
 005735D3    mov         eax,esi
 005735D5    mov         edx,dword ptr ds:[571B48];TAlphaBitmap
 005735DB    call        @IsClass
 005735E0    test        al,al
>005735E2    je          005735EE
 005735E4    mov         eax,esi
 005735E6    call        00573024
 005735EB    pop         esi
 005735EC    pop         ebx
 005735ED    ret
 005735EE    mov         eax,esi
 005735F0    mov         edx,dword ptr ds:[463B28];TBitmap
 005735F6    call        @IsClass
 005735FB    test        al,al
>005735FD    je          00573608
 005735FF    mov         eax,esi
 00573601    mov         edx,dword ptr [eax]
 00573603    call        dword ptr [edx+24]
>00573606    jmp         0057360A
 00573608    xor         eax,eax
 0057360A    pop         esi
 0057360B    pop         ebx
 0057360C    ret
end;*}

//00573618
{*function sub_00573618(?:TBitmapAdapter):?;
begin
 00573618    push        ebx
 00573619    push        esi
 0057361A    mov         ebx,eax
 0057361C    mov         esi,dword ptr [ebx+4];TBitmapAdapter.FBitmap:TObject
 0057361F    mov         eax,esi
 00573621    mov         edx,dword ptr ds:[571B48];TAlphaBitmap
 00573627    call        @IsClass
 0057362C    test        al,al
>0057362E    je          0057363A
 00573630    mov         eax,esi
 00573632    call        00573028
 00573637    pop         esi
 00573638    pop         ebx
 00573639    ret
 0057363A    mov         eax,esi
 0057363C    mov         edx,dword ptr ds:[463B28];TBitmap
 00573642    call        @IsClass
 00573647    test        al,al
>00573649    je          00573654
 0057364B    mov         eax,esi
 0057364D    mov         edx,dword ptr [eax]
 0057364F    call        dword ptr [edx+30]
>00573652    jmp         00573656
 00573654    xor         eax,eax
 00573656    pop         esi
 00573657    pop         ebx
 00573658    ret
end;*}

//0057365C
procedure TBitmapAdapter.LoadFromResourceID(Instance:Cardinal; ResID:Integer);
begin
{*
 0057365C    push        ebp
 0057365D    mov         ebp,esp
 0057365F    push        ecx
 00573660    push        ebx
 00573661    push        esi
 00573662    push        edi
 00573663    mov         edi,ecx
 00573665    mov         esi,edx
 00573667    mov         ebx,eax
 00573669    mov         eax,ebx
 0057366B    call        TBitmapAdapter.Clear
 00573670    mov         dl,1
 00573672    mov         eax,[00571B48];TAlphaBitmap
 00573677    call        TObject.Create;TAlphaBitmap.Create
 0057367C    mov         dword ptr [ebp-4],eax
 0057367F    xor         eax,eax
 00573681    push        ebp
 00573682    push        5736E0
 00573687    push        dword ptr fs:[eax]
 0057368A    mov         dword ptr fs:[eax],esp
 0057368D    mov         ecx,edi
 0057368F    mov         edx,esi
 00573691    mov         eax,dword ptr [ebp-4]
 00573694    call        TAlphaBitmap.LoadFromResourceID
 00573699    mov         eax,dword ptr [ebp-4]
 0057369C    cmp         byte ptr [eax+40],20;TAlphaBitmap.FBitCount:byte
>005736A0    jae         005736BF
 005736A2    mov         dl,1
 005736A4    mov         eax,[00463B28];TBitmap
 005736A9    call        TBitmap.Create;TBitmap.Create
 005736AE    mov         dword ptr [ebx+4],eax;TBitmapAdapter.FBitmap:TObject
 005736B1    mov         eax,dword ptr [ebx+4];TBitmapAdapter.FBitmap:TObject
 005736B4    mov         ecx,edi
 005736B6    mov         edx,esi
 005736B8    call        TBitmap.LoadFromResourceID
>005736BD    jmp         005736CA
 005736BF    mov         eax,dword ptr [ebp-4]
 005736C2    mov         dword ptr [ebx+4],eax;TBitmapAdapter.FBitmap:TObject
 005736C5    xor         eax,eax
 005736C7    mov         dword ptr [ebp-4],eax
 005736CA    xor         eax,eax
 005736CC    pop         edx
 005736CD    pop         ecx
 005736CE    pop         ecx
 005736CF    mov         dword ptr fs:[eax],edx
 005736D2    push        5736E7
 005736D7    mov         eax,dword ptr [ebp-4]
 005736DA    call        TObject.Free
 005736DF    ret
>005736E0    jmp         @HandleFinally
>005736E5    jmp         005736D7
 005736E7    pop         edi
 005736E8    pop         esi
 005736E9    pop         ebx
 005736EA    pop         ecx
 005736EB    pop         ebp
 005736EC    ret
*}
end;

//005736F0
procedure TBitmapAdapter.LoadFromResourceName(Instance:Cardinal; ResName:string);
begin
{*
 005736F0    push        ebp
 005736F1    mov         ebp,esp
 005736F3    push        ecx
 005736F4    push        ebx
 005736F5    push        esi
 005736F6    push        edi
 005736F7    mov         edi,ecx
 005736F9    mov         esi,edx
 005736FB    mov         ebx,eax
 005736FD    mov         eax,ebx
 005736FF    call        TBitmapAdapter.Clear
 00573704    mov         dl,1
 00573706    mov         eax,[00571B48];TAlphaBitmap
 0057370B    call        TObject.Create;TAlphaBitmap.Create
 00573710    mov         dword ptr [ebp-4],eax
 00573713    xor         eax,eax
 00573715    push        ebp
 00573716    push        573774
 0057371B    push        dword ptr fs:[eax]
 0057371E    mov         dword ptr fs:[eax],esp
 00573721    mov         ecx,edi
 00573723    mov         edx,esi
 00573725    mov         eax,dword ptr [ebp-4]
 00573728    call        TAlphaBitmap.LoadFromResourceName
 0057372D    mov         eax,dword ptr [ebp-4]
 00573730    cmp         byte ptr [eax+40],20;TAlphaBitmap.FBitCount:byte
>00573734    jae         00573753
 00573736    mov         dl,1
 00573738    mov         eax,[00463B28];TBitmap
 0057373D    call        TBitmap.Create;TBitmap.Create
 00573742    mov         dword ptr [ebx+4],eax;TBitmapAdapter.FBitmap:TObject
 00573745    mov         eax,dword ptr [ebx+4];TBitmapAdapter.FBitmap:TObject
 00573748    mov         ecx,edi
 0057374A    mov         edx,esi
 0057374C    call        TBitmap.LoadFromResourceName
>00573751    jmp         0057375E
 00573753    mov         eax,dword ptr [ebp-4]
 00573756    mov         dword ptr [ebx+4],eax;TBitmapAdapter.FBitmap:TObject
 00573759    xor         eax,eax
 0057375B    mov         dword ptr [ebp-4],eax
 0057375E    xor         eax,eax
 00573760    pop         edx
 00573761    pop         ecx
 00573762    pop         ecx
 00573763    mov         dword ptr fs:[eax],edx
 00573766    push        57377B
 0057376B    mov         eax,dword ptr [ebp-4]
 0057376E    call        TObject.Free
 00573773    ret
>00573774    jmp         @HandleFinally
>00573779    jmp         0057376B
 0057377B    pop         edi
 0057377C    pop         esi
 0057377D    pop         ebx
 0057377E    pop         ecx
 0057377F    pop         ebp
 00573780    ret
*}
end;

//00573784
constructor TGlobalXPData.Create;
begin
{*
 00573784    push        ebx
 00573785    push        esi
 00573786    test        dl,dl
>00573788    je          00573792
 0057378A    add         esp,0FFFFFFF0
 0057378D    call        @ClassCreate
 00573792    mov         ebx,edx
 00573794    mov         esi,eax
 00573796    xor         edx,edx
 00573798    mov         eax,esi
 0057379A    call        TObject.Create
 0057379F    mov         eax,esi
 005737A1    call        TGlobalXPData.Update
 005737A6    mov         eax,esi
 005737A8    test        bl,bl
>005737AA    je          005737BB
 005737AC    call        @AfterConstruction
 005737B1    pop         dword ptr fs:[0]
 005737B8    add         esp,0C
 005737BB    mov         eax,esi
 005737BD    pop         esi
 005737BE    pop         ebx
 005737BF    ret
*}
end;

//005737C0
destructor TGlobalXPData.Destroy();
begin
{*
 005737C0    push        ebx
 005737C1    push        esi
 005737C2    call        @BeforeDestruction
 005737C7    mov         ebx,edx
 005737C9    mov         esi,eax
 005737CB    mov         eax,dword ptr [esi+0C];TGlobalXPData.FCaptionButtons:TBitmapAdapter
 005737CE    call        TObject.Free
 005737D3    mov         edx,ebx
 005737D5    and         dl,0FC
 005737D8    mov         eax,esi
 005737DA    call        TObject.Destroy
 005737DF    test        bl,bl
>005737E1    jle         005737EA
 005737E3    mov         eax,esi
 005737E5    call        @ClassDestroy
 005737EA    pop         esi
 005737EB    pop         ebx
 005737EC    ret
*}
end;

//005737F0
procedure TGlobalXPData.AddClient;
begin
{*
 005737F0    inc         dword ptr [eax+14];TGlobalXPData.FClientCount:Integer
 005737F3    ret
*}
end;

//005737F4
function TGlobalXPData.Draw(ACanvas:TCanvas; State:Integer; DrawRect:TRect):Boolean;
begin
{*
 005737F4    push        ebp
 005737F5    mov         ebp,esp
 005737F7    add         esp,0FFFFFFEC
 005737FA    push        ebx
 005737FB    push        esi
 005737FC    mov         esi,ecx
 005737FE    mov         dword ptr [ebp-4],edx
 00573801    mov         ebx,eax
 00573803    movzx       eax,byte ptr [ebx+11];TGlobalXPData.FBitmapValid:Boolean
 00573807    test        al,al
>00573809    je          00573860
 0057380B    mov         eax,dword ptr [ebx+8];TGlobalXPData.FCaptionButtonCount:Integer
 0057380E    cmp         esi,eax
>00573810    jl          00573826
 00573812    cmp         esi,4
>00573815    jle         00573826
 00573817    dec         esi
 00573818    and         esi,80000003
>0057381E    jns         00573825
 00573820    dec         esi
 00573821    or          esi,0FFFFFFFC
 00573824    inc         esi
 00573825    inc         esi
 00573826    cmp         eax,esi
>00573828    jge         0057382C
 0057382A    mov         esi,eax
 0057382C    mov         eax,dword ptr [ebx+4];TGlobalXPData.FCaptionButtonHeight:Integer
 0057382F    push        eax
 00573830    lea         eax,[ebp-14]
 00573833    push        eax
 00573834    mov         eax,dword ptr [ebx+0C];TGlobalXPData.FCaptionButtons:TBitmapAdapter
 00573837    call        00573618
 0057383C    mov         ecx,eax
 0057383E    mov         edx,esi
 00573840    dec         edx
 00573841    imul        edx,dword ptr [ebx+4];TGlobalXPData.FCaptionButtonHeight:Integer
 00573845    xor         eax,eax
 00573847    call        Bounds
 0057384C    mov         eax,dword ptr [ebp+8]
 0057384F    push        eax
 00573850    push        0
 00573852    lea         ecx,[ebp-14]
 00573855    mov         edx,dword ptr [ebp-4]
 00573858    mov         eax,dword ptr [ebx+0C];TGlobalXPData.FCaptionButtons:TBitmapAdapter
 0057385B    call        TBitmapAdapter.DrawPart
 00573860    pop         esi
 00573861    pop         ebx
 00573862    mov         esp,ebp
 00573864    pop         ebp
 00573865    ret         4
*}
end;

//00573868
procedure TGlobalXPData.DrawSimple(ACanvas:TCanvas; State:Integer; DrawRect:TRect);
begin
{*
 00573868    push        ebp
 00573869    mov         ebp,esp
 0057386B    add         esp,0FFFFFFF0
 0057386E    push        ebx
 0057386F    push        esi
 00573870    push        edi
 00573871    mov         edi,ecx
 00573873    mov         esi,edx
 00573875    mov         ebx,dword ptr [ebp+8]
 00573878    dec         edi
 00573879    and         edi,80000003
>0057387F    jns         00573886
 00573881    dec         edi
 00573882    or          edi,0FFFFFFFC
 00573885    inc         edi
 00573886    call        0056FF78
 0057388B    lea         ecx,[ebp-10]
 0057388E    movzx       edx,byte ptr [edi+78994D]
 00573895    call        TThemeServices.GetElementDetails
 0057389A    push        ebx
 0057389B    mov         eax,esi
 0057389D    call        TCanvas.GetHandle
 005738A2    push        eax
 005738A3    call        0056FF78
 005738A8    lea         ecx,[ebp-10]
 005738AB    pop         edx
 005738AC    call        TThemeServices.DrawElement
 005738B1    mov         eax,dword ptr [ebx+0C]
 005738B4    dec         eax
 005738B5    push        eax
 005738B6    mov         eax,dword ptr [ebx+8];TRect.Right:LongInt
 005738B9    dec         eax
 005738BA    push        eax
 005738BB    mov         eax,dword ptr [ebx+4];TRect.Top:LongInt
 005738BE    inc         eax
 005738BF    push        eax
 005738C0    mov         eax,dword ptr [ebx]
 005738C2    inc         eax
 005738C3    push        eax
 005738C4    call        gdi32.CreateRectRgn
 005738C9    mov         dword ptr [ebp-4],eax
 005738CC    xor         eax,eax
 005738CE    push        ebp
 005738CF    push        57393C
 005738D4    push        dword ptr fs:[eax]
 005738D7    mov         dword ptr fs:[eax],esp
 005738DA    call        0056FF78
 005738DF    lea         ecx,[ebp-10]
 005738E2    movzx       edx,byte ptr [edi+789951]
 005738E9    call        TThemeServices.GetElementDetails
 005738EE    mov         eax,dword ptr [ebp-4]
 005738F1    push        eax
 005738F2    mov         eax,esi
 005738F4    call        TCanvas.GetHandle
 005738F9    push        eax
 005738FA    call        gdi32.SelectClipRgn
 005738FF    push        ebx
 00573900    mov         eax,esi
 00573902    call        TCanvas.GetHandle
 00573907    push        eax
 00573908    call        0056FF78
 0057390D    lea         ecx,[ebp-10]
 00573910    pop         edx
 00573911    call        TThemeServices.DrawElement
 00573916    push        0
 00573918    mov         eax,esi
 0057391A    call        TCanvas.GetHandle
 0057391F    push        eax
 00573920    call        gdi32.SelectClipRgn
 00573925    xor         eax,eax
 00573927    pop         edx
 00573928    pop         ecx
 00573929    pop         ecx
 0057392A    mov         dword ptr fs:[eax],edx
 0057392D    push        573943
 00573932    mov         eax,dword ptr [ebp-4]
 00573935    push        eax
 00573936    call        gdi32.DeleteObject
 0057393B    ret
>0057393C    jmp         @HandleFinally
>00573941    jmp         00573932
 00573943    pop         edi
 00573944    pop         esi
 00573945    pop         ebx
 00573946    mov         esp,ebp
 00573948    pop         ebp
 00573949    ret         4
*}
end;

//0057394C
procedure TGlobalXPData.RemoveClient;
begin
{*
 0057394C    dec         dword ptr [eax+14];TGlobalXPData.FClientCount:Integer
 0057394F    cmp         dword ptr [eax+14],0;TGlobalXPData.FClientCount:Integer
>00573953    jne         0057396A
 00573955    cmp         eax,dword ptr ds:[815524];gvar_00815524:TGlobalXPData
>0057395B    jne         00573965
 0057395D    xor         edx,edx
 0057395F    mov         dword ptr ds:[815524],edx;gvar_00815524:TGlobalXPData
 00573965    call        TObject.Free
 0057396A    ret
*}
end;

//0057396C
procedure TGlobalXPData.Update;
begin
{*
 0057396C    push        ebx
 0057396D    push        esi
 0057396E    mov         esi,eax
 00573970    call        0056FF78
 00573975    cmp         byte ptr [eax+5],0
>00573979    je          00573995
 0057397B    mov         eax,[0078D510];^gvar_0079314C
 00573980    mov         eax,dword ptr [eax]
 00573982    call        eax
 00573984    test        eax,eax
>00573986    je          00573995
 00573988    mov         eax,[0078DB5C];^gvar_00793150
 0057398D    mov         eax,dword ptr [eax]
 0057398F    call        eax
 00573991    test        eax,eax
>00573993    jne         00573999
 00573995    xor         ebx,ebx
>00573997    jmp         0057399B
 00573999    mov         bl,1
 0057399B    mov         byte ptr [esi+10],bl;TGlobalXPData.FIsThemed:Boolean
 0057399E    test        bl,bl
>005739A0    je          005739E4
 005739A2    cmp         dword ptr [esi+0C],0;TGlobalXPData.FCaptionButtons:TBitmapAdapter
>005739A6    jne         005739B7
 005739A8    mov         dl,1
 005739AA    mov         eax,[00571EA8];TBitmapAdapter
 005739AF    call        TBitmapAdapter.Create;TBitmapAdapter.Create
 005739B4    mov         dword ptr [esi+0C],eax;TGlobalXPData.FCaptionButtons:TBitmapAdapter
 005739B7    lea         edx,[esi+8];TGlobalXPData.FCaptionButtonCount:Integer
 005739BA    mov         eax,dword ptr [esi+0C];TGlobalXPData.FCaptionButtons:TBitmapAdapter
 005739BD    call        00572C14
 005739C2    mov         ebx,eax
 005739C4    mov         byte ptr [esi+11],bl;TGlobalXPData.FBitmapValid:Boolean
 005739C7    test        bl,bl
>005739C9    je          005739DC
 005739CB    mov         eax,dword ptr [esi+0C];TGlobalXPData.FCaptionButtons:TBitmapAdapter
 005739CE    call        005735CC
 005739D3    cdq
 005739D4    idiv        eax,dword ptr [esi+8];TGlobalXPData.FCaptionButtonCount:Integer
 005739D7    mov         dword ptr [esi+4],eax;TGlobalXPData.FCaptionButtonHeight:Integer
>005739DA    jmp         005739E4
 005739DC    lea         eax,[esi+0C];TGlobalXPData.FCaptionButtons:TBitmapAdapter
 005739DF    call        FreeAndNil
 005739E4    pop         esi
 005739E5    pop         ebx
 005739E6    ret
*}
end;

//005739E8
{*procedure sub_005739E8(?:?; ?:TCanvas; ?:?; ?:?; ?:?);
begin
 005739E8    push        ebp
 005739E9    mov         ebp,esp
 005739EB    add         esp,0FFFFFFE0
 005739EE    push        ebx
 005739EF    push        esi
 005739F0    push        edi
 005739F1    mov         esi,ecx
 005739F3    lea         edi,[ebp-20]
 005739F6    movs        dword ptr [edi],dword ptr [esi]
 005739F7    movs        dword ptr [edi],dword ptr [esi]
 005739F8    movs        dword ptr [edi],dword ptr [esi]
 005739F9    movs        dword ptr [edi],dword ptr [esi]
 005739FA    mov         dword ptr [ebp-4],edx
 005739FD    mov         ebx,eax
 005739FF    mov         edi,dword ptr [ebp+8]
 00573A02    mov         esi,dword ptr [ebp+0C]
 00573A05    push        0
 00573A07    push        0
 00573A09    push        0
 00573A0B    push        0
 00573A0D    push        esi
 00573A0E    call        user32.SetRect
 00573A13    mov         eax,dword ptr [ebp-4]
 00573A16    mov         eax,dword ptr [eax+40]
 00573A19    mov         dword ptr [ebp-10],eax
 00573A1C    mov         edx,dword ptr [ebx+54]
 00573A1F    mov         eax,dword ptr [ebp-4]
 00573A22    call        TCanvas.SetFont
 00573A27    push        esi
 00573A28    movzx       eax,byte ptr [ebx+38]
 00573A2C    movzx       eax,word ptr [eax*2+789940]
 00573A34    or          ax,400
 00573A38    movzx       eax,ax
 00573A3B    push        eax
 00573A3C    or          ecx,0FFFFFFFF
 00573A3F    mov         edx,dword ptr [ebx+4C]
 00573A42    mov         eax,dword ptr [ebp-4]
 00573A45    call        00540308
 00573A4A    mov         edx,dword ptr [ebp-10]
 00573A4D    mov         eax,dword ptr [ebp-4]
 00573A50    call        TCanvas.SetFont
 00573A55    mov         eax,ebx
 00573A57    call        005744B4
 00573A5C    test        al,al
>00573A5E    je          00573A7F
 00573A60    mov         eax,dword ptr [ebx+60]
 00573A63    mov         edx,dword ptr [eax+34]
 00573A66    dec         edx
 00573A67    push        edx
 00573A68    mov         eax,dword ptr [eax+38]
 00573A6B    dec         eax
 00573A6C    push        eax
 00573A6D    push        0
 00573A6F    push        0
 00573A71    push        edi
 00573A72    call        user32.SetRect
 00573A77    mov         eax,dword ptr [ebx+70]
 00573A7A    mov         dword ptr [ebp-0C],eax
>00573A7D    jmp         00573A92
 00573A7F    push        0
 00573A81    push        0
 00573A83    push        0
 00573A85    push        0
 00573A87    push        edi
 00573A88    call        user32.SetRect
 00573A8D    xor         eax,eax
 00573A8F    mov         dword ptr [ebp-0C],eax
 00573A92    mov         edx,dword ptr [edi+8]
 00573A95    add         edx,dword ptr [ebp-0C]
 00573A98    add         edx,dword ptr [esi+8]
 00573A9B    mov         eax,dword ptr [ebp-18]
 00573A9E    sub         eax,dword ptr [ebp-20]
 00573AA1    mov         dword ptr [ebp-8],eax
 00573AA4    mov         eax,dword ptr [ebx+68]
 00573AA7    cmp         eax,0FFFFFFFF
>00573AAA    jne         00573AB1
 00573AAC    mov         eax,4
 00573AB1    movzx       ecx,byte ptr [ebx+38]
 00573AB5    sub         cl,1
>00573AB8    jb          00573AD6
>00573ABA    je          00573ABE
>00573ABC    jmp         00573ACA
 00573ABE    mov         ecx,dword ptr [ebp-8]
 00573AC1    sub         ecx,edx
 00573AC3    sub         ecx,eax
 00573AC5    dec         ecx
 00573AC6    mov         eax,ecx
>00573AC8    jmp         00573AD6
 00573ACA    mov         eax,dword ptr [ebp-8]
 00573ACD    sub         eax,edx
 00573ACF    sar         eax,1
>00573AD1    jns         00573AD6
 00573AD3    adc         eax,0
 00573AD6    movzx       edx,byte ptr [ebx+64]
 00573ADA    sub         dl,1
>00573ADD    jb          00573AE3
>00573ADF    je          00573AFE
>00573AE1    jmp         00573B17
 00573AE3    mov         edx,edi
 00573AE5    xor         ecx,ecx
 00573AE7    xchg        eax,edx
 00573AE8    call        OffsetRect
 00573AED    mov         edx,dword ptr [edi+8]
 00573AF0    add         edx,dword ptr [ebp-0C]
 00573AF3    mov         eax,esi
 00573AF5    xor         ecx,ecx
 00573AF7    call        OffsetRect
>00573AFC    jmp         00573B17
 00573AFE    mov         edx,esi
 00573B00    xor         ecx,ecx
 00573B02    xchg        eax,edx
 00573B03    call        OffsetRect
 00573B08    mov         edx,dword ptr [esi+8]
 00573B0B    add         edx,dword ptr [ebp-0C]
 00573B0E    mov         eax,edi
 00573B10    xor         ecx,ecx
 00573B12    call        OffsetRect
 00573B17    mov         ebx,dword ptr [ebp-14]
 00573B1A    mov         eax,dword ptr [ebp-1C]
 00573B1D    sub         ebx,eax
 00573B1F    mov         ecx,ebx
 00573B21    sub         ecx,dword ptr [edi+0C]
 00573B24    sar         ecx,1
>00573B26    jns         00573B2B
 00573B28    adc         ecx,0
 00573B2B    add         ecx,eax
 00573B2D    mov         eax,edi
 00573B2F    mov         edx,dword ptr [ebp-20]
 00573B32    call        OffsetRect
 00573B37    mov         ecx,ebx
 00573B39    sub         ecx,dword ptr [esi+0C]
 00573B3C    sar         ecx,1
>00573B3E    jns         00573B43
 00573B40    adc         ecx,0
 00573B43    add         ecx,dword ptr [ebp-1C]
 00573B46    mov         eax,esi
 00573B48    mov         edx,dword ptr [ebp-20]
 00573B4B    call        OffsetRect
 00573B50    pop         edi
 00573B51    pop         esi
 00573B52    pop         ebx
 00573B53    mov         esp,ebp
 00573B55    pop         ebp
 00573B56    ret         8
end;*}

//00573B5C
{*procedure sub_00573B5C(?:?; ?:?);
begin
 00573B5C    push        ebx
 00573B5D    push        esi
 00573B5E    push        edi
 00573B5F    push        ebp
 00573B60    add         esp,0FFFFFFCC
 00573B63    mov         esi,edx
 00573B65    mov         ebx,eax
 00573B67    test        esi,esi
>00573B69    je          00573DF5
 00573B6F    mov         byte ptr [ebx+0DE],0
 00573B76    push        0F0
 00573B78    push        esi
 00573B79    call        user32.GetWindowLongW
 00573B7E    mov         edi,eax
 00573B80    mov         eax,edi
 00573B82    and         eax,0C00000
 00573B87    cmp         eax,0C00000
 00573B8C    sete        al
 00573B8F    mov         byte ptr [ebx+0D4],al
 00573B95    test        al,al
>00573B97    je          00573DF5
 00573B9D    mov         dword ptr [esp+8],2C
 00573BA5    lea         eax,[esp+8]
 00573BA9    push        eax
 00573BAA    push        esi
 00573BAB    call        user32.GetWindowPlacement
 00573BB0    push        0EC
 00573BB2    push        esi
 00573BB3    call        user32.GetWindowLongW
 00573BB8    mov         ebp,eax
 00573BBA    mov         eax,ebp
 00573BBC    and         eax,80
 00573BC1    cmp         eax,80
 00573BC6    sete        al
 00573BC9    mov         byte ptr [ebx+0D5],al
 00573BCF    mov         eax,ebx
 00573BD1    call        005744DC
 00573BD6    test        al,al
>00573BD8    jne         00573BE8
 00573BDA    cmp         dword ptr [esp+10],2
>00573BDF    jne         00573BE8
 00573BE1    mov         byte ptr [ebx+0D5],0
 00573BE8    call        user32.GetActiveWindow
 00573BED    cmp         esi,eax
>00573BEF    jne         00573BFA
 00573BF1    call        0056BE38
 00573BF6    test        al,al
>00573BF8    jne         00573BFE
 00573BFA    xor         eax,eax
>00573BFC    jmp         00573C00
 00573BFE    mov         al,1
 00573C00    mov         byte ptr [ebx+0ED],al
 00573C06    mov         eax,edi
 00573C08    and         eax,40000
 00573C0D    cmp         eax,40000
>00573C12    jne         00573C32
 00573C14    cmp         dword ptr [esp+10],2
>00573C19    je          00573C32
 00573C1B    push        20
 00573C1D    call        user32.GetSystemMetrics
 00573C22    mov         dword ptr [esp],eax
 00573C25    push        21
 00573C27    call        user32.GetSystemMetrics
 00573C2C    mov         dword ptr [esp+4],eax
>00573C30    jmp         00573C47
 00573C32    push        7
 00573C34    call        user32.GetSystemMetrics
 00573C39    mov         dword ptr [esp],eax
 00573C3C    push        8
 00573C3E    call        user32.GetSystemMetrics
 00573C43    mov         dword ptr [esp+4],eax
 00573C47    mov         eax,dword ptr [esp+4]
 00573C4B    add         eax,2
 00573C4E    mov         dword ptr [ebx+9C],eax
 00573C54    cmp         byte ptr [ebx+0D5],0
>00573C5B    je          00573C6C
 00573C5D    push        33
 00573C5F    call        user32.GetSystemMetrics
 00573C64    mov         dword ptr [ebx+0C0],eax
>00573C6A    jmp         00573C79
 00573C6C    push        4
 00573C6E    call        user32.GetSystemMetrics
 00573C73    mov         dword ptr [ebx+0C0],eax
 00573C79    mov         eax,dword ptr [ebx+0C0]
 00573C7F    sub         eax,5
 00573C82    mov         dword ptr [ebx+0A4],eax
 00573C88    mov         eax,ebx
 00573C8A    call        005744DC
 00573C8F    test        al,al
>00573C91    je          00573CED
 00573C93    call        005726B4
 00573C98    test        al,al
>00573C9A    je          00573CDF
 00573C9C    cmp         byte ptr [ebx+0D5],0
>00573CA3    je          00573CB7
 00573CA5    push        34
 00573CA7    call        user32.GetSystemMetrics
 00573CAC    sub         eax,4
 00573CAF    mov         dword ptr [ebx+0A0],eax
>00573CB5    jmp         00573CC7
 00573CB7    push        1E
 00573CB9    call        user32.GetSystemMetrics
 00573CBE    sub         eax,4
 00573CC1    mov         dword ptr [ebx+0A0],eax
 00573CC7    sub         dword ptr [ebx+9C],2
 00573CCE    mov         eax,dword ptr [ebx+0C0]
 00573CD4    sub         eax,3
 00573CD7    mov         dword ptr [ebx+0A4],eax
>00573CDD    jmp         00573D18
 00573CDF    mov         eax,dword ptr [ebx+0A4]
 00573CE5    mov         dword ptr [ebx+0A0],eax
>00573CEB    jmp         00573D18
 00573CED    cmp         byte ptr [ebx+0D5],0
>00573CF4    je          00573D08
 00573CF6    push        34
 00573CF8    call        user32.GetSystemMetrics
 00573CFD    sub         eax,2
 00573D00    mov         dword ptr [ebx+0A0],eax
>00573D06    jmp         00573D18
 00573D08    push        1E
 00573D0A    call        user32.GetSystemMetrics
 00573D0F    sub         eax,2
 00573D12    mov         dword ptr [ebx+0A0],eax
 00573D18    mov         eax,dword ptr [esp]
 00573D1B    mov         dword ptr [ebx+98],eax
 00573D21    mov         eax,dword ptr [ebx+0A0]
 00573D27    add         eax,2
 00573D2A    add         dword ptr [ebx+98],eax
 00573D30    mov         eax,edi
 00573D32    and         eax,80000
 00573D37    cmp         eax,80000
>00573D3C    jne         00573DF5
 00573D42    mov         eax,dword ptr [ebx+0A0]
 00573D48    add         eax,2
 00573D4B    add         dword ptr [ebx+98],eax
 00573D51    cmp         byte ptr [ebx+0D5],0
>00573D58    jne         00573DF5
 00573D5E    mov         eax,edi
 00573D60    and         eax,10000
 00573D65    cmp         eax,10000
>00573D6A    je          00573D7A
 00573D6C    mov         eax,edi
 00573D6E    and         eax,20000
 00573D73    cmp         eax,20000
>00573D78    jne         00573DD8
 00573D7A    mov         eax,ebx
 00573D7C    call        005744DC
 00573D81    test        al,al
>00573D83    je          00573D98
 00573D85    mov         eax,dword ptr [ebx+0A0]
 00573D8B    add         eax,2
 00573D8E    add         eax,eax
 00573D90    add         dword ptr [ebx+98],eax
>00573D96    jmp         00573DF5
 00573D98    mov         eax,dword ptr [ebx+0A0]
 00573D9E    add         eax,eax
 00573DA0    add         eax,2
 00573DA3    add         dword ptr [ebx+98],eax
 00573DA9    test        edi,10000
>00573DAF    je          00573DB9
 00573DB1    test        edi,20000
>00573DB7    jne         00573DF5
 00573DB9    and         ebp,400
 00573DBF    cmp         ebp,400
>00573DC5    jne         00573DF5
 00573DC7    mov         eax,dword ptr [ebx+0A0]
 00573DCD    add         eax,4
 00573DD0    add         dword ptr [ebx+98],eax
>00573DD6    jmp         00573DF5
 00573DD8    and         ebp,400
 00573DDE    cmp         ebp,400
>00573DE4    jne         00573DF5
 00573DE6    mov         eax,dword ptr [ebx+0A0]
 00573DEC    add         eax,2
 00573DEF    add         dword ptr [ebx+98],eax
 00573DF5    add         esp,34
 00573DF8    pop         ebp
 00573DF9    pop         edi
 00573DFA    pop         esi
 00573DFB    pop         ebx
 00573DFC    ret
end;*}

//00573E00
{*procedure sub_00573E00(?:?; ?:HDC);
begin
 00573E00    push        ebp
 00573E01    mov         ebp,esp
 00573E03    push        ecx
 00573E04    push        ebx
 00573E05    push        esi
 00573E06    mov         ebx,edx
 00573E08    mov         esi,eax
 00573E0A    cmp         byte ptr [esi+76],0
>00573E0E    je          00573F0F
 00573E14    cmp         byte ptr [esi+0D4],0
>00573E1B    je          00573F0F
 00573E21    test        byte ptr [esi+1C],8
>00573E25    jne         00573F0F
 00573E2B    mov         dl,1
 00573E2D    mov         eax,[00476D34];TControlCanvas
 00573E32    call        TCanvas.Create;TControlCanvas.Create
 00573E37    mov         dword ptr [ebp-4],eax
 00573E3A    xor         eax,eax
 00573E3C    push        ebp
 00573E3D    push        573F08
 00573E42    push        dword ptr fs:[eax]
 00573E45    mov         dword ptr fs:[eax],esp
 00573E48    mov         edx,ebx
 00573E4A    mov         eax,dword ptr [ebp-4]
 00573E4D    call        TCanvas.SetHandle
 00573E52    mov         eax,esi
 00573E54    call        00574514
 00573E59    mov         edx,eax
 00573E5B    mov         eax,esi
 00573E5D    call        00574668
 00573E62    lea         ebx,[esi+0B0]
 00573E68    mov         edx,dword ptr [ebx+8]
 00573E6B    sub         edx,dword ptr [ebx]
 00573E6D    mov         eax,dword ptr [esi+0AC]
 00573E73    mov         ecx,dword ptr [eax]
 00573E75    call        dword ptr [ecx+44]
 00573E78    mov         edx,dword ptr [ebx+0C]
 00573E7B    sub         edx,dword ptr [ebx+4]
 00573E7E    mov         eax,dword ptr [esi+0AC]
 00573E84    mov         ecx,dword ptr [eax]
 00573E86    call        dword ptr [ecx+38]
 00573E89    mov         eax,dword ptr [esi+0AC]
 00573E8F    call        TBitmap.GetCanvas
 00573E94    mov         edx,eax
 00573E96    mov         eax,esi
 00573E98    call        00573F14
 00573E9D    cmp         byte ptr [esi+74],0
>00573EA1    je          00573EB9
 00573EA3    mov         eax,dword ptr [esi+0AC]
 00573EA9    call        TBitmap.GetCanvas
 00573EAE    mov         edx,eax
 00573EB0    mov         eax,esi
 00573EB2    call        005742BC
>00573EB7    jmp         00573ECD
 00573EB9    mov         eax,dword ptr [esi+0AC]
 00573EBF    call        TBitmap.GetCanvas
 00573EC4    mov         edx,eax
 00573EC6    mov         eax,esi
 00573EC8    call        00574124
 00573ECD    mov         eax,dword ptr [esi+0AC]
 00573ED3    push        eax
 00573ED4    mov         ecx,dword ptr [esi+0B4]
 00573EDA    mov         edx,dword ptr [esi+0B0]
 00573EE0    mov         eax,dword ptr [ebp-4]
 00573EE3    mov         ebx,dword ptr [eax]
 00573EE5    call        dword ptr [ebx+44];TCanvas.Draw
 00573EE8    xor         eax,eax
 00573EEA    pop         edx
 00573EEB    pop         ecx
 00573EEC    pop         ecx
 00573EED    mov         dword ptr fs:[eax],edx
 00573EF0    push        573F0F
 00573EF5    xor         edx,edx
 00573EF7    mov         eax,dword ptr [ebp-4]
 00573EFA    call        TCanvas.SetHandle
 00573EFF    mov         eax,dword ptr [ebp-4]
 00573F02    call        TObject.Free
 00573F07    ret
>00573F08    jmp         @HandleFinally
>00573F0D    jmp         00573EF5
 00573F0F    pop         esi
 00573F10    pop         ebx
 00573F11    pop         ecx
 00573F12    pop         ebp
 00573F13    ret
end;*}

//00573F14
{*procedure sub_00573F14(?:?; ?:TCanvas);
begin
 00573F14    push        ebx
 00573F15    push        esi
 00573F16    push        edi
 00573F17    add         esp,0FFFFFFD4
 00573F1A    mov         edi,edx
 00573F1C    mov         ebx,eax
 00573F1E    mov         eax,ebx
 00573F20    call        005744DC
 00573F25    test        al,al
>00573F27    je          00573FEA
 00573F2D    test        byte ptr [ebx+1C],8
>00573F31    jne         00573FEA
 00573F37    lea         eax,[esp+1C]
 00573F3B    push        eax
 00573F3C    mov         eax,ebx
 00573F3E    call        00574514
 00573F43    push        eax
 00573F44    call        user32.GetWindowRect
 00573F49    mov         ecx,dword ptr [esp+20]
 00573F4D    neg         ecx
 00573F4F    mov         edx,dword ptr [esp+1C]
 00573F53    neg         edx
 00573F55    lea         eax,[esp+1C]
 00573F59    call        OffsetRect
 00573F5E    mov         eax,dword ptr [ebx+0C0]
 00573F64    add         eax,4
 00573F67    mov         dword ptr [esp+28],eax
 00573F6B    mov         ecx,dword ptr [ebx+0B4]
 00573F71    neg         ecx
 00573F73    mov         edx,dword ptr [ebx+0B0]
 00573F79    neg         edx
 00573F7B    lea         eax,[esp+1C]
 00573F7F    call        OffsetRect
 00573F84    lea         esi,[ebx+0B0]
 00573F8A    mov         eax,dword ptr [esi+0C]
 00573F8D    sub         eax,dword ptr [esi+4]
 00573F90    push        eax
 00573F91    lea         eax,[esp+10]
 00573F95    push        eax
 00573F96    mov         ecx,dword ptr [esi+8]
 00573F99    sub         ecx,dword ptr [esi]
 00573F9B    xor         edx,edx
 00573F9D    xor         eax,eax
 00573F9F    call        Rect
 00573FA4    call        0056FF78
 00573FA9    movzx       edx,byte ptr [ebx+0ED]
 00573FB0    movzx       ecx,byte ptr [ebx+0D5]
 00573FB7    lea         ecx,[ecx*2+789955]
 00573FBE    movzx       edx,byte ptr [ecx+edx]
 00573FC2    mov         ecx,esp
 00573FC4    call        TThemeServices.GetElementDetails
 00573FC9    lea         eax,[esp+1C]
 00573FCD    push        eax
 00573FCE    lea         eax,[esp+10]
 00573FD2    push        eax
 00573FD3    mov         eax,edi
 00573FD5    call        TCanvas.GetHandle
 00573FDA    push        eax
 00573FDB    call        0056FF78
 00573FE0    lea         ecx,[esp+0C]
 00573FE4    pop         edx
 00573FE5    call        TThemeServices.DrawElement
 00573FEA    add         esp,2C
 00573FED    pop         edi
 00573FEE    pop         esi
 00573FEF    pop         ebx
 00573FF0    ret
end;*}

//00573FF4
{*procedure sub_00573FF4(?:?; ?:TCanvas; ?:?);
begin
 00573FF4    push        ebx
 00573FF5    push        esi
 00573FF6    push        edi
 00573FF7    add         esp,0FFFFFFF0
 00573FFA    mov         esi,ecx
 00573FFC    lea         edi,[esp]
 00573FFF    movs        dword ptr [edi],dword ptr [esi]
 00574000    movs        dword ptr [edi],dword ptr [esi]
 00574001    movs        dword ptr [edi],dword ptr [esi]
 00574002    movs        dword ptr [edi],dword ptr [esi]
 00574003    mov         esi,edx
 00574005    mov         ebx,eax
 00574007    test        byte ptr [ebx+1C],8
>0057400B    jne         00574034
 0057400D    mov         eax,ebx
 0057400F    call        005744B4
 00574014    test        al,al
>00574016    je          00574034
 00574018    mov         eax,dword ptr [esp+4]
 0057401C    push        eax
 0057401D    mov         eax,dword ptr [ebx+5C]
 00574020    push        eax
 00574021    movzx       eax,byte ptr [ebx+51]
 00574025    push        eax
 00574026    mov         ecx,dword ptr [esp+0C]
 0057402A    mov         edx,esi
 0057402C    mov         eax,dword ptr [ebx+60]
 0057402F    call        TCustomImageList.Draw
 00574034    add         esp,10
 00574037    pop         edi
 00574038    pop         esi
 00574039    pop         ebx
 0057403A    ret
end;*}

//0057403C
{*procedure sub_0057403C(?:?; ?:TCanvas; ?:?);
begin
 0057403C    push        ebx
 0057403D    push        esi
 0057403E    push        edi
 0057403F    push        ebp
 00574040    add         esp,0FFFFFFF0
 00574043    mov         esi,ecx
 00574045    lea         edi,[esp]
 00574048    movs        dword ptr [edi],dword ptr [esi]
 00574049    movs        dword ptr [edi],dword ptr [esi]
 0057404A    movs        dword ptr [edi],dword ptr [esi]
 0057404B    movs        dword ptr [edi],dword ptr [esi]
 0057404C    mov         esi,edx
 0057404E    mov         ebx,eax
 00574050    movzx       eax,byte ptr [ebx+38]
 00574054    movzx       edi,word ptr [eax*2+789940]
 0057405C    or          di,4
 00574060    movzx       edi,di
 00574063    mov         dl,1
 00574065    mov         eax,dword ptr [esi+48]
 00574068    call        TBrush.SetStyle
 0057406D    cmp         byte ptr [ebx+51],0
>00574071    jne         005740EF
 00574073    mov         eax,esp
 00574075    mov         ecx,1
 0057407A    mov         edx,1
 0057407F    call        OffsetRect
 00574084    mov         ebp,dword ptr [esi+40]
 00574087    mov         edx,dword ptr [ebx+54]
 0057408A    mov         eax,esi
 0057408C    call        TCanvas.SetFont
 00574091    mov         edx,0FF000014
 00574096    mov         eax,dword ptr [esi+40]
 00574099    call        TFont.SetColor
 0057409E    push        esp
 0057409F    push        edi
 005740A0    mov         eax,dword ptr [ebx+4C]
 005740A3    call        @UStrLen
 005740A8    mov         ecx,eax
 005740AA    mov         edx,dword ptr [ebx+4C]
 005740AD    mov         eax,esi
 005740AF    call        00540308
 005740B4    mov         eax,esp
 005740B6    or          ecx,0FFFFFFFF
 005740B9    or          edx,0FFFFFFFF
 005740BC    call        OffsetRect
 005740C1    mov         edx,0FF000010
 005740C6    mov         eax,dword ptr [esi+40]
 005740C9    call        TFont.SetColor
 005740CE    push        esp
 005740CF    push        edi
 005740D0    mov         eax,dword ptr [ebx+4C]
 005740D3    call        @UStrLen
 005740D8    mov         ecx,eax
 005740DA    mov         edx,dword ptr [ebx+4C]
 005740DD    mov         eax,esi
 005740DF    call        00540308
 005740E4    mov         edx,ebp
 005740E6    mov         eax,esi
 005740E8    call        TCanvas.SetFont
>005740ED    jmp         0057411B
 005740EF    mov         ebp,dword ptr [esi+40]
 005740F2    mov         edx,dword ptr [ebx+54]
 005740F5    mov         eax,esi
 005740F7    call        TCanvas.SetFont
 005740FC    push        esp
 005740FD    push        edi
 005740FE    mov         eax,dword ptr [ebx+4C]
 00574101    call        @UStrLen
 00574106    mov         ecx,eax
 00574108    mov         edx,dword ptr [ebx+4C]
 0057410B    mov         eax,esi
 0057410D    call        00540308
 00574112    mov         edx,ebp
 00574114    mov         eax,esi
 00574116    call        TCanvas.SetFont
 0057411B    add         esp,10
 0057411E    pop         ebp
 0057411F    pop         edi
 00574120    pop         esi
 00574121    pop         ebx
 00574122    ret
end;*}

//00574124
{*procedure sub_00574124(?:?; ?:TCanvas);
begin
 00574124    push        ebx
 00574125    push        esi
 00574126    push        edi
 00574127    push        ebp
 00574128    add         esp,0FFFFFFC0
 0057412B    mov         esi,edx
 0057412D    mov         ebx,eax
 0057412F    test        byte ptr [ebx+1C],8
>00574133    jne         005742B1
 00574139    lea         edi,[ebx+0B0]
 0057413F    mov         eax,dword ptr [edi+0C]
 00574142    sub         eax,dword ptr [edi+4]
 00574145    push        eax
 00574146    lea         eax,[esp+4]
 0057414A    push        eax
 0057414B    mov         ecx,dword ptr [edi+8]
 0057414E    sub         ecx,dword ptr [edi]
 00574150    xor         edx,edx
 00574152    xor         eax,eax
 00574154    call        Rect
 00574159    xor         edi,edi
 0057415B    mov         eax,ebx
 0057415D    call        005744DC
 00574162    test        al,al
>00574164    je          005741CE
 00574166    cmp         byte ptr [ebx+51],0
>0057416A    jne         00574173
 0057416C    mov         ebp,4
>00574171    jmp         00574195
 00574173    cmp         byte ptr [ebx+50],0
>00574177    je          00574180
 00574179    mov         ebp,3
>0057417E    jmp         00574195
 00574180    cmp         byte ptr [ebx+0DD],0
>00574187    je          00574190
 00574189    mov         ebp,2
>0057418E    jmp         00574195
 00574190    mov         ebp,1
 00574195    cmp         byte ptr [ebx+0ED],0
>0057419C    jne         005741A1
 0057419E    add         ebp,4
 005741A1    cmp         byte ptr [ebx+0EE],0
>005741A8    jne         005741BD
 005741AA    push        esp
 005741AB    call        005726D0
 005741B0    mov         ecx,ebp
 005741B2    mov         edx,esi
 005741B4    call        TGlobalXPData.Draw
 005741B9    test        al,al
>005741BB    jne         005741EE
 005741BD    push        esp
 005741BE    call        005726D0
 005741C3    mov         ecx,ebp
 005741C5    mov         edx,esi
 005741C7    call        TGlobalXPData.DrawSimple
>005741CC    jmp         005741EE
 005741CE    push        0
 005741D0    push        0
 005741D2    movzx       eax,byte ptr [ebx+50]
 005741D6    push        eax
 005741D7    push        0
 005741D9    lea         eax,[esp+40]
 005741DD    push        eax
 005741DE    lea         edx,[esp+14]
 005741E2    mov         ecx,1
 005741E7    mov         eax,esi
 005741E9    call        DrawButtonFace
 005741EE    mov         eax,ebx
 005741F0    call        005744DC
 005741F5    test        al,al
>005741F7    je          0057422E
 005741F9    mov         eax,dword ptr [esp+0C]
 005741FD    sub         eax,2
 00574200    push        eax
 00574201    mov         eax,dword ptr [esp+0C]
 00574205    sub         eax,2
 00574208    push        eax
 00574209    mov         eax,dword ptr [esp+0C]
 0057420D    add         eax,2
 00574210    push        eax
 00574211    mov         eax,dword ptr [esp+0C]
 00574215    add         eax,2
 00574218    push        eax
 00574219    call        gdi32.CreateRectRgn
 0057421E    mov         edi,eax
 00574220    push        edi
 00574221    mov         eax,esi
 00574223    call        TCanvas.GetHandle
 00574228    push        eax
 00574229    call        gdi32.SelectClipRgn
 0057422E    cmp         byte ptr [ebx+50],0
>00574232    je          00574260
 00574234    mov         eax,ebx
 00574236    call        005744DC
 0057423B    test        al,al
>0057423D    je          0057424F
 0057423F    mov         eax,esp
 00574241    xor         ecx,ecx
 00574243    mov         edx,1
 00574248    call        OffsetRect
>0057424D    jmp         00574260
 0057424F    mov         eax,esp
 00574251    mov         ecx,1
 00574256    mov         edx,1
 0057425B    call        OffsetRect
 00574260    lea         eax,[esp+10]
 00574264    push        eax
 00574265    lea         eax,[esp+24]
 00574269    push        eax
 0057426A    lea         ecx,[esp+8]
 0057426E    mov         edx,esi
 00574270    mov         eax,ebx
 00574272    call        005739E8
 00574277    lea         ecx,[esp+10]
 0057427B    mov         edx,esi
 0057427D    mov         eax,ebx
 0057427F    call        0057403C
 00574284    lea         ecx,[esp+20]
 00574288    mov         edx,esi
 0057428A    mov         eax,ebx
 0057428C    call        00573FF4
 00574291    mov         eax,ebx
 00574293    call        005744DC
 00574298    test        al,al
>0057429A    je          005742B1
 0057429C    push        0
 0057429E    mov         eax,esi
 005742A0    call        TCanvas.GetHandle
 005742A5    push        eax
 005742A6    call        gdi32.SelectClipRgn
 005742AB    push        edi
 005742AC    call        gdi32.DeleteObject
 005742B1    add         esp,40
 005742B4    pop         ebp
 005742B5    pop         edi
 005742B6    pop         esi
 005742B7    pop         ebx
 005742B8    ret
end;*}

//005742BC
{*procedure sub_005742BC(?:?; ?:TCanvas);
begin
 005742BC    push        ebx
 005742BD    push        esi
 005742BE    push        edi
 005742BF    push        ebp
 005742C0    add         esp,0FFFFFFD4
 005742C3    mov         edi,edx
 005742C5    mov         ebp,eax
 005742C7    test        byte ptr [ebp+1C],8
>005742CB    jne         005744A9
 005742D1    lea         esi,[ebp+0B0]
 005742D7    mov         eax,dword ptr [esi+0C]
 005742DA    sub         eax,dword ptr [esi+4]
 005742DD    push        eax
 005742DE    lea         eax,[esp+4]
 005742E2    push        eax
 005742E3    mov         ecx,dword ptr [esi+8]
 005742E6    sub         ecx,dword ptr [esi]
 005742E8    xor         edx,edx
 005742EA    xor         eax,eax
 005742EC    call        Rect
 005742F1    mov         eax,ebp
 005742F3    call        005744DC
 005742F8    test        al,al
>005742FA    je          00574381
 00574300    movzx       eax,byte ptr [ebp+74]
 00574304    movzx       ebx,byte ptr [eax+789959]
 0057430B    cmp         byte ptr [ebp+0D5],0
>00574312    je          0057431C
 00574314    cmp         byte ptr [ebp+74],1
>00574318    jne         0057431C
 0057431A    mov         bl,38
 0057431C    cmp         byte ptr [ebp+51],0
>00574320    jne         00574327
 00574322    add         bl,3
>00574325    jmp         0057433C
 00574327    cmp         byte ptr [ebp+50],0
>0057432B    je          00574332
 0057432D    add         bl,2
>00574330    jmp         0057433C
 00574332    cmp         byte ptr [ebp+0DD],0
>00574339    je          0057433C
 0057433B    inc         ebx
 0057433C    call        0056FF78
 00574341    lea         ecx,[esp+10]
 00574345    mov         edx,ebx
 00574347    call        TThemeServices.GetElementDetails
 0057434C    cmp         byte ptr [ebp+0ED],0
>00574353    jne         00574364
 00574355    cmp         dword ptr [esp+18],1
>0057435A    jne         00574364
 0057435C    mov         dword ptr [esp+18],5
 00574364    push        esp
 00574365    mov         eax,edi
 00574367    call        TCanvas.GetHandle
 0057436C    push        eax
 0057436D    call        0056FF78
 00574372    lea         ecx,[esp+18]
 00574376    pop         edx
 00574377    call        TThemeServices.DrawElement
>0057437C    jmp         005744A9
 00574381    cmp         byte ptr [ebp+74],6
>00574385    jne         0057446D
 0057438B    push        0
 0057438D    push        0
 0057438F    movzx       eax,byte ptr [ebp+50]
 00574393    push        eax
 00574394    push        0
 00574396    lea         eax,[esp+2C]
 0057439A    push        eax
 0057439B    lea         edx,[esp+14]
 0057439F    mov         ecx,1
 005743A4    mov         eax,edi
 005743A6    call        DrawButtonFace
 005743AB    cmp         byte ptr [ebp+51],0
>005743AF    je          005743F5
 005743B1    mov         eax,dword ptr [edi+48];TCanvas.FBrush:TBrush
 005743B4    mov         edx,0FF000008
 005743B9    call        TBrush.SetColor
 005743BE    mov         esi,dword ptr [esp+0C]
 005743C2    mov         eax,esi
 005743C4    sub         eax,3
 005743C7    push        eax
 005743C8    lea         eax,[esp+20]
 005743CC    push        eax
 005743CD    mov         ebx,dword ptr [esp+10]
 005743D1    mov         ecx,ebx
 005743D3    sub         ecx,4
 005743D6    mov         edx,esi
 005743D8    sub         edx,5
 005743DB    mov         eax,ebx
 005743DD    sub         eax,7
 005743E0    call        Rect
 005743E5    lea         edx,[esp+1C]
 005743E9    mov         eax,edi
 005743EB    mov         ecx,dword ptr [eax]
 005743ED    call        dword ptr [ecx+54];TCanvas.FillRect
>005743F0    jmp         005744A9
 005743F5    mov         eax,dword ptr [edi+48];TCanvas.FBrush:TBrush
 005743F8    mov         edx,0FF000014
 005743FD    call        TBrush.SetColor
 00574402    mov         esi,dword ptr [esp+0C]
 00574406    mov         eax,esi
 00574408    sub         eax,2
 0057440B    push        eax
 0057440C    lea         eax,[esp+20]
 00574410    push        eax
 00574411    mov         ebx,dword ptr [esp+10]
 00574415    mov         ecx,ebx
 00574417    sub         ecx,3
 0057441A    mov         edx,esi
 0057441C    sub         edx,4
 0057441F    mov         eax,ebx
 00574421    sub         eax,6
 00574424    call        Rect
 00574429    lea         edx,[esp+1C]
 0057442D    mov         eax,edi
 0057442F    mov         ecx,dword ptr [eax]
 00574431    call        dword ptr [ecx+54];TCanvas.FillRect
 00574434    mov         eax,dword ptr [edi+48];TCanvas.FBrush:TBrush
 00574437    mov         edx,0FF000010
 0057443C    call        TBrush.SetColor
 00574441    mov         eax,esi
 00574443    sub         eax,3
 00574446    push        eax
 00574447    lea         eax,[esp+20]
 0057444B    push        eax
 0057444C    mov         ecx,ebx
 0057444E    sub         ecx,4
 00574451    mov         edx,esi
 00574453    sub         edx,5
 00574456    mov         eax,ebx
 00574458    sub         eax,7
 0057445B    call        Rect
 00574460    lea         edx,[esp+1C]
 00574464    mov         eax,edi
 00574466    mov         ecx,dword ptr [eax]
 00574468    call        dword ptr [ecx+54];TCanvas.FillRect
>0057446B    jmp         005744A9
 0057446D    movzx       eax,byte ptr [ebp+74]
 00574471    movzx       eax,word ptr [eax*2+789960]
 00574479    movzx       edx,byte ptr [ebp+50]
 0057447D    or          ax,word ptr [edx*2+78996E]
 00574485    movzx       edx,byte ptr [ebp+51]
 00574489    or          ax,word ptr [edx*2+789972]
 00574491    movzx       eax,ax
 00574494    push        eax
 00574495    push        1
 00574497    lea         eax,[esp+8]
 0057449B    push        eax
 0057449C    mov         eax,edi
 0057449E    call        TCanvas.GetHandle
 005744A3    push        eax
 005744A4    call        user32.DrawFrameControl
 005744A9    add         esp,2C
 005744AC    pop         ebp
 005744AD    pop         edi
 005744AE    pop         esi
 005744AF    pop         ebx
 005744B0    ret
end;*}

//005744B4
{*function sub_005744B4(?:?):?;
begin
 005744B4    push        ebx
 005744B5    push        esi
 005744B6    mov         ebx,eax
 005744B8    mov         esi,dword ptr [ebx+60]
 005744BB    test        esi,esi
>005744BD    je          005744D1
 005744BF    cmp         dword ptr [ebx+5C],0FFFFFFFF
>005744C3    jle         005744D1
 005744C5    mov         eax,esi
 005744C7    call        TCustomImageList.GetCount
 005744CC    cmp         eax,dword ptr [ebx+5C]
>005744CF    jg          005744D6
 005744D1    xor         eax,eax
 005744D3    pop         esi
 005744D4    pop         ebx
 005744D5    ret
 005744D6    mov         al,1
 005744D8    pop         esi
 005744D9    pop         ebx
 005744DA    ret
end;*}

//005744DC
{*function sub_005744DC:?;
begin
 005744DC    call        005726D0
 005744E1    movzx       eax,byte ptr [eax+10]
 005744E5    ret
end;*}

//005744E8
{*function sub_005744E8(?:?):?;
begin
 005744E8    push        ebx
 005744E9    push        esi
 005744EA    mov         ebx,eax
 005744EC    mov         esi,dword ptr [ebx+4]
 005744EF    mov         eax,esi
 005744F1    mov         edx,dword ptr ds:[47A16C];TControl
 005744F7    call        @IsClass
 005744FC    test        al,al
>005744FE    je          0057450C
 00574500    mov         dl,1
 00574502    mov         eax,esi
 00574504    call        GetParentForm
 00574509    pop         esi
 0057450A    pop         ebx
 0057450B    ret
 0057450C    xor         eax,eax
 0057450E    pop         esi
 0057450F    pop         ebx
 00574510    ret
end;*}

//00574514
{*function sub_00574514:?;
begin
 00574514    push        ebx
 00574515    call        005744E8
 0057451A    mov         ebx,eax
 0057451C    test        ebx,ebx
>0057451E    je          00574534
 00574520    mov         eax,ebx
 00574522    call        TWinControl.HandleAllocated
 00574527    test        al,al
>00574529    je          00574534
 0057452B    mov         eax,ebx
 0057452D    call        TWinControl.GetHandle
 00574532    pop         ebx
 00574533    ret
 00574534    xor         eax,eax
 00574536    pop         ebx
 00574537    ret
end;*}

//00574538
{*procedure sub_00574538(?:?; ?:?);
begin
 00574538    push        ebp
 00574539    mov         ebp,esp
 0057453B    add         esp,0FFFFFFF8
 0057453E    push        ebx
 0057453F    push        esi
 00574540    mov         ebx,edx
 00574542    mov         esi,eax
 00574544    test        byte ptr [esi+1C],1
>00574548    jne         005745F7
 0057454E    mov         eax,esi
 00574550    call        00574514
 00574555    mov         dword ptr [ebp-4],eax
 00574558    cmp         dword ptr [ebp-4],0
>0057455C    je          005745F7
 00574562    sub         bl,1
>00574565    jb          00574572
>00574567    je          005745B8
 00574569    dec         bl
>0057456B    je          005745DB
>0057456D    jmp         005745F7
 00574572    mov         eax,dword ptr [ebp-4]
 00574575    push        eax
 00574576    call        user32.GetWindowDC
 0057457B    mov         dword ptr [ebp-8],eax
 0057457E    xor         eax,eax
 00574580    push        ebp
 00574581    push        5745B1
 00574586    push        dword ptr fs:[eax]
 00574589    mov         dword ptr fs:[eax],esp
 0057458C    mov         edx,dword ptr [ebp-8]
 0057458F    mov         eax,esi
 00574591    call        00573E00
 00574596    xor         eax,eax
 00574598    pop         edx
 00574599    pop         ecx
 0057459A    pop         ecx
 0057459B    mov         dword ptr fs:[eax],edx
 0057459E    push        5745F7
 005745A3    mov         eax,dword ptr [ebp-8]
 005745A6    push        eax
 005745A7    mov         eax,dword ptr [ebp-4]
 005745AA    push        eax
 005745AB    call        user32.ReleaseDC
 005745B0    ret
>005745B1    jmp         @HandleFinally
>005745B6    jmp         005745A3
 005745B8    mov         edx,dword ptr [ebp-4]
 005745BB    mov         eax,esi
 005745BD    call        00574668
 005745C2    push        405
 005745C7    push        0
 005745C9    lea         eax,[esi+0B0]
 005745CF    push        eax
 005745D0    mov         eax,dword ptr [ebp-4]
 005745D3    push        eax
 005745D4    call        user32.RedrawWindow
>005745D9    jmp         005745F7
 005745DB    mov         edx,dword ptr [ebp-4]
 005745DE    mov         eax,esi
 005745E0    call        00574668
 005745E5    push        411
 005745EA    push        0
 005745EC    push        0
 005745EE    mov         eax,dword ptr [ebp-4]
 005745F1    push        eax
 005745F2    call        user32.RedrawWindow
 005745F7    pop         esi
 005745F8    pop         ebx
 005745F9    pop         ecx
 005745FA    pop         ecx
 005745FB    pop         ebp
 005745FC    ret
end;*}

//00574600
{*procedure sub_00574600(?:?; ?:?);
begin
 00574600    push        ebp
 00574601    mov         ebp,esp
 00574603    push        ecx
 00574604    push        ebx
 00574605    mov         dword ptr [ebp-4],edx
 00574608    mov         ebx,eax
 0057460A    mov         eax,dword ptr [ebp-4]
 0057460D    call        @UStrAddRef
 00574612    xor         eax,eax
 00574614    push        ebp
 00574615    push        57465D
 0057461A    push        dword ptr fs:[eax]
 0057461D    mov         dword ptr fs:[eax],esp
 00574620    mov         eax,dword ptr [ebx+4C]
 00574623    mov         edx,dword ptr [ebp-4]
 00574626    call        @UStrEqual
>0057462B    je          00574647
 0057462D    lea         eax,[ebx+4C]
 00574630    mov         edx,dword ptr [ebp-4]
 00574633    call        @UStrAsg
 00574638    cmp         byte ptr [ebx+74],0
>0057463C    jne         00574647
 0057463E    mov         dl,1
 00574640    mov         eax,ebx
 00574642    call        00574538
 00574647    xor         eax,eax
 00574649    pop         edx
 0057464A    pop         ecx
 0057464B    pop         ecx
 0057464C    mov         dword ptr fs:[eax],edx
 0057464F    push        574664
 00574654    lea         eax,[ebp-4]
 00574657    call        @UStrClr
 0057465C    ret
>0057465D    jmp         @HandleFinally
>00574662    jmp         00574654
 00574664    pop         ebx
 00574665    pop         ecx
 00574666    pop         ebp
 00574667    ret
end;*}

//00574668
{*procedure sub_00574668(?:?; ?:?);
begin
 00574668    push        ebx
 00574669    push        esi
 0057466A    push        edi
 0057466B    add         esp,0FFFFFFE0
 0057466E    mov         esi,edx
 00574670    mov         ebx,eax
 00574672    test        esi,esi
>00574674    je          0057475C
 0057467A    cmp         byte ptr [ebx+0DE],0
>00574681    je          0057468C
 00574683    mov         edx,esi
 00574685    mov         eax,ebx
 00574687    call        00573B5C
 0057468C    push        esp
 0057468D    push        esi
 0057468E    call        user32.GetWindowRect
 00574693    mov         eax,dword ptr [ebx+48]
 00574696    test        eax,eax
>00574698    je          0057469E
 0057469A    mov         esi,eax
>0057469C    jmp         005746A4
 0057469E    mov         esi,dword ptr [ebx+0A0]
 005746A4    mov         eax,dword ptr [ebx+3C]
 005746A7    test        eax,eax
>005746A9    je          005746AF
 005746AB    mov         edi,eax
>005746AD    jmp         005746B5
 005746AF    mov         edi,dword ptr [ebx+0A4]
 005746B5    push        edi
 005746B6    lea         eax,[esp+14]
 005746BA    push        eax
 005746BB    mov         edx,dword ptr [ebx+9C]
 005746C1    add         edx,dword ptr [ebx+44]
 005746C4    mov         eax,dword ptr [esp+10]
 005746C8    sub         eax,dword ptr [esp+8]
 005746CC    sub         eax,dword ptr [ebx+98]
 005746D2    add         eax,dword ptr [ebx+40]
 005746D5    add         eax,dword ptr [ebx+0A0]
 005746DB    sub         eax,esi
 005746DD    mov         ecx,esi
 005746DF    call        Bounds
 005746E4    lea         esi,[esp+10]
 005746E8    lea         edi,[ebx+0B0]
 005746EE    movs        dword ptr [edi],dword ptr [esi]
 005746EF    movs        dword ptr [edi],dword ptr [esi]
 005746F0    movs        dword ptr [edi],dword ptr [esi]
 005746F1    movs        dword ptr [edi],dword ptr [esi]
 005746F2    mov         edx,dword ptr [ebx+6C]
 005746F5    neg         edx
 005746F7    mov         eax,dword ptr [ebx+0A0]
 005746FD    add         eax,2
 00574700    imul        edx,eax
 00574703    lea         eax,[ebx+0B0]
 00574709    xor         ecx,ecx
 0057470B    call        OffsetRect
 00574710    cmp         byte ptr [ebx+74],6
>00574714    jne         00574728
 00574716    mov         eax,ebx
 00574718    call        005744DC
 0057471D    test        al,al
>0057471F    je          00574728
 00574721    add         dword ptr [ebx+0B4],2
 00574728    lea         esi,[ebx+0B0]
 0057472E    mov         eax,dword ptr [esi+0C]
 00574731    add         eax,2
 00574734    push        eax
 00574735    lea         eax,[esp+14]
 00574739    push        eax
 0057473A    mov         ecx,dword ptr [esi+8]
 0057473D    inc         ecx
 0057473E    mov         edx,dword ptr [esi+4]
 00574741    sub         edx,2
 00574744    mov         eax,dword ptr [esi]
 00574746    sub         eax,2
 00574749    call        Rect
 0057474E    lea         esi,[esp+10]
 00574752    lea         edi,[ebx+0C4]
 00574758    movs        dword ptr [edi],dword ptr [esi]
 00574759    movs        dword ptr [edi],dword ptr [esi]
 0057475A    movs        dword ptr [edi],dword ptr [esi]
 0057475B    movs        dword ptr [edi],dword ptr [esi]
 0057475C    add         esp,20
 0057475F    pop         edi
 00574760    pop         esi
 00574761    pop         ebx
 00574762    ret
end;*}

end.