//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit69;

interface

uses
  SysUtils, Classes;

type
  midihdr_tag = midihdr_tag = record//size=40
lpData:PAnsiChar;//f0
dwBufferLength:Cardinal;//f4
dwBytesRecorded:Cardinal;//f8
dwUser:Cardinal;//fC
dwFlags:Cardinal;//f10
lpNext:PMidiHdr;//f14
reserved:Cardinal;//f18
dwOffset:Cardinal;//f1C
dwReserved:?;//f20
end;;
    function midiInClose:UINT; stdcall;//0053F974
    function midiInGetDevCapsW(lpCaps:PMidiInCapsW; uSize:UINT):UINT; stdcall;//0053F97C
    function midiInGetNumDevs:UINT;//0053F984
    function midiInOpen(uDeviceID:UINT; dwCallback:DWORD; dwInstance:DWORD; dwFlags:DWORD):UINT; stdcall;//0053F98C
    function midiInReset:UINT; stdcall;//0053F994
    function midiInStart:UINT; stdcall;//0053F99C
    function midiInStop:UINT; stdcall;//0053F9A4
    function midiOutClose:UINT; stdcall;//0053F9AC
    function midiOutGetDevCapsW(lpCaps:PMidiOutCapsW; uSize:UINT):UINT; stdcall;//0053F9B4
    function midiOutGetNumDevs:UINT;//0053F9BC
    function midiOutLongMsg(lpMidiOutHdr:PMidiHdr; uSize:UINT):UINT; stdcall;//0053F9C4
    function midiOutOpen(uDeviceID:UINT; dwCallback:DWORD; dwInstance:DWORD; dwFlags:DWORD):UINT; stdcall;//0053F9CC
    function midiOutPrepareHeader(lpMidiOutHdr:PMidiHdr; uSize:UINT):UINT; stdcall;//0053F9D4
    function midiOutReset:UINT; stdcall;//0053F9DC
    function midiOutShortMsg(dwMsg:DWORD):UINT; stdcall;//0053F9E4
    function midiOutUnprepareHeader(lpMidiOutHdr:PMidiHdr; uSize:UINT):UINT; stdcall;//0053F9EC
    function PlaySoundW(hmod:HMODULE; fdwSound:DWORD):BOOL; stdcall;//0053F9F4
    //function sub_0053F9FC(?:TVarData):?;//0053F9FC
    //function sub_0053FC54:?;//0053FC54
    //procedure sub_0053FC5C(?:?; ?:?; ?:?);//0053FC5C
    //function sub_0053FCD4(?:?; ?:?; ?:?):?;//0053FCD4
    //function sub_0053FDFC(?:?; ?:?; ?:?):?;//0053FDFC
    //procedure sub_0053FE88(?:?; ?:?; ?:?; ?:?);//0053FE88
    //procedure sub_0053FF00(?:string; ?:?; ?:?);//0053FF00
    //procedure sub_0053FFD4(?:string; ?:?; ?:?);//0053FFD4
    //function sub_005400F8(?:UString):?;//005400F8
    //function sub_005401E0:?;//005401E0
    //function sub_00540280:?;//00540280
    //procedure sub_005402B0(?:?);//005402B0
    //procedure sub_005402D8(?:HWND; ?:?);//005402D8
    //procedure sub_00540308(?:?; ?:?; ?:Integer; ?:?; ?:?);//00540308
    //procedure sub_00540340(?:?; ?:?; ?:?; ?:?; ?:?; ?:?);//00540340

implementation

//0053F974
function winmm.midiInClose:UINT; stdcall;
begin
{*
 0053F974    jmp         dword ptr ds:[8268C8]
*}
end;

//0053F97C
function winmm.midiInGetDevCapsW(lpCaps:PMidiInCapsW; uSize:UINT):UINT; stdcall;
begin
{*
 0053F97C    jmp         dword ptr ds:[8268C4]
*}
end;

//0053F984
function winmm.midiInGetNumDevs:UINT;
begin
{*
 0053F984    jmp         dword ptr ds:[8268C0]
*}
end;

//0053F98C
function winmm.midiInOpen(uDeviceID:UINT; dwCallback:DWORD; dwInstance:DWORD; dwFlags:DWORD):UINT; stdcall;
begin
{*
 0053F98C    jmp         dword ptr ds:[8268BC]
*}
end;

//0053F994
function winmm.midiInReset:UINT; stdcall;
begin
{*
 0053F994    jmp         dword ptr ds:[8268B8]
*}
end;

//0053F99C
function winmm.midiInStart:UINT; stdcall;
begin
{*
 0053F99C    jmp         dword ptr ds:[8268B4]
*}
end;

//0053F9A4
function winmm.midiInStop:UINT; stdcall;
begin
{*
 0053F9A4    jmp         dword ptr ds:[8268B0]
*}
end;

//0053F9AC
function winmm.midiOutClose:UINT; stdcall;
begin
{*
 0053F9AC    jmp         dword ptr ds:[8268AC]
*}
end;

//0053F9B4
function winmm.midiOutGetDevCapsW(lpCaps:PMidiOutCapsW; uSize:UINT):UINT; stdcall;
begin
{*
 0053F9B4    jmp         dword ptr ds:[8268A8]
*}
end;

//0053F9BC
function winmm.midiOutGetNumDevs:UINT;
begin
{*
 0053F9BC    jmp         dword ptr ds:[8268A4]
*}
end;

//0053F9C4
function winmm.midiOutLongMsg(lpMidiOutHdr:PMidiHdr; uSize:UINT):UINT; stdcall;
begin
{*
 0053F9C4    jmp         dword ptr ds:[8268A0]
*}
end;

//0053F9CC
function winmm.midiOutOpen(uDeviceID:UINT; dwCallback:DWORD; dwInstance:DWORD; dwFlags:DWORD):UINT; stdcall;
begin
{*
 0053F9CC    jmp         dword ptr ds:[82689C]
*}
end;

//0053F9D4
function winmm.midiOutPrepareHeader(lpMidiOutHdr:PMidiHdr; uSize:UINT):UINT; stdcall;
begin
{*
 0053F9D4    jmp         dword ptr ds:[826898]
*}
end;

//0053F9DC
function winmm.midiOutReset:UINT; stdcall;
begin
{*
 0053F9DC    jmp         dword ptr ds:[826894]
*}
end;

//0053F9E4
function winmm.midiOutShortMsg(dwMsg:DWORD):UINT; stdcall;
begin
{*
 0053F9E4    jmp         dword ptr ds:[826890]
*}
end;

//0053F9EC
function winmm.midiOutUnprepareHeader(lpMidiOutHdr:PMidiHdr; uSize:UINT):UINT; stdcall;
begin
{*
 0053F9EC    jmp         dword ptr ds:[82688C]
*}
end;

//0053F9F4
function winmm.PlaySoundW(hmod:HMODULE; fdwSound:DWORD):BOOL; stdcall;
begin
{*
 0053F9F4    jmp         dword ptr ds:[826888]
*}
end;

//0053F9FC
{*function sub_0053F9FC(?:TVarData):?;
begin
 0053F9FC    push        ebp
 0053F9FD    mov         ebp,esp
 0053F9FF    add         esp,0FFFFFFF0
 0053FA02    push        ebx
 0053FA03    push        esi
 0053FA04    push        edi
 0053FA05    mov         esi,eax
 0053FA07    lea         edi,[ebp-10]
 0053FA0A    movs        dword ptr [edi],dword ptr [esi]
 0053FA0B    movs        dword ptr [edi],dword ptr [esi]
 0053FA0C    movs        dword ptr [edi],dword ptr [esi]
 0053FA0D    movs        dword ptr [edi],dword ptr [esi]
 0053FA0E    lea         eax,[ebp-10]
 0053FA11    call        @VarAddRef
 0053FA16    xor         eax,eax
 0053FA18    push        ebp
 0053FA19    push        53FA5A
 0053FA1E    push        dword ptr fs:[eax]
 0053FA21    mov         dword ptr fs:[eax],esp
 0053FA24    lea         eax,[ebp-10]
 0053FA27    call        004353E8
 0053FA2C    add         eax,0FFFFFFFE
 0053FA2F    sub         ax,2
>0053FA33    jb          0053FA42
 0053FA35    add         eax,0FFFFFFF4
 0053FA38    sub         ax,4
>0053FA3C    jb          0053FA42
 0053FA3E    xor         ebx,ebx
>0053FA40    jmp         0053FA44
 0053FA42    mov         bl,1
 0053FA44    xor         eax,eax
 0053FA46    pop         edx
 0053FA47    pop         ecx
 0053FA48    pop         ecx
 0053FA49    mov         dword ptr fs:[eax],edx
 0053FA4C    push        53FA61
 0053FA51    lea         eax,[ebp-10]
 0053FA54    call        @VarClr
 0053FA59    ret
>0053FA5A    jmp         @HandleFinally
>0053FA5F    jmp         0053FA51
 0053FA61    mov         eax,ebx
 0053FA63    pop         edi
 0053FA64    pop         esi
 0053FA65    pop         ebx
 0053FA66    mov         esp,ebp
 0053FA68    pop         ebp
 0053FA69    ret
end;*}

//0053FC54
{*function sub_0053FC54:?;
begin
 0053FC54    push        0
 0053FC56    call        gdi32.CreateCompatibleDC
 0053FC5B    ret
end;*}

//0053FC5C
{*procedure sub_0053FC5C(?:?; ?:?; ?:?);
begin
 0053FC5C    push        ebp
 0053FC5D    mov         ebp,esp
 0053FC5F    add         esp,0FFFFFFF4
 0053FC62    push        ebx
 0053FC63    push        esi
 0053FC64    push        edi
 0053FC65    xor         ebx,ebx
 0053FC67    mov         dword ptr [ebp-0C],ebx
 0053FC6A    mov         esi,ecx
 0053FC6C    mov         dword ptr [ebp-4],edx
 0053FC6F    xor         edx,edx
 0053FC71    push        ebp
 0053FC72    push        53FCC3
 0053FC77    push        dword ptr fs:[edx]
 0053FC7A    mov         dword ptr fs:[edx],esp
 0053FC7D    mov         dword ptr [ebp-8],eax
 0053FC80    mov         ebx,dword ptr [ebp-4]
 0053FC83    dec         ebx
 0053FC84    test        ebx,ebx
>0053FC86    jl          0053FCAD
 0053FC88    inc         ebx
 0053FC89    xor         edi,edi
 0053FC8B    mov         eax,dword ptr [ebp-8]
 0053FC8E    movzx       eax,byte ptr [eax+edi]
 0053FC92    lea         ecx,[ebp-0C]
 0053FC95    mov         edx,2
 0053FC9A    call        IntToHex
 0053FC9F    mov         edx,dword ptr [ebp-0C]
 0053FCA2    mov         eax,esi
 0053FCA4    call        @UStrCat
 0053FCA9    inc         edi
 0053FCAA    dec         ebx
>0053FCAB    jne         0053FC8B
 0053FCAD    xor         eax,eax
 0053FCAF    pop         edx
 0053FCB0    pop         ecx
 0053FCB1    pop         ecx
 0053FCB2    mov         dword ptr fs:[eax],edx
 0053FCB5    push        53FCCA
 0053FCBA    lea         eax,[ebp-0C]
 0053FCBD    call        @UStrClr
 0053FCC2    ret
>0053FCC3    jmp         @HandleFinally
>0053FCC8    jmp         0053FCBA
 0053FCCA    pop         edi
 0053FCCB    pop         esi
 0053FCCC    pop         ebx
 0053FCCD    mov         esp,ebp
 0053FCCF    pop         ebp
 0053FCD0    ret
end;*}

//0053FCD4
{*function sub_0053FCD4(?:?; ?:?; ?:?):?;
begin
 0053FCD4    push        ebp
 0053FCD5    mov         ebp,esp
 0053FCD7    add         esp,0FFFFFFE8
 0053FCDA    push        ebx
 0053FCDB    push        esi
 0053FCDC    push        edi
 0053FCDD    xor         ebx,ebx
 0053FCDF    mov         dword ptr [ebp-10],ebx
 0053FCE2    mov         dword ptr [ebp-14],ebx
 0053FCE5    mov         dword ptr [ebp-18],ebx
 0053FCE8    mov         dword ptr [ebp-8],ecx
 0053FCEB    mov         ebx,edx
 0053FCED    mov         dword ptr [ebp-4],eax
 0053FCF0    mov         eax,dword ptr [ebp-4]
 0053FCF3    call        @UStrAddRef
 0053FCF8    xor         eax,eax
 0053FCFA    push        ebp
 0053FCFB    push        53FDC9
 0053FD00    push        dword ptr fs:[eax]
 0053FD03    mov         dword ptr fs:[eax],esp
 0053FD06    mov         eax,dword ptr [ebp-4]
 0053FD09    call        @UStrLen
 0053FD0E    test        al,1
>0053FD10    je          0053FD22
 0053FD12    lea         eax,[ebp-4]
 0053FD15    mov         ecx,dword ptr [ebp-4]
 0053FD18    mov         edx,53FDE8;'0'
 0053FD1D    call        @UStrCat3
 0053FD22    mov         eax,dword ptr [ebp-4]
 0053FD25    call        @UStrLen
 0053FD2A    sar         eax,1
>0053FD2C    jns         0053FD31
 0053FD2E    adc         eax,0
 0053FD31    cmp         eax,dword ptr [ebp-8]
>0053FD34    jge         0053FD48
 0053FD36    mov         eax,dword ptr [ebp-4]
 0053FD39    call        @UStrLen
 0053FD3E    sar         eax,1
>0053FD40    jns         0053FD45
 0053FD42    adc         eax,0
 0053FD45    mov         dword ptr [ebp-8],eax
 0053FD48    mov         dword ptr [ebp-0C],ebx
 0053FD4B    mov         esi,dword ptr [ebp-8]
 0053FD4E    dec         esi
 0053FD4F    test        esi,esi
>0053FD51    jl          0053FDA3
 0053FD53    inc         esi
 0053FD54    xor         ebx,ebx
 0053FD56    push        53FDF8;'$'
 0053FD5B    lea         eax,[ebp-14]
 0053FD5E    mov         edi,ebx
 0053FD60    add         edi,edi
 0053FD62    mov         edx,dword ptr [ebp-4]
 0053FD65    movzx       edx,word ptr [edx+edi*2]
 0053FD69    call        @UStrFromWChar
 0053FD6E    push        dword ptr [ebp-14]
 0053FD71    lea         eax,[ebp-18]
 0053FD74    mov         edx,dword ptr [ebp-4]
 0053FD77    movzx       edx,word ptr [edx+edi*2+2]
 0053FD7C    call        @UStrFromWChar
 0053FD81    push        dword ptr [ebp-18]
 0053FD84    lea         eax,[ebp-10]
 0053FD87    mov         edx,3
 0053FD8C    call        @UStrCatN
 0053FD91    mov         eax,dword ptr [ebp-10]
 0053FD94    call        StrToInt
 0053FD99    mov         edx,dword ptr [ebp-0C]
 0053FD9C    mov         byte ptr [edx+ebx],al
 0053FD9F    inc         ebx
 0053FDA0    dec         esi
>0053FDA1    jne         0053FD56
 0053FDA3    mov         ebx,dword ptr [ebp-8]
 0053FDA6    xor         eax,eax
 0053FDA8    pop         edx
 0053FDA9    pop         ecx
 0053FDAA    pop         ecx
 0053FDAB    mov         dword ptr fs:[eax],edx
 0053FDAE    push        53FDD0
 0053FDB3    lea         eax,[ebp-18]
 0053FDB6    mov         edx,3
 0053FDBB    call        @UStrArrayClr
 0053FDC0    lea         eax,[ebp-4]
 0053FDC3    call        @UStrClr
 0053FDC8    ret
>0053FDC9    jmp         @HandleFinally
>0053FDCE    jmp         0053FDB3
 0053FDD0    mov         eax,ebx
 0053FDD2    pop         edi
 0053FDD3    pop         esi
 0053FDD4    pop         ebx
 0053FDD5    mov         esp,ebp
 0053FDD7    pop         ebp
 0053FDD8    ret
end;*}

//0053FDFC
{*function sub_0053FDFC(?:?; ?:?; ?:?):?;
begin
 0053FDFC    push        ebx
 0053FDFD    push        esi
 0053FDFE    push        edi
 0053FDFF    push        ebp
 0053FE00    add         esp,0FFFFFFF8
 0053FE03    mov         edi,ecx
 0053FE05    mov         esi,edx
 0053FE07    mov         dword ptr [esp],eax
 0053FE0A    xor         ebp,ebp
 0053FE0C    mov         ebx,1
 0053FE11    xor         eax,eax
 0053FE13    mov         dword ptr [esp+4],eax
>0053FE17    jmp         0053FE6C
>0053FE19    jmp         0053FE1C
 0053FE1B    inc         ebx
 0053FE1C    mov         eax,esi
 0053FE1E    call        @UStrLen
 0053FE23    cmp         ebx,eax
>0053FE25    jg          0053FE37
 0053FE27    mov         edx,edi
 0053FE29    movzx       eax,word ptr [esi+ebx*2-2]
 0053FE2E    call        CharInSet
 0053FE33    test        al,al
>0053FE35    jne         0053FE1B
 0053FE37    mov         eax,esi
 0053FE39    call        @UStrLen
 0053FE3E    cmp         ebx,eax
>0053FE40    jg          0053FE43
 0053FE42    inc         ebp
 0053FE43    cmp         ebp,dword ptr [esp]
>0053FE46    je          0053FE68
>0053FE48    jmp         0053FE4B
 0053FE4A    inc         ebx
 0053FE4B    mov         eax,esi
 0053FE4D    call        @UStrLen
 0053FE52    cmp         ebx,eax
>0053FE54    jg          0053FE6C
 0053FE56    mov         edx,edi
 0053FE58    movzx       eax,word ptr [esi+ebx*2-2]
 0053FE5D    call        CharInSet
 0053FE62    test        al,al
>0053FE64    je          0053FE4A
>0053FE66    jmp         0053FE6C
 0053FE68    mov         dword ptr [esp+4],ebx
 0053FE6C    mov         eax,esi
 0053FE6E    call        @UStrLen
 0053FE73    cmp         ebx,eax
>0053FE75    jg          0053FE7C
 0053FE77    cmp         ebp,dword ptr [esp]
>0053FE7A    jne         0053FE1C
 0053FE7C    mov         eax,dword ptr [esp+4]
 0053FE80    pop         ecx
 0053FE81    pop         edx
 0053FE82    pop         ebp
 0053FE83    pop         edi
 0053FE84    pop         esi
 0053FE85    pop         ebx
 0053FE86    ret
end;*}

//0053FE88
{*procedure sub_0053FE88(?:?; ?:?; ?:?; ?:?);
begin
 0053FE88    push        ebp
 0053FE89    mov         ebp,esp
 0053FE8B    add         esp,0FFFFFFF8
 0053FE8E    push        ebx
 0053FE8F    push        esi
 0053FE90    push        edi
 0053FE91    mov         dword ptr [ebp-8],ecx
 0053FE94    mov         edi,edx
 0053FE96    mov         dword ptr [ebp-4],eax
 0053FE99    xor         esi,esi
 0053FE9B    mov         ecx,dword ptr [ebp-8]
 0053FE9E    mov         edx,edi
 0053FEA0    mov         eax,dword ptr [ebp-4]
 0053FEA3    call        0053FDFC
 0053FEA8    mov         ebx,eax
 0053FEAA    test        ebx,ebx
>0053FEAC    je          0053FEEA
>0053FEAE    jmp         0053FECE
 0053FEB0    inc         esi
 0053FEB1    mov         eax,dword ptr [ebp+8]
 0053FEB4    mov         edx,esi
 0053FEB6    call        @UStrSetLength
 0053FEBB    mov         eax,dword ptr [ebp+8]
 0053FEBE    call        @UniqueStringU
 0053FEC3    movzx       edx,word ptr [edi+ebx*2-2]
 0053FEC8    mov         word ptr [eax+esi*2-2],dx
 0053FECD    inc         ebx
 0053FECE    mov         eax,edi
 0053FED0    call        @UStrLen
 0053FED5    cmp         ebx,eax
>0053FED7    jg          0053FEEA
 0053FED9    mov         edx,dword ptr [ebp-8]
 0053FEDC    movzx       eax,word ptr [edi+ebx*2-2]
 0053FEE1    call        CharInSet
 0053FEE6    test        al,al
>0053FEE8    je          0053FEB0
 0053FEEA    mov         eax,dword ptr [ebp+8]
 0053FEED    mov         edx,esi
 0053FEEF    call        @UStrSetLength
 0053FEF4    pop         edi
 0053FEF5    pop         esi
 0053FEF6    pop         ebx
 0053FEF7    pop         ecx
 0053FEF8    pop         ecx
 0053FEF9    pop         ebp
 0053FEFA    ret         4
end;*}

//0053FF00
{*procedure sub_0053FF00(?:string; ?:?; ?:?);
begin
 0053FF00    push        ebp
 0053FF01    mov         ebp,esp
 0053FF03    add         esp,0FFFFFFEC
 0053FF06    push        ebx
 0053FF07    push        esi
 0053FF08    push        edi
 0053FF09    xor         ebx,ebx
 0053FF0B    mov         dword ptr [ebp-10],ebx
 0053FF0E    mov         dword ptr [ebp-14],ebx
 0053FF11    mov         edi,ecx
 0053FF13    mov         dword ptr [ebp-8],edx
 0053FF16    mov         dword ptr [ebp-4],eax
 0053FF19    xor         eax,eax
 0053FF1B    push        ebp
 0053FF1C    push        53FFC4
 0053FF21    push        dword ptr fs:[eax]
 0053FF24    mov         dword ptr fs:[eax],esp
 0053FF27    mov         eax,edi
 0053FF29    call        @UStrClr
 0053FF2E    mov         eax,dword ptr [ebp-8]
 0053FF31    call        @UStrLen
 0053FF36    mov         esi,eax
 0053FF38    test        esi,esi
>0053FF3A    jle         0053FFA9
 0053FF3C    mov         ebx,1
 0053FF41    mov         eax,dword ptr [ebp-4]
 0053FF44    call        @UStrLen
 0053FF49    test        eax,eax
>0053FF4B    jle         0053FF74
 0053FF4D    mov         eax,dword ptr [ebp-4]
 0053FF50    call        @UStrLen
 0053FF55    push        eax
 0053FF56    mov         eax,ebx
 0053FF58    dec         eax
 0053FF59    pop         edx
 0053FF5A    mov         ecx,edx
 0053FF5C    cdq
 0053FF5D    idiv        eax,ecx
 0053FF5F    inc         edx
 0053FF60    mov         eax,dword ptr [ebp-4]
 0053FF63    movzx       eax,byte ptr [eax+edx*2-2]
 0053FF68    mov         edx,dword ptr [ebp-8]
 0053FF6B    xor         al,byte ptr [edx+ebx*2-2]
 0053FF6F    mov         byte ptr [ebp-9],al
>0053FF72    jmp         0053FF7F
 0053FF74    mov         eax,dword ptr [ebp-8]
 0053FF77    movzx       eax,byte ptr [eax+ebx*2-2]
 0053FF7C    mov         byte ptr [ebp-9],al
 0053FF7F    lea         ecx,[ebp-14]
 0053FF82    movzx       eax,byte ptr [ebp-9]
 0053FF86    mov         edx,2
 0053FF8B    call        IntToHex
 0053FF90    mov         eax,dword ptr [ebp-14]
 0053FF93    lea         edx,[ebp-10]
 0053FF96    call        AnsiLowerCase
 0053FF9B    mov         edx,dword ptr [ebp-10]
 0053FF9E    mov         eax,edi
 0053FFA0    call        @UStrCat
 0053FFA5    inc         ebx
 0053FFA6    dec         esi
>0053FFA7    jne         0053FF41
 0053FFA9    xor         eax,eax
 0053FFAB    pop         edx
 0053FFAC    pop         ecx
 0053FFAD    pop         ecx
 0053FFAE    mov         dword ptr fs:[eax],edx
 0053FFB1    push        53FFCB
 0053FFB6    lea         eax,[ebp-14]
 0053FFB9    mov         edx,2
 0053FFBE    call        @UStrArrayClr
 0053FFC3    ret
>0053FFC4    jmp         @HandleFinally
>0053FFC9    jmp         0053FFB6
 0053FFCB    pop         edi
 0053FFCC    pop         esi
 0053FFCD    pop         ebx
 0053FFCE    mov         esp,ebp
 0053FFD0    pop         ebp
 0053FFD1    ret
end;*}

//0053FFD4
{*procedure sub_0053FFD4(?:string; ?:?; ?:?);
begin
 0053FFD4    push        ebp
 0053FFD5    mov         ebp,esp
 0053FFD7    push        0
 0053FFD9    push        0
 0053FFDB    push        0
 0053FFDD    push        0
 0053FFDF    push        0
 0053FFE1    push        0
 0053FFE3    push        0
 0053FFE5    push        ebx
 0053FFE6    push        esi
 0053FFE7    push        edi
 0053FFE8    mov         dword ptr [ebp-0C],ecx
 0053FFEB    mov         dword ptr [ebp-8],edx
 0053FFEE    mov         dword ptr [ebp-4],eax
 0053FFF1    xor         eax,eax
 0053FFF3    push        ebp
 0053FFF4    push        5400D8
 0053FFF9    push        dword ptr fs:[eax]
 0053FFFC    mov         dword ptr fs:[eax],esp
 0053FFFF    mov         eax,dword ptr [ebp-0C]
 00540002    call        @UStrClr
 00540007    mov         eax,dword ptr [ebp-8]
 0054000A    call        @UStrLen
 0054000F    mov         edi,eax
 00540011    sar         edi,1
>00540013    jns         00540018
 00540015    adc         edi,0
 00540018    dec         edi
 00540019    test        edi,edi
>0054001B    jl          005400BD
 00540021    inc         edi
 00540022    xor         ebx,ebx
 00540024    push        5400F4;'$'
 00540029    lea         eax,[ebp-14]
 0054002C    mov         esi,ebx
 0054002E    add         esi,esi
 00540030    mov         edx,dword ptr [ebp-8]
 00540033    movzx       edx,word ptr [edx+esi*2]
 00540037    call        @UStrFromWChar
 0054003C    push        dword ptr [ebp-14]
 0054003F    lea         eax,[ebp-18]
 00540042    mov         edx,dword ptr [ebp-8]
 00540045    movzx       edx,word ptr [edx+esi*2+2]
 0054004A    call        @UStrFromWChar
 0054004F    push        dword ptr [ebp-18]
 00540052    lea         eax,[ebp-10]
 00540055    mov         edx,3
 0054005A    call        @UStrCatN
 0054005F    mov         eax,dword ptr [ebp-10]
 00540062    mov         edx,20
 00540067    call        StrToIntDef
 0054006C    mov         esi,eax
 0054006E    mov         eax,dword ptr [ebp-4]
 00540071    call        @UStrLen
 00540076    test        eax,eax
>00540078    jle         0054009D
 0054007A    mov         eax,dword ptr [ebp-4]
 0054007D    call        @UStrLen
 00540082    push        eax
 00540083    mov         eax,ebx
 00540085    pop         edx
 00540086    mov         ecx,edx
 00540088    cdq
 00540089    idiv        eax,ecx
 0054008B    inc         edx
 0054008C    mov         eax,dword ptr [ebp-4]
 0054008F    movzx       eax,byte ptr [eax+edx*2-2]
 00540094    mov         edx,esi
 00540096    xor         al,dl
 00540098    movzx       eax,al
 0054009B    mov         esi,eax
 0054009D    lea         eax,[ebp-1C]
 005400A0    mov         edx,esi
 005400A2    call        @UStrFromWChar
 005400A7    mov         edx,dword ptr [ebp-1C]
 005400AA    mov         eax,dword ptr [ebp-0C]
 005400AD    call        @UStrCat
 005400B2    mov         eax,dword ptr [ebp-0C]
 005400B5    inc         ebx
 005400B6    dec         edi
>005400B7    jne         00540024
 005400BD    xor         eax,eax
 005400BF    pop         edx
 005400C0    pop         ecx
 005400C1    pop         ecx
 005400C2    mov         dword ptr fs:[eax],edx
 005400C5    push        5400DF
 005400CA    lea         eax,[ebp-1C]
 005400CD    mov         edx,4
 005400D2    call        @UStrArrayClr
 005400D7    ret
>005400D8    jmp         @HandleFinally
>005400DD    jmp         005400CA
 005400DF    pop         edi
 005400E0    pop         esi
 005400E1    pop         ebx
 005400E2    mov         esp,ebp
 005400E4    pop         ebp
 005400E5    ret
end;*}

//005400F8
{*function sub_005400F8(?:UString):?;
begin
 005400F8    push        ebp
 005400F9    mov         ebp,esp
 005400FB    add         esp,0FFFFFFE8
 005400FE    push        ebx
 005400FF    xor         edx,edx
 00540101    mov         dword ptr [ebp-4],edx
 00540104    mov         ebx,eax
 00540106    xor         eax,eax
 00540108    push        ebp
 00540109    push        5401CC
 0054010E    push        dword ptr fs:[eax]
 00540111    mov         dword ptr fs:[eax],esp
 00540114    xor         eax,eax
 00540116    mov         dword ptr [ebp-8],eax
 00540119    lea         eax,[ebp-4]
 0054011C    mov         edx,ebx
 0054011E    call        @UStrLAsg
 00540123    lea         eax,[ebp-4]
 00540126    call        UniqueString
 0054012B    lea         eax,[ebp-0C]
 0054012E    push        eax
 0054012F    mov         eax,dword ptr [ebp-4]
 00540132    call        @UStrToPWChar
 00540137    push        eax
 00540138    call        version.GetFileVersionInfoSizeW
 0054013D    mov         ebx,eax
 0054013F    test        ebx,ebx
>00540141    je          005401B6
 00540143    mov         eax,ebx
 00540145    call        @GetMem
 0054014A    mov         dword ptr [ebp-10],eax
 0054014D    xor         eax,eax
 0054014F    push        ebp
 00540150    push        5401AF
 00540155    push        dword ptr fs:[eax]
 00540158    mov         dword ptr fs:[eax],esp
 0054015B    mov         eax,dword ptr [ebp-10]
 0054015E    push        eax
 0054015F    push        ebx
 00540160    mov         eax,dword ptr [ebp-0C]
 00540163    push        eax
 00540164    mov         eax,dword ptr [ebp-4]
 00540167    call        @UStrToPWChar
 0054016C    push        eax
 0054016D    call        version.GetFileVersionInfoW
 00540172    test        eax,eax
>00540174    je          00540199
 00540176    lea         eax,[ebp-18]
 00540179    push        eax
 0054017A    lea         eax,[ebp-14]
 0054017D    push        eax
 0054017E    push        5401DC;'\'
 00540183    mov         eax,dword ptr [ebp-10]
 00540186    push        eax
 00540187    call        version.VerQueryValueW
 0054018C    test        eax,eax
>0054018E    je          00540199
 00540190    mov         eax,dword ptr [ebp-14]
 00540193    mov         eax,dword ptr [eax+8]
 00540196    mov         dword ptr [ebp-8],eax
 00540199    xor         eax,eax
 0054019B    pop         edx
 0054019C    pop         ecx
 0054019D    pop         ecx
 0054019E    mov         dword ptr fs:[eax],edx
 005401A1    push        5401B6
 005401A6    mov         eax,dword ptr [ebp-10]
 005401A9    call        @FreeMem
 005401AE    ret
>005401AF    jmp         @HandleFinally
>005401B4    jmp         005401A6
 005401B6    xor         eax,eax
 005401B8    pop         edx
 005401B9    pop         ecx
 005401BA    pop         ecx
 005401BB    mov         dword ptr fs:[eax],edx
 005401BE    push        5401D3
 005401C3    lea         eax,[ebp-4]
 005401C6    call        @UStrClr
 005401CB    ret
>005401CC    jmp         @HandleFinally
>005401D1    jmp         005401C3
 005401D3    mov         eax,dword ptr [ebp-8]
 005401D6    pop         ebx
 005401D7    mov         esp,ebp
 005401D9    pop         ebp
 005401DA    ret
end;*}

//005401E0
{*function sub_005401E0:?;
begin
 005401E0    cmp         dword ptr ds:[8154DC],0;gvar_008154DC
>005401E7    jne         005401F8
 005401E9    mov         eax,54020C;'shell32.dll'
 005401EE    call        005400F8
 005401F3    mov         [008154DC],eax;gvar_008154DC
 005401F8    mov         eax,[008154DC];gvar_008154DC
 005401FD    ret
end;*}

//00540280
{*function sub_00540280:?;
begin
 00540280    push        ebx
 00540281    add         esp,0FFFFFFF8
 00540284    mov         ebx,8
 00540289    mov         dword ptr [esp],ebx
 0054028C    push        0
 0054028E    lea         eax,[esp+4]
 00540292    push        eax
 00540293    push        ebx
 00540294    push        48
 00540296    call        user32.SystemParametersInfoW
 0054029B    test        eax,eax
>0054029D    je          005402A9
 0054029F    cmp         dword ptr [esp+4],0
 005402A4    setne       al
>005402A7    jmp         005402AB
 005402A9    xor         eax,eax
 005402AB    pop         ecx
 005402AC    pop         edx
 005402AD    pop         ebx
 005402AE    ret
end;*}

//005402B0
{*procedure sub_005402B0(?:?);
begin
 005402B0    add         esp,0FFFFFFF8
 005402B3    mov         dword ptr [esp],8
 005402BA    and         eax,7F
 005402BD    mov         dword ptr [esp+4],eax
 005402C1    push        0
 005402C3    lea         eax,[esp+4]
 005402C7    push        eax
 005402C8    mov         eax,dword ptr [esp+8]
 005402CC    push        eax
 005402CD    push        49
 005402CF    call        user32.SystemParametersInfoW
 005402D4    pop         ecx
 005402D5    pop         edx
 005402D6    ret
end;*}

//005402D8
{*procedure sub_005402D8(?:HWND; ?:?);
begin
 005402D8    push        ebx
 005402D9    push        esi
 005402DA    push        edi
 005402DB    mov         edi,edx
 005402DD    mov         esi,eax
 005402DF    call        00540280
 005402E4    mov         ebx,eax
 005402E6    test        bl,bl
>005402E8    je          005402F1
 005402EA    xor         eax,eax
 005402EC    call        005402B0
 005402F1    push        edi
 005402F2    push        esi
 005402F3    call        user32.ShowWindow
 005402F8    test        bl,bl
>005402FA    je          00540303
 005402FC    mov         al,1
 005402FE    call        005402B0
 00540303    pop         edi
 00540304    pop         esi
 00540305    pop         ebx
 00540306    ret
end;*}

//00540308
{*procedure sub_00540308(?:?; ?:?; ?:Integer; ?:?; ?:?);
begin
 00540308    push        ebp
 00540309    mov         ebp,esp
 0054030B    push        ebx
 0054030C    push        esi
 0054030D    push        edi
 0054030E    mov         edi,ecx
 00540310    mov         esi,edx
 00540312    mov         ebx,eax
 00540314    mov         eax,dword ptr [ebp+8]
 00540317    and         eax,0FFFEFFFF
 0054031C    push        eax
 0054031D    mov         eax,dword ptr [ebp+0C]
 00540320    push        eax
 00540321    push        edi
 00540322    mov         eax,esi
 00540324    call        @UStrToPWChar
 00540329    push        eax
 0054032A    mov         eax,ebx
 0054032C    call        TCanvas.GetHandle
 00540331    push        eax
 00540332    call        user32.DrawTextW
 00540337    pop         edi
 00540338    pop         esi
 00540339    pop         ebx
 0054033A    pop         ebp
 0054033B    ret         8
end;*}

//00540340
{*procedure sub_00540340(?:?; ?:?; ?:?; ?:?; ?:?; ?:?);
begin
 00540340    push        ebp
 00540341    mov         ebp,esp
 00540343    push        ebx
 00540344    mov         ebx,dword ptr [ebp+8]
 00540347    push        ebx
 00540348    mov         ebx,dword ptr [ebp+0C]
 0054034B    push        ebx
 0054034C    mov         ebx,dword ptr [ebp+10]
 0054034F    push        ebx
 00540350    mov         ebx,dword ptr [ebp+14]
 00540353    push        ebx
 00540354    mov         ebx,dword ptr [ebp+18]
 00540357    push        ebx
 00540358    mov         ebx,dword ptr [ebp+1C]
 0054035B    push        ebx
 0054035C    push        ecx
 0054035D    push        edx
 0054035E    push        eax
 0054035F    call        gdi32.BitBlt
 00540364    pop         ebx
 00540365    pop         ebp
 00540366    ret         18
end;*}

Initialization
Finalization
//0054036C
{*
 0054036C    push        ebp
 0054036D    mov         ebp,esp
 0054036F    xor         eax,eax
 00540371    push        ebp
 00540372    push        540410
 00540377    push        dword ptr fs:[eax]
 0054037A    mov         dword ptr fs:[eax],esp
 0054037D    inc         dword ptr ds:[8154D8]
>00540383    jne         00540402
 00540385    mov         eax,788D00;^'àáâãäå¸æçèéêëìíîïğñ=óôõ÷öøùüûúıİÿ+--+-+¨ÆÇ++--İ-+ÏĞÑÒÓÔi×ÖØ+_İ+İŞî'
 0054038A    call        @LStrClr
 0054038F    mov         eax,788D04;^'--×Ç-+£Ö++--İ-+ÏĞÒÓÔiÆ+Ş+İİØ+î_+Ñáâ÷çäåİöúéêëìíîïğ=óôõæèİãûıøùÿüàñ'
 00540394    call        @LStrClr
 00540399    mov         eax,788D08;^'äåíü'
 0054039E    mov         ecx,3
 005403A3    mov         edx,dword ptr ds:[40128C];string
 005403A9    call        @FinalizeArray
 005403AE    mov         eax,788D14;^'ìåñÿö'
 005403B3    mov         ecx,3
 005403B8    mov         edx,dword ptr ds:[40128C];string
 005403BE    call        @FinalizeArray
 005403C3    mov         eax,788D20;^'ãîä'
 005403C8    mov         ecx,3
 005403CD    mov         edx,dword ptr ds:[40128C];string
 005403D3    call        @FinalizeArray
 005403D8    mov         eax,788D2C;^'íåäåëİ'
 005403DD    mov         ecx,4
 005403E2    mov         edx,dword ptr ds:[40128C];string
 005403E8    call        @FinalizeArray
 005403ED    mov         eax,788D3C;^'True'
 005403F2    mov         ecx,5
 005403F7    mov         edx,dword ptr ds:[40128C];string
 005403FD    call        @FinalizeArray
 00540402    xor         eax,eax
 00540404    pop         edx
 00540405    pop         ecx
 00540406    pop         ecx
 00540407    mov         dword ptr fs:[eax],edx
 0054040A    push        540417
 0054040F    ret
>00540410    jmp         @HandleFinally
>00540415    jmp         0054040F
 00540417    pop         ebp
 00540418    ret
*}
end.