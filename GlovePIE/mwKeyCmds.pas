//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit mwKeyCmds;

interface

uses
  SysUtils, Classes;

type
  EmwKeyError = class(Exception)
  end;
  TmwKeyStroke = class(TCollectionItem)
  published
    procedure Assign(Source:TPersistent);//0050EE70
  public
    FKey:word;//fC
    FShift:TShiftState;//fE
    FKey2:word;//f10
    FShift2:TShiftState;//f12
    FCommand:TmwEditorCommand;//f14
    procedure Assign(Source:TPersistent); virtual;//v8//0050EE70
    //procedure GetDisplayName(?:?); virtual;//vC//0050EED0
    //function GetShortCut:?;//0050EFAC
    procedure SetCommand(Value:TmwEditorCommand);//0050EFBC
    procedure SetShortCut(Value:TShortCut);//0050EFF4
    procedure SetShortCut2(Value:TShortCut);//0050F0E4
    procedure GetShortCut2;//0050F1A8
  end;
  TmwKeyStrokes = class(TCollection)
  published
    function FindShortcut2(SC:TShortCut; SC2:TShortCut):Integer;//0050F3EC
    function FindKeycode(Code:Word; SS:TShiftState):Integer;//0050F2B0
    procedure ResetDefaults;//0050F4A8
    function FindKeycode2(Code1:Word; SS1:TShiftState; SS2:TShiftState; Code2:Word):Integer;//0050F360
    function Add:TmwKeyStroke;//0050F1B8
    constructor Create(AOwner:TPersistent);//0050F22C
    procedure Assign(Source:TPersistent);//0050F1C4
    function FindShortcut(SC:TShortCut):Integer;//0050F31C
    function FindCommand(Cmd:TmwEditorCommand):Integer;//0050F270
  public
    ....FOwner:TPersistent;//f18
    procedure Assign(Source:TPersistent); virtual;//v8//0050F1C4
    procedure sub_00446E30; dynamic;//0050F464
  end;
    //function sub_0050EE3C:?;//0050EE3C
    //procedure sub_0050EE4C(?:TmwEditorCommand; ?:?);//0050EE4C
    //procedure GetDisplayName(?:?);//0050EED0
    procedure sub_0050EFC8(?:TmwKeyStroke; ?:Word);//0050EFC8
    procedure sub_0050EFD4(?:TmwKeyStroke; ?:TShiftState);//0050EFD4
    procedure sub_0050F0B8(?:TmwKeyStroke; ?:Word);//0050F0B8
    procedure sub_0050F0C4(?:TmwKeyStroke; ?:TShiftState);//0050F0C4
    //function sub_0050F450(?:TmwKeyStrokes; ?:Integer):?;//0050F450
    procedure sub_00446E30;//0050F464
    //procedure sub_0050F468(?:?; ?:?; ?:?; ?:?);//0050F468

implementation

//0050EE3C
{*function sub_0050EE3C:?;
begin
 0050EE3C    push        58
 0050EE3E    mov         ecx,786910;gvar_00786910:array[89] of ?
 0050EE43    call        IntToIdent
 0050EE48    ret
end;*}

//0050EE4C
{*procedure sub_0050EE4C(?:TmwEditorCommand; ?:?);
begin
 0050EE4C    push        ebx
 0050EE4D    push        esi
 0050EE4E    push        edi
 0050EE4F    mov         esi,edx
 0050EE51    mov         ebx,eax
 0050EE53    mov         edx,esi
 0050EE55    movzx       edi,bx
 0050EE58    mov         eax,edi
 0050EE5A    call        0050EE3C
 0050EE5F    test        al,al
>0050EE61    jne         0050EE6C
 0050EE63    mov         edx,esi
 0050EE65    mov         eax,edi
 0050EE67    call        IntToStr
 0050EE6C    pop         edi
 0050EE6D    pop         esi
 0050EE6E    pop         ebx
 0050EE6F    ret
end;*}

//0050EE70
procedure TmwKeyStroke.Assign(Source:TPersistent);
begin
{*
 0050EE70    push        ebx
 0050EE71    push        esi
 0050EE72    push        edi
 0050EE73    mov         esi,edx
 0050EE75    mov         ebx,eax
 0050EE77    mov         eax,esi
 0050EE79    mov         edx,dword ptr ds:[50DB70];TmwKeyStroke
 0050EE7F    call        @IsClass
 0050EE84    test        al,al
>0050EE86    je          0050EEC3
 0050EE88    mov         edi,esi
 0050EE8A    movzx       edx,word ptr [edi+0C]
 0050EE8E    mov         eax,ebx
 0050EE90    call        0050EFC8
 0050EE95    movzx       edx,word ptr [edi+0E]
 0050EE99    mov         eax,ebx
 0050EE9B    call        0050EFD4
 0050EEA0    movzx       edx,word ptr [edi+10]
 0050EEA4    mov         eax,ebx
 0050EEA6    call        0050F0B8
 0050EEAB    movzx       edx,word ptr [edi+12]
 0050EEAF    mov         eax,ebx
 0050EEB1    call        0050F0C4
 0050EEB6    movzx       edx,word ptr [edi+14]
 0050EEBA    mov         eax,ebx
 0050EEBC    call        TmwKeyStroke.SetCommand
>0050EEC1    jmp         0050EECC
 0050EEC3    mov         edx,esi
 0050EEC5    mov         eax,ebx
 0050EEC7    call        TPersistent.Assign
 0050EECC    pop         edi
 0050EECD    pop         esi
 0050EECE    pop         ebx
 0050EECF    ret
*}
end;

//0050EED0
{*procedure TmwKeyStroke.GetDisplayName(?:?);
begin
 0050EED0    push        ebp
 0050EED1    mov         ebp,esp
 0050EED3    push        0
 0050EED5    push        0
 0050EED7    push        0
 0050EED9    push        ebx
 0050EEDA    push        esi
 0050EEDB    mov         esi,edx
 0050EEDD    mov         ebx,eax
 0050EEDF    xor         eax,eax
 0050EEE1    push        ebp
 0050EEE2    push        50EF79
 0050EEE7    push        dword ptr fs:[eax]
 0050EEEA    mov         dword ptr fs:[eax],esp
 0050EEED    lea         edx,[ebp-4]
 0050EEF0    movzx       eax,word ptr [ebx+14];TmwKeyStroke.FCommand:TmwEditorCommand
 0050EEF4    call        0050EE4C
 0050EEF9    push        dword ptr [ebp-4]
 0050EEFC    push        50EF94;' - '
 0050EF01    mov         eax,ebx
 0050EF03    call        TmwKeyStroke.GetShortCut
 0050EF08    lea         edx,[ebp-8]
 0050EF0B    call        ShortCutToText
 0050EF10    push        dword ptr [ebp-8]
 0050EF13    mov         eax,esi
 0050EF15    mov         edx,3
 0050EF1A    call        @UStrCatN
 0050EF1F    mov         eax,ebx
 0050EF21    call        TmwKeyStroke.GetShortCut
 0050EF26    test        ax,ax
>0050EF29    je          0050EF50
 0050EF2B    push        dword ptr [esi]
 0050EF2D    push        50EFA8;' '
 0050EF32    mov         eax,ebx
 0050EF34    call        TmwKeyStroke.GetShortCut2
 0050EF39    lea         edx,[ebp-0C]
 0050EF3C    call        ShortCutToText
 0050EF41    push        dword ptr [ebp-0C]
 0050EF44    mov         eax,esi
 0050EF46    mov         edx,3
 0050EF4B    call        @UStrCatN
 0050EF50    cmp         dword ptr [esi],0
>0050EF53    jne         0050EF5E
 0050EF55    mov         edx,esi
 0050EF57    mov         eax,ebx
 0050EF59    call        TCollectionItem.GetDisplayName
 0050EF5E    xor         eax,eax
 0050EF60    pop         edx
 0050EF61    pop         ecx
 0050EF62    pop         ecx
 0050EF63    mov         dword ptr fs:[eax],edx
 0050EF66    push        50EF80
 0050EF6B    lea         eax,[ebp-0C]
 0050EF6E    mov         edx,3
 0050EF73    call        @UStrArrayClr
 0050EF78    ret
>0050EF79    jmp         @HandleFinally
>0050EF7E    jmp         0050EF6B
 0050EF80    pop         esi
 0050EF81    pop         ebx
 0050EF82    mov         esp,ebp
 0050EF84    pop         ebp
 0050EF85    ret
end;*}

//0050EFAC
{*function TmwKeyStroke.GetShortCut:?;
begin
 0050EFAC    movzx       edx,word ptr [eax+0E];TmwKeyStroke.FShift:TShiftState
 0050EFB0    movzx       eax,word ptr [eax+0C];TmwKeyStroke.FKey:word
 0050EFB4    call        ShortCut
 0050EFB9    ret
end;*}

//0050EFBC
procedure TmwKeyStroke.SetCommand(Value:TmwEditorCommand);
begin
{*
 0050EFBC    cmp         dx,word ptr [eax+14];TmwKeyStroke.FCommand:TmwEditorCommand
>0050EFC0    je          0050EFC6
 0050EFC2    mov         word ptr [eax+14],dx;TmwKeyStroke.FCommand:TmwEditorCommand
 0050EFC6    ret
*}
end;

//0050EFC8
procedure sub_0050EFC8(?:TmwKeyStroke; ?:Word);
begin
{*
 0050EFC8    cmp         dx,word ptr [eax+0C];TmwKeyStroke.FKey:word
>0050EFCC    je          0050EFD2
 0050EFCE    mov         word ptr [eax+0C],dx;TmwKeyStroke.FKey:word
 0050EFD2    ret
*}
end;

//0050EFD4
procedure sub_0050EFD4(?:TmwKeyStroke; ?:TShiftState);
begin
{*
 0050EFD4    push        ebx
 0050EFD5    push        ecx
 0050EFD6    mov         word ptr [esp],dx
 0050EFDA    mov         ebx,eax
 0050EFDC    movzx       eax,word ptr [ebx+0E];TmwKeyStroke.FShift:TShiftState
 0050EFE0    cmp         ax,word ptr [esp]
>0050EFE4    je          0050EFEE
 0050EFE6    movzx       eax,word ptr [esp]
 0050EFEA    mov         word ptr [ebx+0E],ax;TmwKeyStroke.FShift:TShiftState
 0050EFEE    pop         edx
 0050EFEF    pop         ebx
 0050EFF0    ret
*}
end;

//0050EFF4
procedure TmwKeyStroke.SetShortCut(Value:TShortCut);
begin
{*
 0050EFF4    push        ebp
 0050EFF5    mov         ebp,esp
 0050EFF7    add         esp,0FFFFFFF8
 0050EFFA    push        ebx
 0050EFFB    push        esi
 0050EFFC    push        edi
 0050EFFD    xor         ecx,ecx
 0050EFFF    mov         dword ptr [ebp-8],ecx
 0050F002    mov         esi,edx
 0050F004    mov         ebx,eax
 0050F006    xor         eax,eax
 0050F008    push        ebp
 0050F009    push        50F0A7
 0050F00E    push        dword ptr fs:[eax]
 0050F011    mov         dword ptr fs:[eax],esp
 0050F014    test        si,si
>0050F017    je          0050F05A
 0050F019    movzx       ecx,word ptr [ebx+10];TmwKeyStroke.FKey2:word
 0050F01D    mov         edx,esi
 0050F01F    mov         eax,dword ptr [ebx+4];TmwKeyStroke.FCollection:TCollection
 0050F022    call        TmwKeyStrokes.FindShortcut2
 0050F027    mov         edi,eax
 0050F029    cmp         edi,0FFFFFFFF
>0050F02C    je          0050F05A
 0050F02E    mov         eax,ebx
 0050F030    call        TCollectionItem.GetIndex
 0050F035    cmp         edi,eax
>0050F037    je          0050F05A
 0050F039    lea         edx,[ebp-8]
 0050F03C    mov         eax,[0078D850];^SResString316:TResStringRec
 0050F041    call        LoadResString
 0050F046    mov         ecx,dword ptr [ebp-8]
 0050F049    mov         dl,1
 0050F04B    mov         eax,[0050DAB4];EmwKeyError
 0050F050    call        Exception.Create;EmwKeyError.Create
 0050F055    call        @RaiseExcept
 0050F05A    lea         ecx,[ebp-4]
 0050F05D    lea         edx,[ebp-2]
 0050F060    mov         eax,esi
 0050F062    call        ShortCutToKey
 0050F067    movzx       eax,word ptr [ebp-2]
 0050F06B    cmp         ax,word ptr [ebx+0C];TmwKeyStroke.FKey:word
>0050F06F    jne         0050F07B
 0050F071    movzx       eax,word ptr [ebx+0E];TmwKeyStroke.FShift:TShiftState
 0050F075    cmp         ax,word ptr [ebp-4]
>0050F079    je          0050F091
 0050F07B    movzx       edx,word ptr [ebp-2]
 0050F07F    mov         eax,ebx
 0050F081    call        0050EFC8
 0050F086    movzx       edx,word ptr [ebp-4]
 0050F08A    mov         eax,ebx
 0050F08C    call        0050EFD4
 0050F091    xor         eax,eax
 0050F093    pop         edx
 0050F094    pop         ecx
 0050F095    pop         ecx
 0050F096    mov         dword ptr fs:[eax],edx
 0050F099    push        50F0AE
 0050F09E    lea         eax,[ebp-8]
 0050F0A1    call        @UStrClr
 0050F0A6    ret
>0050F0A7    jmp         @HandleFinally
>0050F0AC    jmp         0050F09E
 0050F0AE    pop         edi
 0050F0AF    pop         esi
 0050F0B0    pop         ebx
 0050F0B1    pop         ecx
 0050F0B2    pop         ecx
 0050F0B3    pop         ebp
 0050F0B4    ret
*}
end;

//0050F0B8
procedure sub_0050F0B8(?:TmwKeyStroke; ?:Word);
begin
{*
 0050F0B8    cmp         dx,word ptr [eax+10];TmwKeyStroke.FKey2:word
>0050F0BC    je          0050F0C2
 0050F0BE    mov         word ptr [eax+10],dx;TmwKeyStroke.FKey2:word
 0050F0C2    ret
*}
end;

//0050F0C4
procedure sub_0050F0C4(?:TmwKeyStroke; ?:TShiftState);
begin
{*
 0050F0C4    push        ebx
 0050F0C5    push        ecx
 0050F0C6    mov         word ptr [esp],dx
 0050F0CA    mov         ebx,eax
 0050F0CC    movzx       eax,word ptr [ebx+12];TmwKeyStroke.FShift2:TShiftState
 0050F0D0    cmp         ax,word ptr [esp]
>0050F0D4    je          0050F0DE
 0050F0D6    movzx       eax,word ptr [esp]
 0050F0DA    mov         word ptr [ebx+12],ax;TmwKeyStroke.FShift2:TShiftState
 0050F0DE    pop         edx
 0050F0DF    pop         ebx
 0050F0E0    ret
*}
end;

//0050F0E4
procedure TmwKeyStroke.SetShortCut2(Value:TShortCut);
begin
{*
 0050F0E4    push        ebp
 0050F0E5    mov         ebp,esp
 0050F0E7    add         esp,0FFFFFFF8
 0050F0EA    push        ebx
 0050F0EB    push        esi
 0050F0EC    push        edi
 0050F0ED    xor         ecx,ecx
 0050F0EF    mov         dword ptr [ebp-8],ecx
 0050F0F2    mov         esi,edx
 0050F0F4    mov         ebx,eax
 0050F0F6    xor         eax,eax
 0050F0F8    push        ebp
 0050F0F9    push        50F197
 0050F0FE    push        dword ptr fs:[eax]
 0050F101    mov         dword ptr fs:[eax],esp
 0050F104    test        si,si
>0050F107    je          0050F14A
 0050F109    mov         ecx,esi
 0050F10B    movzx       edx,word ptr [ebx+0C];TmwKeyStroke.FKey:word
 0050F10F    mov         eax,dword ptr [ebx+4];TmwKeyStroke.FCollection:TCollection
 0050F112    call        TmwKeyStrokes.FindShortcut2
 0050F117    mov         edi,eax
 0050F119    cmp         edi,0FFFFFFFF
>0050F11C    je          0050F14A
 0050F11E    mov         eax,ebx
 0050F120    call        TCollectionItem.GetIndex
 0050F125    cmp         edi,eax
>0050F127    je          0050F14A
 0050F129    lea         edx,[ebp-8]
 0050F12C    mov         eax,[0078D850];^SResString316:TResStringRec
 0050F131    call        LoadResString
 0050F136    mov         ecx,dword ptr [ebp-8]
 0050F139    mov         dl,1
 0050F13B    mov         eax,[0050DAB4];EmwKeyError
 0050F140    call        Exception.Create;EmwKeyError.Create
 0050F145    call        @RaiseExcept
 0050F14A    lea         ecx,[ebp-4]
 0050F14D    lea         edx,[ebp-2]
 0050F150    mov         eax,esi
 0050F152    call        ShortCutToKey
 0050F157    movzx       eax,word ptr [ebp-2]
 0050F15B    cmp         ax,word ptr [ebx+10];TmwKeyStroke.FKey2:word
>0050F15F    jne         0050F16B
 0050F161    movzx       eax,word ptr [ebx+12];TmwKeyStroke.FShift2:TShiftState
 0050F165    cmp         ax,word ptr [ebp-4]
>0050F169    je          0050F181
 0050F16B    movzx       edx,word ptr [ebp-2]
 0050F16F    mov         eax,ebx
 0050F171    call        0050F0B8
 0050F176    movzx       edx,word ptr [ebp-4]
 0050F17A    mov         eax,ebx
 0050F17C    call        0050F0C4
 0050F181    xor         eax,eax
 0050F183    pop         edx
 0050F184    pop         ecx
 0050F185    pop         ecx
 0050F186    mov         dword ptr fs:[eax],edx
 0050F189    push        50F19E
 0050F18E    lea         eax,[ebp-8]
 0050F191    call        @UStrClr
 0050F196    ret
>0050F197    jmp         @HandleFinally
>0050F19C    jmp         0050F18E
 0050F19E    pop         edi
 0050F19F    pop         esi
 0050F1A0    pop         ebx
 0050F1A1    pop         ecx
 0050F1A2    pop         ecx
 0050F1A3    pop         ebp
 0050F1A4    ret
*}
end;

//0050F1A8
procedure TmwKeyStroke.GetShortCut2;
begin
{*
 0050F1A8    movzx       edx,word ptr [eax+12];TmwKeyStroke.FShift2:TShiftState
 0050F1AC    movzx       eax,word ptr [eax+10];TmwKeyStroke.FKey2:word
 0050F1B0    call        ShortCut
 0050F1B5    ret
*}
end;

//0050F1B8
function TmwKeyStrokes.Add:TmwKeyStroke;
begin
{*
 0050F1B8    push        ebx
 0050F1B9    mov         ebx,eax
 0050F1BB    mov         eax,ebx
 0050F1BD    call        TCollection.Add
 0050F1C2    pop         ebx
 0050F1C3    ret
*}
end;

//0050F1C4
procedure TmwKeyStrokes.Assign(Source:TPersistent);
begin
{*
 0050F1C4    push        ebx
 0050F1C5    push        esi
 0050F1C6    push        edi
 0050F1C7    push        ebp
 0050F1C8    push        ecx
 0050F1C9    mov         dword ptr [esp],edx
 0050F1CC    mov         ebp,eax
 0050F1CE    mov         eax,dword ptr [esp]
 0050F1D1    mov         edx,dword ptr ds:[50DDE0];TmwKeyStrokes
 0050F1D7    call        @IsClass
 0050F1DC    test        al,al
>0050F1DE    je          0050F21A
 0050F1E0    mov         eax,ebp
 0050F1E2    call        TCollection.Clear
 0050F1E7    mov         eax,dword ptr [esp]
 0050F1EA    mov         eax,dword ptr [eax+8]
 0050F1ED    mov         ebx,dword ptr [eax+8]
 0050F1F0    dec         ebx
 0050F1F1    test        ebx,ebx
>0050F1F3    jl          0050F224
 0050F1F5    inc         ebx
 0050F1F6    xor         esi,esi
 0050F1F8    mov         eax,ebp
 0050F1FA    call        TmwKeyStrokes.Add
 0050F1FF    mov         edi,eax
 0050F201    mov         edx,esi
 0050F203    mov         eax,dword ptr [esp]
 0050F206    call        0050F450
 0050F20B    mov         edx,eax
 0050F20D    mov         eax,edi
 0050F20F    mov         ecx,dword ptr [eax]
 0050F211    call        dword ptr [ecx+8];TmwKeyStroke.Assign
 0050F214    inc         esi
 0050F215    dec         ebx
>0050F216    jne         0050F1F8
>0050F218    jmp         0050F224
 0050F21A    mov         edx,dword ptr [esp]
 0050F21D    mov         eax,ebp
 0050F21F    call        TCollection.Assign
 0050F224    pop         edx
 0050F225    pop         ebp
 0050F226    pop         edi
 0050F227    pop         esi
 0050F228    pop         ebx
 0050F229    ret
*}
end;

//0050F22C
constructor TmwKeyStrokes.Create(AOwner:TPersistent);
begin
{*
 0050F22C    push        ebx
 0050F22D    push        esi
 0050F22E    push        edi
 0050F22F    test        dl,dl
>0050F231    je          0050F23B
 0050F233    add         esp,0FFFFFFF0
 0050F236    call        @ClassCreate
 0050F23B    mov         esi,ecx
 0050F23D    mov         ebx,edx
 0050F23F    mov         edi,eax
 0050F241    mov         ecx,dword ptr ds:[50DB70];TmwKeyStroke
 0050F247    xor         edx,edx
 0050F249    mov         eax,edi
 0050F24B    call        TCollection.Create
 0050F250    mov         dword ptr [edi+18],esi;TmwKeyStrokes......FOwner:TPersistent
 0050F253    mov         eax,edi
 0050F255    test        bl,bl
>0050F257    je          0050F268
 0050F259    call        @AfterConstruction
 0050F25E    pop         dword ptr fs:[0]
 0050F265    add         esp,0C
 0050F268    mov         eax,edi
 0050F26A    pop         edi
 0050F26B    pop         esi
 0050F26C    pop         ebx
 0050F26D    ret
*}
end;

//0050F270
function TmwKeyStrokes.FindCommand(Cmd:TmwEditorCommand):Integer;
begin
{*
 0050F270    push        ebx
 0050F271    push        esi
 0050F272    push        edi
 0050F273    push        ebp
 0050F274    push        ecx
 0050F275    mov         ebp,edx
 0050F277    mov         edi,eax
 0050F279    mov         dword ptr [esp],0FFFFFFFF
 0050F280    mov         eax,dword ptr [edi+8];TmwKeyStrokes.FItems:TList
 0050F283    mov         esi,dword ptr [eax+8];TList.FCount:Integer
 0050F286    dec         esi
 0050F287    test        esi,esi
>0050F289    jl          0050F2A6
 0050F28B    inc         esi
 0050F28C    xor         ebx,ebx
 0050F28E    mov         edx,ebx
 0050F290    mov         eax,edi
 0050F292    call        0050F450
 0050F297    cmp         bp,word ptr [eax+14]
>0050F29B    jne         0050F2A2
 0050F29D    mov         dword ptr [esp],ebx
>0050F2A0    jmp         0050F2A6
 0050F2A2    inc         ebx
 0050F2A3    dec         esi
>0050F2A4    jne         0050F28E
 0050F2A6    mov         eax,dword ptr [esp]
 0050F2A9    pop         edx
 0050F2AA    pop         ebp
 0050F2AB    pop         edi
 0050F2AC    pop         esi
 0050F2AD    pop         ebx
 0050F2AE    ret
*}
end;

//0050F2B0
function TmwKeyStrokes.FindKeycode(Code:Word; SS:TShiftState):Integer;
begin
{*
 0050F2B0    push        ebx
 0050F2B1    push        esi
 0050F2B2    push        edi
 0050F2B3    push        ebp
 0050F2B4    add         esp,0FFFFFFF8
 0050F2B7    mov         word ptr [esp],cx
 0050F2BB    mov         ebp,edx
 0050F2BD    mov         esi,eax
 0050F2BF    mov         dword ptr [esp+4],0FFFFFFFF
 0050F2C7    mov         eax,dword ptr [esi+8];TmwKeyStrokes.FItems:TList
 0050F2CA    mov         edi,dword ptr [eax+8];TList.FCount:Integer
 0050F2CD    dec         edi
 0050F2CE    test        edi,edi
>0050F2D0    jl          0050F311
 0050F2D2    inc         edi
 0050F2D3    xor         ebx,ebx
 0050F2D5    mov         edx,ebx
 0050F2D7    mov         eax,esi
 0050F2D9    call        0050F450
 0050F2DE    cmp         bp,word ptr [eax+0C]
>0050F2E2    jne         0050F30D
 0050F2E4    mov         edx,ebx
 0050F2E6    mov         eax,esi
 0050F2E8    call        0050F450
 0050F2ED    movzx       edx,word ptr [esp]
 0050F2F1    cmp         dx,word ptr [eax+0E]
>0050F2F5    jne         0050F30D
 0050F2F7    mov         edx,ebx
 0050F2F9    mov         eax,esi
 0050F2FB    call        0050F450
 0050F300    cmp         word ptr [eax+10],0
>0050F305    jne         0050F30D
 0050F307    mov         dword ptr [esp+4],ebx
>0050F30B    jmp         0050F311
 0050F30D    inc         ebx
 0050F30E    dec         edi
>0050F30F    jne         0050F2D5
 0050F311    mov         eax,dword ptr [esp+4]
 0050F315    pop         ecx
 0050F316    pop         edx
 0050F317    pop         ebp
 0050F318    pop         edi
 0050F319    pop         esi
 0050F31A    pop         ebx
 0050F31B    ret
*}
end;

//0050F31C
function TmwKeyStrokes.FindShortcut(SC:TShortCut):Integer;
begin
{*
 0050F31C    push        ebx
 0050F31D    push        esi
 0050F31E    push        edi
 0050F31F    push        ebp
 0050F320    push        ecx
 0050F321    mov         ebp,edx
 0050F323    mov         edi,eax
 0050F325    mov         dword ptr [esp],0FFFFFFFF
 0050F32C    mov         eax,dword ptr [edi+8];TmwKeyStrokes.FItems:TList
 0050F32F    mov         esi,dword ptr [eax+8];TList.FCount:Integer
 0050F332    dec         esi
 0050F333    test        esi,esi
>0050F335    jl          0050F356
 0050F337    inc         esi
 0050F338    xor         ebx,ebx
 0050F33A    mov         edx,ebx
 0050F33C    mov         eax,edi
 0050F33E    call        0050F450
 0050F343    call        TmwKeyStroke.GetShortCut
 0050F348    cmp         bp,ax
>0050F34B    jne         0050F352
 0050F34D    mov         dword ptr [esp],ebx
>0050F350    jmp         0050F356
 0050F352    inc         ebx
 0050F353    dec         esi
>0050F354    jne         0050F33A
 0050F356    mov         eax,dword ptr [esp]
 0050F359    pop         edx
 0050F35A    pop         ebp
 0050F35B    pop         edi
 0050F35C    pop         esi
 0050F35D    pop         ebx
 0050F35E    ret
*}
end;

//0050F360
function TmwKeyStrokes.FindKeycode2(Code1:Word; SS1:TShiftState; SS2:TShiftState; Code2:Word):Integer;
begin
{*
 0050F360    push        ebp
 0050F361    mov         ebp,esp
 0050F363    add         esp,0FFFFFFF8
 0050F366    push        ebx
 0050F367    push        esi
 0050F368    push        edi
 0050F369    mov         word ptr [ebp-4],cx
 0050F36D    mov         word ptr [ebp-2],dx
 0050F371    mov         esi,eax
 0050F373    mov         dword ptr [ebp-8],0FFFFFFFF
 0050F37A    mov         eax,dword ptr [esi+8];TmwKeyStrokes.FItems:TList
 0050F37D    mov         edi,dword ptr [eax+8];TList.FCount:Integer
 0050F380    dec         edi
 0050F381    test        edi,edi
>0050F383    jl          0050F3DD
 0050F385    inc         edi
 0050F386    xor         ebx,ebx
 0050F388    mov         edx,ebx
 0050F38A    mov         eax,esi
 0050F38C    call        0050F450
 0050F391    movzx       eax,word ptr [eax+0C]
 0050F395    cmp         ax,word ptr [ebp-2]
>0050F399    jne         0050F3D9
 0050F39B    mov         edx,ebx
 0050F39D    mov         eax,esi
 0050F39F    call        0050F450
 0050F3A4    movzx       edx,word ptr [ebp-4]
 0050F3A8    cmp         dx,word ptr [eax+0E]
>0050F3AC    jne         0050F3D9
 0050F3AE    mov         edx,ebx
 0050F3B0    mov         eax,esi
 0050F3B2    call        0050F450
 0050F3B7    movzx       eax,word ptr [eax+10]
 0050F3BB    cmp         ax,word ptr [ebp+0C]
>0050F3BF    jne         0050F3D9
 0050F3C1    mov         edx,ebx
 0050F3C3    mov         eax,esi
 0050F3C5    call        0050F450
 0050F3CA    movzx       edx,word ptr [ebp+8]
 0050F3CE    cmp         dx,word ptr [eax+12]
>0050F3D2    jne         0050F3D9
 0050F3D4    mov         dword ptr [ebp-8],ebx
>0050F3D7    jmp         0050F3DD
 0050F3D9    inc         ebx
 0050F3DA    dec         edi
>0050F3DB    jne         0050F388
 0050F3DD    mov         eax,dword ptr [ebp-8]
 0050F3E0    pop         edi
 0050F3E1    pop         esi
 0050F3E2    pop         ebx
 0050F3E3    pop         ecx
 0050F3E4    pop         ecx
 0050F3E5    pop         ebp
 0050F3E6    ret         8
*}
end;

//0050F3EC
function TmwKeyStrokes.FindShortcut2(SC:TShortCut; SC2:TShortCut):Integer;
begin
{*
 0050F3EC    push        ebx
 0050F3ED    push        esi
 0050F3EE    push        edi
 0050F3EF    push        ebp
 0050F3F0    add         esp,0FFFFFFF8
 0050F3F3    mov         word ptr [esp],cx
 0050F3F7    mov         ebp,edx
 0050F3F9    mov         esi,eax
 0050F3FB    mov         dword ptr [esp+4],0FFFFFFFF
 0050F403    mov         eax,dword ptr [esi+8];TmwKeyStrokes.FItems:TList
 0050F406    mov         edi,dword ptr [eax+8];TList.FCount:Integer
 0050F409    dec         edi
 0050F40A    test        edi,edi
>0050F40C    jl          0050F442
 0050F40E    inc         edi
 0050F40F    xor         ebx,ebx
 0050F411    mov         edx,ebx
 0050F413    mov         eax,esi
 0050F415    call        0050F450
 0050F41A    call        TmwKeyStroke.GetShortCut
 0050F41F    cmp         bp,ax
>0050F422    jne         0050F43E
 0050F424    mov         edx,ebx
 0050F426    mov         eax,esi
 0050F428    call        0050F450
 0050F42D    call        TmwKeyStroke.GetShortCut2
 0050F432    cmp         ax,word ptr [esp]
>0050F436    jne         0050F43E
 0050F438    mov         dword ptr [esp+4],ebx
>0050F43C    jmp         0050F442
 0050F43E    inc         ebx
 0050F43F    dec         edi
>0050F440    jne         0050F411
 0050F442    mov         eax,dword ptr [esp+4]
 0050F446    pop         ecx
 0050F447    pop         edx
 0050F448    pop         ebp
 0050F449    pop         edi
 0050F44A    pop         esi
 0050F44B    pop         ebx
 0050F44C    ret
*}
end;

//0050F450
{*function sub_0050F450(?:TmwKeyStrokes; ?:Integer):?;
begin
 0050F450    push        ebx
 0050F451    push        esi
 0050F452    mov         esi,edx
 0050F454    mov         ebx,eax
 0050F456    mov         edx,esi
 0050F458    mov         eax,ebx
 0050F45A    call        TCollection.GetItem
 0050F45F    pop         esi
 0050F460    pop         ebx
 0050F461    ret
end;*}

//0050F464
procedure TmwKeyStrokes.sub_00446E30;
begin
{*
 0050F464    mov         eax,dword ptr [eax+18];TmwKeyStrokes.......FOwner:TPersistent
 0050F467    ret
*}
end;

//0050F468
{*procedure sub_0050F468(?:?; ?:?; ?:?; ?:?);
begin
 0050F468    push        ebp
 0050F469    mov         ebp,esp
 0050F46B    push        ecx
 0050F46C    push        ebx
 0050F46D    push        esi
 0050F46E    push        edi
 0050F46F    mov         word ptr [ebp-2],cx
 0050F473    mov         edi,edx
 0050F475    mov         esi,eax
 0050F477    mov         eax,dword ptr [ebp+8]
 0050F47A    mov         eax,dword ptr [eax-4]
 0050F47D    call        TmwKeyStrokes.Add
 0050F482    mov         ebx,eax
 0050F484    mov         edx,edi
 0050F486    mov         eax,ebx
 0050F488    call        0050EFC8
 0050F48D    movzx       edx,word ptr [ebp-2]
 0050F491    mov         eax,ebx
 0050F493    call        0050EFD4
 0050F498    mov         edx,esi
 0050F49A    mov         eax,ebx
 0050F49C    call        TmwKeyStroke.SetCommand
 0050F4A1    pop         edi
 0050F4A2    pop         esi
 0050F4A3    pop         ebx
 0050F4A4    pop         ecx
 0050F4A5    pop         ebp
 0050F4A6    ret
end;*}

//0050F4A8
procedure TmwKeyStrokes.ResetDefaults;
begin
{*
 0050F4A8    push        ebp
 0050F4A9    mov         ebp,esp
 0050F4AB    push        ecx
 0050F4AC    mov         dword ptr [ebp-4],eax
 0050F4AF    mov         eax,dword ptr [ebp-4]
 0050F4B2    call        TCollection.Clear
 0050F4B7    push        ebp
 0050F4B8    movzx       ecx,word ptr ds:[50FB84];0x0 gvar_0050FB84
 0050F4BF    mov         dx,26
 0050F4C3    mov         ax,3
 0050F4C7    call        0050F468
 0050F4CC    pop         ecx
 0050F4CD    push        ebp
 0050F4CE    movzx       ecx,word ptr ds:[50FB88];0x1 gvar_0050FB88
 0050F4D5    mov         dx,26
 0050F4D9    mov         ax,67
 0050F4DD    call        0050F468
 0050F4E2    pop         ecx
 0050F4E3    push        ebp
 0050F4E4    movzx       ecx,word ptr ds:[50FB8C];0x4 gvar_0050FB8C
 0050F4EB    mov         dx,26
 0050F4EF    mov         ax,25E
 0050F4F3    call        0050F468
 0050F4F8    pop         ecx
 0050F4F9    push        ebp
 0050F4FA    movzx       ecx,word ptr ds:[50FB84];0x0 gvar_0050FB84
 0050F501    mov         dx,28
 0050F505    mov         ax,4
 0050F509    call        0050F468
 0050F50E    pop         ecx
 0050F50F    push        ebp
 0050F510    movzx       ecx,word ptr ds:[50FB88];0x1 gvar_0050FB88
 0050F517    mov         dx,28
 0050F51B    mov         ax,68
 0050F51F    call        0050F468
 0050F524    pop         ecx
 0050F525    push        ebp
 0050F526    movzx       ecx,word ptr ds:[50FB8C];0x4 gvar_0050FB8C
 0050F52D    mov         dx,28
 0050F531    mov         ax,25F
 0050F535    call        0050F468
 0050F53A    pop         ecx
 0050F53B    push        ebp
 0050F53C    movzx       ecx,word ptr ds:[50FB84];0x0 gvar_0050FB84
 0050F543    mov         dx,25
 0050F547    mov         ax,1
 0050F54B    call        0050F468
 0050F550    pop         ecx
 0050F551    push        ebp
 0050F552    movzx       ecx,word ptr ds:[50FB88];0x1 gvar_0050FB88
 0050F559    mov         dx,25
 0050F55D    mov         ax,65
 0050F561    call        0050F468
 0050F566    pop         ecx
 0050F567    push        ebp
 0050F568    movzx       ecx,word ptr ds:[50FB8C];0x4 gvar_0050FB8C
 0050F56F    mov         dx,25
 0050F573    mov         ax,5
 0050F577    call        0050F468
 0050F57C    pop         ecx
 0050F57D    push        ebp
 0050F57E    movzx       ecx,word ptr ds:[50FB90];0x5 gvar_0050FB90
 0050F585    mov         dx,25
 0050F589    mov         ax,69
 0050F58D    call        0050F468
 0050F592    pop         ecx
 0050F593    push        ebp
 0050F594    movzx       ecx,word ptr ds:[50FB84];0x0 gvar_0050FB84
 0050F59B    mov         dx,27
 0050F59F    mov         ax,2
 0050F5A3    call        0050F468
 0050F5A8    pop         ecx
 0050F5A9    push        ebp
 0050F5AA    movzx       ecx,word ptr ds:[50FB88];0x1 gvar_0050FB88
 0050F5B1    mov         dx,27
 0050F5B5    mov         ax,66
 0050F5B9    call        0050F468
 0050F5BE    pop         ecx
 0050F5BF    push        ebp
 0050F5C0    movzx       ecx,word ptr ds:[50FB8C];0x4 gvar_0050FB8C
 0050F5C7    mov         dx,27
 0050F5CB    mov         ax,6
 0050F5CF    call        0050F468
 0050F5D4    pop         ecx
 0050F5D5    push        ebp
 0050F5D6    movzx       ecx,word ptr ds:[50FB90];0x5 gvar_0050FB90
 0050F5DD    mov         dx,27
 0050F5E1    mov         ax,6A
 0050F5E5    call        0050F468
 0050F5EA    pop         ecx
 0050F5EB    push        ebp
 0050F5EC    movzx       ecx,word ptr ds:[50FB84];0x0 gvar_0050FB84
 0050F5F3    mov         dx,22
 0050F5F7    mov         ax,0A
 0050F5FB    call        0050F468
 0050F600    pop         ecx
 0050F601    push        ebp
 0050F602    movzx       ecx,word ptr ds:[50FB88];0x1 gvar_0050FB88
 0050F609    mov         dx,22
 0050F60D    mov         ax,6E
 0050F611    call        0050F468
 0050F616    pop         ecx
 0050F617    push        ebp
 0050F618    movzx       ecx,word ptr ds:[50FB8C];0x4 gvar_0050FB8C
 0050F61F    mov         dx,22
 0050F623    mov         ax,0E
 0050F627    call        0050F468
 0050F62C    pop         ecx
 0050F62D    push        ebp
 0050F62E    movzx       ecx,word ptr ds:[50FB90];0x5 gvar_0050FB90
 0050F635    mov         dx,22
 0050F639    mov         ax,72
 0050F63D    call        0050F468
 0050F642    pop         ecx
 0050F643    push        ebp
 0050F644    movzx       ecx,word ptr ds:[50FB84];0x0 gvar_0050FB84
 0050F64B    mov         dx,21
 0050F64F    mov         ax,9
 0050F653    call        0050F468
 0050F658    pop         ecx
 0050F659    push        ebp
 0050F65A    movzx       ecx,word ptr ds:[50FB88];0x1 gvar_0050FB88
 0050F661    mov         dx,21
 0050F665    mov         ax,6D
 0050F669    call        0050F468
 0050F66E    pop         ecx
 0050F66F    push        ebp
 0050F670    movzx       ecx,word ptr ds:[50FB8C];0x4 gvar_0050FB8C
 0050F677    mov         dx,21
 0050F67B    mov         ax,0D
 0050F67F    call        0050F468
 0050F684    pop         ecx
 0050F685    push        ebp
 0050F686    movzx       ecx,word ptr ds:[50FB90];0x5 gvar_0050FB90
 0050F68D    mov         dx,21
 0050F691    mov         ax,71
 0050F695    call        0050F468
 0050F69A    pop         ecx
 0050F69B    push        ebp
 0050F69C    movzx       ecx,word ptr ds:[50FB84];0x0 gvar_0050FB84
 0050F6A3    mov         dx,24
 0050F6A7    mov         ax,7
 0050F6AB    call        0050F468
 0050F6B0    pop         ecx
 0050F6B1    push        ebp
 0050F6B2    movzx       ecx,word ptr ds:[50FB88];0x1 gvar_0050FB88
 0050F6B9    mov         dx,24
 0050F6BD    mov         ax,6B
 0050F6C1    call        0050F468
 0050F6C6    pop         ecx
 0050F6C7    push        ebp
 0050F6C8    movzx       ecx,word ptr ds:[50FB8C];0x4 gvar_0050FB8C
 0050F6CF    mov         dx,24
 0050F6D3    mov         ax,0F
 0050F6D7    call        0050F468
 0050F6DC    pop         ecx
 0050F6DD    push        ebp
 0050F6DE    movzx       ecx,word ptr ds:[50FB90];0x5 gvar_0050FB90
 0050F6E5    mov         dx,24
 0050F6E9    mov         ax,73
 0050F6ED    call        0050F468
 0050F6F2    pop         ecx
 0050F6F3    push        ebp
 0050F6F4    movzx       ecx,word ptr ds:[50FB84];0x0 gvar_0050FB84
 0050F6FB    mov         dx,23
 0050F6FF    mov         ax,8
 0050F703    call        0050F468
 0050F708    pop         ecx
 0050F709    push        ebp
 0050F70A    movzx       ecx,word ptr ds:[50FB88];0x1 gvar_0050FB88
 0050F711    mov         dx,23
 0050F715    mov         ax,6C
 0050F719    call        0050F468
 0050F71E    pop         ecx
 0050F71F    push        ebp
 0050F720    movzx       ecx,word ptr ds:[50FB8C];0x4 gvar_0050FB8C
 0050F727    mov         dx,23
 0050F72B    mov         ax,10
 0050F72F    call        0050F468
 0050F734    pop         ecx
 0050F735    push        ebp
 0050F736    movzx       ecx,word ptr ds:[50FB90];0x5 gvar_0050FB90
 0050F73D    mov         dx,23
 0050F741    mov         ax,74
 0050F745    call        0050F468
 0050F74A    pop         ecx
 0050F74B    push        ebp
 0050F74C    movzx       ecx,word ptr ds:[50FB84];0x0 gvar_0050FB84
 0050F753    mov         dx,2D
 0050F757    mov         ax,264
 0050F75B    call        0050F468
 0050F760    pop         ecx
 0050F761    push        ebp
 0050F762    movzx       ecx,word ptr ds:[50FB8C];0x4 gvar_0050FB8C
 0050F769    mov         dx,2D
 0050F76D    mov         ax,25C
 0050F771    call        0050F468
 0050F776    pop         ecx
 0050F777    push        ebp
 0050F778    movzx       ecx,word ptr ds:[50FB88];0x1 gvar_0050FB88
 0050F77F    mov         dx,2D
 0050F783    mov         ax,25D
 0050F787    call        0050F468
 0050F78C    pop         ecx
 0050F78D    push        ebp
 0050F78E    movzx       ecx,word ptr ds:[50FB84];0x0 gvar_0050FB84
 0050F795    mov         dx,2E
 0050F799    mov         ax,192
 0050F79D    call        0050F468
 0050F7A2    pop         ecx
 0050F7A3    push        ebp
 0050F7A4    movzx       ecx,word ptr ds:[50FB88];0x1 gvar_0050FB88
 0050F7AB    mov         dx,2E
 0050F7AF    mov         ax,25B
 0050F7B3    call        0050F468
 0050F7B8    pop         ecx
 0050F7B9    push        ebp
 0050F7BA    movzx       ecx,word ptr ds:[50FB84];0x0 gvar_0050FB84
 0050F7C1    mov         dx,8
 0050F7C5    mov         ax,191
 0050F7C9    call        0050F468
 0050F7CE    pop         ecx
 0050F7CF    push        ebp
 0050F7D0    movzx       ecx,word ptr ds:[50FB8C];0x4 gvar_0050FB8C
 0050F7D7    mov         dx,8
 0050F7DB    mov         ax,194
 0050F7DF    call        0050F468
 0050F7E4    pop         ecx
 0050F7E5    push        ebp
 0050F7E6    movzx       ecx,word ptr ds:[50FB94];0x2 gvar_0050FB94
 0050F7ED    mov         dx,8
 0050F7F1    mov         ax,259
 0050F7F5    call        0050F468
 0050F7FA    pop         ecx
 0050F7FB    push        ebp
 0050F7FC    movzx       ecx,word ptr ds:[50FB98];0x3 gvar_0050FB98
 0050F803    mov         dx,8
 0050F807    mov         ax,25A
 0050F80B    call        0050F468
 0050F810    pop         ecx
 0050F811    push        ebp
 0050F812    movzx       ecx,word ptr ds:[50FB84];0x0 gvar_0050FB84
 0050F819    mov         dx,0D
 0050F81D    mov         ax,199
 0050F821    call        0050F468
 0050F826    pop         ecx
 0050F827    push        ebp
 0050F828    movzx       ecx,word ptr ds:[50FB8C];0x4 gvar_0050FB8C
 0050F82F    mov         dx,41
 0050F833    mov         ax,0C7
 0050F837    call        0050F468
 0050F83C    pop         ecx
 0050F83D    push        ebp
 0050F83E    movzx       ecx,word ptr ds:[50FB8C];0x4 gvar_0050FB8C
 0050F845    mov         dx,43
 0050F849    mov         ax,25C
 0050F84D    call        0050F468
 0050F852    pop         ecx
 0050F853    push        ebp
 0050F854    movzx       ecx,word ptr ds:[50FB90];0x5 gvar_0050FB90
 0050F85B    mov         dx,49
 0050F85F    mov         ax,265
 0050F863    call        0050F468
 0050F868    pop         ecx
 0050F869    push        ebp
 0050F86A    movzx       ecx,word ptr ds:[50FB8C];0x4 gvar_0050FB8C
 0050F871    mov         dx,4D
 0050F875    mov         ax,199
 0050F879    call        0050F468
 0050F87E    pop         ecx
 0050F87F    push        ebp
 0050F880    movzx       ecx,word ptr ds:[50FB8C];0x4 gvar_0050FB8C
 0050F887    mov         dx,4E
 0050F88B    mov         ax,19A
 0050F88F    call        0050F468
 0050F894    pop         ecx
 0050F895    push        ebp
 0050F896    movzx       ecx,word ptr ds:[50FB8C];0x4 gvar_0050FB8C
 0050F89D    mov         dx,54
 0050F8A1    mov         ax,193
 0050F8A5    call        0050F468
 0050F8AA    pop         ecx
 0050F8AB    push        ebp
 0050F8AC    movzx       ecx,word ptr ds:[50FB90];0x5 gvar_0050FB90
 0050F8B3    mov         dx,55
 0050F8B7    mov         ax,266
 0050F8BB    call        0050F468
 0050F8C0    pop         ecx
 0050F8C1    push        ebp
 0050F8C2    movzx       ecx,word ptr ds:[50FB8C];0x4 gvar_0050FB8C
 0050F8C9    mov         dx,56
 0050F8CD    mov         ax,25D
 0050F8D1    call        0050F468
 0050F8D6    pop         ecx
 0050F8D7    push        ebp
 0050F8D8    movzx       ecx,word ptr ds:[50FB8C];0x4 gvar_0050FB8C
 0050F8DF    mov         dx,58
 0050F8E3    mov         ax,25B
 0050F8E7    call        0050F468
 0050F8EC    pop         ecx
 0050F8ED    push        ebp
 0050F8EE    movzx       ecx,word ptr ds:[50FB8C];0x4 gvar_0050FB8C
 0050F8F5    mov         dx,59
 0050F8F9    mov         ax,197
 0050F8FD    call        0050F468
 0050F902    pop         ecx
 0050F903    push        ebp
 0050F904    movzx       ecx,word ptr ds:[50FB90];0x5 gvar_0050FB90
 0050F90B    mov         dx,59
 0050F90F    mov         ax,196
 0050F913    call        0050F468
 0050F918    pop         ecx
 0050F919    push        ebp
 0050F91A    movzx       ecx,word ptr ds:[50FB8C];0x4 gvar_0050FB8C
 0050F921    mov         dx,5A
 0050F925    mov         ax,259
 0050F929    call        0050F468
 0050F92E    pop         ecx
 0050F92F    push        ebp
 0050F930    movzx       ecx,word ptr ds:[50FB90];0x5 gvar_0050FB90
 0050F937    mov         dx,5A
 0050F93B    mov         ax,25A
 0050F93F    call        0050F468
 0050F944    pop         ecx
 0050F945    push        ebp
 0050F946    movzx       ecx,word ptr ds:[50FB8C];0x4 gvar_0050FB8C
 0050F94D    mov         dx,30
 0050F951    mov         ax,2BD
 0050F955    call        0050F468
 0050F95A    pop         ecx
 0050F95B    push        ebp
 0050F95C    movzx       ecx,word ptr ds:[50FB8C];0x4 gvar_0050FB8C
 0050F963    mov         dx,31
 0050F967    mov         ax,2BE
 0050F96B    call        0050F468
 0050F970    pop         ecx
 0050F971    push        ebp
 0050F972    movzx       ecx,word ptr ds:[50FB8C];0x4 gvar_0050FB8C
 0050F979    mov         dx,32
 0050F97D    mov         ax,2BF
 0050F981    call        0050F468
 0050F986    pop         ecx
 0050F987    push        ebp
 0050F988    movzx       ecx,word ptr ds:[50FB8C];0x4 gvar_0050FB8C
 0050F98F    mov         dx,33
 0050F993    mov         ax,2C0
 0050F997    call        0050F468
 0050F99C    pop         ecx
 0050F99D    push        ebp
 0050F99E    movzx       ecx,word ptr ds:[50FB8C];0x4 gvar_0050FB8C
 0050F9A5    mov         dx,34
 0050F9A9    mov         ax,2C1
 0050F9AD    call        0050F468
 0050F9B2    pop         ecx
 0050F9B3    push        ebp
 0050F9B4    movzx       ecx,word ptr ds:[50FB8C];0x4 gvar_0050FB8C
 0050F9BB    mov         dx,35
 0050F9BF    mov         ax,2C2
 0050F9C3    call        0050F468
 0050F9C8    pop         ecx
 0050F9C9    push        ebp
 0050F9CA    movzx       ecx,word ptr ds:[50FB8C];0x4 gvar_0050FB8C
 0050F9D1    mov         dx,36
 0050F9D5    mov         ax,2C3
 0050F9D9    call        0050F468
 0050F9DE    pop         ecx
 0050F9DF    push        ebp
 0050F9E0    movzx       ecx,word ptr ds:[50FB8C];0x4 gvar_0050FB8C
 0050F9E7    mov         dx,37
 0050F9EB    mov         ax,2C4
 0050F9EF    call        0050F468
 0050F9F4    pop         ecx
 0050F9F5    push        ebp
 0050F9F6    movzx       ecx,word ptr ds:[50FB8C];0x4 gvar_0050FB8C
 0050F9FD    mov         dx,38
 0050FA01    mov         ax,2C5
 0050FA05    call        0050F468
 0050FA0A    pop         ecx
 0050FA0B    push        ebp
 0050FA0C    movzx       ecx,word ptr ds:[50FB8C];0x4 gvar_0050FB8C
 0050FA13    mov         dx,39
 0050FA17    mov         ax,2C6
 0050FA1B    call        0050F468
 0050FA20    pop         ecx
 0050FA21    push        ebp
 0050FA22    movzx       ecx,word ptr ds:[50FB90];0x5 gvar_0050FB90
 0050FA29    mov         dx,30
 0050FA2D    mov         ax,2EF
 0050FA31    call        0050F468
 0050FA36    pop         ecx
 0050FA37    push        ebp
 0050FA38    movzx       ecx,word ptr ds:[50FB90];0x5 gvar_0050FB90
 0050FA3F    mov         dx,31
 0050FA43    mov         ax,2F0
 0050FA47    call        0050F468
 0050FA4C    pop         ecx
 0050FA4D    push        ebp
 0050FA4E    movzx       ecx,word ptr ds:[50FB90];0x5 gvar_0050FB90
 0050FA55    mov         dx,32
 0050FA59    mov         ax,2F1
 0050FA5D    call        0050F468
 0050FA62    pop         ecx
 0050FA63    push        ebp
 0050FA64    movzx       ecx,word ptr ds:[50FB90];0x5 gvar_0050FB90
 0050FA6B    mov         dx,33
 0050FA6F    mov         ax,2F2
 0050FA73    call        0050F468
 0050FA78    pop         ecx
 0050FA79    push        ebp
 0050FA7A    movzx       ecx,word ptr ds:[50FB90];0x5 gvar_0050FB90
 0050FA81    mov         dx,34
 0050FA85    mov         ax,2F3
 0050FA89    call        0050F468
 0050FA8E    pop         ecx
 0050FA8F    push        ebp
 0050FA90    movzx       ecx,word ptr ds:[50FB90];0x5 gvar_0050FB90
 0050FA97    mov         dx,35
 0050FA9B    mov         ax,2F4
 0050FA9F    call        0050F468
 0050FAA4    pop         ecx
 0050FAA5    push        ebp
 0050FAA6    movzx       ecx,word ptr ds:[50FB90];0x5 gvar_0050FB90
 0050FAAD    mov         dx,36
 0050FAB1    mov         ax,2F5
 0050FAB5    call        0050F468
 0050FABA    pop         ecx
 0050FABB    push        ebp
 0050FABC    movzx       ecx,word ptr ds:[50FB90];0x5 gvar_0050FB90
 0050FAC3    mov         dx,37
 0050FAC7    mov         ax,2F6
 0050FACB    call        0050F468
 0050FAD0    pop         ecx
 0050FAD1    push        ebp
 0050FAD2    movzx       ecx,word ptr ds:[50FB90];0x5 gvar_0050FB90
 0050FAD9    mov         dx,38
 0050FADD    mov         ax,2F7
 0050FAE1    call        0050F468
 0050FAE6    pop         ecx
 0050FAE7    push        ebp
 0050FAE8    movzx       ecx,word ptr ds:[50FB90];0x5 gvar_0050FB90
 0050FAEF    mov         dx,39
 0050FAF3    mov         ax,2F8
 0050FAF7    call        0050F468
 0050FAFC    pop         ecx
 0050FAFD    push        ebp
 0050FAFE    movzx       ecx,word ptr ds:[50FB90];0x5 gvar_0050FB90
 0050FB05    mov         dx,4E
 0050FB09    mov         ax,267
 0050FB0D    call        0050F468
 0050FB12    pop         ecx
 0050FB13    push        ebp
 0050FB14    movzx       ecx,word ptr ds:[50FB90];0x5 gvar_0050FB90
 0050FB1B    mov         dx,43
 0050FB1F    mov         ax,268
 0050FB23    call        0050F468
 0050FB28    pop         ecx
 0050FB29    push        ebp
 0050FB2A    movzx       ecx,word ptr ds:[50FB90];0x5 gvar_0050FB90
 0050FB31    mov         dx,4C
 0050FB35    mov         ax,269
 0050FB39    call        0050F468
 0050FB3E    pop         ecx
 0050FB3F    push        ebp
 0050FB40    movzx       ecx,word ptr ds:[50FB84];0x0 gvar_0050FB84
 0050FB47    mov         dx,9
 0050FB4B    mov         ax,26A
 0050FB4F    call        0050F468
 0050FB54    pop         ecx
 0050FB55    push        ebp
 0050FB56    movzx       ecx,word ptr ds:[50FB88];0x1 gvar_0050FB88
 0050FB5D    mov         dx,9
 0050FB61    mov         ax,26B
 0050FB65    call        0050F468
 0050FB6A    pop         ecx
 0050FB6B    push        ebp
 0050FB6C    movzx       ecx,word ptr ds:[50FB90];0x5 gvar_0050FB90
 0050FB73    mov         dx,42
 0050FB77    mov         ax,26C
 0050FB7B    call        0050F468
 0050FB80    pop         ecx
 0050FB81    pop         ecx
 0050FB82    pop         ebp
 0050FB83    ret
*}
end;

Initialization
//00780D78
{*
 00780D78    sub         dword ptr ds:[7938F0],1
>00780D7F    jae         00780D95
 00780D81    mov         ecx,50EE3C;sub_0050EE3C
 00780D86    mov         edx,50EE2C
 00780D8B    mov         eax,[0050DB4C];TmwEditorCommand
 00780D90    call        RegisterIntegerConsts
 00780D95    ret
*}
Finalization
//0050FB9C
{*
 0050FB9C    push        ebp
 0050FB9D    mov         ebp,esp
 0050FB9F    xor         eax,eax
 0050FBA1    push        ebp
 0050FBA2    push        50FBD8
 0050FBA7    push        dword ptr fs:[eax]
 0050FBAA    mov         dword ptr fs:[eax],esp
 0050FBAD    inc         dword ptr ds:[7938F0]
>0050FBB3    jne         0050FBCA
 0050FBB5    mov         eax,786910;gvar_00786910:array[89] of ?
 0050FBBA    mov         ecx,59
 0050FBBF    mov         edx,dword ptr ds:[4432AC];TIdentMapEntry
 0050FBC5    call        @FinalizeArray
 0050FBCA    xor         eax,eax
 0050FBCC    pop         edx
 0050FBCD    pop         ecx
 0050FBCE    pop         ecx
 0050FBCF    mov         dword ptr fs:[eax],edx
 0050FBD2    push        50FBDF
 0050FBD7    ret
>0050FBD8    jmp         @HandleFinally
>0050FBDD    jmp         0050FBD7
 0050FBDF    pop         ebp
 0050FBE0    ret
*}
end.