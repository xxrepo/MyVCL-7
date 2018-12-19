unit UQuestion;

interface

uses Classes, DBPersistent;

type
  TQuestionStatus = (qsUnassigned, qsAssigned, qsAnswered, qsPrivate);

  TQuestion = class(TDBPersistent)
  private
    FCurrentFilter: Integer;
    FFilterValue: string;

    function GetQuestionId: Integer;
    function GetSubject: string;
    procedure SetSubject(const Value: string);
    procedure SetQuestionId(const Value: Integer);
  protected
    function GetFieldsCount: Integer; override;
    function GetFilter: string; override;
    function GetTableName: string; override;
    function GetArticleId: Integer;

    property FilterValue: string read FFilterValue write FFilterValue;
    property CurrentFilter: Integer read FCurrentFilter write FCurrentFilter;
  public
    constructor Create; override;
    destructor Destroy; override;

    function RestoreAnsweredQuestions(AUserId: Integer): Integer;
    function RestoreAssignedQuestions(AUserId: Integer): Integer;
    function GetMaxId: Integer;

    property ArticleId: Integer read GetArticleId;
    property Id: Integer read GetQuestionId write SetQuestionId;
    property Subject: string read GetSubject write SetSubject; 
  end;

  function IntToQuestionStatus(AValue: Integer): TQuestionStatus;
  function QuestionStatusToString(AValue: TQuestionStatus): string;

implementation

uses
  SysUtils;

const
  FieldNames: array[0..6] of string = ('QUESTIONID', 'USERID', 'BODY_Q',
    'STATUS', 'DATE', 'SUBJECT', 'PLATFORM');
  FilterValues: array[1..3] of string = ('WHERE QUESTIONID=%d',
    'q, ANSWERONQ aq WHERE q.USERID = %d AND q.STATUS = 2 AND q.QUESTIONID = aq.QUESTIONID',
    'WHERE USERID = %d AND STATUS IN (1, 4)');

function IntToQuestionStatus(AValue: Integer): TQuestionStatus;
begin
  case AValue of
    0: Result := qsUnassigned;
    1: Result := qsAssigned;
    2: Result := qsAnswered;
    3: Result := qsPrivate;
    4: Result := qsAssigned;
  else
    Result := qsUnassigned;
  end;
end;

function QuestionStatusToString(AValue: TQuestionStatus): string;
const
  arStrs: array[0..3] of string = ('Unassigned', 'Assigned', 'Answered', 'Private');
begin
  Result := arStrs[Ord(AValue)];
end;
{ TQuestion }

constructor TQuestion.Create;
begin
  inherited;

  InitItems(FieldNames);
end;

destructor TQuestion.Destroy;
begin

  inherited;
end;

function TQuestion.GetArticleId: Integer;
begin
  Result := Value['ARTICLEID']
end;

function TQuestion.GetFieldsCount: Integer;
begin
  if CurrentFilter = 2 then
    Result := High(FieldNames) - Low(FieldNames) + 2
  else
    Result := High(FieldNames) - Low(FieldNames) + 1;
end;

function TQuestion.GetFilter: string;
begin
  Result := FilterValue;
end;

function TQuestion.GetMaxId: Integer;
begin
  Result := MaxInt('QUESTIONID');
end;

function TQuestion.GetQuestionId: Integer;
begin
  Result := Value['QUESTIONID'];
end;

function TQuestion.GetSubject: string;
begin
  Result := Value['SUBJECT'];
end;

function TQuestion.GetTableName: string;
begin
  Result := 'QUESTIONS';
end;

function TQuestion.RestoreAnsweredQuestions(AUserId: Integer): Integer;
begin
  ClearAll;
  CurrentFilter := 2;
  FilterValue := Format(FilterValues[CurrentFilter], [AUserId]);
  SelectExtension := ', aq.ARTICLEID';
  Result := Restore;
end;

function TQuestion.RestoreAssignedQuestions(AUserId: Integer): Integer;
begin
  ClearAll;
  CurrentFilter := 3;
  FilterValue := Format(FilterValues[CurrentFilter], [AUserId]);
  SelectExtension := '';
  Result := Restore;
end;

procedure TQuestion.SetQuestionId(const Value: Integer);
begin
  ChangeItem('QUESTIONID', Value);
end;

procedure TQuestion.SetSubject(const Value: string);
begin
  ChangeItem('SUBJECT', Value);
end;

end.
