unit IssueListData;

interface

uses
  SysUtils, Classes, DB, Controls, ImgList, Forms,
  cxDBEditRepository, cxStyles, cxEdit, cxClasses, cxGridTableView,
  cxGridBandedTableView, cxLookAndFeels, cxContainer, cxEditRepositoryItems, DBTables;

type
  TdmMain = class(TDataModule)
    Database: TDatabase;
    tblUsers: TTable;
    dsUsers: TDataSource;
    tblUsersID: TAutoIncField;
    tblUsersFNAME: TStringField;
    tblUsersMNAME: TStringField;
    tblUsersLNAME: TStringField;
    tblUsersEMAIL: TStringField;
    tblUsersPHONE: TStringField;
    tblUsersDEPARTMENTID: TIntegerField;
    tblDepartments: TTable;
    dsDepartment: TDataSource;
    tblItems: TTable;
    dsItems: TDataSource;
    tblProjects: TTable;
    dsProjects: TDataSource;
    tblTeams: TTable;
    dsTeams: TDataSource;
    tblDepartmentsID: TAutoIncField;
    tblDepartmentsNAME: TStringField;
    tblItemsID: TAutoIncField;
    tblItemsNAME: TStringField;
    tblItemsTYPE: TBooleanField;
    tblItemsPROJECTID: TIntegerField;
    tblItemsPRIORITY: TSmallintField;
    tblItemsSTATUS: TSmallintField;
    tblItemsCREATORID: TIntegerField;
    tblItemsCREATEDDATE: TDateTimeField;
    tblItemsOWNERID: TIntegerField;
    tblItemsLASTMODIFIEDDATE: TDateTimeField;
    tblItemsFIXEDDATE: TDateTimeField;
    tblItemsDESCRIPTION: TMemoField;
    tblItemsRESOLUTION: TMemoField;
    tblProjectsID: TAutoIncField;
    tblProjectsNAME: TStringField;
    tblProjectsMANAGERID: TIntegerField;
    tblTeamsID: TAutoIncField;
    tblTeamsPROJECTID: TIntegerField;
    tblTeamsUSERID: TIntegerField;
    tblTeamsFUNCTION: TStringField;
    imStat: TImageList;
    ilMain: TImageList;
    tblUsersDepartmentName: TStringField;
    tblUsersFullName: TStringField;
    edrepMain: TcxEditRepository;
    edrepUserLookup: TcxEditRepositoryLookupComboBoxItem;
    strepMain: TcxStyleRepository;
    stFixed: TcxStyle;
    stRejected: TcxStyle;
    stNew: TcxStyle;
    stPostponed: TcxStyle;
    stPreview: TcxStyle;
    ssTableStyles: TcxGridTableViewStyleSheet;
    stLightYellow: TcxStyle;
    stSelected: TcxStyle;
    tblSchedule: TTable;
    dsSchedule: TDataSource;
    tblScheduleID: TAutoIncField;
    tblSchedulePROJECTID: TIntegerField;
    tblScheduleUSERID: TIntegerField;
    tblScheduleSUNDAY: TSmallintField;
    tblScheduleMONDAY: TSmallintField;
    tblScheduleTUESDAY: TSmallintField;
    tblScheduleWEDNESDAY: TSmallintField;
    tblScheduleTHURSDAY: TSmallintField;
    tblScheduleFRIDAY: TSmallintField;
    tblScheduleSATURDAY: TSmallintField;
    edrepUserFullName: TcxEditRepositoryLookupComboBoxItem;
    edrepDepartmentName: TcxEditRepositoryLookupComboBoxItem;
    edrepProjectName: TcxEditRepositoryLookupComboBoxItem;
    tblScheduleRowSum: TFloatField;
    tblScheduleRowAvg: TFloatField;
    edstcMain: TcxEditStyleController;
    edrepItemStatus: TcxEditRepositoryImageComboBoxItem;
    edrepItemType: TcxEditRepositoryImageComboBoxItem;
    edrepItemPriority: TcxEditRepositoryImageComboBoxItem;
    stLightBlue: TcxStyle;
    stGold: TcxStyle;
    stBlue: TcxStyle;
    procedure DataModuleCreate(Sender: TObject);
    procedure tblUsersCalcFields(DataSet: TDataSet);
    procedure tblScheduleCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmMain: TdmMain;
//  procedure PopulateStyleSheetsList(const AList: TList);

implementation

{$R *.dfm}

uses
  DemoUtils;

procedure TdmMain.DataModuleCreate(Sender: TObject);
var
  I: Integer;
begin
  DataBase.Connected := True;
  for I := 0 to ComponentCount -1 do
  begin
    if Components[I] is TTable then
      TTable(Components[I]).Open;
  end;
end;

procedure TdmMain.tblUsersCalcFields(DataSet: TDataSet);
begin
  with DataSet do
    SetStringFieldValue(tblUsersFullName, Format('%s %s %s', [tblUsersFName.AsString,
      tblUsersMName.AsString, tblUsersLName.AsString]));
end;

procedure TdmMain.tblScheduleCalcFields(DataSet: TDataSet);
begin
 with DataSet do
 begin
  tblScheduleRowSum.AsFloat := tblScheduleSUNDAY.AsFloat + tblScheduleMONDAY.AsFloat +
    tblScheduleTUESDAY.AsFloat + tblScheduleWEDNESDAY.AsFloat +
    tblScheduleTHURSDAY.AsFloat + tblScheduleFRIDAY.AsFloat +
    tblScheduleSATURDAY.AsFloat;
  tblScheduleRowAvg.AsString := FormatFloat('0.00', tblScheduleRowSum.AsFloat / 7);
 end;
end;

{procedure PopulateStyleSheetsList(const AList: TList);
var
 I: Integer;
begin
  if AList <> nil then
  begin
    AList.Clear;
    with dmMain.strepUserDefined do
     for I:= 0 to StyleSheetCount - 1 do
        AList.Add(StyleSheets[I]);
  end;
end;
 }

end.
