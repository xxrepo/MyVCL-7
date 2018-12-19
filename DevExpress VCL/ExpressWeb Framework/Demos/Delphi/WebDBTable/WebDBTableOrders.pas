unit WebDBTableOrders;

interface

uses SysUtils, Classes, HTTPApp, cxWebModule, cxWebAppSrv, DB, DBTables,
  cxWebStdCtrls, cxWebDataCtrls, cxWebData, cxWebExtData, cxWebClasses,
  cxWebControls, cxWebTable, cxWebDBTable, ADODB;
  

type
  TWebDBTableOrdersPage = class(TcxWebPageModule)
    cxWebDBTable1: TcxWebDBTable;
    WebDBDataSource: TcxWebDBDataSource;
    cxWebDBLabel1: TcxWebDBLabel;
    dsCustInfo: TcxStdWebDataSource;
    CustInfoADOQuery: TADOQuery;
    ADOQuery: TADOQuery;
    procedure cxWebPageModuleActivate(Sender: TObject);
    procedure cxWebPageModuleDeactivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function WebDBTableOrdersPage: TWebDBTableOrdersPage;

implementation

{$R *.DFM} {*.html}

uses
  WebReq, WebCntxt, cxWebModFact, Variants, ActiveX;

function WebDBTableOrdersPage: TWebDBTableOrdersPage;
begin
  Result := TWebDBTableOrdersPage(WebContext.FindModuleClass(TWebDBTableOrdersPage));
end;

procedure TWebDBTableOrdersPage.cxWebPageModuleActivate(Sender: TObject);
var
  ACustNo: string;
begin
  ADOQuery.ConnectionString := 'FILE NAME=' + DataLinkDir + '\DBDEMOS.UDL';
  CustInfoADOQuery.ConnectionString := 'FILE NAME=' + DataLinkDir + '\DBDEMOS.UDL';

  if not IsFirstRequest then exit;
  ACustNo := Request.QueryFields.Values['custno'];
  if ACustno <> '' then
  begin
    ADOQuery.Parameters[0].Value := StrToInt(ACustNo);
    ADOQuery.Open;
    CustInfoADOQuery.Parameters[0].Value := StrToInt(ACustNo);
    CustInfoADOQuery.Open;
  end;
end;

procedure TWebDBTableOrdersPage.cxWebPageModuleDeactivate(Sender: TObject);
begin
  ADOQuery.Close;
  CustInfoADOQuery.Close;
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebPageModuleFactory.Create(TWebDBTableOrdersPage, TcxWebPageInfo.Create('*.html'),  caDestroy));

end.
