unit UEscherGraphToBSE;

interface
uses Sysutils, Classes, XlsMessages, UEscherRecords, UXlsMD5, UFlxMessages;
{************************************************************************************}
{**} function ConvertGraphicToBSE(const Data: string; const DataType: TXlsImgTypes;
       const DwgGroupCache: PEscherDwgGroupCache; const DwgCache: PEscherDwgCache):TEscherBSERecord ;
{************************************************************************************}

implementation


type
  TBSEHeader= packed record
   btWin32:        byte;                  // Required type on Win32
   btMacOS:        byte;                  // Required type on Mac
   rgbUid:         TMd5Digest;            // Identifier of blip
   tag:            word;                  // currently unused
   size:           Cardinal;              // Blip size in stream
   cRef:           Cardinal;              // Reference count on the blip
   foDelay:        Cardinal;              // File offset in the delay stream
   usage:          byte;                  // How this blip is used (MSOBLIPUSAGE)
   cbName:         byte;                  // length of the blip name
   unused2:        byte;                  // for the future
   unused3:        byte;                  // for the future
  end;

  TWMFBlipHeader = packed record
    m_rgbUid: TMd5Digest;  { The secondary, or data, UID - should always be set. }

    { Metafile Blip overhead = 34 bytes. m_cb gives the number of
     bytes required to store an uncompressed version of the file, m_cbSave
     is the compressed size.  m_mfBounds gives the boundary of all the
     drawing calls within the metafile (this may just be the bounding box
     or it may allow some whitespace, for a WMF this comes from the
     SetWindowOrg and SetWindowExt records of the metafile). }
    m_cb: integer;           // Cache of the metafile size
    m_rcBounds: Array[0..3] of integer;     // Boundary of metafile drawing commands
    m_ptSize: Array[0..1] of integer;       // Size of metafile in EMUs
    m_cbSave: integer;       // Cache of saved size (size of m_pvBits)
    m_fCompression: byte; // MSOBLIPCOMPRESSION
    m_fFilter: byte;      // always msofilterNone
  end;

procedure LoadDataBMP(const Data: string; const DataType: TXlsImgTypes; const BlipData: TStream);
var
  Tag: byte;
begin
  Tag:=$FF;
  BlipData.Write(Tag, SizeOf(Tag));
  BlipData.Write(Data[1], Length(Data));
end;

procedure LoadDataWMF(const Data: string; const DataType: TXlsImgTypes; const BlipData: TStream);
begin
end;

{************************************************************************************}
function ConvertGraphicToBSE(const Data: string; const DataType: TXlsImgTypes;
  const DwgGroupCache: PEscherDwgGroupCache; const DwgCache: PEscherDwgCache):TEscherBSERecord;
var
  Eh: TEscherRecordHeader;
  BSEHeader: TBSEHeader;
  Md5Stream: TMd5Stream;
  BlipData: TMemoryStream;
  BlipHeader: TEscherRecordHeader;
begin
  FillChar(BSEHeader, SizeOf(BSEHeader), 0);
  Md5Stream:=TMd5Stream.Create;
  try
    Md5Stream.Write(Data[1], Length(Data));
    BSEHeader.rgbUid:= Md5Stream.GetDigest;
  finally
    FreeAndNil(Md5Stream);
  end;

//  FillChar(BSEHeader, SizeOf(BSEHeader), 0);
  BlipData:=TMemoryStream.Create;
  try
    //Common header
    BlipData.Write(BSEHeader.rgbUid, SizeOf(BSEHeader.rgbUid));

    // Specific info
    if DataType in [xli_JPEG, xli_PNG, xli_BMP] then
      LoadDataBMP(Data, DataType, BlipData) else
      LoadDataWMF(Data, DataType, BlipData);

    BSEHeader.btWin32:= XlsImgConv[DataType];
    BSEHeader.btMacOS:= msoblipPICT;

    BSEHeader.tag:=$FF;
    BSEHeader.size:= BlipData.Size+ SizeOf(BlipHeader);
    BSEHeader.cRef:=0;
    BSEHeader.foDelay:=0;

    Eh.Id:= MsofbtBSE;
    Eh.Pre:=2 + XlsImgConv[DataType] shl 4;
    Eh.Size:=BSEHeader.size + SizeOf(BSEHeader);
    Result:= TEscherBSERecord.Create(Eh, DwgGroupCache, DwgCache, DwgGroupCache.BStore);

    BlipHeader.Id:= XlsBlipHeaderConv[DataType];
    BlipHeader.Pre:= XlsBlipSignConv[DataType] shl 4;
    BlipHeader.Size:=BlipData.Size;

    BlipData.Position:=0;
    Result.CopyFromData(@BSEHeader, BlipHeader, BlipData);
  finally
    FreeAndNil(BlipData);
  end; //finally
end;

end.
