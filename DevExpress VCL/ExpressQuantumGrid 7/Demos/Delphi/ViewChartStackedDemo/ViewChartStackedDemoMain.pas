unit ViewChartStackedDemoMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridChartView, cxGridDBChartView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, DBTables,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid, cxTimeEdit,
  cxImageComboBox, ImgList, cxLookAndFeels, Menus, StdCtrls,
  cxLookAndFeelPainters, dxmdaset, dxOffice11, cxGeometry, ComCtrls,
  dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter;

type
  TfrmMain = class(TForm)
    PaymentTypeImages: TImageList;
    LookAndFeelController: TcxLookAndFeelController;
    mmMain: TMainMenu;
    miFile: TMenuItem;
    miExit: TMenuItem;
    miAbout: TMenuItem;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    miView: TMenuItem;
    miTitlePosition: TMenuItem;
    miLegendPosition: TMenuItem;
    miLegendBorder: TMenuItem;
    miValueCaptionPosition: TMenuItem;
    miCategoryAxis: TMenuItem;
    miCategoryAxisVisible: TMenuItem;
    miCategoryAxisTickMarkLabels: TMenuItem;
    miCategoryAxisTickMarkKind: TMenuItem;
    miCategoryAxisGridLines: TMenuItem;
    miTitlePositionDefault: TMenuItem;
    miTitlePositionNone: TMenuItem;
    miTitlePositionLeft: TMenuItem;
    miTitlePositionTop: TMenuItem;
    miTitlePositionRight: TMenuItem;
    miTitlePositionBottom: TMenuItem;
    miLegendPositionDefault: TMenuItem;
    miLegendPositionNone: TMenuItem;
    miLegendPositionLeft: TMenuItem;
    miLegendPositionTop: TMenuItem;
    miLegendPositionRight: TMenuItem;
    miLegendPositionBottom: TMenuItem;
    miValueCaptionPositionNone: TMenuItem;
    miValueCaptionPositionInsideBase: TMenuItem;
    miValueCaptionPositionCenter: TMenuItem;
    miValueCaptionPositionInsideEnd: TMenuItem;
    miValueCaptionPositionOutsideEnd: TMenuItem;
    miCategoryAxisTickMarkKindNone: TMenuItem;
    miCategoryAxisTickMarkKindCross: TMenuItem;
    miCategoryAxisTickMarkKindInside: TMenuItem;
    miCategoryAxisTickMarkKindOutside: TMenuItem;
    miValueAxis: TMenuItem;
    miValueAxisTickMarkLabels: TMenuItem;
    miValueAxisTickMarkKind: TMenuItem;
    miValueAxisTickMarkKindOutside: TMenuItem;
    miValueAxisTickMarkKindInside: TMenuItem;
    miValueAxisTickMarkKindCross: TMenuItem;
    miValueAxisTickMarkKindNone: TMenuItem;
    miValueAxisGridLines: TMenuItem;
    miValueAxisVisible: TMenuItem;
    miCategoryAxisCategoriesInReverseOrder: TMenuItem;
    miCategoryAxisValueAxisAtMaxCategory: TMenuItem;
    miCategoryAxisValueAxisBetweenCategories: TMenuItem;
    N3: TMenuItem;
    Label1: TLabel;
    miDiagram: TMenuItem;
    N2: TMenuItem;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    miToolBox: TMenuItem;
    N4: TMenuItem;
    miToolBoxPosition: TMenuItem;
    miToolBoxPositionTop: TMenuItem;
    miToolBoxPositionBottom: TMenuItem;
    cxStyle7: TcxStyle;
    grMain: TcxGrid;
    gvBarsChartView: TcxGridDBChartView;
    cxGridDBChartSeries1: TcxGridDBChartSeries;
    cxGridDBChartSeries2: TcxGridDBChartSeries;
    cxGridDBChartSeries3: TcxGridDBChartSeries;
    cxGridDBChartSeries4: TcxGridDBChartSeries;
    cxGridDBChartSeries5: TcxGridDBChartSeries;
    cxGridDBChartSeries6: TcxGridDBChartSeries;
    glBarsChart: TcxGridLevel;
    dsSales: TDataSource;
    dxMemData1: TdxMemData;
    dxMemData1Country: TStringField;
    dxMemData1Male14: TFloatField;
    dxMemData1Male64: TFloatField;
    dxMemData1Male65: TFloatField;
    dxMemData1Female14: TFloatField;
    dxMemData1Female64: TFloatField;
    dxMemData1Female65: TFloatField;
    glBarsTable: TcxGridLevel;
    gvBarsTableView: TcxGridDBTableView;
    gvBarsTableViewRecId: TcxGridDBColumn;
    gvBarsTableViewCountry: TcxGridDBColumn;
    gvBarsTableViewMale14: TcxGridDBColumn;
    gvBarsTableViewMale64: TcxGridDBColumn;
    gvBarsTableViewMale65: TcxGridDBColumn;
    gvBarsTableViewFemale14: TcxGridDBColumn;
    gvBarsTableViewFemale64: TcxGridDBColumn;
    gvBarsTableViewFemale65: TcxGridDBColumn;
    N1: TMenuItem;
    miStackedStyle: TMenuItem;
    Normal1: TMenuItem;
    SideBySide1: TMenuItem;
    N100Percent1: TMenuItem;
    N100PercentSideBySide1: TMenuItem;
    N5: TMenuItem;
    dxMemData2: TdxMemData;
    dxMemData2Politics: TIntegerField;
    dxMemData2Category: TDateTimeField;
    dxMemData2Entertainment: TIntegerField;
    dxMemData2Travel: TIntegerField;
    glAreaChart: TcxGridLevel;
    glAreaTable: TcxGridLevel;
    gvAreaChartView: TcxGridDBChartView;
    DataSource1: TDataSource;
    gvAreaChartViewSeries1: TcxGridDBChartSeries;
    gvAreaChartViewSeries2: TcxGridDBChartSeries;
    gvAreaChartViewSeries3: TcxGridDBChartSeries;
    gvAreaTableView: TcxGridDBTableView;
    gvAreaTableViewRecId: TcxGridDBColumn;
    gvAreaTableViewCategory: TcxGridDBColumn;
    gvAreaTableViewPolitics: TcxGridDBColumn;
    gvAreaTableViewEntertainment: TcxGridDBColumn;
    gvAreaTableViewTravel: TcxGridDBColumn;
    miEmptyPointsMode: TMenuItem;
    miepdmZero: TMenuItem;
    miepdmGap: TMenuItem;
    N6: TMenuItem;
    miTransparency: TMenuItem;
    mi0: TMenuItem;
    mi255: TMenuItem;
    mi45: TMenuItem;
    mi90: TMenuItem;
    mi135: TMenuItem;
    mi180: TMenuItem;
    mi225: TMenuItem;
    miAreaStackedStyle: TMenuItem;
    N100Percent2: TMenuItem;
    Default1: TMenuItem;
    miLineDiagramValueCaptionPosition: TMenuItem;
    mildvcpBelow: TMenuItem;
    mildvcpRight: TMenuItem;
    mildvcpAbove: TMenuItem;
    mildvcpLeft: TMenuItem;
    mildvcpNone: TMenuItem;
    mildvcpAboveRight: TMenuItem;
    mildvcpBelowRight: TMenuItem;
    mildvcpAboveLeft: TMenuItem;
    mildvcpBelowLeft: TMenuItem;
    N7: TMenuItem;
    mildvcpCenter: TMenuItem;
    procedure miExitClick(Sender: TObject);
    procedure miAboutClick(Sender: TObject);
    procedure grMainActiveTabChanged(Sender: TcxCustomGrid;
      ALevel: TcxGridLevel);
    procedure miTitlePositionItemClick(Sender: TObject);
    procedure miLegendPositionItemClick(Sender: TObject);
    procedure miLegendBorderClick(Sender: TObject);
    procedure miAxisVisibleClick(Sender: TObject);
    procedure miAxisGridLinesClick(Sender: TObject);
    procedure miAxisTickMarkKindItemClick(Sender: TObject);
    procedure miAxisTickMarkLabelsClick(Sender: TObject);
    procedure miCategoryAxisCategoriesInReverseOrderClick(Sender: TObject);
    procedure miCategoryAxisValueAxisAtMaxCategoryClick(Sender: TObject);
    procedure miCategoryAxisValueAxisBetweenCategoriesClick(
      Sender: TObject);
    procedure miLineDiagramClick(Sender: TObject);
    procedure miPieDiagramClick(Sender: TObject);
    procedure miToolBoxClick(Sender: TObject);
    procedure miToolBoxPositionClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure gvChartViewDiagramStackedBarCustomDrawValue(
      Sender: TcxGridChartDiagram; ACanvas: TcxCanvas;
      AViewInfo: TcxGridChartDiagramValueViewInfo; var ADone: Boolean);
    procedure StackedStyleClick(Sender: TObject);
    procedure miValueCaptionPositionItemClick(Sender: TObject);
    procedure gvChartViewActiveDiagramChanged(Sender: TcxGridChartView;
      ADiagram: TcxGridChartDiagram);
    procedure miEmptyPointsDisplayModeClick(Sender: TObject);
    procedure miTransparencyClick(Sender: TObject);
    procedure StackedAreaStyleClick(Sender: TObject);
    procedure miLineDiagramValueCaptionPositionItemClick(Sender: TObject);
  private
    function GetActiveChart: TcxGridChartView;
    function GetActiveHistogram: TcxGridChartHistogram;
  protected
    procedure UpdateControls;
    procedure SetCheckedSubItem(AParent: TMenuItem; ACheckedTag: Integer);
  public
    function GetActiveAxis(AMenuItem: TObject): TcxGridChartHistogramAxis;

    property ActiveChart: TcxGridChartView read GetActiveChart;
    property ActiveHistogram: TcxGridChartHistogram read GetActiveHistogram;
  end;

var
  frmMain: TfrmMain;

implementation

uses
  cxGridCommon, AboutDemoForm;

{$R *.dfm}

function TfrmMain.GetActiveChart: TcxGridChartView;
begin
  if grMain.ActiveView is TcxGridChartView then
    Result := TcxGridChartView(grMain.ActiveView)
  else
    Result := nil;
end;

function TfrmMain.GetActiveHistogram: TcxGridChartHistogram;
begin
  if (ActiveChart <> nil) and (ActiveChart.ActiveDiagram is TcxGridChartHistogram) then
    Result := TcxGridChartHistogram(ActiveChart.ActiveDiagram)
  else
    Result := nil;
end;

procedure TfrmMain.UpdateControls;
var
  AChart: TcxGridChartView;
const
  Description: array[TcxGridChartStackedDiagramStyle] of string =
   ('Stacked %s Diagram', 'Full Stacked %s Diagram', 'Side-By-Side Stacked %s Diagram', 'Side-By-Side Full Stacked %s Diagram');
  Orientation: array[Boolean] of string = ('Bars', 'Columns');
begin
  if gvBarsChartView.ActiveDiagram is TcxGridChartStackedColumnDiagram then 
    glBarsChart.Caption := 'Population - ' +
      Format(Description[TcxGridChartStackedColumnDiagram(gvBarsChartView.ActiveDiagram).StackedStyle],
      [Orientation[gvBarsChartView.ActiveDiagram is TcxGridChartStackedColumnDiagram]])
  else
    glBarsChart.Caption := 'Population - ' + gvBarsChartView.ActiveDiagram.DisplayText;
  glAreaChart.Caption := 'Website Popularity - ' + gvAreaChartView.ActiveDiagram.DisplayText;
  AChart := ActiveChart;
  miView.Enabled := AChart <> nil;
  miDiagram.Enabled := miView.Enabled;
  if AChart = nil then Exit;

  miStackedStyle.Visible := ActiveHistogram is TcxGridChartStackedColumnDiagram;
  if miStackedStyle.Visible then
    SetCheckedSubItem(miStackedStyle, Ord(TcxGridChartStackedColumnDiagram(ActiveHistogram).StackedStyle));

  miAreaStackedStyle.Visible := ActiveHistogram is TcxGridChartStackedAreaDiagram;
  if miAreaStackedStyle.Visible then
    SetCheckedSubItem(miAreaStackedStyle, Ord(TcxGridChartStackedAreaDiagram(ActiveHistogram).StackedStyle));

  miTransparency.Visible := ActiveHistogram is TcxGridChartAreaDiagram;
  if miTransparency.Visible then
    SetCheckedSubItem(miTransparency, TcxGridChartAreaDiagram(ActiveHistogram).Transparency);

  miEmptyPointsMode.Visible := ActiveHistogram is TcxGridChartLineDiagram;
  if miEmptyPointsMode.Visible then
    SetCheckedSubItem(miEmptyPointsMode, Ord(TcxGridChartLineDiagram(ActiveHistogram).EmptyPointsDisplayMode));

  miTitlePosition[Ord(AChart.Title.Position)].Checked := True;
  miLegendPosition[Ord(AChart.ActiveDiagram.Legend.Position)].Checked := True;
  miLegendBorder.Checked := AChart.ActiveDiagram.Legend.GetBorder = lbSingle;
  miToolBox.Checked := AChart.ToolBox.Visible <> tvNever;
  miToolBoxPosition[Ord(AChart.ToolBox.Position)].Checked := True;

  miLineDiagramValueCaptionPosition.Visible := ActiveHistogram is TcxGridChartLineDiagram;
  miValueCaptionPosition.Visible := not miLineDiagramValueCaptionPosition.Visible;
  if miValueCaptionPosition.Visible then
    miValueCaptionPosition[Ord(TcxGridChartStackedColumnDiagram(ActiveHistogram).Values.CaptionPosition)].Checked := True
  else
    miLineDiagramValueCaptionPosition[Ord(TcxGridChartLineDiagram(ActiveHistogram).Values.CaptionPosition)].Checked := True;
  // histogram
  miCategoryAxis.Visible := ActiveHistogram <> nil;
  miValueAxis.Visible := ActiveHistogram <> nil;
  if ActiveHistogram <> nil then
  begin
    // category axis
    miCategoryAxisVisible.Checked := ActiveHistogram.AxisCategory.Visible;
    miCategoryAxisGridLines.Checked := ActiveHistogram.AxisCategory.GridLines;
    miCategoryAxisTickMarkKind[Ord(ActiveHistogram.AxisCategory.TickMarkKind)].Checked := True;
    miCategoryAxisTickMarkLabels.Checked := ActiveHistogram.AxisCategory.TickMarkLabels;
    miCategoryAxisCategoriesInReverseOrder.Checked := ActiveHistogram.AxisCategory.CategoriesInReverseOrder;
    miCategoryAxisValueAxisAtMaxCategory.Checked := ActiveHistogram.AxisCategory.ValueAxisAtMaxCategory;
    miCategoryAxisValueAxisBetweenCategories.Checked := ActiveHistogram.AxisCategory.ValueAxisBetweenCategories;
    // value axis
    miValueAxisVisible.Checked := ActiveHistogram.AxisValue.Visible;
    miValueAxisGridLines.Checked := ActiveHistogram.AxisValue.GridLines;
    miValueAxisTickMarkKind[Ord(ActiveHistogram.AxisValue.TickMarkKind)].Checked := True;
    miValueAxisTickMarkLabels.Checked := ActiveHistogram.AxisValue.TickMarkLabels;
  end;
end;

procedure TfrmMain.SetCheckedSubItem(AParent: TMenuItem; ACheckedTag: Integer);
var
  I: Integer;
begin
  for I := 0 to AParent.Count - 1 do
    AParent.Items[I].Checked := AParent.Items[I].Tag = ACheckedTag
end; 

function TfrmMain.GetActiveAxis(AMenuItem: TObject): TcxGridChartHistogramAxis;
begin
  while (AMenuItem is TMenuItem) and
    (TMenuItem(AMenuItem).Tag = 0) do
    AMenuItem := TMenuItem(AMenuItem).Parent;
  case ((AMenuItem as TMenuItem).Tag) of
    1: Result := ActiveHistogram.AxisCategory;
    2: Result := ActiveHistogram.AxisValue;
  else
    Result := nil;
  end;
end;

procedure TfrmMain.FormActivate(Sender: TObject);
begin
  UpdateControls;  // to update menu after chart view was changed via Customization Form
end;

procedure TfrmMain.miExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.miAboutClick(Sender: TObject);
begin
  ShowAboutDemoForm;
end;

procedure TfrmMain.grMainActiveTabChanged(Sender: TcxCustomGrid;
  ALevel: TcxGridLevel);
begin
  UpdateControls;
end;

procedure TfrmMain.miLineDiagramClick(Sender: TObject);
begin
  ActiveChart.DiagramLine.Active := True;
end;

procedure TfrmMain.miTitlePositionItemClick(Sender: TObject);
begin
  ActiveChart.Title.Position := TcxGridChartPartPosition(TMenuItem(Sender).MenuIndex);
  UpdateControls;
end;

procedure TfrmMain.miToolBoxClick(Sender: TObject);
const
  AChangeVisible: array[TcxGridChartToolBoxVisible] of TcxGridChartToolBoxVisible =
    (tvAlways, tvNever, tvNever);
begin
  ActiveChart.ToolBox.Visible := AChangeVisible[ActiveChart.ToolBox.Visible];
  UpdateControls;
end;

procedure TfrmMain.miToolBoxPositionClick(Sender: TObject);
begin
  ActiveChart.ToolBox.Position := TcxGridChartToolBoxPosition(TMenuItem(Sender).MenuIndex);
  UpdateControls;
end;

procedure TfrmMain.miValueCaptionPositionItemClick(Sender: TObject);
begin
  if ActiveHistogram is TcxGridChartColumnDiagram then
    TcxGridChartColumnDiagram(ActiveHistogram).Values.CaptionPosition :=
      TcxGridChartColumnDiagramValueCaptionPosition(TMenuItem(Sender).MenuIndex);
  UpdateControls;
end;

procedure TfrmMain.miLineDiagramValueCaptionPositionItemClick(Sender: TObject);
begin
  if ActiveHistogram is TcxGridChartLineDiagram then
    TcxGridChartLineDiagram(ActiveHistogram).Values.CaptionPosition :=
      TcxGridChartLineDiagramValueCaptionPosition(TMenuItem(Sender).MenuIndex);
  UpdateControls;
end;

procedure TfrmMain.miLegendPositionItemClick(Sender: TObject);
begin
  ActiveChart.ActiveDiagram.Legend.Position := TcxGridChartPartPosition(TMenuItem(Sender).MenuIndex);
  UpdateControls;
end;

procedure TfrmMain.miLegendBorderClick(Sender: TObject);
begin
  if not TMenuItem(Sender).Checked then
    ActiveChart.ActiveDiagram.Legend.Border := lbSingle
  else
    ActiveChart.ActiveDiagram.Legend.Border := lbNone;
  UpdateControls;
end;

procedure TfrmMain.miPieDiagramClick(Sender: TObject);
begin
  ActiveChart.DiagramPie.Active := True;
end;

procedure TfrmMain.miAxisVisibleClick(Sender: TObject);
begin
  with GetActiveAxis(Sender) do
    Visible := not Visible;
  UpdateControls;
end;

procedure TfrmMain.miAxisGridLinesClick(Sender: TObject);
begin
  with GetActiveAxis(Sender) do
    GridLines := not GridLines;
  UpdateControls;
end;

procedure TfrmMain.miAxisTickMarkKindItemClick(Sender: TObject);
begin
  GetActiveAxis(Sender).TickMarkKind := TcxGridChartHistogramTickMarkKind(TMenuItem(Sender).MenuIndex);
  UpdateControls;
end;

procedure TfrmMain.miAxisTickMarkLabelsClick(Sender: TObject);
begin
  with GetActiveAxis(Sender) do
    TickMarkLabels := not TickMarkLabels;
  UpdateControls;
end;

procedure TfrmMain.miCategoryAxisCategoriesInReverseOrderClick(
  Sender: TObject);
begin
  with GetActiveAxis(Sender) as TcxGridChartHistogramAxisCategory do
    CategoriesInReverseOrder := not CategoriesInReverseOrder;
  UpdateControls;
end;

procedure TfrmMain.miCategoryAxisValueAxisAtMaxCategoryClick(
  Sender: TObject);
begin
  with GetActiveAxis(Sender) as TcxGridChartHistogramAxisCategory do
    ValueAxisAtMaxCategory := not ValueAxisAtMaxCategory;
  UpdateControls;
end;

procedure TfrmMain.miCategoryAxisValueAxisBetweenCategoriesClick(
  Sender: TObject);
begin
  with GetActiveAxis(Sender) as TcxGridChartHistogramAxisCategory do
    ValueAxisBetweenCategories := not ValueAxisBetweenCategories;
  UpdateControls;
end;

procedure TfrmMain.gvChartViewDiagramStackedBarCustomDrawValue(
  Sender: TcxGridChartDiagram; ACanvas: TcxCanvas;
  AViewInfo: TcxGridChartDiagramValueViewInfo; var ADone: Boolean);
var
  C1: TColor;
begin
  C1 := Light(AViewInfo.Params.Color, 75);
  FillGradientRect(ACanvas.Handle, AViewInfo.Bounds, C1, AViewInfo.Params.Color, Sender is TcxGridChartStackedBarDiagram);
  ADone := True;
end;

procedure TfrmMain.StackedStyleClick(Sender: TObject);
begin
  if ActiveHistogram is TcxGridChartStackedColumnDiagram then
    TcxGridChartStackedColumnDiagram(ActiveHistogram).StackedStyle := TcxGridChartStackedDiagramStyle(TMenuItem(Sender).Tag);
  UpdateControls;
end;

procedure TfrmMain.StackedAreaStyleClick(Sender: TObject);
begin
  if ActiveHistogram is TcxGridChartStackedAreaDiagram then
    TcxGridChartStackedAreaDiagram(ActiveHistogram).StackedStyle := TcxGridChartStackedAreaDiagramStyle(TMenuItem(Sender).Tag);
  UpdateControls;
end;

procedure TfrmMain.gvChartViewActiveDiagramChanged(
  Sender: TcxGridChartView; ADiagram: TcxGridChartDiagram);
begin
  UpdateControls;
end;

procedure TfrmMain.miEmptyPointsDisplayModeClick(Sender: TObject);
begin
  if ActiveHistogram is TcxGridChartLineDiagram then
    TcxGridChartLineDiagram(ActiveHistogram).EmptyPointsDisplayMode := TcxGridChartEmptyPointsDisplayMode(TComponent(Sender).Tag);
  UpdateControls;
end;

procedure TfrmMain.miTransparencyClick(Sender: TObject);
begin
  if ActiveHistogram is TcxGridChartAreaDiagram then
    TcxGridChartAreaDiagram(ActiveHistogram).Transparency := (Sender as TMenuItem).Tag;
  UpdateControls;
end;

end.


