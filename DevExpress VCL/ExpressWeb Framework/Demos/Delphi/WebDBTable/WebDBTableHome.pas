unit WebDBTableHome;

interface

uses SysUtils, Classes, HTTPApp, cxWebModule, cxWebAppSrv, DB, DBTables,
  cxWebData, cxWebExtData, cxWebClasses, cxWebControls, 
  cxWebDBTable, cxWebTable, ADODB;
  

type
  TWebDBTableHomePage = class(TcxWebPageModule)
    cxWebDBTable1: TcxWebDBTable;
    cxWebDBDataSource1: TcxWebDBDataSource;
    StyleController: TcxWebStyleController;
    TableHeader: TcxWebStyleItem;
    TablePaging: TcxWebStyleItem;
    TablePagingHover: TcxWebStyleItem;
    TableHeaderHover: TcxWebStyleItem;
    TableAlter: TcxWebStyleItem;
    TableItems: TcxWebStyleItem;
    ADOTable1: TADOTable;
    procedure cxWebDBTable1GetHrefValue(Sender: TObject;
      AColumn: TcxWebDBTableColumn; ARecIndex: Integer;
      const AKeyValue: String; AURL: TcxURL);
    procedure cxWebPageModuleActivate(Sender: TObject);
    procedure cxWebPageModuleDeactivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function WebDBTableHomePage: TWebDBTableHomePage;

implementation

{$R *.DFM} {*.html}

uses
  WebReq, WebCntxt, cxWebModFact, Variants, ActiveX;

function WebDBTableHomePage: TWebDBTableHomePage;
begin
  Result := TWebDBTableHomePage(WebContext.FindModuleClass(TWebDBTableHomePage));
end;

procedure TWebDBTableHomePage.cxWebDBTable1GetHrefValue(Sender: TObject;
  AColumn: TcxWebDBTableColumn; ARecIndex: Integer;
  const AKeyValue: String; AURL: TcxURL);
begin
  AURL.Href := 'WebDBTableOrdersPage?custno=' + AKeyValue;
end;

procedure TWebDBTableHomePage.cxWebPageModuleActivate(Sender: TObject);
begin
  ADOTable1.ConnectionString := 'FILE NAME=' + DataLinkDir + '\DBDEMOS.UDL';
  ADOTable1.Open;
end;

procedure TWebDBTableHomePage.cxWebPageModuleDeactivate(Sender: TObject);
begin
  ADOTable1.Close;
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebPageModuleFactory.Create(TWebDBTableHomePage, TcxWebPageInfo.Create('*.html'),  caDestroy));

end.
