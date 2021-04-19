//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit JclUnitVersioning;

interface

uses
  SysUtils, Classes, Contnrs, UxTheme, CommCtrl;

type
  TUnitVersionInfo = TUnitVersionInfo = record//size=18
f0:string;//f0
f4:string;//f4
f8:string;//f8
fC:string;//fC
f10:string;//f10
end;
RCSfile:string;//f0
Revision:string;//f4
Date:string;//f8
LogPath:string;//fC
Extra:string;//f10
Data:Pointer;//f14
end;;
  TUnitVersion = class(TObject)
  published
    //procedure LogPath(?:?);//0053E79C
    //procedure Extra(?:?);//0053E784
    procedure DateTime;//0053E7B4
    function Data:Pointer;//0053E77C
    //procedure RCSfile(?:?);//0053E53C
    constructor Create(AInfo:PUnitVersionInfo);//0053E500
    //procedure Date(?:?);//0053E704
    //procedure Revision(?:?);//0053E690
  public
    ..............FInfo:PUnitVersionInfo;//f4
  end;
  TUnitVersioningModule = class(TObject)
  published
    function IndexOf(RCSfile:string; LogPath:string):Integer;//0053EC6C
    function FindUnit(RCSfile:string; LogPath:string):TUnitVersion;//0053EC4C
    constructor Create(AInstance:Cardinal);//0053EB60
    destructor Destroy();//0053EBAC
  public
    FInstance:Cardinal;//f4
    FItems:TObjectList;//f8
  end;
  TCustomUnitVersioningProvider = class(TObject)
  published
    procedure ReleaseModuleUnitVersioningInfo(Instance:Cardinal);//0053ED78
    procedure LoadModuleUnitVersioningInfo(Instance:Cardinal);//0053ED74
    constructor sub_0053ED3C;//0053ED3C
  public
    constructor v0; virtual;//v0//0053ED3C
    procedure LoadModuleUnitVersioningInfo(Instance:Cardinal); virtual;//v4//0053ED74
    procedure ReleaseModuleUnitVersioningInfo(Instance:Cardinal); virtual;//v8//0053ED78
  end;
  TUnitVersioning = class(TObject)
  published
    procedure LoadModuleUnitVersioningInfo(Instance:Cardinal);//0053F0E8
    procedure IndexOf(RCSfile:string; LogPath:string);//0053F024
    function FindUnit(RCSfile:string; LogPath:string):TUnitVersion;//0053EFE0
    constructor Create;//0053ED7C
    destructor Destroy();//0053EDD0
    procedure RegisterProvider(AProviderClass:TUnitVersioningProviderClass);//0053F094
  public
    FModules:TObjectList;//f4
    FProviders:TObjectList;//f8
    destructor Destroy(); virtual;//0053EDD0
    //procedure v0(?:?; ?:?); virtual;//v0//0053EE08
    //procedure v4(?:?); virtual;//v4//0053EE88
  end;
    //function sub_0053E4B4(?:UString; ?:?):?;//0053E4B4
    //function sub_0053E4F8:?;//0053E4F8
    //function sub_0053EBDC(?:?):?;//0053EBDC
    //function sub_0053EBE4(?:TUnitVersioningModule; ?:Integer):?;//0053EBE4
    //procedure sub_0053EBF8(?:TUnitVersioningModule; ?:?);//0053EBF8
    //function sub_0053EC18(?:?; ?:?):?;//0053EC18
    //procedure sub_0053EE08(?:?; ?:?);//0053EE08
    //procedure sub_0053EE88(?:?);//0053EE88
    //function sub_0053EF3C(?:TUnitVersioning; ?:?):?;//0053EF3C
    //function sub_0053F118:?;//0053F118
    procedure sub_0053F364;//0053F364
    //procedure sub_0053F424(?:?; ?:?);//0053F424
    //procedure sub_0053F440(?:?);//0053F440

implementation

//0053E4B4
{*function sub_0053E4B4(?:UString; ?:?):?;
begin
 0053E4B4    push        ebx
 0053E4B5    push        esi
 0053E4B6    push        edi
 0053E4B7    mov         edi,edx
 0053E4B9    xor         edx,edx
 0053E4BB    mov         ecx,eax
 0053E4BD    test        ecx,ecx
>0053E4BF    je          0053E4C6
 0053E4C1    sub         ecx,4
 0053E4C4    mov         ecx,dword ptr [ecx]
 0053E4C6    mov         esi,edi
 0053E4C8    test        esi,esi
>0053E4CA    je          0053E4D1
 0053E4CC    sub         esi,4
 0053E4CF    mov         esi,dword ptr [esi]
 0053E4D1    cmp         esi,ecx
>0053E4D3    jl          0053E4F2
 0053E4D5    mov         esi,ecx
 0053E4D7    test        esi,esi
>0053E4D9    jle         0053E4F0
 0053E4DB    mov         ecx,1
 0053E4E0    movzx       ebx,word ptr [edi+ecx*2-2]
 0053E4E5    cmp         bx,word ptr [eax+ecx*2-2]
>0053E4EA    jne         0053E4F2
 0053E4EC    inc         ecx
 0053E4ED    dec         esi
>0053E4EE    jne         0053E4E0
 0053E4F0    mov         dl,1
 0053E4F2    mov         eax,edx
 0053E4F4    pop         edi
 0053E4F5    pop         esi
 0053E4F6    pop         ebx
 0053E4F7    ret
end;*}

//0053E4F8
{*function sub_0053E4F8:?;
begin
 0053E4F8    call        CompareText
 0053E4FD    ret
end;*}

//0053E500
constructor TUnitVersion.Create(AInfo:PUnitVersionInfo);
begin
{*
 0053E500    push        ebx
 0053E501    push        esi
 0053E502    push        edi
 0053E503    test        dl,dl
>0053E505    je          0053E50F
 0053E507    add         esp,0FFFFFFF0
 0053E50A    call        @ClassCreate
 0053E50F    mov         esi,ecx
 0053E511    mov         ebx,edx
 0053E513    mov         edi,eax
 0053E515    xor         edx,edx
 0053E517    mov         eax,edi
 0053E519    call        TObject.Create
 0053E51E    mov         dword ptr [edi+4],esi;TUnitVersion................FInfo:PUnitVersionInfo
 0053E521    mov         eax,edi
 0053E523    test        bl,bl
>0053E525    je          0053E536
 0053E527    call        @AfterConstruction
 0053E52C    pop         dword ptr fs:[0]
 0053E533    add         esp,0C
 0053E536    mov         eax,edi
 0053E538    pop         edi
 0053E539    pop         esi
 0053E53A    pop         ebx
 0053E53B    ret
*}
end;

//0053E53C
{*procedure TUnitVersion.RCSfile(?:?);
begin
 0053E53C    push        ebx
 0053E53D    push        esi
 0053E53E    push        ecx
 0053E53F    mov         ebx,edx
 0053E541    mov         esi,eax
 0053E543    mov         edx,ebx
 0053E545    mov         eax,dword ptr [esi+4];TUnitVersion.................FInfo:PUnitVersionInfo
 0053E548    mov         eax,dword ptr [eax]
 0053E54A    call        Trim
 0053E54F    mov         edx,dword ptr [ebx]
 0053E551    mov         eax,53E64C;'$RCSfile: '
 0053E556    call        0053E4B4
 0053E55B    test        al,al
>0053E55D    je          0053E5C7
 0053E55F    mov         eax,ebx
 0053E561    mov         ecx,0A
 0053E566    mov         edx,1
 0053E56B    call        @UStrDelete
 0053E570    mov         eax,dword ptr [ebx]
 0053E572    mov         dword ptr [esp],eax
 0053E575    mov         eax,dword ptr [esp]
 0053E578    test        eax,eax
>0053E57A    je          0053E581
 0053E57C    sub         eax,4
 0053E57F    mov         eax,dword ptr [eax]
 0053E581    mov         edx,eax
 0053E583    dec         edx
 0053E584    mov         eax,ebx
 0053E586    mov         ecx,2
 0053E58B    call        @UStrDelete
 0053E590    mov         eax,dword ptr [ebx]
 0053E592    mov         dword ptr [esp],eax
 0053E595    mov         eax,dword ptr [esp]
 0053E598    test        eax,eax
>0053E59A    je          0053E5A1
 0053E59C    sub         eax,4
 0053E59F    mov         eax,dword ptr [eax]
 0053E5A1    mov         esi,eax
 0053E5A3    cmp         esi,1
>0053E5A6    jl          0053E5C7
 0053E5A8    mov         eax,dword ptr [ebx]
 0053E5AA    cmp         word ptr [eax+esi*2-2],2C
>0053E5B0    jne         0053E5C2
 0053E5B2    mov         eax,ebx
 0053E5B4    mov         ecx,7FFFFFFF
 0053E5B9    mov         edx,esi
 0053E5BB    call        @UStrDelete
>0053E5C0    jmp         0053E5C7
 0053E5C2    dec         esi
 0053E5C3    test        esi,esi
>0053E5C5    jne         0053E5A8
 0053E5C7    mov         edx,dword ptr [ebx]
 0053E5C9    mov         eax,53E670;'$URL: '
 0053E5CE    call        0053E4B4
 0053E5D3    test        al,al
>0053E5D5    je          0053E63A
 0053E5D7    mov         eax,ebx
 0053E5D9    mov         ecx,6
 0053E5DE    mov         edx,1
 0053E5E3    call        @UStrDelete
 0053E5E8    mov         eax,dword ptr [ebx]
 0053E5EA    mov         dword ptr [esp],eax
 0053E5ED    mov         eax,dword ptr [esp]
 0053E5F0    test        eax,eax
>0053E5F2    je          0053E5F9
 0053E5F4    sub         eax,4
 0053E5F7    mov         eax,dword ptr [eax]
 0053E5F9    mov         edx,eax
 0053E5FB    dec         edx
 0053E5FC    mov         eax,ebx
 0053E5FE    mov         ecx,2
 0053E603    call        @UStrDelete
 0053E608    mov         edx,dword ptr [ebx]
 0053E60A    mov         eax,53E68C;'/'
 0053E60F    call        Pos
 0053E614    mov         esi,eax
 0053E616    test        esi,esi
>0053E618    jle         0053E63A
 0053E61A    mov         eax,ebx
 0053E61C    mov         ecx,esi
 0053E61E    mov         edx,1
 0053E623    call        @UStrDelete
 0053E628    mov         edx,dword ptr [ebx]
 0053E62A    mov         eax,53E68C;'/'
 0053E62F    call        Pos
 0053E634    mov         esi,eax
 0053E636    test        esi,esi
>0053E638    jg          0053E61A
 0053E63A    pop         edx
 0053E63B    pop         esi
 0053E63C    pop         ebx
 0053E63D    ret
end;*}

//0053E690
{*procedure TUnitVersion.Revision(?:?);
begin
 0053E690    push        ebx
 0053E691    push        esi
 0053E692    push        ecx
 0053E693    mov         ebx,edx
 0053E695    mov         esi,eax
 0053E697    mov         edx,ebx
 0053E699    mov         eax,dword ptr [esi+4];TUnitVersion..................FInfo:PUnitVersionInfo
 0053E69C    mov         eax,dword ptr [eax+4]
 0053E69F    call        Trim
 0053E6A4    mov         edx,dword ptr [ebx]
 0053E6A6    mov         eax,53E6EC;'$Revision: '
 0053E6AB    call        0053E4B4
 0053E6B0    test        al,al
>0053E6B2    je          0053E6DA
 0053E6B4    mov         eax,dword ptr [ebx]
 0053E6B6    mov         dword ptr [esp],eax
 0053E6B9    mov         esi,dword ptr [esp]
 0053E6BC    test        esi,esi
>0053E6BE    je          0053E6C5
 0053E6C0    sub         esi,4
 0053E6C3    mov         esi,dword ptr [esi]
 0053E6C5    push        ebx
 0053E6C6    mov         ecx,esi
 0053E6C8    sub         ecx,0B
 0053E6CB    sub         ecx,2
 0053E6CE    mov         eax,dword ptr [ebx]
 0053E6D0    mov         edx,0C
 0053E6D5    call        @UStrCopy
 0053E6DA    pop         edx
 0053E6DB    pop         esi
 0053E6DC    pop         ebx
 0053E6DD    ret
end;*}

//0053E704
{*procedure TUnitVersion.Date(?:?);
begin
 0053E704    push        ebx
 0053E705    push        esi
 0053E706    push        ecx
 0053E707    mov         ebx,edx
 0053E709    mov         esi,eax
 0053E70B    mov         edx,ebx
 0053E70D    mov         eax,dword ptr [esi+4];TUnitVersion...................FInfo:PUnitVersionInfo
 0053E710    mov         eax,dword ptr [eax+8]
 0053E713    call        Trim
 0053E718    mov         edx,dword ptr [ebx]
 0053E71A    mov         eax,53E76C;'$Date: '
 0053E71F    call        0053E4B4
 0053E724    test        al,al
>0053E726    je          0053E759
 0053E728    mov         eax,ebx
 0053E72A    mov         ecx,7
 0053E72F    mov         edx,1
 0053E734    call        @UStrDelete
 0053E739    mov         eax,dword ptr [ebx]
 0053E73B    mov         dword ptr [esp],eax
 0053E73E    mov         eax,dword ptr [esp]
 0053E741    test        eax,eax
>0053E743    je          0053E74A
 0053E745    sub         eax,4
 0053E748    mov         eax,dword ptr [eax]
 0053E74A    mov         edx,eax
 0053E74C    dec         edx
 0053E74D    mov         eax,ebx
 0053E74F    mov         ecx,2
 0053E754    call        @UStrDelete
 0053E759    pop         edx
 0053E75A    pop         esi
 0053E75B    pop         ebx
 0053E75C    ret
end;*}

//0053E77C
function TUnitVersion.Data:Pointer;
begin
{*
 0053E77C    mov         eax,dword ptr [eax+4];TUnitVersion....................FInfo:PUnitVersionInfo
 0053E77F    mov         eax,dword ptr [eax+14]
 0053E782    ret
*}
end;

//0053E784
{*procedure TUnitVersion.Extra(?:?);
begin
 0053E784    push        ebx
 0053E785    push        esi
 0053E786    mov         esi,edx
 0053E788    mov         ebx,eax
 0053E78A    mov         edx,esi
 0053E78C    mov         eax,dword ptr [ebx+4];TUnitVersion.....................FInfo:PUnitVersionInfo
 0053E78F    mov         eax,dword ptr [eax+10]
 0053E792    call        Trim
 0053E797    pop         esi
 0053E798    pop         ebx
 0053E799    ret
end;*}

//0053E79C
{*procedure TUnitVersion.LogPath(?:?);
begin
 0053E79C    push        ebx
 0053E79D    push        esi
 0053E79E    mov         esi,edx
 0053E7A0    mov         ebx,eax
 0053E7A2    mov         edx,esi
 0053E7A4    mov         eax,dword ptr [ebx+4];TUnitVersion......................FInfo:PUnitVersionInfo
 0053E7A7    mov         eax,dword ptr [eax+0C]
 0053E7AA    call        Trim
 0053E7AF    pop         esi
 0053E7B0    pop         ebx
 0053E7B1    ret
end;*}

//0053E7B4
procedure TUnitVersion.DateTime;
begin
{*
 0053E7B4    push        ebp
 0053E7B5    mov         ebp,esp
 0053E7B7    mov         ecx,0D
 0053E7BC    push        0
 0053E7BE    push        0
 0053E7C0    dec         ecx
>0053E7C1    jne         0053E7BC
 0053E7C3    push        ebx
 0053E7C4    push        esi
 0053E7C5    mov         ebx,eax
 0053E7C7    xor         eax,eax
 0053E7C9    push        ebp
 0053E7CA    push        53EAFF
 0053E7CF    push        dword ptr fs:[eax]
 0053E7D2    mov         dword ptr fs:[eax],esp
 0053E7D5    xor         eax,eax
 0053E7D7    mov         dword ptr [ebp-10],eax
 0053E7DA    mov         dword ptr [ebp-0C],eax
 0053E7DD    lea         edx,[ebp-4]
 0053E7E0    mov         eax,ebx
 0053E7E2    call        TUnitVersion.Date
 0053E7E7    mov         edx,dword ptr [ebp-4]
 0053E7EA    mov         eax,53EB1C;'/'
 0053E7EF    call        Pos
 0053E7F4    mov         ebx,eax
 0053E7F6    test        ebx,ebx
>0053E7F8    jne         0053E809
 0053E7FA    mov         edx,dword ptr [ebp-4]
 0053E7FD    mov         eax,53EB2C;'-'
 0053E802    call        Pos
 0053E807    mov         ebx,eax
 0053E809    test        ebx,ebx
>0053E80B    je          0053E8FE
 0053E811    cmp         ebx,5
>0053E814    jne         0053E88A
 0053E816    lea         eax,[ebp-24]
 0053E819    push        eax
 0053E81A    mov         ecx,4
 0053E81F    mov         edx,1
 0053E824    mov         eax,dword ptr [ebp-4]
 0053E827    call        @UStrCopy
 0053E82C    mov         eax,dword ptr [ebp-24]
 0053E82F    lea         edx,[ebp-14]
 0053E832    call        @ValLong
 0053E837    mov         word ptr [ebp-16],ax
 0053E83B    lea         eax,[ebp-28]
 0053E83E    push        eax
 0053E83F    mov         ecx,2
 0053E844    mov         edx,6
 0053E849    mov         eax,dword ptr [ebp-4]
 0053E84C    call        @UStrCopy
 0053E851    mov         eax,dword ptr [ebp-28]
 0053E854    lea         edx,[ebp-14]
 0053E857    call        @ValLong
 0053E85C    mov         word ptr [ebp-18],ax
 0053E860    lea         eax,[ebp-2C]
 0053E863    push        eax
 0053E864    mov         ecx,2
 0053E869    mov         edx,9
 0053E86E    mov         eax,dword ptr [ebp-4]
 0053E871    call        @UStrCopy
 0053E876    mov         eax,dword ptr [ebp-2C]
 0053E879    lea         edx,[ebp-14]
 0053E87C    call        @ValLong
 0053E881    mov         word ptr [ebp-1A],ax
>0053E885    jmp         0053E984
 0053E88A    lea         eax,[ebp-30]
 0053E88D    push        eax
 0053E88E    mov         ecx,2
 0053E893    mov         edx,1
 0053E898    mov         eax,dword ptr [ebp-4]
 0053E89B    call        @UStrCopy
 0053E8A0    mov         eax,dword ptr [ebp-30]
 0053E8A3    lea         edx,[ebp-14]
 0053E8A6    call        @ValLong
 0053E8AB    mov         word ptr [ebp-18],ax
 0053E8AF    lea         eax,[ebp-34]
 0053E8B2    push        eax
 0053E8B3    mov         ecx,2
 0053E8B8    mov         edx,4
 0053E8BD    mov         eax,dword ptr [ebp-4]
 0053E8C0    call        @UStrCopy
 0053E8C5    mov         eax,dword ptr [ebp-34]
 0053E8C8    lea         edx,[ebp-14]
 0053E8CB    call        @ValLong
 0053E8D0    mov         word ptr [ebp-1A],ax
 0053E8D4    lea         eax,[ebp-38]
 0053E8D7    push        eax
 0053E8D8    mov         ecx,4
 0053E8DD    mov         edx,7
 0053E8E2    mov         eax,dword ptr [ebp-4]
 0053E8E5    call        @UStrCopy
 0053E8EA    mov         eax,dword ptr [ebp-38]
 0053E8ED    lea         edx,[ebp-14]
 0053E8F0    call        @ValLong
 0053E8F5    mov         word ptr [ebp-16],ax
>0053E8F9    jmp         0053E984
 0053E8FE    mov         edx,dword ptr [ebp-4]
 0053E901    mov         eax,53EB3C;'.'
 0053E906    call        Pos
 0053E90B    mov         ebx,eax
 0053E90D    test        ebx,ebx
>0053E90F    je          0053EADC
 0053E915    lea         eax,[ebp-3C]
 0053E918    push        eax
 0053E919    mov         ecx,2
 0053E91E    mov         edx,1
 0053E923    mov         eax,dword ptr [ebp-4]
 0053E926    call        @UStrCopy
 0053E92B    mov         eax,dword ptr [ebp-3C]
 0053E92E    lea         edx,[ebp-14]
 0053E931    call        @ValLong
 0053E936    mov         word ptr [ebp-1A],ax
 0053E93A    lea         eax,[ebp-40]
 0053E93D    push        eax
 0053E93E    mov         ecx,2
 0053E943    mov         edx,4
 0053E948    mov         eax,dword ptr [ebp-4]
 0053E94B    call        @UStrCopy
 0053E950    mov         eax,dword ptr [ebp-40]
 0053E953    lea         edx,[ebp-14]
 0053E956    call        @ValLong
 0053E95B    mov         word ptr [ebp-18],ax
 0053E95F    lea         eax,[ebp-44]
 0053E962    push        eax
 0053E963    mov         ecx,4
 0053E968    mov         edx,7
 0053E96D    mov         eax,dword ptr [ebp-4]
 0053E970    call        @UStrCopy
 0053E975    mov         eax,dword ptr [ebp-44]
 0053E978    lea         edx,[ebp-14]
 0053E97B    call        @ValLong
 0053E980    mov         word ptr [ebp-16],ax
 0053E984    mov         edx,dword ptr [ebp-4]
 0053E987    mov         eax,53EB4C;' '
 0053E98C    call        Pos
 0053E991    mov         ebx,eax
 0053E993    lea         eax,[ebp-4C]
 0053E996    push        eax
 0053E997    lea         edx,[ebx+1]
 0053E99A    mov         ecx,7FFFFFFF
 0053E99F    mov         eax,dword ptr [ebp-4]
 0053E9A2    call        @UStrCopy
 0053E9A7    mov         eax,dword ptr [ebp-4C]
 0053E9AA    lea         edx,[ebp-48]
 0053E9AD    call        Trim
 0053E9B2    mov         edx,dword ptr [ebp-48]
 0053E9B5    lea         eax,[ebp-4]
 0053E9B8    call        @UStrLAsg
 0053E9BD    mov         edx,dword ptr [ebp-4]
 0053E9C0    mov         eax,53EB5C;':'
 0053E9C5    call        Pos
 0053E9CA    mov         ebx,eax
 0053E9CC    test        ebx,ebx
>0053E9CE    je          0053E9D6
 0053E9D0    mov         si,3A
>0053E9D4    jmp         0053E9E9
 0053E9D6    mov         edx,dword ptr [ebp-4]
 0053E9D9    mov         eax,53EB1C;'/'
 0053E9DE    call        Pos
 0053E9E3    mov         ebx,eax
 0053E9E5    mov         si,2F
 0053E9E9    lea         eax,[ebp-50]
 0053E9EC    push        eax
 0053E9ED    mov         ecx,ebx
 0053E9EF    dec         ecx
 0053E9F0    mov         edx,1
 0053E9F5    mov         eax,dword ptr [ebp-4]
 0053E9F8    call        @UStrCopy
 0053E9FD    mov         eax,dword ptr [ebp-50]
 0053EA00    lea         edx,[ebp-14]
 0053EA03    call        @ValLong
 0053EA08    mov         word ptr [ebp-1C],ax
 0053EA0C    lea         eax,[ebp-4]
 0053EA0F    mov         ecx,ebx
 0053EA11    mov         edx,1
 0053EA16    call        @UStrDelete
 0053EA1B    lea         eax,[ebp-54]
 0053EA1E    mov         edx,esi
 0053EA20    call        @UStrFromWChar
 0053EA25    mov         eax,dword ptr [ebp-54]
 0053EA28    mov         edx,dword ptr [ebp-4]
 0053EA2B    call        Pos
 0053EA30    mov         ebx,eax
 0053EA32    lea         eax,[ebp-58]
 0053EA35    push        eax
 0053EA36    mov         ecx,ebx
 0053EA38    dec         ecx
 0053EA39    mov         edx,1
 0053EA3E    mov         eax,dword ptr [ebp-4]
 0053EA41    call        @UStrCopy
 0053EA46    mov         eax,dword ptr [ebp-58]
 0053EA49    lea         edx,[ebp-14]
 0053EA4C    call        @ValLong
 0053EA51    mov         word ptr [ebp-1E],ax
 0053EA55    lea         eax,[ebp-4]
 0053EA58    mov         ecx,ebx
 0053EA5A    mov         edx,1
 0053EA5F    call        @UStrDelete
 0053EA64    lea         eax,[ebp-5C]
 0053EA67    mov         edx,esi
 0053EA69    call        @UStrFromWChar
 0053EA6E    mov         eax,dword ptr [ebp-5C]
 0053EA71    mov         edx,dword ptr [ebp-4]
 0053EA74    call        Pos
 0053EA79    mov         ebx,eax
 0053EA7B    test        ebx,ebx
>0053EA7D    jne         0053EA8E
 0053EA7F    mov         eax,dword ptr [ebp-4]
 0053EA82    test        eax,eax
>0053EA84    je          0053EA8B
 0053EA86    sub         eax,4
 0053EA89    mov         eax,dword ptr [eax]
 0053EA8B    lea         ebx,[eax+1]
 0053EA8E    lea         eax,[ebp-60]
 0053EA91    push        eax
 0053EA92    mov         ecx,ebx
 0053EA94    dec         ecx
 0053EA95    mov         edx,1
 0053EA9A    mov         eax,dword ptr [ebp-4]
 0053EA9D    call        @UStrCopy
 0053EAA2    mov         eax,dword ptr [ebp-60]
 0053EAA5    lea         edx,[ebp-14]
 0053EAA8    call        @ValLong
 0053EAAD    mov         ebx,eax
 0053EAAF    movzx       ecx,word ptr [ebp-1A]
 0053EAB3    movzx       edx,word ptr [ebp-18]
 0053EAB7    movzx       eax,word ptr [ebp-16]
 0053EABB    call        EncodeDate
 0053EAC0    fstp        qword ptr [ebp-68]
 0053EAC3    wait
 0053EAC4    push        0
 0053EAC6    mov         ecx,ebx
 0053EAC8    movzx       edx,word ptr [ebp-1E]
 0053EACC    movzx       eax,word ptr [ebp-1C]
 0053EAD0    call        EncodeTime
 0053EAD5    fadd        qword ptr [ebp-68]
 0053EAD8    fstp        qword ptr [ebp-10]
 0053EADB    wait
 0053EADC    xor         eax,eax
 0053EADE    pop         edx
 0053EADF    pop         ecx
 0053EAE0    pop         ecx
 0053EAE1    mov         dword ptr fs:[eax],edx
 0053EAE4    push        53EB06
 0053EAE9    lea         eax,[ebp-60]
 0053EAEC    mov         edx,10
 0053EAF1    call        @UStrArrayClr
 0053EAF6    lea         eax,[ebp-4]
 0053EAF9    call        @UStrClr
 0053EAFE    ret
>0053EAFF    jmp         @HandleFinally
>0053EB04    jmp         0053EAE9
 0053EB06    fld         qword ptr [ebp-10]
 0053EB09    pop         esi
 0053EB0A    pop         ebx
 0053EB0B    mov         esp,ebp
 0053EB0D    pop         ebp
 0053EB0E    ret
*}
end;

//0053EB60
constructor TUnitVersioningModule.Create(AInstance:Cardinal);
begin
{*
 0053EB60    push        ebx
 0053EB61    push        esi
 0053EB62    push        edi
 0053EB63    test        dl,dl
>0053EB65    je          0053EB6F
 0053EB67    add         esp,0FFFFFFF0
 0053EB6A    call        @ClassCreate
 0053EB6F    mov         esi,ecx
 0053EB71    mov         ebx,edx
 0053EB73    mov         edi,eax
 0053EB75    xor         edx,edx
 0053EB77    mov         eax,edi
 0053EB79    call        TObject.Create
 0053EB7E    mov         dword ptr [edi+4],esi;TUnitVersioningModule.FInstance:Cardinal
 0053EB81    mov         dl,1
 0053EB83    mov         eax,[00471630];TObjectList
 0053EB88    call        TObjectList.Create;TObjectList.Create
 0053EB8D    mov         dword ptr [edi+8],eax;TUnitVersioningModule.FItems:TObjectList
 0053EB90    mov         eax,edi
 0053EB92    test        bl,bl
>0053EB94    je          0053EBA5
 0053EB96    call        @AfterConstruction
 0053EB9B    pop         dword ptr fs:[0]
 0053EBA2    add         esp,0C
 0053EBA5    mov         eax,edi
 0053EBA7    pop         edi
 0053EBA8    pop         esi
 0053EBA9    pop         ebx
 0053EBAA    ret
*}
end;

//0053EBAC
destructor TUnitVersioningModule.Destroy();
begin
{*
 0053EBAC    push        ebx
 0053EBAD    push        esi
 0053EBAE    call        @BeforeDestruction
 0053EBB3    mov         ebx,edx
 0053EBB5    mov         esi,eax
 0053EBB7    mov         eax,dword ptr [esi+8];TUnitVersioningModule.FItems:TObjectList
 0053EBBA    call        TObject.Free
 0053EBBF    mov         edx,ebx
 0053EBC1    and         dl,0FC
 0053EBC4    mov         eax,esi
 0053EBC6    call        TObject.Destroy
 0053EBCB    test        bl,bl
>0053EBCD    jle         0053EBD6
 0053EBCF    mov         eax,esi
 0053EBD1    call        @ClassDestroy
 0053EBD6    pop         esi
 0053EBD7    pop         ebx
 0053EBD8    ret
*}
end;

//0053EBDC
{*function sub_0053EBDC(?:?):?;
begin
 0053EBDC    mov         eax,dword ptr [eax+8]
 0053EBDF    mov         eax,dword ptr [eax+8]
 0053EBE2    ret
end;*}

//0053EBE4
{*function sub_0053EBE4(?:TUnitVersioningModule; ?:Integer):?;
begin
 0053EBE4    push        ebx
 0053EBE5    push        esi
 0053EBE6    mov         esi,edx
 0053EBE8    mov         ebx,eax
 0053EBEA    mov         edx,esi
 0053EBEC    mov         eax,dword ptr [ebx+8]
 0053EBEF    call        TList.Get
 0053EBF4    pop         esi
 0053EBF5    pop         ebx
 0053EBF6    ret
end;*}

//0053EBF8
{*procedure sub_0053EBF8(?:TUnitVersioningModule; ?:?);
begin
 0053EBF8    push        ebx
 0053EBF9    mov         ebx,eax
 0053EBFB    mov         ecx,edx
 0053EBFD    mov         eax,[0053D978];TUnitVersion
 0053EC02    mov         dl,1
 0053EC04    call        TUnitVersion.Create;TUnitVersion.Create
 0053EC09    mov         edx,eax
 0053EC0B    mov         eax,dword ptr [ebx+8]
 0053EC0E    call        TList.Add
 0053EC13    pop         ebx
 0053EC14    ret
end;*}

//0053EC18
{*function sub_0053EC18(?:?; ?:?):?;
begin
 0053EC18    push        ebx
 0053EC19    push        esi
 0053EC1A    push        edi
 0053EC1B    push        ebp
 0053EC1C    mov         ebp,edx
 0053EC1E    mov         edi,eax
 0053EC20    mov         eax,dword ptr [edi+8]
 0053EC23    mov         ebx,dword ptr [eax+8]
 0053EC26    dec         ebx
 0053EC27    test        ebx,ebx
>0053EC29    jl          0053EC40
 0053EC2B    inc         ebx
 0053EC2C    xor         esi,esi
 0053EC2E    mov         edx,esi
 0053EC30    mov         eax,edi
 0053EC32    call        0053EBE4
 0053EC37    cmp         ebp,dword ptr [eax+4]
>0053EC3A    je          0053EC43
 0053EC3C    inc         esi
 0053EC3D    dec         ebx
>0053EC3E    jne         0053EC2E
 0053EC40    or          esi,0FFFFFFFF
 0053EC43    mov         eax,esi
 0053EC45    pop         ebp
 0053EC46    pop         edi
 0053EC47    pop         esi
 0053EC48    pop         ebx
 0053EC49    ret
end;*}

//0053EC4C
function TUnitVersioningModule.FindUnit(RCSfile:string; LogPath:string):TUnitVersion;
begin
{*
 0053EC4C    push        ebx
 0053EC4D    mov         ebx,eax
 0053EC4F    mov         eax,ebx
 0053EC51    call        TUnitVersioningModule.IndexOf
 0053EC56    cmp         eax,0FFFFFFFF
>0053EC59    je          0053EC66
 0053EC5B    mov         edx,eax
 0053EC5D    mov         eax,ebx
 0053EC5F    call        0053EBE4
 0053EC64    pop         ebx
 0053EC65    ret
 0053EC66    xor         eax,eax
 0053EC68    pop         ebx
 0053EC69    ret
*}
end;

//0053EC6C
function TUnitVersioningModule.IndexOf(RCSfile:string; LogPath:string):Integer;
begin
{*
 0053EC6C    push        ebp
 0053EC6D    mov         ebp,esp
 0053EC6F    push        0
 0053EC71    push        0
 0053EC73    push        0
 0053EC75    push        0
 0053EC77    push        0
 0053EC79    push        ebx
 0053EC7A    push        esi
 0053EC7B    push        edi
 0053EC7C    mov         dword ptr [ebp-8],ecx
 0053EC7F    mov         dword ptr [ebp-4],edx
 0053EC82    mov         edi,eax
 0053EC84    xor         eax,eax
 0053EC86    push        ebp
 0053EC87    push        53ED1C
 0053EC8C    push        dword ptr fs:[eax]
 0053EC8F    mov         dword ptr fs:[eax],esp
 0053EC92    mov         eax,dword ptr [edi+8];TUnitVersioningModule.FItems:TObjectList
 0053EC95    mov         esi,dword ptr [eax+8];TObjectList.FCount:Integer
 0053EC98    dec         esi
 0053EC99    test        esi,esi
>0053EC9B    jl          0053ECFE
 0053EC9D    inc         esi
 0053EC9E    xor         ebx,ebx
 0053ECA0    mov         edx,ebx
 0053ECA2    mov         eax,edi
 0053ECA4    call        0053EBE4
 0053ECA9    lea         edx,[ebp-0C]
 0053ECAC    call        TUnitVersion.RCSfile
 0053ECB1    mov         eax,dword ptr [ebp-0C]
 0053ECB4    mov         edx,dword ptr [ebp-4]
 0053ECB7    call        0053E4F8
 0053ECBC    test        eax,eax
>0053ECBE    jne         0053ECFA
 0053ECC0    mov         eax,dword ptr [ebp-8]
 0053ECC3    mov         edx,53ED38;'*'
 0053ECC8    call        @UStrEqual
>0053ECCD    je          0053ED01
 0053ECCF    mov         edx,ebx
 0053ECD1    mov         eax,edi
 0053ECD3    call        0053EBE4
 0053ECD8    lea         edx,[ebp-14]
 0053ECDB    call        TUnitVersion.LogPath
 0053ECE0    mov         eax,dword ptr [ebp-14]
 0053ECE3    lea         edx,[ebp-10]
 0053ECE6    call        Trim
 0053ECEB    mov         edx,dword ptr [ebp-10]
 0053ECEE    mov         eax,dword ptr [ebp-8]
 0053ECF1    call        0053E4F8
 0053ECF6    test        eax,eax
>0053ECF8    je          0053ED01
 0053ECFA    inc         ebx
 0053ECFB    dec         esi
>0053ECFC    jne         0053ECA0
 0053ECFE    or          ebx,0FFFFFFFF
 0053ED01    xor         eax,eax
 0053ED03    pop         edx
 0053ED04    pop         ecx
 0053ED05    pop         ecx
 0053ED06    mov         dword ptr fs:[eax],edx
 0053ED09    push        53ED23
 0053ED0E    lea         eax,[ebp-14]
 0053ED11    mov         edx,3
 0053ED16    call        @UStrArrayClr
 0053ED1B    ret
>0053ED1C    jmp         @HandleFinally
>0053ED21    jmp         0053ED0E
 0053ED23    mov         eax,ebx
 0053ED25    pop         edi
 0053ED26    pop         esi
 0053ED27    pop         ebx
 0053ED28    mov         esp,ebp
 0053ED2A    pop         ebp
 0053ED2B    ret
*}
end;

//0053ED3C
constructor sub_0053ED3C;
begin
{*
 0053ED3C    push        ebx
 0053ED3D    push        esi
 0053ED3E    test        dl,dl
>0053ED40    je          0053ED4A
 0053ED42    add         esp,0FFFFFFF0
 0053ED45    call        @ClassCreate
 0053ED4A    mov         ebx,edx
 0053ED4C    mov         esi,eax
 0053ED4E    xor         edx,edx
 0053ED50    mov         eax,esi
 0053ED52    call        TObject.Create
 0053ED57    mov         eax,esi
 0053ED59    test        bl,bl
>0053ED5B    je          0053ED6C
 0053ED5D    call        @AfterConstruction
 0053ED62    pop         dword ptr fs:[0]
 0053ED69    add         esp,0C
 0053ED6C    mov         eax,esi
 0053ED6E    pop         esi
 0053ED6F    pop         ebx
 0053ED70    ret
*}
end;

//0053ED74
procedure TCustomUnitVersioningProvider.LoadModuleUnitVersioningInfo(Instance:Cardinal);
begin
{*
 0053ED74    ret
*}
end;

//0053ED78
procedure TCustomUnitVersioningProvider.ReleaseModuleUnitVersioningInfo(Instance:Cardinal);
begin
{*
 0053ED78    ret
*}
end;

//0053ED7C
constructor TUnitVersioning.Create;
begin
{*
 0053ED7C    push        ebx
 0053ED7D    push        esi
 0053ED7E    test        dl,dl
>0053ED80    je          0053ED8A
 0053ED82    add         esp,0FFFFFFF0
 0053ED85    call        @ClassCreate
 0053ED8A    mov         ebx,edx
 0053ED8C    mov         esi,eax
 0053ED8E    xor         edx,edx
 0053ED90    mov         eax,esi
 0053ED92    call        TObject.Create
 0053ED97    mov         dl,1
 0053ED99    mov         eax,[00471630];TObjectList
 0053ED9E    call        TObjectList.Create;TObjectList.Create
 0053EDA3    mov         dword ptr [esi+4],eax;TUnitVersioning.FModules:TObjectList
 0053EDA6    mov         dl,1
 0053EDA8    mov         eax,[00471630];TObjectList
 0053EDAD    call        TObjectList.Create;TObjectList.Create
 0053EDB2    mov         dword ptr [esi+8],eax;TUnitVersioning.FProviders:TObjectList
 0053EDB5    mov         eax,esi
 0053EDB7    test        bl,bl
>0053EDB9    je          0053EDCA
 0053EDBB    call        @AfterConstruction
 0053EDC0    pop         dword ptr fs:[0]
 0053EDC7    add         esp,0C
 0053EDCA    mov         eax,esi
 0053EDCC    pop         esi
 0053EDCD    pop         ebx
 0053EDCE    ret
*}
end;

//0053EDD0
destructor TUnitVersioning.Destroy();
begin
{*
 0053EDD0    push        ebx
 0053EDD1    push        esi
 0053EDD2    call        @BeforeDestruction
 0053EDD7    mov         ebx,edx
 0053EDD9    mov         esi,eax
 0053EDDB    mov         eax,dword ptr [esi+8];TUnitVersioning.FProviders:TObjectList
 0053EDDE    call        TObject.Free
 0053EDE3    mov         eax,dword ptr [esi+4];TUnitVersioning.FModules:TObjectList
 0053EDE6    call        TObject.Free
 0053EDEB    mov         edx,ebx
 0053EDED    and         dl,0FC
 0053EDF0    mov         eax,esi
 0053EDF2    call        TObject.Destroy
 0053EDF7    test        bl,bl
>0053EDF9    jle         0053EE02
 0053EDFB    mov         eax,esi
 0053EDFD    call        @ClassDestroy
 0053EE02    pop         esi
 0053EE03    pop         ebx
 0053EE04    ret
*}
end;

//0053EE08
{*procedure sub_0053EE08(?:?; ?:?);
begin
 0053EE08    push        ebx
 0053EE09    push        esi
 0053EE0A    push        edi
 0053EE0B    push        ebp
 0053EE0C    push        ecx
 0053EE0D    mov         dword ptr [esp],ecx
 0053EE10    mov         ebp,edx
 0053EE12    mov         esi,eax
 0053EE14    mov         eax,dword ptr [esi+4];TUnitVersioning.FModules:TObjectList
 0053EE17    mov         edi,dword ptr [eax+8];TObjectList.FCount:Integer
 0053EE1A    dec         edi
 0053EE1B    test        edi,edi
>0053EE1D    jl          0053EE5B
 0053EE1F    inc         edi
 0053EE20    xor         ebx,ebx
 0053EE22    mov         edx,ebx
 0053EE24    mov         eax,esi
 0053EE26    call        0053EF3C
 0053EE2B    cmp         ebp,dword ptr [eax+4]
>0053EE2E    jne         0053EE57
 0053EE30    mov         edx,ebx
 0053EE32    mov         eax,esi
 0053EE34    call        0053EF3C
 0053EE39    mov         edx,dword ptr [esp]
 0053EE3C    call        0053EC18
 0053EE41    inc         eax
>0053EE42    jne         0053EE7F
 0053EE44    mov         edx,ebx
 0053EE46    mov         eax,esi
 0053EE48    call        0053EF3C
 0053EE4D    mov         edx,dword ptr [esp]
 0053EE50    call        0053EBF8
>0053EE55    jmp         0053EE7F
 0053EE57    inc         ebx
 0053EE58    dec         edi
>0053EE59    jne         0053EE22
 0053EE5B    mov         ecx,ebp
 0053EE5D    mov         dl,1
 0053EE5F    mov         eax,[0053DBE8];TUnitVersioningModule
 0053EE64    call        TUnitVersioningModule.Create;TUnitVersioningModule.Create
 0053EE69    mov         ebx,eax
 0053EE6B    mov         edx,ebx
 0053EE6D    mov         eax,dword ptr [esi+4];TUnitVersioning.FModules:TObjectList
 0053EE70    call        TList.Add
 0053EE75    mov         edx,dword ptr [esp]
 0053EE78    mov         eax,ebx
 0053EE7A    call        0053EBF8
 0053EE7F    pop         edx
 0053EE80    pop         ebp
 0053EE81    pop         edi
 0053EE82    pop         esi
 0053EE83    pop         ebx
 0053EE84    ret
end;*}

//0053EE88
{*procedure sub_0053EE88(?:?);
begin
 0053EE88    push        ebx
 0053EE89    push        esi
 0053EE8A    push        edi
 0053EE8B    push        ebp
 0053EE8C    mov         ebp,edx
 0053EE8E    mov         esi,eax
 0053EE90    mov         eax,dword ptr [esi+4];TUnitVersioning.FModules:TObjectList
 0053EE93    mov         ebx,dword ptr [eax+8];TObjectList.FCount:Integer
 0053EE96    dec         ebx
 0053EE97    cmp         ebx,0
>0053EE9A    jl          0053EEBC
 0053EE9C    mov         edx,ebx
 0053EE9E    mov         eax,esi
 0053EEA0    call        0053EF3C
 0053EEA5    cmp         ebp,dword ptr [eax+4]
>0053EEA8    jne         0053EEB6
 0053EEAA    mov         edx,ebx
 0053EEAC    mov         eax,dword ptr [esi+4];TUnitVersioning.FModules:TObjectList
 0053EEAF    call        TList.Delete
>0053EEB4    jmp         0053EEBC
 0053EEB6    dec         ebx
 0053EEB7    cmp         ebx,0FFFFFFFF
>0053EEBA    jne         0053EE9C
 0053EEBC    mov         eax,dword ptr [esi+8];TUnitVersioning.FProviders:TObjectList
 0053EEBF    mov         edi,dword ptr [eax+8];TObjectList.FCount:Integer
 0053EEC2    dec         edi
 0053EEC3    test        edi,edi
>0053EEC5    jl          0053EEDF
 0053EEC7    inc         edi
 0053EEC8    xor         ebx,ebx
 0053EECA    mov         edx,ebx
 0053EECC    mov         eax,dword ptr [esi+8];TUnitVersioning.FProviders:TObjectList
 0053EECF    call        TList.Get
 0053EED4    mov         edx,ebp
 0053EED6    mov         ecx,dword ptr [eax]
 0053EED8    call        dword ptr [ecx+8]
 0053EEDB    inc         ebx
 0053EEDC    dec         edi
>0053EEDD    jne         0053EECA
 0053EEDF    pop         ebp
 0053EEE0    pop         edi
 0053EEE1    pop         esi
 0053EEE2    pop         ebx
 0053EEE3    ret
end;*}

//0053EF3C
{*function sub_0053EF3C(?:TUnitVersioning; ?:?):?;
begin
 0053EF3C    push        ebx
 0053EF3D    push        esi
 0053EF3E    mov         esi,edx
 0053EF40    mov         ebx,eax
 0053EF42    mov         edx,esi
 0053EF44    mov         eax,dword ptr [ebx+4];TUnitVersioning.FModules:TObjectList
 0053EF47    call        TList.Get
 0053EF4C    pop         esi
 0053EF4D    pop         ebx
 0053EF4E    ret
end;*}

//0053EFE0
function TUnitVersioning.FindUnit(RCSfile:string; LogPath:string):TUnitVersion;
begin
{*
 0053EFE0    push        ebx
 0053EFE1    push        esi
 0053EFE2    push        edi
 0053EFE3    add         esp,0FFFFFFF8
 0053EFE6    mov         dword ptr [esp+4],ecx
 0053EFEA    mov         dword ptr [esp],edx
 0053EFED    mov         edi,eax
 0053EFEF    mov         eax,dword ptr [edi+4];TUnitVersioning.FModules:TObjectList
 0053EFF2    mov         ebx,dword ptr [eax+8];TObjectList.FCount:Integer
 0053EFF5    dec         ebx
 0053EFF6    test        ebx,ebx
>0053EFF8    jl          0053F01A
 0053EFFA    inc         ebx
 0053EFFB    xor         esi,esi
 0053EFFD    mov         edx,esi
 0053EFFF    mov         eax,edi
 0053F001    call        0053EF3C
 0053F006    mov         ecx,dword ptr [esp+4]
 0053F00A    mov         edx,dword ptr [esp]
 0053F00D    call        TUnitVersioningModule.FindUnit
 0053F012    test        eax,eax
>0053F014    jne         0053F01C
 0053F016    inc         esi
 0053F017    dec         ebx
>0053F018    jne         0053EFFD
 0053F01A    xor         eax,eax
 0053F01C    pop         ecx
 0053F01D    pop         edx
 0053F01E    pop         edi
 0053F01F    pop         esi
 0053F020    pop         ebx
 0053F021    ret
*}
end;

//0053F024
procedure TUnitVersioning.IndexOf(RCSfile:string; LogPath:string);
begin
{*
 0053F024    push        ebx
 0053F025    push        esi
 0053F026    push        edi
 0053F027    add         esp,0FFFFFFF0
 0053F02A    mov         dword ptr [esp+4],ecx
 0053F02E    mov         dword ptr [esp],edx
 0053F031    mov         esi,eax
 0053F033    mov         dword ptr [esp+8],0FFFFFFFF
 0053F03B    xor         eax,eax
 0053F03D    mov         dword ptr [esp+0C],eax
 0053F041    mov         eax,dword ptr [esi+4];TUnitVersioning.FModules:TObjectList
 0053F044    mov         edi,dword ptr [eax+8];TObjectList.FCount:Integer
 0053F047    dec         edi
 0053F048    test        edi,edi
>0053F04A    jl          0053F089
 0053F04C    inc         edi
 0053F04D    xor         ebx,ebx
 0053F04F    mov         edx,ebx
 0053F051    mov         eax,esi
 0053F053    call        0053EF3C
 0053F058    mov         ecx,dword ptr [esp+4]
 0053F05C    mov         edx,dword ptr [esp]
 0053F05F    call        TUnitVersioningModule.IndexOf
 0053F064    cmp         eax,0FFFFFFFF
>0053F067    je          0053F073
 0053F069    add         eax,dword ptr [esp+0C]
 0053F06D    mov         dword ptr [esp+8],eax
>0053F071    jmp         0053F089
 0053F073    mov         edx,ebx
 0053F075    mov         eax,esi
 0053F077    call        0053EF3C
 0053F07C    call        0053EBDC
 0053F081    add         dword ptr [esp+0C],eax
 0053F085    inc         ebx
 0053F086    dec         edi
>0053F087    jne         0053F04F
 0053F089    mov         eax,dword ptr [esp+8]
 0053F08D    add         esp,10
 0053F090    pop         edi
 0053F091    pop         esi
 0053F092    pop         ebx
 0053F093    ret
*}
end;

//0053F094
procedure TUnitVersioning.RegisterProvider(AProviderClass:TUnitVersioningProviderClass);
begin
{*
 0053F094    push        ebx
 0053F095    push        esi
 0053F096    push        edi
 0053F097    push        ebp
 0053F098    push        ecx
 0053F099    mov         ebp,edx
 0053F09B    mov         edi,eax
 0053F09D    mov         dword ptr [esp],0FFFFFFFF
 0053F0A4    mov         eax,dword ptr [edi+8];TUnitVersioning.FProviders:TObjectList
 0053F0A7    mov         esi,dword ptr [eax+8];TObjectList.FCount:Integer
 0053F0AA    dec         esi
 0053F0AB    test        esi,esi
>0053F0AD    jl          0053F0CD
 0053F0AF    inc         esi
 0053F0B0    xor         ebx,ebx
 0053F0B2    mov         eax,dword ptr [edi+8];TUnitVersioning.FProviders:TObjectList
 0053F0B5    mov         edx,ebx
 0053F0B7    call        TList.Get
 0053F0BC    mov         eax,dword ptr [eax]
 0053F0BE    mov         edx,eax
 0053F0C0    cmp         ebp,edx
>0053F0C2    jne         0053F0C9
 0053F0C4    mov         dword ptr [esp],ebx
>0053F0C7    jmp         0053F0CD
 0053F0C9    inc         ebx
 0053F0CA    dec         esi
>0053F0CB    jne         0053F0B2
 0053F0CD    cmp         dword ptr [esp],0FFFFFFFF
>0053F0D1    jne         0053F0E2
 0053F0D3    mov         dl,1
 0053F0D5    mov         eax,ebp
 0053F0D7    call        dword ptr [eax]
 0053F0D9    mov         edx,dword ptr [edi+8];TUnitVersioning.FProviders:TObjectList
 0053F0DC    xchg        eax,edx
 0053F0DD    call        TList.Add
 0053F0E2    pop         edx
 0053F0E3    pop         ebp
 0053F0E4    pop         edi
 0053F0E5    pop         esi
 0053F0E6    pop         ebx
 0053F0E7    ret
*}
end;

//0053F0E8
procedure TUnitVersioning.LoadModuleUnitVersioningInfo(Instance:Cardinal);
begin
{*
 0053F0E8    push        ebx
 0053F0E9    push        esi
 0053F0EA    push        edi
 0053F0EB    push        ebp
 0053F0EC    mov         ebp,edx
 0053F0EE    mov         edi,eax
 0053F0F0    mov         eax,dword ptr [edi+8];TUnitVersioning.FProviders:TObjectList
 0053F0F3    mov         ebx,dword ptr [eax+8];TObjectList.FCount:Integer
 0053F0F6    dec         ebx
 0053F0F7    test        ebx,ebx
>0053F0F9    jl          0053F113
 0053F0FB    inc         ebx
 0053F0FC    xor         esi,esi
 0053F0FE    mov         eax,dword ptr [edi+8];TUnitVersioning.FProviders:TObjectList
 0053F101    mov         edx,esi
 0053F103    call        TList.Get
 0053F108    mov         edx,ebp
 0053F10A    mov         ecx,dword ptr [eax]
 0053F10C    call        dword ptr [ecx+4]
 0053F10F    inc         esi
 0053F110    dec         ebx
>0053F111    jne         0053F0FE
 0053F113    pop         ebp
 0053F114    pop         edi
 0053F115    pop         esi
 0053F116    pop         ebx
 0053F117    ret
*}
end;

//0053F118
{*function sub_0053F118:?;
begin
 0053F118    push        ebp
 0053F119    mov         ebp,esp
 0053F11B    xor         ecx,ecx
 0053F11D    push        ecx
 0053F11E    push        ecx
 0053F11F    push        ecx
 0053F120    push        ecx
 0053F121    push        ebx
 0053F122    xor         eax,eax
 0053F124    push        ebp
 0053F125    push        53F2D8
 0053F12A    push        dword ptr fs:[eax]
 0053F12D    mov         dword ptr fs:[eax],esp
 0053F130    cmp         byte ptr ds:[788CE4],0;gvar_00788CE4
>0053F137    je          0053F140
 0053F139    xor         ebx,ebx
>0053F13B    jmp         0053F2BD
 0053F140    cmp         dword ptr ds:[8154CC],0;gvar_008154CC:TJclMutex
>0053F147    jne         0053F183
 0053F149    push        0
 0053F14B    call        kernel32.GetCurrentProcessId
 0053F150    xor         edx,edx
 0053F152    push        edx
 0053F153    push        eax
 0053F154    lea         eax,[ebp-8]
 0053F157    call        IntToStr
 0053F15C    mov         ecx,dword ptr [ebp-8]
 0053F15F    lea         eax,[ebp-4]
 0053F162    mov         edx,53F2F4;'MutexNPA_UnitVersioning_'
 0053F167    call        @UStrCat3
 0053F16C    mov         eax,dword ptr [ebp-4]
 0053F16F    push        eax
 0053F170    xor         ecx,ecx
 0053F172    mov         dl,1
 0053F174    mov         eax,[005379D0];TJclMutex
 0053F179    call        TJclMutex.Create;TJclMutex.Create
 0053F17E    mov         [008154CC],eax;gvar_008154CC:TJclMutex
 0053F183    cmp         dword ptr ds:[788CDC],0;gvar_00788CDC:TUnitVersioning
>0053F18A    jne         0053F268
 0053F190    or          edx,0FFFFFFFF
 0053F193    mov         eax,[008154CC];gvar_008154CC:TJclMutex
 0053F198    call        TJclDispatcherObject.WaitFor
 0053F19D    xor         eax,eax
 0053F19F    push        ebp
 0053F1A0    push        53F261
 0053F1A5    push        dword ptr fs:[eax]
 0053F1A8    mov         dword ptr fs:[eax],esp
 0053F1AB    cmp         dword ptr ds:[788CE0],0;gvar_00788CE0
>0053F1B2    jne         0053F1EC
 0053F1B4    push        0F001F
 0053F1B9    call        kernel32.GetCurrentProcessId
 0053F1BE    xor         edx,edx
 0053F1C0    push        edx
 0053F1C1    push        eax
 0053F1C2    lea         eax,[ebp-10]
 0053F1C5    call        IntToStr
 0053F1CA    mov         ecx,dword ptr [ebp-10]
 0053F1CD    lea         eax,[ebp-0C]
 0053F1D0    mov         edx,53F334;'ShmNPA_UnitVersioning_'
 0053F1D5    call        @UStrCat3
 0053F1DA    mov         edx,dword ptr [ebp-0C]
 0053F1DD    mov         eax,788CE0;gvar_00788CE0
 0053F1E2    mov         ecx,4
 0053F1E7    call        0053D300
 0053F1EC    cmp         dword ptr ds:[788CE0],0;gvar_00788CE0
>0053F1F3    je          0053F231
 0053F1F5    mov         eax,[00788CE0];0x0 gvar_00788CE0
 0053F1FA    mov         eax,dword ptr [eax]
 0053F1FC    mov         [00788CDC],eax;gvar_00788CDC:TUnitVersioning
 0053F201    cmp         dword ptr ds:[788CDC],0;gvar_00788CDC:TUnitVersioning
>0053F208    jne         0053F249
 0053F20A    mov         dl,1
 0053F20C    mov         eax,[0053E000];TUnitVersioning
 0053F211    call        TUnitVersioning.Create;TUnitVersioning.Create
 0053F216    mov         [00788CDC],eax;gvar_00788CDC:TUnitVersioning
 0053F21B    mov         eax,[00788CE0];0x0 gvar_00788CE0
 0053F220    mov         edx,dword ptr ds:[788CDC];0x0 gvar_00788CDC:TUnitVersioning
 0053F226    mov         dword ptr [eax],edx
 0053F228    mov         byte ptr ds:[788CD8],1;gvar_00788CD8
>0053F22F    jmp         0053F249
 0053F231    mov         dl,1
 0053F233    mov         eax,[0053E000];TUnitVersioning
 0053F238    call        TUnitVersioning.Create;TUnitVersioning.Create
 0053F23D    mov         [00788CDC],eax;gvar_00788CDC:TUnitVersioning
 0053F242    mov         byte ptr ds:[788CD8],1;gvar_00788CD8
 0053F249    xor         eax,eax
 0053F24B    pop         edx
 0053F24C    pop         ecx
 0053F24D    pop         ecx
 0053F24E    mov         dword ptr fs:[eax],edx
 0053F251    push        53F2B7
 0053F256    mov         eax,[008154CC];gvar_008154CC:TJclMutex
 0053F25B    call        TJclMutex.Release
 0053F260    ret
>0053F261    jmp         @HandleFinally
>0053F266    jmp         0053F256
 0053F268    cmp         dword ptr ds:[788CE0],0;gvar_00788CE0
>0053F26F    je          0053F2B7
 0053F271    or          edx,0FFFFFFFF
 0053F274    mov         eax,[008154CC];gvar_008154CC:TJclMutex
 0053F279    call        TJclDispatcherObject.WaitFor
 0053F27E    xor         eax,eax
 0053F280    push        ebp
 0053F281    push        53F2B0
 0053F286    push        dword ptr fs:[eax]
 0053F289    mov         dword ptr fs:[eax],esp
 0053F28C    mov         eax,[00788CE0];0x0 gvar_00788CE0
 0053F291    mov         eax,dword ptr [eax]
 0053F293    mov         [00788CDC],eax;gvar_00788CDC:TUnitVersioning
 0053F298    xor         eax,eax
 0053F29A    pop         edx
 0053F29B    pop         ecx
 0053F29C    pop         ecx
 0053F29D    mov         dword ptr fs:[eax],edx
 0053F2A0    push        53F2B7
 0053F2A5    mov         eax,[008154CC];gvar_008154CC:TJclMutex
 0053F2AA    call        TJclMutex.Release
 0053F2AF    ret
>0053F2B0    jmp         @HandleFinally
>0053F2B5    jmp         0053F2A5
 0053F2B7    mov         ebx,dword ptr ds:[788CDC];0x0 gvar_00788CDC:TUnitVersioning
 0053F2BD    xor         eax,eax
 0053F2BF    pop         edx
 0053F2C0    pop         ecx
 0053F2C1    pop         ecx
 0053F2C2    mov         dword ptr fs:[eax],edx
 0053F2C5    push        53F2DF
 0053F2CA    lea         eax,[ebp-10]
 0053F2CD    mov         edx,4
 0053F2D2    call        @UStrArrayClr
 0053F2D7    ret
>0053F2D8    jmp         @HandleFinally
>0053F2DD    jmp         0053F2CA
 0053F2DF    mov         eax,ebx
 0053F2E1    pop         ebx
 0053F2E2    mov         esp,ebp
 0053F2E4    pop         ebp
 0053F2E5    ret
end;*}

//0053F364
procedure sub_0053F364;
begin
{*
 0053F364    push        ebp
 0053F365    mov         ebp,esp
 0053F367    push        ebx
 0053F368    push        esi
 0053F369    push        edi
 0053F36A    mov         byte ptr ds:[788CE4],1;gvar_00788CE4
 0053F371    xor         eax,eax
 0053F373    push        ebp
 0053F374    push        53F402
 0053F379    push        dword ptr fs:[eax]
 0053F37C    mov         dword ptr fs:[eax],esp
 0053F37F    cmp         dword ptr ds:[788CE0],0;gvar_00788CE0
>0053F386    je          0053F3D5
 0053F388    or          edx,0FFFFFFFF
 0053F38B    mov         eax,[008154CC];gvar_008154CC:TJclMutex
 0053F390    call        TJclDispatcherObject.WaitFor
 0053F395    xor         eax,eax
 0053F397    push        ebp
 0053F398    push        53F3CE
 0053F39D    push        dword ptr fs:[eax]
 0053F3A0    mov         dword ptr fs:[eax],esp
 0053F3A3    mov         eax,[00788CE0];0x0 gvar_00788CE0
 0053F3A8    xor         edx,edx
 0053F3AA    mov         dword ptr [eax],edx
 0053F3AC    mov         eax,788CE0;gvar_00788CE0
 0053F3B1    call        0053D5DC
 0053F3B6    xor         eax,eax
 0053F3B8    pop         edx
 0053F3B9    pop         ecx
 0053F3BA    pop         ecx
 0053F3BB    mov         dword ptr fs:[eax],edx
 0053F3BE    push        53F3D5
 0053F3C3    mov         eax,[008154CC];gvar_008154CC:TJclMutex
 0053F3C8    call        TJclMutex.Release
 0053F3CD    ret
>0053F3CE    jmp         @HandleFinally
>0053F3D3    jmp         0053F3C3
 0053F3D5    cmp         dword ptr ds:[788CDC],0;gvar_00788CDC:TUnitVersioning
>0053F3DC    je          0053F3F1
 0053F3DE    cmp         byte ptr ds:[788CD8],0;gvar_00788CD8
>0053F3E5    je          0053F3F1
 0053F3E7    mov         eax,[00788CDC];0x0 gvar_00788CDC:TUnitVersioning
 0053F3EC    call        TObject.Free
 0053F3F1    xor         eax,eax
 0053F3F3    mov         [00788CDC],eax;gvar_00788CDC:TUnitVersioning
 0053F3F8    xor         eax,eax
 0053F3FA    pop         edx
 0053F3FB    pop         ecx
 0053F3FC    pop         ecx
 0053F3FD    mov         dword ptr fs:[eax],edx
>0053F400    jmp         0053F40C
>0053F402    jmp         @HandleAnyException
 0053F407    call        @DoneExcept
 0053F40C    mov         eax,[008154CC];gvar_008154CC:TJclMutex
 0053F411    xor         edx,edx
 0053F413    mov         dword ptr ds:[8154CC],edx;gvar_008154CC:TJclMutex
 0053F419    call        TObject.Free
 0053F41E    pop         edi
 0053F41F    pop         esi
 0053F420    pop         ebx
 0053F421    pop         ebp
 0053F422    ret
*}
end;

//0053F424
{*procedure sub_0053F424(?:?; ?:?);
begin
 0053F424    push        ebx
 0053F425    push        esi
 0053F426    mov         esi,edx
 0053F428    mov         ebx,eax
 0053F42A    call        0053F118
 0053F42F    test        eax,eax
>0053F431    je          0053F43B
 0053F433    mov         ecx,esi
 0053F435    mov         edx,ebx
 0053F437    mov         ebx,dword ptr [eax]
 0053F439    call        dword ptr [ebx]
 0053F43B    pop         esi
 0053F43C    pop         ebx
 0053F43D    ret
end;*}

//0053F440
{*procedure sub_0053F440(?:?);
begin
 0053F440    push        ebx
 0053F441    mov         ebx,eax
 0053F443    call        0053F118
 0053F448    test        eax,eax
>0053F44A    je          0053F453
 0053F44C    mov         edx,ebx
 0053F44E    mov         ecx,dword ptr [eax]
 0053F450    call        dword ptr [ecx+4]
 0053F453    pop         ebx
 0053F454    ret
end;*}

Initialization
//00781174
{*
 00781174    sub         dword ptr ds:[8154C8],1
>0078117B    jae         0078118C
 0078117D    mov         edx,788CC0;^'$URL: https://jcl.svn.sourceforge.net:443/svnroot/jcl/tags/JCL-2.2-Build384...
 00781182    mov         eax,[00790C38];gvar_00790C38
 00781187    call        0053F424
 0078118C    ret
*}
Finalization
//0053F458
{*
 0053F458    push        ebp
 0053F459    mov         ebp,esp
 0053F45B    xor         eax,eax
 0053F45D    push        ebp
 0053F45E    push        53F494
 0053F463    push        dword ptr fs:[eax]
 0053F466    mov         dword ptr fs:[eax],esp
 0053F469    inc         dword ptr ds:[8154C8]
>0053F46F    jne         0053F486
 0053F471    call        0053F364
 0053F476    mov         eax,788CC0;^'$URL: https://jcl.svn.sourceforge.net:443/svnroot/jcl/tags/JCL-2.2-Build384...
 0053F47B    mov         edx,dword ptr ds:[53D8C0];TUnitVersionInfo
 0053F481    call        @FinalizeRecord
 0053F486    xor         eax,eax
 0053F488    pop         edx
 0053F489    pop         ecx
 0053F48A    pop         ecx
 0053F48B    mov         dword ptr fs:[eax],edx
 0053F48E    push        53F49B
 0053F493    ret
>0053F494    jmp         @HandleFinally
>0053F499    jmp         0053F493
 0053F49B    pop         ebp
 0053F49C    ret
*}
end.