unit OrgChartRLMain;

{$I ..\cxVer.inc}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, checklst, StdCtrls, Grids, ComCtrls, ShellAPI, ToolWin, Db, DBTables, Buttons,
  dxPSdxDBOCLnk, dxPSCore, dxPSdxOCLnk, dxdborgc, dxorgchr, dxPSGlbl,
  dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, ImgList,
  dxPSGraphicLnk, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  DemoBasicMain, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils,
  dxPSPrVwStd, dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxPScxPageControlProducer, cxGraphics, ActnList, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters;

type
  TOrgChartRLMainForm = class(TDemoBasicMainForm)
    PageControl1: TPageControl;
    tsOrgChart: TTabSheet;
    tsDBOrgChart: TTabSheet;
    dxOrgChart: TdxOrgChart;
    dxDBOrgChart: TdxDbOrgChart;
    OCTable: TTable;
    dsOCTable: TDataSource;
    dxComponentPrinterLink1: TdxOrgChartReportLink;
    dxComponentPrinterLink2: TdxDBOrgChartReportLink;
    ImageList1: TImageList;
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

procedure TOrgChartRLMainForm.PageControl1Change(Sender: TObject);
begin
  dxComponentPrinter.CurrentLink := dxComponentPrinter.ReportLink[TPageControl(Sender).ActivePage.PageIndex];
end;

procedure TOrgChartRLMainForm.FormCreate(Sender: TObject);
begin
  inherited;
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
