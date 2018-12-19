unit MasterDetailHome;

interface

uses SysUtils, Classes, HTTPApp, cxWebModule, cxWebAppSrv, cxWebGrids,
  cxWebDataCtrls, cxWebClasses, cxWebControls, cxWebDataNavigator,
  cxWebData, cxWebExtData, DB, DBTables, cxWebStdCtrls, ADODB, cxWebDBGrid;
  

type
  TMasterDetailHomePage = class(TcxWebPageModule)
    dsDetail: TcxWebDBDataSource;
    cxWebDBGrid1: TcxWebDBGrid;
    cxWebDBGrid1Column1: TcxWebDBColumn;
    cxWebDBGrid1Column2: TcxWebDBColumn;
    cxWebDBGrid1Column3: TcxWebDBColumn;
    cxWebDBGrid1Column4: TcxWebDBColumn;
    dsMaster: TcxWebDBDataSource;
    cxWebDBGrid2: TcxWebDBGrid;
    cxWebDBGrid2Column1: TcxWebDBColumn;
    cxWebDBGrid2Column2: TcxWebDBColumn;
    cxWebDBGrid2Column3: TcxWebDBColumn;
    cxWebDBGrid2Column4: TcxWebDBColumn;
    cxWebDBGrid2Column5: TcxWebDBColumn;
    cxWebDBGrid1Column5: TcxWebDBColumn;
    cxWebLabel1: TcxWebLabel;
    cxWebDBDataNavigator2: TcxWebDBDataNavigator;
    cxWebLabel2: TcxWebLabel;
    cxWebDBDataNavigator1: TcxWebDBDataNavigator;
    ADOTable1: TADOTable;
    ADOQuery1: TADOQuery;
    procedure dsMasterScrolled(Sender: TObject; RowIndex: Integer);
    procedure cxWebPageModuleActivate(Sender: TObject);
    procedure cxWebPageModuleDeactivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function MasterDetailHomePage: TMasterDetailHomePage;

implementation

{$R *.DFM} {*.html}

uses
  WebReq, WebCntxt, cxWebModFact, Variants;

function MasterDetailHomePage: TMasterDetailHomePage;
begin
  Result := TMasterDetailHomePage(WebContext.FindModuleClass(TMasterDetailHomePage));
end;

procedure TMasterDetailHomePage.dsMasterScrolled(Sender: TObject;
  RowIndex: Integer);
var
  CustomerNo: Integer;
  KeyValue: Variant;
  MasterField: TcxCustomWebDataField;
begin
  MasterField := dsMaster.FieldByName('CustNo');
  KeyValue := dsMaster.Values[dsMaster.FocusedRowIndex, MasterField.Index];
  CustomerNo := KeyValue;
  ADOQuery1.Close;
  ADOQuery1.SQL.Text := Format('select * from orders where CustNo=%d', [CustomerNo]);
  ADOQuery1.Open;
  cxWebDBGrid1.PageSize := cxWebDBGrid1.RowCount;
end;

procedure TMasterDetailHomePage.cxWebPageModuleActivate(Sender: TObject);
begin
  ADOTable1.ConnectionString := 'FILE NAME=' + DataLinkDir + '\DBDEMOS.UDL';
  ADOQuery1.ConnectionString := 'FILE NAME=' + DataLinkDir + '\DBDEMOS.UDL';
  ADOTable1.Open;
  ADOQuery1.Open;
  cxWebDBGrid1.PageSize := cxWebDBGrid1.RowCount;  
end;

procedure TMasterDetailHomePage.cxWebPageModuleDeactivate(Sender: TObject);
begin
  ADOQuery1.Close;
  ADOTable1.Close;
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebPageModuleFactory.Create(TMasterDetailHomePage, TcxWebPageInfo.Create('*.html'),  caDestroy));

end.
