unit SummaryFooterDemoMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxControls, cxGridCustomView, cxGrid, cxCustomData,
  ExtCtrls, ActnList, ImgList, Menus, ComCtrls, cxGridCustomPopupMenu,
  cxGridPopupMenu, cxStyles, cxGraphics, cxFilter, cxData, cxEdit, DB,
  cxDBData, cxClasses, cxDataStorage, cxBlobEdit, cxSpinEdit, cxCheckBox,
  cxHyperLinkEdit, cxCurrencyEdit, cxDBLookupComboBox, cxCalendar,
  cxTimeEdit, cxImageComboBox, cxCalc, cxLookAndFeels;

type
  TSummaryFooterDemoMainForm = class(TForm)
    mmMain: TMainMenu;
    miAbout: TMenuItem;
    miFile: TMenuItem;
    miOptions: TMenuItem;
    miExit: TMenuItem;
    miSummaries: TMenuItem;
    sbMain: TStatusBar;
    Grid: TcxGrid;
    lvCars: TcxGridLevel;
    tvCars: TcxGridDBTableView;
    tvCarsTrademark: TcxGridDBColumn;
    tvCarsModel: TcxGridDBColumn;
    tvCarshp: TcxGridDBColumn;
    tvCarsliter: TcxGridDBColumn;
    tvCarscyl: TcxGridDBColumn;
    tvCarsTransmissSpeedCount: TcxGridDBColumn;
    tvCarsTransmissAutomatic: TcxGridDBColumn;
    tvCarsMPG_City: TcxGridDBColumn;
    tvCarsMPG_Highway: TcxGridDBColumn;
    tvCarsCategory: TcxGridDBColumn;
    tvCarsDescription: TcxGridDBColumn;
    tvCarsHyperlink: TcxGridDBColumn;
    tvCarsPicture: TcxGridDBColumn;
    tvCarsPrice: TcxGridDBColumn;
    lvOrders: TcxGridLevel;
    tvOrders: TcxGridDBTableView;
    tvOrdersCustomerID: TcxGridDBColumn;
    tvOrdersPurchaseDate: TcxGridDBColumn;
    tvOrdersTime: TcxGridDBColumn;
    tvOrdersPaymentType: TcxGridDBColumn;
    tvOrdersPaymentAmount: TcxGridDBColumn;
    tvOrdersDescription: TcxGridDBColumn;
    tvOrdersQuantity: TcxGridDBColumn;
    lbDescription: TLabel;
    miCustomizeSummaries: TMenuItem;
    miSelectedRecordOnly: TMenuItem;
    miIgnoreNullValues: TMenuItem;
    N1: TMenuItem;
    miFooter: TMenuItem;
    miMultiSelect: TMenuItem;
    N2: TMenuItem;
    cxGridPopupMenu1: TcxGridPopupMenu;
    LookAndFeelController: TcxLookAndFeelController;
    procedure miAboutClick(Sender: TObject);
    procedure miExitClick(Sender: TObject);
    procedure btnAddSummaryClick(Sender: TObject);
    procedure miCustomizeSummariesClick(Sender: TObject);
    procedure miSelectedRecordOnlyClick(Sender: TObject);
    procedure miIgnoreNullValuesClick(Sender: TObject);
    procedure miMultiSelectClick(Sender: TObject);
    procedure miFooterClick(Sender: TObject);
    procedure GridFocusedViewChanged(Sender: TcxCustomGrid;
      APrevFocusedView, AFocusedView: TcxCustomGridView);
    procedure FormShow(Sender: TObject);
  public
    { Public declarations }
  end;

var
  SummaryFooterDemoMainForm: TSummaryFooterDemoMainForm;

implementation

{$R *.dfm}

uses
  SummaryFooterDemoData, SummaryFooterDemoEditSummary, AboutDemoForm;

procedure TSummaryFooterDemoMainForm.btnAddSummaryClick(Sender: TObject);
begin
  SummaryFooterDemoEditSummaryForm.ShowModal;
end;

procedure TSummaryFooterDemoMainForm.miAboutClick(Sender: TObject);
begin
  ShowAboutDemoForm;
end;

procedure TSummaryFooterDemoMainForm.miExitClick(Sender: TObject);
begin
  Close;
end;

procedure TSummaryFooterDemoMainForm.miCustomizeSummariesClick(Sender: TObject);
begin
  SummaryFooterDemoEditSummaryForm.ShowModal;
end;

procedure TSummaryFooterDemoMainForm.miSelectedRecordOnlyClick(
  Sender: TObject);
var
  ASummary: TcxDataSummary;
begin
  if not Assigned(Grid.FocusedView) then Exit;
  with Sender as TMenuItem do
    Checked := not Checked;
  ASummary := Grid.FocusedView.DataController.Summary;
  if (Sender as TMenuItem).Checked then
    ASummary.Options := ASummary.Options + [soSelectedRecords]
  else
    ASummary.Options := ASummary.Options - [soSelectedRecords];
end;

procedure TSummaryFooterDemoMainForm.miIgnoreNullValuesClick(
  Sender: TObject);
var
  ASummary: TcxDataSummary;
begin
  if not Assigned(Grid.FocusedView) then Exit;
  with Sender as TMenuItem do
    Checked := not Checked;
  ASummary := Grid.FocusedView.DataController.Summary;
  if (Sender as TMenuItem).Checked then
    ASummary.Options := ASummary.Options + [soNullIgnore]
  else
    ASummary.Options := ASummary.Options - [soNullIgnore];
end;

procedure TSummaryFooterDemoMainForm.miMultiSelectClick(
  Sender: TObject);
var
  AView: TcxGridDBTableView;
begin
  if not Assigned(Grid.FocusedView) then Exit;
  with Sender as TMenuItem do
    Checked := not Checked;
  AView := TcxGridDBTableView(Grid.FocusedView);
  AView.OptionsSelection.MultiSelect := (Sender as TMenuItem).Checked;
end;

procedure TSummaryFooterDemoMainForm.miFooterClick(Sender: TObject);
var
  AView: TcxGridDBTableView;
begin
  if not Assigned(Grid.FocusedView) then Exit;
  with Sender as TMenuItem do
    Checked := not Checked;
  AView := TcxGridDBTableView(Grid.FocusedView);
  AView.OptionsView.Footer := (Sender as TMenuItem).Checked;
end;

procedure TSummaryFooterDemoMainForm.GridFocusedViewChanged(
  Sender: TcxCustomGrid; APrevFocusedView,
  AFocusedView: TcxCustomGridView);
var
  AView: TcxGridDBTableView;
begin
  AView := TcxGridDBTableView(Grid.FocusedView);
  miSelectedRecordOnly.Checked := soSelectedRecords in
    AView.DataController.Summary.Options;
  miIgnoreNullValues.Checked := soNullIgnore in
    AView.DataController.Summary.Options;
  miMultiSelect.Checked := AView.OptionsSelection.MultiSelect;
  miFooter.Checked := AView.OptionsView.Footer;
end;

procedure TSummaryFooterDemoMainForm.FormShow(Sender: TObject);
begin
  if SummaryFooterDemoDataDM.tblCars.Active then
  begin
    SummaryFooterDemoDataDM.tblCars.First;
    if Assigned(tvCars.Controller.FocusedRecord) then
      tvCars.Controller.FocusedRecord.Expanded := true;
  end;
end;

end.  
