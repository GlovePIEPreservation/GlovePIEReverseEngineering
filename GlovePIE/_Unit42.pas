//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit42;

interface

uses
  SysUtils, Classes, mwCompletionProposal, JvTypes, StdCtrls, ShlObj, GraphUtil, Graphics;

type
  TCompletionProposalPaintItem = function(Key:string; Canvas:TCanvas; x:Integer; y:Integer):Boolean of object;;
  TCompletionProposalForm = class(TForm)
  published
    destructor Destroy();//0052AC4C
    constructor Create(AOwner:TComponent);//0052AAC8
  public
    FCurrentString:string;//f388
    FOnKeyPress:TKeyPressEvent;//f390
    f392:word;//f392
    f394:TMwCompletionProposal;//f394
    FOnKeyDelete:TNotifyEvent;//f398
    f39A:word;//f39A
    f39C:TMwCompletionProposal;//f39C
    FOnPaintItem:TCompletionProposalPaintItem;//f3A0
    f3A2:word;//f3A2
    f3A4:dword;//f3A4
    FItemList:TStrings;//f3A8
    FPosition:Integer;//f3AC
    FNbLinesInWindow:Integer;//f3B0
    FFontHeight:Integer;//f3B4
    Scroll:TScrollBar;//f3B8
    FOnValidate:TNotifyEvent;//f3C0
    f3C2:word;//f3C2
    f3C4:TMwCompletionProposal;//f3C4
    FOnCancel:TNotifyEvent;//f3C8
    f3CA:word;//f3CA
    f3CC:TMwCompletionProposal;//f3CC
    FClSelect:TColor;//f3D0
    FAnsi:Boolean;//f3D4
    Bitmap:TBitmap;//f3D8
    fCurrentEditor:TComponent;//f3DC
    destructor Destroy(); virtual;//0052AC4C
    constructor Create(AOwner:TComponent); virtual;//v2C//0052AAC8
    procedure Paint; dynamic;//0052B070
    procedure Deactivate; dynamic;//0052AC44
    procedure KeyPress(Key:Char); dynamic;//0052AF68
    procedure KeyDown(Key:Word; Shift:TShiftState); dynamic;//0052AC94
    procedure MouseDown(Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer); dynamic;//0052B040
    procedure DblClick; dynamic;//0052AC20
    procedure SetCurrentString(Value:string);//0052B3D4
    procedure SetItemList(Value:TStrings);//0052B51C
    procedure SetNbLinesInWindow(Value:Integer);//0052B534
    //function SetPosition(Value:Integer):?;//0052B5C0
  end;
  TCompletionProposal = class(TComponent)
  published
    procedure Execute(s:string; x:Integer; y:Integer);//0052B6F0
    destructor Destroy();//0052B6C0
    constructor Create(Aowner:TComponent);//0052B678
  public
    Form:TCompletionProposalForm;//f34
    FOnExecute:TNotifyEvent;//f38
    f3A:word;//f3A
    f3C:dword;//f3C
    destructor Destroy(); virtual;//0052B6C0
    constructor Create(Aowner:TComponent); virtual;//v2C//0052B678
    //function GetItemList:?;//0052B78C
    //function GetNbLinesInWindow:?;//0052B798
    //procedure GetOnPaintItem(?:?);//0052B7D4
    //function GetPosition:?;//0052B804
    procedure SetItemList(Value:TStrings);//0052B81C
    procedure SetNbLinesInWindow(Value:Integer);//0052B828
    //procedure SetOnPaintItem(Value:TCompletionProposalPaintItem; ?:?; ?:?);//0052B86C
    procedure SetPosition(Value:Integer);//0052B888
    //function GetClSelect:?;//0052B8B0
    procedure SetClSelect(Value:TColor);//0052B8BC
    procedure SetAnsiStrings(Value:Boolean);//0052B8FC
    //function GetAnsiStrings:?;//0052B908
  end;
  TMwCompletionProposal = class(TCompletionProposal)
  published
    function RemoveEditor(Editor:TmwCustomEdit):Boolean;//0052C130
    function EditorsCount:Integer;//0052C100
    procedure AddEditor(Editor:TmwCustomEdit);//0052C074
    constructor Create(AOwner:TComponent);//0052BC78
    destructor Destroy();//0052C000
  public
    FShortCut:TShortCut;//f40
    fEditors:TList;//f44
    fEditstuffs:TList;//f48
    FEndOfTokenChr:string;//f4C
    destructor Destroy(); virtual;//0052C000
    procedure Notification(AComponent:TComponent; Operation:TOperation); virtual;//v10//0052BC38
    constructor Create(AOwner:TComponent); virtual;//v2C//0052BC78
    procedure SetEditor(Value:TmwCustomEdit);//0052BC30
    procedure SetShortCut(Value:TShortCut);//0052BD54
    //function GetEditor:?;//0052C054
  end;
  EJVCLException = class(Exception)
  end;
  TDefColorItem = TDefColorItem = record//size=C
f4:string;//f4
f8:string;//f8
end;
Value:TColor;//f0
Constant:string;//f4
Description:string;//f8
end;;
    procedure DblClick;//0052AC20
    procedure Deactivate;//0052AC44
    procedure KeyDown(Key:Word; Shift:TShiftState);//0052AC94
    procedure KeyPress(Key:Char);//0052AF68
    procedure MouseDown(Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer);//0052B040
    procedure Paint;//0052B070
    //procedure sub_0052B344(?:?);//0052B344
    procedure sub_0052B398(?:TCompletionProposalForm);//0052B398
    procedure sub_0052B3C0(?:TCompletionProposalForm);//0052B3C0
    //procedure sub_0052B624(?:?);//0052B624
    procedure sub_0052B810(?:TCompletionProposal);//0052B810
    //procedure sub_0052B914(?:?; ?:?);//0052B914
    //procedure sub_0052B95C(?:?; ?:?);//0052B95C
    //procedure sub_0052BBE0(?:?; ?:?; ?:?);//0052BBE0
    procedure Notification(AComponent:TComponent; Operation:TOperation);//0052BC38
    //procedure sub_0052BF94(?:?; ?:?; ?:?);//0052BF94
    //procedure sub_0052C108(?:TMwCompletionProposal; ?:?);//0052C108

implementation

//0052AAC8
constructor TCompletionProposalForm.Create(AOwner:TComponent);
begin
{*
 0052AAC8    push        ebp
 0052AAC9    mov         ebp,esp
 0052AACB    push        ecx
 0052AACC    push        ebx
 0052AACD    push        esi
 0052AACE    test        dl,dl
>0052AAD0    je          0052AADA
 0052AAD2    add         esp,0FFFFFFF0
 0052AAD5    call        @ClassCreate
 0052AADA    mov         byte ptr [ebp-1],dl
 0052AADD    mov         ebx,eax
 0052AADF    push        0
 0052AAE1    xor         edx,edx
 0052AAE3    mov         eax,ebx
 0052AAE5    mov         esi,dword ptr [eax]
 0052AAE7    call        dword ptr [esi+108];TCustomForm.CreateNew
 0052AAED    mov         dl,1
 0052AAEF    mov         eax,[0043C7BC];TStringList
 0052AAF4    call        TStringList.Create;TStringList.Create
 0052AAF9    mov         dword ptr [ebx+3A8],eax;TCompletionProposalForm.FItemList:TStrings
 0052AAFF    xor         edx,edx
 0052AB01    mov         eax,ebx
 0052AB03    call        TCustomForm.SetBorderStyle
 0052AB08    mov         edx,106
 0052AB0D    mov         eax,ebx
 0052AB0F    call        TControl.SetWidth
 0052AB14    mov         ecx,ebx
 0052AB16    mov         dl,1
 0052AB18    mov         eax,[004B76B0];TScrollBar
 0052AB1D    call        TScrollBar.Create;TScrollBar.Create
 0052AB22    mov         esi,eax
 0052AB24    mov         dword ptr [ebx+3B8],esi;TCompletionProposalForm.Scroll:TScrollBar
 0052AB2A    mov         eax,esi
 0052AB2C    mov         dl,1
 0052AB2E    call        TScrollBar.SetKind
 0052AB33    mov         eax,dword ptr [ebx+3B8];TCompletionProposalForm.Scroll:TScrollBar
 0052AB39    mov         dword ptr [eax+294],ebx;TScrollBar.?f294:TCompletionProposalForm
 0052AB3F    mov         dword ptr [eax+290],52B344;TScrollBar.FOnChange:TNotifyEvent sub_0052B344
 0052AB49    mov         edx,ebx
 0052AB4B    mov         ecx,dword ptr [eax]
 0052AB4D    call        dword ptr [ecx+78];TWinControl.SetParent
 0052AB50    mov         eax,dword ptr [ebx+3B8];TCompletionProposalForm.Scroll:TScrollBar
 0052AB56    mov         dword ptr [eax+204],ebx;TScrollBar.?f204:TCompletionProposalForm
 0052AB5C    mov         dword ptr [eax+200],52B390;TScrollBar.FOnEnter:TNotifyEvent
 0052AB66    xor         edx,edx
 0052AB68    mov         eax,ebx
 0052AB6A    call        TCustomForm.SetVisible
 0052AB6F    mov         eax,ebx
 0052AB71    call        TCustomForm.GetCanvas
 0052AB76    mov         edx,52ABF4;'Cyrille de Brebisson'
 0052AB7B    call        TCustomCanvas.TextHeight
 0052AB80    mov         dword ptr [ebx+3B4],eax;TCompletionProposalForm.FFontHeight:Integer
 0052AB86    mov         edx,0FF000005
 0052AB8B    mov         eax,ebx
 0052AB8D    call        TControl.SetColor
 0052AB92    mov         dword ptr [ebx+3D0],0FF00000D;TCompletionProposalForm.FClSelect:TColor
 0052AB9C    mov         eax,dword ptr [ebx+3A8];TCompletionProposalForm.FItemList:TStrings
 0052ABA2    mov         dword ptr [eax+44],ebx
 0052ABA5    mov         dword ptr [eax+40],52B624;sub_0052B624
 0052ABAC    mov         dl,1
 0052ABAE    mov         eax,[00463B28];TBitmap
 0052ABB3    call        TBitmap.Create;TBitmap.Create
 0052ABB8    mov         dword ptr [ebx+3D8],eax;TCompletionProposalForm.Bitmap:TBitmap
 0052ABBE    mov         edx,6
 0052ABC3    mov         eax,ebx
 0052ABC5    call        TCompletionProposalForm.SetNbLinesInWindow
 0052ABCA    mov         eax,ebx
 0052ABCC    cmp         byte ptr [ebp-1],0
>0052ABD0    je          0052ABE1
 0052ABD2    call        @AfterConstruction
 0052ABD7    pop         dword ptr fs:[0]
 0052ABDE    add         esp,0C
 0052ABE1    mov         eax,ebx
 0052ABE3    pop         esi
 0052ABE4    pop         ebx
 0052ABE5    pop         ecx
 0052ABE6    pop         ebp
 0052ABE7    ret
*}
end;

//0052AC20
procedure TCompletionProposalForm.DblClick;
begin
{*
 0052AC20    push        ebx
 0052AC21    mov         ebx,eax
 0052AC23    mov         eax,ebx
 0052AC25    call        TControl.DblClick
 0052AC2A    cmp         word ptr [ebx+3C2],0;TCompletionProposalForm.?f3C2:word
>0052AC32    je          0052AC42
 0052AC34    mov         edx,ebx
 0052AC36    mov         eax,dword ptr [ebx+3C4];TCompletionProposalForm.?f3C4:TMwCompletionProposal
 0052AC3C    call        dword ptr [ebx+3C0];TCompletionProposalForm.FOnValidate
 0052AC42    pop         ebx
 0052AC43    ret
*}
end;

//0052AC44
procedure TCompletionProposalForm.Deactivate;
begin
{*
 0052AC44    xor         edx,edx
 0052AC46    call        TCustomForm.SetVisible
 0052AC4B    ret
*}
end;

//0052AC4C
destructor TCompletionProposalForm.Destroy();
begin
{*
 0052AC4C    push        ebx
 0052AC4D    push        esi
 0052AC4E    call        @BeforeDestruction
 0052AC53    mov         ebx,edx
 0052AC55    mov         esi,eax
 0052AC57    mov         eax,dword ptr [esi+3D8];TCompletionProposalForm.Bitmap:TBitmap
 0052AC5D    call        TObject.Free
 0052AC62    mov         eax,dword ptr [esi+3B8];TCompletionProposalForm.Scroll:TScrollBar
 0052AC68    call        TObject.Free
 0052AC6D    mov         eax,dword ptr [esi+3A8];TCompletionProposalForm.FItemList:TStrings
 0052AC73    call        TObject.Free
 0052AC78    mov         edx,ebx
 0052AC7A    and         dl,0FC
 0052AC7D    mov         eax,esi
 0052AC7F    call        TCustomForm.Destroy
 0052AC84    test        bl,bl
>0052AC86    jle         0052AC8F
 0052AC88    mov         eax,esi
 0052AC8A    call        @ClassDestroy
 0052AC8F    pop         esi
 0052AC90    pop         ebx
 0052AC91    ret
*}
end;

//0052AC94
procedure TCompletionProposalForm.KeyDown(Key:Word; Shift:TShiftState);
begin
{*
 0052AC94    push        ebp
 0052AC95    mov         ebp,esp
 0052AC97    add         esp,0FFFFFFF8
 0052AC9A    push        ebx
 0052AC9B    push        esi
 0052AC9C    xor         ebx,ebx
 0052AC9E    mov         dword ptr [ebp-8],ebx
 0052ACA1    mov         word ptr [ebp-2],cx
 0052ACA5    mov         esi,eax
 0052ACA7    xor         eax,eax
 0052ACA9    push        ebp
 0052ACAA    push        52AF55
 0052ACAF    push        dword ptr fs:[eax]
 0052ACB2    mov         dword ptr fs:[eax],esp
 0052ACB5    movzx       eax,word ptr [edx]
 0052ACB8    add         eax,0FFFFFFF8
 0052ACBB    cmp         eax,20
>0052ACBE    ja          0052AF34
 0052ACC4    movzx       eax,byte ptr [eax+52ACD2]
 0052ACCB    jmp         dword ptr [eax*4+52ACF3]
 0052ACCB    db          10
 0052ACCB    db          0
 0052ACCB    db          0
 0052ACCB    db          0
 0052ACCB    db          0
 0052ACCB    db          1
 0052ACCB    db          0
 0052ACCB    db          0
 0052ACCB    db          0
 0052ACCB    db          0
 0052ACCB    db          0
 0052ACCB    db          0
 0052ACCB    db          0
 0052ACCB    db          0
 0052ACCB    db          0
 0052ACCB    db          0
 0052ACCB    db          0
 0052ACCB    db          0
 0052ACCB    db          0
 0052ACCB    db          2
 0052ACCB    db          0
 0052ACCB    db          0
 0052ACCB    db          0
 0052ACCB    db          0
 0052ACCB    db          3
 0052ACCB    db          4
 0052ACCB    db          5
 0052ACCB    db          6
 0052ACCB    db          7
 0052ACCB    db          0
 0052ACCB    db          8
 0052ACCB    db          0
 0052ACCB    db          9
 0052ACCB    dd          0052AF34
 0052ACCB    dd          0052AD1F
 0052ACCB    dd          0052AD40
 0052ACCB    dd          0052AD61
 0052ACCB    dd          0052ADB5
 0052ACCB    dd          0052ADD2
 0052ACCB    dd          0052ADEF
 0052ACCB    dd          0052AE13
 0052ACCB    dd          0052AE2B
 0052ACCB    dd          0052AE4B
 0052ACCB    dd          0052AE77
 0052AD1F    cmp         word ptr [esi+3C2],0;TCompletionProposalForm.?f3C2:word
>0052AD27    je          0052AF34
 0052AD2D    mov         edx,esi
 0052AD2F    mov         eax,dword ptr [esi+3C4];TCompletionProposalForm.?f3C4:TMwCompletionProposal
 0052AD35    call        dword ptr [esi+3C0];TCompletionProposalForm.FOnValidate
>0052AD3B    jmp         0052AF34
 0052AD40    cmp         word ptr [esi+3CA],0;TCompletionProposalForm.?f3CA:word
>0052AD48    je          0052AF34
 0052AD4E    mov         edx,esi
 0052AD50    mov         eax,dword ptr [esi+3CC];TCompletionProposalForm.?f3CC:TMwCompletionProposal
 0052AD56    call        dword ptr [esi+3C8];TCompletionProposalForm.FOnCancel
>0052AD5C    jmp         0052AF34
 0052AD61    cmp         word ptr [esi+3CA],0;TCompletionProposalForm.?f3CA:word
>0052AD69    je          0052AD79
 0052AD6B    mov         edx,esi
 0052AD6D    mov         eax,dword ptr [esi+3CC];TCompletionProposalForm.?f3CC:TMwCompletionProposal
 0052AD73    call        dword ptr [esi+3C8];TCompletionProposalForm.FOnCancel
 0052AD79    mov         ebx,dword ptr [esi+3DC];TCompletionProposalForm.fCurrentEditor:TComponent
 0052AD7F    test        ebx,ebx
>0052AD81    je          0052AF34
 0052AD87    mov         eax,ebx
 0052AD89    mov         edx,dword ptr ds:[5192F0];TmwCustomEdit
 0052AD8F    call        @IsClass
 0052AD94    test        al,al
>0052AD96    je          0052AF34
 0052AD9C    push        0
 0052AD9E    mov         cx,20
 0052ADA2    mov         dx,19B
 0052ADA6    mov         eax,ebx
 0052ADA8    mov         ebx,dword ptr [eax]
 0052ADAA    call        dword ptr [ebx+11C]
>0052ADB0    jmp         0052AF34
 0052ADB5    mov         ebx,dword ptr [esi+3B0];TCompletionProposalForm.FNbLinesInWindow:Integer
 0052ADBB    test        ebx,ebx
>0052ADBD    jle         0052AF34
 0052ADC3    mov         eax,esi
 0052ADC5    call        0052B3C0
 0052ADCA    dec         ebx
>0052ADCB    jne         0052ADC3
>0052ADCD    jmp         0052AF34
 0052ADD2    mov         ebx,dword ptr [esi+3B0];TCompletionProposalForm.FNbLinesInWindow:Integer
 0052ADD8    test        ebx,ebx
>0052ADDA    jle         0052AF34
 0052ADE0    mov         eax,esi
 0052ADE2    call        0052B398
 0052ADE7    dec         ebx
>0052ADE8    jne         0052ADE0
>0052ADEA    jmp         0052AF34
 0052ADEF    test        byte ptr [ebp-2],4
>0052ADF3    je          0052AF34
 0052ADF9    mov         eax,dword ptr [esi+3A8];TCompletionProposalForm.FItemList:TStrings
 0052ADFF    mov         edx,dword ptr [eax]
 0052AE01    call        dword ptr [edx+14];TStrings.GetCount
 0052AE04    mov         edx,eax
 0052AE06    dec         edx
 0052AE07    mov         eax,esi
 0052AE09    call        TCompletionProposalForm.SetPosition
>0052AE0E    jmp         0052AF34
 0052AE13    test        byte ptr [ebp-2],4
>0052AE17    je          0052AF34
 0052AE1D    xor         edx,edx
 0052AE1F    mov         eax,esi
 0052AE21    call        TCompletionProposalForm.SetPosition
>0052AE26    jmp         0052AF34
 0052AE2B    test        byte ptr [ebp-2],4
>0052AE2F    je          0052AE3F
 0052AE31    xor         edx,edx
 0052AE33    mov         eax,esi
 0052AE35    call        TCompletionProposalForm.SetPosition
>0052AE3A    jmp         0052AF34
 0052AE3F    mov         eax,esi
 0052AE41    call        0052B3C0
>0052AE46    jmp         0052AF34
 0052AE4B    test        byte ptr [ebp-2],4
>0052AE4F    je          0052AE6B
 0052AE51    mov         eax,dword ptr [esi+3A8];TCompletionProposalForm.FItemList:TStrings
 0052AE57    mov         edx,dword ptr [eax]
 0052AE59    call        dword ptr [edx+14];TStrings.GetCount
 0052AE5C    mov         edx,eax
 0052AE5E    dec         edx
 0052AE5F    mov         eax,esi
 0052AE61    call        TCompletionProposalForm.SetPosition
>0052AE66    jmp         0052AF34
 0052AE6B    mov         eax,esi
 0052AE6D    call        0052B398
>0052AE72    jmp         0052AF34
 0052AE77    movzx       eax,word ptr ds:[52AF64];0x0 gvar_0052AF64
 0052AE7E    cmp         ax,word ptr [ebp-2]
>0052AE82    jne         0052AE9A
 0052AE84    mov         eax,dword ptr [esi+388];TCompletionProposalForm.FCurrentString:string
 0052AE8A    test        eax,eax
>0052AE8C    je          0052AE93
 0052AE8E    sub         eax,4
 0052AE91    mov         eax,dword ptr [eax]
 0052AE93    test        eax,eax
 0052AE95    setg        al
>0052AE98    jmp         0052AE9C
 0052AE9A    xor         eax,eax
 0052AE9C    test        al,al
>0052AE9E    je          0052AEEA
 0052AEA0    mov         ebx,dword ptr [esi+388];TCompletionProposalForm.FCurrentString:string
 0052AEA6    test        ebx,ebx
>0052AEA8    je          0052AEAF
 0052AEAA    sub         ebx,4
 0052AEAD    mov         ebx,dword ptr [ebx]
 0052AEAF    lea         eax,[ebp-8]
 0052AEB2    push        eax
 0052AEB3    mov         ecx,ebx
 0052AEB5    dec         ecx
 0052AEB6    mov         edx,1
 0052AEBB    mov         eax,dword ptr [esi+388];TCompletionProposalForm.FCurrentString:string
 0052AEC1    call        @UStrCopy
 0052AEC6    mov         edx,dword ptr [ebp-8]
 0052AEC9    mov         eax,esi
 0052AECB    call        TCompletionProposalForm.SetCurrentString
 0052AED0    cmp         word ptr [esi+39A],0;TCompletionProposalForm.?f39A:word
>0052AED8    je          0052AF34
 0052AEDA    mov         edx,esi
 0052AEDC    mov         eax,dword ptr [esi+39C];TCompletionProposalForm.?f39C:TMwCompletionProposal
 0052AEE2    call        dword ptr [esi+398];TCompletionProposalForm.FOnKeyDelete
>0052AEE8    jmp         0052AF34
 0052AEEA    movzx       eax,word ptr ds:[52AF64];0x0 gvar_0052AF64
 0052AEF1    cmp         ax,word ptr [ebp-2]
>0052AEF5    jne         0052AF34
 0052AEF7    mov         edx,esi
 0052AEF9    mov         eax,dword ptr [esi+3CC];TCompletionProposalForm.?f3CC:TMwCompletionProposal
 0052AEFF    call        dword ptr [esi+3C8];TCompletionProposalForm.FOnCancel
 0052AF05    mov         ebx,dword ptr [esi+3DC];TCompletionProposalForm.fCurrentEditor:TComponent
 0052AF0B    test        ebx,ebx
>0052AF0D    je          0052AF34
 0052AF0F    mov         eax,ebx
 0052AF11    mov         edx,dword ptr ds:[5192F0];TmwCustomEdit
 0052AF17    call        @IsClass
 0052AF1C    test        al,al
>0052AF1E    je          0052AF34
 0052AF20    push        0
 0052AF22    mov         cx,9
 0052AF26    mov         dx,191
 0052AF2A    mov         eax,ebx
 0052AF2C    mov         ebx,dword ptr [eax]
 0052AF2E    call        dword ptr [ebx+11C]
 0052AF34    mov         eax,esi
 0052AF36    mov         si,0FFA4
 0052AF3A    call        @CallDynaInst;TCompletionProposalForm.Paint
 0052AF3F    xor         eax,eax
 0052AF41    pop         edx
 0052AF42    pop         ecx
 0052AF43    pop         ecx
 0052AF44    mov         dword ptr fs:[eax],edx
 0052AF47    push        52AF5C
 0052AF4C    lea         eax,[ebp-8]
 0052AF4F    call        @UStrClr
 0052AF54    ret
>0052AF55    jmp         @HandleFinally
>0052AF5A    jmp         0052AF4C
 0052AF5C    pop         esi
 0052AF5D    pop         ebx
 0052AF5E    pop         ecx
 0052AF5F    pop         ecx
 0052AF60    pop         ebp
 0052AF61    ret
*}
end;

//0052AF68
procedure TCompletionProposalForm.KeyPress(Key:Char);
begin
{*
 0052AF68    push        ebp
 0052AF69    mov         ebp,esp
 0052AF6B    push        0
 0052AF6D    push        0
 0052AF6F    push        ebx
 0052AF70    push        esi
 0052AF71    mov         esi,edx
 0052AF73    mov         ebx,eax
 0052AF75    xor         eax,eax
 0052AF77    push        ebp
 0052AF78    push        52B031
 0052AF7D    push        dword ptr fs:[eax]
 0052AF80    mov         dword ptr fs:[eax],esp
 0052AF83    movzx       eax,word ptr [esi]
 0052AF86    sub         ax,8
>0052AF8A    je          0052AFD7
 0052AF8C    add         eax,0FFFFFFE7
 0052AF8F    sub         ax,5A
>0052AF93    jae         0052AFF3
 0052AF95    lea         eax,[ebp-8]
 0052AF98    movzx       edx,word ptr [esi]
 0052AF9B    call        @UStrFromWChar
 0052AFA0    mov         ecx,dword ptr [ebp-8]
 0052AFA3    lea         eax,[ebp-4]
 0052AFA6    mov         edx,dword ptr [ebx+388];TCompletionProposalForm.FCurrentString:string
 0052AFAC    call        @UStrCat3
 0052AFB1    mov         edx,dword ptr [ebp-4]
 0052AFB4    mov         eax,ebx
 0052AFB6    call        TCompletionProposalForm.SetCurrentString
 0052AFBB    cmp         word ptr [ebx+392],0;TCompletionProposalForm.?f392:word
>0052AFC3    je          0052B00B
 0052AFC5    mov         ecx,esi
 0052AFC7    mov         edx,ebx
 0052AFC9    mov         eax,dword ptr [ebx+394];TCompletionProposalForm.?f394:TMwCompletionProposal
 0052AFCF    call        dword ptr [ebx+390];TCompletionProposalForm.FOnKeyPress
>0052AFD5    jmp         0052B00B
 0052AFD7    cmp         word ptr [ebx+392],0;TCompletionProposalForm.?f392:word
>0052AFDF    je          0052B00B
 0052AFE1    mov         ecx,esi
 0052AFE3    mov         edx,ebx
 0052AFE5    mov         eax,dword ptr [ebx+394];TCompletionProposalForm.?f394:TMwCompletionProposal
 0052AFEB    call        dword ptr [ebx+390];TCompletionProposalForm.FOnKeyPress
>0052AFF1    jmp         0052B00B
 0052AFF3    cmp         word ptr [ebx+3CA],0;TCompletionProposalForm.?f3CA:word
>0052AFFB    je          0052B00B
 0052AFFD    mov         edx,ebx
 0052AFFF    mov         eax,dword ptr [ebx+3CC];TCompletionProposalForm.?f3CC:TMwCompletionProposal
 0052B005    call        dword ptr [ebx+3C8];TCompletionProposalForm.FOnCancel
 0052B00B    mov         eax,ebx
 0052B00D    mov         si,0FFA4
 0052B011    call        @CallDynaInst;TCompletionProposalForm.Paint
 0052B016    xor         eax,eax
 0052B018    pop         edx
 0052B019    pop         ecx
 0052B01A    pop         ecx
 0052B01B    mov         dword ptr fs:[eax],edx
 0052B01E    push        52B038
 0052B023    lea         eax,[ebp-8]
 0052B026    mov         edx,2
 0052B02B    call        @UStrArrayClr
 0052B030    ret
>0052B031    jmp         @HandleFinally
>0052B036    jmp         0052B023
 0052B038    pop         esi
 0052B039    pop         ebx
 0052B03A    pop         ecx
 0052B03B    pop         ecx
 0052B03C    pop         ebp
 0052B03D    ret
*}
end;

//0052B040
procedure TCompletionProposalForm.MouseDown(Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer);
begin
{*
 0052B040    push        ebp
 0052B041    mov         ebp,esp
 0052B043    push        ebx
 0052B044    mov         ecx,eax
 0052B046    mov         ebx,dword ptr [ebp+8]
 0052B049    mov         eax,ebx
 0052B04B    dec         eax
 0052B04C    cdq
 0052B04D    idiv        eax,dword ptr [ecx+3B4];TCompletionProposalForm.FFontHeight:Integer
 0052B053    mov         ebx,eax
 0052B055    mov         eax,dword ptr [ecx+3B8];TCompletionProposalForm.Scroll:TScrollBar
 0052B05B    mov         edx,dword ptr [eax+274];TScrollBar.FPosition:Integer
 0052B061    add         edx,ebx
 0052B063    mov         eax,ecx
 0052B065    call        TCompletionProposalForm.SetPosition
 0052B06A    pop         ebx
 0052B06B    pop         ebp
 0052B06C    ret         8
*}
end;

//0052B070
procedure TCompletionProposalForm.Paint;
begin
{*
 0052B070    push        ebp
 0052B071    mov         ebp,esp
 0052B073    add         esp,0FFFFFFF0
 0052B076    push        ebx
 0052B077    push        esi
 0052B078    push        edi
 0052B079    xor         edx,edx
 0052B07B    mov         dword ptr [ebp-10],edx
 0052B07E    mov         dword ptr [ebp-0C],edx
 0052B081    mov         ebx,eax
 0052B083    xor         eax,eax
 0052B085    push        ebp
 0052B086    push        52B334
 0052B08B    push        dword ptr fs:[eax]
 0052B08E    mov         dword ptr fs:[eax],esp
 0052B091    mov         eax,dword ptr [ebx+3A8];TCompletionProposalForm.FItemList:TStrings
 0052B097    mov         edx,dword ptr [eax]
 0052B099    call        dword ptr [edx+14];TStrings.GetCount
 0052B09C    sub         eax,dword ptr [ebx+3B0]
>0052B0A2    jns         0052B0B3
 0052B0A4    xor         edx,edx
 0052B0A6    mov         eax,dword ptr [ebx+3B8];TCompletionProposalForm.Scroll:TScrollBar
 0052B0AC    call        TScrollBar.SetMax
>0052B0B1    jmp         0052B0D1
 0052B0B3    mov         eax,dword ptr [ebx+3A8];TCompletionProposalForm.FItemList:TStrings
 0052B0B9    mov         edx,dword ptr [eax]
 0052B0BB    call        dword ptr [edx+14];TStrings.GetCount
 0052B0BE    mov         edx,eax
 0052B0C0    sub         edx,dword ptr [ebx+3B0]
 0052B0C6    mov         eax,dword ptr [ebx+3B8];TCompletionProposalForm.Scroll:TScrollBar
 0052B0CC    call        TScrollBar.SetMax
 0052B0D1    mov         edx,dword ptr [ebx+3AC];TCompletionProposalForm.FPosition:Integer
 0052B0D7    mov         eax,ebx
 0052B0D9    call        TCompletionProposalForm.SetPosition
 0052B0DE    mov         eax,dword ptr [ebx+3B8];TCompletionProposalForm.Scroll:TScrollBar
 0052B0E4    movzx       edx,word ptr [ebx+3B0];TCompletionProposalForm.FNbLinesInWindow:Integer
 0052B0EB    mov         word ptr [eax+28A],dx;TScrollBar.FLargeChange:TScrollBarInc
 0052B0F2    mov         eax,ebx
 0052B0F4    call        TCustomForm.GetCanvas
 0052B0F9    mov         eax,dword ptr [eax+44];TCanvas.FPen:TPen
 0052B0FC    xor         edx,edx
 0052B0FE    call        TPen.SetColor
 0052B103    mov         eax,ebx
 0052B105    call        TCustomForm.GetCanvas
 0052B10A    xor         ecx,ecx
 0052B10C    xor         edx,edx
 0052B10E    mov         esi,dword ptr [eax]
 0052B110    call        dword ptr [esi+64];TCanvas.MoveTo
 0052B113    mov         eax,ebx
 0052B115    call        TCustomForm.GetCanvas
 0052B11A    mov         edx,dword ptr [ebx+48];TCompletionProposalForm.FWidth:Integer
 0052B11D    dec         edx
 0052B11E    xor         ecx,ecx
 0052B120    mov         esi,dword ptr [eax]
 0052B122    call        dword ptr [esi+60];TCanvas.LineTo
 0052B125    mov         eax,ebx
 0052B127    call        TCustomForm.GetCanvas
 0052B12C    mov         ecx,dword ptr [ebx+4C];TCompletionProposalForm.FHeight:Integer
 0052B12F    dec         ecx
 0052B130    mov         edx,dword ptr [ebx+48];TCompletionProposalForm.FWidth:Integer
 0052B133    dec         edx
 0052B134    mov         esi,dword ptr [eax]
 0052B136    call        dword ptr [esi+60];TCanvas.LineTo
 0052B139    mov         eax,ebx
 0052B13B    call        TCustomForm.GetCanvas
 0052B140    mov         ecx,dword ptr [ebx+4C];TCompletionProposalForm.FHeight:Integer
 0052B143    dec         ecx
 0052B144    xor         edx,edx
 0052B146    mov         esi,dword ptr [eax]
 0052B148    call        dword ptr [esi+60];TCanvas.LineTo
 0052B14B    mov         eax,ebx
 0052B14D    call        TCustomForm.GetCanvas
 0052B152    xor         ecx,ecx
 0052B154    xor         edx,edx
 0052B156    mov         esi,dword ptr [eax]
 0052B158    call        dword ptr [esi+60];TCanvas.LineTo
 0052B15B    mov         esi,dword ptr [ebx+3D8];TCompletionProposalForm.Bitmap:TBitmap
 0052B161    mov         eax,esi
 0052B163    call        TBitmap.GetCanvas
 0052B168    mov         eax,dword ptr [eax+44];TCanvas.FPen:TPen
 0052B16B    mov         edx,dword ptr [ebx+6C];TCompletionProposalForm.FColor:TColor
 0052B16E    call        TPen.SetColor
 0052B173    mov         eax,esi
 0052B175    call        TBitmap.GetCanvas
 0052B17A    mov         eax,dword ptr [eax+48];TCanvas.FBrush:TBrush
 0052B17D    mov         edx,dword ptr [ebx+6C];TCompletionProposalForm.FColor:TColor
 0052B180    call        TBrush.SetColor
 0052B185    mov         eax,esi
 0052B187    mov         edx,dword ptr [eax]
 0052B189    call        dword ptr [edx+30];TBitmap.GetWidth
 0052B18C    push        eax
 0052B18D    mov         eax,esi
 0052B18F    mov         edx,dword ptr [eax]
 0052B191    call        dword ptr [edx+24];TBitmap.GetHeight
 0052B194    push        eax
 0052B195    mov         eax,esi
 0052B197    call        TBitmap.GetCanvas
 0052B19C    xor         ecx,ecx
 0052B19E    xor         edx,edx
 0052B1A0    mov         edi,dword ptr [eax]
 0052B1A2    call        dword ptr [edi+7C];TCanvas.Rectangle
 0052B1A5    mov         eax,dword ptr [ebx+3A8];TCompletionProposalForm.FItemList:TStrings
 0052B1AB    mov         edx,dword ptr [eax]
 0052B1AD    call        dword ptr [edx+14];TStrings.GetCount
 0052B1B0    mov         edx,eax
 0052B1B2    dec         edx
 0052B1B3    mov         eax,dword ptr [ebx+3B0];TCompletionProposalForm.FNbLinesInWindow:Integer
 0052B1B9    dec         eax
 0052B1BA    call        0051048C
 0052B1BF    test        eax,eax
>0052B1C1    jl          0052B2FC
 0052B1C7    inc         eax
 0052B1C8    mov         dword ptr [ebp-8],eax
 0052B1CB    mov         dword ptr [ebp-4],0
 0052B1D2    mov         eax,dword ptr [ebx+3B8];TCompletionProposalForm.Scroll:TScrollBar
 0052B1D8    mov         eax,dword ptr [eax+274];TScrollBar.FPosition:Integer
 0052B1DE    add         eax,dword ptr [ebp-4]
 0052B1E1    cmp         eax,dword ptr [ebx+3AC];TCompletionProposalForm.FPosition:Integer
>0052B1E7    jne         0052B251
 0052B1E9    mov         eax,esi
 0052B1EB    call        TBitmap.GetCanvas
 0052B1F0    mov         eax,dword ptr [eax+48];TCanvas.FBrush:TBrush
 0052B1F3    mov         edx,dword ptr [ebx+3D0];TCompletionProposalForm.FClSelect:TColor
 0052B1F9    call        TBrush.SetColor
 0052B1FE    mov         eax,esi
 0052B200    call        TBitmap.GetCanvas
 0052B205    mov         eax,dword ptr [eax+44];TCanvas.FPen:TPen
 0052B208    mov         edx,dword ptr [ebx+3D0];TCompletionProposalForm.FClSelect:TColor
 0052B20E    call        TPen.SetColor
 0052B213    mov         eax,esi
 0052B215    mov         edx,dword ptr [eax]
 0052B217    call        dword ptr [edx+30];TBitmap.GetWidth
 0052B21A    push        eax
 0052B21B    mov         eax,dword ptr [ebp-4]
 0052B21E    inc         eax
 0052B21F    imul        dword ptr [ebx+3B4];TCompletionProposalForm.FFontHeight:Integer
 0052B225    push        eax
 0052B226    mov         eax,esi
 0052B228    call        TBitmap.GetCanvas
 0052B22D    mov         ecx,dword ptr [ebx+3B4];TCompletionProposalForm.FFontHeight:Integer
 0052B233    imul        ecx,dword ptr [ebp-4]
 0052B237    xor         edx,edx
 0052B239    mov         edi,dword ptr [eax]
 0052B23B    call        dword ptr [edi+7C];TCanvas.Rectangle
 0052B23E    mov         eax,esi
 0052B240    call        TBitmap.GetCanvas
 0052B245    mov         eax,dword ptr [eax+44];TCanvas.FPen:TPen
 0052B248    xor         edx,edx
 0052B24A    call        TPen.SetColor
>0052B24F    jmp         0052B263
 0052B251    mov         eax,esi
 0052B253    call        TBitmap.GetCanvas
 0052B258    mov         eax,dword ptr [eax+48];TCanvas.FBrush:TBrush
 0052B25B    mov         edx,dword ptr [ebx+6C];TCompletionProposalForm.FColor:TColor
 0052B25E    call        TBrush.SetColor
 0052B263    cmp         word ptr [ebx+3A2],0;TCompletionProposalForm.?f3A2:word
>0052B26B    je          0052B2B4
 0052B26D    push        0
 0052B26F    mov         eax,dword ptr [ebx+3B4];TCompletionProposalForm.FFontHeight:Integer
 0052B275    imul        dword ptr [ebp-4]
 0052B278    push        eax
 0052B279    lea         ecx,[ebp-0C]
 0052B27C    mov         eax,dword ptr [ebx+3B8];TCompletionProposalForm.Scroll:TScrollBar
 0052B282    mov         edx,dword ptr [eax+274];TScrollBar.FPosition:Integer
 0052B288    add         edx,dword ptr [ebp-4]
 0052B28B    mov         eax,dword ptr [ebx+3A8];TCompletionProposalForm.FItemList:TStrings
 0052B291    mov         edi,dword ptr [eax]
 0052B293    call        dword ptr [edi+0C];TStrings.Get
 0052B296    mov         eax,dword ptr [ebp-0C]
 0052B299    push        eax
 0052B29A    mov         eax,esi
 0052B29C    call        TBitmap.GetCanvas
 0052B2A1    mov         ecx,eax
 0052B2A3    pop         edx
 0052B2A4    mov         eax,dword ptr [ebx+3A4];TCompletionProposalForm.?f3A4:dword
 0052B2AA    call        dword ptr [ebx+3A0];TCompletionProposalForm.FOnPaintItem
 0052B2B0    test        al,al
>0052B2B2    jne         0052B2F0
 0052B2B4    lea         ecx,[ebp-10]
 0052B2B7    mov         eax,dword ptr [ebx+3B8];TCompletionProposalForm.Scroll:TScrollBar
 0052B2BD    mov         edx,dword ptr [eax+274];TScrollBar.FPosition:Integer
 0052B2C3    add         edx,dword ptr [ebp-4]
 0052B2C6    mov         eax,dword ptr [ebx+3A8];TCompletionProposalForm.FItemList:TStrings
 0052B2CC    mov         edi,dword ptr [eax]
 0052B2CE    call        dword ptr [edi+0C];TStrings.Get
 0052B2D1    mov         eax,dword ptr [ebp-10]
 0052B2D4    push        eax
 0052B2D5    mov         eax,esi
 0052B2D7    call        TBitmap.GetCanvas
 0052B2DC    mov         ecx,dword ptr [ebx+3B4];TCompletionProposalForm.FFontHeight:Integer
 0052B2E2    imul        ecx,dword ptr [ebp-4]
 0052B2E6    xor         edx,edx
 0052B2E8    mov         edi,dword ptr [eax]
 0052B2EA    call        dword ptr [edi+90];TCanvas.TextOut
 0052B2F0    inc         dword ptr [ebp-4]
 0052B2F3    dec         dword ptr [ebp-8]
>0052B2F6    jne         0052B1D2
 0052B2FC    mov         eax,dword ptr [ebx+3D8];TCompletionProposalForm.Bitmap:TBitmap
 0052B302    push        eax
 0052B303    mov         eax,ebx
 0052B305    call        TCustomForm.GetCanvas
 0052B30A    mov         ecx,1
 0052B30F    mov         edx,1
 0052B314    mov         ebx,dword ptr [eax]
 0052B316    call        dword ptr [ebx+44];TCanvas.Draw
 0052B319    xor         eax,eax
 0052B31B    pop         edx
 0052B31C    pop         ecx
 0052B31D    pop         ecx
 0052B31E    mov         dword ptr fs:[eax],edx
 0052B321    push        52B33B
 0052B326    lea         eax,[ebp-10]
 0052B329    mov         edx,2
 0052B32E    call        @UStrArrayClr
 0052B333    ret
>0052B334    jmp         @HandleFinally
>0052B339    jmp         0052B326
 0052B33B    pop         edi
 0052B33C    pop         esi
 0052B33D    pop         ebx
 0052B33E    mov         esp,ebp
 0052B340    pop         ebp
 0052B341    ret
*}
end;

//0052B344
{*procedure sub_0052B344(?:?);
begin
 0052B344    push        ebx
 0052B345    push        esi
 0052B346    mov         ebx,eax
 0052B348    mov         eax,dword ptr [ebx+3B8]
 0052B34E    mov         eax,dword ptr [eax+274]
 0052B354    mov         edx,dword ptr [ebx+3AC]
 0052B35A    cmp         eax,edx
>0052B35C    jle         0052B369
 0052B35E    mov         edx,eax
 0052B360    mov         eax,ebx
 0052B362    call        TCompletionProposalForm.SetPosition
>0052B367    jmp         0052B37F
 0052B369    mov         esi,eax
 0052B36B    add         esi,dword ptr [ebx+3B0]
 0052B371    dec         esi
 0052B372    cmp         edx,esi
>0052B374    jle         0052B37F
 0052B376    mov         edx,esi
 0052B378    mov         eax,ebx
 0052B37A    call        TCompletionProposalForm.SetPosition
 0052B37F    mov         eax,ebx
 0052B381    mov         si,0FFA4
 0052B385    call        @CallDynaInst
 0052B38A    pop         esi
 0052B38B    pop         ebx
 0052B38C    ret
end;*}

//0052B398
procedure sub_0052B398(?:TCompletionProposalForm);
begin
{*
 0052B398    push        ebx
 0052B399    mov         ebx,eax
 0052B39B    mov         eax,dword ptr [ebx+3A8];TCompletionProposalForm.FItemList:TStrings
 0052B3A1    mov         edx,dword ptr [eax]
 0052B3A3    call        dword ptr [edx+14];TStrings.GetCount
 0052B3A6    dec         eax
 0052B3A7    cmp         eax,dword ptr [ebx+3AC];TCompletionProposalForm.FPosition:Integer
>0052B3AD    jle         0052B3BD
 0052B3AF    mov         edx,dword ptr [ebx+3AC];TCompletionProposalForm.FPosition:Integer
 0052B3B5    inc         edx
 0052B3B6    mov         eax,ebx
 0052B3B8    call        TCompletionProposalForm.SetPosition
 0052B3BD    pop         ebx
 0052B3BE    ret
*}
end;

//0052B3C0
procedure sub_0052B3C0(?:TCompletionProposalForm);
begin
{*
 0052B3C0    mov         edx,dword ptr [eax+3AC];TCompletionProposalForm.FPosition:Integer
 0052B3C6    test        edx,edx
>0052B3C8    jle         0052B3D0
 0052B3CA    dec         edx
 0052B3CB    call        TCompletionProposalForm.SetPosition
 0052B3D0    ret
*}
end;

//0052B3D4
procedure TCompletionProposalForm.SetCurrentString(Value:string);
begin
{*
 0052B3D4    push        ebp
 0052B3D5    mov         ebp,esp
 0052B3D7    xor         ecx,ecx
 0052B3D9    push        ecx
 0052B3DA    push        ecx
 0052B3DB    push        ecx
 0052B3DC    push        ecx
 0052B3DD    push        ecx
 0052B3DE    push        ebx
 0052B3DF    push        esi
 0052B3E0    push        edi
 0052B3E1    mov         esi,edx
 0052B3E3    mov         ebx,eax
 0052B3E5    xor         eax,eax
 0052B3E7    push        ebp
 0052B3E8    push        52B50D
 0052B3ED    push        dword ptr fs:[eax]
 0052B3F0    mov         dword ptr fs:[eax],esp
 0052B3F3    lea         eax,[ebx+388];TCompletionProposalForm.FCurrentString:string
 0052B3F9    mov         edx,esi
 0052B3FB    call        @UStrAsg
 0052B400    cmp         byte ptr [ebx+3D4],0;TCompletionProposalForm.FAnsi:Boolean
>0052B407    je          0052B47A
 0052B409    mov         eax,dword ptr [ebx+3A8];TCompletionProposalForm.FItemList:TStrings
 0052B40F    mov         edx,dword ptr [eax]
 0052B411    call        dword ptr [edx+14];TStrings.GetCount
 0052B414    dec         eax
 0052B415    test        eax,eax
>0052B417    jl          0052B4E5
 0052B41D    inc         eax
 0052B41E    mov         dword ptr [ebp-0C],eax
 0052B421    xor         esi,esi
 0052B423    lea         ecx,[ebp-4]
 0052B426    mov         edx,esi
 0052B428    mov         eax,dword ptr [ebx+3A8];TCompletionProposalForm.FItemList:TStrings
 0052B42E    mov         edi,dword ptr [eax]
 0052B430    call        dword ptr [edi+0C];TStrings.Get
 0052B433    mov         edi,dword ptr [ebx+388];TCompletionProposalForm.FCurrentString:string
 0052B439    test        edi,edi
>0052B43B    je          0052B442
 0052B43D    sub         edi,4
 0052B440    mov         edi,dword ptr [edi]
 0052B442    lea         eax,[ebp-10]
 0052B445    push        eax
 0052B446    mov         ecx,edi
 0052B448    mov         edx,1
 0052B44D    mov         eax,dword ptr [ebp-4]
 0052B450    call        @UStrCopy
 0052B455    mov         edx,dword ptr [ebp-10]
 0052B458    mov         eax,dword ptr [ebx+388];TCompletionProposalForm.FCurrentString:string
 0052B45E    call        CompareText
 0052B463    test        eax,eax
>0052B465    jne         0052B472
 0052B467    mov         edx,esi
 0052B469    mov         eax,ebx
 0052B46B    call        TCompletionProposalForm.SetPosition
>0052B470    jmp         0052B4E5
 0052B472    inc         esi
 0052B473    dec         dword ptr [ebp-0C]
>0052B476    jne         0052B423
>0052B478    jmp         0052B4E5
 0052B47A    mov         eax,dword ptr [ebx+3A8];TCompletionProposalForm.FItemList:TStrings
 0052B480    mov         edx,dword ptr [eax]
 0052B482    call        dword ptr [edx+14];TStrings.GetCount
 0052B485    dec         eax
 0052B486    test        eax,eax
>0052B488    jl          0052B4E5
 0052B48A    inc         eax
 0052B48B    mov         dword ptr [ebp-0C],eax
 0052B48E    xor         esi,esi
 0052B490    lea         ecx,[ebp-8]
 0052B493    mov         edx,esi
 0052B495    mov         eax,dword ptr [ebx+3A8];TCompletionProposalForm.FItemList:TStrings
 0052B49B    mov         edi,dword ptr [eax]
 0052B49D    call        dword ptr [edi+0C];TStrings.Get
 0052B4A0    mov         edi,dword ptr [ebx+388];TCompletionProposalForm.FCurrentString:string
 0052B4A6    test        edi,edi
>0052B4A8    je          0052B4AF
 0052B4AA    sub         edi,4
 0052B4AD    mov         edi,dword ptr [edi]
 0052B4AF    lea         eax,[ebp-14]
 0052B4B2    push        eax
 0052B4B3    mov         ecx,edi
 0052B4B5    mov         edx,1
 0052B4BA    mov         eax,dword ptr [ebp-8]
 0052B4BD    call        @UStrCopy
 0052B4C2    mov         edx,dword ptr [ebp-14]
 0052B4C5    mov         eax,dword ptr [ebx+388];TCompletionProposalForm.FCurrentString:string
 0052B4CB    call        CompareStr
 0052B4D0    test        eax,eax
>0052B4D2    jne         0052B4DF
 0052B4D4    mov         edx,esi
 0052B4D6    mov         eax,ebx
 0052B4D8    call        TCompletionProposalForm.SetPosition
>0052B4DD    jmp         0052B4E5
 0052B4DF    inc         esi
 0052B4E0    dec         dword ptr [ebp-0C]
>0052B4E3    jne         0052B490
 0052B4E5    xor         eax,eax
 0052B4E7    pop         edx
 0052B4E8    pop         ecx
 0052B4E9    pop         ecx
 0052B4EA    mov         dword ptr fs:[eax],edx
 0052B4ED    push        52B514
 0052B4F2    lea         eax,[ebp-14]
 0052B4F5    mov         edx,2
 0052B4FA    call        @UStrArrayClr
 0052B4FF    lea         eax,[ebp-8]
 0052B502    mov         edx,2
 0052B507    call        @UStrArrayClr
 0052B50C    ret
>0052B50D    jmp         @HandleFinally
>0052B512    jmp         0052B4F2
 0052B514    pop         edi
 0052B515    pop         esi
 0052B516    pop         ebx
 0052B517    mov         esp,ebp
 0052B519    pop         ebp
 0052B51A    ret
*}
end;

//0052B51C
procedure TCompletionProposalForm.SetItemList(Value:TStrings);
begin
{*
 0052B51C    push        esi
 0052B51D    push        edi
 0052B51E    mov         edi,edx
 0052B520    mov         esi,eax
 0052B522    mov         edx,edi
 0052B524    mov         eax,dword ptr [esi+3A8];TCompletionProposalForm.FItemList:TStrings
 0052B52A    mov         ecx,dword ptr [eax]
 0052B52C    call        dword ptr [ecx+8];TStrings.Assign
 0052B52F    pop         edi
 0052B530    pop         esi
 0052B531    ret
*}
end;

//0052B534
procedure TCompletionProposalForm.SetNbLinesInWindow(Value:Integer);
begin
{*
 0052B534    push        ebx
 0052B535    mov         ebx,eax
 0052B537    mov         eax,edx
 0052B539    mov         dword ptr [ebx+3B0],eax;TCompletionProposalForm.FNbLinesInWindow:Integer
 0052B53F    mov         edx,dword ptr [ebx+3B4];TCompletionProposalForm.FFontHeight:Integer
 0052B545    imul        edx,eax
 0052B548    add         edx,2
 0052B54B    mov         eax,ebx
 0052B54D    call        TControl.SetHeight
 0052B552    mov         edx,2
 0052B557    mov         eax,dword ptr [ebx+3B8];TCompletionProposalForm.Scroll:TScrollBar
 0052B55D    call        TControl.SetTop
 0052B562    mov         eax,ebx
 0052B564    call        TControl.GetClientWidth
 0052B569    mov         edx,eax
 0052B56B    mov         eax,dword ptr [ebx+3B8];TCompletionProposalForm.Scroll:TScrollBar
 0052B571    sub         edx,dword ptr [eax+48]
 0052B574    sub         edx,2
 0052B577    mov         eax,dword ptr [ebx+3B8];TCompletionProposalForm.Scroll:TScrollBar
 0052B57D    call        TControl.SetLeft
 0052B582    mov         edx,dword ptr [ebx+4C];TCompletionProposalForm.FHeight:Integer
 0052B585    sub         edx,4
 0052B588    mov         eax,dword ptr [ebx+3B8];TCompletionProposalForm.Scroll:TScrollBar
 0052B58E    call        TControl.SetHeight
 0052B593    mov         eax,dword ptr [ebx+3B8];TCompletionProposalForm.Scroll:TScrollBar
 0052B599    mov         edx,dword ptr [eax+40];TScrollBar.FLeft:Integer
 0052B59C    sub         edx,2
 0052B59F    mov         eax,dword ptr [ebx+3D8];TCompletionProposalForm.Bitmap:TBitmap
 0052B5A5    mov         ecx,dword ptr [eax]
 0052B5A7    call        dword ptr [ecx+44];TBitmap.SetWidth
 0052B5AA    mov         edx,dword ptr [ebx+4C];TCompletionProposalForm.FHeight:Integer
 0052B5AD    sub         edx,2
 0052B5B0    mov         eax,dword ptr [ebx+3D8];TCompletionProposalForm.Bitmap:TBitmap
 0052B5B6    mov         ecx,dword ptr [eax]
 0052B5B8    call        dword ptr [ecx+38];TBitmap.SetHeight
 0052B5BB    pop         ebx
 0052B5BC    ret
*}
end;

//0052B5C0
{*function TCompletionProposalForm.SetPosition(Value:Integer):?;
begin
 0052B5C0    push        ebx
 0052B5C1    push        esi
 0052B5C2    push        edi
 0052B5C3    mov         esi,edx
 0052B5C5    mov         ebx,eax
 0052B5C7    mov         eax,dword ptr [ebx+3A8];TCompletionProposalForm.FItemList:TStrings
 0052B5CD    mov         edx,dword ptr [eax]
 0052B5CF    call        dword ptr [edx+14];TStrings.GetCount
 0052B5D2    dec         eax
 0052B5D3    cmp         esi,eax
>0052B5D5    jg          0052B61E
 0052B5D7    cmp         esi,dword ptr [ebx+3AC];TCompletionProposalForm.FPosition:Integer
>0052B5DD    je          0052B61E
 0052B5DF    mov         eax,esi
 0052B5E1    mov         dword ptr [ebx+3AC],eax;TCompletionProposalForm.FPosition:Integer
 0052B5E7    mov         edx,dword ptr [ebx+3B8];TCompletionProposalForm.Scroll:TScrollBar
 0052B5ED    mov         esi,dword ptr [edx+274];TScrollBar.FPosition:Integer
 0052B5F3    cmp         eax,esi
>0052B5F5    jge         0052B5FF
 0052B5F7    xchg        eax,edx
 0052B5F8    call        TScrollBar.SetPosition
>0052B5FD    jmp         0052B614
 0052B5FF    mov         edi,eax
 0052B601    sub         edi,dword ptr [ebx+3B0]
 0052B607    inc         edi
 0052B608    cmp         esi,edi
>0052B60A    jge         0052B614
 0052B60C    mov         eax,edi
 0052B60E    xchg        eax,edx
 0052B60F    call        TScrollBar.SetPosition
 0052B614    mov         eax,ebx
 0052B616    mov         edx,dword ptr [eax]
 0052B618    call        dword ptr [edx+90];TWinControl.Invalidate
 0052B61E    pop         edi
 0052B61F    pop         esi
 0052B620    pop         ebx
 0052B621    ret
end;*}

//0052B624
{*procedure sub_0052B624(?:?);
begin
 0052B624    push        ebx
 0052B625    mov         ebx,eax
 0052B627    mov         eax,dword ptr [ebx+3A8]
 0052B62D    mov         edx,dword ptr [eax]
 0052B62F    call        dword ptr [edx+14]
 0052B632    sub         eax,dword ptr [ebx+3B0]
>0052B638    jns         0052B649
 0052B63A    xor         edx,edx
 0052B63C    mov         eax,dword ptr [ebx+3B8]
 0052B642    call        TScrollBar.SetMax
>0052B647    jmp         0052B667
 0052B649    mov         eax,dword ptr [ebx+3A8]
 0052B64F    mov         edx,dword ptr [eax]
 0052B651    call        dword ptr [edx+14]
 0052B654    mov         edx,eax
 0052B656    sub         edx,dword ptr [ebx+3B0]
 0052B65C    mov         eax,dword ptr [ebx+3B8]
 0052B662    call        TScrollBar.SetMax
 0052B667    mov         edx,dword ptr [ebx+3AC]
 0052B66D    mov         eax,ebx
 0052B66F    call        TCompletionProposalForm.SetPosition
 0052B674    pop         ebx
 0052B675    ret
end;*}

//0052B678
constructor TCompletionProposal.Create(Aowner:TComponent);
begin
{*
 0052B678    push        ebx
 0052B679    push        esi
 0052B67A    test        dl,dl
>0052B67C    je          0052B686
 0052B67E    add         esp,0FFFFFFF0
 0052B681    call        @ClassCreate
 0052B686    mov         ebx,edx
 0052B688    mov         esi,eax
 0052B68A    xor         edx,edx
 0052B68C    mov         eax,esi
 0052B68E    call        TComponent.Create
 0052B693    mov         ecx,esi
 0052B695    mov         dl,1
 0052B697    mov         eax,[00529E04];TCompletionProposalForm
 0052B69C    call        TCompletionProposalForm.Create;TCompletionProposalForm.Create
 0052B6A1    mov         dword ptr [esi+34],eax;TCompletionProposal.Form:TCompletionProposalForm
 0052B6A4    mov         eax,esi
 0052B6A6    test        bl,bl
>0052B6A8    je          0052B6B9
 0052B6AA    call        @AfterConstruction
 0052B6AF    pop         dword ptr fs:[0]
 0052B6B6    add         esp,0C
 0052B6B9    mov         eax,esi
 0052B6BB    pop         esi
 0052B6BC    pop         ebx
 0052B6BD    ret
*}
end;

//0052B6C0
destructor TCompletionProposal.Destroy();
begin
{*
 0052B6C0    push        ebx
 0052B6C1    push        esi
 0052B6C2    call        @BeforeDestruction
 0052B6C7    mov         ebx,edx
 0052B6C9    mov         esi,eax
 0052B6CB    mov         eax,dword ptr [esi+34];TCompletionProposal.Form:TCompletionProposalForm
 0052B6CE    call        TObject.Free
 0052B6D3    mov         edx,ebx
 0052B6D5    and         dl,0FC
 0052B6D8    mov         eax,esi
 0052B6DA    call        TComponent.Destroy
 0052B6DF    test        bl,bl
>0052B6E1    jle         0052B6EA
 0052B6E3    mov         eax,esi
 0052B6E5    call        @ClassDestroy
 0052B6EA    pop         esi
 0052B6EB    pop         ebx
 0052B6EC    ret
*}
end;

//0052B6F0
procedure TCompletionProposal.Execute(s:string; x:Integer; y:Integer);
begin
{*
 0052B6F0    push        ebp
 0052B6F1    mov         ebp,esp
 0052B6F3    push        ecx
 0052B6F4    push        ebx
 0052B6F5    push        esi
 0052B6F6    mov         esi,ecx
 0052B6F8    mov         dword ptr [ebp-4],edx
 0052B6FB    mov         ebx,eax
 0052B6FD    mov         eax,dword ptr [ebp-4]
 0052B700    call        @UStrAddRef
 0052B705    xor         eax,eax
 0052B707    push        ebp
 0052B708    push        52B75F
 0052B70D    push        dword ptr fs:[eax]
 0052B710    mov         dword ptr fs:[eax],esp
 0052B713    mov         edx,dword ptr [ebp+8]
 0052B716    mov         eax,dword ptr [ebx+34];TCompletionProposal.Form:TCompletionProposalForm
 0052B719    call        TCustomForm.SetTop
 0052B71E    mov         edx,esi
 0052B720    mov         eax,dword ptr [ebx+34];TCompletionProposal.Form:TCompletionProposalForm
 0052B723    call        TCustomForm.SetLeft
 0052B728    mov         edx,dword ptr [ebp-4]
 0052B72B    mov         eax,ebx
 0052B72D    call        0052B810
 0052B732    cmp         word ptr [ebx+3A],0;TCompletionProposal.?f3A:word
>0052B737    je          0052B741
 0052B739    mov         edx,ebx
 0052B73B    mov         eax,dword ptr [ebx+3C];TCompletionProposal.?f3C:dword
 0052B73E    call        dword ptr [ebx+38];TCompletionProposal.FOnExecute
 0052B741    mov         eax,dword ptr [ebx+34];TCompletionProposal.Form:TCompletionProposalForm
 0052B744    call        TCustomForm.Show
 0052B749    xor         eax,eax
 0052B74B    pop         edx
 0052B74C    pop         ecx
 0052B74D    pop         ecx
 0052B74E    mov         dword ptr fs:[eax],edx
 0052B751    push        52B766
 0052B756    lea         eax,[ebp-4]
 0052B759    call        @UStrClr
 0052B75E    ret
>0052B75F    jmp         @HandleFinally
>0052B764    jmp         0052B756
 0052B766    pop         esi
 0052B767    pop         ebx
 0052B768    pop         ecx
 0052B769    pop         ebp
 0052B76A    ret         4
*}
end;

//0052B78C
{*function TCompletionProposal.GetItemList:?;
begin
 0052B78C    mov         eax,dword ptr [eax+34];TCompletionProposal.Form:TCompletionProposalForm
 0052B78F    mov         eax,dword ptr [eax+3A8];TCompletionProposalForm.FItemList:TStrings
 0052B795    ret
end;*}

//0052B798
{*function TCompletionProposal.GetNbLinesInWindow:?;
begin
 0052B798    mov         eax,dword ptr [eax+34];TCompletionProposal.Form:TCompletionProposalForm
 0052B79B    mov         eax,dword ptr [eax+3B0];TCompletionProposalForm.FNbLinesInWindow:Integer
 0052B7A1    ret
end;*}

//0052B7D4
{*procedure TCompletionProposal.GetOnPaintItem(?:?);
begin
 0052B7D4    mov         eax,dword ptr [eax+34];TCompletionProposal.Form:TCompletionProposalForm
 0052B7D7    mov         ecx,dword ptr [eax+3A0];TCompletionProposalForm.FOnPaintItem:TCompletionProposalPaintIte...
 0052B7DD    mov         dword ptr [edx],ecx
 0052B7DF    mov         ecx,dword ptr [eax+3A4];TCompletionProposalForm.?f3A4:dword
 0052B7E5    mov         dword ptr [edx+4],ecx
 0052B7E8    ret
end;*}

//0052B804
{*function TCompletionProposal.GetPosition:?;
begin
 0052B804    mov         eax,dword ptr [eax+34];TCompletionProposal.Form:TCompletionProposalForm
 0052B807    mov         eax,dword ptr [eax+3AC];TCompletionProposalForm.FPosition:Integer
 0052B80D    ret
end;*}

//0052B810
procedure sub_0052B810(?:TCompletionProposal);
begin
{*
 0052B810    mov         eax,dword ptr [eax+34];TCompletionProposal.Form:TCompletionProposalForm
 0052B813    call        TCompletionProposalForm.SetCurrentString
 0052B818    ret
*}
end;

//0052B81C
procedure TCompletionProposal.SetItemList(Value:TStrings);
begin
{*
 0052B81C    mov         eax,dword ptr [eax+34];TCompletionProposal.Form:TCompletionProposalForm
 0052B81F    call        TCompletionProposalForm.SetItemList
 0052B824    ret
*}
end;

//0052B828
procedure TCompletionProposal.SetNbLinesInWindow(Value:Integer);
begin
{*
 0052B828    mov         eax,dword ptr [eax+34];TCompletionProposal.Form:TCompletionProposalForm
 0052B82B    call        TCompletionProposalForm.SetNbLinesInWindow
 0052B830    ret
*}
end;

//0052B86C
{*procedure TCompletionProposal.SetOnPaintItem(Value:TCompletionProposalPaintItem; ?:?; ?:?);
begin
 0052B86C    push        ebp
 0052B86D    mov         ebp,esp
 0052B86F    mov         eax,dword ptr [eax+34];TCompletionProposal.Form:TCompletionProposalForm
 0052B872    mov         edx,dword ptr [ebp+8]
 0052B875    mov         dword ptr [eax+3A0],edx;TCompletionProposalForm.FOnPaintItem:TCompletionProposalPaintIte...
 0052B87B    mov         edx,dword ptr [ebp+0C]
 0052B87E    mov         dword ptr [eax+3A4],edx;TCompletionProposalForm.?f3A4:dword
 0052B884    pop         ebp
 0052B885    ret         8
end;*}

//0052B888
procedure TCompletionProposal.SetPosition(Value:Integer);
begin
{*
 0052B888    mov         eax,dword ptr [eax+34];TCompletionProposal.Form:TCompletionProposalForm
 0052B88B    call        TCompletionProposalForm.SetPosition
 0052B890    ret
*}
end;

//0052B8B0
{*function TCompletionProposal.GetClSelect:?;
begin
 0052B8B0    mov         eax,dword ptr [eax+34];TCompletionProposal.Form:TCompletionProposalForm
 0052B8B3    mov         eax,dword ptr [eax+3D0];TCompletionProposalForm.FClSelect:TColor
 0052B8B9    ret
end;*}

//0052B8BC
procedure TCompletionProposal.SetClSelect(Value:TColor);
begin
{*
 0052B8BC    mov         eax,dword ptr [eax+34];TCompletionProposal.Form:TCompletionProposalForm
 0052B8BF    mov         dword ptr [eax+3D0],edx;TCompletionProposalForm.FClSelect:TColor
 0052B8C5    ret
*}
end;

//0052B8FC
procedure TCompletionProposal.SetAnsiStrings(Value:Boolean);
begin
{*
 0052B8FC    mov         eax,dword ptr [eax+34];TCompletionProposal.Form:TCompletionProposalForm
 0052B8FF    mov         byte ptr [eax+3D4],dl;TCompletionProposalForm.FAnsi:Boolean
 0052B905    ret
*}
end;

//0052B908
{*function TCompletionProposal.GetAnsiStrings:?;
begin
 0052B908    mov         eax,dword ptr [eax+34];TCompletionProposal.Form:TCompletionProposalForm
 0052B90B    movzx       eax,byte ptr [eax+3D4];TCompletionProposalForm.FAnsi:Boolean
 0052B912    ret
end;*}

//0052B914
{*procedure sub_0052B914(?:?; ?:?);
begin
 0052B914    push        ebx
 0052B915    push        esi
 0052B916    mov         ebx,edx
 0052B918    mov         eax,ebx
 0052B91A    mov         edx,dword ptr ds:[529E04];TCompletionProposalForm
 0052B920    call        @AsClass
 0052B925    mov         esi,dword ptr [eax+3DC];TCompletionProposalForm.fCurrentEditor:TComponent
 0052B92B    test        esi,esi
>0052B92D    je          0052B959
 0052B92F    push        0
 0052B931    mov         eax,ebx
 0052B933    mov         edx,dword ptr ds:[529E04];TCompletionProposalForm
 0052B939    call        @AsClass
 0052B93E    mov         eax,esi
 0052B940    mov         edx,dword ptr ds:[5192F0];TmwCustomEdit
 0052B946    call        @AsClass
 0052B94B    xor         ecx,ecx
 0052B94D    mov         dx,191
 0052B951    mov         ebx,dword ptr [eax]
 0052B953    call        dword ptr [ebx+11C];TmwCustomEdit.CommandProcessor
 0052B959    pop         esi
 0052B95A    pop         ebx
 0052B95B    ret
end;*}

//0052B95C
{*procedure sub_0052B95C(?:?; ?:?);
begin
 0052B95C    push        ebx
 0052B95D    push        esi
 0052B95E    push        edi
 0052B95F    push        ebp
 0052B960    mov         ebx,edx
 0052B962    mov         eax,ebx
 0052B964    mov         edx,dword ptr ds:[529E04];TCompletionProposalForm
 0052B96A    call        @AsClass
 0052B96F    mov         edi,eax
 0052B971    mov         esi,dword ptr [edi+3DC];TCompletionProposalForm.fCurrentEditor:TComponent
 0052B977    test        esi,esi
>0052B979    je          0052B9F7
 0052B97B    mov         eax,ebx
 0052B97D    mov         edx,dword ptr ds:[529E04];TCompletionProposalForm
 0052B983    call        @AsClass
 0052B988    mov         eax,esi
 0052B98A    mov         edx,dword ptr ds:[5192F0];TmwCustomEdit
 0052B990    call        @AsClass
 0052B995    mov         ebp,dword ptr [eax+4];TmwCustomEdit.FOwner:TComponent
 0052B998    mov         eax,ebp
 0052B99A    mov         edx,dword ptr ds:[47C4E8];TWinControl
 0052B9A0    call        @IsClass
 0052B9A5    test        al,al
>0052B9A7    je          0052B9D1
 0052B9A9    mov         eax,ebx
 0052B9AB    mov         edx,dword ptr ds:[529E04];TCompletionProposalForm
 0052B9B1    call        @AsClass
 0052B9B6    mov         eax,dword ptr [eax+3DC];TCompletionProposalForm.fCurrentEditor:TComponent
 0052B9BC    mov         edx,dword ptr ds:[5192F0];TmwCustomEdit
 0052B9C2    call        @AsClass
 0052B9C7    mov         eax,ebp
 0052B9C9    mov         edx,dword ptr [eax]
 0052B9CB    call        dword ptr [edx+0E8]
 0052B9D1    mov         eax,ebx
 0052B9D3    mov         edx,dword ptr ds:[529E04];TCompletionProposalForm
 0052B9D9    call        @AsClass
 0052B9DE    mov         eax,dword ptr [edi+3DC];TCompletionProposalForm.fCurrentEditor:TComponent
 0052B9E4    mov         edx,dword ptr ds:[5192F0];TmwCustomEdit
 0052B9EA    call        @AsClass
 0052B9EF    mov         edx,dword ptr [eax]
 0052B9F1    call        dword ptr [edx+0E8];TWinControl.SetFocus
 0052B9F7    pop         ebp
 0052B9F8    pop         edi
 0052B9F9    pop         esi
 0052B9FA    pop         ebx
 0052B9FB    ret
end;*}

//0052BBE0
{*procedure sub_0052BBE0(?:?; ?:?; ?:?);
begin
 0052BBE0    push        ebx
 0052BBE1    push        esi
 0052BBE2    push        edi
 0052BBE3    mov         edi,ecx
 0052BBE5    mov         ebx,edx
 0052BBE7    mov         eax,ebx
 0052BBE9    mov         edx,dword ptr ds:[529E04];TCompletionProposalForm
 0052BBEF    call        @AsClass
 0052BBF4    mov         esi,dword ptr [eax+3DC];TCompletionProposalForm.fCurrentEditor:TComponent
 0052BBFA    test        esi,esi
>0052BBFC    je          0052BC29
 0052BBFE    mov         eax,ebx
 0052BC00    mov         edx,dword ptr ds:[529E04];TCompletionProposalForm
 0052BC06    call        @AsClass
 0052BC0B    mov         eax,esi
 0052BC0D    mov         edx,dword ptr ds:[5192F0];TmwCustomEdit
 0052BC13    call        @AsClass
 0052BC18    push        0
 0052BC1A    movzx       ecx,word ptr [edi]
 0052BC1D    mov         dx,19B
 0052BC21    mov         ebx,dword ptr [eax]
 0052BC23    call        dword ptr [ebx+11C];TmwCustomEdit.CommandProcessor
 0052BC29    pop         edi
 0052BC2A    pop         esi
 0052BC2B    pop         ebx
 0052BC2C    ret
end;*}

//0052BC30
procedure TMwCompletionProposal.SetEditor(Value:TmwCustomEdit);
begin
{*
 0052BC30    call        TMwCompletionProposal.AddEditor
 0052BC35    ret
*}
end;

//0052BC38
procedure TMwCompletionProposal.Notification(AComponent:TComponent; Operation:TOperation);
begin
{*
 0052BC38    push        ebx
 0052BC39    push        esi
 0052BC3A    push        edi
 0052BC3B    mov         ebx,ecx
 0052BC3D    mov         esi,edx
 0052BC3F    mov         edi,eax
 0052BC41    mov         ecx,ebx
 0052BC43    mov         edx,esi
 0052BC45    mov         eax,edi
 0052BC47    call        TComponent.Notification
 0052BC4C    cmp         bl,1
>0052BC4F    jne         0052BC74
 0052BC51    mov         edx,esi
 0052BC53    mov         eax,dword ptr [edi+44];TMwCompletionProposal.fEditors:TList
 0052BC56    call        TList.IndexOf
 0052BC5B    inc         eax
>0052BC5C    je          0052BC74
 0052BC5E    mov         eax,esi
 0052BC60    mov         edx,dword ptr ds:[5192F0];TmwCustomEdit
 0052BC66    call        @AsClass
 0052BC6B    mov         edx,eax
 0052BC6D    mov         eax,edi
 0052BC6F    call        TMwCompletionProposal.RemoveEditor
 0052BC74    pop         edi
 0052BC75    pop         esi
 0052BC76    pop         ebx
 0052BC77    ret
*}
end;

//0052BC78
constructor TMwCompletionProposal.Create(AOwner:TComponent);
begin
{*
 0052BC78    push        ebp
 0052BC79    mov         ebp,esp
 0052BC7B    push        ecx
 0052BC7C    push        ebx
 0052BC7D    test        dl,dl
>0052BC7F    je          0052BC89
 0052BC81    add         esp,0FFFFFFF0
 0052BC84    call        @ClassCreate
 0052BC89    mov         byte ptr [ebp-1],dl
 0052BC8C    mov         ebx,eax
 0052BC8E    xor         edx,edx
 0052BC90    mov         eax,ebx
 0052BC92    call        TCompletionProposal.Create
 0052BC97    mov         eax,dword ptr [ebx+34];TMwCompletionProposal.Form:TCompletionProposalForm
 0052BC9A    mov         dword ptr [eax+394],ebx;TCompletionProposalForm.?f394:TMwCompletionProposal
 0052BCA0    mov         dword ptr [eax+390],52BBE0;TCompletionProposalForm.FOnKeyPress:TKeyPressEvent sub_0052BB...
 0052BCAA    mov         dword ptr [eax+39C],ebx;TCompletionProposalForm.?f39C:TMwCompletionProposal
 0052BCB0    mov         dword ptr [eax+398],52B914;TCompletionProposalForm.FOnKeyDelete:TNotifyEvent sub_0052B91...
 0052BCBA    mov         dword ptr [eax+3C4],ebx;TCompletionProposalForm.?f3C4:TMwCompletionProposal
 0052BCC0    mov         dword ptr [eax+3C0],52B9FC;TCompletionProposalForm.FOnValidate:TNotifyEvent
 0052BCCA    mov         dword ptr [eax+3CC],ebx;TCompletionProposalForm.?f3CC:TMwCompletionProposal
 0052BCD0    mov         dword ptr [eax+3C8],52B95C;TCompletionProposalForm.FOnCancel:TNotifyEvent sub_0052B95C
 0052BCDA    lea         eax,[ebx+4C];TMwCompletionProposal.FEndOfTokenChr:string
 0052BCDD    mov         edx,52BD44;'()[].'
 0052BCE2    call        @UStrAsg
 0052BCE7    mov         dl,1
 0052BCE9    mov         eax,[00439644];TList
 0052BCEE    call        TObject.Create;TList.Create
 0052BCF3    mov         dword ptr [ebx+44],eax;TMwCompletionProposal.fEditors:TList
 0052BCF6    mov         dl,1
 0052BCF8    mov         eax,[00439644];TList
 0052BCFD    call        TObject.Create;TList.Create
 0052BD02    mov         dword ptr [ebx+48],eax;TMwCompletionProposal.fEditstuffs:TList
 0052BD05    movzx       edx,word ptr ds:[52BD50];0x4 gvar_0052BD50
 0052BD0C    mov         ax,20
 0052BD10    call        ShortCut
 0052BD15    mov         word ptr [ebx+40],ax;TMwCompletionProposal.FShortCut:TShortCut
 0052BD19    mov         eax,ebx
 0052BD1B    cmp         byte ptr [ebp-1],0
>0052BD1F    je          0052BD30
 0052BD21    call        @AfterConstruction
 0052BD26    pop         dword ptr fs:[0]
 0052BD2D    add         esp,0C
 0052BD30    mov         eax,ebx
 0052BD32    pop         ebx
 0052BD33    pop         ecx
 0052BD34    pop         ebp
 0052BD35    ret
*}
end;

//0052BD54
procedure TMwCompletionProposal.SetShortCut(Value:TShortCut);
begin
{*
 0052BD54    mov         word ptr [eax+40],dx;TMwCompletionProposal.FShortCut:TShortCut
 0052BD58    ret
*}
end;

//0052BF94
{*procedure sub_0052BF94(?:?; ?:?; ?:?);
begin
 0052BF94    push        ebx
 0052BF95    push        esi
 0052BF96    push        edi
 0052BF97    push        ebp
 0052BF98    mov         ebp,ecx
 0052BF9A    mov         edi,edx
 0052BF9C    mov         ebx,eax
 0052BF9E    mov         edx,edi
 0052BFA0    mov         eax,dword ptr [ebx+44]
 0052BFA3    call        TList.IndexOf
 0052BFA8    mov         esi,eax
 0052BFAA    cmp         esi,0FFFFFFFF
>0052BFAD    je          0052BFF9
 0052BFAF    mov         edx,esi
 0052BFB1    mov         eax,dword ptr [ebx+48]
 0052BFB4    call        TList.Get
 0052BFB9    cmp         byte ptr [eax+10],0
>0052BFBD    je          0052BFD3
 0052BFBF    mov         word ptr [ebp],0
 0052BFC5    mov         edx,esi
 0052BFC7    mov         eax,dword ptr [ebx+48]
 0052BFCA    call        TList.Get
 0052BFCF    mov         byte ptr [eax+10],0
 0052BFD3    mov         edx,esi
 0052BFD5    mov         eax,dword ptr [ebx+48]
 0052BFD8    call        TList.Get
 0052BFDD    cmp         word ptr [eax+2],0
>0052BFE2    je          0052BFF9
 0052BFE4    mov         edx,esi
 0052BFE6    mov         eax,dword ptr [ebx+48]
 0052BFE9    call        TList.Get
 0052BFEE    mov         ebx,eax
 0052BFF0    mov         ecx,ebp
 0052BFF2    mov         edx,edi
 0052BFF4    mov         eax,dword ptr [ebx+4]
 0052BFF7    call        dword ptr [ebx]
 0052BFF9    pop         ebp
 0052BFFA    pop         edi
 0052BFFB    pop         esi
 0052BFFC    pop         ebx
 0052BFFD    ret
end;*}

//0052C000
destructor TMwCompletionProposal.Destroy();
begin
{*
 0052C000    push        ebx
 0052C001    push        esi
 0052C002    push        edi
 0052C003    call        @BeforeDestruction
 0052C008    mov         ebx,edx
 0052C00A    mov         edi,eax
>0052C00C    jmp         0052C01E
 0052C00E    mov         eax,esi
 0052C010    call        TList.Last
 0052C015    mov         edx,eax
 0052C017    mov         eax,edi
 0052C019    call        TMwCompletionProposal.RemoveEditor
 0052C01E    mov         esi,dword ptr [edi+44];TMwCompletionProposal.fEditors:TList
 0052C021    cmp         dword ptr [esi+8],0;TList.FCount:Integer
>0052C025    jne         0052C00E
 0052C027    mov         eax,dword ptr [edi+44];TMwCompletionProposal.fEditors:TList
 0052C02A    call        TObject.Free
 0052C02F    mov         eax,dword ptr [edi+48];TMwCompletionProposal.fEditstuffs:TList
 0052C032    call        TObject.Free
 0052C037    mov         edx,ebx
 0052C039    and         dl,0FC
 0052C03C    mov         eax,edi
 0052C03E    call        TCompletionProposal.Destroy
 0052C043    test        bl,bl
>0052C045    jle         0052C04E
 0052C047    mov         eax,edi
 0052C049    call        @ClassDestroy
 0052C04E    pop         edi
 0052C04F    pop         esi
 0052C050    pop         ebx
 0052C051    ret
*}
end;

//0052C054
{*function TMwCompletionProposal.GetEditor:?;
begin
 0052C054    push        ebx
 0052C055    mov         ebx,eax
 0052C057    mov         eax,ebx
 0052C059    call        TMwCompletionProposal.EditorsCount
 0052C05E    test        eax,eax
>0052C060    jle         0052C06D
 0052C062    xor         edx,edx
 0052C064    mov         eax,ebx
 0052C066    call        0052C108
 0052C06B    pop         ebx
 0052C06C    ret
 0052C06D    xor         eax,eax
 0052C06F    pop         ebx
 0052C070    ret
end;*}

//0052C074
procedure TMwCompletionProposal.AddEditor(Editor:TmwCustomEdit);
begin
{*
 0052C074    push        ebx
 0052C075    push        esi
 0052C076    mov         esi,edx
 0052C078    mov         ebx,eax
 0052C07A    mov         edx,esi
 0052C07C    mov         eax,dword ptr [ebx+44];TMwCompletionProposal.fEditors:TList
 0052C07F    call        TList.IndexOf
 0052C084    inc         eax
>0052C085    jne         0052C0FB
 0052C087    mov         edx,esi
 0052C089    mov         eax,dword ptr [ebx+44];TMwCompletionProposal.fEditors:TList
 0052C08C    call        TList.Add
 0052C091    mov         eax,18
 0052C096    call        @GetMem
 0052C09B    mov         edx,dword ptr [esi+220];TmwCustomEdit.FOnKeyPress:TKeyPressEvent
 0052C0A1    mov         dword ptr [eax],edx
 0052C0A3    mov         edx,dword ptr [esi+224];TmwCustomEdit.?f224:TMwCompletionProposal
 0052C0A9    mov         dword ptr [eax+4],edx
 0052C0AC    mov         edx,dword ptr [esi+218];TmwCustomEdit.FOnKeyDown:TKeyEvent
 0052C0B2    mov         dword ptr [eax+8],edx
 0052C0B5    mov         edx,dword ptr [esi+21C];TmwCustomEdit.?f21C:TMwCompletionProposal
 0052C0BB    mov         dword ptr [eax+0C],edx
 0052C0BE    mov         byte ptr [eax+10],0
 0052C0C2    mov         edx,eax
 0052C0C4    mov         eax,dword ptr [ebx+48];TMwCompletionProposal.fEditstuffs:TList
 0052C0C7    call        TList.Add
 0052C0CC    mov         edx,ebx
 0052C0CE    mov         eax,esi
 0052C0D0    call        TComponent.FreeNotification
 0052C0D5    test        byte ptr [ebx+1C],10;TMwCompletionProposal.FComponentState:TComponentState
>0052C0D9    jne         0052C0FB
 0052C0DB    mov         dword ptr [esi+21C],ebx;TmwCustomEdit.?f21C:TMwCompletionProposal
 0052C0E1    mov         dword ptr [esi+218],52BD5C;TmwCustomEdit.FOnKeyDown:TKeyEvent
 0052C0EB    mov         dword ptr [esi+224],ebx;TmwCustomEdit.?f224:TMwCompletionProposal
 0052C0F1    mov         dword ptr [esi+220],52BF94;TmwCustomEdit.FOnKeyPress:TKeyPressEvent sub_0052BF94
 0052C0FB    pop         esi
 0052C0FC    pop         ebx
 0052C0FD    ret
*}
end;

//0052C100
function TMwCompletionProposal.EditorsCount:Integer;
begin
{*
 0052C100    mov         eax,dword ptr [eax+44];TMwCompletionProposal.fEditors:TList
 0052C103    mov         eax,dword ptr [eax+8];TList.FCount:Integer
 0052C106    ret
*}
end;

//0052C108
{*procedure sub_0052C108(?:TMwCompletionProposal; ?:?);
begin
 0052C108    push        ebx
 0052C109    push        esi
 0052C10A    mov         esi,edx
 0052C10C    mov         ebx,eax
 0052C10E    test        esi,esi
>0052C110    jl          0052C11D
 0052C112    mov         eax,ebx
 0052C114    call        TMwCompletionProposal.EditorsCount
 0052C119    cmp         esi,eax
>0052C11B    jl          0052C122
 0052C11D    xor         eax,eax
 0052C11F    pop         esi
 0052C120    pop         ebx
 0052C121    ret
 0052C122    mov         edx,esi
 0052C124    mov         eax,dword ptr [ebx+44];TMwCompletionProposal.fEditors:TList
 0052C127    call        TList.Get
 0052C12C    pop         esi
 0052C12D    pop         ebx
 0052C12E    ret
end;*}

//0052C130
function TMwCompletionProposal.RemoveEditor(Editor:TmwCustomEdit):Boolean;
begin
{*
 0052C130    push        ebx
 0052C131    push        esi
 0052C132    push        edi
 0052C133    mov         edi,eax
 0052C135    xor         ecx,ecx
 0052C137    mov         eax,dword ptr [edi+44];TMwCompletionProposal.fEditors:TList
 0052C13A    call        TList.RemoveItem
 0052C13F    mov         esi,eax
 0052C141    cmp         esi,0FFFFFFFF
 0052C144    setne       bl
 0052C147    test        bl,bl
>0052C149    je          0052C166
 0052C14B    mov         edx,esi
 0052C14D    mov         eax,dword ptr [edi+48];TMwCompletionProposal.fEditstuffs:TList
 0052C150    call        TList.Get
 0052C155    xor         edx,edx
 0052C157    call        @FreeMem
 0052C15C    mov         edx,esi
 0052C15E    mov         eax,dword ptr [edi+48];TMwCompletionProposal.fEditstuffs:TList
 0052C161    call        TList.Delete
 0052C166    mov         eax,ebx
 0052C168    pop         edi
 0052C169    pop         esi
 0052C16A    pop         ebx
 0052C16B    ret
*}
end;

Initialization
//00780E2C
{*
 00780E2C    sub         dword ptr ds:[793B30],1
>00780E33    jae         00780E3F
 00780E35    mov         eax,52D214
 00780E3A    call        @InitResStringImports
 00780E3F    ret
*}
Finalization
//0052D1A4
{*
 0052D1A4    push        ebp
 0052D1A5    mov         ebp,esp
 0052D1A7    xor         eax,eax
 0052D1A9    push        ebp
 0052D1AA    push        52D20A
 0052D1AF    push        dword ptr fs:[eax]
 0052D1B2    mov         dword ptr fs:[eax],esp
 0052D1B5    inc         dword ptr ds:[793B30]
>0052D1BB    jne         0052D1FC
 0052D1BD    mov         eax,786C54;gvar_00786C54:array[20] of ?
 0052D1C2    mov         ecx,14
 0052D1C7    mov         edx,dword ptr ds:[52C500];TDefColorItem
 0052D1CD    call        @FinalizeArray
 0052D1D2    mov         eax,786D44;gvar_00786D44:array[40] of ?
 0052D1D7    mov         ecx,28
 0052D1DC    mov         edx,dword ptr ds:[52C500];TDefColorItem
 0052D1E2    call        @FinalizeArray
 0052D1E7    mov         eax,786F24;gvar_00786F24:array[30] of ?
 0052D1EC    mov         ecx,1E
 0052D1F1    mov         edx,dword ptr ds:[52C500];TDefColorItem
 0052D1F7    call        @FinalizeArray
 0052D1FC    xor         eax,eax
 0052D1FE    pop         edx
 0052D1FF    pop         ecx
 0052D200    pop         ecx
 0052D201    mov         dword ptr fs:[eax],edx
 0052D204    push        52D211
 0052D209    ret
>0052D20A    jmp         @HandleFinally
>0052D20F    jmp         0052D209
 0052D211    pop         ebp
 0052D212    ret
*}
end.