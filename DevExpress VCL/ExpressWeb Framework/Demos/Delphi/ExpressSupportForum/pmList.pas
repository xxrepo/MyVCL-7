unit pmList;

interface

uses SysUtils, Classes, HTTPApp, cxWebModule, cxWebAppSrv, cxWebData,
  cxWebExtData, DB, ADODB, cxWebClasses, cxWebControls, cxWebGrids,
  cxWebDataCtrls, cxWebDataNavigator, cxWebStdCtrls, cxWebTable,
  cxWebDBTable;
  

type
  TIntroList = class(TcxWebPageModule)
    Query: TADOQuery;
    DataSource: TcxWebDBDataSource;
    QueryCATEGORYID: TIntegerField;
    QueryPARENTID: TIntegerField;
    QueryNAME: TStringField;
    QueryDESCRIPTION: TStringField;
    QueryCHILDCOUNT: TIntegerField;
    QueryDATE: TDateTimeField;
    ArticliesQuery: TADOQuery;
    ArtDataSource: TcxWebDBDataSource;
    ArticliesQuerysubject: TStringField;
    ArticliesQueryarticleid: TIntegerField;
    ArticliesQuerysource: TStringField;
    CurArtDataSource: TcxWebDBDataSource;
    CurArtQuery: TADOQuery;
    CurArtQueryCATEGORYID: TIntegerField;
    CurArtQueryPARENTID: TIntegerField;
    CurArtQueryNAME: TStringField;
    CurArtQueryDESCRIPTION: TStringField;
    CurArtQueryCHILDCOUNT: TIntegerField;
    CurArtQueryDATE: TDateTimeField;
    ArtDBTable: TcxWebDBTable;
    CatDBTable: TcxWebDBTable;
    procedure cxWebPageModuleActivate(Sender: TObject);
    procedure CatDBTableGetTitleHTML(Sender: TObject;
      AColumn: TcxCustomWebTableColumn; const AHRef: String;
      var AHTML: String);
    procedure ArtDBTableGetTitleHTML(Sender: TObject;
      AColumn: TcxCustomWebTableColumn; const AHRef: String;
      var AHTML: String);
    procedure ArtDBTableGetHrefValue(Sender: TObject;
      AColumn: TcxWebDBTableColumn; ARecIndex: Integer;
      const AKeyValue: String; AURL: TcxURL);
    procedure CatDBTableGetHrefValue(Sender: TObject;
      AColumn: TcxWebDBTableColumn; ARecIndex: Integer;
      const AKeyValue: String; AURL: TcxURL);
  private
    FCategoryId: Integer;
    { Private declarations }
    procedure FillGrid;
    function GetArticleCount: Integer;
    function GetCategoryCount: Integer;
    function GetCategoryName: string;
  public
    { Public declarations }
  published
    property CategoryCount: Integer read GetCategoryCount;
    property ArticleCount: Integer read GetArticleCount;
    property CategoryName: string read GetCategoryName;
    property CategoryId: Integer read FCategoryId write FCategoryId;
  end;

function IntroList: TIntroList;

implementation

{$R *.DFM} {*.html}

uses
  WebReq, WebCntxt, cxWebModFact, Variants, HomeDM, ActiveX, ComObj;

function IntroList: TIntroList;
begin
  Result := TIntroList(WebContext.FindModuleClass(TIntroList));
end;

procedure TIntroList.cxWebPageModuleActivate(Sender: TObject);
begin
  if DM.RestoreUser then
  begin
    if IsFirstRequest then
      FillGrid;
  end
  else
    RedirectToPage('Index', '');
end;

procedure TIntroList.FillGrid;
begin
  FCategoryId := StrToInt(Request.QueryFields.Values['cid']);
  Query.Parameters.ParamByName('cid').Value := CategoryId;
  Query.Active := True;
  ArticliesQuery.Parameters.ParamByName('cid').Value := CategoryId;
  ArticliesQuery.Active := True;
  CurArtQuery.Parameters.ParamByName('cid').Value := CategoryId;
  CurArtQuery.Active := True;
  CatDBTable.Visible := not Query.IsEmpty;
  ArtDBTable.Visible := not ArticliesQuery.IsEmpty;
end;

function TIntroList.GetArticleCount: Integer;
begin
  Result := ArticliesQuery.RecordCount;
end;

function TIntroList.GetCategoryCount: Integer;
begin
  Result := Query.RecordCount;
end;

function TIntroList.GetCategoryName: string;
begin
  Result := CurArtQuery.FieldValues['NAME'];
end;

procedure TIntroList.CatDBTableGetTitleHTML(Sender: TObject;
  AColumn: TcxCustomWebTableColumn; const AHRef: String;
  var AHTML: String);
begin
  if TcxWebDBTableColumn(AColumn).SortOrder = wsoAscending then
    AHTML := AHTML + ' <img hspace="10" src="/dxforum/images/up.gif" vspace="2">'
  else
    if TcxWebDBTableColumn(AColumn).SortOrder = wsoDescending then
      AHTML := AHTML + ' <img hspace="10" src="/dxforum/images/down.gif" vspace="2">';
end;

procedure TIntroList.ArtDBTableGetTitleHTML(Sender: TObject;
  AColumn: TcxCustomWebTableColumn; const AHRef: String;
  var AHTML: String);
begin
  if TcxWebDBTableColumn(AColumn).SortOrder = wsoAscending then
    AHTML := AHTML + ' <img hspace="10" src="/dxforum/images/up.gif" vspace="2">'
  else
    if TcxWebDBTableColumn(AColumn).SortOrder = wsoDescending then
      AHTML := AHTML + ' <img hspace="10" src="/dxforum/images/down.gif" vspace="2">';
end;

procedure TIntroList.ArtDBTableGetHrefValue(Sender: TObject;
  AColumn: TcxWebDBTableColumn; ARecIndex: Integer;
  const AKeyValue: String; AURL: TcxURL);
begin
  if SameText(AColumn.DataBinding.FieldName, 'subject') then
    AURL.Href := 'View?aid=' + AKeyValue;
end;

procedure TIntroList.CatDBTableGetHrefValue(Sender: TObject;
  AColumn: TcxWebDBTableColumn; ARecIndex: Integer;
  const AKeyValue: String; AURL: TcxURL);
begin
  if SameText(AColumn.DataBinding.FieldName, 'NAME') then
    AURL.Href := 'IntroList?cid=' + AKeyValue;
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebPageModuleFactory.Create(TIntroList, TcxWebPageInfo.Create('*.html'),  caDestroy));

end.
