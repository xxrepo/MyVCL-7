unit MasterDetailTableDemoMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, cxGridLevel, cxControls, cxGrid, StdCtrls, ExtCtrls, Menus,
  ImgList, ActnList, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridCustomView, ComCtrls, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxEdit, DB, cxDBData, cxClasses,
  cxDataStorage, cxDBLookupComboBox, cxBlobEdit, cxLookAndFeels;

type
  TMasterDetailTableDemoMainForm = class(TForm)
    pnlDetail: TPanel;
    lblDetail: TLabel;
    lblStyle: TLabel;
    lblMaster: TLabel;
    Bevel1: TBevel;
    GridDetail: TcxGrid;
    lvDetail: TcxGridLevel;
    tvFilms: TcxGridDBTableView;
    lvFilms: TcxGridLevel;
    Grid: TcxGrid;
    lvFilmsPersonsStaff: TcxGridLevel;
    tvFilmsCAPTION: TcxGridDBColumn;
    tvFilmsYEAR: TcxGridDBColumn;
    tvFilmsTAGLINE: TcxGridDBColumn;
    tvFilmsPLOTOUTLINE: TcxGridDBColumn;
    tvFilmsRUNTIME: TcxGridDBColumn;
    tvFilmsPHOTO: TcxGridDBColumn;
    mmMain: TMainMenu;
    miFile: TMenuItem;
    miExit: TMenuItem;
    miOptions: TMenuItem;
    miGrid4: TMenuItem;
    miAbout: TMenuItem;
    lbDescription: TLabel;
    Splitter: TSplitter;
    tvFilmsPersonsStaff: TcxGridDBTableView;
    tvFilmsPersonsStaffPERSONLINEID: TcxGridDBColumn;
    tvFilmsPersonsStaffPERSONID: TcxGridDBColumn;
    tvFilmsPersonsStaffDESCRIPTION: TcxGridDBColumn;
    StatusBar: TStatusBar;
    LookAndFeelController: TcxLookAndFeelController;
    procedure miAboutClick(Sender: TObject);
    procedure miExitClick(Sender: TObject);
    procedure miGrid4Click(Sender: TObject);
  private
    procedure SetStandardMasterDetailStyle; // Standard two grid style
    procedure SetGrid4MasterDetailStyle;    // Grid4 single grid style
  end;

var
  MasterDetailTableDemoMainForm: TMasterDetailTableDemoMainForm;

implementation

{$R *.dfm}

uses
  MasterDetailTableDemoData, cxGridDBDataDefinitions, AboutDemoForm;

procedure TMasterDetailTableDemoMainForm.miAboutClick(Sender: TObject);
begin
  ShowAboutDemoForm;
end;

procedure TMasterDetailTableDemoMainForm.miExitClick(Sender: TObject);
begin
  Close;
end;

procedure TMasterDetailTableDemoMainForm.miGrid4Click;
begin
  with Sender as TMenuItem do
    Checked := not Checked;
  if (Sender as TMenuItem).Checked then
    SetGrid4MasterDetailStyle
  else
    SetStandardMasterDetailStyle;
end;

procedure TMasterDetailTableDemoMainForm.SetGrid4MasterDetailStyle;
// Display in Grid4 single grid style
var
  AView: TcxGridDBTableView;
  AData: TcxGridDBDataController;
begin
  // remove master/detail link in the data module
  MasterDetailTableDemoMainDM.tblFilmsPersonsStaff.MasterSource := nil;

  // create view in the first grid (Grid)
  AView := TcxGridDBTableView(Grid.CreateView(TcxGridDBTableView));
  AView.Assign(lvDetail.GridView);
  AData := AView.DataController as TcxGridDBDataController;
  AData.KeyFieldNames := 'ID';
  AData.MasterKeyFieldNames := 'ID';
  AData.DetailKeyFieldNames := 'FilmID';
  AData.DataModeController.SmartRefresh := True;

  // hide the second grid (GridDetail)
  lvDetail.GridView.Free;
  pnlDetail.Visible := False;
  Splitter.Visible := False;
  // bind AView to first grid's detail level
  lvFilmsPersonsStaff.Visible := True;
  lvFilmsPersonsStaff.GridView := AView;

  lblMaster.Visible := False;
  lblStyle.Caption := 'ExpressQuantumGrid master-detail style';
end;

procedure TMasterDetailTableDemoMainForm.SetStandardMasterDetailStyle;
// Display in standard two grid style
var
  AView: TcxGridDBTableView;
  AData: TcxGridDBDataController;
begin
  // restore master/detail link in the data module
  MasterDetailTableDemoMainDM.tblFilmsPersonsStaff.MasterSource :=
    MasterDetailTableDemoMainDM.dsFilms;

  // create view in the second grid (GridDetail)
  AView := TcxGridDBTableView(GridDetail.CreateView(TcxGridDBTableView));
  AView.Assign(lvFilmsPersonsStaff.GridView);
  AData := AView.DataController as TcxGridDBDataController;
  AData.KeyFieldNames := 'ID';
  AData.MasterKeyFieldNames := '';
  AData.DetailKeyFieldNames := '';
  AData.DataModeController.SmartRefresh := False;

  // remove the detail level from the first grid (Grid)
  lvFilmsPersonsStaff.Visible := False;
  lvFilmsPersonsStaff.GridView.Free;

  // bind AView to second grid's level
  lvDetail.GridView := AView;
  pnlDetail.Visible := True;
  Splitter.Visible := True;

  lblMaster.Visible := True;
  lblStyle.Caption := 'Standard master-detail style';
end;

end.
