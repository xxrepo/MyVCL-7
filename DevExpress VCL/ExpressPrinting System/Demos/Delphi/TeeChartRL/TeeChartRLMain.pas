unit TeeChartRLMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, checklst, StdCtrls, Grids, ComCtrls, ShellAPI,
   ToolWin, Db, DBTables, Buttons,
  Series, DBChart, TeEngine, ExtCtrls, TeeProcs, Chart, dxPSDBTCLnk,
  dxPSCore, dxPSTCLnk, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd,
  {dxPSPrVwAdv,} // enable for use of ExpressBars in PrintPreview
  dxWrap, dxPrnDev, ImgList, dxPSGraphicLnk, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns;

type
  TTeeChartRLMainForm = class(TForm)
    MainMenu: TMainMenu;
    miFile: TMenuItem;
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
    tbDX: TToolButton;
    tbExit: TToolButton;
    ilButtons: TImageList;
    PageControl1: TPageControl;
    tsTeeChart: TTabSheet;
    tsDBTeeChart: TTabSheet;
    TeeChart: TChart;
    Series5: TBarSeries;
    Series7: TBarSeries;
    Series6: TBarSeries;
    DBChart: TDBChart;
    PieSeries1: TPieSeries;
    TeeChartTable: TTable;
    TeeChartTableNAME: TStringField;
    TeeChartTableSIZE: TSmallintField;
    TeeChartTableWEIGHT: TSmallintField;
    DataSource1: TDataSource;
    dxComponentPrinter1Link1: TdxTeeChartReportLink;
    dxComponentPrinter1Link2: TdxDBTeeChartReportLink;
    procedure miDXClick(Sender: TObject);
    procedure miPageSetupClick(Sender: TObject);
    procedure miPrintPreviewClick(Sender: TObject);
    procedure miPrintClick(Sender: TObject);
    procedure miExitClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
  public
    { Public declarations }
  end;

var
  TeeChartRLMainForm: TTeeChartRLMainForm;

implementation

{$R *.DFM}

procedure TTeeChartRLMainForm.miDXClick(Sender: TObject);
begin
  ShellExecute(Handle, PChar('OPEN'), PChar('http://www.devexpress.com'), Nil, Nil, SW_SHOWMAXIMIZED);
end;

procedure TTeeChartRLMainForm.miPageSetupClick(Sender: TObject);
begin
  dxComponentPrinter1.PageSetup(nil);
end;

procedure TTeeChartRLMainForm.miPrintPreviewClick(Sender: TObject);
begin
  dxComponentPrinter1.Preview(True,nil);
end;

procedure TTeeChartRLMainForm.miPrintClick(Sender: TObject);
begin
  dxComponentPrinter1.Print(True,nil,nil);
end;

procedure TTeeChartRLMainForm.miExitClick(Sender: TObject);
begin
  Close;
end;

procedure TTeeChartRLMainForm.PageControl1Change(Sender: TObject);
var
  t: Integer;
begin
  dxComponentPrinter1.CurrentLink := dxComponentPrinter1.ReportLink[TPageControl(Sender).ActivePage.PageIndex];
  with TeeChart do
  begin
    AnimatedZoom:=True;
    AnimatedZoomSteps:=4;
    for t:=0 to SeriesCount-1 do
    with Series[t] do
         FillSampleValues(NumSampleValues);
    UndoZoom;
  end;

end;

procedure TTeeChartRLMainForm.FormCreate(Sender: TObject);
begin
  if not TeeChartTable.Active then TeeChartTable.Open;
  PageControl1Change(PageControl1);
end;

end.
