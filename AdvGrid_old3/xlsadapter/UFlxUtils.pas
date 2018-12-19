unit UFlxUtils;

interface
uses UExcelAdapter, UFlxMessages, SysUtils, XlsMessages;
////////////////////////////////////////////////////////////////////////////
  procedure CalcImgCells(const Workbook: TExcelFile; const Row, Col, dh, dw, ImgHeight, ImgWidth: integer; var Props: TImageProperties);
  procedure CalcImgDimentions(const Workbook: TExcelFile; const Anchor: TClientAnchor; var w, h: integer);
  function MatchNearestColor(const Workbook: TExcelFile;const aColor: integer): integer;
/////////////////////////////////////////////////////////////////////////////
implementation

function MatchNearestColor(const Workbook: TExcelFile;const aColor: integer): integer;
type
  TCb= array[0..3] of byte;
var
  i: integer;
  sq, MinSq: extended;
  ac1, ac2: TCb;
begin
  Result:=1;
  MinSq:=-1;
  ac1:=TCb(aColor);
  for i:=1 to 55 do
  begin
    ac2:=TCb(Workbook.ColorPalette[i]);
    sq := Sqr(ac2[0] - ac1[0]) +
          Sqr(ac2[1] - ac1[1]) +
          Sqr(ac2[2] - ac1[2]);
    if (MinSq<0) or (sq< MinSq) then
    begin
      MinSq:=sq;
      Result:=i;
      if sq=0 then exit; //exact match...
    end;
  end;
end;
////////////////////////////////////////////////////////////////////////
procedure CalcImgCells(const Workbook: TExcelFile; const Row, Col, dh, dw, ImgHeight, ImgWidth: integer; var Props: TImageProperties);

  function Rh(const Row: integer): extended;
  begin
    if not Workbook.IsEmptyRow(Row) then Result:=Workbook.RowHeight[Row]/RowMult else
      Result:=Workbook.DefaultRowHeight/RowMult;
  end;

  function Cw(const Col: integer): extended;
  begin
    Result:=Workbook.ColumnWidth[Col]/ColMult;
  end;

var
  r, c : integer;
  h, w: extended;
  Row1, Col1: integer;
  dx1, dy1: extended;
begin
  if Workbook=nil then raise Exception.Create(ErrNoOpenFile);
  FillChar(Props, SizeOf(Props), 0); //Just to make sure all record is empty

  Row1:=Row; Col1:=Col; dx1:=dw; dy1:=dh;
  //If delta spawns more than one cell, advance the cells.
  while dx1>Cw(Col1) do
  begin
    dx1:=dx1- Cw(Col1);
    inc(Col1);
  end;
  while dy1>Rh(Row1) do
  begin
    dy1:=dy1- Rh(Row1);
    inc(Row1);
  end;

  if Row1<1 then begin Row1:=1;dy1:=0;end;
  if Col<1 then begin Col1:=1;dx1:=0;end;

  Props.Row1:=Row1;
  Props.Col1:=Col1;
  Props.dx1:=Round(1024*dx1/Cw(Col1));
  Props.dy1:=Round(255*dy1/Rh(Row1));

  r:=Row1; h:=Rh(Row1)-dy1;
  while Round(h)<ImgHeight do
  begin
    inc(r);
    h:=h+ Rh(r);
  end;
  Props.Row2:=r;
  Props.dy2:=Round((Rh(r)-(h-ImgHeight))/Rh(r)*255);

  c:=Col1; w:=Cw(Col1)-dx1;
  while Round(w)<ImgWidth do
  begin
    inc(c);
    w:=w+Cw(c);
  end;
  Props.Col2:=c;
  Props.dx2:=Round((Cw(c)-(w-ImgWidth))/Cw(c)*1024);

  if Props.Row2>Max_Rows+1 then
  begin
    Props.Row1:=Max_Rows+1-(Props.Row2-Props.Row1);
    Props.Row2:=Max_Rows+1;
  end;
  if Props.Col2>Max_Columns+1 then
  begin
    Props.Col1:=Max_Columns+1-(Props.Col2-Props.Col1);
    Props.Col2:=Max_Columns+1;
  end;
  //Just in case of an image bigger than the spreadsheet...
  if Props.Col1<1 then Props.Col1:=1;
  if Props.Row1<1 then Props.Row1:=1;
end;

procedure CalcImgDimentions(const Workbook: TExcelFile; const Anchor: TClientAnchor; var w, h: integer);

  function Rh(const Row: integer): extended;
  begin
    if not Workbook.IsEmptyRow(Row) then Result:=Workbook.RowHeight[Row]/RowMult else
      Result:=Workbook.DefaultRowHeight/RowMult;
  end;

  function Cw(const Col: integer): extended;
  begin
    Result:=Workbook.ColumnWidth[Col]/ColMult;
  end;

var
  i: integer;
begin
  w:=0;
  for i:=Anchor.Col1 to Anchor.Col2-1 do inc(w, Round(Cw(i)));
  dec(w, Round(Cw(Anchor.Col1)*(Anchor.Dx1)/1024));
  inc(w, Round(Cw(Anchor.Col2)*(Anchor.Dx2)/1024));

  h:=0;
  for i:=Anchor.Row1 to Anchor.Row2-1 do inc(h, Round(Rh(i)));
  dec(h, Round(Rh(Anchor.Row1)*(Anchor.Dy1)/255));
  inc(h, Round(Rh(Anchor.Row2)*(Anchor.Dy2)/255));
end;

end.
