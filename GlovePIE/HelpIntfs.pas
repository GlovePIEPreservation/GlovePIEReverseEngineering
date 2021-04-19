//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit HelpIntfs;

interface

uses
  SysUtils, Classes;

type
  EHelpSystemException = class(Exception)
  end;
  THelpManager = class(TInterfacedObject)
  published
    procedure ShowSearch(Topic:string; HelpFileName:string);//004AA574
    procedure ShowTopicHelp(Topic:string; Anchor:string; HelpFileName:string);//004AA6D4
    function UnderstandsKeyword(HelpKeyword:string; HelpFileName:string):Boolean;//004AA2D4
    procedure ShowIndex(Topic:string; HelpFileName:string);//004AA414
    function GetFilter:string;//004AA7E0
    function GetHelpFile:string;//004AA9B0
    procedure Release(ViewerID:Integer);//004AA9C4
    procedure SetFilter(Filter:string);//004AA8C8
    function GetHandle:Integer;//004AA9AC
    function RegisterViewer(newViewer:ICustomHelpViewer):IHelpManager;//004A9824
    procedure ShowHelp(HelpKeyword:string; HelpFileName:string);//004A9A5C
    constructor Create();//004A9748
    destructor Destroy();//004A97AC
    procedure ShowContextHelp(ContextID:Integer; HelpFileName:string);//004A9D98
    procedure AssignHelpSelector(Selector:IHelpSelector);//004AA23C
    function Hook(Handle:Integer; HelpFile:string; Data:Integer; Command:Word):Boolean;//004AA250
    procedure ShowTableOfContents;//004AA050
    procedure ShowTopicHelp(Topic:string; HelpFileName:string);//004AA15C
  public
    FHelpSelector:IHelpSelector;//fC
    FViewerList:TList;//f10
    FExtendedViewerList:TList;//f14
    FMinCookie:Integer;//f18
    FHandle:Integer;//f1C
    FHelpFile:string;//f20
    function SelectViewer(ViewerNames:TStringList):ICustomHelpViewer;//004A98F4
    procedure DoSoftShutDown;//004A9964
    function CallSpecialWinHelp(Handle:LongInt; const HelpFile:UnicodeString; Command:Word; Data:LongInt):Boolean;//004A9994
  end;
  THelpViewerNode = class(TObject)
  published
    constructor Create;//004A9704
  public
    FViewer:ICustomHelpViewer;//f4
    FViewerID:Integer;//f8
  end;
    procedure EnsureHelpManager;//004A9698
    function GetHelpSystem(var System:IHelpSystem):Boolean;//004A96C4
    procedure DefaultContextHelp(const ContextId:LongInt; const HelpFileName:UnicodeString);//004A9D04

implementation

//004A9698
procedure EnsureHelpManager;
begin
{*
 004A9698    cmp         dword ptr ds:[793240],0
>004A969F    jne         004A96C0
 004A96A1    mov         dl,1
 004A96A3    mov         eax,[004A8E2C];THelpManager
 004A96A8    call        THelpManager.Create
 004A96AD    mov         edx,eax
 004A96AF    test        edx,edx
>004A96B1    je          004A96B6
 004A96B3    sub         edx,0FFFFFFDC
 004A96B6    mov         eax,793240
 004A96BB    call        @IntfCopy
 004A96C0    ret
*}
end;

//004A96C4
function GetHelpSystem(var System:IHelpSystem):Boolean;
begin
{*
 004A96C4    push        ebp
 004A96C5    mov         ebp,esp
 004A96C7    push        ebx
 004A96C8    mov         ebx,eax
 004A96CA    test        ebx,ebx
>004A96CC    je          004A96D2
 004A96CE    xor         eax,eax
 004A96D0    mov         dword ptr [ebx],eax
 004A96D2    call        EnsureHelpManager
 004A96D7    mov         eax,ebx
 004A96D9    mov         edx,dword ptr ds:[793240]
 004A96DF    mov         ecx,4A96F4
 004A96E4    call        @IntfCast
 004A96E9    cmp         dword ptr [ebx],0
 004A96EC    setne       al
 004A96EF    pop         ebx
 004A96F0    pop         ebp
 004A96F1    ret
*}
end;

//004A9704
constructor THelpViewerNode.Create;
begin
{*
 004A9704    push        ebx
 004A9705    push        esi
 004A9706    push        edi
 004A9707    test        dl,dl
>004A9709    je          004A9713
 004A970B    add         esp,0FFFFFFF0
 004A970E    call        @ClassCreate
 004A9713    mov         esi,ecx
 004A9715    mov         ebx,edx
 004A9717    mov         edi,eax
 004A9719    xor         edx,edx
 004A971B    mov         eax,edi
 004A971D    call        TObject.Create
 004A9722    lea         eax,[edi+4]
 004A9725    mov         edx,esi
 004A9727    call        @IntfCopy
 004A972C    mov         eax,edi
 004A972E    test        bl,bl
>004A9730    je          004A9741
 004A9732    call        @AfterConstruction
 004A9737    pop         dword ptr fs:[0]
 004A973E    add         esp,0C
 004A9741    mov         eax,edi
 004A9743    pop         edi
 004A9744    pop         esi
 004A9745    pop         ebx
 004A9746    ret
*}
end;

//004A9748
constructor THelpManager.Create();
begin
{*
 004A9748    push        ebx
 004A9749    push        esi
 004A974A    test        dl,dl
>004A974C    je          004A9756
 004A974E    add         esp,0FFFFFFF0
 004A9751    call        @ClassCreate
 004A9756    mov         ebx,edx
 004A9758    mov         esi,eax
 004A975A    xor         edx,edx
 004A975C    mov         eax,esi
 004A975E    call        TObject.Create
 004A9763    mov         dl,1
 004A9765    mov         eax,[00439644];TList
 004A976A    call        TObject.Create
 004A976F    mov         dword ptr [esi+10],eax
 004A9772    mov         dl,1
 004A9774    mov         eax,[00439644];TList
 004A9779    call        TObject.Create
 004A977E    mov         dword ptr [esi+14],eax
 004A9781    lea         eax,[esi+20]
 004A9784    call        @UStrClr
 004A9789    mov         dword ptr [esi+18],1
 004A9790    mov         eax,esi
 004A9792    test        bl,bl
>004A9794    je          004A97A5
 004A9796    call        @AfterConstruction
 004A979B    pop         dword ptr fs:[0]
 004A97A2    add         esp,0C
 004A97A5    mov         eax,esi
 004A97A7    pop         esi
 004A97A8    pop         ebx
 004A97A9    ret
*}
end;

//004A97AC
destructor THelpManager.Destroy();
begin
{*
 004A97AC    push        ebx
 004A97AD    push        esi
 004A97AE    push        edi
 004A97AF    push        ebp
 004A97B0    call        @BeforeDestruction
 004A97B5    mov         ebx,edx
 004A97B7    mov         ebp,eax
 004A97B9    mov         eax,dword ptr [ebp+10]
 004A97BC    mov         edi,dword ptr [eax+8]
 004A97BF    dec         edi
 004A97C0    test        edi,edi
>004A97C2    jl          004A97E7
 004A97C4    inc         edi
 004A97C5    mov         esi,dword ptr [ebp+10]
 004A97C8    mov         edx,dword ptr [esi+8]
 004A97CB    dec         edx
 004A97CC    mov         eax,esi
 004A97CE    call        TList.Get
 004A97D3    mov         esi,eax
 004A97D5    mov         eax,dword ptr [esi+4]
 004A97D8    mov         edx,dword ptr [eax]
 004A97DA    call        dword ptr [edx+2C]
 004A97DD    mov         eax,esi
 004A97DF    call        TObject.Free
 004A97E4    dec         edi
>004A97E5    jne         004A97C5
 004A97E7    cmp         dword ptr [ebp+0C],0
>004A97EB    je          004A97F5
 004A97ED    lea         eax,[ebp+0C]
 004A97F0    call        @IntfClear
 004A97F5    mov         eax,dword ptr [ebp+14]
 004A97F8    call        TObject.Free
 004A97FD    mov         eax,dword ptr [ebp+10]
 004A9800    call        TObject.Free
 004A9805    mov         edx,ebx
 004A9807    and         dl,0FC
 004A980A    mov         eax,ebp
 004A980C    call        TObject.Destroy
 004A9811    test        bl,bl
>004A9813    jle         004A981C
 004A9815    mov         eax,ebp
 004A9817    call        @ClassDestroy
 004A981C    pop         ebp
 004A981D    pop         edi
 004A981E    pop         esi
 004A981F    pop         ebx
 004A9820    ret
*}
end;

//004A9824
function THelpManager.RegisterViewer(newViewer:ICustomHelpViewer):IHelpManager;
begin
{*
 004A9824    push        ebp
 004A9825    mov         ebp,esp
 004A9827    add         esp,0FFFFFFF8
 004A982A    push        ebx
 004A982B    push        esi
 004A982C    push        edi
 004A982D    xor         ebx,ebx
 004A982F    mov         dword ptr [ebp-4],ebx
 004A9832    mov         dword ptr [ebp-8],ecx
 004A9835    mov         edi,edx
 004A9837    mov         ebx,eax
 004A9839    xor         eax,eax
 004A983B    push        ebp
 004A983C    push        4A98C4
 004A9841    push        dword ptr fs:[eax]
 004A9844    mov         dword ptr fs:[eax],esp
 004A9847    mov         ecx,edi
 004A9849    mov         dl,1
 004A984B    mov         eax,[004A9528];THelpViewerNode
 004A9850    call        THelpViewerNode.Create
 004A9855    mov         esi,eax
 004A9857    mov         eax,dword ptr [ebx+18]
 004A985A    mov         dword ptr [esi+8],eax
 004A985D    mov         edx,esi
 004A985F    mov         eax,dword ptr [ebx+10]
 004A9862    call        TList.Add
 004A9867    mov         edx,dword ptr [ebx+18]
 004A986A    mov         eax,edi
 004A986C    mov         ecx,dword ptr [eax]
 004A986E    call        dword ptr [ecx+24]
 004A9871    lea         eax,[ebp-4]
 004A9874    call        @IntfClear
 004A9879    mov         ecx,eax
 004A987B    mov         edx,4A98D4
 004A9880    mov         eax,edi
 004A9882    call        Supports
 004A9887    test        al,al
>004A9889    je          004A9895
 004A988B    mov         edx,esi
 004A988D    mov         eax,dword ptr [ebx+14]
 004A9890    call        TList.Add
 004A9895    inc         dword ptr [ebx+18]
 004A9898    mov         eax,dword ptr [ebp-8]
 004A989B    mov         edx,ebx
 004A989D    test        edx,edx
>004A989F    je          004A98A4
 004A98A1    sub         edx,0FFFFFFF8
 004A98A4    mov         ecx,4A98E4
 004A98A9    call        @IntfCast
 004A98AE    xor         eax,eax
 004A98B0    pop         edx
 004A98B1    pop         ecx
 004A98B2    pop         ecx
 004A98B3    mov         dword ptr fs:[eax],edx
 004A98B6    push        4A98CB
 004A98BB    lea         eax,[ebp-4]
 004A98BE    call        @IntfClear
 004A98C3    ret
>004A98C4    jmp         @HandleFinally
>004A98C9    jmp         004A98BB
 004A98CB    pop         edi
 004A98CC    pop         esi
 004A98CD    pop         ebx
 004A98CE    pop         ecx
 004A98CF    pop         ecx
 004A98D0    pop         ebp
 004A98D1    ret
*}
end;

//004A98F4
function THelpManager.SelectViewer(ViewerNames:TStringList):ICustomHelpViewer;
begin
{*
 004A98F4    push        ebx
 004A98F5    push        esi
 004A98F6    push        edi
 004A98F7    mov         edi,ecx
 004A98F9    mov         ebx,edx
 004A98FB    mov         esi,eax
 004A98FD    mov         eax,edi
 004A98FF    call        @IntfClear
 004A9904    mov         eax,ebx
 004A9906    mov         edx,dword ptr [eax]
 004A9908    call        dword ptr [edx+14]
 004A990B    dec         eax
>004A990C    jne         004A9923
 004A990E    xor         edx,edx
 004A9910    mov         eax,ebx
 004A9912    mov         ecx,dword ptr [eax]
 004A9914    call        dword ptr [ecx+18]
 004A9917    mov         edx,dword ptr [eax+4]
 004A991A    mov         eax,edi
 004A991C    call        @IntfCopy
>004A9921    jmp         004A995D
 004A9923    mov         eax,ebx
 004A9925    mov         edx,dword ptr [eax]
 004A9927    call        dword ptr [edx+14]
 004A992A    test        eax,eax
>004A992C    jle         004A995D
 004A992E    cmp         dword ptr [esi+0C],0
>004A9932    je          004A995D
 004A9934    mov         eax,ebx
 004A9936    mov         edx,dword ptr [eax]
 004A9938    call        dword ptr [edx+0A0]
 004A993E    mov         edx,ebx
 004A9940    mov         eax,dword ptr [esi+0C]
 004A9943    mov         ecx,dword ptr [eax]
 004A9945    call        dword ptr [ecx+10]
 004A9948    mov         esi,eax
 004A994A    mov         edx,esi
 004A994C    mov         eax,ebx
 004A994E    mov         ecx,dword ptr [eax]
 004A9950    call        dword ptr [ecx+18]
 004A9953    mov         edx,dword ptr [eax+4]
 004A9956    mov         eax,edi
 004A9958    call        @IntfCopy
 004A995D    pop         edi
 004A995E    pop         esi
 004A995F    pop         ebx
 004A9960    ret
*}
end;

//004A9964
procedure THelpManager.DoSoftShutDown;
begin
{*
 004A9964    push        ebx
 004A9965    push        esi
 004A9966    push        edi
 004A9967    mov         edi,eax
 004A9969    mov         eax,dword ptr [edi+10]
 004A996C    mov         ebx,dword ptr [eax+8]
 004A996F    dec         ebx
 004A9970    test        ebx,ebx
>004A9972    jl          004A998D
 004A9974    inc         ebx
 004A9975    xor         esi,esi
 004A9977    mov         eax,dword ptr [edi+10]
 004A997A    mov         edx,esi
 004A997C    call        TList.Get
 004A9981    mov         eax,dword ptr [eax+4]
 004A9984    mov         edx,dword ptr [eax]
 004A9986    call        dword ptr [edx+28]
 004A9989    inc         esi
 004A998A    dec         ebx
>004A998B    jne         004A9977
 004A998D    pop         edi
 004A998E    pop         esi
 004A998F    pop         ebx
 004A9990    ret
*}
end;

//004A9994
function THelpManager.CallSpecialWinHelp(Handle:LongInt; const HelpFile:UnicodeString; Command:Word; Data:LongInt):Boolean;
begin
{*
 004A9994    push        ebp
 004A9995    mov         ebp,esp
 004A9997    add         esp,0FFFFFFF0
 004A999A    push        ebx
 004A999B    push        esi
 004A999C    push        edi
 004A999D    xor         ebx,ebx
 004A999F    mov         dword ptr [ebp-4],ebx
 004A99A2    mov         dword ptr [ebp-0C],ecx
 004A99A5    mov         dword ptr [ebp-8],edx
 004A99A8    mov         edi,eax
 004A99AA    xor         eax,eax
 004A99AC    push        ebp
 004A99AD    push        4A9A38
 004A99B2    push        dword ptr fs:[eax]
 004A99B5    mov         dword ptr fs:[eax],esp
 004A99B8    mov         byte ptr [ebp-0D],0
 004A99BC    cmp         dword ptr [ebp-0C],0
>004A99C0    je          004A99CD
 004A99C2    lea         eax,[edi+20]
 004A99C5    mov         edx,dword ptr [ebp-0C]
 004A99C8    call        @UStrAsg
 004A99CD    mov         eax,dword ptr [edi+10]
 004A99D0    mov         ebx,dword ptr [eax+8]
 004A99D3    dec         ebx
 004A99D4    test        ebx,ebx
>004A99D6    jl          004A9A22
 004A99D8    inc         ebx
 004A99D9    xor         esi,esi
 004A99DB    mov         eax,dword ptr [edi+10]
 004A99DE    mov         edx,esi
 004A99E0    call        TList.Get
 004A99E5    mov         eax,dword ptr [eax+4]
 004A99E8    push        eax
 004A99E9    lea         eax,[ebp-4]
 004A99EC    call        @IntfClear
 004A99F1    mov         ecx,eax
 004A99F3    mov         edx,4A9A4C
 004A99F8    pop         eax
 004A99F9    call        Supports
 004A99FE    test        al,al
>004A9A00    je          004A9A1E
 004A9A02    movzx       eax,word ptr [ebp+0C]
 004A9A06    push        eax
 004A9A07    mov         eax,dword ptr [ebp+8]
 004A9A0A    push        eax
 004A9A0B    mov         ecx,dword ptr [ebp-0C]
 004A9A0E    mov         edx,dword ptr [ebp-8]
 004A9A11    mov         eax,dword ptr [ebp-4]
 004A9A14    mov         ebx,dword ptr [eax]
 004A9A16    call        dword ptr [ebx+40]
 004A9A19    mov         byte ptr [ebp-0D],al
>004A9A1C    jmp         004A9A22
 004A9A1E    inc         esi
 004A9A1F    dec         ebx
>004A9A20    jne         004A99DB
 004A9A22    xor         eax,eax
 004A9A24    pop         edx
 004A9A25    pop         ecx
 004A9A26    pop         ecx
 004A9A27    mov         dword ptr fs:[eax],edx
 004A9A2A    push        4A9A3F
 004A9A2F    lea         eax,[ebp-4]
 004A9A32    call        @IntfClear
 004A9A37    ret
>004A9A38    jmp         @HandleFinally
>004A9A3D    jmp         004A9A2F
 004A9A3F    movzx       eax,byte ptr [ebp-0D]
 004A9A43    pop         edi
 004A9A44    pop         esi
 004A9A45    pop         ebx
 004A9A46    mov         esp,ebp
 004A9A48    pop         ebp
 004A9A49    ret         8
*}
end;

//004A9A5C
procedure THelpManager.ShowHelp(HelpKeyword:string; HelpFileName:string);
begin
{*
 004A9A5C    push        ebp
 004A9A5D    mov         ebp,esp
 004A9A5F    add         esp,0FFFFFFD0
 004A9A62    push        ebx
 004A9A63    push        esi
 004A9A64    push        edi
 004A9A65    xor         ebx,ebx
 004A9A67    mov         dword ptr [ebp-30],ebx
 004A9A6A    mov         dword ptr [ebp-4],ebx
 004A9A6D    mov         ebx,ecx
 004A9A6F    mov         dword ptr [ebp-0C],edx
 004A9A72    mov         dword ptr [ebp-8],eax
 004A9A75    xor         eax,eax
 004A9A77    push        ebp
 004A9A78    push        4A9CF4
 004A9A7D    push        dword ptr fs:[eax]
 004A9A80    mov         dword ptr fs:[eax],esp
 004A9A83    test        ebx,ebx
>004A9A85    je          004A9A94
 004A9A87    mov         eax,dword ptr [ebp-8]
 004A9A8A    add         eax,20
 004A9A8D    mov         edx,ebx
 004A9A8F    call        @UStrAsg
 004A9A94    mov         eax,dword ptr [ebp-8]
 004A9A97    mov         eax,dword ptr [eax+10]
 004A9A9A    cmp         dword ptr [eax+8],0
>004A9A9E    jle         004A9CD6
 004A9AA4    mov         dl,1
 004A9AA6    mov         eax,[00439644];TList
 004A9AAB    call        TObject.Create
 004A9AB0    mov         dword ptr [ebp-20],eax
 004A9AB3    xor         edx,edx
 004A9AB5    push        ebp
 004A9AB6    push        4A9CCF
 004A9ABB    push        dword ptr fs:[edx]
 004A9ABE    mov         dword ptr fs:[edx],esp
 004A9AC1    mov         eax,dword ptr [ebp-8]
 004A9AC4    mov         eax,dword ptr [eax+10]
 004A9AC7    mov         eax,dword ptr [eax+8]
 004A9ACA    dec         eax
 004A9ACB    test        eax,eax
>004A9ACD    jl          004A9B0B
 004A9ACF    inc         eax
 004A9AD0    mov         dword ptr [ebp-24],eax
 004A9AD3    mov         dword ptr [ebp-10],0
 004A9ADA    mov         eax,dword ptr [ebp-8]
 004A9ADD    mov         eax,dword ptr [eax+10]
 004A9AE0    mov         edx,dword ptr [ebp-10]
 004A9AE3    call        TList.Get
 004A9AE8    mov         ebx,eax
 004A9AEA    mov         eax,dword ptr [ebx+4]
 004A9AED    mov         edx,dword ptr [ebp-0C]
 004A9AF0    mov         ecx,dword ptr [eax]
 004A9AF2    call        dword ptr [ecx+10]
 004A9AF5    test        eax,eax
>004A9AF7    jle         004A9B03
 004A9AF9    mov         edx,ebx
 004A9AFB    mov         eax,dword ptr [ebp-20]
 004A9AFE    call        TList.Add
 004A9B03    inc         dword ptr [ebp-10]
 004A9B06    dec         dword ptr [ebp-24]
>004A9B09    jne         004A9ADA
 004A9B0B    mov         eax,dword ptr [ebp-20]
 004A9B0E    mov         eax,dword ptr [eax+8]
 004A9B11    test        eax,eax
>004A9B13    jne         004A9B46
 004A9B15    mov         eax,dword ptr [ebp-0C]
 004A9B18    call        @UStrToPWChar
 004A9B1D    mov         dword ptr [ebp-2C],eax
 004A9B20    mov         byte ptr [ebp-28],0A
 004A9B24    lea         eax,[ebp-2C]
 004A9B27    push        eax
 004A9B28    push        0
 004A9B2A    mov         ecx,dword ptr ds:[78CBDC];^SResString176:TResStringRec
 004A9B30    mov         dl,1
 004A9B32    mov         eax,[004A8B5C];EHelpSystemException
 004A9B37    call        Exception.CreateResFmt
 004A9B3C    call        @RaiseExcept
>004A9B41    jmp         004A9CB9
 004A9B46    dec         eax
>004A9B47    jne         004A9B63
 004A9B49    xor         edx,edx
 004A9B4B    mov         eax,dword ptr [ebp-20]
 004A9B4E    call        TList.Get
 004A9B53    mov         eax,dword ptr [eax+4]
 004A9B56    mov         edx,dword ptr [ebp-0C]
 004A9B59    mov         ecx,dword ptr [eax]
 004A9B5B    call        dword ptr [ecx+20]
>004A9B5E    jmp         004A9CB9
 004A9B63    mov         dl,1
 004A9B65    mov         eax,[0043C7BC];TStringList
 004A9B6A    call        TStringList.Create
 004A9B6F    mov         dword ptr [ebp-18],eax
 004A9B72    xor         eax,eax
 004A9B74    push        ebp
 004A9B75    push        4A9CB2
 004A9B7A    push        dword ptr fs:[eax]
 004A9B7D    mov         dword ptr fs:[eax],esp
 004A9B80    mov         eax,dword ptr [ebp-20]
 004A9B83    mov         eax,dword ptr [eax+8]
 004A9B86    dec         eax
 004A9B87    test        eax,eax
>004A9B89    jl          004A9C2A
 004A9B8F    inc         eax
 004A9B90    mov         dword ptr [ebp-24],eax
 004A9B93    mov         dword ptr [ebp-10],0
 004A9B9A    mov         edx,dword ptr [ebp-10]
 004A9B9D    mov         eax,dword ptr [ebp-20]
 004A9BA0    call        TList.Get
 004A9BA5    mov         ebx,eax
 004A9BA7    mov         eax,dword ptr [ebx+4]
 004A9BAA    mov         edx,dword ptr [ebp-0C]
 004A9BAD    mov         ecx,dword ptr [eax]
 004A9BAF    call        dword ptr [ecx+14]
 004A9BB2    mov         dword ptr [ebp-1C],eax
 004A9BB5    cmp         dword ptr [ebp-1C],0
>004A9BB9    je          004A9C1E
 004A9BBB    xor         eax,eax
 004A9BBD    push        ebp
 004A9BBE    push        4A9C17
 004A9BC3    push        dword ptr fs:[eax]
 004A9BC6    mov         dword ptr fs:[eax],esp
 004A9BC9    mov         eax,dword ptr [ebp-1C]
 004A9BCC    mov         edx,dword ptr [eax]
 004A9BCE    call        dword ptr [edx+14]
 004A9BD1    mov         esi,eax
 004A9BD3    dec         esi
 004A9BD4    test        esi,esi
>004A9BD6    jl          004A9C01
 004A9BD8    inc         esi
 004A9BD9    mov         dword ptr [ebp-14],0
 004A9BE0    lea         ecx,[ebp-30]
 004A9BE3    mov         edx,dword ptr [ebp-14]
 004A9BE6    mov         eax,dword ptr [ebp-1C]
 004A9BE9    mov         edi,dword ptr [eax]
 004A9BEB    call        dword ptr [edi+0C]
 004A9BEE    mov         edx,dword ptr [ebp-30]
 004A9BF1    mov         ecx,ebx
 004A9BF3    mov         eax,dword ptr [ebp-18]
 004A9BF6    mov         edi,dword ptr [eax]
 004A9BF8    call        dword ptr [edi+3C]
 004A9BFB    inc         dword ptr [ebp-14]
 004A9BFE    dec         esi
>004A9BFF    jne         004A9BE0
 004A9C01    xor         eax,eax
 004A9C03    pop         edx
 004A9C04    pop         ecx
 004A9C05    pop         ecx
 004A9C06    mov         dword ptr fs:[eax],edx
 004A9C09    push        4A9C1E
 004A9C0E    mov         eax,dword ptr [ebp-1C]
 004A9C11    call        TObject.Free
 004A9C16    ret
>004A9C17    jmp         @HandleFinally
>004A9C1C    jmp         004A9C0E
 004A9C1E    inc         dword ptr [ebp-10]
 004A9C21    dec         dword ptr [ebp-24]
>004A9C24    jne         004A9B9A
 004A9C2A    mov         eax,dword ptr [ebp-8]
 004A9C2D    cmp         dword ptr [eax+0C],0
>004A9C31    je          004A9C78
 004A9C33    mov         eax,dword ptr [ebp-18]
 004A9C36    mov         edx,dword ptr [eax]
 004A9C38    call        dword ptr [edx+0A0]
 004A9C3E    mov         eax,dword ptr [ebp-8]
 004A9C41    mov         eax,dword ptr [eax+0C]
 004A9C44    mov         edx,dword ptr [ebp-18]
 004A9C47    mov         ecx,dword ptr [eax]
 004A9C49    call        dword ptr [ecx+0C]
 004A9C4C    mov         ebx,eax
 004A9C4E    test        ebx,ebx
>004A9C50    jl          004A9C9C
 004A9C52    mov         edx,ebx
 004A9C54    mov         eax,dword ptr [ebp-18]
 004A9C57    mov         ecx,dword ptr [eax]
 004A9C59    call        dword ptr [ecx+18]
 004A9C5C    mov         esi,eax
 004A9C5E    lea         ecx,[ebp-4]
 004A9C61    mov         edx,ebx
 004A9C63    mov         eax,dword ptr [ebp-18]
 004A9C66    mov         ebx,dword ptr [eax]
 004A9C68    call        dword ptr [ebx+0C]
 004A9C6B    mov         eax,dword ptr [esi+4]
 004A9C6E    mov         edx,dword ptr [ebp-4]
 004A9C71    mov         ecx,dword ptr [eax]
 004A9C73    call        dword ptr [ecx+20]
>004A9C76    jmp         004A9C9C
 004A9C78    xor         edx,edx
 004A9C7A    mov         eax,dword ptr [ebp-18]
 004A9C7D    mov         ecx,dword ptr [eax]
 004A9C7F    call        dword ptr [ecx+18]
 004A9C82    mov         esi,eax
 004A9C84    lea         ecx,[ebp-4]
 004A9C87    xor         edx,edx
 004A9C89    mov         eax,dword ptr [ebp-18]
 004A9C8C    mov         ebx,dword ptr [eax]
 004A9C8E    call        dword ptr [ebx+0C]
 004A9C91    mov         eax,dword ptr [esi+4]
 004A9C94    mov         edx,dword ptr [ebp-4]
 004A9C97    mov         ecx,dword ptr [eax]
 004A9C99    call        dword ptr [ecx+20]
 004A9C9C    xor         eax,eax
 004A9C9E    pop         edx
 004A9C9F    pop         ecx
 004A9CA0    pop         ecx
 004A9CA1    mov         dword ptr fs:[eax],edx
 004A9CA4    push        4A9CB9
 004A9CA9    mov         eax,dword ptr [ebp-18]
 004A9CAC    call        TObject.Free
 004A9CB1    ret
>004A9CB2    jmp         @HandleFinally
>004A9CB7    jmp         004A9CA9
 004A9CB9    xor         eax,eax
 004A9CBB    pop         edx
 004A9CBC    pop         ecx
 004A9CBD    pop         ecx
 004A9CBE    mov         dword ptr fs:[eax],edx
 004A9CC1    push        4A9CD6
 004A9CC6    mov         eax,dword ptr [ebp-20]
 004A9CC9    call        TObject.Free
 004A9CCE    ret
>004A9CCF    jmp         @HandleFinally
>004A9CD4    jmp         004A9CC6
 004A9CD6    xor         eax,eax
 004A9CD8    pop         edx
 004A9CD9    pop         ecx
 004A9CDA    pop         ecx
 004A9CDB    mov         dword ptr fs:[eax],edx
 004A9CDE    push        4A9CFB
 004A9CE3    lea         eax,[ebp-30]
 004A9CE6    call        @UStrClr
 004A9CEB    lea         eax,[ebp-4]
 004A9CEE    call        @UStrClr
 004A9CF3    ret
>004A9CF4    jmp         @HandleFinally
>004A9CF9    jmp         004A9CE3
 004A9CFB    pop         edi
 004A9CFC    pop         esi
 004A9CFD    pop         ebx
 004A9CFE    mov         esp,ebp
 004A9D00    pop         ebp
 004A9D01    ret
*}
end;

//004A9D04
procedure DefaultContextHelp(const ContextId:LongInt; const HelpFileName:UnicodeString);
begin
{*
 004A9D04    push        ebp
 004A9D05    mov         ebp,esp
 004A9D07    push        0
 004A9D09    push        0
 004A9D0B    push        ebx
 004A9D0C    push        esi
 004A9D0D    mov         esi,edx
 004A9D0F    mov         ebx,eax
 004A9D11    xor         eax,eax
 004A9D13    push        ebp
 004A9D14    push        4A9D78
 004A9D19    push        dword ptr fs:[eax]
 004A9D1C    mov         dword ptr fs:[eax],esp
 004A9D1F    mov         eax,dword ptr [ebp+8]
 004A9D22    mov         edx,dword ptr [eax-8]
 004A9D25    mov         eax,dword ptr [ebp+8]
 004A9D28    mov         eax,dword ptr [eax-4]
 004A9D2B    mov         eax,dword ptr [eax+14]
 004A9D2E    call        TList.Get
 004A9D33    mov         edx,dword ptr [eax+4]
 004A9D36    lea         eax,[ebp-4]
 004A9D39    call        @IntfCopy
 004A9D3E    lea         eax,[ebp-8]
 004A9D41    mov         edx,dword ptr [ebp-4]
 004A9D44    mov         ecx,4A9D88
 004A9D49    call        @IntfCast
 004A9D4E    mov         eax,dword ptr [ebp-8]
 004A9D51    mov         ecx,esi
 004A9D53    mov         edx,ebx
 004A9D55    mov         ebx,dword ptr [eax]
 004A9D57    call        dword ptr [ebx+3C]
 004A9D5A    xor         eax,eax
 004A9D5C    pop         edx
 004A9D5D    pop         ecx
 004A9D5E    pop         ecx
 004A9D5F    mov         dword ptr fs:[eax],edx
 004A9D62    push        4A9D7F
 004A9D67    lea         eax,[ebp-8]
 004A9D6A    call        @IntfClear
 004A9D6F    lea         eax,[ebp-4]
 004A9D72    call        @IntfClear
 004A9D77    ret
>004A9D78    jmp         @HandleFinally
>004A9D7D    jmp         004A9D67
 004A9D7F    pop         esi
 004A9D80    pop         ebx
 004A9D81    pop         ecx
 004A9D82    pop         ecx
 004A9D83    pop         ebp
 004A9D84    ret
*}
end;

//004A9D98
procedure THelpManager.ShowContextHelp(ContextID:Integer; HelpFileName:string);
begin
{*
 004A9D98    push        ebp
 004A9D99    mov         ebp,esp
 004A9D9B    add         esp,0FFFFFFC4
 004A9D9E    push        ebx
 004A9D9F    push        esi
 004A9DA0    push        edi
 004A9DA1    xor         ebx,ebx
 004A9DA3    mov         dword ptr [ebp-3C],ebx
 004A9DA6    mov         dword ptr [ebp-38],ebx
 004A9DA9    mov         dword ptr [ebp-34],ebx
 004A9DAC    mov         dword ptr [ebp-28],ebx
 004A9DAF    mov         dword ptr [ebp-0C],ebx
 004A9DB2    mov         dword ptr [ebp-10],ebx
 004A9DB5    mov         dword ptr [ebp-18],ecx
 004A9DB8    mov         dword ptr [ebp-14],edx
 004A9DBB    mov         dword ptr [ebp-4],eax
 004A9DBE    xor         eax,eax
 004A9DC0    push        ebp
 004A9DC1    push        4AA020
 004A9DC6    push        dword ptr fs:[eax]
 004A9DC9    mov         dword ptr fs:[eax],esp
 004A9DCC    xor         eax,eax
 004A9DCE    mov         dword ptr [ebp-1C],eax
 004A9DD1    cmp         dword ptr [ebp-18],0
>004A9DD5    je          004A9DE5
 004A9DD7    mov         eax,dword ptr [ebp-4]
 004A9DDA    add         eax,20
 004A9DDD    mov         edx,dword ptr [ebp-18]
 004A9DE0    call        @UStrAsg
 004A9DE5    mov         eax,dword ptr [ebp-4]
 004A9DE8    mov         eax,dword ptr [eax+14]
 004A9DEB    mov         eax,dword ptr [eax+8]
 004A9DEE    test        eax,eax
>004A9DF0    jne         004A9E0B
 004A9DF2    mov         ecx,dword ptr ds:[78D798];^SResString170:TResStringRec
 004A9DF8    mov         dl,1
 004A9DFA    mov         eax,[004A8B5C];EHelpSystemException
 004A9DFF    call        Exception.CreateRes
 004A9E04    call        @RaiseExcept
>004A9E09    jmp         004A9E59
 004A9E0B    mov         ebx,eax
 004A9E0D    dec         ebx
 004A9E0E    test        ebx,ebx
>004A9E10    jl          004A9E59
 004A9E12    inc         ebx
 004A9E13    xor         esi,esi
 004A9E15    mov         eax,dword ptr [ebp-4]
 004A9E18    mov         eax,dword ptr [eax+14]
 004A9E1B    mov         edx,esi
 004A9E1D    call        TList.Get
 004A9E22    mov         edx,dword ptr [eax+4]
 004A9E25    lea         eax,[ebp-0C]
 004A9E28    call        @IntfCopy
 004A9E2D    lea         eax,[ebp-28]
 004A9E30    mov         edx,dword ptr [ebp-0C]
 004A9E33    mov         ecx,4AA030
 004A9E38    call        @IntfCast
 004A9E3D    mov         eax,dword ptr [ebp-28]
 004A9E40    mov         ecx,dword ptr [ebp-18]
 004A9E43    mov         edx,dword ptr [ebp-14]
 004A9E46    mov         edi,dword ptr [eax]
 004A9E48    call        dword ptr [edi+38]
 004A9E4B    test        al,al
>004A9E4D    je          004A9E55
 004A9E4F    inc         dword ptr [ebp-1C]
 004A9E52    mov         dword ptr [ebp-8],esi
 004A9E55    inc         esi
 004A9E56    dec         ebx
>004A9E57    jne         004A9E15
 004A9E59    cmp         dword ptr [ebp-1C],0
>004A9E5D    jne         004A9E86
 004A9E5F    mov         eax,dword ptr [ebp-14]
 004A9E62    mov         dword ptr [ebp-30],eax
 004A9E65    mov         byte ptr [ebp-2C],0
 004A9E69    lea         eax,[ebp-30]
 004A9E6C    push        eax
 004A9E6D    push        0
 004A9E6F    mov         ecx,dword ptr ds:[78D7C0];^SResString171:TResStringRec
 004A9E75    mov         dl,1
 004A9E77    mov         eax,[004A8B5C];EHelpSystemException
 004A9E7C    call        Exception.CreateResFmt
 004A9E81    call        @RaiseExcept
 004A9E86    cmp         dword ptr [ebp-1C],1
>004A9E8A    jne         004A9E9E
 004A9E8C    push        ebp
 004A9E8D    mov         edx,dword ptr [ebp-18]
 004A9E90    mov         eax,dword ptr [ebp-14]
 004A9E93    call        DefaultContextHelp
 004A9E98    pop         ecx
>004A9E99    jmp         004A9FE2
 004A9E9E    mov         eax,dword ptr [ebp-4]
 004A9EA1    cmp         dword ptr [eax+0C],0
>004A9EA5    je          004A9FD5
 004A9EAB    lea         eax,[ebp-10]
 004A9EAE    mov         edx,dword ptr [ebp-4]
 004A9EB1    mov         edx,dword ptr [edx+0C]
 004A9EB4    mov         ecx,4AA040
 004A9EB9    call        @IntfCast
 004A9EBE    cmp         dword ptr [ebp-10],0
>004A9EC2    je          004A9FC6
 004A9EC8    mov         dl,1
 004A9ECA    mov         eax,[0043C7BC];TStringList
 004A9ECF    call        TStringList.Create
 004A9ED4    mov         dword ptr [ebp-20],eax
 004A9ED7    xor         edx,edx
 004A9ED9    push        ebp
 004A9EDA    push        4A9FBF
 004A9EDF    push        dword ptr fs:[edx]
 004A9EE2    mov         dword ptr fs:[edx],esp
 004A9EE5    mov         eax,dword ptr [ebp-4]
 004A9EE8    mov         eax,dword ptr [eax+14]
 004A9EEB    mov         ebx,dword ptr [eax+8]
 004A9EEE    dec         ebx
 004A9EEF    test        ebx,ebx
>004A9EF1    jl          004A9F56
 004A9EF3    inc         ebx
 004A9EF4    xor         esi,esi
 004A9EF6    mov         eax,dword ptr [ebp-4]
 004A9EF9    mov         eax,dword ptr [eax+14]
 004A9EFC    mov         edx,esi
 004A9EFE    call        TList.Get
 004A9F03    mov         dword ptr [ebp-24],eax
 004A9F06    lea         eax,[ebp-0C]
 004A9F09    mov         edx,dword ptr [ebp-24]
 004A9F0C    mov         edx,dword ptr [edx+4]
 004A9F0F    call        @IntfCopy
 004A9F14    lea         eax,[ebp-34]
 004A9F17    mov         edx,dword ptr [ebp-0C]
 004A9F1A    mov         ecx,4AA030
 004A9F1F    call        @IntfCast
 004A9F24    mov         eax,dword ptr [ebp-34]
 004A9F27    mov         ecx,dword ptr [ebp-18]
 004A9F2A    mov         edx,dword ptr [ebp-14]
 004A9F2D    mov         edi,dword ptr [eax]
 004A9F2F    call        dword ptr [edi+38]
 004A9F32    test        al,al
>004A9F34    je          004A9F52
 004A9F36    lea         edx,[ebp-38]
 004A9F39    mov         eax,dword ptr [ebp-24]
 004A9F3C    mov         eax,dword ptr [eax+4]
 004A9F3F    mov         ecx,dword ptr [eax]
 004A9F41    call        dword ptr [ecx+0C]
 004A9F44    mov         edx,dword ptr [ebp-38]
 004A9F47    mov         ecx,dword ptr [ebp-24]
 004A9F4A    mov         eax,dword ptr [ebp-20]
 004A9F4D    mov         edi,dword ptr [eax]
 004A9F4F    call        dword ptr [edi+3C]
 004A9F52    inc         esi
 004A9F53    dec         ebx
>004A9F54    jne         004A9EF6
 004A9F56    mov         edx,dword ptr [ebp-20]
 004A9F59    mov         eax,dword ptr [ebp-10]
 004A9F5C    mov         ecx,dword ptr [eax]
 004A9F5E    call        dword ptr [ecx+14]
 004A9F61    test        eax,eax
>004A9F63    jl          004A9F9C
 004A9F65    mov         edx,eax
 004A9F67    mov         eax,dword ptr [ebp-20]
 004A9F6A    mov         ecx,dword ptr [eax]
 004A9F6C    call        dword ptr [ecx+18]
 004A9F6F    mov         ebx,eax
 004A9F71    lea         eax,[ebp-0C]
 004A9F74    mov         edx,dword ptr [ebx+4]
 004A9F77    call        @IntfCopy
 004A9F7C    lea         eax,[ebp-3C]
 004A9F7F    mov         edx,dword ptr [ebp-0C]
 004A9F82    mov         ecx,4AA030
 004A9F87    call        @IntfCast
 004A9F8C    mov         eax,dword ptr [ebp-3C]
 004A9F8F    mov         ecx,dword ptr [ebp-18]
 004A9F92    mov         edx,dword ptr [ebp-14]
 004A9F95    mov         ebx,dword ptr [eax]
 004A9F97    call        dword ptr [ebx+3C]
>004A9F9A    jmp         004A9FA9
 004A9F9C    push        ebp
 004A9F9D    mov         edx,dword ptr [ebp-18]
 004A9FA0    mov         eax,dword ptr [ebp-14]
 004A9FA3    call        DefaultContextHelp
 004A9FA8    pop         ecx
 004A9FA9    xor         eax,eax
 004A9FAB    pop         edx
 004A9FAC    pop         ecx
 004A9FAD    pop         ecx
 004A9FAE    mov         dword ptr fs:[eax],edx
 004A9FB1    push        4A9FE2
 004A9FB6    mov         eax,dword ptr [ebp-20]
 004A9FB9    call        TObject.Free
 004A9FBE    ret
>004A9FBF    jmp         @HandleFinally
>004A9FC4    jmp         004A9FB6
 004A9FC6    push        ebp
 004A9FC7    mov         edx,dword ptr [ebp-18]
 004A9FCA    mov         eax,dword ptr [ebp-14]
 004A9FCD    call        DefaultContextHelp
 004A9FD2    pop         ecx
>004A9FD3    jmp         004A9FE2
 004A9FD5    push        ebp
 004A9FD6    mov         edx,dword ptr [ebp-18]
 004A9FD9    mov         eax,dword ptr [ebp-14]
 004A9FDC    call        DefaultContextHelp
 004A9FE1    pop         ecx
 004A9FE2    xor         eax,eax
 004A9FE4    pop         edx
 004A9FE5    pop         ecx
 004A9FE6    pop         ecx
 004A9FE7    mov         dword ptr fs:[eax],edx
 004A9FEA    push        4AA027
 004A9FEF    lea         eax,[ebp-3C]
 004A9FF2    call        @IntfClear
 004A9FF7    lea         eax,[ebp-38]
 004A9FFA    call        @UStrClr
 004A9FFF    lea         eax,[ebp-34]
 004AA002    call        @IntfClear
 004AA007    lea         eax,[ebp-28]
 004AA00A    call        @IntfClear
 004AA00F    lea         eax,[ebp-10]
 004AA012    call        @IntfClear
 004AA017    lea         eax,[ebp-0C]
 004AA01A    call        @IntfClear
 004AA01F    ret
>004AA020    jmp         @HandleFinally
>004AA025    jmp         004A9FEF
 004AA027    pop         edi
 004AA028    pop         esi
 004AA029    pop         ebx
 004AA02A    mov         esp,ebp
 004AA02C    pop         ebp
 004AA02D    ret
*}
end;

//004AA050
procedure THelpManager.ShowTableOfContents;
begin
{*
 004AA050    push        ebp
 004AA051    mov         ebp,esp
 004AA053    add         esp,0FFFFFFEC
 004AA056    push        ebx
 004AA057    push        esi
 004AA058    xor         edx,edx
 004AA05A    mov         dword ptr [ebp-14],edx
 004AA05D    mov         dword ptr [ebp-4],edx
 004AA060    mov         dword ptr [ebp-8],eax
 004AA063    xor         eax,eax
 004AA065    push        ebp
 004AA066    push        4AA14E
 004AA06B    push        dword ptr fs:[eax]
 004AA06E    mov         dword ptr fs:[eax],esp
 004AA071    mov         dl,1
 004AA073    mov         eax,[0043C7BC];TStringList
 004AA078    call        TStringList.Create
 004AA07D    mov         dword ptr [ebp-0C],eax
 004AA080    xor         eax,eax
 004AA082    push        ebp
 004AA083    push        4AA102
 004AA088    push        dword ptr fs:[eax]
 004AA08B    mov         dword ptr fs:[eax],esp
 004AA08E    mov         eax,dword ptr [ebp-8]
 004AA091    mov         eax,dword ptr [eax+10]
 004AA094    mov         esi,dword ptr [eax+8]
 004AA097    dec         esi
 004AA098    test        esi,esi
>004AA09A    jl          004AA0DE
 004AA09C    inc         esi
 004AA09D    mov         dword ptr [ebp-10],0
 004AA0A4    mov         eax,dword ptr [ebp-8]
 004AA0A7    mov         eax,dword ptr [eax+10]
 004AA0AA    mov         edx,dword ptr [ebp-10]
 004AA0AD    call        TList.Get
 004AA0B2    mov         ebx,eax
 004AA0B4    mov         eax,dword ptr [ebx+4]
 004AA0B7    mov         edx,dword ptr [eax]
 004AA0B9    call        dword ptr [edx+18]
 004AA0BC    test        al,al
>004AA0BE    je          004AA0D8
 004AA0C0    lea         edx,[ebp-14]
 004AA0C3    mov         eax,dword ptr [ebx+4]
 004AA0C6    mov         ecx,dword ptr [eax]
 004AA0C8    call        dword ptr [ecx+0C]
 004AA0CB    mov         edx,dword ptr [ebp-14]
 004AA0CE    mov         ecx,ebx
 004AA0D0    mov         eax,dword ptr [ebp-0C]
 004AA0D3    mov         ebx,dword ptr [eax]
 004AA0D5    call        dword ptr [ebx+3C]
 004AA0D8    inc         dword ptr [ebp-10]
 004AA0DB    dec         esi
>004AA0DC    jne         004AA0A4
 004AA0DE    lea         ecx,[ebp-4]
 004AA0E1    mov         edx,dword ptr [ebp-0C]
 004AA0E4    mov         eax,dword ptr [ebp-8]
 004AA0E7    call        THelpManager.SelectViewer
 004AA0EC    xor         eax,eax
 004AA0EE    pop         edx
 004AA0EF    pop         ecx
 004AA0F0    pop         ecx
 004AA0F1    mov         dword ptr fs:[eax],edx
 004AA0F4    push        4AA109
 004AA0F9    mov         eax,dword ptr [ebp-0C]
 004AA0FC    call        TObject.Free
 004AA101    ret
>004AA102    jmp         @HandleFinally
>004AA107    jmp         004AA0F9
 004AA109    cmp         dword ptr [ebp-4],0
>004AA10D    je          004AA119
 004AA10F    mov         eax,dword ptr [ebp-4]
 004AA112    mov         edx,dword ptr [eax]
 004AA114    call        dword ptr [edx+1C]
>004AA117    jmp         004AA130
 004AA119    mov         ecx,dword ptr ds:[78CC88];^SResString174:TResStringRec
 004AA11F    mov         dl,1
 004AA121    mov         eax,[004A8B5C];EHelpSystemException
 004AA126    call        Exception.CreateRes
 004AA12B    call        @RaiseExcept
 004AA130    xor         eax,eax
 004AA132    pop         edx
 004AA133    pop         ecx
 004AA134    pop         ecx
 004AA135    mov         dword ptr fs:[eax],edx
 004AA138    push        4AA155
 004AA13D    lea         eax,[ebp-14]
 004AA140    call        @UStrClr
 004AA145    lea         eax,[ebp-4]
 004AA148    call        @IntfClear
 004AA14D    ret
>004AA14E    jmp         @HandleFinally
>004AA153    jmp         004AA13D
 004AA155    pop         esi
 004AA156    pop         ebx
 004AA157    mov         esp,ebp
 004AA159    pop         ebp
 004AA15A    ret
*}
end;

//004AA15C
procedure THelpManager.ShowTopicHelp(Topic:string; HelpFileName:string);
begin
{*
 004AA15C    push        ebp
 004AA15D    mov         ebp,esp
 004AA15F    push        0
 004AA161    push        0
 004AA163    push        0
 004AA165    push        ebx
 004AA166    push        esi
 004AA167    push        edi
 004AA168    mov         ebx,ecx
 004AA16A    mov         dword ptr [ebp-0C],edx
 004AA16D    mov         edi,eax
 004AA16F    xor         eax,eax
 004AA171    push        ebp
 004AA172    push        4AA21C
 004AA177    push        dword ptr fs:[eax]
 004AA17A    mov         dword ptr fs:[eax],esp
 004AA17D    test        ebx,ebx
>004AA17F    je          004AA18B
 004AA181    lea         eax,[edi+20]
 004AA184    mov         edx,ebx
 004AA186    call        @UStrAsg
 004AA18B    mov         eax,dword ptr [edi+14]
 004AA18E    cmp         dword ptr [eax+8],0
>004AA192    jne         004AA1AB
 004AA194    mov         ecx,dword ptr ds:[78CF50];^SResString175:TResStringRec
 004AA19A    mov         dl,1
 004AA19C    mov         eax,[004A8B5C];EHelpSystemException
 004AA1A1    call        Exception.CreateRes
 004AA1A6    call        @RaiseExcept
 004AA1AB    mov         eax,dword ptr [edi+14]
 004AA1AE    mov         ebx,dword ptr [eax+8]
 004AA1B1    dec         ebx
 004AA1B2    test        ebx,ebx
>004AA1B4    jl          004AA1FE
 004AA1B6    inc         ebx
 004AA1B7    xor         esi,esi
 004AA1B9    mov         eax,dword ptr [edi+14]
 004AA1BC    mov         edx,esi
 004AA1BE    call        TList.Get
 004AA1C3    mov         edx,dword ptr [eax+4]
 004AA1C6    lea         eax,[ebp-4]
 004AA1C9    call        @IntfCopy
 004AA1CE    lea         eax,[ebp-8]
 004AA1D1    mov         edx,dword ptr [ebp-4]
 004AA1D4    mov         ecx,4AA22C
 004AA1D9    call        @IntfCast
 004AA1DE    mov         edx,dword ptr [ebp-0C]
 004AA1E1    mov         eax,dword ptr [ebp-8]
 004AA1E4    mov         ecx,dword ptr [eax]
 004AA1E6    call        dword ptr [ecx+30]
 004AA1E9    test        al,al
>004AA1EB    je          004AA1FA
 004AA1ED    mov         edx,dword ptr [ebp-0C]
 004AA1F0    mov         eax,dword ptr [ebp-8]
 004AA1F3    mov         ecx,dword ptr [eax]
 004AA1F5    call        dword ptr [ecx+34]
>004AA1F8    jmp         004AA1FE
 004AA1FA    inc         esi
 004AA1FB    dec         ebx
>004AA1FC    jne         004AA1B9
 004AA1FE    xor         eax,eax
 004AA200    pop         edx
 004AA201    pop         ecx
 004AA202    pop         ecx
 004AA203    mov         dword ptr fs:[eax],edx
 004AA206    push        4AA223
 004AA20B    lea         eax,[ebp-8]
 004AA20E    call        @IntfClear
 004AA213    lea         eax,[ebp-4]
 004AA216    call        @IntfClear
 004AA21B    ret
>004AA21C    jmp         @HandleFinally
>004AA221    jmp         004AA20B
 004AA223    pop         edi
 004AA224    pop         esi
 004AA225    pop         ebx
 004AA226    mov         esp,ebp
 004AA228    pop         ebp
 004AA229    ret
*}
end;

//004AA23C
procedure THelpManager.AssignHelpSelector(Selector:IHelpSelector);
begin
{*
 004AA23C    push        ebx
 004AA23D    push        esi
 004AA23E    mov         esi,edx
 004AA240    mov         ebx,eax
 004AA242    lea         eax,[ebx+0C]
 004AA245    mov         edx,esi
 004AA247    call        @IntfCopy
 004AA24C    pop         esi
 004AA24D    pop         ebx
 004AA24E    ret
*}
end;

//004AA250
function THelpManager.Hook(Handle:Integer; HelpFile:string; Data:Integer; Command:Word):Boolean;
begin
{*
 004AA250    push        ebp
 004AA251    mov         ebp,esp
 004AA253    push        ecx
 004AA254    push        ebx
 004AA255    push        esi
 004AA256    push        edi
 004AA257    mov         esi,ecx
 004AA259    mov         dword ptr [ebp-4],edx
 004AA25C    mov         ebx,eax
 004AA25E    mov         edi,dword ptr [ebp+0C]
 004AA261    test        esi,esi
>004AA263    je          004AA26F
 004AA265    lea         eax,[ebx+20]
 004AA268    mov         edx,esi
 004AA26A    call        @UStrAsg
 004AA26F    mov         eax,edi
 004AA271    dec         ax
>004AA274    je          004AA288
 004AA276    dec         ax
>004AA279    je          004AA2A4
 004AA27B    dec         ax
>004AA27E    je          004AA2AD
 004AA280    sub         ax,5
>004AA284    je          004AA296
>004AA286    jmp         004AA2B6
 004AA288    mov         ecx,esi
 004AA28A    mov         edx,dword ptr [ebp+8]
 004AA28D    mov         eax,ebx
 004AA28F    call        THelpManager.ShowContextHelp
>004AA294    jmp         004AA2C7
 004AA296    mov         ecx,esi
 004AA298    mov         edx,dword ptr [ebp+8]
 004AA29B    mov         eax,ebx
 004AA29D    call        THelpManager.ShowContextHelp
>004AA2A2    jmp         004AA2C7
 004AA2A4    mov         eax,ebx
 004AA2A6    call        THelpManager.DoSoftShutDown
>004AA2AB    jmp         004AA2C7
 004AA2AD    mov         eax,ebx
 004AA2AF    call        THelpManager.ShowTableOfContents
>004AA2B4    jmp         004AA2C7
 004AA2B6    push        edi
 004AA2B7    mov         eax,dword ptr [ebp+8]
 004AA2BA    push        eax
 004AA2BB    mov         ecx,esi
 004AA2BD    mov         edx,dword ptr [ebp-4]
 004AA2C0    mov         eax,ebx
 004AA2C2    call        THelpManager.CallSpecialWinHelp
 004AA2C7    mov         al,1
 004AA2C9    pop         edi
 004AA2CA    pop         esi
 004AA2CB    pop         ebx
 004AA2CC    pop         ecx
 004AA2CD    pop         ebp
 004AA2CE    ret         8
*}
end;

//004AA2D4
function THelpManager.UnderstandsKeyword(HelpKeyword:string; HelpFileName:string):Boolean;
begin
{*
 004AA2D4    push        ebp
 004AA2D5    mov         ebp,esp
 004AA2D7    add         esp,0FFFFFFE0
 004AA2DA    push        ebx
 004AA2DB    xor         ebx,ebx
 004AA2DD    mov         dword ptr [ebp-4],ebx
 004AA2E0    mov         dword ptr [ebp-8],ebx
 004AA2E3    mov         ebx,ecx
 004AA2E5    mov         dword ptr [ebp-10],edx
 004AA2E8    mov         dword ptr [ebp-0C],eax
 004AA2EB    xor         eax,eax
 004AA2ED    push        ebp
 004AA2EE    push        4AA3F1
 004AA2F3    push        dword ptr fs:[eax]
 004AA2F6    mov         dword ptr fs:[eax],esp
 004AA2F9    mov         byte ptr [ebp-11],0
 004AA2FD    mov         byte ptr [ebp-19],0
 004AA301    test        ebx,ebx
>004AA303    je          004AA312
 004AA305    mov         eax,dword ptr [ebp-0C]
 004AA308    add         eax,20
 004AA30B    mov         edx,ebx
 004AA30D    call        @UStrAsg
 004AA312    mov         eax,dword ptr [ebp-0C]
 004AA315    mov         eax,dword ptr [eax+10]
 004AA318    mov         eax,dword ptr [eax+8]
 004AA31B    dec         eax
 004AA31C    test        eax,eax
>004AA31E    jl          004AA3D3
 004AA324    inc         eax
 004AA325    mov         dword ptr [ebp-20],eax
 004AA328    mov         dword ptr [ebp-18],0
 004AA32F    mov         eax,dword ptr [ebp-0C]
 004AA332    mov         eax,dword ptr [eax+10]
 004AA335    mov         edx,dword ptr [ebp-18]
 004AA338    call        TList.Get
 004AA33D    mov         edx,dword ptr [eax+4]
 004AA340    lea         eax,[ebp-4]
 004AA343    call        @IntfCopy
 004AA348    xor         eax,eax
 004AA34A    push        ebp
 004AA34B    push        4AA3C0
 004AA350    push        dword ptr fs:[eax]
 004AA353    mov         dword ptr fs:[eax],esp
 004AA356    lea         eax,[ebp-8]
 004AA359    call        @IntfClear
 004AA35E    mov         ecx,eax
 004AA360    mov         edx,4AA404
 004AA365    mov         eax,dword ptr [ebp-4]
 004AA368    call        Supports
 004AA36D    test        al,al
>004AA36F    je          004AA386
 004AA371    mov         eax,dword ptr [ebp-8]
 004AA374    mov         edx,dword ptr [eax]
 004AA376    call        dword ptr [edx+40]
 004AA379    mov         byte ptr [ebp-19],al
 004AA37C    xor         edx,edx
 004AA37E    mov         eax,dword ptr [ebp-8]
 004AA381    mov         ecx,dword ptr [eax]
 004AA383    call        dword ptr [ecx+44]
 004AA386    mov         edx,dword ptr [ebp-10]
 004AA389    mov         eax,dword ptr [ebp-4]
 004AA38C    mov         ecx,dword ptr [eax]
 004AA38E    call        dword ptr [ecx+10]
 004AA391    test        eax,eax
>004AA393    jle         004AA3A0
 004AA395    mov         byte ptr [ebp-11],1
 004AA399    call        @TryFinallyExit
>004AA39E    jmp         004AA3D3
 004AA3A0    xor         eax,eax
 004AA3A2    pop         edx
 004AA3A3    pop         ecx
 004AA3A4    pop         ecx
 004AA3A5    mov         dword ptr fs:[eax],edx
 004AA3A8    push        4AA3C7
 004AA3AD    cmp         dword ptr [ebp-8],0
>004AA3B1    je          004AA3BF
 004AA3B3    movzx       edx,byte ptr [ebp-19]
 004AA3B7    mov         eax,dword ptr [ebp-8]
 004AA3BA    mov         ecx,dword ptr [eax]
 004AA3BC    call        dword ptr [ecx+44]
 004AA3BF    ret
>004AA3C0    jmp         @HandleFinally
>004AA3C5    jmp         004AA3AD
 004AA3C7    inc         dword ptr [ebp-18]
 004AA3CA    dec         dword ptr [ebp-20]
>004AA3CD    jne         004AA32F
 004AA3D3    xor         eax,eax
 004AA3D5    pop         edx
 004AA3D6    pop         ecx
 004AA3D7    pop         ecx
 004AA3D8    mov         dword ptr fs:[eax],edx
 004AA3DB    push        4AA3F8
 004AA3E0    lea         eax,[ebp-8]
 004AA3E3    call        @IntfClear
 004AA3E8    lea         eax,[ebp-4]
 004AA3EB    call        @IntfClear
 004AA3F0    ret
>004AA3F1    jmp         @HandleFinally
>004AA3F6    jmp         004AA3E0
 004AA3F8    movzx       eax,byte ptr [ebp-11]
 004AA3FC    pop         ebx
 004AA3FD    mov         esp,ebp
 004AA3FF    pop         ebp
 004AA400    ret
*}
end;

//004AA414
procedure THelpManager.ShowIndex(Topic:string; HelpFileName:string);
begin
{*
 004AA414    push        ebp
 004AA415    mov         ebp,esp
 004AA417    add         esp,0FFFFFFE4
 004AA41A    push        ebx
 004AA41B    push        esi
 004AA41C    xor         ebx,ebx
 004AA41E    mov         dword ptr [ebp-1C],ebx
 004AA421    mov         dword ptr [ebp-18],ebx
 004AA424    mov         dword ptr [ebp-4],ebx
 004AA427    mov         ebx,ecx
 004AA429    mov         dword ptr [ebp-0C],edx
 004AA42C    mov         dword ptr [ebp-8],eax
 004AA42F    xor         eax,eax
 004AA431    push        ebp
 004AA432    push        4AA555
 004AA437    push        dword ptr fs:[eax]
 004AA43A    mov         dword ptr fs:[eax],esp
 004AA43D    test        ebx,ebx
>004AA43F    je          004AA44E
 004AA441    mov         eax,dword ptr [ebp-8]
 004AA444    add         eax,20
 004AA447    mov         edx,ebx
 004AA449    call        @UStrAsg
 004AA44E    mov         dl,1
 004AA450    mov         eax,[0043C7BC];TStringList
 004AA455    call        TStringList.Create
 004AA45A    mov         dword ptr [ebp-10],eax
 004AA45D    xor         eax,eax
 004AA45F    push        ebp
 004AA460    push        4AA4EE
 004AA465    push        dword ptr fs:[eax]
 004AA468    mov         dword ptr fs:[eax],esp
 004AA46B    mov         eax,dword ptr [ebp-8]
 004AA46E    mov         eax,dword ptr [eax+10]
 004AA471    mov         esi,dword ptr [eax+8]
 004AA474    dec         esi
 004AA475    test        esi,esi
>004AA477    jl          004AA4CA
 004AA479    inc         esi
 004AA47A    mov         dword ptr [ebp-14],0
 004AA481    mov         eax,dword ptr [ebp-8]
 004AA484    mov         eax,dword ptr [eax+10]
 004AA487    mov         edx,dword ptr [ebp-14]
 004AA48A    call        TList.Get
 004AA48F    mov         ebx,eax
 004AA491    lea         eax,[ebp-4]
 004AA494    call        @IntfClear
 004AA499    mov         ecx,eax
 004AA49B    mov         edx,4AA564
 004AA4A0    mov         eax,dword ptr [ebx+4]
 004AA4A3    call        Supports
 004AA4A8    test        al,al
>004AA4AA    je          004AA4C4
 004AA4AC    lea         edx,[ebp-18]
 004AA4AF    mov         eax,dword ptr [ebx+4]
 004AA4B2    mov         ecx,dword ptr [eax]
 004AA4B4    call        dword ptr [ecx+0C]
 004AA4B7    mov         edx,dword ptr [ebp-18]
 004AA4BA    mov         ecx,ebx
 004AA4BC    mov         eax,dword ptr [ebp-10]
 004AA4BF    mov         ebx,dword ptr [eax]
 004AA4C1    call        dword ptr [ebx+3C]
 004AA4C4    inc         dword ptr [ebp-14]
 004AA4C7    dec         esi
>004AA4C8    jne         004AA481
 004AA4CA    lea         ecx,[ebp-4]
 004AA4CD    mov         edx,dword ptr [ebp-10]
 004AA4D0    mov         eax,dword ptr [ebp-8]
 004AA4D3    call        THelpManager.SelectViewer
 004AA4D8    xor         eax,eax
 004AA4DA    pop         edx
 004AA4DB    pop         ecx
 004AA4DC    pop         ecx
 004AA4DD    mov         dword ptr fs:[eax],edx
 004AA4E0    push        4AA4F5
 004AA4E5    mov         eax,dword ptr [ebp-10]
 004AA4E8    call        TObject.Free
 004AA4ED    ret
>004AA4EE    jmp         @HandleFinally
>004AA4F3    jmp         004AA4E5
 004AA4F5    cmp         dword ptr [ebp-4],0
>004AA4F9    je          004AA518
 004AA4FB    lea         eax,[ebp-1C]
 004AA4FE    mov         edx,dword ptr [ebp-4]
 004AA501    mov         ecx,4AA564
 004AA506    call        @IntfCast
 004AA50B    mov         eax,dword ptr [ebp-1C]
 004AA50E    mov         edx,dword ptr [ebp-0C]
 004AA511    mov         ecx,dword ptr [eax]
 004AA513    call        dword ptr [ecx+40]
>004AA516    jmp         004AA52F
 004AA518    mov         ecx,dword ptr ds:[78CBEC];^SResString172:TResStringRec
 004AA51E    mov         dl,1
 004AA520    mov         eax,[004A8B5C];EHelpSystemException
 004AA525    call        Exception.CreateRes
 004AA52A    call        @RaiseExcept
 004AA52F    xor         eax,eax
 004AA531    pop         edx
 004AA532    pop         ecx
 004AA533    pop         ecx
 004AA534    mov         dword ptr fs:[eax],edx
 004AA537    push        4AA55C
 004AA53C    lea         eax,[ebp-1C]
 004AA53F    call        @IntfClear
 004AA544    lea         eax,[ebp-18]
 004AA547    call        @UStrClr
 004AA54C    lea         eax,[ebp-4]
 004AA54F    call        @IntfClear
 004AA554    ret
>004AA555    jmp         @HandleFinally
>004AA55A    jmp         004AA53C
 004AA55C    pop         esi
 004AA55D    pop         ebx
 004AA55E    mov         esp,ebp
 004AA560    pop         ebp
 004AA561    ret
*}
end;

//004AA574
procedure THelpManager.ShowSearch(Topic:string; HelpFileName:string);
begin
{*
 004AA574    push        ebp
 004AA575    mov         ebp,esp
 004AA577    add         esp,0FFFFFFE4
 004AA57A    push        ebx
 004AA57B    push        esi
 004AA57C    xor         ebx,ebx
 004AA57E    mov         dword ptr [ebp-1C],ebx
 004AA581    mov         dword ptr [ebp-18],ebx
 004AA584    mov         dword ptr [ebp-4],ebx
 004AA587    mov         ebx,ecx
 004AA589    mov         dword ptr [ebp-0C],edx
 004AA58C    mov         dword ptr [ebp-8],eax
 004AA58F    xor         eax,eax
 004AA591    push        ebp
 004AA592    push        4AA6B5
 004AA597    push        dword ptr fs:[eax]
 004AA59A    mov         dword ptr fs:[eax],esp
 004AA59D    test        ebx,ebx
>004AA59F    je          004AA5AE
 004AA5A1    mov         eax,dword ptr [ebp-8]
 004AA5A4    add         eax,20
 004AA5A7    mov         edx,ebx
 004AA5A9    call        @UStrAsg
 004AA5AE    mov         dl,1
 004AA5B0    mov         eax,[0043C7BC];TStringList
 004AA5B5    call        TStringList.Create
 004AA5BA    mov         dword ptr [ebp-10],eax
 004AA5BD    xor         eax,eax
 004AA5BF    push        ebp
 004AA5C0    push        4AA64E
 004AA5C5    push        dword ptr fs:[eax]
 004AA5C8    mov         dword ptr fs:[eax],esp
 004AA5CB    mov         eax,dword ptr [ebp-8]
 004AA5CE    mov         eax,dword ptr [eax+10]
 004AA5D1    mov         esi,dword ptr [eax+8]
 004AA5D4    dec         esi
 004AA5D5    test        esi,esi
>004AA5D7    jl          004AA62A
 004AA5D9    inc         esi
 004AA5DA    mov         dword ptr [ebp-14],0
 004AA5E1    mov         eax,dword ptr [ebp-8]
 004AA5E4    mov         eax,dword ptr [eax+10]
 004AA5E7    mov         edx,dword ptr [ebp-14]
 004AA5EA    call        TList.Get
 004AA5EF    mov         ebx,eax
 004AA5F1    lea         eax,[ebp-4]
 004AA5F4    call        @IntfClear
 004AA5F9    mov         ecx,eax
 004AA5FB    mov         edx,4AA6C4
 004AA600    mov         eax,dword ptr [ebx+4]
 004AA603    call        Supports
 004AA608    test        al,al
>004AA60A    je          004AA624
 004AA60C    lea         edx,[ebp-18]
 004AA60F    mov         eax,dword ptr [ebx+4]
 004AA612    mov         ecx,dword ptr [eax]
 004AA614    call        dword ptr [ecx+0C]
 004AA617    mov         edx,dword ptr [ebp-18]
 004AA61A    mov         ecx,ebx
 004AA61C    mov         eax,dword ptr [ebp-10]
 004AA61F    mov         ebx,dword ptr [eax]
 004AA621    call        dword ptr [ebx+3C]
 004AA624    inc         dword ptr [ebp-14]
 004AA627    dec         esi
>004AA628    jne         004AA5E1
 004AA62A    lea         ecx,[ebp-4]
 004AA62D    mov         edx,dword ptr [ebp-10]
 004AA630    mov         eax,dword ptr [ebp-8]
 004AA633    call        THelpManager.SelectViewer
 004AA638    xor         eax,eax
 004AA63A    pop         edx
 004AA63B    pop         ecx
 004AA63C    pop         ecx
 004AA63D    mov         dword ptr fs:[eax],edx
 004AA640    push        4AA655
 004AA645    mov         eax,dword ptr [ebp-10]
 004AA648    call        TObject.Free
 004AA64D    ret
>004AA64E    jmp         @HandleFinally
>004AA653    jmp         004AA645
 004AA655    cmp         dword ptr [ebp-4],0
>004AA659    je          004AA678
 004AA65B    lea         eax,[ebp-1C]
 004AA65E    mov         edx,dword ptr [ebp-4]
 004AA661    mov         ecx,4AA6C4
 004AA666    call        @IntfCast
 004AA66B    mov         eax,dword ptr [ebp-1C]
 004AA66E    mov         edx,dword ptr [ebp-0C]
 004AA671    mov         ecx,dword ptr [eax]
 004AA673    call        dword ptr [ecx+44]
>004AA676    jmp         004AA68F
 004AA678    mov         ecx,dword ptr ds:[78CD10];^SResString173:TResStringRec
 004AA67E    mov         dl,1
 004AA680    mov         eax,[004A8B5C];EHelpSystemException
 004AA685    call        Exception.CreateRes
 004AA68A    call        @RaiseExcept
 004AA68F    xor         eax,eax
 004AA691    pop         edx
 004AA692    pop         ecx
 004AA693    pop         ecx
 004AA694    mov         dword ptr fs:[eax],edx
 004AA697    push        4AA6BC
 004AA69C    lea         eax,[ebp-1C]
 004AA69F    call        @IntfClear
 004AA6A4    lea         eax,[ebp-18]
 004AA6A7    call        @UStrClr
 004AA6AC    lea         eax,[ebp-4]
 004AA6AF    call        @IntfClear
 004AA6B4    ret
>004AA6B5    jmp         @HandleFinally
>004AA6BA    jmp         004AA69C
 004AA6BC    pop         esi
 004AA6BD    pop         ebx
 004AA6BE    mov         esp,ebp
 004AA6C0    pop         ebp
 004AA6C1    ret
*}
end;

//004AA6D4
procedure THelpManager.ShowTopicHelp(Topic:string; Anchor:string; HelpFileName:string);
begin
{*
 004AA6D4    push        ebp
 004AA6D5    mov         ebp,esp
 004AA6D7    add         esp,0FFFFFFF0
 004AA6DA    push        ebx
 004AA6DB    push        esi
 004AA6DC    xor         ebx,ebx
 004AA6DE    mov         dword ptr [ebp-4],ebx
 004AA6E1    mov         dword ptr [ebp-8],ebx
 004AA6E4    mov         dword ptr [ebp-10],ecx
 004AA6E7    mov         dword ptr [ebp-0C],edx
 004AA6EA    mov         esi,eax
 004AA6EC    mov         ebx,dword ptr [ebp+8]
 004AA6EF    xor         eax,eax
 004AA6F1    push        ebp
 004AA6F2    push        4AA7C1
 004AA6F7    push        dword ptr fs:[eax]
 004AA6FA    mov         dword ptr fs:[eax],esp
 004AA6FD    test        ebx,ebx
>004AA6FF    je          004AA70B
 004AA701    lea         eax,[esi+20]
 004AA704    mov         edx,ebx
 004AA706    call        @UStrAsg
 004AA70B    mov         eax,dword ptr [esi+14]
 004AA70E    cmp         dword ptr [eax+8],0
>004AA712    jne         004AA72B
 004AA714    mov         ecx,dword ptr ds:[78CF50];^SResString175:TResStringRec
 004AA71A    mov         dl,1
 004AA71C    mov         eax,[004A8B5C];EHelpSystemException
 004AA721    call        Exception.CreateRes
 004AA726    call        @RaiseExcept
 004AA72B    mov         eax,dword ptr [esi+14]
 004AA72E    mov         eax,dword ptr [eax+8]
 004AA731    dec         eax
 004AA732    test        eax,eax
>004AA734    jl          004AA7A3
 004AA736    inc         eax
 004AA737    xor         ebx,ebx
 004AA739    mov         eax,dword ptr [esi+14]
 004AA73C    mov         edx,ebx
 004AA73E    call        TList.Get
 004AA743    mov         edx,dword ptr [eax+4]
 004AA746    lea         eax,[ebp-4]
 004AA749    call        @IntfCopy
 004AA74E    lea         eax,[ebp-8]
 004AA751    call        @IntfClear
 004AA756    mov         ecx,eax
 004AA758    mov         edx,4AA7D0
 004AA75D    mov         eax,dword ptr [ebp-4]
 004AA760    call        Supports
 004AA765    test        al,al
>004AA767    je          004AA788
 004AA769    mov         edx,dword ptr [ebp-0C]
 004AA76C    mov         eax,dword ptr [ebp-8]
 004AA76F    mov         ecx,dword ptr [eax]
 004AA771    call        dword ptr [ecx+30]
 004AA774    test        al,al
>004AA776    je          004AA788
 004AA778    mov         ecx,dword ptr [ebp-10]
 004AA77B    mov         edx,dword ptr [ebp-0C]
 004AA77E    mov         eax,dword ptr [ebp-8]
 004AA781    mov         esi,dword ptr [eax]
 004AA783    call        dword ptr [esi+48]
>004AA786    jmp         004AA7A3
 004AA788    mov         ecx,dword ptr ds:[78CF50];^SResString175:TResStringRec
 004AA78E    mov         dl,1
 004AA790    mov         eax,[004A8B5C];EHelpSystemException
 004AA795    call        Exception.CreateRes
 004AA79A    call        @RaiseExcept
 004AA79F    inc         ebx
 004AA7A0    dec         eax
>004AA7A1    jne         004AA739
 004AA7A3    xor         eax,eax
 004AA7A5    pop         edx
 004AA7A6    pop         ecx
 004AA7A7    pop         ecx
 004AA7A8    mov         dword ptr fs:[eax],edx
 004AA7AB    push        4AA7C8
 004AA7B0    lea         eax,[ebp-8]
 004AA7B3    call        @IntfClear
 004AA7B8    lea         eax,[ebp-4]
 004AA7BB    call        @IntfClear
 004AA7C0    ret
>004AA7C1    jmp         @HandleFinally
>004AA7C6    jmp         004AA7B0
 004AA7C8    pop         esi
 004AA7C9    pop         ebx
 004AA7CA    mov         esp,ebp
 004AA7CC    pop         ebp
 004AA7CD    ret         4
*}
end;

//004AA7E0
function THelpManager.GetFilter:string;
begin
{*
 004AA7E0    push        ebp
 004AA7E1    mov         ebp,esp
 004AA7E3    push        0
 004AA7E5    push        0
 004AA7E7    push        0
 004AA7E9    push        ebx
 004AA7EA    push        esi
 004AA7EB    mov         dword ptr [ebp-0C],edx
 004AA7EE    mov         esi,eax
 004AA7F0    xor         eax,eax
 004AA7F2    push        ebp
 004AA7F3    push        4AA8AA
 004AA7F8    push        dword ptr fs:[eax]
 004AA7FB    mov         dword ptr fs:[eax],esp
 004AA7FE    mov         eax,dword ptr [ebp-0C]
 004AA801    call        @UStrClr
 004AA806    mov         eax,dword ptr [esi+14]
 004AA809    cmp         dword ptr [eax+8],0
>004AA80D    jne         004AA826
 004AA80F    mov         ecx,dword ptr ds:[78D148];^SResString162:TResStringRec
 004AA815    mov         dl,1
 004AA817    mov         eax,[004A8B5C];EHelpSystemException
 004AA81C    call        Exception.CreateRes
 004AA821    call        @RaiseExcept
 004AA826    mov         eax,dword ptr [esi+14]
 004AA829    mov         eax,dword ptr [eax+8]
 004AA82C    dec         eax
 004AA82D    test        eax,eax
>004AA82F    jl          004AA88C
 004AA831    inc         eax
 004AA832    xor         ebx,ebx
 004AA834    mov         eax,dword ptr [esi+14]
 004AA837    mov         edx,ebx
 004AA839    call        TList.Get
 004AA83E    mov         edx,dword ptr [eax+4]
 004AA841    lea         eax,[ebp-4]
 004AA844    call        @IntfCopy
 004AA849    lea         eax,[ebp-8]
 004AA84C    call        @IntfClear
 004AA851    mov         ecx,eax
 004AA853    mov         edx,4AA8B8
 004AA858    mov         eax,dword ptr [ebp-4]
 004AA85B    call        Supports
 004AA860    test        al,al
>004AA862    je          004AA871
 004AA864    mov         edx,dword ptr [ebp-0C]
 004AA867    mov         eax,dword ptr [ebp-8]
 004AA86A    mov         ecx,dword ptr [eax]
 004AA86C    call        dword ptr [ecx+4C]
>004AA86F    jmp         004AA88C
 004AA871    mov         ecx,dword ptr ds:[78D148];^SResString162:TResStringRec
 004AA877    mov         dl,1
 004AA879    mov         eax,[004A8B5C];EHelpSystemException
 004AA87E    call        Exception.CreateRes
 004AA883    call        @RaiseExcept
 004AA888    inc         ebx
 004AA889    dec         eax
>004AA88A    jne         004AA834
 004AA88C    xor         eax,eax
 004AA88E    pop         edx
 004AA88F    pop         ecx
 004AA890    pop         ecx
 004AA891    mov         dword ptr fs:[eax],edx
 004AA894    push        4AA8B1
 004AA899    lea         eax,[ebp-8]
 004AA89C    call        @IntfClear
 004AA8A1    lea         eax,[ebp-4]
 004AA8A4    call        @IntfClear
 004AA8A9    ret
>004AA8AA    jmp         @HandleFinally
>004AA8AF    jmp         004AA899
 004AA8B1    pop         esi
 004AA8B2    pop         ebx
 004AA8B3    mov         esp,ebp
 004AA8B5    pop         ebp
 004AA8B6    ret
*}
end;

//004AA8C8
procedure THelpManager.SetFilter(Filter:string);
begin
{*
 004AA8C8    push        ebp
 004AA8C9    mov         ebp,esp
 004AA8CB    push        0
 004AA8CD    push        0
 004AA8CF    push        0
 004AA8D1    push        ebx
 004AA8D2    push        esi
 004AA8D3    push        edi
 004AA8D4    mov         dword ptr [ebp-0C],edx
 004AA8D7    mov         edi,eax
 004AA8D9    xor         eax,eax
 004AA8DB    push        ebp
 004AA8DC    push        4AA98B
 004AA8E1    push        dword ptr fs:[eax]
 004AA8E4    mov         dword ptr fs:[eax],esp
 004AA8E7    mov         eax,dword ptr [edi+14]
 004AA8EA    cmp         dword ptr [eax+8],0
>004AA8EE    jne         004AA907
 004AA8F0    mov         ecx,dword ptr ds:[78D148];^SResString162:TResStringRec
 004AA8F6    mov         dl,1
 004AA8F8    mov         eax,[004A8B5C];EHelpSystemException
 004AA8FD    call        Exception.CreateRes
 004AA902    call        @RaiseExcept
 004AA907    mov         eax,dword ptr [edi+14]
 004AA90A    mov         ebx,dword ptr [eax+8]
 004AA90D    dec         ebx
 004AA90E    test        ebx,ebx
>004AA910    jl          004AA96D
 004AA912    inc         ebx
 004AA913    xor         esi,esi
 004AA915    mov         eax,dword ptr [edi+14]
 004AA918    mov         edx,esi
 004AA91A    call        TList.Get
 004AA91F    mov         edx,dword ptr [eax+4]
 004AA922    lea         eax,[ebp-4]
 004AA925    call        @IntfCopy
 004AA92A    lea         eax,[ebp-8]
 004AA92D    call        @IntfClear
 004AA932    mov         ecx,eax
 004AA934    mov         edx,4AA99C
 004AA939    mov         eax,dword ptr [ebp-4]
 004AA93C    call        Supports
 004AA941    test        al,al
>004AA943    je          004AA952
 004AA945    mov         edx,dword ptr [ebp-0C]
 004AA948    mov         eax,dword ptr [ebp-8]
 004AA94B    mov         ecx,dword ptr [eax]
 004AA94D    call        dword ptr [ecx+50]
>004AA950    jmp         004AA969
 004AA952    mov         ecx,dword ptr ds:[78D148];^SResString162:TResStringRec
 004AA958    mov         dl,1
 004AA95A    mov         eax,[004A8B5C];EHelpSystemException
 004AA95F    call        Exception.CreateRes
 004AA964    call        @RaiseExcept
 004AA969    inc         esi
 004AA96A    dec         ebx
>004AA96B    jne         004AA915
 004AA96D    xor         eax,eax
 004AA96F    pop         edx
 004AA970    pop         ecx
 004AA971    pop         ecx
 004AA972    mov         dword ptr fs:[eax],edx
 004AA975    push        4AA992
 004AA97A    lea         eax,[ebp-8]
 004AA97D    call        @IntfClear
 004AA982    lea         eax,[ebp-4]
 004AA985    call        @IntfClear
 004AA98A    ret
>004AA98B    jmp         @HandleFinally
>004AA990    jmp         004AA97A
 004AA992    pop         edi
 004AA993    pop         esi
 004AA994    pop         ebx
 004AA995    mov         esp,ebp
 004AA997    pop         ebp
 004AA998    ret
*}
end;

//004AA9AC
function THelpManager.GetHandle:Integer;
begin
{*
 004AA9AC    mov         eax,dword ptr [eax+1C];THelpManager.FHandle:Integer
 004AA9AF    ret
*}
end;

//004AA9B0
function THelpManager.GetHelpFile:string;
begin
{*
 004AA9B0    push        ebx
 004AA9B1    push        esi
 004AA9B2    mov         esi,edx
 004AA9B4    mov         ebx,eax
 004AA9B6    mov         eax,esi
 004AA9B8    mov         edx,dword ptr [ebx+20]
 004AA9BB    call        @UStrAsg
 004AA9C0    pop         esi
 004AA9C1    pop         ebx
 004AA9C2    ret
*}
end;

//004AA9C4
procedure THelpManager.Release(ViewerID:Integer);
begin
{*
 004AA9C4    push        ebx
 004AA9C5    push        esi
 004AA9C6    push        edi
 004AA9C7    push        ebp
 004AA9C8    mov         ebp,edx
 004AA9CA    mov         esi,eax
 004AA9CC    mov         eax,dword ptr [esi+14]
 004AA9CF    mov         ebx,dword ptr [eax+8]
 004AA9D2    dec         ebx
 004AA9D3    cmp         ebx,0
>004AA9D6    jl          004AA9F9
 004AA9D8    mov         edx,ebx
 004AA9DA    mov         eax,dword ptr [esi+14]
 004AA9DD    call        TList.Get
 004AA9E2    cmp         ebp,dword ptr [eax+8]
>004AA9E5    jne         004AA9F3
 004AA9E7    mov         edx,ebx
 004AA9E9    mov         eax,dword ptr [esi+14]
 004AA9EC    call        TList.Delete
>004AA9F1    jmp         004AA9F9
 004AA9F3    dec         ebx
 004AA9F4    cmp         ebx,0FFFFFFFF
>004AA9F7    jne         004AA9D8
 004AA9F9    mov         eax,dword ptr [esi+10]
 004AA9FC    mov         ebx,dword ptr [eax+8]
 004AA9FF    dec         ebx
 004AAA00    cmp         ebx,0
>004AAA03    jl          004AAA2F
 004AAA05    mov         edx,ebx
 004AAA07    mov         eax,dword ptr [esi+10]
 004AAA0A    call        TList.Get
 004AAA0F    mov         edi,eax
 004AAA11    cmp         ebp,dword ptr [edi+8]
>004AAA14    jne         004AAA29
 004AAA16    mov         edx,ebx
 004AAA18    mov         eax,dword ptr [esi+10]
 004AAA1B    call        TList.Delete
 004AAA20    mov         eax,edi
 004AAA22    call        TObject.Free
>004AAA27    jmp         004AAA2F
 004AAA29    dec         ebx
 004AAA2A    cmp         ebx,0FFFFFFFF
>004AAA2D    jne         004AAA05
 004AAA2F    pop         ebp
 004AAA30    pop         edi
 004AAA31    pop         esi
 004AAA32    pop         ebx
 004AAA33    ret
*}
end;

Initialization
Finalization
//004AAA34
{*
 004AAA34    push        ebp
 004AAA35    mov         ebp,esp
 004AAA37    xor         eax,eax
 004AAA39    push        ebp
 004AAA3A    push        4AAA65
 004AAA3F    push        dword ptr fs:[eax]
 004AAA42    mov         dword ptr fs:[eax],esp
 004AAA45    inc         dword ptr ds:[79323C]
>004AAA4B    jne         004AAA57
 004AAA4D    mov         eax,793240
 004AAA52    call        @IntfClear
 004AAA57    xor         eax,eax
 004AAA59    pop         edx
 004AAA5A    pop         ecx
 004AAA5B    pop         ecx
 004AAA5C    mov         dword ptr fs:[eax],edx
 004AAA5F    push        4AAA6C
 004AAA64    ret
>004AAA65    jmp         @HandleFinally
>004AAA6A    jmp         004AAA64
 004AAA6C    pop         ebp
 004AAA6D    ret
*}
end.