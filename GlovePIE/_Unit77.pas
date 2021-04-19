//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit77;

interface

uses
  SysUtils, Classes;

type
  TPlacementOption = (fpState, fpSize, fpLocation, fpActiveControl);
  TPlacementOptions = set of TPlacementOption;
  THtmlCode = THtmlCode = record//size=8
f0:string;//f0
f4:UTF8String;//f4
end;
Html:string;//f0
Text:UTF8String;//f4
end;;
    //function sub_0056BDF4:?;//0056BDF4
    //function sub_0056BE04:?;//0056BE04
    //function sub_0056BE38:?;//0056BE38
    //function sub_0056BF88(?:?):?;//0056BF88
    //procedure sub_0056BFC0(?:?; ?:?);//0056BFC0
    //procedure sub_0056C108(?:?);//0056C108
    //procedure sub_0056C164(?:?; ?:?; ?:?);//0056C164
    //procedure sub_0056C204(?:?; ?:?; ?:?);//0056C204
    //procedure sub_0056C278(?:?; ?:TJvCustomAppStorage; ?:string; ?:?);//0056C278
    //function sub_0056C598(?:?; ?:?):?;//0056C598
    //procedure sub_0056C5F0(?:?; ?:TJvCustomAppStorage; ?:string; ?:?);//0056C5F0
    //function sub_0056CCAC(?:?; ?:?; ?:?; ?:?):?;//0056CCAC
    procedure sub_0056CD90;//0056CD90
    procedure sub_0056CD98;//0056CD98
    //function sub_0056D000(?:TJvComponent; ?:TComponent; ?:?):?;//0056D000

implementation

//0056BDF4
{*function sub_0056BDF4:?;
begin
 0056BDF4    mov         eax,[0078D590];^Application:TApplication
 0056BDF9    mov         eax,dword ptr [eax]
 0056BDFB    mov         eax,dword ptr [eax+170];TApplication.FHandle:HWND
 0056BE01    ret
end;*}

//0056BE04
{*function sub_0056BE04:?;
begin
 0056BE04    call        0056BDF4
 0056BE09    push        eax
 0056BE0A    call        user32.IsIconic
 0056BE0F    cmp         eax,1
 0056BE12    sbb         eax,eax
 0056BE14    inc         eax
 0056BE15    ret
end;*}

//0056BE38
{*function sub_0056BE38:?;
begin
 0056BE38    add         esp,0FFFFFFF8
 0056BE3B    call        user32.GetActiveWindow
 0056BE40    mov         dword ptr [esp],eax
 0056BE43    mov         byte ptr [esp+4],0
 0056BE48    mov         eax,esp
 0056BE4A    push        eax
 0056BE4B    push        56BE18
 0056BE50    call        kernel32.GetCurrentThreadId
 0056BE55    push        eax
 0056BE56    call        user32.EnumThreadWindows
 0056BE5B    movzx       eax,byte ptr [esp+4]
 0056BE60    pop         ecx
 0056BE61    pop         edx
 0056BE62    ret
end;*}

//0056BF88
{*function sub_0056BF88(?:?):?;
begin
 0056BF88    push        ebx
 0056BF89    mov         ebx,eax
>0056BF8B    jmp         0056BF90
 0056BF8D    mov         ebx,dword ptr [ebx+34]
 0056BF90    mov         eax,ebx
 0056BF92    mov         edx,dword ptr ds:[4DF7D4];TCustomForm
 0056BF98    call        @IsClass
 0056BF9D    test        al,al
>0056BF9F    jne         0056BFA7
 0056BFA1    cmp         dword ptr [ebx+34],0
>0056BFA5    jne         0056BF8D
 0056BFA7    mov         eax,ebx
 0056BFA9    mov         edx,dword ptr ds:[4DF7D4];TCustomForm
 0056BFAF    call        @IsClass
 0056BFB4    test        al,al
>0056BFB6    je          0056BFBC
 0056BFB8    mov         eax,ebx
 0056BFBA    pop         ebx
 0056BFBB    ret
 0056BFBC    xor         eax,eax
 0056BFBE    pop         ebx
 0056BFBF    ret
end;*}

//0056BFC0
{*procedure sub_0056BFC0(?:?; ?:?);
begin
 0056BFC0    push        ebp
 0056BFC1    mov         ebp,esp
 0056BFC3    add         esp,0FFFFFFE4
 0056BFC6    push        ebx
 0056BFC7    push        esi
 0056BFC8    push        edi
 0056BFC9    xor         ecx,ecx
 0056BFCB    mov         dword ptr [ebp-8],ecx
 0056BFCE    mov         dword ptr [ebp-1C],ecx
 0056BFD1    mov         dword ptr [ebp-4],ecx
 0056BFD4    mov         esi,edx
 0056BFD6    mov         ebx,eax
 0056BFD8    xor         eax,eax
 0056BFDA    push        ebp
 0056BFDB    push        56C0DF
 0056BFE0    push        dword ptr fs:[eax]
 0056BFE3    mov         dword ptr fs:[eax],esp
 0056BFE6    test        ebx,ebx
>0056BFE8    je          0056C0B5
 0056BFEE    mov         eax,ebx
 0056BFF0    mov         edx,dword ptr ds:[4DF7D4];TCustomForm
 0056BFF6    call        @IsClass
 0056BFFB    test        al,al
>0056BFFD    je          0056C00D
 0056BFFF    mov         edx,esi
 0056C001    mov         eax,dword ptr [ebx]
 0056C003    call        TObject.ClassName
>0056C008    jmp         0056C0BC
 0056C00D    mov         eax,esi
 0056C00F    mov         edx,dword ptr [ebx+8]
 0056C012    call        @UStrAsg
 0056C017    mov         eax,ebx
 0056C019    mov         edx,dword ptr ds:[47A16C];TControl
 0056C01F    call        @IsClass
 0056C024    test        al,al
>0056C026    je          0056C062
 0056C028    mov         eax,ebx
 0056C02A    call        0056BF88
 0056C02F    mov         edi,eax
 0056C031    test        edi,edi
>0056C033    je          0056C04D
 0056C035    lea         edx,[ebp-4]
 0056C038    mov         eax,dword ptr [edi]
 0056C03A    call        TObject.ClassName
 0056C03F    mov         edx,dword ptr [ebp-4]
 0056C042    mov         ecx,dword ptr [esi]
 0056C044    mov         eax,esi
 0056C046    call        @UStrCat3
>0056C04B    jmp         0056C0BC
 0056C04D    mov         edi,dword ptr [ebx+34]
 0056C050    test        edi,edi
>0056C052    je          0056C0BC
 0056C054    mov         ecx,dword ptr [esi]
 0056C056    mov         edx,dword ptr [edi+8]
 0056C059    mov         eax,esi
 0056C05B    call        @UStrCat3
>0056C060    jmp         0056C0BC
 0056C062    mov         ebx,dword ptr [ebx+4]
 0056C065    mov         eax,ebx
 0056C067    mov         edx,dword ptr ds:[4E0C38];TForm
 0056C06D    call        @IsClass
 0056C072    test        al,al
>0056C074    je          0056C0BC
 0056C076    lea         eax,[ebp-8]
 0056C079    push        eax
 0056C07A    lea         edx,[ebp-1C]
 0056C07D    mov         eax,dword ptr [ebx]
 0056C07F    call        TObject.ClassName
 0056C084    mov         eax,dword ptr [ebp-1C]
 0056C087    mov         dword ptr [ebp-18],eax
 0056C08A    mov         byte ptr [ebp-14],11
 0056C08E    mov         eax,dword ptr [esi]
 0056C090    mov         dword ptr [ebp-10],eax
 0056C093    mov         byte ptr [ebp-0C],11
 0056C097    lea         edx,[ebp-18]
 0056C09A    mov         ecx,1
 0056C09F    mov         eax,56C0FC;'%s.%s'
 0056C0A4    call        Format
 0056C0A9    mov         edx,dword ptr [ebp-8]
 0056C0AC    mov         eax,esi
 0056C0AE    call        @UStrAsg
>0056C0B3    jmp         0056C0BC
 0056C0B5    mov         eax,esi
 0056C0B7    call        @UStrClr
 0056C0BC    xor         eax,eax
 0056C0BE    pop         edx
 0056C0BF    pop         ecx
 0056C0C0    pop         ecx
 0056C0C1    mov         dword ptr fs:[eax],edx
 0056C0C4    push        56C0E6
 0056C0C9    lea         eax,[ebp-1C]
 0056C0CC    call        @UStrClr
 0056C0D1    lea         eax,[ebp-8]
 0056C0D4    mov         edx,2
 0056C0D9    call        @UStrArrayClr
 0056C0DE    ret
>0056C0DF    jmp         @HandleFinally
>0056C0E4    jmp         0056C0C9
 0056C0E6    pop         edi
 0056C0E7    pop         esi
 0056C0E8    pop         ebx
 0056C0E9    mov         esp,ebp
 0056C0EB    pop         ebp
 0056C0EC    ret
end;*}

//0056C108
{*procedure sub_0056C108(?:?);
begin
 0056C108    push        ebx
 0056C109    add         esp,0FFFFFFF0
 0056C10C    mov         ebx,eax
 0056C10E    push        ebx
 0056C10F    push        0
 0056C111    call        user32.GetSystemMetrics
 0056C116    mov         dword ptr [esp+4],eax
 0056C11A    mov         byte ptr [esp+8],0
 0056C11F    push        1
 0056C121    call        user32.GetSystemMetrics
 0056C126    mov         dword ptr [esp+0C],eax
 0056C12A    mov         byte ptr [esp+10],0
 0056C12F    lea         edx,[esp+4]
 0056C133    mov         ecx,1
 0056C138    mov         eax,56C154;'(%dx%d)'
 0056C13D    call        Format
 0056C142    add         esp,10
 0056C145    pop         ebx
 0056C146    ret
end;*}

//0056C164
{*procedure sub_0056C164(?:?; ?:?; ?:?);
begin
 0056C164    push        ebp
 0056C165    mov         ebp,esp
 0056C167    push        0
 0056C169    push        0
 0056C16B    push        0
 0056C16D    push        0
 0056C16F    push        ebx
 0056C170    push        esi
 0056C171    push        edi
 0056C172    mov         edi,ecx
 0056C174    mov         esi,edx
 0056C176    mov         ebx,eax
 0056C178    xor         eax,eax
 0056C17A    push        ebp
 0056C17B    push        56C1F4
 0056C180    push        dword ptr fs:[eax]
 0056C183    mov         dword ptr fs:[eax],esp
 0056C186    lea         eax,[ebp-8]
 0056C189    call        0056C108
 0056C18E    mov         ecx,dword ptr [ebp-8]
 0056C191    lea         eax,[ebp-4]
 0056C194    mov         edx,esi
 0056C196    call        @UStrCat3
 0056C19B    mov         edx,dword ptr [ebp-4]
 0056C19E    mov         eax,ebx
 0056C1A0    call        TJvCustomAppStorage.ValueStored
 0056C1A5    test        al,al
>0056C1A7    je          0056C1CD
 0056C1A9    push        edi
 0056C1AA    lea         eax,[ebp-10]
 0056C1AD    call        0056C108
 0056C1B2    mov         ecx,dword ptr [ebp-10]
 0056C1B5    lea         eax,[ebp-0C]
 0056C1B8    mov         edx,esi
 0056C1BA    call        @UStrCat3
 0056C1BF    mov         edx,dword ptr [ebp-0C]
 0056C1C2    xor         ecx,ecx
 0056C1C4    mov         eax,ebx
 0056C1C6    call        TJvCustomAppStorage.ReadString
>0056C1CB    jmp         0056C1D9
 0056C1CD    push        edi
 0056C1CE    xor         ecx,ecx
 0056C1D0    mov         edx,esi
 0056C1D2    mov         eax,ebx
 0056C1D4    call        TJvCustomAppStorage.ReadString
 0056C1D9    xor         eax,eax
 0056C1DB    pop         edx
 0056C1DC    pop         ecx
 0056C1DD    pop         ecx
 0056C1DE    mov         dword ptr fs:[eax],edx
 0056C1E1    push        56C1FB
 0056C1E6    lea         eax,[ebp-10]
 0056C1E9    mov         edx,4
 0056C1EE    call        @UStrArrayClr
 0056C1F3    ret
>0056C1F4    jmp         @HandleFinally
>0056C1F9    jmp         0056C1E6
 0056C1FB    pop         edi
 0056C1FC    pop         esi
 0056C1FD    pop         ebx
 0056C1FE    mov         esp,ebp
 0056C200    pop         ebp
 0056C201    ret
end;*}

//0056C204
{*procedure sub_0056C204(?:?; ?:?; ?:?);
begin
 0056C204    push        ebp
 0056C205    mov         ebp,esp
 0056C207    push        0
 0056C209    push        0
 0056C20B    push        ebx
 0056C20C    push        esi
 0056C20D    push        edi
 0056C20E    mov         edi,ecx
 0056C210    mov         esi,edx
 0056C212    mov         ebx,eax
 0056C214    xor         eax,eax
 0056C216    push        ebp
 0056C217    push        56C269
 0056C21C    push        dword ptr fs:[eax]
 0056C21F    mov         dword ptr fs:[eax],esp
 0056C222    lea         eax,[ebp-8]
 0056C225    call        0056C108
 0056C22A    mov         ecx,dword ptr [ebp-8]
 0056C22D    lea         eax,[ebp-4]
 0056C230    mov         edx,esi
 0056C232    call        @UStrCat3
 0056C237    mov         edx,dword ptr [ebp-4]
 0056C23A    mov         ecx,edi
 0056C23C    mov         eax,ebx
 0056C23E    call        TJvCustomAppStorage.WriteString
 0056C243    mov         ecx,edi
 0056C245    mov         edx,esi
 0056C247    mov         eax,ebx
 0056C249    call        TJvCustomAppStorage.WriteString
 0056C24E    xor         eax,eax
 0056C250    pop         edx
 0056C251    pop         ecx
 0056C252    pop         ecx
 0056C253    mov         dword ptr fs:[eax],edx
 0056C256    push        56C270
 0056C25B    lea         eax,[ebp-8]
 0056C25E    mov         edx,2
 0056C263    call        @UStrArrayClr
 0056C268    ret
>0056C269    jmp         @HandleFinally
>0056C26E    jmp         0056C25B
 0056C270    pop         edi
 0056C271    pop         esi
 0056C272    pop         ebx
 0056C273    pop         ecx
 0056C274    pop         ecx
 0056C275    pop         ebp
 0056C276    ret
end;*}

//0056C278
{*procedure sub_0056C278(?:?; ?:TJvCustomAppStorage; ?:string; ?:?);
begin
 0056C278    push        ebp
 0056C279    mov         ebp,esp
 0056C27B    add         esp,0FFFFFF8C
 0056C27E    push        ebx
 0056C27F    push        esi
 0056C280    push        edi
 0056C281    xor         ebx,ebx
 0056C283    mov         dword ptr [ebp-70],ebx
 0056C286    mov         dword ptr [ebp-74],ebx
 0056C289    mov         dword ptr [ebp-48],ebx
 0056C28C    mov         dword ptr [ebp-6C],ebx
 0056C28F    mov         dword ptr [ebp-44],ebx
 0056C292    mov         dword ptr [ebp-40],ebx
 0056C295    mov         dword ptr [ebp-34],ebx
 0056C298    mov         dword ptr [ebp-4],ecx
 0056C29B    mov         edi,edx
 0056C29D    mov         esi,eax
 0056C29F    mov         ebx,dword ptr [ebp+8]
 0056C2A2    xor         eax,eax
 0056C2A4    push        ebp
 0056C2A5    push        56C4C0
 0056C2AA    push        dword ptr fs:[eax]
 0056C2AD    mov         dword ptr fs:[eax],esp
 0056C2B0    movzx       eax,byte ptr ds:[56C4D0];0x8 gvar_0056C4D0
 0056C2B7    cmp         al,bl
>0056C2B9    je          0056C490
 0056C2BF    mov         dword ptr [ebp-30],2C
 0056C2C6    lea         eax,[ebp-30]
 0056C2C9    push        eax
 0056C2CA    mov         eax,esi
 0056C2CC    call        TWinControl.GetHandle
 0056C2D1    push        eax
 0056C2D2    call        user32.GetWindowPlacement
 0056C2D7    mov         eax,[0078D590];^Application:TApplication
 0056C2DC    mov         eax,dword ptr [eax]
 0056C2DE    cmp         esi,dword ptr [eax+44];TApplication.FMainForm:TForm
>0056C2E1    jne         0056C2F3
 0056C2E3    call        0056BE04
 0056C2E8    test        al,al
>0056C2EA    je          0056C2F3
 0056C2EC    mov         dword ptr [ebp-28],2
 0056C2F3    cmp         byte ptr [esi+29E],1
>0056C2FA    jne         0056C309
 0056C2FC    cmp         byte ptr [esi+29A],1
>0056C303    jne         0056C309
 0056C305    or          dword ptr [ebp-2C],1
 0056C309    test        bl,1
>0056C30C    je          0056C33C
 0056C30E    lea         eax,[ebp-34]
 0056C311    push        eax
 0056C312    mov         eax,dword ptr [ebp-4]
 0056C315    mov         dword ptr [ebp-3C],eax
 0056C318    mov         eax,56C4E0;'ShowCmd'
 0056C31D    mov         dword ptr [ebp-38],eax
 0056C320    lea         edx,[ebp-3C]
 0056C323    mov         ecx,1
 0056C328    mov         eax,dword ptr [edi]
 0056C32A    call        TJvCustomAppStorage.ConcatPaths
 0056C32F    mov         edx,dword ptr [ebp-34]
 0056C332    mov         ecx,dword ptr [ebp-28]
 0056C335    mov         eax,edi
 0056C337    call        TJvCustomAppStorage.WriteInteger
 0056C33C    and         bl,byte ptr ds:[56C4F0];0x6 gvar_0056C4F0
 0056C342    movzx       eax,byte ptr ds:[56C4F4];0x0 gvar_0056C4F4
 0056C349    cmp         al,bl
>0056C34B    je          0056C490
 0056C351    lea         eax,[ebp-40]
 0056C354    push        eax
 0056C355    mov         eax,dword ptr [ebp-4]
 0056C358    mov         dword ptr [ebp-3C],eax
 0056C35B    mov         eax,56C504;'Flags'
 0056C360    mov         dword ptr [ebp-38],eax
 0056C363    lea         edx,[ebp-3C]
 0056C366    mov         ecx,1
 0056C36B    mov         eax,dword ptr [edi]
 0056C36D    call        TJvCustomAppStorage.ConcatPaths
 0056C372    mov         edx,dword ptr [ebp-40]
 0056C375    mov         ecx,dword ptr [ebp-2C]
 0056C378    mov         eax,edi
 0056C37A    call        TJvCustomAppStorage.WriteInteger
 0056C37F    lea         eax,[ebp-44]
 0056C382    push        eax
 0056C383    mov         eax,dword ptr [ebp-4]
 0056C386    mov         dword ptr [ebp-3C],eax
 0056C389    mov         eax,56C51C;'PixelsPerInch'
 0056C38E    mov         dword ptr [ebp-38],eax
 0056C391    lea         edx,[ebp-3C]
 0056C394    mov         ecx,1
 0056C399    mov         eax,dword ptr [edi]
 0056C39B    call        TJvCustomAppStorage.ConcatPaths
 0056C3A0    mov         edx,dword ptr [ebp-44]
 0056C3A3    mov         eax,[0078DB00];^Screen:TScreen
 0056C3A8    mov         eax,dword ptr [eax]
 0056C3AA    mov         ecx,dword ptr [eax+44];TScreen.FPixelsPerInch:Integer
 0056C3AD    mov         eax,edi
 0056C3AF    call        TJvCustomAppStorage.WriteInteger
 0056C3B4    lea         eax,[ebp-48]
 0056C3B7    push        eax
 0056C3B8    mov         eax,dword ptr [ebp-24]
 0056C3BB    mov         dword ptr [ebp-68],eax
 0056C3BE    mov         byte ptr [ebp-64],0
 0056C3C2    mov         eax,dword ptr [ebp-20]
 0056C3C5    mov         dword ptr [ebp-60],eax
 0056C3C8    mov         byte ptr [ebp-5C],0
 0056C3CC    mov         eax,dword ptr [ebp-1C]
 0056C3CF    mov         dword ptr [ebp-58],eax
 0056C3D2    mov         byte ptr [ebp-54],0
 0056C3D6    mov         eax,dword ptr [ebp-18]
 0056C3D9    mov         dword ptr [ebp-50],eax
 0056C3DC    mov         byte ptr [ebp-4C],0
 0056C3E0    lea         edx,[ebp-68]
 0056C3E3    mov         ecx,3
 0056C3E8    mov         eax,56C544;'%d,%d,%d,%d'
 0056C3ED    call        Format
 0056C3F2    mov         eax,dword ptr [ebp-48]
 0056C3F5    push        eax
 0056C3F6    lea         eax,[ebp-6C]
 0056C3F9    push        eax
 0056C3FA    mov         eax,dword ptr [ebp-4]
 0056C3FD    mov         dword ptr [ebp-3C],eax
 0056C400    mov         eax,56C568;'MinMaxPos'
 0056C405    mov         dword ptr [ebp-38],eax
 0056C408    lea         edx,[ebp-3C]
 0056C40B    mov         ecx,1
 0056C410    mov         eax,dword ptr [edi]
 0056C412    call        TJvCustomAppStorage.ConcatPaths
 0056C417    mov         edx,dword ptr [ebp-6C]
 0056C41A    mov         eax,edi
 0056C41C    pop         ecx
 0056C41D    call        0056C204
 0056C422    lea         eax,[ebp-70]
 0056C425    push        eax
 0056C426    mov         eax,dword ptr [ebp-14]
 0056C429    mov         dword ptr [ebp-68],eax
 0056C42C    mov         byte ptr [ebp-64],0
 0056C430    mov         eax,dword ptr [ebp-10]
 0056C433    mov         dword ptr [ebp-60],eax
 0056C436    mov         byte ptr [ebp-5C],0
 0056C43A    mov         eax,dword ptr [ebp-0C]
 0056C43D    mov         dword ptr [ebp-58],eax
 0056C440    mov         byte ptr [ebp-54],0
 0056C444    mov         eax,dword ptr [ebp-8]
 0056C447    mov         dword ptr [ebp-50],eax
 0056C44A    mov         byte ptr [ebp-4C],0
 0056C44E    lea         edx,[ebp-68]
 0056C451    mov         ecx,3
 0056C456    mov         eax,56C544;'%d,%d,%d,%d'
 0056C45B    call        Format
 0056C460    mov         eax,dword ptr [ebp-70]
 0056C463    push        eax
 0056C464    lea         eax,[ebp-74]
 0056C467    push        eax
 0056C468    mov         eax,dword ptr [ebp-4]
 0056C46B    mov         dword ptr [ebp-3C],eax
 0056C46E    mov         eax,56C588;'NormPos'
 0056C473    mov         dword ptr [ebp-38],eax
 0056C476    lea         edx,[ebp-3C]
 0056C479    mov         ecx,1
 0056C47E    mov         eax,dword ptr [edi]
 0056C480    call        TJvCustomAppStorage.ConcatPaths
 0056C485    mov         edx,dword ptr [ebp-74]
 0056C488    mov         eax,edi
 0056C48A    pop         ecx
 0056C48B    call        0056C204
 0056C490    xor         eax,eax
 0056C492    pop         edx
 0056C493    pop         ecx
 0056C494    pop         ecx
 0056C495    mov         dword ptr fs:[eax],edx
 0056C498    push        56C4C7
 0056C49D    lea         eax,[ebp-74]
 0056C4A0    mov         edx,3
 0056C4A5    call        @UStrArrayClr
 0056C4AA    lea         eax,[ebp-48]
 0056C4AD    mov         edx,3
 0056C4B2    call        @UStrArrayClr
 0056C4B7    lea         eax,[ebp-34]
 0056C4BA    call        @UStrClr
 0056C4BF    ret
>0056C4C0    jmp         @HandleFinally
>0056C4C5    jmp         0056C49D
 0056C4C7    pop         edi
 0056C4C8    pop         esi
 0056C4C9    pop         ebx
 0056C4CA    mov         esp,ebp
 0056C4CC    pop         ebp
 0056C4CD    ret         4
end;*}

//0056C598
{*function sub_0056C598(?:?; ?:?):?;
begin
 0056C598    push        ebp
 0056C599    mov         ebp,esp
 0056C59B    push        ebx
 0056C59C    mov         ebx,eax
 0056C59E    mov         eax,dword ptr [ebp+8]
 0056C5A1    mov         eax,dword ptr [eax-4]
 0056C5A4    mov         cl,1
 0056C5A6    mov         dl,1
 0056C5A8    call        TComponent.SetDesigning
 0056C5AD    xor         eax,eax
 0056C5AF    push        ebp
 0056C5B0    push        56C5E5
 0056C5B5    push        dword ptr fs:[eax]
 0056C5B8    mov         dword ptr fs:[eax],esp
 0056C5BB    mov         eax,dword ptr [ebp+8]
 0056C5BE    mov         eax,dword ptr [eax-4]
 0056C5C1    mov         edx,ebx
 0056C5C3    call        TCustomForm.SetPosition
 0056C5C8    xor         eax,eax
 0056C5CA    pop         edx
 0056C5CB    pop         ecx
 0056C5CC    pop         ecx
 0056C5CD    mov         dword ptr fs:[eax],edx
 0056C5D0    push        56C5EC
 0056C5D5    mov         eax,dword ptr [ebp+8]
 0056C5D8    mov         eax,dword ptr [eax-4]
 0056C5DB    mov         cl,1
 0056C5DD    xor         edx,edx
 0056C5DF    call        TComponent.SetDesigning
 0056C5E4    ret
>0056C5E5    jmp         @HandleFinally
>0056C5EA    jmp         0056C5D5
 0056C5EC    pop         ebx
 0056C5ED    pop         ebp
 0056C5EE    ret
end;*}

//0056C5F0
{*procedure sub_0056C5F0(?:?; ?:TJvCustomAppStorage; ?:string; ?:?);
begin
 0056C5F0    push        ebp
 0056C5F1    mov         ebp,esp
 0056C5F3    push        ecx
 0056C5F4    mov         ecx,0F
 0056C5F9    push        0
 0056C5FB    push        0
 0056C5FD    dec         ecx
>0056C5FE    jne         0056C5F9
 0056C600    push        ecx
 0056C601    xchg        ecx,dword ptr [ebp-4]
 0056C604    push        ebx
 0056C605    push        esi
 0056C606    push        edi
 0056C607    mov         dword ptr [ebp-0C],ecx
 0056C60A    mov         esi,edx
 0056C60C    mov         dword ptr [ebp-4],eax
 0056C60F    mov         ebx,dword ptr [ebp+8]
 0056C612    xor         eax,eax
 0056C614    push        ebp
 0056C615    push        56CB52
 0056C61A    push        dword ptr fs:[eax]
 0056C61D    mov         dword ptr fs:[eax],esp
 0056C620    movzx       eax,byte ptr ds:[56CB64];0x8 gvar_0056CB64
 0056C627    cmp         al,bl
>0056C629    je          0056CB27
 0056C62F    mov         dword ptr [ebp-39],2C
 0056C636    lea         eax,[ebp-39]
 0056C639    push        eax
 0056C63A    mov         eax,dword ptr [ebp-4]
 0056C63D    call        TWinControl.GetHandle
 0056C642    push        eax
 0056C643    call        user32.GetWindowPlacement
 0056C648    mov         eax,dword ptr [ebp-4]
 0056C64B    call        TWinControl.GetHandle
 0056C650    push        eax
 0056C651    call        user32.IsWindowVisible
 0056C656    test        eax,eax
>0056C658    jne         0056C65F
 0056C65A    xor         eax,eax
 0056C65C    mov         dword ptr [ebp-31],eax
 0056C65F    mov         eax,ebx
 0056C661    and         al,byte ptr ds:[56CB68];0x6 gvar_0056CB68
 0056C667    movzx       edx,byte ptr ds:[56CB6C];0x0 gvar_0056CB6C
 0056C66E    cmp         dl,al
>0056C670    je          0056C9FA
 0056C676    mov         byte ptr [ebp-0D],0
 0056C67A    lea         eax,[ebp-40]
 0056C67D    push        eax
 0056C67E    mov         eax,dword ptr [ebp-0C]
 0056C681    mov         dword ptr [ebp-48],eax
 0056C684    mov         eax,56CB7C;'Flags'
 0056C689    mov         dword ptr [ebp-44],eax
 0056C68C    lea         edx,[ebp-48]
 0056C68F    mov         ecx,1
 0056C694    mov         eax,dword ptr [esi]
 0056C696    call        TJvCustomAppStorage.ConcatPaths
 0056C69B    mov         edx,dword ptr [ebp-40]
 0056C69E    mov         ecx,dword ptr [ebp-35]
 0056C6A1    mov         eax,esi
 0056C6A3    call        TJvCustomAppStorage.ReadInteger
 0056C6A8    mov         dword ptr [ebp-35],eax
 0056C6AB    lea         eax,[ebp-4C]
 0056C6AE    push        eax
 0056C6AF    mov         eax,dword ptr [ebp-0C]
 0056C6B2    mov         dword ptr [ebp-48],eax
 0056C6B5    mov         eax,56CB94;'MinMaxPos'
 0056C6BA    mov         dword ptr [ebp-44],eax
 0056C6BD    lea         edx,[ebp-48]
 0056C6C0    mov         ecx,1
 0056C6C5    mov         eax,dword ptr [esi]
 0056C6C7    call        TJvCustomAppStorage.ConcatPaths
 0056C6CC    mov         edx,dword ptr [ebp-4C]
 0056C6CF    lea         ecx,[ebp-8]
 0056C6D2    mov         eax,esi
 0056C6D4    call        0056C164
 0056C6D9    cmp         dword ptr [ebp-8],0
>0056C6DD    je          0056C77D
 0056C6E3    mov         byte ptr [ebp-0D],1
 0056C6E7    test        bl,4
>0056C6EA    je          0056C732
 0056C6EC    lea         eax,[ebp-50]
 0056C6EF    push        eax
 0056C6F0    mov         ecx,56CBA8
 0056C6F5    mov         edx,dword ptr [ebp-8]
 0056C6F8    mov         eax,1
 0056C6FD    call        0053FE88
 0056C702    mov         eax,dword ptr [ebp-50]
 0056C705    xor         edx,edx
 0056C707    call        StrToIntDef
 0056C70C    mov         dword ptr [ebp-2D],eax
 0056C70F    lea         eax,[ebp-54]
 0056C712    push        eax
 0056C713    mov         ecx,56CBA8
 0056C718    mov         edx,dword ptr [ebp-8]
 0056C71B    mov         eax,2
 0056C720    call        0053FE88
 0056C725    mov         eax,dword ptr [ebp-54]
 0056C728    xor         edx,edx
 0056C72A    call        StrToIntDef
 0056C72F    mov         dword ptr [ebp-29],eax
 0056C732    test        bl,2
>0056C735    je          0056C77D
 0056C737    lea         eax,[ebp-58]
 0056C73A    push        eax
 0056C73B    mov         ecx,56CBA8
 0056C740    mov         edx,dword ptr [ebp-8]
 0056C743    mov         eax,3
 0056C748    call        0053FE88
 0056C74D    mov         eax,dword ptr [ebp-58]
 0056C750    xor         edx,edx
 0056C752    call        StrToIntDef
 0056C757    mov         dword ptr [ebp-25],eax
 0056C75A    lea         eax,[ebp-5C]
 0056C75D    push        eax
 0056C75E    mov         ecx,56CBA8
 0056C763    mov         edx,dword ptr [ebp-8]
 0056C766    mov         eax,4
 0056C76B    call        0053FE88
 0056C770    mov         eax,dword ptr [ebp-5C]
 0056C773    xor         edx,edx
 0056C775    call        StrToIntDef
 0056C77A    mov         dword ptr [ebp-21],eax
 0056C77D    lea         eax,[ebp-60]
 0056C780    push        eax
 0056C781    mov         eax,dword ptr [ebp-0C]
 0056C784    mov         dword ptr [ebp-48],eax
 0056C787    mov         eax,56CBD4;'NormPos'
 0056C78C    mov         dword ptr [ebp-44],eax
 0056C78F    lea         edx,[ebp-48]
 0056C792    mov         ecx,1
 0056C797    mov         eax,dword ptr [esi]
 0056C799    call        TJvCustomAppStorage.ConcatPaths
 0056C79E    mov         edx,dword ptr [ebp-60]
 0056C7A1    lea         ecx,[ebp-8]
 0056C7A4    mov         eax,esi
 0056C7A6    call        0056C164
 0056C7AB    cmp         dword ptr [ebp-8],0
>0056C7AF    je          0056C912
 0056C7B5    mov         byte ptr [ebp-0D],1
 0056C7B9    test        bl,4
 0056C7BC    setne       al
 0056C7BF    test        al,al
>0056C7C1    je          0056C81F
 0056C7C3    lea         eax,[ebp-64]
 0056C7C6    push        eax
 0056C7C7    mov         ecx,56CBA8
 0056C7CC    mov         edx,dword ptr [ebp-8]
 0056C7CF    mov         eax,1
 0056C7D4    call        0053FE88
 0056C7D9    mov         eax,dword ptr [ebp-64]
 0056C7DC    push        eax
 0056C7DD    mov         eax,dword ptr [ebp-4]
 0056C7E0    call        TCustomForm.GetLeft
 0056C7E5    mov         edx,eax
 0056C7E7    pop         eax
 0056C7E8    call        StrToIntDef
 0056C7ED    mov         dword ptr [ebp-1D],eax
 0056C7F0    lea         eax,[ebp-68]
 0056C7F3    push        eax
 0056C7F4    mov         ecx,56CBA8
 0056C7F9    mov         edx,dword ptr [ebp-8]
 0056C7FC    mov         eax,2
 0056C801    call        0053FE88
 0056C806    mov         eax,dword ptr [ebp-68]
 0056C809    push        eax
 0056C80A    mov         eax,dword ptr [ebp-4]
 0056C80D    call        TCustomForm.GetTop
 0056C812    mov         edx,eax
 0056C814    pop         eax
 0056C815    call        StrToIntDef
 0056C81A    mov         dword ptr [ebp-19],eax
>0056C81D    jmp         0056C835
 0056C81F    mov         eax,dword ptr [ebp-4]
 0056C822    call        TCustomForm.GetLeft
 0056C827    mov         dword ptr [ebp-1D],eax
 0056C82A    mov         eax,dword ptr [ebp-4]
 0056C82D    call        TCustomForm.GetTop
 0056C832    mov         dword ptr [ebp-19],eax
 0056C835    test        bl,2
>0056C838    je          0056C8F0
 0056C83E    lea         eax,[ebp-6C]
 0056C841    push        eax
 0056C842    mov         ecx,56CBA8
 0056C847    mov         edx,dword ptr [ebp-8]
 0056C84A    mov         eax,3
 0056C84F    call        0053FE88
 0056C854    mov         eax,dword ptr [ebp-6C]
 0056C857    mov         edx,dword ptr [ebp-4]
 0056C85A    mov         edx,dword ptr [edx+48]
 0056C85D    call        StrToIntDef
 0056C862    mov         edi,eax
 0056C864    add         edi,dword ptr [ebp-1D]
 0056C867    lea         eax,[ebp-70]
 0056C86A    push        eax
 0056C86B    mov         ecx,56CBA8
 0056C870    mov         edx,dword ptr [ebp-8]
 0056C873    mov         eax,1
 0056C878    call        0053FE88
 0056C87D    mov         eax,dword ptr [ebp-70]
 0056C880    push        eax
 0056C881    mov         eax,dword ptr [ebp-4]
 0056C884    call        TCustomForm.GetLeft
 0056C889    mov         edx,eax
 0056C88B    pop         eax
 0056C88C    call        StrToIntDef
 0056C891    sub         edi,eax
 0056C893    mov         dword ptr [ebp-15],edi
 0056C896    lea         eax,[ebp-74]
 0056C899    push        eax
 0056C89A    mov         ecx,56CBA8
 0056C89F    mov         edx,dword ptr [ebp-8]
 0056C8A2    mov         eax,4
 0056C8A7    call        0053FE88
 0056C8AC    mov         eax,dword ptr [ebp-74]
 0056C8AF    mov         edx,dword ptr [ebp-4]
 0056C8B2    mov         edx,dword ptr [edx+4C]
 0056C8B5    call        StrToIntDef
 0056C8BA    mov         edi,eax
 0056C8BC    add         edi,dword ptr [ebp-19]
 0056C8BF    lea         eax,[ebp-78]
 0056C8C2    push        eax
 0056C8C3    mov         ecx,56CBA8
 0056C8C8    mov         edx,dword ptr [ebp-8]
 0056C8CB    mov         eax,2
 0056C8D0    call        0053FE88
 0056C8D5    mov         eax,dword ptr [ebp-78]
 0056C8D8    push        eax
 0056C8D9    mov         eax,dword ptr [ebp-4]
 0056C8DC    call        TCustomForm.GetTop
 0056C8E1    mov         edx,eax
 0056C8E3    pop         eax
 0056C8E4    call        StrToIntDef
 0056C8E9    sub         edi,eax
 0056C8EB    mov         dword ptr [ebp-11],edi
>0056C8EE    jmp         0056C912
 0056C8F0    test        bl,4
 0056C8F3    setne       al
 0056C8F6    test        al,al
>0056C8F8    je          0056C912
 0056C8FA    mov         eax,dword ptr [ebp-4]
 0056C8FD    mov         eax,dword ptr [eax+48]
 0056C900    add         eax,dword ptr [ebp-1D]
 0056C903    mov         dword ptr [ebp-15],eax
 0056C906    mov         eax,dword ptr [ebp-4]
 0056C909    mov         eax,dword ptr [eax+4C]
 0056C90C    add         eax,dword ptr [ebp-19]
 0056C90F    mov         dword ptr [ebp-11],eax
 0056C912    cmp         byte ptr [ebp-0D],0
>0056C916    je          0056C95A
 0056C918    lea         eax,[ebp-7C]
 0056C91B    push        eax
 0056C91C    mov         eax,dword ptr [ebp-0C]
 0056C91F    mov         dword ptr [ebp-48],eax
 0056C922    mov         eax,56CBF0;'PixelsPerInch'
 0056C927    mov         dword ptr [ebp-44],eax
 0056C92A    lea         edx,[ebp-48]
 0056C92D    mov         ecx,1
 0056C932    mov         eax,dword ptr [esi]
 0056C934    call        TJvCustomAppStorage.ConcatPaths
 0056C939    mov         edx,dword ptr [ebp-7C]
 0056C93C    mov         eax,[0078DB00];^Screen:TScreen
 0056C941    mov         eax,dword ptr [eax]
 0056C943    mov         ecx,dword ptr [eax+44];TScreen.FPixelsPerInch:Integer
 0056C946    mov         eax,esi
 0056C948    call        TJvCustomAppStorage.ReadInteger
 0056C94D    mov         edx,dword ptr ds:[78DB00];^Screen:TScreen
 0056C953    mov         edx,dword ptr [edx]
 0056C955    cmp         eax,dword ptr [edx+44];TScreen.FPixelsPerInch:Integer
>0056C958    je          0056C95E
 0056C95A    xor         eax,eax
>0056C95C    jmp         0056C960
 0056C95E    mov         al,1
 0056C960    mov         byte ptr [ebp-0D],al
 0056C963    cmp         byte ptr [ebp-0D],0
>0056C967    je          0056C9FA
 0056C96D    mov         eax,dword ptr [ebp-15]
 0056C970    cmp         eax,dword ptr [ebp-1D]
>0056C973    jle         0056C9FA
 0056C979    mov         eax,dword ptr [ebp-4]
 0056C97C    test        byte ptr [eax+1C],10
>0056C980    jne         0056C9E8
 0056C982    test        bl,2
 0056C985    setne       al
 0056C988    test        al,al
>0056C98A    je          0056C99C
 0056C98C    test        bl,4
>0056C98F    je          0056C99C
 0056C991    push        ebp
 0056C992    xor         eax,eax
 0056C994    call        0056C598
 0056C999    pop         ecx
>0056C99A    jmp         0056C9E8
 0056C99C    test        bl,2
 0056C99F    setne       dl
 0056C9A2    test        al,al
>0056C9A4    je          0056C9BD
 0056C9A6    mov         eax,dword ptr [ebp-4]
 0056C9A9    cmp         byte ptr [eax+29F],1
>0056C9B0    jne         0056C9E8
 0056C9B2    push        ebp
 0056C9B3    mov         al,2
 0056C9B5    call        0056C598
 0056C9BA    pop         ecx
>0056C9BB    jmp         0056C9E8
 0056C9BD    test        bl,4
>0056C9C0    je          0056C9E8
 0056C9C2    mov         eax,dword ptr [ebp-4]
 0056C9C5    movzx       eax,byte ptr [eax+29F]
 0056C9CC    cmp         al,1
>0056C9CE    jne         0056C9DB
 0056C9D0    push        ebp
 0056C9D1    mov         al,3
 0056C9D3    call        0056C598
 0056C9D8    pop         ecx
>0056C9D9    jmp         0056C9E8
 0056C9DB    test        al,al
>0056C9DD    je          0056C9E8
 0056C9DF    push        ebp
 0056C9E0    xor         eax,eax
 0056C9E2    call        0056C598
 0056C9E7    pop         ecx
 0056C9E8    lea         eax,[ebp-39]
 0056C9EB    push        eax
 0056C9EC    mov         eax,dword ptr [ebp-4]
 0056C9EF    call        TWinControl.GetHandle
 0056C9F4    push        eax
 0056C9F5    call        user32.SetWindowPlacement
 0056C9FA    test        bl,1
>0056C9FD    je          0056CB1C
 0056CA03    xor         ebx,ebx
 0056CA05    mov         eax,[0078D590];^Application:TApplication
 0056CA0A    mov         eax,dword ptr [eax]
 0056CA0C    mov         eax,dword ptr [eax+44];TApplication.FMainForm:TForm
 0056CA0F    cmp         eax,dword ptr [ebp-4]
>0056CA12    je          0056CA1E
 0056CA14    mov         edx,dword ptr ds:[78D590];^Application:TApplication
 0056CA1A    test        eax,eax
>0056CA1C    jne         0056CA44
 0056CA1E    mov         eax,dword ptr [ebp-4]
 0056CA21    cmp         byte ptr [eax+29E],2
>0056CA28    je          0056CA42
 0056CA2A    mov         eax,dword ptr [ebp-4]
 0056CA2D    cmp         byte ptr [eax+29E],0
>0056CA34    jne         0056CA44
 0056CA36    mov         eax,dword ptr [ebp-4]
 0056CA39    cmp         byte ptr [eax+29F],1
>0056CA40    jne         0056CA44
 0056CA42    mov         bl,2
 0056CA44    lea         eax,[ebp-80]
 0056CA47    push        eax
 0056CA48    mov         eax,dword ptr [ebp-0C]
 0056CA4B    mov         dword ptr [ebp-48],eax
 0056CA4E    mov         eax,56CC18;'ShowCmd'
 0056CA53    mov         dword ptr [ebp-44],eax
 0056CA56    lea         edx,[ebp-48]
 0056CA59    mov         ecx,1
 0056CA5E    mov         eax,dword ptr [esi]
 0056CA60    call        TJvCustomAppStorage.ConcatPaths
 0056CA65    mov         edx,dword ptr [ebp-80]
 0056CA68    xor         ecx,ecx
 0056CA6A    mov         eax,esi
 0056CA6C    call        TJvCustomAppStorage.ReadInteger
 0056CA71    mov         edi,eax
 0056CA73    mov         dword ptr [ebp-31],edi
 0056CA76    cmp         edi,9
>0056CA79    ja          0056CAAD
 0056CA7B    movzx       edi,byte ptr [edi+56CA89]
 0056CA82    jmp         dword ptr [edi*4+56CA93]
 0056CA82    db          0
 0056CA82    db          1
 0056CA82    db          2
 0056CA82    db          3
 0056CA82    db          0
 0056CA82    db          1
 0056CA82    db          2
 0056CA82    db          2
 0056CA82    db          0
 0056CA82    db          1
 0056CA82    dd          0056CAAD
 0056CA82    dd          0056CAA3
 0056CA82    dd          0056CAA7
 0056CA82    dd          0056CAAB
 0056CAA3    xor         ebx,ebx
>0056CAA5    jmp         0056CAAD
 0056CAA7    mov         bl,1
>0056CAA9    jmp         0056CAAD
 0056CAAB    mov         bl,2
 0056CAAD    cmp         bl,1
>0056CAB0    jne         0056CAF7
 0056CAB2    mov         eax,[0078D590];^Application:TApplication
 0056CAB7    mov         eax,dword ptr [eax]
 0056CAB9    mov         eax,dword ptr [eax+44];TApplication.FMainForm:TForm
 0056CABC    cmp         eax,dword ptr [ebp-4]
>0056CABF    je          0056CACB
 0056CAC1    mov         edx,dword ptr ds:[78D590];^Application:TApplication
 0056CAC7    test        eax,eax
>0056CAC9    jne         0056CAF7
 0056CACB    mov         eax,dword ptr [ebp-4]
 0056CACE    add         eax,29A
 0056CAD3    mov         byte ptr [eax],0
 0056CAD6    push        0
 0056CAD8    push        0F020
 0056CADD    push        112
 0056CAE2    mov         eax,[0078D590];^Application:TApplication
 0056CAE7    mov         eax,dword ptr [eax]
 0056CAE9    mov         eax,dword ptr [eax+170];TApplication.FHandle:HWND
 0056CAEF    push        eax
 0056CAF0    call        user32.PostMessageW
>0056CAF5    jmp         0056CB27
 0056CAF7    mov         eax,dword ptr [ebp-4]
 0056CAFA    movzx       eax,byte ptr [eax+29E]
 0056CB01    dec         eax
 0056CB02    sub         al,2
>0056CB04    jae         0056CB12
 0056CB06    mov         eax,dword ptr [ebp-4]
 0056CB09    add         eax,29A
 0056CB0E    mov         byte ptr [eax],bl
>0056CB10    jmp         0056CB1C
 0056CB12    mov         edx,ebx
 0056CB14    mov         eax,dword ptr [ebp-4]
 0056CB17    call        TCustomForm.SetWindowState
 0056CB1C    mov         eax,dword ptr [ebp-4]
 0056CB1F    mov         edx,dword ptr [eax]
 0056CB21    call        dword ptr [edx+9C]
 0056CB27    xor         eax,eax
 0056CB29    pop         edx
 0056CB2A    pop         ecx
 0056CB2B    pop         ecx
 0056CB2C    mov         dword ptr fs:[eax],edx
 0056CB2F    push        56CB59
 0056CB34    lea         eax,[ebp-80]
 0056CB37    mov         edx,0E
 0056CB3C    call        @UStrArrayClr
 0056CB41    lea         eax,[ebp-40]
 0056CB44    call        @UStrClr
 0056CB49    lea         eax,[ebp-8]
 0056CB4C    call        @UStrClr
 0056CB51    ret
>0056CB52    jmp         @HandleFinally
>0056CB57    jmp         0056CB34
 0056CB59    pop         edi
 0056CB5A    pop         esi
 0056CB5B    pop         ebx
 0056CB5C    mov         esp,ebp
 0056CB5E    pop         ebp
 0056CB5F    ret         4
end;*}

//0056CCAC
{*function sub_0056CCAC(?:?; ?:?; ?:?; ?:?):?;
begin
 0056CCAC    push        ebp
 0056CCAD    mov         ebp,esp
 0056CCAF    add         esp,0FFFFFFB0
 0056CCB2    push        ebx
 0056CCB3    push        esi
 0056CCB4    push        edi
 0056CCB5    mov         ebx,eax
 0056CCB7    mov         esi,7898B8
 0056CCBC    lea         edi,[ebp-50]
 0056CCBF    mov         ecx,0A
 0056CCC4    rep movs    dword ptr [edi],dword ptr [esi]
 0056CCC6    mov         eax,[00790C38];gvar_00790C38
 0056CCCB    mov         dword ptr [ebp-40],eax
 0056CCCE    mov         eax,40DD38;user32.DefWindowProcW:Integer
 0056CCD3    mov         dword ptr [ebp-4C],eax
 0056CCD6    test        ebx,ebx
>0056CCD8    je          0056CCE4
 0056CCDA    mov         eax,ebx
 0056CCDC    call        @UStrToPWChar
 0056CCE1    mov         dword ptr [ebp-2C],eax
 0056CCE4    lea         eax,[ebp-28]
 0056CCE7    push        eax
 0056CCE8    mov         eax,dword ptr [ebp-2C]
 0056CCEB    push        eax
 0056CCEC    mov         eax,[00790C38];gvar_00790C38
 0056CCF1    push        eax
 0056CCF2    call        user32.GetClassInfoW
 0056CCF7    cmp         eax,1
 0056CCFA    sbb         eax,eax
 0056CCFC    inc         eax
 0056CCFD    test        al,al
>0056CCFF    je          0056CD0B
 0056CD01    mov         edx,40DD38;user32.DefWindowProcW:Integer
 0056CD06    cmp         edx,dword ptr [ebp-24]
>0056CD09    je          0056CD27
 0056CD0B    test        al,al
>0056CD0D    je          0056CD1E
 0056CD0F    mov         eax,[00790C38];gvar_00790C38
 0056CD14    push        eax
 0056CD15    mov         eax,dword ptr [ebp-2C]
 0056CD18    push        eax
 0056CD19    call        user32.UnregisterClassW
 0056CD1E    lea         eax,[ebp-50]
 0056CD21    push        eax
 0056CD22    call        user32.RegisterClassW
 0056CD27    push        80000000
 0056CD2C    push        0
 0056CD2E    push        0
 0056CD30    push        0
 0056CD32    push        0
 0056CD34    push        0
 0056CD36    push        0
 0056CD38    mov         eax,[00790C38];gvar_00790C38
 0056CD3D    push        eax
 0056CD3E    push        0
 0056CD40    mov         ecx,56CD8C
 0056CD45    mov         edx,dword ptr [ebp-2C]
 0056CD48    mov         eax,80
 0056CD4D    call        CreateWindowEx
 0056CD52    mov         ebx,eax
 0056CD54    cmp         word ptr [ebp+0A],0
>0056CD59    je          0056CD80
 0056CD5B    mov         eax,dword ptr [ebp+8]
 0056CD5E    push        eax
 0056CD5F    push        0
 0056CD61    push        ebx
 0056CD62    call        user32.SetWindowLongW
 0056CD67    mov         eax,dword ptr [ebp+0C]
 0056CD6A    push        eax
 0056CD6B    push        4
 0056CD6D    push        ebx
 0056CD6E    call        user32.SetWindowLongW
 0056CD73    push        56CC48
 0056CD78    push        0FC
 0056CD7A    push        ebx
 0056CD7B    call        user32.SetWindowLongW
 0056CD80    mov         eax,ebx
 0056CD82    pop         edi
 0056CD83    pop         esi
 0056CD84    pop         ebx
 0056CD85    mov         esp,ebp
 0056CD87    pop         ebp
 0056CD88    ret         8
end;*}

//0056CD90
procedure sub_0056CD90;
begin
{*
 0056CD90    push        eax
 0056CD91    call        user32.DestroyWindow
 0056CD96    ret
*}
end;

//0056CD98
procedure sub_0056CD98;
begin
{*
 0056CD98    push        ebp
 0056CD99    mov         ebp,esp
 0056CD9B    push        ebx
 0056CD9C    push        esi
 0056CD9D    push        edi
 0056CD9E    xor         eax,eax
 0056CDA0    push        ebp
 0056CDA1    push        56CE64
 0056CDA6    push        dword ptr fs:[eax]
 0056CDA9    mov         dword ptr fs:[eax],esp
 0056CDAC    mov         eax,[0078DB00];^Screen:TScreen
 0056CDB1    cmp         dword ptr [eax],0
>0056CDB4    je          0056CE5A
 0056CDBA    mov         eax,[0078DB00];^Screen:TScreen
 0056CDBF    mov         eax,dword ptr [eax]
 0056CDC1    mov         edx,0FFFFFFF0
 0056CDC6    call        TScreen.GetCursors
 0056CDCB    mov         ecx,eax
 0056CDCD    mov         edx,dword ptr ds:[78D32C];^gvar_00786C4C
 0056CDD3    movsx       edx,word ptr [edx]
 0056CDD6    mov         eax,[0078DB00];^Screen:TScreen
 0056CDDB    mov         eax,dword ptr [eax]
 0056CDDD    call        TScreen.SetCursors
 0056CDE2    mov         eax,[0078DB00];^Screen:TScreen
 0056CDE7    mov         eax,dword ptr [eax]
 0056CDE9    mov         edx,0FFFFFFF4
 0056CDEE    call        TScreen.GetCursors
 0056CDF3    mov         ecx,eax
 0056CDF5    mov         edx,dword ptr ds:[78D53C];^gvar_00786C4E
 0056CDFB    movsx       edx,word ptr [edx]
 0056CDFE    mov         eax,[0078DB00];^Screen:TScreen
 0056CE03    mov         eax,dword ptr [eax]
 0056CE05    call        TScreen.SetCursors
 0056CE0A    mov         eax,[0078DB00];^Screen:TScreen
 0056CE0F    mov         eax,dword ptr [eax]
 0056CE11    mov         edx,0FFFFFFF0
 0056CE16    call        TScreen.GetCursors
 0056CE1B    mov         ecx,eax
 0056CE1D    mov         edx,dword ptr ds:[78D8A0];^gvar_00786C50
 0056CE23    movsx       edx,word ptr [edx]
 0056CE26    mov         eax,[0078DB00];^Screen:TScreen
 0056CE2B    mov         eax,dword ptr [eax]
 0056CE2D    call        TScreen.SetCursors
 0056CE32    mov         eax,[0078DB00];^Screen:TScreen
 0056CE37    mov         eax,dword ptr [eax]
 0056CE39    mov         edx,0FFFFFFF0
 0056CE3E    call        TScreen.GetCursors
 0056CE43    mov         ecx,eax
 0056CE45    mov         edx,dword ptr ds:[78CD64];^gvar_00786C52
 0056CE4B    movsx       edx,word ptr [edx]
 0056CE4E    mov         eax,[0078DB00];^Screen:TScreen
 0056CE53    mov         eax,dword ptr [eax]
 0056CE55    call        TScreen.SetCursors
 0056CE5A    xor         eax,eax
 0056CE5C    pop         edx
 0056CE5D    pop         ecx
 0056CE5E    pop         ecx
 0056CE5F    mov         dword ptr fs:[eax],edx
>0056CE62    jmp         0056CE6E
>0056CE64    jmp         @HandleAnyException
 0056CE69    call        @DoneExcept
 0056CE6E    pop         edi
 0056CE6F    pop         esi
 0056CE70    pop         ebx
 0056CE71    pop         ebp
 0056CE72    ret
*}
end;

//0056D000
{*function sub_0056D000(?:TJvComponent; ?:TComponent; ?:?):?;
begin
 0056D000    push        ebx
 0056D001    push        esi
 0056D002    push        edi
 0056D003    push        ebp
 0056D004    mov         esi,ecx
 0056D006    mov         ebp,edx
 0056D008    mov         edi,eax
 0056D00A    cmp         ebp,dword ptr [esi]
>0056D00C    je          0056D012
 0056D00E    test        edi,edi
>0056D010    jne         0056D016
 0056D012    xor         ebx,ebx
>0056D014    jmp         0056D018
 0056D016    mov         bl,1
 0056D018    test        bl,bl
>0056D01A    je          0056D03A
 0056D01C    cmp         dword ptr [esi],0
>0056D01F    je          0056D02A
 0056D021    mov         eax,dword ptr [esi]
 0056D023    mov         edx,edi
 0056D025    call        TComponent.RemoveFreeNotification
 0056D02A    mov         dword ptr [esi],ebp
 0056D02C    cmp         dword ptr [esi],0
>0056D02F    je          0056D03A
 0056D031    mov         eax,dword ptr [esi]
 0056D033    mov         edx,edi
 0056D035    call        TComponent.FreeNotification
 0056D03A    mov         eax,ebx
 0056D03C    pop         ebp
 0056D03D    pop         edi
 0056D03E    pop         esi
 0056D03F    pop         ebx
 0056D040    ret
end;*}

Initialization
//007812E0
{*
 007812E0    sub         dword ptr ds:[815508],1
>007812E7    jae         007812EE
 007812E9    call        0056CD98
 007812EE    ret
*}
Finalization
//0056D044
{*
 0056D044    push        ebp
 0056D045    mov         ebp,esp
 0056D047    xor         eax,eax
 0056D049    push        ebp
 0056D04A    push        56D0B3
 0056D04F    push        dword ptr fs:[eax]
 0056D052    mov         dword ptr fs:[eax],esp
 0056D055    inc         dword ptr ds:[815508]
>0056D05B    jne         0056D0A5
 0056D05D    mov         eax,789884
 0056D062    call        FreeAndNil
 0056D067    mov         eax,789918
 0056D06C    call        FreeAndNil
 0056D071    mov         eax,789880;gvar_00789880
 0056D076    call        @UStrClr
 0056D07B    mov         eax,789888;^'Yes'
 0056D080    mov         ecx,0C
 0056D085    mov         edx,dword ptr ds:[40128C];string
 0056D08B    call        @FinalizeArray
 0056D090    mov         eax,7898E0;^'&amp;'
 0056D095    mov         ecx,7
 0056D09A    mov         edx,dword ptr ds:[56CFB0];THtmlCode
 0056D0A0    call        @FinalizeArray
 0056D0A5    xor         eax,eax
 0056D0A7    pop         edx
 0056D0A8    pop         ecx
 0056D0A9    pop         ecx
 0056D0AA    mov         dword ptr fs:[eax],edx
 0056D0AD    push        56D0BA
 0056D0B2    ret
>0056D0B3    jmp         @HandleFinally
>0056D0B8    jmp         0056D0B2
 0056D0BA    pop         ebp
 0056D0BB    ret
*}
end.