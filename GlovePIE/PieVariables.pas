//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit PieVariables;

interface

uses
  SysUtils, Classes;

type
  TVariableExpression = class(TObjectValue)
  published
    function GetPerUnits2:TUnits;//005D1918
    function GetUnits:TUnits;//005D1A1C
    //procedure GetString(?:?);//005D19D0
    function GetPerUnits1:TUnits;//005D18EC
    function SetUnits(NewUnits:TUnits; NewPerUnits1:TUnits; NewPerUnits2:TUnits):Boolean;//005D1CB0
    procedure GetRotMat(m:TRotMat);//005D1944
    procedure SetMatrix(m:TRotMat);//005D1BB4
    procedure GetVector(x:Double; y:Double; z:Double);//005D1ADC
    //function SetVector(z:Double; ?:?; y:Double; ?:?; x:Double; ?:?):Boolean;//005D1D34
    function CanSet:Boolean;//005D18B8
    //function SetValue(NewValue:Double; ?:?):Boolean;//005D1CF8
    procedure GetDataType;//005D18E0
    procedure GetValue;//005D1A48
    function SetDataType(NewType:TDataType):Boolean;//005D1BA8
    procedure FillClone(c:TExpression);//005D18CC
    function SetString(NewValue:string):Boolean;//005D1C20
    //procedure ToString(?:?);//005D1DD0
    procedure CreateClone;//005D18BC
  public
    ............................................VariableNumber:Integer;//f20
    //procedure ToString(?:?); virtual;//005D1DD0
    procedure GetValue; virtual;//v2C//005D1A48
    //procedure GetString(?:?); virtual;//v38//005D19D0
    procedure GetVector(x:Double; y:Double; z:Double); virtual;//v3C//005D1ADC
    procedure GetRotMat(m:TRotMat); virtual;//v40//005D1944
    procedure GetDataType; virtual;//v44//005D18E0
    function GetUnits:TUnits; virtual;//v48//005D1A1C
    function GetPerUnits1:TUnits; virtual;//v4C//005D18EC
    function GetPerUnits2:TUnits; virtual;//v50//005D1918
    //function SetValue(NewValue:Double; ?:?):Boolean; virtual;//v58//005D1CF8
    function SetString(NewValue:string):Boolean; virtual;//v5C//005D1C20
    //function SetVector(z:Double; ?:?; y:Double; ?:?; x:Double; ?:?):Boolean; virtual;//v60//005D1D34
    procedure SetMatrix(m:TRotMat); virtual;//v64//005D1BB4
    function CanSet:Boolean; virtual;//v68//005D18B8
    procedure CreateClone; virtual;//v80//005D18BC
    procedure FillClone(c:TExpression); virtual;//v84//005D18CC
  end;
  :TVariable.:1 = array of Double;
//elSize = 8
//varType equivalent: varDouble;
  TVariable = class(TObject)
  published
    constructor Create;//005D1EA8
    function GetValue(index:Integer):Double;//005D1ED4
    //function SetValue(index:Integer; NewValue:Double; ?:?):Boolean;//005D1F60
  public
    value:Double;//f8
    fC:dword;//fC
    x:Double;//f10
    f14:dword;//f14
    y:Double;//f18
    f1C:dword;//f1C
    z:Double;//f20
    f24:dword;//f24
    m:TRotMat;//f28
    s:string;//f70
    DataType:TDataType;//f74
    Units:TUnits;//f75
    PerUnits1:TUnits;//f76
    PerUnits2:TUnits;//f77
    values::1;//f78
  end;
    procedure sub_005D178C;//005D178C
    procedure sub_005D17D8;//005D17D8
    //procedure sub_005D17F0(?:Integer; ?:?);//005D17F0
    //function sub_005D1808(?:UnicodeString):?;//005D1808
    //function sub_005D1858(?:Integer):?;//005D1858
    procedure sub_005D1884(?:Integer; ?:TDataType);//005D1884
    procedure sub_005D1FE8(?:TStrings);//005D1FE8
    //function sub_005D223C(?:UnicodeString):?;//005D223C
    //function sub_005D2308(?:UnicodeString):?;//005D2308

implementation

//005D178C
procedure sub_005D178C;
begin
{*
 005D178C    push        ebx
 005D178D    push        esi
 005D178E    mov         eax,[00815AB8];gvar_00815AB8:THashTable
 005D1793    call        THashTable.Count
 005D1798    mov         edx,eax
 005D179A    mov         eax,[00815ABC];gvar_00815ABC:TObjectList
 005D179F    call        TList.SetCapacity
 005D17A4    mov         eax,[00815AB8];gvar_00815AB8:THashTable
 005D17A9    call        THashTable.Count
 005D17AE    mov         ebx,eax
 005D17B0    dec         ebx
 005D17B1    test        ebx,ebx
>005D17B3    jl          005D17D4
 005D17B5    inc         ebx
 005D17B6    mov         esi,dword ptr ds:[815ABC];gvar_00815ABC:TObjectList
 005D17BC    mov         dl,1
 005D17BE    mov         eax,[005D1564];TVariable
 005D17C3    call        TVariable.Create;TVariable.Create
 005D17C8    mov         edx,eax
 005D17CA    mov         eax,esi
 005D17CC    call        TList.Add
 005D17D1    dec         ebx
>005D17D2    jne         005D17B6
 005D17D4    pop         esi
 005D17D5    pop         ebx
 005D17D6    ret
*}
end;

//005D17D8
procedure sub_005D17D8;
begin
{*
 005D17D8    mov         eax,[00815ABC];gvar_00815ABC:TObjectList
 005D17DD    mov         edx,dword ptr [eax]
 005D17DF    call        dword ptr [edx+8]
 005D17E2    mov         eax,[00815AB8];gvar_00815AB8:THashTable
 005D17E7    call        THashTable.Clear
 005D17EC    ret
*}
end;

//005D17F0
{*procedure sub_005D17F0(?:Integer; ?:?);
begin
 005D17F0    push        ebx
 005D17F1    push        esi
 005D17F2    mov         esi,edx
 005D17F4    mov         ebx,eax
 005D17F6    mov         ecx,esi
 005D17F8    mov         edx,ebx
 005D17FA    mov         eax,[00815AB8];gvar_00815AB8:THashTable
 005D17FF    call        THashTable.Get
 005D1804    pop         esi
 005D1805    pop         ebx
 005D1806    ret
end;*}

//005D1808
{*function sub_005D1808(?:UnicodeString):?;
begin
 005D1808    push        ebp
 005D1809    mov         ebp,esp
 005D180B    push        ecx
 005D180C    push        ebx
 005D180D    mov         dword ptr [ebp-4],eax
 005D1810    mov         eax,dword ptr [ebp-4]
 005D1813    call        @UStrAddRef
 005D1818    xor         eax,eax
 005D181A    push        ebp
 005D181B    push        5D184B
 005D1820    push        dword ptr fs:[eax]
 005D1823    mov         dword ptr fs:[eax],esp
 005D1826    mov         edx,dword ptr [ebp-4]
 005D1829    mov         eax,[00815AB8];gvar_00815AB8:THashTable
 005D182E    call        THashTable.GetOrAdd
 005D1833    mov         ebx,eax
 005D1835    xor         eax,eax
 005D1837    pop         edx
 005D1838    pop         ecx
 005D1839    pop         ecx
 005D183A    mov         dword ptr fs:[eax],edx
 005D183D    push        5D1852
 005D1842    lea         eax,[ebp-4]
 005D1845    call        @UStrClr
 005D184A    ret
>005D184B    jmp         @HandleFinally
>005D1850    jmp         005D1842
 005D1852    mov         eax,ebx
 005D1854    pop         ebx
 005D1855    pop         ecx
 005D1856    pop         ebp
 005D1857    ret
end;*}

//005D1858
{*function sub_005D1858(?:Integer):?;
begin
 005D1858    push        ebx
 005D1859    push        esi
 005D185A    mov         esi,eax
 005D185C    mov         ebx,dword ptr ds:[815ABC];gvar_00815ABC:TObjectList
 005D1862    mov         edx,esi
 005D1864    mov         eax,ebx
 005D1866    call        TList.Get
 005D186B    mov         ebx,eax
 005D186D    mov         eax,ebx
 005D186F    mov         edx,dword ptr ds:[5D1564];TVariable
 005D1875    call        @AsClass
 005D187A    movzx       eax,byte ptr [eax+74];TVariable.DataType:TDataType
 005D187E    pop         esi
 005D187F    pop         ebx
 005D1880    ret
end;*}

//005D1884
procedure sub_005D1884(?:Integer; ?:TDataType);
begin
{*
 005D1884    push        ebx
 005D1885    push        esi
 005D1886    push        ecx
 005D1887    mov         byte ptr [esp],dl
 005D188A    mov         esi,eax
 005D188C    mov         ebx,dword ptr ds:[815ABC];gvar_00815ABC:TObjectList
 005D1892    mov         edx,esi
 005D1894    mov         eax,ebx
 005D1896    call        TList.Get
 005D189B    mov         ebx,eax
 005D189D    mov         eax,ebx
 005D189F    mov         edx,dword ptr ds:[5D1564];TVariable
 005D18A5    call        @AsClass
 005D18AA    movzx       edx,byte ptr [esp]
 005D18AE    mov         byte ptr [eax+74],dl;TVariable.DataType:TDataType
 005D18B1    pop         edx
 005D18B2    pop         esi
 005D18B3    pop         ebx
 005D18B4    ret
*}
end;

//005D18B8
function TVariableExpression.CanSet:Boolean;
begin
{*
 005D18B8    mov         al,1
 005D18BA    ret
*}
end;

//005D18BC
procedure TVariableExpression.CreateClone;
begin
{*
 005D18BC    mov         dl,1
 005D18BE    mov         eax,[005D0F60];TVariableExpression
 005D18C3    call        TObject.Create;TVariableExpression.Create
 005D18C8    ret
*}
end;

//005D18CC
procedure TVariableExpression.FillClone(c:TExpression);
begin
{*
 005D18CC    push        ebx
 005D18CD    mov         ecx,edx
 005D18CF    mov         ebx,dword ptr [eax+18];TVariableExpression.................................................
 005D18D2    mov         dword ptr [ecx+18],ebx
 005D18D5    mov         eax,dword ptr [eax+20];TVariableExpression.................................................
 005D18D8    mov         dword ptr [ecx+20],eax
 005D18DB    pop         ebx
 005D18DC    ret
*}
end;

//005D18E0
procedure TVariableExpression.GetDataType;
begin
{*
 005D18E0    mov         eax,dword ptr [eax+20];TVariableExpression.................................................
 005D18E3    call        005D1858
 005D18E8    ret
*}
end;

//005D18EC
function TVariableExpression.GetPerUnits1:TUnits;
begin
{*
 005D18EC    push        ebx
 005D18ED    push        esi
 005D18EE    mov         ebx,eax
 005D18F0    mov         esi,dword ptr ds:[815ABC];gvar_00815ABC:TObjectList
 005D18F6    mov         edx,dword ptr [ebx+20];TVariableExpression.................................................
 005D18F9    mov         eax,esi
 005D18FB    call        TList.Get
 005D1900    mov         ebx,eax
 005D1902    mov         eax,ebx
 005D1904    mov         edx,dword ptr ds:[5D1564];TVariable
 005D190A    call        @AsClass
 005D190F    movzx       eax,byte ptr [eax+76];TVariable.PerUnits1:TUnits
 005D1913    pop         esi
 005D1914    pop         ebx
 005D1915    ret
*}
end;

//005D1918
function TVariableExpression.GetPerUnits2:TUnits;
begin
{*
 005D1918    push        ebx
 005D1919    push        esi
 005D191A    mov         ebx,eax
 005D191C    mov         esi,dword ptr ds:[815ABC];gvar_00815ABC:TObjectList
 005D1922    mov         edx,dword ptr [ebx+20];TVariableExpression.................................................
 005D1925    mov         eax,esi
 005D1927    call        TList.Get
 005D192C    mov         ebx,eax
 005D192E    mov         eax,ebx
 005D1930    mov         edx,dword ptr ds:[5D1564];TVariable
 005D1936    call        @AsClass
 005D193B    movzx       eax,byte ptr [eax+77];TVariable.PerUnits2:TUnits
 005D193F    pop         esi
 005D1940    pop         ebx
 005D1941    ret
*}
end;

//005D1944
procedure TVariableExpression.GetRotMat(m:TRotMat);
begin
{*
 005D1944    push        ebx
 005D1945    push        esi
 005D1946    push        edi
 005D1947    push        ebp
 005D1948    add         esp,0FFFFFFF4
 005D194B    mov         dword ptr [esp+4],edx
 005D194F    mov         dword ptr [esp],eax
 005D1952    mov         eax,dword ptr [esp]
 005D1955    mov         edx,dword ptr [eax]
 005D1957    call        dword ptr [edx+44]
 005D195A    cmp         al,6
>005D195C    jne         005D19BC
 005D195E    xor         ebp,ebp
 005D1960    mov         eax,dword ptr [esp+4]
 005D1964    mov         dword ptr [esp+8],eax
 005D1968    xor         esi,esi
 005D196A    mov         eax,dword ptr [esp+8]
 005D196E    mov         ebx,eax
 005D1970    mov         edi,dword ptr ds:[815ABC];gvar_00815ABC:TObjectList
 005D1976    mov         eax,dword ptr [esp]
 005D1979    mov         edx,dword ptr [eax+20]
 005D197C    mov         eax,edi
 005D197E    call        TList.Get
 005D1983    mov         edi,eax
 005D1985    mov         eax,edi
 005D1987    mov         edx,dword ptr ds:[5D1564];TVariable
 005D198D    call        @AsClass
 005D1992    lea         edx,[ebp+ebp*2]
 005D1996    lea         eax,[eax+edx*8]
 005D1999    mov         edx,dword ptr [eax+esi*8+28]
 005D199D    mov         dword ptr [ebx],edx
 005D199F    mov         edx,dword ptr [eax+esi*8+2C]
 005D19A3    mov         dword ptr [ebx+4],edx
 005D19A6    inc         esi
 005D19A7    add         ebx,8
 005D19AA    cmp         esi,3
>005D19AD    jne         005D1970
 005D19AF    inc         ebp
 005D19B0    add         dword ptr [esp+8],18
 005D19B5    cmp         ebp,3
>005D19B8    jne         005D1968
>005D19BA    jmp         005D19C8
 005D19BC    mov         edx,dword ptr [esp+4]
 005D19C0    mov         eax,dword ptr [esp]
 005D19C3    call        TExpression.GetRotMat
 005D19C8    add         esp,0C
 005D19CB    pop         ebp
 005D19CC    pop         edi
 005D19CD    pop         esi
 005D19CE    pop         ebx
 005D19CF    ret
*}
end;

//005D19D0
{*procedure TVariableExpression.GetString(?:?);
begin
 005D19D0    push        ebx
 005D19D1    push        esi
 005D19D2    push        edi
 005D19D3    mov         esi,edx
 005D19D5    mov         ebx,eax
 005D19D7    mov         eax,ebx
 005D19D9    mov         edx,dword ptr [eax]
 005D19DB    call        dword ptr [edx+44];TVariableExpression.GetDataType
 005D19DE    cmp         al,4
>005D19E0    jne         005D1A0D
 005D19E2    mov         edi,dword ptr ds:[815ABC];gvar_00815ABC:TObjectList
 005D19E8    mov         edx,dword ptr [ebx+20];TVariableExpression.................................................
 005D19EB    mov         eax,edi
 005D19ED    call        TList.Get
 005D19F2    mov         ebx,eax
 005D19F4    mov         eax,ebx
 005D19F6    mov         edx,dword ptr ds:[5D1564];TVariable
 005D19FC    call        @AsClass
 005D1A01    mov         edx,dword ptr [eax+70];TVariable.s:string
 005D1A04    mov         eax,esi
 005D1A06    call        @UStrAsg
>005D1A0B    jmp         005D1A16
 005D1A0D    mov         edx,esi
 005D1A0F    mov         eax,ebx
 005D1A11    call        TExpression.GetString
 005D1A16    pop         edi
 005D1A17    pop         esi
 005D1A18    pop         ebx
 005D1A19    ret
end;*}

//005D1A1C
function TVariableExpression.GetUnits:TUnits;
begin
{*
 005D1A1C    push        ebx
 005D1A1D    push        esi
 005D1A1E    mov         ebx,eax
 005D1A20    mov         esi,dword ptr ds:[815ABC];gvar_00815ABC:TObjectList
 005D1A26    mov         edx,dword ptr [ebx+20];TVariableExpression.................................................
 005D1A29    mov         eax,esi
 005D1A2B    call        TList.Get
 005D1A30    mov         ebx,eax
 005D1A32    mov         eax,ebx
 005D1A34    mov         edx,dword ptr ds:[5D1564];TVariable
 005D1A3A    call        @AsClass
 005D1A3F    movzx       eax,byte ptr [eax+75];TVariable.Units:TUnits
 005D1A43    pop         esi
 005D1A44    pop         ebx
 005D1A45    ret
*}
end;

//005D1A48
procedure TVariableExpression.GetValue;
begin
{*
 005D1A48    push        ebx
 005D1A49    push        esi
 005D1A4A    add         esp,0FFFFFFE0
 005D1A4D    mov         ebx,eax
 005D1A4F    mov         eax,ebx
 005D1A51    mov         edx,dword ptr [eax]
 005D1A53    call        dword ptr [edx+44];TVariableExpression.GetDataType
 005D1A56    cmp         al,4
>005D1A58    jne         005D1A65
 005D1A5A    xor         eax,eax
 005D1A5C    mov         dword ptr [esp],eax
 005D1A5F    mov         dword ptr [esp+4],eax
>005D1A63    jmp         005D1AD2
 005D1A65    mov         eax,ebx
 005D1A67    mov         edx,dword ptr [eax]
 005D1A69    call        dword ptr [edx+44];TVariableExpression.GetDataType
 005D1A6C    cmp         al,5
>005D1A6E    jne         005D1AA7
 005D1A70    lea         eax,[esp+18]
 005D1A74    push        eax
 005D1A75    lea         ecx,[esp+14]
 005D1A79    lea         edx,[esp+0C]
 005D1A7D    mov         eax,ebx
 005D1A7F    mov         ebx,dword ptr [eax]
 005D1A81    call        dword ptr [ebx+3C];TVariableExpression.GetVector
 005D1A84    push        dword ptr [esp+0C]
 005D1A88    push        dword ptr [esp+0C]
 005D1A8C    push        dword ptr [esp+1C]
 005D1A90    push        dword ptr [esp+1C]
 005D1A94    push        dword ptr [esp+2C]
 005D1A98    push        dword ptr [esp+2C]
 005D1A9C    call        005C4070
 005D1AA1    fstp        qword ptr [esp]
 005D1AA4    wait
>005D1AA5    jmp         005D1AD2
 005D1AA7    mov         esi,dword ptr ds:[815ABC];gvar_00815ABC:TObjectList
 005D1AAD    mov         edx,dword ptr [ebx+20];TVariableExpression.................................................
 005D1AB0    mov         eax,esi
 005D1AB2    call        TList.Get
 005D1AB7    mov         esi,eax
 005D1AB9    mov         eax,esi
 005D1ABB    mov         edx,dword ptr ds:[5D1564];TVariable
 005D1AC1    call        @AsClass
 005D1AC6    mov         edx,dword ptr [ebx+18];TVariableExpression.................................................
 005D1AC9    call        TVariable.GetValue
 005D1ACE    fstp        qword ptr [esp]
 005D1AD1    wait
 005D1AD2    fld         qword ptr [esp]
 005D1AD5    add         esp,20
 005D1AD8    pop         esi
 005D1AD9    pop         ebx
 005D1ADA    ret
*}
end;

//005D1ADC
procedure TVariableExpression.GetVector(x:Double; y:Double; z:Double);
begin
{*
 005D1ADC    push        ebp
 005D1ADD    mov         ebp,esp
 005D1ADF    add         esp,0FFFFFFF8
 005D1AE2    push        ebx
 005D1AE3    push        esi
 005D1AE4    push        edi
 005D1AE5    mov         edi,ecx
 005D1AE7    mov         esi,edx
 005D1AE9    mov         ebx,eax
 005D1AEB    mov         eax,ebx
 005D1AED    mov         edx,dword ptr [eax]
 005D1AEF    call        dword ptr [edx+44];TVariableExpression.GetDataType
 005D1AF2    cmp         al,5
>005D1AF4    jne         005D1B82
 005D1AFA    mov         eax,[00815ABC];gvar_00815ABC:TObjectList
 005D1AFF    mov         dword ptr [ebp-4],eax
 005D1B02    mov         edx,dword ptr [ebx+20];TVariableExpression.................................................
 005D1B05    mov         eax,dword ptr [ebp-4]
 005D1B08    call        TList.Get
 005D1B0D    mov         dword ptr [ebp-8],eax
 005D1B10    mov         eax,dword ptr [ebp-8]
 005D1B13    mov         edx,dword ptr ds:[5D1564];TVariable
 005D1B19    call        @AsClass
 005D1B1E    mov         edx,dword ptr [eax+10];TVariable.x:Double
 005D1B21    mov         dword ptr [esi],edx
 005D1B23    mov         edx,dword ptr [eax+14];TVariable.?f14:dword
 005D1B26    mov         dword ptr [esi+4],edx
 005D1B29    mov         esi,dword ptr ds:[815ABC];gvar_00815ABC:TObjectList
 005D1B2F    mov         edx,dword ptr [ebx+20];TVariableExpression.................................................
 005D1B32    mov         eax,esi
 005D1B34    call        TList.Get
 005D1B39    mov         esi,eax
 005D1B3B    mov         eax,esi
 005D1B3D    mov         edx,dword ptr ds:[5D1564];TVariable
 005D1B43    call        @AsClass
 005D1B48    mov         edx,dword ptr [eax+18];TVariable.y:Double
 005D1B4B    mov         dword ptr [edi],edx
 005D1B4D    mov         edx,dword ptr [eax+1C];TVariable.?f1C:dword
 005D1B50    mov         dword ptr [edi+4],edx
 005D1B53    mov         esi,dword ptr ds:[815ABC];gvar_00815ABC:TObjectList
 005D1B59    mov         edx,dword ptr [ebx+20];TVariableExpression.................................................
 005D1B5C    mov         eax,esi
 005D1B5E    call        TList.Get
 005D1B63    mov         ebx,eax
 005D1B65    mov         eax,ebx
 005D1B67    mov         edx,dword ptr ds:[5D1564];TVariable
 005D1B6D    call        @AsClass
 005D1B72    mov         edx,dword ptr [ebp+8]
 005D1B75    mov         ecx,dword ptr [eax+20];TVariable.z:Double
 005D1B78    mov         dword ptr [edx],ecx
 005D1B7A    mov         ecx,dword ptr [eax+24];TVariable.?f24:dword
 005D1B7D    mov         dword ptr [edx+4],ecx
>005D1B80    jmp         005D1B9D
 005D1B82    xor         eax,eax
 005D1B84    mov         dword ptr [esi],eax
 005D1B86    mov         dword ptr [esi+4],eax
 005D1B89    xor         eax,eax
 005D1B8B    mov         dword ptr [edi],eax
 005D1B8D    mov         dword ptr [edi+4],eax
 005D1B90    mov         eax,ebx
 005D1B92    mov         edx,dword ptr [eax]
 005D1B94    call        dword ptr [edx+2C];TVariableExpression.GetValue
 005D1B97    mov         eax,dword ptr [ebp+8]
 005D1B9A    fstp        qword ptr [eax]
 005D1B9C    wait
 005D1B9D    pop         edi
 005D1B9E    pop         esi
 005D1B9F    pop         ebx
 005D1BA0    pop         ecx
 005D1BA1    pop         ecx
 005D1BA2    pop         ebp
 005D1BA3    ret         4
*}
end;

//005D1BA8
function TVariableExpression.SetDataType(NewType:TDataType):Boolean;
begin
{*
 005D1BA8    mov         eax,dword ptr [eax+20];TVariableExpression.................................................
 005D1BAB    call        005D1884
 005D1BB0    mov         al,1
 005D1BB2    ret
*}
end;

//005D1BB4
procedure TVariableExpression.SetMatrix(m:TRotMat);
begin
{*
 005D1BB4    push        ebx
 005D1BB5    push        esi
 005D1BB6    push        edi
 005D1BB7    add         esp,0FFFFFFB8
 005D1BBA    mov         esi,edx
 005D1BBC    lea         edi,[esp]
 005D1BBF    mov         ecx,12
 005D1BC4    rep movs    dword ptr [edi],dword ptr [esi]
 005D1BC6    mov         ebx,eax
 005D1BC8    mov         esi,dword ptr ds:[815ABC];gvar_00815ABC:TObjectList
 005D1BCE    mov         edx,dword ptr [ebx+20];TVariableExpression.................................................
 005D1BD1    mov         eax,esi
 005D1BD3    call        TList.Get
 005D1BD8    mov         esi,eax
 005D1BDA    mov         eax,esi
 005D1BDC    mov         edx,dword ptr ds:[5D1564];TVariable
 005D1BE2    call        @AsClass
 005D1BE7    lea         edi,[eax+28];TVariable.m:TRotMat
 005D1BEA    mov         esi,esp
 005D1BEC    mov         ecx,12
 005D1BF1    rep movs    dword ptr [edi],dword ptr [esi]
 005D1BF3    mov         esi,dword ptr ds:[815ABC];gvar_00815ABC:TObjectList
 005D1BF9    mov         edx,dword ptr [ebx+20];TVariableExpression.................................................
 005D1BFC    mov         eax,esi
 005D1BFE    call        TList.Get
 005D1C03    mov         ebx,eax
 005D1C05    mov         eax,ebx
 005D1C07    mov         edx,dword ptr ds:[5D1564];TVariable
 005D1C0D    call        @AsClass
 005D1C12    mov         byte ptr [eax+74],6;TVariable.DataType:TDataType
 005D1C16    mov         al,1
 005D1C18    add         esp,48
 005D1C1B    pop         edi
 005D1C1C    pop         esi
 005D1C1D    pop         ebx
 005D1C1E    ret
*}
end;

//005D1C20
function TVariableExpression.SetString(NewValue:string):Boolean;
begin
{*
 005D1C20    push        ebp
 005D1C21    mov         ebp,esp
 005D1C23    push        ecx
 005D1C24    push        ebx
 005D1C25    push        esi
 005D1C26    mov         dword ptr [ebp-4],edx
 005D1C29    mov         ebx,eax
 005D1C2B    mov         eax,dword ptr [ebp-4]
 005D1C2E    call        @UStrAddRef
 005D1C33    xor         eax,eax
 005D1C35    push        ebp
 005D1C36    push        5D1CA1
 005D1C3B    push        dword ptr fs:[eax]
 005D1C3E    mov         dword ptr fs:[eax],esp
 005D1C41    mov         esi,dword ptr ds:[815ABC];gvar_00815ABC:TObjectList
 005D1C47    mov         edx,dword ptr [ebx+20];TVariableExpression.................................................
 005D1C4A    mov         eax,esi
 005D1C4C    call        TList.Get
 005D1C51    mov         ebx,eax
 005D1C53    mov         eax,ebx
 005D1C55    mov         edx,dword ptr ds:[5D1564];TVariable
 005D1C5B    call        @AsClass
 005D1C60    mov         ebx,eax
 005D1C62    lea         eax,[ebx+70];TVariable.s:string
 005D1C65    mov         edx,dword ptr [ebp-4]
 005D1C68    call        @UStrAsg
 005D1C6D    push        0FFFF
 005D1C72    push        0C0000000
 005D1C77    push        0
 005D1C79    mov         eax,dword ptr [ebp-4]
 005D1C7C    call        004F8DB8
 005D1C81    fstp        qword ptr [ebx+8];TVariable.value:Double
 005D1C84    wait
 005D1C85    mov         byte ptr [ebx+74],4;TVariable.DataType:TDataType
 005D1C89    mov         bl,1
 005D1C8B    xor         eax,eax
 005D1C8D    pop         edx
 005D1C8E    pop         ecx
 005D1C8F    pop         ecx
 005D1C90    mov         dword ptr fs:[eax],edx
 005D1C93    push        5D1CA8
 005D1C98    lea         eax,[ebp-4]
 005D1C9B    call        @UStrClr
 005D1CA0    ret
>005D1CA1    jmp         @HandleFinally
>005D1CA6    jmp         005D1C98
 005D1CA8    mov         eax,ebx
 005D1CAA    pop         esi
 005D1CAB    pop         ebx
 005D1CAC    pop         ecx
 005D1CAD    pop         ebp
 005D1CAE    ret
*}
end;

//005D1CB0
function TVariableExpression.SetUnits(NewUnits:TUnits; NewPerUnits1:TUnits; NewPerUnits2:TUnits):Boolean;
begin
{*
 005D1CB0    push        ebp
 005D1CB1    mov         ebp,esp
 005D1CB3    push        ecx
 005D1CB4    push        ebx
 005D1CB5    push        esi
 005D1CB6    push        edi
 005D1CB7    mov         byte ptr [ebp-1],cl
 005D1CBA    mov         ebx,edx
 005D1CBC    mov         edi,eax
 005D1CBE    mov         esi,dword ptr ds:[815ABC];gvar_00815ABC:TObjectList
 005D1CC4    mov         edx,dword ptr [edi+20];TVariableExpression.................................................
 005D1CC7    mov         eax,esi
 005D1CC9    call        TList.Get
 005D1CCE    mov         esi,eax
 005D1CD0    mov         eax,esi
 005D1CD2    mov         edx,dword ptr ds:[5D1564];TVariable
 005D1CD8    call        @AsClass
 005D1CDD    mov         byte ptr [eax+75],bl;TVariable.Units:TUnits
 005D1CE0    movzx       edx,byte ptr [ebp-1]
 005D1CE4    mov         byte ptr [eax+76],dl;TVariable.PerUnits1:TUnits
 005D1CE7    movzx       edx,byte ptr [ebp+8]
 005D1CEB    mov         byte ptr [eax+77],dl;TVariable.PerUnits2:TUnits
 005D1CEE    mov         al,1
 005D1CF0    pop         edi
 005D1CF1    pop         esi
 005D1CF2    pop         ebx
 005D1CF3    pop         ecx
 005D1CF4    pop         ebp
 005D1CF5    ret         4
*}
end;

//005D1CF8
{*function TVariableExpression.SetValue(NewValue:Double; ?:?):Boolean;
begin
 005D1CF8    push        ebp
 005D1CF9    mov         ebp,esp
 005D1CFB    push        ebx
 005D1CFC    push        esi
 005D1CFD    mov         ebx,eax
 005D1CFF    mov         esi,dword ptr ds:[815ABC];gvar_00815ABC:TObjectList
 005D1D05    mov         edx,dword ptr [ebx+20];TVariableExpression.................................................
 005D1D08    mov         eax,esi
 005D1D0A    call        TList.Get
 005D1D0F    mov         esi,eax
 005D1D11    push        dword ptr [ebp+0C]
 005D1D14    push        dword ptr [ebp+8]
 005D1D17    mov         eax,esi
 005D1D19    mov         edx,dword ptr ds:[5D1564];TVariable
 005D1D1F    call        @AsClass
 005D1D24    mov         edx,dword ptr [ebx+18];TVariableExpression.................................................
 005D1D27    call        TVariable.SetValue
 005D1D2C    mov         al,1
 005D1D2E    pop         esi
 005D1D2F    pop         ebx
 005D1D30    pop         ebp
 005D1D31    ret         8
end;*}

//005D1D34
{*function TVariableExpression.SetVector(z:Double; ?:?; y:Double; ?:?; x:Double; ?:?):Boolean;
begin
 005D1D34    push        ebp
 005D1D35    mov         ebp,esp
 005D1D37    push        ebx
 005D1D38    push        esi
 005D1D39    mov         ebx,eax
 005D1D3B    mov         esi,dword ptr ds:[815ABC];gvar_00815ABC:TObjectList
 005D1D41    mov         edx,dword ptr [ebx+20];TVariableExpression.................................................
 005D1D44    mov         eax,esi
 005D1D46    call        TList.Get
 005D1D4B    mov         esi,eax
 005D1D4D    mov         eax,esi
 005D1D4F    mov         edx,dword ptr ds:[5D1564];TVariable
 005D1D55    call        @AsClass
 005D1D5A    mov         edx,dword ptr [ebp+18]
 005D1D5D    mov         dword ptr [eax+10],edx;TVariable.x:Double
 005D1D60    mov         edx,dword ptr [ebp+1C]
 005D1D63    mov         dword ptr [eax+14],edx;TVariable.?f14:dword
 005D1D66    mov         esi,dword ptr ds:[815ABC];gvar_00815ABC:TObjectList
 005D1D6C    mov         edx,dword ptr [ebx+20];TVariableExpression.................................................
 005D1D6F    mov         eax,esi
 005D1D71    call        TList.Get
 005D1D76    mov         esi,eax
 005D1D78    mov         eax,esi
 005D1D7A    mov         edx,dword ptr ds:[5D1564];TVariable
 005D1D80    call        @AsClass
 005D1D85    mov         edx,dword ptr [ebp+10]
 005D1D88    mov         dword ptr [eax+18],edx;TVariable.y:Double
 005D1D8B    mov         edx,dword ptr [ebp+14]
 005D1D8E    mov         dword ptr [eax+1C],edx;TVariable.?f1C:dword
 005D1D91    mov         esi,dword ptr ds:[815ABC];gvar_00815ABC:TObjectList
 005D1D97    mov         edx,dword ptr [ebx+20];TVariableExpression.................................................
 005D1D9A    mov         eax,esi
 005D1D9C    call        TList.Get
 005D1DA1    mov         esi,eax
 005D1DA3    mov         eax,esi
 005D1DA5    mov         edx,dword ptr ds:[5D1564];TVariable
 005D1DAB    call        @AsClass
 005D1DB0    mov         edx,dword ptr [ebp+8]
 005D1DB3    mov         dword ptr [eax+20],edx;TVariable.z:Double
 005D1DB6    mov         edx,dword ptr [ebp+0C]
 005D1DB9    mov         dword ptr [eax+24],edx;TVariable.?f24:dword
 005D1DBC    mov         dl,5
 005D1DBE    mov         eax,ebx
 005D1DC0    call        TVariableExpression.SetDataType
 005D1DC5    mov         al,1
 005D1DC7    pop         esi
 005D1DC8    pop         ebx
 005D1DC9    pop         ebp
 005D1DCA    ret         18
end;*}

//005D1DD0
{*procedure TVariableExpression.ToString(?:?);
begin
 005D1DD0    push        ebp
 005D1DD1    mov         ebp,esp
 005D1DD3    push        0
 005D1DD5    push        0
 005D1DD7    push        0
 005D1DD9    push        ebx
 005D1DDA    push        esi
 005D1DDB    push        edi
 005D1DDC    mov         esi,edx
 005D1DDE    mov         ebx,eax
 005D1DE0    xor         eax,eax
 005D1DE2    push        ebp
 005D1DE3    push        5D1E5D
 005D1DE8    push        dword ptr fs:[eax]
 005D1DEB    mov         dword ptr fs:[eax],esp
 005D1DEE    mov         edi,dword ptr [ebx+18];TVariableExpression.................................................
 005D1DF1    test        edi,edi
>005D1DF3    jge         005D1E11
 005D1DF5    lea         edx,[ebp-4]
 005D1DF8    mov         eax,dword ptr [ebx+20];TVariableExpression.................................................
 005D1DFB    call        005D17F0
 005D1E00    mov         ecx,dword ptr [ebp-4]
 005D1E03    mov         eax,esi
 005D1E05    mov         edx,5D1E78;'Var.'
 005D1E0A    call        @UStrCat3
>005D1E0F    jmp         005D1E42
 005D1E11    push        5D1E90;'Var'
 005D1E16    lea         edx,[ebp-8]
 005D1E19    mov         eax,edi
 005D1E1B    call        IntToStr
 005D1E20    push        dword ptr [ebp-8]
 005D1E23    push        5D1EA4;'.'
 005D1E28    lea         edx,[ebp-0C]
 005D1E2B    mov         eax,dword ptr [ebx+20];TVariableExpression.................................................
 005D1E2E    call        005D17F0
 005D1E33    push        dword ptr [ebp-0C]
 005D1E36    mov         eax,esi
 005D1E38    mov         edx,4
 005D1E3D    call        @UStrCatN
 005D1E42    xor         eax,eax
 005D1E44    pop         edx
 005D1E45    pop         ecx
 005D1E46    pop         ecx
 005D1E47    mov         dword ptr fs:[eax],edx
 005D1E4A    push        5D1E64
 005D1E4F    lea         eax,[ebp-0C]
 005D1E52    mov         edx,3
 005D1E57    call        @UStrArrayClr
 005D1E5C    ret
>005D1E5D    jmp         @HandleFinally
>005D1E62    jmp         005D1E4F
 005D1E64    pop         edi
 005D1E65    pop         esi
 005D1E66    pop         ebx
 005D1E67    mov         esp,ebp
 005D1E69    pop         ebp
 005D1E6A    ret
end;*}

//005D1EA8
constructor TVariable.Create;
begin
{*
 005D1EA8    test        dl,dl
>005D1EAA    je          005D1EB4
 005D1EAC    add         esp,0FFFFFFF0
 005D1EAF    call        @ClassCreate
 005D1EB4    xor         ecx,ecx
 005D1EB6    mov         dword ptr [eax+8],ecx;TVariable.value:Double
 005D1EB9    mov         dword ptr [eax+0C],ecx;TVariable.?fC:dword
 005D1EBC    mov         byte ptr [eax+74],0;TVariable.DataType:TDataType
 005D1EC0    test        dl,dl
>005D1EC2    je          005D1ED3
 005D1EC4    call        @AfterConstruction
 005D1EC9    pop         dword ptr fs:[0]
 005D1ED0    add         esp,0C
 005D1ED3    ret
*}
end;

//005D1ED4
function TVariable.GetValue(index:Integer):Double;
begin
{*
 005D1ED4    push        ebx
 005D1ED5    push        esi
 005D1ED6    push        edi
 005D1ED7    add         esp,0FFFFFFF8
 005D1EDA    mov         esi,edx
 005D1EDC    mov         ebx,eax
 005D1EDE    test        esi,esi
>005D1EE0    jge         005D1EF1
 005D1EE2    mov         eax,dword ptr [ebx+8];TVariable.value:Double
 005D1EE5    mov         dword ptr [esp],eax
 005D1EE8    mov         eax,dword ptr [ebx+0C];TVariable.?fC:dword
 005D1EEB    mov         dword ptr [esp+4],eax
>005D1EEF    jmp         005D1F54
 005D1EF1    mov         eax,dword ptr [ebx+78];TVariable.values::1
 005D1EF4    call        @DynArrayHigh
 005D1EF9    cmp         esi,eax
>005D1EFB    jle         005D1F43
 005D1EFD    mov         eax,dword ptr [ebx+78];TVariable.values::1
 005D1F00    call        @DynArrayHigh
 005D1F05    mov         edi,eax
 005D1F07    inc         edi
 005D1F08    lea         eax,[esi+1]
 005D1F0B    push        eax
 005D1F0C    lea         eax,[ebx+78];TVariable.values::1
 005D1F0F    mov         ecx,1
 005D1F14    mov         edx,dword ptr ds:[5D152C];:TVariable.:1
 005D1F1A    call        @DynArraySetLength
 005D1F1F    add         esp,4
 005D1F22    mov         edx,edi
 005D1F24    push        edx
 005D1F25    mov         eax,dword ptr [ebx+78];TVariable.values::1
 005D1F28    call        @DynArrayHigh
 005D1F2D    pop         edx
 005D1F2E    sub         eax,edx
>005D1F30    jl          005D1F43
 005D1F32    inc         eax
 005D1F33    mov         ecx,dword ptr [ebx+78];TVariable.values::1
 005D1F36    xor         edi,edi
 005D1F38    mov         dword ptr [ecx+edx*8],edi
 005D1F3B    mov         dword ptr [ecx+edx*8+4],edi
 005D1F3F    inc         edx
 005D1F40    dec         eax
>005D1F41    jne         005D1F33
 005D1F43    mov         eax,dword ptr [ebx+78];TVariable.values::1
 005D1F46    mov         edx,dword ptr [eax+esi*8]
 005D1F49    mov         dword ptr [esp],edx
 005D1F4C    mov         edx,dword ptr [eax+esi*8+4]
 005D1F50    mov         dword ptr [esp+4],edx
 005D1F54    fld         qword ptr [esp]
 005D1F57    pop         ecx
 005D1F58    pop         edx
 005D1F59    pop         edi
 005D1F5A    pop         esi
 005D1F5B    pop         ebx
 005D1F5C    ret
*}
end;

//005D1F60
{*function TVariable.SetValue(index:Integer; NewValue:Double; ?:?):Boolean;
begin
 005D1F60    push        ebp
 005D1F61    mov         ebp,esp
 005D1F63    push        ebx
 005D1F64    push        esi
 005D1F65    push        edi
 005D1F66    mov         esi,edx
 005D1F68    mov         ebx,eax
 005D1F6A    test        esi,esi
>005D1F6C    jge         005D1F7C
 005D1F6E    mov         eax,dword ptr [ebp+8]
 005D1F71    mov         dword ptr [ebx+8],eax;TVariable.value:Double
 005D1F74    mov         eax,dword ptr [ebp+0C]
 005D1F77    mov         dword ptr [ebx+0C],eax;TVariable.?fC:dword
>005D1F7A    jmp         005D1FDE
 005D1F7C    mov         eax,dword ptr [ebx+78];TVariable.values::1
 005D1F7F    call        @DynArrayHigh
 005D1F84    cmp         esi,eax
>005D1F86    jle         005D1FCE
 005D1F88    mov         eax,dword ptr [ebx+78];TVariable.values::1
 005D1F8B    call        @DynArrayHigh
 005D1F90    mov         edi,eax
 005D1F92    inc         edi
 005D1F93    lea         eax,[esi+1]
 005D1F96    push        eax
 005D1F97    lea         eax,[ebx+78];TVariable.values::1
 005D1F9A    mov         ecx,1
 005D1F9F    mov         edx,dword ptr ds:[5D152C];:TVariable.:1
 005D1FA5    call        @DynArraySetLength
 005D1FAA    add         esp,4
 005D1FAD    mov         edx,edi
 005D1FAF    push        edx
 005D1FB0    mov         eax,dword ptr [ebx+78];TVariable.values::1
 005D1FB3    call        @DynArrayHigh
 005D1FB8    pop         edx
 005D1FB9    sub         eax,edx
>005D1FBB    jl          005D1FCE
 005D1FBD    inc         eax
 005D1FBE    mov         ecx,dword ptr [ebx+78];TVariable.values::1
 005D1FC1    xor         edi,edi
 005D1FC3    mov         dword ptr [ecx+edx*8],edi
 005D1FC6    mov         dword ptr [ecx+edx*8+4],edi
 005D1FCA    inc         edx
 005D1FCB    dec         eax
>005D1FCC    jne         005D1FBE
 005D1FCE    mov         eax,dword ptr [ebx+78];TVariable.values::1
 005D1FD1    mov         edx,dword ptr [ebp+8]
 005D1FD4    mov         dword ptr [eax+esi*8],edx
 005D1FD7    mov         edx,dword ptr [ebp+0C]
 005D1FDA    mov         dword ptr [eax+esi*8+4],edx
 005D1FDE    mov         al,1
 005D1FE0    pop         edi
 005D1FE1    pop         esi
 005D1FE2    pop         ebx
 005D1FE3    pop         ebp
 005D1FE4    ret         8
end;*}

//005D1FE8
procedure sub_005D1FE8(?:TStrings);
begin
{*
 005D1FE8    push        ebp
 005D1FE9    mov         ebp,esp
 005D1FEB    add         esp,0FFFFFFD4
 005D1FEE    push        ebx
 005D1FEF    push        esi
 005D1FF0    push        edi
 005D1FF1    xor         edx,edx
 005D1FF3    mov         dword ptr [ebp-28],edx
 005D1FF6    mov         dword ptr [ebp-2C],edx
 005D1FF9    mov         dword ptr [ebp-24],edx
 005D1FFC    mov         dword ptr [ebp-4],edx
 005D1FFF    mov         dword ptr [ebp-8],edx
 005D2002    mov         dword ptr [ebp-0C],eax
 005D2005    xor         eax,eax
 005D2007    push        ebp
 005D2008    push        5D21D3
 005D200D    push        dword ptr fs:[eax]
 005D2010    mov         dword ptr fs:[eax],esp
 005D2013    mov         eax,dword ptr [ebp-0C]
 005D2016    mov         edx,dword ptr [eax]
 005D2018    call        dword ptr [edx+44]
 005D201B    mov         eax,[00815AB8];gvar_00815AB8:THashTable
 005D2020    call        THashTable.Count
 005D2025    mov         esi,eax
 005D2027    dec         esi
 005D2028    test        esi,esi
>005D202A    jl          005D21AB
 005D2030    inc         esi
 005D2031    xor         ebx,ebx
 005D2033    mov         edi,dword ptr ds:[815ABC];gvar_00815ABC:TObjectList
 005D2039    mov         edx,ebx
 005D203B    mov         eax,edi
 005D203D    call        TList.Get
 005D2042    mov         edi,eax
 005D2044    mov         eax,edi
 005D2046    mov         edx,dword ptr ds:[5D1564];TVariable
 005D204C    call        @AsClass
 005D2051    movzx       eax,byte ptr [eax+74];TVariable.DataType:TDataType
 005D2055    sub         al,2
>005D2057    je          005D20F7
 005D205D    dec         al
>005D205F    je          005D2097
 005D2061    dec         al
>005D2063    jne         005D2129
 005D2069    mov         edi,dword ptr ds:[815ABC];gvar_00815ABC:TObjectList
 005D206F    mov         edx,ebx
 005D2071    mov         eax,edi
 005D2073    call        TList.Get
 005D2078    mov         edi,eax
 005D207A    mov         eax,edi
 005D207C    mov         edx,dword ptr ds:[5D1564];TVariable
 005D2082    call        @AsClass
 005D2087    mov         edx,dword ptr [eax+70];TVariable.s:string
 005D208A    lea         eax,[ebp-4]
 005D208D    call        @UStrLAsg
>005D2092    jmp         005D2171
 005D2097    mov         edi,dword ptr ds:[815ABC];gvar_00815ABC:TObjectList
 005D209D    mov         edx,ebx
 005D209F    mov         eax,edi
 005D20A1    call        TList.Get
 005D20A6    mov         edi,eax
 005D20A8    mov         eax,edi
 005D20AA    mov         edx,dword ptr ds:[5D1564];TVariable
 005D20B0    call        @AsClass
 005D20B5    push        dword ptr [eax+0C];TVariable.?fC:dword
 005D20B8    push        dword ptr [eax+8];TVariable.value:Double
 005D20BB    call        00686060
 005D20C0    lea         ecx,[ebp-4]
 005D20C3    mov         dl,1
 005D20C5    call        BoolToStr
 005D20CA    lea         edx,[ebp-24]
 005D20CD    mov         eax,dword ptr [ebp-4]
 005D20D0    call        LowerCase
 005D20D5    mov         eax,dword ptr [ebp-24]
 005D20D8    mov         edx,5D21F0;'true'
 005D20DD    call        @UStrEqual
>005D20E2    jne         005D2171
 005D20E8    lea         eax,[ebp-4]
 005D20EB    mov         edx,5D2208;'***** TRUE *****'
 005D20F0    call        @UStrLAsg
>005D20F5    jmp         005D2171
 005D20F7    mov         edi,dword ptr ds:[815ABC];gvar_00815ABC:TObjectList
 005D20FD    mov         edx,ebx
 005D20FF    mov         eax,edi
 005D2101    call        TList.Get
 005D2106    mov         edi,eax
 005D2108    mov         eax,edi
 005D210A    mov         edx,dword ptr ds:[5D1564];TVariable
 005D2110    call        @AsClass
 005D2115    fld         qword ptr [eax+8];TVariable.value:Double
 005D2118    call        @ROUND
 005D211D    push        edx
 005D211E    push        eax
 005D211F    lea         eax,[ebp-4]
 005D2122    call        IntToStr
>005D2127    jmp         005D2171
 005D2129    mov         edi,dword ptr ds:[815ABC];gvar_00815ABC:TObjectList
 005D212F    mov         edx,ebx
 005D2131    mov         eax,edi
 005D2133    call        TList.Get
 005D2138    mov         edi,eax
 005D213A    mov         eax,edi
 005D213C    mov         edx,dword ptr ds:[5D1564];TVariable
 005D2142    call        @AsClass
 005D2147    fld         qword ptr [eax+8];TVariable.value:Double
 005D214A    fstp        tbyte ptr [ebp-20]
 005D214D    wait
 005D214E    movzx       eax,word ptr [ebp-18]
 005D2152    push        eax
 005D2153    push        dword ptr [ebp-1C]
 005D2156    push        dword ptr [ebp-20]
 005D2159    lea         edx,[ebp-8]
 005D215C    mov         eax,[0078D6A8];^gvar_00790CDC:TFormatSettings
 005D2161    call        FloatToStr
 005D2166    lea         eax,[ebp-4]
 005D2169    mov         edx,dword ptr [ebp-8]
 005D216C    call        @UStrLAsg
 005D2171    lea         ecx,[ebp-2C]
 005D2174    mov         edx,ebx
 005D2176    mov         eax,[00815AB8];gvar_00815AB8:THashTable
 005D217B    call        THashTable.Get
 005D2180    push        dword ptr [ebp-2C]
 005D2183    push        5D2238;'='
 005D2188    push        dword ptr [ebp-4]
 005D218B    lea         eax,[ebp-28]
 005D218E    mov         edx,3
 005D2193    call        @UStrCatN
 005D2198    mov         edx,dword ptr [ebp-28]
 005D219B    mov         eax,dword ptr [ebp-0C]
 005D219E    mov         ecx,dword ptr [eax]
 005D21A0    call        dword ptr [ecx+38]
 005D21A3    inc         ebx
 005D21A4    dec         esi
>005D21A5    jne         005D2033
 005D21AB    xor         eax,eax
 005D21AD    pop         edx
 005D21AE    pop         ecx
 005D21AF    pop         ecx
 005D21B0    mov         dword ptr fs:[eax],edx
 005D21B3    push        5D21DA
 005D21B8    lea         eax,[ebp-2C]
 005D21BB    mov         edx,3
 005D21C0    call        @UStrArrayClr
 005D21C5    lea         eax,[ebp-8]
 005D21C8    mov         edx,2
 005D21CD    call        @UStrArrayClr
 005D21D2    ret
>005D21D3    jmp         @HandleFinally
>005D21D8    jmp         005D21B8
 005D21DA    pop         edi
 005D21DB    pop         esi
 005D21DC    pop         ebx
 005D21DD    mov         esp,ebp
 005D21DF    pop         ebp
 005D21E0    ret
*}
end;

//005D223C
{*function sub_005D223C(?:UnicodeString):?;
begin
 005D223C    push        ebp
 005D223D    mov         ebp,esp
 005D223F    push        ecx
 005D2240    push        ebx
 005D2241    mov         dword ptr [ebp-4],eax
 005D2244    mov         eax,dword ptr [ebp-4]
 005D2247    call        @UStrAddRef
 005D224C    xor         eax,eax
 005D224E    push        ebp
 005D224F    push        5D22B5
 005D2254    push        dword ptr fs:[eax]
 005D2257    mov         dword ptr fs:[eax],esp
 005D225A    lea         eax,[ebp-4]
 005D225D    mov         edx,5D22D0;'var'
 005D2262    call        004F9BD0
 005D2267    test        al,al
>005D2269    jne         005D2280
 005D226B    lea         eax,[ebp-4]
 005D226E    mov         edx,5D22E4;'variable'
 005D2273    call        004F9BD0
 005D2278    test        al,al
>005D227A    jne         005D2280
 005D227C    xor         ebx,ebx
>005D227E    jmp         005D229F
 005D2280    lea         eax,[ebp-4]
 005D2283    call        004F9D00
 005D2288    lea         eax,[ebp-4]
 005D228B    mov         edx,5D2304;'.'
 005D2290    call        004F9BD0
 005D2295    test        al,al
>005D2297    jne         005D229D
 005D2299    xor         ebx,ebx
>005D229B    jmp         005D229F
 005D229D    mov         bl,1
 005D229F    xor         eax,eax
 005D22A1    pop         edx
 005D22A2    pop         ecx
 005D22A3    pop         ecx
 005D22A4    mov         dword ptr fs:[eax],edx
 005D22A7    push        5D22BC
 005D22AC    lea         eax,[ebp-4]
 005D22AF    call        @UStrClr
 005D22B4    ret
>005D22B5    jmp         @HandleFinally
>005D22BA    jmp         005D22AC
 005D22BC    mov         eax,ebx
 005D22BE    pop         ebx
 005D22BF    pop         ecx
 005D22C0    pop         ebp
 005D22C1    ret
end;*}

//005D2308
{*function sub_005D2308(?:UnicodeString):?;
begin
 005D2308    push        ebp
 005D2309    mov         ebp,esp
 005D230B    add         esp,0FFFFFFF8
 005D230E    push        ebx
 005D230F    push        esi
 005D2310    push        edi
 005D2311    xor         edx,edx
 005D2313    mov         dword ptr [ebp-8],edx
 005D2316    mov         dword ptr [ebp-4],eax
 005D2319    mov         eax,dword ptr [ebp-4]
 005D231C    call        @UStrAddRef
 005D2321    xor         eax,eax
 005D2323    push        ebp
 005D2324    push        5D23B6
 005D2329    push        dword ptr fs:[eax]
 005D232C    mov         dword ptr fs:[eax],esp
 005D232F    xor         ebx,ebx
 005D2331    lea         eax,[ebp-8]
 005D2334    mov         edx,dword ptr [ebp-4]
 005D2337    call        @UStrLAsg
 005D233C    lea         eax,[ebp-8]
 005D233F    mov         edx,5D23D4;'var'
 005D2344    call        004F9BD0
 005D2349    test        al,al
>005D234B    jne         005D235E
 005D234D    lea         eax,[ebp-8]
 005D2350    mov         edx,5D23E8;'variable'
 005D2355    call        004F9BD0
 005D235A    test        al,al
>005D235C    je          005D239B
 005D235E    lea         eax,[ebp-8]
 005D2361    call        004F9D00
 005D2366    mov         edi,eax
 005D2368    lea         eax,[ebp-8]
 005D236B    mov         edx,5D2408;'.'
 005D2370    call        004F9BD0
 005D2375    test        al,al
>005D2377    je          005D239B
 005D2379    mov         eax,dword ptr [ebp-8]
 005D237C    call        005D1808
 005D2381    mov         esi,eax
 005D2383    test        esi,esi
>005D2385    jl          005D239B
 005D2387    mov         dl,1
 005D2389    mov         eax,[005D0F60];TVariableExpression
 005D238E    call        TObject.Create;TVariableExpression.Create
 005D2393    mov         ebx,eax
 005D2395    mov         dword ptr [ebx+20],esi;TVariableExpression.................................................
 005D2398    mov         dword ptr [ebx+18],edi;TVariableExpression.................................................
 005D239B    xor         eax,eax
 005D239D    pop         edx
 005D239E    pop         ecx
 005D239F    pop         ecx
 005D23A0    mov         dword ptr fs:[eax],edx
 005D23A3    push        5D23BD
 005D23A8    lea         eax,[ebp-8]
 005D23AB    mov         edx,2
 005D23B0    call        @UStrArrayClr
 005D23B5    ret
>005D23B6    jmp         @HandleFinally
>005D23BB    jmp         005D23A8
 005D23BD    mov         eax,ebx
 005D23BF    pop         edi
 005D23C0    pop         esi
 005D23C1    pop         ebx
 005D23C2    pop         ecx
 005D23C3    pop         ecx
 005D23C4    pop         ebp
 005D23C5    ret
end;*}

Initialization
//007817B8
{*
 007817B8    push        ebp
 007817B9    mov         ebp,esp
 007817BB    push        ebx
 007817BC    push        esi
 007817BD    push        edi
 007817BE    sub         dword ptr ds:[815AB4],1
>007817C5    jae         00781828
 007817C7    xor         edx,edx
 007817C9    push        ebp
 007817CA    push        78180D
 007817CF    push        dword ptr fs:[edx]
 007817D2    mov         dword ptr fs:[edx],esp
 007817D5    mov         eax,78183C;'Initializing PieVariables'
 007817DA    call        004FA5FC
 007817DF    mov         dl,1
 007817E1    mov         eax,[0067D4A4];THashTable
 007817E6    call        THashTable.Create;THashTable.Create
 007817EB    mov         [00815AB8],eax;gvar_00815AB8:THashTable
 007817F0    mov         cl,1
 007817F2    mov         dl,1
 007817F4    mov         eax,[00471630];TObjectList
 007817F9    call        TObjectList.Create;TObjectList.Create
 007817FE    mov         [00815ABC],eax;gvar_00815ABC:TObjectList
 00781803    xor         eax,eax
 00781805    pop         edx
 00781806    pop         ecx
 00781807    pop         ecx
 00781808    mov         dword ptr fs:[eax],edx
>0078180B    jmp         00781828
>0078180D    jmp         @HandleOnException
 00781812    dd          1
 00781816    dd          00418C04;Exception
 0078181A    dd          0078181E
 0078181E    call        004FA644
 00781823    call        @DoneExcept
 00781828    pop         edi
 00781829    pop         esi
 0078182A    pop         ebx
 0078182B    pop         ebp
 0078182C    ret
*}
Finalization
//005D240C
{*
 005D240C    push        ebp
 005D240D    mov         ebp,esp
 005D240F    push        ebx
 005D2410    push        esi
 005D2411    push        edi
 005D2412    inc         dword ptr ds:[815AB4]
>005D2418    jne         005D247B
 005D241A    xor         edx,edx
 005D241C    push        ebp
 005D241D    push        5D2460
 005D2422    push        dword ptr fs:[edx]
 005D2425    mov         dword ptr fs:[edx],esp
 005D2428    mov         eax,5D248C;'Finalizing PieVariables'
 005D242D    call        004FA5FC
 005D2432    mov         eax,[00815AB8];gvar_00815AB8:THashTable
 005D2437    xor         edx,edx
 005D2439    mov         dword ptr ds:[815AB8],edx;gvar_00815AB8:THashTable
 005D243F    call        TObject.Free
 005D2444    mov         eax,[00815ABC];gvar_00815ABC:TObjectList
 005D2449    xor         edx,edx
 005D244B    mov         dword ptr ds:[815ABC],edx;gvar_00815ABC:TObjectList
 005D2451    call        TObject.Free
 005D2456    xor         eax,eax
 005D2458    pop         edx
 005D2459    pop         ecx
 005D245A    pop         ecx
 005D245B    mov         dword ptr fs:[eax],edx
>005D245E    jmp         005D247B
>005D2460    jmp         @HandleOnException
 005D2465    dd          1
 005D2469    dd          00418C04;Exception
 005D246D    dd          005D2471
 005D2471    call        004FA644
 005D2476    call        @DoneExcept
 005D247B    pop         edi
 005D247C    pop         esi
 005D247D    pop         ebx
 005D247E    pop         ebp
 005D247F    ret
*}
end.