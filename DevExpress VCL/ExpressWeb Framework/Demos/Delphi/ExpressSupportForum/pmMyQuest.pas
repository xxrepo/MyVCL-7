unit pmMyQuest;

interface

uses SysUtils, Classes, HTTPApp, cxWebModule, cxWebAppSrv, DB, ADODB,
  cxWebData, cxWebExtData, cxWebDataNavigator, cxWebDataCtrls,
  cxWebClasses, cxWebControls, cxWebGrids, cxWebTable, cxWebDBTable;
  

type
  TMyQuest = class(TcxWebPageModule)
    DataSource: TcxWebDBDataSource;
    Query: TADOQuery;
    Queryquestionid: TIntegerField;
    Querysubject: TStringField;
    Querystatus: TSmallintField;
    Querydate: TDateTimeField;
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
    { Private declarations }
    procedure FillGrid;
    function GetTotal: Integer;
  public
    { Public declarations }
  published
    property Total: Integer read GetTotal;
  end;

function MyQuest: TMyQuest;

implementation

{$R *.DFM} {*.html}

uses
  WebReq, WebCntxt, cxWebModFact, Variants, UQuestion, HomeDM, ActiveX, ComObj;

function MyQuest: TMyQuest;
begin
  Result := TMyQuest(WebContext.FindModuleClass(TMyQuest));
end;

procedure TMyQuest.cxWebPageModuleActivate(Sender: TObject);
begin
  FillGrid;
end;

procedure TMyQuest.FillGrid;
begin
  Query.Parameters.ParamByName('uid').Value := DM.UserId;
  Query.Active := True;
end;

function TMyQuest.GetTotal: Integer;
begin
  Result := DataSource.RecordCount;
end;

procedure TMyQuest.WebDBTableGetTitleHTML(Sender: TObject;
  AColumn: TcxCustomWebTableColumn; const AHRef: String;
  var AHTML: String);
begin
  if TcxWebDBTableColumn(AColumn).SortOrder = wsoAscending then
    AHTML := AHTML + ' <img hspace="10" src="/dxforum/images/up.gif" vspace="2">'
  else
    if TcxWebDBTableColumn(AColumn).SortOrder = wsoDescending then
      AHTML := AHTML + ' <img hspace="10" src="/dxforum/images/down.gif" vspace="2">';
end;

procedure TMyQuest.WebDBTableGetDisplayText(Sender: TObject;
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


procedure TMyQuest.WebDBTableGetHrefValue(Sender: TObject;
  AColumn: TcxWebDBTableColumn; ARecIndex: Integer;
  const AKeyValue: String; AURL: TcxURL);
var
 AQStat: TQuestionStatus;
begin
  AQStat := IntToQuestionStatus(WebDBTable.GetFieldValue(ARecIndex, 'status'));
  case AColumn.Index of //TODO re-write case
    0:
      case AQStat of
        qsAnswered:
          AURL.Href := Format('View?aid=%s', [WebDBTable.GetFieldValue(ARecIndex, 'articleid')]);
        qsPrivate:
          AURL.Href := Format('ViewReject?qid=%s', [AKeyValue]);
        else AURL.Href := '';
      end;
    1: AURL.Href := Format('Viewquest?qid=%s', [AKeyValue]);
  end;
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebPageModuleFactory.Create(TMyQuest, TcxWebPageInfo.Create('*.html'),  caDestroy));

end.
