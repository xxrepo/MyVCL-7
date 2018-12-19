unit LookupHome;

interface

uses SysUtils, Classes, HTTPApp, cxWebModule, cxWebAppSrv, cxWebStdCtrls,
  cxWebDBLookup, DB, cxWebGrids, cxWebDBGrid, cxWebClasses, cxWebControls,
  cxWebData, cxWebExtData, DBTables, cxWebDataNavigator, cxWebDataCtrls,
  cxWebCalendar, cxWebDateEdit, ADODB;
  

type
  TLookupHomePage = class(TcxWebPageModule)
    dsMain: TcxWebDBDataSource;
    dsLookupList: TcxWebDBDataSource;
    cxWebDBGrid1: TcxWebDBGrid;
    cxWebDBGrid1Column1: TcxWebDBColumn;
    cxWebDBGrid1Column2: TcxWebDBColumn;
    cxWebDBGrid1Column3: TcxWebDBColumn;
    cxWebDBGrid1Column17: TcxWebDBColumn;
    cxWebDBGrid1Column18: TcxWebDBColumn;
    cxWebDBGrid1Column21: TcxWebDBColumn;
    cxWebDBLookup1: TcxWebDBLookup;
    cxWebLabel1: TcxWebLabel;
    cxWebLabel2: TcxWebLabel;
    cxWebExtDBLookup1: TcxWebExtDBLookup;
    cxWebDBDataNavigator1: TcxWebDBDataNavigator;
    cbLAL: TcxWebCheckBox;
    ADOTable1: TADOTable;
    ADOTable2: TADOTable;
    cxWebDBGrid1Column4: TcxWebDBColumn;
    procedure cbLALClick(Sender: TObject);
    procedure cxWebPageModuleActivate(Sender: TObject);
    procedure cxWebPageModuleDeactivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function LookupHomePage: TLookupHomePage;

implementation

{$R *.DFM} {*.html}

uses
  WebReq, WebCntxt, cxWebModFact, Variants;

function LookupHomePage: TLookupHomePage;
begin
  Result := TLookupHomePage(WebContext.FindModuleClass(TLookupHomePage));
end;

procedure TLookupHomePage.cbLALClick(Sender: TObject);
begin
  dsMain.LoadAllRecords := cbLAL.Checked;
end;

procedure TLookupHomePage.cxWebPageModuleActivate(Sender: TObject);
begin
  ADOTable1.ConnectionString := 'FILE NAME=' + DataLinkDir + '\DBDEMOS.UDL';
  ADOTable2.ConnectionString := 'FILE NAME=' + DataLinkDir + '\DBDEMOS.UDL';
  ADOTable1.Open;
  ADOTable2.Open;
end;

procedure TLookupHomePage.cxWebPageModuleDeactivate(Sender: TObject);
begin
  ADOTable2.Close;
  ADOTable1.Close;
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebPageModuleFactory.Create(TLookupHomePage, TcxWebPageInfo.Create('*.html'),  caDestroy));

end.
