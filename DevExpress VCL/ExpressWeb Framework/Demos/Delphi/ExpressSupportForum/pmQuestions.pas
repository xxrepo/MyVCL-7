unit pmQuestions;

interface

uses SysUtils, Classes, HTTPApp, cxWebModule, cxWebAppSrv, HomeDM,
  cxWebGrids, cxWebDataCtrls, DB, ADODB, cxWebData, cxWebExtData,
  cxWebClasses, cxWebControls, cxWebDataNavigator, cxWebTable, cxWebDBTable;
  

type
  TQuestions = class(TcxWebPageModule)
    DataSource: TcxWebDBDataSource;
    Query: TADOQuery;
    Queryquestionid: TIntegerField;
    Querysubject: TStringField;
    Querystatus: TSmallintField;
    Querydate: TDateTimeField;
    Querynickname: TStringField;
    Queryemail: TStringField;
    Queryarticleid: TIntegerField;
    WebDBTable: TcxWebDBTable;
    procedure cxWebPageModuleActivate(Sender: TObject);
    procedure WebDBTableGetTitleHTML(Sender: TObject;
      AColumn: TcxCustomWebTableColumn; const AHRef: String;
      var AHTML: String);
    procedure WebDBTableGetDisplayText(Sender: TObject;
      AColumn: TcxWebDBTableColumn; ARecIndex: Integer; var AText: String);
    procedure WebDBTableGetHrefValue(Sender: TObject;
      AColumn: TcxWebDBTableColumn; ARecIndex: Integer;
      const AKeyValue: String; AURL: TcxURL);
  private
    FTotal: Integer;
    { Private declarations }
    procedure FillGrid;
  public
    { Public declarations }
  published
    property Total: Integer read FTotal write FTotal;
  end;

function Questions: TQuestions;

implementation

{$R *.DFM} {*.html}

uses
  WebReq, WebCntxt, cxWebModFact, Variants, UQuestion, ActiveX, ComObj;

function Questions: TQuestions;
begin
  Result := TQuestions(WebContext.FindModuleClass(TQuestions));
end;

procedure TQuestions.cxWebPageModuleActivate(Sender: TObject);
begin
  FillGrid;
end;

procedure TQuestions.FillGrid;
begin
  Query.Active := True;
  FTotal := Query.RecordCount;
end;

procedure TQuestions.WebDBTableGetTitleHTML(Sender: TObject;
  AColumn: TcxCustomWebTableColumn; const AHRef: String;
  var AHTML: String);
begin
  if TcxWebDBTableColumn(AColumn).SortOrder = wsoAscending then
    AHTML := AHTML + ' <img hspace="10" src="/dxforum/images/up.gif" vspace="2">'
  else
    if TcxWebDBTableColumn(AColumn).SortOrder = wsoDescending then
      AHTML := AHTML + ' <img hspace="10" src="/dxforum/images/down.gif" vspace="2">';
end;

procedure TQuestions.WebDBTableGetDisplayText(Sender: TObject;
  AColumn: TcxWebDBTableColumn; ARecIndex: Integer; var AText: String);
var
  AStatus: Integer;
begin
  if SameText(AColumn.DataBinding.FieldName, 'status') then
  begin
    if AText <> '' then
      AStatus := StrToInt(AText)
    else AStatus := 0;
      AText := QuestionStatusToString(IntToQuestionStatus(AStatus));
  end;
end;


procedure TQuestions.WebDBTableGetHrefValue(Sender: TObject;
  AColumn: TcxWebDBTableColumn; ARecIndex: Integer;
  const AKeyValue: String; AURL: TcxURL);
var
 AQStat: TQuestionStatus;
begin
  AQStat := IntToQuestionStatus(WebDBTable.GetFieldValue(ARecIndex, 'status'));
  case AColumn.Index of //TODO re-write case
    0: AURL.Href := Format('mailto:%s', [WebDBTable.GetFieldValue(ARecIndex, 'email')]);
    1:
      if AQStat = qsAnswered then
        AURL.Href := Format('View?aid=%s', [WebDBTable.GetFieldValue(ARecIndex, 'articleid')])
      else AURL.Href := '';
    2: AURL.Href := Format('Viewquest?qid=%s', [AKeyValue]);
  end;
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebPageModuleFactory.Create(TQuestions, TcxWebPageInfo.Create('*.html'),  caDestroy));

end.
