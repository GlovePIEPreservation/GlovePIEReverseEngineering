//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit Clipbrd;

interface

uses
  SysUtils, Classes;

type
  TClipboard = class(TPersistent)
  published
    procedure SetComponent(Component:TComponent);//004DDA08
    procedure Open;//004DD690
    function HasFormat(Format:Word):Boolean;//004DE04C
    procedure SetTextBuf(Buffer:PWideChar);//004DDAFC
    function GetTextBuf(Buffer:PWideChar; BufSize:Integer):Integer;//004DDA78
    procedure SetAsHandle(Format:Word; Value:Cardinal);//004DDF6C
    procedure Clear;//004DD604
    procedure Assign(Source:TPersistent);//004DDECC
    destructor Destroy();//004DE100
    function GetAsHandle(Format:Word):Cardinal;//004DDF18
    function GetComponent(Owner:TComponent; Parent:TComponent):TComponent;//004DD764
    procedure Close;//004DD664
  public
    FOpenRefCount:Integer;//f4
    FClipboardWindow:HWND;//f8
    FAllocated:Boolean;//fC
    FEmptied:Boolean;//fD
    destructor Destroy(); virtual;//004DE100
    procedure AssignTo(Dest:TPersistent); virtual;//v0//004DDD5C
    procedure Assign(Source:TPersistent); virtual;//v8//004DDECC
    procedure WndProc(var Message:TMessage); virtual;//vC//004DD744
    procedure Clear; virtual;//v10//004DD604
    procedure Close; virtual;//v14//004DD664
    procedure Open; virtual;//v18//004DD690
    procedure Adding;//004DD648
    procedure SetBuffer(Format:Word; var Buffer:void ; Size:Integer);//004DD908
    function GetAsText:UnicodeString;//004DDB20
    procedure SetAsText(const Value:UnicodeString);//004DDBA0
    procedure AssignToPicture(Dest:TPicture);//004DDBD4
    procedure AssignToBitmap(Dest:TBitmap);//004DDC8C
    procedure AssignToMetafile(Dest:TMetafile);//004DDCF8
    procedure AssignPicture(Source:TPicture);//004DDDC4
    procedure AssignGraphic(Source:TGraphic);//004DDE48
    procedure MainWndProc(var Message:TMessage);//004DE0A4
  end;
  EClipboardException = class(Exception)
  end;
    procedure WndProc(var Message:TMessage);//004DD744
    procedure AssignTo(Dest:TPersistent);//004DDD5C
    function HasAPicture:Boolean;//004DDFCC
    function Clipboard:TClipboard;//004DE084

implementation

//004DD604
procedure TClipboard.Clear;
begin
{*
 004DD604    push        ebp
 004DD605    mov         ebp,esp
 004DD607    push        ecx
 004DD608    mov         dword ptr [ebp-4],eax
 004DD60B    mov         eax,dword ptr [ebp-4]
 004DD60E    mov         edx,dword ptr [eax]
 004DD610    call        dword ptr [edx+18]
 004DD613    xor         eax,eax
 004DD615    push        ebp
 004DD616    push        4DD63C
 004DD61B    push        dword ptr fs:[eax]
 004DD61E    mov         dword ptr fs:[eax],esp
 004DD621    call        user32.EmptyClipboard
 004DD626    xor         eax,eax
 004DD628    pop         edx
 004DD629    pop         ecx
 004DD62A    pop         ecx
 004DD62B    mov         dword ptr fs:[eax],edx
 004DD62E    push        4DD643
 004DD633    mov         eax,dword ptr [ebp-4]
 004DD636    mov         edx,dword ptr [eax]
 004DD638    call        dword ptr [edx+14]
 004DD63B    ret
>004DD63C    jmp         @HandleFinally
>004DD641    jmp         004DD633
 004DD643    pop         ecx
 004DD644    pop         ebp
 004DD645    ret
*}
end;

//004DD648
procedure TClipboard.Adding;
begin
{*
 004DD648    push        ebx
 004DD649    mov         ebx,eax
 004DD64B    cmp         dword ptr [ebx+4],0
>004DD64F    je          004DD662
 004DD651    cmp         byte ptr [ebx+0D],0
>004DD655    jne         004DD662
 004DD657    mov         eax,ebx
 004DD659    mov         edx,dword ptr [eax]
 004DD65B    call        dword ptr [edx+10]
 004DD65E    mov         byte ptr [ebx+0D],1
 004DD662    pop         ebx
 004DD663    ret
*}
end;

//004DD664
procedure TClipboard.Close;
begin
{*
 004DD664    push        ebx
 004DD665    mov         ebx,eax
 004DD667    cmp         dword ptr [ebx+4],0
>004DD66B    je          004DD68E
 004DD66D    dec         dword ptr [ebx+4]
 004DD670    cmp         dword ptr [ebx+4],0
>004DD674    jne         004DD68E
 004DD676    call        user32.CloseClipboard
 004DD67B    cmp         byte ptr [ebx+0C],0
>004DD67F    je          004DD689
 004DD681    mov         eax,dword ptr [ebx+8]
 004DD684    call        DeallocateHWnd
 004DD689    xor         eax,eax
 004DD68B    mov         dword ptr [ebx+8],eax
 004DD68E    pop         ebx
 004DD68F    ret
*}
end;

//004DD690
procedure TClipboard.Open;
begin
{*
 004DD690    push        ebp
 004DD691    mov         ebp,esp
 004DD693    add         esp,0FFFFFFF4
 004DD696    push        ebx
 004DD697    xor         edx,edx
 004DD699    mov         dword ptr [ebp-0C],edx
 004DD69C    mov         ebx,eax
 004DD69E    xor         eax,eax
 004DD6A0    push        ebp
 004DD6A1    push        4DD736
 004DD6A6    push        dword ptr fs:[eax]
 004DD6A9    mov         dword ptr fs:[eax],esp
 004DD6AC    cmp         dword ptr [ebx+4],0
>004DD6B0    jne         004DD71D
 004DD6B2    mov         eax,[0078D590];^Application:TApplication
 004DD6B7    mov         eax,dword ptr [eax]
 004DD6B9    mov         eax,dword ptr [eax+170]
 004DD6BF    mov         dword ptr [ebx+8],eax
 004DD6C2    test        eax,eax
>004DD6C4    jne         004DD6D8
 004DD6C6    push        ebx
 004DD6C7    push        4DE0A4;TClipboard.MainWndProc
 004DD6CC    call        AllocateHWnd
 004DD6D1    mov         dword ptr [ebx+8],eax
 004DD6D4    mov         byte ptr [ebx+0C],1
 004DD6D8    mov         eax,dword ptr [ebx+8]
 004DD6DB    push        eax
 004DD6DC    call        user32.OpenClipboard
 004DD6E1    test        eax,eax
>004DD6E3    jne         004DD719
 004DD6E5    call        kernel32.GetLastError
 004DD6EA    lea         edx,[ebp-0C]
 004DD6ED    call        SysErrorMessage
 004DD6F2    mov         eax,dword ptr [ebp-0C]
 004DD6F5    mov         dword ptr [ebp-8],eax
 004DD6F8    mov         byte ptr [ebp-4],11
 004DD6FC    lea         eax,[ebp-8]
 004DD6FF    push        eax
 004DD700    push        0
 004DD702    mov         ecx,dword ptr ds:[78CD00];^SResString283:TResStringRec
 004DD708    mov         dl,1
 004DD70A    mov         eax,[004DD55C];EClipboardException
 004DD70F    call        Exception.CreateResFmt
 004DD714    call        @RaiseExcept
 004DD719    mov         byte ptr [ebx+0D],0
 004DD71D    inc         dword ptr [ebx+4]
 004DD720    xor         eax,eax
 004DD722    pop         edx
 004DD723    pop         ecx
 004DD724    pop         ecx
 004DD725    mov         dword ptr fs:[eax],edx
 004DD728    push        4DD73D
 004DD72D    lea         eax,[ebp-0C]
 004DD730    call        @UStrClr
 004DD735    ret
>004DD736    jmp         @HandleFinally
>004DD73B    jmp         004DD72D
 004DD73D    pop         ebx
 004DD73E    mov         esp,ebp
 004DD740    pop         ebp
 004DD741    ret
*}
end;

//004DD744
procedure TClipboard.WndProc(var Message:TMessage);
begin
{*
 004DD744    push        ebx
 004DD745    push        esi
 004DD746    mov         ebx,edx
 004DD748    mov         esi,eax
 004DD74A    mov         eax,dword ptr [ebx+8]
 004DD74D    push        eax
 004DD74E    mov         eax,dword ptr [ebx+4]
 004DD751    push        eax
 004DD752    mov         eax,dword ptr [ebx]
 004DD754    push        eax
 004DD755    mov         eax,dword ptr [esi+8]
 004DD758    push        eax
 004DD759    call        user32.DefWindowProcW
 004DD75E    mov         dword ptr [ebx+0C],eax
 004DD761    pop         esi
 004DD762    pop         ebx
 004DD763    ret
*}
end;

//004DD764
function TClipboard.GetComponent(Owner:TComponent; Parent:TComponent):TComponent;
begin
{*
 004DD764    push        ebp
 004DD765    mov         ebp,esp
 004DD767    add         esp,0FFFFFFEC
 004DD76A    push        ebx
 004DD76B    push        esi
 004DD76C    push        edi
 004DD76D    mov         esi,ecx
 004DD76F    mov         ebx,edx
 004DD771    mov         dword ptr [ebp-4],eax
 004DD774    xor         eax,eax
 004DD776    mov         dword ptr [ebp-8],eax
 004DD779    mov         eax,dword ptr [ebp-4]
 004DD77C    mov         edx,dword ptr [eax]
 004DD77E    call        dword ptr [edx+18]
 004DD781    xor         eax,eax
 004DD783    push        ebp
 004DD784    push        4DD8F7
 004DD789    push        dword ptr fs:[eax]
 004DD78C    mov         dword ptr fs:[eax],esp
 004DD78F    movzx       eax,word ptr ds:[7932E2]
 004DD796    push        eax
 004DD797    call        user32.GetClipboardData
 004DD79C    mov         dword ptr [ebp-0C],eax
 004DD79F    cmp         dword ptr [ebp-0C],0
>004DD7A3    jne         004DD7AF
 004DD7A5    call        @TryFinallyExit
>004DD7AA    jmp         004DD8FE
 004DD7AF    mov         eax,dword ptr [ebp-0C]
 004DD7B2    push        eax
 004DD7B3    call        kernel32.GlobalLock
 004DD7B8    mov         edi,eax
 004DD7BA    test        edi,edi
>004DD7BC    jne         004DD7C8
 004DD7BE    call        @TryFinallyExit
>004DD7C3    jmp         004DD8FE
 004DD7C8    xor         eax,eax
 004DD7CA    push        ebp
 004DD7CB    push        4DD8DA
 004DD7D0    push        dword ptr fs:[eax]
 004DD7D3    mov         dword ptr fs:[eax],esp
 004DD7D6    mov         dl,1
 004DD7D8    mov         eax,[0043DAFC];TMemoryStream
 004DD7DD    call        TObject.Create
 004DD7E2    mov         dword ptr [ebp-10],eax
 004DD7E5    xor         eax,eax
 004DD7E7    push        ebp
 004DD7E8    push        4DD8BC
 004DD7ED    push        dword ptr fs:[eax]
 004DD7F0    mov         dword ptr fs:[eax],esp
 004DD7F3    mov         eax,dword ptr [ebp-0C]
 004DD7F6    push        eax
 004DD7F7    call        kernel32.GlobalSize
 004DD7FC    mov         ecx,eax
 004DD7FE    mov         edx,edi
 004DD800    mov         eax,dword ptr [ebp-10]
 004DD803    call        TStream.WriteBuffer
 004DD808    push        0
 004DD80A    push        0
 004DD80C    mov         eax,dword ptr [ebp-10]
 004DD80F    call        TStream.SetPosition
 004DD814    push        100
 004DD819    mov         ecx,dword ptr [ebp-10]
 004DD81C    mov         dl,1
 004DD81E    mov         eax,[0043F948];TReader
 004DD823    call        TFiler.Create
 004DD828    mov         dword ptr [ebp-14],eax
 004DD82B    xor         eax,eax
 004DD82D    push        ebp
 004DD82E    push        4DD89F
 004DD833    push        dword ptr fs:[eax]
 004DD836    mov         dword ptr fs:[eax],esp
 004DD839    mov         eax,dword ptr [ebp-14]
 004DD83C    mov         dword ptr [eax+2C],esi
 004DD83F    xor         edx,edx
 004DD841    mov         eax,dword ptr [ebp-14]
 004DD844    call        TReader.ReadRootComponent
 004DD849    mov         dword ptr [ebp-8],eax
 004DD84C    xor         eax,eax
 004DD84E    push        ebp
 004DD84F    push        4DD872
 004DD854    push        dword ptr fs:[eax]
 004DD857    mov         dword ptr fs:[eax],esp
 004DD85A    test        ebx,ebx
>004DD85C    je          004DD868
 004DD85E    mov         edx,dword ptr [ebp-8]
 004DD861    mov         eax,ebx
 004DD863    call        TComponent.InsertComponent
 004DD868    xor         eax,eax
 004DD86A    pop         edx
 004DD86B    pop         ecx
 004DD86C    pop         ecx
 004DD86D    mov         dword ptr fs:[eax],edx
>004DD870    jmp         004DD889
>004DD872    jmp         @HandleAnyException
 004DD877    mov         eax,dword ptr [ebp-8]
 004DD87A    call        TObject.Free
 004DD87F    call        @RaiseAgain
 004DD884    call        @DoneExcept
 004DD889    xor         eax,eax
 004DD88B    pop         edx
 004DD88C    pop         ecx
 004DD88D    pop         ecx
 004DD88E    mov         dword ptr fs:[eax],edx
 004DD891    push        4DD8A6
 004DD896    mov         eax,dword ptr [ebp-14]
 004DD899    call        TObject.Free
 004DD89E    ret
>004DD89F    jmp         @HandleFinally
>004DD8A4    jmp         004DD896
 004DD8A6    xor         eax,eax
 004DD8A8    pop         edx
 004DD8A9    pop         ecx
 004DD8AA    pop         ecx
 004DD8AB    mov         dword ptr fs:[eax],edx
 004DD8AE    push        4DD8C3
 004DD8B3    mov         eax,dword ptr [ebp-10]
 004DD8B6    call        TObject.Free
 004DD8BB    ret
>004DD8BC    jmp         @HandleFinally
>004DD8C1    jmp         004DD8B3
 004DD8C3    xor         eax,eax
 004DD8C5    pop         edx
 004DD8C6    pop         ecx
 004DD8C7    pop         ecx
 004DD8C8    mov         dword ptr fs:[eax],edx
 004DD8CB    push        4DD8E1
 004DD8D0    mov         eax,dword ptr [ebp-0C]
 004DD8D3    push        eax
 004DD8D4    call        kernel32.GlobalUnlock
 004DD8D9    ret
>004DD8DA    jmp         @HandleFinally
>004DD8DF    jmp         004DD8D0
 004DD8E1    xor         eax,eax
 004DD8E3    pop         edx
 004DD8E4    pop         ecx
 004DD8E5    pop         ecx
 004DD8E6    mov         dword ptr fs:[eax],edx
 004DD8E9    push        4DD8FE
 004DD8EE    mov         eax,dword ptr [ebp-4]
 004DD8F1    mov         edx,dword ptr [eax]
 004DD8F3    call        dword ptr [edx+14]
 004DD8F6    ret
>004DD8F7    jmp         @HandleFinally
>004DD8FC    jmp         004DD8EE
 004DD8FE    mov         eax,dword ptr [ebp-8]
 004DD901    pop         edi
 004DD902    pop         esi
 004DD903    pop         ebx
 004DD904    mov         esp,ebp
 004DD906    pop         ebp
 004DD907    ret
*}
end;

//004DD908
procedure TClipboard.SetBuffer(Format:Word; var Buffer:void ; Size:Integer);
begin
{*
 004DD908    push        ebp
 004DD909    mov         ebp,esp
 004DD90B    add         esp,0FFFFFFF8
 004DD90E    push        ebx
 004DD90F    push        esi
 004DD910    push        edi
 004DD911    mov         edi,ecx
 004DD913    mov         esi,edx
 004DD915    mov         dword ptr [ebp-4],eax
 004DD918    mov         ebx,dword ptr [ebp+8]
 004DD91B    mov         eax,dword ptr [ebp-4]
 004DD91E    mov         edx,dword ptr [eax]
 004DD920    call        dword ptr [edx+18]
 004DD923    xor         edx,edx
 004DD925    push        ebp
 004DD926    push        4DD9F5
 004DD92B    push        dword ptr fs:[edx]
 004DD92E    mov         dword ptr fs:[edx],esp
 004DD931    push        ebx
 004DD932    push        2002
 004DD937    call        kernel32.GlobalAlloc
 004DD93C    mov         dword ptr [ebp-8],eax
 004DD93F    xor         edx,edx
 004DD941    push        ebp
 004DD942    push        4DD9C7
 004DD947    push        dword ptr fs:[edx]
 004DD94A    mov         dword ptr fs:[edx],esp
 004DD94D    mov         eax,dword ptr [ebp-8]
 004DD950    push        eax
 004DD951    call        kernel32.GlobalLock
 004DD956    xor         edx,edx
 004DD958    push        ebp
 004DD959    push        4DD9B6
 004DD95E    push        dword ptr fs:[edx]
 004DD961    mov         dword ptr fs:[edx],esp
 004DD964    mov         edx,eax
 004DD966    mov         eax,edi
 004DD968    mov         ecx,ebx
 004DD96A    call        Move
 004DD96F    mov         eax,dword ptr [ebp-4]
 004DD972    call        TClipboard.Adding
 004DD977    mov         eax,dword ptr [ebp-8]
 004DD97A    push        eax
 004DD97B    movzx       eax,si
 004DD97E    push        eax
 004DD97F    call        user32.SetClipboardData
 004DD984    test        eax,eax
>004DD986    jne         004DD99F
 004DD988    mov         ecx,dword ptr ds:[78CD74];^SResString190:TResStringRec
 004DD98E    mov         dl,1
 004DD990    mov         eax,[004391C8];EOutOfResources
 004DD995    call        Exception.CreateRes
 004DD99A    call        @RaiseExcept
 004DD99F    xor         eax,eax
 004DD9A1    pop         edx
 004DD9A2    pop         ecx
 004DD9A3    pop         ecx
 004DD9A4    mov         dword ptr fs:[eax],edx
 004DD9A7    push        4DD9BD
 004DD9AC    mov         eax,dword ptr [ebp-8]
 004DD9AF    push        eax
 004DD9B0    call        kernel32.GlobalUnlock
 004DD9B5    ret
>004DD9B6    jmp         @HandleFinally
>004DD9BB    jmp         004DD9AC
 004DD9BD    xor         eax,eax
 004DD9BF    pop         edx
 004DD9C0    pop         ecx
 004DD9C1    pop         ecx
 004DD9C2    mov         dword ptr fs:[eax],edx
>004DD9C5    jmp         004DD9DF
>004DD9C7    jmp         @HandleAnyException
 004DD9CC    mov         eax,dword ptr [ebp-8]
 004DD9CF    push        eax
 004DD9D0    call        kernel32.GlobalFree
 004DD9D5    call        @RaiseAgain
 004DD9DA    call        @DoneExcept
 004DD9DF    xor         eax,eax
 004DD9E1    pop         edx
 004DD9E2    pop         ecx
 004DD9E3    pop         ecx
 004DD9E4    mov         dword ptr fs:[eax],edx
 004DD9E7    push        4DD9FC
 004DD9EC    mov         eax,dword ptr [ebp-4]
 004DD9EF    mov         edx,dword ptr [eax]
 004DD9F1    call        dword ptr [edx+14]
 004DD9F4    ret
>004DD9F5    jmp         @HandleFinally
>004DD9FA    jmp         004DD9EC
 004DD9FC    pop         edi
 004DD9FD    pop         esi
 004DD9FE    pop         ebx
 004DD9FF    pop         ecx
 004DDA00    pop         ecx
 004DDA01    pop         ebp
 004DDA02    ret         4
*}
end;

//004DDA08
procedure TClipboard.SetComponent(Component:TComponent);
begin
{*
 004DDA08    push        ebp
 004DDA09    mov         ebp,esp
 004DDA0B    push        ecx
 004DDA0C    push        ebx
 004DDA0D    push        esi
 004DDA0E    mov         esi,edx
 004DDA10    mov         ebx,eax
 004DDA12    mov         dl,1
 004DDA14    mov         eax,[0043DAFC];TMemoryStream
 004DDA19    call        TObject.Create
 004DDA1E    mov         dword ptr [ebp-4],eax
 004DDA21    xor         eax,eax
 004DDA23    push        ebp
 004DDA24    push        4DDA6B
 004DDA29    push        dword ptr fs:[eax]
 004DDA2C    mov         dword ptr fs:[eax],esp
 004DDA2F    mov         edx,esi
 004DDA31    mov         eax,dword ptr [ebp-4]
 004DDA34    call        TStream.WriteComponent
 004DDA39    mov         eax,dword ptr [ebp-4]
 004DDA3C    mov         edx,dword ptr [eax]
 004DDA3E    call        dword ptr [edx]
 004DDA40    push        eax
 004DDA41    mov         eax,dword ptr [ebp-4]
 004DDA44    mov         ecx,dword ptr [eax+4]
 004DDA47    movzx       edx,word ptr ds:[7932E2]
 004DDA4E    mov         eax,ebx
 004DDA50    call        TClipboard.SetBuffer
 004DDA55    xor         eax,eax
 004DDA57    pop         edx
 004DDA58    pop         ecx
 004DDA59    pop         ecx
 004DDA5A    mov         dword ptr fs:[eax],edx
 004DDA5D    push        4DDA72
 004DDA62    mov         eax,dword ptr [ebp-4]
 004DDA65    call        TObject.Free
 004DDA6A    ret
>004DDA6B    jmp         @HandleFinally
>004DDA70    jmp         004DDA62
 004DDA72    pop         esi
 004DDA73    pop         ebx
 004DDA74    pop         ecx
 004DDA75    pop         ebp
 004DDA76    ret
*}
end;

//004DDA78
function TClipboard.GetTextBuf(Buffer:PWideChar; BufSize:Integer):Integer;
begin
{*
 004DDA78    push        ebp
 004DDA79    mov         ebp,esp
 004DDA7B    add         esp,0FFFFFFF8
 004DDA7E    push        ebx
 004DDA7F    push        esi
 004DDA80    push        edi
 004DDA81    mov         edi,ecx
 004DDA83    mov         esi,edx
 004DDA85    mov         dword ptr [ebp-4],eax
 004DDA88    mov         eax,dword ptr [ebp-4]
 004DDA8B    mov         edx,dword ptr [eax]
 004DDA8D    call        dword ptr [edx+18]
 004DDA90    xor         eax,eax
 004DDA92    push        ebp
 004DDA93    push        4DDAE8
 004DDA98    push        dword ptr fs:[eax]
 004DDA9B    mov         dword ptr fs:[eax],esp
 004DDA9E    push        0D
 004DDAA0    call        user32.GetClipboardData
 004DDAA5    mov         ebx,eax
 004DDAA7    test        ebx,ebx
>004DDAA9    jne         004DDAB2
 004DDAAB    xor         eax,eax
 004DDAAD    mov         dword ptr [ebp-8],eax
>004DDAB0    jmp         004DDAD2
 004DDAB2    push        ebx
 004DDAB3    call        kernel32.GlobalLock
 004DDAB8    mov         edx,eax
 004DDABA    mov         ecx,edi
 004DDABC    dec         ecx
 004DDABD    mov         eax,esi
 004DDABF    call        StrLCopy
 004DDAC4    call        StrLen
 004DDAC9    mov         dword ptr [ebp-8],eax
 004DDACC    push        ebx
 004DDACD    call        kernel32.GlobalUnlock
 004DDAD2    xor         eax,eax
 004DDAD4    pop         edx
 004DDAD5    pop         ecx
 004DDAD6    pop         ecx
 004DDAD7    mov         dword ptr fs:[eax],edx
 004DDADA    push        4DDAEF
 004DDADF    mov         eax,dword ptr [ebp-4]
 004DDAE2    mov         edx,dword ptr [eax]
 004DDAE4    call        dword ptr [edx+14]
 004DDAE7    ret
>004DDAE8    jmp         @HandleFinally
>004DDAED    jmp         004DDADF
 004DDAEF    mov         eax,dword ptr [ebp-8]
 004DDAF2    pop         edi
 004DDAF3    pop         esi
 004DDAF4    pop         ebx
 004DDAF5    pop         ecx
 004DDAF6    pop         ecx
 004DDAF7    pop         ebp
 004DDAF8    ret
*}
end;

//004DDAFC
procedure TClipboard.SetTextBuf(Buffer:PWideChar);
begin
{*
 004DDAFC    push        ebx
 004DDAFD    push        esi
 004DDAFE    mov         esi,edx
 004DDB00    mov         ebx,eax
 004DDB02    mov         eax,esi
 004DDB04    call        StrLen
 004DDB09    add         eax,eax
 004DDB0B    add         eax,2
 004DDB0E    push        eax
 004DDB0F    mov         ecx,esi
 004DDB11    mov         dx,0D
 004DDB15    mov         eax,ebx
 004DDB17    call        TClipboard.SetBuffer
 004DDB1C    pop         esi
 004DDB1D    pop         ebx
 004DDB1E    ret
*}
end;

//004DDB20
function TClipboard.GetAsText:UnicodeString;
begin
{*
 004DDB20    push        ebp
 004DDB21    mov         ebp,esp
 004DDB23    add         esp,0FFFFFFF8
 004DDB26    push        ebx
 004DDB27    mov         ebx,edx
 004DDB29    mov         dword ptr [ebp-4],eax
 004DDB2C    mov         eax,dword ptr [ebp-4]
 004DDB2F    mov         edx,dword ptr [eax]
 004DDB31    call        dword ptr [edx+18]
 004DDB34    push        0D
 004DDB36    call        user32.GetClipboardData
 004DDB3B    mov         dword ptr [ebp-8],eax
 004DDB3E    xor         eax,eax
 004DDB40    push        ebp
 004DDB41    push        4DDB92
 004DDB46    push        dword ptr fs:[eax]
 004DDB49    mov         dword ptr fs:[eax],esp
 004DDB4C    cmp         dword ptr [ebp-8],0
>004DDB50    je          004DDB66
 004DDB52    mov         eax,dword ptr [ebp-8]
 004DDB55    push        eax
 004DDB56    call        kernel32.GlobalLock
 004DDB5B    mov         edx,eax
 004DDB5D    mov         eax,ebx
 004DDB5F    call        @UStrFromPWChar
>004DDB64    jmp         004DDB6D
 004DDB66    mov         eax,ebx
 004DDB68    call        @UStrClr
 004DDB6D    xor         eax,eax
 004DDB6F    pop         edx
 004DDB70    pop         ecx
 004DDB71    pop         ecx
 004DDB72    mov         dword ptr fs:[eax],edx
 004DDB75    push        4DDB99
 004DDB7A    cmp         dword ptr [ebp-8],0
>004DDB7E    je          004DDB89
 004DDB80    mov         eax,dword ptr [ebp-8]
 004DDB83    push        eax
 004DDB84    call        kernel32.GlobalUnlock
 004DDB89    mov         eax,dword ptr [ebp-4]
 004DDB8C    mov         edx,dword ptr [eax]
 004DDB8E    call        dword ptr [edx+14]
 004DDB91    ret
>004DDB92    jmp         @HandleFinally
>004DDB97    jmp         004DDB7A
 004DDB99    pop         ebx
 004DDB9A    pop         ecx
 004DDB9B    pop         ecx
 004DDB9C    pop         ebp
 004DDB9D    ret
*}
end;

//004DDBA0
procedure TClipboard.SetAsText(const Value:UnicodeString);
begin
{*
 004DDBA0    push        ebx
 004DDBA1    push        esi
 004DDBA2    push        edi
 004DDBA3    mov         esi,edx
 004DDBA5    mov         ebx,eax
 004DDBA7    mov         eax,esi
 004DDBA9    test        eax,eax
>004DDBAB    je          004DDBB2
 004DDBAD    sub         eax,4
 004DDBB0    mov         eax,dword ptr [eax]
 004DDBB2    mov         edi,eax
 004DDBB4    add         edi,edi
 004DDBB6    add         edi,2
 004DDBB9    push        edi
 004DDBBA    mov         eax,esi
 004DDBBC    call        @UStrToPWChar
 004DDBC1    mov         ecx,eax
 004DDBC3    mov         dx,0D
 004DDBC7    mov         eax,ebx
 004DDBC9    call        TClipboard.SetBuffer
 004DDBCE    pop         edi
 004DDBCF    pop         esi
 004DDBD0    pop         ebx
 004DDBD1    ret
*}
end;

//004DDBD4
procedure TClipboard.AssignToPicture(Dest:TPicture);
begin
{*
 004DDBD4    push        ebp
 004DDBD5    mov         ebp,esp
 004DDBD7    add         esp,0FFFFFFF8
 004DDBDA    push        ebx
 004DDBDB    push        esi
 004DDBDC    push        edi
 004DDBDD    mov         dword ptr [ebp-8],edx
 004DDBE0    mov         dword ptr [ebp-4],eax
 004DDBE3    mov         eax,dword ptr [ebp-4]
 004DDBE6    mov         edx,dword ptr [eax]
 004DDBE8    call        dword ptr [edx+18]
 004DDBEB    xor         eax,eax
 004DDBED    push        ebp
 004DDBEE    push        4DDC7C
 004DDBF3    push        dword ptr fs:[eax]
 004DDBF6    mov         dword ptr fs:[eax],esp
 004DDBF9    push        0
 004DDBFB    call        user32.EnumClipboardFormats
 004DDC00    mov         ebx,eax
 004DDC02    test        bx,bx
>004DDC05    je          004DDC4F
 004DDC07    mov         edx,ebx
 004DDC09    mov         eax,[0046279C];TPicture
 004DDC0E    call        TPicture.SupportsClipboardFormat
 004DDC13    test        al,al
>004DDC15    je          004DDC3F
 004DDC17    movzx       eax,bx
 004DDC1A    push        eax
 004DDC1B    call        user32.GetClipboardData
 004DDC20    mov         esi,eax
 004DDC22    push        9
 004DDC24    call        user32.GetClipboardData
 004DDC29    mov         edi,eax
 004DDC2B    push        edi
 004DDC2C    mov         ecx,esi
 004DDC2E    mov         edx,ebx
 004DDC30    mov         eax,dword ptr [ebp-8]
 004DDC33    call        TPicture.LoadFromClipboardFormat
 004DDC38    call        @TryFinallyExit
>004DDC3D    jmp         004DDC83
 004DDC3F    movzx       eax,bx
 004DDC42    push        eax
 004DDC43    call        user32.EnumClipboardFormats
 004DDC48    mov         ebx,eax
 004DDC4A    test        bx,bx
>004DDC4D    jne         004DDC07
 004DDC4F    mov         ecx,dword ptr ds:[78CEB8];^SResString281:TResStringRec
 004DDC55    mov         dl,1
 004DDC57    mov         eax,[004DD55C];EClipboardException
 004DDC5C    call        Exception.CreateRes
 004DDC61    call        @RaiseExcept
 004DDC66    xor         eax,eax
 004DDC68    pop         edx
 004DDC69    pop         ecx
 004DDC6A    pop         ecx
 004DDC6B    mov         dword ptr fs:[eax],edx
 004DDC6E    push        4DDC83
 004DDC73    mov         eax,dword ptr [ebp-4]
 004DDC76    mov         edx,dword ptr [eax]
 004DDC78    call        dword ptr [edx+14]
 004DDC7B    ret
>004DDC7C    jmp         @HandleFinally
>004DDC81    jmp         004DDC73
 004DDC83    pop         edi
 004DDC84    pop         esi
 004DDC85    pop         ebx
 004DDC86    pop         ecx
 004DDC87    pop         ecx
 004DDC88    pop         ebp
 004DDC89    ret
*}
end;

//004DDC8C
procedure TClipboard.AssignToBitmap(Dest:TBitmap);
begin
{*
 004DDC8C    push        ebp
 004DDC8D    mov         ebp,esp
 004DDC8F    add         esp,0FFFFFFF8
 004DDC92    push        ebx
 004DDC93    push        esi
 004DDC94    push        edi
 004DDC95    mov         dword ptr [ebp-8],edx
 004DDC98    mov         dword ptr [ebp-4],eax
 004DDC9B    mov         eax,dword ptr [ebp-4]
 004DDC9E    mov         edx,dword ptr [eax]
 004DDCA0    call        dword ptr [edx+18]
 004DDCA3    xor         eax,eax
 004DDCA5    push        ebp
 004DDCA6    push        4DDCE8
 004DDCAB    push        dword ptr fs:[eax]
 004DDCAE    mov         dword ptr fs:[eax],esp
 004DDCB1    push        2
 004DDCB3    call        user32.GetClipboardData
 004DDCB8    mov         esi,eax
 004DDCBA    push        9
 004DDCBC    call        user32.GetClipboardData
 004DDCC1    mov         edi,eax
 004DDCC3    push        edi
 004DDCC4    mov         ecx,esi
 004DDCC6    mov         dx,2
 004DDCCA    mov         eax,dword ptr [ebp-8]
 004DDCCD    mov         ebx,dword ptr [eax]
 004DDCCF    call        dword ptr [ebx+64]
 004DDCD2    xor         eax,eax
 004DDCD4    pop         edx
 004DDCD5    pop         ecx
 004DDCD6    pop         ecx
 004DDCD7    mov         dword ptr fs:[eax],edx
 004DDCDA    push        4DDCEF
 004DDCDF    mov         eax,dword ptr [ebp-4]
 004DDCE2    mov         edx,dword ptr [eax]
 004DDCE4    call        dword ptr [edx+14]
 004DDCE7    ret
>004DDCE8    jmp         @HandleFinally
>004DDCED    jmp         004DDCDF
 004DDCEF    pop         edi
 004DDCF0    pop         esi
 004DDCF1    pop         ebx
 004DDCF2    pop         ecx
 004DDCF3    pop         ecx
 004DDCF4    pop         ebp
 004DDCF5    ret
*}
end;

//004DDCF8
procedure TClipboard.AssignToMetafile(Dest:TMetafile);
begin
{*
 004DDCF8    push        ebp
 004DDCF9    mov         ebp,esp
 004DDCFB    push        ecx
 004DDCFC    push        ebx
 004DDCFD    push        esi
 004DDCFE    mov         esi,edx
 004DDD00    mov         dword ptr [ebp-4],eax
 004DDD03    mov         eax,dword ptr [ebp-4]
 004DDD06    mov         edx,dword ptr [eax]
 004DDD08    call        dword ptr [edx+18]
 004DDD0B    xor         edx,edx
 004DDD0D    push        ebp
 004DDD0E    push        4DDD4D
 004DDD13    push        dword ptr fs:[edx]
 004DDD16    mov         dword ptr fs:[edx],esp
 004DDD19    push        3
 004DDD1B    call        user32.GetClipboardData
 004DDD20    mov         ebx,eax
 004DDD22    push        9
 004DDD24    call        user32.GetClipboardData
 004DDD29    push        eax
 004DDD2A    mov         ecx,ebx
 004DDD2C    mov         dx,3
 004DDD30    mov         eax,esi
 004DDD32    mov         ebx,dword ptr [eax]
 004DDD34    call        dword ptr [ebx+64]
 004DDD37    xor         eax,eax
 004DDD39    pop         edx
 004DDD3A    pop         ecx
 004DDD3B    pop         ecx
 004DDD3C    mov         dword ptr fs:[eax],edx
 004DDD3F    push        4DDD54
 004DDD44    mov         eax,dword ptr [ebp-4]
 004DDD47    mov         edx,dword ptr [eax]
 004DDD49    call        dword ptr [edx+14]
 004DDD4C    ret
>004DDD4D    jmp         @HandleFinally
>004DDD52    jmp         004DDD44
 004DDD54    pop         esi
 004DDD55    pop         ebx
 004DDD56    pop         ecx
 004DDD57    pop         ebp
 004DDD58    ret
*}
end;

//004DDD5C
procedure TClipboard.AssignTo(Dest:TPersistent);
begin
{*
 004DDD5C    push        ebx
 004DDD5D    push        esi
 004DDD5E    mov         ebx,edx
 004DDD60    mov         esi,eax
 004DDD62    mov         eax,ebx
 004DDD64    mov         edx,dword ptr ds:[46279C];TPicture
 004DDD6A    call        @IsClass
 004DDD6F    test        al,al
>004DDD71    je          004DDD7F
 004DDD73    mov         edx,ebx
 004DDD75    mov         eax,esi
 004DDD77    call        TClipboard.AssignToPicture
 004DDD7C    pop         esi
 004DDD7D    pop         ebx
 004DDD7E    ret
 004DDD7F    mov         eax,ebx
 004DDD81    mov         edx,dword ptr ds:[463B28];TBitmap
 004DDD87    call        @IsClass
 004DDD8C    test        al,al
>004DDD8E    je          004DDD9B
 004DDD90    mov         edx,ebx
 004DDD92    mov         eax,esi
 004DDD94    call        TClipboard.AssignToBitmap
>004DDD99    jmp         004DDDC0
 004DDD9B    mov         eax,ebx
 004DDD9D    mov         edx,dword ptr ds:[4632EC];TMetafile
 004DDDA3    call        @IsClass
 004DDDA8    test        al,al
>004DDDAA    je          004DDDB7
 004DDDAC    mov         edx,ebx
 004DDDAE    mov         eax,esi
 004DDDB0    call        TClipboard.AssignToMetafile
>004DDDB5    jmp         004DDDC0
 004DDDB7    mov         edx,ebx
 004DDDB9    mov         eax,esi
 004DDDBB    call        TPersistent.AssignTo
 004DDDC0    pop         esi
 004DDDC1    pop         ebx
 004DDDC2    ret
*}
end;

//004DDDC4
procedure TClipboard.AssignPicture(Source:TPicture);
begin
{*
 004DDDC4    push        ebp
 004DDDC5    mov         ebp,esp
 004DDDC7    add         esp,0FFFFFFF0
 004DDDCA    push        ebx
 004DDDCB    mov         ebx,edx
 004DDDCD    mov         dword ptr [ebp-4],eax
 004DDDD0    mov         eax,dword ptr [ebp-4]
 004DDDD3    mov         edx,dword ptr [eax]
 004DDDD5    call        dword ptr [edx+18]
 004DDDD8    xor         eax,eax
 004DDDDA    push        ebp
 004DDDDB    push        4DDE39
 004DDDE0    push        dword ptr fs:[eax]
 004DDDE3    mov         dword ptr fs:[eax],esp
 004DDDE6    mov         eax,dword ptr [ebp-4]
 004DDDE9    call        TClipboard.Adding
 004DDDEE    xor         eax,eax
 004DDDF0    mov         dword ptr [ebp-10],eax
 004DDDF3    lea         eax,[ebp-10]
 004DDDF6    push        eax
 004DDDF7    lea         ecx,[ebp-8]
 004DDDFA    lea         edx,[ebp-0A]
 004DDDFD    mov         eax,ebx
 004DDDFF    call        TPicture.SaveToClipboardFormat
 004DDE04    mov         eax,dword ptr [ebp-8]
 004DDE07    push        eax
 004DDE08    movzx       eax,word ptr [ebp-0A]
 004DDE0C    push        eax
 004DDE0D    call        user32.SetClipboardData
 004DDE12    cmp         dword ptr [ebp-10],0
>004DDE16    je          004DDE23
 004DDE18    mov         eax,dword ptr [ebp-10]
 004DDE1B    push        eax
 004DDE1C    push        9
 004DDE1E    call        user32.SetClipboardData
 004DDE23    xor         eax,eax
 004DDE25    pop         edx
 004DDE26    pop         ecx
 004DDE27    pop         ecx
 004DDE28    mov         dword ptr fs:[eax],edx
 004DDE2B    push        4DDE40
 004DDE30    mov         eax,dword ptr [ebp-4]
 004DDE33    mov         edx,dword ptr [eax]
 004DDE35    call        dword ptr [edx+14]
 004DDE38    ret
>004DDE39    jmp         @HandleFinally
>004DDE3E    jmp         004DDE30
 004DDE40    pop         ebx
 004DDE41    mov         esp,ebp
 004DDE43    pop         ebp
 004DDE44    ret
*}
end;

//004DDE48
procedure TClipboard.AssignGraphic(Source:TGraphic);
begin
{*
 004DDE48    push        ebp
 004DDE49    mov         ebp,esp
 004DDE4B    add         esp,0FFFFFFF0
 004DDE4E    push        ebx
 004DDE4F    mov         ebx,edx
 004DDE51    mov         dword ptr [ebp-4],eax
 004DDE54    mov         eax,dword ptr [ebp-4]
 004DDE57    mov         edx,dword ptr [eax]
 004DDE59    call        dword ptr [edx+18]
 004DDE5C    xor         eax,eax
 004DDE5E    push        ebp
 004DDE5F    push        4DDEBD
 004DDE64    push        dword ptr fs:[eax]
 004DDE67    mov         dword ptr fs:[eax],esp
 004DDE6A    mov         eax,dword ptr [ebp-4]
 004DDE6D    call        TClipboard.Adding
 004DDE72    xor         eax,eax
 004DDE74    mov         dword ptr [ebp-10],eax
 004DDE77    lea         eax,[ebp-10]
 004DDE7A    push        eax
 004DDE7B    lea         ecx,[ebp-8]
 004DDE7E    lea         edx,[ebp-0A]
 004DDE81    mov         eax,ebx
 004DDE83    mov         ebx,dword ptr [eax]
 004DDE85    call        dword ptr [ebx+68]
 004DDE88    mov         eax,dword ptr [ebp-8]
 004DDE8B    push        eax
 004DDE8C    movzx       eax,word ptr [ebp-0A]
 004DDE90    push        eax
 004DDE91    call        user32.SetClipboardData
 004DDE96    cmp         dword ptr [ebp-10],0
>004DDE9A    je          004DDEA7
 004DDE9C    mov         eax,dword ptr [ebp-10]
 004DDE9F    push        eax
 004DDEA0    push        9
 004DDEA2    call        user32.SetClipboardData
 004DDEA7    xor         eax,eax
 004DDEA9    pop         edx
 004DDEAA    pop         ecx
 004DDEAB    pop         ecx
 004DDEAC    mov         dword ptr fs:[eax],edx
 004DDEAF    push        4DDEC4
 004DDEB4    mov         eax,dword ptr [ebp-4]
 004DDEB7    mov         edx,dword ptr [eax]
 004DDEB9    call        dword ptr [edx+14]
 004DDEBC    ret
>004DDEBD    jmp         @HandleFinally
>004DDEC2    jmp         004DDEB4
 004DDEC4    pop         ebx
 004DDEC5    mov         esp,ebp
 004DDEC7    pop         ebp
 004DDEC8    ret
*}
end;

//004DDECC
procedure TClipboard.Assign(Source:TPersistent);
begin
{*
 004DDECC    push        ebx
 004DDECD    push        esi
 004DDECE    mov         ebx,edx
 004DDED0    mov         esi,eax
 004DDED2    mov         eax,ebx
 004DDED4    mov         edx,dword ptr ds:[46279C];TPicture
 004DDEDA    call        @IsClass
 004DDEDF    test        al,al
>004DDEE1    je          004DDEEF
 004DDEE3    mov         edx,ebx
 004DDEE5    mov         eax,esi
 004DDEE7    call        TClipboard.AssignPicture
 004DDEEC    pop         esi
 004DDEED    pop         ebx
 004DDEEE    ret
 004DDEEF    mov         eax,ebx
 004DDEF1    mov         edx,dword ptr ds:[462108];TGraphic
 004DDEF7    call        @IsClass
 004DDEFC    test        al,al
>004DDEFE    je          004DDF0B
 004DDF00    mov         edx,ebx
 004DDF02    mov         eax,esi
 004DDF04    call        TClipboard.AssignGraphic
>004DDF09    jmp         004DDF14
 004DDF0B    mov         edx,ebx
 004DDF0D    mov         eax,esi
 004DDF0F    call        TPersistent.Assign
 004DDF14    pop         esi
 004DDF15    pop         ebx
 004DDF16    ret
*}
end;

//004DDF18
function TClipboard.GetAsHandle(Format:Word):Cardinal;
begin
{*
 004DDF18    push        ebp
 004DDF19    mov         ebp,esp
 004DDF1B    add         esp,0FFFFFFF8
 004DDF1E    push        ebx
 004DDF1F    mov         ebx,edx
 004DDF21    mov         dword ptr [ebp-4],eax
 004DDF24    mov         eax,dword ptr [ebp-4]
 004DDF27    mov         edx,dword ptr [eax]
 004DDF29    call        dword ptr [edx+18]
 004DDF2C    xor         eax,eax
 004DDF2E    push        ebp
 004DDF2F    push        4DDF5C
 004DDF34    push        dword ptr fs:[eax]
 004DDF37    mov         dword ptr fs:[eax],esp
 004DDF3A    movzx       eax,bx
 004DDF3D    push        eax
 004DDF3E    call        user32.GetClipboardData
 004DDF43    mov         dword ptr [ebp-8],eax
 004DDF46    xor         eax,eax
 004DDF48    pop         edx
 004DDF49    pop         ecx
 004DDF4A    pop         ecx
 004DDF4B    mov         dword ptr fs:[eax],edx
 004DDF4E    push        4DDF63
 004DDF53    mov         eax,dword ptr [ebp-4]
 004DDF56    mov         edx,dword ptr [eax]
 004DDF58    call        dword ptr [edx+14]
 004DDF5B    ret
>004DDF5C    jmp         @HandleFinally
>004DDF61    jmp         004DDF53
 004DDF63    mov         eax,dword ptr [ebp-8]
 004DDF66    pop         ebx
 004DDF67    pop         ecx
 004DDF68    pop         ecx
 004DDF69    pop         ebp
 004DDF6A    ret
*}
end;

//004DDF6C
procedure TClipboard.SetAsHandle(Format:Word; Value:Cardinal);
begin
{*
 004DDF6C    push        ebp
 004DDF6D    mov         ebp,esp
 004DDF6F    push        ecx
 004DDF70    push        ebx
 004DDF71    push        esi
 004DDF72    mov         esi,ecx
 004DDF74    mov         ebx,edx
 004DDF76    mov         dword ptr [ebp-4],eax
 004DDF79    mov         eax,dword ptr [ebp-4]
 004DDF7C    mov         edx,dword ptr [eax]
 004DDF7E    call        dword ptr [edx+18]
 004DDF81    xor         eax,eax
 004DDF83    push        ebp
 004DDF84    push        4DDFB7
 004DDF89    push        dword ptr fs:[eax]
 004DDF8C    mov         dword ptr fs:[eax],esp
 004DDF8F    mov         eax,dword ptr [ebp-4]
 004DDF92    call        TClipboard.Adding
 004DDF97    push        esi
 004DDF98    movzx       eax,bx
 004DDF9B    push        eax
 004DDF9C    call        user32.SetClipboardData
 004DDFA1    xor         eax,eax
 004DDFA3    pop         edx
 004DDFA4    pop         ecx
 004DDFA5    pop         ecx
 004DDFA6    mov         dword ptr fs:[eax],edx
 004DDFA9    push        4DDFBE
 004DDFAE    mov         eax,dword ptr [ebp-4]
 004DDFB1    mov         edx,dword ptr [eax]
 004DDFB3    call        dword ptr [edx+14]
 004DDFB6    ret
>004DDFB7    jmp         @HandleFinally
>004DDFBC    jmp         004DDFAE
 004DDFBE    pop         esi
 004DDFBF    pop         ebx
 004DDFC0    pop         ecx
 004DDFC1    pop         ebp
 004DDFC2    ret
*}
end;

//004DDFCC
function HasAPicture:Boolean;
begin
{*
 004DDFCC    push        ebp
 004DDFCD    mov         ebp,esp
 004DDFCF    push        ecx
 004DDFD0    push        ebx
 004DDFD1    mov         eax,dword ptr [ebp+8]
 004DDFD4    mov         eax,dword ptr [eax-4]
 004DDFD7    mov         edx,dword ptr [eax]
 004DDFD9    call        dword ptr [edx+18]
 004DDFDC    xor         eax,eax
 004DDFDE    push        ebp
 004DDFDF    push        4DE03B
 004DDFE4    push        dword ptr fs:[eax]
 004DDFE7    mov         dword ptr fs:[eax],esp
 004DDFEA    mov         byte ptr [ebp-1],0
 004DDFEE    push        0
 004DDFF0    call        user32.EnumClipboardFormats
 004DDFF5    mov         ebx,eax
 004DDFF7    test        bx,bx
>004DDFFA    je          004DE022
 004DDFFC    mov         edx,ebx
 004DDFFE    mov         eax,[0046279C];TPicture
 004DE003    call        TPicture.SupportsClipboardFormat
 004DE008    test        al,al
>004DE00A    je          004DE012
 004DE00C    mov         byte ptr [ebp-1],1
>004DE010    jmp         004DE022
 004DE012    movzx       eax,bx
 004DE015    push        eax
 004DE016    call        user32.EnumClipboardFormats
 004DE01B    mov         ebx,eax
 004DE01D    test        bx,bx
>004DE020    jne         004DDFFC
 004DE022    xor         eax,eax
 004DE024    pop         edx
 004DE025    pop         ecx
 004DE026    pop         ecx
 004DE027    mov         dword ptr fs:[eax],edx
 004DE02A    push        4DE042
 004DE02F    mov         eax,dword ptr [ebp+8]
 004DE032    mov         eax,dword ptr [eax-4]
 004DE035    mov         edx,dword ptr [eax]
 004DE037    call        dword ptr [edx+14]
 004DE03A    ret
>004DE03B    jmp         @HandleFinally
>004DE040    jmp         004DE02F
 004DE042    movzx       eax,byte ptr [ebp-1]
 004DE046    pop         ebx
 004DE047    pop         ecx
 004DE048    pop         ebp
 004DE049    ret
*}
end;

//004DE04C
function TClipboard.HasFormat(Format:Word):Boolean;
begin
{*
 004DE04C    push        ebp
 004DE04D    mov         ebp,esp
 004DE04F    push        ecx
 004DE050    push        ebx
 004DE051    mov         ebx,edx
 004DE053    mov         dword ptr [ebp-4],eax
 004DE056    movzx       eax,bx
 004DE059    push        eax
 004DE05A    call        user32.IsClipboardFormatAvailable
 004DE05F    test        eax,eax
>004DE061    jne         004DE07B
 004DE063    cmp         bx,word ptr ds:[7932E0]
>004DE06A    jne         004DE077
 004DE06C    push        ebp
 004DE06D    call        HasAPicture
 004DE072    pop         ecx
 004DE073    test        al,al
>004DE075    jne         004DE07B
 004DE077    xor         eax,eax
>004DE079    jmp         004DE07D
 004DE07B    mov         al,1
 004DE07D    pop         ebx
 004DE07E    pop         ecx
 004DE07F    pop         ebp
 004DE080    ret
*}
end;

//004DE084
function Clipboard:TClipboard;
begin
{*
 004DE084    cmp         dword ptr ds:[7932E8],0;gvar_007932E8
>004DE08B    jne         004DE09E
 004DE08D    mov         dl,1
 004DE08F    mov         eax,[004DD0F8];TClipboard
 004DE094    call        TObject.Create
 004DE099    mov         [007932E8],eax;gvar_007932E8
 004DE09E    mov         eax,[007932E8];gvar_007932E8
 004DE0A3    ret
*}
end;

//004DE0A4
procedure TClipboard.MainWndProc(var Message:TMessage);
begin
{*
 004DE0A4    push        ebp
 004DE0A5    mov         ebp,esp
 004DE0A7    push        ecx
 004DE0A8    push        ebx
 004DE0A9    push        esi
 004DE0AA    push        edi
 004DE0AB    mov         dword ptr [ebp-4],eax
 004DE0AE    xor         eax,eax
 004DE0B0    push        ebp
 004DE0B1    push        4DE0CE
 004DE0B6    push        dword ptr fs:[eax]
 004DE0B9    mov         dword ptr fs:[eax],esp
 004DE0BC    mov         eax,dword ptr [ebp-4]
 004DE0BF    mov         ecx,dword ptr [eax]
 004DE0C1    call        dword ptr [ecx+0C]
 004DE0C4    xor         eax,eax
 004DE0C6    pop         edx
 004DE0C7    pop         ecx
 004DE0C8    pop         ecx
 004DE0C9    mov         dword ptr fs:[eax],edx
>004DE0CC    jmp         004DE0F9
>004DE0CE    jmp         @HandleAnyException
 004DE0D3    mov         eax,[0078D354]
 004DE0D8    cmp         word ptr [eax+2],0
>004DE0DD    je          004DE0EF
 004DE0DF    mov         ebx,dword ptr ds:[78D354]
 004DE0E5    mov         edx,dword ptr [ebp-4]
 004DE0E8    mov         eax,dword ptr [ebx+4]
 004DE0EB    call        dword ptr [ebx]
>004DE0ED    jmp         004DE0F4
 004DE0EF    call        @RaiseAgain
 004DE0F4    call        @DoneExcept
 004DE0F9    pop         edi
 004DE0FA    pop         esi
 004DE0FB    pop         ebx
 004DE0FC    pop         ecx
 004DE0FD    pop         ebp
 004DE0FE    ret
*}
end;

//004DE100
destructor TClipboard.Destroy();
begin
{*
 004DE100    push        ebx
 004DE101    push        esi
 004DE102    call        @BeforeDestruction
 004DE107    mov         ebx,edx
 004DE109    mov         esi,eax
 004DE10B    cmp         esi,dword ptr ds:[7932E8];gvar_007932E8
>004DE111    jne         004DE11A
 004DE113    xor         eax,eax
 004DE115    mov         [007932E8],eax;gvar_007932E8
 004DE11A    mov         edx,ebx
 004DE11C    and         dl,0FC
 004DE11F    mov         eax,esi
 004DE121    call        TMemoryStream.Destroy
 004DE126    test        bl,bl
>004DE128    jle         004DE131
 004DE12A    mov         eax,esi
 004DE12C    call        @ClassDestroy
 004DE131    pop         esi
 004DE132    pop         ebx
 004DE133    ret
*}
end;

Initialization
//00780BA0
{*
 00780BA0    sub         dword ptr ds:[7932E4],1
>00780BA7    jae         00780BD0
 00780BA9    push        780BD4
 00780BAE    call        user32.RegisterClipboardFormatW
 00780BB3    mov         [007932E0],ax
 00780BB9    push        780BF4
 00780BBE    call        user32.RegisterClipboardFormatW
 00780BC3    mov         [007932E2],ax
 00780BC9    xor         eax,eax
 00780BCB    mov         [007932E8],eax;gvar_007932E8
 00780BD0    ret
*}
Finalization
end.