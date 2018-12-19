unit UUserVisit;

interface

uses Classes, DBPersistent;

type

  TUserVisit = class(TDBPersistent)
  private
    FFilterValue: string;
    function GetBefore: TDateTime;
    function GetLastDate: TDateTime;
    function GetUserId: Integer;
    procedure SetBefore(const Value: TDateTime);
    procedure SetLastDate(const Value: TDateTime);
    procedure SetUserId(const Value: Integer);
  protected
    function GetFieldsCount: Integer; override;
    function GetFilter: string; override;
    function GetTableName: string; override;

    property FilterValue: string read FFilterValue write FFilterValue;  
  public
    constructor Create; override;
    destructor Destroy; override;

    function RestoreByUserId(AUserId: Integer): Integer;

    property Before: TDateTime read GetBefore write SetBefore;
    property LastDate: TDateTime read GetLastDate write SetLastDate;
    property UserId: Integer read GetUserId write SetUserId;
  end;

implementation

uses
  SysUtils;

const
  FieldNames: array[0..2] of string = ('USERID', 'LASTDATE', 'BEFORE');
  FilterValues: array[1..1] of string = ('WHERE USERID=%d');

{ TUserVisit }

constructor TUserVisit.Create;
begin
  inherited;

  InitItems(FieldNames);
end;

destructor TUserVisit.Destroy;
begin

  inherited;
end;

function TUserVisit.GetBefore: TDateTime;
begin
  Result := Value['BEFORE'];
end;

function TUserVisit.GetFieldsCount: Integer;
begin
  Result := High(FieldNames) - Low(FieldNames) + 1;
end;

function TUserVisit.GetFilter: string;
begin
  Result := FilterValue;
end;

function TUserVisit.GetLastDate: TDateTime;
begin
  Result := Value['LASTDATE'];
end;

function TUserVisit.GetTableName: string;
begin
  Result := 'USERVISIT';
end;

function TUserVisit.GetUserId: Integer;
begin
  Result := Value['USERID'];
end;

function TUserVisit.RestoreByUserId(AUserId: Integer): Integer;
begin
  FilterValue := Format(FilterValues[1], [AUserId]);
  Result := Restore;
end;

procedure TUserVisit.SetBefore(const Value: TDateTime);
begin
  ChangeItem('BEFORE', Value);
end;

procedure TUserVisit.SetLastDate(const Value: TDateTime);
begin
  ChangeItem('LASTDATE', Value);
end;

procedure TUserVisit.SetUserId(const Value: Integer);
begin
  ChangeItem('USERID', Value);
end;

end.
