//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit PieBluetooth;

interface

uses
  SysUtils, Classes;

type
  BLUETOOTH_DEVICE_INFO = BLUETOOTH_DEVICE_INFO = record//size=54
dwSize:Cardinal;//f0
address:?;//f4
classOfDevice:?;//fA
szName:?;//fD
bPaired:LongBool;//f50
end;;
  TBluetoothObject = class(TObject)
  public
    Info:BLUETOOTH_DEVICE_INFO;//f4
  end;
  TAutoBluetoothThread = class(TThread)
  public
    TimeBetweenScans:Integer;//f40
    TimeBetweenChecks:Integer;//f44
    FastScanTime:Integer;//f48
    SlowScanTime:Integer;//f4C
    BluetoothSearchCount:Integer;//f50
    temp:string;//f54
    procedure Execute; virtual;//v4//00602268
    constructor Create;//0060203C
  end;
    //procedure sub_00600B08(?:?);//00600B08
    procedure sub_00600DEC;//00600DEC
    procedure sub_00600DF4;//00600DF4
    procedure sub_00600DFC;//00600DFC
    //procedure sub_00600E04(?:?);//00600E04
    //function sub_00600EA0:?;//00600EA0
    //procedure sub_00600ECC(?:?; ?:?);//00600ECC
    procedure sub_00600F68;//00600F68
    procedure sub_00601134;//00601134
    procedure sub_00601934;//00601934
    procedure sub_00601C68;//00601C68
    //procedure sub_00601C80(?:?; ?:?);//00601C80
    procedure sub_00602090(?:TAutoBluetoothThread; ?:UnicodeString);//00602090
    //procedure sub_00602118(?:?; ?:?);//00602118
    procedure Execute;//00602268

implementation

//00600B08
{*procedure sub_00600B08(?:?);
begin
 00600B08    push        ebx
 00600B09    add         esp,0FFFFFDF4
 00600B0F    mov         ebx,eax
 00600B11    push        0
 00600B13    push        26
 00600B15    lea         eax,[esp+8]
 00600B19    push        eax
 00600B1A    push        0
 00600B1C    call        shell32.SHGetSpecialFolderPathW
 00600B21    test        eax,eax
>00600B23    je          00600B35
 00600B25    mov         eax,ebx
 00600B27    mov         edx,esp
 00600B29    mov         ecx,105
 00600B2E    call        @UStrFromWArray
>00600B33    jmp         00600B3C
 00600B35    mov         eax,ebx
 00600B37    call        @UStrClr
 00600B3C    add         esp,20C
 00600B42    pop         ebx
 00600B43    ret
end;*}

//00600DEC
procedure sub_00600DEC;
begin
{*
 00600DEC    mov         byte ptr ds:[81783C],0;gvar_0081783C
 00600DF3    ret
*}
end;

//00600DF4
procedure sub_00600DF4;
begin
{*
 00600DF4    mov         byte ptr ds:[81783C],1;gvar_0081783C
 00600DFB    ret
*}
end;

//00600DFC
procedure sub_00600DFC;
begin
{*
 00600DFC    mov         byte ptr ds:[81783D],1;gvar_0081783D
 00600E03    ret
*}
end;

//00600E04
{*procedure sub_00600E04(?:?);
begin
 00600E04    test        al,al
>00600E06    jne         00600E3E
 00600E08    mov         byte ptr ds:[78BD2D],1;gvar_0078BD2D
 00600E0F    cmp         dword ptr ds:[817838],0;gvar_00817838:TAutoBluetoothThread
>00600E16    je          00600E2C
 00600E18    mov         eax,[00817838];gvar_00817838:TAutoBluetoothThread
 00600E1D    call        TThread.Terminate
 00600E22    mov         eax,[00817838];gvar_00817838:TAutoBluetoothThread
 00600E27    call        TThread.WaitFor
 00600E2C    mov         eax,[00817838];gvar_00817838:TAutoBluetoothThread
 00600E31    call        TObject.Free
 00600E36    xor         eax,eax
 00600E38    mov         [00817838],eax;gvar_00817838:TAutoBluetoothThread
 00600E3D    ret
 00600E3E    mov         byte ptr ds:[78BD2D],0;gvar_0078BD2D
 00600E45    cmp         dword ptr ds:[817838],0;gvar_00817838:TAutoBluetoothThread
>00600E4C    jne         00600E61
 00600E4E    mov         dl,1
 00600E50    mov         eax,[00600C8C];TAutoBluetoothThread
 00600E55    call        TAutoBluetoothThread.Create;TAutoBluetoothThread.Create
 00600E5A    mov         [00817838],eax;gvar_00817838:TAutoBluetoothThread
>00600E5F    jmp         00600E9C
 00600E61    mov         eax,[00817838];gvar_00817838:TAutoBluetoothThread
 00600E66    cmp         byte ptr [eax+0D],0
>00600E6A    je          00600E76
 00600E6C    mov         eax,[00817838];gvar_00817838:TAutoBluetoothThread
 00600E71    call        TThread.WaitFor
 00600E76    mov         eax,[00817838];gvar_00817838:TAutoBluetoothThread
 00600E7B    cmp         byte ptr [eax+10],0
>00600E7F    je          00600E9C
 00600E81    mov         eax,[00817838];gvar_00817838:TAutoBluetoothThread
 00600E86    call        TObject.Free
 00600E8B    mov         dl,1
 00600E8D    mov         eax,[00600C8C];TAutoBluetoothThread
 00600E92    call        TAutoBluetoothThread.Create;TAutoBluetoothThread.Create
 00600E97    mov         [00817838],eax;gvar_00817838:TAutoBluetoothThread
 00600E9C    ret
end;*}

//00600EA0
{*function sub_00600EA0:?;
begin
 00600EA0    add         esp,0FFFFFFE8
 00600EA3    lea         eax,[esp+8]
 00600EA7    push        eax
 00600EA8    call        kernel32.QueryPerformanceCounter
 00600EAD    lea         eax,[esp+10]
 00600EB1    push        eax
 00600EB2    call        kernel32.QueryPerformanceFrequency
 00600EB7    fild        qword ptr [esp+8]
 00600EBB    fild        qword ptr [esp+10]
 00600EBF    fdivp       st(1),st
 00600EC1    fstp        qword ptr [esp]
 00600EC4    wait
 00600EC5    fld         qword ptr [esp]
 00600EC8    add         esp,18
 00600ECB    ret
end;*}

//00600ECC
{*procedure sub_00600ECC(?:?; ?:?);
begin
 00600ECC    push        ebp
 00600ECD    mov         ebp,esp
 00600ECF    add         esp,0FFFFFFF4
 00600ED2    push        ebx
 00600ED3    push        esi
 00600ED4    push        edi
 00600ED5    xor         ecx,ecx
 00600ED7    mov         dword ptr [ebp-0C],ecx
 00600EDA    mov         esi,eax
 00600EDC    lea         edi,[ebp-8]
 00600EDF    movs        dword ptr [edi],dword ptr [esi]
 00600EE0    movs        dword ptr [edi],dword ptr [esi]
 00600EE1    mov         esi,edx
 00600EE3    xor         eax,eax
 00600EE5    push        ebp
 00600EE6    push        600F4A
 00600EEB    push        dword ptr fs:[eax]
 00600EEE    mov         dword ptr fs:[eax],esp
 00600EF1    mov         eax,esi
 00600EF3    call        @UStrClr
 00600EF8    xor         ebx,ebx
 00600EFA    lea         ecx,[ebp-0C]
 00600EFD    mov         eax,5
 00600F02    sub         eax,ebx
 00600F04    movzx       eax,byte ptr [ebp+eax-8]
 00600F09    mov         edx,2
 00600F0E    call        IntToHex
 00600F13    mov         edx,dword ptr [ebp-0C]
 00600F16    mov         eax,esi
 00600F18    call        @UStrCat
 00600F1D    cmp         ebx,5
>00600F20    je          00600F2E
 00600F22    mov         eax,esi
 00600F24    mov         edx,600F64;':'
 00600F29    call        @UStrCat
 00600F2E    inc         ebx
 00600F2F    cmp         ebx,6
>00600F32    jne         00600EFA
 00600F34    xor         eax,eax
 00600F36    pop         edx
 00600F37    pop         ecx
 00600F38    pop         ecx
 00600F39    mov         dword ptr fs:[eax],edx
 00600F3C    push        600F51
 00600F41    lea         eax,[ebp-0C]
 00600F44    call        @UStrClr
 00600F49    ret
>00600F4A    jmp         @HandleFinally
>00600F4F    jmp         00600F41
 00600F51    pop         edi
 00600F52    pop         esi
 00600F53    pop         ebx
 00600F54    mov         esp,ebp
 00600F56    pop         ebp
 00600F57    ret
end;*}

//00600F68
procedure sub_00600F68;
begin
{*
 00600F68    push        ebp
 00600F69    mov         ebp,esp
 00600F6B    add         esp,0FFFFFDA8
 00600F71    push        ebx
 00600F72    xor         eax,eax
 00600F74    mov         dword ptr [ebp-258],eax
 00600F7A    mov         dword ptr [ebp-254],eax
 00600F80    xor         eax,eax
 00600F82    push        ebp
 00600F83    push        6010C0
 00600F88    push        dword ptr fs:[eax]
 00600F8B    mov         dword ptr fs:[eax],esp
 00600F8E    cmp         dword ptr ds:[817820],0;gvar_00817820:Pointer
>00600F95    je          006010A2
 00600F9B    cmp         byte ptr ds:[78BD2D],0;gvar_0078BD2D
>00600FA2    jne         006010A2
 00600FA8    lea         eax,[ebp-20]
 00600FAB    xor         ecx,ecx
 00600FAD    mov         edx,20
 00600FB2    call        @FillChar
 00600FB7    mov         dword ptr [ebp-20],20
 00600FBE    mov         dword ptr [ebp-1C],0FFFFFFFF
 00600FC5    mov         dword ptr [ebp-18],0FFFFFFFF
 00600FCC    mov         dword ptr [ebp-14],0FFFFFFFF
 00600FD3    mov         dword ptr [ebp-10],0FFFFFFFF
 00600FDA    xor         eax,eax
 00600FDC    mov         dword ptr [ebp-0C],eax
 00600FDF    mov         byte ptr [ebp-8],5
 00600FE3    xor         eax,eax
 00600FE5    mov         dword ptr [ebp-4],eax
 00600FE8    mov         dword ptr [ebp-250],230
 00600FF2    lea         eax,[ebp-250]
 00600FF8    push        eax
 00600FF9    lea         eax,[ebp-20]
 00600FFC    push        eax
 00600FFD    call        dword ptr ds:[817820]
 00601003    mov         ebx,eax
 00601005    test        ebx,ebx
>00601007    je          006010A2
 0060100D    lea         eax,[ebp-254]
 00601013    lea         edx,[ebp-210]
 00601019    mov         ecx,0F8
 0060101E    call        @UStrFromWArray
 00601023    mov         eax,dword ptr [ebp-254]
 00601029    mov         edx,6010D8;'Nintendo RVL-CNT-01'
 0060102E    call        @UStrEqual
>00601033    je          0060105D
 00601035    lea         eax,[ebp-258]
 0060103B    lea         edx,[ebp-210]
 00601041    mov         ecx,0F8
 00601046    call        @UStrFromWArray
 0060104B    mov         eax,dword ptr [ebp-258]
 00601051    mov         edx,60110C;'Nintendo RVL-WBC-01'
 00601056    call        @UStrEqual
>0060105B    jne         00601085
 0060105D    cmp         dword ptr [ebp-238],0
>00601064    je          00601085
 00601066    cmp         dword ptr [ebp-23C],0
>0060106D    jne         00601085
 0060106F    cmp         dword ptr [ebp-234],0
>00601076    jne         00601085
 00601078    lea         eax,[ebp-248]
 0060107E    push        eax
 0060107F    call        dword ptr ds:[81782C]
 00601085    lea         eax,[ebp-250]
 0060108B    push        eax
 0060108C    push        ebx
 0060108D    call        dword ptr ds:[817824]
 00601093    test        eax,eax
>00601095    jne         0060100D
 0060109B    push        ebx
 0060109C    call        dword ptr ds:[817828]
 006010A2    xor         eax,eax
 006010A4    pop         edx
 006010A5    pop         ecx
 006010A6    pop         ecx
 006010A7    mov         dword ptr fs:[eax],edx
 006010AA    push        6010C7
 006010AF    lea         eax,[ebp-258]
 006010B5    mov         edx,2
 006010BA    call        @UStrArrayClr
 006010BF    ret
>006010C0    jmp         @HandleFinally
>006010C5    jmp         006010AF
 006010C7    pop         ebx
 006010C8    mov         esp,ebp
 006010CA    pop         ebp
 006010CB    ret
*}
end;

//00601134
procedure sub_00601134;
begin
{*
 00601134    push        ebp
 00601135    mov         ebp,esp
 00601137    xor         ecx,ecx
 00601139    push        ecx
 0060113A    push        ecx
 0060113B    push        ecx
 0060113C    push        ecx
 0060113D    push        ecx
 0060113E    push        ebx
 0060113F    push        esi
 00601140    push        edi
 00601141    xor         eax,eax
 00601143    push        ebp
 00601144    push        6013FA
 00601149    push        dword ptr fs:[eax]
 0060114C    mov         dword ptr fs:[eax],esp
 0060114F    push        601408;'bthprops.cpl'
 00601154    call        kernel32.LoadLibraryW
 00601159    mov         ebx,eax
 0060115B    test        ebx,ebx
>0060115D    jne         0060116B
 0060115F    push        601424;'irprops.cpl'
 00601164    call        kernel32.LoadLibraryW
 00601169    mov         ebx,eax
 0060116B    test        ebx,ebx
>0060116D    je          006011C1
 0060116F    push        60143C;'BluetoothFindFirstDevice'
 00601174    push        ebx
 00601175    call        GetProcAddress
 0060117A    mov         [00817820],eax;gvar_00817820:Pointer
 0060117F    push        601470;'BluetoothFindNextDevice'
 00601184    push        ebx
 00601185    call        GetProcAddress
 0060118A    mov         [00817824],eax;gvar_00817824:Pointer
 0060118F    push        6014A0;'BluetoothFindDeviceClose'
 00601194    push        ebx
 00601195    call        GetProcAddress
 0060119A    mov         [00817828],eax;gvar_00817828:Pointer
 0060119F    push        6014D4;'BluetoothRemoveDevice'
 006011A4    push        ebx
 006011A5    call        GetProcAddress
 006011AA    mov         [0081782C],eax;gvar_0081782C:Pointer
 006011AF    push        601500;'BluetoothSetServiceState'
 006011B4    push        ebx
 006011B5    call        GetProcAddress
 006011BA    mov         [00817830],eax;gvar_00817830:Pointer
>006011BF    jmp         006011E4
 006011C1    xor         eax,eax
 006011C3    mov         [00817820],eax;gvar_00817820:Pointer
 006011C8    xor         eax,eax
 006011CA    mov         [00817824],eax;gvar_00817824:Pointer
 006011CF    xor         eax,eax
 006011D1    mov         [00817828],eax;gvar_00817828:Pointer
 006011D6    xor         eax,eax
 006011D8    mov         [0081782C],eax;gvar_0081782C:Pointer
 006011DD    xor         eax,eax
 006011DF    mov         [00817830],eax;gvar_00817830:Pointer
 006011E4    lea         eax,[ebp-8]
 006011E7    call        00600B08
 006011EC    lea         eax,[ebp-0C]
 006011EF    call        00600B08
 006011F4    lea         eax,[ebp-0C]
 006011F7    mov         edx,601540;'\Toshiba\Bluetooth Toshiba Stack\ECCenter.exe'
 006011FC    call        @UStrCat
 00601201    mov         eax,dword ptr [ebp-0C]
 00601204    mov         dl,1
 00601206    call        FileExists
 0060120B    test        al,al
 0060120D    xor         eax,eax
 0060120F    push        ebp
 00601210    push        601259
 00601215    push        dword ptr fs:[eax]
 00601218    mov         dword ptr fs:[eax],esp
 0060121B    lea         edx,[ebp-14]
 0060121E    xor         eax,eax
 00601220    call        ParamStr
 00601225    mov         eax,dword ptr [ebp-14]
 00601228    lea         edx,[ebp-10]
 0060122B    call        ExtractFileDir
 00601230    lea         eax,[ebp-10]
 00601233    mov         edx,6015A8;'\wiimote.ini'
 00601238    call        @UStrCat
 0060123D    mov         ecx,dword ptr [ebp-10]
 00601240    mov         dl,1
 00601242    mov         eax,[004598F4];TIniFile
 00601247    call        TCustomIniFile.Create;TIniFile.Create
 0060124C    mov         dword ptr [ebp-4],eax
 0060124F    xor         eax,eax
 00601251    pop         edx
 00601252    pop         ecx
 00601253    pop         ecx
 00601254    mov         dword ptr fs:[eax],edx
>00601257    jmp         0060126D
>00601259    jmp         @HandleAnyException
 0060125E    call        @DoneExcept
>00601263    jmp         006013DF
 00601268    call        @DoneExcept
 0060126D    xor         eax,eax
 0060126F    push        ebp
 00601270    push        6012AE
 00601275    push        dword ptr fs:[eax]
 00601278    mov         dword ptr fs:[eax],esp
 0060127B    push        0
 0060127D    mov         ecx,6015D0;'NoAutoBluetooth'
 00601282    mov         edx,6015FC;'General'
 00601287    mov         eax,dword ptr [ebp-4]
 0060128A    mov         ebx,dword ptr [eax]
 0060128C    call        dword ptr [ebx+0C];TCustomIniFile.ReadInteger
 0060128F    test        eax,eax
 00601291    setne       byte ptr ds:[78BD2D];gvar_0078BD2D
 00601298    xor         eax,eax
 0060129A    pop         edx
 0060129B    pop         ecx
 0060129C    pop         ecx
 0060129D    mov         dword ptr fs:[eax],edx
 006012A0    push        6012B5
 006012A5    mov         eax,dword ptr [ebp-4]
 006012A8    call        TObject.Free
 006012AD    ret
>006012AE    jmp         @HandleFinally
>006012B3    jmp         006012A5
 006012B5    push        60160C;'btfunc.dll'
 006012BA    call        kernel32.LoadLibraryW
 006012BF    mov         ebx,eax
 006012C1    test        ebx,ebx
 006012C3    sete        byte ptr ds:[78BD1C];gvar_0078BD1C
 006012CA    cmp         byte ptr ds:[78BD1C],0;gvar_0078BD1C
 006012D1    cmp         byte ptr ds:[78BD2D],0;gvar_0078BD2D
>006012D8    je          0060131D
 006012DA    push        ebx
 006012DB    call        kernel32.FreeLibrary
 006012E0    xor         eax,eax
 006012E2    mov         [00817800],eax;gvar_00817800:Pointer
 006012E7    xor         eax,eax
 006012E9    mov         [00817804],eax;gvar_00817804:Pointer
 006012EE    xor         eax,eax
 006012F0    mov         [00817808],eax;gvar_00817808:Pointer
 006012F5    xor         eax,eax
 006012F7    mov         [0081780C],eax;gvar_0081780C:Pointer
 006012FC    xor         eax,eax
 006012FE    mov         [00817810],eax;gvar_00817810:Pointer
 00601303    xor         eax,eax
 00601305    mov         [00817814],eax;gvar_00817814:Pointer
 0060130A    xor         eax,eax
 0060130C    mov         [00817818],eax;gvar_00817818:Pointer
 00601311    xor         eax,eax
 00601313    mov         [0081781C],eax;gvar_0081781C:Pointer
>00601318    jmp         006013DF
 0060131D    test        ebx,ebx
>0060131F    je          006013A7
 00601325    push        601624;'BT_InitializeLibrary'
 0060132A    push        ebx
 0060132B    call        GetProcAddress
 00601330    mov         [00817800],eax;gvar_00817800:Pointer
 00601335    push        601650;'BT_UninitializeLibrary'
 0060133A    push        ebx
 0060133B    call        GetProcAddress
 00601340    mov         [00817804],eax;gvar_00817804:Pointer
 00601345    push        601680;'BT_RegisterCallback'
 0060134A    push        ebx
 0060134B    call        GetProcAddress
 00601350    mov         [00817808],eax;gvar_00817808:Pointer
 00601355    push        6016A8;'BT_InquireDevices'
 0060135A    push        ebx
 0060135B    call        GetProcAddress
 00601360    mov         [0081780C],eax;gvar_0081780C:Pointer
 00601365    push        6016CC;'BT_PairDevice'
 0060136A    push        ebx
 0060136B    call        GetProcAddress
 00601370    mov         [00817810],eax;gvar_00817810:Pointer
 00601375    push        6016E8;'BT_BrowseServices'
 0060137A    push        ebx
 0060137B    call        GetProcAddress
 00601380    mov         [00817814],eax;gvar_00817814:Pointer
 00601385    push        60170C;'BT_ConnectService'
 0060138A    push        ebx
 0060138B    call        GetProcAddress
 00601390    mov         [00817818],eax;gvar_00817818:Pointer
 00601395    push        601730;'BT_DisconnectService'
 0060139A    push        ebx
 0060139B    call        GetProcAddress
 006013A0    mov         [0081781C],eax;gvar_0081781C:Pointer
>006013A5    jmp         006013DF
 006013A7    xor         eax,eax
 006013A9    mov         [00817800],eax;gvar_00817800:Pointer
 006013AE    xor         eax,eax
 006013B0    mov         [00817804],eax;gvar_00817804:Pointer
 006013B5    xor         eax,eax
 006013B7    mov         [00817808],eax;gvar_00817808:Pointer
 006013BC    xor         eax,eax
 006013BE    mov         [0081780C],eax;gvar_0081780C:Pointer
 006013C3    xor         eax,eax
 006013C5    mov         [00817810],eax;gvar_00817810:Pointer
 006013CA    xor         eax,eax
 006013CC    mov         [00817814],eax;gvar_00817814:Pointer
 006013D1    xor         eax,eax
 006013D3    mov         [00817818],eax;gvar_00817818:Pointer
 006013D8    xor         eax,eax
 006013DA    mov         [0081781C],eax;gvar_0081781C:Pointer
 006013DF    xor         eax,eax
 006013E1    pop         edx
 006013E2    pop         ecx
 006013E3    pop         ecx
 006013E4    mov         dword ptr fs:[eax],edx
 006013E7    push        601401
 006013EC    lea         eax,[ebp-14]
 006013EF    mov         edx,4
 006013F4    call        @UStrArrayClr
 006013F9    ret
>006013FA    jmp         @HandleFinally
>006013FF    jmp         006013EC
 00601401    pop         edi
 00601402    pop         esi
 00601403    pop         ebx
 00601404    mov         esp,ebp
 00601406    pop         ebp
 00601407    ret
*}
end;

//00601934
procedure sub_00601934;
begin
{*
 00601934    push        ebp
 00601935    mov         ebp,esp
 00601937    xor         ecx,ecx
 00601939    push        ecx
 0060193A    push        ecx
 0060193B    push        ecx
 0060193C    push        ecx
 0060193D    push        ecx
 0060193E    push        ecx
 0060193F    push        ecx
 00601940    push        ebx
 00601941    xor         eax,eax
 00601943    push        ebp
 00601944    push        601AA0
 00601949    push        dword ptr fs:[eax]
 0060194C    mov         dword ptr fs:[eax],esp
 0060194F    cmp         byte ptr ds:[8177FC],0;gvar_008177FC
>00601956    jne         00601A85
 0060195C    cmp         dword ptr ds:[817800],0;gvar_00817800:Pointer
>00601963    je          00601A85
 00601969    cmp         dword ptr ds:[817808],0;gvar_00817808:Pointer
>00601970    je          00601A85
 00601976    cmp         dword ptr ds:[81780C],0;gvar_0081780C:Pointer
>0060197D    je          00601A85
 00601983    call        dword ptr ds:[817800]
 00601989    test        eax,eax
>0060198B    je          00601A7B
 00601991    mov         byte ptr ds:[8177FC],1;gvar_008177FC
 00601998    mov         eax,601AB8;'Initialized Bluetooth!'
 0060199D    call        004FA5FC
 006019A2    push        60175C
 006019A7    push        3
 006019A9    call        dword ptr ds:[817808]
 006019AF    add         esp,8
 006019B2    mov         ebx,eax
 006019B4    cmp         ebx,1
>006019B7    jne         006019C5
 006019B9    mov         eax,601AF4;'Registered callback!'
 006019BE    call        004FA5FC
>006019C3    jmp         006019E7
 006019C5    lea         edx,[ebp-0C]
 006019C8    mov         eax,ebx
 006019CA    call        00601C80
 006019CF    mov         ecx,dword ptr [ebp-0C]
 006019D2    lea         eax,[ebp-8]
 006019D5    mov         edx,601B2C;'BT_RegisterCallback: '
 006019DA    call        @UStrCat3
 006019DF    mov         eax,dword ptr [ebp-8]
 006019E2    call        004FA5FC
 006019E7    push        601894
 006019EC    push        6
 006019EE    call        dword ptr ds:[817808]
 006019F4    add         esp,8
 006019F7    mov         ebx,eax
 006019F9    cmp         ebx,1
>006019FC    jne         00601A0A
 006019FE    mov         eax,601B64;'Registered callback 2!'
 00601A03    call        004FA5FC
>00601A08    jmp         00601A2C
 00601A0A    lea         edx,[ebp-14]
 00601A0D    mov         eax,ebx
 00601A0F    call        00601C80
 00601A14    mov         ecx,dword ptr [ebp-14]
 00601A17    lea         eax,[ebp-10]
 00601A1A    mov         edx,601BA0;'BT_RegisterCallback2: '
 00601A1F    call        @UStrCat3
 00601A24    mov         eax,dword ptr [ebp-10]
 00601A27    call        004FA5FC
 00601A2C    xor         eax,eax
 00601A2E    mov         dword ptr [ebp-4],eax
 00601A31    push        0
 00601A33    lea         eax,[ebp-4]
 00601A36    push        eax
 00601A37    push        30
 00601A39    push        0
 00601A3B    call        dword ptr ds:[81780C]
 00601A41    add         esp,10
 00601A44    mov         ebx,eax
 00601A46    cmp         ebx,1
>00601A49    jne         00601A57
 00601A4B    mov         eax,601BDC;'Started search!'
 00601A50    call        004FA5FC
>00601A55    jmp         00601A85
 00601A57    lea         edx,[ebp-1C]
 00601A5A    mov         eax,ebx
 00601A5C    call        00601C80
 00601A61    mov         ecx,dword ptr [ebp-1C]
 00601A64    lea         eax,[ebp-18]
 00601A67    mov         edx,601C08;'InquireDevices: '
 00601A6C    call        @UStrCat3
 00601A71    mov         eax,dword ptr [ebp-18]
 00601A74    call        004FA5FC
>00601A79    jmp         00601A85
 00601A7B    mov         eax,601C38;'Failed Bluetooth init!'
 00601A80    call        004FA5FC
 00601A85    xor         eax,eax
 00601A87    pop         edx
 00601A88    pop         ecx
 00601A89    pop         ecx
 00601A8A    mov         dword ptr fs:[eax],edx
 00601A8D    push        601AA7
 00601A92    lea         eax,[ebp-1C]
 00601A95    mov         edx,6
 00601A9A    call        @UStrArrayClr
 00601A9F    ret
>00601AA0    jmp         @HandleFinally
>00601AA5    jmp         00601A92
 00601AA7    pop         ebx
 00601AA8    mov         esp,ebp
 00601AAA    pop         ebp
 00601AAB    ret
*}
end;

//00601C68
procedure sub_00601C68;
begin
{*
 00601C68    mov         byte ptr ds:[8177FC],0;gvar_008177FC
 00601C6F    cmp         dword ptr ds:[817804],0;gvar_00817804:Pointer
>00601C76    je          00601C7E
 00601C78    call        dword ptr ds:[817804]
 00601C7E    ret
*}
end;

//00601C80
{*procedure sub_00601C80(?:?; ?:?);
begin
 00601C80    push        ebx
 00601C81    mov         ebx,edx
 00601C83    cmp         eax,0B
>00601C86    ja          00601D69
 00601C8C    jmp         dword ptr [eax*4+601C93]
 00601C8C    dd          00601CC3
 00601C8C    dd          00601CD1
 00601C8C    dd          00601CDF
 00601C8C    dd          00601CED
 00601C8C    dd          00601CFB
 00601C8C    dd          00601D09
 00601C8C    dd          00601D17
 00601C8C    dd          00601D25
 00601C8C    dd          00601D33
 00601C8C    dd          00601D41
 00601C8C    dd          00601D4F
 00601C8C    dd          00601D5D
 00601CC3    mov         eax,ebx
 00601CC5    mov         edx,601D78;'General Failure'
 00601CCA    call        @UStrAsg
 00601CCF    pop         ebx
 00601CD0    ret
 00601CD1    mov         eax,ebx
 00601CD3    mov         edx,601DA4;'Success'
 00601CD8    call        @UStrAsg
 00601CDD    pop         ebx
 00601CDE    ret
 00601CDF    mov         eax,ebx
 00601CE1    mov         edx,601DC0;'System Error'
 00601CE6    call        @UStrAsg
 00601CEB    pop         ebx
 00601CEC    ret
 00601CED    mov         eax,ebx
 00601CEF    mov         edx,601DE8;'Bluetooth Not Ready'
 00601CF4    call        @UStrAsg
 00601CF9    pop         ebx
 00601CFA    ret
 00601CFB    mov         eax,ebx
 00601CFD    mov         edx,601E1C;'Already Paired'
 00601D02    call        @UStrAsg
 00601D07    pop         ebx
 00601D08    ret
 00601D09    mov         eax,ebx
 00601D0B    mov         edx,601E48;'Authentication Failed'
 00601D10    call        @UStrAsg
 00601D15    pop         ebx
 00601D16    ret
 00601D17    mov         eax,ebx
 00601D19    mov         edx,601E80;'Busy browsing services or connecting to a device'
 00601D1E    call        @UStrAsg
 00601D23    pop         ebx
 00601D24    ret
 00601D25    mov         eax,ebx
 00601D27    mov         edx,601EF0;'Connection to service already established'
 00601D2C    call        @UStrAsg
 00601D31    pop         ebx
 00601D32    ret
 00601D33    mov         eax,ebx
 00601D35    mov         edx,601F50;'Connection doesn''t exist or is released'
 00601D3A    call        @UStrAsg
 00601D3F    pop         ebx
 00601D40    ret
 00601D41    mov         eax,ebx
 00601D43    mov         edx,601FAC;'Parameter error'
 00601D48    call        @UStrAsg
 00601D4D    pop         ebx
 00601D4E    ret
 00601D4F    mov         eax,ebx
 00601D51    mov         edx,601FD8;'Service doesn''t exist'
 00601D56    call        @UStrAsg
 00601D5B    pop         ebx
 00601D5C    ret
 00601D5D    mov         eax,ebx
 00601D5F    mov         edx,602010;'Device doesn''t exist'
 00601D64    call        @UStrAsg
 00601D69    pop         ebx
 00601D6A    ret
end;*}

//0060203C
constructor TAutoBluetoothThread.Create;
begin
{*
 0060203C    push        ebx
 0060203D    push        esi
 0060203E    test        dl,dl
>00602040    je          0060204A
 00602042    add         esp,0FFFFFFF0
 00602045    call        @ClassCreate
 0060204A    mov         ebx,edx
 0060204C    mov         esi,eax
 0060204E    xor         ecx,ecx
 00602050    xor         edx,edx
 00602052    mov         eax,esi
 00602054    call        TThread.Create
 00602059    mov         dword ptr [esi+40],4650;TAutoBluetoothThread.TimeBetweenScans:Integer
 00602060    mov         dword ptr [esi+44],3E8;TAutoBluetoothThread.TimeBetweenChecks:Integer
 00602067    mov         dword ptr [esi+48],1;TAutoBluetoothThread.FastScanTime:Integer
 0060206E    mov         dword ptr [esi+4C],5;TAutoBluetoothThread.SlowScanTime:Integer
 00602075    mov         eax,esi
 00602077    test        bl,bl
>00602079    je          0060208A
 0060207B    call        @AfterConstruction
 00602080    pop         dword ptr fs:[0]
 00602087    add         esp,0C
 0060208A    mov         eax,esi
 0060208C    pop         esi
 0060208D    pop         ebx
 0060208E    ret
*}
end;

//00602090
procedure sub_00602090(?:TAutoBluetoothThread; ?:UnicodeString);
begin
{*
 00602090    push        ebp
 00602091    mov         ebp,esp
 00602093    push        ecx
 00602094    push        ebx
 00602095    mov         dword ptr [ebp-4],edx
 00602098    mov         ebx,eax
 0060209A    mov         eax,dword ptr [ebp-4]
 0060209D    call        @UStrAddRef
 006020A2    xor         eax,eax
 006020A4    push        ebp
 006020A5    push        6020E3
 006020AA    push        dword ptr fs:[eax]
 006020AD    mov         dword ptr fs:[eax],esp
 006020B0    lea         eax,[ebx+54]
 006020B3    mov         ecx,dword ptr [ebp-4]
 006020B6    mov         edx,6020FC;'[Bluetooth] '
 006020BB    call        @UStrCat3
 006020C0    push        ebx
 006020C1    push        602F5C
 006020C6    mov         eax,ebx
 006020C8    call        TThread.Synchronize
 006020CD    xor         eax,eax
 006020CF    pop         edx
 006020D0    pop         ecx
 006020D1    pop         ecx
 006020D2    mov         dword ptr fs:[eax],edx
 006020D5    push        6020EA
 006020DA    lea         eax,[ebp-4]
 006020DD    call        @UStrClr
 006020E2    ret
>006020E3    jmp         @HandleFinally
>006020E8    jmp         006020DA
 006020EA    pop         ebx
 006020EB    pop         ecx
 006020EC    pop         ebp
 006020ED    ret
*}
end;

//00602118
{*procedure sub_00602118(?:?; ?:?);
begin
 00602118    push        ebp
 00602119    mov         ebp,esp
 0060211B    add         esp,0FFFFFDC8
 00602121    push        ebx
 00602122    push        esi
 00602123    push        edi
 00602124    xor         ecx,ecx
 00602126    mov         dword ptr [ebp-238],ecx
 0060212C    mov         dword ptr [ebp-234],ecx
 00602132    mov         esi,eax
 00602134    lea         edi,[ebp-230]
 0060213A    mov         ecx,8C
 0060213F    rep movs    dword ptr [edi],dword ptr [esi]
 00602141    mov         ebx,edx
 00602143    xor         eax,eax
 00602145    push        ebp
 00602146    push        602200
 0060214B    push        dword ptr fs:[eax]
 0060214E    mov         dword ptr fs:[eax],esp
 00602151    lea         eax,[ebp-234]
 00602157    lea         edx,[ebp-1F0]
 0060215D    mov         ecx,0F8
 00602162    call        @UStrFromWArray
 00602167    mov         edx,dword ptr [ebp-234]
 0060216D    mov         eax,ebx
 0060216F    mov         ecx,60221C;' '
 00602174    call        @UStrCat3
 00602179    push        dword ptr [ebx]
 0060217B    lea         edx,[ebp-238]
 00602181    lea         eax,[ebp-228]
 00602187    call        00600ECC
 0060218C    push        dword ptr [ebp-238]
 00602192    push        60221C;' '
 00602197    mov         eax,ebx
 00602199    mov         edx,3
 0060219E    call        @UStrCatN
 006021A3    cmp         dword ptr [ebp-218],0
>006021AA    je          006021B8
 006021AC    mov         eax,ebx
 006021AE    mov         edx,60222C;'old '
 006021B3    call        @UStrCat
 006021B8    cmp         dword ptr [ebp-21C],0
>006021BF    je          006021CD
 006021C1    mov         eax,ebx
 006021C3    mov         edx,602244;'conn '
 006021C8    call        @UStrCat
 006021CD    cmp         dword ptr [ebp-214],0
>006021D4    je          006021E2
 006021D6    mov         eax,ebx
 006021D8    mov         edx,60225C;'auth '
 006021DD    call        @UStrCat
 006021E2    xor         eax,eax
 006021E4    pop         edx
 006021E5    pop         ecx
 006021E6    pop         ecx
 006021E7    mov         dword ptr fs:[eax],edx
 006021EA    push        602207
 006021EF    lea         eax,[ebp-238]
 006021F5    mov         edx,2
 006021FA    call        @UStrArrayClr
 006021FF    ret
>00602200    jmp         @HandleFinally
>00602205    jmp         006021EF
 00602207    pop         edi
 00602208    pop         esi
 00602209    pop         ebx
 0060220A    mov         esp,ebp
 0060220C    pop         ebp
 0060220D    ret
end;*}

//00602268
procedure TAutoBluetoothThread.Execute;
begin
{*
 00602268    push        ebp
 00602269    mov         ebp,esp
 0060226B    mov         ecx,5C
 00602270    push        0
 00602272    push        0
 00602274    dec         ecx
>00602275    jne         00602270
 00602277    push        ecx
 00602278    push        esi
 00602279    push        edi
 0060227A    mov         dword ptr [ebp-4],eax
 0060227D    xor         eax,eax
 0060227F    push        ebp
 00602280    push        602C65
 00602285    push        dword ptr fs:[eax]
 00602288    mov         dword ptr fs:[eax],esp
 0060228B    mov         edx,602C80;'TAutoBluetoothThread.Execute'
 00602290    mov         eax,dword ptr [ebp-4]
 00602293    call        00602090
 00602298    mov         eax,602CC8;'AutoBluetooth'
 0060229D    call        004F9160
>006022A2    jmp         00602C3A
 006022A7    cmp         dword ptr ds:[817820],0;gvar_00817820:Pointer
>006022AE    je          00602C47
 006022B4    cmp         byte ptr ds:[78BD2D],0;gvar_0078BD2D
>006022BB    jne         00602C47
 006022C1    mov         eax,dword ptr [ebp-4]
 006022C4    inc         dword ptr [eax+50];TAutoBluetoothThread.BluetoothSearchCount:Integer
 006022C7    cmp         byte ptr ds:[81783D],0;gvar_0081783D
>006022CE    je          0060246C
 006022D4    mov         edx,602CE4;'BluetoothRemoveAll'
 006022D9    mov         eax,dword ptr [ebp-4]
 006022DC    call        00602090
 006022E1    lea         eax,[ebp-28]
 006022E4    xor         ecx,ecx
 006022E6    mov         edx,20
 006022EB    call        @FillChar
 006022F0    mov         dword ptr [ebp-28],20
 006022F7    xor         eax,eax
 006022F9    mov         dword ptr [ebp-24],eax
 006022FC    mov         dword ptr [ebp-20],0FFFFFFFF
 00602303    mov         dword ptr [ebp-1C],0FFFFFFFF
 0060230A    mov         dword ptr [ebp-18],0FFFFFFFF
 00602311    xor         eax,eax
 00602313    mov         dword ptr [ebp-14],eax
 00602316    mov         eax,dword ptr [ebp-4]
 00602319    movzx       eax,byte ptr [eax+48];TAutoBluetoothThread.FastScanTime:Integer
 0060231D    mov         byte ptr [ebp-10],al
 00602320    xor         eax,eax
 00602322    mov         dword ptr [ebp-0C],eax
 00602325    mov         dword ptr [ebp-258],230
 0060232F    mov         eax,dword ptr [ebp-4]
 00602332    cmp         byte ptr [eax+0D],0;TAutoBluetoothThread.FTerminated:Boolean
>00602336    jne         00602C47
 0060233C    lea         eax,[ebp-258]
 00602342    push        eax
 00602343    lea         eax,[ebp-28]
 00602346    push        eax
 00602347    call        dword ptr ds:[817820]
 0060234D    mov         dword ptr [ebp-8],eax
 00602350    cmp         dword ptr [ebp-8],0
>00602354    je          00602458
 0060235A    xor         eax,eax
 0060235C    push        ebp
 0060235D    push        602451
 00602362    push        dword ptr fs:[eax]
 00602365    mov         dword ptr fs:[eax],esp
 00602368    lea         eax,[ebp-26C]
 0060236E    lea         edx,[ebp-218]
 00602374    mov         ecx,0F8
 00602379    call        @UStrFromWArray
 0060237E    mov         eax,dword ptr [ebp-26C]
 00602384    mov         edx,602D18;'Nintendo RVL-CNT-01'
 00602389    call        @UStrEqual
>0060238E    je          006023B8
 00602390    lea         eax,[ebp-270]
 00602396    lea         edx,[ebp-218]
 0060239C    mov         ecx,0F8
 006023A1    call        @UStrFromWArray
 006023A6    mov         eax,dword ptr [ebp-270]
 006023AC    mov         edx,602D4C;'Nintendo RVL-WBC-01'
 006023B1    call        @UStrEqual
>006023B6    jne         0060240D
 006023B8    lea         edx,[ebp-278]
 006023BE    lea         eax,[ebp-258]
 006023C4    call        00602118
 006023C9    mov         ecx,dword ptr [ebp-278]
 006023CF    lea         eax,[ebp-274]
 006023D5    mov         edx,602D80;'  removing '
 006023DA    call        @UStrCat3
 006023DF    mov         edx,dword ptr [ebp-274]
 006023E5    mov         eax,dword ptr [ebp-4]
 006023E8    call        00602090
 006023ED    lea         eax,[ebp-250]
 006023F3    push        eax
 006023F4    call        dword ptr ds:[81782C]
 006023FA    mov         eax,dword ptr [ebp-4]
 006023FD    cmp         byte ptr [eax+0D],0;TAutoBluetoothThread.FTerminated:Boolean
>00602401    je          0060240D
 00602403    call        @TryFinallyExit
>00602408    jmp         00602C47
 0060240D    lea         eax,[ebp-258]
 00602413    push        eax
 00602414    mov         eax,dword ptr [ebp-8]
 00602417    push        eax
 00602418    call        dword ptr ds:[817824]
 0060241E    test        eax,eax
>00602420    je          00602439
 00602422    mov         eax,dword ptr [ebp-4]
 00602425    cmp         byte ptr [eax+0D],0;TAutoBluetoothThread.FTerminated:Boolean
>00602429    je          00602368
 0060242F    call        @TryFinallyExit
>00602434    jmp         00602C47
 00602439    xor         eax,eax
 0060243B    pop         edx
 0060243C    pop         ecx
 0060243D    pop         ecx
 0060243E    mov         dword ptr fs:[eax],edx
 00602441    push        602458
 00602446    mov         eax,dword ptr [ebp-8]
 00602449    push        eax
 0060244A    call        dword ptr ds:[817828]
 00602450    ret
>00602451    jmp         @HandleFinally
>00602456    jmp         00602446
 00602458    mov         byte ptr ds:[81783D],0;gvar_0081783D
 0060245F    mov         eax,dword ptr [ebp-4]
 00602462    cmp         byte ptr [eax+0D],0;TAutoBluetoothThread.FTerminated:Boolean
>00602466    jne         00602C47
 0060246C    cmp         byte ptr ds:[81783C],0;gvar_0081783C
>00602473    je          0060248E
 00602475    mov         eax,dword ptr [ebp-4]
 00602478    cmp         dword ptr [eax+50],2;TAutoBluetoothThread.BluetoothSearchCount:Integer
>0060247C    jle         0060248E
 0060247E    mov         eax,dword ptr [ebp-4]
 00602481    mov         eax,dword ptr [eax+44];TAutoBluetoothThread.TimeBetweenChecks:Integer
 00602484    call        TThread.Sleep
>00602489    jmp         00602C3A
 0060248E    lea         eax,[ebp-28]
 00602491    xor         ecx,ecx
 00602493    mov         edx,20
 00602498    call        @FillChar
 0060249D    mov         dword ptr [ebp-28],20
 006024A4    xor         eax,eax
 006024A6    mov         dword ptr [ebp-24],eax
 006024A9    mov         dword ptr [ebp-20],0FFFFFFFF
 006024B0    mov         dword ptr [ebp-1C],0FFFFFFFF
 006024B7    xor         eax,eax
 006024B9    mov         dword ptr [ebp-18],eax
 006024BC    xor         eax,eax
 006024BE    mov         dword ptr [ebp-14],eax
 006024C1    mov         eax,dword ptr [ebp-4]
 006024C4    movzx       eax,byte ptr [eax+48];TAutoBluetoothThread.FastScanTime:Integer
 006024C8    mov         byte ptr [ebp-10],al
 006024CB    xor         eax,eax
 006024CD    mov         dword ptr [ebp-0C],eax
 006024D0    mov         dword ptr [ebp-258],230
 006024DA    mov         eax,dword ptr [ebp-4]
 006024DD    cmp         byte ptr [eax+0D],0;TAutoBluetoothThread.FTerminated:Boolean
>006024E1    jne         00602C47
 006024E7    mov         edx,602DA4;'  Clean memory'
 006024EC    mov         eax,dword ptr [ebp-4]
 006024EF    call        00602090
 006024F4    lea         eax,[ebp-258]
 006024FA    push        eax
 006024FB    lea         eax,[ebp-28]
 006024FE    push        eax
 006024FF    call        dword ptr ds:[817820]
 00602505    mov         dword ptr [ebp-8],eax
 00602508    cmp         dword ptr [ebp-8],0
>0060250C    je          0060266A
 00602512    xor         eax,eax
 00602514    push        ebp
 00602515    push        602663
 0060251A    push        dword ptr fs:[eax]
 0060251D    mov         dword ptr fs:[eax],esp
 00602520    lea         eax,[ebp-27C]
 00602526    lea         edx,[ebp-218]
 0060252C    mov         ecx,0F8
 00602531    call        @UStrFromWArray
 00602536    mov         eax,dword ptr [ebp-27C]
 0060253C    mov         edx,602D18;'Nintendo RVL-CNT-01'
 00602541    call        @UStrEqual
>00602546    je          0060259C
 00602548    lea         eax,[ebp-280]
 0060254E    lea         edx,[ebp-218]
 00602554    mov         ecx,0F8
 00602559    call        @UStrFromWArray
 0060255E    mov         eax,dword ptr [ebp-280]
 00602564    mov         edx,602D4C;'Nintendo RVL-WBC-01'
 00602569    call        @UStrEqual
>0060256E    je          0060259C
 00602570    lea         eax,[ebp-284]
 00602576    lea         edx,[ebp-218]
 0060257C    mov         ecx,0F8
 00602581    call        @UStrFromWArray
 00602586    mov         eax,dword ptr [ebp-284]
 0060258C    mov         edx,602DD0;'BD Remote Control'
 00602591    call        @UStrEqual
>00602596    jne         0060261F
 0060259C    lea         edx,[ebp-28C]
 006025A2    lea         eax,[ebp-258]
 006025A8    call        00602118
 006025AD    mov         ecx,dword ptr [ebp-28C]
 006025B3    lea         eax,[ebp-288]
 006025B9    mov         edx,602E00;'    found '
 006025BE    call        @UStrCat3
 006025C3    mov         edx,dword ptr [ebp-288]
 006025C9    mov         eax,dword ptr [ebp-4]
 006025CC    call        00602090
 006025D1    mov         esi,78BD1D
 006025D6    lea         edi,[ebp-268]
 006025DC    movs        dword ptr [edi],dword ptr [esi]
 006025DD    movs        dword ptr [edi],dword ptr [esi]
 006025DE    movs        dword ptr [edi],dword ptr [esi]
 006025DF    movs        dword ptr [edi],dword ptr [esi]
 006025E0    cmp         dword ptr [ebp-240],0
>006025E7    je          0060260C
 006025E9    cmp         dword ptr [ebp-244],0
>006025F0    jne         0060260C
 006025F2    mov         edx,602E24;'    Removing remembered unconnected wiimote!!!!'
 006025F7    mov         eax,dword ptr [ebp-4]
 006025FA    call        00602090
 006025FF    lea         eax,[ebp-250]
 00602605    push        eax
 00602606    call        dword ptr ds:[81782C]
 0060260C    mov         eax,dword ptr [ebp-4]
 0060260F    cmp         byte ptr [eax+0D],0;TAutoBluetoothThread.FTerminated:Boolean
>00602613    je          0060261F
 00602615    call        @TryFinallyExit
>0060261A    jmp         00602C47
 0060261F    lea         eax,[ebp-258]
 00602625    push        eax
 00602626    mov         eax,dword ptr [ebp-8]
 00602629    push        eax
 0060262A    call        dword ptr ds:[817824]
 00602630    test        eax,eax
>00602632    je          0060264B
 00602634    mov         eax,dword ptr [ebp-4]
 00602637    cmp         byte ptr [eax+0D],0;TAutoBluetoothThread.FTerminated:Boolean
>0060263B    je          00602520
 00602641    call        @TryFinallyExit
>00602646    jmp         00602C47
 0060264B    xor         eax,eax
 0060264D    pop         edx
 0060264E    pop         ecx
 0060264F    pop         ecx
 00602650    mov         dword ptr fs:[eax],edx
 00602653    push        60266A
 00602658    mov         eax,dword ptr [ebp-8]
 0060265B    push        eax
 0060265C    call        dword ptr ds:[817828]
 00602662    ret
>00602663    jmp         @HandleFinally
>00602668    jmp         00602658
 0060266A    mov         eax,dword ptr [ebp-4]
 0060266D    cmp         byte ptr [eax+0D],0;TAutoBluetoothThread.FTerminated:Boolean
>00602671    jne         00602C47
 00602677    mov         dword ptr [ebp-24],0FFFFFFFF
 0060267E    mov         dword ptr [ebp-20],0FFFFFFFF
 00602685    mov         dword ptr [ebp-1C],0FFFFFFFF
 0060268C    xor         eax,eax
 0060268E    mov         dword ptr [ebp-18],eax
 00602691    mov         dword ptr [ebp-14],0FFFFFFFF
 00602698    mov         eax,dword ptr [ebp-4]
 0060269B    movzx       eax,byte ptr [eax+48];TAutoBluetoothThread.FastScanTime:Integer
 0060269F    mov         byte ptr [ebp-10],al
 006026A2    xor         eax,eax
 006026A4    mov         dword ptr [ebp-0C],eax
 006026A7    mov         dword ptr [ebp-258],230
 006026B1    mov         edx,602E90;'  Proper scan fast'
 006026B6    mov         eax,dword ptr [ebp-4]
 006026B9    call        00602090
 006026BE    lea         eax,[ebp-258]
 006026C4    push        eax
 006026C5    lea         eax,[ebp-28]
 006026C8    push        eax
 006026C9    call        dword ptr ds:[817820]
 006026CF    mov         dword ptr [ebp-8],eax
 006026D2    mov         eax,dword ptr [ebp-4]
 006026D5    cmp         byte ptr [eax+0D],0;TAutoBluetoothThread.FTerminated:Boolean
>006026D9    jne         00602C47
 006026DF    cmp         dword ptr [ebp-8],0
>006026E3    je          0060292C
 006026E9    xor         eax,eax
 006026EB    push        ebp
 006026EC    push        602925
 006026F1    push        dword ptr fs:[eax]
 006026F4    mov         dword ptr fs:[eax],esp
 006026F7    lea         eax,[ebp-290]
 006026FD    lea         edx,[ebp-218]
 00602703    mov         ecx,0F8
 00602708    call        @UStrFromWArray
 0060270D    mov         eax,dword ptr [ebp-290]
 00602713    mov         edx,602D18;'Nintendo RVL-CNT-01'
 00602718    call        @UStrEqual
>0060271D    je          00602773
 0060271F    lea         eax,[ebp-294]
 00602725    lea         edx,[ebp-218]
 0060272B    mov         ecx,0F8
 00602730    call        @UStrFromWArray
 00602735    mov         eax,dword ptr [ebp-294]
 0060273B    mov         edx,602D4C;'Nintendo RVL-WBC-01'
 00602740    call        @UStrEqual
>00602745    je          00602773
 00602747    lea         eax,[ebp-298]
 0060274D    lea         edx,[ebp-218]
 00602753    mov         ecx,0F8
 00602758    call        @UStrFromWArray
 0060275D    mov         eax,dword ptr [ebp-298]
 00602763    mov         edx,602DD0;'BD Remote Control'
 00602768    call        @UStrEqual
>0060276D    jne         006027F8
 00602773    mov         esi,78BD1D
 00602778    lea         edi,[ebp-268]
 0060277E    movs        dword ptr [edi],dword ptr [esi]
 0060277F    movs        dword ptr [edi],dword ptr [esi]
 00602780    movs        dword ptr [edi],dword ptr [esi]
 00602781    movs        dword ptr [edi],dword ptr [esi]
 00602782    cmp         dword ptr [ebp-240],0
>00602789    je          00602794
 0060278B    cmp         dword ptr [ebp-244],0
>00602792    jne         006027E1
 00602794    lea         edx,[ebp-2A0]
 0060279A    lea         eax,[ebp-258]
 006027A0    call        00602118
 006027A5    mov         ecx,dword ptr [ebp-2A0]
 006027AB    lea         eax,[ebp-29C]
 006027B1    mov         edx,602EC4;'    connecting to '
 006027B6    call        @UStrCat3
 006027BB    mov         edx,dword ptr [ebp-29C]
 006027C1    mov         eax,dword ptr [ebp-4]
 006027C4    call        00602090
 006027C9    push        1
 006027CB    lea         eax,[ebp-268]
 006027D1    push        eax
 006027D2    lea         eax,[ebp-258]
 006027D8    push        eax
 006027D9    push        0
 006027DB    call        dword ptr ds:[817830]
 006027E1    mov         eax,dword ptr [ebp-4]
 006027E4    cmp         byte ptr [eax+0D],0;TAutoBluetoothThread.FTerminated:Boolean
>006027E8    je          006028E1
 006027EE    call        @TryFinallyExit
>006027F3    jmp         00602C47
 006027F8    lea         eax,[ebp-2A4]
 006027FE    lea         edx,[ebp-218]
 00602804    mov         ecx,0F8
 00602809    call        @UStrFromWArray
 0060280E    cmp         dword ptr [ebp-2A4],0
>00602815    jne         006028E1
 0060281B    lea         edx,[ebp-2AC]
 00602821    lea         eax,[ebp-258]
 00602827    call        00602118
 0060282C    mov         ecx,dword ptr [ebp-2AC]
 00602832    lea         eax,[ebp-2A8]
 00602838    mov         edx,602E00;'    found '
 0060283D    call        @UStrCat3
 00602842    mov         edx,dword ptr [ebp-2A8]
 00602848    mov         eax,dword ptr [ebp-4]
 0060284B    call        00602090
 00602850    cmp         dword ptr [ebp-248],2504
>0060285A    jne         006028E1
 00602860    mov         esi,78BD1D
 00602865    lea         edi,[ebp-268]
 0060286B    movs        dword ptr [edi],dword ptr [esi]
 0060286C    movs        dword ptr [edi],dword ptr [esi]
 0060286D    movs        dword ptr [edi],dword ptr [esi]
 0060286E    movs        dword ptr [edi],dword ptr [esi]
 0060286F    cmp         dword ptr [ebp-240],0
>00602876    je          00602881
 00602878    cmp         dword ptr [ebp-244],0
>0060287F    jne         006028CE
 00602881    lea         edx,[ebp-2B4]
 00602887    lea         eax,[ebp-258]
 0060288D    call        00602118
 00602892    mov         ecx,dword ptr [ebp-2B4]
 00602898    lea         eax,[ebp-2B0]
 0060289E    mov         edx,602EC4;'    connecting to '
 006028A3    call        @UStrCat3
 006028A8    mov         edx,dword ptr [ebp-2B0]
 006028AE    mov         eax,dword ptr [ebp-4]
 006028B1    call        00602090
 006028B6    push        1
 006028B8    lea         eax,[ebp-268]
 006028BE    push        eax
 006028BF    lea         eax,[ebp-258]
 006028C5    push        eax
 006028C6    push        0
 006028C8    call        dword ptr ds:[817830]
 006028CE    mov         eax,dword ptr [ebp-4]
 006028D1    cmp         byte ptr [eax+0D],0;TAutoBluetoothThread.FTerminated:Boolean
>006028D5    je          006028E1
 006028D7    call        @TryFinallyExit
>006028DC    jmp         00602C47
 006028E1    lea         eax,[ebp-258]
 006028E7    push        eax
 006028E8    mov         eax,dword ptr [ebp-8]
 006028EB    push        eax
 006028EC    call        dword ptr ds:[817824]
 006028F2    test        eax,eax
>006028F4    je          0060290D
 006028F6    mov         eax,dword ptr [ebp-4]
 006028F9    cmp         byte ptr [eax+0D],0;TAutoBluetoothThread.FTerminated:Boolean
>006028FD    je          006026F7
 00602903    call        @TryFinallyExit
>00602908    jmp         00602C47
 0060290D    xor         eax,eax
 0060290F    pop         edx
 00602910    pop         ecx
 00602911    pop         ecx
 00602912    mov         dword ptr fs:[eax],edx
 00602915    push        60292C
 0060291A    mov         eax,dword ptr [ebp-8]
 0060291D    push        eax
 0060291E    call        dword ptr ds:[817828]
 00602924    ret
>00602925    jmp         @HandleFinally
>0060292A    jmp         0060291A
 0060292C    mov         eax,dword ptr [ebp-4]
 0060292F    cmp         byte ptr [eax+0D],0;TAutoBluetoothThread.FTerminated:Boolean
>00602933    jne         00602C47
 00602939    mov         dword ptr [ebp-24],0FFFFFFFF
 00602940    mov         dword ptr [ebp-20],0FFFFFFFF
 00602947    mov         dword ptr [ebp-1C],0FFFFFFFF
 0060294E    xor         eax,eax
 00602950    mov         dword ptr [ebp-18],eax
 00602953    mov         dword ptr [ebp-14],0FFFFFFFF
 0060295A    mov         eax,dword ptr [ebp-4]
 0060295D    movzx       eax,byte ptr [eax+4C];TAutoBluetoothThread.SlowScanTime:Integer
 00602961    mov         byte ptr [ebp-10],al
 00602964    xor         eax,eax
 00602966    mov         dword ptr [ebp-0C],eax
 00602969    mov         dword ptr [ebp-258],230
 00602973    mov         edx,602EF8;'  Proper scan slow'
 00602978    mov         eax,dword ptr [ebp-4]
 0060297B    call        00602090
 00602980    lea         eax,[ebp-258]
 00602986    push        eax
 00602987    lea         eax,[ebp-28]
 0060298A    push        eax
 0060298B    call        dword ptr ds:[817820]
 00602991    mov         dword ptr [ebp-8],eax
 00602994    mov         eax,dword ptr [ebp-4]
 00602997    cmp         byte ptr [eax+0D],0;TAutoBluetoothThread.FTerminated:Boolean
>0060299B    jne         00602C47
 006029A1    cmp         dword ptr [ebp-8],0
>006029A5    je          00602C19
 006029AB    xor         eax,eax
 006029AD    push        ebp
 006029AE    push        602C12
 006029B3    push        dword ptr fs:[eax]
 006029B6    mov         dword ptr fs:[eax],esp
 006029B9    lea         eax,[ebp-2B8]
 006029BF    lea         edx,[ebp-218]
 006029C5    mov         ecx,0F8
 006029CA    call        @UStrFromWArray
 006029CF    mov         eax,dword ptr [ebp-2B8]
 006029D5    mov         edx,602D18;'Nintendo RVL-CNT-01'
 006029DA    call        @UStrEqual
>006029DF    je          00602A35
 006029E1    lea         eax,[ebp-2BC]
 006029E7    lea         edx,[ebp-218]
 006029ED    mov         ecx,0F8
 006029F2    call        @UStrFromWArray
 006029F7    mov         eax,dword ptr [ebp-2BC]
 006029FD    mov         edx,602D4C;'Nintendo RVL-WBC-01'
 00602A02    call        @UStrEqual
>00602A07    je          00602A35
 00602A09    lea         eax,[ebp-2C0]
 00602A0F    lea         edx,[ebp-218]
 00602A15    mov         ecx,0F8
 00602A1A    call        @UStrFromWArray
 00602A1F    mov         eax,dword ptr [ebp-2C0]
 00602A25    mov         edx,602DD0;'BD Remote Control'
 00602A2A    call        @UStrEqual
>00602A2F    jne         00602AEF
 00602A35    lea         edx,[ebp-2C8]
 00602A3B    lea         eax,[ebp-258]
 00602A41    call        00602118
 00602A46    mov         ecx,dword ptr [ebp-2C8]
 00602A4C    lea         eax,[ebp-2C4]
 00602A52    mov         edx,602E00;'    found '
 00602A57    call        @UStrCat3
 00602A5C    mov         edx,dword ptr [ebp-2C4]
 00602A62    mov         eax,dword ptr [ebp-4]
 00602A65    call        00602090
 00602A6A    mov         esi,78BD1D
 00602A6F    lea         edi,[ebp-268]
 00602A75    movs        dword ptr [edi],dword ptr [esi]
 00602A76    movs        dword ptr [edi],dword ptr [esi]
 00602A77    movs        dword ptr [edi],dword ptr [esi]
 00602A78    movs        dword ptr [edi],dword ptr [esi]
 00602A79    cmp         dword ptr [ebp-240],0
>00602A80    je          00602A8B
 00602A82    cmp         dword ptr [ebp-244],0
>00602A89    jne         00602AD8
 00602A8B    lea         edx,[ebp-2D0]
 00602A91    lea         eax,[ebp-258]
 00602A97    call        00602118
 00602A9C    mov         ecx,dword ptr [ebp-2D0]
 00602AA2    lea         eax,[ebp-2CC]
 00602AA8    mov         edx,602EC4;'    connecting to '
 00602AAD    call        @UStrCat3
 00602AB2    mov         edx,dword ptr [ebp-2CC]
 00602AB8    mov         eax,dword ptr [ebp-4]
 00602ABB    call        00602090
 00602AC0    push        1
 00602AC2    lea         eax,[ebp-268]
 00602AC8    push        eax
 00602AC9    lea         eax,[ebp-258]
 00602ACF    push        eax
 00602AD0    push        0
 00602AD2    call        dword ptr ds:[817830]
 00602AD8    mov         eax,dword ptr [ebp-4]
 00602ADB    cmp         byte ptr [eax+0D],0;TAutoBluetoothThread.FTerminated:Boolean
>00602ADF    je          00602BD1
 00602AE5    call        @TryFinallyExit
>00602AEA    jmp         00602C47
 00602AEF    lea         eax,[ebp-2D4]
 00602AF5    lea         edx,[ebp-218]
 00602AFB    mov         ecx,0F8
 00602B00    call        @UStrFromWArray
 00602B05    cmp         dword ptr [ebp-2D4],0
>00602B0C    jne         00602BD1
 00602B12    lea         edx,[ebp-2DC]
 00602B18    lea         eax,[ebp-258]
 00602B1E    call        00602118
 00602B23    mov         ecx,dword ptr [ebp-2DC]
 00602B29    lea         eax,[ebp-2D8]
 00602B2F    mov         edx,602E00;'    found '
 00602B34    call        @UStrCat3
 00602B39    mov         edx,dword ptr [ebp-2D8]
 00602B3F    mov         eax,dword ptr [ebp-4]
 00602B42    call        00602090
 00602B47    cmp         dword ptr [ebp-248],2504
>00602B51    jne         00602BD1
 00602B53    mov         esi,78BD1D
 00602B58    lea         edi,[ebp-268]
 00602B5E    movs        dword ptr [edi],dword ptr [esi]
 00602B5F    movs        dword ptr [edi],dword ptr [esi]
 00602B60    movs        dword ptr [edi],dword ptr [esi]
 00602B61    movs        dword ptr [edi],dword ptr [esi]
 00602B62    cmp         dword ptr [ebp-240],0
>00602B69    je          00602B74
 00602B6B    cmp         dword ptr [ebp-244],0
>00602B72    jne         00602BC1
 00602B74    lea         edx,[ebp-2E4]
 00602B7A    lea         eax,[ebp-258]
 00602B80    call        00602118
 00602B85    mov         ecx,dword ptr [ebp-2E4]
 00602B8B    lea         eax,[ebp-2E0]
 00602B91    mov         edx,602EC4;'    connecting to '
 00602B96    call        @UStrCat3
 00602B9B    mov         edx,dword ptr [ebp-2E0]
 00602BA1    mov         eax,dword ptr [ebp-4]
 00602BA4    call        00602090
 00602BA9    push        1
 00602BAB    lea         eax,[ebp-268]
 00602BB1    push        eax
 00602BB2    lea         eax,[ebp-258]
 00602BB8    push        eax
 00602BB9    push        0
 00602BBB    call        dword ptr ds:[817830]
 00602BC1    mov         eax,dword ptr [ebp-4]
 00602BC4    cmp         byte ptr [eax+0D],0;TAutoBluetoothThread.FTerminated:Boolean
>00602BC8    je          00602BD1
 00602BCA    call        @TryFinallyExit
>00602BCF    jmp         00602C47
 00602BD1    lea         eax,[ebp-258]
 00602BD7    push        eax
 00602BD8    mov         eax,dword ptr [ebp-8]
 00602BDB    push        eax
 00602BDC    call        dword ptr ds:[817824]
 00602BE2    test        eax,eax
>00602BE4    je          00602BFA
 00602BE6    mov         eax,dword ptr [ebp-4]
 00602BE9    cmp         byte ptr [eax+0D],0;TAutoBluetoothThread.FTerminated:Boolean
>00602BED    je          006029B9
 00602BF3    call        @TryFinallyExit
>00602BF8    jmp         00602C47
 00602BFA    xor         eax,eax
 00602BFC    pop         edx
 00602BFD    pop         ecx
 00602BFE    pop         ecx
 00602BFF    mov         dword ptr fs:[eax],edx
 00602C02    push        602C19
 00602C07    mov         eax,dword ptr [ebp-8]
 00602C0A    push        eax
 00602C0B    call        dword ptr ds:[817828]
 00602C11    ret
>00602C12    jmp         @HandleFinally
>00602C17    jmp         00602C07
 00602C19    mov         eax,dword ptr [ebp-4]
 00602C1C    cmp         byte ptr [eax+0D],0;TAutoBluetoothThread.FTerminated:Boolean
>00602C20    jne         00602C47
 00602C22    mov         edx,602F2C;'waiting 20 seconds....'
 00602C27    mov         eax,dword ptr [ebp-4]
 00602C2A    call        00602090
 00602C2F    mov         eax,dword ptr [ebp-4]
 00602C32    mov         eax,dword ptr [eax+40];TAutoBluetoothThread.TimeBetweenScans:Integer
 00602C35    call        TThread.Sleep
 00602C3A    mov         eax,dword ptr [ebp-4]
 00602C3D    cmp         byte ptr [eax+0D],0;TAutoBluetoothThread.FTerminated:Boolean
>00602C41    je          006022A7
 00602C47    xor         eax,eax
 00602C49    pop         edx
 00602C4A    pop         ecx
 00602C4B    pop         ecx
 00602C4C    mov         dword ptr fs:[eax],edx
 00602C4F    push        602C6C
 00602C54    lea         eax,[ebp-2E4]
 00602C5A    mov         edx,1F
 00602C5F    call        @UStrArrayClr
 00602C64    ret
>00602C65    jmp         @HandleFinally
>00602C6A    jmp         00602C54
 00602C6C    pop         edi
 00602C6D    pop         esi
 00602C6E    mov         esp,ebp
 00602C70    pop         ebp
 00602C71    ret
*}
end;

Initialization
//00781B80
{*
 00781B80    sub         dword ptr ds:[817834],1;gvar_00817834
>00781B87    jae         00781BB1
 00781B89    call        00601134
 00781B8E    cmp         byte ptr ds:[78BD2D],0;gvar_0078BD2D
>00781B95    je          00781BA0
 00781B97    xor         eax,eax
 00781B99    mov         [00817838],eax;gvar_00817838:TAutoBluetoothThread
>00781B9E    jmp         00781BB1
 00781BA0    mov         dl,1
 00781BA2    mov         eax,[00600C8C];TAutoBluetoothThread
 00781BA7    call        TAutoBluetoothThread.Create;TAutoBluetoothThread.Create
 00781BAC    mov         [00817838],eax;gvar_00817838:TAutoBluetoothThread
 00781BB1    ret
*}
Finalization
end.