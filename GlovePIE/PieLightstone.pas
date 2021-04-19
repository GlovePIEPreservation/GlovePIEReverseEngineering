//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit PieLightstone;

interface

uses
  SysUtils, Classes;

type
  TLightstoneValue = class(TObjectValue)
  published
    function GetUnits:TUnits;//00768CD0
    //procedure GetString(?:?);//00768C5C
    procedure FillClone(c:TExpression);//00768C04
    function Module:TObject;//00768D60
    function GetPerUnits2:TUnits;//00768C50
    function GetPerUnits1:TUnits;//00768C44
    procedure SetValue(NewValue:Double);//00768D68
    function CanSet:Boolean;//00768BF0
    function GetDataType:TDataType;//00768C24
    procedure CreateClone;//00768BF4
    procedure GetValue;//00768CE0
    //procedure ToString(?:?);//00768D90
  public
    ..........................Item:Integer;//f20
    //procedure ToString(?:?); virtual;//00768D90
    procedure GetValue; virtual;//v2C//00768CE0
    //procedure GetString(?:?); virtual;//v38//00768C5C
    function GetDataType:TDataType; virtual;//v44//00768C24
    function GetUnits:TUnits; virtual;//v48//00768CD0
    function GetPerUnits1:TUnits; virtual;//v4C//00768C44
    function GetPerUnits2:TUnits; virtual;//v50//00768C50
    procedure SetValue(NewValue:Double); virtual;//v58//00768D68
    function CanSet:Boolean; virtual;//v68//00768BF0
    procedure CreateClone; virtual;//v80//00768BF4
    procedure FillClone(c:TExpression); virtual;//v84//00768C04
    function Module:TObject; virtual;//v98//00768D60
  end;
  TModuleLightstone = class(TPieModule)
  published
    procedure Read;//007692C0
    procedure ClearRead;//0076917C
    function CreateValue(Identifier:string):TExpression;//007691EC
    function GetDefaultFormat(field:string):TGuiFormat;//00769240
    procedure GetRange(blank:Boolean; min:Integer; max:Integer);//007692A4
    procedure GetGoodFields;//0076929C
    procedure StartCompiletime;//007692C8
    procedure StopRuntime;//007692F4
    procedure StartRuntime;//007692D4
    procedure AddFields;//00768FCC
    constructor Create;//00769184
    procedure StopCompiletime;//007692E0
  public
    function CreateValue(Identifier:string):TExpression; virtual;//v14//007691EC
    procedure GetGoodFields; virtual;//v1C//0076929C
    procedure AddFields; virtual;//v24//00768FCC
    procedure StartCompiletime; virtual;//v28//007692C8
    procedure StopCompiletime; virtual;//v2C//007692E0
    procedure StartRuntime; virtual;//v30//007692D4
    procedure StopRuntime; virtual;//v34//007692F4
    procedure ClearRead; virtual;//v38//0076917C
    procedure Read; virtual;//v3C//007692C0
    procedure GetRange(blank:Boolean; min:Integer; max:Integer); virtual;//v40//007692A4
    function GetDefaultFormat(field:string):TGuiFormat; virtual;//v44//00769240
  end;
    //function TG_GetNewConnectionId:?;//0076833C
    //function TG_Connect:?;//00768344
    TG_ReadPackets;//0076834C
    //function TG_GetValue:?;//00768354
    TG_FreeConnection;//0076835C
    //function sub_00768AFC(?:string):?;//00768AFC
    procedure sub_00768E84;//00768E84
    procedure sub_00768E8C;//00768E8C
    procedure sub_00768E90;//00768E90
    procedure sub_00768EA4;//00768EA4
    //function sub_00768EB8:?;//00768EB8
    //function sub_00768EC8(?:UnicodeString):?;//00768EC8
    //procedure sub_00768F1C(?:Integer; ?:?);//00768F1C
    //function sub_00768F38:?;//00768F38

implementation

//0076833C
{*function thinkgear.TG_GetNewConnectionId:?;
begin
 0076833C    jmp         dword ptr ds:[8269A4]
end;*}

//00768344
{*function thinkgear.TG_Connect:?;
begin
 00768344    jmp         dword ptr ds:[8269A0]
end;*}

//00768354
{*function thinkgear.TG_GetValue:?;
begin
 00768354    jmp         dword ptr ds:[826998]
end;*}

//00768AFC
{*function sub_00768AFC(?:string):?;
begin
 00768AFC    push        ebp
 00768AFD    mov         ebp,esp
 00768AFF    add         esp,0FFFFFFF8
 00768B02    push        ebx
 00768B03    push        esi
 00768B04    push        edi
 00768B05    xor         edx,edx
 00768B07    mov         dword ptr [ebp-8],edx
 00768B0A    mov         dword ptr [ebp-4],eax
 00768B0D    mov         eax,dword ptr [ebp-4]
 00768B10    call        @UStrAddRef
 00768B15    xor         eax,eax
 00768B17    push        ebp
 00768B18    push        768BA9
 00768B1D    push        dword ptr fs:[eax]
 00768B20    mov         dword ptr fs:[eax],esp
 00768B23    xor         ebx,ebx
 00768B25    lea         eax,[ebp-8]
 00768B28    mov         edx,dword ptr [ebp-4]
 00768B2B    call        @UStrLAsg
 00768B30    lea         eax,[ebp-8]
 00768B33    mov         edx,768BC8;'Lightstone'
 00768B38    call        004F9BD0
 00768B3D    test        al,al
>00768B3F    je          00768B8E
 00768B41    lea         eax,[ebp-8]
 00768B44    call        004F9D00
 00768B49    mov         esi,eax
 00768B4B    lea         eax,[ebp-8]
 00768B4E    mov         edx,768BEC;'.'
 00768B53    call        004F9BD0
 00768B58    test        al,al
>00768B5A    je          00768B8E
 00768B5C    mov         eax,dword ptr [ebp-8]
 00768B5F    call        00768EC8
 00768B64    mov         edi,eax
 00768B66    test        edi,edi
>00768B68    jl          00768B8E
 00768B6A    mov         dl,1
 00768B6C    mov         eax,[00768364];TLightstoneValue
 00768B71    call        TObject.Create;TLightstoneValue.Create
 00768B76    mov         ebx,eax
 00768B78    mov         dword ptr [ebx+20],edi;TLightstoneValue............................Item:Integer
 00768B7B    test        esi,esi
>00768B7D    jg          00768B84
 00768B7F    mov         esi,1
 00768B84    mov         dword ptr [ebx+18],esi;TLightstoneValue....................................................
 00768B87    mov         byte ptr ds:[822CE8],1;gvar_00822CE8
 00768B8E    xor         eax,eax
 00768B90    pop         edx
 00768B91    pop         ecx
 00768B92    pop         ecx
 00768B93    mov         dword ptr fs:[eax],edx
 00768B96    push        768BB0
 00768B9B    lea         eax,[ebp-8]
 00768B9E    mov         edx,2
 00768BA3    call        @UStrArrayClr
 00768BA8    ret
>00768BA9    jmp         @HandleFinally
>00768BAE    jmp         00768B9B
 00768BB0    mov         eax,ebx
 00768BB2    pop         edi
 00768BB3    pop         esi
 00768BB4    pop         ebx
 00768BB5    pop         ecx
 00768BB6    pop         ecx
 00768BB7    pop         ebp
 00768BB8    ret
end;*}

//00768BF0
function TLightstoneValue.CanSet:Boolean;
begin
{*
 00768BF0    xor         eax,eax
 00768BF2    ret
*}
end;

//00768BF4
procedure TLightstoneValue.CreateClone;
begin
{*
 00768BF4    mov         dl,1
 00768BF6    mov         eax,[00768364];TLightstoneValue
 00768BFB    call        TObject.Create;TLightstoneValue.Create
 00768C00    ret
*}
end;

//00768C04
procedure TLightstoneValue.FillClone(c:TExpression);
begin
{*
 00768C04    push        ebx
 00768C05    push        esi
 00768C06    mov         esi,edx
 00768C08    mov         ebx,eax
 00768C0A    mov         edx,esi
 00768C0C    mov         eax,ebx
 00768C0E    call        TExpression.FillClone
 00768C13    mov         eax,esi
 00768C15    mov         edx,dword ptr [ebx+20];TLightstoneValue.............................Item:Integer
 00768C18    mov         dword ptr [eax+20],edx
 00768C1B    mov         edx,dword ptr [ebx+18];TLightstoneValue....................................................
 00768C1E    mov         dword ptr [eax+18],edx
 00768C21    pop         esi
 00768C22    pop         ebx
 00768C23    ret
*}
end;

//00768C24
function TLightstoneValue.GetDataType:TDataType;
begin
{*
 00768C24    mov         eax,dword ptr [eax+20];TLightstoneValue..............................Item:Integer
 00768C27    sub         eax,1
>00768C2A    jb          00768C38
 00768C2C    add         eax,0FFFFFFFE
 00768C2F    sub         eax,2
>00768C32    jb          00768C3E
>00768C34    je          00768C3B
>00768C36    jmp         00768C41
 00768C38    mov         al,3
 00768C3A    ret
 00768C3B    mov         al,2
 00768C3D    ret
 00768C3E    mov         al,4
 00768C40    ret
 00768C41    xor         eax,eax
 00768C43    ret
*}
end;

//00768C44
function TLightstoneValue.GetPerUnits1:TUnits;
begin
{*
 00768C44    mov         eax,dword ptr [eax+20];TLightstoneValue...............................Item:Integer
 00768C47    dec         eax
>00768C48    jne         00768C4D
 00768C4A    xor         eax,eax
 00768C4C    ret
 00768C4D    xor         eax,eax
 00768C4F    ret
*}
end;

//00768C50
function TLightstoneValue.GetPerUnits2:TUnits;
begin
{*
 00768C50    mov         eax,dword ptr [eax+20];TLightstoneValue................................Item:Integer
 00768C53    dec         eax
>00768C54    jne         00768C59
 00768C56    xor         eax,eax
 00768C58    ret
 00768C59    xor         eax,eax
 00768C5B    ret
*}
end;

//00768C5C
{*procedure TLightstoneValue.GetString(?:?);
begin
 00768C5C    push        ebx
 00768C5D    push        esi
 00768C5E    push        edi
 00768C5F    mov         edi,edx
 00768C61    mov         ebx,eax
 00768C63    mov         eax,dword ptr [ebx+20];TLightstoneValue.................................Item:Integer
 00768C66    cmp         eax,3
>00768C69    je          00768C7B
 00768C6B    cmp         eax,4
>00768C6E    je          00768C7B
 00768C70    mov         edx,edi
 00768C72    mov         eax,ebx
 00768C74    call        TExpression.GetString
>00768C79    jmp         00768CCB
 00768C7B    call        0074BF10
 00768C80    mov         edx,dword ptr [ebx+18];TLightstoneValue....................................................
 00768C83    call        TWiimoteManager.GetLightstone
 00768C88    mov         esi,eax
 00768C8A    test        esi,esi
>00768C8C    jne         00768C97
 00768C8E    mov         eax,edi
 00768C90    call        @UStrClr
>00768C95    jmp         00768CCB
 00768C97    mov         eax,dword ptr [ebx+20];TLightstoneValue..................................Item:Integer
 00768C9A    sub         eax,3
>00768C9D    je          00768CA4
 00768C9F    dec         eax
>00768CA0    je          00768CB3
>00768CA2    jmp         00768CC2
 00768CA4    mov         eax,edi
 00768CA6    mov         edx,dword ptr [esi+94];TLightstoneObject.SerString:string
 00768CAC    call        @UStrAsg
>00768CB1    jmp         00768CCB
 00768CB3    mov         eax,edi
 00768CB5    mov         edx,dword ptr [esi+98];TLightstoneObject.VerString:string
 00768CBB    call        @UStrAsg
>00768CC0    jmp         00768CCB
 00768CC2    mov         edx,edi
 00768CC4    mov         eax,ebx
 00768CC6    call        TExpression.GetString
 00768CCB    pop         edi
 00768CCC    pop         esi
 00768CCD    pop         ebx
 00768CCE    ret
end;*}

//00768CD0
function TLightstoneValue.GetUnits:TUnits;
begin
{*
 00768CD0    mov         eax,dword ptr [eax+20];TLightstoneValue...................................Item:Integer
 00768CD3    sub         eax,1
>00768CD6    jae         00768CDB
 00768CD8    xor         eax,eax
 00768CDA    ret
 00768CDB    xor         eax,eax
 00768CDD    ret
*}
end;

//00768CE0
procedure TLightstoneValue.GetValue;
begin
{*
 00768CE0    push        ebx
 00768CE1    add         esp,0FFFFFFF4
 00768CE4    mov         ebx,eax
 00768CE6    call        0074BF10
 00768CEB    cmp         dword ptr [ebx+20],5;TLightstoneValue....................................Item:Integer
>00768CEF    jne         00768CFD
 00768CF1    mov         eax,dword ptr [eax+68]
 00768CF4    fild        dword ptr [eax+8]
 00768CF7    fstp        qword ptr [esp]
 00768CFA    wait
>00768CFB    jmp         00768D57
 00768CFD    mov         edx,dword ptr [ebx+18];TLightstoneValue....................................................
 00768D00    call        TWiimoteManager.GetLightstone
 00768D05    test        eax,eax
>00768D07    jne         00768D14
 00768D09    xor         eax,eax
 00768D0B    mov         dword ptr [esp],eax
 00768D0E    mov         dword ptr [esp+4],eax
>00768D12    jmp         00768D57
 00768D14    mov         edx,dword ptr [ebx+20];TLightstoneValue.....................................Item:Integer
 00768D17    sub         edx,1
>00768D1A    jb          00768D23
>00768D1C    je          00768D38
 00768D1E    dec         edx
>00768D1F    je          00768D43
>00768D21    jmp         00768D4E
 00768D23    movzx       eax,byte ptr [eax+18];TLightstoneObject.Connected:Boolean
 00768D27    movsx       eax,al
 00768D2A    mov         dword ptr [esp+8],eax
 00768D2E    fild        dword ptr [esp+8]
 00768D32    fstp        qword ptr [esp]
 00768D35    wait
>00768D36    jmp         00768D57
 00768D38    call        TLightstoneObject.HeartRateVariance
 00768D3D    fstp        qword ptr [esp]
 00768D40    wait
>00768D41    jmp         00768D57
 00768D43    call        TLightstoneObject.SkinConductanceLevel
 00768D48    fstp        qword ptr [esp]
 00768D4B    wait
>00768D4C    jmp         00768D57
 00768D4E    xor         eax,eax
 00768D50    mov         dword ptr [esp],eax
 00768D53    mov         dword ptr [esp+4],eax
 00768D57    fld         qword ptr [esp]
 00768D5A    add         esp,0C
 00768D5D    pop         ebx
 00768D5E    ret
*}
end;

//00768D60
function TLightstoneValue.Module:TObject;
begin
{*
 00768D60    mov         eax,[00822CF0];gvar_00822CF0:TModuleLightstone
 00768D65    ret
*}
end;

//00768D68
procedure TLightstoneValue.SetValue(NewValue:Double);
begin
{*
 00768D68    push        ebp
 00768D69    mov         ebp,esp
 00768D6B    mov         edx,dword ptr [eax+18];TLightstoneValue....................................................
 00768D6E    test        edx,edx
>00768D70    jl          00768D7A
 00768D72    cmp         edx,3E7
>00768D78    jle         00768D7E
 00768D7A    xor         eax,eax
>00768D7C    jmp         00768D8C
 00768D7E    mov         eax,dword ptr [eax+20];TLightstoneValue......................................Item:Intege...
 00768D81    sub         eax,1
>00768D84    jae         00768D8A
 00768D86    xor         eax,eax
>00768D88    jmp         00768D8C
 00768D8A    xor         eax,eax
 00768D8C    pop         ebp
 00768D8D    ret         8
*}
end;

//00768D90
{*procedure TLightstoneValue.ToString(?:?);
begin
 00768D90    push        ebp
 00768D91    mov         ebp,esp
 00768D93    push        0
 00768D95    push        0
 00768D97    push        0
 00768D99    push        ebx
 00768D9A    push        esi
 00768D9B    push        edi
 00768D9C    mov         esi,edx
 00768D9E    mov         ebx,eax
 00768DA0    xor         eax,eax
 00768DA2    push        ebp
 00768DA3    push        768E1D
 00768DA8    push        dword ptr fs:[eax]
 00768DAB    mov         dword ptr fs:[eax],esp
 00768DAE    mov         edi,dword ptr [ebx+18];TLightstoneValue....................................................
 00768DB1    test        edi,edi
>00768DB3    jle         00768DE8
 00768DB5    push        768E38;'Lightstone'
 00768DBA    lea         edx,[ebp-4]
 00768DBD    mov         eax,edi
 00768DBF    call        IntToStr
 00768DC4    push        dword ptr [ebp-4]
 00768DC7    push        768E5C;'.'
 00768DCC    lea         edx,[ebp-8]
 00768DCF    mov         eax,dword ptr [ebx+20];TLightstoneValue.......................................Item:Integ...
 00768DD2    call        00768F1C
 00768DD7    push        dword ptr [ebp-8]
 00768DDA    mov         eax,esi
 00768DDC    mov         edx,4
 00768DE1    call        @UStrCatN
>00768DE6    jmp         00768E02
 00768DE8    lea         edx,[ebp-0C]
 00768DEB    mov         eax,dword ptr [ebx+20];TLightstoneValue........................................Item:Inte...
 00768DEE    call        00768F1C
 00768DF3    mov         ecx,dword ptr [ebp-0C]
 00768DF6    mov         eax,esi
 00768DF8    mov         edx,768E6C;'Lightstone.'
 00768DFD    call        @UStrCat3
 00768E02    xor         eax,eax
 00768E04    pop         edx
 00768E05    pop         ecx
 00768E06    pop         ecx
 00768E07    mov         dword ptr fs:[eax],edx
 00768E0A    push        768E24
 00768E0F    lea         eax,[ebp-0C]
 00768E12    mov         edx,3
 00768E17    call        @UStrArrayClr
 00768E1C    ret
>00768E1D    jmp         @HandleFinally
>00768E22    jmp         00768E0F
 00768E24    pop         edi
 00768E25    pop         esi
 00768E26    pop         ebx
 00768E27    mov         esp,ebp
 00768E29    pop         ebp
 00768E2A    ret
end;*}

//00768E84
procedure sub_00768E84;
begin
{*
 00768E84    mov         byte ptr ds:[822CE8],0;gvar_00822CE8
 00768E8B    ret
*}
end;

//00768E8C
procedure sub_00768E8C;
begin
{*
 00768E8C    ret
*}
end;

//00768E90
procedure sub_00768E90;
begin
{*
 00768E90    cmp         byte ptr ds:[822CE8],0;gvar_00822CE8
>00768E97    je          00768EA3
 00768E99    call        0074BF10
 00768E9E    call        TWiimoteManager.StartRuntime
 00768EA3    ret
*}
end;

//00768EA4
procedure sub_00768EA4;
begin
{*
 00768EA4    cmp         byte ptr ds:[822CE8],0;gvar_00822CE8
>00768EAB    je          00768EB7
 00768EAD    call        0074BF10
 00768EB2    call        TWiimoteManager.StopRuntime
 00768EB7    ret
*}
end;

//00768EB8
{*function sub_00768EB8:?;
begin
 00768EB8    call        0074BF10
 00768EBD    call        TWiimoteManager.ReadLightstones
 00768EC2    mov         al,1
 00768EC4    ret
end;*}

//00768EC8
{*function sub_00768EC8(?:UnicodeString):?;
begin
 00768EC8    push        ebp
 00768EC9    mov         ebp,esp
 00768ECB    push        ecx
 00768ECC    push        ebx
 00768ECD    mov         dword ptr [ebp-4],eax
 00768ED0    mov         eax,dword ptr [ebp-4]
 00768ED3    call        @UStrAddRef
 00768ED8    xor         eax,eax
 00768EDA    push        ebp
 00768EDB    push        768F0E
 00768EE0    push        dword ptr fs:[eax]
 00768EE3    mov         dword ptr fs:[eax],esp
 00768EE6    mov         eax,[00822CF0];gvar_00822CF0:TModuleLightstone
 00768EEB    mov         eax,dword ptr [eax+1C]
 00768EEE    mov         edx,dword ptr [ebp-4]
 00768EF1    call        THashTable.Get
 00768EF6    mov         ebx,eax
 00768EF8    xor         eax,eax
 00768EFA    pop         edx
 00768EFB    pop         ecx
 00768EFC    pop         ecx
 00768EFD    mov         dword ptr fs:[eax],edx
 00768F00    push        768F15
 00768F05    lea         eax,[ebp-4]
 00768F08    call        @UStrClr
 00768F0D    ret
>00768F0E    jmp         @HandleFinally
>00768F13    jmp         00768F05
 00768F15    mov         eax,ebx
 00768F17    pop         ebx
 00768F18    pop         ecx
 00768F19    pop         ebp
 00768F1A    ret
end;*}

//00768F1C
{*procedure sub_00768F1C(?:Integer; ?:?);
begin
 00768F1C    push        ebx
 00768F1D    push        esi
 00768F1E    mov         esi,edx
 00768F20    mov         ebx,eax
 00768F22    mov         ecx,esi
 00768F24    mov         eax,[00822CF0];gvar_00822CF0:TModuleLightstone
 00768F29    mov         eax,dword ptr [eax+1C]
 00768F2C    mov         edx,ebx
 00768F2E    call        THashTable.Get
 00768F33    pop         esi
 00768F34    pop         ebx
 00768F35    ret
end;*}

//00768F38
{*function sub_00768F38:?;
begin
 00768F38    push        ebx
 00768F39    mov         dl,1
 00768F3B    mov         eax,[0043C7BC];TStringList
 00768F40    call        TStringList.Create;TStringList.Create
 00768F45    mov         ebx,eax
 00768F47    mov         edx,768F70;'HeartRateVariance'
 00768F4C    mov         eax,ebx
 00768F4E    mov         ecx,dword ptr [eax]
 00768F50    call        dword ptr [ecx+38];TStringList.Add
 00768F53    mov         edx,768FA0;'SkinConductanceLevel'
 00768F58    mov         eax,ebx
 00768F5A    mov         ecx,dword ptr [eax]
 00768F5C    call        dword ptr [ecx+38];TStringList.Add
 00768F5F    mov         eax,ebx
 00768F61    pop         ebx
 00768F62    ret
end;*}

//00768FCC
procedure TModuleLightstone.AddFields;
begin
{*
 00768FCC    push        ebx
 00768FCD    mov         ebx,eax
 00768FCF    mov         eax,ebx
 00768FD1    call        TPieModule.AddFields
 00768FD6    xor         ecx,ecx
 00768FD8    mov         edx,769074;'exists'
 00768FDD    mov         eax,dword ptr [ebx+1C];TModuleLightstone.Fields:THashTable
 00768FE0    call        THashTable.Add
 00768FE5    mov         ecx,5
 00768FEA    mov         edx,769090;'count'
 00768FEF    mov         eax,dword ptr [ebx+1C];TModuleLightstone.Fields:THashTable
 00768FF2    call        THashTable.Add
 00768FF7    mov         ecx,1
 00768FFC    mov         edx,7690A8;'HeartRateVariance'
 00769001    mov         eax,dword ptr [ebx+1C];TModuleLightstone.Fields:THashTable
 00769004    call        THashTable.Add
 00769009    mov         ecx,1
 0076900E    mov         edx,7690D8;'HRV'
 00769013    mov         eax,dword ptr [ebx+1C];TModuleLightstone.Fields:THashTable
 00769016    call        THashTable.Add
 0076901B    mov         ecx,2
 00769020    mov         edx,7690EC;'SkinConductanceLevel'
 00769025    mov         eax,dword ptr [ebx+1C];TModuleLightstone.Fields:THashTable
 00769028    call        THashTable.Add
 0076902D    mov         ecx,2
 00769032    mov         edx,769124;'SCL'
 00769037    mov         eax,dword ptr [ebx+1C];TModuleLightstone.Fields:THashTable
 0076903A    call        THashTable.Add
 0076903F    mov         ecx,3
 00769044    mov         edx,769138;'SerialString'
 00769049    mov         eax,dword ptr [ebx+1C];TModuleLightstone.Fields:THashTable
 0076904C    call        THashTable.Add
 00769051    mov         ecx,4
 00769056    mov         edx,769160;'VersionString'
 0076905B    mov         eax,dword ptr [ebx+1C];TModuleLightstone.Fields:THashTable
 0076905E    call        THashTable.Add
 00769063    pop         ebx
 00769064    ret
*}
end;

//0076917C
procedure TModuleLightstone.ClearRead;
begin
{*
 0076917C    call        TPieModule.ClearRead
 00769181    ret
*}
end;

//00769184
constructor TModuleLightstone.Create;
begin
{*
 00769184    push        ebx
 00769185    push        esi
 00769186    test        dl,dl
>00769188    je          00769192
 0076918A    add         esp,0FFFFFFF0
 0076918D    call        @ClassCreate
 00769192    mov         ebx,edx
 00769194    mov         esi,eax
 00769196    push        0
 00769198    push        0
 0076919A    push        0
 0076919C    push        0
 0076919E    mov         ecx,7691D4;'Lightstone'
 007691A3    xor         edx,edx
 007691A5    mov         eax,esi
 007691A7    call        005E48EC
 007691AC    mov         eax,esi
 007691AE    test        bl,bl
>007691B0    je          007691C1
 007691B2    call        @AfterConstruction
 007691B7    pop         dword ptr fs:[0]
 007691BE    add         esp,0C
 007691C1    mov         eax,esi
 007691C3    pop         esi
 007691C4    pop         ebx
 007691C5    ret
*}
end;

//007691EC
function TModuleLightstone.CreateValue(Identifier:string):TExpression;
begin
{*
 007691EC    push        ebp
 007691ED    mov         ebp,esp
 007691EF    push        ecx
 007691F0    push        ebx
 007691F1    mov         dword ptr [ebp-4],edx
 007691F4    mov         ebx,eax
 007691F6    mov         eax,dword ptr [ebp-4]
 007691F9    call        @UStrAddRef
 007691FE    xor         eax,eax
 00769200    push        ebp
 00769201    push        769230
 00769206    push        dword ptr fs:[eax]
 00769209    mov         dword ptr fs:[eax],esp
 0076920C    mov         byte ptr [ebx+24],1;TModuleLightstone.Used:Boolean
 00769210    mov         eax,dword ptr [ebp-4]
 00769213    call        00768AFC
 00769218    mov         ebx,eax
 0076921A    xor         eax,eax
 0076921C    pop         edx
 0076921D    pop         ecx
 0076921E    pop         ecx
 0076921F    mov         dword ptr fs:[eax],edx
 00769222    push        769237
 00769227    lea         eax,[ebp-4]
 0076922A    call        @UStrClr
 0076922F    ret
>00769230    jmp         @HandleFinally
>00769235    jmp         00769227
 00769237    mov         eax,ebx
 00769239    pop         ebx
 0076923A    pop         ecx
 0076923B    pop         ebp
 0076923C    ret
*}
end;

//00769240
function TModuleLightstone.GetDefaultFormat(field:string):TGuiFormat;
begin
{*
 00769240    push        ebp
 00769241    mov         ebp,esp
 00769243    push        ecx
 00769244    push        ebx
 00769245    mov         dword ptr [ebp-4],edx
 00769248    mov         ebx,eax
 0076924A    mov         eax,dword ptr [ebp-4]
 0076924D    call        @UStrAddRef
 00769252    xor         eax,eax
 00769254    push        ebp
 00769255    push        76928C
 0076925A    push        dword ptr fs:[eax]
 0076925D    mov         dword ptr fs:[eax],esp
 00769260    mov         edx,dword ptr [ebp-4]
 00769263    mov         eax,dword ptr [ebx+1C];TModuleLightstone.Fields:THashTable
 00769266    call        THashTable.Get
 0076926B    sub         eax,1
>0076926E    jae         00769274
 00769270    xor         ebx,ebx
>00769272    jmp         00769276
 00769274    mov         bl,9
 00769276    xor         eax,eax
 00769278    pop         edx
 00769279    pop         ecx
 0076927A    pop         ecx
 0076927B    mov         dword ptr fs:[eax],edx
 0076927E    push        769293
 00769283    lea         eax,[ebp-4]
 00769286    call        @UStrClr
 0076928B    ret
>0076928C    jmp         @HandleFinally
>00769291    jmp         00769283
 00769293    mov         eax,ebx
 00769295    pop         ebx
 00769296    pop         ecx
 00769297    pop         ebp
 00769298    ret
*}
end;

//0076929C
procedure TModuleLightstone.GetGoodFields;
begin
{*
 0076929C    call        00768F38
 007692A1    ret
*}
end;

//007692A4
procedure TModuleLightstone.GetRange(blank:Boolean; min:Integer; max:Integer);
begin
{*
 007692A4    push        ebp
 007692A5    mov         ebp,esp
 007692A7    mov         byte ptr [edx],1
 007692AA    mov         dword ptr [ecx],1
 007692B0    mov         eax,dword ptr [ebp+8]
 007692B3    mov         dword ptr [eax],14
 007692B9    pop         ebp
 007692BA    ret         4
*}
end;

//007692C0
procedure TModuleLightstone.Read;
begin
{*
 007692C0    call        00768EB8
 007692C5    ret
*}
end;

//007692C8
procedure TModuleLightstone.StartCompiletime;
begin
{*
 007692C8    call        TPieModule.StartCompiletime
 007692CD    call        00768E84
 007692D2    ret
*}
end;

//007692D4
procedure TModuleLightstone.StartRuntime;
begin
{*
 007692D4    call        TPieModule.StartRuntime
 007692D9    call        00768E90
 007692DE    ret
*}
end;

//007692E0
procedure TModuleLightstone.StopCompiletime;
begin
{*
 007692E0    push        ebx
 007692E1    mov         ebx,eax
 007692E3    call        00768E8C
 007692E8    mov         eax,ebx
 007692EA    call        TPieModule.StopCompiletime
 007692EF    pop         ebx
 007692F0    ret
*}
end;

//007692F4
procedure TModuleLightstone.StopRuntime;
begin
{*
 007692F4    push        ebx
 007692F5    mov         ebx,eax
 007692F7    call        00768EA4
 007692FC    mov         eax,ebx
 007692FE    call        TPieModule.StopRuntime
 00769303    pop         ebx
 00769304    ret
*}
end;

Initialization
//00782FF4
{*
 00782FF4    sub         dword ptr ds:[822CEC],1
>00782FFB    jae         00783018
 00782FFD    mov         dl,1
 00782FFF    mov         eax,[0076873C];TModuleLightstone
 00783004    call        TModuleLightstone.Create;TModuleLightstone.Create
 00783009    mov         [00822CF0],eax;gvar_00822CF0:TModuleLightstone
 0078300E    mov         eax,[00822CF0];gvar_00822CF0:TModuleLightstone
 00783013    call        005E31AC
 00783018    ret
*}
Finalization
end.