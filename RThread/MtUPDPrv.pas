unit MtUPDPrv;


interface

uses Windows, {$IFDEF VER150} Variants,{$ENDIF} SysUtils, Classes, DbClient, DB, DsIntf, ActiveX, Midas, Provider, ADODB;

type
  THackUpdateTree = class(TUpdateTree)
    property Delta;
  end;

  TSQLUpdateDSProvider = class(TDataSetProvider)
  private
    FSQLText: array[TUpdateKind] of TStrings;
    
    function GetSQLIndex(Index: Integer): TStrings;
    procedure SetSQL(UpdateKind: TUpdateKind; Value: TStrings);
    procedure SetSQLIndex(Index: Integer; Value: TStrings);
    procedure SQLChanged(Sender: TObject);
  protected
    function CreateResolver: TCustomResolver; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property ModifySQL: TStrings index 0 read GetSQLIndex write SetSQLIndex;
    property InsertSQL: TStrings index 1 read GetSQLIndex write SetSQLIndex;
    property DeleteSQL: TStrings index 2 read GetSQLIndex write SetSQLIndex;
  
  end;

  TSQLUpdResolver = class(TSQLResolver)
  private
    FParams: TParams;
    FCmd: TADOCommand;
    procedure InternalDoUpdate(Tree: TUpdateTree; UpdateKind: TUpdateKind);

    function MakeSQLParams(Tree: TUpdateTree; SQLText: String) : boolean;
    procedure DoExecSQL(SQLText: String; Params: TParams); reintroduce;
    function GetCmd: TADOCommand;
  protected
    procedure DoUpdate(Tree: TUpdateTree); override;
    procedure DoDelete(Tree: TUpdateTree); override;
    procedure DoInsert(Tree: TUpdateTree); override;
  public
    constructor Create(AProvider: TSQLUpdateDSProvider); reintroduce;
    destructor Destroy; override;
  end;
  
procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Karaim compz', [TSQLUpdateDSProvider]);
end;

{ TSQLUpdateDSProvider }

constructor TSQLUpdateDSProvider.Create(AOwner: TComponent);
var
  UpdateKind: TUpdateKind;
begin
  inherited Create(AOwner);
  for UpdateKind := Low(TUpdateKind) to High(TUpdateKind) do
  begin
    FSQLText[UpdateKind] := TStringList.Create;
    TStringList(FSQLText[UpdateKind]).OnChange := SQLChanged;
  end;
end;

destructor TSQLUpdateDSProvider.Destroy;
var
  UpdateKind: TUpdateKind;
begin
  for UpdateKind := Low(TUpdateKind) to High(TUpdateKind) do
    FSQLText[UpdateKind].Free;
  inherited Destroy;
end;

function TSQLUpdateDSProvider.CreateResolver: TCustomResolver;
begin
  if ResolveToDataSet then
    Result := TDataSetResolver.Create(Self)
  else
    Result := TSQLUpdResolver.Create(Self);
end;


function TSQLUpdateDSProvider.GetSQLIndex(Index: Integer): TStrings;
begin
  Result := FSQLText[TUpdateKind(Index)];
end;

procedure TSQLUpdateDSProvider.SetSQL(UpdateKind: TUpdateKind;
  Value: TStrings);
begin
  FSQLText[UpdateKind].Assign(Value);
end;

procedure TSQLUpdateDSProvider.SetSQLIndex(Index: Integer;
  Value: TStrings);
begin
  SetSQL(TUpdateKind(Index), Value);
end;

procedure TSQLUpdateDSProvider.SQLChanged(Sender: TObject);
begin

end;

{ TSQLUpdResolver }

constructor TSQLUpdResolver.Create(AProvider: TSQLUpdateDSProvider);
begin
  inherited Create(AProvider);
//  FSQL := TStringList.Create;
  FParams := TParams.Create(nil);
end;


destructor TSQLUpdResolver.Destroy;
begin
//  FSQL.Free;
  FParams.Free;
  if FCmd <> nil then
    FCmd.Free;
  inherited Destroy;
end;

procedure TSQLUpdResolver.DoDelete(Tree: TUpdateTree);
begin
  if Trim(TSQLUpdateDSProvider(Provider).DeleteSQL.Text) = '' then
    inherited DoDelete(Tree)
  else
    InternalDoUpdate(Tree, ukDelete);
end;

procedure TSQLUpdResolver.DoInsert(Tree: TUpdateTree);
begin
  if Trim(TSQLUpdateDSProvider(Provider).InsertSQL.Text) = '' then
    inherited DoInsert(Tree)
  else
    InternalDoUpdate(Tree, ukInsert);
end;

procedure TSQLUpdResolver.DoUpdate(Tree: TUpdateTree);
begin
  if Trim(TSQLUpdateDSProvider(Provider).ModifySQL.Text) = '' then
    inherited DoUpdate(Tree)
  else
    InternalDoUpdate(Tree, ukModify);
end;

procedure TSQLUpdResolver.DoExecSQL(SQLText: String; Params: TParams);
var
  I: Integer;
  RS: _RecordSet;
  Cmd: TADOCommand;
begin
  try
    Cmd := GetCmd;
    try  
      Cmd.Connection := TCustomADODataSet(Provider.DataSet).Connection;
      Cmd.CommandText := SQLText;
//      Cmd.Parameters.ParseSQL(SQL.Text, true);
      
      try
        if (Cmd.Parameters.Count = Params.Count) then
          for I := 0 to Params.Count - 1 do
          begin
            if Cmd.Parameters[I].DataType <> Params[I].DataType then
              Cmd.Parameters[I].DataType := Params[I].DataType;
            Cmd.Parameters[I].Value := Params[I].Value;
          end
        else
          Cmd.Parameters.Assign(Params);
      except
        Cmd.Parameters.Assign(Params);
      end;

      Cmd.ExecuteOptions := [eoExecuteNoRecords];
      Cmd.Execute;
    finally
    end;
  finally
  end;
end;

procedure TSQLUpdResolver.InternalDoUpdate(Tree: TUpdateTree;
  UpdateKind: TUpdateKind);
var
  S: string;
begin
  case UpdateKind of
    ukModify: S := TSQLUpdateDSProvider(Provider).ModifySQL.Text;
    ukInsert: S := TSQLUpdateDSProvider(Provider).InsertSQL.Text;
    ukDelete: S := TSQLUpdateDSProvider(Provider).DeleteSQL.Text;
  end;

  if MakeSQLParams(Tree, S) then
    DoExecSQL(S, FParams);
end;

function TSQLUpdResolver.MakeSQLParams(Tree: TUpdateTree; SQLText: String) : boolean;
var i : integer;
    Old: Boolean;
    Param: TParam;
    PName, StrName: string;
    Field: TField;
    Value: Variant;
begin
  Result := false;
  FParams.Clear;
  FParams.ParseSQL(SQLText, true);

  for I := 0 to FParams.Count - 1 do
  begin
    Param := FParams[I];
    StrName := Param.Name;
    PName := StrName;
    Old := CompareText(Copy(PName, 1, 4), 'OLD_') = 0;
    if Old then System.Delete(PName, 1, 4);

    Field := THackUpdateTree(Tree).Delta.FindField(PName);
    
    if not Assigned(Field) then
    begin
      raise Exception.Create('Ќе нейдено поле ' + PName + ' сответствующее параметру ' + StrName);
//      Continue;
    end;
    if Old then
      Param.AssignFieldValue(Field, Field.OldValue)
    else
    begin
      Value := Field.NewValue;
      if VarIsEmpty(Value) then
        Value := Field.OldValue;
      Param.AssignFieldValue(Field, Value);
    end;
  end; 
  Result := true;
end;

function TSQLUpdResolver.GetCmd: TADOCommand;
begin
  if FCmd = nil then
    FCmd := TADOCommand.Create(Owner);
  Result := FCmd;
end;

end.
