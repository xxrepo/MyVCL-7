unit StocksMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls,  ToolWin, DB, DBTables, Menus, ImgList,
  cxControls, cxSSheet, cxSSUtils, cxSSTypes, cxSSHeaders, cxSSStyles,
  StdActns, ActnList;


type
  TStocksMainForm = class(TForm)
    edtCellEdit: TEdit;
    imgStandart       : TImageList;
    pnCellsRect: TPanel;
    Panel2            : TPanel;
    Query: TQuery;
    SaveDialog: TSaveDialog;
    ToolBar1          : TToolBar;
    ToolBar2          : TToolBar;
    alMain: TActionList;
    actDeleteCells: TAction;
    actSaveSpeadSheet: TAction;
    actInsertCells: TAction;
    actExit: TAction;
    actCut: TAction;
    actCopy: TAction;
    actPaste: TAction;
    actFormatCells: TAction;
    actHideCells: TAction;
    actShowCells: TAction;
    actHideCol: TAction;
    actShowCol: TAction;
    actHideRow: TAction;
    actShowRow: TAction;
    pmSheetPopup: TPopupMenu;
    pmiCut: TMenuItem;
    pmiCopy: TMenuItem;
    pmiPaste: TMenuItem;
    N6: TMenuItem;
    actMerge1: TMenuItem;
    actSplitCells1: TMenuItem;
    MenuItem1: TMenuItem;
    pmiDelete: TMenuItem;
    pmiInsert: TMenuItem;
    MenuItem2: TMenuItem;
    pmiCols: TMenuItem;
    pmiColsHide: TMenuItem;
    pmiColsShow: TMenuItem;
    pmiRows: TMenuItem;
    pmiRowsHide: TMenuItem;
    pmiRowsShow: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    pmiFormatCells: TMenuItem;
    ToolBar3: TToolBar;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    mnuMain: TMainMenu;
    mnuFile: TMenuItem;
    miSaveSpreadSheet: TMenuItem;
    MenuItem6: TMenuItem;
    miExit: TMenuItem;
    mnuEdit: TMenuItem;
    miCut: TMenuItem;
    miCopy: TMenuItem;
    miPaste: TMenuItem;
    N7: TMenuItem;
    miCells: TMenuItem;
    miFormat: TMenuItem;
    miHide: TMenuItem;
    miShow: TMenuItem;
    miDeletecells: TMenuItem;
    Insertcells1: TMenuItem;
    miColumns: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    miRows: TMenuItem;
    Hide3: TMenuItem;
    Show3: TMenuItem;
    mnuConfig: TMenuItem;
    actApplyFormatting: TAction;
    actLoadData: TAction;
    ApplyFormatting1: TMenuItem;
    LoadData1: TMenuItem;
    cxSpreadBook: TcxSpreadSheetBook;
    Panel3: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button4: TButton;
    Button3: TButton;
    actSplitCells: TAction;
    actMergeCells: TAction;
    procedure FormShow(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure cxSpreadBookSetSelection(Sender: TObject;
      ASheet: TcxSSBookSheet);
    procedure cxSpreadBookSheetPopupMenu(Sender: TObject; X,
      Y: Integer);
    procedure edtCellEditKeyPress(Sender: TObject; var Key: Char);
    procedure actCellsExecute(Sender: TObject);
    procedure actFormatCellsExecute(Sender: TObject);
    procedure actHideCellsExecute(Sender: TObject);
    procedure actShowCellsExecute(Sender: TObject);
    procedure actHideColExecute(Sender: TObject);
    procedure actShowColExecute(Sender: TObject);
    procedure actHideRowExecute(Sender: TObject);
    procedure actShowRowExecute(Sender: TObject);
    procedure actCutExecute(Sender: TObject);
    procedure actCopyExecute(Sender: TObject);
    procedure actPasteExecute(Sender: TObject);
    procedure actSaveSpeadSheetExecute(Sender: TObject);
    procedure actExitExecute(Sender: TObject);
    procedure actApplyFormattingUpdate(Sender: TObject);
    procedure actSaveSpeadSheetUpdate(Sender: TObject);
    procedure actLoadDataExecute(Sender: TObject);
    procedure AlwaysEnabled(Sender: TObject);
    procedure edtCellEditChange(Sender: TObject);
    procedure edtCellEditExit(Sender: TObject);
    procedure actApplyFormattingExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actMergeCellsExecute(Sender: TObject);
    procedure actSplitCellsExecute(Sender: TObject);
  private
    CurRow : Integer;
    FIsUpdate: Boolean;
    FIsApplyFormatting: Boolean;
    FSaveSpreadSheet: Boolean;
    procedure SetCellText(ACol, ARow : Integer; AText : String);
    procedure SetCellDate(ACol, ARow : Integer; ADate : TDateTime);
    procedure SetCellFont(ALeftCol, ATopRow, ARightCol, ABottomRow : Integer;
                          AStyle : TFontStyles; ASize : Integer);
    procedure SetCellPattern(ALeftCol, ATopRow, ARightCol, ABottomRow,
                             ABackground, AForeGround : Integer; AFillStyle : TcxSSFillStyle);
    procedure SetCellFormat(ALeftCol, ATopRow, ARightCol, ABottomRow,
                            AFormat : Integer);
    procedure SetCellAlignment(ALeftCol, ATopRow, ARightCol, ABottomRow : Integer;
                               AHorzAlign : TcxHorzTextAlign; AVertAlign : TcxVertTextAlign);
    procedure SetCellBorders(ALeftCol, ATopRow, ARightCol, ABottomRow : Integer;
                             AEdge: integer; AStyle: TcxSSEdgeLineStyle);
    procedure SaveSpreadSheet;
    function GetCellText(SelectionRect: TRect; R1C1: Boolean): String;
  end;

var
  StocksMainForm: TStocksMainForm;

implementation

uses StocksModify;

{$R *.dfm}

procedure TStocksMainForm.FormShow(Sender: TObject);
begin
  with cxSpreadBook do
  begin
    BeginUpdate;
    Try
      AutoRecalc := False;
      ActiveSheet.Caption := 'Current';                    // set the page caption for the first page
      AddSheetPage('HiLo');                                // add a second page and set it's caption
      ActivePage := 0;                                     // turn our attention to the first page
      SetCellText(0,0,'Current Stockholding Valuations');  // set a title in the first column, first row cell
      SetCellText(0,2,'Company');                          // Col A - Set column titles
      SetCellText(1,2,'Holding');                          // B
      SetCellText(2,2,'Purchased');                        // C
      SetCellText(3,2,'Price');                            // D
      SetCellText(4,2,'Cost');                             // E  = B * D
      SetCellText(5,2,'Value');                            // F
      SetCellText(6,2,'Worth');                            // G  = B * F
      SetCellText(7,2,'Gain');                             // H  = G - E
      SetCellText(8,2,'%age Gain');                        // I  = H / E
      ActivePage := 1;                                     // switch to the second page
      SetCellText(0,0,'High, Low and Current Stock Prices');
      SetCellText(0,2,'Company');                          // Col A
      SetCellText(1,2,'Price');                            //     B
      SetCellText(2,2,'High');                             //     C
      SetCellText(3,2,'Low');                              //     D
      SetCellText(4,2,'Average');                          //     E
      AutoRecalc := True;
      ActivePage := 0;                                     // back to the first page
      cxSpreadBookSetSelection(Nil,ActiveSheet);           // call to set the current cell and cell contents display
    Finally
      EndUpdate;
    end;
  end;
end;

procedure TStocksMainForm.ToolButton1Click(Sender: TObject);
begin
  with SaveDialog do                                       // using the standard save dialog
    if Execute then                                        // if executed,
      cxSpreadBook.SaveToFile(FileName);                   // then save the spreadsheet
end;

procedure TStocksMainForm.Button4Click(Sender: TObject);
begin
  Close;
end;

procedure TStocksMainForm.cxSpreadBookSetSelection(Sender: TObject;
  ASheet: TcxSSBookSheet);
var
  CellObject: TcxSSCellObject;
begin
  CellObject := cxSpreadBook.ActiveSheet.GetCellObject(ASheet.SelectionRect.Left, ASheet.SelectionRect.Top);
  try
    FIsUpdate := True;
    edtCellEdit.Text := CellObject.Text;
    pnCellsRect.Caption := GetCellText(ASheet.SelectionRect, cxSpreadBook.R1C1ReferenceStyle);
  finally
    CellObject.Free;
    FIsUpdate := False;
  end;
end;

procedure TStocksMainForm.cxSpreadBookSheetPopupMenu(Sender: TObject; X,
  Y: Integer);
begin
  pmSheetPopup.Popup(X, Y);                                // popup our menu where clicked
end;

procedure TStocksMainForm.edtCellEditKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then                                        // pressing RETURN in our edit box
    Windows.SetFocus(cxSpreadBook.Handle);                 // set focus back to the spreadsheet
end;

procedure TStocksMainForm.SetCellText(ACol, ARow : Integer; AText : String);
begin
  // get a cell object for the request col and row
  with cxSpreadBook.ActiveSheet.GetCellObject(ACol,ARow) do
  begin
    try
      Text := AText;
    finally
      Free;                                                // and free it (important!)
    end;
  end;
end;

procedure TStocksMainForm.SetCellDate(ACol, ARow : Integer; ADate : TDateTime);
begin
  // get a cell object for the request col and row
  with cxSpreadBook.ActiveSheet.GetCellObject(ACol,ARow) do
  begin
    try
      DateTime := ADate;
    finally
      Free;                                                // free it
    end;
  end;
end;

procedure TStocksMainForm.SetCellFont(ALeftCol, ATopRow, ARightCol, ABottomRow : Integer; AStyle : TFontStyles; ASize : Integer);
var
  I, J : Integer;
begin
  with cxSpreadBook.ActiveSheet do                         // using our active page
    for I := ALeftCol to ARightCol do                      // for each column specified
      for J := ATopRow to ABottomRow do                    // for each row specified
        with GetCellObject(I,J) do                         // get the cell
          try
            Style.Font.Style := AStyle;
            Style.Font.Size := ASize;
          finally
            Free;                                          // free it
          end;
end;

procedure TStocksMainForm.SetCellPattern(ALeftCol, ATopRow, ARightCol, ABottomRow, ABackground, AForeGround : Integer; AFillStyle : TcxSSFillStyle);
var
  I, J : Integer;
begin
  with cxSpreadBook.ActiveSheet do                         // using our active page
    for I := ALeftCol to ARightCol do                      // for each column specified
      for J := ATopRow to ABottomRow do                    // for each row specified
        with GetCellObject(I,J) do                         // get the cell
          try
            Style.Brush.BackgroundColor := ABackground;
            Style.Brush.ForegroundColor := AForeground;
            Style.Brush.Style := AFillStyle;
          finally
            Free;
          end;
end;

procedure TStocksMainForm.SetCellFormat(ALeftCol, ATopRow, ARightCol, ABottomRow, AFormat : Integer);
var
  I, J : Integer;
begin
  with cxSpreadBook.ActiveSheet do                         // using our active page
    for I := ALeftCol to ARightCol do                      // for each column specified
      for J := ATopRow to ABottomRow do                    // for each row specified
        with GetCellObject(I,J) do                         // get the cell
          try
            Style.Format := AFormat;
          finally
            Free;                                          // free it
          end;
end;

procedure TStocksMainForm.SetCellAlignment(ALeftCol, ATopRow, ARightCol, ABottomRow : Integer;
                                  AHorzAlign : TcxHorzTextAlign; AVertAlign : TcxVertTextAlign);
var
  I, J : Integer;
begin
  with cxSpreadBook.ActiveSheet do                         // using our active page
    for I := ALeftCol to ARightCol do                      // for each column specified
      for J := ATopRow to ABottomRow do                    // for each row specified
        with GetCellObject(I,J) do                         // get the cell
          try
            Style.HorzTextAlign := AHorzAlign;
            Style.VertTextAlign := AVertAlign;
          finally
            Free;                                          // free it
          end;
end;

procedure TStocksMainForm.SetCellBorders(ALeftCol, ATopRow, ARightCol, ABottomRow : Integer;
                                AEdge: Integer; AStyle: TcxSSEdgeLineStyle);
var
  I, J : Integer;
begin
  with cxSpreadBook.ActiveSheet do                         // using our active page
    for I := ALeftCol to ARightCol do                      // for each column specified
      for J := ATopRow to ABottomRow do                    // for each row specified
        with GetCellObject(I,J) do                         // get the cell
          try
            Case AEdge of                                  // depending on which edge has been requested
              0: Style.Borders.Left.Style   := AStyle;     // set to the specified style
              1: Style.Borders.Top.Style    := AStyle;
              2: Style.Borders.Right.Style  := AStyle;
              3: Style.Borders.Bottom.Style := AStyle;
            end;
          finally
            Free;                                          // free it
          end;
end;

procedure TStocksMainForm.actCellsExecute(Sender: TObject);
var
  AForm :TStocksModifyForm;
const
  AFormType: array[Boolean] of TcxSSModifyType = (mtDelete, mtInsert);
begin
   if FIsUpdate then Exit;
   AForm := TStocksModifyForm.Create(Self);
   AForm.Top := (Top + Height) shr 1;
   AForm.Left := (Left + Width) shr 1;
   try
     if AForm.Execute(AFormType[TCustomAction(Sender).Tag = 1]) then
       with cxSpreadBook.ActiveSheet do
         case TCustomAction(Sender).Tag of
           0:
             DeleteCells(SelectionRect, AForm.Modify);
           1:
             InsertCells(SelectionRect, AForm.Modify);
         end;
   finally
     AForm.Free;
   end;
end;

procedure TStocksMainForm.actFormatCellsExecute(Sender: TObject);
begin
  with cxSpreadBook.ActiveSheet do
    FormatCells(SelectionRect);
end;

procedure TStocksMainForm.actHideCellsExecute(Sender: TObject);
begin
  if FIsUpdate then Exit;
  with cxSpreadBook.ActiveSheet do
    SetVisibleState(SelectionRect, True, True, False);
end;

procedure TStocksMainForm.actShowCellsExecute(Sender: TObject);
begin
  if FIsUpdate then Exit;
  with cxSpreadBook.ActiveSheet do
    SetVisibleState(SelectionRect, True, True, True);
end;

procedure TStocksMainForm.actHideColExecute(Sender: TObject);
begin
  if FIsUpdate then Exit;
  with cxSpreadBook.ActiveSheet do
    SetVisibleState(SelectionRect, True, False, False);
end;

procedure TStocksMainForm.actShowColExecute(Sender: TObject);
begin
  if FIsUpdate then Exit;
  with cxSpreadBook.ActiveSheet do
    SetVisibleState(SelectionRect, True, False, True);
end;

procedure TStocksMainForm.actHideRowExecute(Sender: TObject);
begin
  if FIsUpdate then Exit;
  with cxSpreadBook.ActiveSheet do
    SetVisibleState(SelectionRect, False, True, False);
end;

procedure TStocksMainForm.actShowRowExecute(Sender: TObject);
begin
  if FIsUpdate then Exit;
  with cxSpreadBook.ActiveSheet do
    SetVisibleState(SelectionRect, False, True, True);
end;

procedure TStocksMainForm.actCutExecute(Sender: TObject);
begin
  with cxSpreadBook.ActiveSheet do
    Copy(SelectionRect, True);
end;

procedure TStocksMainForm.actCopyExecute(Sender: TObject);
begin
  with cxSpreadBook.ActiveSheet do
    Copy(SelectionRect, False);
end;

procedure TStocksMainForm.actPasteExecute(Sender: TObject);
begin
  with cxSpreadBook.ActiveSheet do
    Paste(SelectionRect.TopLeft);
end;

procedure TStocksMainForm.actSaveSpeadSheetExecute(Sender: TObject);
begin
  SaveSpreadSheet;
end;

procedure TStocksMainForm.SaveSpreadSheet;
var
  AFileName: string;
begin
  if SaveDialog.Execute then
  begin
    AFileName := ChangeFileExt(SaveDialog.FileName, '.xls');
    cxSpreadBook.SaveToFile(AFileName );
    ActiveMDIChild.Caption := AFileName;
  end;
end;

procedure TStocksMainForm.actExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TStocksMainForm.actApplyFormattingUpdate(Sender: TObject);
begin
  TCustomAction(Sender).Enabled := FIsApplyFormatting;
end;

procedure TStocksMainForm.actSaveSpeadSheetUpdate(Sender: TObject);
begin
  TCustomAction(Sender).Enabled := FSaveSpreadSheet;
end;

procedure TStocksMainForm.actLoadDataExecute(Sender: TObject);
var
  CurCursor : TCursor;
begin
  CurCursor := Screen.Cursor;                              // preserve the current cursor
  Screen.Cursor := crHourGlass;
  try
    cxSpreadBook.BeginUpdate;
    cxSpreadBook.ActivePage := 0;                          // ensure we are looking at the right page
    CurRow := 3;                                           // set the starting current row
    With Query do                                          // and using our database query
    begin
      Open;                                                // open the data
      While NOT EOF do                                     // and for every record
      begin
        SetCellText(0,CurRow,                              // set the company name
                         FieldByName('CO_NAME').AsString);
        SetCellText(1,CurRow,                              // the number of shares
                          FieldByName('SHARES').AsString);
        SetCellDate(2,CurRow,                              // the purchase date
                      FieldByName('PUR_DATE').AsDateTime);
        SetCellText(3,CurRow,                              // the purchase price
                       FieldByName('PUR_PRICE').AsString);
        SetCellText(4,CurRow,                              // calculate the purchase cost = number of shares * purchase price
              Format('=B%d*D%d/100',[CurRow+1,CurRow+1]));
        SetCellText(5,CurRow,                              // the current price
                       FieldByName('CUR_PRICE').AsString);
        SetCellText(6,CurRow,                              // calculate the current valuation = number of shares * current price
              Format('=B%d*F%d/100',[CurRow+1,CurRow+1]));
        SetCellText(7,CurRow,                              // calculate the gain/loss = current valuation - purchase cost
                  Format('=G%d-E%d',[CurRow+1,CurRow+1]));
        SetCellText(8,CurRow,                              // calculate the % gain/loss
                  Format('=H%d/E%d',[CurRow+1,CurRow+1]));
        Next;
        Inc(CurRow);                                       // bump the row number
      end;
      Inc(CurRow);
      SetCellText(4,CurRow,                                // set the formula for the total purchase cost
                       Format('=SUM(E3:E%d)',[CurRow-1]));
      SetCellText(6,CurRow,                                //                         total current valuation
                       Format('=SUM(G3:G%d)',[CurRow-1]));
      SetCellText(7,CurRow,                                //                         total gain/loss
                       Format('=SUM(H3:H%d)',[CurRow-1]));
      SetCellText(8,CurRow,                                //                         and overall percentage
                  Format('=H%d/E%d',[CurRow+1,CurRow+1]));
      First;                                               // back to the first record
      cxSpreadBook.ActivePage := 1;                        // and move to the second page
      // and repeat the process to setup the data
      CurRow := 3;
      While NOT EOF do
      begin
        SetCellText(0,CurRow,                              // company name
                         FieldByName('CO_NAME').AsString);
        SetCellText(1,CurRow,                              // current price
                       FieldByName('CUR_PRICE').AsString);
        SetCellText(2,CurRow,                              // year high
                        FieldByName('YRL_HIGH').AsString);
        SetCellText(3,CurRow,                              // year low
                         FieldByName('YRL_LOW').AsString);
        SetCellText(4,CurRow,                              // average of Hi/Lo prices
              Format('=(C%d+D%d)/2',[CurRow+1,CurRow+1]));
        Next;
        Inc(CurRow);
      end;
      Inc(CurRow);
      Close;
      FIsApplyFormatting := True;
    end;
  Finally
    cxSpreadBook.EndUpdate;
    cxSpreadBook.Recalc;
    cxSpreadBook.ActivePage := 0;                          // back to first page
    Screen.Cursor := CurCursor;                            // restore original cursor
  end;
end;

function TStocksMainForm.GetCellText(SelectionRect: TRect; R1C1: Boolean): String;
begin
  with TcxSSUtils do
  begin
    Result := ColumnNameByIndex(SelectionRect.Left, R1C1) +
      RowNameByIndex(SelectionRect.Top, R1C1);
    if (SelectionRect.Left <> SelectionRect.Right) or (SelectionRect.Top <> SelectionRect.Bottom) then
      Result := Result + ' x ' + ColumnNameByIndex(SelectionRect.Right, R1C1) +
        RowNameByIndex(SelectionRect.Bottom, R1C1);
  end;
end;


procedure TStocksMainForm.AlwaysEnabled(Sender: TObject);
begin
  TCustomAction(Sender).Enabled := True;
end;

procedure TStocksMainForm.edtCellEditChange(Sender: TObject);
begin
  if FIsUpdate then Exit;
  with cxSpreadBook do
  begin
    with ActiveSheet.GetCellObject(ActiveSheet.SelectionRect.Left, ActiveSheet.SelectionRect.Top) do
      SetCellText((Sender as TEdit).Text);
    UpdateControl;
  end;
end;

procedure TStocksMainForm.edtCellEditExit(Sender: TObject);
begin
  with cxSpreadBook do
  begin
    with ActiveSheet.GetCellObject(ActiveSheet.SelectionRect.Left, ActiveSheet.SelectionRect.Top) do
    begin
      Text := Text;
      Free;
    end;
    UpdateControl;
    SetFocus;
  end;
  cxSpreadBookSetSelection(Self, cxSpreadBook.ActiveSheet);
end;

procedure TStocksMainForm.actApplyFormattingExecute(Sender: TObject);
var
  CHeader, RHeader : TcxSSHeader;
  I : Integer;
  CurCursor : TCursor;
begin
  CurCursor := Screen.Cursor;                              // preserve the current cursor
  Screen.Cursor := crHourGlass;
  FSaveSpreadSheet := False;
  cxSpreadBook.BeginUpdate;
  try
    cxSpreadBook.ActivePage := 0;                          // ensure we are looking at the first page
    // First set the column widths
    CHeader := cxSpreadBook.ActiveSheet.Cols;
    CHeader.Size[0] := 140;
    for I := 1 to 8 do CHeader.Size[I] :=  80;
    // and then the Row heights for the title and column descriptors
    RHeader := cxSpreadBook.ActiveSheet.Rows;
    RHeader.Size[0] :=  30;
    RHeader.Size[2] :=  30;
    // and do some cell formatting
    SetCellFont(0,0,0,0,[fsBold, fsUnderline],12);         // set the title and column header fonts
    SetCellPattern(0,0,8,1,16,1,fsSolid);                  // and add some cell shading for the sheet title
    SetCellPattern(0,2,8,2,23,1,fsSolid);                  // and for the column headers
    SetCellPattern(0,2,0,CurRow-2,23,1,fsSolid);           // and the company names
    // and now some number formatting
    SetCellFormat(1,3,1,CurRow-1, 3);                      // Holding Column #,##0
    SetCellFormat(2,3,2,CurRow-1,15);                      // Date Purchased d-mmm-yy
    SetCellFormat(3,3,6,CurRow-1, 4);                      // Price/Cost/Value & Worth Column #,##0.00
    SetCellFormat(7,3,7,CurRow-1, 8);                      // Gain/(Loss) value (#,##0.00_);[Red](#,##0.00)
    SetCellFormat(8,3,8,CurRow-1,10);                      // Gain/(Loss) percentage 0.00%
    // and now for the totals
    SetCellFormat(4,CurRow,4,CurRow, 8);                   // Total Purchase Cost ($#,##0.00_);[Red]($#,##0.00)
    SetCellFormat(6,CurRow,7,CurRow, 8);                   // Total Current Valuation ($#,##0.00_);[Red]($#,##0.00)
    SetCellFormat(8,CurRow,8,CurRow,10);                   // Total Gain/(Loss) percentage 0.00%
    // now align all the data
    SetCellAlignment(1,3,8,CurRow,haRight,vaCenter);       // Right Align all the numeric fields
    // set borders for the totals
    SetCellBorders(4,CurRow,4,CurRow, 1, lsThin);          // thin single line at the top of the cell
    SetCellBorders(6,CurRow,6,CurRow, 1, lsThin);
    SetCellBorders(7,CurRow,7,CurRow, 1, lsThin);
    SetCellBorders(4,CurRow,4,CurRow, 3, lsDouble);        // double line at the bottom of the cell
    SetCellBorders(6,CurRow,6,CurRow, 3, lsDouble);        // ditto
    SetCellBorders(7,CurRow,7,CurRow, 3, lsDouble);        // ditto

    // and now a similar process for the Hi/Lo valuations page
    cxSpreadBook.ActivePage := 1;                          // ensure we are looking at the second page
    // First set the column widths
    CHeader := cxSpreadBook.ActiveSheet.Cols;
    CHeader.Size[0] := 140;
    for I := 1 to 4 do CHeader.Size[I] :=  80;
    // and then the Row heights for the title and column descriptors
    RHeader := cxSpreadBook.ActiveSheet.Rows;
    RHeader.Size[0] :=  30;
    RHeader.Size[2] :=  30;
    SetCellFont(0,0,0,0,[fsBold, fsUnderline],12);
    // and now adding some cell shading
    SetCellPattern(0,0,4,1,16,1,fsSolid);                  // for the sheet title
    SetCellPattern(0,2,4,2,23,1,fsSolid);                  // for the column headers
    SetCellPattern(0,2,0,CurRow-2,23,1,fsSolid);           // and the company names
    SetCellFormat(1,3,4,CurRow-1, 4);                      //  Current, Hi, Lo and Average #,##0.00
    SetCellAlignment(1,3,4,CurRow,haRight,vaCenter);       // Right Align all the numeric fields

  finally
    FSaveSpreadSheet := True;                              // enable the save spreadsheet button
    cxSpreadBook.ActivePage := 0;                          // return to the first page
    cxSpreadBook.EndUpdate;
    Screen.Cursor := CurCursor;
  end;
end;

procedure TStocksMainForm.FormCreate(Sender: TObject);
begin
  FSaveSpreadSheet := False;
  FIsApplyFormatting := False;
end;

procedure TStocksMainForm.actMergeCellsExecute(Sender: TObject);
begin
  with cxSpreadBook.ActiveSheet do
    SetMergedState(SelectionRect, True);
end;

procedure TStocksMainForm.actSplitCellsExecute(Sender: TObject);
begin
  with cxSpreadBook.ActiveSheet do
    SetMergedState(SelectionRect, False);
end;

end.

