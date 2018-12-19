unit pmIntro;

interface

uses
  SysUtils, Classes, HTTPApp, cxWebModule, cxWebAppSrv, UCategory, UArticle,
    UQuestion, DB, ADODB, HomeDM;


type

  TIntro = class(TcxWebPageModule)
    AnsweredQuestionQuery: TADOQuery;
    UnassignedQuestionQuery: TADOQuery;
    procedure cxWebPageModuleActivate(Sender: TObject);
    procedure cxWebPageModuleDestroy(Sender: TObject);
  private
    Category: TCategory;
    Article: TArticle;
    AssignedQuestion: TQuestion;
    FLastCatergoryCounter: Integer;
    FLastArticleCounter: Integer;
    FAnsweredQuestionsCount: Integer;
    FAssignedQuestionsCount: Integer;
    FUnassignedQuestionsCount: Integer;

    function GetNick: string;
    procedure CheckNewGroups;
    procedure CreatePersistents;
    procedure DestroyPersistents;
    function GetCurrentCategoryRow: Integer;
    procedure SetCurrentCategoryRow(const Value: Integer);
    function GetCategoryId: Integer;
    function GetCategoryName: string;
    function GetArticleId: Integer;
    function GetArticleSubject: string;
    function GetCurrentArticleRow: Integer;
    procedure SetCurrentArticleRow(const Value: Integer);
    function GetAnswerArticleId: Integer;
    function GetCurrentAnsweredQuestionsRow: Integer;
    function GetQuestionId: Integer;
    function GetQuestionSubject: string;
    procedure SetCurrentAnsweredQuestionsRow(const Value: Integer);
    function GetCurrentAssignedQuestionsRow: Integer;
    procedure SetCurrentAssignedQuestionsRow(const Value: Integer);
    function GetAssignedQuestionId: Integer;
    function GetAssignedQuestionSubject: string;
    function GetUnassignedQuestionCurrentRow: Integer;
    function GetUnassignedQuestionId: Integer;
    function GetUnassignedQuestionSubject: string;
    procedure SetUnassignedQuestionCurrentRow(const Value: Integer);
    function GetUserId: Integer;
    function GetAnswerQuestionSubject: string;
    { Private declarations }
  public
    { Public declarations }
  published
    property Nick: string read GetNick;
    property LastArticleCounter: Integer read FLastArticleCounter;
    property ArticleId: Integer read GetArticleId;
    property ArticleSubject: string read GetArticleSubject;
    property LastCatergoryCounter: Integer read FLastCatergoryCounter;
    property CurrentArticleRow: Integer read GetCurrentArticleRow write SetCurrentArticleRow;
    property CurrentCategoryRow: Integer read GetCurrentCategoryRow write SetCurrentCategoryRow;
    property CategoryId: Integer read GetCategoryId;
    property CategoryName: string read GetCategoryName;
    property AnsweredQuestionsCount: Integer read FAnsweredQuestionsCount write FAnsweredQuestionsCount;
    property CurrentAnsweredQuestionsRow: Integer read GetCurrentAnsweredQuestionsRow write SetCurrentAnsweredQuestionsRow;
    property AnswerArticleId: Integer read GetAnswerArticleId;
    property AnswerQuestionSubject: string read GetAnswerQuestionSubject;
    property QuestionId: Integer read GetQuestionId;
    property QuestionSubject: string read GetQuestionSubject;
    property AssignedQuestionsCount: Integer read FAssignedQuestionsCount;
    property CurrentAssignedQuestionsRow: Integer read GetCurrentAssignedQuestionsRow write SetCurrentAssignedQuestionsRow;
    property AssignedQuestionId: Integer read GetAssignedQuestionId;
    property AssignedQuestionSubject: string read GetAssignedQuestionSubject;
    property UnassignedQuestionsCount: Integer read FUnassignedQuestionsCount;
    property UnassignedQuestionCurrentRow: Integer read GetUnassignedQuestionCurrentRow write SetUnassignedQuestionCurrentRow;
    property UnassignedQuestionId: Integer read GetUnassignedQuestionId;
    property UnassignedQuestionSubject: string read GetUnassignedQuestionSubject;
    property UserId: Integer read GetUserId;
  end;

function Intro: TIntro;

implementation

{$R *.DFM} {*.html}

uses
  WebReq, WebCntxt, cxWebModFact, Variants, UUserVisit, ActiveX, ComObj;

function Intro: TIntro;
begin
  Result := TIntro(WebContext.FindModuleClass(TIntro));
end;

{ TIntro }

function TIntro.GetNick: string;
begin
  Result := DM.Nick;
end;

procedure TIntro.cxWebPageModuleActivate(Sender: TObject);
begin
  CreatePersistents;
  CheckNewGroups;
end;

procedure TIntro.CheckNewGroups;
var
  AUserVisit: TUserVisit;
begin
  AUserVisit := TUserVisit.Create;
  try
    AUserVisit.Connection := DM.Connection;
  finally
    AUserVisit.Free;
  end;
  FLastCatergoryCounter := Category.RestoreLast(DM.UserId);
  FLastArticleCounter := Article.RestoreLast(DM.UserId);

  AnsweredQuestionQuery.Parameters.ParamByName('userid').Value := DM.UserId;
  AnsweredQuestionQuery.Active := True;
  AnsweredQuestionQuery.Open;
  UnassignedQuestionQuery.Parameters.ParamByName('userid').Value := DM.UserId;
  UnassignedQuestionQuery.Active := True;
  UnassignedQuestionQuery.Open;
  FAnsweredQuestionsCount := AnsweredQuestionQuery.RecordCount;
  FUnassignedQuestionsCount := UnassignedQuestionQuery.RecordCount;
  FAssignedQuestionsCount := AssignedQuestion.RestoreAssignedQuestions(DM.UserId);
end;

procedure TIntro.CreatePersistents;
begin
  Category := TCategory.Create;
  Category.Connection := DM.Connection;
  Article := TArticle.Create;
  Article.Connection := DM.Connection;
  AssignedQuestion := TQuestion.Create;
  AssignedQuestion.Connection := DM.Connection;
end;

procedure TIntro.cxWebPageModuleDestroy(Sender: TObject);
begin
  DestroyPersistents;

end;

procedure TIntro.DestroyPersistents;
begin
  Category.Free;
  Article.Free;
  AssignedQuestion.Free;
end;

function TIntro.GetCurrentCategoryRow: Integer;
begin
  Result := Category.CurrentRow;
end;

procedure TIntro.SetCurrentCategoryRow(const Value: Integer);
begin
  Category.CurrentRow := Value;
end;

function TIntro.GetCategoryId: Integer;
begin
  Result := Category.Id;
end;

function TIntro.GetCategoryName: string;
begin
  Result := Category.Name;
end;

function TIntro.GetArticleId: Integer;
begin
  Result := Article.Id;
end;

function TIntro.GetArticleSubject: string;
begin
  Result := Article.Subject;
end;

function TIntro.GetCurrentArticleRow: Integer;
begin
  Result := Article.CurrentRow;
end;

procedure TIntro.SetCurrentArticleRow(const Value: Integer);
begin
  Article.CurrentRow := Value;
end;

function TIntro.GetAnswerArticleId: Integer;
begin
  Result := AnsweredQuestionQuery.FieldByName('articleid').Value;
end;

function TIntro.GetCurrentAnsweredQuestionsRow: Integer;
begin
  Result := 0;
end;

function TIntro.GetQuestionId: Integer;
begin
  Result := AnsweredQuestionQuery.FieldByName('questionid').Value;
end;

function TIntro.GetQuestionSubject: string;
begin
  Result := AnsweredQuestionQuery.FieldByName('subject').Value;
end;

procedure TIntro.SetCurrentAnsweredQuestionsRow(const Value: Integer);
begin
  AnsweredQuestionQuery.Next;
end;

function TIntro.GetCurrentAssignedQuestionsRow: Integer;
begin
  Result := AssignedQuestion.CurrentRow;
end;

procedure TIntro.SetCurrentAssignedQuestionsRow(const Value: Integer);
begin
  AssignedQuestion.CurrentRow := Value;
end;

function TIntro.GetAssignedQuestionId: Integer;
begin
  Result := AssignedQuestion.Id;
end;

function TIntro.GetAssignedQuestionSubject: string;
begin
  Result := AssignedQuestion.Subject;
end;

function TIntro.GetUnassignedQuestionCurrentRow: Integer;
begin
// do nothing
  Result := 0;
end;

function TIntro.GetUnassignedQuestionId: Integer;
begin
  Result := UnassignedQuestionQuery.FieldValues['questionid'];
end;

function TIntro.GetUnassignedQuestionSubject: string;
begin
  Result := UnassignedQuestionQuery.FieldValues['subject'];
end;

procedure TIntro.SetUnassignedQuestionCurrentRow(const Value: Integer);
begin
  UnassignedQuestionQuery.Next;
end;

function TIntro.GetUserId: Integer;
begin
  Result := DM.UserId;
end;

function TIntro.GetAnswerQuestionSubject: string;
begin
  Result := AnsweredQuestionQuery.FieldByName('subject').Value;
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebPageModuleFactory.Create(TIntro, TcxWebPageInfo.Create('*.html'),  caDestroy));
end.
