//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit104;

interface

uses
  SysUtils, Classes, TntExtCtrls, PieCursorUnit, TntStdCtrls, DebugWinUnit, PieBase, ExtCtrls, Graphics;

type
  TTntImage = class(TImage)
  end;
  TTntShape = class(TShape)
  end;
  TTntRadioGroup = class(TRadioGroup)
  end;
  TTntPanel = class(TPanel)
  end;
  TCursorForm = class(TTntForm)
  published
    Image1:TTntImage;//f388
    Label1:TTntLabel;//f38C
    Timer1:TTimer;//f390
    function GetY:Integer;//005E79A0
    procedure SetLeftButton(value:Boolean);//005E79B4
    procedure SetRightButton(value:Boolean);//005E8728
    procedure SetX(value:Integer);//005E7934
    procedure SetY(value:Integer);//005E7960
    function GetX:Integer;//005E798C
    procedure ShowMe;//005E8B18
    //procedure SetColour(b:Double; ?:?; g:Double; ?:?; r:Double; ?:?);//005E9718
    //procedure SetWhiteColour(b:Double; ?:?; g:Double; ?:?; r:Double; ?:?);//005E993C
    procedure SetMiddleButton(value:Boolean);//005E8420
    function ConveyMessage(Msg:Cardinal; UsePos:Boolean; LParam:Cardinal; WParam:Cardinal):Cardinal;//005E8A0C
    procedure HideMe;//005E8AD0
    procedure RotateHotspot;//005E9C50
    function getKeysDown:Integer;//005E969C
    procedure WmSysCommand(var Msg:TMessage);//005E8B94
    procedure FormCreate(Sender:TObject);//005E7410
    procedure FormDeactivate(Sender:TObject);//005E8B98
    procedure Timer1Timer(Sender:TObject);//005E8B9C
    procedure SetLeftButton2(value:Boolean);//005E83DC
    procedure ChangeCursor3(FileName:string);//005E6E10
    procedure SetPos(x:Integer; y:Integer; DontCheck:Boolean);//005E7450
    procedure CheckUnderneath;//005E7488
    //procedure ChangeAngle(angle:Double; ?:?);//005E6AD4
    procedure ChangeCursor(idc:PWideChar);//005E7198
    procedure ChangeCursor2(CursorHandle:Cardinal);//005E6BA0
  public
    FXButton1:Boolean;//f394
    FXButton2:Boolean;//f395
    FShift:Boolean;//f396
    FCtrl:Boolean;//f397
    FXButton4:Boolean;//f398
    FXButton3:Boolean;//f399
    FXButton5:Boolean;//f39A
    FDInputZ:Integer;//f39C
    FDInputH:Integer;//f3A0
    FCursorNumber:Integer;//f3A4
    HotSpotX:Integer;//f3A8
    HotSpotY:Integer;//f3AC
    UnrotatedHotSpotX:Integer;//f3B0
    UnrotatedHotSpotY:Integer;//f3B4
    OldCursorHandle:Cardinal;//f3B8
    OldWindowHandle:HWND;//f3BC
    FLeftButton:Boolean;//f3C0
    FMiddleButton:Boolean;//f3C1
    FRightButton:Boolean;//f3C2
    Permanent:Boolean;//f3C3
    MyHiddenX:Integer;//f3C4
    MyHiddenY:Integer;//f3C8
    IsIE:Boolean;//f3CC
    IePos:Cardinal;//f3D0
    JumpOnRelease:Boolean;//f3D4
    JumpX:Integer;//f3D8
    JumpY:Integer;//f3DC
    LastClickTime:Double;//f3E0
    f3E4:dword;//f3E4
    LastClickWindow:HWND;//f3E8
    Roll:Double;//f3F0
    f3F4:dword;//f3F4
    UnrotatedBitmap:TBitmap;//f3F8
    FMyCaption:string;//f3FC
    FMyImage:string;//f400
    FColour:TColor;//f404
    FWhiteColour:TColor;//f408
    procedure CreateParams(var Params:TCreateParams); virtual;//vAC//005E8AAC
    procedure WmSysCommand(var Msg:TMessage); message WM_SYSCOMMAND;//005E8B94
  end;
    procedure sub_005E66D8(?:TBitmap; ?:TColor; ?:TColor);//005E66D8
    //procedure sub_005E6930(?:TBitmap; ?:TBitmap; ?:?; ?:?);//005E6930
    procedure sub_005E8620(?:Pointer; ?:string);//005E8620
    procedure sub_005E86B0(?:TCursorForm; ?:UnicodeString);//005E86B0
    //function sub_005E8928(?:HWND):?;//005E8928
    procedure sub_005E8968;//005E8968
    procedure CreateParams(var Params:TCreateParams);//005E8AAC
    procedure sub_005E8BD4(?:Pointer; ?:Boolean);//005E8BD4
    procedure sub_005E8DFC(?:Pointer; ?:Boolean);//005E8DFC
    procedure sub_005E9024(?:Pointer; ?:Boolean);//005E9024
    procedure sub_005E924C(?:Pointer; ?:Boolean);//005E924C
    procedure sub_005E9474(?:Pointer; ?:Boolean);//005E9474
    //procedure sub_005E9B54(?:Pointer; ?:?);//005E9B54

implementation

{$R *.DFM}

//005E66D8
procedure sub_005E66D8(?:TBitmap; ?:TColor; ?:TColor);
begin
{*
 005E66D8    push        ebx
 005E66D9    push        esi
 005E66DA    push        edi
 005E66DB    add         esp,0FFFFFFC8
 005E66DE    mov         dword ptr [esp+4],edx
 005E66E2    mov         dword ptr [esp],eax
 005E66E5    lea         ebx,[esp+2C]
 005E66E9    cmp         dword ptr [esp+4],0
>005E66EE    je          005E676A
 005E66F0    mov         eax,dword ptr [esp+4]
 005E66F4    and         eax,0FF0000
 005E66F9    shr         eax,10
 005E66FC    mov         dword ptr [esp+10],eax
 005E6700    mov         eax,dword ptr [esp+4]
 005E6704    and         eax,0FF00
 005E6709    shr         eax,8
 005E670C    mov         dword ptr [esp+0C],eax
 005E6710    mov         eax,dword ptr [esp+4]
 005E6714    and         eax,0FF
 005E6719    mov         dword ptr [esp+8],eax
 005E671D    mov         esi,dword ptr [esp+10]
 005E6721    add         esi,dword ptr [esp+0C]
 005E6725    add         esi,dword ptr [esp+8]
 005E6729    mov         eax,dword ptr [esp+10]
 005E672D    lea         eax,[eax+eax*2]
 005E6730    mov         edx,eax
 005E6732    shl         eax,8
 005E6735    sub         eax,edx
 005E6737    cdq
 005E6738    idiv        eax,esi
 005E673A    mov         dword ptr [esp+10],eax
 005E673E    mov         eax,dword ptr [esp+0C]
 005E6742    lea         eax,[eax+eax*2]
 005E6745    mov         edx,eax
 005E6747    shl         eax,8
 005E674A    sub         eax,edx
 005E674C    cdq
 005E674D    idiv        eax,esi
 005E674F    mov         dword ptr [esp+0C],eax
 005E6753    mov         eax,dword ptr [esp+8]
 005E6757    lea         eax,[eax+eax*2]
 005E675A    mov         edx,eax
 005E675C    shl         eax,8
 005E675F    sub         eax,edx
 005E6761    cdq
 005E6762    idiv        eax,esi
 005E6764    mov         dword ptr [esp+8],eax
>005E6768    jmp         005E677C
 005E676A    xor         eax,eax
 005E676C    mov         dword ptr [esp+10],eax
 005E6770    xor         eax,eax
 005E6772    mov         dword ptr [esp+8],eax
 005E6776    xor         eax,eax
 005E6778    mov         dword ptr [esp+0C],eax
 005E677C    mov         eax,ecx
 005E677E    and         eax,0FF0000
 005E6783    shr         eax,10
 005E6786    mov         dword ptr [esp+1C],eax
 005E678A    mov         eax,ecx
 005E678C    and         eax,0FF00
 005E6791    shr         eax,8
 005E6794    mov         dword ptr [esp+18],eax
 005E6798    and         ecx,0FF
 005E679E    mov         dword ptr [esp+14],ecx
 005E67A2    mov         eax,dword ptr [esp]
 005E67A5    mov         edx,dword ptr [eax]
 005E67A7    call        dword ptr [edx+24]
 005E67AA    dec         eax
 005E67AB    test        eax,eax
>005E67AD    jl          005E6927
 005E67B3    inc         eax
 005E67B4    mov         dword ptr [esp+30],eax
 005E67B8    mov         dword ptr [esp+28],0
 005E67C0    mov         edx,dword ptr [esp+28]
 005E67C4    mov         eax,dword ptr [esp]
 005E67C7    call        TBitmap.GetScanline
 005E67CC    mov         dword ptr [esp+20],eax
 005E67D0    mov         eax,dword ptr [esp]
 005E67D3    mov         edx,dword ptr [eax]
 005E67D5    call        dword ptr [edx+30]
 005E67D8    dec         eax
 005E67D9    test        eax,eax
>005E67DB    jl          005E6919
 005E67E1    inc         eax
 005E67E2    mov         dword ptr [esp+34],eax
 005E67E6    mov         dword ptr [esp+24],0
 005E67EE    mov         eax,dword ptr [esp+24]
 005E67F2    lea         eax,[eax+eax*2]
 005E67F5    mov         edx,dword ptr [esp+20]
 005E67F9    mov         cx,word ptr [edx+eax]
 005E67FD    mov         word ptr [ebx],cx
 005E6800    mov         cl,byte ptr [edx+eax+2]
 005E6804    mov         byte ptr [ebx+2],cl
 005E6807    cmp         byte ptr [ebx],0FA
>005E680A    jne         005E681C
 005E680C    cmp         byte ptr [ebx+2],0FA
>005E6810    jne         005E681C
 005E6812    cmp         byte ptr [ebx+1],0FA
>005E6816    je          005E690B
 005E681C    movzx       eax,byte ptr [ebx]
 005E681F    cmp         al,byte ptr [ebx+2]
>005E6822    ja          005E682E
 005E6824    cmp         al,byte ptr [ebx+1]
>005E6827    ja          005E682E
 005E6829    movzx       eax,al
>005E682C    jmp         005E6844
 005E682E    movzx       eax,byte ptr [ebx+2]
 005E6832    cmp         al,byte ptr [ebx]
>005E6834    ja          005E6840
 005E6836    cmp         al,byte ptr [ebx+1]
>005E6839    ja          005E6840
 005E683B    movzx       eax,al
>005E683E    jmp         005E6844
 005E6840    movzx       eax,byte ptr [ebx+1]
 005E6844    mov         edx,eax
 005E6846    sub         byte ptr [ebx],dl
 005E6848    sub         byte ptr [ebx+1],dl
 005E684B    sub         byte ptr [ebx+2],dl
 005E684E    movzx       edx,byte ptr [ebx]
 005E6851    movzx       ecx,byte ptr [ebx+2]
 005E6855    movzx       esi,cl
 005E6858    add         edx,esi
 005E685A    movzx       esi,byte ptr [ebx+1]
 005E685E    add         edx,esi
 005E6860    cmp         dword ptr [esp+4],0
>005E6865    jne         005E6895
 005E6867    movzx       edi,cl
 005E686A    mov         edx,eax
 005E686C    imul        edx,dword ptr [esp+14]
 005E6871    shr         edx,8
 005E6874    add         edi,edx
 005E6876    movzx       esi,byte ptr [ebx+1]
 005E687A    mov         edx,eax
 005E687C    imul        edx,dword ptr [esp+18]
 005E6881    shr         edx,8
 005E6884    add         esi,edx
 005E6886    movzx       edx,byte ptr [ebx]
 005E6889    imul        eax,dword ptr [esp+1C]
 005E688E    shr         eax,8
 005E6891    add         edx,eax
>005E6893    jmp         005E68CA
 005E6895    mov         edi,edx
 005E6897    imul        edi,dword ptr [esp+8]
 005E689C    mov         ecx,eax
 005E689E    imul        ecx,dword ptr [esp+14]
 005E68A3    add         edi,ecx
 005E68A5    shr         edi,8
 005E68A8    mov         esi,edx
 005E68AA    imul        esi,dword ptr [esp+0C]
 005E68AF    mov         ecx,eax
 005E68B1    imul        ecx,dword ptr [esp+18]
 005E68B6    add         esi,ecx
 005E68B8    shr         esi,8
 005E68BB    imul        edx,dword ptr [esp+10]
 005E68C0    imul        eax,dword ptr [esp+1C]
 005E68C5    add         edx,eax
 005E68C7    shr         edx,8
 005E68CA    cmp         edi,0FF
>005E68D0    jle         005E68D7
 005E68D2    mov         edi,0FF
 005E68D7    cmp         esi,0FF
>005E68DD    jle         005E68E4
 005E68DF    mov         esi,0FF
 005E68E4    cmp         edx,0FF
>005E68EA    jle         005E68F1
 005E68EC    mov         edx,0FF
 005E68F1    mov         eax,dword ptr [esp+24]
 005E68F5    lea         eax,[eax+eax*2]
 005E68F8    mov         ecx,dword ptr [esp+20]
 005E68FC    lea         eax,[ecx+eax]
 005E68FF    mov         byte ptr [eax],dl
 005E6901    mov         edx,esi
 005E6903    mov         byte ptr [eax+1],dl
 005E6906    mov         edx,edi
 005E6908    mov         byte ptr [eax+2],dl
 005E690B    inc         dword ptr [esp+24]
 005E690F    dec         dword ptr [esp+34]
>005E6913    jne         005E67EE
 005E6919    inc         dword ptr [esp+28]
 005E691D    dec         dword ptr [esp+30]
>005E6921    jne         005E67C0
 005E6927    add         esp,38
 005E692A    pop         edi
 005E692B    pop         esi
 005E692C    pop         ebx
 005E692D    ret
*}
end;

//005E6930
{*procedure sub_005E6930(?:TBitmap; ?:TBitmap; ?:?; ?:?);
begin
 005E6930    push        ebp
 005E6931    mov         ebp,esp
 005E6933    add         esp,0FFFFFFC4
 005E6936    push        ebx
 005E6937    push        esi
 005E6938    push        edi
 005E6939    mov         esi,ecx
 005E693B    lea         edi,[ebp-10]
 005E693E    movs        dword ptr [edi],dword ptr [esi]
 005E693F    movs        dword ptr [edi],dword ptr [esi]
 005E6940    mov         dword ptr [ebp-8],edx
 005E6943    mov         dword ptr [ebp-4],eax
 005E6946    mov         edx,30
 005E694B    mov         eax,dword ptr [ebp-8]
 005E694E    mov         ecx,dword ptr [eax]
 005E6950    call        dword ptr [ecx+44]
 005E6953    mov         edx,30
 005E6958    mov         eax,dword ptr [ebp-8]
 005E695B    mov         ecx,dword ptr [eax]
 005E695D    call        dword ptr [ecx+38]
 005E6960    mov         dl,6
 005E6962    mov         eax,dword ptr [ebp-8]
 005E6965    call        TBitmap.SetPixelFormat
 005E696A    fld         qword ptr [ebp+8]
 005E696D    fchs
 005E696F    fld         tbyte ptr ds:[5E6AC4];3.14159265358979:Extended
 005E6975    fmulp       st(1),st
 005E6977    fdiv        dword ptr ds:[5E6AD0];180:Single
 005E697D    fstp        qword ptr [ebp-28]
 005E6980    wait
 005E6981    fld         qword ptr [ebp-28]
 005E6984    add         esp,0FFFFFFF4
 005E6987    fstp        tbyte ptr [esp]
 005E698A    wait
 005E698B    call        Sin
 005E6990    fstp        qword ptr [ebp-38]
 005E6993    wait
 005E6994    fld         qword ptr [ebp-28]
 005E6997    add         esp,0FFFFFFF4
 005E699A    fstp        tbyte ptr [esp]
 005E699D    wait
 005E699E    call        Cos
 005E69A3    fstp        qword ptr [ebp-18]
 005E69A6    wait
 005E69A7    mov         eax,dword ptr [ebp-8]
 005E69AA    mov         edx,dword ptr [eax]
 005E69AC    call        dword ptr [edx+24]
 005E69AF    dec         eax
 005E69B0    cmp         eax,0
>005E69B3    jl          005E6ABB
 005E69B9    mov         dword ptr [ebp-1C],eax
 005E69BC    mov         edx,dword ptr [ebp-1C]
 005E69BF    mov         eax,dword ptr [ebp-8]
 005E69C2    call        TBitmap.GetScanline
 005E69C7    mov         dword ptr [ebp-2C],eax
 005E69CA    mov         eax,dword ptr [ebp-1C]
 005E69CD    sub         eax,8
 005E69D0    sub         eax,dword ptr [ebp-0C]
 005E69D3    add         eax,eax
 005E69D5    inc         eax
 005E69D6    mov         dword ptr [ebp-20],eax
 005E69D9    mov         eax,dword ptr [ebp-8]
 005E69DC    mov         edx,dword ptr [eax]
 005E69DE    call        dword ptr [edx+30]
 005E69E1    mov         ebx,eax
 005E69E3    dec         ebx
 005E69E4    cmp         ebx,0
>005E69E7    jl          005E6AAE
 005E69ED    mov         eax,ebx
 005E69EF    sub         eax,8
 005E69F2    sub         eax,dword ptr [ebp-10]
 005E69F5    mov         esi,eax
 005E69F7    add         esi,esi
 005E69F9    inc         esi
 005E69FA    mov         dword ptr [ebp-3C],esi
 005E69FD    fild        dword ptr [ebp-3C]
 005E6A00    fmul        qword ptr [ebp-18]
 005E6A03    fild        dword ptr [ebp-20]
 005E6A06    fmul        qword ptr [ebp-38]
 005E6A09    fsubp       st(1),st
 005E6A0B    call        @ROUND
 005E6A10    mov         edi,eax
 005E6A12    mov         dword ptr [ebp-3C],esi
 005E6A15    fild        dword ptr [ebp-3C]
 005E6A18    fmul        qword ptr [ebp-38]
 005E6A1B    fild        dword ptr [ebp-20]
 005E6A1E    fmul        qword ptr [ebp-18]
 005E6A21    faddp       st(1),st
 005E6A23    call        @ROUND
 005E6A28    dec         edi
 005E6A29    sar         edi,1
>005E6A2B    jns         005E6A30
 005E6A2D    adc         edi,0
 005E6A30    add         edi,dword ptr [ebp-10]
 005E6A33    mov         esi,eax
 005E6A35    dec         esi
 005E6A36    sar         esi,1
>005E6A38    jns         005E6A3D
 005E6A3A    adc         esi,0
 005E6A3D    add         esi,dword ptr [ebp-0C]
 005E6A40    test        edi,edi
>005E6A42    jl          005E6A8A
 005E6A44    mov         eax,dword ptr [ebp-4]
 005E6A47    mov         edx,dword ptr [eax]
 005E6A49    call        dword ptr [edx+30]
 005E6A4C    dec         eax
 005E6A4D    cmp         edi,eax
>005E6A4F    jg          005E6A8A
 005E6A51    test        esi,esi
>005E6A53    jl          005E6A8A
 005E6A55    mov         eax,dword ptr [ebp-4]
 005E6A58    mov         edx,dword ptr [eax]
 005E6A5A    call        dword ptr [edx+24]
 005E6A5D    dec         eax
 005E6A5E    cmp         esi,eax
>005E6A60    jg          005E6A8A
 005E6A62    mov         edx,esi
 005E6A64    mov         eax,dword ptr [ebp-4]
 005E6A67    call        TBitmap.GetScanline
 005E6A6C    lea         edx,[ebx+ebx*2]
 005E6A6F    mov         ecx,dword ptr [ebp-2C]
 005E6A72    lea         edx,[ecx+edx]
 005E6A75    lea         ecx,[edi+edi*2]
 005E6A78    mov         esi,edx
 005E6A7A    mov         dx,word ptr [eax+ecx]
 005E6A7E    mov         word ptr [esi],dx
 005E6A81    mov         dl,byte ptr [eax+ecx+2]
 005E6A85    mov         byte ptr [esi+2],dl
>005E6A88    jmp         005E6AA4
 005E6A8A    lea         eax,[ebx+ebx*2]
 005E6A8D    mov         edx,dword ptr [ebp-2C]
 005E6A90    mov         byte ptr [edx+eax],0FA
 005E6A94    mov         edx,dword ptr [ebp-2C]
 005E6A97    mov         byte ptr [edx+eax+1],0FA
 005E6A9C    mov         edx,dword ptr [ebp-2C]
 005E6A9F    mov         byte ptr [edx+eax+2],0FA
 005E6AA4    dec         ebx
 005E6AA5    cmp         ebx,0FFFFFFFF
>005E6AA8    jne         005E69ED
 005E6AAE    dec         dword ptr [ebp-1C]
 005E6AB1    cmp         dword ptr [ebp-1C],0FFFFFFFF
>005E6AB5    jne         005E69BC
 005E6ABB    pop         edi
 005E6ABC    pop         esi
 005E6ABD    pop         ebx
 005E6ABE    mov         esp,ebp
 005E6AC0    pop         ebp
 005E6AC1    ret         8
end;*}

//005E6AD4
{*procedure TCursorForm.ChangeAngle(angle:Double; ?:?);
begin
 005E6AD4    push        ebp
 005E6AD5    mov         ebp,esp
 005E6AD7    add         esp,0FFFFFFF8
 005E6ADA    push        ebx
 005E6ADB    push        esi
 005E6ADC    mov         ebx,eax
 005E6ADE    fld         qword ptr [ebp+8]
 005E6AE1    fcomp       qword ptr [ebx+3F0];TCursorForm.Roll:Double
 005E6AE7    wait
 005E6AE8    fnstsw      al
 005E6AEA    sahf
>005E6AEB    je          005E6B91
 005E6AF1    mov         eax,dword ptr [ebp+8]
 005E6AF4    mov         dword ptr [ebx+3F0],eax;TCursorForm.Roll:Double
 005E6AFA    mov         eax,dword ptr [ebp+0C]
 005E6AFD    mov         dword ptr [ebx+3F4],eax;TCursorForm.?f3F4:dword
 005E6B03    fld         qword ptr [ebx+3F0];TCursorForm.Roll:Double
 005E6B09    fcomp       dword ptr ds:[5E6B9C];0:Single
 005E6B0F    wait
 005E6B10    fnstsw      al
 005E6B12    sahf
>005E6B13    jne         005E6B33
 005E6B15    mov         eax,dword ptr [ebx+388];TCursorForm.Image1:TTntImage
 005E6B1B    mov         eax,dword ptr [eax+1B0];TTntImage.FPicture:TPicture
 005E6B21    call        TPicture.GetBitmap
 005E6B26    mov         edx,dword ptr [ebx+3F8];TCursorForm.UnrotatedBitmap:TBitmap
 005E6B2C    mov         ecx,dword ptr [eax]
 005E6B2E    call        dword ptr [ecx+8];TBitmap.Assign
>005E6B31    jmp         005E6B8A
 005E6B33    mov         dl,1
 005E6B35    mov         eax,[00463B28];TBitmap
 005E6B3A    call        TBitmap.Create;TBitmap.Create
 005E6B3F    mov         esi,eax
 005E6B41    mov         dword ptr [ebp-8],10
 005E6B48    mov         dword ptr [ebp-4],10
 005E6B4F    push        dword ptr [ebx+3F4];TCursorForm.?f3F4:dword
 005E6B55    push        dword ptr [ebx+3F0];TCursorForm.Roll:Double
 005E6B5B    lea         ecx,[ebp-8]
 005E6B5E    mov         edx,esi
 005E6B60    mov         eax,dword ptr [ebx+3F8];TCursorForm.UnrotatedBitmap:TBitmap
 005E6B66    call        005E6930
 005E6B6B    mov         eax,dword ptr [ebx+388];TCursorForm.Image1:TTntImage
 005E6B71    mov         eax,dword ptr [eax+1B0];TTntImage.FPicture:TPicture
 005E6B77    call        TPicture.GetBitmap
 005E6B7C    mov         edx,esi
 005E6B7E    mov         ecx,dword ptr [eax]
 005E6B80    call        dword ptr [ecx+8];TBitmap.Assign
 005E6B83    mov         eax,esi
 005E6B85    call        TObject.Free
 005E6B8A    mov         eax,ebx
 005E6B8C    call        TCursorForm.RotateHotspot
 005E6B91    pop         esi
 005E6B92    pop         ebx
 005E6B93    pop         ecx
 005E6B94    pop         ecx
 005E6B95    pop         ebp
 005E6B96    ret         8
end;*}

//005E6BA0
procedure TCursorForm.ChangeCursor2(CursorHandle:Cardinal);
begin
{*
 005E6BA0    push        ebp
 005E6BA1    mov         ebp,esp
 005E6BA3    add         esp,0FFFFFFCC
 005E6BA6    push        ebx
 005E6BA7    mov         dword ptr [ebp-4],eax
 005E6BAA    mov         eax,dword ptr [ebp-4]
 005E6BAD    cmp         byte ptr [eax+3C3],0;TCursorForm.Permanent:Boolean
>005E6BB4    jne         005E6E06
 005E6BBA    mov         ebx,edx
 005E6BBC    mov         eax,dword ptr [ebp-4]
 005E6BBF    cmp         ebx,dword ptr [eax+3B8];TCursorForm.OldCursorHandle:Cardinal
>005E6BC5    je          005E6E06
 005E6BCB    mov         eax,dword ptr [ebp-4]
 005E6BCE    mov         dword ptr [eax+3B8],ebx;TCursorForm.OldCursorHandle:Cardinal
 005E6BD4    mov         eax,dword ptr [ebp-4]
 005E6BD7    cmp         dword ptr [eax+3F8],0;TCursorForm.UnrotatedBitmap:TBitmap
>005E6BDE    jne         005E6BF5
 005E6BE0    mov         dl,1
 005E6BE2    mov         eax,[00463B28];TBitmap
 005E6BE7    call        TBitmap.Create;TBitmap.Create
 005E6BEC    mov         edx,dword ptr [ebp-4]
 005E6BEF    mov         dword ptr [edx+3F8],eax;TCursorForm.UnrotatedBitmap:TBitmap
 005E6BF5    mov         eax,dword ptr [ebp-4]
 005E6BF8    mov         eax,dword ptr [eax+3F8];TCursorForm.UnrotatedBitmap:TBitmap
 005E6BFE    mov         dword ptr [ebp-8],eax
 005E6C01    mov         edx,20
 005E6C06    mov         eax,dword ptr [ebp-8]
 005E6C09    mov         ecx,dword ptr [eax]
 005E6C0B    call        dword ptr [ecx+44];TBitmap.SetWidth
 005E6C0E    mov         edx,20
 005E6C13    mov         eax,dword ptr [ebp-8]
 005E6C16    mov         ecx,dword ptr [eax]
 005E6C18    call        dword ptr [ecx+38];TBitmap.SetHeight
 005E6C1B    mov         dl,6
 005E6C1D    mov         eax,dword ptr [ebp-8]
 005E6C20    call        TBitmap.SetPixelFormat
 005E6C25    mov         eax,dword ptr [ebp-8]
 005E6C28    call        TBitmap.GetCanvas
 005E6C2D    mov         eax,dword ptr [eax+48];TCanvas.FBrush:TBrush
 005E6C30    mov         edx,0FAFAFA
 005E6C35    call        TBrush.SetColor
 005E6C3A    push        20
 005E6C3C    lea         eax,[ebp-34]
 005E6C3F    push        eax
 005E6C40    mov         ecx,20
 005E6C45    xor         edx,edx
 005E6C47    xor         eax,eax
 005E6C49    call        Rect
 005E6C4E    lea         eax,[ebp-34]
 005E6C51    push        eax
 005E6C52    mov         eax,dword ptr [ebp-8]
 005E6C55    call        TBitmap.GetCanvas
 005E6C5A    pop         edx
 005E6C5B    mov         ecx,dword ptr [eax]
 005E6C5D    call        dword ptr [ecx+54];TCanvas.FillRect
 005E6C60    lea         eax,[ebp-24]
 005E6C63    push        eax
 005E6C64    push        ebx
 005E6C65    call        user32.GetIconInfo
 005E6C6A    xor         eax,eax
 005E6C6C    push        ebp
 005E6C6D    push        5E6CD2
 005E6C72    push        dword ptr fs:[eax]
 005E6C75    mov         dword ptr fs:[eax],esp
 005E6C78    mov         eax,dword ptr [ebp-4]
 005E6C7B    mov         edx,dword ptr [ebp-20]
 005E6C7E    mov         dword ptr [eax+3B0],edx;TCursorForm.UnrotatedHotSpotX:Integer
 005E6C84    mov         eax,dword ptr [ebp-4]
 005E6C87    mov         edx,dword ptr [ebp-1C]
 005E6C8A    mov         dword ptr [eax+3B4],edx;TCursorForm.UnrotatedHotSpotY:Integer
 005E6C90    push        3
 005E6C92    push        0
 005E6C94    push        0
 005E6C96    push        20
 005E6C98    push        20
 005E6C9A    push        ebx
 005E6C9B    push        0
 005E6C9D    push        0
 005E6C9F    mov         eax,dword ptr [ebp-8]
 005E6CA2    call        TBitmap.GetCanvas
 005E6CA7    call        TCanvas.GetHandle
 005E6CAC    push        eax
 005E6CAD    call        user32.DrawIconEx
 005E6CB2    xor         eax,eax
 005E6CB4    pop         edx
 005E6CB5    pop         ecx
 005E6CB6    pop         ecx
 005E6CB7    mov         dword ptr fs:[eax],edx
 005E6CBA    push        5E6CD9
 005E6CBF    mov         eax,dword ptr [ebp-18]
 005E6CC2    push        eax
 005E6CC3    call        gdi32.DeleteObject
 005E6CC8    mov         eax,dword ptr [ebp-14]
 005E6CCB    push        eax
 005E6CCC    call        gdi32.DeleteObject
 005E6CD1    ret
>005E6CD2    jmp         @HandleFinally
>005E6CD7    jmp         005E6CBF
 005E6CD9    push        0FFFFFF
 005E6CDE    push        0
 005E6CE0    mov         eax,dword ptr [ebp-8]
 005E6CE3    call        TBitmap.GetCanvas
 005E6CE8    xor         ecx,ecx
 005E6CEA    mov         edx,1F
 005E6CEF    mov         ebx,dword ptr [eax]
 005E6CF1    call        dword ptr [ebx+58];TCanvas.FloodFill
 005E6CF4    push        0FFFFFF
 005E6CF9    push        0
 005E6CFB    mov         eax,dword ptr [ebp-8]
 005E6CFE    call        TBitmap.GetCanvas
 005E6D03    xor         ecx,ecx
 005E6D05    xor         edx,edx
 005E6D07    mov         ebx,dword ptr [eax]
 005E6D09    call        dword ptr [ebx+58];TCanvas.FloodFill
 005E6D0C    push        0FFFFFF
 005E6D11    push        0
 005E6D13    mov         eax,dword ptr [ebp-8]
 005E6D16    call        TBitmap.GetCanvas
 005E6D1B    xor         ecx,ecx
 005E6D1D    mov         edx,0A
 005E6D22    mov         ebx,dword ptr [eax]
 005E6D24    call        dword ptr [ebx+58];TCanvas.FloodFill
 005E6D27    push        0FFFFFF
 005E6D2C    push        0
 005E6D2E    mov         eax,dword ptr [ebp-8]
 005E6D31    call        TBitmap.GetCanvas
 005E6D36    mov         ecx,0A
 005E6D3B    xor         edx,edx
 005E6D3D    mov         ebx,dword ptr [eax]
 005E6D3F    call        dword ptr [ebx+58];TCanvas.FloodFill
 005E6D42    mov         eax,dword ptr [ebp-4]
 005E6D45    mov         eax,dword ptr [eax+404];TCursorForm.FColour:TColor
 005E6D4B    test        eax,eax
>005E6D4D    jne         005E6D5E
 005E6D4F    mov         edx,dword ptr [ebp-4]
 005E6D52    cmp         dword ptr [edx+408],0FFFFFF;TCursorForm.FWhiteColour:TColor
>005E6D5C    je          005E6D71
 005E6D5E    mov         edx,dword ptr [ebp-4]
 005E6D61    mov         ecx,dword ptr [edx+408];TCursorForm.FWhiteColour:TColor
 005E6D67    mov         edx,eax
 005E6D69    mov         eax,dword ptr [ebp-8]
 005E6D6C    call        005E66D8
 005E6D71    mov         eax,dword ptr [ebp-4]
 005E6D74    fld         qword ptr [eax+3F0];TCursorForm.Roll:Double
 005E6D7A    fcomp       dword ptr ds:[5E6E0C];0:Single
 005E6D80    wait
 005E6D81    fnstsw      al
 005E6D83    sahf
>005E6D84    jne         005E6DA4
 005E6D86    mov         eax,dword ptr [ebp-4]
 005E6D89    mov         eax,dword ptr [eax+388];TCursorForm.Image1:TTntImage
 005E6D8F    mov         eax,dword ptr [eax+1B0];TTntImage.FPicture:TPicture
 005E6D95    call        TPicture.GetBitmap
 005E6D9A    mov         edx,dword ptr [ebp-8]
 005E6D9D    mov         ecx,dword ptr [eax]
 005E6D9F    call        dword ptr [ecx+8];TBitmap.Assign
>005E6DA2    jmp         005E6DFE
 005E6DA4    mov         dl,1
 005E6DA6    mov         eax,[00463B28];TBitmap
 005E6DAB    call        TBitmap.Create;TBitmap.Create
 005E6DB0    mov         ebx,eax
 005E6DB2    mov         dword ptr [ebp-10],10
 005E6DB9    mov         dword ptr [ebp-0C],10
 005E6DC0    mov         eax,dword ptr [ebp-4]
 005E6DC3    push        dword ptr [eax+3F4];TCursorForm.?f3F4:dword
 005E6DC9    push        dword ptr [eax+3F0];TCursorForm.Roll:Double
 005E6DCF    lea         ecx,[ebp-10]
 005E6DD2    mov         edx,ebx
 005E6DD4    mov         eax,dword ptr [ebp-8]
 005E6DD7    call        005E6930
 005E6DDC    mov         eax,dword ptr [ebp-4]
 005E6DDF    mov         eax,dword ptr [eax+388];TCursorForm.Image1:TTntImage
 005E6DE5    mov         eax,dword ptr [eax+1B0];TTntImage.FPicture:TPicture
 005E6DEB    call        TPicture.GetBitmap
 005E6DF0    mov         edx,ebx
 005E6DF2    mov         ecx,dword ptr [eax]
 005E6DF4    call        dword ptr [ecx+8];TBitmap.Assign
 005E6DF7    mov         eax,ebx
 005E6DF9    call        TObject.Free
 005E6DFE    mov         eax,dword ptr [ebp-4]
 005E6E01    call        TCursorForm.RotateHotspot
 005E6E06    pop         ebx
 005E6E07    mov         esp,ebp
 005E6E09    pop         ebp
 005E6E0A    ret
*}
end;

//005E6E10
procedure TCursorForm.ChangeCursor3(FileName:string);
begin
{*
 005E6E10    push        ebp
 005E6E11    mov         ebp,esp
 005E6E13    add         esp,0FFFFFFB0
 005E6E16    push        ebx
 005E6E17    xor         ecx,ecx
 005E6E19    mov         dword ptr [ebp-38],ecx
 005E6E1C    mov         dword ptr [ebp-3C],ecx
 005E6E1F    mov         dword ptr [ebp-40],ecx
 005E6E22    mov         dword ptr [ebp-34],ecx
 005E6E25    mov         dword ptr [ebp-8],ecx
 005E6E28    mov         dword ptr [ebp-4],edx
 005E6E2B    mov         dword ptr [ebp-0C],eax
 005E6E2E    mov         eax,dword ptr [ebp-4]
 005E6E31    call        @UStrAddRef
 005E6E36    xor         eax,eax
 005E6E38    push        ebp
 005E6E39    push        5E716E
 005E6E3E    push        dword ptr fs:[eax]
 005E6E41    mov         dword ptr fs:[eax],esp
 005E6E44    mov         eax,dword ptr [ebp-4]
 005E6E47    call        @UStrToPWChar
 005E6E4C    push        eax
 005E6E4D    call        user32.LoadCursorFromFileW
 005E6E52    mov         dword ptr [ebp-14],eax
 005E6E55    cmp         dword ptr [ebp-14],0
>005E6E59    jne         005E6EFF
 005E6E5F    lea         edx,[ebp-34]
 005E6E62    mov         eax,dword ptr [ebp-4]
 005E6E65    call        ExtractFileExt
 005E6E6A    mov         eax,dword ptr [ebp-34]
 005E6E6D    lea         edx,[ebp-8]
 005E6E70    call        LowerCase
 005E6E75    cmp         dword ptr [ebp-8],0
>005E6E79    jne         005E6E9F
 005E6E7B    cmp         dword ptr [ebp-14],0
>005E6E7F    jne         005E6E9F
 005E6E81    lea         eax,[ebp-4]
 005E6E84    mov         edx,5E7188;'.cur'
 005E6E89    call        @UStrCat
 005E6E8E    mov         eax,dword ptr [ebp-4]
 005E6E91    call        @UStrToPWChar
 005E6E96    push        eax
 005E6E97    call        user32.LoadCursorFromFileW
 005E6E9C    mov         dword ptr [ebp-14],eax
 005E6E9F    lea         edx,[ebp-8]
 005E6EA2    mov         eax,dword ptr [ebp-4]
 005E6EA5    call        ExtractFilePath
 005E6EAA    cmp         dword ptr [ebp-8],0
>005E6EAE    jne         005E6EF5
 005E6EB0    cmp         dword ptr [ebp-14],0
>005E6EB4    jne         005E6EF5
 005E6EB6    lea         edx,[ebp-40]
 005E6EB9    xor         eax,eax
 005E6EBB    call        ParamStr
 005E6EC0    mov         eax,dword ptr [ebp-40]
 005E6EC3    lea         edx,[ebp-3C]
 005E6EC6    call        ExtractFilePath
 005E6ECB    mov         eax,dword ptr [ebp-3C]
 005E6ECE    lea         edx,[ebp-38]
 005E6ED1    call        IncludeTrailingPathDelimiter
 005E6ED6    mov         edx,dword ptr [ebp-38]
 005E6ED9    lea         eax,[ebp-4]
 005E6EDC    mov         ecx,dword ptr [ebp-4]
 005E6EDF    call        @UStrCat3
 005E6EE4    mov         eax,dword ptr [ebp-4]
 005E6EE7    call        @UStrToPWChar
 005E6EEC    push        eax
 005E6EED    call        user32.LoadCursorFromFileW
 005E6EF2    mov         dword ptr [ebp-14],eax
 005E6EF5    cmp         dword ptr [ebp-14],0
>005E6EF9    je          005E7146
 005E6EFF    mov         ebx,dword ptr [ebp-14]
 005E6F02    mov         eax,dword ptr [ebp-0C]
 005E6F05    mov         dword ptr [eax+3B8],ebx;TCursorForm.OldCursorHandle:Cardinal
 005E6F0B    mov         eax,dword ptr [ebp-0C]
 005E6F0E    cmp         dword ptr [eax+3F8],0;TCursorForm.UnrotatedBitmap:TBitmap
>005E6F15    jne         005E6F2C
 005E6F17    mov         dl,1
 005E6F19    mov         eax,[00463B28];TBitmap
 005E6F1E    call        TBitmap.Create;TBitmap.Create
 005E6F23    mov         edx,dword ptr [ebp-0C]
 005E6F26    mov         dword ptr [edx+3F8],eax;TCursorForm.UnrotatedBitmap:TBitmap
 005E6F2C    mov         eax,dword ptr [ebp-0C]
 005E6F2F    mov         eax,dword ptr [eax+3F8];TCursorForm.UnrotatedBitmap:TBitmap
 005E6F35    mov         dword ptr [ebp-10],eax
 005E6F38    mov         edx,20
 005E6F3D    mov         eax,dword ptr [ebp-10]
 005E6F40    mov         ecx,dword ptr [eax]
 005E6F42    call        dword ptr [ecx+44];TBitmap.SetWidth
 005E6F45    mov         edx,20
 005E6F4A    mov         eax,dword ptr [ebp-10]
 005E6F4D    mov         ecx,dword ptr [eax]
 005E6F4F    call        dword ptr [ecx+38];TBitmap.SetHeight
 005E6F52    mov         dl,6
 005E6F54    mov         eax,dword ptr [ebp-10]
 005E6F57    call        TBitmap.SetPixelFormat
 005E6F5C    mov         eax,dword ptr [ebp-10]
 005E6F5F    call        TBitmap.GetCanvas
 005E6F64    mov         eax,dword ptr [eax+48];TCanvas.FBrush:TBrush
 005E6F67    mov         edx,0FAFAFA
 005E6F6C    call        TBrush.SetColor
 005E6F71    push        20
 005E6F73    lea         eax,[ebp-50]
 005E6F76    push        eax
 005E6F77    mov         ecx,20
 005E6F7C    xor         edx,edx
 005E6F7E    xor         eax,eax
 005E6F80    call        Rect
 005E6F85    lea         eax,[ebp-50]
 005E6F88    push        eax
 005E6F89    mov         eax,dword ptr [ebp-10]
 005E6F8C    call        TBitmap.GetCanvas
 005E6F91    pop         edx
 005E6F92    mov         ecx,dword ptr [eax]
 005E6F94    call        dword ptr [ecx+54];TCanvas.FillRect
 005E6F97    lea         eax,[ebp-30]
 005E6F9A    push        eax
 005E6F9B    push        ebx
 005E6F9C    call        user32.GetIconInfo
 005E6FA1    xor         eax,eax
 005E6FA3    push        ebp
 005E6FA4    push        5E7009
 005E6FA9    push        dword ptr fs:[eax]
 005E6FAC    mov         dword ptr fs:[eax],esp
 005E6FAF    mov         eax,dword ptr [ebp-0C]
 005E6FB2    mov         edx,dword ptr [ebp-2C]
 005E6FB5    mov         dword ptr [eax+3B0],edx;TCursorForm.UnrotatedHotSpotX:Integer
 005E6FBB    mov         eax,dword ptr [ebp-0C]
 005E6FBE    mov         edx,dword ptr [ebp-28]
 005E6FC1    mov         dword ptr [eax+3B4],edx;TCursorForm.UnrotatedHotSpotY:Integer
 005E6FC7    push        3
 005E6FC9    push        0
 005E6FCB    push        0
 005E6FCD    push        20
 005E6FCF    push        20
 005E6FD1    push        ebx
 005E6FD2    push        0
 005E6FD4    push        0
 005E6FD6    mov         eax,dword ptr [ebp-10]
 005E6FD9    call        TBitmap.GetCanvas
 005E6FDE    call        TCanvas.GetHandle
 005E6FE3    push        eax
 005E6FE4    call        user32.DrawIconEx
 005E6FE9    xor         eax,eax
 005E6FEB    pop         edx
 005E6FEC    pop         ecx
 005E6FED    pop         ecx
 005E6FEE    mov         dword ptr fs:[eax],edx
 005E6FF1    push        5E7010
 005E6FF6    mov         eax,dword ptr [ebp-24]
 005E6FF9    push        eax
 005E6FFA    call        gdi32.DeleteObject
 005E6FFF    mov         eax,dword ptr [ebp-20]
 005E7002    push        eax
 005E7003    call        gdi32.DeleteObject
 005E7008    ret
>005E7009    jmp         @HandleFinally
>005E700E    jmp         005E6FF6
 005E7010    push        0FFFFFF
 005E7015    push        0
 005E7017    mov         eax,dword ptr [ebp-10]
 005E701A    call        TBitmap.GetCanvas
 005E701F    xor         ecx,ecx
 005E7021    mov         edx,1F
 005E7026    mov         ebx,dword ptr [eax]
 005E7028    call        dword ptr [ebx+58];TCanvas.FloodFill
 005E702B    push        0FFFFFF
 005E7030    push        0
 005E7032    mov         eax,dword ptr [ebp-10]
 005E7035    call        TBitmap.GetCanvas
 005E703A    xor         ecx,ecx
 005E703C    xor         edx,edx
 005E703E    mov         ebx,dword ptr [eax]
 005E7040    call        dword ptr [ebx+58];TCanvas.FloodFill
 005E7043    push        0FFFFFF
 005E7048    push        0
 005E704A    mov         eax,dword ptr [ebp-10]
 005E704D    call        TBitmap.GetCanvas
 005E7052    xor         ecx,ecx
 005E7054    mov         edx,0A
 005E7059    mov         ebx,dword ptr [eax]
 005E705B    call        dword ptr [ebx+58];TCanvas.FloodFill
 005E705E    push        0FFFFFF
 005E7063    push        0
 005E7065    mov         eax,dword ptr [ebp-10]
 005E7068    call        TBitmap.GetCanvas
 005E706D    mov         ecx,0A
 005E7072    xor         edx,edx
 005E7074    mov         ebx,dword ptr [eax]
 005E7076    call        dword ptr [ebx+58];TCanvas.FloodFill
 005E7079    mov         eax,dword ptr [ebp-0C]
 005E707C    mov         eax,dword ptr [eax+404];TCursorForm.FColour:TColor
 005E7082    test        eax,eax
>005E7084    jne         005E7095
 005E7086    mov         edx,dword ptr [ebp-0C]
 005E7089    cmp         dword ptr [edx+408],0FFFFFF;TCursorForm.FWhiteColour:TColor
>005E7093    je          005E70A8
 005E7095    mov         edx,dword ptr [ebp-0C]
 005E7098    mov         ecx,dword ptr [edx+408];TCursorForm.FWhiteColour:TColor
 005E709E    mov         edx,eax
 005E70A0    mov         eax,dword ptr [ebp-10]
 005E70A3    call        005E66D8
 005E70A8    mov         eax,dword ptr [ebp-0C]
 005E70AB    fld         qword ptr [eax+3F0];TCursorForm.Roll:Double
 005E70B1    fcomp       dword ptr ds:[5E7194];0:Single
 005E70B7    wait
 005E70B8    fnstsw      al
 005E70BA    sahf
>005E70BB    jne         005E70DB
 005E70BD    mov         eax,dword ptr [ebp-0C]
 005E70C0    mov         eax,dword ptr [eax+388];TCursorForm.Image1:TTntImage
 005E70C6    mov         eax,dword ptr [eax+1B0];TTntImage.FPicture:TPicture
 005E70CC    call        TPicture.GetBitmap
 005E70D1    mov         edx,dword ptr [ebp-10]
 005E70D4    mov         ecx,dword ptr [eax]
 005E70D6    call        dword ptr [ecx+8];TBitmap.Assign
>005E70D9    jmp         005E7135
 005E70DB    mov         dl,1
 005E70DD    mov         eax,[00463B28];TBitmap
 005E70E2    call        TBitmap.Create;TBitmap.Create
 005E70E7    mov         ebx,eax
 005E70E9    mov         dword ptr [ebp-1C],10
 005E70F0    mov         dword ptr [ebp-18],10
 005E70F7    mov         eax,dword ptr [ebp-0C]
 005E70FA    push        dword ptr [eax+3F4];TCursorForm.?f3F4:dword
 005E7100    push        dword ptr [eax+3F0];TCursorForm.Roll:Double
 005E7106    lea         ecx,[ebp-1C]
 005E7109    mov         edx,ebx
 005E710B    mov         eax,dword ptr [ebp-10]
 005E710E    call        005E6930
 005E7113    mov         eax,dword ptr [ebp-0C]
 005E7116    mov         eax,dword ptr [eax+388];TCursorForm.Image1:TTntImage
 005E711C    mov         eax,dword ptr [eax+1B0];TTntImage.FPicture:TPicture
 005E7122    call        TPicture.GetBitmap
 005E7127    mov         edx,ebx
 005E7129    mov         ecx,dword ptr [eax]
 005E712B    call        dword ptr [ecx+8];TBitmap.Assign
 005E712E    mov         eax,ebx
 005E7130    call        TObject.Free
 005E7135    mov         eax,dword ptr [ebp-0C]
 005E7138    call        TCursorForm.RotateHotspot
 005E713D    mov         eax,dword ptr [ebp-14]
 005E7140    push        eax
 005E7141    call        user32.DestroyCursor
 005E7146    xor         eax,eax
 005E7148    pop         edx
 005E7149    pop         ecx
 005E714A    pop         ecx
 005E714B    mov         dword ptr fs:[eax],edx
 005E714E    push        5E7175
 005E7153    lea         eax,[ebp-40]
 005E7156    mov         edx,4
 005E715B    call        @UStrArrayClr
 005E7160    lea         eax,[ebp-8]
 005E7163    mov         edx,2
 005E7168    call        @UStrArrayClr
 005E716D    ret
>005E716E    jmp         @HandleFinally
>005E7173    jmp         005E7153
 005E7175    pop         ebx
 005E7176    mov         esp,ebp
 005E7178    pop         ebp
 005E7179    ret
*}
end;

//005E7198
procedure TCursorForm.ChangeCursor(idc:PWideChar);
begin
{*
 005E7198    push        ebp
 005E7199    mov         ebp,esp
 005E719B    add         esp,0FFFFFFCC
 005E719E    push        ebx
 005E719F    mov         dword ptr [ebp-4],eax
 005E71A2    mov         eax,dword ptr [ebp-4]
 005E71A5    cmp         byte ptr [eax+3C3],0;TCursorForm.Permanent:Boolean
>005E71AC    jne         005E7406
 005E71B2    push        edx
 005E71B3    push        0
 005E71B5    call        user32.LoadCursorW
 005E71BA    mov         ebx,eax
 005E71BC    mov         eax,dword ptr [ebp-4]
 005E71BF    cmp         ebx,dword ptr [eax+3B8];TCursorForm.OldCursorHandle:Cardinal
>005E71C5    je          005E7406
 005E71CB    mov         eax,dword ptr [ebp-4]
 005E71CE    mov         dword ptr [eax+3B8],ebx;TCursorForm.OldCursorHandle:Cardinal
 005E71D4    mov         eax,dword ptr [ebp-4]
 005E71D7    cmp         dword ptr [eax+3F8],0;TCursorForm.UnrotatedBitmap:TBitmap
>005E71DE    jne         005E71F5
 005E71E0    mov         dl,1
 005E71E2    mov         eax,[00463B28];TBitmap
 005E71E7    call        TBitmap.Create;TBitmap.Create
 005E71EC    mov         edx,dword ptr [ebp-4]
 005E71EF    mov         dword ptr [edx+3F8],eax;TCursorForm.UnrotatedBitmap:TBitmap
 005E71F5    mov         eax,dword ptr [ebp-4]
 005E71F8    mov         eax,dword ptr [eax+3F8];TCursorForm.UnrotatedBitmap:TBitmap
 005E71FE    mov         dword ptr [ebp-8],eax
 005E7201    mov         edx,20
 005E7206    mov         eax,dword ptr [ebp-8]
 005E7209    mov         ecx,dword ptr [eax]
 005E720B    call        dword ptr [ecx+44];TBitmap.SetWidth
 005E720E    mov         edx,20
 005E7213    mov         eax,dword ptr [ebp-8]
 005E7216    mov         ecx,dword ptr [eax]
 005E7218    call        dword ptr [ecx+38];TBitmap.SetHeight
 005E721B    mov         dl,6
 005E721D    mov         eax,dword ptr [ebp-8]
 005E7220    call        TBitmap.SetPixelFormat
 005E7225    mov         eax,dword ptr [ebp-8]
 005E7228    call        TBitmap.GetCanvas
 005E722D    mov         eax,dword ptr [eax+48];TCanvas.FBrush:TBrush
 005E7230    mov         edx,0FAFAFA
 005E7235    call        TBrush.SetColor
 005E723A    push        20
 005E723C    lea         eax,[ebp-34]
 005E723F    push        eax
 005E7240    mov         ecx,20
 005E7245    xor         edx,edx
 005E7247    xor         eax,eax
 005E7249    call        Rect
 005E724E    lea         eax,[ebp-34]
 005E7251    push        eax
 005E7252    mov         eax,dword ptr [ebp-8]
 005E7255    call        TBitmap.GetCanvas
 005E725A    pop         edx
 005E725B    mov         ecx,dword ptr [eax]
 005E725D    call        dword ptr [ecx+54];TCanvas.FillRect
 005E7260    lea         eax,[ebp-24]
 005E7263    push        eax
 005E7264    push        ebx
 005E7265    call        user32.GetIconInfo
 005E726A    xor         eax,eax
 005E726C    push        ebp
 005E726D    push        5E72D2
 005E7272    push        dword ptr fs:[eax]
 005E7275    mov         dword ptr fs:[eax],esp
 005E7278    mov         eax,dword ptr [ebp-4]
 005E727B    mov         edx,dword ptr [ebp-20]
 005E727E    mov         dword ptr [eax+3B0],edx;TCursorForm.UnrotatedHotSpotX:Integer
 005E7284    mov         eax,dword ptr [ebp-4]
 005E7287    mov         edx,dword ptr [ebp-1C]
 005E728A    mov         dword ptr [eax+3B4],edx;TCursorForm.UnrotatedHotSpotY:Integer
 005E7290    push        3
 005E7292    push        0
 005E7294    push        0
 005E7296    push        20
 005E7298    push        20
 005E729A    push        ebx
 005E729B    push        0
 005E729D    push        0
 005E729F    mov         eax,dword ptr [ebp-8]
 005E72A2    call        TBitmap.GetCanvas
 005E72A7    call        TCanvas.GetHandle
 005E72AC    push        eax
 005E72AD    call        user32.DrawIconEx
 005E72B2    xor         eax,eax
 005E72B4    pop         edx
 005E72B5    pop         ecx
 005E72B6    pop         ecx
 005E72B7    mov         dword ptr fs:[eax],edx
 005E72BA    push        5E72D9
 005E72BF    mov         eax,dword ptr [ebp-18]
 005E72C2    push        eax
 005E72C3    call        gdi32.DeleteObject
 005E72C8    mov         eax,dword ptr [ebp-14]
 005E72CB    push        eax
 005E72CC    call        gdi32.DeleteObject
 005E72D1    ret
>005E72D2    jmp         @HandleFinally
>005E72D7    jmp         005E72BF
 005E72D9    push        0FFFFFF
 005E72DE    push        0
 005E72E0    mov         eax,dword ptr [ebp-8]
 005E72E3    call        TBitmap.GetCanvas
 005E72E8    xor         ecx,ecx
 005E72EA    mov         edx,1F
 005E72EF    mov         ebx,dword ptr [eax]
 005E72F1    call        dword ptr [ebx+58];TCanvas.FloodFill
 005E72F4    push        0FFFFFF
 005E72F9    push        0
 005E72FB    mov         eax,dword ptr [ebp-8]
 005E72FE    call        TBitmap.GetCanvas
 005E7303    xor         ecx,ecx
 005E7305    xor         edx,edx
 005E7307    mov         ebx,dword ptr [eax]
 005E7309    call        dword ptr [ebx+58];TCanvas.FloodFill
 005E730C    push        0FFFFFF
 005E7311    push        0
 005E7313    mov         eax,dword ptr [ebp-8]
 005E7316    call        TBitmap.GetCanvas
 005E731B    xor         ecx,ecx
 005E731D    mov         edx,0A
 005E7322    mov         ebx,dword ptr [eax]
 005E7324    call        dword ptr [ebx+58];TCanvas.FloodFill
 005E7327    push        0FFFFFF
 005E732C    push        0
 005E732E    mov         eax,dword ptr [ebp-8]
 005E7331    call        TBitmap.GetCanvas
 005E7336    mov         ecx,0A
 005E733B    xor         edx,edx
 005E733D    mov         ebx,dword ptr [eax]
 005E733F    call        dword ptr [ebx+58];TCanvas.FloodFill
 005E7342    mov         eax,dword ptr [ebp-4]
 005E7345    mov         eax,dword ptr [eax+404];TCursorForm.FColour:TColor
 005E734B    test        eax,eax
>005E734D    jne         005E735E
 005E734F    mov         edx,dword ptr [ebp-4]
 005E7352    cmp         dword ptr [edx+408],0FFFFFF;TCursorForm.FWhiteColour:TColor
>005E735C    je          005E7371
 005E735E    mov         edx,dword ptr [ebp-4]
 005E7361    mov         ecx,dword ptr [edx+408];TCursorForm.FWhiteColour:TColor
 005E7367    mov         edx,eax
 005E7369    mov         eax,dword ptr [ebp-8]
 005E736C    call        005E66D8
 005E7371    mov         eax,dword ptr [ebp-4]
 005E7374    fld         qword ptr [eax+3F0];TCursorForm.Roll:Double
 005E737A    fcomp       dword ptr ds:[5E740C];0:Single
 005E7380    wait
 005E7381    fnstsw      al
 005E7383    sahf
>005E7384    jne         005E73A4
 005E7386    mov         eax,dword ptr [ebp-4]
 005E7389    mov         eax,dword ptr [eax+388];TCursorForm.Image1:TTntImage
 005E738F    mov         eax,dword ptr [eax+1B0];TTntImage.FPicture:TPicture
 005E7395    call        TPicture.GetBitmap
 005E739A    mov         edx,dword ptr [ebp-8]
 005E739D    mov         ecx,dword ptr [eax]
 005E739F    call        dword ptr [ecx+8];TBitmap.Assign
>005E73A2    jmp         005E73FE
 005E73A4    mov         dl,1
 005E73A6    mov         eax,[00463B28];TBitmap
 005E73AB    call        TBitmap.Create;TBitmap.Create
 005E73B0    mov         ebx,eax
 005E73B2    mov         dword ptr [ebp-10],10
 005E73B9    mov         dword ptr [ebp-0C],10
 005E73C0    mov         eax,dword ptr [ebp-4]
 005E73C3    push        dword ptr [eax+3F4];TCursorForm.?f3F4:dword
 005E73C9    push        dword ptr [eax+3F0];TCursorForm.Roll:Double
 005E73CF    lea         ecx,[ebp-10]
 005E73D2    mov         edx,ebx
 005E73D4    mov         eax,dword ptr [ebp-8]
 005E73D7    call        005E6930
 005E73DC    mov         eax,dword ptr [ebp-4]
 005E73DF    mov         eax,dword ptr [eax+388];TCursorForm.Image1:TTntImage
 005E73E5    mov         eax,dword ptr [eax+1B0];TTntImage.FPicture:TPicture
 005E73EB    call        TPicture.GetBitmap
 005E73F0    mov         edx,ebx
 005E73F2    mov         ecx,dword ptr [eax]
 005E73F4    call        dword ptr [ecx+8];TBitmap.Assign
 005E73F7    mov         eax,ebx
 005E73F9    call        TObject.Free
 005E73FE    mov         eax,dword ptr [ebp-4]
 005E7401    call        TCursorForm.RotateHotspot
 005E7406    pop         ebx
 005E7407    mov         esp,ebp
 005E7409    pop         ebp
 005E740A    ret
*}
end;

//005E7410
procedure TCursorForm.FormCreate(Sender:TObject);
begin
{*
 005E7410    push        ebx
 005E7411    mov         ebx,eax
 005E7413    mov         dword ptr [ebx+408],0FFFFFF;TCursorForm.FWhiteColour:TColor
 005E741D    push        0EC
 005E741F    mov         eax,ebx
 005E7421    call        TWinControl.GetHandle
 005E7426    push        eax
 005E7427    call        user32.GetWindowLongW
 005E742C    or          eax,8
 005E742F    push        eax
 005E7430    push        0EC
 005E7432    mov         eax,ebx
 005E7434    call        TWinControl.GetHandle
 005E7439    push        eax
 005E743A    call        user32.SetWindowLongW
 005E743F    mov         edx,7F00
 005E7444    mov         eax,ebx
 005E7446    call        TCursorForm.ChangeCursor
 005E744B    pop         ebx
 005E744C    ret
*}
end;

//005E7450
procedure TCursorForm.SetPos(x:Integer; y:Integer; DontCheck:Boolean);
begin
{*
 005E7450    push        ebp
 005E7451    mov         ebp,esp
 005E7453    push        ebx
 005E7454    push        esi
 005E7455    mov         esi,ecx
 005E7457    mov         ebx,eax
 005E7459    sub         edx,dword ptr [ebx+3A8]
 005E745F    mov         eax,ebx
 005E7461    call        TCustomForm.SetLeft
 005E7466    mov         edx,esi
 005E7468    sub         edx,dword ptr [ebx+3AC]
 005E746E    mov         eax,ebx
 005E7470    call        TCustomForm.SetTop
 005E7475    cmp         byte ptr [ebp+8],0
>005E7479    jne         005E7482
 005E747B    mov         eax,ebx
 005E747D    call        TCursorForm.CheckUnderneath
 005E7482    pop         esi
 005E7483    pop         ebx
 005E7484    pop         ebp
 005E7485    ret         4
*}
end;

//005E7488
procedure TCursorForm.CheckUnderneath;
begin
{*
 005E7488    push        ebp
 005E7489    mov         ebp,esp
 005E748B    add         esp,0FFFFFDD8
 005E7491    push        ebx
 005E7492    push        esi
 005E7493    push        edi
 005E7494    xor         edx,edx
 005E7496    mov         dword ptr [ebp-228],edx
 005E749C    mov         dword ptr [ebp-224],edx
 005E74A2    mov         ebx,eax
 005E74A4    xor         eax,eax
 005E74A6    push        ebp
 005E74A7    push        5E78B8
 005E74AC    push        dword ptr fs:[eax]
 005E74AF    mov         dword ptr fs:[eax],esp
 005E74B2    mov         eax,ebx
 005E74B4    call        TCursorForm.GetX
 005E74B9    mov         esi,eax
 005E74BB    mov         eax,ebx
 005E74BD    call        TCursorForm.GetY
 005E74C2    mov         dword ptr [ebp-20],esi
 005E74C5    mov         dword ptr [ebp-1C],eax
 005E74C8    mov         eax,dword ptr [ebp-20]
 005E74CB    mov         dword ptr [ebp-8],eax
 005E74CE    mov         eax,dword ptr [ebp-1C]
 005E74D1    mov         dword ptr [ebp-4],eax
 005E74D4    mov         eax,ebx
 005E74D6    call        TCursorForm.GetX
 005E74DB    mov         dword ptr [ebp-14],eax
 005E74DE    mov         eax,ebx
 005E74E0    call        TCursorForm.GetY
 005E74E5    mov         dword ptr [ebp-18],eax
 005E74E8    mov         eax,ebx
 005E74EA    call        TCursorForm.HideMe
 005E74EF    push        dword ptr [ebp-4]
 005E74F2    push        dword ptr [ebp-8]
 005E74F5    call        user32.WindowFromPoint
 005E74FA    mov         esi,eax
 005E74FC    mov         eax,ebx
 005E74FE    call        TCursorForm.ShowMe
 005E7503    mov         eax,dword ptr [ebx+3BC];TCursorForm.OldWindowHandle:HWND
 005E7509    cmp         esi,eax
>005E750B    je          005E7527
 005E750D    test        eax,eax
>005E750F    je          005E7527
 005E7511    push        0
 005E7513    push        5E8B8C
 005E7518    push        0
 005E751A    push        0
 005E751C    push        2A3
 005E7521    push        eax
 005E7522    call        user32.SendMessageCallbackW
 005E7527    cmp         byte ptr [ebx+3C0],0;TCursorForm.FLeftButton:Boolean
>005E752E    je          005E756D
 005E7530    cmp         esi,dword ptr [ebx+3E8];TCursorForm.LastClickWindow:HWND
>005E7536    je          005E756D
 005E7538    cmp         dword ptr [ebx+3E8],0;TCursorForm.LastClickWindow:HWND
>005E753F    je          005E756D
 005E7541    movzx       eax,word ptr [ebp-0C]
 005E7545    shl         eax,10
 005E7548    mov         edx,dword ptr [ebp-10]
 005E754B    and         edx,0FFFF
 005E7551    or          eax,edx
 005E7553    push        eax
 005E7554    mov         eax,ebx
 005E7556    call        TCursorForm.getKeysDown
 005E755B    push        eax
 005E755C    push        200
 005E7561    mov         eax,dword ptr [ebx+3E8];TCursorForm.LastClickWindow:HWND
 005E7567    push        eax
 005E7568    call        user32.PostMessageW
 005E756D    test        esi,esi
>005E756F    jne         005E7597
 005E7571    mov         dword ptr [ebx+3BC],esi;TCursorForm.OldWindowHandle:HWND
 005E7577    mov         edx,7F00
 005E757C    mov         eax,ebx
 005E757E    call        TCursorForm.ChangeCursor
 005E7583    push        1
 005E7585    mov         ecx,dword ptr [ebp-18]
 005E7588    mov         edx,dword ptr [ebp-14]
 005E758B    mov         eax,ebx
 005E758D    call        TCursorForm.SetPos
>005E7592    jmp         005E789A
 005E7597    mov         eax,ebx
 005E7599    call        TWinControl.GetHandle
 005E759E    cmp         esi,eax
>005E75A0    jne         005E75C2
 005E75A2    mov         edx,7F88
 005E75A7    mov         eax,ebx
 005E75A9    call        TCursorForm.ChangeCursor
 005E75AE    push        1
 005E75B0    mov         ecx,dword ptr [ebp-18]
 005E75B3    mov         edx,dword ptr [ebp-14]
 005E75B6    mov         eax,ebx
 005E75B8    call        TCursorForm.SetPos
>005E75BD    jmp         005E789A
 005E75C2    mov         byte ptr [ebx+3CC],0;TCursorForm.IsIE:Boolean
 005E75C9    mov         eax,dword ptr [ebp-18]
 005E75CC    shl         eax,10
 005E75CF    mov         edx,dword ptr [ebp-14]
 005E75D2    and         edx,0FFFF
 005E75D8    or          eax,edx
 005E75DA    push        eax
 005E75DB    push        0
 005E75DD    push        84
 005E75E2    push        esi
 005E75E3    call        user32.SendMessageW
 005E75E8    mov         edi,eax
 005E75EA    mov         eax,edi
 005E75EC    add         eax,2
 005E75EF    cmp         eax,17
>005E75F2    ja          005E7857
 005E75F8    jmp         dword ptr [eax*4+5E75FF]
 005E75F8    dd          005E782D
 005E75F8    dd          005E783B
 005E75F8    dd          005E7849
 005E75F8    dd          005E76B4
 005E75F8    dd          005E7670
 005E75F8    dd          005E765F
 005E75F8    dd          005E7811
 005E75F8    dd          005E76A3
 005E75F8    dd          005E781F
 005E75F8    dd          005E781F
 005E75F8    dd          005E7692
 005E75F8    dd          005E7692
 005E75F8    dd          005E77D9
 005E75F8    dd          005E77D9
 005E75F8    dd          005E77E7
 005E75F8    dd          005E77F5
 005E75F8    dd          005E7803
 005E75F8    dd          005E77E7
 005E75F8    dd          005E7803
 005E75F8    dd          005E77F5
 005E75F8    dd          005E77C8
 005E75F8    dd          005E7857
 005E75F8    dd          005E7692
 005E75F8    dd          005E7681
 005E765F    mov         edx,7F00
 005E7664    mov         eax,ebx
 005E7666    call        TCursorForm.ChangeCursor
>005E766B    jmp         005E7863
 005E7670    mov         edx,7F00
 005E7675    mov         eax,ebx
 005E7677    call        TCursorForm.ChangeCursor
>005E767C    jmp         005E7863
 005E7681    mov         edx,7F8B
 005E7686    mov         eax,ebx
 005E7688    call        TCursorForm.ChangeCursor
>005E768D    jmp         005E7863
 005E7692    mov         edx,7F00
 005E7697    mov         eax,ebx
 005E7699    call        TCursorForm.ChangeCursor
>005E769E    jmp         005E7863
 005E76A3    mov         edx,7F00
 005E76A8    mov         eax,ebx
 005E76AA    call        TCursorForm.ChangeCursor
>005E76AF    jmp         005E7863
 005E76B4    mov         eax,esi
 005E76B6    call        005E8928
 005E76BB    test        al,al
>005E76BD    je          005E76D0
 005E76BF    mov         edx,7F02
 005E76C4    mov         eax,ebx
 005E76C6    call        TCursorForm.ChangeCursor
>005E76CB    jmp         005E7863
 005E76D0    mov         eax,dword ptr [ebp-8]
 005E76D3    mov         dword ptr [ebp-10],eax
 005E76D6    mov         eax,dword ptr [ebp-4]
 005E76D9    mov         dword ptr [ebp-0C],eax
 005E76DC    lea         eax,[ebp-10]
 005E76DF    push        eax
 005E76E0    push        esi
 005E76E1    call        user32.ScreenToClient
 005E76E6    push        0FA
 005E76EB    lea         eax,[ebp-220]
 005E76F1    push        eax
 005E76F2    push        esi
 005E76F3    call        user32.GetClassNameW
 005E76F8    lea         eax,[ebp-224]
 005E76FE    lea         edx,[ebp-220]
 005E7704    mov         ecx,100
 005E7709    call        @UStrFromWArray
 005E770E    mov         eax,dword ptr [ebp-224]
 005E7714    mov         edx,5E78D4;'Internet Explorer_Server'
 005E7719    call        @UStrEqual
>005E771E    je          005E774C
 005E7720    lea         eax,[ebp-228]
 005E7726    lea         edx,[ebp-220]
 005E772C    mov         ecx,100
 005E7731    call        @UStrFromWArray
 005E7736    mov         eax,dword ptr [ebp-228]
 005E773C    mov         edx,5E7914;'ToolbarWindow32'
 005E7741    call        @UStrEqual
>005E7746    je          005E774C
 005E7748    xor         eax,eax
>005E774A    jmp         005E774E
 005E774C    mov         al,1
 005E774E    mov         byte ptr [ebx+3CC],al;TCursorForm.IsIE:Boolean
 005E7754    cmp         byte ptr [ebx+3CC],0;TCursorForm.IsIE:Boolean
>005E775B    je          005E7775
 005E775D    movzx       eax,word ptr [ebp-0C]
 005E7761    shl         eax,10
 005E7764    mov         edx,dword ptr [ebp-10]
 005E7767    and         edx,0FFFF
 005E776D    or          eax,edx
 005E776F    mov         dword ptr [ebx+3D0],eax;TCursorForm.IePos:Cardinal
 005E7775    movzx       eax,word ptr [ebp-0C]
 005E7779    shl         eax,10
 005E777C    mov         edx,dword ptr [ebp-10]
 005E777F    and         edx,0FFFF
 005E7785    or          eax,edx
 005E7787    push        eax
 005E7788    mov         eax,ebx
 005E778A    call        TCursorForm.getKeysDown
 005E778F    push        eax
 005E7790    push        200
 005E7795    push        esi
 005E7796    call        user32.PostMessageW
 005E779B    push        0F4
 005E779D    push        esi
 005E779E    call        user32.GetClassLongW
 005E77A3    mov         edi,eax
 005E77A5    test        edi,edi
>005E77A7    jne         005E77BA
 005E77A9    mov         edx,7F00
 005E77AE    mov         eax,ebx
 005E77B0    call        TCursorForm.ChangeCursor
>005E77B5    jmp         005E7863
 005E77BA    mov         edx,edi
 005E77BC    mov         eax,ebx
 005E77BE    call        TCursorForm.ChangeCursor2
>005E77C3    jmp         005E7863
 005E77C8    mov         edx,7F00
 005E77CD    mov         eax,ebx
 005E77CF    call        TCursorForm.ChangeCursor
>005E77D4    jmp         005E7863
 005E77D9    mov         edx,7F84
 005E77DE    mov         eax,ebx
 005E77E0    call        TCursorForm.ChangeCursor
>005E77E5    jmp         005E7863
 005E77E7    mov         edx,7F85
 005E77EC    mov         eax,ebx
 005E77EE    call        TCursorForm.ChangeCursor
>005E77F3    jmp         005E7863
 005E77F5    mov         edx,7F82
 005E77FA    mov         eax,ebx
 005E77FC    call        TCursorForm.ChangeCursor
>005E7801    jmp         005E7863
 005E7803    mov         edx,7F83
 005E7808    mov         eax,ebx
 005E780A    call        TCursorForm.ChangeCursor
>005E780F    jmp         005E7863
 005E7811    mov         edx,7F82
 005E7816    mov         eax,ebx
 005E7818    call        TCursorForm.ChangeCursor
>005E781D    jmp         005E7863
 005E781F    mov         edx,7F00
 005E7824    mov         eax,ebx
 005E7826    call        TCursorForm.ChangeCursor
>005E782B    jmp         005E7863
 005E782D    mov         edx,7F00
 005E7832    mov         eax,ebx
 005E7834    call        TCursorForm.ChangeCursor
>005E7839    jmp         005E7863
 005E783B    mov         edx,7F00
 005E7840    mov         eax,ebx
 005E7842    call        TCursorForm.ChangeCursor
>005E7847    jmp         005E7863
 005E7849    mov         edx,7F00
 005E784E    mov         eax,ebx
 005E7850    call        TCursorForm.ChangeCursor
>005E7855    jmp         005E7863
 005E7857    mov         edx,7F00
 005E785C    mov         eax,ebx
 005E785E    call        TCursorForm.ChangeCursor
 005E7863    cmp         edi,1
>005E7866    je          005E788A
 005E7868    movzx       eax,word ptr [ebp-18]
 005E786C    shl         eax,10
 005E786F    movzx       edx,word ptr [ebp-14]
 005E7873    and         dx,0FFFF
 005E7878    movzx       edx,dx
 005E787B    or          eax,edx
 005E787D    push        eax
 005E787E    push        edi
 005E787F    push        0A0
 005E7884    push        esi
 005E7885    call        user32.PostMessageW
 005E788A    mov         eax,ebx
 005E788C    mov         edx,dword ptr [eax]
 005E788E    call        dword ptr [edx+94];TWinControl.Repaint
 005E7894    mov         dword ptr [ebx+3BC],esi;TCursorForm.OldWindowHandle:HWND
 005E789A    xor         eax,eax
 005E789C    pop         edx
 005E789D    pop         ecx
 005E789E    pop         ecx
 005E789F    mov         dword ptr fs:[eax],edx
 005E78A2    push        5E78BF
 005E78A7    lea         eax,[ebp-228]
 005E78AD    mov         edx,2
 005E78B2    call        @UStrArrayClr
 005E78B7    ret
>005E78B8    jmp         @HandleFinally
>005E78BD    jmp         005E78A7
 005E78BF    pop         edi
 005E78C0    pop         esi
 005E78C1    pop         ebx
 005E78C2    mov         esp,ebp
 005E78C4    pop         ebp
 005E78C5    ret
*}
end;

//005E7934
procedure TCursorForm.SetX(value:Integer);
begin
{*
 005E7934    push        ebx
 005E7935    push        esi
 005E7936    mov         esi,edx
 005E7938    mov         ebx,eax
 005E793A    mov         eax,ebx
 005E793C    call        TCursorForm.GetX
 005E7941    cmp         esi,eax
>005E7943    je          005E795B
 005E7945    mov         edx,esi
 005E7947    sub         edx,dword ptr [ebx+3A8]
 005E794D    mov         eax,ebx
 005E794F    call        TCustomForm.SetLeft
 005E7954    mov         eax,ebx
 005E7956    call        TCursorForm.CheckUnderneath
 005E795B    pop         esi
 005E795C    pop         ebx
 005E795D    ret
*}
end;

//005E7960
procedure TCursorForm.SetY(value:Integer);
begin
{*
 005E7960    push        ebx
 005E7961    push        esi
 005E7962    mov         esi,edx
 005E7964    mov         ebx,eax
 005E7966    mov         eax,ebx
 005E7968    call        TCursorForm.GetY
 005E796D    cmp         esi,eax
>005E796F    je          005E7987
 005E7971    mov         edx,esi
 005E7973    sub         edx,dword ptr [ebx+3AC]
 005E7979    mov         eax,ebx
 005E797B    call        TCustomForm.SetTop
 005E7980    mov         eax,ebx
 005E7982    call        TCursorForm.CheckUnderneath
 005E7987    pop         esi
 005E7988    pop         ebx
 005E7989    ret
*}
end;

//005E798C
function TCursorForm.GetX:Integer;
begin
{*
 005E798C    push        ebx
 005E798D    mov         ebx,eax
 005E798F    mov         eax,ebx
 005E7991    call        TCustomForm.GetLeft
 005E7996    add         eax,dword ptr [ebx+3A8];TCursorForm.HotSpotX:Integer
 005E799C    pop         ebx
 005E799D    ret
*}
end;

//005E79A0
function TCursorForm.GetY:Integer;
begin
{*
 005E79A0    push        ebx
 005E79A1    mov         ebx,eax
 005E79A3    mov         eax,ebx
 005E79A5    call        TCustomForm.GetTop
 005E79AA    add         eax,dword ptr [ebx+3AC];TCursorForm.HotSpotY:Integer
 005E79B0    pop         ebx
 005E79B1    ret
*}
end;

//005E79B4
procedure TCursorForm.SetLeftButton(value:Boolean);
begin
{*
 005E79B4    push        ebp
 005E79B5    mov         ebp,esp
 005E79B7    add         esp,0FFFFFB68
 005E79BD    push        ebx
 005E79BE    push        esi
 005E79BF    push        edi
 005E79C0    xor         ecx,ecx
 005E79C2    mov         dword ptr [ebp-498],ecx
 005E79C8    mov         dword ptr [ebp-494],ecx
 005E79CE    mov         dword ptr [ebp-490],ecx
 005E79D4    mov         dword ptr [ebp-48C],ecx
 005E79DA    mov         ebx,edx
 005E79DC    mov         edi,eax
 005E79DE    xor         eax,eax
 005E79E0    push        ebp
 005E79E1    push        5E8341
 005E79E6    push        dword ptr fs:[eax]
 005E79E9    mov         dword ptr fs:[eax],esp
 005E79EC    cmp         bl,byte ptr [edi+3C0];TCursorForm.FLeftButton:Boolean
>005E79F2    je          005E8323
 005E79F8    mov         byte ptr [edi+3C0],bl;TCursorForm.FLeftButton:Boolean
 005E79FE    mov         eax,edi
 005E7A00    call        TCursorForm.GetX
 005E7A05    mov         dword ptr [ebp-1C],eax
 005E7A08    mov         eax,edi
 005E7A0A    call        TCursorForm.GetY
 005E7A0F    mov         dword ptr [ebp-20],eax
 005E7A12    mov         eax,dword ptr [ebp-1C]
 005E7A15    mov         dword ptr [ebp-44],eax
 005E7A18    mov         eax,dword ptr [ebp-20]
 005E7A1B    mov         dword ptr [ebp-40],eax
 005E7A1E    mov         eax,dword ptr [ebp-44]
 005E7A21    mov         dword ptr [ebp-8],eax
 005E7A24    mov         eax,dword ptr [ebp-40]
 005E7A27    mov         dword ptr [ebp-4],eax
 005E7A2A    mov         eax,edi
 005E7A2C    call        TCursorForm.HideMe
 005E7A31    push        dword ptr [ebp-4]
 005E7A34    push        dword ptr [ebp-8]
 005E7A37    call        user32.WindowFromPoint
 005E7A3C    mov         esi,eax
 005E7A3E    mov         dword ptr [ebp-14],esi
 005E7A41    xor         eax,eax
 005E7A43    mov         dword ptr [ebp-28],eax
 005E7A46    call        00682F08
 005E7A4B    fstp        qword ptr [ebp-38]
 005E7A4E    wait
 005E7A4F    test        bl,bl
>005E7A51    je          005E7A71
 005E7A53    fld         qword ptr [ebp-38]
 005E7A56    fsub        qword ptr [edi+3E0];TCursorForm.LastClickTime:Double
 005E7A5C    mov         eax,[0078D980];^gvar_0081ECF0:Double
 005E7A61    fcomp       qword ptr [eax]
 005E7A63    wait
 005E7A64    fnstsw      al
 005E7A66    sahf
>005E7A67    ja          005E7A71
 005E7A69    cmp         esi,dword ptr [edi+3E8];TCursorForm.LastClickWindow:HWND
>005E7A6F    je          005E7A75
 005E7A71    xor         eax,eax
>005E7A73    jmp         005E7A77
 005E7A75    mov         al,1
 005E7A77    mov         byte ptr [ebp-29],al
 005E7A7A    test        bl,bl
>005E7A7C    je          005E7A96
 005E7A7E    mov         eax,dword ptr [ebp-38]
 005E7A81    mov         dword ptr [edi+3E0],eax;TCursorForm.LastClickTime:Double
 005E7A87    mov         eax,dword ptr [ebp-34]
 005E7A8A    mov         dword ptr [edi+3E4],eax;TCursorForm.?f3E4:dword
 005E7A90    mov         dword ptr [edi+3E8],esi;TCursorForm.LastClickWindow:HWND
 005E7A96    test        esi,esi
>005E7A98    je          005E82A1
 005E7A9E    push        0E6
 005E7AA0    push        esi
 005E7AA1    call        user32.GetClassLongW
 005E7AA6    mov         dword ptr [ebp-3C],eax
 005E7AA9    push        esi
 005E7AAA    call        user32.GetDlgCtrlID
 005E7AAF    mov         dword ptr [ebp-28],eax
 005E7AB2    push        1F4
 005E7AB7    lea         eax,[ebp-486]
 005E7ABD    push        eax
 005E7ABE    push        esi
 005E7ABF    call        user32.GetWindowTextW
 005E7AC4    push        1F4
 005E7AC9    lea         eax,[ebp-486]
 005E7ACF    push        eax
 005E7AD0    push        esi
 005E7AD1    call        user32.GetClassNameW
 005E7AD6    lea         eax,[ebp-48C]
 005E7ADC    lea         edx,[ebp-486]
 005E7AE2    mov         ecx,201
 005E7AE7    call        @UStrFromWArray
 005E7AEC    mov         eax,dword ptr [ebp-48C]
 005E7AF2    mov         edx,5E835C;'#32768'
 005E7AF7    call        @UStrEqual
>005E7AFC    je          005E7B2A
 005E7AFE    lea         eax,[ebp-490]
 005E7B04    lea         edx,[ebp-486]
 005E7B0A    mov         ecx,201
 005E7B0F    call        @UStrFromWArray
 005E7B14    mov         eax,dword ptr [ebp-490]
 005E7B1A    mov         edx,5E8378;'ComboLBox'
 005E7B1F    call        @UStrEqual
>005E7B24    je          005E7B2A
 005E7B26    xor         eax,eax
>005E7B28    jmp         005E7B2C
 005E7B2A    mov         al,1
 005E7B2C    mov         byte ptr [ebp-21],al
 005E7B2F    mov         eax,dword ptr [ebp-20]
 005E7B32    shl         eax,10
 005E7B35    mov         edx,dword ptr [ebp-1C]
 005E7B38    and         edx,0FFFF
 005E7B3E    or          eax,edx
 005E7B40    push        eax
 005E7B41    push        0
 005E7B43    push        84
 005E7B48    push        esi
 005E7B49    call        user32.SendMessageW
 005E7B4E    mov         dword ptr [ebp-18],eax
 005E7B51    push        2
 005E7B53    push        esi
 005E7B54    call        user32.GetAncestor
 005E7B59    mov         dword ptr [ebp-14],eax
 005E7B5C    call        user32.GetForegroundWindow
 005E7B61    cmp         eax,dword ptr [ebp-14]
>005E7B64    je          005E7B88
 005E7B66    cmp         byte ptr [ebp-21],0
>005E7B6A    jne         005E7B88
 005E7B6C    movzx       eax,word ptr [ebp-18]
 005E7B70    or          eax,2010000
 005E7B75    push        eax
 005E7B76    mov         eax,dword ptr [ebp-14]
 005E7B79    push        eax
 005E7B7A    push        21
 005E7B7C    push        esi
 005E7B7D    call        user32.SendMessageW
 005E7B82    push        esi
 005E7B83    call        user32.SetForegroundWindow
 005E7B88    mov         eax,dword ptr [edi+3E8];TCursorForm.LastClickWindow:HWND
 005E7B8E    cmp         esi,eax
>005E7B90    je          005E7BE9
 005E7B92    test        eax,eax
>005E7B94    je          005E7BE9
 005E7B96    test        bl,bl
>005E7B98    jne         005E7BE9
 005E7B9A    lea         edx,[ebp-8]
 005E7B9D    push        edx
 005E7B9E    push        eax
 005E7B9F    call        user32.ScreenToClient
 005E7BA4    push        0
 005E7BA6    push        5E8B8C
 005E7BAB    movzx       eax,word ptr [ebp-4]
 005E7BAF    shl         eax,10
 005E7BB2    mov         edx,dword ptr [ebp-8]
 005E7BB5    and         edx,0FFFF
 005E7BBB    or          eax,edx
 005E7BBD    push        eax
 005E7BBE    mov         eax,edi
 005E7BC0    call        TCursorForm.getKeysDown
 005E7BC5    push        eax
 005E7BC6    push        202
 005E7BCB    push        esi
 005E7BCC    call        user32.SendMessageCallbackW
 005E7BD1    mov         eax,dword ptr [ebp-1C]
 005E7BD4    mov         dword ptr [ebp-4C],eax
 005E7BD7    mov         eax,dword ptr [ebp-20]
 005E7BDA    mov         dword ptr [ebp-48],eax
 005E7BDD    mov         eax,dword ptr [ebp-4C]
 005E7BE0    mov         dword ptr [ebp-8],eax
 005E7BE3    mov         eax,dword ptr [ebp-48]
 005E7BE6    mov         dword ptr [ebp-4],eax
 005E7BE9    test        bl,bl
>005E7BEB    je          005E7BFD
 005E7BED    mov         eax,dword ptr [ebp-18]
 005E7BF0    push        eax
 005E7BF1    mov         eax,dword ptr [ebp-14]
 005E7BF4    push        eax
 005E7BF5    push        6
 005E7BF7    push        esi
 005E7BF8    call        user32.SendMessageW
 005E7BFD    cmp         dword ptr [ebp-18],1
>005E7C01    je          005E7F77
 005E7C07    cmp         byte ptr [ebp-29],0
>005E7C0B    je          005E7C33
 005E7C0D    mov         eax,dword ptr [ebp-20]
 005E7C10    shl         eax,10
 005E7C13    mov         edx,dword ptr [ebp-1C]
 005E7C16    and         edx,0FFFF
 005E7C1C    or          eax,edx
 005E7C1E    push        eax
 005E7C1F    mov         eax,dword ptr [ebp-18]
 005E7C22    push        eax
 005E7C23    push        0A3
 005E7C28    push        esi
 005E7C29    call        user32.SendMessageW
>005E7C2E    jmp         005E82A1
 005E7C33    mov         eax,dword ptr [ebp-18]
 005E7C36    add         eax,2
 005E7C39    cmp         eax,17
>005E7C3C    ja          005E7D48
 005E7C42    jmp         dword ptr [eax*4+5E7C49]
 005E7C42    dd          005E7D33
 005E7C42    dd          005E7D3A
 005E7C42    dd          005E7D41
 005E7C42    dd          005E7CF4
 005E7C42    dd          005E7CB3
 005E7C42    dd          005E7CA9
 005E7C42    dd          005E7D1E
 005E7C42    dd          005E7CED
 005E7C42    dd          005E7D25
 005E7C42    dd          005E7D2C
 005E7C42    dd          005E7CC7
 005E7C42    dd          005E7CCE
 005E7C42    dd          005E7D02
 005E7C42    dd          005E7D02
 005E7C42    dd          005E7D09
 005E7C42    dd          005E7D10
 005E7C42    dd          005E7D17
 005E7C42    dd          005E7D09
 005E7C42    dd          005E7D17
 005E7C42    dd          005E7D10
 005E7C42    dd          005E7CFB
 005E7C42    dd          005E7D48
 005E7C42    dd          005E7CE6
 005E7C42    dd          005E7CBD
 005E7CA9    mov         eax,0F160
>005E7CAE    jmp         005E7D4D
 005E7CB3    mov         eax,0F140
>005E7CB8    jmp         005E7D4D
 005E7CBD    mov         eax,0F180
>005E7CC2    jmp         005E7D4D
 005E7CC7    mov         eax,0F020
>005E7CCC    jmp         005E7D4D
 005E7CCE    push        esi
 005E7CCF    call        user32.IsZoomed
 005E7CD4    test        eax,eax
>005E7CD6    je          005E7CDF
 005E7CD8    mov         eax,0F120
>005E7CDD    jmp         005E7D4D
 005E7CDF    mov         eax,0F030
>005E7CE4    jmp         005E7D4D
 005E7CE6    mov         eax,0F060
>005E7CEB    jmp         005E7D4D
 005E7CED    mov         eax,0F090
>005E7CF2    jmp         005E7D4D
 005E7CF4    mov         eax,0F140
>005E7CF9    jmp         005E7D4D
 005E7CFB    mov         eax,0F140
>005E7D00    jmp         005E7D4D
 005E7D02    mov         eax,0F140
>005E7D07    jmp         005E7D4D
 005E7D09    mov         eax,0F140
>005E7D0E    jmp         005E7D4D
 005E7D10    mov         eax,0F140
>005E7D15    jmp         005E7D4D
 005E7D17    mov         eax,0F140
>005E7D1C    jmp         005E7D4D
 005E7D1E    mov         eax,0F140
>005E7D23    jmp         005E7D4D
 005E7D25    mov         eax,0F080
>005E7D2A    jmp         005E7D4D
 005E7D2C    mov         eax,0F070
>005E7D31    jmp         005E7D4D
 005E7D33    mov         eax,0F140
>005E7D38    jmp         005E7D4D
 005E7D3A    mov         eax,0F140
>005E7D3F    jmp         005E7D4D
 005E7D41    mov         eax,0F140
>005E7D46    jmp         005E7D4D
 005E7D48    mov         eax,0F140
 005E7D4D    cmp         eax,0F160
>005E7D52    jne         005E7D73
 005E7D54    test        bl,bl
>005E7D56    je          005E82A1
 005E7D5C    push        10000
 005E7D61    push        0
 005E7D63    push        117
 005E7D68    push        esi
 005E7D69    call        user32.SendMessageW
>005E7D6E    jmp         005E82A1
 005E7D73    cmp         eax,0F080
>005E7D78    jne         005E7DDE
 005E7D7A    test        bl,bl
>005E7D7C    je          005E82A1
 005E7D82    lea         eax,[ebp-8]
 005E7D85    push        eax
 005E7D86    push        esi
 005E7D87    call        user32.ScreenToClient
 005E7D8C    mov         dword ptr [ebp-68],1C
 005E7D93    mov         dword ptr [ebp-64],17
 005E7D9A    lea         eax,[ebp-68]
 005E7D9D    push        eax
 005E7D9E    push        0
 005E7DA0    push        esi
 005E7DA1    call        user32.GetScrollInfo
 005E7DA6    cmp         dword ptr [ebp-8],14
>005E7DAA    jge         005E7DB9
 005E7DAC    mov         eax,dword ptr [ebp-54]
 005E7DAF    cmp         eax,dword ptr [ebp-60]
>005E7DB2    jle         005E7DC4
 005E7DB4    dec         dword ptr [ebp-54]
>005E7DB7    jmp         005E7DC4
 005E7DB9    mov         eax,dword ptr [ebp-54]
 005E7DBC    cmp         eax,dword ptr [ebp-5C]
>005E7DBF    jge         005E7DC4
 005E7DC1    inc         dword ptr [ebp-54]
 005E7DC4    mov         dword ptr [ebp-64],4
 005E7DCB    push        0FF
 005E7DCD    lea         eax,[ebp-68]
 005E7DD0    push        eax
 005E7DD1    push        0
 005E7DD3    push        esi
 005E7DD4    call        user32.SetScrollInfo
>005E7DD9    jmp         005E82A1
 005E7DDE    cmp         eax,0F070
>005E7DE3    jne         005E7E49
 005E7DE5    test        bl,bl
>005E7DE7    je          005E82A1
 005E7DED    lea         eax,[ebp-8]
 005E7DF0    push        eax
 005E7DF1    push        esi
 005E7DF2    call        user32.ScreenToClient
 005E7DF7    mov         dword ptr [ebp-68],1C
 005E7DFE    mov         dword ptr [ebp-64],17
 005E7E05    lea         eax,[ebp-68]
 005E7E08    push        eax
 005E7E09    push        1
 005E7E0B    push        esi
 005E7E0C    call        user32.GetScrollInfo
 005E7E11    cmp         dword ptr [ebp-4],14
>005E7E15    jge         005E7E24
 005E7E17    mov         eax,dword ptr [ebp-54]
 005E7E1A    cmp         eax,dword ptr [ebp-60]
>005E7E1D    jle         005E7E2F
 005E7E1F    dec         dword ptr [ebp-54]
>005E7E22    jmp         005E7E2F
 005E7E24    mov         eax,dword ptr [ebp-54]
 005E7E27    cmp         eax,dword ptr [ebp-5C]
>005E7E2A    jge         005E7E2F
 005E7E2C    inc         dword ptr [ebp-54]
 005E7E2F    mov         dword ptr [ebp-64],4
 005E7E36    push        0FF
 005E7E38    lea         eax,[ebp-68]
 005E7E3B    push        eax
 005E7E3C    push        1
 005E7E3E    push        esi
 005E7E3F    call        user32.SetScrollInfo
>005E7E44    jmp         005E82A1
 005E7E49    cmp         eax,0F140
>005E7E4E    jne         005E7EB2
 005E7E50    test        bl,bl
>005E7E52    je          005E7E83
 005E7E54    mov         eax,dword ptr [ebp-18]
 005E7E57    push        eax
 005E7E58    push        5E8B8C
 005E7E5D    mov         eax,dword ptr [ebp-20]
 005E7E60    shl         eax,10
 005E7E63    mov         edx,dword ptr [ebp-1C]
 005E7E66    and         edx,0FFFF
 005E7E6C    or          eax,edx
 005E7E6E    push        eax
 005E7E6F    mov         eax,dword ptr [ebp-18]
 005E7E72    push        eax
 005E7E73    push        0A1
 005E7E78    push        esi
 005E7E79    call        user32.SendMessageCallbackW
>005E7E7E    jmp         005E82A1
 005E7E83    mov         eax,dword ptr [ebp-18]
 005E7E86    push        eax
 005E7E87    push        5E8B8C
 005E7E8C    mov         eax,dword ptr [ebp-20]
 005E7E8F    shl         eax,10
 005E7E92    mov         edx,dword ptr [ebp-1C]
 005E7E95    and         edx,0FFFF
 005E7E9B    or          eax,edx
 005E7E9D    push        eax
 005E7E9E    mov         eax,dword ptr [ebp-18]
 005E7EA1    push        eax
 005E7EA2    push        0A2
 005E7EA7    push        esi
 005E7EA8    call        user32.SendMessageCallbackW
>005E7EAD    jmp         005E82A1
 005E7EB2    cmp         eax,0F090
>005E7EB7    jne         005E7F41
 005E7EBD    lea         eax,[ebp-10]
 005E7EC0    push        eax
 005E7EC1    call        user32.GetCursorPos
 005E7EC6    mov         eax,dword ptr [ebp-20]
 005E7EC9    push        eax
 005E7ECA    mov         eax,dword ptr [ebp-1C]
 005E7ECD    push        eax
 005E7ECE    call        user32.SetCursorPos
 005E7ED3    push        64
 005E7ED5    call        kernel32.Sleep
 005E7EDA    xor         eax,eax
 005E7EDC    mov         dword ptr [ebp-84],eax
 005E7EE2    xor         eax,eax
 005E7EE4    mov         dword ptr [ebp-80],eax
 005E7EE7    xor         eax,eax
 005E7EE9    mov         dword ptr [ebp-7C],eax
 005E7EEC    xor         eax,eax
 005E7EEE    mov         dword ptr [ebp-78],eax
 005E7EF1    xor         eax,eax
 005E7EF3    mov         dword ptr [ebp-74],eax
 005E7EF6    test        bl,bl
>005E7EF8    je          005E7F03
 005E7EFA    mov         dword ptr [ebp-74],2
>005E7F01    jmp         005E7F0A
 005E7F03    mov         dword ptr [ebp-74],4
 005E7F0A    xor         eax,eax
 005E7F0C    mov         dword ptr [ebp-70],eax
 005E7F0F    xor         eax,eax
 005E7F11    mov         dword ptr [ebp-6C],eax
 005E7F14    push        1C
 005E7F16    lea         eax,[ebp-84]
 005E7F1C    push        eax
 005E7F1D    push        1
 005E7F1F    mov         eax,[0078D96C];^gvar_00816E98:Pointer
 005E7F24    mov         eax,dword ptr [eax]
 005E7F26    call        eax
 005E7F28    push        64
 005E7F2A    call        kernel32.Sleep
 005E7F2F    mov         eax,dword ptr [ebp-0C]
 005E7F32    push        eax
 005E7F33    mov         eax,dword ptr [ebp-10]
 005E7F36    push        eax
 005E7F37    call        user32.SetCursorPos
>005E7F3C    jmp         005E82A1
 005E7F41    test        bl,bl
>005E7F43    je          005E82A1
 005E7F49    push        eax
 005E7F4A    push        5E8B8C
 005E7F4F    mov         edx,dword ptr [ebp-20]
 005E7F52    shl         edx,10
 005E7F55    mov         ecx,dword ptr [ebp-1C]
 005E7F58    and         ecx,0FFFF
 005E7F5E    or          edx,ecx
 005E7F60    push        edx
 005E7F61    and         eax,0FFF0
 005E7F66    push        eax
 005E7F67    push        112
 005E7F6C    push        esi
 005E7F6D    call        user32.SendMessageCallbackW
>005E7F72    jmp         005E82A1
 005E7F77    cmp         byte ptr [ebp-21],0
>005E7F7B    je          005E8005
 005E7F81    lea         eax,[ebp-10]
 005E7F84    push        eax
 005E7F85    call        user32.GetCursorPos
 005E7F8A    mov         eax,dword ptr [ebp-20]
 005E7F8D    push        eax
 005E7F8E    mov         eax,dword ptr [ebp-1C]
 005E7F91    push        eax
 005E7F92    call        user32.SetCursorPos
 005E7F97    push        64
 005E7F99    call        kernel32.Sleep
 005E7F9E    xor         eax,eax
 005E7FA0    mov         dword ptr [ebp-84],eax
 005E7FA6    xor         eax,eax
 005E7FA8    mov         dword ptr [ebp-80],eax
 005E7FAB    xor         eax,eax
 005E7FAD    mov         dword ptr [ebp-7C],eax
 005E7FB0    xor         eax,eax
 005E7FB2    mov         dword ptr [ebp-78],eax
 005E7FB5    xor         eax,eax
 005E7FB7    mov         dword ptr [ebp-74],eax
 005E7FBA    test        bl,bl
>005E7FBC    je          005E7FC7
 005E7FBE    mov         dword ptr [ebp-74],2
>005E7FC5    jmp         005E7FCE
 005E7FC7    mov         dword ptr [ebp-74],4
 005E7FCE    xor         eax,eax
 005E7FD0    mov         dword ptr [ebp-70],eax
 005E7FD3    xor         eax,eax
 005E7FD5    mov         dword ptr [ebp-6C],eax
 005E7FD8    push        1C
 005E7FDA    lea         eax,[ebp-84]
 005E7FE0    push        eax
 005E7FE1    push        1
 005E7FE3    mov         eax,[0078D96C];^gvar_00816E98:Pointer
 005E7FE8    mov         eax,dword ptr [eax]
 005E7FEA    call        eax
 005E7FEC    push        64
 005E7FEE    call        kernel32.Sleep
 005E7FF3    mov         eax,dword ptr [ebp-0C]
 005E7FF6    push        eax
 005E7FF7    mov         eax,dword ptr [ebp-10]
 005E7FFA    push        eax
 005E7FFB    call        user32.SetCursorPos
>005E8000    jmp         005E82A1
 005E8005    push        0
 005E8007    push        esi
 005E8008    call        user32.GetWindowThreadProcessId
 005E800D    push        eax
 005E800E    call        kernel32.GetCurrentThreadId
 005E8013    pop         edx
 005E8014    cmp         edx,eax
>005E8016    jne         005E80C2
 005E801C    lea         eax,[ebp-8]
 005E801F    push        eax
 005E8020    push        esi
 005E8021    call        user32.ScreenToClient
 005E8026    cmp         byte ptr [ebp-29],0
>005E802A    je          005E805A
 005E802C    test        dword ptr [ebp-3C],8
>005E8033    jbe         005E805A
 005E8035    movzx       eax,word ptr [ebp-4]
 005E8039    shl         eax,10
 005E803C    mov         edx,dword ptr [ebp-8]
 005E803F    and         edx,0FFFF
 005E8045    or          eax,edx
 005E8047    push        eax
 005E8048    push        1
 005E804A    push        203
 005E804F    push        esi
 005E8050    call        user32.SendMessageW
>005E8055    jmp         005E82A1
 005E805A    test        bl,bl
>005E805C    je          005E8089
 005E805E    movzx       eax,word ptr [ebp-4]
 005E8062    shl         eax,10
 005E8065    mov         edx,dword ptr [ebp-8]
 005E8068    and         edx,0FFFF
 005E806E    or          eax,edx
 005E8070    push        eax
 005E8071    mov         eax,edi
 005E8073    call        TCursorForm.getKeysDown
 005E8078    push        eax
 005E8079    push        201
 005E807E    push        esi
 005E807F    call        user32.SendMessageW
>005E8084    jmp         005E82A1
 005E8089    push        esi
 005E808A    push        0
 005E808C    push        0BD11
 005E8091    push        esi
 005E8092    call        user32.SendMessageW
 005E8097    movzx       eax,word ptr [ebp-4]
 005E809B    shl         eax,10
 005E809E    mov         edx,dword ptr [ebp-8]
 005E80A1    and         edx,0FFFF
 005E80A7    or          eax,edx
 005E80A9    push        eax
 005E80AA    mov         eax,edi
 005E80AC    call        TCursorForm.getKeysDown
 005E80B1    push        eax
 005E80B2    push        202
 005E80B7    push        esi
 005E80B8    call        user32.SendMessageW
>005E80BD    jmp         005E82A1
 005E80C2    cmp         byte ptr [edi+3D4],0;TCursorForm.JumpOnRelease:Boolean
>005E80C9    je          005E8129
 005E80CB    test        bl,bl
>005E80CD    jne         005E8129
 005E80CF    xor         eax,eax
 005E80D1    mov         dword ptr [ebp-84],eax
 005E80D7    xor         eax,eax
 005E80D9    mov         dword ptr [ebp-80],eax
 005E80DC    xor         eax,eax
 005E80DE    mov         dword ptr [ebp-7C],eax
 005E80E1    xor         eax,eax
 005E80E3    mov         dword ptr [ebp-78],eax
 005E80E6    xor         eax,eax
 005E80E8    mov         dword ptr [ebp-74],eax
 005E80EB    test        bl,bl
>005E80ED    je          005E80F8
 005E80EF    mov         dword ptr [ebp-74],2
>005E80F6    jmp         005E80FF
 005E80F8    mov         dword ptr [ebp-74],4
 005E80FF    xor         eax,eax
 005E8101    mov         dword ptr [ebp-70],eax
 005E8104    xor         eax,eax
 005E8106    mov         dword ptr [ebp-6C],eax
 005E8109    push        1C
 005E810B    lea         eax,[ebp-84]
 005E8111    push        eax
 005E8112    push        1
 005E8114    mov         eax,[0078D96C];^gvar_00816E98:Pointer
 005E8119    mov         eax,dword ptr [eax]
 005E811B    call        eax
 005E811D    push        64
 005E811F    call        kernel32.Sleep
>005E8124    jmp         005E82A1
 005E8129    test        bl,bl
>005E812B    je          005E81E9
 005E8131    lea         eax,[ebp-494]
 005E8137    lea         edx,[ebp-486]
 005E813D    mov         ecx,201
 005E8142    call        @UStrFromWArray
 005E8147    mov         eax,dword ptr [ebp-494]
 005E814D    mov         edx,5E8398;'deletemeMinesweeper'
 005E8152    call        @UStrEqual
>005E8157    jne         005E81E9
 005E815D    lea         eax,[ebp-10]
 005E8160    push        eax
 005E8161    call        user32.GetCursorPos
 005E8166    mov         eax,dword ptr [ebp-10]
 005E8169    mov         dword ptr [edi+3D8],eax;TCursorForm.JumpX:Integer
 005E816F    mov         eax,dword ptr [ebp-0C]
 005E8172    mov         dword ptr [edi+3DC],eax;TCursorForm.JumpY:Integer
 005E8178    mov         byte ptr [edi+3D4],1;TCursorForm.JumpOnRelease:Boolean
 005E817F    mov         eax,dword ptr [ebp-20]
 005E8182    push        eax
 005E8183    mov         eax,dword ptr [ebp-1C]
 005E8186    push        eax
 005E8187    call        user32.SetCursorPos
 005E818C    push        3E8
 005E8191    call        kernel32.Sleep
 005E8196    xor         eax,eax
 005E8198    mov         dword ptr [ebp-84],eax
 005E819E    xor         eax,eax
 005E81A0    mov         dword ptr [ebp-80],eax
 005E81A3    xor         eax,eax
 005E81A5    mov         dword ptr [ebp-7C],eax
 005E81A8    xor         eax,eax
 005E81AA    mov         dword ptr [ebp-78],eax
 005E81AD    xor         eax,eax
 005E81AF    mov         dword ptr [ebp-74],eax
 005E81B2    test        bl,bl
>005E81B4    je          005E81BF
 005E81B6    mov         dword ptr [ebp-74],2
>005E81BD    jmp         005E81C6
 005E81BF    mov         dword ptr [ebp-74],4
 005E81C6    xor         eax,eax
 005E81C8    mov         dword ptr [ebp-70],eax
 005E81CB    xor         eax,eax
 005E81CD    mov         dword ptr [ebp-6C],eax
 005E81D0    push        1C
 005E81D2    lea         eax,[ebp-84]
 005E81D8    push        eax
 005E81D9    push        1
 005E81DB    mov         eax,[0078D96C];^gvar_00816E98:Pointer
 005E81E0    mov         eax,dword ptr [eax]
 005E81E2    call        eax
>005E81E4    jmp         005E82A1
 005E81E9    lea         eax,[ebp-8]
 005E81EC    push        eax
 005E81ED    push        esi
 005E81EE    call        user32.ScreenToClient
 005E81F3    test        bl,bl
 005E81F5    cmp         byte ptr [ebp-29],0
>005E81F9    je          005E8233
 005E81FB    test        dword ptr [ebp-3C],8
>005E8202    jbe         005E8233
 005E8204    push        0
 005E8206    push        5E8B8C
 005E820B    movzx       eax,word ptr [ebp-4]
 005E820F    shl         eax,10
 005E8212    mov         edx,dword ptr [ebp-8]
 005E8215    and         edx,0FFFF
 005E821B    or          eax,edx
 005E821D    push        eax
 005E821E    mov         eax,edi
 005E8220    call        TCursorForm.getKeysDown
 005E8225    push        eax
 005E8226    push        203
 005E822B    push        esi
 005E822C    call        user32.SendMessageCallbackW
>005E8231    jmp         005E82A1
 005E8233    test        bl,bl
>005E8235    je          005E8274
 005E8237    push        0
 005E8239    push        5E8B8C
 005E823E    movzx       eax,word ptr [ebp-4]
 005E8242    shl         eax,10
 005E8245    mov         edx,dword ptr [ebp-8]
 005E8248    and         edx,0FFFF
 005E824E    or          eax,edx
 005E8250    push        eax
 005E8251    mov         eax,edi
 005E8253    call        TCursorForm.getKeysDown
 005E8258    push        eax
 005E8259    push        201
 005E825E    push        esi
 005E825F    call        user32.SendMessageCallbackW
 005E8264    push        esi
 005E8265    push        0
 005E8267    push        0BD11
 005E826C    push        esi
 005E826D    call        user32.SendMessageW
>005E8272    jmp         005E82A1
 005E8274    push        0
 005E8276    push        5E8B8C
 005E827B    movzx       eax,word ptr [ebp-4]
 005E827F    shl         eax,10
 005E8282    mov         edx,dword ptr [ebp-8]
 005E8285    and         edx,0FFFF
 005E828B    or          eax,edx
 005E828D    push        eax
 005E828E    mov         eax,edi
 005E8290    call        TCursorForm.getKeysDown
 005E8295    push        eax
 005E8296    push        202
 005E829B    push        esi
 005E829C    call        user32.SendMessageCallbackW
 005E82A1    lea         eax,[ebp-498]
 005E82A7    lea         edx,[ebp-486]
 005E82AD    mov         ecx,201
 005E82B2    call        @UStrFromWArray
 005E82B7    mov         eax,dword ptr [ebp-498]
 005E82BD    mov         edx,5E83CC;'Button'
 005E82C2    call        @UStrEqual
>005E82C7    jne         005E82EE
 005E82C9    cmp         dword ptr [ebp-28],0
>005E82CD    je          005E82EE
 005E82CF    test        bl,bl
>005E82D1    jne         005E82EE
 005E82D3    push        esi
 005E82D4    movzx       eax,word ptr [ebp-28]
 005E82D8    or          ax,0
 005E82DC    movzx       eax,ax
 005E82DF    push        eax
 005E82E0    push        111
 005E82E5    mov         eax,dword ptr [ebp-14]
 005E82E8    push        eax
 005E82E9    call        user32.SendMessageW
 005E82EE    mov         eax,edi
 005E82F0    call        TCursorForm.ShowMe
 005E82F5    cmp         byte ptr [edi+3D4],0;TCursorForm.JumpOnRelease:Boolean
>005E82FC    je          005E8323
 005E82FE    test        bl,bl
>005E8300    jne         005E8323
 005E8302    mov         byte ptr [edi+3D4],0;TCursorForm.JumpOnRelease:Boolean
 005E8309    push        64
 005E830B    call        kernel32.Sleep
 005E8310    mov         eax,dword ptr [edi+3DC];TCursorForm.JumpY:Integer
 005E8316    push        eax
 005E8317    mov         eax,dword ptr [edi+3D8];TCursorForm.JumpX:Integer
 005E831D    push        eax
 005E831E    call        user32.SetCursorPos
 005E8323    xor         eax,eax
 005E8325    pop         edx
 005E8326    pop         ecx
 005E8327    pop         ecx
 005E8328    mov         dword ptr fs:[eax],edx
 005E832B    push        5E8348
 005E8330    lea         eax,[ebp-498]
 005E8336    mov         edx,4
 005E833B    call        @UStrArrayClr
 005E8340    ret
>005E8341    jmp         @HandleFinally
>005E8346    jmp         005E8330
 005E8348    pop         edi
 005E8349    pop         esi
 005E834A    pop         ebx
 005E834B    mov         esp,ebp
 005E834D    pop         ebp
 005E834E    ret
*}
end;

//005E83DC
procedure TCursorForm.SetLeftButton2(value:Boolean);
begin
{*
 005E83DC    push        ebx
 005E83DD    push        esi
 005E83DE    mov         ebx,edx
 005E83E0    mov         esi,eax
 005E83E2    cmp         bl,byte ptr [esi+3C0];TCursorForm.FLeftButton:Boolean
>005E83E8    je          005E841A
 005E83EA    test        bl,bl
>005E83EC    je          005E8402
 005E83EE    push        0
 005E83F0    push        0
 005E83F2    mov         cl,1
 005E83F4    mov         edx,201
 005E83F9    mov         eax,esi
 005E83FB    call        TCursorForm.ConveyMessage
>005E8400    jmp         005E8414
 005E8402    push        0
 005E8404    push        0
 005E8406    mov         cl,1
 005E8408    mov         edx,202
 005E840D    mov         eax,esi
 005E840F    call        TCursorForm.ConveyMessage
 005E8414    mov         byte ptr [esi+3C0],bl;TCursorForm.FLeftButton:Boolean
 005E841A    pop         esi
 005E841B    pop         ebx
 005E841C    ret
*}
end;

//005E8420
procedure TCursorForm.SetMiddleButton(value:Boolean);
begin
{*
 005E8420    push        ebx
 005E8421    push        esi
 005E8422    push        edi
 005E8423    push        ebp
 005E8424    add         esp,0FFFFFFE8
 005E8427    mov         ebx,edx
 005E8429    mov         edi,eax
 005E842B    cmp         bl,byte ptr [edi+3C1];TCursorForm.FMiddleButton:Boolean
>005E8431    je          005E8615
 005E8437    mov         byte ptr [edi+3C1],bl;TCursorForm.FMiddleButton:Boolean
 005E843D    mov         eax,edi
 005E843F    call        TCursorForm.GetX
 005E8444    mov         ebp,eax
 005E8446    mov         eax,edi
 005E8448    call        TCursorForm.GetY
 005E844D    mov         dword ptr [esp+0C],eax
 005E8451    mov         dword ptr [esp+10],ebp
 005E8455    mov         eax,dword ptr [esp+0C]
 005E8459    mov         dword ptr [esp+14],eax
 005E845D    mov         eax,dword ptr [esp+10]
 005E8461    mov         dword ptr [esp],eax
 005E8464    mov         eax,dword ptr [esp+14]
 005E8468    mov         dword ptr [esp+4],eax
 005E846C    mov         eax,edi
 005E846E    call        TCursorForm.HideMe
 005E8473    push        dword ptr [esp+4]
 005E8477    push        dword ptr [esp+4]
 005E847B    call        user32.WindowFromPoint
 005E8480    mov         esi,eax
 005E8482    test        esi,esi
>005E8484    je          005E860E
 005E848A    mov         eax,dword ptr [esp+0C]
 005E848E    shl         eax,10
 005E8491    mov         edx,ebp
 005E8493    and         edx,0FFFF
 005E8499    or          eax,edx
 005E849B    push        eax
 005E849C    push        0
 005E849E    push        84
 005E84A3    push        esi
 005E84A4    call        user32.SendMessageW
 005E84A9    mov         dword ptr [esp+8],eax
 005E84AD    push        2
 005E84AF    push        esi
 005E84B0    call        user32.GetAncestor
 005E84B5    test        bl,bl
>005E84B7    je          005E84C7
 005E84B9    mov         edx,dword ptr [esp+8]
 005E84BD    push        edx
 005E84BE    push        eax
 005E84BF    push        6
 005E84C1    push        esi
 005E84C2    call        user32.SendMessageW
 005E84C7    cmp         dword ptr [esp+8],1
>005E84CC    je          005E8530
 005E84CE    test        bl,bl
>005E84D0    je          005E8501
 005E84D2    mov         eax,dword ptr [esp+8]
 005E84D6    push        eax
 005E84D7    push        5E8B8C
 005E84DC    mov         eax,dword ptr [esp+14]
 005E84E0    shl         eax,10
 005E84E3    and         ebp,0FFFF
 005E84E9    or          eax,ebp
 005E84EB    push        eax
 005E84EC    mov         eax,dword ptr [esp+14]
 005E84F0    push        eax
 005E84F1    push        0A7
 005E84F6    push        esi
 005E84F7    call        user32.SendMessageCallbackW
>005E84FC    jmp         005E860E
 005E8501    mov         eax,dword ptr [esp+8]
 005E8505    push        eax
 005E8506    push        5E8B8C
 005E850B    mov         eax,dword ptr [esp+14]
 005E850F    shl         eax,10
 005E8512    and         ebp,0FFFF
 005E8518    or          eax,ebp
 005E851A    push        eax
 005E851B    mov         eax,dword ptr [esp+14]
 005E851F    push        eax
 005E8520    push        0A8
 005E8525    push        esi
 005E8526    call        user32.SendMessageCallbackW
>005E852B    jmp         005E860E
 005E8530    push        0
 005E8532    push        esi
 005E8533    call        user32.GetWindowThreadProcessId
 005E8538    mov         ebp,eax
 005E853A    call        kernel32.GetCurrentThreadId
 005E853F    cmp         ebp,eax
>005E8541    jne         005E85A3
 005E8543    push        esp
 005E8544    push        esi
 005E8545    call        user32.ScreenToClient
 005E854A    test        bl,bl
>005E854C    je          005E857A
 005E854E    movzx       eax,word ptr [esp+4]
 005E8553    shl         eax,10
 005E8556    mov         edx,dword ptr [esp]
 005E8559    and         edx,0FFFF
 005E855F    or          eax,edx
 005E8561    push        eax
 005E8562    mov         eax,edi
 005E8564    call        TCursorForm.getKeysDown
 005E8569    push        eax
 005E856A    push        207
 005E856F    push        esi
 005E8570    call        user32.SendMessageW
>005E8575    jmp         005E860E
 005E857A    movzx       eax,word ptr [esp+4]
 005E857F    shl         eax,10
 005E8582    mov         edx,dword ptr [esp]
 005E8585    and         edx,0FFFF
 005E858B    or          eax,edx
 005E858D    push        eax
 005E858E    mov         eax,edi
 005E8590    call        TCursorForm.getKeysDown
 005E8595    push        eax
 005E8596    push        208
 005E859B    push        esi
 005E859C    call        user32.SendMessageW
>005E85A1    jmp         005E860E
 005E85A3    push        esp
 005E85A4    push        esi
 005E85A5    call        user32.ScreenToClient
 005E85AA    test        bl,bl
>005E85AC    je          005E85DF
 005E85AE    push        0
 005E85B0    push        5E8B8C
 005E85B5    movzx       eax,word ptr [esp+0C]
 005E85BA    shl         eax,10
 005E85BD    mov         edx,dword ptr [esp+8]
 005E85C1    and         edx,0FFFF
 005E85C7    or          eax,edx
 005E85C9    push        eax
 005E85CA    mov         eax,edi
 005E85CC    call        TCursorForm.getKeysDown
 005E85D1    push        eax
 005E85D2    push        207
 005E85D7    push        esi
 005E85D8    call        user32.SendMessageCallbackW
>005E85DD    jmp         005E860E
 005E85DF    push        0
 005E85E1    push        5E8B8C
 005E85E6    movzx       eax,word ptr [esp+0C]
 005E85EB    shl         eax,10
 005E85EE    mov         edx,dword ptr [esp+8]
 005E85F2    and         edx,0FFFF
 005E85F8    or          eax,edx
 005E85FA    push        eax
 005E85FB    mov         eax,edi
 005E85FD    call        TCursorForm.getKeysDown
 005E8602    push        eax
 005E8603    push        208
 005E8608    push        esi
 005E8609    call        user32.SendMessageCallbackW
 005E860E    mov         eax,edi
 005E8610    call        TCursorForm.ShowMe
 005E8615    add         esp,18
 005E8618    pop         ebp
 005E8619    pop         edi
 005E861A    pop         esi
 005E861B    pop         ebx
 005E861C    ret
*}
end;

//005E8620
procedure sub_005E8620(?:Pointer; ?:string);
begin
{*
 005E8620    push        ebp
 005E8621    mov         ebp,esp
 005E8623    push        ecx
 005E8624    push        ebx
 005E8625    mov         dword ptr [ebp-4],edx
 005E8628    mov         ebx,eax
 005E862A    mov         eax,dword ptr [ebp-4]
 005E862D    call        @UStrAddRef
 005E8632    xor         eax,eax
 005E8634    push        ebp
 005E8635    push        5E86A3
 005E863A    push        dword ptr fs:[eax]
 005E863D    mov         dword ptr fs:[eax],esp
 005E8640    mov         eax,dword ptr [ebp-4]
 005E8643    mov         edx,dword ptr [ebx+3FC]
 005E8649    call        @UStrEqual
>005E864E    je          005E868D
 005E8650    lea         eax,[ebx+3FC]
 005E8656    mov         edx,dword ptr [ebp-4]
 005E8659    call        @UStrAsg
 005E865E    mov         edx,dword ptr [ebp-4]
 005E8661    mov         eax,dword ptr [ebx+38C]
 005E8667    call        TControl.SetText
 005E866C    mov         eax,dword ptr [ebx+38C]
 005E8672    mov         edx,dword ptr [eax+40]
 005E8675    add         edx,dword ptr [eax+48]
 005E8678    mov         eax,edx
 005E867A    cmp         eax,30
>005E867D    jge         005E8684
 005E867F    mov         eax,30
 005E8684    mov         edx,eax
 005E8686    mov         eax,ebx
 005E8688    call        TControl.SetWidth
 005E868D    xor         eax,eax
 005E868F    pop         edx
 005E8690    pop         ecx
 005E8691    pop         ecx
 005E8692    mov         dword ptr fs:[eax],edx
 005E8695    push        5E86AA
 005E869A    lea         eax,[ebp-4]
 005E869D    call        @UStrClr
 005E86A2    ret
>005E86A3    jmp         @HandleFinally
>005E86A8    jmp         005E869A
 005E86AA    pop         ebx
 005E86AB    pop         ecx
 005E86AC    pop         ebp
 005E86AD    ret
*}
end;

//005E86B0
procedure sub_005E86B0(?:TCursorForm; ?:UnicodeString);
begin
{*
 005E86B0    push        ebp
 005E86B1    mov         ebp,esp
 005E86B3    push        ecx
 005E86B4    push        ebx
 005E86B5    mov         dword ptr [ebp-4],edx
 005E86B8    mov         ebx,eax
 005E86BA    mov         eax,dword ptr [ebp-4]
 005E86BD    call        @UStrAddRef
 005E86C2    xor         eax,eax
 005E86C4    push        ebp
 005E86C5    push        5E871B
 005E86CA    push        dword ptr fs:[eax]
 005E86CD    mov         dword ptr fs:[eax],esp
 005E86D0    cmp         dword ptr [ebp-4],0
>005E86D4    je          005E86DD
 005E86D6    mov         byte ptr [ebx+3C3],1
 005E86DD    mov         eax,dword ptr [ebp-4]
 005E86E0    mov         edx,dword ptr [ebx+400]
 005E86E6    call        @UStrEqual
>005E86EB    je          005E8705
 005E86ED    lea         eax,[ebx+400]
 005E86F3    mov         edx,dword ptr [ebp-4]
 005E86F6    call        @UStrAsg
 005E86FB    mov         edx,dword ptr [ebp-4]
 005E86FE    mov         eax,ebx
 005E8700    call        TCursorForm.ChangeCursor3
 005E8705    xor         eax,eax
 005E8707    pop         edx
 005E8708    pop         ecx
 005E8709    pop         ecx
 005E870A    mov         dword ptr fs:[eax],edx
 005E870D    push        5E8722
 005E8712    lea         eax,[ebp-4]
 005E8715    call        @UStrClr
 005E871A    ret
>005E871B    jmp         @HandleFinally
>005E8720    jmp         005E8712
 005E8722    pop         ebx
 005E8723    pop         ecx
 005E8724    pop         ebp
 005E8725    ret
*}
end;

//005E8728
procedure TCursorForm.SetRightButton(value:Boolean);
begin
{*
 005E8728    push        ebx
 005E8729    push        esi
 005E872A    push        edi
 005E872B    push        ebp
 005E872C    add         esp,0FFFFFFE8
 005E872F    mov         ebx,edx
 005E8731    mov         edi,eax
 005E8733    cmp         bl,byte ptr [edi+3C2];TCursorForm.FRightButton:Boolean
>005E8739    je          005E891D
 005E873F    mov         byte ptr [edi+3C2],bl;TCursorForm.FRightButton:Boolean
 005E8745    mov         eax,edi
 005E8747    call        TCursorForm.GetX
 005E874C    mov         ebp,eax
 005E874E    mov         eax,edi
 005E8750    call        TCursorForm.GetY
 005E8755    mov         dword ptr [esp+0C],eax
 005E8759    mov         dword ptr [esp+10],ebp
 005E875D    mov         eax,dword ptr [esp+0C]
 005E8761    mov         dword ptr [esp+14],eax
 005E8765    mov         eax,dword ptr [esp+10]
 005E8769    mov         dword ptr [esp],eax
 005E876C    mov         eax,dword ptr [esp+14]
 005E8770    mov         dword ptr [esp+4],eax
 005E8774    mov         eax,edi
 005E8776    call        TCursorForm.HideMe
 005E877B    push        dword ptr [esp+4]
 005E877F    push        dword ptr [esp+4]
 005E8783    call        user32.WindowFromPoint
 005E8788    mov         esi,eax
 005E878A    test        esi,esi
>005E878C    je          005E8916
 005E8792    mov         eax,dword ptr [esp+0C]
 005E8796    shl         eax,10
 005E8799    mov         edx,ebp
 005E879B    and         edx,0FFFF
 005E87A1    or          eax,edx
 005E87A3    push        eax
 005E87A4    push        0
 005E87A6    push        84
 005E87AB    push        esi
 005E87AC    call        user32.SendMessageW
 005E87B1    mov         dword ptr [esp+8],eax
 005E87B5    push        2
 005E87B7    push        esi
 005E87B8    call        user32.GetAncestor
 005E87BD    test        bl,bl
>005E87BF    je          005E87CF
 005E87C1    mov         edx,dword ptr [esp+8]
 005E87C5    push        edx
 005E87C6    push        eax
 005E87C7    push        6
 005E87C9    push        esi
 005E87CA    call        user32.SendMessageW
 005E87CF    cmp         dword ptr [esp+8],1
>005E87D4    je          005E8838
 005E87D6    test        bl,bl
>005E87D8    je          005E8809
 005E87DA    mov         eax,dword ptr [esp+8]
 005E87DE    push        eax
 005E87DF    push        5E8B8C
 005E87E4    mov         eax,dword ptr [esp+14]
 005E87E8    shl         eax,10
 005E87EB    and         ebp,0FFFF
 005E87F1    or          eax,ebp
 005E87F3    push        eax
 005E87F4    mov         eax,dword ptr [esp+14]
 005E87F8    push        eax
 005E87F9    push        0A4
 005E87FE    push        esi
 005E87FF    call        user32.SendMessageCallbackW
>005E8804    jmp         005E8916
 005E8809    mov         eax,dword ptr [esp+8]
 005E880D    push        eax
 005E880E    push        5E8B8C
 005E8813    mov         eax,dword ptr [esp+14]
 005E8817    shl         eax,10
 005E881A    and         ebp,0FFFF
 005E8820    or          eax,ebp
 005E8822    push        eax
 005E8823    mov         eax,dword ptr [esp+14]
 005E8827    push        eax
 005E8828    push        0A5
 005E882D    push        esi
 005E882E    call        user32.SendMessageCallbackW
>005E8833    jmp         005E8916
 005E8838    push        0
 005E883A    push        esi
 005E883B    call        user32.GetWindowThreadProcessId
 005E8840    mov         ebp,eax
 005E8842    call        kernel32.GetCurrentThreadId
 005E8847    cmp         ebp,eax
>005E8849    jne         005E88AB
 005E884B    push        esp
 005E884C    push        esi
 005E884D    call        user32.ScreenToClient
 005E8852    test        bl,bl
>005E8854    je          005E8882
 005E8856    movzx       eax,word ptr [esp+4]
 005E885B    shl         eax,10
 005E885E    mov         edx,dword ptr [esp]
 005E8861    and         edx,0FFFF
 005E8867    or          eax,edx
 005E8869    push        eax
 005E886A    mov         eax,edi
 005E886C    call        TCursorForm.getKeysDown
 005E8871    push        eax
 005E8872    push        204
 005E8877    push        esi
 005E8878    call        user32.SendMessageW
>005E887D    jmp         005E8916
 005E8882    movzx       eax,word ptr [esp+4]
 005E8887    shl         eax,10
 005E888A    mov         edx,dword ptr [esp]
 005E888D    and         edx,0FFFF
 005E8893    or          eax,edx
 005E8895    push        eax
 005E8896    mov         eax,edi
 005E8898    call        TCursorForm.getKeysDown
 005E889D    push        eax
 005E889E    push        205
 005E88A3    push        esi
 005E88A4    call        user32.SendMessageW
>005E88A9    jmp         005E8916
 005E88AB    push        esp
 005E88AC    push        esi
 005E88AD    call        user32.ScreenToClient
 005E88B2    test        bl,bl
>005E88B4    je          005E88E7
 005E88B6    push        0
 005E88B8    push        5E8B8C
 005E88BD    movzx       eax,word ptr [esp+0C]
 005E88C2    shl         eax,10
 005E88C5    mov         edx,dword ptr [esp+8]
 005E88C9    and         edx,0FFFF
 005E88CF    or          eax,edx
 005E88D1    push        eax
 005E88D2    mov         eax,edi
 005E88D4    call        TCursorForm.getKeysDown
 005E88D9    push        eax
 005E88DA    push        204
 005E88DF    push        esi
 005E88E0    call        user32.SendMessageCallbackW
>005E88E5    jmp         005E8916
 005E88E7    push        0
 005E88E9    push        5E8B8C
 005E88EE    movzx       eax,word ptr [esp+0C]
 005E88F3    shl         eax,10
 005E88F6    mov         edx,dword ptr [esp+8]
 005E88FA    and         edx,0FFFF
 005E8900    or          eax,edx
 005E8902    push        eax
 005E8903    mov         eax,edi
 005E8905    call        TCursorForm.getKeysDown
 005E890A    push        eax
 005E890B    push        205
 005E8910    push        esi
 005E8911    call        user32.SendMessageCallbackW
 005E8916    mov         eax,edi
 005E8918    call        TCursorForm.ShowMe
 005E891D    add         esp,18
 005E8920    pop         ebp
 005E8921    pop         edi
 005E8922    pop         esi
 005E8923    pop         ebx
 005E8924    ret
*}
end;

//005E8928
{*function sub_005E8928(?:HWND):?;
begin
 005E8928    push        ebx
 005E8929    mov         ebx,eax
 005E892B    cmp         dword ptr ds:[8161F4],0;gvar_008161F4:Pointer
>005E8932    je          005E8943
 005E8934    push        ebx
 005E8935    call        dword ptr ds:[8161F4]
 005E893B    cmp         eax,1
 005E893E    sbb         eax,eax
 005E8940    inc         eax
 005E8941    pop         ebx
 005E8942    ret
 005E8943    cmp         dword ptr ds:[8161F0],0;gvar_008161F0:Pointer
>005E894A    je          005E8963
 005E894C    push        0
 005E894E    push        ebx
 005E894F    call        user32.GetWindowThreadProcessId
 005E8954    push        eax
 005E8955    call        dword ptr ds:[8161F0]
 005E895B    cmp         eax,1
 005E895E    sbb         eax,eax
 005E8960    inc         eax
>005E8961    jmp         005E8965
 005E8963    xor         eax,eax
 005E8965    pop         ebx
 005E8966    ret
end;*}

//005E8968
procedure sub_005E8968;
begin
{*
 005E8968    push        ebx
 005E8969    push        5E89B8;'user32.dll'
 005E896E    call        kernel32.GetModuleHandleW
 005E8973    mov         ebx,eax
 005E8975    test        ebx,ebx
>005E8977    je          005E89B3
 005E8979    mov         eax,[0078DB58];^gvar_00784C7C
 005E897E    cmp         dword ptr [eax],2
>005E8981    jne         005E899C
 005E8983    push        5E89D0;'IsHungAppWindow'
 005E8988    push        ebx
 005E8989    call        GetProcAddress
 005E898E    mov         [008161F4],eax;gvar_008161F4:Pointer
 005E8993    xor         eax,eax
 005E8995    mov         [008161F0],eax;gvar_008161F0:Pointer
>005E899A    jmp         005E89B3
 005E899C    xor         eax,eax
 005E899E    mov         [008161F4],eax;gvar_008161F4:Pointer
 005E89A3    push        5E89F0;'IsHungThread'
 005E89A8    push        ebx
 005E89A9    call        GetProcAddress
 005E89AE    mov         [008161F0],eax;gvar_008161F0:Pointer
 005E89B3    pop         ebx
 005E89B4    ret
*}
end;

//005E8A0C
function TCursorForm.ConveyMessage(Msg:Cardinal; UsePos:Boolean; LParam:Cardinal; WParam:Cardinal):Cardinal;
begin
{*
 005E8A0C    push        ebp
 005E8A0D    mov         ebp,esp
 005E8A0F    add         esp,0FFFFFFE4
 005E8A12    push        ebx
 005E8A13    push        esi
 005E8A14    push        edi
 005E8A15    mov         byte ptr [ebp-1],cl
 005E8A18    mov         edi,edx
 005E8A1A    mov         ebx,eax
 005E8A1C    mov         eax,ebx
 005E8A1E    call        TCursorForm.GetX
 005E8A23    mov         esi,eax
 005E8A25    mov         eax,ebx
 005E8A27    call        TCursorForm.GetY
 005E8A2C    mov         dword ptr [ebp-1C],esi
 005E8A2F    mov         dword ptr [ebp-18],eax
 005E8A32    mov         eax,dword ptr [ebp-1C]
 005E8A35    mov         dword ptr [ebp-0C],eax
 005E8A38    mov         eax,dword ptr [ebp-18]
 005E8A3B    mov         dword ptr [ebp-8],eax
 005E8A3E    mov         eax,ebx
 005E8A40    call        TCursorForm.HideMe
 005E8A45    push        dword ptr [ebp-8]
 005E8A48    push        dword ptr [ebp-0C]
 005E8A4B    call        user32.WindowFromPoint
 005E8A50    mov         esi,eax
 005E8A52    test        esi,esi
>005E8A54    jne         005E8A5A
 005E8A56    xor         esi,esi
>005E8A58    jmp         005E8A99
 005E8A5A    lea         eax,[ebp-14]
 005E8A5D    push        eax
 005E8A5E    call        user32.GetCursorPos
 005E8A63    lea         eax,[ebp-0C]
 005E8A66    push        eax
 005E8A67    push        esi
 005E8A68    call        user32.ScreenToClient
 005E8A6D    cmp         byte ptr [ebp-1],0
>005E8A71    je          005E8A88
 005E8A73    movzx       eax,word ptr [ebp-8]
 005E8A77    shl         eax,10
 005E8A7A    mov         edx,dword ptr [ebp-0C]
 005E8A7D    and         edx,0FFFF
 005E8A83    or          eax,edx
 005E8A85    mov         dword ptr [ebp+8],eax
 005E8A88    mov         eax,dword ptr [ebp+8]
 005E8A8B    push        eax
 005E8A8C    mov         eax,dword ptr [ebp+0C]
 005E8A8F    push        eax
 005E8A90    push        edi
 005E8A91    push        esi
 005E8A92    call        user32.SendMessageW
 005E8A97    mov         esi,eax
 005E8A99    mov         eax,ebx
 005E8A9B    call        TCursorForm.ShowMe
 005E8AA0    mov         eax,esi
 005E8AA2    pop         edi
 005E8AA3    pop         esi
 005E8AA4    pop         ebx
 005E8AA5    mov         esp,ebp
 005E8AA7    pop         ebp
 005E8AA8    ret         8
*}
end;

//005E8AAC
procedure TCursorForm.CreateParams(var Params:TCreateParams);
begin
{*
 005E8AAC    push        ebx
 005E8AAD    mov         ebx,edx
 005E8AAF    mov         edx,ebx
 005E8AB1    call        TCustomForm.CreateParams
 005E8AB6    mov         eax,dword ptr [ebx+8];TCreateParams.ExStyle:DWORD
 005E8AB9    or          eax,8
 005E8ABC    or          eax,80
 005E8AC1    mov         dword ptr [ebx+8],eax;TCreateParams.ExStyle:DWORD
 005E8AC4    call        user32.GetDesktopWindow
 005E8AC9    mov         dword ptr [ebx+1C],eax;TCreateParams.WndParent:HWND
 005E8ACC    pop         ebx
 005E8ACD    ret
*}
end;

//005E8AD0
procedure TCursorForm.HideMe;
begin
{*
 005E8AD0    push        ebx
 005E8AD1    mov         ebx,eax
 005E8AD3    mov         eax,ebx
 005E8AD5    call        TCursorForm.GetX
 005E8ADA    mov         dword ptr [ebx+3C4],eax;TCursorForm.MyHiddenX:Integer
 005E8AE0    mov         eax,ebx
 005E8AE2    call        TCursorForm.GetY
 005E8AE7    mov         dword ptr [ebx+3C8],eax;TCursorForm.MyHiddenY:Integer
 005E8AED    push        2619
 005E8AF2    mov         eax,dword ptr [ebx+4C];TCursorForm.FHeight:Integer
 005E8AF5    push        eax
 005E8AF6    mov         eax,dword ptr [ebx+48];TCursorForm.FWidth:Integer
 005E8AF9    push        eax
 005E8AFA    push        0FFFFFC18
 005E8AFF    push        0FFFFFC18
 005E8B04    push        0FF
 005E8B06    mov         eax,ebx
 005E8B08    call        TWinControl.GetHandle
 005E8B0D    push        eax
 005E8B0E    call        user32.SetWindowPos
 005E8B13    pop         ebx
 005E8B14    ret
*}
end;

//005E8B18
procedure TCursorForm.ShowMe;
begin
{*
 005E8B18    push        ebp
 005E8B19    mov         ebp,esp
 005E8B1B    push        ebx
 005E8B1C    push        esi
 005E8B1D    push        edi
 005E8B1E    mov         ebx,eax
 005E8B20    mov         esi,dword ptr ds:[5E5828];TCursorForm
 005E8B26    add         esi,0FFFFFFCC
 005E8B29    mov         eax,dword ptr [esi]
 005E8B2B    push        eax
 005E8B2C    push        ebx
 005E8B2D    call        kernel32.IsBadReadPtr
 005E8B32    test        eax,eax
>005E8B34    je          005E8B3A
 005E8B36    mov         al,1
>005E8B38    jmp         005E8B49
 005E8B3A    mov         eax,dword ptr [esi]
 005E8B3C    push        eax
 005E8B3D    push        ebx
 005E8B3E    call        kernel32.IsBadWritePtr
 005E8B43    cmp         eax,1
 005E8B46    sbb         eax,eax
 005E8B48    inc         eax
 005E8B49    test        al,al
>005E8B4B    jne         005E8B84
 005E8B4D    xor         eax,eax
 005E8B4F    push        ebp
 005E8B50    push        5E8B7A
 005E8B55    push        dword ptr fs:[eax]
 005E8B58    mov         dword ptr fs:[eax],esp
 005E8B5B    push        1
 005E8B5D    mov         ecx,dword ptr [ebx+3C8];TCursorForm.MyHiddenY:Integer
 005E8B63    mov         edx,dword ptr [ebx+3C4];TCursorForm.MyHiddenX:Integer
 005E8B69    mov         eax,ebx
 005E8B6B    call        TCursorForm.SetPos
 005E8B70    xor         eax,eax
 005E8B72    pop         edx
 005E8B73    pop         ecx
 005E8B74    pop         ecx
 005E8B75    mov         dword ptr fs:[eax],edx
>005E8B78    jmp         005E8B84
>005E8B7A    jmp         @HandleAnyException
 005E8B7F    call        @DoneExcept
 005E8B84    pop         edi
 005E8B85    pop         esi
 005E8B86    pop         ebx
 005E8B87    pop         ebp
 005E8B88    ret
*}
end;

//005E8B94
procedure TCursorForm.WmSysCommand(var Msg:TMessage);
begin
{*
 005E8B94    ret
*}
end;

//005E8B98
procedure TCursorForm.FormDeactivate(Sender:TObject);
begin
{*
 005E8B98    ret
*}
end;

//005E8B9C
procedure TCursorForm.Timer1Timer(Sender:TObject);
begin
{*
 005E8B9C    push        ebx
 005E8B9D    mov         ebx,eax
 005E8B9F    cmp         byte ptr [ebx+3CC],0;TCursorForm.IsIE:Boolean
>005E8BA6    je          005E8BD1
 005E8BA8    cmp         dword ptr [ebx+3BC],0;TCursorForm.OldWindowHandle:HWND
>005E8BAF    je          005E8BD1
 005E8BB1    mov         eax,dword ptr [ebx+3D0];TCursorForm.IePos:Cardinal
 005E8BB7    push        eax
 005E8BB8    mov         eax,ebx
 005E8BBA    call        TCursorForm.getKeysDown
 005E8BBF    push        eax
 005E8BC0    push        200
 005E8BC5    mov         eax,dword ptr [ebx+3BC];TCursorForm.OldWindowHandle:HWND
 005E8BCB    push        eax
 005E8BCC    call        user32.PostMessageW
 005E8BD1    pop         ebx
 005E8BD2    ret
*}
end;

//005E8BD4
procedure sub_005E8BD4(?:Pointer; ?:Boolean);
begin
{*
 005E8BD4    push        ebx
 005E8BD5    push        esi
 005E8BD6    push        edi
 005E8BD7    push        ebp
 005E8BD8    add         esp,0FFFFFFE8
 005E8BDB    mov         ebx,edx
 005E8BDD    mov         edi,eax
 005E8BDF    cmp         bl,byte ptr [edi+394]
>005E8BE5    je          005E8DF1
 005E8BEB    mov         byte ptr [edi+394],bl
 005E8BF1    mov         eax,edi
 005E8BF3    call        TCursorForm.GetX
 005E8BF8    mov         ebp,eax
 005E8BFA    mov         eax,edi
 005E8BFC    call        TCursorForm.GetY
 005E8C01    mov         dword ptr [esp+0C],eax
 005E8C05    mov         dword ptr [esp+10],ebp
 005E8C09    mov         eax,dword ptr [esp+0C]
 005E8C0D    mov         dword ptr [esp+14],eax
 005E8C11    mov         eax,dword ptr [esp+10]
 005E8C15    mov         dword ptr [esp],eax
 005E8C18    mov         eax,dword ptr [esp+14]
 005E8C1C    mov         dword ptr [esp+4],eax
 005E8C20    mov         eax,edi
 005E8C22    call        TCursorForm.HideMe
 005E8C27    push        dword ptr [esp+4]
 005E8C2B    push        dword ptr [esp+4]
 005E8C2F    call        user32.WindowFromPoint
 005E8C34    mov         esi,eax
 005E8C36    test        esi,esi
>005E8C38    je          005E8DEA
 005E8C3E    mov         eax,dword ptr [esp+0C]
 005E8C42    shl         eax,10
 005E8C45    mov         edx,ebp
 005E8C47    and         edx,0FFFF
 005E8C4D    or          eax,edx
 005E8C4F    push        eax
 005E8C50    push        0
 005E8C52    push        84
 005E8C57    push        esi
 005E8C58    call        user32.SendMessageW
 005E8C5D    mov         dword ptr [esp+8],eax
 005E8C61    push        2
 005E8C63    push        esi
 005E8C64    call        user32.GetAncestor
 005E8C69    test        bl,bl
>005E8C6B    je          005E8C7B
 005E8C6D    mov         edx,dword ptr [esp+8]
 005E8C71    push        edx
 005E8C72    push        eax
 005E8C73    push        6
 005E8C75    push        esi
 005E8C76    call        user32.SendMessageW
 005E8C7B    cmp         dword ptr [esp+8],1
>005E8C80    je          005E8CF8
 005E8C82    test        bl,bl
>005E8C84    je          005E8CBF
 005E8C86    mov         eax,dword ptr [esp+8]
 005E8C8A    push        eax
 005E8C8B    push        5E8B8C
 005E8C90    mov         eax,dword ptr [esp+14]
 005E8C94    shl         eax,10
 005E8C97    and         ebp,0FFFF
 005E8C9D    or          eax,ebp
 005E8C9F    push        eax
 005E8CA0    mov         eax,dword ptr [esp+14]
 005E8CA4    and         eax,0FFFF
 005E8CA9    or          eax,10000
 005E8CAE    push        eax
 005E8CAF    push        0AB
 005E8CB4    push        esi
 005E8CB5    call        user32.SendMessageCallbackW
>005E8CBA    jmp         005E8DEA
 005E8CBF    mov         eax,dword ptr [esp+8]
 005E8CC3    push        eax
 005E8CC4    push        5E8B8C
 005E8CC9    mov         eax,dword ptr [esp+14]
 005E8CCD    shl         eax,10
 005E8CD0    and         ebp,0FFFF
 005E8CD6    or          eax,ebp
 005E8CD8    push        eax
 005E8CD9    mov         eax,dword ptr [esp+14]
 005E8CDD    and         eax,0FFFF
 005E8CE2    or          eax,10000
 005E8CE7    push        eax
 005E8CE8    push        0AC
 005E8CED    push        esi
 005E8CEE    call        user32.SendMessageCallbackW
>005E8CF3    jmp         005E8DEA
 005E8CF8    push        0
 005E8CFA    push        esi
 005E8CFB    call        user32.GetWindowThreadProcessId
 005E8D00    mov         ebp,eax
 005E8D02    call        kernel32.GetCurrentThreadId
 005E8D07    cmp         ebp,eax
>005E8D09    jne         005E8D75
 005E8D0B    push        esp
 005E8D0C    push        esi
 005E8D0D    call        user32.ScreenToClient
 005E8D12    test        bl,bl
>005E8D14    je          005E8D47
 005E8D16    movzx       eax,word ptr [esp+4]
 005E8D1B    shl         eax,10
 005E8D1E    mov         edx,dword ptr [esp]
 005E8D21    and         edx,0FFFF
 005E8D27    or          eax,edx
 005E8D29    push        eax
 005E8D2A    mov         eax,edi
 005E8D2C    call        TCursorForm.getKeysDown
 005E8D31    or          eax,10000
 005E8D36    push        eax
 005E8D37    push        20B
 005E8D3C    push        esi
 005E8D3D    call        user32.SendMessageW
>005E8D42    jmp         005E8DEA
 005E8D47    movzx       eax,word ptr [esp+4]
 005E8D4C    shl         eax,10
 005E8D4F    mov         edx,dword ptr [esp]
 005E8D52    and         edx,0FFFF
 005E8D58    or          eax,edx
 005E8D5A    push        eax
 005E8D5B    mov         eax,edi
 005E8D5D    call        TCursorForm.getKeysDown
 005E8D62    or          eax,10000
 005E8D67    push        eax
 005E8D68    push        20C
 005E8D6D    push        esi
 005E8D6E    call        user32.SendMessageW
>005E8D73    jmp         005E8DEA
 005E8D75    push        esp
 005E8D76    push        esi
 005E8D77    call        user32.ScreenToClient
 005E8D7C    test        bl,bl
>005E8D7E    je          005E8DB6
 005E8D80    push        0
 005E8D82    push        5E8B8C
 005E8D87    movzx       eax,word ptr [esp+0C]
 005E8D8C    shl         eax,10
 005E8D8F    mov         edx,dword ptr [esp+8]
 005E8D93    and         edx,0FFFF
 005E8D99    or          eax,edx
 005E8D9B    push        eax
 005E8D9C    mov         eax,edi
 005E8D9E    call        TCursorForm.getKeysDown
 005E8DA3    or          eax,10000
 005E8DA8    push        eax
 005E8DA9    push        20B
 005E8DAE    push        esi
 005E8DAF    call        user32.SendMessageCallbackW
>005E8DB4    jmp         005E8DEA
 005E8DB6    push        0
 005E8DB8    push        5E8B8C
 005E8DBD    movzx       eax,word ptr [esp+0C]
 005E8DC2    shl         eax,10
 005E8DC5    mov         edx,dword ptr [esp+8]
 005E8DC9    and         edx,0FFFF
 005E8DCF    or          eax,edx
 005E8DD1    push        eax
 005E8DD2    mov         eax,edi
 005E8DD4    call        TCursorForm.getKeysDown
 005E8DD9    or          eax,10000
 005E8DDE    push        eax
 005E8DDF    push        20C
 005E8DE4    push        esi
 005E8DE5    call        user32.SendMessageCallbackW
 005E8DEA    mov         eax,edi
 005E8DEC    call        TCursorForm.ShowMe
 005E8DF1    add         esp,18
 005E8DF4    pop         ebp
 005E8DF5    pop         edi
 005E8DF6    pop         esi
 005E8DF7    pop         ebx
 005E8DF8    ret
*}
end;

//005E8DFC
procedure sub_005E8DFC(?:Pointer; ?:Boolean);
begin
{*
 005E8DFC    push        ebx
 005E8DFD    push        esi
 005E8DFE    push        edi
 005E8DFF    push        ebp
 005E8E00    add         esp,0FFFFFFE8
 005E8E03    mov         ebx,edx
 005E8E05    mov         edi,eax
 005E8E07    cmp         bl,byte ptr [edi+395]
>005E8E0D    je          005E9019
 005E8E13    mov         byte ptr [edi+395],bl
 005E8E19    mov         eax,edi
 005E8E1B    call        TCursorForm.GetX
 005E8E20    mov         ebp,eax
 005E8E22    mov         eax,edi
 005E8E24    call        TCursorForm.GetY
 005E8E29    mov         dword ptr [esp+0C],eax
 005E8E2D    mov         dword ptr [esp+10],ebp
 005E8E31    mov         eax,dword ptr [esp+0C]
 005E8E35    mov         dword ptr [esp+14],eax
 005E8E39    mov         eax,dword ptr [esp+10]
 005E8E3D    mov         dword ptr [esp],eax
 005E8E40    mov         eax,dword ptr [esp+14]
 005E8E44    mov         dword ptr [esp+4],eax
 005E8E48    mov         eax,edi
 005E8E4A    call        TCursorForm.HideMe
 005E8E4F    push        dword ptr [esp+4]
 005E8E53    push        dword ptr [esp+4]
 005E8E57    call        user32.WindowFromPoint
 005E8E5C    mov         esi,eax
 005E8E5E    test        esi,esi
>005E8E60    je          005E9012
 005E8E66    mov         eax,dword ptr [esp+0C]
 005E8E6A    shl         eax,10
 005E8E6D    mov         edx,ebp
 005E8E6F    and         edx,0FFFF
 005E8E75    or          eax,edx
 005E8E77    push        eax
 005E8E78    push        0
 005E8E7A    push        84
 005E8E7F    push        esi
 005E8E80    call        user32.SendMessageW
 005E8E85    mov         dword ptr [esp+8],eax
 005E8E89    push        2
 005E8E8B    push        esi
 005E8E8C    call        user32.GetAncestor
 005E8E91    test        bl,bl
>005E8E93    je          005E8EA3
 005E8E95    mov         edx,dword ptr [esp+8]
 005E8E99    push        edx
 005E8E9A    push        eax
 005E8E9B    push        6
 005E8E9D    push        esi
 005E8E9E    call        user32.SendMessageW
 005E8EA3    cmp         dword ptr [esp+8],1
>005E8EA8    je          005E8F20
 005E8EAA    test        bl,bl
>005E8EAC    je          005E8EE7
 005E8EAE    mov         eax,dword ptr [esp+8]
 005E8EB2    push        eax
 005E8EB3    push        5E8B8C
 005E8EB8    mov         eax,dword ptr [esp+14]
 005E8EBC    shl         eax,10
 005E8EBF    and         ebp,0FFFF
 005E8EC5    or          eax,ebp
 005E8EC7    push        eax
 005E8EC8    mov         eax,dword ptr [esp+14]
 005E8ECC    and         eax,0FFFF
 005E8ED1    or          eax,20000
 005E8ED6    push        eax
 005E8ED7    push        0AB
 005E8EDC    push        esi
 005E8EDD    call        user32.SendMessageCallbackW
>005E8EE2    jmp         005E9012
 005E8EE7    mov         eax,dword ptr [esp+8]
 005E8EEB    push        eax
 005E8EEC    push        5E8B8C
 005E8EF1    mov         eax,dword ptr [esp+14]
 005E8EF5    shl         eax,10
 005E8EF8    and         ebp,0FFFF
 005E8EFE    or          eax,ebp
 005E8F00    push        eax
 005E8F01    mov         eax,dword ptr [esp+14]
 005E8F05    and         eax,0FFFF
 005E8F0A    or          eax,20000
 005E8F0F    push        eax
 005E8F10    push        0AC
 005E8F15    push        esi
 005E8F16    call        user32.SendMessageCallbackW
>005E8F1B    jmp         005E9012
 005E8F20    push        0
 005E8F22    push        esi
 005E8F23    call        user32.GetWindowThreadProcessId
 005E8F28    mov         ebp,eax
 005E8F2A    call        kernel32.GetCurrentThreadId
 005E8F2F    cmp         ebp,eax
>005E8F31    jne         005E8F9D
 005E8F33    push        esp
 005E8F34    push        esi
 005E8F35    call        user32.ScreenToClient
 005E8F3A    test        bl,bl
>005E8F3C    je          005E8F6F
 005E8F3E    movzx       eax,word ptr [esp+4]
 005E8F43    shl         eax,10
 005E8F46    mov         edx,dword ptr [esp]
 005E8F49    and         edx,0FFFF
 005E8F4F    or          eax,edx
 005E8F51    push        eax
 005E8F52    mov         eax,edi
 005E8F54    call        TCursorForm.getKeysDown
 005E8F59    or          eax,20000
 005E8F5E    push        eax
 005E8F5F    push        20B
 005E8F64    push        esi
 005E8F65    call        user32.SendMessageW
>005E8F6A    jmp         005E9012
 005E8F6F    movzx       eax,word ptr [esp+4]
 005E8F74    shl         eax,10
 005E8F77    mov         edx,dword ptr [esp]
 005E8F7A    and         edx,0FFFF
 005E8F80    or          eax,edx
 005E8F82    push        eax
 005E8F83    mov         eax,edi
 005E8F85    call        TCursorForm.getKeysDown
 005E8F8A    or          eax,20000
 005E8F8F    push        eax
 005E8F90    push        20C
 005E8F95    push        esi
 005E8F96    call        user32.SendMessageW
>005E8F9B    jmp         005E9012
 005E8F9D    push        esp
 005E8F9E    push        esi
 005E8F9F    call        user32.ScreenToClient
 005E8FA4    test        bl,bl
>005E8FA6    je          005E8FDE
 005E8FA8    push        0
 005E8FAA    push        5E8B8C
 005E8FAF    movzx       eax,word ptr [esp+0C]
 005E8FB4    shl         eax,10
 005E8FB7    mov         edx,dword ptr [esp+8]
 005E8FBB    and         edx,0FFFF
 005E8FC1    or          eax,edx
 005E8FC3    push        eax
 005E8FC4    mov         eax,edi
 005E8FC6    call        TCursorForm.getKeysDown
 005E8FCB    or          eax,20000
 005E8FD0    push        eax
 005E8FD1    push        20B
 005E8FD6    push        esi
 005E8FD7    call        user32.SendMessageCallbackW
>005E8FDC    jmp         005E9012
 005E8FDE    push        0
 005E8FE0    push        5E8B8C
 005E8FE5    movzx       eax,word ptr [esp+0C]
 005E8FEA    shl         eax,10
 005E8FED    mov         edx,dword ptr [esp+8]
 005E8FF1    and         edx,0FFFF
 005E8FF7    or          eax,edx
 005E8FF9    push        eax
 005E8FFA    mov         eax,edi
 005E8FFC    call        TCursorForm.getKeysDown
 005E9001    or          eax,20000
 005E9006    push        eax
 005E9007    push        20C
 005E900C    push        esi
 005E900D    call        user32.SendMessageCallbackW
 005E9012    mov         eax,edi
 005E9014    call        TCursorForm.ShowMe
 005E9019    add         esp,18
 005E901C    pop         ebp
 005E901D    pop         edi
 005E901E    pop         esi
 005E901F    pop         ebx
 005E9020    ret
*}
end;

//005E9024
procedure sub_005E9024(?:Pointer; ?:Boolean);
begin
{*
 005E9024    push        ebx
 005E9025    push        esi
 005E9026    push        edi
 005E9027    push        ebp
 005E9028    add         esp,0FFFFFFE8
 005E902B    mov         ebx,edx
 005E902D    mov         edi,eax
 005E902F    cmp         bl,byte ptr [edi+399]
>005E9035    je          005E9241
 005E903B    mov         byte ptr [edi+399],bl
 005E9041    mov         eax,edi
 005E9043    call        TCursorForm.GetX
 005E9048    mov         ebp,eax
 005E904A    mov         eax,edi
 005E904C    call        TCursorForm.GetY
 005E9051    mov         dword ptr [esp+0C],eax
 005E9055    mov         dword ptr [esp+10],ebp
 005E9059    mov         eax,dword ptr [esp+0C]
 005E905D    mov         dword ptr [esp+14],eax
 005E9061    mov         eax,dword ptr [esp+10]
 005E9065    mov         dword ptr [esp],eax
 005E9068    mov         eax,dword ptr [esp+14]
 005E906C    mov         dword ptr [esp+4],eax
 005E9070    mov         eax,edi
 005E9072    call        TCursorForm.HideMe
 005E9077    push        dword ptr [esp+4]
 005E907B    push        dword ptr [esp+4]
 005E907F    call        user32.WindowFromPoint
 005E9084    mov         esi,eax
 005E9086    test        esi,esi
>005E9088    je          005E923A
 005E908E    mov         eax,dword ptr [esp+0C]
 005E9092    shl         eax,10
 005E9095    mov         edx,ebp
 005E9097    and         edx,0FFFF
 005E909D    or          eax,edx
 005E909F    push        eax
 005E90A0    push        0
 005E90A2    push        84
 005E90A7    push        esi
 005E90A8    call        user32.SendMessageW
 005E90AD    mov         dword ptr [esp+8],eax
 005E90B1    push        2
 005E90B3    push        esi
 005E90B4    call        user32.GetAncestor
 005E90B9    test        bl,bl
>005E90BB    je          005E90CB
 005E90BD    mov         edx,dword ptr [esp+8]
 005E90C1    push        edx
 005E90C2    push        eax
 005E90C3    push        6
 005E90C5    push        esi
 005E90C6    call        user32.SendMessageW
 005E90CB    cmp         dword ptr [esp+8],1
>005E90D0    je          005E9148
 005E90D2    test        bl,bl
>005E90D4    je          005E910F
 005E90D6    mov         eax,dword ptr [esp+8]
 005E90DA    push        eax
 005E90DB    push        5E8B8C
 005E90E0    mov         eax,dword ptr [esp+14]
 005E90E4    shl         eax,10
 005E90E7    and         ebp,0FFFF
 005E90ED    or          eax,ebp
 005E90EF    push        eax
 005E90F0    mov         eax,dword ptr [esp+14]
 005E90F4    and         eax,0FFFF
 005E90F9    or          eax,40000
 005E90FE    push        eax
 005E90FF    push        0AB
 005E9104    push        esi
 005E9105    call        user32.SendMessageCallbackW
>005E910A    jmp         005E923A
 005E910F    mov         eax,dword ptr [esp+8]
 005E9113    push        eax
 005E9114    push        5E8B8C
 005E9119    mov         eax,dword ptr [esp+14]
 005E911D    shl         eax,10
 005E9120    and         ebp,0FFFF
 005E9126    or          eax,ebp
 005E9128    push        eax
 005E9129    mov         eax,dword ptr [esp+14]
 005E912D    and         eax,0FFFF
 005E9132    or          eax,40000
 005E9137    push        eax
 005E9138    push        0AC
 005E913D    push        esi
 005E913E    call        user32.SendMessageCallbackW
>005E9143    jmp         005E923A
 005E9148    push        0
 005E914A    push        esi
 005E914B    call        user32.GetWindowThreadProcessId
 005E9150    mov         ebp,eax
 005E9152    call        kernel32.GetCurrentThreadId
 005E9157    cmp         ebp,eax
>005E9159    jne         005E91C5
 005E915B    push        esp
 005E915C    push        esi
 005E915D    call        user32.ScreenToClient
 005E9162    test        bl,bl
>005E9164    je          005E9197
 005E9166    movzx       eax,word ptr [esp+4]
 005E916B    shl         eax,10
 005E916E    mov         edx,dword ptr [esp]
 005E9171    and         edx,0FFFF
 005E9177    or          eax,edx
 005E9179    push        eax
 005E917A    mov         eax,edi
 005E917C    call        TCursorForm.getKeysDown
 005E9181    or          eax,40000
 005E9186    push        eax
 005E9187    push        20B
 005E918C    push        esi
 005E918D    call        user32.SendMessageW
>005E9192    jmp         005E923A
 005E9197    movzx       eax,word ptr [esp+4]
 005E919C    shl         eax,10
 005E919F    mov         edx,dword ptr [esp]
 005E91A2    and         edx,0FFFF
 005E91A8    or          eax,edx
 005E91AA    push        eax
 005E91AB    mov         eax,edi
 005E91AD    call        TCursorForm.getKeysDown
 005E91B2    or          eax,40000
 005E91B7    push        eax
 005E91B8    push        20C
 005E91BD    push        esi
 005E91BE    call        user32.SendMessageW
>005E91C3    jmp         005E923A
 005E91C5    push        esp
 005E91C6    push        esi
 005E91C7    call        user32.ScreenToClient
 005E91CC    test        bl,bl
>005E91CE    je          005E9206
 005E91D0    push        0
 005E91D2    push        5E8B8C
 005E91D7    movzx       eax,word ptr [esp+0C]
 005E91DC    shl         eax,10
 005E91DF    mov         edx,dword ptr [esp+8]
 005E91E3    and         edx,0FFFF
 005E91E9    or          eax,edx
 005E91EB    push        eax
 005E91EC    mov         eax,edi
 005E91EE    call        TCursorForm.getKeysDown
 005E91F3    or          eax,40000
 005E91F8    push        eax
 005E91F9    push        20B
 005E91FE    push        esi
 005E91FF    call        user32.SendMessageCallbackW
>005E9204    jmp         005E923A
 005E9206    push        0
 005E9208    push        5E8B8C
 005E920D    movzx       eax,word ptr [esp+0C]
 005E9212    shl         eax,10
 005E9215    mov         edx,dword ptr [esp+8]
 005E9219    and         edx,0FFFF
 005E921F    or          eax,edx
 005E9221    push        eax
 005E9222    mov         eax,edi
 005E9224    call        TCursorForm.getKeysDown
 005E9229    or          eax,40000
 005E922E    push        eax
 005E922F    push        20C
 005E9234    push        esi
 005E9235    call        user32.SendMessageCallbackW
 005E923A    mov         eax,edi
 005E923C    call        TCursorForm.ShowMe
 005E9241    add         esp,18
 005E9244    pop         ebp
 005E9245    pop         edi
 005E9246    pop         esi
 005E9247    pop         ebx
 005E9248    ret
*}
end;

//005E924C
procedure sub_005E924C(?:Pointer; ?:Boolean);
begin
{*
 005E924C    push        ebx
 005E924D    push        esi
 005E924E    push        edi
 005E924F    push        ebp
 005E9250    add         esp,0FFFFFFE8
 005E9253    mov         ebx,edx
 005E9255    mov         edi,eax
 005E9257    cmp         bl,byte ptr [edi+398]
>005E925D    je          005E9469
 005E9263    mov         byte ptr [edi+398],bl
 005E9269    mov         eax,edi
 005E926B    call        TCursorForm.GetX
 005E9270    mov         ebp,eax
 005E9272    mov         eax,edi
 005E9274    call        TCursorForm.GetY
 005E9279    mov         dword ptr [esp+0C],eax
 005E927D    mov         dword ptr [esp+10],ebp
 005E9281    mov         eax,dword ptr [esp+0C]
 005E9285    mov         dword ptr [esp+14],eax
 005E9289    mov         eax,dword ptr [esp+10]
 005E928D    mov         dword ptr [esp],eax
 005E9290    mov         eax,dword ptr [esp+14]
 005E9294    mov         dword ptr [esp+4],eax
 005E9298    mov         eax,edi
 005E929A    call        TCursorForm.HideMe
 005E929F    push        dword ptr [esp+4]
 005E92A3    push        dword ptr [esp+4]
 005E92A7    call        user32.WindowFromPoint
 005E92AC    mov         esi,eax
 005E92AE    test        esi,esi
>005E92B0    je          005E9462
 005E92B6    mov         eax,dword ptr [esp+0C]
 005E92BA    shl         eax,10
 005E92BD    mov         edx,ebp
 005E92BF    and         edx,0FFFF
 005E92C5    or          eax,edx
 005E92C7    push        eax
 005E92C8    push        0
 005E92CA    push        84
 005E92CF    push        esi
 005E92D0    call        user32.SendMessageW
 005E92D5    mov         dword ptr [esp+8],eax
 005E92D9    push        2
 005E92DB    push        esi
 005E92DC    call        user32.GetAncestor
 005E92E1    test        bl,bl
>005E92E3    je          005E92F3
 005E92E5    mov         edx,dword ptr [esp+8]
 005E92E9    push        edx
 005E92EA    push        eax
 005E92EB    push        6
 005E92ED    push        esi
 005E92EE    call        user32.SendMessageW
 005E92F3    cmp         dword ptr [esp+8],1
>005E92F8    je          005E9370
 005E92FA    test        bl,bl
>005E92FC    je          005E9337
 005E92FE    mov         eax,dword ptr [esp+8]
 005E9302    push        eax
 005E9303    push        5E8B8C
 005E9308    mov         eax,dword ptr [esp+14]
 005E930C    shl         eax,10
 005E930F    and         ebp,0FFFF
 005E9315    or          eax,ebp
 005E9317    push        eax
 005E9318    mov         eax,dword ptr [esp+14]
 005E931C    and         eax,0FFFF
 005E9321    or          eax,80000
 005E9326    push        eax
 005E9327    push        0AB
 005E932C    push        esi
 005E932D    call        user32.SendMessageCallbackW
>005E9332    jmp         005E9462
 005E9337    mov         eax,dword ptr [esp+8]
 005E933B    push        eax
 005E933C    push        5E8B8C
 005E9341    mov         eax,dword ptr [esp+14]
 005E9345    shl         eax,10
 005E9348    and         ebp,0FFFF
 005E934E    or          eax,ebp
 005E9350    push        eax
 005E9351    mov         eax,dword ptr [esp+14]
 005E9355    and         eax,0FFFF
 005E935A    or          eax,80000
 005E935F    push        eax
 005E9360    push        0AC
 005E9365    push        esi
 005E9366    call        user32.SendMessageCallbackW
>005E936B    jmp         005E9462
 005E9370    push        0
 005E9372    push        esi
 005E9373    call        user32.GetWindowThreadProcessId
 005E9378    mov         ebp,eax
 005E937A    call        kernel32.GetCurrentThreadId
 005E937F    cmp         ebp,eax
>005E9381    jne         005E93ED
 005E9383    push        esp
 005E9384    push        esi
 005E9385    call        user32.ScreenToClient
 005E938A    test        bl,bl
>005E938C    je          005E93BF
 005E938E    movzx       eax,word ptr [esp+4]
 005E9393    shl         eax,10
 005E9396    mov         edx,dword ptr [esp]
 005E9399    and         edx,0FFFF
 005E939F    or          eax,edx
 005E93A1    push        eax
 005E93A2    mov         eax,edi
 005E93A4    call        TCursorForm.getKeysDown
 005E93A9    or          eax,80000
 005E93AE    push        eax
 005E93AF    push        20B
 005E93B4    push        esi
 005E93B5    call        user32.SendMessageW
>005E93BA    jmp         005E9462
 005E93BF    movzx       eax,word ptr [esp+4]
 005E93C4    shl         eax,10
 005E93C7    mov         edx,dword ptr [esp]
 005E93CA    and         edx,0FFFF
 005E93D0    or          eax,edx
 005E93D2    push        eax
 005E93D3    mov         eax,edi
 005E93D5    call        TCursorForm.getKeysDown
 005E93DA    or          eax,80000
 005E93DF    push        eax
 005E93E0    push        20C
 005E93E5    push        esi
 005E93E6    call        user32.SendMessageW
>005E93EB    jmp         005E9462
 005E93ED    push        esp
 005E93EE    push        esi
 005E93EF    call        user32.ScreenToClient
 005E93F4    test        bl,bl
>005E93F6    je          005E942E
 005E93F8    push        0
 005E93FA    push        5E8B8C
 005E93FF    movzx       eax,word ptr [esp+0C]
 005E9404    shl         eax,10
 005E9407    mov         edx,dword ptr [esp+8]
 005E940B    and         edx,0FFFF
 005E9411    or          eax,edx
 005E9413    push        eax
 005E9414    mov         eax,edi
 005E9416    call        TCursorForm.getKeysDown
 005E941B    or          eax,80000
 005E9420    push        eax
 005E9421    push        20B
 005E9426    push        esi
 005E9427    call        user32.SendMessageCallbackW
>005E942C    jmp         005E9462
 005E942E    push        0
 005E9430    push        5E8B8C
 005E9435    movzx       eax,word ptr [esp+0C]
 005E943A    shl         eax,10
 005E943D    mov         edx,dword ptr [esp+8]
 005E9441    and         edx,0FFFF
 005E9447    or          eax,edx
 005E9449    push        eax
 005E944A    mov         eax,edi
 005E944C    call        TCursorForm.getKeysDown
 005E9451    or          eax,80000
 005E9456    push        eax
 005E9457    push        20C
 005E945C    push        esi
 005E945D    call        user32.SendMessageCallbackW
 005E9462    mov         eax,edi
 005E9464    call        TCursorForm.ShowMe
 005E9469    add         esp,18
 005E946C    pop         ebp
 005E946D    pop         edi
 005E946E    pop         esi
 005E946F    pop         ebx
 005E9470    ret
*}
end;

//005E9474
procedure sub_005E9474(?:Pointer; ?:Boolean);
begin
{*
 005E9474    push        ebx
 005E9475    push        esi
 005E9476    push        edi
 005E9477    push        ebp
 005E9478    add         esp,0FFFFFFE8
 005E947B    mov         ebx,edx
 005E947D    mov         edi,eax
 005E947F    cmp         bl,byte ptr [edi+398]
>005E9485    je          005E9691
 005E948B    mov         byte ptr [edi+398],bl
 005E9491    mov         eax,edi
 005E9493    call        TCursorForm.GetX
 005E9498    mov         ebp,eax
 005E949A    mov         eax,edi
 005E949C    call        TCursorForm.GetY
 005E94A1    mov         dword ptr [esp+0C],eax
 005E94A5    mov         dword ptr [esp+10],ebp
 005E94A9    mov         eax,dword ptr [esp+0C]
 005E94AD    mov         dword ptr [esp+14],eax
 005E94B1    mov         eax,dword ptr [esp+10]
 005E94B5    mov         dword ptr [esp],eax
 005E94B8    mov         eax,dword ptr [esp+14]
 005E94BC    mov         dword ptr [esp+4],eax
 005E94C0    mov         eax,edi
 005E94C2    call        TCursorForm.HideMe
 005E94C7    push        dword ptr [esp+4]
 005E94CB    push        dword ptr [esp+4]
 005E94CF    call        user32.WindowFromPoint
 005E94D4    mov         esi,eax
 005E94D6    test        esi,esi
>005E94D8    je          005E968A
 005E94DE    mov         eax,dword ptr [esp+0C]
 005E94E2    shl         eax,10
 005E94E5    mov         edx,ebp
 005E94E7    and         edx,0FFFF
 005E94ED    or          eax,edx
 005E94EF    push        eax
 005E94F0    push        0
 005E94F2    push        84
 005E94F7    push        esi
 005E94F8    call        user32.SendMessageW
 005E94FD    mov         dword ptr [esp+8],eax
 005E9501    push        2
 005E9503    push        esi
 005E9504    call        user32.GetAncestor
 005E9509    test        bl,bl
>005E950B    je          005E951B
 005E950D    mov         edx,dword ptr [esp+8]
 005E9511    push        edx
 005E9512    push        eax
 005E9513    push        6
 005E9515    push        esi
 005E9516    call        user32.SendMessageW
 005E951B    cmp         dword ptr [esp+8],1
>005E9520    je          005E9598
 005E9522    test        bl,bl
>005E9524    je          005E955F
 005E9526    mov         eax,dword ptr [esp+8]
 005E952A    push        eax
 005E952B    push        5E8B8C
 005E9530    mov         eax,dword ptr [esp+14]
 005E9534    shl         eax,10
 005E9537    and         ebp,0FFFF
 005E953D    or          eax,ebp
 005E953F    push        eax
 005E9540    mov         eax,dword ptr [esp+14]
 005E9544    and         eax,0FFFF
 005E9549    or          eax,100000
 005E954E    push        eax
 005E954F    push        0AB
 005E9554    push        esi
 005E9555    call        user32.SendMessageCallbackW
>005E955A    jmp         005E968A
 005E955F    mov         eax,dword ptr [esp+8]
 005E9563    push        eax
 005E9564    push        5E8B8C
 005E9569    mov         eax,dword ptr [esp+14]
 005E956D    shl         eax,10
 005E9570    and         ebp,0FFFF
 005E9576    or          eax,ebp
 005E9578    push        eax
 005E9579    mov         eax,dword ptr [esp+14]
 005E957D    and         eax,0FFFF
 005E9582    or          eax,100000
 005E9587    push        eax
 005E9588    push        0AC
 005E958D    push        esi
 005E958E    call        user32.SendMessageCallbackW
>005E9593    jmp         005E968A
 005E9598    push        0
 005E959A    push        esi
 005E959B    call        user32.GetWindowThreadProcessId
 005E95A0    mov         ebp,eax
 005E95A2    call        kernel32.GetCurrentThreadId
 005E95A7    cmp         ebp,eax
>005E95A9    jne         005E9615
 005E95AB    push        esp
 005E95AC    push        esi
 005E95AD    call        user32.ScreenToClient
 005E95B2    test        bl,bl
>005E95B4    je          005E95E7
 005E95B6    movzx       eax,word ptr [esp+4]
 005E95BB    shl         eax,10
 005E95BE    mov         edx,dword ptr [esp]
 005E95C1    and         edx,0FFFF
 005E95C7    or          eax,edx
 005E95C9    push        eax
 005E95CA    mov         eax,edi
 005E95CC    call        TCursorForm.getKeysDown
 005E95D1    or          eax,100000
 005E95D6    push        eax
 005E95D7    push        20B
 005E95DC    push        esi
 005E95DD    call        user32.SendMessageW
>005E95E2    jmp         005E968A
 005E95E7    movzx       eax,word ptr [esp+4]
 005E95EC    shl         eax,10
 005E95EF    mov         edx,dword ptr [esp]
 005E95F2    and         edx,0FFFF
 005E95F8    or          eax,edx
 005E95FA    push        eax
 005E95FB    mov         eax,edi
 005E95FD    call        TCursorForm.getKeysDown
 005E9602    or          eax,100000
 005E9607    push        eax
 005E9608    push        20C
 005E960D    push        esi
 005E960E    call        user32.SendMessageW
>005E9613    jmp         005E968A
 005E9615    push        esp
 005E9616    push        esi
 005E9617    call        user32.ScreenToClient
 005E961C    test        bl,bl
>005E961E    je          005E9656
 005E9620    push        0
 005E9622    push        5E8B8C
 005E9627    movzx       eax,word ptr [esp+0C]
 005E962C    shl         eax,10
 005E962F    mov         edx,dword ptr [esp+8]
 005E9633    and         edx,0FFFF
 005E9639    or          eax,edx
 005E963B    push        eax
 005E963C    mov         eax,edi
 005E963E    call        TCursorForm.getKeysDown
 005E9643    or          eax,100000
 005E9648    push        eax
 005E9649    push        20B
 005E964E    push        esi
 005E964F    call        user32.SendMessageCallbackW
>005E9654    jmp         005E968A
 005E9656    push        0
 005E9658    push        5E8B8C
 005E965D    movzx       eax,word ptr [esp+0C]
 005E9662    shl         eax,10
 005E9665    mov         edx,dword ptr [esp+8]
 005E9669    and         edx,0FFFF
 005E966F    or          eax,edx
 005E9671    push        eax
 005E9672    mov         eax,edi
 005E9674    call        TCursorForm.getKeysDown
 005E9679    or          eax,100000
 005E967E    push        eax
 005E967F    push        20C
 005E9684    push        esi
 005E9685    call        user32.SendMessageCallbackW
 005E968A    mov         eax,edi
 005E968C    call        TCursorForm.ShowMe
 005E9691    add         esp,18
 005E9694    pop         ebp
 005E9695    pop         edi
 005E9696    pop         esi
 005E9697    pop         ebx
 005E9698    ret
*}
end;

//005E969C
function TCursorForm.getKeysDown:Integer;
begin
{*
 005E969C    movzx       edx,byte ptr [eax+397];TCursorForm.FCtrl:Boolean
 005E96A3    add         edx,edx
 005E96A5    add         edx,edx
 005E96A7    add         edx,edx
 005E96A9    movzx       ecx,byte ptr [eax+3C0];TCursorForm.FLeftButton:Boolean
 005E96B0    or          edx,ecx
 005E96B2    movzx       ecx,byte ptr [eax+3C1];TCursorForm.FMiddleButton:Boolean
 005E96B9    shl         ecx,4
 005E96BC    or          edx,ecx
 005E96BE    movzx       ecx,byte ptr [eax+3C2];TCursorForm.FRightButton:Boolean
 005E96C5    add         ecx,ecx
 005E96C7    or          edx,ecx
 005E96C9    movzx       ecx,byte ptr [eax+396];TCursorForm.FShift:Boolean
 005E96D0    add         ecx,ecx
 005E96D2    add         ecx,ecx
 005E96D4    or          edx,ecx
 005E96D6    movzx       ecx,byte ptr [eax+394];TCursorForm.FXButton1:Boolean
 005E96DD    shl         ecx,5
 005E96E0    or          edx,ecx
 005E96E2    movzx       ecx,byte ptr [eax+395];TCursorForm.FXButton2:Boolean
 005E96E9    shl         ecx,6
 005E96EC    or          edx,ecx
 005E96EE    movzx       ecx,byte ptr [eax+399];TCursorForm.FXButton3:Boolean
 005E96F5    shl         ecx,7
 005E96F8    or          edx,ecx
 005E96FA    movzx       ecx,byte ptr [eax+398];TCursorForm.FXButton4:Boolean
 005E9701    shl         ecx,8
 005E9704    or          edx,ecx
 005E9706    movzx       eax,byte ptr [eax+39A];TCursorForm.FXButton5:Boolean
 005E970D    shl         eax,9
 005E9710    or          edx,eax
 005E9712    mov         eax,edx
 005E9714    ret
*}
end;

//005E9718
{*procedure TCursorForm.SetColour(b:Double; ?:?; g:Double; ?:?; r:Double; ?:?);
begin
 005E9718    push        ebp
 005E9719    mov         ebp,esp
 005E971B    add         esp,0FFFFFFF4
 005E971E    push        ebx
 005E971F    push        esi
 005E9720    push        edi
 005E9721    xor         edx,edx
 005E9723    mov         dword ptr [ebp-4],edx
 005E9726    mov         esi,eax
 005E9728    xor         eax,eax
 005E972A    push        ebp
 005E972B    push        5E9922
 005E9730    push        dword ptr fs:[eax]
 005E9733    mov         dword ptr fs:[eax],esp
 005E9736    fld         qword ptr [ebp+18]
 005E9739    fmul        dword ptr ds:[5E9934];255:Single
 005E973F    fstp        qword ptr [ebp+18]
 005E9742    wait
 005E9743    fld         qword ptr [ebp+10]
 005E9746    fmul        dword ptr ds:[5E9934];255:Single
 005E974C    fstp        qword ptr [ebp+10]
 005E974F    wait
 005E9750    fld         qword ptr [ebp+8]
 005E9753    fmul        dword ptr ds:[5E9934];255:Single
 005E9759    fstp        qword ptr [ebp+8]
 005E975C    wait
 005E975D    fld         qword ptr [ebp+18]
 005E9760    fcomp       dword ptr ds:[5E9934];255:Single
 005E9766    wait
 005E9767    fnstsw      al
 005E9769    sahf
>005E976A    jbe         005E9778
 005E976C    xor         eax,eax
 005E976E    mov         dword ptr [ebp+18],eax
 005E9771    mov         dword ptr [ebp+1C],406FE000
 005E9778    fld         qword ptr [ebp+10]
 005E977B    fcomp       dword ptr ds:[5E9934];255:Single
 005E9781    wait
 005E9782    fnstsw      al
 005E9784    sahf
>005E9785    jbe         005E9793
 005E9787    xor         eax,eax
 005E9789    mov         dword ptr [ebp+10],eax
 005E978C    mov         dword ptr [ebp+14],406FE000
 005E9793    fld         qword ptr [ebp+8]
 005E9796    fcomp       dword ptr ds:[5E9934];255:Single
 005E979C    wait
 005E979D    fnstsw      al
 005E979F    sahf
>005E97A0    jbe         005E97AE
 005E97A2    xor         eax,eax
 005E97A4    mov         dword ptr [ebp+8],eax
 005E97A7    mov         dword ptr [ebp+0C],406FE000
 005E97AE    mov         ebx,dword ptr [esi+404];TCursorForm.FColour:TColor
 005E97B4    fld         qword ptr [ebp+18]
 005E97B7    call        @ROUND
 005E97BC    mov         edi,eax
 005E97BE    fld         qword ptr [ebp+10]
 005E97C1    call        @ROUND
 005E97C6    shl         eax,8
 005E97C9    add         edi,eax
 005E97CB    fld         qword ptr [ebp+8]
 005E97CE    call        @ROUND
 005E97D3    shl         eax,10
 005E97D6    add         edi,eax
 005E97D8    mov         dword ptr [esi+404],edi;TCursorForm.FColour:TColor
 005E97DE    cmp         edi,ebx
>005E97E0    je          005E990C
 005E97E6    test        ebx,ebx
>005E97E8    jne         005E98A1
 005E97EE    cmp         dword ptr [esi+408],0FFFFFF;TCursorForm.FWhiteColour:TColor
>005E97F8    jne         005E98A1
 005E97FE    mov         ecx,dword ptr [esi+408];TCursorForm.FWhiteColour:TColor
 005E9804    mov         edx,dword ptr [esi+404];TCursorForm.FColour:TColor
 005E980A    mov         eax,dword ptr [esi+3F8];TCursorForm.UnrotatedBitmap:TBitmap
 005E9810    call        005E66D8
 005E9815    fld         qword ptr [esi+3F0];TCursorForm.Roll:Double
 005E981B    fcomp       dword ptr ds:[5E9938];0:Single
 005E9821    wait
 005E9822    fnstsw      al
 005E9824    sahf
>005E9825    jne         005E9848
 005E9827    mov         eax,dword ptr [esi+388];TCursorForm.Image1:TTntImage
 005E982D    mov         eax,dword ptr [eax+1B0];TTntImage.FPicture:TPicture
 005E9833    call        TPicture.GetBitmap
 005E9838    mov         edx,dword ptr [esi+3F8];TCursorForm.UnrotatedBitmap:TBitmap
 005E983E    mov         ecx,dword ptr [eax]
 005E9840    call        dword ptr [ecx+8];TBitmap.Assign
>005E9843    jmp         005E990C
 005E9848    mov         dl,1
 005E984A    mov         eax,[00463B28];TBitmap
 005E984F    call        TBitmap.Create;TBitmap.Create
 005E9854    mov         edi,eax
 005E9856    mov         dword ptr [ebp-0C],10
 005E985D    mov         dword ptr [ebp-8],10
 005E9864    push        dword ptr [esi+3F4];TCursorForm.?f3F4:dword
 005E986A    push        dword ptr [esi+3F0];TCursorForm.Roll:Double
 005E9870    lea         ecx,[ebp-0C]
 005E9873    mov         edx,edi
 005E9875    mov         eax,dword ptr [esi+3F8];TCursorForm.UnrotatedBitmap:TBitmap
 005E987B    call        005E6930
 005E9880    mov         eax,dword ptr [esi+388];TCursorForm.Image1:TTntImage
 005E9886    mov         eax,dword ptr [eax+1B0];TTntImage.FPicture:TPicture
 005E988C    call        TPicture.GetBitmap
 005E9891    mov         edx,edi
 005E9893    mov         ecx,dword ptr [eax]
 005E9895    call        dword ptr [ecx+8];TBitmap.Assign
 005E9898    mov         eax,edi
 005E989A    call        TObject.Free
>005E989F    jmp         005E990C
 005E98A1    cmp         byte ptr [esi+3C3],0;TCursorForm.Permanent:Boolean
>005E98A8    je          005E98FD
 005E98AA    cmp         dword ptr [esi+400],0;TCursorForm.FMyImage:string
>005E98B1    je          005E98D6
 005E98B3    lea         eax,[ebp-4]
 005E98B6    mov         edx,dword ptr [esi+400];TCursorForm.FMyImage:string
 005E98BC    call        @UStrLAsg
 005E98C1    xor         edx,edx
 005E98C3    mov         eax,esi
 005E98C5    call        005E86B0
 005E98CA    mov         edx,dword ptr [ebp-4]
 005E98CD    mov         eax,esi
 005E98CF    call        005E86B0
>005E98D4    jmp         005E990C
 005E98D6    mov         byte ptr [esi+3C3],0;TCursorForm.Permanent:Boolean
 005E98DD    mov         eax,dword ptr [esi+3B8];TCursorForm.OldCursorHandle:Cardinal
 005E98E3    xor         edx,edx
 005E98E5    mov         dword ptr [esi+3B8],edx;TCursorForm.OldCursorHandle:Cardinal
 005E98EB    mov         edx,eax
 005E98ED    mov         eax,esi
 005E98EF    call        TCursorForm.ChangeCursor2
 005E98F4    mov         byte ptr [esi+3C3],1;TCursorForm.Permanent:Boolean
>005E98FB    jmp         005E990C
 005E98FD    xor         eax,eax
 005E98FF    mov         dword ptr [esi+3B8],eax;TCursorForm.OldCursorHandle:Cardinal
 005E9905    mov         eax,esi
 005E9907    call        TCursorForm.CheckUnderneath
 005E990C    xor         eax,eax
 005E990E    pop         edx
 005E990F    pop         ecx
 005E9910    pop         ecx
 005E9911    mov         dword ptr fs:[eax],edx
 005E9914    push        5E9929
 005E9919    lea         eax,[ebp-4]
 005E991C    call        @UStrClr
 005E9921    ret
>005E9922    jmp         @HandleFinally
>005E9927    jmp         005E9919
 005E9929    pop         edi
 005E992A    pop         esi
 005E992B    pop         ebx
 005E992C    mov         esp,ebp
 005E992E    pop         ebp
 005E992F    ret         18
end;*}

//005E993C
{*procedure TCursorForm.SetWhiteColour(b:Double; ?:?; g:Double; ?:?; r:Double; ?:?);
begin
 005E993C    push        ebp
 005E993D    mov         ebp,esp
 005E993F    add         esp,0FFFFFFF4
 005E9942    push        ebx
 005E9943    push        esi
 005E9944    push        edi
 005E9945    xor         edx,edx
 005E9947    mov         dword ptr [ebp-4],edx
 005E994A    mov         esi,eax
 005E994C    xor         eax,eax
 005E994E    push        ebp
 005E994F    push        5E9B3C
 005E9954    push        dword ptr fs:[eax]
 005E9957    mov         dword ptr fs:[eax],esp
 005E995A    fld         qword ptr [ebp+18]
 005E995D    fmul        dword ptr ds:[5E9B4C];255:Single
 005E9963    fstp        qword ptr [ebp+18]
 005E9966    wait
 005E9967    fld         qword ptr [ebp+10]
 005E996A    fmul        dword ptr ds:[5E9B4C];255:Single
 005E9970    fstp        qword ptr [ebp+10]
 005E9973    wait
 005E9974    fld         qword ptr [ebp+8]
 005E9977    fmul        dword ptr ds:[5E9B4C];255:Single
 005E997D    fstp        qword ptr [ebp+8]
 005E9980    wait
 005E9981    fld         qword ptr [ebp+18]
 005E9984    fcomp       dword ptr ds:[5E9B4C];255:Single
 005E998A    wait
 005E998B    fnstsw      al
 005E998D    sahf
>005E998E    jbe         005E999C
 005E9990    xor         eax,eax
 005E9992    mov         dword ptr [ebp+18],eax
 005E9995    mov         dword ptr [ebp+1C],406FE000
 005E999C    fld         qword ptr [ebp+10]
 005E999F    fcomp       dword ptr ds:[5E9B4C];255:Single
 005E99A5    wait
 005E99A6    fnstsw      al
 005E99A8    sahf
>005E99A9    jbe         005E99B7
 005E99AB    xor         eax,eax
 005E99AD    mov         dword ptr [ebp+10],eax
 005E99B0    mov         dword ptr [ebp+14],406FE000
 005E99B7    fld         qword ptr [ebp+8]
 005E99BA    fcomp       dword ptr ds:[5E9B4C];255:Single
 005E99C0    wait
 005E99C1    fnstsw      al
 005E99C3    sahf
>005E99C4    jbe         005E99D2
 005E99C6    xor         eax,eax
 005E99C8    mov         dword ptr [ebp+8],eax
 005E99CB    mov         dword ptr [ebp+0C],406FE000
 005E99D2    mov         ebx,dword ptr [esi+408];TCursorForm.FWhiteColour:TColor
 005E99D8    fld         qword ptr [ebp+18]
 005E99DB    call        @ROUND
 005E99E0    mov         edi,eax
 005E99E2    fld         qword ptr [ebp+10]
 005E99E5    call        @ROUND
 005E99EA    shl         eax,8
 005E99ED    add         edi,eax
 005E99EF    fld         qword ptr [ebp+8]
 005E99F2    call        @ROUND
 005E99F7    shl         eax,10
 005E99FA    add         edi,eax
 005E99FC    mov         dword ptr [esi+408],edi;TCursorForm.FWhiteColour:TColor
 005E9A02    cmp         edi,ebx
>005E9A04    je          005E9B26
 005E9A0A    test        ebx,ebx
>005E9A0C    jne         005E9AC5
 005E9A12    cmp         dword ptr [esi+408],0FFFFFF;TCursorForm.FWhiteColour:TColor
>005E9A1C    jne         005E9AC5
 005E9A22    mov         ecx,dword ptr [esi+408];TCursorForm.FWhiteColour:TColor
 005E9A28    mov         edx,dword ptr [esi+404];TCursorForm.FColour:TColor
 005E9A2E    mov         eax,dword ptr [esi+3F8];TCursorForm.UnrotatedBitmap:TBitmap
 005E9A34    call        005E66D8
 005E9A39    fld         qword ptr [esi+3F0];TCursorForm.Roll:Double
 005E9A3F    fcomp       dword ptr ds:[5E9B50];0:Single
 005E9A45    wait
 005E9A46    fnstsw      al
 005E9A48    sahf
>005E9A49    jne         005E9A6C
 005E9A4B    mov         eax,dword ptr [esi+388];TCursorForm.Image1:TTntImage
 005E9A51    mov         eax,dword ptr [eax+1B0];TTntImage.FPicture:TPicture
 005E9A57    call        TPicture.GetBitmap
 005E9A5C    mov         edx,dword ptr [esi+3F8];TCursorForm.UnrotatedBitmap:TBitmap
 005E9A62    mov         ecx,dword ptr [eax]
 005E9A64    call        dword ptr [ecx+8];TBitmap.Assign
>005E9A67    jmp         005E9B26
 005E9A6C    mov         dl,1
 005E9A6E    mov         eax,[00463B28];TBitmap
 005E9A73    call        TBitmap.Create;TBitmap.Create
 005E9A78    mov         edi,eax
 005E9A7A    mov         dword ptr [ebp-0C],10
 005E9A81    mov         dword ptr [ebp-8],10
 005E9A88    push        dword ptr [esi+3F4];TCursorForm.?f3F4:dword
 005E9A8E    push        dword ptr [esi+3F0];TCursorForm.Roll:Double
 005E9A94    lea         ecx,[ebp-0C]
 005E9A97    mov         edx,edi
 005E9A99    mov         eax,dword ptr [esi+3F8];TCursorForm.UnrotatedBitmap:TBitmap
 005E9A9F    call        005E6930
 005E9AA4    mov         eax,dword ptr [esi+388];TCursorForm.Image1:TTntImage
 005E9AAA    mov         eax,dword ptr [eax+1B0];TTntImage.FPicture:TPicture
 005E9AB0    call        TPicture.GetBitmap
 005E9AB5    mov         edx,edi
 005E9AB7    mov         ecx,dword ptr [eax]
 005E9AB9    call        dword ptr [ecx+8];TBitmap.Assign
 005E9ABC    mov         eax,edi
 005E9ABE    call        TObject.Free
>005E9AC3    jmp         005E9B26
 005E9AC5    cmp         byte ptr [esi+3C3],0;TCursorForm.Permanent:Boolean
>005E9ACC    je          005E9B17
 005E9ACE    cmp         dword ptr [esi+400],0;TCursorForm.FMyImage:string
>005E9AD5    je          005E9AFA
 005E9AD7    lea         eax,[ebp-4]
 005E9ADA    mov         edx,dword ptr [esi+400];TCursorForm.FMyImage:string
 005E9AE0    call        @UStrLAsg
 005E9AE5    xor         edx,edx
 005E9AE7    mov         eax,esi
 005E9AE9    call        005E86B0
 005E9AEE    mov         edx,dword ptr [ebp-4]
 005E9AF1    mov         eax,esi
 005E9AF3    call        005E86B0
>005E9AF8    jmp         005E9B26
 005E9AFA    mov         byte ptr [esi+3C3],0;TCursorForm.Permanent:Boolean
 005E9B01    mov         edx,dword ptr [esi+3B8];TCursorForm.OldCursorHandle:Cardinal
 005E9B07    mov         eax,esi
 005E9B09    call        TCursorForm.ChangeCursor2
 005E9B0E    mov         byte ptr [esi+3C3],1;TCursorForm.Permanent:Boolean
>005E9B15    jmp         005E9B26
 005E9B17    xor         eax,eax
 005E9B19    mov         dword ptr [esi+3B8],eax;TCursorForm.OldCursorHandle:Cardinal
 005E9B1F    mov         eax,esi
 005E9B21    call        TCursorForm.CheckUnderneath
 005E9B26    xor         eax,eax
 005E9B28    pop         edx
 005E9B29    pop         ecx
 005E9B2A    pop         ecx
 005E9B2B    mov         dword ptr fs:[eax],edx
 005E9B2E    push        5E9B43
 005E9B33    lea         eax,[ebp-4]
 005E9B36    call        @UStrClr
 005E9B3B    ret
>005E9B3C    jmp         @HandleFinally
>005E9B41    jmp         005E9B33
 005E9B43    pop         edi
 005E9B44    pop         esi
 005E9B45    pop         ebx
 005E9B46    mov         esp,ebp
 005E9B48    pop         ebp
 005E9B49    ret         18
end;*}

//005E9B54
{*procedure sub_005E9B54(?:Pointer; ?:?);
begin
 005E9B54    push        ebp
 005E9B55    mov         ebp,esp
 005E9B57    push        0
 005E9B59    push        ebx
 005E9B5A    mov         ebx,eax
 005E9B5C    xor         eax,eax
 005E9B5E    push        ebp
 005E9B5F    push        5E9C25
 005E9B64    push        dword ptr fs:[eax]
 005E9B67    mov         dword ptr fs:[eax],esp
 005E9B6A    mov         ecx,edx
 005E9B6C    mov         dword ptr [ebx+3A4],ecx
 005E9B72    mov         eax,ecx
 005E9B74    mov         ecx,6
 005E9B79    cdq
 005E9B7A    idiv        eax,ecx
 005E9B7C    mov         eax,edx
 005E9B7E    cmp         eax,2
>005E9B81    je          005E9B91
 005E9B83    cmp         eax,4
>005E9B86    je          005E9B91
 005E9B88    cmp         eax,5
>005E9B8B    je          005E9B91
 005E9B8D    xor         edx,edx
>005E9B8F    jmp         005E9B93
 005E9B91    mov         dl,1
 005E9B93    shl         edx,4
 005E9B96    lea         edx,[edx+edx*8]
 005E9B99    movzx       edx,dl
 005E9B9C    cmp         eax,3
>005E9B9F    je          005E9BAE
 005E9BA1    cmp         eax,4
>005E9BA4    je          005E9BAE
 005E9BA6    test        eax,eax
>005E9BA8    je          005E9BAE
 005E9BAA    xor         ecx,ecx
>005E9BAC    jmp         005E9BB0
 005E9BAE    mov         cl,1
 005E9BB0    shl         ecx,4
 005E9BB3    lea         ecx,[ecx+ecx*8]
 005E9BB6    movzx       ecx,cl
 005E9BB9    shl         ecx,8
 005E9BBC    or          edx,ecx
 005E9BBE    cmp         eax,1
>005E9BC1    je          005E9BD0
 005E9BC3    cmp         eax,5
>005E9BC6    je          005E9BD0
 005E9BC8    test        eax,eax
>005E9BCA    je          005E9BD0
 005E9BCC    xor         eax,eax
>005E9BCE    jmp         005E9BD2
 005E9BD0    mov         al,1
 005E9BD2    shl         eax,4
 005E9BD5    lea         eax,[eax+eax*8]
 005E9BD8    movzx       eax,al
 005E9BDB    shl         eax,10
 005E9BDE    or          edx,eax
 005E9BE0    mov         eax,dword ptr [ebx+38C]
 005E9BE6    mov         eax,dword ptr [eax+64]
 005E9BE9    call        TFont.SetColor
 005E9BEE    lea         edx,[ebp-4]
 005E9BF1    mov         eax,dword ptr [ebx+3A4]
 005E9BF7    call        IntToStr
 005E9BFC    mov         edx,dword ptr [ebp-4]
 005E9BFF    mov         eax,ebx
 005E9C01    call        005E8620
 005E9C06    mov         dl,1
 005E9C08    mov         eax,ebx
 005E9C0A    call        TCustomForm.SetVisible
 005E9C0F    xor         eax,eax
 005E9C11    pop         edx
 005E9C12    pop         ecx
 005E9C13    pop         ecx
 005E9C14    mov         dword ptr fs:[eax],edx
 005E9C17    push        5E9C2C
 005E9C1C    lea         eax,[ebp-4]
 005E9C1F    call        @UStrClr
 005E9C24    ret
>005E9C25    jmp         @HandleFinally
>005E9C2A    jmp         005E9C1C
 005E9C2C    pop         ebx
 005E9C2D    pop         ecx
 005E9C2E    pop         ebp
 005E9C2F    ret
end;*}

//005E9C50
procedure TCursorForm.RotateHotspot;
begin
{*
 005E9C50    push        ebx
 005E9C51    push        esi
 005E9C52    push        edi
 005E9C53    add         esp,0FFFFFFD4
 005E9C56    mov         ebx,eax
 005E9C58    mov         eax,ebx
 005E9C5A    call        TCursorForm.GetX
 005E9C5F    mov         esi,eax
 005E9C61    mov         eax,ebx
 005E9C63    call        TCursorForm.GetY
 005E9C68    mov         edi,eax
 005E9C6A    fld         qword ptr [ebx+3F0];TCursorForm.Roll:Double
 005E9C70    fcomp       dword ptr ds:[5E9D80];0:Single
 005E9C76    wait
 005E9C77    fnstsw      al
 005E9C79    sahf
>005E9C7A    jne         005E9C99
 005E9C7C    mov         eax,dword ptr [ebx+3B0];TCursorForm.UnrotatedHotSpotX:Integer
 005E9C82    mov         dword ptr [ebx+3A8],eax;TCursorForm.HotSpotX:Integer
 005E9C88    mov         eax,dword ptr [ebx+3B4];TCursorForm.UnrotatedHotSpotY:Integer
 005E9C8E    mov         dword ptr [ebx+3AC],eax;TCursorForm.HotSpotY:Integer
>005E9C94    jmp         005E9D6C
 005E9C99    fld         qword ptr [ebx+3F0];TCursorForm.Roll:Double
 005E9C9F    fchs
 005E9CA1    fld         tbyte ptr ds:[5E9D84];3.14159265358979:Extended
 005E9CA7    fmulp       st(1),st
 005E9CA9    fdiv        dword ptr ds:[5E9D90];180:Single
 005E9CAF    fstp        qword ptr [esp]
 005E9CB2    wait
 005E9CB3    fld         qword ptr [esp]
 005E9CB6    add         esp,0FFFFFFF4
 005E9CB9    fstp        tbyte ptr [esp]
 005E9CBC    wait
 005E9CBD    call        Sin
 005E9CC2    fstp        qword ptr [esp+8]
 005E9CC6    wait
 005E9CC7    fld         qword ptr [esp]
 005E9CCA    add         esp,0FFFFFFF4
 005E9CCD    fstp        tbyte ptr [esp]
 005E9CD0    wait
 005E9CD1    call        Cos
 005E9CD6    fstp        qword ptr [esp+10]
 005E9CDA    wait
 005E9CDB    mov         eax,dword ptr [ebx+3B0];TCursorForm.UnrotatedHotSpotX:Integer
 005E9CE1    sub         eax,10
 005E9CE4    mov         dword ptr [esp+28],eax
 005E9CE8    fild        dword ptr [esp+28]
 005E9CEC    fstp        qword ptr [esp+18]
 005E9CF0    wait
 005E9CF1    mov         eax,dword ptr [ebx+3B4];TCursorForm.UnrotatedHotSpotY:Integer
 005E9CF7    sub         eax,10
 005E9CFA    mov         dword ptr [esp+28],eax
 005E9CFE    fild        dword ptr [esp+28]
 005E9D02    fstp        qword ptr [esp+20]
 005E9D06    wait
 005E9D07    fld         qword ptr [esp+10]
 005E9D0B    fmul        qword ptr [esp+18]
 005E9D0F    fld         qword ptr [esp+8]
 005E9D13    fmul        qword ptr [esp+20]
 005E9D17    faddp       st(1),st
 005E9D19    fstp        qword ptr [esp+18]
 005E9D1D    wait
 005E9D1E    fld         qword ptr [esp+10]
 005E9D22    fmul        qword ptr [esp+20]
 005E9D26    mov         eax,dword ptr [ebx+3B0];TCursorForm.UnrotatedHotSpotX:Integer
 005E9D2C    sub         eax,10
 005E9D2F    mov         dword ptr [esp+28],eax
 005E9D33    fild        dword ptr [esp+28]
 005E9D37    fmul        qword ptr [esp+8]
 005E9D3B    fsubp       st(1),st
 005E9D3D    fstp        qword ptr [esp+20]
 005E9D41    wait
 005E9D42    fld         qword ptr [esp+18]
 005E9D46    fadd        dword ptr ds:[5E9D94];24:Single
 005E9D4C    call        @ROUND
 005E9D51    mov         dword ptr [ebx+3A8],eax;TCursorForm.HotSpotX:Integer
 005E9D57    fld         qword ptr [esp+20]
 005E9D5B    fadd        dword ptr ds:[5E9D94];24:Single
 005E9D61    call        @ROUND
 005E9D66    mov         dword ptr [ebx+3AC],eax;TCursorForm.HotSpotY:Integer
 005E9D6C    push        1
 005E9D6E    mov         ecx,edi
 005E9D70    mov         edx,esi
 005E9D72    mov         eax,ebx
 005E9D74    call        TCursorForm.SetPos
 005E9D79    add         esp,2C
 005E9D7C    pop         edi
 005E9D7D    pop         esi
 005E9D7E    pop         ebx
 005E9D7F    ret
*}
end;

Initialization
//007818A0
{*
 007818A0    push        ebp
 007818A1    mov         ebp,esp
 007818A3    push        ebx
 007818A4    push        esi
 007818A5    push        edi
 007818A6    sub         dword ptr ds:[8161EC],1
>007818AD    jae         0078191D
 007818AF    xor         edx,edx
 007818B1    push        ebp
 007818B2    push        781902
 007818B7    push        dword ptr fs:[edx]
 007818BA    mov         dword ptr fs:[edx],esp
 007818BD    mov         eax,781930;'Initializing PieCursorUnit'
 007818C2    call        004FA5FC
 007818C7    call        005E8968
 007818CC    mov         ebx,dword ptr ds:[790C38];gvar_00790C38
 007818D2    mov         eax,781974;'WIIHAND'
 007818D7    call        @UStrToPWChar
 007818DC    push        eax
 007818DD    push        ebx
 007818DE    call        user32.LoadCursorW
 007818E3    mov         edx,dword ptr ds:[78DB00];^Screen:TScreen
 007818E9    mov         edx,dword ptr [edx]
 007818EB    mov         ecx,eax
 007818ED    mov         eax,1
 007818F2    xchg        eax,edx
 007818F3    call        TScreen.SetCursors
 007818F8    xor         eax,eax
 007818FA    pop         edx
 007818FB    pop         ecx
 007818FC    pop         ecx
 007818FD    mov         dword ptr fs:[eax],edx
>00781900    jmp         0078191D
>00781902    jmp         @HandleOnException
 00781907    dd          1
 0078190B    dd          00418C04;Exception
 0078190F    dd          00781913
 00781913    call        004FA644
 00781918    call        @DoneExcept
 0078191D    pop         edi
 0078191E    pop         esi
 0078191F    pop         ebx
 00781920    pop         ebp
 00781921    ret
*}
Finalization
end.