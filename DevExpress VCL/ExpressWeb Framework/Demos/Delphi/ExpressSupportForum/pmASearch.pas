unit pmASearch;

interface

uses SysUtils, Classes, HTTPApp, cxWebModule, cxWebAppSrv, HomeDM, DB, ADODB,
  cxWebClasses, cxWebControls, cxWebStdCtrls;


type
  TASearch = class(TcxWebPageModule)
    Query: TADOQuery;
    ExQuery: TADOQuery;
    wcbSource: TcxWebComboBox;
    wcbExpert: TcxWebComboBox;
    weCont: TcxWebEdit;
    cxWebButton1: TcxWebButton;
    wbReset: TcxWebButton;
    procedure cxWebPageModuleActivate(Sender: TObject);
  private
    { Private declarations }
    procedure FillCtrls;
    procedure FillSource;
    procedure FillExperts;
  public
    { Public declarations }
  end;

function ASearch: TASearch;

implementation

{$R *.DFM} {*.html}

uses
  WebReq, WebCntxt, cxWebModFact, Variants, ActiveX, ComObj;

function ASearch: TASearch;
begin
  Result := TASearch(WebContext.FindModuleClass(TASearch));
end;

procedure TASearch.cxWebPageModuleActivate(Sender: TObject);
begin
  FillCtrls;
end;

procedure TASearch.FillCtrls;
begin
  if IsFirstRequest then
  begin
    FillSource;
    FillExperts;
  end;
end;

procedure TASearch.FillExperts;
var
  ListItem: TcxWebListItem;
  S: string;
begin
  ExQuery.Active := True;
  while not ExQuery.Eof do
  begin
    ListItem := wcbExpert.Items.Add;
     if not ExQuery.FindField('expertid').IsNull then
       ListItem.Value := ExQuery.FieldValues['expertid'];
     if not ExQuery.FindField('firstname').IsNull then
       S := ExQuery.FieldValues['firstname'];
     if not ExQuery.FindField('midname').IsNull then
       S := S + ExQuery.FieldValues['midname'];
     if not ExQuery.FindField('lastname').IsNull then
       S := S + ExQuery.FieldValues['lastname'];
     ListItem.Text := S;
    ExQuery.Next;
  end;
end;

procedure TASearch.FillSource;
var
  ListItem: TcxWebListItem;
begin
  Query.Active := True;
  while not Query.Eof do
  begin
    ListItem := wcbSource.Items.Add;
    if not Query.FindField('source').IsNull then
    begin
      ListItem.Text := Query.FieldValues['source'];
      ListItem.Value := Query.FieldValues['source'];
    end;
    Query.Next;
  end;
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebPageModuleFactory.Create(TASearch, TcxWebPageInfo.Create('*.html'),  caDestroy));

end.
