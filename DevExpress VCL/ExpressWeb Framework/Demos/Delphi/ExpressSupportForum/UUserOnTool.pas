unit UUserOnTool;

interface

uses Classes, DBPersistent;

type

  TUserOnTool = class(TDBPersistent)
  private
    function GetUserId: Integer;
    procedure SetUserId(const Value: Integer);
    function GetId: Integer;
    function GetToolId: Integer;
    procedure SetId(const Value: Integer);
    procedure SetToolId(const Value: Integer);
    function GetMaxId: Integer;
  protected
    function GetFieldsCount: Integer; override;
    function GetFilter: string; override;
    function GetTableName: string; override;
  public
    constructor Create; override;
    destructor Destroy; override;

    function NewUserOnTool: Integer;

    property UserId: Integer read GetUserId write SetUserId;
    property ToolId: Integer read GetToolId write SetToolId;
    property Id: Integer read GetId write SetId;
    property MaxId: Integer read GetMaxId;
  end;

implementation

{ TUserOnTool }

const
  FieldNames: array[0..2] of string = ('PKID', 'USERID', 'TOOLID');

constructor TUserOnTool.Create;
begin
  inherited;

  InitItems(FieldNames);
end;

destructor TUserOnTool.Destroy;
begin

  inherited;
end;

function TUserOnTool.GetFieldsCount: Integer;
begin
  Result := High(FieldNames) - Low(FieldNames) + 1;
end;

function TUserOnTool.GetFilter: string;
begin
  Result := '';
end;

function TUserOnTool.GetId: Integer;
begin
  Result := Value['PKID'];
end;

function TUserOnTool.GetMaxId: Integer;
begin
  Result := MaxInt('PKID');
end;

function TUserOnTool.GetTableName: string;
begin
  Result := 'USERONTOOL';
end;

function TUserOnTool.GetToolId: Integer;
begin
  Result := Value['TOOLID'];
end;

function TUserOnTool.GetUserId: Integer;
begin
  Result := Value['USERID'];
end;

function TUserOnTool.NewUserOnTool: Integer;
begin
  Result := New;
end;

procedure TUserOnTool.SetId(const Value: Integer);
begin
  ChangeItem('PKID', Value);
end;

procedure TUserOnTool.SetToolId(const Value: Integer);
begin
  ChangeItem('TOOLID', Value);
end;

procedure TUserOnTool.SetUserId(const Value: Integer);
begin
  ChangeItem('USERID', Value);
end;

end.
