unit DBPersistent;

interface

uses Classes, SysUtils, ADODB, Variants, Contnrs, UDataField, UUtil;

type

  TDBPersistent = class
  private
    FConnection: TADOConnection;
    FPersistentItems: TObjectList;
    FCurrentRow: Integer;
    FFieldsInfo: array of TFieldInfo;
    FSelectExtension: string;

    function DeleteBuilder: string;
    function FindItem(AName: string): TDataField;
    procedure FillParameters(AQuery: TADOQuery);
    function GetConnection: TADOConnection;
    function GetName(AIndex: Integer): string;
    function GetValue(AName: string): Variant;
    function InsertBuilder: string;
    function SaveDataFromQuery(AQuery: TADOQuery): Integer;
    function SelectBuilder: string;
    function UpdateBuilder: string;
  protected
    procedure AddItem(AName: string; AValue: Variant);
    procedure ChangeItem(AName: string; AValue: Variant);

    procedure InitItems(ANames: array of string); overload;
    procedure InitItems(AFieldsInitInfo: array of TFieldInitInfo); overload;

    procedure ClearAll;
    procedure ClearFieldsInfo;

    function Delete: Integer;
    function GetFieldsCount: Integer;  virtual; abstract;
    function GetFilter: string; virtual; abstract;
    function GetTableName: string; virtual; abstract;

    function New: Integer;
    function Restore: Integer;
    function Save: Integer;
    function MaxInt(AName: string): Integer;

    property FieldsCount: Integer read GetFieldsCount;
    property Filter: string read GetFilter;
    property Value[AName: string]: Variant read GetValue;
    property Name[AIndex: Integer]: string read GetName;
    property TableName: string read GetTableName;
  public
    constructor Create; virtual;
    destructor Destroy; override;

    property Connection: TADOConnection read GetConnection write FConnection;
    property CurrentRow: Integer read FCurrentRow write FCurrentRow default 0;
    property SelectExtension: string read FSelectExtension write FSelectExtension;
    procedure NewRow;
  end;

implementation

const
  AFieldsDivider = ', ';

{ TDBPersistent }
constructor TDBPersistent.Create;
begin
  FPersistentItems := TObjectList.Create(True);
end;

destructor TDBPersistent.Destroy;
begin
  Save;
  ClearFieldsInfo;
  ClearAll;
  FreeAndNil(FPersistentItems);
  inherited Destroy;
end;

procedure TDBPersistent.AddItem(AName: string; AValue: Variant);
var
  DataField: TDataField;
begin
//  DataField := FindItem(AName);
//  if not Assigned(DataField) then
//  begin
    DataField := TDataField.Create;
    DataField.Name := AName;
//  end;
  DataField.OldValue := AValue;
  DataField.FieldValue := AValue;
  FPersistentItems.Add(DataField);
end;

procedure TDBPersistent.ChangeItem(AName: string; AValue: Variant);
var
  DataField: TDataField;
begin
  DataField := FindItem(AName);
  if DataField <> nil then
    DataField.FieldValue := AValue
  else
    raise Exception.CreateFmt('%s FieldName is Invalid!', [AName]);
end;

function TDBPersistent.FindItem(AName: string): TDataField;
var
  I: Integer;
begin
  if CurrentRow = 0 then
    raise Exception.CreateFmt('Data Row Is Empty!', []);

  Result := nil;
  for I := (CurrentRow - 1) * FieldsCount to (CurrentRow) * FieldsCount - 1 do
    if CompareText(TDataField(FPersistentItems[I]).Name, AName) = 0 then
    begin
      Result := TDataField(FPersistentItems[I]);
      break;
    end;
end;

function TDBPersistent.GetValue(AName: string): Variant;
var
  DataField: TDataField;
begin
  DataField := FindItem(AName);
  if DataField <> nil then
    Result := DataField.FieldValue
  else
    raise Exception.CreateFmt('%s FieldName is Invalid!', [AName]);
end;

procedure TDBPersistent.InitItems(ANames: array of string);
var
  I, J: Integer;
  ASize: Integer;
begin
  ASize := High(ANames) - Low(ANames) + 1;
  SetLength(FFieldsInfo, ASize);
  J := 0;
  for I := Low(ANames) to High(ANames) do
  begin
    FFieldsInfo[J].FieldName := ANames[I];
    FFieldsInfo[J].FieldRest := nil;
    Inc(J);
  end;
end;

function TDBPersistent.Restore: Integer;
var
  ASelectQuery: TADOQuery;
begin
  ASelectQuery := TADOQuery.Create(nil);
  try
    ASelectQuery.CursorLocation := clUseClient;
    ASelectQuery.CursorType := ctStatic;
    ASelectQuery.LockType := ltReadOnly;
    ASelectQuery.Connection := Connection;
    ASelectQuery.SQL.Text := SelectBuilder;
    ASelectQuery.Open;
    Result := SaveDataFromQuery(ASelectQuery);
  finally
    ASelectQuery.Free;
  end;
  CurrentRow := 1;
end;

function TDBPersistent.SelectBuilder: string;
var
  SQL: string;
  I: Integer;
begin
  SQL := 'SELECT ';
  for I := 0 to FieldsCount - 1 do
    SQL := SQL + Name[I] + AFieldsDivider;
  SQL := Chop(SQL, Length(AFieldsDivider));
  if SelectExtension <> '' then
    SQL := SQL + SelectExtension;
  SQL := SQL + Format(' FROM %s %s', [TableName, Filter]);
  Result := SQL;
end;

function TDBPersistent.GetName(AIndex: Integer): string;
begin
//  Result := TDataField(FPersistentItems.Items[CurrentRow * AIndex]).Name;
  Result := FFieldsInfo[AIndex].FieldName;
end;

function TDBPersistent.GetConnection: TADOConnection;
begin
  if FConnection = nil then
    raise Exception.CreateFmt('Connection not Assigned!', []);
  Result := FConnection;
end;

function TDBPersistent.SaveDataFromQuery(AQuery: TADOQuery): Integer;
var
  I: Integer;
begin
  Result := AQuery.RecordCount;
  while not AQuery.Eof do
  begin
    for I := 0 to FieldsCount - 1 do
      AddItem(Name[I], AQuery.FieldByName(Name[I]).Value);
    AQuery.Next;
  end;
end;

function TDBPersistent.New: Integer;
var
  AInsertQuery: TADOQuery;
begin
  AInsertQuery := TADOQuery.Create(nil);
  try
    AInsertQuery.Connection := Connection;
    AInsertQuery.SQL.Text := InsertBuilder;
    FillParameters(AInsertQuery);
    Result := AInsertQuery.ExecSQL;
  finally
    AInsertQuery.Free;
  end;
end;

function TDBPersistent.InsertBuilder: string;
var
  SQL: string;
  S: string;
  I: Integer;
  ADataField: TDataField;
begin
  SQL := 'INSERT INTO ' + GetTableName + ' (';
  S := ') VALUES (';
  for I := 0 to FieldsCount - 1 do
  begin
    ADataField := FindItem(Name[I]);
    if ADataField.IsChange then
    begin
      SQL := SQL + '[' + Name[I] + ']'  + AFieldsDivider;
      S := S + ':' + Name[I] + AFieldsDivider;
      ADataField.OldValue := ADataField.FieldValue;
    end;
  end;
  SQL := Chop(SQL, Length(AFieldsDivider)) + Chop(S, Length(AFieldsDivider)) + ')';
  Result := SQL;
end;

procedure TDBPersistent.FillParameters(AQuery: TADOQuery);
var
  I: Integer;
begin
  for I := 0 to AQuery.Parameters.Count - 1 do
    AQuery.Parameters[I].Value := Value[AQuery.Parameters[I].Name];
end;

procedure TDBPersistent.NewRow;
var
  I: Integer;
begin
  for I := 0 to FieldsCount - 1 do
    AddItem(Name[I], Null);
  CurrentRow := CurrentRow + 1;
end;

procedure TDBPersistent.ClearAll;
begin
  FPersistentItems.Clear;
end;

function TDBPersistent.UpdateBuilder: string;
var
  SQL: string;
  I: Integer;
  ANeedUpdate: Boolean;
begin
  ANeedUpdate := False;
  if (FPersistentItems.Count <> 0) and (Filter <> '') then
  begin
    SQL := Format('UPDATE %s SET ', [TableName]);
    for I := 0 to FieldsCount - 1 do
    begin
      if TDataField(FPersistentItems[I]).IsChange then
      begin
        ANeedUpdate := True;
        SQL := SQL + Format('%s=:%s', [Name[I], Name[I]]) + AFieldsDivider;
      end;
    end;
  end;
  if ANeedUpdate then
    SQL := Chop(SQL, Length(AFieldsDivider)) + ' ' + Filter
  else
    SQL := '';
  UpdateBuilder := SQL;
end;

function TDBPersistent.Save: Integer;
var
  AUpdateQuery: TADOQuery;
  ASQL: string;
begin
  Result := 0;
  ASQL := UpdateBuilder;
  AUpdateQuery := TADOQuery.Create(nil);
  try
    if ASQL <> '' then
    begin
      AUpdateQuery.Connection := Connection;
      AUpdateQuery.SQL.Text := ASQL;
      FillParameters(AUpdateQuery);
      Result := AUpdateQuery.ExecSQL;
    end;
  finally
    AUpdateQuery.Free;
  end;
end;

function TDBPersistent.Delete: Integer;
var
  ADeleteQuery: TADOQuery;
begin
  ADeleteQuery := TADOQuery.Create(nil);
  try
    ADeleteQuery.Connection := Connection;
    ADeleteQuery.SQL.Text := DeleteBuilder;
    Result := ADeleteQuery.ExecSQL;
  finally
    ADeleteQuery.Free;
  end;
end;

function TDBPersistent.DeleteBuilder: string;
begin
  Result := Format('DELETE %s %s ', [TableName, Filter]);
end;

function TDBPersistent.MaxInt(AName: string): Integer;
var
  AMaxIntQuery: TADOQuery;
begin
  AMaxIntQuery := TADOQuery.Create(nil);
  try
    AMaxIntQuery.Connection := Connection;
    AMaxIntQuery.SQL.Text := Format('SELECT MAX(%s) as M FROM %s', [AName, TableName]);
    AMaxIntQuery.Open;
    Result := AMaxIntQuery.FieldByName('M').AsInteger;
  finally
    AMaxIntQuery.Free;
  end;
end;

procedure TDBPersistent.InitItems(AFieldsInitInfo: array of TFieldInitInfo);
var
  I, J: Integer;
  ASize: Integer;
begin
  ASize := High(AFieldsInitInfo) - Low(AFieldsInitInfo) + 1;
  SetLength(FFieldsInfo, ASize);
  J := 0;
  for I := Low(AFieldsInitInfo) to High(AFieldsInitInfo) do
  begin
    FFieldsInfo[J].FieldName := AFieldsInitInfo[I].FieldName;
    FFieldsInfo[J].FieldRest := TFieldValidator.Create;
    FFieldsInfo[J].FieldRest.Assign(AFieldsInitInfo[I].FieldRest);
    Inc(J);
  end;
end;

procedure TDBPersistent.ClearFieldsInfo;
var
  I: Integer;
begin
  for I := Low(FFieldsInfo) to High(FFieldsInfo) do
  begin
    if FFieldsInfo[I].FieldRest <> nil then
      FreeAndNil(FFieldsInfo[I].FieldRest);
  end;
end;
{
procedure TDBPersistent.AddConnection(APersistentItem: TDBPersistent;
  APrimary: string);
begin
  if FPersistentConnection = nil then
    FPersistentConnection := TDBPersistentConnection.Create;
  FPersistentConnection.PersistentItem := APersistentItem;
  FPersistentConnection.Primary := APrimary;
end;
}
end.

