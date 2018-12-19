unit UUser;

interface

uses Classes, DBPersistent;

type
  TUserType = (utUser, utDeveloper, utAdmin);

  PUserTypeSet = ^TUserTypeSet;
  TUserTypeSet = set of TUserType;


  TUser = class(TDBPersistent)
  private
    FCurrentFilter: Integer;
    FFilterValue: string;
    function GetCreateBy: Integer;
    function GetCreateDate: TDateTime;
    function GetFirst: string;
    function GetId: Integer;
    function GetIsAdmin: TUserType;
    function GetLast: string;
    function GetNick: string;
    function GetPass: string;
    procedure SetFirst(const Value: string);
    procedure SetIsAdmin(const Value: TUserType);
    procedure SetLast(const Value: string);
    procedure SetNick(const Value: string);
    procedure SetPass(const Value: string);
    procedure SetCreateBy(const Value: Integer);
    function GetLogin: string;
    procedure SetLogin(const Value: string);
    function GetCompany: string;
    function GetEMail: string;
    function GetMidName: string;
    function GetWWW: string;
    procedure SetCompany(const Value: string);
    procedure SetEMail(const Value: string);
    procedure SetMidName(const Value: string);
    procedure SetWWW(const Value: string);
    function GetAddress1: string;
    function GetAddress2: string;
    function GetAnswer: string;
    function GetCity: string;
    function GetCountry: string;
    function GetDateIns: string;
    function GetIsEmailWrong: string;
    function GetQuest: string;
    function GetState: string;
    function GetZip: string;
    procedure SetAddress1(const Value: string);
    procedure SetAddress2(const Value: string);
    procedure SetAnswer(const Value: string);
    procedure SetCity(const Value: string);
    procedure SetCountry(const Value: string);
    procedure SetDateIns(const Value: string);
    procedure SetIsEmailWrong(const Value: string);
    procedure SetQuest(const Value: string);
    procedure SetState(const Value: string);
    procedure SetZip(const Value: string);
    function GetMaxId: Integer;
    procedure SetId(const Value: Integer);
  protected
    function GetFieldsCount: Integer; override;
    function GetFilter: string; override;
    function GetTableName: string; override;

    property CurrentFilter: Integer read FCurrentFilter write FCurrentFilter default 0;
    property FilterValue: string read FFilterValue write FFilterValue;
  public
    constructor Create; override;
    destructor Destroy; override;

    function NewUser: Integer;
    function RemoveById(Id: Integer): Integer;
    function RestoreAll: Integer;
    function RestoreById(Id: Integer): Integer;
    function RestoreUser(ALogin, APass: string): Integer;

    property CreateBy: Integer read GetCreateBy write SetCreateBy;
    property CreateDate: TDateTime read GetCreateDate;
    property Id: Integer read GetId write SetId;
    property IsAdmin: TUserType read GetIsAdmin write SetIsAdmin;
    property First: string read GetFirst write SetFirst;
    property Last: string read GetLast write SetLast;
    property Nick: string read GetNick write SetNick;
    property Pass: string read GetPass write SetPass;
    property Login: string read GetLogin write SetLogin;
    property MidName: string read GetMidName write SetMidName;
    property Company: string read GetCompany write SetCompany;
    property EMail: string read GetEMail write SetEMail;
    property WWW: string read GetWWW write SetWWW;
    property Address1: string read GetAddress1 write SetAddress1;
    property Address2: string read GetAddress2 write SetAddress2;
    property City: string read GetCity write SetCity;
    property State: string read GetState write SetState;
    property Zip: string read GetZip write SetZip;
    property Country: string read GetCountry write SetCountry;
    property Quest: string read GetQuest write SetQuest;
    property Answer: string read GetAnswer write SetAnswer;
    property IsEmailWrong: string read GetIsEmailWrong write SetIsEmailWrong;
    property DateIns: string read GetDateIns write SetDateIns;
    property MaxId: Integer read GetMaxId;
  end;

  function UserTypeToString(AUserType: TUserType): string;
  function UserTypeToInt(AUserType: TUserType): Integer;
  function IntToUserType(AValue: Integer): TUserType;

implementation

{ TTrackerUser }
uses SysUtils;

const
  FiltersCount = 2;
  FieldNames: array[0..19] of string = ('USERID', 'LOGIN', 'FIRSTNAME', 'LASTNAME', 'MIDNAME',
    'COMPANYNAME', 'EMAIL', 'WWW', 'ADDRESS1', 'ADDRESS2', 'CITY', 'STATE', 'ZIP', 'COUNTRY',
    'PASSWORD', 'QUEST', 'ANSWER', 'NICKNAME', 'EMAILWRONG', 'DATEINS');
//  FilterNames: array[1..FiltersCount] of string = ('RestoreFilter');
  FilterValues: array[1..FiltersCount] of string = ('WHERE LOGIN=''%s'' AND PASSWORD=''%s''',
    'WHERE USERID=%d');

function TUser.RestoreById(Id: Integer): Integer;
begin
  ClearAll;
  CurrentFilter := 2;
  FilterValue := Format(FilterValues[CurrentFilter], [Id]);
  if Restore <> 0 then
    Result := Id
  else
    Result := 0;
//    raise Exception.CreateFmt('There is no user with id=%d', [Id]);
end;

function TUser.RestoreUser(ALogin, APass: string): Integer;
begin
  ClearAll;
  CurrentFilter := 1;
  FilterValue := Format(FilterValues[CurrentFilter], [ALogin, APass]);
  if Restore <> 0 then
    Result := Id
  else
    Result := 0;
end;

constructor TUser.Create;
begin
  inherited Create;

  InitItems(FieldNames);
end;

destructor TUser.Destroy;
begin
  inherited Destroy;
end;

function TUser.GetFilter: string;
begin
  if CurrentFilter = 0 then
    Result := ''
  else
    Result := FilterValue;
end;

function TUser.GetTableName: string;
begin
  Result := 'USERS';
end;

function TUser.GetCreateBy: Integer;
begin
  Result := Integer(Value['CREATEDBY']);
end;

function TUser.GetCreateDate: TDateTime;
begin
  Result := TDateTime(Value['CREATEDAT']);
end;

function TUser.GetFirst: string;
begin
  Result := string(Value['FIRSTNAME']);
end;

function TUser.GetId: Integer;
begin
  Result := Integer(Value['USERID']);
end;

function TUser.GetIsAdmin: TUserType;
var
  S: string;
begin
  S := string(Value['ISADMIN']);

  if S = 'A' then
    Result := utAdmin
  else
    if S = 'D' then
      Result := utDeveloper
    else
      Result := utUser;
end;

function TUser.GetLast: string;
begin
  Result := Value['LASTNAME'];
end;

function TUser.GetNick: string;
begin
  Result := Value['NICKNAME'];
end;

function TUser.GetPass: string;
begin
  Result := Value['PASSWORD'];
end;

procedure TUser.SetFirst(const Value: string);
begin
  ChangeItem('FIRSTNAME', Value);
end;

procedure TUser.SetIsAdmin(const Value: TUserType);
var
  S: string;
begin
  case Value of
    utDeveloper: S := 'D';
    utAdmin: S := 'A';
  else
    S := 'U';
  end;

  ChangeItem('ISADMIN', S);
end;

procedure TUser.SetLast(const Value: string);
begin
  ChangeItem('LASTNAME', Value);
end;

procedure TUser.SetNick(const Value: string);
begin
  ChangeItem('NICKNAME', Value);
end;

procedure TUser.SetPass(const Value: string);
begin
  ChangeItem('PASSWORD', Value);
end;

function TUser.NewUser: Integer;
begin
  Result := New;
end;

function TUser.GetFieldsCount: Integer;
begin
  Result := High(FieldNames) - Low(FieldNames) + 1;
end;

function TUser.RestoreAll: Integer;
begin
  ClearAll;
  CurrentFilter := 0;
  FilterValue := '';
  Result := Restore;
end;

function UserTypeToString(AUserType: TUserType): string;
begin
  case AUserType of
    utDeveloper: Result := 'Developer';
    utAdmin: Result := 'Administrator';
  else
    Result := 'User';
  end;
end;

function UserTypeToInt(AUserType: TUserType): Integer;
begin
  Result := Ord(AUserType);
end;

function IntToUserType(AValue: Integer): TUserType;
var
  AUserType: TUserType;
begin
  for AUserType := Low(AUserType) to High(AUserType) do
  begin
    if UserTypeToInt(AUserType) = AValue then
    begin
      Result := AUserType;
      Exit;
    end;
  end;
  Result := utUser;
end;

procedure TUser.SetCreateBy(const Value: Integer);
begin
  ChangeItem('CREATEDBY', Value);
end;

function TUser.RemoveById(Id: Integer): Integer;
begin
  CurrentFilter := 2;
  FilterValue := Format(FilterValues[CurrentFilter], [Id]);
  Result := Delete;
end;

function TUser.GetLogin: string;
begin
  Result := Value['LOGIN'];
end;

procedure TUser.SetLogin(const Value: string);
begin
  ChangeItem('LOGIN', Value);
end;

function TUser.GetCompany: string;
begin
  Result := Value['COMPANYNAME'];
end;

function TUser.GetEMail: string;
begin
  Result := Value['EMAIL'];
end;

function TUser.GetMidName: string;
begin
  Result := Value['MIDNAME'];
end;

function TUser.GetWWW: string;
begin
  Result := Value['WWW'];
end;

procedure TUser.SetCompany(const Value: string);
begin
  ChangeItem('COMPANYNAME', Value);
end;

procedure TUser.SetEMail(const Value: string);
begin
  ChangeItem('EMAIL', Value);
end;

procedure TUser.SetMidName(const Value: string);
begin
  ChangeItem('MIDNAME', Value);
end;

procedure TUser.SetWWW(const Value: string);
begin
  ChangeItem('WWW', Value);
end;

function TUser.GetAddress1: string;
begin
  Result := Value['ADDRESS1'];
end;

function TUser.GetAddress2: string;
begin
  Result := Value['ADDRESS2'];
end;

function TUser.GetAnswer: string;
begin
  Result := Value['ANSWER'];
end;

function TUser.GetCity: string;
begin
  Result := Value['CITY'];
end;

function TUser.GetCountry: string;
begin
  Result := Value['COUNTRY'];
end;

function TUser.GetDateIns: string;
begin
  Result := Value['DATEINS'];
end;

function TUser.GetIsEmailWrong: string;
begin
  Result := Value['EMAILWRONG'];
end;

function TUser.GetQuest: string;
begin
  Result := Value['QUEST'];
end;

function TUser.GetState: string;
begin
  Result := Value['STATE'];
end;

function TUser.GetZip: string;
begin
  Result := Value['ZIP'];
end;

procedure TUser.SetAddress1(const Value: string);
begin
  ChangeItem('ADDRESS1', Value);
end;

procedure TUser.SetAddress2(const Value: string);
begin
  ChangeItem('ADDRESS2', Value);
end;

procedure TUser.SetAnswer(const Value: string);
begin
  ChangeItem('ANSWER', Value);
end;

procedure TUser.SetCity(const Value: string);
begin
  ChangeItem('CITY', Value);
end;

procedure TUser.SetCountry(const Value: string);
begin
  ChangeItem('COUNTRY', Value);
end;

procedure TUser.SetDateIns(const Value: string);
begin
  ChangeItem('DATEINS', Value);
end;

procedure TUser.SetIsEmailWrong(const Value: string);
begin
  ChangeItem('EMAILWRONG', Value);
end;

procedure TUser.SetQuest(const Value: string);
begin
  ChangeItem('QUEST', Value);
end;

procedure TUser.SetState(const Value: string);
begin
  ChangeItem('STATE', Value);
end;

procedure TUser.SetZip(const Value: string);
begin
  ChangeItem('ZIP', Value);
end;

function TUser.GetMaxId: Integer;
begin
  Result := MaxInt('USERID');
end;

procedure TUser.SetId(const Value: Integer);
begin
  ChangeItem('USERID', Value);
end;

end.
