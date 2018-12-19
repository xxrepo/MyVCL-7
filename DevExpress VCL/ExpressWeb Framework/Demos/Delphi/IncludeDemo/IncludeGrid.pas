unit IncludeGrid;

interface

uses SysUtils, Classes, HTTPApp, cxWebModule, cxWebAppSrv, cxWebClasses,
  cxWebControls, cxWebStdCtrls, cxWebGrids, cxWebDBGrid, cxWebData,
  cxWebExtData, cxWebDataNavigator, cxWebDataCtrls, DB, ADODB;


type
  TIncludeGridPage = class(TcxWebPageModule)
    ADOTable1: TADOTable;
    cxWebDBDataNavigator1: TcxWebDBDataNavigator;
    cxWebDBDataSource1: TcxWebDBDataSource;
    cxWebDBGrid1: TcxWebDBGrid;
    cxWebDBGrid1Column1: TcxWebDBColumn;
    cxWebDBGrid1Column2: TcxWebDBColumn;
    cxWebDBGrid1Column3: TcxWebDBColumn;
    cxWebDBGrid1Column4: TcxWebDBColumn;
    cxWebDBGrid1Column5: TcxWebDBColumn;
    procedure cxWebPageModuleActivate(Sender: TObject);
    procedure cxWebPageModuleDeactivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }  
  end;

function IncludeGridPage: TIncludeGridPage;

implementation

{$R *.DFM} {*.html}

uses
  WebReq, WebCntxt, cxWebModFact, Variants, IncludeData;

function IncludeGridPage: TIncludeGridPage;
begin
  Result := TIncludeGridPage(WebContext.FindModuleClass(TIncludeGridPage));
end;

procedure TIncludeGridPage.cxWebPageModuleActivate(Sender: TObject);
begin
  ADOTable1.ConnectionString := 'FILE NAME=' + DataLinkDir + '\DBDEMOS.UDL';
  ADOTable1.Open;
end;

procedure TIncludeGridPage.cxWebPageModuleDeactivate(Sender: TObject);
begin
  ADOTable1.Close;
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebPageModuleFactory.Create(TIncludeGridPage, TcxWebPageInfo.Create('*.html'),  caDestroy));

end.
