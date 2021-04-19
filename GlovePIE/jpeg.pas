//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit jpeg;

interface

uses
  SysUtils, Classes, jpeg, Graphics;

type
  TJPEGData = class(TSharedImage)
  published
    destructor Destroy();//00558AF4
  public
    FData:TCustomMemoryStream;//f8
    FHeight:Integer;//fC
    FWidth:Integer;//f10
    FGrayscale:Boolean;//f14
    destructor Destroy(); virtual;//00558AF4
    procedure FreeHandle; virtual;//v0//00558B24
  end;
  TJPEGPerformance = (jpBestQuality, jpBestSpeed);
  TJPEGScale = (jsFullSize, jsHalf, jsQuarter, jsEighth);
  TJPEGPixelFormat = (jf24Bit, jf8Bit);
  TJPEGImage = class(TGraphic)
  published
    procedure LoadFromStream(Stream:TStream);//00559C14
    procedure Assign(Source:TPersistent);//00558BE8
    procedure SaveToStream(Stream:TStream);//00559E14
    procedure SaveToClipboardFormat(var AFormat:Word; var AData:Cardinal; var APalette:HPALETTE);//00559DEC
    procedure LoadFromClipboardFormat(AFormat:Word; AData:Cardinal; APalette:HPALETTE);//00559BEC
    destructor Destroy();//00558BA4
    constructor Create();//00558B28
    procedure Compress;//0055905C
    procedure JPEGNeeded;//00559BDC
    procedure DIBNeeded;//005593D8
  public
    FImage:TJPEGData;//f28
    FBitmap:TBitmap;//f2C
    FScaledWidth:Integer;//f30
    FScaledHeight:Integer;//f34
    FTempPal:HPALETTE;//f38
    FSmoothing:Boolean;//f3C
    FGrayScale:Boolean;//f3D
    FPixelFormat:TJPEGPixelFormat;//f3E
    FQuality:TJPEGQualityRange;//f3F
    FProgressiveDisplay:Boolean;//f40
    FProgressiveEncoding:Boolean;//f41
    FPerformance:TJPEGPerformance;//f42
    FScale:TJPEGScale;//f43
    FNeedRecalc:Boolean;//f44
    destructor Destroy(); virtual;//00558BA4
    procedure AssignTo(Dest:TPersistent); virtual;//v0//00558C68
    procedure Assign(Source:TPersistent); virtual;//v8//00558BE8
    procedure Changed(Sender:TObject); virtual;//v10//00559054
    procedure Draw(ACanvas:TCanvas; const Rect:TRect); virtual;//v14//005593E0
    function Equals(Graphic:TGraphic):Boolean; virtual;//v1C//00559404
    function GetEmpty:Boolean; virtual;//v20//00559AD8
    function GetHeight:Integer; virtual;//v24//00559B84
    function GetPalette:HPALETTE; virtual;//v28//00559B1C
    function GetWidth:Integer; virtual;//v30//00559BB0
    procedure ReadData(Stream:TStream); virtual;//v34//00559C80
    procedure SetHeight(Value:Integer); virtual;//v38//00559E64
    procedure SetPalette(Value:HPALETTE); virtual;//v3C//00559EAC
    procedure SetWidth(Value:Integer); virtual;//v44//00559FA0
    procedure WriteData(Stream:TStream); virtual;//v48//00559FE8
    constructor Create(); virtual;//v50//00558B28
    procedure LoadFromStream(Stream:TStream); virtual;//v5C//00559C14
    procedure SaveToStream(Stream:TStream); virtual;//v60//00559E14
    procedure LoadFromClipboardFormat(AFormat:Word; AData:Cardinal; APalette:HPALETTE); virtual;//v64//00559BEC
    procedure SaveToClipboardFormat(var AFormat:Word; var AData:Cardinal; var APalette:HPALETTE); virtual;//v68//00559DEC
    procedure CalcOutputDimensions;//00558FC8
    procedure FreeBitmap;//0055944C
    function GetBitmap:TBitmap;//005595EC
    function GetGrayscale:Boolean;//00559B04
    procedure NewBitmap;//00559C38
    procedure NewImage;//00559C54
    procedure ReadStream(Size:LongInt; Stream:TStream);//00559CA8
    procedure SetGrayscale(Value:Boolean);//00559E3C
    procedure SetPerformance(Value:TJPEGPerformance);//00559F04
    procedure SetPixelFormat(Value:TJPEGPixelFormat);//00559F2C
    procedure SetScale(Value:TJPEGScale);//00559F54
    procedure SetSmoothing(Value:Boolean);//00559F7C
  end;
  EJPEG = class(EInvalidGraphic)
  end;
    function _malloc(size:Integer):Pointer; cdecl;//00558924
    procedure _free(P:Pointer); cdecl;//00558934
    procedure _memset(P:Pointer; B:Byte; count:Integer); cdecl;//00558944
    procedure _memcpy(dest:Pointer; source:Pointer; count:Integer); cdecl;//00558958
    function _fread(var buf:void ; recsize:Integer; reccount:Integer; S:TStream):Integer; cdecl;//0055896C
    function _fwrite(const buf:void ; recsize:Integer; reccount:Integer; S:TStream):Integer; cdecl;//00558988
    function _fflush(S:TStream):Integer; cdecl;//005589A4
    function __ftol:Integer;//005589AC
    procedure InvalidOperation(const Msg:UnicodeString);//00558A4C
    procedure JpegError(cinfo:j_common_ptr);//00558A64
    procedure ResetErrorMgr(cinfo:j_common_ptr);//00558AE4
    procedure FreeHandle;//00558B24
    procedure AssignTo(Dest:TPersistent);//00558C68
    procedure ProgressCallback(const cinfo:jpeg_common_struct);//00558CA0
    procedure ReleaseContext(var jc:TJPEGContext);//00558D94
    procedure InitDecompressor(Obj:TJPEGImage; var jc:TJPEGContext);//00558DB8
    procedure Changed(Sender:TObject);//00559054
    procedure Draw(ACanvas:TCanvas; const Rect:TRect);//005593E0
    function Equals(Graphic:TGraphic):Boolean;//00559404
    function BuildPalette(const cinfo:jpeg_decompress_struct):HPALETTE;//00559460
    procedure BuildColorMap(var cinfo:jpeg_decompress_struct; P:HPALETTE);//0055950C
    function CMYKToRGB(const Color:TRGBQuad):TRGBQuad;//00559598
    function GetEmpty:Boolean;//00559AD8
    function GetPalette:HPALETTE;//00559B1C
    function GetHeight:Integer;//00559B84
    function GetWidth:Integer;//00559BB0
    procedure ReadData(Stream:TStream);//00559C80
    procedure SetHeight(Value:Integer);//00559E64
    procedure SetPalette(Value:HPALETTE);//00559EAC
    procedure SetWidth(Value:Integer);//00559FA0
    procedure WriteData(Stream:TStream);//00559FE8
    procedure InitDefaults;//0055A034
    procedure jpeg_CreateDecompress(var cinfo:jpeg_decompress_struct; version:Integer; structsize:Integer);//0055A074
    procedure jpeg_destroy_decompress(var cinfo:jpeg_decompress_struct);//0055A144
    //procedure sub_0055A154(?:?);//0055A154
    procedure jpeg_read_header(var cinfo:jpeg_decompress_struct; RequireImage:LongBool);//0055A33C
    function jpeg_consume_input(var cinfo:jpeg_decompress_struct):Integer;//0055A3A8
    function jpeg_has_multiple_scans(var cinfo:jpeg_decompress_struct):LongBool;//0055A488
    function jpeg_finish_decompress(var cinfo:jpeg_decompress_struct):LongBool;//0055A4BC
    procedure ;//0055A56C
    procedure @jinit_memory_mgr;//0055B098
    procedure @jpeg_get_small;//0055B18C
    procedure @jpeg_free_small;//0055B194
    procedure @jpeg_get_large;//0055B19C
    procedure @jpeg_free_large;//0055B1A4
    procedure @jpeg_mem_available;//0055B1AC
    procedure @jpeg_open_backing_store;//0055B1B8
    procedure @jpeg_mem_init;//0055B1C8
    procedure @jpeg_mem_term;//0055B1CC
    procedure ;//0055B1D0
    procedure @jinit_input_controller;//0055B6EC
    procedure ;//0055B734
    procedure jpeg_stdio_src(var cinfo:jpeg_decompress_struct; input_file:TStream);//0055B7E0
    function jpeg_start_decompress(var cinfo:jpeg_decompress_struct):LongBool;//0055B84C
    //function sub_0055B914(?:?):?;//0055B914
    function jpeg_read_scanlines(var cinfo:jpeg_decompress_struct; scanlines:JSAMPARRAY; max_lines:Cardinal):Cardinal;//0055B9D4
    function jpeg_start_output(var cinfo:jpeg_decompress_struct; scan_number:Integer):LongBool;//0055BB10
    function jpeg_finish_output(var cinfo:jpeg_decompress_struct):LongBool;//0055BB70
    procedure ;//0055BBF8
    procedure jpeg_calc_output_dimensions(var cinfo:jpeg_decompress_struct);//0055BC88
    //procedure sub_0055BE74(?:?);//0055BE74
    //procedure sub_0055BF10(?:?);//0055BF10
    procedure @jinit_master_decompress;//0055C300
    procedure ;//0055C338
    procedure @jinit_phuff_decoder;//0055CFEC
    procedure ;//0055D060
    procedure @jpeg_make_d_derived_tbl;//0055D198
    procedure @jpeg_fill_bit_buffer;//0055D494
    procedure @jpeg_huff_decode;//0055D5E0
    procedure @jinit_huff_decoder;//0055DBAC
    procedure ;//0055DBEC
    procedure @jinit_merged_upsampler;//0055E158
    procedure ;//0055E1D8
    procedure @jinit_color_deconverter;//0055E5B4
    procedure ;//0055E780
    //function sub_0055E878(?:?; ?:?; ?:?; ?:?):?;//0055E878
    //procedure sub_0055E89C(?:?; ?:?; ?:?; ?:?);//0055E89C
    //procedure sub_0055E8C0(?:?);//0055E8C0
    //procedure sub_0055EA74(?:?);//0055EA74
    //procedure sub_0055F208(?:?);//0055F208
    procedure @jinit_1pass_quantizer;//0055F334
    procedure ;//0055F3C8
    //procedure sub_005603D0(?:?);//005603D0
    procedure @jinit_2pass_quantizer;//005605A8
    procedure ;//005606C8
    procedure @jinit_d_main_controller;//00560CC0
    procedure ;//00560DA0
    procedure @jinit_d_coef_controller;//00561D1C
    procedure ;//00561E30
    procedure @jinit_d_post_controller;//00562090
    procedure ;//00562124
    procedure @jinit_inverse_dct;//00562378
    procedure ;//005623F4
    procedure @jinit_upsampler;//005628D8
    procedure @jpeg_idct_float;//00562AF0
    procedure @jpeg_idct_ifast;//00562F34
    procedure @jpeg_idct_4x4;//00563368
    procedure @jpeg_idct_2x2;//0056371C
    procedure @jpeg_idct_1x1;//0056390C
    procedure ;//00563948
    //function sub_00564FC0(?:?):?;//00564FC0
    procedure @jpeg_resync_to_restart;//00565510
    //procedure sub_0056560C(?:?);//0056560C
    procedure @jinit_marker_reader;//00565644
    procedure jpeg_save_markers(var cinfo:jpeg_decompress_struct; marker_code:Integer; length_limit:Cardinal);//005656B8
    procedure @jdiv_round_up;//005657A0
    procedure @jround_up;//005657B0
    procedure @jcopy_sample_rows;//005657C8
    procedure @jcopy_block_row;//00565814
    procedure @jzero_far;//00565824
    procedure @jpeg_abort;//00565834
    procedure jpeg_destroy(var cinfo:jpeg_common_struct);//00565874
    procedure @jpeg_alloc_quant_table;//00565894
    procedure @jpeg_alloc_huff_table;//005658AC
    procedure ;//005658C4
    procedure jpeg_stdio_dest(var cinfo:jpeg_compress_struct; output_file:TStream);//00565994
    procedure ;//005659D4
    //procedure sub_00565A8C(?:?; ?:?; ?:?);//00565A8C
    //function sub_00565ABC(?:?):?;//00565ABC
    procedure jpeg_set_quality(var cinfo:jpeg_compress_struct; Quality:Integer; Baseline:LongBool);//00565AF0
    //procedure sub_00565B0C(?:?; ?:?; ?:?; ?:?);//00565B0C
    //procedure sub_00565B94(?:?);//00565B94
    procedure jpeg_set_defaults(var cinfo:jpeg_compress_struct);//00565BEC
    //procedure sub_00565CEC(?:?);//00565CEC
    procedure jpeg_set_colorspace(var cinfo:jpeg_compress_struct; colorspace:J_COLOR_SPACE);//00565D60
    //function sub_00566118(?:?; ?:?; ?:?; ?:?; ?:?; ?:?):?;//00566118
    //function sub_00566140(?:?; ?:?; ?:?; ?:?; ?:?; ?:?):?;//00566140
    //function sub_0056617C(?:?; ?:?; ?:?; ?:?):?;//0056617C
    procedure jpeg_simple_progression(var cinfo:jpeg_compress_struct);//005661C8
    procedure jpeg_start_compress(var cinfo:jpeg_compress_struct; WriteAllTables:LongBool);//005663E0
    function jpeg_write_scanlines(var cinfo:jpeg_compress_struct; scanlines:JSAMPARRAY; max_lines:Cardinal):Cardinal;//00566454
    procedure jpeg_CreateCompress(var cinfo:jpeg_compress_struct; version:Integer; structsize:Integer);//005665C0
    procedure @jpeg_suppress_tables;//00566698
    procedure jpeg_finish_compress(var cinfo:jpeg_compress_struct);//005666E0
    procedure @jinit_compress_master;//005668D4
    procedure ;//00566980
    procedure @jinit_marker_writer;//00567154
    procedure ;//005671A8
    //procedure sub_0056736C(?:?);//0056736C
    procedure @jinit_c_master_control;//00567C10
    procedure ;//00567CD8
    procedure @jinit_c_main_controller;//00567DB0
    procedure ;//00567E34
    //function sub_005681B0(?:?):?;//005681B0
    procedure @jinit_c_prep_controller;//005682C8
    procedure ;//00568370
    procedure @jinit_c_coef_controller;//00568AAC
    procedure ;//00568B74
    procedure @jinit_color_converter;//00568FB0
    procedure ;//005691FC
    procedure @jinit_downsampler;//0056999C
    procedure ;//00569B24
    procedure @jinit_forward_dct;//00569FC0
    procedure ;//0056A03C
    procedure @jinit_phuff_encoder;//0056AACC
    procedure @jpeg_fdct_ifast;//0056AB10
    procedure @jpeg_fdct_float;//0056AD7C
    procedure ;//0056B0A8
    procedure @jpeg_make_c_derived_tbl;//0056B238
    procedure @jpeg_gen_optimal_table;//0056BA48
    procedure @jinit_huff_encoder;//0056BD04

implementation

//00558924
function _malloc(size:Integer):Pointer; cdecl;
begin
{*
 00558924    push        ebp
 00558925    mov         ebp,esp
 00558927    mov         eax,dword ptr [ebp+8]
 0055892A    call        @GetMem
 0055892F    pop         ebp
 00558930    ret
*}
end;

//00558934
procedure _free(P:Pointer); cdecl;
begin
{*
 00558934    push        ebp
 00558935    mov         ebp,esp
 00558937    mov         eax,dword ptr [ebp+8]
 0055893A    call        @FreeMem
 0055893F    pop         ebp
 00558940    ret
*}
end;

//00558944
procedure _memset(P:Pointer; B:Byte; count:Integer); cdecl;
begin
{*
 00558944    push        ebp
 00558945    mov         ebp,esp
 00558947    movzx       ecx,byte ptr [ebp+0C]
 0055894B    mov         eax,dword ptr [ebp+8]
 0055894E    mov         edx,dword ptr [ebp+10]
 00558951    call        @FillChar
 00558956    pop         ebp
 00558957    ret
*}
end;

//00558958
procedure _memcpy(dest:Pointer; source:Pointer; count:Integer); cdecl;
begin
{*
 00558958    push        ebp
 00558959    mov         ebp,esp
 0055895B    mov         edx,dword ptr [ebp+8]
 0055895E    mov         eax,dword ptr [ebp+0C]
 00558961    mov         ecx,dword ptr [ebp+10]
 00558964    call        Move
 00558969    pop         ebp
 0055896A    ret
*}
end;

//0055896C
function _fread(var buf:void ; recsize:Integer; reccount:Integer; S:TStream):Integer; cdecl;
begin
{*
 0055896C    push        ebp
 0055896D    mov         ebp,esp
 0055896F    push        ebx
 00558970    mov         ecx,dword ptr [ebp+0C]
 00558973    imul        ecx,dword ptr [ebp+10]
 00558977    mov         edx,dword ptr [ebp+8]
 0055897A    mov         eax,dword ptr [ebp+14]
 0055897D    mov         ebx,dword ptr [eax]
 0055897F    call        dword ptr [ebx+0C]
 00558982    pop         ebx
 00558983    pop         ebp
 00558984    ret
*}
end;

//00558988
function _fwrite(const buf:void ; recsize:Integer; reccount:Integer; S:TStream):Integer; cdecl;
begin
{*
 00558988    push        ebp
 00558989    mov         ebp,esp
 0055898B    push        ebx
 0055898C    mov         ecx,dword ptr [ebp+0C]
 0055898F    imul        ecx,dword ptr [ebp+10]
 00558993    mov         edx,dword ptr [ebp+8]
 00558996    mov         eax,dword ptr [ebp+14]
 00558999    mov         ebx,dword ptr [eax]
 0055899B    call        dword ptr [ebx+10]
 0055899E    pop         ebx
 0055899F    pop         ebp
 005589A0    ret
*}
end;

//005589A4
function _fflush(S:TStream):Integer; cdecl;
begin
{*
 005589A4    push        ebp
 005589A5    mov         ebp,esp
 005589A7    xor         eax,eax
 005589A9    pop         ebp
 005589AA    ret
*}
end;

//005589AC
function __ftol:Integer;
begin
{*
 005589AC    push        ebp
 005589AD    mov         ebp,esp
 005589AF    add         esp,0FFFFFFF8
 005589B2    lea         eax,[ebp-8]
 005589B5    fstp        qword ptr [eax]
 005589B7    fld         qword ptr [ebp-8]
 005589BA    call        @TRUNC
 005589BF    pop         ecx
 005589C0    pop         ecx
 005589C1    pop         ebp
 005589C2    ret
*}
end;

//00558A4C
procedure InvalidOperation(const Msg:UnicodeString);
begin
{*
 00558A4C    push        ebx
 00558A4D    mov         ebx,eax
 00558A4F    mov         ecx,ebx
 00558A51    mov         dl,1
 00558A53    mov         eax,[0045F278];EInvalidGraphicOperation
 00558A58    call        Exception.Create
 00558A5D    call        @RaiseExcept
 00558A62    pop         ebx
 00558A63    ret
*}
end;

//00558A64
procedure JpegError(cinfo:j_common_ptr);
begin
{*
 00558A64    push        ebp
 00558A65    mov         ebp,esp
 00558A67    add         esp,0FFFFFFF4
 00558A6A    push        ebx
 00558A6B    xor         edx,edx
 00558A6D    mov         dword ptr [ebp-0C],edx
 00558A70    mov         ebx,eax
 00558A72    xor         eax,eax
 00558A74    push        ebp
 00558A75    push        558AC9
 00558A7A    push        dword ptr fs:[eax]
 00558A7D    mov         dword ptr fs:[eax],esp
 00558A80    mov         eax,dword ptr [ebx]
 00558A82    mov         eax,dword ptr [eax+14]
 00558A85    mov         dword ptr [ebp-8],eax
 00558A88    mov         byte ptr [ebp-4],0
 00558A8C    lea         eax,[ebp-8]
 00558A8F    push        eax
 00558A90    push        0
 00558A92    lea         edx,[ebp-0C]
 00558A95    mov         eax,[0078D4C4];^SResString581:TResStringRec
 00558A9A    call        LoadResString
 00558A9F    mov         ecx,dword ptr [ebp-0C]
 00558AA2    mov         dl,1
 00558AA4    mov         eax,[005589C4];EJPEG
 00558AA9    call        Exception.CreateFmt
 00558AAE    call        @RaiseExcept
 00558AB3    xor         eax,eax
 00558AB5    pop         edx
 00558AB6    pop         ecx
 00558AB7    pop         ecx
 00558AB8    mov         dword ptr fs:[eax],edx
 00558ABB    push        558AD0
 00558AC0    lea         eax,[ebp-0C]
 00558AC3    call        @UStrClr
 00558AC8    ret
>00558AC9    jmp         @HandleFinally
>00558ACE    jmp         00558AC0
 00558AD0    pop         ebx
 00558AD1    mov         esp,ebp
 00558AD3    pop         ebp
 00558AD4    ret
*}
end;

//00558AE4
procedure ResetErrorMgr(cinfo:j_common_ptr);
begin
{*
 00558AE4    mov         edx,dword ptr [eax]
 00558AE6    xor         ecx,ecx
 00558AE8    mov         dword ptr [edx+0BC],ecx
 00558AEE    xor         eax,eax
 00558AF0    mov         dword ptr [edx+14],eax
 00558AF3    ret
*}
end;

//00558AF4
destructor TJPEGData.Destroy();
begin
{*
 00558AF4    push        ebx
 00558AF5    push        esi
 00558AF6    call        @BeforeDestruction
 00558AFB    mov         ebx,edx
 00558AFD    mov         esi,eax
 00558AFF    mov         eax,dword ptr [esi+8]
 00558B02    call        TObject.Free
 00558B07    mov         edx,ebx
 00558B09    and         dl,0FC
 00558B0C    mov         eax,esi
 00558B0E    call        TSharedImage.Destroy
 00558B13    test        bl,bl
>00558B15    jle         00558B1E
 00558B17    mov         eax,esi
 00558B19    call        @ClassDestroy
 00558B1E    pop         esi
 00558B1F    pop         ebx
 00558B20    ret
*}
end;

//00558B24
procedure TJPEGData.FreeHandle;
begin
{*
 00558B24    ret
*}
end;

//00558B28
constructor TJPEGImage.Create();
begin
{*
 00558B28    push        ebx
 00558B29    push        esi
 00558B2A    push        edi
 00558B2B    test        dl,dl
>00558B2D    je          00558B37
 00558B2F    add         esp,0FFFFFFF0
 00558B32    call        @ClassCreate
 00558B37    mov         ebx,edx
 00558B39    mov         edi,eax
 00558B3B    mov         esi,788F24
 00558B40    xor         edx,edx
 00558B42    mov         eax,edi
 00558B44    call        TGraphic.Create
 00558B49    mov         eax,edi
 00558B4B    call        TJPEGImage.NewImage
 00558B50    movzx       eax,byte ptr [esi]
 00558B53    mov         byte ptr [edi+3F],al
 00558B56    movzx       eax,byte ptr [esi+1]
 00558B5A    mov         byte ptr [edi+3D],al
 00558B5D    movzx       eax,byte ptr [esi+2]
 00558B61    mov         byte ptr [edi+42],al
 00558B64    movzx       eax,byte ptr [esi+3]
 00558B68    mov         byte ptr [edi+3E],al
 00558B6B    movzx       eax,byte ptr [esi+4]
 00558B6F    mov         byte ptr [edi+40],al
 00558B72    movzx       eax,byte ptr [esi+5]
 00558B76    mov         byte ptr [edi+41],al
 00558B79    movzx       eax,byte ptr [esi+6]
 00558B7D    mov         byte ptr [edi+43],al
 00558B80    movzx       eax,byte ptr [esi+7]
 00558B84    mov         byte ptr [edi+3C],al
 00558B87    mov         eax,edi
 00558B89    test        bl,bl
>00558B8B    je          00558B9C
 00558B8D    call        @AfterConstruction
 00558B92    pop         dword ptr fs:[0]
 00558B99    add         esp,0C
 00558B9C    mov         eax,edi
 00558B9E    pop         edi
 00558B9F    pop         esi
 00558BA0    pop         ebx
 00558BA1    ret
*}
end;

//00558BA4
destructor TJPEGImage.Destroy();
begin
{*
 00558BA4    push        ebx
 00558BA5    push        esi
 00558BA6    call        @BeforeDestruction
 00558BAB    mov         ebx,edx
 00558BAD    mov         esi,eax
 00558BAF    mov         eax,dword ptr [esi+38];TJPEGImage.FTempPal:HPALETTE
 00558BB2    test        eax,eax
>00558BB4    je          00558BBC
 00558BB6    push        eax
 00558BB7    call        gdi32.DeleteObject
 00558BBC    mov         eax,dword ptr [esi+2C];TJPEGImage.FBitmap:TBitmap
 00558BBF    call        TObject.Free
 00558BC4    mov         eax,dword ptr [esi+28];TJPEGImage.FImage:TJPEGData
 00558BC7    call        TSharedImage.Release
 00558BCC    mov         edx,ebx
 00558BCE    and         dl,0FC
 00558BD1    mov         eax,esi
 00558BD3    call        TMemoryStream.Destroy
 00558BD8    test        bl,bl
>00558BDA    jle         00558BE3
 00558BDC    mov         eax,esi
 00558BDE    call        @ClassDestroy
 00558BE3    pop         esi
 00558BE4    pop         ebx
 00558BE5    ret
*}
end;

//00558BE8
procedure TJPEGImage.Assign(Source:TPersistent);
begin
{*
 00558BE8    push        ebx
 00558BE9    push        esi
 00558BEA    push        edi
 00558BEB    mov         esi,edx
 00558BED    mov         ebx,eax
 00558BEF    mov         eax,esi
 00558BF1    mov         edx,dword ptr ds:[5582CC];TJPEGImage
 00558BF7    call        @IsClass
 00558BFC    test        al,al
>00558BFE    je          00558C2D
 00558C00    mov         eax,dword ptr [ebx+28]
 00558C03    call        TSharedImage.Release
 00558C08    mov         edi,esi
 00558C0A    mov         eax,dword ptr [edi+28]
 00558C0D    mov         dword ptr [ebx+28],eax
 00558C10    inc         dword ptr [eax+4]
 00558C13    cmp         dword ptr [edi+2C],0
>00558C17    je          00558C61
 00558C19    mov         eax,ebx
 00558C1B    call        TJPEGImage.NewBitmap
 00558C20    mov         edx,dword ptr [edi+2C]
 00558C23    mov         eax,dword ptr [ebx+2C]
 00558C26    mov         ecx,dword ptr [eax]
 00558C28    call        dword ptr [ecx+8]
>00558C2B    jmp         00558C61
 00558C2D    mov         eax,esi
 00558C2F    mov         edx,dword ptr ds:[463B28];TBitmap
 00558C35    call        @IsClass
 00558C3A    test        al,al
>00558C3C    je          00558C58
 00558C3E    mov         eax,ebx
 00558C40    call        TJPEGImage.NewImage
 00558C45    mov         eax,ebx
 00558C47    call        TJPEGImage.NewBitmap
 00558C4C    mov         edx,esi
 00558C4E    mov         eax,dword ptr [ebx+2C]
 00558C51    mov         ecx,dword ptr [eax]
 00558C53    call        dword ptr [ecx+8]
>00558C56    jmp         00558C61
 00558C58    mov         edx,esi
 00558C5A    mov         eax,ebx
 00558C5C    call        TPersistent.Assign
 00558C61    pop         edi
 00558C62    pop         esi
 00558C63    pop         ebx
 00558C64    ret
*}
end;

//00558C68
procedure TJPEGImage.AssignTo(Dest:TPersistent);
begin
{*
 00558C68    push        ebx
 00558C69    push        esi
 00558C6A    mov         esi,edx
 00558C6C    mov         ebx,eax
 00558C6E    mov         eax,esi
 00558C70    mov         edx,dword ptr ds:[463B28];TBitmap
 00558C76    call        @IsClass
 00558C7B    test        al,al
>00558C7D    je          00558C92
 00558C7F    mov         eax,ebx
 00558C81    call        TJPEGImage.GetBitmap
 00558C86    mov         edx,eax
 00558C88    mov         eax,esi
 00558C8A    mov         ecx,dword ptr [eax]
 00558C8C    call        dword ptr [ecx+8]
 00558C8F    pop         esi
 00558C90    pop         ebx
 00558C91    ret
 00558C92    mov         edx,esi
 00558C94    mov         eax,ebx
 00558C96    call        TPersistent.AssignTo
 00558C9B    pop         esi
 00558C9C    pop         ebx
 00558C9D    ret
*}
end;

//00558CA0
procedure ProgressCallback(const cinfo:jpeg_common_struct);
begin
{*
 00558CA0    push        ebx
 00558CA1    push        esi
 00558CA2    push        edi
 00558CA3    add         esp,0FFFFFFF0
 00558CA6    mov         esi,eax
 00558CA8    mov         eax,dword ptr [esi+8]
 00558CAB    test        eax,eax
>00558CAD    je          00558D86
 00558CB3    cmp         dword ptr [eax+14],0
>00558CB7    je          00558D86
 00558CBD    mov         ebx,eax
 00558CBF    call        kernel32.GetTickCount
 00558CC4    mov         edx,eax
 00558CC6    mov         ecx,edx
 00558CC8    mov         eax,dword ptr [ebx+20]
 00558CCB    sub         ecx,eax
 00558CCD    cmp         ecx,1F4
>00558CD3    jb          00558D86
 00558CD9    mov         dword ptr [ebx+20],edx
 00558CDC    test        eax,eax
>00558CDE    je          00558D86
 00558CE4    cmp         dword ptr [esi+10],0
>00558CE8    je          00558D17
 00558CEA    mov         edi,esi
 00558CEC    mov         eax,dword ptr [edi+8C]
 00558CF2    push        eax
 00558CF3    lea         eax,[esp+4]
 00558CF7    push        eax
 00558CF8    mov         ecx,dword ptr [edi+70]
 00558CFB    mov         edx,dword ptr [ebx+24]
 00558CFE    xor         eax,eax
 00558D00    call        Rect
 00558D05    mov         eax,dword ptr [esp+0C]
 00558D09    cmp         eax,dword ptr [ebx+24]
>00558D0C    jge         00558D29
 00558D0E    mov         eax,dword ptr [edi+74]
 00558D11    mov         dword ptr [esp+0C],eax
>00558D15    jmp         00558D29
 00558D17    push        0
 00558D19    lea         eax,[esp+4]
 00558D1D    push        eax
 00558D1E    xor         ecx,ecx
 00558D20    xor         edx,edx
 00558D22    xor         eax,eax
 00558D24    call        Rect
 00558D29    fild        dword ptr [ebx+4]
 00558D2C    fild        dword ptr [ebx+8]
 00558D2F    fdivp       st(1),st
 00558D31    fild        dword ptr [ebx+0C]
 00558D34    faddp       st(1),st
 00558D36    fmul        dword ptr ds:[558D90]
 00558D3C    fild        dword ptr [ebx+10]
 00558D3F    fdivp       st(1),st
 00558D41    call        @TRUNC
 00558D46    cmp         eax,dword ptr [ebx+1C]
>00558D49    je          00558D86
 00558D4B    mov         dword ptr [ebx+1C],eax
 00558D4E    cmp         dword ptr [esi+10],0
>00558D52    je          00558D5D
 00558D54    mov         edx,dword ptr [esi+8C]
 00558D5A    mov         dword ptr [ebx+24],edx
 00558D5D    push        eax
 00558D5E    mov         eax,dword ptr [esp+10]
 00558D62    sub         eax,dword ptr [esp+8]
 00558D66    cmp         eax,4
 00558D69    setge       al
 00558D6C    push        eax
 00558D6D    lea         eax,[esp+8]
 00558D71    push        eax
 00558D72    push        0
 00558D74    mov         cl,1
 00558D76    mov         esi,dword ptr [ebx+14]
 00558D79    mov         edx,esi
 00558D7B    mov         eax,esi
 00558D7D    mov         si,0FFFD
 00558D81    call        @CallDynaInst
 00558D86    add         esp,10
 00558D89    pop         edi
 00558D8A    pop         esi
 00558D8B    pop         ebx
 00558D8C    ret
*}
end;

//00558D94
procedure ReleaseContext(var jc:TJPEGContext);
begin
{*
 00558D94    push        ebx
 00558D95    mov         ebx,eax
 00558D97    cmp         dword ptr [ebx+108],0
>00558D9E    je          00558DB3
 00558DA0    lea         eax,[ebx+108]
 00558DA6    call        jpeg_destroy
 00558DAB    xor         eax,eax
 00558DAD    mov         dword ptr [ebx+108],eax
 00558DB3    pop         ebx
 00558DB4    ret
*}
end;

//00558DB8
procedure InitDecompressor(Obj:TJPEGImage; var jc:TJPEGContext);
begin
{*
 00558DB8    push        ebp
 00558DB9    mov         ebp,esp
 00558DBB    push        ecx
 00558DBC    push        ebx
 00558DBD    push        esi
 00558DBE    push        edi
 00558DBF    mov         dword ptr [ebp-4],edx
 00558DC2    mov         ebx,eax
 00558DC4    mov         eax,dword ptr [ebp-4]
 00558DC7    xor         ecx,ecx
 00558DC9    mov         edx,2D8
 00558DCE    call        @FillChar
 00558DD3    mov         eax,dword ptr [ebp-4]
 00558DD6    mov         edi,eax
 00558DD8    mov         esi,788F2C;^JpegError
 00558DDD    mov         ecx,35
 00558DE2    rep movs    dword ptr [edi],dword ptr [esi]
 00558DE4    mov         eax,dword ptr [ebp-4]
 00558DE7    mov         edx,dword ptr [ebp-4]
 00558DEA    mov         dword ptr [edx+108],eax
 00558DF0    mov         eax,dword ptr [ebp-4]
 00558DF3    add         eax,108
 00558DF8    mov         ecx,1D0
 00558DFD    mov         edx,3E
 00558E02    call        jpeg_CreateDecompress
 00558E07    xor         eax,eax
 00558E09    push        ebp
 00558E0A    push        558FA8
 00558E0F    push        dword ptr fs:[eax]
 00558E12    mov         dword ptr fs:[eax],esp
 00558E15    mov         eax,dword ptr [ebp-4]
 00558E18    mov         dword ptr [eax+0D4],558CA0;ProgressCallback
 00558E22    mov         eax,dword ptr [ebp-4]
 00558E25    mov         dword ptr [eax+0E8],ebx
 00558E2B    mov         eax,dword ptr [ebp-4]
 00558E2E    add         eax,0D4
 00558E33    mov         edx,dword ptr [ebp-4]
 00558E36    mov         dword ptr [edx+110],eax
 00558E3C    push        0
 00558E3E    push        0
 00558E40    mov         eax,dword ptr [ebx+28]
 00558E43    mov         eax,dword ptr [eax+8]
 00558E46    call        TStream.SetPosition
 00558E4B    mov         eax,dword ptr [ebx+28]
 00558E4E    mov         edx,dword ptr [eax+8]
 00558E51    mov         eax,dword ptr [ebp-4]
 00558E54    add         eax,108
 00558E59    call        jpeg_stdio_src
 00558E5E    mov         eax,dword ptr [ebp-4]
 00558E61    add         eax,108
 00558E66    or          edx,0FFFFFFFF
 00558E69    call        jpeg_read_header
 00558E6E    mov         eax,dword ptr [ebp-4]
 00558E71    mov         dword ptr [eax+138],1
 00558E7B    movzx       ecx,byte ptr [ebx+43]
 00558E7F    mov         eax,1
 00558E84    shl         eax,cl
 00558E86    mov         edx,dword ptr [ebp-4]
 00558E89    mov         dword ptr [edx+13C],eax
 00558E8F    cmp         byte ptr [ebx+3C],1
 00558E93    cmc
 00558E94    sbb         eax,eax
 00558E96    mov         edx,dword ptr [ebp-4]
 00558E99    mov         dword ptr [edx+158],eax
 00558E9F    cmp         byte ptr [ebx+3D],0
>00558EA3    je          00558EB2
 00558EA5    mov         eax,dword ptr [ebp-4]
 00558EA8    mov         dword ptr [eax+134],1
 00558EB2    cmp         byte ptr [ebx+3E],1
>00558EB6    je          00558EC4
 00558EB8    mov         eax,dword ptr [ebp-4]
 00558EBB    cmp         dword ptr [eax+134],1
>00558EC2    jne         00558EDE
 00558EC4    mov         eax,dword ptr [ebp-4]
 00558EC7    mov         dword ptr [eax+15C],0FFFFFFFF
 00558ED1    mov         eax,dword ptr [ebp-4]
 00558ED4    mov         dword ptr [eax+168],0EC
 00558EDE    cmp         byte ptr [ebx+42],1
>00558EE2    jne         00558F09
 00558EE4    mov         eax,dword ptr [ebp-4]
 00558EE7    mov         dword ptr [eax+150],1
 00558EF1    mov         eax,dword ptr [ebp-4]
 00558EF4    xor         edx,edx
 00558EF6    mov         dword ptr [eax+164],edx
 00558EFC    mov         eax,dword ptr [ebp-4]
 00558EFF    mov         dword ptr [eax+160],1
 00558F09    mov         eax,dword ptr [ebp-4]
 00558F0C    mov         eax,dword ptr [eax+150]
 00558F12    mov         edx,dword ptr [ebp-4]
 00558F15    mov         dword ptr [edx+0FC],eax
 00558F1B    mov         eax,dword ptr [ebp-4]
 00558F1E    cmp         dword ptr [eax+164],1
 00558F25    sbb         eax,eax
 00558F27    inc         eax
 00558F28    mov         edx,dword ptr [ebp-4]
 00558F2B    mov         byte ptr [edx+100],al
 00558F31    mov         eax,dword ptr [ebp-4]
 00558F34    mov         eax,dword ptr [eax+160]
 00558F3A    mov         edx,dword ptr [ebp-4]
 00558F3D    mov         dword ptr [edx+104],eax
 00558F43    cmp         byte ptr [ebx+40],0
>00558F47    je          00558F9E
 00558F49    mov         eax,dword ptr [ebp-4]
 00558F4C    add         eax,108
 00558F51    call        jpeg_has_multiple_scans
 00558F56    test        eax,eax
>00558F58    je          00558F9E
 00558F5A    mov         eax,dword ptr [ebp-4]
 00558F5D    mov         eax,dword ptr [eax+164]
 00558F63    mov         edx,dword ptr [ebp-4]
 00558F66    mov         dword ptr [edx+174],eax
 00558F6C    mov         eax,dword ptr [ebp-4]
 00558F6F    mov         dword ptr [eax+150],1
 00558F79    mov         eax,dword ptr [ebp-4]
 00558F7C    xor         edx,edx
 00558F7E    mov         dword ptr [eax+164],edx
 00558F84    mov         eax,dword ptr [ebp-4]
 00558F87    mov         dword ptr [eax+160],1
 00558F91    mov         eax,dword ptr [ebp-4]
 00558F94    mov         dword ptr [eax+148],0FFFFFFFF
 00558F9E    xor         eax,eax
 00558FA0    pop         edx
 00558FA1    pop         ecx
 00558FA2    pop         ecx
 00558FA3    mov         dword ptr fs:[eax],edx
>00558FA6    jmp         00558FBF
>00558FA8    jmp         @HandleAnyException
 00558FAD    mov         eax,dword ptr [ebp-4]
 00558FB0    call        ReleaseContext
 00558FB5    call        @RaiseAgain
 00558FBA    call        @DoneExcept
 00558FBF    pop         edi
 00558FC0    pop         esi
 00558FC1    pop         ebx
 00558FC2    pop         ecx
 00558FC3    pop         ebp
 00558FC4    ret
*}
end;

//00558FC8
procedure TJPEGImage.CalcOutputDimensions;
begin
{*
 00558FC8    push        ebp
 00558FC9    mov         ebp,esp
 00558FCB    add         esp,0FFFFFD28
 00558FD1    push        ebx
 00558FD2    mov         ebx,eax
 00558FD4    cmp         byte ptr [ebx+44],0
>00558FD8    je          0055904E
 00558FDA    lea         edx,[ebp-2D8]
 00558FE0    mov         eax,ebx
 00558FE2    call        InitDecompressor
 00558FE7    xor         eax,eax
 00558FE9    push        ebp
 00558FEA    push        559047
 00558FEF    push        dword ptr fs:[eax]
 00558FF2    mov         dword ptr fs:[eax],esp
 00558FF5    xor         eax,eax
 00558FF7    mov         dword ptr [ebp-1C8],eax
 00558FFD    lea         eax,[ebp-1D0]
 00559003    call        jpeg_calc_output_dimensions
 00559008    mov         eax,dword ptr [ebp-160]
 0055900E    mov         dword ptr [ebx+30],eax
 00559011    mov         eax,dword ptr [ebp-15C]
 00559017    mov         dword ptr [ebx+34],eax
 0055901A    lea         eax,[ebp-1D0]
 00559020    call        jpeg_has_multiple_scans
 00559025    cmp         eax,1
 00559028    sbb         eax,eax
 0055902A    inc         eax
 0055902B    mov         byte ptr [ebx+41],al
 0055902E    xor         eax,eax
 00559030    pop         edx
 00559031    pop         ecx
 00559032    pop         ecx
 00559033    mov         dword ptr fs:[eax],edx
 00559036    push        55904E
 0055903B    lea         eax,[ebp-2D8]
 00559041    call        ReleaseContext
 00559046    ret
>00559047    jmp         @HandleFinally
>0055904C    jmp         0055903B
 0055904E    pop         ebx
 0055904F    mov         esp,ebp
 00559051    pop         ebp
 00559052    ret
*}
end;

//00559054
procedure TJPEGImage.Changed(Sender:TObject);
begin
{*
 00559054    call        TGraphic.Changed
 00559059    ret
*}
end;

//0055905C
procedure TJPEGImage.Compress;
begin
{*
 0055905C    push        ebp
 0055905D    mov         ebp,esp
 0055905F    add         esp,0FFFFFD08
 00559065    push        ebx
 00559066    push        esi
 00559067    push        edi
 00559068    mov         dword ptr [ebp-4],eax
 0055906B    lea         eax,[ebp-2E8]
 00559071    xor         ecx,ecx
 00559073    mov         edx,2D8
 00559078    call        @FillChar
 0055907D    mov         esi,788F2C;^JpegError
 00559082    lea         edi,[ebp-2E8]
 00559088    mov         ecx,35
 0055908D    rep movs    dword ptr [edi],dword ptr [esi]
 0055908F    lea         eax,[ebp-2E8]
 00559095    mov         dword ptr [ebp-1E0],eax
 0055909B    lea         eax,[ebp-1E0]
 005590A1    mov         ecx,174
 005590A6    mov         edx,3E
 005590AB    call        jpeg_CreateCompress
 005590B0    xor         eax,eax
 005590B2    push        ebp
 005590B3    push        5593C8
 005590B8    push        dword ptr fs:[eax]
 005590BB    mov         dword ptr fs:[eax],esp
 005590BE    xor         eax,eax
 005590C0    push        ebp
 005590C1    push        559391
 005590C6    push        dword ptr fs:[eax]
 005590C9    mov         dword ptr fs:[eax],esp
 005590CC    mov         dword ptr [ebp-214],558CA0;ProgressCallback
 005590D6    mov         eax,dword ptr [ebp-4]
 005590D9    mov         dword ptr [ebp-200],eax
 005590DF    lea         eax,[ebp-214]
 005590E5    mov         dword ptr [ebp-1D8],eax
 005590EB    mov         eax,dword ptr [ebp-4]
 005590EE    mov         eax,dword ptr [eax+28]
 005590F1    cmp         dword ptr [eax+8],0
>005590F5    je          005590FF
 005590F7    mov         eax,dword ptr [ebp-4]
 005590FA    call        TJPEGImage.NewImage
 005590FF    mov         dl,1
 00559101    mov         eax,[0043DAFC];TMemoryStream
 00559106    call        TObject.Create
 0055910B    mov         ebx,eax
 0055910D    mov         eax,dword ptr [ebp-4]
 00559110    mov         eax,dword ptr [eax+28]
 00559113    mov         dword ptr [eax+8],ebx
 00559116    push        0
 00559118    push        0
 0055911A    mov         eax,ebx
 0055911C    call        TStream.SetPosition
 00559121    mov         eax,dword ptr [ebp-4]
 00559124    mov         eax,dword ptr [eax+28]
 00559127    mov         edx,dword ptr [eax+8]
 0055912A    lea         eax,[ebp-1E0]
 00559130    call        jpeg_stdio_dest
 00559135    mov         eax,dword ptr [ebp-4]
 00559138    mov         ebx,dword ptr [eax+2C]
 0055913B    test        ebx,ebx
>0055913D    je          00559159
 0055913F    mov         eax,ebx
 00559141    mov         edx,dword ptr [eax]
 00559143    call        dword ptr [edx+30]
 00559146    test        eax,eax
>00559148    je          00559159
 0055914A    mov         eax,dword ptr [ebp-4]
 0055914D    mov         eax,dword ptr [eax+2C]
 00559150    mov         edx,dword ptr [eax]
 00559152    call        dword ptr [edx+24]
 00559155    test        eax,eax
>00559157    jne         0055916B
 00559159    xor         eax,eax
 0055915B    pop         edx
 0055915C    pop         ecx
 0055915D    pop         ecx
 0055915E    mov         dword ptr fs:[eax],edx
 00559161    call        @TryFinallyExit
>00559166    jmp         005593CF
 0055916B    mov         eax,dword ptr [ebp-4]
 0055916E    mov         eax,dword ptr [eax+2C]
 00559171    mov         edx,dword ptr [eax]
 00559173    call        dword ptr [edx+30]
 00559176    mov         dword ptr [ebp-1C4],eax
 0055917C    mov         eax,dword ptr [ebp-4]
 0055917F    mov         eax,dword ptr [eax+2C]
 00559182    mov         edx,dword ptr [eax]
 00559184    call        dword ptr [edx+30]
 00559187    mov         edx,dword ptr [ebp-4]
 0055918A    mov         edx,dword ptr [edx+28]
 0055918D    mov         dword ptr [edx+10],eax
 00559190    mov         eax,dword ptr [ebp-4]
 00559193    mov         eax,dword ptr [eax+2C]
 00559196    mov         edx,dword ptr [eax]
 00559198    call        dword ptr [edx+24]
 0055919B    mov         dword ptr [ebp-1C0],eax
 005591A1    mov         eax,dword ptr [ebp-4]
 005591A4    mov         eax,dword ptr [eax+2C]
 005591A7    mov         edx,dword ptr [eax]
 005591A9    call        dword ptr [edx+24]
 005591AC    mov         edx,dword ptr [ebp-4]
 005591AF    mov         edx,dword ptr [edx+28]
 005591B2    mov         dword ptr [edx+0C],eax
 005591B5    mov         dword ptr [ebp-1BC],3
 005591BF    mov         dword ptr [ebp-1B8],2
 005591C9    mov         dl,1
 005591CB    mov         eax,[00463B28];TBitmap
 005591D0    call        TBitmap.Create
 005591D5    mov         dword ptr [ebp-10],eax
 005591D8    xor         eax,eax
 005591DA    push        ebp
 005591DB    push        559380
 005591E0    push        dword ptr fs:[eax]
 005591E3    mov         dword ptr fs:[eax],esp
 005591E6    mov         eax,dword ptr [ebp-4]
 005591E9    mov         edx,dword ptr [eax+2C]
 005591EC    mov         eax,dword ptr [ebp-10]
 005591EF    mov         ecx,dword ptr [eax]
 005591F1    call        dword ptr [ecx+8]
 005591F4    mov         dl,6
 005591F6    mov         eax,dword ptr [ebp-10]
 005591F9    call        TBitmap.SetPixelFormat
 005591FE    lea         eax,[ebp-1E0]
 00559204    call        jpeg_set_defaults
 00559209    mov         eax,dword ptr [ebp-4]
 0055920C    movzx       edx,byte ptr [eax+3F]
 00559210    lea         eax,[ebp-1E0]
 00559216    or          ecx,0FFFFFFFF
 00559219    call        jpeg_set_quality
 0055921E    mov         eax,dword ptr [ebp-4]
 00559221    cmp         byte ptr [eax+3D],0
>00559225    je          00559241
 00559227    mov         eax,dword ptr [ebp-4]
 0055922A    mov         eax,dword ptr [eax+28]
 0055922D    mov         byte ptr [eax+14],1
 00559231    lea         eax,[ebp-1E0]
 00559237    mov         edx,1
 0055923C    call        jpeg_set_colorspace
 00559241    mov         eax,dword ptr [ebp-4]
 00559244    cmp         byte ptr [eax+41],0
>00559248    je          00559255
 0055924A    lea         eax,[ebp-1E0]
 00559250    call        jpeg_simple_progression
 00559255    xor         edx,edx
 00559257    mov         eax,dword ptr [ebp-10]
 0055925A    call        TBitmap.GetScanline
 0055925F    mov         dword ptr [ebp-0C],eax
 00559262    mov         edx,1
 00559267    mov         eax,dword ptr [ebp-10]
 0055926A    call        TBitmap.GetScanline
 0055926F    mov         ebx,eax
 00559271    sub         ebx,dword ptr [ebp-0C]
 00559274    test        ebx,ebx
>00559276    jle         00559288
 00559278    test        bl,3
>0055927B    jne         00559288
 0055927D    mov         eax,dword ptr [ebp-1C0]
 00559283    mov         dword ptr [ebp-8],eax
>00559286    jmp         0055928F
 00559288    mov         dword ptr [ebp-8],1
 0055928F    push        0
 00559291    push        0
 00559293    push        0
 00559295    lea         eax,[ebp-2F8]
 0055929B    push        eax
 0055929C    xor         ecx,ecx
 0055929E    xor         edx,edx
 005592A0    xor         eax,eax
 005592A2    call        Rect
 005592A7    lea         eax,[ebp-2F8]
 005592AD    push        eax
 005592AE    push        0
 005592B0    xor         ecx,ecx
 005592B2    mov         edx,dword ptr [ebp-4]
 005592B5    mov         eax,dword ptr [ebp-4]
 005592B8    mov         si,0FFFD
 005592BC    call        @CallDynaInst
 005592C1    xor         eax,eax
 005592C3    push        ebp
 005592C4    push        559363
 005592C9    push        dword ptr fs:[eax]
 005592CC    mov         dword ptr fs:[eax],esp
 005592CF    lea         eax,[ebp-1E0]
 005592D5    or          edx,0FFFFFFFF
 005592D8    call        jpeg_start_compress
>005592DD    jmp         005592F9
 005592DF    lea         edx,[ebp-0C]
 005592E2    lea         eax,[ebp-1E0]
 005592E8    mov         ecx,dword ptr [ebp-8]
 005592EB    call        jpeg_write_scanlines
 005592F0    mov         esi,eax
 005592F2    mov         eax,ebx
 005592F4    imul        esi
 005592F6    add         dword ptr [ebp-0C],eax
 005592F9    mov         eax,dword ptr [ebp-104]
 005592FF    cmp         eax,dword ptr [ebp-1C0]
>00559305    jb          005592DF
 00559307    lea         eax,[ebp-1E0]
 0055930D    call        jpeg_finish_compress
 00559312    xor         eax,eax
 00559314    pop         edx
 00559315    pop         ecx
 00559316    pop         ecx
 00559317    mov         dword ptr fs:[eax],edx
 0055931A    push        55936A
 0055931F    call        ExceptObject
 00559324    test        eax,eax
>00559326    jne         0055932F
 00559328    mov         ebx,64
>0055932D    jmp         00559331
 0055932F    xor         ebx,ebx
 00559331    push        ebx
 00559332    push        0
 00559334    push        0
 00559336    lea         eax,[ebp-2F8]
 0055933C    push        eax
 0055933D    xor         ecx,ecx
 0055933F    xor         edx,edx
 00559341    xor         eax,eax
 00559343    call        Rect
 00559348    lea         eax,[ebp-2F8]
 0055934E    push        eax
 0055934F    push        0
 00559351    mov         cl,2
 00559353    mov         edx,dword ptr [ebp-4]
 00559356    mov         eax,dword ptr [ebp-4]
 00559359    mov         si,0FFFD
 0055935D    call        @CallDynaInst
 00559362    ret
>00559363    jmp         @HandleFinally
>00559368    jmp         0055931F
 0055936A    xor         eax,eax
 0055936C    pop         edx
 0055936D    pop         ecx
 0055936E    pop         ecx
 0055936F    mov         dword ptr fs:[eax],edx
 00559372    push        559387
 00559377    mov         eax,dword ptr [ebp-10]
 0055937A    call        TObject.Free
 0055937F    ret
>00559380    jmp         @HandleFinally
>00559385    jmp         00559377
 00559387    xor         eax,eax
 00559389    pop         edx
 0055938A    pop         ecx
 0055938B    pop         ecx
 0055938C    mov         dword ptr fs:[eax],edx
>0055938F    jmp         005593AF
>00559391    jmp         @HandleOnException
 00559396    dd          1
 0055939A    dd          004195F4;EAbort
 0055939E    dd          005593A2
 005593A2    mov         eax,dword ptr [ebp-4]
 005593A5    call        TJPEGImage.NewImage
 005593AA    call        @DoneExcept
 005593AF    xor         eax,eax
 005593B1    pop         edx
 005593B2    pop         ecx
 005593B3    pop         ecx
 005593B4    mov         dword ptr fs:[eax],edx
 005593B7    push        5593CF
 005593BC    lea         eax,[ebp-2E8]
 005593C2    call        ReleaseContext
 005593C7    ret
>005593C8    jmp         @HandleFinally
>005593CD    jmp         005593BC
 005593CF    pop         edi
 005593D0    pop         esi
 005593D1    pop         ebx
 005593D2    mov         esp,ebp
 005593D4    pop         ebp
 005593D5    ret
*}
end;

//005593D8
procedure TJPEGImage.DIBNeeded;
begin
{*
 005593D8    call        TJPEGImage.GetBitmap
 005593DD    ret
*}
end;

//005593E0
procedure TJPEGImage.Draw(ACanvas:TCanvas; const Rect:TRect);
begin
{*
 005593E0    push        ebx
 005593E1    push        esi
 005593E2    push        edi
 005593E3    mov         edi,ecx
 005593E5    mov         esi,edx
 005593E7    mov         ebx,eax
 005593E9    mov         eax,ebx
 005593EB    call        TJPEGImage.GetBitmap
 005593F0    mov         ecx,eax
 005593F2    mov         edx,edi
 005593F4    mov         eax,esi
 005593F6    mov         ebx,dword ptr [eax]
 005593F8    call        dword ptr [ebx+88]
 005593FE    pop         edi
 005593FF    pop         esi
 00559400    pop         ebx
 00559401    ret
*}
end;

//00559404
function TJPEGImage.Equals(Graphic:TGraphic):Boolean;
begin
{*
 00559404    push        ebx
 00559405    push        esi
 00559406    push        edi
 00559407    mov         esi,edx
 00559409    mov         edi,eax
 0055940B    xor         ebx,ebx
 0055940D    mov         eax,esi
 0055940F    mov         edx,dword ptr ds:[5582CC];TJPEGImage
 00559415    call        @IsClass
 0055941A    test        al,al
>0055941C    je          00559443
 0055941E    mov         eax,dword ptr [edi+28]
 00559421    cmp         dword ptr [eax+8],0
>00559425    je          0055943D
 00559427    mov         edx,dword ptr [esi+28]
 0055942A    cmp         dword ptr [edx+8],0
>0055942E    je          0055943D
 00559430    mov         edx,esi
 00559432    mov         eax,edi
 00559434    call        TGraphic.Equals
 00559439    mov         ebx,eax
>0055943B    jmp         00559443
 0055943D    cmp         eax,dword ptr [esi+28]
 00559440    sete        bl
 00559443    mov         eax,ebx
 00559445    pop         edi
 00559446    pop         esi
 00559447    pop         ebx
 00559448    ret
*}
end;

//0055944C
procedure TJPEGImage.FreeBitmap;
begin
{*
 0055944C    push        ebx
 0055944D    mov         ebx,eax
 0055944F    mov         eax,dword ptr [ebx+2C]
 00559452    call        TObject.Free
 00559457    xor         eax,eax
 00559459    mov         dword ptr [ebx+2C],eax
 0055945C    pop         ebx
 0055945D    ret
*}
end;

//00559460
function BuildPalette(const cinfo:jpeg_decompress_struct):HPALETTE;
begin
{*
 00559460    push        esi
 00559461    push        edi
 00559462    add         esp,0FFFFFBFC
 00559468    mov         edi,eax
 0055946A    mov         word ptr [esp],300
 00559470    movzx       edx,word ptr [edi+84]
 00559477    mov         word ptr [esp+2],dx
 0055947C    cmp         dword ptr [edi+2C],1
>00559480    jne         005594B2
 00559482    movzx       esi,dx
 00559485    dec         esi
 00559486    test        esi,esi
>00559488    jl          005594FA
 0055948A    inc         esi
 0055948B    xor         ecx,ecx
 0055948D    lea         edx,[esp+4]
 00559491    mov         eax,dword ptr [edi+88]
 00559497    mov         eax,dword ptr [eax]
 00559499    movzx       eax,byte ptr [eax+ecx]
 0055949D    mov         byte ptr [edx],al
 0055949F    mov         byte ptr [edx+1],al
 005594A2    mov         byte ptr [edx+2],al
 005594A5    mov         byte ptr [edx+3],0
 005594A9    inc         ecx
 005594AA    add         edx,4
 005594AD    dec         esi
>005594AE    jne         00559491
>005594B0    jmp         005594FA
 005594B2    movzx       esi,dx
 005594B5    dec         esi
 005594B6    test        esi,esi
>005594B8    jl          005594FA
 005594BA    inc         esi
 005594BB    xor         ecx,ecx
 005594BD    lea         edx,[esp+4]
 005594C1    mov         eax,dword ptr [edi+88]
 005594C7    mov         eax,dword ptr [eax+8]
 005594CA    movzx       eax,byte ptr [eax+ecx]
 005594CE    mov         byte ptr [edx],al
 005594D0    mov         eax,dword ptr [edi+88]
 005594D6    mov         eax,dword ptr [eax+4]
 005594D9    movzx       eax,byte ptr [eax+ecx]
 005594DD    mov         byte ptr [edx+1],al
 005594E0    mov         eax,dword ptr [edi+88]
 005594E6    mov         eax,dword ptr [eax]
 005594E8    movzx       eax,byte ptr [eax+ecx]
 005594EC    mov         byte ptr [edx+2],al
 005594EF    mov         byte ptr [edx+3],0
 005594F3    inc         ecx
 005594F4    add         edx,4
 005594F7    dec         esi
>005594F8    jne         005594C1
 005594FA    mov         eax,esp
 005594FC    push        eax
 005594FD    call        gdi32.CreatePalette
 00559502    add         esp,404
 00559508    pop         edi
 00559509    pop         esi
 0055950A    ret
*}
end;

//0055950C
procedure BuildColorMap(var cinfo:jpeg_decompress_struct; P:HPALETTE);
begin
{*
 0055950C    push        ebx
 0055950D    push        esi
 0055950E    push        edi
 0055950F    push        ebp
 00559510    add         esp,0FFFFFBFC
 00559516    mov         ebx,eax
 00559518    lea         eax,[esp+4]
 0055951C    push        eax
 0055951D    push        100
 00559522    push        0
 00559524    push        edx
 00559525    call        gdi32.GetPaletteEntries
 0055952A    mov         esi,eax
 0055952C    test        esi,esi
>0055952E    je          0055958C
 00559530    push        3
 00559532    mov         edi,dword ptr [ebx+4]
 00559535    mov         eax,ebx
 00559537    mov         ecx,esi
 00559539    mov         edx,1
 0055953E    call        dword ptr [edi+8]
 00559541    mov         dword ptr [ebx+88],eax
 00559547    mov         dword ptr [ebx+84],esi
 0055954D    mov         edi,esi
 0055954F    dec         edi
 00559550    test        edi,edi
>00559552    jl          0055958C
 00559554    inc         edi
 00559555    xor         edx,edx
 00559557    lea         eax,[esp+4]
 0055955B    mov         esi,dword ptr [ebx+88]
 00559561    mov         ecx,dword ptr [esi+8]
 00559564    lea         ebp,[ecx+edx]
 00559567    movzx       ecx,byte ptr [eax]
 0055956A    mov         byte ptr [ebp],cl
 0055956D    mov         ecx,dword ptr [esi+4]
 00559570    lea         ebp,[ecx+edx]
 00559573    movzx       ecx,byte ptr [eax+1]
 00559577    mov         byte ptr [ebp],cl
 0055957A    mov         ecx,dword ptr [esi]
 0055957C    lea         esi,[ecx+edx]
 0055957F    movzx       ecx,byte ptr [eax+2]
 00559583    mov         byte ptr [esi],cl
 00559585    inc         edx
 00559586    add         eax,4
 00559589    dec         edi
>0055958A    jne         0055955B
 0055958C    add         esp,404
 00559592    pop         ebp
 00559593    pop         edi
 00559594    pop         esi
 00559595    pop         ebx
 00559596    ret
*}
end;

//00559598
function CMYKToRGB(const Color:TRGBQuad):TRGBQuad;
begin
{*
 00559598    push        ebx
 00559599    add         esp,0FFFFFFF8
 0055959C    mov         dword ptr [esp],eax
 0055959F    movzx       eax,byte ptr [esp]
 005595A3    movzx       ecx,byte ptr [esp+3]
 005595A8    imul        ecx
 005595AA    mov         ebx,0FF
 005595AF    xor         edx,edx
 005595B1    div         eax,ebx
 005595B3    mov         byte ptr [esp+6],al
 005595B7    movzx       eax,byte ptr [esp+1]
 005595BC    imul        ecx
 005595BE    mov         ebx,0FF
 005595C3    xor         edx,edx
 005595C5    div         eax,ebx
 005595C7    mov         byte ptr [esp+5],al
 005595CB    movzx       eax,byte ptr [esp+2]
 005595D0    imul        ecx
 005595D2    mov         ecx,0FF
 005595D7    xor         edx,edx
 005595D9    div         eax,ecx
 005595DB    mov         byte ptr [esp+4],al
 005595DF    mov         byte ptr [esp+7],0FF
 005595E4    mov         eax,dword ptr [esp+4]
 005595E8    pop         ecx
 005595E9    pop         edx
 005595EA    pop         ebx
 005595EB    ret
*}
end;

//005595EC
function TJPEGImage.GetBitmap:TBitmap;
begin
{*
 005595EC    push        ebp
 005595ED    mov         ebp,esp
 005595EF    add         esp,0FFFFFCFC
 005595F5    push        ebx
 005595F6    push        esi
 005595F7    push        edi
 005595F8    mov         dword ptr [ebp-4],eax
 005595FB    mov         eax,dword ptr [ebp-4]
 005595FE    mov         eax,dword ptr [eax+2C]
 00559601    mov         dword ptr [ebp-8],eax
 00559604    cmp         dword ptr [ebp-8],0
>00559608    jne         00559ACB
 0055960E    mov         edx,dword ptr [ebp-4]
 00559611    mov         edx,dword ptr [edx+28]
 00559614    cmp         dword ptr [edx+8],0
>00559618    je          00559ACB
 0055961E    test        eax,eax
>00559620    jne         00559634
 00559622    mov         dl,1
 00559624    mov         eax,[00463B28];TBitmap
 00559629    call        TBitmap.Create
 0055962E    mov         edx,dword ptr [ebp-4]
 00559631    mov         dword ptr [edx+2C],eax
 00559634    mov         eax,dword ptr [ebp-4]
 00559637    mov         eax,dword ptr [eax+2C]
 0055963A    mov         dword ptr [ebp-8],eax
 0055963D    mov         byte ptr [ebp-19],1
 00559641    lea         edx,[ebp-2F4]
 00559647    mov         eax,dword ptr [ebp-4]
 0055964A    call        InitDecompressor
 0055964F    xor         edx,edx
 00559651    push        ebp
 00559652    push        559AC4
 00559657    push        dword ptr fs:[edx]
 0055965A    mov         dword ptr fs:[edx],esp
 0055965D    xor         edx,edx
 0055965F    push        ebp
 00559660    push        559A95
 00559665    push        dword ptr fs:[edx]
 00559668    mov         dword ptr fs:[edx],esp
 0055966B    mov         eax,dword ptr [ebp-4]
 0055966E    mov         eax,dword ptr [eax+2C]
 00559671    xor         edx,edx
 00559673    call        TBitmap.SetHandle
 00559678    mov         eax,dword ptr [ebp-4]
 0055967B    cmp         byte ptr [eax+3E],1
>0055967F    je          0055968A
 00559681    cmp         dword ptr [ebp-1C0],1
>00559688    jne         00559699
 0055968A    mov         eax,dword ptr [ebp-4]
 0055968D    mov         eax,dword ptr [eax+2C]
 00559690    mov         dl,3
 00559692    call        TBitmap.SetPixelFormat
>00559697    jmp         005596C3
 00559699    mov         eax,dword ptr [ebp-1C0]
 0055969F    add         eax,0FFFFFFFC
 005596A2    sub         eax,2
>005596A5    jae         005596B6
 005596A7    mov         eax,dword ptr [ebp-4]
 005596AA    mov         eax,dword ptr [eax+2C]
 005596AD    mov         dl,7
 005596AF    call        TBitmap.SetPixelFormat
>005596B4    jmp         005596C3
 005596B6    mov         eax,dword ptr [ebp-4]
 005596B9    mov         eax,dword ptr [eax+2C]
 005596BC    mov         dl,6
 005596BE    call        TBitmap.SetPixelFormat
 005596C3    push        0
 005596C5    push        0
 005596C7    push        0
 005596C9    lea         eax,[ebp-304]
 005596CF    push        eax
 005596D0    xor         ecx,ecx
 005596D2    xor         edx,edx
 005596D4    xor         eax,eax
 005596D6    call        Rect
 005596DB    lea         eax,[ebp-304]
 005596E1    push        eax
 005596E2    push        0
 005596E4    xor         ecx,ecx
 005596E6    mov         edx,dword ptr [ebp-4]
 005596E9    mov         eax,dword ptr [ebp-4]
 005596EC    mov         si,0FFFD
 005596F0    call        @CallDynaInst
 005596F5    xor         edx,edx
 005596F7    push        ebp
 005596F8    push        559A84
 005596FD    push        dword ptr fs:[edx]
 00559700    mov         dword ptr fs:[edx],esp
 00559703    mov         eax,dword ptr [ebp-4]
 00559706    mov         eax,dword ptr [eax+38]
 00559709    test        eax,eax
>0055970B    je          0055974F
 0055970D    mov         edx,dword ptr [ebp-4]
 00559710    cmp         byte ptr [edx+3E],1
>00559714    jne         00559741
 00559716    mov         edx,eax
 00559718    lea         eax,[ebp-1EC]
 0055971E    call        BuildColorMap
 00559723    mov         eax,dword ptr [ebp-4]
 00559726    mov         eax,dword ptr [eax+38]
 00559729    call        CopyPalette
 0055972E    mov         edx,eax
 00559730    mov         eax,dword ptr [ebp-4]
 00559733    mov         eax,dword ptr [eax+2C]
 00559736    mov         ecx,dword ptr [eax]
 00559738    call        dword ptr [ecx+3C]
 0055973B    mov         byte ptr [ebp-19],0
>0055973F    jmp         0055974F
 00559741    push        eax
 00559742    call        gdi32.DeleteObject
 00559747    mov         eax,dword ptr [ebp-4]
 0055974A    xor         edx,edx
 0055974C    mov         dword ptr [eax+38],edx
 0055974F    lea         eax,[ebp-1EC]
 00559755    call        jpeg_start_decompress
 0055975A    mov         eax,dword ptr [ebp-4]
 0055975D    mov         ebx,dword ptr [eax+2C]
 00559760    xor         edx,edx
 00559762    mov         eax,ebx
 00559764    call        TBitmap.SetHandle
 00559769    mov         edx,dword ptr [ebp-17C]
 0055976F    mov         eax,ebx
 00559771    mov         ecx,dword ptr [eax]
 00559773    call        dword ptr [ecx+44]
 00559776    mov         edx,dword ptr [ebp-178]
 0055977C    mov         eax,ebx
 0055977E    mov         ecx,dword ptr [eax]
 00559780    call        dword ptr [ecx+38]
 00559783    xor         edx,edx
 00559785    mov         eax,ebx
 00559787    call        TBitmap.GetScanline
 0055978C    mov         dword ptr [ebp-14],eax
 0055978F    cmp         dword ptr [ebp-178],1
>00559796    jbe         005597CA
 00559798    mov         edx,1
 0055979D    mov         eax,ebx
 0055979F    call        TBitmap.GetScanline
 005597A4    sub         eax,dword ptr [ebp-14]
 005597A7    mov         dword ptr [ebp-18],eax
 005597AA    cmp         dword ptr [ebp-18],0
>005597AE    jle         005597C1
 005597B0    test        byte ptr [ebp-18],3
>005597B4    jne         005597C1
 005597B6    mov         eax,dword ptr [ebp-16C]
 005597BC    mov         dword ptr [ebp-0C],eax
>005597BF    jmp         005597D6
 005597C1    mov         dword ptr [ebp-0C],1
>005597C8    jmp         005597D6
 005597CA    mov         dword ptr [ebp-0C],1
 005597D1    xor         eax,eax
 005597D3    mov         dword ptr [ebp-18],eax
 005597D6    cmp         dword ptr [ebp-1AC],0
>005597DD    je          0055992A
>005597E3    jmp         005598C2
 005597E8    lea         eax,[ebp-1EC]
 005597EE    mov         edx,dword ptr [ebp-15C]
 005597F4    call        jpeg_start_output
 005597F9    mov         eax,dword ptr [ebp-1E4]
 005597FF    cmp         dword ptr [eax+0C],0
>00559803    jne         00559842
 00559805    cmp         dword ptr [ebp-164],0
>0055980C    je          00559842
 0055980E    mov         eax,dword ptr [ebp-4]
 00559811    mov         eax,dword ptr [eax+2C]
 00559814    call        TBitmap.GetPixelFormat
 00559819    cmp         al,3
>0055981B    jne         00559842
 0055981D    cmp         byte ptr [ebp-19],0
>00559821    je          00559842
 00559823    lea         eax,[ebp-1EC]
 00559829    call        BuildPalette
 0055982E    mov         edx,eax
 00559830    mov         eax,dword ptr [ebp-4]
 00559833    mov         eax,dword ptr [eax+2C]
 00559836    mov         ecx,dword ptr [eax]
 00559838    call        dword ptr [ecx+3C]
 0055983B    mov         eax,dword ptr [ebp-4]
 0055983E    mov         byte ptr [eax+22],1
 00559842    mov         eax,dword ptr [ebp-4]
 00559845    mov         eax,dword ptr [eax+2C]
 00559848    xor         edx,edx
 0055984A    call        TBitmap.GetScanline
 0055984F    mov         dword ptr [ebp-14],eax
>00559852    jmp         005598A9
 00559854    lea         edx,[ebp-14]
 00559857    lea         eax,[ebp-1EC]
 0055985D    mov         ecx,dword ptr [ebp-0C]
 00559860    call        jpeg_read_scanlines
 00559865    mov         dword ptr [ebp-10],eax
 00559868    cmp         dword ptr [ebp-1C0],4
>0055986F    jne         005598A0
 00559871    mov         edi,dword ptr [ebp-14]
 00559874    mov         eax,dword ptr [ebp-4]
 00559877    mov         eax,dword ptr [eax+2C]
 0055987A    mov         edx,dword ptr [eax]
 0055987C    call        dword ptr [edx+30]
 0055987F    mov         ebx,eax
>00559881    jmp         00559891
 00559883    mov         esi,edi
 00559885    mov         eax,dword ptr [esi]
 00559887    call        CMYKToRGB
 0055988C    mov         dword ptr [esi],eax
 0055988E    add         edi,4
 00559891    mov         eax,edi
 00559893    sub         eax,dword ptr [ebp-14]
 00559896    mov         edx,ebx
 00559898    add         edx,edx
 0055989A    add         edx,edx
 0055989C    cmp         eax,edx
>0055989E    jl          00559883
 005598A0    mov         eax,dword ptr [ebp-18]
 005598A3    imul        dword ptr [ebp-10]
 005598A6    add         dword ptr [ebp-14],eax
 005598A9    mov         eax,dword ptr [ebp-160]
 005598AF    cmp         eax,dword ptr [ebp-178]
>005598B5    jb          00559854
 005598B7    lea         eax,[ebp-1EC]
 005598BD    call        jpeg_finish_output
 005598C2    lea         eax,[ebp-1EC]
 005598C8    call        jpeg_consume_input
 005598CD    cmp         eax,2
>005598D0    jne         005597E8
 005598D6    mov         eax,dword ptr [ebp-1F8]
 005598DC    mov         dword ptr [ebp-1A4],eax
 005598E2    mov         eax,dword ptr [ebp-1F0]
 005598E8    mov         dword ptr [ebp-194],eax
 005598EE    cmp         byte ptr [ebp-1F4],0
>005598F5    je          00559909
 005598F7    mov         dword ptr [ebp-190],0FFFFFFFF
 00559901    xor         eax,eax
 00559903    mov         dword ptr [ebp-164],eax
 00559909    lea         eax,[ebp-1EC]
 0055990F    mov         edx,dword ptr [ebp-15C]
 00559915    call        jpeg_start_output
 0055991A    mov         eax,dword ptr [ebp-4]
 0055991D    mov         eax,dword ptr [eax+2C]
 00559920    xor         edx,edx
 00559922    call        TBitmap.GetScanline
 00559927    mov         dword ptr [ebp-14],eax
 0055992A    cmp         dword ptr [ebp-1AC],0
>00559931    je          00559940
 00559933    cmp         byte ptr [ebp-1F4],0
>0055993A    je          005599E3
 00559940    cmp         dword ptr [ebp-164],0
>00559947    je          005599E3
 0055994D    cmp         byte ptr [ebp-19],0
>00559951    je          005599E3
 00559957    lea         eax,[ebp-1EC]
 0055995D    call        BuildPalette
 00559962    mov         edx,eax
 00559964    mov         eax,dword ptr [ebp-4]
 00559967    mov         eax,dword ptr [eax+2C]
 0055996A    mov         ecx,dword ptr [eax]
 0055996C    call        dword ptr [ecx+3C]
 0055996F    mov         eax,dword ptr [ebp-4]
 00559972    mov         byte ptr [eax+22],1
 00559976    mov         eax,dword ptr [ebp-4]
 00559979    mov         eax,dword ptr [eax+2C]
 0055997C    xor         edx,edx
 0055997E    call        TBitmap.GetScanline
 00559983    mov         dword ptr [ebp-14],eax
>00559986    jmp         005599E3
 00559988    lea         edx,[ebp-14]
 0055998B    lea         eax,[ebp-1EC]
 00559991    mov         ecx,dword ptr [ebp-0C]
 00559994    call        jpeg_read_scanlines
 00559999    mov         dword ptr [ebp-10],eax
 0055999C    mov         eax,dword ptr [ebp-4]
 0055999F    mov         eax,dword ptr [eax+2C]
 005599A2    call        TBitmap.GetPixelFormat
 005599A7    cmp         al,7
>005599A9    jne         005599DA
 005599AB    mov         edi,dword ptr [ebp-14]
 005599AE    mov         eax,dword ptr [ebp-4]
 005599B1    mov         eax,dword ptr [eax+2C]
 005599B4    mov         edx,dword ptr [eax]
 005599B6    call        dword ptr [edx+30]
 005599B9    mov         ebx,eax
>005599BB    jmp         005599CB
 005599BD    mov         esi,edi
 005599BF    mov         eax,dword ptr [esi]
 005599C1    call        CMYKToRGB
 005599C6    mov         dword ptr [esi],eax
 005599C8    add         edi,4
 005599CB    mov         eax,edi
 005599CD    sub         eax,dword ptr [ebp-14]
 005599D0    mov         edx,ebx
 005599D2    add         edx,edx
 005599D4    add         edx,edx
 005599D6    cmp         eax,edx
>005599D8    jl          005599BD
 005599DA    mov         eax,dword ptr [ebp-18]
 005599DD    imul        dword ptr [ebp-10]
 005599E0    add         dword ptr [ebp-14],eax
 005599E3    mov         eax,dword ptr [ebp-160]
 005599E9    cmp         eax,dword ptr [ebp-178]
>005599EF    jb          00559988
 005599F1    cmp         dword ptr [ebp-1AC],0
>005599F8    je          00559A05
 005599FA    lea         eax,[ebp-1EC]
 00559A00    call        jpeg_finish_output
 00559A05    lea         eax,[ebp-1EC]
 00559A0B    call        jpeg_finish_decompress
 00559A10    xor         eax,eax
 00559A12    pop         edx
 00559A13    pop         ecx
 00559A14    pop         ecx
 00559A15    mov         dword ptr fs:[eax],edx
 00559A18    push        559A8B
 00559A1D    call        ExceptObject
 00559A22    test        eax,eax
>00559A24    jne         00559A2F
 00559A26    mov         dword ptr [ebp-18],64
>00559A2D    jmp         00559A34
 00559A2F    xor         eax,eax
 00559A31    mov         dword ptr [ebp-18],eax
 00559A34    movzx       eax,byte ptr [ebp-18]
 00559A38    push        eax
 00559A39    mov         eax,dword ptr [ebp-4]
 00559A3C    movzx       eax,byte ptr [eax+22]
 00559A40    push        eax
 00559A41    push        0
 00559A43    lea         eax,[ebp-304]
 00559A49    push        eax
 00559A4A    xor         ecx,ecx
 00559A4C    xor         edx,edx
 00559A4E    xor         eax,eax
 00559A50    call        Rect
 00559A55    lea         eax,[ebp-304]
 00559A5B    push        eax
 00559A5C    push        0
 00559A5E    mov         cl,2
 00559A60    mov         edx,dword ptr [ebp-4]
 00559A63    mov         eax,dword ptr [ebp-4]
 00559A66    mov         si,0FFFD
 00559A6A    call        @CallDynaInst
 00559A6F    mov         eax,dword ptr [ebp-4]
 00559A72    cmp         byte ptr [eax+22],0
>00559A76    je          00559A83
 00559A78    mov         edx,dword ptr [ebp-4]
 00559A7B    mov         eax,dword ptr [ebp-4]
 00559A7E    mov         ecx,dword ptr [eax]
 00559A80    call        dword ptr [ecx+10]
 00559A83    ret
>00559A84    jmp         @HandleFinally
>00559A89    jmp         00559A1D
 00559A8B    xor         eax,eax
 00559A8D    pop         edx
 00559A8E    pop         ecx
 00559A8F    pop         ecx
 00559A90    mov         dword ptr fs:[eax],edx
>00559A93    jmp         00559AAB
>00559A95    jmp         @HandleOnException
 00559A9A    dd          1
 00559A9E    dd          004195F4;EAbort
 00559AA2    dd          00559AA6
 00559AA6    call        @DoneExcept
 00559AAB    xor         eax,eax
 00559AAD    pop         edx
 00559AAE    pop         ecx
 00559AAF    pop         ecx
 00559AB0    mov         dword ptr fs:[eax],edx
 00559AB3    push        559ACB
 00559AB8    lea         eax,[ebp-2F4]
 00559ABE    call        ReleaseContext
 00559AC3    ret
>00559AC4    jmp         @HandleFinally
>00559AC9    jmp         00559AB8
 00559ACB    mov         eax,dword ptr [ebp-8]
 00559ACE    pop         edi
 00559ACF    pop         esi
 00559AD0    pop         ebx
 00559AD1    mov         esp,ebp
 00559AD3    pop         ebp
 00559AD4    ret
*}
end;

//00559AD8
function TJPEGImage.GetEmpty:Boolean;
begin
{*
 00559AD8    push        ebx
 00559AD9    push        esi
 00559ADA    mov         ebx,eax
 00559ADC    mov         eax,dword ptr [ebx+28]
 00559ADF    cmp         dword ptr [eax+8],0
>00559AE3    jne         00559AF7
 00559AE5    mov         esi,dword ptr [ebx+2C]
 00559AE8    test        esi,esi
>00559AEA    je          00559AFC
 00559AEC    mov         eax,esi
 00559AEE    mov         edx,dword ptr [eax]
 00559AF0    call        dword ptr [edx+20]
 00559AF3    test        al,al
>00559AF5    jne         00559AFC
 00559AF7    xor         eax,eax
 00559AF9    pop         esi
 00559AFA    pop         ebx
 00559AFB    ret
 00559AFC    mov         al,1
 00559AFE    pop         esi
 00559AFF    pop         ebx
 00559B00    ret
*}
end;

//00559B04
function TJPEGImage.GetGrayscale:Boolean;
begin
{*
 00559B04    cmp         byte ptr [eax+3D],0
>00559B08    jne         00559B16
 00559B0A    mov         eax,dword ptr [eax+28]
 00559B0D    cmp         byte ptr [eax+14],0
>00559B11    jne         00559B16
 00559B13    xor         eax,eax
 00559B15    ret
 00559B16    mov         al,1
 00559B18    ret
*}
end;

//00559B1C
function TJPEGImage.GetPalette:HPALETTE;
begin
{*
 00559B1C    push        ebx
 00559B1D    push        esi
 00559B1E    push        edi
 00559B1F    push        ebp
 00559B20    mov         ebx,eax
 00559B22    xor         esi,esi
 00559B24    mov         eax,dword ptr [ebx+2C]
 00559B27    test        eax,eax
>00559B29    je          00559B34
 00559B2B    mov         edx,dword ptr [eax]
 00559B2D    call        dword ptr [edx+28]
 00559B30    mov         esi,eax
>00559B32    jmp         00559B7B
 00559B34    mov         eax,dword ptr [ebx+38]
 00559B37    test        eax,eax
>00559B39    je          00559B3F
 00559B3B    mov         esi,eax
>00559B3D    jmp         00559B7B
 00559B3F    cmp         byte ptr [ebx+3E],0
>00559B43    jne         00559B7B
 00559B45    push        0
 00559B47    call        user32.GetDC
 00559B4C    mov         edi,eax
 00559B4E    push        0C
 00559B50    push        edi
 00559B51    call        gdi32.GetDeviceCaps
 00559B56    mov         ebp,eax
 00559B58    push        0E
 00559B5A    push        edi
 00559B5B    call        gdi32.GetDeviceCaps
 00559B60    imul        ebp,eax
 00559B63    cmp         ebp,8
>00559B66    jg          00559B73
 00559B68    push        edi
 00559B69    call        gdi32.CreateHalftonePalette
 00559B6E    mov         esi,eax
 00559B70    mov         dword ptr [ebx+38],esi
 00559B73    push        edi
 00559B74    push        0
 00559B76    call        user32.ReleaseDC
 00559B7B    mov         eax,esi
 00559B7D    pop         ebp
 00559B7E    pop         edi
 00559B7F    pop         esi
 00559B80    pop         ebx
 00559B81    ret
*}
end;

//00559B84
function TJPEGImage.GetHeight:Integer;
begin
{*
 00559B84    push        ebx
 00559B85    mov         ebx,eax
 00559B87    mov         eax,dword ptr [ebx+2C]
 00559B8A    test        eax,eax
>00559B8C    je          00559B95
 00559B8E    mov         edx,dword ptr [eax]
 00559B90    call        dword ptr [edx+24]
 00559B93    pop         ebx
 00559B94    ret
 00559B95    cmp         byte ptr [ebx+43],0
>00559B99    jne         00559BA3
 00559B9B    mov         eax,dword ptr [ebx+28]
 00559B9E    mov         eax,dword ptr [eax+0C]
>00559BA1    jmp         00559BAD
 00559BA3    mov         eax,ebx
 00559BA5    call        TJPEGImage.CalcOutputDimensions
 00559BAA    mov         eax,dword ptr [ebx+34]
 00559BAD    pop         ebx
 00559BAE    ret
*}
end;

//00559BB0
function TJPEGImage.GetWidth:Integer;
begin
{*
 00559BB0    push        ebx
 00559BB1    mov         ebx,eax
 00559BB3    mov         eax,dword ptr [ebx+2C]
 00559BB6    test        eax,eax
>00559BB8    je          00559BC1
 00559BBA    mov         edx,dword ptr [eax]
 00559BBC    call        dword ptr [edx+30]
 00559BBF    pop         ebx
 00559BC0    ret
 00559BC1    cmp         byte ptr [ebx+43],0
>00559BC5    jne         00559BCF
 00559BC7    mov         eax,dword ptr [ebx+28]
 00559BCA    mov         eax,dword ptr [eax+10]
>00559BCD    jmp         00559BD9
 00559BCF    mov         eax,ebx
 00559BD1    call        TJPEGImage.CalcOutputDimensions
 00559BD6    mov         eax,dword ptr [ebx+30]
 00559BD9    pop         ebx
 00559BDA    ret
*}
end;

//00559BDC
procedure TJPEGImage.JPEGNeeded;
begin
{*
 00559BDC    mov         edx,dword ptr [eax+28]
 00559BDF    cmp         dword ptr [edx+8],0
>00559BE3    jne         00559BEA
 00559BE5    call        TJPEGImage.Compress
 00559BEA    ret
*}
end;

//00559BEC
procedure TJPEGImage.LoadFromClipboardFormat(AFormat:Word; AData:Cardinal; APalette:HPALETTE);
begin
{*
 00559BEC    push        ebp
 00559BED    mov         ebp,esp
 00559BEF    push        ecx
 00559BF0    push        ebx
 00559BF1    push        esi
 00559BF2    push        edi
 00559BF3    mov         dword ptr [ebp-4],ecx
 00559BF6    mov         edi,edx
 00559BF8    mov         esi,eax
 00559BFA    mov         eax,dword ptr [ebp+8]
 00559BFD    push        eax
 00559BFE    mov         ecx,dword ptr [ebp-4]
 00559C01    mov         edx,edi
 00559C03    mov         eax,dword ptr [esi+2C]
 00559C06    mov         ebx,dword ptr [eax]
 00559C08    call        dword ptr [ebx+64]
 00559C0B    pop         edi
 00559C0C    pop         esi
 00559C0D    pop         ebx
 00559C0E    pop         ecx
 00559C0F    pop         ebp
 00559C10    ret         4
*}
end;

//00559C14
procedure TJPEGImage.LoadFromStream(Stream:TStream);
begin
{*
 00559C14    push        ebx
 00559C15    push        esi
 00559C16    mov         ebx,edx
 00559C18    mov         esi,eax
 00559C1A    mov         eax,ebx
 00559C1C    mov         edx,dword ptr [eax]
 00559C1E    call        dword ptr [edx]
 00559C20    push        eax
 00559C21    mov         eax,ebx
 00559C23    call        TStream.GetPosition
 00559C28    pop         edx
 00559C29    sub         edx,eax
 00559C2B    mov         ecx,ebx
 00559C2D    mov         eax,esi
 00559C2F    call        TJPEGImage.ReadStream
 00559C34    pop         esi
 00559C35    pop         ebx
 00559C36    ret
*}
end;

//00559C38
procedure TJPEGImage.NewBitmap;
begin
{*
 00559C38    push        ebx
 00559C39    mov         ebx,eax
 00559C3B    mov         eax,dword ptr [ebx+2C]
 00559C3E    call        TObject.Free
 00559C43    mov         dl,1
 00559C45    mov         eax,[00463B28];TBitmap
 00559C4A    call        TBitmap.Create
 00559C4F    mov         dword ptr [ebx+2C],eax
 00559C52    pop         ebx
 00559C53    ret
*}
end;

//00559C54
procedure TJPEGImage.NewImage;
begin
{*
 00559C54    push        ebx
 00559C55    push        esi
 00559C56    mov         ebx,eax
 00559C58    mov         eax,dword ptr [ebx+28]
 00559C5B    test        eax,eax
>00559C5D    je          00559C64
 00559C5F    call        TSharedImage.Release
 00559C64    mov         dl,1
 00559C66    mov         eax,[005580C8];TJPEGData
 00559C6B    call        TObject.Create
 00559C70    mov         esi,eax
 00559C72    mov         dword ptr [ebx+28],esi
 00559C75    mov         eax,esi
 00559C77    inc         dword ptr [eax+4]
 00559C7A    pop         esi
 00559C7B    pop         ebx
 00559C7C    ret
*}
end;

//00559C80
procedure TJPEGImage.ReadData(Stream:TStream);
begin
{*
 00559C80    push        ebx
 00559C81    push        esi
 00559C82    push        edi
 00559C83    push        ecx
 00559C84    mov         esi,edx
 00559C86    mov         ebx,eax
 00559C88    mov         edx,esp
 00559C8A    mov         ecx,4
 00559C8F    mov         eax,esi
 00559C91    mov         edi,dword ptr [eax]
 00559C93    call        dword ptr [edi+0C]
 00559C96    mov         ecx,esi
 00559C98    mov         edx,dword ptr [esp]
 00559C9B    mov         eax,ebx
 00559C9D    call        TJPEGImage.ReadStream
 00559CA2    pop         edx
 00559CA3    pop         edi
 00559CA4    pop         esi
 00559CA5    pop         ebx
 00559CA6    ret
*}
end;

//00559CA8
procedure TJPEGImage.ReadStream(Size:LongInt; Stream:TStream);
begin
{*
 00559CA8    push        ebp
 00559CA9    mov         ebp,esp
 00559CAB    add         esp,0FFFFFD54
 00559CB1    push        ebx
 00559CB2    push        esi
 00559CB3    push        edi
 00559CB4    mov         dword ptr [ebp-8],ecx
 00559CB7    mov         esi,edx
 00559CB9    mov         dword ptr [ebp-4],eax
 00559CBC    mov         eax,dword ptr [ebp-4]
 00559CBF    call        TJPEGImage.NewImage
 00559CC4    mov         eax,dword ptr [ebp-4]
 00559CC7    mov         eax,dword ptr [eax+2C]
 00559CCA    call        TObject.Free
 00559CCF    mov         eax,dword ptr [ebp-4]
 00559CD2    xor         edx,edx
 00559CD4    mov         dword ptr [eax+2C],edx
 00559CD7    mov         eax,dword ptr [ebp-4]
 00559CDA    mov         ebx,dword ptr [eax+28]
 00559CDD    mov         dl,1
 00559CDF    mov         eax,[0043DAFC];TMemoryStream
 00559CE4    call        TObject.Create
 00559CE9    mov         edi,eax
 00559CEB    mov         dword ptr [ebx+8],edi
 00559CEE    mov         eax,esi
 00559CF0    cdq
 00559CF1    push        edx
 00559CF2    push        eax
 00559CF3    mov         eax,edi
 00559CF5    call        TStream.SetSize64
 00559CFA    mov         eax,dword ptr [ebx+8]
 00559CFD    mov         edx,dword ptr [eax+4]
 00559D00    mov         ecx,esi
 00559D02    mov         eax,dword ptr [ebp-8]
 00559D05    call        TStream.ReadBuffer
 00559D0A    test        esi,esi
>00559D0C    jle         00559DD1
 00559D12    mov         esi,788F2C;^JpegError
 00559D17    lea         edi,[ebp-0DC]
 00559D1D    mov         ecx,35
 00559D22    rep movs    dword ptr [edi],dword ptr [esi]
 00559D24    lea         eax,[ebp-0DC]
 00559D2A    mov         dword ptr [ebp-2AC],eax
 00559D30    lea         eax,[ebp-2AC]
 00559D36    mov         ecx,1D0
 00559D3B    mov         edx,3E
 00559D40    call        jpeg_CreateDecompress
 00559D45    xor         eax,eax
 00559D47    push        ebp
 00559D48    push        559DCA
 00559D4D    push        dword ptr fs:[eax]
 00559D50    mov         dword ptr fs:[eax],esp
 00559D53    push        0
 00559D55    push        0
 00559D57    mov         eax,dword ptr [ebx+8]
 00559D5A    call        TStream.SetPosition
 00559D5F    mov         edx,dword ptr [ebx+8]
 00559D62    lea         eax,[ebp-2AC]
 00559D68    call        jpeg_stdio_src
 00559D6D    lea         eax,[ebp-2AC]
 00559D73    or          edx,0FFFFFFFF
 00559D76    call        jpeg_read_header
 00559D7B    mov         eax,dword ptr [ebp-290]
 00559D81    mov         dword ptr [ebx+10],eax
 00559D84    mov         eax,dword ptr [ebp-28C]
 00559D8A    mov         dword ptr [ebx+0C],eax
 00559D8D    cmp         dword ptr [ebp-284],1
 00559D94    sete        al
 00559D97    mov         byte ptr [ebx+14],al
 00559D9A    lea         eax,[ebp-2AC]
 00559DA0    call        jpeg_has_multiple_scans
 00559DA5    cmp         eax,1
 00559DA8    sbb         eax,eax
 00559DAA    inc         eax
 00559DAB    mov         edx,dword ptr [ebp-4]
 00559DAE    mov         byte ptr [edx+41],al
 00559DB1    xor         eax,eax
 00559DB3    pop         edx
 00559DB4    pop         ecx
 00559DB5    pop         ecx
 00559DB6    mov         dword ptr fs:[eax],edx
 00559DB9    push        559DD1
 00559DBE    lea         eax,[ebp-2AC]
 00559DC4    call        jpeg_destroy_decompress
 00559DC9    ret
>00559DCA    jmp         @HandleFinally
>00559DCF    jmp         00559DBE
 00559DD1    mov         eax,dword ptr [ebp-4]
 00559DD4    mov         byte ptr [eax+22],1
 00559DD8    mov         edx,dword ptr [ebp-4]
 00559DDB    mov         eax,dword ptr [ebp-4]
 00559DDE    mov         ecx,dword ptr [eax]
 00559DE0    call        dword ptr [ecx+10]
 00559DE3    pop         edi
 00559DE4    pop         esi
 00559DE5    pop         ebx
 00559DE6    mov         esp,ebp
 00559DE8    pop         ebp
 00559DE9    ret
*}
end;

//00559DEC
procedure TJPEGImage.SaveToClipboardFormat(var AFormat:Word; var AData:Cardinal; var APalette:HPALETTE);
begin
{*
 00559DEC    push        ebp
 00559DED    mov         ebp,esp
 00559DEF    push        ebx
 00559DF0    push        esi
 00559DF1    push        edi
 00559DF2    mov         edi,ecx
 00559DF4    mov         esi,edx
 00559DF6    mov         ebx,eax
 00559DF8    mov         eax,dword ptr [ebp+8]
 00559DFB    push        eax
 00559DFC    mov         eax,ebx
 00559DFE    call        TJPEGImage.GetBitmap
 00559E03    mov         ecx,edi
 00559E05    mov         edx,esi
 00559E07    mov         ebx,dword ptr [eax]
 00559E09    call        dword ptr [ebx+68]
 00559E0C    pop         edi
 00559E0D    pop         esi
 00559E0E    pop         ebx
 00559E0F    pop         ebp
 00559E10    ret         4
*}
end;

//00559E14
procedure TJPEGImage.SaveToStream(Stream:TStream);
begin
{*
 00559E14    push        ebx
 00559E15    push        esi
 00559E16    mov         esi,edx
 00559E18    mov         ebx,eax
 00559E1A    mov         eax,ebx
 00559E1C    call        TJPEGImage.JPEGNeeded
 00559E21    mov         eax,dword ptr [ebx+28]
 00559E24    mov         ebx,dword ptr [eax+8]
 00559E27    mov         eax,ebx
 00559E29    mov         edx,dword ptr [eax]
 00559E2B    call        dword ptr [edx]
 00559E2D    mov         ecx,eax
 00559E2F    mov         edx,dword ptr [ebx+4]
 00559E32    mov         eax,esi
 00559E34    mov         ebx,dword ptr [eax]
 00559E36    call        dword ptr [ebx+10]
 00559E39    pop         esi
 00559E3A    pop         ebx
 00559E3B    ret
*}
end;

//00559E3C
procedure TJPEGImage.SetGrayscale(Value:Boolean);
begin
{*
 00559E3C    push        ebx
 00559E3D    push        esi
 00559E3E    mov         ebx,edx
 00559E40    mov         esi,eax
 00559E42    cmp         bl,byte ptr [esi+3D]
>00559E45    je          00559E5E
 00559E47    mov         eax,esi
 00559E49    call        TJPEGImage.FreeBitmap
 00559E4E    mov         byte ptr [esi+3D],bl
 00559E51    mov         byte ptr [esi+22],1
 00559E55    mov         edx,esi
 00559E57    mov         eax,esi
 00559E59    mov         ecx,dword ptr [eax]
 00559E5B    call        dword ptr [ecx+10]
 00559E5E    pop         esi
 00559E5F    pop         ebx
 00559E60    ret
*}
end;

//00559E64
procedure TJPEGImage.SetHeight(Value:Integer);
begin
{*
 00559E64    push        ebp
 00559E65    mov         ebp,esp
 00559E67    push        0
 00559E69    xor         eax,eax
 00559E6B    push        ebp
 00559E6C    push        559EA2
 00559E71    push        dword ptr fs:[eax]
 00559E74    mov         dword ptr fs:[eax],esp
 00559E77    lea         edx,[ebp-4]
 00559E7A    mov         eax,[0078CC2C];^SResString580:TResStringRec
 00559E7F    call        LoadResString
 00559E84    mov         eax,dword ptr [ebp-4]
 00559E87    call        InvalidOperation
 00559E8C    xor         eax,eax
 00559E8E    pop         edx
 00559E8F    pop         ecx
 00559E90    pop         ecx
 00559E91    mov         dword ptr fs:[eax],edx
 00559E94    push        559EA9
 00559E99    lea         eax,[ebp-4]
 00559E9C    call        @UStrClr
 00559EA1    ret
>00559EA2    jmp         @HandleFinally
>00559EA7    jmp         00559E99
 00559EA9    pop         ecx
 00559EAA    pop         ebp
 00559EAB    ret
*}
end;

//00559EAC
procedure TJPEGImage.SetPalette(Value:HPALETTE);
begin
{*
 00559EAC    push        ebx
 00559EAD    push        esi
 00559EAE    push        edi
 00559EAF    mov         esi,edx
 00559EB1    mov         edi,eax
 00559EB3    cmp         esi,dword ptr [edi+38]
>00559EB6    je          00559EFE
 00559EB8    mov         ebx,dword ptr [edi+2C]
 00559EBB    test        ebx,ebx
>00559EBD    je          00559ECA
 00559EBF    mov         eax,ebx
 00559EC1    mov         edx,dword ptr [eax]
 00559EC3    call        dword ptr [edx+28]
 00559EC6    cmp         esi,eax
>00559EC8    jne         00559ECE
 00559ECA    xor         eax,eax
>00559ECC    jmp         00559ED0
 00559ECE    mov         al,1
 00559ED0    mov         ebx,eax
 00559ED2    test        bl,bl
>00559ED4    je          00559EDD
 00559ED6    mov         eax,edi
 00559ED8    call        TJPEGImage.FreeBitmap
 00559EDD    mov         eax,dword ptr [edi+38]
 00559EE0    test        eax,eax
>00559EE2    je          00559EEA
 00559EE4    push        eax
 00559EE5    call        gdi32.DeleteObject
 00559EEA    mov         dword ptr [edi+38],esi
 00559EED    test        bl,bl
>00559EEF    je          00559EFE
 00559EF1    mov         byte ptr [edi+22],1
 00559EF5    mov         edx,edi
 00559EF7    mov         eax,edi
 00559EF9    mov         ecx,dword ptr [eax]
 00559EFB    call        dword ptr [ecx+10]
 00559EFE    pop         edi
 00559EFF    pop         esi
 00559F00    pop         ebx
 00559F01    ret
*}
end;

//00559F04
procedure TJPEGImage.SetPerformance(Value:TJPEGPerformance);
begin
{*
 00559F04    push        ebx
 00559F05    push        esi
 00559F06    mov         ebx,edx
 00559F08    mov         esi,eax
 00559F0A    cmp         bl,byte ptr [esi+42]
>00559F0D    je          00559F26
 00559F0F    mov         eax,esi
 00559F11    call        TJPEGImage.FreeBitmap
 00559F16    mov         byte ptr [esi+42],bl
 00559F19    mov         byte ptr [esi+22],1
 00559F1D    mov         edx,esi
 00559F1F    mov         eax,esi
 00559F21    mov         ecx,dword ptr [eax]
 00559F23    call        dword ptr [ecx+10]
 00559F26    pop         esi
 00559F27    pop         ebx
 00559F28    ret
*}
end;

//00559F2C
procedure TJPEGImage.SetPixelFormat(Value:TJPEGPixelFormat);
begin
{*
 00559F2C    push        ebx
 00559F2D    push        esi
 00559F2E    mov         ebx,edx
 00559F30    mov         esi,eax
 00559F32    cmp         bl,byte ptr [esi+3E]
>00559F35    je          00559F4E
 00559F37    mov         eax,esi
 00559F39    call        TJPEGImage.FreeBitmap
 00559F3E    mov         byte ptr [esi+3E],bl
 00559F41    mov         byte ptr [esi+22],1
 00559F45    mov         edx,esi
 00559F47    mov         eax,esi
 00559F49    mov         ecx,dword ptr [eax]
 00559F4B    call        dword ptr [ecx+10]
 00559F4E    pop         esi
 00559F4F    pop         ebx
 00559F50    ret
*}
end;

//00559F54
procedure TJPEGImage.SetScale(Value:TJPEGScale);
begin
{*
 00559F54    push        ebx
 00559F55    push        esi
 00559F56    mov         ebx,edx
 00559F58    mov         esi,eax
 00559F5A    cmp         bl,byte ptr [esi+43]
>00559F5D    je          00559F76
 00559F5F    mov         eax,esi
 00559F61    call        TJPEGImage.FreeBitmap
 00559F66    mov         byte ptr [esi+43],bl
 00559F69    mov         byte ptr [esi+44],1
 00559F6D    mov         edx,esi
 00559F6F    mov         eax,esi
 00559F71    mov         ecx,dword ptr [eax]
 00559F73    call        dword ptr [ecx+10]
 00559F76    pop         esi
 00559F77    pop         ebx
 00559F78    ret
*}
end;

//00559F7C
procedure TJPEGImage.SetSmoothing(Value:Boolean);
begin
{*
 00559F7C    push        ebx
 00559F7D    push        esi
 00559F7E    mov         ebx,edx
 00559F80    mov         esi,eax
 00559F82    cmp         bl,byte ptr [esi+3C]
>00559F85    je          00559F9A
 00559F87    mov         eax,esi
 00559F89    call        TJPEGImage.FreeBitmap
 00559F8E    mov         byte ptr [esi+3C],bl
 00559F91    mov         edx,esi
 00559F93    mov         eax,esi
 00559F95    mov         ecx,dword ptr [eax]
 00559F97    call        dword ptr [ecx+10]
 00559F9A    pop         esi
 00559F9B    pop         ebx
 00559F9C    ret
*}
end;

//00559FA0
procedure TJPEGImage.SetWidth(Value:Integer);
begin
{*
 00559FA0    push        ebp
 00559FA1    mov         ebp,esp
 00559FA3    push        0
 00559FA5    xor         eax,eax
 00559FA7    push        ebp
 00559FA8    push        559FDE
 00559FAD    push        dword ptr fs:[eax]
 00559FB0    mov         dword ptr fs:[eax],esp
 00559FB3    lea         edx,[ebp-4]
 00559FB6    mov         eax,[0078CC2C];^SResString580:TResStringRec
 00559FBB    call        LoadResString
 00559FC0    mov         eax,dword ptr [ebp-4]
 00559FC3    call        InvalidOperation
 00559FC8    xor         eax,eax
 00559FCA    pop         edx
 00559FCB    pop         ecx
 00559FCC    pop         ecx
 00559FCD    mov         dword ptr fs:[eax],edx
 00559FD0    push        559FE5
 00559FD5    lea         eax,[ebp-4]
 00559FD8    call        @UStrClr
 00559FDD    ret
>00559FDE    jmp         @HandleFinally
>00559FE3    jmp         00559FD5
 00559FE5    pop         ecx
 00559FE6    pop         ebp
 00559FE7    ret
*}
end;

//00559FE8
procedure TJPEGImage.WriteData(Stream:TStream);
begin
{*
 00559FE8    push        ebx
 00559FE9    push        esi
 00559FEA    push        edi
 00559FEB    push        ecx
 00559FEC    mov         esi,edx
 00559FEE    mov         ebx,eax
 00559FF0    xor         eax,eax
 00559FF2    mov         dword ptr [esp],eax
 00559FF5    mov         eax,dword ptr [ebx+28]
 00559FF8    mov         edi,dword ptr [eax+8]
 00559FFB    test        edi,edi
>00559FFD    je          0055A008
 00559FFF    mov         eax,edi
 0055A001    mov         edx,dword ptr [eax]
 0055A003    call        dword ptr [edx]
 0055A005    mov         dword ptr [esp],eax
 0055A008    mov         edx,esp
 0055A00A    mov         ecx,4
 0055A00F    mov         eax,esi
 0055A011    mov         edi,dword ptr [eax]
 0055A013    call        dword ptr [edi+10]
 0055A016    cmp         dword ptr [esp],0
>0055A01A    jle         0055A02F
 0055A01C    mov         eax,dword ptr [ebx+28]
 0055A01F    mov         eax,dword ptr [eax+8]
 0055A022    mov         edx,dword ptr [eax+4]
 0055A025    mov         ecx,dword ptr [esp]
 0055A028    mov         eax,esi
 0055A02A    mov         ebx,dword ptr [eax]
 0055A02C    call        dword ptr [ebx+10]
 0055A02F    pop         edx
 0055A030    pop         edi
 0055A031    pop         esi
 0055A032    pop         ebx
 0055A033    ret
*}
end;

//0055A034
procedure InitDefaults;
begin
{*
 0055A034    push        ebx
 0055A035    push        esi
 0055A036    push        0
 0055A038    call        user32.GetDC
 0055A03D    mov         ebx,eax
 0055A03F    push        0C
 0055A041    push        ebx
 0055A042    call        gdi32.GetDeviceCaps
 0055A047    mov         esi,eax
 0055A049    push        0E
 0055A04B    push        ebx
 0055A04C    call        gdi32.GetDeviceCaps
 0055A051    imul        esi,eax
 0055A054    cmp         esi,8
>0055A057    jg          0055A062
 0055A059    mov         byte ptr ds:[788F27],1
>0055A060    jmp         0055A069
 0055A062    mov         byte ptr ds:[788F27],0
 0055A069    push        ebx
 0055A06A    push        0
 0055A06C    call        user32.ReleaseDC
 0055A071    pop         esi
 0055A072    pop         ebx
 0055A073    ret
*}
end;

//0055A074
procedure jpeg_CreateDecompress(var cinfo:jpeg_decompress_struct; version:Integer; structsize:Integer);
begin
{*
 0055A074    push        ebx
 0055A075    mov         ebx,eax
 0055A077    push        esi
 0055A078    xor         eax,eax
 0055A07A    push        edi
 0055A07B    mov         dword ptr [ebx+4],eax
 0055A07E    cmp         edx,3E
 0055A081    mov         esi,ecx
>0055A083    je          0055A09E
 0055A085    mov         eax,dword ptr [ebx]
 0055A087    mov         dword ptr [eax+14],0C
 0055A08E    mov         dword ptr [eax+18],3E
 0055A095    mov         dword ptr [eax+1C],edx
 0055A098    mov         eax,ebx
 0055A09A    mov         edx,dword ptr [eax]
 0055A09C    call        dword ptr [edx]
 0055A09E    cmp         esi,1D0
>0055A0A4    je          0055A0BF
 0055A0A6    mov         eax,dword ptr [ebx]
 0055A0A8    mov         dword ptr [eax+14],15
 0055A0AF    mov         dword ptr [eax+18],1D0
 0055A0B6    mov         dword ptr [eax+1C],esi
 0055A0B9    mov         eax,ebx
 0055A0BB    mov         edx,dword ptr [eax]
 0055A0BD    call        dword ptr [edx]
 0055A0BF    mov         esi,dword ptr [ebx]
 0055A0C1    mov         edi,dword ptr [ebx+0C]
 0055A0C4    push        1D0
 0055A0C9    push        0
 0055A0CB    push        ebx
 0055A0CC    call        _memset
 0055A0D1    add         esp,0C
 0055A0D4    mov         dword ptr [ebx],esi
 0055A0D6    mov         dword ptr [ebx+0C],edi
 0055A0D9    mov         dword ptr [ebx+10],1
 0055A0E0    mov         eax,ebx
 0055A0E2    call        @jinit_memory_mgr
 0055A0E7    xor         edx,edx
 0055A0E9    xor         ecx,ecx
 0055A0EB    mov         dword ptr [ebx+8],edx
 0055A0EE    lea         edx,[ebx+0A4]
 0055A0F4    mov         dword ptr [ebx+18],ecx
 0055A0F7    xor         eax,eax
 0055A0F9    xor         ecx,ecx
 0055A0FB    inc         eax
 0055A0FC    mov         dword ptr [edx],ecx
 0055A0FE    add         edx,4
 0055A101    cmp         eax,4
>0055A104    jl          0055A0F9
 0055A106    xor         eax,eax
 0055A108    lea         edx,[ebx+0B4]
 0055A10E    xor         ecx,ecx
 0055A110    inc         eax
 0055A111    mov         dword ptr [edx],ecx
 0055A113    xor         ecx,ecx
 0055A115    mov         dword ptr [edx+10],ecx
 0055A118    add         edx,4
 0055A11B    cmp         eax,4
>0055A11E    jl          0055A10E
 0055A120    xor         eax,eax
 0055A122    mov         dword ptr [ebx+130],eax
 0055A128    mov         eax,ebx
 0055A12A    call        @jinit_marker_reader
 0055A12F    mov         eax,ebx
 0055A131    call        @jinit_input_controller
 0055A136    mov         dword ptr [ebx+14],0C8
 0055A13D    pop         edi
 0055A13E    pop         esi
 0055A13F    pop         ebx
 0055A140    ret
*}
end;

//0055A144
procedure jpeg_destroy_decompress(var cinfo:jpeg_decompress_struct);
begin
{*
 0055A144    call        jpeg_destroy
 0055A149    ret
*}
end;

//0055A154
{*procedure sub_0055A154(?:?);
begin
 0055A154    push        ebx
 0055A155    mov         ebx,eax
 0055A157    push        esi
 0055A158    mov         eax,dword ptr [ebx+24]
 0055A15B    dec         eax
>0055A15C    je          0055A16F
 0055A15E    sub         eax,2
>0055A161    je          0055A182
 0055A163    dec         eax
>0055A164    je          0055A261
>0055A16A    jmp         0055A2C4
 0055A16F    mov         dword ptr [ebx+28],1
 0055A176    mov         dword ptr [ebx+2C],1
>0055A17D    jmp         0055A2CE
 0055A182    cmp         dword ptr [ebx+118],0
>0055A189    je          0055A197
 0055A18B    mov         dword ptr [ebx+28],3
>0055A192    jmp         0055A258
 0055A197    cmp         dword ptr [ebx+124],0
>0055A19E    je          0055A1EE
 0055A1A0    mov         dl,byte ptr [ebx+128]
 0055A1A6    sub         dl,1
>0055A1A9    jb          0055A1AF
>0055A1AB    je          0055A1BB
>0055A1AD    jmp         0055A1C7
 0055A1AF    mov         dword ptr [ebx+28],2
>0055A1B6    jmp         0055A258
 0055A1BB    mov         dword ptr [ebx+28],3
>0055A1C2    jmp         0055A258
 0055A1C7    mov         eax,dword ptr [ebx]
 0055A1C9    xor         edx,edx
 0055A1CB    mov         dword ptr [eax+14],72
 0055A1D2    mov         dl,byte ptr [ebx+128]
 0055A1D8    mov         dword ptr [eax+18],edx
 0055A1DB    mov         eax,ebx
 0055A1DD    or          edx,0FFFFFFFF
 0055A1E0    mov         ecx,dword ptr [eax]
 0055A1E2    call        dword ptr [ecx+4]
 0055A1E5    mov         dword ptr [ebx+28],3
>0055A1EC    jmp         0055A258
 0055A1EE    mov         ecx,dword ptr [ebx+0D8]
 0055A1F4    mov         eax,dword ptr [ecx]
 0055A1F6    mov         edx,dword ptr [ecx+54]
 0055A1F9    mov         ecx,dword ptr [ecx+0A8]
 0055A1FF    cmp         eax,1
>0055A202    jne         0055A217
 0055A204    cmp         edx,2
>0055A207    jne         0055A217
 0055A209    cmp         ecx,3
>0055A20C    jne         0055A217
 0055A20E    mov         dword ptr [ebx+28],3
>0055A215    jmp         0055A258
 0055A217    cmp         eax,52
>0055A21A    jne         0055A22F
 0055A21C    cmp         edx,47
>0055A21F    jne         0055A22F
 0055A221    cmp         ecx,42
>0055A224    jne         0055A22F
 0055A226    mov         dword ptr [ebx+28],2
>0055A22D    jmp         0055A258
 0055A22F    mov         esi,dword ptr [ebx]
 0055A231    add         esi,18
 0055A234    mov         dword ptr [esi],eax
 0055A236    mov         dword ptr [esi+4],edx
 0055A239    mov         dword ptr [esi+8],ecx
 0055A23C    mov         eax,dword ptr [ebx]
 0055A23E    mov         dword ptr [eax+14],6F
 0055A245    mov         edx,1
 0055A24A    mov         eax,ebx
 0055A24C    mov         ecx,dword ptr [eax]
 0055A24E    call        dword ptr [ecx+4]
 0055A251    mov         dword ptr [ebx+28],3
 0055A258    mov         dword ptr [ebx+2C],2
>0055A25F    jmp         0055A2CE
 0055A261    cmp         dword ptr [ebx+124],0
>0055A268    je          0055A2B4
 0055A26A    mov         dl,byte ptr [ebx+128]
 0055A270    sub         dl,1
>0055A273    jb          0055A27B
 0055A275    dec         dl
>0055A277    je          0055A284
>0055A279    jmp         0055A28D
 0055A27B    mov         dword ptr [ebx+28],4
>0055A282    jmp         0055A2BB
 0055A284    mov         dword ptr [ebx+28],5
>0055A28B    jmp         0055A2BB
 0055A28D    mov         eax,dword ptr [ebx]
 0055A28F    xor         edx,edx
 0055A291    mov         dword ptr [eax+14],72
 0055A298    mov         dl,byte ptr [ebx+128]
 0055A29E    mov         dword ptr [eax+18],edx
 0055A2A1    mov         eax,ebx
 0055A2A3    or          edx,0FFFFFFFF
 0055A2A6    mov         ecx,dword ptr [eax]
 0055A2A8    call        dword ptr [ecx+4]
 0055A2AB    mov         dword ptr [ebx+28],5
>0055A2B2    jmp         0055A2BB
 0055A2B4    mov         dword ptr [ebx+28],4
 0055A2BB    mov         dword ptr [ebx+2C],4
>0055A2C2    jmp         0055A2CE
 0055A2C4    xor         eax,eax
 0055A2C6    xor         edx,edx
 0055A2C8    mov         dword ptr [ebx+28],eax
 0055A2CB    mov         dword ptr [ebx+2C],edx
 0055A2CE    mov         dword ptr [ebx+30],1
 0055A2D5    mov         dword ptr [ebx+34],1
 0055A2DC    xor         ecx,ecx
 0055A2DE    xor         eax,eax
 0055A2E0    mov         dword ptr [ebx+38],ecx
 0055A2E3    xor         edx,edx
 0055A2E5    mov         dword ptr [ebx+3C],3FF00000
 0055A2EC    mov         dword ptr [ebx+40],eax
 0055A2EF    mov         dword ptr [ebx+44],edx
 0055A2F2    mov         dword ptr [ebx+48],2
 0055A2F9    mov         dword ptr [ebx+4C],1
 0055A300    mov         dword ptr [ebx+50],1
 0055A307    xor         ecx,ecx
 0055A309    xor         eax,eax
 0055A30B    mov         dword ptr [ebx+54],ecx
 0055A30E    xor         edx,edx
 0055A310    mov         dword ptr [ebx+58],2
 0055A317    mov         dword ptr [ebx+5C],1
 0055A31E    mov         dword ptr [ebx+60],100
 0055A325    mov         dword ptr [ebx+88],eax
 0055A32B    xor         ecx,ecx
 0055A32D    mov         dword ptr [ebx+64],edx
 0055A330    mov         dword ptr [ebx+68],ecx
 0055A333    xor         eax,eax
 0055A335    mov         dword ptr [ebx+6C],eax
 0055A338    pop         esi
 0055A339    pop         ebx
 0055A33A    ret
end;*}

//0055A33C
procedure jpeg_read_header(var cinfo:jpeg_decompress_struct; RequireImage:LongBool);
begin
{*
 0055A33C    push        ebx
 0055A33D    mov         ebx,eax
 0055A33F    push        esi
 0055A340    mov         esi,edx
 0055A342    mov         eax,dword ptr [ebx+14]
 0055A345    cmp         eax,0C8
>0055A34A    je          0055A368
 0055A34C    cmp         eax,0C9
>0055A351    je          0055A368
 0055A353    mov         eax,dword ptr [ebx]
 0055A355    mov         dword ptr [eax+14],14
 0055A35C    mov         edx,dword ptr [ebx+14]
 0055A35F    mov         dword ptr [eax+18],edx
 0055A362    mov         eax,ebx
 0055A364    mov         edx,dword ptr [eax]
 0055A366    call        dword ptr [edx]
 0055A368    mov         eax,ebx
 0055A36A    call        jpeg_consume_input
 0055A36F    mov         edx,eax
 0055A371    sub         edx,1
>0055A374    jb          0055A3A3
>0055A376    je          0055A37D
 0055A378    dec         edx
>0055A379    je          0055A384
>0055A37B    jmp         0055A3A3
 0055A37D    mov         eax,1
>0055A382    jmp         0055A3A3
 0055A384    test        esi,esi
>0055A386    je          0055A397
 0055A388    mov         edx,dword ptr [ebx]
 0055A38A    mov         eax,ebx
 0055A38C    mov         dword ptr [edx+14],33
 0055A393    mov         edx,dword ptr [eax]
 0055A395    call        dword ptr [edx]
 0055A397    mov         eax,ebx
 0055A399    call        @jpeg_abort
 0055A39E    mov         eax,2
 0055A3A3    pop         esi
 0055A3A4    pop         ebx
 0055A3A5    ret
*}
end;

//0055A3A8
function jpeg_consume_input(var cinfo:jpeg_decompress_struct):Integer;
begin
{*
 0055A3A8    push        ebx
 0055A3A9    mov         ebx,eax
 0055A3AB    push        esi
 0055A3AC    xor         esi,esi
 0055A3AE    mov         eax,dword ptr [ebx+14]
 0055A3B1    add         eax,0FFFFFF38
 0055A3B6    cmp         eax,0A
>0055A3B9    ja          0055A437
 0055A3BB    mov         al,byte ptr [eax+55A3C8]
 0055A3C1    jmp         dword ptr [eax*4+55A3D3]
 0055A3C1    db          4
 0055A3C1    db          3
 0055A3C1    db          2
 0055A3C1    db          1
 0055A3C1    db          1
 0055A3C1    db          1
 0055A3C1    db          1
 0055A3C1    db          1
 0055A3C1    db          1
 0055A3C1    db          0
 0055A3C1    db          1
 0055A3C1    dd          0055A437
 0055A3C1    dd          0055A429
 0055A3C1    dd          0055A422
 0055A3C1    dd          0055A401
 0055A3C1    dd          0055A3E7
 0055A3E7    mov         eax,ebx
 0055A3E9    mov         edx,dword ptr [eax+1B4]
 0055A3EF    call        dword ptr [edx+4]
 0055A3F2    mov         eax,ebx
 0055A3F4    mov         edx,dword ptr [eax+18]
 0055A3F7    call        dword ptr [edx+8]
 0055A3FA    mov         dword ptr [ebx+14],0C9
 0055A401    mov         eax,ebx
 0055A403    mov         edx,dword ptr [eax+1B4]
 0055A409    call        dword ptr [edx]
 0055A40B    mov         esi,eax
 0055A40D    cmp         esi,1
>0055A410    jne         0055A44C
 0055A412    mov         eax,ebx
 0055A414    call        0055A154
 0055A419    mov         dword ptr [ebx+14],0CA
>0055A420    jmp         0055A44C
 0055A422    mov         esi,1
>0055A427    jmp         0055A44C
 0055A429    mov         eax,ebx
 0055A42B    mov         edx,dword ptr [eax+1B4]
 0055A431    call        dword ptr [edx]
 0055A433    mov         esi,eax
>0055A435    jmp         0055A44C
 0055A437    mov         eax,dword ptr [ebx]
 0055A439    mov         dword ptr [eax+14],14
 0055A440    mov         edx,dword ptr [ebx+14]
 0055A443    mov         dword ptr [eax+18],edx
 0055A446    mov         eax,ebx
 0055A448    mov         edx,dword ptr [eax]
 0055A44A    call        dword ptr [edx]
 0055A44C    mov         eax,esi
 0055A44E    pop         esi
 0055A44F    pop         ebx
 0055A450    ret
*}
end;

//0055A488
function jpeg_has_multiple_scans(var cinfo:jpeg_decompress_struct):LongBool;
begin
{*
 0055A488    push        ebx
 0055A489    mov         ebx,eax
 0055A48B    mov         eax,dword ptr [ebx+14]
 0055A48E    cmp         eax,0CA
>0055A493    jl          0055A49C
 0055A495    cmp         eax,0D2
>0055A49A    jle         0055A4B1
 0055A49C    mov         eax,dword ptr [ebx]
 0055A49E    mov         dword ptr [eax+14],14
 0055A4A5    mov         edx,dword ptr [ebx+14]
 0055A4A8    mov         dword ptr [eax+18],edx
 0055A4AB    mov         eax,ebx
 0055A4AD    mov         edx,dword ptr [eax]
 0055A4AF    call        dword ptr [edx]
 0055A4B1    mov         ecx,dword ptr [ebx+1B4]
 0055A4B7    mov         eax,dword ptr [ecx+10]
 0055A4BA    pop         ebx
 0055A4BB    ret
*}
end;

//0055A4BC
function jpeg_finish_decompress(var cinfo:jpeg_decompress_struct):LongBool;
begin
{*
 0055A4BC    push        ebx
 0055A4BD    mov         ebx,eax
 0055A4BF    mov         eax,dword ptr [ebx+14]
 0055A4C2    cmp         eax,0CD
>0055A4C7    je          0055A4D0
 0055A4C9    cmp         eax,0CE
>0055A4CE    jne         0055A504
 0055A4D0    cmp         dword ptr [ebx+40],0
>0055A4D4    jne         0055A504
 0055A4D6    mov         edx,dword ptr [ebx+8C]
 0055A4DC    cmp         edx,dword ptr [ebx+74]
>0055A4DF    jae         0055A4F0
 0055A4E1    mov         ecx,dword ptr [ebx]
 0055A4E3    mov         eax,ebx
 0055A4E5    mov         dword ptr [ecx+14],43
 0055A4EC    mov         edx,dword ptr [eax]
 0055A4EE    call        dword ptr [edx]
 0055A4F0    mov         eax,ebx
 0055A4F2    mov         edx,dword ptr [eax+1A4]
 0055A4F8    call        dword ptr [edx+4]
 0055A4FB    mov         dword ptr [ebx+14],0D2
>0055A502    jmp         0055A548
 0055A504    cmp         dword ptr [ebx+14],0CF
>0055A50B    jne         0055A516
 0055A50D    mov         dword ptr [ebx+14],0D2
>0055A514    jmp         0055A548
 0055A516    cmp         dword ptr [ebx+14],0D2
>0055A51D    je          0055A548
 0055A51F    mov         eax,dword ptr [ebx]
 0055A521    mov         dword ptr [eax+14],14
 0055A528    mov         edx,dword ptr [ebx+14]
 0055A52B    mov         dword ptr [eax+18],edx
 0055A52E    mov         eax,ebx
 0055A530    mov         edx,dword ptr [eax]
 0055A532    call        dword ptr [edx]
>0055A534    jmp         0055A548
 0055A536    mov         eax,ebx
 0055A538    mov         edx,dword ptr [eax+1B4]
 0055A53E    call        dword ptr [edx]
 0055A540    test        eax,eax
>0055A542    jne         0055A548
 0055A544    xor         eax,eax
 0055A546    pop         ebx
 0055A547    ret
 0055A548    mov         edx,dword ptr [ebx+1B4]
 0055A54E    cmp         dword ptr [edx+14],0
>0055A552    je          0055A536
 0055A554    mov         eax,ebx
 0055A556    mov         edx,dword ptr [eax+18]
 0055A559    call        dword ptr [edx+18]
 0055A55C    mov         eax,ebx
 0055A55E    call        @jpeg_abort
 0055A563    mov         eax,1
 0055A568    pop         ebx
 0055A569    ret
*}
end;

//0055A56C
procedure _DF_.;
begin
{*
 0055A56C    mov         ecx,dword ptr [eax]
 0055A56E    mov         dword ptr [ecx+14],36
 0055A575    mov         dword ptr [ecx+18],edx
 0055A578    mov         edx,dword ptr [eax]
 0055A57A    call        dword ptr [edx]
 0055A57C    ret
*}
end;

//0055B098
procedure @jinit_memory_mgr;
begin
{*
 0055B098    push        ebx
 0055B099    push        esi
 0055B09A    push        edi
 0055B09B    mov         esi,eax
 0055B09D    xor         eax,eax
 0055B09F    mov         dword ptr [esi+4],eax
>0055B0A2    jmp         0055B0B3
 0055B0A4    mov         edx,dword ptr [esi]
 0055B0A6    mov         eax,esi
 0055B0A8    mov         dword ptr [edx+14],2
 0055B0AF    mov         edx,dword ptr [eax]
 0055B0B1    call        dword ptr [edx]
 0055B0B3    mov         eax,3B9ACA00
 0055B0B8    cmp         eax,3B9ACA00
>0055B0BD    je          0055B0CE
 0055B0BF    mov         edx,dword ptr [esi]
 0055B0C1    mov         eax,esi
 0055B0C3    mov         dword ptr [edx+14],3
 0055B0CA    mov         edx,dword ptr [eax]
 0055B0CC    call        dword ptr [edx]
 0055B0CE    mov         eax,esi
 0055B0D0    call        @jpeg_mem_init
 0055B0D5    mov         edi,eax
 0055B0D7    mov         edx,54
 0055B0DC    mov         eax,esi
 0055B0DE    call        @jpeg_get_small
 0055B0E3    mov         ebx,eax
 0055B0E5    test        ebx,ebx
>0055B0E7    jne         0055B104
 0055B0E9    mov         eax,esi
 0055B0EB    call        @jpeg_mem_term
 0055B0F0    mov         eax,dword ptr [esi]
 0055B0F2    xor         edx,edx
 0055B0F4    mov         dword ptr [eax+14],36
 0055B0FB    mov         dword ptr [eax+18],edx
 0055B0FE    mov         eax,esi
 0055B100    mov         edx,dword ptr [eax]
 0055B102    call        dword ptr [edx]
 0055B104    mov         dword ptr [ebx],55A580
 0055B10A    mov         edx,1
 0055B10F    mov         dword ptr [ebx+4],55A6B0
 0055B116    mov         dword ptr [ebx+8],55A750
 0055B11D    mov         dword ptr [ebx+0C],55A824
 0055B124    mov         dword ptr [ebx+10],55A908
 0055B12B    mov         dword ptr [ebx+14],55A970
 0055B132    mov         dword ptr [ebx+18],55A9D8
 0055B139    mov         dword ptr [ebx+1C],55ACC8
 0055B140    mov         dword ptr [ebx+20],55AE0C
 0055B147    mov         dword ptr [ebx+24],55AF54
 0055B14E    mov         dword ptr [ebx+28],55B060
 0055B155    mov         dword ptr [ebx+30],3B9ACA00
 0055B15C    mov         dword ptr [ebx+2C],edi
 0055B15F    lea         eax,[ebx+38]
 0055B162    xor         ecx,ecx
 0055B164    dec         edx
 0055B165    mov         dword ptr [eax],ecx
 0055B167    xor         ecx,ecx
 0055B169    mov         dword ptr [eax+8],ecx
 0055B16C    add         eax,0FFFFFFFC
 0055B16F    test        edx,edx
>0055B171    jge         0055B162
 0055B173    xor         eax,eax
 0055B175    xor         edx,edx
 0055B177    mov         dword ptr [ebx+44],eax
 0055B17A    mov         dword ptr [ebx+48],edx
 0055B17D    mov         dword ptr [ebx+4C],54
 0055B184    mov         dword ptr [esi+4],ebx
 0055B187    pop         edi
 0055B188    pop         esi
 0055B189    pop         ebx
 0055B18A    ret
*}
end;

//0055B18C
procedure @jpeg_get_small;
begin
{*
 0055B18C    push        edx
 0055B18D    call        _malloc
 0055B192    pop         ecx
 0055B193    ret
*}
end;

//0055B194
procedure @jpeg_free_small;
begin
{*
 0055B194    push        edx
 0055B195    call        _free
 0055B19A    pop         ecx
 0055B19B    ret
*}
end;

//0055B19C
procedure @jpeg_get_large;
begin
{*
 0055B19C    push        edx
 0055B19D    call        _malloc
 0055B1A2    pop         ecx
 0055B1A3    ret
*}
end;

//0055B1A4
procedure @jpeg_free_large;
begin
{*
 0055B1A4    push        edx
 0055B1A5    call        _free
 0055B1AA    pop         ecx
 0055B1AB    ret
*}
end;

//0055B1AC
procedure @jpeg_mem_available;
begin
{*
 0055B1AC    push        ebp
 0055B1AD    mov         ebp,esp
 0055B1AF    mov         eax,ecx
 0055B1B1    pop         ebp
 0055B1B2    ret         4
*}
end;

//0055B1B8
procedure @jpeg_open_backing_store;
begin
{*
 0055B1B8    mov         edx,dword ptr [eax]
 0055B1BA    mov         dword ptr [edx+14],31
 0055B1C1    mov         ecx,dword ptr [eax]
 0055B1C3    call        dword ptr [ecx]
 0055B1C5    ret
*}
end;

//0055B1C8
procedure @jpeg_mem_init;
begin
{*
 0055B1C8    xor         eax,eax
 0055B1CA    ret
*}
end;

//0055B1CC
procedure @jpeg_mem_term;
begin
{*
 0055B1CC    ret
*}
end;

//0055B1D0
procedure _DF_.;
begin
{*
 0055B1D0    push        ebx
 0055B1D1    mov         ebx,eax
 0055B1D3    push        esi
 0055B1D4    push        edi
 0055B1D5    cmp         dword ptr [ebx+20],0FFDC
>0055B1DC    jg          0055B1E7
 0055B1DE    cmp         dword ptr [ebx+1C],0FFDC
>0055B1E5    jle         0055B1FD
 0055B1E7    mov         eax,dword ptr [ebx]
 0055B1E9    mov         dword ptr [eax+14],29
 0055B1F0    mov         dword ptr [eax+18],0FFDC
 0055B1F7    mov         eax,ebx
 0055B1F9    mov         edx,dword ptr [eax]
 0055B1FB    call        dword ptr [edx]
 0055B1FD    cmp         dword ptr [ebx+0D4],8
>0055B204    je          0055B21E
 0055B206    mov         eax,dword ptr [ebx]
 0055B208    mov         dword ptr [eax+14],0F
 0055B20F    mov         edx,dword ptr [ebx+0D4]
 0055B215    mov         dword ptr [eax+18],edx
 0055B218    mov         eax,ebx
 0055B21A    mov         edx,dword ptr [eax]
 0055B21C    call        dword ptr [edx]
 0055B21E    cmp         dword ptr [ebx+24],0A
>0055B222    jle         0055B240
 0055B224    mov         eax,dword ptr [ebx]
 0055B226    mov         dword ptr [eax+14],1A
 0055B22D    mov         edx,dword ptr [ebx+24]
 0055B230    mov         dword ptr [eax+18],edx
 0055B233    mov         dword ptr [eax+1C],0A
 0055B23A    mov         eax,ebx
 0055B23C    mov         edx,dword ptr [eax]
 0055B23E    call        dword ptr [edx]
 0055B240    mov         dword ptr [ebx+134],1
 0055B24A    mov         dword ptr [ebx+138],1
 0055B254    xor         edi,edi
 0055B256    mov         esi,dword ptr [ebx+0D8]
>0055B25C    jmp         0055B2C1
 0055B25E    mov         eax,dword ptr [esi+8]
 0055B261    test        eax,eax
>0055B263    jle         0055B276
 0055B265    cmp         eax,4
>0055B268    jg          0055B276
 0055B26A    cmp         dword ptr [esi+0C],0
>0055B26E    jle         0055B276
 0055B270    cmp         dword ptr [esi+0C],4
>0055B274    jle         0055B285
 0055B276    mov         edx,dword ptr [ebx]
 0055B278    mov         eax,ebx
 0055B27A    mov         dword ptr [edx+14],12
 0055B281    mov         edx,dword ptr [eax]
 0055B283    call        dword ptr [edx]
 0055B285    mov         ecx,dword ptr [ebx+134]
 0055B28B    cmp         ecx,dword ptr [esi+8]
>0055B28E    jle         0055B298
 0055B290    mov         eax,dword ptr [ebx+134]
>0055B296    jmp         0055B29B
 0055B298    mov         eax,dword ptr [esi+8]
 0055B29B    mov         dword ptr [ebx+134],eax
 0055B2A1    mov         edx,dword ptr [ebx+138]
 0055B2A7    cmp         edx,dword ptr [esi+0C]
>0055B2AA    jle         0055B2B4
 0055B2AC    mov         ecx,dword ptr [ebx+138]
>0055B2B2    jmp         0055B2B7
 0055B2B4    mov         ecx,dword ptr [esi+0C]
 0055B2B7    mov         dword ptr [ebx+138],ecx
 0055B2BD    inc         edi
 0055B2BE    add         esi,54
 0055B2C1    cmp         edi,dword ptr [ebx+24]
>0055B2C4    jl          0055B25E
 0055B2C6    mov         dword ptr [ebx+13C],8
 0055B2D0    xor         edi,edi
 0055B2D2    mov         esi,dword ptr [ebx+0D8]
>0055B2D8    jmp         0055B349
 0055B2DA    mov         dword ptr [esi+24],8
 0055B2E1    mov         edx,dword ptr [ebx+134]
 0055B2E7    shl         edx,3
 0055B2EA    mov         eax,dword ptr [ebx+1C]
 0055B2ED    imul        eax,dword ptr [esi+8]
 0055B2F1    call        @jdiv_round_up
 0055B2F6    mov         dword ptr [esi+1C],eax
 0055B2F9    mov         edx,dword ptr [ebx+138]
 0055B2FF    shl         edx,3
 0055B302    mov         eax,dword ptr [ebx+20]
 0055B305    imul        eax,dword ptr [esi+0C]
 0055B309    call        @jdiv_round_up
 0055B30E    mov         dword ptr [esi+20],eax
 0055B311    mov         eax,dword ptr [ebx+1C]
 0055B314    imul        dword ptr [esi+8]
 0055B317    mov         edx,dword ptr [ebx+134]
 0055B31D    call        @jdiv_round_up
 0055B322    mov         dword ptr [esi+28],eax
 0055B325    mov         eax,dword ptr [ebx+20]
 0055B328    imul        dword ptr [esi+0C]
 0055B32B    mov         edx,dword ptr [ebx+138]
 0055B331    call        @jdiv_round_up
 0055B336    mov         dword ptr [esi+2C],eax
 0055B339    xor         ecx,ecx
 0055B33B    mov         dword ptr [esi+30],1
 0055B342    mov         dword ptr [esi+4C],ecx
 0055B345    inc         edi
 0055B346    add         esi,54
 0055B349    cmp         edi,dword ptr [ebx+24]
>0055B34C    jl          0055B2DA
 0055B34E    mov         edx,dword ptr [ebx+138]
 0055B354    mov         eax,dword ptr [ebx+20]
 0055B357    shl         edx,3
 0055B35A    call        @jdiv_round_up
 0055B35F    mov         dword ptr [ebx+140],eax
 0055B365    mov         ecx,dword ptr [ebx+148]
 0055B36B    cmp         ecx,dword ptr [ebx+24]
>0055B36E    jl          0055B379
 0055B370    cmp         dword ptr [ebx+0DC],0
>0055B377    je          0055B388
 0055B379    mov         eax,dword ptr [ebx+1B4]
 0055B37F    mov         dword ptr [eax+10],1
>0055B386    jmp         0055B393
 0055B388    mov         edx,dword ptr [ebx+1B4]
 0055B38E    xor         ecx,ecx
 0055B390    mov         dword ptr [edx+10],ecx
 0055B393    pop         edi
 0055B394    pop         esi
 0055B395    pop         ebx
 0055B396    ret
*}
end;

//0055B6EC
procedure @jinit_input_controller;
begin
{*
 0055B6EC    push        ebx
 0055B6ED    mov         ebx,eax
 0055B6EF    mov         eax,ebx
 0055B6F1    push        esi
 0055B6F2    mov         ecx,1C
 0055B6F7    xor         edx,edx
 0055B6F9    mov         esi,dword ptr [eax+4]
 0055B6FC    call        dword ptr [esi]
 0055B6FE    mov         dword ptr [ebx+1B4],eax
 0055B704    mov         dword ptr [eax],55B604
 0055B70A    mov         dword ptr [eax+4],55B6B0
 0055B711    mov         dword ptr [eax+8],55B5BC
 0055B718    mov         dword ptr [eax+0C],55B5F4
 0055B71F    xor         edx,edx
 0055B721    xor         ecx,ecx
 0055B723    mov         dword ptr [eax+10],edx
 0055B726    mov         dword ptr [eax+14],ecx
 0055B729    mov         dword ptr [eax+18],1
 0055B730    pop         esi
 0055B731    pop         ebx
 0055B732    ret
*}
end;

//0055B734
procedure _DF_.;
begin
{*
 0055B734    mov         eax,dword ptr [eax+18]
 0055B737    mov         dword ptr [eax+24],1
 0055B73E    ret
*}
end;

//0055B7E0
procedure jpeg_stdio_src(var cinfo:jpeg_decompress_struct; input_file:TStream);
begin
{*
 0055B7E0    push        ebx
 0055B7E1    push        esi
 0055B7E2    mov         esi,eax
 0055B7E4    push        edi
 0055B7E5    push        ebp
 0055B7E6    mov         edi,edx
 0055B7E8    cmp         dword ptr [esi+18],0
>0055B7EC    jne         0055B813
 0055B7EE    mov         eax,esi
 0055B7F0    mov         ecx,28
 0055B7F5    xor         edx,edx
 0055B7F7    mov         ebx,dword ptr [eax+4]
 0055B7FA    call        dword ptr [ebx]
 0055B7FC    mov         ebx,eax
 0055B7FE    mov         eax,esi
 0055B800    mov         dword ptr [esi+18],ebx
 0055B803    mov         ecx,1000
 0055B808    mov         ebp,dword ptr [eax+4]
 0055B80B    xor         edx,edx
 0055B80D    call        dword ptr [ebp]
 0055B810    mov         dword ptr [ebx+20],eax
 0055B813    mov         ebx,dword ptr [esi+18]
 0055B816    xor         eax,eax
 0055B818    xor         edx,edx
 0055B81A    mov         dword ptr [ebx+8],55B734;_DF_.
 0055B821    mov         dword ptr [ebx+0C],55B740
 0055B828    mov         dword ptr [ebx+10],55B7B0
 0055B82F    mov         dword ptr [ebx+14],565510;@jpeg_resync_to_restart
 0055B836    mov         dword ptr [ebx+18],55B7DC
 0055B83D    mov         dword ptr [ebx+1C],edi
 0055B840    mov         dword ptr [ebx+4],eax
 0055B843    mov         dword ptr [ebx],edx
 0055B845    pop         ebp
 0055B846    pop         edi
 0055B847    pop         esi
 0055B848    pop         ebx
 0055B849    ret
*}
end;

//0055B84C
function jpeg_start_decompress(var cinfo:jpeg_decompress_struct):LongBool;
begin
{*
 0055B84C    push        ebx
 0055B84D    mov         ebx,eax
 0055B84F    cmp         dword ptr [ebx+14],0CA
>0055B856    jne         0055B87A
 0055B858    mov         eax,ebx
 0055B85A    call        @jinit_master_decompress
 0055B85F    cmp         dword ptr [ebx+40],0
>0055B863    je          0055B873
 0055B865    mov         dword ptr [ebx+14],0CF
 0055B86C    mov         eax,1
 0055B871    pop         ebx
 0055B872    ret
 0055B873    mov         dword ptr [ebx+14],0CB
 0055B87A    cmp         dword ptr [ebx+14],0CB
>0055B881    jne         0055B8EB
 0055B883    mov         edx,dword ptr [ebx+1B4]
 0055B889    cmp         dword ptr [edx+10],0
>0055B88D    je          0055B8DD
 0055B88F    cmp         dword ptr [ebx+8],0
>0055B893    je          0055B89C
 0055B895    mov         eax,ebx
 0055B897    mov         edx,dword ptr [eax+8]
 0055B89A    call        dword ptr [edx]
 0055B89C    mov         eax,ebx
 0055B89E    mov         edx,dword ptr [eax+1B4]
 0055B8A4    call        dword ptr [edx]
 0055B8A6    test        eax,eax
>0055B8A8    jne         0055B8AE
 0055B8AA    xor         eax,eax
 0055B8AC    pop         ebx
 0055B8AD    ret
 0055B8AE    cmp         eax,2
>0055B8B1    je          0055B8DD
 0055B8B3    cmp         dword ptr [ebx+8],0
>0055B8B7    je          0055B88F
 0055B8B9    cmp         eax,3
>0055B8BC    je          0055B8C1
 0055B8BE    dec         eax
>0055B8BF    jne         0055B88F
 0055B8C1    mov         edx,dword ptr [ebx+8]
 0055B8C4    inc         dword ptr [edx+4]
 0055B8C7    mov         ecx,dword ptr [edx+4]
 0055B8CA    mov         eax,dword ptr [ebx+8]
 0055B8CD    cmp         ecx,dword ptr [eax+8]
>0055B8D0    jl          0055B88F
 0055B8D2    mov         edx,dword ptr [ebx+140]
 0055B8D8    add         dword ptr [eax+8],edx
>0055B8DB    jmp         0055B88F
 0055B8DD    mov         ecx,dword ptr [ebx+90]
 0055B8E3    mov         dword ptr [ebx+98],ecx
>0055B8E9    jmp         0055B909
 0055B8EB    cmp         dword ptr [ebx+14],0CC
>0055B8F2    je          0055B909
 0055B8F4    mov         eax,dword ptr [ebx]
 0055B8F6    mov         dword ptr [eax+14],14
 0055B8FD    mov         edx,dword ptr [ebx+14]
 0055B900    mov         dword ptr [eax+18],edx
 0055B903    mov         eax,ebx
 0055B905    mov         edx,dword ptr [eax]
 0055B907    call        dword ptr [edx]
 0055B909    mov         eax,ebx
 0055B90B    call        0055B914
 0055B910    pop         ebx
 0055B911    ret
*}
end;

//0055B914
{*function sub_0055B914(?:?):?;
begin
 0055B914    push        ebx
 0055B915    mov         ebx,eax
 0055B917    push        esi
 0055B918    push        edi
 0055B919    cmp         dword ptr [ebx+14],0CC
>0055B920    je          0055B9A9
 0055B926    mov         eax,ebx
 0055B928    mov         edx,dword ptr [eax+1A4]
 0055B92E    call        dword ptr [edx]
 0055B930    xor         ecx,ecx
 0055B932    mov         dword ptr [ebx+8C],ecx
 0055B938    mov         dword ptr [ebx+14],0CC
>0055B93F    jmp         0055B9A9
>0055B941    jmp         0055B981
 0055B943    mov         eax,dword ptr [ebx+8]
 0055B946    test        eax,eax
>0055B948    je          0055B95A
 0055B94A    mov         dword ptr [eax+4],edx
 0055B94D    mov         edx,dword ptr [ebx+74]
 0055B950    mov         dword ptr [eax+8],edx
 0055B953    mov         eax,ebx
 0055B955    mov         edx,dword ptr [eax+8]
 0055B958    call        dword ptr [edx]
 0055B95A    mov         eax,ebx
 0055B95C    mov         esi,dword ptr [ebx+8C]
 0055B962    push        0
 0055B964    lea         ecx,[ebx+8C]
 0055B96A    mov         edi,dword ptr [eax+1A8]
 0055B970    xor         edx,edx
 0055B972    call        dword ptr [edi+4]
 0055B975    cmp         esi,dword ptr [ebx+8C]
>0055B97B    jne         0055B981
 0055B97D    xor         eax,eax
>0055B97F    jmp         0055B9CF
 0055B981    mov         edx,dword ptr [ebx+8C]
 0055B987    cmp         edx,dword ptr [ebx+74]
>0055B98A    jb          0055B943
 0055B98C    mov         eax,ebx
 0055B98E    mov         edx,dword ptr [eax+1A4]
 0055B994    call        dword ptr [edx+4]
 0055B997    mov         eax,ebx
 0055B999    mov         edx,dword ptr [eax+1A4]
 0055B99F    call        dword ptr [edx]
 0055B9A1    xor         ecx,ecx
 0055B9A3    mov         dword ptr [ebx+8C],ecx
 0055B9A9    mov         eax,dword ptr [ebx+1A4]
 0055B9AF    cmp         dword ptr [eax+8],0
>0055B9B3    jne         0055B981
 0055B9B5    cmp         dword ptr [ebx+44],0
>0055B9B9    je          0055B9C2
 0055B9BB    mov         edx,0CE
>0055B9C0    jmp         0055B9C7
 0055B9C2    mov         edx,0CD
 0055B9C7    mov         dword ptr [ebx+14],edx
 0055B9CA    mov         eax,1
 0055B9CF    pop         edi
 0055B9D0    pop         esi
 0055B9D1    pop         ebx
 0055B9D2    ret
end;*}

//0055B9D4
function jpeg_read_scanlines(var cinfo:jpeg_decompress_struct; scanlines:JSAMPARRAY; max_lines:Cardinal):Cardinal;
begin
{*
 0055B9D4    push        ebx
 0055B9D5    mov         ebx,eax
 0055B9D7    push        esi
 0055B9D8    push        edi
 0055B9D9    push        ecx
 0055B9DA    mov         edi,ecx
 0055B9DC    cmp         dword ptr [ebx+14],0CD
 0055B9E3    mov         esi,edx
>0055B9E5    je          0055B9FC
 0055B9E7    mov         eax,dword ptr [ebx]
 0055B9E9    mov         dword ptr [eax+14],14
 0055B9F0    mov         edx,dword ptr [ebx+14]
 0055B9F3    mov         dword ptr [eax+18],edx
 0055B9F6    mov         eax,ebx
 0055B9F8    mov         edx,dword ptr [eax]
 0055B9FA    call        dword ptr [edx]
 0055B9FC    mov         ecx,dword ptr [ebx+8C]
 0055BA02    cmp         ecx,dword ptr [ebx+74]
>0055BA05    jb          0055BA1E
 0055BA07    mov         eax,dword ptr [ebx]
 0055BA09    mov         dword ptr [eax+14],7B
 0055BA10    or          edx,0FFFFFFFF
 0055BA13    mov         eax,ebx
 0055BA15    mov         ecx,dword ptr [eax]
 0055BA17    call        dword ptr [ecx+4]
 0055BA1A    xor         eax,eax
>0055BA1C    jmp         0055BA5E
 0055BA1E    mov         eax,dword ptr [ebx+8]
 0055BA21    test        eax,eax
>0055BA23    je          0055BA3B
 0055BA25    mov         edx,dword ptr [ebx+8C]
 0055BA2B    mov         dword ptr [eax+4],edx
 0055BA2E    mov         ecx,dword ptr [ebx+74]
 0055BA31    mov         dword ptr [eax+8],ecx
 0055BA34    mov         eax,ebx
 0055BA36    mov         edx,dword ptr [eax+8]
 0055BA39    call        dword ptr [edx]
 0055BA3B    xor         ecx,ecx
 0055BA3D    mov         eax,ebx
 0055BA3F    mov         dword ptr [esp],ecx
 0055BA42    push        edi
 0055BA43    mov         edx,esi
 0055BA45    mov         esi,dword ptr [eax+1A8]
 0055BA4B    lea         ecx,[esp+4]
 0055BA4F    call        dword ptr [esi+4]
 0055BA52    mov         eax,dword ptr [esp]
 0055BA55    add         dword ptr [ebx+8C],eax
 0055BA5B    mov         eax,dword ptr [esp]
 0055BA5E    pop         edx
 0055BA5F    pop         edi
 0055BA60    pop         esi
 0055BA61    pop         ebx
 0055BA62    ret
*}
end;

//0055BB10
function jpeg_start_output(var cinfo:jpeg_decompress_struct; scan_number:Integer):LongBool;
begin
{*
 0055BB10    push        ebx
 0055BB11    mov         ebx,eax
 0055BB13    push        esi
 0055BB14    mov         esi,edx
 0055BB16    mov         eax,dword ptr [ebx+14]
 0055BB19    cmp         eax,0CF
>0055BB1E    je          0055BB3C
 0055BB20    cmp         eax,0CC
>0055BB25    je          0055BB3C
 0055BB27    mov         eax,dword ptr [ebx]
 0055BB29    mov         dword ptr [eax+14],14
 0055BB30    mov         edx,dword ptr [ebx+14]
 0055BB33    mov         dword ptr [eax+18],edx
 0055BB36    mov         eax,ebx
 0055BB38    mov         edx,dword ptr [eax]
 0055BB3A    call        dword ptr [edx]
 0055BB3C    test        esi,esi
>0055BB3E    jg          0055BB45
 0055BB40    mov         esi,1
 0055BB45    mov         eax,dword ptr [ebx+1B4]
 0055BB4B    cmp         dword ptr [eax+14],0
>0055BB4F    je          0055BB5F
 0055BB51    cmp         esi,dword ptr [ebx+90]
>0055BB57    jle         0055BB5F
 0055BB59    mov         esi,dword ptr [ebx+90]
 0055BB5F    mov         dword ptr [ebx+98],esi
 0055BB65    mov         eax,ebx
 0055BB67    call        0055B914
 0055BB6C    pop         esi
 0055BB6D    pop         ebx
 0055BB6E    ret
*}
end;

//0055BB70
function jpeg_finish_output(var cinfo:jpeg_decompress_struct):LongBool;
begin
{*
 0055BB70    push        ebx
 0055BB71    mov         ebx,eax
 0055BB73    mov         eax,dword ptr [ebx+14]
 0055BB76    cmp         eax,0CD
>0055BB7B    je          0055BB84
 0055BB7D    cmp         eax,0CE
>0055BB82    jne         0055BB9E
 0055BB84    cmp         dword ptr [ebx+40],0
>0055BB88    je          0055BB9E
 0055BB8A    mov         eax,ebx
 0055BB8C    mov         edx,dword ptr [eax+1A4]
 0055BB92    call        dword ptr [edx+4]
 0055BB95    mov         dword ptr [ebx+14],0D0
>0055BB9C    jmp         0055BBD0
 0055BB9E    cmp         dword ptr [ebx+14],0D0
>0055BBA5    je          0055BBD0
 0055BBA7    mov         eax,dword ptr [ebx]
 0055BBA9    mov         dword ptr [eax+14],14
 0055BBB0    mov         edx,dword ptr [ebx+14]
 0055BBB3    mov         dword ptr [eax+18],edx
 0055BBB6    mov         eax,ebx
 0055BBB8    mov         edx,dword ptr [eax]
 0055BBBA    call        dword ptr [edx]
>0055BBBC    jmp         0055BBD0
 0055BBBE    mov         eax,ebx
 0055BBC0    mov         edx,dword ptr [eax+1B4]
 0055BBC6    call        dword ptr [edx]
 0055BBC8    test        eax,eax
>0055BBCA    jne         0055BBD0
 0055BBCC    xor         eax,eax
 0055BBCE    pop         ebx
 0055BBCF    ret
 0055BBD0    mov         edx,dword ptr [ebx+90]
 0055BBD6    cmp         edx,dword ptr [ebx+98]
>0055BBDC    jg          0055BBEA
 0055BBDE    mov         ecx,dword ptr [ebx+1B4]
 0055BBE4    cmp         dword ptr [ecx+14],0
>0055BBE8    je          0055BBBE
 0055BBEA    mov         dword ptr [ebx+14],0CF
 0055BBF1    mov         eax,1
 0055BBF6    pop         ebx
 0055BBF7    ret
*}
end;

//0055BBF8
procedure _DF_.;
begin
{*
 0055BBF8    push        ebx
 0055BBF9    cmp         dword ptr [eax+4C],0
>0055BBFD    jne         0055BC08
 0055BBFF    cmp         dword ptr [eax+12C],0
>0055BC06    je          0055BC0C
 0055BC08    xor         eax,eax
 0055BC0A    pop         ebx
 0055BC0B    ret
 0055BC0C    cmp         dword ptr [eax+28],3
>0055BC10    jne         0055BC24
 0055BC12    cmp         dword ptr [eax+24],3
>0055BC16    jne         0055BC24
 0055BC18    cmp         dword ptr [eax+2C],2
>0055BC1C    jne         0055BC24
 0055BC1E    cmp         dword ptr [eax+78],3
>0055BC22    je          0055BC28
 0055BC24    xor         eax,eax
 0055BC26    pop         ebx
 0055BC27    ret
 0055BC28    mov         edx,dword ptr [eax+0D8]
 0055BC2E    cmp         dword ptr [edx+8],2
>0055BC32    jne         0055BC58
 0055BC34    cmp         dword ptr [edx+5C],1
>0055BC38    jne         0055BC58
 0055BC3A    cmp         dword ptr [edx+0B0],1
>0055BC41    jne         0055BC58
 0055BC43    cmp         dword ptr [edx+0C],2
>0055BC47    jg          0055BC58
 0055BC49    cmp         dword ptr [edx+60],1
>0055BC4D    jne         0055BC58
 0055BC4F    cmp         dword ptr [edx+0B4],1
>0055BC56    je          0055BC5C
 0055BC58    xor         eax,eax
 0055BC5A    pop         ebx
 0055BC5B    ret
 0055BC5C    mov         edx,dword ptr [eax+0D8]
 0055BC62    mov         ebx,dword ptr [edx+24]
 0055BC65    mov         ecx,dword ptr [eax+13C]
 0055BC6B    cmp         ebx,ecx
>0055BC6D    jne         0055BC7C
 0055BC6F    cmp         ecx,dword ptr [edx+78]
>0055BC72    jne         0055BC7C
 0055BC74    cmp         ecx,dword ptr [edx+0CC]
>0055BC7A    je          0055BC80
 0055BC7C    xor         eax,eax
 0055BC7E    pop         ebx
 0055BC7F    ret
 0055BC80    mov         eax,1
 0055BC85    pop         ebx
 0055BC86    ret
*}
end;

//0055BC88
procedure jpeg_calc_output_dimensions(var cinfo:jpeg_decompress_struct);
begin
{*
 0055BC88    push        ebx
 0055BC89    mov         ebx,eax
 0055BC8B    push        esi
 0055BC8C    push        edi
 0055BC8D    cmp         dword ptr [ebx+14],0CA
>0055BC94    je          0055BCAB
 0055BC96    mov         eax,dword ptr [ebx]
 0055BC98    mov         dword ptr [eax+14],14
 0055BC9F    mov         edx,dword ptr [ebx+14]
 0055BCA2    mov         dword ptr [eax+18],edx
 0055BCA5    mov         eax,ebx
 0055BCA7    mov         edx,dword ptr [eax]
 0055BCA9    call        dword ptr [edx]
 0055BCAB    mov         ecx,dword ptr [ebx+30]
 0055BCAE    shl         ecx,3
 0055BCB1    cmp         ecx,dword ptr [ebx+34]
>0055BCB4    ja          0055BCE5
 0055BCB6    mov         edx,8
 0055BCBB    mov         eax,dword ptr [ebx+1C]
 0055BCBE    call        @jdiv_round_up
 0055BCC3    mov         dword ptr [ebx+70],eax
 0055BCC6    mov         edx,8
 0055BCCB    mov         eax,dword ptr [ebx+20]
 0055BCCE    call        @jdiv_round_up
 0055BCD3    mov         dword ptr [ebx+74],eax
 0055BCD6    mov         dword ptr [ebx+13C],1
>0055BCE0    jmp         0055BD68
 0055BCE5    mov         ecx,dword ptr [ebx+30]
 0055BCE8    shl         ecx,2
 0055BCEB    cmp         ecx,dword ptr [ebx+34]
>0055BCEE    ja          0055BD1C
 0055BCF0    mov         edx,4
 0055BCF5    mov         eax,dword ptr [ebx+1C]
 0055BCF8    call        @jdiv_round_up
 0055BCFD    mov         dword ptr [ebx+70],eax
 0055BD00    mov         edx,4
 0055BD05    mov         eax,dword ptr [ebx+20]
 0055BD08    call        @jdiv_round_up
 0055BD0D    mov         dword ptr [ebx+74],eax
 0055BD10    mov         dword ptr [ebx+13C],2
>0055BD1A    jmp         0055BD68
 0055BD1C    mov         ecx,dword ptr [ebx+30]
 0055BD1F    add         ecx,ecx
 0055BD21    cmp         ecx,dword ptr [ebx+34]
>0055BD24    ja          0055BD52
 0055BD26    mov         edx,2
 0055BD2B    mov         eax,dword ptr [ebx+1C]
 0055BD2E    call        @jdiv_round_up
 0055BD33    mov         dword ptr [ebx+70],eax
 0055BD36    mov         edx,2
 0055BD3B    mov         eax,dword ptr [ebx+20]
 0055BD3E    call        @jdiv_round_up
 0055BD43    mov         dword ptr [ebx+74],eax
 0055BD46    mov         dword ptr [ebx+13C],4
>0055BD50    jmp         0055BD68
 0055BD52    mov         ecx,dword ptr [ebx+1C]
 0055BD55    mov         dword ptr [ebx+70],ecx
 0055BD58    mov         eax,dword ptr [ebx+20]
 0055BD5B    mov         dword ptr [ebx+74],eax
 0055BD5E    mov         dword ptr [ebx+13C],8
 0055BD68    xor         edi,edi
 0055BD6A    mov         esi,dword ptr [ebx+0D8]
>0055BD70    jmp         0055BDBA
 0055BD72    mov         eax,dword ptr [ebx+13C]
>0055BD78    jmp         0055BD7C
 0055BD7A    add         eax,eax
 0055BD7C    cmp         eax,8
>0055BD7F    jge         0055BDB3
 0055BD81    mov         edx,dword ptr [esi+8]
 0055BD84    imul        edx,eax
 0055BD87    add         edx,edx
 0055BD89    mov         ecx,dword ptr [ebx+134]
 0055BD8F    imul        ecx,dword ptr [ebx+13C]
 0055BD96    cmp         edx,ecx
>0055BD98    jg          0055BDB3
 0055BD9A    mov         edx,dword ptr [esi+0C]
 0055BD9D    imul        edx,eax
 0055BDA0    add         edx,edx
 0055BDA2    mov         ecx,dword ptr [ebx+138]
 0055BDA8    imul        ecx,dword ptr [ebx+13C]
 0055BDAF    cmp         edx,ecx
>0055BDB1    jle         0055BD7A
 0055BDB3    mov         dword ptr [esi+24],eax
 0055BDB6    inc         edi
 0055BDB7    add         esi,54
 0055BDBA    cmp         edi,dword ptr [ebx+24]
>0055BDBD    jl          0055BD72
 0055BDBF    xor         edi,edi
 0055BDC1    mov         esi,dword ptr [ebx+0D8]
>0055BDC7    jmp         0055BE01
 0055BDC9    mov         eax,dword ptr [esi+8]
 0055BDCC    imul        dword ptr [esi+24]
 0055BDCF    imul        dword ptr [ebx+1C]
 0055BDD2    mov         edx,dword ptr [ebx+134]
 0055BDD8    shl         edx,3
 0055BDDB    call        @jdiv_round_up
 0055BDE0    mov         dword ptr [esi+28],eax
 0055BDE3    mov         eax,dword ptr [esi+0C]
 0055BDE6    imul        dword ptr [esi+24]
 0055BDE9    imul        dword ptr [ebx+20]
 0055BDEC    mov         edx,dword ptr [ebx+138]
 0055BDF2    shl         edx,3
 0055BDF5    call        @jdiv_round_up
 0055BDFA    mov         dword ptr [esi+2C],eax
 0055BDFD    inc         edi
 0055BDFE    add         esi,54
 0055BE01    cmp         edi,dword ptr [ebx+24]
>0055BE04    jl          0055BDC9
 0055BE06    mov         ecx,dword ptr [ebx+2C]
 0055BE09    dec         ecx
>0055BE0A    je          0055BE19
 0055BE0C    dec         ecx
 0055BE0D    sub         ecx,2
>0055BE10    jb          0055BE22
 0055BE12    sub         ecx,2
>0055BE15    jb          0055BE2B
>0055BE17    jmp         0055BE34
 0055BE19    mov         dword ptr [ebx+78],1
>0055BE20    jmp         0055BE3A
 0055BE22    mov         dword ptr [ebx+78],3
>0055BE29    jmp         0055BE3A
 0055BE2B    mov         dword ptr [ebx+78],4
>0055BE32    jmp         0055BE3A
 0055BE34    mov         eax,dword ptr [ebx+24]
 0055BE37    mov         dword ptr [ebx+78],eax
 0055BE3A    cmp         dword ptr [ebx+54],0
>0055BE3E    je          0055BE47
 0055BE40    mov         edx,1
>0055BE45    jmp         0055BE4A
 0055BE47    mov         edx,dword ptr [ebx+78]
 0055BE4A    mov         dword ptr [ebx+7C],edx
 0055BE4D    mov         eax,ebx
 0055BE4F    call        _DF_.
 0055BE54    test        eax,eax
>0055BE56    je          0055BE66
 0055BE58    mov         ecx,dword ptr [ebx+138]
 0055BE5E    mov         dword ptr [ebx+80],ecx
>0055BE64    jmp         0055BE70
 0055BE66    mov         dword ptr [ebx+80],1
 0055BE70    pop         edi
 0055BE71    pop         esi
 0055BE72    pop         ebx
 0055BE73    ret
*}
end;

//0055BE74
{*procedure sub_0055BE74(?:?);
begin
 0055BE74    push        ebx
 0055BE75    mov         ebx,eax
 0055BE77    mov         eax,ebx
 0055BE79    push        esi
 0055BE7A    mov         ecx,580
 0055BE7F    mov         edx,1
 0055BE84    mov         esi,dword ptr [eax+4]
 0055BE87    call        dword ptr [esi]
 0055BE89    mov         esi,eax
 0055BE8B    add         esi,100
 0055BE91    mov         dword ptr [ebx+144],esi
 0055BE97    push        100
 0055BE9C    push        0
 0055BE9E    lea         eax,[esi-100]
 0055BEA4    push        eax
 0055BEA5    call        _memset
 0055BEAA    add         esp,0C
 0055BEAD    xor         eax,eax
 0055BEAF    mov         edx,esi
 0055BEB1    mov         byte ptr [edx],al
 0055BEB3    inc         eax
 0055BEB4    inc         edx
 0055BEB5    cmp         eax,0FF
>0055BEBA    jle         0055BEB1
 0055BEBC    add         esi,80
 0055BEC2    mov         eax,80
 0055BEC7    lea         edx,[esi+80]
 0055BECD    mov         byte ptr [edx],0FF
 0055BED0    inc         eax
 0055BED1    inc         edx
 0055BED2    cmp         eax,200
>0055BED7    jl          0055BECD
 0055BED9    push        180
 0055BEDE    push        0
 0055BEE0    lea         ecx,[esi+200]
 0055BEE6    push        ecx
 0055BEE7    call        _memset
 0055BEEC    add         esp,0C
 0055BEEF    push        80
 0055BEF4    mov         eax,dword ptr [ebx+144]
 0055BEFA    push        eax
 0055BEFB    add         esi,380
 0055BF01    push        esi
 0055BF02    call        _memcpy
 0055BF07    add         esp,0C
 0055BF0A    pop         esi
 0055BF0B    pop         ebx
 0055BF0C    ret
end;*}

//0055BF10
{*procedure sub_0055BF10(?:?);
begin
 0055BF10    push        ebx
 0055BF11    mov         ebx,eax
 0055BF13    push        esi
 0055BF14    mov         eax,ebx
 0055BF16    mov         esi,dword ptr [ebx+1A4]
 0055BF1C    call        jpeg_calc_output_dimensions
 0055BF21    mov         eax,ebx
 0055BF23    call        0055BE74
 0055BF28    mov         eax,dword ptr [ebx+70]
 0055BF2B    imul        dword ptr [ebx+78]
 0055BF2E    mov         edx,eax
 0055BF30    cmp         eax,edx
>0055BF32    je          0055BF43
 0055BF34    mov         ecx,dword ptr [ebx]
 0055BF36    mov         eax,ebx
 0055BF38    mov         dword ptr [ecx+14],46
 0055BF3F    mov         edx,dword ptr [eax]
 0055BF41    call        dword ptr [edx]
 0055BF43    xor         ecx,ecx
 0055BF45    mov         eax,ebx
 0055BF47    mov         dword ptr [esi+0C],ecx
 0055BF4A    call        _DF_.
 0055BF4F    mov         dword ptr [esi+10],eax
 0055BF52    xor         edx,edx
 0055BF54    mov         dword ptr [esi+14],edx
 0055BF57    xor         ecx,ecx
 0055BF59    mov         dword ptr [esi+18],ecx
 0055BF5C    cmp         dword ptr [ebx+54],0
>0055BF60    je          0055BF68
 0055BF62    cmp         dword ptr [ebx+40],0
>0055BF66    jne         0055BF77
 0055BF68    xor         eax,eax
 0055BF6A    mov         dword ptr [ebx+64],eax
 0055BF6D    xor         edx,edx
 0055BF6F    mov         dword ptr [ebx+68],edx
 0055BF72    xor         ecx,ecx
 0055BF74    mov         dword ptr [ebx+6C],ecx
 0055BF77    cmp         dword ptr [ebx+54],0
>0055BF7B    je          0055C011
 0055BF81    cmp         dword ptr [ebx+44],0
>0055BF85    je          0055BF96
 0055BF87    mov         eax,dword ptr [ebx]
 0055BF89    mov         dword ptr [eax+14],2F
 0055BF90    mov         eax,ebx
 0055BF92    mov         edx,dword ptr [eax]
 0055BF94    call        dword ptr [edx]
 0055BF96    cmp         dword ptr [ebx+78],3
>0055BF9A    je          0055BFB7
 0055BF9C    mov         dword ptr [ebx+64],1
 0055BFA3    xor         ecx,ecx
 0055BFA5    mov         dword ptr [ebx+68],ecx
 0055BFA8    xor         eax,eax
 0055BFAA    mov         dword ptr [ebx+6C],eax
 0055BFAD    xor         edx,edx
 0055BFAF    mov         dword ptr [ebx+88],edx
>0055BFB5    jmp         0055BFDF
 0055BFB7    cmp         dword ptr [ebx+88],0
>0055BFBE    je          0055BFC9
 0055BFC0    mov         dword ptr [ebx+68],1
>0055BFC7    jmp         0055BFDF
 0055BFC9    cmp         dword ptr [ebx+5C],0
>0055BFCD    je          0055BFD8
 0055BFCF    mov         dword ptr [ebx+6C],1
>0055BFD6    jmp         0055BFDF
 0055BFD8    mov         dword ptr [ebx+64],1
 0055BFDF    cmp         dword ptr [ebx+64],0
>0055BFE3    je          0055BFF5
 0055BFE5    mov         eax,ebx
 0055BFE7    call        @jinit_1pass_quantizer
 0055BFEC    mov         edx,dword ptr [ebx+1CC]
 0055BFF2    mov         dword ptr [esi+14],edx
 0055BFF5    cmp         dword ptr [ebx+6C],0
>0055BFF9    jne         0055C001
 0055BFFB    cmp         dword ptr [ebx+68],0
>0055BFFF    je          0055C011
 0055C001    mov         eax,ebx
 0055C003    call        @jinit_2pass_quantizer
 0055C008    mov         edx,dword ptr [ebx+1CC]
 0055C00E    mov         dword ptr [esi+18],edx
 0055C011    cmp         dword ptr [ebx+44],0
>0055C015    jne         0055C03E
 0055C017    cmp         dword ptr [esi+10],0
>0055C01B    je          0055C026
 0055C01D    mov         eax,ebx
 0055C01F    call        @jinit_merged_upsampler
>0055C024    jmp         0055C034
 0055C026    mov         eax,ebx
 0055C028    call        @jinit_color_deconverter
 0055C02D    mov         eax,ebx
 0055C02F    call        @jinit_upsampler
 0055C034    mov         edx,dword ptr [ebx+6C]
 0055C037    mov         eax,ebx
 0055C039    call        @jinit_d_post_controller
 0055C03E    mov         eax,ebx
 0055C040    call        @jinit_inverse_dct
 0055C045    cmp         dword ptr [ebx+0E0],0
>0055C04C    je          0055C05F
 0055C04E    mov         edx,dword ptr [ebx]
 0055C050    mov         eax,ebx
 0055C052    mov         dword ptr [edx+14],1
 0055C059    mov         edx,dword ptr [eax]
 0055C05B    call        dword ptr [edx]
>0055C05D    jmp         0055C078
 0055C05F    cmp         dword ptr [ebx+0DC],0
>0055C066    je          0055C071
 0055C068    mov         eax,ebx
 0055C06A    call        @jinit_phuff_decoder
>0055C06F    jmp         0055C078
 0055C071    mov         eax,ebx
 0055C073    call        @jinit_huff_decoder
 0055C078    mov         edx,dword ptr [ebx+1B4]
 0055C07E    cmp         dword ptr [edx+10],0
>0055C082    jne         0055C08E
 0055C084    cmp         dword ptr [ebx+40],0
>0055C088    jne         0055C08E
 0055C08A    xor         eax,eax
>0055C08C    jmp         0055C093
 0055C08E    mov         eax,1
 0055C093    mov         edx,eax
 0055C095    mov         eax,ebx
 0055C097    call        @jinit_d_coef_controller
 0055C09C    cmp         dword ptr [ebx+44],0
>0055C0A0    jne         0055C0AB
 0055C0A2    xor         edx,edx
 0055C0A4    mov         eax,ebx
 0055C0A6    call        @jinit_d_main_controller
 0055C0AB    mov         eax,ebx
 0055C0AD    mov         edx,dword ptr [eax+4]
 0055C0B0    call        dword ptr [edx+18]
 0055C0B3    mov         eax,ebx
 0055C0B5    mov         edx,dword ptr [eax+1B4]
 0055C0BB    call        dword ptr [edx+8]
 0055C0BE    cmp         dword ptr [ebx+8],0
>0055C0C2    je          0055C121
 0055C0C4    cmp         dword ptr [ebx+40],0
>0055C0C8    jne         0055C121
 0055C0CA    mov         ecx,dword ptr [ebx+1B4]
 0055C0D0    cmp         dword ptr [ecx+10],0
>0055C0D4    je          0055C121
 0055C0D6    cmp         dword ptr [ebx+0DC],0
>0055C0DD    je          0055C0EA
 0055C0DF    mov         edx,dword ptr [ebx+24]
 0055C0E2    lea         edx,[edx+edx*2]
 0055C0E5    add         edx,2
>0055C0E8    jmp         0055C0ED
 0055C0EA    mov         edx,dword ptr [ebx+24]
 0055C0ED    mov         eax,dword ptr [ebx+8]
 0055C0F0    xor         ecx,ecx
 0055C0F2    mov         dword ptr [eax+4],ecx
 0055C0F5    mov         ecx,dword ptr [ebx+140]
 0055C0FB    imul        ecx,edx
 0055C0FE    mov         dword ptr [eax+8],ecx
 0055C101    xor         edx,edx
 0055C103    mov         dword ptr [eax+0C],edx
 0055C106    cmp         dword ptr [ebx+6C],0
>0055C10A    je          0055C113
 0055C10C    mov         eax,3
>0055C111    jmp         0055C118
 0055C113    mov         eax,2
 0055C118    mov         edx,dword ptr [ebx+8]
 0055C11B    mov         dword ptr [edx+10],eax
 0055C11E    inc         dword ptr [esi+0C]
 0055C121    pop         esi
 0055C122    pop         ebx
 0055C123    ret
end;*}

//0055C300
procedure @jinit_master_decompress;
begin
{*
 0055C300    push        ebx
 0055C301    mov         ebx,eax
 0055C303    mov         eax,ebx
 0055C305    push        esi
 0055C306    mov         ecx,1C
 0055C30B    mov         edx,1
 0055C310    mov         esi,dword ptr [eax+4]
 0055C313    call        dword ptr [esi]
 0055C315    mov         dword ptr [ebx+1A4],eax
 0055C31B    mov         dword ptr [eax],55C124
 0055C321    mov         dword ptr [eax+4],55C278
 0055C328    xor         edx,edx
 0055C32A    mov         dword ptr [eax+8],edx
 0055C32D    mov         eax,ebx
 0055C32F    call        0055BF10
 0055C334    pop         esi
 0055C335    pop         ebx
 0055C336    ret
*}
end;

//0055C338
procedure _DF_.;
begin
{*
 0055C338    push        ebx
 0055C339    push        esi
 0055C33A    mov         ebx,eax
 0055C33C    push        edi
 0055C33D    push        ebp
 0055C33E    add         esp,0FFFFFFEC
 0055C341    cmp         dword ptr [ebx+190],0
 0055C348    sete        al
 0055C34B    and         eax,1
 0055C34E    mov         ebp,dword ptr [ebx+1BC]
 0055C354    mov         dword ptr [esp],eax
 0055C357    xor         eax,eax
 0055C359    cmp         dword ptr [esp],0
>0055C35D    je          0055C36F
 0055C35F    cmp         dword ptr [ebx+194],0
>0055C366    je          0055C395
 0055C368    mov         eax,1
>0055C36D    jmp         0055C395
 0055C36F    mov         edx,dword ptr [ebx+194]
 0055C375    cmp         edx,dword ptr [ebx+190]
>0055C37B    jl          0055C382
 0055C37D    cmp         edx,40
>0055C380    jl          0055C387
 0055C382    mov         eax,1
 0055C387    cmp         dword ptr [ebx+148],1
>0055C38E    je          0055C395
 0055C390    mov         eax,1
 0055C395    mov         edx,dword ptr [ebx+198]
 0055C39B    test        edx,edx
>0055C39D    je          0055C3AD
 0055C39F    dec         edx
 0055C3A0    cmp         edx,dword ptr [ebx+19C]
>0055C3A6    je          0055C3AD
 0055C3A8    mov         eax,1
 0055C3AD    cmp         dword ptr [ebx+19C],0D
>0055C3B4    jle         0055C3BB
 0055C3B6    mov         eax,1
 0055C3BB    test        eax,eax
>0055C3BD    je          0055C3F2
 0055C3BF    mov         eax,dword ptr [ebx]
 0055C3C1    mov         dword ptr [eax+14],10
 0055C3C8    mov         edx,dword ptr [ebx+190]
 0055C3CE    mov         dword ptr [eax+18],edx
 0055C3D1    mov         ecx,dword ptr [ebx+194]
 0055C3D7    mov         dword ptr [eax+1C],ecx
 0055C3DA    mov         edx,dword ptr [ebx+198]
 0055C3E0    mov         dword ptr [eax+20],edx
 0055C3E3    mov         ecx,dword ptr [ebx+19C]
 0055C3E9    mov         dword ptr [eax+24],ecx
 0055C3EC    mov         eax,ebx
 0055C3EE    mov         edx,dword ptr [eax]
 0055C3F0    call        dword ptr [edx]
 0055C3F2    xor         eax,eax
 0055C3F4    mov         dword ptr [esp+4],eax
 0055C3F8    lea         ecx,[ebx+14C]
 0055C3FE    mov         dword ptr [esp+0C],ecx
>0055C402    jmp         0055C4A5
 0055C407    mov         eax,dword ptr [esp+0C]
 0055C40B    mov         edx,dword ptr [eax]
 0055C40D    mov         ecx,dword ptr [edx+4]
 0055C410    mov         dword ptr [esp+8],ecx
 0055C414    mov         esi,dword ptr [esp+8]
 0055C418    shl         esi,8
 0055C41B    add         esi,dword ptr [ebx+0A0]
 0055C421    cmp         dword ptr [esp],0
>0055C425    jne         0055C44B
 0055C427    cmp         dword ptr [esi],0
>0055C42A    jge         0055C44B
 0055C42C    mov         eax,dword ptr [ebx]
 0055C42E    xor         ecx,ecx
 0055C430    mov         dword ptr [eax+14],73
 0055C437    mov         edx,dword ptr [esp+8]
 0055C43B    mov         dword ptr [eax+18],edx
 0055C43E    mov         dword ptr [eax+1C],ecx
 0055C441    mov         eax,ebx
 0055C443    or          edx,0FFFFFFFF
 0055C446    mov         ecx,dword ptr [eax]
 0055C448    call        dword ptr [ecx+4]
 0055C44B    mov         edi,dword ptr [ebx+190]
 0055C451    lea         eax,[esi+edi*4]
 0055C454    mov         esi,eax
>0055C456    jmp         0055C494
 0055C458    cmp         dword ptr [esi],0
>0055C45B    jge         0055C461
 0055C45D    xor         eax,eax
>0055C45F    jmp         0055C463
 0055C461    mov         eax,dword ptr [esi]
 0055C463    cmp         eax,dword ptr [ebx+198]
>0055C469    je          0055C488
 0055C46B    mov         eax,dword ptr [ebx]
 0055C46D    mov         dword ptr [eax+14],73
 0055C474    mov         edx,dword ptr [esp+8]
 0055C478    mov         dword ptr [eax+18],edx
 0055C47B    mov         dword ptr [eax+1C],edi
 0055C47E    or          edx,0FFFFFFFF
 0055C481    mov         eax,ebx
 0055C483    mov         ecx,dword ptr [eax]
 0055C485    call        dword ptr [ecx+4]
 0055C488    mov         eax,dword ptr [ebx+19C]
 0055C48E    mov         dword ptr [esi],eax
 0055C490    inc         edi
 0055C491    add         esi,4
 0055C494    cmp         edi,dword ptr [ebx+194]
>0055C49A    jle         0055C458
 0055C49C    inc         dword ptr [esp+4]
 0055C4A0    add         dword ptr [esp+0C],4
 0055C4A5    mov         edx,dword ptr [esp+4]
 0055C4A9    cmp         edx,dword ptr [ebx+148]
>0055C4AF    jl          0055C407
 0055C4B5    cmp         dword ptr [ebx+198],0
>0055C4BC    jne         0055C4D6
 0055C4BE    cmp         dword ptr [esp],0
>0055C4C2    je          0055C4CD
 0055C4C4    mov         dword ptr [ebp+4],55C600
>0055C4CB    jmp         0055C4EC
 0055C4CD    mov         dword ptr [ebp+4],55C83C
>0055C4D4    jmp         0055C4EC
 0055C4D6    cmp         dword ptr [esp],0
>0055C4DA    je          0055C4E5
 0055C4DC    mov         dword ptr [ebp+4],55CAC8
>0055C4E3    jmp         0055C4EC
 0055C4E5    mov         dword ptr [ebp+4],55CBC0
 0055C4EC    xor         ecx,ecx
 0055C4EE    lea         eax,[ebp+18]
 0055C4F1    mov         dword ptr [esp+4],ecx
 0055C4F5    mov         dword ptr [esp+10],eax
 0055C4F9    lea         edi,[ebx+14C]
>0055C4FF    jmp         0055C558
 0055C501    mov         eax,dword ptr [edi]
 0055C503    cmp         dword ptr [esp],0
>0055C507    je          0055C52A
 0055C509    cmp         dword ptr [ebx+198],0
>0055C510    jne         0055C544
 0055C512    mov         esi,dword ptr [eax+14]
 0055C515    mov         edx,1
 0055C51A    mov         ecx,esi
 0055C51C    lea         eax,[ebp+esi*4+2C]
 0055C520    push        eax
 0055C521    mov         eax,ebx
 0055C523    call        @jpeg_make_d_derived_tbl
>0055C528    jmp         0055C544
 0055C52A    mov         esi,dword ptr [eax+18]
 0055C52D    xor         edx,edx
 0055C52F    mov         ecx,esi
 0055C531    lea         eax,[ebp+esi*4+2C]
 0055C535    push        eax
 0055C536    mov         eax,ebx
 0055C538    call        @jpeg_make_d_derived_tbl
 0055C53D    mov         edx,dword ptr [ebp+esi*4+2C]
 0055C541    mov         dword ptr [ebp+3C],edx
 0055C544    mov         ecx,dword ptr [esp+10]
 0055C548    xor         eax,eax
 0055C54A    mov         dword ptr [ecx],eax
 0055C54C    inc         dword ptr [esp+4]
 0055C550    add         dword ptr [esp+10],4
 0055C555    add         edi,4
 0055C558    mov         edx,dword ptr [esp+4]
 0055C55C    cmp         edx,dword ptr [ebx+148]
>0055C562    jl          0055C501
 0055C564    xor         ecx,ecx
 0055C566    xor         eax,eax
 0055C568    mov         dword ptr [ebp+10],ecx
 0055C56B    mov         dword ptr [ebp+0C],eax
 0055C56E    xor         edx,edx
 0055C570    xor         ecx,ecx
 0055C572    mov         dword ptr [ebp+8],edx
 0055C575    mov         dword ptr [ebp+14],ecx
 0055C578    mov         eax,dword ptr [ebx+114]
 0055C57E    mov         dword ptr [ebp+28],eax
 0055C581    add         esp,14
 0055C584    pop         ebp
 0055C585    pop         edi
 0055C586    pop         esi
 0055C587    pop         ebx
 0055C588    ret
*}
end;

//0055CFEC
procedure @jinit_phuff_decoder;
begin
{*
 0055CFEC    push        ebx
 0055CFED    mov         ebx,eax
 0055CFEF    mov         eax,ebx
 0055CFF1    push        esi
 0055CFF2    mov         ecx,40
 0055CFF7    mov         edx,1
 0055CFFC    mov         esi,dword ptr [eax+4]
 0055CFFF    call        dword ptr [esi]
 0055D001    mov         edx,eax
 0055D003    mov         dword ptr [ebx+1BC],edx
 0055D009    mov         dword ptr [edx],55C338;_DF_.
 0055D00F    xor         eax,eax
 0055D011    lea         ecx,[edx+2C]
 0055D014    mov         edx,ecx
 0055D016    xor         ecx,ecx
 0055D018    inc         eax
 0055D019    mov         dword ptr [edx],ecx
 0055D01B    add         edx,4
 0055D01E    cmp         eax,4
>0055D021    jl          0055D016
 0055D023    mov         eax,ebx
 0055D025    mov         ecx,dword ptr [ebx+24]
 0055D028    shl         ecx,6
 0055D02B    mov         edx,1
 0055D030    mov         esi,dword ptr [eax+4]
 0055D033    shl         ecx,2
 0055D036    call        dword ptr [esi]
 0055D038    mov         esi,eax
 0055D03A    mov         dword ptr [ebx+0A0],esi
 0055D040    mov         edx,esi
 0055D042    xor         ecx,ecx
>0055D044    jmp         0055D058
 0055D046    xor         eax,eax
 0055D048    mov         dword ptr [edx],0FFFFFFFF
 0055D04E    add         edx,4
 0055D051    inc         eax
 0055D052    cmp         eax,40
>0055D055    jl          0055D048
 0055D057    inc         ecx
 0055D058    cmp         ecx,dword ptr [ebx+24]
>0055D05B    jl          0055D046
 0055D05D    pop         esi
 0055D05E    pop         ebx
 0055D05F    ret
*}
end;

//0055D060
procedure _DF_.;
begin
{*
 0055D060    push        ebx
 0055D061    mov         ebx,eax
 0055D063    push        esi
 0055D064    push        edi
 0055D065    add         esp,0FFFFFFF0
 0055D068    mov         esi,dword ptr [ebx+1BC]
 0055D06E    cmp         dword ptr [ebx+190],0
>0055D075    jne         0055D092
 0055D077    cmp         dword ptr [ebx+194],3F
>0055D07E    jne         0055D092
 0055D080    cmp         dword ptr [ebx+198],0
>0055D087    jne         0055D092
 0055D089    cmp         dword ptr [ebx+19C],0
>0055D090    je          0055D0A5
 0055D092    mov         eax,dword ptr [ebx]
 0055D094    mov         dword ptr [eax+14],7A
 0055D09B    or          edx,0FFFFFFFF
 0055D09E    mov         eax,ebx
 0055D0A0    mov         ecx,dword ptr [eax]
 0055D0A2    call        dword ptr [ecx+4]
 0055D0A5    xor         edx,edx
 0055D0A7    mov         dword ptr [esp],edx
 0055D0AA    lea         eax,[esi+14]
 0055D0AD    mov         dword ptr [esp+0C],eax
 0055D0B1    lea         edx,[ebx+14C]
 0055D0B7    mov         dword ptr [esp+8],edx
>0055D0BB    jmp         0055D101
 0055D0BD    mov         ecx,dword ptr [esp+8]
 0055D0C1    mov         edx,dword ptr [ecx]
 0055D0C3    mov         eax,dword ptr [edx+14]
 0055D0C6    mov         edi,dword ptr [edx+18]
 0055D0C9    mov         ecx,eax
 0055D0CB    lea         edx,[esi+eax*4+28]
 0055D0CF    push        edx
 0055D0D0    mov         edx,1
 0055D0D5    mov         eax,ebx
 0055D0D7    call        @jpeg_make_d_derived_tbl
 0055D0DC    lea         ecx,[esi+edi*4+38]
 0055D0E0    xor         edx,edx
 0055D0E2    push        ecx
 0055D0E3    mov         ecx,edi
 0055D0E5    mov         eax,ebx
 0055D0E7    call        @jpeg_make_d_derived_tbl
 0055D0EC    mov         eax,dword ptr [esp+0C]
 0055D0F0    xor         edx,edx
 0055D0F2    mov         dword ptr [eax],edx
 0055D0F4    inc         dword ptr [esp]
 0055D0F7    add         dword ptr [esp+0C],4
 0055D0FC    add         dword ptr [esp+8],4
 0055D101    mov         ecx,dword ptr [ebx+148]
 0055D107    cmp         ecx,dword ptr [esp]
>0055D10A    jg          0055D0BD
 0055D10C    xor         eax,eax
 0055D10E    mov         dword ptr [esp+4],eax
 0055D112    lea         eax,[esi+48]
 0055D115    lea         ecx,[ebx+168]
>0055D11B    jmp         0055D16D
 0055D11D    mov         edx,dword ptr [ecx]
 0055D11F    mov         dword ptr [esp],edx
 0055D122    mov         edx,dword ptr [esp]
 0055D125    mov         edx,dword ptr [ebx+edx*4+14C]
 0055D12C    mov         edi,dword ptr [edx+14]
 0055D12F    mov         edi,dword ptr [esi+edi*4+28]
 0055D133    mov         dword ptr [eax],edi
 0055D135    mov         edi,dword ptr [edx+18]
 0055D138    mov         edi,dword ptr [esi+edi*4+38]
 0055D13C    mov         dword ptr [eax+28],edi
 0055D13F    cmp         dword ptr [edx+30],0
>0055D143    je          0055D15B
 0055D145    mov         dword ptr [eax+50],1
 0055D14C    cmp         dword ptr [edx+24],1
 0055D150    setg        dl
 0055D153    and         edx,1
 0055D156    mov         dword ptr [eax+78],edx
>0055D159    jmp         0055D163
 0055D15B    xor         edx,edx
 0055D15D    mov         dword ptr [eax+78],edx
 0055D160    mov         dword ptr [eax+50],edx
 0055D163    inc         dword ptr [esp+4]
 0055D167    add         eax,4
 0055D16A    add         ecx,4
 0055D16D    mov         edx,dword ptr [ebx+164]
 0055D173    cmp         edx,dword ptr [esp+4]
>0055D177    jg          0055D11D
 0055D179    xor         eax,eax
 0055D17B    xor         ecx,ecx
 0055D17D    mov         dword ptr [esi+10],eax
 0055D180    xor         eax,eax
 0055D182    mov         dword ptr [esi+0C],ecx
 0055D185    mov         dword ptr [esi+8],eax
 0055D188    mov         edx,dword ptr [ebx+114]
 0055D18E    mov         dword ptr [esi+24],edx
 0055D191    add         esp,10
 0055D194    pop         edi
 0055D195    pop         esi
 0055D196    pop         ebx
 0055D197    ret
*}
end;

//0055D198
procedure @jpeg_make_d_derived_tbl;
begin
{*
 0055D198    push        ebp
 0055D199    mov         ebp,esp
 0055D19B    add         esp,0FFFFFAC8
 0055D1A1    push        ebx
 0055D1A2    push        esi
 0055D1A3    mov         dword ptr [ebp-8],edx
 0055D1A6    mov         dword ptr [ebp-4],eax
 0055D1A9    mov         esi,ecx
 0055D1AB    mov         ebx,dword ptr [ebp+8]
 0055D1AE    test        esi,esi
>0055D1B0    jl          0055D1B7
 0055D1B2    cmp         esi,4
>0055D1B5    jl          0055D1CD
 0055D1B7    mov         eax,dword ptr [ebp-4]
 0055D1BA    mov         eax,dword ptr [eax]
 0055D1BC    mov         dword ptr [eax+14],32
 0055D1C3    mov         dword ptr [eax+18],esi
 0055D1C6    mov         eax,dword ptr [ebp-4]
 0055D1C9    mov         edx,dword ptr [eax]
 0055D1CB    call        dword ptr [edx]
 0055D1CD    cmp         dword ptr [ebp-8],0
>0055D1D1    je          0055D1DF
 0055D1D3    mov         ecx,dword ptr [ebp-4]
 0055D1D6    mov         eax,dword ptr [ecx+esi*4+0B4]
>0055D1DD    jmp         0055D1E9
 0055D1DF    mov         edx,dword ptr [ebp-4]
 0055D1E2    mov         eax,dword ptr [edx+esi*4+0C4]
 0055D1E9    mov         dword ptr [ebp-0C],eax
 0055D1EC    cmp         dword ptr [ebp-0C],0
>0055D1F0    jne         0055D208
 0055D1F2    mov         edx,dword ptr [ebp-4]
 0055D1F5    mov         eax,dword ptr [edx]
 0055D1F7    mov         dword ptr [eax+14],32
 0055D1FE    mov         dword ptr [eax+18],esi
 0055D201    mov         eax,dword ptr [ebp-4]
 0055D204    mov         edx,dword ptr [eax]
 0055D206    call        dword ptr [edx]
 0055D208    cmp         dword ptr [ebx],0
>0055D20B    jne         0055D221
 0055D20D    mov         eax,dword ptr [ebp-4]
 0055D210    mov         ecx,590
 0055D215    mov         edx,1
 0055D21A    mov         esi,dword ptr [eax+4]
 0055D21D    call        dword ptr [esi]
 0055D21F    mov         dword ptr [ebx],eax
 0055D221    mov         eax,dword ptr [ebx]
 0055D223    mov         esi,1
 0055D228    mov         dword ptr [ebp-10],eax
 0055D22B    xor         eax,eax
 0055D22D    mov         edx,dword ptr [ebp-10]
 0055D230    mov         ecx,dword ptr [ebp-0C]
 0055D233    mov         dword ptr [edx+8C],ecx
 0055D239    mov         dword ptr [ebp-14],eax
 0055D23C    mov         eax,dword ptr [ebp-0C]
 0055D23F    lea         ebx,[eax+1]
 0055D242    xor         eax,eax
 0055D244    mov         al,byte ptr [ebx]
 0055D246    mov         dword ptr [ebp-18],eax
 0055D249    cmp         dword ptr [ebp-18],0
>0055D24D    jl          0055D25D
 0055D24F    mov         edx,dword ptr [ebp-14]
 0055D252    add         edx,dword ptr [ebp-18]
 0055D255    cmp         edx,100
>0055D25B    jle         0055D270
 0055D25D    mov         ecx,dword ptr [ebp-4]
 0055D260    mov         eax,dword ptr [ecx]
 0055D262    mov         dword ptr [eax+14],8
 0055D269    mov         eax,dword ptr [ebp-4]
 0055D26C    mov         edx,dword ptr [eax]
 0055D26E    call        dword ptr [edx]
 0055D270    mov         ecx,dword ptr [ebp-14]
 0055D273    lea         eax,[ebp+ecx-134]
>0055D27A    jmp         0055D284
 0055D27C    mov         edx,esi
 0055D27E    mov         byte ptr [eax],dl
 0055D280    inc         dword ptr [ebp-14]
 0055D283    inc         eax
 0055D284    mov         ecx,dword ptr [ebp-18]
 0055D287    add         dword ptr [ebp-18],0FFFFFFFF
 0055D28B    test        ecx,ecx
>0055D28D    jne         0055D27C
 0055D28F    inc         esi
 0055D290    inc         ebx
 0055D291    cmp         esi,10
>0055D294    jle         0055D242
 0055D296    mov         eax,dword ptr [ebp-14]
 0055D299    xor         ebx,ebx
 0055D29B    mov         byte ptr [ebp+eax-134],0
 0055D2A3    mov         edx,dword ptr [ebp-14]
 0055D2A6    xor         eax,eax
 0055D2A8    mov         dword ptr [ebp-1C],edx
 0055D2AB    movsx       esi,byte ptr [ebp-134]
 0055D2B2    mov         dword ptr [ebp-14],eax
>0055D2B5    jmp         0055D301
 0055D2B7    mov         edx,dword ptr [ebp-14]
 0055D2BA    mov         eax,dword ptr [ebp-14]
 0055D2BD    lea         eax,[ebp+eax-134]
 0055D2C4    lea         edx,[ebp+edx*4-538]
>0055D2CB    jmp         0055D2D7
 0055D2CD    mov         dword ptr [edx],ebx
 0055D2CF    add         edx,4
 0055D2D2    inc         dword ptr [ebp-14]
 0055D2D5    inc         eax
 0055D2D6    inc         ebx
 0055D2D7    movsx       ecx,byte ptr [eax]
 0055D2DA    cmp         esi,ecx
>0055D2DC    je          0055D2CD
 0055D2DE    mov         ecx,esi
 0055D2E0    mov         eax,1
 0055D2E5    shl         eax,cl
 0055D2E7    cmp         eax,ebx
>0055D2E9    jg          0055D2FE
 0055D2EB    mov         edx,dword ptr [ebp-4]
 0055D2EE    mov         eax,dword ptr [edx]
 0055D2F0    mov         dword ptr [eax+14],8
 0055D2F7    mov         eax,dword ptr [ebp-4]
 0055D2FA    mov         edx,dword ptr [eax]
 0055D2FC    call        dword ptr [edx]
 0055D2FE    add         ebx,ebx
 0055D300    inc         esi
 0055D301    mov         ecx,dword ptr [ebp-14]
 0055D304    cmp         byte ptr [ebp+ecx-134],0
>0055D30C    jne         0055D2B7
 0055D30E    xor         eax,eax
 0055D310    mov         dword ptr [ebp-14],eax
 0055D313    mov         esi,1
 0055D318    mov         eax,dword ptr [ebp-10]
 0055D31B    lea         edx,[eax+4C]
 0055D31E    mov         dword ptr [ebp-20],edx
 0055D321    mov         ecx,dword ptr [ebp-0C]
 0055D324    lea         eax,[ecx+1]
 0055D327    cmp         byte ptr [eax],0
>0055D32A    je          0055D357
 0055D32C    mov         edx,dword ptr [ebp-14]
 0055D32F    mov         ecx,dword ptr [ebp-14]
 0055D332    sub         ecx,dword ptr [ebp+edx*4-538]
 0055D339    mov         edx,dword ptr [ebp-20]
 0055D33C    mov         dword ptr [edx],ecx
 0055D33E    xor         ecx,ecx
 0055D340    mov         cl,byte ptr [eax]
 0055D342    add         dword ptr [ebp-14],ecx
 0055D345    mov         edx,dword ptr [ebp-14]
 0055D348    mov         ecx,dword ptr [ebp+edx*4-53C]
 0055D34F    mov         edx,dword ptr [ebp-20]
 0055D352    mov         dword ptr [edx-48],ecx
>0055D355    jmp         0055D361
 0055D357    mov         ecx,dword ptr [ebp-20]
 0055D35A    mov         dword ptr [ecx-48],0FFFFFFFF
 0055D361    add         dword ptr [ebp-20],4
 0055D365    inc         esi
 0055D366    inc         eax
 0055D367    cmp         esi,10
>0055D36A    jle         0055D327
 0055D36C    mov         eax,dword ptr [ebp-10]
 0055D36F    mov         dword ptr [eax+44],0FFFFF
 0055D376    push        400
 0055D37B    push        0
 0055D37D    mov         eax,dword ptr [ebp-10]
 0055D380    add         eax,90
 0055D385    push        eax
 0055D386    call        _memset
 0055D38B    add         esp,0C
 0055D38E    xor         edx,edx
 0055D390    mov         dword ptr [ebp-14],edx
 0055D393    mov         esi,1
 0055D398    mov         eax,dword ptr [ebp-0C]
 0055D39B    lea         edx,[eax+1]
 0055D39E    mov         dword ptr [ebp-20],edx
 0055D3A1    mov         dword ptr [ebp-18],1
 0055D3A8    mov         ecx,dword ptr [ebp-0C]
 0055D3AB    mov         eax,dword ptr [ebp-14]
 0055D3AE    lea         edx,[ecx+eax+11]
 0055D3B2    mov         dword ptr [ebp-30],edx
 0055D3B5    mov         ecx,dword ptr [ebp-14]
 0055D3B8    lea         eax,[ebp+ecx*4-538]
 0055D3BF    mov         dword ptr [ebp-28],eax
 0055D3C2    mov         edx,dword ptr [ebp-20]
 0055D3C5    mov         ecx,edx
 0055D3C7    mov         dword ptr [ebp-24],ecx
>0055D3CA    jmp         0055D424
 0055D3CC    mov         eax,dword ptr [ebp-28]
 0055D3CF    mov         edx,8
 0055D3D4    sub         edx,esi
 0055D3D6    mov         ebx,dword ptr [ebp-30]
 0055D3D9    mov         eax,dword ptr [eax]
 0055D3DB    mov         ecx,edx
 0055D3DD    shl         eax,cl
 0055D3DF    mov         ecx,edx
 0055D3E1    mov         edx,1
 0055D3E6    shl         edx,cl
 0055D3E8    mov         ecx,edx
 0055D3EA    mov         edx,dword ptr [ebp-10]
 0055D3ED    mov         dword ptr [ebp-2C],ebx
 0055D3F0    test        ecx,ecx
 0055D3F2    mov         ebx,dword ptr [ebp-10]
 0055D3F5    lea         edx,[edx+eax+490]
 0055D3FC    lea         eax,[ebx+eax*4+90]
>0055D403    jle         0055D417
 0055D405    mov         dword ptr [eax],esi
 0055D407    add         eax,4
 0055D40A    mov         ebx,dword ptr [ebp-2C]
 0055D40D    dec         ecx
 0055D40E    mov         bl,byte ptr [ebx]
 0055D410    mov         byte ptr [edx],bl
 0055D412    inc         edx
 0055D413    test        ecx,ecx
>0055D415    jg          0055D405
 0055D417    inc         dword ptr [ebp-18]
 0055D41A    add         dword ptr [ebp-28],4
 0055D41E    inc         dword ptr [ebp-30]
 0055D421    inc         dword ptr [ebp-14]
 0055D424    mov         eax,dword ptr [ebp-24]
 0055D427    xor         edx,edx
 0055D429    mov         dl,byte ptr [eax]
 0055D42B    cmp         edx,dword ptr [ebp-18]
>0055D42E    jge         0055D3CC
 0055D430    inc         esi
 0055D431    inc         dword ptr [ebp-20]
 0055D434    cmp         esi,8
>0055D437    jle         0055D3A1
 0055D43D    cmp         dword ptr [ebp-8],0
>0055D441    je          0055D489
 0055D443    xor         ecx,ecx
 0055D445    mov         dword ptr [ebp-18],ecx
 0055D448    mov         eax,dword ptr [ebp-0C]
 0055D44B    lea         edx,[eax+11]
 0055D44E    mov         dword ptr [ebp-20],edx
 0055D451    mov         ecx,dword ptr [ebp-18]
 0055D454    cmp         ecx,dword ptr [ebp-1C]
>0055D457    jge         0055D489
 0055D459    mov         eax,dword ptr [ebp-20]
 0055D45C    movzx       eax,byte ptr [eax]
 0055D45F    test        eax,eax
>0055D461    jl          0055D468
 0055D463    cmp         eax,0F
>0055D466    jle         0055D47B
 0055D468    mov         edx,dword ptr [ebp-4]
 0055D46B    mov         ecx,dword ptr [edx]
 0055D46D    mov         dword ptr [ecx+14],8
 0055D474    mov         eax,dword ptr [ebp-4]
 0055D477    mov         edx,dword ptr [eax]
 0055D479    call        dword ptr [edx]
 0055D47B    inc         dword ptr [ebp-18]
 0055D47E    inc         dword ptr [ebp-20]
 0055D481    mov         ecx,dword ptr [ebp-18]
 0055D484    cmp         ecx,dword ptr [ebp-1C]
>0055D487    jl          0055D459
 0055D489    pop         esi
 0055D48A    pop         ebx
 0055D48B    mov         esp,ebp
 0055D48D    pop         ebp
 0055D48E    ret         4
*}
end;

//0055D494
procedure @jpeg_fill_bit_buffer;
begin
{*
 0055D494    push        ebp
 0055D495    mov         ebp,esp
 0055D497    add         esp,0FFFFFFF0
 0055D49A    push        ebx
 0055D49B    push        esi
 0055D49C    mov         dword ptr [ebp-0C],ecx
 0055D49F    mov         dword ptr [ebp-8],edx
 0055D4A2    mov         dword ptr [ebp-4],eax
 0055D4A5    mov         eax,dword ptr [ebp-4]
 0055D4A8    mov         ebx,dword ptr [eax]
 0055D4AA    mov         eax,dword ptr [ebp-4]
 0055D4AD    mov         esi,dword ptr [eax+4]
 0055D4B0    mov         eax,dword ptr [ebp-4]
 0055D4B3    mov         edx,dword ptr [eax+10]
 0055D4B6    mov         dword ptr [ebp-10],edx
 0055D4B9    mov         ecx,dword ptr [ebp-10]
 0055D4BC    cmp         dword ptr [ecx+1A0],0
>0055D4C3    jne         0055D564
 0055D4C9    cmp         dword ptr [ebp-0C],19
>0055D4CD    jge         0055D5B4
 0055D4D3    test        esi,esi
>0055D4D5    jne         0055D4F6
 0055D4D7    mov         eax,dword ptr [ebp-10]
 0055D4DA    mov         edx,dword ptr [eax+18]
 0055D4DD    call        dword ptr [edx+0C]
 0055D4E0    test        eax,eax
>0055D4E2    jne         0055D4EB
 0055D4E4    xor         eax,eax
>0055D4E6    jmp         0055D5D6
 0055D4EB    mov         edx,dword ptr [ebp-10]
 0055D4EE    mov         eax,dword ptr [edx+18]
 0055D4F1    mov         ebx,dword ptr [eax]
 0055D4F3    mov         esi,dword ptr [eax+4]
 0055D4F6    dec         esi
 0055D4F7    xor         eax,eax
 0055D4F9    mov         al,byte ptr [ebx]
 0055D4FB    inc         ebx
 0055D4FC    cmp         eax,0FF
>0055D501    jne         0055D549
 0055D503    test        esi,esi
>0055D505    jne         0055D526
 0055D507    mov         eax,dword ptr [ebp-10]
 0055D50A    mov         edx,dword ptr [eax+18]
 0055D50D    call        dword ptr [edx+0C]
 0055D510    test        eax,eax
>0055D512    jne         0055D51B
 0055D514    xor         eax,eax
>0055D516    jmp         0055D5D6
 0055D51B    mov         edx,dword ptr [ebp-10]
 0055D51E    mov         eax,dword ptr [edx+18]
 0055D521    mov         ebx,dword ptr [eax]
 0055D523    mov         esi,dword ptr [eax+4]
 0055D526    dec         esi
 0055D527    xor         eax,eax
 0055D529    mov         al,byte ptr [ebx]
 0055D52B    inc         ebx
 0055D52C    cmp         eax,0FF
>0055D531    je          0055D503
 0055D533    test        eax,eax
>0055D535    jne         0055D53E
 0055D537    mov         eax,0FF
>0055D53C    jmp         0055D549
 0055D53E    mov         edx,dword ptr [ebp-10]
 0055D541    mov         dword ptr [edx+1A0],eax
>0055D547    jmp         0055D564
 0055D549    mov         ecx,dword ptr [ebp-8]
 0055D54C    shl         ecx,8
 0055D54F    or          eax,ecx
 0055D551    mov         dword ptr [ebp-8],eax
 0055D554    add         dword ptr [ebp-0C],8
 0055D558    cmp         dword ptr [ebp-0C],19
>0055D55C    jl          0055D4D3
>0055D562    jmp         0055D5B4
 0055D564    mov         eax,dword ptr [ebp+8]
 0055D567    cmp         eax,dword ptr [ebp-0C]
>0055D56A    jle         0055D5B4
 0055D56C    mov         edx,dword ptr [ebp-10]
 0055D56F    mov         ecx,dword ptr [edx+1BC]
 0055D575    cmp         dword ptr [ecx+8],0
>0055D579    jne         0055D5A2
 0055D57B    mov         eax,dword ptr [ebp-10]
 0055D57E    mov         edx,dword ptr [eax]
 0055D580    mov         dword ptr [edx+14],75
 0055D587    or          edx,0FFFFFFFF
 0055D58A    mov         eax,dword ptr [ebp-10]
 0055D58D    mov         ecx,dword ptr [eax]
 0055D58F    call        dword ptr [ecx+4]
 0055D592    mov         eax,dword ptr [ebp-10]
 0055D595    mov         edx,dword ptr [eax+1BC]
 0055D59B    mov         dword ptr [edx+8],1
 0055D5A2    mov         ecx,19
 0055D5A7    sub         ecx,dword ptr [ebp-0C]
 0055D5AA    shl         dword ptr [ebp-8],cl
 0055D5AD    mov         dword ptr [ebp-0C],19
 0055D5B4    mov         eax,dword ptr [ebp-4]
 0055D5B7    mov         dword ptr [eax],ebx
 0055D5B9    mov         edx,dword ptr [ebp-4]
 0055D5BC    mov         dword ptr [edx+4],esi
 0055D5BF    mov         ecx,dword ptr [ebp-4]
 0055D5C2    mov         eax,dword ptr [ebp-8]
 0055D5C5    mov         dword ptr [ecx+8],eax
 0055D5C8    mov         eax,1
 0055D5CD    mov         edx,dword ptr [ebp-4]
 0055D5D0    mov         ecx,dword ptr [ebp-0C]
 0055D5D3    mov         dword ptr [edx+0C],ecx
 0055D5D6    pop         esi
 0055D5D7    pop         ebx
 0055D5D8    mov         esp,ebp
 0055D5DA    pop         ebp
 0055D5DB    ret         4
*}
end;

//0055D5E0
procedure @jpeg_huff_decode;
begin
{*
 0055D5E0    push        ebp
 0055D5E1    mov         ebp,esp
 0055D5E3    add         esp,0FFFFFFF4
 0055D5E6    push        ebx
 0055D5E7    push        esi
 0055D5E8    push        edi
 0055D5E9    mov         ebx,ecx
 0055D5EB    mov         dword ptr [ebp-8],edx
 0055D5EE    mov         dword ptr [ebp-4],eax
 0055D5F1    mov         edi,dword ptr [ebp+8]
 0055D5F4    cmp         edi,ebx
>0055D5F6    jle         0055D621
 0055D5F8    push        edi
 0055D5F9    mov         ecx,ebx
 0055D5FB    mov         edx,dword ptr [ebp-8]
 0055D5FE    mov         eax,dword ptr [ebp-4]
 0055D601    call        @jpeg_fill_bit_buffer
 0055D606    test        eax,eax
>0055D608    jne         0055D612
 0055D60A    or          eax,0FFFFFFFF
>0055D60D    jmp         0055D6CF
 0055D612    mov         edx,dword ptr [ebp-4]
 0055D615    mov         ecx,dword ptr [edx+8]
 0055D618    mov         dword ptr [ebp-8],ecx
 0055D61B    mov         eax,dword ptr [ebp-4]
 0055D61E    mov         ebx,dword ptr [eax+0C]
 0055D621    sub         ebx,edi
 0055D623    mov         esi,dword ptr [ebp-8]
 0055D626    mov         ecx,ebx
 0055D628    mov         eax,1
 0055D62D    sar         esi,cl
 0055D62F    mov         ecx,edi
 0055D631    mov         edx,dword ptr [ebp+0C]
 0055D634    shl         eax,cl
 0055D636    dec         eax
 0055D637    and         esi,eax
 0055D639    lea         eax,[edx+edi*4]
 0055D63C    mov         dword ptr [ebp-0C],eax
>0055D63F    jmp         0055D681
 0055D641    add         esi,esi
 0055D643    cmp         ebx,1
>0055D646    jge         0055D66F
 0055D648    push        1
 0055D64A    mov         ecx,ebx
 0055D64C    mov         edx,dword ptr [ebp-8]
 0055D64F    mov         eax,dword ptr [ebp-4]
 0055D652    call        @jpeg_fill_bit_buffer
 0055D657    test        eax,eax
>0055D659    jne         0055D660
 0055D65B    or          eax,0FFFFFFFF
>0055D65E    jmp         0055D6CF
 0055D660    mov         edx,dword ptr [ebp-4]
 0055D663    mov         ecx,dword ptr [edx+8]
 0055D666    mov         dword ptr [ebp-8],ecx
 0055D669    mov         eax,dword ptr [ebp-4]
 0055D66C    mov         ebx,dword ptr [eax+0C]
 0055D66F    dec         ebx
 0055D670    mov         ecx,ebx
 0055D672    mov         eax,dword ptr [ebp-8]
 0055D675    sar         eax,cl
 0055D677    and         eax,1
 0055D67A    or          esi,eax
 0055D67C    inc         edi
 0055D67D    add         dword ptr [ebp-0C],4
 0055D681    mov         edx,dword ptr [ebp-0C]
 0055D684    cmp         esi,dword ptr [edx]
>0055D686    jg          0055D641
 0055D688    mov         eax,dword ptr [ebp-4]
 0055D68B    mov         edx,dword ptr [ebp-8]
 0055D68E    cmp         edi,10
 0055D691    mov         dword ptr [eax+8],edx
 0055D694    mov         ecx,dword ptr [ebp-4]
 0055D697    mov         dword ptr [ecx+0C],ebx
>0055D69A    jle         0055D6B7
 0055D69C    mov         eax,dword ptr [ebp-4]
 0055D69F    mov         eax,dword ptr [eax+10]
 0055D6A2    mov         edx,dword ptr [eax]
 0055D6A4    mov         dword ptr [edx+14],76
 0055D6AB    or          edx,0FFFFFFFF
 0055D6AE    mov         ecx,dword ptr [eax]
 0055D6B0    call        dword ptr [ecx+4]
 0055D6B3    xor         eax,eax
>0055D6B5    jmp         0055D6CF
 0055D6B7    mov         edx,dword ptr [ebp+0C]
 0055D6BA    mov         eax,dword ptr [ebp+0C]
 0055D6BD    mov         ecx,dword ptr [edx+edi*4+48]
 0055D6C1    mov         edx,dword ptr [eax+8C]
 0055D6C7    lea         eax,[edx+esi]
 0055D6CA    movzx       eax,byte ptr [eax+ecx+11]
 0055D6CF    pop         edi
 0055D6D0    pop         esi
 0055D6D1    pop         ebx
 0055D6D2    mov         esp,ebp
 0055D6D4    pop         ebp
 0055D6D5    ret         8
*}
end;

//0055DBAC
procedure @jinit_huff_decoder;
begin
{*
 0055DBAC    push        ebx
 0055DBAD    mov         ebx,eax
 0055DBAF    mov         eax,ebx
 0055DBB1    push        esi
 0055DBB2    mov         ecx,0E8
 0055DBB7    mov         edx,1
 0055DBBC    mov         esi,dword ptr [eax+4]
 0055DBBF    call        dword ptr [esi]
 0055DBC1    mov         dword ptr [ebx+1BC],eax
 0055DBC7    mov         dword ptr [eax],55D060;_DF_.
 0055DBCD    mov         dword ptr [eax+4],55D748
 0055DBD4    xor         edx,edx
 0055DBD6    add         eax,38
 0055DBD9    xor         ecx,ecx
 0055DBDB    mov         dword ptr [eax],ecx
 0055DBDD    mov         dword ptr [eax-10],ecx
 0055DBE0    inc         edx
 0055DBE1    add         eax,4
 0055DBE4    cmp         edx,4
>0055DBE7    jl          0055DBD9
 0055DBE9    pop         esi
 0055DBEA    pop         ebx
 0055DBEB    ret
*}
end;

//0055DBEC
procedure _DF_.;
begin
{*
 0055DBEC    push        ebx
 0055DBED    push        esi
 0055DBEE    mov         esi,eax
 0055DBF0    push        edi
 0055DBF1    mov         eax,esi
 0055DBF3    mov         ecx,400
 0055DBF8    mov         ebx,dword ptr [esi+1C4]
 0055DBFE    mov         edx,1
 0055DC03    mov         edi,dword ptr [eax+4]
 0055DC06    call        dword ptr [edi]
 0055DC08    mov         dword ptr [ebx+10],eax
 0055DC0B    mov         eax,esi
 0055DC0D    mov         ecx,400
 0055DC12    mov         edx,1
 0055DC17    mov         edi,dword ptr [eax+4]
 0055DC1A    call        dword ptr [edi]
 0055DC1C    mov         dword ptr [ebx+14],eax
 0055DC1F    mov         eax,esi
 0055DC21    mov         ecx,400
 0055DC26    mov         edx,1
 0055DC2B    mov         edi,dword ptr [eax+4]
 0055DC2E    call        dword ptr [edi]
 0055DC30    mov         dword ptr [ebx+18],eax
 0055DC33    mov         eax,esi
 0055DC35    mov         ecx,400
 0055DC3A    mov         edx,1
 0055DC3F    mov         esi,dword ptr [eax+4]
 0055DC42    call        dword ptr [esi]
 0055DC44    mov         dword ptr [ebx+1C],eax
 0055DC47    xor         eax,eax
 0055DC49    mov         edx,0FFFFFF80
 0055DC4E    imul        ecx,edx,166E9
 0055DC54    add         ecx,8000
 0055DC5A    mov         esi,dword ptr [ebx+10]
 0055DC5D    sar         ecx,10
 0055DC60    mov         dword ptr [esi+eax*4],ecx
 0055DC63    imul        ecx,edx,1C5A2
 0055DC69    add         ecx,8000
 0055DC6F    mov         esi,dword ptr [ebx+14]
 0055DC72    sar         ecx,10
 0055DC75    mov         dword ptr [esi+eax*4],ecx
 0055DC78    imul        ecx,edx,0FFFF492E
 0055DC7E    mov         esi,dword ptr [ebx+18]
 0055DC81    mov         dword ptr [esi+eax*4],ecx
 0055DC84    imul        ecx,edx,0FFFFA7E6
 0055DC8A    mov         esi,dword ptr [ebx+1C]
 0055DC8D    add         ecx,8000
 0055DC93    inc         edx
 0055DC94    mov         dword ptr [esi+eax*4],ecx
 0055DC97    inc         eax
 0055DC98    cmp         eax,0FF
>0055DC9D    jle         0055DC4E
 0055DC9F    pop         edi
 0055DCA0    pop         esi
 0055DCA1    pop         ebx
 0055DCA2    ret
*}
end;

//0055E158
procedure @jinit_merged_upsampler;
begin
{*
 0055E158    push        ebx
 0055E159    push        esi
 0055E15A    mov         esi,eax
 0055E15C    push        edi
 0055E15D    mov         eax,esi
 0055E15F    mov         ecx,30
 0055E164    mov         edx,1
 0055E169    mov         ebx,dword ptr [eax+4]
 0055E16C    call        dword ptr [ebx]
 0055E16E    mov         ebx,eax
 0055E170    xor         eax,eax
 0055E172    mov         dword ptr [esi+1C4],ebx
 0055E178    mov         dword ptr [ebx],55DCA4
 0055E17E    mov         dword ptr [ebx+8],eax
 0055E181    mov         edx,dword ptr [esi+70]
 0055E184    imul        edx,dword ptr [esi+78]
 0055E188    mov         dword ptr [ebx+28],edx
 0055E18B    cmp         dword ptr [esi+138],2
>0055E192    jne         0055E1B7
 0055E194    mov         dword ptr [ebx+4],55DCB8
 0055E19B    mov         eax,esi
 0055E19D    mov         edx,1
 0055E1A2    mov         dword ptr [ebx+0C],55DF20
 0055E1A9    mov         edi,dword ptr [eax+4]
 0055E1AC    mov         ecx,dword ptr [ebx+28]
 0055E1AF    call        dword ptr [edi+4]
 0055E1B2    mov         dword ptr [ebx+20],eax
>0055E1B5    jmp         0055E1CA
 0055E1B7    mov         dword ptr [ebx+4],55DD70
 0055E1BE    mov         dword ptr [ebx+0C],55DDA8
 0055E1C5    xor         eax,eax
 0055E1C7    mov         dword ptr [ebx+20],eax
 0055E1CA    mov         eax,esi
 0055E1CC    call        _DF_.
 0055E1D1    pop         edi
 0055E1D2    pop         esi
 0055E1D3    pop         ebx
 0055E1D4    ret
*}
end;

//0055E1D8
procedure _DF_.;
begin
{*
 0055E1D8    push        ebx
 0055E1D9    push        esi
 0055E1DA    mov         esi,eax
 0055E1DC    push        edi
 0055E1DD    mov         eax,esi
 0055E1DF    mov         ecx,400
 0055E1E4    mov         ebx,dword ptr [esi+1C8]
 0055E1EA    mov         edx,1
 0055E1EF    mov         edi,dword ptr [eax+4]
 0055E1F2    call        dword ptr [edi]
 0055E1F4    mov         dword ptr [ebx+8],eax
 0055E1F7    mov         eax,esi
 0055E1F9    mov         ecx,400
 0055E1FE    mov         edx,1
 0055E203    mov         edi,dword ptr [eax+4]
 0055E206    call        dword ptr [edi]
 0055E208    mov         dword ptr [ebx+0C],eax
 0055E20B    mov         eax,esi
 0055E20D    mov         ecx,400
 0055E212    mov         edx,1
 0055E217    mov         edi,dword ptr [eax+4]
 0055E21A    call        dword ptr [edi]
 0055E21C    mov         dword ptr [ebx+10],eax
 0055E21F    mov         eax,esi
 0055E221    mov         ecx,400
 0055E226    mov         edx,1
 0055E22B    mov         esi,dword ptr [eax+4]
 0055E22E    call        dword ptr [esi]
 0055E230    mov         dword ptr [ebx+14],eax
 0055E233    xor         eax,eax
 0055E235    mov         edx,0FFFFFF80
 0055E23A    imul        ecx,edx,166E9
 0055E240    add         ecx,8000
 0055E246    mov         esi,dword ptr [ebx+8]
 0055E249    sar         ecx,10
 0055E24C    mov         dword ptr [esi+eax*4],ecx
 0055E24F    imul        ecx,edx,1C5A2
 0055E255    add         ecx,8000
 0055E25B    mov         esi,dword ptr [ebx+0C]
 0055E25E    sar         ecx,10
 0055E261    mov         dword ptr [esi+eax*4],ecx
 0055E264    imul        ecx,edx,0FFFF492E
 0055E26A    mov         esi,dword ptr [ebx+10]
 0055E26D    mov         dword ptr [esi+eax*4],ecx
 0055E270    imul        ecx,edx,0FFFFA7E6
 0055E276    mov         esi,dword ptr [ebx+14]
 0055E279    add         ecx,8000
 0055E27F    inc         edx
 0055E280    mov         dword ptr [esi+eax*4],ecx
 0055E283    inc         eax
 0055E284    cmp         eax,0FF
>0055E289    jle         0055E23A
 0055E28B    pop         edi
 0055E28C    pop         esi
 0055E28D    pop         ebx
 0055E28E    ret
*}
end;

//0055E5B4
procedure @jinit_color_deconverter;
begin
{*
 0055E5B4    push        ebx
 0055E5B5    mov         ebx,eax
 0055E5B7    mov         eax,ebx
 0055E5B9    push        esi
 0055E5BA    mov         ecx,18
 0055E5BF    mov         edx,1
 0055E5C4    mov         esi,dword ptr [eax+4]
 0055E5C7    call        dword ptr [esi]
 0055E5C9    mov         esi,eax
 0055E5CB    mov         dword ptr [ebx+1C8],esi
 0055E5D1    mov         dword ptr [esi],55E5B0
 0055E5D7    mov         eax,dword ptr [ebx+28]
 0055E5DA    dec         eax
>0055E5DB    je          0055E5EA
 0055E5DD    dec         eax
 0055E5DE    sub         eax,2
>0055E5E1    jb          0055E601
 0055E5E3    sub         eax,2
>0055E5E6    jb          0055E618
>0055E5E8    jmp         0055E62F
 0055E5EA    cmp         dword ptr [ebx+24],1
>0055E5EE    je          0055E644
 0055E5F0    mov         edx,dword ptr [ebx]
 0055E5F2    mov         eax,ebx
 0055E5F4    mov         dword ptr [edx+14],0A
 0055E5FB    mov         edx,dword ptr [eax]
 0055E5FD    call        dword ptr [edx]
>0055E5FF    jmp         0055E644
 0055E601    cmp         dword ptr [ebx+24],3
>0055E605    je          0055E644
 0055E607    mov         ecx,dword ptr [ebx]
 0055E609    mov         eax,ebx
 0055E60B    mov         dword ptr [ecx+14],0A
 0055E612    mov         edx,dword ptr [eax]
 0055E614    call        dword ptr [edx]
>0055E616    jmp         0055E644
 0055E618    cmp         dword ptr [ebx+24],4
>0055E61C    je          0055E644
 0055E61E    mov         ecx,dword ptr [ebx]
 0055E620    mov         eax,ebx
 0055E622    mov         dword ptr [ecx+14],0A
 0055E629    mov         edx,dword ptr [eax]
 0055E62B    call        dword ptr [edx]
>0055E62D    jmp         0055E644
 0055E62F    cmp         dword ptr [ebx+24],1
>0055E633    jge         0055E644
 0055E635    mov         ecx,dword ptr [ebx]
 0055E637    mov         eax,ebx
 0055E639    mov         dword ptr [ecx+14],0A
 0055E640    mov         edx,dword ptr [eax]
 0055E642    call        dword ptr [edx]
 0055E644    mov         ecx,dword ptr [ebx+2C]
 0055E647    dec         ecx
>0055E648    je          0055E65B
 0055E64A    dec         ecx
>0055E64B    je          0055E6B2
 0055E64D    sub         ecx,2
>0055E650    je          0055E704
>0055E656    jmp         0055E741
 0055E65B    mov         dword ptr [ebx+78],1
 0055E662    mov         eax,dword ptr [ebx+28]
 0055E665    cmp         eax,1
>0055E668    je          0055E66F
 0055E66A    cmp         eax,3
>0055E66D    jne         0055E69E
 0055E66F    mov         dword ptr [esi+4],55E408
 0055E676    mov         eax,1
>0055E67B    jmp         0055E694
 0055E67D    mov         edx,eax
 0055E67F    mov         ecx,dword ptr [ebx+0D8]
 0055E685    shl         edx,3
 0055E688    xor         esi,esi
 0055E68A    sub         edx,eax
 0055E68C    inc         eax
 0055E68D    lea         edx,[edx+edx*2]
 0055E690    mov         dword ptr [ecx+edx*4+30],esi
 0055E694    cmp         eax,dword ptr [ebx+24]
>0055E697    jl          0055E67D
>0055E699    jmp         0055E767
 0055E69E    mov         eax,dword ptr [ebx]
 0055E6A0    mov         dword ptr [eax+14],1B
 0055E6A7    mov         eax,ebx
 0055E6A9    mov         edx,dword ptr [eax]
 0055E6AB    call        dword ptr [edx]
>0055E6AD    jmp         0055E767
 0055E6B2    mov         dword ptr [ebx+78],3
 0055E6B9    cmp         dword ptr [ebx+28],3
>0055E6BD    jne         0055E6D2
 0055E6BF    mov         dword ptr [esi+4],55E290
 0055E6C6    mov         eax,ebx
 0055E6C8    call        _DF_.
>0055E6CD    jmp         0055E767
 0055E6D2    cmp         dword ptr [ebx+28],1
>0055E6D6    jne         0055E6E4
 0055E6D8    mov         dword ptr [esi+4],55E428
>0055E6DF    jmp         0055E767
 0055E6E4    cmp         dword ptr [ebx+28],2
>0055E6E8    jne         0055E6F3
 0055E6EA    mov         dword ptr [esi+4],55E398
>0055E6F1    jmp         0055E767
 0055E6F3    mov         edx,dword ptr [ebx]
 0055E6F5    mov         eax,ebx
 0055E6F7    mov         dword ptr [edx+14],1B
 0055E6FE    mov         edx,dword ptr [eax]
 0055E700    call        dword ptr [edx]
>0055E702    jmp         0055E767
 0055E704    mov         dword ptr [ebx+78],4
 0055E70B    cmp         dword ptr [ebx+28],5
>0055E70F    jne         0055E721
 0055E711    mov         dword ptr [esi+4],55E470
 0055E718    mov         eax,ebx
 0055E71A    call        _DF_.
>0055E71F    jmp         0055E767
 0055E721    cmp         dword ptr [ebx+28],4
>0055E725    jne         0055E730
 0055E727    mov         dword ptr [esi+4],55E398
>0055E72E    jmp         0055E767
 0055E730    mov         edx,dword ptr [ebx]
 0055E732    mov         eax,ebx
 0055E734    mov         dword ptr [edx+14],1B
 0055E73B    mov         edx,dword ptr [eax]
 0055E73D    call        dword ptr [edx]
>0055E73F    jmp         0055E767
 0055E741    mov         ecx,dword ptr [ebx+2C]
 0055E744    cmp         ecx,dword ptr [ebx+28]
>0055E747    jne         0055E758
 0055E749    mov         eax,dword ptr [ebx+24]
 0055E74C    mov         dword ptr [ebx+78],eax
 0055E74F    mov         dword ptr [esi+4],55E398
>0055E756    jmp         0055E767
 0055E758    mov         edx,dword ptr [ebx]
 0055E75A    mov         eax,ebx
 0055E75C    mov         dword ptr [edx+14],1B
 0055E763    mov         edx,dword ptr [eax]
 0055E765    call        dword ptr [edx]
 0055E767    cmp         dword ptr [ebx+54],0
>0055E76B    je          0055E777
 0055E76D    mov         dword ptr [ebx+7C],1
 0055E774    pop         esi
 0055E775    pop         ebx
 0055E776    ret
 0055E777    mov         ecx,dword ptr [ebx+78]
 0055E77A    mov         dword ptr [ebx+7C],ecx
 0055E77D    pop         esi
 0055E77E    pop         ebx
 0055E77F    ret
*}
end;

//0055E780
procedure _DF_.;
begin
{*
 0055E780    push        ebx
 0055E781    push        esi
 0055E782    push        edi
 0055E783    add         esp,0FFFFFFE8
 0055E786    mov         dword ptr [esp+4],edx
 0055E78A    mov         dword ptr [esp],eax
 0055E78D    mov         eax,dword ptr [esp]
 0055E790    mov         edx,dword ptr [eax+78]
 0055E793    mov         dword ptr [esp+8],edx
 0055E797    mov         ecx,dword ptr [esp]
 0055E79A    mov         eax,dword ptr [ecx+60]
 0055E79D    mov         dword ptr [esp+0C],eax
 0055E7A1    mov         ebx,1
 0055E7A6    inc         ebx
 0055E7A7    mov         eax,ebx
 0055E7A9    mov         ecx,1
 0055E7AE    cmp         ecx,dword ptr [esp+8]
>0055E7B2    jge         0055E7BE
 0055E7B4    imul        eax,ebx
 0055E7B7    inc         ecx
 0055E7B8    cmp         ecx,dword ptr [esp+8]
>0055E7BC    jl          0055E7B4
 0055E7BE    cmp         eax,dword ptr [esp+0C]
>0055E7C2    jle         0055E7A6
 0055E7C4    dec         ebx
 0055E7C5    cmp         ebx,2
>0055E7C8    jge         0055E7E0
 0055E7CA    mov         edx,dword ptr [esp]
 0055E7CD    mov         edx,dword ptr [edx]
 0055E7CF    mov         dword ptr [edx+14],38
 0055E7D6    mov         dword ptr [edx+18],eax
 0055E7D9    mov         eax,dword ptr [esp]
 0055E7DC    mov         ecx,dword ptr [eax]
 0055E7DE    call        dword ptr [ecx]
 0055E7E0    mov         esi,1
 0055E7E5    xor         ecx,ecx
 0055E7E7    mov         eax,dword ptr [esp+4]
 0055E7EB    cmp         ecx,dword ptr [esp+8]
>0055E7EF    jge         0055E800
 0055E7F1    mov         dword ptr [eax],ebx
 0055E7F3    imul        esi,ebx
 0055E7F6    inc         ecx
 0055E7F7    add         eax,4
 0055E7FA    cmp         ecx,dword ptr [esp+8]
>0055E7FE    jl          0055E7F1
 0055E800    xor         edx,edx
 0055E802    mov         dword ptr [esp+10],edx
 0055E806    xor         ecx,ecx
 0055E808    mov         dword ptr [esp+14],789210
 0055E810    cmp         ecx,dword ptr [esp+8]
>0055E814    jge         0055E866
 0055E816    mov         eax,dword ptr [esp]
 0055E819    cmp         dword ptr [eax+2C],2
>0055E81D    jne         0055E827
 0055E81F    mov         edx,dword ptr [esp+14]
 0055E823    mov         ebx,dword ptr [edx]
>0055E825    jmp         0055E829
 0055E827    mov         ebx,ecx
 0055E829    mov         eax,dword ptr [esp+4]
 0055E82D    push        dword ptr [eax+ebx*4]
 0055E830    mov         eax,esi
 0055E832    pop         edx
 0055E833    mov         edi,edx
 0055E835    cdq
 0055E836    idiv        eax,edi
 0055E838    mov         edx,dword ptr [esp+4]
 0055E83C    mov         edx,dword ptr [edx+ebx*4]
 0055E83F    inc         edx
 0055E840    imul        eax,edx
 0055E843    cmp         eax,dword ptr [esp+0C]
>0055E847    jg          0055E866
 0055E849    mov         edx,dword ptr [esp+4]
 0055E84D    inc         ecx
 0055E84E    mov         esi,eax
 0055E850    inc         dword ptr [edx+ebx*4]
 0055E853    mov         dword ptr [esp+10],1
 0055E85B    add         dword ptr [esp+14],4
 0055E860    cmp         ecx,dword ptr [esp+8]
>0055E864    jl          0055E816
 0055E866    cmp         dword ptr [esp+10],0
>0055E86B    jne         0055E800
 0055E86D    mov         eax,esi
 0055E86F    add         esp,18
 0055E872    pop         edi
 0055E873    pop         esi
 0055E874    pop         ebx
 0055E875    ret
*}
end;

//0055E878
{*function sub_0055E878(?:?; ?:?; ?:?; ?:?):?;
begin
 0055E878    push        ebp
 0055E879    mov         ebp,esp
 0055E87B    mov         eax,ecx
 0055E87D    push        ebx
 0055E87E    shl         eax,8
 0055E881    mov         ebx,dword ptr [ebp+8]
 0055E884    mov         edx,ebx
 0055E886    sub         eax,ecx
 0055E888    sar         edx,1
>0055E88A    jns         0055E88F
 0055E88C    adc         edx,0
 0055E88F    add         eax,edx
 0055E891    cdq
 0055E892    idiv        eax,ebx
 0055E894    pop         ebx
 0055E895    pop         ebp
 0055E896    ret         4
end;*}

//0055E89C
{*procedure sub_0055E89C(?:?; ?:?; ?:?; ?:?);
begin
 0055E89C    add         ecx,ecx
 0055E89E    push        ebp
 0055E89F    mov         ebp,esp
 0055E8A1    mov         eax,ecx
 0055E8A3    shl         eax,8
 0055E8A6    push        ebx
 0055E8A7    mov         ebx,dword ptr [ebp+8]
 0055E8AA    sub         eax,ecx
 0055E8AC    add         eax,ebx
 0055E8AE    add         ebx,ebx
 0055E8B0    add         eax,0FF
 0055E8B5    cdq
 0055E8B6    idiv        eax,ebx
 0055E8B8    pop         ebx
 0055E8B9    pop         ebp
 0055E8BA    ret         4
end;*}

//0055E8C0
{*procedure sub_0055E8C0(?:?);
begin
 0055E8C0    push        ebx
 0055E8C1    push        esi
 0055E8C2    push        edi
 0055E8C3    push        ebp
 0055E8C4    add         esp,0FFFFFFD0
 0055E8C7    mov         dword ptr [esp],eax
 0055E8CA    mov         eax,dword ptr [esp]
 0055E8CD    mov         edx,dword ptr [eax+1CC]
 0055E8D3    mov         dword ptr [esp+4],edx
 0055E8D7    mov         edx,dword ptr [esp+4]
 0055E8DB    mov         eax,dword ptr [esp]
 0055E8DE    add         edx,20
 0055E8E1    call        _DF_.
 0055E8E6    mov         dword ptr [esp+0C],eax
 0055E8EA    mov         ecx,dword ptr [esp]
 0055E8ED    cmp         dword ptr [ecx+78],3
>0055E8F1    jne         0055E93A
 0055E8F3    mov         eax,dword ptr [esp]
 0055E8F6    mov         eax,dword ptr [eax]
 0055E8F8    add         eax,18
 0055E8FB    mov         edx,dword ptr [esp+0C]
 0055E8FF    mov         dword ptr [eax],edx
 0055E901    mov         ecx,dword ptr [esp+4]
 0055E905    mov         edx,dword ptr [ecx+20]
 0055E908    mov         dword ptr [eax+4],edx
 0055E90B    mov         ecx,dword ptr [esp+4]
 0055E90F    mov         edx,dword ptr [ecx+24]
 0055E912    mov         dword ptr [eax+8],edx
 0055E915    mov         ecx,dword ptr [esp+4]
 0055E919    mov         edx,dword ptr [ecx+28]
 0055E91C    mov         dword ptr [eax+0C],edx
 0055E91F    mov         eax,dword ptr [esp]
 0055E922    mov         ecx,dword ptr [eax]
 0055E924    mov         dword ptr [ecx+14],5E
 0055E92B    mov         edx,1
 0055E930    mov         eax,dword ptr [esp]
 0055E933    mov         ecx,dword ptr [eax]
 0055E935    call        dword ptr [ecx+4]
>0055E938    jmp         0055E95A
 0055E93A    mov         eax,dword ptr [esp]
 0055E93D    mov         eax,dword ptr [eax]
 0055E93F    mov         dword ptr [eax+14],5F
 0055E946    mov         edx,dword ptr [esp+0C]
 0055E94A    mov         dword ptr [eax+18],edx
 0055E94D    mov         edx,1
 0055E952    mov         eax,dword ptr [esp]
 0055E955    mov         ecx,dword ptr [eax]
 0055E957    call        dword ptr [ecx+4]
 0055E95A    mov         eax,dword ptr [esp]
 0055E95D    mov         edx,dword ptr [eax+78]
 0055E960    push        edx
 0055E961    mov         edx,1
 0055E966    mov         eax,dword ptr [esp+4]
 0055E96A    mov         ecx,dword ptr [esp+10]
 0055E96E    mov         ebx,dword ptr [eax+4]
 0055E971    call        dword ptr [ebx+8]
 0055E974    mov         dword ptr [esp+8],eax
 0055E978    xor         edx,edx
 0055E97A    mov         eax,dword ptr [esp+0C]
 0055E97E    mov         dword ptr [esp+1C],eax
 0055E982    mov         dword ptr [esp+10],edx
 0055E986    mov         ecx,dword ptr [esp+8]
 0055E98A    mov         eax,ecx
 0055E98C    mov         dword ptr [esp+2C],eax
 0055E990    mov         edx,dword ptr [esp+4]
 0055E994    lea         ecx,[edx+20]
 0055E997    mov         dword ptr [esp+20],ecx
>0055E99B    jmp         0055EA45
 0055E9A0    mov         eax,dword ptr [esp+20]
 0055E9A4    mov         edx,dword ptr [eax]
 0055E9A6    mov         dword ptr [esp+18],edx
 0055E9AA    mov         eax,dword ptr [esp+1C]
 0055E9AE    cdq
 0055E9AF    idiv        eax,dword ptr [esp+18]
 0055E9B3    mov         esi,eax
 0055E9B5    xor         eax,eax
 0055E9B7    mov         dword ptr [esp+14],eax
 0055E9BB    mov         edx,dword ptr [esp+2C]
 0055E9BF    mov         ecx,edx
 0055E9C1    mov         dword ptr [esp+28],ecx
 0055E9C5    mov         eax,dword ptr [esp+14]
 0055E9C9    cmp         eax,dword ptr [esp+18]
>0055E9CD    jge         0055EA33
 0055E9CF    mov         edx,dword ptr [esp+18]
 0055E9D3    dec         edx
 0055E9D4    push        edx
 0055E9D5    mov         ecx,dword ptr [esp+18]
 0055E9D9    mov         edx,dword ptr [esp+14]
 0055E9DD    mov         eax,dword ptr [esp+4]
 0055E9E1    call        0055E878
 0055E9E6    mov         edi,eax
 0055E9E8    mov         ecx,dword ptr [esp+14]
 0055E9EC    imul        ecx,esi
 0055E9EF    mov         eax,dword ptr [esp+28]
 0055E9F3    mov         edx,eax
 0055E9F5    mov         dword ptr [esp+24],edx
 0055E9F9    cmp         ecx,dword ptr [esp+0C]
>0055E9FD    jge         0055EA25
 0055E9FF    xor         eax,eax
 0055EA01    mov         edx,dword ptr [esp+24]
 0055EA05    cmp         esi,eax
>0055EA07    jle         0055EA1B
 0055EA09    mov         ebx,dword ptr [edx]
 0055EA0B    add         ebx,ecx
 0055EA0D    add         ebx,eax
 0055EA0F    inc         eax
 0055EA10    push        ebx
 0055EA11    mov         ebx,edi
 0055EA13    pop         ebp
 0055EA14    cmp         esi,eax
 0055EA16    mov         byte ptr [ebp],bl
>0055EA19    jg          0055EA09
 0055EA1B    add         ecx,dword ptr [esp+1C]
 0055EA1F    cmp         ecx,dword ptr [esp+0C]
>0055EA23    jl          0055E9FF
 0055EA25    inc         dword ptr [esp+14]
 0055EA29    mov         eax,dword ptr [esp+14]
 0055EA2D    cmp         eax,dword ptr [esp+18]
>0055EA31    jl          0055E9CF
 0055EA33    mov         dword ptr [esp+1C],esi
 0055EA37    inc         dword ptr [esp+10]
 0055EA3B    add         dword ptr [esp+2C],4
 0055EA40    add         dword ptr [esp+20],4
 0055EA45    mov         edx,dword ptr [esp]
 0055EA48    mov         ecx,dword ptr [edx+78]
 0055EA4B    cmp         ecx,dword ptr [esp+10]
>0055EA4F    jg          0055E9A0
 0055EA55    mov         eax,dword ptr [esp+4]
 0055EA59    mov         edx,dword ptr [esp+8]
 0055EA5D    mov         dword ptr [eax+10],edx
 0055EA60    mov         ecx,dword ptr [esp+4]
 0055EA64    mov         eax,dword ptr [esp+0C]
 0055EA68    mov         dword ptr [ecx+14],eax
 0055EA6B    add         esp,30
 0055EA6E    pop         ebp
 0055EA6F    pop         edi
 0055EA70    pop         esi
 0055EA71    pop         ebx
 0055EA72    ret
end;*}

//0055EA74
{*procedure sub_0055EA74(?:?);
begin
 0055EA74    push        ebx
 0055EA75    push        esi
 0055EA76    push        edi
 0055EA77    add         esp,0FFFFFFE0
 0055EA7A    mov         dword ptr [esp],eax
 0055EA7D    mov         eax,dword ptr [esp]
 0055EA80    mov         edx,dword ptr [eax+1CC]
 0055EA86    mov         dword ptr [esp+4],edx
 0055EA8A    mov         ecx,dword ptr [esp]
 0055EA8D    cmp         dword ptr [ecx+58],1
>0055EA91    jne         0055EAA8
 0055EA93    mov         dword ptr [esp+14],1FE
 0055EA9B    mov         eax,dword ptr [esp+4]
 0055EA9F    mov         dword ptr [eax+1C],1
>0055EAA6    jmp         0055EAB7
 0055EAA8    xor         edx,edx
 0055EAAA    mov         dword ptr [esp+14],edx
 0055EAAE    mov         ecx,dword ptr [esp+4]
 0055EAB2    xor         eax,eax
 0055EAB4    mov         dword ptr [ecx+1C],eax
 0055EAB7    mov         edx,dword ptr [esp]
 0055EABA    mov         ecx,dword ptr [edx+78]
 0055EABD    mov         edx,1
 0055EAC2    push        ecx
 0055EAC3    mov         eax,dword ptr [esp+4]
 0055EAC7    mov         ecx,dword ptr [esp+18]
 0055EACB    add         ecx,100
 0055EAD1    mov         ebx,dword ptr [eax+4]
 0055EAD4    call        dword ptr [ebx+8]
 0055EAD7    mov         edx,dword ptr [esp+4]
 0055EADB    mov         dword ptr [edx+18],eax
 0055EADE    mov         eax,dword ptr [esp+4]
 0055EAE2    mov         ecx,dword ptr [eax+14]
 0055EAE5    mov         dword ptr [esp+10],ecx
 0055EAE9    xor         edi,edi
 0055EAEB    mov         eax,dword ptr [esp+4]
 0055EAEF    lea         edx,[eax+20]
 0055EAF2    mov         dword ptr [esp+18],edx
>0055EAF6    jmp         0055EBCF
 0055EAFB    mov         ecx,dword ptr [esp+18]
 0055EAFF    mov         eax,dword ptr [ecx]
 0055EB01    mov         dword ptr [esp+0C],eax
 0055EB05    mov         eax,dword ptr [esp+10]
 0055EB09    cdq
 0055EB0A    idiv        eax,dword ptr [esp+0C]
 0055EB0E    mov         dword ptr [esp+10],eax
 0055EB12    cmp         dword ptr [esp+14],0
>0055EB17    je          0055EB27
 0055EB19    mov         ecx,dword ptr [esp+4]
 0055EB1D    mov         eax,dword ptr [ecx+18]
 0055EB20    add         dword ptr [eax+edi*4],0FF
 0055EB27    mov         edx,dword ptr [esp+4]
 0055EB2B    xor         esi,esi
 0055EB2D    mov         ecx,dword ptr [edx+18]
 0055EB30    mov         edx,edi
 0055EB32    mov         eax,dword ptr [ecx+edi*4]
 0055EB35    mov         dword ptr [esp+8],eax
 0055EB39    mov         eax,dword ptr [esp+0C]
 0055EB3D    dec         eax
 0055EB3E    xor         ecx,ecx
 0055EB40    push        eax
 0055EB41    mov         eax,dword ptr [esp+4]
 0055EB45    call        0055E89C
 0055EB4A    xor         ebx,ebx
 0055EB4C    mov         edx,dword ptr [esp+8]
 0055EB50    mov         ecx,edx
 0055EB52    mov         dword ptr [esp+1C],ecx
 0055EB56    cmp         eax,ebx
>0055EB58    jge         0055EB72
 0055EB5A    mov         eax,dword ptr [esp+0C]
 0055EB5E    mov         edx,edi
 0055EB60    dec         eax
 0055EB61    inc         esi
 0055EB62    push        eax
 0055EB63    mov         ecx,esi
 0055EB65    mov         eax,dword ptr [esp+4]
 0055EB69    call        0055E89C
 0055EB6E    cmp         eax,ebx
>0055EB70    jl          0055EB5A
 0055EB72    mov         edx,esi
 0055EB74    mov         ecx,dword ptr [esp+1C]
 0055EB78    imul        edx,dword ptr [esp+10]
 0055EB7D    mov         byte ptr [ecx],dl
 0055EB7F    inc         ebx
 0055EB80    inc         dword ptr [esp+1C]
 0055EB84    cmp         ebx,0FF
>0055EB8A    jle         0055EB56
 0055EB8C    cmp         dword ptr [esp+14],0
>0055EB91    je          0055EBC9
 0055EB93    mov         ebx,1
 0055EB98    mov         eax,dword ptr [esp+8]
 0055EB9C    add         eax,100
 0055EBA1    mov         edx,ebx
 0055EBA3    mov         ecx,dword ptr [esp+8]
 0055EBA7    neg         edx
 0055EBA9    add         ecx,edx
 0055EBAB    mov         edx,dword ptr [esp+8]
 0055EBAF    inc         ebx
 0055EBB0    mov         dl,byte ptr [edx]
 0055EBB2    mov         byte ptr [ecx],dl
 0055EBB4    mov         ecx,dword ptr [esp+8]
 0055EBB8    mov         dl,byte ptr [ecx+0FF]
 0055EBBE    mov         byte ptr [eax],dl
 0055EBC0    inc         eax
 0055EBC1    cmp         ebx,0FF
>0055EBC7    jle         0055EBA1
 0055EBC9    inc         edi
 0055EBCA    add         dword ptr [esp+18],4
 0055EBCF    mov         eax,dword ptr [esp]
 0055EBD2    cmp         edi,dword ptr [eax+78]
>0055EBD5    jl          0055EAFB
 0055EBDB    add         esp,20
 0055EBDE    pop         edi
 0055EBDF    pop         esi
 0055EBE0    pop         ebx
 0055EBE1    ret
end;*}

//0055F208
{*procedure sub_0055F208(?:?);
begin
 0055F208    push        ebx
 0055F209    push        esi
 0055F20A    mov         ebx,eax
 0055F20C    push        edi
 0055F20D    push        ebp
 0055F20E    push        ecx
 0055F20F    mov         eax,dword ptr [ebx+1CC]
 0055F215    mov         edx,dword ptr [ebx+70]
 0055F218    add         edx,edx
 0055F21A    add         edx,4
 0055F21D    xor         edi,edi
 0055F21F    mov         dword ptr [esp],edx
 0055F222    lea         esi,[eax+44]
>0055F225    jmp         0055F23D
 0055F227    mov         eax,ebx
 0055F229    mov         ecx,dword ptr [esp]
 0055F22C    mov         edx,1
 0055F231    mov         ebp,dword ptr [eax+4]
 0055F234    call        dword ptr [ebp+4]
 0055F237    mov         dword ptr [esi],eax
 0055F239    inc         edi
 0055F23A    add         esi,4
 0055F23D    cmp         edi,dword ptr [ebx+78]
>0055F240    jl          0055F227
 0055F242    pop         edx
 0055F243    pop         ebp
 0055F244    pop         edi
 0055F245    pop         esi
 0055F246    pop         ebx
 0055F247    ret
end;*}

//0055F334
procedure @jinit_1pass_quantizer;
begin
{*
 0055F334    push        ebx
 0055F335    mov         ebx,eax
 0055F337    mov         eax,ebx
 0055F339    push        esi
 0055F33A    mov         ecx,58
 0055F33F    mov         edx,1
 0055F344    mov         esi,dword ptr [eax+4]
 0055F347    call        dword ptr [esi]
 0055F349    mov         dword ptr [ebx+1CC],eax
 0055F34F    mov         dword ptr [eax],55F248
 0055F355    mov         dword ptr [eax+8],55F320
 0055F35C    mov         dword ptr [eax+0C],55F324
 0055F363    xor         edx,edx
 0055F365    xor         ecx,ecx
 0055F367    mov         dword ptr [eax+44],edx
 0055F36A    mov         dword ptr [eax+34],ecx
 0055F36D    cmp         dword ptr [ebx+78],4
>0055F371    jle         0055F389
 0055F373    mov         eax,dword ptr [ebx]
 0055F375    mov         dword ptr [eax+14],37
 0055F37C    mov         dword ptr [eax+18],4
 0055F383    mov         eax,ebx
 0055F385    mov         edx,dword ptr [eax]
 0055F387    call        dword ptr [edx]
 0055F389    cmp         dword ptr [ebx+60],100
>0055F390    jle         0055F3A8
 0055F392    mov         eax,dword ptr [ebx]
 0055F394    mov         dword ptr [eax+14],39
 0055F39B    mov         dword ptr [eax+18],100
 0055F3A2    mov         eax,ebx
 0055F3A4    mov         edx,dword ptr [eax]
 0055F3A6    call        dword ptr [edx]
 0055F3A8    mov         eax,ebx
 0055F3AA    call        0055E8C0
 0055F3AF    mov         eax,ebx
 0055F3B1    call        0055EA74
 0055F3B6    cmp         dword ptr [ebx+58],2
>0055F3BA    jne         0055F3C3
 0055F3BC    mov         eax,ebx
 0055F3BE    call        0055F208
 0055F3C3    pop         esi
 0055F3C4    pop         ebx
 0055F3C5    ret
*}
end;

//0055F3C8
procedure _DF_.;
begin
{*
 0055F3C8    push        ebp
 0055F3C9    mov         ebp,esp
 0055F3CB    add         esp,0FFFFFFF4
 0055F3CE    push        ebx
 0055F3CF    push        esi
 0055F3D0    mov         ecx,dword ptr [eax+1CC]
 0055F3D6    mov         ebx,dword ptr [ecx+18]
 0055F3D9    mov         eax,dword ptr [eax+70]
 0055F3DC    mov         dword ptr [ebp-8],eax
 0055F3DF    xor         ecx,ecx
 0055F3E1    mov         dword ptr [ebp-4],ecx
 0055F3E4    mov         dword ptr [ebp-0C],edx
 0055F3E7    mov         eax,dword ptr [ebp-4]
 0055F3EA    cmp         eax,dword ptr [ebp+8]
>0055F3ED    jge         0055F441
 0055F3EF    mov         edx,dword ptr [ebp-0C]
 0055F3F2    mov         eax,dword ptr [edx]
 0055F3F4    mov         ecx,dword ptr [ebp-8]
 0055F3F7    test        ecx,ecx
>0055F3F9    jbe         0055F432
 0055F3FB    movzx       esi,byte ptr [eax+1]
 0055F3FF    xor         edx,edx
 0055F401    mov         dl,byte ptr [eax]
 0055F403    sar         edx,3
 0055F406    sar         esi,2
 0055F409    shl         esi,6
 0055F40C    mov         edx,dword ptr [ebx+edx*4]
 0055F40F    add         edx,esi
 0055F411    movzx       esi,byte ptr [eax+2]
 0055F415    sar         esi,3
 0055F418    add         esi,esi
 0055F41A    add         edx,esi
 0055F41C    inc         word ptr [edx]
 0055F41F    mov         si,word ptr [edx]
 0055F422    test        si,si
>0055F425    ja          0055F42A
 0055F427    dec         word ptr [edx]
 0055F42A    add         eax,3
 0055F42D    dec         ecx
 0055F42E    test        ecx,ecx
>0055F430    ja          0055F3FB
 0055F432    inc         dword ptr [ebp-4]
 0055F435    add         dword ptr [ebp-0C],4
 0055F439    mov         eax,dword ptr [ebp-4]
 0055F43C    cmp         eax,dword ptr [ebp+8]
>0055F43F    jl          0055F3EF
 0055F441    pop         esi
 0055F442    pop         ebx
 0055F443    mov         esp,ebp
 0055F445    pop         ebp
 0055F446    ret         4
*}
end;

//005603D0
{*procedure sub_005603D0(?:?);
begin
 005603D0    push        ebx
 005603D1    push        esi
 005603D2    push        edi
 005603D3    mov         ecx,7FC
 005603D8    mov         esi,dword ptr [eax+4]
 005603DB    mov         ebx,dword ptr [eax+1CC]
 005603E1    mov         edx,1
 005603E6    call        dword ptr [esi]
 005603E8    mov         ecx,eax
 005603EA    xor         edx,edx
 005603EC    add         ecx,3FC
 005603F2    xor         eax,eax
 005603F4    mov         dword ptr [ebx+28],ecx
 005603F7    mov         ebx,ecx
 005603F9    mov         dword ptr [ebx],edx
 005603FB    mov         esi,eax
 005603FD    neg         esi
 005603FF    mov         edi,edx
 00560401    neg         edi
 00560403    mov         dword ptr [ecx+esi*4],edi
 00560406    add         ebx,4
 00560409    inc         eax
 0056040A    inc         edx
 0056040B    cmp         eax,10
>0056040E    jl          005603F9
 00560410    lea         ebx,[ecx+eax*4]
 00560413    cmp         eax,30
>00560416    jge         0056043D
 00560418    mov         esi,eax
 0056041A    mov         edi,edx
 0056041C    neg         esi
 0056041E    neg         edi
 00560420    mov         dword ptr [ebx],edx
 00560422    add         ebx,4
 00560425    inc         eax
 00560426    mov         dword ptr [ecx+esi*4],edi
 00560429    test        al,1
>0056042B    je          00560431
 0056042D    xor         esi,esi
>0056042F    jmp         00560436
 00560431    mov         esi,1
 00560436    add         edx,esi
 00560438    cmp         eax,30
>0056043B    jl          00560418
 0056043D    lea         ebx,[ecx+eax*4]
 00560440    cmp         eax,0FF
>00560445    jg          0056045F
 00560447    mov         esi,eax
 00560449    mov         edi,edx
 0056044B    neg         esi
 0056044D    neg         edi
 0056044F    mov         dword ptr [ebx],edx
 00560451    add         ebx,4
 00560454    inc         eax
 00560455    mov         dword ptr [ecx+esi*4],edi
 00560458    cmp         eax,0FF
>0056045D    jle         00560447
 0056045F    pop         edi
 00560460    pop         esi
 00560461    pop         ebx
 00560462    ret
end;*}

//005605A8
procedure @jinit_2pass_quantizer;
begin
{*
 005605A8    push        ebx
 005605A9    mov         ebx,eax
 005605AB    mov         eax,ebx
 005605AD    push        esi
 005605AE    push        edi
 005605AF    push        ebp
 005605B0    mov         esi,dword ptr [eax+4]
 005605B3    mov         ecx,2C
 005605B8    mov         edx,1
 005605BD    call        dword ptr [esi]
 005605BF    mov         esi,eax
 005605C1    xor         eax,eax
 005605C3    mov         dword ptr [ebx+1CC],esi
 005605C9    xor         edx,edx
 005605CB    mov         dword ptr [esi],56048C
 005605D1    mov         dword ptr [esi+0C],560598
 005605D8    mov         dword ptr [esi+20],eax
 005605DB    mov         dword ptr [esi+28],edx
 005605DE    cmp         dword ptr [ebx+78],3
>005605E2    je          005605F3
 005605E4    mov         ecx,dword ptr [ebx]
 005605E6    mov         eax,ebx
 005605E8    mov         dword ptr [ecx+14],2F
 005605EF    mov         edx,dword ptr [eax]
 005605F1    call        dword ptr [edx]
 005605F3    mov         eax,ebx
 005605F5    mov         ecx,80
 005605FA    mov         edx,1
 005605FF    mov         edi,dword ptr [eax+4]
 00560602    call        dword ptr [edi]
 00560604    mov         dword ptr [esi+18],eax
 00560607    xor         edi,edi
 00560609    mov         eax,ebx
 0056060B    mov         ecx,1000
 00560610    mov         edx,1
 00560615    mov         ebp,dword ptr [eax+4]
 00560618    call        dword ptr [ebp+4]
 0056061B    mov         edx,dword ptr [esi+18]
 0056061E    mov         dword ptr [edx+edi*4],eax
 00560621    inc         edi
 00560622    cmp         edi,20
>00560625    jl          00560609
 00560627    mov         dword ptr [esi+1C],1
 0056062E    cmp         dword ptr [ebx+6C],0
>00560632    je          00560689
 00560634    mov         edi,dword ptr [ebx+60]
 00560637    cmp         edi,8
>0056063A    jge         00560652
 0056063C    mov         eax,dword ptr [ebx]
 0056063E    mov         dword ptr [eax+14],38
 00560645    mov         dword ptr [eax+18],8
 0056064C    mov         eax,ebx
 0056064E    mov         edx,dword ptr [eax]
 00560650    call        dword ptr [edx]
 00560652    cmp         edi,100
>00560658    jle         00560670
 0056065A    mov         eax,dword ptr [ebx]
 0056065C    mov         dword ptr [eax+14],39
 00560663    mov         dword ptr [eax+18],100
 0056066A    mov         eax,ebx
 0056066C    mov         edx,dword ptr [eax]
 0056066E    call        dword ptr [edx]
 00560670    mov         eax,ebx
 00560672    push        3
 00560674    mov         ecx,edi
 00560676    mov         edx,1
 0056067B    mov         ebp,dword ptr [eax+4]
 0056067E    call        dword ptr [ebp+8]
 00560681    mov         dword ptr [esi+10],eax
 00560684    mov         dword ptr [esi+14],edi
>00560687    jmp         0056068E
 00560689    xor         eax,eax
 0056068B    mov         dword ptr [esi+10],eax
 0056068E    cmp         dword ptr [ebx+58],0
>00560692    je          0056069B
 00560694    mov         dword ptr [ebx+58],2
 0056069B    cmp         dword ptr [ebx+58],2
>0056069F    jne         005606C3
 005606A1    mov         ecx,dword ptr [ebx+70]
 005606A4    mov         eax,ebx
 005606A6    add         ecx,ecx
 005606A8    mov         edx,1
 005606AD    mov         edi,dword ptr [eax+4]
 005606B0    lea         ecx,[ecx+ecx*2]
 005606B3    add         ecx,0C
 005606B6    call        dword ptr [edi+4]
 005606B9    mov         dword ptr [esi+20],eax
 005606BC    mov         eax,ebx
 005606BE    call        005603D0
 005606C3    pop         ebp
 005606C4    pop         edi
 005606C5    pop         esi
 005606C6    pop         ebx
 005606C7    ret
*}
end;

//005606C8
procedure _DF_.;
begin
{*
 005606C8    push        ebx
 005606C9    push        esi
 005606CA    mov         ebx,eax
 005606CC    push        edi
 005606CD    add         esp,0FFFFFFF0
 005606D0    mov         eax,dword ptr [ebx+1A8]
 005606D6    mov         dword ptr [esp],eax
 005606D9    mov         eax,ebx
 005606DB    mov         edx,dword ptr [ebx+13C]
 005606E1    mov         dword ptr [esp+8],edx
 005606E5    mov         edx,1
 005606EA    mov         ecx,dword ptr [ebx+24]
 005606ED    mov         esi,dword ptr [eax+4]
 005606F0    add         ecx,ecx
 005606F2    shl         ecx,2
 005606F5    call        dword ptr [esi]
 005606F7    mov         esi,eax
 005606F9    mov         eax,dword ptr [esp]
 005606FC    mov         dword ptr [eax+38],esi
 005606FF    mov         edx,dword ptr [ebx+24]
 00560702    mov         ecx,dword ptr [esp]
 00560705    shl         edx,2
 00560708    add         esi,edx
 0056070A    mov         dword ptr [ecx+3C],esi
 0056070D    xor         esi,esi
 0056070F    mov         eax,dword ptr [ebx+0D8]
 00560715    mov         dword ptr [esp+0C],eax
>00560719    jmp         00560783
 0056071B    mov         edx,dword ptr [esp+0C]
 0056071F    mov         eax,dword ptr [edx+0C]
 00560722    mov         edx,dword ptr [esp+0C]
 00560726    imul        dword ptr [edx+24]
 00560729    cdq
 0056072A    idiv        eax,dword ptr [ebx+13C]
 00560730    mov         dword ptr [esp+4],eax
 00560734    mov         eax,ebx
 00560736    mov         ecx,dword ptr [esp+8]
 0056073A    mov         edx,1
 0056073F    add         ecx,4
 00560742    mov         edi,dword ptr [eax+4]
 00560745    imul        ecx,dword ptr [esp+4]
 0056074A    add         ecx,ecx
 0056074C    shl         ecx,2
 0056074F    call        dword ptr [edi]
 00560751    mov         edx,dword ptr [esp+4]
 00560755    mov         ecx,dword ptr [esp]
 00560758    shl         edx,2
 0056075B    add         eax,edx
 0056075D    mov         edx,dword ptr [ecx+38]
 00560760    mov         dword ptr [edx+esi*4],eax
 00560763    mov         ecx,dword ptr [esp+8]
 00560767    mov         edx,dword ptr [esp]
 0056076A    add         ecx,4
 0056076D    imul        ecx,dword ptr [esp+4]
 00560772    shl         ecx,2
 00560775    add         eax,ecx
 00560777    mov         ecx,dword ptr [edx+3C]
 0056077A    mov         dword ptr [ecx+esi*4],eax
 0056077D    inc         esi
 0056077E    add         dword ptr [esp+0C],54
 00560783    cmp         esi,dword ptr [ebx+24]
>00560786    jl          0056071B
 00560788    add         esp,10
 0056078B    pop         edi
 0056078C    pop         esi
 0056078D    pop         ebx
 0056078E    ret
*}
end;

//00560CC0
procedure @jinit_d_main_controller;
begin
{*
 00560CC0    push        ebx
 00560CC1    push        esi
 00560CC2    mov         esi,eax
 00560CC4    push        edi
 00560CC5    mov         eax,esi
 00560CC7    push        ebp
 00560CC8    mov         ebx,edx
 00560CCA    mov         edx,1
 00560CCF    mov         edi,dword ptr [eax+4]
 00560CD2    add         esp,0FFFFFFF4
 00560CD5    mov         ecx,50
 00560CDA    call        dword ptr [edi]
 00560CDC    mov         edi,eax
 00560CDE    mov         dword ptr [esi+1A8],edi
 00560CE4    mov         dword ptr [edi],560A98
 00560CEA    test        ebx,ebx
>00560CEC    je          00560CFD
 00560CEE    mov         eax,dword ptr [esi]
 00560CF0    mov         dword ptr [eax+14],4
 00560CF7    mov         eax,esi
 00560CF9    mov         edx,dword ptr [eax]
 00560CFB    call        dword ptr [edx]
 00560CFD    mov         ecx,dword ptr [esi+1C4]
 00560D03    cmp         dword ptr [ecx+8],0
>00560D07    je          00560D37
 00560D09    cmp         dword ptr [esi+13C],2
>00560D10    jge         00560D21
 00560D12    mov         eax,dword ptr [esi]
 00560D14    mov         dword ptr [eax+14],2F
 00560D1B    mov         eax,esi
 00560D1D    mov         edx,dword ptr [eax]
 00560D1F    call        dword ptr [edx]
 00560D21    mov         eax,esi
 00560D23    call        _DF_.
 00560D28    mov         edx,dword ptr [esi+13C]
 00560D2E    add         edx,2
 00560D31    mov         dword ptr [esp+8],edx
>00560D35    jmp         00560D41
 00560D37    mov         ecx,dword ptr [esi+13C]
 00560D3D    mov         dword ptr [esp+8],ecx
 00560D41    xor         eax,eax
 00560D43    mov         dword ptr [esp],eax
 00560D46    mov         ebx,dword ptr [esi+0D8]
 00560D4C    lea         eax,[edi+8]
 00560D4F    mov         edi,eax
>00560D51    jmp         00560D8D
 00560D53    mov         eax,dword ptr [ebx+0C]
 00560D56    imul        dword ptr [ebx+24]
 00560D59    cdq
 00560D5A    idiv        eax,dword ptr [esi+13C]
 00560D60    mov         dword ptr [esp+4],eax
 00560D64    mov         eax,esi
 00560D66    mov         ecx,dword ptr [esp+4]
 00560D6A    mov         edx,1
 00560D6F    imul        ecx,dword ptr [esp+8]
 00560D74    push        ecx
 00560D75    mov         ecx,dword ptr [ebx+1C]
 00560D78    mov         ebp,dword ptr [eax+4]
 00560D7B    imul        ecx,dword ptr [ebx+24]
 00560D7F    call        dword ptr [ebp+8]
 00560D82    mov         dword ptr [edi],eax
 00560D84    add         edi,4
 00560D87    inc         dword ptr [esp]
 00560D8A    add         ebx,54
 00560D8D    mov         eax,dword ptr [esp]
 00560D90    cmp         eax,dword ptr [esi+24]
>00560D93    jl          00560D53
 00560D95    add         esp,0C
 00560D98    pop         ebp
 00560D99    pop         edi
 00560D9A    pop         esi
 00560D9B    pop         ebx
 00560D9C    ret
*}
end;

//00560DA0
procedure _DF_.;
begin
{*
 00560DA0    cmp         dword ptr [eax+148],1
 00560DA7    mov         edx,dword ptr [eax+1AC]
>00560DAD    jle         00560DB8
 00560DAF    mov         dword ptr [edx+1C],1
>00560DB6    jmp         00560DE1
 00560DB8    mov         ecx,dword ptr [eax+140]
 00560DBE    dec         ecx
 00560DBF    cmp         ecx,dword ptr [eax+94]
>00560DC5    jbe         00560DD5
 00560DC7    mov         eax,dword ptr [eax+14C]
 00560DCD    mov         eax,dword ptr [eax+0C]
 00560DD0    mov         dword ptr [edx+1C],eax
>00560DD3    jmp         00560DE1
 00560DD5    mov         ecx,dword ptr [eax+14C]
 00560DDB    mov         eax,dword ptr [ecx+48]
 00560DDE    mov         dword ptr [edx+1C],eax
 00560DE1    xor         ecx,ecx
 00560DE3    xor         eax,eax
 00560DE5    mov         dword ptr [edx+14],ecx
 00560DE8    mov         dword ptr [edx+18],eax
 00560DEB    ret
*}
end;

//00561D1C
procedure @jinit_d_coef_controller;
begin
{*
 00561D1C    push        ebx
 00561D1D    push        esi
 00561D1E    push        edi
 00561D1F    mov         edi,eax
 00561D21    mov         eax,edi
 00561D23    push        ebp
 00561D24    mov         ebx,edx
 00561D26    mov         edx,1
 00561D2B    mov         esi,dword ptr [eax+4]
 00561D2E    add         esp,0FFFFFFF4
 00561D31    mov         ecx,74
 00561D36    call        dword ptr [esi]
 00561D38    mov         esi,eax
 00561D3A    xor         eax,eax
 00561D3C    mov         dword ptr [edi+1AC],esi
 00561D42    test        ebx,ebx
 00561D44    mov         dword ptr [esi],560DEC
 00561D4A    mov         dword ptr [esi+8],560DFC
 00561D51    mov         dword ptr [esi+70],eax
>00561D54    je          00561DE7
 00561D5A    xor         edx,edx
 00561D5C    mov         dword ptr [esp],edx
 00561D5F    mov         ebx,dword ptr [edi+0D8]
 00561D65    lea         eax,[esi+48]
 00561D68    mov         dword ptr [esp+8],eax
>00561D6C    jmp         00561DC9
 00561D6E    mov         edx,dword ptr [ebx+0C]
 00561D71    mov         dword ptr [esp+4],edx
 00561D75    cmp         dword ptr [edi+0DC],0
>00561D7C    je          00561D89
 00561D7E    mov         ecx,dword ptr [esp+4]
 00561D82    lea         ecx,[ecx+ecx*2]
 00561D85    mov         dword ptr [esp+4],ecx
 00561D89    mov         edx,dword ptr [ebx+8]
 00561D8C    mov         eax,dword ptr [ebx+1C]
 00561D8F    call        @jround_up
 00561D94    push        eax
 00561D95    mov         edx,dword ptr [ebx+0C]
 00561D98    mov         eax,dword ptr [ebx+20]
 00561D9B    call        @jround_up
 00561DA0    push        eax
 00561DA1    mov         eax,edi
 00561DA3    mov         ecx,dword ptr [esp+0C]
 00561DA7    mov         edx,1
 00561DAC    push        ecx
 00561DAD    mov         ecx,1
 00561DB2    mov         ebp,dword ptr [eax+4]
 00561DB5    call        dword ptr [ebp+14]
 00561DB8    mov         edx,dword ptr [esp+8]
 00561DBC    mov         dword ptr [edx],eax
 00561DBE    add         dword ptr [esp+8],4
 00561DC3    inc         dword ptr [esp]
 00561DC6    add         ebx,54
 00561DC9    mov         eax,dword ptr [edi+24]
 00561DCC    cmp         eax,dword ptr [esp]
>00561DCF    jg          00561D6E
 00561DD1    mov         dword ptr [esi+4],56107C
 00561DD8    mov         dword ptr [esi+0C],56126C
 00561DDF    lea         ecx,[esi+48]
 00561DE2    mov         dword ptr [esi+10],ecx
>00561DE5    jmp         00561E25
 00561DE7    mov         eax,edi
 00561DE9    mov         ecx,500
 00561DEE    mov         edx,1
 00561DF3    mov         ebx,dword ptr [eax+4]
 00561DF6    call        dword ptr [ebx+4]
 00561DF9    mov         ecx,eax
 00561DFB    xor         eax,eax
 00561DFD    lea         edx,[esi+20]
 00561E00    mov         ebx,eax
 00561E02    inc         eax
 00561E03    shl         ebx,7
 00561E06    add         ebx,ecx
 00561E08    mov         dword ptr [edx],ebx
 00561E0A    add         edx,4
 00561E0D    cmp         eax,0A
>00561E10    jl          00561E00
 00561E12    mov         dword ptr [esi+4],561078
 00561E19    mov         dword ptr [esi+0C],560E38
 00561E20    xor         eax,eax
 00561E22    mov         dword ptr [esi+10],eax
 00561E25    add         esp,0C
 00561E28    pop         ebp
 00561E29    pop         edi
 00561E2A    pop         esi
 00561E2B    pop         ebx
 00561E2C    ret
*}
end;

//00561E30
procedure _DF_.;
begin
{*
 00561E30    push        ebx
 00561E31    push        esi
 00561E32    mov         esi,eax
 00561E34    sub         edx,1
 00561E37    mov         ebx,dword ptr [esi+1B0]
>00561E3D    jb          00561E47
 00561E3F    dec         edx
>00561E40    je          00561E9E
 00561E42    dec         edx
>00561E43    je          00561E80
>00561E45    jmp         00561EBC
 00561E47    cmp         dword ptr [esi+54],0
>00561E4B    je          00561E72
 00561E4D    mov         dword ptr [ebx+4],561ED8
 00561E54    cmp         dword ptr [ebx+0C],0
>00561E58    jne         00561ECB
 00561E5A    mov         eax,dword ptr [ebx+10]
 00561E5D    xor         ecx,ecx
 00561E5F    push        eax
 00561E60    mov         eax,esi
 00561E62    push        1
 00561E64    mov         esi,dword ptr [eax+4]
 00561E67    mov         edx,dword ptr [ebx+8]
 00561E6A    call        dword ptr [esi+1C]
 00561E6D    mov         dword ptr [ebx+0C],eax
>00561E70    jmp         00561ECB
 00561E72    mov         eax,dword ptr [esi+1C4]
 00561E78    mov         edx,dword ptr [eax+4]
 00561E7B    mov         dword ptr [ebx+4],edx
>00561E7E    jmp         00561ECB
 00561E80    cmp         dword ptr [ebx+8],0
>00561E84    jne         00561E95
 00561E86    mov         ecx,dword ptr [esi]
 00561E88    mov         eax,esi
 00561E8A    mov         dword ptr [ecx+14],4
 00561E91    mov         edx,dword ptr [eax]
 00561E93    call        dword ptr [edx]
 00561E95    mov         dword ptr [ebx+4],561F54
>00561E9C    jmp         00561ECB
 00561E9E    cmp         dword ptr [ebx+8],0
>00561EA2    jne         00561EB3
 00561EA4    mov         ecx,dword ptr [esi]
 00561EA6    mov         eax,esi
 00561EA8    mov         dword ptr [ecx+14],4
 00561EAF    mov         edx,dword ptr [eax]
 00561EB1    call        dword ptr [edx]
 00561EB3    mov         dword ptr [ebx+4],561FF8
>00561EBA    jmp         00561ECB
 00561EBC    mov         ecx,dword ptr [esi]
 00561EBE    mov         eax,esi
 00561EC0    mov         dword ptr [ecx+14],4
 00561EC7    mov         edx,dword ptr [eax]
 00561EC9    call        dword ptr [edx]
 00561ECB    xor         ecx,ecx
 00561ECD    mov         dword ptr [ebx+18],ecx
 00561ED0    mov         dword ptr [ebx+14],ecx
 00561ED3    pop         esi
 00561ED4    pop         ebx
 00561ED5    ret
*}
end;

//00562090
procedure @jinit_d_post_controller;
begin
{*
 00562090    push        ebx
 00562091    push        esi
 00562092    mov         esi,eax
 00562094    push        edi
 00562095    mov         eax,esi
 00562097    push        ecx
 00562098    mov         dword ptr [esp],edx
 0056209B    mov         edx,1
 005620A0    mov         ebx,dword ptr [eax+4]
 005620A3    mov         ecx,1C
 005620A8    call        dword ptr [ebx]
 005620AA    mov         ebx,eax
 005620AC    xor         eax,eax
 005620AE    mov         dword ptr [esi+1B0],ebx
 005620B4    xor         edx,edx
 005620B6    mov         dword ptr [ebx],561E30;_DF_.
 005620BC    mov         dword ptr [ebx+8],eax
 005620BF    mov         dword ptr [ebx+0C],edx
 005620C2    cmp         dword ptr [esi+54],0
>005620C6    je          0056211C
 005620C8    mov         edi,dword ptr [esi+138]
 005620CE    mov         dword ptr [ebx+10],edi
 005620D1    cmp         dword ptr [esp],0
>005620D5    je          00562101
 005620D7    mov         eax,dword ptr [esi+70]
 005620DA    imul        dword ptr [esi+78]
 005620DD    push        eax
 005620DE    mov         edx,edi
 005620E0    mov         eax,dword ptr [esi+74]
 005620E3    call        @jround_up
 005620E8    push        eax
 005620E9    mov         eax,esi
 005620EB    mov         edx,dword ptr [ebx+10]
 005620EE    xor         ecx,ecx
 005620F0    push        edx
 005620F1    mov         edx,1
 005620F6    mov         esi,dword ptr [eax+4]
 005620F9    call        dword ptr [esi+10]
 005620FC    mov         dword ptr [ebx+8],eax
>005620FF    jmp         0056211C
 00562101    mov         eax,dword ptr [ebx+10]
 00562104    mov         edx,1
 00562109    push        eax
 0056210A    mov         eax,esi
 0056210C    mov         ecx,dword ptr [esi+70]
 0056210F    imul        ecx,dword ptr [esi+78]
 00562113    mov         esi,dword ptr [eax+4]
 00562116    call        dword ptr [esi+8]
 00562119    mov         dword ptr [ebx+0C],eax
 0056211C    pop         edx
 0056211D    pop         edi
 0056211E    pop         esi
 0056211F    pop         ebx
 00562120    ret
*}
end;

//00562124
procedure _DF_.;
begin
{*
 00562124    push        ebx
 00562125    push        esi
 00562126    push        edi
 00562127    push        ebp
 00562128    add         esp,0FFFFFFD0
 0056212B    xor         edx,edx
 0056212D    xor         ecx,ecx
 0056212F    mov         dword ptr [esp],eax
 00562132    mov         eax,dword ptr [esp]
 00562135    mov         eax,dword ptr [eax+1C0]
 0056213B    mov         dword ptr [esp+0C],edx
 0056213F    mov         dword ptr [esp+10],ecx
 00562143    xor         edx,edx
 00562145    mov         dword ptr [esp+4],edx
 00562149    add         eax,4
 0056214C    mov         ecx,dword ptr [esp]
 0056214F    mov         edx,dword ptr [ecx+0D8]
 00562155    mov         dword ptr [esp+8],edx
 00562159    mov         dword ptr [esp+20],eax
>0056215D    jmp         0056235F
 00562162    mov         ecx,dword ptr [esp+8]
 00562166    mov         eax,dword ptr [ecx+24]
 00562169    dec         eax
>0056216A    je          0056217B
 0056216C    dec         eax
>0056216D    je          0056218E
 0056216F    sub         eax,2
>00562172    je          0056219E
 00562174    sub         eax,4
>00562177    je          005621AE
>00562179    jmp         005621F5
 0056217B    mov         dword ptr [esp+10],56390C;@jpeg_idct_1x1
 00562183    xor         edx,edx
 00562185    mov         dword ptr [esp+0C],edx
>00562189    jmp         00562212
 0056218E    mov         dword ptr [esp+10],56371C;@jpeg_idct_2x2
 00562196    xor         ecx,ecx
 00562198    mov         dword ptr [esp+0C],ecx
>0056219C    jmp         00562212
 0056219E    mov         dword ptr [esp+10],563368;@jpeg_idct_4x4
 005621A6    xor         eax,eax
 005621A8    mov         dword ptr [esp+0C],eax
>005621AC    jmp         00562212
 005621AE    mov         edx,dword ptr [esp]
 005621B1    mov         ecx,dword ptr [edx+48]
 005621B4    dec         ecx
>005621B5    je          005621BC
 005621B7    dec         ecx
>005621B8    je          005621CE
>005621BA    jmp         005621E0
 005621BC    mov         dword ptr [esp+10],562F34;@jpeg_idct_ifast
 005621C4    mov         dword ptr [esp+0C],1
>005621CC    jmp         00562212
 005621CE    mov         dword ptr [esp+10],562AF0;@jpeg_idct_float
 005621D6    mov         dword ptr [esp+0C],2
>005621DE    jmp         00562212
 005621E0    mov         eax,dword ptr [esp]
 005621E3    mov         edx,dword ptr [eax]
 005621E5    mov         dword ptr [edx+14],30
 005621EC    mov         eax,dword ptr [esp]
 005621EF    mov         edx,dword ptr [eax]
 005621F1    call        dword ptr [edx]
>005621F3    jmp         00562212
 005621F5    mov         ecx,dword ptr [esp]
 005621F8    mov         eax,dword ptr [ecx]
 005621FA    mov         dword ptr [eax+14],7
 00562201    mov         edx,dword ptr [esp+8]
 00562205    mov         ecx,dword ptr [edx+24]
 00562208    mov         dword ptr [eax+18],ecx
 0056220B    mov         eax,dword ptr [esp]
 0056220E    mov         edx,dword ptr [eax]
 00562210    call        dword ptr [edx]
 00562212    mov         ecx,dword ptr [esp+20]
 00562216    mov         eax,dword ptr [esp+10]
 0056221A    mov         dword ptr [ecx],eax
 0056221C    mov         edx,dword ptr [esp+8]
 00562220    cmp         dword ptr [edx+30],0
>00562224    je          00562351
 0056222A    mov         ecx,dword ptr [esp+20]
 0056222E    mov         eax,dword ptr [ecx+28]
 00562231    cmp         eax,dword ptr [esp+0C]
>00562235    je          00562351
 0056223B    mov         edx,dword ptr [esp+8]
 0056223F    mov         ecx,dword ptr [edx+4C]
 00562242    mov         dword ptr [esp+14],ecx
 00562246    cmp         dword ptr [esp+14],0
>0056224B    je          00562351
 00562251    mov         eax,dword ptr [esp+20]
 00562255    mov         edx,dword ptr [esp+0C]
 00562259    mov         dword ptr [eax+28],edx
 0056225C    mov         ecx,dword ptr [esp+0C]
 00562260    sub         ecx,1
>00562263    jb          0056226F
>00562265    je          00562294
 00562267    dec         ecx
>00562268    je          005622D5
>0056226A    jmp         0056233E
 0056226F    mov         eax,dword ptr [esp+8]
 00562273    mov         edx,dword ptr [eax+50]
 00562276    xor         eax,eax
 00562278    mov         ecx,edx
 0056227A    mov         edx,dword ptr [esp+14]
 0056227E    movzx       ebx,word ptr [edx]
 00562281    mov         dword ptr [ecx],ebx
 00562283    inc         eax
 00562284    add         ecx,4
 00562287    add         edx,2
 0056228A    cmp         eax,40
>0056228D    jl          0056227E
>0056228F    jmp         00562351
 00562294    mov         eax,dword ptr [esp+8]
 00562298    mov         edx,dword ptr [eax+50]
 0056229B    xor         eax,eax
 0056229D    mov         dword ptr [esp+24],edx
 005622A1    mov         ecx,78921C
 005622A6    mov         edx,dword ptr [esp+14]
 005622AA    movzx       ebx,word ptr [edx]
 005622AD    movsx       esi,word ptr [ecx]
 005622B0    imul        ebx,esi
 005622B3    add         ebx,800
 005622B9    mov         esi,dword ptr [esp+24]
 005622BD    sar         ebx,0C
 005622C0    add         ecx,2
 005622C3    mov         dword ptr [esi],ebx
 005622C5    add         edx,2
 005622C8    add         dword ptr [esp+24],4
 005622CD    inc         eax
 005622CE    cmp         eax,40
>005622D1    jl          005622AA
>005622D3    jmp         00562351
 005622D5    mov         eax,dword ptr [esp+8]
 005622D9    mov         edx,dword ptr [eax+50]
 005622DC    xor         eax,eax
 005622DE    mov         dword ptr [esp+18],edx
 005622E2    xor         edx,edx
 005622E4    mov         dword ptr [esp+1C],edx
 005622E8    mov         dword ptr [esp+28],78929C
 005622F0    xor         edi,edi
 005622F2    mov         edx,dword ptr [esp+18]
 005622F6    lea         ebx,[edx+eax*4]
 005622F9    mov         ecx,78929C
 005622FE    mov         edx,dword ptr [esp+28]
 00562302    mov         esi,edx
 00562304    mov         edx,dword ptr [esp+14]
 00562308    lea         edx,[edx+eax*2]
 0056230B    movzx       ebp,word ptr [edx]
 0056230E    mov         dword ptr [esp+2C],ebp
 00562312    add         edx,2
 00562315    fild        dword ptr [esp+2C]
 00562319    inc         eax
 0056231A    inc         edi
 0056231B    fmul        qword ptr [esi]
 0056231D    fmul        qword ptr [ecx]
 0056231F    add         ecx,8
 00562322    fstp        dword ptr [ebx]
 00562324    add         ebx,4
 00562327    cmp         edi,8
>0056232A    jl          0056230B
 0056232C    inc         dword ptr [esp+1C]
 00562330    add         dword ptr [esp+28],8
 00562335    cmp         dword ptr [esp+1C],8
>0056233A    jl          005622F0
>0056233C    jmp         00562351
 0056233E    mov         eax,dword ptr [esp]
 00562341    mov         edx,dword ptr [eax]
 00562343    mov         dword ptr [edx+14],30
 0056234A    mov         eax,dword ptr [esp]
 0056234D    mov         edx,dword ptr [eax]
 0056234F    call        dword ptr [edx]
 00562351    add         dword ptr [esp+20],4
 00562356    inc         dword ptr [esp+4]
 0056235A    add         dword ptr [esp+8],54
 0056235F    mov         ecx,dword ptr [esp]
 00562362    mov         eax,dword ptr [ecx+24]
 00562365    cmp         eax,dword ptr [esp+4]
>00562369    jg          00562162
 0056236F    add         esp,30
 00562372    pop         ebp
 00562373    pop         edi
 00562374    pop         esi
 00562375    pop         ebx
 00562376    ret
*}
end;

//00562378
procedure @jinit_inverse_dct;
begin
{*
 00562378    push        ebx
 00562379    push        esi
 0056237A    mov         esi,eax
 0056237C    push        edi
 0056237D    mov         eax,esi
 0056237F    push        ebp
 00562380    push        ecx
 00562381    mov         ecx,54
 00562386    mov         ebx,dword ptr [eax+4]
 00562389    mov         edx,1
 0056238E    call        dword ptr [ebx]
 00562390    mov         dword ptr [esi+1C0],eax
 00562396    mov         dword ptr [eax],562124;_DF_.
 0056239C    xor         edx,edx
 0056239E    lea         edi,[eax+2C]
 005623A1    mov         dword ptr [esp],edx
 005623A4    mov         ebx,dword ptr [esi+0D8]
>005623AA    jmp         005623E3
 005623AC    mov         eax,esi
 005623AE    mov         ecx,100
 005623B3    mov         edx,1
 005623B8    mov         ebp,dword ptr [eax+4]
 005623BB    call        dword ptr [ebp]
 005623BE    mov         dword ptr [ebx+50],eax
 005623C1    push        100
 005623C6    push        0
 005623C8    mov         eax,dword ptr [ebx+50]
 005623CB    push        eax
 005623CC    call        _memset
 005623D1    add         esp,0C
 005623D4    mov         dword ptr [edi],0FFFFFFFF
 005623DA    add         edi,4
 005623DD    inc         dword ptr [esp]
 005623E0    add         ebx,54
 005623E3    mov         edx,dword ptr [esp]
 005623E6    cmp         edx,dword ptr [esi+24]
>005623E9    jl          005623AC
 005623EB    pop         edx
 005623EC    pop         ebp
 005623ED    pop         edi
 005623EE    pop         esi
 005623EF    pop         ebx
 005623F0    ret
*}
end;

//005623F4
procedure _DF_.;
begin
{*
 005623F4    mov         edx,dword ptr [eax+1C4]
 005623FA    mov         ecx,dword ptr [eax+138]
 00562400    mov         dword ptr [edx+5C],ecx
 00562403    mov         eax,dword ptr [eax+74]
 00562406    mov         dword ptr [edx+60],eax
 00562409    ret
*}
end;

//005628D8
procedure @jinit_upsampler;
begin
{*
 005628D8    push        ebx
 005628D9    mov         ebx,eax
 005628DB    mov         eax,ebx
 005628DD    push        esi
 005628DE    push        edi
 005628DF    push        ebp
 005628E0    mov         esi,dword ptr [eax+4]
 005628E3    add         esp,0FFFFFFE4
 005628E6    mov         ecx,0A0
 005628EB    mov         edx,1
 005628F0    call        dword ptr [esi]
 005628F2    mov         dword ptr [esp],eax
 005628F5    mov         eax,dword ptr [esp]
 005628F8    mov         dword ptr [ebx+1C4],eax
 005628FE    mov         edx,dword ptr [esp]
 00562901    mov         dword ptr [edx],5623F4;_DF_.
 00562907    mov         ecx,dword ptr [esp]
 0056290A    mov         dword ptr [ecx+4],56240C
 00562911    mov         eax,dword ptr [esp]
 00562914    xor         edx,edx
 00562916    mov         dword ptr [eax+8],edx
 00562919    cmp         dword ptr [ebx+12C],0
>00562920    je          00562931
 00562922    mov         ecx,dword ptr [ebx]
 00562924    mov         eax,ebx
 00562926    mov         dword ptr [ecx+14],19
 0056292D    mov         edx,dword ptr [eax]
 0056292F    call        dword ptr [edx]
 00562931    cmp         dword ptr [ebx+4C],0
>00562935    je          00562940
 00562937    cmp         dword ptr [ebx+13C],1
>0056293E    jg          00562944
 00562940    xor         ecx,ecx
>00562942    jmp         00562949
 00562944    mov         ecx,1
 00562949    mov         dword ptr [esp+0C],ecx
 0056294D    xor         eax,eax
 0056294F    mov         dword ptr [esp+4],eax
 00562953    mov         edi,dword ptr [ebx+0D8]
 00562959    mov         eax,dword ptr [esp]
 0056295C    lea         edx,[eax+8C]
 00562962    mov         dword ptr [esp+18],edx
 00562966    mov         ecx,dword ptr [esp]
 00562969    lea         esi,[ecx+64]
>0056296C    jmp         00562ADB
 00562971    mov         eax,dword ptr [edi+8]
 00562974    mov         ecx,dword ptr [edi+24]
 00562977    imul        ecx
 00562979    cdq
 0056297A    idiv        eax,dword ptr [ebx+13C]
 00562980    mov         ebp,eax
 00562982    mov         eax,dword ptr [edi+0C]
 00562985    imul        ecx
 00562987    cdq
 00562988    idiv        eax,dword ptr [ebx+13C]
 0056298E    mov         ecx,eax
 00562990    mov         eax,dword ptr [ebx+134]
 00562996    mov         dword ptr [esp+10],eax
 0056299A    mov         edx,dword ptr [ebx+138]
 005629A0    mov         dword ptr [esp+14],edx
 005629A4    mov         dword ptr [esi],ecx
 005629A6    mov         dword ptr [esp+8],1
 005629AE    cmp         dword ptr [edi+30],0
>005629B2    jne         005629C6
 005629B4    mov         dword ptr [esi-30],562518
 005629BB    xor         ecx,ecx
 005629BD    mov         dword ptr [esp+8],ecx
>005629C1    jmp         00562A9F
 005629C6    cmp         ebp,dword ptr [esp+10]
>005629CA    jne         005629E4
 005629CC    cmp         ecx,dword ptr [esp+14]
>005629D0    jne         005629E4
 005629D2    mov         dword ptr [esi-30],56250C
 005629D9    xor         eax,eax
 005629DB    mov         dword ptr [esp+8],eax
>005629DF    jmp         00562A9F
 005629E4    mov         edx,ebp
 005629E6    add         edx,edx
 005629E8    cmp         edx,dword ptr [esp+10]
>005629EC    jne         00562A19
 005629EE    cmp         ecx,dword ptr [esp+14]
>005629F2    jne         00562A19
 005629F4    cmp         dword ptr [esp+0C],0
>005629F9    je          00562A0D
 005629FB    cmp         dword ptr [edi+28],2
>005629FF    jbe         00562A0D
 00562A01    mov         dword ptr [esi-30],5626D0
>00562A08    jmp         00562A9F
 00562A0D    mov         dword ptr [esi-30],5625E4
>00562A14    jmp         00562A9F
 00562A19    mov         eax,ebp
 00562A1B    add         eax,eax
 00562A1D    cmp         eax,dword ptr [esp+10]
>00562A21    jne         00562A56
 00562A23    mov         edx,ecx
 00562A25    add         edx,edx
 00562A27    cmp         edx,dword ptr [esp+14]
>00562A2B    jne         00562A56
 00562A2D    cmp         dword ptr [esp+0C],0
>00562A32    je          00562A4D
 00562A34    cmp         dword ptr [edi+28],2
>00562A38    jbe         00562A4D
 00562A3A    mov         dword ptr [esi-30],562784
 00562A41    mov         ecx,dword ptr [esp]
 00562A44    mov         dword ptr [ecx+8],1
>00562A4B    jmp         00562A9F
 00562A4D    mov         dword ptr [esi-30],562640
>00562A54    jmp         00562A9F
 00562A56    mov         eax,dword ptr [esp+10]
 00562A5A    cdq
 00562A5B    idiv        eax,ebp
 00562A5D    test        edx,edx
>00562A5F    jne         00562A90
 00562A61    mov         eax,dword ptr [esp+14]
 00562A65    cdq
 00562A66    idiv        eax,ecx
 00562A68    test        edx,edx
>00562A6A    jne         00562A90
 00562A6C    mov         dword ptr [esi-30],562528
 00562A73    mov         eax,dword ptr [esp+10]
 00562A77    cdq
 00562A78    idiv        eax,ebp
 00562A7A    mov         edx,dword ptr [esp+18]
 00562A7E    mov         byte ptr [edx],al
 00562A80    mov         eax,dword ptr [esp+14]
 00562A84    cdq
 00562A85    idiv        eax,ecx
 00562A87    mov         ecx,dword ptr [esp+18]
 00562A8B    mov         byte ptr [ecx+0A],al
>00562A8E    jmp         00562A9F
 00562A90    mov         eax,dword ptr [ebx]
 00562A92    mov         dword ptr [eax+14],26
 00562A99    mov         eax,ebx
 00562A9B    mov         edx,dword ptr [eax]
 00562A9D    call        dword ptr [edx]
 00562A9F    cmp         dword ptr [esp+8],0
>00562AA4    je          00562ACD
 00562AA6    mov         ecx,dword ptr [ebx+138]
 00562AAC    push        ecx
 00562AAD    mov         edx,dword ptr [ebx+134]
 00562AB3    mov         eax,dword ptr [ebx+70]
 00562AB6    call        @jround_up
 00562ABB    mov         ecx,eax
 00562ABD    mov         eax,ebx
 00562ABF    mov         edx,1
 00562AC4    mov         ebp,dword ptr [eax+4]
 00562AC7    call        dword ptr [ebp+8]
 00562ACA    mov         dword ptr [esi-58],eax
 00562ACD    add         esi,4
 00562AD0    inc         dword ptr [esp+18]
 00562AD4    inc         dword ptr [esp+4]
 00562AD8    add         edi,54
 00562ADB    mov         eax,dword ptr [esp+4]
 00562ADF    cmp         eax,dword ptr [ebx+24]
>00562AE2    jl          00562971
 00562AE8    add         esp,1C
 00562AEB    pop         ebp
 00562AEC    pop         edi
 00562AED    pop         esi
 00562AEE    pop         ebx
 00562AEF    ret
*}
end;

//00562AF0
procedure @jpeg_idct_float;
begin
{*
 00562AF0    push        ebp
 00562AF1    mov         ebp,esp
 00562AF3    add         esp,0FFFFFEB0
 00562AF9    push        ebx
 00562AFA    push        esi
 00562AFB    push        edi
 00562AFC    mov         edi,8
 00562B01    mov         eax,dword ptr [eax+144]
 00562B07    lea         ebx,[ebp-150]
 00562B0D    add         eax,80
 00562B12    mov         dword ptr [ebp-48],eax
 00562B15    mov         eax,ecx
 00562B17    mov         edx,dword ptr [edx+50]
 00562B1A    cmp         word ptr [eax+10],0
>00562B1F    jne         00562B9B
 00562B21    cmp         word ptr [eax+20],0
>00562B26    jne         00562B9B
 00562B28    cmp         word ptr [eax+30],0
>00562B2D    jne         00562B9B
 00562B2F    cmp         word ptr [eax+40],0
>00562B34    jne         00562B9B
 00562B36    cmp         word ptr [eax+50],0
>00562B3B    jne         00562B9B
 00562B3D    cmp         word ptr [eax+60],0
>00562B42    jne         00562B9B
 00562B44    cmp         word ptr [eax+70],0
>00562B49    jne         00562B9B
 00562B4B    fild        word ptr [eax]
 00562B4D    add         eax,2
 00562B50    fmul        dword ptr [edx]
 00562B52    add         edx,4
 00562B55    fstp        dword ptr [ebp-4C]
 00562B58    mov         ecx,dword ptr [ebp-4C]
 00562B5B    mov         dword ptr [ebx],ecx
 00562B5D    mov         ecx,dword ptr [ebp-4C]
 00562B60    mov         dword ptr [ebx+20],ecx
 00562B63    mov         ecx,dword ptr [ebp-4C]
 00562B66    mov         dword ptr [ebx+40],ecx
 00562B69    mov         ecx,dword ptr [ebp-4C]
 00562B6C    mov         dword ptr [ebx+60],ecx
 00562B6F    mov         ecx,dword ptr [ebp-4C]
 00562B72    mov         dword ptr [ebx+80],ecx
 00562B78    mov         ecx,dword ptr [ebp-4C]
 00562B7B    mov         dword ptr [ebx+0A0],ecx
 00562B81    mov         ecx,dword ptr [ebp-4C]
 00562B84    mov         dword ptr [ebx+0C0],ecx
 00562B8A    mov         ecx,dword ptr [ebp-4C]
 00562B8D    mov         dword ptr [ebx+0E0],ecx
 00562B93    add         ebx,4
>00562B96    jmp         00562D1E
 00562B9B    fild        word ptr [eax]
 00562B9D    fmul        dword ptr [edx]
 00562B9F    fstp        dword ptr [ebp-4]
 00562BA2    fild        word ptr [eax+20]
 00562BA5    fmul        dword ptr [edx+40]
 00562BA8    fstp        dword ptr [ebp-8]
 00562BAB    fild        word ptr [eax+40]
 00562BAE    fmul        dword ptr [edx+80]
 00562BB4    fstp        dword ptr [ebp-0C]
 00562BB7    fild        word ptr [eax+60]
 00562BBA    fmul        dword ptr [edx+0C0]
 00562BC0    fstp        dword ptr [ebp-10]
 00562BC3    fld         dword ptr [ebp-4]
 00562BC6    fadd        dword ptr [ebp-0C]
 00562BC9    fstp        dword ptr [ebp-24]
 00562BCC    fld         dword ptr [ebp-4]
 00562BCF    fsub        dword ptr [ebp-0C]
 00562BD2    fstp        dword ptr [ebp-28]
 00562BD5    fld         dword ptr [ebp-8]
 00562BD8    fadd        dword ptr [ebp-10]
 00562BDB    fstp        dword ptr [ebp-30]
 00562BDE    fld         dword ptr [ebp-8]
 00562BE1    fsub        dword ptr [ebp-10]
 00562BE4    fmul        dword ptr ds:[562F24]
 00562BEA    fsub        dword ptr [ebp-30]
 00562BED    fstp        dword ptr [ebp-2C]
 00562BF0    fld         dword ptr [ebp-24]
 00562BF3    fadd        dword ptr [ebp-30]
 00562BF6    fstp        dword ptr [ebp-4]
 00562BF9    fld         dword ptr [ebp-24]
 00562BFC    fsub        dword ptr [ebp-30]
 00562BFF    fstp        dword ptr [ebp-10]
 00562C02    fld         dword ptr [ebp-28]
 00562C05    fadd        dword ptr [ebp-2C]
 00562C08    fstp        dword ptr [ebp-8]
 00562C0B    fld         dword ptr [ebp-28]
 00562C0E    fsub        dword ptr [ebp-2C]
 00562C11    fstp        dword ptr [ebp-0C]
 00562C14    fild        word ptr [eax+10]
 00562C17    fmul        dword ptr [edx+20]
 00562C1A    fstp        dword ptr [ebp-14]
 00562C1D    fild        word ptr [eax+30]
 00562C20    fmul        dword ptr [edx+60]
 00562C23    fstp        dword ptr [ebp-18]
 00562C26    fild        word ptr [eax+50]
 00562C29    fmul        dword ptr [edx+0A0]
 00562C2F    fstp        dword ptr [ebp-1C]
 00562C32    fild        word ptr [eax+70]
 00562C35    fmul        dword ptr [edx+0E0]
 00562C3B    fstp        dword ptr [ebp-20]
 00562C3E    fld         dword ptr [ebp-1C]
 00562C41    fadd        dword ptr [ebp-18]
 00562C44    fstp        dword ptr [ebp-44]
 00562C47    fld         dword ptr [ebp-1C]
 00562C4A    fsub        dword ptr [ebp-18]
 00562C4D    fstp        dword ptr [ebp-38]
 00562C50    fld         dword ptr [ebp-14]
 00562C53    fadd        dword ptr [ebp-20]
 00562C56    fstp        dword ptr [ebp-3C]
 00562C59    fld         dword ptr [ebp-14]
 00562C5C    fsub        dword ptr [ebp-20]
 00562C5F    fstp        dword ptr [ebp-40]
 00562C62    fld         dword ptr [ebp-3C]
 00562C65    fadd        dword ptr [ebp-44]
 00562C68    fstp        dword ptr [ebp-20]
 00562C6B    fld         dword ptr [ebp-3C]
 00562C6E    fsub        dword ptr [ebp-44]
 00562C71    fmul        dword ptr ds:[562F24]
 00562C77    fstp        dword ptr [ebp-28]
 00562C7A    fld         dword ptr [ebp-38]
 00562C7D    fadd        dword ptr [ebp-40]
 00562C80    fmul        dword ptr ds:[562F28]
 00562C86    fstp        dword ptr [ebp-34]
 00562C89    fld         dword ptr ds:[562F2C]
 00562C8F    fmul        dword ptr [ebp-40]
 00562C92    fsub        dword ptr [ebp-34]
 00562C95    fstp        dword ptr [ebp-24]
 00562C98    fld         dword ptr ds:[562F30]
 00562C9E    fmul        dword ptr [ebp-38]
 00562CA1    add         eax,2
 00562CA4    add         edx,4
 00562CA7    fadd        dword ptr [ebp-34]
 00562CAA    fstp        dword ptr [ebp-2C]
 00562CAD    fld         dword ptr [ebp-2C]
 00562CB0    fsub        dword ptr [ebp-20]
 00562CB3    fstp        dword ptr [ebp-1C]
 00562CB6    fld         dword ptr [ebp-28]
 00562CB9    fsub        dword ptr [ebp-1C]
 00562CBC    fstp        dword ptr [ebp-18]
 00562CBF    fld         dword ptr [ebp-24]
 00562CC2    fadd        dword ptr [ebp-18]
 00562CC5    fstp        dword ptr [ebp-14]
 00562CC8    fld         dword ptr [ebp-4]
 00562CCB    fadd        dword ptr [ebp-20]
 00562CCE    fstp        dword ptr [ebx]
 00562CD0    fld         dword ptr [ebp-4]
 00562CD3    fsub        dword ptr [ebp-20]
 00562CD6    fstp        dword ptr [ebx+0E0]
 00562CDC    fld         dword ptr [ebp-8]
 00562CDF    fadd        dword ptr [ebp-1C]
 00562CE2    fstp        dword ptr [ebx+20]
 00562CE5    fld         dword ptr [ebp-8]
 00562CE8    fsub        dword ptr [ebp-1C]
 00562CEB    fstp        dword ptr [ebx+0C0]
 00562CF1    fld         dword ptr [ebp-0C]
 00562CF4    fadd        dword ptr [ebp-18]
 00562CF7    fstp        dword ptr [ebx+40]
 00562CFA    fld         dword ptr [ebp-0C]
 00562CFD    fsub        dword ptr [ebp-18]
 00562D00    fstp        dword ptr [ebx+0A0]
 00562D06    fld         dword ptr [ebp-10]
 00562D09    fadd        dword ptr [ebp-14]
 00562D0C    fstp        dword ptr [ebx+80]
 00562D12    fld         dword ptr [ebp-10]
 00562D15    fsub        dword ptr [ebp-14]
 00562D18    fstp        dword ptr [ebx+60]
 00562D1B    add         ebx,4
 00562D1E    dec         edi
 00562D1F    test        edi,edi
>00562D21    jg          00562B1A
 00562D27    mov         eax,dword ptr [ebp+0C]
 00562D2A    lea         ebx,[ebp-150]
 00562D30    mov         edx,eax
 00562D32    xor         edi,edi
 00562D34    mov         dword ptr [ebp-50],edx
 00562D37    mov         ecx,dword ptr [ebp-50]
 00562D3A    fld         dword ptr [ebx]
 00562D3C    fadd        dword ptr [ebx+10]
 00562D3F    mov         esi,dword ptr [ecx]
 00562D41    add         esi,dword ptr [ebp+8]
 00562D44    fstp        dword ptr [ebp-24]
 00562D47    fld         dword ptr [ebx]
 00562D49    fsub        dword ptr [ebx+10]
 00562D4C    fstp        dword ptr [ebp-28]
 00562D4F    fld         dword ptr [ebx+8]
 00562D52    fadd        dword ptr [ebx+18]
 00562D55    fstp        dword ptr [ebp-30]
 00562D58    fld         dword ptr [ebx+8]
 00562D5B    fsub        dword ptr [ebx+18]
 00562D5E    fmul        dword ptr ds:[562F24]
 00562D64    fsub        dword ptr [ebp-30]
 00562D67    fstp        dword ptr [ebp-2C]
 00562D6A    fld         dword ptr [ebp-24]
 00562D6D    fadd        dword ptr [ebp-30]
 00562D70    fstp        dword ptr [ebp-4]
 00562D73    fld         dword ptr [ebp-24]
 00562D76    fsub        dword ptr [ebp-30]
 00562D79    fstp        dword ptr [ebp-10]
 00562D7C    fld         dword ptr [ebp-28]
 00562D7F    fadd        dword ptr [ebp-2C]
 00562D82    fstp        dword ptr [ebp-8]
 00562D85    fld         dword ptr [ebp-28]
 00562D88    fsub        dword ptr [ebp-2C]
 00562D8B    fstp        dword ptr [ebp-0C]
 00562D8E    fld         dword ptr [ebx+14]
 00562D91    fadd        dword ptr [ebx+0C]
 00562D94    fstp        dword ptr [ebp-44]
 00562D97    fld         dword ptr [ebx+14]
 00562D9A    fsub        dword ptr [ebx+0C]
 00562D9D    fstp        dword ptr [ebp-38]
 00562DA0    fld         dword ptr [ebx+4]
 00562DA3    fadd        dword ptr [ebx+1C]
 00562DA6    fstp        dword ptr [ebp-3C]
 00562DA9    fld         dword ptr [ebx+4]
 00562DAC    fsub        dword ptr [ebx+1C]
 00562DAF    fstp        dword ptr [ebp-40]
 00562DB2    fld         dword ptr [ebp-3C]
 00562DB5    fadd        dword ptr [ebp-44]
 00562DB8    fstp        dword ptr [ebp-20]
 00562DBB    fld         dword ptr [ebp-3C]
 00562DBE    fsub        dword ptr [ebp-44]
 00562DC1    fmul        dword ptr ds:[562F24]
 00562DC7    fstp        dword ptr [ebp-28]
 00562DCA    fld         dword ptr [ebp-38]
 00562DCD    fadd        dword ptr [ebp-40]
 00562DD0    fmul        dword ptr ds:[562F28]
 00562DD6    fstp        dword ptr [ebp-34]
 00562DD9    fld         dword ptr ds:[562F2C]
 00562DDF    fmul        dword ptr [ebp-40]
 00562DE2    fsub        dword ptr [ebp-34]
 00562DE5    fstp        dword ptr [ebp-24]
 00562DE8    fld         dword ptr ds:[562F30]
 00562DEE    fmul        dword ptr [ebp-38]
 00562DF1    fadd        dword ptr [ebp-34]
 00562DF4    fstp        dword ptr [ebp-2C]
 00562DF7    fld         dword ptr [ebp-2C]
 00562DFA    fsub        dword ptr [ebp-20]
 00562DFD    fstp        dword ptr [ebp-1C]
 00562E00    fld         dword ptr [ebp-28]
 00562E03    fsub        dword ptr [ebp-1C]
 00562E06    fstp        dword ptr [ebp-18]
 00562E09    fld         dword ptr [ebp-24]
 00562E0C    fadd        dword ptr [ebp-18]
 00562E0F    fstp        dword ptr [ebp-14]
 00562E12    fld         dword ptr [ebp-4]
 00562E15    fadd        dword ptr [ebp-20]
 00562E18    call        __ftol
 00562E1D    add         eax,4
 00562E20    sar         eax,3
 00562E23    and         eax,3FF
 00562E28    mov         edx,dword ptr [ebp-48]
 00562E2B    mov         cl,byte ptr [edx+eax]
 00562E2E    mov         byte ptr [esi],cl
 00562E30    fld         dword ptr [ebp-4]
 00562E33    fsub        dword ptr [ebp-20]
 00562E36    call        __ftol
 00562E3B    add         eax,4
 00562E3E    sar         eax,3
 00562E41    and         eax,3FF
 00562E46    mov         edx,dword ptr [ebp-48]
 00562E49    mov         cl,byte ptr [edx+eax]
 00562E4C    mov         byte ptr [esi+7],cl
 00562E4F    fld         dword ptr [ebp-8]
 00562E52    fadd        dword ptr [ebp-1C]
 00562E55    call        __ftol
 00562E5A    add         eax,4
 00562E5D    sar         eax,3
 00562E60    and         eax,3FF
 00562E65    mov         edx,dword ptr [ebp-48]
 00562E68    mov         cl,byte ptr [edx+eax]
 00562E6B    mov         byte ptr [esi+1],cl
 00562E6E    fld         dword ptr [ebp-8]
 00562E71    fsub        dword ptr [ebp-1C]
 00562E74    call        __ftol
 00562E79    add         eax,4
 00562E7C    sar         eax,3
 00562E7F    and         eax,3FF
 00562E84    mov         edx,dword ptr [ebp-48]
 00562E87    mov         cl,byte ptr [edx+eax]
 00562E8A    mov         byte ptr [esi+6],cl
 00562E8D    fld         dword ptr [ebp-0C]
 00562E90    fadd        dword ptr [ebp-18]
 00562E93    call        __ftol
 00562E98    add         eax,4
 00562E9B    sar         eax,3
 00562E9E    and         eax,3FF
 00562EA3    mov         edx,dword ptr [ebp-48]
 00562EA6    mov         cl,byte ptr [edx+eax]
 00562EA9    mov         byte ptr [esi+2],cl
 00562EAC    fld         dword ptr [ebp-0C]
 00562EAF    fsub        dword ptr [ebp-18]
 00562EB2    call        __ftol
 00562EB7    add         eax,4
 00562EBA    sar         eax,3
 00562EBD    and         eax,3FF
 00562EC2    mov         edx,dword ptr [ebp-48]
 00562EC5    mov         cl,byte ptr [edx+eax]
 00562EC8    mov         byte ptr [esi+5],cl
 00562ECB    fld         dword ptr [ebp-10]
 00562ECE    fadd        dword ptr [ebp-14]
 00562ED1    call        __ftol
 00562ED6    add         eax,4
 00562ED9    sar         eax,3
 00562EDC    and         eax,3FF
 00562EE1    mov         edx,dword ptr [ebp-48]
 00562EE4    mov         cl,byte ptr [edx+eax]
 00562EE7    mov         byte ptr [esi+4],cl
 00562EEA    fld         dword ptr [ebp-10]
 00562EED    fsub        dword ptr [ebp-14]
 00562EF0    call        __ftol
 00562EF5    add         eax,4
 00562EF8    mov         edx,dword ptr [ebp-48]
 00562EFB    sar         eax,3
 00562EFE    add         ebx,20
 00562F01    and         eax,3FF
 00562F06    inc         edi
 00562F07    mov         cl,byte ptr [edx+eax]
 00562F0A    mov         byte ptr [esi+3],cl
 00562F0D    add         dword ptr [ebp-50],4
 00562F11    cmp         edi,8
>00562F14    jl          00562D37
 00562F1A    pop         edi
 00562F1B    pop         esi
 00562F1C    pop         ebx
 00562F1D    mov         esp,ebp
 00562F1F    pop         ebp
 00562F20    ret         8
*}
end;

//00562F34
procedure @jpeg_idct_ifast;
begin
{*
 00562F34    push        ebp
 00562F35    mov         ebp,esp
 00562F37    add         esp,0FFFFFEC0
 00562F3D    push        ebx
 00562F3E    push        esi
 00562F3F    push        edi
 00562F40    mov         dword ptr [ebp-0C],ecx
 00562F43    mov         dword ptr [ebp-8],edx
 00562F46    mov         dword ptr [ebp-4],eax
 00562F49    mov         eax,dword ptr [ebp-4]
 00562F4C    mov         edx,dword ptr [eax+144]
 00562F52    add         edx,80
 00562F58    mov         dword ptr [ebp-38],edx
 00562F5B    mov         edx,dword ptr [ebp-0C]
 00562F5E    mov         eax,dword ptr [ebp-8]
 00562F61    mov         ecx,dword ptr [eax+50]
 00562F64    mov         dword ptr [ebp-34],ecx
 00562F67    lea         eax,[ebp-140]
 00562F6D    mov         dword ptr [ebp-3C],8
 00562F74    cmp         word ptr [edx+10],0
>00562F79    jne         00562FE0
 00562F7B    cmp         word ptr [edx+20],0
>00562F80    jne         00562FE0
 00562F82    cmp         word ptr [edx+30],0
>00562F87    jne         00562FE0
 00562F89    cmp         word ptr [edx+40],0
>00562F8E    jne         00562FE0
 00562F90    cmp         word ptr [edx+50],0
>00562F95    jne         00562FE0
 00562F97    cmp         word ptr [edx+60],0
>00562F9C    jne         00562FE0
 00562F9E    cmp         word ptr [edx+70],0
>00562FA3    jne         00562FE0
 00562FA5    movsx       ecx,word ptr [edx]
 00562FA8    mov         ebx,dword ptr [ebp-34]
 00562FAB    add         edx,2
 00562FAE    imul        ecx,dword ptr [ebx]
 00562FB1    mov         dword ptr [eax],ecx
 00562FB3    mov         dword ptr [eax+20],ecx
 00562FB6    mov         dword ptr [eax+40],ecx
 00562FB9    mov         dword ptr [eax+60],ecx
 00562FBC    mov         dword ptr [eax+80],ecx
 00562FC2    mov         dword ptr [eax+0A0],ecx
 00562FC8    mov         dword ptr [eax+0C0],ecx
 00562FCE    mov         dword ptr [eax+0E0],ecx
 00562FD4    add         dword ptr [ebp-34],4
 00562FD8    add         eax,4
>00562FDB    jmp         00563159
 00562FE0    movsx       ecx,word ptr [edx]
 00562FE3    mov         ebx,dword ptr [ebp-34]
 00562FE6    imul        ecx,dword ptr [ebx]
 00562FE9    mov         dword ptr [ebp-10],ecx
 00562FEC    movsx       ecx,word ptr [edx+20]
 00562FF0    mov         ebx,dword ptr [ebp-34]
 00562FF3    imul        ecx,dword ptr [ebx+40]
 00562FF7    mov         dword ptr [ebp-14],ecx
 00562FFA    movsx       ecx,word ptr [edx+40]
 00562FFE    mov         ebx,dword ptr [ebp-34]
 00563001    imul        ecx,dword ptr [ebx+80]
 00563008    mov         dword ptr [ebp-18],ecx
 0056300B    movsx       ecx,word ptr [edx+60]
 0056300F    mov         ebx,dword ptr [ebp-34]
 00563012    imul        ecx,dword ptr [ebx+0C0]
 00563019    mov         dword ptr [ebp-1C],ecx
 0056301C    mov         ecx,dword ptr [ebp-10]
 0056301F    mov         ebx,dword ptr [ebp-10]
 00563022    mov         esi,dword ptr [ebp-14]
 00563025    add         ebx,dword ptr [ebp-18]
 00563028    sub         ecx,dword ptr [ebp-18]
 0056302B    add         esi,dword ptr [ebp-1C]
 0056302E    mov         dword ptr [ebp-28],esi
 00563031    mov         esi,dword ptr [ebp-14]
 00563034    mov         edi,dword ptr [ebp-28]
 00563037    sub         esi,dword ptr [ebp-1C]
 0056303A    imul        esi,esi,16A
 00563040    sar         esi,8
 00563043    add         edi,ebx
 00563045    sub         esi,dword ptr [ebp-28]
 00563048    mov         dword ptr [ebp-10],edi
 0056304B    sub         ebx,dword ptr [ebp-28]
 0056304E    mov         dword ptr [ebp-1C],ebx
 00563051    lea         ebx,[esi+ecx]
 00563054    sub         ecx,esi
 00563056    mov         dword ptr [ebp-14],ebx
 00563059    mov         dword ptr [ebp-18],ecx
 0056305C    movsx       ecx,word ptr [edx+10]
 00563060    mov         ebx,dword ptr [ebp-34]
 00563063    imul        ecx,dword ptr [ebx+20]
 00563067    mov         dword ptr [ebp-20],ecx
 0056306A    movsx       ecx,word ptr [edx+30]
 0056306E    mov         ebx,dword ptr [ebp-34]
 00563071    mov         edi,dword ptr [ebp-34]
 00563074    movsx       esi,word ptr [edx+50]
 00563078    imul        ecx,dword ptr [ebx+60]
 0056307C    mov         ebx,dword ptr [ebp-34]
 0056307F    imul        esi,dword ptr [ebx+0A0]
 00563086    movsx       ebx,word ptr [edx+70]
 0056308A    imul        ebx,dword ptr [edi+0E0]
 00563091    mov         dword ptr [ebp-24],ebx
 00563094    lea         ebx,[ecx+esi]
 00563097    sub         esi,ecx
 00563099    mov         ecx,dword ptr [ebp-20]
 0056309C    add         ecx,dword ptr [ebp-24]
 0056309F    mov         edi,dword ptr [ebp-20]
 005630A2    sub         edi,dword ptr [ebp-24]
 005630A5    add         edx,2
 005630A8    mov         dword ptr [ebp-30],edi
 005630AB    lea         edi,[ebx+ecx]
 005630AE    sub         ecx,ebx
 005630B0    mov         dword ptr [ebp-24],edi
 005630B3    mov         ebx,dword ptr [ebp-30]
 005630B6    imul        ecx,ecx,16A
 005630BC    add         ebx,esi
 005630BE    imul        esi,esi,0FFFFFD63
 005630C4    mov         edi,ebx
 005630C6    shl         ebx,4
 005630C9    sub         ebx,edi
 005630CB    shl         ebx,2
 005630CE    sub         ebx,edi
 005630D0    sar         esi,8
 005630D3    sar         ecx,8
 005630D6    lea         ebx,[edi+ebx*8]
 005630D9    sar         ebx,8
 005630DC    mov         dword ptr [ebp-2C],ebx
 005630DF    add         esi,dword ptr [ebp-2C]
 005630E2    mov         ebx,dword ptr [ebp-30]
 005630E5    mov         edi,ebx
 005630E7    sub         esi,dword ptr [ebp-24]
 005630EA    shl         ebx,4
 005630ED    sub         ecx,esi
 005630EF    add         ebx,edi
 005630F1    lea         ebx,[edi+ebx*4]
 005630F4    lea         ebx,[edi+ebx*4]
 005630F7    sar         ebx,8
 005630FA    sub         ebx,dword ptr [ebp-2C]
 005630FD    lea         ebx,[ecx+ebx]
 00563100    mov         dword ptr [ebp-20],ebx
 00563103    mov         ebx,dword ptr [ebp-10]
 00563106    add         ebx,dword ptr [ebp-24]
 00563109    mov         dword ptr [eax],ebx
 0056310B    mov         ebx,dword ptr [ebp-10]
 0056310E    sub         ebx,dword ptr [ebp-24]
 00563111    mov         dword ptr [eax+0E0],ebx
 00563117    mov         ebx,dword ptr [ebp-14]
 0056311A    add         ebx,esi
 0056311C    mov         dword ptr [eax+20],ebx
 0056311F    mov         ebx,dword ptr [ebp-14]
 00563122    sub         ebx,esi
 00563124    mov         dword ptr [eax+0C0],ebx
 0056312A    mov         ebx,dword ptr [ebp-18]
 0056312D    add         ebx,ecx
 0056312F    mov         dword ptr [eax+40],ebx
 00563132    mov         ebx,dword ptr [ebp-18]
 00563135    sub         ebx,ecx
 00563137    mov         dword ptr [eax+0A0],ebx
 0056313D    mov         ecx,dword ptr [ebp-1C]
 00563140    add         ecx,dword ptr [ebp-20]
 00563143    mov         dword ptr [eax+80],ecx
 00563149    mov         ecx,dword ptr [ebp-1C]
 0056314C    sub         ecx,dword ptr [ebp-20]
 0056314F    mov         dword ptr [eax+60],ecx
 00563152    add         dword ptr [ebp-34],4
 00563156    add         eax,4
 00563159    dec         dword ptr [ebp-3C]
 0056315C    cmp         dword ptr [ebp-3C],0
>00563160    jg          00562F74
 00563166    lea         eax,[ebp-140]
 0056316C    xor         edx,edx
 0056316E    mov         dword ptr [ebp-3C],edx
 00563171    mov         edx,dword ptr [ebp+0C]
 00563174    mov         ecx,edx
 00563176    mov         dword ptr [ebp-40],ecx
 00563179    mov         edx,dword ptr [ebp-40]
 0056317C    mov         edx,dword ptr [edx]
 0056317E    add         edx,dword ptr [ebp+8]
 00563181    cmp         dword ptr [eax+4],0
>00563185    jne         005631DB
 00563187    cmp         dword ptr [eax+8],0
>0056318B    jne         005631DB
 0056318D    cmp         dword ptr [eax+0C],0
>00563191    jne         005631DB
 00563193    cmp         dword ptr [eax+10],0
>00563197    jne         005631DB
 00563199    cmp         dword ptr [eax+14],0
>0056319D    jne         005631DB
 0056319F    cmp         dword ptr [eax+18],0
>005631A3    jne         005631DB
 005631A5    cmp         dword ptr [eax+1C],0
>005631A9    jne         005631DB
 005631AB    mov         ecx,dword ptr [eax]
 005631AD    sar         ecx,5
 005631B0    and         ecx,3FF
 005631B6    mov         ebx,dword ptr [ebp-38]
 005631B9    mov         cl,byte ptr [ebx+ecx]
 005631BC    mov         byte ptr [edx],cl
 005631BE    mov         byte ptr [edx+1],cl
 005631C1    mov         byte ptr [edx+2],cl
 005631C4    mov         byte ptr [edx+3],cl
 005631C7    mov         byte ptr [edx+4],cl
 005631CA    mov         byte ptr [edx+5],cl
 005631CD    mov         byte ptr [edx+6],cl
 005631D0    mov         byte ptr [edx+7],cl
 005631D3    add         eax,20
>005631D6    jmp         0056334B
 005631DB    mov         ecx,dword ptr [eax]
 005631DD    mov         esi,dword ptr [eax+10]
 005631E0    mov         ebx,ecx
 005631E2    sub         ecx,esi
 005631E4    add         ebx,esi
 005631E6    mov         esi,dword ptr [eax+8]
 005631E9    mov         edi,esi
 005631EB    add         edi,dword ptr [eax+18]
 005631EE    mov         dword ptr [ebp-28],edi
 005631F1    sub         esi,dword ptr [eax+18]
 005631F4    imul        esi,esi,16A
 005631FA    sar         esi,8
 005631FD    mov         edi,dword ptr [ebp-28]
 00563200    sub         esi,dword ptr [ebp-28]
 00563203    add         edi,ebx
 00563205    mov         dword ptr [ebp-10],edi
 00563208    sub         ebx,dword ptr [ebp-28]
 0056320B    mov         dword ptr [ebp-1C],ebx
 0056320E    lea         ebx,[esi+ecx]
 00563211    sub         ecx,esi
 00563213    mov         dword ptr [ebp-14],ebx
 00563216    mov         dword ptr [ebp-18],ecx
 00563219    mov         ecx,dword ptr [eax+14]
 0056321C    mov         edi,dword ptr [eax+4]
 0056321F    mov         ebx,ecx
 00563221    mov         esi,ecx
 00563223    mov         ecx,dword ptr [eax+4]
 00563226    add         ecx,dword ptr [eax+1C]
 00563229    add         ebx,dword ptr [eax+0C]
 0056322C    sub         esi,dword ptr [eax+0C]
 0056322F    sub         edi,dword ptr [eax+1C]
 00563232    mov         dword ptr [ebp-30],edi
 00563235    lea         edi,[ebx+ecx]
 00563238    sub         ecx,ebx
 0056323A    mov         dword ptr [ebp-24],edi
 0056323D    mov         ebx,dword ptr [ebp-30]
 00563240    imul        ecx,ecx,16A
 00563246    add         ebx,esi
 00563248    imul        esi,esi,0FFFFFD63
 0056324E    mov         edi,ebx
 00563250    shl         ebx,4
 00563253    sub         ebx,edi
 00563255    shl         ebx,2
 00563258    sub         ebx,edi
 0056325A    sar         esi,8
 0056325D    sar         ecx,8
 00563260    lea         ebx,[edi+ebx*8]
 00563263    sar         ebx,8
 00563266    mov         dword ptr [ebp-2C],ebx
 00563269    add         esi,dword ptr [ebp-2C]
 0056326C    mov         ebx,dword ptr [ebp-30]
 0056326F    mov         edi,ebx
 00563271    sub         esi,dword ptr [ebp-24]
 00563274    shl         ebx,4
 00563277    sub         ecx,esi
 00563279    add         ebx,edi
 0056327B    lea         ebx,[edi+ebx*4]
 0056327E    lea         ebx,[edi+ebx*4]
 00563281    sar         ebx,8
 00563284    sub         ebx,dword ptr [ebp-2C]
 00563287    lea         ebx,[ecx+ebx]
 0056328A    mov         dword ptr [ebp-20],ebx
 0056328D    mov         ebx,dword ptr [ebp-10]
 00563290    mov         edi,dword ptr [ebp-38]
 00563293    add         ebx,dword ptr [ebp-24]
 00563296    sar         ebx,5
 00563299    and         ebx,3FF
 0056329F    mov         bl,byte ptr [edi+ebx]
 005632A2    mov         byte ptr [edx],bl
 005632A4    mov         ebx,dword ptr [ebp-10]
 005632A7    mov         edi,dword ptr [ebp-38]
 005632AA    sub         ebx,dword ptr [ebp-24]
 005632AD    sar         ebx,5
 005632B0    and         ebx,3FF
 005632B6    mov         bl,byte ptr [edi+ebx]
 005632B9    mov         byte ptr [edx+7],bl
 005632BC    mov         ebx,dword ptr [ebp-14]
 005632BF    mov         edi,dword ptr [ebp-38]
 005632C2    add         ebx,esi
 005632C4    sar         ebx,5
 005632C7    and         ebx,3FF
 005632CD    mov         bl,byte ptr [edi+ebx]
 005632D0    mov         byte ptr [edx+1],bl
 005632D3    mov         ebx,dword ptr [ebp-14]
 005632D6    sub         ebx,esi
 005632D8    mov         esi,dword ptr [ebp-38]
 005632DB    sar         ebx,5
 005632DE    and         ebx,3FF
 005632E4    mov         bl,byte ptr [esi+ebx]
 005632E7    mov         byte ptr [edx+6],bl
 005632EA    mov         ebx,dword ptr [ebp-18]
 005632ED    mov         esi,dword ptr [ebp-38]
 005632F0    add         ebx,ecx
 005632F2    sar         ebx,5
 005632F5    and         ebx,3FF
 005632FB    mov         bl,byte ptr [esi+ebx]
 005632FE    mov         byte ptr [edx+2],bl
 00563301    mov         ebx,dword ptr [ebp-18]
 00563304    sub         ebx,ecx
 00563306    mov         ecx,dword ptr [ebp-38]
 00563309    sar         ebx,5
 0056330C    and         ebx,3FF
 00563312    mov         cl,byte ptr [ecx+ebx]
 00563315    mov         byte ptr [edx+5],cl
 00563318    mov         ecx,dword ptr [ebp-1C]
 0056331B    mov         ebx,dword ptr [ebp-38]
 0056331E    add         ecx,dword ptr [ebp-20]
 00563321    sar         ecx,5
 00563324    and         ecx,3FF
 0056332A    mov         cl,byte ptr [ebx+ecx]
 0056332D    mov         byte ptr [edx+4],cl
 00563330    mov         ecx,dword ptr [ebp-1C]
 00563333    mov         ebx,dword ptr [ebp-38]
 00563336    sub         ecx,dword ptr [ebp-20]
 00563339    sar         ecx,5
 0056333C    and         ecx,3FF
 00563342    add         eax,20
 00563345    mov         cl,byte ptr [ebx+ecx]
 00563348    mov         byte ptr [edx+3],cl
 0056334B    inc         dword ptr [ebp-3C]
 0056334E    add         dword ptr [ebp-40],4
 00563352    cmp         dword ptr [ebp-3C],8
>00563356    jl          00563179
 0056335C    pop         edi
 0056335D    pop         esi
 0056335E    pop         ebx
 0056335F    mov         esp,ebp
 00563361    pop         ebp
 00563362    ret         8
*}
end;

//00563368
procedure @jpeg_idct_4x4;
begin
{*
 00563368    push        ebp
 00563369    mov         ebp,esp
 0056336B    add         esp,0FFFFFF58
 00563371    push        ebx
 00563372    push        esi
 00563373    push        edi
 00563374    mov         eax,dword ptr [eax+144]
 0056337A    add         eax,80
 0056337F    mov         dword ptr [ebp-20],eax
 00563382    mov         ebx,ecx
 00563384    mov         eax,dword ptr [edx+50]
 00563387    mov         dword ptr [ebp-1C],eax
 0056338A    lea         eax,[ebp-0A8]
 00563390    mov         dword ptr [ebp-24],8
 00563397    cmp         dword ptr [ebp-24],4
>0056339B    je          00563542
 005633A1    cmp         word ptr [ebx+10],0
>005633A6    jne         005633E7
 005633A8    cmp         word ptr [ebx+20],0
>005633AD    jne         005633E7
 005633AF    cmp         word ptr [ebx+30],0
>005633B4    jne         005633E7
 005633B6    cmp         word ptr [ebx+50],0
>005633BB    jne         005633E7
 005633BD    cmp         word ptr [ebx+60],0
>005633C2    jne         005633E7
 005633C4    cmp         word ptr [ebx+70],0
>005633C9    jne         005633E7
 005633CB    movsx       edx,word ptr [ebx]
 005633CE    mov         ecx,dword ptr [ebp-1C]
 005633D1    imul        edx,dword ptr [ecx]
 005633D4    shl         edx,2
 005633D7    mov         dword ptr [eax],edx
 005633D9    mov         dword ptr [eax+20],edx
 005633DC    mov         dword ptr [eax+40],edx
 005633DF    mov         dword ptr [eax+60],edx
>005633E2    jmp         00563542
 005633E7    movsx       edx,word ptr [ebx]
 005633EA    mov         ecx,dword ptr [ebp-1C]
 005633ED    mov         esi,dword ptr [ebp-1C]
 005633F0    imul        edx,dword ptr [ecx]
 005633F3    movsx       ecx,word ptr [ebx+20]
 005633F7    imul        ecx,dword ptr [esi+40]
 005633FB    mov         dword ptr [ebp-10],ecx
 005633FE    movsx       ecx,word ptr [ebx+60]
 00563402    mov         esi,dword ptr [ebp-1C]
 00563405    imul        ecx,dword ptr [esi+0C0]
 0056340C    mov         dword ptr [ebp-14],ecx
 0056340F    mov         ecx,dword ptr [ebp-10]
 00563412    mov         esi,ecx
 00563414    shl         ecx,4
 00563417    sub         ecx,esi
 00563419    shl         ecx,2
 0056341C    sub         ecx,esi
 0056341E    shl         edx,0E
 00563421    lea         ecx,[esi+ecx*8]
 00563424    shl         ecx,5
 00563427    add         ecx,esi
 00563429    mov         esi,dword ptr [ebp-14]
 0056342C    mov         edi,esi
 0056342E    neg         esi
 00563430    lea         esi,[edi+esi*4]
 00563433    shl         esi,4
 00563436    sub         esi,edi
 00563438    shl         esi,6
 0056343B    add         esi,edi
 0056343D    add         esi,esi
 0056343F    add         ecx,esi
 00563441    lea         esi,[ecx+edx]
 00563444    sub         edx,ecx
 00563446    mov         dword ptr [ebp-4],esi
 00563449    mov         dword ptr [ebp-8],edx
 0056344C    movsx       edx,word ptr [ebx+70]
 00563450    mov         ecx,dword ptr [ebp-1C]
 00563453    imul        edx,dword ptr [ecx+0E0]
 0056345A    mov         dword ptr [ebp-0C],edx
 0056345D    movsx       edx,word ptr [ebx+50]
 00563461    mov         ecx,dword ptr [ebp-1C]
 00563464    imul        edx,dword ptr [ecx+0A0]
 0056346B    mov         dword ptr [ebp-10],edx
 0056346E    movsx       edx,word ptr [ebx+30]
 00563472    mov         ecx,dword ptr [ebp-1C]
 00563475    imul        edx,dword ptr [ecx+60]
 00563479    mov         dword ptr [ebp-14],edx
 0056347C    movsx       edx,word ptr [ebx+10]
 00563480    mov         ecx,dword ptr [ebp-1C]
 00563483    imul        edx,dword ptr [ecx+20]
 00563487    mov         dword ptr [ebp-18],edx
 0056348A    mov         edx,dword ptr [ebp-0C]
 0056348D    mov         ecx,edx
 0056348F    neg         edx
 00563491    lea         edx,[ecx+edx*8]
 00563494    lea         edx,[ecx+edx*4]
 00563497    shl         edx,5
 0056349A    sub         edx,ecx
 0056349C    imul        ecx,dword ptr [ebp-10],2E75
 005634A3    add         edx,edx
 005634A5    add         edx,ecx
 005634A7    imul        ecx,dword ptr [ebp-14],0FFFFBA79
 005634AE    add         edx,ecx
 005634B0    mov         ecx,dword ptr [ebp-18]
 005634B3    mov         esi,ecx
 005634B5    shl         ecx,4
 005634B8    add         ecx,esi
 005634BA    shl         ecx,6
 005634BD    sub         ecx,esi
 005634BF    lea         ecx,[esi+ecx*8]
 005634C2    add         edx,ecx
 005634C4    mov         ecx,dword ptr [ebp-0C]
 005634C7    mov         esi,ecx
 005634C9    neg         ecx
 005634CB    shl         ecx,6
 005634CE    sub         ecx,esi
 005634D0    shl         ecx,2
 005634D3    sub         ecx,esi
 005634D5    imul        esi,dword ptr [ebp-10],0FFFFECC2
 005634DC    shl         ecx,4
 005634DF    add         ecx,esi
 005634E1    imul        esi,dword ptr [ebp-14],1CCD
 005634E8    add         ecx,esi
 005634EA    mov         esi,dword ptr [ebp-18]
 005634ED    mov         edi,esi
 005634EF    lea         esi,[edi+esi*4]
 005634F2    lea         esi,[edi+esi*8]
 005634F5    shl         esi,8
 005634F8    add         esi,edi
 005634FA    lea         esi,[edi+esi*2]
 005634FD    add         ecx,esi
 005634FF    mov         esi,dword ptr [ebp-4]
 00563502    add         esi,ecx
 00563504    add         esi,800
 0056350A    sar         esi,0C
 0056350D    mov         dword ptr [eax],esi
 0056350F    mov         esi,dword ptr [ebp-4]
 00563512    sub         esi,ecx
 00563514    add         esi,800
 0056351A    sar         esi,0C
 0056351D    mov         dword ptr [eax+60],esi
 00563520    mov         ecx,dword ptr [ebp-8]
 00563523    add         ecx,edx
 00563525    add         ecx,800
 0056352B    sar         ecx,0C
 0056352E    mov         dword ptr [eax+20],ecx
 00563531    mov         ecx,dword ptr [ebp-8]
 00563534    sub         ecx,edx
 00563536    add         ecx,800
 0056353C    sar         ecx,0C
 0056353F    mov         dword ptr [eax+40],ecx
 00563542    add         ebx,2
 00563545    add         dword ptr [ebp-1C],4
 00563549    add         eax,4
 0056354C    dec         dword ptr [ebp-24]
 0056354F    cmp         dword ptr [ebp-24],0
>00563553    jg          00563397
 00563559    lea         eax,[ebp-0A8]
 0056355F    xor         edx,edx
 00563561    mov         dword ptr [ebp-24],edx
 00563564    mov         edx,dword ptr [ebp+0C]
 00563567    mov         ecx,edx
 00563569    mov         dword ptr [ebp-28],ecx
 0056356C    mov         edx,dword ptr [ebp-28]
 0056356F    mov         esi,dword ptr [edx]
 00563571    add         esi,dword ptr [ebp+8]
 00563574    cmp         dword ptr [eax+4],0
>00563578    jne         005635BF
 0056357A    cmp         dword ptr [eax+8],0
>0056357E    jne         005635BF
 00563580    cmp         dword ptr [eax+0C],0
>00563584    jne         005635BF
 00563586    cmp         dword ptr [eax+14],0
>0056358A    jne         005635BF
 0056358C    cmp         dword ptr [eax+18],0
>00563590    jne         005635BF
 00563592    cmp         dword ptr [eax+1C],0
>00563596    jne         005635BF
 00563598    mov         edx,dword ptr [eax]
 0056359A    add         edx,10
 0056359D    sar         edx,5
 005635A0    and         edx,3FF
 005635A6    mov         ecx,dword ptr [ebp-20]
 005635A9    mov         dl,byte ptr [ecx+edx]
 005635AC    mov         byte ptr [esi],dl
 005635AE    mov         byte ptr [esi+1],dl
 005635B1    mov         byte ptr [esi+2],dl
 005635B4    mov         byte ptr [esi+3],dl
 005635B7    add         eax,20
>005635BA    jmp         00563701
 005635BF    mov         ecx,dword ptr [eax+8]
 005635C2    mov         edx,dword ptr [eax]
 005635C4    mov         ebx,ecx
 005635C6    shl         ecx,4
 005635C9    sub         ecx,ebx
 005635CB    shl         ecx,2
 005635CE    sub         ecx,ebx
 005635D0    shl         edx,0E
 005635D3    lea         ecx,[ebx+ecx*8]
 005635D6    shl         ecx,5
 005635D9    add         ecx,ebx
 005635DB    mov         ebx,dword ptr [eax+18]
 005635DE    mov         edi,ebx
 005635E0    neg         ebx
 005635E2    lea         ebx,[edi+ebx*4]
 005635E5    shl         ebx,4
 005635E8    sub         ebx,edi
 005635EA    shl         ebx,6
 005635ED    add         ebx,edi
 005635EF    add         ebx,ebx
 005635F1    add         ecx,ebx
 005635F3    lea         ebx,[ecx+edx]
 005635F6    sub         edx,ecx
 005635F8    mov         dword ptr [ebp-4],ebx
 005635FB    mov         dword ptr [ebp-8],edx
 005635FE    mov         edx,dword ptr [eax+1C]
 00563601    mov         dword ptr [ebp-0C],edx
 00563604    mov         ecx,dword ptr [eax+14]
 00563607    mov         dword ptr [ebp-10],ecx
 0056360A    mov         edx,dword ptr [eax+0C]
 0056360D    mov         dword ptr [ebp-14],edx
 00563610    mov         ecx,dword ptr [eax+4]
 00563613    mov         dword ptr [ebp-18],ecx
 00563616    mov         edx,dword ptr [ebp-0C]
 00563619    mov         ecx,edx
 0056361B    neg         edx
 0056361D    lea         edx,[ecx+edx*8]
 00563620    lea         edx,[ecx+edx*4]
 00563623    shl         edx,5
 00563626    sub         edx,ecx
 00563628    imul        ecx,dword ptr [ebp-10],2E75
 0056362F    add         edx,edx
 00563631    add         edx,ecx
 00563633    imul        ecx,dword ptr [ebp-14],0FFFFBA79
 0056363A    add         edx,ecx
 0056363C    mov         ecx,dword ptr [ebp-18]
 0056363F    mov         ebx,ecx
 00563641    shl         ecx,4
 00563644    add         ecx,ebx
 00563646    shl         ecx,6
 00563649    sub         ecx,ebx
 0056364B    lea         ecx,[ebx+ecx*8]
 0056364E    add         edx,ecx
 00563650    mov         ecx,dword ptr [ebp-0C]
 00563653    mov         ebx,ecx
 00563655    neg         ecx
 00563657    shl         ecx,6
 0056365A    sub         ecx,ebx
 0056365C    shl         ecx,2
 0056365F    sub         ecx,ebx
 00563661    imul        ebx,dword ptr [ebp-10],0FFFFECC2
 00563668    shl         ecx,4
 0056366B    add         ecx,ebx
 0056366D    imul        ebx,dword ptr [ebp-14],1CCD
 00563674    add         ecx,ebx
 00563676    mov         ebx,dword ptr [ebp-18]
 00563679    mov         edi,ebx
 0056367B    lea         ebx,[edi+ebx*4]
 0056367E    lea         ebx,[edi+ebx*8]
 00563681    shl         ebx,8
 00563684    add         ebx,edi
 00563686    lea         ebx,[edi+ebx*2]
 00563689    mov         edi,dword ptr [ebp-20]
 0056368C    add         ecx,ebx
 0056368E    mov         ebx,dword ptr [ebp-4]
 00563691    add         ebx,ecx
 00563693    add         ebx,40000
 00563699    sar         ebx,13
 0056369C    and         ebx,3FF
 005636A2    mov         bl,byte ptr [edi+ebx]
 005636A5    mov         byte ptr [esi],bl
 005636A7    mov         ebx,dword ptr [ebp-4]
 005636AA    sub         ebx,ecx
 005636AC    mov         ecx,dword ptr [ebp-20]
 005636AF    add         ebx,40000
 005636B5    sar         ebx,13
 005636B8    and         ebx,3FF
 005636BE    mov         cl,byte ptr [ecx+ebx]
 005636C1    mov         byte ptr [esi+3],cl
 005636C4    mov         ecx,dword ptr [ebp-8]
 005636C7    mov         ebx,dword ptr [ebp-20]
 005636CA    add         ecx,edx
 005636CC    add         ecx,40000
 005636D2    sar         ecx,13
 005636D5    and         ecx,3FF
 005636DB    mov         cl,byte ptr [ebx+ecx]
 005636DE    mov         byte ptr [esi+1],cl
 005636E1    mov         ecx,dword ptr [ebp-8]
 005636E4    sub         ecx,edx
 005636E6    mov         edx,dword ptr [ebp-20]
 005636E9    add         ecx,40000
 005636EF    sar         ecx,13
 005636F2    and         ecx,3FF
 005636F8    add         eax,20
 005636FB    mov         dl,byte ptr [edx+ecx]
 005636FE    mov         byte ptr [esi+2],dl
 00563701    inc         dword ptr [ebp-24]
 00563704    add         dword ptr [ebp-28],4
 00563708    cmp         dword ptr [ebp-24],4
>0056370C    jl          0056356C
 00563712    pop         edi
 00563713    pop         esi
 00563714    pop         ebx
 00563715    mov         esp,ebp
 00563717    pop         ebp
 00563718    ret         8
*}
end;

//0056371C
procedure @jpeg_idct_2x2;
begin
{*
 0056371C    push        ebp
 0056371D    mov         ebp,esp
 0056371F    add         esp,0FFFFFFAC
 00563722    push        ebx
 00563723    push        esi
 00563724    push        edi
 00563725    mov         eax,dword ptr [eax+144]
 0056372B    add         eax,80
 00563730    mov         dword ptr [ebp-0C],eax
 00563733    lea         eax,[ebp-54]
 00563736    mov         edx,dword ptr [edx+50]
 00563739    mov         dword ptr [ebp-8],edx
 0056373C    mov         edx,8
 00563741    cmp         edx,6
>00563744    je          0056381A
 0056374A    cmp         edx,4
>0056374D    je          0056381A
 00563753    cmp         edx,2
>00563756    je          0056381A
 0056375C    cmp         word ptr [ecx+10],0
>00563761    jne         0056378E
 00563763    cmp         word ptr [ecx+30],0
>00563768    jne         0056378E
 0056376A    cmp         word ptr [ecx+50],0
>0056376F    jne         0056378E
 00563771    cmp         word ptr [ecx+70],0
>00563776    jne         0056378E
 00563778    movsx       ebx,word ptr [ecx]
 0056377B    mov         esi,dword ptr [ebp-8]
 0056377E    imul        ebx,dword ptr [esi]
 00563781    shl         ebx,2
 00563784    mov         dword ptr [eax],ebx
 00563786    mov         dword ptr [eax+20],ebx
>00563789    jmp         0056381A
 0056378E    movsx       ebx,word ptr [ecx]
 00563791    mov         esi,dword ptr [ebp-8]
 00563794    imul        ebx,dword ptr [esi]
 00563797    shl         ebx,0F
 0056379A    mov         dword ptr [ebp-4],ebx
 0056379D    movsx       ebx,word ptr [ecx+70]
 005637A1    mov         esi,dword ptr [ebp-8]
 005637A4    mov         edi,dword ptr [ebp-8]
 005637A7    imul        ebx,dword ptr [esi+0E0]
 005637AE    imul        esi,ebx,0FFFFE8EE
 005637B4    movsx       ebx,word ptr [ecx+50]
 005637B8    imul        ebx,dword ptr [edi+0A0]
 005637BF    imul        ebx,ebx,1B37
 005637C5    add         esi,ebx
 005637C7    mov         edi,dword ptr [ebp-8]
 005637CA    movsx       ebx,word ptr [ecx+30]
 005637CE    imul        ebx,dword ptr [edi+60]
 005637D2    imul        ebx,ebx,0FFFFD746
 005637D8    add         esi,ebx
 005637DA    mov         edi,dword ptr [ebp-8]
 005637DD    movsx       ebx,word ptr [ecx+10]
 005637E1    imul        ebx,dword ptr [edi+20]
 005637E5    mov         edi,ebx
 005637E7    shl         ebx,3
 005637EA    sub         ebx,edi
 005637EC    lea         ebx,[edi+ebx*4]
 005637EF    shl         ebx,8
 005637F2    sub         ebx,edi
 005637F4    shl         ebx,2
 005637F7    add         esi,ebx
 005637F9    mov         ebx,dword ptr [ebp-4]
 005637FC    add         ebx,esi
 005637FE    add         ebx,1000
 00563804    sar         ebx,0D
 00563807    mov         dword ptr [eax],ebx
 00563809    mov         ebx,dword ptr [ebp-4]
 0056380C    sub         ebx,esi
 0056380E    add         ebx,1000
 00563814    sar         ebx,0D
 00563817    mov         dword ptr [eax+20],ebx
 0056381A    add         ecx,2
 0056381D    add         dword ptr [ebp-8],4
 00563821    add         eax,4
 00563824    dec         edx
 00563825    test        edx,edx
>00563827    jg          00563741
 0056382D    mov         ecx,dword ptr [ebp+0C]
 00563830    lea         eax,[ebp-54]
 00563833    mov         dword ptr [ebp-14],ecx
 00563836    xor         edx,edx
 00563838    mov         ecx,dword ptr [ebp-14]
 0056383B    mov         ecx,dword ptr [ecx]
 0056383D    add         ecx,dword ptr [ebp+8]
 00563840    cmp         dword ptr [eax+4],0
>00563844    jne         0056387F
 00563846    cmp         dword ptr [eax+0C],0
>0056384A    jne         0056387F
 0056384C    cmp         dword ptr [eax+14],0
>00563850    jne         0056387F
 00563852    cmp         dword ptr [eax+1C],0
>00563856    jne         0056387F
 00563858    mov         ebx,dword ptr [eax]
 0056385A    mov         esi,dword ptr [ebp-0C]
 0056385D    add         ebx,10
 00563860    sar         ebx,5
 00563863    and         ebx,3FF
 00563869    add         eax,20
 0056386C    mov         bl,byte ptr [esi+ebx]
 0056386F    mov         byte ptr [ebp-0D],bl
 00563872    mov         bl,byte ptr [ebp-0D]
 00563875    mov         byte ptr [ecx],bl
 00563877    mov         bl,byte ptr [ebp-0D]
 0056387A    mov         byte ptr [ecx+1],bl
>0056387D    jmp         005638F3
 0056387F    mov         ebx,dword ptr [eax]
 00563881    shl         ebx,0F
 00563884    mov         dword ptr [ebp-4],ebx
 00563887    imul        ebx,dword ptr [eax+14],1B37
 0056388E    imul        esi,dword ptr [eax+1C],0FFFFE8EE
 00563895    add         esi,ebx
 00563897    imul        ebx,dword ptr [eax+0C],0FFFFD746
 0056389E    add         esi,ebx
 005638A0    mov         ebx,dword ptr [eax+4]
 005638A3    mov         edi,ebx
 005638A5    shl         ebx,3
 005638A8    sub         ebx,edi
 005638AA    lea         ebx,[edi+ebx*4]
 005638AD    shl         ebx,8
 005638B0    sub         ebx,edi
 005638B2    mov         edi,dword ptr [ebp-0C]
 005638B5    shl         ebx,2
 005638B8    add         esi,ebx
 005638BA    mov         ebx,dword ptr [ebp-4]
 005638BD    add         ebx,esi
 005638BF    add         ebx,80000
 005638C5    sar         ebx,14
 005638C8    and         ebx,3FF
 005638CE    mov         bl,byte ptr [edi+ebx]
 005638D1    mov         byte ptr [ecx],bl
 005638D3    mov         ebx,dword ptr [ebp-4]
 005638D6    sub         ebx,esi
 005638D8    mov         esi,dword ptr [ebp-0C]
 005638DB    add         ebx,80000
 005638E1    sar         ebx,14
 005638E4    and         ebx,3FF
 005638EA    add         eax,20
 005638ED    mov         bl,byte ptr [esi+ebx]
 005638F0    mov         byte ptr [ecx+1],bl
 005638F3    inc         edx
 005638F4    add         dword ptr [ebp-14],4
 005638F8    cmp         edx,2
>005638FB    jl          00563838
 00563901    pop         edi
 00563902    pop         esi
 00563903    pop         ebx
 00563904    mov         esp,ebp
 00563906    pop         ebp
 00563907    ret         8
*}
end;

//0056390C
procedure @jpeg_idct_1x1;
begin
{*
 0056390C    push        ebp
 0056390D    mov         ebp,esp
 0056390F    push        esi
 00563910    mov         esi,dword ptr [eax+144]
 00563916    mov         eax,dword ptr [edx+50]
 00563919    movsx       edx,word ptr [ecx]
 0056391C    imul        edx,dword ptr [eax]
 0056391F    mov         eax,edx
 00563921    add         esi,80
 00563927    add         eax,4
 0056392A    mov         ecx,dword ptr [ebp+0C]
 0056392D    sar         eax,3
 00563930    and         eax,3FF
 00563935    mov         dl,byte ptr [esi+eax]
 00563938    mov         eax,dword ptr [ecx]
 0056393A    mov         ecx,dword ptr [ebp+8]
 0056393D    mov         byte ptr [eax+ecx],dl
 00563940    pop         esi
 00563941    pop         ebp
 00563942    ret         8
*}
end;

//00563948
procedure _DF_.;
begin
{*
 00563948    push        ebx
 00563949    mov         ebx,eax
 0056394B    mov         eax,dword ptr [ebx]
 0056394D    mov         dword ptr [eax+14],66
 00563954    mov         edx,1
 00563959    mov         eax,ebx
 0056395B    mov         ecx,dword ptr [eax]
 0056395D    call        dword ptr [ecx+4]
 00563960    mov         edx,dword ptr [ebx+1B8]
 00563966    cmp         dword ptr [edx+0C],0
>0056396A    je          0056397B
 0056396C    mov         eax,dword ptr [ebx]
 0056396E    mov         dword ptr [eax+14],3D
 00563975    mov         eax,ebx
 00563977    mov         edx,dword ptr [eax]
 00563979    call        dword ptr [edx]
 0056397B    xor         edx,edx
 0056397D    lea         eax,[ebx+0E4]
 00563983    mov         byte ptr [eax],0
 00563986    mov         byte ptr [eax+10],1
 0056398A    mov         byte ptr [eax+20],5
 0056398E    inc         edx
 0056398F    inc         eax
 00563990    cmp         edx,10
>00563993    jl          00563983
 00563995    xor         ecx,ecx
 00563997    xor         eax,eax
 00563999    mov         dword ptr [ebx+114],ecx
 0056399F    mov         dword ptr [ebx+28],eax
 005639A2    xor         edx,edx
 005639A4    xor         ecx,ecx
 005639A6    mov         dword ptr [ebx+12C],edx
 005639AC    mov         dword ptr [ebx+118],ecx
 005639B2    mov         byte ptr [ebx+11C],1
 005639B9    mov         byte ptr [ebx+11D],1
 005639C0    mov         byte ptr [ebx+11E],0
 005639C7    mov         word ptr [ebx+120],1
 005639D0    mov         word ptr [ebx+122],1
 005639D9    xor         eax,eax
 005639DB    mov         dword ptr [ebx+124],eax
 005639E1    mov         eax,1
 005639E6    mov         byte ptr [ebx+128],0
 005639ED    mov         edx,dword ptr [ebx+1B8]
 005639F3    mov         dword ptr [edx+0C],1
 005639FA    pop         ebx
 005639FB    ret
*}
end;

//00564FC0
{*function sub_00564FC0(?:?):?;
begin
 00564FC0    push        ebx
 00564FC1    push        esi
 00564FC2    push        edi
 00564FC3    push        ebp
 00564FC4    push        ecx
 00564FC5    mov         dword ptr [esp],eax
 00564FC8    mov         eax,dword ptr [esp]
 00564FCB    mov         edi,dword ptr [eax+18]
 00564FCE    mov         ebx,dword ptr [edi]
 00564FD0    mov         esi,dword ptr [edi+4]
 00564FD3    test        esi,esi
>00564FD5    jne         00564FED
 00564FD7    mov         eax,dword ptr [esp]
 00564FDA    call        dword ptr [edi+0C]
 00564FDD    test        eax,eax
>00564FDF    jne         00564FE8
 00564FE1    xor         eax,eax
>00564FE3    jmp         005650CD
 00564FE8    mov         ebx,dword ptr [edi]
 00564FEA    mov         esi,dword ptr [edi+4]
 00564FED    movzx       ebp,byte ptr [ebx]
 00564FF0    inc         ebx
 00564FF1    dec         esi
 00564FF2    cmp         ebp,0FF
>00564FF8    je          00565032
 00564FFA    mov         eax,dword ptr [esp]
 00564FFD    mov         edx,dword ptr [eax+1B8]
 00565003    inc         dword ptr [edx+18]
 00565006    mov         dword ptr [edi],ebx
 00565008    mov         dword ptr [edi+4],esi
 0056500B    test        esi,esi
>0056500D    jne         00565025
 0056500F    mov         eax,dword ptr [esp]
 00565012    call        dword ptr [edi+0C]
 00565015    test        eax,eax
>00565017    jne         00565020
 00565019    xor         eax,eax
>0056501B    jmp         005650CD
 00565020    mov         ebx,dword ptr [edi]
 00565022    mov         esi,dword ptr [edi+4]
 00565025    movzx       ebp,byte ptr [ebx]
 00565028    inc         ebx
 00565029    dec         esi
 0056502A    cmp         ebp,0FF
>00565030    jne         00564FFA
 00565032    test        esi,esi
>00565034    jne         0056504C
 00565036    mov         eax,dword ptr [esp]
 00565039    call        dword ptr [edi+0C]
 0056503C    test        eax,eax
>0056503E    jne         00565047
 00565040    xor         eax,eax
>00565042    jmp         005650CD
 00565047    mov         ebx,dword ptr [edi]
 00565049    mov         esi,dword ptr [edi+4]
 0056504C    movzx       ebp,byte ptr [ebx]
 0056504F    inc         ebx
 00565050    dec         esi
 00565051    cmp         ebp,0FF
>00565057    je          00565032
 00565059    test        ebp,ebp
>0056505B    jne         00565074
 0056505D    mov         eax,dword ptr [esp]
 00565060    mov         edx,dword ptr [eax+1B8]
 00565066    add         dword ptr [edx+18],2
 0056506A    mov         dword ptr [edi],ebx
 0056506C    mov         dword ptr [edi+4],esi
>0056506F    jmp         00564FD3
 00565074    mov         ecx,dword ptr [esp]
 00565077    mov         eax,dword ptr [ecx+1B8]
 0056507D    cmp         dword ptr [eax+18],0
>00565081    je          005650BA
 00565083    mov         edx,dword ptr [esp]
 00565086    mov         eax,dword ptr [edx]
 00565088    mov         dword ptr [eax+14],74
 0056508F    mov         edx,dword ptr [esp]
 00565092    mov         ecx,dword ptr [edx+1B8]
 00565098    mov         edx,dword ptr [ecx+18]
 0056509B    mov         dword ptr [eax+18],edx
 0056509E    mov         dword ptr [eax+1C],ebp
 005650A1    or          edx,0FFFFFFFF
 005650A4    mov         eax,dword ptr [esp]
 005650A7    mov         ecx,dword ptr [eax]
 005650A9    call        dword ptr [ecx+4]
 005650AC    mov         eax,dword ptr [esp]
 005650AF    mov         edx,dword ptr [eax+1B8]
 005650B5    xor         ecx,ecx
 005650B7    mov         dword ptr [edx+18],ecx
 005650BA    mov         eax,dword ptr [esp]
 005650BD    mov         dword ptr [eax+1A0],ebp
 005650C3    mov         dword ptr [edi],ebx
 005650C5    mov         dword ptr [edi+4],esi
 005650C8    mov         eax,1
 005650CD    pop         edx
 005650CE    pop         ebp
 005650CF    pop         edi
 005650D0    pop         esi
 005650D1    pop         ebx
 005650D2    ret
end;*}

//00565510
procedure @jpeg_resync_to_restart;
begin
{*
 00565510    push        ebx
 00565511    push        esi
 00565512    mov         esi,eax
 00565514    push        edi
 00565515    push        ebp
 00565516    mov         ebp,edx
 00565518    mov         eax,dword ptr [esi]
 0056551A    mov         ebx,dword ptr [esi+1A0]
 00565520    or          edx,0FFFFFFFF
 00565523    mov         dword ptr [eax+14],79
 0056552A    mov         dword ptr [eax+18],ebx
 0056552D    mov         dword ptr [eax+1C],ebp
 00565530    mov         eax,esi
 00565532    mov         ecx,dword ptr [eax]
 00565534    call        dword ptr [ecx+4]
 00565537    cmp         ebx,0C0
>0056553D    jge         00565546
 0056553F    mov         edi,2
>00565544    jmp         005655AE
 00565546    cmp         ebx,0D0
>0056554C    jl          00565556
 0056554E    cmp         ebx,0D7
>00565554    jle         0056555D
 00565556    mov         edi,3
>0056555B    jmp         005655AE
 0056555D    lea         eax,[ebp+1]
 00565560    and         eax,7
 00565563    add         eax,0D0
 00565568    cmp         ebx,eax
>0056556A    je          0056557C
 0056556C    lea         edx,[ebp+2]
 0056556F    and         edx,7
 00565572    add         edx,0D0
 00565578    cmp         ebx,edx
>0056557A    jne         00565583
 0056557C    mov         edi,3
>00565581    jmp         005655AE
 00565583    lea         eax,[ebp-1]
 00565586    and         eax,7
 00565589    add         eax,0D0
 0056558E    cmp         ebx,eax
>00565590    je          005655A2
 00565592    lea         edx,[ebp-2]
 00565595    and         edx,7
 00565598    add         edx,0D0
 0056559E    cmp         ebx,edx
>005655A0    jne         005655A9
 005655A2    mov         edi,2
>005655A7    jmp         005655AE
 005655A9    mov         edi,1
 005655AE    mov         eax,dword ptr [esi]
 005655B0    mov         dword ptr [eax+14],61
 005655B7    mov         dword ptr [eax+18],ebx
 005655BA    mov         dword ptr [eax+1C],edi
 005655BD    mov         edx,4
 005655C2    mov         eax,esi
 005655C4    mov         ecx,dword ptr [eax]
 005655C6    call        dword ptr [ecx+4]
 005655C9    dec         edi
>005655CA    je          005655D7
 005655CC    dec         edi
>005655CD    je          005655E6
 005655CF    dec         edi
>005655D0    je          00565600
>005655D2    jmp         00565537
 005655D7    xor         edx,edx
 005655D9    mov         eax,1
 005655DE    mov         dword ptr [esi+1A0],edx
>005655E4    jmp         00565605
 005655E6    mov         eax,esi
 005655E8    call        00564FC0
 005655ED    test        eax,eax
>005655EF    jne         005655F5
 005655F1    xor         eax,eax
>005655F3    jmp         00565605
 005655F5    mov         ebx,dword ptr [esi+1A0]
>005655FB    jmp         00565537
 00565600    mov         eax,1
 00565605    pop         ebp
 00565606    pop         edi
 00565607    pop         esi
 00565608    pop         ebx
 00565609    ret
*}
end;

//0056560C
{*procedure sub_0056560C(?:?);
begin
 0056560C    mov         edx,dword ptr [eax+1B8]
 00565612    xor         ecx,ecx
 00565614    mov         dword ptr [eax+0D8],ecx
 0056561A    xor         ecx,ecx
 0056561C    mov         dword ptr [eax+90],ecx
 00565622    xor         ecx,ecx
 00565624    mov         dword ptr [eax+1A0],ecx
 0056562A    xor         eax,eax
 0056562C    mov         dword ptr [edx+0C],eax
 0056562F    xor         eax,eax
 00565631    mov         dword ptr [edx+10],eax
 00565634    xor         ecx,ecx
 00565636    mov         dword ptr [edx+18],ecx
 00565639    xor         eax,eax
 0056563B    mov         dword ptr [edx+0A4],eax
 00565641    ret
end;*}

//00565644
procedure @jinit_marker_reader;
begin
{*
 00565644    push        ebx
 00565645    push        ecx
 00565646    mov         dword ptr [esp],eax
 00565649    mov         ecx,0AC
 0056564E    xor         edx,edx
 00565650    mov         eax,dword ptr [esp]
 00565653    mov         ebx,dword ptr [eax+4]
 00565656    call        dword ptr [ebx]
 00565658    mov         edx,eax
 0056565A    mov         eax,dword ptr [esp]
 0056565D    xor         ecx,ecx
 0056565F    mov         dword ptr [eax+1B8],edx
 00565665    mov         dword ptr [edx],56560C;sub_0056560C
 0056566B    lea         eax,[edx+20]
 0056566E    mov         dword ptr [edx+4],565170
 00565675    mov         dword ptr [edx+8],565480
 0056567C    mov         dword ptr [edx+1C],564F24
 00565683    mov         dword ptr [edx+60],ecx
 00565686    xor         ecx,ecx
 00565688    mov         dword ptr [eax],564F24
 0056568E    xor         ebx,ebx
 00565690    mov         dword ptr [eax+44],ebx
 00565693    inc         ecx
 00565694    add         eax,4
 00565697    cmp         ecx,10
>0056569A    jl          00565688
 0056569C    mov         dword ptr [edx+20],564ABC
 005656A3    mov         dword ptr [edx+58],564ABC
 005656AA    mov         eax,dword ptr [esp]
 005656AD    call        0056560C
 005656B2    pop         edx
 005656B3    pop         ebx
 005656B4    ret
*}
end;

//005656B8
procedure jpeg_save_markers(var cinfo:jpeg_decompress_struct; marker_code:Integer; length_limit:Cardinal);
begin
{*
 005656B8    push        ebx
 005656B9    push        esi
 005656BA    mov         ebx,dword ptr [eax+1B8]
 005656C0    mov         esi,dword ptr [eax+4]
 005656C3    mov         esi,dword ptr [esi+30]
 005656C6    sub         esi,14
 005656C9    cmp         esi,ecx
>005656CB    jge         005656CF
 005656CD    mov         ecx,esi
 005656CF    test        ecx,ecx
>005656D1    je          00565700
 005656D3    mov         esi,564C28
 005656D8    cmp         edx,0E0
>005656DE    jne         005656EC
 005656E0    cmp         ecx,0E
>005656E3    jae         005656EC
 005656E5    mov         ecx,0E
>005656EA    jmp         0056571A
 005656EC    cmp         edx,0EE
>005656F2    jne         0056571A
 005656F4    cmp         ecx,0C
>005656F7    jae         0056571A
 005656F9    mov         ecx,0C
>005656FE    jmp         0056571A
 00565700    mov         esi,564F24
 00565705    cmp         edx,0E0
>0056570B    je          00565715
 0056570D    cmp         edx,0EE
>00565713    jne         0056571A
 00565715    mov         esi,564ABC
 0056571A    cmp         edx,0FE
>00565720    jne         0056572B
 00565722    mov         dword ptr [ebx+1C],esi
 00565725    mov         dword ptr [ebx+60],ecx
 00565728    pop         esi
 00565729    pop         ebx
 0056572A    ret
 0056572B    cmp         edx,0E0
>00565731    jl          0056574C
 00565733    cmp         edx,0EF
>00565739    jg          0056574C
 0056573B    mov         dword ptr [ebx+edx*4-360],esi
 00565742    mov         dword ptr [ebx+edx*4-31C],ecx
 00565749    pop         esi
 0056574A    pop         ebx
 0056574B    ret
 0056574C    mov         ecx,dword ptr [eax]
 0056574E    mov         dword ptr [ecx+14],44
 00565755    mov         dword ptr [ecx+18],edx
 00565758    mov         edx,dword ptr [eax]
 0056575A    call        dword ptr [edx]
 0056575C    pop         esi
 0056575D    pop         ebx
 0056575E    ret
*}
end;

//005657A0
procedure @jdiv_round_up;
begin
{*
 005657A0    push        ebx
 005657A1    mov         ecx,edx
 005657A3    mov         ebx,eax
 005657A5    lea         eax,[ecx+ebx-1]
 005657A9    cdq
 005657AA    idiv        eax,ecx
 005657AC    pop         ebx
 005657AD    ret
*}
end;

//005657B0
procedure @jround_up;
begin
{*
 005657B0    push        ebx
 005657B1    mov         ebx,edx
 005657B3    mov         ecx,eax
 005657B5    lea         eax,[ebx-1]
 005657B8    add         ecx,eax
 005657BA    mov         eax,ecx
 005657BC    cdq
 005657BD    idiv        eax,ebx
 005657BF    mov         eax,ecx
 005657C1    sub         eax,edx
 005657C3    pop         ebx
 005657C4    ret
*}
end;

//005657C8
procedure @jcopy_sample_rows;
begin
{*
 005657C8    push        ebp
 005657C9    mov         ebp,esp
 005657CB    push        ecx
 005657CC    push        ebx
 005657CD    push        esi
 005657CE    push        edi
 005657CF    mov         ebx,eax
 005657D1    mov         eax,dword ptr [ebp+8]
 005657D4    shl         edx,2
 005657D7    mov         dword ptr [ebp-4],eax
 005657DA    add         ebx,edx
 005657DC    mov         edx,dword ptr [ebp+10]
 005657DF    shl         edx,2
 005657E2    mov         esi,ecx
 005657E4    add         esi,edx
 005657E6    mov         edi,dword ptr [ebp+0C]
 005657E9    test        edi,edi
>005657EB    jle         0056580A
 005657ED    mov         eax,dword ptr [ebx]
 005657EF    add         ebx,4
 005657F2    mov         edx,dword ptr [esi]
 005657F4    add         esi,4
 005657F7    mov         ecx,dword ptr [ebp-4]
 005657FA    push        ecx
 005657FB    push        eax
 005657FC    push        edx
 005657FD    call        _memcpy
 00565802    add         esp,0C
 00565805    dec         edi
 00565806    test        edi,edi
>00565808    jg          005657ED
 0056580A    pop         edi
 0056580B    pop         esi
 0056580C    pop         ebx
 0056580D    pop         ecx
 0056580E    pop         ebp
 0056580F    ret         0C
*}
end;

//00565814
procedure @jcopy_block_row;
begin
{*
 00565814    shl         ecx,7
 00565817    push        ecx
 00565818    push        eax
 00565819    push        edx
 0056581A    call        _memcpy
 0056581F    add         esp,0C
 00565822    ret
*}
end;

//00565824
procedure @jzero_far;
begin
{*
 00565824    push        edx
 00565825    push        0
 00565827    push        eax
 00565828    call        _memset
 0056582D    add         esp,0C
 00565830    ret
*}
end;

//00565834
procedure @jpeg_abort;
begin
{*
 00565834    push        ebx
 00565835    push        esi
 00565836    mov         esi,eax
 00565838    cmp         dword ptr [esi+4],0
>0056583C    je          00565871
 0056583E    mov         ebx,1
 00565843    mov         edx,ebx
 00565845    mov         eax,esi
 00565847    mov         ecx,dword ptr [eax+4]
 0056584A    call        dword ptr [ecx+24]
 0056584D    dec         ebx
 0056584E    test        ebx,ebx
>00565850    jg          00565843
 00565852    cmp         dword ptr [esi+10],0
>00565856    je          0056586A
 00565858    mov         dword ptr [esi+14],0C8
 0056585F    xor         eax,eax
 00565861    mov         dword ptr [esi+130],eax
 00565867    pop         esi
 00565868    pop         ebx
 00565869    ret
 0056586A    mov         dword ptr [esi+14],64
 00565871    pop         esi
 00565872    pop         ebx
 00565873    ret
*}
end;

//00565874
procedure jpeg_destroy(var cinfo:jpeg_common_struct);
begin
{*
 00565874    push        ebx
 00565875    mov         ebx,eax
 00565877    cmp         dword ptr [ebx+4],0
>0056587B    je          00565885
 0056587D    mov         eax,ebx
 0056587F    mov         edx,dword ptr [eax+4]
 00565882    call        dword ptr [edx+28]
 00565885    xor         ecx,ecx
 00565887    xor         eax,eax
 00565889    mov         dword ptr [ebx+4],ecx
 0056588C    mov         dword ptr [ebx+14],eax
 0056588F    pop         ebx
 00565890    ret
*}
end;

//00565894
procedure @jpeg_alloc_quant_table;
begin
{*
 00565894    push        ebx
 00565895    mov         ecx,84
 0056589A    xor         edx,edx
 0056589C    mov         ebx,dword ptr [eax+4]
 0056589F    call        dword ptr [ebx]
 005658A1    xor         edx,edx
 005658A3    mov         dword ptr [eax+80],edx
 005658A9    pop         ebx
 005658AA    ret
*}
end;

//005658AC
procedure @jpeg_alloc_huff_table;
begin
{*
 005658AC    push        ebx
 005658AD    mov         ecx,118
 005658B2    xor         edx,edx
 005658B4    mov         ebx,dword ptr [eax+4]
 005658B7    call        dword ptr [ebx]
 005658B9    xor         edx,edx
 005658BB    mov         dword ptr [eax+114],edx
 005658C1    pop         ebx
 005658C2    ret
*}
end;

//005658C4
procedure _DF_.;
begin
{*
 005658C4    push        ebx
 005658C5    push        esi
 005658C6    mov         esi,eax
 005658C8    push        edi
 005658C9    mov         eax,esi
 005658CB    mov         ecx,1000
 005658D0    mov         ebx,dword ptr [esi+18]
 005658D3    mov         edx,1
 005658D8    mov         esi,dword ptr [eax+4]
 005658DB    call        dword ptr [esi]
 005658DD    mov         edi,eax
 005658DF    mov         dword ptr [ebx+18],edi
 005658E2    mov         dword ptr [ebx],edi
 005658E4    mov         dword ptr [ebx+4],1000
 005658EB    pop         edi
 005658EC    pop         esi
 005658ED    pop         ebx
 005658EE    ret
*}
end;

//00565994
procedure jpeg_stdio_dest(var cinfo:jpeg_compress_struct; output_file:TStream);
begin
{*
 00565994    push        ebx
 00565995    mov         ebx,eax
 00565997    push        esi
 00565998    push        edi
 00565999    cmp         dword ptr [ebx+18],0
 0056599D    mov         esi,edx
>0056599F    jne         005659B2
 005659A1    mov         eax,ebx
 005659A3    mov         ecx,1C
 005659A8    xor         edx,edx
 005659AA    mov         edi,dword ptr [eax+4]
 005659AD    call        dword ptr [edi]
 005659AF    mov         dword ptr [ebx+18],eax
 005659B2    mov         eax,dword ptr [ebx+18]
 005659B5    mov         dword ptr [eax+8],5658C4;_DF_.
 005659BC    mov         dword ptr [eax+0C],5658F0
 005659C3    mov         dword ptr [eax+10],565938
 005659CA    mov         dword ptr [eax+14],esi
 005659CD    pop         edi
 005659CE    pop         esi
 005659CF    pop         ebx
 005659D0    ret
*}
end;

//005659D4
procedure _DF_.;
begin
{*
 005659D4    push        ebp
 005659D5    mov         ebp,esp
 005659D7    push        ecx
 005659D8    push        ebx
 005659D9    mov         ebx,eax
 005659DB    push        esi
 005659DC    push        edi
 005659DD    mov         dword ptr [ebp-4],ecx
 005659E0    cmp         dword ptr [ebx+14],64
 005659E4    mov         esi,edx
>005659E6    je          005659FD
 005659E8    mov         eax,dword ptr [ebx]
 005659EA    mov         dword ptr [eax+14],14
 005659F1    mov         edx,dword ptr [ebx+14]
 005659F4    mov         dword ptr [eax+18],edx
 005659F7    mov         eax,ebx
 005659F9    mov         edx,dword ptr [eax]
 005659FB    call        dword ptr [edx]
 005659FD    test        esi,esi
>005659FF    jl          00565A06
 00565A01    cmp         esi,4
>00565A04    jl          00565A18
 00565A06    mov         eax,dword ptr [ebx]
 00565A08    mov         dword ptr [eax+14],1F
 00565A0F    mov         dword ptr [eax+18],esi
 00565A12    mov         eax,ebx
 00565A14    mov         edx,dword ptr [eax]
 00565A16    call        dword ptr [edx]
 00565A18    lea         ecx,[ebx+esi*4+44]
 00565A1C    mov         esi,ecx
 00565A1E    cmp         dword ptr [esi],0
>00565A21    jne         00565A2C
 00565A23    mov         eax,ebx
 00565A25    call        @jpeg_alloc_quant_table
 00565A2A    mov         dword ptr [esi],eax
 00565A2C    xor         ecx,ecx
 00565A2E    mov         edx,dword ptr [ebp-4]
 00565A31    mov         ebx,edx
 00565A33    mov         eax,dword ptr [ebx]
 00565A35    imul        dword ptr [ebp+0C]
 00565A38    add         eax,32
 00565A3B    mov         edi,64
 00565A40    cdq
 00565A41    idiv        eax,edi
 00565A43    test        eax,eax
>00565A45    jg          00565A4C
 00565A47    mov         eax,1
 00565A4C    cmp         eax,7FFF
>00565A51    jle         00565A58
 00565A53    mov         eax,7FFF
 00565A58    cmp         dword ptr [ebp+8],0
>00565A5C    je          00565A6A
 00565A5E    cmp         eax,0FF
>00565A63    jle         00565A6A
 00565A65    mov         eax,0FF
 00565A6A    mov         edx,dword ptr [esi]
 00565A6C    add         ebx,4
 00565A6F    mov         word ptr [edx+ecx*2],ax
 00565A73    inc         ecx
 00565A74    cmp         ecx,40
>00565A77    jl          00565A33
 00565A79    mov         ecx,dword ptr [esi]
 00565A7B    xor         eax,eax
 00565A7D    mov         dword ptr [ecx+80],eax
 00565A83    pop         edi
 00565A84    pop         esi
 00565A85    pop         ebx
 00565A86    pop         ecx
 00565A87    pop         ebp
 00565A88    ret         8
*}
end;

//00565A8C
{*procedure sub_00565A8C(?:?; ?:?; ?:?);
begin
 00565A8C    push        ebx
 00565A8D    push        esi
 00565A8E    push        edi
 00565A8F    mov         edi,ecx
 00565A91    mov         esi,edx
 00565A93    mov         ebx,eax
 00565A95    push        esi
 00565A96    push        edi
 00565A97    mov         ecx,78941C
 00565A9C    xor         edx,edx
 00565A9E    mov         eax,ebx
 00565AA0    call        _DF_.
 00565AA5    push        esi
 00565AA6    push        edi
 00565AA7    mov         ecx,78951C
 00565AAC    mov         edx,1
 00565AB1    mov         eax,ebx
 00565AB3    call        _DF_.
 00565AB8    pop         edi
 00565AB9    pop         esi
 00565ABA    pop         ebx
 00565ABB    ret
end;*}

//00565ABC
{*function sub_00565ABC(?:?):?;
begin
 00565ABC    mov         ecx,eax
 00565ABE    test        ecx,ecx
>00565AC0    jg          00565AC7
 00565AC2    mov         ecx,1
 00565AC7    cmp         ecx,64
>00565ACA    jle         00565AD1
 00565ACC    mov         ecx,64
 00565AD1    cmp         ecx,32
>00565AD4    jge         00565AE2
 00565AD6    mov         eax,1388
 00565ADB    cdq
 00565ADC    idiv        eax,ecx
 00565ADE    mov         ecx,eax
>00565AE0    jmp         00565AED
 00565AE2    add         ecx,ecx
 00565AE4    mov         eax,0C8
 00565AE9    sub         eax,ecx
 00565AEB    mov         ecx,eax
 00565AED    mov         eax,ecx
 00565AEF    ret
end;*}

//00565AF0
procedure jpeg_set_quality(var cinfo:jpeg_compress_struct; Quality:Integer; Baseline:LongBool);
begin
{*
 00565AF0    push        ebx
 00565AF1    push        esi
 00565AF2    mov         esi,ecx
 00565AF4    mov         ebx,eax
 00565AF6    mov         eax,edx
 00565AF8    call        00565ABC
 00565AFD    mov         edx,eax
 00565AFF    mov         ecx,esi
 00565B01    mov         eax,ebx
 00565B03    call        00565A8C
 00565B08    pop         esi
 00565B09    pop         ebx
 00565B0A    ret
*}
end;

//00565B0C
{*procedure sub_00565B0C(?:?; ?:?; ?:?; ?:?);
begin
 00565B0C    push        ebp
 00565B0D    mov         ebp,esp
 00565B0F    push        ecx
 00565B10    push        ebx
 00565B11    push        esi
 00565B12    push        edi
 00565B13    mov         edi,ecx
 00565B15    mov         esi,edx
 00565B17    mov         dword ptr [ebp-4],eax
 00565B1A    cmp         dword ptr [esi],0
>00565B1D    jne         00565B29
 00565B1F    mov         eax,dword ptr [ebp-4]
 00565B22    call        @jpeg_alloc_huff_table
 00565B27    mov         dword ptr [esi],eax
 00565B29    push        11
 00565B2B    push        edi
 00565B2C    mov         edx,dword ptr [esi]
 00565B2E    push        edx
 00565B2F    call        _memcpy
 00565B34    add         esp,0C
 00565B37    xor         ebx,ebx
 00565B39    mov         edx,1
 00565B3E    lea         eax,[edi+1]
 00565B41    xor         ecx,ecx
 00565B43    inc         edx
 00565B44    mov         cl,byte ptr [eax]
 00565B46    inc         eax
 00565B47    add         ebx,ecx
 00565B49    cmp         edx,10
>00565B4C    jle         00565B41
 00565B4E    cmp         ebx,1
>00565B51    jl          00565B5B
 00565B53    cmp         ebx,100
>00565B59    jle         00565B6E
 00565B5B    mov         eax,dword ptr [ebp-4]
 00565B5E    mov         edx,dword ptr [eax]
 00565B60    mov         dword ptr [edx+14],8
 00565B67    mov         eax,dword ptr [ebp-4]
 00565B6A    mov         edx,dword ptr [eax]
 00565B6C    call        dword ptr [edx]
 00565B6E    push        ebx
 00565B6F    mov         ecx,dword ptr [ebp+8]
 00565B72    push        ecx
 00565B73    mov         eax,dword ptr [esi]
 00565B75    add         eax,11
 00565B78    push        eax
 00565B79    call        _memcpy
 00565B7E    add         esp,0C
 00565B81    mov         edx,dword ptr [esi]
 00565B83    xor         ecx,ecx
 00565B85    mov         dword ptr [edx+114],ecx
 00565B8B    pop         edi
 00565B8C    pop         esi
 00565B8D    pop         ebx
 00565B8E    pop         ecx
 00565B8F    pop         ebp
 00565B90    ret         4
end;*}

//00565B94
{*procedure sub_00565B94(?:?);
begin
 00565B94    push        ebx
 00565B95    mov         ebx,eax
 00565B97    push        78962D
 00565B9C    mov         ecx,78961C
 00565BA1    lea         edx,[ebx+54]
 00565BA4    mov         eax,ebx
 00565BA6    call        00565B0C
 00565BAB    push        789667
 00565BB0    mov         ecx,789656
 00565BB5    lea         edx,[ebx+64]
 00565BB8    mov         eax,ebx
 00565BBA    call        00565B0C
 00565BBF    push        78964A
 00565BC4    mov         ecx,789639
 00565BC9    lea         edx,[ebx+58]
 00565BCC    mov         eax,ebx
 00565BCE    call        00565B0C
 00565BD3    push        78971A
 00565BD8    mov         ecx,789709
 00565BDD    lea         edx,[ebx+68]
 00565BE0    mov         eax,ebx
 00565BE2    call        00565B0C
 00565BE7    pop         ebx
 00565BE8    ret
end;*}

//00565BEC
procedure jpeg_set_defaults(var cinfo:jpeg_compress_struct);
begin
{*
 00565BEC    push        ebx
 00565BED    mov         ebx,eax
 00565BEF    push        esi
 00565BF0    cmp         dword ptr [ebx+14],64
>00565BF4    je          00565C0B
 00565BF6    mov         eax,dword ptr [ebx]
 00565BF8    mov         dword ptr [eax+14],14
 00565BFF    mov         edx,dword ptr [ebx+14]
 00565C02    mov         dword ptr [eax+18],edx
 00565C05    mov         eax,ebx
 00565C07    mov         edx,dword ptr [eax]
 00565C09    call        dword ptr [edx]
 00565C0B    cmp         dword ptr [ebx+40],0
>00565C0F    jne         00565C22
 00565C11    mov         eax,ebx
 00565C13    mov         ecx,348
 00565C18    xor         edx,edx
 00565C1A    mov         esi,dword ptr [eax+4]
 00565C1D    call        dword ptr [esi]
 00565C1F    mov         dword ptr [ebx+40],eax
 00565C22    mov         dword ptr [ebx+34],8
 00565C29    mov         ecx,1
 00565C2E    mov         edx,4B
 00565C33    mov         eax,ebx
 00565C35    call        jpeg_set_quality
 00565C3A    mov         eax,ebx
 00565C3C    call        00565B94
 00565C41    xor         edx,edx
 00565C43    lea         eax,[ebx+74]
 00565C46    mov         byte ptr [eax],0
 00565C49    mov         byte ptr [eax+10],1
 00565C4D    mov         byte ptr [eax+20],5
 00565C51    inc         edx
 00565C52    inc         eax
 00565C53    cmp         edx,10
>00565C56    jl          00565C46
 00565C58    xor         edx,edx
 00565C5A    xor         ecx,ecx
 00565C5C    mov         dword ptr [ebx+0A8],edx
 00565C62    mov         dword ptr [ebx+0A4],ecx
 00565C68    xor         eax,eax
 00565C6A    xor         edx,edx
 00565C6C    mov         dword ptr [ebx+0AC],eax
 00565C72    xor         ecx,ecx
 00565C74    mov         dword ptr [ebx+0B0],edx
 00565C7A    mov         dword ptr [ebx+0B4],ecx
 00565C80    cmp         dword ptr [ebx+34],8
>00565C84    jle         00565C90
 00565C86    mov         dword ptr [ebx+0B4],1
 00565C90    xor         eax,eax
 00565C92    xor         edx,edx
 00565C94    mov         dword ptr [ebx+0B8],eax
 00565C9A    mov         dword ptr [ebx+0BC],edx
 00565CA0    mov         dword ptr [ebx+0C0],2
 00565CAA    xor         ecx,ecx
 00565CAC    xor         eax,eax
 00565CAE    mov         dword ptr [ebx+0C4],ecx
 00565CB4    mov         dword ptr [ebx+0C8],eax
 00565CBA    mov         byte ptr [ebx+0D0],1
 00565CC1    mov         byte ptr [ebx+0D1],1
 00565CC8    mov         byte ptr [ebx+0D2],0
 00565CCF    mov         word ptr [ebx+0D4],1
 00565CD8    mov         word ptr [ebx+0D6],1
 00565CE1    mov         eax,ebx
 00565CE3    call        00565CEC
 00565CE8    pop         esi
 00565CE9    pop         ebx
 00565CEA    ret
*}
end;

//00565CEC
{*procedure sub_00565CEC(?:?);
begin
 00565CEC    mov         edx,dword ptr [eax+28]
 00565CEF    cmp         edx,5
>00565CF2    ja          00565D52
 00565CF4    jmp         dword ptr [edx*4+565CFB]
 00565CF4    dd          00565D4A
 00565CF4    dd          00565D13
 00565CF4    dd          00565D1E
 00565CF4    dd          00565D29
 00565CF4    dd          00565D34
 00565CF4    dd          00565D3F
 00565D13    mov         edx,1
 00565D18    call        jpeg_set_colorspace
 00565D1D    ret
 00565D1E    mov         edx,3
 00565D23    call        jpeg_set_colorspace
 00565D28    ret
 00565D29    mov         edx,3
 00565D2E    call        jpeg_set_colorspace
 00565D33    ret
 00565D34    mov         edx,4
 00565D39    call        jpeg_set_colorspace
 00565D3E    ret
 00565D3F    mov         edx,5
 00565D44    call        jpeg_set_colorspace
 00565D49    ret
 00565D4A    xor         edx,edx
 00565D4C    call        jpeg_set_colorspace
 00565D51    ret
 00565D52    mov         ecx,dword ptr [eax]
 00565D54    mov         dword ptr [ecx+14],9
 00565D5B    mov         edx,dword ptr [eax]
 00565D5D    call        dword ptr [edx]
 00565D5F    ret
end;*}

//00565D60
procedure jpeg_set_colorspace(var cinfo:jpeg_compress_struct; colorspace:J_COLOR_SPACE);
begin
{*
 00565D60    push        ebx
 00565D61    mov         ebx,eax
 00565D63    push        esi
 00565D64    mov         esi,edx
 00565D66    cmp         dword ptr [ebx+14],64
>00565D6A    je          00565D81
 00565D6C    mov         eax,dword ptr [ebx]
 00565D6E    mov         dword ptr [eax+14],14
 00565D75    mov         edx,dword ptr [ebx+14]
 00565D78    mov         dword ptr [eax+18],edx
 00565D7B    mov         eax,ebx
 00565D7D    mov         edx,dword ptr [eax]
 00565D7F    call        dword ptr [edx]
 00565D81    mov         dword ptr [ebx+3C],esi
 00565D84    xor         ecx,ecx
 00565D86    mov         dword ptr [ebx+0CC],ecx
 00565D8C    xor         eax,eax
 00565D8E    mov         dword ptr [ebx+0D8],eax
 00565D94    cmp         esi,5
>00565D97    ja          00566103
 00565D9D    jmp         dword ptr [esi*4+565DA4]
 00565D9D    dd          0056609C
 00565D9D    dd          00565DBC
 00565D9D    dd          00565DF6
 00565D9D    dd          00565E84
 00565D9D    dd          00565F1E
 00565D9D    dd          00565FD7
 00565DBC    mov         dword ptr [ebx+0CC],1
 00565DC6    mov         dword ptr [ebx+38],1
 00565DCD    mov         eax,dword ptr [ebx+40]
 00565DD0    xor         edx,edx
 00565DD2    xor         ecx,ecx
 00565DD4    mov         dword ptr [eax],1
 00565DDA    mov         dword ptr [eax+8],1
 00565DE1    mov         dword ptr [eax+0C],1
 00565DE8    mov         dword ptr [eax+10],edx
 00565DEB    xor         edx,edx
 00565DED    mov         dword ptr [eax+14],ecx
 00565DF0    mov         dword ptr [eax+18],edx
 00565DF3    pop         esi
 00565DF4    pop         ebx
 00565DF5    ret
 00565DF6    mov         dword ptr [ebx+0D8],1
 00565E00    mov         dword ptr [ebx+38],3
 00565E07    mov         eax,dword ptr [ebx+40]
 00565E0A    xor         ecx,ecx
 00565E0C    xor         edx,edx
 00565E0E    mov         dword ptr [eax],52
 00565E14    mov         dword ptr [eax+8],1
 00565E1B    mov         dword ptr [eax+0C],1
 00565E22    mov         dword ptr [eax+10],ecx
 00565E25    xor         ecx,ecx
 00565E27    mov         dword ptr [eax+14],edx
 00565E2A    mov         dword ptr [eax+18],ecx
 00565E2D    mov         eax,dword ptr [ebx+40]
 00565E30    xor         edx,edx
 00565E32    add         eax,54
 00565E35    xor         ecx,ecx
 00565E37    mov         dword ptr [eax],47
 00565E3D    mov         dword ptr [eax+8],1
 00565E44    mov         dword ptr [eax+0C],1
 00565E4B    mov         dword ptr [eax+10],edx
 00565E4E    xor         edx,edx
 00565E50    mov         dword ptr [eax+14],ecx
 00565E53    mov         dword ptr [eax+18],edx
 00565E56    mov         eax,dword ptr [ebx+40]
 00565E59    xor         ecx,ecx
 00565E5B    add         eax,0A8
 00565E60    xor         edx,edx
 00565E62    mov         dword ptr [eax],42
 00565E68    mov         dword ptr [eax+8],1
 00565E6F    mov         dword ptr [eax+0C],1
 00565E76    mov         dword ptr [eax+10],ecx
 00565E79    xor         ecx,ecx
 00565E7B    mov         dword ptr [eax+14],edx
 00565E7E    mov         dword ptr [eax+18],ecx
 00565E81    pop         esi
 00565E82    pop         ebx
 00565E83    ret
 00565E84    mov         dword ptr [ebx+0CC],1
 00565E8E    mov         dword ptr [ebx+38],3
 00565E95    mov         eax,dword ptr [ebx+40]
 00565E98    xor         edx,edx
 00565E9A    xor         ecx,ecx
 00565E9C    mov         dword ptr [eax],1
 00565EA2    mov         dword ptr [eax+8],2
 00565EA9    mov         dword ptr [eax+0C],2
 00565EB0    mov         dword ptr [eax+10],edx
 00565EB3    xor         edx,edx
 00565EB5    mov         dword ptr [eax+14],ecx
 00565EB8    mov         dword ptr [eax+18],edx
 00565EBB    mov         eax,dword ptr [ebx+40]
 00565EBE    add         eax,54
 00565EC1    mov         dword ptr [eax],2
 00565EC7    mov         dword ptr [eax+8],1
 00565ECE    mov         dword ptr [eax+0C],1
 00565ED5    mov         dword ptr [eax+10],1
 00565EDC    mov         dword ptr [eax+14],1
 00565EE3    mov         dword ptr [eax+18],1
 00565EEA    mov         eax,dword ptr [ebx+40]
 00565EED    add         eax,0A8
 00565EF2    mov         dword ptr [eax],3
 00565EF8    mov         dword ptr [eax+8],1
 00565EFF    mov         dword ptr [eax+0C],1
 00565F06    mov         dword ptr [eax+10],1
 00565F0D    mov         dword ptr [eax+14],1
 00565F14    mov         dword ptr [eax+18],1
 00565F1B    pop         esi
 00565F1C    pop         ebx
 00565F1D    ret
 00565F1E    mov         dword ptr [ebx+0D8],1
 00565F28    mov         dword ptr [ebx+38],4
 00565F2F    mov         eax,dword ptr [ebx+40]
 00565F32    xor         edx,edx
 00565F34    xor         ecx,ecx
 00565F36    mov         dword ptr [eax],43
 00565F3C    mov         dword ptr [eax+8],1
 00565F43    mov         dword ptr [eax+0C],1
 00565F4A    mov         dword ptr [eax+10],edx
 00565F4D    xor         edx,edx
 00565F4F    mov         dword ptr [eax+14],ecx
 00565F52    mov         dword ptr [eax+18],edx
 00565F55    mov         eax,dword ptr [ebx+40]
 00565F58    xor         ecx,ecx
 00565F5A    add         eax,54
 00565F5D    xor         edx,edx
 00565F5F    mov         dword ptr [eax],4D
 00565F65    mov         dword ptr [eax+8],1
 00565F6C    mov         dword ptr [eax+0C],1
 00565F73    mov         dword ptr [eax+10],ecx
 00565F76    xor         ecx,ecx
 00565F78    mov         dword ptr [eax+14],edx
 00565F7B    mov         dword ptr [eax+18],ecx
 00565F7E    mov         eax,dword ptr [ebx+40]
 00565F81    xor         edx,edx
 00565F83    add         eax,0A8
 00565F88    xor         ecx,ecx
 00565F8A    mov         dword ptr [eax],59
 00565F90    mov         dword ptr [eax+8],1
 00565F97    mov         dword ptr [eax+0C],1
 00565F9E    mov         dword ptr [eax+10],edx
 00565FA1    xor         edx,edx
 00565FA3    mov         dword ptr [eax+14],ecx
 00565FA6    mov         dword ptr [eax+18],edx
 00565FA9    mov         eax,dword ptr [ebx+40]
 00565FAC    xor         ecx,ecx
 00565FAE    add         eax,0FC
 00565FB3    xor         edx,edx
 00565FB5    mov         dword ptr [eax],4B
 00565FBB    mov         dword ptr [eax+8],1
 00565FC2    mov         dword ptr [eax+0C],1
 00565FC9    mov         dword ptr [eax+10],ecx
 00565FCC    xor         ecx,ecx
 00565FCE    mov         dword ptr [eax+14],edx
 00565FD1    mov         dword ptr [eax+18],ecx
 00565FD4    pop         esi
 00565FD5    pop         ebx
 00565FD6    ret
 00565FD7    mov         dword ptr [ebx+0D8],1
 00565FE1    mov         dword ptr [ebx+38],4
 00565FE8    mov         eax,dword ptr [ebx+40]
 00565FEB    xor         edx,edx
 00565FED    xor         ecx,ecx
 00565FEF    mov         dword ptr [eax],1
 00565FF5    mov         dword ptr [eax+8],2
 00565FFC    mov         dword ptr [eax+0C],2
 00566003    mov         dword ptr [eax+10],edx
 00566006    xor         edx,edx
 00566008    mov         dword ptr [eax+14],ecx
 0056600B    mov         dword ptr [eax+18],edx
 0056600E    mov         eax,dword ptr [ebx+40]
 00566011    xor         edx,edx
 00566013    add         eax,54
 00566016    xor         ecx,ecx
 00566018    mov         dword ptr [eax],2
 0056601E    mov         dword ptr [eax+8],1
 00566025    mov         dword ptr [eax+0C],1
 0056602C    mov         dword ptr [eax+10],1
 00566033    mov         dword ptr [eax+14],1
 0056603A    mov         dword ptr [eax+18],1
 00566041    mov         eax,dword ptr [ebx+40]
 00566044    add         eax,0A8
 00566049    mov         dword ptr [eax],3
 0056604F    mov         dword ptr [eax+8],1
 00566056    mov         dword ptr [eax+0C],1
 0056605D    mov         dword ptr [eax+10],1
 00566064    mov         dword ptr [eax+14],1
 0056606B    mov         dword ptr [eax+18],1
 00566072    mov         eax,dword ptr [ebx+40]
 00566075    add         eax,0FC
 0056607A    mov         dword ptr [eax],4
 00566080    mov         dword ptr [eax+8],2
 00566087    mov         dword ptr [eax+0C],2
 0056608E    mov         dword ptr [eax+10],edx
 00566091    xor         edx,edx
 00566093    mov         dword ptr [eax+14],ecx
 00566096    mov         dword ptr [eax+18],edx
 00566099    pop         esi
 0056609A    pop         ebx
 0056609B    ret
 0056609C    mov         eax,dword ptr [ebx+24]
 0056609F    mov         dword ptr [ebx+38],eax
 005660A2    mov         eax,dword ptr [ebx+38]
 005660A5    cmp         eax,1
>005660A8    jl          005660AF
 005660AA    cmp         eax,0A
>005660AD    jle         005660CB
 005660AF    mov         eax,dword ptr [ebx]
 005660B1    mov         dword ptr [eax+14],1A
 005660B8    mov         edx,dword ptr [ebx+38]
 005660BB    mov         dword ptr [eax+18],edx
 005660BE    mov         dword ptr [eax+1C],0A
 005660C5    mov         eax,ebx
 005660C7    mov         edx,dword ptr [eax]
 005660C9    call        dword ptr [edx]
 005660CB    xor         edx,edx
>005660CD    jmp         005660FB
 005660CF    lea         eax,[edx+edx*4]
 005660D2    xor         ecx,ecx
 005660D4    lea         eax,[edx+eax*4]
 005660D7    shl         eax,2
 005660DA    add         eax,dword ptr [ebx+40]
 005660DD    mov         dword ptr [eax],edx
 005660DF    mov         dword ptr [eax+8],1
 005660E6    mov         dword ptr [eax+0C],1
 005660ED    mov         dword ptr [eax+10],ecx
 005660F0    xor         ecx,ecx
 005660F2    mov         dword ptr [eax+14],ecx
 005660F5    xor         ecx,ecx
 005660F7    mov         dword ptr [eax+18],ecx
 005660FA    inc         edx
 005660FB    cmp         edx,dword ptr [ebx+38]
>005660FE    jl          005660CF
 00566100    pop         esi
 00566101    pop         ebx
 00566102    ret
 00566103    mov         eax,dword ptr [ebx]
 00566105    mov         dword ptr [eax+14],0A
 0056610C    mov         eax,ebx
 0056610E    mov         edx,dword ptr [eax]
 00566110    call        dword ptr [edx]
 00566112    pop         esi
 00566113    pop         ebx
 00566114    ret
*}
end;

//00566118
{*function sub_00566118(?:?; ?:?; ?:?; ?:?; ?:?; ?:?):?;
begin
 00566118    push        ebp
 00566119    mov         ebp,esp
 0056611B    mov         dword ptr [eax],1
 00566121    mov         dword ptr [eax+4],edx
 00566124    mov         dword ptr [eax+14],ecx
 00566127    mov         edx,dword ptr [ebp+10]
 0056612A    mov         dword ptr [eax+18],edx
 0056612D    mov         ecx,dword ptr [ebp+0C]
 00566130    mov         dword ptr [eax+1C],ecx
 00566133    mov         edx,dword ptr [ebp+8]
 00566136    mov         dword ptr [eax+20],edx
 00566139    add         eax,24
 0056613C    pop         ebp
 0056613D    ret         0C
end;*}

//00566140
{*function sub_00566140(?:?; ?:?; ?:?; ?:?; ?:?; ?:?):?;
begin
 00566140    push        ebp
 00566141    mov         ebp,esp
 00566143    push        ebx
 00566144    push        esi
 00566145    push        edi
 00566146    mov         esi,dword ptr [ebp+10]
 00566149    xor         ebx,ebx
 0056614B    cmp         edx,ebx
>0056614D    jle         00566172
 0056614F    mov         dword ptr [eax],1
 00566155    mov         dword ptr [eax+4],ebx
 00566158    mov         dword ptr [eax+14],ecx
 0056615B    mov         dword ptr [eax+18],esi
 0056615E    mov         edi,dword ptr [ebp+0C]
 00566161    inc         ebx
 00566162    mov         dword ptr [eax+1C],edi
 00566165    mov         edi,dword ptr [ebp+8]
 00566168    mov         dword ptr [eax+20],edi
 0056616B    add         eax,24
 0056616E    cmp         edx,ebx
>00566170    jg          0056614F
 00566172    pop         edi
 00566173    pop         esi
 00566174    pop         ebx
 00566175    pop         ebp
 00566176    ret         0C
end;*}

//0056617C
{*function sub_0056617C(?:?; ?:?; ?:?; ?:?):?;
begin
 0056617C    push        ebp
 0056617D    mov         ebp,esp
 0056617F    push        ebx
 00566180    push        esi
 00566181    cmp         edx,4
>00566184    jg          005661B1
 00566186    mov         dword ptr [eax],edx
 00566188    xor         ebx,ebx
 0056618A    lea         esi,[eax+4]
 0056618D    cmp         edx,ebx
>0056618F    jle         0056619B
 00566191    mov         dword ptr [esi],ebx
 00566193    inc         ebx
 00566194    add         esi,4
 00566197    cmp         edx,ebx
>00566199    jg          00566191
 0056619B    xor         edx,edx
 0056619D    mov         dword ptr [eax+18],edx
 005661A0    mov         dword ptr [eax+14],edx
 005661A3    mov         dword ptr [eax+1C],ecx
 005661A6    mov         ecx,dword ptr [ebp+8]
 005661A9    mov         dword ptr [eax+20],ecx
 005661AC    add         eax,24
>005661AF    jmp         005661BF
 005661B1    push        0
 005661B3    push        ecx
 005661B4    mov         ecx,dword ptr [ebp+8]
 005661B7    push        ecx
 005661B8    xor         ecx,ecx
 005661BA    call        00566140
 005661BF    pop         esi
 005661C0    pop         ebx
 005661C1    pop         ebp
 005661C2    ret         4
end;*}

//005661C8
procedure jpeg_simple_progression(var cinfo:jpeg_compress_struct);
begin
{*
 005661C8    push        ebx
 005661C9    push        esi
 005661CA    mov         esi,eax
 005661CC    push        edi
 005661CD    push        ecx
 005661CE    cmp         dword ptr [esi+14],64
 005661D2    mov         edi,dword ptr [esi+38]
>005661D5    je          005661EC
 005661D7    mov         eax,dword ptr [esi]
 005661D9    mov         dword ptr [eax+14],14
 005661E0    mov         edx,dword ptr [esi+14]
 005661E3    mov         dword ptr [eax+18],edx
 005661E6    mov         eax,esi
 005661E8    mov         edx,dword ptr [eax]
 005661EA    call        dword ptr [edx]
 005661EC    cmp         edi,3
>005661EF    jne         00566200
 005661F1    cmp         dword ptr [esi+3C],3
>005661F5    jne         00566200
 005661F7    mov         dword ptr [esp],0A
>005661FE    jmp         0056621C
 00566200    cmp         edi,4
>00566203    jle         00566211
 00566205    mov         ecx,edi
 00566207    add         ecx,ecx
 00566209    lea         ecx,[ecx+ecx*2]
 0056620C    mov         dword ptr [esp],ecx
>0056620F    jmp         0056621C
 00566211    mov         eax,edi
 00566213    shl         eax,2
 00566216    add         eax,2
 00566219    mov         dword ptr [esp],eax
 0056621C    cmp         dword ptr [esi+16C],0
>00566223    je          00566230
 00566225    mov         edx,dword ptr [esi+170]
 0056622B    cmp         edx,dword ptr [esp]
>0056622E    jge         0056625D
 00566230    cmp         dword ptr [esp],0A
>00566234    jle         0056623B
 00566236    mov         ebx,dword ptr [esp]
>00566239    jmp         00566240
 0056623B    mov         ebx,0A
 00566240    mov         ecx,ebx
 00566242    mov         eax,esi
 00566244    shl         ecx,2
 00566247    mov         dword ptr [esi+170],ebx
 0056624D    mov         ebx,dword ptr [eax+4]
 00566250    xor         edx,edx
 00566252    lea         ecx,[ecx+ecx*8]
 00566255    call        dword ptr [ebx]
 00566257    mov         dword ptr [esi+16C],eax
 0056625D    mov         ebx,dword ptr [esi+16C]
 00566263    cmp         edi,3
 00566266    mov         dword ptr [esi+0A8],ebx
 0056626C    mov         eax,dword ptr [esp]
 0056626F    mov         dword ptr [esi+0A4],eax
>00566275    jne         00566362
 0056627B    cmp         dword ptr [esi+3C],3
>0056627F    jne         00566362
 00566285    push        1
 00566287    xor         ecx,ecx
 00566289    mov         edx,edi
 0056628B    mov         eax,ebx
 0056628D    call        0056617C
 00566292    mov         ebx,eax
 00566294    push        5
 00566296    push        0
 00566298    push        2
 0056629A    mov         ecx,1
 0056629F    xor         edx,edx
 005662A1    mov         eax,ebx
 005662A3    call        00566118
 005662A8    mov         ebx,eax
 005662AA    push        3F
 005662AC    push        0
 005662AE    push        1
 005662B0    mov         ecx,1
 005662B5    mov         edx,2
 005662BA    mov         eax,ebx
 005662BC    call        00566118
 005662C1    mov         ebx,eax
 005662C3    push        3F
 005662C5    push        0
 005662C7    push        1
 005662C9    mov         ecx,1
 005662CE    mov         edx,1
 005662D3    mov         eax,ebx
 005662D5    call        00566118
 005662DA    mov         ebx,eax
 005662DC    push        3F
 005662DE    push        0
 005662E0    push        2
 005662E2    mov         ecx,6
 005662E7    xor         edx,edx
 005662E9    mov         eax,ebx
 005662EB    call        00566118
 005662F0    mov         ebx,eax
 005662F2    push        3F
 005662F4    push        2
 005662F6    push        1
 005662F8    mov         ecx,1
 005662FD    xor         edx,edx
 005662FF    mov         eax,ebx
 00566301    call        00566118
 00566306    mov         ebx,eax
 00566308    push        0
 0056630A    mov         ecx,1
 0056630F    mov         edx,edi
 00566311    mov         eax,ebx
 00566313    call        0056617C
 00566318    mov         ebx,eax
 0056631A    push        3F
 0056631C    push        1
 0056631E    push        0
 00566320    mov         ecx,1
 00566325    mov         edx,2
 0056632A    mov         eax,ebx
 0056632C    call        00566118
 00566331    mov         ebx,eax
 00566333    push        3F
 00566335    push        1
 00566337    push        0
 00566339    mov         ecx,1
 0056633E    mov         edx,1
 00566343    mov         eax,ebx
 00566345    call        00566118
 0056634A    mov         ebx,eax
 0056634C    push        3F
 0056634E    push        1
 00566350    push        0
 00566352    mov         ecx,1
 00566357    xor         edx,edx
 00566359    mov         eax,ebx
 0056635B    call        00566118
>00566360    jmp         005663D9
 00566362    push        1
 00566364    xor         ecx,ecx
 00566366    mov         edx,edi
 00566368    mov         eax,ebx
 0056636A    call        0056617C
 0056636F    mov         ebx,eax
 00566371    push        5
 00566373    push        0
 00566375    push        2
 00566377    mov         ecx,1
 0056637C    mov         edx,edi
 0056637E    mov         eax,ebx
 00566380    call        00566140
 00566385    mov         ebx,eax
 00566387    push        3F
 00566389    push        0
 0056638B    push        2
 0056638D    mov         ecx,6
 00566392    mov         edx,edi
 00566394    mov         eax,ebx
 00566396    call        00566140
 0056639B    mov         ebx,eax
 0056639D    push        3F
 0056639F    push        2
 005663A1    push        1
 005663A3    mov         ecx,1
 005663A8    mov         edx,edi
 005663AA    mov         eax,ebx
 005663AC    call        00566140
 005663B1    mov         ebx,eax
 005663B3    push        0
 005663B5    mov         ecx,1
 005663BA    mov         edx,edi
 005663BC    mov         eax,ebx
 005663BE    call        0056617C
 005663C3    mov         ebx,eax
 005663C5    push        3F
 005663C7    push        1
 005663C9    push        0
 005663CB    mov         ecx,1
 005663D0    mov         edx,edi
 005663D2    mov         eax,ebx
 005663D4    call        00566140
 005663D9    pop         edx
 005663DA    pop         edi
 005663DB    pop         esi
 005663DC    pop         ebx
 005663DD    ret
*}
end;

//005663E0
procedure jpeg_start_compress(var cinfo:jpeg_compress_struct; WriteAllTables:LongBool);
begin
{*
 005663E0    push        ebx
 005663E1    mov         ebx,eax
 005663E3    push        esi
 005663E4    mov         esi,edx
 005663E6    cmp         dword ptr [ebx+14],64
>005663EA    je          00566401
 005663EC    mov         eax,dword ptr [ebx]
 005663EE    mov         dword ptr [eax+14],14
 005663F5    mov         edx,dword ptr [ebx+14]
 005663F8    mov         dword ptr [eax+18],edx
 005663FB    mov         eax,ebx
 005663FD    mov         edx,dword ptr [eax]
 005663FF    call        dword ptr [edx]
 00566401    test        esi,esi
>00566403    je          0056640E
 00566405    xor         edx,edx
 00566407    mov         eax,ebx
 00566409    call        @jpeg_suppress_tables
 0056640E    mov         eax,ebx
 00566410    mov         edx,dword ptr [eax]
 00566412    call        dword ptr [edx+10]
 00566415    mov         eax,ebx
 00566417    mov         edx,dword ptr [eax+18]
 0056641A    call        dword ptr [edx+8]
 0056641D    mov         eax,ebx
 0056641F    call        @jinit_compress_master
 00566424    mov         eax,ebx
 00566426    mov         edx,dword ptr [eax+148]
 0056642C    call        dword ptr [edx]
 0056642E    xor         ecx,ecx
 00566430    mov         dword ptr [ebx+0DC],ecx
 00566436    cmp         dword ptr [ebx+0AC],0
>0056643D    je          00566446
 0056643F    mov         eax,66
>00566444    jmp         0056644B
 00566446    mov         eax,65
 0056644B    mov         dword ptr [ebx+14],eax
 0056644E    pop         esi
 0056644F    pop         ebx
 00566450    ret
*}
end;

//00566454
function jpeg_write_scanlines(var cinfo:jpeg_compress_struct; scanlines:JSAMPARRAY; max_lines:Cardinal):Cardinal;
begin
{*
 00566454    push        ebx
 00566455    mov         ebx,eax
 00566457    push        esi
 00566458    push        edi
 00566459    push        ecx
 0056645A    mov         edi,edx
 0056645C    cmp         dword ptr [ebx+14],65
 00566460    mov         esi,ecx
>00566462    je          00566479
 00566464    mov         eax,dword ptr [ebx]
 00566466    mov         dword ptr [eax+14],14
 0056646D    mov         edx,dword ptr [ebx+14]
 00566470    mov         dword ptr [eax+18],edx
 00566473    mov         eax,ebx
 00566475    mov         edx,dword ptr [eax]
 00566477    call        dword ptr [edx]
 00566479    mov         ecx,dword ptr [ebx+0DC]
 0056647F    cmp         ecx,dword ptr [ebx+20]
>00566482    jb          00566497
 00566484    mov         eax,dword ptr [ebx]
 00566486    mov         dword ptr [eax+14],7B
 0056648D    or          edx,0FFFFFFFF
 00566490    mov         eax,ebx
 00566492    mov         ecx,dword ptr [eax]
 00566494    call        dword ptr [ecx+4]
 00566497    mov         eax,dword ptr [ebx+8]
 0056649A    test        eax,eax
>0056649C    je          005664B4
 0056649E    mov         edx,dword ptr [ebx+0DC]
 005664A4    mov         dword ptr [eax+4],edx
 005664A7    mov         ecx,dword ptr [ebx+20]
 005664AA    mov         dword ptr [eax+8],ecx
 005664AD    mov         eax,ebx
 005664AF    mov         edx,dword ptr [eax+8]
 005664B2    call        dword ptr [edx]
 005664B4    mov         ecx,dword ptr [ebx+148]
 005664BA    cmp         dword ptr [ecx+0C],0
>005664BE    je          005664CB
 005664C0    mov         eax,ebx
 005664C2    mov         edx,dword ptr [eax+148]
 005664C8    call        dword ptr [edx+4]
 005664CB    mov         eax,dword ptr [ebx+20]
 005664CE    sub         eax,dword ptr [ebx+0DC]
 005664D4    cmp         eax,esi
>005664D6    jae         005664DA
 005664D8    mov         esi,eax
 005664DA    xor         eax,eax
 005664DC    mov         edx,edi
 005664DE    mov         dword ptr [esp],eax
 005664E1    mov         eax,ebx
 005664E3    push        esi
 005664E4    lea         ecx,[esp+4]
 005664E8    mov         esi,dword ptr [eax+14C]
 005664EE    call        dword ptr [esi+4]
 005664F1    mov         eax,dword ptr [esp]
 005664F4    add         dword ptr [ebx+0DC],eax
 005664FA    mov         eax,dword ptr [esp]
 005664FD    pop         edx
 005664FE    pop         edi
 005664FF    pop         esi
 00566500    pop         ebx
 00566501    ret
*}
end;

//005665C0
procedure jpeg_CreateCompress(var cinfo:jpeg_compress_struct; version:Integer; structsize:Integer);
begin
{*
 005665C0    push        ebx
 005665C1    mov         ebx,eax
 005665C3    push        esi
 005665C4    xor         eax,eax
 005665C6    push        edi
 005665C7    mov         dword ptr [ebx+4],eax
 005665CA    cmp         edx,3E
 005665CD    mov         esi,ecx
>005665CF    je          005665EA
 005665D1    mov         eax,dword ptr [ebx]
 005665D3    mov         dword ptr [eax+14],0C
 005665DA    mov         dword ptr [eax+18],3E
 005665E1    mov         dword ptr [eax+1C],edx
 005665E4    mov         eax,ebx
 005665E6    mov         edx,dword ptr [eax]
 005665E8    call        dword ptr [edx]
 005665EA    cmp         esi,174
>005665F0    je          0056660B
 005665F2    mov         eax,dword ptr [ebx]
 005665F4    mov         dword ptr [eax+14],15
 005665FB    mov         dword ptr [eax+18],174
 00566602    mov         dword ptr [eax+1C],esi
 00566605    mov         eax,ebx
 00566607    mov         edx,dword ptr [eax]
 00566609    call        dword ptr [edx]
 0056660B    mov         esi,dword ptr [ebx]
 0056660D    mov         edi,dword ptr [ebx+0C]
 00566610    push        174
 00566615    push        0
 00566617    push        ebx
 00566618    call        _memset
 0056661D    add         esp,0C
 00566620    mov         dword ptr [ebx],esi
 00566622    mov         dword ptr [ebx+0C],edi
 00566625    xor         eax,eax
 00566627    mov         dword ptr [ebx+10],eax
 0056662A    mov         eax,ebx
 0056662C    call        @jinit_memory_mgr
 00566631    xor         edx,edx
 00566633    xor         ecx,ecx
 00566635    mov         dword ptr [ebx+8],edx
 00566638    mov         dword ptr [ebx+18],ecx
 0056663B    xor         eax,eax
 0056663D    lea         edx,[ebx+44]
 00566640    mov         dword ptr [ebx+40],eax
 00566643    xor         eax,eax
 00566645    xor         ecx,ecx
 00566647    inc         eax
 00566648    mov         dword ptr [edx],ecx
 0056664A    add         edx,4
 0056664D    cmp         eax,4
>00566650    jl          00566645
 00566652    xor         eax,eax
 00566654    lea         edx,[ebx+54]
 00566657    xor         ecx,ecx
 00566659    inc         eax
 0056665A    mov         dword ptr [edx],ecx
 0056665C    xor         ecx,ecx
 0056665E    mov         dword ptr [edx+10],ecx
 00566661    add         edx,4
 00566664    cmp         eax,4
>00566667    jl          00566657
 00566669    xor         eax,eax
 0056666B    xor         edx,edx
 0056666D    mov         dword ptr [ebx+16C],eax
 00566673    mov         dword ptr [ebx+2C],edx
 00566676    mov         dword ptr [ebx+30],3FF00000
 0056667D    mov         dword ptr [ebx+14],64
 00566684    pop         edi
 00566685    pop         esi
 00566686    pop         ebx
 00566687    ret
*}
end;

//00566698
procedure @jpeg_suppress_tables;
begin
{*
 00566698    push        ebx
 00566699    push        esi
 0056669A    xor         ecx,ecx
 0056669C    lea         ebx,[eax+44]
 0056669F    mov         esi,dword ptr [ebx]
 005666A1    test        esi,esi
>005666A3    je          005666AB
 005666A5    mov         dword ptr [esi+80],edx
 005666AB    inc         ecx
 005666AC    add         ebx,4
 005666AF    cmp         ecx,4
>005666B2    jl          0056669F
 005666B4    xor         ecx,ecx
 005666B6    add         eax,54
 005666B9    mov         ebx,dword ptr [eax]
 005666BB    test        ebx,ebx
>005666BD    je          005666C5
 005666BF    mov         dword ptr [ebx+114],edx
 005666C5    mov         ebx,dword ptr [eax+10]
 005666C8    test        ebx,ebx
>005666CA    je          005666D2
 005666CC    mov         dword ptr [ebx+114],edx
 005666D2    inc         ecx
 005666D3    add         eax,4
 005666D6    cmp         ecx,4
>005666D9    jl          005666B9
 005666DB    pop         esi
 005666DC    pop         ebx
 005666DD    ret
*}
end;

//005666E0
procedure jpeg_finish_compress(var cinfo:jpeg_compress_struct);
begin
{*
 005666E0    push        ebx
 005666E1    mov         ebx,eax
 005666E3    push        esi
 005666E4    mov         eax,dword ptr [ebx+14]
 005666E7    cmp         eax,65
>005666EA    je          005666F1
 005666EC    cmp         eax,66
>005666EF    jne         00566718
 005666F1    mov         edx,dword ptr [ebx+0DC]
 005666F7    cmp         edx,dword ptr [ebx+20]
>005666FA    jae         0056670B
 005666FC    mov         ecx,dword ptr [ebx]
 005666FE    mov         eax,ebx
 00566700    mov         dword ptr [ecx+14],43
 00566707    mov         edx,dword ptr [eax]
 00566709    call        dword ptr [edx]
 0056670B    mov         eax,ebx
 0056670D    mov         edx,dword ptr [eax+148]
 00566713    call        dword ptr [edx+8]
>00566716    jmp         00566791
 00566718    cmp         dword ptr [ebx+14],67
>0056671C    je          00566791
 0056671E    mov         eax,dword ptr [ebx]
 00566720    mov         dword ptr [eax+14],14
 00566727    mov         edx,dword ptr [ebx+14]
 0056672A    mov         dword ptr [eax+18],edx
 0056672D    mov         eax,ebx
 0056672F    mov         edx,dword ptr [eax]
 00566731    call        dword ptr [edx]
>00566733    jmp         00566791
 00566735    mov         eax,ebx
 00566737    mov         edx,dword ptr [eax+148]
 0056673D    call        dword ptr [edx]
 0056673F    xor         esi,esi
>00566741    jmp         0056677E
 00566743    mov         eax,dword ptr [ebx+8]
 00566746    test        eax,eax
>00566748    je          0056675D
 0056674A    mov         dword ptr [eax+4],esi
 0056674D    mov         edx,dword ptr [ebx+0EC]
 00566753    mov         dword ptr [eax+8],edx
 00566756    mov         eax,ebx
 00566758    mov         edx,dword ptr [eax+8]
 0056675B    call        dword ptr [edx]
 0056675D    xor         edx,edx
 0056675F    mov         eax,ebx
 00566761    mov         ecx,dword ptr [eax+154]
 00566767    call        dword ptr [ecx+4]
 0056676A    test        eax,eax
>0056676C    jne         0056677D
 0056676E    mov         eax,dword ptr [ebx]
 00566770    mov         dword ptr [eax+14],18
 00566777    mov         eax,ebx
 00566779    mov         edx,dword ptr [eax]
 0056677B    call        dword ptr [edx]
 0056677D    inc         esi
 0056677E    cmp         esi,dword ptr [ebx+0EC]
>00566784    jb          00566743
 00566786    mov         eax,ebx
 00566788    mov         edx,dword ptr [eax+148]
 0056678E    call        dword ptr [edx+8]
 00566791    mov         ecx,dword ptr [ebx+148]
 00566797    cmp         dword ptr [ecx+10],0
>0056679B    je          00566735
 0056679D    mov         eax,ebx
 0056679F    mov         edx,dword ptr [eax+158]
 005667A5    call        dword ptr [edx+0C]
 005667A8    mov         eax,ebx
 005667AA    mov         edx,dword ptr [eax+18]
 005667AD    call        dword ptr [edx+10]
 005667B0    mov         eax,ebx
 005667B2    call        @jpeg_abort
 005667B7    pop         esi
 005667B8    pop         ebx
 005667B9    ret
*}
end;

//005668D4
procedure @jinit_compress_master;
begin
{*
 005668D4    push        ebx
 005668D5    mov         ebx,eax
 005668D7    xor         edx,edx
 005668D9    mov         eax,ebx
 005668DB    call        @jinit_c_master_control
 005668E0    cmp         dword ptr [ebx+0AC],0
>005668E7    jne         00566900
 005668E9    mov         eax,ebx
 005668EB    call        @jinit_color_converter
 005668F0    mov         eax,ebx
 005668F2    call        @jinit_downsampler
 005668F7    xor         edx,edx
 005668F9    mov         eax,ebx
 005668FB    call        @jinit_c_prep_controller
 00566900    mov         eax,ebx
 00566902    call        @jinit_forward_dct
 00566907    cmp         dword ptr [ebx+0B0],0
>0056690E    je          00566921
 00566910    mov         edx,dword ptr [ebx]
 00566912    mov         eax,ebx
 00566914    mov         dword ptr [edx+14],1
 0056691B    mov         edx,dword ptr [eax]
 0056691D    call        dword ptr [edx]
>0056691F    jmp         0056693A
 00566921    cmp         dword ptr [ebx+0E0],0
>00566928    je          00566933
 0056692A    mov         eax,ebx
 0056692C    call        @jinit_phuff_encoder
>00566931    jmp         0056693A
 00566933    mov         eax,ebx
 00566935    call        @jinit_huff_encoder
 0056693A    cmp         dword ptr [ebx+0A4],1
>00566941    jg          00566950
 00566943    cmp         dword ptr [ebx+0B4],0
>0056694A    jne         00566950
 0056694C    xor         edx,edx
>0056694E    jmp         00566955
 00566950    mov         edx,1
 00566955    mov         eax,ebx
 00566957    call        @jinit_c_coef_controller
 0056695C    xor         edx,edx
 0056695E    mov         eax,ebx
 00566960    call        @jinit_c_main_controller
 00566965    mov         eax,ebx
 00566967    call        @jinit_marker_writer
 0056696C    mov         eax,ebx
 0056696E    mov         edx,dword ptr [eax+4]
 00566971    call        dword ptr [edx+18]
 00566974    mov         eax,ebx
 00566976    mov         edx,dword ptr [eax+158]
 0056697C    call        dword ptr [edx]
 0056697E    pop         ebx
 0056697F    ret
*}
end;

//00566980
procedure _DF_.;
begin
{*
 00566980    push        ebx
 00566981    mov         ebx,eax
 00566983    push        esi
 00566984    mov         eax,dword ptr [ebx+18]
 00566987    mov         ecx,dword ptr [eax]
 00566989    inc         dword ptr [eax]
 0056698B    mov         byte ptr [ecx],dl
 0056698D    dec         dword ptr [eax+4]
>00566990    jne         005669AC
 00566992    mov         esi,eax
 00566994    mov         eax,ebx
 00566996    call        dword ptr [esi+0C]
 00566999    test        eax,eax
>0056699B    jne         005669AC
 0056699D    mov         edx,dword ptr [ebx]
 0056699F    mov         eax,ebx
 005669A1    mov         dword ptr [edx+14],18
 005669A8    mov         edx,dword ptr [eax]
 005669AA    call        dword ptr [edx]
 005669AC    pop         esi
 005669AD    pop         ebx
 005669AE    ret
*}
end;

//00567154
procedure @jinit_marker_writer;
begin
{*
 00567154    push        ebx
 00567155    mov         ebx,eax
 00567157    mov         eax,ebx
 00567159    push        esi
 0056715A    mov         ecx,20
 0056715F    mov         edx,1
 00567164    mov         esi,dword ptr [eax+4]
 00567167    call        dword ptr [esi]
 00567169    mov         dword ptr [ebx+158],eax
 0056716F    mov         dword ptr [eax],566EF8
 00567175    mov         dword ptr [eax+4],566F38
 0056717C    mov         dword ptr [eax+8],567010
 00567183    mov         dword ptr [eax+0C],5670D0
 0056718A    mov         dword ptr [eax+10],5670DC
 00567191    mov         dword ptr [eax+14],566EB8
 00567198    mov         dword ptr [eax+18],566EF0
 0056719F    xor         edx,edx
 005671A1    mov         dword ptr [eax+1C],edx
 005671A4    pop         esi
 005671A5    pop         ebx
 005671A6    ret
*}
end;

//005671A8
procedure _DF_.;
begin
{*
 005671A8    push        ebx
 005671A9    mov         ebx,eax
 005671AB    push        esi
 005671AC    push        edi
 005671AD    cmp         dword ptr [ebx+20],0
>005671B1    jbe         005671C5
 005671B3    cmp         dword ptr [ebx+1C],0
>005671B7    jbe         005671C5
 005671B9    cmp         dword ptr [ebx+38],0
>005671BD    jle         005671C5
 005671BF    cmp         dword ptr [ebx+24],0
>005671C3    jg          005671D4
 005671C5    mov         eax,dword ptr [ebx]
 005671C7    mov         dword ptr [eax+14],20
 005671CE    mov         eax,ebx
 005671D0    mov         edx,dword ptr [eax]
 005671D2    call        dword ptr [edx]
 005671D4    cmp         dword ptr [ebx+20],0FFDC
>005671DB    jg          005671E6
 005671DD    cmp         dword ptr [ebx+1C],0FFDC
>005671E4    jle         005671FC
 005671E6    mov         eax,dword ptr [ebx]
 005671E8    mov         dword ptr [eax+14],29
 005671EF    mov         dword ptr [eax+18],0FFDC
 005671F6    mov         eax,ebx
 005671F8    mov         edx,dword ptr [eax]
 005671FA    call        dword ptr [edx]
 005671FC    mov         eax,dword ptr [ebx+1C]
 005671FF    imul        dword ptr [ebx+24]
 00567202    mov         edx,eax
 00567204    cmp         eax,edx
>00567206    je          00567217
 00567208    mov         ecx,dword ptr [ebx]
 0056720A    mov         eax,ebx
 0056720C    mov         dword ptr [ecx+14],46
 00567213    mov         edx,dword ptr [eax]
 00567215    call        dword ptr [edx]
 00567217    cmp         dword ptr [ebx+34],8
>0056721B    je          00567232
 0056721D    mov         eax,dword ptr [ebx]
 0056721F    mov         dword ptr [eax+14],0F
 00567226    mov         edx,dword ptr [ebx+34]
 00567229    mov         dword ptr [eax+18],edx
 0056722C    mov         eax,ebx
 0056722E    mov         edx,dword ptr [eax]
 00567230    call        dword ptr [edx]
 00567232    cmp         dword ptr [ebx+38],0A
>00567236    jle         00567254
 00567238    mov         eax,dword ptr [ebx]
 0056723A    mov         dword ptr [eax+14],1A
 00567241    mov         edx,dword ptr [ebx+38]
 00567244    mov         dword ptr [eax+18],edx
 00567247    mov         dword ptr [eax+1C],0A
 0056724E    mov         eax,ebx
 00567250    mov         edx,dword ptr [eax]
 00567252    call        dword ptr [edx]
 00567254    mov         dword ptr [ebx+0E4],1
 0056725E    mov         dword ptr [ebx+0E8],1
 00567268    xor         edi,edi
 0056726A    mov         esi,dword ptr [ebx+40]
>0056726D    jmp         005672D2
 0056726F    mov         eax,dword ptr [esi+8]
 00567272    test        eax,eax
>00567274    jle         00567287
 00567276    cmp         eax,4
>00567279    jg          00567287
 0056727B    cmp         dword ptr [esi+0C],0
>0056727F    jle         00567287
 00567281    cmp         dword ptr [esi+0C],4
>00567285    jle         00567296
 00567287    mov         edx,dword ptr [ebx]
 00567289    mov         eax,ebx
 0056728B    mov         dword ptr [edx+14],12
 00567292    mov         edx,dword ptr [eax]
 00567294    call        dword ptr [edx]
 00567296    mov         ecx,dword ptr [ebx+0E4]
 0056729C    cmp         ecx,dword ptr [esi+8]
>0056729F    jle         005672A9
 005672A1    mov         eax,dword ptr [ebx+0E4]
>005672A7    jmp         005672AC
 005672A9    mov         eax,dword ptr [esi+8]
 005672AC    mov         dword ptr [ebx+0E4],eax
 005672B2    mov         edx,dword ptr [ebx+0E8]
 005672B8    cmp         edx,dword ptr [esi+0C]
>005672BB    jle         005672C5
 005672BD    mov         ecx,dword ptr [ebx+0E8]
>005672C3    jmp         005672C8
 005672C5    mov         ecx,dword ptr [esi+0C]
 005672C8    mov         dword ptr [ebx+0E8],ecx
 005672CE    inc         edi
 005672CF    add         esi,54
 005672D2    cmp         edi,dword ptr [ebx+38]
>005672D5    jl          0056726F
 005672D7    xor         edi,edi
 005672D9    mov         esi,dword ptr [ebx+40]
>005672DC    jmp         0056734B
 005672DE    mov         dword ptr [esi+4],edi
 005672E1    mov         dword ptr [esi+24],8
 005672E8    mov         edx,dword ptr [ebx+0E4]
 005672EE    shl         edx,3
 005672F1    mov         eax,dword ptr [ebx+1C]
 005672F4    imul        eax,dword ptr [esi+8]
 005672F8    call        @jdiv_round_up
 005672FD    mov         dword ptr [esi+1C],eax
 00567300    mov         edx,dword ptr [ebx+0E8]
 00567306    shl         edx,3
 00567309    mov         eax,dword ptr [ebx+20]
 0056730C    imul        eax,dword ptr [esi+0C]
 00567310    call        @jdiv_round_up
 00567315    mov         dword ptr [esi+20],eax
 00567318    mov         eax,dword ptr [ebx+1C]
 0056731B    imul        dword ptr [esi+8]
 0056731E    mov         edx,dword ptr [ebx+0E4]
 00567324    call        @jdiv_round_up
 00567329    mov         dword ptr [esi+28],eax
 0056732C    mov         eax,dword ptr [ebx+20]
 0056732F    imul        dword ptr [esi+0C]
 00567332    mov         edx,dword ptr [ebx+0E8]
 00567338    call        @jdiv_round_up
 0056733D    mov         dword ptr [esi+2C],eax
 00567340    inc         edi
 00567341    mov         dword ptr [esi+30],1
 00567348    add         esi,54
 0056734B    cmp         edi,dword ptr [ebx+38]
>0056734E    jl          005672DE
 00567350    mov         edx,dword ptr [ebx+0E8]
 00567356    mov         eax,dword ptr [ebx+20]
 00567359    shl         edx,3
 0056735C    call        @jdiv_round_up
 00567361    mov         dword ptr [ebx+0EC],eax
 00567367    pop         edi
 00567368    pop         esi
 00567369    pop         ebx
 0056736A    ret
*}
end;

//0056736C
{*procedure sub_0056736C(?:?);
begin
 0056736C    push        ebx
 0056736D    push        esi
 0056736E    push        edi
 0056736F    mov         esi,eax
 00567371    push        ebp
 00567372    add         esp,0FFFFF5B8
 00567378    cmp         dword ptr [esi+0A4],0
>0056737F    jg          00567397
 00567381    mov         eax,dword ptr [esi]
 00567383    xor         ecx,ecx
 00567385    mov         dword ptr [eax+14],13
 0056738C    mov         edx,dword ptr [esi]
 0056738E    mov         eax,esi
 00567390    mov         dword ptr [edx+18],ecx
 00567393    mov         edx,dword ptr [eax]
 00567395    call        dword ptr [edx]
 00567397    mov         ecx,dword ptr [esi+0A8]
 0056739D    mov         dword ptr [esp],ecx
 005673A0    mov         eax,dword ptr [esp]
 005673A3    cmp         dword ptr [eax+14],0
>005673A7    jne         005673B2
 005673A9    mov         edx,dword ptr [esp]
 005673AC    cmp         dword ptr [edx+18],3F
>005673B0    je          005673E8
 005673B2    mov         dword ptr [esi+0E0],1
 005673BC    lea         ebx,[esp+48]
 005673C0    xor         eax,eax
 005673C2    mov         dword ptr [esp+0C],eax
>005673C6    jmp         005673DD
 005673C8    xor         edi,edi
 005673CA    mov         dword ptr [ebx],0FFFFFFFF
 005673D0    add         ebx,4
 005673D3    inc         edi
 005673D4    cmp         edi,40
>005673D7    jl          005673CA
 005673D9    inc         dword ptr [esp+0C]
 005673DD    mov         eax,dword ptr [esp+0C]
 005673E1    cmp         eax,dword ptr [esi+38]
>005673E4    jl          005673C8
>005673E6    jmp         00567410
 005673E8    xor         edx,edx
 005673EA    xor         ecx,ecx
 005673EC    mov         dword ptr [esi+0E0],edx
 005673F2    mov         dword ptr [esp+0C],ecx
 005673F6    lea         eax,[esp+20]
>005673FA    jmp         00567407
 005673FC    xor         edx,edx
 005673FE    mov         dword ptr [eax],edx
 00567400    inc         dword ptr [esp+0C]
 00567404    add         eax,4
 00567407    mov         ecx,dword ptr [esp+0C]
 0056740B    cmp         ecx,dword ptr [esi+38]
>0056740E    jl          005673FC
 00567410    mov         dword ptr [esp+4],1
>00567418    jmp         005676CB
 0056741D    mov         eax,dword ptr [esp]
 00567420    mov         edx,dword ptr [eax]
 00567422    mov         dword ptr [esp+8],edx
 00567426    cmp         dword ptr [esp+8],0
>0056742B    jle         00567434
 0056742D    cmp         dword ptr [esp+8],4
>00567432    jle         00567451
 00567434    mov         eax,dword ptr [esi]
 00567436    mov         dword ptr [eax+14],1A
 0056743D    mov         edx,dword ptr [esp+8]
 00567441    mov         dword ptr [eax+18],edx
 00567444    mov         dword ptr [eax+1C],4
 0056744B    mov         eax,esi
 0056744D    mov         edx,dword ptr [eax]
 0056744F    call        dword ptr [edx]
 00567451    xor         ecx,ecx
 00567453    mov         dword ptr [esp+0C],ecx
 00567457    mov         eax,dword ptr [esp]
 0056745A    lea         edi,[eax+4]
 0056745D    mov         eax,dword ptr [esp+0C]
 00567461    cmp         eax,dword ptr [esp+8]
>00567465    jge         005674BB
 00567467    mov         ebx,dword ptr [edi]
 00567469    test        ebx,ebx
>0056746B    jl          00567472
 0056746D    cmp         ebx,dword ptr [esi+38]
>00567470    jl          00567488
 00567472    mov         eax,dword ptr [esi]
 00567474    mov         dword ptr [eax+14],13
 0056747B    mov         edx,dword ptr [esp+4]
 0056747F    mov         dword ptr [eax+18],edx
 00567482    mov         eax,esi
 00567484    mov         edx,dword ptr [eax]
 00567486    call        dword ptr [edx]
 00567488    cmp         dword ptr [esp+0C],0
>0056748D    jle         005674AA
 0056748F    cmp         ebx,dword ptr [edi-4]
>00567492    jg          005674AA
 00567494    mov         eax,dword ptr [esi]
 00567496    mov         dword ptr [eax+14],13
 0056749D    mov         edx,dword ptr [esp+4]
 005674A1    mov         dword ptr [eax+18],edx
 005674A4    mov         eax,esi
 005674A6    mov         edx,dword ptr [eax]
 005674A8    call        dword ptr [edx]
 005674AA    inc         dword ptr [esp+0C]
 005674AE    add         edi,4
 005674B1    mov         ecx,dword ptr [esp+0C]
 005674B5    cmp         ecx,dword ptr [esp+8]
>005674B9    jl          00567467
 005674BB    mov         eax,dword ptr [esp]
 005674BE    mov         edx,dword ptr [eax+14]
 005674C1    mov         dword ptr [esp+10],edx
 005674C5    mov         ecx,dword ptr [esp]
 005674C8    mov         eax,dword ptr [ecx+18]
 005674CB    mov         dword ptr [esp+14],eax
 005674CF    mov         edx,dword ptr [esp]
 005674D2    mov         eax,dword ptr [esp]
 005674D5    mov         ebp,dword ptr [edx+1C]
 005674D8    mov         edx,dword ptr [eax+20]
 005674DB    mov         dword ptr [esp+18],edx
 005674DF    cmp         dword ptr [esi+0E0],0
>005674E6    je          00567646
 005674EC    cmp         dword ptr [esp+10],0
>005674F1    jl          00567522
 005674F3    cmp         dword ptr [esp+10],40
>005674F8    jge         00567522
 005674FA    mov         ecx,dword ptr [esp+14]
 005674FE    cmp         ecx,dword ptr [esp+10]
>00567502    jl          00567522
 00567504    cmp         dword ptr [esp+14],40
>00567509    jge         00567522
 0056750B    test        ebp,ebp
>0056750D    jl          00567522
 0056750F    cmp         ebp,0A
>00567512    jg          00567522
 00567514    cmp         dword ptr [esp+18],0
>00567519    jl          00567522
 0056751B    cmp         dword ptr [esp+18],0A
>00567520    jle         00567538
 00567522    mov         eax,dword ptr [esi]
 00567524    mov         dword ptr [eax+14],11
 0056752B    mov         edx,dword ptr [esp+4]
 0056752F    mov         dword ptr [eax+18],edx
 00567532    mov         eax,esi
 00567534    mov         edx,dword ptr [eax]
 00567536    call        dword ptr [edx]
 00567538    cmp         dword ptr [esp+10],0
>0056753D    jne         0056755E
 0056753F    cmp         dword ptr [esp+14],0
>00567544    je          0056757B
 00567546    mov         eax,dword ptr [esi]
 00567548    mov         dword ptr [eax+14],11
 0056754F    mov         edx,dword ptr [esp+4]
 00567553    mov         dword ptr [eax+18],edx
 00567556    mov         eax,esi
 00567558    mov         edx,dword ptr [eax]
 0056755A    call        dword ptr [edx]
>0056755C    jmp         0056757B
 0056755E    cmp         dword ptr [esp+8],1
>00567563    je          0056757B
 00567565    mov         eax,dword ptr [esi]
 00567567    mov         dword ptr [eax+14],11
 0056756E    mov         edx,dword ptr [esp+4]
 00567572    mov         dword ptr [eax+18],edx
 00567575    mov         eax,esi
 00567577    mov         edx,dword ptr [eax]
 00567579    call        dword ptr [edx]
 0056757B    xor         ecx,ecx
 0056757D    mov         dword ptr [esp+0C],ecx
 00567581    mov         eax,dword ptr [esp]
 00567584    lea         edx,[eax+4]
 00567587    mov         dword ptr [esp+1C],edx
 0056758B    mov         ecx,dword ptr [esp+0C]
 0056758F    cmp         ecx,dword ptr [esp+8]
>00567593    jge         005676C3
 00567599    mov         eax,dword ptr [esp+1C]
 0056759D    mov         ebx,dword ptr [eax]
 0056759F    shl         ebx,8
 005675A2    lea         eax,[esp+48]
 005675A6    add         ebx,eax
 005675A8    cmp         dword ptr [esp+10],0
>005675AD    je          005675CA
 005675AF    cmp         dword ptr [ebx],0
>005675B2    jge         005675CA
 005675B4    mov         eax,dword ptr [esi]
 005675B6    mov         dword ptr [eax+14],11
 005675BD    mov         edx,dword ptr [esp+4]
 005675C1    mov         dword ptr [eax+18],edx
 005675C4    mov         eax,esi
 005675C6    mov         edx,dword ptr [eax]
 005675C8    call        dword ptr [edx]
 005675CA    mov         edi,dword ptr [esp+10]
 005675CE    cmp         edi,dword ptr [esp+14]
 005675D2    lea         eax,[ebx+edi*4]
 005675D5    mov         ebx,eax
>005675D7    jg          0056762D
 005675D9    cmp         dword ptr [ebx],0
>005675DC    jge         005675FA
 005675DE    test        ebp,ebp
>005675E0    je          0056761D
 005675E2    mov         eax,dword ptr [esi]
 005675E4    mov         dword ptr [eax+14],11
 005675EB    mov         edx,dword ptr [esp+4]
 005675EF    mov         dword ptr [eax+18],edx
 005675F2    mov         eax,esi
 005675F4    mov         edx,dword ptr [eax]
 005675F6    call        dword ptr [edx]
>005675F8    jmp         0056761D
 005675FA    cmp         ebp,dword ptr [ebx]
>005675FC    jne         00567607
 005675FE    lea         ecx,[ebp-1]
 00567601    cmp         ecx,dword ptr [esp+18]
>00567605    je          0056761D
 00567607    mov         eax,dword ptr [esi]
 00567609    mov         dword ptr [eax+14],11
 00567610    mov         edx,dword ptr [esp+4]
 00567614    mov         dword ptr [eax+18],edx
 00567617    mov         eax,esi
 00567619    mov         edx,dword ptr [eax]
 0056761B    call        dword ptr [edx]
 0056761D    mov         ecx,dword ptr [esp+18]
 00567621    inc         edi
 00567622    mov         dword ptr [ebx],ecx
 00567624    add         ebx,4
 00567627    cmp         edi,dword ptr [esp+14]
>0056762B    jle         005675D9
 0056762D    inc         dword ptr [esp+0C]
 00567631    add         dword ptr [esp+1C],4
 00567636    mov         eax,dword ptr [esp+0C]
 0056763A    cmp         eax,dword ptr [esp+8]
>0056763E    jl          00567599
>00567644    jmp         005676C3
 00567646    cmp         dword ptr [esp+10],0
>0056764B    jne         0056765F
 0056764D    cmp         dword ptr [esp+14],3F
>00567652    jne         0056765F
 00567654    test        ebp,ebp
>00567656    jne         0056765F
 00567658    cmp         dword ptr [esp+18],0
>0056765D    je          00567675
 0056765F    mov         eax,dword ptr [esi]
 00567661    mov         dword ptr [eax+14],11
 00567668    mov         edx,dword ptr [esp+4]
 0056766C    mov         dword ptr [eax+18],edx
 0056766F    mov         eax,esi
 00567671    mov         edx,dword ptr [eax]
 00567673    call        dword ptr [edx]
 00567675    xor         ecx,ecx
 00567677    mov         dword ptr [esp+0C],ecx
 0056767B    mov         eax,dword ptr [esp]
 0056767E    lea         edi,[eax+4]
 00567681    mov         eax,dword ptr [esp+0C]
 00567685    cmp         eax,dword ptr [esp+8]
>00567689    jge         005676C3
 0056768B    mov         ebx,dword ptr [edi]
 0056768D    cmp         dword ptr [esp+ebx*4+20],0
>00567692    je          005676AA
 00567694    mov         eax,dword ptr [esi]
 00567696    mov         dword ptr [eax+14],13
 0056769D    mov         edx,dword ptr [esp+4]
 005676A1    mov         dword ptr [eax+18],edx
 005676A4    mov         eax,esi
 005676A6    mov         edx,dword ptr [eax]
 005676A8    call        dword ptr [edx]
 005676AA    mov         dword ptr [esp+ebx*4+20],1
 005676B2    inc         dword ptr [esp+0C]
 005676B6    add         edi,4
 005676B9    mov         ecx,dword ptr [esp+0C]
 005676BD    cmp         ecx,dword ptr [esp+8]
>005676C1    jl          0056768B
 005676C3    add         dword ptr [esp],24
 005676C7    inc         dword ptr [esp+4]
 005676CB    mov         eax,dword ptr [esp+4]
 005676CF    cmp         eax,dword ptr [esi+0A4]
>005676D5    jle         0056741D
 005676DB    cmp         dword ptr [esi+0E0],0
>005676E2    je          00567719
 005676E4    xor         edx,edx
 005676E6    lea         ebx,[esp+48]
 005676EA    mov         dword ptr [esp+0C],edx
>005676EE    jmp         0056770E
 005676F0    cmp         dword ptr [ebx],0
>005676F3    jge         00567704
 005676F5    mov         eax,dword ptr [esi]
 005676F7    mov         dword ptr [eax+14],2D
 005676FE    mov         eax,esi
 00567700    mov         edx,dword ptr [eax]
 00567702    call        dword ptr [edx]
 00567704    inc         dword ptr [esp+0C]
 00567708    add         ebx,100
 0056770E    mov         ecx,dword ptr [esp+0C]
 00567712    cmp         ecx,dword ptr [esi+38]
>00567715    jl          005676F0
>00567717    jmp         00567749
 00567719    xor         eax,eax
 0056771B    lea         ebx,[esp+20]
 0056771F    mov         dword ptr [esp+0C],eax
>00567723    jmp         00567740
 00567725    cmp         dword ptr [ebx],0
>00567728    jne         00567739
 0056772A    mov         eax,dword ptr [esi]
 0056772C    mov         dword ptr [eax+14],2D
 00567733    mov         eax,esi
 00567735    mov         edx,dword ptr [eax]
 00567737    call        dword ptr [edx]
 00567739    inc         dword ptr [esp+0C]
 0056773D    add         ebx,4
 00567740    mov         ecx,dword ptr [esp+0C]
 00567744    cmp         ecx,dword ptr [esi+38]
>00567747    jl          00567725
 00567749    add         esp,0A48
 0056774F    pop         ebp
 00567750    pop         edi
 00567751    pop         esi
 00567752    pop         ebx
 00567753    ret
end;*}

//00567C10
procedure @jinit_c_master_control;
begin
{*
 00567C10    push        ebx
 00567C11    push        esi
 00567C12    mov         esi,eax
 00567C14    push        edi
 00567C15    mov         eax,esi
 00567C17    mov         edi,edx
 00567C19    mov         edx,1
 00567C1E    mov         ecx,24
 00567C23    mov         ebx,dword ptr [eax+4]
 00567C26    call        dword ptr [ebx]
 00567C28    mov         ebx,eax
 00567C2A    xor         eax,eax
 00567C2C    mov         dword ptr [esi+148],ebx
 00567C32    mov         dword ptr [ebx],5679F0
 00567C38    mov         dword ptr [ebx+4],567B8C
 00567C3F    mov         dword ptr [ebx+8],567BB4
 00567C46    mov         dword ptr [ebx+10],eax
 00567C49    mov         eax,esi
 00567C4B    call        _DF_.
 00567C50    cmp         dword ptr [esi+0A8],0
>00567C57    je          00567C62
 00567C59    mov         eax,esi
 00567C5B    call        0056736C
>00567C60    jmp         00567C74
 00567C62    xor         edx,edx
 00567C64    mov         dword ptr [esi+0E0],edx
 00567C6A    mov         dword ptr [esi+0A4],1
 00567C74    cmp         dword ptr [esi+0E0],0
>00567C7B    je          00567C87
 00567C7D    mov         dword ptr [esi+0B4],1
 00567C87    test        edi,edi
>00567C89    je          00567CA6
 00567C8B    cmp         dword ptr [esi+0B4],0
>00567C92    je          00567C9D
 00567C94    mov         dword ptr [ebx+14],1
>00567C9B    jmp         00567CAB
 00567C9D    mov         dword ptr [ebx+14],2
>00567CA4    jmp         00567CAB
 00567CA6    xor         ecx,ecx
 00567CA8    mov         dword ptr [ebx+14],ecx
 00567CAB    xor         eax,eax
 00567CAD    xor         edx,edx
 00567CAF    mov         dword ptr [ebx+20],eax
 00567CB2    mov         dword ptr [ebx+18],edx
 00567CB5    cmp         dword ptr [esi+0B4],0
>00567CBC    je          00567CCB
 00567CBE    mov         ecx,dword ptr [esi+0A4]
 00567CC4    add         ecx,ecx
 00567CC6    mov         dword ptr [ebx+1C],ecx
>00567CC9    jmp         00567CD4
 00567CCB    mov         eax,dword ptr [esi+0A4]
 00567CD1    mov         dword ptr [ebx+1C],eax
 00567CD4    pop         edi
 00567CD5    pop         esi
 00567CD6    pop         ebx
 00567CD7    ret
*}
end;

//00567CD8
procedure _DF_.;
begin
{*
 00567CD8    push        ebx
 00567CD9    cmp         dword ptr [eax+0AC],0
 00567CE0    mov         ecx,dword ptr [eax+14C]
>00567CE6    jne         00567D15
 00567CE8    xor         ebx,ebx
 00567CEA    mov         dword ptr [ecx+8],ebx
 00567CED    xor         ebx,ebx
 00567CEF    mov         dword ptr [ecx+0C],ebx
 00567CF2    xor         ebx,ebx
 00567CF4    mov         dword ptr [ecx+10],ebx
 00567CF7    mov         dword ptr [ecx+14],edx
 00567CFA    sub         edx,1
>00567CFD    jae         00567D08
 00567CFF    mov         dword ptr [ecx+4],567D18
 00567D06    pop         ebx
 00567D07    ret
 00567D08    mov         edx,dword ptr [eax]
 00567D0A    mov         dword ptr [edx+14],4
 00567D11    mov         ecx,dword ptr [eax]
 00567D13    call        dword ptr [ecx]
 00567D15    pop         ebx
 00567D16    ret
*}
end;

//00567DB0
procedure @jinit_c_main_controller;
begin
{*
 00567DB0    push        ebx
 00567DB1    mov         ebx,eax
 00567DB3    push        esi
 00567DB4    push        edi
 00567DB5    mov         eax,ebx
 00567DB7    push        ebp
 00567DB8    push        ecx
 00567DB9    mov         esi,edx
 00567DBB    mov         edi,dword ptr [eax+4]
 00567DBE    mov         edx,1
 00567DC3    mov         ecx,40
 00567DC8    call        dword ptr [edi]
 00567DCA    mov         dword ptr [ebx+14C],eax
 00567DD0    mov         dword ptr [eax],567CD8;_DF_.
 00567DD6    cmp         dword ptr [ebx+0AC],0
>00567DDD    jne         00567E2E
 00567DDF    test        esi,esi
>00567DE1    je          00567DF4
 00567DE3    mov         eax,dword ptr [ebx]
 00567DE5    mov         dword ptr [eax+14],4
 00567DEC    mov         eax,ebx
 00567DEE    mov         edx,dword ptr [eax]
 00567DF0    call        dword ptr [edx]
>00567DF2    jmp         00567E2E
 00567DF4    xor         ecx,ecx
 00567DF6    lea         edi,[eax+18]
 00567DF9    mov         dword ptr [esp],ecx
 00567DFC    mov         esi,dword ptr [ebx+40]
>00567DFF    jmp         00567E26
 00567E01    mov         eax,dword ptr [esi+0C]
 00567E04    mov         edx,1
 00567E09    shl         eax,3
 00567E0C    push        eax
 00567E0D    mov         eax,ebx
 00567E0F    mov         ecx,dword ptr [esi+1C]
 00567E12    shl         ecx,3
 00567E15    mov         ebp,dword ptr [eax+4]
 00567E18    call        dword ptr [ebp+8]
 00567E1B    mov         dword ptr [edi],eax
 00567E1D    add         edi,4
 00567E20    inc         dword ptr [esp]
 00567E23    add         esi,54
 00567E26    mov         eax,dword ptr [esp]
 00567E29    cmp         eax,dword ptr [ebx+38]
>00567E2C    jl          00567E01
 00567E2E    pop         edx
 00567E2F    pop         ebp
 00567E30    pop         edi
 00567E31    pop         esi
 00567E32    pop         ebx
 00567E33    ret
*}
end;

//00567E34
procedure _DF_.;
begin
{*
 00567E34    push        ebx
 00567E35    push        esi
 00567E36    mov         esi,eax
 00567E38    test        edx,edx
 00567E3A    mov         ebx,dword ptr [esi+150]
>00567E40    je          00567E51
 00567E42    mov         eax,dword ptr [esi]
 00567E44    mov         dword ptr [eax+14],4
 00567E4B    mov         eax,esi
 00567E4D    mov         edx,dword ptr [eax]
 00567E4F    call        dword ptr [edx]
 00567E51    mov         ecx,dword ptr [esi+20]
 00567E54    xor         eax,eax
 00567E56    mov         dword ptr [ebx+30],ecx
 00567E59    xor         edx,edx
 00567E5B    mov         dword ptr [ebx+34],eax
 00567E5E    mov         dword ptr [ebx+38],edx
 00567E61    mov         ecx,dword ptr [esi+0E8]
 00567E67    add         ecx,ecx
 00567E69    mov         dword ptr [ebx+3C],ecx
 00567E6C    pop         esi
 00567E6D    pop         ebx
 00567E6E    ret
*}
end;

//005681B0
{*function sub_005681B0(?:?):?;
begin
 005681B0    push        ebx
 005681B1    push        esi
 005681B2    push        edi
 005681B3    push        ebp
 005681B4    add         esp,0FFFFFFEC
 005681B7    mov         dword ptr [esp],eax
 005681BA    mov         eax,dword ptr [esp]
 005681BD    mov         esi,dword ptr [eax+150]
 005681C3    mov         eax,dword ptr [esp]
 005681C6    mov         ebx,dword ptr [eax+0E8]
 005681CC    mov         eax,dword ptr [esp]
 005681CF    mov         edx,dword ptr [eax+38]
 005681D2    mov         eax,dword ptr [esp]
 005681D5    imul        edx,ebx
 005681D8    mov         edi,dword ptr [eax+4]
 005681DB    lea         ecx,[edx+edx*4]
 005681DE    shl         ecx,2
 005681E1    mov         edx,1
 005681E6    call        dword ptr [edi]
 005681E8    mov         dword ptr [esp+0C],eax
 005681EC    xor         eax,eax
 005681EE    mov         dword ptr [esp+4],eax
 005681F2    mov         edx,dword ptr [esp]
 005681F5    mov         ecx,dword ptr [edx+40]
 005681F8    mov         dword ptr [esp+8],ecx
 005681FC    lea         eax,[esi+8]
 005681FF    mov         dword ptr [esp+10],eax
>00568203    jmp         005682AF
 00568208    lea         edx,[ebx+ebx*2]
 0056820B    push        edx
 0056820C    mov         ecx,dword ptr [esp+0C]
 00568210    mov         edx,dword ptr [esp+4]
 00568214    mov         eax,dword ptr [ecx+1C]
 00568217    mov         ecx,dword ptr [esp+0C]
 0056821B    shl         eax,3
 0056821E    imul        dword ptr [edx+0E4]
 00568224    cdq
 00568225    idiv        eax,dword ptr [ecx+8]
 00568228    mov         ecx,eax
 0056822A    mov         eax,dword ptr [esp+4]
 0056822E    mov         edx,1
 00568233    mov         esi,dword ptr [eax+4]
 00568236    call        dword ptr [esi+8]
 00568239    mov         esi,eax
 0056823B    lea         eax,[ebx+ebx*2]
 0056823E    shl         eax,2
 00568241    mov         edx,ebx
 00568243    push        eax
 00568244    push        esi
 00568245    shl         edx,2
 00568248    add         edx,dword ptr [esp+14]
 0056824C    push        edx
 0056824D    call        _memcpy
 00568252    add         esp,0C
 00568255    xor         eax,eax
 00568257    cmp         ebx,eax
 00568259    mov         ecx,esi
 0056825B    mov         edx,dword ptr [esp+0C]
>0056825F    jle         00568286
 00568261    lea         edi,[eax+ebx*2]
 00568264    mov         edi,dword ptr [esi+edi*4]
 00568267    mov         dword ptr [edx],edi
 00568269    lea         edi,[eax+ebx*4]
 0056826C    mov         ebp,dword ptr [esp+0C]
 00568270    inc         eax
 00568271    add         edx,4
 00568274    lea         edi,[ebp+edi*4]
 00568278    push        edi
 00568279    pop         ebp
 0056827A    mov         edi,dword ptr [ecx]
 0056827C    add         ecx,4
 0056827F    cmp         ebx,eax
 00568281    mov         dword ptr [ebp],edi
>00568284    jg          00568261
 00568286    mov         eax,ebx
 00568288    mov         ecx,ebx
 0056828A    shl         ecx,2
 0056828D    mov         edx,dword ptr [esp+10]
 00568291    shl         eax,2
 00568294    add         eax,dword ptr [esp+0C]
 00568298    lea         ecx,[ecx+ecx*4]
 0056829B    mov         dword ptr [edx],eax
 0056829D    add         dword ptr [esp+0C],ecx
 005682A1    add         dword ptr [esp+10],4
 005682A6    inc         dword ptr [esp+4]
 005682AA    add         dword ptr [esp+8],54
 005682AF    mov         eax,dword ptr [esp]
 005682B2    mov         edx,dword ptr [eax+38]
 005682B5    cmp         edx,dword ptr [esp+4]
>005682B9    jg          00568208
 005682BF    add         esp,14
 005682C2    pop         ebp
 005682C3    pop         edi
 005682C4    pop         esi
 005682C5    pop         ebx
 005682C6    ret
end;*}

//005682C8
procedure @jinit_c_prep_controller;
begin
{*
 005682C8    push        ebx
 005682C9    push        esi
 005682CA    push        edi
 005682CB    push        ebp
 005682CC    push        ecx
 005682CD    mov         ebx,eax
 005682CF    test        edx,edx
>005682D1    je          005682E2
 005682D3    mov         eax,dword ptr [ebx]
 005682D5    mov         dword ptr [eax+14],4
 005682DC    mov         eax,ebx
 005682DE    mov         edx,dword ptr [eax]
 005682E0    call        dword ptr [edx]
 005682E2    mov         eax,ebx
 005682E4    mov         ecx,40
 005682E9    mov         edx,1
 005682EE    mov         esi,dword ptr [eax+4]
 005682F1    call        dword ptr [esi]
 005682F3    mov         dword ptr [ebx+150],eax
 005682F9    mov         dword ptr [eax],567E34;_DF_.
 005682FF    mov         edx,dword ptr [ebx+160]
 00568305    cmp         dword ptr [edx+8],0
>00568309    je          0056831B
 0056830B    mov         dword ptr [eax+4],568008
 00568312    mov         eax,ebx
 00568314    call        005681B0
>00568319    jmp         00568368
 0056831B    mov         dword ptr [eax+4],567EA8
 00568322    xor         ecx,ecx
 00568324    lea         edi,[eax+8]
 00568327    mov         dword ptr [esp],ecx
 0056832A    mov         esi,dword ptr [ebx+40]
>0056832D    jmp         00568360
 0056832F    mov         eax,dword ptr [ebx+0E8]
 00568335    push        eax
 00568336    mov         eax,dword ptr [esi+1C]
 00568339    shl         eax,3
 0056833C    imul        dword ptr [ebx+0E4]
 00568342    cdq
 00568343    idiv        eax,dword ptr [esi+8]
 00568346    mov         ecx,eax
 00568348    mov         eax,ebx
 0056834A    mov         edx,1
 0056834F    mov         ebp,dword ptr [eax+4]
 00568352    call        dword ptr [ebp+8]
 00568355    mov         dword ptr [edi],eax
 00568357    add         edi,4
 0056835A    inc         dword ptr [esp]
 0056835D    add         esi,54
 00568360    mov         eax,dword ptr [esp]
 00568363    cmp         eax,dword ptr [ebx+38]
>00568366    jl          0056832F
 00568368    pop         edx
 00568369    pop         ebp
 0056836A    pop         edi
 0056836B    pop         esi
 0056836C    pop         ebx
 0056836D    ret
*}
end;

//00568370
procedure _DF_.;
begin
{*
 00568370    cmp         dword ptr [eax+0F0],1
 00568377    mov         edx,dword ptr [eax+154]
>0056837D    jle         00568388
 0056837F    mov         dword ptr [edx+14],1
>00568386    jmp         005683AE
 00568388    mov         ecx,dword ptr [eax+0EC]
 0056838E    dec         ecx
 0056838F    cmp         ecx,dword ptr [edx+8]
>00568392    jbe         005683A2
 00568394    mov         eax,dword ptr [eax+0F4]
 0056839A    mov         eax,dword ptr [eax+0C]
 0056839D    mov         dword ptr [edx+14],eax
>005683A0    jmp         005683AE
 005683A2    mov         ecx,dword ptr [eax+0F4]
 005683A8    mov         eax,dword ptr [ecx+48]
 005683AB    mov         dword ptr [edx+14],eax
 005683AE    xor         ecx,ecx
 005683B0    xor         eax,eax
 005683B2    mov         dword ptr [edx+0C],ecx
 005683B5    mov         dword ptr [edx+10],eax
 005683B8    ret
*}
end;

//00568AAC
procedure @jinit_c_coef_controller;
begin
{*
 00568AAC    push        ebx
 00568AAD    push        esi
 00568AAE    mov         esi,eax
 00568AB0    push        edi
 00568AB1    mov         eax,esi
 00568AB3    push        ebp
 00568AB4    mov         ebx,edx
 00568AB6    mov         edx,1
 00568ABB    mov         edi,dword ptr [eax+4]
 00568ABE    add         esp,0FFFFFFF8
 00568AC1    mov         ecx,68
 00568AC6    call        dword ptr [edi]
 00568AC8    mov         dword ptr [esp],eax
 00568ACB    test        ebx,ebx
 00568ACD    mov         eax,dword ptr [esp]
 00568AD0    mov         dword ptr [esi+154],eax
 00568AD6    mov         edx,dword ptr [esp]
 00568AD9    mov         dword ptr [edx],5683BC
>00568ADF    je          00568B34
 00568AE1    xor         ecx,ecx
 00568AE3    mov         dword ptr [esp+4],ecx
 00568AE7    mov         ebx,dword ptr [esi+40]
 00568AEA    mov         eax,dword ptr [esp]
 00568AED    lea         edi,[eax+40]
>00568AF0    jmp         00568B29
 00568AF2    mov         edx,dword ptr [ebx+8]
 00568AF5    mov         eax,dword ptr [ebx+1C]
 00568AF8    call        @jround_up
 00568AFD    push        eax
 00568AFE    mov         edx,dword ptr [ebx+0C]
 00568B01    mov         eax,dword ptr [ebx+20]
 00568B04    call        @jround_up
 00568B09    push        eax
 00568B0A    mov         eax,esi
 00568B0C    mov         ecx,dword ptr [ebx+0C]
 00568B0F    mov         edx,1
 00568B14    push        ecx
 00568B15    xor         ecx,ecx
 00568B17    mov         ebp,dword ptr [eax+4]
 00568B1A    call        dword ptr [ebp+14]
 00568B1D    mov         dword ptr [edi],eax
 00568B1F    add         edi,4
 00568B22    inc         dword ptr [esp+4]
 00568B26    add         ebx,54
 00568B29    mov         eax,dword ptr [esi+38]
 00568B2C    cmp         eax,dword ptr [esp+4]
>00568B30    jg          00568AF2
>00568B32    jmp         00568B6A
 00568B34    mov         eax,esi
 00568B36    mov         ecx,500
 00568B3B    mov         edx,1
 00568B40    mov         ebx,dword ptr [eax+4]
 00568B43    call        dword ptr [ebx+4]
 00568B46    mov         ecx,eax
 00568B48    xor         eax,eax
 00568B4A    mov         edx,dword ptr [esp]
 00568B4D    add         edx,18
 00568B50    mov         ebx,eax
 00568B52    inc         eax
 00568B53    shl         ebx,7
 00568B56    add         ebx,ecx
 00568B58    mov         dword ptr [edx],ebx
 00568B5A    add         edx,4
 00568B5D    cmp         eax,0A
>00568B60    jl          00568B50
 00568B62    mov         eax,dword ptr [esp]
 00568B65    xor         edx,edx
 00568B67    mov         dword ptr [eax+40],edx
 00568B6A    pop         ecx
 00568B6B    pop         edx
 00568B6C    pop         ebp
 00568B6D    pop         edi
 00568B6E    pop         esi
 00568B6F    pop         ebx
 00568B70    ret
*}
end;

//00568B74
procedure _DF_.;
begin
{*
 00568B74    push        ebx
 00568B75    mov         ebx,eax
 00568B77    mov         eax,ebx
 00568B79    push        esi
 00568B7A    push        ecx
 00568B7B    mov         ecx,2000
 00568B80    mov         esi,dword ptr [ebx+15C]
 00568B86    mov         ebx,dword ptr [eax+4]
 00568B89    mov         edx,1
 00568B8E    call        dword ptr [ebx]
 00568B90    mov         dword ptr [esp],eax
 00568B93    mov         dword ptr [esi+8],eax
 00568B96    xor         edx,edx
 00568B98    mov         ecx,dword ptr [esp]
 00568B9B    mov         eax,ecx
 00568B9D    imul        ecx,edx,4C8B
 00568BA3    mov         dword ptr [eax],ecx
 00568BA5    imul        ecx,edx,9646
 00568BAB    mov         dword ptr [eax+400],ecx
 00568BB1    imul        ecx,edx,1D2F
 00568BB7    add         ecx,8000
 00568BBD    mov         dword ptr [eax+800],ecx
 00568BC3    imul        ecx,edx,0FFFFD4CD
 00568BC9    mov         dword ptr [eax+0C00],ecx
 00568BCF    imul        ecx,edx,0FFFFAB33
 00568BD5    mov         dword ptr [eax+1000],ecx
 00568BDB    mov         ecx,edx
 00568BDD    shl         ecx,0F
 00568BE0    add         ecx,807FFF
 00568BE6    mov         dword ptr [eax+1400],ecx
 00568BEC    imul        ecx,edx,0FFFF94D1
 00568BF2    mov         dword ptr [eax+1800],ecx
 00568BF8    imul        ecx,edx,0FFFFEB2F
 00568BFE    mov         dword ptr [eax+1C00],ecx
 00568C04    inc         edx
 00568C05    add         eax,4
 00568C08    cmp         edx,0FF
>00568C0E    jle         00568B9D
 00568C10    pop         edx
 00568C11    pop         esi
 00568C12    pop         ebx
 00568C13    ret
*}
end;

//00568FB0
procedure @jinit_color_converter;
begin
{*
 00568FB0    push        ebx
 00568FB1    mov         ebx,eax
 00568FB3    mov         eax,ebx
 00568FB5    push        esi
 00568FB6    mov         ecx,0C
 00568FBB    mov         edx,1
 00568FC0    mov         esi,dword ptr [eax+4]
 00568FC3    call        dword ptr [esi]
 00568FC5    mov         esi,eax
 00568FC7    mov         dword ptr [ebx+15C],esi
 00568FCD    mov         dword ptr [esi],568FAC
 00568FD3    mov         eax,dword ptr [ebx+28]
 00568FD6    dec         eax
>00568FD7    je          00568FE6
 00568FD9    dec         eax
 00568FDA    sub         eax,2
>00568FDD    jb          00568FFD
 00568FDF    sub         eax,2
>00568FE2    jb          00569014
>00568FE4    jmp         0056902B
 00568FE6    cmp         dword ptr [ebx+24],1
>00568FEA    je          00569040
 00568FEC    mov         edx,dword ptr [ebx]
 00568FEE    mov         eax,ebx
 00568FF0    mov         dword ptr [edx+14],9
 00568FF7    mov         edx,dword ptr [eax]
 00568FF9    call        dword ptr [edx]
>00568FFB    jmp         00569040
 00568FFD    cmp         dword ptr [ebx+24],3
>00569001    je          00569040
 00569003    mov         ecx,dword ptr [ebx]
 00569005    mov         eax,ebx
 00569007    mov         dword ptr [ecx+14],9
 0056900E    mov         edx,dword ptr [eax]
 00569010    call        dword ptr [edx]
>00569012    jmp         00569040
 00569014    cmp         dword ptr [ebx+24],4
>00569018    je          00569040
 0056901A    mov         ecx,dword ptr [ebx]
 0056901C    mov         eax,ebx
 0056901E    mov         dword ptr [ecx+14],9
 00569025    mov         edx,dword ptr [eax]
 00569027    call        dword ptr [edx]
>00569029    jmp         00569040
 0056902B    cmp         dword ptr [ebx+24],1
>0056902F    jge         00569040
 00569031    mov         ecx,dword ptr [ebx]
 00569033    mov         eax,ebx
 00569035    mov         dword ptr [ecx+14],9
 0056903C    mov         edx,dword ptr [eax]
 0056903E    call        dword ptr [edx]
 00569040    mov         ecx,dword ptr [ebx+3C]
 00569043    cmp         ecx,5
>00569046    ja          005691D0
 0056904C    jmp         dword ptr [ecx*4+569053]
 0056904C    dd          005691D0
 0056904C    dd          0056906B
 0056904C    dd          005690C8
 0056904C    dd          005690FF
 0056904C    dd          0056914C
 0056904C    dd          00569183
 0056906B    cmp         dword ptr [ebx+38],1
>0056906F    je          00569080
 00569071    mov         eax,dword ptr [ebx]
 00569073    mov         dword ptr [eax+14],0A
 0056907A    mov         eax,ebx
 0056907C    mov         edx,dword ptr [eax]
 0056907E    call        dword ptr [edx]
 00569080    cmp         dword ptr [ebx+28],1
>00569084    jne         00569090
 00569086    mov         dword ptr [esi+4],568EEC
 0056908D    pop         esi
 0056908E    pop         ebx
 0056908F    ret
 00569090    cmp         dword ptr [ebx+28],2
>00569094    jne         005690A6
 00569096    mov         dword ptr [esi],568B74;_DF_.
 0056909C    mov         dword ptr [esi+4],568D1C
 005690A3    pop         esi
 005690A4    pop         ebx
 005690A5    ret
 005690A6    cmp         dword ptr [ebx+28],3
>005690AA    jne         005690B6
 005690AC    mov         dword ptr [esi+4],568EEC
 005690B3    pop         esi
 005690B4    pop         ebx
 005690B5    ret
 005690B6    mov         ecx,dword ptr [ebx]
 005690B8    mov         eax,ebx
 005690BA    mov         dword ptr [ecx+14],1B
 005690C1    mov         edx,dword ptr [eax]
 005690C3    call        dword ptr [edx]
 005690C5    pop         esi
 005690C6    pop         ebx
 005690C7    ret
 005690C8    cmp         dword ptr [ebx+38],3
>005690CC    je          005690DD
 005690CE    mov         ecx,dword ptr [ebx]
 005690D0    mov         eax,ebx
 005690D2    mov         dword ptr [ecx+14],0A
 005690D9    mov         edx,dword ptr [eax]
 005690DB    call        dword ptr [edx]
 005690DD    cmp         dword ptr [ebx+28],2
>005690E1    jne         005690ED
 005690E3    mov         dword ptr [esi+4],568F38
 005690EA    pop         esi
 005690EB    pop         ebx
 005690EC    ret
 005690ED    mov         ecx,dword ptr [ebx]
 005690EF    mov         eax,ebx
 005690F1    mov         dword ptr [ecx+14],1B
 005690F8    mov         edx,dword ptr [eax]
 005690FA    call        dword ptr [edx]
 005690FC    pop         esi
 005690FD    pop         ebx
 005690FE    ret
 005690FF    cmp         dword ptr [ebx+38],3
>00569103    je          00569114
 00569105    mov         ecx,dword ptr [ebx]
 00569107    mov         eax,ebx
 00569109    mov         dword ptr [ecx+14],0A
 00569110    mov         edx,dword ptr [eax]
 00569112    call        dword ptr [edx]
 00569114    cmp         dword ptr [ebx+28],2
>00569118    jne         0056912A
 0056911A    mov         dword ptr [esi],568B74;_DF_.
 00569120    mov         dword ptr [esi+4],568C14
 00569127    pop         esi
 00569128    pop         ebx
 00569129    ret
 0056912A    cmp         dword ptr [ebx+28],3
>0056912E    jne         0056913A
 00569130    mov         dword ptr [esi+4],568F38
 00569137    pop         esi
 00569138    pop         ebx
 00569139    ret
 0056913A    mov         ecx,dword ptr [ebx]
 0056913C    mov         eax,ebx
 0056913E    mov         dword ptr [ecx+14],1B
 00569145    mov         edx,dword ptr [eax]
 00569147    call        dword ptr [edx]
 00569149    pop         esi
 0056914A    pop         ebx
 0056914B    ret
 0056914C    cmp         dword ptr [ebx+38],4
>00569150    je          00569161
 00569152    mov         ecx,dword ptr [ebx]
 00569154    mov         eax,ebx
 00569156    mov         dword ptr [ecx+14],0A
 0056915D    mov         edx,dword ptr [eax]
 0056915F    call        dword ptr [edx]
 00569161    cmp         dword ptr [ebx+28],4
>00569165    jne         00569171
 00569167    mov         dword ptr [esi+4],568F38
 0056916E    pop         esi
 0056916F    pop         ebx
 00569170    ret
 00569171    mov         ecx,dword ptr [ebx]
 00569173    mov         eax,ebx
 00569175    mov         dword ptr [ecx+14],1B
 0056917C    mov         edx,dword ptr [eax]
 0056917E    call        dword ptr [edx]
 00569180    pop         esi
 00569181    pop         ebx
 00569182    ret
 00569183    cmp         dword ptr [ebx+38],4
>00569187    je          00569198
 00569189    mov         ecx,dword ptr [ebx]
 0056918B    mov         eax,ebx
 0056918D    mov         dword ptr [ecx+14],0A
 00569194    mov         edx,dword ptr [eax]
 00569196    call        dword ptr [edx]
 00569198    cmp         dword ptr [ebx+28],4
>0056919C    jne         005691AE
 0056919E    mov         dword ptr [esi],568B74;_DF_.
 005691A4    mov         dword ptr [esi+4],568DA8
 005691AB    pop         esi
 005691AC    pop         ebx
 005691AD    ret
 005691AE    cmp         dword ptr [ebx+28],5
>005691B2    jne         005691BE
 005691B4    mov         dword ptr [esi+4],568F38
 005691BB    pop         esi
 005691BC    pop         ebx
 005691BD    ret
 005691BE    mov         ecx,dword ptr [ebx]
 005691C0    mov         eax,ebx
 005691C2    mov         dword ptr [ecx+14],1B
 005691C9    mov         edx,dword ptr [eax]
 005691CB    call        dword ptr [edx]
 005691CD    pop         esi
 005691CE    pop         ebx
 005691CF    ret
 005691D0    mov         ecx,dword ptr [ebx+3C]
 005691D3    cmp         ecx,dword ptr [ebx+28]
>005691D6    jne         005691E0
 005691D8    mov         eax,dword ptr [ebx+38]
 005691DB    cmp         eax,dword ptr [ebx+24]
>005691DE    je          005691EF
 005691E0    mov         edx,dword ptr [ebx]
 005691E2    mov         eax,ebx
 005691E4    mov         dword ptr [edx+14],1B
 005691EB    mov         edx,dword ptr [eax]
 005691ED    call        dword ptr [edx]
 005691EF    mov         dword ptr [esi+4],568F38
 005691F6    pop         esi
 005691F7    pop         ebx
 005691F8    ret
*}
end;

//005691FC
procedure _DF_.;
begin
{*
 005691FC    ret
*}
end;

//0056999C
procedure @jinit_downsampler;
begin
{*
 0056999C    push        ebx
 0056999D    push        esi
 0056999E    push        edi
 0056999F    push        ebp
 005699A0    add         esp,0FFFFFFF8
 005699A3    mov         ebx,eax
 005699A5    mov         eax,ebx
 005699A7    mov         ecx,34
 005699AC    mov         dword ptr [esp+4],1
 005699B4    mov         esi,dword ptr [eax+4]
 005699B7    mov         edx,1
 005699BC    call        dword ptr [esi]
 005699BE    mov         dword ptr [esp],eax
 005699C1    mov         eax,dword ptr [esp]
 005699C4    mov         dword ptr [ebx+160],eax
 005699CA    mov         edx,dword ptr [esp]
 005699CD    mov         dword ptr [edx],5691FC;_DF_.
 005699D3    mov         ecx,dword ptr [esp]
 005699D6    mov         dword ptr [ecx+4],569250
 005699DD    mov         eax,dword ptr [esp]
 005699E0    xor         edx,edx
 005699E2    mov         dword ptr [eax+8],edx
 005699E5    cmp         dword ptr [ebx+0B8],0
>005699EC    je          005699FD
 005699EE    mov         ecx,dword ptr [ebx]
 005699F0    mov         eax,ebx
 005699F2    mov         dword ptr [ecx+14],19
 005699F9    mov         edx,dword ptr [eax]
 005699FB    call        dword ptr [edx]
 005699FD    xor         ebp,ebp
 005699FF    mov         esi,dword ptr [ebx+40]
 00569A02    mov         eax,dword ptr [esp]
 00569A05    lea         edi,[eax+0C]
>00569A08    jmp         00569AEF
 00569A0D    mov         eax,dword ptr [esi+8]
 00569A10    cmp         eax,dword ptr [ebx+0E4]
>00569A16    jne         00569A4C
 00569A18    mov         edx,dword ptr [esi+0C]
 00569A1B    cmp         edx,dword ptr [ebx+0E8]
>00569A21    jne         00569A4C
 00569A23    cmp         dword ptr [ebx+0BC],0
>00569A2A    je          00569A41
 00569A2C    mov         dword ptr [edi],56980C
 00569A32    mov         ecx,dword ptr [esp]
 00569A35    mov         dword ptr [ecx+8],1
>00569A3C    jmp         00569AE8
 00569A41    mov         dword ptr [edi],5693E4
>00569A47    jmp         00569AE8
 00569A4C    mov         eax,dword ptr [esi+8]
 00569A4F    add         eax,eax
 00569A51    cmp         eax,dword ptr [ebx+0E4]
>00569A57    jne         00569A72
 00569A59    mov         edx,dword ptr [esi+0C]
 00569A5C    cmp         edx,dword ptr [ebx+0E8]
>00569A62    jne         00569A72
 00569A64    xor         ecx,ecx
 00569A66    mov         dword ptr [esp+4],ecx
 00569A6A    mov         dword ptr [edi],569430
>00569A70    jmp         00569AE8
 00569A72    mov         eax,dword ptr [esi+8]
 00569A75    add         eax,eax
 00569A77    cmp         eax,dword ptr [ebx+0E4]
>00569A7D    jne         00569AAF
 00569A7F    mov         edx,dword ptr [esi+0C]
 00569A82    add         edx,edx
 00569A84    cmp         edx,dword ptr [ebx+0E8]
>00569A8A    jne         00569AAF
 00569A8C    cmp         dword ptr [ebx+0BC],0
>00569A93    je          00569AA7
 00569A95    mov         dword ptr [edi],56957C
 00569A9B    mov         ecx,dword ptr [esp]
 00569A9E    mov         dword ptr [ecx+8],1
>00569AA5    jmp         00569AE8
 00569AA7    mov         dword ptr [edi],5694C4
>00569AAD    jmp         00569AE8
 00569AAF    mov         eax,dword ptr [ebx+0E4]
 00569AB5    cdq
 00569AB6    idiv        eax,dword ptr [esi+8]
 00569AB9    test        edx,edx
>00569ABB    jne         00569AD9
 00569ABD    mov         eax,dword ptr [ebx+0E8]
 00569AC3    cdq
 00569AC4    idiv        eax,dword ptr [esi+0C]
 00569AC7    test        edx,edx
>00569AC9    jne         00569AD9
 00569ACB    xor         ecx,ecx
 00569ACD    mov         dword ptr [esp+4],ecx
 00569AD1    mov         dword ptr [edi],5692D4
>00569AD7    jmp         00569AE8
 00569AD9    mov         eax,dword ptr [ebx]
 00569ADB    mov         dword ptr [eax+14],26
 00569AE2    mov         eax,ebx
 00569AE4    mov         edx,dword ptr [eax]
 00569AE6    call        dword ptr [edx]
 00569AE8    add         edi,4
 00569AEB    inc         ebp
 00569AEC    add         esi,54
 00569AEF    cmp         ebp,dword ptr [ebx+38]
>00569AF2    jl          00569A0D
 00569AF8    cmp         dword ptr [ebx+0BC],0
>00569AFF    je          00569B1A
 00569B01    cmp         dword ptr [esp+4],0
>00569B06    jne         00569B1A
 00569B08    mov         ecx,dword ptr [ebx]
 00569B0A    mov         eax,ebx
 00569B0C    xor         edx,edx
 00569B0E    mov         dword ptr [ecx+14],63
 00569B15    mov         ecx,dword ptr [eax]
 00569B17    call        dword ptr [ecx+4]
 00569B1A    pop         ecx
 00569B1B    pop         edx
 00569B1C    pop         ebp
 00569B1D    pop         edi
 00569B1E    pop         esi
 00569B1F    pop         ebx
 00569B20    ret
*}
end;

//00569B24
procedure _DF_.;
begin
{*
 00569B24    push        ebx
 00569B25    push        esi
 00569B26    push        edi
 00569B27    add         esp,0FFFFFFD8
 00569B2A    xor         ecx,ecx
 00569B2C    mov         dword ptr [esp],eax
 00569B2F    mov         eax,dword ptr [esp]
 00569B32    mov         edx,dword ptr [eax+164]
 00569B38    mov         dword ptr [esp+4],edx
 00569B3C    mov         dword ptr [esp+8],ecx
 00569B40    mov         eax,dword ptr [esp]
 00569B43    mov         edx,dword ptr [eax+40]
 00569B46    mov         dword ptr [esp+0C],edx
>00569B4A    jmp         00569CBD
 00569B4F    mov         ecx,dword ptr [esp+0C]
 00569B53    mov         ebx,dword ptr [ecx+10]
 00569B56    test        ebx,ebx
>00569B58    jl          00569B69
 00569B5A    cmp         ebx,4
>00569B5D    jge         00569B69
 00569B5F    mov         eax,dword ptr [esp]
 00569B62    cmp         dword ptr [eax+ebx*4+44],0
>00569B67    jne         00569B7F
 00569B69    mov         edx,dword ptr [esp]
 00569B6C    mov         eax,dword ptr [edx]
 00569B6E    mov         dword ptr [eax+14],34
 00569B75    mov         dword ptr [eax+18],ebx
 00569B78    mov         eax,dword ptr [esp]
 00569B7B    mov         edx,dword ptr [eax]
 00569B7D    call        dword ptr [edx]
 00569B7F    mov         ecx,dword ptr [esp]
 00569B82    mov         eax,dword ptr [ecx+ebx*4+44]
 00569B86    mov         dword ptr [esp+10],eax
 00569B8A    mov         edx,dword ptr [esp]
 00569B8D    mov         ecx,dword ptr [edx+0C0]
 00569B93    dec         ecx
>00569B94    je          00569B9E
 00569B96    dec         ecx
>00569B97    je          00569C00
>00569B99    jmp         00569CA1
 00569B9E    mov         eax,dword ptr [esp+4]
 00569BA2    cmp         dword ptr [eax+ebx*4+0C],0
>00569BA7    jne         00569BC3
 00569BA9    mov         eax,dword ptr [esp]
 00569BAC    mov         ecx,100
 00569BB1    mov         edx,1
 00569BB6    mov         esi,dword ptr [eax+4]
 00569BB9    call        dword ptr [esi]
 00569BBB    mov         edx,dword ptr [esp+4]
 00569BBF    mov         dword ptr [edx+ebx*4+0C],eax
 00569BC3    mov         eax,dword ptr [esp+4]
 00569BC7    xor         esi,esi
 00569BC9    mov         edx,7897BC
 00569BCE    mov         eax,dword ptr [eax+ebx*4+0C]
 00569BD2    mov         ecx,eax
 00569BD4    mov         eax,dword ptr [esp+10]
 00569BD8    movsx       edi,word ptr [edx]
 00569BDB    movzx       ebx,word ptr [eax]
 00569BDE    imul        ebx,edi
 00569BE1    add         ebx,400
 00569BE7    add         eax,2
 00569BEA    sar         ebx,0B
 00569BED    add         edx,2
 00569BF0    mov         dword ptr [ecx],ebx
 00569BF2    add         ecx,4
 00569BF5    inc         esi
 00569BF6    cmp         esi,40
>00569BF9    jl          00569BD8
>00569BFB    jmp         00569CB4
 00569C00    mov         eax,dword ptr [esp+4]
 00569C04    cmp         dword ptr [eax+ebx*4+20],0
>00569C09    jne         00569C25
 00569C0B    mov         eax,dword ptr [esp]
 00569C0E    mov         ecx,100
 00569C13    mov         edx,1
 00569C18    mov         esi,dword ptr [eax+4]
 00569C1B    call        dword ptr [esi]
 00569C1D    mov         edx,dword ptr [esp+4]
 00569C21    mov         dword ptr [edx+ebx*4+20],eax
 00569C25    mov         eax,dword ptr [esp+4]
 00569C29    xor         esi,esi
 00569C2B    mov         ecx,dword ptr [eax+ebx*4+20]
 00569C2F    xor         eax,eax
 00569C31    mov         dword ptr [esp+14],ecx
 00569C35    mov         dword ptr [esp+18],eax
 00569C39    mov         dword ptr [esp+20],78983C
 00569C41    xor         ebx,ebx
 00569C43    mov         eax,dword ptr [esp+14]
 00569C47    lea         ecx,[eax+esi*4]
 00569C4A    mov         edx,78983C
 00569C4F    mov         eax,dword ptr [esp+20]
 00569C53    mov         dword ptr [esp+1C],eax
 00569C57    mov         eax,dword ptr [esp+10]
 00569C5B    lea         eax,[eax+esi*2]
 00569C5E    movzx       edi,word ptr [eax]
 00569C61    mov         dword ptr [esp+24],edi
 00569C65    fild        dword ptr [esp+24]
 00569C69    mov         edi,dword ptr [esp+1C]
 00569C6D    fmul        qword ptr [edi]
 00569C6F    fmul        qword ptr [edx]
 00569C71    fmul        dword ptr ds:[569CD4]
 00569C77    fdivr       dword ptr ds:[569CD8]
 00569C7D    fstp        dword ptr [ecx]
 00569C7F    inc         esi
 00569C80    add         ecx,4
 00569C83    add         eax,2
 00569C86    inc         ebx
 00569C87    add         edx,8
 00569C8A    cmp         ebx,8
>00569C8D    jl          00569C5E
 00569C8F    inc         dword ptr [esp+18]
 00569C93    add         dword ptr [esp+20],8
 00569C98    cmp         dword ptr [esp+18],8
>00569C9D    jl          00569C41
>00569C9F    jmp         00569CB4
 00569CA1    mov         eax,dword ptr [esp]
 00569CA4    mov         edx,dword ptr [eax]
 00569CA6    mov         dword ptr [edx+14],30
 00569CAD    mov         eax,dword ptr [esp]
 00569CB0    mov         edx,dword ptr [eax]
 00569CB2    call        dword ptr [edx]
 00569CB4    inc         dword ptr [esp+8]
 00569CB8    add         dword ptr [esp+0C],54
 00569CBD    mov         ecx,dword ptr [esp]
 00569CC0    mov         eax,dword ptr [ecx+38]
 00569CC3    cmp         eax,dword ptr [esp+8]
>00569CC7    jg          00569B4F
 00569CCD    add         esp,28
 00569CD0    pop         edi
 00569CD1    pop         esi
 00569CD2    pop         ebx
 00569CD3    ret
*}
end;

//00569FC0
procedure @jinit_forward_dct;
begin
{*
 00569FC0    push        ebx
 00569FC1    push        esi
 00569FC2    mov         esi,eax
 00569FC4    mov         ecx,30
 00569FC9    mov         edx,1
 00569FCE    mov         eax,esi
 00569FD0    mov         ebx,dword ptr [eax+4]
 00569FD3    call        dword ptr [ebx]
 00569FD5    mov         ebx,eax
 00569FD7    mov         dword ptr [esi+164],ebx
 00569FDD    mov         dword ptr [ebx],569B24;_DF_.
 00569FE3    mov         eax,dword ptr [esi+0C0]
 00569FE9    dec         eax
>00569FEA    je          00569FF1
 00569FEC    dec         eax
>00569FED    je          0056A001
>00569FEF    jmp         0056A011
 00569FF1    mov         dword ptr [ebx+4],569CDC
 00569FF8    mov         dword ptr [ebx+8],56AB10;@jpeg_fdct_ifast
>00569FFF    jmp         0056A020
 0056A001    mov         dword ptr [ebx+4],569E30
 0056A008    mov         dword ptr [ebx+1C],56AD7C;@jpeg_fdct_float
>0056A00F    jmp         0056A020
 0056A011    mov         edx,dword ptr [esi]
 0056A013    mov         eax,esi
 0056A015    mov         dword ptr [edx+14],30
 0056A01C    mov         edx,dword ptr [eax]
 0056A01E    call        dword ptr [edx]
 0056A020    xor         edx,edx
 0056A022    lea         eax,[ebx+0C]
 0056A025    xor         ecx,ecx
 0056A027    inc         edx
 0056A028    mov         dword ptr [eax],ecx
 0056A02A    xor         ecx,ecx
 0056A02C    mov         dword ptr [eax+14],ecx
 0056A02F    add         eax,4
 0056A032    cmp         edx,4
>0056A035    jl          0056A025
 0056A037    pop         esi
 0056A038    pop         ebx
 0056A039    ret
*}
end;

//0056A03C
procedure _DF_.;
begin
{*
 0056A03C    push        ebx
 0056A03D    push        esi
 0056A03E    push        edi
 0056A03F    push        ebp
 0056A040    add         esp,0FFFFFFEC
 0056A043    mov         edi,eax
 0056A045    mov         dword ptr [esp],edx
 0056A048    mov         ebx,dword ptr [edi+168]
 0056A04E    mov         dword ptr [ebx+20],edi
 0056A051    mov         eax,dword ptr [esp]
 0056A054    mov         dword ptr [ebx+0C],eax
 0056A057    cmp         dword ptr [edi+138],0
 0056A05E    sete        dl
 0056A061    and         edx,1
 0056A064    mov         dword ptr [esp+4],edx
 0056A068    cmp         dword ptr [edi+140],0
>0056A06F    jne         0056A08A
 0056A071    cmp         dword ptr [esp+4],0
>0056A076    je          0056A081
 0056A078    mov         dword ptr [ebx+4],56A3EC
>0056A07F    jmp         0056A0BB
 0056A081    mov         dword ptr [ebx+4],56A520
>0056A088    jmp         0056A0BB
 0056A08A    cmp         dword ptr [esp+4],0
>0056A08F    je          0056A09A
 0056A091    mov         dword ptr [ebx+4],56A6CC
>0056A098    jmp         0056A0BB
 0056A09A    mov         dword ptr [ebx+4],56A774
 0056A0A1    cmp         dword ptr [ebx+40],0
>0056A0A5    jne         0056A0BB
 0056A0A7    mov         eax,edi
 0056A0A9    mov         ecx,3E8
 0056A0AE    mov         edx,1
 0056A0B3    mov         esi,dword ptr [eax+4]
 0056A0B6    call        dword ptr [esi]
 0056A0B8    mov         dword ptr [ebx+40],eax
 0056A0BB    cmp         dword ptr [esp],0
>0056A0BF    je          0056A0CA
 0056A0C1    mov         dword ptr [ebx+8],56AA0C
>0056A0C8    jmp         0056A0D1
 0056A0CA    mov         dword ptr [ebx+8],56A9D0
 0056A0D1    xor         eax,eax
 0056A0D3    mov         dword ptr [esp+8],eax
 0056A0D7    lea         edx,[ebx+24]
 0056A0DA    mov         dword ptr [esp+10],edx
 0056A0DE    lea         ecx,[edi+0F4]
 0056A0E4    mov         dword ptr [esp+0C],ecx
>0056A0E8    jmp         0056A18A
 0056A0ED    mov         eax,dword ptr [esp+0C]
 0056A0F1    mov         edx,dword ptr [esp+10]
 0056A0F5    xor         ecx,ecx
 0056A0F7    mov         eax,dword ptr [eax]
 0056A0F9    mov         dword ptr [edx],ecx
 0056A0FB    cmp         dword ptr [esp+4],0
>0056A100    je          0056A110
 0056A102    cmp         dword ptr [edi+140],0
>0056A109    jne         0056A17C
 0056A10B    mov         esi,dword ptr [eax+14]
>0056A10E    jmp         0056A116
 0056A110    mov         esi,dword ptr [eax+18]
 0056A113    mov         dword ptr [ebx+34],esi
 0056A116    cmp         dword ptr [esp],0
>0056A11A    je          0056A16A
 0056A11C    test        esi,esi
>0056A11E    jl          0056A125
 0056A120    cmp         esi,4
>0056A123    jl          0056A137
 0056A125    mov         eax,dword ptr [edi]
 0056A127    mov         dword ptr [eax+14],32
 0056A12E    mov         dword ptr [eax+18],esi
 0056A131    mov         eax,edi
 0056A133    mov         edx,dword ptr [eax]
 0056A135    call        dword ptr [edx]
 0056A137    cmp         dword ptr [ebx+esi*4+5C],0
>0056A13C    jne         0056A154
 0056A13E    mov         eax,edi
 0056A140    mov         ecx,404
 0056A145    mov         edx,1
 0056A14A    mov         ebp,dword ptr [eax+4]
 0056A14D    call        dword ptr [ebp]
 0056A150    mov         dword ptr [ebx+esi*4+5C],eax
 0056A154    push        404
 0056A159    push        0
 0056A15B    mov         eax,dword ptr [ebx+esi*4+5C]
 0056A15F    push        eax
 0056A160    call        _memset
 0056A165    add         esp,0C
>0056A168    jmp         0056A17C
 0056A16A    lea         edx,[ebx+esi*4+4C]
 0056A16E    mov         ecx,esi
 0056A170    push        edx
 0056A171    mov         eax,edi
 0056A173    mov         edx,dword ptr [esp+8]
 0056A177    call        @jpeg_make_c_derived_tbl
 0056A17C    inc         dword ptr [esp+8]
 0056A180    add         dword ptr [esp+10],4
 0056A185    add         dword ptr [esp+0C],4
 0056A18A    mov         ecx,dword ptr [edi+0F0]
 0056A190    cmp         ecx,dword ptr [esp+8]
>0056A194    jg          0056A0ED
 0056A19A    xor         eax,eax
 0056A19C    xor         edx,edx
 0056A19E    mov         dword ptr [ebx+38],eax
 0056A1A1    mov         dword ptr [ebx+3C],edx
 0056A1A4    xor         ecx,ecx
 0056A1A6    xor         eax,eax
 0056A1A8    mov         dword ptr [ebx+18],ecx
 0056A1AB    mov         dword ptr [ebx+1C],eax
 0056A1AE    mov         edx,dword ptr [edi+0C4]
 0056A1B4    xor         ecx,ecx
 0056A1B6    mov         dword ptr [ebx+44],edx
 0056A1B9    mov         dword ptr [ebx+48],ecx
 0056A1BC    add         esp,14
 0056A1BF    pop         ebp
 0056A1C0    pop         edi
 0056A1C1    pop         esi
 0056A1C2    pop         ebx
 0056A1C3    ret
*}
end;

//0056AACC
procedure @jinit_phuff_encoder;
begin
{*
 0056AACC    push        ebx
 0056AACD    mov         ebx,eax
 0056AACF    mov         eax,ebx
 0056AAD1    push        esi
 0056AAD2    mov         ecx,6C
 0056AAD7    mov         edx,1
 0056AADC    mov         esi,dword ptr [eax+4]
 0056AADF    call        dword ptr [esi]
 0056AAE1    mov         ecx,eax
 0056AAE3    xor         edx,edx
 0056AAE5    mov         dword ptr [ebx+168],ecx
 0056AAEB    mov         dword ptr [ecx],56A03C;_DF_.
 0056AAF1    lea         eax,[ecx+4C]
 0056AAF4    xor         ebx,ebx
 0056AAF6    inc         edx
 0056AAF7    mov         dword ptr [eax],ebx
 0056AAF9    xor         ebx,ebx
 0056AAFB    mov         dword ptr [eax+10],ebx
 0056AAFE    add         eax,4
 0056AB01    cmp         edx,4
>0056AB04    jl          0056AAF4
 0056AB06    xor         eax,eax
 0056AB08    mov         dword ptr [ecx+40],eax
 0056AB0B    pop         esi
 0056AB0C    pop         ebx
 0056AB0D    ret
*}
end;

//0056AB10
procedure @jpeg_fdct_ifast;
begin
{*
 0056AB10    push        ebx
 0056AB11    push        esi
 0056AB12    push        edi
 0056AB13    push        ebp
 0056AB14    add         esp,0FFFFFFE8
 0056AB17    mov         dword ptr [esp],eax
 0056AB1A    mov         eax,dword ptr [esp]
 0056AB1D    mov         dword ptr [esp+14],7
 0056AB25    mov         edx,dword ptr [eax]
 0056AB27    mov         ebx,dword ptr [eax+1C]
 0056AB2A    mov         ecx,edx
 0056AB2C    mov         esi,edx
 0056AB2E    mov         edx,dword ptr [eax+4]
 0056AB31    sub         esi,ebx
 0056AB33    add         ecx,ebx
 0056AB35    mov         edi,dword ptr [eax+18]
 0056AB38    mov         ebx,edx
 0056AB3A    sub         edx,edi
 0056AB3C    mov         dword ptr [esp+10],edx
 0056AB40    add         ebx,edi
 0056AB42    mov         edx,dword ptr [eax+8]
 0056AB45    mov         edi,dword ptr [eax+14]
 0056AB48    mov         ebp,edx
 0056AB4A    sub         edx,edi
 0056AB4C    add         ebp,edi
 0056AB4E    mov         dword ptr [esp+4],ebp
 0056AB52    mov         dword ptr [esp+0C],edx
 0056AB56    mov         edx,dword ptr [eax+0C]
 0056AB59    mov         edi,edx
 0056AB5B    add         edi,dword ptr [eax+10]
 0056AB5E    sub         edx,dword ptr [eax+10]
 0056AB61    mov         dword ptr [esp+8],edx
 0056AB65    lea         edx,[edi+ecx]
 0056AB68    sub         ecx,edi
 0056AB6A    mov         edi,ecx
 0056AB6C    mov         ecx,dword ptr [esp+4]
 0056AB70    add         ecx,ebx
 0056AB72    sub         ebx,dword ptr [esp+4]
 0056AB76    lea         ebp,[ecx+edx]
 0056AB79    sub         edx,ecx
 0056AB7B    mov         dword ptr [eax],ebp
 0056AB7D    mov         dword ptr [eax+10],edx
 0056AB80    lea         edx,[edi+ebx]
 0056AB83    mov         ecx,edx
 0056AB85    lea         edx,[ecx+edx*4]
 0056AB88    lea         edx,[ecx+edx*2]
 0056AB8B    lea         edx,[ecx+edx*4]
 0056AB8E    lea         edx,[ecx+edx*4]
 0056AB91    sar         edx,8
 0056AB94    lea         ecx,[edx+edi]
 0056AB97    sub         edi,edx
 0056AB99    mov         dword ptr [eax+8],ecx
 0056AB9C    mov         dword ptr [eax+18],edi
 0056AB9F    mov         edx,dword ptr [esp+8]
 0056ABA3    mov         ebx,dword ptr [esp+10]
 0056ABA7    add         edx,dword ptr [esp+0C]
 0056ABAB    add         ebx,esi
 0056ABAD    mov         edi,edx
 0056ABAF    mov         ecx,dword ptr [esp+0C]
 0056ABB3    sub         edi,ebx
 0056ABB5    add         ecx,dword ptr [esp+10]
 0056ABB9    mov         ebp,edi
 0056ABBB    lea         edi,[ebp+edi*2]
 0056ABBF    shl         edi,4
 0056ABC2    add         edi,ebp
 0056ABC4    mov         ebp,edx
 0056ABC6    shl         edx,4
 0056ABC9    add         edi,edi
 0056ABCB    add         edx,ebp
 0056ABCD    sar         edi,8
 0056ABD0    lea         edx,[ebp+edx*4]
 0056ABD4    lea         edx,[ebp+edx*2]
 0056ABD8    mov         ebp,ebx
 0056ABDA    sar         edx,8
 0056ABDD    add         edx,edi
 0056ABDF    lea         ebx,[ebp+ebx*4]
 0056ABE3    lea         ebx,[ebp+ebx*4]
 0056ABE7    shl         ebx,3
 0056ABEA    sub         ebx,ebp
 0056ABEC    add         ebx,ebx
 0056ABEE    sar         ebx,8
 0056ABF1    add         edi,ebx
 0056ABF3    mov         ebx,edi
 0056ABF5    mov         edi,ecx
 0056ABF7    lea         ecx,[edi+ecx*4]
 0056ABFA    lea         ecx,[edi+ecx*2]
 0056ABFD    lea         ecx,[edi+ecx*4]
 0056AC00    lea         ecx,[edi+ecx*4]
 0056AC03    sar         ecx,8
 0056AC06    lea         edi,[ecx+esi]
 0056AC09    sub         esi,ecx
 0056AC0B    mov         ecx,esi
 0056AC0D    lea         esi,[edx+ecx]
 0056AC10    sub         ecx,edx
 0056AC12    mov         dword ptr [eax+14],esi
 0056AC15    mov         dword ptr [eax+0C],ecx
 0056AC18    lea         edx,[ebx+edi]
 0056AC1B    sub         edi,ebx
 0056AC1D    mov         dword ptr [eax+4],edx
 0056AC20    mov         dword ptr [eax+1C],edi
 0056AC23    dec         dword ptr [esp+14]
 0056AC27    add         eax,20
 0056AC2A    cmp         dword ptr [esp+14],0
>0056AC2F    jge         0056AB25
 0056AC35    mov         eax,dword ptr [esp]
 0056AC38    mov         dword ptr [esp+14],7
 0056AC40    mov         edx,dword ptr [eax]
 0056AC42    mov         ebx,dword ptr [eax+0E0]
 0056AC48    mov         ecx,edx
 0056AC4A    mov         esi,edx
 0056AC4C    sub         esi,ebx
 0056AC4E    add         ecx,ebx
 0056AC50    mov         ebx,dword ptr [eax+20]
 0056AC53    mov         edx,dword ptr [eax+20]
 0056AC56    add         ebx,dword ptr [eax+0C0]
 0056AC5C    sub         edx,dword ptr [eax+0C0]
 0056AC62    mov         dword ptr [esp+10],edx
 0056AC66    mov         edx,dword ptr [eax+40]
 0056AC69    add         edx,dword ptr [eax+0A0]
 0056AC6F    mov         dword ptr [esp+4],edx
 0056AC73    mov         edx,dword ptr [eax+40]
 0056AC76    sub         edx,dword ptr [eax+0A0]
 0056AC7C    mov         dword ptr [esp+0C],edx
 0056AC80    mov         edi,dword ptr [eax+60]
 0056AC83    mov         edx,dword ptr [eax+60]
 0056AC86    add         edi,dword ptr [eax+80]
 0056AC8C    sub         edx,dword ptr [eax+80]
 0056AC92    mov         dword ptr [esp+8],edx
 0056AC96    lea         edx,[edi+ecx]
 0056AC99    sub         ecx,edi
 0056AC9B    mov         edi,ecx
 0056AC9D    mov         ecx,dword ptr [esp+4]
 0056ACA1    add         ecx,ebx
 0056ACA3    sub         ebx,dword ptr [esp+4]
 0056ACA7    lea         ebp,[ecx+edx]
 0056ACAA    sub         edx,ecx
 0056ACAC    mov         dword ptr [eax],ebp
 0056ACAE    mov         dword ptr [eax+80],edx
 0056ACB4    lea         edx,[edi+ebx]
 0056ACB7    mov         ecx,edx
 0056ACB9    lea         edx,[ecx+edx*4]
 0056ACBC    lea         edx,[ecx+edx*2]
 0056ACBF    lea         edx,[ecx+edx*4]
 0056ACC2    lea         edx,[ecx+edx*4]
 0056ACC5    sar         edx,8
 0056ACC8    lea         ecx,[edx+edi]
 0056ACCB    sub         edi,edx
 0056ACCD    mov         dword ptr [eax+40],ecx
 0056ACD0    mov         dword ptr [eax+0C0],edi
 0056ACD6    mov         edx,dword ptr [esp+8]
 0056ACDA    mov         ebx,dword ptr [esp+10]
 0056ACDE    add         edx,dword ptr [esp+0C]
 0056ACE2    add         ebx,esi
 0056ACE4    mov         edi,edx
 0056ACE6    mov         ecx,dword ptr [esp+0C]
 0056ACEA    sub         edi,ebx
 0056ACEC    add         ecx,dword ptr [esp+10]
 0056ACF0    mov         ebp,edi
 0056ACF2    lea         edi,[ebp+edi*2]
 0056ACF6    shl         edi,4
 0056ACF9    add         edi,ebp
 0056ACFB    mov         ebp,edx
 0056ACFD    shl         edx,4
 0056AD00    add         edi,edi
 0056AD02    add         edx,ebp
 0056AD04    sar         edi,8
 0056AD07    lea         edx,[ebp+edx*4]
 0056AD0B    lea         edx,[ebp+edx*2]
 0056AD0F    mov         ebp,ebx
 0056AD11    sar         edx,8
 0056AD14    add         edx,edi
 0056AD16    lea         ebx,[ebp+ebx*4]
 0056AD1A    lea         ebx,[ebp+ebx*4]
 0056AD1E    shl         ebx,3
 0056AD21    sub         ebx,ebp
 0056AD23    add         ebx,ebx
 0056AD25    sar         ebx,8
 0056AD28    add         edi,ebx
 0056AD2A    mov         ebx,edi
 0056AD2C    mov         edi,ecx
 0056AD2E    lea         ecx,[edi+ecx*4]
 0056AD31    lea         ecx,[edi+ecx*2]
 0056AD34    lea         ecx,[edi+ecx*4]
 0056AD37    lea         ecx,[edi+ecx*4]
 0056AD3A    sar         ecx,8
 0056AD3D    lea         edi,[ecx+esi]
 0056AD40    sub         esi,ecx
 0056AD42    mov         ecx,esi
 0056AD44    lea         esi,[edx+ecx]
 0056AD47    sub         ecx,edx
 0056AD49    mov         dword ptr [eax+0A0],esi
 0056AD4F    mov         dword ptr [eax+60],ecx
 0056AD52    lea         edx,[ebx+edi]
 0056AD55    sub         edi,ebx
 0056AD57    mov         dword ptr [eax+20],edx
 0056AD5A    mov         dword ptr [eax+0E0],edi
 0056AD60    dec         dword ptr [esp+14]
 0056AD64    add         eax,4
 0056AD67    cmp         dword ptr [esp+14],0
>0056AD6C    jge         0056AC40
 0056AD72    add         esp,18
 0056AD75    pop         ebp
 0056AD76    pop         edi
 0056AD77    pop         esi
 0056AD78    pop         ebx
 0056AD79    ret
*}
end;

//0056AD7C
procedure @jpeg_fdct_float;
begin
{*
 0056AD7C    add         esp,0FFFFFFB4
 0056AD7F    mov         edx,eax
 0056AD81    mov         ecx,7
 0056AD86    fld         dword ptr [edx]
 0056AD88    fadd        dword ptr [edx+1C]
 0056AD8B    fstp        dword ptr [esp]
 0056AD8E    fld         dword ptr [edx]
 0056AD90    fsub        dword ptr [edx+1C]
 0056AD93    fstp        dword ptr [esp+1C]
 0056AD97    fld         dword ptr [edx+4]
 0056AD9A    fadd        dword ptr [edx+18]
 0056AD9D    fstp        dword ptr [esp+4]
 0056ADA1    fld         dword ptr [edx+4]
 0056ADA4    fsub        dword ptr [edx+18]
 0056ADA7    fstp        dword ptr [esp+18]
 0056ADAB    fld         dword ptr [edx+8]
 0056ADAE    fadd        dword ptr [edx+14]
 0056ADB1    fstp        dword ptr [esp+8]
 0056ADB5    fld         dword ptr [edx+8]
 0056ADB8    fsub        dword ptr [edx+14]
 0056ADBB    fstp        dword ptr [esp+14]
 0056ADBF    fld         dword ptr [edx+0C]
 0056ADC2    fadd        dword ptr [edx+10]
 0056ADC5    fstp        dword ptr [esp+0C]
 0056ADC9    fld         dword ptr [edx+0C]
 0056ADCC    fsub        dword ptr [edx+10]
 0056ADCF    fstp        dword ptr [esp+10]
 0056ADD3    fld         dword ptr [esp]
 0056ADD6    fadd        dword ptr [esp+0C]
 0056ADDA    fstp        dword ptr [esp+20]
 0056ADDE    fld         dword ptr [esp]
 0056ADE1    fsub        dword ptr [esp+0C]
 0056ADE5    fstp        dword ptr [esp+2C]
 0056ADE9    fld         dword ptr [esp+4]
 0056ADED    fadd        dword ptr [esp+8]
 0056ADF1    fstp        dword ptr [esp+24]
 0056ADF5    fld         dword ptr [esp+4]
 0056ADF9    fsub        dword ptr [esp+8]
 0056ADFD    fstp        dword ptr [esp+28]
 0056AE01    fld         dword ptr [esp+20]
 0056AE05    fadd        dword ptr [esp+24]
 0056AE09    fstp        dword ptr [edx]
 0056AE0B    fld         dword ptr [esp+20]
 0056AE0F    fsub        dword ptr [esp+24]
 0056AE13    fstp        dword ptr [edx+10]
 0056AE16    fld         dword ptr [esp+28]
 0056AE1A    fadd        dword ptr [esp+2C]
 0056AE1E    fmul        dword ptr ds:[56B098]
 0056AE24    fstp        dword ptr [esp+30]
 0056AE28    fld         dword ptr [esp+2C]
 0056AE2C    fadd        dword ptr [esp+30]
 0056AE30    fstp        dword ptr [edx+8]
 0056AE33    fld         dword ptr [esp+2C]
 0056AE37    fsub        dword ptr [esp+30]
 0056AE3B    fstp        dword ptr [edx+18]
 0056AE3E    fld         dword ptr [esp+10]
 0056AE42    fadd        dword ptr [esp+14]
 0056AE46    fstp        dword ptr [esp+20]
 0056AE4A    fld         dword ptr [esp+14]
 0056AE4E    fadd        dword ptr [esp+18]
 0056AE52    fstp        dword ptr [esp+24]
 0056AE56    fld         dword ptr [esp+18]
 0056AE5A    fadd        dword ptr [esp+1C]
 0056AE5E    fstp        dword ptr [esp+28]
 0056AE62    fld         dword ptr [esp+20]
 0056AE66    fsub        dword ptr [esp+28]
 0056AE6A    fmul        dword ptr ds:[56B09C]
 0056AE70    fstp        dword ptr [esp+40]
 0056AE74    fld         dword ptr ds:[56B0A0]
 0056AE7A    fmul        dword ptr [esp+20]
 0056AE7E    fadd        dword ptr [esp+40]
 0056AE82    fstp        dword ptr [esp+34]
 0056AE86    fld         dword ptr ds:[56B0A4]
 0056AE8C    fmul        dword ptr [esp+28]
 0056AE90    fadd        dword ptr [esp+40]
 0056AE94    fstp        dword ptr [esp+3C]
 0056AE98    fld         dword ptr [esp+24]
 0056AE9C    fmul        dword ptr ds:[56B098]
 0056AEA2    fstp        dword ptr [esp+38]
 0056AEA6    fld         dword ptr [esp+1C]
 0056AEAA    fadd        dword ptr [esp+38]
 0056AEAE    fstp        dword ptr [esp+44]
 0056AEB2    fld         dword ptr [esp+1C]
 0056AEB6    fsub        dword ptr [esp+38]
 0056AEBA    fstp        dword ptr [esp+48]
 0056AEBE    fld         dword ptr [esp+48]
 0056AEC2    fadd        dword ptr [esp+34]
 0056AEC6    fstp        dword ptr [edx+14]
 0056AEC9    fld         dword ptr [esp+48]
 0056AECD    fsub        dword ptr [esp+34]
 0056AED1    fstp        dword ptr [edx+0C]
 0056AED4    fld         dword ptr [esp+44]
 0056AED8    fadd        dword ptr [esp+3C]
 0056AEDC    fstp        dword ptr [edx+4]
 0056AEDF    fld         dword ptr [esp+44]
 0056AEE3    fsub        dword ptr [esp+3C]
 0056AEE7    fstp        dword ptr [edx+1C]
 0056AEEA    add         edx,20
 0056AEED    dec         ecx
 0056AEEE    test        ecx,ecx
>0056AEF0    jge         0056AD86
 0056AEF6    mov         edx,eax
 0056AEF8    mov         ecx,7
 0056AEFD    fld         dword ptr [edx]
 0056AEFF    fadd        dword ptr [edx+0E0]
 0056AF05    fstp        dword ptr [esp]
 0056AF08    fld         dword ptr [edx]
 0056AF0A    fsub        dword ptr [edx+0E0]
 0056AF10    fstp        dword ptr [esp+1C]
 0056AF14    fld         dword ptr [edx+20]
 0056AF17    fadd        dword ptr [edx+0C0]
 0056AF1D    fstp        dword ptr [esp+4]
 0056AF21    fld         dword ptr [edx+20]
 0056AF24    fsub        dword ptr [edx+0C0]
 0056AF2A    fstp        dword ptr [esp+18]
 0056AF2E    fld         dword ptr [edx+40]
 0056AF31    fadd        dword ptr [edx+0A0]
 0056AF37    fstp        dword ptr [esp+8]
 0056AF3B    fld         dword ptr [edx+40]
 0056AF3E    fsub        dword ptr [edx+0A0]
 0056AF44    fstp        dword ptr [esp+14]
 0056AF48    fld         dword ptr [edx+60]
 0056AF4B    fadd        dword ptr [edx+80]
 0056AF51    fstp        dword ptr [esp+0C]
 0056AF55    fld         dword ptr [edx+60]
 0056AF58    fsub        dword ptr [edx+80]
 0056AF5E    fstp        dword ptr [esp+10]
 0056AF62    fld         dword ptr [esp]
 0056AF65    fadd        dword ptr [esp+0C]
 0056AF69    fstp        dword ptr [esp+20]
 0056AF6D    fld         dword ptr [esp]
 0056AF70    fsub        dword ptr [esp+0C]
 0056AF74    fstp        dword ptr [esp+2C]
 0056AF78    fld         dword ptr [esp+4]
 0056AF7C    fadd        dword ptr [esp+8]
 0056AF80    fstp        dword ptr [esp+24]
 0056AF84    fld         dword ptr [esp+4]
 0056AF88    fsub        dword ptr [esp+8]
 0056AF8C    fstp        dword ptr [esp+28]
 0056AF90    fld         dword ptr [esp+20]
 0056AF94    fadd        dword ptr [esp+24]
 0056AF98    fstp        dword ptr [edx]
 0056AF9A    fld         dword ptr [esp+20]
 0056AF9E    fsub        dword ptr [esp+24]
 0056AFA2    fstp        dword ptr [edx+80]
 0056AFA8    fld         dword ptr [esp+28]
 0056AFAC    fadd        dword ptr [esp+2C]
 0056AFB0    fmul        dword ptr ds:[56B098]
 0056AFB6    fstp        dword ptr [esp+30]
 0056AFBA    fld         dword ptr [esp+2C]
 0056AFBE    fadd        dword ptr [esp+30]
 0056AFC2    fstp        dword ptr [edx+40]
 0056AFC5    fld         dword ptr [esp+2C]
 0056AFC9    fsub        dword ptr [esp+30]
 0056AFCD    fstp        dword ptr [edx+0C0]
 0056AFD3    fld         dword ptr [esp+10]
 0056AFD7    fadd        dword ptr [esp+14]
 0056AFDB    fstp        dword ptr [esp+20]
 0056AFDF    fld         dword ptr [esp+14]
 0056AFE3    fadd        dword ptr [esp+18]
 0056AFE7    fstp        dword ptr [esp+24]
 0056AFEB    fld         dword ptr [esp+18]
 0056AFEF    fadd        dword ptr [esp+1C]
 0056AFF3    fstp        dword ptr [esp+28]
 0056AFF7    fld         dword ptr [esp+20]
 0056AFFB    fsub        dword ptr [esp+28]
 0056AFFF    fmul        dword ptr ds:[56B09C]
 0056B005    fstp        dword ptr [esp+40]
 0056B009    fld         dword ptr ds:[56B0A0]
 0056B00F    fmul        dword ptr [esp+20]
 0056B013    fadd        dword ptr [esp+40]
 0056B017    fstp        dword ptr [esp+34]
 0056B01B    fld         dword ptr ds:[56B0A4]
 0056B021    fmul        dword ptr [esp+28]
 0056B025    fadd        dword ptr [esp+40]
 0056B029    fstp        dword ptr [esp+3C]
 0056B02D    fld         dword ptr [esp+24]
 0056B031    fmul        dword ptr ds:[56B098]
 0056B037    fstp        dword ptr [esp+38]
 0056B03B    fld         dword ptr [esp+1C]
 0056B03F    fadd        dword ptr [esp+38]
 0056B043    fstp        dword ptr [esp+44]
 0056B047    fld         dword ptr [esp+1C]
 0056B04B    fsub        dword ptr [esp+38]
 0056B04F    fstp        dword ptr [esp+48]
 0056B053    fld         dword ptr [esp+48]
 0056B057    fadd        dword ptr [esp+34]
 0056B05B    fstp        dword ptr [edx+0A0]
 0056B061    fld         dword ptr [esp+48]
 0056B065    fsub        dword ptr [esp+34]
 0056B069    fstp        dword ptr [edx+60]
 0056B06C    fld         dword ptr [esp+44]
 0056B070    fadd        dword ptr [esp+3C]
 0056B074    fstp        dword ptr [edx+20]
 0056B077    fld         dword ptr [esp+44]
 0056B07B    fsub        dword ptr [esp+3C]
 0056B07F    fstp        dword ptr [edx+0E0]
 0056B085    add         edx,4
 0056B088    dec         ecx
 0056B089    test        ecx,ecx
>0056B08B    jge         0056AEFD
 0056B091    add         esp,4C
 0056B094    ret
*}
end;

//0056B0A8
procedure _DF_.;
begin
{*
 0056B0A8    push        ebx
 0056B0A9    push        esi
 0056B0AA    push        edi
 0056B0AB    push        ebp
 0056B0AC    add         esp,0FFFFFFEC
 0056B0AF    mov         esi,eax
 0056B0B1    mov         dword ptr [esp],edx
 0056B0B4    cmp         dword ptr [esp],0
 0056B0B8    mov         ebx,dword ptr [esi+168]
>0056B0BE    je          0056B0D0
 0056B0C0    mov         dword ptr [ebx+4],56B994
 0056B0C7    mov         dword ptr [ebx+8],56BC2C
>0056B0CE    jmp         0056B0DE
 0056B0D0    mov         dword ptr [ebx+4],56B738
 0056B0D7    mov         dword ptr [ebx+8],56B848
 0056B0DE    xor         eax,eax
 0056B0E0    mov         dword ptr [esp+4],eax
 0056B0E4    lea         edx,[ebx+14]
 0056B0E7    mov         dword ptr [esp+10],edx
 0056B0EB    lea         ecx,[esi+0F4]
 0056B0F1    mov         dword ptr [esp+0C],ecx
>0056B0F5    jmp         0056B205
 0056B0FA    mov         eax,dword ptr [esp+0C]
 0056B0FE    mov         eax,dword ptr [eax]
 0056B100    mov         edi,dword ptr [eax+14]
 0056B103    mov         eax,dword ptr [eax+18]
 0056B106    mov         dword ptr [esp+8],eax
 0056B10A    cmp         dword ptr [esp],0
>0056B10E    je          0056B1C2
 0056B114    test        edi,edi
>0056B116    jl          0056B11D
 0056B118    cmp         edi,4
>0056B11B    jl          0056B12F
 0056B11D    mov         eax,dword ptr [esi]
 0056B11F    mov         dword ptr [eax+14],32
 0056B126    mov         dword ptr [eax+18],edi
 0056B129    mov         eax,esi
 0056B12B    mov         edx,dword ptr [eax]
 0056B12D    call        dword ptr [edx]
 0056B12F    cmp         dword ptr [esp+8],0
>0056B134    jl          0056B13D
 0056B136    cmp         dword ptr [esp+8],4
>0056B13B    jl          0056B153
 0056B13D    mov         eax,dword ptr [esi]
 0056B13F    mov         dword ptr [eax+14],32
 0056B146    mov         edx,dword ptr [esp+8]
 0056B14A    mov         dword ptr [eax+18],edx
 0056B14D    mov         eax,esi
 0056B14F    mov         edx,dword ptr [eax]
 0056B151    call        dword ptr [edx]
 0056B153    cmp         dword ptr [ebx+edi*4+4C],0
>0056B158    jne         0056B170
 0056B15A    mov         eax,esi
 0056B15C    mov         ecx,404
 0056B161    mov         edx,1
 0056B166    mov         ebp,dword ptr [eax+4]
 0056B169    call        dword ptr [ebp]
 0056B16C    mov         dword ptr [ebx+edi*4+4C],eax
 0056B170    push        404
 0056B175    push        0
 0056B177    mov         eax,dword ptr [ebx+edi*4+4C]
 0056B17B    push        eax
 0056B17C    call        _memset
 0056B181    add         esp,0C
 0056B184    mov         edx,dword ptr [esp+8]
 0056B188    cmp         dword ptr [ebx+edx*4+5C],0
>0056B18D    jne         0056B1A8
 0056B18F    mov         eax,esi
 0056B191    mov         ecx,404
 0056B196    mov         edx,1
 0056B19B    mov         edi,dword ptr [eax+4]
 0056B19E    call        dword ptr [edi]
 0056B1A0    mov         edx,dword ptr [esp+8]
 0056B1A4    mov         dword ptr [ebx+edx*4+5C],eax
 0056B1A8    push        404
 0056B1AD    push        0
 0056B1AF    mov         eax,dword ptr [esp+10]
 0056B1B3    mov         ecx,dword ptr [ebx+eax*4+5C]
 0056B1B7    push        ecx
 0056B1B8    call        _memset
 0056B1BD    add         esp,0C
>0056B1C0    jmp         0056B1EF
 0056B1C2    lea         eax,[ebx+edi*4+2C]
 0056B1C6    mov         ecx,edi
 0056B1C8    push        eax
 0056B1C9    mov         eax,esi
 0056B1CB    mov         edx,1
 0056B1D0    call        @jpeg_make_c_derived_tbl
 0056B1D5    mov         edx,dword ptr [esp+8]
 0056B1D9    mov         eax,esi
 0056B1DB    shl         edx,2
 0056B1DE    add         edx,ebx
 0056B1E0    add         edx,3C
 0056B1E3    push        edx
 0056B1E4    xor         edx,edx
 0056B1E6    mov         ecx,dword ptr [esp+0C]
 0056B1EA    call        @jpeg_make_c_derived_tbl
 0056B1EF    mov         ecx,dword ptr [esp+10]
 0056B1F3    xor         eax,eax
 0056B1F5    mov         dword ptr [ecx],eax
 0056B1F7    inc         dword ptr [esp+4]
 0056B1FB    add         dword ptr [esp+10],4
 0056B200    add         dword ptr [esp+0C],4
 0056B205    mov         edx,dword ptr [esp+4]
 0056B209    cmp         edx,dword ptr [esi+0F0]
>0056B20F    jl          0056B0FA
 0056B215    xor         ecx,ecx
 0056B217    xor         eax,eax
 0056B219    mov         dword ptr [ebx+0C],ecx
 0056B21C    mov         dword ptr [ebx+10],eax
 0056B21F    mov         edx,dword ptr [esi+0C4]
 0056B225    xor         ecx,ecx
 0056B227    mov         dword ptr [ebx+24],edx
 0056B22A    mov         dword ptr [ebx+28],ecx
 0056B22D    add         esp,14
 0056B230    pop         ebp
 0056B231    pop         edi
 0056B232    pop         esi
 0056B233    pop         ebx
 0056B234    ret
*}
end;

//0056B238
procedure @jpeg_make_c_derived_tbl;
begin
{*
 0056B238    push        ebp
 0056B239    mov         ebp,esp
 0056B23B    add         esp,0FFFFFAD0
 0056B241    push        ebx
 0056B242    push        esi
 0056B243    push        edi
 0056B244    mov         esi,ecx
 0056B246    mov         dword ptr [ebp-8],edx
 0056B249    mov         dword ptr [ebp-4],eax
 0056B24C    mov         ebx,dword ptr [ebp+8]
 0056B24F    test        esi,esi
>0056B251    jl          0056B258
 0056B253    cmp         esi,4
>0056B256    jl          0056B26E
 0056B258    mov         eax,dword ptr [ebp-4]
 0056B25B    mov         eax,dword ptr [eax]
 0056B25D    mov         dword ptr [eax+14],32
 0056B264    mov         dword ptr [eax+18],esi
 0056B267    mov         eax,dword ptr [ebp-4]
 0056B26A    mov         edx,dword ptr [eax]
 0056B26C    call        dword ptr [edx]
 0056B26E    cmp         dword ptr [ebp-8],0
>0056B272    je          0056B27D
 0056B274    mov         ecx,dword ptr [ebp-4]
 0056B277    mov         eax,dword ptr [ecx+esi*4+54]
>0056B27B    jmp         0056B284
 0056B27D    mov         edx,dword ptr [ebp-4]
 0056B280    mov         eax,dword ptr [edx+esi*4+64]
 0056B284    mov         dword ptr [ebp-0C],eax
 0056B287    cmp         dword ptr [ebp-0C],0
>0056B28B    jne         0056B2A3
 0056B28D    mov         edx,dword ptr [ebp-4]
 0056B290    mov         eax,dword ptr [edx]
 0056B292    mov         dword ptr [eax+14],32
 0056B299    mov         dword ptr [eax+18],esi
 0056B29C    mov         eax,dword ptr [ebp-4]
 0056B29F    mov         edx,dword ptr [eax]
 0056B2A1    call        dword ptr [edx]
 0056B2A3    cmp         dword ptr [ebx],0
>0056B2A6    jne         0056B2BC
 0056B2A8    mov         eax,dword ptr [ebp-4]
 0056B2AB    mov         ecx,500
 0056B2B0    mov         edx,1
 0056B2B5    mov         esi,dword ptr [eax+4]
 0056B2B8    call        dword ptr [esi]
 0056B2BA    mov         dword ptr [ebx],eax
 0056B2BC    mov         eax,dword ptr [ebx]
 0056B2BE    mov         dword ptr [ebp-10],eax
 0056B2C1    xor         ebx,ebx
 0056B2C3    mov         edi,1
 0056B2C8    mov         eax,dword ptr [ebp-0C]
 0056B2CB    lea         edx,[eax+1]
 0056B2CE    mov         dword ptr [ebp-20],edx
 0056B2D1    mov         ecx,dword ptr [ebp-20]
 0056B2D4    movzx       esi,byte ptr [ecx]
 0056B2D7    test        esi,esi
>0056B2D9    jl          0056B2E5
 0056B2DB    lea         eax,[esi+ebx]
 0056B2DE    cmp         eax,100
>0056B2E3    jle         0056B2F8
 0056B2E5    mov         edx,dword ptr [ebp-4]
 0056B2E8    mov         ecx,dword ptr [edx]
 0056B2EA    mov         dword ptr [ecx+14],8
 0056B2F1    mov         eax,dword ptr [ebp-4]
 0056B2F4    mov         edx,dword ptr [eax]
 0056B2F6    call        dword ptr [edx]
 0056B2F8    lea         eax,[ebp+ebx-12C]
>0056B2FF    jmp         0056B307
 0056B301    mov         edx,edi
 0056B303    inc         ebx
 0056B304    mov         byte ptr [eax],dl
 0056B306    inc         eax
 0056B307    mov         ecx,esi
 0056B309    add         esi,0FFFFFFFF
 0056B30C    test        ecx,ecx
>0056B30E    jne         0056B301
 0056B310    inc         edi
 0056B311    inc         dword ptr [ebp-20]
 0056B314    cmp         edi,10
>0056B317    jle         0056B2D1
 0056B319    mov         byte ptr [ebp+ebx-12C],0
 0056B321    mov         dword ptr [ebp-14],ebx
 0056B324    xor         esi,esi
 0056B326    movsx       eax,byte ptr [ebp-12C]
 0056B32D    mov         dword ptr [ebp-18],eax
 0056B330    xor         ebx,ebx
>0056B332    jmp         0056B37A
 0056B334    lea         edx,[ebp+ebx*4-530]
 0056B33B    lea         eax,[ebp+ebx-12C]
>0056B342    jmp         0056B34C
 0056B344    mov         dword ptr [edx],esi
 0056B346    inc         ebx
 0056B347    add         edx,4
 0056B34A    inc         eax
 0056B34B    inc         esi
 0056B34C    movsx       ecx,byte ptr [eax]
 0056B34F    cmp         ecx,dword ptr [ebp-18]
>0056B352    je          0056B344
 0056B354    mov         ecx,dword ptr [ebp-18]
 0056B357    mov         eax,1
 0056B35C    shl         eax,cl
 0056B35E    cmp         eax,esi
>0056B360    jg          0056B375
 0056B362    mov         edx,dword ptr [ebp-4]
 0056B365    mov         eax,dword ptr [edx]
 0056B367    mov         dword ptr [eax+14],8
 0056B36E    mov         eax,dword ptr [ebp-4]
 0056B371    mov         edx,dword ptr [eax]
 0056B373    call        dword ptr [edx]
 0056B375    add         esi,esi
 0056B377    inc         dword ptr [ebp-18]
 0056B37A    cmp         byte ptr [ebp+ebx-12C],0
>0056B382    jne         0056B334
 0056B384    push        100
 0056B389    push        0
 0056B38B    mov         ecx,dword ptr [ebp-10]
 0056B38E    add         ecx,400
 0056B394    push        ecx
 0056B395    call        _memset
 0056B39A    add         esp,0C
 0056B39D    cmp         dword ptr [ebp-8],0
>0056B3A1    je          0056B3AA
 0056B3A3    mov         eax,0F
>0056B3A8    jmp         0056B3AF
 0056B3AA    mov         eax,0FF
 0056B3AF    mov         dword ptr [ebp-1C],eax
 0056B3B2    lea         eax,[ebp-12C]
 0056B3B8    mov         dword ptr [ebp-28],eax
 0056B3BB    lea         edx,[ebp-530]
 0056B3C1    mov         dword ptr [ebp-24],edx
 0056B3C4    xor         ebx,ebx
 0056B3C6    mov         ecx,dword ptr [ebp-0C]
 0056B3C9    cmp         ebx,dword ptr [ebp-14]
 0056B3CC    lea         edi,[ecx+11]
>0056B3CF    jge         0056B425
 0056B3D1    movzx       esi,byte ptr [edi]
 0056B3D4    test        esi,esi
>0056B3D6    jl          0056B3EA
 0056B3D8    cmp         esi,dword ptr [ebp-1C]
>0056B3DB    jg          0056B3EA
 0056B3DD    mov         eax,dword ptr [ebp-10]
 0056B3E0    cmp         byte ptr [eax+esi+400],0
>0056B3E8    je          0056B3FD
 0056B3EA    mov         edx,dword ptr [ebp-4]
 0056B3ED    mov         ecx,dword ptr [edx]
 0056B3EF    mov         dword ptr [ecx+14],8
 0056B3F6    mov         eax,dword ptr [ebp-4]
 0056B3F9    mov         edx,dword ptr [eax]
 0056B3FB    call        dword ptr [edx]
 0056B3FD    mov         ecx,dword ptr [ebp-24]
 0056B400    mov         edx,dword ptr [ebp-10]
 0056B403    inc         ebx
 0056B404    inc         edi
 0056B405    mov         eax,dword ptr [ecx]
 0056B407    mov         dword ptr [edx+esi*4],eax
 0056B40A    mov         ecx,dword ptr [ebp-28]
 0056B40D    mov         edx,dword ptr [ebp-10]
 0056B410    mov         al,byte ptr [ecx]
 0056B412    mov         byte ptr [edx+esi+400],al
 0056B419    inc         dword ptr [ebp-28]
 0056B41C    add         dword ptr [ebp-24],4
 0056B420    cmp         ebx,dword ptr [ebp-14]
>0056B423    jl          0056B3D1
 0056B425    pop         edi
 0056B426    pop         esi
 0056B427    pop         ebx
 0056B428    mov         esp,ebp
 0056B42A    pop         ebp
 0056B42B    ret         4
*}
end;

//0056BA48
procedure @jpeg_gen_optimal_table;
begin
{*
 0056BA48    push        ebx
 0056BA49    push        esi
 0056BA4A    push        edi
 0056BA4B    add         esp,0FFFFF7C8
 0056BA51    mov         dword ptr [esp+8],ecx
 0056BA55    mov         dword ptr [esp+4],edx
 0056BA59    mov         dword ptr [esp],eax
 0056BA5C    push        21
 0056BA5E    push        0
 0056BA60    lea         eax,[esp+14]
 0056BA64    push        eax
 0056BA65    call        _memset
 0056BA6A    add         esp,0C
 0056BA6D    push        404
 0056BA72    push        0
 0056BA74    lea         edx,[esp+38]
 0056BA78    push        edx
 0056BA79    call        _memset
 0056BA7E    add         esp,0C
 0056BA81    xor         ebx,ebx
 0056BA83    lea         eax,[esp+434]
 0056BA8A    mov         dword ptr [eax],0FFFFFFFF
 0056BA90    inc         ebx
 0056BA91    add         eax,4
 0056BA94    cmp         ebx,101
>0056BA9A    jl          0056BA8A
 0056BA9C    mov         edx,dword ptr [esp+8]
 0056BAA0    mov         dword ptr [edx+400],1
 0056BAAA    or          eax,0FFFFFFFF
 0056BAAD    mov         edi,3B9ACA00
 0056BAB2    xor         ebx,ebx
 0056BAB4    mov         edx,dword ptr [esp+8]
 0056BAB8    mov         ecx,dword ptr [edx]
 0056BABA    test        ecx,ecx
>0056BABC    je          0056BAC6
 0056BABE    cmp         edi,ecx
>0056BAC0    jl          0056BAC6
 0056BAC2    mov         edi,ecx
 0056BAC4    mov         eax,ebx
 0056BAC6    inc         ebx
 0056BAC7    add         edx,4
 0056BACA    cmp         ebx,100
>0056BAD0    jle         0056BAB8
 0056BAD2    or          edx,0FFFFFFFF
 0056BAD5    mov         edi,3B9ACA00
 0056BADA    xor         ebx,ebx
 0056BADC    mov         ecx,dword ptr [esp+8]
 0056BAE0    mov         esi,dword ptr [ecx]
 0056BAE2    test        esi,esi
>0056BAE4    je          0056BAF2
 0056BAE6    cmp         edi,esi
>0056BAE8    jl          0056BAF2
 0056BAEA    cmp         eax,ebx
>0056BAEC    je          0056BAF2
 0056BAEE    mov         edi,esi
 0056BAF0    mov         edx,ebx
 0056BAF2    inc         ebx
 0056BAF3    add         ecx,4
 0056BAF6    cmp         ebx,100
>0056BAFC    jle         0056BAE0
 0056BAFE    test        edx,edx
>0056BB00    jl          0056BB53
 0056BB02    mov         ecx,dword ptr [esp+8]
 0056BB06    mov         ebx,dword ptr [esp+8]
 0056BB0A    mov         ecx,dword ptr [ecx+edx*4]
 0056BB0D    add         dword ptr [ebx+eax*4],ecx
 0056BB10    xor         ebx,ebx
 0056BB12    mov         ecx,dword ptr [esp+8]
 0056BB16    mov         dword ptr [ecx+edx*4],ebx
 0056BB19    inc         dword ptr [esp+eax*4+30]
>0056BB1D    jmp         0056BB25
 0056BB1F    mov         eax,ecx
 0056BB21    inc         dword ptr [esp+eax*4+30]
 0056BB25    mov         ecx,dword ptr [esp+eax*4+434]
 0056BB2C    test        ecx,ecx
>0056BB2E    jge         0056BB1F
 0056BB30    mov         dword ptr [esp+eax*4+434],edx
 0056BB37    inc         dword ptr [esp+edx*4+30]
>0056BB3B    jmp         0056BB43
 0056BB3D    mov         edx,eax
 0056BB3F    inc         dword ptr [esp+edx*4+30]
 0056BB43    mov         eax,dword ptr [esp+edx*4+434]
 0056BB4A    test        eax,eax
>0056BB4C    jge         0056BB3D
>0056BB4E    jmp         0056BAAA
 0056BB53    xor         ebx,ebx
 0056BB55    lea         esi,[esp+30]
 0056BB59    mov         eax,dword ptr [esi]
 0056BB5B    test        eax,eax
>0056BB5D    je          0056BB7D
 0056BB5F    cmp         eax,20
>0056BB62    jle         0056BB77
 0056BB64    mov         edx,dword ptr [esp]
 0056BB67    mov         ecx,dword ptr [edx]
 0056BB69    mov         dword ptr [ecx+14],27
 0056BB70    mov         eax,dword ptr [esp]
 0056BB73    mov         edx,dword ptr [eax]
 0056BB75    call        dword ptr [edx]
 0056BB77    mov         ecx,dword ptr [esi]
 0056BB79    inc         byte ptr [esp+ecx+0C]
 0056BB7D    inc         ebx
 0056BB7E    add         esi,4
 0056BB81    cmp         ebx,100
>0056BB87    jle         0056BB59
 0056BB89    mov         ebx,20
 0056BB8E    lea         esi,[esp+2C]
 0056BB92    mov         ecx,esi
>0056BB94    jmp         0056BBB5
 0056BB96    lea         eax,[ebx-2]
 0056BB99    lea         edx,[esp+eax+0C]
>0056BB9D    jmp         0056BBA1
 0056BB9F    dec         eax
 0056BBA0    dec         edx
 0056BBA1    cmp         byte ptr [edx],0
>0056BBA4    je          0056BB9F
 0056BBA6    add         byte ptr [ecx],0FE
 0056BBA9    inc         byte ptr [ecx-1]
 0056BBAC    add         byte ptr [esp+eax+0D],2
 0056BBB1    dec         byte ptr [esp+eax+0C]
 0056BBB5    cmp         byte ptr [ecx],0
>0056BBB8    ja          0056BB96
 0056BBBA    dec         ebx
 0056BBBB    dec         esi
 0056BBBC    cmp         ebx,10
>0056BBBF    jg          0056BB92
 0056BBC1    lea         eax,[esp+ebx+0C]
>0056BBC5    jmp         0056BBC9
 0056BBC7    dec         ebx
 0056BBC8    dec         eax
 0056BBC9    cmp         byte ptr [eax],0
>0056BBCC    je          0056BBC7
 0056BBCE    dec         byte ptr [esp+ebx+0C]
 0056BBD2    push        11
 0056BBD4    lea         edx,[esp+10]
 0056BBD8    push        edx
 0056BBD9    mov         ecx,dword ptr [esp+0C]
 0056BBDD    push        ecx
 0056BBDE    call        _memcpy
 0056BBE3    add         esp,0C
 0056BBE6    xor         edi,edi
 0056BBE8    mov         ebx,1
 0056BBED    xor         eax,eax
 0056BBEF    mov         edx,dword ptr [esp+4]
 0056BBF3    lea         esi,[edx+edi+11]
 0056BBF7    lea         edx,[esp+30]
 0056BBFB    cmp         ebx,dword ptr [edx]
>0056BBFD    jne         0056BC03
 0056BBFF    mov         byte ptr [esi],al
 0056BC01    inc         edi
 0056BC02    inc         esi
 0056BC03    inc         eax
 0056BC04    add         edx,4
 0056BC07    cmp         eax,0FF
>0056BC0C    jle         0056BBFB
 0056BC0E    inc         ebx
 0056BC0F    cmp         ebx,20
>0056BC12    jle         0056BBED
 0056BC14    mov         eax,dword ptr [esp+4]
 0056BC18    xor         ecx,ecx
 0056BC1A    mov         dword ptr [eax+114],ecx
 0056BC20    add         esp,838
 0056BC26    pop         edi
 0056BC27    pop         esi
 0056BC28    pop         ebx
 0056BC29    ret
*}
end;

//0056BD04
procedure @jinit_huff_encoder;
begin
{*
 0056BD04    push        ebx
 0056BD05    mov         ebx,eax
 0056BD07    mov         eax,ebx
 0056BD09    push        esi
 0056BD0A    mov         ecx,6C
 0056BD0F    mov         edx,1
 0056BD14    mov         esi,dword ptr [eax+4]
 0056BD17    call        dword ptr [esi]
 0056BD19    mov         dword ptr [ebx+168],eax
 0056BD1F    mov         dword ptr [eax],56B0A8;_DF_.
 0056BD25    xor         edx,edx
 0056BD27    add         eax,3C
 0056BD2A    xor         ecx,ecx
 0056BD2C    mov         dword ptr [eax],ecx
 0056BD2E    mov         dword ptr [eax-10],ecx
 0056BD31    xor         ecx,ecx
 0056BD33    mov         dword ptr [eax+20],ecx
 0056BD36    mov         dword ptr [eax+10],ecx
 0056BD39    inc         edx
 0056BD3A    add         eax,4
 0056BD3D    cmp         edx,4
>0056BD40    jl          0056BD2A
 0056BD42    pop         esi
 0056BD43    pop         ebx
 0056BD44    ret
*}
end;

Initialization
//00781218
{*
 00781218    push        ebp
 00781219    mov         ebp,esp
 0078121B    push        0
 0078121D    push        0
 0078121F    xor         eax,eax
 00781221    push        ebp
 00781222    push        7812A0
 00781227    push        dword ptr fs:[eax]
 0078122A    mov         dword ptr fs:[eax],esp
 0078122D    sub         dword ptr ds:[815500],1
>00781234    jae         00781285
 00781236    call        InitDefaults
 0078123B    mov         eax,[005582CC];TJPEGImage
 00781240    push        eax
 00781241    lea         edx,[ebp-4]
 00781244    mov         eax,[0078CC3C];^SResString582:TResStringRec
 00781249    call        LoadResString
 0078124E    mov         ecx,dword ptr [ebp-4]
 00781251    mov         edx,7812B8;'jpeg'
 00781256    mov         eax,[0046279C];TPicture
 0078125B    call        TPicture.RegisterFileFormat
 00781260    mov         eax,[005582CC];TJPEGImage
 00781265    push        eax
 00781266    lea         edx,[ebp-8]
 00781269    mov         eax,[0078CC3C];^SResString582:TResStringRec
 0078126E    call        LoadResString
 00781273    mov         ecx,dword ptr [ebp-8]
 00781276    mov         edx,7812D0;'jpg'
 0078127B    mov         eax,[0046279C];TPicture
 00781280    call        TPicture.RegisterFileFormat
 00781285    xor         eax,eax
 00781287    pop         edx
 00781288    pop         ecx
 00781289    pop         ecx
 0078128A    mov         dword ptr fs:[eax],edx
 0078128D    push        7812A7
 00781292    lea         eax,[ebp-8]
 00781295    mov         edx,2
 0078129A    call        @UStrArrayClr
 0078129F    ret
>007812A0    jmp         @HandleFinally
>007812A5    jmp         00781292
 007812A7    pop         ecx
 007812A8    pop         ecx
 007812A9    pop         ebp
 007812AA    ret
*}
Finalization
end.