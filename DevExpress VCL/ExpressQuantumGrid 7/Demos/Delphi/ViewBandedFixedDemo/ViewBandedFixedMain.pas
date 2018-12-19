unit ViewBandedFixedMain;

interface

uses
{$IFDEF CLR}
  System.ComponentModel,
{$ENDIF}
  Windows, Messages, Classes, Graphics, Controls, Forms,
  Dialogs, cxGridLevel, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, DB,
  DBTables, cxGridBandedTableView, cxGridDBBandedTableView, cxStyles,
  cxGridCustomPopupMenu, cxGridPopupMenu, ViewBandedFixedMainData, StdCtrls,
  Menus, ActnList, ImgList, cxLookAndFeels, ComCtrls,
  cxCustomData, cxGraphics, cxFilter, cxData, cxEdit, cxClasses,
  cxDataStorage, cxDBData, cxCalc, cxDBLookupComboBox,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter;

type
  TViewBandedFixedDemoMainForm = class(TForm)
    glUserslSchedule: TcxGridLevel;
    cxGrid: TcxGrid;
    btvUsersSchedule: TcxGridDBBandedTableView;
    mmMain: TMainMenu;
    miFile: TMenuItem;
    miExit: TMenuItem;
    miOptions: TMenuItem;
    miShowBandsHeaders: TMenuItem;
    miShowIndicator: TMenuItem;
    miAbout: TMenuItem;
    lbDescription: TLabel;
    miShowColumnsHeaders: TMenuItem;
    miMultiSelect: TMenuItem;
    btvUsersScheduleSUNDAY: TcxGridDBBandedColumn;
    btvUsersScheduleMONDAY: TcxGridDBBandedColumn;
    btvUsersScheduleTUESDAY: TcxGridDBBandedColumn;
    btvUsersScheduleTHURSDAY: TcxGridDBBandedColumn;
    btvUsersScheduleSATURDAY: TcxGridDBBandedColumn;
    btvUsersScheduleFRIDAY: TcxGridDBBandedColumn;
    btvUsersScheduleRowAvg: TcxGridDBBandedColumn;
    btvUsersScheduleRowSum: TcxGridDBBandedColumn;
    btvUsersScheduleUserName: TcxGridDBBandedColumn;
    btvUsersScheduleProjectName: TcxGridDBBandedColumn;
    sbMain: TStatusBar;
    btvUsersScheduleWEDNESDAY: TcxGridDBBandedColumn;
    cxGridPopupMenu: TcxGridPopupMenu;
    LookAndFeelController: TcxLookAndFeelController;
    procedure FormShow(Sender: TObject);
    procedure miAboutClick(Sender: TObject);
    procedure miShowBandsHeadersClick(Sender: TObject);
    procedure miShowIndicatorClick(Sender: TObject);
    procedure miShowColumnsHeadersClick(Sender: TObject);
    procedure miMultiSelectClick(Sender: TObject);
    procedure miExitClick(Sender: TObject);
  end;

var
  ViewBandedFixedDemoMainForm: TViewBandedFixedDemoMainForm;

implementation

{$R *.dfm}

uses
  AboutDemoForm;

procedure TViewBandedFixedDemoMainForm.FormShow(Sender: TObject);
begin
  cxGrid.FocusedView.DataController.Groups.FullExpand;
end;

procedure TViewBandedFixedDemoMainForm.miAboutClick(Sender: TObject);
begin
  ShowAboutDemoForm;
end;

procedure TViewBandedFixedDemoMainForm.miShowBandsHeadersClick(Sender: TObject);
begin
  with btvUsersSchedule.OptionsView do
    BandHeaders := not BandHeaders;
  (Sender as TMenuItem).Checked := btvUsersSchedule.OptionsView.BandHeaders;
end;

procedure TViewBandedFixedDemoMainForm.miShowIndicatorClick(Sender: TObject);
begin
  with btvUsersSchedule.OptionsView do
    Indicator := not Indicator;
  (Sender as TMenuItem).Checked := btvUsersSchedule.OptionsView.Indicator;
end;

procedure TViewBandedFixedDemoMainForm.miShowColumnsHeadersClick(Sender: TObject);
begin
  with btvUsersSchedule.OptionsView do
    Header := not Header;
  (Sender as TMenuItem).Checked := btvUsersSchedule.OptionsView.Header;
end;

procedure TViewBandedFixedDemoMainForm.miMultiSelectClick(Sender: TObject);
begin
  with btvUsersSchedule.OptionsSelection do
    MultiSelect := not MultiSelect;
  (Sender as TMenuItem).Checked := btvUsersSchedule.OptionsSelection.MultiSelect;
end;

procedure TViewBandedFixedDemoMainForm.miExitClick(Sender: TObject);
begin
  Close;
end;

end.
