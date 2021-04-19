//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit PieCursors;

interface

uses
  SysUtils, Classes;

type
  TCursorValue = class(TObjectValue)
  published
    //procedure GetString(?:?);//006CEC90
    function SetString(NewValue:string):Boolean;//006CF5F0
    function GetUnits:TUnits;//006CED28
    function Module:TObject;//006CF5E8
    procedure GetVector(x:Double; y:Double; z:Double);//006CF200
    //function SetVector(z:Double; ?:?; y:Double; ?:?; x:Double; ?:?):Boolean;//006D0390
    procedure FillClone(c:TExpression);//006CEBD8
    //function SetValue(NewValue:Double; ?:?):Boolean;//006CF6B4
    function CanSet:Boolean;//006CEBC4
    function GetDataType:TDataType;//006CEBF8
    procedure CreateClone;//006CEBC8
    procedure GetValue;//006CED80
    //procedure ToString(?:?);//006D06EC
  public
    ............................Item:Integer;//f20
    //procedure ToString(?:?); virtual;//006D06EC
    procedure GetValue; virtual;//v2C//006CED80
    //procedure GetString(?:?); virtual;//v38//006CEC90
    procedure GetVector(x:Double; y:Double; z:Double); virtual;//v3C//006CF200
    function GetDataType:TDataType; virtual;//v44//006CEBF8
    function GetUnits:TUnits; virtual;//v48//006CED28
    //function SetValue(NewValue:Double; ?:?):Boolean; virtual;//v58//006CF6B4
    function SetString(NewValue:string):Boolean; virtual;//v5C//006CF5F0
    //function SetVector(z:Double; ?:?; y:Double; ?:?; x:Double; ?:?):Boolean; virtual;//v60//006D0390
    function CanSet:Boolean; virtual;//v68//006CEBC4
    procedure CreateClone; virtual;//v80//006CEBC8
    procedure FillClone(c:TExpression); virtual;//v84//006CEBD8
    function Module:TObject; virtual;//v98//006CF5E8
  end;
  TModuleCursor = class(TPieModule)
  published
    procedure PrepareForMonitoring;//006D2218
    procedure StartMonitoring;//006D223C
    procedure GetRange(blank:Boolean; min:Integer; max:Integer);//006D2050
    function GetDefaultFormat(field:string):TGuiFormat;//006D1FC0
    procedure StopGUI;//006D2260
    procedure StartGUI;//006D2228
    procedure StopMonitoring;//006D2274
    procedure MonitorFrame;//006D2214
    function IsIdentifier(s:string):Boolean;//006D2068
    procedure StartCompiletime;//006D221C
    procedure StopCompiletime;//006D224C
    procedure StartRuntime;//006D2240
    procedure StopRuntime;//006D2278
    function CreateValue(Identifier:string):TExpression;//006D1F6C
    procedure GetGoodFields;//006D2048
    constructor Create;//006D1E9C
    procedure AddFields;//006D07F8
  public
    function IsIdentifier(s:string):Boolean; virtual;//v10//006D2068
    function CreateValue(Identifier:string):TExpression; virtual;//v14//006D1F6C
    procedure GetGoodFields; virtual;//v1C//006D2048
    procedure AddFields; virtual;//v24//006D07F8
    procedure StartCompiletime; virtual;//v28//006D221C
    procedure StopCompiletime; virtual;//v2C//006D224C
    procedure StartRuntime; virtual;//v30//006D2240
    procedure StopRuntime; virtual;//v34//006D2278
    procedure GetRange(blank:Boolean; min:Integer; max:Integer); virtual;//v40//006D2050
    function GetDefaultFormat(field:string):TGuiFormat; virtual;//v44//006D1FC0
    procedure StartGUI; virtual;//v54//006D2228
    procedure StopGUI; virtual;//v58//006D2260
    procedure PrepareForMonitoring; virtual;//v5C//006D2218
    procedure StartMonitoring; virtual;//v60//006D223C
    procedure StopMonitoring; virtual;//v64//006D2274
    procedure MonitorFrame; virtual;//v68//006D2214
  end;
    procedure sub_006CE874;//006CE874
    procedure sub_006CE888;//006CE888
    procedure sub_006CE898;//006CE898
    //function sub_006CE89C(?:string):?;//006CE89C
    procedure sub_006D0760;//006D0760
    procedure sub_006D0764;//006D0764
    //function sub_006D0788(?:UnicodeString):?;//006D0788
    //procedure sub_006D07DC(?:Integer; ?:?);//006D07DC

implementation

//006CE874
procedure sub_006CE874;
begin
{*
 006CE874    cmp         dword ptr ds:[81F6DC],0;gvar_0081F6DC:TObjectList
>006CE87B    je          006CE887
 006CE87D    mov         eax,[0081F6DC];gvar_0081F6DC:TObjectList
 006CE882    mov         edx,dword ptr [eax]
 006CE884    call        dword ptr [edx+8]
 006CE887    ret
*}
end;

//006CE888
procedure sub_006CE888;
begin
{*
 006CE888    mov         byte ptr ds:[81F6D0],0;gvar_0081F6D0
 006CE88F    call        006CE874
 006CE894    ret
*}
end;

//006CE898
procedure sub_006CE898;
begin
{*
 006CE898    ret
*}
end;

//006CE89C
{*function sub_006CE89C(?:string):?;
begin
 006CE89C    push        ebp
 006CE89D    mov         ebp,esp
 006CE89F    add         esp,0FFFFFFF0
 006CE8A2    push        ebx
 006CE8A3    push        esi
 006CE8A4    push        edi
 006CE8A5    xor         edx,edx
 006CE8A7    mov         dword ptr [ebp-8],edx
 006CE8AA    mov         dword ptr [ebp-4],eax
 006CE8AD    mov         eax,dword ptr [ebp-4]
 006CE8B0    call        @UStrAddRef
 006CE8B5    xor         eax,eax
 006CE8B7    push        ebp
 006CE8B8    push        6CEAE0
 006CE8BD    push        dword ptr fs:[eax]
 006CE8C0    mov         dword ptr fs:[eax],esp
 006CE8C3    xor         eax,eax
 006CE8C5    mov         dword ptr [ebp-0C],eax
 006CE8C8    lea         eax,[ebp-8]
 006CE8CB    mov         edx,dword ptr [ebp-4]
 006CE8CE    call        @UStrLAsg
 006CE8D3    lea         eax,[ebp-8]
 006CE8D6    mov         edx,6CEB00;'RealCursor.'
 006CE8DB    call        004F9BD0
 006CE8E0    mov         byte ptr [ebp-0D],al
 006CE8E3    cmp         byte ptr [ebp-0D],0
>006CE8E7    je          006CE8F1
 006CE8E9    or          ebx,0FFFFFFFF
>006CE8EC    jmp         006CE979
 006CE8F1    lea         eax,[ebp-8]
 006CE8F4    mov         edx,6CEB24;'Fake'
 006CE8F9    call        004F9BD0
 006CE8FE    xor         al,1
 006CE900    mov         byte ptr [ebp-0D],al
 006CE903    lea         eax,[ebp-8]
 006CE906    mov         edx,6CEB3C;'Cursors'
 006CE90B    call        004F9BD0
 006CE910    test        al,al
>006CE912    jne         006CE94B
 006CE914    lea         eax,[ebp-8]
 006CE917    mov         edx,6CEB58;'Cursor'
 006CE91C    call        004F9BD0
 006CE921    test        al,al
>006CE923    jne         006CE94B
 006CE925    lea         eax,[ebp-8]
 006CE928    mov         edx,6CEB74;'MouseCursor'
 006CE92D    call        004F9BD0
 006CE932    test        al,al
>006CE934    jne         006CE94B
 006CE936    lea         eax,[ebp-8]
 006CE939    mov         edx,6CEB98;'MousePointer'
 006CE93E    call        004F9BD0
 006CE943    test        al,al
>006CE945    je          006CEAC5
 006CE94B    lea         eax,[ebp-8]
 006CE94E    call        004F9D00
 006CE953    mov         ebx,eax
 006CE955    cmp         byte ptr [ebp-0D],0
>006CE959    jne         006CE964
 006CE95B    test        ebx,ebx
>006CE95D    jge         006CE964
 006CE95F    mov         ebx,1
 006CE964    lea         eax,[ebp-8]
 006CE967    mov         edx,6CEBC0;'.'
 006CE96C    call        004F9BD0
 006CE971    test        al,al
>006CE973    je          006CEAC5
 006CE979    mov         eax,dword ptr [ebp-8]
 006CE97C    call        006D0788
 006CE981    mov         esi,eax
 006CE983    test        esi,esi
>006CE985    jl          006CEAC5
 006CE98B    mov         dl,1
 006CE98D    mov         eax,[006CDF50];TCursorValue
 006CE992    call        TObject.Create;TCursorValue.Create
 006CE997    mov         dword ptr [ebp-0C],eax
 006CE99A    mov         eax,dword ptr [ebp-0C]
 006CE99D    mov         dword ptr [eax+20],esi;TCursorValue..............................Item:Integer
 006CE9A0    cmp         ebx,3E7
>006CE9A6    jne         006CEA4C
 006CE9AC    mov         ebx,10
 006CE9B1    lea         eax,[ebx+1]
 006CE9B4    mov         edx,dword ptr ds:[81F6DC];gvar_0081F6DC:TObjectList
 006CE9BA    cmp         eax,dword ptr [edx+8]
>006CE9BD    jle         006CE9CB
 006CE9BF    mov         edx,eax
 006CE9C1    mov         eax,[0081F6DC];gvar_0081F6DC:TObjectList
 006CE9C6    call        TList.SetCount
 006CE9CB    mov         eax,[0081F6DC];gvar_0081F6DC:TObjectList
 006CE9D0    mov         esi,dword ptr [eax+8]
 006CE9D3    dec         esi
 006CE9D4    test        esi,esi
>006CE9D6    jl          006CEA43
 006CE9D8    inc         esi
 006CE9D9    xor         ebx,ebx
 006CE9DB    mov         edi,dword ptr ds:[81F6DC];gvar_0081F6DC:TObjectList
 006CE9E1    mov         edx,ebx
 006CE9E3    mov         eax,edi
 006CE9E5    call        TList.Get
 006CE9EA    test        eax,eax
>006CE9EC    jne         006CEA3F
 006CE9EE    mov         edi,dword ptr ds:[81F6DC];gvar_0081F6DC:TObjectList
 006CE9F4    mov         ecx,dword ptr ds:[78D590];^Application:TApplication
 006CE9FA    mov         ecx,dword ptr [ecx]
 006CE9FC    mov         dl,1
 006CE9FE    mov         eax,[005E5828];TCursorForm
 006CEA03    call        TCustomForm.Create;TCursorForm.Create
 006CEA08    mov         ecx,eax
 006CEA0A    mov         edx,ebx
 006CEA0C    mov         eax,edi
 006CEA0E    call        TList.Put
 006CEA13    mov         edi,dword ptr ds:[81F6DC];gvar_0081F6DC:TObjectList
 006CEA19    mov         edx,ebx
 006CEA1B    mov         eax,edi
 006CEA1D    call        TList.Get
 006CEA22    mov         edx,ebx
 006CEA24    call        005E9B54
 006CEA29    mov         edi,dword ptr ds:[81F6DC];gvar_0081F6DC:TObjectList
 006CEA2F    mov         edx,ebx
 006CEA31    mov         eax,edi
 006CEA33    call        TList.Get
 006CEA38    xor         edx,edx
 006CEA3A    call        TCustomForm.SetVisible
 006CEA3F    inc         ebx
 006CEA40    dec         esi
>006CEA41    jne         006CE9DB
 006CEA43    mov         byte ptr ds:[81F6D0],1;gvar_0081F6D0
>006CEA4A    jmp         006CEAC5
 006CEA4C    mov         eax,dword ptr [ebp-0C]
 006CEA4F    mov         dword ptr [eax+18],ebx;TCursorValue........................................................
 006CEA52    lea         eax,[ebx+1]
 006CEA55    mov         edx,dword ptr ds:[81F6DC];gvar_0081F6DC:TObjectList
 006CEA5B    cmp         eax,dword ptr [edx+8]
>006CEA5E    jle         006CEA6C
 006CEA60    mov         edx,eax
 006CEA62    mov         eax,[0081F6DC];gvar_0081F6DC:TObjectList
 006CEA67    call        TList.SetCount
 006CEA6C    test        ebx,ebx
>006CEA6E    jl          006CEAC5
 006CEA70    mov         esi,dword ptr ds:[81F6DC];gvar_0081F6DC:TObjectList
 006CEA76    mov         edx,ebx
 006CEA78    mov         eax,esi
 006CEA7A    call        TList.Get
 006CEA7F    test        eax,eax
>006CEA81    jne         006CEAC5
 006CEA83    mov         esi,dword ptr ds:[81F6DC];gvar_0081F6DC:TObjectList
 006CEA89    mov         ecx,dword ptr ds:[78D590];^Application:TApplication
 006CEA8F    mov         ecx,dword ptr [ecx]
 006CEA91    mov         dl,1
 006CEA93    mov         eax,[005E5828];TCursorForm
 006CEA98    call        TCustomForm.Create;TCursorForm.Create
 006CEA9D    mov         ecx,eax
 006CEA9F    mov         edx,ebx
 006CEAA1    mov         eax,esi
 006CEAA3    call        TList.Put
 006CEAA8    mov         esi,dword ptr ds:[81F6DC];gvar_0081F6DC:TObjectList
 006CEAAE    mov         edx,ebx
 006CEAB0    mov         eax,esi
 006CEAB2    call        TList.Get
 006CEAB7    mov         edx,ebx
 006CEAB9    call        005E9B54
 006CEABE    mov         byte ptr ds:[81F6D0],1;gvar_0081F6D0
 006CEAC5    xor         eax,eax
 006CEAC7    pop         edx
 006CEAC8    pop         ecx
 006CEAC9    pop         ecx
 006CEACA    mov         dword ptr fs:[eax],edx
 006CEACD    push        6CEAE7
 006CEAD2    lea         eax,[ebp-8]
 006CEAD5    mov         edx,2
 006CEADA    call        @UStrArrayClr
 006CEADF    ret
>006CEAE0    jmp         @HandleFinally
>006CEAE5    jmp         006CEAD2
 006CEAE7    mov         eax,dword ptr [ebp-0C]
 006CEAEA    pop         edi
 006CEAEB    pop         esi
 006CEAEC    pop         ebx
 006CEAED    mov         esp,ebp
 006CEAEF    pop         ebp
 006CEAF0    ret
end;*}

//006CEBC4
function TCursorValue.CanSet:Boolean;
begin
{*
 006CEBC4    mov         al,1
 006CEBC6    ret
*}
end;

//006CEBC8
procedure TCursorValue.CreateClone;
begin
{*
 006CEBC8    mov         dl,1
 006CEBCA    mov         eax,[006CDF50];TCursorValue
 006CEBCF    call        TObject.Create;TCursorValue.Create
 006CEBD4    ret
*}
end;

//006CEBD8
procedure TCursorValue.FillClone(c:TExpression);
begin
{*
 006CEBD8    push        ebx
 006CEBD9    push        esi
 006CEBDA    mov         esi,edx
 006CEBDC    mov         ebx,eax
 006CEBDE    mov         edx,esi
 006CEBE0    mov         eax,ebx
 006CEBE2    call        TExpression.FillClone
 006CEBE7    mov         eax,esi
 006CEBE9    mov         edx,dword ptr [ebx+20];TCursorValue...............................Item:Integer
 006CEBEC    mov         dword ptr [eax+20],edx
 006CEBEF    mov         edx,dword ptr [ebx+18];TCursorValue........................................................
 006CEBF2    mov         dword ptr [eax+18],edx
 006CEBF5    pop         esi
 006CEBF6    pop         ebx
 006CEBF7    ret
*}
end;

//006CEBF8
function TCursorValue.GetDataType:TDataType;
begin
{*
 006CEBF8    mov         eax,dword ptr [eax+20];TCursorValue................................Item:Integer
 006CEBFB    cmp         eax,29
>006CEBFE    ja          006CEC8D
 006CEC04    movzx       eax,byte ptr [eax+6CEC12]
 006CEC0B    jmp         dword ptr [eax*4+6CEC3C]
 006CEC0B    db          0
 006CEC0B    db          7
 006CEC0B    db          1
 006CEC0B    db          1
 006CEC0B    db          1
 006CEC0B    db          1
 006CEC0B    db          1
 006CEC0B    db          1
 006CEC0B    db          1
 006CEC0B    db          1
 006CEC0B    db          5
 006CEC0B    db          0
 006CEC0B    db          0
 006CEC0B    db          3
 006CEC0B    db          3
 006CEC0B    db          2
 006CEC0B    db          2
 006CEC0B    db          0
 006CEC0B    db          0
 006CEC0B    db          2
 006CEC0B    db          2
 006CEC0B    db          0
 006CEC0B    db          0
 006CEC0B    db          0
 006CEC0B    db          0
 006CEC0B    db          2
 006CEC0B    db          2
 006CEC0B    db          4
 006CEC0B    db          6
 006CEC0B    db          8
 006CEC0B    db          9
 006CEC0B    db          9
 006CEC0B    db          9
 006CEC0B    db          9
 006CEC0B    db          9
 006CEC0B    db          0
 006CEC0B    db          10
 006CEC0B    db          0
 006CEC0B    db          10
 006CEC0B    db          11
 006CEC0B    db          11
 006CEC0B    db          3
 006CEC0B    dd          006CEC8D
 006CEC0B    dd          006CEC6C
 006CEC0B    dd          006CEC6F
 006CEC0B    dd          006CEC72
 006CEC0B    dd          006CEC75
 006CEC0B    dd          006CEC78
 006CEC0B    dd          006CEC7B
 006CEC0B    dd          006CEC7E
 006CEC0B    dd          006CEC81
 006CEC0B    dd          006CEC84
 006CEC0B    dd          006CEC87
 006CEC0B    dd          006CEC8A
 006CEC6C    mov         al,3
 006CEC6E    ret
 006CEC6F    xor         eax,eax
 006CEC71    ret
 006CEC72    mov         al,2
 006CEC74    ret
 006CEC75    xor         eax,eax
 006CEC77    ret
 006CEC78    xor         eax,eax
 006CEC7A    ret
 006CEC7B    mov         al,2
 006CEC7D    ret
 006CEC7E    mov         al,3
 006CEC80    ret
 006CEC81    mov         al,2
 006CEC83    ret
 006CEC84    mov         al,5
 006CEC86    ret
 006CEC87    mov         al,4
 006CEC89    ret
 006CEC8A    mov         al,7
 006CEC8C    ret
 006CEC8D    xor         eax,eax
 006CEC8F    ret
*}
end;

//006CEC90
{*procedure TCursorValue.GetString(?:?);
begin
 006CEC90    push        ebx
 006CEC91    push        esi
 006CEC92    push        edi
 006CEC93    push        ebp
 006CEC94    mov         esi,edx
 006CEC96    mov         ebx,eax
 006CEC98    mov         eax,[0081F6DC];gvar_0081F6DC:TObjectList
 006CEC9D    mov         eax,dword ptr [eax+8]
 006CECA0    mov         edi,dword ptr [ebx+18];TCursorValue........................................................
 006CECA3    cmp         eax,edi
>006CECA5    jg          006CECB0
 006CECA7    mov         eax,esi
 006CECA9    call        @UStrClr
>006CECAE    jmp         006CED22
 006CECB0    mov         eax,dword ptr [ebx+20];TCursorValue.................................Item:Integer
 006CECB3    sub         eax,24
>006CECB6    je          006CECBF
 006CECB8    sub         eax,2
>006CECBB    je          006CECEC
>006CECBD    jmp         006CED19
 006CECBF    test        edi,edi
>006CECC1    jge         006CECCC
 006CECC3    mov         eax,esi
 006CECC5    call        @UStrClr
>006CECCA    jmp         006CED22
 006CECCC    mov         ebp,dword ptr ds:[81F6DC];gvar_0081F6DC:TObjectList
 006CECD2    mov         edx,edi
 006CECD4    mov         eax,ebp
 006CECD6    call        TList.Get
 006CECDB    mov         ebx,eax
 006CECDD    mov         eax,esi
 006CECDF    mov         edx,dword ptr [ebx+3FC]
 006CECE5    call        @UStrAsg
>006CECEA    jmp         006CED22
 006CECEC    test        edi,edi
>006CECEE    jge         006CECF9
 006CECF0    mov         eax,esi
 006CECF2    call        @UStrClr
>006CECF7    jmp         006CED22
 006CECF9    mov         ebp,dword ptr ds:[81F6DC];gvar_0081F6DC:TObjectList
 006CECFF    mov         edx,edi
 006CED01    mov         eax,ebp
 006CED03    call        TList.Get
 006CED08    mov         ebx,eax
 006CED0A    mov         eax,esi
 006CED0C    mov         edx,dword ptr [ebx+400]
 006CED12    call        @UStrAsg
>006CED17    jmp         006CED22
 006CED19    mov         edx,esi
 006CED1B    mov         eax,ebx
 006CED1D    call        TExpression.GetString
 006CED22    pop         ebp
 006CED23    pop         edi
 006CED24    pop         esi
 006CED25    pop         ebx
 006CED26    ret
end;*}

//006CED28
function TCursorValue.GetUnits:TUnits;
begin
{*
 006CED28    mov         eax,dword ptr [eax+20];TCursorValue..................................Item:Integer
 006CED2B    add         eax,0FFFFFFF6
 006CED2E    cmp         eax,19
>006CED31    ja          006CED7B
 006CED33    movzx       eax,byte ptr [eax+6CED41]
 006CED3A    jmp         dword ptr [eax*4+6CED5B]
 006CED3A    db          1
 006CED3A    db          0
 006CED3A    db          0
 006CED3A    db          2
 006CED3A    db          2
 006CED3A    db          0
 006CED3A    db          0
 006CED3A    db          0
 006CED3A    db          0
 006CED3A    db          3
 006CED3A    db          3
 006CED3A    db          0
 006CED3A    db          0
 006CED3A    db          0
 006CED3A    db          0
 006CED3A    db          0
 006CED3A    db          0
 006CED3A    db          0
 006CED3A    db          0
 006CED3A    db          0
 006CED3A    db          2
 006CED3A    db          0
 006CED3A    db          0
 006CED3A    db          3
 006CED3A    db          3
 006CED3A    db          4
 006CED3A    dd          006CED7B
 006CED3A    dd          006CED6F
 006CED3A    dd          006CED72
 006CED3A    dd          006CED75
 006CED3A    dd          006CED78
 006CED6F    mov         al,11
 006CED71    ret
 006CED72    mov         al,0C
 006CED74    ret
 006CED75    mov         al,0D
 006CED77    ret
 006CED78    mov         al,18
 006CED7A    ret
 006CED7B    xor         eax,eax
 006CED7D    ret
*}
end;

//006CED80
procedure TCursorValue.GetValue;
begin
{*
 006CED80    push        ebx
 006CED81    push        esi
 006CED82    push        edi
 006CED83    add         esp,0FFFFFFC0
 006CED86    mov         ebx,eax
 006CED88    mov         esi,dword ptr [ebx+18];TCursorValue........................................................
 006CED8B    test        esi,esi
>006CED8D    jge         006CED93
 006CED8F    xor         esi,esi
>006CED91    jmp         006CEDD9
 006CED93    mov         eax,[0081F6DC];gvar_0081F6DC:TObjectList
 006CED98    cmp         esi,dword ptr [eax+8]
>006CED9B    jl          006CEDA1
 006CED9D    mov         al,1
>006CED9F    jmp         006CEDB5
 006CEDA1    mov         edi,dword ptr ds:[81F6DC];gvar_0081F6DC:TObjectList
 006CEDA7    mov         edx,esi
 006CEDA9    mov         eax,edi
 006CEDAB    call        TList.Get
 006CEDB0    test        eax,eax
 006CEDB2    sete        al
 006CEDB5    test        al,al
>006CEDB7    je          006CEDC7
 006CEDB9    xor         eax,eax
 006CEDBB    mov         dword ptr [esp],eax
 006CEDBE    mov         dword ptr [esp+4],eax
>006CEDC2    jmp         006CF1F2
 006CEDC7    mov         esi,dword ptr ds:[81F6DC];gvar_0081F6DC:TObjectList
 006CEDCD    mov         edx,dword ptr [ebx+18];TCursorValue........................................................
 006CEDD0    mov         eax,esi
 006CEDD2    call        TList.Get
 006CEDD7    mov         esi,eax
 006CEDD9    mov         eax,dword ptr [ebx+20];TCursorValue...................................Item:Integer
 006CEDDC    cmp         eax,29
>006CEDDF    ja          006CF1E9
 006CEDE5    movzx       eax,byte ptr [eax+6CEDF3]
 006CEDEC    jmp         dword ptr [eax*4+6CEE1D]
 006CEDEC    db          0
 006CEDEC    db          1
 006CEDEC    db          0
 006CEDEC    db          0
 006CEDEC    db          0
 006CEDEC    db          0
 006CEDEC    db          0
 006CEDEC    db          0
 006CEDEC    db          0
 006CEDEC    db          0
 006CEDEC    db          2
 006CEDEC    db          0
 006CEDEC    db          0
 006CEDEC    db          10
 006CEDEC    db          11
 006CEDEC    db          6
 006CEDEC    db          7
 006CEDEC    db          8
 006CEDEC    db          9
 006CEDEC    db          0
 006CEDEC    db          0
 006CEDEC    db          0
 006CEDEC    db          0
 006CEDEC    db          0
 006CEDEC    db          0
 006CEDEC    db          0
 006CEDEC    db          0
 006CEDEC    db          0
 006CEDEC    db          3
 006CEDEC    db          4
 006CEDEC    db          0
 006CEDEC    db          0
 006CEDEC    db          0
 006CEDEC    db          0
 006CEDEC    db          0
 006CEDEC    db          12
 006CEDEC    db          0
 006CEDEC    db          0
 006CEDEC    db          0
 006CEDEC    db          0
 006CEDEC    db          0
 006CEDEC    db          5
 006CEDEC    dd          006CF1E9
 006CEDEC    dd          006CEE51
 006CEDEC    dd          006CEE9A
 006CEDEC    dd          006CEEBC
 006CEDEC    dd          006CEEFB
 006CEDEC    dd          006CEF46
 006CEDEC    dd          006CEF57
 006CEDEC    dd          006CEFC3
 006CEDEC    dd          006CF02F
 006CEDEC    dd          006CF0CA
 006CEDEC    dd          006CF165
 006CEDEC    dd          006CF194
 006CEDEC    dd          006CF1C3
 006CEE51    cmp         dword ptr [ebx+18],0;TCursorValue..........................................................
>006CEE55    jge         006CEE82
 006CEE57    mov         dword ptr [esp+10],14
 006CEE5F    lea         eax,[esp+10]
 006CEE63    push        eax
 006CEE64    call        user32.GetCursorInfo
 006CEE69    test        dword ptr [esp+14],1
 006CEE71    seta        al
 006CEE74    call        00686074
 006CEE79    fstp        qword ptr [esp]
 006CEE7C    wait
>006CEE7D    jmp         006CF1F2
 006CEE82    movzx       eax,byte ptr [esi+59]
 006CEE86    movsx       eax,al
 006CEE89    mov         dword ptr [esp+24],eax
 006CEE8D    fild        dword ptr [esp+24]
 006CEE91    fstp        qword ptr [esp]
 006CEE94    wait
>006CEE95    jmp         006CF1F2
 006CEE9A    call        user32.GetDoubleClickTime
 006CEE9F    mov         dword ptr [esp+28],eax
 006CEEA3    xor         eax,eax
 006CEEA5    mov         dword ptr [esp+2C],eax
 006CEEA9    fild        qword ptr [esp+28]
 006CEEAD    fdiv        dword ptr ds:[6CF1FC];1000:Single
 006CEEB3    fstp        qword ptr [esp]
 006CEEB6    wait
>006CEEB7    jmp         006CF1F2
 006CEEBC    test        esi,esi
>006CEEBE    jne         006CEEEC
 006CEEC0    mov         dword ptr [esp+10],14
 006CEEC8    lea         eax,[esp+10]
 006CEECC    push        eax
 006CEECD    call        user32.GetCursorInfo
 006CEED2    mov         eax,dword ptr [esp+18]
 006CEED6    call        005EB23C
 006CEEDB    mov         dword ptr [esp+24],eax
 006CEEDF    fild        dword ptr [esp+24]
 006CEEE3    fstp        qword ptr [esp]
 006CEEE6    wait
>006CEEE7    jmp         006CF1F2
 006CEEEC    fild        dword ptr [esi+3A4]
 006CEEF2    fstp        qword ptr [esp]
 006CEEF5    wait
>006CEEF6    jmp         006CF1F2
 006CEEFB    test        esi,esi
>006CEEFD    jne         006CEF20
 006CEEFF    mov         eax,[0078DB00];^Screen:TScreen
 006CEF04    mov         eax,dword ptr [eax]
 006CEF06    movzx       eax,word ptr [eax+48];TScreen.FCursor:TCursor
 006CEF0A    call        005EB3B0
 006CEF0F    mov         dword ptr [esp+24],eax
 006CEF13    fild        dword ptr [esp+24]
 006CEF17    fstp        qword ptr [esp]
 006CEF1A    wait
>006CEF1B    jmp         006CF1F2
 006CEF20    cmp         byte ptr [esi+3C3],0
>006CEF27    jne         006CEF37
 006CEF29    xor         eax,eax
 006CEF2B    mov         dword ptr [esp],eax
 006CEF2E    mov         dword ptr [esp+4],eax
>006CEF32    jmp         006CF1F2
 006CEF37    fild        dword ptr [esi+3A4]
 006CEF3D    fstp        qword ptr [esp]
 006CEF40    wait
>006CEF41    jmp         006CF1F2
 006CEF46    mov         eax,[0081F6DC];gvar_0081F6DC:TObjectList
 006CEF4B    fild        dword ptr [eax+8]
 006CEF4E    fstp        qword ptr [esp]
 006CEF51    wait
>006CEF52    jmp         006CF1F2
 006CEF57    cmp         dword ptr [ebx+18],0;TCursorValue..........................................................
>006CEF5B    jge         006CEF8B
 006CEF5D    lea         eax,[esp+8]
 006CEF61    push        eax
 006CEF62    call        user32.GetCursorPos
 006CEF67    mov         eax,[0078DB00];^Screen:TScreen
 006CEF6C    mov         eax,dword ptr [eax]
 006CEF6E    call        TScreen.GetWidth
 006CEF73    dec         eax
 006CEF74    mov         dword ptr [esp+24],eax
 006CEF78    fild        dword ptr [esp+24]
 006CEF7C    fild        dword ptr [esp+8]
 006CEF80    fdivrp      st(1),st
 006CEF82    fstp        qword ptr [esp]
 006CEF85    wait
>006CEF86    jmp         006CF1F2
 006CEF8B    mov         eax,esi
 006CEF8D    call        TCursorForm.GetX
 006CEF92    mov         dword ptr [esp+24],eax
 006CEF96    fild        dword ptr [esp+24]
 006CEF9A    fstp        tbyte ptr [esp+30]
 006CEF9E    wait
 006CEF9F    mov         eax,[0078DB00];^Screen:TScreen
 006CEFA4    mov         eax,dword ptr [eax]
 006CEFA6    call        TScreen.GetWidth
 006CEFAB    dec         eax
 006CEFAC    mov         dword ptr [esp+3C],eax
 006CEFB0    fild        dword ptr [esp+3C]
 006CEFB4    fld         tbyte ptr [esp+30]
 006CEFB8    fdivrp      st(1),st
 006CEFBA    fstp        qword ptr [esp]
 006CEFBD    wait
>006CEFBE    jmp         006CF1F2
 006CEFC3    cmp         dword ptr [ebx+18],0;TCursorValue..........................................................
>006CEFC7    jge         006CEFF7
 006CEFC9    lea         eax,[esp+8]
 006CEFCD    push        eax
 006CEFCE    call        user32.GetCursorPos
 006CEFD3    mov         eax,[0078DB00];^Screen:TScreen
 006CEFD8    mov         eax,dword ptr [eax]
 006CEFDA    call        TScreen.GetHeight
 006CEFDF    dec         eax
 006CEFE0    mov         dword ptr [esp+24],eax
 006CEFE4    fild        dword ptr [esp+24]
 006CEFE8    fild        dword ptr [esp+0C]
 006CEFEC    fdivrp      st(1),st
 006CEFEE    fstp        qword ptr [esp]
 006CEFF1    wait
>006CEFF2    jmp         006CF1F2
 006CEFF7    mov         eax,esi
 006CEFF9    call        TCursorForm.GetY
 006CEFFE    mov         dword ptr [esp+24],eax
 006CF002    fild        dword ptr [esp+24]
 006CF006    fstp        tbyte ptr [esp+30]
 006CF00A    wait
 006CF00B    mov         eax,[0078DB00];^Screen:TScreen
 006CF010    mov         eax,dword ptr [eax]
 006CF012    call        TScreen.GetWidth
 006CF017    dec         eax
 006CF018    mov         dword ptr [esp+3C],eax
 006CF01C    fild        dword ptr [esp+3C]
 006CF020    fld         tbyte ptr [esp+30]
 006CF024    fdivrp      st(1),st
 006CF026    fstp        qword ptr [esp]
 006CF029    wait
>006CF02A    jmp         006CF1F2
 006CF02F    cmp         dword ptr [ebx+18],0;TCursorValue..........................................................
>006CF033    jge         006CF082
 006CF035    lea         eax,[esp+8]
 006CF039    push        eax
 006CF03A    call        user32.GetCursorPos
 006CF03F    mov         eax,[0078DB00];^Screen:TScreen
 006CF044    mov         eax,dword ptr [eax]
 006CF046    call        TScreen.GetDesktopLeft
 006CF04B    mov         edx,dword ptr [esp+8]
 006CF04F    sub         edx,eax
 006CF051    mov         dword ptr [esp+24],edx
 006CF055    fild        dword ptr [esp+24]
 006CF059    fstp        tbyte ptr [esp+30]
 006CF05D    wait
 006CF05E    mov         eax,[0078DB00];^Screen:TScreen
 006CF063    mov         eax,dword ptr [eax]
 006CF065    call        TScreen.GetDesktopWidth
 006CF06A    dec         eax
 006CF06B    mov         dword ptr [esp+3C],eax
 006CF06F    fild        dword ptr [esp+3C]
 006CF073    fld         tbyte ptr [esp+30]
 006CF077    fdivrp      st(1),st
 006CF079    fstp        qword ptr [esp]
 006CF07C    wait
>006CF07D    jmp         006CF1F2
 006CF082    mov         eax,esi
 006CF084    call        TCursorForm.GetX
 006CF089    mov         ebx,eax
 006CF08B    mov         eax,[0078DB00];^Screen:TScreen
 006CF090    mov         eax,dword ptr [eax]
 006CF092    call        TScreen.GetDesktopLeft
 006CF097    sub         ebx,eax
 006CF099    mov         dword ptr [esp+24],ebx
 006CF09D    fild        dword ptr [esp+24]
 006CF0A1    fstp        tbyte ptr [esp+30]
 006CF0A5    wait
 006CF0A6    mov         eax,[0078DB00];^Screen:TScreen
 006CF0AB    mov         eax,dword ptr [eax]
 006CF0AD    call        TScreen.GetDesktopWidth
 006CF0B2    dec         eax
 006CF0B3    mov         dword ptr [esp+3C],eax
 006CF0B7    fild        dword ptr [esp+3C]
 006CF0BB    fld         tbyte ptr [esp+30]
 006CF0BF    fdivrp      st(1),st
 006CF0C1    fstp        qword ptr [esp]
 006CF0C4    wait
>006CF0C5    jmp         006CF1F2
 006CF0CA    cmp         dword ptr [ebx+18],0;TCursorValue..........................................................
>006CF0CE    jge         006CF11D
 006CF0D0    lea         eax,[esp+8]
 006CF0D4    push        eax
 006CF0D5    call        user32.GetCursorPos
 006CF0DA    mov         eax,[0078DB00];^Screen:TScreen
 006CF0DF    mov         eax,dword ptr [eax]
 006CF0E1    call        TScreen.GetDesktopTop
 006CF0E6    mov         edx,dword ptr [esp+0C]
 006CF0EA    sub         edx,eax
 006CF0EC    mov         dword ptr [esp+24],edx
 006CF0F0    fild        dword ptr [esp+24]
 006CF0F4    fstp        tbyte ptr [esp+30]
 006CF0F8    wait
 006CF0F9    mov         eax,[0078DB00];^Screen:TScreen
 006CF0FE    mov         eax,dword ptr [eax]
 006CF100    call        TScreen.GetDesktopHeight
 006CF105    dec         eax
 006CF106    mov         dword ptr [esp+3C],eax
 006CF10A    fild        dword ptr [esp+3C]
 006CF10E    fld         tbyte ptr [esp+30]
 006CF112    fdivrp      st(1),st
 006CF114    fstp        qword ptr [esp]
 006CF117    wait
>006CF118    jmp         006CF1F2
 006CF11D    mov         eax,esi
 006CF11F    call        TCursorForm.GetY
 006CF124    mov         ebx,eax
 006CF126    mov         eax,[0078DB00];^Screen:TScreen
 006CF12B    mov         eax,dword ptr [eax]
 006CF12D    call        TScreen.GetDesktopTop
 006CF132    sub         ebx,eax
 006CF134    mov         dword ptr [esp+24],ebx
 006CF138    fild        dword ptr [esp+24]
 006CF13C    fstp        tbyte ptr [esp+30]
 006CF140    wait
 006CF141    mov         eax,[0078DB00];^Screen:TScreen
 006CF146    mov         eax,dword ptr [eax]
 006CF148    call        TScreen.GetDesktopHeight
 006CF14D    dec         eax
 006CF14E    mov         dword ptr [esp+3C],eax
 006CF152    fild        dword ptr [esp+3C]
 006CF156    fld         tbyte ptr [esp+30]
 006CF15A    fdivrp      st(1),st
 006CF15C    fstp        qword ptr [esp]
 006CF15F    wait
>006CF160    jmp         006CF1F2
 006CF165    cmp         dword ptr [ebx+18],0;TCursorValue..........................................................
>006CF169    jge         006CF17F
 006CF16B    lea         eax,[esp+8]
 006CF16F    push        eax
 006CF170    call        user32.GetCursorPos
 006CF175    fild        dword ptr [esp+8]
 006CF179    fstp        qword ptr [esp]
 006CF17C    wait
>006CF17D    jmp         006CF1F2
 006CF17F    mov         eax,esi
 006CF181    call        TCursorForm.GetX
 006CF186    mov         dword ptr [esp+24],eax
 006CF18A    fild        dword ptr [esp+24]
 006CF18E    fstp        qword ptr [esp]
 006CF191    wait
>006CF192    jmp         006CF1F2
 006CF194    cmp         dword ptr [ebx+18],0;TCursorValue..........................................................
>006CF198    jge         006CF1AE
 006CF19A    lea         eax,[esp+8]
 006CF19E    push        eax
 006CF19F    call        user32.GetCursorPos
 006CF1A4    fild        dword ptr [esp+0C]
 006CF1A8    fstp        qword ptr [esp]
 006CF1AB    wait
>006CF1AC    jmp         006CF1F2
 006CF1AE    mov         eax,esi
 006CF1B0    call        TCursorForm.GetY
 006CF1B5    mov         dword ptr [esp+24],eax
 006CF1B9    fild        dword ptr [esp+24]
 006CF1BD    fstp        qword ptr [esp]
 006CF1C0    wait
>006CF1C1    jmp         006CF1F2
 006CF1C3    cmp         dword ptr [ebx+18],0;TCursorValue..........................................................
>006CF1C7    jge         006CF1D4
 006CF1C9    xor         eax,eax
 006CF1CB    mov         dword ptr [esp],eax
 006CF1CE    mov         dword ptr [esp+4],eax
>006CF1D2    jmp         006CF1F2
 006CF1D4    mov         eax,dword ptr [esi+3F0]
 006CF1DA    mov         dword ptr [esp],eax
 006CF1DD    mov         eax,dword ptr [esi+3F4]
 006CF1E3    mov         dword ptr [esp+4],eax
>006CF1E7    jmp         006CF1F2
 006CF1E9    xor         eax,eax
 006CF1EB    mov         dword ptr [esp],eax
 006CF1EE    mov         dword ptr [esp+4],eax
 006CF1F2    fld         qword ptr [esp]
 006CF1F5    add         esp,40
 006CF1F8    pop         edi
 006CF1F9    pop         esi
 006CF1FA    pop         ebx
 006CF1FB    ret
*}
end;

//006CF200
procedure TCursorValue.GetVector(x:Double; y:Double; z:Double);
begin
{*
 006CF200    push        ebp
 006CF201    mov         ebp,esp
 006CF203    add         esp,0FFFFFFD0
 006CF206    push        ebx
 006CF207    push        esi
 006CF208    push        edi
 006CF209    mov         dword ptr [ebp-8],ecx
 006CF20C    mov         dword ptr [ebp-4],edx
 006CF20F    mov         ebx,eax
 006CF211    mov         edi,dword ptr [ebp+8]
 006CF214    mov         esi,dword ptr [ebx+18];TCursorValue........................................................
 006CF217    test        esi,esi
>006CF219    jge         006CF21F
 006CF21B    xor         esi,esi
>006CF21D    jmp         006CF27A
 006CF21F    mov         eax,[0081F6DC];gvar_0081F6DC:TObjectList
 006CF224    cmp         esi,dword ptr [eax+8]
>006CF227    jl          006CF22D
 006CF229    mov         al,1
>006CF22B    jmp         006CF244
 006CF22D    mov         eax,[0081F6DC];gvar_0081F6DC:TObjectList
 006CF232    mov         dword ptr [ebp-14],eax
 006CF235    mov         edx,esi
 006CF237    mov         eax,dword ptr [ebp-14]
 006CF23A    call        TList.Get
 006CF23F    test        eax,eax
 006CF241    sete        al
 006CF244    test        al,al
>006CF246    je          006CF268
 006CF248    mov         eax,dword ptr [ebp-4]
 006CF24B    xor         edx,edx
 006CF24D    mov         dword ptr [eax],edx
 006CF24F    mov         dword ptr [eax+4],edx
 006CF252    mov         eax,dword ptr [ebp-8]
 006CF255    xor         edx,edx
 006CF257    mov         dword ptr [eax],edx
 006CF259    mov         dword ptr [eax+4],edx
 006CF25C    xor         eax,eax
 006CF25E    mov         dword ptr [edi],eax
 006CF260    mov         dword ptr [edi+4],eax
>006CF263    jmp         006CF5DA
 006CF268    mov         esi,dword ptr ds:[81F6DC];gvar_0081F6DC:TObjectList
 006CF26E    mov         edx,dword ptr [ebx+18];TCursorValue........................................................
 006CF271    mov         eax,esi
 006CF273    call        TList.Get
 006CF278    mov         esi,eax
 006CF27A    xor         eax,eax
 006CF27C    mov         dword ptr [edi],eax
 006CF27E    mov         dword ptr [edi+4],eax
 006CF281    mov         eax,dword ptr [ebx+20];TCursorValue....................................Item:Integer
 006CF284    add         eax,0FFFFFFE2
 006CF287    cmp         eax,0A
>006CF28A    ja          006CF5DA
 006CF290    jmp         dword ptr [eax*4+6CF297]
 006CF290    dd          006CF3DB
 006CF290    dd          006CF42A
 006CF290    dd          006CF4DB
 006CF290    dd          006CF5DA
 006CF290    dd          006CF5DA
 006CF290    dd          006CF5DA
 006CF290    dd          006CF5DA
 006CF290    dd          006CF5DA
 006CF290    dd          006CF5DA
 006CF290    dd          006CF2C3
 006CF290    dd          006CF34F
 006CF2C3    test        esi,esi
>006CF2C5    jne         006CF2E7
 006CF2C7    mov         eax,dword ptr [ebp-4]
 006CF2CA    xor         edx,edx
 006CF2CC    mov         dword ptr [eax],edx
 006CF2CE    mov         dword ptr [eax+4],edx
 006CF2D1    mov         eax,dword ptr [ebp-8]
 006CF2D4    xor         edx,edx
 006CF2D6    mov         dword ptr [eax],edx
 006CF2D8    mov         dword ptr [eax+4],edx
 006CF2DB    xor         eax,eax
 006CF2DD    mov         dword ptr [edi],eax
 006CF2DF    mov         dword ptr [edi+4],eax
>006CF2E2    jmp         006CF5DA
 006CF2E7    mov         eax,dword ptr [esi+404]
 006CF2ED    mov         edx,eax
 006CF2EF    and         edx,0FF
 006CF2F5    mov         dword ptr [ebp-1C],edx
 006CF2F8    xor         edx,edx
 006CF2FA    mov         dword ptr [ebp-18],edx
 006CF2FD    fild        qword ptr [ebp-1C]
 006CF300    fdiv        dword ptr ds:[6CF5E4];255:Single
 006CF306    mov         edx,dword ptr [ebp-4]
 006CF309    fstp        qword ptr [edx]
 006CF30B    wait
 006CF30C    mov         edx,eax
 006CF30E    shl         edx,8
 006CF311    and         edx,0FF
 006CF317    mov         dword ptr [ebp-1C],edx
 006CF31A    xor         edx,edx
 006CF31C    mov         dword ptr [ebp-18],edx
 006CF31F    fild        qword ptr [ebp-1C]
 006CF322    fdiv        dword ptr ds:[6CF5E4];255:Single
 006CF328    mov         edx,dword ptr [ebp-8]
 006CF32B    fstp        qword ptr [edx]
 006CF32D    wait
 006CF32E    shl         eax,10
 006CF331    and         eax,0FF
 006CF336    mov         dword ptr [ebp-1C],eax
 006CF339    xor         eax,eax
 006CF33B    mov         dword ptr [ebp-18],eax
 006CF33E    fild        qword ptr [ebp-1C]
 006CF341    fdiv        dword ptr ds:[6CF5E4];255:Single
 006CF347    fstp        qword ptr [edi]
 006CF349    wait
>006CF34A    jmp         006CF5DA
 006CF34F    test        esi,esi
>006CF351    jne         006CF373
 006CF353    mov         eax,dword ptr [ebp-4]
 006CF356    xor         edx,edx
 006CF358    mov         dword ptr [eax],edx
 006CF35A    mov         dword ptr [eax+4],edx
 006CF35D    mov         eax,dword ptr [ebp-8]
 006CF360    xor         edx,edx
 006CF362    mov         dword ptr [eax],edx
 006CF364    mov         dword ptr [eax+4],edx
 006CF367    xor         eax,eax
 006CF369    mov         dword ptr [edi],eax
 006CF36B    mov         dword ptr [edi+4],eax
>006CF36E    jmp         006CF5DA
 006CF373    mov         eax,dword ptr [esi+408]
 006CF379    mov         edx,eax
 006CF37B    and         edx,0FF
 006CF381    mov         dword ptr [ebp-1C],edx
 006CF384    xor         edx,edx
 006CF386    mov         dword ptr [ebp-18],edx
 006CF389    fild        qword ptr [ebp-1C]
 006CF38C    fdiv        dword ptr ds:[6CF5E4];255:Single
 006CF392    mov         edx,dword ptr [ebp-4]
 006CF395    fstp        qword ptr [edx]
 006CF397    wait
 006CF398    mov         edx,eax
 006CF39A    shl         edx,8
 006CF39D    and         edx,0FF
 006CF3A3    mov         dword ptr [ebp-1C],edx
 006CF3A6    xor         edx,edx
 006CF3A8    mov         dword ptr [ebp-18],edx
 006CF3AB    fild        qword ptr [ebp-1C]
 006CF3AE    fdiv        dword ptr ds:[6CF5E4];255:Single
 006CF3B4    mov         edx,dword ptr [ebp-8]
 006CF3B7    fstp        qword ptr [edx]
 006CF3B9    wait
 006CF3BA    shl         eax,10
 006CF3BD    and         eax,0FF
 006CF3C2    mov         dword ptr [ebp-1C],eax
 006CF3C5    xor         eax,eax
 006CF3C7    mov         dword ptr [ebp-18],eax
 006CF3CA    fild        qword ptr [ebp-1C]
 006CF3CD    fdiv        dword ptr ds:[6CF5E4];255:Single
 006CF3D3    fstp        qword ptr [edi]
 006CF3D5    wait
>006CF3D6    jmp         006CF5DA
 006CF3DB    test        esi,esi
>006CF3DD    jne         006CF3FF
 006CF3DF    lea         eax,[ebp-10]
 006CF3E2    push        eax
 006CF3E3    call        user32.GetCursorPos
 006CF3E8    fild        dword ptr [ebp-10]
 006CF3EB    mov         eax,dword ptr [ebp-4]
 006CF3EE    fstp        qword ptr [eax]
 006CF3F0    wait
 006CF3F1    fild        dword ptr [ebp-0C]
 006CF3F4    mov         eax,dword ptr [ebp-8]
 006CF3F7    fstp        qword ptr [eax]
 006CF3F9    wait
>006CF3FA    jmp         006CF5DA
 006CF3FF    mov         eax,esi
 006CF401    call        TCursorForm.GetX
 006CF406    mov         dword ptr [ebp-20],eax
 006CF409    fild        dword ptr [ebp-20]
 006CF40C    mov         eax,dword ptr [ebp-4]
 006CF40F    fstp        qword ptr [eax]
 006CF411    wait
 006CF412    mov         eax,esi
 006CF414    call        TCursorForm.GetY
 006CF419    mov         dword ptr [ebp-20],eax
 006CF41C    fild        dword ptr [ebp-20]
 006CF41F    mov         eax,dword ptr [ebp-8]
 006CF422    fstp        qword ptr [eax]
 006CF424    wait
>006CF425    jmp         006CF5DA
 006CF42A    test        esi,esi
>006CF42C    jne         006CF478
 006CF42E    lea         eax,[ebp-10]
 006CF431    push        eax
 006CF432    call        user32.GetCursorPos
 006CF437    mov         eax,[0078DB00];^Screen:TScreen
 006CF43C    mov         eax,dword ptr [eax]
 006CF43E    call        TScreen.GetWidth
 006CF443    dec         eax
 006CF444    mov         dword ptr [ebp-20],eax
 006CF447    fild        dword ptr [ebp-20]
 006CF44A    fild        dword ptr [ebp-10]
 006CF44D    fdivrp      st(1),st
 006CF44F    mov         eax,dword ptr [ebp-4]
 006CF452    fstp        qword ptr [eax]
 006CF454    wait
 006CF455    mov         eax,[0078DB00];^Screen:TScreen
 006CF45A    mov         eax,dword ptr [eax]
 006CF45C    call        TScreen.GetHeight
 006CF461    dec         eax
 006CF462    mov         dword ptr [ebp-20],eax
 006CF465    fild        dword ptr [ebp-20]
 006CF468    fild        dword ptr [ebp-0C]
 006CF46B    fdivrp      st(1),st
 006CF46D    mov         eax,dword ptr [ebp-8]
 006CF470    fstp        qword ptr [eax]
 006CF472    wait
>006CF473    jmp         006CF5DA
 006CF478    mov         eax,esi
 006CF47A    call        TCursorForm.GetX
 006CF47F    mov         dword ptr [ebp-20],eax
 006CF482    fild        dword ptr [ebp-20]
 006CF485    fstp        tbyte ptr [ebp-2C]
 006CF488    wait
 006CF489    mov         eax,[0078DB00];^Screen:TScreen
 006CF48E    mov         eax,dword ptr [eax]
 006CF490    call        TScreen.GetWidth
 006CF495    dec         eax
 006CF496    mov         dword ptr [ebp-30],eax
 006CF499    fild        dword ptr [ebp-30]
 006CF49C    fld         tbyte ptr [ebp-2C]
 006CF49F    fdivrp      st(1),st
 006CF4A1    mov         eax,dword ptr [ebp-4]
 006CF4A4    fstp        qword ptr [eax]
 006CF4A6    wait
 006CF4A7    mov         eax,esi
 006CF4A9    call        TCursorForm.GetY
 006CF4AE    mov         dword ptr [ebp-20],eax
 006CF4B1    fild        dword ptr [ebp-20]
 006CF4B4    fstp        tbyte ptr [ebp-2C]
 006CF4B7    wait
 006CF4B8    mov         eax,[0078DB00];^Screen:TScreen
 006CF4BD    mov         eax,dword ptr [eax]
 006CF4BF    call        TScreen.GetHeight
 006CF4C4    dec         eax
 006CF4C5    mov         dword ptr [ebp-30],eax
 006CF4C8    fild        dword ptr [ebp-30]
 006CF4CB    fld         tbyte ptr [ebp-2C]
 006CF4CE    fdivrp      st(1),st
 006CF4D0    mov         eax,dword ptr [ebp-8]
 006CF4D3    fstp        qword ptr [eax]
 006CF4D5    wait
>006CF4D6    jmp         006CF5DA
 006CF4DB    test        esi,esi
>006CF4DD    jne         006CF55C
 006CF4DF    lea         eax,[ebp-10]
 006CF4E2    push        eax
 006CF4E3    call        user32.GetCursorPos
 006CF4E8    mov         eax,[0078DB00];^Screen:TScreen
 006CF4ED    mov         eax,dword ptr [eax]
 006CF4EF    call        TScreen.GetDesktopLeft
 006CF4F4    mov         edx,dword ptr [ebp-10]
 006CF4F7    sub         edx,eax
 006CF4F9    mov         dword ptr [ebp-20],edx
 006CF4FC    fild        dword ptr [ebp-20]
 006CF4FF    fstp        tbyte ptr [ebp-2C]
 006CF502    wait
 006CF503    mov         eax,[0078DB00];^Screen:TScreen
 006CF508    mov         eax,dword ptr [eax]
 006CF50A    call        TScreen.GetDesktopWidth
 006CF50F    dec         eax
 006CF510    mov         dword ptr [ebp-30],eax
 006CF513    fild        dword ptr [ebp-30]
 006CF516    fld         tbyte ptr [ebp-2C]
 006CF519    fdivrp      st(1),st
 006CF51B    mov         eax,dword ptr [ebp-4]
 006CF51E    fstp        qword ptr [eax]
 006CF520    wait
 006CF521    mov         eax,[0078DB00];^Screen:TScreen
 006CF526    mov         eax,dword ptr [eax]
 006CF528    call        TScreen.GetDesktopTop
 006CF52D    mov         edx,dword ptr [ebp-0C]
 006CF530    sub         edx,eax
 006CF532    mov         dword ptr [ebp-20],edx
 006CF535    fild        dword ptr [ebp-20]
 006CF538    fstp        tbyte ptr [ebp-2C]
 006CF53B    wait
 006CF53C    mov         eax,[0078DB00];^Screen:TScreen
 006CF541    mov         eax,dword ptr [eax]
 006CF543    call        TScreen.GetDesktopHeight
 006CF548    dec         eax
 006CF549    mov         dword ptr [ebp-30],eax
 006CF54C    fild        dword ptr [ebp-30]
 006CF54F    fld         tbyte ptr [ebp-2C]
 006CF552    fdivrp      st(1),st
 006CF554    mov         eax,dword ptr [ebp-8]
 006CF557    fstp        qword ptr [eax]
 006CF559    wait
>006CF55A    jmp         006CF5DA
 006CF55C    mov         eax,esi
 006CF55E    call        TCursorForm.GetX
 006CF563    mov         ebx,eax
 006CF565    mov         eax,[0078DB00];^Screen:TScreen
 006CF56A    mov         eax,dword ptr [eax]
 006CF56C    call        TScreen.GetDesktopLeft
 006CF571    sub         ebx,eax
 006CF573    mov         dword ptr [ebp-20],ebx
 006CF576    fild        dword ptr [ebp-20]
 006CF579    fstp        tbyte ptr [ebp-2C]
 006CF57C    wait
 006CF57D    mov         eax,[0078DB00];^Screen:TScreen
 006CF582    mov         eax,dword ptr [eax]
 006CF584    call        TScreen.GetDesktopWidth
 006CF589    dec         eax
 006CF58A    mov         dword ptr [ebp-30],eax
 006CF58D    fild        dword ptr [ebp-30]
 006CF590    fld         tbyte ptr [ebp-2C]
 006CF593    fdivrp      st(1),st
 006CF595    mov         eax,dword ptr [ebp-4]
 006CF598    fstp        qword ptr [eax]
 006CF59A    wait
 006CF59B    mov         eax,esi
 006CF59D    call        TCursorForm.GetY
 006CF5A2    mov         ebx,eax
 006CF5A4    mov         eax,[0078DB00];^Screen:TScreen
 006CF5A9    mov         eax,dword ptr [eax]
 006CF5AB    call        TScreen.GetDesktopTop
 006CF5B0    sub         ebx,eax
 006CF5B2    mov         dword ptr [ebp-20],ebx
 006CF5B5    fild        dword ptr [ebp-20]
 006CF5B8    fstp        tbyte ptr [ebp-2C]
 006CF5BB    wait
 006CF5BC    mov         eax,[0078DB00];^Screen:TScreen
 006CF5C1    mov         eax,dword ptr [eax]
 006CF5C3    call        TScreen.GetDesktopHeight
 006CF5C8    dec         eax
 006CF5C9    mov         dword ptr [ebp-30],eax
 006CF5CC    fild        dword ptr [ebp-30]
 006CF5CF    fld         tbyte ptr [ebp-2C]
 006CF5D2    fdivrp      st(1),st
 006CF5D4    mov         eax,dword ptr [ebp-8]
 006CF5D7    fstp        qword ptr [eax]
 006CF5D9    wait
 006CF5DA    pop         edi
 006CF5DB    pop         esi
 006CF5DC    pop         ebx
 006CF5DD    mov         esp,ebp
 006CF5DF    pop         ebp
 006CF5E0    ret         4
*}
end;

//006CF5E8
function TCursorValue.Module:TObject;
begin
{*
 006CF5E8    mov         eax,[0081F6D8];gvar_0081F6D8:TModuleCursor
 006CF5ED    ret
*}
end;

//006CF5F0
function TCursorValue.SetString(NewValue:string):Boolean;
begin
{*
 006CF5F0    push        ebp
 006CF5F1    mov         ebp,esp
 006CF5F3    add         esp,0FFFFFFF4
 006CF5F6    push        ebx
 006CF5F7    push        esi
 006CF5F8    push        edi
 006CF5F9    mov         dword ptr [ebp-4],edx
 006CF5FC    mov         esi,eax
 006CF5FE    mov         eax,dword ptr [ebp-4]
 006CF601    call        @UStrAddRef
 006CF606    xor         eax,eax
 006CF608    push        ebp
 006CF609    push        6CF6A2
 006CF60E    push        dword ptr fs:[eax]
 006CF611    mov         dword ptr fs:[eax],esp
 006CF614    mov         eax,[0081F6DC];gvar_0081F6DC:TObjectList
 006CF619    mov         eax,dword ptr [eax+8]
 006CF61C    mov         edi,dword ptr [esi+18];TCursorValue........................................................
 006CF61F    cmp         eax,edi
>006CF621    jg          006CF627
 006CF623    xor         ebx,ebx
>006CF625    jmp         006CF68C
 006CF627    mov         bl,1
 006CF629    mov         eax,dword ptr [esi+20];TCursorValue.....................................Item:Integer
 006CF62C    sub         eax,24
>006CF62F    je          006CF638
 006CF631    sub         eax,2
>006CF634    je          006CF65C
>006CF636    jmp         006CF680
 006CF638    test        edi,edi
>006CF63A    jge         006CF640
 006CF63C    xor         ebx,ebx
>006CF63E    jmp         006CF68C
 006CF640    mov         eax,[0081F6DC];gvar_0081F6DC:TObjectList
 006CF645    mov         dword ptr [ebp-8],eax
 006CF648    mov         edx,edi
 006CF64A    mov         eax,dword ptr [ebp-8]
 006CF64D    call        TList.Get
 006CF652    mov         edx,dword ptr [ebp-4]
 006CF655    call        005E8620
>006CF65A    jmp         006CF68C
 006CF65C    test        edi,edi
>006CF65E    jge         006CF664
 006CF660    xor         ebx,ebx
>006CF662    jmp         006CF68C
 006CF664    mov         eax,[0081F6DC];gvar_0081F6DC:TObjectList
 006CF669    mov         dword ptr [ebp-0C],eax
 006CF66C    mov         edx,edi
 006CF66E    mov         eax,dword ptr [ebp-0C]
 006CF671    call        TList.Get
 006CF676    mov         edx,dword ptr [ebp-4]
 006CF679    call        005E86B0
>006CF67E    jmp         006CF68C
 006CF680    mov         edx,dword ptr [ebp-4]
 006CF683    mov         eax,esi
 006CF685    call        TExpression.SetString
 006CF68A    mov         ebx,eax
 006CF68C    xor         eax,eax
 006CF68E    pop         edx
 006CF68F    pop         ecx
 006CF690    pop         ecx
 006CF691    mov         dword ptr fs:[eax],edx
 006CF694    push        6CF6A9
 006CF699    lea         eax,[ebp-4]
 006CF69C    call        @UStrClr
 006CF6A1    ret
>006CF6A2    jmp         @HandleFinally
>006CF6A7    jmp         006CF699
 006CF6A9    mov         eax,ebx
 006CF6AB    pop         edi
 006CF6AC    pop         esi
 006CF6AD    pop         ebx
 006CF6AE    mov         esp,ebp
 006CF6B0    pop         ebp
 006CF6B1    ret
*}
end;

//006CF6B4
{*function TCursorValue.SetValue(NewValue:Double; ?:?):Boolean;
begin
 006CF6B4    push        ebp
 006CF6B5    mov         ebp,esp
 006CF6B7    add         esp,0FFFFFF44
 006CF6BD    push        ebx
 006CF6BE    push        esi
 006CF6BF    push        edi
 006CF6C0    mov         esi,eax
 006CF6C2    mov         eax,esi
 006CF6C4    mov         edx,dword ptr [eax]
 006CF6C6    call        dword ptr [edx+44];TCursorValue.GetDataType
 006CF6C9    cmp         al,5
>006CF6CB    jne         006CF6EA
 006CF6CD    push        dword ptr [ebp+0C]
 006CF6D0    push        dword ptr [ebp+8]
 006CF6D3    push        0
 006CF6D5    push        0
 006CF6D7    push        0
 006CF6D9    push        0
 006CF6DB    mov         eax,esi
 006CF6DD    mov         edx,dword ptr [eax]
 006CF6DF    call        dword ptr [edx+60];TCursorValue.SetVector
 006CF6E2    mov         byte ptr [ebp-1],al
>006CF6E5    jmp         006D037F
 006CF6EA    mov         eax,dword ptr [esi+20];TCursorValue......................................Item:Integer
 006CF6ED    cmp         eax,0F
>006CF6F0    je          006CF732
 006CF6F2    cmp         eax,10
>006CF6F5    je          006CF732
 006CF6F7    cmp         eax,11
>006CF6FA    je          006CF732
 006CF6FC    cmp         eax,12
>006CF6FF    je          006CF732
 006CF701    cmp         eax,0D
>006CF704    je          006CF732
 006CF706    cmp         eax,0E
>006CF709    je          006CF732
 006CF70B    cmp         eax,23
>006CF70E    je          006CF732
 006CF710    cmp         eax,13
>006CF713    je          006CF732
 006CF715    cmp         eax,14
>006CF718    je          006CF732
 006CF71A    cmp         eax,19
>006CF71D    je          006CF732
 006CF71F    cmp         eax,1A
>006CF722    je          006CF732
 006CF724    cmp         eax,1D
>006CF727    je          006CF732
 006CF729    cmp         eax,1C
>006CF72C    jne         006CFE05
 006CF732    cmp         byte ptr [esi+10],0;TCursorValue.Iffy:Boolean
>006CF736    jne         006CF74D
 006CF738    fld         qword ptr [ebp+8]
 006CF73B    fcomp       qword ptr [esi+8];TCursorValue.PreviousValue:Double
 006CF73E    wait
 006CF73F    fnstsw      al
 006CF741    sahf
>006CF742    jne         006CF74D
 006CF744    mov         byte ptr [ebp-1],1
>006CF748    jmp         006D037F
 006CF74D    lea         eax,[ebp-0C]
 006CF750    push        eax
 006CF751    call        user32.GetCursorPos
 006CF756    xor         eax,eax
 006CF758    mov         dword ptr [ebp-0A8],eax
 006CF75E    xor         eax,eax
 006CF760    mov         dword ptr [ebp-0A4],eax
 006CF766    xor         eax,eax
 006CF768    mov         dword ptr [ebp-0A0],eax
 006CF76E    xor         eax,eax
 006CF770    mov         dword ptr [ebp-9C],eax
 006CF776    xor         eax,eax
 006CF778    mov         dword ptr [ebp-98],eax
 006CF77E    mov         eax,dword ptr [esi+20];TCursorValue.......................................Item:Integer
 006CF781    add         eax,0FFFFFFF3
 006CF784    cmp         eax,16
>006CF787    ja          006CFDB3
 006CF78D    jmp         dword ptr [eax*4+6CF794]
 006CF78D    dd          006CFBB1
 006CF78D    dd          006CFC04
 006CF78D    dd          006CF7F0
 006CF78D    dd          006CF889
 006CF78D    dd          006CF922
 006CF78D    dd          006CFA09
 006CF78D    dd          006CFAF0
 006CF78D    dd          006CFB1E
 006CF78D    dd          006CFDB3
 006CF78D    dd          006CFDB3
 006CF78D    dd          006CFDB3
 006CF78D    dd          006CFDB3
 006CF78D    dd          006CFB4C
 006CF78D    dd          006CFB7D
 006CF78D    dd          006CFDB3
 006CF78D    dd          006CFC81
 006CF78D    dd          006CFCE6
 006CF78D    dd          006CFDB3
 006CF78D    dd          006CFDB3
 006CF78D    dd          006CFDB3
 006CF78D    dd          006CFDB3
 006CF78D    dd          006CFDB3
 006CF78D    dd          006CFC57
 006CF7F0    mov         edi,dword ptr [esi+18];TCursorValue........................................................
 006CF7F3    test        edi,edi
>006CF7F5    jge         006CF849
 006CF7F7    mov         dword ptr [ebp-98],8001
 006CF801    fld         qword ptr [ebp+8]
 006CF804    fmul        dword ptr ds:[6D038C];65535:Single
 006CF80A    call        @ROUND
 006CF80F    mov         dword ptr [ebp-0A4],eax
 006CF815    mov         eax,[0078DB00];^Screen:TScreen
 006CF81A    mov         eax,dword ptr [eax]
 006CF81C    call        TScreen.GetHeight
 006CF821    dec         eax
 006CF822    mov         dword ptr [ebp-0AC],eax
 006CF828    fild        dword ptr [ebp-0AC]
 006CF82E    fild        dword ptr [ebp-8]
 006CF831    fdivrp      st(1),st
 006CF833    fmul        dword ptr ds:[6D038C];65535:Single
 006CF839    call        @ROUND
 006CF83E    mov         dword ptr [ebp-0A0],eax
>006CF844    jmp         006CFDBB
 006CF849    mov         ebx,dword ptr ds:[81F6DC];gvar_0081F6DC:TObjectList
 006CF84F    mov         edx,edi
 006CF851    mov         eax,ebx
 006CF853    call        TList.Get
 006CF858    mov         ebx,eax
 006CF85A    mov         eax,[0078DB00];^Screen:TScreen
 006CF85F    mov         eax,dword ptr [eax]
 006CF861    call        TScreen.GetWidth
 006CF866    dec         eax
 006CF867    mov         dword ptr [ebp-0AC],eax
 006CF86D    fild        dword ptr [ebp-0AC]
 006CF873    fmul        qword ptr [ebp+8]
 006CF876    call        @ROUND
 006CF87B    mov         edx,eax
 006CF87D    mov         eax,ebx
 006CF87F    call        TCursorForm.SetX
>006CF884    jmp         006CFDBB
 006CF889    mov         edi,dword ptr [esi+18];TCursorValue........................................................
 006CF88C    test        edi,edi
>006CF88E    jge         006CF8E2
 006CF890    mov         dword ptr [ebp-98],8001
 006CF89A    mov         eax,[0078DB00];^Screen:TScreen
 006CF89F    mov         eax,dword ptr [eax]
 006CF8A1    call        TScreen.GetWidth
 006CF8A6    dec         eax
 006CF8A7    mov         dword ptr [ebp-0AC],eax
 006CF8AD    fild        dword ptr [ebp-0AC]
 006CF8B3    fild        dword ptr [ebp-0C]
 006CF8B6    fdivrp      st(1),st
 006CF8B8    fmul        dword ptr ds:[6D038C];65535:Single
 006CF8BE    call        @ROUND
 006CF8C3    mov         dword ptr [ebp-0A4],eax
 006CF8C9    fld         qword ptr [ebp+8]
 006CF8CC    fmul        dword ptr ds:[6D038C];65535:Single
 006CF8D2    call        @ROUND
 006CF8D7    mov         dword ptr [ebp-0A0],eax
>006CF8DD    jmp         006CFDBB
 006CF8E2    mov         ebx,dword ptr ds:[81F6DC];gvar_0081F6DC:TObjectList
 006CF8E8    mov         edx,edi
 006CF8EA    mov         eax,ebx
 006CF8EC    call        TList.Get
 006CF8F1    mov         ebx,eax
 006CF8F3    mov         eax,[0078DB00];^Screen:TScreen
 006CF8F8    mov         eax,dword ptr [eax]
 006CF8FA    call        TScreen.GetHeight
 006CF8FF    dec         eax
 006CF900    mov         dword ptr [ebp-0AC],eax
 006CF906    fild        dword ptr [ebp-0AC]
 006CF90C    fmul        qword ptr [ebp+8]
 006CF90F    call        @ROUND
 006CF914    mov         edx,eax
 006CF916    mov         eax,ebx
 006CF918    call        TCursorForm.SetY
>006CF91D    jmp         006CFDBB
 006CF922    mov         edi,dword ptr [esi+18];TCursorValue........................................................
 006CF925    test        edi,edi
>006CF927    jge         006CF9A2
 006CF929    mov         dword ptr [ebp-98],0C001
 006CF933    fld         qword ptr [ebp+8]
 006CF936    fmul        dword ptr ds:[6D038C];65535:Single
 006CF93C    call        @ROUND
 006CF941    mov         dword ptr [ebp-0A4],eax
 006CF947    mov         eax,[0078DB00];^Screen:TScreen
 006CF94C    mov         eax,dword ptr [eax]
 006CF94E    call        TScreen.GetDesktopTop
 006CF953    mov         edx,dword ptr [ebp-8]
 006CF956    sub         edx,eax
 006CF958    mov         dword ptr [ebp-0AC],edx
 006CF95E    fild        dword ptr [ebp-0AC]
 006CF964    fstp        tbyte ptr [ebp-0B8]
 006CF96A    wait
 006CF96B    mov         eax,[0078DB00];^Screen:TScreen
 006CF970    mov         eax,dword ptr [eax]
 006CF972    call        TScreen.GetDesktopHeight
 006CF977    dec         eax
 006CF978    mov         dword ptr [ebp-0BC],eax
 006CF97E    fild        dword ptr [ebp-0BC]
 006CF984    fld         tbyte ptr [ebp-0B8]
 006CF98A    fdivrp      st(1),st
 006CF98C    fmul        dword ptr ds:[6D038C];65535:Single
 006CF992    call        @ROUND
 006CF997    mov         dword ptr [ebp-0A0],eax
>006CF99D    jmp         006CFDBB
 006CF9A2    mov         ebx,dword ptr ds:[81F6DC];gvar_0081F6DC:TObjectList
 006CF9A8    mov         edx,edi
 006CF9AA    mov         eax,ebx
 006CF9AC    call        TList.Get
 006CF9B1    mov         ebx,eax
 006CF9B3    mov         eax,[0078DB00];^Screen:TScreen
 006CF9B8    mov         eax,dword ptr [eax]
 006CF9BA    call        TScreen.GetDesktopLeft
 006CF9BF    mov         dword ptr [ebp-0AC],eax
 006CF9C5    fild        dword ptr [ebp-0AC]
 006CF9CB    fstp        tbyte ptr [ebp-0B8]
 006CF9D1    wait
 006CF9D2    mov         eax,[0078DB00];^Screen:TScreen
 006CF9D7    mov         eax,dword ptr [eax]
 006CF9D9    call        TScreen.GetDesktopWidth
 006CF9DE    dec         eax
 006CF9DF    mov         dword ptr [ebp-0BC],eax
 006CF9E5    fild        dword ptr [ebp-0BC]
 006CF9EB    fmul        qword ptr [ebp+8]
 006CF9EE    fld         tbyte ptr [ebp-0B8]
 006CF9F4    faddp       st(1),st
 006CF9F6    call        @ROUND
 006CF9FB    mov         edx,eax
 006CF9FD    mov         eax,ebx
 006CF9FF    call        TCursorForm.SetX
>006CFA04    jmp         006CFDBB
 006CFA09    mov         edi,dword ptr [esi+18];TCursorValue........................................................
 006CFA0C    test        edi,edi
>006CFA0E    jge         006CFA89
 006CFA10    mov         dword ptr [ebp-98],0C001
 006CFA1A    mov         eax,[0078DB00];^Screen:TScreen
 006CFA1F    mov         eax,dword ptr [eax]
 006CFA21    call        TScreen.GetDesktopLeft
 006CFA26    mov         edx,dword ptr [ebp-0C]
 006CFA29    sub         edx,eax
 006CFA2B    mov         dword ptr [ebp-0AC],edx
 006CFA31    fild        dword ptr [ebp-0AC]
 006CFA37    fstp        tbyte ptr [ebp-0B8]
 006CFA3D    wait
 006CFA3E    mov         eax,[0078DB00];^Screen:TScreen
 006CFA43    mov         eax,dword ptr [eax]
 006CFA45    call        TScreen.GetDesktopWidth
 006CFA4A    dec         eax
 006CFA4B    mov         dword ptr [ebp-0BC],eax
 006CFA51    fild        dword ptr [ebp-0BC]
 006CFA57    fld         tbyte ptr [ebp-0B8]
 006CFA5D    fdivrp      st(1),st
 006CFA5F    fmul        dword ptr ds:[6D038C];65535:Single
 006CFA65    call        @ROUND
 006CFA6A    mov         dword ptr [ebp-0A4],eax
 006CFA70    fld         qword ptr [ebp+8]
 006CFA73    fmul        dword ptr ds:[6D038C];65535:Single
 006CFA79    call        @ROUND
 006CFA7E    mov         dword ptr [ebp-0A0],eax
>006CFA84    jmp         006CFDBB
 006CFA89    mov         ebx,dword ptr ds:[81F6DC];gvar_0081F6DC:TObjectList
 006CFA8F    mov         edx,edi
 006CFA91    mov         eax,ebx
 006CFA93    call        TList.Get
 006CFA98    mov         ebx,eax
 006CFA9A    mov         eax,[0078DB00];^Screen:TScreen
 006CFA9F    mov         eax,dword ptr [eax]
 006CFAA1    call        TScreen.GetDesktopTop
 006CFAA6    mov         dword ptr [ebp-0AC],eax
 006CFAAC    fild        dword ptr [ebp-0AC]
 006CFAB2    fstp        tbyte ptr [ebp-0B8]
 006CFAB8    wait
 006CFAB9    mov         eax,[0078DB00];^Screen:TScreen
 006CFABE    mov         eax,dword ptr [eax]
 006CFAC0    call        TScreen.GetDesktopHeight
 006CFAC5    dec         eax
 006CFAC6    mov         dword ptr [ebp-0BC],eax
 006CFACC    fild        dword ptr [ebp-0BC]
 006CFAD2    fmul        qword ptr [ebp+8]
 006CFAD5    fld         tbyte ptr [ebp-0B8]
 006CFADB    faddp       st(1),st
 006CFADD    call        @ROUND
 006CFAE2    mov         edx,eax
 006CFAE4    mov         eax,ebx
 006CFAE6    call        TCursorForm.SetY
>006CFAEB    jmp         006CFDBB
 006CFAF0    cmp         dword ptr [esi+18],0;TCursorValue..........................................................
>006CFAF4    jge         006CFDBB
 006CFAFA    mov         dword ptr [ebp-98],1
 006CFB04    fld         qword ptr [ebp+8]
 006CFB07    mov         eax,[0078DB04];^gvar_0078BC58:Double
 006CFB0C    fsub        qword ptr [eax]
 006CFB0E    call        @ROUND
 006CFB13    mov         dword ptr [ebp-0A4],eax
>006CFB19    jmp         006CFDBB
 006CFB1E    cmp         dword ptr [esi+18],0;TCursorValue..........................................................
>006CFB22    jge         006CFDBB
 006CFB28    mov         dword ptr [ebp-98],1
 006CFB32    fld         qword ptr [ebp+8]
 006CFB35    mov         eax,[0078D9E4];^gvar_0078BC60:Double
 006CFB3A    fsub        qword ptr [eax]
 006CFB3C    call        @ROUND
 006CFB41    mov         dword ptr [ebp-0A0],eax
>006CFB47    jmp         006CFDBB
 006CFB4C    cmp         dword ptr [esi+18],0;TCursorValue..........................................................
>006CFB50    jge         006CFDBB
 006CFB56    mov         dword ptr [ebp-98],800
 006CFB60    fld         qword ptr [ebp+8]
 006CFB63    mov         eax,[0078D754];^gvar_0078BC68:Double
 006CFB68    fsub        qword ptr [eax]
 006CFB6A    call        @ROUND
 006CFB6F    movzx       eax,ax
 006CFB72    mov         dword ptr [ebp-9C],eax
>006CFB78    jmp         006CFDBB
 006CFB7D    cmp         dword ptr [esi+18],0;TCursorValue..........................................................
>006CFB81    jge         006CFDBB
 006CFB87    mov         dword ptr [ebp-98],800
 006CFB91    fld         qword ptr [ebp+8]
 006CFB94    mov         eax,[0078CB70];^gvar_0078BC70:Double
 006CFB99    fsub        qword ptr [eax]
 006CFB9B    call        @ROUND
 006CFBA0    movzx       eax,ax
 006CFBA3    shl         eax,10
 006CFBA6    mov         dword ptr [ebp-9C],eax
>006CFBAC    jmp         006CFDBB
 006CFBB1    mov         edi,dword ptr [esi+18];TCursorValue........................................................
 006CFBB4    test        edi,edi
>006CFBB6    jge         006CFBDD
 006CFBB8    lea         eax,[ebp-0C]
 006CFBBB    push        eax
 006CFBBC    call        user32.GetCursorPos
 006CFBC1    fld         qword ptr [ebp+8]
 006CFBC4    call        @ROUND
 006CFBC9    mov         ebx,eax
 006CFBCB    mov         dword ptr [ebp-0C],ebx
 006CFBCE    mov         eax,dword ptr [ebp-8]
 006CFBD1    push        eax
 006CFBD2    push        ebx
 006CFBD3    call        user32.SetCursorPos
>006CFBD8    jmp         006CFDBB
 006CFBDD    mov         ebx,dword ptr ds:[81F6DC];gvar_0081F6DC:TObjectList
 006CFBE3    mov         edx,edi
 006CFBE5    mov         eax,ebx
 006CFBE7    call        TList.Get
 006CFBEC    mov         ebx,eax
 006CFBEE    fld         qword ptr [ebp+8]
 006CFBF1    call        @ROUND
 006CFBF6    mov         edx,eax
 006CFBF8    mov         eax,ebx
 006CFBFA    call        TCursorForm.SetX
>006CFBFF    jmp         006CFDBB
 006CFC04    mov         edi,dword ptr [esi+18];TCursorValue........................................................
 006CFC07    test        edi,edi
>006CFC09    jge         006CFC30
 006CFC0B    lea         eax,[ebp-0C]
 006CFC0E    push        eax
 006CFC0F    call        user32.GetCursorPos
 006CFC14    fld         qword ptr [ebp+8]
 006CFC17    call        @ROUND
 006CFC1C    mov         ebx,eax
 006CFC1E    mov         dword ptr [ebp-8],ebx
 006CFC21    push        ebx
 006CFC22    mov         eax,dword ptr [ebp-0C]
 006CFC25    push        eax
 006CFC26    call        user32.SetCursorPos
>006CFC2B    jmp         006CFDBB
 006CFC30    mov         ebx,dword ptr ds:[81F6DC];gvar_0081F6DC:TObjectList
 006CFC36    mov         edx,edi
 006CFC38    mov         eax,ebx
 006CFC3A    call        TList.Get
 006CFC3F    mov         ebx,eax
 006CFC41    fld         qword ptr [ebp+8]
 006CFC44    call        @ROUND
 006CFC49    mov         edx,eax
 006CFC4B    mov         eax,ebx
 006CFC4D    call        TCursorForm.SetY
>006CFC52    jmp         006CFDBB
 006CFC57    mov         edi,dword ptr [esi+18];TCursorValue........................................................
 006CFC5A    test        edi,edi
>006CFC5C    jl          006CFDBB
 006CFC62    mov         ebx,dword ptr ds:[81F6DC];gvar_0081F6DC:TObjectList
 006CFC68    mov         edx,edi
 006CFC6A    mov         eax,ebx
 006CFC6C    call        TList.Get
 006CFC71    push        dword ptr [ebp+0C]
 006CFC74    push        dword ptr [ebp+8]
 006CFC77    call        TCursorForm.ChangeAngle
>006CFC7C    jmp         006CFDBB
 006CFC81    cmp         dword ptr [esi+18],0;TCursorValue..........................................................
>006CFC85    jge         006CFCAA
 006CFC87    fld         qword ptr [ebp+8]
 006CFC8A    call        @ROUND
 006CFC8F    call        005EB594
 006CFC94    mov         ebx,eax
 006CFC96    test        ebx,ebx
>006CFC98    je          006CFDBB
 006CFC9E    mov         eax,ebx
 006CFCA0    call        005EE140
>006CFCA5    jmp         006CFDBB
 006CFCAA    fld         qword ptr [ebp+8]
 006CFCAD    call        @ROUND
 006CFCB2    call        005EB594
 006CFCB7    mov         ebx,eax
 006CFCB9    test        ebx,ebx
>006CFCBB    je          006CFDBB
 006CFCC1    mov         eax,[0081F6DC];gvar_0081F6DC:TObjectList
 006CFCC6    mov         dword ptr [ebp-10],eax
 006CFCC9    mov         edx,dword ptr [esi+18];TCursorValue........................................................
 006CFCCC    mov         eax,dword ptr [ebp-10]
 006CFCCF    call        TList.Get
 006CFCD4    mov         dword ptr [ebp-14],eax
 006CFCD7    mov         edx,ebx
 006CFCD9    mov         eax,dword ptr [ebp-14]
 006CFCDC    call        TCursorForm.ChangeCursor2
>006CFCE1    jmp         006CFDBB
 006CFCE6    mov         eax,dword ptr [esi+18];TCursorValue........................................................
 006CFCE9    test        eax,eax
>006CFCEB    jge         006CFD0D
 006CFCED    fld         qword ptr [ebp+8]
 006CFCF0    call        @ROUND
 006CFCF5    call        005EB4B4
 006CFCFA    mov         edx,eax
 006CFCFC    mov         eax,[0078DB00];^Screen:TScreen
 006CFD01    mov         eax,dword ptr [eax]
 006CFD03    call        TScreen.SetCursor
>006CFD08    jmp         006CFDBB
 006CFD0D    mov         edx,dword ptr ds:[81F6DC];gvar_0081F6DC:TObjectList
 006CFD13    cmp         eax,dword ptr [edx+8]
>006CFD16    jg          006CFDBB
 006CFD1C    fld         qword ptr [ebp+8]
 006CFD1F    call        @ROUND
 006CFD24    call        005EB594
 006CFD29    mov         ebx,eax
 006CFD2B    test        ebx,ebx
>006CFD2D    je          006CFD91
 006CFD2F    mov         eax,[0081F6DC];gvar_0081F6DC:TObjectList
 006CFD34    mov         dword ptr [ebp-18],eax
 006CFD37    mov         edx,dword ptr [esi+18];TCursorValue........................................................
 006CFD3A    mov         eax,dword ptr [ebp-18]
 006CFD3D    call        TList.Get
 006CFD42    mov         dword ptr [ebp-1C],eax
 006CFD45    mov         eax,dword ptr [ebp-1C]
 006CFD48    mov         byte ptr [eax+3C3],0
 006CFD4F    mov         eax,[0081F6DC];gvar_0081F6DC:TObjectList
 006CFD54    mov         dword ptr [ebp-20],eax
 006CFD57    mov         edx,dword ptr [esi+18];TCursorValue........................................................
 006CFD5A    mov         eax,dword ptr [ebp-20]
 006CFD5D    call        TList.Get
 006CFD62    mov         dword ptr [ebp-24],eax
 006CFD65    mov         edx,ebx
 006CFD67    mov         eax,dword ptr [ebp-24]
 006CFD6A    call        TCursorForm.ChangeCursor2
 006CFD6F    mov         eax,[0081F6DC];gvar_0081F6DC:TObjectList
 006CFD74    mov         dword ptr [ebp-28],eax
 006CFD77    mov         edx,dword ptr [esi+18];TCursorValue........................................................
 006CFD7A    mov         eax,dword ptr [ebp-28]
 006CFD7D    call        TList.Get
 006CFD82    mov         dword ptr [ebp-2C],eax
 006CFD85    mov         eax,dword ptr [ebp-2C]
 006CFD88    mov         byte ptr [eax+3C3],1
>006CFD8F    jmp         006CFDBB
 006CFD91    mov         eax,[0081F6DC];gvar_0081F6DC:TObjectList
 006CFD96    mov         dword ptr [ebp-30],eax
 006CFD99    mov         edx,dword ptr [esi+18];TCursorValue........................................................
 006CFD9C    mov         eax,dword ptr [ebp-30]
 006CFD9F    call        TList.Get
 006CFDA4    mov         dword ptr [ebp-34],eax
 006CFDA7    mov         eax,dword ptr [ebp-34]
 006CFDAA    mov         byte ptr [eax+3C3],0
>006CFDB1    jmp         006CFDBB
 006CFDB3    xor         eax,eax
 006CFDB5    mov         dword ptr [ebp-98],eax
 006CFDBB    xor         eax,eax
 006CFDBD    mov         dword ptr [ebp-94],eax
 006CFDC3    xor         eax,eax
 006CFDC5    mov         dword ptr [ebp-90],eax
 006CFDCB    cmp         dword ptr [ebp-98],0
>006CFDD2    je          006CFDEA
 006CFDD4    push        1C
 006CFDD6    lea         eax,[ebp-0A8]
 006CFDDC    push        eax
 006CFDDD    push        1
 006CFDDF    mov         eax,[0078D96C];^gvar_00816E98:Pointer
 006CFDE4    mov         eax,dword ptr [eax]
 006CFDE6    call        eax
>006CFDE8    jmp         006CFDEF
 006CFDEA    mov         eax,1
 006CFDEF    dec         eax
 006CFDF0    sete        byte ptr [ebp-1]
 006CFDF4    mov         eax,dword ptr [ebp+8]
 006CFDF7    mov         dword ptr [esi+8],eax;TCursorValue.PreviousValue:Double
 006CFDFA    mov         eax,dword ptr [ebp+0C]
 006CFDFD    mov         dword ptr [esi+0C],eax;TCursorValue.?fC:dword
>006CFE00    jmp         006D037F
 006CFE05    push        dword ptr [ebp+0C]
 006CFE08    push        dword ptr [ebp+8]
 006CFE0B    call        00686060
 006CFE10    mov         ebx,eax
 006CFE12    cmp         byte ptr [esi+10],0;TCursorValue.Iffy:Boolean
>006CFE16    jne         006CFE31
 006CFE18    push        dword ptr [esi+0C];TCursorValue.?fC:dword
 006CFE1B    push        dword ptr [esi+8];TCursorValue.PreviousValue:Double
 006CFE1E    call        00686060
 006CFE23    cmp         bl,al
>006CFE25    jne         006CFE31
 006CFE27    cmp         dword ptr [esi+20],1;TCursorValue........................................Item:Integer
>006CFE2B    jne         006D0370
 006CFE31    xor         eax,eax
 006CFE33    mov         dword ptr [ebp-0A8],eax
 006CFE39    xor         eax,eax
 006CFE3B    mov         dword ptr [ebp-0A4],eax
 006CFE41    xor         eax,eax
 006CFE43    mov         dword ptr [ebp-0A0],eax
 006CFE49    xor         eax,eax
 006CFE4B    mov         dword ptr [ebp-9C],eax
 006CFE51    xor         eax,eax
 006CFE53    mov         dword ptr [ebp-98],eax
 006CFE59    mov         eax,dword ptr [esi+20];TCursorValue.........................................Item:Integer
 006CFE5C    cmp         eax,18
>006CFE5F    ja          006D0324
 006CFE65    jmp         dword ptr [eax*4+6CFE6C]
 006CFE65    dd          006D0324
 006CFE65    dd          006D02E7
 006CFE65    dd          006CFED0
 006CFE65    dd          006CFF1D
 006CFE65    dd          006CFF6A
 006CFE65    dd          006CFFB7
 006CFE65    dd          006D000B
 006CFE65    dd          006D005F
 006CFE65    dd          006D00B3
 006CFE65    dd          006D0107
 006CFE65    dd          006D0324
 006CFE65    dd          006D015B
 006CFE65    dd          006D01D3
 006CFE65    dd          006D0324
 006CFE65    dd          006D0324
 006CFE65    dd          006D0324
 006CFE65    dd          006D0324
 006CFE65    dd          006D0324
 006CFE65    dd          006D0324
 006CFE65    dd          006D0324
 006CFE65    dd          006D0324
 006CFE65    dd          006D0251
 006CFE65    dd          006D027C
 006CFE65    dd          006D02A7
 006CFE65    dd          006D02C7
 006CFED0    cmp         dword ptr [esi+18],0;TCursorValue..........................................................
>006CFED4    jge         006CFEF8
 006CFED6    test        bl,bl
>006CFED8    je          006CFEE9
 006CFEDA    mov         dword ptr [ebp-98],2
>006CFEE4    jmp         006D032C
 006CFEE9    mov         dword ptr [ebp-98],4
>006CFEF3    jmp         006D032C
 006CFEF8    mov         eax,[0081F6DC];gvar_0081F6DC:TObjectList
 006CFEFD    mov         dword ptr [ebp-38],eax
 006CFF00    mov         edx,dword ptr [esi+18];TCursorValue........................................................
 006CFF03    mov         eax,dword ptr [ebp-38]
 006CFF06    call        TList.Get
 006CFF0B    mov         dword ptr [ebp-3C],eax
 006CFF0E    mov         edx,ebx
 006CFF10    mov         eax,dword ptr [ebp-3C]
 006CFF13    call        TCursorForm.SetLeftButton
>006CFF18    jmp         006D032C
 006CFF1D    cmp         dword ptr [esi+18],0;TCursorValue..........................................................
>006CFF21    jge         006CFF45
 006CFF23    test        bl,bl
>006CFF25    je          006CFF36
 006CFF27    mov         dword ptr [ebp-98],8
>006CFF31    jmp         006D032C
 006CFF36    mov         dword ptr [ebp-98],10
>006CFF40    jmp         006D032C
 006CFF45    mov         eax,[0081F6DC];gvar_0081F6DC:TObjectList
 006CFF4A    mov         dword ptr [ebp-40],eax
 006CFF4D    mov         edx,dword ptr [esi+18];TCursorValue........................................................
 006CFF50    mov         eax,dword ptr [ebp-40]
 006CFF53    call        TList.Get
 006CFF58    mov         dword ptr [ebp-44],eax
 006CFF5B    mov         edx,ebx
 006CFF5D    mov         eax,dword ptr [ebp-44]
 006CFF60    call        TCursorForm.SetRightButton
>006CFF65    jmp         006D032C
 006CFF6A    cmp         dword ptr [esi+18],0;TCursorValue..........................................................
>006CFF6E    jge         006CFF92
 006CFF70    test        bl,bl
>006CFF72    je          006CFF83
 006CFF74    mov         dword ptr [ebp-98],20
>006CFF7E    jmp         006D032C
 006CFF83    mov         dword ptr [ebp-98],40
>006CFF8D    jmp         006D032C
 006CFF92    mov         eax,[0081F6DC];gvar_0081F6DC:TObjectList
 006CFF97    mov         dword ptr [ebp-48],eax
 006CFF9A    mov         edx,dword ptr [esi+18];TCursorValue........................................................
 006CFF9D    mov         eax,dword ptr [ebp-48]
 006CFFA0    call        TList.Get
 006CFFA5    mov         dword ptr [ebp-4C],eax
 006CFFA8    mov         edx,ebx
 006CFFAA    mov         eax,dword ptr [ebp-4C]
 006CFFAD    call        TCursorForm.SetMiddleButton
>006CFFB2    jmp         006D032C
 006CFFB7    cmp         dword ptr [esi+18],0;TCursorValue..........................................................
>006CFFBB    jge         006CFFE6
 006CFFBD    test        bl,bl
>006CFFBF    je          006CFFCD
 006CFFC1    mov         dword ptr [ebp-98],80
>006CFFCB    jmp         006CFFD7
 006CFFCD    mov         dword ptr [ebp-98],100
 006CFFD7    mov         dword ptr [ebp-9C],1
>006CFFE1    jmp         006D032C
 006CFFE6    mov         eax,[0081F6DC];gvar_0081F6DC:TObjectList
 006CFFEB    mov         dword ptr [ebp-50],eax
 006CFFEE    mov         edx,dword ptr [esi+18];TCursorValue........................................................
 006CFFF1    mov         eax,dword ptr [ebp-50]
 006CFFF4    call        TList.Get
 006CFFF9    mov         dword ptr [ebp-54],eax
 006CFFFC    mov         edx,ebx
 006CFFFE    mov         eax,dword ptr [ebp-54]
 006D0001    call        005E8BD4
>006D0006    jmp         006D032C
 006D000B    cmp         dword ptr [esi+18],0;TCursorValue..........................................................
>006D000F    jge         006D003A
 006D0011    test        bl,bl
>006D0013    je          006D0021
 006D0015    mov         dword ptr [ebp-98],80
>006D001F    jmp         006D002B
 006D0021    mov         dword ptr [ebp-98],100
 006D002B    mov         dword ptr [ebp-9C],2
>006D0035    jmp         006D032C
 006D003A    mov         eax,[0081F6DC];gvar_0081F6DC:TObjectList
 006D003F    mov         dword ptr [ebp-58],eax
 006D0042    mov         edx,dword ptr [esi+18];TCursorValue........................................................
 006D0045    mov         eax,dword ptr [ebp-58]
 006D0048    call        TList.Get
 006D004D    mov         dword ptr [ebp-5C],eax
 006D0050    mov         edx,ebx
 006D0052    mov         eax,dword ptr [ebp-5C]
 006D0055    call        005E8DFC
>006D005A    jmp         006D032C
 006D005F    cmp         dword ptr [esi+18],0;TCursorValue..........................................................
>006D0063    jge         006D008E
 006D0065    test        bl,bl
>006D0067    je          006D0075
 006D0069    mov         dword ptr [ebp-98],80
>006D0073    jmp         006D007F
 006D0075    mov         dword ptr [ebp-98],100
 006D007F    mov         dword ptr [ebp-9C],4
>006D0089    jmp         006D032C
 006D008E    mov         eax,[0081F6DC];gvar_0081F6DC:TObjectList
 006D0093    mov         dword ptr [ebp-60],eax
 006D0096    mov         edx,dword ptr [esi+18];TCursorValue........................................................
 006D0099    mov         eax,dword ptr [ebp-60]
 006D009C    call        TList.Get
 006D00A1    mov         dword ptr [ebp-64],eax
 006D00A4    mov         edx,ebx
 006D00A6    mov         eax,dword ptr [ebp-64]
 006D00A9    call        005E9024
>006D00AE    jmp         006D032C
 006D00B3    cmp         dword ptr [esi+18],0;TCursorValue..........................................................
>006D00B7    jge         006D00E2
 006D00B9    test        bl,bl
>006D00BB    je          006D00C9
 006D00BD    mov         dword ptr [ebp-98],80
>006D00C7    jmp         006D00D3
 006D00C9    mov         dword ptr [ebp-98],100
 006D00D3    mov         dword ptr [ebp-9C],8
>006D00DD    jmp         006D032C
 006D00E2    mov         eax,[0081F6DC];gvar_0081F6DC:TObjectList
 006D00E7    mov         dword ptr [ebp-68],eax
 006D00EA    mov         edx,dword ptr [esi+18];TCursorValue........................................................
 006D00ED    mov         eax,dword ptr [ebp-68]
 006D00F0    call        TList.Get
 006D00F5    mov         dword ptr [ebp-6C],eax
 006D00F8    mov         edx,ebx
 006D00FA    mov         eax,dword ptr [ebp-6C]
 006D00FD    call        005E924C
>006D0102    jmp         006D032C
 006D0107    cmp         dword ptr [esi+18],0;TCursorValue..........................................................
>006D010B    jge         006D0136
 006D010D    test        bl,bl
>006D010F    je          006D011D
 006D0111    mov         dword ptr [ebp-98],80
>006D011B    jmp         006D0127
 006D011D    mov         dword ptr [ebp-98],100
 006D0127    mov         dword ptr [ebp-9C],10
>006D0131    jmp         006D032C
 006D0136    mov         eax,[0081F6DC];gvar_0081F6DC:TObjectList
 006D013B    mov         dword ptr [ebp-70],eax
 006D013E    mov         edx,dword ptr [esi+18];TCursorValue........................................................
 006D0141    mov         eax,dword ptr [ebp-70]
 006D0144    call        TList.Get
 006D0149    mov         dword ptr [ebp-74],eax
 006D014C    mov         edx,ebx
 006D014E    mov         eax,dword ptr [ebp-74]
 006D0151    call        005E9474
>006D0156    jmp         006D032C
 006D015B    cmp         dword ptr [esi+18],0;TCursorValue..........................................................
>006D015F    jge         006D01AF
 006D0161    mov         dword ptr [ebp-0A8],1
 006D016B    mov         word ptr [ebp-0A2],1D
 006D0174    xor         eax,eax
 006D0176    mov         dword ptr [ebp-9C],eax
 006D017C    mov         word ptr [ebp-0A4],0
 006D0185    xor         eax,eax
 006D0187    mov         dword ptr [ebp-98],eax
 006D018D    test        bl,bl
>006D018F    je          006D01A0
 006D0191    mov         dword ptr [ebp-0A0],8
>006D019B    jmp         006D032C
 006D01A0    mov         dword ptr [ebp-0A0],0A
>006D01AA    jmp         006D032C
 006D01AF    mov         eax,[0081F6DC];gvar_0081F6DC:TObjectList
 006D01B4    mov         dword ptr [ebp-78],eax
 006D01B7    mov         edx,dword ptr [esi+18];TCursorValue........................................................
 006D01BA    mov         eax,dword ptr [ebp-78]
 006D01BD    call        TList.Get
 006D01C2    mov         dword ptr [ebp-7C],eax
 006D01C5    mov         eax,dword ptr [ebp-7C]
 006D01C8    mov         byte ptr [eax+397],bl
>006D01CE    jmp         006D032C
 006D01D3    cmp         dword ptr [esi+18],0;TCursorValue..........................................................
>006D01D7    jge         006D0227
 006D01D9    mov         dword ptr [ebp-0A8],1
 006D01E3    mov         word ptr [ebp-0A2],2A
 006D01EC    xor         eax,eax
 006D01EE    mov         dword ptr [ebp-9C],eax
 006D01F4    mov         word ptr [ebp-0A4],0
 006D01FD    xor         eax,eax
 006D01FF    mov         dword ptr [ebp-98],eax
 006D0205    test        bl,bl
>006D0207    je          006D0218
 006D0209    mov         dword ptr [ebp-0A0],8
>006D0213    jmp         006D032C
 006D0218    mov         dword ptr [ebp-0A0],0A
>006D0222    jmp         006D032C
 006D0227    mov         eax,[0081F6DC];gvar_0081F6DC:TObjectList
 006D022C    mov         dword ptr [ebp-80],eax
 006D022F    mov         edx,dword ptr [esi+18];TCursorValue........................................................
 006D0232    mov         eax,dword ptr [ebp-80]
 006D0235    call        TList.Get
 006D023A    mov         dword ptr [ebp-84],eax
 006D0240    mov         eax,dword ptr [ebp-84]
 006D0246    mov         byte ptr [eax+396],bl
>006D024C    jmp         006D032C
 006D0251    cmp         dword ptr [esi+18],0;TCursorValue..........................................................
>006D0255    jge         006D032C
 006D025B    test        bl,bl
>006D025D    je          006D032C
 006D0263    mov         dword ptr [ebp-98],800
 006D026D    mov         dword ptr [ebp-9C],78
>006D0277    jmp         006D032C
 006D027C    cmp         dword ptr [esi+18],0;TCursorValue..........................................................
>006D0280    jge         006D032C
 006D0286    test        bl,bl
>006D0288    je          006D032C
 006D028E    mov         dword ptr [ebp-98],800
 006D0298    mov         dword ptr [ebp-9C],0FF88
>006D02A2    jmp         006D032C
 006D02A7    cmp         dword ptr [esi+18],0;TCursorValue..........................................................
>006D02AB    jge         006D032C
 006D02AD    test        bl,bl
>006D02AF    je          006D032C
 006D02B1    mov         dword ptr [ebp-98],800
 006D02BB    mov         dword ptr [ebp-9C],0FF880000
>006D02C5    jmp         006D032C
 006D02C7    cmp         dword ptr [esi+18],0;TCursorValue..........................................................
>006D02CB    jge         006D032C
 006D02CD    test        bl,bl
>006D02CF    je          006D032C
 006D02D1    mov         dword ptr [ebp-98],800
 006D02DB    mov         dword ptr [ebp-9C],780000;System
>006D02E5    jmp         006D032C
 006D02E7    cmp         dword ptr [esi+18],0;TCursorValue..........................................................
>006D02EB    jge         006D02F6
 006D02ED    mov         eax,ebx
 006D02EF    call        005EE1A4
>006D02F4    jmp         006D032C
 006D02F6    mov         eax,[0081F6DC];gvar_0081F6DC:TObjectList
 006D02FB    mov         dword ptr [ebp-88],eax
 006D0301    mov         edx,dword ptr [esi+18];TCursorValue........................................................
 006D0304    mov         eax,dword ptr [ebp-88]
 006D030A    call        TList.Get
 006D030F    mov         dword ptr [ebp-8C],eax
 006D0315    mov         edx,ebx
 006D0317    mov         eax,dword ptr [ebp-8C]
 006D031D    call        TCustomForm.SetVisible
>006D0322    jmp         006D032C
 006D0324    xor         eax,eax
 006D0326    mov         dword ptr [ebp-98],eax
 006D032C    xor         eax,eax
 006D032E    mov         dword ptr [ebp-94],eax
 006D0334    xor         eax,eax
 006D0336    mov         dword ptr [ebp-90],eax
 006D033C    cmp         dword ptr [ebp-98],0
>006D0343    jne         006D034E
 006D0345    cmp         dword ptr [ebp-0A0],0
>006D034C    je          006D0364
 006D034E    push        1C
 006D0350    lea         eax,[ebp-0A8]
 006D0356    push        eax
 006D0357    push        1
 006D0359    mov         eax,[0078D96C];^gvar_00816E98:Pointer
 006D035E    mov         eax,dword ptr [eax]
 006D0360    call        eax
>006D0362    jmp         006D0369
 006D0364    mov         eax,1
 006D0369    dec         eax
 006D036A    sete        byte ptr [ebp-1]
>006D036E    jmp         006D0374
 006D0370    mov         byte ptr [ebp-1],1
 006D0374    mov         eax,ebx
 006D0376    call        00686074
 006D037B    fstp        qword ptr [esi+8];TCursorValue.PreviousValue:Double
 006D037E    wait
 006D037F    movzx       eax,byte ptr [ebp-1]
 006D0383    pop         edi
 006D0384    pop         esi
 006D0385    pop         ebx
 006D0386    mov         esp,ebp
 006D0388    pop         ebp
 006D0389    ret         8
end;*}

//006D0390
{*function TCursorValue.SetVector(z:Double; ?:?; y:Double; ?:?; x:Double; ?:?):Boolean;
begin
 006D0390    push        ebp
 006D0391    mov         ebp,esp
 006D0393    add         esp,0FFFFFFD0
 006D0396    push        ebx
 006D0397    push        esi
 006D0398    push        edi
 006D0399    mov         esi,eax
 006D039B    mov         ebx,dword ptr [esi+18];TCursorValue........................................................
 006D039E    test        ebx,ebx
>006D03A0    jge         006D03A6
 006D03A2    xor         edi,edi
>006D03A4    jmp         006D03E5
 006D03A6    mov         eax,[0081F6DC];gvar_0081F6DC:TObjectList
 006D03AB    cmp         ebx,dword ptr [eax+8]
>006D03AE    jl          006D03B4
 006D03B0    mov         al,1
>006D03B2    jmp         006D03C8
 006D03B4    mov         edi,dword ptr ds:[81F6DC];gvar_0081F6DC:TObjectList
 006D03BA    mov         edx,ebx
 006D03BC    mov         eax,edi
 006D03BE    call        TList.Get
 006D03C3    test        eax,eax
 006D03C5    sete        al
 006D03C8    test        al,al
>006D03CA    je          006D03D3
 006D03CC    xor         ebx,ebx
>006D03CE    jmp         006D06DD
 006D03D3    mov         ebx,dword ptr ds:[81F6DC];gvar_0081F6DC:TObjectList
 006D03D9    mov         edx,dword ptr [esi+18];TCursorValue........................................................
 006D03DC    mov         eax,ebx
 006D03DE    call        TList.Get
 006D03E3    mov         edi,eax
 006D03E5    mov         bl,1
 006D03E7    xor         eax,eax
 006D03E9    mov         dword ptr [ebp-1C],eax
 006D03EC    xor         eax,eax
 006D03EE    mov         dword ptr [ebp-18],eax
 006D03F1    xor         eax,eax
 006D03F3    mov         dword ptr [ebp-14],eax
 006D03F6    xor         eax,eax
 006D03F8    mov         dword ptr [ebp-10],eax
 006D03FB    xor         eax,eax
 006D03FD    mov         dword ptr [ebp-0C],eax
 006D0400    mov         eax,dword ptr [esi+20];TCursorValue..........................................Item:Intege...
 006D0403    add         eax,0FFFFFFE2
 006D0406    cmp         eax,0A
>006D0409    ja          006D069D
 006D040F    jmp         dword ptr [eax*4+6D0416]
 006D040F    dd          006D04A6
 006D040F    dd          006D04ED
 006D040F    dd          006D056C
 006D040F    dd          006D0621
 006D040F    dd          006D0656
 006D040F    dd          006D069D
 006D040F    dd          006D069D
 006D040F    dd          006D069D
 006D040F    dd          006D069D
 006D040F    dd          006D0442
 006D040F    dd          006D047B
 006D0442    test        edi,edi
>006D0444    jne         006D044D
 006D0446    xor         ebx,ebx
>006D0448    jmp         006D06B8
 006D044D    mov         ebx,dword ptr ds:[81F6DC];gvar_0081F6DC:TObjectList
 006D0453    mov         edx,dword ptr [esi+18];TCursorValue........................................................
 006D0456    mov         eax,ebx
 006D0458    call        TList.Get
 006D045D    push        dword ptr [ebp+1C]
 006D0460    push        dword ptr [ebp+18]
 006D0463    push        dword ptr [ebp+14]
 006D0466    push        dword ptr [ebp+10]
 006D0469    push        dword ptr [ebp+0C]
 006D046C    push        dword ptr [ebp+8]
 006D046F    call        TCursorForm.SetColour
 006D0474    mov         bl,1
>006D0476    jmp         006D06B8
 006D047B    test        edi,edi
>006D047D    jne         006D0486
 006D047F    xor         ebx,ebx
>006D0481    jmp         006D06B8
 006D0486    push        dword ptr [ebp+1C]
 006D0489    push        dword ptr [ebp+18]
 006D048C    push        dword ptr [ebp+14]
 006D048F    push        dword ptr [ebp+10]
 006D0492    push        dword ptr [ebp+0C]
 006D0495    push        dword ptr [ebp+8]
 006D0498    mov         eax,edi
 006D049A    call        TCursorForm.SetWhiteColour
 006D049F    mov         bl,1
>006D04A1    jmp         006D06B8
 006D04A6    test        edi,edi
>006D04A8    jne         006D04C6
 006D04AA    fld         qword ptr [ebp+10]
 006D04AD    call        @ROUND
 006D04B2    push        eax
 006D04B3    fld         qword ptr [ebp+18]
 006D04B6    call        @ROUND
 006D04BB    push        eax
 006D04BC    call        user32.SetCursorPos
>006D04C1    jmp         006D06B8
 006D04C6    fld         qword ptr [ebp+18]
 006D04C9    call        @ROUND
 006D04CE    mov         edx,eax
 006D04D0    mov         eax,edi
 006D04D2    call        TCursorForm.SetX
 006D04D7    fld         qword ptr [ebp+10]
 006D04DA    call        @ROUND
 006D04DF    mov         edx,eax
 006D04E1    mov         eax,edi
 006D04E3    call        TCursorForm.SetY
>006D04E8    jmp         006D06B8
 006D04ED    test        edi,edi
>006D04EF    jne         006D051F
 006D04F1    mov         dword ptr [ebp-0C],8001
 006D04F8    fld         qword ptr [ebp+18]
 006D04FB    fmul        dword ptr ds:[6D06E8];65535:Single
 006D0501    call        @ROUND
 006D0506    mov         dword ptr [ebp-18],eax
 006D0509    fld         qword ptr [ebp+10]
 006D050C    fmul        dword ptr ds:[6D06E8];65535:Single
 006D0512    call        @ROUND
 006D0517    mov         dword ptr [ebp-14],eax
>006D051A    jmp         006D06B8
 006D051F    mov         eax,[0078DB00];^Screen:TScreen
 006D0524    mov         eax,dword ptr [eax]
 006D0526    call        TScreen.GetWidth
 006D052B    dec         eax
 006D052C    mov         dword ptr [ebp-20],eax
 006D052F    fild        dword ptr [ebp-20]
 006D0532    fmul        qword ptr [ebp+18]
 006D0535    call        @ROUND
 006D053A    mov         edx,eax
 006D053C    mov         eax,edi
 006D053E    call        TCursorForm.SetX
 006D0543    mov         eax,[0078DB00];^Screen:TScreen
 006D0548    mov         eax,dword ptr [eax]
 006D054A    call        TScreen.GetHeight
 006D054F    dec         eax
 006D0550    mov         dword ptr [ebp-20],eax
 006D0553    fild        dword ptr [ebp-20]
 006D0556    fmul        qword ptr [ebp+10]
 006D0559    call        @ROUND
 006D055E    mov         edx,eax
 006D0560    mov         eax,edi
 006D0562    call        TCursorForm.SetY
>006D0567    jmp         006D06B8
 006D056C    test        edi,edi
>006D056E    jne         006D059E
 006D0570    mov         dword ptr [ebp-0C],0C001
 006D0577    fld         qword ptr [ebp+18]
 006D057A    fmul        dword ptr ds:[6D06E8];65535:Single
 006D0580    call        @ROUND
 006D0585    mov         dword ptr [ebp-18],eax
 006D0588    fld         qword ptr [ebp+10]
 006D058B    fmul        dword ptr ds:[6D06E8];65535:Single
 006D0591    call        @ROUND
 006D0596    mov         dword ptr [ebp-14],eax
>006D0599    jmp         006D06B8
 006D059E    mov         eax,[0078DB00];^Screen:TScreen
 006D05A3    mov         eax,dword ptr [eax]
 006D05A5    call        TScreen.GetDesktopLeft
 006D05AA    mov         dword ptr [ebp-20],eax
 006D05AD    fild        dword ptr [ebp-20]
 006D05B0    fstp        tbyte ptr [ebp-2C]
 006D05B3    wait
 006D05B4    mov         eax,[0078DB00];^Screen:TScreen
 006D05B9    mov         eax,dword ptr [eax]
 006D05BB    call        TScreen.GetDesktopWidth
 006D05C0    dec         eax
 006D05C1    mov         dword ptr [ebp-30],eax
 006D05C4    fild        dword ptr [ebp-30]
 006D05C7    fmul        qword ptr [ebp+18]
 006D05CA    fld         tbyte ptr [ebp-2C]
 006D05CD    faddp       st(1),st
 006D05CF    call        @ROUND
 006D05D4    mov         edx,eax
 006D05D6    mov         eax,edi
 006D05D8    call        TCursorForm.SetX
 006D05DD    mov         eax,[0078DB00];^Screen:TScreen
 006D05E2    mov         eax,dword ptr [eax]
 006D05E4    call        TScreen.GetDesktopTop
 006D05E9    mov         dword ptr [ebp-20],eax
 006D05EC    fild        dword ptr [ebp-20]
 006D05EF    fstp        tbyte ptr [ebp-2C]
 006D05F2    wait
 006D05F3    mov         eax,[0078DB00];^Screen:TScreen
 006D05F8    mov         eax,dword ptr [eax]
 006D05FA    call        TScreen.GetDesktopHeight
 006D05FF    dec         eax
 006D0600    mov         dword ptr [ebp-30],eax
 006D0603    fild        dword ptr [ebp-30]
 006D0606    fmul        qword ptr [ebp+10]
 006D0609    fld         tbyte ptr [ebp-2C]
 006D060C    faddp       st(1),st
 006D060E    call        @ROUND
 006D0613    mov         edx,eax
 006D0615    mov         eax,edi
 006D0617    call        TCursorForm.SetY
>006D061C    jmp         006D06B8
 006D0621    test        edi,edi
>006D0623    jne         006D0652
 006D0625    mov         dword ptr [ebp-0C],1
 006D062C    fld         qword ptr [ebp+18]
 006D062F    mov         eax,[0078DB04];^gvar_0078BC58:Double
 006D0634    fsub        qword ptr [eax]
 006D0636    call        @ROUND
 006D063B    mov         dword ptr [ebp-18],eax
 006D063E    fld         qword ptr [ebp+10]
 006D0641    mov         eax,[0078D9E4];^gvar_0078BC60:Double
 006D0646    fsub        qword ptr [eax]
 006D0648    call        @ROUND
 006D064D    mov         dword ptr [ebp-14],eax
>006D0650    jmp         006D06B8
 006D0652    xor         ebx,ebx
>006D0654    jmp         006D06B8
 006D0656    test        edi,edi
>006D0658    jne         006D0699
 006D065A    mov         dword ptr [ebp-0C],801
 006D0661    fld         qword ptr [ebp+18]
 006D0664    mov         eax,[0078DB04];^gvar_0078BC58:Double
 006D0669    fsub        qword ptr [eax]
 006D066B    call        @ROUND
 006D0670    mov         dword ptr [ebp-18],eax
 006D0673    fld         qword ptr [ebp+10]
 006D0676    mov         eax,[0078D9E4];^gvar_0078BC60:Double
 006D067B    fsub        qword ptr [eax]
 006D067D    call        @ROUND
 006D0682    mov         dword ptr [ebp-14],eax
 006D0685    fld         qword ptr [ebp+8]
 006D0688    mov         eax,[0078D754];^gvar_0078BC68:Double
 006D068D    fsub        qword ptr [eax]
 006D068F    call        @ROUND
 006D0694    mov         dword ptr [ebp-10],eax
>006D0697    jmp         006D06B8
 006D0699    xor         ebx,ebx
>006D069B    jmp         006D06B8
 006D069D    push        dword ptr [ebp+1C]
 006D06A0    push        dword ptr [ebp+18]
 006D06A3    push        dword ptr [ebp+14]
 006D06A6    push        dword ptr [ebp+10]
 006D06A9    push        dword ptr [ebp+0C]
 006D06AC    push        dword ptr [ebp+8]
 006D06AF    mov         eax,esi
 006D06B1    call        TExpression.SetVector
 006D06B6    mov         ebx,eax
 006D06B8    xor         eax,eax
 006D06BA    mov         dword ptr [ebp-8],eax
 006D06BD    xor         eax,eax
 006D06BF    mov         dword ptr [ebp-4],eax
 006D06C2    cmp         dword ptr [ebp-0C],0
>006D06C6    je          006D06DD
 006D06C8    push        1C
 006D06CA    lea         eax,[ebp-1C]
 006D06CD    push        eax
 006D06CE    push        1
 006D06D0    mov         eax,[0078D96C];^gvar_00816E98:Pointer
 006D06D5    mov         eax,dword ptr [eax]
 006D06D7    call        eax
 006D06D9    dec         eax
 006D06DA    sete        bl
 006D06DD    mov         eax,ebx
 006D06DF    pop         edi
 006D06E0    pop         esi
 006D06E1    pop         ebx
 006D06E2    mov         esp,ebp
 006D06E4    pop         ebp
 006D06E5    ret         18
end;*}

//006D06EC
{*procedure TCursorValue.ToString(?:?);
begin
 006D06EC    push        ebp
 006D06ED    mov         ebp,esp
 006D06EF    push        0
 006D06F1    push        ebx
 006D06F2    push        esi
 006D06F3    mov         esi,edx
 006D06F5    mov         ebx,eax
 006D06F7    xor         eax,eax
 006D06F9    push        ebp
 006D06FA    push        6D0735
 006D06FF    push        dword ptr fs:[eax]
 006D0702    mov         dword ptr fs:[eax],esp
 006D0705    lea         edx,[ebp-4]
 006D0708    mov         eax,dword ptr [ebx+20];TCursorValue...........................................Item:Integ...
 006D070B    call        006D07DC
 006D0710    mov         ecx,dword ptr [ebp-4]
 006D0713    mov         eax,esi
 006D0715    mov         edx,6D0750;'Cursor.'
 006D071A    call        @UStrCat3
 006D071F    xor         eax,eax
 006D0721    pop         edx
 006D0722    pop         ecx
 006D0723    pop         ecx
 006D0724    mov         dword ptr fs:[eax],edx
 006D0727    push        6D073C
 006D072C    lea         eax,[ebp-4]
 006D072F    call        @UStrClr
 006D0734    ret
>006D0735    jmp         @HandleFinally
>006D073A    jmp         006D072C
 006D073C    pop         esi
 006D073D    pop         ebx
 006D073E    pop         ecx
 006D073F    pop         ebp
 006D0740    ret
end;*}

//006D0760
procedure sub_006D0760;
begin
{*
 006D0760    ret
*}
end;

//006D0764
procedure sub_006D0764;
begin
{*
 006D0764    push        0FF
 006D0766    call        user32.ShowCursor
 006D076B    mov         al,1
 006D076D    call        005EE1A4
 006D0772    cmp         dword ptr ds:[81F6DC],0;gvar_0081F6DC:TObjectList
>006D0779    je          006D0785
 006D077B    mov         eax,[0081F6DC];gvar_0081F6DC:TObjectList
 006D0780    mov         edx,dword ptr [eax]
 006D0782    call        dword ptr [edx+8]
 006D0785    ret
*}
end;

//006D0788
{*function sub_006D0788(?:UnicodeString):?;
begin
 006D0788    push        ebp
 006D0789    mov         ebp,esp
 006D078B    push        ecx
 006D078C    push        ebx
 006D078D    mov         dword ptr [ebp-4],eax
 006D0790    mov         eax,dword ptr [ebp-4]
 006D0793    call        @UStrAddRef
 006D0798    xor         eax,eax
 006D079A    push        ebp
 006D079B    push        6D07CE
 006D07A0    push        dword ptr fs:[eax]
 006D07A3    mov         dword ptr fs:[eax],esp
 006D07A6    mov         eax,[0081F6D8];gvar_0081F6D8:TModuleCursor
 006D07AB    mov         eax,dword ptr [eax+1C]
 006D07AE    mov         edx,dword ptr [ebp-4]
 006D07B1    call        THashTable.Get
 006D07B6    mov         ebx,eax
 006D07B8    xor         eax,eax
 006D07BA    pop         edx
 006D07BB    pop         ecx
 006D07BC    pop         ecx
 006D07BD    mov         dword ptr fs:[eax],edx
 006D07C0    push        6D07D5
 006D07C5    lea         eax,[ebp-4]
 006D07C8    call        @UStrClr
 006D07CD    ret
>006D07CE    jmp         @HandleFinally
>006D07D3    jmp         006D07C5
 006D07D5    mov         eax,ebx
 006D07D7    pop         ebx
 006D07D8    pop         ecx
 006D07D9    pop         ebp
 006D07DA    ret
end;*}

//006D07DC
{*procedure sub_006D07DC(?:Integer; ?:?);
begin
 006D07DC    push        ebx
 006D07DD    push        esi
 006D07DE    mov         esi,edx
 006D07E0    mov         ebx,eax
 006D07E2    mov         ecx,esi
 006D07E4    mov         eax,[0081F6D8];gvar_0081F6D8:TModuleCursor
 006D07E9    mov         eax,dword ptr [eax+1C]
 006D07EC    mov         edx,ebx
 006D07EE    call        THashTable.Get
 006D07F3    pop         esi
 006D07F4    pop         ebx
 006D07F5    ret
end;*}

//006D07F8
procedure TModuleCursor.AddFields;
begin
{*
 006D07F8    push        ebx
 006D07F9    mov         ebx,eax
 006D07FB    mov         ecx,2
 006D0800    mov         edx,6D1044;'LeftButton'
 006D0805    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0808    call        THashTable.Add
 006D080D    mov         ecx,3
 006D0812    mov         edx,6D1068;'RightButton'
 006D0817    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D081A    call        THashTable.Add
 006D081F    mov         ecx,4
 006D0824    mov         edx,6D108C;'MiddleButton'
 006D0829    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D082C    call        THashTable.Add
 006D0831    mov         ecx,5
 006D0836    mov         edx,6D10B4;'XButton1'
 006D083B    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D083E    call        THashTable.Add
 006D0843    mov         ecx,6
 006D0848    mov         edx,6D10D4;'XButton2'
 006D084D    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0850    call        THashTable.Add
 006D0855    mov         ecx,7
 006D085A    mov         edx,6D10F4;'Button6'
 006D085F    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0862    call        THashTable.Add
 006D0867    mov         ecx,8
 006D086C    mov         edx,6D1110;'Button7'
 006D0871    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0874    call        THashTable.Add
 006D0879    mov         ecx,9
 006D087E    mov         edx,6D112C;'Button8'
 006D0883    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0886    call        THashTable.Add
 006D088B    mov         ecx,0F
 006D0890    mov         edx,6D1148;'x'
 006D0895    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0898    call        THashTable.Add
 006D089D    mov         ecx,10
 006D08A2    mov         edx,6D1158;'y'
 006D08A7    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D08AA    call        THashTable.Add
 006D08AF    mov         ecx,11
 006D08B4    mov         edx,6D1168;'VirtualDesktopX'
 006D08B9    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D08BC    call        THashTable.Add
 006D08C1    mov         ecx,12
 006D08C6    mov         edx,6D1194;'VirtualDesktopY'
 006D08CB    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D08CE    call        THashTable.Add
 006D08D3    mov         ecx,13
 006D08D8    mov         edx,6D11C0;^338:Single
 006D08DD    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D08E0    call        THashTable.Add
 006D08E5    mov         ecx,14
 006D08EA    mov         edx,6D11E8;^338:Single
 006D08EF    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D08F2    call        THashTable.Add
 006D08F7    mov         ecx,19
 006D08FC    mov         edx,6D1210;^338:Single
 006D0901    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0904    call        THashTable.Add
 006D0909    mov         ecx,1A
 006D090E    mov         edx,6D1238;^338:Single
 006D0913    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0916    call        THashTable.Add
 006D091B    mov         ecx,0D
 006D0920    mov         edx,6D1260;'PosX'
 006D0925    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0928    call        THashTable.Add
 006D092D    mov         ecx,0E
 006D0932    mov         edx,6D1278;'PosY'
 006D0937    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D093A    call        THashTable.Add
 006D093F    mov         ecx,0D
 006D0944    mov         edx,6D1290;'CursorPosX'
 006D0949    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D094C    call        THashTable.Add
 006D0951    mov         ecx,0E
 006D0956    mov         edx,6D12B4;'CursorPosY'
 006D095B    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D095E    call        THashTable.Add
 006D0963    mov         ecx,0A
 006D0968    mov         edx,6D12D8;'DoubleClickTime'
 006D096D    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0970    call        THashTable.Add
 006D0975    mov         ecx,1C
 006D097A    mov         edx,6D1304;'Cursor'
 006D097F    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0982    call        THashTable.Add
 006D0987    mov         ecx,1
 006D098C    mov         edx,6D1320;'Visible'
 006D0991    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0994    call        THashTable.Add
 006D0999    mov         ecx,1
 006D099E    mov         edx,6D133C;'CursorVisible'
 006D09A3    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D09A6    call        THashTable.Add
 006D09AB    mov         ecx,1D
 006D09B0    mov         edx,6D1364;'PermanentCursor'
 006D09B5    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D09B8    call        THashTable.Add
 006D09BD    mov         ecx,2
 006D09C2    mov         edx,6D1390;'Button1'
 006D09C7    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D09CA    call        THashTable.Add
 006D09CF    mov         ecx,3
 006D09D4    mov         edx,6D13AC;'Button2'
 006D09D9    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D09DC    call        THashTable.Add
 006D09E1    mov         ecx,4
 006D09E6    mov         edx,6D13C8;'Button3'
 006D09EB    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D09EE    call        THashTable.Add
 006D09F3    mov         ecx,5
 006D09F8    mov         edx,6D13E4;'Button4'
 006D09FD    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0A00    call        THashTable.Add
 006D0A05    mov         ecx,6
 006D0A0A    mov         edx,6D1400;'Button5'
 006D0A0F    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0A12    call        THashTable.Add
 006D0A17    mov         ecx,2
 006D0A1C    mov         edx,6D141C;'LMB'
 006D0A21    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0A24    call        THashTable.Add
 006D0A29    mov         ecx,3
 006D0A2E    mov         edx,6D1430;'RMB'
 006D0A33    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0A36    call        THashTable.Add
 006D0A3B    mov         ecx,4
 006D0A40    mov         edx,6D1444;'MMB'
 006D0A45    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0A48    call        THashTable.Add
 006D0A4D    mov         ecx,5
 006D0A52    mov         edx,6D1458;'XMB1'
 006D0A57    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0A5A    call        THashTable.Add
 006D0A5F    mov         ecx,6
 006D0A64    mov         edx,6D1470;'XMB2'
 006D0A69    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0A6C    call        THashTable.Add
 006D0A71    mov         ecx,7
 006D0A76    mov         edx,6D1488;'XButton3'
 006D0A7B    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0A7E    call        THashTable.Add
 006D0A83    mov         ecx,8
 006D0A88    mov         edx,6D14A8;'XButton4'
 006D0A8D    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0A90    call        THashTable.Add
 006D0A95    mov         ecx,9
 006D0A9A    mov         edx,6D14C8;'XButton5'
 006D0A9F    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0AA2    call        THashTable.Add
 006D0AA7    mov         ecx,7
 006D0AAC    mov         edx,6D14E8;'XMB3'
 006D0AB1    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0AB4    call        THashTable.Add
 006D0AB9    mov         ecx,8
 006D0ABE    mov         edx,6D1500;'XMB4'
 006D0AC3    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0AC6    call        THashTable.Add
 006D0ACB    mov         ecx,9
 006D0AD0    mov         edx,6D1518;'XMB5'
 006D0AD5    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0AD8    call        THashTable.Add
 006D0ADD    mov         ecx,15
 006D0AE2    mov         edx,6D1530;'ScrollUp'
 006D0AE7    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0AEA    call        THashTable.Add
 006D0AEF    mov         ecx,16
 006D0AF4    mov         edx,6D1550;'ScrollDown'
 006D0AF9    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0AFC    call        THashTable.Add
 006D0B01    mov         ecx,15
 006D0B06    mov         edx,6D1574;'ScrollWheelUp'
 006D0B0B    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0B0E    call        THashTable.Add
 006D0B13    mov         ecx,16
 006D0B18    mov         edx,6D159C;'ScrollWheelDown'
 006D0B1D    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0B20    call        THashTable.Add
 006D0B25    mov         ecx,17
 006D0B2A    mov         edx,6D15C8;'ScrollLeft'
 006D0B2F    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0B32    call        THashTable.Add
 006D0B37    mov         ecx,18
 006D0B3C    mov         edx,6D15EC;'ScrollRight'
 006D0B41    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0B44    call        THashTable.Add
 006D0B49    mov         ecx,17
 006D0B4E    mov         edx,6D1610;'ScrollWheelLeft'
 006D0B53    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0B56    call        THashTable.Add
 006D0B5B    mov         ecx,18
 006D0B60    mov         edx,6D163C;'ScrollWheelRight'
 006D0B65    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0B68    call        THashTable.Add
 006D0B6D    mov         ecx,11
 006D0B72    mov         edx,6D166C;'VirtualX'
 006D0B77    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0B7A    call        THashTable.Add
 006D0B7F    mov         ecx,12
 006D0B84    mov         edx,6D168C;'VirtualY'
 006D0B89    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0B8C    call        THashTable.Add
 006D0B91    mov         ecx,13
 006D0B96    mov         edx,6D16AC;'DInputX'
 006D0B9B    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0B9E    call        THashTable.Add
 006D0BA3    mov         ecx,14
 006D0BA8    mov         edx,6D16C8;'DInputY'
 006D0BAD    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0BB0    call        THashTable.Add
 006D0BB5    mov         ecx,19
 006D0BBA    mov         edx,6D16E4;'DInputZ'
 006D0BBF    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0BC2    call        THashTable.Add
 006D0BC7    mov         ecx,1A
 006D0BCC    mov         edx,6D16E4;'DInputZ'
 006D0BD1    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0BD4    call        THashTable.Add
 006D0BD9    mov         ecx,13
 006D0BDE    mov         edx,6D1700;'DIX'
 006D0BE3    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0BE6    call        THashTable.Add
 006D0BEB    mov         ecx,14
 006D0BF0    mov         edx,6D1714;'DIY'
 006D0BF5    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0BF8    call        THashTable.Add
 006D0BFD    mov         ecx,19
 006D0C02    mov         edx,6D1728;'DIZ'
 006D0C07    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0C0A    call        THashTable.Add
 006D0C0F    mov         ecx,1A
 006D0C14    mov         edx,6D173C;'DIH'
 006D0C19    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0C1C    call        THashTable.Add
 006D0C21    mov         ecx,0D
 006D0C26    mov         edx,6D1750;'CursorX'
 006D0C2B    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0C2E    call        THashTable.Add
 006D0C33    mov         ecx,0E
 006D0C38    mov         edx,6D176C;'CursorY'
 006D0C3D    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0C40    call        THashTable.Add
 006D0C45    mov         ecx,1C
 006D0C4A    mov         edx,6D1788;'MousePointer'
 006D0C4F    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0C52    call        THashTable.Add
 006D0C57    mov         ecx,1C
 006D0C5C    mov         edx,6D17B0;'Pointer'
 006D0C61    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0C64    call        THashTable.Add
 006D0C69    mov         ecx,4
 006D0C6E    mov         edx,6D17CC;'Wheel.Button'
 006D0C73    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0C76    call        THashTable.Add
 006D0C7B    mov         ecx,4
 006D0C80    mov         edx,6D17F4;'WheelButton'
 006D0C85    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0C88    call        THashTable.Add
 006D0C8D    mov         ecx,11
 006D0C92    mov         edx,6D1818;'VirtualDesktop.X'
 006D0C97    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0C9A    call        THashTable.Add
 006D0C9F    mov         ecx,12
 006D0CA4    mov         edx,6D1848;'VirtualDesktop.Y'
 006D0CA9    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0CAC    call        THashTable.Add
 006D0CB1    mov         ecx,13
 006D0CB6    mov         edx,6D1878;^338:Single
 006D0CBB    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0CBE    call        THashTable.Add
 006D0CC3    mov         ecx,14
 006D0CC8    mov         edx,6D18A0;^338:Single
 006D0CCD    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0CD0    call        THashTable.Add
 006D0CD5    mov         ecx,19
 006D0CDA    mov         edx,6D18C8;^338:Single
 006D0CDF    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0CE2    call        THashTable.Add
 006D0CE7    mov         ecx,1A
 006D0CEC    mov         edx,6D18F0;^338:Single
 006D0CF1    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0CF4    call        THashTable.Add
 006D0CF9    mov         ecx,0D
 006D0CFE    mov         edx,6D1918;'Pos.X'
 006D0D03    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0D06    call        THashTable.Add
 006D0D0B    mov         ecx,0E
 006D0D10    mov         edx,6D1930;'Pos.Y'
 006D0D15    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0D18    call        THashTable.Add
 006D0D1D    mov         ecx,0D
 006D0D22    mov         edx,6D1948;'CursorPos.X'
 006D0D27    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0D2A    call        THashTable.Add
 006D0D2F    mov         ecx,0E
 006D0D34    mov         edx,6D196C;'CursorPos.Y'
 006D0D39    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0D3C    call        THashTable.Add
 006D0D41    mov         ecx,1
 006D0D46    mov         edx,6D1990;'Cursor.Visible'
 006D0D4B    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0D4E    call        THashTable.Add
 006D0D53    mov         ecx,0D
 006D0D58    mov         edx,6D19BC;'Cursor.Pos.X'
 006D0D5D    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0D60    call        THashTable.Add
 006D0D65    mov         ecx,0E
 006D0D6A    mov         edx,6D19E4;'Cursor.Pos.Y'
 006D0D6F    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0D72    call        THashTable.Add
 006D0D77    mov         ecx,0D
 006D0D7C    mov         edx,6D1A0C;'Cursor.X'
 006D0D81    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0D84    call        THashTable.Add
 006D0D89    mov         ecx,0E
 006D0D8E    mov         edx,6D1A2C;'Cursor.Y'
 006D0D93    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0D96    call        THashTable.Add
 006D0D9B    mov         ecx,2
 006D0DA0    mov         edx,6D1A4C;'mb1'
 006D0DA5    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0DA8    call        THashTable.Add
 006D0DAD    mov         ecx,3
 006D0DB2    mov         edx,6D1A60;'mb2'
 006D0DB7    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0DBA    call        THashTable.Add
 006D0DBF    mov         ecx,4
 006D0DC4    mov         edx,6D1A74;'mb3'
 006D0DC9    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0DCC    call        THashTable.Add
 006D0DD1    mov         ecx,5
 006D0DD6    mov         edx,6D1A88;'mb4'
 006D0DDB    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0DDE    call        THashTable.Add
 006D0DE3    mov         ecx,6
 006D0DE8    mov         edx,6D1A9C;'mb5'
 006D0DED    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0DF0    call        THashTable.Add
 006D0DF5    mov         ecx,7
 006D0DFA    mov         edx,6D1AB0;'mb6'
 006D0DFF    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0E02    call        THashTable.Add
 006D0E07    mov         ecx,8
 006D0E0C    mov         edx,6D1AC4;'mb7'
 006D0E11    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0E14    call        THashTable.Add
 006D0E19    mov         ecx,9
 006D0E1E    mov         edx,6D1AD8;'mb8'
 006D0E23    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0E26    call        THashTable.Add
 006D0E2B    mov         ecx,2
 006D0E30    mov         edx,6D1AEC;'LeftMouseButton'
 006D0E35    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0E38    call        THashTable.Add
 006D0E3D    mov         ecx,3
 006D0E42    mov         edx,6D1B18;'RightMouseButton'
 006D0E47    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0E4A    call        THashTable.Add
 006D0E4F    mov         ecx,4
 006D0E54    mov         edx,6D1B48;'MiddleMouseButton'
 006D0E59    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0E5C    call        THashTable.Add
 006D0E61    mov         ecx,1E
 006D0E66    mov         edx,6D1B78;'CursorPos'
 006D0E6B    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0E6E    call        THashTable.Add
 006D0E73    mov         ecx,1F
 006D0E78    mov         edx,6D1B98;'xy'
 006D0E7D    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0E80    call        THashTable.Add
 006D0E85    mov         ecx,1F
 006D0E8A    mov         edx,6D1BAC;'ScreenFraction'
 006D0E8F    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0E92    call        THashTable.Add
 006D0E97    mov         ecx,20
 006D0E9C    mov         edx,6D1BD8;'DesktopFraction'
 006D0EA1    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0EA4    call        THashTable.Add
 006D0EA9    mov         ecx,21
 006D0EAE    mov         edx,6D1C04;^338:Single
 006D0EB3    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0EB6    call        THashTable.Add
 006D0EBB    mov         ecx,22
 006D0EC0    mov         edx,6D1C30;^338:Single
 006D0EC5    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0EC8    call        THashTable.Add
 006D0ECD    mov         ecx,21
 006D0ED2    mov         edx,6D1C58;^338:Single
 006D0ED7    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0EDA    call        THashTable.Add
 006D0EDF    mov         ecx,22
 006D0EE4    mov         edx,6D1C80;'DInput3D'
 006D0EE9    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0EEC    call        THashTable.Add
 006D0EF1    mov         ecx,21
 006D0EF6    mov         edx,6D1CA0;'DInput2D'
 006D0EFB    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0EFE    call        THashTable.Add
 006D0F03    mov         ecx,21
 006D0F08    mov         edx,6D1CC0;'DInput'
 006D0F0D    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0F10    call        THashTable.Add
 006D0F15    mov         ecx,21
 006D0F1A    mov         edx,6D1CDC;'DInputPos'
 006D0F1F    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0F22    call        THashTable.Add
 006D0F27    mov         ecx,21
 006D0F2C    mov         edx,6D1CFC;^338:Single
 006D0F31    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0F34    call        THashTable.Add
 006D0F39    mov         ecx,21
 006D0F3E    mov         edx,6D1D20;'AbsolutePos'
 006D0F43    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0F46    call        THashTable.Add
 006D0F4B    mov         ecx,29
 006D0F50    mov         edx,6D1D44;'Count'
 006D0F55    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0F58    call        THashTable.Add
 006D0F5D    mov         ecx,0B
 006D0F62    mov         edx,6D1D5C;'Ctrl'
 006D0F67    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0F6A    call        THashTable.Add
 006D0F6F    mov         ecx,0B
 006D0F74    mov         edx,6D1D74;'Control'
 006D0F79    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0F7C    call        THashTable.Add
 006D0F81    mov         ecx,0C
 006D0F86    mov         edx,6D1D90;'Shift'
 006D0F8B    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0F8E    call        THashTable.Add
 006D0F93    mov         ecx,23
 006D0F98    mov         edx,6D1DA8;'Roll'
 006D0F9D    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0FA0    call        THashTable.Add
 006D0FA5    mov         ecx,23
 006D0FAA    mov         edx,6D1DC0;'Angle'
 006D0FAF    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0FB2    call        THashTable.Add
 006D0FB7    mov         ecx,23
 006D0FBC    mov         edx,6D1DD8;'Rotation'
 006D0FC1    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0FC4    call        THashTable.Add
 006D0FC9    mov         ecx,24
 006D0FCE    mov         edx,6D1DF8;'Caption'
 006D0FD3    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0FD6    call        THashTable.Add
 006D0FDB    mov         ecx,26
 006D0FE0    mov         edx,6D1E14;'Image'
 006D0FE5    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0FE8    call        THashTable.Add
 006D0FED    mov         ecx,27
 006D0FF2    mov         edx,6D1E2C;'Colour'
 006D0FF7    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D0FFA    call        THashTable.Add
 006D0FFF    mov         ecx,27
 006D1004    mov         edx,6D1E48;'Color'
 006D1009    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D100C    call        THashTable.Add
 006D1011    mov         ecx,28
 006D1016    mov         edx,6D1E60;'WhiteColour'
 006D101B    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D101E    call        THashTable.Add
 006D1023    mov         ecx,28
 006D1028    mov         edx,6D1E84;'WhiteColor'
 006D102D    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D1030    call        THashTable.Add
 006D1035    pop         ebx
 006D1036    ret
*}
end;

//006D1E9C
constructor TModuleCursor.Create;
begin
{*
 006D1E9C    push        ebx
 006D1E9D    push        esi
 006D1E9E    test        dl,dl
>006D1EA0    je          006D1EAA
 006D1EA2    add         esp,0FFFFFFF0
 006D1EA5    call        @ClassCreate
 006D1EAA    mov         ebx,edx
 006D1EAC    mov         esi,eax
 006D1EAE    push        6D1EF4;'Cursors'
 006D1EB3    push        6D1F10;'MouseCursor'
 006D1EB8    push        6D1F34;'MousePointer'
 006D1EBD    push        0
 006D1EBF    mov         ecx,6D1F5C;'Cursor'
 006D1EC4    xor         edx,edx
 006D1EC6    mov         eax,esi
 006D1EC8    call        005E49A8
 006D1ECD    mov         eax,esi
 006D1ECF    test        bl,bl
>006D1ED1    je          006D1EE2
 006D1ED3    call        @AfterConstruction
 006D1ED8    pop         dword ptr fs:[0]
 006D1EDF    add         esp,0C
 006D1EE2    mov         eax,esi
 006D1EE4    pop         esi
 006D1EE5    pop         ebx
 006D1EE6    ret
*}
end;

//006D1F6C
function TModuleCursor.CreateValue(Identifier:string):TExpression;
begin
{*
 006D1F6C    push        ebp
 006D1F6D    mov         ebp,esp
 006D1F6F    push        ecx
 006D1F70    push        ebx
 006D1F71    mov         dword ptr [ebp-4],edx
 006D1F74    mov         ebx,eax
 006D1F76    mov         eax,dword ptr [ebp-4]
 006D1F79    call        @UStrAddRef
 006D1F7E    xor         eax,eax
 006D1F80    push        ebp
 006D1F81    push        6D1FB0
 006D1F86    push        dword ptr fs:[eax]
 006D1F89    mov         dword ptr fs:[eax],esp
 006D1F8C    mov         byte ptr [ebx+24],1;TModuleCursor.Used:Boolean
 006D1F90    mov         eax,dword ptr [ebp-4]
 006D1F93    call        006CE89C
 006D1F98    mov         ebx,eax
 006D1F9A    xor         eax,eax
 006D1F9C    pop         edx
 006D1F9D    pop         ecx
 006D1F9E    pop         ecx
 006D1F9F    mov         dword ptr fs:[eax],edx
 006D1FA2    push        6D1FB7
 006D1FA7    lea         eax,[ebp-4]
 006D1FAA    call        @UStrClr
 006D1FAF    ret
>006D1FB0    jmp         @HandleFinally
>006D1FB5    jmp         006D1FA7
 006D1FB7    mov         eax,ebx
 006D1FB9    pop         ebx
 006D1FBA    pop         ecx
 006D1FBB    pop         ebp
 006D1FBC    ret
*}
end;

//006D1FC0
function TModuleCursor.GetDefaultFormat(field:string):TGuiFormat;
begin
{*
 006D1FC0    push        ebp
 006D1FC1    mov         ebp,esp
 006D1FC3    push        ecx
 006D1FC4    push        ebx
 006D1FC5    mov         dword ptr [ebp-4],edx
 006D1FC8    mov         ebx,eax
 006D1FCA    mov         eax,dword ptr [ebp-4]
 006D1FCD    call        @UStrAddRef
 006D1FD2    xor         eax,eax
 006D1FD4    push        ebp
 006D1FD5    push        6D2039
 006D1FDA    push        dword ptr fs:[eax]
 006D1FDD    mov         dword ptr fs:[eax],esp
 006D1FE0    mov         edx,dword ptr [ebp-4]
 006D1FE3    mov         eax,dword ptr [ebx+1C];TModuleCursor.Fields:THashTable
 006D1FE6    call        THashTable.Get
 006D1FEB    cmp         eax,19
>006D1FEE    jge         006D2007
 006D1FF0    sub         eax,0A
>006D1FF3    je          006D201D
 006D1FF5    add         eax,0FFFFFFFD
 006D1FF8    sub         eax,2
>006D1FFB    jb          006D201D
 006D1FFD    add         eax,0FFFFFFFC
 006D2000    sub         eax,2
>006D2003    jb          006D201D
>006D2005    jmp         006D2021
 006D2007    add         eax,0FFFFFFE7
 006D200A    sub         eax,6
>006D200D    jb          006D201D
 006D200F    add         eax,0FFFFFFFE
 006D2012    sub         eax,4
>006D2015    jb          006D201D
 006D2017    dec         eax
 006D2018    sub         eax,4
>006D201B    jae         006D2021
 006D201D    mov         bl,9
>006D201F    jmp         006D2023
 006D2021    xor         ebx,ebx
 006D2023    xor         eax,eax
 006D2025    pop         edx
 006D2026    pop         ecx
 006D2027    pop         ecx
 006D2028    mov         dword ptr fs:[eax],edx
 006D202B    push        6D2040
 006D2030    lea         eax,[ebp-4]
 006D2033    call        @UStrClr
 006D2038    ret
>006D2039    jmp         @HandleFinally
>006D203E    jmp         006D2030
 006D2040    mov         eax,ebx
 006D2042    pop         ebx
 006D2043    pop         ecx
 006D2044    pop         ebp
 006D2045    ret
*}
end;

//006D2048
procedure TModuleCursor.GetGoodFields;
begin
{*
 006D2048    mov         edx,dword ptr [eax]
 006D204A    call        dword ptr [edx+18];TPieModule.GetFields
 006D204D    ret
*}
end;

//006D2050
procedure TModuleCursor.GetRange(blank:Boolean; min:Integer; max:Integer);
begin
{*
 006D2050    push        ebp
 006D2051    mov         ebp,esp
 006D2053    mov         byte ptr [edx],1
 006D2056    xor         eax,eax
 006D2058    mov         dword ptr [ecx],eax
 006D205A    mov         eax,dword ptr [ebp+8]
 006D205D    mov         dword ptr [eax],0F
 006D2063    pop         ebp
 006D2064    ret         4
*}
end;

//006D2068
function TModuleCursor.IsIdentifier(s:string):Boolean;
begin
{*
 006D2068    push        ebp
 006D2069    mov         ebp,esp
 006D206B    push        ecx
 006D206C    push        ebx
 006D206D    mov         dword ptr [ebp-4],edx
 006D2070    mov         eax,dword ptr [ebp-4]
 006D2073    call        @UStrAddRef
 006D2078    xor         eax,eax
 006D207A    push        ebp
 006D207B    push        6D2129
 006D2080    push        dword ptr fs:[eax]
 006D2083    mov         dword ptr fs:[eax],esp
 006D2086    lea         eax,[ebp-4]
 006D2089    mov         edx,6D2144;'RealCursor.'
 006D208E    call        004F9BD0
 006D2093    test        al,al
>006D2095    je          006D209B
 006D2097    mov         bl,1
>006D2099    jmp         006D2113
 006D209B    lea         eax,[ebp-4]
 006D209E    mov         edx,6D2168;'Cursors'
 006D20A3    call        004F9BD0
 006D20A8    test        al,al
>006D20AA    jne         006D20F4
 006D20AC    lea         eax,[ebp-4]
 006D20AF    mov         edx,6D2184;'FakeCursor'
 006D20B4    call        004F9BD0
 006D20B9    test        al,al
>006D20BB    jne         006D20F4
 006D20BD    lea         eax,[ebp-4]
 006D20C0    mov         edx,6D21A8;'Cursor'
 006D20C5    call        004F9BD0
 006D20CA    test        al,al
>006D20CC    jne         006D20F4
 006D20CE    lea         eax,[ebp-4]
 006D20D1    mov         edx,6D21C4;'MouseCursor'
 006D20D6    call        004F9BD0
 006D20DB    test        al,al
>006D20DD    jne         006D20F4
 006D20DF    lea         eax,[ebp-4]
 006D20E2    mov         edx,6D21E8;'MousePointer'
 006D20E7    call        004F9BD0
 006D20EC    test        al,al
>006D20EE    jne         006D20F4
 006D20F0    xor         ebx,ebx
>006D20F2    jmp         006D2113
 006D20F4    lea         eax,[ebp-4]
 006D20F7    call        004F9D00
 006D20FC    lea         eax,[ebp-4]
 006D20FF    mov         edx,6D2210;'.'
 006D2104    call        004F9BD0
 006D2109    test        al,al
>006D210B    jne         006D2111
 006D210D    xor         ebx,ebx
>006D210F    jmp         006D2113
 006D2111    mov         bl,1
 006D2113    xor         eax,eax
 006D2115    pop         edx
 006D2116    pop         ecx
 006D2117    pop         ecx
 006D2118    mov         dword ptr fs:[eax],edx
 006D211B    push        6D2130
 006D2120    lea         eax,[ebp-4]
 006D2123    call        @UStrClr
 006D2128    ret
>006D2129    jmp         @HandleFinally
>006D212E    jmp         006D2120
 006D2130    mov         eax,ebx
 006D2132    pop         ebx
 006D2133    pop         ecx
 006D2134    pop         ebp
 006D2135    ret
*}
end;

//006D2214
procedure TModuleCursor.MonitorFrame;
begin
{*
 006D2214    ret
*}
end;

//006D2218
procedure TModuleCursor.PrepareForMonitoring;
begin
{*
 006D2218    ret
*}
end;

//006D221C
procedure TModuleCursor.StartCompiletime;
begin
{*
 006D221C    call        TPieModule.StartCompiletime
 006D2221    call        006CE888
 006D2226    ret
*}
end;

//006D2228
procedure TModuleCursor.StartGUI;
begin
{*
 006D2228    cmp         dword ptr ds:[81F6DC],0;gvar_0081F6DC:TObjectList
>006D222F    je          006D223B
 006D2231    mov         eax,[0081F6DC];gvar_0081F6DC:TObjectList
 006D2236    mov         edx,dword ptr [eax]
 006D2238    call        dword ptr [edx+8]
 006D223B    ret
*}
end;

//006D223C
procedure TModuleCursor.StartMonitoring;
begin
{*
 006D223C    ret
*}
end;

//006D2240
procedure TModuleCursor.StartRuntime;
begin
{*
 006D2240    call        TPieModule.StartRuntime
 006D2245    call        006D0760
 006D224A    ret
*}
end;

//006D224C
procedure TModuleCursor.StopCompiletime;
begin
{*
 006D224C    push        ebx
 006D224D    mov         ebx,eax
 006D224F    call        006CE898
 006D2254    mov         eax,ebx
 006D2256    call        TPieModule.StopCompiletime
 006D225B    pop         ebx
 006D225C    ret
*}
end;

//006D2260
procedure TModuleCursor.StopGUI;
begin
{*
 006D2260    cmp         dword ptr ds:[81F6DC],0;gvar_0081F6DC:TObjectList
>006D2267    je          006D2273
 006D2269    mov         eax,[0081F6DC];gvar_0081F6DC:TObjectList
 006D226E    mov         edx,dword ptr [eax]
 006D2270    call        dword ptr [edx+8]
 006D2273    ret
*}
end;

//006D2274
procedure TModuleCursor.StopMonitoring;
begin
{*
 006D2274    ret
*}
end;

//006D2278
procedure TModuleCursor.StopRuntime;
begin
{*
 006D2278    push        ebx
 006D2279    mov         ebx,eax
 006D227B    call        006D0764
 006D2280    mov         eax,ebx
 006D2282    call        TPieModule.StopRuntime
 006D2287    pop         ebx
 006D2288    ret
*}
end;

Initialization
//00782808
{*
 00782808    push        ebp
 00782809    mov         ebp,esp
 0078280B    push        ebx
 0078280C    push        esi
 0078280D    push        edi
 0078280E    sub         dword ptr ds:[81F6D4],1
>00782815    jae         00782882
 00782817    xor         edx,edx
 00782819    push        ebp
 0078281A    push        782867
 0078281F    push        dword ptr fs:[edx]
 00782822    mov         dword ptr fs:[edx],esp
 00782825    mov         eax,782894;'Initializing PieCursors'
 0078282A    call        004FA5FC
 0078282F    mov         dl,1
 00782831    mov         eax,[006CE3A0];TModuleCursor
 00782836    call        TModuleCursor.Create;TModuleCursor.Create
 0078283B    mov         [0081F6D8],eax;gvar_0081F6D8:TModuleCursor
 00782840    mov         eax,[0081F6D8];gvar_0081F6D8:TModuleCursor
 00782845    call        005E31AC
 0078284A    mov         cl,1
 0078284C    mov         dl,1
 0078284E    mov         eax,[00471630];TObjectList
 00782853    call        TObjectList.Create;TObjectList.Create
 00782858    mov         [0081F6DC],eax;gvar_0081F6DC:TObjectList
 0078285D    xor         eax,eax
 0078285F    pop         edx
 00782860    pop         ecx
 00782861    pop         ecx
 00782862    mov         dword ptr fs:[eax],edx
>00782865    jmp         00782882
>00782867    jmp         @HandleOnException
 0078286C    dd          1
 00782870    dd          00418C04;Exception
 00782874    dd          00782878
 00782878    call        004FA644
 0078287D    call        @DoneExcept
 00782882    pop         edi
 00782883    pop         esi
 00782884    pop         ebx
 00782885    pop         ebp
 00782886    ret
*}
Finalization
//006D228C
{*
 006D228C    push        ebp
 006D228D    mov         ebp,esp
 006D228F    push        ebx
 006D2290    push        esi
 006D2291    push        edi
 006D2292    inc         dword ptr ds:[81F6D4]
>006D2298    jne         006D22E9
 006D229A    xor         edx,edx
 006D229C    push        ebp
 006D229D    push        6D22CE
 006D22A2    push        dword ptr fs:[edx]
 006D22A5    mov         dword ptr fs:[edx],esp
 006D22A8    mov         eax,6D22FC;'Finalizing PieCursors'
 006D22AD    call        004FA5FC
 006D22B2    mov         eax,[0081F6DC];gvar_0081F6DC:TObjectList
 006D22B7    xor         edx,edx
 006D22B9    mov         dword ptr ds:[81F6DC],edx;gvar_0081F6DC:TObjectList
 006D22BF    call        TObject.Free
 006D22C4    xor         eax,eax
 006D22C6    pop         edx
 006D22C7    pop         ecx
 006D22C8    pop         ecx
 006D22C9    mov         dword ptr fs:[eax],edx
>006D22CC    jmp         006D22E9
>006D22CE    jmp         @HandleOnException
 006D22D3    dd          1
 006D22D7    dd          00418C04;Exception
 006D22DB    dd          006D22DF
 006D22DF    call        004FA644
 006D22E4    call        @DoneExcept
 006D22E9    pop         edi
 006D22EA    pop         esi
 006D22EB    pop         ebx
 006D22EC    pop         ebp
 006D22ED    ret
*}
end.