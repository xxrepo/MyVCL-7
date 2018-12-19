unit WebChartHome;

interface

uses SysUtils, Classes, HTTPApp, cxWebModule, cxWebAppSrv, cxWebClasses,
  cxWebControls, cxWebStdCtrls, cxWebteeChart, cxWebDataCtrls;


type
  TWebChartHomePage = class(TcxWebPageModule)
    WebChart: TcxWebChart;
    wcbChartType: TcxWebComboBox;
    wchShowLegend: TcxWebCheckBox;
    wedTitle: TcxWebEdit;
    wbtnApply: TcxWebButton;
    wcbShowAxis: TcxWebCheckBox;
    wcb3D: TcxWebCheckBox;
    cbShowMarks: TcxWebCheckBox;
    WebStyleController: TcxWebStyleController;
    WebStyleControllerItem1: TcxWebStyleItem;
    procedure cxWebPageModuleActivate(Sender: TObject);
    procedure wbtnApplyClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function WebChartHomePage: TWebChartHomePage;

implementation

{$R *.DFM} {*.html}

uses
  WebReq, WebCntxt, cxWebModFact, Variants, Chart, TeEngine, Series;

function WebChartHomePage: TWebChartHomePage;
begin
  Result := TWebChartHomePage(WebContext.FindModuleClass(TWebChartHomePage));
end;

procedure TWebChartHomePage.cxWebPageModuleActivate(Sender: TObject);
var
  I: Integer;
  AItem: TcxWebListItem;
begin
  if IsFirstRequest then
  begin
    for I := 0 to TeeSeriesTypes.Count - 1 do
      if (TeeSeriesTypes[I].SeriesClass <> nil) and
        (TeeSeriesTypes[I].SeriesClass <> THorizBarSeries) then
      begin
        AItem := wcbChartType.Items.Add;
        AItem.Text := TeeSeriesTypes[I].Description;
        AItem.Value := IntToStr(I);
        if (WebChart.SeriesList.Count > 0) and
          (WebChart.SeriesList[0].ClassType = TClass(TeeSeriesTypes[I].SeriesClass)) then
          wcbChartType.ItemIndex := wcbChartType.Items.Count - 1;
      end;
  end;
end;

procedure TWebChartHomePage.wbtnApplyClick(Sender: TObject);
var
  ASeries: TChartSeries;
begin
  while (WebChart.SeriesList.Count > 0) do
    WebChart.SeriesList[0].Free;
  ASeries := TeeSeriesTypes[StrToInt(wcbChartType.Items[wcbChartType.ItemIndex].Value)].SeriesClass.Create(nil);
  ASeries.FillSampleValues(ASeries.NumSampleValues);
  WebChart.Chart.AddSeries(ASeries);
  WebChart.Legend.Visible := wchShowLegend.Checked;
  WebChart.Title.Text.Clear;
  WebChart.Title.Text.Append(wedTitle.Text);
  WebChart.AxisVisible := wcbShowAxis.Checked;
  WebChart.View3D := wcb3D.Checked;
  ASeries.Marks.Visible := cbShowMarks.Checked;
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebPageModuleFactory.Create(TWebChartHomePage, TcxWebPageInfo.Create('*.html'),  caDestroy));

end.
