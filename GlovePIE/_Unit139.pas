//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit139;

interface

uses
  SysUtils, Classes;

    procedure sub_006F2C3C;//006F2C3C
    //procedure sub_006F306C(?:?; ?:?);//006F306C
    //function sub_006F3084:?;//006F3084
    //function sub_006F30F8:?;//006F30F8
    //function sub_006F3174(?:?):?;//006F3174

implementation

//006F2C3C
procedure sub_006F2C3C;
begin
{*
 006F2C3C    push        ebx
 006F2C3D    mov         ebx,8228D8;gvar_008228D8:THashTable
 006F2C42    xor         ecx,ecx
 006F2C44    mov         edx,6F2DD4;'Exists'
 006F2C49    mov         eax,dword ptr [ebx]
 006F2C4B    call        THashTable.Add
 006F2C50    mov         ecx,15
 006F2C55    mov         edx,6F2DF0;'BedPitch'
 006F2C5A    mov         eax,dword ptr [ebx]
 006F2C5C    call        THashTable.Add
 006F2C61    mov         ecx,14
 006F2C66    mov         edx,6F2E10;'BedYaw'
 006F2C6B    mov         eax,dword ptr [ebx]
 006F2C6D    call        THashTable.Add
 006F2C72    mov         ecx,2
 006F2C77    mov         edx,6F2E2C;'Pitch'
 006F2C7C    mov         eax,dword ptr [ebx]
 006F2C7E    call        THashTable.Add
 006F2C83    mov         ecx,5
 006F2C88    mov         edx,6F2E44;'ContinuousYaw'
 006F2C8D    mov         eax,dword ptr [ebx]
 006F2C8F    call        THashTable.Add
 006F2C94    mov         ecx,1
 006F2C99    mov         edx,6F2E6C;'Yaw'
 006F2C9E    mov         eax,dword ptr [ebx]
 006F2CA0    call        THashTable.Add
 006F2CA5    mov         ecx,3
 006F2CAA    mov         edx,6F2E80;'Roll'
 006F2CAF    mov         eax,dword ptr [ebx]
 006F2CB1    call        THashTable.Add
 006F2CB6    mov         ecx,4
 006F2CBB    mov         edx,6F2E98;'RotMat'
 006F2CC0    mov         eax,dword ptr [ebx]
 006F2CC2    call        THashTable.Add
 006F2CC7    mov         ecx,4
 006F2CCC    mov         edx,6F2EB4;'Rotation'
 006F2CD1    mov         eax,dword ptr [ebx]
 006F2CD3    call        THashTable.Add
 006F2CD8    mov         ecx,6
 006F2CDD    mov         edx,6F2ED4;'RawForceX'
 006F2CE2    mov         eax,dword ptr [ebx]
 006F2CE4    call        THashTable.Add
 006F2CE9    mov         ecx,7
 006F2CEE    mov         edx,6F2EF4;'RawForceY'
 006F2CF3    mov         eax,dword ptr [ebx]
 006F2CF5    call        THashTable.Add
 006F2CFA    mov         ecx,8
 006F2CFF    mov         edx,6F2F14;'RawForceZ'
 006F2D04    mov         eax,dword ptr [ebx]
 006F2D06    call        THashTable.Add
 006F2D0B    mov         ecx,9
 006F2D10    mov         edx,6F2F34;'RawMagnetX'
 006F2D15    mov         eax,dword ptr [ebx]
 006F2D17    call        THashTable.Add
 006F2D1C    mov         ecx,0A
 006F2D21    mov         edx,6F2F58;'RawMagnetY'
 006F2D26    mov         eax,dword ptr [ebx]
 006F2D28    call        THashTable.Add
 006F2D2D    mov         ecx,0B
 006F2D32    mov         edx,6F2F7C;'RawMagnetZ'
 006F2D37    mov         eax,dword ptr [ebx]
 006F2D39    call        THashTable.Add
 006F2D3E    mov         ecx,0C
 006F2D43    mov         edx,6F2FA0;'gx'
 006F2D48    mov         eax,dword ptr [ebx]
 006F2D4A    call        THashTable.Add
 006F2D4F    mov         ecx,0D
 006F2D54    mov         edx,6F2FB4;'gy'
 006F2D59    mov         eax,dword ptr [ebx]
 006F2D5B    call        THashTable.Add
 006F2D60    mov         ecx,0E
 006F2D65    mov         edx,6F2FC8;'gz'
 006F2D6A    mov         eax,dword ptr [ebx]
 006F2D6C    call        THashTable.Add
 006F2D71    mov         ecx,0F
 006F2D76    mov         edx,6F2FDC;'RelAccX'
 006F2D7B    mov         eax,dword ptr [ebx]
 006F2D7D    call        THashTable.Add
 006F2D82    mov         ecx,10
 006F2D87    mov         edx,6F2FF8;'RelAccY'
 006F2D8C    mov         eax,dword ptr [ebx]
 006F2D8E    call        THashTable.Add
 006F2D93    mov         ecx,11
 006F2D98    mov         edx,6F3014;'RelAccZ'
 006F2D9D    mov         eax,dword ptr [ebx]
 006F2D9F    call        THashTable.Add
 006F2DA4    mov         ecx,12
 006F2DA9    mov         edx,6F3030;'StrictPitch'
 006F2DAE    mov         eax,dword ptr [ebx]
 006F2DB0    call        THashTable.Add
 006F2DB5    mov         ecx,13
 006F2DBA    mov         edx,6F3054;'StrictRoll'
 006F2DBF    mov         eax,dword ptr [ebx]
 006F2DC1    call        THashTable.Add
 006F2DC6    pop         ebx
 006F2DC7    ret
*}
end;

//006F306C
{*procedure sub_006F306C(?:?; ?:?);
begin
 006F306C    push        ebx
 006F306D    push        esi
 006F306E    mov         esi,edx
 006F3070    mov         ebx,eax
 006F3072    mov         ecx,esi
 006F3074    mov         edx,ebx
 006F3076    mov         eax,[008228D8];gvar_008228D8:THashTable
 006F307B    call        THashTable.Get
 006F3080    pop         esi
 006F3081    pop         ebx
 006F3082    ret
end;*}

//006F3084
{*function sub_006F3084:?;
begin
 006F3084    push        ebp
 006F3085    mov         ebp,esp
 006F3087    push        0
 006F3089    push        ebx
 006F308A    push        esi
 006F308B    xor         eax,eax
 006F308D    push        ebp
 006F308E    push        6F30E8
 006F3093    push        dword ptr fs:[eax]
 006F3096    mov         dword ptr fs:[eax],esp
 006F3099    mov         dl,1
 006F309B    mov         eax,[0043C7BC];TStringList
 006F30A0    call        TStringList.Create;TStringList.Create
 006F30A5    mov         esi,eax
 006F30A7    mov         dl,1
 006F30A9    mov         eax,esi
 006F30AB    call        TStringList.SetSorted
 006F30B0    xor         ebx,ebx
 006F30B2    lea         edx,[ebp-4]
 006F30B5    mov         eax,ebx
 006F30B7    call        006F306C
 006F30BC    cmp         dword ptr [ebp-4],0
>006F30C0    je          006F30CC
 006F30C2    mov         edx,dword ptr [ebp-4]
 006F30C5    mov         eax,esi
 006F30C7    mov         ecx,dword ptr [eax]
 006F30C9    call        dword ptr [ecx+38];TStringList.Add
 006F30CC    inc         ebx
 006F30CD    cmp         ebx,15
>006F30D0    jne         006F30B2
 006F30D2    xor         eax,eax
 006F30D4    pop         edx
 006F30D5    pop         ecx
 006F30D6    pop         ecx
 006F30D7    mov         dword ptr fs:[eax],edx
 006F30DA    push        6F30EF
 006F30DF    lea         eax,[ebp-4]
 006F30E2    call        @UStrClr
 006F30E7    ret
>006F30E8    jmp         @HandleFinally
>006F30ED    jmp         006F30DF
 006F30EF    mov         eax,esi
 006F30F1    pop         esi
 006F30F2    pop         ebx
 006F30F3    pop         ecx
 006F30F4    pop         ebp
 006F30F5    ret
end;*}

//006F30F8
{*function sub_006F30F8:?;
begin
 006F30F8    push        ebx
 006F30F9    mov         dl,1
 006F30FB    mov         eax,[0043C7BC];TStringList
 006F3100    call        TStringList.Create;TStringList.Create
 006F3105    mov         ebx,eax
 006F3107    mov         edx,6F313C;'yaw'
 006F310C    mov         eax,ebx
 006F310E    mov         ecx,dword ptr [eax]
 006F3110    call        dword ptr [ecx+38];TStringList.Add
 006F3113    mov         edx,6F3150;'pitch'
 006F3118    mov         eax,ebx
 006F311A    mov         ecx,dword ptr [eax]
 006F311C    call        dword ptr [ecx+38];TStringList.Add
 006F311F    mov         edx,6F3168;'roll'
 006F3124    mov         eax,ebx
 006F3126    mov         ecx,dword ptr [eax]
 006F3128    call        dword ptr [ecx+38];TStringList.Add
 006F312B    mov         eax,ebx
 006F312D    pop         ebx
 006F312E    ret
end;*}

//006F3174
{*function sub_006F3174(?:?):?;
begin
 006F3174    push        ebp
 006F3175    mov         ebp,esp
 006F3177    push        ecx
 006F3178    push        ebx
 006F3179    mov         dword ptr [ebp-4],eax
 006F317C    mov         eax,dword ptr [ebp-4]
 006F317F    call        @UStrAddRef
 006F3184    xor         eax,eax
 006F3186    push        ebp
 006F3187    push        6F31ED
 006F318C    push        dword ptr fs:[eax]
 006F318F    mov         dword ptr fs:[eax],esp
 006F3192    lea         eax,[ebp-4]
 006F3195    mov         edx,6F3208;'VR920'
 006F319A    call        004F9BD0
 006F319F    test        al,al
>006F31A1    jne         006F31B8
 006F31A3    lea         eax,[ebp-4]
 006F31A6    mov         edx,6F3220;'iWear'
 006F31AB    call        004F9BD0
 006F31B0    test        al,al
>006F31B2    jne         006F31B8
 006F31B4    xor         ebx,ebx
>006F31B6    jmp         006F31D7
 006F31B8    lea         eax,[ebp-4]
 006F31BB    call        004F9D00
 006F31C0    lea         eax,[ebp-4]
 006F31C3    mov         edx,6F3238;'.'
 006F31C8    call        004F9BD0
 006F31CD    test        al,al
>006F31CF    jne         006F31D5
 006F31D1    xor         ebx,ebx
>006F31D3    jmp         006F31D7
 006F31D5    mov         bl,1
 006F31D7    xor         eax,eax
 006F31D9    pop         edx
 006F31DA    pop         ecx
 006F31DB    pop         ecx
 006F31DC    mov         dword ptr fs:[eax],edx
 006F31DF    push        6F31F4
 006F31E4    lea         eax,[ebp-4]
 006F31E7    call        @UStrClr
 006F31EC    ret
>006F31ED    jmp         @HandleFinally
>006F31F2    jmp         006F31E4
 006F31F4    mov         eax,ebx
 006F31F6    pop         ebx
 006F31F7    pop         ecx
 006F31F8    pop         ebp
 006F31F9    ret
end;*}

Initialization
//00782CD8
{*
 00782CD8    sub         dword ptr ds:[8228DC],1
>00782CDF    jae         00782CF7
 00782CE1    mov         dl,1
 00782CE3    mov         eax,[0067D4A4];THashTable
 00782CE8    call        THashTable.Create;THashTable.Create
 00782CED    mov         [008228D8],eax;gvar_008228D8:THashTable
 00782CF2    call        006F2C3C
 00782CF7    ret
*}
Finalization
end.