unit MasterDetailCardDemoMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, DB,
  DBTables, cxGridLevel, cxControls, cxGridCommon, cxGridCustomView, cxGrid,
  cxGridCardView, cxGridDBCardView, StdCtrls, ExtCtrls,
  cxDBData, ComCtrls, ToolWin, Menus, cxStyles, ImgList, DBCtrls,
  cxDropDownEdit, cxLookupEdit, cxDBLookupComboBox, cxMaskEdit, cxCalendar,
  cxDBEdit, cxHyperLinkEdit, cxContainer, cxEdit, cxTextEdit, cxMemo,
  ActnList, cxCheckBox, cxCustomData, cxGraphics, cxFilter, cxData,
  cxClasses, cxNavigator, cxDBLookupEdit, cxDBNavigator, cxDataStorage,
  cxBlobEdit, cxLookAndFeels;

type
  TMasterDetailCardDemoMainForm = class(TForm)
    Grid: TcxGrid;
    lvFilms: TcxGridLevel;
    pnlDetail: TPanel;
    tvFilms: TcxGridDBTableView;
    colFilmsCaption: TcxGridDBColumn;
    colFilmsYear: TcxGridDBColumn;
    colFilmsTagline: TcxGridDBColumn;
    colFilmsPlotOutline: TcxGridDBColumn;
    colFilmsRuntime: TcxGridDBColumn;
    colFilmsPhoto: TcxGridDBColumn;
    lblMaster: TLabel;
    lblDetail: TLabel;
    lblStyle: TLabel;
    Bevel1: TBevel;
    cvFilmsPersons: TcxGridDBCardView;
    cvFilmsPersonsPersonLineID: TcxGridDBCardViewRow;
    cvFilmsPersonsBIOGRAPHY: TcxGridDBCardViewRow;
    cvFilmsPersonsBIRTHNAME: TcxGridDBCardViewRow;
    cvFilmsPersonsDATEOFBIRTH: TcxGridDBCardViewRow;
    cvFilmsPersonsFIRSTNAME: TcxGridDBCardViewRow;
    cvFilmsPersonsLOCATIONOFBIRTH: TcxGridDBCardViewRow;
    cvFilmsPersonsNICKNAME: TcxGridDBCardViewRow;
    cvFilmsPersonsSECONDNAME: TcxGridDBCardViewRow;
    cvFilmsPersonsHOMEPAGE: TcxGridDBCardViewRow;
    mmMain: TMainMenu;
    miFile: TMenuItem;
    miExit: TMenuItem;
    miOptions: TMenuItem;
    miGrid4: TMenuItem;
    miAbout: TMenuItem;
    cvFilmsPersonsName: TcxGridDBCardViewRow;
    lbDescription: TLabel;
    StatusBar: TStatusBar;
    Panel1: TPanel;
    Label1: TLabel;
    cbOccupation: TcxDBLookupComboBox;
    Label2: TLabel;
    edFirstName: TcxDBTextEdit;
    Label8: TLabel;
    edSecondName: TcxDBTextEdit;
    Label9: TLabel;
    edNickName: TcxDBTextEdit;
    Label7: TLabel;
    edHomePage: TcxDBHyperLinkEdit;
    DBNavigator1: TcxDBNavigator;
    edBirthName: TcxDBTextEdit;
    Label6: TLabel;
    edLocationOfBirth: TcxDBTextEdit;
    Label4: TLabel;
    deDateOfBirth: TcxDBDateEdit;
    Label3: TLabel;
    meBiography: TcxDBMemo;
    Label5: TLabel;
    lvFilmsPersons: TcxGridLevel;
    chbMale: TcxDBCheckBox;
    cvFilmsPersonsGender: TcxGridDBCardViewRow;
    cxEditStyleController1: TcxEditStyleController;
    LookAndFeelController: TcxLookAndFeelController;
    procedure miAboutClick(Sender: TObject);
    procedure miExitClick(Sender: TObject);
    procedure miGrid4Click(Sender: TObject);
  private
    procedure SetStandardMasterDetailStyle;
    procedure SetGrid4MasterDetailStyle;
  public
    { Public declarations }
  end;

var
  MasterDetailCardDemoMainForm: TMasterDetailCardDemoMainForm;

implementation

{$R *.dfm}

uses
  cxGridDBDataDefinitions, MasterDetailCardDemoData, AboutDemoForm;

procedure TMasterDetailCardDemoMainForm.miExitClick(Sender: TObject);
begin
  Close;
end;

procedure TMasterDetailCardDemoMainForm.miAboutClick(Sender: TObject);
begin
  ShowAboutDemoForm;
end;

procedure TMasterDetailCardDemoMainForm.miGrid4Click(Sender: TObject);
begin
  with Sender as TMenuItem do
    Checked := not Checked;
  if (Sender as TMenuItem).Checked then
    SetGrid4MasterDetailStyle
  else
    SetStandardMasterDetailStyle;
end;

procedure TMasterDetailCardDemoMainForm.SetGrid4MasterDetailStyle;
var
  AData: TcxGridDBDataController;
begin
  pnlDetail.Visible := False;
  AData := cvFilmsPersons.DataController;
  AData.DataModeController.SmartRefresh := True;
  lvFilmsPersons.Visible := True;
  MasterDetailCardDemoDataDM.qryFilmsPersons.DataSource := nil;
  with MasterDetailCardDemoDataDM.qryFilmsPersons do
  begin
    Close;
    Params.Clear;
    SQL.Delete(SQL.Count-1);
    Open;
  end;
  lblMaster.Visible := False;
  lblStyle.Caption := 'ExpressQuantumGrid master-detail style';
end;

procedure TMasterDetailCardDemoMainForm.SetStandardMasterDetailStyle;
var
  AData: TcxGridDBDataController;
begin
  lvFilmsPersons.Visible := False;
  AData := cvFilmsPersons.DataController;
  AData.DataModeController.SmartRefresh := False;
  MasterDetailCardDemoDataDM.qryFilmsPersons.DataSource :=
    MasterDetailCardDemoDataDM.dsFilms;
  with MasterDetailCardDemoDataDM.qryFilmsPersons do
  begin
    Params.CreateParam(ftAutoInc, 'ID', ptUnknown);
    SQL.Add('and FilmID = :ID');
    Open;
  end;
  pnlDetail.Visible := True;
  lblMaster.Visible := True;
  lblStyle.Caption := 'Standard master-detail style';
end;

end.
