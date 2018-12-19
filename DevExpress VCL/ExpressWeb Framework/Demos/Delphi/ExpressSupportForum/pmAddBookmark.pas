unit pmAddBookmark;

interface

uses SysUtils, Classes, HTTPApp, cxWebModule, cxWebAppSrv, cxWebClasses,
  cxWebControls, cxWebStdCtrls, DB, ADODB;


type
  TAddBookmark = class(TcxWebPageModule)
    Add: TcxWebButton;
    Cancel: TcxWebButton;
    BookName: TcxWebEdit;
    ArticleQuery: TADOQuery;
    CategoryQuery: TADOQuery;
    InsertBookmarkQuery: TADOQuery;
    GetMaxBookmarkIdQuery: TADOQuery;
    procedure AddClick(Sender: TObject);
    procedure cxWebPageModuleBeforeGenerateContent(Sender: TObject;
      const APageName: String; var AHandled: Boolean);
  private
    FArticleId: Integer;
    FCategoryId: Integer;
    { Private declarations }
    procedure FillCtrls;
    function GetNeedClose: Boolean;
  public
    { Public declarations }
  published
    property ArticleId: Integer read FArticleId write FArticleId;
    property CategoryId: Integer read FCategoryId write FCategoryId;
    property NeedClose: Boolean read GetNeedClose;
  end;

function AddBookmark: TAddBookmark;

implementation

{$R *.DFM} {*.html}

uses
  WebReq, WebCntxt, cxWebModFact, Variants, HomeDM, ActiveX, ComObj;

function AddBookmark: TAddBookmark;
begin
  Result := TAddBookmark(WebContext.FindModuleClass(TAddBookmark));
end;

procedure TAddBookmark.FillCtrls;
begin
  if IsFirstRequest then
  begin
    ArticleId := StrToInt(Request.QueryFields.Values['aid']);
    CategoryId := StrToInt(Request.QueryFields.Values['cid']);
    if ArticleId <> -1 then
    begin
      ArticleQuery.Parameters.ParamByName('aid').Value := ArticleId;
      ArticleQuery.Active := True;
      BookName.Text := 'Article: ' + ArticleQuery.FieldValues['subject'];
    end
    else
    begin
      CategoryQuery.Parameters.ParamByName('cid').Value := CategoryId;
      CategoryQuery.Active := True;
      BookName.Text := 'Category: ' + CategoryQuery.FieldValues['name'];
    end;
  end;
end;

procedure TAddBookmark.AddClick(Sender: TObject);
begin
  GetMaxBookmarkIdQuery.Active := True;
  if VarIsNull(GetMaxBookmarkIdQuery.FieldValues['M']) then
    InsertBookmarkQuery.Parameters.ParamByName('BOOKMARKID').Value := 1
  else InsertBookmarkQuery.Parameters.ParamByName('BOOKMARKID').Value := GetMaxBookmarkIdQuery.FieldValues['M'] + 1;
  InsertBookmarkQuery.Parameters.ParamByName('CATEGORYID').Value := CategoryId;
  InsertBookmarkQuery.Parameters.ParamByName('USERID').Value := DM.UserId;
  InsertBookmarkQuery.Parameters.ParamByName('NAME').Value := Copy(BookName.Text, 1, 100);
  InsertBookmarkQuery.Parameters.ParamByName('ARTICLEID').Value := ArticleId;
  InsertBookmarkQuery.ExecSQL;
end;

function TAddBookmark.GetNeedClose: Boolean;
begin
  Result := not IsFirstRequest;
end;

procedure TAddBookmark.cxWebPageModuleBeforeGenerateContent(
  Sender: TObject; const APageName: String; var AHandled: Boolean);
begin
  FillCtrls;
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebPageModuleFactory.Create(TAddBookmark, TcxWebPageInfo.Create('*.html'),  caDestroy));
end.
