unit VBScriptHome;

interface

uses SysUtils, Classes, HTTPApp, cxWebModule, cxWebAppSrv, DB, DBTables,
  cxWebClasses, ADODB;
  

type
  TVBScriptHomePage = class(TcxWebPageModule)
    cxWebStyleController1: TcxWebStyleController;
    cxWebStyleController1Item1: TcxWebStyleItem;
    customerTable: TADOTable;
    orderTable: TADOTable;
    procedure cxWebPageModuleDeactivate(Sender: TObject);
    procedure cxWebPageModuleActivate(Sender: TObject);
  private
      { Private declarations }
  public
    { Public declarations }
  end;

function VBScriptHomePage: TVBScriptHomePage;

implementation

{$R *.DFM} {*.html}

uses
  WebReq, WebCntxt, cxWebModFact, Variants,
  cxScriptDBImpl, cxWebDataUtils;

function VBScriptHomePage: TVBScriptHomePage;
begin
  Result := TVBScriptHomePage(WebContext.FindModuleClass(TVBScriptHomePage));
end;

procedure TVBScriptHomePage.cxWebPageModuleActivate(Sender: TObject);
var
  AFirstRecord: Integer;
begin
  customerTable.ConnectionString := 'FILE NAME=' + DataLinkDir + '\DBDEMOS.UDL';
  orderTable.ConnectionString := 'FILE NAME=' + DataLinkDir + '\DBDEMOS.UDL';

  customerTable.Open;
  if Request.QueryFields.IndexOfName('customerRecNo') > -1 then
  begin
    try
    AFirstRecord := StrToInt(Request.QueryFields.Values['customerRecNo']);
    except
      on EConvertError do AFirstRecord := 1
      else raise;
    end;
    if AFirstRecord > customerTable.RecordCount then
    begin
      if customerTable.RecordCount mod 5 <> 0 then
        AFirstRecord := customerTable.RecordCount - (customerTable.RecordCount mod 5)
      else AFirstRecord := customerTable.RecordCount - 5 + 1;
    end
    else if AFirstRecord < 1 then AFirstRecord := 1;
    customerTable.RecNo := AFirstRecord;
  end;

  orderTable.Open;
  if Request.QueryFields.IndexOfName('orderRecNo') > -1 then
  begin
    try
    AFirstRecord := StrToInt(Request.QueryFields.Values['orderRecNo']);
    except
      on EConvertError do AFirstRecord := 1
      else raise;
    end;
    if AFirstRecord > orderTable.RecordCount then
    begin
      if orderTable.RecordCount mod 5 <> 0 then
        AFirstRecord := orderTable.RecordCount - (orderTable.RecordCount mod 5)
      else AFirstRecord := orderTable.RecordCount - 5 + 1;
    end
    else if AFirstRecord < 1 then AFirstRecord := 1;
    orderTable.RecNo := AFirstRecord;
  end;
end;

procedure TVBScriptHomePage.cxWebPageModuleDeactivate(Sender: TObject);
begin
  customerTable.Close;
  orderTable.Close;
end;


initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebPageModuleFactory.Create(TVBScriptHomePage, TcxWebPageInfo.Create('*.html'),  caDestroy));

end.
