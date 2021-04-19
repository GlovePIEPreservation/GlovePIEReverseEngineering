//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit124;

interface

uses
  SysUtils, Classes;

    //procedure sub_006C491C(?:?; ?:?);//006C491C
    //procedure sub_006C49CC(?:?; ?:?);//006C49CC
    //procedure sub_006C49E4(?:Pointer; ?:?; ?:?);//006C49E4
    //procedure sub_006C49F4(?:Pointer; ?:?; ?:?);//006C49F4
    //function sub_006C4A04(?:Pointer):?;//006C4A04
    //procedure sub_006C4A50(?:?; ?:?; ?:?; ?:?; ?:?);//006C4A50
    //function sub_006C4B58(?:Pointer):?;//006C4B58
    //function sub_006C4B88(?:Pointer):?;//006C4B88

implementation

//006C491C
{*procedure sub_006C491C(?:?; ?:?);
begin
 006C491C    push        ebp
 006C491D    mov         ebp,esp
 006C491F    push        0
 006C4921    push        0
 006C4923    push        0
 006C4925    push        ebx
 006C4926    push        esi
 006C4927    push        edi
 006C4928    mov         ebx,edx
 006C492A    mov         esi,eax
 006C492C    xor         eax,eax
 006C492E    push        ebp
 006C492F    push        6C49BD
 006C4934    push        dword ptr fs:[eax]
 006C4937    mov         dword ptr fs:[eax],esp
 006C493A    mov         eax,esi
 006C493C    xchg        ah,al
 006C493E    mov         esi,eax
 006C4940    mov         eax,ebx
 006C4942    call        @UStrClr
 006C4947    lea         eax,[ebp-4]
 006C494A    movzx       edi,si
 006C494D    mov         edx,edi
 006C494F    shr         edx,0A
 006C4952    and         edx,1F
 006C4955    add         edx,40
 006C4958    call        @UStrFromWChar
 006C495D    mov         edx,dword ptr [ebp-4]
 006C4960    mov         eax,ebx
 006C4962    call        @UStrCat
 006C4967    lea         eax,[ebp-8]
 006C496A    mov         edx,edi
 006C496C    shr         edx,5
 006C496F    and         edx,1F
 006C4972    add         edx,40
 006C4975    call        @UStrFromWChar
 006C497A    mov         edx,dword ptr [ebp-8]
 006C497D    mov         eax,ebx
 006C497F    call        @UStrCat
 006C4984    lea         eax,[ebp-0C]
 006C4987    mov         edx,esi
 006C4989    and         dx,1F
 006C498D    movzx       edx,dx
 006C4990    add         edx,40
 006C4993    call        @UStrFromWChar
 006C4998    mov         edx,dword ptr [ebp-0C]
 006C499B    mov         eax,ebx
 006C499D    call        @UStrCat
 006C49A2    xor         eax,eax
 006C49A4    pop         edx
 006C49A5    pop         ecx
 006C49A6    pop         ecx
 006C49A7    mov         dword ptr fs:[eax],edx
 006C49AA    push        6C49C4
 006C49AF    lea         eax,[ebp-0C]
 006C49B2    mov         edx,3
 006C49B7    call        @UStrArrayClr
 006C49BC    ret
>006C49BD    jmp         @HandleFinally
>006C49C2    jmp         006C49AF
 006C49C4    pop         edi
 006C49C5    pop         esi
 006C49C6    pop         ebx
 006C49C7    mov         esp,ebp
 006C49C9    pop         ebp
 006C49CA    ret
end;*}

//006C49CC
{*procedure sub_006C49CC(?:?; ?:?);
begin
 006C49CC    push        ebx
 006C49CD    push        esi
 006C49CE    mov         esi,edx
 006C49D0    mov         ebx,eax
 006C49D2    mov         ecx,esi
 006C49D4    movzx       eax,bx
 006C49D7    mov         edx,4
 006C49DC    call        IntToHex
 006C49E1    pop         esi
 006C49E2    pop         ebx
 006C49E3    ret
end;*}

//006C49E4
{*procedure sub_006C49E4(?:Pointer; ?:?; ?:?);
begin
 006C49E4    push        ebx
 006C49E5    movzx       ebx,byte ptr [eax+12]
 006C49E9    mov         byte ptr [edx],bl
 006C49EB    movzx       eax,byte ptr [eax+13]
 006C49EF    mov         byte ptr [ecx],al
 006C49F1    pop         ebx
 006C49F2    ret
end;*}

//006C49F4
{*procedure sub_006C49F4(?:Pointer; ?:?; ?:?);
begin
 006C49F4    push        ebx
 006C49F5    movzx       ebx,byte ptr [eax+15]
 006C49F9    mov         byte ptr [edx],bl
 006C49FB    movzx       eax,byte ptr [eax+16]
 006C49FF    mov         byte ptr [ecx],al
 006C4A01    pop         ebx
 006C4A02    ret
end;*}

//006C4A04
{*function sub_006C4A04(?:Pointer):?;
begin
 006C4A04    push        ebp
 006C4A05    mov         ebp,esp
 006C4A07    push        0
 006C4A09    push        ebx
 006C4A0A    push        esi
 006C4A0B    mov         ebx,eax
 006C4A0D    xor         eax,eax
 006C4A0F    push        ebp
 006C4A10    push        6C4A40
 006C4A15    push        dword ptr fs:[eax]
 006C4A18    mov         dword ptr fs:[eax],esp
 006C4A1B    mov         esi,dword ptr [ebx+0C]
 006C4A1E    lea         edx,[ebp-4]
 006C4A21    movzx       eax,word ptr [ebx+8]
 006C4A25    call        006C491C
 006C4A2A    xor         eax,eax
 006C4A2C    pop         edx
 006C4A2D    pop         ecx
 006C4A2E    pop         ecx
 006C4A2F    mov         dword ptr fs:[eax],edx
 006C4A32    push        6C4A47
 006C4A37    lea         eax,[ebp-4]
 006C4A3A    call        @UStrClr
 006C4A3F    ret
>006C4A40    jmp         @HandleFinally
>006C4A45    jmp         006C4A37
 006C4A47    mov         eax,esi
 006C4A49    pop         esi
 006C4A4A    pop         ebx
 006C4A4B    pop         ecx
 006C4A4C    pop         ebp
 006C4A4D    ret
end;*}

//006C4A50
{*procedure sub_006C4A50(?:?; ?:?; ?:?; ?:?; ?:?);
begin
 006C4A50    push        ebp
 006C4A51    mov         ebp,esp
 006C4A53    add         esp,0FFFFFFF0
 006C4A56    push        ebx
 006C4A57    push        esi
 006C4A58    push        edi
 006C4A59    xor         ebx,ebx
 006C4A5B    mov         dword ptr [ebp-10],ebx
 006C4A5E    mov         dword ptr [ebp-0C],ebx
 006C4A61    mov         dword ptr [ebp-8],ecx
 006C4A64    mov         dword ptr [ebp-4],edx
 006C4A67    mov         esi,eax
 006C4A69    mov         eax,dword ptr [ebp-4]
 006C4A6C    test        eax,eax
>006C4A6E    je          006C4A74
 006C4A70    xor         edx,edx
 006C4A72    mov         dword ptr [eax],edx
 006C4A74    mov         eax,dword ptr [ebp-8]
 006C4A77    test        eax,eax
>006C4A79    je          006C4A7F
 006C4A7B    xor         edx,edx
 006C4A7D    mov         dword ptr [eax],edx
 006C4A7F    mov         eax,dword ptr [ebp+0C]
 006C4A82    test        eax,eax
>006C4A84    je          006C4A8A
 006C4A86    xor         edx,edx
 006C4A88    mov         dword ptr [eax],edx
 006C4A8A    mov         eax,dword ptr [ebp+8]
 006C4A8D    test        eax,eax
>006C4A8F    je          006C4A95
 006C4A91    xor         edx,edx
 006C4A93    mov         dword ptr [eax],edx
 006C4A95    xor         eax,eax
 006C4A97    push        ebp
 006C4A98    push        6C4B47
 006C4A9D    push        dword ptr fs:[eax]
 006C4AA0    mov         dword ptr fs:[eax],esp
 006C4AA3    movzx       ebx,word ptr [esi+8]
 006C4AA7    movzx       esi,word ptr [esi+0A]
 006C4AAB    lea         edx,[ebp-0C]
 006C4AAE    mov         eax,ebx
 006C4AB0    call        006C491C
 006C4AB5    mov         edx,dword ptr [ebp-0C]
 006C4AB8    mov         eax,dword ptr [ebp-4]
 006C4ABB    call        @UStrAsg
 006C4AC0    lea         edx,[ebp-10]
 006C4AC3    mov         eax,esi
 006C4AC5    call        006C49CC
 006C4ACA    mov         edx,dword ptr [ebp-10]
 006C4ACD    mov         eax,dword ptr [ebp-8]
 006C4AD0    call        @UStrAsg
 006C4AD5    mov         eax,dword ptr [ebp+0C]
 006C4AD8    mov         edx,dword ptr [ebp-4]
 006C4ADB    mov         edx,dword ptr [edx]
 006C4ADD    call        @UStrAsg
 006C4AE2    mov         eax,dword ptr [ebp+8]
 006C4AE5    mov         edx,dword ptr [ebp+0C]
 006C4AE8    mov         edx,dword ptr [edx]
 006C4AEA    call        @UStrAsg
 006C4AEF    mov         edi,3D
 006C4AF4    mov         ebx,78BE98;^'ACT'
 006C4AF9    mov         esi,78C084;^'Targa'
 006C4AFE    mov         eax,dword ptr [ebp-4]
 006C4B01    mov         eax,dword ptr [eax]
 006C4B03    mov         edx,dword ptr [ebx]
 006C4B05    call        @UStrEqual
>006C4B0A    jne         006C4B23
 006C4B0C    mov         eax,dword ptr [ebp+0C]
 006C4B0F    mov         edx,dword ptr [esi]
 006C4B11    call        @UStrAsg
 006C4B16    mov         eax,dword ptr [ebp+8]
 006C4B19    mov         edx,dword ptr [ebx+4]
 006C4B1C    call        @UStrAsg
>006C4B21    jmp         006C4B2C
 006C4B23    add         esi,8
 006C4B26    add         ebx,8
 006C4B29    dec         edi
>006C4B2A    jne         006C4AFE
 006C4B2C    xor         eax,eax
 006C4B2E    pop         edx
 006C4B2F    pop         ecx
 006C4B30    pop         ecx
 006C4B31    mov         dword ptr fs:[eax],edx
 006C4B34    push        6C4B4E
 006C4B39    lea         eax,[ebp-10]
 006C4B3C    mov         edx,2
 006C4B41    call        @UStrArrayClr
 006C4B46    ret
>006C4B47    jmp         @HandleFinally
>006C4B4C    jmp         006C4B39
 006C4B4E    pop         edi
 006C4B4F    pop         esi
 006C4B50    pop         ebx
 006C4B51    mov         esp,ebp
 006C4B53    pop         ebp
 006C4B54    ret         8
end;*}

//006C4B58
{*function sub_006C4B58(?:Pointer):?;
begin
 006C4B58    add         esp,0FFFFFFF8
 006C4B5B    movzx       edx,byte ptr [eax+11]
 006C4B5F    add         edx,7C6
 006C4B65    movzx       eax,byte ptr [eax+10]
 006C4B69    dec         eax
 006C4B6A    mov         ecx,eax
 006C4B6C    add         eax,eax
 006C4B6E    add         eax,eax
 006C4B70    add         eax,eax
 006C4B72    sub         eax,ecx
 006C4B74    inc         eax
 006C4B75    xchg        eax,edx
 006C4B76    call        0045750C
 006C4B7B    fstp        qword ptr [esp]
 006C4B7E    wait
 006C4B7F    fld         qword ptr [esp]
 006C4B82    pop         ecx
 006C4B83    pop         edx
 006C4B84    ret
end;*}

//006C4B88
{*function sub_006C4B88(?:Pointer):?;
begin
 006C4B88    push        ebp
 006C4B89    mov         ebp,esp
 006C4B8B    mov         ecx,4D
 006C4B90    push        0
 006C4B92    push        0
 006C4B94    dec         ecx
>006C4B95    jne         006C4B90
 006C4B97    push        ebx
 006C4B98    push        esi
 006C4B99    push        edi
 006C4B9A    mov         dword ptr [ebp-10],eax
 006C4B9D    xor         eax,eax
 006C4B9F    push        ebp
 006C4BA0    push        6C50CE
 006C4BA5    push        dword ptr fs:[eax]
 006C4BA8    mov         dword ptr fs:[eax],esp
 006C4BAB    mov         eax,6C50EC;'GetMonitorEDID'
 006C4BB0    call        004FA5FC
 006C4BB5    mov         byte ptr [ebp-11],0
 006C4BB9    xor         eax,eax
 006C4BBB    mov         dword ptr [ebp-18],eax
 006C4BBE    xor         eax,eax
 006C4BC0    mov         dword ptr [ebp-1C],eax
 006C4BC3    xor         eax,eax
 006C4BC5    mov         dword ptr [ebp-20],eax
 006C4BC8    xor         edx,edx
 006C4BCA    push        ebp
 006C4BCB    push        6C5099
 006C4BD0    push        dword ptr fs:[edx]
 006C4BD3    mov         dword ptr fs:[edx],esp
 006C4BD6    xor         edx,edx
 006C4BD8    push        ebp
 006C4BD9    push        6C5088
 006C4BDE    push        dword ptr fs:[edx]
 006C4BE1    mov         dword ptr fs:[edx],esp
 006C4BE4    mov         dl,1
 006C4BE6    mov         eax,[0043C7BC];TStringList
 006C4BEB    call        TStringList.Create;TStringList.Create
 006C4BF0    mov         dword ptr [ebp-1C],eax
 006C4BF3    mov         dl,1
 006C4BF5    mov         eax,[0043C7BC];TStringList
 006C4BFA    call        TStringList.Create;TStringList.Create
 006C4BFF    mov         dword ptr [ebp-20],eax
 006C4C02    mov         ecx,20019
 006C4C07    mov         dl,1
 006C4C09    mov         eax,[0045C080];TRegistry
 006C4C0E    call        TRegistry.Create;TRegistry.Create
 006C4C13    mov         dword ptr [ebp-18],eax
 006C4C16    mov         edx,80000002
 006C4C1B    mov         eax,dword ptr [ebp-18]
 006C4C1E    call        TRegistry.SetRootKey
 006C4C23    lea         eax,[ebp-4]
 006C4C26    call        @UStrClr
 006C4C2B    lea         eax,[ebp-8]
 006C4C2E    mov         edx,6C5118;'\SYSTEM\CurrentControlSet\Control\Class\{4D36E96E-E325-11CE-BFC1-08002BE1031...
 006C4C33    call        @UStrLAsg
 006C4C38    mov         edx,dword ptr [ebp-8]
 006C4C3B    mov         eax,dword ptr [ebp-18]
 006C4C3E    call        TRegistry.OpenKeyReadOnly
 006C4C43    test        al,al
>006C4C45    je          006C4D2F
 006C4C4B    mov         edx,dword ptr [ebp-1C]
 006C4C4E    mov         eax,dword ptr [ebp-18]
 006C4C51    call        TRegistry.GetKeyNames
 006C4C56    mov         eax,dword ptr [ebp-1C]
 006C4C59    mov         edx,dword ptr [eax]
 006C4C5B    call        dword ptr [edx+14];TStringList.GetCount
 006C4C5E    mov         esi,eax
 006C4C60    dec         esi
 006C4C61    test        esi,esi
>006C4C63    jl          006C4D25
 006C4C69    inc         esi
 006C4C6A    xor         ebx,ebx
 006C4C6C    push        dword ptr [ebp-8]
 006C4C6F    push        6C51C4;'\'
 006C4C74    lea         ecx,[ebp-234]
 006C4C7A    mov         edx,ebx
 006C4C7C    mov         eax,dword ptr [ebp-1C]
 006C4C7F    mov         edi,dword ptr [eax]
 006C4C81    call        dword ptr [edi+0C];TStringList.Get
 006C4C84    push        dword ptr [ebp-234]
 006C4C8A    lea         eax,[ebp-230]
 006C4C90    mov         edx,3
 006C4C95    call        @UStrCatN
 006C4C9A    mov         edx,dword ptr [ebp-230]
 006C4CA0    mov         eax,dword ptr [ebp-18]
 006C4CA3    call        TRegistry.OpenKeyReadOnly
 006C4CA8    test        al,al
>006C4CAA    je          006C4D1D
 006C4CAC    lea         ecx,[ebp-0C]
 006C4CAF    mov         edx,6C51D4;'DriverDesc'
 006C4CB4    mov         eax,dword ptr [ebp-18]
 006C4CB7    call        TRegistry.ReadString
 006C4CBC    mov         edx,6C51F8;'Plug and Play'
 006C4CC1    mov         eax,dword ptr [ebp-0C]
 006C4CC4    call        004F9A58
 006C4CC9    test        al,al
>006C4CCB    jne         006C4D1D
 006C4CCD    mov         edx,6C5220;'Default'
 006C4CD2    mov         eax,dword ptr [ebp-0C]
 006C4CD5    call        004F9A58
 006C4CDA    test        al,al
>006C4CDC    jne         006C4D1D
 006C4CDE    lea         ecx,[ebp-4]
 006C4CE1    mov         edx,6C523C;'MatchingDeviceId'
 006C4CE6    mov         eax,dword ptr [ebp-18]
 006C4CE9    call        TRegistry.ReadString
 006C4CEE    movzx       eax,byte ptr ds:[6C5260];0x2 gvar_006C5260
 006C4CF5    push        eax
 006C4CF6    lea         eax,[ebp-238]
 006C4CFC    push        eax
 006C4CFD    mov         ecx,6C5270;^338:Single
 006C4D02    mov         edx,6C528C;'Monitor'
 006C4D07    mov         eax,dword ptr [ebp-4]
 006C4D0A    call        StringReplace
 006C4D0F    mov         edx,dword ptr [ebp-238]
 006C4D15    lea         eax,[ebp-4]
 006C4D18    call        @UStrLAsg
 006C4D1D    inc         ebx
 006C4D1E    dec         esi
>006C4D1F    jne         006C4C6C
 006C4D25    mov         eax,dword ptr [ebp-18]
 006C4D28    call        TRegistry.CloseKey
>006C4D2D    jmp         006C4D41
 006C4D2F    call        @TryFinallyExit
 006C4D34    xor         eax,eax
 006C4D36    pop         edx
 006C4D37    pop         ecx
 006C4D38    pop         ecx
 006C4D39    mov         dword ptr fs:[eax],edx
>006C4D3C    jmp         006C50A3
 006C4D41    cmp         dword ptr [ebp-4],0
>006C4D45    je          006C4D76
 006C4D47    lea         eax,[ebp-23C]
 006C4D4D    mov         ecx,dword ptr [ebp-4]
 006C4D50    mov         edx,6C52A8;'\SYSTEM\CurrentControlSet\Enum\'
 006C4D55    call        @UStrCat3
 006C4D5A    mov         edx,dword ptr [ebp-23C]
 006C4D60    mov         eax,dword ptr [ebp-18]
 006C4D63    call        TRegistry.OpenKeyReadOnly
 006C4D68    test        al,al
>006C4D6A    jne         006C4D76
 006C4D6C    lea         eax,[ebp-4]
 006C4D6F    call        @UStrClr
>006C4D74    jmp         006C4D7E
 006C4D76    mov         eax,dword ptr [ebp-18]
 006C4D79    call        TRegistry.CloseKey
 006C4D7E    cmp         dword ptr [ebp-4],0
>006C4D82    jne         006C4F72
 006C4D88    mov         byte ptr [ebp-25],0
 006C4D8C    lea         eax,[ebp-8]
 006C4D8F    mov         edx,6C52F4;'\SYSTEM\CurrentControlSet\Enum\DISPLAY'
 006C4D94    call        @UStrLAsg
 006C4D99    mov         edx,dword ptr [ebp-8]
 006C4D9C    mov         eax,dword ptr [ebp-18]
 006C4D9F    call        TRegistry.OpenKeyReadOnly
 006C4DA4    test        al,al
>006C4DA6    je          006C4F5A
 006C4DAC    mov         edx,dword ptr [ebp-1C]
 006C4DAF    mov         eax,dword ptr [ebp-18]
 006C4DB2    call        TRegistry.GetKeyNames
 006C4DB7    mov         eax,dword ptr [ebp-1C]
 006C4DBA    mov         edx,dword ptr [eax]
 006C4DBC    call        dword ptr [edx+14];TStringList.GetCount
 006C4DBF    mov         esi,eax
 006C4DC1    dec         esi
 006C4DC2    test        esi,esi
>006C4DC4    jl          006C4F5A
 006C4DCA    inc         esi
 006C4DCB    xor         ebx,ebx
 006C4DCD    push        dword ptr [ebp-8]
 006C4DD0    push        6C51C4;'\'
 006C4DD5    lea         ecx,[ebp-244]
 006C4DDB    mov         edx,ebx
 006C4DDD    mov         eax,dword ptr [ebp-1C]
 006C4DE0    mov         edi,dword ptr [eax]
 006C4DE2    call        dword ptr [edi+0C];TStringList.Get
 006C4DE5    push        dword ptr [ebp-244]
 006C4DEB    lea         eax,[ebp-240]
 006C4DF1    mov         edx,3
 006C4DF6    call        @UStrCatN
 006C4DFB    mov         edx,dword ptr [ebp-240]
 006C4E01    mov         eax,dword ptr [ebp-18]
 006C4E04    call        TRegistry.OpenKeyReadOnly
 006C4E09    test        al,al
>006C4E0B    je          006C4F4C
 006C4E11    mov         edx,dword ptr [ebp-20]
 006C4E14    mov         eax,dword ptr [ebp-18]
 006C4E17    call        TRegistry.GetKeyNames
 006C4E1C    mov         eax,dword ptr [ebp-20]
 006C4E1F    mov         edx,dword ptr [eax]
 006C4E21    call        dword ptr [edx+14];TStringList.GetCount
 006C4E24    dec         eax
 006C4E25    test        eax,eax
>006C4E27    jl          006C4F44
 006C4E2D    inc         eax
 006C4E2E    mov         dword ptr [ebp-2C],eax
 006C4E31    mov         dword ptr [ebp-24],0
 006C4E38    push        dword ptr [ebp-8]
 006C4E3B    push        6C51C4;'\'
 006C4E40    lea         ecx,[ebp-24C]
 006C4E46    mov         edx,ebx
 006C4E48    mov         eax,dword ptr [ebp-1C]
 006C4E4B    mov         edi,dword ptr [eax]
 006C4E4D    call        dword ptr [edi+0C];TStringList.Get
 006C4E50    push        dword ptr [ebp-24C]
 006C4E56    push        6C51C4;'\'
 006C4E5B    lea         ecx,[ebp-250]
 006C4E61    mov         edx,dword ptr [ebp-24]
 006C4E64    mov         eax,dword ptr [ebp-20]
 006C4E67    mov         edi,dword ptr [eax]
 006C4E69    call        dword ptr [edi+0C];TStringList.Get
 006C4E6C    push        dword ptr [ebp-250]
 006C4E72    push        6C5350;'\Control'
 006C4E77    lea         eax,[ebp-248]
 006C4E7D    mov         edx,6
 006C4E82    call        @UStrCatN
 006C4E87    mov         edx,dword ptr [ebp-248]
 006C4E8D    mov         eax,dword ptr [ebp-18]
 006C4E90    call        TRegistry.OpenKeyReadOnly
 006C4E95    test        al,al
>006C4E97    je          006C4F38
 006C4E9D    push        dword ptr [ebp-8]
 006C4EA0    push        6C51C4;'\'
 006C4EA5    lea         ecx,[ebp-258]
 006C4EAB    mov         edx,ebx
 006C4EAD    mov         eax,dword ptr [ebp-1C]
 006C4EB0    mov         edi,dword ptr [eax]
 006C4EB2    call        dword ptr [edi+0C];TStringList.Get
 006C4EB5    push        dword ptr [ebp-258]
 006C4EBB    push        6C51C4;'\'
 006C4EC0    lea         ecx,[ebp-25C]
 006C4EC6    mov         edx,dword ptr [ebp-24]
 006C4EC9    mov         eax,dword ptr [ebp-20]
 006C4ECC    mov         edi,dword ptr [eax]
 006C4ECE    call        dword ptr [edi+0C];TStringList.Get
 006C4ED1    push        dword ptr [ebp-25C]
 006C4ED7    push        6C5370;'\Device Parameters'
 006C4EDC    lea         eax,[ebp-254]
 006C4EE2    mov         edx,6
 006C4EE7    call        @UStrCatN
 006C4EEC    mov         edx,dword ptr [ebp-254]
 006C4EF2    mov         eax,dword ptr [ebp-18]
 006C4EF5    call        TRegistry.OpenKeyReadOnly
 006C4EFA    test        al,al
>006C4EFC    je          006C4F38
 006C4EFE    mov         edx,6C53A4;'EDID'
 006C4F03    mov         eax,dword ptr [ebp-18]
 006C4F06    call        TRegistry.ValueExists
 006C4F0B    test        al,al
>006C4F0D    je          006C4F38
 006C4F0F    lea         ecx,[ebp-260]
 006C4F15    mov         edx,ebx
 006C4F17    mov         eax,dword ptr [ebp-1C]
 006C4F1A    mov         edi,dword ptr [eax]
 006C4F1C    call        dword ptr [edi+0C];TStringList.Get
 006C4F1F    mov         ecx,dword ptr [ebp-260]
 006C4F25    lea         eax,[ebp-4]
 006C4F28    mov         edx,6C53BC;^338:Single
 006C4F2D    call        @UStrCat3
 006C4F32    mov         byte ptr [ebp-25],1
>006C4F36    jmp         006C4F44
 006C4F38    inc         dword ptr [ebp-24]
 006C4F3B    dec         dword ptr [ebp-2C]
>006C4F3E    jne         006C4E38
 006C4F44    mov         eax,dword ptr [ebp-18]
 006C4F47    call        TRegistry.CloseKey
 006C4F4C    cmp         byte ptr [ebp-25],0
>006C4F50    jne         006C4F5A
 006C4F52    inc         ebx
 006C4F53    dec         esi
>006C4F54    jne         006C4DCD
 006C4F5A    cmp         byte ptr [ebp-25],0
>006C4F5E    jne         006C4F72
 006C4F60    call        @TryFinallyExit
 006C4F65    xor         eax,eax
 006C4F67    pop         edx
 006C4F68    pop         ecx
 006C4F69    pop         ecx
 006C4F6A    mov         dword ptr fs:[eax],edx
>006C4F6D    jmp         006C50A3
 006C4F72    lea         eax,[ebp-8]
 006C4F75    mov         ecx,dword ptr [ebp-4]
 006C4F78    mov         edx,6C52A8;'\SYSTEM\CurrentControlSet\Enum\'
 006C4F7D    call        @UStrCat3
 006C4F82    mov         edx,dword ptr [ebp-8]
 006C4F85    mov         eax,dword ptr [ebp-18]
 006C4F88    call        TRegistry.OpenKeyReadOnly
 006C4F8D    test        al,al
>006C4F8F    je          006C5053
 006C4F95    mov         edx,dword ptr [ebp-1C]
 006C4F98    mov         eax,dword ptr [ebp-18]
 006C4F9B    call        TRegistry.GetKeyNames
 006C4FA0    mov         eax,dword ptr [ebp-1C]
 006C4FA3    mov         edx,dword ptr [eax]
 006C4FA5    call        dword ptr [edx+14];TStringList.GetCount
 006C4FA8    test        eax,eax
>006C4FAA    jne         006C4FBE
 006C4FAC    call        @TryFinallyExit
 006C4FB1    xor         eax,eax
 006C4FB3    pop         edx
 006C4FB4    pop         ecx
 006C4FB5    pop         ecx
 006C4FB6    mov         dword ptr fs:[eax],edx
>006C4FB9    jmp         006C50A3
 006C4FBE    push        dword ptr [ebp-8]
 006C4FC1    push        6C51C4;'\'
 006C4FC6    lea         ecx,[ebp-268]
 006C4FCC    xor         edx,edx
 006C4FCE    mov         eax,dword ptr [ebp-1C]
 006C4FD1    mov         ebx,dword ptr [eax]
 006C4FD3    call        dword ptr [ebx+0C];TStringList.Get
 006C4FD6    push        dword ptr [ebp-268]
 006C4FDC    push        6C5370;'\Device Parameters'
 006C4FE1    lea         eax,[ebp-264]
 006C4FE7    mov         edx,4
 006C4FEC    call        @UStrCatN
 006C4FF1    mov         edx,dword ptr [ebp-264]
 006C4FF7    mov         eax,dword ptr [ebp-18]
 006C4FFA    call        TRegistry.OpenKeyReadOnly
 006C4FFF    test        al,al
>006C5001    je          006C5053
 006C5003    push        100
 006C5008    lea         ecx,[ebp-22C]
 006C500E    mov         edx,6C53A4;'EDID'
 006C5013    mov         eax,dword ptr [ebp-18]
 006C5016    call        TRegistry.ReadBinaryData
 006C501B    mov         ebx,eax
 006C501D    test        ebx,ebx
>006C501F    jle         006C5053
 006C5021    mov         eax,dword ptr [ebp-10]
 006C5024    xor         ecx,ecx
 006C5026    mov         edx,100
 006C502B    call        @FillChar
 006C5030    mov         edx,dword ptr [ebp-10]
 006C5033    lea         eax,[ebp-22C]
 006C5039    mov         ecx,ebx
 006C503B    call        Move
 006C5040    mov         byte ptr [ebp-11],1
 006C5044    call        @TryFinallyExit
 006C5049    xor         eax,eax
 006C504B    pop         edx
 006C504C    pop         ecx
 006C504D    pop         ecx
 006C504E    mov         dword ptr fs:[eax],edx
>006C5051    jmp         006C50A3
 006C5053    xor         eax,eax
 006C5055    pop         edx
 006C5056    pop         ecx
 006C5057    pop         ecx
 006C5058    mov         dword ptr fs:[eax],edx
 006C505B    push        6C508F
 006C5060    mov         eax,dword ptr [ebp-18]
 006C5063    xor         edx,edx
 006C5065    mov         dword ptr [ebp-18],edx
 006C5068    call        TObject.Free
 006C506D    mov         eax,dword ptr [ebp-1C]
 006C5070    xor         edx,edx
 006C5072    mov         dword ptr [ebp-1C],edx
 006C5075    call        TObject.Free
 006C507A    mov         eax,dword ptr [ebp-20]
 006C507D    xor         edx,edx
 006C507F    mov         dword ptr [ebp-20],edx
 006C5082    call        TObject.Free
 006C5087    ret
>006C5088    jmp         @HandleFinally
>006C508D    jmp         006C5060
 006C508F    xor         eax,eax
 006C5091    pop         edx
 006C5092    pop         ecx
 006C5093    pop         ecx
 006C5094    mov         dword ptr fs:[eax],edx
>006C5097    jmp         006C50A3
>006C5099    jmp         @HandleAnyException
 006C509E    call        @DoneExcept
 006C50A3    xor         eax,eax
 006C50A5    pop         edx
 006C50A6    pop         ecx
 006C50A7    pop         ecx
 006C50A8    mov         dword ptr fs:[eax],edx
 006C50AB    push        6C50D5
 006C50B0    lea         eax,[ebp-268]
 006C50B6    mov         edx,0F
 006C50BB    call        @UStrArrayClr
 006C50C0    lea         eax,[ebp-0C]
 006C50C3    mov         edx,3
 006C50C8    call        @UStrArrayClr
 006C50CD    ret
>006C50CE    jmp         @HandleFinally
>006C50D3    jmp         006C50B0
 006C50D5    movzx       eax,byte ptr [ebp-11]
 006C50D9    pop         edi
 006C50DA    pop         esi
 006C50DB    pop         ebx
 006C50DC    mov         esp,ebp
 006C50DE    pop         ebp
 006C50DF    ret
end;*}

Initialization
Finalization
//006C53D0
{*
 006C53D0    push        ebp
 006C53D1    mov         ebp,esp
 006C53D3    xor         eax,eax
 006C53D5    push        ebp
 006C53D6    push        6C5421
 006C53DB    push        dword ptr fs:[eax]
 006C53DE    mov         dword ptr fs:[eax],esp
 006C53E1    inc         dword ptr ds:[81F5B4]
>006C53E7    jne         006C5413
 006C53E9    mov         eax,78BE98;^'ACT'
 006C53EE    mov         ecx,7A
 006C53F3    mov         edx,dword ptr ds:[40128C];string
 006C53F9    call        @FinalizeArray
 006C53FE    mov         eax,78C080;^'ACT'
 006C5403    mov         ecx,7A
 006C5408    mov         edx,dword ptr ds:[40128C];string
 006C540E    call        @FinalizeArray
 006C5413    xor         eax,eax
 006C5415    pop         edx
 006C5416    pop         ecx
 006C5417    pop         ecx
 006C5418    mov         dword ptr fs:[eax],edx
 006C541B    push        6C5428
 006C5420    ret
>006C5421    jmp         @HandleFinally
>006C5426    jmp         006C5420
 006C5428    pop         ebp
 006C5429    ret
*}
end.