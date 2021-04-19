//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit JvPropertyStorage;

interface

uses
  SysUtils, Classes, System, JvAppStorage;

type
  TJvPropInfoList = class(TObject)
  published
    function Find(AName:ShortString):PPropInfo;//0071E6EC
    procedure Delete(Index:Integer);//0071E794
    procedure Intersect(List:TJvPropInfoList);//0071E7C4
    constructor Create(AObject:TObject; Filter:TTypeKinds);//0071E570
    destructor Destroy();//0071E604
    function Contains(P:PPropInfo):Boolean;//0071E638
  public
    FList:PPropList;//f4
    FCount:Integer;//f8
    FSize:Integer;//fC
  end;
  TJvPropertyStorage = class(TObject)
  published
    procedure LoadProperties(PropList:TStrings);//0071ED10
    procedure LoadObjectsProps(AComponent:TComponent; StoredList:TStrings);//0071EF50
    procedure StoreObjectsProps(AComponent:TComponent; StoredList:TStrings);//0071F0E8
    procedure StoreAnyProperty(PropInfo:PPropInfo);//0071EB9C
    procedure LoadAnyProperty(PropInfo:PPropInfo);//0071EB14
    procedure StoreProperties(PropList:TStrings);//0071EC00
  public
    FObject:TObject;//f4
    FOwner:TComponent;//f8
    FPrefix:string;//fC
    FAppStorage:TJvCustomAppStorage;//f10
    FAppStoragePath:string;//f14
    //procedure v0(?:?; ?:?; ?:?; ?:?); virtual;//v0//0071F298
    //procedure v4(?:?; ?:?; ?:?); virtual;//v4//0071F344
    procedure v8; virtual;//v8//0071F3DC
    //procedure vC(?:?; ?:?); virtual;//vC//0071EABC
    procedure v10; virtual;//v10//0071F280
  end;
    //procedure sub_0071E7F8(?:?; ?:?; ?:?);//0071E7F8
    //function sub_0071E838(?:?; ?:?; ?:?):?;//0071E838
    //procedure sub_0071E91C(?:?; ?:TComponentName; ?:?);//0071E91C
    //procedure sub_0071E988(?:TComponent; ?:TJvFormStorageStringList; ?:?);//0071E988
    //procedure sub_0071EABC(?:?; ?:?);//0071EABC
    //function sub_0071EE20(?:TJvPropertyStorage; ?:TComponent; ?:TStrings):?;//0071EE20
    //procedure sub_0071EF1C(?:TJvPropertyStorage; ?:?);//0071EF1C
    procedure sub_0071F280;//0071F280
    //procedure sub_0071F298(?:?; ?:?; ?:?; ?:?);//0071F298
    //procedure sub_0071F344(?:?; ?:?; ?:?);//0071F344
    procedure sub_0071F3DC;//0071F3DC
    //procedure sub_0071F3EC(?:TJvPropertyStorage; ?:string; ?:?; ?:?; ?:?);//0071F3EC
    //procedure sub_0071F5CC(?:TJvPropertyStorage; ?:string; ?:?; ?:?; ?:?);//0071F5CC

implementation

//0071E570
constructor TJvPropInfoList.Create(AObject:TObject; Filter:TTypeKinds);
begin
{*
 0071E570    push        ebp
 0071E571    mov         ebp,esp
 0071E573    push        ecx
 0071E574    push        ebx
 0071E575    push        esi
 0071E576    push        edi
 0071E577    test        dl,dl
>0071E579    je          0071E583
 0071E57B    add         esp,0FFFFFFF0
 0071E57E    call        @ClassCreate
 0071E583    mov         esi,ecx
 0071E585    mov         byte ptr [ebp-1],dl
 0071E588    mov         ebx,eax
 0071E58A    mov         edi,dword ptr [ebp+8]
 0071E58D    xor         edx,edx
 0071E58F    mov         eax,ebx
 0071E591    call        TObject.Create
 0071E596    test        esi,esi
>0071E598    je          0071E5D9
 0071E59A    push        1
 0071E59C    mov         eax,dword ptr [esi]
 0071E59E    call        TObject.ClassInfo
 0071E5A3    xor         ecx,ecx
 0071E5A5    mov         edx,edi
 0071E5A7    call        GetPropList
 0071E5AC    mov         dword ptr [ebx+8],eax;TJvPropInfoList.FCount:Integer
 0071E5AF    mov         eax,dword ptr [ebx+8];TJvPropInfoList.FCount:Integer
 0071E5B2    add         eax,eax
 0071E5B4    add         eax,eax
 0071E5B6    mov         dword ptr [ebx+0C],eax;TJvPropInfoList.FSize:Integer
 0071E5B9    mov         eax,dword ptr [ebx+0C];TJvPropInfoList.FSize:Integer
 0071E5BC    call        @GetMem
 0071E5C1    mov         dword ptr [ebx+4],eax;TJvPropInfoList.FList:PPropList
 0071E5C4    push        1
 0071E5C6    mov         eax,dword ptr [esi]
 0071E5C8    call        TObject.ClassInfo
 0071E5CD    mov         ecx,dword ptr [ebx+4];TJvPropInfoList.FList:PPropList
 0071E5D0    mov         edx,edi
 0071E5D2    call        GetPropList
>0071E5D7    jmp         0071E5E3
 0071E5D9    xor         eax,eax
 0071E5DB    mov         dword ptr [ebx+8],eax;TJvPropInfoList.FCount:Integer
 0071E5DE    xor         eax,eax
 0071E5E0    mov         dword ptr [ebx+4],eax;TJvPropInfoList.FList:PPropList
 0071E5E3    mov         eax,ebx
 0071E5E5    cmp         byte ptr [ebp-1],0
>0071E5E9    je          0071E5FA
 0071E5EB    call        @AfterConstruction
 0071E5F0    pop         dword ptr fs:[0]
 0071E5F7    add         esp,0C
 0071E5FA    mov         eax,ebx
 0071E5FC    pop         edi
 0071E5FD    pop         esi
 0071E5FE    pop         ebx
 0071E5FF    pop         ecx
 0071E600    pop         ebp
 0071E601    ret         4
*}
end;

//0071E604
destructor TJvPropInfoList.Destroy();
begin
{*
 0071E604    push        ebx
 0071E605    push        esi
 0071E606    call        @BeforeDestruction
 0071E60B    mov         ebx,edx
 0071E60D    mov         esi,eax
 0071E60F    mov         eax,dword ptr [esi+4];TJvPropInfoList.FList:PPropList
 0071E612    test        eax,eax
>0071E614    je          0071E61E
 0071E616    mov         edx,dword ptr [esi+0C];TJvPropInfoList.FSize:Integer
 0071E619    call        @FreeMem
 0071E61E    mov         edx,ebx
 0071E620    and         dl,0FC
 0071E623    mov         eax,esi
 0071E625    call        TObject.Destroy
 0071E62A    test        bl,bl
>0071E62C    jle         0071E635
 0071E62E    mov         eax,esi
 0071E630    call        @ClassDestroy
 0071E635    pop         esi
 0071E636    pop         ebx
 0071E637    ret
*}
end;

//0071E638
function TJvPropInfoList.Contains(P:PPropInfo):Boolean;
begin
{*
 0071E638    push        ebp
 0071E639    mov         ebp,esp
 0071E63B    add         esp,0FFFFFFF0
 0071E63E    push        ebx
 0071E63F    push        esi
 0071E640    push        edi
 0071E641    xor         ecx,ecx
 0071E643    mov         dword ptr [ebp-0C],ecx
 0071E646    mov         dword ptr [ebp-10],ecx
 0071E649    mov         edi,edx
 0071E64B    mov         dword ptr [ebp-4],eax
 0071E64E    xor         eax,eax
 0071E650    push        ebp
 0071E651    push        71E6D9
 0071E656    push        dword ptr fs:[eax]
 0071E659    mov         dword ptr fs:[eax],esp
 0071E65C    mov         eax,dword ptr [ebp-4]
 0071E65F    mov         esi,dword ptr [eax+8];TJvPropInfoList.FCount:Integer
 0071E662    dec         esi
 0071E663    test        esi,esi
>0071E665    jl          0071E6BC
 0071E667    inc         esi
 0071E668    mov         dword ptr [ebp-8],0
 0071E66F    mov         eax,dword ptr [ebp-4]
 0071E672    mov         eax,dword ptr [eax+4];TJvPropInfoList.FList:PPropList
 0071E675    mov         edx,dword ptr [ebp-8]
 0071E678    mov         ebx,dword ptr [eax+edx*4]
 0071E67B    mov         eax,dword ptr [edi]
 0071E67D    cmp         eax,dword ptr [ebx]
>0071E67F    jne         0071E6B6
 0071E681    lea         eax,[ebp-0C]
 0071E684    lea         edx,[edi+1A]
 0071E687    mov         ecx,0
 0071E68C    call        @LStrFromString
 0071E691    mov         eax,dword ptr [ebp-0C]
 0071E694    push        eax
 0071E695    lea         eax,[ebp-10]
 0071E698    lea         edx,[ebx+1A]
 0071E69B    mov         ecx,0
 0071E6A0    call        @LStrFromString
 0071E6A5    mov         eax,dword ptr [ebp-10]
 0071E6A8    pop         edx
 0071E6A9    call        00456F4C
 0071E6AE    test        eax,eax
>0071E6B0    jne         0071E6B6
 0071E6B2    mov         bl,1
>0071E6B4    jmp         0071E6BE
 0071E6B6    inc         dword ptr [ebp-8]
 0071E6B9    dec         esi
>0071E6BA    jne         0071E66F
 0071E6BC    xor         ebx,ebx
 0071E6BE    xor         eax,eax
 0071E6C0    pop         edx
 0071E6C1    pop         ecx
 0071E6C2    pop         ecx
 0071E6C3    mov         dword ptr fs:[eax],edx
 0071E6C6    push        71E6E0
 0071E6CB    lea         eax,[ebp-10]
 0071E6CE    mov         edx,2
 0071E6D3    call        @LStrArrayClr
 0071E6D8    ret
>0071E6D9    jmp         @HandleFinally
>0071E6DE    jmp         0071E6CB
 0071E6E0    mov         eax,ebx
 0071E6E2    pop         edi
 0071E6E3    pop         esi
 0071E6E4    pop         ebx
 0071E6E5    mov         esp,ebp
 0071E6E7    pop         ebp
 0071E6E8    ret
*}
end;

//0071E6EC
function TJvPropInfoList.Find(AName:ShortString):PPropInfo;
begin
{*
 0071E6EC    push        ebp
 0071E6ED    mov         ebp,esp
 0071E6EF    add         esp,0FFFFFFF0
 0071E6F2    push        ebx
 0071E6F3    push        esi
 0071E6F4    push        edi
 0071E6F5    xor         ecx,ecx
 0071E6F7    mov         dword ptr [ebp-0C],ecx
 0071E6FA    mov         dword ptr [ebp-10],ecx
 0071E6FD    mov         dword ptr [ebp-4],edx
 0071E700    mov         edi,eax
 0071E702    xor         eax,eax
 0071E704    push        ebp
 0071E705    push        71E781
 0071E70A    push        dword ptr fs:[eax]
 0071E70D    mov         dword ptr fs:[eax],esp
 0071E710    mov         esi,dword ptr [edi+8];TJvPropInfoList.FCount:Integer
 0071E713    dec         esi
 0071E714    test        esi,esi
>0071E716    jl          0071E764
 0071E718    inc         esi
 0071E719    xor         ebx,ebx
 0071E71B    mov         eax,dword ptr [edi+4];TJvPropInfoList.FList:PPropList
 0071E71E    mov         eax,dword ptr [eax+ebx*4]
 0071E721    mov         dword ptr [ebp-8],eax
 0071E724    lea         eax,[ebp-0C]
 0071E727    mov         edx,dword ptr [ebp-4]
 0071E72A    mov         ecx,0
 0071E72F    call        @LStrFromString
 0071E734    mov         eax,dword ptr [ebp-0C]
 0071E737    push        eax
 0071E738    lea         eax,[ebp-10]
 0071E73B    mov         edx,dword ptr [ebp-8]
 0071E73E    add         edx,1A
 0071E741    mov         ecx,0
 0071E746    call        @LStrFromString
 0071E74B    mov         eax,dword ptr [ebp-10]
 0071E74E    pop         edx
 0071E74F    call        00456F4C
 0071E754    test        eax,eax
>0071E756    jne         0071E760
 0071E758    mov         eax,dword ptr [edi+4];TJvPropInfoList.FList:PPropList
 0071E75B    mov         ebx,dword ptr [eax+ebx*4]
>0071E75E    jmp         0071E766
 0071E760    inc         ebx
 0071E761    dec         esi
>0071E762    jne         0071E71B
 0071E764    xor         ebx,ebx
 0071E766    xor         eax,eax
 0071E768    pop         edx
 0071E769    pop         ecx
 0071E76A    pop         ecx
 0071E76B    mov         dword ptr fs:[eax],edx
 0071E76E    push        71E788
 0071E773    lea         eax,[ebp-10]
 0071E776    mov         edx,2
 0071E77B    call        @LStrArrayClr
 0071E780    ret
>0071E781    jmp         @HandleFinally
>0071E786    jmp         0071E773
 0071E788    mov         eax,ebx
 0071E78A    pop         edi
 0071E78B    pop         esi
 0071E78C    pop         ebx
 0071E78D    mov         esp,ebp
 0071E78F    pop         ebp
 0071E790    ret
*}
end;

//0071E794
procedure TJvPropInfoList.Delete(Index:Integer);
begin
{*
 0071E794    push        ebx
 0071E795    push        esi
 0071E796    dec         dword ptr [eax+8];TJvPropInfoList.FCount:Integer
 0071E799    mov         ecx,dword ptr [eax+8];TJvPropInfoList.FCount:Integer
 0071E79C    cmp         edx,ecx
>0071E79E    jge         0071E7C0
 0071E7A0    mov         ebx,dword ptr [eax+4];TJvPropInfoList.FList:PPropList
 0071E7A3    lea         ebx,[ebx+edx*4+4]
 0071E7A7    mov         esi,dword ptr [eax+4];TJvPropInfoList.FList:PPropList
 0071E7AA    lea         esi,[esi+edx*4]
 0071E7AD    sub         ecx,edx
 0071E7AF    mov         eax,ecx
 0071E7B1    add         eax,eax
 0071E7B3    add         eax,eax
 0071E7B5    mov         ecx,eax
 0071E7B7    mov         eax,ebx
 0071E7B9    mov         edx,esi
 0071E7BB    call        Move
 0071E7C0    pop         esi
 0071E7C1    pop         ebx
 0071E7C2    ret
*}
end;

//0071E7C4
procedure TJvPropInfoList.Intersect(List:TJvPropInfoList);
begin
{*
 0071E7C4    push        ebx
 0071E7C5    push        esi
 0071E7C6    push        edi
 0071E7C7    mov         edi,edx
 0071E7C9    mov         esi,eax
 0071E7CB    mov         ebx,dword ptr [esi+8];TJvPropInfoList.FCount:Integer
 0071E7CE    dec         ebx
 0071E7CF    cmp         ebx,0
>0071E7D2    jl          0071E7F4
 0071E7D4    mov         eax,dword ptr [esi+4];TJvPropInfoList.FList:PPropList
 0071E7D7    mov         edx,dword ptr [eax+ebx*4]
 0071E7DA    mov         eax,edi
 0071E7DC    call        TJvPropInfoList.Contains
 0071E7E1    test        al,al
>0071E7E3    jne         0071E7EE
 0071E7E5    mov         edx,ebx
 0071E7E7    mov         eax,esi
 0071E7E9    call        TJvPropInfoList.Delete
 0071E7EE    dec         ebx
 0071E7EF    cmp         ebx,0FFFFFFFF
>0071E7F2    jne         0071E7D4
 0071E7F4    pop         edi
 0071E7F5    pop         esi
 0071E7F6    pop         ebx
 0071E7F7    ret
*}
end;

//0071E7F8
{*procedure sub_0071E7F8(?:?; ?:?; ?:?);
begin
 0071E7F8    push        ebx
 0071E7F9    push        esi
 0071E7FA    push        edi
 0071E7FB    mov         edi,ecx
 0071E7FD    mov         esi,edx
 0071E7FF    mov         ebx,eax
 0071E801    mov         eax,edi
 0071E803    call        @UStrClr
 0071E808    test        ebx,ebx
>0071E80A    je          0071E823
 0071E80C    test        esi,esi
>0071E80E    je          0071E823
 0071E810    push        ebx
 0071E811    push        71E834;'.'
 0071E816    push        esi
 0071E817    mov         eax,edi
 0071E819    mov         edx,3
 0071E81E    call        @UStrCatN
 0071E823    pop         edi
 0071E824    pop         esi
 0071E825    pop         ebx
 0071E826    ret
end;*}

//0071E838
{*function sub_0071E838(?:?; ?:?; ?:?):?;
begin
 0071E838    push        ebp
 0071E839    mov         ebp,esp
 0071E83B    push        0
 0071E83D    push        0
 0071E83F    push        0
 0071E841    push        0
 0071E843    push        0
 0071E845    push        0
 0071E847    push        ebx
 0071E848    push        esi
 0071E849    push        edi
 0071E84A    mov         dword ptr [ebp-8],ecx
 0071E84D    mov         dword ptr [ebp-4],edx
 0071E850    mov         edi,eax
 0071E852    xor         eax,eax
 0071E854    push        ebp
 0071E855    push        71E8FB
 0071E85A    push        dword ptr fs:[eax]
 0071E85D    mov         dword ptr fs:[eax],esp
 0071E860    xor         ebx,ebx
 0071E862    test        edi,edi
>0071E864    je          0071E8E0
 0071E866    mov         edx,edi
 0071E868    mov         eax,71E918;'.'
 0071E86D    call        Pos
 0071E872    mov         esi,eax
 0071E874    test        esi,esi
>0071E876    jle         0071E8E0
 0071E878    lea         eax,[ebp-10]
 0071E87B    push        eax
 0071E87C    mov         ecx,esi
 0071E87E    dec         ecx
 0071E87F    mov         edx,1
 0071E884    mov         eax,edi
 0071E886    call        @UStrCopy
 0071E88B    mov         eax,dword ptr [ebp-10]
 0071E88E    lea         edx,[ebp-0C]
 0071E891    call        Trim
 0071E896    mov         edx,dword ptr [ebp-0C]
 0071E899    mov         eax,dword ptr [ebp-4]
 0071E89C    call        @UStrAsg
 0071E8A1    lea         eax,[ebp-18]
 0071E8A4    push        eax
 0071E8A5    lea         edx,[esi+1]
 0071E8A8    mov         ecx,7FFFFFFF
 0071E8AD    mov         eax,edi
 0071E8AF    call        @UStrCopy
 0071E8B4    mov         eax,dword ptr [ebp-18]
 0071E8B7    lea         edx,[ebp-14]
 0071E8BA    call        Trim
 0071E8BF    mov         edx,dword ptr [ebp-14]
 0071E8C2    mov         eax,dword ptr [ebp-8]
 0071E8C5    call        @UStrAsg
 0071E8CA    mov         eax,dword ptr [ebp-4]
 0071E8CD    cmp         dword ptr [eax],0
>0071E8D0    je          0071E8DA
 0071E8D2    mov         eax,dword ptr [ebp-8]
 0071E8D5    cmp         dword ptr [eax],0
>0071E8D8    jne         0071E8DE
 0071E8DA    xor         ebx,ebx
>0071E8DC    jmp         0071E8E0
 0071E8DE    mov         bl,1
 0071E8E0    xor         eax,eax
 0071E8E2    pop         edx
 0071E8E3    pop         ecx
 0071E8E4    pop         ecx
 0071E8E5    mov         dword ptr fs:[eax],edx
 0071E8E8    push        71E902
 0071E8ED    lea         eax,[ebp-18]
 0071E8F0    mov         edx,4
 0071E8F5    call        @UStrArrayClr
 0071E8FA    ret
>0071E8FB    jmp         @HandleFinally
>0071E900    jmp         0071E8ED
 0071E902    mov         eax,ebx
 0071E904    pop         edi
 0071E905    pop         esi
 0071E906    pop         ebx
 0071E907    mov         esp,ebp
 0071E909    pop         ebp
 0071E90A    ret
end;*}

//0071E91C
{*procedure sub_0071E91C(?:?; ?:TComponentName; ?:?);
begin
 0071E91C    push        ebp
 0071E91D    mov         ebp,esp
 0071E91F    push        0
 0071E921    push        0
 0071E923    push        ebx
 0071E924    push        esi
 0071E925    push        edi
 0071E926    mov         ebx,ecx
 0071E928    mov         edi,edx
 0071E92A    mov         esi,eax
 0071E92C    xor         eax,eax
 0071E92E    push        ebp
 0071E92F    push        71E979
 0071E934    push        dword ptr fs:[eax]
 0071E937    mov         dword ptr fs:[eax],esp
 0071E93A    mov         eax,ebx
 0071E93C    call        @UStrClr
 0071E941    lea         ecx,[ebp-8]
 0071E944    lea         edx,[ebp-4]
 0071E947    mov         eax,esi
 0071E949    call        0071E838
 0071E94E    test        al,al
>0071E950    je          0071E95E
 0071E952    mov         ecx,ebx
 0071E954    mov         edx,dword ptr [ebp-8]
 0071E957    mov         eax,edi
 0071E959    call        0071E7F8
 0071E95E    xor         eax,eax
 0071E960    pop         edx
 0071E961    pop         ecx
 0071E962    pop         ecx
 0071E963    mov         dword ptr fs:[eax],edx
 0071E966    push        71E980
 0071E96B    lea         eax,[ebp-8]
 0071E96E    mov         edx,2
 0071E973    call        @UStrArrayClr
 0071E978    ret
>0071E979    jmp         @HandleFinally
>0071E97E    jmp         0071E96B
 0071E980    pop         edi
 0071E981    pop         esi
 0071E982    pop         ebx
 0071E983    pop         ecx
 0071E984    pop         ecx
 0071E985    pop         ebp
 0071E986    ret
end;*}

//0071E988
{*procedure sub_0071E988(?:TComponent; ?:TJvFormStorageStringList; ?:?);
begin
 0071E988    push        ebp
 0071E989    mov         ebp,esp
 0071E98B    push        0
 0071E98D    push        0
 0071E98F    push        0
 0071E991    push        0
 0071E993    push        0
 0071E995    push        0
 0071E997    push        0
 0071E999    push        0
 0071E99B    push        ebx
 0071E99C    push        esi
 0071E99D    push        edi
 0071E99E    mov         byte ptr [ebp-0D],cl
 0071E9A1    mov         esi,edx
 0071E9A3    mov         dword ptr [ebp-0C],eax
 0071E9A6    xor         eax,eax
 0071E9A8    push        ebp
 0071E9A9    push        71EAAD
 0071E9AE    push        dword ptr fs:[eax]
 0071E9B1    mov         dword ptr fs:[eax],esp
 0071E9B4    test        esi,esi
>0071E9B6    je          0071EA85
 0071E9BC    cmp         dword ptr [ebp-0C],0
>0071E9C0    je          0071EA85
 0071E9C6    mov         eax,esi
 0071E9C8    mov         edx,dword ptr [eax]
 0071E9CA    call        dword ptr [edx+14]
 0071E9CD    mov         ebx,eax
 0071E9CF    dec         ebx
 0071E9D0    cmp         ebx,0
>0071E9D3    jl          0071EA85
 0071E9D9    lea         ecx,[ebp-18]
 0071E9DC    mov         edx,ebx
 0071E9DE    mov         eax,esi
 0071E9E0    mov         edi,dword ptr [eax]
 0071E9E2    call        dword ptr [edi+0C]
 0071E9E5    mov         eax,dword ptr [ebp-18]
 0071E9E8    lea         ecx,[ebp-8]
 0071E9EB    lea         edx,[ebp-4]
 0071E9EE    call        0071E838
 0071E9F3    test        al,al
>0071E9F5    je          0071EA72
 0071E9F7    cmp         byte ptr [ebp-0D],0
>0071E9FB    je          0071EA2A
 0071E9FD    mov         edx,dword ptr [ebp-4]
 0071EA00    mov         eax,dword ptr [ebp-0C]
 0071EA03    call        TComponent.FindComponent
 0071EA08    mov         dword ptr [ebp-14],eax
 0071EA0B    cmp         dword ptr [ebp-14],0
>0071EA0F    jne         0071EA1C
 0071EA11    mov         edx,ebx
 0071EA13    mov         eax,esi
 0071EA15    mov         ecx,dword ptr [eax]
 0071EA17    call        dword ptr [ecx+48]
>0071EA1A    jmp         0071EA7B
 0071EA1C    mov         ecx,dword ptr [ebp-14]
 0071EA1F    mov         edx,ebx
 0071EA21    mov         eax,esi
 0071EA23    mov         edi,dword ptr [eax]
 0071EA25    call        dword ptr [edi+24]
>0071EA28    jmp         0071EA7B
 0071EA2A    mov         edx,ebx
 0071EA2C    mov         eax,esi
 0071EA2E    mov         ecx,dword ptr [eax]
 0071EA30    call        dword ptr [ecx+18]
 0071EA33    mov         dword ptr [ebp-14],eax
 0071EA36    cmp         dword ptr [ebp-14],0
>0071EA3A    je          0071EA67
 0071EA3C    lea         ecx,[ebp-20]
 0071EA3F    mov         edx,ebx
 0071EA41    mov         eax,esi
 0071EA43    mov         edi,dword ptr [eax]
 0071EA45    call        dword ptr [edi+0C]
 0071EA48    mov         eax,dword ptr [ebp-20]
 0071EA4B    lea         ecx,[ebp-1C]
 0071EA4E    mov         edx,dword ptr [ebp-14]
 0071EA51    mov         edx,dword ptr [edx+8];TComponent.FName:TComponentName
 0071EA54    call        0071E91C
 0071EA59    mov         ecx,dword ptr [ebp-1C]
 0071EA5C    mov         edx,ebx
 0071EA5E    mov         eax,esi
 0071EA60    mov         edi,dword ptr [eax]
 0071EA62    call        dword ptr [edi+20]
>0071EA65    jmp         0071EA7B
 0071EA67    mov         edx,ebx
 0071EA69    mov         eax,esi
 0071EA6B    mov         ecx,dword ptr [eax]
 0071EA6D    call        dword ptr [ecx+48]
>0071EA70    jmp         0071EA7B
 0071EA72    mov         edx,ebx
 0071EA74    mov         eax,esi
 0071EA76    mov         ecx,dword ptr [eax]
 0071EA78    call        dword ptr [ecx+48]
 0071EA7B    dec         ebx
 0071EA7C    cmp         ebx,0FFFFFFFF
>0071EA7F    jne         0071E9D9
 0071EA85    xor         eax,eax
 0071EA87    pop         edx
 0071EA88    pop         ecx
 0071EA89    pop         ecx
 0071EA8A    mov         dword ptr fs:[eax],edx
 0071EA8D    push        71EAB4
 0071EA92    lea         eax,[ebp-20]
 0071EA95    mov         edx,3
 0071EA9A    call        @UStrArrayClr
 0071EA9F    lea         eax,[ebp-8]
 0071EAA2    mov         edx,2
 0071EAA7    call        @UStrArrayClr
 0071EAAC    ret
>0071EAAD    jmp         @HandleFinally
>0071EAB2    jmp         0071EA92
 0071EAB4    pop         edi
 0071EAB5    pop         esi
 0071EAB6    pop         ebx
 0071EAB7    mov         esp,ebp
 0071EAB9    pop         ebp
 0071EABA    ret
end;*}

//0071EABC
{*procedure sub_0071EABC(?:?; ?:?);
begin
 0071EABC    push        ebp
 0071EABD    mov         ebp,esp
 0071EABF    push        0
 0071EAC1    push        ebx
 0071EAC2    push        esi
 0071EAC3    push        edi
 0071EAC4    mov         edi,ecx
 0071EAC6    mov         esi,edx
 0071EAC8    mov         ebx,eax
 0071EACA    xor         eax,eax
 0071EACC    push        ebp
 0071EACD    push        71EB05
 0071EAD2    push        dword ptr fs:[eax]
 0071EAD5    mov         dword ptr fs:[eax],esp
 0071EAD8    lea         eax,[ebp-4]
 0071EADB    mov         edx,esi
 0071EADD    call        @UStrFromString
 0071EAE2    mov         ecx,dword ptr [ebp-4]
 0071EAE5    mov         eax,edi
 0071EAE7    mov         edx,dword ptr [ebx+0C];TJvPropertyStorage.FPrefix:string
 0071EAEA    call        @UStrCat3
 0071EAEF    xor         eax,eax
 0071EAF1    pop         edx
 0071EAF2    pop         ecx
 0071EAF3    pop         ecx
 0071EAF4    mov         dword ptr fs:[eax],edx
 0071EAF7    push        71EB0C
 0071EAFC    lea         eax,[ebp-4]
 0071EAFF    call        @UStrClr
 0071EB04    ret
>0071EB05    jmp         @HandleFinally
>0071EB0A    jmp         0071EAFC
 0071EB0C    pop         edi
 0071EB0D    pop         esi
 0071EB0E    pop         ebx
 0071EB0F    pop         ecx
 0071EB10    pop         ebp
 0071EB11    ret
end;*}

//0071EB14
procedure TJvPropertyStorage.LoadAnyProperty(PropInfo:PPropInfo);
begin
{*
 0071EB14    push        ebp
 0071EB15    mov         ebp,esp
 0071EB17    push        0
 0071EB19    push        ebx
 0071EB1A    push        esi
 0071EB1B    push        edi
 0071EB1C    mov         esi,edx
 0071EB1E    mov         ebx,eax
 0071EB20    xor         eax,eax
 0071EB22    push        ebp
 0071EB23    push        71EB8C
 0071EB28    push        dword ptr fs:[eax]
 0071EB2B    mov         dword ptr fs:[eax],esp
 0071EB2E    xor         eax,eax
 0071EB30    push        ebp
 0071EB31    push        71EB6C
 0071EB36    push        dword ptr fs:[eax]
 0071EB39    mov         dword ptr fs:[eax],esp
 0071EB3C    test        esi,esi
>0071EB3E    je          0071EB62
 0071EB40    mov         eax,dword ptr [ebx+4];TJvPropertyStorage.FObject:TObject
 0071EB43    push        eax
 0071EB44    lea         eax,[esi+1A]
 0071EB47    push        eax
 0071EB48    lea         ecx,[ebp-4]
 0071EB4B    lea         edx,[esi+1A]
 0071EB4E    mov         eax,ebx
 0071EB50    mov         esi,dword ptr [eax]
 0071EB52    call        dword ptr [esi+0C];TJvPropertyStorage.sub_0071EABC
 0071EB55    mov         ecx,dword ptr [ebp-4]
 0071EB58    mov         edx,dword ptr [ebx+14];TJvPropertyStorage.FAppStoragePath:string
 0071EB5B    mov         eax,ebx
 0071EB5D    call        0071F3EC
 0071EB62    xor         eax,eax
 0071EB64    pop         edx
 0071EB65    pop         ecx
 0071EB66    pop         ecx
 0071EB67    mov         dword ptr fs:[eax],edx
>0071EB6A    jmp         0071EB76
>0071EB6C    jmp         @HandleAnyException
 0071EB71    call        @DoneExcept
 0071EB76    xor         eax,eax
 0071EB78    pop         edx
 0071EB79    pop         ecx
 0071EB7A    pop         ecx
 0071EB7B    mov         dword ptr fs:[eax],edx
 0071EB7E    push        71EB93
 0071EB83    lea         eax,[ebp-4]
 0071EB86    call        @UStrClr
 0071EB8B    ret
>0071EB8C    jmp         @HandleFinally
>0071EB91    jmp         0071EB83
 0071EB93    pop         edi
 0071EB94    pop         esi
 0071EB95    pop         ebx
 0071EB96    pop         ecx
 0071EB97    pop         ebp
 0071EB98    ret
*}
end;

//0071EB9C
procedure TJvPropertyStorage.StoreAnyProperty(PropInfo:PPropInfo);
begin
{*
 0071EB9C    push        ebp
 0071EB9D    mov         ebp,esp
 0071EB9F    push        0
 0071EBA1    push        ebx
 0071EBA2    push        esi
 0071EBA3    mov         esi,edx
 0071EBA5    mov         ebx,eax
 0071EBA7    xor         eax,eax
 0071EBA9    push        ebp
 0071EBAA    push        71EBF1
 0071EBAF    push        dword ptr fs:[eax]
 0071EBB2    mov         dword ptr fs:[eax],esp
 0071EBB5    test        esi,esi
>0071EBB7    je          0071EBDB
 0071EBB9    mov         eax,dword ptr [ebx+4];TJvPropertyStorage.FObject:TObject
 0071EBBC    push        eax
 0071EBBD    lea         eax,[esi+1A]
 0071EBC0    push        eax
 0071EBC1    lea         ecx,[ebp-4]
 0071EBC4    lea         edx,[esi+1A]
 0071EBC7    mov         eax,ebx
 0071EBC9    mov         esi,dword ptr [eax]
 0071EBCB    call        dword ptr [esi+0C];TJvPropertyStorage.sub_0071EABC
 0071EBCE    mov         ecx,dword ptr [ebp-4]
 0071EBD1    mov         edx,dword ptr [ebx+14];TJvPropertyStorage.FAppStoragePath:string
 0071EBD4    mov         eax,ebx
 0071EBD6    call        0071F5CC
 0071EBDB    xor         eax,eax
 0071EBDD    pop         edx
 0071EBDE    pop         ecx
 0071EBDF    pop         ecx
 0071EBE0    mov         dword ptr fs:[eax],edx
 0071EBE3    push        71EBF8
 0071EBE8    lea         eax,[ebp-4]
 0071EBEB    call        @UStrClr
 0071EBF0    ret
>0071EBF1    jmp         @HandleFinally
>0071EBF6    jmp         0071EBE8
 0071EBF8    pop         esi
 0071EBF9    pop         ebx
 0071EBFA    pop         ecx
 0071EBFB    pop         ebp
 0071EBFC    ret
*}
end;

//0071EC00
procedure TJvPropertyStorage.StoreProperties(PropList:TStrings);
begin
{*
 0071EC00    push        ebp
 0071EC01    mov         ebp,esp
 0071EC03    add         esp,0FFFFFEEC
 0071EC09    push        ebx
 0071EC0A    push        esi
 0071EC0B    push        edi
 0071EC0C    xor         ecx,ecx
 0071EC0E    mov         dword ptr [ebp-110],ecx
 0071EC14    mov         dword ptr [ebp-114],ecx
 0071EC1A    mov         dword ptr [ebp-8],edx
 0071EC1D    mov         dword ptr [ebp-4],eax
 0071EC20    xor         eax,eax
 0071EC22    push        ebp
 0071EC23    push        71ECFD
 0071EC28    push        dword ptr fs:[eax]
 0071EC2B    mov         dword ptr fs:[eax],esp
 0071EC2E    mov         eax,[0071ED0C];0x3FFEFE gvar_0071ED0C
 0071EC33    push        eax
 0071EC34    mov         eax,dword ptr [ebp-4]
 0071EC37    mov         ecx,dword ptr [eax+4];TJvPropertyStorage.FObject:TObject
 0071EC3A    mov         dl,1
 0071EC3C    mov         eax,[0071DF0C];TJvPropInfoList
 0071EC41    call        TJvPropInfoList.Create;TJvPropInfoList.Create
 0071EC46    mov         dword ptr [ebp-0C],eax
 0071EC49    xor         eax,eax
 0071EC4B    push        ebp
 0071EC4C    push        71ECD2
 0071EC51    push        dword ptr fs:[eax]
 0071EC54    mov         dword ptr fs:[eax],esp
 0071EC57    mov         eax,dword ptr [ebp-8]
 0071EC5A    mov         edx,dword ptr [eax]
 0071EC5C    call        dword ptr [edx+14];TStrings.GetCount
 0071EC5F    mov         ebx,eax
 0071EC61    dec         ebx
 0071EC62    test        ebx,ebx
>0071EC64    jl          0071ECBC
 0071EC66    inc         ebx
 0071EC67    xor         esi,esi
 0071EC69    lea         ecx,[ebp-114]
 0071EC6F    mov         edx,esi
 0071EC71    mov         eax,dword ptr [ebp-8]
 0071EC74    mov         edi,dword ptr [eax]
 0071EC76    call        dword ptr [edi+0C];TStrings.Get
 0071EC79    mov         eax,dword ptr [ebp-114]
 0071EC7F    lea         edx,[ebp-110]
 0071EC85    call        UTF8Encode
 0071EC8A    mov         edx,dword ptr [ebp-110]
 0071EC90    lea         eax,[ebp-10C]
 0071EC96    mov         ecx,0FF
 0071EC9B    call        @LStrToString
 0071ECA0    lea         edx,[ebp-10C]
 0071ECA6    mov         eax,dword ptr [ebp-0C]
 0071ECA9    call        TJvPropInfoList.Find
 0071ECAE    mov         edx,eax
 0071ECB0    mov         eax,dword ptr [ebp-4]
 0071ECB3    call        TJvPropertyStorage.StoreAnyProperty
 0071ECB8    inc         esi
 0071ECB9    dec         ebx
>0071ECBA    jne         0071EC69
 0071ECBC    xor         eax,eax
 0071ECBE    pop         edx
 0071ECBF    pop         ecx
 0071ECC0    pop         ecx
 0071ECC1    mov         dword ptr fs:[eax],edx
 0071ECC4    push        71ECD9
 0071ECC9    mov         eax,dword ptr [ebp-0C]
 0071ECCC    call        TObject.Free
 0071ECD1    ret
>0071ECD2    jmp         @HandleFinally
>0071ECD7    jmp         0071ECC9
 0071ECD9    xor         eax,eax
 0071ECDB    pop         edx
 0071ECDC    pop         ecx
 0071ECDD    pop         ecx
 0071ECDE    mov         dword ptr fs:[eax],edx
 0071ECE1    push        71ED04
 0071ECE6    lea         eax,[ebp-114]
 0071ECEC    call        @UStrClr
 0071ECF1    lea         eax,[ebp-110]
 0071ECF7    call        @LStrClr
 0071ECFC    ret
>0071ECFD    jmp         @HandleFinally
>0071ED02    jmp         0071ECE6
 0071ED04    pop         edi
 0071ED05    pop         esi
 0071ED06    pop         ebx
 0071ED07    mov         esp,ebp
 0071ED09    pop         ebp
 0071ED0A    ret
*}
end;

//0071ED10
procedure TJvPropertyStorage.LoadProperties(PropList:TStrings);
begin
{*
 0071ED10    push        ebp
 0071ED11    mov         ebp,esp
 0071ED13    add         esp,0FFFFFEEC
 0071ED19    push        ebx
 0071ED1A    push        esi
 0071ED1B    push        edi
 0071ED1C    xor         ecx,ecx
 0071ED1E    mov         dword ptr [ebp-110],ecx
 0071ED24    mov         dword ptr [ebp-114],ecx
 0071ED2A    mov         dword ptr [ebp-8],edx
 0071ED2D    mov         dword ptr [ebp-4],eax
 0071ED30    xor         eax,eax
 0071ED32    push        ebp
 0071ED33    push        71EE0D
 0071ED38    push        dword ptr fs:[eax]
 0071ED3B    mov         dword ptr fs:[eax],esp
 0071ED3E    mov         eax,[0071EE1C];0x3FFEFE gvar_0071EE1C
 0071ED43    push        eax
 0071ED44    mov         eax,dword ptr [ebp-4]
 0071ED47    mov         ecx,dword ptr [eax+4];TJvPropertyStorage.FObject:TObject
 0071ED4A    mov         dl,1
 0071ED4C    mov         eax,[0071DF0C];TJvPropInfoList
 0071ED51    call        TJvPropInfoList.Create;TJvPropInfoList.Create
 0071ED56    mov         dword ptr [ebp-0C],eax
 0071ED59    xor         eax,eax
 0071ED5B    push        ebp
 0071ED5C    push        71EDE2
 0071ED61    push        dword ptr fs:[eax]
 0071ED64    mov         dword ptr fs:[eax],esp
 0071ED67    mov         eax,dword ptr [ebp-8]
 0071ED6A    mov         edx,dword ptr [eax]
 0071ED6C    call        dword ptr [edx+14];TStrings.GetCount
 0071ED6F    mov         ebx,eax
 0071ED71    dec         ebx
 0071ED72    test        ebx,ebx
>0071ED74    jl          0071EDCC
 0071ED76    inc         ebx
 0071ED77    xor         esi,esi
 0071ED79    lea         ecx,[ebp-114]
 0071ED7F    mov         edx,esi
 0071ED81    mov         eax,dword ptr [ebp-8]
 0071ED84    mov         edi,dword ptr [eax]
 0071ED86    call        dword ptr [edi+0C];TStrings.Get
 0071ED89    mov         eax,dword ptr [ebp-114]
 0071ED8F    lea         edx,[ebp-110]
 0071ED95    call        UTF8Encode
 0071ED9A    mov         edx,dword ptr [ebp-110]
 0071EDA0    lea         eax,[ebp-10C]
 0071EDA6    mov         ecx,0FF
 0071EDAB    call        @LStrToString
 0071EDB0    lea         edx,[ebp-10C]
 0071EDB6    mov         eax,dword ptr [ebp-0C]
 0071EDB9    call        TJvPropInfoList.Find
 0071EDBE    mov         edx,eax
 0071EDC0    mov         eax,dword ptr [ebp-4]
 0071EDC3    call        TJvPropertyStorage.LoadAnyProperty
 0071EDC8    inc         esi
 0071EDC9    dec         ebx
>0071EDCA    jne         0071ED79
 0071EDCC    xor         eax,eax
 0071EDCE    pop         edx
 0071EDCF    pop         ecx
 0071EDD0    pop         ecx
 0071EDD1    mov         dword ptr fs:[eax],edx
 0071EDD4    push        71EDE9
 0071EDD9    mov         eax,dword ptr [ebp-0C]
 0071EDDC    call        TObject.Free
 0071EDE1    ret
>0071EDE2    jmp         @HandleFinally
>0071EDE7    jmp         0071EDD9
 0071EDE9    xor         eax,eax
 0071EDEB    pop         edx
 0071EDEC    pop         ecx
 0071EDED    pop         ecx
 0071EDEE    mov         dword ptr fs:[eax],edx
 0071EDF1    push        71EE14
 0071EDF6    lea         eax,[ebp-114]
 0071EDFC    call        @UStrClr
 0071EE01    lea         eax,[ebp-110]
 0071EE07    call        @LStrClr
 0071EE0C    ret
>0071EE0D    jmp         @HandleFinally
>0071EE12    jmp         0071EDF6
 0071EE14    pop         edi
 0071EE15    pop         esi
 0071EE16    pop         ebx
 0071EE17    mov         esp,ebp
 0071EE19    pop         ebp
 0071EE1A    ret
*}
end;

//0071EE20
{*function sub_0071EE20(?:TJvPropertyStorage; ?:TComponent; ?:TStrings):?;
begin
 0071EE20    push        ebp
 0071EE21    mov         ebp,esp
 0071EE23    add         esp,0FFFFFFF0
 0071EE26    push        ebx
 0071EE27    push        esi
 0071EE28    push        edi
 0071EE29    mov         dword ptr [ebp-4],ecx
 0071EE2C    xor         ecx,ecx
 0071EE2E    mov         eax,edx
 0071EE30    mov         edx,dword ptr [ebp-4]
 0071EE33    call        0071E988
 0071EE38    mov         dl,1
 0071EE3A    mov         eax,[0043C7BC];TStringList
 0071EE3F    call        TStringList.Create;TStringList.Create
 0071EE44    mov         dword ptr [ebp-8],eax
 0071EE47    xor         eax,eax
 0071EE49    push        ebp
 0071EE4A    push        71EEF6
 0071EE4F    push        dword ptr fs:[eax]
 0071EE52    mov         dword ptr fs:[eax],esp
 0071EE55    mov         dl,1
 0071EE57    mov         eax,dword ptr [ebp-8]
 0071EE5A    call        TStringList.SetSorted
 0071EE5F    mov         eax,dword ptr [ebp-4]
 0071EE62    mov         edx,dword ptr [eax]
 0071EE64    call        dword ptr [edx+14]
 0071EE67    mov         esi,eax
 0071EE69    dec         esi
 0071EE6A    test        esi,esi
>0071EE6C    jl          0071EEEC
 0071EE6E    inc         esi
 0071EE6F    mov         dword ptr [ebp-0C],0
 0071EE76    mov         edx,dword ptr [ebp-0C]
 0071EE79    mov         eax,dword ptr [ebp-4]
 0071EE7C    mov         ecx,dword ptr [eax]
 0071EE7E    call        dword ptr [ecx+18]
 0071EE81    mov         ebx,eax
 0071EE83    mov         edx,dword ptr [ebx+8]
 0071EE86    mov         eax,dword ptr [ebp-8]
 0071EE89    mov         ecx,dword ptr [eax]
 0071EE8B    call        dword ptr [ecx+54];TStringList.IndexOf
 0071EE8E    test        eax,eax
>0071EE90    jge         0071EEE6
 0071EE92    mov         eax,[0071EF18];0x3FFEFE gvar_0071EF18
 0071EE97    push        eax
 0071EE98    mov         ecx,ebx
 0071EE9A    mov         dl,1
 0071EE9C    mov         eax,[0071DF0C];TJvPropInfoList
 0071EEA1    call        TJvPropInfoList.Create;TJvPropInfoList.Create
 0071EEA6    mov         dword ptr [ebp-10],eax
 0071EEA9    xor         eax,eax
 0071EEAB    push        ebp
 0071EEAC    push        71EECF
 0071EEB1    push        dword ptr fs:[eax]
 0071EEB4    mov         dword ptr fs:[eax],esp
 0071EEB7    mov         edx,dword ptr [ebx+8]
 0071EEBA    mov         ecx,dword ptr [ebp-10]
 0071EEBD    mov         eax,dword ptr [ebp-8]
 0071EEC0    mov         ebx,dword ptr [eax]
 0071EEC2    call        dword ptr [ebx+3C];TStringList.AddObject
 0071EEC5    xor         eax,eax
 0071EEC7    pop         edx
 0071EEC8    pop         ecx
 0071EEC9    pop         ecx
 0071EECA    mov         dword ptr fs:[eax],edx
>0071EECD    jmp         0071EEE6
>0071EECF    jmp         @HandleAnyException
 0071EED4    mov         eax,dword ptr [ebp-10]
 0071EED7    call        TObject.Free
 0071EEDC    call        @RaiseAgain
 0071EEE1    call        @DoneExcept
 0071EEE6    inc         dword ptr [ebp-0C]
 0071EEE9    dec         esi
>0071EEEA    jne         0071EE76
 0071EEEC    xor         eax,eax
 0071EEEE    pop         edx
 0071EEEF    pop         ecx
 0071EEF0    pop         ecx
 0071EEF1    mov         dword ptr fs:[eax],edx
>0071EEF4    jmp         0071EF0D
>0071EEF6    jmp         @HandleAnyException
 0071EEFB    mov         eax,dword ptr [ebp-8]
 0071EEFE    call        TObject.Free
 0071EF03    xor         eax,eax
 0071EF05    mov         dword ptr [ebp-8],eax
 0071EF08    call        @DoneExcept
 0071EF0D    mov         eax,dword ptr [ebp-8]
 0071EF10    pop         edi
 0071EF11    pop         esi
 0071EF12    pop         ebx
 0071EF13    mov         esp,ebp
 0071EF15    pop         ebp
 0071EF16    ret
end;*}

//0071EF1C
{*procedure sub_0071EF1C(?:TJvPropertyStorage; ?:?);
begin
 0071EF1C    push        ebx
 0071EF1D    push        esi
 0071EF1E    mov         esi,edx
 0071EF20    mov         eax,esi
 0071EF22    mov         edx,dword ptr [eax]
 0071EF24    call        dword ptr [edx+14]
 0071EF27    mov         ebx,eax
 0071EF29    dec         ebx
 0071EF2A    cmp         ebx,0
>0071EF2D    jl          0071EF43
 0071EF2F    mov         edx,ebx
 0071EF31    mov         eax,esi
 0071EF33    mov         ecx,dword ptr [eax]
 0071EF35    call        dword ptr [ecx+18]
 0071EF38    call        TObject.Free
 0071EF3D    dec         ebx
 0071EF3E    cmp         ebx,0FFFFFFFF
>0071EF41    jne         0071EF2F
 0071EF43    mov         eax,esi
 0071EF45    call        TObject.Free
 0071EF4A    pop         esi
 0071EF4B    pop         ebx
 0071EF4C    ret
end;*}

//0071EF50
procedure TJvPropertyStorage.LoadObjectsProps(AComponent:TComponent; StoredList:TStrings);
begin
{*
 0071EF50    push        ebp
 0071EF51    mov         ebp,esp
 0071EF53    add         esp,0FFFFFEE4
 0071EF59    push        ebx
 0071EF5A    push        esi
 0071EF5B    push        edi
 0071EF5C    xor         ebx,ebx
 0071EF5E    mov         dword ptr [ebp-11C],ebx
 0071EF64    mov         dword ptr [ebp-18],ebx
 0071EF67    mov         dword ptr [ebp-4],ebx
 0071EF6A    mov         dword ptr [ebp-8],ebx
 0071EF6D    mov         dword ptr [ebp-10],ecx
 0071EF70    mov         ebx,edx
 0071EF72    mov         dword ptr [ebp-0C],eax
 0071EF75    xor         eax,eax
 0071EF77    push        ebp
 0071EF78    push        71F0D8
 0071EF7D    push        dword ptr fs:[eax]
 0071EF80    mov         dword ptr fs:[eax],esp
 0071EF83    mov         ecx,dword ptr [ebp-10]
 0071EF86    mov         edx,ebx
 0071EF88    mov         eax,dword ptr [ebp-0C]
 0071EF8B    call        0071EE20
 0071EF90    mov         dword ptr [ebp-14],eax
 0071EF93    cmp         dword ptr [ebp-14],0
>0071EF97    je          0071F0AA
 0071EF9D    xor         eax,eax
 0071EF9F    push        ebp
 0071EFA0    push        71F0A3
 0071EFA5    push        dword ptr fs:[eax]
 0071EFA8    mov         dword ptr fs:[eax],esp
 0071EFAB    mov         eax,dword ptr [ebp-0C]
 0071EFAE    mov         dword ptr [eax+8],ebx;TJvPropertyStorage.FOwner:TComponent
 0071EFB1    mov         eax,dword ptr [ebp-10]
 0071EFB4    mov         edx,dword ptr [eax]
 0071EFB6    call        dword ptr [edx+14];TStrings.GetCount
 0071EFB9    mov         esi,eax
 0071EFBB    dec         esi
 0071EFBC    test        esi,esi
>0071EFBE    jl          0071F082
 0071EFC4    inc         esi
 0071EFC5    xor         ebx,ebx
 0071EFC7    lea         ecx,[ebp-18]
 0071EFCA    mov         edx,ebx
 0071EFCC    mov         eax,dword ptr [ebp-10]
 0071EFCF    mov         edi,dword ptr [eax]
 0071EFD1    call        dword ptr [edi+0C];TStrings.Get
 0071EFD4    mov         eax,dword ptr [ebp-18]
 0071EFD7    lea         ecx,[ebp-8]
 0071EFDA    lea         edx,[ebp-4]
 0071EFDD    call        0071E838
 0071EFE2    test        al,al
>0071EFE4    je          0071F07A
 0071EFEA    mov         edx,ebx
 0071EFEC    mov         eax,dword ptr [ebp-10]
 0071EFEF    mov         ecx,dword ptr [eax]
 0071EFF1    call        dword ptr [ecx+18];TStrings.sub_004483A0
 0071EFF4    mov         edi,eax
 0071EFF6    mov         eax,dword ptr [ebp-0C]
 0071EFF9    mov         dword ptr [eax+4],edi;TJvPropertyStorage.FObject:TObject
 0071EFFC    mov         eax,dword ptr [ebp-0C]
 0071EFFF    add         eax,0C;TJvPropertyStorage.FPrefix:string
 0071F002    mov         edx,dword ptr [edi+8]
 0071F005    call        @UStrAsg
 0071F00A    mov         eax,dword ptr [ebp-0C]
 0071F00D    mov         edx,dword ptr [eax+0C];TJvPropertyStorage.FPrefix:string
 0071F010    mov         eax,dword ptr [ebp-14]
 0071F013    mov         ecx,dword ptr [eax]
 0071F015    call        dword ptr [ecx+54]
 0071F018    mov         edi,eax
 0071F01A    test        edi,edi
>0071F01C    jl          0071F07A
 0071F01E    mov         eax,dword ptr [ebp-0C]
 0071F021    add         eax,0C;TJvPropertyStorage.FPrefix:string
 0071F024    mov         edx,dword ptr ds:[78C568];^'_'
 0071F02A    call        @UStrCat
 0071F02F    mov         edx,edi
 0071F031    mov         eax,dword ptr [ebp-14]
 0071F034    mov         ecx,dword ptr [eax]
 0071F036    call        dword ptr [ecx+18]
 0071F039    mov         edi,eax
 0071F03B    test        edi,edi
>0071F03D    je          0071F07A
 0071F03F    lea         edx,[ebp-11C]
 0071F045    mov         eax,dword ptr [ebp-8]
 0071F048    call        UTF8Encode
 0071F04D    mov         edx,dword ptr [ebp-11C]
 0071F053    lea         eax,[ebp-118]
 0071F059    mov         ecx,0FF
 0071F05E    call        @LStrToString
 0071F063    lea         edx,[ebp-118]
 0071F069    mov         eax,edi
 0071F06B    call        TJvPropInfoList.Find
 0071F070    mov         edx,eax
 0071F072    mov         eax,dword ptr [ebp-0C]
 0071F075    call        TJvPropertyStorage.LoadAnyProperty
 0071F07A    inc         ebx
 0071F07B    dec         esi
>0071F07C    jne         0071EFC7
 0071F082    xor         eax,eax
 0071F084    pop         edx
 0071F085    pop         ecx
 0071F086    pop         ecx
 0071F087    mov         dword ptr fs:[eax],edx
 0071F08A    push        71F0AA
 0071F08F    mov         eax,dword ptr [ebp-0C]
 0071F092    xor         edx,edx
 0071F094    mov         dword ptr [eax+8],edx;TJvPropertyStorage.FOwner:TComponent
 0071F097    mov         edx,dword ptr [ebp-14]
 0071F09A    mov         eax,dword ptr [ebp-0C]
 0071F09D    call        0071EF1C
 0071F0A2    ret
>0071F0A3    jmp         @HandleFinally
>0071F0A8    jmp         0071F08F
 0071F0AA    xor         eax,eax
 0071F0AC    pop         edx
 0071F0AD    pop         ecx
 0071F0AE    pop         ecx
 0071F0AF    mov         dword ptr fs:[eax],edx
 0071F0B2    push        71F0DF
 0071F0B7    lea         eax,[ebp-11C]
 0071F0BD    call        @LStrClr
 0071F0C2    lea         eax,[ebp-18]
 0071F0C5    call        @UStrClr
 0071F0CA    lea         eax,[ebp-8]
 0071F0CD    mov         edx,2
 0071F0D2    call        @UStrArrayClr
 0071F0D7    ret
>0071F0D8    jmp         @HandleFinally
>0071F0DD    jmp         0071F0B7
 0071F0DF    pop         edi
 0071F0E0    pop         esi
 0071F0E1    pop         ebx
 0071F0E2    mov         esp,ebp
 0071F0E4    pop         ebp
 0071F0E5    ret
*}
end;

//0071F0E8
procedure TJvPropertyStorage.StoreObjectsProps(AComponent:TComponent; StoredList:TStrings);
begin
{*
 0071F0E8    push        ebp
 0071F0E9    mov         ebp,esp
 0071F0EB    add         esp,0FFFFFEE4
 0071F0F1    push        ebx
 0071F0F2    push        esi
 0071F0F3    push        edi
 0071F0F4    xor         ebx,ebx
 0071F0F6    mov         dword ptr [ebp-11C],ebx
 0071F0FC    mov         dword ptr [ebp-18],ebx
 0071F0FF    mov         dword ptr [ebp-4],ebx
 0071F102    mov         dword ptr [ebp-8],ebx
 0071F105    mov         dword ptr [ebp-10],ecx
 0071F108    mov         ebx,edx
 0071F10A    mov         dword ptr [ebp-0C],eax
 0071F10D    xor         eax,eax
 0071F10F    push        ebp
 0071F110    push        71F270
 0071F115    push        dword ptr fs:[eax]
 0071F118    mov         dword ptr fs:[eax],esp
 0071F11B    mov         ecx,dword ptr [ebp-10]
 0071F11E    mov         edx,ebx
 0071F120    mov         eax,dword ptr [ebp-0C]
 0071F123    call        0071EE20
 0071F128    mov         dword ptr [ebp-14],eax
 0071F12B    cmp         dword ptr [ebp-14],0
>0071F12F    je          0071F242
 0071F135    xor         eax,eax
 0071F137    push        ebp
 0071F138    push        71F23B
 0071F13D    push        dword ptr fs:[eax]
 0071F140    mov         dword ptr fs:[eax],esp
 0071F143    mov         eax,dword ptr [ebp-0C]
 0071F146    mov         dword ptr [eax+8],ebx;TJvPropertyStorage.FOwner:TComponent
 0071F149    mov         eax,dword ptr [ebp-10]
 0071F14C    mov         edx,dword ptr [eax]
 0071F14E    call        dword ptr [edx+14];TStrings.GetCount
 0071F151    mov         esi,eax
 0071F153    dec         esi
 0071F154    test        esi,esi
>0071F156    jl          0071F21A
 0071F15C    inc         esi
 0071F15D    xor         ebx,ebx
 0071F15F    lea         ecx,[ebp-18]
 0071F162    mov         edx,ebx
 0071F164    mov         eax,dword ptr [ebp-10]
 0071F167    mov         edi,dword ptr [eax]
 0071F169    call        dword ptr [edi+0C];TStrings.Get
 0071F16C    mov         eax,dword ptr [ebp-18]
 0071F16F    lea         ecx,[ebp-8]
 0071F172    lea         edx,[ebp-4]
 0071F175    call        0071E838
 0071F17A    test        al,al
>0071F17C    je          0071F212
 0071F182    mov         edx,ebx
 0071F184    mov         eax,dword ptr [ebp-10]
 0071F187    mov         ecx,dword ptr [eax]
 0071F189    call        dword ptr [ecx+18];TStrings.sub_004483A0
 0071F18C    mov         edi,eax
 0071F18E    mov         eax,dword ptr [ebp-0C]
 0071F191    mov         dword ptr [eax+4],edi;TJvPropertyStorage.FObject:TObject
 0071F194    mov         eax,dword ptr [ebp-0C]
 0071F197    add         eax,0C;TJvPropertyStorage.FPrefix:string
 0071F19A    mov         edx,dword ptr [edi+8]
 0071F19D    call        @UStrAsg
 0071F1A2    mov         eax,dword ptr [ebp-0C]
 0071F1A5    mov         edx,dword ptr [eax+0C];TJvPropertyStorage.FPrefix:string
 0071F1A8    mov         eax,dword ptr [ebp-14]
 0071F1AB    mov         ecx,dword ptr [eax]
 0071F1AD    call        dword ptr [ecx+54]
 0071F1B0    mov         edi,eax
 0071F1B2    test        edi,edi
>0071F1B4    jl          0071F212
 0071F1B6    mov         eax,dword ptr [ebp-0C]
 0071F1B9    add         eax,0C;TJvPropertyStorage.FPrefix:string
 0071F1BC    mov         edx,dword ptr ds:[78C568];^'_'
 0071F1C2    call        @UStrCat
 0071F1C7    mov         edx,edi
 0071F1C9    mov         eax,dword ptr [ebp-14]
 0071F1CC    mov         ecx,dword ptr [eax]
 0071F1CE    call        dword ptr [ecx+18]
 0071F1D1    mov         edi,eax
 0071F1D3    test        edi,edi
>0071F1D5    je          0071F212
 0071F1D7    lea         edx,[ebp-11C]
 0071F1DD    mov         eax,dword ptr [ebp-8]
 0071F1E0    call        UTF8Encode
 0071F1E5    mov         edx,dword ptr [ebp-11C]
 0071F1EB    lea         eax,[ebp-118]
 0071F1F1    mov         ecx,0FF
 0071F1F6    call        @LStrToString
 0071F1FB    lea         edx,[ebp-118]
 0071F201    mov         eax,edi
 0071F203    call        TJvPropInfoList.Find
 0071F208    mov         edx,eax
 0071F20A    mov         eax,dword ptr [ebp-0C]
 0071F20D    call        TJvPropertyStorage.StoreAnyProperty
 0071F212    inc         ebx
 0071F213    dec         esi
>0071F214    jne         0071F15F
 0071F21A    xor         eax,eax
 0071F21C    pop         edx
 0071F21D    pop         ecx
 0071F21E    pop         ecx
 0071F21F    mov         dword ptr fs:[eax],edx
 0071F222    push        71F242
 0071F227    mov         eax,dword ptr [ebp-0C]
 0071F22A    xor         edx,edx
 0071F22C    mov         dword ptr [eax+8],edx;TJvPropertyStorage.FOwner:TComponent
 0071F22F    mov         edx,dword ptr [ebp-14]
 0071F232    mov         eax,dword ptr [ebp-0C]
 0071F235    call        0071EF1C
 0071F23A    ret
>0071F23B    jmp         @HandleFinally
>0071F240    jmp         0071F227
 0071F242    xor         eax,eax
 0071F244    pop         edx
 0071F245    pop         ecx
 0071F246    pop         ecx
 0071F247    mov         dword ptr fs:[eax],edx
 0071F24A    push        71F277
 0071F24F    lea         eax,[ebp-11C]
 0071F255    call        @LStrClr
 0071F25A    lea         eax,[ebp-18]
 0071F25D    call        @UStrClr
 0071F262    lea         eax,[ebp-8]
 0071F265    mov         edx,2
 0071F26A    call        @UStrArrayClr
 0071F26F    ret
>0071F270    jmp         @HandleFinally
>0071F275    jmp         0071F24F
 0071F277    pop         edi
 0071F278    pop         esi
 0071F279    pop         ebx
 0071F27A    mov         esp,ebp
 0071F27C    pop         ebp
 0071F27D    ret
*}
end;

//0071F280
procedure sub_0071F280;
begin
{*
 0071F280    push        ebx
 0071F281    mov         ebx,eax
 0071F283    mov         dl,1
 0071F285    mov         eax,[0071E184];TJvPropertyStorage
 0071F28A    call        TObject.Create;TJvPropertyStorage.Create
 0071F28F    mov         edx,dword ptr [ebx+10];TJvPropertyStorage.FAppStorage:TJvCustomAppStorage
 0071F292    mov         dword ptr [eax+10],edx;TJvPropertyStorage.FAppStorage:TJvCustomAppStorage
 0071F295    pop         ebx
 0071F296    ret
*}
end;

//0071F298
{*procedure sub_0071F298(?:?; ?:?; ?:?; ?:?);
begin
 0071F298    push        ebp
 0071F299    mov         ebp,esp
 0071F29B    add         esp,0FFFFFFE8
 0071F29E    push        ebx
 0071F29F    push        esi
 0071F2A0    push        edi
 0071F2A1    xor         ebx,ebx
 0071F2A3    mov         dword ptr [ebp-0C],ebx
 0071F2A6    mov         dword ptr [ebp-18],ebx
 0071F2A9    mov         dword ptr [ebp-8],ecx
 0071F2AC    mov         dword ptr [ebp-4],edx
 0071F2AF    mov         ebx,eax
 0071F2B1    mov         edi,dword ptr [ebp+0C]
 0071F2B4    xor         eax,eax
 0071F2B6    push        ebp
 0071F2B7    push        71F334
 0071F2BC    push        dword ptr fs:[eax]
 0071F2BF    mov         dword ptr fs:[eax],esp
 0071F2C2    mov         esi,dword ptr [ebx+10];TJvPropertyStorage.FAppStorage:TJvCustomAppStorage
 0071F2C5    test        esi,esi
>0071F2C7    je          0071F30C
 0071F2C9    mov         eax,dword ptr [ebp+8]
 0071F2CC    push        eax
 0071F2CD    lea         eax,[ebp-0C]
 0071F2D0    push        eax
 0071F2D1    mov         eax,dword ptr [ebp-4]
 0071F2D4    mov         dword ptr [ebp-14],eax
 0071F2D7    push        1
 0071F2D9    lea         eax,[ebp-18]
 0071F2DC    push        eax
 0071F2DD    mov         ecx,dword ptr [ebp-8]
 0071F2E0    xor         edx,edx
 0071F2E2    mov         eax,esi
 0071F2E4    call        TJvCustomAppStorage.TranslatePropertyName
 0071F2E9    mov         eax,dword ptr [ebp-18]
 0071F2EC    mov         dword ptr [ebp-10],eax
 0071F2EF    lea         edx,[ebp-14]
 0071F2F2    mov         eax,dword ptr [esi]
 0071F2F4    mov         ecx,1
 0071F2F9    call        TJvCustomAppStorage.ConcatPaths
 0071F2FE    mov         edx,dword ptr [ebp-0C]
 0071F301    mov         ecx,edi
 0071F303    mov         eax,esi
 0071F305    call        TJvCustomAppStorage.ReadString
>0071F30A    jmp         0071F316
 0071F30C    mov         eax,dword ptr [ebp+8]
 0071F30F    mov         edx,edi
 0071F311    call        @UStrAsg
 0071F316    xor         eax,eax
 0071F318    pop         edx
 0071F319    pop         ecx
 0071F31A    pop         ecx
 0071F31B    mov         dword ptr fs:[eax],edx
 0071F31E    push        71F33B
 0071F323    lea         eax,[ebp-18]
 0071F326    call        @UStrClr
 0071F32B    lea         eax,[ebp-0C]
 0071F32E    call        @UStrClr
 0071F333    ret
>0071F334    jmp         @HandleFinally
>0071F339    jmp         0071F323
 0071F33B    pop         edi
 0071F33C    pop         esi
 0071F33D    pop         ebx
 0071F33E    mov         esp,ebp
 0071F340    pop         ebp
 0071F341    ret         8
end;*}

//0071F344
{*procedure sub_0071F344(?:?; ?:?; ?:?);
begin
 0071F344    push        ebp
 0071F345    mov         ebp,esp
 0071F347    add         esp,0FFFFFFEC
 0071F34A    push        ebx
 0071F34B    push        esi
 0071F34C    push        edi
 0071F34D    xor         ebx,ebx
 0071F34F    mov         dword ptr [ebp-8],ebx
 0071F352    mov         dword ptr [ebp-14],ebx
 0071F355    mov         dword ptr [ebp-4],ecx
 0071F358    mov         edi,edx
 0071F35A    mov         ebx,eax
 0071F35C    xor         eax,eax
 0071F35E    push        ebp
 0071F35F    push        71F3CA
 0071F364    push        dword ptr fs:[eax]
 0071F367    mov         dword ptr fs:[eax],esp
 0071F36A    mov         esi,dword ptr [ebx+10];TJvPropertyStorage.FAppStorage:TJvCustomAppStorage
 0071F36D    test        esi,esi
>0071F36F    je          0071F3AC
 0071F371    lea         eax,[ebp-8]
 0071F374    push        eax
 0071F375    mov         dword ptr [ebp-10],edi
 0071F378    push        0
 0071F37A    lea         eax,[ebp-14]
 0071F37D    push        eax
 0071F37E    mov         ecx,dword ptr [ebp-4]
 0071F381    xor         edx,edx
 0071F383    mov         eax,esi
 0071F385    call        TJvCustomAppStorage.TranslatePropertyName
 0071F38A    mov         eax,dword ptr [ebp-14]
 0071F38D    mov         dword ptr [ebp-0C],eax
 0071F390    lea         edx,[ebp-10]
 0071F393    mov         eax,dword ptr [esi]
 0071F395    mov         ecx,1
 0071F39A    call        TJvCustomAppStorage.ConcatPaths
 0071F39F    mov         edx,dword ptr [ebp-8]
 0071F3A2    mov         ecx,dword ptr [ebp+8]
 0071F3A5    mov         eax,esi
 0071F3A7    call        TJvCustomAppStorage.WriteString
 0071F3AC    xor         eax,eax
 0071F3AE    pop         edx
 0071F3AF    pop         ecx
 0071F3B0    pop         ecx
 0071F3B1    mov         dword ptr fs:[eax],edx
 0071F3B4    push        71F3D1
 0071F3B9    lea         eax,[ebp-14]
 0071F3BC    call        @UStrClr
 0071F3C1    lea         eax,[ebp-8]
 0071F3C4    call        @UStrClr
 0071F3C9    ret
>0071F3CA    jmp         @HandleFinally
>0071F3CF    jmp         0071F3B9
 0071F3D1    pop         edi
 0071F3D2    pop         esi
 0071F3D3    pop         ebx
 0071F3D4    mov         esp,ebp
 0071F3D6    pop         ebp
 0071F3D7    ret         4
end;*}

//0071F3DC
procedure sub_0071F3DC;
begin
{*
 0071F3DC    mov         ecx,dword ptr [eax+10];TJvPropertyStorage.FAppStorage:TJvCustomAppStorage
 0071F3DF    test        ecx,ecx
>0071F3E1    je          0071F3EA
 0071F3E3    mov         eax,ecx
 0071F3E5    call        TJvCustomAppStorage.DeleteSubTree
 0071F3EA    ret
*}
end;

//0071F3EC
{*procedure sub_0071F3EC(?:TJvPropertyStorage; ?:string; ?:?; ?:?; ?:?);
begin
 0071F3EC    push        ebp
 0071F3ED    mov         ebp,esp
 0071F3EF    push        ecx
 0071F3F0    mov         ecx,5
 0071F3F5    push        0
 0071F3F7    push        0
 0071F3F9    dec         ecx
>0071F3FA    jne         0071F3F5
 0071F3FC    push        ecx
 0071F3FD    xchg        ecx,dword ptr [ebp-4]
 0071F400    push        ebx
 0071F401    push        esi
 0071F402    push        edi
 0071F403    mov         dword ptr [ebp-0C],ecx
 0071F406    mov         edi,edx
 0071F408    mov         ebx,eax
 0071F40A    xor         eax,eax
 0071F40C    push        ebp
 0071F40D    push        71F5BA
 0071F412    push        dword ptr fs:[eax]
 0071F415    mov         dword ptr fs:[eax],esp
 0071F418    cmp         dword ptr [ebx+10],0;TJvPropertyStorage.FAppStorage:TJvCustomAppStorage
>0071F41C    je          0071F585
 0071F422    lea         eax,[ebp-10]
 0071F425    mov         edx,dword ptr [ebp+8]
 0071F428    call        @UStrFromString
 0071F42D    mov         edx,dword ptr [ebp-10]
 0071F430    mov         eax,dword ptr [ebp+0C]
 0071F433    call        PropType
 0071F438    cmp         al,7
>0071F43A    jne         0071F512
 0071F440    lea         eax,[ebp-14]
 0071F443    mov         edx,dword ptr [ebp+8]
 0071F446    call        @UStrFromString
 0071F44B    mov         edx,dword ptr [ebp-14]
 0071F44E    xor         ecx,ecx
 0071F450    mov         eax,dword ptr [ebp+0C]
 0071F453    call        GetEnumProp
 0071F458    mov         edx,dword ptr ds:[4422C8];TComponent
 0071F45E    call        @IsClass
 0071F463    test        al,al
>0071F465    je          0071F512
 0071F46B    lea         eax,[ebp-8]
 0071F46E    push        eax
 0071F46F    lea         eax,[ebp-18]
 0071F472    push        eax
 0071F473    mov         dword ptr [ebp-20],edi
 0071F476    push        0
 0071F478    lea         eax,[ebp-24]
 0071F47B    push        eax
 0071F47C    mov         esi,dword ptr [ebx+10];TJvPropertyStorage.FAppStorage:TJvCustomAppStorage
 0071F47F    mov         eax,esi
 0071F481    mov         ecx,dword ptr [ebp-0C]
 0071F484    mov         edx,dword ptr [ebp+0C]
 0071F487    call        TJvCustomAppStorage.TranslatePropertyName
 0071F48C    mov         eax,dword ptr [ebp-24]
 0071F48F    mov         dword ptr [ebp-1C],eax
 0071F492    lea         edx,[ebp-20]
 0071F495    mov         eax,dword ptr [esi]
 0071F497    mov         ecx,1
 0071F49C    call        TJvCustomAppStorage.ConcatPaths
 0071F4A1    mov         edx,dword ptr [ebp-18]
 0071F4A4    mov         eax,esi
 0071F4A6    xor         ecx,ecx
 0071F4A8    call        TJvCustomAppStorage.ReadString
 0071F4AD    mov         ebx,dword ptr [ebx+8];TJvPropertyStorage.FOwner:TComponent
 0071F4B0    test        ebx,ebx
>0071F4B2    je          0071F585
 0071F4B8    mov         eax,ebx
 0071F4BA    call        TComponent.GetComponentCount
 0071F4BF    mov         edi,eax
 0071F4C1    dec         edi
 0071F4C2    test        edi,edi
>0071F4C4    jl          0071F509
 0071F4C6    inc         edi
 0071F4C7    xor         esi,esi
 0071F4C9    mov         edx,esi
 0071F4CB    mov         eax,ebx
 0071F4CD    call        TComponent.GetComponent
 0071F4D2    mov         eax,dword ptr [eax+8];TComponent.FName:TComponentName
 0071F4D5    mov         edx,dword ptr [ebp-8]
 0071F4D8    call        @UStrEqual
>0071F4DD    jne         0071F505
 0071F4DF    mov         edx,esi
 0071F4E1    mov         eax,ebx
 0071F4E3    call        TComponent.GetComponent
 0071F4E8    push        eax
 0071F4E9    lea         eax,[ebp-28]
 0071F4EC    mov         edx,dword ptr [ebp+8]
 0071F4EF    call        @UStrFromString
 0071F4F4    mov         edx,dword ptr [ebp-28]
 0071F4F7    mov         eax,dword ptr [ebp+0C]
 0071F4FA    pop         ecx
 0071F4FB    call        SetObjectProp
>0071F500    jmp         0071F585
 0071F505    inc         esi
 0071F506    dec         edi
>0071F507    jne         0071F4C9
 0071F509    mov         ebx,dword ptr [ebx+4];TComponent.FOwner:TComponent
 0071F50C    test        ebx,ebx
>0071F50E    jne         0071F4B8
>0071F510    jmp         0071F585
 0071F512    lea         eax,[ebp-4]
 0071F515    push        eax
 0071F516    mov         dword ptr [ebp-20],edi
 0071F519    push        1
 0071F51B    lea         eax,[ebp-2C]
 0071F51E    push        eax
 0071F51F    mov         esi,dword ptr [ebx+10];TJvPropertyStorage.FAppStorage:TJvCustomAppStorage
 0071F522    mov         eax,esi
 0071F524    mov         ecx,dword ptr [ebp-0C]
 0071F527    mov         edx,dword ptr [ebp+0C]
 0071F52A    call        TJvCustomAppStorage.TranslatePropertyName
 0071F52F    mov         eax,dword ptr [ebp-2C]
 0071F532    mov         dword ptr [ebp-1C],eax
 0071F535    lea         edx,[ebp-20]
 0071F538    mov         eax,dword ptr [esi]
 0071F53A    mov         ecx,1
 0071F53F    call        TJvCustomAppStorage.ConcatPaths
 0071F544    mov         eax,dword ptr [ebx+10];TJvPropertyStorage.FAppStorage:TJvCustomAppStorage
 0071F547    mov         edx,dword ptr [ebp-4]
 0071F54A    call        TJvCustomAppStorage.ValueStored
 0071F54F    test        al,al
>0071F551    jne         0071F564
 0071F553    mov         eax,dword ptr [ebx+10];TJvPropertyStorage.FAppStorage:TJvCustomAppStorage
 0071F556    xor         ecx,ecx
 0071F558    mov         edx,dword ptr [ebp-4]
 0071F55B    call        TJvCustomAppStorage.IsFolder
 0071F560    test        al,al
>0071F562    je          0071F585
 0071F564    lea         eax,[ebp-30]
 0071F567    mov         edx,dword ptr [ebp+8]
 0071F56A    call        @UStrFromString
 0071F56F    mov         eax,dword ptr [ebp-30]
 0071F572    push        eax
 0071F573    push        1
 0071F575    push        1
 0071F577    mov         eax,dword ptr [ebx+10];TJvPropertyStorage.FAppStorage:TJvCustomAppStorage
 0071F57A    mov         ecx,dword ptr [ebp+0C]
 0071F57D    mov         edx,dword ptr [ebp-4]
 0071F580    call        TJvCustomAppStorage.ReadProperty
 0071F585    xor         eax,eax
 0071F587    pop         edx
 0071F588    pop         ecx
 0071F589    pop         ecx
 0071F58A    mov         dword ptr fs:[eax],edx
 0071F58D    push        71F5C1
 0071F592    lea         eax,[ebp-30]
 0071F595    mov         edx,4
 0071F59A    call        @UStrArrayClr
 0071F59F    lea         eax,[ebp-18]
 0071F5A2    mov         edx,3
 0071F5A7    call        @UStrArrayClr
 0071F5AC    lea         eax,[ebp-8]
 0071F5AF    mov         edx,2
 0071F5B4    call        @UStrArrayClr
 0071F5B9    ret
>0071F5BA    jmp         @HandleFinally
>0071F5BF    jmp         0071F592
 0071F5C1    pop         edi
 0071F5C2    pop         esi
 0071F5C3    pop         ebx
 0071F5C4    mov         esp,ebp
 0071F5C6    pop         ebp
 0071F5C7    ret         8
end;*}

//0071F5CC
{*procedure sub_0071F5CC(?:TJvPropertyStorage; ?:string; ?:?; ?:?; ?:?);
begin
 0071F5CC    push        ebp
 0071F5CD    mov         ebp,esp
 0071F5CF    push        ecx
 0071F5D0    mov         ecx,5
 0071F5D5    push        0
 0071F5D7    push        0
 0071F5D9    dec         ecx
>0071F5DA    jne         0071F5D5
 0071F5DC    push        ecx
 0071F5DD    xchg        ecx,dword ptr [ebp-4]
 0071F5E0    push        ebx
 0071F5E1    push        esi
 0071F5E2    push        edi
 0071F5E3    mov         dword ptr [ebp-8],ecx
 0071F5E6    mov         dword ptr [ebp-4],edx
 0071F5E9    mov         ebx,eax
 0071F5EB    mov         edi,dword ptr [ebp+8]
 0071F5EE    mov         esi,dword ptr [ebp+0C]
 0071F5F1    xor         eax,eax
 0071F5F3    push        ebp
 0071F5F4    push        71F721
 0071F5F9    push        dword ptr fs:[eax]
 0071F5FC    mov         dword ptr fs:[eax],esp
 0071F5FF    cmp         dword ptr [ebx+10],0;TJvPropertyStorage.FAppStorage:TJvCustomAppStorage
>0071F603    je          0071F6F9
 0071F609    lea         eax,[ebp-0C]
 0071F60C    mov         edx,edi
 0071F60E    call        @UStrFromString
 0071F613    mov         edx,dword ptr [ebp-0C]
 0071F616    mov         eax,esi
 0071F618    call        PropType
 0071F61D    cmp         al,7
>0071F61F    jne         0071F6A7
 0071F625    lea         eax,[ebp-10]
 0071F628    mov         edx,edi
 0071F62A    call        @UStrFromString
 0071F62F    mov         edx,dword ptr [ebp-10]
 0071F632    xor         ecx,ecx
 0071F634    mov         eax,esi
 0071F636    call        GetEnumProp
 0071F63B    mov         edx,dword ptr ds:[4422C8];TComponent
 0071F641    call        @IsClass
 0071F646    test        al,al
>0071F648    je          0071F6A7
 0071F64A    lea         eax,[ebp-14]
 0071F64D    mov         edx,edi
 0071F64F    call        @UStrFromString
 0071F654    mov         edx,dword ptr [ebp-14]
 0071F657    xor         ecx,ecx
 0071F659    mov         eax,esi
 0071F65B    call        GetEnumProp
 0071F660    mov         eax,dword ptr [eax+8]
 0071F663    push        eax
 0071F664    lea         eax,[ebp-18]
 0071F667    push        eax
 0071F668    mov         eax,dword ptr [ebp-4]
 0071F66B    mov         dword ptr [ebp-20],eax
 0071F66E    push        0
 0071F670    lea         eax,[ebp-24]
 0071F673    push        eax
 0071F674    mov         ecx,dword ptr [ebp-8]
 0071F677    mov         edx,esi
 0071F679    mov         eax,dword ptr [ebx+10];TJvPropertyStorage.FAppStorage:TJvCustomAppStorage
 0071F67C    call        TJvCustomAppStorage.TranslatePropertyName
 0071F681    mov         eax,dword ptr [ebp-24]
 0071F684    mov         dword ptr [ebp-1C],eax
 0071F687    lea         edx,[ebp-20]
 0071F68A    mov         eax,dword ptr [ebx+10];TJvPropertyStorage.FAppStorage:TJvCustomAppStorage
 0071F68D    mov         eax,dword ptr [eax]
 0071F68F    mov         ecx,1
 0071F694    call        TJvCustomAppStorage.ConcatPaths
 0071F699    mov         edx,dword ptr [ebp-18]
 0071F69C    mov         eax,dword ptr [ebx+10];TJvPropertyStorage.FAppStorage:TJvCustomAppStorage
 0071F69F    pop         ecx
 0071F6A0    call        TJvCustomAppStorage.WriteString
>0071F6A5    jmp         0071F6F9
 0071F6A7    lea         eax,[ebp-28]
 0071F6AA    mov         edx,edi
 0071F6AC    call        @UStrFromString
 0071F6B1    mov         eax,dword ptr [ebp-28]
 0071F6B4    push        eax
 0071F6B5    push        1
 0071F6B7    lea         eax,[ebp-2C]
 0071F6BA    push        eax
 0071F6BB    mov         eax,dword ptr [ebp-4]
 0071F6BE    mov         dword ptr [ebp-20],eax
 0071F6C1    push        0
 0071F6C3    lea         eax,[ebp-30]
 0071F6C6    push        eax
 0071F6C7    mov         ecx,dword ptr [ebp-8]
 0071F6CA    mov         edx,esi
 0071F6CC    mov         eax,dword ptr [ebx+10];TJvPropertyStorage.FAppStorage:TJvCustomAppStorage
 0071F6CF    call        TJvCustomAppStorage.TranslatePropertyName
 0071F6D4    mov         eax,dword ptr [ebp-30]
 0071F6D7    mov         dword ptr [ebp-1C],eax
 0071F6DA    lea         edx,[ebp-20]
 0071F6DD    mov         eax,dword ptr [ebx+10];TJvPropertyStorage.FAppStorage:TJvCustomAppStorage
 0071F6E0    mov         eax,dword ptr [eax]
 0071F6E2    mov         ecx,1
 0071F6E7    call        TJvCustomAppStorage.ConcatPaths
 0071F6EC    mov         edx,dword ptr [ebp-2C]
 0071F6EF    mov         ecx,esi
 0071F6F1    mov         eax,dword ptr [ebx+10];TJvPropertyStorage.FAppStorage:TJvCustomAppStorage
 0071F6F4    call        TJvCustomAppStorage.WriteProperty
 0071F6F9    xor         eax,eax
 0071F6FB    pop         edx
 0071F6FC    pop         ecx
 0071F6FD    pop         ecx
 0071F6FE    mov         dword ptr fs:[eax],edx
 0071F701    push        71F728
 0071F706    lea         eax,[ebp-30]
 0071F709    mov         edx,4
 0071F70E    call        @UStrArrayClr
 0071F713    lea         eax,[ebp-18]
 0071F716    mov         edx,4
 0071F71B    call        @UStrArrayClr
 0071F720    ret
>0071F721    jmp         @HandleFinally
>0071F726    jmp         0071F706
 0071F728    pop         edi
 0071F729    pop         esi
 0071F72A    pop         ebx
 0071F72B    mov         esp,ebp
 0071F72D    pop         ebp
 0071F72E    ret         8
end;*}

Initialization
Finalization
//0071F734
{*
 0071F734    push        ebp
 0071F735    mov         ebp,esp
 0071F737    xor         eax,eax
 0071F739    push        ebp
 0071F73A    push        71F765
 0071F73F    push        dword ptr fs:[eax]
 0071F742    mov         dword ptr fs:[eax],esp
 0071F745    inc         dword ptr ds:[822A14]
>0071F74B    jne         0071F757
 0071F74D    mov         eax,78C568;^'_'
 0071F752    call        @UStrClr
 0071F757    xor         eax,eax
 0071F759    pop         edx
 0071F75A    pop         ecx
 0071F75B    pop         ecx
 0071F75C    mov         dword ptr fs:[eax],edx
 0071F75F    push        71F76C
 0071F764    ret
>0071F765    jmp         @HandleFinally
>0071F76A    jmp         0071F764
 0071F76C    pop         ebp
 0071F76D    ret
*}
end.