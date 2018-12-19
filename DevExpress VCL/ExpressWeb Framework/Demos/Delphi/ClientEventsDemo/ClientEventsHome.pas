unit ClientEventsHome;

interface

uses SysUtils, Classes, HTTPApp, cxWebModule, cxWebAppSrv, cxWebClasses,
  cxWebDataNavigator, cxWebDataCtrls, cxWebStdCtrls, cxWebControls,
  cxWebDateEdit, cxWebCalendar, cxWebGrids, cxWebDBGrid, DB, ADODB,
  cxWebData, cxWebExtData, cxWebExtCtrls, cxWebTV;
  

type
  TClientEventsHomePage = class(TcxWebPageModule)
    cxWebLabel1: TcxWebLabel;
    cxWebButton1: TcxWebButton;
    cxWebLabel2: TcxWebLabel;
    cxWebDBDataNavigator1: TcxWebDBDataNavigator;
    cxWebLabel3: TcxWebLabel;
    cxWebDBGrid1: TcxWebDBGrid;
    cxWebDBDataSource1: TcxWebDBDataSource;
    ADOTable1: TADOTable;
    cxWebDBGrid1Column1: TcxWebDBColumn;
    cxWebDBGrid1Column2: TcxWebDBColumn;
    cxWebDBGrid1Column3: TcxWebDBColumn;
    cxWebDBGrid1Column4: TcxWebDBColumn;
    cxWebDBGrid1Column5: TcxWebDBColumn;
    cxWebLabel4: TcxWebLabel;
    cxWebCalendar1: TcxWebCalendar;
    cxWebLabel5: TcxWebLabel;
    cxWebDateEdit1: TcxWebDateEdit;
    cxWebLabel6: TcxWebLabel;
    cxWebTimer1: TcxWebTimer;
    cbTimerEnable: TcxWebCheckBox;
    cxWebLabel7: TcxWebLabel;
    cbLAL: TcxWebCheckBox;
    cxWebLabel8: TcxWebLabel;
    cxWebTreeView1: TcxWebTreeView;
    procedure cbTimerEnableClick(Sender: TObject);
    procedure cbLALClick(Sender: TObject);
    procedure cxWebPageModuleActivate(Sender: TObject);
    procedure cxWebPageModuleDeactivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function ClientEventsHomePage: TClientEventsHomePage;

implementation

{$R *.DFM} {*.html}

uses
  WebReq, WebCntxt, cxWebModFact, Variants;

function ClientEventsHomePage: TClientEventsHomePage;
begin
  Result := TClientEventsHomePage(WebContext.FindModuleClass(TClientEventsHomePage));
end;

procedure TClientEventsHomePage.cbTimerEnableClick(Sender: TObject);
begin
  cxWebTimer1.Enabled := cbTimerEnable.Checked;
end;

procedure TClientEventsHomePage.cbLALClick(Sender: TObject);
begin
  cxWebDBDataSource1.LoadAllRecords := cbLAL.Checked;
end;

procedure TClientEventsHomePage.cxWebPageModuleActivate(Sender: TObject);
begin
  ADOTable1.ConnectionString := 'FILE NAME=' + DataLinkDir + '\DBDEMOS.UDL';
  ADOTable1.Open;
end;

procedure TClientEventsHomePage.cxWebPageModuleDeactivate(Sender: TObject);
begin
  ADOTable1.Close;
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebPageModuleFactory.Create(TClientEventsHomePage, TcxWebPageInfo.Create('*.html'),  caDestroy));

end.
 
