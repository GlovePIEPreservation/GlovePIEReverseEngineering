//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit JclSysUtils;

interface

uses
  SysUtils, Classes, SyncObjs, TimeSpan;

type
  ESharedMemError = class(EJclError)
  end;
  TJclIntfCriticalSection = class(TObject)
  published
    procedure _AddRef; stdcall;//0053D7C0
    procedure _Release; stdcall;//0053D7D4
    //function QueryInterface(IID:TGUID; Obj:?):HRESULT; stdcall;//0053D7E8
    constructor Create;//0053D74C
    destructor Destroy();//0053D790
  public
    ........FCriticalSection:TCriticalSection;//f4
  end;
  TMMFHandleListItem = TMMFHandleListItem = record//size=14
fC:string;//fC
end;
Next:PMMFHandleListItem;//f0
Memory:Pointer;//f4
Handle:Cardinal;//f8
Name:string;//fC
References:Integer;//f10
end;;
    //procedure sub_0053D1EC(?:?; ?:?);//0053D1EC
    //procedure sub_0053D2A8(?:?);//0053D2A8
    //function sub_0053D300(?:?; ?:UnicodeString; ?:?; ?:?):?;//0053D300
    //function sub_0053D514(?:?):?;//0053D514
    procedure sub_0053D5DC;//0053D5DC
    //procedure sub_0053D610(?:?);//0053D610
    //procedure sub_0053D628(?:?; ?:?);//0053D628

implementation

//0053D1EC
{*procedure sub_0053D1EC(?:?; ?:?);
begin
 0053D1EC    test        edx,edx
>0053D1EE    jle         0053D1FA
 0053D1F0    mov         byte ptr [eax],0
 0053D1F3    xor         ecx,ecx
 0053D1F5    call        @FillChar
 0053D1FA    ret
end;*}

//0053D2A8
{*procedure sub_0053D2A8(?:?);
begin
 0053D2A8    push        ebx
 0053D2A9    push        esi
 0053D2AA    push        edi
 0053D2AB    mov         edi,eax
 0053D2AD    cmp         dword ptr ds:[788CB4],0;gvar_00788CB4
>0053D2B4    jne         0053D2E6
 0053D2B6    cmp         byte ptr ds:[788CB0],0;gvar_00788CB0
>0053D2BD    jne         0053D2E6
 0053D2BF    mov         dl,1
 0053D2C1    mov         eax,[0053CE40];TJclIntfCriticalSection
 0053D2C6    call        TJclIntfCriticalSection.Create;TJclIntfCriticalSection.Create
 0053D2CB    mov         ebx,eax
 0053D2CD    mov         esi,788CB4;gvar_00788CB4
 0053D2D2    push        0
 0053D2D4    push        ebx
 0053D2D5    push        esi
 0053D2D6    call        kernel32.InterlockedCompareExchange
 0053D2DB    test        eax,eax
>0053D2DD    je          0053D2E6
 0053D2DF    mov         eax,ebx
 0053D2E1    call        TObject.Free
 0053D2E6    mov         eax,edi
 0053D2E8    mov         edx,dword ptr ds:[788CB4];0x0 gvar_00788CB4
 0053D2EE    test        edx,edx
>0053D2F0    je          0053D2F5
 0053D2F2    sub         edx,0FFFFFFF8
 0053D2F5    call        @IntfCopy
 0053D2FA    pop         edi
 0053D2FB    pop         esi
 0053D2FC    pop         ebx
 0053D2FD    ret
end;*}

//0053D300
{*function sub_0053D300(?:?; ?:UnicodeString; ?:?; ?:?):?;
begin
 0053D300    push        ebp
 0053D301    mov         ebp,esp
 0053D303    add         esp,0FFFFFFE8
 0053D306    push        ebx
 0053D307    push        esi
 0053D308    push        edi
 0053D309    xor         ebx,ebx
 0053D30B    mov         dword ptr [ebp-4],ebx
 0053D30E    mov         dword ptr [ebp-8],ecx
 0053D311    mov         esi,edx
 0053D313    mov         edi,eax
 0053D315    xor         eax,eax
 0053D317    push        ebp
 0053D318    push        53D4EE
 0053D31D    push        dword ptr fs:[eax]
 0053D320    mov         dword ptr fs:[eax],esp
 0053D323    xor         eax,eax
 0053D325    mov         dword ptr [ebp-0C],eax
 0053D328    xor         eax,eax
 0053D32A    mov         dword ptr [edi],eax
 0053D32C    call        00533558
 0053D331    sub         al,0A
>0053D333    jae         0053D36D
 0053D335    test        esi,esi
>0053D337    je          0053D349
 0053D339    mov         edx,esi
 0053D33B    mov         eax,53D510;'\'
 0053D340    call        Pos
 0053D345    test        eax,eax
>0053D347    jle         0053D36D
 0053D349    mov         dword ptr [ebp-18],esi
 0053D34C    mov         byte ptr [ebp-14],11
 0053D350    lea         eax,[ebp-18]
 0053D353    push        eax
 0053D354    push        0
 0053D356    mov         ecx,dword ptr ds:[78CB40];^SResString570:TResStringRec
 0053D35C    mov         dl,1
 0053D35E    mov         eax,[0053CD4C];ESharedMemError
 0053D363    call        Exception.CreateResFmt;ESharedMemError.Create
 0053D368    call        @RaiseExcept
 0053D36D    lea         eax,[ebp-4]
 0053D370    call        0053D2A8
 0053D375    mov         ebx,dword ptr ds:[788CAC];0x0 gvar_00788CAC:Pointer
 0053D37B    test        ebx,ebx
>0053D37D    je          0053D3A7
 0053D37F    mov         eax,dword ptr [ebx+0C]
 0053D382    mov         edx,esi
 0053D384    call        CompareText
 0053D389    test        eax,eax
>0053D38B    jne         0053D3A1
 0053D38D    inc         dword ptr [ebx+10]
 0053D390    mov         eax,dword ptr [ebx+4]
 0053D393    mov         dword ptr [edi],eax
 0053D395    mov         dword ptr [ebp-0C],0B7
>0053D39C    jmp         0053D4D8
 0053D3A1    mov         ebx,dword ptr [ebx]
 0053D3A3    test        ebx,ebx
>0053D3A5    jne         0053D37F
 0053D3A7    mov         eax,esi
 0053D3A9    call        @UStrToPWChar
 0053D3AE    push        eax
 0053D3AF    push        0
 0053D3B1    mov         eax,dword ptr [ebp+8]
 0053D3B4    push        eax
 0053D3B5    call        kernel32.OpenFileMappingW
 0053D3BA    mov         dword ptr [ebp-10],eax
 0053D3BD    cmp         dword ptr [ebp-10],0
>0053D3C1    jne         0053D424
 0053D3C3    cmp         dword ptr [ebp-8],0
>0053D3C7    jne         0053D3ED
 0053D3C9    mov         dword ptr [ebp-18],esi
 0053D3CC    mov         byte ptr [ebp-14],11
 0053D3D0    lea         eax,[ebp-18]
 0053D3D3    push        eax
 0053D3D4    push        0
 0053D3D6    mov         ecx,dword ptr ds:[78CE58];^SResString571:TResStringRec
 0053D3DC    mov         dl,1
 0053D3DE    mov         eax,[0053CD4C];ESharedMemError
 0053D3E3    call        Exception.CreateResFmt;ESharedMemError.Create
 0053D3E8    call        @RaiseExcept
 0053D3ED    mov         ebx,4
 0053D3F2    mov         eax,[0078DB58];^gvar_00784C7C
 0053D3F7    cmp         dword ptr [eax],1
>0053D3FA    jne         0053D407
 0053D3FC    cmp         dword ptr [ebp+8],1
>0053D400    jne         0053D407
 0053D402    mov         ebx,8
 0053D407    mov         eax,esi
 0053D409    call        @UStrToPWChar
 0053D40E    push        eax
 0053D40F    mov         eax,dword ptr [ebp-8]
 0053D412    push        eax
 0053D413    push        0
 0053D415    push        ebx
 0053D416    push        0
 0053D418    push        0FF
 0053D41A    call        kernel32.CreateFileMappingW
 0053D41F    mov         dword ptr [ebp-10],eax
>0053D422    jmp         0053D42B
 0053D424    mov         dword ptr [ebp-0C],0B7
 0053D42B    call        kernel32.GetLastError
 0053D430    cmp         eax,0B7
>0053D435    jne         0053D440
 0053D437    mov         dword ptr [ebp-0C],0B7
>0053D43E    jmp         0053D44B
 0053D440    cmp         dword ptr [ebp-10],0
>0053D444    jne         0053D44B
 0053D446    call        RaiseLastOSError
 0053D44B    mov         eax,dword ptr [ebp-8]
 0053D44E    push        eax
 0053D44F    push        0
 0053D451    push        0
 0053D453    mov         eax,dword ptr [ebp+8]
 0053D456    push        eax
 0053D457    mov         eax,dword ptr [ebp-10]
 0053D45A    push        eax
 0053D45B    call        kernel32.MapViewOfFile
 0053D460    mov         ebx,eax
 0053D462    mov         dword ptr [edi],ebx
 0053D464    test        ebx,ebx
>0053D466    jne         0053D49D
 0053D468    xor         eax,eax
 0053D46A    push        ebp
 0053D46B    push        53D485
 0053D470    push        dword ptr fs:[eax]
 0053D473    mov         dword ptr fs:[eax],esp
 0053D476    call        RaiseLastOSError
 0053D47B    xor         eax,eax
 0053D47D    pop         edx
 0053D47E    pop         ecx
 0053D47F    pop         ecx
 0053D480    mov         dword ptr fs:[eax],edx
>0053D483    jmp         0053D49D
>0053D485    jmp         @HandleAnyException
 0053D48A    mov         eax,dword ptr [ebp-10]
 0053D48D    push        eax
 0053D48E    call        kernel32.CloseHandle
 0053D493    call        @RaiseAgain
 0053D498    call        @DoneExcept
 0053D49D    mov         edx,dword ptr ds:[53D21C];TMMFHandleListItem
 0053D4A3    mov         eax,14
 0053D4A8    call        @New
 0053D4AD    mov         ebx,eax
 0053D4AF    lea         eax,[ebx+0C]
 0053D4B2    mov         edx,esi
 0053D4B4    call        @UStrAsg
 0053D4B9    mov         eax,dword ptr [ebp-10]
 0053D4BC    mov         dword ptr [ebx+8],eax
 0053D4BF    mov         eax,dword ptr [edi]
 0053D4C1    mov         dword ptr [ebx+4],eax
 0053D4C4    mov         dword ptr [ebx+10],1
 0053D4CB    mov         eax,[00788CAC];0x0 gvar_00788CAC:Pointer
 0053D4D0    mov         dword ptr [ebx],eax
 0053D4D2    mov         dword ptr ds:[788CAC],ebx;gvar_00788CAC:Pointer
 0053D4D8    xor         eax,eax
 0053D4DA    pop         edx
 0053D4DB    pop         ecx
 0053D4DC    pop         ecx
 0053D4DD    mov         dword ptr fs:[eax],edx
 0053D4E0    push        53D4F5
 0053D4E5    lea         eax,[ebp-4]
 0053D4E8    call        @IntfClear
 0053D4ED    ret
>0053D4EE    jmp         @HandleFinally
>0053D4F3    jmp         0053D4E5
 0053D4F5    mov         eax,dword ptr [ebp-0C]
 0053D4F8    pop         edi
 0053D4F9    pop         esi
 0053D4FA    pop         ebx
 0053D4FB    mov         esp,ebp
 0053D4FD    pop         ebp
 0053D4FE    ret         4
end;*}

//0053D514
{*function sub_0053D514(?:?):?;
begin
 0053D514    push        ebp
 0053D515    mov         ebp,esp
 0053D517    add         esp,0FFFFFFF8
 0053D51A    push        ebx
 0053D51B    push        esi
 0053D51C    push        edi
 0053D51D    xor         edx,edx
 0053D51F    mov         dword ptr [ebp-4],edx
 0053D522    mov         esi,eax
 0053D524    xor         eax,eax
 0053D526    push        ebp
 0053D527    push        53D5C7
 0053D52C    push        dword ptr fs:[eax]
 0053D52F    mov         dword ptr fs:[eax],esp
 0053D532    cmp         dword ptr [esi],0
>0053D535    je          0053D5AD
 0053D537    mov         byte ptr [ebp-5],0
 0053D53B    lea         eax,[ebp-4]
 0053D53E    call        0053D2A8
 0053D543    mov         ebx,dword ptr ds:[788CAC];0x0 gvar_00788CAC:Pointer
 0053D549    xor         edi,edi
 0053D54B    test        ebx,ebx
>0053D54D    je          0053D5B1
 0053D54F    mov         eax,dword ptr [esi]
 0053D551    cmp         eax,dword ptr [ebx+4]
>0053D554    jne         0053D5A3
 0053D556    cmp         dword ptr [ebx+10],1
>0053D55A    jle         0053D569
 0053D55C    dec         dword ptr [ebx+10]
 0053D55F    xor         eax,eax
 0053D561    mov         dword ptr [esi],eax
 0053D563    mov         byte ptr [ebp-5],1
>0053D567    jmp         0053D5B1
 0053D569    mov         eax,dword ptr [ebx+4]
 0053D56C    push        eax
 0053D56D    call        kernel32.UnmapViewOfFile
 0053D572    mov         eax,dword ptr [ebx+8]
 0053D575    push        eax
 0053D576    call        kernel32.CloseHandle
 0053D57B    test        edi,edi
>0053D57D    jne         0053D588
 0053D57F    mov         eax,dword ptr [ebx]
 0053D581    mov         [00788CAC],eax;gvar_00788CAC:Pointer
>0053D586    jmp         0053D58C
 0053D588    mov         eax,dword ptr [ebx]
 0053D58A    mov         dword ptr [edi],eax
 0053D58C    mov         edx,dword ptr ds:[53D21C];TMMFHandleListItem
 0053D592    mov         eax,ebx
 0053D594    call        @Dispose
 0053D599    xor         eax,eax
 0053D59B    mov         dword ptr [esi],eax
 0053D59D    mov         byte ptr [ebp-5],1
>0053D5A1    jmp         0053D5B1
 0053D5A3    mov         edi,ebx
 0053D5A5    mov         ebx,dword ptr [ebx]
 0053D5A7    test        ebx,ebx
>0053D5A9    jne         0053D54F
>0053D5AB    jmp         0053D5B1
 0053D5AD    mov         byte ptr [ebp-5],1
 0053D5B1    xor         eax,eax
 0053D5B3    pop         edx
 0053D5B4    pop         ecx
 0053D5B5    pop         ecx
 0053D5B6    mov         dword ptr fs:[eax],edx
 0053D5B9    push        53D5CE
 0053D5BE    lea         eax,[ebp-4]
 0053D5C1    call        @IntfClear
 0053D5C6    ret
>0053D5C7    jmp         @HandleFinally
>0053D5CC    jmp         0053D5BE
 0053D5CE    movzx       eax,byte ptr [ebp-5]
 0053D5D2    pop         edi
 0053D5D3    pop         esi
 0053D5D4    pop         ebx
 0053D5D5    pop         ecx
 0053D5D6    pop         ecx
 0053D5D7    pop         ebp
 0053D5D8    ret
end;*}

//0053D5DC
procedure sub_0053D5DC;
begin
{*
 0053D5DC    call        0053D514
 0053D5E1    ret
*}
end;

//0053D610
{*procedure sub_0053D610(?:?);
begin
 0053D610    push        ebx
 0053D611    mov         ebx,eax
 0053D613    cmp         dword ptr [ebx],0
>0053D616    je          0053D620
 0053D618    mov         eax,dword ptr [ebx]
 0053D61A    push        eax
 0053D61B    call        kernel32.FreeLibrary
 0053D620    xor         eax,eax
 0053D622    mov         dword ptr [ebx],eax
 0053D624    pop         ebx
 0053D625    ret
end;*}

//0053D628
{*procedure sub_0053D628(?:?; ?:?);
begin
 0053D628    push        ebx
 0053D629    push        esi
 0053D62A    add         esp,0FFFFFFA8
 0053D62D    mov         esi,edx
 0053D62F    mov         ebx,eax
 0053D631    push        esi
 0053D632    mov         eax,dword ptr [ebx]
 0053D634    mov         dword ptr [esp+4],eax
 0053D638    mov         byte ptr [esp+8],0
 0053D63D    movzx       eax,word ptr [ebx+4]
 0053D641    mov         dword ptr [esp+0C],eax
 0053D645    mov         byte ptr [esp+10],0
 0053D64A    movzx       eax,word ptr [ebx+6]
 0053D64E    mov         dword ptr [esp+14],eax
 0053D652    mov         byte ptr [esp+18],0
 0053D657    movzx       eax,byte ptr [ebx+8]
 0053D65B    mov         dword ptr [esp+1C],eax
 0053D65F    mov         byte ptr [esp+20],0
 0053D664    movzx       eax,byte ptr [ebx+9]
 0053D668    mov         dword ptr [esp+24],eax
 0053D66C    mov         byte ptr [esp+28],0
 0053D671    movzx       eax,byte ptr [ebx+0A]
 0053D675    mov         dword ptr [esp+2C],eax
 0053D679    mov         byte ptr [esp+30],0
 0053D67E    movzx       eax,byte ptr [ebx+0B]
 0053D682    mov         dword ptr [esp+34],eax
 0053D686    mov         byte ptr [esp+38],0
 0053D68B    movzx       eax,byte ptr [ebx+0C]
 0053D68F    mov         dword ptr [esp+3C],eax
 0053D693    mov         byte ptr [esp+40],0
 0053D698    movzx       eax,byte ptr [ebx+0D]
 0053D69C    mov         dword ptr [esp+44],eax
 0053D6A0    mov         byte ptr [esp+48],0
 0053D6A5    movzx       eax,byte ptr [ebx+0E]
 0053D6A9    mov         dword ptr [esp+4C],eax
 0053D6AD    mov         byte ptr [esp+50],0
 0053D6B2    movzx       eax,byte ptr [ebx+0F]
 0053D6B6    mov         dword ptr [esp+54],eax
 0053D6BA    mov         byte ptr [esp+58],0
 0053D6BF    lea         edx,[esp+4]
 0053D6C3    mov         ecx,0A
 0053D6C8    mov         eax,53D6E4;'{%.8x-%.4x-%.4x-%.2x%.2x-%.2x%.2x%.2x%.2x%.2x%.2x}'
 0053D6CD    call        Format
 0053D6D2    add         esp,58
 0053D6D5    pop         esi
 0053D6D6    pop         ebx
 0053D6D7    ret
end;*}

//0053D74C
constructor TJclIntfCriticalSection.Create;
begin
{*
 0053D74C    push        ebx
 0053D74D    push        esi
 0053D74E    test        dl,dl
>0053D750    je          0053D75A
 0053D752    add         esp,0FFFFFFF0
 0053D755    call        @ClassCreate
 0053D75A    mov         ebx,edx
 0053D75C    mov         esi,eax
 0053D75E    xor         edx,edx
 0053D760    mov         eax,esi
 0053D762    call        TObject.Create
 0053D767    mov         dl,1
 0053D769    mov         eax,[00455FEC];TCriticalSection
 0053D76E    call        TCriticalSection.Create;TCriticalSection.Create
 0053D773    mov         dword ptr [esi+4],eax;TJclIntfCriticalSection..........FCriticalSection:TCriticalSection
 0053D776    mov         eax,esi
 0053D778    test        bl,bl
>0053D77A    je          0053D78B
 0053D77C    call        @AfterConstruction
 0053D781    pop         dword ptr fs:[0]
 0053D788    add         esp,0C
 0053D78B    mov         eax,esi
 0053D78D    pop         esi
 0053D78E    pop         ebx
 0053D78F    ret
*}
end;

//0053D790
destructor TJclIntfCriticalSection.Destroy();
begin
{*
 0053D790    push        ebx
 0053D791    push        esi
 0053D792    call        @BeforeDestruction
 0053D797    mov         ebx,edx
 0053D799    mov         esi,eax
 0053D79B    mov         eax,dword ptr [esi+4];TJclIntfCriticalSection...........FCriticalSection:TCriticalSectio...
 0053D79E    call        TObject.Free
 0053D7A3    mov         edx,ebx
 0053D7A5    and         dl,0FC
 0053D7A8    mov         eax,esi
 0053D7AA    call        TObject.Destroy
 0053D7AF    test        bl,bl
>0053D7B1    jle         0053D7BA
 0053D7B3    mov         eax,esi
 0053D7B5    call        @ClassDestroy
 0053D7BA    pop         esi
 0053D7BB    pop         ebx
 0053D7BC    ret
*}
end;

//0053D7C0
procedure TJclIntfCriticalSection._AddRef; stdcall;
begin
{*
 0053D7C0    push        ebp
 0053D7C1    mov         ebp,esp
 0053D7C3    mov         eax,dword ptr [ebp+8]
 0053D7C6    mov         eax,dword ptr [eax+4];TJclIntfCriticalSection............FCriticalSection:TCriticalSecti...
 0053D7C9    mov         edx,dword ptr [eax]
 0053D7CB    call        dword ptr [edx];TCriticalSection.Acquire
 0053D7CD    xor         eax,eax
 0053D7CF    pop         ebp
 0053D7D0    ret         4
*}
end;

//0053D7D4
procedure TJclIntfCriticalSection._Release; stdcall;
begin
{*
 0053D7D4    push        ebp
 0053D7D5    mov         ebp,esp
 0053D7D7    mov         eax,dword ptr [ebp+8]
 0053D7DA    mov         eax,dword ptr [eax+4];TJclIntfCriticalSection.............FCriticalSection:TCriticalSect...
 0053D7DD    mov         edx,dword ptr [eax]
 0053D7DF    call        dword ptr [edx+4];TCriticalSection.Release
 0053D7E2    xor         eax,eax
 0053D7E4    pop         ebp
 0053D7E5    ret         4
*}
end;

//0053D7E8
{*function TJclIntfCriticalSection.QueryInterface(IID:TGUID; Obj:?):HRESULT; stdcall;
begin
 0053D7E8    push        ebp
 0053D7E9    mov         ebp,esp
 0053D7EB    push        ebx
 0053D7EC    mov         ebx,dword ptr [ebp+8]
 0053D7EF    mov         ecx,dword ptr [ebp+10]
 0053D7F2    mov         edx,dword ptr [ebp+0C]
 0053D7F5    mov         eax,ebx
 0053D7F7    call        TObject.GetInterface
 0053D7FC    test        al,al
>0053D7FE    je          0053D804
 0053D800    xor         eax,eax
>0053D802    jmp         0053D809
 0053D804    mov         eax,80004002
 0053D809    pop         ebx
 0053D80A    pop         ebp
 0053D80B    ret         0C
end;*}

Initialization
//00781154
{*
 00781154    sub         dword ptr ds:[8154C4],1
>0078115B    jae         00781173
 0078115D    xor         eax,eax
 0078115F    mov         [008154C0],eax;gvar_008154C0
 00781164    mov         edx,788C94;^'$URL: https://jcl.svn.sourceforge.net:443/svnroot/jcl/tags/JCL-2.2-Build384...
 00781169    mov         eax,[00790C38];gvar_00790C38
 0078116E    call        0053F424
 00781173    ret
*}
Finalization
//0053D810
{*
 0053D810    push        ebp
 0053D811    mov         ebp,esp
 0053D813    xor         eax,eax
 0053D815    push        ebp
 0053D816    push        53D89A
 0053D81B    push        dword ptr fs:[eax]
 0053D81E    mov         dword ptr fs:[eax],esp
 0053D821    inc         dword ptr ds:[8154C4]
>0053D827    jne         0053D88C
 0053D829    mov         eax,[00790C38];gvar_00790C38
 0053D82E    call        0053F440
 0053D833    mov         byte ptr ds:[788CB0],1;gvar_00788CB0
 0053D83A    mov         eax,[00788CB4];0x0 gvar_00788CB4
 0053D83F    xor         edx,edx
 0053D841    mov         dword ptr ds:[788CB4],edx;gvar_00788CB4
 0053D847    call        TObject.Free
 0053D84C    cmp         dword ptr ds:[8154C0],0;gvar_008154C0
>0053D853    je          0053D867
 0053D855    mov         eax,[008154C0];gvar_008154C0
 0053D85A    xor         edx,edx
 0053D85C    mov         dword ptr ds:[8154C0],edx;gvar_008154C0
 0053D862    call        TObject.Free
 0053D867    mov         eax,788C94;^'$URL: https://jcl.svn.sourceforge.net:443/svnroot/jcl/tags/JCL-2.2-Build384...
 0053D86C    mov         edx,dword ptr ds:[53D8C0];TUnitVersionInfo
 0053D872    call        @FinalizeRecord
 0053D877    mov         eax,788CB8;^'inf'
 0053D87C    mov         ecx,2
 0053D881    mov         edx,dword ptr ds:[40128C];string
 0053D887    call        @FinalizeArray
 0053D88C    xor         eax,eax
 0053D88E    pop         edx
 0053D88F    pop         ecx
 0053D890    pop         ecx
 0053D891    mov         dword ptr fs:[eax],edx
 0053D894    push        53D8A1
 0053D899    ret
>0053D89A    jmp         @HandleFinally
>0053D89F    jmp         0053D899
 0053D8A1    pop         ebp
 0053D8A2    ret
*}
end.