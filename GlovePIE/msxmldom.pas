//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit msxmldom;

interface

uses
  SysUtils, Classes, System, msxmldom;

type
  TMSDOMInterface = class(TInterfacedObject)
  published
    function SafeCallException(ExceptObject:TObject; ExceptAddr:Pointer):HRESULT;//0058412C
  end;
  TMSDOMImplementation = class(TMSDOMInterface)
  published
    constructor Create;//00584310
  public
    FMSDOMImpl:IXMLDOMImplementation;//fC
    function createDocument(const namespaceURI:DOMString; const qualifiedName:DOMString; doctype:IDOMDocumentType):IDOMDocument; safecall;//0058438C
    function createDocumentType(const qualifiedName:DOMString; const publicId:DOMString; const systemId:DOMString):IDOMDocumentType; safecall;//00584410
    function hasFeature(const feature:DOMString; const version:DOMString):WordBool;//005844A8
  end;
  TMSDOMNode = class(TMSDOMInterface)
  published
    constructor Create;//0058459C
  public
    FMSNode:IXMLDOMNode;//fC
    FChildNodes:IDOMNodeList;//f10
    FAttributes:IDOMNamedNodeMap;//f14
    FOwnerDocument:IDOMDocument;//f18
    function appendChild(const newChild:IDOMNode):IDOMNode; safecall;//005846AC
    function cloneNode(deep:WordBool):IDOMNode; safecall;//0058474C
    function get_firstChild:IDOMNode; safecall;//0058490C
    function get_lastChild:IDOMNode; safecall;//00584978
    function get_localName:DOMString; safecall;//005849E4
    function get_namespaceURI:DOMString; safecall;//00584A54
    function get_nextSibling:IDOMNode; safecall;//00584AC4
    function get_nodeName:DOMString; safecall;//00584B30
    function get_nodeType:DOMNodeType; safecall;//00584B9C
    function get_nodeValue:DOMString; safecall;//00584BEC
    function get_ownerDocument:IDOMDocument; safecall;//00584C74
    function get_parentNode:IDOMNode; safecall;//00584D08
    function get_prefix:DOMString; safecall;//00584D74
    function get_previousSibling:IDOMNode; safecall;//00584DE4
    function hasChildNodes:WordBool; safecall;//00584E50
    function insertBefore(const newChild:IDOMNode; const refChild:IDOMNode):IDOMNode; safecall;//00584EA4
    procedure normalize; safecall;//00584F64
    function removeChild(const childNode:IDOMNode):IDOMNode; safecall;//00584FE0
    function replaceChild(const newChild:IDOMNode; const oldChild:IDOMNode):IDOMNode; safecall;//00585068
    procedure set_nodeValue(value:DOMString); safecall;//00585104
    function supports(const feature:DOMString; const version:DOMString):WordBool;//0058517C
    function GetXMLDOMNode:IXMLDOMNode;//005851C8
    function selectNode(const nodePath:WideString):IDOMNode; safecall;//005851DC
    function get_text:DOMString; safecall;//005852E4
    procedure set_text(const Value:DOMString); safecall;//00585350
    function get_xml:DOMString; safecall;//005853AC
    procedure transformNode(const stylesheet:IDOMNode; var output:WideString); safecall;//0058541C
    procedure transformNode(const stylesheet:IDOMNode; const output:IDOMDocument); safecall;//0058549C
  end;
  TMSDOMNodeList = class(TMSDOMInterface)
  published
    constructor Create;//00585538
  public
    FMSNodeList:IXMLDOMNodeList;//fC
    function get_item(index:Integer):IDOMNode; safecall;//005855B4
    function get_length:Integer; safecall;//00585624
    constructor Create;//00585674
  end;
  TMSDOMNamedNodeMap = class(TMSDOMInterface)
  published
    constructor Create;//00585674
  public
    FMSNamedNodeMap:IXMLDOMNamedNodeMap;//fC
    function get_item(index:Integer):IDOMNode; safecall;//005856F0
    function get_length:Integer; safecall;//00585760
    function getNamedItem(const name:DOMString):IDOMNode; safecall;//005857B0
    function getNamedItemNS(const namespaceURI:DOMString; const localName:DOMString):IDOMNode; safecall;//00585838
    function removeNamedItem(const name:DOMString):IDOMNode; safecall;//005858D4
    function removeNamedItemNS(const namespaceURI:DOMString; const localName:DOMString):IDOMNode; safecall;//0058595C
    function setNamedItem(const newItem:IDOMNode):IDOMNode; safecall;//005859F8
    function setNamedItemNS(const arg:IDOMNode):IDOMNode; safecall;//00585A80
  end;
  TMSDOMCharacterData = class(TMSDOMNode)
    function GetMSCharacterData:IXMLDOMCharacterData;//00585B08
    procedure appendData(const data:DOMString); safecall;//00585B30
    procedure deleteData(offset:Integer; count:Integer); safecall;//00585BA4
    function get_data:DOMString; safecall;//00585C08
    function get_length:Integer; safecall;//00585C8C
    procedure insertData(offset:Integer; const data:DOMString); safecall;//00585CF8
    procedure replaceData(offset:Integer; count:Integer; const data:DOMString); safecall;//00585D70
    procedure set_data(const data:DOMString); safecall;//00585DEC
    function substringData(offset:Integer; count:Integer):DOMString; safecall;//00585E60
  end;
  TMSDOMAttr = class(TMSDOMNode)
    function GetMSAttribute:IXMLDOMAttribute;//00585EEC
    function get_name:DOMString; safecall;//00585F14
    function get_ownerElement:IDOMElement; safecall;//00585F98
    function get_specified:WordBool; safecall;//00586034
    function get_value:DOMString; safecall;//005860A0
    procedure set_value(const attributeValue:DOMString); safecall;//00586128
  end;
  TMSDOMElement = class(TMSDOMNode)
    function GetMSElement:IXMLDOMElement;//005861A8
    function get_tagName:DOMString; safecall;//005861D0
    function getAttribute(const name:DOMString):DOMString; safecall;//00586254
    function getAttributeNS(const namespaceURI:DOMString; const localName:DOMString):DOMString; safecall;//005862F4
    function getAttributeNode(const name:DOMString):IDOMAttr; safecall;//005863B0
    function getAttributeNodeNS(const namespaceURI:DOMString; const localName:DOMString):IDOMAttr; safecall;//00586474
    function hasAttribute(const name:DOMString):WordBool; safecall;//005866A8
    function hasAttributeNS(const namespaceURI:DOMString; const localName:DOMString):WordBool; safecall;//0058676C
    procedure removeAttribute(const name:DOMString); safecall;//00586804
    function removeAttributeNode(const oldAttr:IDOMAttr):IDOMAttr; safecall;//00586878
    procedure removeAttributeNS(const namespaceURI:DOMString; const localName:DOMString); safecall;//00586968
    procedure setAttribute(const name:DOMString; const value:DOMString); safecall;//00586A20
    function setAttributeNode(const newAttr:IDOMAttr):IDOMAttr; safecall;//00586AB8
    function setAttributeNodeNS(const newAttr:IDOMAttr):IDOMAttr; safecall;//00586BA8
    procedure setAttributeNS(const namespaceURI:DOMString; const qualifiedName:DOMString; const value:DOMString); safecall;//00586C00
    procedure normalize; safecall;//00586D60
    function getElementsByTagNameNS(const namespaceURI:DOMString; const localName:DOMString):IDOMNodeList; safecall;//005883B4
  end;
  TMSDOMText = class(TMSDOMCharacterData)
    function splitText(offset:Integer):IDOMText; safecall;//00586DBC
  end;
  TMSDOMComment = class(TMSDOMCharacterData)
  end;
  TMSDOMCDATASection = class(TMSDOMText)
  end;
  TMSDOMDocumentType = class(TMSDOMNode)
  public
    FEntities:IDOMNamedNodeMap;//f28
    FNotations:IDOMNamedNodeMap;//f2C
    function GetMSDocumentType:IXMLDOMDocumentType;//00586E88
    function get_internalSubset:DOMString; safecall;//00586F5C
    function get_name:DOMString; safecall;//00586FF4
    function get_publicId:DOMString; safecall;//00587124
    function get_systemId:DOMString; safecall;//005871B0
  end;
  TMSDOMNotation = class(TMSDOMNode)
    function GetMSNotation:IXMLDOMNotation;//0058723C
    function get_publicId:DOMString; safecall;//00587264
    function get_systemId:DOMString; safecall;//005872EC
  end;
  TMSDOMEntity = class(TMSDOMNode)
    function GetMSEntity:IXMLDOMEntity;//00587374
    function get_notationName:DOMString; safecall;//0058739C
    function get_publicId:DOMString; safecall;//00587420
    function get_systemId:DOMString; safecall;//005874A8
  end;
  TMSDOMEntityReference = class(TMSDOMNode)
  end;
  TMSDOMProcessingInstruction = class(TMSDOMNode)
    function GetMSProcessingInstruction:IXMLDOMProcessingInstruction;//00587530
    function get_data:DOMString; safecall;//00587558
    function get_target:DOMString; safecall;//005875DC
    procedure set_data(const value:DOMString); safecall;//00587660
  end;
  TMSDOMDocumentFragment = class(TMSDOMNode)
  end;
  TMSDOMEventHandler = class(TInterfacedObject)
  published
    constructor Create(Sender:TObject; AsyncEventHandler:TAsyncEventHandler);//005876D4
  public
    FSender:TObject;//fC
    FDocument:TMSDOMDocument;//f10
    FEventHandler:TAsyncEventHandler;//f18
    function GetIDsOfNames(const IID:TGUID; Names:Pointer; NameCount:Integer; LocaleID:Integer; DispIDs:Pointer):HRESULT; virtual; stdcall;//v0//00587710
    function GetTypeInfo(Index:Integer; LocaleID:Integer; var TypeInfo:void ):HRESULT; virtual; stdcall;//v4//0058771C
    function GetTypeInfoCount(var Count:Integer):HRESULT; virtual; stdcall;//v8//00587728
    function Invoke(DispID:Integer; const IID:TGUID; LocaleID:Integer; Flags:Word; var Params:void ; VarResult:Pointer; ExcepInfo:Pointer; ArgErr:Pointer):HRESULT; virtual; stdcall;//vC//00587734
  end;
  TMSDOMDocument = class(TMSDOMNode)
    function getElementsByTagNameNS(const namespaceURI:DOMString; const localName:DOMString):IDOMNodeList; safecall;//00586608
    function GetMSDocument:IXMLDOMDocument;//00587788
    function createAttribute(const name:DOMString):IDOMAttr; safecall;//00587898
    function createAttributeNS(const namespaceURI:DOMString; const qualifiedName:DOMString):IDOMAttr; safecall;//0058795C
    function createCDATASection(const data:DOMString):IDOMCDATASection; safecall;//00587A60
    function createComment(const data:DOMString):IDOMComment; safecall;//00587B28
    function createDocumentFragment:IDOMDocumentFragment; safecall;//00587BF0
    function createElement(const tagName:DOMString):IDOMElement; safecall;//00587CA0
    function createElementNS(const namespaceURI:DOMString; const qualifiedName:DOMString):IDOMElement; safecall;//00587D64
    function createEntityReference(const name:DOMString):IDOMEntityReference; safecall;//00587E68
    function createProcessingInstruction(const target:DOMString; const data:DOMString):IDOMProcessingInstruction; safecall;//00587F1C
    function createTextNode(const data:DOMString):IDOMText; safecall;//00587FE4
    function get_doctype:IDOMDocumentType; safecall;//005880A8
    function get_documentElement:IDOMElement; safecall;//00588140
    function get_domImplementation:IDOMImplementation; safecall;//005881F0
    function getElementById(const elementId:DOMString):IDOMElement; safecall;//00588288
    function importNode(importedNode:IDOMNode; deep:WordBool):IDOMNode; safecall;//00588454
    procedure set_documentElement(const IDOMElement:IDOMElement); safecall;//005884EC
    function get_async:Boolean; safecall;//00588640
    procedure set_async(Value:Boolean); safecall;//005886B4
    function get_preserveWhiteSpace:Boolean; safecall;//00588718
    function get_resolveExternals:Boolean; safecall;//0058878C
    function get_validate:Boolean; safecall;//00588800
    procedure set_preserveWhiteSpace(Value:Boolean); safecall;//00588874
    procedure set_resolveExternals(Value:Boolean); safecall;//005888D8
    procedure set_validate(Value:Boolean); safecall;//0058893C
    function asyncLoadState:Integer; safecall;//005889A0
    function get_xml:DOMString; safecall;//00588A0C
    function load(source:OleVariant):WordBool; safecall;//00588A90
    function loadFromStream(const stream:TStream):WordBool; safecall;//00588B1C
    procedure save(destination:OleVariant); safecall;//00588BD4
    procedure saveToStream(const stream:TStream); safecall;//00588C4C
    function loadxml(const Value:WideString):WordBool; safecall;//00588CF8
    procedure set_OnAsyncLoad(const Sender:TObject; EventHandler:TAsyncEventHandler); safecall;//00588D6C
    function loadFromStream(const stream:IStream):WordBool; safecall;//00588E88
    procedure saveToStream(const stream:IStream); safecall;//00588F18
    function get_errorCode:Integer; safecall;//00588F98
    function get_filepos:Integer; safecall;//00589024
    function get_line:Integer; safecall;//005890B0
    function get_linepos:Integer; safecall;//0058913C
    function get_reason:DOMString; safecall;//005891C8
    function get_srcText:DOMString; safecall;//0058926C
    function get_url:DOMString; safecall;//00589310
  end;
  TMSDOMImplementationFactory = class(TDOMVendor)
  published
    function Description:string;//005893D8
    function DOMImplementation:IDOMImplementation;//005893B4
  public
    function Description:string; virtual;//v0//005893D8
    function DOMImplementation:IDOMImplementation; virtual;//v4//005893B4
  end;
    function MakeNode(Node:IXMLDOMNode):IDOMNode;//00583FBC
    function MakeNamedNodeMap(const NamedNodeMap:IXMLDOMNamedNodeMap):IDOMNamedNodeMap;//00584048
    function MakeNodeList(const NodeList:IXMLDOMNodeList):IDOMNodeList;//00584070
    function GetMSNode(const Node:IDOMNode):IXMLDOMNode;//00584098
    function TryObjectCreate(const GuidList:array[$0..-$1] of System.TGUID; const _Dv_:$0..-$1):IUnknown;//005841D0
    function CreateDOMDocument:IXMLDOMDocument;//00584228
    //function sub_005847BC(?:?; ?:?):?;//005847BC
    //function sub_00584878(?:?; ?:?):?;//00584878
    //function sub_00585260(?:?; ?:?; ?:?):?;//00585260
    //function sub_0058656C(?:?; ?:?; ?:?):?;//0058656C
    //function sub_00586EB0(?:?; ?:?):?;//00586EB0
    //function sub_00587078(?:?; ?:?):?;//00587078
    function GetIDsOfNames(const IID:TGUID; Names:Pointer; NameCount:Integer; LocaleID:Integer; DispIDs:Pointer):HRESULT; stdcall;//00587710
    function GetTypeInfo(Index:Integer; LocaleID:Integer; var TypeInfo:void ):HRESULT; stdcall;//0058771C
    function GetTypeInfoCount(var Count:Integer):HRESULT; stdcall;//00587728
    function Invoke(DispID:Integer; const IID:TGUID; LocaleID:Integer; Flags:Word; var Params:void ; VarResult:Pointer; ExcepInfo:Pointer; ArgErr:Pointer):HRESULT; stdcall;//00587734
    //function sub_00588318(?:?; ?:?; ?:?):?;//00588318

implementation

//00583FBC
function MakeNode(Node:IXMLDOMNode):IDOMNode;
begin
{*
 00583FBC    push        ebp
 00583FBD    mov         ebp,esp
 00583FBF    add         esp,0FFFFFFF8
 00583FC2    push        ebx
 00583FC3    mov         ebx,edx
 00583FC5    mov         dword ptr [ebp-4],eax
 00583FC8    mov         eax,dword ptr [ebp-4]
 00583FCB    call        @IntfAddRef
 00583FD0    xor         eax,eax
 00583FD2    push        ebp
 00583FD3    push        584039
 00583FD8    push        dword ptr fs:[eax]
 00583FDB    mov         dword ptr fs:[eax],esp
 00583FDE    cmp         dword ptr [ebp-4],0
>00583FE2    je          0058401C
 00583FE4    lea         eax,[ebp-8]
 00583FE7    push        eax
 00583FE8    mov         eax,dword ptr [ebp-4]
 00583FEB    push        eax
 00583FEC    mov         eax,dword ptr [eax]
 00583FEE    call        dword ptr [eax+28]
 00583FF1    call        @CheckAutoResult
 00583FF6    mov         eax,dword ptr [ebp-8]
 00583FF9    mov         eax,dword ptr [eax*4+7899CC]
 00584000    mov         ecx,dword ptr [ebp-4]
 00584003    mov         dl,1
 00584005    call        TMSDOMNode.Create
 0058400A    mov         edx,eax
 0058400C    test        edx,edx
>0058400E    je          00584013
 00584010    sub         edx,0FFFFFFE0
 00584013    mov         eax,ebx
 00584015    call        @IntfCopy
>0058401A    jmp         00584023
 0058401C    mov         eax,ebx
 0058401E    call        @IntfClear
 00584023    xor         eax,eax
 00584025    pop         edx
 00584026    pop         ecx
 00584027    pop         ecx
 00584028    mov         dword ptr fs:[eax],edx
 0058402B    push        584040
 00584030    lea         eax,[ebp-4]
 00584033    call        @IntfClear
 00584038    ret
>00584039    jmp         @HandleFinally
>0058403E    jmp         00584030
 00584040    pop         ebx
 00584041    pop         ecx
 00584042    pop         ecx
 00584043    pop         ebp
 00584044    ret
*}
end;

//00584048
function MakeNamedNodeMap(const NamedNodeMap:IXMLDOMNamedNodeMap):IDOMNamedNodeMap;
begin
{*
 00584048    push        ebx
 00584049    push        esi
 0058404A    mov         esi,edx
 0058404C    mov         ebx,eax
 0058404E    mov         ecx,ebx
 00584050    mov         dl,1
 00584052    mov         eax,[00581430];TMSDOMNodeList
 00584057    call        TMSDOMNamedNodeMap.Create
 0058405C    mov         edx,eax
 0058405E    test        edx,edx
>00584060    je          00584065
 00584062    sub         edx,0FFFFFFF0
 00584065    mov         eax,esi
 00584067    call        @IntfCopy
 0058406C    pop         esi
 0058406D    pop         ebx
 0058406E    ret
*}
end;

//00584070
function MakeNodeList(const NodeList:IXMLDOMNodeList):IDOMNodeList;
begin
{*
 00584070    push        ebx
 00584071    push        esi
 00584072    mov         esi,edx
 00584074    mov         ebx,eax
 00584076    mov         ecx,ebx
 00584078    mov         dl,1
 0058407A    mov         eax,[0058162C];TMSDOMNamedNodeMap
 0058407F    call        TMSDOMNodeList.Create
 00584084    mov         edx,eax
 00584086    test        edx,edx
>00584088    je          0058408D
 0058408A    sub         edx,0FFFFFFF0
 0058408D    mov         eax,esi
 0058408F    call        @IntfCopy
 00584094    pop         esi
 00584095    pop         ebx
 00584096    ret
*}
end;

//00584098
function GetMSNode(const Node:IDOMNode):IXMLDOMNode;
begin
{*
 00584098    push        ebp
 00584099    mov         ebp,esp
 0058409B    push        0
 0058409D    push        0
 0058409F    push        ebx
 005840A0    push        esi
 005840A1    mov         esi,edx
 005840A3    mov         ebx,eax
 005840A5    xor         eax,eax
 005840A7    push        ebp
 005840A8    push        58410F
 005840AD    push        dword ptr fs:[eax]
 005840B0    mov         dword ptr fs:[eax],esp
 005840B3    test        ebx,ebx
>005840B5    jne         005840D8
 005840B7    lea         edx,[ebp-4]
 005840BA    mov         eax,[0078D12C];^SResString587:TResStringRec
 005840BF    call        LoadResString
 005840C4    mov         ecx,dword ptr [ebp-4]
 005840C7    mov         dl,1
 005840C9    mov         eax,[00589424];DOMException
 005840CE    call        Exception.Create
 005840D3    call        @RaiseExcept
 005840D8    lea         eax,[ebp-8]
 005840DB    mov         edx,ebx
 005840DD    mov         ecx,58411C
 005840E2    call        @IntfCast
 005840E7    mov         eax,dword ptr [ebp-8]
 005840EA    mov         edx,esi
 005840EC    mov         ecx,dword ptr [eax]
 005840EE    call        dword ptr [ecx+0C]
 005840F1    xor         eax,eax
 005840F3    pop         edx
 005840F4    pop         ecx
 005840F5    pop         ecx
 005840F6    mov         dword ptr fs:[eax],edx
 005840F9    push        584116
 005840FE    lea         eax,[ebp-8]
 00584101    call        @IntfClear
 00584106    lea         eax,[ebp-4]
 00584109    call        @UStrClr
 0058410E    ret
>0058410F    jmp         @HandleFinally
>00584114    jmp         005840FE
 00584116    pop         esi
 00584117    pop         ebx
 00584118    pop         ecx
 00584119    pop         ecx
 0058411A    pop         ebp
 0058411B    ret
*}
end;

//0058412C
function TMSDOMInterface.SafeCallException(ExceptObject:TObject; ExceptAddr:Pointer):HRESULT;
begin
{*
 0058412C    push        ebp
 0058412D    mov         ebp,esp
 0058412F    push        0
 00584131    push        0
 00584133    push        ebx
 00584134    push        esi
 00584135    mov         esi,ecx
 00584137    mov         ebx,edx
 00584139    xor         eax,eax
 0058413B    push        ebp
 0058413C    push        5841AF
 00584141    push        dword ptr fs:[eax]
 00584144    mov         dword ptr fs:[eax],esp
 00584147    mov         eax,ebx
 00584149    mov         edx,dword ptr ds:[52E8E0];EOleException
 0058414F    call        @IsClass
 00584154    test        al,al
>00584156    je          00584170
 00584158    mov         eax,ebx
 0058415A    mov         edx,dword ptr ds:[52E8E0];EOleException
 00584160    call        @AsClass
 00584165    mov         edx,dword ptr [eax+20]
 00584168    lea         eax,[ebp-4]
 0058416B    call        @UStrLAsg
 00584170    push        0
 00584172    lea         eax,[ebp-8]
 00584175    mov         edx,dword ptr [ebp-4]
 00584178    call        @WStrFromUStr
 0058417D    mov         eax,dword ptr [ebp-8]
 00584180    push        eax
 00584181    mov         ecx,5841C0
 00584186    mov         edx,esi
 00584188    mov         eax,ebx
 0058418A    call        HandleSafeCallException
 0058418F    mov         ebx,eax
 00584191    xor         eax,eax
 00584193    pop         edx
 00584194    pop         ecx
 00584195    pop         ecx
 00584196    mov         dword ptr fs:[eax],edx
 00584199    push        5841B6
 0058419E    lea         eax,[ebp-8]
 005841A1    call        @WStrClr
 005841A6    lea         eax,[ebp-4]
 005841A9    call        @UStrClr
 005841AE    ret
>005841AF    jmp         @HandleFinally
>005841B4    jmp         0058419E
 005841B6    mov         eax,ebx
 005841B8    pop         esi
 005841B9    pop         ebx
 005841BA    pop         ecx
 005841BB    pop         ecx
 005841BC    pop         ebp
 005841BD    ret
*}
end;

//005841D0
function TryObjectCreate(const GuidList:array[$0..-$1] of System.TGUID; const _Dv_:$0..-$1):IUnknown;
begin
{*
 005841D0    push        ebx
 005841D1    push        esi
 005841D2    push        edi
 005841D3    push        ebp
 005841D4    push        ecx
 005841D5    mov         ebp,ecx
 005841D7    mov         dword ptr [esp],edx
 005841DA    xor         esi,esi
 005841DC    mov         edi,dword ptr [esp]
 005841DF    test        edi,edi
>005841E1    jl          00584209
 005841E3    inc         edi
 005841E4    mov         ebx,eax
 005841E6    mov         eax,ebp
 005841E8    call        @IntfClear
 005841ED    push        eax
 005841EE    push        584218
 005841F3    push        5
 005841F5    push        0
 005841F7    push        ebx
 005841F8    call        ole32.CoCreateInstance
 005841FD    mov         esi,eax
 005841FF    test        esi,esi
>00584201    je          00584210
 00584203    add         ebx,10
 00584206    dec         edi
>00584207    jne         005841E6
 00584209    mov         eax,esi
 0058420B    call        OleCheck
 00584210    pop         edx
 00584211    pop         ebp
 00584212    pop         edi
 00584213    pop         esi
 00584214    pop         ebx
 00584215    ret
*}
end;

//00584228
function CreateDOMDocument:IXMLDOMDocument;
begin
{*
 00584228    push        ebp
 00584229    mov         ebp,esp
 0058422B    add         esp,0FFFFFFA8
 0058422E    push        ebx
 0058422F    push        esi
 00584230    push        edi
 00584231    xor         edx,edx
 00584233    mov         dword ptr [ebp-58],edx
 00584236    mov         dword ptr [ebp-4],edx
 00584239    mov         ebx,eax
 0058423B    xor         eax,eax
 0058423D    push        ebp
 0058423E    push        5842F2
 00584243    push        dword ptr fs:[eax]
 00584246    mov         dword ptr fs:[eax],esp
 00584249    mov         eax,[0078D7E0]
 0058424E    mov         esi,eax
 00584250    lea         edi,[ebp-54]
 00584253    movs        dword ptr [edi],dword ptr [esi]
 00584254    movs        dword ptr [edi],dword ptr [esi]
 00584255    movs        dword ptr [edi],dword ptr [esi]
 00584256    movs        dword ptr [edi],dword ptr [esi]
 00584257    mov         eax,[0078D254]
 0058425C    mov         esi,eax
 0058425E    lea         edi,[ebp-44]
 00584261    movs        dword ptr [edi],dword ptr [esi]
 00584262    movs        dword ptr [edi],dword ptr [esi]
 00584263    movs        dword ptr [edi],dword ptr [esi]
 00584264    movs        dword ptr [edi],dword ptr [esi]
 00584265    mov         eax,[0078D66C]
 0058426A    mov         esi,eax
 0058426C    lea         edi,[ebp-34]
 0058426F    movs        dword ptr [edi],dword ptr [esi]
 00584270    movs        dword ptr [edi],dword ptr [esi]
 00584271    movs        dword ptr [edi],dword ptr [esi]
 00584272    movs        dword ptr [edi],dword ptr [esi]
 00584273    mov         eax,[0078D350]
 00584278    mov         esi,eax
 0058427A    lea         edi,[ebp-24]
 0058427D    movs        dword ptr [edi],dword ptr [esi]
 0058427E    movs        dword ptr [edi],dword ptr [esi]
 0058427F    movs        dword ptr [edi],dword ptr [esi]
 00584280    movs        dword ptr [edi],dword ptr [esi]
 00584281    mov         eax,[0078CD0C]
 00584286    mov         esi,eax
 00584288    lea         edi,[ebp-14]
 0058428B    movs        dword ptr [edi],dword ptr [esi]
 0058428C    movs        dword ptr [edi],dword ptr [esi]
 0058428D    movs        dword ptr [edi],dword ptr [esi]
 0058428E    movs        dword ptr [edi],dword ptr [esi]
 0058428F    lea         eax,[ebp-54]
 00584292    lea         ecx,[ebp-4]
 00584295    mov         edx,4
 0058429A    call        TryObjectCreate
 0058429F    mov         edx,dword ptr [ebp-4]
 005842A2    mov         eax,ebx
 005842A4    mov         ecx,584300
 005842A9    call        @IntfCast
 005842AE    cmp         dword ptr [ebx],0
>005842B1    jne         005842D4
 005842B3    lea         edx,[ebp-58]
 005842B6    mov         eax,[0078D6A0];^SResString588:TResStringRec
 005842BB    call        LoadResString
 005842C0    mov         ecx,dword ptr [ebp-58]
 005842C3    mov         dl,1
 005842C5    mov         eax,[00589424];DOMException
 005842CA    call        Exception.Create
 005842CF    call        @RaiseExcept
 005842D4    xor         eax,eax
 005842D6    pop         edx
 005842D7    pop         ecx
 005842D8    pop         ecx
 005842D9    mov         dword ptr fs:[eax],edx
 005842DC    push        5842F9
 005842E1    lea         eax,[ebp-58]
 005842E4    call        @UStrClr
 005842E9    lea         eax,[ebp-4]
 005842EC    call        @IntfClear
 005842F1    ret
>005842F2    jmp         @HandleFinally
>005842F7    jmp         005842E1
 005842F9    pop         edi
 005842FA    pop         esi
 005842FB    pop         ebx
 005842FC    mov         esp,ebp
 005842FE    pop         ebp
 005842FF    ret
*}
end;

//00584310
constructor TMSDOMImplementation.Create;
begin
{*
 00584310    push        ebp
 00584311    mov         ebp,esp
 00584313    push        ecx
 00584314    push        ebx
 00584315    push        esi
 00584316    test        dl,dl
>00584318    je          00584322
 0058431A    add         esp,0FFFFFFF0
 0058431D    call        @ClassCreate
 00584322    mov         dword ptr [ebp-4],ecx
 00584325    mov         ebx,edx
 00584327    mov         esi,eax
 00584329    mov         eax,dword ptr [ebp-4]
 0058432C    call        @IntfAddRef
 00584331    xor         eax,eax
 00584333    push        ebp
 00584334    push        584369
 00584339    push        dword ptr fs:[eax]
 0058433C    mov         dword ptr fs:[eax],esp
 0058433F    xor         edx,edx
 00584341    mov         eax,esi
 00584343    call        TObject.Create
 00584348    lea         eax,[esi+0C]
 0058434B    mov         edx,dword ptr [ebp-4]
 0058434E    call        @IntfCopy
 00584353    xor         eax,eax
 00584355    pop         edx
 00584356    pop         ecx
 00584357    pop         ecx
 00584358    mov         dword ptr fs:[eax],edx
 0058435B    push        584370
 00584360    lea         eax,[ebp-4]
 00584363    call        @IntfClear
 00584368    ret
>00584369    jmp         @HandleFinally
>0058436E    jmp         00584360
 00584370    mov         eax,esi
 00584372    test        bl,bl
>00584374    je          00584385
 00584376    call        @AfterConstruction
 0058437B    pop         dword ptr fs:[0]
 00584382    add         esp,0C
 00584385    mov         eax,esi
 00584387    pop         esi
 00584388    pop         ebx
 00584389    pop         ecx
 0058438A    pop         ebp
 0058438B    ret
*}
end;

//0058438C
function TMSDOMImplementation.createDocument(const namespaceURI:DOMString; const qualifiedName:DOMString; doctype:IDOMDocumentType):IDOMDocument; safecall;
begin
{*
 0058438C    push        ebp
 0058438D    mov         ebp,esp
 0058438F    push        0
 00584391    push        ebx
 00584392    push        esi
 00584393    push        edi
 00584394    mov         eax,dword ptr [ebp+14]
 00584397    call        @IntfAddRef
 0058439C    mov         eax,dword ptr [ebp+18]
 0058439F    test        eax,eax
>005843A1    je          005843A7
 005843A3    xor         edx,edx
 005843A5    mov         dword ptr [eax],edx
 005843A7    push        dword ptr [ebp+8]
 005843AA    xor         eax,eax
 005843AC    push        ebp
 005843AD    push        5843EE
 005843B2    push        dword ptr fs:[eax]
 005843B5    mov         dword ptr fs:[eax],esp
 005843B8    lea         eax,[ebp-4]
 005843BB    call        dword ptr ds:[7899C8]
 005843C1    mov         ecx,dword ptr [ebp-4]
 005843C4    mov         dl,1
 005843C6    mov         eax,[00583DB8];TMSDOMDocument
 005843CB    call        TMSDOMNode.Create
 005843D0    mov         edx,eax
 005843D2    test        edx,edx
>005843D4    je          005843D9
 005843D6    sub         edx,0FFFFFFCC
 005843D9    mov         eax,dword ptr [ebp+18]
 005843DC    call        @IntfCopy
 005843E1    xor         eax,eax
 005843E3    pop         edx
 005843E4    pop         ecx
 005843E5    pop         ecx
 005843E6    mov         dword ptr fs:[eax],edx
 005843E9    pop         eax
 005843EA    xor         ebx,ebx
>005843EC    jmp         005843F3
>005843EE    jmp         @HandleAutoException
 005843F3    lea         eax,[ebp-4]
 005843F6    call        @IntfClear
 005843FB    lea         eax,[ebp+14]
 005843FE    call        @IntfClear
 00584403    mov         eax,ebx
 00584405    pop         edi
 00584406    pop         esi
 00584407    pop         ebx
 00584408    pop         ecx
 00584409    pop         ebp
 0058440A    ret         14
*}
end;

//00584410
function TMSDOMImplementation.createDocumentType(const qualifiedName:DOMString; const publicId:DOMString; const systemId:DOMString):IDOMDocumentType; safecall;
begin
{*
 00584410    push        ebp
 00584411    mov         ebp,esp
 00584413    push        ebx
 00584414    push        esi
 00584415    push        edi
 00584416    mov         eax,dword ptr [ebp+18]
 00584419    test        eax,eax
>0058441B    je          00584421
 0058441D    xor         edx,edx
 0058441F    mov         dword ptr [eax],edx
 00584421    push        dword ptr [ebp+8]
 00584424    xor         eax,eax
 00584426    push        ebp
 00584427    push        58444E
 0058442C    push        dword ptr fs:[eax]
 0058442F    mov         dword ptr fs:[eax],esp
 00584432    mov         edx,584468;'MSXML'
 00584437    mov         eax,584480;'createDocumentType'
 0058443C    call        DOMVendorNotSupported
 00584441    xor         eax,eax
 00584443    pop         edx
 00584444    pop         ecx
 00584445    pop         ecx
 00584446    mov         dword ptr fs:[eax],edx
 00584449    pop         eax
 0058444A    xor         ebx,ebx
>0058444C    jmp         00584453
>0058444E    jmp         @HandleAutoException
 00584453    mov         eax,ebx
 00584455    pop         edi
 00584456    pop         esi
 00584457    pop         ebx
 00584458    pop         ebp
 00584459    ret         14
*}
end;

//005844A8
function TMSDOMImplementation.hasFeature(const feature:DOMString; const version:DOMString):WordBool;
begin
{*
 005844A8    push        ebp
 005844A9    mov         ebp,esp
 005844AB    push        0
 005844AD    push        0
 005844AF    push        0
 005844B1    push        0
 005844B3    push        0
 005844B5    push        0
 005844B7    push        0
 005844B9    push        ebx
 005844BA    push        esi
 005844BB    push        edi
 005844BC    mov         edi,ecx
 005844BE    mov         esi,edx
 005844C0    mov         ebx,eax
 005844C2    xor         eax,eax
 005844C4    push        ebp
 005844C5    push        58458A
 005844CA    push        dword ptr fs:[eax]
 005844CD    mov         dword ptr fs:[eax],esp
 005844D0    cmp         dword ptr [ebx+0C],0
>005844D4    je          0058450A
 005844D6    lea         eax,[ebp-4]
 005844D9    push        eax
 005844DA    lea         eax,[ebp-8]
 005844DD    mov         edx,edi
 005844DF    call        @WStrFromUStr
 005844E4    mov         eax,dword ptr [ebp-8]
 005844E7    push        eax
 005844E8    lea         eax,[ebp-0C]
 005844EB    mov         edx,esi
 005844ED    call        @WStrFromUStr
 005844F2    mov         eax,dword ptr [ebp-0C]
 005844F5    push        eax
 005844F6    mov         eax,dword ptr [ebx+0C]
 005844F9    push        eax
 005844FA    mov         eax,dword ptr [eax]
 005844FC    call        dword ptr [eax+1C]
 005844FF    call        @CheckAutoResult
 00584504    movzx       ebx,word ptr [ebp-4]
>00584508    jmp         0058455F
 0058450A    lea         eax,[ebp-4]
 0058450D    push        eax
 0058450E    lea         eax,[ebp-10]
 00584511    mov         edx,edi
 00584513    call        @WStrFromUStr
 00584518    mov         eax,dword ptr [ebp-10]
 0058451B    push        eax
 0058451C    lea         eax,[ebp-14]
 0058451F    mov         edx,esi
 00584521    call        @WStrFromUStr
 00584526    mov         eax,dword ptr [ebp-14]
 00584529    push        eax
 0058452A    lea         eax,[ebp-18]
 0058452D    call        @IntfClear
 00584532    push        eax
 00584533    lea         eax,[ebp-1C]
 00584536    call        dword ptr ds:[7899C8]
 0058453C    mov         eax,dword ptr [ebp-1C]
 0058453F    push        eax
 00584540    mov         eax,dword ptr [eax]
 00584542    call        dword ptr [eax+0B0]
 00584548    call        @CheckAutoResult
 0058454D    mov         eax,dword ptr [ebp-18]
 00584550    push        eax
 00584551    mov         eax,dword ptr [eax]
 00584553    call        dword ptr [eax+1C]
 00584556    call        @CheckAutoResult
 0058455B    movzx       ebx,word ptr [ebp-4]
 0058455F    xor         eax,eax
 00584561    pop         edx
 00584562    pop         ecx
 00584563    pop         ecx
 00584564    mov         dword ptr fs:[eax],edx
 00584567    push        584591
 0058456C    lea         eax,[ebp-1C]
 0058456F    call        @IntfClear
 00584574    lea         eax,[ebp-18]
 00584577    call        @IntfClear
 0058457C    lea         eax,[ebp-14]
 0058457F    mov         edx,4
 00584584    call        @WStrArrayClr
 00584589    ret
>0058458A    jmp         @HandleFinally
>0058458F    jmp         0058456C
 00584591    mov         eax,ebx
 00584593    pop         edi
 00584594    pop         esi
 00584595    pop         ebx
 00584596    mov         esp,ebp
 00584598    pop         ebp
 00584599    ret
*}
end;

//0058459C
constructor TMSDOMNode.Create;
begin
{*
 0058459C    push        ebp
 0058459D    mov         ebp,esp
 0058459F    push        ecx
 005845A0    push        ebx
 005845A1    push        esi
 005845A2    test        dl,dl
>005845A4    je          005845AE
 005845A6    add         esp,0FFFFFFF0
 005845A9    call        @ClassCreate
 005845AE    mov         dword ptr [ebp-4],ecx
 005845B1    mov         ebx,edx
 005845B3    mov         esi,eax
 005845B5    mov         eax,dword ptr [ebp-4]
 005845B8    call        @IntfAddRef
 005845BD    xor         eax,eax
 005845BF    push        ebp
 005845C0    push        58460F
 005845C5    push        dword ptr fs:[eax]
 005845C8    mov         dword ptr fs:[eax],esp
 005845CB    cmp         dword ptr [ebp-4],0
>005845CF    jne         005845E5
 005845D1    mov         ecx,205
 005845D6    mov         edx,584640;'C:\Builds\TP\xml\msxmldom.pas'
 005845DB    mov         eax,584688;'Assertion failure'
 005845E0    call        @Assert
 005845E5    lea         eax,[esi+0C]
 005845E8    mov         edx,dword ptr [ebp-4]
 005845EB    call        @IntfCopy
 005845F0    xor         edx,edx
 005845F2    mov         eax,esi
 005845F4    call        TObject.Create
 005845F9    xor         eax,eax
 005845FB    pop         edx
 005845FC    pop         ecx
 005845FD    pop         ecx
 005845FE    mov         dword ptr fs:[eax],edx
 00584601    push        584616
 00584606    lea         eax,[ebp-4]
 00584609    call        @IntfClear
 0058460E    ret
>0058460F    jmp         @HandleFinally
>00584614    jmp         00584606
 00584616    mov         eax,esi
 00584618    test        bl,bl
>0058461A    je          0058462B
 0058461C    call        @AfterConstruction
 00584621    pop         dword ptr fs:[0]
 00584628    add         esp,0C
 0058462B    mov         eax,esi
 0058462D    pop         esi
 0058462E    pop         ebx
 0058462F    pop         ecx
 00584630    pop         ebp
 00584631    ret
*}
end;

//005846AC
function TMSDOMNode.appendChild(const newChild:IDOMNode):IDOMNode; safecall;
begin
{*
 005846AC    push        ebp
 005846AD    mov         ebp,esp
 005846AF    push        0
 005846B1    push        0
 005846B3    push        ebx
 005846B4    push        esi
 005846B5    push        edi
 005846B6    mov         esi,dword ptr [ebp+0C]
 005846B9    mov         ebx,dword ptr [ebp+8]
 005846BC    mov         eax,dword ptr [ebp+10]
 005846BF    test        eax,eax
>005846C1    je          005846C7
 005846C3    xor         edx,edx
 005846C5    mov         dword ptr [eax],edx
 005846C7    push        ebx
 005846C8    xor         eax,eax
 005846CA    push        ebp
 005846CB    push        584727
 005846D0    push        dword ptr fs:[eax]
 005846D3    mov         dword ptr fs:[eax],esp
 005846D6    lea         edx,[ebp-4]
 005846D9    mov         eax,esi
 005846DB    call        GetMSNode
 005846E0    lea         eax,[ebp-8]
 005846E3    call        @IntfClear
 005846E8    push        eax
 005846E9    mov         eax,dword ptr [ebp-4]
 005846EC    push        eax
 005846ED    mov         eax,dword ptr [ebx+0C]
 005846F0    push        eax
 005846F1    mov         eax,dword ptr [eax]
 005846F3    call        dword ptr [eax+54]
 005846F6    call        @CheckAutoResult
 005846FB    mov         eax,dword ptr [ebp-8]
 005846FE    cmp         eax,dword ptr [ebp-4]
>00584701    jne         0058470F
 00584703    mov         eax,dword ptr [ebp+10]
 00584706    mov         edx,esi
 00584708    call        @IntfCopy
>0058470D    jmp         0058471A
 0058470F    mov         edx,dword ptr [ebp+10]
 00584712    mov         eax,dword ptr [ebp-8]
 00584715    call        MakeNode
 0058471A    xor         eax,eax
 0058471C    pop         edx
 0058471D    pop         ecx
 0058471E    pop         ecx
 0058471F    mov         dword ptr fs:[eax],edx
 00584722    pop         eax
 00584723    xor         ebx,ebx
>00584725    jmp         0058472C
>00584727    jmp         @HandleAutoException
 0058472C    lea         eax,[ebp-8]
 0058472F    mov         edx,dword ptr ds:[5809EC];IXMLDOMNode
 00584735    mov         ecx,2
 0058473A    call        @FinalizeArray
 0058473F    mov         eax,ebx
 00584741    pop         edi
 00584742    pop         esi
 00584743    pop         ebx
 00584744    pop         ecx
 00584745    pop         ecx
 00584746    pop         ebp
 00584747    ret         0C
*}
end;

//0058474C
function TMSDOMNode.cloneNode(deep:WordBool):IDOMNode; safecall;
begin
{*
 0058474C    push        ebp
 0058474D    mov         ebp,esp
 0058474F    push        0
 00584751    push        ebx
 00584752    push        esi
 00584753    push        edi
 00584754    mov         ebx,dword ptr [ebp+8]
 00584757    mov         eax,dword ptr [ebp+10]
 0058475A    test        eax,eax
>0058475C    je          00584762
 0058475E    xor         edx,edx
 00584760    mov         dword ptr [eax],edx
 00584762    push        ebx
 00584763    xor         eax,eax
 00584765    push        ebp
 00584766    push        5847A5
 0058476B    push        dword ptr fs:[eax]
 0058476E    mov         dword ptr fs:[eax],esp
 00584771    lea         eax,[ebp-4]
 00584774    call        @IntfClear
 00584779    push        eax
 0058477A    movzx       eax,word ptr [ebp+0C]
 0058477E    push        eax
 0058477F    mov         eax,dword ptr [ebx+0C]
 00584782    push        eax
 00584783    mov         eax,dword ptr [eax]
 00584785    call        dword ptr [eax+60]
 00584788    call        @CheckAutoResult
 0058478D    mov         eax,dword ptr [ebp-4]
 00584790    mov         edx,dword ptr [ebp+10]
 00584793    call        MakeNode
 00584798    xor         eax,eax
 0058479A    pop         edx
 0058479B    pop         ecx
 0058479C    pop         ecx
 0058479D    mov         dword ptr fs:[eax],edx
 005847A0    pop         eax
 005847A1    xor         ebx,ebx
>005847A3    jmp         005847AA
>005847A5    jmp         @HandleAutoException
 005847AA    lea         eax,[ebp-4]
 005847AD    call        @IntfClear
 005847B2    mov         eax,ebx
 005847B4    pop         edi
 005847B5    pop         esi
 005847B6    pop         ebx
 005847B7    pop         ecx
 005847B8    pop         ebp
 005847B9    ret         0C
*}
end;

//005847BC
{*function sub_005847BC(?:?; ?:?):?;
begin
 005847BC    push        ebp
 005847BD    mov         ebp,esp
 005847BF    push        0
 005847C1    push        0
 005847C3    push        0
 005847C5    push        ebx
 005847C6    push        esi
 005847C7    push        edi
 005847C8    mov         ebx,dword ptr [ebp+8]
 005847CB    mov         eax,dword ptr [ebp+0C]
 005847CE    test        eax,eax
>005847D0    je          005847D6
 005847D2    xor         edx,edx
 005847D4    mov         dword ptr [eax],edx
 005847D6    push        ebx
 005847D7    xor         eax,eax
 005847D9    push        ebp
 005847DA    push        58484D
 005847DF    push        dword ptr fs:[eax]
 005847E2    mov         dword ptr fs:[eax],esp
 005847E5    cmp         dword ptr [ebx+14],0
>005847E9    jne         00584835
 005847EB    lea         eax,[ebp-4]
 005847EE    call        @IntfClear
 005847F3    push        eax
 005847F4    mov         eax,dword ptr [ebx+0C]
 005847F7    push        eax
 005847F8    mov         eax,dword ptr [eax]
 005847FA    call        dword ptr [eax+44]
 005847FD    call        @CheckAutoResult
 00584802    cmp         dword ptr [ebp-4],0
>00584806    je          00584835
 00584808    lea         eax,[ebp-0C]
 0058480B    call        @IntfClear
 00584810    push        eax
 00584811    mov         eax,dword ptr [ebx+0C]
 00584814    push        eax
 00584815    mov         eax,dword ptr [eax]
 00584817    call        dword ptr [eax+44]
 0058481A    call        @CheckAutoResult
 0058481F    mov         eax,dword ptr [ebp-0C]
 00584822    lea         edx,[ebp-8]
 00584825    call        MakeNodeList
 0058482A    mov         edx,dword ptr [ebp-8]
 0058482D    lea         eax,[ebx+14]
 00584830    call        @IntfCopy
 00584835    mov         eax,dword ptr [ebp+0C]
 00584838    mov         edx,dword ptr [ebx+14]
 0058483B    call        @IntfCopy
 00584840    xor         eax,eax
 00584842    pop         edx
 00584843    pop         ecx
 00584844    pop         ecx
 00584845    mov         dword ptr fs:[eax],edx
 00584848    pop         eax
 00584849    xor         ebx,ebx
>0058484B    jmp         00584852
>0058484D    jmp         @HandleAutoException
 00584852    lea         eax,[ebp-0C]
 00584855    call        @IntfClear
 0058485A    lea         eax,[ebp-8]
 0058485D    call        @IntfClear
 00584862    lea         eax,[ebp-4]
 00584865    call        @IntfClear
 0058486A    mov         eax,ebx
 0058486C    pop         edi
 0058486D    pop         esi
 0058486E    pop         ebx
 0058486F    mov         esp,ebp
 00584871    pop         ebp
 00584872    ret         8
end;*}

//00584878
{*function sub_00584878(?:?; ?:?):?;
begin
 00584878    push        ebp
 00584879    mov         ebp,esp
 0058487B    push        0
 0058487D    push        0
 0058487F    push        ebx
 00584880    push        esi
 00584881    push        edi
 00584882    mov         ebx,dword ptr [ebp+8]
 00584885    mov         eax,dword ptr [ebp+0C]
 00584888    test        eax,eax
>0058488A    je          00584890
 0058488C    xor         edx,edx
 0058488E    mov         dword ptr [eax],edx
 00584890    push        ebx
 00584891    xor         eax,eax
 00584893    push        ebp
 00584894    push        5848EA
 00584899    push        dword ptr fs:[eax]
 0058489C    mov         dword ptr fs:[eax],esp
 0058489F    cmp         dword ptr [ebx+10],0
>005848A3    jne         005848D2
 005848A5    lea         eax,[ebp-8]
 005848A8    call        @IntfClear
 005848AD    push        eax
 005848AE    mov         eax,dword ptr [ebx+0C]
 005848B1    push        eax
 005848B2    mov         eax,dword ptr [eax]
 005848B4    call        dword ptr [eax+30]
 005848B7    call        @CheckAutoResult
 005848BC    mov         eax,dword ptr [ebp-8]
 005848BF    lea         edx,[ebp-4]
 005848C2    call        MakeNamedNodeMap
 005848C7    mov         edx,dword ptr [ebp-4]
 005848CA    lea         eax,[ebx+10]
 005848CD    call        @IntfCopy
 005848D2    mov         eax,dword ptr [ebp+0C]
 005848D5    mov         edx,dword ptr [ebx+10]
 005848D8    call        @IntfCopy
 005848DD    xor         eax,eax
 005848DF    pop         edx
 005848E0    pop         ecx
 005848E1    pop         ecx
 005848E2    mov         dword ptr fs:[eax],edx
 005848E5    pop         eax
 005848E6    xor         ebx,ebx
>005848E8    jmp         005848EF
>005848EA    jmp         @HandleAutoException
 005848EF    lea         eax,[ebp-8]
 005848F2    call        @IntfClear
 005848F7    lea         eax,[ebp-4]
 005848FA    call        @IntfClear
 005848FF    mov         eax,ebx
 00584901    pop         edi
 00584902    pop         esi
 00584903    pop         ebx
 00584904    pop         ecx
 00584905    pop         ecx
 00584906    pop         ebp
 00584907    ret         8
end;*}

//0058490C
function TMSDOMNode.get_firstChild:IDOMNode; safecall;
begin
{*
 0058490C    push        ebp
 0058490D    mov         ebp,esp
 0058490F    push        0
 00584911    push        ebx
 00584912    push        esi
 00584913    push        edi
 00584914    mov         ebx,dword ptr [ebp+8]
 00584917    mov         eax,dword ptr [ebp+0C]
 0058491A    test        eax,eax
>0058491C    je          00584922
 0058491E    xor         edx,edx
 00584920    mov         dword ptr [eax],edx
 00584922    push        ebx
 00584923    xor         eax,eax
 00584925    push        ebp
 00584926    push        584960
 0058492B    push        dword ptr fs:[eax]
 0058492E    mov         dword ptr fs:[eax],esp
 00584931    lea         eax,[ebp-4]
 00584934    call        @IntfClear
 00584939    push        eax
 0058493A    mov         eax,dword ptr [ebx+0C]
 0058493D    push        eax
 0058493E    mov         eax,dword ptr [eax]
 00584940    call        dword ptr [eax+34]
 00584943    call        @CheckAutoResult
 00584948    mov         eax,dword ptr [ebp-4]
 0058494B    mov         edx,dword ptr [ebp+0C]
 0058494E    call        MakeNode
 00584953    xor         eax,eax
 00584955    pop         edx
 00584956    pop         ecx
 00584957    pop         ecx
 00584958    mov         dword ptr fs:[eax],edx
 0058495B    pop         eax
 0058495C    xor         ebx,ebx
>0058495E    jmp         00584965
>00584960    jmp         @HandleAutoException
 00584965    lea         eax,[ebp-4]
 00584968    call        @IntfClear
 0058496D    mov         eax,ebx
 0058496F    pop         edi
 00584970    pop         esi
 00584971    pop         ebx
 00584972    pop         ecx
 00584973    pop         ebp
 00584974    ret         8
*}
end;

//00584978
function TMSDOMNode.get_lastChild:IDOMNode; safecall;
begin
{*
 00584978    push        ebp
 00584979    mov         ebp,esp
 0058497B    push        0
 0058497D    push        ebx
 0058497E    push        esi
 0058497F    push        edi
 00584980    mov         ebx,dword ptr [ebp+8]
 00584983    mov         eax,dword ptr [ebp+0C]
 00584986    test        eax,eax
>00584988    je          0058498E
 0058498A    xor         edx,edx
 0058498C    mov         dword ptr [eax],edx
 0058498E    push        ebx
 0058498F    xor         eax,eax
 00584991    push        ebp
 00584992    push        5849CC
 00584997    push        dword ptr fs:[eax]
 0058499A    mov         dword ptr fs:[eax],esp
 0058499D    lea         eax,[ebp-4]
 005849A0    call        @IntfClear
 005849A5    push        eax
 005849A6    mov         eax,dword ptr [ebx+0C]
 005849A9    push        eax
 005849AA    mov         eax,dword ptr [eax]
 005849AC    call        dword ptr [eax+38]
 005849AF    call        @CheckAutoResult
 005849B4    mov         eax,dword ptr [ebp-4]
 005849B7    mov         edx,dword ptr [ebp+0C]
 005849BA    call        MakeNode
 005849BF    xor         eax,eax
 005849C1    pop         edx
 005849C2    pop         ecx
 005849C3    pop         ecx
 005849C4    mov         dword ptr fs:[eax],edx
 005849C7    pop         eax
 005849C8    xor         ebx,ebx
>005849CA    jmp         005849D1
>005849CC    jmp         @HandleAutoException
 005849D1    lea         eax,[ebp-4]
 005849D4    call        @IntfClear
 005849D9    mov         eax,ebx
 005849DB    pop         edi
 005849DC    pop         esi
 005849DD    pop         ebx
 005849DE    pop         ecx
 005849DF    pop         ebp
 005849E0    ret         8
*}
end;

//005849E4
function TMSDOMNode.get_localName:DOMString; safecall;
begin
{*
 005849E4    push        ebp
 005849E5    mov         ebp,esp
 005849E7    push        0
 005849E9    push        ebx
 005849EA    push        esi
 005849EB    push        edi
 005849EC    mov         ebx,dword ptr [ebp+8]
 005849EF    mov         eax,dword ptr [ebp+0C]
 005849F2    test        eax,eax
>005849F4    je          005849FA
 005849F6    xor         edx,edx
 005849F8    mov         dword ptr [eax],edx
 005849FA    push        ebx
 005849FB    xor         eax,eax
 005849FD    push        ebp
 005849FE    push        584A3B
 00584A03    push        dword ptr fs:[eax]
 00584A06    mov         dword ptr fs:[eax],esp
 00584A09    lea         eax,[ebp-4]
 00584A0C    call        @WStrClr
 00584A11    push        eax
 00584A12    mov         eax,dword ptr [ebx+0C]
 00584A15    push        eax
 00584A16    mov         eax,dword ptr [eax]
 00584A18    call        dword ptr [eax+0A4]
 00584A1E    call        @CheckAutoResult
 00584A23    mov         edx,dword ptr [ebp-4]
 00584A26    mov         eax,dword ptr [ebp+0C]
 00584A29    call        @UStrFromWStr
 00584A2E    xor         eax,eax
 00584A30    pop         edx
 00584A31    pop         ecx
 00584A32    pop         ecx
 00584A33    mov         dword ptr fs:[eax],edx
 00584A36    pop         eax
 00584A37    xor         ebx,ebx
>00584A39    jmp         00584A40
>00584A3B    jmp         @HandleAutoException
 00584A40    lea         eax,[ebp-4]
 00584A43    call        @WStrClr
 00584A48    mov         eax,ebx
 00584A4A    pop         edi
 00584A4B    pop         esi
 00584A4C    pop         ebx
 00584A4D    pop         ecx
 00584A4E    pop         ebp
 00584A4F    ret         8
*}
end;

//00584A54
function TMSDOMNode.get_namespaceURI:DOMString; safecall;
begin
{*
 00584A54    push        ebp
 00584A55    mov         ebp,esp
 00584A57    push        0
 00584A59    push        ebx
 00584A5A    push        esi
 00584A5B    push        edi
 00584A5C    mov         ebx,dword ptr [ebp+8]
 00584A5F    mov         eax,dword ptr [ebp+0C]
 00584A62    test        eax,eax
>00584A64    je          00584A6A
 00584A66    xor         edx,edx
 00584A68    mov         dword ptr [eax],edx
 00584A6A    push        ebx
 00584A6B    xor         eax,eax
 00584A6D    push        ebp
 00584A6E    push        584AAB
 00584A73    push        dword ptr fs:[eax]
 00584A76    mov         dword ptr fs:[eax],esp
 00584A79    lea         eax,[ebp-4]
 00584A7C    call        @WStrClr
 00584A81    push        eax
 00584A82    mov         eax,dword ptr [ebx+0C]
 00584A85    push        eax
 00584A86    mov         eax,dword ptr [eax]
 00584A88    call        dword ptr [eax+9C]
 00584A8E    call        @CheckAutoResult
 00584A93    mov         edx,dword ptr [ebp-4]
 00584A96    mov         eax,dword ptr [ebp+0C]
 00584A99    call        @UStrFromWStr
 00584A9E    xor         eax,eax
 00584AA0    pop         edx
 00584AA1    pop         ecx
 00584AA2    pop         ecx
 00584AA3    mov         dword ptr fs:[eax],edx
 00584AA6    pop         eax
 00584AA7    xor         ebx,ebx
>00584AA9    jmp         00584AB0
>00584AAB    jmp         @HandleAutoException
 00584AB0    lea         eax,[ebp-4]
 00584AB3    call        @WStrClr
 00584AB8    mov         eax,ebx
 00584ABA    pop         edi
 00584ABB    pop         esi
 00584ABC    pop         ebx
 00584ABD    pop         ecx
 00584ABE    pop         ebp
 00584ABF    ret         8
*}
end;

//00584AC4
function TMSDOMNode.get_nextSibling:IDOMNode; safecall;
begin
{*
 00584AC4    push        ebp
 00584AC5    mov         ebp,esp
 00584AC7    push        0
 00584AC9    push        ebx
 00584ACA    push        esi
 00584ACB    push        edi
 00584ACC    mov         ebx,dword ptr [ebp+8]
 00584ACF    mov         eax,dword ptr [ebp+0C]
 00584AD2    test        eax,eax
>00584AD4    je          00584ADA
 00584AD6    xor         edx,edx
 00584AD8    mov         dword ptr [eax],edx
 00584ADA    push        ebx
 00584ADB    xor         eax,eax
 00584ADD    push        ebp
 00584ADE    push        584B18
 00584AE3    push        dword ptr fs:[eax]
 00584AE6    mov         dword ptr fs:[eax],esp
 00584AE9    lea         eax,[ebp-4]
 00584AEC    call        @IntfClear
 00584AF1    push        eax
 00584AF2    mov         eax,dword ptr [ebx+0C]
 00584AF5    push        eax
 00584AF6    mov         eax,dword ptr [eax]
 00584AF8    call        dword ptr [eax+40]
 00584AFB    call        @CheckAutoResult
 00584B00    mov         eax,dword ptr [ebp-4]
 00584B03    mov         edx,dword ptr [ebp+0C]
 00584B06    call        MakeNode
 00584B0B    xor         eax,eax
 00584B0D    pop         edx
 00584B0E    pop         ecx
 00584B0F    pop         ecx
 00584B10    mov         dword ptr fs:[eax],edx
 00584B13    pop         eax
 00584B14    xor         ebx,ebx
>00584B16    jmp         00584B1D
>00584B18    jmp         @HandleAutoException
 00584B1D    lea         eax,[ebp-4]
 00584B20    call        @IntfClear
 00584B25    mov         eax,ebx
 00584B27    pop         edi
 00584B28    pop         esi
 00584B29    pop         ebx
 00584B2A    pop         ecx
 00584B2B    pop         ebp
 00584B2C    ret         8
*}
end;

//00584B30
function TMSDOMNode.get_nodeName:DOMString; safecall;
begin
{*
 00584B30    push        ebp
 00584B31    mov         ebp,esp
 00584B33    push        0
 00584B35    push        ebx
 00584B36    push        esi
 00584B37    push        edi
 00584B38    mov         ebx,dword ptr [ebp+8]
 00584B3B    mov         eax,dword ptr [ebp+0C]
 00584B3E    test        eax,eax
>00584B40    je          00584B46
 00584B42    xor         edx,edx
 00584B44    mov         dword ptr [eax],edx
 00584B46    push        ebx
 00584B47    xor         eax,eax
 00584B49    push        ebp
 00584B4A    push        584B84
 00584B4F    push        dword ptr fs:[eax]
 00584B52    mov         dword ptr fs:[eax],esp
 00584B55    lea         eax,[ebp-4]
 00584B58    call        @WStrClr
 00584B5D    push        eax
 00584B5E    mov         eax,dword ptr [ebx+0C]
 00584B61    push        eax
 00584B62    mov         eax,dword ptr [eax]
 00584B64    call        dword ptr [eax+1C]
 00584B67    call        @CheckAutoResult
 00584B6C    mov         edx,dword ptr [ebp-4]
 00584B6F    mov         eax,dword ptr [ebp+0C]
 00584B72    call        @UStrFromWStr
 00584B77    xor         eax,eax
 00584B79    pop         edx
 00584B7A    pop         ecx
 00584B7B    pop         ecx
 00584B7C    mov         dword ptr fs:[eax],edx
 00584B7F    pop         eax
 00584B80    xor         ebx,ebx
>00584B82    jmp         00584B89
>00584B84    jmp         @HandleAutoException
 00584B89    lea         eax,[ebp-4]
 00584B8C    call        @WStrClr
 00584B91    mov         eax,ebx
 00584B93    pop         edi
 00584B94    pop         esi
 00584B95    pop         ebx
 00584B96    pop         ecx
 00584B97    pop         ebp
 00584B98    ret         8
*}
end;

//00584B9C
function TMSDOMNode.get_nodeType:DOMNodeType; safecall;
begin
{*
 00584B9C    push        ebp
 00584B9D    mov         ebp,esp
 00584B9F    push        ecx
 00584BA0    push        ebx
 00584BA1    push        esi
 00584BA2    push        edi
 00584BA3    mov         ebx,dword ptr [ebp+8]
 00584BA6    push        ebx
 00584BA7    xor         eax,eax
 00584BA9    push        ebp
 00584BAA    push        584BDD
 00584BAF    push        dword ptr fs:[eax]
 00584BB2    mov         dword ptr fs:[eax],esp
 00584BB5    lea         eax,[ebp-4]
 00584BB8    push        eax
 00584BB9    mov         eax,dword ptr [ebx+0C]
 00584BBC    push        eax
 00584BBD    mov         eax,dword ptr [eax]
 00584BBF    call        dword ptr [eax+28]
 00584BC2    call        @CheckAutoResult
 00584BC7    mov         eax,dword ptr [ebp-4]
 00584BCA    mov         edx,dword ptr [ebp+0C]
 00584BCD    mov         word ptr [edx],ax
 00584BD0    xor         eax,eax
 00584BD2    pop         edx
 00584BD3    pop         ecx
 00584BD4    pop         ecx
 00584BD5    mov         dword ptr fs:[eax],edx
 00584BD8    pop         eax
 00584BD9    xor         ebx,ebx
>00584BDB    jmp         00584BE2
>00584BDD    jmp         @HandleAutoException
 00584BE2    mov         eax,ebx
 00584BE4    pop         edi
 00584BE5    pop         esi
 00584BE6    pop         ebx
 00584BE7    pop         ecx
 00584BE8    pop         ebp
 00584BE9    ret         8
*}
end;

//00584BEC
function TMSDOMNode.get_nodeValue:DOMString; safecall;
begin
{*
 00584BEC    push        ebp
 00584BED    mov         ebp,esp
 00584BEF    xor         ecx,ecx
 00584BF1    push        ecx
 00584BF2    push        ecx
 00584BF3    push        ecx
 00584BF4    push        ecx
 00584BF5    push        ebx
 00584BF6    push        esi
 00584BF7    push        edi
 00584BF8    mov         ebx,dword ptr [ebp+8]
 00584BFB    mov         eax,dword ptr [ebp+0C]
 00584BFE    test        eax,eax
>00584C00    je          00584C06
 00584C02    xor         edx,edx
 00584C04    mov         dword ptr [eax],edx
 00584C06    push        ebx
 00584C07    xor         eax,eax
 00584C09    push        ebp
 00584C0A    push        584C5A
 00584C0F    push        dword ptr fs:[eax]
 00584C12    mov         dword ptr fs:[eax],esp
 00584C15    lea         eax,[ebp-10]
 00584C18    call        @VarClr
 00584C1D    push        eax
 00584C1E    mov         eax,dword ptr [ebx+0C]
 00584C21    push        eax
 00584C22    mov         eax,dword ptr [eax]
 00584C24    call        dword ptr [eax+20]
 00584C27    call        @CheckAutoResult
 00584C2C    lea         eax,[ebp-10]
 00584C2F    call        VarIsNull
 00584C34    test        al,al
>00584C36    jne         00584C45
 00584C38    mov         eax,dword ptr [ebp+0C]
 00584C3B    lea         edx,[ebp-10]
 00584C3E    call        @VarToUStr
>00584C43    jmp         00584C4D
 00584C45    mov         eax,dword ptr [ebp+0C]
 00584C48    call        @UStrClr
 00584C4D    xor         eax,eax
 00584C4F    pop         edx
 00584C50    pop         ecx
 00584C51    pop         ecx
 00584C52    mov         dword ptr fs:[eax],edx
 00584C55    pop         eax
 00584C56    xor         ebx,ebx
>00584C58    jmp         00584C5F
>00584C5A    jmp         @HandleAutoException
 00584C5F    lea         eax,[ebp-10]
 00584C62    call        @VarClr
 00584C67    mov         eax,ebx
 00584C69    pop         edi
 00584C6A    pop         esi
 00584C6B    pop         ebx
 00584C6C    mov         esp,ebp
 00584C6E    pop         ebp
 00584C6F    ret         8
*}
end;

//00584C74
function TMSDOMNode.get_ownerDocument:IDOMDocument; safecall;
begin
{*
 00584C74    push        ebp
 00584C75    mov         ebp,esp
 00584C77    push        0
 00584C79    push        ebx
 00584C7A    push        esi
 00584C7B    push        edi
 00584C7C    mov         ebx,dword ptr [ebp+8]
 00584C7F    mov         eax,dword ptr [ebp+0C]
 00584C82    test        eax,eax
>00584C84    je          00584C8A
 00584C86    xor         edx,edx
 00584C88    mov         dword ptr [eax],edx
 00584C8A    push        ebx
 00584C8B    xor         eax,eax
 00584C8D    push        ebp
 00584C8E    push        584CEE
 00584C93    push        dword ptr fs:[eax]
 00584C96    mov         dword ptr fs:[eax],esp
 00584C99    cmp         dword ptr [ebx+18],0
>00584C9D    jne         00584CD6
 00584C9F    lea         eax,[ebp-4]
 00584CA2    call        @IntfClear
 00584CA7    push        eax
 00584CA8    mov         eax,dword ptr [ebx+0C]
 00584CAB    push        eax
 00584CAC    mov         eax,dword ptr [eax]
 00584CAE    call        dword ptr [eax+5C]
 00584CB1    call        @CheckAutoResult
 00584CB6    mov         ecx,dword ptr [ebp-4]
 00584CB9    mov         dl,1
 00584CBB    mov         eax,[00583DB8];TMSDOMDocument
 00584CC0    call        TMSDOMNode.Create
 00584CC5    mov         edx,eax
 00584CC7    test        edx,edx
>00584CC9    je          00584CCE
 00584CCB    sub         edx,0FFFFFFCC
 00584CCE    lea         eax,[ebx+18]
 00584CD1    call        @IntfCopy
 00584CD6    mov         eax,dword ptr [ebp+0C]
 00584CD9    mov         edx,dword ptr [ebx+18]
 00584CDC    call        @IntfCopy
 00584CE1    xor         eax,eax
 00584CE3    pop         edx
 00584CE4    pop         ecx
 00584CE5    pop         ecx
 00584CE6    mov         dword ptr fs:[eax],edx
 00584CE9    pop         eax
 00584CEA    xor         ebx,ebx
>00584CEC    jmp         00584CF3
>00584CEE    jmp         @HandleAutoException
 00584CF3    lea         eax,[ebp-4]
 00584CF6    call        @IntfClear
 00584CFB    mov         eax,ebx
 00584CFD    pop         edi
 00584CFE    pop         esi
 00584CFF    pop         ebx
 00584D00    pop         ecx
 00584D01    pop         ebp
 00584D02    ret         8
*}
end;

//00584D08
function TMSDOMNode.get_parentNode:IDOMNode; safecall;
begin
{*
 00584D08    push        ebp
 00584D09    mov         ebp,esp
 00584D0B    push        0
 00584D0D    push        ebx
 00584D0E    push        esi
 00584D0F    push        edi
 00584D10    mov         ebx,dword ptr [ebp+8]
 00584D13    mov         eax,dword ptr [ebp+0C]
 00584D16    test        eax,eax
>00584D18    je          00584D1E
 00584D1A    xor         edx,edx
 00584D1C    mov         dword ptr [eax],edx
 00584D1E    push        ebx
 00584D1F    xor         eax,eax
 00584D21    push        ebp
 00584D22    push        584D5C
 00584D27    push        dword ptr fs:[eax]
 00584D2A    mov         dword ptr fs:[eax],esp
 00584D2D    lea         eax,[ebp-4]
 00584D30    call        @IntfClear
 00584D35    push        eax
 00584D36    mov         eax,dword ptr [ebx+0C]
 00584D39    push        eax
 00584D3A    mov         eax,dword ptr [eax]
 00584D3C    call        dword ptr [eax+2C]
 00584D3F    call        @CheckAutoResult
 00584D44    mov         eax,dword ptr [ebp-4]
 00584D47    mov         edx,dword ptr [ebp+0C]
 00584D4A    call        MakeNode
 00584D4F    xor         eax,eax
 00584D51    pop         edx
 00584D52    pop         ecx
 00584D53    pop         ecx
 00584D54    mov         dword ptr fs:[eax],edx
 00584D57    pop         eax
 00584D58    xor         ebx,ebx
>00584D5A    jmp         00584D61
>00584D5C    jmp         @HandleAutoException
 00584D61    lea         eax,[ebp-4]
 00584D64    call        @IntfClear
 00584D69    mov         eax,ebx
 00584D6B    pop         edi
 00584D6C    pop         esi
 00584D6D    pop         ebx
 00584D6E    pop         ecx
 00584D6F    pop         ebp
 00584D70    ret         8
*}
end;

//00584D74
function TMSDOMNode.get_prefix:DOMString; safecall;
begin
{*
 00584D74    push        ebp
 00584D75    mov         ebp,esp
 00584D77    push        0
 00584D79    push        ebx
 00584D7A    push        esi
 00584D7B    push        edi
 00584D7C    mov         ebx,dword ptr [ebp+8]
 00584D7F    mov         eax,dword ptr [ebp+0C]
 00584D82    test        eax,eax
>00584D84    je          00584D8A
 00584D86    xor         edx,edx
 00584D88    mov         dword ptr [eax],edx
 00584D8A    push        ebx
 00584D8B    xor         eax,eax
 00584D8D    push        ebp
 00584D8E    push        584DCB
 00584D93    push        dword ptr fs:[eax]
 00584D96    mov         dword ptr fs:[eax],esp
 00584D99    lea         eax,[ebp-4]
 00584D9C    call        @WStrClr
 00584DA1    push        eax
 00584DA2    mov         eax,dword ptr [ebx+0C]
 00584DA5    push        eax
 00584DA6    mov         eax,dword ptr [eax]
 00584DA8    call        dword ptr [eax+0A0]
 00584DAE    call        @CheckAutoResult
 00584DB3    mov         edx,dword ptr [ebp-4]
 00584DB6    mov         eax,dword ptr [ebp+0C]
 00584DB9    call        @UStrFromWStr
 00584DBE    xor         eax,eax
 00584DC0    pop         edx
 00584DC1    pop         ecx
 00584DC2    pop         ecx
 00584DC3    mov         dword ptr fs:[eax],edx
 00584DC6    pop         eax
 00584DC7    xor         ebx,ebx
>00584DC9    jmp         00584DD0
>00584DCB    jmp         @HandleAutoException
 00584DD0    lea         eax,[ebp-4]
 00584DD3    call        @WStrClr
 00584DD8    mov         eax,ebx
 00584DDA    pop         edi
 00584DDB    pop         esi
 00584DDC    pop         ebx
 00584DDD    pop         ecx
 00584DDE    pop         ebp
 00584DDF    ret         8
*}
end;

//00584DE4
function TMSDOMNode.get_previousSibling:IDOMNode; safecall;
begin
{*
 00584DE4    push        ebp
 00584DE5    mov         ebp,esp
 00584DE7    push        0
 00584DE9    push        ebx
 00584DEA    push        esi
 00584DEB    push        edi
 00584DEC    mov         ebx,dword ptr [ebp+8]
 00584DEF    mov         eax,dword ptr [ebp+0C]
 00584DF2    test        eax,eax
>00584DF4    je          00584DFA
 00584DF6    xor         edx,edx
 00584DF8    mov         dword ptr [eax],edx
 00584DFA    push        ebx
 00584DFB    xor         eax,eax
 00584DFD    push        ebp
 00584DFE    push        584E38
 00584E03    push        dword ptr fs:[eax]
 00584E06    mov         dword ptr fs:[eax],esp
 00584E09    lea         eax,[ebp-4]
 00584E0C    call        @IntfClear
 00584E11    push        eax
 00584E12    mov         eax,dword ptr [ebx+0C]
 00584E15    push        eax
 00584E16    mov         eax,dword ptr [eax]
 00584E18    call        dword ptr [eax+3C]
 00584E1B    call        @CheckAutoResult
 00584E20    mov         eax,dword ptr [ebp-4]
 00584E23    mov         edx,dword ptr [ebp+0C]
 00584E26    call        MakeNode
 00584E2B    xor         eax,eax
 00584E2D    pop         edx
 00584E2E    pop         ecx
 00584E2F    pop         ecx
 00584E30    mov         dword ptr fs:[eax],edx
 00584E33    pop         eax
 00584E34    xor         ebx,ebx
>00584E36    jmp         00584E3D
>00584E38    jmp         @HandleAutoException
 00584E3D    lea         eax,[ebp-4]
 00584E40    call        @IntfClear
 00584E45    mov         eax,ebx
 00584E47    pop         edi
 00584E48    pop         esi
 00584E49    pop         ebx
 00584E4A    pop         ecx
 00584E4B    pop         ebp
 00584E4C    ret         8
*}
end;

//00584E50
function TMSDOMNode.hasChildNodes:WordBool; safecall;
begin
{*
 00584E50    push        ebp
 00584E51    mov         ebp,esp
 00584E53    push        ecx
 00584E54    push        ebx
 00584E55    push        esi
 00584E56    push        edi
 00584E57    mov         ebx,dword ptr [ebp+8]
 00584E5A    push        ebx
 00584E5B    xor         eax,eax
 00584E5D    push        ebp
 00584E5E    push        584E92
 00584E63    push        dword ptr fs:[eax]
 00584E66    mov         dword ptr fs:[eax],esp
 00584E69    lea         eax,[ebp-4]
 00584E6C    push        eax
 00584E6D    mov         eax,dword ptr [ebx+0C]
 00584E70    push        eax
 00584E71    mov         eax,dword ptr [eax]
 00584E73    call        dword ptr [eax+58]
 00584E76    call        @CheckAutoResult
 00584E7B    movzx       eax,word ptr [ebp-4]
 00584E7F    mov         edx,dword ptr [ebp+0C]
 00584E82    mov         word ptr [edx],ax
 00584E85    xor         eax,eax
 00584E87    pop         edx
 00584E88    pop         ecx
 00584E89    pop         ecx
 00584E8A    mov         dword ptr fs:[eax],edx
 00584E8D    pop         eax
 00584E8E    xor         ebx,ebx
>00584E90    jmp         00584E97
>00584E92    jmp         @HandleAutoException
 00584E97    mov         eax,ebx
 00584E99    pop         edi
 00584E9A    pop         esi
 00584E9B    pop         ebx
 00584E9C    pop         ecx
 00584E9D    pop         ebp
 00584E9E    ret         8
*}
end;

//00584EA4
function TMSDOMNode.insertBefore(const newChild:IDOMNode; const refChild:IDOMNode):IDOMNode; safecall;
begin
{*
 00584EA4    push        ebp
 00584EA5    mov         ebp,esp
 00584EA7    xor         ecx,ecx
 00584EA9    push        ecx
 00584EAA    push        ecx
 00584EAB    push        ecx
 00584EAC    push        ecx
 00584EAD    push        ecx
 00584EAE    push        ecx
 00584EAF    push        ecx
 00584EB0    push        ebx
 00584EB1    push        esi
 00584EB2    push        edi
 00584EB3    mov         ebx,dword ptr [ebp+8]
 00584EB6    mov         eax,dword ptr [ebp+14]
 00584EB9    test        eax,eax
>00584EBB    je          00584EC1
 00584EBD    xor         edx,edx
 00584EBF    mov         dword ptr [eax],edx
 00584EC1    push        ebx
 00584EC2    xor         eax,eax
 00584EC4    push        ebp
 00584EC5    push        584F30
 00584ECA    push        dword ptr fs:[eax]
 00584ECD    mov         dword ptr fs:[eax],esp
 00584ED0    lea         eax,[ebp-4]
 00584ED3    call        @IntfClear
 00584ED8    push        eax
 00584ED9    lea         edx,[ebp-18]
 00584EDC    mov         eax,dword ptr [ebp+10]
 00584EDF    call        GetMSNode
 00584EE4    mov         edx,dword ptr [ebp-18]
 00584EE7    lea         eax,[ebp-14]
 00584EEA    call        @VarFromDisp
 00584EEF    push        dword ptr [ebp-8]
 00584EF2    push        dword ptr [ebp-0C]
 00584EF5    push        dword ptr [ebp-10]
 00584EF8    push        dword ptr [ebp-14]
 00584EFB    lea         edx,[ebp-1C]
 00584EFE    mov         eax,dword ptr [ebp+0C]
 00584F01    call        GetMSNode
 00584F06    mov         eax,dword ptr [ebp-1C]
 00584F09    push        eax
 00584F0A    mov         eax,dword ptr [ebx+0C]
 00584F0D    push        eax
 00584F0E    mov         eax,dword ptr [eax]
 00584F10    call        dword ptr [eax+48]
 00584F13    call        @CheckAutoResult
 00584F18    mov         eax,dword ptr [ebp-4]
 00584F1B    mov         edx,dword ptr [ebp+14]
 00584F1E    call        MakeNode
 00584F23    xor         eax,eax
 00584F25    pop         edx
 00584F26    pop         ecx
 00584F27    pop         ecx
 00584F28    mov         dword ptr fs:[eax],edx
 00584F2B    pop         eax
 00584F2C    xor         ebx,ebx
>00584F2E    jmp         00584F35
>00584F30    jmp         @HandleAutoException
 00584F35    lea         eax,[ebp-1C]
 00584F38    mov         edx,dword ptr ds:[5809EC];IXMLDOMNode
 00584F3E    mov         ecx,2
 00584F43    call        @FinalizeArray
 00584F48    lea         eax,[ebp-14]
 00584F4B    call        @VarClr
 00584F50    lea         eax,[ebp-4]
 00584F53    call        @IntfClear
 00584F58    mov         eax,ebx
 00584F5A    pop         edi
 00584F5B    pop         esi
 00584F5C    pop         ebx
 00584F5D    mov         esp,ebp
 00584F5F    pop         ebp
 00584F60    ret         10
*}
end;

//00584F64
procedure TMSDOMNode.normalize; safecall;
begin
{*
 00584F64    push        ebp
 00584F65    mov         ebp,esp
 00584F67    push        ebx
 00584F68    push        esi
 00584F69    push        edi
 00584F6A    push        dword ptr [ebp+8]
 00584F6D    xor         eax,eax
 00584F6F    push        ebp
 00584F70    push        584F97
 00584F75    push        dword ptr fs:[eax]
 00584F78    mov         dword ptr fs:[eax],esp
 00584F7B    mov         edx,584FB4;'MSXML'
 00584F80    mov         eax,584FCC;'normalize'
 00584F85    call        DOMVendorNotSupported
 00584F8A    xor         eax,eax
 00584F8C    pop         edx
 00584F8D    pop         ecx
 00584F8E    pop         ecx
 00584F8F    mov         dword ptr fs:[eax],edx
 00584F92    pop         eax
 00584F93    xor         ebx,ebx
>00584F95    jmp         00584F9C
>00584F97    jmp         @HandleAutoException
 00584F9C    mov         eax,ebx
 00584F9E    pop         edi
 00584F9F    pop         esi
 00584FA0    pop         ebx
 00584FA1    pop         ebp
 00584FA2    ret         4
*}
end;

//00584FE0
function TMSDOMNode.removeChild(const childNode:IDOMNode):IDOMNode; safecall;
begin
{*
 00584FE0    push        ebp
 00584FE1    mov         ebp,esp
 00584FE3    push        0
 00584FE5    push        0
 00584FE7    push        ebx
 00584FE8    push        esi
 00584FE9    push        edi
 00584FEA    mov         ebx,dword ptr [ebp+8]
 00584FED    mov         eax,dword ptr [ebp+10]
 00584FF0    test        eax,eax
>00584FF2    je          00584FF8
 00584FF4    xor         edx,edx
 00584FF6    mov         dword ptr [eax],edx
 00584FF8    push        ebx
 00584FF9    xor         eax,eax
 00584FFB    push        ebp
 00584FFC    push        585045
 00585001    push        dword ptr fs:[eax]
 00585004    mov         dword ptr fs:[eax],esp
 00585007    lea         eax,[ebp-4]
 0058500A    call        @IntfClear
 0058500F    push        eax
 00585010    lea         edx,[ebp-8]
 00585013    mov         eax,dword ptr [ebp+0C]
 00585016    call        GetMSNode
 0058501B    mov         eax,dword ptr [ebp-8]
 0058501E    push        eax
 0058501F    mov         eax,dword ptr [ebx+0C]
 00585022    push        eax
 00585023    mov         eax,dword ptr [eax]
 00585025    call        dword ptr [eax+50]
 00585028    call        @CheckAutoResult
 0058502D    mov         eax,dword ptr [ebp-4]
 00585030    mov         edx,dword ptr [ebp+10]
 00585033    call        MakeNode
 00585038    xor         eax,eax
 0058503A    pop         edx
 0058503B    pop         ecx
 0058503C    pop         ecx
 0058503D    mov         dword ptr fs:[eax],edx
 00585040    pop         eax
 00585041    xor         ebx,ebx
>00585043    jmp         0058504A
>00585045    jmp         @HandleAutoException
 0058504A    lea         eax,[ebp-8]
 0058504D    mov         edx,dword ptr ds:[5809EC];IXMLDOMNode
 00585053    mov         ecx,2
 00585058    call        @FinalizeArray
 0058505D    mov         eax,ebx
 0058505F    pop         edi
 00585060    pop         esi
 00585061    pop         ebx
 00585062    pop         ecx
 00585063    pop         ecx
 00585064    pop         ebp
 00585065    ret         0C
*}
end;

//00585068
function TMSDOMNode.replaceChild(const newChild:IDOMNode; const oldChild:IDOMNode):IDOMNode; safecall;
begin
{*
 00585068    push        ebp
 00585069    mov         ebp,esp
 0058506B    push        0
 0058506D    push        0
 0058506F    push        0
 00585071    push        ebx
 00585072    push        esi
 00585073    push        edi
 00585074    mov         ebx,dword ptr [ebp+8]
 00585077    mov         eax,dword ptr [ebp+14]
 0058507A    test        eax,eax
>0058507C    je          00585082
 0058507E    xor         edx,edx
 00585080    mov         dword ptr [eax],edx
 00585082    push        ebx
 00585083    xor         eax,eax
 00585085    push        ebp
 00585086    push        5850DE
 0058508B    push        dword ptr fs:[eax]
 0058508E    mov         dword ptr fs:[eax],esp
 00585091    lea         eax,[ebp-4]
 00585094    call        @IntfClear
 00585099    push        eax
 0058509A    lea         edx,[ebp-8]
 0058509D    mov         eax,dword ptr [ebp+10]
 005850A0    call        GetMSNode
 005850A5    mov         eax,dword ptr [ebp-8]
 005850A8    push        eax
 005850A9    lea         edx,[ebp-0C]
 005850AC    mov         eax,dword ptr [ebp+0C]
 005850AF    call        GetMSNode
 005850B4    mov         eax,dword ptr [ebp-0C]
 005850B7    push        eax
 005850B8    mov         eax,dword ptr [ebx+0C]
 005850BB    push        eax
 005850BC    mov         eax,dword ptr [eax]
 005850BE    call        dword ptr [eax+4C]
 005850C1    call        @CheckAutoResult
 005850C6    mov         eax,dword ptr [ebp-4]
 005850C9    mov         edx,dword ptr [ebp+14]
 005850CC    call        MakeNode
 005850D1    xor         eax,eax
 005850D3    pop         edx
 005850D4    pop         ecx
 005850D5    pop         ecx
 005850D6    mov         dword ptr fs:[eax],edx
 005850D9    pop         eax
 005850DA    xor         ebx,ebx
>005850DC    jmp         005850E3
>005850DE    jmp         @HandleAutoException
 005850E3    lea         eax,[ebp-0C]
 005850E6    mov         edx,dword ptr ds:[5809EC];IXMLDOMNode
 005850EC    mov         ecx,3
 005850F1    call        @FinalizeArray
 005850F6    mov         eax,ebx
 005850F8    pop         edi
 005850F9    pop         esi
 005850FA    pop         ebx
 005850FB    mov         esp,ebp
 005850FD    pop         ebp
 005850FE    ret         10
*}
end;

//00585104
procedure TMSDOMNode.set_nodeValue(value:DOMString); safecall;
begin
{*
 00585104    push        ebp
 00585105    mov         ebp,esp
 00585107    xor         ecx,ecx
 00585109    push        ecx
 0058510A    push        ecx
 0058510B    push        ecx
 0058510C    push        ecx
 0058510D    push        ebx
 0058510E    push        esi
 0058510F    push        edi
 00585110    mov         ebx,dword ptr [ebp+8]
 00585113    mov         eax,dword ptr [ebp+0C]
 00585116    call        @UStrAddRef
 0058511B    push        ebx
 0058511C    xor         eax,eax
 0058511E    push        ebp
 0058511F    push        58515C
 00585124    push        dword ptr fs:[eax]
 00585127    mov         dword ptr fs:[eax],esp
 0058512A    lea         eax,[ebp-10]
 0058512D    mov         edx,dword ptr [ebp+0C]
 00585130    call        @OleVarFromUStr
 00585135    push        dword ptr [ebp-4]
 00585138    push        dword ptr [ebp-8]
 0058513B    push        dword ptr [ebp-0C]
 0058513E    push        dword ptr [ebp-10]
 00585141    mov         eax,dword ptr [ebx+0C]
 00585144    push        eax
 00585145    mov         eax,dword ptr [eax]
 00585147    call        dword ptr [eax+24]
 0058514A    call        @CheckAutoResult
 0058514F    xor         eax,eax
 00585151    pop         edx
 00585152    pop         ecx
 00585153    pop         ecx
 00585154    mov         dword ptr fs:[eax],edx
 00585157    pop         eax
 00585158    xor         ebx,ebx
>0058515A    jmp         00585161
>0058515C    jmp         @HandleAutoException
 00585161    lea         eax,[ebp-10]
 00585164    call        @VarClr
 00585169    lea         eax,[ebp+0C]
 0058516C    call        @UStrClr
 00585171    mov         eax,ebx
 00585173    pop         edi
 00585174    pop         esi
 00585175    pop         ebx
 00585176    mov         esp,ebp
 00585178    pop         ebp
 00585179    ret         8
*}
end;

//0058517C
function TMSDOMNode.supports(const feature:DOMString; const version:DOMString):WordBool;
begin
{*
 0058517C    mov         edx,58519C;'MSXML'
 00585181    mov         eax,5851B4;'supports'
 00585186    call        DOMVendorNotSupported
 0058518B    xor         eax,eax
 0058518D    ret
*}
end;

//005851C8
function TMSDOMNode.GetXMLDOMNode:IXMLDOMNode;
begin
{*
 005851C8    push        ebx
 005851C9    push        esi
 005851CA    mov         esi,edx
 005851CC    mov         ebx,eax
 005851CE    mov         eax,esi
 005851D0    mov         edx,dword ptr [ebx+0C]
 005851D3    call        @IntfCopy
 005851D8    pop         esi
 005851D9    pop         ebx
 005851DA    ret
*}
end;

//005851DC
function TMSDOMNode.selectNode(const nodePath:WideString):IDOMNode; safecall;
begin
{*
 005851DC    push        ebp
 005851DD    mov         ebp,esp
 005851DF    push        0
 005851E1    push        ebx
 005851E2    push        esi
 005851E3    push        edi
 005851E4    mov         ebx,dword ptr [ebp+8]
 005851E7    mov         eax,dword ptr [ebp+10]
 005851EA    test        eax,eax
>005851EC    je          005851F2
 005851EE    xor         edx,edx
 005851F0    mov         dword ptr [eax],edx
 005851F2    push        ebx
 005851F3    xor         eax,eax
 005851F5    push        ebp
 005851F6    push        585247
 005851FB    push        dword ptr fs:[eax]
 005851FE    mov         dword ptr fs:[eax],esp
 00585201    lea         eax,[ebp-4]
 00585204    call        @IntfClear
 00585209    push        eax
 0058520A    mov         eax,dword ptr [ebp+0C]
 0058520D    push        eax
 0058520E    mov         eax,dword ptr [ebx+0C]
 00585211    push        eax
 00585212    mov         eax,dword ptr [eax]
 00585214    call        dword ptr [eax+94]
 0058521A    call        @CheckAutoResult
 0058521F    cmp         dword ptr [ebp-4],0
>00585223    je          00585232
 00585225    mov         edx,dword ptr [ebp+10]
 00585228    mov         eax,dword ptr [ebp-4]
 0058522B    call        MakeNode
>00585230    jmp         0058523A
 00585232    mov         eax,dword ptr [ebp+10]
 00585235    call        @IntfClear
 0058523A    xor         eax,eax
 0058523C    pop         edx
 0058523D    pop         ecx
 0058523E    pop         ecx
 0058523F    mov         dword ptr fs:[eax],edx
 00585242    pop         eax
 00585243    xor         ebx,ebx
>00585245    jmp         0058524C
>00585247    jmp         @HandleAutoException
 0058524C    lea         eax,[ebp-4]
 0058524F    call        @IntfClear
 00585254    mov         eax,ebx
 00585256    pop         edi
 00585257    pop         esi
 00585258    pop         ebx
 00585259    pop         ecx
 0058525A    pop         ebp
 0058525B    ret         0C
*}
end;

//00585260
{*function sub_00585260(?:?; ?:?; ?:?):?;
begin
 00585260    push        ebp
 00585261    mov         ebp,esp
 00585263    push        0
 00585265    push        ebx
 00585266    push        esi
 00585267    push        edi
 00585268    mov         ebx,dword ptr [ebp+8]
 0058526B    mov         eax,dword ptr [ebp+10]
 0058526E    test        eax,eax
>00585270    je          00585276
 00585272    xor         edx,edx
 00585274    mov         dword ptr [eax],edx
 00585276    push        ebx
 00585277    xor         eax,eax
 00585279    push        ebp
 0058527A    push        5852CB
 0058527F    push        dword ptr fs:[eax]
 00585282    mov         dword ptr fs:[eax],esp
 00585285    lea         eax,[ebp-4]
 00585288    call        @IntfClear
 0058528D    push        eax
 0058528E    mov         eax,dword ptr [ebp+0C]
 00585291    push        eax
 00585292    mov         eax,dword ptr [ebx+0C]
 00585295    push        eax
 00585296    mov         eax,dword ptr [eax]
 00585298    call        dword ptr [eax+90]
 0058529E    call        @CheckAutoResult
 005852A3    cmp         dword ptr [ebp-4],0
>005852A7    je          005852B6
 005852A9    mov         edx,dword ptr [ebp+10]
 005852AC    mov         eax,dword ptr [ebp-4]
 005852AF    call        MakeNamedNodeMap
>005852B4    jmp         005852BE
 005852B6    mov         eax,dword ptr [ebp+10]
 005852B9    call        @IntfClear
 005852BE    xor         eax,eax
 005852C0    pop         edx
 005852C1    pop         ecx
 005852C2    pop         ecx
 005852C3    mov         dword ptr fs:[eax],edx
 005852C6    pop         eax
 005852C7    xor         ebx,ebx
>005852C9    jmp         005852D0
>005852CB    jmp         @HandleAutoException
 005852D0    lea         eax,[ebp-4]
 005852D3    call        @IntfClear
 005852D8    mov         eax,ebx
 005852DA    pop         edi
 005852DB    pop         esi
 005852DC    pop         ebx
 005852DD    pop         ecx
 005852DE    pop         ebp
 005852DF    ret         0C
end;*}

//005852E4
function TMSDOMNode.get_text:DOMString; safecall;
begin
{*
 005852E4    push        ebp
 005852E5    mov         ebp,esp
 005852E7    push        0
 005852E9    push        ebx
 005852EA    push        esi
 005852EB    push        edi
 005852EC    mov         ebx,dword ptr [ebp+8]
 005852EF    mov         eax,dword ptr [ebp+0C]
 005852F2    test        eax,eax
>005852F4    je          005852FA
 005852F6    xor         edx,edx
 005852F8    mov         dword ptr [eax],edx
 005852FA    push        ebx
 005852FB    xor         eax,eax
 005852FD    push        ebp
 005852FE    push        585338
 00585303    push        dword ptr fs:[eax]
 00585306    mov         dword ptr fs:[eax],esp
 00585309    lea         eax,[ebp-4]
 0058530C    call        @WStrClr
 00585311    push        eax
 00585312    mov         eax,dword ptr [ebx+0C]
 00585315    push        eax
 00585316    mov         eax,dword ptr [eax]
 00585318    call        dword ptr [eax+68]
 0058531B    call        @CheckAutoResult
 00585320    mov         edx,dword ptr [ebp-4]
 00585323    mov         eax,dword ptr [ebp+0C]
 00585326    call        @UStrFromWStr
 0058532B    xor         eax,eax
 0058532D    pop         edx
 0058532E    pop         ecx
 0058532F    pop         ecx
 00585330    mov         dword ptr fs:[eax],edx
 00585333    pop         eax
 00585334    xor         ebx,ebx
>00585336    jmp         0058533D
>00585338    jmp         @HandleAutoException
 0058533D    lea         eax,[ebp-4]
 00585340    call        @WStrClr
 00585345    mov         eax,ebx
 00585347    pop         edi
 00585348    pop         esi
 00585349    pop         ebx
 0058534A    pop         ecx
 0058534B    pop         ebp
 0058534C    ret         8
*}
end;

//00585350
procedure TMSDOMNode.set_text(const Value:DOMString); safecall;
begin
{*
 00585350    push        ebp
 00585351    mov         ebp,esp
 00585353    push        0
 00585355    push        ebx
 00585356    push        esi
 00585357    push        edi
 00585358    mov         ebx,dword ptr [ebp+8]
 0058535B    push        ebx
 0058535C    xor         eax,eax
 0058535E    push        ebp
 0058535F    push        585394
 00585364    push        dword ptr fs:[eax]
 00585367    mov         dword ptr fs:[eax],esp
 0058536A    lea         eax,[ebp-4]
 0058536D    mov         edx,dword ptr [ebp+0C]
 00585370    call        @WStrFromUStr
 00585375    mov         eax,dword ptr [ebp-4]
 00585378    push        eax
 00585379    mov         eax,dword ptr [ebx+0C]
 0058537C    push        eax
 0058537D    mov         eax,dword ptr [eax]
 0058537F    call        dword ptr [eax+6C]
 00585382    call        @CheckAutoResult
 00585387    xor         eax,eax
 00585389    pop         edx
 0058538A    pop         ecx
 0058538B    pop         ecx
 0058538C    mov         dword ptr fs:[eax],edx
 0058538F    pop         eax
 00585390    xor         ebx,ebx
>00585392    jmp         00585399
>00585394    jmp         @HandleAutoException
 00585399    lea         eax,[ebp-4]
 0058539C    call        @WStrClr
 005853A1    mov         eax,ebx
 005853A3    pop         edi
 005853A4    pop         esi
 005853A5    pop         ebx
 005853A6    pop         ecx
 005853A7    pop         ebp
 005853A8    ret         8
*}
end;

//005853AC
function TMSDOMNode.get_xml:DOMString; safecall;
begin
{*
 005853AC    push        ebp
 005853AD    mov         ebp,esp
 005853AF    push        0
 005853B1    push        ebx
 005853B2    push        esi
 005853B3    push        edi
 005853B4    mov         ebx,dword ptr [ebp+8]
 005853B7    mov         eax,dword ptr [ebp+0C]
 005853BA    test        eax,eax
>005853BC    je          005853C2
 005853BE    xor         edx,edx
 005853C0    mov         dword ptr [eax],edx
 005853C2    push        ebx
 005853C3    xor         eax,eax
 005853C5    push        ebp
 005853C6    push        585403
 005853CB    push        dword ptr fs:[eax]
 005853CE    mov         dword ptr fs:[eax],esp
 005853D1    lea         eax,[ebp-4]
 005853D4    call        @WStrClr
 005853D9    push        eax
 005853DA    mov         eax,dword ptr [ebx+0C]
 005853DD    push        eax
 005853DE    mov         eax,dword ptr [eax]
 005853E0    call        dword ptr [eax+88]
 005853E6    call        @CheckAutoResult
 005853EB    mov         edx,dword ptr [ebp-4]
 005853EE    mov         eax,dword ptr [ebp+0C]
 005853F1    call        @UStrFromWStr
 005853F6    xor         eax,eax
 005853F8    pop         edx
 005853F9    pop         ecx
 005853FA    pop         ecx
 005853FB    mov         dword ptr fs:[eax],edx
 005853FE    pop         eax
 005853FF    xor         ebx,ebx
>00585401    jmp         00585408
>00585403    jmp         @HandleAutoException
 00585408    lea         eax,[ebp-4]
 0058540B    call        @WStrClr
 00585410    mov         eax,ebx
 00585412    pop         edi
 00585413    pop         esi
 00585414    pop         ebx
 00585415    pop         ecx
 00585416    pop         ebp
 00585417    ret         8
*}
end;

//0058541C
procedure TMSDOMNode.transformNode(const stylesheet:IDOMNode; var output:WideString); safecall;
begin
{*
 0058541C    push        ebp
 0058541D    mov         ebp,esp
 0058541F    push        0
 00585421    push        0
 00585423    push        ebx
 00585424    push        esi
 00585425    push        edi
 00585426    mov         ebx,dword ptr [ebp+8]
 00585429    push        ebx
 0058542A    xor         eax,eax
 0058542C    push        ebp
 0058542D    push        585479
 00585432    push        dword ptr fs:[eax]
 00585435    mov         dword ptr fs:[eax],esp
 00585438    lea         eax,[ebp-4]
 0058543B    call        @WStrClr
 00585440    push        eax
 00585441    lea         edx,[ebp-8]
 00585444    mov         eax,dword ptr [ebp+0C]
 00585447    call        GetMSNode
 0058544C    mov         eax,dword ptr [ebp-8]
 0058544F    push        eax
 00585450    mov         eax,dword ptr [ebx+0C]
 00585453    push        eax
 00585454    mov         eax,dword ptr [eax]
 00585456    call        dword ptr [eax+8C]
 0058545C    call        @CheckAutoResult
 00585461    mov         edx,dword ptr [ebp-4]
 00585464    mov         eax,dword ptr [ebp+10]
 00585467    call        @WStrAsg
 0058546C    xor         eax,eax
 0058546E    pop         edx
 0058546F    pop         ecx
 00585470    pop         ecx
 00585471    mov         dword ptr fs:[eax],edx
 00585474    pop         eax
 00585475    xor         ebx,ebx
>00585477    jmp         0058547E
>00585479    jmp         @HandleAutoException
 0058547E    lea         eax,[ebp-8]
 00585481    call        @IntfClear
 00585486    lea         eax,[ebp-4]
 00585489    call        @WStrClr
 0058548E    mov         eax,ebx
 00585490    pop         edi
 00585491    pop         esi
 00585492    pop         ebx
 00585493    pop         ecx
 00585494    pop         ecx
 00585495    pop         ebp
 00585496    ret         0C
*}
end;

//0058549C
procedure TMSDOMNode.transformNode(const stylesheet:IDOMNode; const output:IDOMDocument); safecall;
begin
{*
 0058549C    push        ebp
 0058549D    mov         ebp,esp
 0058549F    xor         ecx,ecx
 005854A1    push        ecx
 005854A2    push        ecx
 005854A3    push        ecx
 005854A4    push        ecx
 005854A5    push        ecx
 005854A6    push        ecx
 005854A7    push        ebx
 005854A8    push        esi
 005854A9    push        edi
 005854AA    mov         ebx,dword ptr [ebp+8]
 005854AD    push        ebx
 005854AE    xor         eax,eax
 005854B0    push        ebp
 005854B1    push        58550B
 005854B6    push        dword ptr fs:[eax]
 005854B9    mov         dword ptr fs:[eax],esp
 005854BC    lea         edx,[ebp-14]
 005854BF    mov         eax,dword ptr [ebp+10]
 005854C2    call        GetMSNode
 005854C7    mov         edx,dword ptr [ebp-14]
 005854CA    lea         eax,[ebp-10]
 005854CD    call        @VarFromDisp
 005854D2    push        dword ptr [ebp-4]
 005854D5    push        dword ptr [ebp-8]
 005854D8    push        dword ptr [ebp-0C]
 005854DB    push        dword ptr [ebp-10]
 005854DE    lea         edx,[ebp-18]
 005854E1    mov         eax,dword ptr [ebp+0C]
 005854E4    call        GetMSNode
 005854E9    mov         eax,dword ptr [ebp-18]
 005854EC    push        eax
 005854ED    mov         eax,dword ptr [ebx+0C]
 005854F0    push        eax
 005854F1    mov         eax,dword ptr [eax]
 005854F3    call        dword ptr [eax+0A8]
 005854F9    call        @CheckAutoResult
 005854FE    xor         eax,eax
 00585500    pop         edx
 00585501    pop         ecx
 00585502    pop         ecx
 00585503    mov         dword ptr fs:[eax],edx
 00585506    pop         eax
 00585507    xor         ebx,ebx
>00585509    jmp         00585510
>0058550B    jmp         @HandleAutoException
 00585510    lea         eax,[ebp-18]
 00585513    mov         edx,dword ptr ds:[5809EC];IXMLDOMNode
 00585519    mov         ecx,2
 0058551E    call        @FinalizeArray
 00585523    lea         eax,[ebp-10]
 00585526    call        @VarClr
 0058552B    mov         eax,ebx
 0058552D    pop         edi
 0058552E    pop         esi
 0058552F    pop         ebx
 00585530    mov         esp,ebp
 00585532    pop         ebp
 00585533    ret         0C
*}
end;

//00585538
constructor TMSDOMNamedNodeMap.Create;
begin
{*
 00585538    push        ebp
 00585539    mov         ebp,esp
 0058553B    push        ecx
 0058553C    push        ebx
 0058553D    push        esi
 0058553E    test        dl,dl
>00585540    je          0058554A
 00585542    add         esp,0FFFFFFF0
 00585545    call        @ClassCreate
 0058554A    mov         dword ptr [ebp-4],ecx
 0058554D    mov         ebx,edx
 0058554F    mov         esi,eax
 00585551    mov         eax,dword ptr [ebp-4]
 00585554    call        @IntfAddRef
 00585559    xor         eax,eax
 0058555B    push        ebp
 0058555C    push        585591
 00585561    push        dword ptr fs:[eax]
 00585564    mov         dword ptr fs:[eax],esp
 00585567    xor         edx,edx
 00585569    mov         eax,esi
 0058556B    call        TObject.Create
 00585570    lea         eax,[esi+0C]
 00585573    mov         edx,dword ptr [ebp-4]
 00585576    call        @IntfCopy
 0058557B    xor         eax,eax
 0058557D    pop         edx
 0058557E    pop         ecx
 0058557F    pop         ecx
 00585580    mov         dword ptr fs:[eax],edx
 00585583    push        585598
 00585588    lea         eax,[ebp-4]
 0058558B    call        @IntfClear
 00585590    ret
>00585591    jmp         @HandleFinally
>00585596    jmp         00585588
 00585598    mov         eax,esi
 0058559A    test        bl,bl
>0058559C    je          005855AD
 0058559E    call        @AfterConstruction
 005855A3    pop         dword ptr fs:[0]
 005855AA    add         esp,0C
 005855AD    mov         eax,esi
 005855AF    pop         esi
 005855B0    pop         ebx
 005855B1    pop         ecx
 005855B2    pop         ebp
 005855B3    ret
*}
end;

//005855B4
function TMSDOMNodeList.get_item(index:Integer):IDOMNode; safecall;
begin
{*
 005855B4    push        ebp
 005855B5    mov         ebp,esp
 005855B7    push        0
 005855B9    push        ebx
 005855BA    push        esi
 005855BB    push        edi
 005855BC    mov         ebx,dword ptr [ebp+8]
 005855BF    mov         eax,dword ptr [ebp+10]
 005855C2    test        eax,eax
>005855C4    je          005855CA
 005855C6    xor         edx,edx
 005855C8    mov         dword ptr [eax],edx
 005855CA    push        ebx
 005855CB    xor         eax,eax
 005855CD    push        ebp
 005855CE    push        58560C
 005855D3    push        dword ptr fs:[eax]
 005855D6    mov         dword ptr fs:[eax],esp
 005855D9    lea         eax,[ebp-4]
 005855DC    call        @IntfClear
 005855E1    push        eax
 005855E2    mov         eax,dword ptr [ebp+0C]
 005855E5    push        eax
 005855E6    mov         eax,dword ptr [ebx+0C]
 005855E9    push        eax
 005855EA    mov         eax,dword ptr [eax]
 005855EC    call        dword ptr [eax+1C]
 005855EF    call        @CheckAutoResult
 005855F4    mov         eax,dword ptr [ebp-4]
 005855F7    mov         edx,dword ptr [ebp+10]
 005855FA    call        MakeNode
 005855FF    xor         eax,eax
 00585601    pop         edx
 00585602    pop         ecx
 00585603    pop         ecx
 00585604    mov         dword ptr fs:[eax],edx
 00585607    pop         eax
 00585608    xor         ebx,ebx
>0058560A    jmp         00585611
>0058560C    jmp         @HandleAutoException
 00585611    lea         eax,[ebp-4]
 00585614    call        @IntfClear
 00585619    mov         eax,ebx
 0058561B    pop         edi
 0058561C    pop         esi
 0058561D    pop         ebx
 0058561E    pop         ecx
 0058561F    pop         ebp
 00585620    ret         0C
*}
end;

//00585624
function TMSDOMNodeList.get_length:Integer; safecall;
begin
{*
 00585624    push        ebp
 00585625    mov         ebp,esp
 00585627    push        ecx
 00585628    push        ebx
 00585629    push        esi
 0058562A    push        edi
 0058562B    mov         ebx,dword ptr [ebp+8]
 0058562E    push        ebx
 0058562F    xor         eax,eax
 00585631    push        ebp
 00585632    push        585664
 00585637    push        dword ptr fs:[eax]
 0058563A    mov         dword ptr fs:[eax],esp
 0058563D    lea         eax,[ebp-4]
 00585640    push        eax
 00585641    mov         eax,dword ptr [ebx+0C]
 00585644    push        eax
 00585645    mov         eax,dword ptr [eax]
 00585647    call        dword ptr [eax+20]
 0058564A    call        @CheckAutoResult
 0058564F    mov         eax,dword ptr [ebp-4]
 00585652    mov         edx,dword ptr [ebp+0C]
 00585655    mov         dword ptr [edx],eax
 00585657    xor         eax,eax
 00585659    pop         edx
 0058565A    pop         ecx
 0058565B    pop         ecx
 0058565C    mov         dword ptr fs:[eax],edx
 0058565F    pop         eax
 00585660    xor         ebx,ebx
>00585662    jmp         00585669
>00585664    jmp         @HandleAutoException
 00585669    mov         eax,ebx
 0058566B    pop         edi
 0058566C    pop         esi
 0058566D    pop         ebx
 0058566E    pop         ecx
 0058566F    pop         ebp
 00585670    ret         8
*}
end;

//00585674
constructor TMSDOMNodeList.Create;
begin
{*
 00585674    push        ebp
 00585675    mov         ebp,esp
 00585677    push        ecx
 00585678    push        ebx
 00585679    push        esi
 0058567A    test        dl,dl
>0058567C    je          00585686
 0058567E    add         esp,0FFFFFFF0
 00585681    call        @ClassCreate
 00585686    mov         dword ptr [ebp-4],ecx
 00585689    mov         ebx,edx
 0058568B    mov         esi,eax
 0058568D    mov         eax,dword ptr [ebp-4]
 00585690    call        @IntfAddRef
 00585695    xor         eax,eax
 00585697    push        ebp
 00585698    push        5856CD
 0058569D    push        dword ptr fs:[eax]
 005856A0    mov         dword ptr fs:[eax],esp
 005856A3    xor         edx,edx
 005856A5    mov         eax,esi
 005856A7    call        TObject.Create
 005856AC    lea         eax,[esi+0C]
 005856AF    mov         edx,dword ptr [ebp-4]
 005856B2    call        @IntfCopy
 005856B7    xor         eax,eax
 005856B9    pop         edx
 005856BA    pop         ecx
 005856BB    pop         ecx
 005856BC    mov         dword ptr fs:[eax],edx
 005856BF    push        5856D4
 005856C4    lea         eax,[ebp-4]
 005856C7    call        @IntfClear
 005856CC    ret
>005856CD    jmp         @HandleFinally
>005856D2    jmp         005856C4
 005856D4    mov         eax,esi
 005856D6    test        bl,bl
>005856D8    je          005856E9
 005856DA    call        @AfterConstruction
 005856DF    pop         dword ptr fs:[0]
 005856E6    add         esp,0C
 005856E9    mov         eax,esi
 005856EB    pop         esi
 005856EC    pop         ebx
 005856ED    pop         ecx
 005856EE    pop         ebp
 005856EF    ret
*}
end;

//005856F0
function TMSDOMNamedNodeMap.get_item(index:Integer):IDOMNode; safecall;
begin
{*
 005856F0    push        ebp
 005856F1    mov         ebp,esp
 005856F3    push        0
 005856F5    push        ebx
 005856F6    push        esi
 005856F7    push        edi
 005856F8    mov         ebx,dword ptr [ebp+8]
 005856FB    mov         eax,dword ptr [ebp+10]
 005856FE    test        eax,eax
>00585700    je          00585706
 00585702    xor         edx,edx
 00585704    mov         dword ptr [eax],edx
 00585706    push        ebx
 00585707    xor         eax,eax
 00585709    push        ebp
 0058570A    push        585748
 0058570F    push        dword ptr fs:[eax]
 00585712    mov         dword ptr fs:[eax],esp
 00585715    lea         eax,[ebp-4]
 00585718    call        @IntfClear
 0058571D    push        eax
 0058571E    mov         eax,dword ptr [ebp+0C]
 00585721    push        eax
 00585722    mov         eax,dword ptr [ebx+0C]
 00585725    push        eax
 00585726    mov         eax,dword ptr [eax]
 00585728    call        dword ptr [eax+28]
 0058572B    call        @CheckAutoResult
 00585730    mov         eax,dword ptr [ebp-4]
 00585733    mov         edx,dword ptr [ebp+10]
 00585736    call        MakeNode
 0058573B    xor         eax,eax
 0058573D    pop         edx
 0058573E    pop         ecx
 0058573F    pop         ecx
 00585740    mov         dword ptr fs:[eax],edx
 00585743    pop         eax
 00585744    xor         ebx,ebx
>00585746    jmp         0058574D
>00585748    jmp         @HandleAutoException
 0058574D    lea         eax,[ebp-4]
 00585750    call        @IntfClear
 00585755    mov         eax,ebx
 00585757    pop         edi
 00585758    pop         esi
 00585759    pop         ebx
 0058575A    pop         ecx
 0058575B    pop         ebp
 0058575C    ret         0C
*}
end;

//00585760
function TMSDOMNamedNodeMap.get_length:Integer; safecall;
begin
{*
 00585760    push        ebp
 00585761    mov         ebp,esp
 00585763    push        ecx
 00585764    push        ebx
 00585765    push        esi
 00585766    push        edi
 00585767    mov         ebx,dword ptr [ebp+8]
 0058576A    push        ebx
 0058576B    xor         eax,eax
 0058576D    push        ebp
 0058576E    push        5857A0
 00585773    push        dword ptr fs:[eax]
 00585776    mov         dword ptr fs:[eax],esp
 00585779    lea         eax,[ebp-4]
 0058577C    push        eax
 0058577D    mov         eax,dword ptr [ebx+0C]
 00585780    push        eax
 00585781    mov         eax,dword ptr [eax]
 00585783    call        dword ptr [eax+2C]
 00585786    call        @CheckAutoResult
 0058578B    mov         eax,dword ptr [ebp-4]
 0058578E    mov         edx,dword ptr [ebp+0C]
 00585791    mov         dword ptr [edx],eax
 00585793    xor         eax,eax
 00585795    pop         edx
 00585796    pop         ecx
 00585797    pop         ecx
 00585798    mov         dword ptr fs:[eax],edx
 0058579B    pop         eax
 0058579C    xor         ebx,ebx
>0058579E    jmp         005857A5
>005857A0    jmp         @HandleAutoException
 005857A5    mov         eax,ebx
 005857A7    pop         edi
 005857A8    pop         esi
 005857A9    pop         ebx
 005857AA    pop         ecx
 005857AB    pop         ebp
 005857AC    ret         8
*}
end;

//005857B0
function TMSDOMNamedNodeMap.getNamedItem(const name:DOMString):IDOMNode; safecall;
begin
{*
 005857B0    push        ebp
 005857B1    mov         ebp,esp
 005857B3    push        0
 005857B5    push        0
 005857B7    push        ebx
 005857B8    push        esi
 005857B9    push        edi
 005857BA    mov         ebx,dword ptr [ebp+8]
 005857BD    mov         eax,dword ptr [ebp+10]
 005857C0    test        eax,eax
>005857C2    je          005857C8
 005857C4    xor         edx,edx
 005857C6    mov         dword ptr [eax],edx
 005857C8    push        ebx
 005857C9    xor         eax,eax
 005857CB    push        ebp
 005857CC    push        585815
 005857D1    push        dword ptr fs:[eax]
 005857D4    mov         dword ptr fs:[eax],esp
 005857D7    lea         eax,[ebp-4]
 005857DA    call        @IntfClear
 005857DF    push        eax
 005857E0    lea         eax,[ebp-8]
 005857E3    mov         edx,dword ptr [ebp+0C]
 005857E6    call        @WStrFromUStr
 005857EB    mov         eax,dword ptr [ebp-8]
 005857EE    push        eax
 005857EF    mov         eax,dword ptr [ebx+0C]
 005857F2    push        eax
 005857F3    mov         eax,dword ptr [eax]
 005857F5    call        dword ptr [eax+1C]
 005857F8    call        @CheckAutoResult
 005857FD    mov         eax,dword ptr [ebp-4]
 00585800    mov         edx,dword ptr [ebp+10]
 00585803    call        MakeNode
 00585808    xor         eax,eax
 0058580A    pop         edx
 0058580B    pop         ecx
 0058580C    pop         ecx
 0058580D    mov         dword ptr fs:[eax],edx
 00585810    pop         eax
 00585811    xor         ebx,ebx
>00585813    jmp         0058581A
>00585815    jmp         @HandleAutoException
 0058581A    lea         eax,[ebp-8]
 0058581D    call        @WStrClr
 00585822    lea         eax,[ebp-4]
 00585825    call        @IntfClear
 0058582A    mov         eax,ebx
 0058582C    pop         edi
 0058582D    pop         esi
 0058582E    pop         ebx
 0058582F    pop         ecx
 00585830    pop         ecx
 00585831    pop         ebp
 00585832    ret         0C
*}
end;

//00585838
function TMSDOMNamedNodeMap.getNamedItemNS(const namespaceURI:DOMString; const localName:DOMString):IDOMNode; safecall;
begin
{*
 00585838    push        ebp
 00585839    mov         ebp,esp
 0058583B    push        0
 0058583D    push        0
 0058583F    push        0
 00585841    push        ebx
 00585842    push        esi
 00585843    push        edi
 00585844    mov         ebx,dword ptr [ebp+8]
 00585847    mov         eax,dword ptr [ebp+14]
 0058584A    test        eax,eax
>0058584C    je          00585852
 0058584E    xor         edx,edx
 00585850    mov         dword ptr [eax],edx
 00585852    push        ebx
 00585853    xor         eax,eax
 00585855    push        ebp
 00585856    push        5858AE
 0058585B    push        dword ptr fs:[eax]
 0058585E    mov         dword ptr fs:[eax],esp
 00585861    lea         eax,[ebp-4]
 00585864    call        @IntfClear
 00585869    push        eax
 0058586A    lea         eax,[ebp-8]
 0058586D    mov         edx,dword ptr [ebp+0C]
 00585870    call        @WStrFromUStr
 00585875    mov         eax,dword ptr [ebp-8]
 00585878    push        eax
 00585879    lea         eax,[ebp-0C]
 0058587C    mov         edx,dword ptr [ebp+10]
 0058587F    call        @WStrFromUStr
 00585884    mov         eax,dword ptr [ebp-0C]
 00585887    push        eax
 00585888    mov         eax,dword ptr [ebx+0C]
 0058588B    push        eax
 0058588C    mov         eax,dword ptr [eax]
 0058588E    call        dword ptr [eax+30]
 00585891    call        @CheckAutoResult
 00585896    mov         eax,dword ptr [ebp-4]
 00585899    mov         edx,dword ptr [ebp+14]
 0058589C    call        MakeNode
 005858A1    xor         eax,eax
 005858A3    pop         edx
 005858A4    pop         ecx
 005858A5    pop         ecx
 005858A6    mov         dword ptr fs:[eax],edx
 005858A9    pop         eax
 005858AA    xor         ebx,ebx
>005858AC    jmp         005858B3
>005858AE    jmp         @HandleAutoException
 005858B3    lea         eax,[ebp-0C]
 005858B6    mov         edx,2
 005858BB    call        @WStrArrayClr
 005858C0    lea         eax,[ebp-4]
 005858C3    call        @IntfClear
 005858C8    mov         eax,ebx
 005858CA    pop         edi
 005858CB    pop         esi
 005858CC    pop         ebx
 005858CD    mov         esp,ebp
 005858CF    pop         ebp
 005858D0    ret         10
*}
end;

//005858D4
function TMSDOMNamedNodeMap.removeNamedItem(const name:DOMString):IDOMNode; safecall;
begin
{*
 005858D4    push        ebp
 005858D5    mov         ebp,esp
 005858D7    push        0
 005858D9    push        0
 005858DB    push        ebx
 005858DC    push        esi
 005858DD    push        edi
 005858DE    mov         ebx,dword ptr [ebp+8]
 005858E1    mov         eax,dword ptr [ebp+10]
 005858E4    test        eax,eax
>005858E6    je          005858EC
 005858E8    xor         edx,edx
 005858EA    mov         dword ptr [eax],edx
 005858EC    push        ebx
 005858ED    xor         eax,eax
 005858EF    push        ebp
 005858F0    push        585939
 005858F5    push        dword ptr fs:[eax]
 005858F8    mov         dword ptr fs:[eax],esp
 005858FB    lea         eax,[ebp-4]
 005858FE    call        @IntfClear
 00585903    push        eax
 00585904    lea         eax,[ebp-8]
 00585907    mov         edx,dword ptr [ebp+0C]
 0058590A    call        @WStrFromUStr
 0058590F    mov         eax,dword ptr [ebp-8]
 00585912    push        eax
 00585913    mov         eax,dword ptr [ebx+0C]
 00585916    push        eax
 00585917    mov         eax,dword ptr [eax]
 00585919    call        dword ptr [eax+24]
 0058591C    call        @CheckAutoResult
 00585921    mov         eax,dword ptr [ebp-4]
 00585924    mov         edx,dword ptr [ebp+10]
 00585927    call        MakeNode
 0058592C    xor         eax,eax
 0058592E    pop         edx
 0058592F    pop         ecx
 00585930    pop         ecx
 00585931    mov         dword ptr fs:[eax],edx
 00585934    pop         eax
 00585935    xor         ebx,ebx
>00585937    jmp         0058593E
>00585939    jmp         @HandleAutoException
 0058593E    lea         eax,[ebp-8]
 00585941    call        @WStrClr
 00585946    lea         eax,[ebp-4]
 00585949    call        @IntfClear
 0058594E    mov         eax,ebx
 00585950    pop         edi
 00585951    pop         esi
 00585952    pop         ebx
 00585953    pop         ecx
 00585954    pop         ecx
 00585955    pop         ebp
 00585956    ret         0C
*}
end;

//0058595C
function TMSDOMNamedNodeMap.removeNamedItemNS(const namespaceURI:DOMString; const localName:DOMString):IDOMNode; safecall;
begin
{*
 0058595C    push        ebp
 0058595D    mov         ebp,esp
 0058595F    push        0
 00585961    push        0
 00585963    push        0
 00585965    push        ebx
 00585966    push        esi
 00585967    push        edi
 00585968    mov         ebx,dword ptr [ebp+8]
 0058596B    mov         eax,dword ptr [ebp+14]
 0058596E    test        eax,eax
>00585970    je          00585976
 00585972    xor         edx,edx
 00585974    mov         dword ptr [eax],edx
 00585976    push        ebx
 00585977    xor         eax,eax
 00585979    push        ebp
 0058597A    push        5859D2
 0058597F    push        dword ptr fs:[eax]
 00585982    mov         dword ptr fs:[eax],esp
 00585985    lea         eax,[ebp-4]
 00585988    call        @IntfClear
 0058598D    push        eax
 0058598E    lea         eax,[ebp-8]
 00585991    mov         edx,dword ptr [ebp+0C]
 00585994    call        @WStrFromUStr
 00585999    mov         eax,dword ptr [ebp-8]
 0058599C    push        eax
 0058599D    lea         eax,[ebp-0C]
 005859A0    mov         edx,dword ptr [ebp+10]
 005859A3    call        @WStrFromUStr
 005859A8    mov         eax,dword ptr [ebp-0C]
 005859AB    push        eax
 005859AC    mov         eax,dword ptr [ebx+0C]
 005859AF    push        eax
 005859B0    mov         eax,dword ptr [eax]
 005859B2    call        dword ptr [eax+34]
 005859B5    call        @CheckAutoResult
 005859BA    mov         eax,dword ptr [ebp-4]
 005859BD    mov         edx,dword ptr [ebp+14]
 005859C0    call        MakeNode
 005859C5    xor         eax,eax
 005859C7    pop         edx
 005859C8    pop         ecx
 005859C9    pop         ecx
 005859CA    mov         dword ptr fs:[eax],edx
 005859CD    pop         eax
 005859CE    xor         ebx,ebx
>005859D0    jmp         005859D7
>005859D2    jmp         @HandleAutoException
 005859D7    lea         eax,[ebp-0C]
 005859DA    mov         edx,2
 005859DF    call        @WStrArrayClr
 005859E4    lea         eax,[ebp-4]
 005859E7    call        @IntfClear
 005859EC    mov         eax,ebx
 005859EE    pop         edi
 005859EF    pop         esi
 005859F0    pop         ebx
 005859F1    mov         esp,ebp
 005859F3    pop         ebp
 005859F4    ret         10
*}
end;

//005859F8
function TMSDOMNamedNodeMap.setNamedItem(const newItem:IDOMNode):IDOMNode; safecall;
begin
{*
 005859F8    push        ebp
 005859F9    mov         ebp,esp
 005859FB    push        0
 005859FD    push        0
 005859FF    push        ebx
 00585A00    push        esi
 00585A01    push        edi
 00585A02    mov         ebx,dword ptr [ebp+8]
 00585A05    mov         eax,dword ptr [ebp+10]
 00585A08    test        eax,eax
>00585A0A    je          00585A10
 00585A0C    xor         edx,edx
 00585A0E    mov         dword ptr [eax],edx
 00585A10    push        ebx
 00585A11    xor         eax,eax
 00585A13    push        ebp
 00585A14    push        585A5D
 00585A19    push        dword ptr fs:[eax]
 00585A1C    mov         dword ptr fs:[eax],esp
 00585A1F    lea         eax,[ebp-4]
 00585A22    call        @IntfClear
 00585A27    push        eax
 00585A28    lea         edx,[ebp-8]
 00585A2B    mov         eax,dword ptr [ebp+0C]
 00585A2E    call        GetMSNode
 00585A33    mov         eax,dword ptr [ebp-8]
 00585A36    push        eax
 00585A37    mov         eax,dword ptr [ebx+0C]
 00585A3A    push        eax
 00585A3B    mov         eax,dword ptr [eax]
 00585A3D    call        dword ptr [eax+20]
 00585A40    call        @CheckAutoResult
 00585A45    mov         eax,dword ptr [ebp-4]
 00585A48    mov         edx,dword ptr [ebp+10]
 00585A4B    call        MakeNode
 00585A50    xor         eax,eax
 00585A52    pop         edx
 00585A53    pop         ecx
 00585A54    pop         ecx
 00585A55    mov         dword ptr fs:[eax],edx
 00585A58    pop         eax
 00585A59    xor         ebx,ebx
>00585A5B    jmp         00585A62
>00585A5D    jmp         @HandleAutoException
 00585A62    lea         eax,[ebp-8]
 00585A65    mov         edx,dword ptr ds:[5809EC];IXMLDOMNode
 00585A6B    mov         ecx,2
 00585A70    call        @FinalizeArray
 00585A75    mov         eax,ebx
 00585A77    pop         edi
 00585A78    pop         esi
 00585A79    pop         ebx
 00585A7A    pop         ecx
 00585A7B    pop         ecx
 00585A7C    pop         ebp
 00585A7D    ret         0C
*}
end;

//00585A80
function TMSDOMNamedNodeMap.setNamedItemNS(const arg:IDOMNode):IDOMNode; safecall;
begin
{*
 00585A80    push        ebp
 00585A81    mov         ebp,esp
 00585A83    push        0
 00585A85    push        0
 00585A87    push        ebx
 00585A88    push        esi
 00585A89    push        edi
 00585A8A    mov         ebx,dword ptr [ebp+8]
 00585A8D    mov         eax,dword ptr [ebp+10]
 00585A90    test        eax,eax
>00585A92    je          00585A98
 00585A94    xor         edx,edx
 00585A96    mov         dword ptr [eax],edx
 00585A98    push        ebx
 00585A99    xor         eax,eax
 00585A9B    push        ebp
 00585A9C    push        585AE5
 00585AA1    push        dword ptr fs:[eax]
 00585AA4    mov         dword ptr fs:[eax],esp
 00585AA7    lea         eax,[ebp-4]
 00585AAA    call        @IntfClear
 00585AAF    push        eax
 00585AB0    lea         edx,[ebp-8]
 00585AB3    mov         eax,dword ptr [ebp+0C]
 00585AB6    call        GetMSNode
 00585ABB    mov         eax,dword ptr [ebp-8]
 00585ABE    push        eax
 00585ABF    mov         eax,dword ptr [ebx+0C]
 00585AC2    push        eax
 00585AC3    mov         eax,dword ptr [eax]
 00585AC5    call        dword ptr [eax+20]
 00585AC8    call        @CheckAutoResult
 00585ACD    mov         eax,dword ptr [ebp-4]
 00585AD0    mov         edx,dword ptr [ebp+10]
 00585AD3    call        MakeNode
 00585AD8    xor         eax,eax
 00585ADA    pop         edx
 00585ADB    pop         ecx
 00585ADC    pop         ecx
 00585ADD    mov         dword ptr fs:[eax],edx
 00585AE0    pop         eax
 00585AE1    xor         ebx,ebx
>00585AE3    jmp         00585AEA
>00585AE5    jmp         @HandleAutoException
 00585AEA    lea         eax,[ebp-8]
 00585AED    mov         edx,dword ptr ds:[5809EC];IXMLDOMNode
 00585AF3    mov         ecx,2
 00585AF8    call        @FinalizeArray
 00585AFD    mov         eax,ebx
 00585AFF    pop         edi
 00585B00    pop         esi
 00585B01    pop         ebx
 00585B02    pop         ecx
 00585B03    pop         ecx
 00585B04    pop         ebp
 00585B05    ret         0C
*}
end;

//00585B08
function TMSDOMCharacterData.GetMSCharacterData:IXMLDOMCharacterData;
begin
{*
 00585B08    push        ebx
 00585B09    push        esi
 00585B0A    mov         esi,edx
 00585B0C    mov         ebx,eax
 00585B0E    mov         eax,esi
 00585B10    mov         edx,dword ptr [ebx+0C]
 00585B13    mov         ecx,585B20
 00585B18    call        @IntfCast
 00585B1D    pop         esi
 00585B1E    pop         ebx
 00585B1F    ret
*}
end;

//00585B30
procedure TMSDOMCharacterData.appendData(const data:DOMString); safecall;
begin
{*
 00585B30    push        ebp
 00585B31    mov         ebp,esp
 00585B33    push        0
 00585B35    push        0
 00585B37    push        ebx
 00585B38    push        esi
 00585B39    push        edi
 00585B3A    mov         ebx,dword ptr [ebp+8]
 00585B3D    push        ebx
 00585B3E    xor         eax,eax
 00585B40    push        ebp
 00585B41    push        585B83
 00585B46    push        dword ptr fs:[eax]
 00585B49    mov         dword ptr fs:[eax],esp
 00585B4C    lea         eax,[ebp-4]
 00585B4F    mov         edx,dword ptr [ebp+0C]
 00585B52    call        @WStrFromUStr
 00585B57    mov         eax,dword ptr [ebp-4]
 00585B5A    push        eax
 00585B5B    lea         edx,[ebp-8]
 00585B5E    mov         eax,ebx
 00585B60    call        TMSDOMCharacterData.GetMSCharacterData
 00585B65    mov         eax,dword ptr [ebp-8]
 00585B68    push        eax
 00585B69    mov         eax,dword ptr [eax]
 00585B6B    call        dword ptr [eax+0BC]
 00585B71    call        @CheckAutoResult
 00585B76    xor         eax,eax
 00585B78    pop         edx
 00585B79    pop         ecx
 00585B7A    pop         ecx
 00585B7B    mov         dword ptr fs:[eax],edx
 00585B7E    pop         eax
 00585B7F    xor         ebx,ebx
>00585B81    jmp         00585B88
>00585B83    jmp         @HandleAutoException
 00585B88    lea         eax,[ebp-8]
 00585B8B    call        @IntfClear
 00585B90    lea         eax,[ebp-4]
 00585B93    call        @WStrClr
 00585B98    mov         eax,ebx
 00585B9A    pop         edi
 00585B9B    pop         esi
 00585B9C    pop         ebx
 00585B9D    pop         ecx
 00585B9E    pop         ecx
 00585B9F    pop         ebp
 00585BA0    ret         8
*}
end;

//00585BA4
procedure TMSDOMCharacterData.deleteData(offset:Integer; count:Integer); safecall;
begin
{*
 00585BA4    push        ebp
 00585BA5    mov         ebp,esp
 00585BA7    push        0
 00585BA9    push        ebx
 00585BAA    push        esi
 00585BAB    push        edi
 00585BAC    mov         ebx,dword ptr [ebp+8]
 00585BAF    push        ebx
 00585BB0    xor         eax,eax
 00585BB2    push        ebp
 00585BB3    push        585BEE
 00585BB8    push        dword ptr fs:[eax]
 00585BBB    mov         dword ptr fs:[eax],esp
 00585BBE    mov         eax,dword ptr [ebp+10]
 00585BC1    push        eax
 00585BC2    mov         eax,dword ptr [ebp+0C]
 00585BC5    push        eax
 00585BC6    lea         edx,[ebp-4]
 00585BC9    mov         eax,ebx
 00585BCB    call        TMSDOMCharacterData.GetMSCharacterData
 00585BD0    mov         eax,dword ptr [ebp-4]
 00585BD3    push        eax
 00585BD4    mov         eax,dword ptr [eax]
 00585BD6    call        dword ptr [eax+0C4]
 00585BDC    call        @CheckAutoResult
 00585BE1    xor         eax,eax
 00585BE3    pop         edx
 00585BE4    pop         ecx
 00585BE5    pop         ecx
 00585BE6    mov         dword ptr fs:[eax],edx
 00585BE9    pop         eax
 00585BEA    xor         ebx,ebx
>00585BEC    jmp         00585BF3
>00585BEE    jmp         @HandleAutoException
 00585BF3    lea         eax,[ebp-4]
 00585BF6    call        @IntfClear
 00585BFB    mov         eax,ebx
 00585BFD    pop         edi
 00585BFE    pop         esi
 00585BFF    pop         ebx
 00585C00    pop         ecx
 00585C01    pop         ebp
 00585C02    ret         0C
*}
end;

//00585C08
function TMSDOMCharacterData.get_data:DOMString; safecall;
begin
{*
 00585C08    push        ebp
 00585C09    mov         ebp,esp
 00585C0B    push        0
 00585C0D    push        0
 00585C0F    push        ebx
 00585C10    push        esi
 00585C11    push        edi
 00585C12    mov         ebx,dword ptr [ebp+8]
 00585C15    mov         eax,dword ptr [ebp+0C]
 00585C18    test        eax,eax
>00585C1A    je          00585C20
 00585C1C    xor         edx,edx
 00585C1E    mov         dword ptr [eax],edx
 00585C20    push        ebx
 00585C21    xor         eax,eax
 00585C23    push        ebp
 00585C24    push        585C6B
 00585C29    push        dword ptr fs:[eax]
 00585C2C    mov         dword ptr fs:[eax],esp
 00585C2F    lea         eax,[ebp-4]
 00585C32    call        @WStrClr
 00585C37    push        eax
 00585C38    lea         edx,[ebp-8]
 00585C3B    mov         eax,ebx
 00585C3D    call        TMSDOMCharacterData.GetMSCharacterData
 00585C42    mov         eax,dword ptr [ebp-8]
 00585C45    push        eax
 00585C46    mov         eax,dword ptr [eax]
 00585C48    call        dword ptr [eax+0AC]
 00585C4E    call        @CheckAutoResult
 00585C53    mov         edx,dword ptr [ebp-4]
 00585C56    mov         eax,dword ptr [ebp+0C]
 00585C59    call        @UStrFromWStr
 00585C5E    xor         eax,eax
 00585C60    pop         edx
 00585C61    pop         ecx
 00585C62    pop         ecx
 00585C63    mov         dword ptr fs:[eax],edx
 00585C66    pop         eax
 00585C67    xor         ebx,ebx
>00585C69    jmp         00585C70
>00585C6B    jmp         @HandleAutoException
 00585C70    lea         eax,[ebp-8]
 00585C73    call        @IntfClear
 00585C78    lea         eax,[ebp-4]
 00585C7B    call        @WStrClr
 00585C80    mov         eax,ebx
 00585C82    pop         edi
 00585C83    pop         esi
 00585C84    pop         ebx
 00585C85    pop         ecx
 00585C86    pop         ecx
 00585C87    pop         ebp
 00585C88    ret         8
*}
end;

//00585C8C
function TMSDOMCharacterData.get_length:Integer; safecall;
begin
{*
 00585C8C    push        ebp
 00585C8D    mov         ebp,esp
 00585C8F    add         esp,0FFFFFFF8
 00585C92    push        ebx
 00585C93    push        esi
 00585C94    push        edi
 00585C95    xor         eax,eax
 00585C97    mov         dword ptr [ebp-8],eax
 00585C9A    mov         ebx,dword ptr [ebp+8]
 00585C9D    push        ebx
 00585C9E    xor         eax,eax
 00585CA0    push        ebp
 00585CA1    push        585CE0
 00585CA6    push        dword ptr fs:[eax]
 00585CA9    mov         dword ptr fs:[eax],esp
 00585CAC    lea         eax,[ebp-4]
 00585CAF    push        eax
 00585CB0    lea         edx,[ebp-8]
 00585CB3    mov         eax,ebx
 00585CB5    call        TMSDOMCharacterData.GetMSCharacterData
 00585CBA    mov         eax,dword ptr [ebp-8]
 00585CBD    push        eax
 00585CBE    mov         eax,dword ptr [eax]
 00585CC0    call        dword ptr [eax+0B4]
 00585CC6    call        @CheckAutoResult
 00585CCB    mov         eax,dword ptr [ebp-4]
 00585CCE    mov         edx,dword ptr [ebp+0C]
 00585CD1    mov         dword ptr [edx],eax
 00585CD3    xor         eax,eax
 00585CD5    pop         edx
 00585CD6    pop         ecx
 00585CD7    pop         ecx
 00585CD8    mov         dword ptr fs:[eax],edx
 00585CDB    pop         eax
 00585CDC    xor         ebx,ebx
>00585CDE    jmp         00585CE5
>00585CE0    jmp         @HandleAutoException
 00585CE5    lea         eax,[ebp-8]
 00585CE8    call        @IntfClear
 00585CED    mov         eax,ebx
 00585CEF    pop         edi
 00585CF0    pop         esi
 00585CF1    pop         ebx
 00585CF2    pop         ecx
 00585CF3    pop         ecx
 00585CF4    pop         ebp
 00585CF5    ret         8
*}
end;

//00585CF8
procedure TMSDOMCharacterData.insertData(offset:Integer; const data:DOMString); safecall;
begin
{*
 00585CF8    push        ebp
 00585CF9    mov         ebp,esp
 00585CFB    push        0
 00585CFD    push        0
 00585CFF    push        ebx
 00585D00    push        esi
 00585D01    push        edi
 00585D02    mov         ebx,dword ptr [ebp+8]
 00585D05    push        ebx
 00585D06    xor         eax,eax
 00585D08    push        ebp
 00585D09    push        585D4F
 00585D0E    push        dword ptr fs:[eax]
 00585D11    mov         dword ptr fs:[eax],esp
 00585D14    lea         eax,[ebp-4]
 00585D17    mov         edx,dword ptr [ebp+10]
 00585D1A    call        @WStrFromUStr
 00585D1F    mov         eax,dword ptr [ebp-4]
 00585D22    push        eax
 00585D23    mov         eax,dword ptr [ebp+0C]
 00585D26    push        eax
 00585D27    lea         edx,[ebp-8]
 00585D2A    mov         eax,ebx
 00585D2C    call        TMSDOMCharacterData.GetMSCharacterData
 00585D31    mov         eax,dword ptr [ebp-8]
 00585D34    push        eax
 00585D35    mov         eax,dword ptr [eax]
 00585D37    call        dword ptr [eax+0C0]
 00585D3D    call        @CheckAutoResult
 00585D42    xor         eax,eax
 00585D44    pop         edx
 00585D45    pop         ecx
 00585D46    pop         ecx
 00585D47    mov         dword ptr fs:[eax],edx
 00585D4A    pop         eax
 00585D4B    xor         ebx,ebx
>00585D4D    jmp         00585D54
>00585D4F    jmp         @HandleAutoException
 00585D54    lea         eax,[ebp-8]
 00585D57    call        @IntfClear
 00585D5C    lea         eax,[ebp-4]
 00585D5F    call        @WStrClr
 00585D64    mov         eax,ebx
 00585D66    pop         edi
 00585D67    pop         esi
 00585D68    pop         ebx
 00585D69    pop         ecx
 00585D6A    pop         ecx
 00585D6B    pop         ebp
 00585D6C    ret         0C
*}
end;

//00585D70
procedure TMSDOMCharacterData.replaceData(offset:Integer; count:Integer; const data:DOMString); safecall;
begin
{*
 00585D70    push        ebp
 00585D71    mov         ebp,esp
 00585D73    push        0
 00585D75    push        0
 00585D77    push        ebx
 00585D78    push        esi
 00585D79    push        edi
 00585D7A    mov         ebx,dword ptr [ebp+8]
 00585D7D    push        ebx
 00585D7E    xor         eax,eax
 00585D80    push        ebp
 00585D81    push        585DCB
 00585D86    push        dword ptr fs:[eax]
 00585D89    mov         dword ptr fs:[eax],esp
 00585D8C    lea         eax,[ebp-4]
 00585D8F    mov         edx,dword ptr [ebp+14]
 00585D92    call        @WStrFromUStr
 00585D97    mov         eax,dword ptr [ebp-4]
 00585D9A    push        eax
 00585D9B    mov         eax,dword ptr [ebp+10]
 00585D9E    push        eax
 00585D9F    mov         eax,dword ptr [ebp+0C]
 00585DA2    push        eax
 00585DA3    lea         edx,[ebp-8]
 00585DA6    mov         eax,ebx
 00585DA8    call        TMSDOMCharacterData.GetMSCharacterData
 00585DAD    mov         eax,dword ptr [ebp-8]
 00585DB0    push        eax
 00585DB1    mov         eax,dword ptr [eax]
 00585DB3    call        dword ptr [eax+0C8]
 00585DB9    call        @CheckAutoResult
 00585DBE    xor         eax,eax
 00585DC0    pop         edx
 00585DC1    pop         ecx
 00585DC2    pop         ecx
 00585DC3    mov         dword ptr fs:[eax],edx
 00585DC6    pop         eax
 00585DC7    xor         ebx,ebx
>00585DC9    jmp         00585DD0
>00585DCB    jmp         @HandleAutoException
 00585DD0    lea         eax,[ebp-8]
 00585DD3    call        @IntfClear
 00585DD8    lea         eax,[ebp-4]
 00585DDB    call        @WStrClr
 00585DE0    mov         eax,ebx
 00585DE2    pop         edi
 00585DE3    pop         esi
 00585DE4    pop         ebx
 00585DE5    pop         ecx
 00585DE6    pop         ecx
 00585DE7    pop         ebp
 00585DE8    ret         10
*}
end;

//00585DEC
procedure TMSDOMCharacterData.set_data(const data:DOMString); safecall;
begin
{*
 00585DEC    push        ebp
 00585DED    mov         ebp,esp
 00585DEF    push        0
 00585DF1    push        0
 00585DF3    push        ebx
 00585DF4    push        esi
 00585DF5    push        edi
 00585DF6    mov         ebx,dword ptr [ebp+8]
 00585DF9    push        ebx
 00585DFA    xor         eax,eax
 00585DFC    push        ebp
 00585DFD    push        585E3F
 00585E02    push        dword ptr fs:[eax]
 00585E05    mov         dword ptr fs:[eax],esp
 00585E08    lea         eax,[ebp-4]
 00585E0B    mov         edx,dword ptr [ebp+0C]
 00585E0E    call        @WStrFromUStr
 00585E13    mov         eax,dword ptr [ebp-4]
 00585E16    push        eax
 00585E17    lea         edx,[ebp-8]
 00585E1A    mov         eax,ebx
 00585E1C    call        TMSDOMCharacterData.GetMSCharacterData
 00585E21    mov         eax,dword ptr [ebp-8]
 00585E24    push        eax
 00585E25    mov         eax,dword ptr [eax]
 00585E27    call        dword ptr [eax+0B0]
 00585E2D    call        @CheckAutoResult
 00585E32    xor         eax,eax
 00585E34    pop         edx
 00585E35    pop         ecx
 00585E36    pop         ecx
 00585E37    mov         dword ptr fs:[eax],edx
 00585E3A    pop         eax
 00585E3B    xor         ebx,ebx
>00585E3D    jmp         00585E44
>00585E3F    jmp         @HandleAutoException
 00585E44    lea         eax,[ebp-8]
 00585E47    call        @IntfClear
 00585E4C    lea         eax,[ebp-4]
 00585E4F    call        @WStrClr
 00585E54    mov         eax,ebx
 00585E56    pop         edi
 00585E57    pop         esi
 00585E58    pop         ebx
 00585E59    pop         ecx
 00585E5A    pop         ecx
 00585E5B    pop         ebp
 00585E5C    ret         8
*}
end;

//00585E60
function TMSDOMCharacterData.substringData(offset:Integer; count:Integer):DOMString; safecall;
begin
{*
 00585E60    push        ebp
 00585E61    mov         ebp,esp
 00585E63    push        0
 00585E65    push        0
 00585E67    push        ebx
 00585E68    push        esi
 00585E69    push        edi
 00585E6A    mov         ebx,dword ptr [ebp+8]
 00585E6D    mov         eax,dword ptr [ebp+14]
 00585E70    test        eax,eax
>00585E72    je          00585E78
 00585E74    xor         edx,edx
 00585E76    mov         dword ptr [eax],edx
 00585E78    push        ebx
 00585E79    xor         eax,eax
 00585E7B    push        ebp
 00585E7C    push        585ECB
 00585E81    push        dword ptr fs:[eax]
 00585E84    mov         dword ptr fs:[eax],esp
 00585E87    lea         eax,[ebp-4]
 00585E8A    call        @WStrClr
 00585E8F    push        eax
 00585E90    mov         eax,dword ptr [ebp+10]
 00585E93    push        eax
 00585E94    mov         eax,dword ptr [ebp+0C]
 00585E97    push        eax
 00585E98    lea         edx,[ebp-8]
 00585E9B    mov         eax,ebx
 00585E9D    call        TMSDOMCharacterData.GetMSCharacterData
 00585EA2    mov         eax,dword ptr [ebp-8]
 00585EA5    push        eax
 00585EA6    mov         eax,dword ptr [eax]
 00585EA8    call        dword ptr [eax+0B8]
 00585EAE    call        @CheckAutoResult
 00585EB3    mov         edx,dword ptr [ebp-4]
 00585EB6    mov         eax,dword ptr [ebp+14]
 00585EB9    call        @UStrFromWStr
 00585EBE    xor         eax,eax
 00585EC0    pop         edx
 00585EC1    pop         ecx
 00585EC2    pop         ecx
 00585EC3    mov         dword ptr fs:[eax],edx
 00585EC6    pop         eax
 00585EC7    xor         ebx,ebx
>00585EC9    jmp         00585ED0
>00585ECB    jmp         @HandleAutoException
 00585ED0    lea         eax,[ebp-8]
 00585ED3    call        @IntfClear
 00585ED8    lea         eax,[ebp-4]
 00585EDB    call        @WStrClr
 00585EE0    mov         eax,ebx
 00585EE2    pop         edi
 00585EE3    pop         esi
 00585EE4    pop         ebx
 00585EE5    pop         ecx
 00585EE6    pop         ecx
 00585EE7    pop         ebp
 00585EE8    ret         10
*}
end;

//00585EEC
function TMSDOMAttr.GetMSAttribute:IXMLDOMAttribute;
begin
{*
 00585EEC    push        ebx
 00585EED    push        esi
 00585EEE    mov         esi,edx
 00585EF0    mov         ebx,eax
 00585EF2    mov         eax,esi
 00585EF4    mov         edx,dword ptr [ebx+0C]
 00585EF7    mov         ecx,585F04
 00585EFC    call        @IntfCast
 00585F01    pop         esi
 00585F02    pop         ebx
 00585F03    ret
*}
end;

//00585F14
function TMSDOMAttr.get_name:DOMString; safecall;
begin
{*
 00585F14    push        ebp
 00585F15    mov         ebp,esp
 00585F17    push        0
 00585F19    push        0
 00585F1B    push        ebx
 00585F1C    push        esi
 00585F1D    push        edi
 00585F1E    mov         ebx,dword ptr [ebp+8]
 00585F21    mov         eax,dword ptr [ebp+0C]
 00585F24    test        eax,eax
>00585F26    je          00585F2C
 00585F28    xor         edx,edx
 00585F2A    mov         dword ptr [eax],edx
 00585F2C    push        ebx
 00585F2D    xor         eax,eax
 00585F2F    push        ebp
 00585F30    push        585F77
 00585F35    push        dword ptr fs:[eax]
 00585F38    mov         dword ptr fs:[eax],esp
 00585F3B    lea         eax,[ebp-4]
 00585F3E    call        @WStrClr
 00585F43    push        eax
 00585F44    lea         edx,[ebp-8]
 00585F47    mov         eax,ebx
 00585F49    call        TMSDOMAttr.GetMSAttribute
 00585F4E    mov         eax,dword ptr [ebp-8]
 00585F51    push        eax
 00585F52    mov         eax,dword ptr [eax]
 00585F54    call        dword ptr [eax+0AC]
 00585F5A    call        @CheckAutoResult
 00585F5F    mov         edx,dword ptr [ebp-4]
 00585F62    mov         eax,dword ptr [ebp+0C]
 00585F65    call        @UStrFromWStr
 00585F6A    xor         eax,eax
 00585F6C    pop         edx
 00585F6D    pop         ecx
 00585F6E    pop         ecx
 00585F6F    mov         dword ptr fs:[eax],edx
 00585F72    pop         eax
 00585F73    xor         ebx,ebx
>00585F75    jmp         00585F7C
>00585F77    jmp         @HandleAutoException
 00585F7C    lea         eax,[ebp-8]
 00585F7F    call        @IntfClear
 00585F84    lea         eax,[ebp-4]
 00585F87    call        @WStrClr
 00585F8C    mov         eax,ebx
 00585F8E    pop         edi
 00585F8F    pop         esi
 00585F90    pop         ebx
 00585F91    pop         ecx
 00585F92    pop         ecx
 00585F93    pop         ebp
 00585F94    ret         8
*}
end;

//00585F98
function TMSDOMAttr.get_ownerElement:IDOMElement; safecall;
begin
{*
 00585F98    push        ebp
 00585F99    mov         ebp,esp
 00585F9B    push        ebx
 00585F9C    push        esi
 00585F9D    push        edi
 00585F9E    mov         eax,dword ptr [ebp+0C]
 00585FA1    test        eax,eax
>00585FA3    je          00585FA9
 00585FA5    xor         edx,edx
 00585FA7    mov         dword ptr [eax],edx
 00585FA9    push        dword ptr [ebp+8]
 00585FAC    xor         eax,eax
 00585FAE    push        ebp
 00585FAF    push        585FDE
 00585FB4    push        dword ptr fs:[eax]
 00585FB7    mov         dword ptr fs:[eax],esp
 00585FBA    mov         edx,585FF8;'MSXML'
 00585FBF    mov         eax,586010;'get_ownerElement'
 00585FC4    call        DOMVendorNotSupported
 00585FC9    mov         eax,dword ptr [ebp+0C]
 00585FCC    call        @IntfClear
 00585FD1    xor         eax,eax
 00585FD3    pop         edx
 00585FD4    pop         ecx
 00585FD5    pop         ecx
 00585FD6    mov         dword ptr fs:[eax],edx
 00585FD9    pop         eax
 00585FDA    xor         ebx,ebx
>00585FDC    jmp         00585FE3
>00585FDE    jmp         @HandleAutoException
 00585FE3    mov         eax,ebx
 00585FE5    pop         edi
 00585FE6    pop         esi
 00585FE7    pop         ebx
 00585FE8    pop         ebp
 00585FE9    ret         8
*}
end;

//00586034
function TMSDOMAttr.get_specified:WordBool; safecall;
begin
{*
 00586034    push        ebp
 00586035    mov         ebp,esp
 00586037    add         esp,0FFFFFFF8
 0058603A    push        ebx
 0058603B    push        esi
 0058603C    push        edi
 0058603D    xor         eax,eax
 0058603F    mov         dword ptr [ebp-8],eax
 00586042    mov         ebx,dword ptr [ebp+8]
 00586045    push        ebx
 00586046    xor         eax,eax
 00586048    push        ebp
 00586049    push        586087
 0058604E    push        dword ptr fs:[eax]
 00586051    mov         dword ptr fs:[eax],esp
 00586054    lea         eax,[ebp-4]
 00586057    push        eax
 00586058    lea         edx,[ebp-8]
 0058605B    mov         eax,ebx
 0058605D    call        TMSDOMAttr.GetMSAttribute
 00586062    mov         eax,dword ptr [ebp-8]
 00586065    push        eax
 00586066    mov         eax,dword ptr [eax]
 00586068    call        dword ptr [eax+70]
 0058606B    call        @CheckAutoResult
 00586070    movzx       eax,word ptr [ebp-4]
 00586074    mov         edx,dword ptr [ebp+0C]
 00586077    mov         word ptr [edx],ax
 0058607A    xor         eax,eax
 0058607C    pop         edx
 0058607D    pop         ecx
 0058607E    pop         ecx
 0058607F    mov         dword ptr fs:[eax],edx
 00586082    pop         eax
 00586083    xor         ebx,ebx
>00586085    jmp         0058608C
>00586087    jmp         @HandleAutoException
 0058608C    lea         eax,[ebp-8]
 0058608F    call        @IntfClear
 00586094    mov         eax,ebx
 00586096    pop         edi
 00586097    pop         esi
 00586098    pop         ebx
 00586099    pop         ecx
 0058609A    pop         ecx
 0058609B    pop         ebp
 0058609C    ret         8
*}
end;

//005860A0
function TMSDOMAttr.get_value:DOMString; safecall;
begin
{*
 005860A0    push        ebp
 005860A1    mov         ebp,esp
 005860A3    xor         ecx,ecx
 005860A5    push        ecx
 005860A6    push        ecx
 005860A7    push        ecx
 005860A8    push        ecx
 005860A9    push        ecx
 005860AA    push        ebx
 005860AB    push        esi
 005860AC    push        edi
 005860AD    mov         ebx,dword ptr [ebp+8]
 005860B0    mov         eax,dword ptr [ebp+0C]
 005860B3    test        eax,eax
>005860B5    je          005860BB
 005860B7    xor         edx,edx
 005860B9    mov         dword ptr [eax],edx
 005860BB    push        ebx
 005860BC    xor         eax,eax
 005860BE    push        ebp
 005860BF    push        586106
 005860C4    push        dword ptr fs:[eax]
 005860C7    mov         dword ptr fs:[eax],esp
 005860CA    lea         eax,[ebp-10]
 005860CD    call        @VarClr
 005860D2    push        eax
 005860D3    lea         edx,[ebp-14]
 005860D6    mov         eax,ebx
 005860D8    call        TMSDOMAttr.GetMSAttribute
 005860DD    mov         eax,dword ptr [ebp-14]
 005860E0    push        eax
 005860E1    mov         eax,dword ptr [eax]
 005860E3    call        dword ptr [eax+0B0]
 005860E9    call        @CheckAutoResult
 005860EE    lea         edx,[ebp-10]
 005860F1    mov         eax,dword ptr [ebp+0C]
 005860F4    call        @VarToUStr
 005860F9    xor         eax,eax
 005860FB    pop         edx
 005860FC    pop         ecx
 005860FD    pop         ecx
 005860FE    mov         dword ptr fs:[eax],edx
 00586101    pop         eax
 00586102    xor         ebx,ebx
>00586104    jmp         0058610B
>00586106    jmp         @HandleAutoException
 0058610B    lea         eax,[ebp-14]
 0058610E    call        @IntfClear
 00586113    lea         eax,[ebp-10]
 00586116    call        @VarClr
 0058611B    mov         eax,ebx
 0058611D    pop         edi
 0058611E    pop         esi
 0058611F    pop         ebx
 00586120    mov         esp,ebp
 00586122    pop         ebp
 00586123    ret         8
*}
end;

//00586128
procedure TMSDOMAttr.set_value(const attributeValue:DOMString); safecall;
begin
{*
 00586128    push        ebp
 00586129    mov         ebp,esp
 0058612B    xor         ecx,ecx
 0058612D    push        ecx
 0058612E    push        ecx
 0058612F    push        ecx
 00586130    push        ecx
 00586131    push        ecx
 00586132    push        ebx
 00586133    push        esi
 00586134    push        edi
 00586135    mov         ebx,dword ptr [ebp+8]
 00586138    push        ebx
 00586139    xor         eax,eax
 0058613B    push        ebp
 0058613C    push        586186
 00586141    push        dword ptr fs:[eax]
 00586144    mov         dword ptr fs:[eax],esp
 00586147    lea         eax,[ebp-10]
 0058614A    mov         edx,dword ptr [ebp+0C]
 0058614D    call        @OleVarFromUStr
 00586152    push        dword ptr [ebp-4]
 00586155    push        dword ptr [ebp-8]
 00586158    push        dword ptr [ebp-0C]
 0058615B    push        dword ptr [ebp-10]
 0058615E    lea         edx,[ebp-14]
 00586161    mov         eax,ebx
 00586163    call        TMSDOMAttr.GetMSAttribute
 00586168    mov         eax,dword ptr [ebp-14]
 0058616B    push        eax
 0058616C    mov         eax,dword ptr [eax]
 0058616E    call        dword ptr [eax+0B4]
 00586174    call        @CheckAutoResult
 00586179    xor         eax,eax
 0058617B    pop         edx
 0058617C    pop         ecx
 0058617D    pop         ecx
 0058617E    mov         dword ptr fs:[eax],edx
 00586181    pop         eax
 00586182    xor         ebx,ebx
>00586184    jmp         0058618B
>00586186    jmp         @HandleAutoException
 0058618B    lea         eax,[ebp-14]
 0058618E    call        @IntfClear
 00586193    lea         eax,[ebp-10]
 00586196    call        @VarClr
 0058619B    mov         eax,ebx
 0058619D    pop         edi
 0058619E    pop         esi
 0058619F    pop         ebx
 005861A0    mov         esp,ebp
 005861A2    pop         ebp
 005861A3    ret         8
*}
end;

//005861A8
function TMSDOMElement.GetMSElement:IXMLDOMElement;
begin
{*
 005861A8    push        ebx
 005861A9    push        esi
 005861AA    mov         esi,edx
 005861AC    mov         ebx,eax
 005861AE    mov         eax,esi
 005861B0    mov         edx,dword ptr [ebx+0C]
 005861B3    mov         ecx,5861C0
 005861B8    call        @IntfCast
 005861BD    pop         esi
 005861BE    pop         ebx
 005861BF    ret
*}
end;

//005861D0
function TMSDOMElement.get_tagName:DOMString; safecall;
begin
{*
 005861D0    push        ebp
 005861D1    mov         ebp,esp
 005861D3    push        0
 005861D5    push        0
 005861D7    push        ebx
 005861D8    push        esi
 005861D9    push        edi
 005861DA    mov         ebx,dword ptr [ebp+8]
 005861DD    mov         eax,dword ptr [ebp+0C]
 005861E0    test        eax,eax
>005861E2    je          005861E8
 005861E4    xor         edx,edx
 005861E6    mov         dword ptr [eax],edx
 005861E8    push        ebx
 005861E9    xor         eax,eax
 005861EB    push        ebp
 005861EC    push        586233
 005861F1    push        dword ptr fs:[eax]
 005861F4    mov         dword ptr fs:[eax],esp
 005861F7    lea         eax,[ebp-4]
 005861FA    call        @WStrClr
 005861FF    push        eax
 00586200    lea         edx,[ebp-8]
 00586203    mov         eax,ebx
 00586205    call        TMSDOMElement.GetMSElement
 0058620A    mov         eax,dword ptr [ebp-8]
 0058620D    push        eax
 0058620E    mov         eax,dword ptr [eax]
 00586210    call        dword ptr [eax+0AC]
 00586216    call        @CheckAutoResult
 0058621B    mov         edx,dword ptr [ebp-4]
 0058621E    mov         eax,dword ptr [ebp+0C]
 00586221    call        @UStrFromWStr
 00586226    xor         eax,eax
 00586228    pop         edx
 00586229    pop         ecx
 0058622A    pop         ecx
 0058622B    mov         dword ptr fs:[eax],edx
 0058622E    pop         eax
 0058622F    xor         ebx,ebx
>00586231    jmp         00586238
>00586233    jmp         @HandleAutoException
 00586238    lea         eax,[ebp-8]
 0058623B    call        @IntfClear
 00586240    lea         eax,[ebp-4]
 00586243    call        @WStrClr
 00586248    mov         eax,ebx
 0058624A    pop         edi
 0058624B    pop         esi
 0058624C    pop         ebx
 0058624D    pop         ecx
 0058624E    pop         ecx
 0058624F    pop         ebp
 00586250    ret         8
*}
end;

//00586254
function TMSDOMElement.getAttribute(const name:DOMString):DOMString; safecall;
begin
{*
 00586254    push        ebp
 00586255    mov         ebp,esp
 00586257    xor         ecx,ecx
 00586259    push        ecx
 0058625A    push        ecx
 0058625B    push        ecx
 0058625C    push        ecx
 0058625D    push        ecx
 0058625E    push        ecx
 0058625F    push        ebx
 00586260    push        esi
 00586261    push        edi
 00586262    mov         ebx,dword ptr [ebp+8]
 00586265    mov         eax,dword ptr [ebp+10]
 00586268    test        eax,eax
>0058626A    je          00586270
 0058626C    xor         edx,edx
 0058626E    mov         dword ptr [eax],edx
 00586270    push        ebx
 00586271    xor         eax,eax
 00586273    push        ebp
 00586274    push        5862CA
 00586279    push        dword ptr fs:[eax]
 0058627C    mov         dword ptr fs:[eax],esp
 0058627F    lea         eax,[ebp-10]
 00586282    call        @VarClr
 00586287    push        eax
 00586288    lea         eax,[ebp-14]
 0058628B    mov         edx,dword ptr [ebp+0C]
 0058628E    call        @WStrFromUStr
 00586293    mov         eax,dword ptr [ebp-14]
 00586296    push        eax
 00586297    lea         edx,[ebp-18]
 0058629A    mov         eax,ebx
 0058629C    call        TMSDOMElement.GetMSElement
 005862A1    mov         eax,dword ptr [ebp-18]
 005862A4    push        eax
 005862A5    mov         eax,dword ptr [eax]
 005862A7    call        dword ptr [eax+0B0]
 005862AD    call        @CheckAutoResult
 005862B2    lea         eax,[ebp-10]
 005862B5    mov         edx,dword ptr [ebp+10]
 005862B8    call        VarToStr
 005862BD    xor         eax,eax
 005862BF    pop         edx
 005862C0    pop         ecx
 005862C1    pop         ecx
 005862C2    mov         dword ptr fs:[eax],edx
 005862C5    pop         eax
 005862C6    xor         ebx,ebx
>005862C8    jmp         005862CF
>005862CA    jmp         @HandleAutoException
 005862CF    lea         eax,[ebp-18]
 005862D2    call        @IntfClear
 005862D7    lea         eax,[ebp-14]
 005862DA    call        @WStrClr
 005862DF    lea         eax,[ebp-10]
 005862E2    call        @VarClr
 005862E7    mov         eax,ebx
 005862E9    pop         edi
 005862EA    pop         esi
 005862EB    pop         ebx
 005862EC    mov         esp,ebp
 005862EE    pop         ebp
 005862EF    ret         0C
*}
end;

//005862F4
function TMSDOMElement.getAttributeNS(const namespaceURI:DOMString; const localName:DOMString):DOMString; safecall;
begin
{*
 005862F4    push        ebp
 005862F5    mov         ebp,esp
 005862F7    xor         ecx,ecx
 005862F9    push        ecx
 005862FA    push        ecx
 005862FB    push        ecx
 005862FC    push        ecx
 005862FD    push        ecx
 005862FE    push        ecx
 005862FF    push        ebx
 00586300    push        esi
 00586301    push        edi
 00586302    mov         ebx,dword ptr [ebp+8]
 00586305    mov         eax,dword ptr [ebp+14]
 00586308    test        eax,eax
>0058630A    je          00586310
 0058630C    xor         edx,edx
 0058630E    mov         dword ptr [eax],edx
 00586310    push        ebx
 00586311    xor         eax,eax
 00586313    push        ebp
 00586314    push        586385
 00586319    push        dword ptr fs:[eax]
 0058631C    mov         dword ptr fs:[eax],esp
 0058631F    lea         eax,[ebp-4]
 00586322    call        @IntfClear
 00586327    push        eax
 00586328    mov         eax,dword ptr [ebp+10]
 0058632B    push        eax
 0058632C    mov         eax,dword ptr [ebp+0C]
 0058632F    push        eax
 00586330    push        ebx
 00586331    call        TMSDOMElement.getAttributeNodeNS
 00586336    call        @CheckAutoResult
 0058633B    cmp         dword ptr [ebp-4],0
>0058633F    je          00586370
 00586341    lea         eax,[ebp-18]
 00586344    call        @UStrClr
 00586349    push        eax
 0058634A    mov         eax,dword ptr [ebp-4]
 0058634D    push        eax
 0058634E    mov         eax,dword ptr [eax]
 00586350    call        dword ptr [eax+10]
 00586353    call        @CheckAutoResult
 00586358    mov         edx,dword ptr [ebp-18]
 0058635B    lea         eax,[ebp-14]
 0058635E    call        @VarFromUStr
 00586363    lea         eax,[ebp-14]
 00586366    mov         edx,dword ptr [ebp+14]
 00586369    call        VarToStr
>0058636E    jmp         00586378
 00586370    mov         eax,dword ptr [ebp+14]
 00586373    call        @UStrClr
 00586378    xor         eax,eax
 0058637A    pop         edx
 0058637B    pop         ecx
 0058637C    pop         ecx
 0058637D    mov         dword ptr fs:[eax],edx
 00586380    pop         eax
 00586381    xor         ebx,ebx
>00586383    jmp         0058638A
>00586385    jmp         @HandleAutoException
 0058638A    lea         eax,[ebp-18]
 0058638D    call        @UStrClr
 00586392    lea         eax,[ebp-14]
 00586395    call        @VarClr
 0058639A    lea         eax,[ebp-4]
 0058639D    call        @IntfClear
 005863A2    mov         eax,ebx
 005863A4    pop         edi
 005863A5    pop         esi
 005863A6    pop         ebx
 005863A7    mov         esp,ebp
 005863A9    pop         ebp
 005863AA    ret         10
*}
end;

//005863B0
function TMSDOMElement.getAttributeNode(const name:DOMString):IDOMAttr; safecall;
begin
{*
 005863B0    push        ebp
 005863B1    mov         ebp,esp
 005863B3    xor         ecx,ecx
 005863B5    push        ecx
 005863B6    push        ecx
 005863B7    push        ecx
 005863B8    push        ecx
 005863B9    push        ebx
 005863BA    push        esi
 005863BB    push        edi
 005863BC    mov         ebx,dword ptr [ebp+8]
 005863BF    mov         eax,dword ptr [ebp+10]
 005863C2    test        eax,eax
>005863C4    je          005863CA
 005863C6    xor         edx,edx
 005863C8    mov         dword ptr [eax],edx
 005863CA    push        ebx
 005863CB    xor         eax,eax
 005863CD    push        ebp
 005863CE    push        586434
 005863D3    push        dword ptr fs:[eax]
 005863D6    mov         dword ptr fs:[eax],esp
 005863D9    lea         eax,[ebp-8]
 005863DC    call        @IntfClear
 005863E1    push        eax
 005863E2    lea         eax,[ebp-0C]
 005863E5    mov         edx,dword ptr [ebp+0C]
 005863E8    call        @WStrFromUStr
 005863ED    mov         eax,dword ptr [ebp-0C]
 005863F0    push        eax
 005863F1    lea         edx,[ebp-10]
 005863F4    mov         eax,ebx
 005863F6    call        TMSDOMElement.GetMSElement
 005863FB    mov         eax,dword ptr [ebp-10]
 005863FE    push        eax
 005863FF    mov         eax,dword ptr [eax]
 00586401    call        dword ptr [eax+0BC]
 00586407    call        @CheckAutoResult
 0058640C    mov         eax,dword ptr [ebp-8]
 0058640F    lea         edx,[ebp-4]
 00586412    call        MakeNode
 00586417    mov         edx,dword ptr [ebp-4]
 0058641A    mov         eax,dword ptr [ebp+10]
 0058641D    mov         ecx,586464
 00586422    call        @IntfCast
 00586427    xor         eax,eax
 00586429    pop         edx
 0058642A    pop         ecx
 0058642B    pop         ecx
 0058642C    mov         dword ptr fs:[eax],edx
 0058642F    pop         eax
 00586430    xor         ebx,ebx
>00586432    jmp         00586439
>00586434    jmp         @HandleAutoException
 00586439    lea         eax,[ebp-10]
 0058643C    call        @IntfClear
 00586441    lea         eax,[ebp-0C]
 00586444    call        @WStrClr
 00586449    lea         eax,[ebp-8]
 0058644C    call        @IntfClear
 00586451    lea         eax,[ebp-4]
 00586454    call        @IntfClear
 00586459    mov         eax,ebx
 0058645B    pop         edi
 0058645C    pop         esi
 0058645D    pop         ebx
 0058645E    mov         esp,ebp
 00586460    pop         ebp
 00586461    ret         0C
*}
end;

//00586474
function TMSDOMElement.getAttributeNodeNS(const namespaceURI:DOMString; const localName:DOMString):IDOMAttr; safecall;
begin
{*
 00586474    push        ebp
 00586475    mov         ebp,esp
 00586477    xor         ecx,ecx
 00586479    push        ecx
 0058647A    push        ecx
 0058647B    push        ecx
 0058647C    push        ecx
 0058647D    push        ecx
 0058647E    push        ecx
 0058647F    push        ebx
 00586480    push        esi
 00586481    push        edi
 00586482    mov         ebx,dword ptr [ebp+8]
 00586485    mov         eax,dword ptr [ebp+14]
 00586488    test        eax,eax
>0058648A    je          00586490
 0058648C    xor         edx,edx
 0058648E    mov         dword ptr [eax],edx
 00586490    push        ebx
 00586491    xor         eax,eax
 00586493    push        ebp
 00586494    push        58651D
 00586499    push        dword ptr fs:[eax]
 0058649C    mov         dword ptr fs:[eax],esp
 0058649F    lea         eax,[ebp-8]
 005864A2    call        @IntfClear
 005864A7    push        eax
 005864A8    lea         eax,[ebp-0C]
 005864AB    mov         edx,dword ptr [ebp+0C]
 005864AE    call        @WStrFromUStr
 005864B3    mov         eax,dword ptr [ebp-0C]
 005864B6    push        eax
 005864B7    lea         eax,[ebp-10]
 005864BA    mov         edx,dword ptr [ebp+10]
 005864BD    call        @WStrFromUStr
 005864C2    mov         eax,dword ptr [ebp-10]
 005864C5    push        eax
 005864C6    lea         eax,[ebp-14]
 005864C9    call        @IntfClear
 005864CE    push        eax
 005864CF    lea         edx,[ebp-18]
 005864D2    mov         eax,ebx
 005864D4    call        TMSDOMElement.GetMSElement
 005864D9    mov         eax,dword ptr [ebp-18]
 005864DC    push        eax
 005864DD    mov         eax,dword ptr [eax]
 005864DF    call        dword ptr [eax+44]
 005864E2    call        @CheckAutoResult
 005864E7    mov         eax,dword ptr [ebp-14]
 005864EA    push        eax
 005864EB    mov         eax,dword ptr [eax]
 005864ED    call        dword ptr [eax+30]
 005864F0    call        @CheckAutoResult
 005864F5    mov         eax,dword ptr [ebp-8]
 005864F8    lea         edx,[ebp-4]
 005864FB    call        MakeNode
 00586500    mov         edx,dword ptr [ebp-4]
 00586503    mov         eax,dword ptr [ebp+14]
 00586506    mov         ecx,58655C
 0058650B    call        @IntfCast
 00586510    xor         eax,eax
 00586512    pop         edx
 00586513    pop         ecx
 00586514    pop         ecx
 00586515    mov         dword ptr fs:[eax],edx
 00586518    pop         eax
 00586519    xor         ebx,ebx
>0058651B    jmp         00586522
>0058651D    jmp         @HandleAutoException
 00586522    lea         eax,[ebp-18]
 00586525    call        @IntfClear
 0058652A    lea         eax,[ebp-14]
 0058652D    call        @IntfClear
 00586532    lea         eax,[ebp-10]
 00586535    mov         edx,2
 0058653A    call        @WStrArrayClr
 0058653F    lea         eax,[ebp-8]
 00586542    call        @IntfClear
 00586547    lea         eax,[ebp-4]
 0058654A    call        @IntfClear
 0058654F    mov         eax,ebx
 00586551    pop         edi
 00586552    pop         esi
 00586553    pop         ebx
 00586554    mov         esp,ebp
 00586556    pop         ebp
 00586557    ret         10
*}
end;

//0058656C
{*function sub_0058656C(?:?; ?:?; ?:?):?;
begin
 0058656C    push        ebp
 0058656D    mov         ebp,esp
 0058656F    push        0
 00586571    push        0
 00586573    push        0
 00586575    push        ebx
 00586576    push        esi
 00586577    push        edi
 00586578    mov         ebx,dword ptr [ebp+8]
 0058657B    mov         eax,dword ptr [ebp+10]
 0058657E    test        eax,eax
>00586580    je          00586586
 00586582    xor         edx,edx
 00586584    mov         dword ptr [eax],edx
 00586586    push        ebx
 00586587    xor         eax,eax
 00586589    push        ebp
 0058658A    push        5865E0
 0058658F    push        dword ptr fs:[eax]
 00586592    mov         dword ptr fs:[eax],esp
 00586595    lea         eax,[ebp-4]
 00586598    call        @IntfClear
 0058659D    push        eax
 0058659E    lea         eax,[ebp-8]
 005865A1    mov         edx,dword ptr [ebp+0C]
 005865A4    call        @WStrFromUStr
 005865A9    mov         eax,dword ptr [ebp-8]
 005865AC    push        eax
 005865AD    lea         edx,[ebp-0C]
 005865B0    mov         eax,ebx
 005865B2    call        TMSDOMElement.GetMSElement
 005865B7    mov         eax,dword ptr [ebp-0C]
 005865BA    push        eax
 005865BB    mov         eax,dword ptr [eax]
 005865BD    call        dword ptr [eax+0C8]
 005865C3    call        @CheckAutoResult
 005865C8    mov         eax,dword ptr [ebp-4]
 005865CB    mov         edx,dword ptr [ebp+10]
 005865CE    call        MakeNamedNodeMap
 005865D3    xor         eax,eax
 005865D5    pop         edx
 005865D6    pop         ecx
 005865D7    pop         ecx
 005865D8    mov         dword ptr fs:[eax],edx
 005865DB    pop         eax
 005865DC    xor         ebx,ebx
>005865DE    jmp         005865E5
>005865E0    jmp         @HandleAutoException
 005865E5    lea         eax,[ebp-0C]
 005865E8    call        @IntfClear
 005865ED    lea         eax,[ebp-8]
 005865F0    call        @WStrClr
 005865F5    lea         eax,[ebp-4]
 005865F8    call        @IntfClear
 005865FD    mov         eax,ebx
 005865FF    pop         edi
 00586600    pop         esi
 00586601    pop         ebx
 00586602    mov         esp,ebp
 00586604    pop         ebp
 00586605    ret         0C
end;*}

//00586608
function TMSDOMDocument.getElementsByTagNameNS(const namespaceURI:DOMString; const localName:DOMString):IDOMNodeList; safecall;
begin
{*
 00586608    push        ebp
 00586609    mov         ebp,esp
 0058660B    push        ebx
 0058660C    push        esi
 0058660D    push        edi
 0058660E    mov         eax,dword ptr [ebp+14]
 00586611    test        eax,eax
>00586613    je          00586619
 00586615    xor         edx,edx
 00586617    mov         dword ptr [eax],edx
 00586619    push        dword ptr [ebp+8]
 0058661C    xor         eax,eax
 0058661E    push        ebp
 0058661F    push        586646
 00586624    push        dword ptr fs:[eax]
 00586627    mov         dword ptr fs:[eax],esp
 0058662A    mov         edx,586660;'MSXML'
 0058662F    mov         eax,586678;'getElementsByTagNameNS'
 00586634    call        DOMVendorNotSupported
 00586639    xor         eax,eax
 0058663B    pop         edx
 0058663C    pop         ecx
 0058663D    pop         ecx
 0058663E    mov         dword ptr fs:[eax],edx
 00586641    pop         eax
 00586642    xor         ebx,ebx
>00586644    jmp         0058664B
>00586646    jmp         @HandleAutoException
 0058664B    mov         eax,ebx
 0058664D    pop         edi
 0058664E    pop         esi
 0058664F    pop         ebx
 00586650    pop         ebp
 00586651    ret         10
*}
end;

//005866A8
function TMSDOMElement.hasAttribute(const name:DOMString):WordBool; safecall;
begin
{*
 005866A8    push        ebp
 005866A9    mov         ebp,esp
 005866AB    push        0
 005866AD    push        0
 005866AF    push        0
 005866B1    push        ebx
 005866B2    push        esi
 005866B3    push        edi
 005866B4    mov         ebx,dword ptr [ebp+8]
 005866B7    push        ebx
 005866B8    xor         eax,eax
 005866BA    push        ebp
 005866BB    push        586741
 005866C0    push        dword ptr fs:[eax]
 005866C3    mov         dword ptr fs:[eax],esp
 005866C6    xor         eax,eax
 005866C8    push        ebp
 005866C9    push        586722
 005866CE    push        dword ptr fs:[eax]
 005866D1    mov         dword ptr fs:[eax],esp
 005866D4    lea         eax,[ebp-4]
 005866D7    call        @IntfClear
 005866DC    push        eax
 005866DD    lea         eax,[ebp-8]
 005866E0    mov         edx,dword ptr [ebp+0C]
 005866E3    call        @WStrFromUStr
 005866E8    mov         eax,dword ptr [ebp-8]
 005866EB    push        eax
 005866EC    lea         edx,[ebp-0C]
 005866EF    mov         eax,ebx
 005866F1    call        TMSDOMElement.GetMSElement
 005866F6    mov         eax,dword ptr [ebp-0C]
 005866F9    push        eax
 005866FA    mov         eax,dword ptr [eax]
 005866FC    call        dword ptr [eax+0BC]
 00586702    call        @CheckAutoResult
 00586707    cmp         dword ptr [ebp-4],0
 0058670B    setne       al
 0058670E    neg         al
 00586710    sbb         eax,eax
 00586712    mov         edx,dword ptr [ebp+10]
 00586715    mov         word ptr [edx],ax
 00586718    xor         eax,eax
 0058671A    pop         edx
 0058671B    pop         ecx
 0058671C    pop         ecx
 0058671D    mov         dword ptr fs:[eax],edx
>00586720    jmp         00586734
>00586722    jmp         @HandleAnyException
 00586727    mov         eax,dword ptr [ebp+10]
 0058672A    mov         word ptr [eax],0
 0058672F    call        @DoneExcept
 00586734    xor         eax,eax
 00586736    pop         edx
 00586737    pop         ecx
 00586738    pop         ecx
 00586739    mov         dword ptr fs:[eax],edx
 0058673C    pop         eax
 0058673D    xor         ebx,ebx
>0058673F    jmp         00586746
>00586741    jmp         @HandleAutoException
 00586746    lea         eax,[ebp-0C]
 00586749    call        @IntfClear
 0058674E    lea         eax,[ebp-8]
 00586751    call        @WStrClr
 00586756    lea         eax,[ebp-4]
 00586759    call        @IntfClear
 0058675E    mov         eax,ebx
 00586760    pop         edi
 00586761    pop         esi
 00586762    pop         ebx
 00586763    mov         esp,ebp
 00586765    pop         ebp
 00586766    ret         0C
*}
end;

//0058676C
function TMSDOMElement.hasAttributeNS(const namespaceURI:DOMString; const localName:DOMString):WordBool; safecall;
begin
{*
 0058676C    push        ebp
 0058676D    mov         ebp,esp
 0058676F    push        0
 00586771    push        ebx
 00586772    push        esi
 00586773    push        edi
 00586774    mov         ebx,dword ptr [ebp+8]
 00586777    push        ebx
 00586778    xor         eax,eax
 0058677A    push        ebp
 0058677B    push        5867EA
 00586780    push        dword ptr fs:[eax]
 00586783    mov         dword ptr fs:[eax],esp
 00586786    xor         eax,eax
 00586788    push        ebp
 00586789    push        5867CB
 0058678E    push        dword ptr fs:[eax]
 00586791    mov         dword ptr fs:[eax],esp
 00586794    lea         eax,[ebp-4]
 00586797    call        @IntfClear
 0058679C    push        eax
 0058679D    mov         eax,dword ptr [ebp+10]
 005867A0    push        eax
 005867A1    mov         eax,dword ptr [ebp+0C]
 005867A4    push        eax
 005867A5    push        ebx
 005867A6    call        TMSDOMElement.getAttributeNodeNS
 005867AB    call        @CheckAutoResult
 005867B0    cmp         dword ptr [ebp-4],0
 005867B4    setne       al
 005867B7    neg         al
 005867B9    sbb         eax,eax
 005867BB    mov         edx,dword ptr [ebp+14]
 005867BE    mov         word ptr [edx],ax
 005867C1    xor         eax,eax
 005867C3    pop         edx
 005867C4    pop         ecx
 005867C5    pop         ecx
 005867C6    mov         dword ptr fs:[eax],edx
>005867C9    jmp         005867DD
>005867CB    jmp         @HandleAnyException
 005867D0    mov         eax,dword ptr [ebp+14]
 005867D3    mov         word ptr [eax],0
 005867D8    call        @DoneExcept
 005867DD    xor         eax,eax
 005867DF    pop         edx
 005867E0    pop         ecx
 005867E1    pop         ecx
 005867E2    mov         dword ptr fs:[eax],edx
 005867E5    pop         eax
 005867E6    xor         ebx,ebx
>005867E8    jmp         005867EF
>005867EA    jmp         @HandleAutoException
 005867EF    lea         eax,[ebp-4]
 005867F2    call        @IntfClear
 005867F7    mov         eax,ebx
 005867F9    pop         edi
 005867FA    pop         esi
 005867FB    pop         ebx
 005867FC    pop         ecx
 005867FD    pop         ebp
 005867FE    ret         10
*}
end;

//00586804
procedure TMSDOMElement.removeAttribute(const name:DOMString); safecall;
begin
{*
 00586804    push        ebp
 00586805    mov         ebp,esp
 00586807    push        0
 00586809    push        0
 0058680B    push        ebx
 0058680C    push        esi
 0058680D    push        edi
 0058680E    mov         ebx,dword ptr [ebp+8]
 00586811    push        ebx
 00586812    xor         eax,eax
 00586814    push        ebp
 00586815    push        586857
 0058681A    push        dword ptr fs:[eax]
 0058681D    mov         dword ptr fs:[eax],esp
 00586820    lea         eax,[ebp-4]
 00586823    mov         edx,dword ptr [ebp+0C]
 00586826    call        @WStrFromUStr
 0058682B    mov         eax,dword ptr [ebp-4]
 0058682E    push        eax
 0058682F    lea         edx,[ebp-8]
 00586832    mov         eax,ebx
 00586834    call        TMSDOMElement.GetMSElement
 00586839    mov         eax,dword ptr [ebp-8]
 0058683C    push        eax
 0058683D    mov         eax,dword ptr [eax]
 0058683F    call        dword ptr [eax+0B8]
 00586845    call        @CheckAutoResult
 0058684A    xor         eax,eax
 0058684C    pop         edx
 0058684D    pop         ecx
 0058684E    pop         ecx
 0058684F    mov         dword ptr fs:[eax],edx
 00586852    pop         eax
 00586853    xor         ebx,ebx
>00586855    jmp         0058685C
>00586857    jmp         @HandleAutoException
 0058685C    lea         eax,[ebp-8]
 0058685F    call        @IntfClear
 00586864    lea         eax,[ebp-4]
 00586867    call        @WStrClr
 0058686C    mov         eax,ebx
 0058686E    pop         edi
 0058686F    pop         esi
 00586870    pop         ebx
 00586871    pop         ecx
 00586872    pop         ecx
 00586873    pop         ebp
 00586874    ret         8
*}
end;

//00586878
function TMSDOMElement.removeAttributeNode(const oldAttr:IDOMAttr):IDOMAttr; safecall;
begin
{*
 00586878    push        ebp
 00586879    mov         ebp,esp
 0058687B    xor         ecx,ecx
 0058687D    push        ecx
 0058687E    push        ecx
 0058687F    push        ecx
 00586880    push        ecx
 00586881    push        ecx
 00586882    push        ebx
 00586883    push        esi
 00586884    push        edi
 00586885    mov         ebx,dword ptr [ebp+8]
 00586888    mov         eax,dword ptr [ebp+10]
 0058688B    test        eax,eax
>0058688D    je          00586893
 0058688F    xor         edx,edx
 00586891    mov         dword ptr [eax],edx
 00586893    push        ebx
 00586894    xor         eax,eax
 00586896    push        ebp
 00586897    push        58690D
 0058689C    push        dword ptr fs:[eax]
 0058689F    mov         dword ptr fs:[eax],esp
 005868A2    lea         eax,[ebp-8]
 005868A5    call        @IntfClear
 005868AA    push        eax
 005868AB    lea         edx,[ebp-10]
 005868AE    mov         eax,dword ptr [ebp+0C]
 005868B1    call        GetMSNode
 005868B6    mov         edx,dword ptr [ebp-10]
 005868B9    lea         eax,[ebp-0C]
 005868BC    mov         ecx,586948
 005868C1    call        @IntfCast
 005868C6    mov         eax,dword ptr [ebp-0C]
 005868C9    push        eax
 005868CA    lea         edx,[ebp-14]
 005868CD    mov         eax,ebx
 005868CF    call        TMSDOMElement.GetMSElement
 005868D4    mov         eax,dword ptr [ebp-14]
 005868D7    push        eax
 005868D8    mov         eax,dword ptr [eax]
 005868DA    call        dword ptr [eax+0C4]
 005868E0    call        @CheckAutoResult
 005868E5    mov         eax,dword ptr [ebp-8]
 005868E8    lea         edx,[ebp-4]
 005868EB    call        MakeNode
 005868F0    mov         edx,dword ptr [ebp-4]
 005868F3    mov         eax,dword ptr [ebp+10]
 005868F6    mov         ecx,586958
 005868FB    call        @IntfCast
 00586900    xor         eax,eax
 00586902    pop         edx
 00586903    pop         ecx
 00586904    pop         ecx
 00586905    mov         dword ptr fs:[eax],edx
 00586908    pop         eax
 00586909    xor         ebx,ebx
>0058690B    jmp         00586912
>0058690D    jmp         @HandleAutoException
 00586912    lea         eax,[ebp-14]
 00586915    call        @IntfClear
 0058691A    lea         eax,[ebp-10]
 0058691D    call        @IntfClear
 00586922    lea         eax,[ebp-0C]
 00586925    mov         edx,dword ptr ds:[580B40];IXMLDOMAttribute
 0058692B    mov         ecx,2
 00586930    call        @FinalizeArray
 00586935    lea         eax,[ebp-4]
 00586938    call        @IntfClear
 0058693D    mov         eax,ebx
 0058693F    pop         edi
 00586940    pop         esi
 00586941    pop         ebx
 00586942    mov         esp,ebp
 00586944    pop         ebp
 00586945    ret         0C
*}
end;

//00586968
procedure TMSDOMElement.removeAttributeNS(const namespaceURI:DOMString; const localName:DOMString); safecall;
begin
{*
 00586968    push        ebp
 00586969    mov         ebp,esp
 0058696B    xor         ecx,ecx
 0058696D    push        ecx
 0058696E    push        ecx
 0058696F    push        ecx
 00586970    push        ecx
 00586971    push        ecx
 00586972    push        ebx
 00586973    push        esi
 00586974    push        edi
 00586975    mov         ebx,dword ptr [ebp+8]
 00586978    push        ebx
 00586979    xor         eax,eax
 0058697B    push        ebp
 0058697C    push        5869EA
 00586981    push        dword ptr fs:[eax]
 00586984    mov         dword ptr fs:[eax],esp
 00586987    lea         eax,[ebp-4]
 0058698A    call        @IntfClear
 0058698F    push        eax
 00586990    lea         eax,[ebp-8]
 00586993    mov         edx,dword ptr [ebp+0C]
 00586996    call        @WStrFromUStr
 0058699B    mov         eax,dword ptr [ebp-8]
 0058699E    push        eax
 0058699F    lea         eax,[ebp-0C]
 005869A2    mov         edx,dword ptr [ebp+10]
 005869A5    call        @WStrFromUStr
 005869AA    mov         eax,dword ptr [ebp-0C]
 005869AD    push        eax
 005869AE    lea         eax,[ebp-10]
 005869B1    call        @IntfClear
 005869B6    push        eax
 005869B7    lea         edx,[ebp-14]
 005869BA    mov         eax,ebx
 005869BC    call        TMSDOMElement.GetMSElement
 005869C1    mov         eax,dword ptr [ebp-14]
 005869C4    push        eax
 005869C5    mov         eax,dword ptr [eax]
 005869C7    call        dword ptr [eax+44]
 005869CA    call        @CheckAutoResult
 005869CF    mov         eax,dword ptr [ebp-10]
 005869D2    push        eax
 005869D3    mov         eax,dword ptr [eax]
 005869D5    call        dword ptr [eax+34]
 005869D8    call        @CheckAutoResult
 005869DD    xor         eax,eax
 005869DF    pop         edx
 005869E0    pop         ecx
 005869E1    pop         ecx
 005869E2    mov         dword ptr fs:[eax],edx
 005869E5    pop         eax
 005869E6    xor         ebx,ebx
>005869E8    jmp         005869EF
>005869EA    jmp         @HandleAutoException
 005869EF    lea         eax,[ebp-14]
 005869F2    call        @IntfClear
 005869F7    lea         eax,[ebp-10]
 005869FA    call        @IntfClear
 005869FF    lea         eax,[ebp-0C]
 00586A02    mov         edx,2
 00586A07    call        @WStrArrayClr
 00586A0C    lea         eax,[ebp-4]
 00586A0F    call        @IntfClear
 00586A14    mov         eax,ebx
 00586A16    pop         edi
 00586A17    pop         esi
 00586A18    pop         ebx
 00586A19    mov         esp,ebp
 00586A1B    pop         ebp
 00586A1C    ret         0C
*}
end;

//00586A20
procedure TMSDOMElement.setAttribute(const name:DOMString; const value:DOMString); safecall;
begin
{*
 00586A20    push        ebp
 00586A21    mov         ebp,esp
 00586A23    xor         ecx,ecx
 00586A25    push        ecx
 00586A26    push        ecx
 00586A27    push        ecx
 00586A28    push        ecx
 00586A29    push        ecx
 00586A2A    push        ecx
 00586A2B    push        ebx
 00586A2C    push        esi
 00586A2D    push        edi
 00586A2E    mov         ebx,dword ptr [ebp+8]
 00586A31    push        ebx
 00586A32    xor         eax,eax
 00586A34    push        ebp
 00586A35    push        586A8E
 00586A3A    push        dword ptr fs:[eax]
 00586A3D    mov         dword ptr fs:[eax],esp
 00586A40    lea         eax,[ebp-10]
 00586A43    mov         edx,dword ptr [ebp+10]
 00586A46    call        @OleVarFromUStr
 00586A4B    push        dword ptr [ebp-4]
 00586A4E    push        dword ptr [ebp-8]
 00586A51    push        dword ptr [ebp-0C]
 00586A54    push        dword ptr [ebp-10]
 00586A57    lea         eax,[ebp-14]
 00586A5A    mov         edx,dword ptr [ebp+0C]
 00586A5D    call        @WStrFromUStr
 00586A62    mov         eax,dword ptr [ebp-14]
 00586A65    push        eax
 00586A66    lea         edx,[ebp-18]
 00586A69    mov         eax,ebx
 00586A6B    call        TMSDOMElement.GetMSElement
 00586A70    mov         eax,dword ptr [ebp-18]
 00586A73    push        eax
 00586A74    mov         eax,dword ptr [eax]
 00586A76    call        dword ptr [eax+0B4]
 00586A7C    call        @CheckAutoResult
 00586A81    xor         eax,eax
 00586A83    pop         edx
 00586A84    pop         ecx
 00586A85    pop         ecx
 00586A86    mov         dword ptr fs:[eax],edx
 00586A89    pop         eax
 00586A8A    xor         ebx,ebx
>00586A8C    jmp         00586A93
>00586A8E    jmp         @HandleAutoException
 00586A93    lea         eax,[ebp-18]
 00586A96    call        @IntfClear
 00586A9B    lea         eax,[ebp-14]
 00586A9E    call        @WStrClr
 00586AA3    lea         eax,[ebp-10]
 00586AA6    call        @VarClr
 00586AAB    mov         eax,ebx
 00586AAD    pop         edi
 00586AAE    pop         esi
 00586AAF    pop         ebx
 00586AB0    mov         esp,ebp
 00586AB2    pop         ebp
 00586AB3    ret         0C
*}
end;

//00586AB8
function TMSDOMElement.setAttributeNode(const newAttr:IDOMAttr):IDOMAttr; safecall;
begin
{*
 00586AB8    push        ebp
 00586AB9    mov         ebp,esp
 00586ABB    xor         ecx,ecx
 00586ABD    push        ecx
 00586ABE    push        ecx
 00586ABF    push        ecx
 00586AC0    push        ecx
 00586AC1    push        ecx
 00586AC2    push        ebx
 00586AC3    push        esi
 00586AC4    push        edi
 00586AC5    mov         ebx,dword ptr [ebp+8]
 00586AC8    mov         eax,dword ptr [ebp+10]
 00586ACB    test        eax,eax
>00586ACD    je          00586AD3
 00586ACF    xor         edx,edx
 00586AD1    mov         dword ptr [eax],edx
 00586AD3    push        ebx
 00586AD4    xor         eax,eax
 00586AD6    push        ebp
 00586AD7    push        586B4D
 00586ADC    push        dword ptr fs:[eax]
 00586ADF    mov         dword ptr fs:[eax],esp
 00586AE2    lea         eax,[ebp-8]
 00586AE5    call        @IntfClear
 00586AEA    push        eax
 00586AEB    lea         edx,[ebp-10]
 00586AEE    mov         eax,dword ptr [ebp+0C]
 00586AF1    call        GetMSNode
 00586AF6    mov         edx,dword ptr [ebp-10]
 00586AF9    lea         eax,[ebp-0C]
 00586AFC    mov         ecx,586B88
 00586B01    call        @IntfCast
 00586B06    mov         eax,dword ptr [ebp-0C]
 00586B09    push        eax
 00586B0A    lea         edx,[ebp-14]
 00586B0D    mov         eax,ebx
 00586B0F    call        TMSDOMElement.GetMSElement
 00586B14    mov         eax,dword ptr [ebp-14]
 00586B17    push        eax
 00586B18    mov         eax,dword ptr [eax]
 00586B1A    call        dword ptr [eax+0C0]
 00586B20    call        @CheckAutoResult
 00586B25    mov         eax,dword ptr [ebp-8]
 00586B28    lea         edx,[ebp-4]
 00586B2B    call        MakeNode
 00586B30    mov         edx,dword ptr [ebp-4]
 00586B33    mov         eax,dword ptr [ebp+10]
 00586B36    mov         ecx,586B98
 00586B3B    call        @IntfCast
 00586B40    xor         eax,eax
 00586B42    pop         edx
 00586B43    pop         ecx
 00586B44    pop         ecx
 00586B45    mov         dword ptr fs:[eax],edx
 00586B48    pop         eax
 00586B49    xor         ebx,ebx
>00586B4B    jmp         00586B52
>00586B4D    jmp         @HandleAutoException
 00586B52    lea         eax,[ebp-14]
 00586B55    call        @IntfClear
 00586B5A    lea         eax,[ebp-10]
 00586B5D    call        @IntfClear
 00586B62    lea         eax,[ebp-0C]
 00586B65    mov         edx,dword ptr ds:[580B40];IXMLDOMAttribute
 00586B6B    mov         ecx,2
 00586B70    call        @FinalizeArray
 00586B75    lea         eax,[ebp-4]
 00586B78    call        @IntfClear
 00586B7D    mov         eax,ebx
 00586B7F    pop         edi
 00586B80    pop         esi
 00586B81    pop         ebx
 00586B82    mov         esp,ebp
 00586B84    pop         ebp
 00586B85    ret         0C
*}
end;

//00586BA8
function TMSDOMElement.setAttributeNodeNS(const newAttr:IDOMAttr):IDOMAttr; safecall;
begin
{*
 00586BA8    push        ebp
 00586BA9    mov         ebp,esp
 00586BAB    push        ebx
 00586BAC    push        esi
 00586BAD    push        edi
 00586BAE    mov         ebx,dword ptr [ebp+8]
 00586BB1    mov         eax,dword ptr [ebp+10]
 00586BB4    test        eax,eax
>00586BB6    je          00586BBC
 00586BB8    xor         edx,edx
 00586BBA    mov         dword ptr [eax],edx
 00586BBC    push        ebx
 00586BBD    xor         eax,eax
 00586BBF    push        ebp
 00586BC0    push        586BF0
 00586BC5    push        dword ptr fs:[eax]
 00586BC8    mov         dword ptr fs:[eax],esp
 00586BCB    mov         eax,dword ptr [ebp+10]
 00586BCE    call        @IntfClear
 00586BD3    push        eax
 00586BD4    mov         eax,dword ptr [ebp+0C]
 00586BD7    push        eax
 00586BD8    push        ebx
 00586BD9    call        TMSDOMElement.setAttributeNode
 00586BDE    call        @CheckAutoResult
 00586BE3    xor         eax,eax
 00586BE5    pop         edx
 00586BE6    pop         ecx
 00586BE7    pop         ecx
 00586BE8    mov         dword ptr fs:[eax],edx
 00586BEB    pop         eax
 00586BEC    xor         ebx,ebx
>00586BEE    jmp         00586BF5
>00586BF0    jmp         @HandleAutoException
 00586BF5    mov         eax,ebx
 00586BF7    pop         edi
 00586BF8    pop         esi
 00586BF9    pop         ebx
 00586BFA    pop         ebp
 00586BFB    ret         0C
*}
end;

//00586C00
procedure TMSDOMElement.setAttributeNS(const namespaceURI:DOMString; const qualifiedName:DOMString; const value:DOMString); safecall;
begin
{*
 00586C00    push        ebp
 00586C01    mov         ebp,esp
 00586C03    mov         ecx,7
 00586C08    push        0
 00586C0A    push        0
 00586C0C    dec         ecx
>00586C0D    jne         00586C08
 00586C0F    push        ecx
 00586C10    push        ebx
 00586C11    push        esi
 00586C12    push        edi
 00586C13    mov         ebx,dword ptr [ebp+8]
 00586C16    push        ebx
 00586C17    xor         eax,eax
 00586C19    push        ebp
 00586C1A    push        586CF9
 00586C1F    push        dword ptr fs:[eax]
 00586C22    mov         dword ptr fs:[eax],esp
 00586C25    lea         eax,[ebp-8]
 00586C28    call        @IntfClear
 00586C2D    push        eax
 00586C2E    lea         eax,[ebp-0C]
 00586C31    mov         edx,dword ptr [ebp+0C]
 00586C34    call        @WStrFromUStr
 00586C39    mov         eax,dword ptr [ebp-0C]
 00586C3C    push        eax
 00586C3D    lea         eax,[ebp-10]
 00586C40    mov         edx,dword ptr [ebp+10]
 00586C43    call        @WStrFromUStr
 00586C48    mov         eax,dword ptr [ebp-10]
 00586C4B    push        eax
 00586C4C    lea         eax,[ebp-20]
 00586C4F    mov         edx,2
 00586C54    mov         cl,1
 00586C56    call        @OleVarFromInt
 00586C5B    push        dword ptr [ebp-14]
 00586C5E    push        dword ptr [ebp-18]
 00586C61    push        dword ptr [ebp-1C]
 00586C64    push        dword ptr [ebp-20]
 00586C67    lea         eax,[ebp-24]
 00586C6A    call        @IntfClear
 00586C6F    push        eax
 00586C70    mov         eax,dword ptr [ebx+0C]
 00586C73    push        eax
 00586C74    mov         eax,dword ptr [eax]
 00586C76    call        dword ptr [eax+5C]
 00586C79    call        @CheckAutoResult
 00586C7E    mov         eax,dword ptr [ebp-24]
 00586C81    push        eax
 00586C82    mov         eax,dword ptr [eax]
 00586C84    call        dword ptr [eax+0E0]
 00586C8A    call        @CheckAutoResult
 00586C8F    mov         edx,dword ptr [ebp-8]
 00586C92    lea         eax,[ebp-4]
 00586C95    mov         ecx,586D50
 00586C9A    call        @IntfCast
 00586C9F    lea         eax,[ebp-34]
 00586CA2    mov         edx,dword ptr [ebp+14]
 00586CA5    call        @OleVarFromUStr
 00586CAA    push        dword ptr [ebp-28]
 00586CAD    push        dword ptr [ebp-2C]
 00586CB0    push        dword ptr [ebp-30]
 00586CB3    push        dword ptr [ebp-34]
 00586CB6    mov         eax,dword ptr [ebp-4]
 00586CB9    push        eax
 00586CBA    mov         eax,dword ptr [eax]
 00586CBC    call        dword ptr [eax+24]
 00586CBF    call        @CheckAutoResult
 00586CC4    lea         eax,[ebp-38]
 00586CC7    call        @IntfClear
 00586CCC    push        eax
 00586CCD    mov         eax,dword ptr [ebp-4]
 00586CD0    push        eax
 00586CD1    lea         edx,[ebp-3C]
 00586CD4    mov         eax,ebx
 00586CD6    call        TMSDOMElement.GetMSElement
 00586CDB    mov         eax,dword ptr [ebp-3C]
 00586CDE    push        eax
 00586CDF    mov         eax,dword ptr [eax]
 00586CE1    call        dword ptr [eax+0C0]
 00586CE7    call        @CheckAutoResult
 00586CEC    xor         eax,eax
 00586CEE    pop         edx
 00586CEF    pop         ecx
 00586CF0    pop         ecx
 00586CF1    mov         dword ptr fs:[eax],edx
 00586CF4    pop         eax
 00586CF5    xor         ebx,ebx
>00586CF7    jmp         00586CFE
>00586CF9    jmp         @HandleAutoException
 00586CFE    lea         eax,[ebp-3C]
 00586D01    call        @IntfClear
 00586D06    lea         eax,[ebp-38]
 00586D09    call        @IntfClear
 00586D0E    lea         eax,[ebp-34]
 00586D11    call        @VarClr
 00586D16    lea         eax,[ebp-24]
 00586D19    call        @IntfClear
 00586D1E    lea         eax,[ebp-20]
 00586D21    call        @VarClr
 00586D26    lea         eax,[ebp-10]
 00586D29    mov         edx,2
 00586D2E    call        @WStrArrayClr
 00586D33    lea         eax,[ebp-8]
 00586D36    call        @IntfClear
 00586D3B    lea         eax,[ebp-4]
 00586D3E    call        @IntfClear
 00586D43    mov         eax,ebx
 00586D45    pop         edi
 00586D46    pop         esi
 00586D47    pop         ebx
 00586D48    mov         esp,ebp
 00586D4A    pop         ebp
 00586D4B    ret         10
*}
end;

//00586D60
procedure TMSDOMElement.normalize; safecall;
begin
{*
 00586D60    push        ebp
 00586D61    mov         ebp,esp
 00586D63    push        0
 00586D65    push        ebx
 00586D66    push        esi
 00586D67    push        edi
 00586D68    mov         ebx,dword ptr [ebp+8]
 00586D6B    push        ebx
 00586D6C    xor         eax,eax
 00586D6E    push        ebp
 00586D6F    push        586DA2
 00586D74    push        dword ptr fs:[eax]
 00586D77    mov         dword ptr fs:[eax],esp
 00586D7A    lea         edx,[ebp-4]
 00586D7D    mov         eax,ebx
 00586D7F    call        TMSDOMElement.GetMSElement
 00586D84    mov         eax,dword ptr [ebp-4]
 00586D87    push        eax
 00586D88    mov         eax,dword ptr [eax]
 00586D8A    call        dword ptr [eax+0CC]
 00586D90    call        @CheckAutoResult
 00586D95    xor         eax,eax
 00586D97    pop         edx
 00586D98    pop         ecx
 00586D99    pop         ecx
 00586D9A    mov         dword ptr fs:[eax],edx
 00586D9D    pop         eax
 00586D9E    xor         ebx,ebx
>00586DA0    jmp         00586DA7
>00586DA2    jmp         @HandleAutoException
 00586DA7    lea         eax,[ebp-4]
 00586DAA    call        @IntfClear
 00586DAF    mov         eax,ebx
 00586DB1    pop         edi
 00586DB2    pop         esi
 00586DB3    pop         ebx
 00586DB4    pop         ecx
 00586DB5    pop         ebp
 00586DB6    ret         4
*}
end;

//00586DBC
function TMSDOMText.splitText(offset:Integer):IDOMText; safecall;
begin
{*
 00586DBC    push        ebp
 00586DBD    mov         ebp,esp
 00586DBF    push        0
 00586DC1    push        0
 00586DC3    push        0
 00586DC5    push        ebx
 00586DC6    push        esi
 00586DC7    push        edi
 00586DC8    mov         ebx,dword ptr [ebp+8]
 00586DCB    mov         eax,dword ptr [ebp+10]
 00586DCE    test        eax,eax
>00586DD0    je          00586DD6
 00586DD2    xor         edx,edx
 00586DD4    mov         dword ptr [eax],edx
 00586DD6    push        ebx
 00586DD7    xor         eax,eax
 00586DD9    push        ebp
 00586DDA    push        586E3B
 00586DDF    push        dword ptr fs:[eax]
 00586DE2    mov         dword ptr fs:[eax],esp
 00586DE5    lea         eax,[ebp-8]
 00586DE8    call        @IntfClear
 00586DED    push        eax
 00586DEE    mov         eax,dword ptr [ebp+0C]
 00586DF1    push        eax
 00586DF2    lea         eax,[ebp-0C]
 00586DF5    mov         edx,dword ptr [ebx+0C]
 00586DF8    mov         ecx,586E68
 00586DFD    call        @IntfCast
 00586E02    mov         eax,dword ptr [ebp-0C]
 00586E05    push        eax
 00586E06    mov         eax,dword ptr [eax]
 00586E08    call        dword ptr [eax+0CC]
 00586E0E    call        @CheckAutoResult
 00586E13    mov         eax,dword ptr [ebp-8]
 00586E16    lea         edx,[ebp-4]
 00586E19    call        MakeNode
 00586E1E    mov         edx,dword ptr [ebp-4]
 00586E21    mov         eax,dword ptr [ebp+10]
 00586E24    mov         ecx,586E78
 00586E29    call        @IntfCast
 00586E2E    xor         eax,eax
 00586E30    pop         edx
 00586E31    pop         ecx
 00586E32    pop         ecx
 00586E33    mov         dword ptr fs:[eax],edx
 00586E36    pop         eax
 00586E37    xor         ebx,ebx
>00586E39    jmp         00586E40
>00586E3B    jmp         @HandleAutoException
 00586E40    lea         eax,[ebp-0C]
 00586E43    mov         edx,dword ptr ds:[580BB4];IXMLDOMText
 00586E49    mov         ecx,2
 00586E4E    call        @FinalizeArray
 00586E53    lea         eax,[ebp-4]
 00586E56    call        @IntfClear
 00586E5B    mov         eax,ebx
 00586E5D    pop         edi
 00586E5E    pop         esi
 00586E5F    pop         ebx
 00586E60    mov         esp,ebp
 00586E62    pop         ebp
 00586E63    ret         0C
*}
end;

//00586E88
function TMSDOMDocumentType.GetMSDocumentType:IXMLDOMDocumentType;
begin
{*
 00586E88    push        ebx
 00586E89    push        esi
 00586E8A    mov         esi,edx
 00586E8C    mov         ebx,eax
 00586E8E    mov         eax,esi
 00586E90    mov         edx,dword ptr [ebx+0C]
 00586E93    mov         ecx,586EA0
 00586E98    call        @IntfCast
 00586E9D    pop         esi
 00586E9E    pop         ebx
 00586E9F    ret
*}
end;

//00586EB0
{*function sub_00586EB0(?:?; ?:?):?;
begin
 00586EB0    push        ebp
 00586EB1    mov         ebp,esp
 00586EB3    push        0
 00586EB5    push        0
 00586EB7    push        0
 00586EB9    push        ebx
 00586EBA    push        esi
 00586EBB    push        edi
 00586EBC    mov         ebx,dword ptr [ebp+8]
 00586EBF    mov         eax,dword ptr [ebp+0C]
 00586EC2    test        eax,eax
>00586EC4    je          00586ECA
 00586EC6    xor         edx,edx
 00586EC8    mov         dword ptr [eax],edx
 00586ECA    push        ebx
 00586ECB    xor         eax,eax
 00586ECD    push        ebp
 00586ECE    push        586F31
 00586ED3    push        dword ptr fs:[eax]
 00586ED6    mov         dword ptr fs:[eax],esp
 00586ED9    cmp         dword ptr [ebx+28],0
>00586EDD    jne         00586F19
 00586EDF    lea         eax,[ebp-8]
 00586EE2    call        @IntfClear
 00586EE7    push        eax
 00586EE8    lea         edx,[ebp-0C]
 00586EEB    mov         eax,ebx
 00586EED    call        TMSDOMDocumentType.GetMSDocumentType
 00586EF2    mov         eax,dword ptr [ebp-0C]
 00586EF5    push        eax
 00586EF6    mov         eax,dword ptr [eax]
 00586EF8    call        dword ptr [eax+0B0]
 00586EFE    call        @CheckAutoResult
 00586F03    mov         eax,dword ptr [ebp-8]
 00586F06    lea         edx,[ebp-4]
 00586F09    call        MakeNodeList
 00586F0E    mov         edx,dword ptr [ebp-4]
 00586F11    lea         eax,[ebx+28]
 00586F14    call        @IntfCopy
 00586F19    mov         eax,dword ptr [ebp+0C]
 00586F1C    mov         edx,dword ptr [ebx+28]
 00586F1F    call        @IntfCopy
 00586F24    xor         eax,eax
 00586F26    pop         edx
 00586F27    pop         ecx
 00586F28    pop         ecx
 00586F29    mov         dword ptr fs:[eax],edx
 00586F2C    pop         eax
 00586F2D    xor         ebx,ebx
>00586F2F    jmp         00586F36
>00586F31    jmp         @HandleAutoException
 00586F36    lea         eax,[ebp-0C]
 00586F39    call        @IntfClear
 00586F3E    lea         eax,[ebp-8]
 00586F41    call        @IntfClear
 00586F46    lea         eax,[ebp-4]
 00586F49    call        @IntfClear
 00586F4E    mov         eax,ebx
 00586F50    pop         edi
 00586F51    pop         esi
 00586F52    pop         ebx
 00586F53    mov         esp,ebp
 00586F55    pop         ebp
 00586F56    ret         8
end;*}

//00586F5C
function TMSDOMDocumentType.get_internalSubset:DOMString; safecall;
begin
{*
 00586F5C    push        ebp
 00586F5D    mov         ebp,esp
 00586F5F    push        ebx
 00586F60    push        esi
 00586F61    push        edi
 00586F62    mov         eax,dword ptr [ebp+0C]
 00586F65    test        eax,eax
>00586F67    je          00586F6D
 00586F69    xor         edx,edx
 00586F6B    mov         dword ptr [eax],edx
 00586F6D    push        dword ptr [ebp+8]
 00586F70    xor         eax,eax
 00586F72    push        ebp
 00586F73    push        586F9A
 00586F78    push        dword ptr fs:[eax]
 00586F7B    mov         dword ptr fs:[eax],esp
 00586F7E    mov         edx,586FB4;'MSXML'
 00586F83    mov         eax,586FCC;'get_internalSubset'
 00586F88    call        DOMVendorNotSupported
 00586F8D    xor         eax,eax
 00586F8F    pop         edx
 00586F90    pop         ecx
 00586F91    pop         ecx
 00586F92    mov         dword ptr fs:[eax],edx
 00586F95    pop         eax
 00586F96    xor         ebx,ebx
>00586F98    jmp         00586F9F
>00586F9A    jmp         @HandleAutoException
 00586F9F    mov         eax,ebx
 00586FA1    pop         edi
 00586FA2    pop         esi
 00586FA3    pop         ebx
 00586FA4    pop         ebp
 00586FA5    ret         8
*}
end;

//00586FF4
function TMSDOMDocumentType.get_name:DOMString; safecall;
begin
{*
 00586FF4    push        ebp
 00586FF5    mov         ebp,esp
 00586FF7    push        0
 00586FF9    push        0
 00586FFB    push        ebx
 00586FFC    push        esi
 00586FFD    push        edi
 00586FFE    mov         ebx,dword ptr [ebp+8]
 00587001    mov         eax,dword ptr [ebp+0C]
 00587004    test        eax,eax
>00587006    je          0058700C
 00587008    xor         edx,edx
 0058700A    mov         dword ptr [eax],edx
 0058700C    push        ebx
 0058700D    xor         eax,eax
 0058700F    push        ebp
 00587010    push        587057
 00587015    push        dword ptr fs:[eax]
 00587018    mov         dword ptr fs:[eax],esp
 0058701B    lea         eax,[ebp-4]
 0058701E    call        @WStrClr
 00587023    push        eax
 00587024    lea         edx,[ebp-8]
 00587027    mov         eax,ebx
 00587029    call        TMSDOMDocumentType.GetMSDocumentType
 0058702E    mov         eax,dword ptr [ebp-8]
 00587031    push        eax
 00587032    mov         eax,dword ptr [eax]
 00587034    call        dword ptr [eax+0AC]
 0058703A    call        @CheckAutoResult
 0058703F    mov         edx,dword ptr [ebp-4]
 00587042    mov         eax,dword ptr [ebp+0C]
 00587045    call        @UStrFromWStr
 0058704A    xor         eax,eax
 0058704C    pop         edx
 0058704D    pop         ecx
 0058704E    pop         ecx
 0058704F    mov         dword ptr fs:[eax],edx
 00587052    pop         eax
 00587053    xor         ebx,ebx
>00587055    jmp         0058705C
>00587057    jmp         @HandleAutoException
 0058705C    lea         eax,[ebp-8]
 0058705F    call        @IntfClear
 00587064    lea         eax,[ebp-4]
 00587067    call        @WStrClr
 0058706C    mov         eax,ebx
 0058706E    pop         edi
 0058706F    pop         esi
 00587070    pop         ebx
 00587071    pop         ecx
 00587072    pop         ecx
 00587073    pop         ebp
 00587074    ret         8
*}
end;

//00587078
{*function sub_00587078(?:?; ?:?):?;
begin
 00587078    push        ebp
 00587079    mov         ebp,esp
 0058707B    push        0
 0058707D    push        0
 0058707F    push        0
 00587081    push        ebx
 00587082    push        esi
 00587083    push        edi
 00587084    mov         ebx,dword ptr [ebp+8]
 00587087    mov         eax,dword ptr [ebp+0C]
 0058708A    test        eax,eax
>0058708C    je          00587092
 0058708E    xor         edx,edx
 00587090    mov         dword ptr [eax],edx
 00587092    push        ebx
 00587093    xor         eax,eax
 00587095    push        ebp
 00587096    push        5870F9
 0058709B    push        dword ptr fs:[eax]
 0058709E    mov         dword ptr fs:[eax],esp
 005870A1    cmp         dword ptr [ebx+2C],0
>005870A5    jne         005870E1
 005870A7    lea         eax,[ebp-8]
 005870AA    call        @IntfClear
 005870AF    push        eax
 005870B0    lea         edx,[ebp-0C]
 005870B3    mov         eax,ebx
 005870B5    call        TMSDOMDocumentType.GetMSDocumentType
 005870BA    mov         eax,dword ptr [ebp-0C]
 005870BD    push        eax
 005870BE    mov         eax,dword ptr [eax]
 005870C0    call        dword ptr [eax+0B4]
 005870C6    call        @CheckAutoResult
 005870CB    mov         eax,dword ptr [ebp-8]
 005870CE    lea         edx,[ebp-4]
 005870D1    call        MakeNodeList
 005870D6    mov         edx,dword ptr [ebp-4]
 005870D9    lea         eax,[ebx+2C]
 005870DC    call        @IntfCopy
 005870E1    mov         eax,dword ptr [ebp+0C]
 005870E4    mov         edx,dword ptr [ebx+2C]
 005870E7    call        @IntfCopy
 005870EC    xor         eax,eax
 005870EE    pop         edx
 005870EF    pop         ecx
 005870F0    pop         ecx
 005870F1    mov         dword ptr fs:[eax],edx
 005870F4    pop         eax
 005870F5    xor         ebx,ebx
>005870F7    jmp         005870FE
>005870F9    jmp         @HandleAutoException
 005870FE    lea         eax,[ebp-0C]
 00587101    call        @IntfClear
 00587106    lea         eax,[ebp-8]
 00587109    call        @IntfClear
 0058710E    lea         eax,[ebp-4]
 00587111    call        @IntfClear
 00587116    mov         eax,ebx
 00587118    pop         edi
 00587119    pop         esi
 0058711A    pop         ebx
 0058711B    mov         esp,ebp
 0058711D    pop         ebp
 0058711E    ret         8
end;*}

//00587124
function TMSDOMDocumentType.get_publicId:DOMString; safecall;
begin
{*
 00587124    push        ebp
 00587125    mov         ebp,esp
 00587127    push        ebx
 00587128    push        esi
 00587129    push        edi
 0058712A    mov         eax,dword ptr [ebp+0C]
 0058712D    test        eax,eax
>0058712F    je          00587135
 00587131    xor         edx,edx
 00587133    mov         dword ptr [eax],edx
 00587135    push        dword ptr [ebp+8]
 00587138    xor         eax,eax
 0058713A    push        ebp
 0058713B    push        587162
 00587140    push        dword ptr fs:[eax]
 00587143    mov         dword ptr fs:[eax],esp
 00587146    mov         edx,58717C;'MSXML'
 0058714B    mov         eax,587194;'get_publicId'
 00587150    call        DOMVendorNotSupported
 00587155    xor         eax,eax
 00587157    pop         edx
 00587158    pop         ecx
 00587159    pop         ecx
 0058715A    mov         dword ptr fs:[eax],edx
 0058715D    pop         eax
 0058715E    xor         ebx,ebx
>00587160    jmp         00587167
>00587162    jmp         @HandleAutoException
 00587167    mov         eax,ebx
 00587169    pop         edi
 0058716A    pop         esi
 0058716B    pop         ebx
 0058716C    pop         ebp
 0058716D    ret         8
*}
end;

//005871B0
function TMSDOMDocumentType.get_systemId:DOMString; safecall;
begin
{*
 005871B0    push        ebp
 005871B1    mov         ebp,esp
 005871B3    push        ebx
 005871B4    push        esi
 005871B5    push        edi
 005871B6    mov         eax,dword ptr [ebp+0C]
 005871B9    test        eax,eax
>005871BB    je          005871C1
 005871BD    xor         edx,edx
 005871BF    mov         dword ptr [eax],edx
 005871C1    push        dword ptr [ebp+8]
 005871C4    xor         eax,eax
 005871C6    push        ebp
 005871C7    push        5871EE
 005871CC    push        dword ptr fs:[eax]
 005871CF    mov         dword ptr fs:[eax],esp
 005871D2    mov         edx,587208;'MSXML'
 005871D7    mov         eax,587220;'get_systemId'
 005871DC    call        DOMVendorNotSupported
 005871E1    xor         eax,eax
 005871E3    pop         edx
 005871E4    pop         ecx
 005871E5    pop         ecx
 005871E6    mov         dword ptr fs:[eax],edx
 005871E9    pop         eax
 005871EA    xor         ebx,ebx
>005871EC    jmp         005871F3
>005871EE    jmp         @HandleAutoException
 005871F3    mov         eax,ebx
 005871F5    pop         edi
 005871F6    pop         esi
 005871F7    pop         ebx
 005871F8    pop         ebp
 005871F9    ret         8
*}
end;

//0058723C
function TMSDOMNotation.GetMSNotation:IXMLDOMNotation;
begin
{*
 0058723C    push        ebx
 0058723D    push        esi
 0058723E    mov         esi,edx
 00587240    mov         ebx,eax
 00587242    mov         eax,esi
 00587244    mov         edx,dword ptr [ebx+0C]
 00587247    mov         ecx,587254
 0058724C    call        @IntfCast
 00587251    pop         esi
 00587252    pop         ebx
 00587253    ret
*}
end;

//00587264
function TMSDOMNotation.get_publicId:DOMString; safecall;
begin
{*
 00587264    push        ebp
 00587265    mov         ebp,esp
 00587267    xor         ecx,ecx
 00587269    push        ecx
 0058726A    push        ecx
 0058726B    push        ecx
 0058726C    push        ecx
 0058726D    push        ecx
 0058726E    push        ebx
 0058726F    push        esi
 00587270    push        edi
 00587271    mov         ebx,dword ptr [ebp+8]
 00587274    mov         eax,dword ptr [ebp+0C]
 00587277    test        eax,eax
>00587279    je          0058727F
 0058727B    xor         edx,edx
 0058727D    mov         dword ptr [eax],edx
 0058727F    push        ebx
 00587280    xor         eax,eax
 00587282    push        ebp
 00587283    push        5872CA
 00587288    push        dword ptr fs:[eax]
 0058728B    mov         dword ptr fs:[eax],esp
 0058728E    lea         eax,[ebp-10]
 00587291    call        @VarClr
 00587296    push        eax
 00587297    lea         edx,[ebp-14]
 0058729A    mov         eax,ebx
 0058729C    call        TMSDOMNotation.GetMSNotation
 005872A1    mov         eax,dword ptr [ebp-14]
 005872A4    push        eax
 005872A5    mov         eax,dword ptr [eax]
 005872A7    call        dword ptr [eax+0AC]
 005872AD    call        @CheckAutoResult
 005872B2    lea         edx,[ebp-10]
 005872B5    mov         eax,dword ptr [ebp+0C]
 005872B8    call        @VarToUStr
 005872BD    xor         eax,eax
 005872BF    pop         edx
 005872C0    pop         ecx
 005872C1    pop         ecx
 005872C2    mov         dword ptr fs:[eax],edx
 005872C5    pop         eax
 005872C6    xor         ebx,ebx
>005872C8    jmp         005872CF
>005872CA    jmp         @HandleAutoException
 005872CF    lea         eax,[ebp-14]
 005872D2    call        @IntfClear
 005872D7    lea         eax,[ebp-10]
 005872DA    call        @VarClr
 005872DF    mov         eax,ebx
 005872E1    pop         edi
 005872E2    pop         esi
 005872E3    pop         ebx
 005872E4    mov         esp,ebp
 005872E6    pop         ebp
 005872E7    ret         8
*}
end;

//005872EC
function TMSDOMNotation.get_systemId:DOMString; safecall;
begin
{*
 005872EC    push        ebp
 005872ED    mov         ebp,esp
 005872EF    xor         ecx,ecx
 005872F1    push        ecx
 005872F2    push        ecx
 005872F3    push        ecx
 005872F4    push        ecx
 005872F5    push        ecx
 005872F6    push        ebx
 005872F7    push        esi
 005872F8    push        edi
 005872F9    mov         ebx,dword ptr [ebp+8]
 005872FC    mov         eax,dword ptr [ebp+0C]
 005872FF    test        eax,eax
>00587301    je          00587307
 00587303    xor         edx,edx
 00587305    mov         dword ptr [eax],edx
 00587307    push        ebx
 00587308    xor         eax,eax
 0058730A    push        ebp
 0058730B    push        587352
 00587310    push        dword ptr fs:[eax]
 00587313    mov         dword ptr fs:[eax],esp
 00587316    lea         eax,[ebp-10]
 00587319    call        @VarClr
 0058731E    push        eax
 0058731F    lea         edx,[ebp-14]
 00587322    mov         eax,ebx
 00587324    call        TMSDOMNotation.GetMSNotation
 00587329    mov         eax,dword ptr [ebp-14]
 0058732C    push        eax
 0058732D    mov         eax,dword ptr [eax]
 0058732F    call        dword ptr [eax+0B0]
 00587335    call        @CheckAutoResult
 0058733A    lea         edx,[ebp-10]
 0058733D    mov         eax,dword ptr [ebp+0C]
 00587340    call        @VarToUStr
 00587345    xor         eax,eax
 00587347    pop         edx
 00587348    pop         ecx
 00587349    pop         ecx
 0058734A    mov         dword ptr fs:[eax],edx
 0058734D    pop         eax
 0058734E    xor         ebx,ebx
>00587350    jmp         00587357
>00587352    jmp         @HandleAutoException
 00587357    lea         eax,[ebp-14]
 0058735A    call        @IntfClear
 0058735F    lea         eax,[ebp-10]
 00587362    call        @VarClr
 00587367    mov         eax,ebx
 00587369    pop         edi
 0058736A    pop         esi
 0058736B    pop         ebx
 0058736C    mov         esp,ebp
 0058736E    pop         ebp
 0058736F    ret         8
*}
end;

//00587374
function TMSDOMEntity.GetMSEntity:IXMLDOMEntity;
begin
{*
 00587374    push        ebx
 00587375    push        esi
 00587376    mov         esi,edx
 00587378    mov         ebx,eax
 0058737A    mov         eax,esi
 0058737C    mov         edx,dword ptr [ebx+0C]
 0058737F    mov         ecx,58738C
 00587384    call        @IntfCast
 00587389    pop         esi
 0058738A    pop         ebx
 0058738B    ret
*}
end;

//0058739C
function TMSDOMEntity.get_notationName:DOMString; safecall;
begin
{*
 0058739C    push        ebp
 0058739D    mov         ebp,esp
 0058739F    push        0
 005873A1    push        0
 005873A3    push        ebx
 005873A4    push        esi
 005873A5    push        edi
 005873A6    mov         ebx,dword ptr [ebp+8]
 005873A9    mov         eax,dword ptr [ebp+0C]
 005873AC    test        eax,eax
>005873AE    je          005873B4
 005873B0    xor         edx,edx
 005873B2    mov         dword ptr [eax],edx
 005873B4    push        ebx
 005873B5    xor         eax,eax
 005873B7    push        ebp
 005873B8    push        5873FF
 005873BD    push        dword ptr fs:[eax]
 005873C0    mov         dword ptr fs:[eax],esp
 005873C3    lea         eax,[ebp-4]
 005873C6    call        @WStrClr
 005873CB    push        eax
 005873CC    lea         edx,[ebp-8]
 005873CF    mov         eax,ebx
 005873D1    call        TMSDOMEntity.GetMSEntity
 005873D6    mov         eax,dword ptr [ebp-8]
 005873D9    push        eax
 005873DA    mov         eax,dword ptr [eax]
 005873DC    call        dword ptr [eax+0B4]
 005873E2    call        @CheckAutoResult
 005873E7    mov         edx,dword ptr [ebp-4]
 005873EA    mov         eax,dword ptr [ebp+0C]
 005873ED    call        @UStrFromWStr
 005873F2    xor         eax,eax
 005873F4    pop         edx
 005873F5    pop         ecx
 005873F6    pop         ecx
 005873F7    mov         dword ptr fs:[eax],edx
 005873FA    pop         eax
 005873FB    xor         ebx,ebx
>005873FD    jmp         00587404
>005873FF    jmp         @HandleAutoException
 00587404    lea         eax,[ebp-8]
 00587407    call        @IntfClear
 0058740C    lea         eax,[ebp-4]
 0058740F    call        @WStrClr
 00587414    mov         eax,ebx
 00587416    pop         edi
 00587417    pop         esi
 00587418    pop         ebx
 00587419    pop         ecx
 0058741A    pop         ecx
 0058741B    pop         ebp
 0058741C    ret         8
*}
end;

//00587420
function TMSDOMEntity.get_publicId:DOMString; safecall;
begin
{*
 00587420    push        ebp
 00587421    mov         ebp,esp
 00587423    xor         ecx,ecx
 00587425    push        ecx
 00587426    push        ecx
 00587427    push        ecx
 00587428    push        ecx
 00587429    push        ecx
 0058742A    push        ebx
 0058742B    push        esi
 0058742C    push        edi
 0058742D    mov         ebx,dword ptr [ebp+8]
 00587430    mov         eax,dword ptr [ebp+0C]
 00587433    test        eax,eax
>00587435    je          0058743B
 00587437    xor         edx,edx
 00587439    mov         dword ptr [eax],edx
 0058743B    push        ebx
 0058743C    xor         eax,eax
 0058743E    push        ebp
 0058743F    push        587486
 00587444    push        dword ptr fs:[eax]
 00587447    mov         dword ptr fs:[eax],esp
 0058744A    lea         eax,[ebp-10]
 0058744D    call        @VarClr
 00587452    push        eax
 00587453    lea         edx,[ebp-14]
 00587456    mov         eax,ebx
 00587458    call        TMSDOMEntity.GetMSEntity
 0058745D    mov         eax,dword ptr [ebp-14]
 00587460    push        eax
 00587461    mov         eax,dword ptr [eax]
 00587463    call        dword ptr [eax+0AC]
 00587469    call        @CheckAutoResult
 0058746E    lea         edx,[ebp-10]
 00587471    mov         eax,dword ptr [ebp+0C]
 00587474    call        @VarToUStr
 00587479    xor         eax,eax
 0058747B    pop         edx
 0058747C    pop         ecx
 0058747D    pop         ecx
 0058747E    mov         dword ptr fs:[eax],edx
 00587481    pop         eax
 00587482    xor         ebx,ebx
>00587484    jmp         0058748B
>00587486    jmp         @HandleAutoException
 0058748B    lea         eax,[ebp-14]
 0058748E    call        @IntfClear
 00587493    lea         eax,[ebp-10]
 00587496    call        @VarClr
 0058749B    mov         eax,ebx
 0058749D    pop         edi
 0058749E    pop         esi
 0058749F    pop         ebx
 005874A0    mov         esp,ebp
 005874A2    pop         ebp
 005874A3    ret         8
*}
end;

//005874A8
function TMSDOMEntity.get_systemId:DOMString; safecall;
begin
{*
 005874A8    push        ebp
 005874A9    mov         ebp,esp
 005874AB    xor         ecx,ecx
 005874AD    push        ecx
 005874AE    push        ecx
 005874AF    push        ecx
 005874B0    push        ecx
 005874B1    push        ecx
 005874B2    push        ebx
 005874B3    push        esi
 005874B4    push        edi
 005874B5    mov         ebx,dword ptr [ebp+8]
 005874B8    mov         eax,dword ptr [ebp+0C]
 005874BB    test        eax,eax
>005874BD    je          005874C3
 005874BF    xor         edx,edx
 005874C1    mov         dword ptr [eax],edx
 005874C3    push        ebx
 005874C4    xor         eax,eax
 005874C6    push        ebp
 005874C7    push        58750E
 005874CC    push        dword ptr fs:[eax]
 005874CF    mov         dword ptr fs:[eax],esp
 005874D2    lea         eax,[ebp-10]
 005874D5    call        @VarClr
 005874DA    push        eax
 005874DB    lea         edx,[ebp-14]
 005874DE    mov         eax,ebx
 005874E0    call        TMSDOMEntity.GetMSEntity
 005874E5    mov         eax,dword ptr [ebp-14]
 005874E8    push        eax
 005874E9    mov         eax,dword ptr [eax]
 005874EB    call        dword ptr [eax+0B0]
 005874F1    call        @CheckAutoResult
 005874F6    lea         edx,[ebp-10]
 005874F9    mov         eax,dword ptr [ebp+0C]
 005874FC    call        @VarToUStr
 00587501    xor         eax,eax
 00587503    pop         edx
 00587504    pop         ecx
 00587505    pop         ecx
 00587506    mov         dword ptr fs:[eax],edx
 00587509    pop         eax
 0058750A    xor         ebx,ebx
>0058750C    jmp         00587513
>0058750E    jmp         @HandleAutoException
 00587513    lea         eax,[ebp-14]
 00587516    call        @IntfClear
 0058751B    lea         eax,[ebp-10]
 0058751E    call        @VarClr
 00587523    mov         eax,ebx
 00587525    pop         edi
 00587526    pop         esi
 00587527    pop         ebx
 00587528    mov         esp,ebp
 0058752A    pop         ebp
 0058752B    ret         8
*}
end;

//00587530
function TMSDOMProcessingInstruction.GetMSProcessingInstruction:IXMLDOMProcessingInstruction;
begin
{*
 00587530    push        ebx
 00587531    push        esi
 00587532    mov         esi,edx
 00587534    mov         ebx,eax
 00587536    mov         eax,esi
 00587538    mov         edx,dword ptr [ebx+0C]
 0058753B    mov         ecx,587548
 00587540    call        @IntfCast
 00587545    pop         esi
 00587546    pop         ebx
 00587547    ret
*}
end;

//00587558
function TMSDOMProcessingInstruction.get_data:DOMString; safecall;
begin
{*
 00587558    push        ebp
 00587559    mov         ebp,esp
 0058755B    push        0
 0058755D    push        0
 0058755F    push        ebx
 00587560    push        esi
 00587561    push        edi
 00587562    mov         ebx,dword ptr [ebp+8]
 00587565    mov         eax,dword ptr [ebp+0C]
 00587568    test        eax,eax
>0058756A    je          00587570
 0058756C    xor         edx,edx
 0058756E    mov         dword ptr [eax],edx
 00587570    push        ebx
 00587571    xor         eax,eax
 00587573    push        ebp
 00587574    push        5875BB
 00587579    push        dword ptr fs:[eax]
 0058757C    mov         dword ptr fs:[eax],esp
 0058757F    lea         eax,[ebp-4]
 00587582    call        @WStrClr
 00587587    push        eax
 00587588    lea         edx,[ebp-8]
 0058758B    mov         eax,ebx
 0058758D    call        TMSDOMProcessingInstruction.GetMSProcessingInstruction
 00587592    mov         eax,dword ptr [ebp-8]
 00587595    push        eax
 00587596    mov         eax,dword ptr [eax]
 00587598    call        dword ptr [eax+0B0]
 0058759E    call        @CheckAutoResult
 005875A3    mov         edx,dword ptr [ebp-4]
 005875A6    mov         eax,dword ptr [ebp+0C]
 005875A9    call        @UStrFromWStr
 005875AE    xor         eax,eax
 005875B0    pop         edx
 005875B1    pop         ecx
 005875B2    pop         ecx
 005875B3    mov         dword ptr fs:[eax],edx
 005875B6    pop         eax
 005875B7    xor         ebx,ebx
>005875B9    jmp         005875C0
>005875BB    jmp         @HandleAutoException
 005875C0    lea         eax,[ebp-8]
 005875C3    call        @IntfClear
 005875C8    lea         eax,[ebp-4]
 005875CB    call        @WStrClr
 005875D0    mov         eax,ebx
 005875D2    pop         edi
 005875D3    pop         esi
 005875D4    pop         ebx
 005875D5    pop         ecx
 005875D6    pop         ecx
 005875D7    pop         ebp
 005875D8    ret         8
*}
end;

//005875DC
function TMSDOMProcessingInstruction.get_target:DOMString; safecall;
begin
{*
 005875DC    push        ebp
 005875DD    mov         ebp,esp
 005875DF    push        0
 005875E1    push        0
 005875E3    push        ebx
 005875E4    push        esi
 005875E5    push        edi
 005875E6    mov         ebx,dword ptr [ebp+8]
 005875E9    mov         eax,dword ptr [ebp+0C]
 005875EC    test        eax,eax
>005875EE    je          005875F4
 005875F0    xor         edx,edx
 005875F2    mov         dword ptr [eax],edx
 005875F4    push        ebx
 005875F5    xor         eax,eax
 005875F7    push        ebp
 005875F8    push        58763F
 005875FD    push        dword ptr fs:[eax]
 00587600    mov         dword ptr fs:[eax],esp
 00587603    lea         eax,[ebp-4]
 00587606    call        @WStrClr
 0058760B    push        eax
 0058760C    lea         edx,[ebp-8]
 0058760F    mov         eax,ebx
 00587611    call        TMSDOMProcessingInstruction.GetMSProcessingInstruction
 00587616    mov         eax,dword ptr [ebp-8]
 00587619    push        eax
 0058761A    mov         eax,dword ptr [eax]
 0058761C    call        dword ptr [eax+0AC]
 00587622    call        @CheckAutoResult
 00587627    mov         edx,dword ptr [ebp-4]
 0058762A    mov         eax,dword ptr [ebp+0C]
 0058762D    call        @UStrFromWStr
 00587632    xor         eax,eax
 00587634    pop         edx
 00587635    pop         ecx
 00587636    pop         ecx
 00587637    mov         dword ptr fs:[eax],edx
 0058763A    pop         eax
 0058763B    xor         ebx,ebx
>0058763D    jmp         00587644
>0058763F    jmp         @HandleAutoException
 00587644    lea         eax,[ebp-8]
 00587647    call        @IntfClear
 0058764C    lea         eax,[ebp-4]
 0058764F    call        @WStrClr
 00587654    mov         eax,ebx
 00587656    pop         edi
 00587657    pop         esi
 00587658    pop         ebx
 00587659    pop         ecx
 0058765A    pop         ecx
 0058765B    pop         ebp
 0058765C    ret         8
*}
end;

//00587660
procedure TMSDOMProcessingInstruction.set_data(const value:DOMString); safecall;
begin
{*
 00587660    push        ebp
 00587661    mov         ebp,esp
 00587663    push        0
 00587665    push        0
 00587667    push        ebx
 00587668    push        esi
 00587669    push        edi
 0058766A    mov         ebx,dword ptr [ebp+8]
 0058766D    push        ebx
 0058766E    xor         eax,eax
 00587670    push        ebp
 00587671    push        5876B3
 00587676    push        dword ptr fs:[eax]
 00587679    mov         dword ptr fs:[eax],esp
 0058767C    lea         eax,[ebp-4]
 0058767F    mov         edx,dword ptr [ebp+0C]
 00587682    call        @WStrFromUStr
 00587687    mov         eax,dword ptr [ebp-4]
 0058768A    push        eax
 0058768B    lea         edx,[ebp-8]
 0058768E    mov         eax,ebx
 00587690    call        TMSDOMProcessingInstruction.GetMSProcessingInstruction
 00587695    mov         eax,dword ptr [ebp-8]
 00587698    push        eax
 00587699    mov         eax,dword ptr [eax]
 0058769B    call        dword ptr [eax+0B4]
 005876A1    call        @CheckAutoResult
 005876A6    xor         eax,eax
 005876A8    pop         edx
 005876A9    pop         ecx
 005876AA    pop         ecx
 005876AB    mov         dword ptr fs:[eax],edx
 005876AE    pop         eax
 005876AF    xor         ebx,ebx
>005876B1    jmp         005876B8
>005876B3    jmp         @HandleAutoException
 005876B8    lea         eax,[ebp-8]
 005876BB    call        @IntfClear
 005876C0    lea         eax,[ebp-4]
 005876C3    call        @WStrClr
 005876C8    mov         eax,ebx
 005876CA    pop         edi
 005876CB    pop         esi
 005876CC    pop         ebx
 005876CD    pop         ecx
 005876CE    pop         ecx
 005876CF    pop         ebp
 005876D0    ret         8
*}
end;

//005876D4
constructor TMSDOMEventHandler.Create(Sender:TObject; AsyncEventHandler:TAsyncEventHandler);
begin
{*
 005876D4    push        ebp
 005876D5    mov         ebp,esp
 005876D7    test        dl,dl
>005876D9    je          005876E3
 005876DB    add         esp,0FFFFFFF0
 005876DE    call        @ClassCreate
 005876E3    mov         dword ptr [eax+10],ecx
 005876E6    mov         ecx,dword ptr [ebp+0C]
 005876E9    mov         dword ptr [eax+18],ecx
 005876EC    mov         ecx,dword ptr [ebp+10]
 005876EF    mov         dword ptr [eax+1C],ecx
 005876F2    mov         ecx,dword ptr [ebp+8]
 005876F5    mov         dword ptr [eax+0C],ecx
 005876F8    test        dl,dl
>005876FA    je          0058770B
 005876FC    call        @AfterConstruction
 00587701    pop         dword ptr fs:[0]
 00587708    add         esp,0C
 0058770B    pop         ebp
 0058770C    ret         0C
*}
end;

//00587710
function TMSDOMEventHandler.GetIDsOfNames(const IID:TGUID; Names:Pointer; NameCount:Integer; LocaleID:Integer; DispIDs:Pointer):HRESULT; stdcall;
begin
{*
 00587710    push        ebp
 00587711    mov         ebp,esp
 00587713    mov         eax,80004001
 00587718    pop         ebp
 00587719    ret         18
*}
end;

//0058771C
function TMSDOMEventHandler.GetTypeInfo(Index:Integer; LocaleID:Integer; var TypeInfo:void ):HRESULT; stdcall;
begin
{*
 0058771C    push        ebp
 0058771D    mov         ebp,esp
 0058771F    mov         eax,80004001
 00587724    pop         ebp
 00587725    ret         10
*}
end;

//00587728
function TMSDOMEventHandler.GetTypeInfoCount(var Count:Integer):HRESULT; stdcall;
begin
{*
 00587728    push        ebp
 00587729    mov         ebp,esp
 0058772B    mov         eax,80004001
 00587730    pop         ebp
 00587731    ret         8
*}
end;

//00587734
function TMSDOMEventHandler.Invoke(DispID:Integer; const IID:TGUID; LocaleID:Integer; Flags:Word; var Params:void ; VarResult:Pointer; ExcepInfo:Pointer; ArgErr:Pointer):HRESULT; stdcall;
begin
{*
 00587734    push        ebp
 00587735    mov         ebp,esp
 00587737    push        ecx
 00587738    push        ebx
 00587739    push        esi
 0058773A    push        edi
 0058773B    mov         ebx,dword ptr [ebp+8]
 0058773E    xor         eax,eax
 00587740    push        ebp
 00587741    push        587774
 00587746    push        dword ptr fs:[eax]
 00587749    mov         dword ptr fs:[eax],esp
 0058774C    lea         eax,[ebp-4]
 0058774F    push        eax
 00587750    mov         eax,dword ptr [ebx+10]
 00587753    push        eax
 00587754    call        TMSDOMDocument.asyncLoadState
 00587759    call        @CheckAutoResult
 0058775E    mov         ecx,dword ptr [ebp-4]
 00587761    mov         edx,dword ptr [ebx+0C]
 00587764    mov         eax,dword ptr [ebx+1C]
 00587767    call        dword ptr [ebx+18]
 0058776A    xor         eax,eax
 0058776C    pop         edx
 0058776D    pop         ecx
 0058776E    pop         ecx
 0058776F    mov         dword ptr fs:[eax],edx
>00587772    jmp         0058777E
>00587774    jmp         @HandleAnyException
 00587779    call        @DoneExcept
 0058777E    xor         eax,eax
 00587780    pop         edi
 00587781    pop         esi
 00587782    pop         ebx
 00587783    pop         ecx
 00587784    pop         ebp
 00587785    ret         24
*}
end;

//00587788
function TMSDOMDocument.GetMSDocument:IXMLDOMDocument;
begin
{*
 00587788    push        ebp
 00587789    mov         ebp,esp
 0058778B    xor         ecx,ecx
 0058778D    push        ecx
 0058778E    push        ecx
 0058778F    push        ecx
 00587790    push        ecx
 00587791    push        ecx
 00587792    push        ebx
 00587793    push        esi
 00587794    push        edi
 00587795    mov         esi,edx
 00587797    mov         ebx,eax
 00587799    xor         eax,eax
 0058779B    push        ebp
 0058779C    push        58784D
 005877A1    push        dword ptr fs:[eax]
 005877A4    mov         dword ptr fs:[eax],esp
 005877A7    mov         eax,esi
 005877A9    mov         edx,dword ptr [ebx+0C]
 005877AC    mov         ecx,58785C
 005877B1    call        @IntfCast
 005877B6    cmp         byte ptr ds:[7899CC],0
>005877BD    jne         0058782F
 005877BF    xor         edx,edx
 005877C1    push        ebp
 005877C2    push        587812
 005877C7    push        dword ptr fs:[edx]
 005877CA    mov         dword ptr fs:[edx],esp
 005877CD    lea         eax,[ebp-10]
 005877D0    xor         edx,edx
 005877D2    call        @VarFromBool
 005877D7    push        dword ptr [ebp-4]
 005877DA    push        dword ptr [ebp-8]
 005877DD    push        dword ptr [ebp-0C]
 005877E0    push        dword ptr [ebp-10]
 005877E3    push        587870
 005877E8    lea         eax,[ebp-14]
 005877EB    mov         edx,dword ptr [esi]
 005877ED    mov         ecx,587888
 005877F2    call        @IntfCast
 005877F7    mov         eax,dword ptr [ebp-14]
 005877FA    push        eax
 005877FB    mov         eax,dword ptr [eax]
 005877FD    call        dword ptr [eax+140]
 00587803    call        @CheckAutoResult
 00587808    xor         eax,eax
 0058780A    pop         edx
 0058780B    pop         ecx
 0058780C    pop         ecx
 0058780D    mov         dword ptr fs:[eax],edx
>00587810    jmp         0058782F
>00587812    jmp         @HandleOnException
 00587817    dd          1
 0058781B    dd          0052E700;EOleError
 0058781F    dd          00587823
 00587823    mov         byte ptr ds:[7899CC],1
 0058782A    call        @DoneExcept
 0058782F    xor         eax,eax
 00587831    pop         edx
 00587832    pop         ecx
 00587833    pop         ecx
 00587834    mov         dword ptr fs:[eax],edx
 00587837    push        587854
 0058783C    lea         eax,[ebp-14]
 0058783F    call        @IntfClear
 00587844    lea         eax,[ebp-10]
 00587847    call        @VarClr
 0058784C    ret
>0058784D    jmp         @HandleFinally
>00587852    jmp         0058783C
 00587854    pop         edi
 00587855    pop         esi
 00587856    pop         ebx
 00587857    mov         esp,ebp
 00587859    pop         ebp
 0058785A    ret
*}
end;

//00587898
function TMSDOMDocument.createAttribute(const name:DOMString):IDOMAttr; safecall;
begin
{*
 00587898    push        ebp
 00587899    mov         ebp,esp
 0058789B    xor         ecx,ecx
 0058789D    push        ecx
 0058789E    push        ecx
 0058789F    push        ecx
 005878A0    push        ecx
 005878A1    push        ebx
 005878A2    push        esi
 005878A3    push        edi
 005878A4    mov         ebx,dword ptr [ebp+8]
 005878A7    mov         eax,dword ptr [ebp+10]
 005878AA    test        eax,eax
>005878AC    je          005878B2
 005878AE    xor         edx,edx
 005878B0    mov         dword ptr [eax],edx
 005878B2    push        ebx
 005878B3    xor         eax,eax
 005878B5    push        ebp
 005878B6    push        58791C
 005878BB    push        dword ptr fs:[eax]
 005878BE    mov         dword ptr fs:[eax],esp
 005878C1    lea         eax,[ebp-8]
 005878C4    call        @IntfClear
 005878C9    push        eax
 005878CA    lea         eax,[ebp-0C]
 005878CD    mov         edx,dword ptr [ebp+0C]
 005878D0    call        @WStrFromUStr
 005878D5    mov         eax,dword ptr [ebp-0C]
 005878D8    push        eax
 005878D9    lea         edx,[ebp-10]
 005878DC    mov         eax,ebx
 005878DE    call        TMSDOMDocument.GetMSDocument
 005878E3    mov         eax,dword ptr [ebp-10]
 005878E6    push        eax
 005878E7    mov         eax,dword ptr [eax]
 005878E9    call        dword ptr [eax+0D4]
 005878EF    call        @CheckAutoResult
 005878F4    mov         eax,dword ptr [ebp-8]
 005878F7    lea         edx,[ebp-4]
 005878FA    call        MakeNode
 005878FF    mov         edx,dword ptr [ebp-4]
 00587902    mov         eax,dword ptr [ebp+10]
 00587905    mov         ecx,58794C
 0058790A    call        @IntfCast
 0058790F    xor         eax,eax
 00587911    pop         edx
 00587912    pop         ecx
 00587913    pop         ecx
 00587914    mov         dword ptr fs:[eax],edx
 00587917    pop         eax
 00587918    xor         ebx,ebx
>0058791A    jmp         00587921
>0058791C    jmp         @HandleAutoException
 00587921    lea         eax,[ebp-10]
 00587924    call        @IntfClear
 00587929    lea         eax,[ebp-0C]
 0058792C    call        @WStrClr
 00587931    lea         eax,[ebp-8]
 00587934    call        @IntfClear
 00587939    lea         eax,[ebp-4]
 0058793C    call        @IntfClear
 00587941    mov         eax,ebx
 00587943    pop         edi
 00587944    pop         esi
 00587945    pop         ebx
 00587946    mov         esp,ebp
 00587948    pop         ebp
 00587949    ret         0C
*}
end;

//0058795C
function TMSDOMDocument.createAttributeNS(const namespaceURI:DOMString; const qualifiedName:DOMString):IDOMAttr; safecall;
begin
{*
 0058795C    push        ebp
 0058795D    mov         ebp,esp
 0058795F    mov         ecx,4
 00587964    push        0
 00587966    push        0
 00587968    dec         ecx
>00587969    jne         00587964
 0058796B    push        ecx
 0058796C    push        ebx
 0058796D    push        esi
 0058796E    push        edi
 0058796F    mov         ebx,dword ptr [ebp+8]
 00587972    mov         eax,dword ptr [ebp+14]
 00587975    test        eax,eax
>00587977    je          0058797D
 00587979    xor         edx,edx
 0058797B    mov         dword ptr [eax],edx
 0058797D    push        ebx
 0058797E    xor         eax,eax
 00587980    push        ebp
 00587981    push        587A11
 00587986    push        dword ptr fs:[eax]
 00587989    mov         dword ptr fs:[eax],esp
 0058798C    lea         eax,[ebp-8]
 0058798F    call        @IntfClear
 00587994    push        eax
 00587995    lea         eax,[ebp-0C]
 00587998    mov         edx,dword ptr [ebp+0C]
 0058799B    call        @WStrFromUStr
 005879A0    mov         eax,dword ptr [ebp-0C]
 005879A3    push        eax
 005879A4    lea         eax,[ebp-10]
 005879A7    mov         edx,dword ptr [ebp+10]
 005879AA    call        @WStrFromUStr
 005879AF    mov         eax,dword ptr [ebp-10]
 005879B2    push        eax
 005879B3    lea         eax,[ebp-20]
 005879B6    mov         edx,2
 005879BB    mov         cl,1
 005879BD    call        @OleVarFromInt
 005879C2    push        dword ptr [ebp-14]
 005879C5    push        dword ptr [ebp-18]
 005879C8    push        dword ptr [ebp-1C]
 005879CB    push        dword ptr [ebp-20]
 005879CE    lea         edx,[ebp-24]
 005879D1    mov         eax,ebx
 005879D3    call        TMSDOMDocument.GetMSDocument
 005879D8    mov         eax,dword ptr [ebp-24]
 005879DB    push        eax
 005879DC    mov         eax,dword ptr [eax]
 005879DE    call        dword ptr [eax+0E0]
 005879E4    call        @CheckAutoResult
 005879E9    mov         eax,dword ptr [ebp-8]
 005879EC    lea         edx,[ebp-4]
 005879EF    call        MakeNode
 005879F4    mov         edx,dword ptr [ebp-4]
 005879F7    mov         eax,dword ptr [ebp+14]
 005879FA    mov         ecx,587A50
 005879FF    call        @IntfCast
 00587A04    xor         eax,eax
 00587A06    pop         edx
 00587A07    pop         ecx
 00587A08    pop         ecx
 00587A09    mov         dword ptr fs:[eax],edx
 00587A0C    pop         eax
 00587A0D    xor         ebx,ebx
>00587A0F    jmp         00587A16
>00587A11    jmp         @HandleAutoException
 00587A16    lea         eax,[ebp-24]
 00587A19    call        @IntfClear
 00587A1E    lea         eax,[ebp-20]
 00587A21    call        @VarClr
 00587A26    lea         eax,[ebp-10]
 00587A29    mov         edx,2
 00587A2E    call        @WStrArrayClr
 00587A33    lea         eax,[ebp-8]
 00587A36    call        @IntfClear
 00587A3B    lea         eax,[ebp-4]
 00587A3E    call        @IntfClear
 00587A43    mov         eax,ebx
 00587A45    pop         edi
 00587A46    pop         esi
 00587A47    pop         ebx
 00587A48    mov         esp,ebp
 00587A4A    pop         ebp
 00587A4B    ret         10
*}
end;

//00587A60
function TMSDOMDocument.createCDATASection(const data:DOMString):IDOMCDATASection; safecall;
begin
{*
 00587A60    push        ebp
 00587A61    mov         ebp,esp
 00587A63    push        0
 00587A65    push        0
 00587A67    push        0
 00587A69    push        ebx
 00587A6A    push        esi
 00587A6B    push        edi
 00587A6C    mov         ebx,dword ptr [ebp+8]
 00587A6F    mov         eax,dword ptr [ebp+10]
 00587A72    test        eax,eax
>00587A74    je          00587A7A
 00587A76    xor         edx,edx
 00587A78    mov         dword ptr [eax],edx
 00587A7A    push        ebx
 00587A7B    xor         eax,eax
 00587A7D    push        ebp
 00587A7E    push        587AEE
 00587A83    push        dword ptr fs:[eax]
 00587A86    mov         dword ptr fs:[eax],esp
 00587A89    lea         eax,[ebp-4]
 00587A8C    call        @IntfClear
 00587A91    push        eax
 00587A92    lea         eax,[ebp-8]
 00587A95    mov         edx,dword ptr [ebp+0C]
 00587A98    call        @WStrFromUStr
 00587A9D    mov         eax,dword ptr [ebp-8]
 00587AA0    push        eax
 00587AA1    lea         edx,[ebp-0C]
 00587AA4    mov         eax,ebx
 00587AA6    call        TMSDOMDocument.GetMSDocument
 00587AAB    mov         eax,dword ptr [ebp-0C]
 00587AAE    push        eax
 00587AAF    mov         eax,dword ptr [eax]
 00587AB1    call        dword ptr [eax+0CC]
 00587AB7    call        @CheckAutoResult
 00587ABC    mov         ecx,dword ptr [ebp-4]
 00587ABF    mov         dl,1
 00587AC1    mov         eax,[00582754];TMSDOMCDATASection
 00587AC6    call        TMSDOMNode.Create
 00587ACB    mov         edx,eax
 00587ACD    test        edx,edx
>00587ACF    je          00587AD4
 00587AD1    sub         edx,0FFFFFFF8
 00587AD4    mov         eax,dword ptr [ebp+10]
 00587AD7    mov         ecx,587B18
 00587ADC    call        @IntfCast
 00587AE1    xor         eax,eax
 00587AE3    pop         edx
 00587AE4    pop         ecx
 00587AE5    pop         ecx
 00587AE6    mov         dword ptr fs:[eax],edx
 00587AE9    pop         eax
 00587AEA    xor         ebx,ebx
>00587AEC    jmp         00587AF3
>00587AEE    jmp         @HandleAutoException
 00587AF3    lea         eax,[ebp-0C]
 00587AF6    call        @IntfClear
 00587AFB    lea         eax,[ebp-8]
 00587AFE    call        @WStrClr
 00587B03    lea         eax,[ebp-4]
 00587B06    call        @IntfClear
 00587B0B    mov         eax,ebx
 00587B0D    pop         edi
 00587B0E    pop         esi
 00587B0F    pop         ebx
 00587B10    mov         esp,ebp
 00587B12    pop         ebp
 00587B13    ret         0C
*}
end;

//00587B28
function TMSDOMDocument.createComment(const data:DOMString):IDOMComment; safecall;
begin
{*
 00587B28    push        ebp
 00587B29    mov         ebp,esp
 00587B2B    push        0
 00587B2D    push        0
 00587B2F    push        0
 00587B31    push        ebx
 00587B32    push        esi
 00587B33    push        edi
 00587B34    mov         ebx,dword ptr [ebp+8]
 00587B37    mov         eax,dword ptr [ebp+10]
 00587B3A    test        eax,eax
>00587B3C    je          00587B42
 00587B3E    xor         edx,edx
 00587B40    mov         dword ptr [eax],edx
 00587B42    push        ebx
 00587B43    xor         eax,eax
 00587B45    push        ebp
 00587B46    push        587BB6
 00587B4B    push        dword ptr fs:[eax]
 00587B4E    mov         dword ptr fs:[eax],esp
 00587B51    lea         eax,[ebp-4]
 00587B54    call        @IntfClear
 00587B59    push        eax
 00587B5A    lea         eax,[ebp-8]
 00587B5D    mov         edx,dword ptr [ebp+0C]
 00587B60    call        @WStrFromUStr
 00587B65    mov         eax,dword ptr [ebp-8]
 00587B68    push        eax
 00587B69    lea         edx,[ebp-0C]
 00587B6C    mov         eax,ebx
 00587B6E    call        TMSDOMDocument.GetMSDocument
 00587B73    mov         eax,dword ptr [ebp-0C]
 00587B76    push        eax
 00587B77    mov         eax,dword ptr [eax]
 00587B79    call        dword ptr [eax+0C8]
 00587B7F    call        @CheckAutoResult
 00587B84    mov         ecx,dword ptr [ebp-4]
 00587B87    mov         dl,1
 00587B89    mov         eax,[005824B0];TMSDOMComment
 00587B8E    call        TMSDOMNode.Create
 00587B93    mov         edx,eax
 00587B95    test        edx,edx
>00587B97    je          00587B9C
 00587B99    sub         edx,0FFFFFFF8
 00587B9C    mov         eax,dword ptr [ebp+10]
 00587B9F    mov         ecx,587BE0
 00587BA4    call        @IntfCast
 00587BA9    xor         eax,eax
 00587BAB    pop         edx
 00587BAC    pop         ecx
 00587BAD    pop         ecx
 00587BAE    mov         dword ptr fs:[eax],edx
 00587BB1    pop         eax
 00587BB2    xor         ebx,ebx
>00587BB4    jmp         00587BBB
>00587BB6    jmp         @HandleAutoException
 00587BBB    lea         eax,[ebp-0C]
 00587BBE    call        @IntfClear
 00587BC3    lea         eax,[ebp-8]
 00587BC6    call        @WStrClr
 00587BCB    lea         eax,[ebp-4]
 00587BCE    call        @IntfClear
 00587BD3    mov         eax,ebx
 00587BD5    pop         edi
 00587BD6    pop         esi
 00587BD7    pop         ebx
 00587BD8    mov         esp,ebp
 00587BDA    pop         ebp
 00587BDB    ret         0C
*}
end;

//00587BF0
function TMSDOMDocument.createDocumentFragment:IDOMDocumentFragment; safecall;
begin
{*
 00587BF0    push        ebp
 00587BF1    mov         ebp,esp
 00587BF3    push        0
 00587BF5    push        0
 00587BF7    push        ebx
 00587BF8    push        esi
 00587BF9    push        edi
 00587BFA    mov         ebx,dword ptr [ebp+8]
 00587BFD    mov         eax,dword ptr [ebp+0C]
 00587C00    test        eax,eax
>00587C02    je          00587C08
 00587C04    xor         edx,edx
 00587C06    mov         dword ptr [eax],edx
 00587C08    push        ebx
 00587C09    xor         eax,eax
 00587C0B    push        ebp
 00587C0C    push        587C6D
 00587C11    push        dword ptr fs:[eax]
 00587C14    mov         dword ptr fs:[eax],esp
 00587C17    lea         eax,[ebp-4]
 00587C1A    call        @IntfClear
 00587C1F    push        eax
 00587C20    lea         edx,[ebp-8]
 00587C23    mov         eax,ebx
 00587C25    call        TMSDOMDocument.GetMSDocument
 00587C2A    mov         eax,dword ptr [ebp-8]
 00587C2D    push        eax
 00587C2E    mov         eax,dword ptr [eax]
 00587C30    call        dword ptr [eax+0C0]
 00587C36    call        @CheckAutoResult
 00587C3B    mov         ecx,dword ptr [ebp-4]
 00587C3E    mov         dl,1
 00587C40    mov         eax,[00583648];TMSDOMDocumentFragment
 00587C45    call        TMSDOMNode.Create
 00587C4A    mov         edx,eax
 00587C4C    test        edx,edx
>00587C4E    je          00587C53
 00587C50    sub         edx,0FFFFFFF8
 00587C53    mov         eax,dword ptr [ebp+0C]
 00587C56    mov         ecx,587C90
 00587C5B    call        @IntfCast
 00587C60    xor         eax,eax
 00587C62    pop         edx
 00587C63    pop         ecx
 00587C64    pop         ecx
 00587C65    mov         dword ptr fs:[eax],edx
 00587C68    pop         eax
 00587C69    xor         ebx,ebx
>00587C6B    jmp         00587C72
>00587C6D    jmp         @HandleAutoException
 00587C72    lea         eax,[ebp-8]
 00587C75    call        @IntfClear
 00587C7A    lea         eax,[ebp-4]
 00587C7D    call        @IntfClear
 00587C82    mov         eax,ebx
 00587C84    pop         edi
 00587C85    pop         esi
 00587C86    pop         ebx
 00587C87    pop         ecx
 00587C88    pop         ecx
 00587C89    pop         ebp
 00587C8A    ret         8
*}
end;

//00587CA0
function TMSDOMDocument.createElement(const tagName:DOMString):IDOMElement; safecall;
begin
{*
 00587CA0    push        ebp
 00587CA1    mov         ebp,esp
 00587CA3    xor         ecx,ecx
 00587CA5    push        ecx
 00587CA6    push        ecx
 00587CA7    push        ecx
 00587CA8    push        ecx
 00587CA9    push        ebx
 00587CAA    push        esi
 00587CAB    push        edi
 00587CAC    mov         ebx,dword ptr [ebp+8]
 00587CAF    mov         eax,dword ptr [ebp+10]
 00587CB2    test        eax,eax
>00587CB4    je          00587CBA
 00587CB6    xor         edx,edx
 00587CB8    mov         dword ptr [eax],edx
 00587CBA    push        ebx
 00587CBB    xor         eax,eax
 00587CBD    push        ebp
 00587CBE    push        587D24
 00587CC3    push        dword ptr fs:[eax]
 00587CC6    mov         dword ptr fs:[eax],esp
 00587CC9    lea         eax,[ebp-8]
 00587CCC    call        @IntfClear
 00587CD1    push        eax
 00587CD2    lea         eax,[ebp-0C]
 00587CD5    mov         edx,dword ptr [ebp+0C]
 00587CD8    call        @WStrFromUStr
 00587CDD    mov         eax,dword ptr [ebp-0C]
 00587CE0    push        eax
 00587CE1    lea         edx,[ebp-10]
 00587CE4    mov         eax,ebx
 00587CE6    call        TMSDOMDocument.GetMSDocument
 00587CEB    mov         eax,dword ptr [ebp-10]
 00587CEE    push        eax
 00587CEF    mov         eax,dword ptr [eax]
 00587CF1    call        dword ptr [eax+0BC]
 00587CF7    call        @CheckAutoResult
 00587CFC    mov         eax,dword ptr [ebp-8]
 00587CFF    lea         edx,[ebp-4]
 00587D02    call        MakeNode
 00587D07    mov         edx,dword ptr [ebp-4]
 00587D0A    mov         eax,dword ptr [ebp+10]
 00587D0D    mov         ecx,587D54
 00587D12    call        @IntfCast
 00587D17    xor         eax,eax
 00587D19    pop         edx
 00587D1A    pop         ecx
 00587D1B    pop         ecx
 00587D1C    mov         dword ptr fs:[eax],edx
 00587D1F    pop         eax
 00587D20    xor         ebx,ebx
>00587D22    jmp         00587D29
>00587D24    jmp         @HandleAutoException
 00587D29    lea         eax,[ebp-10]
 00587D2C    call        @IntfClear
 00587D31    lea         eax,[ebp-0C]
 00587D34    call        @WStrClr
 00587D39    lea         eax,[ebp-8]
 00587D3C    call        @IntfClear
 00587D41    lea         eax,[ebp-4]
 00587D44    call        @IntfClear
 00587D49    mov         eax,ebx
 00587D4B    pop         edi
 00587D4C    pop         esi
 00587D4D    pop         ebx
 00587D4E    mov         esp,ebp
 00587D50    pop         ebp
 00587D51    ret         0C
*}
end;

//00587D64
function TMSDOMDocument.createElementNS(const namespaceURI:DOMString; const qualifiedName:DOMString):IDOMElement; safecall;
begin
{*
 00587D64    push        ebp
 00587D65    mov         ebp,esp
 00587D67    mov         ecx,4
 00587D6C    push        0
 00587D6E    push        0
 00587D70    dec         ecx
>00587D71    jne         00587D6C
 00587D73    push        ecx
 00587D74    push        ebx
 00587D75    push        esi
 00587D76    push        edi
 00587D77    mov         ebx,dword ptr [ebp+8]
 00587D7A    mov         eax,dword ptr [ebp+14]
 00587D7D    test        eax,eax
>00587D7F    je          00587D85
 00587D81    xor         edx,edx
 00587D83    mov         dword ptr [eax],edx
 00587D85    push        ebx
 00587D86    xor         eax,eax
 00587D88    push        ebp
 00587D89    push        587E19
 00587D8E    push        dword ptr fs:[eax]
 00587D91    mov         dword ptr fs:[eax],esp
 00587D94    lea         eax,[ebp-8]
 00587D97    call        @IntfClear
 00587D9C    push        eax
 00587D9D    lea         eax,[ebp-0C]
 00587DA0    mov         edx,dword ptr [ebp+0C]
 00587DA3    call        @WStrFromUStr
 00587DA8    mov         eax,dword ptr [ebp-0C]
 00587DAB    push        eax
 00587DAC    lea         eax,[ebp-10]
 00587DAF    mov         edx,dword ptr [ebp+10]
 00587DB2    call        @WStrFromUStr
 00587DB7    mov         eax,dword ptr [ebp-10]
 00587DBA    push        eax
 00587DBB    lea         eax,[ebp-20]
 00587DBE    mov         edx,1
 00587DC3    mov         cl,1
 00587DC5    call        @OleVarFromInt
 00587DCA    push        dword ptr [ebp-14]
 00587DCD    push        dword ptr [ebp-18]
 00587DD0    push        dword ptr [ebp-1C]
 00587DD3    push        dword ptr [ebp-20]
 00587DD6    lea         edx,[ebp-24]
 00587DD9    mov         eax,ebx
 00587DDB    call        TMSDOMDocument.GetMSDocument
 00587DE0    mov         eax,dword ptr [ebp-24]
 00587DE3    push        eax
 00587DE4    mov         eax,dword ptr [eax]
 00587DE6    call        dword ptr [eax+0E0]
 00587DEC    call        @CheckAutoResult
 00587DF1    mov         eax,dword ptr [ebp-8]
 00587DF4    lea         edx,[ebp-4]
 00587DF7    call        MakeNode
 00587DFC    mov         edx,dword ptr [ebp-4]
 00587DFF    mov         eax,dword ptr [ebp+14]
 00587E02    mov         ecx,587E58
 00587E07    call        @IntfCast
 00587E0C    xor         eax,eax
 00587E0E    pop         edx
 00587E0F    pop         ecx
 00587E10    pop         ecx
 00587E11    mov         dword ptr fs:[eax],edx
 00587E14    pop         eax
 00587E15    xor         ebx,ebx
>00587E17    jmp         00587E1E
>00587E19    jmp         @HandleAutoException
 00587E1E    lea         eax,[ebp-24]
 00587E21    call        @IntfClear
 00587E26    lea         eax,[ebp-20]
 00587E29    call        @VarClr
 00587E2E    lea         eax,[ebp-10]
 00587E31    mov         edx,2
 00587E36    call        @WStrArrayClr
 00587E3B    lea         eax,[ebp-8]
 00587E3E    call        @IntfClear
 00587E43    lea         eax,[ebp-4]
 00587E46    call        @IntfClear
 00587E4B    mov         eax,ebx
 00587E4D    pop         edi
 00587E4E    pop         esi
 00587E4F    pop         ebx
 00587E50    mov         esp,ebp
 00587E52    pop         ebp
 00587E53    ret         10
*}
end;

//00587E68
function TMSDOMDocument.createEntityReference(const name:DOMString):IDOMEntityReference; safecall;
begin
{*
 00587E68    push        ebp
 00587E69    mov         ebp,esp
 00587E6B    push        0
 00587E6D    push        0
 00587E6F    push        0
 00587E71    push        ebx
 00587E72    push        esi
 00587E73    push        edi
 00587E74    mov         ebx,dword ptr [ebp+8]
 00587E77    mov         eax,dword ptr [ebp+10]
 00587E7A    test        eax,eax
>00587E7C    je          00587E82
 00587E7E    xor         edx,edx
 00587E80    mov         dword ptr [eax],edx
 00587E82    push        ebx
 00587E83    xor         eax,eax
 00587E85    push        ebp
 00587E86    push        587EF1
 00587E8B    push        dword ptr fs:[eax]
 00587E8E    mov         dword ptr fs:[eax],esp
 00587E91    lea         eax,[ebp-4]
 00587E94    call        @IntfClear
 00587E99    push        eax
 00587E9A    lea         eax,[ebp-8]
 00587E9D    mov         edx,dword ptr [ebp+0C]
 00587EA0    call        @WStrFromUStr
 00587EA5    mov         eax,dword ptr [ebp-8]
 00587EA8    push        eax
 00587EA9    lea         edx,[ebp-0C]
 00587EAC    mov         eax,ebx
 00587EAE    call        TMSDOMDocument.GetMSDocument
 00587EB3    mov         eax,dword ptr [ebp-0C]
 00587EB6    push        eax
 00587EB7    mov         eax,dword ptr [eax]
 00587EB9    call        dword ptr [eax+0D8]
 00587EBF    call        @CheckAutoResult
 00587EC4    mov         ecx,dword ptr [ebp-4]
 00587EC7    mov         dl,1
 00587EC9    mov         eax,[00583170];TMSDOMEntityReference
 00587ECE    call        TMSDOMNode.Create
 00587ED3    mov         edx,eax
 00587ED5    test        edx,edx
>00587ED7    je          00587EDC
 00587ED9    sub         edx,0FFFFFFD8
 00587EDC    mov         eax,dword ptr [ebp+10]
 00587EDF    call        @IntfCopy
 00587EE4    xor         eax,eax
 00587EE6    pop         edx
 00587EE7    pop         ecx
 00587EE8    pop         ecx
 00587EE9    mov         dword ptr fs:[eax],edx
 00587EEC    pop         eax
 00587EED    xor         ebx,ebx
>00587EEF    jmp         00587EF6
>00587EF1    jmp         @HandleAutoException
 00587EF6    lea         eax,[ebp-0C]
 00587EF9    call        @IntfClear
 00587EFE    lea         eax,[ebp-8]
 00587F01    call        @WStrClr
 00587F06    lea         eax,[ebp-4]
 00587F09    call        @IntfClear
 00587F0E    mov         eax,ebx
 00587F10    pop         edi
 00587F11    pop         esi
 00587F12    pop         ebx
 00587F13    mov         esp,ebp
 00587F15    pop         ebp
 00587F16    ret         0C
*}
end;

//00587F1C
function TMSDOMDocument.createProcessingInstruction(const target:DOMString; const data:DOMString):IDOMProcessingInstruction; safecall;
begin
{*
 00587F1C    push        ebp
 00587F1D    mov         ebp,esp
 00587F1F    xor         ecx,ecx
 00587F21    push        ecx
 00587F22    push        ecx
 00587F23    push        ecx
 00587F24    push        ecx
 00587F25    push        ebx
 00587F26    push        esi
 00587F27    push        edi
 00587F28    mov         ebx,dword ptr [ebp+8]
 00587F2B    mov         eax,dword ptr [ebp+14]
 00587F2E    test        eax,eax
>00587F30    je          00587F36
 00587F32    xor         edx,edx
 00587F34    mov         dword ptr [eax],edx
 00587F36    push        ebx
 00587F37    xor         eax,eax
 00587F39    push        ebp
 00587F3A    push        587FB4
 00587F3F    push        dword ptr fs:[eax]
 00587F42    mov         dword ptr fs:[eax],esp
 00587F45    lea         eax,[ebp-4]
 00587F48    call        @IntfClear
 00587F4D    push        eax
 00587F4E    lea         eax,[ebp-8]
 00587F51    mov         edx,dword ptr [ebp+10]
 00587F54    call        @WStrFromUStr
 00587F59    mov         eax,dword ptr [ebp-8]
 00587F5C    push        eax
 00587F5D    lea         eax,[ebp-0C]
 00587F60    mov         edx,dword ptr [ebp+0C]
 00587F63    call        @WStrFromUStr
 00587F68    mov         eax,dword ptr [ebp-0C]
 00587F6B    push        eax
 00587F6C    lea         edx,[ebp-10]
 00587F6F    mov         eax,ebx
 00587F71    call        TMSDOMDocument.GetMSDocument
 00587F76    mov         eax,dword ptr [ebp-10]
 00587F79    push        eax
 00587F7A    mov         eax,dword ptr [eax]
 00587F7C    call        dword ptr [eax+0D0]
 00587F82    call        @CheckAutoResult
 00587F87    mov         ecx,dword ptr [ebp-4]
 00587F8A    mov         dl,1
 00587F8C    mov         eax,[005833D0];TMSDOMProcessingInstruction
 00587F91    call        TMSDOMNode.Create
 00587F96    mov         edx,eax
 00587F98    test        edx,edx
>00587F9A    je          00587F9F
 00587F9C    sub         edx,0FFFFFFD8
 00587F9F    mov         eax,dword ptr [ebp+14]
 00587FA2    call        @IntfCopy
 00587FA7    xor         eax,eax
 00587FA9    pop         edx
 00587FAA    pop         ecx
 00587FAB    pop         ecx
 00587FAC    mov         dword ptr fs:[eax],edx
 00587FAF    pop         eax
 00587FB0    xor         ebx,ebx
>00587FB2    jmp         00587FB9
>00587FB4    jmp         @HandleAutoException
 00587FB9    lea         eax,[ebp-10]
 00587FBC    call        @IntfClear
 00587FC1    lea         eax,[ebp-0C]
 00587FC4    mov         edx,2
 00587FC9    call        @WStrArrayClr
 00587FCE    lea         eax,[ebp-4]
 00587FD1    call        @IntfClear
 00587FD6    mov         eax,ebx
 00587FD8    pop         edi
 00587FD9    pop         esi
 00587FDA    pop         ebx
 00587FDB    mov         esp,ebp
 00587FDD    pop         ebp
 00587FDE    ret         10
*}
end;

//00587FE4
function TMSDOMDocument.createTextNode(const data:DOMString):IDOMText; safecall;
begin
{*
 00587FE4    push        ebp
 00587FE5    mov         ebp,esp
 00587FE7    xor         ecx,ecx
 00587FE9    push        ecx
 00587FEA    push        ecx
 00587FEB    push        ecx
 00587FEC    push        ecx
 00587FED    push        ebx
 00587FEE    push        esi
 00587FEF    push        edi
 00587FF0    mov         ebx,dword ptr [ebp+8]
 00587FF3    mov         eax,dword ptr [ebp+10]
 00587FF6    test        eax,eax
>00587FF8    je          00587FFE
 00587FFA    xor         edx,edx
 00587FFC    mov         dword ptr [eax],edx
 00587FFE    push        ebx
 00587FFF    xor         eax,eax
 00588001    push        ebp
 00588002    push        588068
 00588007    push        dword ptr fs:[eax]
 0058800A    mov         dword ptr fs:[eax],esp
 0058800D    lea         eax,[ebp-8]
 00588010    call        @IntfClear
 00588015    push        eax
 00588016    lea         eax,[ebp-0C]
 00588019    mov         edx,dword ptr [ebp+0C]
 0058801C    call        @WStrFromUStr
 00588021    mov         eax,dword ptr [ebp-0C]
 00588024    push        eax
 00588025    lea         edx,[ebp-10]
 00588028    mov         eax,ebx
 0058802A    call        TMSDOMDocument.GetMSDocument
 0058802F    mov         eax,dword ptr [ebp-10]
 00588032    push        eax
 00588033    mov         eax,dword ptr [eax]
 00588035    call        dword ptr [eax+0C4]
 0058803B    call        @CheckAutoResult
 00588040    mov         eax,dword ptr [ebp-8]
 00588043    lea         edx,[ebp-4]
 00588046    call        MakeNode
 0058804B    mov         edx,dword ptr [ebp-4]
 0058804E    mov         eax,dword ptr [ebp+10]
 00588051    mov         ecx,588098
 00588056    call        @IntfCast
 0058805B    xor         eax,eax
 0058805D    pop         edx
 0058805E    pop         ecx
 0058805F    pop         ecx
 00588060    mov         dword ptr fs:[eax],edx
 00588063    pop         eax
 00588064    xor         ebx,ebx
>00588066    jmp         0058806D
>00588068    jmp         @HandleAutoException
 0058806D    lea         eax,[ebp-10]
 00588070    call        @IntfClear
 00588075    lea         eax,[ebp-0C]
 00588078    call        @WStrClr
 0058807D    lea         eax,[ebp-8]
 00588080    call        @IntfClear
 00588085    lea         eax,[ebp-4]
 00588088    call        @IntfClear
 0058808D    mov         eax,ebx
 0058808F    pop         edi
 00588090    pop         esi
 00588091    pop         ebx
 00588092    mov         esp,ebp
 00588094    pop         ebp
 00588095    ret         0C
*}
end;

//005880A8
function TMSDOMDocument.get_doctype:IDOMDocumentType; safecall;
begin
{*
 005880A8    push        ebp
 005880A9    mov         ebp,esp
 005880AB    push        0
 005880AD    push        0
 005880AF    push        ebx
 005880B0    push        esi
 005880B1    push        edi
 005880B2    mov         ebx,dword ptr [ebp+8]
 005880B5    mov         eax,dword ptr [ebp+0C]
 005880B8    test        eax,eax
>005880BA    je          005880C0
 005880BC    xor         edx,edx
 005880BE    mov         dword ptr [eax],edx
 005880C0    push        ebx
 005880C1    xor         eax,eax
 005880C3    push        ebp
 005880C4    push        588120
 005880C9    push        dword ptr fs:[eax]
 005880CC    mov         dword ptr fs:[eax],esp
 005880CF    lea         eax,[ebp-4]
 005880D2    call        @IntfClear
 005880D7    push        eax
 005880D8    lea         edx,[ebp-8]
 005880DB    mov         eax,ebx
 005880DD    call        TMSDOMDocument.GetMSDocument
 005880E2    mov         eax,dword ptr [ebp-8]
 005880E5    push        eax
 005880E6    mov         eax,dword ptr [eax]
 005880E8    call        dword ptr [eax+0AC]
 005880EE    call        @CheckAutoResult
 005880F3    mov         ecx,dword ptr [ebp-4]
 005880F6    mov         dl,1
 005880F8    mov         eax,[005829D8];TMSDOMDocumentType
 005880FD    call        TMSDOMNode.Create
 00588102    mov         edx,eax
 00588104    test        edx,edx
>00588106    je          0058810B
 00588108    sub         edx,0FFFFFFD0
 0058810B    mov         eax,dword ptr [ebp+0C]
 0058810E    call        @IntfCopy
 00588113    xor         eax,eax
 00588115    pop         edx
 00588116    pop         ecx
 00588117    pop         ecx
 00588118    mov         dword ptr fs:[eax],edx
 0058811B    pop         eax
 0058811C    xor         ebx,ebx
>0058811E    jmp         00588125
>00588120    jmp         @HandleAutoException
 00588125    lea         eax,[ebp-8]
 00588128    call        @IntfClear
 0058812D    lea         eax,[ebp-4]
 00588130    call        @IntfClear
 00588135    mov         eax,ebx
 00588137    pop         edi
 00588138    pop         esi
 00588139    pop         ebx
 0058813A    pop         ecx
 0058813B    pop         ecx
 0058813C    pop         ebp
 0058813D    ret         8
*}
end;

//00588140
function TMSDOMDocument.get_documentElement:IDOMElement; safecall;
begin
{*
 00588140    push        ebp
 00588141    mov         ebp,esp
 00588143    push        0
 00588145    push        0
 00588147    push        0
 00588149    push        ebx
 0058814A    push        esi
 0058814B    push        edi
 0058814C    mov         ebx,dword ptr [ebp+8]
 0058814F    mov         eax,dword ptr [ebp+0C]
 00588152    test        eax,eax
>00588154    je          0058815A
 00588156    xor         edx,edx
 00588158    mov         dword ptr [eax],edx
 0058815A    push        ebx
 0058815B    xor         eax,eax
 0058815D    push        ebp
 0058815E    push        5881B5
 00588163    push        dword ptr fs:[eax]
 00588166    mov         dword ptr fs:[eax],esp
 00588169    lea         eax,[ebp-8]
 0058816C    call        @IntfClear
 00588171    push        eax
 00588172    lea         edx,[ebp-0C]
 00588175    mov         eax,ebx
 00588177    call        TMSDOMDocument.GetMSDocument
 0058817C    mov         eax,dword ptr [ebp-0C]
 0058817F    push        eax
 00588180    mov         eax,dword ptr [eax]
 00588182    call        dword ptr [eax+0B4]
 00588188    call        @CheckAutoResult
 0058818D    mov         eax,dword ptr [ebp-8]
 00588190    lea         edx,[ebp-4]
 00588193    call        MakeNode
 00588198    mov         edx,dword ptr [ebp-4]
 0058819B    mov         eax,dword ptr [ebp+0C]
 0058819E    mov         ecx,5881E0
 005881A3    call        @IntfCast
 005881A8    xor         eax,eax
 005881AA    pop         edx
 005881AB    pop         ecx
 005881AC    pop         ecx
 005881AD    mov         dword ptr fs:[eax],edx
 005881B0    pop         eax
 005881B1    xor         ebx,ebx
>005881B3    jmp         005881BA
>005881B5    jmp         @HandleAutoException
 005881BA    lea         eax,[ebp-0C]
 005881BD    call        @IntfClear
 005881C2    lea         eax,[ebp-8]
 005881C5    call        @IntfClear
 005881CA    lea         eax,[ebp-4]
 005881CD    call        @IntfClear
 005881D2    mov         eax,ebx
 005881D4    pop         edi
 005881D5    pop         esi
 005881D6    pop         ebx
 005881D7    mov         esp,ebp
 005881D9    pop         ebp
 005881DA    ret         8
*}
end;

//005881F0
function TMSDOMDocument.get_domImplementation:IDOMImplementation; safecall;
begin
{*
 005881F0    push        ebp
 005881F1    mov         ebp,esp
 005881F3    push        0
 005881F5    push        0
 005881F7    push        ebx
 005881F8    push        esi
 005881F9    push        edi
 005881FA    mov         ebx,dword ptr [ebp+8]
 005881FD    mov         eax,dword ptr [ebp+0C]
 00588200    test        eax,eax
>00588202    je          00588208
 00588204    xor         edx,edx
 00588206    mov         dword ptr [eax],edx
 00588208    push        ebx
 00588209    xor         eax,eax
 0058820B    push        ebp
 0058820C    push        588268
 00588211    push        dword ptr fs:[eax]
 00588214    mov         dword ptr fs:[eax],esp
 00588217    lea         eax,[ebp-4]
 0058821A    call        @IntfClear
 0058821F    push        eax
 00588220    lea         edx,[ebp-8]
 00588223    mov         eax,ebx
 00588225    call        TMSDOMDocument.GetMSDocument
 0058822A    mov         eax,dword ptr [ebp-8]
 0058822D    push        eax
 0058822E    mov         eax,dword ptr [eax]
 00588230    call        dword ptr [eax+0B0]
 00588236    call        @CheckAutoResult
 0058823B    mov         ecx,dword ptr [ebp-4]
 0058823E    mov         dl,1
 00588240    mov         eax,[00580E48];TMSDOMImplementation
 00588245    call        TMSDOMImplementation.Create
 0058824A    mov         edx,eax
 0058824C    test        edx,edx
>0058824E    je          00588253
 00588250    sub         edx,0FFFFFFF0
 00588253    mov         eax,dword ptr [ebp+0C]
 00588256    call        @IntfCopy
 0058825B    xor         eax,eax
 0058825D    pop         edx
 0058825E    pop         ecx
 0058825F    pop         ecx
 00588260    mov         dword ptr fs:[eax],edx
 00588263    pop         eax
 00588264    xor         ebx,ebx
>00588266    jmp         0058826D
>00588268    jmp         @HandleAutoException
 0058826D    lea         eax,[ebp-8]
 00588270    call        @IntfClear
 00588275    lea         eax,[ebp-4]
 00588278    call        @IntfClear
 0058827D    mov         eax,ebx
 0058827F    pop         edi
 00588280    pop         esi
 00588281    pop         ebx
 00588282    pop         ecx
 00588283    pop         ecx
 00588284    pop         ebp
 00588285    ret         8
*}
end;

//00588288
function TMSDOMDocument.getElementById(const elementId:DOMString):IDOMElement; safecall;
begin
{*
 00588288    push        ebp
 00588289    mov         ebp,esp
 0058828B    push        ebx
 0058828C    push        esi
 0058828D    push        edi
 0058828E    mov         eax,dword ptr [ebp+10]
 00588291    test        eax,eax
>00588293    je          00588299
 00588295    xor         edx,edx
 00588297    mov         dword ptr [eax],edx
 00588299    push        dword ptr [ebp+8]
 0058829C    xor         eax,eax
 0058829E    push        ebp
 0058829F    push        5882C6
 005882A4    push        dword ptr fs:[eax]
 005882A7    mov         dword ptr fs:[eax],esp
 005882AA    mov         edx,5882E0;'MSXML'
 005882AF    mov         eax,5882F8;'getElementById'
 005882B4    call        DOMVendorNotSupported
 005882B9    xor         eax,eax
 005882BB    pop         edx
 005882BC    pop         ecx
 005882BD    pop         ecx
 005882BE    mov         dword ptr fs:[eax],edx
 005882C1    pop         eax
 005882C2    xor         ebx,ebx
>005882C4    jmp         005882CB
>005882C6    jmp         @HandleAutoException
 005882CB    mov         eax,ebx
 005882CD    pop         edi
 005882CE    pop         esi
 005882CF    pop         ebx
 005882D0    pop         ebp
 005882D1    ret         0C
*}
end;

//00588318
{*function sub_00588318(?:?; ?:?; ?:?):?;
begin
 00588318    push        ebp
 00588319    mov         ebp,esp
 0058831B    push        0
 0058831D    push        0
 0058831F    push        0
 00588321    push        ebx
 00588322    push        esi
 00588323    push        edi
 00588324    mov         ebx,dword ptr [ebp+8]
 00588327    mov         eax,dword ptr [ebp+10]
 0058832A    test        eax,eax
>0058832C    je          00588332
 0058832E    xor         edx,edx
 00588330    mov         dword ptr [eax],edx
 00588332    push        ebx
 00588333    xor         eax,eax
 00588335    push        ebp
 00588336    push        58838C
 0058833B    push        dword ptr fs:[eax]
 0058833E    mov         dword ptr fs:[eax],esp
 00588341    lea         eax,[ebp-4]
 00588344    call        @IntfClear
 00588349    push        eax
 0058834A    lea         eax,[ebp-8]
 0058834D    mov         edx,dword ptr [ebp+0C]
 00588350    call        @WStrFromUStr
 00588355    mov         eax,dword ptr [ebp-8]
 00588358    push        eax
 00588359    lea         edx,[ebp-0C]
 0058835C    mov         eax,ebx
 0058835E    call        TMSDOMDocument.GetMSDocument
 00588363    mov         eax,dword ptr [ebp-0C]
 00588366    push        eax
 00588367    mov         eax,dword ptr [eax]
 00588369    call        dword ptr [eax+0DC]
 0058836F    call        @CheckAutoResult
 00588374    mov         eax,dword ptr [ebp-4]
 00588377    mov         edx,dword ptr [ebp+10]
 0058837A    call        MakeNamedNodeMap
 0058837F    xor         eax,eax
 00588381    pop         edx
 00588382    pop         ecx
 00588383    pop         ecx
 00588384    mov         dword ptr fs:[eax],edx
 00588387    pop         eax
 00588388    xor         ebx,ebx
>0058838A    jmp         00588391
>0058838C    jmp         @HandleAutoException
 00588391    lea         eax,[ebp-0C]
 00588394    call        @IntfClear
 00588399    lea         eax,[ebp-8]
 0058839C    call        @WStrClr
 005883A1    lea         eax,[ebp-4]
 005883A4    call        @IntfClear
 005883A9    mov         eax,ebx
 005883AB    pop         edi
 005883AC    pop         esi
 005883AD    pop         ebx
 005883AE    mov         esp,ebp
 005883B0    pop         ebp
 005883B1    ret         0C
end;*}

//005883B4
function TMSDOMElement.getElementsByTagNameNS(const namespaceURI:DOMString; const localName:DOMString):IDOMNodeList; safecall;
begin
{*
 005883B4    push        ebp
 005883B5    mov         ebp,esp
 005883B7    push        ebx
 005883B8    push        esi
 005883B9    push        edi
 005883BA    mov         eax,dword ptr [ebp+14]
 005883BD    test        eax,eax
>005883BF    je          005883C5
 005883C1    xor         edx,edx
 005883C3    mov         dword ptr [eax],edx
 005883C5    push        dword ptr [ebp+8]
 005883C8    xor         eax,eax
 005883CA    push        ebp
 005883CB    push        5883F2
 005883D0    push        dword ptr fs:[eax]
 005883D3    mov         dword ptr fs:[eax],esp
 005883D6    mov         edx,58840C;'MSXML'
 005883DB    mov         eax,588424;'getElementsByTagNameNS'
 005883E0    call        DOMVendorNotSupported
 005883E5    xor         eax,eax
 005883E7    pop         edx
 005883E8    pop         ecx
 005883E9    pop         ecx
 005883EA    mov         dword ptr fs:[eax],edx
 005883ED    pop         eax
 005883EE    xor         ebx,ebx
>005883F0    jmp         005883F7
>005883F2    jmp         @HandleAutoException
 005883F7    mov         eax,ebx
 005883F9    pop         edi
 005883FA    pop         esi
 005883FB    pop         ebx
 005883FC    pop         ebp
 005883FD    ret         10
*}
end;

//00588454
function TMSDOMDocument.importNode(importedNode:IDOMNode; deep:WordBool):IDOMNode; safecall;
begin
{*
 00588454    push        ebp
 00588455    mov         ebp,esp
 00588457    push        ebx
 00588458    push        esi
 00588459    push        edi
 0058845A    mov         eax,dword ptr [ebp+0C]
 0058845D    call        @IntfAddRef
 00588462    mov         eax,dword ptr [ebp+14]
 00588465    test        eax,eax
>00588467    je          0058846D
 00588469    xor         edx,edx
 0058846B    mov         dword ptr [eax],edx
 0058846D    push        dword ptr [ebp+8]
 00588470    xor         eax,eax
 00588472    push        ebp
 00588473    push        58849A
 00588478    push        dword ptr fs:[eax]
 0058847B    mov         dword ptr fs:[eax],esp
 0058847E    mov         edx,5884BC;'MSXML'
 00588483    mov         eax,5884D4;'importNode'
 00588488    call        DOMVendorNotSupported
 0058848D    xor         eax,eax
 0058848F    pop         edx
 00588490    pop         ecx
 00588491    pop         ecx
 00588492    mov         dword ptr fs:[eax],edx
 00588495    pop         eax
 00588496    xor         ebx,ebx
>00588498    jmp         0058849F
>0058849A    jmp         @HandleAutoException
 0058849F    lea         eax,[ebp+0C]
 005884A2    call        @IntfClear
 005884A7    mov         eax,ebx
 005884A9    pop         edi
 005884AA    pop         esi
 005884AB    pop         ebx
 005884AC    pop         ebp
 005884AD    ret         10
*}
end;

//005884EC
procedure TMSDOMDocument.set_documentElement(const IDOMElement:IDOMElement); safecall;
begin
{*
 005884EC    push        ebp
 005884ED    mov         ebp,esp
 005884EF    mov         ecx,4
 005884F4    push        0
 005884F6    push        0
 005884F8    dec         ecx
>005884F9    jne         005884F4
 005884FB    push        ecx
 005884FC    push        ebx
 005884FD    push        esi
 005884FE    push        edi
 005884FF    mov         esi,dword ptr [ebp+0C]
 00588502    mov         ebx,dword ptr [ebp+8]
 00588505    push        ebx
 00588506    xor         eax,eax
 00588508    push        ebp
 00588509    push        5885D3
 0058850E    push        dword ptr fs:[eax]
 00588511    mov         dword ptr fs:[eax],esp
 00588514    test        esi,esi
>00588516    je          00588553
 00588518    lea         edx,[ebp-8]
 0058851B    mov         eax,esi
 0058851D    call        GetMSNode
 00588522    mov         edx,dword ptr [ebp-8]
 00588525    lea         eax,[ebp-4]
 00588528    mov         ecx,588630
 0058852D    call        @IntfCast
 00588532    mov         eax,dword ptr [ebp-4]
 00588535    push        eax
 00588536    lea         edx,[ebp-0C]
 00588539    mov         eax,ebx
 0058853B    call        TMSDOMDocument.GetMSDocument
 00588540    mov         eax,dword ptr [ebp-0C]
 00588543    push        eax
 00588544    mov         eax,dword ptr [eax]
 00588546    call        dword ptr [eax+0B8]
 0058854C    call        @CheckAutoResult
>00588551    jmp         005885C6
 00588553    lea         eax,[ebp-10]
 00588556    call        @IntfClear
 0058855B    push        eax
 0058855C    lea         edx,[ebp-14]
 0058855F    mov         eax,ebx
 00588561    call        TMSDOMDocument.GetMSDocument
 00588566    mov         eax,dword ptr [ebp-14]
 00588569    push        eax
 0058856A    mov         eax,dword ptr [eax]
 0058856C    call        dword ptr [eax+0B4]
 00588572    call        @CheckAutoResult
 00588577    cmp         dword ptr [ebp-10],0
>0058857B    je          005885C6
 0058857D    lea         eax,[ebp-18]
 00588580    call        @IntfClear
 00588585    push        eax
 00588586    lea         eax,[ebp-1C]
 00588589    call        @IntfClear
 0058858E    push        eax
 0058858F    lea         edx,[ebp-20]
 00588592    mov         eax,ebx
 00588594    call        TMSDOMDocument.GetMSDocument
 00588599    mov         eax,dword ptr [ebp-20]
 0058859C    push        eax
 0058859D    mov         eax,dword ptr [eax]
 0058859F    call        dword ptr [eax+0B4]
 005885A5    call        @CheckAutoResult
 005885AA    mov         eax,dword ptr [ebp-1C]
 005885AD    push        eax
 005885AE    lea         edx,[ebp-24]
 005885B1    mov         eax,ebx
 005885B3    call        TMSDOMDocument.GetMSDocument
 005885B8    mov         eax,dword ptr [ebp-24]
 005885BB    push        eax
 005885BC    mov         eax,dword ptr [eax]
 005885BE    call        dword ptr [eax+50]
 005885C1    call        @CheckAutoResult
 005885C6    xor         eax,eax
 005885C8    pop         edx
 005885C9    pop         ecx
 005885CA    pop         ecx
 005885CB    mov         dword ptr fs:[eax],edx
 005885CE    pop         eax
 005885CF    xor         ebx,ebx
>005885D1    jmp         005885D8
>005885D3    jmp         @HandleAutoException
 005885D8    lea         eax,[ebp-24]
 005885DB    mov         edx,dword ptr ds:[580A94];IXMLDOMDocument
 005885E1    mov         ecx,2
 005885E6    call        @FinalizeArray
 005885EB    lea         eax,[ebp-1C]
 005885EE    call        @IntfClear
 005885F3    lea         eax,[ebp-18]
 005885F6    call        @IntfClear
 005885FB    lea         eax,[ebp-14]
 005885FE    call        @IntfClear
 00588603    lea         eax,[ebp-10]
 00588606    call        @IntfClear
 0058860B    lea         eax,[ebp-0C]
 0058860E    call        @IntfClear
 00588613    lea         eax,[ebp-8]
 00588616    call        @IntfClear
 0058861B    lea         eax,[ebp-4]
 0058861E    call        @IntfClear
 00588623    mov         eax,ebx
 00588625    pop         edi
 00588626    pop         esi
 00588627    pop         ebx
 00588628    mov         esp,ebp
 0058862A    pop         ebp
 0058862B    ret         8
*}
end;

//00588640
function TMSDOMDocument.get_async:Boolean; safecall;
begin
{*
 00588640    push        ebp
 00588641    mov         ebp,esp
 00588643    add         esp,0FFFFFFF8
 00588646    push        ebx
 00588647    push        esi
 00588648    push        edi
 00588649    xor         eax,eax
 0058864B    mov         dword ptr [ebp-8],eax
 0058864E    mov         ebx,dword ptr [ebp+8]
 00588651    push        ebx
 00588652    xor         eax,eax
 00588654    push        ebp
 00588655    push        588699
 0058865A    push        dword ptr fs:[eax]
 0058865D    mov         dword ptr fs:[eax],esp
 00588660    lea         eax,[ebp-4]
 00588663    push        eax
 00588664    lea         edx,[ebp-8]
 00588667    mov         eax,ebx
 00588669    call        TMSDOMDocument.GetMSDocument
 0058866E    mov         eax,dword ptr [ebp-8]
 00588671    push        eax
 00588672    mov         eax,dword ptr [eax]
 00588674    call        dword ptr [eax+0F8]
 0058867A    call        @CheckAutoResult
 0058867F    cmp         word ptr [ebp-4],1
 00588684    sbb         eax,eax
 00588686    inc         eax
 00588687    mov         edx,dword ptr [ebp+0C]
 0058868A    mov         byte ptr [edx],al
 0058868C    xor         eax,eax
 0058868E    pop         edx
 0058868F    pop         ecx
 00588690    pop         ecx
 00588691    mov         dword ptr fs:[eax],edx
 00588694    pop         eax
 00588695    xor         ebx,ebx
>00588697    jmp         0058869E
>00588699    jmp         @HandleAutoException
 0058869E    lea         eax,[ebp-8]
 005886A1    call        @IntfClear
 005886A6    mov         eax,ebx
 005886A8    pop         edi
 005886A9    pop         esi
 005886AA    pop         ebx
 005886AB    pop         ecx
 005886AC    pop         ecx
 005886AD    pop         ebp
 005886AE    ret         8
*}
end;

//005886B4
procedure TMSDOMDocument.set_async(Value:Boolean); safecall;
begin
{*
 005886B4    push        ebp
 005886B5    mov         ebp,esp
 005886B7    push        0
 005886B9    push        ebx
 005886BA    push        esi
 005886BB    push        edi
 005886BC    mov         ebx,dword ptr [ebp+8]
 005886BF    push        ebx
 005886C0    xor         eax,eax
 005886C2    push        ebp
 005886C3    push        5886FE
 005886C8    push        dword ptr fs:[eax]
 005886CB    mov         dword ptr fs:[eax],esp
 005886CE    cmp         byte ptr [ebp+0C],1
 005886D2    cmc
 005886D3    sbb         eax,eax
 005886D5    push        eax
 005886D6    lea         edx,[ebp-4]
 005886D9    mov         eax,ebx
 005886DB    call        TMSDOMDocument.GetMSDocument
 005886E0    mov         eax,dword ptr [ebp-4]
 005886E3    push        eax
 005886E4    mov         eax,dword ptr [eax]
 005886E6    call        dword ptr [eax+0FC]
 005886EC    call        @CheckAutoResult
 005886F1    xor         eax,eax
 005886F3    pop         edx
 005886F4    pop         ecx
 005886F5    pop         ecx
 005886F6    mov         dword ptr fs:[eax],edx
 005886F9    pop         eax
 005886FA    xor         ebx,ebx
>005886FC    jmp         00588703
>005886FE    jmp         @HandleAutoException
 00588703    lea         eax,[ebp-4]
 00588706    call        @IntfClear
 0058870B    mov         eax,ebx
 0058870D    pop         edi
 0058870E    pop         esi
 0058870F    pop         ebx
 00588710    pop         ecx
 00588711    pop         ebp
 00588712    ret         8
*}
end;

//00588718
function TMSDOMDocument.get_preserveWhiteSpace:Boolean; safecall;
begin
{*
 00588718    push        ebp
 00588719    mov         ebp,esp
 0058871B    add         esp,0FFFFFFF8
 0058871E    push        ebx
 0058871F    push        esi
 00588720    push        edi
 00588721    xor         eax,eax
 00588723    mov         dword ptr [ebp-8],eax
 00588726    mov         ebx,dword ptr [ebp+8]
 00588729    push        ebx
 0058872A    xor         eax,eax
 0058872C    push        ebp
 0058872D    push        588771
 00588732    push        dword ptr fs:[eax]
 00588735    mov         dword ptr fs:[eax],esp
 00588738    lea         eax,[ebp-4]
 0058873B    push        eax
 0058873C    lea         edx,[ebp-8]
 0058873F    mov         eax,ebx
 00588741    call        TMSDOMDocument.GetMSDocument
 00588746    mov         eax,dword ptr [ebp-8]
 00588749    push        eax
 0058874A    mov         eax,dword ptr [eax]
 0058874C    call        dword ptr [eax+11C]
 00588752    call        @CheckAutoResult
 00588757    cmp         word ptr [ebp-4],1
 0058875C    sbb         eax,eax
 0058875E    inc         eax
 0058875F    mov         edx,dword ptr [ebp+0C]
 00588762    mov         byte ptr [edx],al
 00588764    xor         eax,eax
 00588766    pop         edx
 00588767    pop         ecx
 00588768    pop         ecx
 00588769    mov         dword ptr fs:[eax],edx
 0058876C    pop         eax
 0058876D    xor         ebx,ebx
>0058876F    jmp         00588776
>00588771    jmp         @HandleAutoException
 00588776    lea         eax,[ebp-8]
 00588779    call        @IntfClear
 0058877E    mov         eax,ebx
 00588780    pop         edi
 00588781    pop         esi
 00588782    pop         ebx
 00588783    pop         ecx
 00588784    pop         ecx
 00588785    pop         ebp
 00588786    ret         8
*}
end;

//0058878C
function TMSDOMDocument.get_resolveExternals:Boolean; safecall;
begin
{*
 0058878C    push        ebp
 0058878D    mov         ebp,esp
 0058878F    add         esp,0FFFFFFF8
 00588792    push        ebx
 00588793    push        esi
 00588794    push        edi
 00588795    xor         eax,eax
 00588797    mov         dword ptr [ebp-8],eax
 0058879A    mov         ebx,dword ptr [ebp+8]
 0058879D    push        ebx
 0058879E    xor         eax,eax
 005887A0    push        ebp
 005887A1    push        5887E5
 005887A6    push        dword ptr fs:[eax]
 005887A9    mov         dword ptr fs:[eax],esp
 005887AC    lea         eax,[ebp-4]
 005887AF    push        eax
 005887B0    lea         edx,[ebp-8]
 005887B3    mov         eax,ebx
 005887B5    call        TMSDOMDocument.GetMSDocument
 005887BA    mov         eax,dword ptr [ebp-8]
 005887BD    push        eax
 005887BE    mov         eax,dword ptr [eax]
 005887C0    call        dword ptr [eax+114]
 005887C6    call        @CheckAutoResult
 005887CB    cmp         word ptr [ebp-4],1
 005887D0    sbb         eax,eax
 005887D2    inc         eax
 005887D3    mov         edx,dword ptr [ebp+0C]
 005887D6    mov         byte ptr [edx],al
 005887D8    xor         eax,eax
 005887DA    pop         edx
 005887DB    pop         ecx
 005887DC    pop         ecx
 005887DD    mov         dword ptr fs:[eax],edx
 005887E0    pop         eax
 005887E1    xor         ebx,ebx
>005887E3    jmp         005887EA
>005887E5    jmp         @HandleAutoException
 005887EA    lea         eax,[ebp-8]
 005887ED    call        @IntfClear
 005887F2    mov         eax,ebx
 005887F4    pop         edi
 005887F5    pop         esi
 005887F6    pop         ebx
 005887F7    pop         ecx
 005887F8    pop         ecx
 005887F9    pop         ebp
 005887FA    ret         8
*}
end;

//00588800
function TMSDOMDocument.get_validate:Boolean; safecall;
begin
{*
 00588800    push        ebp
 00588801    mov         ebp,esp
 00588803    add         esp,0FFFFFFF8
 00588806    push        ebx
 00588807    push        esi
 00588808    push        edi
 00588809    xor         eax,eax
 0058880B    mov         dword ptr [ebp-8],eax
 0058880E    mov         ebx,dword ptr [ebp+8]
 00588811    push        ebx
 00588812    xor         eax,eax
 00588814    push        ebp
 00588815    push        588859
 0058881A    push        dword ptr fs:[eax]
 0058881D    mov         dword ptr fs:[eax],esp
 00588820    lea         eax,[ebp-4]
 00588823    push        eax
 00588824    lea         edx,[ebp-8]
 00588827    mov         eax,ebx
 00588829    call        TMSDOMDocument.GetMSDocument
 0058882E    mov         eax,dword ptr [ebp-8]
 00588831    push        eax
 00588832    mov         eax,dword ptr [eax]
 00588834    call        dword ptr [eax+10C]
 0058883A    call        @CheckAutoResult
 0058883F    cmp         word ptr [ebp-4],1
 00588844    sbb         eax,eax
 00588846    inc         eax
 00588847    mov         edx,dword ptr [ebp+0C]
 0058884A    mov         byte ptr [edx],al
 0058884C    xor         eax,eax
 0058884E    pop         edx
 0058884F    pop         ecx
 00588850    pop         ecx
 00588851    mov         dword ptr fs:[eax],edx
 00588854    pop         eax
 00588855    xor         ebx,ebx
>00588857    jmp         0058885E
>00588859    jmp         @HandleAutoException
 0058885E    lea         eax,[ebp-8]
 00588861    call        @IntfClear
 00588866    mov         eax,ebx
 00588868    pop         edi
 00588869    pop         esi
 0058886A    pop         ebx
 0058886B    pop         ecx
 0058886C    pop         ecx
 0058886D    pop         ebp
 0058886E    ret         8
*}
end;

//00588874
procedure TMSDOMDocument.set_preserveWhiteSpace(Value:Boolean); safecall;
begin
{*
 00588874    push        ebp
 00588875    mov         ebp,esp
 00588877    push        0
 00588879    push        ebx
 0058887A    push        esi
 0058887B    push        edi
 0058887C    mov         ebx,dword ptr [ebp+8]
 0058887F    push        ebx
 00588880    xor         eax,eax
 00588882    push        ebp
 00588883    push        5888BE
 00588888    push        dword ptr fs:[eax]
 0058888B    mov         dword ptr fs:[eax],esp
 0058888E    cmp         byte ptr [ebp+0C],1
 00588892    cmc
 00588893    sbb         eax,eax
 00588895    push        eax
 00588896    lea         edx,[ebp-4]
 00588899    mov         eax,ebx
 0058889B    call        TMSDOMDocument.GetMSDocument
 005888A0    mov         eax,dword ptr [ebp-4]
 005888A3    push        eax
 005888A4    mov         eax,dword ptr [eax]
 005888A6    call        dword ptr [eax+120]
 005888AC    call        @CheckAutoResult
 005888B1    xor         eax,eax
 005888B3    pop         edx
 005888B4    pop         ecx
 005888B5    pop         ecx
 005888B6    mov         dword ptr fs:[eax],edx
 005888B9    pop         eax
 005888BA    xor         ebx,ebx
>005888BC    jmp         005888C3
>005888BE    jmp         @HandleAutoException
 005888C3    lea         eax,[ebp-4]
 005888C6    call        @IntfClear
 005888CB    mov         eax,ebx
 005888CD    pop         edi
 005888CE    pop         esi
 005888CF    pop         ebx
 005888D0    pop         ecx
 005888D1    pop         ebp
 005888D2    ret         8
*}
end;

//005888D8
procedure TMSDOMDocument.set_resolveExternals(Value:Boolean); safecall;
begin
{*
 005888D8    push        ebp
 005888D9    mov         ebp,esp
 005888DB    push        0
 005888DD    push        ebx
 005888DE    push        esi
 005888DF    push        edi
 005888E0    mov         ebx,dword ptr [ebp+8]
 005888E3    push        ebx
 005888E4    xor         eax,eax
 005888E6    push        ebp
 005888E7    push        588922
 005888EC    push        dword ptr fs:[eax]
 005888EF    mov         dword ptr fs:[eax],esp
 005888F2    cmp         byte ptr [ebp+0C],1
 005888F6    cmc
 005888F7    sbb         eax,eax
 005888F9    push        eax
 005888FA    lea         edx,[ebp-4]
 005888FD    mov         eax,ebx
 005888FF    call        TMSDOMDocument.GetMSDocument
 00588904    mov         eax,dword ptr [ebp-4]
 00588907    push        eax
 00588908    mov         eax,dword ptr [eax]
 0058890A    call        dword ptr [eax+118]
 00588910    call        @CheckAutoResult
 00588915    xor         eax,eax
 00588917    pop         edx
 00588918    pop         ecx
 00588919    pop         ecx
 0058891A    mov         dword ptr fs:[eax],edx
 0058891D    pop         eax
 0058891E    xor         ebx,ebx
>00588920    jmp         00588927
>00588922    jmp         @HandleAutoException
 00588927    lea         eax,[ebp-4]
 0058892A    call        @IntfClear
 0058892F    mov         eax,ebx
 00588931    pop         edi
 00588932    pop         esi
 00588933    pop         ebx
 00588934    pop         ecx
 00588935    pop         ebp
 00588936    ret         8
*}
end;

//0058893C
procedure TMSDOMDocument.set_validate(Value:Boolean); safecall;
begin
{*
 0058893C    push        ebp
 0058893D    mov         ebp,esp
 0058893F    push        0
 00588941    push        ebx
 00588942    push        esi
 00588943    push        edi
 00588944    mov         ebx,dword ptr [ebp+8]
 00588947    push        ebx
 00588948    xor         eax,eax
 0058894A    push        ebp
 0058894B    push        588986
 00588950    push        dword ptr fs:[eax]
 00588953    mov         dword ptr fs:[eax],esp
 00588956    cmp         byte ptr [ebp+0C],1
 0058895A    cmc
 0058895B    sbb         eax,eax
 0058895D    push        eax
 0058895E    lea         edx,[ebp-4]
 00588961    mov         eax,ebx
 00588963    call        TMSDOMDocument.GetMSDocument
 00588968    mov         eax,dword ptr [ebp-4]
 0058896B    push        eax
 0058896C    mov         eax,dword ptr [eax]
 0058896E    call        dword ptr [eax+110]
 00588974    call        @CheckAutoResult
 00588979    xor         eax,eax
 0058897B    pop         edx
 0058897C    pop         ecx
 0058897D    pop         ecx
 0058897E    mov         dword ptr fs:[eax],edx
 00588981    pop         eax
 00588982    xor         ebx,ebx
>00588984    jmp         0058898B
>00588986    jmp         @HandleAutoException
 0058898B    lea         eax,[ebp-4]
 0058898E    call        @IntfClear
 00588993    mov         eax,ebx
 00588995    pop         edi
 00588996    pop         esi
 00588997    pop         ebx
 00588998    pop         ecx
 00588999    pop         ebp
 0058899A    ret         8
*}
end;

//005889A0
function TMSDOMDocument.asyncLoadState:Integer; safecall;
begin
{*
 005889A0    push        ebp
 005889A1    mov         ebp,esp
 005889A3    add         esp,0FFFFFFF8
 005889A6    push        ebx
 005889A7    push        esi
 005889A8    push        edi
 005889A9    xor         eax,eax
 005889AB    mov         dword ptr [ebp-8],eax
 005889AE    mov         ebx,dword ptr [ebp+8]
 005889B1    push        ebx
 005889B2    xor         eax,eax
 005889B4    push        ebp
 005889B5    push        5889F4
 005889BA    push        dword ptr fs:[eax]
 005889BD    mov         dword ptr fs:[eax],esp
 005889C0    lea         eax,[ebp-4]
 005889C3    push        eax
 005889C4    lea         edx,[ebp-8]
 005889C7    mov         eax,ebx
 005889C9    call        TMSDOMDocument.GetMSDocument
 005889CE    mov         eax,dword ptr [ebp-8]
 005889D1    push        eax
 005889D2    mov         eax,dword ptr [eax]
 005889D4    call        dword ptr [eax+0EC]
 005889DA    call        @CheckAutoResult
 005889DF    mov         eax,dword ptr [ebp-4]
 005889E2    mov         edx,dword ptr [ebp+0C]
 005889E5    mov         dword ptr [edx],eax
 005889E7    xor         eax,eax
 005889E9    pop         edx
 005889EA    pop         ecx
 005889EB    pop         ecx
 005889EC    mov         dword ptr fs:[eax],edx
 005889EF    pop         eax
 005889F0    xor         ebx,ebx
>005889F2    jmp         005889F9
>005889F4    jmp         @HandleAutoException
 005889F9    lea         eax,[ebp-8]
 005889FC    call        @IntfClear
 00588A01    mov         eax,ebx
 00588A03    pop         edi
 00588A04    pop         esi
 00588A05    pop         ebx
 00588A06    pop         ecx
 00588A07    pop         ecx
 00588A08    pop         ebp
 00588A09    ret         8
*}
end;

//00588A0C
function TMSDOMDocument.get_xml:DOMString; safecall;
begin
{*
 00588A0C    push        ebp
 00588A0D    mov         ebp,esp
 00588A0F    push        0
 00588A11    push        0
 00588A13    push        ebx
 00588A14    push        esi
 00588A15    push        edi
 00588A16    mov         ebx,dword ptr [ebp+8]
 00588A19    mov         eax,dword ptr [ebp+0C]
 00588A1C    test        eax,eax
>00588A1E    je          00588A24
 00588A20    xor         edx,edx
 00588A22    mov         dword ptr [eax],edx
 00588A24    push        ebx
 00588A25    xor         eax,eax
 00588A27    push        ebp
 00588A28    push        588A6F
 00588A2D    push        dword ptr fs:[eax]
 00588A30    mov         dword ptr fs:[eax],esp
 00588A33    lea         eax,[ebp-4]
 00588A36    call        @WStrClr
 00588A3B    push        eax
 00588A3C    lea         edx,[ebp-8]
 00588A3F    mov         eax,ebx
 00588A41    call        TMSDOMDocument.GetMSDocument
 00588A46    mov         eax,dword ptr [ebp-8]
 00588A49    push        eax
 00588A4A    mov         eax,dword ptr [eax]
 00588A4C    call        dword ptr [eax+88]
 00588A52    call        @CheckAutoResult
 00588A57    mov         edx,dword ptr [ebp-4]
 00588A5A    mov         eax,dword ptr [ebp+0C]
 00588A5D    call        @UStrFromWStr
 00588A62    xor         eax,eax
 00588A64    pop         edx
 00588A65    pop         ecx
 00588A66    pop         ecx
 00588A67    mov         dword ptr fs:[eax],edx
 00588A6A    pop         eax
 00588A6B    xor         ebx,ebx
>00588A6D    jmp         00588A74
>00588A6F    jmp         @HandleAutoException
 00588A74    lea         eax,[ebp-8]
 00588A77    call        @IntfClear
 00588A7C    lea         eax,[ebp-4]
 00588A7F    call        @WStrClr
 00588A84    mov         eax,ebx
 00588A86    pop         edi
 00588A87    pop         esi
 00588A88    pop         ebx
 00588A89    pop         ecx
 00588A8A    pop         ecx
 00588A8B    pop         ebp
 00588A8C    ret         8
*}
end;

//00588A90
function TMSDOMDocument.load(source:OleVariant):WordBool; safecall;
begin
{*
 00588A90    push        ebp
 00588A91    mov         ebp,esp
 00588A93    add         esp,0FFFFFFF8
 00588A96    push        ebx
 00588A97    push        esi
 00588A98    push        edi
 00588A99    xor         eax,eax
 00588A9B    mov         dword ptr [ebp-8],eax
 00588A9E    mov         ebx,dword ptr [ebp+8]
 00588AA1    lea         eax,[ebp+0C]
 00588AA4    call        @VarAddRef
 00588AA9    push        ebx
 00588AAA    xor         eax,eax
 00588AAC    push        ebp
 00588AAD    push        588AFA
 00588AB2    push        dword ptr fs:[eax]
 00588AB5    mov         dword ptr fs:[eax],esp
 00588AB8    lea         eax,[ebp-4]
 00588ABB    push        eax
 00588ABC    push        dword ptr [ebp+18]
 00588ABF    push        dword ptr [ebp+14]
 00588AC2    push        dword ptr [ebp+10]
 00588AC5    push        dword ptr [ebp+0C]
 00588AC8    lea         edx,[ebp-8]
 00588ACB    mov         eax,ebx
 00588ACD    call        TMSDOMDocument.GetMSDocument
 00588AD2    mov         eax,dword ptr [ebp-8]
 00588AD5    push        eax
 00588AD6    mov         eax,dword ptr [eax]
 00588AD8    call        dword ptr [eax+0E8]
 00588ADE    call        @CheckAutoResult
 00588AE3    movzx       eax,word ptr [ebp-4]
 00588AE7    mov         edx,dword ptr [ebp+1C]
 00588AEA    mov         word ptr [edx],ax
 00588AED    xor         eax,eax
 00588AEF    pop         edx
 00588AF0    pop         ecx
 00588AF1    pop         ecx
 00588AF2    mov         dword ptr fs:[eax],edx
 00588AF5    pop         eax
 00588AF6    xor         ebx,ebx
>00588AF8    jmp         00588AFF
>00588AFA    jmp         @HandleAutoException
 00588AFF    lea         eax,[ebp-8]
 00588B02    call        @IntfClear
 00588B07    lea         eax,[ebp+0C]
 00588B0A    call        @VarClr
 00588B0F    mov         eax,ebx
 00588B11    pop         edi
 00588B12    pop         esi
 00588B13    pop         ebx
 00588B14    pop         ecx
 00588B15    pop         ecx
 00588B16    pop         ebp
 00588B17    ret         18
*}
end;

//00588B1C
function TMSDOMDocument.loadFromStream(const stream:TStream):WordBool; safecall;
begin
{*
 00588B1C    push        ebp
 00588B1D    mov         ebp,esp
 00588B1F    xor         ecx,ecx
 00588B21    push        ecx
 00588B22    push        ecx
 00588B23    push        ecx
 00588B24    push        ecx
 00588B25    push        ecx
 00588B26    push        ecx
 00588B27    push        ecx
 00588B28    push        ebx
 00588B29    push        esi
 00588B2A    push        edi
 00588B2B    mov         ebx,dword ptr [ebp+8]
 00588B2E    push        ebx
 00588B2F    xor         eax,eax
 00588B31    push        ebp
 00588B32    push        588BAC
 00588B37    push        dword ptr fs:[eax]
 00588B3A    mov         dword ptr fs:[eax],esp
 00588B3D    push        0
 00588B3F    mov         ecx,dword ptr [ebp+0C]
 00588B42    mov         dl,1
 00588B44    mov         eax,[0043E568];TStreamAdapter
 00588B49    call        TStreamAdapter.Create
 00588B4E    mov         edx,eax
 00588B50    test        edx,edx
>00588B52    je          00588B57
 00588B54    sub         edx,0FFFFFFEC
 00588B57    lea         eax,[ebp-4]
 00588B5A    call        @IntfCopy
 00588B5F    lea         eax,[ebp-8]
 00588B62    push        eax
 00588B63    lea         eax,[ebp-18]
 00588B66    mov         edx,dword ptr [ebp-4]
 00588B69    call        @VarFromIntf
 00588B6E    push        dword ptr [ebp-0C]
 00588B71    push        dword ptr [ebp-10]
 00588B74    push        dword ptr [ebp-14]
 00588B77    push        dword ptr [ebp-18]
 00588B7A    lea         edx,[ebp-1C]
 00588B7D    mov         eax,ebx
 00588B7F    call        TMSDOMDocument.GetMSDocument
 00588B84    mov         eax,dword ptr [ebp-1C]
 00588B87    push        eax
 00588B88    mov         eax,dword ptr [eax]
 00588B8A    call        dword ptr [eax+0E8]
 00588B90    call        @CheckAutoResult
 00588B95    movzx       eax,word ptr [ebp-8]
 00588B99    mov         edx,dword ptr [ebp+10]
 00588B9C    mov         word ptr [edx],ax
 00588B9F    xor         eax,eax
 00588BA1    pop         edx
 00588BA2    pop         ecx
 00588BA3    pop         ecx
 00588BA4    mov         dword ptr fs:[eax],edx
 00588BA7    pop         eax
 00588BA8    xor         ebx,ebx
>00588BAA    jmp         00588BB1
>00588BAC    jmp         @HandleAutoException
 00588BB1    lea         eax,[ebp-1C]
 00588BB4    call        @IntfClear
 00588BB9    lea         eax,[ebp-18]
 00588BBC    call        @VarClr
 00588BC1    lea         eax,[ebp-4]
 00588BC4    call        @IntfClear
 00588BC9    mov         eax,ebx
 00588BCB    pop         edi
 00588BCC    pop         esi
 00588BCD    pop         ebx
 00588BCE    mov         esp,ebp
 00588BD0    pop         ebp
 00588BD1    ret         0C
*}
end;

//00588BD4
procedure TMSDOMDocument.save(destination:OleVariant); safecall;
begin
{*
 00588BD4    push        ebp
 00588BD5    mov         ebp,esp
 00588BD7    push        0
 00588BD9    push        ebx
 00588BDA    push        esi
 00588BDB    push        edi
 00588BDC    mov         ebx,dword ptr [ebp+8]
 00588BDF    lea         eax,[ebp+0C]
 00588BE2    call        @VarAddRef
 00588BE7    push        ebx
 00588BE8    xor         eax,eax
 00588BEA    push        ebp
 00588BEB    push        588C2A
 00588BF0    push        dword ptr fs:[eax]
 00588BF3    mov         dword ptr fs:[eax],esp
 00588BF6    push        dword ptr [ebp+18]
 00588BF9    push        dword ptr [ebp+14]
 00588BFC    push        dword ptr [ebp+10]
 00588BFF    push        dword ptr [ebp+0C]
 00588C02    lea         edx,[ebp-4]
 00588C05    mov         eax,ebx
 00588C07    call        TMSDOMDocument.GetMSDocument
 00588C0C    mov         eax,dword ptr [ebp-4]
 00588C0F    push        eax
 00588C10    mov         eax,dword ptr [eax]
 00588C12    call        dword ptr [eax+108]
 00588C18    call        @CheckAutoResult
 00588C1D    xor         eax,eax
 00588C1F    pop         edx
 00588C20    pop         ecx
 00588C21    pop         ecx
 00588C22    mov         dword ptr fs:[eax],edx
 00588C25    pop         eax
 00588C26    xor         ebx,ebx
>00588C28    jmp         00588C2F
>00588C2A    jmp         @HandleAutoException
 00588C2F    lea         eax,[ebp-4]
 00588C32    call        @IntfClear
 00588C37    lea         eax,[ebp+0C]
 00588C3A    call        @VarClr
 00588C3F    mov         eax,ebx
 00588C41    pop         edi
 00588C42    pop         esi
 00588C43    pop         ebx
 00588C44    pop         ecx
 00588C45    pop         ebp
 00588C46    ret         14
*}
end;

//00588C4C
procedure TMSDOMDocument.saveToStream(const stream:TStream); safecall;
begin
{*
 00588C4C    push        ebp
 00588C4D    mov         ebp,esp
 00588C4F    xor         ecx,ecx
 00588C51    push        ecx
 00588C52    push        ecx
 00588C53    push        ecx
 00588C54    push        ecx
 00588C55    push        ecx
 00588C56    push        ecx
 00588C57    push        ebx
 00588C58    push        esi
 00588C59    push        edi
 00588C5A    mov         ebx,dword ptr [ebp+8]
 00588C5D    push        ebx
 00588C5E    xor         eax,eax
 00588C60    push        ebp
 00588C61    push        588CCD
 00588C66    push        dword ptr fs:[eax]
 00588C69    mov         dword ptr fs:[eax],esp
 00588C6C    push        0
 00588C6E    mov         ecx,dword ptr [ebp+0C]
 00588C71    mov         dl,1
 00588C73    mov         eax,[0043E568];TStreamAdapter
 00588C78    call        TStreamAdapter.Create
 00588C7D    mov         edx,eax
 00588C7F    test        edx,edx
>00588C81    je          00588C86
 00588C83    sub         edx,0FFFFFFEC
 00588C86    lea         eax,[ebp-4]
 00588C89    call        @IntfCopy
 00588C8E    lea         eax,[ebp-14]
 00588C91    mov         edx,dword ptr [ebp-4]
 00588C94    call        @VarFromIntf
 00588C99    push        dword ptr [ebp-8]
 00588C9C    push        dword ptr [ebp-0C]
 00588C9F    push        dword ptr [ebp-10]
 00588CA2    push        dword ptr [ebp-14]
 00588CA5    lea         edx,[ebp-18]
 00588CA8    mov         eax,ebx
 00588CAA    call        TMSDOMDocument.GetMSDocument
 00588CAF    mov         eax,dword ptr [ebp-18]
 00588CB2    push        eax
 00588CB3    mov         eax,dword ptr [eax]
 00588CB5    call        dword ptr [eax+108]
 00588CBB    call        @CheckAutoResult
 00588CC0    xor         eax,eax
 00588CC2    pop         edx
 00588CC3    pop         ecx
 00588CC4    pop         ecx
 00588CC5    mov         dword ptr fs:[eax],edx
 00588CC8    pop         eax
 00588CC9    xor         ebx,ebx
>00588CCB    jmp         00588CD2
>00588CCD    jmp         @HandleAutoException
 00588CD2    lea         eax,[ebp-18]
 00588CD5    call        @IntfClear
 00588CDA    lea         eax,[ebp-14]
 00588CDD    call        @VarClr
 00588CE2    lea         eax,[ebp-4]
 00588CE5    call        @IntfClear
 00588CEA    mov         eax,ebx
 00588CEC    pop         edi
 00588CED    pop         esi
 00588CEE    pop         ebx
 00588CEF    mov         esp,ebp
 00588CF1    pop         ebp
 00588CF2    ret         8
*}
end;

//00588CF8
function TMSDOMDocument.loadxml(const Value:WideString):WordBool; safecall;
begin
{*
 00588CF8    push        ebp
 00588CF9    mov         ebp,esp
 00588CFB    add         esp,0FFFFFFF8
 00588CFE    push        ebx
 00588CFF    push        esi
 00588D00    push        edi
 00588D01    xor         eax,eax
 00588D03    mov         dword ptr [ebp-8],eax
 00588D06    mov         ebx,dword ptr [ebp+8]
 00588D09    push        ebx
 00588D0A    xor         eax,eax
 00588D0C    push        ebp
 00588D0D    push        588D52
 00588D12    push        dword ptr fs:[eax]
 00588D15    mov         dword ptr fs:[eax],esp
 00588D18    lea         eax,[ebp-4]
 00588D1B    push        eax
 00588D1C    mov         eax,dword ptr [ebp+0C]
 00588D1F    push        eax
 00588D20    lea         edx,[ebp-8]
 00588D23    mov         eax,ebx
 00588D25    call        TMSDOMDocument.GetMSDocument
 00588D2A    mov         eax,dword ptr [ebp-8]
 00588D2D    push        eax
 00588D2E    mov         eax,dword ptr [eax]
 00588D30    call        dword ptr [eax+104]
 00588D36    call        @CheckAutoResult
 00588D3B    movzx       eax,word ptr [ebp-4]
 00588D3F    mov         edx,dword ptr [ebp+10]
 00588D42    mov         word ptr [edx],ax
 00588D45    xor         eax,eax
 00588D47    pop         edx
 00588D48    pop         ecx
 00588D49    pop         ecx
 00588D4A    mov         dword ptr fs:[eax],edx
 00588D4D    pop         eax
 00588D4E    xor         ebx,ebx
>00588D50    jmp         00588D57
>00588D52    jmp         @HandleAutoException
 00588D57    lea         eax,[ebp-8]
 00588D5A    call        @IntfClear
 00588D5F    mov         eax,ebx
 00588D61    pop         edi
 00588D62    pop         esi
 00588D63    pop         ebx
 00588D64    pop         ecx
 00588D65    pop         ecx
 00588D66    pop         ebp
 00588D67    ret         0C
*}
end;

//00588D6C
procedure TMSDOMDocument.set_OnAsyncLoad(const Sender:TObject; EventHandler:TAsyncEventHandler); safecall;
begin
{*
 00588D6C    push        ebp
 00588D6D    mov         ebp,esp
 00588D6F    mov         ecx,5
 00588D74    push        0
 00588D76    push        0
 00588D78    dec         ecx
>00588D79    jne         00588D74
 00588D7B    push        ecx
 00588D7C    push        ebx
 00588D7D    push        esi
 00588D7E    push        edi
 00588D7F    mov         ebx,dword ptr [ebp+8]
 00588D82    push        ebx
 00588D83    xor         eax,eax
 00588D85    push        ebp
 00588D86    push        588E3D
 00588D8B    push        dword ptr fs:[eax]
 00588D8E    mov         dword ptr fs:[eax],esp
 00588D91    cmp         word ptr [ebp+12],0
>00588D96    je          00588DFA
 00588D98    push        dword ptr [ebp+14]
 00588D9B    push        dword ptr [ebp+10]
 00588D9E    mov         eax,dword ptr [ebp+0C]
 00588DA1    push        eax
 00588DA2    mov         ecx,ebx
 00588DA4    mov         dl,1
 00588DA6    mov         eax,[00583788];TMSDOMEventHandler
 00588DAB    call        TMSDOMEventHandler.Create
 00588DB0    mov         edx,eax
 00588DB2    test        edx,edx
>00588DB4    je          00588DB9
 00588DB6    sub         edx,0FFFFFFF8
 00588DB9    lea         eax,[ebp-14]
 00588DBC    mov         ecx,588E78
 00588DC1    call        @IntfCast
 00588DC6    mov         edx,dword ptr [ebp-14]
 00588DC9    lea         eax,[ebp-10]
 00588DCC    call        @VarFromDisp
 00588DD1    push        dword ptr [ebp-4]
 00588DD4    push        dword ptr [ebp-8]
 00588DD7    push        dword ptr [ebp-0C]
 00588DDA    push        dword ptr [ebp-10]
 00588DDD    lea         edx,[ebp-18]
 00588DE0    mov         eax,ebx
 00588DE2    call        TMSDOMDocument.GetMSDocument
 00588DE7    mov         eax,dword ptr [ebp-18]
 00588DEA    push        eax
 00588DEB    mov         eax,dword ptr [eax]
 00588DED    call        dword ptr [eax+124]
 00588DF3    call        @CheckAutoResult
>00588DF8    jmp         00588E30
 00588DFA    lea         eax,[ebp-28]
 00588DFD    mov         edx,1
 00588E02    mov         cl,1
 00588E04    call        @OleVarFromInt
 00588E09    push        dword ptr [ebp-1C]
 00588E0C    push        dword ptr [ebp-20]
 00588E0F    push        dword ptr [ebp-24]
 00588E12    push        dword ptr [ebp-28]
 00588E15    lea         edx,[ebp-2C]
 00588E18    mov         eax,ebx
 00588E1A    call        TMSDOMDocument.GetMSDocument
 00588E1F    mov         eax,dword ptr [ebp-2C]
 00588E22    push        eax
 00588E23    mov         eax,dword ptr [eax]
 00588E25    call        dword ptr [eax+124]
 00588E2B    call        @CheckAutoResult
 00588E30    xor         eax,eax
 00588E32    pop         edx
 00588E33    pop         ecx
 00588E34    pop         ecx
 00588E35    mov         dword ptr fs:[eax],edx
 00588E38    pop         eax
 00588E39    xor         ebx,ebx
>00588E3B    jmp         00588E42
>00588E3D    jmp         @HandleAutoException
 00588E42    lea         eax,[ebp-2C]
 00588E45    call        @IntfClear
 00588E4A    lea         eax,[ebp-28]
 00588E4D    call        @VarClr
 00588E52    lea         eax,[ebp-18]
 00588E55    call        @IntfClear
 00588E5A    lea         eax,[ebp-14]
 00588E5D    call        @IntfClear
 00588E62    lea         eax,[ebp-10]
 00588E65    call        @VarClr
 00588E6A    mov         eax,ebx
 00588E6C    pop         edi
 00588E6D    pop         esi
 00588E6E    pop         ebx
 00588E6F    mov         esp,ebp
 00588E71    pop         ebp
 00588E72    ret         10
*}
end;

//00588E88
function TMSDOMDocument.loadFromStream(const stream:IStream):WordBool; safecall;
begin
{*
 00588E88    push        ebp
 00588E89    mov         ebp,esp
 00588E8B    xor         ecx,ecx
 00588E8D    push        ecx
 00588E8E    push        ecx
 00588E8F    push        ecx
 00588E90    push        ecx
 00588E91    push        ecx
 00588E92    push        ecx
 00588E93    push        ebx
 00588E94    push        esi
 00588E95    push        edi
 00588E96    mov         ebx,dword ptr [ebp+8]
 00588E99    push        ebx
 00588E9A    xor         eax,eax
 00588E9C    push        ebp
 00588E9D    push        588EF5
 00588EA2    push        dword ptr fs:[eax]
 00588EA5    mov         dword ptr fs:[eax],esp
 00588EA8    lea         eax,[ebp-4]
 00588EAB    push        eax
 00588EAC    lea         eax,[ebp-14]
 00588EAF    mov         edx,dword ptr [ebp+0C]
 00588EB2    call        @VarFromIntf
 00588EB7    push        dword ptr [ebp-8]
 00588EBA    push        dword ptr [ebp-0C]
 00588EBD    push        dword ptr [ebp-10]
 00588EC0    push        dword ptr [ebp-14]
 00588EC3    lea         edx,[ebp-18]
 00588EC6    mov         eax,ebx
 00588EC8    call        TMSDOMDocument.GetMSDocument
 00588ECD    mov         eax,dword ptr [ebp-18]
 00588ED0    push        eax
 00588ED1    mov         eax,dword ptr [eax]
 00588ED3    call        dword ptr [eax+0E8]
 00588ED9    call        @CheckAutoResult
 00588EDE    movzx       eax,word ptr [ebp-4]
 00588EE2    mov         edx,dword ptr [ebp+10]
 00588EE5    mov         word ptr [edx],ax
 00588EE8    xor         eax,eax
 00588EEA    pop         edx
 00588EEB    pop         ecx
 00588EEC    pop         ecx
 00588EED    mov         dword ptr fs:[eax],edx
 00588EF0    pop         eax
 00588EF1    xor         ebx,ebx
>00588EF3    jmp         00588EFA
>00588EF5    jmp         @HandleAutoException
 00588EFA    lea         eax,[ebp-18]
 00588EFD    call        @IntfClear
 00588F02    lea         eax,[ebp-14]
 00588F05    call        @VarClr
 00588F0A    mov         eax,ebx
 00588F0C    pop         edi
 00588F0D    pop         esi
 00588F0E    pop         ebx
 00588F0F    mov         esp,ebp
 00588F11    pop         ebp
 00588F12    ret         0C
*}
end;

//00588F18
procedure TMSDOMDocument.saveToStream(const stream:IStream); safecall;
begin
{*
 00588F18    push        ebp
 00588F19    mov         ebp,esp
 00588F1B    xor         ecx,ecx
 00588F1D    push        ecx
 00588F1E    push        ecx
 00588F1F    push        ecx
 00588F20    push        ecx
 00588F21    push        ecx
 00588F22    push        ebx
 00588F23    push        esi
 00588F24    push        edi
 00588F25    mov         ebx,dword ptr [ebp+8]
 00588F28    push        ebx
 00588F29    xor         eax,eax
 00588F2B    push        ebp
 00588F2C    push        588F76
 00588F31    push        dword ptr fs:[eax]
 00588F34    mov         dword ptr fs:[eax],esp
 00588F37    lea         eax,[ebp-10]
 00588F3A    mov         edx,dword ptr [ebp+0C]
 00588F3D    call        @VarFromIntf
 00588F42    push        dword ptr [ebp-4]
 00588F45    push        dword ptr [ebp-8]
 00588F48    push        dword ptr [ebp-0C]
 00588F4B    push        dword ptr [ebp-10]
 00588F4E    lea         edx,[ebp-14]
 00588F51    mov         eax,ebx
 00588F53    call        TMSDOMDocument.GetMSDocument
 00588F58    mov         eax,dword ptr [ebp-14]
 00588F5B    push        eax
 00588F5C    mov         eax,dword ptr [eax]
 00588F5E    call        dword ptr [eax+108]
 00588F64    call        @CheckAutoResult
 00588F69    xor         eax,eax
 00588F6B    pop         edx
 00588F6C    pop         ecx
 00588F6D    pop         ecx
 00588F6E    mov         dword ptr fs:[eax],edx
 00588F71    pop         eax
 00588F72    xor         ebx,ebx
>00588F74    jmp         00588F7B
>00588F76    jmp         @HandleAutoException
 00588F7B    lea         eax,[ebp-14]
 00588F7E    call        @IntfClear
 00588F83    lea         eax,[ebp-10]
 00588F86    call        @VarClr
 00588F8B    mov         eax,ebx
 00588F8D    pop         edi
 00588F8E    pop         esi
 00588F8F    pop         ebx
 00588F90    mov         esp,ebp
 00588F92    pop         ebp
 00588F93    ret         8
*}
end;

//00588F98
function TMSDOMDocument.get_errorCode:Integer; safecall;
begin
{*
 00588F98    push        ebp
 00588F99    mov         ebp,esp
 00588F9B    push        0
 00588F9D    push        0
 00588F9F    push        0
 00588FA1    push        ebx
 00588FA2    push        esi
 00588FA3    push        edi
 00588FA4    mov         ebx,dword ptr [ebp+8]
 00588FA7    push        ebx
 00588FA8    xor         eax,eax
 00588FAA    push        ebp
 00588FAB    push        589001
 00588FB0    push        dword ptr fs:[eax]
 00588FB3    mov         dword ptr fs:[eax],esp
 00588FB6    lea         eax,[ebp-4]
 00588FB9    push        eax
 00588FBA    lea         eax,[ebp-8]
 00588FBD    call        @IntfClear
 00588FC2    push        eax
 00588FC3    lea         edx,[ebp-0C]
 00588FC6    mov         eax,ebx
 00588FC8    call        TMSDOMDocument.GetMSDocument
 00588FCD    mov         eax,dword ptr [ebp-0C]
 00588FD0    push        eax
 00588FD1    mov         eax,dword ptr [eax]
 00588FD3    call        dword ptr [eax+0F0]
 00588FD9    call        @CheckAutoResult
 00588FDE    mov         eax,dword ptr [ebp-8]
 00588FE1    push        eax
 00588FE2    mov         eax,dword ptr [eax]
 00588FE4    call        dword ptr [eax+1C]
 00588FE7    call        @CheckAutoResult
 00588FEC    mov         eax,dword ptr [ebp-4]
 00588FEF    mov         edx,dword ptr [ebp+0C]
 00588FF2    mov         dword ptr [edx],eax
 00588FF4    xor         eax,eax
 00588FF6    pop         edx
 00588FF7    pop         ecx
 00588FF8    pop         ecx
 00588FF9    mov         dword ptr fs:[eax],edx
 00588FFC    pop         eax
 00588FFD    xor         ebx,ebx
>00588FFF    jmp         00589006
>00589001    jmp         @HandleAutoException
 00589006    lea         eax,[ebp-0C]
 00589009    call        @IntfClear
 0058900E    lea         eax,[ebp-8]
 00589011    call        @IntfClear
 00589016    mov         eax,ebx
 00589018    pop         edi
 00589019    pop         esi
 0058901A    pop         ebx
 0058901B    mov         esp,ebp
 0058901D    pop         ebp
 0058901E    ret         8
*}
end;

//00589024
function TMSDOMDocument.get_filepos:Integer; safecall;
begin
{*
 00589024    push        ebp
 00589025    mov         ebp,esp
 00589027    push        0
 00589029    push        0
 0058902B    push        0
 0058902D    push        ebx
 0058902E    push        esi
 0058902F    push        edi
 00589030    mov         ebx,dword ptr [ebp+8]
 00589033    push        ebx
 00589034    xor         eax,eax
 00589036    push        ebp
 00589037    push        58908D
 0058903C    push        dword ptr fs:[eax]
 0058903F    mov         dword ptr fs:[eax],esp
 00589042    lea         eax,[ebp-4]
 00589045    push        eax
 00589046    lea         eax,[ebp-8]
 00589049    call        @IntfClear
 0058904E    push        eax
 0058904F    lea         edx,[ebp-0C]
 00589052    mov         eax,ebx
 00589054    call        TMSDOMDocument.GetMSDocument
 00589059    mov         eax,dword ptr [ebp-0C]
 0058905C    push        eax
 0058905D    mov         eax,dword ptr [eax]
 0058905F    call        dword ptr [eax+0F0]
 00589065    call        @CheckAutoResult
 0058906A    mov         eax,dword ptr [ebp-8]
 0058906D    push        eax
 0058906E    mov         eax,dword ptr [eax]
 00589070    call        dword ptr [eax+34]
 00589073    call        @CheckAutoResult
 00589078    mov         eax,dword ptr [ebp-4]
 0058907B    mov         edx,dword ptr [ebp+0C]
 0058907E    mov         dword ptr [edx],eax
 00589080    xor         eax,eax
 00589082    pop         edx
 00589083    pop         ecx
 00589084    pop         ecx
 00589085    mov         dword ptr fs:[eax],edx
 00589088    pop         eax
 00589089    xor         ebx,ebx
>0058908B    jmp         00589092
>0058908D    jmp         @HandleAutoException
 00589092    lea         eax,[ebp-0C]
 00589095    call        @IntfClear
 0058909A    lea         eax,[ebp-8]
 0058909D    call        @IntfClear
 005890A2    mov         eax,ebx
 005890A4    pop         edi
 005890A5    pop         esi
 005890A6    pop         ebx
 005890A7    mov         esp,ebp
 005890A9    pop         ebp
 005890AA    ret         8
*}
end;

//005890B0
function TMSDOMDocument.get_line:Integer; safecall;
begin
{*
 005890B0    push        ebp
 005890B1    mov         ebp,esp
 005890B3    push        0
 005890B5    push        0
 005890B7    push        0
 005890B9    push        ebx
 005890BA    push        esi
 005890BB    push        edi
 005890BC    mov         ebx,dword ptr [ebp+8]
 005890BF    push        ebx
 005890C0    xor         eax,eax
 005890C2    push        ebp
 005890C3    push        589119
 005890C8    push        dword ptr fs:[eax]
 005890CB    mov         dword ptr fs:[eax],esp
 005890CE    lea         eax,[ebp-4]
 005890D1    push        eax
 005890D2    lea         eax,[ebp-8]
 005890D5    call        @IntfClear
 005890DA    push        eax
 005890DB    lea         edx,[ebp-0C]
 005890DE    mov         eax,ebx
 005890E0    call        TMSDOMDocument.GetMSDocument
 005890E5    mov         eax,dword ptr [ebp-0C]
 005890E8    push        eax
 005890E9    mov         eax,dword ptr [eax]
 005890EB    call        dword ptr [eax+0F0]
 005890F1    call        @CheckAutoResult
 005890F6    mov         eax,dword ptr [ebp-8]
 005890F9    push        eax
 005890FA    mov         eax,dword ptr [eax]
 005890FC    call        dword ptr [eax+2C]
 005890FF    call        @CheckAutoResult
 00589104    mov         eax,dword ptr [ebp-4]
 00589107    mov         edx,dword ptr [ebp+0C]
 0058910A    mov         dword ptr [edx],eax
 0058910C    xor         eax,eax
 0058910E    pop         edx
 0058910F    pop         ecx
 00589110    pop         ecx
 00589111    mov         dword ptr fs:[eax],edx
 00589114    pop         eax
 00589115    xor         ebx,ebx
>00589117    jmp         0058911E
>00589119    jmp         @HandleAutoException
 0058911E    lea         eax,[ebp-0C]
 00589121    call        @IntfClear
 00589126    lea         eax,[ebp-8]
 00589129    call        @IntfClear
 0058912E    mov         eax,ebx
 00589130    pop         edi
 00589131    pop         esi
 00589132    pop         ebx
 00589133    mov         esp,ebp
 00589135    pop         ebp
 00589136    ret         8
*}
end;

//0058913C
function TMSDOMDocument.get_linepos:Integer; safecall;
begin
{*
 0058913C    push        ebp
 0058913D    mov         ebp,esp
 0058913F    push        0
 00589141    push        0
 00589143    push        0
 00589145    push        ebx
 00589146    push        esi
 00589147    push        edi
 00589148    mov         ebx,dword ptr [ebp+8]
 0058914B    push        ebx
 0058914C    xor         eax,eax
 0058914E    push        ebp
 0058914F    push        5891A5
 00589154    push        dword ptr fs:[eax]
 00589157    mov         dword ptr fs:[eax],esp
 0058915A    lea         eax,[ebp-4]
 0058915D    push        eax
 0058915E    lea         eax,[ebp-8]
 00589161    call        @IntfClear
 00589166    push        eax
 00589167    lea         edx,[ebp-0C]
 0058916A    mov         eax,ebx
 0058916C    call        TMSDOMDocument.GetMSDocument
 00589171    mov         eax,dword ptr [ebp-0C]
 00589174    push        eax
 00589175    mov         eax,dword ptr [eax]
 00589177    call        dword ptr [eax+0F0]
 0058917D    call        @CheckAutoResult
 00589182    mov         eax,dword ptr [ebp-8]
 00589185    push        eax
 00589186    mov         eax,dword ptr [eax]
 00589188    call        dword ptr [eax+30]
 0058918B    call        @CheckAutoResult
 00589190    mov         eax,dword ptr [ebp-4]
 00589193    mov         edx,dword ptr [ebp+0C]
 00589196    mov         dword ptr [edx],eax
 00589198    xor         eax,eax
 0058919A    pop         edx
 0058919B    pop         ecx
 0058919C    pop         ecx
 0058919D    mov         dword ptr fs:[eax],edx
 005891A0    pop         eax
 005891A1    xor         ebx,ebx
>005891A3    jmp         005891AA
>005891A5    jmp         @HandleAutoException
 005891AA    lea         eax,[ebp-0C]
 005891AD    call        @IntfClear
 005891B2    lea         eax,[ebp-8]
 005891B5    call        @IntfClear
 005891BA    mov         eax,ebx
 005891BC    pop         edi
 005891BD    pop         esi
 005891BE    pop         ebx
 005891BF    mov         esp,ebp
 005891C1    pop         ebp
 005891C2    ret         8
*}
end;

//005891C8
function TMSDOMDocument.get_reason:DOMString; safecall;
begin
{*
 005891C8    push        ebp
 005891C9    mov         ebp,esp
 005891CB    push        0
 005891CD    push        0
 005891CF    push        0
 005891D1    push        ebx
 005891D2    push        esi
 005891D3    push        edi
 005891D4    mov         ebx,dword ptr [ebp+8]
 005891D7    mov         eax,dword ptr [ebp+0C]
 005891DA    test        eax,eax
>005891DC    je          005891E2
 005891DE    xor         edx,edx
 005891E0    mov         dword ptr [eax],edx
 005891E2    push        ebx
 005891E3    xor         eax,eax
 005891E5    push        ebp
 005891E6    push        589244
 005891EB    push        dword ptr fs:[eax]
 005891EE    mov         dword ptr fs:[eax],esp
 005891F1    lea         eax,[ebp-4]
 005891F4    call        @WStrClr
 005891F9    push        eax
 005891FA    lea         eax,[ebp-8]
 005891FD    call        @IntfClear
 00589202    push        eax
 00589203    lea         edx,[ebp-0C]
 00589206    mov         eax,ebx
 00589208    call        TMSDOMDocument.GetMSDocument
 0058920D    mov         eax,dword ptr [ebp-0C]
 00589210    push        eax
 00589211    mov         eax,dword ptr [eax]
 00589213    call        dword ptr [eax+0F0]
 00589219    call        @CheckAutoResult
 0058921E    mov         eax,dword ptr [ebp-8]
 00589221    push        eax
 00589222    mov         eax,dword ptr [eax]
 00589224    call        dword ptr [eax+24]
 00589227    call        @CheckAutoResult
 0058922C    mov         edx,dword ptr [ebp-4]
 0058922F    mov         eax,dword ptr [ebp+0C]
 00589232    call        @UStrFromWStr
 00589237    xor         eax,eax
 00589239    pop         edx
 0058923A    pop         ecx
 0058923B    pop         ecx
 0058923C    mov         dword ptr fs:[eax],edx
 0058923F    pop         eax
 00589240    xor         ebx,ebx
>00589242    jmp         00589249
>00589244    jmp         @HandleAutoException
 00589249    lea         eax,[ebp-0C]
 0058924C    call        @IntfClear
 00589251    lea         eax,[ebp-8]
 00589254    call        @IntfClear
 00589259    lea         eax,[ebp-4]
 0058925C    call        @WStrClr
 00589261    mov         eax,ebx
 00589263    pop         edi
 00589264    pop         esi
 00589265    pop         ebx
 00589266    mov         esp,ebp
 00589268    pop         ebp
 00589269    ret         8
*}
end;

//0058926C
function TMSDOMDocument.get_srcText:DOMString; safecall;
begin
{*
 0058926C    push        ebp
 0058926D    mov         ebp,esp
 0058926F    push        0
 00589271    push        0
 00589273    push        0
 00589275    push        ebx
 00589276    push        esi
 00589277    push        edi
 00589278    mov         ebx,dword ptr [ebp+8]
 0058927B    mov         eax,dword ptr [ebp+0C]
 0058927E    test        eax,eax
>00589280    je          00589286
 00589282    xor         edx,edx
 00589284    mov         dword ptr [eax],edx
 00589286    push        ebx
 00589287    xor         eax,eax
 00589289    push        ebp
 0058928A    push        5892E8
 0058928F    push        dword ptr fs:[eax]
 00589292    mov         dword ptr fs:[eax],esp
 00589295    lea         eax,[ebp-4]
 00589298    call        @WStrClr
 0058929D    push        eax
 0058929E    lea         eax,[ebp-8]
 005892A1    call        @IntfClear
 005892A6    push        eax
 005892A7    lea         edx,[ebp-0C]
 005892AA    mov         eax,ebx
 005892AC    call        TMSDOMDocument.GetMSDocument
 005892B1    mov         eax,dword ptr [ebp-0C]
 005892B4    push        eax
 005892B5    mov         eax,dword ptr [eax]
 005892B7    call        dword ptr [eax+0F0]
 005892BD    call        @CheckAutoResult
 005892C2    mov         eax,dword ptr [ebp-8]
 005892C5    push        eax
 005892C6    mov         eax,dword ptr [eax]
 005892C8    call        dword ptr [eax+28]
 005892CB    call        @CheckAutoResult
 005892D0    mov         edx,dword ptr [ebp-4]
 005892D3    mov         eax,dword ptr [ebp+0C]
 005892D6    call        @UStrFromWStr
 005892DB    xor         eax,eax
 005892DD    pop         edx
 005892DE    pop         ecx
 005892DF    pop         ecx
 005892E0    mov         dword ptr fs:[eax],edx
 005892E3    pop         eax
 005892E4    xor         ebx,ebx
>005892E6    jmp         005892ED
>005892E8    jmp         @HandleAutoException
 005892ED    lea         eax,[ebp-0C]
 005892F0    call        @IntfClear
 005892F5    lea         eax,[ebp-8]
 005892F8    call        @IntfClear
 005892FD    lea         eax,[ebp-4]
 00589300    call        @WStrClr
 00589305    mov         eax,ebx
 00589307    pop         edi
 00589308    pop         esi
 00589309    pop         ebx
 0058930A    mov         esp,ebp
 0058930C    pop         ebp
 0058930D    ret         8
*}
end;

//00589310
function TMSDOMDocument.get_url:DOMString; safecall;
begin
{*
 00589310    push        ebp
 00589311    mov         ebp,esp
 00589313    push        0
 00589315    push        0
 00589317    push        0
 00589319    push        ebx
 0058931A    push        esi
 0058931B    push        edi
 0058931C    mov         ebx,dword ptr [ebp+8]
 0058931F    mov         eax,dword ptr [ebp+0C]
 00589322    test        eax,eax
>00589324    je          0058932A
 00589326    xor         edx,edx
 00589328    mov         dword ptr [eax],edx
 0058932A    push        ebx
 0058932B    xor         eax,eax
 0058932D    push        ebp
 0058932E    push        58938C
 00589333    push        dword ptr fs:[eax]
 00589336    mov         dword ptr fs:[eax],esp
 00589339    lea         eax,[ebp-4]
 0058933C    call        @WStrClr
 00589341    push        eax
 00589342    lea         eax,[ebp-8]
 00589345    call        @IntfClear
 0058934A    push        eax
 0058934B    lea         edx,[ebp-0C]
 0058934E    mov         eax,ebx
 00589350    call        TMSDOMDocument.GetMSDocument
 00589355    mov         eax,dword ptr [ebp-0C]
 00589358    push        eax
 00589359    mov         eax,dword ptr [eax]
 0058935B    call        dword ptr [eax+0F0]
 00589361    call        @CheckAutoResult
 00589366    mov         eax,dword ptr [ebp-8]
 00589369    push        eax
 0058936A    mov         eax,dword ptr [eax]
 0058936C    call        dword ptr [eax+20]
 0058936F    call        @CheckAutoResult
 00589374    mov         edx,dword ptr [ebp-4]
 00589377    mov         eax,dword ptr [ebp+0C]
 0058937A    call        @UStrFromWStr
 0058937F    xor         eax,eax
 00589381    pop         edx
 00589382    pop         ecx
 00589383    pop         ecx
 00589384    mov         dword ptr fs:[eax],edx
 00589387    pop         eax
 00589388    xor         ebx,ebx
>0058938A    jmp         00589391
>0058938C    jmp         @HandleAutoException
 00589391    lea         eax,[ebp-0C]
 00589394    call        @IntfClear
 00589399    lea         eax,[ebp-8]
 0058939C    call        @IntfClear
 005893A1    lea         eax,[ebp-4]
 005893A4    call        @WStrClr
 005893A9    mov         eax,ebx
 005893AB    pop         edi
 005893AC    pop         esi
 005893AD    pop         ebx
 005893AE    mov         esp,ebp
 005893B0    pop         ebp
 005893B1    ret         8
*}
end;

//005893B4
function TMSDOMImplementationFactory.DOMImplementation:IDOMImplementation;
begin
{*
 005893B4    push        ebx
 005893B5    mov         ebx,edx
 005893B7    xor         ecx,ecx
 005893B9    mov         dl,1
 005893BB    mov         eax,[00580E48];TMSDOMImplementation
 005893C0    call        TMSDOMImplementation.Create
 005893C5    mov         edx,eax
 005893C7    test        edx,edx
>005893C9    je          005893CE
 005893CB    sub         edx,0FFFFFFF0
 005893CE    mov         eax,ebx
 005893D0    call        @IntfCopy
 005893D5    pop         ebx
 005893D6    ret
*}
end;

//005893D8
function TMSDOMImplementationFactory.Description:string;
begin
{*
 005893D8    push        ebx
 005893D9    mov         ebx,edx
 005893DB    mov         eax,ebx
 005893DD    mov         edx,5893F8;'MSXML'
 005893E2    call        @UStrAsg
 005893E7    pop         ebx
 005893E8    ret
*}
end;

Initialization
//00781470
{*
 00781470    sub         dword ptr ds:[81556C],1
>00781477    jae         00781494
 00781479    mov         dl,1
 0078147B    mov         eax,[00583E7C];TMSDOMImplementationFactory
 00781480    call        TObject.Create
 00781485    mov         [00815568],eax;MSXML_DOM:TMSDOMImplementationFactory
 0078148A    mov         eax,[00815568];MSXML_DOM:TMSDOMImplementationFactory
 0078148F    call        RegisterDOMVendor
 00781494    ret
*}
Finalization
end.