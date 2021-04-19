//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit XMLDoc;

interface

uses
  SysUtils, Classes, XMLDoc, xmldom;

type
  TNodeListOperation = (nlInsert, nlRemove, nlCreateNode);
  TNodeListNotification = procedure(Operation:TNodeListOperation; var Node:IXMLNode; const IndexOrName:OleVariant; BeforeOperation:Boolean) of object;;
  TXMLNodeList = class(TInterfacedObject)
  published
    destructor Destroy();//0058E8B0
    constructor Create(NotificationProc:TNodeListNotification; DefaultNamespaceURI:string);//0058E838
  public
    FList:IInterfaceList;//fC
    FNotificationProc:TNodeListNotification;//f10
    FOwner:TXMLNode;//f18
    FUpdateCount:Integer;//f1C
    FDefaultNamespaceURI:string;//f20
    function DoNotify(Operation:TNodeListOperation; const Node:IXMLNode; const IndexOrName:OleVariant; BeforeOperation:Boolean):IXMLNode;//0058E8E0
    function GetCount:Integer;//0058E920
    function IndexOf(const Node:IXMLNode):Integer;//0058E92C
    function Delete(const Name:DOMString):Integer;//0058E998
    function IndexOf(const Name:DOMString; const NamespaceURI:DOMString):Integer;//0058E9A4
    function FindNode(NodeName:DOMString):IXMLNode;//0058EA3C
    function FindNode(NodeName:DOMString; NamespaceURI:DOMString):IXMLNode;//0058EA90
    function FindNode(ChildNodeType:TGUID):IXMLNode;//0058EB14
    function First:IXMLNode;//0058EBA8
    function Last:IXMLNode;//0058EC24
    function FindSibling(const Node:IXMLNode; Delta:Integer):IXMLNode;//0058ECA0
    function Get(Index:Integer):IXMLNode;//0058ECF0
    function GetNode(const IndexOrName:OleVariant):IXMLNode;//0058ED64
    function Add(const Node:IXMLNode):Integer;//0058EE98
    function InternalInsert(Index:Integer; const Node:IXMLNode):Integer;//0058EEB4
    procedure Insert(Index:Integer; const Node:IXMLNode);//0058F0D0
    function Delete(const Index:Integer):Integer;//0058F204
    function IndexOf(const Name:DOMString):Integer;//0058F25C
    function Delete(const Name:DOMString; const NamespaceURI:DOMString):Integer;//0058F268
    function Remove(const Node:IXMLNode):Integer;//0058F2D0
    function ReplaceNode(const OldNode:IXMLNode; const NewNode:IXMLNode):IXMLNode;//0058F3B4
    procedure Clear;//0058F3E8
  end;
  TXMLNodeArray = array of TXMLNode;
//elSize = 4;
  TNodeClassInfo = TNodeClassInfo = record//size=C
f0:string;//f0
f4:string;//f4
end;
NodeName:string;//f0
NamespaceURI:string;//f4
NodeClass:TXMLNodeClass;//f8
end;;
  TNodeClassArray = array of TNodeClassInfo;
//elSize = C;
  TNodeChange = (ncUpdateValue, ncInsertChild, ncRemoveChild, ncAddAttribute, ncRemoveAttribute);
  TXMLNode = class(TInterfacedObject)
  published
    destructor Destroy();//0058F5B4
    constructor Create(OwnerDoc:TXMLDocument; AParentNode:TXMLNode);//0058F488
    constructor CreateHosted;//0058F54C
  public
    FAttributeNodes:IXMLNodeList;//fC
    FChildNodes:IXMLNodeList;//f10
    FChildNodeClasses:TNodeClassArray;//f14
    FCollection:TXMLNodeCollection;//f18
    FDocument:TXMLDocument;//f1C
    FDOMNode:IDOMNode;//f20
    FHostNode:TXMLNode;//f24
    FParentNode:TXMLNode;//f28
    FHostedNodes:TXMLNodeArray;//f2C
    FIsDocElement:Boolean;//f30
    FReadOnly:Boolean;//f31
    FOnHostChildNotify:TNodeListNotification;//f38
    FOnHostAttrNotify:TNodeListNotification;//f40
    destructor Destroy(); virtual;//0058F5B4
    function CreateAttributeNode(const ADOMNode:IDOMNode):IXMLNode; virtual;//v0//0058FB08
    function CreateChildNode(const ADOMNode:IDOMNode):IXMLNode; virtual;//v4//00590C60
    procedure SetParentNode(const Value:TXMLNode); virtual;//v8//005921FC
    procedure ChildListNotify(Operation:TNodeListOperation; var Node:IXMLNode; const IndexOrName:OleVariant; BeforeOperation:Boolean); virtual;//vC//005908DC
    procedure DoNodeChange(ChangeType:TNodeChange; BeforeOperation:Boolean); virtual;//v10//00592248
    procedure SetAttributeNodes(const Value:IXMLNodeList); virtual;//v14//0058F978
    procedure SetChildNodes(const Value:IXMLNodeList); virtual;//v18//005904E4
    procedure CreateChildList; dynamic;//0059031C
    procedure CreateAttributeList; dynamic;//0058F7BC
    function _AddRef:Integer; stdcall;//0058F61C
    function _Release:Integer; stdcall;//0058F650
    procedure ClearDocumentRef;//0058F684
    function GetAttributeNodes:IXMLNodeList;//0058F900
    function HasAttribute(const Name:DOMString):Boolean;//0058F9C0
    function HasAttribute(const Name:DOMString; const NamespaceURI:DOMString):Boolean;//0058FA5C
    function GetAttribute(const AttrName:DOMString):OleVariant;//0058FB3C
    function GetAttributeNS(const AttrName:DOMString; const NamespaceURI:DOMString):OleVariant;//0058FC48
    procedure SetAttribute(const AttrName:DOMString; const Value:OleVariant);//0058FD3C
    procedure SetAttributeNS(const AttrName:DOMString; const NamespaceURI:DOMString; const Value:OleVariant);//0058FF8C
    procedure AttributeListNotify(Operation:TNodeListOperation; var Node:IXMLNode; const IndexOrName:OleVariant; BeforeOperation:Boolean);//005900F0
    function GetHasChildNodes:Boolean;//0059044C
    function GetChildNodes:IXMLNodeList;//0059046C
    function HasChildNode(const ChildTag:DOMString):Boolean;//0059052C
    function HasChildNode(const ChildTag:DOMString; const NamespaceURI:DOMString):Boolean;//00590584
    function AddChild(const TagName:DOMString; Index:Integer):IXMLNode;//0059066C
    function AddChild(const TagName:DOMString; const NamespaceURI:DOMString; GenPrefix:Boolean; Index:Integer):IXMLNode;//00590710
    function AddChild(const TagName:DOMString; const NamespaceURI:DOMString; NodeClass:TXMLNodeClass; Index:Integer):IXMLNode;//0059081C
    function CreateCollection(const CollectionClass:TXMLNodeCollectionClass; const ItemInterface:TGUID; const ItemTag:DOMString; ItemNS:DOMString):TXMLNodeCollection;//00590844
    procedure RegisterChildNode(const TagName:DOMString; ChildNodeClass:TXMLNodeClass; NamespaceURI:DOMString);//00590D64
    function InternalAddChild(NodeClass:TXMLNodeClass; const NodeName:DOMString; const NamespaceURI:DOMString; Index:Integer):IXMLNode;//00590DE8
    function FindNamespaceURI(const TagOrPrefix:DOMString):DOMString;//00590EE8
    function FindNamespaceDecl(const NamespaceURI:DOMString):IXMLNode;//005910F8
    procedure DeclareNamespace(const Prefix:DOMString; const URI:DOMString);//005912A8
    function GetPrefixedName(const Name:DOMString; const NamespaceURI:DOMString):DOMString;//005913D4
    function CloneNode(Deep:Boolean):IXMLNode;//005914B8
    procedure Resync;//00591544
    function FindHostedNode(const NodeClass:TXMLNodeClass):IXMLNode;//0059155C
    procedure AddHostedNode(Node:TXMLNode);//005915C0
    procedure RemoveHostedNode(Node:TXMLNode);//005915F8
    function NextSibling:IXMLNode;//00591660
    function PreviousSibling:IXMLNode;//005916FC
    procedure TransformNode(const stylesheet:IXMLNode; var output:WideString);//00591794
    procedure TransformNode(const stylesheet:IXMLNode; const output:IXMLDocument);//00591808
    function NestingLevel:Integer;//00591894
    procedure Normalize;//00591914
    procedure CheckReadOnly;//00591930
    procedure CheckTextNode;//00591980
    function GetText:DOMString;//00591B28
    procedure SetText(const Value:DOMString);//00591BE0
    function GetNodeValue:OleVariant;//00591CA0
    procedure SetNodeValue(const Value:OleVariant);//00591D34
    function GetChildValue(const IndexOrName:OleVariant):OleVariant;//00591DCC
    procedure SetChildValue(const IndexOrName:OleVariant; const Value:OleVariant);//00591E7C
    function GetXML:DOMString;//00591EEC
    function GetDOMNode:IDOMNode;//00591F48
    function DOMElement:IDOMElement;//00591F5C
    function GetNodeType:TNodeType;//00591FD8
    function GetLocalName:DOMString;//00591FF4
    function GetNamespaceURI:DOMString;//00592014
    function GetNodeName:DOMString;//00592034
    function GetPrefix:DOMString;//00592054
    function GetIsTextElement:Boolean;//00592074
    function GetOwnerDocument:IXMLDocument;//00592150
    function GetCollection:IXMLNodeCollection;//00592188
    function GetParentNode:IXMLNode;//005921A4
    function GetChildNodeClasses:TNodeClassArray;//005921C0
    procedure RegisterChildNodes(const TagNames:array[$0..-$1] of xmldom.DOMString; const _Dv_:$0..-$1; const NodeClasses:array[$0..-$1] of TXMLNodeClass; const _Dv_:$0..-$1);//00592274
  end;
  TXMLNodeCollection = class(TXMLNode)
  published
    procedure AfterConstruction;//00592318
  public
    FItemInterface:TGUID;//f50
    FItemNS:string;//f60
    FItemTag:string;//f64
    FList:IXMLNodeList;//f68
    procedure AfterConstruction; virtual;//00592318
    procedure ChildListNotify(Operation:TNodeListOperation; var Node:IXMLNode; const IndexOrName:OleVariant; BeforeOperation:Boolean); virtual;//vC//00592A74
    procedure SetChildNodes(const Value:IXMLNodeList); virtual;//v18//0059245C
    function GetList:IXMLNodeList; virtual;//v1C//00592378
    function AddItem(Index:Integer):IXMLNode; virtual;//v20//00592B5C
    procedure CreateItemList(CheckFirst:Boolean);//00592484
    function IsCollectionItem(const Node:IXMLNode):Boolean;//00592744
    procedure InsertInCollection(Node:IXMLNode; Index:Integer);//00592844
    procedure UpdateCollectionList(Operation:TNodeListOperation; var Node:IXMLNode; const IndexOrName:OleVariant; BeforeOperation:Boolean);//00592AB0
    procedure Delete(Index:Integer);//00592BC8
    function Remove(const AItem:IXMLNode):Integer;//00592C78
    procedure Clear;//00592D7C
    function GetCount:Integer;//00592DEC
    function GetNode(Index:Integer):IXMLNode;//00592E3C
  end;
  TNodeChangeEvent = procedure(const Node:IXMLNode; ChangeType:TNodeChange) of object;;
  TXMLDocumentSource = (xdsNone, xdsXMLProperty, xdsXMLData, xdsFile, xdsStream);
  TXMLDocument = class(TComponent)
  published
    procedure SaveToStream(Stream:TStream);//00593D48
    procedure SaveToFile(AFileName:string);//00593B3C
    procedure Resync;//00593A90
    procedure SaveToXML(var XML:string);//00593E30
    function GeneratePrefix(Node:IXMLNode):string;//005945D4
    procedure SaveToXML(var XML:UTF8String);//00593F20
    procedure SaveToXML(var XML:WideString);//00593EA8
    procedure RegisterDocBinding(TagName:string; DocNodeClass:TClass; NamespaceURI:string);//00594948
    constructor Create;//00592F18
    function CreateNode(NameOrData:string; NodeType:TNodeType; AddlData:string):IXMLNode;//0059473C
    function NewInstance:TObject;//0059302C
    constructor Create;//00592EE0
    function AddChild(TagName:string):IXMLNode;//00594650
    destructor Destroy();//00592F60
    function CreateElement(TagOrData:string; NamespaceURI:string):IXMLNode;//00594718
    function AddChild(TagName:string; NamespaceURI:string):IXMLNode;//005946B0
    procedure AfterConstruction;//0059303C
    procedure LoadFromXML(XML:AnsiString);//00593DDC
    procedure LoadFromStream(Stream:TStream; EncodingType:TXMLEncodingType);//00593D18
    procedure Refresh;//00593998
    procedure LoadFromXML(XML:string);//00593DAC
    function GetDocBinding(TagName:string; DocNodeClass:TClass; NamespaceURI:string):IXMLNode;//00594830
    function IsEmptyDoc:Boolean;//00594804
    procedure LoadFromFile(AFileName:string);//00593AA4
  public
    FXMLData:string;//f34
    FSrcStream:TStream;//f38
    FXMLStrings:TStringList;//f3C
    FDOMVendor:TDOMVendor;//f40
    FRefCount:Integer;//f44
    FDocBindingInfo:TNodeClassArray;//f48
    FDOMPersist:IDOMPersist;//f4C
    FDOMDocument:IDOMDocument;//f50
    FDOMImplementation:IDOMImplementation;//f54
    FDOMParseOptions:IDOMParseOptions;//f58
    FParseOptions:TParseOptions;//f5C
    FDocumentNode:IXMLNode;//f60
    FFileName:string;//f64
    FOptions:TXMLDocOptions;//f68
    FPrefixID:Integer;//f6C
    FNSPrefixBase:string;//f70
    FNodeIndentStr:string;//f74
    FStreamedActive:Boolean;//f78
    FModified:Integer;//f7C
    FXMLStrRead:Integer;//f80
    FDocSource:TXMLDocumentSource;//f84
    FAfterClose:TNotifyEvent;//f88
    FBeforeOpen:TNotifyEvent;//f90
    FBeforeClose:TNotifyEvent;//f98
    FAfterOpen:TNotifyEvent;//fA0
    FOwnerIsComponent:Boolean;//fA8
    FBeforeNodeChange:TNodeChangeEvent;//fB0
    FAfterNodeChange:TNodeChangeEvent;//fB8
    FOnAsyncLoad:TAsyncEventHandler;//fC0
    procedure AfterConstruction; virtual;//0059303C
    function NewInstance:TObject; virtual;//0059302C
    destructor Destroy(); virtual;//00592F60
    procedure DefineProperties(Filer:TFiler); virtual;//v4//00593328
    procedure Loaded; virtual;//vC//00593140
    constructor Create; virtual;//v2C//00592EE0
    function GetActive:Boolean; virtual;//v34//00593428
    procedure SetActive(const Value:Boolean); virtual;//v38//00593430
    //function v3C:?; virtual;//v3C//0059464C
    procedure SaveToFile(AFileName:string); dynamic;//00593B3C
    procedure ReleaseDoc(const CheckSave:Boolean); dynamic;//00593940
    procedure LoadData; dynamic;//005935AC
    procedure DoBeforeOpen; dynamic;//00595B54
    procedure DoBeforeClose; dynamic;//00595B34
    procedure DoAfterOpen; dynamic;//00595B14
    procedure DoAfterClose; dynamic;//00595AF4
    procedure CheckDOM; dynamic;//005942A8
    procedure CheckAutoSave; dynamic;//00594414
    function _AddRef:Integer; stdcall;//005930F4
    function _Release:Integer; stdcall;//0059310C
    procedure ReadDOMVendor(Reader:TReader);//005931D0
    procedure WriteDOMVendor(Writer:TWriter);//0059329C
    function IsXMLStored(Value:TStrings):Boolean;//00593398
    function NodeIndentStored(Value:string):Boolean;//005933D0
    procedure XMLStringsChanging(Sender:TObject);//00593C10
    procedure SetXMLStrings(const Value:UnicodeString);//00593C38
    procedure SaveToXMLStrings;//00593C90
    function GetXML:TStrings;//00593CF0
    procedure SetXML(const Value:TStrings);//00593D0C
    procedure SaveToUTF8String(var XML:UTF8String);//00593FE4
    function GetDOMParseOptions:IDOMParseOptions;//00594330
    function GetDOMPersist:IDOMPersist;//00594378
    procedure CheckActive;//005943B4
    procedure AssignParseOptions;//00594490
    function GetChildNodes:IXMLNodeList;//005947B4
    function GetAsyncLoadState:Integer;//005949A8
    function GetDOMDocument:IDOMDocument;//00594A14
    procedure SetDOMDocument(const Value:IDOMDocument);//00594A28
    function GetDocumentNode:IXMLNode;//00594A5C
    function GetDocumentElement:IXMLNode;//00594AF0
    procedure SetDocumentElement(const Value:IXMLNode);//00594BB8
    procedure SetDOMImplementation(const Value:IDOMImplementation);//00594C84
    procedure SetDOMVendor(const Value:TDOMVendor);//00594CA8
    function GetFileName:DOMString;//00594CB8
    procedure SetFileName(const Value:DOMString);//00594CCC
    function GetModified:Boolean;//00594D14
    procedure SetModified(const Value:Boolean);//00594D1C
    function GetNodeIndentStr:DOMString;//00594D34
    procedure SetNodeIndentStr(const Value:DOMString);//00594D48
    function GetOptions:TXMLDocOptions;//00594D5C
    procedure SetOptions(const Value:TXMLDocOptions);//00594D64
    //function GetParseOptions:?;//00594D74
    procedure SetParseOptions(const Value:TParseOptions);//00594D7C
    procedure SetOnAsyncLoad(Value:TAsyncEventHandler);//00594D8C
    function GetSchemaRef:DOMString;//00595290
    function GetPrologNode:IXMLNode;//005952C4
    function GetPrologValue(PrologItem:TXMLPrologItem; const Default:DOMString):DOMString;//0059547C
    function InternalSetPrologValue(const PrologNode:IXMLNode; const Value:Variant; PrologItem:TXMLPrologItem):UnicodeString;//00595664
    procedure SetPrologValue(const Value:Variant; PrologItem:TXMLPrologItem);//005957D4
    function GetEncoding:DOMString;//005959A4
    procedure SetEncoding(const Value:DOMString);//005959BC
    function GetVersion:DOMString;//00595A14
    procedure SetVersion(const Value:DOMString);//00595A2C
    function GetStandAlone:DOMString;//00595A84
    procedure SetStandAlone(const Value:DOMString);//00595A9C
    procedure DoNodeChange(const Node:IXMLNode; ChangeType:TNodeChange; BeforeOperation:Boolean);//00595B74
  end;
  TDOMStringDynArray = array of string;
//elSize = 4
//varType equivalent: var;
    procedure XMLDocError(const Msg:UnicodeString);//0058DB88
    procedure XMLDocError(const Msg:UnicodeString; const Args:array[$0..-$1] of System.TVarRec; const _Dv_:$0..-$1);//0058DBA0
    function CreateDOMNode(Doc:IDOMDocument; const NameOrData:DOMString; NodeType:TNodeType; const AddlData:DOMString):IDOMNode;//0058DBC4
    function IsQuoteChar(C:Char):Boolean;//0058DDB8
    function ExtractAttrValue(const AttrName:UnicodeString; const AttrLine:UnicodeString; const Default:DOMString):DOMString;//0058DDC8
    function ReadAtPos(At:LongInt):LongInt;//0058DE68
    function CompareToRead(const AArray:array[$0..-$1] of System.Byte; const _Dv_:$0..-$1):Boolean;//0058DE94
    function CheckIntegerValue:TXMLEncodingType;//0058DF3C
    function CheckWordValue:TXMLEncodingType;//0058E258
    function DetectCharEncoding(S:TStream):TXMLEncodingType;//0058E2B8
    function EncodingMatches(const Encoding:UnicodeString; const EncodingList:array[$0..-$1] of System.UnicodeString; const _Dv_:$0..-$1):Boolean;//0058E394
    procedure CheckEncoding(var XMLData:DOMString; const ValidEncodings:array[$0..-$1] of System.UnicodeString; const _Dv_:$0..-$1);//0058E3C0
    procedure AddNodeClassInfo(var NodeClasses:TNodeClassArray; const NodeClass:TXMLNodeClass; const TagName:DOMString; const NamespaceURI:DOMString);//0058E520
    procedure AppendItem(var AttrStr:UnicodeString; const AttrName:UnicodeString; const AttrValue:UnicodeString);//0058E624
    function SplitString(const S:DOMString; Delimiter:WideChar; const StringSplitOptions:TStringSplitOptions):TDOMStringDynArray;//0058E714
    //procedure sub_0058E8D8(?:?);//0058E8D8
    //procedure sub_0058E8DC(?:?);//0058E8DC
    procedure InsertFormattingNode(const Len:Integer; const Index:Integer; Break:Boolean);//0058EFC0
    //function sub_0058F484(?:?):?;//0058F484
    procedure CreateAttributeList;//0058F7BC
    procedure SetAttributeNodes(const Value:IXMLNodeList);//0058F978
    function CreateAttributeNode(const ADOMNode:IDOMNode):IXMLNode;//0058FB08
    procedure CreateChildList;//0059031C
    procedure SetChildNodes(const Value:IXMLNodeList);//005904E4
    procedure ChildListNotify(Operation:TNodeListOperation; var Node:IXMLNode; const IndexOrName:OleVariant; BeforeOperation:Boolean);//005908DC
    function CreateChildNode(const ADOMNode:IDOMNode):IXMLNode;//00590C60
    //function sub_005921F0(?:?):?;//005921F0
    procedure sub_005921F4;//005921F4
    //procedure sub_005921F8(?:?; ?:?);//005921F8
    procedure SetParentNode(const Value:TXMLNode);//005921FC
    //function sub_0059223C(?:?):?;//0059223C
    //procedure sub_00592244(?:?; ?:?);//00592244
    procedure DoNodeChange(ChangeType:TNodeChange; BeforeOperation:Boolean);//00592248
    function GetList:IXMLNodeList;//00592378
    procedure SetChildNodes(const Value:IXMLNodeList);//0059245C
    procedure ChildListNotify(Operation:TNodeListOperation; var Node:IXMLNode; const IndexOrName:OleVariant; BeforeOperation:Boolean);//00592A74
    function AddItem(Index:Integer):IXMLNode;//00592B5C
    procedure Loaded;//00593140
    function DOMVendorStored:Boolean;//005932F4
    procedure DefineProperties(Filer:TFiler);//00593328
    function GetActive:Boolean;//00593428
    procedure SetActive(const Value:Boolean);//00593430
    procedure LoadData;//005935AC
    procedure ReleaseDoc(const CheckSave:Boolean);//00593940
    procedure CheckDOM;//005942A8
    procedure CheckAutoSave;//00594414
    //function sub_0059464C:?;//0059464C
    procedure CheckForDTD;//00594E08
    function FindLocationHint(const AttrName:DOMString; var SchemaLoc:DOMString):Boolean;//0059504C
    procedure CheckForXMLSchema;//005951AC
    procedure sub_005952C0;//005952C0
    procedure DoAfterClose;//00595AF4
    procedure DoAfterOpen;//00595B14
    procedure DoBeforeClose;//00595B34
    procedure DoBeforeOpen;//00595B54

implementation

//0058DB88
procedure XMLDocError(const Msg:UnicodeString);
begin
{*
 0058DB88    push        ebx
 0058DB89    mov         ebx,eax
 0058DB8B    mov         ecx,ebx
 0058DB8D    mov         dl,1
 0058DB8F    mov         eax,[0058A788];EXMLDocError
 0058DB94    call        Exception.Create
 0058DB99    call        @RaiseExcept
 0058DB9E    pop         ebx
 0058DB9F    ret
*}
end;

//0058DBA0
procedure XMLDocError(const Msg:UnicodeString; const Args:array[$0..-$1] of System.TVarRec; const _Dv_:$0..-$1);
begin
{*
 0058DBA0    push        ebx
 0058DBA1    push        esi
 0058DBA2    push        edi
 0058DBA3    mov         edi,ecx
 0058DBA5    mov         esi,edx
 0058DBA7    mov         ebx,eax
 0058DBA9    push        esi
 0058DBAA    push        edi
 0058DBAB    mov         ecx,ebx
 0058DBAD    mov         dl,1
 0058DBAF    mov         eax,[0058A788];EXMLDocError
 0058DBB4    call        Exception.CreateFmt
 0058DBB9    call        @RaiseExcept
 0058DBBE    pop         edi
 0058DBBF    pop         esi
 0058DBC0    pop         ebx
 0058DBC1    ret
*}
end;

//0058DBC4
function CreateDOMNode(Doc:IDOMDocument; const NameOrData:DOMString; NodeType:TNodeType; const AddlData:DOMString):IDOMNode;
begin
{*
 0058DBC4    push        ebp
 0058DBC5    mov         ebp,esp
 0058DBC7    add         esp,0FFFFFFF8
 0058DBCA    push        ebx
 0058DBCB    push        esi
 0058DBCC    xor         ebx,ebx
 0058DBCE    mov         dword ptr [ebp-8],ebx
 0058DBD1    mov         ebx,ecx
 0058DBD3    mov         esi,edx
 0058DBD5    mov         dword ptr [ebp-4],eax
 0058DBD8    mov         eax,dword ptr [ebp-4]
 0058DBDB    call        @IntfAddRef
 0058DBE0    xor         eax,eax
 0058DBE2    push        ebp
 0058DBE3    push        58DDA9
 0058DBE8    push        dword ptr fs:[eax]
 0058DBEB    mov         dword ptr fs:[eax],esp
 0058DBEE    movzx       eax,bl
 0058DBF1    cmp         eax,0B
>0058DBF4    ja          0058DD8B
 0058DBFA    jmp         dword ptr [eax*4+58DC01]
 0058DBFA    dd          0058DD76
 0058DBFA    dd          0058DC31
 0058DBFA    dd          0058DC78
 0058DBFA    dd          0058DCC2
 0058DBFA    dd          0058DCE2
 0058DBFA    dd          0058DD02
 0058DBFA    dd          0058DD76
 0058DBFA    dd          0058DD1F
 0058DBFA    dd          0058DD40
 0058DBFA    dd          0058DD76
 0058DBFA    dd          0058DD76
 0058DBFA    dd          0058DD5D
 0058DC31    cmp         dword ptr [ebp+0C],0
>0058DC35    jne         0058DC54
 0058DC37    mov         eax,dword ptr [ebp+8]
 0058DC3A    call        @IntfClear
 0058DC3F    push        eax
 0058DC40    push        esi
 0058DC41    mov         eax,dword ptr [ebp-4]
 0058DC44    push        eax
 0058DC45    mov         eax,dword ptr [eax]
 0058DC47    call        dword ptr [eax+78]
 0058DC4A    call        @CheckAutoResult
>0058DC4F    jmp         0058DD8B
 0058DC54    mov         eax,dword ptr [ebp+8]
 0058DC57    call        @IntfClear
 0058DC5C    push        eax
 0058DC5D    push        esi
 0058DC5E    mov         eax,dword ptr [ebp+0C]
 0058DC61    push        eax
 0058DC62    mov         eax,dword ptr [ebp-4]
 0058DC65    push        eax
 0058DC66    mov         eax,dword ptr [eax]
 0058DC68    call        dword ptr [eax+0A0]
 0058DC6E    call        @CheckAutoResult
>0058DC73    jmp         0058DD8B
 0058DC78    cmp         dword ptr [ebp+0C],0
>0058DC7C    jne         0058DC9E
 0058DC7E    mov         eax,dword ptr [ebp+8]
 0058DC81    call        @IntfClear
 0058DC86    push        eax
 0058DC87    push        esi
 0058DC88    mov         eax,dword ptr [ebp-4]
 0058DC8B    push        eax
 0058DC8C    mov         eax,dword ptr [eax]
 0058DC8E    call        dword ptr [eax+90]
 0058DC94    call        @CheckAutoResult
>0058DC99    jmp         0058DD8B
 0058DC9E    mov         eax,dword ptr [ebp+8]
 0058DCA1    call        @IntfClear
 0058DCA6    push        eax
 0058DCA7    push        esi
 0058DCA8    mov         eax,dword ptr [ebp+0C]
 0058DCAB    push        eax
 0058DCAC    mov         eax,dword ptr [ebp-4]
 0058DCAF    push        eax
 0058DCB0    mov         eax,dword ptr [eax]
 0058DCB2    call        dword ptr [eax+0A4]
 0058DCB8    call        @CheckAutoResult
>0058DCBD    jmp         0058DD8B
 0058DCC2    mov         eax,dword ptr [ebp+8]
 0058DCC5    call        @IntfClear
 0058DCCA    push        eax
 0058DCCB    push        esi
 0058DCCC    mov         eax,dword ptr [ebp-4]
 0058DCCF    push        eax
 0058DCD0    mov         eax,dword ptr [eax]
 0058DCD2    call        dword ptr [eax+80]
 0058DCD8    call        @CheckAutoResult
>0058DCDD    jmp         0058DD8B
 0058DCE2    mov         eax,dword ptr [ebp+8]
 0058DCE5    call        @IntfClear
 0058DCEA    push        eax
 0058DCEB    push        esi
 0058DCEC    mov         eax,dword ptr [ebp-4]
 0058DCEF    push        eax
 0058DCF0    mov         eax,dword ptr [eax]
 0058DCF2    call        dword ptr [eax+88]
 0058DCF8    call        @CheckAutoResult
>0058DCFD    jmp         0058DD8B
 0058DD02    mov         eax,dword ptr [ebp+8]
 0058DD05    call        @IntfClear
 0058DD0A    push        eax
 0058DD0B    push        esi
 0058DD0C    mov         eax,dword ptr [ebp-4]
 0058DD0F    push        eax
 0058DD10    mov         eax,dword ptr [eax]
 0058DD12    call        dword ptr [eax+94]
 0058DD18    call        @CheckAutoResult
>0058DD1D    jmp         0058DD8B
 0058DD1F    mov         eax,dword ptr [ebp+8]
 0058DD22    call        @IntfClear
 0058DD27    push        eax
 0058DD28    mov         eax,dword ptr [ebp+0C]
 0058DD2B    push        eax
 0058DD2C    push        esi
 0058DD2D    mov         eax,dword ptr [ebp-4]
 0058DD30    push        eax
 0058DD31    mov         eax,dword ptr [eax]
 0058DD33    call        dword ptr [eax+8C]
 0058DD39    call        @CheckAutoResult
>0058DD3E    jmp         0058DD8B
 0058DD40    mov         eax,dword ptr [ebp+8]
 0058DD43    call        @IntfClear
 0058DD48    push        eax
 0058DD49    push        esi
 0058DD4A    mov         eax,dword ptr [ebp-4]
 0058DD4D    push        eax
 0058DD4E    mov         eax,dword ptr [eax]
 0058DD50    call        dword ptr [eax+84]
 0058DD56    call        @CheckAutoResult
>0058DD5B    jmp         0058DD8B
 0058DD5D    mov         eax,dword ptr [ebp+8]
 0058DD60    call        @IntfClear
 0058DD65    push        eax
 0058DD66    mov         eax,dword ptr [ebp-4]
 0058DD69    push        eax
 0058DD6A    mov         eax,dword ptr [eax]
 0058DD6C    call        dword ptr [eax+7C]
 0058DD6F    call        @CheckAutoResult
>0058DD74    jmp         0058DD8B
 0058DD76    lea         edx,[ebp-8]
 0058DD79    mov         eax,[0078DA68];^SResString593:TResStringRec
 0058DD7E    call        LoadResString
 0058DD83    mov         eax,dword ptr [ebp-8]
 0058DD86    call        XMLDocError
 0058DD8B    xor         eax,eax
 0058DD8D    pop         edx
 0058DD8E    pop         ecx
 0058DD8F    pop         ecx
 0058DD90    mov         dword ptr fs:[eax],edx
 0058DD93    push        58DDB0
 0058DD98    lea         eax,[ebp-8]
 0058DD9B    call        @UStrClr
 0058DDA0    lea         eax,[ebp-4]
 0058DDA3    call        @IntfClear
 0058DDA8    ret
>0058DDA9    jmp         @HandleFinally
>0058DDAE    jmp         0058DD98
 0058DDB0    pop         esi
 0058DDB1    pop         ebx
 0058DDB2    pop         ecx
 0058DDB3    pop         ecx
 0058DDB4    pop         ebp
 0058DDB5    ret         8
*}
end;

//0058DDB8
function IsQuoteChar(C:Char):Boolean;
begin
{*
 0058DDB8    sub         al,22
>0058DDBA    je          0058DDC3
 0058DDBC    sub         al,5
>0058DDBE    je          0058DDC3
 0058DDC0    xor         eax,eax
 0058DDC2    ret
 0058DDC3    mov         al,1
 0058DDC5    ret
*}
end;

//0058DDC8
function ExtractAttrValue(const AttrName:UnicodeString; const AttrLine:UnicodeString; const Default:DOMString):DOMString;
begin
{*
 0058DDC8    push        ebp
 0058DDC9    mov         ebp,esp
 0058DDCB    add         esp,0FFFFFFF4
 0058DDCE    push        ebx
 0058DDCF    push        esi
 0058DDD0    push        edi
 0058DDD1    mov         dword ptr [ebp-8],ecx
 0058DDD4    mov         esi,edx
 0058DDD6    mov         dword ptr [ebp-4],eax
 0058DDD9    mov         edx,esi
 0058DDDB    mov         eax,dword ptr [ebp-4]
 0058DDDE    call        Pos
 0058DDE3    mov         ebx,eax
 0058DDE5    mov         eax,esi
 0058DDE7    test        eax,eax
>0058DDE9    je          0058DDF0
 0058DDEB    sub         eax,4
 0058DDEE    mov         eax,dword ptr [eax]
 0058DDF0    mov         edi,eax
 0058DDF2    test        ebx,ebx
>0058DDF4    jle         0058DE54
 0058DDF6    mov         eax,dword ptr [ebp-4]
 0058DDF9    test        eax,eax
>0058DDFB    je          0058DE02
 0058DDFD    sub         eax,4
 0058DE00    mov         eax,dword ptr [eax]
 0058DE02    add         ebx,eax
>0058DE04    jmp         0058DE07
 0058DE06    inc         ebx
 0058DE07    cmp         edi,ebx
>0058DE09    jle         0058DE19
 0058DE0B    movzx       eax,word ptr [esi+ebx*2-2]
 0058DE10    call        IsQuoteChar
 0058DE15    test        al,al
>0058DE17    je          0058DE06
 0058DE19    cmp         edi,ebx
>0058DE1B    jle         0058DE5F
 0058DE1D    lea         eax,[ebx+1]
 0058DE20    mov         dword ptr [ebp-0C],eax
>0058DE23    jmp         0058DE28
 0058DE25    inc         dword ptr [ebp-0C]
 0058DE28    cmp         edi,dword ptr [ebp-0C]
>0058DE2B    jle         0058DE3E
 0058DE2D    mov         eax,dword ptr [ebp-0C]
 0058DE30    movzx       eax,word ptr [esi+eax*2-2]
 0058DE35    call        IsQuoteChar
 0058DE3A    test        al,al
>0058DE3C    je          0058DE25
 0058DE3E    mov         eax,dword ptr [ebp+8]
 0058DE41    push        eax
 0058DE42    mov         ecx,dword ptr [ebp-0C]
 0058DE45    sub         ecx,ebx
 0058DE47    dec         ecx
 0058DE48    lea         edx,[ebx+1]
 0058DE4B    mov         eax,esi
 0058DE4D    call        @UStrCopy
>0058DE52    jmp         0058DE5F
 0058DE54    mov         eax,dword ptr [ebp+8]
 0058DE57    mov         edx,dword ptr [ebp-8]
 0058DE5A    call        @UStrAsg
 0058DE5F    pop         edi
 0058DE60    pop         esi
 0058DE61    pop         ebx
 0058DE62    mov         esp,ebp
 0058DE64    pop         ebp
 0058DE65    ret         4
*}
end;

//0058DE68
function ReadAtPos(At:LongInt):LongInt;
begin
{*
 0058DE68    push        ebp
 0058DE69    mov         ebp,esp
 0058DE6B    push        ebx
 0058DE6C    mov         edx,dword ptr [ebp+8]
 0058DE6F    mov         edx,dword ptr [edx-8]
 0058DE72    xor         ecx,ecx
 0058DE74    xchg        eax,edx
 0058DE75    mov         ebx,dword ptr [eax]
 0058DE77    call        dword ptr [ebx+14]
 0058DE7A    mov         eax,dword ptr [ebp+8]
 0058DE7D    lea         edx,[eax-4]
 0058DE80    mov         eax,dword ptr [ebp+8]
 0058DE83    mov         eax,dword ptr [eax-8]
 0058DE86    mov         ecx,4
 0058DE8B    mov         ebx,dword ptr [eax]
 0058DE8D    call        dword ptr [ebx+0C]
 0058DE90    pop         ebx
 0058DE91    pop         ebp
 0058DE92    ret
*}
end;

//0058DE94
function CompareToRead(const AArray:array[$0..-$1] of System.Byte; const _Dv_:$0..-$1):Boolean;
begin
{*
 0058DE94    push        ebp
 0058DE95    mov         ebp,esp
 0058DE97    inc         edx
 0058DE98    dec         edx
>0058DE99    je          0058DEA9
 0058DE9B    dec         edx
>0058DE9C    je          0058DEB7
 0058DE9E    dec         edx
>0058DE9F    je          0058DED6
 0058DEA1    dec         edx
>0058DEA2    je          0058DF01
>0058DEA4    jmp         0058DF38
 0058DEA9    mov         edx,dword ptr [ebp+8]
 0058DEAC    movzx       edx,byte ptr [edx-4]
 0058DEB0    cmp         dl,byte ptr [eax]
 0058DEB2    sete        al
 0058DEB5    pop         ebp
 0058DEB6    ret
 0058DEB7    mov         edx,dword ptr [ebp+8]
 0058DEBA    movzx       edx,byte ptr [edx-4]
 0058DEBE    cmp         dl,byte ptr [eax]
>0058DEC0    jne         0058DECE
 0058DEC2    mov         edx,dword ptr [ebp+8]
 0058DEC5    movzx       edx,byte ptr [edx-3]
 0058DEC9    cmp         dl,byte ptr [eax+1]
>0058DECC    je          0058DED2
 0058DECE    xor         eax,eax
>0058DED0    jmp         0058DF3A
 0058DED2    mov         al,1
 0058DED4    pop         ebp
 0058DED5    ret
 0058DED6    mov         edx,dword ptr [ebp+8]
 0058DED9    movzx       edx,byte ptr [edx-4]
 0058DEDD    cmp         dl,byte ptr [eax]
>0058DEDF    jne         0058DEF9
 0058DEE1    mov         edx,dword ptr [ebp+8]
 0058DEE4    movzx       edx,byte ptr [edx-3]
 0058DEE8    cmp         dl,byte ptr [eax+1]
>0058DEEB    jne         0058DEF9
 0058DEED    mov         edx,dword ptr [ebp+8]
 0058DEF0    movzx       edx,byte ptr [edx-2]
 0058DEF4    cmp         dl,byte ptr [eax+2]
>0058DEF7    je          0058DEFD
 0058DEF9    xor         eax,eax
>0058DEFB    jmp         0058DF3A
 0058DEFD    mov         al,1
 0058DEFF    pop         ebp
 0058DF00    ret
 0058DF01    mov         edx,dword ptr [ebp+8]
 0058DF04    movzx       edx,byte ptr [edx-4]
 0058DF08    cmp         dl,byte ptr [eax]
>0058DF0A    jne         0058DF30
 0058DF0C    mov         edx,dword ptr [ebp+8]
 0058DF0F    movzx       edx,byte ptr [edx-3]
 0058DF13    cmp         dl,byte ptr [eax+1]
>0058DF16    jne         0058DF30
 0058DF18    mov         edx,dword ptr [ebp+8]
 0058DF1B    movzx       edx,byte ptr [edx-2]
 0058DF1F    cmp         dl,byte ptr [eax+2]
>0058DF22    jne         0058DF30
 0058DF24    mov         edx,dword ptr [ebp+8]
 0058DF27    movzx       edx,byte ptr [edx-1]
 0058DF2B    cmp         dl,byte ptr [eax+3]
>0058DF2E    je          0058DF34
 0058DF30    xor         eax,eax
>0058DF32    jmp         0058DF3A
 0058DF34    mov         al,1
 0058DF36    pop         ebp
 0058DF37    ret
 0058DF38    xor         eax,eax
 0058DF3A    pop         ebp
 0058DF3B    ret
*}
end;

//0058DF3C
function CheckIntegerValue:TXMLEncodingType;
begin
{*
 0058DF3C    push        ebp
 0058DF3D    mov         ebp,esp
 0058DF3F    push        ecx
 0058DF40    push        ebx
 0058DF41    xor         ebx,ebx
 0058DF43    mov         eax,dword ptr [ebp+8]
 0058DF46    push        eax
 0058DF47    mov         byte ptr [ebp-4],0
 0058DF4B    mov         byte ptr [ebp-3],0
 0058DF4F    mov         byte ptr [ebp-2],0FE
 0058DF53    mov         byte ptr [ebp-1],0FF
 0058DF57    lea         eax,[ebp-4]
 0058DF5A    mov         edx,3
 0058DF5F    call        CompareToRead
 0058DF64    pop         ecx
 0058DF65    test        al,al
>0058DF67    je          0058DF70
 0058DF69    mov         bl,1
>0058DF6B    jmp         0058E252
 0058DF70    mov         eax,dword ptr [ebp+8]
 0058DF73    push        eax
 0058DF74    mov         byte ptr [ebp-4],0FF
 0058DF78    mov         byte ptr [ebp-3],0FE
 0058DF7C    mov         byte ptr [ebp-2],0
 0058DF80    mov         byte ptr [ebp-1],0
 0058DF84    lea         eax,[ebp-4]
 0058DF87    mov         edx,3
 0058DF8C    call        CompareToRead
 0058DF91    pop         ecx
 0058DF92    test        al,al
>0058DF94    je          0058DF9D
 0058DF96    mov         bl,2
>0058DF98    jmp         0058E252
 0058DF9D    mov         eax,dword ptr [ebp+8]
 0058DFA0    push        eax
 0058DFA1    mov         byte ptr [ebp-4],0
 0058DFA5    mov         byte ptr [ebp-3],0
 0058DFA9    mov         byte ptr [ebp-2],0FF
 0058DFAD    mov         byte ptr [ebp-1],0FE
 0058DFB1    lea         eax,[ebp-4]
 0058DFB4    mov         edx,3
 0058DFB9    call        CompareToRead
 0058DFBE    pop         ecx
 0058DFBF    test        al,al
>0058DFC1    je          0058DFCA
 0058DFC3    mov         bl,3
>0058DFC5    jmp         0058E252
 0058DFCA    mov         eax,dword ptr [ebp+8]
 0058DFCD    push        eax
 0058DFCE    mov         byte ptr [ebp-4],0FE
 0058DFD2    mov         byte ptr [ebp-3],0FF
 0058DFD6    mov         byte ptr [ebp-2],0
 0058DFDA    mov         byte ptr [ebp-1],0
 0058DFDE    lea         eax,[ebp-4]
 0058DFE1    mov         edx,3
 0058DFE6    call        CompareToRead
 0058DFEB    pop         ecx
 0058DFEC    test        al,al
>0058DFEE    je          0058DFF7
 0058DFF0    mov         bl,4
>0058DFF2    jmp         0058E252
 0058DFF7    mov         eax,dword ptr [ebp+8]
 0058DFFA    push        eax
 0058DFFB    mov         byte ptr [ebp-4],0
 0058DFFF    mov         byte ptr [ebp-3],3C
 0058E003    mov         byte ptr [ebp-2],0
 0058E007    mov         byte ptr [ebp-1],3F
 0058E00B    lea         eax,[ebp-4]
 0058E00E    mov         edx,3
 0058E013    call        CompareToRead
 0058E018    pop         ecx
 0058E019    test        al,al
>0058E01B    je          0058E024
 0058E01D    mov         bl,9
>0058E01F    jmp         0058E252
 0058E024    mov         eax,dword ptr [ebp+8]
 0058E027    push        eax
 0058E028    mov         byte ptr [ebp-4],3C
 0058E02C    mov         byte ptr [ebp-3],0
 0058E030    mov         byte ptr [ebp-2],3F
 0058E034    mov         byte ptr [ebp-1],0
 0058E038    lea         eax,[ebp-4]
 0058E03B    mov         edx,3
 0058E040    call        CompareToRead
 0058E045    pop         ecx
 0058E046    test        al,al
>0058E048    je          0058E051
 0058E04A    mov         bl,0A
>0058E04C    jmp         0058E252
 0058E051    mov         eax,dword ptr [ebp+8]
 0058E054    push        eax
 0058E055    mov         byte ptr [ebp-4],3C
 0058E059    mov         byte ptr [ebp-3],3F
 0058E05D    mov         byte ptr [ebp-2],78
 0058E061    mov         byte ptr [ebp-1],6D
 0058E065    lea         eax,[ebp-4]
 0058E068    mov         edx,3
 0058E06D    call        CompareToRead
 0058E072    pop         ecx
 0058E073    test        al,al
>0058E075    je          0058E07E
 0058E077    mov         bl,0B
>0058E079    jmp         0058E252
 0058E07E    mov         eax,dword ptr [ebp+8]
 0058E081    push        eax
 0058E082    mov         byte ptr [ebp-4],4C
 0058E086    mov         byte ptr [ebp-3],6F
 0058E08A    mov         byte ptr [ebp-2],0A7
 0058E08E    mov         byte ptr [ebp-1],94
 0058E092    lea         eax,[ebp-4]
 0058E095    mov         edx,3
 0058E09A    call        CompareToRead
 0058E09F    pop         ecx
 0058E0A0    test        al,al
>0058E0A2    je          0058E0AB
 0058E0A4    mov         bl,0C
>0058E0A6    jmp         0058E252
 0058E0AB    mov         eax,dword ptr [ebp+8]
 0058E0AE    push        eax
 0058E0AF    mov         byte ptr [ebp-4],0
 0058E0B3    mov         byte ptr [ebp-3],0
 0058E0B7    mov         byte ptr [ebp-2],0
 0058E0BB    mov         byte ptr [ebp-1],3C
 0058E0BF    lea         eax,[ebp-4]
 0058E0C2    mov         edx,3
 0058E0C7    call        CompareToRead
 0058E0CC    pop         ecx
 0058E0CD    test        al,al
>0058E0CF    je          0058E1EC
 0058E0D5    mov         eax,dword ptr [ebp+8]
 0058E0D8    push        eax
 0058E0D9    mov         eax,dword ptr [ebp+8]
 0058E0DC    mov         eax,dword ptr [eax-0C]
 0058E0DF    add         eax,4
 0058E0E2    call        ReadAtPos
 0058E0E7    pop         ecx
 0058E0E8    cmp         eax,4
>0058E0EB    jne         0058E11A
 0058E0ED    mov         eax,dword ptr [ebp+8]
 0058E0F0    push        eax
 0058E0F1    mov         byte ptr [ebp-4],0
 0058E0F5    mov         byte ptr [ebp-3],0
 0058E0F9    mov         byte ptr [ebp-2],0
 0058E0FD    mov         byte ptr [ebp-1],3F
 0058E101    lea         eax,[ebp-4]
 0058E104    mov         edx,3
 0058E109    call        CompareToRead
 0058E10E    pop         ecx
 0058E10F    test        al,al
>0058E111    je          0058E11A
 0058E113    mov         bl,1
>0058E115    jmp         0058E252
 0058E11A    mov         eax,dword ptr [ebp+8]
 0058E11D    push        eax
 0058E11E    mov         eax,dword ptr [ebp+8]
 0058E121    mov         eax,dword ptr [eax-0C]
 0058E124    add         eax,4
 0058E127    call        ReadAtPos
 0058E12C    pop         ecx
 0058E12D    cmp         eax,4
>0058E130    jne         0058E252
 0058E136    mov         eax,dword ptr [ebp+8]
 0058E139    push        eax
 0058E13A    mov         byte ptr [ebp-4],3C
 0058E13E    mov         byte ptr [ebp-3],0
 0058E142    mov         byte ptr [ebp-2],0
 0058E146    mov         byte ptr [ebp-1],0
 0058E14A    lea         eax,[ebp-4]
 0058E14D    mov         edx,3
 0058E152    call        CompareToRead
 0058E157    pop         ecx
 0058E158    test        al,al
>0058E15A    je          0058E252
 0058E160    mov         eax,dword ptr [ebp+8]
 0058E163    push        eax
 0058E164    mov         eax,dword ptr [ebp+8]
 0058E167    mov         eax,dword ptr [eax-0C]
 0058E16A    add         eax,8
 0058E16D    call        ReadAtPos
 0058E172    pop         ecx
 0058E173    cmp         eax,4
>0058E176    jne         0058E252
 0058E17C    mov         eax,dword ptr [ebp+8]
 0058E17F    push        eax
 0058E180    mov         byte ptr [ebp-4],0
 0058E184    mov         byte ptr [ebp-3],0
 0058E188    mov         byte ptr [ebp-2],3C
 0058E18C    mov         byte ptr [ebp-1],0
 0058E190    lea         eax,[ebp-4]
 0058E193    mov         edx,3
 0058E198    call        CompareToRead
 0058E19D    pop         ecx
 0058E19E    test        al,al
>0058E1A0    je          0058E252
 0058E1A6    mov         eax,dword ptr [ebp+8]
 0058E1A9    push        eax
 0058E1AA    mov         eax,dword ptr [ebp+8]
 0058E1AD    mov         eax,dword ptr [eax-0C]
 0058E1B0    add         eax,0C
 0058E1B3    call        ReadAtPos
 0058E1B8    pop         ecx
 0058E1B9    cmp         eax,4
>0058E1BC    jne         0058E252
 0058E1C2    mov         eax,dword ptr [ebp+8]
 0058E1C5    push        eax
 0058E1C6    mov         byte ptr [ebp-4],0
 0058E1CA    mov         byte ptr [ebp-3],3C
 0058E1CE    mov         byte ptr [ebp-2],0
 0058E1D2    mov         byte ptr [ebp-1],0
 0058E1D6    lea         eax,[ebp-4]
 0058E1D9    mov         edx,3
 0058E1DE    call        CompareToRead
 0058E1E3    pop         ecx
 0058E1E4    test        al,al
>0058E1E6    je          0058E252
 0058E1E8    mov         bl,8
>0058E1EA    jmp         0058E252
 0058E1EC    mov         eax,dword ptr [ebp+8]
 0058E1EF    push        eax
 0058E1F0    mov         byte ptr [ebp-4],3C
 0058E1F4    mov         byte ptr [ebp-3],0
 0058E1F8    mov         byte ptr [ebp-2],0
 0058E1FC    mov         byte ptr [ebp-1],0
 0058E200    lea         eax,[ebp-4]
 0058E203    mov         edx,3
 0058E208    call        CompareToRead
 0058E20D    pop         ecx
 0058E20E    test        al,al
>0058E210    je          0058E252
 0058E212    mov         eax,dword ptr [ebp+8]
 0058E215    push        eax
 0058E216    mov         eax,dword ptr [ebp+8]
 0058E219    mov         eax,dword ptr [eax-0C]
 0058E21C    add         eax,4
 0058E21F    call        ReadAtPos
 0058E224    pop         ecx
 0058E225    cmp         eax,4
>0058E228    jne         0058E252
 0058E22A    mov         eax,dword ptr [ebp+8]
 0058E22D    push        eax
 0058E22E    mov         byte ptr [ebp-4],3F
 0058E232    mov         byte ptr [ebp-3],0
 0058E236    mov         byte ptr [ebp-2],0
 0058E23A    mov         byte ptr [ebp-1],0
 0058E23E    lea         eax,[ebp-4]
 0058E241    mov         edx,3
 0058E246    call        CompareToRead
 0058E24B    pop         ecx
 0058E24C    test        al,al
>0058E24E    je          0058E252
 0058E250    mov         bl,2
 0058E252    mov         eax,ebx
 0058E254    pop         ebx
 0058E255    pop         ecx
 0058E256    pop         ebp
 0058E257    ret
*}
end;

//0058E258
function CheckWordValue:TXMLEncodingType;
begin
{*
 0058E258    push        ebp
 0058E259    mov         ebp,esp
 0058E25B    push        ecx
 0058E25C    mov         eax,dword ptr [ebp+8]
 0058E25F    push        eax
 0058E260    mov         byte ptr [ebp-4],0FE
 0058E264    mov         byte ptr [ebp-3],0FF
 0058E268    mov         byte ptr [ebp-2],0
 0058E26C    mov         byte ptr [ebp-1],0
 0058E270    lea         eax,[ebp-4]
 0058E273    mov         edx,3
 0058E278    call        CompareToRead
 0058E27D    pop         ecx
 0058E27E    test        al,al
>0058E280    je          0058E287
 0058E282    mov         al,5
 0058E284    pop         ecx
 0058E285    pop         ebp
 0058E286    ret
 0058E287    mov         eax,dword ptr [ebp+8]
 0058E28A    push        eax
 0058E28B    mov         byte ptr [ebp-4],0FF
 0058E28F    mov         byte ptr [ebp-3],0FE
 0058E293    mov         byte ptr [ebp-2],0
 0058E297    mov         byte ptr [ebp-1],0
 0058E29B    lea         eax,[ebp-4]
 0058E29E    mov         edx,3
 0058E2A3    call        CompareToRead
 0058E2A8    pop         ecx
 0058E2A9    test        al,al
>0058E2AB    je          0058E2B1
 0058E2AD    mov         al,6
>0058E2AF    jmp         0058E2B3
 0058E2B1    xor         eax,eax
 0058E2B3    pop         ecx
 0058E2B4    pop         ebp
 0058E2B5    ret
*}
end;

//0058E2B8
function DetectCharEncoding(S:TStream):TXMLEncodingType;
begin
{*
 0058E2B8    push        ebp
 0058E2B9    mov         ebp,esp
 0058E2BB    add         esp,0FFFFFFE8
 0058E2BE    push        ebx
 0058E2BF    push        esi
 0058E2C0    mov         dword ptr [ebp-8],eax
 0058E2C3    lea         esi,[ebp-0C]
 0058E2C6    mov         byte ptr [ebp-0D],0
 0058E2CA    mov         eax,dword ptr [ebp-8]
 0058E2CD    call        TStream.GetPosition
 0058E2D2    mov         dword ptr [ebp-14],eax
 0058E2D5    xor         eax,eax
 0058E2D7    push        ebp
 0058E2D8    push        58E382
 0058E2DD    push        dword ptr fs:[eax]
 0058E2E0    mov         dword ptr fs:[eax],esp
 0058E2E3    xor         eax,eax
 0058E2E5    mov         dword ptr [esi],eax
>0058E2E7    jmp         0058E352
 0058E2E9    mov         ebx,dword ptr [esi]
 0058E2EB    and         ebx,80000003
>0058E2F1    jns         0058E2F8
 0058E2F3    dec         ebx
 0058E2F4    or          ebx,0FFFFFFFC
 0058E2F7    inc         ebx
 0058E2F8    test        ebx,ebx
>0058E2FA    jne         0058E308
 0058E2FC    push        ebp
 0058E2FD    call        CheckIntegerValue
 0058E302    pop         ecx
 0058E303    mov         byte ptr [ebp-0D],al
>0058E306    jmp         0058E327
 0058E308    cmp         ebx,2
>0058E30B    jne         0058E327
 0058E30D    push        ebp
 0058E30E    call        CheckIntegerValue
 0058E313    pop         ecx
 0058E314    mov         byte ptr [ebp-0D],al
 0058E317    cmp         byte ptr [ebp-0D],0
>0058E31B    jne         0058E327
 0058E31D    push        ebp
 0058E31E    call        CheckWordValue
 0058E323    pop         ecx
 0058E324    mov         byte ptr [ebp-0D],al
 0058E327    cmp         byte ptr [ebp-0D],0
>0058E32B    jne         0058E350
 0058E32D    push        ebp
 0058E32E    mov         byte ptr [ebp-18],0EF
 0058E332    mov         byte ptr [ebp-17],0BB
 0058E336    mov         byte ptr [ebp-16],0BF
 0058E33A    lea         eax,[ebp-18]
 0058E33D    mov         edx,2
 0058E342    call        CompareToRead
 0058E347    pop         ecx
 0058E348    test        al,al
>0058E34A    je          0058E350
 0058E34C    mov         byte ptr [ebp-0D],7
 0058E350    inc         dword ptr [esi]
 0058E352    cmp         byte ptr [ebp-0D],0
>0058E356    jne         0058E366
 0058E358    push        ebp
 0058E359    mov         eax,dword ptr [esi]
 0058E35B    call        ReadAtPos
 0058E360    pop         ecx
 0058E361    cmp         eax,4
>0058E364    je          0058E2E9
 0058E366    xor         eax,eax
 0058E368    pop         edx
 0058E369    pop         ecx
 0058E36A    pop         ecx
 0058E36B    mov         dword ptr fs:[eax],edx
 0058E36E    push        58E389
 0058E373    mov         eax,dword ptr [ebp-14]
 0058E376    cdq
 0058E377    push        edx
 0058E378    push        eax
 0058E379    mov         eax,dword ptr [ebp-8]
 0058E37C    call        TStream.SetPosition
 0058E381    ret
>0058E382    jmp         @HandleFinally
>0058E387    jmp         0058E373
 0058E389    movzx       eax,byte ptr [ebp-0D]
 0058E38D    pop         esi
 0058E38E    pop         ebx
 0058E38F    mov         esp,ebp
 0058E391    pop         ebp
 0058E392    ret
*}
end;

//0058E394
function EncodingMatches(const Encoding:UnicodeString; const EncodingList:array[$0..-$1] of System.UnicodeString; const _Dv_:$0..-$1):Boolean;
begin
{*
 0058E394    push        ebx
 0058E395    push        esi
 0058E396    push        edi
 0058E397    mov         edi,eax
 0058E399    mov         esi,ecx
 0058E39B    test        esi,esi
>0058E39D    jl          0058E3B9
 0058E39F    inc         esi
 0058E3A0    mov         ebx,edx
 0058E3A2    mov         edx,edi
 0058E3A4    mov         eax,dword ptr [ebx]
 0058E3A6    call        SameText
 0058E3AB    test        al,al
>0058E3AD    je          0058E3B3
 0058E3AF    mov         al,1
>0058E3B1    jmp         0058E3BB
 0058E3B3    add         ebx,4
 0058E3B6    dec         esi
>0058E3B7    jne         0058E3A2
 0058E3B9    xor         eax,eax
 0058E3BB    pop         edi
 0058E3BC    pop         esi
 0058E3BD    pop         ebx
 0058E3BE    ret
*}
end;

//0058E3C0
procedure CheckEncoding(var XMLData:DOMString; const ValidEncodings:array[$0..-$1] of System.UnicodeString; const _Dv_:$0..-$1);
begin
{*
 0058E3C0    push        ebp
 0058E3C1    mov         ebp,esp
 0058E3C3    push        0
 0058E3C5    push        0
 0058E3C7    push        ebx
 0058E3C8    push        esi
 0058E3C9    push        edi
 0058E3CA    mov         edi,ecx
 0058E3CC    mov         esi,edx
 0058E3CE    mov         ebx,eax
 0058E3D0    xor         eax,eax
 0058E3D2    push        ebp
 0058E3D3    push        58E45D
 0058E3D8    push        dword ptr fs:[eax]
 0058E3DB    mov         dword ptr fs:[eax],esp
 0058E3DE    lea         eax,[ebp-4]
 0058E3E1    push        eax
 0058E3E2    lea         eax,[ebp-8]
 0058E3E5    push        eax
 0058E3E6    mov         eax,dword ptr [ebx]
 0058E3E8    mov         ecx,32
 0058E3ED    mov         edx,1
 0058E3F2    call        @UStrCopy
 0058E3F7    mov         edx,dword ptr [ebp-8]
 0058E3FA    xor         ecx,ecx
 0058E3FC    mov         eax,58E478;'encoding'
 0058E401    call        ExtractAttrValue
 0058E406    cmp         dword ptr [ebp-4],0
>0058E40A    je          0058E442
 0058E40C    mov         edx,esi
 0058E40E    mov         ecx,edi
 0058E410    mov         eax,dword ptr [ebp-4]
 0058E413    call        EncodingMatches
 0058E418    test        al,al
>0058E41A    jne         0058E442
 0058E41C    mov         edx,dword ptr [ebx]
 0058E41E    mov         eax,58E478;'encoding'
 0058E423    call        Pos
 0058E428    mov         edx,eax
 0058E42A    mov         eax,dword ptr [ebp-4]
 0058E42D    test        eax,eax
>0058E42F    je          0058E436
 0058E431    sub         eax,4
 0058E434    mov         eax,dword ptr [eax]
 0058E436    add         eax,0C
 0058E439    mov         ecx,ebx
 0058E43B    dec         edx
 0058E43C    xchg        eax,ecx
 0058E43D    call        @UStrDelete
 0058E442    xor         eax,eax
 0058E444    pop         edx
 0058E445    pop         ecx
 0058E446    pop         ecx
 0058E447    mov         dword ptr fs:[eax],edx
 0058E44A    push        58E464
 0058E44F    lea         eax,[ebp-8]
 0058E452    mov         edx,2
 0058E457    call        @UStrArrayClr
 0058E45C    ret
>0058E45D    jmp         @HandleFinally
>0058E462    jmp         0058E44F
 0058E464    pop         edi
 0058E465    pop         esi
 0058E466    pop         ebx
 0058E467    pop         ecx
 0058E468    pop         ecx
 0058E469    pop         ebp
 0058E46A    ret
*}
end;

//0058E520
procedure AddNodeClassInfo(var NodeClasses:TNodeClassArray; const NodeClass:TXMLNodeClass; const TagName:DOMString; const NamespaceURI:DOMString);
begin
{*
 0058E520    push        ebp
 0058E521    mov         ebp,esp
 0058E523    add         esp,0FFFFFFF4
 0058E526    push        ebx
 0058E527    push        esi
 0058E528    push        edi
 0058E529    mov         dword ptr [ebp-8],ecx
 0058E52C    mov         dword ptr [ebp-4],edx
 0058E52F    mov         ebx,eax
 0058E531    mov         eax,dword ptr [ebx]
 0058E533    call        @DynArrayLength
 0058E538    mov         dword ptr [ebp-0C],eax
 0058E53B    mov         edi,dword ptr [ebp-0C]
 0058E53E    dec         edi
 0058E53F    test        edi,edi
>0058E541    jl          0058E5D5
 0058E547    inc         edi
 0058E548    xor         esi,esi
 0058E54A    lea         eax,[esi+esi*2]
 0058E54D    mov         edx,dword ptr [ebx]
 0058E54F    mov         eax,dword ptr [edx+eax*4]
 0058E552    mov         edx,dword ptr [ebp-8]
 0058E555    call        @UStrEqual
>0058E55A    jne         0058E5CD
 0058E55C    lea         eax,[esi+esi*2]
 0058E55F    mov         edx,dword ptr [ebx]
 0058E561    mov         eax,dword ptr [edx+eax*4+4]
 0058E565    mov         edx,dword ptr [ebp+8]
 0058E568    call        @UStrEqual
>0058E56D    jne         0058E5CD
 0058E56F    cmp         dword ptr [ebp-4],0
>0058E573    je          0058E586
 0058E575    lea         eax,[esi+esi*2]
 0058E578    mov         edx,dword ptr [ebx]
 0058E57A    mov         ecx,dword ptr [ebp-4]
 0058E57D    mov         dword ptr [edx+eax*4+8],ecx
>0058E581    jmp         0058E619
 0058E586    mov         edi,dword ptr [ebp-0C]
 0058E589    sub         edi,2
 0058E58C    sub         edi,esi
>0058E58E    jl          0058E5B1
 0058E590    inc         edi
 0058E591    lea         eax,[esi+esi*2]
 0058E594    mov         edx,dword ptr [ebx]
 0058E596    lea         eax,[edx+eax*4]
 0058E599    lea         edx,[esi+esi*2]
 0058E59C    mov         ecx,dword ptr [ebx]
 0058E59E    lea         edx,[ecx+edx*4+0C]
 0058E5A2    mov         ecx,dword ptr ds:[58BB8C];TNodeClassInfo
 0058E5A8    call        @CopyRecord
 0058E5AD    inc         esi
 0058E5AE    dec         edi
>0058E5AF    jne         0058E591
 0058E5B1    mov         eax,dword ptr [ebp-0C]
 0058E5B4    dec         eax
 0058E5B5    push        eax
 0058E5B6    mov         eax,ebx
 0058E5B8    mov         ecx,1
 0058E5BD    mov         edx,dword ptr ds:[58BC00];TNodeClassArray
 0058E5C3    call        @DynArraySetLength
 0058E5C8    add         esp,4
>0058E5CB    jmp         0058E619
 0058E5CD    inc         esi
 0058E5CE    dec         edi
>0058E5CF    jne         0058E54A
 0058E5D5    mov         eax,dword ptr [ebp-0C]
 0058E5D8    inc         eax
 0058E5D9    push        eax
 0058E5DA    mov         eax,ebx
 0058E5DC    mov         ecx,1
 0058E5E1    mov         edx,dword ptr ds:[58BC00];TNodeClassArray
 0058E5E7    call        @DynArraySetLength
 0058E5EC    add         esp,4
 0058E5EF    mov         esi,dword ptr [ebp-0C]
 0058E5F2    lea         esi,[esi+esi*2]
 0058E5F5    mov         eax,dword ptr [ebx]
 0058E5F7    lea         eax,[eax+esi*4]
 0058E5FA    mov         edx,dword ptr [ebp-8]
 0058E5FD    call        @UStrAsg
 0058E602    mov         eax,dword ptr [ebx]
 0058E604    mov         edx,dword ptr [ebp-4]
 0058E607    mov         dword ptr [eax+esi*4+8],edx
 0058E60B    mov         eax,dword ptr [ebx]
 0058E60D    lea         eax,[eax+esi*4+4]
 0058E611    mov         edx,dword ptr [ebp+8]
 0058E614    call        @UStrAsg
 0058E619    pop         edi
 0058E61A    pop         esi
 0058E61B    pop         ebx
 0058E61C    mov         esp,ebp
 0058E61E    pop         ebp
 0058E61F    ret         4
*}
end;

//0058E624
procedure AppendItem(var AttrStr:UnicodeString; const AttrName:UnicodeString; const AttrValue:UnicodeString);
begin
{*
 0058E624    push        ebp
 0058E625    mov         ebp,esp
 0058E627    add         esp,0FFFFFFEC
 0058E62A    push        ebx
 0058E62B    push        esi
 0058E62C    push        edi
 0058E62D    xor         ebx,ebx
 0058E62F    mov         dword ptr [ebp-4],ebx
 0058E632    mov         esi,ecx
 0058E634    mov         edi,edx
 0058E636    mov         ebx,eax
 0058E638    xor         eax,eax
 0058E63A    push        ebp
 0058E63B    push        58E69F
 0058E640    push        dword ptr fs:[eax]
 0058E643    mov         dword ptr fs:[eax],esp
 0058E646    test        esi,esi
>0058E648    je          0058E689
 0058E64A    cmp         dword ptr [ebx],0
>0058E64D    je          0058E65B
 0058E64F    mov         eax,ebx
 0058E651    mov         edx,58E6BC;' '
 0058E656    call        @UStrCat
 0058E65B    lea         eax,[ebp-4]
 0058E65E    push        eax
 0058E65F    mov         dword ptr [ebp-14],edi
 0058E662    mov         byte ptr [ebp-10],11
 0058E666    mov         dword ptr [ebp-0C],esi
 0058E669    mov         byte ptr [ebp-8],11
 0058E66D    lea         edx,[ebp-14]
 0058E670    mov         ecx,1
 0058E675    mov         eax,58E6CC;'%s="%s"'
 0058E67A    call        Format
 0058E67F    mov         edx,dword ptr [ebp-4]
 0058E682    mov         eax,ebx
 0058E684    call        @UStrCat
 0058E689    xor         eax,eax
 0058E68B    pop         edx
 0058E68C    pop         ecx
 0058E68D    pop         ecx
 0058E68E    mov         dword ptr fs:[eax],edx
 0058E691    push        58E6A6
 0058E696    lea         eax,[ebp-4]
 0058E699    call        @UStrClr
 0058E69E    ret
>0058E69F    jmp         @HandleFinally
>0058E6A4    jmp         0058E696
 0058E6A6    pop         edi
 0058E6A7    pop         esi
 0058E6A8    pop         ebx
 0058E6A9    mov         esp,ebp
 0058E6AB    pop         ebp
 0058E6AC    ret
*}
end;

//0058E714
function SplitString(const S:DOMString; Delimiter:WideChar; const StringSplitOptions:TStringSplitOptions):TDOMStringDynArray;
begin
{*
 0058E714    push        ebp
 0058E715    mov         ebp,esp
 0058E717    add         esp,0FFFFFFEC
 0058E71A    push        ebx
 0058E71B    push        esi
 0058E71C    push        edi
 0058E71D    mov         byte ptr [ebp-7],cl
 0058E720    mov         word ptr [ebp-6],dx
 0058E724    mov         dword ptr [ebp-4],eax
 0058E727    mov         eax,dword ptr [ebp+8]
 0058E72A    mov         eax,dword ptr [eax]
 0058E72C    call        @DynArrayLength
 0058E731    mov         dword ptr [ebp-10],eax
 0058E734    xor         eax,eax
 0058E736    mov         dword ptr [ebp-14],eax
 0058E739    mov         edi,1
 0058E73E    mov         eax,dword ptr [ebp-4]
 0058E741    test        eax,eax
>0058E743    je          0058E74A
 0058E745    sub         eax,4
 0058E748    mov         eax,dword ptr [eax]
 0058E74A    mov         dword ptr [ebp-0C],eax
 0058E74D    mov         esi,dword ptr [ebp-0C]
 0058E750    test        esi,esi
>0058E752    jle         0058E7C3
 0058E754    mov         ebx,1
 0058E759    mov         eax,dword ptr [ebp-4]
 0058E75C    movzx       eax,word ptr [eax+ebx*2-2]
 0058E761    cmp         ax,word ptr [ebp-6]
>0058E765    jne         0058E7BF
 0058E767    cmp         ebx,edi
>0058E769    jg          0058E771
 0058E76B    test        byte ptr [ebp-7],2
>0058E76F    jne         0058E7BC
 0058E771    mov         eax,dword ptr [ebp-14]
 0058E774    cmp         eax,dword ptr [ebp-10]
>0058E777    jne         0058E79E
 0058E779    mov         eax,dword ptr [ebp-10]
 0058E77C    add         eax,eax
 0058E77E    add         eax,8
 0058E781    mov         dword ptr [ebp-10],eax
 0058E784    mov         eax,dword ptr [ebp-10]
 0058E787    push        eax
 0058E788    mov         eax,dword ptr [ebp+8]
 0058E78B    mov         ecx,1
 0058E790    mov         edx,dword ptr ds:[58E6DC];TDOMStringDynArray
 0058E796    call        @DynArraySetLength
 0058E79B    add         esp,4
 0058E79E    mov         eax,dword ptr [ebp-4]
 0058E7A1    lea         edx,[eax+edi*2-2]
 0058E7A5    mov         eax,dword ptr [ebp+8]
 0058E7A8    mov         eax,dword ptr [eax]
 0058E7AA    mov         ecx,dword ptr [ebp-14]
 0058E7AD    lea         eax,[eax+ecx*4]
 0058E7B0    mov         ecx,ebx
 0058E7B2    sub         ecx,edi
 0058E7B4    call        @UStrFromPWCharLen
 0058E7B9    inc         dword ptr [ebp-14]
 0058E7BC    lea         edi,[ebx+1]
 0058E7BF    inc         ebx
 0058E7C0    dec         esi
>0058E7C1    jne         0058E759
 0058E7C3    cmp         edi,dword ptr [ebp-0C]
>0058E7C6    jle         0058E7CE
 0058E7C8    test        byte ptr [ebp-7],2
>0058E7CC    jne         0058E80D
 0058E7CE    mov         ebx,dword ptr [ebp-14]
 0058E7D1    inc         ebx
 0058E7D2    cmp         ebx,dword ptr [ebp-10]
>0058E7D5    je          0058E7EE
 0058E7D7    push        ebx
 0058E7D8    mov         eax,dword ptr [ebp+8]
 0058E7DB    mov         ecx,1
 0058E7E0    mov         edx,dword ptr ds:[58E6DC];TDOMStringDynArray
 0058E7E6    call        @DynArraySetLength
 0058E7EB    add         esp,4
 0058E7EE    mov         eax,dword ptr [ebp-4]
 0058E7F1    lea         edx,[eax+edi*2-2]
 0058E7F5    mov         eax,dword ptr [ebp+8]
 0058E7F8    mov         eax,dword ptr [eax]
 0058E7FA    mov         ecx,dword ptr [ebp-14]
 0058E7FD    lea         eax,[eax+ecx*4]
 0058E800    mov         ecx,dword ptr [ebp-0C]
 0058E803    sub         ecx,edi
 0058E805    inc         ecx
 0058E806    call        @UStrFromPWCharLen
>0058E80B    jmp         0058E82F
 0058E80D    mov         eax,dword ptr [ebp-14]
 0058E810    cmp         eax,dword ptr [ebp-10]
>0058E813    je          0058E82F
 0058E815    mov         eax,dword ptr [ebp-14]
 0058E818    push        eax
 0058E819    mov         eax,dword ptr [ebp+8]
 0058E81C    mov         ecx,1
 0058E821    mov         edx,dword ptr ds:[58E6DC];TDOMStringDynArray
 0058E827    call        @DynArraySetLength
 0058E82C    add         esp,4
 0058E82F    pop         edi
 0058E830    pop         esi
 0058E831    pop         ebx
 0058E832    mov         esp,ebp
 0058E834    pop         ebp
 0058E835    ret         4
*}
end;

//0058E838
constructor TXMLNodeList.Create(NotificationProc:TNodeListNotification; DefaultNamespaceURI:string);
begin
{*
 0058E838    push        ebp
 0058E839    mov         ebp,esp
 0058E83B    push        ebx
 0058E83C    push        esi
 0058E83D    push        edi
 0058E83E    test        dl,dl
>0058E840    je          0058E84A
 0058E842    add         esp,0FFFFFFF0
 0058E845    call        @ClassCreate
 0058E84A    mov         esi,ecx
 0058E84C    mov         ebx,edx
 0058E84E    mov         edi,eax
 0058E850    mov         dl,1
 0058E852    mov         eax,[0043A388];TInterfaceList
 0058E857    call        TInterfaceList.Create
 0058E85C    mov         edx,eax
 0058E85E    test        edx,edx
>0058E860    je          0058E865
 0058E862    sub         edx,0FFFFFFF0
 0058E865    lea         eax,[edi+0C]
 0058E868    call        @IntfCopy
 0058E86D    mov         dword ptr [edi+18],esi
 0058E870    mov         eax,dword ptr [ebp+8]
 0058E873    mov         dword ptr [edi+10],eax
 0058E876    mov         eax,dword ptr [ebp+0C]
 0058E879    mov         dword ptr [edi+14],eax
 0058E87C    lea         eax,[edi+20]
 0058E87F    mov         edx,dword ptr [ebp+10]
 0058E882    call        @UStrAsg
 0058E887    xor         edx,edx
 0058E889    mov         eax,edi
 0058E88B    call        TObject.Create
 0058E890    mov         eax,edi
 0058E892    test        bl,bl
>0058E894    je          0058E8A5
 0058E896    call        @AfterConstruction
 0058E89B    pop         dword ptr fs:[0]
 0058E8A2    add         esp,0C
 0058E8A5    mov         eax,edi
 0058E8A7    pop         edi
 0058E8A8    pop         esi
 0058E8A9    pop         ebx
 0058E8AA    pop         ebp
 0058E8AB    ret         0C
*}
end;

//0058E8B0
destructor TXMLNodeList.Destroy();
begin
{*
 0058E8B0    push        ebx
 0058E8B1    push        esi
 0058E8B2    call        @BeforeDestruction
 0058E8B7    mov         ebx,edx
 0058E8B9    mov         esi,eax
 0058E8BB    mov         edx,ebx
 0058E8BD    and         dl,0FC
 0058E8C0    mov         eax,esi
 0058E8C2    call        TObject.Destroy
 0058E8C7    test        bl,bl
>0058E8C9    jle         0058E8D2
 0058E8CB    mov         eax,esi
 0058E8CD    call        @ClassDestroy
 0058E8D2    pop         esi
 0058E8D3    pop         ebx
 0058E8D4    ret
*}
end;

//0058E8D8
{*procedure sub_0058E8D8(?:?);
begin
 0058E8D8    inc         dword ptr [eax+1C]
 0058E8DB    ret
end;*}

//0058E8DC
{*procedure sub_0058E8DC(?:?);
begin
 0058E8DC    dec         dword ptr [eax+1C]
 0058E8DF    ret
end;*}

//0058E8E0
function TXMLNodeList.DoNotify(Operation:TNodeListOperation; const Node:IXMLNode; const IndexOrName:OleVariant; BeforeOperation:Boolean):IXMLNode;
begin
{*
 0058E8E0    push        ebp
 0058E8E1    mov         ebp,esp
 0058E8E3    push        ecx
 0058E8E4    push        ebx
 0058E8E5    push        esi
 0058E8E6    push        edi
 0058E8E7    mov         edi,ecx
 0058E8E9    mov         byte ptr [ebp-1],dl
 0058E8EC    mov         ebx,eax
 0058E8EE    mov         esi,dword ptr [ebp+8]
 0058E8F1    mov         eax,esi
 0058E8F3    mov         edx,edi
 0058E8F5    call        @IntfCopy
 0058E8FA    cmp         word ptr [ebx+12],0
>0058E8FF    je          0058E916
 0058E901    mov         eax,dword ptr [ebp+10]
 0058E904    push        eax
 0058E905    movzx       eax,byte ptr [ebp+0C]
 0058E909    push        eax
 0058E90A    mov         ecx,esi
 0058E90C    movzx       edx,byte ptr [ebp-1]
 0058E910    mov         eax,dword ptr [ebx+14]
 0058E913    call        dword ptr [ebx+10]
 0058E916    pop         edi
 0058E917    pop         esi
 0058E918    pop         ebx
 0058E919    pop         ecx
 0058E91A    pop         ebp
 0058E91B    ret         0C
*}
end;

//0058E920
function TXMLNodeList.GetCount:Integer;
begin
{*
 0058E920    mov         eax,dword ptr [eax+0C]
 0058E923    mov         edx,dword ptr [eax]
 0058E925    call        dword ptr [edx+14]
 0058E928    ret
*}
end;

//0058E92C
function TXMLNodeList.IndexOf(const Node:IXMLNode):Integer;
begin
{*
 0058E92C    push        ebp
 0058E92D    mov         ebp,esp
 0058E92F    push        0
 0058E931    push        ebx
 0058E932    push        esi
 0058E933    mov         esi,edx
 0058E935    mov         ebx,eax
 0058E937    xor         eax,eax
 0058E939    push        ebp
 0058E93A    push        58E977
 0058E93F    push        dword ptr fs:[eax]
 0058E942    mov         dword ptr fs:[eax],esp
 0058E945    lea         eax,[ebp-4]
 0058E948    mov         edx,esi
 0058E94A    mov         ecx,58E988
 0058E94F    call        @IntfCast
 0058E954    mov         edx,dword ptr [ebp-4]
 0058E957    mov         eax,dword ptr [ebx+0C]
 0058E95A    mov         ecx,dword ptr [eax]
 0058E95C    call        dword ptr [ecx+34]
 0058E95F    mov         ebx,eax
 0058E961    xor         eax,eax
 0058E963    pop         edx
 0058E964    pop         ecx
 0058E965    pop         ecx
 0058E966    mov         dword ptr fs:[eax],edx
 0058E969    push        58E97E
 0058E96E    lea         eax,[ebp-4]
 0058E971    call        @IntfClear
 0058E976    ret
>0058E977    jmp         @HandleFinally
>0058E97C    jmp         0058E96E
 0058E97E    mov         eax,ebx
 0058E980    pop         esi
 0058E981    pop         ebx
 0058E982    pop         ecx
 0058E983    pop         ebp
 0058E984    ret
*}
end;

//0058E998
function TXMLNodeList.Delete(const Name:DOMString):Integer;
begin
{*
 0058E998    mov         ecx,dword ptr [eax+20]
 0058E99B    call        TXMLNodeList.IndexOf
 0058E9A0    ret
*}
end;

//0058E9A4
function TXMLNodeList.IndexOf(const Name:DOMString; const NamespaceURI:DOMString):Integer;
begin
{*
 0058E9A4    push        ebp
 0058E9A5    mov         ebp,esp
 0058E9A7    add         esp,0FFFFFFEC
 0058E9AA    push        ebx
 0058E9AB    push        esi
 0058E9AC    xor         ebx,ebx
 0058E9AE    mov         dword ptr [ebp-10],ebx
 0058E9B1    mov         dword ptr [ebp-14],ebx
 0058E9B4    mov         dword ptr [ebp-0C],ecx
 0058E9B7    mov         dword ptr [ebp-8],edx
 0058E9BA    mov         dword ptr [ebp-4],eax
 0058E9BD    xor         eax,eax
 0058E9BF    push        ebp
 0058E9C0    push        58EA2C
 0058E9C5    push        dword ptr fs:[eax]
 0058E9C8    mov         dword ptr fs:[eax],esp
 0058E9CB    mov         eax,dword ptr [ebp-4]
 0058E9CE    call        TXMLNodeList.GetCount
 0058E9D3    mov         ebx,eax
 0058E9D5    dec         ebx
 0058E9D6    test        ebx,ebx
>0058E9D8    jl          0058EA0B
 0058E9DA    inc         ebx
 0058E9DB    xor         esi,esi
 0058E9DD    lea         ecx,[ebp-14]
 0058E9E0    mov         edx,esi
 0058E9E2    mov         eax,dword ptr [ebp-4]
 0058E9E5    call        TXMLNodeList.Get
 0058E9EA    mov         eax,dword ptr [ebp-14]
 0058E9ED    lea         edx,[ebp-10]
 0058E9F0    mov         ecx,dword ptr [eax]
 0058E9F2    call        dword ptr [ecx+20]
 0058E9F5    mov         eax,dword ptr [ebp-10]
 0058E9F8    mov         ecx,dword ptr [ebp-0C]
 0058E9FB    mov         edx,dword ptr [ebp-8]
 0058E9FE    call        NodeMatches
 0058EA03    test        al,al
>0058EA05    jne         0058EA0E
 0058EA07    inc         esi
 0058EA08    dec         ebx
>0058EA09    jne         0058E9DD
 0058EA0B    or          esi,0FFFFFFFF
 0058EA0E    xor         eax,eax
 0058EA10    pop         edx
 0058EA11    pop         ecx
 0058EA12    pop         ecx
 0058EA13    mov         dword ptr fs:[eax],edx
 0058EA16    push        58EA33
 0058EA1B    lea         eax,[ebp-14]
 0058EA1E    call        @IntfClear
 0058EA23    lea         eax,[ebp-10]
 0058EA26    call        @IntfClear
 0058EA2B    ret
>0058EA2C    jmp         @HandleFinally
>0058EA31    jmp         0058EA1B
 0058EA33    mov         eax,esi
 0058EA35    pop         esi
 0058EA36    pop         ebx
 0058EA37    mov         esp,ebp
 0058EA39    pop         ebp
 0058EA3A    ret
*}
end;

//0058EA3C
function TXMLNodeList.FindNode(NodeName:DOMString):IXMLNode;
begin
{*
 0058EA3C    push        ebp
 0058EA3D    mov         ebp,esp
 0058EA3F    push        ecx
 0058EA40    push        ebx
 0058EA41    push        esi
 0058EA42    mov         esi,ecx
 0058EA44    mov         dword ptr [ebp-4],edx
 0058EA47    mov         ebx,eax
 0058EA49    mov         eax,dword ptr [ebp-4]
 0058EA4C    call        @UStrAddRef
 0058EA51    xor         eax,eax
 0058EA53    push        ebp
 0058EA54    push        58EA83
 0058EA59    push        dword ptr fs:[eax]
 0058EA5C    mov         dword ptr fs:[eax],esp
 0058EA5F    push        esi
 0058EA60    mov         ecx,dword ptr [ebx+20]
 0058EA63    mov         edx,dword ptr [ebp-4]
 0058EA66    mov         eax,ebx
 0058EA68    call        TXMLNodeList.FindNode
 0058EA6D    xor         eax,eax
 0058EA6F    pop         edx
 0058EA70    pop         ecx
 0058EA71    pop         ecx
 0058EA72    mov         dword ptr fs:[eax],edx
 0058EA75    push        58EA8A
 0058EA7A    lea         eax,[ebp-4]
 0058EA7D    call        @UStrClr
 0058EA82    ret
>0058EA83    jmp         @HandleFinally
>0058EA88    jmp         0058EA7A
 0058EA8A    pop         esi
 0058EA8B    pop         ebx
 0058EA8C    pop         ecx
 0058EA8D    pop         ebp
 0058EA8E    ret
*}
end;

//0058EA90
function TXMLNodeList.FindNode(NodeName:DOMString; NamespaceURI:DOMString):IXMLNode;
begin
{*
 0058EA90    push        ebp
 0058EA91    mov         ebp,esp
 0058EA93    add         esp,0FFFFFFF8
 0058EA96    push        ebx
 0058EA97    push        esi
 0058EA98    push        edi
 0058EA99    mov         dword ptr [ebp-8],ecx
 0058EA9C    mov         dword ptr [ebp-4],edx
 0058EA9F    mov         ebx,eax
 0058EAA1    mov         edi,dword ptr [ebp+8]
 0058EAA4    mov         eax,dword ptr [ebp-4]
 0058EAA7    call        @UStrAddRef
 0058EAAC    mov         eax,dword ptr [ebp-8]
 0058EAAF    call        @UStrAddRef
 0058EAB4    xor         eax,eax
 0058EAB6    push        ebp
 0058EAB7    push        58EB04
 0058EABC    push        dword ptr fs:[eax]
 0058EABF    mov         dword ptr fs:[eax],esp
 0058EAC2    mov         ecx,dword ptr [ebp-8]
 0058EAC5    mov         edx,dword ptr [ebp-4]
 0058EAC8    mov         eax,ebx
 0058EACA    call        TXMLNodeList.IndexOf
 0058EACF    mov         esi,eax
 0058EAD1    test        esi,esi
>0058EAD3    jl          0058EAE2
 0058EAD5    mov         ecx,edi
 0058EAD7    mov         edx,esi
 0058EAD9    mov         eax,ebx
 0058EADB    call        TXMLNodeList.Get
>0058EAE0    jmp         0058EAE9
 0058EAE2    mov         eax,edi
 0058EAE4    call        @IntfClear
 0058EAE9    xor         eax,eax
 0058EAEB    pop         edx
 0058EAEC    pop         ecx
 0058EAED    pop         ecx
 0058EAEE    mov         dword ptr fs:[eax],edx
 0058EAF1    push        58EB0B
 0058EAF6    lea         eax,[ebp-8]
 0058EAF9    mov         edx,2
 0058EAFE    call        @UStrArrayClr
 0058EB03    ret
>0058EB04    jmp         @HandleFinally
>0058EB09    jmp         0058EAF6
 0058EB0B    pop         edi
 0058EB0C    pop         esi
 0058EB0D    pop         ebx
 0058EB0E    pop         ecx
 0058EB0F    pop         ecx
 0058EB10    pop         ebp
 0058EB11    ret         4
*}
end;

//0058EB14
function TXMLNodeList.FindNode(ChildNodeType:TGUID):IXMLNode;
begin
{*
 0058EB14    push        ebp
 0058EB15    mov         ebp,esp
 0058EB17    add         esp,0FFFFFFE8
 0058EB1A    push        ebx
 0058EB1B    push        esi
 0058EB1C    push        edi
 0058EB1D    xor         ebx,ebx
 0058EB1F    mov         dword ptr [ebp-18],ebx
 0058EB22    mov         esi,edx
 0058EB24    lea         edi,[ebp-14]
 0058EB27    movs        dword ptr [edi],dword ptr [esi]
 0058EB28    movs        dword ptr [edi],dword ptr [esi]
 0058EB29    movs        dword ptr [edi],dword ptr [esi]
 0058EB2A    movs        dword ptr [edi],dword ptr [esi]
 0058EB2B    mov         dword ptr [ebp-4],ecx
 0058EB2E    mov         edi,eax
 0058EB30    xor         eax,eax
 0058EB32    push        ebp
 0058EB33    push        58EB98
 0058EB38    push        dword ptr fs:[eax]
 0058EB3B    mov         dword ptr fs:[eax],esp
 0058EB3E    mov         eax,edi
 0058EB40    call        TXMLNodeList.GetCount
 0058EB45    mov         ebx,eax
 0058EB47    dec         ebx
 0058EB48    test        ebx,ebx
>0058EB4A    jl          0058EB7A
 0058EB4C    inc         ebx
 0058EB4D    xor         esi,esi
 0058EB4F    lea         ecx,[ebp-18]
 0058EB52    mov         edx,esi
 0058EB54    mov         eax,edi
 0058EB56    call        TXMLNodeList.Get
 0058EB5B    mov         eax,dword ptr [ebp-18]
 0058EB5E    push        eax
 0058EB5F    mov         eax,dword ptr [ebp-4]
 0058EB62    call        @IntfClear
 0058EB67    mov         ecx,eax
 0058EB69    lea         edx,[ebp-14]
 0058EB6C    pop         eax
 0058EB6D    call        Supports
 0058EB72    test        al,al
>0058EB74    jne         0058EB82
 0058EB76    inc         esi
 0058EB77    dec         ebx
>0058EB78    jne         0058EB4F
 0058EB7A    mov         eax,dword ptr [ebp-4]
 0058EB7D    call        @IntfClear
 0058EB82    xor         eax,eax
 0058EB84    pop         edx
 0058EB85    pop         ecx
 0058EB86    pop         ecx
 0058EB87    mov         dword ptr fs:[eax],edx
 0058EB8A    push        58EB9F
 0058EB8F    lea         eax,[ebp-18]
 0058EB92    call        @IntfClear
 0058EB97    ret
>0058EB98    jmp         @HandleFinally
>0058EB9D    jmp         0058EB8F
 0058EB9F    pop         edi
 0058EBA0    pop         esi
 0058EBA1    pop         ebx
 0058EBA2    mov         esp,ebp
 0058EBA4    pop         ebp
 0058EBA5    ret
*}
end;

//0058EBA8
function TXMLNodeList.First:IXMLNode;
begin
{*
 0058EBA8    push        ebp
 0058EBA9    mov         ebp,esp
 0058EBAB    push        0
 0058EBAD    push        ebx
 0058EBAE    push        esi
 0058EBAF    mov         esi,edx
 0058EBB1    mov         ebx,eax
 0058EBB3    xor         eax,eax
 0058EBB5    push        ebp
 0058EBB6    push        58EC06
 0058EBBB    push        dword ptr fs:[eax]
 0058EBBE    mov         dword ptr fs:[eax],esp
 0058EBC1    mov         eax,dword ptr [ebx+0C]
 0058EBC4    mov         edx,dword ptr [eax]
 0058EBC6    call        dword ptr [edx+14]
 0058EBC9    test        eax,eax
>0058EBCB    jle         0058EBE9
 0058EBCD    lea         edx,[ebp-4]
 0058EBD0    mov         eax,dword ptr [ebx+0C]
 0058EBD3    mov         ecx,dword ptr [eax]
 0058EBD5    call        dword ptr [ecx+30]
 0058EBD8    mov         edx,dword ptr [ebp-4]
 0058EBDB    mov         eax,esi
 0058EBDD    mov         ecx,58EC14
 0058EBE2    call        @IntfCast
>0058EBE7    jmp         0058EBF0
 0058EBE9    mov         eax,esi
 0058EBEB    call        @IntfClear
 0058EBF0    xor         eax,eax
 0058EBF2    pop         edx
 0058EBF3    pop         ecx
 0058EBF4    pop         ecx
 0058EBF5    mov         dword ptr fs:[eax],edx
 0058EBF8    push        58EC0D
 0058EBFD    lea         eax,[ebp-4]
 0058EC00    call        @IntfClear
 0058EC05    ret
>0058EC06    jmp         @HandleFinally
>0058EC0B    jmp         0058EBFD
 0058EC0D    pop         esi
 0058EC0E    pop         ebx
 0058EC0F    pop         ecx
 0058EC10    pop         ebp
 0058EC11    ret
*}
end;

//0058EC24
function TXMLNodeList.Last:IXMLNode;
begin
{*
 0058EC24    push        ebp
 0058EC25    mov         ebp,esp
 0058EC27    push        0
 0058EC29    push        ebx
 0058EC2A    push        esi
 0058EC2B    mov         esi,edx
 0058EC2D    mov         ebx,eax
 0058EC2F    xor         eax,eax
 0058EC31    push        ebp
 0058EC32    push        58EC82
 0058EC37    push        dword ptr fs:[eax]
 0058EC3A    mov         dword ptr fs:[eax],esp
 0058EC3D    mov         eax,dword ptr [ebx+0C]
 0058EC40    mov         edx,dword ptr [eax]
 0058EC42    call        dword ptr [edx+14]
 0058EC45    test        eax,eax
>0058EC47    jle         0058EC65
 0058EC49    lea         edx,[ebp-4]
 0058EC4C    mov         eax,dword ptr [ebx+0C]
 0058EC4F    mov         ecx,dword ptr [eax]
 0058EC51    call        dword ptr [ecx+40]
 0058EC54    mov         edx,dword ptr [ebp-4]
 0058EC57    mov         eax,esi
 0058EC59    mov         ecx,58EC90
 0058EC5E    call        @IntfCast
>0058EC63    jmp         0058EC6C
 0058EC65    mov         eax,esi
 0058EC67    call        @IntfClear
 0058EC6C    xor         eax,eax
 0058EC6E    pop         edx
 0058EC6F    pop         ecx
 0058EC70    pop         ecx
 0058EC71    mov         dword ptr fs:[eax],edx
 0058EC74    push        58EC89
 0058EC79    lea         eax,[ebp-4]
 0058EC7C    call        @IntfClear
 0058EC81    ret
>0058EC82    jmp         @HandleFinally
>0058EC87    jmp         0058EC79
 0058EC89    pop         esi
 0058EC8A    pop         ebx
 0058EC8B    pop         ecx
 0058EC8C    pop         ebp
 0058EC8D    ret
*}
end;

//0058ECA0
function TXMLNodeList.FindSibling(const Node:IXMLNode; Delta:Integer):IXMLNode;
begin
{*
 0058ECA0    push        ebp
 0058ECA1    mov         ebp,esp
 0058ECA3    add         esp,0FFFFFFF8
 0058ECA6    push        ebx
 0058ECA7    push        esi
 0058ECA8    push        edi
 0058ECA9    mov         dword ptr [ebp-8],ecx
 0058ECAC    mov         dword ptr [ebp-4],edx
 0058ECAF    mov         esi,eax
 0058ECB1    mov         edi,dword ptr [ebp+8]
 0058ECB4    mov         edx,dword ptr [ebp-4]
 0058ECB7    mov         eax,esi
 0058ECB9    call        TXMLNodeList.IndexOf
 0058ECBE    mov         ebx,eax
 0058ECC0    add         ebx,dword ptr [ebp-8]
 0058ECC3    test        ebx,ebx
>0058ECC5    jl          0058ECE0
 0058ECC7    mov         eax,dword ptr [esi+0C]
 0058ECCA    mov         edx,dword ptr [eax]
 0058ECCC    call        dword ptr [edx+14]
 0058ECCF    cmp         ebx,eax
>0058ECD1    jge         0058ECE0
 0058ECD3    mov         ecx,edi
 0058ECD5    mov         edx,ebx
 0058ECD7    mov         eax,esi
 0058ECD9    call        TXMLNodeList.Get
>0058ECDE    jmp         0058ECE7
 0058ECE0    mov         eax,edi
 0058ECE2    call        @IntfClear
 0058ECE7    pop         edi
 0058ECE8    pop         esi
 0058ECE9    pop         ebx
 0058ECEA    pop         ecx
 0058ECEB    pop         ecx
 0058ECEC    pop         ebp
 0058ECED    ret         4
*}
end;

//0058ECF0
function TXMLNodeList.Get(Index:Integer):IXMLNode;
begin
{*
 0058ECF0    push        ebp
 0058ECF1    mov         ebp,esp
 0058ECF3    add         esp,0FFFFFFF8
 0058ECF6    push        ebx
 0058ECF7    push        esi
 0058ECF8    xor         ebx,ebx
 0058ECFA    mov         dword ptr [ebp-8],ebx
 0058ECFD    mov         dword ptr [ebp-4],ecx
 0058ED00    mov         esi,edx
 0058ED02    mov         ebx,eax
 0058ED04    xor         eax,eax
 0058ED06    push        ebp
 0058ED07    push        58ED45
 0058ED0C    push        dword ptr fs:[eax]
 0058ED0F    mov         dword ptr fs:[eax],esp
 0058ED12    lea         ecx,[ebp-8]
 0058ED15    mov         edx,esi
 0058ED17    mov         eax,dword ptr [ebx+0C]
 0058ED1A    mov         ebx,dword ptr [eax]
 0058ED1C    call        dword ptr [ebx+0C]
 0058ED1F    mov         edx,dword ptr [ebp-8]
 0058ED22    mov         eax,dword ptr [ebp-4]
 0058ED25    mov         ecx,58ED54
 0058ED2A    call        @IntfCast
 0058ED2F    xor         eax,eax
 0058ED31    pop         edx
 0058ED32    pop         ecx
 0058ED33    pop         ecx
 0058ED34    mov         dword ptr fs:[eax],edx
 0058ED37    push        58ED4C
 0058ED3C    lea         eax,[ebp-8]
 0058ED3F    call        @IntfClear
 0058ED44    ret
>0058ED45    jmp         @HandleFinally
>0058ED4A    jmp         0058ED3C
 0058ED4C    pop         esi
 0058ED4D    pop         ebx
 0058ED4E    pop         ecx
 0058ED4F    pop         ecx
 0058ED50    pop         ebp
 0058ED51    ret
*}
end;

//0058ED64
function TXMLNodeList.GetNode(const IndexOrName:OleVariant):IXMLNode;
begin
{*
 0058ED64    push        ebp
 0058ED65    mov         ebp,esp
 0058ED67    push        0
 0058ED69    push        0
 0058ED6B    push        0
 0058ED6D    push        0
 0058ED6F    push        0
 0058ED71    push        0
 0058ED73    push        0
 0058ED75    push        ebx
 0058ED76    push        esi
 0058ED77    mov         dword ptr [ebp-4],ecx
 0058ED7A    mov         esi,edx
 0058ED7C    mov         ebx,eax
 0058ED7E    xor         eax,eax
 0058ED80    push        ebp
 0058ED81    push        58EE79
 0058ED86    push        dword ptr fs:[eax]
 0058ED89    mov         dword ptr fs:[eax],esp
 0058ED8C    mov         eax,esi
 0058ED8E    call        VarIsOrdinal
 0058ED93    test        al,al
>0058ED95    je          0058EDC0
 0058ED97    mov         eax,esi
 0058ED99    call        @VarToInteger
 0058ED9E    mov         edx,eax
 0058EDA0    lea         ecx,[ebp-8]
 0058EDA3    mov         eax,dword ptr [ebx+0C]
 0058EDA6    mov         ebx,dword ptr [eax]
 0058EDA8    call        dword ptr [ebx+0C]
 0058EDAB    mov         edx,dword ptr [ebp-8]
 0058EDAE    mov         eax,dword ptr [ebp-4]
 0058EDB1    mov         ecx,58EE88
 0058EDB6    call        @IntfCast
>0058EDBB    jmp         0058EE4B
 0058EDC0    lea         eax,[ebp-0C]
 0058EDC3    mov         edx,esi
 0058EDC5    call        @VarToUStr
 0058EDCA    mov         edx,dword ptr [ebp-0C]
 0058EDCD    mov         ecx,dword ptr [ebp-4]
 0058EDD0    mov         eax,ebx
 0058EDD2    call        TXMLNodeList.FindNode
 0058EDD7    mov         eax,dword ptr [ebp-4]
 0058EDDA    cmp         dword ptr [eax],0
>0058EDDD    jne         0058EE20
 0058EDDF    mov         eax,dword ptr [ebx+18]
 0058EDE2    mov         eax,dword ptr [eax+1C]
 0058EDE5    call        TXMLDocument.GetOptions
 0058EDEA    test        al,1
>0058EDEC    je          0058EE20
 0058EDEE    mov         eax,dword ptr [ebx+18]
 0058EDF1    call        TXMLNode.GetNodeType
 0058EDF6    cmp         al,9
>0058EDF8    jne         0058EE0E
 0058EDFA    lea         edx,[ebp-10]
 0058EDFD    mov         eax,dword ptr [ebx+18]
 0058EE00    mov         eax,dword ptr [eax+1C]
 0058EE03    call        TXMLDocument.GetDocumentElement
 0058EE08    cmp         dword ptr [ebp-10],0
>0058EE0C    jne         0058EE20
 0058EE0E    push        esi
 0058EE0F    push        1
 0058EE11    mov         eax,dword ptr [ebp-4]
 0058EE14    push        eax
 0058EE15    xor         ecx,ecx
 0058EE17    mov         dl,2
 0058EE19    mov         eax,ebx
 0058EE1B    call        TXMLNodeList.DoNotify
 0058EE20    mov         eax,dword ptr [ebp-4]
 0058EE23    cmp         dword ptr [eax],0
>0058EE26    jne         0058EE4B
 0058EE28    lea         edx,[ebp-14]
 0058EE2B    mov         eax,[0078D328];^SResString590:TResStringRec
 0058EE30    call        LoadResString
 0058EE35    mov         eax,dword ptr [ebp-14]
 0058EE38    push        eax
 0058EE39    mov         dword ptr [ebp-1C],esi
 0058EE3C    mov         byte ptr [ebp-18],0D
 0058EE40    lea         edx,[ebp-1C]
 0058EE43    xor         ecx,ecx
 0058EE45    pop         eax
 0058EE46    call        XMLDocError
 0058EE4B    xor         eax,eax
 0058EE4D    pop         edx
 0058EE4E    pop         ecx
 0058EE4F    pop         ecx
 0058EE50    mov         dword ptr fs:[eax],edx
 0058EE53    push        58EE80
 0058EE58    lea         eax,[ebp-14]
 0058EE5B    call        @UStrClr
 0058EE60    lea         eax,[ebp-10]
 0058EE63    call        @IntfClear
 0058EE68    lea         eax,[ebp-0C]
 0058EE6B    call        @UStrClr
 0058EE70    lea         eax,[ebp-8]
 0058EE73    call        @IntfClear
 0058EE78    ret
>0058EE79    jmp         @HandleFinally
>0058EE7E    jmp         0058EE58
 0058EE80    pop         esi
 0058EE81    pop         ebx
 0058EE82    mov         esp,ebp
 0058EE84    pop         ebp
 0058EE85    ret
*}
end;

//0058EE98
function TXMLNodeList.Add(const Node:IXMLNode):Integer;
begin
{*
 0058EE98    push        ebx
 0058EE99    mov         ebx,eax
 0058EE9B    mov         ecx,edx
 0058EE9D    mov         eax,ebx
 0058EE9F    or          edx,0FFFFFFFF
 0058EEA2    call        TXMLNodeList.Insert
 0058EEA7    mov         eax,ebx
 0058EEA9    call        TXMLNodeList.GetCount
 0058EEAE    dec         eax
 0058EEAF    pop         ebx
 0058EEB0    ret
*}
end;

//0058EEB4
function TXMLNodeList.InternalInsert(Index:Integer; const Node:IXMLNode):Integer;
begin
{*
 0058EEB4    push        ebp
 0058EEB5    mov         ebp,esp
 0058EEB7    push        ecx
 0058EEB8    mov         ecx,6
 0058EEBD    push        0
 0058EEBF    push        0
 0058EEC1    dec         ecx
>0058EEC2    jne         0058EEBD
 0058EEC4    xchg        ecx,dword ptr [ebp-4]
 0058EEC7    push        ebx
 0058EEC8    push        esi
 0058EEC9    push        edi
 0058EECA    mov         dword ptr [ebp-4],ecx
 0058EECD    mov         esi,edx
 0058EECF    mov         ebx,eax
 0058EED1    xor         eax,eax
 0058EED3    push        ebp
 0058EED4    push        58EF9F
 0058EED9    push        dword ptr fs:[eax]
 0058EEDC    mov         dword ptr fs:[eax],esp
 0058EEDF    lea         eax,[ebp-18]
 0058EEE2    mov         edx,esi
 0058EEE4    mov         cl,0FC
 0058EEE6    call        @OleVarFromInt
 0058EEEB    lea         eax,[ebp-18]
 0058EEEE    push        eax
 0058EEEF    push        1
 0058EEF1    lea         eax,[ebp-8]
 0058EEF4    push        eax
 0058EEF5    mov         ecx,dword ptr [ebp-4]
 0058EEF8    xor         edx,edx
 0058EEFA    mov         eax,ebx
 0058EEFC    call        TXMLNodeList.DoNotify
 0058EF01    cmp         esi,0FFFFFFFF
>0058EF04    je          0058EF27
 0058EF06    lea         eax,[ebp-1C]
 0058EF09    mov         edx,dword ptr [ebp-4]
 0058EF0C    mov         ecx,58EFB0
 0058EF11    call        @IntfCast
 0058EF16    mov         ecx,dword ptr [ebp-1C]
 0058EF19    mov         edx,esi
 0058EF1B    mov         eax,dword ptr [ebx+0C]
 0058EF1E    mov         edi,dword ptr [eax]
 0058EF20    call        dword ptr [edi+3C]
 0058EF23    mov         edi,esi
>0058EF25    jmp         0058EF44
 0058EF27    lea         eax,[ebp-20]
 0058EF2A    mov         edx,dword ptr [ebp-4]
 0058EF2D    mov         ecx,58EFB0
 0058EF32    call        @IntfCast
 0058EF37    mov         edx,dword ptr [ebp-20]
 0058EF3A    mov         eax,dword ptr [ebx+0C]
 0058EF3D    mov         ecx,dword ptr [eax]
 0058EF3F    call        dword ptr [ecx+38]
 0058EF42    mov         edi,eax
 0058EF44    lea         eax,[ebp-34]
 0058EF47    mov         edx,esi
 0058EF49    mov         cl,0FC
 0058EF4B    call        @OleVarFromInt
 0058EF50    lea         eax,[ebp-34]
 0058EF53    push        eax
 0058EF54    push        0
 0058EF56    lea         eax,[ebp-24]
 0058EF59    push        eax
 0058EF5A    mov         ecx,dword ptr [ebp-4]
 0058EF5D    xor         edx,edx
 0058EF5F    mov         eax,ebx
 0058EF61    call        TXMLNodeList.DoNotify
 0058EF66    xor         eax,eax
 0058EF68    pop         edx
 0058EF69    pop         ecx
 0058EF6A    pop         ecx
 0058EF6B    mov         dword ptr fs:[eax],edx
 0058EF6E    push        58EFA6
 0058EF73    lea         eax,[ebp-34]
 0058EF76    call        @VarClr
 0058EF7B    lea         eax,[ebp-24]
 0058EF7E    mov         edx,dword ptr ds:[58A824];IXMLNode
 0058EF84    mov         ecx,3
 0058EF89    call        @FinalizeArray
 0058EF8E    lea         eax,[ebp-18]
 0058EF91    call        @VarClr
 0058EF96    lea         eax,[ebp-8]
 0058EF99    call        @IntfClear
 0058EF9E    ret
>0058EF9F    jmp         @HandleFinally
>0058EFA4    jmp         0058EF73
 0058EFA6    mov         eax,edi
 0058EFA8    pop         edi
 0058EFA9    pop         esi
 0058EFAA    pop         ebx
 0058EFAB    mov         esp,ebp
 0058EFAD    pop         ebp
 0058EFAE    ret
*}
end;

//0058EFC0
procedure InsertFormattingNode(const Len:Integer; const Index:Integer; Break:Boolean);
begin
{*
 0058EFC0    push        ebp
 0058EFC1    mov         ebp,esp
 0058EFC3    push        0
 0058EFC5    push        0
 0058EFC7    push        0
 0058EFC9    push        0
 0058EFCB    push        0
 0058EFCD    push        ebx
 0058EFCE    push        esi
 0058EFCF    push        edi
 0058EFD0    mov         ebx,ecx
 0058EFD2    mov         esi,edx
 0058EFD4    xor         edx,edx
 0058EFD6    push        ebp
 0058EFD7    push        58F0AE
 0058EFDC    push        dword ptr fs:[edx]
 0058EFDF    mov         dword ptr fs:[edx],esp
 0058EFE2    mov         edi,eax
 0058EFE4    test        edi,edi
>0058EFE6    jle         0058F00A
 0058EFE8    lea         edx,[ebp-0C]
 0058EFEB    mov         eax,dword ptr [ebp+8]
 0058EFEE    mov         eax,dword ptr [eax-4]
 0058EFF1    mov         eax,dword ptr [eax+18]
 0058EFF4    mov         eax,dword ptr [eax+1C]
 0058EFF7    call        TXMLDocument.GetNodeIndentStr
 0058EFFC    mov         edx,dword ptr [ebp-0C]
 0058EFFF    lea         eax,[ebp-8]
 0058F002    call        @UStrCat
 0058F007    dec         edi
>0058F008    jne         0058EFE8
 0058F00A    test        bl,bl
>0058F00C    je          0058F01E
 0058F00E    lea         eax,[ebp-8]
 0058F011    mov         ecx,dword ptr [ebp-8]
 0058F014    mov         edx,58F0C8;'
'
 0058F019    call        @UStrCat3
 0058F01E    mov         eax,dword ptr [ebp+8]
 0058F021    mov         eax,dword ptr [eax-4]
 0058F024    mov         ebx,dword ptr [eax+18]
 0058F027    push        0
 0058F029    mov         eax,dword ptr [ebx+1C]
 0058F02C    push        eax
 0058F02D    push        0
 0058F02F    lea         eax,[ebp-10]
 0058F032    push        eax
 0058F033    lea         edx,[ebp-14]
 0058F036    mov         eax,dword ptr [ebx+1C]
 0058F039    call        TXMLDocument.GetDOMDocument
 0058F03E    mov         eax,dword ptr [ebp-14]
 0058F041    mov         cl,3
 0058F043    mov         edx,dword ptr [ebp-8]
 0058F046    call        CreateDOMNode
 0058F04B    mov         ecx,dword ptr [ebp-10]
 0058F04E    mov         dl,1
 0058F050    mov         eax,[0058C024];TXMLNode
 0058F055    call        TXMLNode.Create
 0058F05A    mov         edx,eax
 0058F05C    test        edx,edx
>0058F05E    je          0058F063
 0058F060    sub         edx,0FFFFFFB8
 0058F063    lea         eax,[ebp-4]
 0058F066    call        @IntfCopy
 0058F06B    mov         eax,dword ptr [ebp+8]
 0058F06E    mov         eax,dword ptr [eax-4]
 0058F071    mov         ecx,dword ptr [ebp-4]
 0058F074    mov         edx,esi
 0058F076    call        TXMLNodeList.InternalInsert
 0058F07B    xor         eax,eax
 0058F07D    pop         edx
 0058F07E    pop         ecx
 0058F07F    pop         ecx
 0058F080    mov         dword ptr fs:[eax],edx
 0058F083    push        58F0B5
 0058F088    lea         eax,[ebp-14]
 0058F08B    call        @IntfClear
 0058F090    lea         eax,[ebp-10]
 0058F093    call        @IntfClear
 0058F098    lea         eax,[ebp-0C]
 0058F09B    mov         edx,2
 0058F0A0    call        @UStrArrayClr
 0058F0A5    lea         eax,[ebp-4]
 0058F0A8    call        @IntfClear
 0058F0AD    ret
>0058F0AE    jmp         @HandleFinally
>0058F0B3    jmp         0058F088
 0058F0B5    pop         edi
 0058F0B6    pop         esi
 0058F0B7    pop         ebx
 0058F0B8    mov         esp,ebp
 0058F0BA    pop         ebp
 0058F0BB    ret
*}
end;

//0058F0D0
procedure TXMLNodeList.Insert(Index:Integer; const Node:IXMLNode);
begin
{*
 0058F0D0    push        ebp
 0058F0D1    mov         ebp,esp
 0058F0D3    add         esp,0FFFFFFF8
 0058F0D6    push        ebx
 0058F0D7    push        esi
 0058F0D8    push        edi
 0058F0D9    xor         ebx,ebx
 0058F0DB    mov         dword ptr [ebp-8],ebx
 0058F0DE    mov         edi,ecx
 0058F0E0    mov         esi,edx
 0058F0E2    mov         dword ptr [ebp-4],eax
 0058F0E5    xor         eax,eax
 0058F0E7    push        ebp
 0058F0E8    push        58F1F3
 0058F0ED    push        dword ptr fs:[eax]
 0058F0F0    mov         dword ptr fs:[eax],esp
 0058F0F3    mov         eax,dword ptr [ebp-4]
 0058F0F6    mov         ebx,dword ptr [eax+18]
 0058F0F9    cmp         dword ptr [ebx+28],0
>0058F0FD    je          0058F1D1
 0058F103    cmp         dword ptr [ebx+24],0
>0058F107    jne         0058F1D1
 0058F10D    mov         eax,dword ptr [ebx+1C]
 0058F110    call        TXMLDocument.GetOptions
 0058F115    test        al,2
>0058F117    je          0058F1D1
 0058F11D    mov         eax,edi
 0058F11F    mov         edx,dword ptr [eax]
 0058F121    call        dword ptr [edx+38]
 0058F124    add         al,0FE
 0058F126    sub         al,2
>0058F128    jb          0058F1D1
 0058F12E    mov         eax,dword ptr [ebp-4]
 0058F131    call        TXMLNodeList.GetCount
 0058F136    test        eax,eax
>0058F138    jne         0058F154
 0058F13A    push        ebp
 0058F13B    mov         eax,dword ptr [ebp-4]
 0058F13E    mov         eax,dword ptr [eax+18]
 0058F141    mov         eax,dword ptr [eax+28]
 0058F144    call        TXMLNode.NestingLevel
 0058F149    mov         cl,1
 0058F14B    or          edx,0FFFFFFFF
 0058F14E    call        InsertFormattingNode
 0058F153    pop         ecx
 0058F154    cmp         esi,0FFFFFFFF
>0058F157    jne         0058F16A
 0058F159    push        ebp
 0058F15A    xor         ecx,ecx
 0058F15C    or          edx,0FFFFFFFF
 0058F15F    mov         eax,1
 0058F164    call        InsertFormattingNode
 0058F169    pop         ecx
 0058F16A    mov         ecx,edi
 0058F16C    mov         edx,esi
 0058F16E    mov         eax,dword ptr [ebp-4]
 0058F171    call        TXMLNodeList.InternalInsert
 0058F176    mov         ebx,eax
 0058F178    inc         esi
>0058F179    jne         0058F18D
 0058F17B    mov         eax,dword ptr [ebp-4]
 0058F17E    mov         eax,dword ptr [eax+18]
 0058F181    mov         eax,dword ptr [eax+28]
 0058F184    call        TXMLNode.NestingLevel
 0058F189    mov         esi,eax
>0058F18B    jmp         0058F19A
 0058F18D    mov         eax,dword ptr [ebp-4]
 0058F190    mov         eax,dword ptr [eax+18]
 0058F193    call        TXMLNode.NestingLevel
 0058F198    mov         esi,eax
 0058F19A    mov         eax,dword ptr [ebp-4]
 0058F19D    call        TXMLNodeList.GetCount
 0058F1A2    dec         eax
 0058F1A3    cmp         ebx,eax
>0058F1A5    jge         0058F1C1
 0058F1A7    lea         ecx,[ebp-8]
 0058F1AA    lea         edx,[ebx+1]
 0058F1AD    mov         eax,dword ptr [ebp-4]
 0058F1B0    call        TXMLNodeList.Get
 0058F1B5    mov         eax,dword ptr [ebp-8]
 0058F1B8    mov         edx,dword ptr [eax]
 0058F1BA    call        dword ptr [edx+38]
 0058F1BD    cmp         al,3
>0058F1BF    je          0058F1DD
 0058F1C1    push        ebp
 0058F1C2    lea         edx,[ebx+1]
 0058F1C5    mov         cl,1
 0058F1C7    mov         eax,esi
 0058F1C9    call        InsertFormattingNode
 0058F1CE    pop         ecx
>0058F1CF    jmp         0058F1DD
 0058F1D1    mov         ecx,edi
 0058F1D3    mov         edx,esi
 0058F1D5    mov         eax,dword ptr [ebp-4]
 0058F1D8    call        TXMLNodeList.InternalInsert
 0058F1DD    xor         eax,eax
 0058F1DF    pop         edx
 0058F1E0    pop         ecx
 0058F1E1    pop         ecx
 0058F1E2    mov         dword ptr fs:[eax],edx
 0058F1E5    push        58F1FA
 0058F1EA    lea         eax,[ebp-8]
 0058F1ED    call        @IntfClear
 0058F1F2    ret
>0058F1F3    jmp         @HandleFinally
>0058F1F8    jmp         0058F1EA
 0058F1FA    pop         edi
 0058F1FB    pop         esi
 0058F1FC    pop         ebx
 0058F1FD    pop         ecx
 0058F1FE    pop         ecx
 0058F1FF    pop         ebp
 0058F200    ret
*}
end;

//0058F204
function TXMLNodeList.Delete(const Index:Integer):Integer;
begin
{*
 0058F204    push        ebp
 0058F205    mov         ebp,esp
 0058F207    push        0
 0058F209    push        ebx
 0058F20A    push        esi
 0058F20B    mov         esi,edx
 0058F20D    mov         ebx,eax
 0058F20F    xor         eax,eax
 0058F211    push        ebp
 0058F212    push        58F24B
 0058F217    push        dword ptr fs:[eax]
 0058F21A    mov         dword ptr fs:[eax],esp
 0058F21D    lea         ecx,[ebp-4]
 0058F220    mov         edx,esi
 0058F222    mov         eax,ebx
 0058F224    call        TXMLNodeList.Get
 0058F229    mov         edx,dword ptr [ebp-4]
 0058F22C    mov         eax,ebx
 0058F22E    call        TXMLNodeList.Remove
 0058F233    mov         ebx,eax
 0058F235    xor         eax,eax
 0058F237    pop         edx
 0058F238    pop         ecx
 0058F239    pop         ecx
 0058F23A    mov         dword ptr fs:[eax],edx
 0058F23D    push        58F252
 0058F242    lea         eax,[ebp-4]
 0058F245    call        @IntfClear
 0058F24A    ret
>0058F24B    jmp         @HandleFinally
>0058F250    jmp         0058F242
 0058F252    mov         eax,ebx
 0058F254    pop         esi
 0058F255    pop         ebx
 0058F256    pop         ecx
 0058F257    pop         ebp
 0058F258    ret
*}
end;

//0058F25C
function TXMLNodeList.IndexOf(const Name:DOMString):Integer;
begin
{*
 0058F25C    mov         ecx,dword ptr [eax+20]
 0058F25F    call        TXMLNodeList.Delete
 0058F264    ret
*}
end;

//0058F268
function TXMLNodeList.Delete(const Name:DOMString; const NamespaceURI:DOMString):Integer;
begin
{*
 0058F268    push        ebp
 0058F269    mov         ebp,esp
 0058F26B    push        0
 0058F26D    push        ebx
 0058F26E    push        esi
 0058F26F    push        edi
 0058F270    mov         edi,ecx
 0058F272    mov         esi,edx
 0058F274    mov         ebx,eax
 0058F276    xor         eax,eax
 0058F278    push        ebp
 0058F279    push        58F2C0
 0058F27E    push        dword ptr fs:[eax]
 0058F281    mov         dword ptr fs:[eax],esp
 0058F284    lea         eax,[ebp-4]
 0058F287    push        eax
 0058F288    mov         ecx,edi
 0058F28A    mov         edx,esi
 0058F28C    mov         eax,ebx
 0058F28E    call        TXMLNodeList.FindNode
 0058F293    cmp         dword ptr [ebp-4],0
>0058F297    je          0058F2A7
 0058F299    mov         edx,dword ptr [ebp-4]
 0058F29C    mov         eax,ebx
 0058F29E    call        TXMLNodeList.Remove
 0058F2A3    mov         ebx,eax
>0058F2A5    jmp         0058F2AA
 0058F2A7    or          ebx,0FFFFFFFF
 0058F2AA    xor         eax,eax
 0058F2AC    pop         edx
 0058F2AD    pop         ecx
 0058F2AE    pop         ecx
 0058F2AF    mov         dword ptr fs:[eax],edx
 0058F2B2    push        58F2C7
 0058F2B7    lea         eax,[ebp-4]
 0058F2BA    call        @IntfClear
 0058F2BF    ret
>0058F2C0    jmp         @HandleFinally
>0058F2C5    jmp         0058F2B7
 0058F2C7    mov         eax,ebx
 0058F2C9    pop         edi
 0058F2CA    pop         esi
 0058F2CB    pop         ebx
 0058F2CC    pop         ecx
 0058F2CD    pop         ebp
 0058F2CE    ret
*}
end;

//0058F2D0
function TXMLNodeList.Remove(const Node:IXMLNode):Integer;
begin
{*
 0058F2D0    push        ebp
 0058F2D1    mov         ebp,esp
 0058F2D3    mov         ecx,5
 0058F2D8    push        0
 0058F2DA    push        0
 0058F2DC    dec         ecx
>0058F2DD    jne         0058F2D8
 0058F2DF    push        ecx
 0058F2E0    push        ebx
 0058F2E1    push        esi
 0058F2E2    push        edi
 0058F2E3    mov         esi,edx
 0058F2E5    mov         ebx,eax
 0058F2E7    xor         eax,eax
 0058F2E9    push        ebp
 0058F2EA    push        58F392
 0058F2EF    push        dword ptr fs:[eax]
 0058F2F2    mov         dword ptr fs:[eax],esp
 0058F2F5    lea         eax,[ebp-14]
 0058F2F8    mov         edx,0FFFFFFFF
 0058F2FD    mov         cl,0FF
 0058F2FF    call        @OleVarFromInt
 0058F304    lea         eax,[ebp-14]
 0058F307    push        eax
 0058F308    push        1
 0058F30A    lea         eax,[ebp-4]
 0058F30D    push        eax
 0058F30E    mov         ecx,esi
 0058F310    mov         dl,1
 0058F312    mov         eax,ebx
 0058F314    call        TXMLNodeList.DoNotify
 0058F319    lea         eax,[ebp-18]
 0058F31C    mov         edx,esi
 0058F31E    mov         ecx,58F3A4
 0058F323    call        @IntfCast
 0058F328    mov         edx,dword ptr [ebp-18]
 0058F32B    mov         eax,dword ptr [ebx+0C]
 0058F32E    mov         ecx,dword ptr [eax]
 0058F330    call        dword ptr [ecx+44]
 0058F333    mov         edi,eax
 0058F335    lea         eax,[ebp-2C]
 0058F338    mov         edx,0FFFFFFFF
 0058F33D    mov         cl,0FF
 0058F33F    call        @OleVarFromInt
 0058F344    lea         eax,[ebp-2C]
 0058F347    push        eax
 0058F348    push        0
 0058F34A    lea         eax,[ebp-1C]
 0058F34D    push        eax
 0058F34E    mov         ecx,esi
 0058F350    mov         dl,1
 0058F352    mov         eax,ebx
 0058F354    call        TXMLNodeList.DoNotify
 0058F359    xor         eax,eax
 0058F35B    pop         edx
 0058F35C    pop         ecx
 0058F35D    pop         ecx
 0058F35E    mov         dword ptr fs:[eax],edx
 0058F361    push        58F399
 0058F366    lea         eax,[ebp-2C]
 0058F369    call        @VarClr
 0058F36E    lea         eax,[ebp-1C]
 0058F371    mov         edx,dword ptr ds:[58A824];IXMLNode
 0058F377    mov         ecx,2
 0058F37C    call        @FinalizeArray
 0058F381    lea         eax,[ebp-14]
 0058F384    call        @VarClr
 0058F389    lea         eax,[ebp-4]
 0058F38C    call        @IntfClear
 0058F391    ret
>0058F392    jmp         @HandleFinally
>0058F397    jmp         0058F366
 0058F399    mov         eax,edi
 0058F39B    pop         edi
 0058F39C    pop         esi
 0058F39D    pop         ebx
 0058F39E    mov         esp,ebp
 0058F3A0    pop         ebp
 0058F3A1    ret
*}
end;

//0058F3B4
function TXMLNodeList.ReplaceNode(const OldNode:IXMLNode; const NewNode:IXMLNode):IXMLNode;
begin
{*
 0058F3B4    push        ebp
 0058F3B5    mov         ebp,esp
 0058F3B7    push        ebx
 0058F3B8    push        esi
 0058F3B9    push        edi
 0058F3BA    mov         edi,ecx
 0058F3BC    mov         esi,edx
 0058F3BE    mov         ebx,eax
 0058F3C0    mov         edx,esi
 0058F3C2    mov         eax,ebx
 0058F3C4    call        TXMLNodeList.Remove
 0058F3C9    mov         ecx,edi
 0058F3CB    mov         edx,eax
 0058F3CD    mov         eax,ebx
 0058F3CF    call        TXMLNodeList.Insert
 0058F3D4    mov         eax,dword ptr [ebp+8]
 0058F3D7    mov         edx,esi
 0058F3D9    call        @IntfCopy
 0058F3DE    pop         edi
 0058F3DF    pop         esi
 0058F3E0    pop         ebx
 0058F3E1    pop         ebp
 0058F3E2    ret         4
*}
end;

//0058F3E8
procedure TXMLNodeList.Clear;
begin
{*
 0058F3E8    push        ebp
 0058F3E9    mov         ebp,esp
 0058F3EB    add         esp,0FFFFFFF8
 0058F3EE    xor         edx,edx
 0058F3F0    mov         dword ptr [ebp-8],edx
 0058F3F3    mov         dword ptr [ebp-4],eax
 0058F3F6    xor         eax,eax
 0058F3F8    push        ebp
 0058F3F9    push        58F479
 0058F3FE    push        dword ptr fs:[eax]
 0058F401    mov         dword ptr fs:[eax],esp
 0058F404    mov         eax,dword ptr [ebp-4]
 0058F407    mov         eax,dword ptr [eax+0C]
 0058F40A    mov         edx,dword ptr [eax]
 0058F40C    call        dword ptr [edx+48]
 0058F40F    xor         eax,eax
 0058F411    push        ebp
 0058F412    push        58F45C
 0058F417    push        dword ptr fs:[eax]
 0058F41A    mov         dword ptr fs:[eax],esp
>0058F41D    jmp         0058F437
 0058F41F    lea         ecx,[ebp-8]
 0058F422    xor         edx,edx
 0058F424    mov         eax,dword ptr [ebp-4]
 0058F427    call        TXMLNodeList.Get
 0058F42C    mov         edx,dword ptr [ebp-8]
 0058F42F    mov         eax,dword ptr [ebp-4]
 0058F432    call        TXMLNodeList.Remove
 0058F437    mov         eax,dword ptr [ebp-4]
 0058F43A    call        TXMLNodeList.GetCount
 0058F43F    test        eax,eax
>0058F441    jg          0058F41F
 0058F443    xor         eax,eax
 0058F445    pop         edx
 0058F446    pop         ecx
 0058F447    pop         ecx
 0058F448    mov         dword ptr fs:[eax],edx
 0058F44B    push        58F463
 0058F450    mov         eax,dword ptr [ebp-4]
 0058F453    mov         eax,dword ptr [eax+0C]
 0058F456    mov         edx,dword ptr [eax]
 0058F458    call        dword ptr [edx+4C]
 0058F45B    ret
>0058F45C    jmp         @HandleFinally
>0058F461    jmp         0058F450
 0058F463    xor         eax,eax
 0058F465    pop         edx
 0058F466    pop         ecx
 0058F467    pop         ecx
 0058F468    mov         dword ptr fs:[eax],edx
 0058F46B    push        58F480
 0058F470    lea         eax,[ebp-8]
 0058F473    call        @IntfClear
 0058F478    ret
>0058F479    jmp         @HandleFinally
>0058F47E    jmp         0058F470
 0058F480    pop         ecx
 0058F481    pop         ecx
 0058F482    pop         ebp
 0058F483    ret
*}
end;

//0058F484
{*function sub_0058F484(?:?):?;
begin
 0058F484    mov         eax,dword ptr [eax+1C]
 0058F487    ret
end;*}

//0058F488
constructor TXMLNode.Create(OwnerDoc:TXMLDocument; AParentNode:TXMLNode);
begin
{*
 0058F488    push        ebp
 0058F489    mov         ebp,esp
 0058F48B    push        0
 0058F48D    push        ebx
 0058F48E    push        esi
 0058F48F    push        edi
 0058F490    test        dl,dl
>0058F492    je          0058F49C
 0058F494    add         esp,0FFFFFFF0
 0058F497    call        @ClassCreate
 0058F49C    mov         esi,ecx
 0058F49E    mov         ebx,edx
 0058F4A0    mov         edi,eax
 0058F4A2    xor         eax,eax
 0058F4A4    push        ebp
 0058F4A5    push        58F524
 0058F4AA    push        dword ptr fs:[eax]
 0058F4AD    mov         dword ptr fs:[eax],esp
 0058F4B0    xor         edx,edx
 0058F4B2    mov         eax,edi
 0058F4B4    call        TObject.Create
 0058F4B9    test        esi,esi
>0058F4BB    jne         0058F4D2
 0058F4BD    lea         edx,[ebp-4]
 0058F4C0    mov         eax,[0078D39C];^SResString591:TResStringRec
 0058F4C5    call        LoadResString
 0058F4CA    mov         eax,dword ptr [ebp-4]
 0058F4CD    call        XMLDocError
 0058F4D2    lea         eax,[edi+20]
 0058F4D5    mov         edx,esi
 0058F4D7    call        @IntfCopy
 0058F4DC    mov         eax,dword ptr [ebp+0C]
 0058F4DF    mov         dword ptr [edi+28],eax
 0058F4E2    mov         eax,dword ptr [ebp+8]
 0058F4E5    mov         dword ptr [edi+1C],eax
 0058F4E8    mov         esi,dword ptr [edi+28]
 0058F4EB    test        esi,esi
>0058F4ED    je          0058F505
 0058F4EF    mov         eax,esi
 0058F4F1    call        TXMLNode.GetNodeType
 0058F4F6    cmp         al,9
>0058F4F8    jne         0058F505
 0058F4FA    mov         eax,edi
 0058F4FC    call        TXMLNode.GetNodeType
 0058F501    cmp         al,1
>0058F503    je          0058F509
 0058F505    xor         eax,eax
>0058F507    jmp         0058F50B
 0058F509    mov         al,1
 0058F50B    mov         byte ptr [edi+30],al
 0058F50E    xor         eax,eax
 0058F510    pop         edx
 0058F511    pop         ecx
 0058F512    pop         ecx
 0058F513    mov         dword ptr fs:[eax],edx
 0058F516    push        58F52B
 0058F51B    lea         eax,[ebp-4]
 0058F51E    call        @UStrClr
 0058F523    ret
>0058F524    jmp         @HandleFinally
>0058F529    jmp         0058F51B
 0058F52B    mov         eax,edi
 0058F52D    test        bl,bl
>0058F52F    je          0058F540
 0058F531    call        @AfterConstruction
 0058F536    pop         dword ptr fs:[0]
 0058F53D    add         esp,0C
 0058F540    mov         eax,edi
 0058F542    pop         edi
 0058F543    pop         esi
 0058F544    pop         ebx
 0058F545    pop         ecx
 0058F546    pop         ebp
 0058F547    ret         8
*}
end;

//0058F54C
constructor TXMLNode.CreateHosted;
begin
{*
 0058F54C    push        ebp
 0058F54D    mov         ebp,esp
 0058F54F    push        ecx
 0058F550    push        ebx
 0058F551    push        esi
 0058F552    test        dl,dl
>0058F554    je          0058F55E
 0058F556    add         esp,0FFFFFFF0
 0058F559    call        @ClassCreate
 0058F55E    mov         ebx,ecx
 0058F560    mov         byte ptr [ebp-1],dl
 0058F563    mov         esi,eax
>0058F565    jmp         0058F569
 0058F567    mov         ebx,eax
 0058F569    mov         eax,dword ptr [ebx+24]
 0058F56C    test        eax,eax
>0058F56E    jne         0058F567
 0058F570    mov         eax,dword ptr [ebx+28]
 0058F573    push        eax
 0058F574    mov         eax,dword ptr [ebx+1C]
 0058F577    push        eax
 0058F578    mov         ecx,dword ptr [ebx+20]
 0058F57B    xor         edx,edx
 0058F57D    mov         eax,esi
 0058F57F    call        TXMLNode.Create
 0058F584    mov         byte ptr [esi+30],0
 0058F588    mov         eax,ebx
 0058F58A    mov         dword ptr [esi+24],eax
 0058F58D    mov         edx,esi
 0058F58F    call        TXMLNode.AddHostedNode
 0058F594    mov         eax,esi
 0058F596    cmp         byte ptr [ebp-1],0
>0058F59A    je          0058F5AB
 0058F59C    call        @AfterConstruction
 0058F5A1    pop         dword ptr fs:[0]
 0058F5A8    add         esp,0C
 0058F5AB    mov         eax,esi
 0058F5AD    pop         esi
 0058F5AE    pop         ebx
 0058F5AF    pop         ecx
 0058F5B0    pop         ebp
 0058F5B1    ret
*}
end;

//0058F5B4
destructor TXMLNode.Destroy();
begin
{*
 0058F5B4    push        ebx
 0058F5B5    push        esi
 0058F5B6    push        edi
 0058F5B7    call        @BeforeDestruction
 0058F5BC    mov         ebx,edx
 0058F5BE    mov         esi,eax
 0058F5C0    mov         edx,ebx
 0058F5C2    and         dl,0FC
 0058F5C5    mov         eax,esi
 0058F5C7    call        TObject.Destroy
 0058F5CC    cmp         dword ptr [esi+2C],0
>0058F5D0    je          0058F5FF
 0058F5D2    mov         eax,dword ptr [esi+2C]
 0058F5D5    call        @DynArrayLength
 0058F5DA    dec         eax
 0058F5DB    test        eax,eax
>0058F5DD    jl          0058F5F1
 0058F5DF    inc         eax
 0058F5E0    xor         edx,edx
 0058F5E2    mov         ecx,dword ptr [esi+2C]
 0058F5E5    mov         ecx,dword ptr [ecx+edx*4]
 0058F5E8    xor         edi,edi
 0058F5EA    mov         dword ptr [ecx+24],edi
 0058F5ED    inc         edx
 0058F5EE    dec         eax
>0058F5EF    jne         0058F5E2
 0058F5F1    lea         eax,[esi+2C]
 0058F5F4    mov         edx,dword ptr ds:[58BB5C];TXMLNodeArray
 0058F5FA    call        @DynArrayClear
 0058F5FF    mov         eax,dword ptr [esi+24]
 0058F602    test        eax,eax
>0058F604    je          0058F60D
 0058F606    mov         edx,esi
 0058F608    call        TXMLNode.RemoveHostedNode
 0058F60D    test        bl,bl
>0058F60F    jle         0058F618
 0058F611    mov         eax,esi
 0058F613    call        @ClassDestroy
 0058F618    pop         edi
 0058F619    pop         esi
 0058F61A    pop         ebx
 0058F61B    ret
*}
end;

//0058F61C
function TXMLNode._AddRef:Integer; stdcall;
begin
{*
 0058F61C    push        ebp
 0058F61D    mov         ebp,esp
 0058F61F    push        ebx
 0058F620    push        esi
 0058F621    mov         ebx,dword ptr [ebp+8]
 0058F624    push        ebx
 0058F625    call        TInterfacedObject._AddRef
 0058F62A    mov         esi,eax
 0058F62C    cmp         byte ptr [ebx+30],0
>0058F630    je          0058F646
 0058F632    cmp         esi,1
>0058F635    jle         0058F646
 0058F637    cmp         dword ptr [ebx+1C],0
>0058F63B    je          0058F646
 0058F63D    mov         eax,dword ptr [ebx+1C]
 0058F640    push        eax
 0058F641    call        TXMLDocument._AddRef
 0058F646    mov         eax,esi
 0058F648    pop         esi
 0058F649    pop         ebx
 0058F64A    pop         ebp
 0058F64B    ret         4
*}
end;

//0058F650
function TXMLNode._Release:Integer; stdcall;
begin
{*
 0058F650    push        ebp
 0058F651    mov         ebp,esp
 0058F653    push        ebx
 0058F654    push        esi
 0058F655    mov         ebx,dword ptr [ebp+8]
 0058F658    push        ebx
 0058F659    call        TInterfacedObject._Release
 0058F65E    mov         esi,eax
 0058F660    test        esi,esi
>0058F662    jle         0058F679
 0058F664    cmp         byte ptr [ebx+30],0
>0058F668    je          0058F679
 0058F66A    cmp         dword ptr [ebx+1C],0
>0058F66E    je          0058F679
 0058F670    mov         eax,dword ptr [ebx+1C]
 0058F673    push        eax
 0058F674    call        TXMLDocument._Release
 0058F679    mov         eax,esi
 0058F67B    pop         esi
 0058F67C    pop         ebx
 0058F67D    pop         ebp
 0058F67E    ret         4
*}
end;

//0058F684
procedure TXMLNode.ClearDocumentRef;
begin
{*
 0058F684    push        ebp
 0058F685    mov         ebp,esp
 0058F687    mov         ecx,6
 0058F68C    push        0
 0058F68E    push        0
 0058F690    dec         ecx
>0058F691    jne         0058F68C
 0058F693    push        ecx
 0058F694    push        ebx
 0058F695    push        esi
 0058F696    push        edi
 0058F697    mov         esi,eax
 0058F699    xor         eax,eax
 0058F69B    push        ebp
 0058F69C    push        58F79C
 0058F6A1    push        dword ptr fs:[eax]
 0058F6A4    mov         dword ptr fs:[eax],esp
 0058F6A7    xor         eax,eax
 0058F6A9    mov         dword ptr [esi+1C],eax
 0058F6AC    cmp         dword ptr [esi+10],0
>0058F6B0    je          0058F705
 0058F6B2    mov         eax,dword ptr [esi+10]
 0058F6B5    mov         edx,dword ptr [eax]
 0058F6B7    call        dword ptr [edx+0C]
 0058F6BA    mov         ebx,eax
 0058F6BC    dec         ebx
 0058F6BD    test        ebx,ebx
>0058F6BF    jl          0058F705
 0058F6C1    inc         ebx
 0058F6C2    mov         dword ptr [ebp-4],0
 0058F6C9    lea         eax,[ebp-1C]
 0058F6CC    mov         edx,dword ptr [ebp-4]
 0058F6CF    mov         cl,0FC
 0058F6D1    call        @OleVarFromInt
 0058F6D6    lea         edx,[ebp-1C]
 0058F6D9    lea         ecx,[ebp-0C]
 0058F6DC    mov         eax,dword ptr [esi+10]
 0058F6DF    mov         edi,dword ptr [eax]
 0058F6E1    call        dword ptr [edi+10]
 0058F6E4    mov         edx,dword ptr [ebp-0C]
 0058F6E7    lea         eax,[ebp-8]
 0058F6EA    mov         ecx,58F7AC
 0058F6EF    call        @IntfCast
 0058F6F4    mov         eax,dword ptr [ebp-8]
 0058F6F7    mov         edx,dword ptr [eax]
 0058F6F9    call        dword ptr [edx+0B4]
 0058F6FF    inc         dword ptr [ebp-4]
 0058F702    dec         ebx
>0058F703    jne         0058F6C9
 0058F705    cmp         dword ptr [esi+0C],0
>0058F709    je          0058F75E
 0058F70B    mov         eax,dword ptr [esi+0C]
 0058F70E    mov         edx,dword ptr [eax]
 0058F710    call        dword ptr [edx+0C]
 0058F713    mov         ebx,eax
 0058F715    dec         ebx
 0058F716    test        ebx,ebx
>0058F718    jl          0058F75E
 0058F71A    inc         ebx
 0058F71B    mov         dword ptr [ebp-4],0
 0058F722    lea         eax,[ebp-34]
 0058F725    mov         edx,dword ptr [ebp-4]
 0058F728    mov         cl,0FC
 0058F72A    call        @OleVarFromInt
 0058F72F    lea         edx,[ebp-34]
 0058F732    lea         ecx,[ebp-24]
 0058F735    mov         eax,dword ptr [esi+0C]
 0058F738    mov         edi,dword ptr [eax]
 0058F73A    call        dword ptr [edi+10]
 0058F73D    mov         edx,dword ptr [ebp-24]
 0058F740    lea         eax,[ebp-20]
 0058F743    mov         ecx,58F7AC
 0058F748    call        @IntfCast
 0058F74D    mov         eax,dword ptr [ebp-20]
 0058F750    mov         edx,dword ptr [eax]
 0058F752    call        dword ptr [edx+0B4]
 0058F758    inc         dword ptr [ebp-4]
 0058F75B    dec         ebx
>0058F75C    jne         0058F722
 0058F75E    xor         eax,eax
 0058F760    pop         edx
 0058F761    pop         ecx
 0058F762    pop         ecx
 0058F763    mov         dword ptr fs:[eax],edx
 0058F766    push        58F7A3
 0058F76B    lea         eax,[ebp-34]
 0058F76E    call        @VarClr
 0058F773    lea         eax,[ebp-24]
 0058F776    call        @IntfClear
 0058F77B    lea         eax,[ebp-20]
 0058F77E    call        @IntfClear
 0058F783    lea         eax,[ebp-1C]
 0058F786    call        @VarClr
 0058F78B    lea         eax,[ebp-0C]
 0058F78E    call        @IntfClear
 0058F793    lea         eax,[ebp-8]
 0058F796    call        @IntfClear
 0058F79B    ret
>0058F79C    jmp         @HandleFinally
>0058F7A1    jmp         0058F76B
 0058F7A3    pop         edi
 0058F7A4    pop         esi
 0058F7A5    pop         ebx
 0058F7A6    mov         esp,ebp
 0058F7A8    pop         ebp
 0058F7A9    ret
*}
end;

//0058F7BC
procedure TXMLNode.CreateAttributeList;
begin
{*
 0058F7BC    push        ebp
 0058F7BD    mov         ebp,esp
 0058F7BF    mov         ecx,4
 0058F7C4    push        0
 0058F7C6    push        0
 0058F7C8    dec         ecx
>0058F7C9    jne         0058F7C4
 0058F7CB    push        ecx
 0058F7CC    push        ebx
 0058F7CD    push        esi
 0058F7CE    push        edi
 0058F7CF    mov         dword ptr [ebp-4],edx
 0058F7D2    mov         ebx,eax
 0058F7D4    xor         eax,eax
 0058F7D6    push        ebp
 0058F7D7    push        58F8EF
 0058F7DC    push        dword ptr fs:[eax]
 0058F7DF    mov         dword ptr fs:[eax],esp
 0058F7E2    push        0
 0058F7E4    push        ebx
 0058F7E5    push        5900F0;TXMLNode.AttributeListNotify
 0058F7EA    mov         ecx,ebx
 0058F7EC    mov         dl,1
 0058F7EE    mov         eax,[0058B96C];TXMLNodeList
 0058F7F3    call        TXMLNodeList.Create
 0058F7F8    mov         dword ptr [ebp-0C],eax
 0058F7FB    lea         eax,[ebp-10]
 0058F7FE    call        @IntfClear
 0058F803    push        eax
 0058F804    mov         eax,dword ptr [ebx+20]
 0058F807    push        eax
 0058F808    mov         eax,dword ptr [eax]
 0058F80A    call        dword ptr [eax+34]
 0058F80D    call        @CheckAutoResult
 0058F812    cmp         dword ptr [ebp-10],0
>0058F816    je          0058F8A7
 0058F81C    lea         eax,[ebp-14]
 0058F81F    push        eax
 0058F820    lea         eax,[ebp-18]
 0058F823    call        @IntfClear
 0058F828    push        eax
 0058F829    mov         eax,dword ptr [ebx+20]
 0058F82C    push        eax
 0058F82D    mov         eax,dword ptr [eax]
 0058F82F    call        dword ptr [eax+34]
 0058F832    call        @CheckAutoResult
 0058F837    mov         eax,dword ptr [ebp-18]
 0058F83A    push        eax
 0058F83B    mov         eax,dword ptr [eax]
 0058F83D    call        dword ptr [eax+10]
 0058F840    call        @CheckAutoResult
 0058F845    mov         esi,dword ptr [ebp-14]
 0058F848    dec         esi
 0058F849    test        esi,esi
>0058F84B    jl          0058F8A7
 0058F84D    inc         esi
 0058F84E    mov         dword ptr [ebp-8],0
 0058F855    lea         eax,[ebp-20]
 0058F858    call        @IntfClear
 0058F85D    push        eax
 0058F85E    mov         eax,dword ptr [ebp-8]
 0058F861    push        eax
 0058F862    lea         eax,[ebp-24]
 0058F865    call        @IntfClear
 0058F86A    push        eax
 0058F86B    mov         eax,dword ptr [ebx+20]
 0058F86E    push        eax
 0058F86F    mov         eax,dword ptr [eax]
 0058F871    call        dword ptr [eax+34]
 0058F874    call        @CheckAutoResult
 0058F879    mov         eax,dword ptr [ebp-24]
 0058F87C    push        eax
 0058F87D    mov         eax,dword ptr [eax]
 0058F87F    call        dword ptr [eax+0C]
 0058F882    call        @CheckAutoResult
 0058F887    mov         edx,dword ptr [ebp-20]
 0058F88A    lea         ecx,[ebp-1C]
 0058F88D    mov         eax,ebx
 0058F88F    mov         edi,dword ptr [eax]
 0058F891    call        dword ptr [edi]
 0058F893    mov         edx,dword ptr [ebp-1C]
 0058F896    mov         eax,dword ptr [ebp-0C]
 0058F899    mov         eax,dword ptr [eax+0C]
 0058F89C    mov         ecx,dword ptr [eax]
 0058F89E    call        dword ptr [ecx+38]
 0058F8A1    inc         dword ptr [ebp-8]
 0058F8A4    dec         esi
>0058F8A5    jne         0058F855
 0058F8A7    mov         eax,dword ptr [ebp-4]
 0058F8AA    mov         edx,dword ptr [ebp-0C]
 0058F8AD    test        edx,edx
>0058F8AF    je          0058F8B4
 0058F8B1    sub         edx,0FFFFFFDC
 0058F8B4    call        @IntfCopy
 0058F8B9    xor         eax,eax
 0058F8BB    pop         edx
 0058F8BC    pop         ecx
 0058F8BD    pop         ecx
 0058F8BE    mov         dword ptr fs:[eax],edx
 0058F8C1    push        58F8F6
 0058F8C6    lea         eax,[ebp-24]
 0058F8C9    call        @IntfClear
 0058F8CE    lea         eax,[ebp-20]
 0058F8D1    call        @IntfClear
 0058F8D6    lea         eax,[ebp-1C]
 0058F8D9    call        @IntfClear
 0058F8DE    lea         eax,[ebp-18]
 0058F8E1    call        @IntfClear
 0058F8E6    lea         eax,[ebp-10]
 0058F8E9    call        @IntfClear
 0058F8EE    ret
>0058F8EF    jmp         @HandleFinally
>0058F8F4    jmp         0058F8C6
 0058F8F6    pop         edi
 0058F8F7    pop         esi
 0058F8F8    pop         ebx
 0058F8F9    mov         esp,ebp
 0058F8FB    pop         ebp
 0058F8FC    ret
*}
end;

//0058F900
function TXMLNode.GetAttributeNodes:IXMLNodeList;
begin
{*
 0058F900    push        ebp
 0058F901    mov         ebp,esp
 0058F903    push        0
 0058F905    push        ebx
 0058F906    push        esi
 0058F907    push        edi
 0058F908    mov         edi,edx
 0058F90A    mov         ebx,eax
 0058F90C    xor         eax,eax
 0058F90E    push        ebp
 0058F90F    push        58F96A
 0058F914    push        dword ptr fs:[eax]
 0058F917    mov         dword ptr fs:[eax],esp
 0058F91A    mov         esi,dword ptr [ebx+24]
 0058F91D    test        esi,esi
>0058F91F    je          0058F92C
 0058F921    mov         edx,edi
 0058F923    mov         eax,esi
 0058F925    call        TXMLNode.GetAttributeNodes
>0058F92A    jmp         0058F954
 0058F92C    cmp         dword ptr [ebx+0C],0
>0058F930    jne         0058F94A
 0058F932    lea         edx,[ebp-4]
 0058F935    mov         eax,ebx
 0058F937    mov         si,0FFFF
 0058F93B    call        @CallDynaInst
 0058F940    mov         edx,dword ptr [ebp-4]
 0058F943    mov         eax,ebx
 0058F945    mov         ecx,dword ptr [eax]
 0058F947    call        dword ptr [ecx+14]
 0058F94A    mov         eax,edi
 0058F94C    mov         edx,dword ptr [ebx+0C]
 0058F94F    call        @IntfCopy
 0058F954    xor         eax,eax
 0058F956    pop         edx
 0058F957    pop         ecx
 0058F958    pop         ecx
 0058F959    mov         dword ptr fs:[eax],edx
 0058F95C    push        58F971
 0058F961    lea         eax,[ebp-4]
 0058F964    call        @IntfClear
 0058F969    ret
>0058F96A    jmp         @HandleFinally
>0058F96F    jmp         0058F961
 0058F971    pop         edi
 0058F972    pop         esi
 0058F973    pop         ebx
 0058F974    pop         ecx
 0058F975    pop         ebp
 0058F976    ret
*}
end;

//0058F978
procedure TXMLNode.SetAttributeNodes(const Value:IXMLNodeList);
begin
{*
 0058F978    push        ebx
 0058F979    push        esi
 0058F97A    push        edi
 0058F97B    push        ebp
 0058F97C    mov         ebp,edx
 0058F97E    mov         ebx,eax
 0058F980    cmp         dword ptr [ebx+24],0
>0058F984    jne         0058F9B9
 0058F986    lea         eax,[ebx+0C]
 0058F989    mov         edx,ebp
 0058F98B    call        @IntfCopy
 0058F990    cmp         dword ptr [ebx+2C],0
>0058F994    je          0058F9B9
 0058F996    mov         eax,dword ptr [ebx+2C]
 0058F999    call        @DynArrayLength
 0058F99E    mov         esi,eax
 0058F9A0    dec         esi
 0058F9A1    test        esi,esi
>0058F9A3    jl          0058F9B9
 0058F9A5    inc         esi
 0058F9A6    xor         edi,edi
 0058F9A8    mov         eax,dword ptr [ebx+2C]
 0058F9AB    mov         eax,dword ptr [eax+edi*4]
 0058F9AE    mov         edx,ebp
 0058F9B0    mov         ecx,dword ptr [eax]
 0058F9B2    call        dword ptr [ecx+14]
 0058F9B5    inc         edi
 0058F9B6    dec         esi
>0058F9B7    jne         0058F9A8
 0058F9B9    pop         ebp
 0058F9BA    pop         edi
 0058F9BB    pop         esi
 0058F9BC    pop         ebx
 0058F9BD    ret
*}
end;

//0058F9C0
function TXMLNode.HasAttribute(const Name:DOMString):Boolean;
begin
{*
 0058F9C0    push        ebp
 0058F9C1    mov         ebp,esp
 0058F9C3    push        0
 0058F9C5    push        0
 0058F9C7    push        0
 0058F9C9    push        ebx
 0058F9CA    push        esi
 0058F9CB    mov         esi,edx
 0058F9CD    mov         ebx,eax
 0058F9CF    xor         eax,eax
 0058F9D1    push        ebp
 0058F9D2    push        58FA4C
 0058F9D7    push        dword ptr fs:[eax]
 0058F9DA    mov         dword ptr fs:[eax],esp
 0058F9DD    mov         eax,ebx
 0058F9DF    call        TXMLNode.GetNodeType
 0058F9E4    cmp         al,1
>0058F9E6    jne         0058FA14
 0058F9E8    lea         eax,[ebp-4]
 0058F9EB    push        eax
 0058F9EC    push        esi
 0058F9ED    lea         edx,[ebp-8]
 0058F9F0    mov         eax,ebx
 0058F9F2    call        TXMLNode.DOMElement
 0058F9F7    mov         eax,dword ptr [ebp-8]
 0058F9FA    push        eax
 0058F9FB    mov         eax,dword ptr [eax]
 0058F9FD    call        dword ptr [eax+0A0]
 0058FA03    call        @CheckAutoResult
 0058FA08    cmp         word ptr [ebp-4],1
 0058FA0D    sbb         eax,eax
 0058FA0F    inc         eax
 0058FA10    mov         ebx,eax
>0058FA12    jmp         0058FA2E
 0058FA14    lea         edx,[ebp-0C]
 0058FA17    mov         eax,ebx
 0058FA19    call        TXMLNode.GetAttributeNodes
 0058FA1E    mov         eax,dword ptr [ebp-0C]
 0058FA21    mov         edx,esi
 0058FA23    mov         ecx,dword ptr [eax]
 0058FA25    call        dword ptr [ecx+50]
 0058FA28    inc         eax
 0058FA29    setne       al
 0058FA2C    mov         ebx,eax
 0058FA2E    xor         eax,eax
 0058FA30    pop         edx
 0058FA31    pop         ecx
 0058FA32    pop         ecx
 0058FA33    mov         dword ptr fs:[eax],edx
 0058FA36    push        58FA53
 0058FA3B    lea         eax,[ebp-0C]
 0058FA3E    call        @IntfClear
 0058FA43    lea         eax,[ebp-8]
 0058FA46    call        @IntfClear
 0058FA4B    ret
>0058FA4C    jmp         @HandleFinally
>0058FA51    jmp         0058FA3B
 0058FA53    mov         eax,ebx
 0058FA55    pop         esi
 0058FA56    pop         ebx
 0058FA57    mov         esp,ebp
 0058FA59    pop         ebp
 0058FA5A    ret
*}
end;

//0058FA5C
function TXMLNode.HasAttribute(const Name:DOMString; const NamespaceURI:DOMString):Boolean;
begin
{*
 0058FA5C    push        ebp
 0058FA5D    mov         ebp,esp
 0058FA5F    add         esp,0FFFFFFF0
 0058FA62    push        ebx
 0058FA63    push        esi
 0058FA64    xor         ebx,ebx
 0058FA66    mov         dword ptr [ebp-10],ebx
 0058FA69    mov         dword ptr [ebp-0C],ebx
 0058FA6C    mov         dword ptr [ebp-4],ecx
 0058FA6F    mov         esi,edx
 0058FA71    mov         ebx,eax
 0058FA73    xor         eax,eax
 0058FA75    push        ebp
 0058FA76    push        58FAF7
 0058FA7B    push        dword ptr fs:[eax]
 0058FA7E    mov         dword ptr fs:[eax],esp
 0058FA81    mov         eax,ebx
 0058FA83    call        TXMLNode.GetNodeType
 0058FA88    cmp         al,1
>0058FA8A    jne         0058FABC
 0058FA8C    lea         eax,[ebp-8]
 0058FA8F    push        eax
 0058FA90    push        esi
 0058FA91    mov         eax,dword ptr [ebp-4]
 0058FA94    push        eax
 0058FA95    lea         edx,[ebp-0C]
 0058FA98    mov         eax,ebx
 0058FA9A    call        TXMLNode.DOMElement
 0058FA9F    mov         eax,dword ptr [ebp-0C]
 0058FAA2    push        eax
 0058FAA3    mov         eax,dword ptr [eax]
 0058FAA5    call        dword ptr [eax+0A4]
 0058FAAB    call        @CheckAutoResult
 0058FAB0    cmp         word ptr [ebp-8],1
 0058FAB5    sbb         eax,eax
 0058FAB7    inc         eax
 0058FAB8    mov         ebx,eax
>0058FABA    jmp         0058FAD9
 0058FABC    lea         edx,[ebp-10]
 0058FABF    mov         eax,ebx
 0058FAC1    call        TXMLNode.GetAttributeNodes
 0058FAC6    mov         eax,dword ptr [ebp-10]
 0058FAC9    mov         ecx,dword ptr [ebp-4]
 0058FACC    mov         edx,esi
 0058FACE    mov         ebx,dword ptr [eax]
 0058FAD0    call        dword ptr [ebx+54]
 0058FAD3    inc         eax
 0058FAD4    setne       al
 0058FAD7    mov         ebx,eax
 0058FAD9    xor         eax,eax
 0058FADB    pop         edx
 0058FADC    pop         ecx
 0058FADD    pop         ecx
 0058FADE    mov         dword ptr fs:[eax],edx
 0058FAE1    push        58FAFE
 0058FAE6    lea         eax,[ebp-10]
 0058FAE9    call        @IntfClear
 0058FAEE    lea         eax,[ebp-0C]
 0058FAF1    call        @IntfClear
 0058FAF6    ret
>0058FAF7    jmp         @HandleFinally
>0058FAFC    jmp         0058FAE6
 0058FAFE    mov         eax,ebx
 0058FB00    pop         esi
 0058FB01    pop         ebx
 0058FB02    mov         esp,ebp
 0058FB04    pop         ebp
 0058FB05    ret
*}
end;

//0058FB08
function TXMLNode.CreateAttributeNode(const ADOMNode:IDOMNode):IXMLNode;
begin
{*
 0058FB08    push        ebx
 0058FB09    push        esi
 0058FB0A    push        edi
 0058FB0B    mov         edi,ecx
 0058FB0D    mov         esi,edx
 0058FB0F    mov         ebx,eax
 0058FB11    push        0
 0058FB13    mov         eax,dword ptr [ebx+1C]
 0058FB16    push        eax
 0058FB17    mov         ecx,esi
 0058FB19    mov         dl,1
 0058FB1B    mov         eax,[0058C024];TXMLNode
 0058FB20    call        TXMLNode.Create
 0058FB25    mov         edx,eax
 0058FB27    test        edx,edx
>0058FB29    je          0058FB2E
 0058FB2B    sub         edx,0FFFFFFB8
 0058FB2E    mov         eax,edi
 0058FB30    call        @IntfCopy
 0058FB35    pop         edi
 0058FB36    pop         esi
 0058FB37    pop         ebx
 0058FB38    ret
*}
end;

//0058FB3C
function TXMLNode.GetAttribute(const AttrName:DOMString):OleVariant;
begin
{*
 0058FB3C    push        ebp
 0058FB3D    mov         ebp,esp
 0058FB3F    push        ecx
 0058FB40    mov         ecx,4
 0058FB45    push        0
 0058FB47    push        0
 0058FB49    dec         ecx
>0058FB4A    jne         0058FB45
 0058FB4C    xchg        ecx,dword ptr [ebp-4]
 0058FB4F    push        ebx
 0058FB50    push        esi
 0058FB51    mov         dword ptr [ebp-4],ecx
 0058FB54    mov         esi,edx
 0058FB56    mov         ebx,eax
 0058FB58    xor         eax,eax
 0058FB5A    push        ebp
 0058FB5B    push        58FC38
 0058FB60    push        dword ptr fs:[eax]
 0058FB63    mov         dword ptr fs:[eax],esp
 0058FB66    mov         edx,esi
 0058FB68    mov         eax,ebx
 0058FB6A    call        TXMLNode.HasAttribute
 0058FB6F    test        al,al
>0058FB71    je          0058FBD1
 0058FB73    mov         eax,ebx
 0058FB75    call        TXMLNode.GetNodeType
 0058FB7A    cmp         al,1
>0058FB7C    jne         0058FBAD
 0058FB7E    lea         eax,[ebp-8]
 0058FB81    call        @UStrClr
 0058FB86    push        eax
 0058FB87    push        esi
 0058FB88    lea         edx,[ebp-0C]
 0058FB8B    mov         eax,ebx
 0058FB8D    call        TXMLNode.DOMElement
 0058FB92    mov         eax,dword ptr [ebp-0C]
 0058FB95    push        eax
 0058FB96    mov         eax,dword ptr [eax]
 0058FB98    call        dword ptr [eax+6C]
 0058FB9B    call        @CheckAutoResult
 0058FBA0    mov         edx,dword ptr [ebp-8]
 0058FBA3    mov         eax,dword ptr [ebp-4]
 0058FBA6    call        @OleVarFromUStr
>0058FBAB    jmp         0058FC02
 0058FBAD    lea         edx,[ebp-14]
 0058FBB0    mov         eax,ebx
 0058FBB2    call        TXMLNode.GetAttributeNodes
 0058FBB7    mov         eax,dword ptr [ebp-14]
 0058FBBA    lea         ecx,[ebp-10]
 0058FBBD    mov         edx,esi
 0058FBBF    mov         ebx,dword ptr [eax]
 0058FBC1    call        dword ptr [ebx+38]
 0058FBC4    mov         eax,dword ptr [ebp-10]
 0058FBC7    mov         edx,dword ptr [ebp-4]
 0058FBCA    mov         ecx,dword ptr [eax]
 0058FBCC    call        dword ptr [ecx+3C]
>0058FBCF    jmp         0058FC02
 0058FBD1    mov         esi,dword ptr [ebx+1C]
 0058FBD4    test        esi,esi
>0058FBD6    je          0058FBE3
 0058FBD8    mov         eax,esi
 0058FBDA    call        TXMLDocument.GetOptions
 0058FBDF    test        al,4
>0058FBE1    je          0058FBF8
 0058FBE3    lea         eax,[ebp-24]
 0058FBE6    call        Null
 0058FBEB    lea         edx,[ebp-24]
 0058FBEE    mov         eax,dword ptr [ebp-4]
 0058FBF1    call        @OleVarFromVar
>0058FBF6    jmp         0058FC02
 0058FBF8    mov         eax,dword ptr [ebp-4]
 0058FBFB    xor         edx,edx
 0058FBFD    call        @OleVarFromUStr
 0058FC02    xor         eax,eax
 0058FC04    pop         edx
 0058FC05    pop         ecx
 0058FC06    pop         ecx
 0058FC07    mov         dword ptr fs:[eax],edx
 0058FC0A    push        58FC3F
 0058FC0F    lea         eax,[ebp-24]
 0058FC12    call        @VarClr
 0058FC17    lea         eax,[ebp-14]
 0058FC1A    call        @IntfClear
 0058FC1F    lea         eax,[ebp-10]
 0058FC22    call        @IntfClear
 0058FC27    lea         eax,[ebp-0C]
 0058FC2A    call        @IntfClear
 0058FC2F    lea         eax,[ebp-8]
 0058FC32    call        @UStrClr
 0058FC37    ret
>0058FC38    jmp         @HandleFinally
>0058FC3D    jmp         0058FC0F
 0058FC3F    pop         esi
 0058FC40    pop         ebx
 0058FC41    mov         esp,ebp
 0058FC43    pop         ebp
 0058FC44    ret
*}
end;

//0058FC48
function TXMLNode.GetAttributeNS(const AttrName:DOMString; const NamespaceURI:DOMString):OleVariant;
begin
{*
 0058FC48    push        ebp
 0058FC49    mov         ebp,esp
 0058FC4B    push        0
 0058FC4D    push        0
 0058FC4F    push        0
 0058FC51    push        0
 0058FC53    push        0
 0058FC55    push        0
 0058FC57    push        0
 0058FC59    push        0
 0058FC5B    push        ebx
 0058FC5C    push        esi
 0058FC5D    push        edi
 0058FC5E    mov         edi,ecx
 0058FC60    mov         esi,edx
 0058FC62    mov         ebx,eax
 0058FC64    xor         eax,eax
 0058FC66    push        ebp
 0058FC67    push        58FD2C
 0058FC6C    push        dword ptr fs:[eax]
 0058FC6F    mov         dword ptr fs:[eax],esp
 0058FC72    lea         eax,[ebp-4]
 0058FC75    push        eax
 0058FC76    push        esi
 0058FC77    push        edi
 0058FC78    lea         edx,[ebp-8]
 0058FC7B    mov         eax,ebx
 0058FC7D    call        TXMLNode.DOMElement
 0058FC82    mov         eax,dword ptr [ebp-8]
 0058FC85    push        eax
 0058FC86    mov         eax,dword ptr [eax]
 0058FC88    call        dword ptr [eax+0A4]
 0058FC8E    call        @CheckAutoResult
 0058FC93    cmp         word ptr [ebp-4],0
>0058FC98    je          0058FCCD
 0058FC9A    lea         eax,[ebp-0C]
 0058FC9D    call        @UStrClr
 0058FCA2    push        eax
 0058FCA3    push        esi
 0058FCA4    push        edi
 0058FCA5    lea         edx,[ebp-10]
 0058FCA8    mov         eax,ebx
 0058FCAA    call        TXMLNode.DOMElement
 0058FCAF    mov         eax,dword ptr [ebp-10]
 0058FCB2    push        eax
 0058FCB3    mov         eax,dword ptr [eax]
 0058FCB5    call        dword ptr [eax+88]
 0058FCBB    call        @CheckAutoResult
 0058FCC0    mov         edx,dword ptr [ebp-0C]
 0058FCC3    mov         eax,dword ptr [ebp+8]
 0058FCC6    call        @OleVarFromUStr
>0058FCCB    jmp         0058FCFE
 0058FCCD    mov         esi,dword ptr [ebx+1C]
 0058FCD0    test        esi,esi
>0058FCD2    je          0058FCDF
 0058FCD4    mov         eax,esi
 0058FCD6    call        TXMLDocument.GetOptions
 0058FCDB    test        al,4
>0058FCDD    je          0058FCF4
 0058FCDF    lea         eax,[ebp-20]
 0058FCE2    call        Null
 0058FCE7    lea         edx,[ebp-20]
 0058FCEA    mov         eax,dword ptr [ebp+8]
 0058FCED    call        @OleVarFromVar
>0058FCF2    jmp         0058FCFE
 0058FCF4    mov         eax,dword ptr [ebp+8]
 0058FCF7    xor         edx,edx
 0058FCF9    call        @OleVarFromUStr
 0058FCFE    xor         eax,eax
 0058FD00    pop         edx
 0058FD01    pop         ecx
 0058FD02    pop         ecx
 0058FD03    mov         dword ptr fs:[eax],edx
 0058FD06    push        58FD33
 0058FD0B    lea         eax,[ebp-20]
 0058FD0E    call        @VarClr
 0058FD13    lea         eax,[ebp-10]
 0058FD16    call        @IntfClear
 0058FD1B    lea         eax,[ebp-0C]
 0058FD1E    call        @UStrClr
 0058FD23    lea         eax,[ebp-8]
 0058FD26    call        @IntfClear
 0058FD2B    ret
>0058FD2C    jmp         @HandleFinally
>0058FD31    jmp         0058FD0B
 0058FD33    pop         edi
 0058FD34    pop         esi
 0058FD35    pop         ebx
 0058FD36    mov         esp,ebp
 0058FD38    pop         ebp
 0058FD39    ret         4
*}
end;

//0058FD3C
procedure TXMLNode.SetAttribute(const AttrName:DOMString; const Value:OleVariant);
begin
{*
 0058FD3C    push        ebp
 0058FD3D    mov         ebp,esp
 0058FD3F    push        ecx
 0058FD40    mov         ecx,8
 0058FD45    push        0
 0058FD47    push        0
 0058FD49    dec         ecx
>0058FD4A    jne         0058FD45
 0058FD4C    xchg        ecx,dword ptr [ebp-4]
 0058FD4F    push        ebx
 0058FD50    push        esi
 0058FD51    push        edi
 0058FD52    mov         edi,ecx
 0058FD54    mov         dword ptr [ebp-1C],edx
 0058FD57    mov         esi,eax
 0058FD59    xor         eax,eax
 0058FD5B    push        ebp
 0058FD5C    push        58FF7E
 0058FD61    push        dword ptr fs:[eax]
 0058FD64    mov         dword ptr fs:[eax],esp
 0058FD67    mov         eax,edi
 0058FD69    call        VarIsNull
 0058FD6E    and         eax,7F
 0058FD71    movzx       ebx,byte ptr [eax+789B6C]
 0058FD78    cmp         byte ptr ds:[789B64],0
>0058FD7F    je          0058FD8F
 0058FD81    cmp         bl,3
>0058FD84    jne         0058FD8F
 0058FD86    cmp         word ptr [edi],0B
 0058FD8A    sete        al
>0058FD8D    jmp         0058FD91
 0058FD8F    xor         eax,eax
 0058FD91    test        al,al
>0058FD93    je          0058FDB0
 0058FD95    mov         eax,edi
 0058FD97    call        @VarToBool
 0058FD9C    and         eax,7F
 0058FD9F    mov         edx,dword ptr [eax*4+789B70];^'false'
 0058FDA6    lea         eax,[ebp-18]
 0058FDA9    call        @OleVarFromUStr
>0058FDAE    jmp         0058FDBA
 0058FDB0    lea         eax,[ebp-18]
 0058FDB3    mov         edx,edi
 0058FDB5    call        @VarCopy
 0058FDBA    mov         cl,1
 0058FDBC    mov         edx,ebx
 0058FDBE    mov         eax,esi
 0058FDC0    mov         edi,dword ptr [eax]
 0058FDC2    call        dword ptr [edi+10]
 0058FDC5    mov         eax,esi
 0058FDC7    call        TXMLNode.GetNodeType
 0058FDCC    cmp         al,1
>0058FDCE    je          0058FEAB
 0058FDD4    lea         eax,[ebp-20]
 0058FDD7    call        @IntfClear
 0058FDDC    push        eax
 0058FDDD    mov         eax,dword ptr [esi+20]
 0058FDE0    push        eax
 0058FDE1    mov         eax,dword ptr [eax]
 0058FDE3    call        dword ptr [eax+34]
 0058FDE6    call        @CheckAutoResult
 0058FDEB    cmp         dword ptr [ebp-20],0
>0058FDEF    je          0058FEAB
 0058FDF5    cmp         bl,3
>0058FDF8    jne         0058FE77
 0058FDFA    lea         eax,[ebp-4]
 0058FDFD    call        @IntfClear
 0058FE02    push        eax
 0058FE03    mov         eax,dword ptr [ebp-1C]
 0058FE06    push        eax
 0058FE07    lea         edx,[ebp-24]
 0058FE0A    mov         eax,dword ptr [esi+1C]
 0058FE0D    call        TXMLDocument.GetDOMDocument
 0058FE12    mov         eax,dword ptr [ebp-24]
 0058FE15    push        eax
 0058FE16    mov         eax,dword ptr [eax]
 0058FE18    call        dword ptr [eax+90]
 0058FE1E    call        @CheckAutoResult
 0058FE23    lea         eax,[ebp-28]
 0058FE26    lea         edx,[ebp-18]
 0058FE29    call        @VarToUStr
 0058FE2E    mov         eax,dword ptr [ebp-28]
 0058FE31    push        eax
 0058FE32    mov         eax,dword ptr [ebp-4]
 0058FE35    push        eax
 0058FE36    mov         eax,dword ptr [eax]
 0058FE38    call        dword ptr [eax+14]
 0058FE3B    call        @CheckAutoResult
 0058FE40    lea         eax,[ebp-2C]
 0058FE43    call        @IntfClear
 0058FE48    push        eax
 0058FE49    mov         eax,dword ptr [ebp-4]
 0058FE4C    push        eax
 0058FE4D    lea         eax,[ebp-30]
 0058FE50    call        @IntfClear
 0058FE55    push        eax
 0058FE56    mov         eax,dword ptr [esi+20]
 0058FE59    push        eax
 0058FE5A    mov         eax,dword ptr [eax]
 0058FE5C    call        dword ptr [eax+34]
 0058FE5F    call        @CheckAutoResult
 0058FE64    mov         eax,dword ptr [ebp-30]
 0058FE67    push        eax
 0058FE68    mov         eax,dword ptr [eax]
 0058FE6A    call        dword ptr [eax+18]
 0058FE6D    call        @CheckAutoResult
>0058FE72    jmp         0058FEF9
 0058FE77    lea         eax,[ebp-34]
 0058FE7A    call        @IntfClear
 0058FE7F    push        eax
 0058FE80    mov         eax,dword ptr [ebp-1C]
 0058FE83    push        eax
 0058FE84    lea         eax,[ebp-38]
 0058FE87    call        @IntfClear
 0058FE8C    push        eax
 0058FE8D    mov         eax,dword ptr [esi+20]
 0058FE90    push        eax
 0058FE91    mov         eax,dword ptr [eax]
 0058FE93    call        dword ptr [eax+34]
 0058FE96    call        @CheckAutoResult
 0058FE9B    mov         eax,dword ptr [ebp-38]
 0058FE9E    push        eax
 0058FE9F    mov         eax,dword ptr [eax]
 0058FEA1    call        dword ptr [eax+1C]
 0058FEA4    call        @CheckAutoResult
>0058FEA9    jmp         0058FEF9
 0058FEAB    cmp         bl,3
>0058FEAE    jne         0058FEDD
 0058FEB0    lea         eax,[ebp-3C]
 0058FEB3    lea         edx,[ebp-18]
 0058FEB6    call        @VarToUStr
 0058FEBB    mov         eax,dword ptr [ebp-3C]
 0058FEBE    push        eax
 0058FEBF    mov         eax,dword ptr [ebp-1C]
 0058FEC2    push        eax
 0058FEC3    lea         edx,[ebp-40]
 0058FEC6    mov         eax,esi
 0058FEC8    call        TXMLNode.DOMElement
 0058FECD    mov         eax,dword ptr [ebp-40]
 0058FED0    push        eax
 0058FED1    mov         eax,dword ptr [eax]
 0058FED3    call        dword ptr [eax+70]
 0058FED6    call        @CheckAutoResult
>0058FEDB    jmp         0058FEF9
 0058FEDD    mov         eax,dword ptr [ebp-1C]
 0058FEE0    push        eax
 0058FEE1    lea         edx,[ebp-44]
 0058FEE4    mov         eax,esi
 0058FEE6    call        TXMLNode.DOMElement
 0058FEEB    mov         eax,dword ptr [ebp-44]
 0058FEEE    push        eax
 0058FEEF    mov         eax,dword ptr [eax]
 0058FEF1    call        dword ptr [eax+74]
 0058FEF4    call        @CheckAutoResult
 0058FEF9    xor         edx,edx
 0058FEFB    mov         eax,esi
 0058FEFD    mov         ecx,dword ptr [eax]
 0058FEFF    call        dword ptr [ecx+14]
 0058FF02    xor         ecx,ecx
 0058FF04    mov         edx,ebx
 0058FF06    mov         eax,esi
 0058FF08    mov         ebx,dword ptr [eax]
 0058FF0A    call        dword ptr [ebx+10]
 0058FF0D    xor         eax,eax
 0058FF0F    pop         edx
 0058FF10    pop         ecx
 0058FF11    pop         ecx
 0058FF12    mov         dword ptr fs:[eax],edx
 0058FF15    push        58FF85
 0058FF1A    lea         eax,[ebp-44]
 0058FF1D    mov         edx,dword ptr ds:[589854];IDOMElement
 0058FF23    mov         ecx,2
 0058FF28    call        @FinalizeArray
 0058FF2D    lea         eax,[ebp-3C]
 0058FF30    call        @UStrClr
 0058FF35    lea         eax,[ebp-38]
 0058FF38    call        @IntfClear
 0058FF3D    lea         eax,[ebp-34]
 0058FF40    call        @IntfClear
 0058FF45    lea         eax,[ebp-30]
 0058FF48    call        @IntfClear
 0058FF4D    lea         eax,[ebp-2C]
 0058FF50    call        @IntfClear
 0058FF55    lea         eax,[ebp-28]
 0058FF58    call        @UStrClr
 0058FF5D    lea         eax,[ebp-24]
 0058FF60    call        @IntfClear
 0058FF65    lea         eax,[ebp-20]
 0058FF68    call        @IntfClear
 0058FF6D    lea         eax,[ebp-18]
 0058FF70    call        @VarClr
 0058FF75    lea         eax,[ebp-4]
 0058FF78    call        @IntfClear
 0058FF7D    ret
>0058FF7E    jmp         @HandleFinally
>0058FF83    jmp         0058FF1A
 0058FF85    pop         edi
 0058FF86    pop         esi
 0058FF87    pop         ebx
 0058FF88    mov         esp,ebp
 0058FF8A    pop         ebp
 0058FF8B    ret
*}
end;

//0058FF8C
procedure TXMLNode.SetAttributeNS(const AttrName:DOMString; const NamespaceURI:DOMString; const Value:OleVariant);
begin
{*
 0058FF8C    push        ebp
 0058FF8D    mov         ebp,esp
 0058FF8F    push        0
 0058FF91    push        0
 0058FF93    push        0
 0058FF95    push        0
 0058FF97    push        0
 0058FF99    push        0
 0058FF9B    push        ebx
 0058FF9C    push        esi
 0058FF9D    push        edi
 0058FF9E    mov         dword ptr [ebp-8],ecx
 0058FFA1    mov         ebx,edx
 0058FFA3    mov         esi,eax
 0058FFA5    xor         eax,eax
 0058FFA7    push        ebp
 0058FFA8    push        5900E0
 0058FFAD    push        dword ptr fs:[eax]
 0058FFB0    mov         dword ptr fs:[eax],esp
 0058FFB3    lea         eax,[ebp-4]
 0058FFB6    push        eax
 0058FFB7    mov         ecx,dword ptr [ebp-8]
 0058FFBA    mov         edx,ebx
 0058FFBC    mov         eax,esi
 0058FFBE    call        TXMLNode.GetPrefixedName
 0058FFC3    mov         eax,dword ptr [ebp+8]
 0058FFC6    call        VarIsNull
 0058FFCB    and         eax,7F
 0058FFCE    movzx       ebx,byte ptr [eax+789B6C]
 0058FFD5    mov         cl,1
 0058FFD7    mov         edx,ebx
 0058FFD9    mov         eax,esi
 0058FFDB    mov         edi,dword ptr [eax]
 0058FFDD    call        dword ptr [edi+10]
 0058FFE0    cmp         bl,3
>0058FFE3    jne         00590070
 0058FFE9    cmp         byte ptr ds:[789B64],0
>0058FFF0    je          0058FFFE
 0058FFF2    mov         eax,dword ptr [ebp+8]
 0058FFF5    cmp         word ptr [eax],0B
 0058FFF9    sete        al
>0058FFFC    jmp         00590000
 0058FFFE    xor         eax,eax
 00590000    test        al,al
>00590002    je          0059003C
 00590004    mov         eax,dword ptr [ebp+8]
 00590007    call        @VarToBool
 0059000C    and         eax,7F
 0059000F    mov         eax,dword ptr [eax*4+789B70];^'false'
 00590016    push        eax
 00590017    mov         eax,dword ptr [ebp-4]
 0059001A    push        eax
 0059001B    mov         eax,dword ptr [ebp-8]
 0059001E    push        eax
 0059001F    lea         edx,[ebp-0C]
 00590022    mov         eax,esi
 00590024    call        TXMLNode.DOMElement
 00590029    mov         eax,dword ptr [ebp-0C]
 0059002C    push        eax
 0059002D    mov         eax,dword ptr [eax]
 0059002F    call        dword ptr [eax+8C]
 00590035    call        @CheckAutoResult
>0059003A    jmp         00590093
 0059003C    lea         eax,[ebp-10]
 0059003F    mov         edx,dword ptr [ebp+8]
 00590042    call        @VarToUStr
 00590047    mov         eax,dword ptr [ebp-10]
 0059004A    push        eax
 0059004B    mov         eax,dword ptr [ebp-4]
 0059004E    push        eax
 0059004F    mov         eax,dword ptr [ebp-8]
 00590052    push        eax
 00590053    lea         edx,[ebp-14]
 00590056    mov         eax,esi
 00590058    call        TXMLNode.DOMElement
 0059005D    mov         eax,dword ptr [ebp-14]
 00590060    push        eax
 00590061    mov         eax,dword ptr [eax]
 00590063    call        dword ptr [eax+8C]
 00590069    call        @CheckAutoResult
>0059006E    jmp         00590093
 00590070    mov         eax,dword ptr [ebp-4]
 00590073    push        eax
 00590074    mov         eax,dword ptr [ebp-8]
 00590077    push        eax
 00590078    lea         edx,[ebp-18]
 0059007B    mov         eax,esi
 0059007D    call        TXMLNode.DOMElement
 00590082    mov         eax,dword ptr [ebp-18]
 00590085    push        eax
 00590086    mov         eax,dword ptr [eax]
 00590088    call        dword ptr [eax+90]
 0059008E    call        @CheckAutoResult
 00590093    xor         edx,edx
 00590095    mov         eax,esi
 00590097    mov         ecx,dword ptr [eax]
 00590099    call        dword ptr [ecx+14]
 0059009C    xor         ecx,ecx
 0059009E    mov         edx,ebx
 005900A0    mov         eax,esi
 005900A2    mov         ebx,dword ptr [eax]
 005900A4    call        dword ptr [ebx+10]
 005900A7    xor         eax,eax
 005900A9    pop         edx
 005900AA    pop         ecx
 005900AB    pop         ecx
 005900AC    mov         dword ptr fs:[eax],edx
 005900AF    push        5900E7
 005900B4    lea         eax,[ebp-18]
 005900B7    mov         edx,dword ptr ds:[589854];IDOMElement
 005900BD    mov         ecx,2
 005900C2    call        @FinalizeArray
 005900C7    lea         eax,[ebp-10]
 005900CA    call        @UStrClr
 005900CF    lea         eax,[ebp-0C]
 005900D2    call        @IntfClear
 005900D7    lea         eax,[ebp-4]
 005900DA    call        @UStrClr
 005900DF    ret
>005900E0    jmp         @HandleFinally
>005900E5    jmp         005900B4
 005900E7    pop         edi
 005900E8    pop         esi
 005900E9    pop         ebx
 005900EA    mov         esp,ebp
 005900EC    pop         ebp
 005900ED    ret         4
*}
end;

//005900F0
procedure TXMLNode.AttributeListNotify(Operation:TNodeListOperation; var Node:IXMLNode; const IndexOrName:OleVariant; BeforeOperation:Boolean);
begin
{*
 005900F0    push        ebp
 005900F1    mov         ebp,esp
 005900F3    push        ecx
 005900F4    mov         ecx,7
 005900F9    push        0
 005900FB    push        0
 005900FD    dec         ecx
>005900FE    jne         005900F9
 00590100    push        ecx
 00590101    xchg        ecx,dword ptr [ebp-4]
 00590104    push        ebx
 00590105    push        esi
 00590106    mov         dword ptr [ebp-8],ecx
 00590109    mov         byte ptr [ebp-1],dl
 0059010C    mov         ebx,eax
 0059010E    xor         eax,eax
 00590110    push        ebp
 00590111    push        5902FD
 00590116    push        dword ptr fs:[eax]
 00590119    mov         dword ptr fs:[eax],esp
 0059011C    movzx       eax,byte ptr [ebp-1]
 00590120    movzx       edx,byte ptr [eax+789B8C]
 00590127    movzx       ecx,byte ptr [ebp+8]
 0059012B    mov         eax,ebx
 0059012D    mov         esi,dword ptr [eax]
 0059012F    call        dword ptr [esi+10]
 00590132    cmp         byte ptr [ebp+8],0
>00590136    je          0059023B
 0059013C    lea         edx,[ebp-14]
 0059013F    mov         eax,ebx
 00590141    call        TXMLNode.GetAttributeNodes
 00590146    mov         eax,dword ptr [ebp-14]
 00590149    mov         edx,dword ptr [eax]
 0059014B    call        dword ptr [edx+14]
 0059014E    test        eax,eax
>00590150    jne         0059023B
 00590156    movzx       eax,byte ptr [ebp-1]
 0059015A    sub         al,1
>0059015C    jb          005901B7
>0059015E    je          0059016D
 00590160    dec         al
>00590162    je          005901FB
>00590168    jmp         0059023B
 0059016D    lea         eax,[ebp-18]
 00590170    call        @IntfClear
 00590175    push        eax
 00590176    lea         edx,[ebp-20]
 00590179    mov         eax,dword ptr [ebp-8]
 0059017C    mov         eax,dword ptr [eax]
 0059017E    mov         ecx,dword ptr [eax]
 00590180    call        dword ptr [ecx+20]
 00590183    mov         edx,dword ptr [ebp-20]
 00590186    lea         eax,[ebp-1C]
 00590189    mov         ecx,59030C
 0059018E    call        @IntfCast
 00590193    mov         eax,dword ptr [ebp-1C]
 00590196    push        eax
 00590197    lea         edx,[ebp-24]
 0059019A    mov         eax,ebx
 0059019C    call        TXMLNode.DOMElement
 005901A1    mov         eax,dword ptr [ebp-24]
 005901A4    push        eax
 005901A5    mov         eax,dword ptr [eax]
 005901A7    call        dword ptr [eax+80]
 005901AD    call        @CheckAutoResult
>005901B2    jmp         0059023B
 005901B7    lea         eax,[ebp-28]
 005901BA    call        @IntfClear
 005901BF    push        eax
 005901C0    lea         edx,[ebp-30]
 005901C3    mov         eax,dword ptr [ebp-8]
 005901C6    mov         eax,dword ptr [eax]
 005901C8    mov         ecx,dword ptr [eax]
 005901CA    call        dword ptr [ecx+20]
 005901CD    mov         edx,dword ptr [ebp-30]
 005901D0    lea         eax,[ebp-2C]
 005901D3    mov         ecx,59030C
 005901D8    call        @IntfCast
 005901DD    mov         eax,dword ptr [ebp-2C]
 005901E0    push        eax
 005901E1    lea         edx,[ebp-34]
 005901E4    mov         eax,ebx
 005901E6    call        TXMLNode.DOMElement
 005901EB    mov         eax,dword ptr [ebp-34]
 005901EE    push        eax
 005901EF    mov         eax,dword ptr [eax]
 005901F1    call        dword ptr [eax+7C]
 005901F4    call        @CheckAutoResult
>005901F9    jmp         0059023B
 005901FB    push        0
 005901FD    lea         eax,[ebp-38]
 00590200    push        eax
 00590201    lea         eax,[ebp-3C]
 00590204    mov         edx,dword ptr [ebp+0C]
 00590207    call        @VarToUStr
 0059020C    mov         edx,dword ptr [ebp-3C]
 0059020F    mov         cl,2
 00590211    mov         eax,dword ptr [ebx+1C]
 00590214    call        TXMLDocument.CreateNode
 00590219    mov         edx,dword ptr [ebp-38]
 0059021C    mov         eax,dword ptr [ebp-8]
 0059021F    call        @IntfCopy
 00590224    lea         edx,[ebp-40]
 00590227    mov         eax,ebx
 00590229    call        TXMLNode.GetAttributeNodes
 0059022E    mov         eax,dword ptr [ebp-40]
 00590231    mov         edx,dword ptr [ebp-8]
 00590234    mov         edx,dword ptr [edx]
 00590236    mov         ecx,dword ptr [eax]
 00590238    call        dword ptr [ecx+18]
 0059023B    cmp         dword ptr [ebx+2C],0
>0059023F    je          00590289
 00590241    mov         eax,dword ptr [ebx+2C]
 00590244    call        @DynArrayLength
 00590249    dec         eax
 0059024A    test        eax,eax
>0059024C    jl          00590289
 0059024E    inc         eax
 0059024F    mov         dword ptr [ebp-10],eax
 00590252    mov         dword ptr [ebp-0C],0
 00590259    mov         eax,dword ptr [ebx+2C]
 0059025C    mov         edx,dword ptr [ebp-0C]
 0059025F    mov         eax,dword ptr [eax+edx*4]
 00590262    cmp         word ptr [eax+42],0
>00590267    je          00590281
 00590269    mov         edx,dword ptr [ebp+0C]
 0059026C    push        edx
 0059026D    movzx       edx,byte ptr [ebp+8]
 00590271    push        edx
 00590272    mov         ecx,dword ptr [ebp-8]
 00590275    mov         esi,eax
 00590277    movzx       edx,byte ptr [ebp-1]
 0059027B    mov         eax,dword ptr [esi+44]
 0059027E    call        dword ptr [esi+40]
 00590281    inc         dword ptr [ebp-0C]
 00590284    dec         dword ptr [ebp-10]
>00590287    jne         00590259
 00590289    xor         eax,eax
 0059028B    pop         edx
 0059028C    pop         ecx
 0059028D    pop         ecx
 0059028E    mov         dword ptr fs:[eax],edx
 00590291    push        590304
 00590296    lea         eax,[ebp-40]
 00590299    call        @IntfClear
 0059029E    lea         eax,[ebp-3C]
 005902A1    call        @UStrClr
 005902A6    lea         eax,[ebp-38]
 005902A9    call        @IntfClear
 005902AE    lea         eax,[ebp-34]
 005902B1    call        @IntfClear
 005902B6    lea         eax,[ebp-30]
 005902B9    call        @IntfClear
 005902BE    lea         eax,[ebp-2C]
 005902C1    mov         edx,dword ptr ds:[589824];IDOMAttr
 005902C7    mov         ecx,2
 005902CC    call        @FinalizeArray
 005902D1    lea         eax,[ebp-24]
 005902D4    call        @IntfClear
 005902D9    lea         eax,[ebp-20]
 005902DC    call        @IntfClear
 005902E1    lea         eax,[ebp-1C]
 005902E4    mov         edx,dword ptr ds:[589824];IDOMAttr
 005902EA    mov         ecx,2
 005902EF    call        @FinalizeArray
 005902F4    lea         eax,[ebp-14]
 005902F7    call        @IntfClear
 005902FC    ret
>005902FD    jmp         @HandleFinally
>00590302    jmp         00590296
 00590304    pop         esi
 00590305    pop         ebx
 00590306    mov         esp,ebp
 00590308    pop         ebp
 00590309    ret         8
*}
end;

//0059031C
procedure TXMLNode.CreateChildList;
begin
{*
 0059031C    push        ebp
 0059031D    mov         ebp,esp
 0059031F    mov         ecx,4
 00590324    push        0
 00590326    push        0
 00590328    dec         ecx
>00590329    jne         00590324
 0059032B    push        ecx
 0059032C    push        ebx
 0059032D    push        esi
 0059032E    push        edi
 0059032F    mov         dword ptr [ebp-4],edx
 00590332    mov         ebx,eax
 00590334    xor         eax,eax
 00590336    push        ebp
 00590337    push        59043C
 0059033C    push        dword ptr fs:[eax]
 0059033F    mov         dword ptr fs:[eax],esp
 00590342    lea         edx,[ebp-10]
 00590345    mov         eax,ebx
 00590347    call        TXMLNode.GetNamespaceURI
 0059034C    mov         eax,dword ptr [ebp-10]
 0059034F    push        eax
 00590350    push        ebx
 00590351    mov         eax,dword ptr [ebx]
 00590353    mov         eax,dword ptr [eax+0C]
 00590356    push        eax
 00590357    mov         ecx,ebx
 00590359    mov         dl,1
 0059035B    mov         eax,[0058B96C];TXMLNodeList
 00590360    call        TXMLNodeList.Create
 00590365    mov         dword ptr [ebp-0C],eax
 00590368    lea         eax,[ebp-14]
 0059036B    push        eax
 0059036C    lea         eax,[ebp-18]
 0059036F    call        @IntfClear
 00590374    push        eax
 00590375    mov         eax,dword ptr [ebx+20]
 00590378    push        eax
 00590379    mov         eax,dword ptr [eax]
 0059037B    call        dword ptr [eax+20]
 0059037E    call        @CheckAutoResult
 00590383    mov         eax,dword ptr [ebp-18]
 00590386    push        eax
 00590387    mov         eax,dword ptr [eax]
 00590389    call        dword ptr [eax+10]
 0059038C    call        @CheckAutoResult
 00590391    mov         esi,dword ptr [ebp-14]
 00590394    dec         esi
 00590395    test        esi,esi
>00590397    jl          005903F4
 00590399    inc         esi
 0059039A    mov         dword ptr [ebp-8],0
 005903A1    lea         eax,[ebp-20]
 005903A4    call        @IntfClear
 005903A9    push        eax
 005903AA    mov         eax,dword ptr [ebp-8]
 005903AD    push        eax
 005903AE    lea         eax,[ebp-24]
 005903B1    call        @IntfClear
 005903B6    push        eax
 005903B7    mov         eax,dword ptr [ebx+20]
 005903BA    push        eax
 005903BB    mov         eax,dword ptr [eax]
 005903BD    call        dword ptr [eax+20]
 005903C0    call        @CheckAutoResult
 005903C5    mov         eax,dword ptr [ebp-24]
 005903C8    push        eax
 005903C9    mov         eax,dword ptr [eax]
 005903CB    call        dword ptr [eax+0C]
 005903CE    call        @CheckAutoResult
 005903D3    mov         edx,dword ptr [ebp-20]
 005903D6    lea         ecx,[ebp-1C]
 005903D9    mov         eax,ebx
 005903DB    mov         edi,dword ptr [eax]
 005903DD    call        dword ptr [edi+4]
 005903E0    mov         edx,dword ptr [ebp-1C]
 005903E3    mov         eax,dword ptr [ebp-0C]
 005903E6    mov         eax,dword ptr [eax+0C]
 005903E9    mov         ecx,dword ptr [eax]
 005903EB    call        dword ptr [ecx+38]
 005903EE    inc         dword ptr [ebp-8]
 005903F1    dec         esi
>005903F2    jne         005903A1
 005903F4    mov         eax,dword ptr [ebp-4]
 005903F7    mov         edx,dword ptr [ebp-0C]
 005903FA    test        edx,edx
>005903FC    je          00590401
 005903FE    sub         edx,0FFFFFFDC
 00590401    call        @IntfCopy
 00590406    xor         eax,eax
 00590408    pop         edx
 00590409    pop         ecx
 0059040A    pop         ecx
 0059040B    mov         dword ptr fs:[eax],edx
 0059040E    push        590443
 00590413    lea         eax,[ebp-24]
 00590416    call        @IntfClear
 0059041B    lea         eax,[ebp-20]
 0059041E    call        @IntfClear
 00590423    lea         eax,[ebp-1C]
 00590426    call        @IntfClear
 0059042B    lea         eax,[ebp-18]
 0059042E    call        @IntfClear
 00590433    lea         eax,[ebp-10]
 00590436    call        @UStrClr
 0059043B    ret
>0059043C    jmp         @HandleFinally
>00590441    jmp         00590413
 00590443    pop         edi
 00590444    pop         esi
 00590445    pop         ebx
 00590446    mov         esp,ebp
 00590448    pop         ebp
 00590449    ret
*}
end;

//0059044C
function TXMLNode.GetHasChildNodes:Boolean;
begin
{*
 0059044C    push        ebx
 0059044D    push        ecx
 0059044E    mov         ebx,eax
 00590450    push        esp
 00590451    mov         eax,dword ptr [ebx+20]
 00590454    push        eax
 00590455    mov         eax,dword ptr [eax]
 00590457    call        dword ptr [eax+58]
 0059045A    call        @CheckAutoResult
 0059045F    cmp         word ptr [esp],1
 00590464    sbb         eax,eax
 00590466    inc         eax
 00590467    pop         edx
 00590468    pop         ebx
 00590469    ret
*}
end;

//0059046C
function TXMLNode.GetChildNodes:IXMLNodeList;
begin
{*
 0059046C    push        ebp
 0059046D    mov         ebp,esp
 0059046F    push        0
 00590471    push        ebx
 00590472    push        esi
 00590473    push        edi
 00590474    mov         edi,edx
 00590476    mov         ebx,eax
 00590478    xor         eax,eax
 0059047A    push        ebp
 0059047B    push        5904D6
 00590480    push        dword ptr fs:[eax]
 00590483    mov         dword ptr fs:[eax],esp
 00590486    mov         esi,dword ptr [ebx+24]
 00590489    test        esi,esi
>0059048B    je          00590498
 0059048D    mov         edx,edi
 0059048F    mov         eax,esi
 00590491    call        TXMLNode.GetChildNodes
>00590496    jmp         005904C0
 00590498    cmp         dword ptr [ebx+10],0
>0059049C    jne         005904B6
 0059049E    lea         edx,[ebp-4]
 005904A1    mov         eax,ebx
 005904A3    mov         si,0FFFE
 005904A7    call        @CallDynaInst
 005904AC    mov         edx,dword ptr [ebp-4]
 005904AF    mov         eax,ebx
 005904B1    mov         ecx,dword ptr [eax]
 005904B3    call        dword ptr [ecx+18]
 005904B6    mov         eax,edi
 005904B8    mov         edx,dword ptr [ebx+10]
 005904BB    call        @IntfCopy
 005904C0    xor         eax,eax
 005904C2    pop         edx
 005904C3    pop         ecx
 005904C4    pop         ecx
 005904C5    mov         dword ptr fs:[eax],edx
 005904C8    push        5904DD
 005904CD    lea         eax,[ebp-4]
 005904D0    call        @IntfClear
 005904D5    ret
>005904D6    jmp         @HandleFinally
>005904DB    jmp         005904CD
 005904DD    pop         edi
 005904DE    pop         esi
 005904DF    pop         ebx
 005904E0    pop         ecx
 005904E1    pop         ebp
 005904E2    ret
*}
end;

//005904E4
procedure TXMLNode.SetChildNodes(const Value:IXMLNodeList);
begin
{*
 005904E4    push        ebx
 005904E5    push        esi
 005904E6    push        edi
 005904E7    push        ebp
 005904E8    mov         ebp,edx
 005904EA    mov         ebx,eax
 005904EC    cmp         dword ptr [ebx+24],0
>005904F0    jne         00590525
 005904F2    lea         eax,[ebx+10]
 005904F5    mov         edx,ebp
 005904F7    call        @IntfCopy
 005904FC    cmp         dword ptr [ebx+2C],0
>00590500    je          00590525
 00590502    mov         eax,dword ptr [ebx+2C]
 00590505    call        @DynArrayLength
 0059050A    mov         esi,eax
 0059050C    dec         esi
 0059050D    test        esi,esi
>0059050F    jl          00590525
 00590511    inc         esi
 00590512    xor         edi,edi
 00590514    mov         eax,dword ptr [ebx+2C]
 00590517    mov         eax,dword ptr [eax+edi*4]
 0059051A    mov         edx,ebp
 0059051C    mov         ecx,dword ptr [eax]
 0059051E    call        dword ptr [ecx+18]
 00590521    inc         edi
 00590522    dec         esi
>00590523    jne         00590514
 00590525    pop         ebp
 00590526    pop         edi
 00590527    pop         esi
 00590528    pop         ebx
 00590529    ret
*}
end;

//0059052C
function TXMLNode.HasChildNode(const ChildTag:DOMString):Boolean;
begin
{*
 0059052C    push        ebp
 0059052D    mov         ebp,esp
 0059052F    push        0
 00590531    push        ebx
 00590532    push        esi
 00590533    mov         esi,edx
 00590535    mov         ebx,eax
 00590537    xor         eax,eax
 00590539    push        ebp
 0059053A    push        590573
 0059053F    push        dword ptr fs:[eax]
 00590542    mov         dword ptr fs:[eax],esp
 00590545    lea         edx,[ebp-4]
 00590548    mov         eax,ebx
 0059054A    call        TXMLNode.GetNamespaceURI
 0059054F    mov         ecx,dword ptr [ebp-4]
 00590552    mov         edx,esi
 00590554    mov         eax,ebx
 00590556    call        TXMLNode.HasChildNode
 0059055B    mov         ebx,eax
 0059055D    xor         eax,eax
 0059055F    pop         edx
 00590560    pop         ecx
 00590561    pop         ecx
 00590562    mov         dword ptr fs:[eax],edx
 00590565    push        59057A
 0059056A    lea         eax,[ebp-4]
 0059056D    call        @UStrClr
 00590572    ret
>00590573    jmp         @HandleFinally
>00590578    jmp         0059056A
 0059057A    mov         eax,ebx
 0059057C    pop         esi
 0059057D    pop         ebx
 0059057E    pop         ecx
 0059057F    pop         ebp
 00590580    ret
*}
end;

//00590584
function TXMLNode.HasChildNode(const ChildTag:DOMString; const NamespaceURI:DOMString):Boolean;
begin
{*
 00590584    push        ebp
 00590585    mov         ebp,esp
 00590587    add         esp,0FFFFFFE4
 0059058A    push        ebx
 0059058B    push        esi
 0059058C    push        edi
 0059058D    xor         ebx,ebx
 0059058F    mov         dword ptr [ebp-18],ebx
 00590592    mov         dword ptr [ebp-1C],ebx
 00590595    mov         dword ptr [ebp-14],ebx
 00590598    mov         dword ptr [ebp-8],ecx
 0059059B    mov         dword ptr [ebp-4],edx
 0059059E    mov         edi,eax
 005905A0    xor         eax,eax
 005905A2    push        ebp
 005905A3    push        590657
 005905A8    push        dword ptr fs:[eax]
 005905AB    mov         dword ptr fs:[eax],esp
 005905AE    mov         byte ptr [ebp-9],0
 005905B2    lea         eax,[ebp-10]
 005905B5    push        eax
 005905B6    lea         eax,[ebp-14]
 005905B9    call        @IntfClear
 005905BE    push        eax
 005905BF    mov         eax,dword ptr [edi+20]
 005905C2    push        eax
 005905C3    mov         eax,dword ptr [eax]
 005905C5    call        dword ptr [eax+20]
 005905C8    call        @CheckAutoResult
 005905CD    mov         eax,dword ptr [ebp-14]
 005905D0    push        eax
 005905D1    mov         eax,dword ptr [eax]
 005905D3    call        dword ptr [eax+10]
 005905D6    call        @CheckAutoResult
 005905DB    mov         ebx,dword ptr [ebp-10]
 005905DE    dec         ebx
 005905DF    test        ebx,ebx
>005905E1    jl          00590631
 005905E3    inc         ebx
 005905E4    xor         esi,esi
 005905E6    lea         eax,[ebp-18]
 005905E9    call        @IntfClear
 005905EE    push        eax
 005905EF    push        esi
 005905F0    lea         eax,[ebp-1C]
 005905F3    call        @IntfClear
 005905F8    push        eax
 005905F9    mov         eax,dword ptr [edi+20]
 005905FC    push        eax
 005905FD    mov         eax,dword ptr [eax]
 005905FF    call        dword ptr [eax+20]
 00590602    call        @CheckAutoResult
 00590607    mov         eax,dword ptr [ebp-1C]
 0059060A    push        eax
 0059060B    mov         eax,dword ptr [eax]
 0059060D    call        dword ptr [eax+0C]
 00590610    call        @CheckAutoResult
 00590615    mov         eax,dword ptr [ebp-18]
 00590618    mov         ecx,dword ptr [ebp-8]
 0059061B    mov         edx,dword ptr [ebp-4]
 0059061E    call        NodeMatches
 00590623    test        al,al
>00590625    je          0059062D
 00590627    mov         byte ptr [ebp-9],1
>0059062B    jmp         00590631
 0059062D    inc         esi
 0059062E    dec         ebx
>0059062F    jne         005905E6
 00590631    xor         eax,eax
 00590633    pop         edx
 00590634    pop         ecx
 00590635    pop         ecx
 00590636    mov         dword ptr fs:[eax],edx
 00590639    push        59065E
 0059063E    lea         eax,[ebp-1C]
 00590641    call        @IntfClear
 00590646    lea         eax,[ebp-18]
 00590649    call        @IntfClear
 0059064E    lea         eax,[ebp-14]
 00590651    call        @IntfClear
 00590656    ret
>00590657    jmp         @HandleFinally
>0059065C    jmp         0059063E
 0059065E    movzx       eax,byte ptr [ebp-9]
 00590662    pop         edi
 00590663    pop         esi
 00590664    pop         ebx
 00590665    mov         esp,ebp
 00590667    pop         ebp
 00590668    ret
*}
end;

//0059066C
function TXMLNode.AddChild(const TagName:DOMString; Index:Integer):IXMLNode;
begin
{*
 0059066C    push        ebp
 0059066D    mov         ebp,esp
 0059066F    push        0
 00590671    push        0
 00590673    push        0
 00590675    push        ebx
 00590676    push        esi
 00590677    push        edi
 00590678    mov         edi,ecx
 0059067A    mov         esi,edx
 0059067C    mov         ebx,eax
 0059067E    xor         eax,eax
 00590680    push        ebp
 00590681    push        590700
 00590686    push        dword ptr fs:[eax]
 00590689    mov         dword ptr fs:[eax],esp
 0059068C    mov         eax,esi
 0059068E    call        IsPrefixed
 00590693    test        al,al
>00590695    je          005906AF
 00590697    lea         eax,[ebp-4]
 0059069A    mov         edx,esi
 0059069C    call        @UStrLAsg
 005906A1    lea         ecx,[ebp-8]
 005906A4    mov         edx,esi
 005906A6    mov         eax,ebx
 005906A8    call        TXMLNode.FindNamespaceURI
>005906AD    jmp         005906D0
 005906AF    lea         edx,[ebp-0C]
 005906B2    mov         eax,ebx
 005906B4    call        TXMLNode.GetPrefix
 005906B9    mov         eax,dword ptr [ebp-0C]
 005906BC    lea         ecx,[ebp-4]
 005906BF    mov         edx,esi
 005906C1    call        MakeNodeName
 005906C6    lea         edx,[ebp-8]
 005906C9    mov         eax,ebx
 005906CB    call        TXMLNode.GetNamespaceURI
 005906D0    mov         eax,dword ptr [ebp-8]
 005906D3    push        eax
 005906D4    push        edi
 005906D5    mov         eax,dword ptr [ebp+8]
 005906D8    push        eax
 005906D9    mov         ecx,dword ptr [ebp-4]
 005906DC    xor         edx,edx
 005906DE    mov         eax,ebx
 005906E0    call        TXMLNode.InternalAddChild
 005906E5    xor         eax,eax
 005906E7    pop         edx
 005906E8    pop         ecx
 005906E9    pop         ecx
 005906EA    mov         dword ptr fs:[eax],edx
 005906ED    push        590707
 005906F2    lea         eax,[ebp-0C]
 005906F5    mov         edx,3
 005906FA    call        @UStrArrayClr
 005906FF    ret
>00590700    jmp         @HandleFinally
>00590705    jmp         005906F2
 00590707    pop         edi
 00590708    pop         esi
 00590709    pop         ebx
 0059070A    mov         esp,ebp
 0059070C    pop         ebp
 0059070D    ret         4
*}
end;

//00590710
function TXMLNode.AddChild(const TagName:DOMString; const NamespaceURI:DOMString; GenPrefix:Boolean; Index:Integer):IXMLNode;
begin
{*
 00590710    push        ebp
 00590711    mov         ebp,esp
 00590713    push        0
 00590715    push        0
 00590717    push        0
 00590719    push        0
 0059071B    push        ebx
 0059071C    push        esi
 0059071D    push        edi
 0059071E    mov         esi,ecx
 00590720    mov         edi,edx
 00590722    mov         ebx,eax
 00590724    xor         eax,eax
 00590726    push        ebp
 00590727    push        59080C
 0059072C    push        dword ptr fs:[eax]
 0059072F    mov         dword ptr fs:[eax],esp
 00590732    lea         eax,[ebp-8]
 00590735    mov         edx,edi
 00590737    call        @UStrLAsg
 0059073C    lea         ecx,[ebp-4]
 0059073F    mov         edx,esi
 00590741    mov         eax,ebx
 00590743    call        TXMLNode.FindNamespaceDecl
 00590748    cmp         dword ptr [ebp-4],0
>0059074C    je          0059075F
 0059074E    lea         eax,[ebp-8]
 00590751    push        eax
 00590752    mov         ecx,esi
 00590754    mov         edx,edi
 00590756    mov         eax,ebx
 00590758    call        TXMLNode.GetPrefixedName
>0059075D    jmp         005907A9
 0059075F    mov         eax,edi
 00590761    call        IsPrefixed
 00590766    test        al,al
>00590768    jne         0059079F
 0059076A    cmp         byte ptr [ebp+10],0
>0059076E    je          005907A9
 00590770    lea         ecx,[ebp-0C]
 00590773    mov         edx,ebx
 00590775    test        edx,edx
>00590777    je          0059077C
 00590779    sub         edx,0FFFFFFB8
 0059077C    mov         eax,dword ptr [ebx+1C]
 0059077F    call        TXMLDocument.GeneratePrefix
 00590784    lea         ecx,[ebp-10]
 00590787    mov         edx,dword ptr [ebp-8]
 0059078A    mov         eax,dword ptr [ebp-0C]
 0059078D    call        MakeNodeName
 00590792    mov         edx,dword ptr [ebp-10]
 00590795    lea         eax,[ebp-8]
 00590798    call        @UStrLAsg
>0059079D    jmp         005907A9
 0059079F    lea         edx,[ebp-0C]
 005907A2    mov         eax,edi
 005907A4    call        ExtractPrefix
 005907A9    push        esi
 005907AA    mov         eax,dword ptr [ebp+0C]
 005907AD    push        eax
 005907AE    mov         eax,dword ptr [ebp+8]
 005907B1    push        eax
 005907B2    mov         ecx,dword ptr [ebp-8]
 005907B5    xor         edx,edx
 005907B7    mov         eax,ebx
 005907B9    call        TXMLNode.InternalAddChild
 005907BE    cmp         dword ptr [ebp-4],0
>005907C2    jne         005907E9
 005907C4    cmp         dword ptr [ebx+1C],0
>005907C8    je          005907E9
 005907CA    test        esi,esi
>005907CC    je          005907E9
 005907CE    mov         eax,dword ptr [ebx+1C]
 005907D1    call        TXMLDocument.GetOptions
 005907D6    test        al,10
>005907D8    je          005907E9
 005907DA    mov         eax,dword ptr [ebp+8]
 005907DD    mov         eax,dword ptr [eax]
 005907DF    mov         ecx,esi
 005907E1    mov         edx,dword ptr [ebp-0C]
 005907E4    mov         ebx,dword ptr [eax]
 005907E6    call        dword ptr [ebx+78]
 005907E9    xor         eax,eax
 005907EB    pop         edx
 005907EC    pop         ecx
 005907ED    pop         ecx
 005907EE    mov         dword ptr fs:[eax],edx
 005907F1    push        590813
 005907F6    lea         eax,[ebp-10]
 005907F9    mov         edx,3
 005907FE    call        @UStrArrayClr
 00590803    lea         eax,[ebp-4]
 00590806    call        @IntfClear
 0059080B    ret
>0059080C    jmp         @HandleFinally
>00590811    jmp         005907F6
 00590813    pop         edi
 00590814    pop         esi
 00590815    pop         ebx
 00590816    mov         esp,ebp
 00590818    pop         ebp
 00590819    ret         0C
*}
end;

//0059081C
function TXMLNode.AddChild(const TagName:DOMString; const NamespaceURI:DOMString; NodeClass:TXMLNodeClass; Index:Integer):IXMLNode;
begin
{*
 0059081C    push        ebp
 0059081D    mov         ebp,esp
 0059081F    push        ebx
 00590820    push        esi
 00590821    push        edi
 00590822    mov         edi,ecx
 00590824    mov         esi,edx
 00590826    mov         ebx,eax
 00590828    push        edi
 00590829    mov         eax,dword ptr [ebp+0C]
 0059082C    push        eax
 0059082D    mov         eax,dword ptr [ebp+8]
 00590830    push        eax
 00590831    mov         ecx,esi
 00590833    mov         edx,dword ptr [ebp+10]
 00590836    mov         eax,ebx
 00590838    call        TXMLNode.InternalAddChild
 0059083D    pop         edi
 0059083E    pop         esi
 0059083F    pop         ebx
 00590840    pop         ebp
 00590841    ret         0C
*}
end;

//00590844
function TXMLNode.CreateCollection(const CollectionClass:TXMLNodeCollectionClass; const ItemInterface:TGUID; const ItemTag:DOMString; ItemNS:DOMString):TXMLNodeCollection;
begin
{*
 00590844    push        ebp
 00590845    mov         ebp,esp
 00590847    push        ebx
 00590848    push        esi
 00590849    push        edi
 0059084A    mov         edi,ecx
 0059084C    mov         ebx,edx
 0059084E    mov         esi,eax
 00590850    mov         eax,dword ptr [ebp+8]
 00590853    call        @UStrAddRef
 00590858    xor         eax,eax
 0059085A    push        ebp
 0059085B    push        5908CA
 00590860    push        dword ptr fs:[eax]
 00590863    mov         dword ptr fs:[eax],esp
 00590866    mov         ecx,esi
 00590868    mov         dl,1
 0059086A    mov         eax,ebx
 0059086C    call        TXMLNode.CreateHosted
 00590871    mov         ebx,eax
 00590873    cmp         dword ptr [ebp+8],0
>00590877    jne         00590883
 00590879    lea         edx,[ebp+8]
 0059087C    mov         eax,esi
 0059087E    call        TXMLNode.GetNamespaceURI
 00590883    push        esi
 00590884    mov         esi,edi
 00590886    lea         edi,[ebx+50]
 00590889    movs        dword ptr [edi],dword ptr [esi]
 0059088A    movs        dword ptr [edi],dword ptr [esi]
 0059088B    movs        dword ptr [edi],dword ptr [esi]
 0059088C    movs        dword ptr [edi],dword ptr [esi]
 0059088D    pop         esi
 0059088E    lea         eax,[ebx+64]
 00590891    mov         edx,dword ptr [ebp+0C]
 00590894    call        @UStrAsg
 00590899    lea         eax,[ebx+60]
 0059089C    mov         edx,dword ptr [ebp+8]
 0059089F    call        @UStrAsg
 005908A4    cmp         dword ptr [esi+10],0
>005908A8    je          005908B4
 005908AA    mov         edx,dword ptr [esi+10]
 005908AD    mov         eax,ebx
 005908AF    mov         ecx,dword ptr [eax]
 005908B1    call        dword ptr [ecx+18]
 005908B4    xor         eax,eax
 005908B6    pop         edx
 005908B7    pop         ecx
 005908B8    pop         ecx
 005908B9    mov         dword ptr fs:[eax],edx
 005908BC    push        5908D1
 005908C1    lea         eax,[ebp+8]
 005908C4    call        @UStrClr
 005908C9    ret
>005908CA    jmp         @HandleFinally
>005908CF    jmp         005908C1
 005908D1    mov         eax,ebx
 005908D3    pop         edi
 005908D4    pop         esi
 005908D5    pop         ebx
 005908D6    pop         ebp
 005908D7    ret         8
*}
end;

//005908DC
procedure TXMLNode.ChildListNotify(Operation:TNodeListOperation; var Node:IXMLNode; const IndexOrName:OleVariant; BeforeOperation:Boolean);
begin
{*
 005908DC    push        ebp
 005908DD    mov         ebp,esp
 005908DF    push        ecx
 005908E0    mov         ecx,9
 005908E5    push        0
 005908E7    push        0
 005908E9    dec         ecx
>005908EA    jne         005908E5
 005908EC    push        ecx
 005908ED    xchg        ecx,dword ptr [ebp-4]
 005908F0    push        ebx
 005908F1    push        esi
 005908F2    mov         dword ptr [ebp-8],ecx
 005908F5    mov         byte ptr [ebp-1],dl
 005908F8    mov         ebx,eax
 005908FA    xor         eax,eax
 005908FC    push        ebp
 005908FD    push        590BCB
 00590902    push        dword ptr fs:[eax]
 00590905    mov         dword ptr fs:[eax],esp
 00590908    movzx       eax,byte ptr [ebp-1]
 0059090C    movzx       edx,byte ptr [eax+789B8F]
 00590913    movzx       ecx,byte ptr [ebp+8]
 00590917    mov         eax,ebx
 00590919    mov         esi,dword ptr [eax]
 0059091B    call        dword ptr [esi+10]
 0059091E    cmp         byte ptr [ebp+8],0
>00590922    je          00590AFE
 00590928    lea         edx,[ebp-14]
 0059092B    mov         eax,ebx
 0059092D    call        TXMLNode.GetChildNodes
 00590932    mov         eax,dword ptr [ebp-14]
 00590935    mov         edx,dword ptr [eax]
 00590937    call        dword ptr [edx+14]
 0059093A    test        eax,eax
>0059093C    jne         00590AFE
 00590942    movzx       eax,byte ptr [ebp-1]
 00590946    sub         al,1
>00590948    jb          005909A5
>0059094A    je          00590959
 0059094C    dec         al
>0059094E    je          00590AD7
>00590954    jmp         00590AFE
 00590959    lea         eax,[ebp-18]
 0059095C    call        @IntfClear
 00590961    push        eax
 00590962    lea         edx,[ebp-1C]
 00590965    mov         eax,dword ptr [ebp-8]
 00590968    mov         eax,dword ptr [eax]
 0059096A    mov         ecx,dword ptr [eax]
 0059096C    call        dword ptr [ecx+20]
 0059096F    mov         eax,dword ptr [ebp-1C]
 00590972    push        eax
 00590973    mov         eax,dword ptr [ebx+20]
 00590976    push        eax
 00590977    mov         eax,dword ptr [eax]
 00590979    call        dword ptr [eax+50]
 0059097C    call        @CheckAutoResult
 00590981    lea         eax,[ebp-20]
 00590984    mov         edx,dword ptr [ebp-8]
 00590987    mov         edx,dword ptr [edx]
 00590989    mov         ecx,590BDC
 0059098E    call        @IntfCast
 00590993    mov         eax,dword ptr [ebp-20]
 00590996    xor         edx,edx
 00590998    mov         ecx,dword ptr [eax]
 0059099A    call        dword ptr [ecx+0F4]
>005909A0    jmp         00590AFE
 005909A5    lea         eax,[ebp-24]
 005909A8    push        eax
 005909A9    lea         eax,[ebp-28]
 005909AC    call        @IntfClear
 005909B1    push        eax
 005909B2    mov         eax,dword ptr [ebx+20]
 005909B5    push        eax
 005909B6    mov         eax,dword ptr [eax]
 005909B8    call        dword ptr [eax+20]
 005909BB    call        @CheckAutoResult
 005909C0    mov         eax,dword ptr [ebp-28]
 005909C3    push        eax
 005909C4    mov         eax,dword ptr [eax]
 005909C6    call        dword ptr [eax+10]
 005909C9    call        @CheckAutoResult
 005909CE    mov         esi,dword ptr [ebp-24]
 005909D1    mov         eax,dword ptr [ebx+10]
 005909D4    mov         edx,dword ptr [eax]
 005909D6    call        dword ptr [edx+0C]
 005909D9    cmp         esi,eax
>005909DB    je          005909F1
 005909DD    mov         ecx,676
 005909E2    mov         edx,590BF8;'C:\Builds\TP\xml\XMLDoc.pas'
 005909E7    mov         eax,590C3C;'Assertion failure'
 005909EC    call        @Assert
 005909F1    lea         eax,[ebp-24]
 005909F4    push        eax
 005909F5    lea         eax,[ebp-2C]
 005909F8    call        @IntfClear
 005909FD    push        eax
 005909FE    mov         eax,dword ptr [ebx+20]
 00590A01    push        eax
 00590A02    mov         eax,dword ptr [eax]
 00590A04    call        dword ptr [eax+20]
 00590A07    call        @CheckAutoResult
 00590A0C    mov         eax,dword ptr [ebp-2C]
 00590A0F    push        eax
 00590A10    mov         eax,dword ptr [eax]
 00590A12    call        dword ptr [eax+10]
 00590A15    call        @CheckAutoResult
 00590A1A    mov         esi,dword ptr [ebp-24]
 00590A1D    mov         eax,dword ptr [ebp+0C]
 00590A20    call        @VarToInteger
 00590A25    cmp         esi,eax
>00590A27    ja          00590A53
 00590A29    lea         eax,[ebp-30]
 00590A2C    call        @IntfClear
 00590A31    push        eax
 00590A32    lea         edx,[ebp-34]
 00590A35    mov         eax,dword ptr [ebp-8]
 00590A38    mov         eax,dword ptr [eax]
 00590A3A    mov         ecx,dword ptr [eax]
 00590A3C    call        dword ptr [ecx+20]
 00590A3F    mov         eax,dword ptr [ebp-34]
 00590A42    push        eax
 00590A43    mov         eax,dword ptr [ebx+20]
 00590A46    push        eax
 00590A47    mov         eax,dword ptr [eax]
 00590A49    call        dword ptr [eax+54]
 00590A4C    call        @CheckAutoResult
>00590A51    jmp         00590AB6
 00590A53    lea         eax,[ebp-38]
 00590A56    call        @IntfClear
 00590A5B    push        eax
 00590A5C    lea         eax,[ebp-3C]
 00590A5F    call        @IntfClear
 00590A64    push        eax
 00590A65    mov         eax,dword ptr [ebp+0C]
 00590A68    call        @VarToInteger
 00590A6D    push        eax
 00590A6E    lea         eax,[ebp-40]
 00590A71    call        @IntfClear
 00590A76    push        eax
 00590A77    mov         eax,dword ptr [ebx+20]
 00590A7A    push        eax
 00590A7B    mov         eax,dword ptr [eax]
 00590A7D    call        dword ptr [eax+20]
 00590A80    call        @CheckAutoResult
 00590A85    mov         eax,dword ptr [ebp-40]
 00590A88    push        eax
 00590A89    mov         eax,dword ptr [eax]
 00590A8B    call        dword ptr [eax+0C]
 00590A8E    call        @CheckAutoResult
 00590A93    mov         eax,dword ptr [ebp-3C]
 00590A96    push        eax
 00590A97    lea         edx,[ebp-44]
 00590A9A    mov         eax,dword ptr [ebp-8]
 00590A9D    mov         eax,dword ptr [eax]
 00590A9F    mov         ecx,dword ptr [eax]
 00590AA1    call        dword ptr [ecx+20]
 00590AA4    mov         eax,dword ptr [ebp-44]
 00590AA7    push        eax
 00590AA8    mov         eax,dword ptr [ebx+20]
 00590AAB    push        eax
 00590AAC    mov         eax,dword ptr [eax]
 00590AAE    call        dword ptr [eax+48]
 00590AB1    call        @CheckAutoResult
 00590AB6    lea         eax,[ebp-48]
 00590AB9    mov         edx,dword ptr [ebp-8]
 00590ABC    mov         edx,dword ptr [edx]
 00590ABE    mov         ecx,590BDC
 00590AC3    call        @IntfCast
 00590AC8    mov         eax,dword ptr [ebp-48]
 00590ACB    mov         edx,ebx
 00590ACD    mov         ecx,dword ptr [eax]
 00590ACF    call        dword ptr [ecx+0F4]
>00590AD5    jmp         00590AFE
 00590AD7    lea         eax,[ebp-4C]
 00590ADA    push        eax
 00590ADB    lea         eax,[ebp-50]
 00590ADE    mov         edx,dword ptr [ebp+0C]
 00590AE1    call        @VarToUStr
 00590AE6    mov         edx,dword ptr [ebp-50]
 00590AE9    or          ecx,0FFFFFFFF
 00590AEC    mov         eax,ebx
 00590AEE    call        TXMLNode.AddChild
 00590AF3    mov         edx,dword ptr [ebp-4C]
 00590AF6    mov         eax,dword ptr [ebp-8]
 00590AF9    call        @IntfCopy
 00590AFE    cmp         dword ptr [ebx+2C],0
>00590B02    je          00590B4C
 00590B04    mov         eax,dword ptr [ebx+2C]
 00590B07    call        @DynArrayLength
 00590B0C    dec         eax
 00590B0D    test        eax,eax
>00590B0F    jl          00590B4C
 00590B11    inc         eax
 00590B12    mov         dword ptr [ebp-10],eax
 00590B15    mov         dword ptr [ebp-0C],0
 00590B1C    mov         eax,dword ptr [ebx+2C]
 00590B1F    mov         edx,dword ptr [ebp-0C]
 00590B22    mov         eax,dword ptr [eax+edx*4]
 00590B25    cmp         word ptr [eax+3A],0
>00590B2A    je          00590B44
 00590B2C    mov         edx,dword ptr [ebp+0C]
 00590B2F    push        edx
 00590B30    movzx       edx,byte ptr [ebp+8]
 00590B34    push        edx
 00590B35    mov         ecx,dword ptr [ebp-8]
 00590B38    mov         esi,eax
 00590B3A    movzx       edx,byte ptr [ebp-1]
 00590B3E    mov         eax,dword ptr [esi+3C]
 00590B41    call        dword ptr [esi+38]
 00590B44    inc         dword ptr [ebp-0C]
 00590B47    dec         dword ptr [ebp-10]
>00590B4A    jne         00590B1C
 00590B4C    xor         eax,eax
 00590B4E    pop         edx
 00590B4F    pop         ecx
 00590B50    pop         ecx
 00590B51    mov         dword ptr fs:[eax],edx
 00590B54    push        590BD2
 00590B59    lea         eax,[ebp-50]
 00590B5C    call        @UStrClr
 00590B61    lea         eax,[ebp-4C]
 00590B64    call        @IntfClear
 00590B69    lea         eax,[ebp-48]
 00590B6C    call        @IntfClear
 00590B71    lea         eax,[ebp-44]
 00590B74    call        @IntfClear
 00590B79    lea         eax,[ebp-40]
 00590B7C    call        @IntfClear
 00590B81    lea         eax,[ebp-3C]
 00590B84    mov         edx,dword ptr ds:[58974C];IDOMNode
 00590B8A    mov         ecx,4
 00590B8F    call        @FinalizeArray
 00590B94    lea         eax,[ebp-2C]
 00590B97    mov         edx,dword ptr ds:[58977C];IDOMNodeList
 00590B9D    mov         ecx,2
 00590BA2    call        @FinalizeArray
 00590BA7    lea         eax,[ebp-20]
 00590BAA    call        @IntfClear
 00590BAF    lea         eax,[ebp-1C]
 00590BB2    mov         edx,dword ptr ds:[58974C];IDOMNode
 00590BB8    mov         ecx,2
 00590BBD    call        @FinalizeArray
 00590BC2    lea         eax,[ebp-14]
 00590BC5    call        @IntfClear
 00590BCA    ret
>00590BCB    jmp         @HandleFinally
>00590BD0    jmp         00590B59
 00590BD2    pop         esi
 00590BD3    pop         ebx
 00590BD4    mov         esp,ebp
 00590BD6    pop         ebp
 00590BD7    ret         8
*}
end;

//00590C60
function TXMLNode.CreateChildNode(const ADOMNode:IDOMNode):IXMLNode;
begin
{*
 00590C60    push        ebp
 00590C61    mov         ebp,esp
 00590C63    add         esp,0FFFFFFE8
 00590C66    push        ebx
 00590C67    push        esi
 00590C68    push        edi
 00590C69    xor         ebx,ebx
 00590C6B    mov         dword ptr [ebp-18],ebx
 00590C6E    mov         dword ptr [ebp-14],ebx
 00590C71    mov         dword ptr [ebp-8],ecx
 00590C74    mov         dword ptr [ebp-4],edx
 00590C77    mov         ebx,eax
 00590C79    xor         eax,eax
 00590C7B    push        ebp
 00590C7C    push        590D56
 00590C81    push        dword ptr fs:[eax]
 00590C84    mov         dword ptr fs:[eax],esp
 00590C87    mov         esi,dword ptr [ebx+24]
 00590C8A    test        esi,esi
>00590C8C    je          00590CA0
 00590C8E    mov         ecx,dword ptr [ebp-8]
 00590C91    mov         edx,dword ptr [ebp-4]
 00590C94    mov         eax,esi
 00590C96    mov         ebx,dword ptr [eax]
 00590C98    call        dword ptr [ebx+4]
>00590C9B    jmp         00590D35
 00590CA0    mov         edx,dword ptr [ebp-4]
 00590CA3    mov         eax,dword ptr [ebx+1C]
 00590CA6    mov         ecx,dword ptr [eax]
 00590CA8    call        dword ptr [ecx+3C]
 00590CAB    mov         dword ptr [ebp-10],eax
 00590CAE    cmp         dword ptr [ebp-10],0
>00590CB2    jne         00590D12
 00590CB4    mov         eax,[0058C024];TXMLNode
 00590CB9    mov         dword ptr [ebp-10],eax
 00590CBC    lea         edx,[ebp-14]
 00590CBF    mov         eax,ebx
 00590CC1    call        TXMLNode.GetChildNodeClasses
 00590CC6    mov         eax,dword ptr [ebp-14]
 00590CC9    call        @DynArrayLength
 00590CCE    mov         edi,eax
 00590CD0    dec         edi
 00590CD1    test        edi,edi
>00590CD3    jl          00590D12
 00590CD5    inc         edi
 00590CD6    mov         dword ptr [ebp-0C],0
 00590CDD    lea         edx,[ebp-18]
 00590CE0    mov         eax,ebx
 00590CE2    call        TXMLNode.GetChildNodeClasses
 00590CE7    mov         eax,dword ptr [ebp-18]
 00590CEA    mov         edx,dword ptr [ebp-0C]
 00590CED    lea         edx,[edx+edx*2]
 00590CF0    lea         esi,[eax+edx*4]
 00590CF3    mov         ecx,dword ptr [esi+4]
 00590CF6    mov         edx,dword ptr [esi]
 00590CF8    mov         eax,dword ptr [ebp-4]
 00590CFB    call        NodeMatches
 00590D00    test        al,al
>00590D02    je          00590D0C
 00590D04    mov         eax,dword ptr [esi+8]
 00590D07    mov         dword ptr [ebp-10],eax
>00590D0A    jmp         00590D12
 00590D0C    inc         dword ptr [ebp-0C]
 00590D0F    dec         edi
>00590D10    jne         00590CDD
 00590D12    push        ebx
 00590D13    mov         eax,dword ptr [ebx+1C]
 00590D16    push        eax
 00590D17    mov         ecx,dword ptr [ebp-4]
 00590D1A    mov         dl,1
 00590D1C    mov         eax,dword ptr [ebp-10]
 00590D1F    call        TXMLNode.Create
 00590D24    mov         edx,eax
 00590D26    test        edx,edx
>00590D28    je          00590D2D
 00590D2A    sub         edx,0FFFFFFB8
 00590D2D    mov         eax,dword ptr [ebp-8]
 00590D30    call        @IntfCopy
 00590D35    xor         eax,eax
 00590D37    pop         edx
 00590D38    pop         ecx
 00590D39    pop         ecx
 00590D3A    mov         dword ptr fs:[eax],edx
 00590D3D    push        590D5D
 00590D42    lea         eax,[ebp-18]
 00590D45    mov         edx,dword ptr ds:[58BC00];TNodeClassArray
 00590D4B    mov         ecx,2
 00590D50    call        @FinalizeArray
 00590D55    ret
>00590D56    jmp         @HandleFinally
>00590D5B    jmp         00590D42
 00590D5D    pop         edi
 00590D5E    pop         esi
 00590D5F    pop         ebx
 00590D60    mov         esp,ebp
 00590D62    pop         ebp
 00590D63    ret
*}
end;

//00590D64
procedure TXMLNode.RegisterChildNode(const TagName:DOMString; ChildNodeClass:TXMLNodeClass; NamespaceURI:DOMString);
begin
{*
 00590D64    push        ebp
 00590D65    mov         ebp,esp
 00590D67    push        ebx
 00590D68    push        esi
 00590D69    push        edi
 00590D6A    mov         edi,ecx
 00590D6C    mov         esi,edx
 00590D6E    mov         ebx,eax
 00590D70    mov         eax,dword ptr [ebp+8]
 00590D73    call        @UStrAddRef
 00590D78    xor         eax,eax
 00590D7A    push        ebp
 00590D7B    push        590DDA
 00590D80    push        dword ptr fs:[eax]
 00590D83    mov         dword ptr fs:[eax],esp
 00590D86    mov         eax,dword ptr [ebx+24]
 00590D89    test        eax,eax
>00590D8B    je          00590D9C
 00590D8D    mov         edx,dword ptr [ebp+8]
 00590D90    push        edx
 00590D91    mov         ecx,edi
 00590D93    mov         edx,esi
 00590D95    call        TXMLNode.RegisterChildNode
>00590D9A    jmp         00590DC4
 00590D9C    cmp         dword ptr [ebp+8],0
>00590DA0    jne         00590DAC
 00590DA2    lea         edx,[ebp+8]
 00590DA5    mov         eax,ebx
 00590DA7    call        TXMLNode.GetNamespaceURI
 00590DAC    mov         eax,dword ptr [ebp+8]
 00590DAF    push        eax
 00590DB0    lea         eax,[ebx+14]
 00590DB3    mov         ecx,esi
 00590DB5    mov         edx,edi
 00590DB7    call        AddNodeClassInfo
 00590DBC    lea         eax,[ebx+10]
 00590DBF    call        @IntfClear
 00590DC4    xor         eax,eax
 00590DC6    pop         edx
 00590DC7    pop         ecx
 00590DC8    pop         ecx
 00590DC9    mov         dword ptr fs:[eax],edx
 00590DCC    push        590DE1
 00590DD1    lea         eax,[ebp+8]
 00590DD4    call        @UStrClr
 00590DD9    ret
>00590DDA    jmp         @HandleFinally
>00590DDF    jmp         00590DD1
 00590DE1    pop         edi
 00590DE2    pop         esi
 00590DE3    pop         ebx
 00590DE4    pop         ebp
 00590DE5    ret         4
*}
end;

//00590DE8
function TXMLNode.InternalAddChild(NodeClass:TXMLNodeClass; const NodeName:DOMString; const NamespaceURI:DOMString; Index:Integer):IXMLNode;
begin
{*
 00590DE8    push        ebp
 00590DE9    mov         ebp,esp
 00590DEB    push        0
 00590DED    push        0
 00590DEF    push        0
 00590DF1    push        0
 00590DF3    push        ebx
 00590DF4    push        esi
 00590DF5    push        edi
 00590DF6    mov         dword ptr [ebp-0C],ecx
 00590DF9    mov         edi,edx
 00590DFB    mov         ebx,eax
 00590DFD    mov         esi,dword ptr [ebp+8]
 00590E00    xor         eax,eax
 00590E02    push        ebp
 00590E03    push        590EC7
 00590E08    push        dword ptr fs:[eax]
 00590E0B    mov         dword ptr fs:[eax],esp
 00590E0E    mov         eax,ebx
 00590E10    call        TXMLNode.GetNodeType
 00590E15    cmp         al,9
>00590E17    jne         00590E2B
 00590E19    lea         eax,[ebp-4]
 00590E1C    mov         edx,dword ptr [ebx+20]
 00590E1F    mov         ecx,590ED8
 00590E24    call        @IntfCast
>00590E29    jmp         00590E42
 00590E2B    lea         eax,[ebp-4]
 00590E2E    call        @IntfClear
 00590E33    push        eax
 00590E34    mov         eax,dword ptr [ebx+20]
 00590E37    push        eax
 00590E38    mov         eax,dword ptr [eax]
 00590E3A    call        dword ptr [eax+38]
 00590E3D    call        @CheckAutoResult
 00590E42    mov         eax,dword ptr [ebp+10]
 00590E45    push        eax
 00590E46    lea         eax,[ebp-8]
 00590E49    push        eax
 00590E4A    mov         cl,1
 00590E4C    mov         edx,dword ptr [ebp-0C]
 00590E4F    mov         eax,dword ptr [ebp-4]
 00590E52    call        CreateDOMNode
 00590E57    test        edi,edi
>00590E59    jne         00590E69
 00590E5B    mov         ecx,esi
 00590E5D    mov         edx,dword ptr [ebp-8]
 00590E60    mov         eax,ebx
 00590E62    mov         edi,dword ptr [eax]
 00590E64    call        dword ptr [edi+4]
>00590E67    jmp         00590E8A
 00590E69    push        ebx
 00590E6A    mov         eax,dword ptr [ebx+1C]
 00590E6D    push        eax
 00590E6E    mov         ecx,dword ptr [ebp-8]
 00590E71    mov         dl,1
 00590E73    mov         eax,edi
 00590E75    call        TXMLNode.Create
 00590E7A    mov         edx,eax
 00590E7C    test        edx,edx
>00590E7E    je          00590E83
 00590E80    sub         edx,0FFFFFFB8
 00590E83    mov         eax,esi
 00590E85    call        @IntfCopy
 00590E8A    lea         edx,[ebp-10]
 00590E8D    mov         eax,ebx
 00590E8F    call        TXMLNode.GetChildNodes
 00590E94    mov         eax,dword ptr [ebp-10]
 00590E97    mov         ecx,dword ptr [esi]
 00590E99    mov         edx,dword ptr [ebp+0C]
 00590E9C    mov         ebx,dword ptr [eax]
 00590E9E    call        dword ptr [ebx+58]
 00590EA1    xor         eax,eax
 00590EA3    pop         edx
 00590EA4    pop         ecx
 00590EA5    pop         ecx
 00590EA6    mov         dword ptr fs:[eax],edx
 00590EA9    push        590ECE
 00590EAE    lea         eax,[ebp-10]
 00590EB1    call        @IntfClear
 00590EB6    lea         eax,[ebp-8]
 00590EB9    call        @IntfClear
 00590EBE    lea         eax,[ebp-4]
 00590EC1    call        @IntfClear
 00590EC6    ret
>00590EC7    jmp         @HandleFinally
>00590ECC    jmp         00590EAE
 00590ECE    pop         edi
 00590ECF    pop         esi
 00590ED0    pop         ebx
 00590ED1    mov         esp,ebp
 00590ED3    pop         ebp
 00590ED4    ret         0C
*}
end;

//00590EE8
function TXMLNode.FindNamespaceURI(const TagOrPrefix:DOMString):DOMString;
begin
{*
 00590EE8    push        ebp
 00590EE9    mov         ebp,esp
 00590EEB    push        ecx
 00590EEC    mov         ecx,0E
 00590EF1    push        0
 00590EF3    push        0
 00590EF5    dec         ecx
>00590EF6    jne         00590EF1
 00590EF8    xchg        ecx,dword ptr [ebp-4]
 00590EFB    push        ebx
 00590EFC    push        esi
 00590EFD    push        edi
 00590EFE    mov         dword ptr [ebp-8],ecx
 00590F01    mov         ebx,edx
 00590F03    mov         esi,eax
 00590F05    xor         eax,eax
 00590F07    push        ebp
 00590F08    push        5910D2
 00590F0D    push        dword ptr fs:[eax]
 00590F10    mov         dword ptr fs:[eax],esp
 00590F13    mov         eax,dword ptr [ebp-8]
 00590F16    call        @UStrClr
 00590F1B    mov         eax,ebx
 00590F1D    call        IsPrefixed
 00590F22    test        al,al
>00590F24    je          00590F32
 00590F26    lea         edx,[ebp-4]
 00590F29    mov         eax,ebx
 00590F2B    call        ExtractPrefix
>00590F30    jmp         00590F3C
 00590F32    lea         eax,[ebp-4]
 00590F35    mov         edx,ebx
 00590F37    call        @UStrLAsg
 00590F3C    mov         ebx,esi
>00590F3E    jmp         0059103C
 00590F43    lea         edx,[ebp-10]
 00590F46    mov         eax,ebx
 00590F48    call        TXMLNode.GetAttributeNodes
 00590F4D    mov         eax,dword ptr [ebp-10]
 00590F50    mov         edx,dword ptr [eax]
 00590F52    call        dword ptr [edx+0C]
 00590F55    dec         eax
 00590F56    test        eax,eax
>00590F58    jl          00591039
 00590F5E    inc         eax
 00590F5F    mov         dword ptr [ebp-0C],eax
 00590F62    xor         esi,esi
 00590F64    lea         edx,[ebp-1C]
 00590F67    mov         eax,ebx
 00590F69    call        TXMLNode.GetAttributeNodes
 00590F6E    mov         eax,dword ptr [ebp-1C]
 00590F71    push        eax
 00590F72    lea         eax,[ebp-2C]
 00590F75    mov         edx,esi
 00590F77    mov         cl,0FC
 00590F79    call        @OleVarFromInt
 00590F7E    lea         edx,[ebp-2C]
 00590F81    lea         ecx,[ebp-18]
 00590F84    pop         eax
 00590F85    mov         edi,dword ptr [eax]
 00590F87    call        dword ptr [edi+10]
 00590F8A    mov         eax,dword ptr [ebp-18]
 00590F8D    lea         edx,[ebp-14]
 00590F90    mov         ecx,dword ptr [eax]
 00590F92    call        dword ptr [ecx+48]
 00590F95    mov         eax,dword ptr [ebp-14]
 00590F98    mov         edx,5910EC;'xmlns'
 00590F9D    call        @UStrEqual
>00590FA2    jne         0059102F
 00590FA8    lea         edx,[ebp-3C]
 00590FAB    mov         eax,ebx
 00590FAD    call        TXMLNode.GetAttributeNodes
 00590FB2    mov         eax,dword ptr [ebp-3C]
 00590FB5    push        eax
 00590FB6    lea         eax,[ebp-4C]
 00590FB9    mov         edx,esi
 00590FBB    mov         cl,0FC
 00590FBD    call        @OleVarFromInt
 00590FC2    lea         edx,[ebp-4C]
 00590FC5    lea         ecx,[ebp-38]
 00590FC8    pop         eax
 00590FC9    mov         edi,dword ptr [eax]
 00590FCB    call        dword ptr [edi+10]
 00590FCE    mov         eax,dword ptr [ebp-38]
 00590FD1    lea         edx,[ebp-34]
 00590FD4    mov         ecx,dword ptr [eax]
 00590FD6    call        dword ptr [ecx+34]
 00590FD9    mov         eax,dword ptr [ebp-34]
 00590FDC    lea         edx,[ebp-30]
 00590FDF    call        ExtractLocalName
 00590FE4    mov         edx,dword ptr [ebp-30]
 00590FE7    mov         eax,dword ptr [ebp-4]
 00590FEA    call        @UStrEqual
>00590FEF    jne         0059102F
 00590FF1    lea         edx,[ebp-64]
 00590FF4    mov         eax,ebx
 00590FF6    call        TXMLNode.GetAttributeNodes
 00590FFB    mov         eax,dword ptr [ebp-64]
 00590FFE    push        eax
 00590FFF    lea         eax,[ebp-74]
 00591002    mov         edx,esi
 00591004    mov         cl,0FC
 00591006    call        @OleVarFromInt
 0059100B    lea         edx,[ebp-74]
 0059100E    lea         ecx,[ebp-60]
 00591011    pop         eax
 00591012    mov         edi,dword ptr [eax]
 00591014    call        dword ptr [edi+10]
 00591017    mov         eax,dword ptr [ebp-60]
 0059101A    lea         edx,[ebp-5C]
 0059101D    mov         ecx,dword ptr [eax]
 0059101F    call        dword ptr [ecx+3C]
 00591022    lea         edx,[ebp-5C]
 00591025    mov         eax,dword ptr [ebp-8]
 00591028    call        @VarToUStr
>0059102D    jmp         00591039
 0059102F    inc         esi
 00591030    dec         dword ptr [ebp-0C]
>00591033    jne         00590F64
 00591039    mov         ebx,dword ptr [ebx+28]
 0059103C    mov         eax,dword ptr [ebp-8]
 0059103F    cmp         dword ptr [eax],0
>00591042    jne         0059104C
 00591044    test        ebx,ebx
>00591046    jne         00590F43
 0059104C    xor         eax,eax
 0059104E    pop         edx
 0059104F    pop         ecx
 00591050    pop         ecx
 00591051    mov         dword ptr fs:[eax],edx
 00591054    push        5910D9
 00591059    lea         eax,[ebp-74]
 0059105C    call        @VarClr
 00591061    lea         eax,[ebp-64]
 00591064    call        @IntfClear
 00591069    lea         eax,[ebp-60]
 0059106C    call        @IntfClear
 00591071    lea         eax,[ebp-5C]
 00591074    mov         edx,dword ptr ds:[4012D4];OleVariant
 0059107A    mov         ecx,2
 0059107F    call        @FinalizeArray
 00591084    lea         eax,[ebp-3C]
 00591087    call        @IntfClear
 0059108C    lea         eax,[ebp-38]
 0059108F    call        @IntfClear
 00591094    lea         eax,[ebp-34]
 00591097    mov         edx,2
 0059109C    call        @UStrArrayClr
 005910A1    lea         eax,[ebp-2C]
 005910A4    call        @VarClr
 005910A9    lea         eax,[ebp-1C]
 005910AC    call        @IntfClear
 005910B1    lea         eax,[ebp-18]
 005910B4    call        @IntfClear
 005910B9    lea         eax,[ebp-14]
 005910BC    call        @UStrClr
 005910C1    lea         eax,[ebp-10]
 005910C4    call        @IntfClear
 005910C9    lea         eax,[ebp-4]
 005910CC    call        @UStrClr
 005910D1    ret
>005910D2    jmp         @HandleFinally
>005910D7    jmp         00591059
 005910D9    pop         edi
 005910DA    pop         esi
 005910DB    pop         ebx
 005910DC    mov         esp,ebp
 005910DE    pop         ebp
 005910DF    ret
*}
end;

//005910F8
function TXMLNode.FindNamespaceDecl(const NamespaceURI:DOMString):IXMLNode;
begin
{*
 005910F8    push        ebp
 005910F9    mov         ebp,esp
 005910FB    push        ecx
 005910FC    mov         ecx,0A
 00591101    push        0
 00591103    push        0
 00591105    dec         ecx
>00591106    jne         00591101
 00591108    push        ecx
 00591109    xchg        ecx,dword ptr [ebp-4]
 0059110C    push        ebx
 0059110D    push        esi
 0059110E    push        edi
 0059110F    mov         dword ptr [ebp-10],ecx
 00591112    mov         dword ptr [ebp-0C],edx
 00591115    mov         dword ptr [ebp-8],eax
 00591118    xor         eax,eax
 0059111A    push        ebp
 0059111B    push        591280
 00591120    push        dword ptr fs:[eax]
 00591123    mov         dword ptr fs:[eax],esp
 00591126    mov         eax,dword ptr [ebp-10]
 00591129    call        @IntfClear
 0059112E    lea         edx,[ebp-14]
 00591131    mov         eax,dword ptr [ebp-8]
 00591134    call        TXMLNode.GetAttributeNodes
 00591139    mov         eax,dword ptr [ebp-14]
 0059113C    mov         edx,dword ptr [eax]
 0059113E    call        dword ptr [edx+0C]
 00591141    mov         esi,eax
 00591143    dec         esi
 00591144    test        esi,esi
>00591146    jl          00591200
 0059114C    inc         esi
 0059114D    xor         ebx,ebx
 0059114F    lea         edx,[ebp-18]
 00591152    mov         eax,dword ptr [ebp-8]
 00591155    call        TXMLNode.GetAttributeNodes
 0059115A    mov         eax,dword ptr [ebp-18]
 0059115D    push        eax
 0059115E    lea         eax,[ebp-28]
 00591161    mov         edx,ebx
 00591163    mov         cl,0FC
 00591165    call        @OleVarFromInt
 0059116A    lea         edx,[ebp-28]
 0059116D    lea         ecx,[ebp-4]
 00591170    pop         eax
 00591171    mov         edi,dword ptr [eax]
 00591173    call        dword ptr [edi+10]
 00591176    lea         edx,[ebp-3C]
 00591179    mov         eax,dword ptr [ebp-4]
 0059117C    mov         ecx,dword ptr [eax]
 0059117E    call        dword ptr [ecx+3C]
 00591181    lea         eax,[ebp-3C]
 00591184    lea         edx,[ebp-2C]
 00591187    call        VarToStr
 0059118C    mov         eax,dword ptr [ebp-2C]
 0059118F    mov         edx,dword ptr [ebp-0C]
 00591192    call        0058A0A4
 00591197    test        al,al
>00591199    je          005911F8
 0059119B    lea         edx,[ebp-40]
 0059119E    mov         eax,dword ptr [ebp-4]
 005911A1    mov         ecx,dword ptr [eax]
 005911A3    call        dword ptr [ecx+48]
 005911A6    mov         eax,dword ptr [ebp-40]
 005911A9    mov         edx,59129C;'xmlns'
 005911AE    call        @UStrEqual
>005911B3    je          005911CF
 005911B5    lea         edx,[ebp-44]
 005911B8    mov         eax,dword ptr [ebp-4]
 005911BB    mov         ecx,dword ptr [eax]
 005911BD    call        dword ptr [ecx+34]
 005911C0    mov         eax,dword ptr [ebp-44]
 005911C3    mov         edx,59129C;'xmlns'
 005911C8    call        @UStrEqual
>005911CD    jne         005911F8
 005911CF    lea         edx,[ebp-48]
 005911D2    mov         eax,dword ptr [ebp-8]
 005911D5    call        TXMLNode.GetAttributeNodes
 005911DA    mov         eax,dword ptr [ebp-48]
 005911DD    push        eax
 005911DE    lea         eax,[ebp-58]
 005911E1    mov         edx,ebx
 005911E3    mov         cl,0FC
 005911E5    call        @OleVarFromInt
 005911EA    lea         edx,[ebp-58]
 005911ED    mov         ecx,dword ptr [ebp-10]
 005911F0    pop         eax
 005911F1    mov         esi,dword ptr [eax]
 005911F3    call        dword ptr [esi+10]
>005911F6    jmp         00591200
 005911F8    inc         ebx
 005911F9    dec         esi
>005911FA    jne         0059114F
 00591200    mov         eax,dword ptr [ebp-10]
 00591203    cmp         dword ptr [eax],0
>00591206    jne         00591222
 00591208    mov         eax,dword ptr [ebp-8]
 0059120B    cmp         dword ptr [eax+28],0
>0059120F    je          00591222
 00591211    mov         ecx,dword ptr [ebp-10]
 00591214    mov         eax,dword ptr [ebp-8]
 00591217    mov         eax,dword ptr [eax+28]
 0059121A    mov         edx,dword ptr [ebp-0C]
 0059121D    call        TXMLNode.FindNamespaceDecl
 00591222    xor         eax,eax
 00591224    pop         edx
 00591225    pop         ecx
 00591226    pop         ecx
 00591227    mov         dword ptr fs:[eax],edx
 0059122A    push        591287
 0059122F    lea         eax,[ebp-58]
 00591232    call        @VarClr
 00591237    lea         eax,[ebp-48]
 0059123A    call        @IntfClear
 0059123F    lea         eax,[ebp-44]
 00591242    mov         edx,2
 00591247    call        @UStrArrayClr
 0059124C    lea         eax,[ebp-3C]
 0059124F    call        @VarClr
 00591254    lea         eax,[ebp-2C]
 00591257    call        @UStrClr
 0059125C    lea         eax,[ebp-28]
 0059125F    call        @VarClr
 00591264    lea         eax,[ebp-18]
 00591267    mov         edx,dword ptr ds:[58A858];IXMLNodeList
 0059126D    mov         ecx,2
 00591272    call        @FinalizeArray
 00591277    lea         eax,[ebp-4]
 0059127A    call        @IntfClear
 0059127F    ret
>00591280    jmp         @HandleFinally
>00591285    jmp         0059122F
 00591287    pop         edi
 00591288    pop         esi
 00591289    pop         ebx
 0059128A    mov         esp,ebp
 0059128C    pop         ebp
 0059128D    ret
*}
end;

//005912A8
procedure TXMLNode.DeclareNamespace(const Prefix:DOMString; const URI:DOMString);
begin
{*
 005912A8    push        ebp
 005912A9    mov         ebp,esp
 005912AB    push        ecx
 005912AC    mov         ecx,4
 005912B1    push        0
 005912B3    push        0
 005912B5    dec         ecx
>005912B6    jne         005912B1
 005912B8    xchg        ecx,dword ptr [ebp-4]
 005912BB    push        ebx
 005912BC    push        esi
 005912BD    push        edi
 005912BE    mov         edi,ecx
 005912C0    mov         esi,edx
 005912C2    mov         ebx,eax
 005912C4    xor         eax,eax
 005912C6    push        ebp
 005912C7    push        591349
 005912CC    push        dword ptr fs:[eax]
 005912CF    mov         dword ptr fs:[eax],esp
 005912D2    test        esi,esi
>005912D4    je          00591304
 005912D6    lea         eax,[ebp-10]
 005912D9    mov         edx,edi
 005912DB    call        @OleVarFromUStr
 005912E0    lea         eax,[ebp-10]
 005912E3    push        eax
 005912E4    lea         eax,[ebp-14]
 005912E7    mov         ecx,esi
 005912E9    mov         edx,591364;'xmlns:'
 005912EE    call        @UStrCat3
 005912F3    mov         edx,dword ptr [ebp-14]
 005912F6    mov         ecx,591380;'http://www.w3.org/2000/xmlns/'
 005912FB    mov         eax,ebx
 005912FD    call        TXMLNode.SetAttributeNS
>00591302    jmp         00591323
 00591304    lea         eax,[ebp-24]
 00591307    mov         edx,edi
 00591309    call        @OleVarFromUStr
 0059130E    lea         eax,[ebp-24]
 00591311    push        eax
 00591312    mov         ecx,591380;'http://www.w3.org/2000/xmlns/'
 00591317    mov         edx,5913C8;'xmlns'
 0059131C    mov         eax,ebx
 0059131E    call        TXMLNode.SetAttributeNS
 00591323    xor         eax,eax
 00591325    pop         edx
 00591326    pop         ecx
 00591327    pop         ecx
 00591328    mov         dword ptr fs:[eax],edx
 0059132B    push        591350
 00591330    lea         eax,[ebp-24]
 00591333    call        @VarClr
 00591338    lea         eax,[ebp-14]
 0059133B    call        @UStrClr
 00591340    lea         eax,[ebp-10]
 00591343    call        @VarClr
 00591348    ret
>00591349    jmp         @HandleFinally
>0059134E    jmp         00591330
 00591350    pop         edi
 00591351    pop         esi
 00591352    pop         ebx
 00591353    mov         esp,ebp
 00591355    pop         ebp
 00591356    ret
*}
end;

//005913D4
function TXMLNode.GetPrefixedName(const Name:DOMString; const NamespaceURI:DOMString):DOMString;
begin
{*
 005913D4    push        ebp
 005913D5    mov         ebp,esp
 005913D7    push        0
 005913D9    push        0
 005913DB    push        0
 005913DD    push        0
 005913DF    push        ebx
 005913E0    push        esi
 005913E1    push        edi
 005913E2    mov         dword ptr [ebp-8],ecx
 005913E5    mov         esi,edx
 005913E7    mov         ebx,eax
 005913E9    mov         edi,dword ptr [ebp+8]
 005913EC    xor         eax,eax
 005913EE    push        ebp
 005913EF    push        59148E
 005913F4    push        dword ptr fs:[eax]
 005913F7    mov         dword ptr fs:[eax],esp
 005913FA    mov         eax,dword ptr [ebx+1C]
 005913FD    call        TXMLDocument.GetOptions
 00591402    test        al,8
>00591404    je          00591462
 00591406    mov         eax,esi
 00591408    call        IsPrefixed
 0059140D    test        al,al
>0059140F    jne         00591462
 00591411    lea         ecx,[ebp-4]
 00591414    mov         edx,dword ptr [ebp-8]
 00591417    mov         eax,ebx
 00591419    call        TXMLNode.FindNamespaceDecl
 0059141E    cmp         dword ptr [ebp-4],0
>00591422    je          00591457
 00591424    lea         edx,[ebp-0C]
 00591427    mov         eax,dword ptr [ebp-4]
 0059142A    mov         ecx,dword ptr [eax]
 0059142C    call        dword ptr [ecx+34]
 0059142F    mov         eax,dword ptr [ebp-0C]
 00591432    mov         edx,5914AC;'xmlns'
 00591437    call        @UStrEqual
>0059143C    je          00591457
 0059143E    lea         edx,[ebp-10]
 00591441    mov         eax,dword ptr [ebp-4]
 00591444    mov         ecx,dword ptr [eax]
 00591446    call        dword ptr [ecx+2C]
 00591449    mov         eax,dword ptr [ebp-10]
 0059144C    mov         ecx,edi
 0059144E    mov         edx,esi
 00591450    call        MakeNodeName
>00591455    jmp         0059146B
 00591457    mov         eax,edi
 00591459    mov         edx,esi
 0059145B    call        @UStrAsg
>00591460    jmp         0059146B
 00591462    mov         eax,edi
 00591464    mov         edx,esi
 00591466    call        @UStrAsg
 0059146B    xor         eax,eax
 0059146D    pop         edx
 0059146E    pop         ecx
 0059146F    pop         ecx
 00591470    mov         dword ptr fs:[eax],edx
 00591473    push        591495
 00591478    lea         eax,[ebp-10]
 0059147B    mov         edx,2
 00591480    call        @UStrArrayClr
 00591485    lea         eax,[ebp-4]
 00591488    call        @IntfClear
 0059148D    ret
>0059148E    jmp         @HandleFinally
>00591493    jmp         00591478
 00591495    pop         edi
 00591496    pop         esi
 00591497    pop         ebx
 00591498    mov         esp,ebp
 0059149A    pop         ebp
 0059149B    ret         4
*}
end;

//005914B8
function TXMLNode.CloneNode(Deep:Boolean):IXMLNode;
begin
{*
 005914B8    push        ebp
 005914B9    mov         ebp,esp
 005914BB    add         esp,0FFFFFFF8
 005914BE    push        ebx
 005914BF    push        esi
 005914C0    push        edi
 005914C1    xor         ebx,ebx
 005914C3    mov         dword ptr [ebp-8],ebx
 005914C6    mov         dword ptr [ebp-4],ecx
 005914C9    mov         ebx,edx
 005914CB    mov         edi,eax
 005914CD    xor         eax,eax
 005914CF    push        ebp
 005914D0    push        591536
 005914D5    push        dword ptr fs:[eax]
 005914D8    mov         dword ptr fs:[eax],esp
 005914DB    mov         eax,dword ptr [edi]
 005914DD    mov         esi,eax
 005914DF    push        0
 005914E1    mov         eax,dword ptr [edi+1C]
 005914E4    push        eax
 005914E5    lea         eax,[ebp-8]
 005914E8    call        @IntfClear
 005914ED    push        eax
 005914EE    cmp         bl,1
 005914F1    cmc
 005914F2    sbb         eax,eax
 005914F4    push        eax
 005914F5    mov         eax,dword ptr [edi+20]
 005914F8    push        eax
 005914F9    mov         eax,dword ptr [eax]
 005914FB    call        dword ptr [eax+5C]
 005914FE    call        @CheckAutoResult
 00591503    mov         ecx,dword ptr [ebp-8]
 00591506    mov         dl,1
 00591508    mov         eax,esi
 0059150A    call        TXMLNode.Create
 0059150F    mov         edx,eax
 00591511    test        edx,edx
>00591513    je          00591518
 00591515    sub         edx,0FFFFFFB8
 00591518    mov         eax,dword ptr [ebp-4]
 0059151B    call        @IntfCopy
 00591520    xor         eax,eax
 00591522    pop         edx
 00591523    pop         ecx
 00591524    pop         ecx
 00591525    mov         dword ptr fs:[eax],edx
 00591528    push        59153D
 0059152D    lea         eax,[ebp-8]
 00591530    call        @IntfClear
 00591535    ret
>00591536    jmp         @HandleFinally
>0059153B    jmp         0059152D
 0059153D    pop         edi
 0059153E    pop         esi
 0059153F    pop         ebx
 00591540    pop         ecx
 00591541    pop         ecx
 00591542    pop         ebp
 00591543    ret
*}
end;

//00591544
procedure TXMLNode.Resync;
begin
{*
 00591544    push        ebx
 00591545    mov         ebx,eax
 00591547    xor         edx,edx
 00591549    mov         eax,ebx
 0059154B    mov         ecx,dword ptr [eax]
 0059154D    call        dword ptr [ecx+14]
 00591550    xor         edx,edx
 00591552    mov         eax,ebx
 00591554    mov         ecx,dword ptr [eax]
 00591556    call        dword ptr [ecx+18]
 00591559    pop         ebx
 0059155A    ret
*}
end;

//0059155C
function TXMLNode.FindHostedNode(const NodeClass:TXMLNodeClass):IXMLNode;
begin
{*
 0059155C    push        ebx
 0059155D    push        esi
 0059155E    push        edi
 0059155F    push        ebp
 00591560    add         esp,0FFFFFFF8
 00591563    mov         dword ptr [esp+4],ecx
 00591567    mov         dword ptr [esp],edx
 0059156A    mov         ebx,eax
 0059156C    mov         eax,dword ptr [esp+4]
 00591570    call        @IntfClear
 00591575    cmp         dword ptr [ebx+2C],0
>00591579    je          005915B9
 0059157B    mov         eax,dword ptr [ebx+2C]
 0059157E    call        @DynArrayLength
 00591583    mov         edi,eax
 00591585    dec         edi
 00591586    test        edi,edi
>00591588    jl          005915B9
 0059158A    inc         edi
 0059158B    xor         esi,esi
 0059158D    mov         eax,dword ptr [ebx+2C]
 00591590    mov         ebp,dword ptr [eax+esi*4]
 00591593    mov         eax,ebp
 00591595    mov         edx,dword ptr [esp]
 00591598    call        @IsClass
 0059159D    test        al,al
>0059159F    je          005915B5
 005915A1    mov         eax,dword ptr [esp+4]
 005915A5    mov         edx,ebp
 005915A7    test        edx,edx
>005915A9    je          005915AE
 005915AB    sub         edx,0FFFFFFB8
 005915AE    call        @IntfCopy
>005915B3    jmp         005915B9
 005915B5    inc         esi
 005915B6    dec         edi
>005915B7    jne         0059158D
 005915B9    pop         ecx
 005915BA    pop         edx
 005915BB    pop         ebp
 005915BC    pop         edi
 005915BD    pop         esi
 005915BE    pop         ebx
 005915BF    ret
*}
end;

//005915C0
procedure TXMLNode.AddHostedNode(Node:TXMLNode);
begin
{*
 005915C0    push        ebx
 005915C1    push        esi
 005915C2    mov         esi,edx
 005915C4    mov         ebx,eax
 005915C6    mov         eax,dword ptr [ebx+2C]
 005915C9    call        @DynArrayLength
 005915CE    inc         eax
 005915CF    push        eax
 005915D0    lea         eax,[ebx+2C]
 005915D3    mov         ecx,1
 005915D8    mov         edx,dword ptr ds:[58BB5C];TXMLNodeArray
 005915DE    call        @DynArraySetLength
 005915E3    add         esp,4
 005915E6    mov         eax,dword ptr [ebx+2C]
 005915E9    call        @DynArrayHigh
 005915EE    mov         edx,dword ptr [ebx+2C]
 005915F1    mov         dword ptr [edx+eax*4],esi
 005915F4    pop         esi
 005915F5    pop         ebx
 005915F6    ret
*}
end;

//005915F8
procedure TXMLNode.RemoveHostedNode(Node:TXMLNode);
begin
{*
 005915F8    push        ebx
 005915F9    push        esi
 005915FA    push        edi
 005915FB    push        ebp
 005915FC    mov         ebp,edx
 005915FE    mov         ebx,eax
 00591600    mov         eax,dword ptr [ebx+2C]
 00591603    call        @DynArrayLength
 00591608    mov         edi,eax
 0059160A    mov         eax,edi
 0059160C    dec         eax
 0059160D    test        eax,eax
>0059160F    jl          00591658
 00591611    inc         eax
 00591612    xor         esi,esi
 00591614    mov         edx,dword ptr [ebx+2C]
 00591617    cmp         ebp,dword ptr [edx+esi*4]
>0059161A    jne         00591654
 0059161C    mov         eax,esi
 0059161E    mov         edx,edi
 00591620    sub         edx,2
 00591623    sub         edx,eax
>00591625    jl          0059163A
 00591627    inc         edx
 00591628    mov         ecx,dword ptr [ebx+2C]
 0059162B    mov         ecx,dword ptr [ecx+eax*4+4]
 0059162F    mov         ebp,dword ptr [ebx+2C]
 00591632    mov         dword ptr [ebp+eax*4],ecx
 00591636    inc         eax
 00591637    dec         edx
>00591638    jne         00591628
 0059163A    dec         edi
 0059163B    push        edi
 0059163C    lea         eax,[ebx+2C]
 0059163F    mov         ecx,1
 00591644    mov         edx,dword ptr ds:[58BB5C];TXMLNodeArray
 0059164A    call        @DynArraySetLength
 0059164F    add         esp,4
>00591652    jmp         00591658
 00591654    inc         esi
 00591655    dec         eax
>00591656    jne         00591614
 00591658    pop         ebp
 00591659    pop         edi
 0059165A    pop         esi
 0059165B    pop         ebx
 0059165C    ret
*}
end;

//00591660
function TXMLNode.NextSibling:IXMLNode;
begin
{*
 00591660    push        ebp
 00591661    mov         ebp,esp
 00591663    push        0
 00591665    push        0
 00591667    push        ebx
 00591668    push        esi
 00591669    mov         esi,edx
 0059166B    mov         ebx,eax
 0059166D    xor         eax,eax
 0059166F    push        ebp
 00591670    push        5916DC
 00591675    push        dword ptr fs:[eax]
 00591678    mov         dword ptr fs:[eax],esp
 0059167B    cmp         dword ptr [ebx+28],0
>0059167F    je          005916B7
 00591681    push        esi
 00591682    lea         edx,[ebp-4]
 00591685    mov         eax,dword ptr [ebx+28]
 00591688    call        TXMLNode.GetChildNodes
 0059168D    mov         eax,dword ptr [ebp-4]
 00591690    push        eax
 00591691    lea         eax,[ebp-8]
 00591694    mov         edx,ebx
 00591696    test        edx,edx
>00591698    je          0059169D
 0059169A    sub         edx,0FFFFFFF8
 0059169D    mov         ecx,5916EC
 005916A2    call        @IntfCast
 005916A7    mov         edx,dword ptr [ebp-8]
 005916AA    mov         ecx,1
 005916AF    pop         eax
 005916B0    mov         ebx,dword ptr [eax]
 005916B2    call        dword ptr [ebx+44]
>005916B5    jmp         005916BE
 005916B7    mov         eax,esi
 005916B9    call        @IntfClear
 005916BE    xor         eax,eax
 005916C0    pop         edx
 005916C1    pop         ecx
 005916C2    pop         ecx
 005916C3    mov         dword ptr fs:[eax],edx
 005916C6    push        5916E3
 005916CB    lea         eax,[ebp-8]
 005916CE    call        @IntfClear
 005916D3    lea         eax,[ebp-4]
 005916D6    call        @IntfClear
 005916DB    ret
>005916DC    jmp         @HandleFinally
>005916E1    jmp         005916CB
 005916E3    pop         esi
 005916E4    pop         ebx
 005916E5    pop         ecx
 005916E6    pop         ecx
 005916E7    pop         ebp
 005916E8    ret
*}
end;

//005916FC
function TXMLNode.PreviousSibling:IXMLNode;
begin
{*
 005916FC    push        ebp
 005916FD    mov         ebp,esp
 005916FF    push        0
 00591701    push        0
 00591703    push        ebx
 00591704    push        esi
 00591705    mov         esi,edx
 00591707    mov         ebx,eax
 00591709    xor         eax,eax
 0059170B    push        ebp
 0059170C    push        591776
 00591711    push        dword ptr fs:[eax]
 00591714    mov         dword ptr fs:[eax],esp
 00591717    cmp         dword ptr [ebx+28],0
>0059171B    je          00591751
 0059171D    push        esi
 0059171E    lea         edx,[ebp-4]
 00591721    mov         eax,dword ptr [ebx+28]
 00591724    call        TXMLNode.GetChildNodes
 00591729    mov         eax,dword ptr [ebp-4]
 0059172C    push        eax
 0059172D    lea         eax,[ebp-8]
 00591730    mov         edx,ebx
 00591732    test        edx,edx
>00591734    je          00591739
 00591736    sub         edx,0FFFFFFF8
 00591739    mov         ecx,591784
 0059173E    call        @IntfCast
 00591743    mov         edx,dword ptr [ebp-8]
 00591746    or          ecx,0FFFFFFFF
 00591749    pop         eax
 0059174A    mov         ebx,dword ptr [eax]
 0059174C    call        dword ptr [ebx+44]
>0059174F    jmp         00591758
 00591751    mov         eax,esi
 00591753    call        @IntfClear
 00591758    xor         eax,eax
 0059175A    pop         edx
 0059175B    pop         ecx
 0059175C    pop         ecx
 0059175D    mov         dword ptr fs:[eax],edx
 00591760    push        59177D
 00591765    lea         eax,[ebp-8]
 00591768    call        @IntfClear
 0059176D    lea         eax,[ebp-4]
 00591770    call        @IntfClear
 00591775    ret
>00591776    jmp         @HandleFinally
>0059177B    jmp         00591765
 0059177D    pop         esi
 0059177E    pop         ebx
 0059177F    pop         ecx
 00591780    pop         ecx
 00591781    pop         ebp
 00591782    ret
*}
end;

//00591794
procedure TXMLNode.TransformNode(const stylesheet:IXMLNode; var output:WideString);
begin
{*
 00591794    push        ebp
 00591795    mov         ebp,esp
 00591797    push        0
 00591799    push        0
 0059179B    push        ebx
 0059179C    push        esi
 0059179D    push        edi
 0059179E    mov         edi,ecx
 005917A0    mov         esi,edx
 005917A2    mov         ebx,eax
 005917A4    xor         eax,eax
 005917A6    push        ebp
 005917A7    push        5917F8
 005917AC    push        dword ptr fs:[eax]
 005917AF    mov         dword ptr fs:[eax],esp
 005917B2    push        edi
 005917B3    lea         edx,[ebp-4]
 005917B6    mov         eax,esi
 005917B8    mov         ecx,dword ptr [eax]
 005917BA    call        dword ptr [ecx+20]
 005917BD    mov         eax,dword ptr [ebp-4]
 005917C0    push        eax
 005917C1    lea         edx,[ebp-8]
 005917C4    mov         eax,dword ptr [ebx+20]
 005917C7    call        GetDOMNodeEx
 005917CC    mov         eax,dword ptr [ebp-8]
 005917CF    push        eax
 005917D0    mov         eax,dword ptr [eax]
 005917D2    call        dword ptr [eax+74]
 005917D5    call        @CheckAutoResult
 005917DA    xor         eax,eax
 005917DC    pop         edx
 005917DD    pop         ecx
 005917DE    pop         ecx
 005917DF    mov         dword ptr fs:[eax],edx
 005917E2    push        5917FF
 005917E7    lea         eax,[ebp-8]
 005917EA    call        @IntfClear
 005917EF    lea         eax,[ebp-4]
 005917F2    call        @IntfClear
 005917F7    ret
>005917F8    jmp         @HandleFinally
>005917FD    jmp         005917E7
 005917FF    pop         edi
 00591800    pop         esi
 00591801    pop         ebx
 00591802    pop         ecx
 00591803    pop         ecx
 00591804    pop         ebp
 00591805    ret
*}
end;

//00591808
procedure TXMLNode.TransformNode(const stylesheet:IXMLNode; const output:IXMLDocument);
begin
{*
 00591808    push        ebp
 00591809    mov         ebp,esp
 0059180B    push        0
 0059180D    push        0
 0059180F    push        0
 00591811    push        ebx
 00591812    push        esi
 00591813    push        edi
 00591814    mov         edi,ecx
 00591816    mov         esi,edx
 00591818    mov         ebx,eax
 0059181A    xor         eax,eax
 0059181C    push        ebp
 0059181D    push        591883
 00591822    push        dword ptr fs:[eax]
 00591825    mov         dword ptr fs:[eax],esp
 00591828    lea         edx,[ebp-4]
 0059182B    mov         eax,edi
 0059182D    mov         ecx,dword ptr [eax]
 0059182F    call        dword ptr [ecx+20]
 00591832    mov         eax,dword ptr [ebp-4]
 00591835    push        eax
 00591836    lea         edx,[ebp-8]
 00591839    mov         eax,esi
 0059183B    mov         ecx,dword ptr [eax]
 0059183D    call        dword ptr [ecx+20]
 00591840    mov         eax,dword ptr [ebp-8]
 00591843    push        eax
 00591844    lea         edx,[ebp-0C]
 00591847    mov         eax,dword ptr [ebx+20]
 0059184A    call        GetDOMNodeEx
 0059184F    mov         eax,dword ptr [ebp-0C]
 00591852    push        eax
 00591853    mov         eax,dword ptr [eax]
 00591855    call        dword ptr [eax+78]
 00591858    call        @CheckAutoResult
 0059185D    xor         eax,eax
 0059185F    pop         edx
 00591860    pop         ecx
 00591861    pop         ecx
 00591862    mov         dword ptr fs:[eax],edx
 00591865    push        59188A
 0059186A    lea         eax,[ebp-0C]
 0059186D    call        @IntfClear
 00591872    lea         eax,[ebp-8]
 00591875    call        @IntfClear
 0059187A    lea         eax,[ebp-4]
 0059187D    call        @IntfClear
 00591882    ret
>00591883    jmp         @HandleFinally
>00591888    jmp         0059186A
 0059188A    pop         edi
 0059188B    pop         esi
 0059188C    pop         ebx
 0059188D    mov         esp,ebp
 0059188F    pop         ebp
 00591890    ret
*}
end;

//00591894
function TXMLNode.NestingLevel:Integer;
begin
{*
 00591894    push        ebp
 00591895    mov         ebp,esp
 00591897    push        0
 00591899    push        0
 0059189B    push        ebx
 0059189C    push        esi
 0059189D    mov         esi,eax
 0059189F    xor         eax,eax
 005918A1    push        ebp
 005918A2    push        591905
 005918A7    push        dword ptr fs:[eax]
 005918AA    mov         dword ptr fs:[eax],esp
 005918AD    xor         ebx,ebx
 005918AF    lea         eax,[ebp-4]
 005918B2    mov         edx,dword ptr [esi+28]
 005918B5    test        edx,edx
>005918B7    je          005918BC
 005918B9    sub         edx,0FFFFFFB8
 005918BC    call        @IntfCopy
 005918C1    cmp         dword ptr [ebp-4],0
>005918C5    je          005918E4
 005918C7    inc         ebx
 005918C8    lea         edx,[ebp-8]
 005918CB    mov         eax,dword ptr [ebp-4]
 005918CE    mov         ecx,dword ptr [eax]
 005918D0    call        dword ptr [ecx+44]
 005918D3    mov         edx,dword ptr [ebp-8]
 005918D6    lea         eax,[ebp-4]
 005918D9    call        @IntfCopy
 005918DE    cmp         dword ptr [ebp-4],0
>005918E2    jne         005918C7
 005918E4    xor         eax,eax
 005918E6    pop         edx
 005918E7    pop         ecx
 005918E8    pop         ecx
 005918E9    mov         dword ptr fs:[eax],edx
 005918EC    push        59190C
 005918F1    lea         eax,[ebp-8]
 005918F4    mov         edx,dword ptr ds:[58A824];IXMLNode
 005918FA    mov         ecx,2
 005918FF    call        @FinalizeArray
 00591904    ret
>00591905    jmp         @HandleFinally
>0059190A    jmp         005918F1
 0059190C    mov         eax,ebx
 0059190E    pop         esi
 0059190F    pop         ebx
 00591910    pop         ecx
 00591911    pop         ecx
 00591912    pop         ebp
 00591913    ret
*}
end;

//00591914
procedure TXMLNode.Normalize;
begin
{*
 00591914    push        ebx
 00591915    mov         ebx,eax
 00591917    mov         eax,dword ptr [ebx+20]
 0059191A    push        eax
 0059191B    mov         eax,dword ptr [eax]
 0059191D    call        dword ptr [eax+60]
 00591920    call        @CheckAutoResult
 00591925    xor         edx,edx
 00591927    mov         eax,ebx
 00591929    mov         ecx,dword ptr [eax]
 0059192B    call        dword ptr [ecx+18]
 0059192E    pop         ebx
 0059192F    ret
*}
end;

//00591930
procedure TXMLNode.CheckReadOnly;
begin
{*
 00591930    push        ebp
 00591931    mov         ebp,esp
 00591933    push        0
 00591935    xor         edx,edx
 00591937    push        ebp
 00591938    push        591974
 0059193D    push        dword ptr fs:[edx]
 00591940    mov         dword ptr fs:[edx],esp
 00591943    cmp         byte ptr [eax+31],0
>00591947    je          0059195E
 00591949    lea         edx,[ebp-4]
 0059194C    mov         eax,[0078D020];^SResString598:TResStringRec
 00591951    call        LoadResString
 00591956    mov         eax,dword ptr [ebp-4]
 00591959    call        XMLDocError
 0059195E    xor         eax,eax
 00591960    pop         edx
 00591961    pop         ecx
 00591962    pop         ecx
 00591963    mov         dword ptr fs:[eax],edx
 00591966    push        59197B
 0059196B    lea         eax,[ebp-4]
 0059196E    call        @UStrClr
 00591973    ret
>00591974    jmp         @HandleFinally
>00591979    jmp         0059196B
 0059197B    pop         ecx
 0059197C    pop         ebp
 0059197D    ret
*}
end;

//00591980
procedure TXMLNode.CheckTextNode;
begin
{*
 00591980    push        ebp
 00591981    mov         ebp,esp
 00591983    mov         ecx,6
 00591988    push        0
 0059198A    push        0
 0059198C    dec         ecx
>0059198D    jne         00591988
 0059198F    push        ebx
 00591990    mov         ebx,eax
 00591992    xor         eax,eax
 00591994    push        ebp
 00591995    push        591B1B
 0059199A    push        dword ptr fs:[eax]
 0059199D    mov         dword ptr fs:[eax],esp
 005919A0    lea         eax,[ebp-4]
 005919A3    push        eax
 005919A4    mov         eax,dword ptr [ebx+20]
 005919A7    push        eax
 005919A8    mov         eax,dword ptr [eax]
 005919AA    call        dword ptr [eax+58]
 005919AD    call        @CheckAutoResult
 005919B2    cmp         word ptr [ebp-4],0
>005919B7    jne         00591A15
 005919B9    lea         eax,[ebp-8]
 005919BC    call        @IntfClear
 005919C1    push        eax
 005919C2    lea         eax,[ebp-0C]
 005919C5    call        @IntfClear
 005919CA    push        eax
 005919CB    push        0
 005919CD    lea         eax,[ebp-10]
 005919D0    call        @IntfClear
 005919D5    push        eax
 005919D6    mov         eax,dword ptr [ebx+20]
 005919D9    push        eax
 005919DA    mov         eax,dword ptr [eax]
 005919DC    call        dword ptr [eax+38]
 005919DF    call        @CheckAutoResult
 005919E4    mov         eax,dword ptr [ebp-10]
 005919E7    push        eax
 005919E8    mov         eax,dword ptr [eax]
 005919EA    call        dword ptr [eax+80]
 005919F0    call        @CheckAutoResult
 005919F5    mov         eax,dword ptr [ebp-0C]
 005919F8    push        eax
 005919F9    mov         eax,dword ptr [ebx+20]
 005919FC    push        eax
 005919FD    mov         eax,dword ptr [eax]
 005919FF    call        dword ptr [eax+54]
 00591A02    call        @CheckAutoResult
 00591A07    xor         edx,edx
 00591A09    mov         eax,ebx
 00591A0B    mov         ecx,dword ptr [eax]
 00591A0D    call        dword ptr [ecx+18]
>00591A10    jmp         00591AD0
 00591A15    lea         eax,[ebp-14]
 00591A18    push        eax
 00591A19    lea         eax,[ebp-18]
 00591A1C    call        @IntfClear
 00591A21    push        eax
 00591A22    mov         eax,dword ptr [ebx+20]
 00591A25    push        eax
 00591A26    mov         eax,dword ptr [eax]
 00591A28    call        dword ptr [eax+20]
 00591A2B    call        @CheckAutoResult
 00591A30    mov         eax,dword ptr [ebp-18]
 00591A33    push        eax
 00591A34    mov         eax,dword ptr [eax]
 00591A36    call        dword ptr [eax+10]
 00591A39    call        @CheckAutoResult
 00591A3E    cmp         dword ptr [ebp-14],1
>00591A42    jg          00591A93
 00591A44    lea         eax,[ebp-4]
 00591A47    push        eax
 00591A48    lea         eax,[ebp-1C]
 00591A4B    call        @IntfClear
 00591A50    push        eax
 00591A51    push        0
 00591A53    lea         eax,[ebp-20]
 00591A56    call        @IntfClear
 00591A5B    push        eax
 00591A5C    mov         eax,dword ptr [ebx+20]
 00591A5F    push        eax
 00591A60    mov         eax,dword ptr [eax]
 00591A62    call        dword ptr [eax+20]
 00591A65    call        @CheckAutoResult
 00591A6A    mov         eax,dword ptr [ebp-20]
 00591A6D    push        eax
 00591A6E    mov         eax,dword ptr [eax]
 00591A70    call        dword ptr [eax+0C]
 00591A73    call        @CheckAutoResult
 00591A78    mov         eax,dword ptr [ebp-1C]
 00591A7B    push        eax
 00591A7C    mov         eax,dword ptr [eax]
 00591A7E    call        dword ptr [eax+18]
 00591A81    call        @CheckAutoResult
 00591A86    movzx       eax,word ptr [ebp-4]
 00591A8A    add         eax,0FFFFFFFD
 00591A8D    sub         ax,2
>00591A91    jb          00591AD0
 00591A93    lea         eax,[ebp-2C]
 00591A96    call        @UStrClr
 00591A9B    push        eax
 00591A9C    mov         eax,dword ptr [ebx+20]
 00591A9F    push        eax
 00591AA0    mov         eax,dword ptr [eax]
 00591AA2    call        dword ptr [eax+0C]
 00591AA5    call        @CheckAutoResult
 00591AAA    mov         eax,dword ptr [ebp-2C]
 00591AAD    mov         dword ptr [ebp-28],eax
 00591AB0    mov         byte ptr [ebp-24],11
 00591AB4    lea         eax,[ebp-28]
 00591AB7    push        eax
 00591AB8    lea         edx,[ebp-30]
 00591ABB    mov         eax,[0078D274];^SResString595:TResStringRec
 00591AC0    call        LoadResString
 00591AC5    mov         eax,dword ptr [ebp-30]
 00591AC8    xor         ecx,ecx
 00591ACA    pop         edx
 00591ACB    call        XMLDocError
 00591AD0    xor         eax,eax
 00591AD2    pop         edx
 00591AD3    pop         ecx
 00591AD4    pop         ecx
 00591AD5    mov         dword ptr fs:[eax],edx
 00591AD8    push        591B22
 00591ADD    lea         eax,[ebp-30]
 00591AE0    mov         edx,2
 00591AE5    call        @UStrArrayClr
 00591AEA    lea         eax,[ebp-20]
 00591AED    call        @IntfClear
 00591AF2    lea         eax,[ebp-1C]
 00591AF5    call        @IntfClear
 00591AFA    lea         eax,[ebp-18]
 00591AFD    call        @IntfClear
 00591B02    lea         eax,[ebp-10]
 00591B05    call        @IntfClear
 00591B0A    lea         eax,[ebp-0C]
 00591B0D    call        @IntfClear
 00591B12    lea         eax,[ebp-8]
 00591B15    call        @IntfClear
 00591B1A    ret
>00591B1B    jmp         @HandleFinally
>00591B20    jmp         00591ADD
 00591B22    pop         ebx
 00591B23    mov         esp,ebp
 00591B25    pop         ebp
 00591B26    ret
*}
end;

//00591B28
function TXMLNode.GetText:DOMString;
begin
{*
 00591B28    push        ebp
 00591B29    mov         ebp,esp
 00591B2B    push        0
 00591B2D    push        0
 00591B2F    push        ebx
 00591B30    push        esi
 00591B31    mov         esi,edx
 00591B33    mov         ebx,eax
 00591B35    xor         eax,eax
 00591B37    push        ebp
 00591B38    push        591BD1
 00591B3D    push        dword ptr fs:[eax]
 00591B40    mov         dword ptr fs:[eax],esp
 00591B43    mov         eax,ebx
 00591B45    call        TXMLNode.GetNodeType
 00591B4A    cmp         al,1
>00591B4C    jne         00591B9D
 00591B4E    mov         eax,ebx
 00591B50    call        TXMLNode.CheckTextNode
 00591B55    mov         eax,esi
 00591B57    call        @UStrClr
 00591B5C    push        eax
 00591B5D    lea         eax,[ebp-4]
 00591B60    call        @IntfClear
 00591B65    push        eax
 00591B66    push        0
 00591B68    lea         eax,[ebp-8]
 00591B6B    call        @IntfClear
 00591B70    push        eax
 00591B71    mov         eax,dword ptr [ebx+20]
 00591B74    push        eax
 00591B75    mov         eax,dword ptr [eax]
 00591B77    call        dword ptr [eax+20]
 00591B7A    call        @CheckAutoResult
 00591B7F    mov         eax,dword ptr [ebp-8]
 00591B82    push        eax
 00591B83    mov         eax,dword ptr [eax]
 00591B85    call        dword ptr [eax+0C]
 00591B88    call        @CheckAutoResult
 00591B8D    mov         eax,dword ptr [ebp-4]
 00591B90    push        eax
 00591B91    mov         eax,dword ptr [eax]
 00591B93    call        dword ptr [eax+10]
 00591B96    call        @CheckAutoResult
>00591B9B    jmp         00591BB3
 00591B9D    mov         eax,esi
 00591B9F    call        @UStrClr
 00591BA4    push        eax
 00591BA5    mov         eax,dword ptr [ebx+20]
 00591BA8    push        eax
 00591BA9    mov         eax,dword ptr [eax]
 00591BAB    call        dword ptr [eax+10]
 00591BAE    call        @CheckAutoResult
 00591BB3    xor         eax,eax
 00591BB5    pop         edx
 00591BB6    pop         ecx
 00591BB7    pop         ecx
 00591BB8    mov         dword ptr fs:[eax],edx
 00591BBB    push        591BD8
 00591BC0    lea         eax,[ebp-8]
 00591BC3    call        @IntfClear
 00591BC8    lea         eax,[ebp-4]
 00591BCB    call        @IntfClear
 00591BD0    ret
>00591BD1    jmp         @HandleFinally
>00591BD6    jmp         00591BC0
 00591BD8    pop         esi
 00591BD9    pop         ebx
 00591BDA    pop         ecx
 00591BDB    pop         ecx
 00591BDC    pop         ebp
 00591BDD    ret
*}
end;

//00591BE0
procedure TXMLNode.SetText(const Value:DOMString);
begin
{*
 00591BE0    push        ebp
 00591BE1    mov         ebp,esp
 00591BE3    push        0
 00591BE5    push        0
 00591BE7    push        ebx
 00591BE8    push        esi
 00591BE9    push        edi
 00591BEA    mov         esi,edx
 00591BEC    mov         ebx,eax
 00591BEE    xor         eax,eax
 00591BF0    push        ebp
 00591BF1    push        591C92
 00591BF6    push        dword ptr fs:[eax]
 00591BF9    mov         dword ptr fs:[eax],esp
 00591BFC    mov         cl,1
 00591BFE    xor         edx,edx
 00591C00    mov         eax,ebx
 00591C02    mov         edi,dword ptr [eax]
 00591C04    call        dword ptr [edi+10]
 00591C07    mov         eax,ebx
 00591C09    call        TXMLNode.GetNodeType
 00591C0E    cmp         al,1
>00591C10    jne         00591C5A
 00591C12    mov         eax,ebx
 00591C14    call        TXMLNode.CheckTextNode
 00591C19    push        esi
 00591C1A    lea         eax,[ebp-4]
 00591C1D    call        @IntfClear
 00591C22    push        eax
 00591C23    push        0
 00591C25    lea         eax,[ebp-8]
 00591C28    call        @IntfClear
 00591C2D    push        eax
 00591C2E    mov         eax,dword ptr [ebx+20]
 00591C31    push        eax
 00591C32    mov         eax,dword ptr [eax]
 00591C34    call        dword ptr [eax+20]
 00591C37    call        @CheckAutoResult
 00591C3C    mov         eax,dword ptr [ebp-8]
 00591C3F    push        eax
 00591C40    mov         eax,dword ptr [eax]
 00591C42    call        dword ptr [eax+0C]
 00591C45    call        @CheckAutoResult
 00591C4A    mov         eax,dword ptr [ebp-4]
 00591C4D    push        eax
 00591C4E    mov         eax,dword ptr [eax]
 00591C50    call        dword ptr [eax+14]
 00591C53    call        @CheckAutoResult
>00591C58    jmp         00591C69
 00591C5A    push        esi
 00591C5B    mov         eax,dword ptr [ebx+20]
 00591C5E    push        eax
 00591C5F    mov         eax,dword ptr [eax]
 00591C61    call        dword ptr [eax+14]
 00591C64    call        @CheckAutoResult
 00591C69    xor         ecx,ecx
 00591C6B    xor         edx,edx
 00591C6D    mov         eax,ebx
 00591C6F    mov         ebx,dword ptr [eax]
 00591C71    call        dword ptr [ebx+10]
 00591C74    xor         eax,eax
 00591C76    pop         edx
 00591C77    pop         ecx
 00591C78    pop         ecx
 00591C79    mov         dword ptr fs:[eax],edx
 00591C7C    push        591C99
 00591C81    lea         eax,[ebp-8]
 00591C84    call        @IntfClear
 00591C89    lea         eax,[ebp-4]
 00591C8C    call        @IntfClear
 00591C91    ret
>00591C92    jmp         @HandleFinally
>00591C97    jmp         00591C81
 00591C99    pop         edi
 00591C9A    pop         esi
 00591C9B    pop         ebx
 00591C9C    pop         ecx
 00591C9D    pop         ecx
 00591C9E    pop         ebp
 00591C9F    ret
*}
end;

//00591CA0
function TXMLNode.GetNodeValue:OleVariant;
begin
{*
 00591CA0    push        ebp
 00591CA1    mov         ebp,esp
 00591CA3    mov         ecx,4
 00591CA8    push        0
 00591CAA    push        0
 00591CAC    dec         ecx
>00591CAD    jne         00591CA8
 00591CAF    push        ecx
 00591CB0    push        ebx
 00591CB1    push        esi
 00591CB2    mov         ebx,edx
 00591CB4    mov         esi,eax
 00591CB6    xor         eax,eax
 00591CB8    push        ebp
 00591CB9    push        591D26
 00591CBE    push        dword ptr fs:[eax]
 00591CC1    mov         dword ptr fs:[eax],esp
 00591CC4    lea         edx,[ebp-4]
 00591CC7    mov         eax,esi
 00591CC9    call        TXMLNode.GetText
 00591CCE    mov         edx,dword ptr [ebp-4]
 00591CD1    mov         eax,ebx
 00591CD3    call        @OleVarFromUStr
 00591CD8    lea         eax,[ebp-14]
 00591CDB    xor         edx,edx
 00591CDD    call        @OleVarFromUStr
 00591CE2    lea         edx,[ebp-14]
 00591CE5    mov         eax,ebx
 00591CE7    call        @VarCmpEQ
>00591CEC    jne         00591D00
 00591CEE    lea         eax,[ebp-24]
 00591CF1    call        Null
 00591CF6    lea         edx,[ebp-24]
 00591CF9    mov         eax,ebx
 00591CFB    call        @OleVarFromVar
 00591D00    xor         eax,eax
 00591D02    pop         edx
 00591D03    pop         ecx
 00591D04    pop         ecx
 00591D05    mov         dword ptr fs:[eax],edx
 00591D08    push        591D2D
 00591D0D    lea         eax,[ebp-24]
 00591D10    call        @VarClr
 00591D15    lea         eax,[ebp-14]
 00591D18    call        @VarClr
 00591D1D    lea         eax,[ebp-4]
 00591D20    call        @UStrClr
 00591D25    ret
>00591D26    jmp         @HandleFinally
>00591D2B    jmp         00591D0D
 00591D2D    pop         esi
 00591D2E    pop         ebx
 00591D2F    mov         esp,ebp
 00591D31    pop         ebp
 00591D32    ret
*}
end;

//00591D34
procedure TXMLNode.SetNodeValue(const Value:OleVariant);
begin
{*
 00591D34    push        ebp
 00591D35    mov         ebp,esp
 00591D37    push        0
 00591D39    push        0
 00591D3B    push        ebx
 00591D3C    push        esi
 00591D3D    mov         esi,edx
 00591D3F    mov         ebx,eax
 00591D41    xor         eax,eax
 00591D43    push        ebp
 00591D44    push        591DBE
 00591D49    push        dword ptr fs:[eax]
 00591D4C    mov         dword ptr fs:[eax],esp
 00591D4F    cmp         byte ptr ds:[789B64],0
>00591D56    je          00591D61
 00591D58    cmp         word ptr [esi],0B
 00591D5C    sete        al
>00591D5F    jmp         00591D63
 00591D61    xor         eax,eax
 00591D63    test        al,al
>00591D65    je          00591D81
 00591D67    mov         eax,esi
 00591D69    call        @VarToBool
 00591D6E    and         eax,7F
 00591D71    mov         edx,dword ptr [eax*4+789B70];^'false'
 00591D78    mov         eax,ebx
 00591D7A    call        TXMLNode.SetText
>00591D7F    jmp         00591DA0
 00591D81    lea         edx,[ebp-8]
 00591D84    mov         eax,esi
 00591D86    call        VarToWideStr
 00591D8B    mov         edx,dword ptr [ebp-8]
 00591D8E    lea         eax,[ebp-4]
 00591D91    call        @UStrFromWStr
 00591D96    mov         edx,dword ptr [ebp-4]
 00591D99    mov         eax,ebx
 00591D9B    call        TXMLNode.SetText
 00591DA0    xor         eax,eax
 00591DA2    pop         edx
 00591DA3    pop         ecx
 00591DA4    pop         ecx
 00591DA5    mov         dword ptr fs:[eax],edx
 00591DA8    push        591DC5
 00591DAD    lea         eax,[ebp-8]
 00591DB0    call        @WStrClr
 00591DB5    lea         eax,[ebp-4]
 00591DB8    call        @UStrClr
 00591DBD    ret
>00591DBE    jmp         @HandleFinally
>00591DC3    jmp         00591DAD
 00591DC5    pop         esi
 00591DC6    pop         ebx
 00591DC7    pop         ecx
 00591DC8    pop         ecx
 00591DC9    pop         ebp
 00591DCA    ret
*}
end;

//00591DCC
function TXMLNode.GetChildValue(const IndexOrName:OleVariant):OleVariant;
begin
{*
 00591DCC    push        ebp
 00591DCD    mov         ebp,esp
 00591DCF    push        0
 00591DD1    push        0
 00591DD3    push        0
 00591DD5    push        0
 00591DD7    push        0
 00591DD9    push        0
 00591DDB    push        0
 00591DDD    push        0
 00591DDF    push        ebx
 00591DE0    push        esi
 00591DE1    mov         esi,ecx
 00591DE3    mov         dword ptr [ebp-8],edx
 00591DE6    mov         ebx,eax
 00591DE8    xor         eax,eax
 00591DEA    push        ebp
 00591DEB    push        591E6D
 00591DF0    push        dword ptr fs:[eax]
 00591DF3    mov         dword ptr fs:[eax],esp
 00591DF6    lea         edx,[ebp-0C]
 00591DF9    mov         eax,ebx
 00591DFB    call        TXMLNode.GetChildNodes
 00591E00    mov         eax,dword ptr [ebp-0C]
 00591E03    push        eax
 00591E04    lea         eax,[ebp-10]
 00591E07    mov         edx,dword ptr [ebp-8]
 00591E0A    call        @VarToUStr
 00591E0F    mov         edx,dword ptr [ebp-10]
 00591E12    lea         ecx,[ebp-4]
 00591E15    pop         eax
 00591E16    mov         ebx,dword ptr [eax]
 00591E18    call        dword ptr [ebx+38]
 00591E1B    cmp         dword ptr [ebp-4],0
>00591E1F    je          00591E2D
 00591E21    mov         edx,esi
 00591E23    mov         eax,dword ptr [ebp-4]
 00591E26    mov         ecx,dword ptr [eax]
 00591E28    call        dword ptr [ecx+3C]
>00591E2B    jmp         00591E3F
 00591E2D    lea         eax,[ebp-20]
 00591E30    call        Null
 00591E35    lea         edx,[ebp-20]
 00591E38    mov         eax,esi
 00591E3A    call        @OleVarFromVar
 00591E3F    xor         eax,eax
 00591E41    pop         edx
 00591E42    pop         ecx
 00591E43    pop         ecx
 00591E44    mov         dword ptr fs:[eax],edx
 00591E47    push        591E74
 00591E4C    lea         eax,[ebp-20]
 00591E4F    call        @VarClr
 00591E54    lea         eax,[ebp-10]
 00591E57    call        @UStrClr
 00591E5C    lea         eax,[ebp-0C]
 00591E5F    call        @IntfClear
 00591E64    lea         eax,[ebp-4]
 00591E67    call        @IntfClear
 00591E6C    ret
>00591E6D    jmp         @HandleFinally
>00591E72    jmp         00591E4C
 00591E74    pop         esi
 00591E75    pop         ebx
 00591E76    mov         esp,ebp
 00591E78    pop         ebp
 00591E79    ret
*}
end;

//00591E7C
procedure TXMLNode.SetChildValue(const IndexOrName:OleVariant; const Value:OleVariant);
begin
{*
 00591E7C    push        ebp
 00591E7D    mov         ebp,esp
 00591E7F    push        0
 00591E81    push        0
 00591E83    push        0
 00591E85    push        ebx
 00591E86    push        esi
 00591E87    mov         dword ptr [ebp-4],ecx
 00591E8A    mov         esi,edx
 00591E8C    mov         ebx,eax
 00591E8E    xor         eax,eax
 00591E90    push        ebp
 00591E91    push        591EDC
 00591E96    push        dword ptr fs:[eax]
 00591E99    mov         dword ptr fs:[eax],esp
 00591E9C    lea         edx,[ebp-0C]
 00591E9F    mov         eax,ebx
 00591EA1    call        TXMLNode.GetChildNodes
 00591EA6    mov         eax,dword ptr [ebp-0C]
 00591EA9    lea         ecx,[ebp-8]
 00591EAC    mov         edx,esi
 00591EAE    mov         ebx,dword ptr [eax]
 00591EB0    call        dword ptr [ebx+10]
 00591EB3    mov         eax,dword ptr [ebp-8]
 00591EB6    mov         edx,dword ptr [ebp-4]
 00591EB9    mov         ecx,dword ptr [eax]
 00591EBB    call        dword ptr [ecx+60]
 00591EBE    xor         eax,eax
 00591EC0    pop         edx
 00591EC1    pop         ecx
 00591EC2    pop         ecx
 00591EC3    mov         dword ptr fs:[eax],edx
 00591EC6    push        591EE3
 00591ECB    lea         eax,[ebp-0C]
 00591ECE    call        @IntfClear
 00591ED3    lea         eax,[ebp-8]
 00591ED6    call        @IntfClear
 00591EDB    ret
>00591EDC    jmp         @HandleFinally
>00591EE1    jmp         00591ECB
 00591EE3    pop         esi
 00591EE4    pop         ebx
 00591EE5    mov         esp,ebp
 00591EE7    pop         ebp
 00591EE8    ret
*}
end;

//00591EEC
function TXMLNode.GetXML:DOMString;
begin
{*
 00591EEC    push        ebp
 00591EED    mov         ebp,esp
 00591EEF    push        0
 00591EF1    push        ebx
 00591EF2    push        esi
 00591EF3    mov         esi,edx
 00591EF5    mov         ebx,eax
 00591EF7    xor         eax,eax
 00591EF9    push        ebp
 00591EFA    push        591F3C
 00591EFF    push        dword ptr fs:[eax]
 00591F02    mov         dword ptr fs:[eax],esp
 00591F05    mov         eax,esi
 00591F07    call        @UStrClr
 00591F0C    push        eax
 00591F0D    lea         edx,[ebp-4]
 00591F10    mov         eax,dword ptr [ebx+20]
 00591F13    call        GetDOMNodeEx
 00591F18    mov         eax,dword ptr [ebp-4]
 00591F1B    push        eax
 00591F1C    mov         eax,dword ptr [eax]
 00591F1E    call        dword ptr [eax+6C]
 00591F21    call        @CheckAutoResult
 00591F26    xor         eax,eax
 00591F28    pop         edx
 00591F29    pop         ecx
 00591F2A    pop         ecx
 00591F2B    mov         dword ptr fs:[eax],edx
 00591F2E    push        591F43
 00591F33    lea         eax,[ebp-4]
 00591F36    call        @IntfClear
 00591F3B    ret
>00591F3C    jmp         @HandleFinally
>00591F41    jmp         00591F33
 00591F43    pop         esi
 00591F44    pop         ebx
 00591F45    pop         ecx
 00591F46    pop         ebp
 00591F47    ret
*}
end;

//00591F48
function TXMLNode.GetDOMNode:IDOMNode;
begin
{*
 00591F48    push        ebx
 00591F49    push        esi
 00591F4A    mov         esi,edx
 00591F4C    mov         ebx,eax
 00591F4E    mov         eax,esi
 00591F50    mov         edx,dword ptr [ebx+20]
 00591F53    call        @IntfCopy
 00591F58    pop         esi
 00591F59    pop         ebx
 00591F5A    ret
*}
end;

//00591F5C
function TXMLNode.DOMElement:IDOMElement;
begin
{*
 00591F5C    push        ebp
 00591F5D    mov         ebp,esp
 00591F5F    push        0
 00591F61    push        ebx
 00591F62    push        esi
 00591F63    mov         esi,edx
 00591F65    mov         ebx,eax
 00591F67    xor         eax,eax
 00591F69    push        ebp
 00591F6A    push        591FBA
 00591F6F    push        dword ptr fs:[eax]
 00591F72    mov         dword ptr fs:[eax],esp
 00591F75    mov         eax,ebx
 00591F77    call        TXMLNode.GetNodeType
 00591F7C    cmp         al,1
>00591F7E    je          00591F95
 00591F80    lea         edx,[ebp-4]
 00591F83    mov         eax,[0078DB14];^SResString592:TResStringRec
 00591F88    call        LoadResString
 00591F8D    mov         eax,dword ptr [ebp-4]
 00591F90    call        XMLDocError
 00591F95    mov         eax,esi
 00591F97    mov         edx,dword ptr [ebx+20]
 00591F9A    mov         ecx,591FC8
 00591F9F    call        @IntfCast
 00591FA4    xor         eax,eax
 00591FA6    pop         edx
 00591FA7    pop         ecx
 00591FA8    pop         ecx
 00591FA9    mov         dword ptr fs:[eax],edx
 00591FAC    push        591FC1
 00591FB1    lea         eax,[ebp-4]
 00591FB4    call        @UStrClr
 00591FB9    ret
>00591FBA    jmp         @HandleFinally
>00591FBF    jmp         00591FB1
 00591FC1    pop         esi
 00591FC2    pop         ebx
 00591FC3    pop         ecx
 00591FC4    pop         ebp
 00591FC5    ret
*}
end;

//00591FD8
function TXMLNode.GetNodeType:TNodeType;
begin
{*
 00591FD8    push        ebx
 00591FD9    push        ecx
 00591FDA    mov         ebx,eax
 00591FDC    push        esp
 00591FDD    mov         eax,dword ptr [ebx+20]
 00591FE0    push        eax
 00591FE1    mov         eax,dword ptr [eax]
 00591FE3    call        dword ptr [eax+18]
 00591FE6    call        @CheckAutoResult
 00591FEB    movzx       eax,word ptr [esp]
 00591FEF    pop         edx
 00591FF0    pop         ebx
 00591FF1    ret
*}
end;

//00591FF4
function TXMLNode.GetLocalName:DOMString;
begin
{*
 00591FF4    push        ebx
 00591FF5    push        esi
 00591FF6    mov         esi,edx
 00591FF8    mov         ebx,eax
 00591FFA    mov         eax,esi
 00591FFC    call        @UStrClr
 00592001    push        eax
 00592002    mov         eax,dword ptr [ebx+20]
 00592005    push        eax
 00592006    mov         eax,dword ptr [eax]
 00592008    call        dword ptr [eax+44]
 0059200B    call        @CheckAutoResult
 00592010    pop         esi
 00592011    pop         ebx
 00592012    ret
*}
end;

//00592014
function TXMLNode.GetNamespaceURI:DOMString;
begin
{*
 00592014    push        ebx
 00592015    push        esi
 00592016    mov         esi,edx
 00592018    mov         ebx,eax
 0059201A    mov         eax,esi
 0059201C    call        @UStrClr
 00592021    push        eax
 00592022    mov         eax,dword ptr [ebx+20]
 00592025    push        eax
 00592026    mov         eax,dword ptr [eax]
 00592028    call        dword ptr [eax+3C]
 0059202B    call        @CheckAutoResult
 00592030    pop         esi
 00592031    pop         ebx
 00592032    ret
*}
end;

//00592034
function TXMLNode.GetNodeName:DOMString;
begin
{*
 00592034    push        ebx
 00592035    push        esi
 00592036    mov         esi,edx
 00592038    mov         ebx,eax
 0059203A    mov         eax,esi
 0059203C    call        @UStrClr
 00592041    push        eax
 00592042    mov         eax,dword ptr [ebx+20]
 00592045    push        eax
 00592046    mov         eax,dword ptr [eax]
 00592048    call        dword ptr [eax+0C]
 0059204B    call        @CheckAutoResult
 00592050    pop         esi
 00592051    pop         ebx
 00592052    ret
*}
end;

//00592054
function TXMLNode.GetPrefix:DOMString;
begin
{*
 00592054    push        ebx
 00592055    push        esi
 00592056    mov         esi,edx
 00592058    mov         ebx,eax
 0059205A    mov         eax,esi
 0059205C    call        @UStrClr
 00592061    push        eax
 00592062    mov         eax,dword ptr [ebx+20]
 00592065    push        eax
 00592066    mov         eax,dword ptr [eax]
 00592068    call        dword ptr [eax+40]
 0059206B    call        @CheckAutoResult
 00592070    pop         esi
 00592071    pop         ebx
 00592072    ret
*}
end;

//00592074
function TXMLNode.GetIsTextElement:Boolean;
begin
{*
 00592074    push        ebp
 00592075    mov         ebp,esp
 00592077    xor         ecx,ecx
 00592079    push        ecx
 0059207A    push        ecx
 0059207B    push        ecx
 0059207C    push        ecx
 0059207D    push        ecx
 0059207E    push        ebx
 0059207F    mov         ebx,eax
 00592081    xor         eax,eax
 00592083    push        ebp
 00592084    push        592140
 00592089    push        dword ptr fs:[eax]
 0059208C    mov         dword ptr fs:[eax],esp
 0059208F    mov         eax,ebx
 00592091    call        TXMLNode.GetNodeType
 00592096    cmp         al,1
>00592098    jne         00592112
 0059209A    lea         eax,[ebp-4]
 0059209D    push        eax
 0059209E    lea         eax,[ebp-8]
 005920A1    call        @IntfClear
 005920A6    push        eax
 005920A7    mov         eax,dword ptr [ebx+20]
 005920AA    push        eax
 005920AB    mov         eax,dword ptr [eax]
 005920AD    call        dword ptr [eax+20]
 005920B0    call        @CheckAutoResult
 005920B5    mov         eax,dword ptr [ebp-8]
 005920B8    push        eax
 005920B9    mov         eax,dword ptr [eax]
 005920BB    call        dword ptr [eax+10]
 005920BE    call        @CheckAutoResult
 005920C3    cmp         dword ptr [ebp-4],1
>005920C7    jne         00592112
 005920C9    lea         eax,[ebp-0C]
 005920CC    push        eax
 005920CD    lea         eax,[ebp-10]
 005920D0    call        @IntfClear
 005920D5    push        eax
 005920D6    push        0
 005920D8    lea         eax,[ebp-14]
 005920DB    call        @IntfClear
 005920E0    push        eax
 005920E1    mov         eax,dword ptr [ebx+20]
 005920E4    push        eax
 005920E5    mov         eax,dword ptr [eax]
 005920E7    call        dword ptr [eax+20]
 005920EA    call        @CheckAutoResult
 005920EF    mov         eax,dword ptr [ebp-14]
 005920F2    push        eax
 005920F3    mov         eax,dword ptr [eax]
 005920F5    call        dword ptr [eax+0C]
 005920F8    call        @CheckAutoResult
 005920FD    mov         eax,dword ptr [ebp-10]
 00592100    push        eax
 00592101    mov         eax,dword ptr [eax]
 00592103    call        dword ptr [eax+18]
 00592106    call        @CheckAutoResult
 0059210B    cmp         word ptr [ebp-0C],3
>00592110    je          00592116
 00592112    xor         eax,eax
>00592114    jmp         00592118
 00592116    mov         al,1
 00592118    mov         ebx,eax
 0059211A    xor         eax,eax
 0059211C    pop         edx
 0059211D    pop         ecx
 0059211E    pop         ecx
 0059211F    mov         dword ptr fs:[eax],edx
 00592122    push        592147
 00592127    lea         eax,[ebp-14]
 0059212A    call        @IntfClear
 0059212F    lea         eax,[ebp-10]
 00592132    call        @IntfClear
 00592137    lea         eax,[ebp-8]
 0059213A    call        @IntfClear
 0059213F    ret
>00592140    jmp         @HandleFinally
>00592145    jmp         00592127
 00592147    mov         eax,ebx
 00592149    pop         ebx
 0059214A    mov         esp,ebp
 0059214C    pop         ebp
 0059214D    ret
*}
end;

//00592150
function TXMLNode.GetOwnerDocument:IXMLDocument;
begin
{*
 00592150    push        ebx
 00592151    push        esi
 00592152    push        edi
 00592153    mov         edi,edx
 00592155    mov         ebx,eax
 00592157    mov         esi,dword ptr [ebx+1C]
 0059215A    test        esi,esi
>0059215C    je          00592173
 0059215E    mov         eax,edi
 00592160    call        @IntfClear
 00592165    mov         ecx,eax
 00592167    mov         edx,592178
 0059216C    mov         eax,esi
 0059216E    call        TObject.GetInterface
 00592173    pop         edi
 00592174    pop         esi
 00592175    pop         ebx
 00592176    ret
*}
end;

//00592188
function TXMLNode.GetCollection:IXMLNodeCollection;
begin
{*
 00592188    push        ebx
 00592189    push        esi
 0059218A    mov         esi,edx
 0059218C    mov         ebx,eax
 0059218E    mov         eax,esi
 00592190    mov         edx,dword ptr [ebx+18]
 00592193    test        edx,edx
>00592195    je          0059219A
 00592197    sub         edx,0FFFFFF94
 0059219A    call        @IntfCopy
 0059219F    pop         esi
 005921A0    pop         ebx
 005921A1    ret
*}
end;

//005921A4
function TXMLNode.GetParentNode:IXMLNode;
begin
{*
 005921A4    push        ebx
 005921A5    push        esi
 005921A6    mov         esi,edx
 005921A8    mov         ebx,eax
 005921AA    mov         eax,esi
 005921AC    mov         edx,dword ptr [ebx+28]
 005921AF    test        edx,edx
>005921B1    je          005921B6
 005921B3    sub         edx,0FFFFFFB8
 005921B6    call        @IntfCopy
 005921BB    pop         esi
 005921BC    pop         ebx
 005921BD    ret
*}
end;

//005921C0
function TXMLNode.GetChildNodeClasses:TNodeClassArray;
begin
{*
 005921C0    push        ebx
 005921C1    push        esi
 005921C2    push        edi
 005921C3    mov         esi,edx
 005921C5    mov         ebx,eax
 005921C7    mov         edi,dword ptr [ebx+24]
 005921CA    test        edi,edi
>005921CC    je          005921D9
 005921CE    mov         edx,esi
 005921D0    mov         eax,edi
 005921D2    call        TXMLNode.GetChildNodeClasses
>005921D7    jmp         005921E9
 005921D9    mov         eax,esi
 005921DB    mov         edx,dword ptr [ebx+14]
 005921DE    mov         ecx,dword ptr ds:[58BC00];TNodeClassArray
 005921E4    call        @DynArrayAsg
 005921E9    pop         edi
 005921EA    pop         esi
 005921EB    pop         ebx
 005921EC    ret
*}
end;

//005921F0
{*function sub_005921F0(?:?):?;
begin
 005921F0    mov         eax,dword ptr [eax+24]
 005921F3    ret
end;*}

//005921F4
procedure sub_005921F4;
begin
{*
 005921F4    ret
*}
end;

//005921F8
{*procedure sub_005921F8(?:?; ?:?);
begin
 005921F8    mov         dword ptr [eax+18],edx
 005921FB    ret
end;*}

//005921FC
procedure TXMLNode.SetParentNode(const Value:TXMLNode);
begin
{*
 005921FC    push        ebx
 005921FD    push        esi
 005921FE    push        edi
 005921FF    mov         esi,edx
 00592201    mov         ebx,eax
 00592203    mov         dword ptr [ebx+28],esi
 00592206    test        esi,esi
>00592208    je          00592236
 0059220A    mov         eax,dword ptr [ebx+1C]
 0059220D    cmp         eax,dword ptr [esi+1C]
>00592210    je          00592236
 00592212    mov         edi,dword ptr [ebx+4]
>00592215    jmp         0059221D
 00592217    push        ebx
 00592218    call        TXMLNode._Release
 0059221D    cmp         dword ptr [ebx+4],1
>00592221    jg          00592217
 00592223    mov         eax,dword ptr [esi+1C]
 00592226    mov         dword ptr [ebx+1C],eax
>00592229    jmp         00592231
 0059222B    push        ebx
 0059222C    call        TXMLNode._AddRef
 00592231    cmp         edi,dword ptr [ebx+4]
>00592234    jg          0059222B
 00592236    pop         edi
 00592237    pop         esi
 00592238    pop         ebx
 00592239    ret
*}
end;

//0059223C
{*function sub_0059223C(?:?):?;
begin
 0059223C    movzx       eax,byte ptr [eax+31]
 00592240    ret
end;*}

//00592244
{*procedure sub_00592244(?:?; ?:?);
begin
 00592244    mov         byte ptr [eax+31],dl
 00592247    ret
end;*}

//00592248
procedure TXMLNode.DoNodeChange(ChangeType:TNodeChange; BeforeOperation:Boolean);
begin
{*
 00592248    push        ebx
 00592249    push        esi
 0059224A    mov         ebx,ecx
 0059224C    mov         esi,eax
 0059224E    mov         eax,dword ptr [esi+1C]
 00592251    test        eax,eax
>00592253    je          00592266
 00592255    push        ebx
 00592256    mov         ecx,esi
 00592258    test        ecx,ecx
>0059225A    je          0059225F
 0059225C    sub         ecx,0FFFFFFB8
 0059225F    xchg        ecx,edx
 00592261    call        TXMLDocument.DoNodeChange
 00592266    test        bl,bl
>00592268    je          00592271
 0059226A    mov         eax,esi
 0059226C    call        TXMLNode.CheckReadOnly
 00592271    pop         esi
 00592272    pop         ebx
 00592273    ret
*}
end;

//00592274
procedure TXMLNode.RegisterChildNodes(const TagNames:array[$0..-$1] of xmldom.DOMString; const _Dv_:$0..-$1; const NodeClasses:array[$0..-$1] of TXMLNodeClass; const _Dv_:$0..-$1);
begin
{*
 00592274    push        ebp
 00592275    mov         ebp,esp
 00592277    add         esp,0FFFFFFF0
 0059227A    push        ebx
 0059227B    push        esi
 0059227C    push        edi
 0059227D    xor         ebx,ebx
 0059227F    mov         dword ptr [ebp-10],ebx
 00592282    mov         dword ptr [ebp-0C],ebx
 00592285    mov         ebx,ecx
 00592287    mov         dword ptr [ebp-8],edx
 0059228A    mov         dword ptr [ebp-4],eax
 0059228D    xor         eax,eax
 0059228F    push        ebp
 00592290    push        592305
 00592295    push        dword ptr fs:[eax]
 00592298    mov         dword ptr fs:[eax],esp
 0059229B    mov         esi,ebx
 0059229D    mov         eax,dword ptr [ebp+8]
 005922A0    cmp         esi,eax
>005922A2    je          005922B9
 005922A4    lea         edx,[ebp-0C]
 005922A7    mov         eax,[0078D31C];^SResString594:TResStringRec
 005922AC    call        LoadResString
 005922B1    mov         eax,dword ptr [ebp-0C]
 005922B4    call        XMLDocError
 005922B9    mov         edi,esi
 005922BB    test        edi,edi
>005922BD    jl          005922EA
 005922BF    inc         edi
 005922C0    mov         ebx,dword ptr [ebp-8]
 005922C3    mov         esi,dword ptr [ebp+0C]
 005922C6    lea         edx,[ebp-10]
 005922C9    mov         eax,dword ptr [ebp-4]
 005922CC    call        TXMLNode.GetNamespaceURI
 005922D1    mov         eax,dword ptr [ebp-10]
 005922D4    push        eax
 005922D5    mov         ecx,dword ptr [esi]
 005922D7    mov         edx,dword ptr [ebx]
 005922D9    mov         eax,dword ptr [ebp-4]
 005922DC    call        TXMLNode.RegisterChildNode
 005922E1    add         esi,4
 005922E4    add         ebx,4
 005922E7    dec         edi
>005922E8    jne         005922C6
 005922EA    xor         eax,eax
 005922EC    pop         edx
 005922ED    pop         ecx
 005922EE    pop         ecx
 005922EF    mov         dword ptr fs:[eax],edx
 005922F2    push        59230C
 005922F7    lea         eax,[ebp-10]
 005922FA    mov         edx,2
 005922FF    call        @UStrArrayClr
 00592304    ret
>00592305    jmp         @HandleFinally
>0059230A    jmp         005922F7
 0059230C    pop         edi
 0059230D    pop         esi
 0059230E    pop         ebx
 0059230F    mov         esp,ebp
 00592311    pop         ebp
 00592312    ret         8
*}
end;

//00592318
procedure TXMLNodeCollection.AfterConstruction;
begin
{*
 00592318    push        ebp
 00592319    mov         ebp,esp
 0059231B    push        0
 0059231D    push        ebx
 0059231E    mov         ebx,eax
 00592320    xor         eax,eax
 00592322    push        ebp
 00592323    push        59236A
 00592328    push        dword ptr fs:[eax]
 0059232B    mov         dword ptr fs:[eax],esp
 0059232E    mov         dword ptr [ebx+3C],ebx
 00592331    mov         dword ptr [ebx+38],592AB0;TXMLNodeCollection.UpdateCollectionList
 00592338    lea         edx,[ebp-4]
 0059233B    mov         eax,ebx
 0059233D    call        TXMLNode.GetNamespaceURI
 00592342    mov         edx,dword ptr [ebp-4]
 00592345    lea         eax,[ebx+60]
 00592348    call        @UStrAsg
 0059234D    mov         eax,ebx
 0059234F    call        TInterfacedObject.AfterConstruction
 00592354    xor         eax,eax
 00592356    pop         edx
 00592357    pop         ecx
 00592358    pop         ecx
 00592359    mov         dword ptr fs:[eax],edx
 0059235C    push        592371
 00592361    lea         eax,[ebp-4]
 00592364    call        @UStrClr
 00592369    ret
>0059236A    jmp         @HandleFinally
>0059236F    jmp         00592361
 00592371    pop         ebx
 00592372    pop         ecx
 00592373    pop         ebp
 00592374    ret
*}
end;

//00592378
function TXMLNodeCollection.GetList:IXMLNodeList;
begin
{*
 00592378    push        ebp
 00592379    mov         ebp,esp
 0059237B    push        0
 0059237D    push        ebx
 0059237E    push        esi
 0059237F    mov         esi,edx
 00592381    mov         ebx,eax
 00592383    xor         eax,eax
 00592385    push        ebp
 00592386    push        5923DB
 0059238B    push        dword ptr fs:[eax]
 0059238E    mov         dword ptr fs:[eax],esp
 00592391    cmp         dword ptr [ebx+68],0
>00592395    jne         005923A1
 00592397    lea         edx,[ebp-4]
 0059239A    mov         eax,ebx
 0059239C    call        TXMLNode.GetChildNodes
 005923A1    cmp         dword ptr [ebx+68],0
>005923A5    jne         005923BB
 005923A7    mov         ecx,85B
 005923AC    mov         edx,5923F4;'C:\Builds\TP\xml\XMLDoc.pas'
 005923B1    mov         eax,592438;'Assertion failure'
 005923B6    call        @Assert
 005923BB    mov         eax,esi
 005923BD    mov         edx,dword ptr [ebx+68]
 005923C0    call        @IntfCopy
 005923C5    xor         eax,eax
 005923C7    pop         edx
 005923C8    pop         ecx
 005923C9    pop         ecx
 005923CA    mov         dword ptr fs:[eax],edx
 005923CD    push        5923E2
 005923D2    lea         eax,[ebp-4]
 005923D5    call        @IntfClear
 005923DA    ret
>005923DB    jmp         @HandleFinally
>005923E0    jmp         005923D2
 005923E2    pop         esi
 005923E3    pop         ebx
 005923E4    pop         ecx
 005923E5    pop         ebp
 005923E6    ret
*}
end;

//0059245C
procedure TXMLNodeCollection.SetChildNodes(const Value:IXMLNodeList);
begin
{*
 0059245C    push        ebx
 0059245D    push        esi
 0059245E    mov         esi,edx
 00592460    mov         ebx,eax
 00592462    mov         edx,esi
 00592464    mov         eax,ebx
 00592466    call        TXMLNode.SetChildNodes
 0059246B    lea         eax,[ebx+68]
 0059246E    mov         edx,esi
 00592470    call        @IntfCopy
 00592475    mov         dl,1
 00592477    mov         eax,ebx
 00592479    call        TXMLNodeCollection.CreateItemList
 0059247E    pop         esi
 0059247F    pop         ebx
 00592480    ret
*}
end;

//00592484
procedure TXMLNodeCollection.CreateItemList(CheckFirst:Boolean);
begin
{*
 00592484    push        ebp
 00592485    mov         ebp,esp
 00592487    mov         ecx,12
 0059248C    push        0
 0059248E    push        0
 00592490    dec         ecx
>00592491    jne         0059248C
 00592493    push        ecx
 00592494    push        ebx
 00592495    push        esi
 00592496    push        edi
 00592497    mov         ebx,eax
 00592499    xor         eax,eax
 0059249B    push        ebp
 0059249C    push        592722
 005924A1    push        dword ptr fs:[eax]
 005924A4    mov         dword ptr fs:[eax],esp
 005924A7    test        dl,dl
>005924A9    je          00592565
 005924AF    mov         byte ptr [ebp-1],0
 005924B3    lea         edx,[ebp-10]
 005924B6    mov         eax,ebx
 005924B8    call        TXMLNode.GetChildNodes
 005924BD    mov         eax,dword ptr [ebp-10]
 005924C0    mov         edx,dword ptr [eax]
 005924C2    call        dword ptr [edx+0C]
 005924C5    dec         eax
 005924C6    test        eax,eax
>005924C8    jl          0059255B
 005924CE    inc         eax
 005924CF    mov         dword ptr [ebp-0C],eax
 005924D2    xor         esi,esi
 005924D4    lea         edx,[ebp-18]
 005924D7    mov         eax,ebx
 005924D9    call        TXMLNode.GetChildNodes
 005924DE    mov         eax,dword ptr [ebp-18]
 005924E1    push        eax
 005924E2    lea         eax,[ebp-28]
 005924E5    mov         edx,esi
 005924E7    mov         cl,0FC
 005924E9    call        @OleVarFromInt
 005924EE    lea         edx,[ebp-28]
 005924F1    lea         ecx,[ebp-14]
 005924F4    pop         eax
 005924F5    mov         edi,dword ptr [eax]
 005924F7    call        dword ptr [edi+10]
 005924FA    mov         edx,dword ptr [ebp-14]
 005924FD    mov         eax,ebx
 005924FF    call        TXMLNodeCollection.IsCollectionItem
 00592504    test        al,al
>00592506    jne         0059250E
 00592508    mov         byte ptr [ebp-1],1
>0059250C    jmp         0059255B
 0059250E    lea         edx,[ebp-34]
 00592511    mov         eax,ebx
 00592513    call        TXMLNode.GetChildNodes
 00592518    mov         eax,dword ptr [ebp-34]
 0059251B    push        eax
 0059251C    lea         eax,[ebp-44]
 0059251F    mov         edx,esi
 00592521    mov         cl,0FC
 00592523    call        @OleVarFromInt
 00592528    lea         edx,[ebp-44]
 0059252B    lea         ecx,[ebp-30]
 0059252E    pop         eax
 0059252F    mov         edi,dword ptr [eax]
 00592531    call        dword ptr [edi+10]
 00592534    mov         edx,dword ptr [ebp-30]
 00592537    lea         eax,[ebp-2C]
 0059253A    mov         ecx,592734
 0059253F    call        @IntfCast
 00592544    mov         eax,dword ptr [ebp-2C]
 00592547    mov         edx,ebx
 00592549    mov         ecx,dword ptr [eax]
 0059254B    call        dword ptr [ecx+0F0]
 00592551    inc         esi
 00592552    dec         dword ptr [ebp-0C]
>00592555    jne         005924D4
 0059255B    cmp         byte ptr [ebp-1],0
>0059255F    je          00592676
 00592565    mov         eax,dword ptr [ebx+60]
 00592568    push        eax
 00592569    push        0
 0059256B    push        0
 0059256D    mov         ecx,ebx
 0059256F    mov         dl,1
 00592571    mov         eax,[0058B96C];TXMLNodeList
 00592576    call        TXMLNodeList.Create
 0059257B    mov         dword ptr [ebp-8],eax
 0059257E    lea         eax,[ebx+68]
 00592581    mov         edx,dword ptr [ebp-8]
 00592584    test        edx,edx
>00592586    je          0059258B
 00592588    sub         edx,0FFFFFFDC
 0059258B    call        @IntfCopy
 00592590    lea         edx,[ebp-48]
 00592593    mov         eax,ebx
 00592595    call        TXMLNode.GetChildNodes
 0059259A    mov         eax,dword ptr [ebp-48]
 0059259D    mov         edx,dword ptr [eax]
 0059259F    call        dword ptr [edx+0C]
 005925A2    dec         eax
 005925A3    test        eax,eax
>005925A5    jl          00592676
 005925AB    inc         eax
 005925AC    mov         dword ptr [ebp-0C],eax
 005925AF    xor         esi,esi
 005925B1    lea         edx,[ebp-50]
 005925B4    mov         eax,ebx
 005925B6    call        TXMLNode.GetChildNodes
 005925BB    mov         eax,dword ptr [ebp-50]
 005925BE    push        eax
 005925BF    lea         eax,[ebp-60]
 005925C2    mov         edx,esi
 005925C4    mov         cl,0FC
 005925C6    call        @OleVarFromInt
 005925CB    lea         edx,[ebp-60]
 005925CE    lea         ecx,[ebp-4C]
 005925D1    pop         eax
 005925D2    mov         edi,dword ptr [eax]
 005925D4    call        dword ptr [edi+10]
 005925D7    mov         edx,dword ptr [ebp-4C]
 005925DA    mov         eax,ebx
 005925DC    call        TXMLNodeCollection.IsCollectionItem
 005925E1    test        al,al
>005925E3    je          0059266C
 005925E9    lea         edx,[ebp-6C]
 005925EC    mov         eax,ebx
 005925EE    call        TXMLNode.GetChildNodes
 005925F3    mov         eax,dword ptr [ebp-6C]
 005925F6    push        eax
 005925F7    lea         eax,[ebp-7C]
 005925FA    mov         edx,esi
 005925FC    mov         cl,0FC
 005925FE    call        @OleVarFromInt
 00592603    lea         edx,[ebp-7C]
 00592606    lea         ecx,[ebp-68]
 00592609    pop         eax
 0059260A    mov         edi,dword ptr [eax]
 0059260C    call        dword ptr [edi+10]
 0059260F    mov         edx,dword ptr [ebp-68]
 00592612    lea         eax,[ebp-64]
 00592615    mov         ecx,592734
 0059261A    call        @IntfCast
 0059261F    mov         eax,dword ptr [ebp-64]
 00592622    mov         edx,ebx
 00592624    mov         ecx,dword ptr [eax]
 00592626    call        dword ptr [ecx+0F0]
 0059262C    lea         edx,[ebp-84]
 00592632    mov         eax,ebx
 00592634    call        TXMLNode.GetChildNodes
 00592639    mov         eax,dword ptr [ebp-84]
 0059263F    push        eax
 00592640    lea         eax,[ebp-94]
 00592646    mov         edx,esi
 00592648    mov         cl,0FC
 0059264A    call        @OleVarFromInt
 0059264F    lea         edx,[ebp-94]
 00592655    lea         ecx,[ebp-80]
 00592658    pop         eax
 00592659    mov         edi,dword ptr [eax]
 0059265B    call        dword ptr [edi+10]
 0059265E    mov         ecx,dword ptr [ebp-80]
 00592661    or          edx,0FFFFFFFF
 00592664    mov         eax,dword ptr [ebp-8]
 00592667    call        TXMLNodeList.InternalInsert
 0059266C    inc         esi
 0059266D    dec         dword ptr [ebp-0C]
>00592670    jne         005925B1
 00592676    xor         eax,eax
 00592678    pop         edx
 00592679    pop         ecx
 0059267A    pop         ecx
 0059267B    mov         dword ptr fs:[eax],edx
 0059267E    push        59272C
 00592683    lea         eax,[ebp-94]
 00592689    call        @VarClr
 0059268E    lea         eax,[ebp-84]
 00592694    call        @IntfClear
 00592699    lea         eax,[ebp-80]
 0059269C    call        @IntfClear
 005926A1    lea         eax,[ebp-7C]
 005926A4    call        @VarClr
 005926A9    lea         eax,[ebp-6C]
 005926AC    call        @IntfClear
 005926B1    lea         eax,[ebp-68]
 005926B4    call        @IntfClear
 005926B9    lea         eax,[ebp-64]
 005926BC    call        @IntfClear
 005926C1    lea         eax,[ebp-60]
 005926C4    call        @VarClr
 005926C9    lea         eax,[ebp-50]
 005926CC    call        @IntfClear
 005926D1    lea         eax,[ebp-4C]
 005926D4    call        @IntfClear
 005926D9    lea         eax,[ebp-48]
 005926DC    call        @IntfClear
 005926E1    lea         eax,[ebp-44]
 005926E4    call        @VarClr
 005926E9    lea         eax,[ebp-34]
 005926EC    call        @IntfClear
 005926F1    lea         eax,[ebp-30]
 005926F4    call        @IntfClear
 005926F9    lea         eax,[ebp-2C]
 005926FC    call        @IntfClear
 00592701    lea         eax,[ebp-28]
 00592704    call        @VarClr
 00592709    lea         eax,[ebp-18]
 0059270C    call        @IntfClear
 00592711    lea         eax,[ebp-14]
 00592714    call        @IntfClear
 00592719    lea         eax,[ebp-10]
 0059271C    call        @IntfClear
 00592721    ret
>00592722    jmp         @HandleFinally
>00592727    jmp         00592683
 0059272C    pop         edi
 0059272D    pop         esi
 0059272E    pop         ebx
 0059272F    mov         esp,ebp
 00592731    pop         ebp
 00592732    ret
*}
end;

//00592744
function TXMLNodeCollection.IsCollectionItem(const Node:IXMLNode):Boolean;
begin
{*
 00592744    push        ebp
 00592745    mov         ebp,esp
 00592747    xor         ecx,ecx
 00592749    push        ecx
 0059274A    push        ecx
 0059274B    push        ecx
 0059274C    push        ecx
 0059274D    push        ebx
 0059274E    push        esi
 0059274F    mov         esi,edx
 00592751    mov         ebx,eax
 00592753    xor         eax,eax
 00592755    push        ebp
 00592756    push        59281C
 0059275B    push        dword ptr fs:[eax]
 0059275E    mov         dword ptr fs:[eax],esp
 00592761    mov         byte ptr [ebp-9],0
 00592765    lea         edx,[ebx+50]
 00592768    mov         eax,esi
 0059276A    call        Supports
 0059276F    test        al,al
>00592771    je          005927F0
 00592773    lea         edx,[ebp-10]
 00592776    mov         eax,esi
 00592778    mov         ecx,dword ptr [eax]
 0059277A    call        dword ptr [ecx+34]
 0059277D    mov         eax,dword ptr [ebp-10]
 00592780    lea         edx,[ebp-4]
 00592783    call        ExtractLocalName
 00592788    mov         eax,dword ptr [ebp-4]
 0059278B    mov         edx,dword ptr [ebx+64]
 0059278E    call        @UStrEqual
 00592793    sete        byte ptr [ebp-9]
 00592797    cmp         byte ptr [ebp-9],0
>0059279B    jne         005927F0
 0059279D    mov         edx,dword ptr [ebx+64]
 005927A0    mov         eax,59283C;';'
 005927A5    call        Pos
 005927AA    test        eax,eax
>005927AC    jle         005927F0
 005927AE    lea         eax,[ebp-8]
 005927B1    push        eax
 005927B2    movzx       ecx,byte ptr ds:[592840]
 005927B9    mov         dx,3B
 005927BD    mov         eax,dword ptr [ebx+64]
 005927C0    call        SplitString
 005927C5    mov         eax,dword ptr [ebp-8]
 005927C8    call        @DynArrayHigh
 005927CD    mov         ebx,eax
 005927CF    test        ebx,ebx
>005927D1    jl          005927F0
 005927D3    inc         ebx
 005927D4    xor         esi,esi
 005927D6    mov         eax,dword ptr [ebp-4]
 005927D9    mov         edx,dword ptr [ebp-8]
 005927DC    mov         edx,dword ptr [edx+esi*4]
 005927DF    call        @UStrEqual
>005927E4    jne         005927EC
 005927E6    mov         byte ptr [ebp-9],1
>005927EA    jmp         005927F0
 005927EC    inc         esi
 005927ED    dec         ebx
>005927EE    jne         005927D6
 005927F0    xor         eax,eax
 005927F2    pop         edx
 005927F3    pop         ecx
 005927F4    pop         ecx
 005927F5    mov         dword ptr fs:[eax],edx
 005927F8    push        592823
 005927FD    lea         eax,[ebp-10]
 00592800    call        @UStrClr
 00592805    lea         eax,[ebp-8]
 00592808    mov         edx,dword ptr ds:[58E6DC];TDOMStringDynArray
 0059280E    call        @DynArrayClear
 00592813    lea         eax,[ebp-4]
 00592816    call        @UStrClr
 0059281B    ret
>0059281C    jmp         @HandleFinally
>00592821    jmp         005927FD
 00592823    movzx       eax,byte ptr [ebp-9]
 00592827    pop         esi
 00592828    pop         ebx
 00592829    mov         esp,ebp
 0059282B    pop         ebp
 0059282C    ret
*}
end;

//00592844
procedure TXMLNodeCollection.InsertInCollection(Node:IXMLNode; Index:Integer);
begin
{*
 00592844    push        ebp
 00592845    mov         ebp,esp
 00592847    push        ecx
 00592848    mov         ecx,0C
 0059284D    push        0
 0059284F    push        0
 00592851    dec         ecx
>00592852    jne         0059284D
 00592854    xchg        ecx,dword ptr [ebp-4]
 00592857    push        ebx
 00592858    push        esi
 00592859    push        edi
 0059285A    mov         esi,ecx
 0059285C    mov         dword ptr [ebp-4],edx
 0059285F    mov         ebx,eax
 00592861    mov         eax,dword ptr [ebp-4]
 00592864    call        @IntfAddRef
 00592869    xor         eax,eax
 0059286B    push        ebp
 0059286C    push        592A56
 00592871    push        dword ptr fs:[eax]
 00592874    mov         dword ptr fs:[eax],esp
 00592877    mov         edx,dword ptr [ebp-4]
 0059287A    mov         eax,ebx
 0059287C    call        TXMLNodeCollection.IsCollectionItem
 00592881    test        al,al
>00592883    je          005929BD
 00592889    lea         eax,[ebp-10]
 0059288C    mov         edx,dword ptr [ebp-4]
 0059288F    mov         ecx,592A64
 00592894    call        @IntfCast
 00592899    mov         eax,dword ptr [ebp-10]
 0059289C    mov         edx,ebx
 0059289E    mov         ecx,dword ptr [eax]
 005928A0    call        dword ptr [ecx+0F0]
 005928A6    lea         edx,[ebp-14]
 005928A9    mov         eax,ebx
 005928AB    mov         ecx,dword ptr [eax]
 005928AD    call        dword ptr [ecx+1C]
 005928B0    mov         edi,dword ptr [ebp-14]
 005928B3    lea         edx,[ebp-18]
 005928B6    mov         eax,ebx
 005928B8    call        TXMLNode.GetChildNodes
 005928BD    cmp         edi,dword ptr [ebp-18]
>005928C0    je          005929E2
 005928C6    lea         edx,[ebp-1C]
 005928C9    mov         eax,ebx
 005928CB    mov         ecx,dword ptr [eax]
 005928CD    call        dword ptr [ecx+1C]
 005928D0    mov         eax,dword ptr [ebp-1C]
 005928D3    mov         edx,dword ptr [eax]
 005928D5    call        dword ptr [edx+0C]
 005928D8    cmp         eax,esi
>005928DA    ja          005928F6
 005928DC    lea         edx,[ebp-20]
 005928DF    mov         eax,ebx
 005928E1    mov         ecx,dword ptr [eax]
 005928E3    call        dword ptr [ecx+1C]
 005928E6    mov         eax,dword ptr [ebp-20]
 005928E9    mov         edx,dword ptr [ebp-4]
 005928EC    mov         ecx,dword ptr [eax]
 005928EE    call        dword ptr [ecx+18]
>005928F1    jmp         005929E2
 005928F6    test        esi,esi
>005928F8    jle         005929A4
 005928FE    lea         eax,[esi+1]
 00592901    push        eax
 00592902    lea         edx,[ebp-24]
 00592905    mov         eax,ebx
 00592907    call        TXMLNode.GetChildNodes
 0059290C    mov         eax,dword ptr [ebp-24]
 0059290F    mov         edx,dword ptr [eax]
 00592911    call        dword ptr [edx+0C]
 00592914    dec         eax
 00592915    pop         edx
 00592916    sub         eax,edx
>00592918    jl          005929A4
 0059291E    inc         eax
 0059291F    mov         dword ptr [ebp-0C],eax
 00592922    mov         dword ptr [ebp-8],edx
 00592925    lea         edx,[ebp-2C]
 00592928    mov         eax,ebx
 0059292A    call        TXMLNode.GetChildNodes
 0059292F    mov         eax,dword ptr [ebp-2C]
 00592932    push        eax
 00592933    lea         eax,[ebp-3C]
 00592936    mov         edx,dword ptr [ebp-8]
 00592939    mov         cl,0FC
 0059293B    call        @OleVarFromInt
 00592940    lea         edx,[ebp-3C]
 00592943    lea         ecx,[ebp-28]
 00592946    pop         eax
 00592947    mov         edi,dword ptr [eax]
 00592949    call        dword ptr [edi+10]
 0059294C    mov         edx,dword ptr [ebp-28]
 0059294F    mov         eax,ebx
 00592951    call        TXMLNodeCollection.IsCollectionItem
 00592956    test        al,al
>00592958    je          0059299C
 0059295A    lea         edx,[ebp-44]
 0059295D    mov         eax,ebx
 0059295F    call        TXMLNode.GetChildNodes
 00592964    mov         eax,dword ptr [ebp-44]
 00592967    push        eax
 00592968    lea         eax,[ebp-54]
 0059296B    mov         edx,dword ptr [ebp-8]
 0059296E    mov         cl,0FC
 00592970    call        @OleVarFromInt
 00592975    lea         edx,[ebp-54]
 00592978    lea         ecx,[ebp-40]
 0059297B    pop         eax
 0059297C    mov         esi,dword ptr [eax]
 0059297E    call        dword ptr [esi+10]
 00592981    mov         eax,dword ptr [ebp-40]
 00592984    push        eax
 00592985    lea         edx,[ebp-58]
 00592988    mov         eax,ebx
 0059298A    mov         ecx,dword ptr [eax]
 0059298C    call        dword ptr [ecx+1C]
 0059298F    mov         eax,dword ptr [ebp-58]
 00592992    pop         edx
 00592993    mov         ecx,dword ptr [eax]
 00592995    call        dword ptr [ecx+4C]
 00592998    mov         esi,eax
>0059299A    jmp         005929A4
 0059299C    inc         dword ptr [ebp-8]
 0059299F    dec         dword ptr [ebp-0C]
>005929A2    jne         00592925
 005929A4    lea         edx,[ebp-5C]
 005929A7    mov         eax,ebx
 005929A9    mov         ecx,dword ptr [eax]
 005929AB    call        dword ptr [ecx+1C]
 005929AE    mov         eax,dword ptr [ebp-5C]
 005929B1    mov         ecx,dword ptr [ebp-4]
 005929B4    mov         edx,esi
 005929B6    mov         ebx,dword ptr [eax]
 005929B8    call        dword ptr [ebx+58]
>005929BB    jmp         005929E2
 005929BD    lea         edx,[ebp-60]
 005929C0    mov         eax,ebx
 005929C2    mov         ecx,dword ptr [eax]
 005929C4    call        dword ptr [ecx+1C]
 005929C7    mov         esi,dword ptr [ebp-60]
 005929CA    lea         edx,[ebp-64]
 005929CD    mov         eax,ebx
 005929CF    call        TXMLNode.GetChildNodes
 005929D4    cmp         esi,dword ptr [ebp-64]
>005929D7    jne         005929E2
 005929D9    xor         edx,edx
 005929DB    mov         eax,ebx
 005929DD    call        TXMLNodeCollection.CreateItemList
 005929E2    xor         eax,eax
 005929E4    pop         edx
 005929E5    pop         ecx
 005929E6    pop         ecx
 005929E7    mov         dword ptr fs:[eax],edx
 005929EA    push        592A5D
 005929EF    lea         eax,[ebp-64]
 005929F2    mov         edx,dword ptr ds:[58A858];IXMLNodeList
 005929F8    mov         ecx,4
 005929FD    call        @FinalizeArray
 00592A02    lea         eax,[ebp-54]
 00592A05    call        @VarClr
 00592A0A    lea         eax,[ebp-44]
 00592A0D    call        @IntfClear
 00592A12    lea         eax,[ebp-40]
 00592A15    call        @IntfClear
 00592A1A    lea         eax,[ebp-3C]
 00592A1D    call        @VarClr
 00592A22    lea         eax,[ebp-2C]
 00592A25    call        @IntfClear
 00592A2A    lea         eax,[ebp-28]
 00592A2D    call        @IntfClear
 00592A32    lea         eax,[ebp-24]
 00592A35    mov         edx,dword ptr ds:[58A858];IXMLNodeList
 00592A3B    mov         ecx,5
 00592A40    call        @FinalizeArray
 00592A45    lea         eax,[ebp-10]
 00592A48    call        @IntfClear
 00592A4D    lea         eax,[ebp-4]
 00592A50    call        @IntfClear
 00592A55    ret
>00592A56    jmp         @HandleFinally
>00592A5B    jmp         005929EF
 00592A5D    pop         edi
 00592A5E    pop         esi
 00592A5F    pop         ebx
 00592A60    mov         esp,ebp
 00592A62    pop         ebp
 00592A63    ret
*}
end;

//00592A74
procedure TXMLNodeCollection.ChildListNotify(Operation:TNodeListOperation; var Node:IXMLNode; const IndexOrName:OleVariant; BeforeOperation:Boolean);
begin
{*
 00592A74    push        ebp
 00592A75    mov         ebp,esp
 00592A77    push        ebx
 00592A78    push        esi
 00592A79    push        edi
 00592A7A    mov         edi,ecx
 00592A7C    mov         ebx,edx
 00592A7E    mov         esi,eax
 00592A80    mov         eax,dword ptr [ebp+0C]
 00592A83    push        eax
 00592A84    movzx       eax,byte ptr [ebp+8]
 00592A88    push        eax
 00592A89    mov         ecx,edi
 00592A8B    mov         edx,ebx
 00592A8D    mov         eax,esi
 00592A8F    call        TXMLNode.ChildListNotify
 00592A94    mov         eax,dword ptr [ebp+0C]
 00592A97    push        eax
 00592A98    movzx       eax,byte ptr [ebp+8]
 00592A9C    push        eax
 00592A9D    mov         ecx,edi
 00592A9F    mov         edx,ebx
 00592AA1    mov         eax,esi
 00592AA3    call        TXMLNodeCollection.UpdateCollectionList
 00592AA8    pop         edi
 00592AA9    pop         esi
 00592AAA    pop         ebx
 00592AAB    pop         ebp
 00592AAC    ret         8
*}
end;

//00592AB0
procedure TXMLNodeCollection.UpdateCollectionList(Operation:TNodeListOperation; var Node:IXMLNode; const IndexOrName:OleVariant; BeforeOperation:Boolean);
begin
{*
 00592AB0    push        ebp
 00592AB1    mov         ebp,esp
 00592AB3    push        0
 00592AB5    push        0
 00592AB7    push        0
 00592AB9    push        ebx
 00592ABA    push        esi
 00592ABB    push        edi
 00592ABC    mov         edi,ecx
 00592ABE    mov         esi,eax
 00592AC0    xor         eax,eax
 00592AC2    push        ebp
 00592AC3    push        592B4A
 00592AC8    push        dword ptr fs:[eax]
 00592ACB    mov         dword ptr fs:[eax],esp
 00592ACE    cmp         byte ptr [ebp+8],0
>00592AD2    je          00592ADD
 00592AD4    mov         eax,esi
 00592AD6    call        TXMLNode.CheckReadOnly
>00592ADB    jmp         00592B29
 00592ADD    sub         dl,1
>00592AE0    jb          00592B16
>00592AE2    jne         00592B29
 00592AE4    lea         edx,[ebp-4]
 00592AE7    mov         eax,esi
 00592AE9    mov         ecx,dword ptr [eax]
 00592AEB    call        dword ptr [ecx+1C]
 00592AEE    mov         ebx,dword ptr [ebp-4]
 00592AF1    lea         edx,[ebp-8]
 00592AF4    mov         eax,esi
 00592AF6    call        TXMLNode.GetChildNodes
 00592AFB    cmp         ebx,dword ptr [ebp-8]
>00592AFE    je          00592B29
 00592B00    lea         edx,[ebp-0C]
 00592B03    mov         eax,esi
 00592B05    mov         ecx,dword ptr [eax]
 00592B07    call        dword ptr [ecx+1C]
 00592B0A    mov         eax,dword ptr [ebp-0C]
 00592B0D    mov         edx,dword ptr [edi]
 00592B0F    mov         ecx,dword ptr [eax]
 00592B11    call        dword ptr [ecx+60]
>00592B14    jmp         00592B29
 00592B16    mov         eax,dword ptr [ebp+0C]
 00592B19    call        @VarToInteger
 00592B1E    mov         ecx,eax
 00592B20    mov         edx,dword ptr [edi]
 00592B22    mov         eax,esi
 00592B24    call        TXMLNodeCollection.InsertInCollection
 00592B29    xor         eax,eax
 00592B2B    pop         edx
 00592B2C    pop         ecx
 00592B2D    pop         ecx
 00592B2E    mov         dword ptr fs:[eax],edx
 00592B31    push        592B51
 00592B36    lea         eax,[ebp-0C]
 00592B39    mov         edx,dword ptr ds:[58A858];IXMLNodeList
 00592B3F    mov         ecx,3
 00592B44    call        @FinalizeArray
 00592B49    ret
>00592B4A    jmp         @HandleFinally
>00592B4F    jmp         00592B36
 00592B51    pop         edi
 00592B52    pop         esi
 00592B53    pop         ebx
 00592B54    mov         esp,ebp
 00592B56    pop         ebp
 00592B57    ret         8
*}
end;

//00592B5C
function TXMLNodeCollection.AddItem(Index:Integer):IXMLNode;
begin
{*
 00592B5C    push        ebp
 00592B5D    mov         ebp,esp
 00592B5F    push        0
 00592B61    push        ebx
 00592B62    push        esi
 00592B63    push        edi
 00592B64    mov         edi,ecx
 00592B66    mov         esi,edx
 00592B68    mov         ebx,eax
 00592B6A    xor         eax,eax
 00592B6C    push        ebp
 00592B6D    push        592BBA
 00592B72    push        dword ptr fs:[eax]
 00592B75    mov         dword ptr fs:[eax],esp
 00592B78    cmp         dword ptr [ebx+64],0
>00592B7C    jne         00592B93
 00592B7E    lea         edx,[ebp-4]
 00592B81    mov         eax,[0078CD5C];^SResString597:TResStringRec
 00592B86    call        LoadResString
 00592B8B    mov         eax,dword ptr [ebp-4]
 00592B8E    call        XMLDocError
 00592B93    push        0
 00592B95    push        esi
 00592B96    push        edi
 00592B97    mov         ecx,dword ptr [ebx+60]
 00592B9A    mov         edx,dword ptr [ebx+64]
 00592B9D    mov         eax,ebx
 00592B9F    call        TXMLNode.AddChild
 00592BA4    xor         eax,eax
 00592BA6    pop         edx
 00592BA7    pop         ecx
 00592BA8    pop         ecx
 00592BA9    mov         dword ptr fs:[eax],edx
 00592BAC    push        592BC1
 00592BB1    lea         eax,[ebp-4]
 00592BB4    call        @UStrClr
 00592BB9    ret
>00592BBA    jmp         @HandleFinally
>00592BBF    jmp         00592BB1
 00592BC1    pop         edi
 00592BC2    pop         esi
 00592BC3    pop         ebx
 00592BC4    pop         ecx
 00592BC5    pop         ebp
 00592BC6    ret
*}
end;

//00592BC8
procedure TXMLNodeCollection.Delete(Index:Integer);
begin
{*
 00592BC8    push        ebp
 00592BC9    mov         ebp,esp
 00592BCB    xor         ecx,ecx
 00592BCD    push        ecx
 00592BCE    push        ecx
 00592BCF    push        ecx
 00592BD0    push        ecx
 00592BD1    push        ecx
 00592BD2    push        ecx
 00592BD3    push        ecx
 00592BD4    push        ebx
 00592BD5    push        esi
 00592BD6    mov         esi,edx
 00592BD8    mov         ebx,eax
 00592BDA    xor         eax,eax
 00592BDC    push        ebp
 00592BDD    push        592C59
 00592BE2    push        dword ptr fs:[eax]
 00592BE5    mov         dword ptr fs:[eax],esp
 00592BE8    lea         edx,[ebp-0C]
 00592BEB    mov         eax,ebx
 00592BED    mov         ecx,dword ptr [eax]
 00592BEF    call        dword ptr [ecx+1C]
 00592BF2    mov         eax,dword ptr [ebp-0C]
 00592BF5    push        eax
 00592BF6    lea         eax,[ebp-1C]
 00592BF9    mov         edx,esi
 00592BFB    mov         cl,0FC
 00592BFD    call        @OleVarFromInt
 00592C02    lea         edx,[ebp-1C]
 00592C05    lea         ecx,[ebp-8]
 00592C08    pop         eax
 00592C09    mov         esi,dword ptr [eax]
 00592C0B    call        dword ptr [esi+10]
 00592C0E    mov         edx,dword ptr [ebp-8]
 00592C11    lea         eax,[ebp-4]
 00592C14    mov         ecx,592C68
 00592C19    call        @IntfCast
 00592C1E    mov         edx,dword ptr [ebp-4]
 00592C21    mov         eax,ebx
 00592C23    call        TXMLNodeCollection.Remove
 00592C28    xor         eax,eax
 00592C2A    pop         edx
 00592C2B    pop         ecx
 00592C2C    pop         ecx
 00592C2D    mov         dword ptr fs:[eax],edx
 00592C30    push        592C60
 00592C35    lea         eax,[ebp-1C]
 00592C38    call        @VarClr
 00592C3D    lea         eax,[ebp-0C]
 00592C40    call        @IntfClear
 00592C45    lea         eax,[ebp-8]
 00592C48    mov         edx,dword ptr ds:[58A824];IXMLNode
 00592C4E    mov         ecx,2
 00592C53    call        @FinalizeArray
 00592C58    ret
>00592C59    jmp         @HandleFinally
>00592C5E    jmp         00592C35
 00592C60    pop         esi
 00592C61    pop         ebx
 00592C62    mov         esp,ebp
 00592C64    pop         ebp
 00592C65    ret
*}
end;

//00592C78
function TXMLNodeCollection.Remove(const AItem:IXMLNode):Integer;
begin
{*
 00592C78    push        ebp
 00592C79    mov         ebp,esp
 00592C7B    push        0
 00592C7D    push        0
 00592C7F    push        ebx
 00592C80    push        esi
 00592C81    push        edi
 00592C82    mov         esi,edx
 00592C84    mov         ebx,eax
 00592C86    xor         eax,eax
 00592C88    push        ebp
 00592C89    push        592CF7
 00592C8E    push        dword ptr fs:[eax]
 00592C91    mov         dword ptr fs:[eax],esp
 00592C94    lea         edx,[ebp-4]
 00592C97    mov         eax,ebx
 00592C99    mov         ecx,dword ptr [eax]
 00592C9B    call        dword ptr [ecx+1C]
 00592C9E    mov         eax,dword ptr [ebp-4]
 00592CA1    mov         edx,esi
 00592CA3    mov         ecx,dword ptr [eax]
 00592CA5    call        dword ptr [ecx+4C]
 00592CA8    mov         edi,eax
 00592CAA    test        edi,edi
>00592CAC    jge         00592CC2
 00592CAE    mov         ecx,8E7
 00592CB3    mov         edx,592D14;'C:\Builds\TP\xml\XMLDoc.pas'
 00592CB8    mov         eax,592D58;'Assertion failure'
 00592CBD    call        @Assert
 00592CC2    lea         edx,[ebp-8]
 00592CC5    mov         eax,ebx
 00592CC7    call        TXMLNode.GetChildNodes
 00592CCC    mov         eax,dword ptr [ebp-8]
 00592CCF    mov         edx,esi
 00592CD1    mov         ecx,dword ptr [eax]
 00592CD3    call        dword ptr [ecx+60]
 00592CD6    xor         eax,eax
 00592CD8    pop         edx
 00592CD9    pop         ecx
 00592CDA    pop         ecx
 00592CDB    mov         dword ptr fs:[eax],edx
 00592CDE    push        592CFE
 00592CE3    lea         eax,[ebp-8]
 00592CE6    mov         edx,dword ptr ds:[58A858];IXMLNodeList
 00592CEC    mov         ecx,2
 00592CF1    call        @FinalizeArray
 00592CF6    ret
>00592CF7    jmp         @HandleFinally
>00592CFC    jmp         00592CE3
 00592CFE    mov         eax,edi
 00592D00    pop         edi
 00592D01    pop         esi
 00592D02    pop         ebx
 00592D03    pop         ecx
 00592D04    pop         ecx
 00592D05    pop         ebp
 00592D06    ret
*}
end;

//00592D7C
procedure TXMLNodeCollection.Clear;
begin
{*
 00592D7C    push        ebp
 00592D7D    mov         ebp,esp
 00592D7F    push        0
 00592D81    push        0
 00592D83    push        ebx
 00592D84    mov         ebx,eax
 00592D86    xor         eax,eax
 00592D88    push        ebp
 00592D89    push        592DE0
 00592D8E    push        dword ptr fs:[eax]
 00592D91    mov         dword ptr fs:[eax],esp
>00592D94    jmp         00592DAC
 00592D96    lea         ecx,[ebp-4]
 00592D99    xor         edx,edx
 00592D9B    mov         eax,ebx
 00592D9D    call        TXMLNodeCollection.GetNode
 00592DA2    mov         edx,dword ptr [ebp-4]
 00592DA5    mov         eax,ebx
 00592DA7    call        TXMLNodeCollection.Remove
 00592DAC    lea         edx,[ebp-8]
 00592DAF    mov         eax,ebx
 00592DB1    mov         ecx,dword ptr [eax]
 00592DB3    call        dword ptr [ecx+1C]
 00592DB6    mov         eax,dword ptr [ebp-8]
 00592DB9    mov         edx,dword ptr [eax]
 00592DBB    call        dword ptr [edx+0C]
 00592DBE    test        eax,eax
>00592DC0    jg          00592D96
 00592DC2    xor         eax,eax
 00592DC4    pop         edx
 00592DC5    pop         ecx
 00592DC6    pop         ecx
 00592DC7    mov         dword ptr fs:[eax],edx
 00592DCA    push        592DE7
 00592DCF    lea         eax,[ebp-8]
 00592DD2    call        @IntfClear
 00592DD7    lea         eax,[ebp-4]
 00592DDA    call        @IntfClear
 00592DDF    ret
>00592DE0    jmp         @HandleFinally
>00592DE5    jmp         00592DCF
 00592DE7    pop         ebx
 00592DE8    pop         ecx
 00592DE9    pop         ecx
 00592DEA    pop         ebp
 00592DEB    ret
*}
end;

//00592DEC
function TXMLNodeCollection.GetCount:Integer;
begin
{*
 00592DEC    push        ebp
 00592DED    mov         ebp,esp
 00592DEF    push        0
 00592DF1    push        ebx
 00592DF2    mov         ebx,eax
 00592DF4    xor         eax,eax
 00592DF6    push        ebp
 00592DF7    push        592E2C
 00592DFC    push        dword ptr fs:[eax]
 00592DFF    mov         dword ptr fs:[eax],esp
 00592E02    lea         edx,[ebp-4]
 00592E05    mov         eax,ebx
 00592E07    mov         ecx,dword ptr [eax]
 00592E09    call        dword ptr [ecx+1C]
 00592E0C    mov         eax,dword ptr [ebp-4]
 00592E0F    mov         edx,dword ptr [eax]
 00592E11    call        dword ptr [edx+0C]
 00592E14    mov         ebx,eax
 00592E16    xor         eax,eax
 00592E18    pop         edx
 00592E19    pop         ecx
 00592E1A    pop         ecx
 00592E1B    mov         dword ptr fs:[eax],edx
 00592E1E    push        592E33
 00592E23    lea         eax,[ebp-4]
 00592E26    call        @IntfClear
 00592E2B    ret
>00592E2C    jmp         @HandleFinally
>00592E31    jmp         00592E23
 00592E33    mov         eax,ebx
 00592E35    pop         ebx
 00592E36    pop         ecx
 00592E37    pop         ebp
 00592E38    ret
*}
end;

//00592E3C
function TXMLNodeCollection.GetNode(Index:Integer):IXMLNode;
begin
{*
 00592E3C    push        ebp
 00592E3D    mov         ebp,esp
 00592E3F    push        0
 00592E41    push        0
 00592E43    push        0
 00592E45    push        0
 00592E47    push        0
 00592E49    push        0
 00592E4B    push        0
 00592E4D    push        ebx
 00592E4E    push        esi
 00592E4F    mov         dword ptr [ebp-4],ecx
 00592E52    mov         esi,edx
 00592E54    mov         ebx,eax
 00592E56    xor         eax,eax
 00592E58    push        ebp
 00592E59    push        592EC0
 00592E5E    push        dword ptr fs:[eax]
 00592E61    mov         dword ptr fs:[eax],esp
 00592E64    lea         edx,[ebp-0C]
 00592E67    mov         eax,ebx
 00592E69    mov         ecx,dword ptr [eax]
 00592E6B    call        dword ptr [ecx+1C]
 00592E6E    mov         eax,dword ptr [ebp-0C]
 00592E71    push        eax
 00592E72    lea         eax,[ebp-1C]
 00592E75    mov         edx,esi
 00592E77    mov         cl,0FC
 00592E79    call        @OleVarFromInt
 00592E7E    lea         edx,[ebp-1C]
 00592E81    lea         ecx,[ebp-8]
 00592E84    pop         eax
 00592E85    mov         ebx,dword ptr [eax]
 00592E87    call        dword ptr [ebx+10]
 00592E8A    mov         edx,dword ptr [ebp-8]
 00592E8D    mov         eax,dword ptr [ebp-4]
 00592E90    mov         ecx,592ED0
 00592E95    call        @IntfCast
 00592E9A    xor         eax,eax
 00592E9C    pop         edx
 00592E9D    pop         ecx
 00592E9E    pop         ecx
 00592E9F    mov         dword ptr fs:[eax],edx
 00592EA2    push        592EC7
 00592EA7    lea         eax,[ebp-1C]
 00592EAA    call        @VarClr
 00592EAF    lea         eax,[ebp-0C]
 00592EB2    call        @IntfClear
 00592EB7    lea         eax,[ebp-8]
 00592EBA    call        @IntfClear
 00592EBF    ret
>00592EC0    jmp         @HandleFinally
>00592EC5    jmp         00592EA7
 00592EC7    pop         esi
 00592EC8    pop         ebx
 00592EC9    mov         esp,ebp
 00592ECB    pop         ebp
 00592ECC    ret
*}
end;

//00592EE0
constructor TXMLDocument.Create;
begin
{*
 00592EE0    push        ebx
 00592EE1    push        esi
 00592EE2    test        dl,dl
>00592EE4    je          00592EEE
 00592EE6    add         esp,0FFFFFFF0
 00592EE9    call        @ClassCreate
 00592EEE    mov         ebx,edx
 00592EF0    mov         esi,eax
 00592EF2    xor         edx,edx
 00592EF4    mov         eax,esi
 00592EF6    call        TComponent.Create
 00592EFB    mov         eax,esi
 00592EFD    test        bl,bl
>00592EFF    je          00592F10
 00592F01    call        @AfterConstruction
 00592F06    pop         dword ptr fs:[0]
 00592F0D    add         esp,0C
 00592F10    mov         eax,esi
 00592F12    pop         esi
 00592F13    pop         ebx
 00592F14    ret
*}
end;

//00592F18
constructor TXMLDocument.Create;
begin
{*
 00592F18    push        ebx
 00592F19    push        esi
 00592F1A    push        edi
 00592F1B    test        dl,dl
>00592F1D    je          00592F27
 00592F1F    add         esp,0FFFFFFF0
 00592F22    call        @ClassCreate
 00592F27    mov         esi,ecx
 00592F29    mov         ebx,edx
 00592F2B    mov         edi,eax
 00592F2D    xor         ecx,ecx
 00592F2F    xor         edx,edx
 00592F31    mov         eax,edi
 00592F33    call        TComponent.Create
 00592F38    lea         eax,[edi+64]
 00592F3B    mov         edx,esi
 00592F3D    call        @UStrAsg
 00592F42    mov         eax,edi
 00592F44    test        bl,bl
>00592F46    je          00592F57
 00592F48    call        @AfterConstruction
 00592F4D    pop         dword ptr fs:[0]
 00592F54    add         esp,0C
 00592F57    mov         eax,edi
 00592F59    pop         edi
 00592F5A    pop         esi
 00592F5B    pop         ebx
 00592F5C    ret
*}
end;

//00592F60
destructor TXMLDocument.Destroy();
begin
{*
 00592F60    push        ebp
 00592F61    mov         ebp,esp
 00592F63    add         esp,0FFFFFFF8
 00592F66    push        ebx
 00592F67    xor         ecx,ecx
 00592F69    mov         dword ptr [ebp-8],ecx
 00592F6C    call        @BeforeDestruction
 00592F71    mov         byte ptr [ebp-1],dl
 00592F74    mov         ebx,eax
 00592F76    xor         eax,eax
 00592F78    push        ebp
 00592F79    push        593003
 00592F7E    push        dword ptr fs:[eax]
 00592F81    mov         dword ptr fs:[eax],esp
 00592F84    mov         eax,ebx
 00592F86    call        TComponent.Destroying
 00592F8B    cmp         byte ptr [ebx+0A8],0
>00592F92    je          00592FC6
 00592F94    mov         eax,ebx
 00592F96    mov         edx,dword ptr [eax]
 00592F98    call        dword ptr [edx+34]
 00592F9B    test        al,al
>00592F9D    je          00592FC6
 00592F9F    cmp         dword ptr [ebx+60],0
>00592FA3    je          00592FC6
 00592FA5    cmp         dword ptr [ebx+44],1
>00592FA9    jle         00592FC6
 00592FAB    lea         eax,[ebp-8]
 00592FAE    mov         edx,dword ptr [ebx+60]
 00592FB1    mov         ecx,59301C
 00592FB6    call        @IntfCast
 00592FBB    mov         eax,dword ptr [ebp-8]
 00592FBE    mov         edx,dword ptr [eax]
 00592FC0    call        dword ptr [edx+0B4]
 00592FC6    xor         edx,edx
 00592FC8    mov         eax,ebx
 00592FCA    mov         ecx,dword ptr [eax]
 00592FCC    call        dword ptr [ecx+38]
 00592FCF    lea         eax,[ebx+3C]
 00592FD2    mov         edx,dword ptr [eax]
 00592FD4    xor         ecx,ecx
 00592FD6    mov         dword ptr [eax],ecx
 00592FD8    mov         eax,edx
 00592FDA    call        TObject.Free
 00592FDF    movzx       edx,byte ptr [ebp-1]
 00592FE3    and         dl,0FC
 00592FE6    mov         eax,ebx
 00592FE8    call        TComponent.Destroy
 00592FED    xor         eax,eax
 00592FEF    pop         edx
 00592FF0    pop         ecx
 00592FF1    pop         ecx
 00592FF2    mov         dword ptr fs:[eax],edx
 00592FF5    push        59300A
 00592FFA    lea         eax,[ebp-8]
 00592FFD    call        @IntfClear
 00593002    ret
>00593003    jmp         @HandleFinally
>00593008    jmp         00592FFA
 0059300A    cmp         byte ptr [ebp-1],0
>0059300E    jle         00593017
 00593010    mov         eax,ebx
 00593012    call        @ClassDestroy
 00593017    pop         ebx
 00593018    pop         ecx
 00593019    pop         ecx
 0059301A    pop         ebp
 0059301B    ret
*}
end;

//0059302C
function TXMLDocument.NewInstance:TObject;
begin
{*
 0059302C    call        TObject.NewInstance
 00593031    mov         dword ptr [eax+44],1
 00593038    ret
*}
end;

//0059303C
procedure TXMLDocument.AfterConstruction;
begin
{*
 0059303C    push        ebx
 0059303D    push        esi
 0059303E    mov         ebx,eax
 00593040    mov         eax,ebx
 00593042    call        TObject.AfterConstruction
 00593047    test        byte ptr [ebx+1C],10
>0059304B    je          00593068
 0059304D    test        byte ptr [ebx+1C],1
>00593051    jne         00593068
 00593053    mov         eax,[0078D640];^DefaultDOMVendor:UnicodeString
 00593058    mov         eax,dword ptr [eax]
 0059305A    call        GetDOMVendor
 0059305F    mov         edx,eax
 00593061    mov         eax,ebx
 00593063    call        TXMLDocument.SetDOMVendor
 00593068    movzx       eax,byte ptr ds:[5930DC]
 0059306F    mov         byte ptr [ebx+68],al
 00593072    lea         eax,[ebx+70]
 00593075    mov         edx,5930EC;'NS'
 0059307A    call        @UStrAsg
 0059307F    mov         edx,dword ptr ds:[789B68];^'  '
 00593085    mov         eax,ebx
 00593087    call        TXMLDocument.SetNodeIndentStr
 0059308C    mov         eax,dword ptr [ebx+4]
 0059308F    test        eax,eax
>00593091    je          00593097
 00593093    test        eax,eax
>00593095    jne         0059309B
 00593097    xor         eax,eax
>00593099    jmp         0059309D
 0059309B    mov         al,1
 0059309D    mov         byte ptr [ebx+0A8],al
 005930A3    mov         dl,1
 005930A5    mov         eax,[0043C7BC];TStringList
 005930AA    call        TStringList.Create
 005930AF    mov         esi,eax
 005930B1    mov         dword ptr [ebx+3C],esi
 005930B4    mov         dword ptr [esi+4C],ebx
 005930B7    mov         dword ptr [esi+48],593C10;TXMLDocument.XMLStringsChanging
 005930BE    cmp         dword ptr [ebx+64],0
>005930C2    je          005930CD
 005930C4    mov         dl,1
 005930C6    mov         eax,ebx
 005930C8    mov         ecx,dword ptr [eax]
 005930CA    call        dword ptr [ecx+38]
 005930CD    lea         eax,[ebx+44]
 005930D0    or          edx,0FFFFFFFF
 005930D3    call        TInterlocked.Add
 005930D8    pop         esi
 005930D9    pop         ebx
 005930DA    ret
*}
end;

//005930F4
function TXMLDocument._AddRef:Integer; stdcall;
begin
{*
 005930F4    push        ebp
 005930F5    mov         ebp,esp
 005930F7    mov         eax,dword ptr [ebp+8]
 005930FA    add         eax,44
 005930FD    mov         edx,1
 00593102    call        TInterlocked.Add
 00593107    pop         ebp
 00593108    ret         4
*}
end;

//0059310C
function TXMLDocument._Release:Integer; stdcall;
begin
{*
 0059310C    push        ebp
 0059310D    mov         ebp,esp
 0059310F    push        ebx
 00593110    push        esi
 00593111    mov         ebx,dword ptr [ebp+8]
 00593114    lea         eax,[ebx+44]
 00593117    or          edx,0FFFFFFFF
 0059311A    call        TInterlocked.Add
 0059311F    mov         esi,eax
 00593121    test        esi,esi
>00593123    jne         00593137
 00593125    cmp         byte ptr [ebx+0A8],0
>0059312C    jne         00593137
 0059312E    mov         dl,1
 00593130    mov         eax,ebx
 00593132    mov         ecx,dword ptr [eax]
 00593134    call        dword ptr [ecx-4]
 00593137    mov         eax,esi
 00593139    pop         esi
 0059313A    pop         ebx
 0059313B    pop         ebp
 0059313C    ret         4
*}
end;

//00593140
procedure TXMLDocument.Loaded;
begin
{*
 00593140    push        ebp
 00593141    mov         ebp,esp
 00593143    push        ecx
 00593144    push        ebx
 00593145    push        esi
 00593146    push        edi
 00593147    mov         dword ptr [ebp-4],eax
 0059314A    mov         eax,dword ptr [ebp-4]
 0059314D    call        TComponent.Loaded
 00593152    xor         eax,eax
 00593154    push        ebp
 00593155    push        59317D
 0059315A    push        dword ptr fs:[eax]
 0059315D    mov         dword ptr fs:[eax],esp
 00593160    mov         eax,dword ptr [ebp-4]
 00593163    cmp         byte ptr [eax+78],0
>00593167    je          00593173
 00593169    mov         dl,1
 0059316B    mov         eax,dword ptr [ebp-4]
 0059316E    mov         ecx,dword ptr [eax]
 00593170    call        dword ptr [ecx+38]
 00593173    xor         eax,eax
 00593175    pop         edx
 00593176    pop         ecx
 00593177    pop         ecx
 00593178    mov         dword ptr fs:[eax],edx
>0059317B    jmp         005931C8
>0059317D    jmp         @HandleAnyException
 00593182    mov         eax,dword ptr [ebp-4]
 00593185    test        byte ptr [eax+1C],10
>00593189    je          005931BE
 0059318B    mov         eax,[0078D354]
 00593190    cmp         word ptr [eax+2],0
>00593195    je          005931AB
 00593197    call        ExceptObject
 0059319C    mov         edx,eax
 0059319E    mov         ebx,dword ptr ds:[78D354]
 005931A4    mov         eax,dword ptr [ebx+4]
 005931A7    call        dword ptr [ebx]
>005931A9    jmp         005931C3
 005931AB    call        ExceptAddr
 005931B0    push        eax
 005931B1    call        ExceptObject
 005931B6    pop         edx
 005931B7    call        ShowException
>005931BC    jmp         005931C3
 005931BE    call        @RaiseAgain
 005931C3    call        @DoneExcept
 005931C8    pop         edi
 005931C9    pop         esi
 005931CA    pop         ebx
 005931CB    pop         ecx
 005931CC    pop         ebp
 005931CD    ret
*}
end;

//005931D0
procedure TXMLDocument.ReadDOMVendor(Reader:TReader);
begin
{*
 005931D0    push        ebp
 005931D1    mov         ebp,esp
 005931D3    add         esp,0FFFFFFF8
 005931D6    push        ebx
 005931D7    push        esi
 005931D8    push        edi
 005931D9    xor         ecx,ecx
 005931DB    mov         dword ptr [ebp-4],ecx
 005931DE    mov         ebx,edx
 005931E0    mov         dword ptr [ebp-8],eax
 005931E3    xor         eax,eax
 005931E5    push        ebp
 005931E6    push        59328C
 005931EB    push        dword ptr fs:[eax]
 005931EE    mov         dword ptr fs:[eax],esp
 005931F1    lea         edx,[ebp-4]
 005931F4    mov         eax,ebx
 005931F6    call        TReader.ReadString
 005931FB    cmp         dword ptr [ebp-4],0
>005931FF    je          00593276
 00593201    xor         eax,eax
 00593203    push        ebp
 00593204    push        59322B
 00593209    push        dword ptr fs:[eax]
 0059320C    mov         dword ptr fs:[eax],esp
 0059320F    mov         eax,dword ptr [ebp-4]
 00593212    call        GetDOMVendor
 00593217    mov         edx,eax
 00593219    mov         eax,dword ptr [ebp-8]
 0059321C    call        TXMLDocument.SetDOMVendor
 00593221    xor         eax,eax
 00593223    pop         edx
 00593224    pop         ecx
 00593225    pop         ecx
 00593226    mov         dword ptr fs:[eax],edx
>00593229    jmp         00593276
>0059322B    jmp         @HandleAnyException
 00593230    mov         eax,dword ptr [ebp-8]
 00593233    test        byte ptr [eax+1C],10
>00593237    je          0059326C
 00593239    mov         eax,[0078D354]
 0059323E    cmp         word ptr [eax+2],0
>00593243    je          00593259
 00593245    call        ExceptObject
 0059324A    mov         edx,eax
 0059324C    mov         ebx,dword ptr ds:[78D354]
 00593252    mov         eax,dword ptr [ebx+4]
 00593255    call        dword ptr [ebx]
>00593257    jmp         00593271
 00593259    call        ExceptAddr
 0059325E    push        eax
 0059325F    call        ExceptObject
 00593264    pop         edx
 00593265    call        ShowException
>0059326A    jmp         00593271
 0059326C    call        @RaiseAgain
 00593271    call        @DoneExcept
 00593276    xor         eax,eax
 00593278    pop         edx
 00593279    pop         ecx
 0059327A    pop         ecx
 0059327B    mov         dword ptr fs:[eax],edx
 0059327E    push        593293
 00593283    lea         eax,[ebp-4]
 00593286    call        @UStrClr
 0059328B    ret
>0059328C    jmp         @HandleFinally
>00593291    jmp         00593283
 00593293    pop         edi
 00593294    pop         esi
 00593295    pop         ebx
 00593296    pop         ecx
 00593297    pop         ecx
 00593298    pop         ebp
 00593299    ret
*}
end;

//0059329C
procedure TXMLDocument.WriteDOMVendor(Writer:TWriter);
begin
{*
 0059329C    push        ebp
 0059329D    mov         ebp,esp
 0059329F    push        0
 005932A1    push        ebx
 005932A2    push        esi
 005932A3    push        edi
 005932A4    mov         edi,edx
 005932A6    mov         ebx,eax
 005932A8    xor         eax,eax
 005932AA    push        ebp
 005932AB    push        5932E6
 005932B0    push        dword ptr fs:[eax]
 005932B3    mov         dword ptr fs:[eax],esp
 005932B6    mov         esi,dword ptr [ebx+40]
 005932B9    test        esi,esi
>005932BB    je          005932D0
 005932BD    lea         edx,[ebp-4]
 005932C0    mov         eax,esi
 005932C2    mov         ecx,dword ptr [eax]
 005932C4    call        dword ptr [ecx]
 005932C6    mov         edx,dword ptr [ebp-4]
 005932C9    mov         eax,edi
 005932CB    call        TWriter.WriteString
 005932D0    xor         eax,eax
 005932D2    pop         edx
 005932D3    pop         ecx
 005932D4    pop         ecx
 005932D5    mov         dword ptr fs:[eax],edx
 005932D8    push        5932ED
 005932DD    lea         eax,[ebp-4]
 005932E0    call        @UStrClr
 005932E5    ret
>005932E6    jmp         @HandleFinally
>005932EB    jmp         005932DD
 005932ED    pop         edi
 005932EE    pop         esi
 005932EF    pop         ebx
 005932F0    pop         ecx
 005932F1    pop         ebp
 005932F2    ret
*}
end;

//005932F4
function DOMVendorStored:Boolean;
begin
{*
 005932F4    push        ebp
 005932F5    mov         ebp,esp
 005932F7    mov         eax,dword ptr [ebp+8]
 005932FA    mov         eax,dword ptr [eax-4]
 005932FD    mov         eax,dword ptr [eax+20]
 00593300    test        eax,eax
>00593302    je          00593318
 00593304    mov         edx,dword ptr [ebp+8]
 00593307    mov         edx,dword ptr [edx-8]
 0059330A    mov         edx,dword ptr [edx+40]
 0059330D    mov         ecx,dword ptr [ebp+8]
 00593310    cmp         edx,dword ptr [eax+40]
 00593313    setne       al
 00593316    pop         ebp
 00593317    ret
 00593318    mov         eax,dword ptr [ebp+8]
 0059331B    mov         eax,dword ptr [eax-8]
 0059331E    cmp         dword ptr [eax+40],0
 00593322    setne       al
 00593325    pop         ebp
 00593326    ret
*}
end;

//00593328
procedure TXMLDocument.DefineProperties(Filer:TFiler);
begin
{*
 00593328    push        ebp
 00593329    mov         ebp,esp
 0059332B    add         esp,0FFFFFFF8
 0059332E    push        ebx
 0059332F    mov         dword ptr [ebp-4],edx
 00593332    mov         dword ptr [ebp-8],eax
 00593335    mov         edx,dword ptr [ebp-4]
 00593338    mov         eax,dword ptr [ebp-8]
 0059333B    call        TComponent.DefineProperties
 00593340    mov         eax,dword ptr [ebp-8]
 00593343    push        eax
 00593344    push        5931D0;TXMLDocument.ReadDOMVendor
 00593349    mov         eax,dword ptr [ebp-8]
 0059334C    push        eax
 0059334D    push        59329C;TXMLDocument.WriteDOMVendor
 00593352    push        ebp
 00593353    call        DOMVendorStored
 00593358    pop         ecx
 00593359    mov         ecx,eax
 0059335B    mov         edx,59337C;'DOMVendorDesc'
 00593360    mov         eax,dword ptr [ebp-4]
 00593363    mov         ebx,dword ptr [eax]
 00593365    call        dword ptr [ebx+4]
 00593368    pop         ebx
 00593369    pop         ecx
 0059336A    pop         ecx
 0059336B    pop         ebp
 0059336C    ret
*}
end;

//00593398
function TXMLDocument.IsXMLStored(Value:TStrings):Boolean;
begin
{*
 00593398    push        ebx
 00593399    mov         ebx,eax
 0059339B    mov         eax,ebx
 0059339D    mov         edx,dword ptr [eax]
 0059339F    call        dword ptr [edx+34]
 005933A2    test        al,al
>005933A4    je          005933AF
 005933A6    cmp         byte ptr [ebx+84],1
>005933AD    je          005933CA
 005933AF    mov         eax,ebx
 005933B1    mov         edx,dword ptr [eax]
 005933B3    call        dword ptr [edx+34]
 005933B6    test        al,al
>005933B8    jne         005933C6
 005933BA    mov         eax,dword ptr [ebx+3C]
 005933BD    mov         edx,dword ptr [eax]
 005933BF    call        dword ptr [edx+14]
 005933C2    test        eax,eax
>005933C4    jg          005933CA
 005933C6    xor         eax,eax
 005933C8    pop         ebx
 005933C9    ret
 005933CA    mov         al,1
 005933CC    pop         ebx
 005933CD    ret
*}
end;

//005933D0
function TXMLDocument.NodeIndentStored(Value:string):Boolean;
begin
{*
 005933D0    push        ebp
 005933D1    mov         ebp,esp
 005933D3    push        0
 005933D5    push        ebx
 005933D6    mov         ebx,eax
 005933D8    xor         eax,eax
 005933DA    push        ebp
 005933DB    push        593419
 005933E0    push        dword ptr fs:[eax]
 005933E3    mov         dword ptr fs:[eax],esp
 005933E6    lea         edx,[ebp-4]
 005933E9    mov         eax,ebx
 005933EB    call        TXMLDocument.GetNodeIndentStr
 005933F0    mov         eax,dword ptr [ebp-4]
 005933F3    mov         edx,dword ptr ds:[789B68];^'  '
 005933F9    call        @UStrEqual
 005933FE    setne       al
 00593401    mov         ebx,eax
 00593403    xor         eax,eax
 00593405    pop         edx
 00593406    pop         ecx
 00593407    pop         ecx
 00593408    mov         dword ptr fs:[eax],edx
 0059340B    push        593420
 00593410    lea         eax,[ebp-4]
 00593413    call        @UStrClr
 00593418    ret
>00593419    jmp         @HandleFinally
>0059341E    jmp         00593410
 00593420    mov         eax,ebx
 00593422    pop         ebx
 00593423    pop         ecx
 00593424    pop         ebp
 00593425    ret
*}
end;

//00593428
function TXMLDocument.GetActive:Boolean;
begin
{*
 00593428    cmp         dword ptr [eax+50],0
 0059342C    setne       al
 0059342F    ret
*}
end;

//00593430
procedure TXMLDocument.SetActive(const Value:Boolean);
begin
{*
 00593430    push        ebp
 00593431    mov         ebp,esp
 00593433    add         esp,0FFFFFFF8
 00593436    push        ebx
 00593437    push        esi
 00593438    push        edi
 00593439    xor         ecx,ecx
 0059343B    mov         dword ptr [ebp-8],ecx
 0059343E    mov         ebx,edx
 00593440    mov         dword ptr [ebp-4],eax
 00593443    xor         eax,eax
 00593445    push        ebp
 00593446    push        59354E
 0059344B    push        dword ptr fs:[eax]
 0059344E    mov         dword ptr fs:[eax],esp
 00593451    mov         eax,dword ptr [ebp-4]
 00593454    test        byte ptr [eax+1C],2
>00593458    je          00593465
 0059345A    mov         eax,dword ptr [ebp-4]
 0059345D    mov         byte ptr [eax+78],bl
>00593460    jmp         00593538
 00593465    mov         eax,dword ptr [ebp-4]
 00593468    mov         edx,dword ptr [eax]
 0059346A    call        dword ptr [edx+34]
 0059346D    cmp         bl,al
>0059346F    je          00593538
 00593475    test        bl,bl
>00593477    je          00593512
 0059347D    mov         eax,dword ptr [ebp-4]
 00593480    mov         si,0FFEB
 00593484    call        @CallDynaInst
 00593489    mov         eax,dword ptr [ebp-4]
 0059348C    mov         si,0FFEF
 00593490    call        @CallDynaInst
 00593495    lea         eax,[ebp-8]
 00593498    call        @IntfClear
 0059349D    push        eax
 0059349E    push        0
 005934A0    push        0
 005934A2    push        0
 005934A4    mov         eax,dword ptr [ebp-4]
 005934A7    mov         eax,dword ptr [eax+54]
 005934AA    push        eax
 005934AB    mov         eax,dword ptr [eax]
 005934AD    call        dword ptr [eax+14]
 005934B0    call        @CheckAutoResult
 005934B5    mov         edx,dword ptr [ebp-8]
 005934B8    mov         eax,dword ptr [ebp-4]
 005934BB    add         eax,50
 005934BE    call        @IntfCopy
 005934C3    xor         eax,eax
 005934C5    push        ebp
 005934C6    push        5934E7
 005934CB    push        dword ptr fs:[eax]
 005934CE    mov         dword ptr fs:[eax],esp
 005934D1    mov         eax,dword ptr [ebp-4]
 005934D4    mov         si,0FFEA
 005934D8    call        @CallDynaInst
 005934DD    xor         eax,eax
 005934DF    pop         edx
 005934E0    pop         ecx
 005934E1    pop         ecx
 005934E2    mov         dword ptr fs:[eax],edx
>005934E5    jmp         00593504
>005934E7    jmp         @HandleAnyException
 005934EC    xor         edx,edx
 005934EE    mov         eax,dword ptr [ebp-4]
 005934F1    mov         si,0FFE9
 005934F5    call        @CallDynaInst
 005934FA    call        @RaiseAgain
 005934FF    call        @DoneExcept
 00593504    mov         eax,dword ptr [ebp-4]
 00593507    mov         si,0FFED
 0059350B    call        @CallDynaInst
>00593510    jmp         00593538
 00593512    mov         eax,dword ptr [ebp-4]
 00593515    mov         si,0FFEC
 00593519    call        @CallDynaInst
 0059351E    mov         dl,1
 00593520    mov         eax,dword ptr [ebp-4]
 00593523    mov         si,0FFE9
 00593527    call        @CallDynaInst
 0059352C    mov         eax,dword ptr [ebp-4]
 0059352F    mov         si,0FFEE
 00593533    call        @CallDynaInst
 00593538    xor         eax,eax
 0059353A    pop         edx
 0059353B    pop         ecx
 0059353C    pop         ecx
 0059353D    mov         dword ptr fs:[eax],edx
 00593540    push        593555
 00593545    lea         eax,[ebp-8]
 00593548    call        @IntfClear
 0059354D    ret
>0059354E    jmp         @HandleFinally
>00593553    jmp         00593545
 00593555    pop         edi
 00593556    pop         esi
 00593557    pop         ebx
 00593558    pop         ecx
 00593559    pop         ecx
 0059355A    pop         ebp
 0059355B    ret
*}
end;

//005935AC
procedure TXMLDocument.LoadData;
begin
{*
 005935AC    push        ebp
 005935AD    mov         ebp,esp
 005935AF    mov         ecx,10
 005935B4    push        0
 005935B6    push        0
 005935B8    dec         ecx
>005935B9    jne         005935B4
 005935BB    push        ebx
 005935BC    push        esi
 005935BD    mov         esi,eax
 005935BF    xor         eax,eax
 005935C1    push        ebp
 005935C2    push        5938E7
 005935C7    push        dword ptr fs:[eax]
 005935CA    mov         dword ptr fs:[eax],esp
 005935CD    mov         byte ptr [esi+84],0
 005935D4    mov         dword ptr [esi+80],0FFFFFFFF
 005935DE    mov         eax,esi
 005935E0    call        TXMLDocument.AssignParseOptions
 005935E5    mov         eax,dword ptr [esi+3C]
 005935E8    mov         edx,dword ptr [eax]
 005935EA    call        dword ptr [edx+14]
 005935ED    test        eax,eax
>005935EF    jle         00593643
 005935F1    lea         eax,[ebp-0C]
 005935F4    push        eax
 005935F5    lea         edx,[ebp-14]
 005935F8    mov         eax,dword ptr [esi+3C]
 005935FB    mov         ecx,dword ptr [eax]
 005935FD    call        dword ptr [ecx+1C]
 00593600    mov         edx,dword ptr [ebp-14]
 00593603    lea         eax,[ebp-10]
 00593606    call        @WStrFromUStr
 0059360B    mov         eax,dword ptr [ebp-10]
 0059360E    push        eax
 0059360F    lea         edx,[ebp-18]
 00593612    mov         eax,esi
 00593614    call        TXMLDocument.GetDOMPersist
 00593619    mov         eax,dword ptr [ebp-18]
 0059361C    push        eax
 0059361D    mov         eax,dword ptr [eax]
 0059361F    call        dword ptr [eax+1C]
 00593622    call        @CheckAutoResult
 00593627    cmp         word ptr [ebp-0C],1
 0059362C    sbb         ebx,ebx
 0059362E    inc         ebx
 0059362F    mov         byte ptr [esi+84],1
 00593636    xor         eax,eax
 00593638    mov         dword ptr [esi+80],eax
>0059363E    jmp         00593761
 00593643    cmp         dword ptr [esi+34],0
>00593647    je          005936CF
 0059364D    mov         edx,789B94;^'UTF-16'
 00593652    lea         eax,[esi+34]
 00593655    mov         ecx,2
 0059365A    call        CheckEncoding
 0059365F    mov         eax,dword ptr [esi+34]
 00593662    cmp         word ptr [eax],0FEFF
>00593667    jne         0059367B
 00593669    lea         eax,[esi+34]
 0059366C    mov         ecx,1
 00593671    mov         edx,1
 00593676    call        @UStrDelete
 0059367B    lea         eax,[ebp-0C]
 0059367E    push        eax
 0059367F    lea         eax,[ebp-1C]
 00593682    mov         edx,dword ptr [esi+34]
 00593685    call        @WStrFromUStr
 0059368A    mov         eax,dword ptr [ebp-1C]
 0059368D    push        eax
 0059368E    lea         edx,[ebp-20]
 00593691    mov         eax,esi
 00593693    call        TXMLDocument.GetDOMPersist
 00593698    mov         eax,dword ptr [ebp-20]
 0059369B    push        eax
 0059369C    mov         eax,dword ptr [eax]
 0059369E    call        dword ptr [eax+1C]
 005936A1    call        @CheckAutoResult
 005936A6    cmp         word ptr [ebp-0C],1
 005936AB    sbb         ebx,ebx
 005936AD    inc         ebx
 005936AE    lea         eax,[esi+34]
 005936B1    call        @UStrClr
 005936B6    cmp         byte ptr [esi+84],0
>005936BD    jne         00593761
 005936C3    mov         byte ptr [esi+84],2
>005936CA    jmp         00593761
 005936CF    mov         eax,dword ptr [esi+38]
 005936D2    test        eax,eax
>005936D4    je          00593715
 005936D6    xor         ecx,ecx
 005936D8    xor         edx,edx
 005936DA    mov         ebx,dword ptr [eax]
 005936DC    call        dword ptr [ebx+14]
 005936DF    lea         eax,[ebp-0C]
 005936E2    push        eax
 005936E3    mov         eax,dword ptr [esi+38]
 005936E6    push        eax
 005936E7    lea         edx,[ebp-24]
 005936EA    mov         eax,esi
 005936EC    call        TXMLDocument.GetDOMPersist
 005936F1    mov         eax,dword ptr [ebp-24]
 005936F4    push        eax
 005936F5    mov         eax,dword ptr [eax]
 005936F7    call        dword ptr [eax+18]
 005936FA    call        @CheckAutoResult
 005936FF    cmp         word ptr [ebp-0C],1
 00593704    sbb         ebx,ebx
 00593706    inc         ebx
 00593707    mov         byte ptr [esi+84],4
 0059370E    xor         eax,eax
 00593710    mov         dword ptr [esi+38],eax
>00593713    jmp         00593761
 00593715    cmp         dword ptr [esi+64],0
>00593719    je          0059375F
 0059371B    lea         eax,[ebp-0C]
 0059371E    push        eax
 0059371F    lea         eax,[ebp-34]
 00593722    mov         edx,dword ptr [esi+64]
 00593725    call        @OleVarFromUStr
 0059372A    push        dword ptr [ebp-28]
 0059372D    push        dword ptr [ebp-2C]
 00593730    push        dword ptr [ebp-30]
 00593733    push        dword ptr [ebp-34]
 00593736    lea         edx,[ebp-38]
 00593739    mov         eax,esi
 0059373B    call        TXMLDocument.GetDOMPersist
 00593740    mov         eax,dword ptr [ebp-38]
 00593743    push        eax
 00593744    mov         eax,dword ptr [eax]
 00593746    call        dword ptr [eax+14]
 00593749    call        @CheckAutoResult
 0059374E    cmp         word ptr [ebp-0C],1
 00593753    sbb         ebx,ebx
 00593755    inc         ebx
 00593756    mov         byte ptr [esi+84],3
>0059375D    jmp         00593761
 0059375F    mov         bl,1
 00593761    test        bl,bl
>00593763    jne         0059385B
 00593769    mov         byte ptr [esi+84],0
 00593770    lea         edx,[ebp-3C]
 00593773    mov         eax,esi
 00593775    call        TXMLDocument.GetDOMDocument
 0059377A    mov         edx,dword ptr [ebp-3C]
 0059377D    lea         eax,[ebp-4]
 00593780    mov         ecx,5938F4
 00593785    call        @IntfCast
 0059378A    lea         eax,[ebp-8]
 0059378D    push        eax
 0059378E    lea         eax,[ebp-70]
 00593791    call        @UStrClr
 00593796    push        eax
 00593797    mov         eax,dword ptr [ebp-4]
 0059379A    push        eax
 0059379B    mov         eax,dword ptr [eax]
 0059379D    call        dword ptr [eax+14]
 005937A0    call        @CheckAutoResult
 005937A5    mov         eax,dword ptr [ebp-70]
 005937A8    mov         dword ptr [ebp-6C],eax
 005937AB    mov         byte ptr [ebp-68],11
 005937AF    mov         eax,593910;#13+#10
 005937B4    mov         dword ptr [ebp-64],eax
 005937B7    mov         byte ptr [ebp-60],0B
 005937BB    lea         edx,[ebp-74]
 005937BE    mov         eax,[0078D038];^SResString601:TResStringRec
 005937C3    call        LoadResString
 005937C8    mov         eax,dword ptr [ebp-74]
 005937CB    mov         dword ptr [ebp-5C],eax
 005937CE    mov         byte ptr [ebp-58],11
 005937D2    lea         eax,[ebp-78]
 005937D5    push        eax
 005937D6    mov         eax,dword ptr [ebp-4]
 005937D9    push        eax
 005937DA    mov         eax,dword ptr [eax]
 005937DC    call        dword ptr [eax+1C]
 005937DF    call        @CheckAutoResult
 005937E4    mov         eax,dword ptr [ebp-78]
 005937E7    mov         dword ptr [ebp-54],eax
 005937EA    mov         byte ptr [ebp-50],0
 005937EE    mov         eax,593910;#13+#10
 005937F3    mov         dword ptr [ebp-4C],eax
 005937F6    mov         byte ptr [ebp-48],0B
 005937FA    lea         eax,[ebp-7C]
 005937FD    push        eax
 005937FE    lea         eax,[ebp-80]
 00593801    call        @UStrClr
 00593806    push        eax
 00593807    mov         eax,dword ptr [ebp-4]
 0059380A    push        eax
 0059380B    mov         eax,dword ptr [eax]
 0059380D    call        dword ptr [eax+18]
 00593810    call        @CheckAutoResult
 00593815    mov         eax,dword ptr [ebp-80]
 00593818    mov         ecx,28
 0059381D    mov         edx,1
 00593822    call        @UStrCopy
 00593827    mov         eax,dword ptr [ebp-7C]
 0059382A    mov         dword ptr [ebp-44],eax
 0059382D    mov         byte ptr [ebp-40],11
 00593831    lea         edx,[ebp-6C]
 00593834    mov         ecx,5
 00593839    mov         eax,593920;'%s%s%s: %d%s%s'
 0059383E    call        Format
 00593843    mov         eax,dword ptr [ebp-8]
 00593846    push        eax
 00593847    mov         ecx,dword ptr [ebp-4]
 0059384A    mov         dl,1
 0059384C    mov         eax,[005894D8];EDOMParseError
 00593851    call        EDOMParseError.Create
 00593856    call        @RaiseExcept
 0059385B    xor         edx,edx
 0059385D    mov         eax,esi
 0059385F    call        TXMLDocument.SetModified
 00593864    xor         eax,eax
 00593866    pop         edx
 00593867    pop         ecx
 00593868    pop         ecx
 00593869    mov         dword ptr fs:[eax],edx
 0059386C    push        5938EE
 00593871    lea         eax,[ebp-80]
 00593874    mov         edx,2
 00593879    call        @UStrArrayClr
 0059387E    lea         eax,[ebp-74]
 00593881    mov         edx,2
 00593886    call        @UStrArrayClr
 0059388B    lea         eax,[ebp-3C]
 0059388E    call        @IntfClear
 00593893    lea         eax,[ebp-38]
 00593896    call        @IntfClear
 0059389B    lea         eax,[ebp-34]
 0059389E    call        @VarClr
 005938A3    lea         eax,[ebp-24]
 005938A6    mov         edx,dword ptr ds:[589B9C];IDOMPersist
 005938AC    mov         ecx,2
 005938B1    call        @FinalizeArray
 005938B6    lea         eax,[ebp-1C]
 005938B9    call        @WStrClr
 005938BE    lea         eax,[ebp-18]
 005938C1    call        @IntfClear
 005938C6    lea         eax,[ebp-14]
 005938C9    call        @UStrClr
 005938CE    lea         eax,[ebp-10]
 005938D1    call        @WStrClr
 005938D6    lea         eax,[ebp-8]
 005938D9    call        @UStrClr
 005938DE    lea         eax,[ebp-4]
 005938E1    call        @IntfClear
 005938E6    ret
>005938E7    jmp         @HandleFinally
>005938EC    jmp         00593871
 005938EE    pop         esi
 005938EF    pop         ebx
 005938F0    mov         esp,ebp
 005938F2    pop         ebp
 005938F3    ret
*}
end;

//00593940
procedure TXMLDocument.ReleaseDoc(const CheckSave:Boolean);
begin
{*
 00593940    push        ebx
 00593941    push        esi
 00593942    mov         ebx,eax
 00593944    test        dl,dl
>00593946    je          00593953
 00593948    mov         eax,ebx
 0059394A    mov         si,0FFF0
 0059394E    call        @CallDynaInst
 00593953    lea         eax,[ebx+60]
 00593956    call        @IntfClear
 0059395B    lea         eax,[ebx+4C]
 0059395E    call        @IntfClear
 00593963    lea         eax,[ebx+50]
 00593966    call        @IntfClear
 0059396B    lea         eax,[ebx+58]
 0059396E    call        @IntfClear
 00593973    xor         eax,eax
 00593975    mov         dword ptr [ebx+6C],eax
 00593978    xor         edx,edx
 0059397A    mov         eax,ebx
 0059397C    call        TXMLDocument.SetModified
 00593981    movzx       eax,byte ptr [ebx+84]
 00593988    sub         al,2
>0059398A    jb          00593995
 0059398C    xor         edx,edx
 0059398E    mov         eax,ebx
 00593990    call        TXMLDocument.SetXMLStrings
 00593995    pop         esi
 00593996    pop         ebx
 00593997    ret
*}
end;

//00593998
procedure TXMLDocument.Refresh;
begin
{*
 00593998    push        ebp
 00593999    mov         ebp,esp
 0059399B    push        0
 0059399D    push        0
 0059399F    push        0
 005939A1    push        ebx
 005939A2    push        esi
 005939A3    push        edi
 005939A4    mov         dword ptr [ebp-4],eax
 005939A7    xor         eax,eax
 005939A9    push        ebp
 005939AA    push        593A7F
 005939AF    push        dword ptr fs:[eax]
 005939B2    mov         dword ptr fs:[eax],esp
 005939B5    mov         eax,dword ptr [ebp-4]
 005939B8    call        TXMLDocument.CheckActive
 005939BD    xor         edx,edx
 005939BF    mov         eax,dword ptr [ebp-4]
 005939C2    mov         si,0FFE9
 005939C6    call        @CallDynaInst
 005939CB    mov         eax,dword ptr [ebp-4]
 005939CE    movzx       eax,byte ptr [eax+84]
 005939D5    sub         al,1
>005939D7    je          005939F2
 005939D9    sub         al,2
>005939DB    je          005939F2
 005939DD    lea         edx,[ebp-8]
 005939E0    mov         eax,[0078D478];^SResString599:TResStringRec
 005939E5    call        LoadResString
 005939EA    mov         eax,dword ptr [ebp-8]
 005939ED    call        XMLDocError
 005939F2    lea         eax,[ebp-0C]
 005939F5    call        @IntfClear
 005939FA    push        eax
 005939FB    push        0
 005939FD    push        0
 005939FF    push        0
 00593A01    mov         eax,dword ptr [ebp-4]
 00593A04    mov         eax,dword ptr [eax+54]
 00593A07    push        eax
 00593A08    mov         eax,dword ptr [eax]
 00593A0A    call        dword ptr [eax+14]
 00593A0D    call        @CheckAutoResult
 00593A12    mov         edx,dword ptr [ebp-0C]
 00593A15    mov         eax,dword ptr [ebp-4]
 00593A18    add         eax,50
 00593A1B    call        @IntfCopy
 00593A20    xor         eax,eax
 00593A22    push        ebp
 00593A23    push        593A44
 00593A28    push        dword ptr fs:[eax]
 00593A2B    mov         dword ptr fs:[eax],esp
 00593A2E    mov         eax,dword ptr [ebp-4]
 00593A31    mov         si,0FFEA
 00593A35    call        @CallDynaInst
 00593A3A    xor         eax,eax
 00593A3C    pop         edx
 00593A3D    pop         ecx
 00593A3E    pop         ecx
 00593A3F    mov         dword ptr fs:[eax],edx
>00593A42    jmp         00593A61
>00593A44    jmp         @HandleAnyException
 00593A49    xor         edx,edx
 00593A4B    mov         eax,dword ptr [ebp-4]
 00593A4E    mov         si,0FFE9
 00593A52    call        @CallDynaInst
 00593A57    call        @RaiseAgain
 00593A5C    call        @DoneExcept
 00593A61    xor         eax,eax
 00593A63    pop         edx
 00593A64    pop         ecx
 00593A65    pop         ecx
 00593A66    mov         dword ptr fs:[eax],edx
 00593A69    push        593A86
 00593A6E    lea         eax,[ebp-0C]
 00593A71    call        @IntfClear
 00593A76    lea         eax,[ebp-8]
 00593A79    call        @UStrClr
 00593A7E    ret
>00593A7F    jmp         @HandleFinally
>00593A84    jmp         00593A6E
 00593A86    pop         edi
 00593A87    pop         esi
 00593A88    pop         ebx
 00593A89    mov         esp,ebp
 00593A8B    pop         ebp
 00593A8C    ret
*}
end;

//00593A90
procedure TXMLDocument.Resync;
begin
{*
 00593A90    push        ebx
 00593A91    mov         ebx,eax
 00593A93    mov         eax,ebx
 00593A95    call        TXMLDocument.CheckActive
 00593A9A    lea         eax,[ebx+60]
 00593A9D    call        @IntfClear
 00593AA2    pop         ebx
 00593AA3    ret
*}
end;

//00593AA4
procedure TXMLDocument.LoadFromFile(AFileName:string);
begin
{*
 00593AA4    push        ebp
 00593AA5    mov         ebp,esp
 00593AA7    push        0
 00593AA9    push        0
 00593AAB    push        ebx
 00593AAC    push        esi
 00593AAD    mov         esi,edx
 00593AAF    mov         ebx,eax
 00593AB1    xor         eax,eax
 00593AB3    push        ebp
 00593AB4    push        593B2F
 00593AB9    push        dword ptr fs:[eax]
 00593ABC    mov         dword ptr fs:[eax],esp
 00593ABF    xor         edx,edx
 00593AC1    mov         eax,ebx
 00593AC3    mov         ecx,dword ptr [eax]
 00593AC5    call        dword ptr [ecx+38]
 00593AC8    test        esi,esi
>00593ACA    je          00593AD5
 00593ACC    mov         edx,esi
 00593ACE    mov         eax,ebx
 00593AD0    call        TXMLDocument.SetFileName
 00593AD5    lea         edx,[ebp-4]
 00593AD8    mov         eax,ebx
 00593ADA    call        TXMLDocument.GetFileName
 00593ADF    cmp         dword ptr [ebp-4],0
>00593AE3    jne         00593AFA
 00593AE5    lea         edx,[ebp-8]
 00593AE8    mov         eax,[0078CE08];^SResString600:TResStringRec
 00593AED    call        LoadResString
 00593AF2    mov         eax,dword ptr [ebp-8]
 00593AF5    call        XMLDocError
 00593AFA    lea         eax,[ebx+34]
 00593AFD    call        @UStrClr
 00593B02    xor         edx,edx
 00593B04    mov         eax,ebx
 00593B06    call        TXMLDocument.SetXMLStrings
 00593B0B    mov         dl,1
 00593B0D    mov         eax,ebx
 00593B0F    mov         ecx,dword ptr [eax]
 00593B11    call        dword ptr [ecx+38]
 00593B14    xor         eax,eax
 00593B16    pop         edx
 00593B17    pop         ecx
 00593B18    pop         ecx
 00593B19    mov         dword ptr fs:[eax],edx
 00593B1C    push        593B36
 00593B21    lea         eax,[ebp-8]
 00593B24    mov         edx,2
 00593B29    call        @UStrArrayClr
 00593B2E    ret
>00593B2F    jmp         @HandleFinally
>00593B34    jmp         00593B21
 00593B36    pop         esi
 00593B37    pop         ebx
 00593B38    pop         ecx
 00593B39    pop         ecx
 00593B3A    pop         ebp
 00593B3B    ret
*}
end;

//00593B3C
procedure TXMLDocument.SaveToFile(AFileName:string);
begin
{*
 00593B3C    push        ebp
 00593B3D    mov         ebp,esp
 00593B3F    mov         ecx,5
 00593B44    push        0
 00593B46    push        0
 00593B48    dec         ecx
>00593B49    jne         00593B44
 00593B4B    push        ebx
 00593B4C    push        esi
 00593B4D    mov         esi,edx
 00593B4F    mov         ebx,eax
 00593B51    xor         eax,eax
 00593B53    push        ebp
 00593B54    push        593C00
 00593B59    push        dword ptr fs:[eax]
 00593B5C    mov         dword ptr fs:[eax],esp
 00593B5F    mov         eax,ebx
 00593B61    call        TXMLDocument.CheckActive
 00593B66    test        esi,esi
>00593B68    jne         00593B9B
 00593B6A    lea         eax,[ebp-10]
 00593B6D    mov         edx,dword ptr [ebx+64]
 00593B70    call        @OleVarFromUStr
 00593B75    push        dword ptr [ebp-4]
 00593B78    push        dword ptr [ebp-8]
 00593B7B    push        dword ptr [ebp-0C]
 00593B7E    push        dword ptr [ebp-10]
 00593B81    lea         edx,[ebp-14]
 00593B84    mov         eax,ebx
 00593B86    call        TXMLDocument.GetDOMPersist
 00593B8B    mov         eax,dword ptr [ebp-14]
 00593B8E    push        eax
 00593B8F    mov         eax,dword ptr [eax]
 00593B91    call        dword ptr [eax+20]
 00593B94    call        @CheckAutoResult
>00593B99    jmp         00593BC9
 00593B9B    lea         eax,[ebp-24]
 00593B9E    mov         edx,esi
 00593BA0    call        @OleVarFromUStr
 00593BA5    push        dword ptr [ebp-18]
 00593BA8    push        dword ptr [ebp-1C]
 00593BAB    push        dword ptr [ebp-20]
 00593BAE    push        dword ptr [ebp-24]
 00593BB1    lea         edx,[ebp-28]
 00593BB4    mov         eax,ebx
 00593BB6    call        TXMLDocument.GetDOMPersist
 00593BBB    mov         eax,dword ptr [ebp-28]
 00593BBE    push        eax
 00593BBF    mov         eax,dword ptr [eax]
 00593BC1    call        dword ptr [eax+20]
 00593BC4    call        @CheckAutoResult
 00593BC9    xor         edx,edx
 00593BCB    mov         eax,ebx
 00593BCD    call        TXMLDocument.SetModified
 00593BD2    xor         eax,eax
 00593BD4    pop         edx
 00593BD5    pop         ecx
 00593BD6    pop         ecx
 00593BD7    mov         dword ptr fs:[eax],edx
 00593BDA    push        593C07
 00593BDF    lea         eax,[ebp-28]
 00593BE2    call        @IntfClear
 00593BE7    lea         eax,[ebp-24]
 00593BEA    call        @VarClr
 00593BEF    lea         eax,[ebp-14]
 00593BF2    call        @IntfClear
 00593BF7    lea         eax,[ebp-10]
 00593BFA    call        @VarClr
 00593BFF    ret
>00593C00    jmp         @HandleFinally
>00593C05    jmp         00593BDF
 00593C07    pop         esi
 00593C08    pop         ebx
 00593C09    mov         esp,ebp
 00593C0B    pop         ebp
 00593C0C    ret
*}
end;

//00593C10
procedure TXMLDocument.XMLStringsChanging(Sender:TObject);
begin
{*
 00593C10    push        ebx
 00593C11    mov         ebx,eax
 00593C13    test        byte ptr [ebx+1C],1
>00593C17    jne         00593C2D
 00593C19    mov         eax,ebx
 00593C1B    mov         edx,dword ptr [eax]
 00593C1D    call        dword ptr [edx+34]
 00593C20    test        al,al
>00593C22    je          00593C2D
 00593C24    xor         edx,edx
 00593C26    mov         eax,ebx
 00593C28    mov         ecx,dword ptr [eax]
 00593C2A    call        dword ptr [ecx+38]
 00593C2D    lea         eax,[ebx+64]
 00593C30    call        @UStrClr
 00593C35    pop         ebx
 00593C36    ret
*}
end;

//00593C38
procedure TXMLDocument.SetXMLStrings(const Value:UnicodeString);
begin
{*
 00593C38    push        ebp
 00593C39    mov         ebp,esp
 00593C3B    push        ecx
 00593C3C    push        esi
 00593C3D    mov         dword ptr [ebp-4],eax
 00593C40    mov         eax,dword ptr [ebp-4]
 00593C43    mov         esi,dword ptr [eax+3C]
 00593C46    xor         eax,eax
 00593C48    mov         dword ptr [esi+48],eax
 00593C4B    mov         dword ptr [esi+4C],eax
 00593C4E    xor         eax,eax
 00593C50    push        ebp
 00593C51    push        593C84
 00593C56    push        dword ptr fs:[eax]
 00593C59    mov         dword ptr fs:[eax],esp
 00593C5C    mov         eax,esi
 00593C5E    mov         ecx,dword ptr [eax]
 00593C60    call        dword ptr [ecx+2C]
 00593C63    xor         eax,eax
 00593C65    pop         edx
 00593C66    pop         ecx
 00593C67    pop         ecx
 00593C68    mov         dword ptr fs:[eax],edx
 00593C6B    push        593C8B
 00593C70    mov         eax,dword ptr [ebp-4]
 00593C73    mov         eax,dword ptr [eax+3C]
 00593C76    mov         edx,dword ptr [ebp-4]
 00593C79    mov         dword ptr [eax+4C],edx
 00593C7C    mov         dword ptr [eax+48],593C10;TXMLDocument.XMLStringsChanging
 00593C83    ret
>00593C84    jmp         @HandleFinally
>00593C89    jmp         00593C70
 00593C8B    pop         esi
 00593C8C    pop         ecx
 00593C8D    pop         ebp
 00593C8E    ret
*}
end;

//00593C90
procedure TXMLDocument.SaveToXMLStrings;
begin
{*
 00593C90    push        ebp
 00593C91    mov         ebp,esp
 00593C93    push        0
 00593C95    push        ebx
 00593C96    mov         ebx,eax
 00593C98    xor         eax,eax
 00593C9A    push        ebp
 00593C9B    push        593CE4
 00593CA0    push        dword ptr fs:[eax]
 00593CA3    mov         dword ptr fs:[eax],esp
 00593CA6    mov         eax,dword ptr [ebx+80]
 00593CAC    cmp         eax,dword ptr [ebx+7C]
>00593CAF    je          00593CCE
 00593CB1    lea         edx,[ebp-4]
 00593CB4    mov         eax,ebx
 00593CB6    call        TXMLDocument.SaveToXML
 00593CBB    mov         edx,dword ptr [ebp-4]
 00593CBE    mov         eax,ebx
 00593CC0    call        TXMLDocument.SetXMLStrings
 00593CC5    mov         eax,dword ptr [ebx+7C]
 00593CC8    mov         dword ptr [ebx+80],eax
 00593CCE    xor         eax,eax
 00593CD0    pop         edx
 00593CD1    pop         ecx
 00593CD2    pop         ecx
 00593CD3    mov         dword ptr fs:[eax],edx
 00593CD6    push        593CEB
 00593CDB    lea         eax,[ebp-4]
 00593CDE    call        @UStrClr
 00593CE3    ret
>00593CE4    jmp         @HandleFinally
>00593CE9    jmp         00593CDB
 00593CEB    pop         ebx
 00593CEC    pop         ecx
 00593CED    pop         ebp
 00593CEE    ret
*}
end;

//00593CF0
function TXMLDocument.GetXML:TStrings;
begin
{*
 00593CF0    push        ebx
 00593CF1    mov         ebx,eax
 00593CF3    mov         eax,ebx
 00593CF5    mov         edx,dword ptr [eax]
 00593CF7    call        dword ptr [edx+34]
 00593CFA    test        al,al
>00593CFC    je          00593D05
 00593CFE    mov         eax,ebx
 00593D00    call        TXMLDocument.SaveToXMLStrings
 00593D05    mov         eax,dword ptr [ebx+3C]
 00593D08    pop         ebx
 00593D09    ret
*}
end;

//00593D0C
procedure TXMLDocument.SetXML(const Value:TStrings);
begin
{*
 00593D0C    mov         eax,dword ptr [eax+3C]
 00593D0F    mov         ecx,dword ptr [eax]
 00593D11    call        dword ptr [ecx+8]
 00593D14    ret
*}
end;

//00593D18
procedure TXMLDocument.LoadFromStream(Stream:TStream; EncodingType:TXMLEncodingType);
begin
{*
 00593D18    push        ebx
 00593D19    push        esi
 00593D1A    mov         esi,edx
 00593D1C    mov         ebx,eax
 00593D1E    xor         edx,edx
 00593D20    mov         eax,ebx
 00593D22    mov         ecx,dword ptr [eax]
 00593D24    call        dword ptr [ecx+38]
 00593D27    xor         edx,edx
 00593D29    mov         eax,ebx
 00593D2B    call        TXMLDocument.SetXMLStrings
 00593D30    lea         eax,[ebx+34]
 00593D33    call        @UStrClr
 00593D38    mov         dword ptr [ebx+38],esi
 00593D3B    mov         dl,1
 00593D3D    mov         eax,ebx
 00593D3F    mov         ecx,dword ptr [eax]
 00593D41    call        dword ptr [ecx+38]
 00593D44    pop         esi
 00593D45    pop         ebx
 00593D46    ret
*}
end;

//00593D48
procedure TXMLDocument.SaveToStream(Stream:TStream);
begin
{*
 00593D48    push        ebp
 00593D49    mov         ebp,esp
 00593D4B    push        0
 00593D4D    push        ebx
 00593D4E    push        esi
 00593D4F    mov         esi,edx
 00593D51    mov         ebx,eax
 00593D53    xor         eax,eax
 00593D55    push        ebp
 00593D56    push        593DA0
 00593D5B    push        dword ptr fs:[eax]
 00593D5E    mov         dword ptr fs:[eax],esp
 00593D61    mov         eax,ebx
 00593D63    call        TXMLDocument.CheckActive
 00593D68    push        esi
 00593D69    lea         edx,[ebp-4]
 00593D6C    mov         eax,ebx
 00593D6E    call        TXMLDocument.GetDOMPersist
 00593D73    mov         eax,dword ptr [ebp-4]
 00593D76    push        eax
 00593D77    mov         eax,dword ptr [eax]
 00593D79    call        dword ptr [eax+24]
 00593D7C    call        @CheckAutoResult
 00593D81    xor         edx,edx
 00593D83    mov         eax,ebx
 00593D85    call        TXMLDocument.SetModified
 00593D8A    xor         eax,eax
 00593D8C    pop         edx
 00593D8D    pop         ecx
 00593D8E    pop         ecx
 00593D8F    mov         dword ptr fs:[eax],edx
 00593D92    push        593DA7
 00593D97    lea         eax,[ebp-4]
 00593D9A    call        @IntfClear
 00593D9F    ret
>00593DA0    jmp         @HandleFinally
>00593DA5    jmp         00593D97
 00593DA7    pop         esi
 00593DA8    pop         ebx
 00593DA9    pop         ecx
 00593DAA    pop         ebp
 00593DAB    ret
*}
end;

//00593DAC
procedure TXMLDocument.LoadFromXML(XML:string);
begin
{*
 00593DAC    push        ebx
 00593DAD    push        esi
 00593DAE    mov         esi,edx
 00593DB0    mov         ebx,eax
 00593DB2    xor         edx,edx
 00593DB4    mov         eax,ebx
 00593DB6    mov         ecx,dword ptr [eax]
 00593DB8    call        dword ptr [ecx+38]
 00593DBB    xor         edx,edx
 00593DBD    mov         eax,ebx
 00593DBF    call        TXMLDocument.SetXMLStrings
 00593DC4    lea         eax,[ebx+34]
 00593DC7    mov         edx,esi
 00593DC9    call        @UStrAsg
 00593DCE    mov         dl,1
 00593DD0    mov         eax,ebx
 00593DD2    mov         ecx,dword ptr [eax]
 00593DD4    call        dword ptr [ecx+38]
 00593DD7    pop         esi
 00593DD8    pop         ebx
 00593DD9    ret
*}
end;

//00593DDC
procedure TXMLDocument.LoadFromXML(XML:AnsiString);
begin
{*
 00593DDC    push        ebp
 00593DDD    mov         ebp,esp
 00593DDF    push        ecx
 00593DE0    push        ebx
 00593DE1    mov         ebx,eax
 00593DE3    mov         ecx,edx
 00593DE5    mov         eax,[0043DE64];TStringStream
 00593DEA    mov         dl,1
 00593DEC    call        TStringStream.Create
 00593DF1    mov         dword ptr [ebp-4],eax
 00593DF4    xor         eax,eax
 00593DF6    push        ebp
 00593DF7    push        593E24
 00593DFC    push        dword ptr fs:[eax]
 00593DFF    mov         dword ptr fs:[eax],esp
 00593E02    xor         ecx,ecx
 00593E04    mov         edx,dword ptr [ebp-4]
 00593E07    mov         eax,ebx
 00593E09    call        TXMLDocument.LoadFromStream
 00593E0E    xor         eax,eax
 00593E10    pop         edx
 00593E11    pop         ecx
 00593E12    pop         ecx
 00593E13    mov         dword ptr fs:[eax],edx
 00593E16    push        593E2B
 00593E1B    mov         eax,dword ptr [ebp-4]
 00593E1E    call        TObject.Free
 00593E23    ret
>00593E24    jmp         @HandleFinally
>00593E29    jmp         00593E1B
 00593E2B    pop         ebx
 00593E2C    pop         ecx
 00593E2D    pop         ebp
 00593E2E    ret
*}
end;

//00593E30
procedure TXMLDocument.SaveToXML(var XML:string);
begin
{*
 00593E30    push        ebp
 00593E31    mov         ebp,esp
 00593E33    push        0
 00593E35    push        0
 00593E37    push        ebx
 00593E38    push        esi
 00593E39    mov         esi,edx
 00593E3B    mov         ebx,eax
 00593E3D    xor         eax,eax
 00593E3F    push        ebp
 00593E40    push        593E9B
 00593E45    push        dword ptr fs:[eax]
 00593E48    mov         dword ptr fs:[eax],esp
 00593E4B    mov         eax,ebx
 00593E4D    call        TXMLDocument.CheckActive
 00593E52    lea         eax,[ebp-4]
 00593E55    call        @UStrClr
 00593E5A    push        eax
 00593E5B    lea         edx,[ebp-8]
 00593E5E    mov         eax,ebx
 00593E60    call        TXMLDocument.GetDOMPersist
 00593E65    mov         eax,dword ptr [ebp-8]
 00593E68    push        eax
 00593E69    mov         eax,dword ptr [eax]
 00593E6B    call        dword ptr [eax+0C]
 00593E6E    call        @CheckAutoResult
 00593E73    mov         edx,dword ptr [ebp-4]
 00593E76    mov         eax,esi
 00593E78    call        @UStrAsg
 00593E7D    xor         eax,eax
 00593E7F    pop         edx
 00593E80    pop         ecx
 00593E81    pop         ecx
 00593E82    mov         dword ptr fs:[eax],edx
 00593E85    push        593EA2
 00593E8A    lea         eax,[ebp-8]
 00593E8D    call        @IntfClear
 00593E92    lea         eax,[ebp-4]
 00593E95    call        @UStrClr
 00593E9A    ret
>00593E9B    jmp         @HandleFinally
>00593EA0    jmp         00593E8A
 00593EA2    pop         esi
 00593EA3    pop         ebx
 00593EA4    pop         ecx
 00593EA5    pop         ecx
 00593EA6    pop         ebp
 00593EA7    ret
*}
end;

//00593EA8
procedure TXMLDocument.SaveToXML(var XML:WideString);
begin
{*
 00593EA8    push        ebp
 00593EA9    mov         ebp,esp
 00593EAB    push        0
 00593EAD    push        0
 00593EAF    push        ebx
 00593EB0    push        esi
 00593EB1    mov         esi,edx
 00593EB3    mov         ebx,eax
 00593EB5    xor         eax,eax
 00593EB7    push        ebp
 00593EB8    push        593F13
 00593EBD    push        dword ptr fs:[eax]
 00593EC0    mov         dword ptr fs:[eax],esp
 00593EC3    mov         eax,ebx
 00593EC5    call        TXMLDocument.CheckActive
 00593ECA    lea         eax,[ebp-4]
 00593ECD    call        @UStrClr
 00593ED2    push        eax
 00593ED3    lea         edx,[ebp-8]
 00593ED6    mov         eax,ebx
 00593ED8    call        TXMLDocument.GetDOMPersist
 00593EDD    mov         eax,dword ptr [ebp-8]
 00593EE0    push        eax
 00593EE1    mov         eax,dword ptr [eax]
 00593EE3    call        dword ptr [eax+0C]
 00593EE6    call        @CheckAutoResult
 00593EEB    mov         edx,dword ptr [ebp-4]
 00593EEE    mov         eax,esi
 00593EF0    call        @WStrFromUStr
 00593EF5    xor         eax,eax
 00593EF7    pop         edx
 00593EF8    pop         ecx
 00593EF9    pop         ecx
 00593EFA    mov         dword ptr fs:[eax],edx
 00593EFD    push        593F1A
 00593F02    lea         eax,[ebp-8]
 00593F05    call        @IntfClear
 00593F0A    lea         eax,[ebp-4]
 00593F0D    call        @UStrClr
 00593F12    ret
>00593F13    jmp         @HandleFinally
>00593F18    jmp         00593F02
 00593F1A    pop         esi
 00593F1B    pop         ebx
 00593F1C    pop         ecx
 00593F1D    pop         ecx
 00593F1E    pop         ebp
 00593F1F    ret
*}
end;

//00593F20
procedure TXMLDocument.SaveToXML(var XML:UTF8String);
begin
{*
 00593F20    push        ebp
 00593F21    mov         ebp,esp
 00593F23    push        ecx
 00593F24    push        ebx
 00593F25    push        esi
 00593F26    mov         esi,edx
 00593F28    mov         ebx,eax
 00593F2A    mov         eax,ebx
 00593F2C    call        TXMLDocument.IsEmptyDoc
 00593F31    test        al,al
>00593F33    jne         00593FD7
 00593F39    mov         dl,1
 00593F3B    mov         eax,[0043DAFC];TMemoryStream
 00593F40    call        TObject.Create
 00593F45    mov         dword ptr [ebp-4],eax
 00593F48    xor         eax,eax
 00593F4A    push        ebp
 00593F4B    push        593FD0
 00593F50    push        dword ptr fs:[eax]
 00593F53    mov         dword ptr fs:[eax],esp
 00593F56    mov         edx,dword ptr [ebp-4]
 00593F59    mov         eax,ebx
 00593F5B    call        TXMLDocument.SaveToStream
 00593F60    mov         eax,dword ptr [ebp-4]
 00593F63    call        DetectCharEncoding
 00593F68    test        al,al
>00593F6A    je          00593F74
 00593F6C    sub         al,7
>00593F6E    je          00593F74
 00593F70    sub         al,4
>00593F72    jne         00593FB1
 00593F74    mov         eax,dword ptr [ebp-4]
 00593F77    mov         edx,dword ptr [eax]
 00593F79    call        dword ptr [edx]
 00593F7B    mov         edx,eax
 00593F7D    mov         eax,esi
 00593F7F    mov         ecx,0FDE9
 00593F84    call        @LStrSetLength
 00593F89    push        0
 00593F8B    push        0
 00593F8D    mov         eax,dword ptr [ebp-4]
 00593F90    call        TStream.SetPosition
 00593F95    mov         eax,dword ptr [ebp-4]
 00593F98    mov         edx,dword ptr [eax]
 00593F9A    call        dword ptr [edx]
 00593F9C    push        eax
 00593F9D    mov         eax,esi
 00593F9F    call        @UniqueStringA
 00593FA4    mov         edx,eax
 00593FA6    mov         eax,dword ptr [ebp-4]
 00593FA9    pop         ecx
 00593FAA    mov         ebx,dword ptr [eax]
 00593FAC    call        dword ptr [ebx+0C]
>00593FAF    jmp         00593FBA
 00593FB1    mov         edx,esi
 00593FB3    mov         eax,ebx
 00593FB5    call        TXMLDocument.SaveToUTF8String
 00593FBA    xor         eax,eax
 00593FBC    pop         edx
 00593FBD    pop         ecx
 00593FBE    pop         ecx
 00593FBF    mov         dword ptr fs:[eax],edx
 00593FC2    push        593FDE
 00593FC7    mov         eax,dword ptr [ebp-4]
 00593FCA    call        TObject.Free
 00593FCF    ret
>00593FD0    jmp         @HandleFinally
>00593FD5    jmp         00593FC7
 00593FD7    mov         eax,esi
 00593FD9    call        @LStrClr
 00593FDE    pop         esi
 00593FDF    pop         ebx
 00593FE0    pop         ecx
 00593FE1    pop         ebp
 00593FE2    ret
*}
end;

//00593FE4
procedure TXMLDocument.SaveToUTF8String(var XML:UTF8String);
begin
{*
 00593FE4    push        ebp
 00593FE5    mov         ebp,esp
 00593FE7    mov         ecx,7
 00593FEC    push        0
 00593FEE    push        0
 00593FF0    dec         ecx
>00593FF1    jne         00593FEC
 00593FF3    push        ebx
 00593FF4    push        esi
 00593FF5    mov         ebx,edx
 00593FF7    mov         esi,eax
 00593FF9    xor         eax,eax
 00593FFB    push        ebp
 00593FFC    push        5941AB
 00594001    push        dword ptr fs:[eax]
 00594004    mov         dword ptr fs:[eax],esp
 00594007    lea         edx,[ebp-4]
 0059400A    mov         eax,esi
 0059400C    call        TXMLDocument.SaveToXML
 00594011    mov         edx,ebx
 00594013    mov         eax,dword ptr [ebp-4]
 00594016    call        UTF8Encode
 0059401B    lea         eax,[ebp-14]
 0059401E    call        @IntfClear
 00594023    push        eax
 00594024    push        5941B8
 00594029    lea         edx,[ebp-18]
 0059402C    mov         eax,esi
 0059402E    call        TXMLDocument.GetDOMDocument
 00594033    mov         eax,dword ptr [ebp-18]
 00594036    push        eax
 00594037    mov         eax,dword ptr [eax]
 00594039    call        dword ptr [eax]
 0059403B    test        eax,eax
>0059403D    jne         005940A1
 0059403F    lea         eax,[ebp-1C]
 00594042    call        @UStrClr
 00594047    push        eax
 00594048    mov         eax,dword ptr [ebp-14]
 0059404B    push        eax
 0059404C    mov         eax,dword ptr [eax]
 0059404E    call        dword ptr [eax+14]
 00594051    call        @CheckAutoResult
 00594056    mov         ecx,dword ptr [ebp-1C]
 00594059    lea         eax,[ebp-0C]
 0059405C    mov         edx,5941D4;'version'
 00594061    call        AppendItem
 00594066    lea         eax,[ebp-20]
 00594069    call        @UStrClr
 0059406E    push        eax
 0059406F    mov         eax,dword ptr [ebp-14]
 00594072    push        eax
 00594073    mov         eax,dword ptr [eax]
 00594075    call        dword ptr [eax+10]
 00594078    call        @CheckAutoResult
 0059407D    mov         ecx,dword ptr [ebp-20]
 00594080    lea         eax,[ebp-0C]
 00594083    mov         edx,5941F0;'standalone'
 00594088    call        AppendItem
 0059408D    lea         eax,[ebp-0C]
 00594090    mov         ecx,594214;'UTF-8'
 00594095    mov         edx,59422C;'encoding'
 0059409A    call        AppendItem
>0059409F    jmp         005940CB
 005940A1    lea         edx,[ebp-8]
 005940A4    mov         eax,esi
 005940A6    call        TXMLDocument.GetPrologNode
 005940AB    push        1
 005940AD    lea         eax,[ebp-0C]
 005940B0    push        eax
 005940B1    lea         eax,[ebp-30]
 005940B4    mov         edx,594214;'UTF-8'
 005940B9    call        @VarFromUStr
 005940BE    lea         ecx,[ebp-30]
 005940C1    mov         edx,dword ptr [ebp-8]
 005940C4    mov         eax,esi
 005940C6    call        TXMLDocument.InternalSetPrologValue
 005940CB    push        59424C;'<?xml '
 005940D0    push        dword ptr [ebp-0C]
 005940D3    push        594268;'?>'
 005940D8    lea         eax,[ebp-10]
 005940DB    mov         edx,3
 005940E0    call        @UStrCatN
 005940E5    lea         eax,[ebp-34]
 005940E8    push        eax
 005940E9    mov         eax,dword ptr [ebx]
 005940EB    mov         ecx,5
 005940F0    mov         edx,1
 005940F5    call        @LStrCopy
 005940FA    mov         eax,dword ptr [ebp-34]
 005940FD    mov         edx,59427C;'<?xml'
 00594102    call        @LStrEqual
>00594107    jne         00594125
 00594109    mov         edx,dword ptr [ebx]
 0059410B    mov         eax,594290;'>'
 00594110    call        Pos
 00594115    mov         ecx,eax
 00594117    mov         eax,ebx
 00594119    mov         edx,1
 0059411E    call        @LStrDelete
>00594123    jmp         00594132
 00594125    lea         eax,[ebp-10]
 00594128    mov         edx,5942A0;'
'
 0059412D    call        @UStrCat
 00594132    lea         eax,[ebp-38]
 00594135    mov         edx,dword ptr [ebp-10]
 00594138    mov         ecx,0FDE9
 0059413D    call        @LStrFromUStr
 00594142    mov         edx,dword ptr [ebp-38]
 00594145    mov         ecx,dword ptr [ebx]
 00594147    mov         eax,ebx
 00594149    call        @LStrCat3
 0059414E    xor         eax,eax
 00594150    pop         edx
 00594151    pop         ecx
 00594152    pop         ecx
 00594153    mov         dword ptr fs:[eax],edx
 00594156    push        5941B2
 0059415B    lea         eax,[ebp-38]
 0059415E    mov         edx,2
 00594163    call        @LStrArrayClr
 00594168    lea         eax,[ebp-30]
 0059416B    call        @VarClr
 00594170    lea         eax,[ebp-20]
 00594173    mov         edx,2
 00594178    call        @UStrArrayClr
 0059417D    lea         eax,[ebp-18]
 00594180    call        @IntfClear
 00594185    lea         eax,[ebp-14]
 00594188    call        @IntfClear
 0059418D    lea         eax,[ebp-10]
 00594190    mov         edx,2
 00594195    call        @UStrArrayClr
 0059419A    lea         eax,[ebp-8]
 0059419D    call        @IntfClear
 005941A2    lea         eax,[ebp-4]
 005941A5    call        @UStrClr
 005941AA    ret
>005941AB    jmp         @HandleFinally
>005941B0    jmp         0059415B
 005941B2    pop         esi
 005941B3    pop         ebx
 005941B4    mov         esp,ebp
 005941B6    pop         ebp
 005941B7    ret
*}
end;

//005942A8
procedure TXMLDocument.CheckDOM;
begin
{*
 005942A8    push        ebp
 005942A9    mov         ebp,esp
 005942AB    push        0
 005942AD    push        0
 005942AF    push        ebx
 005942B0    push        esi
 005942B1    mov         ebx,eax
 005942B3    xor         eax,eax
 005942B5    push        ebp
 005942B6    push        594320
 005942BB    push        dword ptr fs:[eax]
 005942BE    mov         dword ptr fs:[eax],esp
 005942C1    cmp         dword ptr [ebx+54],0
>005942C5    jne         005942FF
 005942C7    mov         esi,dword ptr [ebx+40]
 005942CA    test        esi,esi
>005942CC    je          005942E5
 005942CE    lea         edx,[ebp-4]
 005942D1    mov         eax,esi
 005942D3    mov         ecx,dword ptr [eax]
 005942D5    call        dword ptr [ecx+4]
 005942D8    mov         edx,dword ptr [ebp-4]
 005942DB    lea         eax,[ebx+54]
 005942DE    call        @IntfCopy
>005942E3    jmp         005942FF
 005942E5    lea         edx,[ebp-8]
 005942E8    mov         eax,[0078D640];^DefaultDOMVendor:UnicodeString
 005942ED    mov         eax,dword ptr [eax]
 005942EF    call        GetDOM
 005942F4    mov         edx,dword ptr [ebp-8]
 005942F7    lea         eax,[ebx+54]
 005942FA    call        @IntfCopy
 005942FF    xor         eax,eax
 00594301    pop         edx
 00594302    pop         ecx
 00594303    pop         ecx
 00594304    mov         dword ptr fs:[eax],edx
 00594307    push        594327
 0059430C    lea         eax,[ebp-8]
 0059430F    mov         edx,dword ptr ds:[589710];IDOMImplementation
 00594315    mov         ecx,2
 0059431A    call        @FinalizeArray
 0059431F    ret
>00594320    jmp         @HandleFinally
>00594325    jmp         0059430C
 00594327    pop         esi
 00594328    pop         ebx
 00594329    pop         ecx
 0059432A    pop         ecx
 0059432B    pop         ebp
 0059432C    ret
*}
end;

//00594330
function TXMLDocument.GetDOMParseOptions:IDOMParseOptions;
begin
{*
 00594330    push        ebx
 00594331    push        esi
 00594332    mov         esi,edx
 00594334    mov         ebx,eax
 00594336    cmp         dword ptr [ebx+50],0
>0059433A    je          00594358
 0059433C    cmp         dword ptr [ebx+58],0
>00594340    jne         00594358
 00594342    lea         eax,[ebx+58]
 00594345    call        @IntfClear
 0059434A    push        eax
 0059434B    push        594368
 00594350    mov         eax,dword ptr [ebx+50]
 00594353    push        eax
 00594354    mov         eax,dword ptr [eax]
 00594356    call        dword ptr [eax]
 00594358    mov         eax,esi
 0059435A    mov         edx,dword ptr [ebx+58]
 0059435D    call        @IntfCopy
 00594362    pop         esi
 00594363    pop         ebx
 00594364    ret
*}
end;

//00594378
function TXMLDocument.GetDOMPersist:IDOMPersist;
begin
{*
 00594378    push        ebx
 00594379    push        esi
 0059437A    mov         esi,edx
 0059437C    mov         ebx,eax
 0059437E    cmp         dword ptr [ebx+4C],0
>00594382    jne         00594394
 00594384    lea         eax,[ebx+4C]
 00594387    mov         edx,dword ptr [ebx+50]
 0059438A    mov         ecx,5943A4
 0059438F    call        @IntfCast
 00594394    mov         eax,esi
 00594396    mov         edx,dword ptr [ebx+4C]
 00594399    call        @IntfCopy
 0059439E    pop         esi
 0059439F    pop         ebx
 005943A0    ret
*}
end;

//005943B4
procedure TXMLDocument.CheckActive;
begin
{*
 005943B4    push        ebp
 005943B5    mov         ebp,esp
 005943B7    push        0
 005943B9    push        ebx
 005943BA    push        esi
 005943BB    mov         ebx,eax
 005943BD    xor         eax,eax
 005943BF    push        ebp
 005943C0    push        594407
 005943C5    push        dword ptr fs:[eax]
 005943C8    mov         dword ptr fs:[eax],esp
 005943CB    mov         eax,ebx
 005943CD    mov         si,0FFEF
 005943D1    call        @CallDynaInst
 005943D6    cmp         dword ptr [ebx+50],0
>005943DA    jne         005943F1
 005943DC    lea         edx,[ebp-4]
 005943DF    mov         eax,[0078CCFC];^SResString589:TResStringRec
 005943E4    call        LoadResString
 005943E9    mov         eax,dword ptr [ebp-4]
 005943EC    call        XMLDocError
 005943F1    xor         eax,eax
 005943F3    pop         edx
 005943F4    pop         ecx
 005943F5    pop         ecx
 005943F6    mov         dword ptr fs:[eax],edx
 005943F9    push        59440E
 005943FE    lea         eax,[ebp-4]
 00594401    call        @UStrClr
 00594406    ret
>00594407    jmp         @HandleFinally
>0059440C    jmp         005943FE
 0059440E    pop         esi
 0059440F    pop         ebx
 00594410    pop         ecx
 00594411    pop         ebp
 00594412    ret
*}
end;

//00594414
procedure TXMLDocument.CheckAutoSave;
begin
{*
 00594414    push        ebp
 00594415    mov         ebp,esp
 00594417    push        0
 00594419    push        esi
 0059441A    mov         esi,eax
 0059441C    xor         eax,eax
 0059441E    push        ebp
 0059441F    push        594483
 00594424    push        dword ptr fs:[eax]
 00594427    mov         dword ptr fs:[eax],esp
 0059442A    test        byte ptr [esi+68],20
>0059442E    je          0059446D
 00594430    mov         eax,esi
 00594432    call        TXMLDocument.GetModified
 00594437    test        al,al
>00594439    je          0059446D
 0059443B    movzx       eax,byte ptr [esi+84]
 00594442    dec         al
>00594444    je          0059444C
 00594446    sub         al,2
>00594448    je          00594455
>0059444A    jmp         0059446D
 0059444C    mov         eax,esi
 0059444E    call        TXMLDocument.SaveToXMLStrings
>00594453    jmp         0059446D
 00594455    lea         edx,[ebp-4]
 00594458    mov         eax,esi
 0059445A    call        TXMLDocument.GetFileName
 0059445F    mov         edx,dword ptr [ebp-4]
 00594462    mov         eax,esi
 00594464    mov         si,0FFE8
 00594468    call        @CallDynaInst
 0059446D    xor         eax,eax
 0059446F    pop         edx
 00594470    pop         ecx
 00594471    pop         ecx
 00594472    mov         dword ptr fs:[eax],edx
 00594475    push        59448A
 0059447A    lea         eax,[ebp-4]
 0059447D    call        @UStrClr
 00594482    ret
>00594483    jmp         @HandleFinally
>00594488    jmp         0059447A
 0059448A    pop         esi
 0059448B    pop         ecx
 0059448C    pop         ebp
 0059448D    ret
*}
end;

//00594490
procedure TXMLDocument.AssignParseOptions;
begin
{*
 00594490    push        ebp
 00594491    mov         ebp,esp
 00594493    xor         ecx,ecx
 00594495    push        ecx
 00594496    push        ecx
 00594497    push        ecx
 00594498    push        ecx
 00594499    push        ecx
 0059449A    push        ecx
 0059449B    push        ecx
 0059449C    push        ebx
 0059449D    mov         ebx,eax
 0059449F    xor         eax,eax
 005944A1    push        ebp
 005944A2    push        5945C4
 005944A7    push        dword ptr fs:[eax]
 005944AA    mov         dword ptr fs:[eax],esp
 005944AD    lea         edx,[ebp-4]
 005944B0    mov         eax,ebx
 005944B2    call        TXMLDocument.GetDOMParseOptions
 005944B7    cmp         dword ptr [ebp-4],0
>005944BB    je          00594572
 005944C1    test        byte ptr [ebx+5C],4
 005944C5    setne       al
 005944C8    push        eax
 005944C9    lea         edx,[ebp-8]
 005944CC    mov         eax,ebx
 005944CE    call        TXMLDocument.GetDOMParseOptions
 005944D3    mov         eax,dword ptr [ebp-8]
 005944D6    push        eax
 005944D7    mov         eax,dword ptr [eax]
 005944D9    call        dword ptr [eax+20]
 005944DC    call        @CheckAutoResult
 005944E1    test        byte ptr [ebx+5C],1
 005944E5    setne       al
 005944E8    push        eax
 005944E9    lea         edx,[ebp-0C]
 005944EC    mov         eax,ebx
 005944EE    call        TXMLDocument.GetDOMParseOptions
 005944F3    mov         eax,dword ptr [ebp-0C]
 005944F6    push        eax
 005944F7    mov         eax,dword ptr [eax]
 005944F9    call        dword ptr [eax+24]
 005944FC    call        @CheckAutoResult
 00594501    test        byte ptr [ebx+5C],2
 00594505    setne       al
 00594508    push        eax
 00594509    lea         edx,[ebp-10]
 0059450C    mov         eax,ebx
 0059450E    call        TXMLDocument.GetDOMParseOptions
 00594513    mov         eax,dword ptr [ebp-10]
 00594516    push        eax
 00594517    mov         eax,dword ptr [eax]
 00594519    call        dword ptr [eax+28]
 0059451C    call        @CheckAutoResult
 00594521    test        byte ptr [ebx+5C],8
 00594525    setne       al
 00594528    push        eax
 00594529    lea         edx,[ebp-14]
 0059452C    mov         eax,ebx
 0059452E    call        TXMLDocument.GetDOMParseOptions
 00594533    mov         eax,dword ptr [ebp-14]
 00594536    push        eax
 00594537    mov         eax,dword ptr [eax]
 00594539    call        dword ptr [eax+1C]
 0059453C    call        @CheckAutoResult
 00594541    cmp         word ptr [ebx+0C2],0
>00594549    je          00594593
 0059454B    push        dword ptr [ebx+0C4]
 00594551    push        dword ptr [ebx+0C0]
 00594557    push        ebx
 00594558    lea         edx,[ebp-18]
 0059455B    mov         eax,ebx
 0059455D    call        TXMLDocument.GetDOMPersist
 00594562    mov         eax,dword ptr [ebp-18]
 00594565    push        eax
 00594566    mov         eax,dword ptr [eax]
 00594568    call        dword ptr [eax+28]
 0059456B    call        @CheckAutoResult
>00594570    jmp         00594593
 00594572    movzx       eax,byte ptr ds:[5945D0]
 00594579    cmp         al,byte ptr [ebx+5C]
>0059457C    je          00594593
 0059457E    lea         edx,[ebp-1C]
 00594581    mov         eax,[0078D9AC];^SResString596:TResStringRec
 00594586    call        LoadResString
 0059458B    mov         eax,dword ptr [ebp-1C]
 0059458E    call        XMLDocError
 00594593    xor         eax,eax
 00594595    pop         edx
 00594596    pop         ecx
 00594597    pop         ecx
 00594598    mov         dword ptr fs:[eax],edx
 0059459B    push        5945CB
 005945A0    lea         eax,[ebp-1C]
 005945A3    call        @UStrClr
 005945A8    lea         eax,[ebp-18]
 005945AB    call        @IntfClear
 005945B0    lea         eax,[ebp-14]
 005945B3    mov         edx,dword ptr ds:[589C08];IDOMParseOptions
 005945B9    mov         ecx,5
 005945BE    call        @FinalizeArray
 005945C3    ret
>005945C4    jmp         @HandleFinally
>005945C9    jmp         005945A0
 005945CB    pop         ebx
 005945CC    mov         esp,ebp
 005945CE    pop         ebp
 005945CF    ret
*}
end;

//005945D4
function TXMLDocument.GeneratePrefix(Node:IXMLNode):string;
begin
{*
 005945D4    push        ebp
 005945D5    mov         ebp,esp
 005945D7    push        0
 005945D9    push        0
 005945DB    push        0
 005945DD    push        ebx
 005945DE    push        esi
 005945DF    push        edi
 005945E0    mov         esi,ecx
 005945E2    mov         dword ptr [ebp-4],edx
 005945E5    mov         ebx,eax
 005945E7    xor         eax,eax
 005945E9    push        ebp
 005945EA    push        59463E
 005945EF    push        dword ptr fs:[eax]
 005945F2    mov         dword ptr fs:[eax],esp
 005945F5    inc         dword ptr [ebx+6C]
 005945F8    lea         edx,[ebp-8]
 005945FB    mov         eax,dword ptr [ebx+6C]
 005945FE    call        IntToStr
 00594603    mov         ecx,dword ptr [ebp-8]
 00594606    mov         eax,esi
 00594608    mov         edx,dword ptr [ebx+70]
 0059460B    call        @UStrCat3
 00594610    lea         ecx,[ebp-0C]
 00594613    mov         edx,dword ptr [esi]
 00594615    mov         eax,dword ptr [ebp-4]
 00594618    mov         edi,dword ptr [eax]
 0059461A    call        dword ptr [edi+7C]
 0059461D    cmp         dword ptr [ebp-0C],0
>00594621    jne         005945F5
 00594623    xor         eax,eax
 00594625    pop         edx
 00594626    pop         ecx
 00594627    pop         ecx
 00594628    mov         dword ptr fs:[eax],edx
 0059462B    push        594645
 00594630    lea         eax,[ebp-0C]
 00594633    mov         edx,2
 00594638    call        @UStrArrayClr
 0059463D    ret
>0059463E    jmp         @HandleFinally
>00594643    jmp         00594630
 00594645    pop         edi
 00594646    pop         esi
 00594647    pop         ebx
 00594648    mov         esp,ebp
 0059464A    pop         ebp
 0059464B    ret
*}
end;

//0059464C
{*function sub_0059464C:?;
begin
 0059464C    xor         eax,eax
 0059464E    ret
end;*}

//00594650
function TXMLDocument.AddChild(TagName:string):IXMLNode;
begin
{*
 00594650    push        ebp
 00594651    mov         ebp,esp
 00594653    add         esp,0FFFFFFF8
 00594656    push        ebx
 00594657    push        esi
 00594658    xor         ebx,ebx
 0059465A    mov         dword ptr [ebp-8],ebx
 0059465D    mov         dword ptr [ebp-4],ecx
 00594660    mov         esi,edx
 00594662    mov         ebx,eax
 00594664    xor         eax,eax
 00594666    push        ebp
 00594667    push        5946A3
 0059466C    push        dword ptr fs:[eax]
 0059466F    mov         dword ptr fs:[eax],esp
 00594672    mov         eax,dword ptr [ebp-4]
 00594675    push        eax
 00594676    lea         edx,[ebp-8]
 00594679    mov         eax,ebx
 0059467B    call        TXMLDocument.GetDocumentNode
 00594680    mov         eax,dword ptr [ebp-8]
 00594683    or          ecx,0FFFFFFFF
 00594686    mov         edx,esi
 00594688    mov         ebx,dword ptr [eax]
 0059468A    call        dword ptr [ebx+6C]
 0059468D    xor         eax,eax
 0059468F    pop         edx
 00594690    pop         ecx
 00594691    pop         ecx
 00594692    mov         dword ptr fs:[eax],edx
 00594695    push        5946AA
 0059469A    lea         eax,[ebp-8]
 0059469D    call        @IntfClear
 005946A2    ret
>005946A3    jmp         @HandleFinally
>005946A8    jmp         0059469A
 005946AA    pop         esi
 005946AB    pop         ebx
 005946AC    pop         ecx
 005946AD    pop         ecx
 005946AE    pop         ebp
 005946AF    ret
*}
end;

//005946B0
function TXMLDocument.AddChild(TagName:string; NamespaceURI:string):IXMLNode;
begin
{*
 005946B0    push        ebp
 005946B1    mov         ebp,esp
 005946B3    add         esp,0FFFFFFF8
 005946B6    push        ebx
 005946B7    push        esi
 005946B8    xor         ebx,ebx
 005946BA    mov         dword ptr [ebp-8],ebx
 005946BD    mov         dword ptr [ebp-4],ecx
 005946C0    mov         esi,edx
 005946C2    mov         ebx,eax
 005946C4    xor         eax,eax
 005946C6    push        ebp
 005946C7    push        594707
 005946CC    push        dword ptr fs:[eax]
 005946CF    mov         dword ptr fs:[eax],esp
 005946D2    push        0
 005946D4    push        0FF
 005946D6    mov         eax,dword ptr [ebp+8]
 005946D9    push        eax
 005946DA    lea         edx,[ebp-8]
 005946DD    mov         eax,ebx
 005946DF    call        TXMLDocument.GetDocumentNode
 005946E4    mov         eax,dword ptr [ebp-8]
 005946E7    mov         ecx,dword ptr [ebp-4]
 005946EA    mov         edx,esi
 005946EC    mov         ebx,dword ptr [eax]
 005946EE    call        dword ptr [ebx+70]
 005946F1    xor         eax,eax
 005946F3    pop         edx
 005946F4    pop         ecx
 005946F5    pop         ecx
 005946F6    mov         dword ptr fs:[eax],edx
 005946F9    push        59470E
 005946FE    lea         eax,[ebp-8]
 00594701    call        @IntfClear
 00594706    ret
>00594707    jmp         @HandleFinally
>0059470C    jmp         005946FE
 0059470E    pop         esi
 0059470F    pop         ebx
 00594710    pop         ecx
 00594711    pop         ecx
 00594712    pop         ebp
 00594713    ret         4
*}
end;

//00594718
function TXMLDocument.CreateElement(TagOrData:string; NamespaceURI:string):IXMLNode;
begin
{*
 00594718    push        ebp
 00594719    mov         ebp,esp
 0059471B    push        ebx
 0059471C    push        esi
 0059471D    push        edi
 0059471E    mov         edi,ecx
 00594720    mov         esi,edx
 00594722    mov         ebx,eax
 00594724    push        edi
 00594725    mov         eax,dword ptr [ebp+8]
 00594728    push        eax
 00594729    mov         cl,1
 0059472B    mov         edx,esi
 0059472D    mov         eax,ebx
 0059472F    call        TXMLDocument.CreateNode
 00594734    pop         edi
 00594735    pop         esi
 00594736    pop         ebx
 00594737    pop         ebp
 00594738    ret         4
*}
end;

//0059473C
function TXMLDocument.CreateNode(NameOrData:string; NodeType:TNodeType; AddlData:string):IXMLNode;
begin
{*
 0059473C    push        ebp
 0059473D    mov         ebp,esp
 0059473F    push        0
 00594741    push        ebx
 00594742    push        esi
 00594743    push        edi
 00594744    mov         ebx,ecx
 00594746    mov         esi,edx
 00594748    mov         edi,eax
 0059474A    xor         eax,eax
 0059474C    push        ebp
 0059474D    push        5947A5
 00594752    push        dword ptr fs:[eax]
 00594755    mov         dword ptr fs:[eax],esp
 00594758    push        0
 0059475A    push        edi
 0059475B    mov         eax,dword ptr [ebp+0C]
 0059475E    push        eax
 0059475F    lea         eax,[ebp-4]
 00594762    push        eax
 00594763    mov         ecx,ebx
 00594765    mov         edx,esi
 00594767    mov         eax,dword ptr [edi+50]
 0059476A    call        CreateDOMNode
 0059476F    mov         ecx,dword ptr [ebp-4]
 00594772    mov         dl,1
 00594774    mov         eax,[0058C024];TXMLNode
 00594779    call        TXMLNode.Create
 0059477E    mov         edx,eax
 00594780    test        edx,edx
>00594782    je          00594787
 00594784    sub         edx,0FFFFFFB8
 00594787    mov         eax,dword ptr [ebp+8]
 0059478A    call        @IntfCopy
 0059478F    xor         eax,eax
 00594791    pop         edx
 00594792    pop         ecx
 00594793    pop         ecx
 00594794    mov         dword ptr fs:[eax],edx
 00594797    push        5947AC
 0059479C    lea         eax,[ebp-4]
 0059479F    call        @IntfClear
 005947A4    ret
>005947A5    jmp         @HandleFinally
>005947AA    jmp         0059479C
 005947AC    pop         edi
 005947AD    pop         esi
 005947AE    pop         ebx
 005947AF    pop         ecx
 005947B0    pop         ebp
 005947B1    ret         8
*}
end;

//005947B4
function TXMLDocument.GetChildNodes:IXMLNodeList;
begin
{*
 005947B4    push        ebp
 005947B5    mov         ebp,esp
 005947B7    push        0
 005947B9    push        ebx
 005947BA    push        esi
 005947BB    mov         esi,edx
 005947BD    mov         ebx,eax
 005947BF    xor         eax,eax
 005947C1    push        ebp
 005947C2    push        5947F7
 005947C7    push        dword ptr fs:[eax]
 005947CA    mov         dword ptr fs:[eax],esp
 005947CD    lea         edx,[ebp-4]
 005947D0    mov         eax,ebx
 005947D2    call        TXMLDocument.GetDocumentNode
 005947D7    mov         eax,dword ptr [ebp-4]
 005947DA    mov         edx,esi
 005947DC    mov         ecx,dword ptr [eax]
 005947DE    call        dword ptr [ecx+14]
 005947E1    xor         eax,eax
 005947E3    pop         edx
 005947E4    pop         ecx
 005947E5    pop         ecx
 005947E6    mov         dword ptr fs:[eax],edx
 005947E9    push        5947FE
 005947EE    lea         eax,[ebp-4]
 005947F1    call        @IntfClear
 005947F6    ret
>005947F7    jmp         @HandleFinally
>005947FC    jmp         005947EE
 005947FE    pop         esi
 005947FF    pop         ebx
 00594800    pop         ecx
 00594801    pop         ebp
 00594802    ret
*}
end;

//00594804
function TXMLDocument.IsEmptyDoc:Boolean;
begin
{*
 00594804    push        ebx
 00594805    push        ecx
 00594806    mov         ebx,eax
 00594808    cmp         dword ptr [ebx+50],0
>0059480C    je          00594829
 0059480E    push        esp
 0059480F    mov         eax,dword ptr [ebx+50]
 00594812    push        eax
 00594813    mov         eax,dword ptr [eax]
 00594815    call        dword ptr [eax+58]
 00594818    call        @CheckAutoResult
 0059481D    cmp         word ptr [esp],0
>00594822    je          00594829
 00594824    xor         eax,eax
 00594826    pop         edx
 00594827    pop         ebx
 00594828    ret
 00594829    mov         al,1
 0059482B    pop         edx
 0059482C    pop         ebx
 0059482D    ret
*}
end;

//00594830
function TXMLDocument.GetDocBinding(TagName:string; DocNodeClass:TClass; NamespaceURI:string):IXMLNode;
begin
{*
 00594830    push        ebp
 00594831    mov         ebp,esp
 00594833    push        0
 00594835    push        0
 00594837    push        0
 00594839    push        0
 0059483B    push        0
 0059483D    push        0
 0059483F    push        ebx
 00594840    push        esi
 00594841    push        edi
 00594842    mov         edi,ecx
 00594844    mov         esi,edx
 00594846    mov         ebx,eax
 00594848    mov         eax,dword ptr [ebp+0C]
 0059484B    call        @UStrAddRef
 00594850    xor         eax,eax
 00594852    push        ebp
 00594853    push        594937
 00594858    push        dword ptr fs:[eax]
 0059485B    mov         dword ptr fs:[eax],esp
 0059485E    mov         eax,dword ptr [ebp+0C]
 00594861    push        eax
 00594862    mov         ecx,edi
 00594864    mov         edx,esi
 00594866    mov         eax,ebx
 00594868    call        TXMLDocument.RegisterDocBinding
 0059486D    mov         eax,ebx
 0059486F    mov         edx,dword ptr [eax]
 00594871    call        dword ptr [edx+34]
 00594874    test        al,al
>00594876    jne         00594883
 00594878    mov         dl,1
 0059487A    mov         eax,ebx
 0059487C    mov         ecx,dword ptr [eax]
 0059487E    call        dword ptr [ecx+38]
>00594881    jmp         0059488B
 00594883    lea         eax,[ebx+60]
 00594886    call        @IntfClear
 0059488B    lea         eax,[ebp-4]
 0059488E    call        @IntfClear
 00594893    push        eax
 00594894    lea         edx,[ebp-8]
 00594897    mov         eax,ebx
 00594899    call        TXMLDocument.GetDOMDocument
 0059489E    mov         eax,dword ptr [ebp-8]
 005948A1    push        eax
 005948A2    mov         eax,dword ptr [eax]
 005948A4    call        dword ptr [eax+70]
 005948A7    call        @CheckAutoResult
 005948AC    cmp         dword ptr [ebp-4],0
>005948B0    jne         005948F4
 005948B2    cmp         dword ptr [ebp+0C],0
>005948B6    je          005948D9
 005948B8    push        0
 005948BA    push        0FF
 005948BC    lea         eax,[ebp-0C]
 005948BF    push        eax
 005948C0    lea         edx,[ebp-10]
 005948C3    mov         eax,ebx
 005948C5    call        TXMLDocument.GetDocumentNode
 005948CA    mov         eax,dword ptr [ebp-10]
 005948CD    mov         ecx,dword ptr [ebp+0C]
 005948D0    mov         edx,esi
 005948D2    mov         esi,dword ptr [eax]
 005948D4    call        dword ptr [esi+70]
>005948D7    jmp         005948F4
 005948D9    lea         eax,[ebp-14]
 005948DC    push        eax
 005948DD    lea         edx,[ebp-18]
 005948E0    mov         eax,ebx
 005948E2    call        TXMLDocument.GetDocumentNode
 005948E7    mov         eax,dword ptr [ebp-18]
 005948EA    or          ecx,0FFFFFFFF
 005948ED    mov         edx,esi
 005948EF    mov         esi,dword ptr [eax]
 005948F1    call        dword ptr [esi+6C]
 005948F4    mov         edx,dword ptr [ebp+8]
 005948F7    mov         eax,ebx
 005948F9    call        TXMLDocument.GetDocumentElement
 005948FE    xor         eax,eax
 00594900    pop         edx
 00594901    pop         ecx
 00594902    pop         ecx
 00594903    mov         dword ptr fs:[eax],edx
 00594906    push        59493E
 0059490B    lea         eax,[ebp-18]
 0059490E    mov         edx,dword ptr ds:[58A824];IXMLNode
 00594914    mov         ecx,4
 00594919    call        @FinalizeArray
 0059491E    lea         eax,[ebp-8]
 00594921    call        @IntfClear
 00594926    lea         eax,[ebp-4]
 00594929    call        @IntfClear
 0059492E    lea         eax,[ebp+0C]
 00594931    call        @UStrClr
 00594936    ret
>00594937    jmp         @HandleFinally
>0059493C    jmp         0059490B
 0059493E    pop         edi
 0059493F    pop         esi
 00594940    pop         ebx
 00594941    mov         esp,ebp
 00594943    pop         ebp
 00594944    ret         8
*}
end;

//00594948
procedure TXMLDocument.RegisterDocBinding(TagName:string; DocNodeClass:TClass; NamespaceURI:string);
begin
{*
 00594948    push        ebp
 00594949    mov         ebp,esp
 0059494B    push        ebx
 0059494C    push        esi
 0059494D    push        edi
 0059494E    mov         edi,ecx
 00594950    mov         esi,edx
 00594952    mov         ebx,eax
 00594954    mov         eax,dword ptr [ebp+8]
 00594957    call        @UStrAddRef
 0059495C    xor         eax,eax
 0059495E    push        ebp
 0059495F    push        594998
 00594964    push        dword ptr fs:[eax]
 00594967    mov         dword ptr fs:[eax],esp
 0059496A    lea         eax,[ebx+60]
 0059496D    call        @IntfClear
 00594972    mov         eax,dword ptr [ebp+8]
 00594975    push        eax
 00594976    lea         eax,[ebx+48]
 00594979    mov         ecx,esi
 0059497B    mov         edx,edi
 0059497D    call        AddNodeClassInfo
 00594982    xor         eax,eax
 00594984    pop         edx
 00594985    pop         ecx
 00594986    pop         ecx
 00594987    mov         dword ptr fs:[eax],edx
 0059498A    push        59499F
 0059498F    lea         eax,[ebp+8]
 00594992    call        @UStrClr
 00594997    ret
>00594998    jmp         @HandleFinally
>0059499D    jmp         0059498F
 0059499F    pop         edi
 005949A0    pop         esi
 005949A1    pop         ebx
 005949A2    pop         ebp
 005949A3    ret         4
*}
end;

//005949A8
function TXMLDocument.GetAsyncLoadState:Integer;
begin
{*
 005949A8    push        ebp
 005949A9    mov         ebp,esp
 005949AB    add         esp,0FFFFFFF8
 005949AE    push        ebx
 005949AF    xor         edx,edx
 005949B1    mov         dword ptr [ebp-8],edx
 005949B4    mov         ebx,eax
 005949B6    xor         eax,eax
 005949B8    push        ebp
 005949B9    push        594A03
 005949BE    push        dword ptr fs:[eax]
 005949C1    mov         dword ptr fs:[eax],esp
 005949C4    cmp         dword ptr [ebx+50],0
>005949C8    je          005949EB
 005949CA    lea         eax,[ebp-4]
 005949CD    push        eax
 005949CE    lea         edx,[ebp-8]
 005949D1    mov         eax,ebx
 005949D3    call        TXMLDocument.GetDOMPersist
 005949D8    mov         eax,dword ptr [ebp-8]
 005949DB    push        eax
 005949DC    mov         eax,dword ptr [eax]
 005949DE    call        dword ptr [eax+10]
 005949E1    call        @CheckAutoResult
 005949E6    mov         ebx,dword ptr [ebp-4]
>005949E9    jmp         005949ED
 005949EB    xor         ebx,ebx
 005949ED    xor         eax,eax
 005949EF    pop         edx
 005949F0    pop         ecx
 005949F1    pop         ecx
 005949F2    mov         dword ptr fs:[eax],edx
 005949F5    push        594A0A
 005949FA    lea         eax,[ebp-8]
 005949FD    call        @IntfClear
 00594A02    ret
>00594A03    jmp         @HandleFinally
>00594A08    jmp         005949FA
 00594A0A    mov         eax,ebx
 00594A0C    pop         ebx
 00594A0D    pop         ecx
 00594A0E    pop         ecx
 00594A0F    pop         ebp
 00594A10    ret
*}
end;

//00594A14
function TXMLDocument.GetDOMDocument:IDOMDocument;
begin
{*
 00594A14    push        ebx
 00594A15    push        esi
 00594A16    mov         esi,edx
 00594A18    mov         ebx,eax
 00594A1A    mov         eax,esi
 00594A1C    mov         edx,dword ptr [ebx+50]
 00594A1F    call        @IntfCopy
 00594A24    pop         esi
 00594A25    pop         ebx
 00594A26    ret
*}
end;

//00594A28
procedure TXMLDocument.SetDOMDocument(const Value:IDOMDocument);
begin
{*
 00594A28    push        ebx
 00594A29    push        esi
 00594A2A    push        edi
 00594A2B    mov         edi,edx
 00594A2D    mov         ebx,eax
 00594A2F    xor         edx,edx
 00594A31    mov         eax,ebx
 00594A33    mov         ecx,dword ptr [eax]
 00594A35    call        dword ptr [ecx+38]
 00594A38    mov         eax,ebx
 00594A3A    mov         si,0FFEB
 00594A3E    call        @CallDynaInst
 00594A43    lea         eax,[ebx+50]
 00594A46    mov         edx,edi
 00594A48    call        @IntfCopy
 00594A4D    mov         eax,ebx
 00594A4F    mov         si,0FFED
 00594A53    call        @CallDynaInst
 00594A58    pop         edi
 00594A59    pop         esi
 00594A5A    pop         ebx
 00594A5B    ret
*}
end;

//00594A5C
function TXMLDocument.GetDocumentNode:IXMLNode;
begin
{*
 00594A5C    push        ebp
 00594A5D    mov         ebp,esp
 00594A5F    push        0
 00594A61    push        ebx
 00594A62    push        esi
 00594A63    push        edi
 00594A64    mov         edi,edx
 00594A66    mov         ebx,eax
 00594A68    xor         eax,eax
 00594A6A    push        ebp
 00594A6B    push        594AE3
 00594A70    push        dword ptr fs:[eax]
 00594A73    mov         dword ptr fs:[eax],esp
 00594A76    mov         eax,ebx
 00594A78    call        TXMLDocument.CheckActive
 00594A7D    cmp         dword ptr [ebx+60],0
>00594A81    jne         00594AC3
 00594A83    push        0
 00594A85    push        ebx
 00594A86    lea         edx,[ebp-4]
 00594A89    mov         eax,ebx
 00594A8B    call        TXMLDocument.GetDOMDocument
 00594A90    mov         ecx,dword ptr [ebp-4]
 00594A93    mov         dl,1
 00594A95    mov         eax,[0058C024];TXMLNode
 00594A9A    call        TXMLNode.Create
 00594A9F    mov         esi,eax
 00594AA1    lea         eax,[ebx+60]
 00594AA4    mov         edx,esi
 00594AA6    test        edx,edx
>00594AA8    je          00594AAD
 00594AAA    sub         edx,0FFFFFFB8
 00594AAD    call        @IntfCopy
 00594AB2    lea         eax,[esi+14]
 00594AB5    mov         edx,dword ptr [ebx+48]
 00594AB8    mov         ecx,dword ptr ds:[58BC00];TNodeClassArray
 00594ABE    call        @DynArrayAsg
 00594AC3    mov         eax,edi
 00594AC5    mov         edx,dword ptr [ebx+60]
 00594AC8    call        @IntfCopy
 00594ACD    xor         eax,eax
 00594ACF    pop         edx
 00594AD0    pop         ecx
 00594AD1    pop         ecx
 00594AD2    mov         dword ptr fs:[eax],edx
 00594AD5    push        594AEA
 00594ADA    lea         eax,[ebp-4]
 00594ADD    call        @IntfClear
 00594AE2    ret
>00594AE3    jmp         @HandleFinally
>00594AE8    jmp         00594ADA
 00594AEA    pop         edi
 00594AEB    pop         esi
 00594AEC    pop         ebx
 00594AED    pop         ecx
 00594AEE    pop         ebp
 00594AEF    ret
*}
end;

//00594AF0
function TXMLDocument.GetDocumentElement:IXMLNode;
begin
{*
 00594AF0    push        ebp
 00594AF1    mov         ebp,esp
 00594AF3    xor         ecx,ecx
 00594AF5    push        ecx
 00594AF6    push        ecx
 00594AF7    push        ecx
 00594AF8    push        ecx
 00594AF9    push        ebx
 00594AFA    push        esi
 00594AFB    mov         ebx,edx
 00594AFD    mov         esi,eax
 00594AFF    xor         eax,eax
 00594B01    push        ebp
 00594B02    push        594BAA
 00594B07    push        dword ptr fs:[eax]
 00594B0A    mov         dword ptr fs:[eax],esp
 00594B0D    mov         eax,esi
 00594B0F    call        TXMLDocument.CheckActive
 00594B14    mov         eax,ebx
 00594B16    call        @IntfClear
 00594B1B    lea         edx,[ebp-4]
 00594B1E    mov         eax,esi
 00594B20    call        TXMLDocument.GetDocumentNode
 00594B25    mov         eax,dword ptr [ebp-4]
 00594B28    mov         edx,dword ptr [eax]
 00594B2A    call        dword ptr [edx+24]
 00594B2D    test        al,al
>00594B2F    je          00594B79
 00594B31    lea         edx,[ebp-0C]
 00594B34    mov         eax,esi
 00594B36    call        TXMLDocument.GetDocumentNode
 00594B3B    mov         eax,dword ptr [ebp-0C]
 00594B3E    lea         edx,[ebp-8]
 00594B41    mov         ecx,dword ptr [eax]
 00594B43    call        dword ptr [ecx+14]
 00594B46    mov         eax,dword ptr [ebp-8]
 00594B49    mov         edx,ebx
 00594B4B    mov         ecx,dword ptr [eax]
 00594B4D    call        dword ptr [ecx+5C]
>00594B50    jmp         00594B69
 00594B52    lea         edx,[ebp-10]
 00594B55    mov         eax,dword ptr [ebx]
 00594B57    mov         ecx,dword ptr [eax]
 00594B59    call        dword ptr [ecx+98]
 00594B5F    mov         edx,dword ptr [ebp-10]
 00594B62    mov         eax,ebx
 00594B64    call        @IntfCopy
 00594B69    cmp         dword ptr [ebx],0
>00594B6C    je          00594B79
 00594B6E    mov         eax,dword ptr [ebx]
 00594B70    mov         edx,dword ptr [eax]
 00594B72    call        dword ptr [edx+38]
 00594B75    cmp         al,1
>00594B77    jne         00594B52
 00594B79    xor         eax,eax
 00594B7B    pop         edx
 00594B7C    pop         ecx
 00594B7D    pop         ecx
 00594B7E    mov         dword ptr fs:[eax],edx
 00594B81    push        594BB1
 00594B86    lea         eax,[ebp-10]
 00594B89    mov         edx,dword ptr ds:[58A824];IXMLNode
 00594B8F    mov         ecx,2
 00594B94    call        @FinalizeArray
 00594B99    lea         eax,[ebp-8]
 00594B9C    call        @IntfClear
 00594BA1    lea         eax,[ebp-4]
 00594BA4    call        @IntfClear
 00594BA9    ret
>00594BAA    jmp         @HandleFinally
>00594BAF    jmp         00594B86
 00594BB1    pop         esi
 00594BB2    pop         ebx
 00594BB3    mov         esp,ebp
 00594BB5    pop         ebp
 00594BB6    ret
*}
end;

//00594BB8
procedure TXMLDocument.SetDocumentElement(const Value:IXMLNode);
begin
{*
 00594BB8    push        ebp
 00594BB9    mov         ebp,esp
 00594BBB    xor         ecx,ecx
 00594BBD    push        ecx
 00594BBE    push        ecx
 00594BBF    push        ecx
 00594BC0    push        ecx
 00594BC1    push        ecx
 00594BC2    push        ecx
 00594BC3    push        ebx
 00594BC4    push        esi
 00594BC5    mov         esi,edx
 00594BC7    mov         ebx,eax
 00594BC9    xor         eax,eax
 00594BCB    push        ebp
 00594BCC    push        594C76
 00594BD1    push        dword ptr fs:[eax]
 00594BD4    mov         dword ptr fs:[eax],esp
 00594BD7    mov         eax,ebx
 00594BD9    call        TXMLDocument.CheckActive
 00594BDE    lea         edx,[ebp-4]
 00594BE1    mov         eax,ebx
 00594BE3    call        TXMLDocument.GetDocumentElement
 00594BE8    cmp         dword ptr [ebp-4],0
>00594BEC    je          00594C16
 00594BEE    lea         eax,[ebp-8]
 00594BF1    push        eax
 00594BF2    lea         edx,[ebp-10]
 00594BF5    mov         eax,ebx
 00594BF7    call        TXMLDocument.GetDocumentNode
 00594BFC    mov         eax,dword ptr [ebp-10]
 00594BFF    lea         edx,[ebp-0C]
 00594C02    mov         ecx,dword ptr [eax]
 00594C04    call        dword ptr [ecx+14]
 00594C07    mov         eax,dword ptr [ebp-0C]
 00594C0A    mov         ecx,esi
 00594C0C    mov         edx,dword ptr [ebp-4]
 00594C0F    mov         ebx,dword ptr [eax]
 00594C11    call        dword ptr [ebx+64]
>00594C14    jmp         00594C35
 00594C16    lea         edx,[ebp-18]
 00594C19    mov         eax,ebx
 00594C1B    call        TXMLDocument.GetDocumentNode
 00594C20    mov         eax,dword ptr [ebp-18]
 00594C23    lea         edx,[ebp-14]
 00594C26    mov         ecx,dword ptr [eax]
 00594C28    call        dword ptr [ecx+14]
 00594C2B    mov         eax,dword ptr [ebp-14]
 00594C2E    mov         edx,esi
 00594C30    mov         ecx,dword ptr [eax]
 00594C32    call        dword ptr [ecx+18]
 00594C35    xor         eax,eax
 00594C37    pop         edx
 00594C38    pop         ecx
 00594C39    pop         ecx
 00594C3A    mov         dword ptr fs:[eax],edx
 00594C3D    push        594C7D
 00594C42    lea         eax,[ebp-18]
 00594C45    call        @IntfClear
 00594C4A    lea         eax,[ebp-14]
 00594C4D    call        @IntfClear
 00594C52    lea         eax,[ebp-10]
 00594C55    call        @IntfClear
 00594C5A    lea         eax,[ebp-0C]
 00594C5D    call        @IntfClear
 00594C62    lea         eax,[ebp-8]
 00594C65    mov         edx,dword ptr ds:[58A824];IXMLNode
 00594C6B    mov         ecx,2
 00594C70    call        @FinalizeArray
 00594C75    ret
>00594C76    jmp         @HandleFinally
>00594C7B    jmp         00594C42
 00594C7D    pop         esi
 00594C7E    pop         ebx
 00594C7F    mov         esp,ebp
 00594C81    pop         ebp
 00594C82    ret
*}
end;

//00594C84
procedure TXMLDocument.SetDOMImplementation(const Value:IDOMImplementation);
begin
{*
 00594C84    push        ebx
 00594C85    push        esi
 00594C86    mov         esi,edx
 00594C88    mov         ebx,eax
 00594C8A    cmp         esi,dword ptr [ebx+54]
>00594C8D    je          00594CA2
 00594C8F    xor         edx,edx
 00594C91    mov         eax,ebx
 00594C93    mov         ecx,dword ptr [eax]
 00594C95    call        dword ptr [ecx+38]
 00594C98    lea         eax,[ebx+54]
 00594C9B    mov         edx,esi
 00594C9D    call        @IntfCopy
 00594CA2    pop         esi
 00594CA3    pop         ebx
 00594CA4    ret
*}
end;

//00594CA8
procedure TXMLDocument.SetDOMVendor(const Value:TDOMVendor);
begin
{*
 00594CA8    cmp         edx,dword ptr [eax+40]
>00594CAB    je          00594CB7
 00594CAD    mov         dword ptr [eax+40],edx
 00594CB0    xor         edx,edx
 00594CB2    call        TXMLDocument.SetDOMImplementation
 00594CB7    ret
*}
end;

//00594CB8
function TXMLDocument.GetFileName:DOMString;
begin
{*
 00594CB8    push        ebx
 00594CB9    push        esi
 00594CBA    mov         esi,edx
 00594CBC    mov         ebx,eax
 00594CBE    mov         eax,esi
 00594CC0    mov         edx,dword ptr [ebx+64]
 00594CC3    call        @UStrAsg
 00594CC8    pop         esi
 00594CC9    pop         ebx
 00594CCA    ret
*}
end;

//00594CCC
procedure TXMLDocument.SetFileName(const Value:DOMString);
begin
{*
 00594CCC    push        ebx
 00594CCD    push        esi
 00594CCE    mov         esi,edx
 00594CD0    mov         ebx,eax
 00594CD2    mov         eax,esi
 00594CD4    mov         edx,dword ptr [ebx+64]
 00594CD7    call        @UStrEqual
>00594CDC    je          00594D10
 00594CDE    mov         eax,ebx
 00594CE0    mov         edx,dword ptr [eax]
 00594CE2    call        dword ptr [edx+34]
 00594CE5    test        al,al
>00594CE7    je          00594CFD
 00594CE9    cmp         byte ptr [ebx+84],3
>00594CF0    jne         00594CFD
 00594CF2    xor         edx,edx
 00594CF4    mov         eax,ebx
 00594CF6    mov         ecx,dword ptr [eax]
 00594CF8    call        dword ptr [ecx+38]
>00594CFB    jmp         00594D06
 00594CFD    xor         edx,edx
 00594CFF    mov         eax,ebx
 00594D01    call        TXMLDocument.SetXMLStrings
 00594D06    lea         eax,[ebx+64]
 00594D09    mov         edx,esi
 00594D0B    call        @UStrAsg
 00594D10    pop         esi
 00594D11    pop         ebx
 00594D12    ret
*}
end;

//00594D14
function TXMLDocument.GetModified:Boolean;
begin
{*
 00594D14    cmp         dword ptr [eax+7C],0
 00594D18    setne       al
 00594D1B    ret
*}
end;

//00594D1C
procedure TXMLDocument.SetModified(const Value:Boolean);
begin
{*
 00594D1C    test        dl,dl
>00594D1E    je          00594D24
 00594D20    inc         dword ptr [eax+7C]
 00594D23    ret
 00594D24    xor         edx,edx
 00594D26    mov         dword ptr [eax+7C],edx
 00594D29    mov         dword ptr [eax+80],0FFFFFFFF
 00594D33    ret
*}
end;

//00594D34
function TXMLDocument.GetNodeIndentStr:DOMString;
begin
{*
 00594D34    push        ebx
 00594D35    push        esi
 00594D36    mov         esi,edx
 00594D38    mov         ebx,eax
 00594D3A    mov         eax,esi
 00594D3C    mov         edx,dword ptr [ebx+74]
 00594D3F    call        @UStrAsg
 00594D44    pop         esi
 00594D45    pop         ebx
 00594D46    ret
*}
end;

//00594D48
procedure TXMLDocument.SetNodeIndentStr(const Value:DOMString);
begin
{*
 00594D48    push        ebx
 00594D49    push        esi
 00594D4A    mov         esi,edx
 00594D4C    mov         ebx,eax
 00594D4E    lea         eax,[ebx+74]
 00594D51    mov         edx,esi
 00594D53    call        @UStrAsg
 00594D58    pop         esi
 00594D59    pop         ebx
 00594D5A    ret
*}
end;

//00594D5C
function TXMLDocument.GetOptions:TXMLDocOptions;
begin
{*
 00594D5C    movzx       edx,byte ptr [eax+68]
 00594D60    mov         eax,edx
 00594D62    ret
*}
end;

//00594D64
procedure TXMLDocument.SetOptions(const Value:TXMLDocOptions);
begin
{*
 00594D64    push        ecx
 00594D65    mov         byte ptr [esp],dl
 00594D68    movzx       edx,byte ptr [esp]
 00594D6C    mov         byte ptr [eax+68],dl
 00594D6F    pop         edx
 00594D70    ret
*}
end;

//00594D74
{*function TXMLDocument.GetParseOptions:?;
begin
 00594D74    movzx       edx,byte ptr [eax+5C];TXMLDocument.FParseOptions:TParseOptions
 00594D78    mov         eax,edx
 00594D7A    ret
end;*}

//00594D7C
procedure TXMLDocument.SetParseOptions(const Value:TParseOptions);
begin
{*
 00594D7C    push        ecx
 00594D7D    mov         byte ptr [esp],dl
 00594D80    movzx       edx,byte ptr [esp]
 00594D84    mov         byte ptr [eax+5C],dl
 00594D87    pop         edx
 00594D88    ret
*}
end;

//00594D8C
procedure TXMLDocument.SetOnAsyncLoad(Value:TAsyncEventHandler);
begin
{*
 00594D8C    push        ebp
 00594D8D    mov         ebp,esp
 00594D8F    push        0
 00594D91    push        ebx
 00594D92    mov         ebx,eax
 00594D94    xor         eax,eax
 00594D96    push        ebp
 00594D97    push        594DFA
 00594D9C    push        dword ptr fs:[eax]
 00594D9F    mov         dword ptr fs:[eax],esp
 00594DA2    mov         eax,dword ptr [ebp+8]
 00594DA5    mov         dword ptr [ebx+0C0],eax
 00594DAB    mov         eax,dword ptr [ebp+0C]
 00594DAE    mov         dword ptr [ebx+0C4],eax
 00594DB4    mov         eax,ebx
 00594DB6    mov         edx,dword ptr [eax]
 00594DB8    call        dword ptr [edx+34]
 00594DBB    test        al,al
>00594DBD    je          00594DE4
 00594DBF    push        dword ptr [ebx+0C4]
 00594DC5    push        dword ptr [ebx+0C0]
 00594DCB    push        ebx
 00594DCC    lea         edx,[ebp-4]
 00594DCF    mov         eax,ebx
 00594DD1    call        TXMLDocument.GetDOMPersist
 00594DD6    mov         eax,dword ptr [ebp-4]
 00594DD9    push        eax
 00594DDA    mov         eax,dword ptr [eax]
 00594DDC    call        dword ptr [eax+28]
 00594DDF    call        @CheckAutoResult
 00594DE4    xor         eax,eax
 00594DE6    pop         edx
 00594DE7    pop         ecx
 00594DE8    pop         ecx
 00594DE9    mov         dword ptr fs:[eax],edx
 00594DEC    push        594E01
 00594DF1    lea         eax,[ebp-4]
 00594DF4    call        @IntfClear
 00594DF9    ret
>00594DFA    jmp         @HandleFinally
>00594DFF    jmp         00594DF1
 00594E01    pop         ebx
 00594E02    pop         ecx
 00594E03    pop         ebp
 00594E04    ret         8
*}
end;

//00594E08
procedure CheckForDTD;
begin
{*
 00594E08    push        ebp
 00594E09    mov         ebp,esp
 00594E0B    mov         ecx,10
 00594E10    push        0
 00594E12    push        0
 00594E14    dec         ecx
>00594E15    jne         00594E10
 00594E17    push        ecx
 00594E18    push        ebx
 00594E19    push        esi
 00594E1A    push        edi
 00594E1B    mov         esi,dword ptr [ebp+8]
 00594E1E    add         esi,0FFFFFFF8
 00594E21    xor         eax,eax
 00594E23    push        ebp
 00594E24    push        59501F
 00594E29    push        dword ptr fs:[eax]
 00594E2C    mov         dword ptr fs:[eax],esp
 00594E2F    mov         eax,dword ptr [ebp+8]
 00594E32    mov         eax,dword ptr [eax-4]
 00594E35    call        @UStrClr
 00594E3A    lea         edx,[ebp-0C]
 00594E3D    mov         eax,dword ptr [esi]
 00594E3F    call        TXMLDocument.GetChildNodes
 00594E44    mov         eax,dword ptr [ebp-0C]
 00594E47    mov         edx,dword ptr [eax]
 00594E49    call        dword ptr [edx+0C]
 00594E4C    mov         ebx,eax
 00594E4E    dec         ebx
 00594E4F    test        ebx,ebx
>00594E51    jl          00594F86
 00594E57    inc         ebx
 00594E58    mov         dword ptr [ebp-8],0
 00594E5F    lea         edx,[ebp-14]
 00594E62    mov         eax,dword ptr [esi]
 00594E64    call        TXMLDocument.GetChildNodes
 00594E69    mov         eax,dword ptr [ebp-14]
 00594E6C    push        eax
 00594E6D    lea         eax,[ebp-24]
 00594E70    mov         edx,dword ptr [ebp-8]
 00594E73    mov         cl,0FC
 00594E75    call        @OleVarFromInt
 00594E7A    lea         edx,[ebp-24]
 00594E7D    lea         ecx,[ebp-10]
 00594E80    pop         eax
 00594E81    mov         edi,dword ptr [eax]
 00594E83    call        dword ptr [edi+10]
 00594E86    mov         eax,dword ptr [ebp-10]
 00594E89    mov         edx,dword ptr [eax]
 00594E8B    call        dword ptr [edx+38]
 00594E8E    cmp         al,0A
>00594E90    jne         00594F7C
 00594E96    lea         edx,[ebp-28]
 00594E99    mov         eax,dword ptr [esi]
 00594E9B    call        TXMLDocument.GetChildNodes
 00594EA0    mov         eax,dword ptr [ebp-28]
 00594EA3    push        eax
 00594EA4    lea         eax,[ebp-38]
 00594EA7    mov         edx,dword ptr [ebp-8]
 00594EAA    mov         cl,0FC
 00594EAC    call        @OleVarFromInt
 00594EB1    lea         edx,[ebp-38]
 00594EB4    lea         ecx,[ebp-4]
 00594EB7    pop         eax
 00594EB8    mov         ebx,dword ptr [eax]
 00594EBA    call        dword ptr [ebx+10]
 00594EBD    lea         edx,[ebp-3C]
 00594EC0    mov         eax,dword ptr [ebp-4]
 00594EC3    mov         ecx,dword ptr [eax]
 00594EC5    call        dword ptr [ecx+10]
 00594EC8    mov         eax,dword ptr [ebp-3C]
 00594ECB    mov         edx,dword ptr [eax]
 00594ECD    call        dword ptr [edx+0C]
 00594ED0    mov         esi,eax
 00594ED2    dec         esi
 00594ED3    test        esi,esi
>00594ED5    jl          00594F86
 00594EDB    inc         esi
 00594EDC    xor         ebx,ebx
 00594EDE    lea         edx,[ebp-48]
 00594EE1    mov         eax,dword ptr [ebp-4]
 00594EE4    mov         ecx,dword ptr [eax]
 00594EE6    call        dword ptr [ecx+10]
 00594EE9    mov         eax,dword ptr [ebp-48]
 00594EEC    push        eax
 00594EED    lea         eax,[ebp-58]
 00594EF0    mov         edx,ebx
 00594EF2    mov         cl,0FC
 00594EF4    call        @OleVarFromInt
 00594EF9    lea         edx,[ebp-58]
 00594EFC    lea         ecx,[ebp-44]
 00594EFF    pop         eax
 00594F00    mov         edi,dword ptr [eax]
 00594F02    call        dword ptr [edi+10]
 00594F05    mov         eax,dword ptr [ebp-44]
 00594F08    lea         edx,[ebp-40]
 00594F0B    mov         ecx,dword ptr [eax]
 00594F0D    call        dword ptr [ecx+34]
 00594F10    mov         eax,dword ptr [ebp-40]
 00594F13    mov         edx,59503C;'SYSTEM'
 00594F18    call        @UStrEqual
>00594F1D    jne         00594F72
 00594F1F    lea         edx,[ebp-74]
 00594F22    mov         eax,dword ptr [ebp-4]
 00594F25    mov         ecx,dword ptr [eax]
 00594F27    call        dword ptr [ecx+10]
 00594F2A    mov         eax,dword ptr [ebp-74]
 00594F2D    push        eax
 00594F2E    lea         eax,[ebp-84]
 00594F34    mov         edx,ebx
 00594F36    mov         cl,0FC
 00594F38    call        @OleVarFromInt
 00594F3D    lea         edx,[ebp-84]
 00594F43    lea         ecx,[ebp-70]
 00594F46    pop         eax
 00594F47    mov         esi,dword ptr [eax]
 00594F49    call        dword ptr [esi+10]
 00594F4C    mov         eax,dword ptr [ebp-70]
 00594F4F    lea         edx,[ebp-6C]
 00594F52    mov         ecx,dword ptr [eax]
 00594F54    call        dword ptr [ecx+3C]
 00594F57    lea         eax,[ebp-6C]
 00594F5A    lea         edx,[ebp-5C]
 00594F5D    call        VarToWideStr
 00594F62    mov         edx,dword ptr [ebp-5C]
 00594F65    mov         eax,dword ptr [ebp+8]
 00594F68    mov         eax,dword ptr [eax-4]
 00594F6B    call        @UStrFromWStr
>00594F70    jmp         00594F86
 00594F72    inc         ebx
 00594F73    dec         esi
>00594F74    jne         00594EDE
>00594F7A    jmp         00594F86
 00594F7C    inc         dword ptr [ebp-8]
 00594F7F    dec         ebx
>00594F80    jne         00594E5F
 00594F86    xor         eax,eax
 00594F88    pop         edx
 00594F89    pop         ecx
 00594F8A    pop         ecx
 00594F8B    mov         dword ptr fs:[eax],edx
 00594F8E    push        595029
 00594F93    lea         eax,[ebp-84]
 00594F99    call        @VarClr
 00594F9E    lea         eax,[ebp-74]
 00594FA1    call        @IntfClear
 00594FA6    lea         eax,[ebp-70]
 00594FA9    call        @IntfClear
 00594FAE    lea         eax,[ebp-6C]
 00594FB1    call        @VarClr
 00594FB6    lea         eax,[ebp-5C]
 00594FB9    call        @WStrClr
 00594FBE    lea         eax,[ebp-58]
 00594FC1    call        @VarClr
 00594FC6    lea         eax,[ebp-48]
 00594FC9    call        @IntfClear
 00594FCE    lea         eax,[ebp-44]
 00594FD1    call        @IntfClear
 00594FD6    lea         eax,[ebp-40]
 00594FD9    call        @UStrClr
 00594FDE    lea         eax,[ebp-3C]
 00594FE1    call        @IntfClear
 00594FE6    lea         eax,[ebp-38]
 00594FE9    call        @VarClr
 00594FEE    lea         eax,[ebp-28]
 00594FF1    call        @IntfClear
 00594FF6    lea         eax,[ebp-24]
 00594FF9    call        @VarClr
 00594FFE    lea         eax,[ebp-14]
 00595001    call        @IntfClear
 00595006    lea         eax,[ebp-10]
 00595009    call        @IntfClear
 0059500E    lea         eax,[ebp-0C]
 00595011    call        @IntfClear
 00595016    lea         eax,[ebp-4]
 00595019    call        @IntfClear
 0059501E    ret
>0059501F    jmp         @HandleFinally
>00595024    jmp         00594F93
 00595029    pop         edi
 0059502A    pop         esi
 0059502B    pop         ebx
 0059502C    mov         esp,ebp
 0059502E    pop         ebp
 0059502F    ret
*}
end;

//0059504C
function FindLocationHint(const AttrName:DOMString; var SchemaLoc:DOMString):Boolean;
begin
{*
 0059504C    push        ebp
 0059504D    mov         ebp,esp
 0059504F    mov         ecx,4
 00595054    push        0
 00595056    push        0
 00595058    dec         ecx
>00595059    jne         00595054
 0059505B    push        ecx
 0059505C    push        ebx
 0059505D    push        esi
 0059505E    push        edi
 0059505F    mov         esi,edx
 00595061    mov         ebx,eax
 00595063    xor         eax,eax
 00595065    push        ebp
 00595066    push        59513C
 0059506B    push        dword ptr fs:[eax]
 0059506E    mov         dword ptr fs:[eax],esp
 00595071    lea         eax,[ebp-14]
 00595074    push        eax
 00595075    lea         edx,[ebp-18]
 00595078    mov         eax,dword ptr [ebp+8]
 0059507B    mov         eax,dword ptr [eax-8]
 0059507E    call        TXMLDocument.GetDocumentElement
 00595083    mov         eax,dword ptr [ebp-18]
 00595086    mov         ecx,595158;'http://www.w3.org/2001/XMLSchema-instance'
 0059508B    mov         edx,ebx
 0059508D    mov         ebx,dword ptr [eax]
 0059508F    call        dword ptr [ebx+84]
 00595095    lea         eax,[ebp-14]
 00595098    lea         edx,[ebp-4]
 0059509B    call        VarToStr
 005950A0    mov         edx,dword ptr [ebp-4]
 005950A3    mov         eax,esi
 005950A5    call        @UStrAsg
 005950AA    cmp         dword ptr [esi],0
>005950AD    je          00595103
 005950AF    mov         eax,dword ptr [esi]
 005950B1    mov         dword ptr [ebp-1C],eax
 005950B4    mov         eax,dword ptr [ebp-1C]
 005950B7    test        eax,eax
>005950B9    je          005950C0
 005950BB    sub         eax,4
 005950BE    mov         eax,dword ptr [eax]
 005950C0    mov         edi,eax
 005950C2    mov         ebx,1
 005950C7    cmp         edi,ebx
>005950C9    jle         00595103
 005950CB    mov         eax,dword ptr [esi]
 005950CD    cmp         word ptr [eax+ebx*2-2],20
>005950D3    ja          005950FE
 005950D5    lea         eax,[ebp-24]
 005950D8    push        eax
 005950D9    mov         eax,dword ptr [esi]
 005950DB    mov         ecx,7FFFFFFF
 005950E0    mov         edx,ebx
 005950E2    call        @UStrCopy
 005950E7    mov         eax,dword ptr [ebp-24]
 005950EA    lea         edx,[ebp-20]
 005950ED    call        TrimLeft
 005950F2    mov         edx,dword ptr [ebp-20]
 005950F5    mov         eax,esi
 005950F7    call        @UStrAsg
>005950FC    jmp         00595103
 005950FE    inc         ebx
 005950FF    cmp         edi,ebx
>00595101    jg          005950CB
 00595103    cmp         dword ptr [esi],0
 00595106    setne       bl
 00595109    xor         eax,eax
 0059510B    pop         edx
 0059510C    pop         ecx
 0059510D    pop         ecx
 0059510E    mov         dword ptr fs:[eax],edx
 00595111    push        595143
 00595116    lea         eax,[ebp-24]
 00595119    mov         edx,2
 0059511E    call        @UStrArrayClr
 00595123    lea         eax,[ebp-18]
 00595126    call        @IntfClear
 0059512B    lea         eax,[ebp-14]
 0059512E    call        @VarClr
 00595133    lea         eax,[ebp-4]
 00595136    call        @UStrClr
 0059513B    ret
>0059513C    jmp         @HandleFinally
>00595141    jmp         00595116
 00595143    mov         eax,ebx
 00595145    pop         edi
 00595146    pop         esi
 00595147    pop         ebx
 00595148    mov         esp,ebp
 0059514A    pop         ebp
 0059514B    ret
*}
end;

//005951AC
procedure CheckForXMLSchema;
begin
{*
 005951AC    push        ebp
 005951AD    mov         ebp,esp
 005951AF    push        0
 005951B1    xor         eax,eax
 005951B3    push        ebp
 005951B4    push        595217
 005951B9    push        dword ptr fs:[eax]
 005951BC    mov         dword ptr fs:[eax],esp
 005951BF    lea         edx,[ebp-4]
 005951C2    mov         eax,dword ptr [ebp+8]
 005951C5    mov         eax,dword ptr [eax-8]
 005951C8    call        TXMLDocument.GetDocumentElement
 005951CD    cmp         dword ptr [ebp-4],0
>005951D1    je          00595201
 005951D3    mov         eax,dword ptr [ebp+8]
 005951D6    push        eax
 005951D7    mov         eax,dword ptr [ebp+8]
 005951DA    mov         edx,dword ptr [eax-4]
 005951DD    mov         eax,595230;'schemaLocation'
 005951E2    call        FindLocationHint
 005951E7    pop         ecx
 005951E8    test        al,al
>005951EA    jne         00595201
 005951EC    mov         eax,dword ptr [ebp+8]
 005951EF    push        eax
 005951F0    mov         eax,dword ptr [ebp+8]
 005951F3    mov         edx,dword ptr [eax-4]
 005951F6    mov         eax,59525C;'noNamespaceSchemaLocation'
 005951FB    call        FindLocationHint
 00595200    pop         ecx
 00595201    xor         eax,eax
 00595203    pop         edx
 00595204    pop         ecx
 00595205    pop         ecx
 00595206    mov         dword ptr fs:[eax],edx
 00595209    push        59521E
 0059520E    lea         eax,[ebp-4]
 00595211    call        @IntfClear
 00595216    ret
>00595217    jmp         @HandleFinally
>0059521C    jmp         0059520E
 0059521E    pop         ecx
 0059521F    pop         ebp
 00595220    ret
*}
end;

//00595290
function TXMLDocument.GetSchemaRef:DOMString;
begin
{*
 00595290    push        ebp
 00595291    mov         ebp,esp
 00595293    add         esp,0FFFFFFF8
 00595296    mov         dword ptr [ebp-4],edx
 00595299    mov         dword ptr [ebp-8],eax
 0059529C    mov         eax,dword ptr [ebp-4]
 0059529F    call        @UStrClr
 005952A4    push        ebp
 005952A5    call        CheckForDTD
 005952AA    pop         ecx
 005952AB    mov         eax,dword ptr [ebp-4]
 005952AE    cmp         dword ptr [eax],0
>005952B1    jne         005952BA
 005952B3    push        ebp
 005952B4    call        CheckForXMLSchema
 005952B9    pop         ecx
 005952BA    pop         ecx
 005952BB    pop         ecx
 005952BC    pop         ebp
 005952BD    ret
*}
end;

//005952C0
procedure sub_005952C0;
begin
{*
 005952C0    ret
*}
end;

//005952C4
function TXMLDocument.GetPrologNode:IXMLNode;
begin
{*
 005952C4    push        ebp
 005952C5    mov         ebp,esp
 005952C7    mov         ecx,0B
 005952CC    push        0
 005952CE    push        0
 005952D0    dec         ecx
>005952D1    jne         005952CC
 005952D3    push        ecx
 005952D4    push        ebx
 005952D5    push        esi
 005952D6    push        edi
 005952D7    mov         esi,edx
 005952D9    mov         ebx,eax
 005952DB    xor         eax,eax
 005952DD    push        ebp
 005952DE    push        595457
 005952E3    push        dword ptr fs:[eax]
 005952E6    mov         dword ptr fs:[eax],esp
 005952E9    mov         eax,ebx
 005952EB    call        TXMLDocument.CheckActive
 005952F0    lea         edx,[ebp-8]
 005952F3    mov         eax,ebx
 005952F5    call        TXMLDocument.GetDocumentNode
 005952FA    mov         eax,dword ptr [ebp-8]
 005952FD    lea         edx,[ebp-4]
 00595300    mov         ecx,dword ptr [eax]
 00595302    call        dword ptr [ecx+14]
 00595305    mov         eax,dword ptr [ebp-4]
 00595308    mov         edx,dword ptr [eax]
 0059530A    call        dword ptr [edx+0C]
 0059530D    test        eax,eax
>0059530F    jle         005953CF
 00595315    lea         edx,[ebp-14]
 00595318    mov         eax,ebx
 0059531A    call        TXMLDocument.GetDocumentNode
 0059531F    mov         eax,dword ptr [ebp-14]
 00595322    lea         edx,[ebp-10]
 00595325    mov         ecx,dword ptr [eax]
 00595327    call        dword ptr [ecx+14]
 0059532A    mov         eax,dword ptr [ebp-10]
 0059532D    push        eax
 0059532E    lea         eax,[ebp-24]
 00595331    xor         edx,edx
 00595333    mov         cl,1
 00595335    call        @OleVarFromInt
 0059533A    lea         edx,[ebp-24]
 0059533D    lea         ecx,[ebp-0C]
 00595340    pop         eax
 00595341    mov         edi,dword ptr [eax]
 00595343    call        dword ptr [edi+10]
 00595346    mov         eax,dword ptr [ebp-0C]
 00595349    mov         edx,dword ptr [eax]
 0059534B    call        dword ptr [edx+38]
 0059534E    cmp         al,7
>00595350    jne         005953CF
 00595352    lea         edx,[ebp-34]
 00595355    mov         eax,ebx
 00595357    call        TXMLDocument.GetDocumentNode
 0059535C    mov         eax,dword ptr [ebp-34]
 0059535F    lea         edx,[ebp-30]
 00595362    mov         ecx,dword ptr [eax]
 00595364    call        dword ptr [ecx+14]
 00595367    mov         eax,dword ptr [ebp-30]
 0059536A    push        eax
 0059536B    lea         eax,[ebp-44]
 0059536E    xor         edx,edx
 00595370    mov         cl,1
 00595372    call        @OleVarFromInt
 00595377    lea         edx,[ebp-44]
 0059537A    lea         ecx,[ebp-2C]
 0059537D    pop         eax
 0059537E    mov         edi,dword ptr [eax]
 00595380    call        dword ptr [edi+10]
 00595383    mov         eax,dword ptr [ebp-2C]
 00595386    lea         edx,[ebp-28]
 00595389    mov         ecx,dword ptr [eax]
 0059538B    call        dword ptr [ecx+34]
 0059538E    mov         eax,dword ptr [ebp-28]
 00595391    mov         edx,595474;'xml'
 00595396    call        @UStrEqual
>0059539B    jne         005953CF
 0059539D    lea         edx,[ebp-4C]
 005953A0    mov         eax,ebx
 005953A2    call        TXMLDocument.GetDocumentNode
 005953A7    mov         eax,dword ptr [ebp-4C]
 005953AA    lea         edx,[ebp-48]
 005953AD    mov         ecx,dword ptr [eax]
 005953AF    call        dword ptr [ecx+14]
 005953B2    mov         eax,dword ptr [ebp-48]
 005953B5    push        eax
 005953B6    lea         eax,[ebp-5C]
 005953B9    xor         edx,edx
 005953BB    mov         cl,1
 005953BD    call        @OleVarFromInt
 005953C2    lea         edx,[ebp-5C]
 005953C5    mov         ecx,esi
 005953C7    pop         eax
 005953C8    mov         ebx,dword ptr [eax]
 005953CA    call        dword ptr [ebx+10]
>005953CD    jmp         005953D6
 005953CF    mov         eax,esi
 005953D1    call        @IntfClear
 005953D6    xor         eax,eax
 005953D8    pop         edx
 005953D9    pop         ecx
 005953DA    pop         ecx
 005953DB    mov         dword ptr fs:[eax],edx
 005953DE    push        59545E
 005953E3    lea         eax,[ebp-5C]
 005953E6    call        @VarClr
 005953EB    lea         eax,[ebp-4C]
 005953EE    call        @IntfClear
 005953F3    lea         eax,[ebp-48]
 005953F6    call        @IntfClear
 005953FB    lea         eax,[ebp-44]
 005953FE    call        @VarClr
 00595403    lea         eax,[ebp-34]
 00595406    call        @IntfClear
 0059540B    lea         eax,[ebp-30]
 0059540E    call        @IntfClear
 00595413    lea         eax,[ebp-2C]
 00595416    call        @IntfClear
 0059541B    lea         eax,[ebp-28]
 0059541E    call        @UStrClr
 00595423    lea         eax,[ebp-24]
 00595426    call        @VarClr
 0059542B    lea         eax,[ebp-14]
 0059542E    call        @IntfClear
 00595433    lea         eax,[ebp-10]
 00595436    call        @IntfClear
 0059543B    lea         eax,[ebp-0C]
 0059543E    mov         edx,dword ptr ds:[58A824];IXMLNode
 00595444    mov         ecx,2
 00595449    call        @FinalizeArray
 0059544E    lea         eax,[ebp-4]
 00595451    call        @IntfClear
 00595456    ret
>00595457    jmp         @HandleFinally
>0059545C    jmp         005953E3
 0059545E    pop         edi
 0059545F    pop         esi
 00595460    pop         ebx
 00595461    mov         esp,ebp
 00595463    pop         ebp
 00595464    ret
*}
end;

//0059547C
function TXMLDocument.GetPrologValue(PrologItem:TXMLPrologItem; const Default:DOMString):DOMString;
begin
{*
 0059547C    push        ebp
 0059547D    mov         ebp,esp
 0059547F    push        ecx
 00595480    mov         ecx,4
 00595485    push        0
 00595487    push        0
 00595489    dec         ecx
>0059548A    jne         00595485
 0059548C    xchg        ecx,dword ptr [ebp-4]
 0059548F    push        ebx
 00595490    push        esi
 00595491    push        edi
 00595492    mov         dword ptr [ebp-10],ecx
 00595495    mov         ebx,edx
 00595497    mov         edi,eax
 00595499    mov         esi,dword ptr [ebp+8]
 0059549C    xor         eax,eax
 0059549E    push        ebp
 0059549F    push        5955E2
 005954A4    push        dword ptr fs:[eax]
 005954A7    mov         dword ptr fs:[eax],esp
 005954AA    lea         eax,[ebp-0C]
 005954AD    call        @IntfClear
 005954B2    push        eax
 005954B3    push        5955F4
 005954B8    lea         edx,[ebp-14]
 005954BB    mov         eax,edi
 005954BD    call        TXMLDocument.GetDOMDocument
 005954C2    mov         eax,dword ptr [ebp-14]
 005954C5    push        eax
 005954C6    mov         eax,dword ptr [eax]
 005954C8    call        dword ptr [eax]
 005954CA    test        eax,eax
>005954CC    jne         00595536
 005954CE    sub         bl,1
>005954D1    jb          005954DB
>005954D3    je          005954F3
 005954D5    dec         bl
>005954D7    je          0059550B
>005954D9    jmp         00595521
 005954DB    mov         eax,esi
 005954DD    call        @UStrClr
 005954E2    push        eax
 005954E3    mov         eax,dword ptr [ebp-0C]
 005954E6    push        eax
 005954E7    mov         eax,dword ptr [eax]
 005954E9    call        dword ptr [eax+14]
 005954EC    call        @CheckAutoResult
>005954F1    jmp         00595521
 005954F3    mov         eax,esi
 005954F5    call        @UStrClr
 005954FA    push        eax
 005954FB    mov         eax,dword ptr [ebp-0C]
 005954FE    push        eax
 005954FF    mov         eax,dword ptr [eax]
 00595501    call        dword ptr [eax+0C]
 00595504    call        @CheckAutoResult
>00595509    jmp         00595521
 0059550B    mov         eax,esi
 0059550D    call        @UStrClr
 00595512    push        eax
 00595513    mov         eax,dword ptr [ebp-0C]
 00595516    push        eax
 00595517    mov         eax,dword ptr [eax]
 00595519    call        dword ptr [eax+10]
 0059551C    call        @CheckAutoResult
 00595521    cmp         dword ptr [esi],0
>00595524    jne         005955AC
 0059552A    mov         eax,esi
 0059552C    mov         edx,dword ptr [ebp-10]
 0059552F    call        @UStrAsg
>00595534    jmp         005955AC
 00595536    lea         edx,[ebp-4]
 00595539    mov         eax,edi
 0059553B    call        TXMLDocument.GetPrologNode
 00595540    cmp         dword ptr [ebp-4],0
>00595544    je          005955A2
 00595546    lea         edx,[ebp-24]
 00595549    mov         eax,dword ptr [ebp-4]
 0059554C    mov         ecx,dword ptr [eax]
 0059554E    call        dword ptr [ecx+3C]
 00595551    lea         edx,[ebp-24]
 00595554    lea         eax,[ebp-8]
 00595557    call        @VarToUStr
 0059555C    sub         bl,1
>0059555F    jb          00595569
>00595561    je          0059557C
 00595563    dec         bl
>00595565    je          0059558F
>00595567    jmp         005955AC
 00595569    push        esi
 0059556A    mov         ecx,dword ptr [ebp-10]
 0059556D    mov         edx,dword ptr [ebp-8]
 00595570    mov         eax,595610;'version'
 00595575    call        ExtractAttrValue
>0059557A    jmp         005955AC
 0059557C    push        esi
 0059557D    mov         ecx,dword ptr [ebp-10]
 00595580    mov         edx,dword ptr [ebp-8]
 00595583    mov         eax,59562C;'encoding'
 00595588    call        ExtractAttrValue
>0059558D    jmp         005955AC
 0059558F    push        esi
 00595590    mov         ecx,dword ptr [ebp-10]
 00595593    mov         edx,dword ptr [ebp-8]
 00595596    mov         eax,59564C;'standalone'
 0059559B    call        ExtractAttrValue
>005955A0    jmp         005955AC
 005955A2    mov         eax,esi
 005955A4    mov         edx,dword ptr [ebp-10]
 005955A7    call        @UStrAsg
 005955AC    xor         eax,eax
 005955AE    pop         edx
 005955AF    pop         ecx
 005955B0    pop         ecx
 005955B1    mov         dword ptr fs:[eax],edx
 005955B4    push        5955E9
 005955B9    lea         eax,[ebp-24]
 005955BC    call        @VarClr
 005955C1    lea         eax,[ebp-14]
 005955C4    call        @IntfClear
 005955C9    lea         eax,[ebp-0C]
 005955CC    call        @IntfClear
 005955D1    lea         eax,[ebp-8]
 005955D4    call        @UStrClr
 005955D9    lea         eax,[ebp-4]
 005955DC    call        @IntfClear
 005955E1    ret
>005955E2    jmp         @HandleFinally
>005955E7    jmp         005955B9
 005955E9    pop         edi
 005955EA    pop         esi
 005955EB    pop         ebx
 005955EC    mov         esp,ebp
 005955EE    pop         ebp
 005955EF    ret         4
*}
end;

//00595664
function TXMLDocument.InternalSetPrologValue(const PrologNode:IXMLNode; const Value:Variant; PrologItem:TXMLPrologItem):UnicodeString;
begin
{*
 00595664    push        ebp
 00595665    mov         ebp,esp
 00595667    push        0
 00595669    push        0
 0059566B    push        0
 0059566D    push        0
 0059566F    push        ebx
 00595670    push        esi
 00595671    mov         dword ptr [ebp-10],ecx
 00595674    mov         esi,eax
 00595676    mov         ebx,dword ptr [ebp+8]
 00595679    xor         eax,eax
 0059567B    push        ebp
 0059567C    push        59574E
 00595681    push        dword ptr fs:[eax]
 00595684    mov         dword ptr fs:[eax],esp
 00595687    test        edx,edx
>00595689    je          005956BD
 0059568B    lea         eax,[ebp-4]
 0059568E    push        eax
 0059568F    mov         ecx,59576C;'1.0'
 00595694    xor         edx,edx
 00595696    mov         eax,esi
 00595698    call        TXMLDocument.GetPrologValue
 0059569D    lea         eax,[ebp-8]
 005956A0    push        eax
 005956A1    xor         ecx,ecx
 005956A3    mov         dl,1
 005956A5    mov         eax,esi
 005956A7    call        TXMLDocument.GetPrologValue
 005956AC    lea         eax,[ebp-0C]
 005956AF    push        eax
 005956B0    xor         ecx,ecx
 005956B2    mov         dl,2
 005956B4    mov         eax,esi
 005956B6    call        TXMLDocument.GetPrologValue
>005956BB    jmp         005956CA
 005956BD    lea         eax,[ebp-4]
 005956C0    mov         edx,59576C;'1.0'
 005956C5    call        @UStrLAsg
 005956CA    movzx       eax,byte ptr [ebp+0C]
 005956CE    sub         al,1
>005956D0    jb          005956DA
>005956D2    je          005956E7
 005956D4    dec         al
>005956D6    je          005956F4
>005956D8    jmp         005956FF
 005956DA    lea         eax,[ebp-4]
 005956DD    mov         edx,dword ptr [ebp-10]
 005956E0    call        @VarToUStr
>005956E5    jmp         005956FF
 005956E7    lea         eax,[ebp-8]
 005956EA    mov         edx,dword ptr [ebp-10]
 005956ED    call        @VarToUStr
>005956F2    jmp         005956FF
 005956F4    lea         eax,[ebp-0C]
 005956F7    mov         edx,dword ptr [ebp-10]
 005956FA    call        @VarToUStr
 005956FF    mov         eax,ebx
 00595701    call        @UStrClr
 00595706    mov         eax,ebx
 00595708    mov         ecx,dword ptr [ebp-4]
 0059570B    mov         edx,595780;'version'
 00595710    call        AppendItem
 00595715    mov         eax,ebx
 00595717    mov         ecx,dword ptr [ebp-8]
 0059571A    mov         edx,59579C;'encoding'
 0059571F    call        AppendItem
 00595724    mov         eax,ebx
 00595726    mov         ecx,dword ptr [ebp-0C]
 00595729    mov         edx,5957BC;'standalone'
 0059572E    call        AppendItem
 00595733    xor         eax,eax
 00595735    pop         edx
 00595736    pop         ecx
 00595737    pop         ecx
 00595738    mov         dword ptr fs:[eax],edx
 0059573B    push        595755
 00595740    lea         eax,[ebp-0C]
 00595743    mov         edx,3
 00595748    call        @UStrArrayClr
 0059574D    ret
>0059574E    jmp         @HandleFinally
>00595753    jmp         00595740
 00595755    pop         esi
 00595756    pop         ebx
 00595757    mov         esp,ebp
 00595759    pop         ebp
 0059575A    ret         8
*}
end;

//005957D4
procedure TXMLDocument.SetPrologValue(const Value:Variant; PrologItem:TXMLPrologItem);
begin
{*
 005957D4    push        ebp
 005957D5    mov         ebp,esp
 005957D7    push        ecx
 005957D8    mov         ecx,5
 005957DD    push        0
 005957DF    push        0
 005957E1    dec         ecx
>005957E2    jne         005957DD
 005957E4    push        ecx
 005957E5    xchg        ecx,dword ptr [ebp-4]
 005957E8    push        ebx
 005957E9    push        esi
 005957EA    push        edi
 005957EB    mov         ebx,ecx
 005957ED    mov         edi,edx
 005957EF    mov         esi,eax
 005957F1    xor         eax,eax
 005957F3    push        ebp
 005957F4    push        595970
 005957F9    push        dword ptr fs:[eax]
 005957FC    mov         dword ptr fs:[eax],esp
 005957FF    lea         eax,[ebp-10]
 00595802    call        @IntfClear
 00595807    push        eax
 00595808    push        595980
 0059580D    lea         edx,[ebp-14]
 00595810    mov         eax,esi
 00595812    call        TXMLDocument.GetDOMDocument
 00595817    mov         eax,dword ptr [ebp-14]
 0059581A    push        eax
 0059581B    mov         eax,dword ptr [eax]
 0059581D    call        dword ptr [eax]
 0059581F    test        eax,eax
>00595821    jne         00595893
 00595823    sub         bl,1
>00595826    jb          00595833
>00595828    je          00595854
 0059582A    dec         bl
>0059582C    je          00595875
>0059582E    jmp         0059590A
 00595833    lea         eax,[ebp-18]
 00595836    mov         edx,edi
 00595838    call        @VarToUStr
 0059583D    mov         eax,dword ptr [ebp-18]
 00595840    push        eax
 00595841    mov         eax,dword ptr [ebp-10]
 00595844    push        eax
 00595845    mov         eax,dword ptr [eax]
 00595847    call        dword ptr [eax+20]
 0059584A    call        @CheckAutoResult
>0059584F    jmp         0059590A
 00595854    lea         eax,[ebp-1C]
 00595857    mov         edx,edi
 00595859    call        @VarToUStr
 0059585E    mov         eax,dword ptr [ebp-1C]
 00595861    push        eax
 00595862    mov         eax,dword ptr [ebp-10]
 00595865    push        eax
 00595866    mov         eax,dword ptr [eax]
 00595868    call        dword ptr [eax+18]
 0059586B    call        @CheckAutoResult
>00595870    jmp         0059590A
 00595875    lea         eax,[ebp-20]
 00595878    mov         edx,edi
 0059587A    call        @VarToUStr
 0059587F    mov         eax,dword ptr [ebp-20]
 00595882    push        eax
 00595883    mov         eax,dword ptr [ebp-10]
 00595886    push        eax
 00595887    mov         eax,dword ptr [eax]
 00595889    call        dword ptr [eax+1C]
 0059588C    call        @CheckAutoResult
>00595891    jmp         0059590A
 00595893    lea         edx,[ebp-0C]
 00595896    mov         eax,esi
 00595898    call        TXMLDocument.GetPrologNode
 0059589D    push        ebx
 0059589E    lea         eax,[ebp-4]
 005958A1    push        eax
 005958A2    mov         ecx,edi
 005958A4    mov         edx,dword ptr [ebp-0C]
 005958A7    mov         eax,esi
 005958A9    call        TXMLDocument.InternalSetPrologValue
 005958AE    mov         eax,dword ptr [ebp-4]
 005958B1    push        eax
 005958B2    lea         eax,[ebp-8]
 005958B5    push        eax
 005958B6    mov         cl,7
 005958B8    mov         edx,59599C;'xml'
 005958BD    mov         eax,esi
 005958BF    call        TXMLDocument.CreateNode
 005958C4    cmp         dword ptr [ebp-0C],0
>005958C8    je          005958F3
 005958CA    lea         eax,[ebp-24]
 005958CD    push        eax
 005958CE    lea         edx,[ebp-2C]
 005958D1    mov         eax,esi
 005958D3    call        TXMLDocument.GetDocumentNode
 005958D8    mov         eax,dword ptr [ebp-2C]
 005958DB    lea         edx,[ebp-28]
 005958DE    mov         ecx,dword ptr [eax]
 005958E0    call        dword ptr [ecx+14]
 005958E3    mov         eax,dword ptr [ebp-28]
 005958E6    mov         ecx,dword ptr [ebp-8]
 005958E9    mov         edx,dword ptr [ebp-0C]
 005958EC    mov         ebx,dword ptr [eax]
 005958EE    call        dword ptr [ebx+64]
>005958F1    jmp         0059590A
 005958F3    lea         edx,[ebp-30]
 005958F6    mov         eax,esi
 005958F8    call        TXMLDocument.GetChildNodes
 005958FD    mov         eax,dword ptr [ebp-30]
 00595900    mov         ecx,dword ptr [ebp-8]
 00595903    xor         edx,edx
 00595905    mov         ebx,dword ptr [eax]
 00595907    call        dword ptr [ebx+58]
 0059590A    xor         eax,eax
 0059590C    pop         edx
 0059590D    pop         ecx
 0059590E    pop         ecx
 0059590F    mov         dword ptr fs:[eax],edx
 00595912    push        595977
 00595917    lea         eax,[ebp-30]
 0059591A    call        @IntfClear
 0059591F    lea         eax,[ebp-2C]
 00595922    call        @IntfClear
 00595927    lea         eax,[ebp-28]
 0059592A    call        @IntfClear
 0059592F    lea         eax,[ebp-24]
 00595932    call        @IntfClear
 00595937    lea         eax,[ebp-20]
 0059593A    mov         edx,3
 0059593F    call        @UStrArrayClr
 00595944    lea         eax,[ebp-14]
 00595947    call        @IntfClear
 0059594C    lea         eax,[ebp-10]
 0059594F    call        @IntfClear
 00595954    lea         eax,[ebp-0C]
 00595957    mov         edx,dword ptr ds:[58A824];IXMLNode
 0059595D    mov         ecx,2
 00595962    call        @FinalizeArray
 00595967    lea         eax,[ebp-4]
 0059596A    call        @UStrClr
 0059596F    ret
>00595970    jmp         @HandleFinally
>00595975    jmp         00595917
 00595977    pop         edi
 00595978    pop         esi
 00595979    pop         ebx
 0059597A    mov         esp,ebp
 0059597C    pop         ebp
 0059597D    ret
*}
end;

//005959A4
function TXMLDocument.GetEncoding:DOMString;
begin
{*
 005959A4    push        ebx
 005959A5    push        esi
 005959A6    mov         esi,edx
 005959A8    mov         ebx,eax
 005959AA    push        esi
 005959AB    xor         ecx,ecx
 005959AD    mov         dl,1
 005959AF    mov         eax,ebx
 005959B1    call        TXMLDocument.GetPrologValue
 005959B6    pop         esi
 005959B7    pop         ebx
 005959B8    ret
*}
end;

//005959BC
procedure TXMLDocument.SetEncoding(const Value:DOMString);
begin
{*
 005959BC    push        ebp
 005959BD    mov         ebp,esp
 005959BF    xor         ecx,ecx
 005959C1    push        ecx
 005959C2    push        ecx
 005959C3    push        ecx
 005959C4    push        ecx
 005959C5    push        ebx
 005959C6    push        esi
 005959C7    mov         esi,edx
 005959C9    mov         ebx,eax
 005959CB    xor         eax,eax
 005959CD    push        ebp
 005959CE    push        595A05
 005959D3    push        dword ptr fs:[eax]
 005959D6    mov         dword ptr fs:[eax],esp
 005959D9    lea         eax,[ebp-10]
 005959DC    mov         edx,esi
 005959DE    call        @VarFromUStr
 005959E3    lea         edx,[ebp-10]
 005959E6    mov         cl,1
 005959E8    mov         eax,ebx
 005959EA    call        TXMLDocument.SetPrologValue
 005959EF    xor         eax,eax
 005959F1    pop         edx
 005959F2    pop         ecx
 005959F3    pop         ecx
 005959F4    mov         dword ptr fs:[eax],edx
 005959F7    push        595A0C
 005959FC    lea         eax,[ebp-10]
 005959FF    call        @VarClr
 00595A04    ret
>00595A05    jmp         @HandleFinally
>00595A0A    jmp         005959FC
 00595A0C    pop         esi
 00595A0D    pop         ebx
 00595A0E    mov         esp,ebp
 00595A10    pop         ebp
 00595A11    ret
*}
end;

//00595A14
function TXMLDocument.GetVersion:DOMString;
begin
{*
 00595A14    push        ebx
 00595A15    push        esi
 00595A16    mov         esi,edx
 00595A18    mov         ebx,eax
 00595A1A    push        esi
 00595A1B    xor         ecx,ecx
 00595A1D    xor         edx,edx
 00595A1F    mov         eax,ebx
 00595A21    call        TXMLDocument.GetPrologValue
 00595A26    pop         esi
 00595A27    pop         ebx
 00595A28    ret
*}
end;

//00595A2C
procedure TXMLDocument.SetVersion(const Value:DOMString);
begin
{*
 00595A2C    push        ebp
 00595A2D    mov         ebp,esp
 00595A2F    xor         ecx,ecx
 00595A31    push        ecx
 00595A32    push        ecx
 00595A33    push        ecx
 00595A34    push        ecx
 00595A35    push        ebx
 00595A36    push        esi
 00595A37    mov         esi,edx
 00595A39    mov         ebx,eax
 00595A3B    xor         eax,eax
 00595A3D    push        ebp
 00595A3E    push        595A75
 00595A43    push        dword ptr fs:[eax]
 00595A46    mov         dword ptr fs:[eax],esp
 00595A49    lea         eax,[ebp-10]
 00595A4C    mov         edx,esi
 00595A4E    call        @VarFromUStr
 00595A53    lea         edx,[ebp-10]
 00595A56    xor         ecx,ecx
 00595A58    mov         eax,ebx
 00595A5A    call        TXMLDocument.SetPrologValue
 00595A5F    xor         eax,eax
 00595A61    pop         edx
 00595A62    pop         ecx
 00595A63    pop         ecx
 00595A64    mov         dword ptr fs:[eax],edx
 00595A67    push        595A7C
 00595A6C    lea         eax,[ebp-10]
 00595A6F    call        @VarClr
 00595A74    ret
>00595A75    jmp         @HandleFinally
>00595A7A    jmp         00595A6C
 00595A7C    pop         esi
 00595A7D    pop         ebx
 00595A7E    mov         esp,ebp
 00595A80    pop         ebp
 00595A81    ret
*}
end;

//00595A84
function TXMLDocument.GetStandAlone:DOMString;
begin
{*
 00595A84    push        ebx
 00595A85    push        esi
 00595A86    mov         esi,edx
 00595A88    mov         ebx,eax
 00595A8A    push        esi
 00595A8B    xor         ecx,ecx
 00595A8D    mov         dl,2
 00595A8F    mov         eax,ebx
 00595A91    call        TXMLDocument.GetPrologValue
 00595A96    pop         esi
 00595A97    pop         ebx
 00595A98    ret
*}
end;

//00595A9C
procedure TXMLDocument.SetStandAlone(const Value:DOMString);
begin
{*
 00595A9C    push        ebp
 00595A9D    mov         ebp,esp
 00595A9F    xor         ecx,ecx
 00595AA1    push        ecx
 00595AA2    push        ecx
 00595AA3    push        ecx
 00595AA4    push        ecx
 00595AA5    push        ebx
 00595AA6    push        esi
 00595AA7    mov         esi,edx
 00595AA9    mov         ebx,eax
 00595AAB    xor         eax,eax
 00595AAD    push        ebp
 00595AAE    push        595AE5
 00595AB3    push        dword ptr fs:[eax]
 00595AB6    mov         dword ptr fs:[eax],esp
 00595AB9    lea         eax,[ebp-10]
 00595ABC    mov         edx,esi
 00595ABE    call        @VarFromUStr
 00595AC3    lea         edx,[ebp-10]
 00595AC6    mov         cl,2
 00595AC8    mov         eax,ebx
 00595ACA    call        TXMLDocument.SetPrologValue
 00595ACF    xor         eax,eax
 00595AD1    pop         edx
 00595AD2    pop         ecx
 00595AD3    pop         ecx
 00595AD4    mov         dword ptr fs:[eax],edx
 00595AD7    push        595AEC
 00595ADC    lea         eax,[ebp-10]
 00595ADF    call        @VarClr
 00595AE4    ret
>00595AE5    jmp         @HandleFinally
>00595AEA    jmp         00595ADC
 00595AEC    pop         esi
 00595AED    pop         ebx
 00595AEE    mov         esp,ebp
 00595AF0    pop         ebp
 00595AF1    ret
*}
end;

//00595AF4
procedure TXMLDocument.DoAfterClose;
begin
{*
 00595AF4    push        ebx
 00595AF5    cmp         word ptr [eax+8A],0
>00595AFD    je          00595B0F
 00595AFF    mov         ebx,eax
 00595B01    mov         edx,eax
 00595B03    mov         eax,dword ptr [ebx+8C]
 00595B09    call        dword ptr [ebx+88]
 00595B0F    pop         ebx
 00595B10    ret
*}
end;

//00595B14
procedure TXMLDocument.DoAfterOpen;
begin
{*
 00595B14    push        ebx
 00595B15    cmp         word ptr [eax+0A2],0
>00595B1D    je          00595B2F
 00595B1F    mov         ebx,eax
 00595B21    mov         edx,eax
 00595B23    mov         eax,dword ptr [ebx+0A4]
 00595B29    call        dword ptr [ebx+0A0]
 00595B2F    pop         ebx
 00595B30    ret
*}
end;

//00595B34
procedure TXMLDocument.DoBeforeClose;
begin
{*
 00595B34    push        ebx
 00595B35    cmp         word ptr [eax+9A],0
>00595B3D    je          00595B4F
 00595B3F    mov         ebx,eax
 00595B41    mov         edx,eax
 00595B43    mov         eax,dword ptr [ebx+9C]
 00595B49    call        dword ptr [ebx+98]
 00595B4F    pop         ebx
 00595B50    ret
*}
end;

//00595B54
procedure TXMLDocument.DoBeforeOpen;
begin
{*
 00595B54    push        ebx
 00595B55    cmp         word ptr [eax+92],0
>00595B5D    je          00595B6F
 00595B5F    mov         ebx,eax
 00595B61    mov         edx,eax
 00595B63    mov         eax,dword ptr [ebx+94]
 00595B69    call        dword ptr [ebx+90]
 00595B6F    pop         ebx
 00595B70    ret
*}
end;

//00595B74
procedure TXMLDocument.DoNodeChange(const Node:IXMLNode; ChangeType:TNodeChange; BeforeOperation:Boolean);
begin
{*
 00595B74    push        ebp
 00595B75    mov         ebp,esp
 00595B77    push        ebx
 00595B78    push        esi
 00595B79    push        edi
 00595B7A    mov         ebx,ecx
 00595B7C    mov         esi,edx
 00595B7E    mov         edi,eax
 00595B80    mov         dl,1
 00595B82    mov         eax,edi
 00595B84    call        TXMLDocument.SetModified
 00595B89    cmp         byte ptr [ebp+8],0
>00595B8D    je          00595BAB
 00595B8F    cmp         word ptr [edi+0B2],0
>00595B97    je          00595BC5
 00595B99    mov         ecx,ebx
 00595B9B    mov         edx,esi
 00595B9D    mov         eax,dword ptr [edi+0B4]
 00595BA3    call        dword ptr [edi+0B0]
>00595BA9    jmp         00595BC5
 00595BAB    cmp         word ptr [edi+0BA],0
>00595BB3    je          00595BC5
 00595BB5    mov         ecx,ebx
 00595BB7    mov         edx,esi
 00595BB9    mov         eax,dword ptr [edi+0BC]
 00595BBF    call        dword ptr [edi+0B8]
 00595BC5    pop         edi
 00595BC6    pop         esi
 00595BC7    pop         ebx
 00595BC8    pop         ebp
 00595BC9    ret         4
*}
end;

Initialization
Finalization
//00595BCC
{*
 00595BCC    push        ebp
 00595BCD    mov         ebp,esp
 00595BCF    xor         eax,eax
 00595BD1    push        ebp
 00595BD2    push        595C51
 00595BD7    push        dword ptr fs:[eax]
 00595BDA    mov         dword ptr fs:[eax],esp
 00595BDD    inc         dword ptr ds:[81558C]
>00595BE3    jne         00595C43
 00595BE5    mov         eax,789B68;^'  '
 00595BEA    call        @UStrClr
 00595BEF    mov         eax,789B70;^'false'
 00595BF4    mov         ecx,2
 00595BF9    mov         edx,dword ptr ds:[40128C];string
 00595BFF    call        @FinalizeArray
 00595C04    mov         eax,789B78;^'ISO-8859-1'
 00595C09    mov         ecx,2
 00595C0E    mov         edx,dword ptr ds:[40128C];string
 00595C14    call        @FinalizeArray
 00595C19    mov         eax,789B80;^'UTF-16'
 00595C1E    mov         ecx,3
 00595C23    mov         edx,dword ptr ds:[40128C];string
 00595C29    call        @FinalizeArray
 00595C2E    mov         eax,789B94;^'UTF-16'
 00595C33    mov         ecx,3
 00595C38    mov         edx,dword ptr ds:[40128C];string
 00595C3E    call        @FinalizeArray
 00595C43    xor         eax,eax
 00595C45    pop         edx
 00595C46    pop         ecx
 00595C47    pop         ecx
 00595C48    mov         dword ptr fs:[eax],edx
 00595C4B    push        595C58
 00595C50    ret
>00595C51    jmp         @HandleFinally
>00595C56    jmp         00595C50
 00595C58    pop         ebp
 00595C59    ret
*}
end.