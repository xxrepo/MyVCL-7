unit AdvGridExcel;
{$IFDEF LINUX}{$INCLUDE ../FLXCONFIG.INC}{$ELSE}{$INCLUDE ..\FLXCONFIG.INC}{$ENDIF}
interface
{$IFDEF FLEXCELADVSTRINGGRID}
uses
  Windows, SysUtils, Classes, XLSAdapter, UExcelAdapter, UFlxUtils, AdvGrid, UFlxFormats, UFlxMessages, BaseGrid, UXlsPictures,
  {$IFDEF ConditionalExpressions}{$if CompilerVersion >= 14} variants, {$IFEND}{$ENDIF} //Delphi 6 or above
    {$IFDEF USEPNGLIB}
      //////////////////////////////// IMPORTANT ///////////////////////////////////////
      //To be able to display PNG images and WMFs, you have to install TPNGImage from http://pngdelphi.sourceforge.net/
      //If you don't want to install it, edit ../FLXCONFIG.INC and delete the line:
      // "{$DEFINE USEPNGLIB}" on the file
      //Note that this is only needed on Windows, CLX has native support for PNG
      ///////////////////////////////////////////////////////////////////////////////////
        pngimage, pngzlib,
      ///////////////////////////////////////////////////////////////////////////////////
      //If you are getting an error here, please read the note above.
      ///////////////////////////////////////////////////////////////////////////////////
    {$ENDIF}
  Graphics, JPEG,
  {$IFNDEF TMSASG}UTextDelim,{$ENDIF}
   UFlxNumberFormat, Grids;
                       
const                            
  CellOfs = 0;
type
  TFlxFormatCellEvent = procedure (Sender: TAdvStringGrid; const GridCol, GridRow, XlsCol, XlsRow: integer; const Value: widestring; var DateFormat, TimeFormat: Widestring) of object;

  TAdvGridExcelIO = class(TComponent)
  private
    FAdvStringGrid: TAdvStringGrid;
    FAdapter: TExcelAdapter;
    FAutoResizeGrid: boolean;
    FKeepExcelCellFormat: boolean;
    FUseUnicode: boolean;
    FMergeEmptyRightCells: boolean;
    FLoadImages: boolean;
    FSheetNames: array of widestring;
    FGridStartCol: integer;
    FGridStartRow: integer;
    FXlsStartRow: integer;
    FXlsStartCol: integer;
    FZoomSaved: boolean;
    FZoom: integer;
    FDateFormat: widestring;
    FTimeFormat: widestring;
    FOnDateTimeFormat: TFlxFormatCellEvent;
    // procedure SetAdapter(const Value: TExcelAdapter);
    procedure SetAdvStringGrid(const Value: TAdvStringGrid);

    procedure ImportData(const Workbook: TExcelFile);
    procedure ExportData(const Workbook: TExcelFile);
    procedure CloseFile(var Workbook: TExcelFile);
    function CellFormatDef(const Workbook: TExcelFile; const aRow, aCol: integer): TFlxFormat;
    function GetColor(const Workbook:TExcelFile; const Fm: TFlxFormat): TColor;
    function GetSheetNames(index: integer): widestring;
    function GetSheetNamesCount: integer;
    procedure SetGridStartCol(const Value: integer);
    procedure SetGridStartRow(const Value: integer);
    procedure SetXlsStartCol(const Value: integer);
    procedure SetXlsStartRow(const Value: integer);
    procedure OpenText(const Workbook: TExcelFile;
      const FileName: TFileName; const Delimiter: char);
    procedure SetZoom(const Value: integer);
    procedure ImportImages(const Workbook: TExcelFile; const Zoom100: extended);
    procedure ExportImage(const Workbook: TExcelFile; const Pic: TPicture; const rx, cx, cg, rg: integer);
    procedure InternalXLSImport(const FileName: TFileName; const SheetNumber: integer; const SheetName: widestring);
    { Private declarations }
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    { Protected declarations }
  public
    procedure XLSImport(const FileName: TFileName; const SheetNumber: integer=1);overload;
    procedure XLSImport(const FileName: TFileName; const SheetName: widestring);overload;
    procedure XLSExport(const FileName: TFileName; const SheetName: widestring='');

    property SheetNames[index: integer]: widestring read GetSheetNames;
    property SheetNamesCount: integer read GetSheetNamesCount;

    constructor Create(AOwner: TComponent); override;
    { Public declarations }
  published
    //property Adapter: TExcelAdapter read FAdapter write SetAdapter;
    property AdvStringGrid: TAdvStringGrid read FAdvStringGrid write SetAdvStringGrid;

    property AutoResizeGrid: boolean read FAutoResizeGrid write FAutoResizeGrid default true;
    property KeepExcelCellFormat: boolean read FKeepExcelCellFormat write FKeepExcelCellFormat default true;
    property UseUnicode: boolean read FUseUnicode write FUseUnicode;

    property LoadImages: boolean read FLoadImages write FLoadImages default true;
    property MergeEmptyRightCells: boolean read FMergeEmptyRightCells write FMergeEmptyRightCells;

    property GridStartRow:integer read FGridStartRow write SetGridStartRow default 1;
    property GridStartCol:integer read FGridStartCol write SetGridStartCol  default 1;
    property XlsStartRow:integer read FXlsStartRow write SetXlsStartRow  default 1;
    property XlsStartCol:integer read FXlsStartCol write SetXlsStartCol  default 1;

    property ZoomSaved: boolean read FZoomSaved write FZoomSaved default true;
    property Zoom: integer read FZoom write SetZoom default 100;

    property DateFormat: widestring read FDateFormat write FDateFormat;
    property TimeFormat: widestring read FTimeFormat write FTimeFormat;

    //Events
    property OnDateTimeFormat: TFlxFormatCellEvent read FOnDateTimeFormat write FOnDateTimeFormat;
    { Published declarations }
  end;

procedure Register;
{$ENDIF}
implementation
{$IFDEF FLEXCELADVSTRINGGRID}

procedure Register;
begin
  RegisterComponents('TMS Grids', [TAdvGridExcelIO]);
end;

{ TAdvGridExcelIO }

procedure TAdvGridExcelIO.CloseFile(var Workbook: TExcelFile);
begin
  if Workbook=nil then exit;
  try
    Workbook.CloseFile;
  except
    //nothing;
  end; //Except
  try
    Workbook.Disconnect;
  except
    //nothing;
  end; //Except
  FreeAndNil(Workbook);
end;

function TAdvGridExcelIO.CellFormatDef(const Workbook: TExcelFile;const aRow, aCol: integer): TFlxFormat;
var
  XF: integer;
begin
  XF:= Workbook.CellFormat[aRow, aCol];
  if XF<0 then
  begin

    XF:=Workbook.RowFormat[aRow];
    if XF<=0 then XF:=Workbook.ColumnFormat[aCol];
  end;
  if (XF<0) then XF:=15;
  Result:=Workbook.FormatList[XF];
end;

function TAdvGridExcelIO.GetColor(const Workbook:TExcelFile; const Fm: TFlxFormat): TColor;
var
  bc: TColor;
begin
  if Fm.FillPattern.Pattern= 1 then Result:=$FFFFFF
  else
  begin
    bc:=Fm.FillPattern.FgColorIndex;
    if (bc>0)and (integer(bc)<56) then
        Result:=Workbook.ColorPalette[bc] else
        Result:=$FFFFFF;
  end;
end;

procedure TAdvGridExcelIO.ImportImages(const Workbook: TExcelFile; const Zoom100: extended);
var
  i: integer;
  Pic: TStream;
  PicType: TXlsImgTypes;
  Picture, TmpPic: TPicture;
  Bmp:TBitmap;
  Anchor: TClientAnchor;
  Handled: boolean;
  w,h: integer;

  StartX, StartY, SpanX, SpanY: integer;
begin
  if LoadImages then
  begin
    for i:=0 to Workbook.PicturesCount[-1]-1 do
    begin
      Pic:=TMemoryStream.Create;
      try
        Workbook.GetPicture(-1, i, Pic, PicType, Anchor);

        if Anchor.Dx1>1024 div 2 then StartX:=Anchor.Col1+1 else StartX:=Anchor.Col1;
        SpanX:=Anchor.Col2-StartX+1;
        if Anchor.Dy1>255 div 2 then StartY:=Anchor.Row1+1 else StartY:=Anchor.Row1;
        SpanY:=Anchor.Row2-StartY+1;

        //Resize the grid if too small
        if FAutoResizeGrid then
        begin
          if Anchor.Col2+GridStartCol-XlsStartCol+2>AdvStringGrid.ColCount then AdvStringGrid.ColCount:=Anchor.Col2+GridStartCol-XlsStartCol+2;
          if Anchor.Row2+GridStartRow-XlsStartRow+2>AdvStringGrid.RowCount then AdvStringGrid.RowCount:=Anchor.Row2-XlsStartRow+GridStartRow+2;
        end;

        if Anchor.Row1<XlsStartRow then continue;
        if Anchor.Col1<XlsStartCol then continue;
        if Anchor.Col2+GridStartCol-XlsStartCol>AdvStringGrid.ColCount then continue;
        if Anchor.Row2+GridStartRow-XlsStartRow>AdvStringGrid.RowCount then continue;


        Picture:=AdvStringGrid.CreatePicture(StartX+GridStartCol-XlsStartCol, StartY+GridStartRow-XlsStartRow, false, noStretch, 0, haLeft, vaTop);
        try
          //Merge picture cells so we get a better size.

          AdvStringGrid.MergeCells(StartX+GridStartCol-XlsStartCol, StartY+GridStartRow-XlsStartRow, SpanX, SpanY);
          //Load the image
          Pic.Position:=0;
          CalcImgDimentions(Workbook, Anchor, w, h);
          TmpPic:=TPicture.Create;
          try
            SaveImgStreamToGraphic(Pic, PicType, TmpPic, Handled);
            if not Handled then raise Exception.Create('Not handled'); //This will be catched below. It is an internal exception so image is deleted
            Bmp:=TBitmap.Create;
            try
              Picture.Graphic:=Bmp;
            finally
              FreeAndNil(Bmp); //Remember TPicture.Graphic keeps a COPY of the TGraphic
            end;
            (Picture.Graphic as TBitmap).Width:=Round(w*Zoom100);
            (Picture.Graphic as TBitmap).Height:=Round(h*Zoom100);
            (Picture.Graphic as TBitmap).Canvas.StretchDraw(Rect(0,0,Round(w*Zoom100),Round(h*Zoom100)),TmpPic.Graphic);
          finally
            FreeAndNil(TmpPic);
          end; //finally
        except
          AdvStringGrid.RemovePicture(Anchor.Col1+GridStartCol-XlsStartCol, Anchor.Row1+GridStartRow-XlsStartRow);
          //Dont raise... is not a major error;
        end;    //except
      finally
        FreeAndNil(Pic);
      end; //Finally
    end;
  end;
end;

procedure TAdvGridExcelIO.ImportData(const Workbook: TExcelFile);
var
  r,c,i: integer;
  Fm: TFlxFormat;
  Mb: TXlsCellRange;

  MaxC, MaxR, cg, rg: integer;

  XF: integer;

  Zoom100: extended;
  FontColor: integer;
  w: widestring;
  v: variant;
  HAlign: TAlignment;

  HasTime, HasDate: boolean;
begin
  Assert(Workbook<>nil,'Workbook can''t be nil');
  Assert(AdvStringGrid<>nil,'AdvStringGrid can''t be nil');

  if FZoomSaved then Zoom100:=Workbook.SheetZoom/100 else Zoom100:=FZoom/100;


  if FAutoResizeGrid then
  begin
    AdvStringGrid.RowCount:=Workbook.MaxRow-XlsStartRow + 1 + GridStartRow;
    AdvStringGrid.ColCount:=Workbook.MaxCol-XlsStartCol + 1 + GridStartCol;
  end
  else
    AdvStringGrid.Clear;

  AdvStringGrid.DefaultRowHeight:=Round(Workbook.DefaultRowHeight/RowMult*Zoom100)+CellOfs;
  AdvStringGrid.DefaultColWidth:=Round(Workbook.DefaultColWidth/ColMult*Zoom100)+CellOfs;

  ImportImages(Workbook, Zoom100); //Load them first, so if there is some resizing to do, it is done here

  if Workbook.MaxRow>AdvStringGrid.RowCount+XlsStartRow-1-GridStartRow
    then MaxR:=AdvStringGrid.RowCount+XlsStartRow-1-GridStartRow else MaxR:=Workbook.MaxRow;
  if Workbook.MaxCol>AdvStringGrid.ColCount+XlsStartCol-1-GridStartCol
    then MaxC:=AdvStringGrid.ColCount+XlsStartCol-1-GridStartCol else MaxC:=Workbook.MaxCol;

  //Adjust Row/Column sizes and set Row/Column formats
  for r:=XlsStartRow to MaxR do
  begin
    rg:=r+GridStartRow-XlsStartRow;
    AdvStringGrid.RowHeights[rg]:=Round(Workbook.RowHeight[r]/RowMult*Zoom100)+CellOfs;
    XF:=Workbook.RowFormat[r];
    if XF>=0 then
    begin
      Fm:=Workbook.FormatList[XF];
      AdvStringGrid.RowColor[rg]:=GetColor(Workbook, Fm);
      if (Fm.Font.ColorIndex>0)and (integer(Fm.Font.ColorIndex)<56) then
        AdvStringGrid.RowFontColor[rg]:=Workbook.ColorPalette[Fm.Font.ColorIndex];
    end;
  end;

  for c:=XlsStartCol to MaxC do
  begin
    cg:=c+GridStartCol-XlsStartCol;
    AdvStringGrid.ColWidths[cg]:=Round(Workbook.ColumnWidth[c]/ColMult*Zoom100)+CellOfs;
  end;

  //Import data
  for r:=XlsStartRow to MaxR do
  begin
    rg:=r+GridStartRow-XlsStartRow;
    for c:=XlsStartCol to MaxC do
    begin
      cg:=c+GridStartCol-XlsStartCol;
      Fm:=CellFormatDef(Workbook,r,c);

      //Merged Cells
      //We check this first, so if its not the first of a merged cell we exit
      Mb:=Workbook.CellMergedBounds[r,c];
      if ((Mb.Left<>c) or (Mb.Top<>r)) then continue;

      if ((Mb.Left=c) and (Mb.Top=r))and((Mb.Right> c)or (Mb.Bottom>r)) then
        AdvStringGrid.MergeCells(cg, rg, Mb.Right-Mb.Left+1, Mb.Bottom-Mb.Top+1);

      //Font
      if (Fm.Font.ColorIndex>0)and (integer(Fm.Font.ColorIndex)<56) then
        AdvStringGrid.FontColors[cg,rg]:=Workbook.ColorPalette[Fm.Font.ColorIndex]
        else AdvStringGrid.FontColors[cg,rg]:=0;
      AdvStringGrid.FontSizes[cg,rg]:= Trunc((Fm.Font.Size20 / 20 *Zoom100));
      AdvStringGrid.FontNames[cg,rg]:=Fm.Font.Name;
      if flsBold in Fm.Font.Style then
        AdvStringGrid.FontStyles[cg,rg]:=AdvStringGrid.FontStyles[cg,rg]+[fsBold];
      if flsItalic in Fm.Font.Style then
        AdvStringGrid.FontStyles[cg,rg]:=AdvStringGrid.FontStyles[cg,rg]+[fsItalic];
      if flsStrikeOut in Fm.Font.Style then
        AdvStringGrid.FontStyles[cg,rg]:=AdvStringGrid.FontStyles[cg,rg]+[fsStrikeOut];
      if Fm.Font.Underline<>fu_None then
        AdvStringGrid.FontStyles[cg,rg]:=AdvStringGrid.FontStyles[cg,rg]+[fsUnderline];

      //Pattern
      {Bmp:=nil;
      try
        if Fm.FillPattern.Pattern=1 then
        begin
          if (ACanvas.Brush.Color<>clwhite) then
            ACanvas.Brush.Color:=clwhite;
        end else
        if Fm.FillPattern.Pattern=2 then
        begin
          if (ACanvas.Brush.Color<>ABrushFg) then
            ACanvas.Brush.Color:=ABrushFg;
        end else
        begin
          Bmp:=CreateBmpPattern(Fm.FillPattern.Pattern, ABrushFg, ABrushBg);
          Acanvas.Brush.Bitmap:=Bmp;
        end;

        ACanvas.FillRect(Rect(Round(Cw*ZoomPreview), Round(Ch*ZoomPreview), Round((Cw+RealColWidth(Col,Zoom100,XPpi))*ZoomPreview), Round((Ch+RealRowHeight(Row,Zoom100,YPpi))*ZoomPreview)));

      finally
        ACanvas.Brush.Bitmap:=nil;
        FreeAndNil(Bmp);
      end; //finally
      }
      AdvStringGrid.Colors[cg,rg]:=GetColor(Workbook, Fm);

      if Fm.Rotation>0 then
        if Fm.Rotation<=90 then AdvStringGrid.SetRotated(cg, rg, Fm.Rotation) else
        if Fm.Rotation<=180 then AdvStringGrid.SetRotated(cg, rg, 90-Fm.Rotation);

      //pending: cellborders, brush, cell align, empty right cells, imagesize,
      //pending: fechas y otros formatos, copy/paste, events, comentarios on flexcel .

      //pending: export deafultreowheights/colwidths
      //Ask for: Rotated unicode. Image Size.  Vertical Aligns Word wraps in cells.
      //pending keepexcelformat on import/export don't work with dates
      //pending: export placement of images

      v:=Workbook.CellValue[r,c];

      //Cell Align
      case Fm.HAlignment of
        fha_left: HAlign:=taLeftJustify;
        fha_center:HAlign:=taCenter;
        fha_right: HAlign:=taRightJustify;
        else
        begin
        if VarType(v)=VarBoolean then HAlign:=taCenter else
          if (VarType(v)<>VarOleStr)and(VarType(v)<>VarString) then HAlign:=taRightJustify
          else HAlign:=taLeftJustify;
        end;
      end;//case

{      case Fm.VAlignment of
        fva_top: VAlign:=AL_TOP;
        fva_center: VAlign:=AL_VCENTER;
        else VAlign:=AL_BOTTOM ;
      end; //case
}
      AdvStringGrid.Alignments[cg, rg]:=HAlign;

      FontColor:=AdvStringGrid.FontColors[cg,rg];
      w:=XlsFormatValue(v,Fm.Format, FontColor);
      AdvStringGrid.FontColors[cg,rg]:=FontColor;

      if FKeepExcelCellFormat then
      begin
        if UseUnicode then
          AdvStringGrid.WideCells[cg,rg]:=w else
          AdvStringGrid.Cells[cg,rg]:=w;
      end else
      begin
        case VarType(V) of
          varByte,
          varSmallint,
          varInteger: AdvStringGrid.Ints[cg, rg]:=v;

          {$IFDEF ConditionalExpressions}{$if CompilerVersion >= 14} varInt64,{$IFEND}{$ENDIF} //Delphi 6 or above
          varCurrency,
          varSingle,
          varDouble:
          begin
            if HasXlsDateTime(Fm.Format, HasDate, HasTime) then
            begin
              if HasTime and HasDate then   //We can't map this to a date or time cell.
                if UseUnicode then
                  AdvStringGrid.WideCells[cg,rg]:=w else
                  AdvStringGrid.Cells[cg,rg]:=w

               else if HasDate then AdvStringGrid.Dates[cg, rg]:=v else AdvStringGrid.Times[cg, rg]:=v
            end
            else AdvStringGrid.Floats[cg, rg]:=v;
          end;

          varDate     : AdvStringGrid.Dates[cg, rg]:=v;
          else
            if UseUnicode then
              AdvStringGrid.WideCells[cg,rg]:=w else
              AdvStringGrid.Cells[cg,rg]:=w;

        end; //case
      end;
    end;

    //Import Comments
    for i:=0 to Workbook.CommentsCount[r]-1 do
      AdvStringGrid.AddComment( Workbook.CommentColumn[r,i]+GridStartCol-XlsStartCol, r+GridStartRow-XlsStartRow, Workbook.CommentText[r,i]);

  end;


end;

procedure TAdvGridExcelIO.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if Operation = opRemove then
  begin
    if AComponent = FAdapter then
        FAdapter:= nil;
    if AComponent = FAdvStringGrid then
        FAdvStringGrid:= nil;
  end;
end;

//procedure TAdvGridExcelIO.SetAdapter(const Value: TExcelAdapter);
//begin
//  FAdapter := Value;
//end;

procedure TAdvGridExcelIO.SetAdvStringGrid(const Value: TAdvStringGrid);
begin
  FAdvStringGrid := Value;
end;


procedure TAdvGridExcelIO.OpenText(const Workbook: TExcelFile; const FileName: TFileName;  const Delimiter: char);
{$IFNDEF TMSASG}
var
  DataStream: TFileStream;
{$ENDIF}
begin
{$IFNDEF TMSASG}
  DataStream:=TFileStream.Create(FileName, fmOpenRead);
  try
    Workbook.NewFile;
    LoadFromTextDelim(DataStream, Workbook, Delimiter, 1, 1, []);
  finally
    FreeAndNil(DataStream);
  end; //finally
{$ENDIF}
end;

procedure TAdvGridExcelIO.InternalXLSImport(const FileName: TFileName; const SheetNumber: integer; const SheetName: widestring);
var
  Workbook: TExcelFile;
  i: integer;
  Ext: string;
  aSheetNumber: integer;
begin
  aSheetNumber := SheetNumber;
  if AdvStringGrid=nil then raise Exception.Create(ErrNoAdvStrGrid);
  //Open the file
  if FAdapter=nil then
    Workbook:= TXLSFile.Create(nil) else
    Workbook:=FAdapter.GetWorkbook;
  try
    Workbook.Connect;
    Ext:=UpperCase(ExtractFileExt(FileName));
    if Ext='.CSV' then OpenText(Workbook, FileName, ListSeparator) else   //Note that ListSeparator mightbe other than "," (for example ";") so CSV might not be "comma" separated. This is the way excel handles it.
      if Ext='.TXT' then OpenText(Workbook, FileName, #9)  else
      Workbook.OpenFile(FileName);

    SetLength(FSheetNames, Workbook.SheetCount);
    for i:=0 to Workbook.SheetCount-1 do
    begin
      Workbook.ActiveSheet:=i+1;
      FSheetNames[i]:=Workbook.ActiveSheetName;
      if UpperCase(SheetName)=UpperCase(FSheetNames[i]) then aSheetNumber:=i+1;
    end;

    if (aSheetNumber=0) and (SheetName<>'') then raise Exception.CreateFmt(ErrInvalidSheetName,[SheetName]);
    if (aSheetNumber>0) and (aSheetNumber<=Workbook.SheetCount) then
    begin
      Workbook.ActiveSheet:=aSheetNumber;
      Workbook.SelectSheet(aSheetNumber);
    end
       else raise Exception.CreateFmt(ErrIndexOutBounds,[aSheetNumber, 'ActiveSheet',1,Workbook.SheetCount]);

    Workbook.ParseComments;
    ImportData(Workbook);
    AdvStringGrid.VAlignment:=vtaBottom;
  finally
    CloseFile(Workbook);
  end;
end;

procedure TAdvGridExcelIO.XLSImport(const FileName: TFileName; const SheetName: widestring);
begin
  if SheetName='' then raise Exception.CreateFmt(ErrInvalidSheetName,[SheetName]);
  InternalXLSImport(FileName, 0, SheetName);
end;

procedure TAdvGridExcelIO.XLSImport(const FileName: TFileName; const SheetNumber: integer);
begin
  InternalXLSImport(FileName, SheetNumber, '');
end;


procedure TAdvGridExcelIO.ExportImage(const Workbook: TExcelFile; const Pic: TPicture; const rx, cx, cg, rg: integer);
//Adapted from FlexCelImport.AddPicture
var
  s: string;
  Ms: TMemoryStream;
  Props: TImageProperties;
  PicType: TXlsImgTypes;
  JPic: TJPEGImage;
  BPic: TBitmap;
  PSize, CSize: TPoint;
  dh, dw: integer;
  Cr: TCellGraphic;
begin
  PicType:=xli_Jpeg;
  {$IFDEF USEPNGLIB}
    if Pic.Graphic is TPNGObject then PicType:=xli_Png;
  {$ENDIF}

  Ms:=TMemoryStream.Create;
  try

    if (PicType=xli_Jpeg) and not (Pic.Graphic is TJPEGImage) then
    begin  //Convert the image
      JPic:=TJPEGImage.Create;
      try
        BPic:=TBitmap.Create;  //we cant assign a metafile to a jpeg, so the temporary bitmap.
        try
          BPic.Width:=Pic.Width;
          BPic.Height:=Pic.Height;
          BPic.Canvas.Draw(0,0, Pic.Graphic);
          JPic.Assign(BPic);
        finally
          FreeAndNil(BPic);
        end; //finally
        JPic.SaveToStream(Ms);
      finally
        FreeAndNil(JPic);
      end; //finally
    end
    else
      Pic.Graphic.SaveToStream(Ms);

    Ms.Position:=0;
    SetLength(s, Ms.Size);
    Ms.Read(s[1], Ms.Size);
    PSize:=AdvStringGrid.CellGraphicSize[cg, rg];
    CSize:=AdvStringGrid.CellSize(cg, rg);
    dh:=1;
    dw:=1;
    Cr:=AdvStringGrid.CellGraphics[cg, rg];

    case Cr.CellHAlign of
    haLeft:
      begin
        //Nothing, this is default
      end;
    haRight:
      begin
        dw:= CSize.X - PSize.X;
      end;
    haCenter:
      begin
        if (PSize.X < CSize.X) then
        begin
          dw:=(CSize.X-PSize.X) div 2;
        end
      end;
    haBeforeText:
      begin
        //Nothing
      end;
    haAfterText:
      begin
        //Nothing
      end;
    haFull:
      begin
        //Nothing
      end;
    end;

    case Cr.CellVAlign  of
    vaTop,vaAboveText:
      begin
        //This is default
      end;
    vaBottom:
      begin
        dh:=CSize.Y - PSize.Y;
      end;
    vaCenter:
      begin
        if PSize.Y < CSize.Y then
        begin
          dh:=(CSize.Y - PSize.Y) div 2;
        end
      end;
    vaUnderText:
      begin
        //Nothing
      end;
    vaFull:
      begin
        //Nothing
      end;
    end;


    CalcImgCells(Workbook, rx, cx, dh, dw, PSize.y, PSize.x, Props);
    Workbook.AddImage(s, PicType, Props, at_MoveAndDontResize);
  finally
    FreeAndNil(Ms);
  end; //finally
end;

procedure TAdvGridExcelIO.ExportData(const Workbook: TExcelFile);
var
  Zoom100: extended;
  rg, cg, rx, cx: integer;
  Fm: TFlxFormat;

  w: widestring;

  Pic: TPicture;

  AState: TGridDrawState;
  ABrush: TBrush;
  AColorTo: TColor;
  AFont: TFont;
  HA: TAlignment; var VA: TVAlignment; WW: Boolean;
  cp: TCellProperties;
  AAngle: integer;

  Comment: string;
  Properties: TImageProperties;
  Cr: TXlsCellRange;
  aDateFormat, aTimeFormat: widestring;
begin
  Zoom100:=1;
  Assert(Workbook<>nil,'Workbook can''t be nil');
  Assert(AdvStringGrid<>nil,'AdvStringGrid can''t be nil');

  //Workbook.DefaultRowHeight:=Round(AdvStringGrid.DefaultRowHeight*RowMult/Zoom100);
  //Workbook.DefaultColWidth:=Round(AdvStringGrid.DefaultColWidth*ColMult/Zoom100);

  //Adjust Row/Column sizes and set Row/Column formats
  for rg:=GridStartRow to AdvStringGrid.RowCount-1 do
  begin
    rx:=rg-GridStartRow+XlsStartRow;
    Workbook.RowHeight[rx]:=Round(AdvStringGrid.RowHeights[rg]*RowMult/Zoom100)-CellOfs;
  end;

  for cg:=GridStartCol to AdvStringGrid.ColCount-1 do
  begin
    cx:=cg-GridStartCol+XlsStartCol;
    Workbook.ColumnWidth[cx]:=Round(AdvStringGrid.ColWidths[cg]*ColMult/Zoom100)-CellOfs;
  end;

  //Export data
  for rg:=GridStartRow to AdvStringGrid.RowCount-1 do
  begin
    rx:=rg-GridStartRow+XlsStartRow;
    for cg:=GridStartCol to AdvStringGrid.ColCount-1 do
    begin
      cx:=cg-GridStartCol+XlsStartCol;

      cp:=AdvStringGrid.GetCellProperties(cg, rg);
      //Merged Cells
      //We check this first, so if its not the first of a merged cell we exit
      if not (cp.IsBaseCell) then continue;

      if (cp.CellSpanX>0)or(cp.CellSpanY>0) then Workbook.MergeCells(rx, cx, rx+cp.CellSpanY, cx+cp.CellSpanX);
      Fm:=CellFormatDef(Workbook,rx,cx);
      AFont:=TFont.Create;
      try
        ABrush:=TBrush.Create;
        try
          AdvStringGrid.GetVisualProperties(cg, rg, AState, false, false, false, ABrush, AColorTo, AFont, HA, VA, WW);

          //Font
          Fm.Font.ColorIndex:=MatchNearestColor(Workbook, AFont.Color);
          Fm.Font.Size20:= Trunc(-AFont.Height * 72/AFont.PixelsPerInch  *20/Zoom100);
          Fm.Font.Name:=AFont.Name;
          if fsBold in AFont.Style then
            Fm.Font.Style:=Fm.Font.Style+[flsBold] else Fm.Font.Style:=Fm.Font.Style-[flsBold];
          if fsItalic in AFont.Style then
            Fm.Font.Style:=Fm.Font.Style+[flsItalic] else Fm.Font.Style:=Fm.Font.Style-[flsItalic];
          if fsStrikeOut in AFont.Style then
            Fm.Font.Style:=Fm.Font.Style+[flsStrikeOut] else Fm.Font.Style:=Fm.Font.Style-[flsStrikeOut];
          if fsUnderline in AFont.Style then
            Fm.Font.Underline:=fu_Single else Fm.Font.Underline:=fu_None;

          //Pattern
          {Bmp:=nil;
          try
            if Fm.FillPattern.Pattern=1 then
            begin
              if (ACanvas.Brush.Color<>clwhite) then
                ACanvas.Brush.Color:=clwhite;
            end else
            if Fm.FillPattern.Pattern=2 then
            begin
              if (ACanvas.Brush.Color<>ABrushFg) then
                ACanvas.Brush.Color:=ABrushFg;
            end else
            begin
              Bmp:=CreateBmpPattern(Fm.FillPattern.Pattern, ABrushFg, ABrushBg);
              Acanvas.Brush.Bitmap:=Bmp;
            end;

            ACanvas.FillRect(Rect(Round(Cw*ZoomPreview), Round(Ch*ZoomPreview), Round((Cw+RealColWidth(Col,Zoom100,XPpi))*ZoomPreview), Round((Ch+RealRowHeight(Row,Zoom100,YPpi))*ZoomPreview)));

          finally
            ACanvas.Brush.Bitmap:=nil;
            FreeAndNil(Bmp);
          end; //finally
          }
          if ColorToRGB(ABrush.Color)=$FFFFFF then
          begin
            Fm.FillPattern.Pattern:=1; //no fill
          end else
          begin
            Fm.FillPattern.Pattern:=2; //Solid fill
            Fm.FillPattern.FgColorIndex:=MatchNearestColor(Workbook, ABrush.Color);
          end;

          if AdvStringGrid.IsRotated(cg, rg, AAngle) then
          begin
            if AAngle<0 then AAngle:= 360-(Abs(AAngle) mod 360) else
              AAngle:=AAngle mod 360;
            if (AAngle>=0) and (AAngle<=90) then Fm.Rotation:=AAngle
            else if (AAngle>=270) then Fm.Rotation:=360-AAngle+90;
          end;

          if FUseUnicode then w:= AdvStringGrid.WideCells[cg, rg] else
            w:= AdvStringGrid.Cells[cg, rg];

          //Cell Align
          case HA of
            taLeftJustify: Fm.HAlignment:=fha_left;
            taCenter:Fm.HAlignment:=fha_center;
            taRightJustify: Fm.HAlignment:=fha_right;
            else Fm.HAlignment:=fha_general;
          end;//case

          case VA of
            vtaTop: Fm.VAlignment:=fva_top;
            vtaCenter: Fm.VAlignment:=fva_center;
            else Fm.VAlignment:=fva_bottom ;
          end; //case

          if FKeepExcelCellFormat then
          begin
            aDateFormat:=FDateFormat;
            aTimeFormat:=FTimeFormat;
            if Assigned(OnDateTimeFormat) then
              OnDateTimeFormat(AdvStringGrid, cg, rg, cx, rx, w, aDateFormat, aTimeFormat);

            Workbook.SetCellString(rx, cx, w, Fm, aDateFormat, aTimeFormat);
          end else
          begin
            Workbook.CellValue[rx, cx]:=w;
            Workbook.CellFormat[rx, cx]:=Workbook.AddFormat(Fm);
          end;
        finally
          FreeAndNil(ABrush);
        end; //finally
      finally
        FreeAndNil(AFont);
      end; //finally

      //Export Images
      Pic:=AdvStringGrid.GetPicture(cg, rg);
      if Pic<>nil then
      begin
        ExportImage(Workbook, Pic, rx, cx, cg, rg);
      end;

    //Export Comments
    if AdvStringGrid.IsComment(cg, rg, Comment) then
    begin
      Cr:=Workbook.CellMergedBounds[rx, cx];
      CalcImgCells(Workbook, rx-1, cx+Cr.Right-Cr.Left+1, 8, 14, 75 , 130, Properties);
      Workbook.SetCellComment(rx, cx, Comment, Properties);
    end;

    end;
  end;
end;


procedure TAdvGridExcelIO.XLSExport(const FileName: TFileName; const SheetName: widestring);
var
  Workbook: TExcelFile;
begin
  if AdvStringGrid=nil then raise Exception.Create(ErrNoAdvStrGrid);
  //Open the file
  if FAdapter=nil then
    Workbook:= TXLSFile.Create(nil) else
    Workbook:=FAdapter.GetWorkbook;
  try
    Workbook.Connect;
    Workbook.NewFile;
    ExportData(Workbook);
    if SheetName<>'' then Workbook.ActiveSheetName:=SheetName;
    Workbook.Save(true, FileName, nil);
  finally
    CloseFile(Workbook);
  end;
end;

constructor TAdvGridExcelIO.Create(AOwner: TComponent);
begin
  inherited;
  FAutoResizeGrid := true;
  FLoadImages := true;

  FGridStartCol := 1;
  FGridStartRow := 1;
  FXlsStartCol := 1;
  FXlsStartRow := 1;

  FZoomSaved := true;
  FZoom := 100;
  FKeepExcelCellFormat := true;
end;

function TAdvGridExcelIO.GetSheetNames(index: integer): widestring;
begin
  Result:=FSheetNames[index];
end;

function TAdvGridExcelIO.GetSheetNamesCount: integer;
begin
  Result:=Length(FSheetNames);
end;

procedure TAdvGridExcelIO.SetGridStartCol(const Value: integer);
begin
  if Value>=0 then FGridStartCol := Value else FGridStartCol:=1;
end;

procedure TAdvGridExcelIO.SetGridStartRow(const Value: integer);
begin
  if Value>=0 then FGridStartRow := Value else FGridStartRow:=1;
end;

procedure TAdvGridExcelIO.SetXlsStartCol(const Value: integer);
begin
  if Value>0 then FXlsStartCol := Value else FXlsStartCol:=1;
end;

procedure TAdvGridExcelIO.SetXlsStartRow(const Value: integer);
begin
  if Value>0 then FXlsStartRow := Value else FXlsStartRow:=1;
end;

procedure TAdvGridExcelIO.SetZoom(const Value: integer);
begin
  if Value<10 then FZoom:=10 else if Value>400 then FZoom:=400 else
    FZoom := Value;
end;

{$ENDIF}

end.
