unit ViewChartDemoMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridChartView, cxGridDBChartView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, DBTables,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid, cxTimeEdit,
  cxImageComboBox, ImgList, cxLookAndFeels, Menus, StdCtrls;

type
  TfrmMain = class(TForm)
    tvData: TcxGridDBTableView;
    grMainLevel1: TcxGridLevel;
    grMain: TcxGrid;
    dsOrders: TDataSource;
    tblOrders: TTable;
    grMainLevel2: TcxGridLevel;
    chvSales: TcxGridDBChartView;
    qrSales: TQuery;
    dsSales: TDataSource;
    tblOrdersID: TAutoIncField;
    tblOrdersCustomerID: TIntegerField;
    tblOrdersProductID: TIntegerField;
    tblOrdersPurchaseDate: TDateTimeField;
    tblOrdersTime: TDateTimeField;
    tblOrdersPaymentType: TStringField;
    tblOrdersPaymentAmount: TCurrencyField;
    tblOrdersDescription: TMemoField;
    tblOrdersQuantity: TIntegerField;
    tblProducts: TTable;
    tblOrdersProductName: TStringField;
    tblCustomers: TTable;
    dbMain: TDatabase;
    tblOrdersCustomer: TStringField;
    tvDataID: TcxGridDBColumn;
    tvDataPurchaseDate: TcxGridDBColumn;
    tvDataPaymentType: TcxGridDBColumn;
    tvDataPaymentAmount: TcxGridDBColumn;
    tvDataQuantity: TcxGridDBColumn;
    tvDataProductName: TcxGridDBColumn;
    tvDataCompany: TcxGridDBColumn;
    chvSalesByQuarter: TcxGridChartView;
    chvSalesByQuarterSeries1: TcxGridChartSeries;
    chvSalesByQuarterSeries2: TcxGridChartSeries;
    chvSalesByQuarterSeries3: TcxGridChartSeries;
    chvSalesByQuarterSeries4: TcxGridChartSeries;
    grMainLevel3: TcxGridLevel;
    qrSalesByQuarter: TQuery;
    chvSalesSeries1: TcxGridDBChartSeries;
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
    miColumnDiagram: TMenuItem;
    miBarDiagram: TMenuItem;
    N1: TMenuItem;
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
    miLineDiagram: TMenuItem;
    miAreaDiagram: TMenuItem;
    miPieDiagram: TMenuItem;
    miDiagram: TMenuItem;
    miLineValueCaptionPosition: TMenuItem;
    miLineValueCaptionPositionNone: TMenuItem;
    miLineValueCaptionPositionLeft: TMenuItem;
    miLineValueCaptionPositionAbove: TMenuItem;
    miLineValueCaptionPositionRight: TMenuItem;
    miLineValueCaptionPositionBelow: TMenuItem;
    miLineValueCaptionPositionCenter: TMenuItem;
    miLineStyle: TMenuItem;
    miLineStyleNone: TMenuItem;
    miLineStyleSolid: TMenuItem;
    miLineStyleDash: TMenuItem;
    miLineStyleDot: TMenuItem;
    miLineStyleDashDot: TMenuItem;
    miLineStyleDashDotDot: TMenuItem;
    N2: TMenuItem;
    miMarkerStyle: TMenuItem;
    miMarkerStyleNone: TMenuItem;
    miMarkerStyleSquare: TMenuItem;
    miMarkerStyleTriangle: TMenuItem;
    miMarkerStyleDiamond: TMenuItem;
    miMarkerStyleCircle: TMenuItem;
    miValueStacking: TMenuItem;
    miValueStackingNone: TMenuItem;
    miValueStackingNormal: TMenuItem;
    miValueStacking100Percent: TMenuItem;
    miLineWidth: TMenuItem;
    miLineWidth1: TMenuItem;
    miLineWidth2: TMenuItem;
    miLineWidth3: TMenuItem;
    miLineWidth4: TMenuItem;
    miLineWidth5: TMenuItem;
    miMarkerSize: TMenuItem;
    miMarkerSize3: TMenuItem;
    miMarkerSize5: TMenuItem;
    miMarkerSize7: TMenuItem;
    miMarkerSize9: TMenuItem;
    miMarkerSize11: TMenuItem;
    miSeriesCaptions: TMenuItem;
    miSeriesColumnCount: TMenuItem;
    miSeriesSites: TMenuItem;
    miPieValueCaptionPosition: TMenuItem;
    miPieValueCaptionItems: TMenuItem;
    miSeriesColumns1: TMenuItem;
    miSeriesColumns2: TMenuItem;
    miSeriesColumns3: TMenuItem;
    miSeriesColumns4: TMenuItem;
    miPieValueCaptionPositionNone: TMenuItem;
    miPieValueCaptionPositionCenter: TMenuItem;
    miPieValueCaptionPositionInsideEnd: TMenuItem;
    miPieValueCaptionPositionOutsideEnd: TMenuItem;
    miPieValueCaptionPositionOutsideEndWithLeaderLines: TMenuItem;
    miPieValueCaptionItemCategory: TMenuItem;
    miPieValueCaptionItemValue: TMenuItem;
    miPieValueCaptionItemPercentage: TMenuItem;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    miToolBox: TMenuItem;
    N4: TMenuItem;
    miToolBoxPosition: TMenuItem;
    miToolBoxPositionTop: TMenuItem;
    miToolBoxPositionBottom: TMenuItem;
    cxStyle7: TcxStyle;
    procedure FormCreate(Sender: TObject);
    procedure chvSalesByQuarterGetValueHint(Sender: TcxGridChartView;
      ASeries: TcxGridChartSeries; AValueIndex: Integer;
      var AHint: String);
    procedure miExitClick(Sender: TObject);
    procedure miAboutClick(Sender: TObject);
    procedure chvSalesSeries1CustomDrawValue(Sender: TcxGridChartSeries;
      ACanvas: TcxCanvas; AViewInfo: TcxGridChartDiagramValueViewInfo;
      var ADone: Boolean);
    procedure grMainActiveTabChanged(Sender: TcxCustomGrid;
      ALevel: TcxGridLevel);
    procedure miColumnDiagramClick(Sender: TObject);
    procedure miBarDiagramClick(Sender: TObject);
    procedure miTitlePositionItemClick(Sender: TObject);
    procedure miLegendPositionItemClick(Sender: TObject);
    procedure miLegendBorderClick(Sender: TObject);
    procedure miValueCaptionPositionItemClick(Sender: TObject);
    procedure chvSalesActiveDiagramChanged(Sender: TcxGridChartView;
      ADiagram: TcxGridChartDiagram);
    procedure miAxisVisibleClick(Sender: TObject);
    procedure miAxisGridLinesClick(Sender: TObject);
    procedure miAxisTickMarkKindItemClick(Sender: TObject);
    procedure miAxisTickMarkLabelsClick(Sender: TObject);
    procedure miCategoryAxisCategoriesInReverseOrderClick(Sender: TObject);
    procedure miCategoryAxisValueAxisAtMaxCategoryClick(Sender: TObject);
    procedure miCategoryAxisValueAxisBetweenCategoriesClick(
      Sender: TObject);
    procedure miLineDiagramClick(Sender: TObject);
    procedure miAreaDiagramClick(Sender: TObject);
    procedure miPieDiagramClick(Sender: TObject);
    procedure miLineValueCaptionPositionClick(Sender: TObject);
    procedure miLineStyleClick(Sender: TObject);
    procedure miMarkerStyleClick(Sender: TObject);
    procedure miValueStackingClick(Sender: TObject);
    procedure miLineWidthClick(Sender: TObject);
    procedure miMarkerSizeClick(Sender: TObject);
    procedure miSeriesCaptionsClick(Sender: TObject);
    procedure miSeriesSitesClick(Sender: TObject);
    procedure miSeriesColumnsClick(Sender: TObject);
    procedure miPieValueCaptionPositionClick(
      Sender: TObject);
    procedure miPieValueCaptionItemClick(Sender: TObject);
    procedure chvSalesDiagramAreaCustomDrawValueArea(
      Sender: TcxGridChartAreaDiagram; ACanvas: TcxCanvas;
      AViewInfo: TcxGridChartAreaDiagramValueViewInfo; var ADone: Boolean);
    procedure chvSalesValueClick(Sender: TcxGridChartView;
      ASeries: TcxGridChartSeries; AValueIndex: Integer; var AHandled: Boolean);
    procedure miToolBoxClick(Sender: TObject);
    procedure miToolBoxPositionClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    function GetActiveChart: TcxGridChartView;
    function GetActiveColumnDiagram: TcxGridChartColumnDiagram;
    function GetActiveHistogram: TcxGridChartHistogram;
    function GetActiveLineDiagram: TcxGridChartLineDiagram;
    function GetActivePieDiagram: TcxGridChartPieDiagram;
  protected
    procedure UpdateControls;
  public
    procedure CalculateSalesInfo;
    procedure CalculateSalesInfoForQuarter(AQuarter: Integer);
    function GetActiveAxis(AMenuItem: TObject): TcxGridChartHistogramAxis;

    property ActiveChart: TcxGridChartView read GetActiveChart;
    property ActiveColumnDiagram: TcxGridChartColumnDiagram read GetActiveColumnDiagram;
    property ActiveHistogram: TcxGridChartHistogram read GetActiveHistogram;
    property ActiveLineDiagram: TcxGridChartLineDiagram read GetActiveLineDiagram;
    property ActivePieDiagram: TcxGridChartPieDiagram read GetActivePieDiagram;
  end;

var
  frmMain: TfrmMain;

implementation

uses
{$IFDEF CLR}
  Variants,
{$ENDIF}
  dxOffice11, cxGridCommon, AboutDemoForm;

{$R *.dfm}

function TfrmMain.GetActiveChart: TcxGridChartView;
begin
  if grMain.ActiveView is TcxGridChartView then
    Result := TcxGridChartView(grMain.ActiveView)
  else
    Result := nil;
end;

function TfrmMain.GetActiveColumnDiagram: TcxGridChartColumnDiagram;
begin
  if ActiveChart.ActiveDiagram is TcxGridChartColumnDiagram then
    Result := TcxGridChartColumnDiagram(ActiveChart.ActiveDiagram)
  else
    Result := nil;
end;

function TfrmMain.GetActiveHistogram: TcxGridChartHistogram;
begin
  if ActiveChart.ActiveDiagram is TcxGridChartHistogram then
    Result := TcxGridChartHistogram(ActiveChart.ActiveDiagram)
  else
    Result := nil;
end;

function TfrmMain.GetActiveLineDiagram: TcxGridChartLineDiagram;
begin
  if ActiveChart.ActiveDiagram is TcxGridChartLineDiagram then
    Result := TcxGridChartLineDiagram(ActiveChart.ActiveDiagram)
  else
    Result := nil;
end;

function TfrmMain.GetActivePieDiagram: TcxGridChartPieDiagram;
begin
  if ActiveChart.ActiveDiagram is TcxGridChartPieDiagram then
    Result := TcxGridChartPieDiagram(ActiveChart.ActiveDiagram)
  else
    Result := nil;
end;

procedure TfrmMain.UpdateControls;
var
  AChart: TcxGridChartView;
  AHistogram: TcxGridChartHistogram;
  AColumnDiagram: TcxGridChartColumnDiagram;
  ALineDiagram: TcxGridChartLineDiagram;
  APieDiagram: TcxGridChartPieDiagram;
  ACaptionItem: TcxGridChartPieDiagramValueCaptionItem;
begin
  AChart := ActiveChart;
  miView.Enabled := AChart <> nil;
  miDiagram.Enabled := miView.Enabled;
  if AChart = nil then Exit;

  { view }
  if AChart.DiagramColumn.Active then
    miColumnDiagram.Checked := True
  else
    if AChart.DiagramBar.Active then
      miBarDiagram.Checked := True
    else
      if AChart.DiagramLine.Active then
        miLineDiagram.Checked := True
      else
        if AChart.DiagramArea.Active then
          miAreaDiagram.Checked := True
        else
          miPieDiagram.Checked := True;
  miTitlePosition[Ord(AChart.Title.Position)].Checked := True;
  miLegendPosition[Ord(AChart.ActiveDiagram.Legend.Position)].Checked := True;
  miLegendBorder.Checked := AChart.ActiveDiagram.Legend.GetBorder = lbSingle;
  miToolBox.Checked := AChart.ToolBox.Visible <> tvNever;
  miToolBoxPosition[Ord(AChart.ToolBox.Position)].Checked := True;

  { diagram }
  // histogram
  AHistogram := ActiveHistogram;
  miCategoryAxis.Visible := AHistogram <> nil;
  miValueAxis.Visible := AHistogram <> nil;
  if AHistogram <> nil then
  begin
    // category axis
    miCategoryAxisVisible.Checked := AHistogram.AxisCategory.Visible;
    miCategoryAxisGridLines.Checked := AHistogram.AxisCategory.GridLines;
    miCategoryAxisTickMarkKind[Ord(AHistogram.AxisCategory.TickMarkKind)].Checked := True;
    miCategoryAxisTickMarkLabels.Checked := AHistogram.AxisCategory.TickMarkLabels;
    miCategoryAxisCategoriesInReverseOrder.Checked := AHistogram.AxisCategory.CategoriesInReverseOrder;
    miCategoryAxisValueAxisAtMaxCategory.Checked := AHistogram.AxisCategory.ValueAxisAtMaxCategory;
    miCategoryAxisValueAxisBetweenCategories.Checked := AHistogram.AxisCategory.ValueAxisBetweenCategories;
    // value axis
    miValueAxisVisible.Checked := AHistogram.AxisValue.Visible;
    miValueAxisGridLines.Checked := AHistogram.AxisValue.GridLines;
    miValueAxisTickMarkKind[Ord(AHistogram.AxisValue.TickMarkKind)].Checked := True;
    miValueAxisTickMarkLabels.Checked := AHistogram.AxisValue.TickMarkLabels;
  end;
  // column
  AColumnDiagram := ActiveColumnDiagram;
  miValueCaptionPosition.Visible := AColumnDiagram <> nil;
  if AColumnDiagram <> nil then
    miValueCaptionPosition[Ord(AColumnDiagram.Values.CaptionPosition)].Checked := True;
  // line
  ALineDiagram := ActiveLineDiagram;
  miLineValueCaptionPosition.Visible := ALineDiagram <> nil;
  miLineStyle.Visible := ALineDiagram <> nil;
  miLineWidth.Visible := ALineDiagram <> nil;
  miMarkerStyle.Visible := ALineDiagram <> nil;
  miMarkerSize.Visible := ALineDiagram <> nil;
  miValueStacking.Visible := ALineDiagram <> nil;
  if ALineDiagram <> nil then
  begin
    miLineValueCaptionPosition[Ord(ALineDiagram.Values.CaptionPosition)].Checked := True;
    miLineStyle[Ord(ALineDiagram.Values.LineStyle)].Checked := True;
    miLineWidth.Find(IntToStr(ALineDiagram.Values.LineWidth)).Checked := True;
    miMarkerStyle[Ord(ALineDiagram.Values.MarkerStyle)].Checked := True;
    miMarkerSize.Find(IntToStr(ALineDiagram.Values.MarkerSize)).Checked := True;
    miValueStacking[Ord(ALineDiagram.Values.Stacking)].Checked := True;
  end;
  // pie
  APieDiagram := ActivePieDiagram;
  miSeriesCaptions.Visible := APieDiagram <> nil;
  miSeriesSites.Visible := APieDiagram <> nil;
  miSeriesColumnCount.Visible := APieDiagram <> nil;
  miPieValueCaptionPosition.Visible := APieDiagram <> nil;
  miPieValueCaptionItems.Visible := APieDiagram <> nil;
  if APieDiagram <> nil then
  begin
    miSeriesCaptions.Checked := APieDiagram.SeriesCaptions;
    miSeriesSites.Checked := APieDiagram.SeriesSites;
    miSeriesColumnCount.Enabled := APieDiagram.GetSeriesColumnCount > 0;
    if miSeriesColumnCount.Enabled then
      miSeriesColumnCount.Find(IntToStr(APieDiagram.GetSeriesColumnCount)).Checked := True;
    miPieValueCaptionPosition[Ord(APieDiagram.Values.CaptionPosition)].Checked := True;
    for ACaptionItem := Low(ACaptionItem) to High(ACaptionItem) do
      miPieValueCaptionItems[Ord(ACaptionItem)].Checked := ACaptionItem in APieDiagram.Values.CaptionItems;
  end;
end;

procedure TfrmMain.miAreaDiagramClick(Sender: TObject);
begin
  ActiveChart.DiagramArea.Active := True;
end;

procedure TfrmMain.CalculateSalesInfo;
var
  I: Integer;
begin
  for I := 1 to 4 do
    CalculateSalesInfoForQuarter(I);
end;

procedure TfrmMain.CalculateSalesInfoForQuarter(AQuarter: Integer);
const
  Year = 2002;
var
  AStartMonth, AFinishMonth, I: Integer;
begin
  AStartMonth := (AQuarter - 1) * 3 + 1;
  AFinishMonth := AQuarter * 3;

  qrSalesByQuarter.Active := False;
  qrSalesByQuarter.ParamByName('StartDate').AsDateTime := EncodeDate(Year, AStartMonth, 1);
  qrSalesByQuarter.ParamByName('FinishDate').AsDateTime := EncodeDate(Year, AFinishMonth,
    MonthDays[IsLeapYear(Year), AFinishMonth]);
  qrSalesByQuarter.Active := True;
  chvSalesByQuarter.ViewData.CategoryCount := qrSalesByQuarter.RecordCount;

  chvSalesByQuarter.BeginUpdate;
  try
    I := 0;
    qrSalesByQuarter.First;
    while not qrSalesByQuarter.Eof do
    begin
      chvSalesByQuarter.ViewData.Categories[I] := qrSalesByQuarter.FieldValues['Name'];
      chvSalesByQuarter.ViewData.Values[AQuarter - 1, I] := qrSalesByQuarter.FieldValues['Amount'];
      qrSalesByQuarter.Next;
      Inc(I);
    end;
  finally
    chvSalesByQuarter.EndUpdate;
  end;
end;

function TfrmMain.GetActiveAxis(AMenuItem: TObject): TcxGridChartHistogramAxis;
begin
  while (AMenuItem is TMenuItem) and
    {$IFDEF CLR}VarIsEmpty(TMenuItem(AMenuItem).Tag){$ELSE}(TMenuItem(AMenuItem).Tag = 0){$ENDIF} do
    AMenuItem := TMenuItem(AMenuItem).Parent;
  case {$IFDEF CLR}Integer{$ENDIF}((AMenuItem as TMenuItem).Tag) of
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

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  grMainLevel3.Active := True;
  CalculateSalesInfo;
end;

procedure TfrmMain.chvSalesByQuarterGetValueHint(Sender: TcxGridChartView;
  ASeries: TcxGridChartSeries; AValueIndex: Integer; var AHint: String);
begin
  AHint := Format('%s sales for Q%d are %s',
    [Sender.ViewData.Categories[AValueIndex], ASeries.Index + 1, ASeries.VisibleDisplayTexts[AValueIndex]]);
end;

procedure TfrmMain.chvSalesDiagramAreaCustomDrawValueArea(
  Sender: TcxGridChartAreaDiagram; ACanvas: TcxCanvas;
  AViewInfo: TcxGridChartAreaDiagramValueViewInfo; var ADone: Boolean);
var
  AClipRegion, ARegion: TcxRegion;
begin
  AClipRegion := ACanvas.GetClipRegion;
  try
    ARegion := AViewInfo.CreateAreaRegion;
    try
      ACanvas.SetClipRegion(ARegion, roIntersect, False);
      FillGradientRect(ACanvas.Handle, AViewInfo.GetRealBounds, clWhite, clMedGray, True);
    finally
      ARegion.Free;
    end;
  finally
    ACanvas.SetClipRegion(AClipRegion, roSet);
  end;
  ADone := True;
end;

procedure TfrmMain.miExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.miAboutClick(Sender: TObject);
begin
  ShowAboutDemoForm;
end;

procedure TfrmMain.chvSalesSeries1CustomDrawValue(
  Sender: TcxGridChartSeries; ACanvas: TcxCanvas;
  AViewInfo: TcxGridChartDiagramValueViewInfo; var ADone: Boolean);
var
  AEndColor: TColor;
begin
  if Sender.GridView.DiagramColumn.Active or Sender.GridView.DiagramBar.Active then
  begin
    if AViewInfo.State = gcsNone then
      AEndColor := clBlack
    else
      AEndColor := clGray;
    FillGradientRect(ACanvas.Handle, AViewInfo.ContentBounds, clWhite, AEndColor,
      Sender.GridView.DiagramColumn.Active);
    ADone := True;
  end;
end;

procedure TfrmMain.chvSalesValueClick(Sender: TcxGridChartView;
  ASeries: TcxGridChartSeries; AValueIndex: Integer; var AHandled: Boolean);
begin
  qrSales.Locate('Name', Sender.Categories.VisibleValues[AValueIndex], []);
  tblOrders.Locate('ProductID', qrSales.FieldByName('ID').AsInteger, []);
  grMainLevel1.Active := True;
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

procedure TfrmMain.miLineStyleClick(Sender: TObject);
begin
  ActiveLineDiagram.Values.LineStyle := TcxGridChartLineStyle(TMenuItem(Sender).MenuIndex);
  UpdateControls;
end;

procedure TfrmMain.miLineValueCaptionPositionClick(Sender: TObject);
begin
  ActiveLineDiagram.Values.CaptionPosition :=
    TcxGridChartLineDiagramValueCaptionPosition(TMenuItem(Sender).MenuIndex);
  UpdateControls;
end;

procedure TfrmMain.miLineWidthClick(Sender: TObject);
begin
  ActiveLineDiagram.Values.LineWidth := StrToInt(TMenuItem(Sender).Caption);
  UpdateControls;
end;

procedure TfrmMain.miMarkerSizeClick(Sender: TObject);
begin
  ActiveLineDiagram.Values.MarkerSize := StrToInt(TMenuItem(Sender).Caption);
  UpdateControls;
end;

procedure TfrmMain.miMarkerStyleClick(Sender: TObject);
begin
  ActiveLineDiagram.Values.MarkerStyle := TcxGridChartMarkerStyle(TMenuItem(Sender).MenuIndex);
  UpdateControls;
end;

procedure TfrmMain.miColumnDiagramClick(Sender: TObject);
begin
  ActiveChart.DiagramColumn.Active := True;
end;

procedure TfrmMain.miBarDiagramClick(Sender: TObject);
begin
  ActiveChart.DiagramBar.Active := True;
end;

procedure TfrmMain.miTitlePositionItemClick(Sender: TObject);
begin
  ActiveChart.Title.Position := TcxGridChartPartPosition(TMenuItem(Sender).MenuIndex);
  UpdateControls;  
end;

procedure TfrmMain.miToolBoxClick(Sender: TObject);
begin
  with ActiveChart.ToolBox do
    if Visible = tvNever then
      Visible := tvAlways
    else
      Visible := tvNever;
  UpdateControls;
end;

procedure TfrmMain.miToolBoxPositionClick(Sender: TObject);
begin
  ActiveChart.ToolBox.Position := TcxGridChartToolBoxPosition(TMenuItem(Sender).MenuIndex);
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

procedure TfrmMain.miValueCaptionPositionItemClick(Sender: TObject);
begin
  ActiveColumnDiagram.Values.CaptionPosition :=
    TcxGridChartColumnDiagramValueCaptionPosition(TMenuItem(Sender).MenuIndex);
  UpdateControls;
end;

procedure TfrmMain.miValueStackingClick(Sender: TObject);
begin
  ActiveLineDiagram.Values.Stacking := TcxGridChartValuesStacking(TMenuItem(Sender).MenuIndex);
  UpdateControls;
end;

procedure TfrmMain.miPieValueCaptionItemClick(Sender: TObject);
var
  ACaptionItem: TcxGridChartPieDiagramValueCaptionItem;
begin
  ACaptionItem := TcxGridChartPieDiagramValueCaptionItem(TMenuItem(Sender).MenuIndex);
  with ActivePieDiagram.Values do
    if ACaptionItem in CaptionItems then
      CaptionItems := CaptionItems - [ACaptionItem]
    else
      CaptionItems := CaptionItems + [ACaptionItem];
  UpdateControls;    
end;

procedure TfrmMain.miPieValueCaptionPositionClick(Sender: TObject);
begin
  ActivePieDiagram.Values.CaptionPosition :=
    TcxGridChartPieDiagramValueCaptionPosition(TMenuItem(Sender).MenuIndex);
  UpdateControls;  
end;

procedure TfrmMain.miPieDiagramClick(Sender: TObject);
begin
  ActiveChart.DiagramPie.Active := True;
end;

procedure TfrmMain.miSeriesCaptionsClick(Sender: TObject);
begin
  with ActivePieDiagram do
    SeriesCaptions := not SeriesCaptions;
  UpdateControls;
end;

procedure TfrmMain.miSeriesColumnsClick(Sender: TObject);
begin
  ActivePieDiagram.SeriesColumnCount := StrToInt(TMenuItem(Sender).Caption);
  UpdateControls;
end;

procedure TfrmMain.miSeriesSitesClick(Sender: TObject);
begin
  with ActivePieDiagram do
    SeriesSites := not SeriesSites;
  UpdateControls;
end;

procedure TfrmMain.chvSalesActiveDiagramChanged(Sender: TcxGridChartView;
  ADiagram: TcxGridChartDiagram);
begin
  if Sender = ActiveChart then UpdateControls;
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

end.
