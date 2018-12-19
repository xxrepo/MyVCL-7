unit EQGridRLMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, checklst, StdCtrls, Grids, ComCtrls, ShellAPI, ToolWin, Db, DBTables,
  dxPSCore, dxPSdxTLLnk, dxPSdxDBCtrlLnk, dxPSdxDBGrLnk, dxDBTLCl,
  dxGrClms, dxTL, dxDBCtrl, dxDBGrid, dxCntner, dxPSGlbl, dxPSUtl,
  {dxPSPrVwAdv,} // enable for use of ExpressBars in PrintPreview
  dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, ImgList, dxExEdtr,
  dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns;

type
  TEQGridRLMainForm = class(TForm)
    MainMenu: TMainMenu;
    miFile: TMenuItem;
    miDesigner: TMenuItem;
    miHelp: TMenuItem;
    miPageSetup: TMenuItem;
    miPrintPreview: TMenuItem;
    miPrint: TMenuItem;
    N1: TMenuItem;
    miExit: TMenuItem;
    miDX: TMenuItem;
    dxComponentPrinter1: TdxComponentPrinter;
    ToolBar1: TToolBar;
    tbSetup: TToolButton;
    tbPreview: TToolButton;
    tbPrint: TToolButton;
    tbDevider: TToolButton;
    tbDesigner: TToolButton;
    tbDX: TToolButton;
    tbSeparator: TToolButton;
    tbExit: TToolButton;
    ilButtons: TImageList;
    dxComponentPrinter1Link3: TdxDBGridReportLink;
    ilTLItems: TImageList;
    tBiolife: TTable;
    dsBiolife: TDataSource;
    ilDBTreelist: TImageList;
    dxGrid: TdxDBGrid;
    dxDBGridColumn13: TdxDBGridColumn;
    dxDBGridMemoColumn1: TdxDBGridMemoColumn;
    dxDBGridColumn14: TdxDBGridColumn;
    dxDBGridGraphicColumn1: TdxDBGridGraphicColumn;
    dxDBGridColumn15: TdxDBGridColumn;
    dxDBGridColumn16: TdxDBGridColumn;
    dxDBGridColumn18: TdxDBGridColumn;
    dxDBGridColumn17: TdxDBGridColumn;
    tbSelected: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure miDXClick(Sender: TObject);
    procedure miPageSetupClick(Sender: TObject);
    procedure miPrintPreviewClick(Sender: TObject);
    procedure miPrintClick(Sender: TObject);
    procedure miDesignerClick(Sender: TObject);
    procedure miExitClick(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure dxGridColumnSorting(Sender: TObject;
      Column: TdxDBTreeListColumn; var Allow: Boolean);
    procedure dxGridDragEndHeader(Sender: TObject;
      AColumn: TdxTreeListColumn; P: TPoint;
      var NewPosInfo: TdxHeaderPosInfo; var Accept: Boolean);
    procedure dxGridDragOverHeader(Sender: TObject;
      AColumn: TdxTreeListColumn; P: TPoint; var Accept: Boolean);
    procedure dxDBGridGraphicColumn1CustomClick(Sender: TObject);
    procedure tbSelectedClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EQGridRLMainForm: TEQGridRLMainForm;

implementation

uses EQGridRLPreview;

{$R *.DFM}

procedure TEQGridRLMainForm.FormCreate(Sender: TObject);
begin
  tBiolife.Open;
  dxGrid.FullExpand;
end;

procedure TEQGridRLMainForm.miDXClick(Sender: TObject);
begin
  ShellExecute(Handle, PChar('OPEN'), PChar('http://www.devexpress.com'), Nil, Nil, SW_SHOWMAXIMIZED);
end;

procedure TEQGridRLMainForm.miPageSetupClick(Sender: TObject);
begin
  dxComponentPrinter1.PageSetup(nil);
end;

procedure TEQGridRLMainForm.miPrintPreviewClick(Sender: TObject);
begin
  dxComponentPrinter1.Preview(True,nil);
end;

procedure TEQGridRLMainForm.miPrintClick(Sender: TObject);
begin
  dxComponentPrinter1.Print(True,nil,nil);
end;

procedure TEQGridRLMainForm.miDesignerClick(Sender: TObject);
begin
  dxComponentPrinter1.DesignReport(nil);
end;

procedure TEQGridRLMainForm.miExitClick(Sender: TObject);
begin
  Close;
end;

procedure TEQGridRLMainForm.PageControlChange(Sender: TObject);
begin
  dxComponentPrinter1.CurrentLink := dxComponentPrinter1.ReportLink[TPageControl(Sender).ActivePage.PageIndex];
end;

procedure TEQGridRLMainForm.dxGridColumnSorting(Sender: TObject;
  Column: TdxDBTreeListColumn; var Allow: Boolean);
begin
  if Column = dxDBGridGraphicColumn1 then Allow := False;
end;

procedure TEQGridRLMainForm.dxGridDragEndHeader(Sender: TObject;
  AColumn: TdxTreeListColumn; P: TPoint; var NewPosInfo: TdxHeaderPosInfo;
  var Accept: Boolean);
begin
  if NewPosInfo.BandIndex <> -1 then
    Accept := AColumn.BandIndex = TdxDBGrid(Sender).Bands.GetAbsoluteIndex(NewPosInfo.BandIndex)
  else Accept := False;
end;

procedure TEQGridRLMainForm.dxGridDragOverHeader(Sender: TObject;
  AColumn: TdxTreeListColumn; P: TPoint; var Accept: Boolean);
var
  C: TdxTreeListColumn;
begin
  C := TdxDBGrid(Sender).GetColumnAt(P.X, P.Y);
  if C <> nil then
    Accept := C.BandIndex = AColumn.BandIndex;
end;

procedure TEQGridRLMainForm.dxDBGridGraphicColumn1CustomClick(Sender: TObject);
begin
   if EQGridRLPreviewForm = nil then
     EQGridRLPreviewForm := TEQGridRLPreviewForm.Create(Self);
   EQGridRLPreviewForm.DBImage.DataField := '';
   EQGridRLPreviewForm.DBImage.DataSource := dsBiolife;
   EQGridRLPreviewForm.DBImage.DataField := 'Graphic';
   EQGridRLPreviewForm.Show;
end;

procedure TEQGridRLMainForm.tbSelectedClick(Sender: TObject);
begin
  dxComponentPrinter1Link3.OnlySelected := tbSelected.Down;
end;

end.
