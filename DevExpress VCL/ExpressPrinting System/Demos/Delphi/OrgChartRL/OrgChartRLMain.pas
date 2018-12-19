unit OrgChartRLMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, checklst, StdCtrls, Grids, ComCtrls, ShellAPI, ToolWin, Db, DBTables, Buttons,
  dxPSdxDBOCLnk, dxPSCore, dxPSdxOCLnk, dxdborgc, dxorgchr, dxPSGlbl,
  dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, ImgList,
  {dxPSPrVwAdv,} // enable for use of ExpressBars in PrintPreview
  dxPSGraphicLnk, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns;

type
  TOrgChartRLMainForm = class(TForm)
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
    PageControl1: TPageControl;
    tsOrgChart: TTabSheet;
    tsDBOrgChart: TTabSheet;
    dxOrgChart: TdxOrgChart;
    dxComponentPrinter1Link1: TdxOrgChartReportLink;
    dxDBOrgChart: TdxDbOrgChart;
    ImageList1: TImageList;
    OCTable: TTable;
    dsOCTable: TDataSource;
    dxComponentPrinter1Link2: TdxDBOrgChartReportLink;
    ImageList2: TImageList;
    procedure miDXClick(Sender: TObject);
    procedure miPageSetupClick(Sender: TObject);
    procedure miPrintPreviewClick(Sender: TObject);
    procedure miPrintClick(Sender: TObject);
    procedure miDesignerClick(Sender: TObject);
    procedure miExitClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dxDBOrgChartCreateNode(Sender: TObject; Node: TdxOcNode);
  private
    function GetShape(ShapeName : String) : TdxOcShape;
  public
    { Public declarations }
  end;

var
  OrgChartRLMainForm: TOrgChartRLMainForm;

implementation

{$R *.DFM}

procedure TOrgChartRLMainForm.miDXClick(Sender: TObject);
begin
  ShellExecute(Handle, PChar('OPEN'), PChar('http://www.devexpress.com'), Nil, Nil, SW_SHOWMAXIMIZED);
end;

procedure TOrgChartRLMainForm.miPageSetupClick(Sender: TObject);
begin
  dxComponentPrinter1.PageSetup(nil);
end;

procedure TOrgChartRLMainForm.miPrintPreviewClick(Sender: TObject);
begin
  dxComponentPrinter1.Preview(True,nil);
end;

procedure TOrgChartRLMainForm.miPrintClick(Sender: TObject);
begin
  dxComponentPrinter1.Print(True,nil,nil);
end;

procedure TOrgChartRLMainForm.miDesignerClick(Sender: TObject);
begin
  dxComponentPrinter1.DesignReport(nil);
end;

procedure TOrgChartRLMainForm.miExitClick(Sender: TObject);
begin
  Close;
end;

procedure TOrgChartRLMainForm.PageControl1Change(Sender: TObject);
begin
  dxComponentPrinter1.CurrentLink := dxComponentPrinter1.ReportLink[TPageControl(Sender).ActivePage.PageIndex];
end;

procedure TOrgChartRLMainForm.FormCreate(Sender: TObject);
begin
  OCTable.DataBaseName := ExtractFilePath(Application.ExeName);
  if not OCTable.Active then OCTable.Open;

  dxOrgChart.FullExpand;
  dxDBOrgChart.FullExpand;
  PageControl1Change(PageControl1);
end;

procedure TOrgChartRLMainForm.dxDBOrgChartCreateNode(Sender: TObject;
  Node: TdxOcNode);
begin
  with Node, OCTable do
  begin
    if FindField('width').AsInteger > 50 then
      Width := FindField('width').AsInteger;
    if FindField('height').AsInteger > 50 then
      Height := FindField('height').AsInteger;
    Shape := GetShape(FindField('type').AsString);
    Color := FindField('color').AsInteger;
  end;
end;

function TOrgChartRLMainForm.GetShape(ShapeName : String) : TdxOcShape;
const ShapeArray: array[0..3] of string = ('Rectange', 'Round Rect', 'Ellipse', 'Diamond');
var i : integer;
begin
  Result := TdxOcShape(0);
  for i := 0 to 3 do
    if AnsiUpperCase(ShapeArray[i]) = AnsiUpperCase(ShapeName) then  begin
      Result := TdxOcShape(i);
      break;
    end;
end;


end.
