unit UTools;

interface

uses Classes, DBPersistent;

type

  TTools = class(TDBPersistent)
  private
    FilterValue: string;
    function GetId: Integer;
    function GetName: string;
    procedure SetId(const Value: Integer);
    procedure SetName(const Value: string);
    function GetMaxId: Integer;
  protected
    function GetFieldsCount: Integer; override;
    function GetFilter: string; override;
    function GetTableName: string; override;
  public
    constructor Create; override;
    destructor Destroy; override;

    function NewTool: Integer;

    property Id: Integer read GetId write SetId;
    property Name: string read GetName write SetName;
    property MaxId: Integer read GetMaxId;
  end;

implementation

{ TTools }

const
  FieldNames: array[0..1] of string = ('TOOLID', 'NAME');

constructor TTools.Create;
begin
  inherited;

  InitItems(FieldNames);
end;

destructor TTools.Destroy;
begin

  inherited;
end;

function TTools.GetFieldsCount: Integer;
begin
  Result := High(FieldNames) - Low(FieldNames) + 1;
end;

function TTools.GetFilter: string;
begin
  Result := FilterValue;
end;

function TTools.GetId: Integer;
begin
  Result := Value['TOOLID'];
end;

function TTools.GetMaxId: Integer;
begin
  Result := MaxInt('TOOLID');
end;

function TTools.GetName: string;
begin
  Result := Value['TOOLID'];
end;

function TTools.GetTableName: string;
begin
  Result := 'TOOLS';
end;

function TTools.NewTool: Integer;
begin
  Result := New;
end;

procedure TTools.SetId(const Value: Integer);
begin
  ChangeItem('TOOLID', Value);
end;

procedure TTools.SetName(const Value: string);
begin
  ChangeItem('NAME', Value);
end;

end.
 
