unit Office11GroupRowStyleDemoMain;

{$I ..\..\cxVer.inc}

interface

uses
  Windows, Forms, Messages, SysUtils, Classes, ActnList, ImgList, Controls, Menus,
{$IFDEF CLR}
  Variants,
{$ENDIF}
  StdCtrls, cxButtons, cxCheckBox, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxSpinEdit, ExtCtrls, cxGridLevel, cxGridCustomTableView,
  cxGridCardView, cxGridDBCardView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, ComCtrls, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, DB, cxDBData, cxDataStorage, cxLookAndFeelPainters,
  cxLookAndFeels, cxHyperLinkEdit, cxImageComboBox, cxDBLookupComboBox,
  cxMemo, cxGridTableView, DBTables;

type
  TOffice11GroupRowStyleDemoMainForm = class(TForm)
    mmMain: TMainMenu;
    miAbout: TMenuItem;
    miFile: TMenuItem;
    miOptions: TMenuItem;
    miExit: TMenuItem;
    lbDescrip: TLabel;
    LookAndFeelController: TcxLookAndFeelController;
    imgImportance: TImageList;
    Grid: TcxGrid;
    tvMail: TcxGridTableView;
    tvMailImportance: TcxGridColumn;
    tvMailIcon: TcxGridColumn;
    tvMailAttachment: TcxGridColumn;
    tvMailFrom: TcxGridColumn;
    tvMailSubject: TcxGridColumn;
    tvMailReceived: TcxGridColumn;
    tvMailSent: TcxGridColumn;
    lvMail: TcxGridLevel;
    miOffice11GroupRowStyle: TMenuItem;
    miAlwaysExpandedGroups: TMenuItem;
    miGroupBySorting: TMenuItem;
    Database: TDatabase;
    tblPersons: TTable;
    tblPersonsFullName: TStringField;
    tblPersonsFNAME: TStringField;
    tblPersonsLNAME: TStringField;
    dsPersons: TDataSource;
    StyleRepository: TcxStyleRepository;
    UnreadStyle: TcxStyle;
    miDateTimeGrouping: TMenuItem;
    miDateTimeGroupingByDateAndTime: TMenuItem;
    miDateTimeGroupingRelativeToToday: TMenuItem;
    miDateTimeGroupingByHour: TMenuItem;
    miDateTimeGroupingByDate: TMenuItem;
    miDateTimeGroupingByMonth: TMenuItem;
    miDateTimeGroupingByYear: TMenuItem;
    procedure miAboutClick(Sender: TObject);
    procedure miExitClick(Sender: TObject);
    procedure tvMailStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure miOffice11GroupRowStyleClick(Sender: TObject);
    procedure miAlwaysExpandedGroupsClick(Sender: TObject);
    procedure miGroupBySortingClick(Sender: TObject);
    procedure tblPersonsCalcFields(DataSet: TDataSet);
    procedure miDateTimeGroupingClick(Sender: TObject);
  private
    procedure AddRecordIntoTable(ARecordIndex: Integer);
    procedure AddRecordsIntoTable;
  protected
    procedure UpdateMenu;
  public
    constructor Create(AOwner: TComponent); override;
  end;

var
  Office11GroupRowStyleDemoMainForm: TOffice11GroupRowStyleDemoMainForm;

implementation

{$R *.dfm}

uses
{$IFDEF DELPHI6}
  DateUtils,
{$ELSE}
  cxDateUtils,
{$ENDIF}
  DemoUtils, AboutDemoForm;

constructor TOffice11GroupRowStyleDemoMainForm.Create(AOwner: TComponent);
begin
  inherited;
  AddRecordsIntoTable;
  UpdateMenu;
end;

procedure TOffice11GroupRowStyleDemoMainForm.AddRecordIntoTable(ARecordIndex: Integer);

  function GetImportance: Integer;
  begin
    Result := Random(10);
    if(Result > 2) then
      Result := 1;
  end;

  function GetIcon: Integer;
  begin
    Result := Random(4);
    if Result > 1 then
      Result := 1;
  end;

  function GetSent: TDateTime;
  begin
    Result := Now;
    if(Random(6) = 1) then exit;
    Result := IncDay(Result, -Random(50));
    Result := IncHour(Result, -Random(4));
    Result := IncMinute(Result, -Random(60));
  end;

  function GetReceived(ASent: TDateTime): TDateTime;
  begin
    Result := IncMinute(ASent, 10 + Random(120));
  end;

  function GetSubject: string;
  const
    Count = 21;
    Subjects : array[0..Count - 1] of string = (
      'Implementing the Developer Express MasterView control into an Accounting System.',
      'Web Edition: Data Entry Page. The date validation issue.',
      'Payables Due Calculator. It is ready for testing.',
      'Web Edition: Search Page. It is ready for testing.',
      'Main Menu: Duplicate Items. Somebody has to review all the menu items in the system.',
      'Receivables Calculator. Where can I find the complete specs',
      'Ledger: Inconsistency. Please fix it.',
      'Receivables Printing. It is ready for testing.',
      'Screen Redraw. Somebody has to look at it.',
      'Email System. What library are we going to use?',
      'Adding New Vendors Fails. This module doesn''t work properly!',
      'History. Will we track the sales history in our system?',
      'Main Menu: Add a File menu. File menu is missing!!!',
      'Currency Mask. The current currency mask is extremely inconvenient.',
      'Drag & Drop. In the schedule module drag & drop is not available.',
      'Data Import. What competitors databases will we support?',
      'Reports. The list of incomplete reports.',
      'Data Archiving. This features is still missing in our application',
      'Email Attachments. How to add multiple attachments? I can''t see how to do it.',
      'Check Register. We are using different paths for different modules.',
      'Data Export. Our customers asked for export into Excel');

  begin
    Result := Subjects[Random(Count)];
  end;

var
  ASent: TDateTime;
begin
  tvMail.DataController.SetValue(ARecordIndex, tvMailImportance.Index, GetImportance);
  tvMail.DataController.SetValue(ARecordIndex, tvMailIcon.Index, GetIcon);
  tvMail.DataController.SetValue(ARecordIndex, tvMailAttachment.Index, GetIcon);
  tvMail.DataController.SetValue(ARecordIndex, tvMailFrom.Index,
    tblPersonsFullName.Text);
  tvMail.DataController.SetValue(ARecordIndex, tvMailSubject.Index, GetSubject);
  ASent := GetSent;
  tvMail.DataController.SetValue(ARecordIndex, tvMailReceived.Index, GetReceived(ASent));
  tvMail.DataController.SetValue(ARecordIndex, tvMailSent.Index, ASent);
end;

procedure TOffice11GroupRowStyleDemoMainForm.AddRecordsIntoTable;
const
  RecordCount = 10;
var
  J: Integer;
begin
  Randomize;
  tvMail.BeginUpdate;
  tblPersons.DisableControls;
  try
    tvMail.DataController.RecordCount := tblPersons.RecordCount * RecordCount;
    tblPersons.First;
    while not tblPersons.Eof do
    begin
      for J := 0 to RecordCount - 1 do
        AddRecordIntoTable((tblPersons.RecNo - 1) * RecordCount + J);
      tblPersons.Next;
    end;
  finally
    tblPersons.EnableControls;
    tvMail.EndUpdate;
  end;
end;

procedure TOffice11GroupRowStyleDemoMainForm.UpdateMenu;
begin
  miOffice11GroupRowStyle.Checked := tvMail.OptionsView.GroupRowStyle = grsOffice11;
  miGroupBySorting.Checked := tvMail.OptionsCustomize.GroupBySorting;
  miAlwaysExpandedGroups.Checked := dcoGroupsAlwaysExpanded in tvMail.DataController.Options;
  miDateTimeGrouping[Ord(tvMail.DateTimeHandling.Grouping) - 1].Checked := True;
end;

procedure TOffice11GroupRowStyleDemoMainForm.miAboutClick(Sender: TObject);
begin
  ShowAboutDemoForm;
end;

procedure TOffice11GroupRowStyleDemoMainForm.miExitClick(Sender: TObject);
begin
  Close;
end;

procedure TOffice11GroupRowStyleDemoMainForm.tblPersonsCalcFields(DataSet: TDataSet);
begin
  SetStringFieldValue(tblPersonsFullName,
    Format('%s %s', [tblPersonsFNAME.Value, tblPersonsLNAME.Value]));
end;

procedure TOffice11GroupRowStyleDemoMainForm.tvMailStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
  if (ARecord is TcxGridDataRow) and (ARecord.Values[tvMailIcon.Index] = 0) then
    AStyle := UnreadStyle;
end;

procedure TOffice11GroupRowStyleDemoMainForm.miOffice11GroupRowStyleClick(Sender: TObject);
begin
  with tvMail.OptionsView do
    if GroupRowStyle = grsStandard then
      GroupRowStyle := grsOffice11
    else
      GroupRowStyle := grsStandard;
  UpdateMenu;
end;

procedure TOffice11GroupRowStyleDemoMainForm.miGroupBySortingClick(Sender: TObject);
begin
  with tvMail.OptionsCustomize do
    GroupBySorting := not GroupBySorting;
  UpdateMenu;  
end;

procedure TOffice11GroupRowStyleDemoMainForm.miAlwaysExpandedGroupsClick(Sender: TObject);
begin
  with tvMail.DataController do
    if dcoGroupsAlwaysExpanded in Options then
      Options := Options - [dcoGroupsAlwaysExpanded]
    else
      Options := Options + [dcoGroupsAlwaysExpanded];
  UpdateMenu;
end;

procedure TOffice11GroupRowStyleDemoMainForm.miDateTimeGroupingClick(Sender: TObject);
begin
  tvMail.DateTimeHandling.Grouping := TcxGridDateTimeGrouping(1 + TMenuItem(Sender).MenuIndex);
  UpdateMenu;
end;

end.
