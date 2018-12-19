unit uDataSourceDemo;

interface

uses SysUtils, Classes, HTTPApp, cxWebModule, cxWebAppSrv, DBTables, DB,
  cxWebData, cxWebExtData, cxWebControls, cxWebStdCtrls, cxWebGrids,
  cxWebDataCtrls, cxWebClasses, cxWebDataNavigator, cxWebDBGrid, ADODB;
  

type
  TDataSourceDemo = class(TcxWebPageModule)
    dsExtended: TcxWebDBDataSource;
    dsStandard: TcxStdWebDataSource;
    cbType: TcxWebComboBox;
    cxWebDBGrid1: TcxWebDBGrid;
    cxWebPanel1: TcxWebPanel;
    cbDataSet: TcxWebComboBox;
    wbApplyChanges: TcxWebButton;
    wbCancelCanges: TcxWebButton;
    cxWebLabel1: TcxWebLabel;
    cxWebLabel2: TcxWebLabel;
    cbLoadAllRecords: TcxWebCheckBox;
    cbAllowEditing: TcxWebCheckBox;
    cbAllowSorting: TcxWebCheckBox;
    cbAllowGrouping: TcxWebCheckBox;
    cbAllowExpanding: TcxWebCheckBox;
    cxWebDBDataNavigator1: TcxWebDBDataNavigator;
    dsUnbound: TcxWebDataSource;
    cxWebLabel3: TcxWebLabel;
    scCommon: TcxWebStyleController;
    stHeader1: TcxWebStyleItem;
    stHeader2: TcxWebStyleItem;
    stPanel: TcxWebStyleItem;
    stButtonDef: TcxWebStyleItem;
    stButtonHover: TcxWebStyleItem;
    stEditorDef: TcxWebStyleItem;
    stEditorHover: TcxWebStyleItem;
    stLabelDef: TcxWebStyleItem;
    stLabelHover: TcxWebStyleItem;
    stTips: TcxWebStyleItem;
    stLine1: TcxWebStyleItem;
    stLine2: TcxWebStyleItem;
    wbLoad: TcxWebButton;
    wbSave: TcxWebButton;
    ADOTable1: TADOTable;
    wbFirst: TcxWebButton;
    wbPrevPage: TcxWebButton;
    wbPrev: TcxWebButton;
    wbNext: TcxWebButton;
    wbNextPage: TcxWebButton;
    wbLast: TcxWebButton;
    wbInsert: TcxWebButton;
    wbEdit: TcxWebButton;
    wbDelete: TcxWebButton;
    wbPost: TcxWebButton;
    wbCancel: TcxWebButton;
    wbRefresh: TcxWebButton;
    ADOTable1Name: TWideStringField;
    ADOTable1Capital: TWideStringField;
    ADOTable1Continent: TWideStringField;
    ADOTable1Area: TFloatField;
    ADOTable1Population: TFloatField;
    cxWebDBGrid1Column1: TcxWebDBColumn;
    cxWebDBGrid1Column2: TcxWebDBColumn;
    cxWebDBGrid1Column3: TcxWebDBColumn;
    cxWebDBGrid1Column4: TcxWebDBColumn;
    cxWebDBGrid1Column5: TcxWebDBColumn;
    Table1: TTable;
    Table1Name: TStringField;
    Table1Capital: TStringField;
    Table1Continent: TStringField;
    Table1Area: TFloatField;
    Table1Population: TFloatField;
    procedure cbTypeChange(Sender: TObject);
    procedure wbApplyChangesClick(Sender: TObject);
    procedure wbCancelCangesClick(Sender: TObject);
    procedure wbLoadClick(Sender: TObject);
    procedure wbSaveClick(Sender: TObject);
    procedure cxWebPageModuleActivate(Sender: TObject);
    procedure cxWebPageModuleDeactivate(Sender: TObject);
    procedure wbFirstClick(Sender: TObject);
    procedure wbPrevPageClick(Sender: TObject);
    procedure wbPrevClick(Sender: TObject);
    procedure wbNextClick(Sender: TObject);
    procedure wbNextPageClick(Sender: TObject);
    procedure wbLastClick(Sender: TObject);
    procedure wbInsertClick(Sender: TObject);
    procedure wbEditClick(Sender: TObject);
    procedure wbDeleteClick(Sender: TObject);
    procedure wbPostClick(Sender: TObject);
    procedure wbCancelClick(Sender: TObject);
    procedure wbRefreshClick(Sender: TObject);
  private
    procedure GetProperties;
    procedure SetProperties;
  public
    function CurrentDataSource: TcxCustomWebDataSource;
  end;

function DataSourceDemo: TDataSourceDemo;

implementation

{$R *.DFM} {*.html}

uses
  WebReq, WebCntxt, cxWebModFact, Variants, cxWebUtils, ActiveX;

function DataSourceDemo: TDataSourceDemo;
begin
  Result := TDataSourceDemo(WebContext.FindModuleClass(TDataSourceDemo));
end;

procedure TDataSourceDemo.GetProperties;
var
  DataSet: TDataSet;
  DataSource: TcxCustomWebDataSource;
begin
  case cbType.ItemIndex of
    0: begin
         DataSet := dsExtended.DataSet;
         DataSource := dsExtended;
       end;
    1: begin
         DataSet := dsStandard.DataSet;
         DataSource := dsStandard;
       end;
    2: begin
         DataSet := nil;
         DataSource := dsUnbound;
       end;
  else
    DataSet := nil;
    DataSource := nil;
  end;

  if DataSet = ADOTable1 then
  begin
    cbDataSet.Enabled := True;
    cbDataSet.ItemIndex := 0
  end
  else if DataSet = Table1 then
  begin
    cbDataSet.Enabled := True;
    cbDataSet.ItemIndex := 1
  end
  else
  begin
    cbDataSet.ItemIndex := -1;
    cbDataSet.Enabled := False;
  end;

  if DataSource <> nil then
  begin
    cbLoadAllRecords.Checked := DataSource.LoadAllRecords;
    cbAllowEditing.Checked := DataSource.AllowEditing;
    cbAllowSorting.Checked := DataSource.AllowSorting;
    cbAllowGrouping.Checked := DataSource.AllowGrouping;
    cbAllowExpanding.Checked := DataSource.AllowExpanding;
  end;
end;

procedure TDataSourceDemo.SetProperties;
var
  DataSet: TDataSet;
begin
  case cbDataSet.ItemIndex of
    0: DataSet := ADOTable1;
    1: DataSet := Table1;
  else
    DataSet := nil;
  end;

  case cbType.ItemIndex of
    0: begin
         dsExtended.DataSet := DataSet;
         dsExtended.LoadAllRecords := cbLoadAllRecords.Checked;
         dsExtended.AllowEditing := cbAllowEditing.Checked;
         dsExtended.AllowSorting := cbAllowSorting.Checked;
         dsExtended.AllowGrouping := cbAllowGrouping.Checked;
         dsExtended.AllowExpanding := cbAllowExpanding.Checked;
       end;
    1: begin
         dsStandard.DataSet := DataSet;
         dsStandard.LoadAllRecords := cbLoadAllRecords.Checked;
         dsStandard.AllowEditing := cbAllowEditing.Checked;
       end;
    2: begin
         dsUnbound.LoadAllRecords := cbLoadAllRecords.Checked;
         dsUnbound.AllowEditing := cbAllowEditing.Checked;
         dsUnbound.AllowSorting := cbAllowSorting.Checked;
         dsUnbound.AllowGrouping := cbAllowGrouping.Checked;
         dsUnbound.AllowExpanding := cbAllowExpanding.Checked;
       end;
  else
  end;
  cxWebDBGrid1.CreateDefaultColumns(True);
  cxWebDBGrid1.Width := 750;
  GetProperties;
end;

function TDataSourceDemo.CurrentDataSource: TcxCustomWebDataSource;
begin
  case cbType.ItemIndex of
    0: Result := dsExtended;
    1: Result := dsStandard;
    2: Result := dsUnbound
  else
    Result := nil;
  end;
end;

procedure TDataSourceDemo.cbTypeChange(Sender: TObject);
var
  Stream: TStream;
begin
  case cbType.ItemIndex of
    0: begin
         cxWebDBGrid1.DataBinding.DataSource := dsExtended;
         cxWebDBDataNavigator1.DataBinding.DataSource := dsExtended;
         cxWebDBGrid1.CreateDefaultColumns(True);
         cxWebDBGrid1.Width := 750;
         cbAllowSorting.Enabled := True;
         cbAllowGrouping.Enabled := True;
         cbAllowExpanding.Enabled := True;
         wbLoad.Enabled := False;
         wbSave.Enabled := False;
       end;
    1: begin
         cxWebDBGrid1.DataBinding.DataSource := dsStandard;
         cxWebDBDataNavigator1.DataBinding.DataSource := dsStandard;
         cxWebDBGrid1.CreateDefaultColumns(True);
         cxWebDBGrid1.Width := 750;
         cbAllowSorting.Enabled := False;
         cbAllowGrouping.Enabled := False;
         cbAllowExpanding.Enabled := False;
         wbLoad.Enabled := False;
         wbSave.Enabled := False;
       end;
    2: begin
         Stream := TFileStream.Create(QualifyFileName('products.dat'), fmOpenRead);
         try
           dsUnbound.LoadFromStream(Stream);
         finally
           Stream.Free;
         end;

         cxWebDBGrid1.DataBinding.DataSource := dsUnbound;
         cxWebDBDataNavigator1.DataBinding.DataSource := dsUnbound;
         cxWebDBGrid1.CreateDefaultColumns(True);
         cxWebDBGrid1.Width := 750;
         cbAllowSorting.Enabled := True;
         cbAllowGrouping.Enabled := True;
         cbAllowExpanding.Enabled := True;
         wbLoad.Enabled := True;
         wbSave.Enabled := True;
       end;
  else
    cxWebDBGrid1.DataBinding.DataSource := nil;
    cxWebDBDataNavigator1.DataBinding.DataSource := nil;
    cxWebDBGrid1.Clear;
    cbAllowSorting.Enabled := False;
    cbAllowGrouping.Enabled := False;
    cbAllowExpanding.Enabled := False;
    wbLoad.Enabled := False;
    wbSave.Enabled := False;
  end;
  GetProperties;
end;

procedure TDataSourceDemo.wbApplyChangesClick(Sender: TObject);
begin
  SetProperties;
  GetProperties;
end;

procedure TDataSourceDemo.wbCancelCangesClick(Sender: TObject);
begin
  GetProperties;
end;

procedure TDataSourceDemo.wbLoadClick(Sender: TObject);
var
  Stream: TStream;
begin
  Stream := TFileStream.Create(QualifyFileName('products.dat'), fmOpenRead);
  try
    dsUnbound.LoadFromStream(Stream);
  finally
    Stream.Free;
  end;
end;

procedure TDataSourceDemo.wbSaveClick(Sender: TObject);
var
  Stream: TStream;
begin
  Stream := TFileStream.Create(QualifyFileName('products.dat'), fmOpenWrite, fmShareExclusive);
  try
    dsUnbound.SaveToStream(Stream);
  finally
    Stream.Free;
  end;
end;

procedure TDataSourceDemo.cxWebPageModuleActivate(Sender: TObject);
begin
  ADOTable1.ConnectionString := 'FILE NAME=' + DataLinkDir + '\DBDEMOS.UDL';
  ADOTable1.Open;
end;

procedure TDataSourceDemo.cxWebPageModuleDeactivate(Sender: TObject);
begin
  ADOTable1.Close;
end;

procedure TDataSourceDemo.wbFirstClick(Sender: TObject);
begin
  if CurrentDataSource <> nil then
    CurrentDataSource.FocusedRowIndex := 0;
end;

procedure TDataSourceDemo.wbPrevPageClick(Sender: TObject);
begin
  if CurrentDataSource <> nil then
    CurrentDataSource.FocusedRowIndex := CurrentDataSource.FocusedRowIndex - 5;
end;

procedure TDataSourceDemo.wbPrevClick(Sender: TObject);
begin
  if CurrentDataSource <> nil then
    CurrentDataSource.FocusedRowIndex := CurrentDataSource.FocusedRowIndex - 1;
end;

procedure TDataSourceDemo.wbNextClick(Sender: TObject);
begin
  if CurrentDataSource <> nil then
    CurrentDataSource.FocusedRowIndex := CurrentDataSource.FocusedRowIndex + 1;
end;

procedure TDataSourceDemo.wbNextPageClick(Sender: TObject);
begin
  if CurrentDataSource <> nil then
    CurrentDataSource.FocusedRowIndex := CurrentDataSource.FocusedRowIndex + 5;
end;

procedure TDataSourceDemo.wbLastClick(Sender: TObject);
begin
  if CurrentDataSource <> nil then
    CurrentDataSource.FocusedRowIndex := CurrentDataSource.RowCount - 1;
end;

procedure TDataSourceDemo.wbInsertClick(Sender: TObject);
begin
  if CurrentDataSource <> nil then
    CurrentDataSource.InsertRecord(CurrentDataSource.FocusedRowIndex);
end;

procedure TDataSourceDemo.wbEditClick(Sender: TObject);
begin
  if CurrentDataSource <> nil then
    CurrentDataSource.EditRecord(CurrentDataSource.FocusedRowIndex);
end;

procedure TDataSourceDemo.wbDeleteClick(Sender: TObject);
begin
  if CurrentDataSource <> nil then
    CurrentDataSource.DeleteRecord(CurrentDataSource.FocusedRowIndex);
end;

procedure TDataSourceDemo.wbPostClick(Sender: TObject);
begin
  if CurrentDataSource <> nil then
    CurrentDataSource.PostEdit('');
end;

procedure TDataSourceDemo.wbCancelClick(Sender: TObject);
begin
  if CurrentDataSource <> nil then
    CurrentDataSource.CancelEdit;
end;

procedure TDataSourceDemo.wbRefreshClick(Sender: TObject);
begin
  if CurrentDataSource <> nil then
    CurrentDataSource.Refresh;
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebPageModuleFactory.Create(TDataSourceDemo, TcxWebPageInfo.Create('*.html'),  caDestroy));

end.
