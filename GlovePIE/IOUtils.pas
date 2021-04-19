//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit IOUtils;

interface

uses
  SysUtils, Classes;

    procedure CheckOpenReadParameters;//00457660
    procedure CheckReadAllBytesParameters;//00457668
    function DoReadAllBytes:TBytes;//00457670
    function Exists(FollowLink:Boolean):Boolean;//004576E4
    procedure InternalCheckFilePathParam(const FileExistsCheck:Boolean);//004576EC
    function OpenRead:TFileStream;//0045780C
    function ReadAllBytes:TBytes;//00457878
    procedure CheckPathLength(const MaxLength:Integer);//004578DC
    function DoCombine(const Path2:UnicodeString; const ValidateParams:Boolean):UnicodeString;//00457914
    function DoGetDirectoryName:UnicodeString;//00457A44
    function DoGetFullPath:UnicodeString;//00457C3C
    function DoIsPathRooted(const ValidateParam:Boolean):Boolean;//00457CB8
    function GetPosAfterExtendedPrefix(var Prefix:TPathPrefixType):Integer;//00457D8C
    function GetPosAfterExtendedPrefix:Integer;//00457DEC
    function HasValidPathChars(const UseWildcards:Boolean):Boolean;//00457DF8
    function HasPathValidColon:Boolean;//00457E70
    function IsCharInOrderedArray(const AnArray:TCharArray):Boolean;//00457F00
    function IsDriveRooted:Boolean;//00457F64
    function IsExtendedPrefixed:Boolean;//00457FD8
    function GetExtendedPrefix:TPathPrefixType;//00457FEC
    function IsPathWildcardChar:Boolean;//004580A8
    function IsUNCRooted:Boolean;//004580B4
    function IsValidPathChar:Boolean;//0045810C
    function PrefixExtendsPath:Boolean;//00458120
    function IsPathRooted:Boolean;//00458128
    function IsPathSeparator:Boolean;//00458130

implementation

//00457660
procedure TFile.CheckOpenReadParameters;
begin
{*
 00457660    mov         dl,1
 00457662    call        TFile.InternalCheckFilePathParam
 00457667    ret
*}
end;

//00457668
procedure TFile.CheckReadAllBytesParameters;
begin
{*
 00457668    mov         dl,1
 0045766A    call        TFile.InternalCheckFilePathParam
 0045766F    ret
*}
end;

//00457670
function TFile.DoReadAllBytes:TBytes;
begin
{*
 00457670    push        ebp
 00457671    mov         ebp,esp
 00457673    push        ecx
 00457674    push        ebx
 00457675    mov         ebx,edx
 00457677    xor         edx,edx
 00457679    mov         dword ptr [ebp-4],edx
 0045767C    xor         edx,edx
 0045767E    push        ebp
 0045767F    push        4576D8
 00457684    push        dword ptr fs:[edx]
 00457687    mov         dword ptr fs:[edx],esp
 0045768A    call        TFile.OpenRead
 0045768F    mov         dword ptr [ebp-4],eax
 00457692    mov         eax,dword ptr [ebp-4]
 00457695    mov         edx,dword ptr [eax]
 00457697    call        dword ptr [edx]
 00457699    push        eax
 0045769A    mov         eax,ebx
 0045769C    mov         ecx,1
 004576A1    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 004576A7    call        @DynArraySetLength
 004576AC    add         esp,4
 004576AF    mov         eax,dword ptr [ebx]
 004576B1    call        @DynArrayLength
 004576B6    mov         ecx,eax
 004576B8    mov         edx,dword ptr [ebx]
 004576BA    mov         eax,dword ptr [ebp-4]
 004576BD    call        TStream.ReadBuffer
 004576C2    xor         eax,eax
 004576C4    pop         edx
 004576C5    pop         ecx
 004576C6    pop         ecx
 004576C7    mov         dword ptr fs:[eax],edx
 004576CA    push        4576DF
 004576CF    mov         eax,dword ptr [ebp-4]
 004576D2    call        TObject.Free
 004576D7    ret
>004576D8    jmp         @HandleFinally
>004576DD    jmp         004576CF
 004576DF    pop         ebx
 004576E0    pop         ecx
 004576E1    pop         ebp
 004576E2    ret
*}
end;

//004576E4
function TFile.Exists(FollowLink:Boolean):Boolean;
begin
{*
 004576E4    call        FileExists
 004576E9    ret
*}
end;

//004576EC
procedure TFile.InternalCheckFilePathParam(const FileExistsCheck:Boolean);
begin
{*
 004576EC    push        ebp
 004576ED    mov         ebp,esp
 004576EF    push        0
 004576F1    push        0
 004576F3    push        0
 004576F5    push        ebx
 004576F6    push        esi
 004576F7    mov         ebx,edx
 004576F9    mov         esi,eax
 004576FB    xor         eax,eax
 004576FD    push        ebp
 004576FE    push        4577FF
 00457703    push        dword ptr fs:[eax]
 00457706    mov         dword ptr fs:[eax],esp
 00457709    mov         edx,0F8
 0045770E    mov         eax,esi
 00457710    call        TPath.CheckPathLength
 00457715    mov         eax,esi
 00457717    call        TPath.HasPathValidColon
 0045771C    test        al,al
>0045771E    jne         00457737
 00457720    mov         ecx,dword ptr ds:[78D934];^SResString159:TResStringRec
 00457726    mov         dl,1
 00457728    mov         eax,[004193DC];ENotSupportedException
 0045772D    call        Exception.CreateRes
 00457732    call        @RaiseExcept
 00457737    lea         edx,[ebp-4]
 0045773A    mov         eax,esi
 0045773C    call        Trim
 00457741    cmp         dword ptr [ebp-4],0
>00457745    jne         0045775E
 00457747    mov         ecx,dword ptr ds:[78DB44];^SResString156:TResStringRec
 0045774D    mov         dl,1
 0045774F    mov         eax,[004191CC];EArgumentException
 00457754    call        Exception.CreateRes
 00457759    call        @RaiseExcept
 0045775E    xor         edx,edx
 00457760    mov         eax,esi
 00457762    call        TPath.HasValidPathChars
 00457767    test        al,al
>00457769    jne         00457782
 0045776B    mov         ecx,dword ptr ds:[78DB44];^SResString156:TResStringRec
 00457771    mov         dl,1
 00457773    mov         eax,[004191CC];EArgumentException
 00457778    call        Exception.CreateRes
 0045777D    call        @RaiseExcept
 00457782    lea         edx,[ebp-0C]
 00457785    mov         eax,esi
 00457787    call        TPath.DoGetFullPath
 0045778C    mov         eax,dword ptr [ebp-0C]
 0045778F    lea         edx,[ebp-8]
 00457792    call        TPath.DoGetDirectoryName
 00457797    mov         eax,dword ptr [ebp-8]
 0045779A    mov         dl,1
 0045779C    call        DirectoryExists
 004577A1    test        al,al
>004577A3    jne         004577BC
 004577A5    mov         ecx,dword ptr ds:[78CEB4];^SResString158:TResStringRec
 004577AB    mov         dl,1
 004577AD    mov         eax,[0041948C];EDirectoryNotFoundException
 004577B2    call        Exception.CreateRes
 004577B7    call        @RaiseExcept
 004577BC    test        bl,bl
>004577BE    je          004577E4
 004577C0    mov         dl,1
 004577C2    mov         eax,esi
 004577C4    call        TFile.Exists
 004577C9    test        al,al
>004577CB    jne         004577E4
 004577CD    mov         ecx,dword ptr ds:[78D150];^SResString160:TResStringRec
 004577D3    mov         dl,1
 004577D5    mov         eax,[00419544];EFileNotFoundException
 004577DA    call        Exception.CreateRes
 004577DF    call        @RaiseExcept
 004577E4    xor         eax,eax
 004577E6    pop         edx
 004577E7    pop         ecx
 004577E8    pop         ecx
 004577E9    mov         dword ptr fs:[eax],edx
 004577EC    push        457806
 004577F1    lea         eax,[ebp-0C]
 004577F4    mov         edx,3
 004577F9    call        @UStrArrayClr
 004577FE    ret
>004577FF    jmp         @HandleFinally
>00457804    jmp         004577F1
 00457806    pop         esi
 00457807    pop         ebx
 00457808    mov         esp,ebp
 0045780A    pop         ebp
 0045780B    ret
*}
end;

//0045780C
function TFile.OpenRead:TFileStream;
begin
{*
 0045780C    push        ebp
 0045780D    mov         ebp,esp
 0045780F    push        ebx
 00457810    push        esi
 00457811    push        edi
 00457812    mov         ebx,eax
 00457814    mov         eax,ebx
 00457816    call        TFile.CheckOpenReadParameters
 0045781B    xor         edx,edx
 0045781D    push        ebp
 0045781E    push        457845
 00457823    push        dword ptr fs:[edx]
 00457826    mov         dword ptr fs:[edx],esp
 00457829    push        0
 0045782B    mov         ecx,ebx
 0045782D    mov         dl,1
 0045782F    mov         eax,[0043D6D0];TFileStream
 00457834    call        TFileStream.Create
 00457839    pop         dword ptr fs:[0]
 00457840    add         esp,8
>00457843    jmp         00457871
>00457845    jmp         @HandleOnException
 0045784A    dd          1
 0045784E    dd          004388F8;EFileStreamError
 00457852    dd          00457856
 00457856    mov         ebx,eax
 00457858    mov         ecx,dword ptr [ebx+4]
 0045785B    mov         dl,1
 0045785D    mov         eax,[00419814];EInOutError
 00457862    call        Exception.Create
 00457867    call        @RaiseExcept
 0045786C    call        @DoneExcept
 00457871    pop         edi
 00457872    pop         esi
 00457873    pop         ebx
 00457874    pop         ebp
 00457875    ret
*}
end;

//00457878
function TFile.ReadAllBytes:TBytes;
begin
{*
 00457878    push        ebp
 00457879    mov         ebp,esp
 0045787B    push        0
 0045787D    push        ebx
 0045787E    push        esi
 0045787F    mov         esi,edx
 00457881    mov         ebx,eax
 00457883    xor         eax,eax
 00457885    push        ebp
 00457886    push        4578CE
 0045788B    push        dword ptr fs:[eax]
 0045788E    mov         dword ptr fs:[eax],esp
 00457891    mov         eax,ebx
 00457893    call        TFile.CheckReadAllBytesParameters
 00457898    lea         edx,[ebp-4]
 0045789B    mov         eax,ebx
 0045789D    call        TFile.DoReadAllBytes
 004578A2    mov         edx,dword ptr [ebp-4]
 004578A5    mov         eax,esi
 004578A7    mov         ecx,dword ptr ds:[418988];TArray<System.Byte>
 004578AD    call        @DynArrayAsg
 004578B2    xor         eax,eax
 004578B4    pop         edx
 004578B5    pop         ecx
 004578B6    pop         ecx
 004578B7    mov         dword ptr fs:[eax],edx
 004578BA    push        4578D5
 004578BF    lea         eax,[ebp-4]
 004578C2    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 004578C8    call        @DynArrayClear
 004578CD    ret
>004578CE    jmp         @HandleFinally
>004578D3    jmp         004578BF
 004578D5    pop         esi
 004578D6    pop         ebx
 004578D7    pop         ecx
 004578D8    pop         ebp
 004578D9    ret
*}
end;

//004578DC
procedure TPath.CheckPathLength(const MaxLength:Integer);
begin
{*
 004578DC    push        ebx
 004578DD    mov         ebx,eax
 004578DF    mov         eax,ebx
 004578E1    test        eax,eax
>004578E3    je          004578EA
 004578E5    sub         eax,4
 004578E8    mov         eax,dword ptr [eax]
 004578EA    cmp         edx,eax
>004578EC    jg          00457910
 004578EE    mov         eax,ebx
 004578F0    call        TPath.IsExtendedPrefixed
 004578F5    test        al,al
>004578F7    jne         00457910
 004578F9    mov         ecx,dword ptr ds:[78CC8C];^SResString157:TResStringRec
 004578FF    mov         dl,1
 00457901    mov         eax,[00419330];EPathTooLongException
 00457906    call        Exception.CreateRes
 0045790B    call        @RaiseExcept
 00457910    pop         ebx
 00457911    ret
*}
end;

//00457914
function TPath.DoCombine(const Path2:UnicodeString; const ValidateParams:Boolean):UnicodeString;
begin
{*
 00457914    push        ebp
 00457915    mov         ebp,esp
 00457917    add         esp,0FFFFFFF8
 0045791A    push        ebx
 0045791B    push        esi
 0045791C    push        edi
 0045791D    xor         ebx,ebx
 0045791F    mov         dword ptr [ebp-8],ebx
 00457922    mov         byte ptr [ebp-1],cl
 00457925    mov         ebx,edx
 00457927    mov         esi,eax
 00457929    mov         edi,dword ptr [ebp+8]
 0045792C    xor         eax,eax
 0045792E    push        ebp
 0045792F    push        457A31
 00457934    push        dword ptr fs:[eax]
 00457937    mov         dword ptr fs:[eax],esp
 0045793A    test        esi,esi
>0045793C    jne         0045794C
 0045793E    mov         eax,edi
 00457940    mov         edx,ebx
 00457942    call        @UStrAsg
>00457947    jmp         00457A1B
 0045794C    test        ebx,ebx
>0045794E    jne         0045795E
 00457950    mov         eax,edi
 00457952    mov         edx,esi
 00457954    call        @UStrAsg
>00457959    jmp         00457A1B
 0045795E    cmp         byte ptr [ebp-1],0
>00457962    je          004579AC
 00457964    mov         dl,1
 00457966    mov         eax,esi
 00457968    call        TPath.HasValidPathChars
 0045796D    test        al,al
>0045796F    jne         00457988
 00457971    mov         ecx,dword ptr ds:[78DB44];^SResString156:TResStringRec
 00457977    mov         dl,1
 00457979    mov         eax,[004191CC];EArgumentException
 0045797E    call        Exception.CreateRes
 00457983    call        @RaiseExcept
 00457988    mov         dl,1
 0045798A    mov         eax,ebx
 0045798C    call        TPath.HasValidPathChars
 00457991    test        al,al
>00457993    jne         004579AC
 00457995    mov         ecx,dword ptr ds:[78DB44];^SResString156:TResStringRec
 0045799B    mov         dl,1
 0045799D    mov         eax,[004191CC];EArgumentException
 004579A2    call        Exception.CreateRes
 004579A7    call        @RaiseExcept
 004579AC    mov         eax,ebx
 004579AE    call        TPath.IsPathRooted
 004579B3    test        al,al
>004579B5    jne         004579C2
 004579B7    mov         eax,ebx
 004579B9    call        TPath.IsExtendedPrefixed
 004579BE    test        al,al
>004579C0    je          004579CD
 004579C2    mov         eax,edi
 004579C4    mov         edx,ebx
 004579C6    call        @UStrAsg
>004579CB    jmp         00457A1B
 004579CD    mov         eax,esi
 004579CF    test        eax,eax
>004579D1    je          004579D8
 004579D3    sub         eax,4
 004579D6    mov         eax,dword ptr [eax]
 004579D8    movzx       eax,word ptr [esi+eax*2-2]
 004579DD    mov         word ptr [ebp-4],ax
 004579E1    movzx       eax,word ptr [ebp-4]
 004579E5    call        TPath.IsPathSeparator
 004579EA    test        al,al
>004579EC    jne         00457A10
 004579EE    push        esi
 004579EF    lea         eax,[ebp-8]
 004579F2    movzx       edx,word ptr ds:[793022];gvar_00793022
 004579F9    call        @UStrFromWChar
 004579FE    push        dword ptr [ebp-8]
 00457A01    push        ebx
 00457A02    mov         eax,edi
 00457A04    mov         edx,3
 00457A09    call        @UStrCatN
>00457A0E    jmp         00457A1B
 00457A10    mov         eax,edi
 00457A12    mov         ecx,ebx
 00457A14    mov         edx,esi
 00457A16    call        @UStrCat3
 00457A1B    xor         eax,eax
 00457A1D    pop         edx
 00457A1E    pop         ecx
 00457A1F    pop         ecx
 00457A20    mov         dword ptr fs:[eax],edx
 00457A23    push        457A38
 00457A28    lea         eax,[ebp-8]
 00457A2B    call        @UStrClr
 00457A30    ret
>00457A31    jmp         @HandleFinally
>00457A36    jmp         00457A28
 00457A38    pop         edi
 00457A39    pop         esi
 00457A3A    pop         ebx
 00457A3B    pop         ecx
 00457A3C    pop         ecx
 00457A3D    pop         ebp
 00457A3E    ret         4
*}
end;

//00457A44
function TPath.DoGetDirectoryName:UnicodeString;
begin
{*
 00457A44    push        ebp
 00457A45    mov         ebp,esp
 00457A47    mov         ecx,4
 00457A4C    push        0
 00457A4E    push        0
 00457A50    dec         ecx
>00457A51    jne         00457A4C
 00457A53    push        ecx
 00457A54    push        ebx
 00457A55    push        esi
 00457A56    push        edi
 00457A57    mov         dword ptr [ebp-0C],edx
 00457A5A    mov         dword ptr [ebp-4],eax
 00457A5D    mov         eax,dword ptr [ebp-4]
 00457A60    call        @UStrAddRef
 00457A65    xor         eax,eax
 00457A67    push        ebp
 00457A68    push        457C2D
 00457A6D    push        dword ptr fs:[eax]
 00457A70    mov         dword ptr fs:[eax],esp
 00457A73    mov         eax,dword ptr [ebp-0C]
 00457A76    call        @UStrClr
 00457A7B    lea         edx,[ebp-18]
 00457A7E    mov         eax,dword ptr [ebp-4]
 00457A81    call        Trim
 00457A86    mov         edx,dword ptr [ebp-18]
 00457A89    lea         eax,[ebp-4]
 00457A8C    call        @UStrLAsg
 00457A91    lea         eax,[ebp-1C]
 00457A94    movzx       edx,word ptr ds:[793020];gvar_00793020
 00457A9B    call        @UStrFromWChar
 00457AA0    mov         eax,dword ptr [ebp-1C]
 00457AA3    push        eax
 00457AA4    lea         eax,[ebp-20]
 00457AA7    movzx       edx,word ptr ds:[793022];gvar_00793022
 00457AAE    call        @UStrFromWChar
 00457AB3    mov         edx,dword ptr [ebp-20]
 00457AB6    lea         eax,[ebp-8]
 00457AB9    pop         ecx
 00457ABA    call        @UStrCat3
 00457ABF    mov         edx,dword ptr [ebp-4]
 00457AC2    mov         eax,dword ptr [ebp-8]
 00457AC5    call        LastDelimiter
 00457ACA    mov         dword ptr [ebp-14],eax
 00457ACD    lea         edx,[ebp-0D]
 00457AD0    mov         eax,dword ptr [ebp-4]
 00457AD3    call        TPath.GetPosAfterExtendedPrefix
 00457AD8    mov         esi,eax
 00457ADA    cmp         dword ptr [ebp-14],0
 00457ADE    setg        dl
 00457AE1    mov         eax,dword ptr [ebp-4]
 00457AE4    test        eax,eax
>00457AE6    je          00457AED
 00457AE8    sub         eax,4
 00457AEB    mov         eax,dword ptr [eax]
 00457AED    mov         edi,eax
 00457AEF    xor         ebx,ebx
 00457AF1    test        dl,dl
>00457AF3    je          00457BC2
 00457AF9    mov         eax,dword ptr [ebp-4]
 00457AFC    call        TPath.IsUNCRooted
 00457B01    test        al,al
>00457B03    je          00457B46
 00457B05    cmp         byte ptr [ebp-0D],0
>00457B09    jne         00457B0E
 00457B0B    add         esi,2
 00457B0E    lea         ecx,[esi+1]
 00457B11    mov         edx,dword ptr [ebp-4]
 00457B14    mov         eax,dword ptr [ebp-8]
 00457B17    call        FindDelimiter
 00457B1C    mov         esi,eax
 00457B1E    test        esi,esi
>00457B20    jle         00457B32
 00457B22    lea         ecx,[esi+1]
 00457B25    mov         edx,dword ptr [ebp-4]
 00457B28    mov         eax,dword ptr [ebp-8]
 00457B2B    call        FindDelimiter
 00457B30    mov         esi,eax
 00457B32    test        esi,esi
>00457B34    jne         00457B3D
 00457B36    xor         ebx,ebx
>00457B38    jmp         00457BF2
 00457B3D    mov         ebx,dword ptr [ebp-14]
 00457B40    dec         ebx
>00457B41    jmp         00457BF2
 00457B46    mov         eax,dword ptr [ebp-4]
 00457B49    call        TPath.IsDriveRooted
 00457B4E    test        al,al
>00457B50    je          00457B96
 00457B52    mov         eax,dword ptr [ebp-4]
 00457B55    mov         edx,dword ptr [ebp-14]
 00457B58    movzx       eax,word ptr [eax+edx*2-4]
 00457B5D    cmp         ax,word ptr ds:[793026];gvar_00793026
>00457B64    jne         00457B87
 00457B66    movzx       eax,byte ptr [ebp-0D]
 00457B6A    call        TPath.PrefixExtendsPath
 00457B6F    test        al,al
>00457B71    je          00457B79
 00457B73    mov         ebx,dword ptr [ebp-14]
 00457B76    dec         ebx
>00457B77    jmp         00457BF2
 00457B79    cmp         edi,dword ptr [ebp-14]
>00457B7C    jle         00457B83
 00457B7E    mov         ebx,dword ptr [ebp-14]
>00457B81    jmp         00457BF2
 00457B83    xor         ebx,ebx
>00457B85    jmp         00457BF2
 00457B87    cmp         esi,dword ptr [ebp-14]
>00457B8A    jge         00457B92
 00457B8C    mov         ebx,dword ptr [ebp-14]
 00457B8F    dec         ebx
>00457B90    jmp         00457BF2
 00457B92    xor         ebx,ebx
>00457B94    jmp         00457BF2
 00457B96    movzx       eax,byte ptr [ebp-0D]
 00457B9A    call        TPath.PrefixExtendsPath
 00457B9F    test        al,al
>00457BA1    jne         00457BBE
 00457BA3    cmp         esi,dword ptr [ebp-14]
>00457BA6    jne         00457BB8
 00457BA8    cmp         edi,dword ptr [ebp-14]
>00457BAB    jle         00457BB4
 00457BAD    mov         ebx,1
>00457BB2    jmp         00457BF2
 00457BB4    xor         ebx,ebx
>00457BB6    jmp         00457BF2
 00457BB8    mov         ebx,dword ptr [ebp-14]
 00457BBB    dec         ebx
>00457BBC    jmp         00457BF2
 00457BBE    xor         ebx,ebx
>00457BC0    jmp         00457BF2
 00457BC2    mov         eax,dword ptr [ebp-4]
 00457BC5    call        TPath.IsDriveRooted
 00457BCA    test        al,al
>00457BCC    je          00457BF2
 00457BCE    lea         eax,[ebp-24]
 00457BD1    movzx       edx,word ptr ds:[793026];gvar_00793026
 00457BD8    call        @UStrFromWChar
 00457BDD    mov         eax,dword ptr [ebp-24]
 00457BE0    mov         ecx,esi
 00457BE2    mov         edx,dword ptr [ebp-4]
 00457BE5    call        PosEx
 00457BEA    mov         ebx,eax
 00457BEC    cmp         edi,ebx
>00457BEE    jne         00457BF2
 00457BF0    xor         ebx,ebx
 00457BF2    mov         eax,dword ptr [ebp-0C]
 00457BF5    push        eax
 00457BF6    mov         ecx,ebx
 00457BF8    mov         edx,1
 00457BFD    mov         eax,dword ptr [ebp-4]
 00457C00    call        @UStrCopy
 00457C05    xor         eax,eax
 00457C07    pop         edx
 00457C08    pop         ecx
 00457C09    pop         ecx
 00457C0A    mov         dword ptr fs:[eax],edx
 00457C0D    push        457C34
 00457C12    lea         eax,[ebp-24]
 00457C15    mov         edx,4
 00457C1A    call        @UStrArrayClr
 00457C1F    lea         eax,[ebp-8]
 00457C22    mov         edx,2
 00457C27    call        @UStrArrayClr
 00457C2C    ret
>00457C2D    jmp         @HandleFinally
>00457C32    jmp         00457C12
 00457C34    pop         edi
 00457C35    pop         esi
 00457C36    pop         ebx
 00457C37    mov         esp,ebp
 00457C39    pop         ebp
 00457C3A    ret
*}
end;

//00457C3C
function TPath.DoGetFullPath:UnicodeString;
begin
{*
 00457C3C    push        ebp
 00457C3D    mov         ebp,esp
 00457C3F    push        0
 00457C41    push        ebx
 00457C42    push        esi
 00457C43    mov         esi,edx
 00457C45    mov         ebx,eax
 00457C47    xor         eax,eax
 00457C49    push        ebp
 00457C4A    push        457CA9
 00457C4F    push        dword ptr fs:[eax]
 00457C52    mov         dword ptr fs:[eax],esp
 00457C55    push        0
 00457C57    call        kernel32.SetLastError
 00457C5C    mov         edx,esi
 00457C5E    mov         eax,ebx
 00457C60    call        ExpandFileName
 00457C65    call        kernel32.GetLastError
 00457C6A    mov         ebx,eax
 00457C6C    test        ebx,ebx
>00457C6E    je          00457C93
 00457C70    cmp         ebx,2
>00457C73    je          00457C93
 00457C75    lea         edx,[ebp-4]
 00457C78    mov         eax,ebx
 00457C7A    call        SysErrorMessage
 00457C7F    mov         ecx,dword ptr [ebp-4]
 00457C82    mov         dl,1
 00457C84    mov         eax,[004193DC];ENotSupportedException
 00457C89    call        Exception.Create
 00457C8E    call        @RaiseExcept
 00457C93    xor         eax,eax
 00457C95    pop         edx
 00457C96    pop         ecx
 00457C97    pop         ecx
 00457C98    mov         dword ptr fs:[eax],edx
 00457C9B    push        457CB0
 00457CA0    lea         eax,[ebp-4]
 00457CA3    call        @UStrClr
 00457CA8    ret
>00457CA9    jmp         @HandleFinally
>00457CAE    jmp         00457CA0
 00457CB0    pop         esi
 00457CB1    pop         ebx
 00457CB2    pop         ecx
 00457CB3    pop         ebp
 00457CB4    ret
*}
end;

//00457CB8
function TPath.DoIsPathRooted(const ValidateParam:Boolean):Boolean;
begin
{*
 00457CB8    push        ebx
 00457CB9    push        esi
 00457CBA    push        edi
 00457CBB    push        ebp
 00457CBC    push        ecx
 00457CBD    mov         byte ptr [esp],dl
 00457CC0    mov         edi,eax
 00457CC2    xor         ebx,ebx
 00457CC4    test        edi,edi
>00457CC6    je          00457D81
 00457CCC    cmp         byte ptr [esp],0
>00457CD0    je          00457CF6
 00457CD2    xor         edx,edx
 00457CD4    mov         eax,edi
 00457CD6    call        TPath.HasValidPathChars
 00457CDB    test        al,al
>00457CDD    jne         00457CF6
 00457CDF    mov         ecx,dword ptr ds:[78DB44];^SResString156:TResStringRec
 00457CE5    mov         dl,1
 00457CE7    mov         eax,[004191CC];EArgumentException
 00457CEC    call        Exception.CreateRes
 00457CF1    call        @RaiseExcept
 00457CF6    lea         edx,[esp+1]
 00457CFA    mov         eax,edi
 00457CFC    call        TPath.GetPosAfterExtendedPrefix
 00457D01    mov         esi,eax
 00457D03    mov         eax,edi
 00457D05    call        @UStrToPWChar
 00457D0A    mov         ebp,eax
 00457D0C    mov         eax,edi
 00457D0E    test        eax,eax
>00457D10    je          00457D17
 00457D12    sub         eax,4
 00457D15    mov         eax,dword ptr [eax]
 00457D17    sub         eax,esi
 00457D19    inc         eax
 00457D1A    cmp         eax,2
>00457D1D    jl          00457D2D
 00457D1F    movzx       edx,word ptr [ebp+esi*2]
 00457D24    cmp         dx,word ptr ds:[793026];gvar_00793026
>00457D2B    je          00457D31
 00457D2D    xor         ebx,ebx
>00457D2F    jmp         00457D33
 00457D31    mov         bl,1
 00457D33    test        bl,bl
>00457D35    jne         00457D5C
 00457D37    cmp         byte ptr [esp+1],0
>00457D3C    jne         00457D58
 00457D3E    dec         eax
>00457D3F    jl          00457D58
 00457D41    movzx       edx,word ptr [ebp+esi*2-2]
 00457D46    cmp         dx,word ptr ds:[793022];gvar_00793022
>00457D4D    je          00457D5C
 00457D4F    cmp         dx,word ptr ds:[793020];gvar_00793020
>00457D56    je          00457D5C
 00457D58    xor         eax,eax
>00457D5A    jmp         00457D5E
 00457D5C    mov         al,1
 00457D5E    mov         ebx,eax
 00457D60    test        bl,bl
>00457D62    jne         00457D7D
 00457D64    cmp         byte ptr [esp+1],2
>00457D69    jne         00457D79
 00457D6B    movzx       eax,word ptr [ebp+esi*2-2]
 00457D70    call        TPath.IsValidPathChar
 00457D75    test        al,al
>00457D77    jne         00457D7D
 00457D79    xor         eax,eax
>00457D7B    jmp         00457D7F
 00457D7D    mov         al,1
 00457D7F    mov         ebx,eax
 00457D81    mov         eax,ebx
 00457D83    pop         edx
 00457D84    pop         ebp
 00457D85    pop         edi
 00457D86    pop         esi
 00457D87    pop         ebx
 00457D88    ret
*}
end;

//00457D8C
function TPath.GetPosAfterExtendedPrefix(var Prefix:TPathPrefixType):Integer;
begin
{*
 00457D8C    push        ebx
 00457D8D    push        esi
 00457D8E    push        ecx
 00457D8F    mov         ebx,edx
 00457D91    mov         esi,eax
 00457D93    mov         eax,esi
 00457D95    call        TPath.GetExtendedPrefix
 00457D9A    mov         byte ptr [ebx],al
 00457D9C    movzx       eax,byte ptr [ebx]
 00457D9F    sub         al,1
>00457DA1    jb          00457DAB
>00457DA3    je          00457DB2
 00457DA5    dec         al
>00457DA7    je          00457DC9
>00457DA9    jmp         00457DE0
 00457DAB    mov         eax,1
>00457DB0    jmp         00457DE5
 00457DB2    mov         eax,[0078557C];^'\\?\'
 00457DB7    mov         dword ptr [esp],eax
 00457DBA    mov         eax,dword ptr [esp]
 00457DBD    test        eax,eax
>00457DBF    je          00457DC6
 00457DC1    sub         eax,4
 00457DC4    mov         eax,dword ptr [eax]
 00457DC6    inc         eax
>00457DC7    jmp         00457DE5
 00457DC9    mov         eax,[00785580];^'\\?\UNC\'
 00457DCE    mov         dword ptr [esp],eax
 00457DD1    mov         eax,dword ptr [esp]
 00457DD4    test        eax,eax
>00457DD6    je          00457DDD
 00457DD8    sub         eax,4
 00457DDB    mov         eax,dword ptr [eax]
 00457DDD    inc         eax
>00457DDE    jmp         00457DE5
 00457DE0    mov         eax,1
 00457DE5    pop         edx
 00457DE6    pop         esi
 00457DE7    pop         ebx
 00457DE8    ret
*}
end;

//00457DEC
function TPath.GetPosAfterExtendedPrefix:Integer;
begin
{*
 00457DEC    push        ecx
 00457DED    mov         edx,esp
 00457DEF    call        TPath.GetPosAfterExtendedPrefix
 00457DF4    pop         edx
 00457DF5    ret
*}
end;

//00457DF8
function TPath.HasValidPathChars(const UseWildcards:Boolean):Boolean;
begin
{*
 00457DF8    push        ebx
 00457DF9    push        esi
 00457DFA    push        edi
 00457DFB    push        ebp
 00457DFC    add         esp,0FFFFFFF8
 00457DFF    mov         byte ptr [esp],dl
 00457E02    mov         ebx,eax
 00457E04    mov         eax,ebx
 00457E06    call        TPath.GetPosAfterExtendedPrefix
 00457E0B    mov         edi,eax
 00457E0D    dec         edi
 00457E0E    mov         eax,ebx
 00457E10    call        @UStrToPWChar
 00457E15    mov         ebp,eax
 00457E17    mov         eax,ebx
 00457E19    test        eax,eax
>00457E1B    je          00457E22
 00457E1D    sub         eax,4
 00457E20    mov         eax,dword ptr [eax]
 00457E22    mov         dword ptr [esp+4],eax
 00457E26    xor         ebx,ebx
>00457E28    jmp         00457E57
 00457E2A    movzx       esi,word ptr [ebp+edi*2]
 00457E2F    mov         eax,esi
 00457E31    call        TPath.IsValidPathChar
 00457E36    test        al,al
>00457E38    jne         00457E56
 00457E3A    cmp         byte ptr [esp],0
>00457E3E    je          00457E52
 00457E40    mov         eax,esi
 00457E42    call        TPath.IsPathWildcardChar
 00457E47    test        al,al
>00457E49    jne         00457E4F
 00457E4B    mov         bl,1
>00457E4D    jmp         00457E57
 00457E4F    inc         edi
>00457E50    jmp         00457E57
 00457E52    mov         bl,1
>00457E54    jmp         00457E57
 00457E56    inc         edi
 00457E57    test        bl,bl
>00457E59    jne         00457E61
 00457E5B    cmp         edi,dword ptr [esp+4]
>00457E5F    jl          00457E2A
 00457E61    xor         bl,1
 00457E64    mov         eax,ebx
 00457E66    pop         ecx
 00457E67    pop         edx
 00457E68    pop         ebp
 00457E69    pop         edi
 00457E6A    pop         esi
 00457E6B    pop         ebx
 00457E6C    ret
*}
end;

//00457E70
function TPath.HasPathValidColon:Boolean;
begin
{*
 00457E70    push        ebp
 00457E71    mov         ebp,esp
 00457E73    push        0
 00457E75    push        0
 00457E77    push        ebx
 00457E78    push        esi
 00457E79    mov         esi,eax
 00457E7B    xor         eax,eax
 00457E7D    push        ebp
 00457E7E    push        457EEF
 00457E83    push        dword ptr fs:[eax]
 00457E86    mov         dword ptr fs:[eax],esp
 00457E89    mov         bl,1
 00457E8B    lea         edx,[ebp-4]
 00457E8E    mov         eax,esi
 00457E90    call        Trim
 00457E95    cmp         dword ptr [ebp-4],0
>00457E99    je          00457ED4
 00457E9B    mov         eax,esi
 00457E9D    call        TPath.GetPosAfterExtendedPrefix
 00457EA2    mov         ebx,eax
 00457EA4    mov         eax,esi
 00457EA6    call        TPath.IsDriveRooted
 00457EAB    test        al,al
>00457EAD    je          00457EB2
 00457EAF    add         ebx,2
 00457EB2    lea         eax,[ebp-8]
 00457EB5    movzx       edx,word ptr ds:[793026];gvar_00793026
 00457EBC    call        @UStrFromWChar
 00457EC1    mov         eax,dword ptr [ebp-8]
 00457EC4    mov         ecx,ebx
 00457EC6    mov         edx,esi
 00457EC8    call        PosEx
 00457ECD    test        eax,eax
 00457ECF    sete        al
 00457ED2    mov         ebx,eax
 00457ED4    xor         eax,eax
 00457ED6    pop         edx
 00457ED7    pop         ecx
 00457ED8    pop         ecx
 00457ED9    mov         dword ptr fs:[eax],edx
 00457EDC    push        457EF6
 00457EE1    lea         eax,[ebp-8]
 00457EE4    mov         edx,2
 00457EE9    call        @UStrArrayClr
 00457EEE    ret
>00457EEF    jmp         @HandleFinally
>00457EF4    jmp         00457EE1
 00457EF6    mov         eax,ebx
 00457EF8    pop         esi
 00457EF9    pop         ebx
 00457EFA    pop         ecx
 00457EFB    pop         ecx
 00457EFC    pop         ebp
 00457EFD    ret
*}
end;

//00457F00
function TPath.IsCharInOrderedArray(const AnArray:TCharArray):Boolean;
begin
{*
 00457F00    push        ebx
 00457F01    push        esi
 00457F02    push        edi
 00457F03    push        ebp
 00457F04    push        ecx
 00457F05    mov         edi,edx
 00457F07    mov         esi,eax
 00457F09    mov         byte ptr [esp],0
 00457F0D    xor         ebx,ebx
 00457F0F    mov         eax,edi
 00457F11    call        @DynArrayLength
 00457F16    dec         eax
 00457F17    test        eax,eax
>00457F19    jl          00457F5A
 00457F1B    cmp         si,word ptr [edi+ebx*2]
>00457F1F    jb          00457F5A
 00457F21    cmp         si,word ptr [edi+eax*2]
>00457F25    ja          00457F5A
 00457F27    mov         edx,eax
 00457F29    sub         edx,ebx
 00457F2B    sar         edx,1
>00457F2D    jns         00457F32
 00457F2F    adc         edx,0
 00457F32    add         edx,ebx
 00457F34    movzx       ebp,word ptr [edi+edx*2]
 00457F38    cmp         bp,si
>00457F3B    jbe         00457F42
 00457F3D    mov         eax,edx
 00457F3F    dec         eax
>00457F40    jmp         00457F50
 00457F42    cmp         bp,si
>00457F45    jae         00457F4C
 00457F47    lea         ebx,[edx+1]
>00457F4A    jmp         00457F50
 00457F4C    mov         byte ptr [esp],1
 00457F50    cmp         byte ptr [esp],0
>00457F54    jne         00457F5A
 00457F56    cmp         eax,ebx
>00457F58    jge         00457F27
 00457F5A    movzx       eax,byte ptr [esp]
 00457F5E    pop         edx
 00457F5F    pop         ebp
 00457F60    pop         edi
 00457F61    pop         esi
 00457F62    pop         ebx
 00457F63    ret
*}
end;

//00457F64
function TPath.IsDriveRooted:Boolean;
begin
{*
 00457F64    push        ebx
 00457F65    push        esi
 00457F66    mov         ebx,eax
 00457F68    xor         edx,edx
 00457F6A    mov         eax,ebx
 00457F6C    test        eax,eax
>00457F6E    je          00457F75
 00457F70    sub         eax,4
 00457F73    mov         eax,dword ptr [eax]
 00457F75    cmp         eax,2
>00457F78    jl          00457FD1
 00457F7A    mov         eax,ebx
 00457F7C    call        TPath.GetPosAfterExtendedPrefix
 00457F81    mov         esi,eax
 00457F83    mov         eax,ebx
 00457F85    call        @UStrToPWChar
 00457F8A    mov         edx,esi
 00457F8C    add         edx,edx
 00457F8E    add         eax,edx
 00457F90    sub         eax,2
 00457F93    movzx       ecx,word ptr [eax]
 00457F96    mov         edx,ecx
 00457F98    mov         ebx,ecx
 00457F9A    add         ebx,0FFFFFF9F
 00457F9D    sub         bx,1A
>00457FA1    jae         00457FAA
 00457FA3    mov         edx,ecx
 00457FA5    and         dx,0FFDF
 00457FAA    cmp         dx,0FF
>00457FAF    ja          00457FBB
 00457FB1    movzx       edx,dx
 00457FB4    bt          dword ptr ds:[785584],edx
>00457FBB    jae         00457FCD
 00457FBD    movzx       eax,word ptr [eax+2]
 00457FC1    cmp         ax,word ptr ds:[793026];gvar_00793026
 00457FC8    sete        al
>00457FCB    jmp         00457FCF
 00457FCD    xor         eax,eax
 00457FCF    mov         edx,eax
 00457FD1    mov         eax,edx
 00457FD3    pop         esi
 00457FD4    pop         ebx
 00457FD5    ret
*}
end;

//00457FD8
function TPath.IsExtendedPrefixed:Boolean;
begin
{*
 00457FD8    push        ebx
 00457FD9    mov         ebx,eax
 00457FDB    mov         eax,ebx
 00457FDD    call        TPath.GetExtendedPrefix
 00457FE2    call        TPath.PrefixExtendsPath
 00457FE7    pop         ebx
 00457FE8    ret
*}
end;

//00457FEC
function TPath.GetExtendedPrefix:TPathPrefixType;
begin
{*
 00457FEC    push        ebp
 00457FED    mov         ebp,esp
 00457FEF    add         esp,0FFFFFFF8
 00457FF2    push        ebx
 00457FF3    push        esi
 00457FF4    push        edi
 00457FF5    xor         edx,edx
 00457FF7    mov         dword ptr [ebp-4],edx
 00457FFA    mov         esi,eax
 00457FFC    xor         eax,eax
 00457FFE    push        ebp
 00457FFF    push        458098
 00458004    push        dword ptr fs:[eax]
 00458007    mov         dword ptr fs:[eax],esp
 0045800A    xor         ebx,ebx
 0045800C    test        esi,esi
>0045800E    je          00458082
 00458010    mov         eax,[00785580];^'\\?\UNC\'
 00458015    mov         dword ptr [ebp-8],eax
 00458018    mov         edi,dword ptr [ebp-8]
 0045801B    test        edi,edi
>0045801D    je          00458024
 0045801F    sub         edi,4
 00458022    mov         edi,dword ptr [edi]
 00458024    lea         eax,[ebp-4]
 00458027    push        eax
 00458028    mov         ecx,edi
 0045802A    mov         edx,1
 0045802F    mov         eax,esi
 00458031    call        @UStrCopy
 00458036    mov         eax,dword ptr [ebp-4]
 00458039    mov         edx,dword ptr ds:[785580];^'\\?\UNC\'
 0045803F    call        @UStrEqual
>00458044    je          00458080
 00458046    mov         eax,[0078557C];^'\\?\'
 0045804B    mov         dword ptr [ebp-8],eax
 0045804E    mov         edi,dword ptr [ebp-8]
 00458051    test        edi,edi
>00458053    je          0045805A
 00458055    sub         edi,4
 00458058    mov         edi,dword ptr [edi]
 0045805A    lea         eax,[ebp-4]
 0045805D    push        eax
 0045805E    mov         ecx,edi
 00458060    mov         edx,1
 00458065    mov         eax,esi
 00458067    call        @UStrCopy
 0045806C    mov         eax,dword ptr [ebp-4]
 0045806F    mov         edx,dword ptr ds:[78557C];^'\\?\'
 00458075    call        @UStrEqual
>0045807A    jne         00458082
 0045807C    mov         bl,1
>0045807E    jmp         00458082
 00458080    mov         bl,2
 00458082    xor         eax,eax
 00458084    pop         edx
 00458085    pop         ecx
 00458086    pop         ecx
 00458087    mov         dword ptr fs:[eax],edx
 0045808A    push        45809F
 0045808F    lea         eax,[ebp-4]
 00458092    call        @UStrClr
 00458097    ret
>00458098    jmp         @HandleFinally
>0045809D    jmp         0045808F
 0045809F    mov         eax,ebx
 004580A1    pop         edi
 004580A2    pop         esi
 004580A3    pop         ebx
 004580A4    pop         ecx
 004580A5    pop         ecx
 004580A6    pop         ebp
 004580A7    ret
*}
end;

//004580A8
function TPath.IsPathWildcardChar:Boolean;
begin
{*
 004580A8    mov         edx,dword ptr ds:[793034];gvar_00793034:?
 004580AE    call        TPath.IsCharInOrderedArray
 004580B3    ret
*}
end;

//004580B4
function TPath.IsUNCRooted:Boolean;
begin
{*
 004580B4    push        ebx
 004580B5    push        esi
 004580B6    mov         esi,eax
 004580B8    xor         ebx,ebx
 004580BA    mov         eax,esi
 004580BC    test        eax,eax
>004580BE    je          004580C5
 004580C0    sub         eax,4
 004580C3    mov         eax,dword ptr [eax]
 004580C5    cmp         eax,3
>004580C8    jl          00458106
 004580CA    mov         eax,esi
 004580CC    call        @UStrToPWChar
 004580D1    movzx       edx,word ptr ds:[793022];gvar_00793022
 004580D8    cmp         dx,word ptr [eax]
>004580DB    jne         00458106
 004580DD    cmp         dx,word ptr [eax+2]
>004580E1    jne         00458106
 004580E3    movzx       edx,word ptr [eax+4]
 004580E7    mov         ecx,edx
 004580E9    sub         cx,3F
>004580ED    jne         004580FD
 004580EF    mov         eax,esi
 004580F1    call        TPath.GetExtendedPrefix
 004580F6    cmp         al,2
 004580F8    sete        bl
>004580FB    jmp         00458106
 004580FD    mov         eax,edx
 004580FF    call        TPath.IsValidPathChar
 00458104    mov         ebx,eax
 00458106    mov         eax,ebx
 00458108    pop         esi
 00458109    pop         ebx
 0045810A    ret
*}
end;

//0045810C
function TPath.IsValidPathChar:Boolean;
begin
{*
 0045810C    push        ebx
 0045810D    mov         ebx,eax
 0045810F    mov         edx,dword ptr ds:[79302C];gvar_0079302C:?
 00458115    mov         eax,ebx
 00458117    call        TPath.IsCharInOrderedArray
 0045811C    xor         al,1
 0045811E    pop         ebx
 0045811F    ret
*}
end;

//00458120
function TPath.PrefixExtendsPath:Boolean;
begin
{*
 00458120    dec         eax
 00458121    sub         al,2
 00458123    setb        al
 00458126    ret
*}
end;

//00458128
function TPath.IsPathRooted:Boolean;
begin
{*
 00458128    mov         dl,1
 0045812A    call        TPath.DoIsPathRooted
 0045812F    ret
*}
end;

//00458130
function TPath.IsPathSeparator:Boolean;
begin
{*
 00458130    cmp         ax,word ptr ds:[793022];gvar_00793022
>00458137    je          0045814E
 00458139    cmp         ax,word ptr ds:[793020];gvar_00793020
>00458140    je          0045814E
 00458142    cmp         ax,word ptr ds:[793026];gvar_00793026
>00458149    je          0045814E
 0045814B    xor         eax,eax
 0045814D    ret
 0045814E    mov         al,1
 00458150    ret
*}
end;

Initialization
Finalization
//00458154
{*
 00458154    push        ebp
 00458155    mov         ebp,esp
 00458157    xor         eax,eax
 00458159    push        ebp
 0045815A    push        4581E3
 0045815F    push        dword ptr fs:[eax]
 00458162    mov         dword ptr fs:[eax],esp
 00458165    inc         dword ptr ds:[793040]
>0045816B    jne         004581D5
 0045816D    mov         eax,785574;^'.'
 00458172    call        @UStrClr
 00458177    mov         eax,785578;^'..'
 0045817C    call        @UStrClr
 00458181    mov         eax,78557C;^'\\?\'
 00458186    call        @UStrClr
 0045818B    mov         eax,785580;^'\\?\UNC\'
 00458190    call        @UStrClr
 00458195    mov         eax,79302C;gvar_0079302C:?
 0045819A    mov         edx,dword ptr ds:[41B3D4];TArray<System.Char>
 004581A0    call        @DynArrayClear
 004581A5    mov         eax,793030;gvar_00793030:?
 004581AA    mov         edx,dword ptr ds:[41B3D4];TArray<System.Char>
 004581B0    call        @DynArrayClear
 004581B5    mov         eax,793034;gvar_00793034:?
 004581BA    mov         edx,dword ptr ds:[41B3D4];TArray<System.Char>
 004581C0    call        @DynArrayClear
 004581C5    mov         eax,793038;gvar_00793038:?
 004581CA    mov         edx,dword ptr ds:[41B3D4];TArray<System.Char>
 004581D0    call        @DynArrayClear
 004581D5    xor         eax,eax
 004581D7    pop         edx
 004581D8    pop         ecx
 004581D9    pop         ecx
 004581DA    mov         dword ptr fs:[eax],edx
 004581DD    push        4581EA
 004581E2    ret
>004581E3    jmp         @HandleFinally
>004581E8    jmp         004581E2
 004581EA    pop         ebp
 004581EB    ret
*}
end.