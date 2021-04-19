//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit PieOSC;

interface

uses
  SysUtils, Classes;

type
  :1 = array of Double;
//elSize = 8
//varType equivalent: varDouble;
  :2 = array of string;
//elSize = 4
//varType equivalent: var;
  :3 = array of TDataType;
//elSize = 1;
  TOscValue = class(TObjectValue)
  published
    //procedure GetString(?:?);//00617040
    procedure FillClone(c:TExpression);//00616FD4
    function SetString(NewValue:string):Boolean;//00617454
    function SetInteger(NewValue:Integer):Boolean;//00617334
    function SetBoolean(NewValue:Boolean):Boolean;//00617208
    procedure CreateClone;//00616FC4
    function CanSet:Boolean;//00616FC0
    function GetDataType:TDataType;//00616FF4
    //function SetValue(NewValue:Double; ?:?):Boolean;//006175B4
    procedure GetValue;//00617158
    //procedure ToString(?:?);//00617804
  public
    Item:Integer;//f20
    ServerIndex:Integer;//f24
    Address:AnsiString;//f28
    //procedure ToString(?:?); virtual;//00617804
    procedure GetValue; virtual;//v2C//00617158
    //procedure GetString(?:?); virtual;//v38//00617040
    function GetDataType:TDataType; virtual;//v44//00616FF4
    //function SetValue(NewValue:Double; ?:?):Boolean; virtual;//v58//006175B4
    function SetString(NewValue:string):Boolean; virtual;//v5C//00617454
    function CanSet:Boolean; virtual;//v68//00616FC0
    procedure CreateClone; virtual;//v80//00616FC4
    procedure FillClone(c:TExpression); virtual;//v84//00616FD4
    function SetBoolean(NewValue:Boolean):Boolean; virtual;//vA0//00617208
    function SetInteger(NewValue:Integer):Boolean; virtual;//vA4//00617334
  end;
  :5 = array of Integer;
//elSize = 4
//varType equivalent: varInteger;
  :7 = array of string;
//elSize = 4
//varType equivalent: var;
  :8 = array of Boolean;
//elSize = 1;
    //procedure sub_006159D0(?:?);//006159D0
    //procedure sub_00615A74(?:?);//00615A74
    procedure sub_00615B18;//00615B18
    procedure sub_00615CA8;//00615CA8
    //procedure sub_00615E48(?:UnicodeString; ?:?);//00615E48
    //procedure sub_00615EF4(?:AnsiString; ?:?);//00615EF4
    //procedure sub_00615F54(?:UnicodeString; ?:?);//00615F54
    //function sub_00615FA0:?;//00615FA0
    //procedure sub_00615FA4(?:Integer; ?:?);//00615FA4
    //procedure sub_00616010(?:?; ?:?);//00616010
    //procedure sub_00616084(?:AnsiString; ?:Integer; ?:?);//00616084
    //procedure sub_00616128(?:AnsiString; ?:?; ?:?);//00616128
    //procedure sub_006161F8(?:AnsiString; ?:?; ?:?);//006161F8
    //procedure sub_00616298(?:AnsiString; ?:UnicodeString; ?:?);//00616298
    //procedure sub_00616348(?:UnicodeString; ?:?; ?:?);//00616348
    //procedure sub_006163E0(?:UnicodeString; ?:?; ?:?);//006163E0
    procedure sub_00616478(?:UnicodeString; ?:UnicodeString);//00616478
    //procedure sub_0061651C(?:UnicodeString; ?:?);//0061651C
    procedure sub_006165B4(?:UnicodeString);//006165B4
    procedure sub_00616C94;//00616C94
    //function sub_00616E14(?:UnicodeString):?;//00616E14
    procedure sub_006178F4;//006178F4
    procedure sub_006179B4;//006179B4
    //function sub_00617A54(?:UnicodeString):?;//00617A54
    //procedure sub_00617AA4(?:Integer; ?:?);//00617AA4
    //function sub_00617ABC:?;//00617ABC
    //function sub_00617B30(?:?):?;//00617B30

implementation

//006159D0
{*procedure sub_006159D0(?:?);
begin
 006159D0    push        ebx
 006159D1    push        esi
 006159D2    push        edi
 006159D3    push        ebp
 006159D4    mov         edi,eax
 006159D6    or          ebp,0FFFFFFFF
 006159D9    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 006159DE    mov         eax,dword ptr [eax]
 006159E0    mov         eax,dword ptr [eax+508]
 006159E6    mov         eax,dword ptr [eax+0B0]
 006159EC    mov         eax,dword ptr [eax+8]
 006159EF    mov         eax,dword ptr [eax+8]
 006159F2    mov         esi,eax
 006159F4    dec         esi
 006159F5    test        esi,esi
>006159F7    jl          00615A26
 006159F9    inc         esi
 006159FA    xor         ebx,ebx
 006159FC    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 00615A01    mov         eax,dword ptr [eax]
 00615A03    mov         eax,dword ptr [eax+508]
 00615A09    mov         eax,dword ptr [eax+0B0]
 00615A0F    mov         edx,ebx
 00615A11    call        TIdSocketHandles.GetItem
 00615A16    movzx       eax,word ptr [eax+20];TIdSocketHandle.FPort:word
 00615A1A    cmp         edi,eax
>00615A1C    jne         00615A22
 00615A1E    mov         ebp,ebx
>00615A20    jmp         00615A26
 00615A22    inc         ebx
 00615A23    dec         esi
>00615A24    jne         006159FC
 00615A26    test        ebp,ebp
>00615A28    jg          00615A6E
 00615A2A    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 00615A2F    mov         eax,dword ptr [eax]
 00615A31    mov         eax,dword ptr [eax+508]
 00615A37    xor         edx,edx
 00615A39    call        TIdUDPBase.SetActive
 00615A3E    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 00615A43    mov         eax,dword ptr [eax]
 00615A45    mov         eax,dword ptr [eax+508]
 00615A4B    mov         eax,dword ptr [eax+0B0]
 00615A51    call        TIdSocketHandles.Add
 00615A56    mov         word ptr [eax+20],di;TIdSocketHandle.FPort:word
 00615A5A    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 00615A5F    mov         eax,dword ptr [eax]
 00615A61    mov         eax,dword ptr [eax+508]
 00615A67    mov         dl,1
 00615A69    call        TIdUDPBase.SetActive
 00615A6E    pop         ebp
 00615A6F    pop         edi
 00615A70    pop         esi
 00615A71    pop         ebx
 00615A72    ret
end;*}

//00615A74
{*procedure sub_00615A74(?:?);
begin
 00615A74    push        ebx
 00615A75    push        esi
 00615A76    push        edi
 00615A77    push        ebp
 00615A78    mov         ebp,eax
 00615A7A    or          edi,0FFFFFFFF
 00615A7D    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 00615A82    mov         eax,dword ptr [eax]
 00615A84    mov         eax,dword ptr [eax+508]
 00615A8A    mov         eax,dword ptr [eax+0B0]
 00615A90    mov         eax,dword ptr [eax+8]
 00615A93    mov         eax,dword ptr [eax+8]
 00615A96    mov         esi,eax
 00615A98    dec         esi
 00615A99    test        esi,esi
>00615A9B    jl          00615ACA
 00615A9D    inc         esi
 00615A9E    xor         ebx,ebx
 00615AA0    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 00615AA5    mov         eax,dword ptr [eax]
 00615AA7    mov         eax,dword ptr [eax+508]
 00615AAD    mov         eax,dword ptr [eax+0B0]
 00615AB3    mov         edx,ebx
 00615AB5    call        TIdSocketHandles.GetItem
 00615ABA    movzx       eax,word ptr [eax+20];TIdSocketHandle.FPort:word
 00615ABE    cmp         ebp,eax
>00615AC0    jne         00615AC6
 00615AC2    mov         edi,ebx
>00615AC4    jmp         00615ACA
 00615AC6    inc         ebx
 00615AC7    dec         esi
>00615AC8    jne         00615AA0
 00615ACA    test        edi,edi
>00615ACC    jl          00615B10
 00615ACE    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 00615AD3    mov         eax,dword ptr [eax]
 00615AD5    mov         eax,dword ptr [eax+508]
 00615ADB    xor         edx,edx
 00615ADD    call        TIdUDPBase.SetActive
 00615AE2    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 00615AE7    mov         eax,dword ptr [eax]
 00615AE9    mov         eax,dword ptr [eax+508]
 00615AEF    mov         eax,dword ptr [eax+0B0]
 00615AF5    mov         edx,edi
 00615AF7    call        TCollection.Delete
 00615AFC    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 00615B01    mov         eax,dword ptr [eax]
 00615B03    mov         eax,dword ptr [eax+508]
 00615B09    mov         dl,1
 00615B0B    call        TIdUDPBase.SetActive
 00615B10    pop         ebp
 00615B11    pop         edi
 00615B12    pop         esi
 00615B13    pop         ebx
 00615B14    ret
end;*}

//00615B18
procedure sub_00615B18;
begin
{*
 00615B18    push        ebp
 00615B19    mov         ebp,esp
 00615B1B    push        ebx
 00615B1C    push        esi
 00615B1D    push        edi
 00615B1E    mov         byte ptr ds:[81D8B0],0;gvar_0081D8B0
 00615B25    push        0
 00615B27    mov         eax,81D8B4;gvar_0081D8B4:?
 00615B2C    mov         ecx,1
 00615B31    mov         edx,dword ptr ds:[615940];:5
 00615B37    call        @DynArraySetLength
 00615B3C    add         esp,4
 00615B3F    push        0
 00615B41    mov         eax,81D8C4;gvar_0081D8C4:?
 00615B46    mov         ecx,1
 00615B4B    mov         edx,dword ptr ds:[615980];:7
 00615B51    call        @DynArraySetLength
 00615B56    add         esp,4
 00615B59    push        0
 00615B5B    mov         eax,81D8C8;gvar_0081D8C8:?
 00615B60    mov         ecx,1
 00615B65    mov         edx,dword ptr ds:[6159A8];:8
 00615B6B    call        @DynArraySetLength
 00615B70    add         esp,4
 00615B73    push        0
 00615B75    mov         eax,81D8CC;gvar_0081D8CC:?
 00615B7A    mov         ecx,1
 00615B7F    mov         edx,dword ptr ds:[6159A8];:8
 00615B85    call        @DynArraySetLength
 00615B8A    add         esp,4
 00615B8D    push        0
 00615B8F    mov         eax,81D8B8;gvar_0081D8B8:?
 00615B94    mov         ecx,1
 00615B99    mov         edx,dword ptr ds:[615940];:5
 00615B9F    call        @DynArraySetLength
 00615BA4    add         esp,4
 00615BA7    push        0
 00615BA9    mov         eax,81D8A4;gvar_0081D8A4:?
 00615BAE    mov         ecx,1
 00615BB3    mov         edx,dword ptr ds:[6154B8];:1
 00615BB9    call        @DynArraySetLength
 00615BBE    add         esp,4
 00615BC1    push        0
 00615BC3    mov         eax,81D8A8;gvar_0081D8A8:?
 00615BC8    mov         ecx,1
 00615BCD    mov         edx,dword ptr ds:[6154E0];:2
 00615BD3    call        @DynArraySetLength
 00615BD8    add         esp,4
 00615BDB    push        0
 00615BDD    mov         eax,81D8AC;gvar_0081D8AC:?
 00615BE2    mov         ecx,1
 00615BE7    mov         edx,dword ptr ds:[615508];:3
 00615BED    call        @DynArraySetLength
 00615BF2    add         esp,4
 00615BF5    mov         eax,[0081D89C];gvar_0081D89C:THashTable
 00615BFA    call        THashTable.Clear
 00615BFF    mov         dword ptr ds:[81D8A0],0FFFFFFFF;gvar_0081D8A0:Integer
 00615C09    xor         eax,eax
 00615C0B    mov         [0081D8D0],eax;gvar_0081D8D0
 00615C10    xor         edx,edx
 00615C12    push        ebp
 00615C13    push        615C3C
 00615C18    push        dword ptr fs:[edx]
 00615C1B    mov         dword ptr fs:[edx],esp
 00615C1E    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 00615C23    mov         eax,dword ptr [eax]
 00615C25    mov         eax,dword ptr [eax+508]
 00615C2B    xor         edx,edx
 00615C2D    call        TIdUDPBase.SetActive
 00615C32    xor         eax,eax
 00615C34    pop         edx
 00615C35    pop         ecx
 00615C36    pop         ecx
 00615C37    mov         dword ptr fs:[eax],edx
>00615C3A    jmp         00615C57
>00615C3C    jmp         @HandleOnException
 00615C41    dd          1
 00615C45    dd          00418C04;Exception
 00615C49    dd          00615C4D
 00615C4D    call        004FA644
 00615C52    call        @DoneExcept
 00615C57    xor         edx,edx
 00615C59    push        ebp
 00615C5A    push        615C87
 00615C5F    push        dword ptr fs:[edx]
 00615C62    mov         dword ptr fs:[edx],esp
 00615C65    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 00615C6A    mov         eax,dword ptr [eax]
 00615C6C    mov         eax,dword ptr [eax+508]
 00615C72    mov         eax,dword ptr [eax+0B0]
 00615C78    call        TCollection.Clear
 00615C7D    xor         eax,eax
 00615C7F    pop         edx
 00615C80    pop         ecx
 00615C81    pop         ecx
 00615C82    mov         dword ptr fs:[eax],edx
>00615C85    jmp         00615CA2
>00615C87    jmp         @HandleOnException
 00615C8C    dd          1
 00615C90    dd          00418C04;Exception
 00615C94    dd          00615C98
 00615C98    call        004FA644
 00615C9D    call        @DoneExcept
 00615CA2    pop         edi
 00615CA3    pop         esi
 00615CA4    pop         ebx
 00615CA5    pop         ebp
 00615CA6    ret
*}
end;

//00615CA8
procedure sub_00615CA8;
begin
{*
 00615CA8    push        ebx
 00615CA9    push        esi
 00615CAA    push        edi
 00615CAB    push        ebp
 00615CAC    mov         edi,81D8B4;gvar_0081D8B4:?
 00615CB1    mov         ebp,81D8A4;gvar_0081D8A4:?
 00615CB6    mov         eax,[0081D8D0];gvar_0081D8D0
 00615CBB    inc         eax
 00615CBC    push        eax
 00615CBD    mov         eax,edi
 00615CBF    mov         ecx,1
 00615CC4    mov         edx,dword ptr ds:[615940];:5
 00615CCA    call        @DynArraySetLength
 00615CCF    add         esp,4
 00615CD2    mov         eax,[0081D8D0];gvar_0081D8D0
 00615CD7    inc         eax
 00615CD8    push        eax
 00615CD9    mov         eax,81D8C4;gvar_0081D8C4:?
 00615CDE    mov         ecx,1
 00615CE3    mov         edx,dword ptr ds:[615980];:7
 00615CE9    call        @DynArraySetLength
 00615CEE    add         esp,4
 00615CF1    mov         eax,[0081D8D0];gvar_0081D8D0
 00615CF6    inc         eax
 00615CF7    push        eax
 00615CF8    mov         eax,81D8C8;gvar_0081D8C8:?
 00615CFD    mov         ecx,1
 00615D02    mov         edx,dword ptr ds:[6159A8];:8
 00615D08    call        @DynArraySetLength
 00615D0D    add         esp,4
 00615D10    mov         eax,[0081D8D0];gvar_0081D8D0
 00615D15    inc         eax
 00615D16    push        eax
 00615D17    mov         eax,81D8B8;gvar_0081D8B8:?
 00615D1C    mov         ecx,1
 00615D21    mov         edx,dword ptr ds:[615940];:5
 00615D27    call        @DynArraySetLength
 00615D2C    add         esp,4
 00615D2F    mov         eax,[0081D8D0];gvar_0081D8D0
 00615D34    inc         eax
 00615D35    push        eax
 00615D36    mov         eax,81D8CC;gvar_0081D8CC:?
 00615D3B    mov         ecx,1
 00615D40    mov         edx,dword ptr ds:[6159A8];:8
 00615D46    call        @DynArraySetLength
 00615D4B    add         esp,4
 00615D4E    mov         eax,[0081D8A0];gvar_0081D8A0:Integer
 00615D53    inc         eax
 00615D54    push        eax
 00615D55    mov         eax,ebp
 00615D57    mov         ecx,1
 00615D5C    mov         edx,dword ptr ds:[6154B8];:1
 00615D62    call        @DynArraySetLength
 00615D67    add         esp,4
 00615D6A    mov         eax,[0081D8A0];gvar_0081D8A0:Integer
 00615D6F    inc         eax
 00615D70    push        eax
 00615D71    mov         eax,81D8A8;gvar_0081D8A8:?
 00615D76    mov         ecx,1
 00615D7B    mov         edx,dword ptr ds:[6154E0];:2
 00615D81    call        @DynArraySetLength
 00615D86    add         esp,4
 00615D89    mov         eax,[0081D8A0];gvar_0081D8A0:Integer
 00615D8E    inc         eax
 00615D8F    push        eax
 00615D90    mov         eax,81D8AC;gvar_0081D8AC:?
 00615D95    mov         ecx,1
 00615D9A    mov         edx,dword ptr ds:[615508];:3
 00615DA0    call        @DynArraySetLength
 00615DA5    add         esp,4
 00615DA8    mov         eax,dword ptr [edi]
 00615DAA    call        @DynArrayHigh
 00615DAF    mov         esi,eax
 00615DB1    test        esi,esi
>00615DB3    jl          00615DEC
 00615DB5    inc         esi
 00615DB6    xor         ebx,ebx
 00615DB8    mov         eax,dword ptr [edi]
 00615DBA    mov         dword ptr [eax+ebx*4],0B806
 00615DC1    mov         eax,[0081D8C4];gvar_0081D8C4:?
 00615DC6    lea         eax,[eax+ebx*4]
 00615DC9    mov         edx,615E34;'localhost'
 00615DCE    call        @UStrAsg
 00615DD3    mov         eax,[0081D8C8];gvar_0081D8C8:?
 00615DD8    mov         byte ptr [eax+ebx],0
 00615DDC    mov         eax,[0081D8B8];gvar_0081D8B8:?
 00615DE1    mov         dword ptr [eax+ebx*4],0B806
 00615DE8    inc         ebx
 00615DE9    dec         esi
>00615DEA    jne         00615DB8
 00615DEC    mov         eax,dword ptr [ebp]
 00615DEF    call        @DynArrayHigh
 00615DF4    mov         esi,eax
 00615DF6    test        esi,esi
>00615DF8    jl          00615E23
 00615DFA    inc         esi
 00615DFB    xor         ebx,ebx
 00615DFD    mov         eax,dword ptr [ebp]
 00615E00    xor         edx,edx
 00615E02    mov         dword ptr [eax+ebx*8],edx
 00615E05    mov         dword ptr [eax+ebx*8+4],edx
 00615E09    mov         eax,[0081D8AC];gvar_0081D8AC:?
 00615E0E    mov         byte ptr [eax+ebx],0
 00615E12    mov         eax,[0081D8A8];gvar_0081D8A8:?
 00615E17    lea         eax,[eax+ebx*4]
 00615E1A    call        @UStrClr
 00615E1F    inc         ebx
 00615E20    dec         esi
>00615E21    jne         00615DFD
 00615E23    pop         ebp
 00615E24    pop         edi
 00615E25    pop         esi
 00615E26    pop         ebx
 00615E27    ret
*}
end;

//00615E48
{*procedure sub_00615E48(?:UnicodeString; ?:?);
begin
 00615E48    push        ebp
 00615E49    mov         ebp,esp
 00615E4B    add         esp,0FFFFFFF8
 00615E4E    push        ebx
 00615E4F    push        esi
 00615E50    push        edi
 00615E51    xor         ecx,ecx
 00615E53    mov         dword ptr [ebp-4],ecx
 00615E56    mov         edi,edx
 00615E58    mov         ebx,eax
 00615E5A    xor         eax,eax
 00615E5C    push        ebp
 00615E5D    push        615ED3
 00615E62    push        dword ptr fs:[eax]
 00615E65    mov         dword ptr fs:[eax],esp
 00615E68    lea         eax,[ebp-4]
 00615E6B    mov         edx,ebx
 00615E6D    mov         ecx,0
 00615E72    call        @LStrFromUStr
 00615E77    mov         ecx,dword ptr [ebp-4]
 00615E7A    mov         eax,edi
 00615E7C    mov         edx,615EF0;'/'
 00615E81    call        @LStrCat3
 00615E86    mov         eax,dword ptr [edi]
 00615E88    mov         dword ptr [ebp-8],eax
 00615E8B    mov         eax,dword ptr [ebp-8]
 00615E8E    test        eax,eax
>00615E90    je          00615E97
 00615E92    sub         eax,4
 00615E95    mov         eax,dword ptr [eax]
 00615E97    mov         esi,eax
 00615E99    sub         esi,2
>00615E9C    jl          00615EBD
 00615E9E    inc         esi
 00615E9F    mov         ebx,2
 00615EA4    mov         eax,dword ptr [edi]
 00615EA6    cmp         byte ptr [eax+ebx-1],2E
>00615EAB    jne         00615EB9
 00615EAD    mov         eax,edi
 00615EAF    call        @UniqueStringA
 00615EB4    mov         byte ptr [eax+ebx-1],2F
 00615EB9    inc         ebx
 00615EBA    dec         esi
>00615EBB    jne         00615EA4
 00615EBD    xor         eax,eax
 00615EBF    pop         edx
 00615EC0    pop         ecx
 00615EC1    pop         ecx
 00615EC2    mov         dword ptr fs:[eax],edx
 00615EC5    push        615EDA
 00615ECA    lea         eax,[ebp-4]
 00615ECD    call        @LStrClr
 00615ED2    ret
>00615ED3    jmp         @HandleFinally
>00615ED8    jmp         00615ECA
 00615EDA    pop         edi
 00615EDB    pop         esi
 00615EDC    pop         ebx
 00615EDD    pop         ecx
 00615EDE    pop         ecx
 00615EDF    pop         ebp
 00615EE0    ret
end;*}

//00615EF4
{*procedure sub_00615EF4(?:AnsiString; ?:?);
begin
 00615EF4    push        ebx
 00615EF5    push        esi
 00615EF6    push        edi
 00615EF7    push        ecx
 00615EF8    mov         edi,edx
 00615EFA    mov         ebx,eax
 00615EFC    mov         eax,edi
 00615EFE    mov         edx,ebx
 00615F00    call        @UStrFromLStr
 00615F05    mov         eax,edi
 00615F07    mov         ecx,1
 00615F0C    mov         edx,1
 00615F11    call        @UStrDelete
 00615F16    mov         eax,dword ptr [edi]
 00615F18    mov         dword ptr [esp],eax
 00615F1B    mov         eax,dword ptr [esp]
 00615F1E    test        eax,eax
>00615F20    je          00615F27
 00615F22    sub         eax,4
 00615F25    mov         eax,dword ptr [eax]
 00615F27    mov         esi,eax
 00615F29    test        esi,esi
>00615F2B    jle         00615F4E
 00615F2D    mov         ebx,1
 00615F32    mov         eax,dword ptr [edi]
 00615F34    cmp         word ptr [eax+ebx*2-2],2F
>00615F3A    jne         00615F4A
 00615F3C    mov         eax,edi
 00615F3E    call        @UniqueStringU
 00615F43    mov         word ptr [eax+ebx*2-2],2E
 00615F4A    inc         ebx
 00615F4B    dec         esi
>00615F4C    jne         00615F32
 00615F4E    pop         edx
 00615F4F    pop         edi
 00615F50    pop         esi
 00615F51    pop         ebx
 00615F52    ret
end;*}

//00615F54
{*procedure sub_00615F54(?:UnicodeString; ?:?);
begin
 00615F54    push        ebx
 00615F55    push        esi
 00615F56    mov         ebx,edx
 00615F58    mov         esi,eax
 00615F5A    mov         eax,ebx
 00615F5C    mov         ecx,615F9C;#0
 00615F61    mov         edx,esi
 00615F63    call        @LStrCat3
>00615F68    jmp         00615F76
 00615F6A    mov         eax,ebx
 00615F6C    mov         edx,615F9C;#0
 00615F71    call        @LStrCat
 00615F76    mov         eax,dword ptr [ebx]
 00615F78    call        @LStrLen
 00615F7D    and         eax,80000003
>00615F82    jns         00615F89
 00615F84    dec         eax
 00615F85    or          eax,0FFFFFFFC
 00615F88    inc         eax
 00615F89    test        eax,eax
>00615F8B    jg          00615F6A
 00615F8D    pop         esi
 00615F8E    pop         ebx
 00615F8F    ret
end;*}

//00615FA0
{*function sub_00615FA0:?;
begin
 00615FA0    bswap       eax
 00615FA2    ret
end;*}

//00615FA4
{*procedure sub_00615FA4(?:Integer; ?:?);
begin
 00615FA4    push        ebx
 00615FA5    push        esi
 00615FA6    mov         ebx,edx
 00615FA8    mov         esi,eax
 00615FAA    mov         eax,ebx
 00615FAC    mov         edx,616008;#1+#2+#3+#4
 00615FB1    call        @LStrAsg
 00615FB6    mov         eax,ebx
 00615FB8    call        @UniqueStringA
 00615FBD    mov         edx,esi
 00615FBF    shr         edx,18
 00615FC2    mov         byte ptr [eax],dl
 00615FC4    mov         eax,ebx
 00615FC6    call        @UniqueStringA
 00615FCB    mov         edx,esi
 00615FCD    shr         edx,10
 00615FD0    and         dl,0FF
 00615FD3    mov         byte ptr [eax+1],dl
 00615FD6    mov         eax,ebx
 00615FD8    call        @UniqueStringA
 00615FDD    mov         edx,esi
 00615FDF    shr         edx,8
 00615FE2    and         dl,0FF
 00615FE5    mov         byte ptr [eax+2],dl
 00615FE8    mov         eax,ebx
 00615FEA    call        @UniqueStringA
 00615FEF    mov         edx,esi
 00615FF1    and         dl,0FF
 00615FF4    mov         byte ptr [eax+3],dl
 00615FF7    pop         esi
 00615FF8    pop         ebx
 00615FF9    ret
end;*}

//00616010
{*procedure sub_00616010(?:?; ?:?);
begin
 00616010    push        ebp
 00616011    mov         ebp,esp
 00616013    push        ebx
 00616014    push        esi
 00616015    mov         ebx,eax
 00616017    lea         eax,[ebp+8]
 0061601A    mov         esi,dword ptr [eax]
 0061601C    mov         eax,ebx
 0061601E    mov         edx,61607C;#1+#2+#3+#4
 00616023    call        @LStrAsg
 00616028    mov         eax,ebx
 0061602A    call        @UniqueStringA
 0061602F    mov         edx,esi
 00616031    shr         edx,18
 00616034    mov         byte ptr [eax],dl
 00616036    mov         eax,ebx
 00616038    call        @UniqueStringA
 0061603D    mov         edx,esi
 0061603F    shr         edx,10
 00616042    and         dl,0FF
 00616045    mov         byte ptr [eax+1],dl
 00616048    mov         eax,ebx
 0061604A    call        @UniqueStringA
 0061604F    mov         edx,esi
 00616051    shr         edx,8
 00616054    and         dl,0FF
 00616057    mov         byte ptr [eax+2],dl
 0061605A    mov         eax,ebx
 0061605C    call        @UniqueStringA
 00616061    mov         edx,esi
 00616063    and         dl,0FF
 00616066    mov         byte ptr [eax+3],dl
 00616069    pop         esi
 0061606A    pop         ebx
 0061606B    pop         ebp
 0061606C    ret         4
end;*}

//00616084
{*procedure sub_00616084(?:AnsiString; ?:Integer; ?:?);
begin
 00616084    push        ebp
 00616085    mov         ebp,esp
 00616087    push        0
 00616089    push        0
 0061608B    push        0
 0061608D    push        0
 0061608F    push        ebx
 00616090    push        esi
 00616091    mov         esi,ecx
 00616093    mov         ebx,edx
 00616095    mov         dword ptr [ebp-4],eax
 00616098    mov         eax,dword ptr [ebp-4]
 0061609B    call        @LStrAddRef
 006160A0    xor         eax,eax
 006160A2    push        ebp
 006160A3    push        616108
 006160A8    push        dword ptr fs:[eax]
 006160AB    mov         dword ptr fs:[eax],esp
 006160AE    lea         edx,[ebp-8]
 006160B1    mov         eax,dword ptr [ebp-4]
 006160B4    call        00615F54
 006160B9    push        dword ptr [ebp-8]
 006160BC    lea         edx,[ebp-0C]
 006160BF    mov         eax,616124;',i'
 006160C4    call        00615F54
 006160C9    push        dword ptr [ebp-0C]
 006160CC    lea         edx,[ebp-10]
 006160CF    mov         eax,ebx
 006160D1    call        00615FA4
 006160D6    push        dword ptr [ebp-10]
 006160D9    mov         eax,esi
 006160DB    mov         edx,3
 006160E0    call        @LStrCatN
 006160E5    xor         eax,eax
 006160E7    pop         edx
 006160E8    pop         ecx
 006160E9    pop         ecx
 006160EA    mov         dword ptr fs:[eax],edx
 006160ED    push        61610F
 006160F2    lea         eax,[ebp-10]
 006160F5    mov         edx,3
 006160FA    call        @LStrArrayClr
 006160FF    lea         eax,[ebp-4]
 00616102    call        @LStrClr
 00616107    ret
>00616108    jmp         @HandleFinally
>0061610D    jmp         006160F2
 0061610F    pop         esi
 00616110    pop         ebx
 00616111    mov         esp,ebp
 00616113    pop         ebp
 00616114    ret
end;*}

//00616128
{*procedure sub_00616128(?:AnsiString; ?:?; ?:?);
begin
 00616128    push        ebp
 00616129    mov         ebp,esp
 0061612B    push        0
 0061612D    push        0
 0061612F    push        0
 00616131    push        0
 00616133    push        0
 00616135    push        ebx
 00616136    push        esi
 00616137    mov         esi,ecx
 00616139    mov         ebx,edx
 0061613B    mov         dword ptr [ebp-4],eax
 0061613E    mov         eax,dword ptr [ebp-4]
 00616141    call        @LStrAddRef
 00616146    xor         eax,eax
 00616148    push        ebp
 00616149    push        6161CB
 0061614E    push        dword ptr fs:[eax]
 00616151    mov         dword ptr fs:[eax],esp
 00616154    test        bl,bl
>00616156    je          00616181
 00616158    lea         edx,[ebp-8]
 0061615B    mov         eax,6161E4;',T'
 00616160    call        00615F54
 00616165    mov         eax,dword ptr [ebp-8]
 00616168    push        eax
 00616169    lea         edx,[ebp-0C]
 0061616C    mov         eax,dword ptr [ebp-4]
 0061616F    call        00615F54
 00616174    mov         edx,dword ptr [ebp-0C]
 00616177    mov         eax,esi
 00616179    pop         ecx
 0061617A    call        @LStrCat3
>0061617F    jmp         006161A8
 00616181    lea         edx,[ebp-10]
 00616184    mov         eax,6161F4;',F'
 00616189    call        00615F54
 0061618E    mov         eax,dword ptr [ebp-10]
 00616191    push        eax
 00616192    lea         edx,[ebp-14]
 00616195    mov         eax,dword ptr [ebp-4]
 00616198    call        00615F54
 0061619D    mov         edx,dword ptr [ebp-14]
 006161A0    mov         eax,esi
 006161A2    pop         ecx
 006161A3    call        @LStrCat3
 006161A8    xor         eax,eax
 006161AA    pop         edx
 006161AB    pop         ecx
 006161AC    pop         ecx
 006161AD    mov         dword ptr fs:[eax],edx
 006161B0    push        6161D2
 006161B5    lea         eax,[ebp-14]
 006161B8    mov         edx,4
 006161BD    call        @LStrArrayClr
 006161C2    lea         eax,[ebp-4]
 006161C5    call        @LStrClr
 006161CA    ret
>006161CB    jmp         @HandleFinally
>006161D0    jmp         006161B5
 006161D2    pop         esi
 006161D3    pop         ebx
 006161D4    mov         esp,ebp
 006161D6    pop         ebp
 006161D7    ret
end;*}

//006161F8
{*procedure sub_006161F8(?:AnsiString; ?:?; ?:?);
begin
 006161F8    push        ebp
 006161F9    mov         ebp,esp
 006161FB    xor         ecx,ecx
 006161FD    push        ecx
 006161FE    push        ecx
 006161FF    push        ecx
 00616200    push        ecx
 00616201    push        ebx
 00616202    mov         ebx,edx
 00616204    mov         dword ptr [ebp-4],eax
 00616207    mov         eax,dword ptr [ebp-4]
 0061620A    call        @LStrAddRef
 0061620F    xor         eax,eax
 00616211    push        ebp
 00616212    push        616278
 00616217    push        dword ptr fs:[eax]
 0061621A    mov         dword ptr fs:[eax],esp
 0061621D    lea         edx,[ebp-8]
 00616220    mov         eax,dword ptr [ebp-4]
 00616223    call        00615F54
 00616228    push        dword ptr [ebp-8]
 0061622B    lea         edx,[ebp-0C]
 0061622E    mov         eax,616294;',f'
 00616233    call        00615F54
 00616238    push        dword ptr [ebp-0C]
 0061623B    push        dword ptr [ebp+8]
 0061623E    lea         eax,[ebp-10]
 00616241    call        00616010
 00616246    push        dword ptr [ebp-10]
 00616249    mov         eax,ebx
 0061624B    mov         edx,3
 00616250    call        @LStrCatN
 00616255    xor         eax,eax
 00616257    pop         edx
 00616258    pop         ecx
 00616259    pop         ecx
 0061625A    mov         dword ptr fs:[eax],edx
 0061625D    push        61627F
 00616262    lea         eax,[ebp-10]
 00616265    mov         edx,3
 0061626A    call        @LStrArrayClr
 0061626F    lea         eax,[ebp-4]
 00616272    call        @LStrClr
 00616277    ret
>00616278    jmp         @HandleFinally
>0061627D    jmp         00616262
 0061627F    pop         ebx
 00616280    mov         esp,ebp
 00616282    pop         ebp
 00616283    ret         4
end;*}

//00616298
{*procedure sub_00616298(?:AnsiString; ?:UnicodeString; ?:?);
begin
 00616298    push        ebp
 00616299    mov         ebp,esp
 0061629B    push        0
 0061629D    push        0
 0061629F    push        0
 006162A1    push        0
 006162A3    push        0
 006162A5    push        ebx
 006162A6    mov         ebx,ecx
 006162A8    mov         dword ptr [ebp-8],edx
 006162AB    mov         dword ptr [ebp-4],eax
 006162AE    mov         eax,dword ptr [ebp-4]
 006162B1    call        @LStrAddRef
 006162B6    mov         eax,dword ptr [ebp-8]
 006162B9    call        @LStrAddRef
 006162BE    xor         eax,eax
 006162C0    push        ebp
 006162C1    push        61632C
 006162C6    push        dword ptr fs:[eax]
 006162C9    mov         dword ptr fs:[eax],esp
 006162CC    lea         edx,[ebp-0C]
 006162CF    mov         eax,dword ptr [ebp-4]
 006162D2    call        00615F54
 006162D7    push        dword ptr [ebp-0C]
 006162DA    lea         edx,[ebp-10]
 006162DD    mov         eax,616344;',s'
 006162E2    call        00615F54
 006162E7    push        dword ptr [ebp-10]
 006162EA    lea         edx,[ebp-14]
 006162ED    mov         eax,dword ptr [ebp-8]
 006162F0    call        00615F54
 006162F5    push        dword ptr [ebp-14]
 006162F8    mov         eax,ebx
 006162FA    mov         edx,3
 006162FF    call        @LStrCatN
 00616304    xor         eax,eax
 00616306    pop         edx
 00616307    pop         ecx
 00616308    pop         ecx
 00616309    mov         dword ptr fs:[eax],edx
 0061630C    push        616333
 00616311    lea         eax,[ebp-14]
 00616314    mov         edx,3
 00616319    call        @LStrArrayClr
 0061631E    lea         eax,[ebp-8]
 00616321    mov         edx,2
 00616326    call        @LStrArrayClr
 0061632B    ret
>0061632C    jmp         @HandleFinally
>00616331    jmp         00616311
 00616333    pop         ebx
 00616334    mov         esp,ebp
 00616336    pop         ebp
 00616337    ret
end;*}

//00616348
{*procedure sub_00616348(?:UnicodeString; ?:?; ?:?);
begin
 00616348    push        ebp
 00616349    mov         ebp,esp
 0061634B    add         esp,0FFFFFFF8
 0061634E    push        ebx
 0061634F    xor         edx,edx
 00616351    mov         dword ptr [ebp-8],edx
 00616354    mov         dword ptr [ebp-4],eax
 00616357    mov         eax,dword ptr [ebp-4]
 0061635A    call        @LStrAddRef
 0061635F    xor         eax,eax
 00616361    push        ebp
 00616362    push        6163D1
 00616367    push        dword ptr fs:[eax]
 0061636A    mov         dword ptr fs:[eax],esp
 0061636D    lea         eax,[ebp-8]
 00616370    mov         edx,dword ptr [ebp-4]
 00616373    call        @UStrFromLStr
 00616378    mov         edx,dword ptr [ebp-8]
 0061637B    mov         eax,[0081D89C];gvar_0081D89C:THashTable
 00616380    call        THashTable.Get
 00616385    mov         ebx,eax
 00616387    test        ebx,ebx
>00616389    jl          006163B3
 0061638B    mov         eax,[0081D8A8];gvar_0081D8A8:?
 00616390    lea         eax,[eax+ebx*4]
 00616393    call        @UStrClr
 00616398    mov         eax,[0081D8A4];gvar_0081D8A4:?
 0061639D    mov         edx,dword ptr [ebp+8]
 006163A0    mov         dword ptr [eax+ebx*8],edx
 006163A3    mov         edx,dword ptr [ebp+0C]
 006163A6    mov         dword ptr [eax+ebx*8+4],edx
 006163AA    mov         eax,[0081D8AC];gvar_0081D8AC:?
 006163AF    mov         byte ptr [eax+ebx],0
 006163B3    xor         eax,eax
 006163B5    pop         edx
 006163B6    pop         ecx
 006163B7    pop         ecx
 006163B8    mov         dword ptr fs:[eax],edx
 006163BB    push        6163D8
 006163C0    lea         eax,[ebp-8]
 006163C3    call        @UStrClr
 006163C8    lea         eax,[ebp-4]
 006163CB    call        @LStrClr
 006163D0    ret
>006163D1    jmp         @HandleFinally
>006163D6    jmp         006163C0
 006163D8    pop         ebx
 006163D9    pop         ecx
 006163DA    pop         ecx
 006163DB    pop         ebp
 006163DC    ret         8
end;*}

//006163E0
{*procedure sub_006163E0(?:UnicodeString; ?:?; ?:?);
begin
 006163E0    push        ebp
 006163E1    mov         ebp,esp
 006163E3    add         esp,0FFFFFFF8
 006163E6    push        ebx
 006163E7    xor         edx,edx
 006163E9    mov         dword ptr [ebp-8],edx
 006163EC    mov         dword ptr [ebp-4],eax
 006163EF    mov         eax,dword ptr [ebp-4]
 006163F2    call        @LStrAddRef
 006163F7    xor         eax,eax
 006163F9    push        ebp
 006163FA    push        616469
 006163FF    push        dword ptr fs:[eax]
 00616402    mov         dword ptr fs:[eax],esp
 00616405    lea         eax,[ebp-8]
 00616408    mov         edx,dword ptr [ebp-4]
 0061640B    call        @UStrFromLStr
 00616410    mov         edx,dword ptr [ebp-8]
 00616413    mov         eax,[0081D89C];gvar_0081D89C:THashTable
 00616418    call        THashTable.Get
 0061641D    mov         ebx,eax
 0061641F    test        ebx,ebx
>00616421    jl          0061644B
 00616423    mov         eax,[0081D8A8];gvar_0081D8A8:?
 00616428    lea         eax,[eax+ebx*4]
 0061642B    call        @UStrClr
 00616430    mov         eax,[0081D8A4];gvar_0081D8A4:?
 00616435    mov         edx,dword ptr [ebp+8]
 00616438    mov         dword ptr [eax+ebx*8],edx
 0061643B    mov         edx,dword ptr [ebp+0C]
 0061643E    mov         dword ptr [eax+ebx*8+4],edx
 00616442    mov         eax,[0081D8AC];gvar_0081D8AC:?
 00616447    mov         byte ptr [eax+ebx],2
 0061644B    xor         eax,eax
 0061644D    pop         edx
 0061644E    pop         ecx
 0061644F    pop         ecx
 00616450    mov         dword ptr fs:[eax],edx
 00616453    push        616470
 00616458    lea         eax,[ebp-8]
 0061645B    call        @UStrClr
 00616460    lea         eax,[ebp-4]
 00616463    call        @LStrClr
 00616468    ret
>00616469    jmp         @HandleFinally
>0061646E    jmp         00616458
 00616470    pop         ebx
 00616471    pop         ecx
 00616472    pop         ecx
 00616473    pop         ebp
 00616474    ret         8
end;*}

//00616478
procedure sub_00616478(?:UnicodeString; ?:UnicodeString);
begin
{*
 00616478    push        ebp
 00616479    mov         ebp,esp
 0061647B    add         esp,0FFFFFFF4
 0061647E    push        ebx
 0061647F    xor         ecx,ecx
 00616481    mov         dword ptr [ebp-0C],ecx
 00616484    mov         dword ptr [ebp-8],edx
 00616487    mov         dword ptr [ebp-4],eax
 0061648A    mov         eax,dword ptr [ebp-4]
 0061648D    call        @LStrAddRef
 00616492    mov         eax,dword ptr [ebp-8]
 00616495    call        @UStrAddRef
 0061649A    xor         eax,eax
 0061649C    push        ebp
 0061649D    push        616510
 006164A2    push        dword ptr fs:[eax]
 006164A5    mov         dword ptr fs:[eax],esp
 006164A8    lea         eax,[ebp-0C]
 006164AB    mov         edx,dword ptr [ebp-4]
 006164AE    call        @UStrFromLStr
 006164B3    mov         edx,dword ptr [ebp-0C]
 006164B6    mov         eax,[0081D89C];gvar_0081D89C:THashTable
 006164BB    call        THashTable.Get
 006164C0    mov         ebx,eax
 006164C2    test        ebx,ebx
>006164C4    jl          006164ED
 006164C6    mov         eax,[0081D8A8];gvar_0081D8A8:?
 006164CB    lea         eax,[eax+ebx*4]
 006164CE    mov         edx,dword ptr [ebp-8]
 006164D1    call        @UStrAsg
 006164D6    mov         eax,[0081D8A4];gvar_0081D8A4:?
 006164DB    xor         edx,edx
 006164DD    mov         dword ptr [eax+ebx*8],edx
 006164E0    mov         dword ptr [eax+ebx*8+4],edx
 006164E4    mov         eax,[0081D8AC];gvar_0081D8AC:?
 006164E9    mov         byte ptr [eax+ebx],4
 006164ED    xor         eax,eax
 006164EF    pop         edx
 006164F0    pop         ecx
 006164F1    pop         ecx
 006164F2    mov         dword ptr fs:[eax],edx
 006164F5    push        616517
 006164FA    lea         eax,[ebp-0C]
 006164FD    mov         edx,2
 00616502    call        @UStrArrayClr
 00616507    lea         eax,[ebp-4]
 0061650A    call        @LStrClr
 0061650F    ret
>00616510    jmp         @HandleFinally
>00616515    jmp         006164FA
 00616517    pop         ebx
 00616518    mov         esp,ebp
 0061651A    pop         ebp
 0061651B    ret
*}
end;

//0061651C
{*procedure sub_0061651C(?:UnicodeString; ?:?);
begin
 0061651C    push        ebp
 0061651D    mov         ebp,esp
 0061651F    add         esp,0FFFFFFF8
 00616522    push        ebx
 00616523    push        esi
 00616524    xor         ecx,ecx
 00616526    mov         dword ptr [ebp-8],ecx
 00616529    mov         ebx,edx
 0061652B    mov         dword ptr [ebp-4],eax
 0061652E    mov         eax,dword ptr [ebp-4]
 00616531    call        @LStrAddRef
 00616536    xor         eax,eax
 00616538    push        ebp
 00616539    push        6165A6
 0061653E    push        dword ptr fs:[eax]
 00616541    mov         dword ptr fs:[eax],esp
 00616544    lea         eax,[ebp-8]
 00616547    mov         edx,dword ptr [ebp-4]
 0061654A    call        @UStrFromLStr
 0061654F    mov         edx,dword ptr [ebp-8]
 00616552    mov         eax,[0081D89C];gvar_0081D89C:THashTable
 00616557    call        THashTable.Get
 0061655C    mov         esi,eax
 0061655E    test        esi,esi
>00616560    jl          00616588
 00616562    mov         eax,[0081D8A8];gvar_0081D8A8:?
 00616567    lea         eax,[eax+esi*4]
 0061656A    call        @UStrClr
 0061656F    mov         eax,ebx
 00616571    call        00686074
 00616576    mov         eax,[0081D8A4];gvar_0081D8A4:?
 0061657B    fstp        qword ptr [eax+esi*8]
 0061657E    wait
 0061657F    mov         eax,[0081D8AC];gvar_0081D8AC:?
 00616584    mov         byte ptr [eax+esi],3
 00616588    xor         eax,eax
 0061658A    pop         edx
 0061658B    pop         ecx
 0061658C    pop         ecx
 0061658D    mov         dword ptr fs:[eax],edx
 00616590    push        6165AD
 00616595    lea         eax,[ebp-8]
 00616598    call        @UStrClr
 0061659D    lea         eax,[ebp-4]
 006165A0    call        @LStrClr
 006165A5    ret
>006165A6    jmp         @HandleFinally
>006165AB    jmp         00616595
 006165AD    pop         esi
 006165AE    pop         ebx
 006165AF    pop         ecx
 006165B0    pop         ecx
 006165B1    pop         ebp
 006165B2    ret
end;*}

//006165B4
procedure sub_006165B4(?:UnicodeString);
begin
{*
 006165B4    push        ebp
 006165B5    mov         ebp,esp
 006165B7    add         esp,0FFFFFFBC
 006165BA    push        ebx
 006165BB    push        esi
 006165BC    xor         edx,edx
 006165BE    mov         dword ptr [ebp-44],edx
 006165C1    mov         dword ptr [ebp-40],edx
 006165C4    mov         dword ptr [ebp-3C],edx
 006165C7    mov         dword ptr [ebp-38],edx
 006165CA    mov         dword ptr [ebp-34],edx
 006165CD    mov         dword ptr [ebp-8],edx
 006165D0    mov         dword ptr [ebp-0C],edx
 006165D3    mov         dword ptr [ebp-10],edx
 006165D6    mov         dword ptr [ebp-4],eax
 006165D9    mov         eax,dword ptr [ebp-4]
 006165DC    call        @LStrAddRef
 006165E1    xor         eax,eax
 006165E3    push        ebp
 006165E4    push        616C69
 006165E9    push        dword ptr fs:[eax]
 006165EC    mov         dword ptr fs:[eax],esp
 006165EF    cmp         dword ptr [ebp-4],0
>006165F3    je          00616C2C
 006165F9    lea         eax,[ebp-8]
 006165FC    call        @LStrClr
 00616601    mov         eax,dword ptr [ebp-4]
 00616604    cmp         byte ptr [eax],23
>00616607    je          00616B0A
 0061660D    mov         dword ptr [ebp-14],1
 00616614    mov         esi,1
>00616619    jmp         0061661C
 0061661B    inc         esi
 0061661C    mov         eax,dword ptr [ebp-4]
 0061661F    call        @LStrLen
 00616624    cmp         esi,eax
>00616626    jg          00616632
 00616628    mov         eax,dword ptr [ebp-4]
 0061662B    cmp         byte ptr [eax+esi-1],0
>00616630    jne         0061661B
 00616632    lea         eax,[ebp-8]
 00616635    push        eax
 00616636    mov         ecx,esi
 00616638    sub         ecx,dword ptr [ebp-14]
 0061663B    mov         edx,dword ptr [ebp-14]
 0061663E    mov         eax,dword ptr [ebp-4]
 00616641    call        @LStrCopy
>00616646    jmp         00616649
 00616648    inc         esi
 00616649    mov         eax,dword ptr [ebp-4]
 0061664C    call        @LStrLen
 00616651    cmp         esi,eax
>00616653    jg          00616667
 00616655    mov         eax,esi
 00616657    and         eax,80000003
>0061665C    jns         00616663
 0061665E    dec         eax
 0061665F    or          eax,0FFFFFFFC
 00616662    inc         eax
 00616663    test        eax,eax
>00616665    jne         00616648
 00616667    inc         esi
 00616668    mov         dword ptr [ebp-14],esi
 0061666B    mov         eax,dword ptr [ebp-4]
 0061666E    test        eax,eax
>00616670    je          00616677
 00616672    sub         eax,4
 00616675    mov         eax,dword ptr [eax]
 00616677    cmp         eax,esi
>00616679    jge         0061667F
 0061667B    mov         al,1
>0061667D    jmp         0061668A
 0061667F    mov         eax,dword ptr [ebp-4]
 00616682    cmp         byte ptr [eax+esi-1],2C
 00616687    setne       al
 0061668A    test        al,al
>0061668C    jne         00616C2C
>00616692    jmp         00616695
 00616694    inc         esi
 00616695    mov         eax,dword ptr [ebp-4]
 00616698    call        @LStrLen
 0061669D    cmp         esi,eax
>0061669F    jg          006166AB
 006166A1    mov         eax,dword ptr [ebp-4]
 006166A4    cmp         byte ptr [eax+esi-1],0
>006166A9    jne         00616694
 006166AB    lea         eax,[ebp-0C]
 006166AE    push        eax
 006166AF    mov         ecx,esi
 006166B1    sub         ecx,dword ptr [ebp-14]
 006166B4    mov         edx,dword ptr [ebp-14]
 006166B7    mov         eax,dword ptr [ebp-4]
 006166BA    call        @LStrCopy
>006166BF    jmp         006166C2
 006166C1    inc         esi
 006166C2    mov         eax,dword ptr [ebp-4]
 006166C5    call        @LStrLen
 006166CA    cmp         esi,eax
>006166CC    jg          006166E0
 006166CE    mov         eax,esi
 006166D0    and         eax,80000003
>006166D5    jns         006166DC
 006166D7    dec         eax
 006166D8    or          eax,0FFFFFFFC
 006166DB    inc         eax
 006166DC    test        eax,eax
>006166DE    jne         006166C1
 006166E0    inc         esi
 006166E1    mov         dword ptr [ebp-14],esi
 006166E4    mov         edx,dword ptr [ebp-0C]
 006166E7    mov         eax,edx
 006166E9    test        eax,eax
>006166EB    je          006166F2
 006166ED    sub         eax,4
 006166F0    mov         eax,dword ptr [eax]
 006166F2    cmp         eax,2
>006166F5    jl          00616C2C
 006166FB    mov         eax,dword ptr [ebp-0C]
 006166FE    cmp         byte ptr [eax],2C
>00616701    jne         00616C2C
 00616707    mov         eax,dword ptr [ebp-0C]
 0061670A    cmp         byte ptr [eax+1],5B
>0061670E    jne         00616736
 00616710    mov         eax,edx
 00616712    test        eax,eax
>00616714    je          0061671B
 00616716    sub         eax,4
 00616719    mov         eax,dword ptr [eax]
 0061671B    cmp         eax,3
>0061671E    jl          00616C2C
 00616724    lea         eax,[ebp-0C]
 00616727    mov         ecx,1
 0061672C    mov         edx,2
 00616731    call        @LStrDelete
 00616736    mov         eax,dword ptr [ebp-0C]
 00616739    movzx       edx,byte ptr [eax+1]
 0061673D    mov         eax,edx
 0061673F    mov         ecx,eax
 00616741    add         cl,9F
 00616744    sub         cl,1A
>00616747    jae         0061674B
 00616749    sub         al,20
 0061674B    cmp         al,53
>0061674D    jne         006167BC
>0061674F    jmp         00616752
 00616751    inc         esi
 00616752    mov         eax,dword ptr [ebp-4]
 00616755    call        @LStrLen
 0061675A    cmp         esi,eax
>0061675C    jg          00616768
 0061675E    mov         eax,dword ptr [ebp-4]
 00616761    cmp         byte ptr [eax+esi-1],0
>00616766    jne         00616751
 00616768    lea         eax,[ebp-10]
 0061676B    push        eax
 0061676C    mov         ecx,esi
 0061676E    sub         ecx,dword ptr [ebp-14]
 00616771    mov         edx,dword ptr [ebp-14]
 00616774    mov         eax,dword ptr [ebp-4]
 00616777    call        @LStrCopy
>0061677C    jmp         0061677F
 0061677E    inc         esi
 0061677F    mov         eax,dword ptr [ebp-4]
 00616782    call        @LStrLen
 00616787    cmp         esi,eax
>00616789    jg          0061679D
 0061678B    mov         eax,esi
 0061678D    and         eax,80000003
>00616792    jns         00616799
 00616794    dec         eax
 00616795    or          eax,0FFFFFFFC
 00616798    inc         eax
 00616799    test        eax,eax
>0061679B    jne         0061677E
 0061679D    inc         esi
 0061679E    mov         dword ptr [ebp-14],esi
 006167A1    lea         eax,[ebp-34]
 006167A4    mov         edx,dword ptr [ebp-10]
 006167A7    call        @UStrFromLStr
 006167AC    mov         edx,dword ptr [ebp-34]
 006167AF    mov         eax,dword ptr [ebp-8]
 006167B2    call        00616478
>006167B7    jmp         00616C2C
 006167BC    cmp         dl,54
>006167BF    jne         006167D0
 006167C1    mov         dl,1
 006167C3    mov         eax,dword ptr [ebp-8]
 006167C6    call        0061651C
>006167CB    jmp         00616C2C
 006167D0    cmp         dl,46
>006167D3    jne         006167E4
 006167D5    xor         edx,edx
 006167D7    mov         eax,dword ptr [ebp-8]
 006167DA    call        0061651C
>006167DF    jmp         00616C2C
 006167E4    cmp         dl,4E
>006167E7    jne         006167FA
 006167E9    push        0
 006167EB    push        0
 006167ED    mov         eax,dword ptr [ebp-8]
 006167F0    call        006163E0
>006167F5    jmp         00616C2C
 006167FA    cmp         dl,49
>006167FD    jne         00616813
 006167FF    push        7FF00000
 00616804    push        0
 00616806    mov         eax,dword ptr [ebp-8]
 00616809    call        00616348
>0061680E    jmp         00616C2C
 00616813    mov         eax,dword ptr [ebp-0C]
 00616816    movzx       eax,byte ptr [eax+1]
 0061681A    cmp         al,69
>0061681C    je          00616826
 0061681E    cmp         al,6D
>00616820    je          00616826
 00616822    cmp         al,72
>00616824    jne         00616875
 00616826    mov         eax,dword ptr [ebp-4]
 00616829    test        eax,eax
>0061682B    je          00616832
 0061682D    sub         eax,4
 00616830    mov         eax,dword ptr [eax]
 00616832    sub         eax,dword ptr [ebp-14]
 00616835    inc         eax
 00616836    cmp         eax,4
>00616839    jl          00616C2C
 0061683F    lea         eax,[ebp-4]
 00616842    call        @UniqueStringA
 00616847    mov         edx,dword ptr [ebp-14]
 0061684A    lea         eax,[eax+edx-1]
 0061684E    mov         eax,dword ptr [eax]
 00616850    call        00615FA0
 00616855    mov         dword ptr [ebp-18],eax
 00616858    add         esi,4
 0061685B    mov         dword ptr [ebp-14],esi
 0061685E    fild        dword ptr [ebp-18]
 00616861    add         esp,0FFFFFFF8
 00616864    fstp        qword ptr [esp]
 00616867    wait
 00616868    mov         eax,dword ptr [ebp-8]
 0061686B    call        006163E0
>00616870    jmp         00616C2C
 00616875    cmp         al,62
>00616877    jne         00616941
 0061687D    mov         eax,dword ptr [ebp-4]
 00616880    test        eax,eax
>00616882    je          00616889
 00616884    sub         eax,4
 00616887    mov         eax,dword ptr [eax]
 00616889    sub         eax,dword ptr [ebp-14]
 0061688C    inc         eax
 0061688D    cmp         eax,4
>00616890    jl          00616C2C
 00616896    lea         eax,[ebp-4]
 00616899    call        @UniqueStringA
 0061689E    mov         edx,dword ptr [ebp-14]
 006168A1    lea         eax,[eax+edx-1]
 006168A5    mov         eax,dword ptr [eax]
 006168A7    call        00615FA0
 006168AC    mov         dword ptr [ebp-18],eax
 006168AF    add         esi,4
 006168B2    mov         dword ptr [ebp-14],esi
 006168B5    mov         eax,dword ptr [ebp-4]
 006168B8    test        eax,eax
>006168BA    je          006168C1
 006168BC    sub         eax,4
 006168BF    mov         eax,dword ptr [eax]
 006168C1    sub         eax,dword ptr [ebp-14]
 006168C4    inc         eax
 006168C5    cmp         eax,dword ptr [ebp-18]
>006168C8    jl          00616C2C
 006168CE    lea         eax,[ebp-10]
 006168D1    xor         ecx,ecx
 006168D3    mov         edx,dword ptr [ebp-18]
 006168D6    call        @LStrSetLength
 006168DB    lea         eax,[ebp-4]
 006168DE    call        @UniqueStringA
 006168E3    mov         edx,dword ptr [ebp-14]
 006168E6    lea         eax,[eax+edx-1]
 006168EA    push        eax
 006168EB    lea         eax,[ebp-10]
 006168EE    call        @UniqueStringA
 006168F3    mov         edx,eax
 006168F5    mov         ecx,dword ptr [ebp-18]
 006168F8    pop         eax
 006168F9    call        Move
 006168FE    add         esi,dword ptr [ebp-18]
>00616901    jmp         00616904
 00616903    inc         esi
 00616904    mov         eax,dword ptr [ebp-4]
 00616907    call        @LStrLen
 0061690C    cmp         esi,eax
>0061690E    jg          00616922
 00616910    mov         eax,esi
 00616912    and         eax,80000003
>00616917    jns         0061691E
 00616919    dec         eax
 0061691A    or          eax,0FFFFFFFC
 0061691D    inc         eax
 0061691E    test        eax,eax
>00616920    jne         00616903
 00616922    inc         esi
 00616923    mov         dword ptr [ebp-14],esi
 00616926    lea         eax,[ebp-38]
 00616929    mov         edx,dword ptr [ebp-10]
 0061692C    call        @UStrFromLStr
 00616931    mov         edx,dword ptr [ebp-38]
 00616934    mov         eax,dword ptr [ebp-8]
 00616937    call        00616478
>0061693C    jmp         00616C2C
 00616941    cmp         al,63
>00616943    jne         00616999
 00616945    mov         eax,dword ptr [ebp-4]
 00616948    test        eax,eax
>0061694A    je          00616951
 0061694C    sub         eax,4
 0061694F    mov         eax,dword ptr [eax]
 00616951    sub         eax,dword ptr [ebp-14]
 00616954    inc         eax
 00616955    cmp         eax,4
>00616958    jl          00616C2C
 0061695E    lea         eax,[ebp-4]
 00616961    call        @UniqueStringA
 00616966    mov         edx,dword ptr [ebp-14]
 00616969    lea         eax,[eax+edx-1]
 0061696D    mov         eax,dword ptr [eax]
 0061696F    call        00615FA0
 00616974    mov         dword ptr [ebp-18],eax
 00616977    add         esi,4
 0061697A    mov         dword ptr [ebp-14],esi
 0061697D    lea         eax,[ebp-3C]
 00616980    movzx       edx,word ptr [ebp-18]
 00616984    call        @UStrFromWChar
 00616989    mov         edx,dword ptr [ebp-3C]
 0061698C    mov         eax,dword ptr [ebp-8]
 0061698F    call        00616478
>00616994    jmp         00616C2C
 00616999    mov         eax,dword ptr [ebp-0C]
 0061699C    movzx       eax,byte ptr [eax+1]
 006169A0    cmp         al,68
>006169A2    je          006169A8
 006169A4    cmp         al,74
>006169A6    jne         00616A24
 006169A8    mov         eax,dword ptr [ebp-4]
 006169AB    test        eax,eax
>006169AD    je          006169B4
 006169AF    sub         eax,4
 006169B2    mov         eax,dword ptr [eax]
 006169B4    sub         eax,dword ptr [ebp-14]
 006169B7    inc         eax
 006169B8    cmp         eax,8
>006169BB    jl          00616C2C
 006169C1    lea         eax,[ebp-4]
 006169C4    call        @UniqueStringA
 006169C9    mov         edx,dword ptr [ebp-14]
 006169CC    lea         eax,[eax+edx-1]
 006169D0    mov         eax,dword ptr [eax]
 006169D2    call        00615FA0
 006169D7    xor         edx,edx
 006169D9    mov         edx,eax
 006169DB    xor         eax,eax
 006169DD    push        edx
 006169DE    push        eax
 006169DF    lea         eax,[ebp-4]
 006169E2    call        @UniqueStringA
 006169E7    mov         edx,dword ptr [ebp-14]
 006169EA    lea         eax,[eax+edx+3]
 006169EE    mov         eax,dword ptr [eax]
 006169F0    call        00615FA0
 006169F5    xor         edx,edx
 006169F7    or          eax,dword ptr [esp]
 006169FA    or          edx,dword ptr [esp+4]
 006169FE    add         esp,8
 00616A01    mov         dword ptr [ebp-28],eax
 00616A04    mov         dword ptr [ebp-24],edx
 00616A07    add         esi,8
 00616A0A    mov         dword ptr [ebp-14],esi
 00616A0D    fild        qword ptr [ebp-28]
 00616A10    add         esp,0FFFFFFF8
 00616A13    fstp        qword ptr [esp]
 00616A16    wait
 00616A17    mov         eax,dword ptr [ebp-8]
 00616A1A    call        006163E0
>00616A1F    jmp         00616C2C
 00616A24    cmp         al,66
>00616A26    jne         00616A7C
 00616A28    mov         eax,dword ptr [ebp-4]
 00616A2B    test        eax,eax
>00616A2D    je          00616A34
 00616A2F    sub         eax,4
 00616A32    mov         eax,dword ptr [eax]
 00616A34    sub         eax,dword ptr [ebp-14]
 00616A37    inc         eax
 00616A38    cmp         eax,4
>00616A3B    jl          00616C2C
 00616A41    lea         eax,[ebp-4]
 00616A44    call        @UniqueStringA
 00616A49    mov         edx,dword ptr [ebp-14]
 00616A4C    lea         eax,[eax+edx-1]
 00616A50    mov         eax,dword ptr [eax]
 00616A52    call        00615FA0
 00616A57    mov         dword ptr [ebp-18],eax
 00616A5A    lea         eax,[ebp-18]
 00616A5D    fld         dword ptr [eax]
 00616A5F    fstp        qword ptr [ebp-20]
 00616A62    wait
 00616A63    add         esi,4
 00616A66    mov         dword ptr [ebp-14],esi
 00616A69    push        dword ptr [ebp-1C]
 00616A6C    push        dword ptr [ebp-20]
 00616A6F    mov         eax,dword ptr [ebp-8]
 00616A72    call        00616348
>00616A77    jmp         00616C2C
 00616A7C    cmp         al,64
>00616A7E    jne         00616C2C
 00616A84    mov         eax,dword ptr [ebp-4]
 00616A87    test        eax,eax
>00616A89    je          00616A90
 00616A8B    sub         eax,4
 00616A8E    mov         eax,dword ptr [eax]
 00616A90    sub         eax,dword ptr [ebp-14]
 00616A93    inc         eax
 00616A94    cmp         eax,8
>00616A97    jl          00616C2C
 00616A9D    lea         eax,[ebp-4]
 00616AA0    call        @UniqueStringA
 00616AA5    mov         edx,dword ptr [ebp-14]
 00616AA8    lea         eax,[eax+edx-1]
 00616AAC    mov         eax,dword ptr [eax]
 00616AAE    call        00615FA0
 00616AB3    xor         edx,edx
 00616AB5    mov         edx,eax
 00616AB7    xor         eax,eax
 00616AB9    push        edx
 00616ABA    push        eax
 00616ABB    lea         eax,[ebp-4]
 00616ABE    call        @UniqueStringA
 00616AC3    mov         edx,dword ptr [ebp-14]
 00616AC6    lea         eax,[eax+edx+3]
 00616ACA    mov         eax,dword ptr [eax]
 00616ACC    call        00615FA0
 00616AD1    xor         edx,edx
 00616AD3    or          eax,dword ptr [esp]
 00616AD6    or          edx,dword ptr [esp+4]
 00616ADA    add         esp,8
 00616ADD    mov         dword ptr [ebp-28],eax
 00616AE0    mov         dword ptr [ebp-24],edx
 00616AE3    add         esi,8
 00616AE6    mov         dword ptr [ebp-14],esi
 00616AE9    lea         eax,[ebp-28]
 00616AEC    mov         edx,dword ptr [eax]
 00616AEE    mov         dword ptr [ebp-20],edx
 00616AF1    mov         edx,dword ptr [eax+4]
 00616AF4    mov         dword ptr [ebp-1C],edx
 00616AF7    push        dword ptr [ebp-1C]
 00616AFA    push        dword ptr [ebp-20]
 00616AFD    mov         eax,dword ptr [ebp-8]
 00616B00    call        00616348
>00616B05    jmp         00616C2C
 00616B0A    lea         eax,[ebp-40]
 00616B0D    push        eax
 00616B0E    mov         ecx,7
 00616B13    mov         edx,1
 00616B18    mov         eax,dword ptr [ebp-4]
 00616B1B    call        @LStrCopy
 00616B20    mov         eax,dword ptr [ebp-40]
 00616B23    mov         edx,616C84;'#bundle'
 00616B28    call        @LStrEqual
>00616B2D    jne         00616C2C
 00616B33    mov         edx,dword ptr [ebp-4]
 00616B36    mov         eax,edx
 00616B38    test        eax,eax
>00616B3A    je          00616B41
 00616B3C    sub         eax,4
 00616B3F    mov         eax,dword ptr [eax]
 00616B41    cmp         eax,10
>00616B44    jl          00616C2C
 00616B4A    mov         esi,9
 00616B4F    mov         dword ptr [ebp-14],esi
 00616B52    mov         eax,edx
 00616B54    test        eax,eax
>00616B56    je          00616B5D
 00616B58    sub         eax,4
 00616B5B    mov         eax,dword ptr [eax]
 00616B5D    sub         eax,dword ptr [ebp-14]
 00616B60    inc         eax
 00616B61    cmp         eax,8
>00616B64    jl          00616C2C
 00616B6A    lea         eax,[ebp-4]
 00616B6D    call        @UniqueStringA
 00616B72    mov         edx,dword ptr [ebp-14]
 00616B75    lea         eax,[eax+edx-1]
 00616B79    mov         eax,dword ptr [eax]
 00616B7B    call        00615FA0
 00616B80    xor         edx,edx
 00616B82    mov         edx,eax
 00616B84    xor         eax,eax
 00616B86    push        edx
 00616B87    push        eax
 00616B88    lea         eax,[ebp-4]
 00616B8B    call        @UniqueStringA
 00616B90    mov         edx,dword ptr [ebp-14]
 00616B93    lea         eax,[eax+edx+3]
 00616B97    mov         eax,dword ptr [eax]
 00616B99    call        00615FA0
 00616B9E    xor         edx,edx
 00616BA0    or          eax,dword ptr [esp]
 00616BA3    or          edx,dword ptr [esp+4]
 00616BA7    add         esp,8
 00616BAA    mov         dword ptr [ebp-28],eax
 00616BAD    mov         dword ptr [ebp-24],edx
 00616BB0    fild        qword ptr [ebp-28]
 00616BB3    fdiv        dword ptr ds:[616C8C];4294967296:Single
 00616BB9    fdiv        dword ptr ds:[616C90];86400:Single
 00616BBF    fstp        qword ptr [ebp-30]
 00616BC2    wait
 00616BC3    add         dword ptr [ebp-14],8
>00616BC7    jmp         00616C1B
 00616BC9    lea         eax,[ebp-4]
 00616BCC    call        @UniqueStringA
 00616BD1    mov         edx,dword ptr [ebp-14]
 00616BD4    lea         eax,[eax+edx-1]
 00616BD8    mov         eax,dword ptr [eax]
 00616BDA    call        00615FA0
 00616BDF    mov         dword ptr [ebp-18],eax
 00616BE2    add         dword ptr [ebp-14],4
 00616BE6    mov         ebx,dword ptr [ebp-4]
 00616BE9    test        ebx,ebx
>00616BEB    je          00616BF2
 00616BED    sub         ebx,4
 00616BF0    mov         ebx,dword ptr [ebx]
 00616BF2    sub         ebx,dword ptr [ebp-14]
 00616BF5    inc         ebx
 00616BF6    cmp         ebx,dword ptr [ebp-18]
>00616BF9    jl          00616C2C
 00616BFB    lea         eax,[ebp-44]
 00616BFE    push        eax
 00616BFF    mov         ecx,dword ptr [ebp-18]
 00616C02    mov         edx,dword ptr [ebp-14]
 00616C05    mov         eax,dword ptr [ebp-4]
 00616C08    call        @LStrCopy
 00616C0D    mov         eax,dword ptr [ebp-44]
 00616C10    call        006165B4
 00616C15    mov         eax,dword ptr [ebp-18]
 00616C18    add         dword ptr [ebp-14],eax
 00616C1B    mov         eax,dword ptr [ebp-4]
 00616C1E    call        @LStrLen
 00616C23    sub         eax,dword ptr [ebp-14]
 00616C26    inc         eax
 00616C27    cmp         eax,4
>00616C2A    jge         00616BC9
 00616C2C    xor         eax,eax
 00616C2E    pop         edx
 00616C2F    pop         ecx
 00616C30    pop         ecx
 00616C31    mov         dword ptr fs:[eax],edx
 00616C34    push        616C70
 00616C39    lea         eax,[ebp-44]
 00616C3C    mov         edx,2
 00616C41    call        @LStrArrayClr
 00616C46    lea         eax,[ebp-3C]
 00616C49    mov         edx,3
 00616C4E    call        @UStrArrayClr
 00616C53    lea         eax,[ebp-10]
 00616C56    mov         edx,3
 00616C5B    call        @LStrArrayClr
 00616C60    lea         eax,[ebp-4]
 00616C63    call        @LStrClr
 00616C68    ret
>00616C69    jmp         @HandleFinally
>00616C6E    jmp         00616C39
 00616C70    pop         esi
 00616C71    pop         ebx
 00616C72    mov         esp,ebp
 00616C74    pop         ebp
 00616C75    ret
*}
end;

//00616C94
procedure sub_00616C94;
begin
{*
 00616C94    push        ebx
 00616C95    mov         ebx,81D898;gvar_0081D898:THashTable
 00616C9A    mov         ecx,1
 00616C9F    mov         edx,616D30;^'RealLeftStick'
 00616CA4    mov         eax,dword ptr [ebx]
 00616CA6    call        THashTable.Add
 00616CAB    mov         ecx,2
 00616CB0    mov         edx,616D48;'ip'
 00616CB5    mov         eax,dword ptr [ebx]
 00616CB7    call        THashTable.Add
 00616CBC    mov         ecx,3
 00616CC1    mov         edx,616D5C;'broadcast'
 00616CC6    mov         eax,dword ptr [ebx]
 00616CC8    call        THashTable.Add
 00616CCD    mov         ecx,5
 00616CD2    mov         edx,616D7C;'listening'
 00616CD7    mov         eax,dword ptr [ebx]
 00616CD9    call        THashTable.Add
 00616CDE    mov         ecx,4
 00616CE3    mov         edx,616D9C;'ListenPort'
 00616CE8    mov         eax,dword ptr [ebx]
 00616CEA    call        THashTable.Add
 00616CEF    mov         ecx,4
 00616CF4    mov         edx,616DC0;'SourcePort'
 00616CF9    mov         eax,dword ptr [ebx]
 00616CFB    call        THashTable.Add
 00616D00    mov         ecx,2
 00616D05    mov         edx,616DE4;'destination'
 00616D0A    mov         eax,dword ptr [ebx]
 00616D0C    call        THashTable.Add
 00616D11    mov         ecx,2
 00616D16    mov         edx,616E08;'dest'
 00616D1B    mov         eax,dword ptr [ebx]
 00616D1D    call        THashTable.Add
 00616D22    pop         ebx
 00616D23    ret
*}
end;

//00616E14
{*function sub_00616E14(?:UnicodeString):?;
begin
 00616E14    push        ebp
 00616E15    mov         ebp,esp
 00616E17    add         esp,0FFFFFFF0
 00616E1A    push        ebx
 00616E1B    push        esi
 00616E1C    push        edi
 00616E1D    xor         edx,edx
 00616E1F    mov         dword ptr [ebp-10],edx
 00616E22    mov         dword ptr [ebp-8],edx
 00616E25    mov         dword ptr [ebp-4],eax
 00616E28    mov         eax,dword ptr [ebp-4]
 00616E2B    call        @UStrAddRef
 00616E30    xor         eax,eax
 00616E32    push        ebp
 00616E33    push        616F8C
 00616E38    push        dword ptr fs:[eax]
 00616E3B    mov         dword ptr fs:[eax],esp
 00616E3E    xor         esi,esi
 00616E40    lea         eax,[ebp-8]
 00616E43    mov         edx,dword ptr [ebp-4]
 00616E46    call        @UStrLAsg
 00616E4B    lea         eax,[ebp-8]
 00616E4E    mov         edx,616FA8;'Osc'
 00616E53    call        004F9BD0
 00616E58    test        al,al
>00616E5A    je          00616F69
 00616E60    lea         eax,[ebp-8]
 00616E63    call        004F9D00
 00616E68    mov         ebx,eax
 00616E6A    lea         eax,[ebp-8]
 00616E6D    mov         edx,616FBC;'.'
 00616E72    call        004F9BD0
 00616E77    test        al,al
>00616E79    je          00616F69
 00616E7F    mov         eax,dword ptr [ebp-8]
 00616E82    call        00617A54
 00616E87    mov         edi,eax
 00616E89    test        edi,edi
>00616E8B    jge         00616ECA
 00616E8D    xor         edi,edi
 00616E8F    lea         edx,[ebp-10]
 00616E92    mov         eax,dword ptr [ebp-8]
 00616E95    call        00615E48
 00616E9A    mov         edx,dword ptr [ebp-10]
 00616E9D    lea         eax,[ebp-8]
 00616EA0    call        @UStrFromLStr
 00616EA5    mov         edx,dword ptr [ebp-8]
 00616EA8    mov         eax,[0081D89C];gvar_0081D89C:THashTable
 00616EAD    call        THashTable.GetOrAdd
 00616EB2    mov         dword ptr [ebp-0C],eax
 00616EB5    mov         eax,dword ptr [ebp-0C]
 00616EB8    cmp         eax,dword ptr ds:[81D8A0];gvar_0081D8A0:Integer
>00616EBE    jle         00616ED1
 00616EC0    mov         eax,dword ptr [ebp-0C]
 00616EC3    mov         [0081D8A0],eax;gvar_0081D8A0:Integer
>00616EC8    jmp         00616ED1
 00616ECA    mov         dword ptr [ebp-0C],0FFFFFFFF
 00616ED1    mov         dl,1
 00616ED3    mov         eax,[00615530];TOscValue
 00616ED8    call        TObject.Create;TOscValue.Create
 00616EDD    mov         esi,eax
 00616EDF    mov         dword ptr [esi+20],edi;TOscValue.Item:Integer
 00616EE2    test        ebx,ebx
>00616EE4    jg          00616EEB
 00616EE6    mov         ebx,1
 00616EEB    cmp         ebx,3E7
>00616EF1    jne         00616EF8
 00616EF3    mov         ebx,1
 00616EF8    mov         dword ptr [esi+18],ebx;TOscValue...........................................................
 00616EFB    mov         eax,dword ptr [ebp-0C]
 00616EFE    mov         dword ptr [esi+24],eax;TOscValue.ServerIndex:Integer
 00616F01    test        edi,edi
>00616F03    jne         00616F15
 00616F05    lea         eax,[esi+28];TOscValue.Address:AnsiString
 00616F08    mov         edx,dword ptr [ebp-8]
 00616F0B    mov         ecx,0
 00616F10    call        @LStrFromUStr
 00616F15    cmp         ebx,dword ptr ds:[81D8D0];gvar_0081D8D0
>00616F1B    jle         00616F4B
 00616F1D    mov         dword ptr ds:[81D8D0],ebx;gvar_0081D8D0
 00616F23    mov         eax,[0081D8D0];gvar_0081D8D0
 00616F28    inc         eax
 00616F29    push        eax
 00616F2A    mov         eax,81D8CC;gvar_0081D8CC:?
 00616F2F    mov         ecx,1
 00616F34    mov         edx,dword ptr ds:[6159A8];:8
 00616F3A    call        @DynArraySetLength
 00616F3F    add         esp,4
 00616F42    mov         eax,[0081D8CC];gvar_0081D8CC:?
 00616F47    mov         byte ptr [eax+ebx],0
 00616F4B    cmp         edi,4
>00616F4E    jne         00616F59
 00616F50    mov         eax,[0081D8CC];gvar_0081D8CC:?
 00616F55    mov         byte ptr [eax+ebx],1
 00616F59    mov         eax,[0081D8CC];gvar_0081D8CC:?
 00616F5E    mov         byte ptr [eax+ebx],0
 00616F62    mov         byte ptr ds:[81D8B0],1;gvar_0081D8B0
 00616F69    xor         eax,eax
 00616F6B    pop         edx
 00616F6C    pop         ecx
 00616F6D    pop         ecx
 00616F6E    mov         dword ptr fs:[eax],edx
 00616F71    push        616F93
 00616F76    lea         eax,[ebp-10]
 00616F79    call        @LStrClr
 00616F7E    lea         eax,[ebp-8]
 00616F81    mov         edx,2
 00616F86    call        @UStrArrayClr
 00616F8B    ret
>00616F8C    jmp         @HandleFinally
>00616F91    jmp         00616F76
 00616F93    mov         eax,esi
 00616F95    pop         edi
 00616F96    pop         esi
 00616F97    pop         ebx
 00616F98    mov         esp,ebp
 00616F9A    pop         ebp
 00616F9B    ret
end;*}

//00616FC0
function TOscValue.CanSet:Boolean;
begin
{*
 00616FC0    mov         al,1
 00616FC2    ret
*}
end;

//00616FC4
procedure TOscValue.CreateClone;
begin
{*
 00616FC4    mov         dl,1
 00616FC6    mov         eax,[00615530];TOscValue
 00616FCB    call        TObject.Create;TOscValue.Create
 00616FD0    ret
*}
end;

//00616FD4
procedure TOscValue.FillClone(c:TExpression);
begin
{*
 00616FD4    push        ebx
 00616FD5    push        esi
 00616FD6    mov         esi,edx
 00616FD8    mov         ebx,eax
 00616FDA    mov         edx,esi
 00616FDC    mov         eax,ebx
 00616FDE    call        TExpression.FillClone
 00616FE3    mov         eax,esi
 00616FE5    mov         edx,dword ptr [ebx+20];TOscValue.Item:Integer
 00616FE8    mov         dword ptr [eax+20],edx
 00616FEB    mov         edx,dword ptr [ebx+18];TOscValue...........................................................
 00616FEE    mov         dword ptr [eax+18],edx
 00616FF1    pop         esi
 00616FF2    pop         ebx
 00616FF3    ret
*}
end;

//00616FF4
function TOscValue.GetDataType:TDataType;
begin
{*
 00616FF4    mov         edx,dword ptr [eax+20];TOscValue.Item:Integer
 00616FF7    cmp         edx,5
>00616FFA    ja          0061703A
 00616FFC    jmp         dword ptr [edx*4+617003]
 00616FFC    dd          0061701B
 00616FFC    dd          00617031
 00616FFC    dd          00617034
 00616FFC    dd          00617037
 00616FFC    dd          00617031
 00616FFC    dd          00617037
 0061701B    mov         edx,dword ptr [eax+24];TOscValue.ServerIndex:Integer
 0061701E    test        edx,edx
>00617020    jge         00617026
 00617022    xor         eax,eax
>00617024    jmp         0061703C
 00617026    mov         ecx,dword ptr ds:[81D8AC];gvar_0081D8AC:?
 0061702C    movzx       eax,byte ptr [ecx+edx]
 00617030    ret
 00617031    mov         al,2
 00617033    ret
 00617034    mov         al,4
 00617036    ret
 00617037    mov         al,3
 00617039    ret
 0061703A    xor         eax,eax
 0061703C    ret
*}
end;

//00617040
{*procedure TOscValue.GetString(?:?);
begin
 00617040    push        ebp
 00617041    mov         ebp,esp
 00617043    add         esp,0FFFFFFF0
 00617046    push        ebx
 00617047    push        esi
 00617048    xor         ecx,ecx
 0061704A    mov         dword ptr [ebp-4],ecx
 0061704D    mov         esi,edx
 0061704F    mov         ebx,eax
 00617051    xor         eax,eax
 00617053    push        ebp
 00617054    push        61714A
 00617059    push        dword ptr fs:[eax]
 0061705C    mov         dword ptr fs:[eax],esp
 0061705F    mov         eax,dword ptr [ebx+20];TOscValue.Item:Integer
 00617062    sub         eax,1
>00617065    jb          00617073
 00617067    dec         eax
>00617068    je          00617116
>0061706E    jmp         0061712B
 00617073    mov         eax,dword ptr [ebx+24];TOscValue.ServerIndex:Integer
 00617076    test        eax,eax
>00617078    jge         00617086
 0061707A    mov         eax,esi
 0061707C    call        @UStrClr
>00617081    jmp         00617134
 00617086    mov         ebx,eax
 00617088    mov         eax,[0081D8AC];gvar_0081D8AC:?
 0061708D    movzx       eax,byte ptr [eax+ebx]
 00617091    sub         al,2
>00617093    je          006170CE
 00617095    dec         al
>00617097    je          006170B2
 00617099    dec         al
>0061709B    jne         006170E6
 0061709D    mov         eax,esi
 0061709F    mov         edx,dword ptr ds:[81D8A8];gvar_0081D8A8:?
 006170A5    mov         edx,dword ptr [edx+ebx*4]
 006170A8    call        @UStrAsg
>006170AD    jmp         00617134
 006170B2    mov         eax,[0081D8A4];gvar_0081D8A4:?
 006170B7    push        dword ptr [eax+ebx*8+4]
 006170BB    push        dword ptr [eax+ebx*8]
 006170BE    call        00686060
 006170C3    mov         ecx,esi
 006170C5    mov         dl,1
 006170C7    call        BoolToStr
>006170CC    jmp         00617134
 006170CE    mov         eax,[0081D8A4];gvar_0081D8A4:?
 006170D3    fld         qword ptr [eax+ebx*8]
 006170D6    call        @ROUND
 006170DB    push        edx
 006170DC    push        eax
 006170DD    mov         eax,esi
 006170DF    call        IntToStr
>006170E4    jmp         00617134
 006170E6    mov         eax,[0081D8A4];gvar_0081D8A4:?
 006170EB    fld         qword ptr [eax+ebx*8]
 006170EE    fstp        tbyte ptr [ebp-10]
 006170F1    wait
 006170F2    movzx       eax,word ptr [ebp-8]
 006170F6    push        eax
 006170F7    push        dword ptr [ebp-0C]
 006170FA    push        dword ptr [ebp-10]
 006170FD    lea         edx,[ebp-4]
 00617100    mov         eax,[0078D6A8];^gvar_00790CDC:TFormatSettings
 00617105    call        FloatToStr
 0061710A    mov         eax,esi
 0061710C    mov         edx,dword ptr [ebp-4]
 0061710F    call        @UStrAsg
>00617114    jmp         00617134
 00617116    mov         eax,esi
 00617118    mov         edx,dword ptr ds:[81D8C4];gvar_0081D8C4:?
 0061711E    mov         ecx,dword ptr [ebx+18];TOscValue...........................................................
 00617121    mov         edx,dword ptr [edx+ecx*4]
 00617124    call        @UStrAsg
>00617129    jmp         00617134
 0061712B    mov         edx,esi
 0061712D    mov         eax,ebx
 0061712F    call        TExpression.GetString
 00617134    xor         eax,eax
 00617136    pop         edx
 00617137    pop         ecx
 00617138    pop         ecx
 00617139    mov         dword ptr fs:[eax],edx
 0061713C    push        617151
 00617141    lea         eax,[ebp-4]
 00617144    call        @UStrClr
 00617149    ret
>0061714A    jmp         @HandleFinally
>0061714F    jmp         00617141
 00617151    pop         esi
 00617152    pop         ebx
 00617153    mov         esp,ebp
 00617155    pop         ebp
 00617156    ret
end;*}

//00617158
procedure TOscValue.GetValue;
begin
{*
 00617158    push        ebx
 00617159    add         esp,0FFFFFFF8
 0061715C    mov         edx,dword ptr [eax+20];TOscValue.Item:Integer
 0061715F    sub         edx,1
>00617162    jb          00617171
>00617164    je          006171C0
 00617166    dec         edx
>00617167    je          006171D2
 00617169    dec         edx
>0061716A    je          006171DD
>0061716C    jmp         006171F5
 00617171    mov         edx,dword ptr [eax+24];TOscValue.ServerIndex:Integer
 00617174    test        edx,edx
>00617176    jge         00617183
 00617178    xor         eax,eax
 0061717A    mov         dword ptr [esp],eax
 0061717D    mov         dword ptr [esp+4],eax
>00617181    jmp         006171FE
 00617183    mov         ebx,edx
 00617185    mov         eax,[0081D8AC];gvar_0081D8AC:?
 0061718A    movzx       eax,byte ptr [eax+ebx]
 0061718E    sub         al,4
>00617190    jne         006171AB
 00617192    push        0
 00617194    push        0
 00617196    push        0
 00617198    mov         eax,[0081D8A8];gvar_0081D8A8:?
 0061719D    mov         eax,dword ptr [eax+ebx*4]
 006171A0    call        004F8DB8
 006171A5    fstp        qword ptr [esp]
 006171A8    wait
>006171A9    jmp         006171FE
 006171AB    mov         eax,[0081D8A4];gvar_0081D8A4:?
 006171B0    mov         edx,dword ptr [eax+ebx*8]
 006171B3    mov         dword ptr [esp],edx
 006171B6    mov         edx,dword ptr [eax+ebx*8+4]
 006171BA    mov         dword ptr [esp+4],edx
>006171BE    jmp         006171FE
 006171C0    mov         edx,dword ptr ds:[81D8B4];gvar_0081D8B4:?
 006171C6    mov         eax,dword ptr [eax+18];TOscValue...........................................................
 006171C9    fild        dword ptr [edx+eax*4]
 006171CC    fstp        qword ptr [esp]
 006171CF    wait
>006171D0    jmp         006171FE
 006171D2    xor         eax,eax
 006171D4    mov         dword ptr [esp],eax
 006171D7    mov         dword ptr [esp+4],eax
>006171DB    jmp         006171FE
 006171DD    mov         edx,dword ptr ds:[81D8C8];gvar_0081D8C8:?
 006171E3    mov         eax,dword ptr [eax+18];TOscValue...........................................................
 006171E6    movzx       eax,byte ptr [edx+eax]
 006171EA    call        00686074
 006171EF    fstp        qword ptr [esp]
 006171F2    wait
>006171F3    jmp         006171FE
 006171F5    xor         eax,eax
 006171F7    mov         dword ptr [esp],eax
 006171FA    mov         dword ptr [esp+4],eax
 006171FE    fld         qword ptr [esp]
 00617201    pop         ecx
 00617202    pop         edx
 00617203    pop         ebx
 00617204    ret
*}
end;

//00617208
function TOscValue.SetBoolean(NewValue:Boolean):Boolean;
begin
{*
 00617208    push        ebp
 00617209    mov         ebp,esp
 0061720B    push        0
 0061720D    push        0
 0061720F    push        0
 00617211    push        ebx
 00617212    push        esi
 00617213    push        edi
 00617214    mov         byte ptr [ebp-9],dl
 00617217    mov         edi,eax
 00617219    xor         eax,eax
 0061721B    push        ebp
 0061721C    push        617321
 00617221    push        dword ptr fs:[eax]
 00617224    mov         dword ptr fs:[eax],esp
 00617227    mov         eax,dword ptr [edi+20];TOscValue.Item:Integer
 0061722A    sub         eax,1
>0061722D    jae         006172E4
 00617233    lea         ecx,[ebp-4]
 00617236    movzx       edx,byte ptr [ebp-9]
 0061723A    mov         eax,dword ptr [edi+28];TOscValue.Address:AnsiString
 0061723D    call        00616128
 00617242    mov         esi,dword ptr [ebp-4]
 00617245    test        esi,esi
>00617247    je          0061724E
 00617249    sub         esi,4
 0061724C    mov         esi,dword ptr [esi]
 0061724E    push        esi
 0061724F    lea         eax,[ebp-8]
 00617252    mov         ecx,1
 00617257    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 0061725D    call        @DynArraySetLength
 00617262    add         esp,4
 00617265    lea         eax,[ebp-4]
 00617268    call        @UniqueStringA
 0061726D    mov         edx,eax
 0061726F    mov         eax,dword ptr [ebp-4]
 00617272    test        eax,eax
>00617274    je          0061727B
 00617276    sub         eax,4
 00617279    mov         eax,dword ptr [eax]
 0061727B    mov         ecx,dword ptr [ebp-8]
 0061727E    xchg        ecx,edx
 00617280    xchg        eax,ecx
 00617281    call        Move
 00617286    cmp         byte ptr ds:[78BD4C],0;gvar_0078BD4C
>0061728D    je          006172B4
 0061728F    push        0
 00617291    mov         eax,[0081D8B4];gvar_0081D8B4:?
 00617296    mov         edx,dword ptr [edi+18];TOscValue...........................................................
 00617299    movzx       ecx,word ptr [eax+edx*4]
 0061729D    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 006172A2    mov         eax,dword ptr [eax]
 006172A4    mov         eax,dword ptr [eax+500]
 006172AA    mov         edx,dword ptr [ebp-8]
 006172AD    call        TIdUDPBase.Broadcast
>006172B2    jmp         006172E0
 006172B4    mov         edx,dword ptr [ebp-8]
 006172B7    push        edx
 006172B8    mov         edx,dword ptr ds:[81D8B4];gvar_0081D8B4:?
 006172BE    mov         eax,dword ptr [edi+18];TOscValue...........................................................
 006172C1    movzx       ecx,word ptr [edx+eax*4]
 006172C5    mov         edx,dword ptr ds:[81D8C4];gvar_0081D8C4:?
 006172CB    mov         edx,dword ptr [edx+eax*4]
 006172CE    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 006172D3    mov         eax,dword ptr [eax]
 006172D5    mov         eax,dword ptr [eax+500]
 006172DB    mov         ebx,dword ptr [eax]
 006172DD    call        dword ptr [ebx+78]
 006172E0    mov         bl,1
>006172E2    jmp         006172FD
 006172E4    movzx       eax,byte ptr [ebp-9]
 006172E8    call        00686074
 006172ED    add         esp,0FFFFFFF8
 006172F0    fstp        qword ptr [esp]
 006172F3    wait
 006172F4    mov         eax,edi
 006172F6    mov         edx,dword ptr [eax]
 006172F8    call        dword ptr [edx+58];TOscValue.SetValue
 006172FB    mov         ebx,eax
 006172FD    xor         eax,eax
 006172FF    pop         edx
 00617300    pop         ecx
 00617301    pop         ecx
 00617302    mov         dword ptr fs:[eax],edx
 00617305    push        617328
 0061730A    lea         eax,[ebp-8]
 0061730D    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 00617313    call        @DynArrayClear
 00617318    lea         eax,[ebp-4]
 0061731B    call        @LStrClr
 00617320    ret
>00617321    jmp         @HandleFinally
>00617326    jmp         0061730A
 00617328    mov         eax,ebx
 0061732A    pop         edi
 0061732B    pop         esi
 0061732C    pop         ebx
 0061732D    mov         esp,ebp
 0061732F    pop         ebp
 00617330    ret
*}
end;

//00617334
function TOscValue.SetInteger(NewValue:Integer):Boolean;
begin
{*
 00617334    push        ebp
 00617335    mov         ebp,esp
 00617337    push        0
 00617339    push        0
 0061733B    push        0
 0061733D    push        ebx
 0061733E    push        esi
 0061733F    mov         esi,edx
 00617341    mov         ebx,eax
 00617343    xor         eax,eax
 00617345    push        ebp
 00617346    push        617444
 0061734B    push        dword ptr fs:[eax]
 0061734E    mov         dword ptr fs:[eax],esp
 00617351    mov         eax,dword ptr [ebx+20];TOscValue.Item:Integer
 00617354    sub         eax,1
>00617357    jae         0061740A
 0061735D    lea         ecx,[ebp-4]
 00617360    mov         edx,esi
 00617362    mov         eax,dword ptr [ebx+28];TOscValue.Address:AnsiString
 00617365    call        00616084
 0061736A    mov         esi,dword ptr [ebp-4]
 0061736D    test        esi,esi
>0061736F    je          00617376
 00617371    sub         esi,4
 00617374    mov         esi,dword ptr [esi]
 00617376    push        esi
 00617377    lea         eax,[ebp-8]
 0061737A    mov         ecx,1
 0061737F    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 00617385    call        @DynArraySetLength
 0061738A    add         esp,4
 0061738D    lea         eax,[ebp-4]
 00617390    call        @UniqueStringA
 00617395    mov         edx,eax
 00617397    mov         eax,dword ptr [ebp-4]
 0061739A    test        eax,eax
>0061739C    je          006173A3
 0061739E    sub         eax,4
 006173A1    mov         eax,dword ptr [eax]
 006173A3    mov         ecx,dword ptr [ebp-8]
 006173A6    xchg        ecx,edx
 006173A8    xchg        eax,ecx
 006173A9    call        Move
 006173AE    cmp         byte ptr ds:[78BD4C],0;gvar_0078BD4C
>006173B5    je          006173DC
 006173B7    push        0
 006173B9    mov         eax,[0081D8B4];gvar_0081D8B4:?
 006173BE    mov         edx,dword ptr [ebx+18];TOscValue...........................................................
 006173C1    movzx       ecx,word ptr [eax+edx*4]
 006173C5    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 006173CA    mov         eax,dword ptr [eax]
 006173CC    mov         eax,dword ptr [eax+500]
 006173D2    mov         edx,dword ptr [ebp-8]
 006173D5    call        TIdUDPBase.Broadcast
>006173DA    jmp         00617406
 006173DC    mov         eax,dword ptr [ebp-8]
 006173DF    push        eax
 006173E0    mov         eax,[0081D8B4];gvar_0081D8B4:?
 006173E5    mov         esi,dword ptr [ebx+18];TOscValue...........................................................
 006173E8    movzx       ecx,word ptr [eax+esi*4]
 006173EC    mov         eax,[0081D8C4];gvar_0081D8C4:?
 006173F1    mov         edx,dword ptr [eax+esi*4]
 006173F4    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 006173F9    mov         eax,dword ptr [eax]
 006173FB    mov         eax,dword ptr [eax+500]
 00617401    mov         ebx,dword ptr [eax]
 00617403    call        dword ptr [ebx+78]
 00617406    mov         bl,1
>00617408    jmp         00617420
 0061740A    mov         dword ptr [ebp-0C],esi
 0061740D    fild        dword ptr [ebp-0C]
 00617410    add         esp,0FFFFFFF8
 00617413    fstp        qword ptr [esp]
 00617416    wait
 00617417    mov         eax,ebx
 00617419    mov         edx,dword ptr [eax]
 0061741B    call        dword ptr [edx+58];TOscValue.SetValue
 0061741E    mov         ebx,eax
 00617420    xor         eax,eax
 00617422    pop         edx
 00617423    pop         ecx
 00617424    pop         ecx
 00617425    mov         dword ptr fs:[eax],edx
 00617428    push        61744B
 0061742D    lea         eax,[ebp-8]
 00617430    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 00617436    call        @DynArrayClear
 0061743B    lea         eax,[ebp-4]
 0061743E    call        @LStrClr
 00617443    ret
>00617444    jmp         @HandleFinally
>00617449    jmp         0061742D
 0061744B    mov         eax,ebx
 0061744D    pop         esi
 0061744E    pop         ebx
 0061744F    mov         esp,ebp
 00617451    pop         ebp
 00617452    ret
*}
end;

//00617454
function TOscValue.SetString(NewValue:string):Boolean;
begin
{*
 00617454    push        ebp
 00617455    mov         ebp,esp
 00617457    xor         ecx,ecx
 00617459    push        ecx
 0061745A    push        ecx
 0061745B    push        ecx
 0061745C    push        ecx
 0061745D    push        ebx
 0061745E    push        esi
 0061745F    mov         dword ptr [ebp-4],edx
 00617462    mov         ebx,eax
 00617464    mov         eax,dword ptr [ebp-4]
 00617467    call        @UStrAddRef
 0061746C    xor         eax,eax
 0061746E    push        ebp
 0061746F    push        6175A3
 00617474    push        dword ptr fs:[eax]
 00617477    mov         dword ptr fs:[eax],esp
 0061747A    mov         eax,dword ptr [ebx+20];TOscValue.Item:Integer
 0061747D    sub         eax,1
>00617480    jb          0061748E
 00617482    dec         eax
>00617483    je          0061754C
>00617489    jmp         00617563
 0061748E    lea         eax,[ebp-10]
 00617491    mov         edx,dword ptr [ebp-4]
 00617494    mov         ecx,0
 00617499    call        @LStrFromUStr
 0061749E    mov         edx,dword ptr [ebp-10]
 006174A1    lea         ecx,[ebp-8]
 006174A4    mov         eax,dword ptr [ebx+28];TOscValue.Address:AnsiString
 006174A7    call        00616298
 006174AC    mov         esi,dword ptr [ebp-8]
 006174AF    test        esi,esi
>006174B1    je          006174B8
 006174B3    sub         esi,4
 006174B6    mov         esi,dword ptr [esi]
 006174B8    push        esi
 006174B9    lea         eax,[ebp-0C]
 006174BC    mov         ecx,1
 006174C1    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 006174C7    call        @DynArraySetLength
 006174CC    add         esp,4
 006174CF    lea         eax,[ebp-8]
 006174D2    call        @UniqueStringA
 006174D7    mov         edx,eax
 006174D9    mov         eax,dword ptr [ebp-8]
 006174DC    test        eax,eax
>006174DE    je          006174E5
 006174E0    sub         eax,4
 006174E3    mov         eax,dword ptr [eax]
 006174E5    mov         ecx,dword ptr [ebp-0C]
 006174E8    xchg        ecx,edx
 006174EA    xchg        eax,ecx
 006174EB    call        Move
 006174F0    cmp         byte ptr ds:[78BD4C],0;gvar_0078BD4C
>006174F7    je          0061751E
 006174F9    push        0
 006174FB    mov         eax,[0081D8B4];gvar_0081D8B4:?
 00617500    mov         edx,dword ptr [ebx+18];TOscValue...........................................................
 00617503    movzx       ecx,word ptr [eax+edx*4]
 00617507    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0061750C    mov         eax,dword ptr [eax]
 0061750E    mov         eax,dword ptr [eax+500]
 00617514    mov         edx,dword ptr [ebp-0C]
 00617517    call        TIdUDPBase.Broadcast
>0061751C    jmp         00617548
 0061751E    mov         eax,dword ptr [ebp-0C]
 00617521    push        eax
 00617522    mov         eax,[0081D8B4];gvar_0081D8B4:?
 00617527    mov         esi,dword ptr [ebx+18];TOscValue...........................................................
 0061752A    movzx       ecx,word ptr [eax+esi*4]
 0061752E    mov         eax,[0081D8C4];gvar_0081D8C4:?
 00617533    mov         edx,dword ptr [eax+esi*4]
 00617536    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0061753B    mov         eax,dword ptr [eax]
 0061753D    mov         eax,dword ptr [eax+500]
 00617543    mov         ebx,dword ptr [eax]
 00617545    call        dword ptr [ebx+78]
 00617548    mov         bl,1
>0061754A    jmp         0061756F
 0061754C    mov         eax,[0081D8C4];gvar_0081D8C4:?
 00617551    mov         edx,dword ptr [ebx+18];TOscValue...........................................................
 00617554    lea         eax,[eax+edx*4]
 00617557    mov         edx,dword ptr [ebp-4]
 0061755A    call        @UStrAsg
 0061755F    mov         bl,1
>00617561    jmp         0061756F
 00617563    mov         edx,dword ptr [ebp-4]
 00617566    mov         eax,ebx
 00617568    call        TExpression.SetString
 0061756D    mov         ebx,eax
 0061756F    xor         eax,eax
 00617571    pop         edx
 00617572    pop         ecx
 00617573    pop         ecx
 00617574    mov         dword ptr fs:[eax],edx
 00617577    push        6175AA
 0061757C    lea         eax,[ebp-10]
 0061757F    call        @LStrClr
 00617584    lea         eax,[ebp-0C]
 00617587    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 0061758D    call        @DynArrayClear
 00617592    lea         eax,[ebp-8]
 00617595    call        @LStrClr
 0061759A    lea         eax,[ebp-4]
 0061759D    call        @UStrClr
 006175A2    ret
>006175A3    jmp         @HandleFinally
>006175A8    jmp         0061757C
 006175AA    mov         eax,ebx
 006175AC    pop         esi
 006175AD    pop         ebx
 006175AE    mov         esp,ebp
 006175B0    pop         ebp
 006175B1    ret
*}
end;

//006175B4
{*function TOscValue.SetValue(NewValue:Double; ?:?):Boolean;
begin
 006175B4    push        ebp
 006175B5    mov         ebp,esp
 006175B7    push        0
 006175B9    push        0
 006175BB    push        ebx
 006175BC    push        esi
 006175BD    mov         ebx,eax
 006175BF    xor         eax,eax
 006175C1    push        ebp
 006175C2    push        6177F1
 006175C7    push        dword ptr fs:[eax]
 006175CA    mov         dword ptr fs:[eax],esp
 006175CD    mov         eax,dword ptr [ebx+20];TOscValue.Item:Integer
 006175D0    cmp         eax,5
>006175D3    ja          006177CB
 006175D9    jmp         dword ptr [eax*4+6175E0]
 006175D9    dd          006175F8
 006175D9    dd          006176B1
 006175D9    dd          006177CB
 006175D9    dd          006177B4
 006175D9    dd          00617753
 006175D9    dd          006176CA
 006175F8    fld         qword ptr [ebp+8]
 006175FB    add         esp,0FFFFFFFC
 006175FE    fstp        dword ptr [esp]
 00617601    wait
 00617602    lea         edx,[ebp-4]
 00617605    mov         eax,dword ptr [ebx+28];TOscValue.Address:AnsiString
 00617608    call        006161F8
 0061760D    mov         esi,dword ptr [ebp-4]
 00617610    test        esi,esi
>00617612    je          00617619
 00617614    sub         esi,4
 00617617    mov         esi,dword ptr [esi]
 00617619    push        esi
 0061761A    lea         eax,[ebp-8]
 0061761D    mov         ecx,1
 00617622    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 00617628    call        @DynArraySetLength
 0061762D    add         esp,4
 00617630    lea         eax,[ebp-4]
 00617633    call        @UniqueStringA
 00617638    mov         edx,eax
 0061763A    mov         eax,dword ptr [ebp-4]
 0061763D    test        eax,eax
>0061763F    je          00617646
 00617641    sub         eax,4
 00617644    mov         eax,dword ptr [eax]
 00617646    mov         ecx,dword ptr [ebp-8]
 00617649    xchg        ecx,edx
 0061764B    xchg        eax,ecx
 0061764C    call        Move
 00617651    cmp         byte ptr ds:[78BD4C],0;gvar_0078BD4C
>00617658    je          00617682
 0061765A    push        0
 0061765C    mov         eax,[0081D8B4];gvar_0081D8B4:?
 00617661    mov         edx,dword ptr [ebx+18];TOscValue...........................................................
 00617664    movzx       ecx,word ptr [eax+edx*4]
 00617668    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0061766D    mov         eax,dword ptr [eax]
 0061766F    mov         eax,dword ptr [eax+500]
 00617675    mov         edx,dword ptr [ebp-8]
 00617678    call        TIdUDPBase.Broadcast
>0061767D    jmp         006177CB
 00617682    mov         eax,dword ptr [ebp-8]
 00617685    push        eax
 00617686    mov         eax,[0081D8B4];gvar_0081D8B4:?
 0061768B    mov         esi,dword ptr [ebx+18];TOscValue...........................................................
 0061768E    movzx       ecx,word ptr [eax+esi*4]
 00617692    mov         eax,[0081D8C4];gvar_0081D8C4:?
 00617697    mov         edx,dword ptr [eax+esi*4]
 0061769A    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0061769F    mov         eax,dword ptr [eax]
 006176A1    mov         eax,dword ptr [eax+500]
 006176A7    mov         ebx,dword ptr [eax]
 006176A9    call        dword ptr [ebx+78]
>006176AC    jmp         006177CB
 006176B1    fld         qword ptr [ebp+8]
 006176B4    call        @ROUND
 006176B9    mov         edx,dword ptr ds:[81D8B4];gvar_0081D8B4:?
 006176BF    mov         ecx,dword ptr [ebx+18];TOscValue...........................................................
 006176C2    mov         dword ptr [edx+ecx*4],eax
>006176C5    jmp         006177CB
 006176CA    mov         eax,[0081D8CC];gvar_0081D8CC:?
 006176CF    mov         edx,dword ptr [ebx+18];TOscValue...........................................................
 006176D2    cmp         byte ptr [eax+edx],0
>006176D6    je          0061770C
 006176D8    push        dword ptr [ebp+0C]
 006176DB    push        dword ptr [ebp+8]
 006176DE    call        00686060
 006176E3    test        al,al
>006176E5    jne         0061770C
 006176E7    mov         eax,[0081D8B8];gvar_0081D8B8:?
 006176EC    mov         edx,dword ptr [ebx+18];TOscValue...........................................................
 006176EF    mov         eax,dword ptr [eax+edx*4]
 006176F2    test        eax,eax
>006176F4    je          006176FB
 006176F6    call        00615A74
 006176FB    mov         eax,[0081D8CC];gvar_0081D8CC:?
 00617700    mov         edx,dword ptr [ebx+18];TOscValue...........................................................
 00617703    mov         byte ptr [eax+edx],0
>00617707    jmp         006177CB
 0061770C    mov         eax,[0081D8CC];gvar_0081D8CC:?
 00617711    mov         edx,dword ptr [ebx+18];TOscValue...........................................................
 00617714    cmp         byte ptr [eax+edx],0
>00617718    jne         006177CB
 0061771E    push        dword ptr [ebp+0C]
 00617721    push        dword ptr [ebp+8]
 00617724    call        00686060
 00617729    test        al,al
>0061772B    je          006177CB
 00617731    mov         eax,[0081D8B8];gvar_0081D8B8:?
 00617736    mov         edx,dword ptr [ebx+18];TOscValue...........................................................
 00617739    mov         eax,dword ptr [eax+edx*4]
 0061773C    test        eax,eax
>0061773E    je          00617745
 00617740    call        006159D0
 00617745    mov         eax,[0081D8CC];gvar_0081D8CC:?
 0061774A    mov         edx,dword ptr [ebx+18];TOscValue...........................................................
 0061774D    mov         byte ptr [eax+edx],1
>00617751    jmp         006177CB
 00617753    mov         eax,[0081D8CC];gvar_0081D8CC:?
 00617758    mov         esi,dword ptr [ebx+18];TOscValue...........................................................
 0061775B    cmp         byte ptr [eax+esi],0
>0061775F    je          0061779E
 00617761    fld         qword ptr [ebp+8]
 00617764    call        @ROUND
 00617769    push        edx
 0061776A    push        eax
 0061776B    mov         eax,[0081D8B8];gvar_0081D8B8:?
 00617770    mov         eax,dword ptr [eax+esi*4]
 00617773    cdq
 00617774    cmp         edx,dword ptr [esp+4]
>00617778    jne         0061777D
 0061777A    cmp         eax,dword ptr [esp]
 0061777D    pop         edx
 0061777E    pop         eax
>0061777F    je          0061779E
 00617781    mov         eax,[0081D8B8];gvar_0081D8B8:?
 00617786    mov         edx,dword ptr [ebx+18];TOscValue...........................................................
 00617789    mov         eax,dword ptr [eax+edx*4]
 0061778C    call        00615A74
 00617791    fld         qword ptr [ebp+8]
 00617794    call        @ROUND
 00617799    call        006159D0
 0061779E    fld         qword ptr [ebp+8]
 006177A1    call        @ROUND
 006177A6    mov         edx,dword ptr ds:[81D8B8];gvar_0081D8B8:?
 006177AC    mov         ecx,dword ptr [ebx+18];TOscValue...........................................................
 006177AF    mov         dword ptr [edx+ecx*4],eax
>006177B2    jmp         006177CB
 006177B4    push        dword ptr [ebp+0C]
 006177B7    push        dword ptr [ebp+8]
 006177BA    call        00686060
 006177BF    mov         edx,dword ptr ds:[81D8C8];gvar_0081D8C8:?
 006177C5    mov         ecx,dword ptr [ebx+18];TOscValue...........................................................
 006177C8    mov         byte ptr [edx+ecx],al
 006177CB    mov         bl,1
 006177CD    xor         eax,eax
 006177CF    pop         edx
 006177D0    pop         ecx
 006177D1    pop         ecx
 006177D2    mov         dword ptr fs:[eax],edx
 006177D5    push        6177F8
 006177DA    lea         eax,[ebp-8]
 006177DD    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 006177E3    call        @DynArrayClear
 006177E8    lea         eax,[ebp-4]
 006177EB    call        @LStrClr
 006177F0    ret
>006177F1    jmp         @HandleFinally
>006177F6    jmp         006177DA
 006177F8    mov         eax,ebx
 006177FA    pop         esi
 006177FB    pop         ebx
 006177FC    pop         ecx
 006177FD    pop         ecx
 006177FE    pop         ebp
 006177FF    ret         8
end;*}

//00617804
{*procedure TOscValue.ToString(?:?);
begin
 00617804    push        ebp
 00617805    mov         ebp,esp
 00617807    push        0
 00617809    push        0
 0061780B    push        0
 0061780D    push        ebx
 0061780E    push        esi
 0061780F    push        edi
 00617810    mov         esi,edx
 00617812    mov         ebx,eax
 00617814    xor         eax,eax
 00617816    push        ebp
 00617817    push        6178A7
 0061781C    push        dword ptr fs:[eax]
 0061781F    mov         dword ptr fs:[eax],esp
 00617822    mov         edi,dword ptr [ebx+18];TOscValue...........................................................
 00617825    test        edi,edi
>00617827    jle         0061784E
 00617829    push        6178C4;'Osc'
 0061782E    lea         edx,[ebp-4]
 00617831    mov         eax,edi
 00617833    call        IntToStr
 00617838    push        dword ptr [ebp-4]
 0061783B    push        6178D8;'.'
 00617840    mov         eax,esi
 00617842    mov         edx,3
 00617847    call        @UStrCatN
>0061784C    jmp         0061785A
 0061784E    mov         eax,esi
 00617850    mov         edx,6178E8;'Osc.'
 00617855    call        @UStrAsg
 0061785A    mov         edi,dword ptr [ebx+20];TOscValue.Item:Integer
 0061785D    test        edi,edi
>0061785F    jne         00617878
 00617861    lea         edx,[ebp-8]
 00617864    mov         eax,dword ptr [ebx+28];TOscValue.Address:AnsiString
 00617867    call        00615EF4
 0061786C    mov         edx,dword ptr [ebp-8]
 0061786F    mov         eax,esi
 00617871    call        @UStrCat
>00617876    jmp         0061788C
 00617878    lea         edx,[ebp-0C]
 0061787B    mov         eax,edi
 0061787D    call        00617AA4
 00617882    mov         edx,dword ptr [ebp-0C]
 00617885    mov         eax,esi
 00617887    call        @UStrCat
 0061788C    xor         eax,eax
 0061788E    pop         edx
 0061788F    pop         ecx
 00617890    pop         ecx
 00617891    mov         dword ptr fs:[eax],edx
 00617894    push        6178AE
 00617899    lea         eax,[ebp-0C]
 0061789C    mov         edx,3
 006178A1    call        @UStrArrayClr
 006178A6    ret
>006178A7    jmp         @HandleFinally
>006178AC    jmp         00617899
 006178AE    pop         edi
 006178AF    pop         esi
 006178B0    pop         ebx
 006178B1    mov         esp,ebp
 006178B3    pop         ebp
 006178B4    ret
end;*}

//006178F4
procedure sub_006178F4;
begin
{*
 006178F4    push        ebp
 006178F5    mov         ebp,esp
 006178F7    push        ebx
 006178F8    push        esi
 006178F9    push        edi
 006178FA    cmp         byte ptr ds:[81D8B0],0;gvar_0081D8B0
>00617901    je          00617976
 00617903    mov         eax,617988;'Starting Runtime Osc'
 00617908    call        004FA5FC
 0061790D    mov         dword ptr ds:[81D8C0],0B806;gvar_0081D8C0
 00617917    xor         edx,edx
 00617919    push        ebp
 0061791A    push        61795B
 0061791F    push        dword ptr fs:[edx]
 00617922    mov         dword ptr fs:[edx],esp
 00617925    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0061792A    mov         eax,dword ptr [eax]
 0061792C    mov         eax,dword ptr [eax+508]
 00617932    xor         edx,edx
 00617934    call        TIdUDPBase.SetActive
 00617939    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0061793E    mov         eax,dword ptr [eax]
 00617940    mov         eax,dword ptr [eax+508]
 00617946    mov         eax,dword ptr [eax+0B0]
 0061794C    call        TCollection.Clear
 00617951    xor         eax,eax
 00617953    pop         edx
 00617954    pop         ecx
 00617955    pop         ecx
 00617956    mov         dword ptr fs:[eax],edx
>00617959    jmp         00617976
>0061795B    jmp         @HandleOnException
 00617960    dd          1
 00617964    dd          00418C04;Exception
 00617968    dd          0061796C
 0061796C    call        004FA644
 00617971    call        @DoneExcept
 00617976    pop         edi
 00617977    pop         esi
 00617978    pop         ebx
 00617979    pop         ebp
 0061797A    ret
*}
end;

//006179B4
procedure sub_006179B4;
begin
{*
 006179B4    push        ebp
 006179B5    mov         ebp,esp
 006179B7    push        ebx
 006179B8    push        esi
 006179B9    push        edi
 006179BA    cmp         byte ptr ds:[81D8B0],0;gvar_0081D8B0
>006179C1    je          00617A14
 006179C3    mov         eax,617A28;'Stopping Runtime Osc'
 006179C8    call        004FA5FC
 006179CD    xor         edx,edx
 006179CF    push        ebp
 006179D0    push        6179F9
 006179D5    push        dword ptr fs:[edx]
 006179D8    mov         dword ptr fs:[edx],esp
 006179DB    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 006179E0    mov         eax,dword ptr [eax]
 006179E2    mov         eax,dword ptr [eax+508]
 006179E8    xor         edx,edx
 006179EA    call        TIdUDPBase.SetActive
 006179EF    xor         eax,eax
 006179F1    pop         edx
 006179F2    pop         ecx
 006179F3    pop         ecx
 006179F4    mov         dword ptr fs:[eax],edx
>006179F7    jmp         00617A14
>006179F9    jmp         @HandleOnException
 006179FE    dd          1
 00617A02    dd          00418C04;Exception
 00617A06    dd          00617A0A
 00617A0A    call        004FA644
 00617A0F    call        @DoneExcept
 00617A14    pop         edi
 00617A15    pop         esi
 00617A16    pop         ebx
 00617A17    pop         ebp
 00617A18    ret
*}
end;

//00617A54
{*function sub_00617A54(?:UnicodeString):?;
begin
 00617A54    push        ebp
 00617A55    mov         ebp,esp
 00617A57    push        ecx
 00617A58    push        ebx
 00617A59    mov         dword ptr [ebp-4],eax
 00617A5C    mov         eax,dword ptr [ebp-4]
 00617A5F    call        @UStrAddRef
 00617A64    xor         eax,eax
 00617A66    push        ebp
 00617A67    push        617A97
 00617A6C    push        dword ptr fs:[eax]
 00617A6F    mov         dword ptr fs:[eax],esp
 00617A72    mov         edx,dword ptr [ebp-4]
 00617A75    mov         eax,[0081D898];gvar_0081D898:THashTable
 00617A7A    call        THashTable.Get
 00617A7F    mov         ebx,eax
 00617A81    xor         eax,eax
 00617A83    pop         edx
 00617A84    pop         ecx
 00617A85    pop         ecx
 00617A86    mov         dword ptr fs:[eax],edx
 00617A89    push        617A9E
 00617A8E    lea         eax,[ebp-4]
 00617A91    call        @UStrClr
 00617A96    ret
>00617A97    jmp         @HandleFinally
>00617A9C    jmp         00617A8E
 00617A9E    mov         eax,ebx
 00617AA0    pop         ebx
 00617AA1    pop         ecx
 00617AA2    pop         ebp
 00617AA3    ret
end;*}

//00617AA4
{*procedure sub_00617AA4(?:Integer; ?:?);
begin
 00617AA4    push        ebx
 00617AA5    push        esi
 00617AA6    mov         esi,edx
 00617AA8    mov         ebx,eax
 00617AAA    mov         ecx,esi
 00617AAC    mov         edx,ebx
 00617AAE    mov         eax,[0081D898];gvar_0081D898:THashTable
 00617AB3    call        THashTable.Get
 00617AB8    pop         esi
 00617AB9    pop         ebx
 00617ABA    ret
end;*}

//00617ABC
{*function sub_00617ABC:?;
begin
 00617ABC    push        ebp
 00617ABD    mov         ebp,esp
 00617ABF    push        0
 00617AC1    push        ebx
 00617AC2    push        esi
 00617AC3    xor         eax,eax
 00617AC5    push        ebp
 00617AC6    push        617B20
 00617ACB    push        dword ptr fs:[eax]
 00617ACE    mov         dword ptr fs:[eax],esp
 00617AD1    mov         dl,1
 00617AD3    mov         eax,[0043C7BC];TStringList
 00617AD8    call        TStringList.Create;TStringList.Create
 00617ADD    mov         esi,eax
 00617ADF    mov         dl,1
 00617AE1    mov         eax,esi
 00617AE3    call        TStringList.SetSorted
 00617AE8    xor         ebx,ebx
 00617AEA    lea         edx,[ebp-4]
 00617AED    mov         eax,ebx
 00617AEF    call        00617AA4
 00617AF4    cmp         dword ptr [ebp-4],0
>00617AF8    je          00617B04
 00617AFA    mov         edx,dword ptr [ebp-4]
 00617AFD    mov         eax,esi
 00617AFF    mov         ecx,dword ptr [eax]
 00617B01    call        dword ptr [ecx+38];TStringList.Add
 00617B04    inc         ebx
 00617B05    cmp         ebx,6
>00617B08    jne         00617AEA
 00617B0A    xor         eax,eax
 00617B0C    pop         edx
 00617B0D    pop         ecx
 00617B0E    pop         ecx
 00617B0F    mov         dword ptr fs:[eax],edx
 00617B12    push        617B27
 00617B17    lea         eax,[ebp-4]
 00617B1A    call        @UStrClr
 00617B1F    ret
>00617B20    jmp         @HandleFinally
>00617B25    jmp         00617B17
 00617B27    mov         eax,esi
 00617B29    pop         esi
 00617B2A    pop         ebx
 00617B2B    pop         ecx
 00617B2C    pop         ebp
 00617B2D    ret
end;*}

//00617B30
{*function sub_00617B30(?:?):?;
begin
 00617B30    push        ebp
 00617B31    mov         ebp,esp
 00617B33    push        ecx
 00617B34    push        ebx
 00617B35    mov         dword ptr [ebp-4],eax
 00617B38    mov         eax,dword ptr [ebp-4]
 00617B3B    call        @UStrAddRef
 00617B40    xor         eax,eax
 00617B42    push        ebp
 00617B43    push        617B98
 00617B48    push        dword ptr fs:[eax]
 00617B4B    mov         dword ptr fs:[eax],esp
 00617B4E    lea         eax,[ebp-4]
 00617B51    mov         edx,617BB4;'Osc'
 00617B56    call        004F9BD0
 00617B5B    test        al,al
>00617B5D    jne         00617B63
 00617B5F    xor         ebx,ebx
>00617B61    jmp         00617B82
 00617B63    lea         eax,[ebp-4]
 00617B66    call        004F9D00
 00617B6B    lea         eax,[ebp-4]
 00617B6E    mov         edx,617BC8;'.'
 00617B73    call        004F9BD0
 00617B78    test        al,al
>00617B7A    jne         00617B80
 00617B7C    xor         ebx,ebx
>00617B7E    jmp         00617B82
 00617B80    mov         bl,1
 00617B82    xor         eax,eax
 00617B84    pop         edx
 00617B85    pop         ecx
 00617B86    pop         ecx
 00617B87    mov         dword ptr fs:[eax],edx
 00617B8A    push        617B9F
 00617B8F    lea         eax,[ebp-4]
 00617B92    call        @UStrClr
 00617B97    ret
>00617B98    jmp         @HandleFinally
>00617B9D    jmp         00617B8F
 00617B9F    mov         eax,ebx
 00617BA1    pop         ebx
 00617BA2    pop         ecx
 00617BA3    pop         ebp
 00617BA4    ret
end;*}

Initialization
//00781C28
{*
 00781C28    push        ebp
 00781C29    mov         ebp,esp
 00781C2B    push        ebx
 00781C2C    push        esi
 00781C2D    push        edi
 00781C2E    xor         eax,eax
 00781C30    push        ebp
 00781C31    push        781CB7
 00781C36    push        dword ptr fs:[eax]
 00781C39    mov         dword ptr fs:[eax],esp
 00781C3C    sub         dword ptr ds:[81D8BC],1
>00781C43    jae         00781CA9
 00781C45    xor         edx,edx
 00781C47    push        ebp
 00781C48    push        781C8E
 00781C4D    push        dword ptr fs:[edx]
 00781C50    mov         dword ptr fs:[edx],esp
 00781C53    mov         eax,781CD0;'Initializing PieOSC'
 00781C58    call        004FA5FC
 00781C5D    mov         dl,1
 00781C5F    mov         eax,[0067D4A4];THashTable
 00781C64    call        THashTable.Create;THashTable.Create
 00781C69    mov         [0081D898],eax;gvar_0081D898:THashTable
 00781C6E    mov         dl,1
 00781C70    mov         eax,[0067D4A4];THashTable
 00781C75    call        THashTable.Create;THashTable.Create
 00781C7A    mov         [0081D89C],eax;gvar_0081D89C:THashTable
 00781C7F    call        00616C94
 00781C84    xor         eax,eax
 00781C86    pop         edx
 00781C87    pop         ecx
 00781C88    pop         ecx
 00781C89    mov         dword ptr fs:[eax],edx
>00781C8C    jmp         00781CA9
>00781C8E    jmp         @HandleOnException
 00781C93    dd          1
 00781C97    dd          00418C04;Exception
 00781C9B    dd          00781C9F
 00781C9F    call        004FA644
 00781CA4    call        @DoneExcept
 00781CA9    xor         eax,eax
 00781CAB    pop         edx
 00781CAC    pop         ecx
 00781CAD    pop         ecx
 00781CAE    mov         dword ptr fs:[eax],edx
 00781CB1    push        781CBE
 00781CB6    ret
>00781CB7    jmp         @HandleFinally
>00781CBC    jmp         00781CB6
 00781CBE    pop         edi
 00781CBF    pop         esi
 00781CC0    pop         ebx
 00781CC1    pop         ebp
 00781CC2    ret
*}
Finalization
//00617BCC
{*
 00617BCC    push        ebp
 00617BCD    mov         ebp,esp
 00617BCF    push        ebx
 00617BD0    push        esi
 00617BD1    push        edi
 00617BD2    xor         eax,eax
 00617BD4    push        ebp
 00617BD5    push        617CE5
 00617BDA    push        dword ptr fs:[eax]
 00617BDD    mov         dword ptr fs:[eax],esp
 00617BE0    inc         dword ptr ds:[81D8BC]
>00617BE6    jne         00617CD7
 00617BEC    xor         edx,edx
 00617BEE    push        ebp
 00617BEF    push        617C32
 00617BF4    push        dword ptr fs:[edx]
 00617BF7    mov         dword ptr fs:[edx],esp
 00617BFA    mov         eax,617D00;'Finalizing PieOSC'
 00617BFF    call        004FA5FC
 00617C04    mov         eax,[0081D89C];gvar_0081D89C:THashTable
 00617C09    xor         edx,edx
 00617C0B    mov         dword ptr ds:[81D89C],edx;gvar_0081D89C:THashTable
 00617C11    call        TObject.Free
 00617C16    mov         eax,[0081D898];gvar_0081D898:THashTable
 00617C1B    xor         edx,edx
 00617C1D    mov         dword ptr ds:[81D898],edx;gvar_0081D898:THashTable
 00617C23    call        TObject.Free
 00617C28    xor         eax,eax
 00617C2A    pop         edx
 00617C2B    pop         ecx
 00617C2C    pop         ecx
 00617C2D    mov         dword ptr fs:[eax],edx
>00617C30    jmp         00617C4D
>00617C32    jmp         @HandleOnException
 00617C37    dd          1
 00617C3B    dd          00418C04;Exception
 00617C3F    dd          00617C43
 00617C43    call        004FA644
 00617C48    call        @DoneExcept
 00617C4D    mov         eax,81D8A4;gvar_0081D8A4:?
 00617C52    mov         edx,dword ptr ds:[6154B8];:1
 00617C58    call        @DynArrayClear
 00617C5D    mov         eax,81D8A8;gvar_0081D8A8:?
 00617C62    mov         edx,dword ptr ds:[6154E0];:2
 00617C68    call        @DynArrayClear
 00617C6D    mov         eax,81D8AC;gvar_0081D8AC:?
 00617C72    mov         edx,dword ptr ds:[615508];:3
 00617C78    call        @DynArrayClear
 00617C7D    mov         eax,81D8B4;gvar_0081D8B4:?
 00617C82    mov         edx,dword ptr ds:[615940];:5
 00617C88    call        @DynArrayClear
 00617C8D    mov         eax,81D8B8;gvar_0081D8B8:?
 00617C92    mov         edx,dword ptr ds:[615940];:5
 00617C98    call        @DynArrayClear
 00617C9D    mov         eax,78BD48;^'localhost'
 00617CA2    call        @LStrClr
 00617CA7    mov         eax,81D8C4;gvar_0081D8C4:?
 00617CAC    mov         edx,dword ptr ds:[615980];:7
 00617CB2    call        @DynArrayClear
 00617CB7    mov         eax,81D8C8;gvar_0081D8C8:?
 00617CBC    mov         edx,dword ptr ds:[6159A8];:8
 00617CC2    call        @DynArrayClear
 00617CC7    mov         eax,81D8CC;gvar_0081D8CC:?
 00617CCC    mov         edx,dword ptr ds:[6159A8];:8
 00617CD2    call        @DynArrayClear
 00617CD7    xor         eax,eax
 00617CD9    pop         edx
 00617CDA    pop         ecx
 00617CDB    pop         ecx
 00617CDC    mov         dword ptr fs:[eax],edx
 00617CDF    push        617CEC
 00617CE4    ret
>00617CE5    jmp         @HandleFinally
>00617CEA    jmp         00617CE4
 00617CEC    pop         edi
 00617CED    pop         esi
 00617CEE    pop         ebx
 00617CEF    pop         ebp
 00617CF0    ret
*}
end.