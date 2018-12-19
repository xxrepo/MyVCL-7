unit UCategory;

interface

uses
  DBPersistent;

type
  TCategory = class(TDBPersistent)
  private
    FFilterValue: string;
    FCount: Integer;

    property FilterValue: string read FFilterValue write FFilterValue;
    function GetChildCount: Integer;
    function GetDate: TDateTime;
    function GetDescription: string;
    function GetId: Integer;
    function GetName: string;
    function GetParentId: Integer;
    procedure SetChildCount(const Value: Integer);
    procedure SetDate(const Value: TDateTime);
    procedure SetDescription(const Value: string);
    procedure SetId(const Value: Integer);
    procedure SetName(const Value: string);
    procedure SetParentId(const Value: Integer);
  protected

    function GetFieldsCount: Integer; override;
    function GetFilter: string; override;
    function GetTableName: string; override;
  public
    constructor Create; override;
    destructor Destroy; override;

    procedure RestoreForTree;
    function RestoreLast(AUserId: Integer): Integer;

    property Count: Integer read FCount write FCount;
    property Id: Integer read GetId write SetId;
    property ParentId: Integer read GetParentId write SetParentId;
    property Name: string read GetName write SetName;
    property Description: string read GetDescription write SetDescription;
    property ChildCount: Integer read GetChildCount write SetChildCount;
    property Date: TDateTime read GetDate write SetDate; 
  end;

implementation

uses
  SysUtils;

const
  FieldNames: array[0..5] of string = ('CATEGORYID', 'PARENTID', 'NAME', 'DESCRIPTION', 'CHILDCOUNT', 'DATE');
  FilterValues: array[1..2] of string = ('ORDER BY PARENTID, NAME',
      'a, USERVISIT b WHERE a.DATE >= b.BEFORE AND b.USERID = %d'
  );

constructor TCategory.Create;
begin
  inherited;
  InitItems(FieldNames);
end;

destructor TCategory.Destroy;
begin

  inherited;
end;

function TCategory.GetChildCount: Integer;
begin
  Result := Value['CHILDCOUNT'];
end;

function TCategory.GetDate: TDateTime;
begin
  Result := Value['DATE'];
end;

function TCategory.GetDescription: string;
begin
  Result := Value['DESCRIPTION'];
end;

function TCategory.GetFieldsCount: Integer;
begin
  Result := High(FieldNames) - Low(FieldNames) + 1;
end;

function TCategory.GetFilter: string;
begin
  Result := FilterValue;
end;

function TCategory.GetId: Integer;
begin
  Result := Value['CATEGORYID'];
end;

function TCategory.GetName: string;
begin
  Result := Value['NAME'];
end;

function TCategory.GetParentId: Integer;
begin
  Result := Value['PARENTID'];
end;

function TCategory.GetTableName: string;
begin
  Result := 'CATEGORIES';
end;

procedure TCategory.RestoreForTree;
begin
  FilterValue := FilterValues[1];
  Count := Restore;
end;

function TCategory.RestoreLast(AUserId: Integer): Integer;
begin
  FilterValue := Format(FilterValues[2], [AUserId]);
  Result := Restore;
end;

procedure TCategory.SetChildCount(const Value: Integer);
begin
  ChangeItem('CHILDCOUNT', Value);
end;

procedure TCategory.SetDate(const Value: TDateTime);
begin
  ChangeItem('DATE', Value);
end;

procedure TCategory.SetDescription(const Value: string);
begin
  ChangeItem('DESCRIPTION', Value);
end;

procedure TCategory.SetId(const Value: Integer);
begin
  ChangeItem('CATEGORYID', Value);
end;

procedure TCategory.SetName(const Value: string);
begin
  ChangeItem('NAME', Value);
end;

procedure TCategory.SetParentId(const Value: Integer);
begin
  ChangeItem('PARENTID', Value);
end;

end.
