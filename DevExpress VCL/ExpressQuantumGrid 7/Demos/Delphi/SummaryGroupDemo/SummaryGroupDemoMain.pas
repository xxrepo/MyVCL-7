unit SummaryGroupDemoMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxControls, cxGridCustomView, cxGrid, cxCustomData,
  ExtCtrls, ActnList, ImgList, Menus, ComCtrls, cxGridCustomPopupMenu,
  cxGridPopupMenu, ToolWin, cxStyles, cxGraphics, cxFilter, cxData, cxEdit,
  DB, cxDBData, cxClasses, cxDataStorage, cxDBLookupComboBox, cxCalendar,
  cxImageComboBox, cxCalc, cxBlobEdit, cxSpinEdit, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter;

type
  TSummaryGroupDemoMainForm = class(TForm)
    mmMain: TMainMenu;
    miAbout: TMenuItem;
    miFile: TMenuItem;
    miOptions: TMenuItem;
    miExit: TMenuItem;
    miSummaries: TMenuItem;
    Grid: TcxGrid;
    tvOrders: TcxGridDBTableView;
    tvOrdersCustomerID: TcxGridDBColumn;
    tvOrdersPurchaseDate: TcxGridDBColumn;
    tvOrdersPaymentType: TcxGridDBColumn;
    tvOrdersPaymentAmount: TcxGridDBColumn;
    tvOrdersDescription: TcxGridDBColumn;
    tvOrdersQuantity: TcxGridDBColumn;
    lbDescription: TLabel;
    miSelectedRecordsOnly: TMenuItem;
    miIgnoreNullValues: TMenuItem;
    N1: TMenuItem;
    miGroupFooter: TMenuItem;
    miMultiSelect: TMenuItem;
    miGroupFooterAlwaysShow: TMenuItem;
    miGroupFooterNeverShow: TMenuItem;
    miGroupFooterShowWhenExpand: TMenuItem;
    cxGridPopupMenu1: TcxGridPopupMenu;
    lvOrders: TcxGridLevel;
    tvOrdersProductID: TcxGridDBColumn;
    LookAndFeelController: TcxLookAndFeelController;
    miGroupSummaryLayout: TMenuItem;
    miGroupSummaryLayoutStandard: TMenuItem;
    miGroupSummaryLayoutAlignWithColumns: TMenuItem;
    miGroupSummaryLayoutAlignWithColumnsAndDistribute: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    miGroupFootersAtCarLevel: TMenuItem;
    miGroupFootersAtCompanyLevel: TMenuItem;
    procedure miAboutClick(Sender: TObject);
    procedure miExitClick(Sender: TObject);
    procedure miSelectedRecordsOnlyClick(Sender: TObject);
    procedure miIgnoreNullValuesClick(Sender: TObject);
    procedure miMultiSelectClick(Sender: TObject);
    procedure miGroupFooterShowClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure miGroupSummaryLayoutClick(
      Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure miGroupFootersAtLevelClick(Sender: TObject);
  protected
    procedure UpdateMenu;
  public
    { Public declarations }
  end;

var
  SummaryGroupDemoMainForm: TSummaryGroupDemoMainForm;

implementation

{$R *.dfm}

uses
{$IFDEF CLR}
  Variants,
{$ENDIF}
  SummaryGroupDemoData, AboutDemoForm;

procedure TSummaryGroupDemoMainForm.UpdateMenu;
begin
  miSelectedRecordsOnly.Checked := soSelectedRecords in tvOrders.DataController.Summary.Options;
  miIgnoreNullValues.Checked := soNullIgnore in tvOrders.DataController.Summary.Options;
  miGroupSummaryLayout[Ord(tvOrders.OptionsView.GroupSummaryLayout)].Checked := True;
  miGroupFooter[Ord(tvOrders.OptionsView.GroupFooters)].Checked := True;
  miGroupFootersAtCarLevel.Checked := tvOrdersProductID.Options.GroupFooters;
  miGroupFootersAtCompanyLevel.Checked := tvOrdersCustomerID.Options.GroupFooters;
  miMultiSelect.Checked := tvOrders.OptionsSelection.MultiSelect;
end;

procedure TSummaryGroupDemoMainForm.miAboutClick(Sender: TObject);
begin
  ShowAboutDemoForm;
end;

procedure TSummaryGroupDemoMainForm.miExitClick(Sender: TObject);
begin
  Close;
end;

procedure TSummaryGroupDemoMainForm.miSelectedRecordsOnlyClick(Sender: TObject);
begin
  with tvOrders.DataController.Summary do
    if soSelectedRecords in Options then
      Options := Options - [soSelectedRecords]
    else
      Options := Options + [soSelectedRecords];
  UpdateMenu;  
end;

procedure TSummaryGroupDemoMainForm.miIgnoreNullValuesClick(Sender: TObject);
begin
  with tvOrders.DataController.Summary do
    if soNullIgnore in Options then
      Options := Options - [soNullIgnore]
    else
      Options := Options + [soNullIgnore];
  UpdateMenu;
end;

procedure TSummaryGroupDemoMainForm.miMultiSelectClick(Sender: TObject);
begin
  with tvOrders.OptionsSelection do
    MultiSelect := not MultiSelect;
  UpdateMenu;
end;

procedure TSummaryGroupDemoMainForm.miGroupFootersAtLevelClick(Sender: TObject);
var
  AColumn: TcxGridColumn;
begin
  if TMenuItem(Sender).Tag = 1 then
    AColumn := tvOrdersProductID
  else
    AColumn := tvOrdersCustomerID;
  with AColumn.Options do
    GroupFooters := not GroupFooters;
  UpdateMenu;     
end;

procedure TSummaryGroupDemoMainForm.miGroupFooterShowClick(Sender: TObject);
begin
  tvOrders.OptionsView.GroupFooters := TcxGridGroupFootersMode(TMenuItem(Sender).MenuIndex);
  UpdateMenu;
end;

procedure TSummaryGroupDemoMainForm.miGroupSummaryLayoutClick(Sender: TObject);
begin
  tvOrders.OptionsView.GroupSummaryLayout := TcxGridGroupSummaryLayout(TMenuItem(Sender).MenuIndex);
  UpdateMenu;
end;

procedure TSummaryGroupDemoMainForm.FormCreate(Sender: TObject);
begin
  UpdateMenu;
end;

procedure TSummaryGroupDemoMainForm.FormShow(Sender: TObject);
begin
  tvOrders.DataController.Groups.FullExpand;
  tvOrders.Controller.GoToFirst;
end;

end.
