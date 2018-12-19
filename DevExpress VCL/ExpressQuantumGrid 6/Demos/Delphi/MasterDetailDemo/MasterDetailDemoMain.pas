unit MasterDetailDemoMain;

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
  cxClasses, cxDataStorage, cxBlobEdit, cxImage, cxLookAndFeels;

type
  TMasterDetailDemoMainForm = class(TForm)
    mmMain: TMainMenu;
    miFile: TMenuItem;
    miExit: TMenuItem;
    miOptions: TMenuItem;
    miAbout: TMenuItem;
    miSeparator1: TMenuItem;
    lbDescription: TLabel;
    StatusBar: TStatusBar;
    miTabsPosition: TMenuItem;
    miTopTabsPosition: TMenuItem;
    miLeftTabsPosition: TMenuItem;
    miShowPreviewData: TMenuItem;
    tvFilms: TcxGridDBTableView;
    lvFilms: TcxGridLevel;
    Grid: TcxGrid;
    lvPeople: TcxGridLevel;
    lvCompanies: TcxGridLevel;
    lvPhotos: TcxGridLevel;
    cvPeople: TcxGridDBCardView;
    tvCompanies: TcxGridDBTableView;
    cvPhotos: TcxGridDBCardView;
    tvFilmsID: TcxGridDBColumn;
    tvFilmsCAPTION: TcxGridDBColumn;
    tvFilmsYEAR: TcxGridDBColumn;
    tvFilmsTAGLINE: TcxGridDBColumn;
    tvFilmsPLOTOUTLINE: TcxGridDBColumn;
    tvFilmsRUNTIME: TcxGridDBColumn;
    tvFilmsCOLOR: TcxGridDBColumn;
    tvFilmsPHOTO: TcxGridDBColumn;
    tvFilmsICON: TcxGridDBColumn;
    tvFilmsWEBSITE: TcxGridDBColumn;
    cvPeopleName: TcxGridDBCardViewRow;
    cvPeoplePersonLineID: TcxGridDBCardViewRow;
    cvPeopleFIRSTNAME: TcxGridDBCardViewRow;
    cvPeopleSECONDNAME: TcxGridDBCardViewRow;
    cvPeopleNICKNAME: TcxGridDBCardViewRow;
    cvPeopleBIRTHNAME: TcxGridDBCardViewRow;
    cvPeopleDATEOFBIRTH: TcxGridDBCardViewRow;
    cvPeopleLOCATIONOFBIRTH: TcxGridDBCardViewRow;
    cvPeopleBIOGRAPHY: TcxGridDBCardViewRow;
    cvPeopleHOMEPAGE: TcxGridDBCardViewRow;
    cvPeopleID: TcxGridDBCardViewRow;
    cvPeopleFilmID: TcxGridDBCardViewRow;
    cvPeopleBIRTHCOUNTRY: TcxGridDBCardViewRow;
    cvPeopleGender: TcxGridDBCardViewRow;
    tvCompaniesName: TcxGridDBColumn;
    tvCompaniesType: TcxGridDBColumn;
    tvCompaniesCountry: TcxGridDBColumn;
    tvCompaniesWebSite: TcxGridDBColumn;
    tvCompaniesID: TcxGridDBColumn;
    tvCompaniesFILMID: TcxGridDBColumn;
    cvPhotosID: TcxGridDBCardViewRow;
    cvPhotosFILMID: TcxGridDBCardViewRow;
    cvPhotosSCREEN: TcxGridDBCardViewRow;
    cvPhotosICON: TcxGridDBCardViewRow;
    cxStyleRepository1: TcxStyleRepository;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    GridCardViewStyleSheetDevExpress: TcxGridCardViewStyleSheet;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    LookAndFeelController: TcxLookAndFeelController;
    miDetailViewsSynchronization: TMenuItem;
    procedure miAboutClick(Sender: TObject);
    procedure miExitClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure miTabsPositionClick(Sender: TObject);
    procedure miShowPreviewDataClick(Sender: TObject);
    procedure miDetailViewsSynchronizationClick(Sender: TObject);
  public
    { Public declarations }
  end;

var
  MasterDetailDemoMainForm: TMasterDetailDemoMainForm;

implementation

{$R *.dfm}

uses
  MasterDetailDemoData, AboutDemoForm;

procedure TMasterDetailDemoMainForm.FormShow(Sender: TObject);
begin
  if MasterDetailDemoDataDM.tblFilms.Active then
  begin
    MasterDetailDemoDataDM.tblFilms.First;
    if Assigned(tvFilms.Controller.FocusedRecord) then
      tvFilms.Controller.FocusedRecord.Expanded := true;
  end;
end;

procedure TMasterDetailDemoMainForm.miAboutClick(Sender: TObject);
begin
  ShowAboutDemoForm;
end;

procedure TMasterDetailDemoMainForm.miExitClick(Sender: TObject);
begin
  Close;
end;

procedure TMasterDetailDemoMainForm.miTabsPositionClick(
  Sender: TObject);
begin
  (Sender as TMenuItem).Checked := True;
  lvFilms.Options.DetailTabsPosition :=
    TcxGridDetailTabsPosition((Sender as TMenuItem).MenuIndex + 1);
end;

procedure TMasterDetailDemoMainForm.miShowPreviewDataClick(Sender: TObject);
begin
  with Sender as TMenuItem do
    Checked := not Checked;
  if not Assigned(tvFilms.Preview.Column) then
    tvFilms.Preview.Column := tvFilmsPLOTOUTLINE;
  tvFilms.Preview.Visible := (Sender as TMenuItem).Checked;
end;

procedure TMasterDetailDemoMainForm.miDetailViewsSynchronizationClick(
  Sender: TObject);
var
  I: Integer;
begin
  TMenuItem(Sender).Checked := not TMenuItem(Sender).Checked;
  for I := 0 to Grid.ViewCount - 1 do
    Grid.Views[I].Synchronization := TMenuItem(Sender).Checked;
end;

end.
