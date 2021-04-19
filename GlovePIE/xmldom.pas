//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit xmldom;

interface

uses
  SysUtils, Classes;

type
  DOMException = class(Exception)
  public
    code:Word;//f18
  end;
  EDOMParseError = class(Exception)
  published
    constructor Create(Msg:string);//0058A578
  public
    FParseError:IDOMParseError;//f18
    function GetErrorCode:Integer;//0058A5C4
    function GetFilePos:Integer;//0058A5DC
    function GetLine:Integer;//0058A5F4
    function GetLinePos:Integer;//0058A60C
    function GetReason:UnicodeString;//0058A624
    function GetSrcText:UnicodeString;//0058A644
    function GetURL:UnicodeString;//0058A664
  end;
  TAsyncEventHandler = procedure(Sender:TObject; AsyncLoadState:Integer) of object;;
  TDOMVendor = class(TObject)
  published
    procedure DOMImplementation;//00589D64
    procedure Description;//00589D5C
  public
    procedure Description; virtual; abstract;//v0//00404A58
    procedure DOMImplementation; virtual; abstract;//v4//00404A58
  end;
  TDOMVendorArray = array of TDOMVendor;
//elSize = 4;
  TDOMVendorList = class(TObject)
  published
    function Find(VendorDesc:string):TDOMVendor;//0058A394
    procedure Remove(Vendor:TDOMVendor);//0058A4E8
    procedure Add(Vendor:TDOMVendor);//0058A41C
    function Count:Integer;//0058A388
  public
    FVendors:TDOMVendorArray;//f4
    function GetVendors(Index:Integer):TDOMVendor;//0058A570
  end;
    function IsPrefixed(const AName:UnicodeString):Boolean;//00589F4C
    function ExtractLocalName(const AName:UnicodeString):UnicodeString;//00589F74
    function ExtractPrefix(const AName:UnicodeString):UnicodeString;//00589FBC
    function MakeNodeName(const Prefix:UnicodeString; const LocalName:UnicodeString):UnicodeString;//0058A004
    function SameNamespace(const Node:IDOMNode; const namespaceURI:UnicodeString):Boolean;//0058A044
    procedure sub_0058A0A4;//0058A0A4
    function NodeMatches(const Node:IDOMNode; const TagName:UnicodeString; const NamespaceURI:UnicodeString):Boolean;//0058A0AC
    function GetDOMNodeEx(const Node:IDOMNode):IDOMNodeEx;//0058A150
    function DOMVendorList:TDOMVendorList;//0058A1D8
    procedure RegisterDOMVendor(const Vendor:TDOMVendor);//0058A1F8
    procedure UnRegisterDOMVendor(const Vendor:TDOMVendor);//0058A20C
    function GetDOMVendor(VendorDesc:UnicodeString):TDOMVendor;//0058A228
    function GetDOM(const VendorDesc:UnicodeString):IDOMImplementation;//0058A2F8
    procedure DOMVendorNotSupported(const PropOrMethod:UnicodeString; const VendorName:UnicodeString);//0058A310

implementation

//00589D5C
procedure TDOMVendor.Description;
begin
{*
>00589D5C    jmp         @AbstractError
*}
end;

//00589D64
procedure TDOMVendor.DOMImplementation;
begin
{*
>00589D64    jmp         @AbstractError
*}
end;

//00589F4C
function IsPrefixed(const AName:UnicodeString):Boolean;
begin
{*
 00589F4C    push        ebx
 00589F4D    mov         ebx,eax
 00589F4F    mov         edx,ebx
 00589F51    mov         eax,589F70;':'
 00589F56    call        Pos
 00589F5B    test        eax,eax
 00589F5D    setg        al
 00589F60    pop         ebx
 00589F61    ret
*}
end;

//00589F74
function ExtractLocalName(const AName:UnicodeString):UnicodeString;
begin
{*
 00589F74    push        ebx
 00589F75    push        esi
 00589F76    push        edi
 00589F77    mov         edi,edx
 00589F79    mov         esi,eax
 00589F7B    mov         edx,esi
 00589F7D    mov         eax,589FB8;':'
 00589F82    call        Pos
 00589F87    mov         ebx,eax
 00589F89    test        ebx,ebx
>00589F8B    jle         00589F9F
 00589F8D    push        edi
 00589F8E    lea         edx,[ebx+1]
 00589F91    mov         ecx,7FFFFFFF
 00589F96    mov         eax,esi
 00589F98    call        @UStrCopy
>00589F9D    jmp         00589FA8
 00589F9F    mov         eax,edi
 00589FA1    mov         edx,esi
 00589FA3    call        @UStrAsg
 00589FA8    pop         edi
 00589FA9    pop         esi
 00589FAA    pop         ebx
 00589FAB    ret
*}
end;

//00589FBC
function ExtractPrefix(const AName:UnicodeString):UnicodeString;
begin
{*
 00589FBC    push        ebx
 00589FBD    push        esi
 00589FBE    push        edi
 00589FBF    mov         edi,edx
 00589FC1    mov         esi,eax
 00589FC3    mov         edx,esi
 00589FC5    mov         eax,58A000;':'
 00589FCA    call        Pos
 00589FCF    mov         ebx,eax
 00589FD1    test        ebx,ebx
>00589FD3    jle         00589FE7
 00589FD5    push        edi
 00589FD6    mov         ecx,ebx
 00589FD8    dec         ecx
 00589FD9    mov         edx,1
 00589FDE    mov         eax,esi
 00589FE0    call        @UStrCopy
>00589FE5    jmp         00589FEE
 00589FE7    mov         eax,edi
 00589FE9    call        @UStrClr
 00589FEE    pop         edi
 00589FEF    pop         esi
 00589FF0    pop         ebx
 00589FF1    ret
*}
end;

//0058A004
function MakeNodeName(const Prefix:UnicodeString; const LocalName:UnicodeString):UnicodeString;
begin
{*
 0058A004    push        ebx
 0058A005    push        esi
 0058A006    push        edi
 0058A007    mov         edi,ecx
 0058A009    mov         esi,edx
 0058A00B    mov         ebx,eax
 0058A00D    test        ebx,ebx
>0058A00F    je          0058A026
 0058A011    push        ebx
 0058A012    push        58A040;':'
 0058A017    push        esi
 0058A018    mov         eax,edi
 0058A01A    mov         edx,3
 0058A01F    call        @UStrCatN
>0058A024    jmp         0058A02F
 0058A026    mov         eax,edi
 0058A028    mov         edx,esi
 0058A02A    call        @UStrAsg
 0058A02F    pop         edi
 0058A030    pop         esi
 0058A031    pop         ebx
 0058A032    ret
*}
end;

//0058A044
function SameNamespace(const Node:IDOMNode; const namespaceURI:UnicodeString):Boolean;
begin
{*
 0058A044    push        ebp
 0058A045    mov         ebp,esp
 0058A047    push        0
 0058A049    push        ebx
 0058A04A    push        esi
 0058A04B    mov         esi,edx
 0058A04D    mov         ebx,eax
 0058A04F    xor         eax,eax
 0058A051    push        ebp
 0058A052    push        58A093
 0058A057    push        dword ptr fs:[eax]
 0058A05A    mov         dword ptr fs:[eax],esp
 0058A05D    lea         eax,[ebp-4]
 0058A060    call        @UStrClr
 0058A065    push        eax
 0058A066    push        ebx
 0058A067    mov         eax,dword ptr [ebx]
 0058A069    call        dword ptr [eax+3C]
 0058A06C    call        @CheckAutoResult
 0058A071    mov         eax,dword ptr [ebp-4]
 0058A074    mov         edx,esi
 0058A076    call        SameText
 0058A07B    mov         ebx,eax
 0058A07D    xor         eax,eax
 0058A07F    pop         edx
 0058A080    pop         ecx
 0058A081    pop         ecx
 0058A082    mov         dword ptr fs:[eax],edx
 0058A085    push        58A09A
 0058A08A    lea         eax,[ebp-4]
 0058A08D    call        @UStrClr
 0058A092    ret
>0058A093    jmp         @HandleFinally
>0058A098    jmp         0058A08A
 0058A09A    mov         eax,ebx
 0058A09C    pop         esi
 0058A09D    pop         ebx
 0058A09E    pop         ecx
 0058A09F    pop         ebp
 0058A0A0    ret
*}
end;

//0058A0A4
procedure sub_0058A0A4;
begin
{*
 0058A0A4    call        SameText
 0058A0A9    ret
*}
end;

//0058A0AC
function NodeMatches(const Node:IDOMNode; const TagName:UnicodeString; const NamespaceURI:UnicodeString):Boolean;
begin
{*
 0058A0AC    push        ebp
 0058A0AD    mov         ebp,esp
 0058A0AF    push        0
 0058A0B1    push        0
 0058A0B3    push        ebx
 0058A0B4    push        esi
 0058A0B5    push        edi
 0058A0B6    mov         edi,ecx
 0058A0B8    mov         esi,edx
 0058A0BA    mov         ebx,eax
 0058A0BC    xor         eax,eax
 0058A0BE    push        ebp
 0058A0BF    push        58A13E
 0058A0C4    push        dword ptr fs:[eax]
 0058A0C7    mov         dword ptr fs:[eax],esp
 0058A0CA    test        edi,edi
>0058A0CC    je          0058A0DB
 0058A0CE    mov         edx,edi
 0058A0D0    mov         eax,ebx
 0058A0D2    call        SameNamespace
 0058A0D7    test        al,al
>0058A0D9    je          0058A11B
 0058A0DB    lea         eax,[ebp-4]
 0058A0DE    call        @UStrClr
 0058A0E3    push        eax
 0058A0E4    push        ebx
 0058A0E5    mov         eax,dword ptr [ebx]
 0058A0E7    call        dword ptr [eax+0C]
 0058A0EA    call        @CheckAutoResult
 0058A0EF    mov         eax,dword ptr [ebp-4]
 0058A0F2    mov         edx,esi
 0058A0F4    call        @UStrEqual
>0058A0F9    je          0058A11F
 0058A0FB    lea         eax,[ebp-8]
 0058A0FE    call        @UStrClr
 0058A103    push        eax
 0058A104    push        ebx
 0058A105    mov         eax,dword ptr [ebx]
 0058A107    call        dword ptr [eax+44]
 0058A10A    call        @CheckAutoResult
 0058A10F    mov         eax,dword ptr [ebp-8]
 0058A112    mov         edx,esi
 0058A114    call        @UStrEqual
>0058A119    je          0058A11F
 0058A11B    xor         eax,eax
>0058A11D    jmp         0058A121
 0058A11F    mov         al,1
 0058A121    mov         ebx,eax
 0058A123    xor         eax,eax
 0058A125    pop         edx
 0058A126    pop         ecx
 0058A127    pop         ecx
 0058A128    mov         dword ptr fs:[eax],edx
 0058A12B    push        58A145
 0058A130    lea         eax,[ebp-8]
 0058A133    mov         edx,2
 0058A138    call        @UStrArrayClr
 0058A13D    ret
>0058A13E    jmp         @HandleFinally
>0058A143    jmp         0058A130
 0058A145    mov         eax,ebx
 0058A147    pop         edi
 0058A148    pop         esi
 0058A149    pop         ebx
 0058A14A    pop         ecx
 0058A14B    pop         ecx
 0058A14C    pop         ebp
 0058A14D    ret
*}
end;

//0058A150
function GetDOMNodeEx(const Node:IDOMNode):IDOMNodeEx;
begin
{*
 0058A150    push        ebp
 0058A151    mov         ebp,esp
 0058A153    push        0
 0058A155    push        ebx
 0058A156    push        esi
 0058A157    mov         esi,edx
 0058A159    mov         ebx,eax
 0058A15B    xor         eax,eax
 0058A15D    push        ebp
 0058A15E    push        58A1B9
 0058A163    push        dword ptr fs:[eax]
 0058A166    mov         dword ptr fs:[eax],esp
 0058A169    mov         eax,esi
 0058A16B    call        @IntfClear
 0058A170    mov         ecx,eax
 0058A172    mov         edx,58A1C8
 0058A177    mov         eax,ebx
 0058A179    call        Supports
 0058A17E    test        al,al
>0058A180    jne         0058A1A3
 0058A182    lea         edx,[ebp-4]
 0058A185    mov         eax,[0078DB6C];^SResString585:TResStringRec
 0058A18A    call        LoadResString
 0058A18F    mov         ecx,dword ptr [ebp-4]
 0058A192    mov         dl,1
 0058A194    mov         eax,[00589424];DOMException
 0058A199    call        Exception.Create
 0058A19E    call        @RaiseExcept
 0058A1A3    xor         eax,eax
 0058A1A5    pop         edx
 0058A1A6    pop         ecx
 0058A1A7    pop         ecx
 0058A1A8    mov         dword ptr fs:[eax],edx
 0058A1AB    push        58A1C0
 0058A1B0    lea         eax,[ebp-4]
 0058A1B3    call        @UStrClr
 0058A1B8    ret
>0058A1B9    jmp         @HandleFinally
>0058A1BE    jmp         0058A1B0
 0058A1C0    pop         esi
 0058A1C1    pop         ebx
 0058A1C2    pop         ecx
 0058A1C3    pop         ebp
 0058A1C4    ret
*}
end;

//0058A1D8
function DOMVendorList:TDOMVendorList;
begin
{*
 0058A1D8    cmp         dword ptr ds:[815574],0;DOMVendors:TDOMVendorList
>0058A1DF    jne         0058A1F2
 0058A1E1    mov         dl,1
 0058A1E3    mov         eax,[00589DA0];TDOMVendorList
 0058A1E8    call        TObject.Create
 0058A1ED    mov         [00815574],eax;DOMVendors:TDOMVendorList
 0058A1F2    mov         eax,[00815574];DOMVendors:TDOMVendorList
 0058A1F7    ret
*}
end;

//0058A1F8
procedure RegisterDOMVendor(const Vendor:TDOMVendor);
begin
{*
 0058A1F8    push        ebx
 0058A1F9    mov         ebx,eax
 0058A1FB    call        DOMVendorList
 0058A200    mov         edx,ebx
 0058A202    call        TDOMVendorList.Add
 0058A207    pop         ebx
 0058A208    ret
*}
end;

//0058A20C
procedure UnRegisterDOMVendor(const Vendor:TDOMVendor);
begin
{*
 0058A20C    push        ebx
 0058A20D    mov         ebx,eax
 0058A20F    cmp         dword ptr ds:[815574],0;DOMVendors:TDOMVendorList
>0058A216    je          0058A224
 0058A218    call        DOMVendorList
 0058A21D    mov         edx,ebx
 0058A21F    call        TDOMVendorList.Remove
 0058A224    pop         ebx
 0058A225    ret
*}
end;

//0058A228
function GetDOMVendor(VendorDesc:UnicodeString):TDOMVendor;
begin
{*
 0058A228    push        ebp
 0058A229    mov         ebp,esp
 0058A22B    add         esp,0FFFFFFF0
 0058A22E    push        ebx
 0058A22F    xor         edx,edx
 0058A231    mov         dword ptr [ebp-10],edx
 0058A234    mov         dword ptr [ebp-4],eax
 0058A237    mov         eax,dword ptr [ebp-4]
 0058A23A    call        @UStrAddRef
 0058A23F    xor         eax,eax
 0058A241    push        ebp
 0058A242    push        58A2E7
 0058A247    push        dword ptr fs:[eax]
 0058A24A    mov         dword ptr fs:[eax],esp
 0058A24D    cmp         dword ptr [ebp-4],0
>0058A251    jne         0058A261
 0058A253    lea         eax,[ebp-4]
 0058A256    mov         edx,dword ptr ds:[815570];DefaultDOMVendor:UnicodeString
 0058A25C    call        @UStrLAsg
 0058A261    cmp         dword ptr [ebp-4],0
>0058A265    jne         0058A285
 0058A267    call        DOMVendorList
 0058A26C    call        TDOMVendorList.Count
 0058A271    test        eax,eax
>0058A273    jle         0058A285
 0058A275    call        DOMVendorList
 0058A27A    xor         edx,edx
 0058A27C    call        TDOMVendorList.GetVendors
 0058A281    mov         ebx,eax
>0058A283    jmp         0058A294
 0058A285    call        DOMVendorList
 0058A28A    mov         edx,dword ptr [ebp-4]
 0058A28D    call        TDOMVendorList.Find
 0058A292    mov         ebx,eax
 0058A294    test        ebx,ebx
>0058A296    jne         0058A2C9
 0058A298    mov         eax,dword ptr [ebp-4]
 0058A29B    mov         dword ptr [ebp-0C],eax
 0058A29E    mov         byte ptr [ebp-8],11
 0058A2A2    lea         eax,[ebp-0C]
 0058A2A5    push        eax
 0058A2A6    push        0
 0058A2A8    lea         edx,[ebp-10]
 0058A2AB    mov         eax,[0078CC20];^SResString584:TResStringRec
 0058A2B0    call        LoadResString
 0058A2B5    mov         ecx,dword ptr [ebp-10]
 0058A2B8    mov         dl,1
 0058A2BA    mov         eax,[00418C04];Exception
 0058A2BF    call        Exception.CreateFmt
 0058A2C4    call        @RaiseExcept
 0058A2C9    xor         eax,eax
 0058A2CB    pop         edx
 0058A2CC    pop         ecx
 0058A2CD    pop         ecx
 0058A2CE    mov         dword ptr fs:[eax],edx
 0058A2D1    push        58A2EE
 0058A2D6    lea         eax,[ebp-10]
 0058A2D9    call        @UStrClr
 0058A2DE    lea         eax,[ebp-4]
 0058A2E1    call        @UStrClr
 0058A2E6    ret
>0058A2E7    jmp         @HandleFinally
>0058A2EC    jmp         0058A2D6
 0058A2EE    mov         eax,ebx
 0058A2F0    pop         ebx
 0058A2F1    mov         esp,ebp
 0058A2F3    pop         ebp
 0058A2F4    ret
*}
end;

//0058A2F8
function GetDOM(const VendorDesc:UnicodeString):IDOMImplementation;
begin
{*
 0058A2F8    push        ebx
 0058A2F9    push        esi
 0058A2FA    mov         esi,edx
 0058A2FC    mov         ebx,eax
 0058A2FE    mov         eax,ebx
 0058A300    call        GetDOMVendor
 0058A305    mov         edx,esi
 0058A307    mov         ecx,dword ptr [eax]
 0058A309    call        dword ptr [ecx+4]
 0058A30C    pop         esi
 0058A30D    pop         ebx
 0058A30E    ret
*}
end;

//0058A310
procedure DOMVendorNotSupported(const PropOrMethod:UnicodeString; const VendorName:UnicodeString);
begin
{*
 0058A310    push        ebp
 0058A311    mov         ebp,esp
 0058A313    add         esp,0FFFFFFEC
 0058A316    push        ebx
 0058A317    push        esi
 0058A318    xor         ecx,ecx
 0058A31A    mov         dword ptr [ebp-14],ecx
 0058A31D    mov         esi,edx
 0058A31F    mov         ebx,eax
 0058A321    xor         eax,eax
 0058A323    push        ebp
 0058A324    push        58A37A
 0058A329    push        dword ptr fs:[eax]
 0058A32C    mov         dword ptr fs:[eax],esp
 0058A32F    mov         dword ptr [ebp-10],ebx
 0058A332    mov         byte ptr [ebp-0C],11
 0058A336    mov         dword ptr [ebp-8],esi
 0058A339    mov         byte ptr [ebp-4],11
 0058A33D    lea         eax,[ebp-10]
 0058A340    push        eax
 0058A341    push        1
 0058A343    lea         edx,[ebp-14]
 0058A346    mov         eax,[0078D3F8];^SResString586:TResStringRec
 0058A34B    call        LoadResString
 0058A350    mov         ecx,dword ptr [ebp-14]
 0058A353    mov         dl,1
 0058A355    mov         eax,[00589424];DOMException
 0058A35A    call        Exception.CreateFmt
 0058A35F    call        @RaiseExcept
 0058A364    xor         eax,eax
 0058A366    pop         edx
 0058A367    pop         ecx
 0058A368    pop         ecx
 0058A369    mov         dword ptr fs:[eax],edx
 0058A36C    push        58A381
 0058A371    lea         eax,[ebp-14]
 0058A374    call        @UStrClr
 0058A379    ret
>0058A37A    jmp         @HandleFinally
>0058A37F    jmp         0058A371
 0058A381    pop         esi
 0058A382    pop         ebx
 0058A383    mov         esp,ebp
 0058A385    pop         ebp
 0058A386    ret
*}
end;

//0058A388
function TDOMVendorList.Count:Integer;
begin
{*
 0058A388    mov         eax,dword ptr [eax+4]
 0058A38B    call        @DynArrayLength
 0058A390    ret
*}
end;

//0058A394
function TDOMVendorList.Find(VendorDesc:string):TDOMVendor;
begin
{*
 0058A394    push        ebp
 0058A395    mov         ebp,esp
 0058A397    add         esp,0FFFFFFF4
 0058A39A    push        ebx
 0058A39B    push        esi
 0058A39C    push        edi
 0058A39D    xor         ecx,ecx
 0058A39F    mov         dword ptr [ebp-0C],ecx
 0058A3A2    mov         dword ptr [ebp-4],edx
 0058A3A5    mov         edi,eax
 0058A3A7    xor         eax,eax
 0058A3A9    push        ebp
 0058A3AA    push        58A40A
 0058A3AF    push        dword ptr fs:[eax]
 0058A3B2    mov         dword ptr fs:[eax],esp
 0058A3B5    xor         eax,eax
 0058A3B7    mov         dword ptr [ebp-8],eax
 0058A3BA    mov         eax,edi
 0058A3BC    call        TDOMVendorList.Count
 0058A3C1    mov         esi,eax
 0058A3C3    dec         esi
 0058A3C4    test        esi,esi
>0058A3C6    jl          0058A3F4
 0058A3C8    inc         esi
 0058A3C9    xor         ebx,ebx
 0058A3CB    lea         edx,[ebp-0C]
 0058A3CE    mov         eax,dword ptr [edi+4]
 0058A3D1    mov         eax,dword ptr [eax+ebx*4]
 0058A3D4    mov         ecx,dword ptr [eax]
 0058A3D6    call        dword ptr [ecx]
 0058A3D8    mov         edx,dword ptr [ebp-0C]
 0058A3DB    mov         eax,dword ptr [ebp-4]
 0058A3DE    call        @UStrEqual
>0058A3E3    jne         0058A3F0
 0058A3E5    mov         eax,dword ptr [edi+4]
 0058A3E8    mov         eax,dword ptr [eax+ebx*4]
 0058A3EB    mov         dword ptr [ebp-8],eax
>0058A3EE    jmp         0058A3F4
 0058A3F0    inc         ebx
 0058A3F1    dec         esi
>0058A3F2    jne         0058A3CB
 0058A3F4    xor         eax,eax
 0058A3F6    pop         edx
 0058A3F7    pop         ecx
 0058A3F8    pop         ecx
 0058A3F9    mov         dword ptr fs:[eax],edx
 0058A3FC    push        58A411
 0058A401    lea         eax,[ebp-0C]
 0058A404    call        @UStrClr
 0058A409    ret
>0058A40A    jmp         @HandleFinally
>0058A40F    jmp         0058A401
 0058A411    mov         eax,dword ptr [ebp-8]
 0058A414    pop         edi
 0058A415    pop         esi
 0058A416    pop         ebx
 0058A417    mov         esp,ebp
 0058A419    pop         ebp
 0058A41A    ret
*}
end;

//0058A41C
procedure TDOMVendorList.Add(Vendor:TDOMVendor);
begin
{*
 0058A41C    push        ebp
 0058A41D    mov         ebp,esp
 0058A41F    xor         ecx,ecx
 0058A421    push        ecx
 0058A422    push        ecx
 0058A423    push        ecx
 0058A424    push        ecx
 0058A425    push        ecx
 0058A426    push        ebx
 0058A427    push        esi
 0058A428    push        edi
 0058A429    mov         edi,edx
 0058A42B    mov         ebx,eax
 0058A42D    xor         eax,eax
 0058A42F    push        ebp
 0058A430    push        58A4D9
 0058A435    push        dword ptr fs:[eax]
 0058A438    mov         dword ptr fs:[eax],esp
 0058A43B    lea         edx,[ebp-4]
 0058A43E    mov         eax,edi
 0058A440    mov         ecx,dword ptr [eax]
 0058A442    call        dword ptr [ecx]
 0058A444    mov         edx,dword ptr [ebp-4]
 0058A447    mov         eax,ebx
 0058A449    call        TDOMVendorList.Find
 0058A44E    test        eax,eax
>0058A450    je          0058A48C
 0058A452    lea         edx,[ebp-10]
 0058A455    mov         eax,edi
 0058A457    mov         ecx,dword ptr [eax]
 0058A459    call        dword ptr [ecx]
 0058A45B    mov         eax,dword ptr [ebp-10]
 0058A45E    mov         dword ptr [ebp-0C],eax
 0058A461    mov         byte ptr [ebp-8],11
 0058A465    lea         eax,[ebp-0C]
 0058A468    push        eax
 0058A469    push        0
 0058A46B    lea         edx,[ebp-14]
 0058A46E    mov         eax,[0078D660];^SResString583:TResStringRec
 0058A473    call        LoadResString
 0058A478    mov         ecx,dword ptr [ebp-14]
 0058A47B    mov         dl,1
 0058A47D    mov         eax,[00418C04];Exception
 0058A482    call        Exception.CreateFmt
 0058A487    call        @RaiseExcept
 0058A48C    mov         eax,dword ptr [ebx+4]
 0058A48F    call        @DynArrayLength
 0058A494    mov         esi,eax
 0058A496    lea         eax,[esi+1]
 0058A499    push        eax
 0058A49A    lea         eax,[ebx+4]
 0058A49D    mov         ecx,1
 0058A4A2    mov         edx,dword ptr ds:[589D6C];TDOMVendorArray
 0058A4A8    call        @DynArraySetLength
 0058A4AD    add         esp,4
 0058A4B0    mov         eax,dword ptr [ebx+4]
 0058A4B3    mov         dword ptr [eax+esi*4],edi
 0058A4B6    xor         eax,eax
 0058A4B8    pop         edx
 0058A4B9    pop         ecx
 0058A4BA    pop         ecx
 0058A4BB    mov         dword ptr fs:[eax],edx
 0058A4BE    push        58A4E0
 0058A4C3    lea         eax,[ebp-14]
 0058A4C6    mov         edx,2
 0058A4CB    call        @UStrArrayClr
 0058A4D0    lea         eax,[ebp-4]
 0058A4D3    call        @UStrClr
 0058A4D8    ret
>0058A4D9    jmp         @HandleFinally
>0058A4DE    jmp         0058A4C3
 0058A4E0    pop         edi
 0058A4E1    pop         esi
 0058A4E2    pop         ebx
 0058A4E3    mov         esp,ebp
 0058A4E5    pop         ebp
 0058A4E6    ret
*}
end;

//0058A4E8
procedure TDOMVendorList.Remove(Vendor:TDOMVendor);
begin
{*
 0058A4E8    push        ebx
 0058A4E9    push        esi
 0058A4EA    push        edi
 0058A4EB    mov         edi,edx
 0058A4ED    mov         ebx,eax
 0058A4EF    mov         eax,ebx
 0058A4F1    call        TDOMVendorList.Count
 0058A4F6    mov         esi,eax
 0058A4F8    mov         eax,ebx
 0058A4FA    call        TDOMVendorList.Count
 0058A4FF    mov         edx,eax
 0058A501    dec         edx
 0058A502    test        edx,edx
>0058A504    jl          0058A519
 0058A506    inc         edx
 0058A507    xor         eax,eax
 0058A509    mov         ecx,dword ptr [ebx+4]
 0058A50C    cmp         edi,dword ptr [ecx+eax*4]
>0058A50F    jne         0058A515
 0058A511    mov         esi,eax
>0058A513    jmp         0058A519
 0058A515    inc         eax
 0058A516    dec         edx
>0058A517    jne         0058A509
 0058A519    mov         eax,ebx
 0058A51B    call        TDOMVendorList.Count
 0058A520    cmp         esi,eax
>0058A522    jge         0058A569
 0058A524    mov         eax,esi
 0058A526    push        eax
 0058A527    mov         eax,ebx
 0058A529    call        TDOMVendorList.Count
 0058A52E    mov         edx,eax
 0058A530    sub         edx,2
 0058A533    pop         eax
 0058A534    sub         edx,eax
>0058A536    jl          0058A54A
 0058A538    inc         edx
 0058A539    mov         ecx,dword ptr [ebx+4]
 0058A53C    mov         ecx,dword ptr [ecx+eax*4+4]
 0058A540    mov         esi,dword ptr [ebx+4]
 0058A543    mov         dword ptr [esi+eax*4],ecx
 0058A546    inc         eax
 0058A547    dec         edx
>0058A548    jne         0058A539
 0058A54A    mov         eax,ebx
 0058A54C    call        TDOMVendorList.Count
 0058A551    dec         eax
 0058A552    push        eax
 0058A553    lea         eax,[ebx+4]
 0058A556    mov         ecx,1
 0058A55B    mov         edx,dword ptr ds:[589D6C];TDOMVendorArray
 0058A561    call        @DynArraySetLength
 0058A566    add         esp,4
 0058A569    pop         edi
 0058A56A    pop         esi
 0058A56B    pop         ebx
 0058A56C    ret
*}
end;

//0058A570
function TDOMVendorList.GetVendors(Index:Integer):TDOMVendor;
begin
{*
 0058A570    mov         eax,dword ptr [eax+4]
 0058A573    mov         eax,dword ptr [eax+edx*4]
 0058A576    ret
*}
end;

//0058A578
constructor EDOMParseError.Create(Msg:string);
begin
{*
 0058A578    push        ebp
 0058A579    mov         ebp,esp
 0058A57B    push        ebx
 0058A57C    push        esi
 0058A57D    push        edi
 0058A57E    test        dl,dl
>0058A580    je          0058A58A
 0058A582    add         esp,0FFFFFFF0
 0058A585    call        @ClassCreate
 0058A58A    mov         esi,ecx
 0058A58C    mov         ebx,edx
 0058A58E    mov         edi,eax
 0058A590    lea         eax,[edi+18]
 0058A593    mov         edx,esi
 0058A595    call        @IntfCopy
 0058A59A    mov         ecx,dword ptr [ebp+8]
 0058A59D    xor         edx,edx
 0058A59F    mov         eax,edi
 0058A5A1    call        Exception.Create
 0058A5A6    mov         eax,edi
 0058A5A8    test        bl,bl
>0058A5AA    je          0058A5BB
 0058A5AC    call        @AfterConstruction
 0058A5B1    pop         dword ptr fs:[0]
 0058A5B8    add         esp,0C
 0058A5BB    mov         eax,edi
 0058A5BD    pop         edi
 0058A5BE    pop         esi
 0058A5BF    pop         ebx
 0058A5C0    pop         ebp
 0058A5C1    ret         4
*}
end;

//0058A5C4
function EDOMParseError.GetErrorCode:Integer;
begin
{*
 0058A5C4    push        ecx
 0058A5C5    push        esp
 0058A5C6    mov         eax,dword ptr [eax+18]
 0058A5C9    push        eax
 0058A5CA    mov         eax,dword ptr [eax]
 0058A5CC    call        dword ptr [eax+0C]
 0058A5CF    call        @CheckAutoResult
 0058A5D4    mov         eax,dword ptr [esp]
 0058A5D7    pop         edx
 0058A5D8    ret
*}
end;

//0058A5DC
function EDOMParseError.GetFilePos:Integer;
begin
{*
 0058A5DC    push        ecx
 0058A5DD    push        esp
 0058A5DE    mov         eax,dword ptr [eax+18]
 0058A5E1    push        eax
 0058A5E2    mov         eax,dword ptr [eax]
 0058A5E4    call        dword ptr [eax+24]
 0058A5E7    call        @CheckAutoResult
 0058A5EC    mov         eax,dword ptr [esp]
 0058A5EF    pop         edx
 0058A5F0    ret
*}
end;

//0058A5F4
function EDOMParseError.GetLine:Integer;
begin
{*
 0058A5F4    push        ecx
 0058A5F5    push        esp
 0058A5F6    mov         eax,dword ptr [eax+18]
 0058A5F9    push        eax
 0058A5FA    mov         eax,dword ptr [eax]
 0058A5FC    call        dword ptr [eax+1C]
 0058A5FF    call        @CheckAutoResult
 0058A604    mov         eax,dword ptr [esp]
 0058A607    pop         edx
 0058A608    ret
*}
end;

//0058A60C
function EDOMParseError.GetLinePos:Integer;
begin
{*
 0058A60C    push        ecx
 0058A60D    push        esp
 0058A60E    mov         eax,dword ptr [eax+18]
 0058A611    push        eax
 0058A612    mov         eax,dword ptr [eax]
 0058A614    call        dword ptr [eax+20]
 0058A617    call        @CheckAutoResult
 0058A61C    mov         eax,dword ptr [esp]
 0058A61F    pop         edx
 0058A620    ret
*}
end;

//0058A624
function EDOMParseError.GetReason:UnicodeString;
begin
{*
 0058A624    push        ebx
 0058A625    push        esi
 0058A626    mov         esi,edx
 0058A628    mov         ebx,eax
 0058A62A    mov         eax,esi
 0058A62C    call        @UStrClr
 0058A631    push        eax
 0058A632    mov         eax,dword ptr [ebx+18]
 0058A635    push        eax
 0058A636    mov         eax,dword ptr [eax]
 0058A638    call        dword ptr [eax+14]
 0058A63B    call        @CheckAutoResult
 0058A640    pop         esi
 0058A641    pop         ebx
 0058A642    ret
*}
end;

//0058A644
function EDOMParseError.GetSrcText:UnicodeString;
begin
{*
 0058A644    push        ebx
 0058A645    push        esi
 0058A646    mov         esi,edx
 0058A648    mov         ebx,eax
 0058A64A    mov         eax,esi
 0058A64C    call        @UStrClr
 0058A651    push        eax
 0058A652    mov         eax,dword ptr [ebx+18]
 0058A655    push        eax
 0058A656    mov         eax,dword ptr [eax]
 0058A658    call        dword ptr [eax+18]
 0058A65B    call        @CheckAutoResult
 0058A660    pop         esi
 0058A661    pop         ebx
 0058A662    ret
*}
end;

//0058A664
function EDOMParseError.GetURL:UnicodeString;
begin
{*
 0058A664    push        ebx
 0058A665    push        esi
 0058A666    mov         esi,edx
 0058A668    mov         ebx,eax
 0058A66A    mov         eax,esi
 0058A66C    call        @UStrClr
 0058A671    push        eax
 0058A672    mov         eax,dword ptr [ebx+18]
 0058A675    push        eax
 0058A676    mov         eax,dword ptr [eax]
 0058A678    call        dword ptr [eax+10]
 0058A67B    call        @CheckAutoResult
 0058A680    pop         esi
 0058A681    pop         ebx
 0058A682    ret
*}
end;

Initialization
//00781498
{*
 00781498    push        ebp
 00781499    mov         ebp,esp
 0078149B    xor         eax,eax
 0078149D    push        ebp
 0078149E    push        7814BE
 007814A3    push        dword ptr fs:[eax]
 007814A6    mov         dword ptr fs:[eax],esp
 007814A9    sub         dword ptr ds:[815578],1
 007814B0    xor         eax,eax
 007814B2    pop         edx
 007814B3    pop         ecx
 007814B4    pop         ecx
 007814B5    mov         dword ptr fs:[eax],edx
 007814B8    push        7814C5
 007814BD    ret
>007814BE    jmp         @HandleFinally
>007814C3    jmp         007814BD
 007814C5    pop         ebp
 007814C6    ret
*}
Finalization
//0058A684
{*
 0058A684    push        ebp
 0058A685    mov         ebp,esp
 0058A687    xor         eax,eax
 0058A689    push        ebp
 0058A68A    push        58A6C7
 0058A68F    push        dword ptr fs:[eax]
 0058A692    mov         dword ptr fs:[eax],esp
 0058A695    inc         dword ptr ds:[815578]
>0058A69B    jne         0058A6B9
 0058A69D    mov         eax,[00815574];DOMVendors:TDOMVendorList
 0058A6A2    xor         edx,edx
 0058A6A4    mov         dword ptr ds:[815574],edx;DOMVendors:TDOMVendorList
 0058A6AA    call        TObject.Free
 0058A6AF    mov         eax,815570;DefaultDOMVendor:UnicodeString
 0058A6B4    call        @UStrClr
 0058A6B9    xor         eax,eax
 0058A6BB    pop         edx
 0058A6BC    pop         ecx
 0058A6BD    pop         ecx
 0058A6BE    mov         dword ptr fs:[eax],edx
 0058A6C1    push        58A6CE
 0058A6C6    ret
>0058A6C7    jmp         @HandleFinally
>0058A6CC    jmp         0058A6C6
 0058A6CE    pop         ebp
 0058A6CF    ret
*}
end.